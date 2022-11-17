module SessionManager = struct
  let ( let* ) = Lwt.( >>= )

  type t = {
    dir: string;
    seqin: int;
    seqout: int;
  }

  module Seqnum = struct
    let fname_of_ty ~dir = function
      | `In -> Filename.concat dir "seqin"
      | `Out -> Filename.concat dir "seqout"

    let read ~dir ty =
      let fname = fname_of_ty ~dir ty in
      try
        let chn = open_in fname in
        let num = input_line chn in
        let () = close_in chn in
        num |> int_of_string
      with _exn -> 0

    let write ~dir ty i =
      let fname = fname_of_ty ~dir ty in
      let chn = open_out fname in
      let () = output_string chn (string_of_int i) in
      let () = close_out chn in
      ()

    let delete ~dir ty =
      let fname = fname_of_ty ~dir ty in
      try Unix.unlink fname with Unix.(Unix_error (ENOENT, _, _)) -> ()
  end

  let read_persisted_seqns_if_present dir =
    { dir; seqin = Seqnum.read ~dir `In; seqout = Seqnum.read ~dir `Out }

  let prepare_folder dir =
    if not (Sys.file_exists dir) then
      Unix.(mkdir dir 0o775)
    else
      ()

  let cleanup_persisted_seqns dir =
    let () = Seqnum.delete ~dir `In in
    let () = Seqnum.delete ~dir `Out in
    ()

  let create ~reset ~dir =
    let () = prepare_folder dir in
    let state =
      (* normally we want to start from zero, but fix-engine may have been
         directed by the other side to do a reset. in this situation we write
         the seqnums as fix-engine shuts down, read the new values from the
         session folder, then cleanup the seqnum files for next time around. *)
      let st = read_persisted_seqns_if_present dir in
      let () = cleanup_persisted_seqns dir in
      st
    in
    let state =
      if reset then
        { state with seqin = 0; seqout = 0 }
      else
        state
    in
    state

  let get state = state.seqin, state.seqout

  let write_persisted_seqns state =
    let dir = state.dir in
    let () = Seqnum.write ~dir `In state.seqin in
    let () = Seqnum.write ~dir `Out state.seqout in
    ()
end

