let (>>=) = Lwt.(>>=)

type state =
  { engine_box : Engine.event Lwt_mvar.t
  ; fixio_box : Fix_io.message Lwt_mvar.t
  ; engine : Engine.t
  ; fixio : Fix_io.fix_io option
  ; begin_string : string
  ; timestamp_parse : string -> Datetime.fix_utctimestamp_micro option
  ; timestamp_encode: Datetime.fix_utctimestamp_micro -> string
  }

let log_fix_message pre msg =
  let log = Fix_io.encode ~split:'|' msg in
  Lwt_io.printlf "[%s]: %s" pre log

let fixio_to_engine parse_timestamp engine msg =
  log_fix_message "In " msg
  >>= fun () ->
  let msg = Parse_full_messages.parse_top_level_msg parse_timestamp msg in
  Engine.send_fix engine msg >>= fun () -> Engine.send_getstate engine

let engine_to_fixio cfg fixio msg =
  let wire = Encode_full_messages.packet_full_valid_msg cfg msg in
  log_fix_message "Out" wire >>= fun () -> Fix_io.send fixio wire

let receive_engine (state:state) x = 
  let engine_to_fixio =
    engine_to_fixio Encode_full_messages.{ 
      begin_string = state.begin_string ;
      encode_UTCTimestamp = state.timestamp_encode
    } in
  match x with
  | Engine.FIXMessage (Full_messages.ValidMsg msg) -> (
    match state.fixio with 
    | Some fixio -> engine_to_fixio fixio msg
    | None -> Lwt.return_unit 
    )
| Engine.OutFIXData (_, msg) ->
    Model.send_fix t.model (OutIntMsg_ApplicationData msg)
| _ ->
    Lwt.return_unit 


let rec loop (state : state) =
  Lwt.pick
  [(* Lwt_mvar.take state.engine_box >>= *)
  ]


let handler (state : state) (_in_addr: Unix.sockaddr) (inch, outch) =
  (* FIX IO loop *)
  let recv = Lwt_mvar.put state.fixio_box in
  let fixio_thread, fixio = Fix_io.start ~recv (inch, outch) in
  let state = {state with fixio = Some fixio } in
  Lwt.pick
  [ fixio_thread
  ; loop state
  ]


let get_timestamp_codec ms =
  let parse_milli x =
    match Parse_datetime.parse_UTCTimestamp_milli x with None -> None
    | Some x -> Some ( Datetime.convert_utctimestamp_milli_micro x)
    in
  let encode_milli x = x
    |> Datetime.convert_utctimestamp_micro_milli 
    |> Encode_datetime.encode_UTCTimestamp_milli
    in
  let ms = match ms with None -> false | Some x -> x in
  if ms then ( parse_milli , encode_milli ) 
  else ( Parse_datetime.parse_UTCTimestamp_micro, Encode_datetime.encode_UTCTimestamp_micro)

let default_session_folder ~(config:Engine.config) =
  let hostid =
    match config.host_id with None -> "NoHostid" | Some host_id -> host_id
  in
  Printf.sprintf "%s.%s.%s.session" config.comp_id config.target_id hostid

let start
    ?(session_dir : string option)
    ?(reset : bool option)
    ?(begin_string: string option)
    ?(millisecond_precision: bool option)
    ~(config : Engine.config)
    ~(port : int)
    ()
  =
  let reset = match reset with None -> false | Some x -> x in
  let begin_string = match begin_string with None -> "FIX.4.2" | Some x -> x in
  let session_dir = match session_dir with 
    | Some x -> x 
    | None -> default_session_folder ~config 
    in
  let timestamp_parse, timestamp_encode = get_timestamp_codec millisecond_precision in
  let engine_box = Lwt_mvar.create_empty () in
  let fixio_box = Lwt_mvar.create_empty () in
  let engine_thread , engine = Engine.start ~reset ~session_dir ~config in
  let state =
    { fixio = None
    ; engine
    ; engine_box
    ; fixio_box
    ; begin_string
    ; parse_timestamp
    } in
  let addr = Unix.(ADDR_INET (inet_addr_loopback, port)) in
  let server_thread = 
    let handler = handler state in 
    let _server = Lwt_io.establish_server_with_client_address addr handler in
    Lwt.return_unit
    in
  Lwt.join
    [ engine_thread
    ; server_thread
    ]
  