module Make(IO:M.IO) = struct
  module IO = IO

  open IO

  module Session_manager = struct

    open IO.M

    type t =
      { dir : string
      ; seqin  : int
      ; seqout : int
      }

    let read_int file =
      try
        open_in file >>= fun chn ->
        input_line chn >>= fun num ->
        close_in chn >>= fun () ->
        return (int_of_string num |> Z.of_int)
      with _exn ->
        return Z.zero

    let read_seqns dir =
      read_int Filename.(concat dir "seqin" ) >>= fun seqin ->
      read_int Filename.(concat dir "seqout") >>= fun seqout ->
      return { dir; seqin; seqout }

    (* todo *)
    let prepare_folder dir =
      if not(Caml_sys.file_exists dir) then
        Caml_unix.(mkdir dir 0o775)
      else ()

    let write_int dir fname num =
      let filename = Filename.(concat dir fname) in
      open_out filename >>= fun fch ->
      write_str fch (String.of_int num) >>= fun () ->
      close_out fch

    let save state (seqin, seqout) =
      write_int state.dir "seqin"  seqin >>= fun () ->
      write_int state.dir "seqout" seqout

    let create ~reset ~dir =
      let () = prepare_folder dir in
      read_seqns dir >>= fun state ->
      if reset then
        return { state with seqin = Z.zero; seqout = Z.zero }
      else
        return state

    let get state = (state.seqin, state.seqout)

  end

  module Fix_IO = struct

    open IO.M

    type message = (string * string) list

    (* Converts [ '5'; '2'; '='; 'A' ] to ("52" , "A" ) *)
    let extract_key_value (chlist : char list) : string * string =
      let buf = Buffer.create @@ Caml.List.length chlist in
      let () = chlist |> Caml.List.iter @@ Buffer.add_char buf in
      Buffer.contents buf
      |> Caml.String.split_on_char '='
      |> ( function
          | [] -> ("","")
          | h::tl -> (h, String.concat "=" tl)
        )

    let encode ~split msg =
      let split = Caml.String.make 1 split in
      msg
      |> List.map ( fun(k,v) -> k^"="^v )
      |> List.fold_left ( fun a s -> a ^ s ^ split ) ""

    let default_split = '\001'

    let rec get_key_value ~split ~inch chars =
      input_char inch >>= fun c ->
      if c <> split then
        get_key_value ~split ~inch (c::chars)
      else
        return @@ extract_key_value @@ List.rev chars

    let rec get_message ?(split=default_split) ~inch msg =
      get_key_value ~split ~inch [] >>= fun (k,v) ->
      let msg = (k,v)::msg in
      if k <> "10" then
        get_message ~split ~inch msg
      else
        return @@ List.rev msg

    let write ?(split=default_split) ~outch msg =
      let wire = encode ~split msg in
      write_str outch wire

  end

  module Model = struct

    open IO.M

    type incoming_event =
      | FIX_message of Fix_engine_state.fix_engine_int_out_msg
      | Action of Actions.fix_action

    let handle_ev ~zmq_pub model_state ev =
      begin match ev with
        | FIX_message (OutIntMsg_ApplicationData data) ->
          let model_message = Type_converter.convert_full_to_model_fix data in
          let model_state = State_utils.set_incoming model_state model_message in
          begin match model_message with
            | FIX_TL_Normal msg -> zmq_pub msg ~sending:false
            | _ ->
              (* println "[Model error] Incoming message conversion failure"; *)
              return ()
          end >>= fun () ->
          return @@ Venue.one_step model_state

        | FIX_message (OutIntMsg_ResendApplicationData data) ->
          let model_message = Type_converter.convert_full_to_model_fix data in
          let model_message = Message_utils.get_resend_message model_message in
          let model_state = State_utils.set_incoming model_state model_message in
          return @@ Venue.one_step model_state

        | FIX_message _ ->
          return model_state

        | Action act ->
          if Act_checks.is_action_valid act model_state then (
            let model_state = {model_state with State.incoming_action = Some act }  in
            return @@ Venue.one_step model_state
          ) else (
            (* println "[Model]: Error - received an invalid action"; *)
            return model_state
          )
      end
  end

  module Engine = struct

    open IO.M

    let timechange () =
      (** Timechange poster  *)
      let time = Time_defaults_current_time.get_current_utctimestamp () in
      Fix_engine_state.IncIntMsg_TimeChange time

    let rec while_busy_loop ~fix_io_send ~handle_msg (model_state, engine_state) =
      let engine_state = Fix_engine.one_step engine_state in
      (* This assumes that after one_step we can get either ontgoing internal or outgoing FIX message *)
      begin match ( engine_state.outgoing_fix_msg , engine_state.outgoing_int_msg) with
        | Some (ValidMsg msg), None ->
          let wire = Encode_full_messages.packet_full_valid_msg msg in
          fix_io_send wire >>= fun () ->
          return model_state
        | None, Some msg ->
          handle_msg model_state msg
        | None, None -> return model_state
        |  _ -> failwith "Critical internal error in fix_engine model"
      end >>= fun model_state ->
      let engine_state = { engine_state with outgoing_fix_msg = None ; outgoing_int_msg = None } in
      if Fix_engine_state.engine_state_busy engine_state then
        while_busy_loop ~fix_io_send ~handle_msg (model_state, engine_state)
      else
        return (model_state, engine_state)

    type config =
      { comp_id        : string
      ; host_id        : string option
      ; on_behalf_id   : string option
      ; target_id      : string
      }

    let make_engine_state (inseq, outseq) config =
      let open Fix_engine_state in
      { init_fix_engine_state with
        fe_comp_id = config.comp_id
      ; fe_sender_location_id = config.host_id
      ; fe_on_behalf_of_comp_id = config.on_behalf_id
      ; fe_target_comp_id = config.target_id
      ; fe_curr_time = Time_defaults_current_time.get_current_utctimestamp ()
      ; fe_max_num_logons_sent = Z.of_int 10
      ; fe_application_up = true
      ; incoming_seq_num = inseq
      ; outgoing_seq_num = outseq
      }

  end