module Internal : sig
  type t

  type message = (string * string) list

  type err = [ `MissingMessageTypeTag ]

  type event =
    | Log of string
    | FIXFromEngine of message
    | State of Fix_engine_state.fix_engine_state

  type config = {
    comp_id: string;
    target_id: string;
    host_id: string option;
    on_behalf_id: string option;
    logon_fields: (string * string) list;
    next_expected_msg_seq_num: bool;
    timer: float;
    ignore_session_reject: bool;
    ignore_business_reject: bool;
    millisecond_precision: bool;
    begin_string: string;
    no_history: bool;
  }
  [@@deriving show { with_path = false }]

  val start :
    reset:bool ->
    session_dir:string ->
    config:config ->
    recv:(event -> unit Lwt.t) ->
    unit Lwt.t * t

  val process_fix_wire : t -> message -> unit Lwt.t

  val send_fix_message : t -> message -> (unit, err) Lwt_result.t

  val send_internal_message :
    t -> Fix_engine_state.fix_engine_int_inc_msg -> unit Lwt.t

  val send_get_state : t -> unit Lwt.t

  val persist_final_seqnums : t -> Z.t option * Z.t option -> unit

  val terminate : t -> unit Lwt.t
end = struct
  let ( let* ) = Lwt.bind

  type message = (string * string) list

  type err = [ `MissingMessageTypeTag ]

  type action =
    | InternalToEngine of Fix_engine_state.fix_engine_int_inc_msg
    | FIXToEngine of Full_messages.full_top_level_msg
    | IncrementInSeq
    | GetState
    | Terminate

  type event =
    | Log of string
    | FIXFromEngine of message
    | State of Fix_engine_state.fix_engine_state

  type config = {
    comp_id: string;
    target_id: string;
    host_id: string option;
    on_behalf_id: string option;
    logon_fields: (string * string) list;
    next_expected_msg_seq_num: bool;
    timer: float;
    ignore_session_reject: bool;
    ignore_business_reject: bool;
    millisecond_precision: bool;
    begin_string: string;
    no_history: bool;
  }
  [@@deriving show { with_path = false }]

  type t = {
    recv: event -> unit Lwt.t;
    ignore_sessrejects: bool;
    ignore_buisrejects: bool;
    to_engine_box: action Lwt_mvar.t;
    timer: float;
    sess: SessionManager.t;
    begin_string: string;
    should_clean_history: bool;
    timestamp_parse: string -> Datetime.fix_utctimestamp_micro option;
    timestamp_encode: Datetime.fix_utctimestamp_micro -> string;
  }

  (** Calls Fix_engine.one_step and pubs outgoing messages while busy *)
  let rec while_busy_loop (t : t) engine_state =
    let cfg =
      Encode_full_messages.
        {
          begin_string = t.begin_string;
          encode_UTCTimestamp = t.timestamp_encode;
        }
    in
    let engine_state = Fix_engine.one_step engine_state in
    (* This assumes that after one_step we can get either ontgoing internal or outgoing FIX message *)
    let* () =
      match engine_state.outgoing_fix_msg, engine_state.outgoing_int_msg with
      | Some msg, None ->
        (match msg with
        | Full_messages.ValidMsg msg ->
          let msg = Encode_full_messages.packet_full_valid_msg cfg msg in
          t.recv (FIXFromEngine msg)
        | _ -> Lwt.return_unit)
      | None, Some _ | None, None -> Lwt.return_unit
      | _ -> Lwt.fail_with "Critical internal error in fix_engine model"
    in
    let engine_state =
      { engine_state with outgoing_fix_msg = None; outgoing_int_msg = None }
    in
    if Fix_engine_state.engine_state_busy engine_state then
      while_busy_loop t engine_state
    else
      Lwt.return engine_state

  let rec main_loop t engine_state =
    let open Fix_engine_state in
    let* msg = Lwt_mvar.take t.to_engine_box in
    let* engine_state =
      match msg with
      | InternalToEngine msg ->
        let engine_state = { engine_state with incoming_int_msg = Some msg } in
        while_busy_loop t engine_state
      | FIXToEngine msg ->
        let engine_state = { engine_state with incoming_fix_msg = Some msg } in
        while_busy_loop t engine_state
      | GetState ->
        let* () = t.recv (State engine_state) in
        Lwt.return engine_state
      | IncrementInSeq ->
        let engine_state =
          {
            engine_state with
            incoming_seq_num = Z.(engine_state.incoming_seq_num + one);
          }
        in
        Lwt.return engine_state
      | Terminate -> Lwt.return engine_state
    in
    let engine_state =
      if t.should_clean_history then
        { engine_state with fe_history = [] }
      else
        engine_state
    in
    if msg = Terminate then
      Lwt.return_unit
    else
      main_loop t engine_state

  let do_timechange t =
    let time = Current_time.get_current_utctimestamp_micro () in
    let timechange = Fix_engine_state.IncIntMsg_TimeChange time in
    let timechange = InternalToEngine timechange in
    Lwt_mvar.put t.to_engine_box timechange

  let rec heartbeat_thread t =
    let* () = Lwt_unix.sleep t.timer in
    let* () = do_timechange t in
    heartbeat_thread t

  let get_timestamp_codec ms =
    let parse_milli x =
      match Parse_datetime.parse_UTCTimestamp_milli x with
      | None -> None
      | Some x -> Some (Datetime.convert_utctimestamp_milli_micro x)
    in
    let encode_milli x =
      x |> Datetime.convert_utctimestamp_micro_milli
      |> Encode_datetime.encode_UTCTimestamp_milli
    in
    if ms then
      parse_milli, encode_milli
    else
      ( Parse_datetime.parse_UTCTimestamp_micro,
        Encode_datetime.encode_UTCTimestamp_micro )

  let make_engine_state (inseq, outseq) config =
    let open Fix_engine_state in
    {
      init_fix_engine_state with
      fe_comp_id = config.comp_id;
      fe_sender_location_id = config.host_id;
      fe_on_behalf_of_comp_id = config.on_behalf_id;
      fe_target_comp_id = config.target_id;
      fe_curr_time = Current_time.get_current_utctimestamp_micro ();
      fe_max_num_logons_sent = Z.of_int 10;
      fe_application_up = true;
      incoming_seq_num = Z.of_int inseq;
      outgoing_seq_num = Z.of_int outseq;
      logon_extra_fields = config.logon_fields;
      fe_next_expected_msg_seq_num =
        (if config.next_expected_msg_seq_num then
          Some (Z.of_int (inseq + 1))
        else
          None);
    }

  let start ~reset ~session_dir ~(config : config) ~recv =
    let timestamp_parse, timestamp_encode =
      get_timestamp_codec config.millisecond_precision
    in
    let sess = SessionManager.create ~reset ~dir:session_dir in
    let inseq, outsec = SessionManager.get sess in
    let engine_state = make_engine_state (inseq, outsec) config in
    let state : t =
      {
        to_engine_box = Lwt_mvar.create_empty ();
        timer = config.timer;
        ignore_sessrejects = config.ignore_session_reject;
        ignore_buisrejects = config.ignore_business_reject;
        sess;
        recv;
        begin_string = config.begin_string;
        timestamp_parse;
        timestamp_encode;
        should_clean_history = config.no_history;
      }
    in
    let thread =
      Lwt.pick [ heartbeat_thread state; main_loop state engine_state ]
    in
    thread, state

  let create_internal_message (msg : message) :
      (Fix_engine_state.fix_engine_int_inc_msg, err) result =
    let keep_field (k, _) =
      match Parse_admin_tags.parse_admin_field_tag k with
      | None -> true
      | Some Full_Field_RefSeqNum_Tag -> true
      | Some Full_Field_Text_Tag -> true
      | Some Full_Field_RefTagID_Tag -> true
      | Some Full_Field_RefMsgType_Tag -> true
      | Some Full_Field_SessionRejectReason_Tag -> true
      | Some Full_Field_BusinessRejectReason_Tag -> true
      | Some Full_Field_TestReqID_Tag -> true
      | _ -> false
    in
    let is_msgtype_tag (k, _) =
      match Parse_admin_tags.parse_admin_field_tag k with
      | Some Full_Field_MsgType_Tag -> true
      | _ -> false
    in
    match List.find_opt is_msgtype_tag msg with
    | None -> Error `MissingMessageTypeTag
    | Some (_, msg_tag) ->
      let payload = List.filter keep_field msg in
      let app_data = Full_messages.{ msg_tag; payload } in
      let int_msg = Fix_engine_state.IncIntMsg_ApplicationData app_data in
      Ok int_msg

  let process_fix_wire state msg_kvs =
    let msg =
      match
        Parser_combinators.run
          (Parse_full_messages.parse_top_level_msg state.timestamp_parse)
          msg_kvs
      with
      | Ok msg -> msg
      | Error _err ->
        (* the toplevel parser is supposed to catch everything *)
        assert false
    in
    let* () = do_timechange state in
    let msg_log = Fix_io.encode ~split:'|' msg_kvs in
    let* ignore =
      match msg with
      | Garbled ->
        let* () = state.recv @@ Log ("Received Garbled message: " ^ msg_log) in
        Lwt.return_false
      | BusinessRejectedMsg _ ->
        if not state.ignore_buisrejects then
          Lwt.return_false
        else
          let* () =
            state.recv
            @@ Log ("Ignoring received BusinessRejectedMsg message: " ^ msg_log)
          in
          Lwt.return_true
      | SessionRejectedMsg _ ->
        if not state.ignore_sessrejects then
          Lwt.return_false
        else
          let* () =
            state.recv
            @@ Log ("Ignoring received SessionRejectedMsg message: " ^ msg_log)
          in
          Lwt.return_true
      | ValidMsg _ -> Lwt.return_false
    in
    if ignore then
      Lwt_mvar.put state.to_engine_box IncrementInSeq
    else (
      let action = FIXToEngine msg in
      Lwt_mvar.put state.to_engine_box action
    )

  let send_fix_message state msg =
    let ( let*? ) = Lwt_result.bind in
    let*? int_msg = create_internal_message msg |> Lwt.return in
    let action = InternalToEngine int_msg in
    let*? () = do_timechange state |> Lwt_result.ok in
    Lwt_mvar.put state.to_engine_box action |> Lwt_result.ok

  let send_internal_message state int_msg =
    let action = InternalToEngine int_msg in
    Lwt_mvar.put state.to_engine_box action

  let send_get_state state = Lwt_mvar.put state.to_engine_box GetState

  let persist_final_seqnums state (inseq, outseq) =
    let sess =
      SessionManager.
        {
          dir = state.sess.dir;
          seqin =
            (match inseq with
            | None -> 0
            | Some x -> Z.to_int x);
          seqout =
            (match outseq with
            | None -> 0
            | Some x -> Z.to_int x);
        }
    in
    SessionManager.write_persisted_seqns sess

  let terminate state = Lwt_mvar.put state.to_engine_box Terminate
end

include Internal
