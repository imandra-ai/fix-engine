let ( let* ) = Lwt.bind

let log_box : Runtime.event Lwt_mvar.t = Lwt_mvar.create_empty ()

let model_box : Runtime.event Lwt_mvar.t = Lwt_mvar.create_empty ()

let config =
  Engine.
    {
      comp_id = "TEST_SERVER";
      target_id = "TEST_CLIENT";
      host_id = None;
      on_behalf_id = None;
      timer = 0.1;
      begin_string = "FIX.4.4";
      strict_time_precision = false;
      precision = Micro;
      no_history = false;
      ignore_business_reject = false;
      ignore_session_reject = false;
      logon_fields = [];
      heartbeat_interval = 30;
      next_expected_msg_seq_num = false;
    }

let ts_parser =
  match config.precision with
  | Milli ->
    let parse_milli x =
      match
        if config.strict_time_precision then
          Parse_datetime.parse_UTCTimestamp_milli_strict x
        else
          Parse_datetime.parse_UTCTimestamp_milli x
      with
      | None -> None
      | Some x -> Some (Datetime.convert_utctimestamp_milli_pico x)
    in
    parse_milli
  | Micro ->
    let parse_micro x =
      match
        if config.strict_time_precision then
          Parse_datetime.parse_UTCTimestamp_micro_strict x
        else
          Parse_datetime.parse_UTCTimestamp_micro x
      with
      | None -> None
      | Some x -> Some (Datetime.convert_utctimestamp_micro_pico x)
    in
    parse_micro
  | Nano ->
    let parse_nano x =
      match
        if config.strict_time_precision then
          Parse_datetime.parse_UTCTimestamp_nano_strict x
        else
          Parse_datetime.parse_UTCTimestamp_nano x
      with
      | None -> None
      | Some x -> Some (Datetime.convert_utctimestamp_nano_pico x)
    in
    parse_nano
  | Pico ->
    if config.strict_time_precision then
      Parse_datetime.parse_UTCTimestamp_pico_strict
    else
      Parse_datetime.parse_UTCTimestamp_pico

let log_thread () : unit Lwt.t =
  let rec thread () =
    let ( let*? ) x f =
      match x with
      | Some x -> f x
      | None -> thread ()
    in
    let* msg = Lwt_mvar.take log_box in
    let* msg =
      match msg with
      | Runtime.FIXMessage msg -> Lwt.return @@ Some msg
      | Runtime.Connected x ->
        let* () = Lwt_io.printlf "Client %s connected" x in
        Lwt.return None
      | Runtime.Disconnected _ ->
        let* () = Lwt_io.printlf "Client disconnected" in
        Lwt.return None
      | _ -> Lwt.return None
    in
    let*? msg = msg in
    let t =
      match msg.direction, msg.msg_type with
      | Runtime.Incoming, Runtime.Admin -> "Incoming admin"
      | Runtime.Incoming, Runtime.Application -> "Incoming application"
      | Runtime.Outgoing, Runtime.Admin -> "Outgoing admin"
      | Runtime.Outgoing, Runtime.Application -> "Outgoing application"
    in
    let msg = Fix_io.encode ~split:'|' msg.Runtime.message in
    let* () = Lwt_io.printl (t ^ ": " ^ msg) in
    thread ()
  in
  thread ()

let engine_thread () =
  let recv msg =
    let* () = Lwt_mvar.put log_box msg in
    Lwt_mvar.put model_box msg
  in
  let port, reset = 9880, true in
  Runtime.start_server ~reset ~config ~port ~recv ()

let engine_to_model_thread model_handle () =
  let rec thread () =
    let ( let*? ) x f =
      match x with
      | Some x -> f x
      | None -> thread ()
    in
    let* msg = Lwt_mvar.take model_box in
    let*? msg =
      match msg with
      | Runtime.FIXMessage msg -> Some msg
      | _ -> None
    in
    let*? msg =
      match msg.direction, msg.msg_type with
      | Incoming, Application -> Some msg
      | _ -> None
    in
    let open Full_messages in
    let msg =
      Parser_combinators.run
        (Parse_full_messages.parse_top_level_msg ts_parser)
        msg.message
    in
    let*? msg =
      match msg with
      | Ok (ValidMsg msg) -> Some msg
      | _ -> None
    in
    let*? data =
      match msg.full_msg_data with
      | Full_FIX_App_Msg data -> Some data
      | _ -> None
    in
    let* () = Model.send_fix model_handle data in
    thread ()
  in
  thread ()

let model_recv (handle : Runtime.handle) (evt : Model.event) =
  match evt with
  | FIXMessage (IncIntMsg_ApplicationData data) ->
    let msg = ("35", data.msg_tag) :: data.payload in
    let* r = Runtime.send_message handle msg in
    Lwt.return (ignore r)
  | _ -> Lwt.return_unit

let () =
  let handle, engine = engine_thread () in
  let recv = model_recv handle in
  let model_thread, model = Model.start ~recv in
  let thread =
    Lwt.join
      [ engine; log_thread (); model_thread; engine_to_model_thread model () ]
  in
  Lwt_main.run thread