end

module Blocking = Make(M.Blocking_IO)

module Client = struct
  open Blocking
  open IO
  open IO.M

  type client_config =
    { fixhost      : string
    ; fixport      : Caml.Int.t
    ; zmqpub       : string
    ; zmqrep       : string
    ; comp_id      : string
    ; host_id      : string option
    ; on_behalf_id : string option
    ; target_id    : string
    }

  let make_client_config fixhost fixport zmqpub zmqrep comp_id host_id target_id =
    { fixhost
    ; fixport
    ; zmqpub
    ; zmqrep
    ; comp_id
    ; host_id      = Some host_id
    ; on_behalf_id = None
    ; target_id
    }

  let make_engine_config client_config =
    let { comp_id ; host_id ; target_id ; on_behalf_id ; _ } = client_config in
    let open Engine in
    { comp_id
    ; host_id
    ; on_behalf_id
    ; target_id
    }

  let init_socket addr port =
    let inet_addr = (Unix.gethostbyname addr).Unix.h_addr_list.(Z.of_int 0) in
    let sockaddr = Unix.ADDR_INET (inet_addr, port) in
    let sock = Unix.socket Unix.PF_INET Unix.SOCK_STREAM 0 in
    Unix.connect sock sockaddr;
    let outchan = Unix.out_channel_of_descr sock in
    let inchan = Unix.in_channel_of_descr sock in
    (inchan, outchan)

  let banner client_config () =
    [ "(*********                   FIX Engine Client                           *********)"
    ; "(*********  (c)Copyright Aesthetic Integration Limited., 2014 - 2020     *********)\n"
    ; Printf.sprintf " - FIX client connecting to %s:%d" client_config.fixhost client_config.fixport
    ; Printf.sprintf " - FIX session %s -> %s" client_config.comp_id client_config.target_id
    ; Printf.sprintf " - Internal messages are published on ZMQ socket %s" client_config.zmqpub
    ; Printf.sprintf " - Model actions are received on ZMQ socket %s" client_config.zmqrep
    ; "\n(*********************************************************************************)\n"
    ] |> String.concat "\n" |> print_endline

  let session_folder config =
    let open Engine in
    let hostid = match config.host_id with None -> "NoHostid" | Some host_id -> host_id in
    Printf.sprintf "%s.%s.%s.session" config.comp_id config.target_id hostid

  exception Exit

  let try_zmq_read zmqrepsocket =
    let rec loop () =
      let open Zmq in
      let module J = Yojson.Basic in
      let module D = Decoders_yojson.Basic.Decode in
      match Socket.recv ~block:false zmqrepsocket with
      | exception Unix.Unix_error (Unix.EAGAIN, _, _) ->
        None
      | "STATUS" ->
        Socket.send zmqrepsocket "UP";
        loop ()
      | "LOGOUT" ->
        Socket.send zmqrepsocket "ACKED";
        raise Exit
      | msg ->
        let json = J.from_string msg in
        match D.decode_value Json_to_action.fix_action_decoder json with
        | Error _ ->
          Socket.send zmqrepsocket "REJECTED";
          None
        | Ok action ->
          Socket.send zmqrepsocket "ACKED";
          Some action
    in
    loop ()

  let last_received_utctimestamp = ref (Time_defaults_current_time.get_current_utctimestamp ())
  let get_last_received_utctimestamp () = ! last_received_utctimestamp

  let last_received_sendingtime = ref (Time_defaults_current_time.get_current_utctimestamp ())
  let get_last_received_sendingtime () = ! last_received_sendingtime

  let update_times msg =
    match msg with
    | Full_messages.ValidMsg msg -> begin
        last_received_sendingtime := msg.full_msg_header.h_sending_time;
        last_received_utctimestamp := Time_defaults_current_time.get_current_utctimestamp ();
      end
    | _ -> ()

  let zmq_publish socket msg ~sending =
    let msg = Model_messages_json.json_of_model_msg msg in
    let rtime = get_last_received_utctimestamp () in
    let ztime = Time_defaults_current_time.get_current_utctimestamp () in
    let stime = get_last_received_sendingtime () in
    let rtime = rtime |> Time_defaults_json.utctimestamp_to_json in
    let ztime = ztime |> Time_defaults_json.utctimestamp_to_json in
    let stime = stime |> Time_defaults_json.utctimestamp_to_json in
    let tpair = if sending then ( "sent_fix" , ztime ) else ( "received_fix" , rtime ) in
    let msg = match msg with
      | `Assoc pairs -> `Assoc ( tpair :: ( "sent_zmq" , ztime ) :: ( "SendingTime" , stime ) :: pairs )
      | other -> other
    in
    let msg = Yojson.Basic.to_string msg in
    return @@ Zmq.Socket.send socket msg

  module SQ = struct
    type 'a t = {
      q: 'a Queue.t;
      mutex: Mutex.t;
    }

    let make () : _ t =
      { q=Queue.create(); mutex=Mutex.create(); }

    let with_lock mutex f =
      Mutex.lock mutex;
      CCFun.finally ~h:(fun () -> Mutex.unlock mutex) ~f

    let push q x : unit =
      with_lock q.mutex (fun () -> Queue.push x q.q;)

    let try_take q : _ option =
      if Mutex.try_lock q.mutex then (
        if Queue.is_empty q.q then (
          Mutex.unlock q.mutex;
          None
        ) else (
          let x = Queue.pop q.q in
          Mutex.unlock q.mutex;
          Some x
        )
      ) else None

  end

  type state =
    { sessn  : Session_manager.t
    ; zmqrepsocket : [`Rep] Zmq.Socket.t
    ; zmqpubsocket : [`Pub] Zmq.Socket.t
    ; inch : in_channel
    ; outch : out_channel
    ; logdir : string
    ; model_state : State.model_state
    ; engine_state : Fix_engine_state.fix_engine_state
    ; sq : Fix_IO.message SQ.t
    }

  let fix_read_thread state =
    Thread.create (fun () ->
        let rec loop () =
          Fix_IO.get_message ~inch:state.inch [] >>= fun msg ->
          SQ.push state.sq msg;
          loop ()
        in
        loop ()
      )

  let loop state () =
    let zmq_pub = zmq_publish state.zmqpubsocket in
    let handle_msg model_state msg =
      Model.(handle_ev ~zmq_pub model_state (FIX_message msg))
    in
    let handle_act model_state act =
      Model.(handle_ev ~zmq_pub model_state (Action act))
    in
    let rec loop state () =
      match try_zmq_read state.zmqrepsocket with
      | Some act ->
        handle_act state.model_state act >>= fun model_state ->
        loop { state with model_state } ()
      | None ->
        match SQ.try_take state.sq with
        | Some msg ->

          let msg = Parse_full_messages.parse_top_level_msg msg in
          let () = update_times msg in

          let fix_io_send = Fix_IO.write ~outch:state.outch in
          let engine_handle = Engine.while_busy_loop ~fix_io_send ~handle_msg in

          let engine_state = { state.engine_state with incoming_fix_msg = Some msg } in
          engine_handle (state.model_state, engine_state) >>= fun (model_state, engine_state) ->

          (* do timechange TODO: factor *)
          let msg = Engine.timechange () in

          let engine_state = {engine_state with incoming_int_msg = Some msg } in
          engine_handle (model_state, engine_state) >>= fun (model_state, engine_state) ->

          let state = { state with model_state; engine_state } in
          loop state ()
        | None ->
          (try Thread.delay 0.001 with Unix.Unix_error (Unix.EINTR,_,_)->());
          (* TODO: timechange heartbeat *)
          loop state ()
    in
    loop state ()

  let run config (zmqrepsocket, zmqpubsocket) (inch, outch) =
    let dir = session_folder config in
    let init = Fix_engine_state.(IncIntMsg_CreateSession {dest_comp_id=config.target_id ; reset_seq_num=false} ) in
    let model_state = State.init_model_state in
    let sq = SQ.make () in
    Session_manager.create ~reset:false ~dir >>= fun sessn ->
    let seqns = Session_manager.get sessn in
    let engine_state = Engine.make_engine_state seqns config in
    let state = { sessn; zmqrepsocket; zmqpubsocket; inch; outch; logdir = dir; model_state; sq; engine_state } in
    let _thread = fix_read_thread state in
    loop state ()

  let run_client client_config =
    (* Bringing up a ZMQ sockets *)
    let zmqcontext = Zmq.Context.create () in

    let zmqpubsocket = Zmq.Socket.(create zmqcontext pub) in
    let () = Zmq.Socket.bind zmqpubsocket client_config.zmqpub in

    let zmqrepsocket = Zmq.Socket.(create zmqcontext rep) in
    let () = Zmq.Socket.bind zmqrepsocket client_config.zmqrep in

    (* Connect to fix engine *)
    let chans = init_socket client_config.fixhost client_config.fixport in

    let config = make_engine_config client_config in

    let () = banner client_config () in

    try run config (zmqrepsocket, zmqpubsocket) chans with Exit ->
      return ()

end
