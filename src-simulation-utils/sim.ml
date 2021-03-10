module Make(IO:M.IO) = struct

  open IO

  module Session_manager = struct

    open IO.M

    type t =
      { dir : string
      ; seqin  : Caml.Int.t
      ; seqout : Caml.Int.t
      }

    let read_int file =
      try
        open_in file >>= fun chn ->
        input_line chn >>= fun num ->
        close_in chn >>= fun () ->
        return (int_of_string num)
      with _exn ->
        return 0

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
      let () = prepare_folder dir  in
      read_seqns dir >>= fun state ->
      if reset then
        return { state with seqin = 0; seqout = 0 }
      else
        return state

    let get state = (state.seqin, state.seqout)

  end

  module Fix_IO = struct

    open IO.M

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

    open M.IO

    let timechange () =
      (** Timechange poster  *)
      let time = Time_defaults_current_time.get_current_utctimestamp () in
      Fix_engine_state.IncIntMsg_TimeChange time

    let rec while_busy_loop ~fix_io_send ~model_send engine_state  =
      let engine_state = Fix_engine.one_step engine_state in
      (* This assumes that after one_step we can get either ontgoing internal or outgoing FIX message *)
      begin match ( engine_state.outgoing_fix_msg , engine_state.outgoing_int_msg) with
        | Some msg, None ->
          let wire = Encode_full_messages.packet_full_valid_msg msg in
          fix_io_send wire
        | None, Some msg ->
          model_send msg
        | None, None -> return ()
        |  _ -> failwith "Critical internal error in fix_engine model"
      end >>= fun () ->
      let engine_state = { engine_state with outgoing_fix_msg = None ; outgoing_int_msg = None } in
      if Fix_engine_state.engine_state_busy engine_state then
        while_busy_loop t engine_state
      else
        return engine_state

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
      ; fe_max_num_logons_sent = 10
      ; fe_application_up = true
      ; incoming_seq_num = inseq
      ; outgoing_seq_num = outseq
      }

  end

end

module Blocking = Make(M.Blocking_IO)
