let (>>=) = Lwt.(>>=)
let (let*) = Lwt.bind 

type direction = Incoming | Outgoing
type msg_type = Application | Admin 

type event = 
  { message : (string * string) list
  ; direction : direction
  ; msg_type : msg_type
  }

type t =
  { engine_box : Engine.event Lwt_mvar.t
  ; fixio_box : Fix_io.message Lwt_mvar.t
  ; engine : Engine.t
  ; fixio : Fix_io.fix_io option
  ; recv : event -> unit Lwt.t 
  }

let get_msg_type message =
  match List.assoc_opt "35" message with 
  | None -> Application | Some k -> 
  match Parse_admin_tags.parse_admin_msg_tag k with
  | None -> Application | Some _ -> Admin 

let receive_fix_io t message =
  let msg_type = get_msg_type message in
  Lwt.join 
  [ Engine.process_fix_wire t.engine message
  ; t.recv { message ; direction = Incoming ; msg_type } 
  ]

let receive_engine t event = 
  match event, t.fixio with
  | Engine.FIXFromEngine message , Some fixio -> begin
    let msg_type = get_msg_type message in
    Lwt.join 
    [ Fix_io.send fixio message
    ; t.recv { message ; direction = Outgoing ; msg_type } 
    ]  
  end
  | _ -> Lwt.return_unit 

let rec loop (t : t) : unit Lwt.t =
  let rec loop_box box receiver =
    let* msg = Lwt_mvar.take box in
    let* () = receiver t msg in 
    loop_box box receiver
    in
  let* () = Lwt.join [ 
    loop_box t.engine_box receive_engine; 
    loop_box t.fixio_box receive_fix_io 
    ] in
  loop t
  

let connection_lock = Lwt_mutex.create ()

let with_locks f =
  Lwt_mutex.with_lock connection_lock
  @@ fun () ->
  Lwt.catch f (fun e ->
      let msg = Printexc.to_string e
      and stack = Printexc.get_backtrace () in
      let msg = Printf.sprintf "\n%s%s\n" msg stack in
      Lwt_io.printl @@ "Server thread stopped with exception: " ^ msg )
  
let handler (t : t) (in_addr: Unix.sockaddr) (inch, outch) =
  let addr_str = match in_addr with
    | ADDR_UNIX s -> s
    | ADDR_INET (h,p) -> 
      Printf.sprintf "%s:%d" (Unix.string_of_inet_addr h) p
    in
  if Lwt_mutex.is_locked connection_lock
    then
      Lwt_io.printlf
        "Incoming FIX connection from %s. Session already established. Ignoring."
        addr_str
    else
  let* () = Lwt_io.printlf "Received FIX connection from %s" addr_str in
  with_locks @@ fun () ->
  (* FIX IO loop *)
  let recv = Lwt_mvar.put t.fixio_box in
  let fixio_thread, fixio = Fix_io.start ~recv (inch, outch) in
  let t = {t with fixio = Some fixio } in
  Lwt.pick
  [ fixio_thread
  ; loop t
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
    ~(config : Engine.config)
    ~(port : int)
    ~(recv : event -> unit Lwt.t )
    ()
  =
  let reset = match reset with None -> false | Some x -> x in
  let session_dir = match session_dir with 
    | Some x -> x 
    | None -> default_session_folder ~config 
    in
  let engine_box = Lwt_mvar.create_empty () in
  let fixio_box = Lwt_mvar.create_empty () in
  let engine_thread , engine = 
    let recv = Lwt_mvar.put engine_box in
    Engine.start ~reset ~session_dir ~config ~recv 
    in
  let state =
    { fixio = None
    ; engine
    ; engine_box
    ; fixio_box
    ; recv
    } in
  let addr = Unix.(ADDR_INET (inet_addr_loopback, port)) in
  let server_thread = 
    let handler = handler state in 
    let _server = Lwt_io.establish_server_with_client_address addr handler in
    let* () = Lwt_io.printlf "FIX Server established on localhost:%d" port in
    Lwt.return_unit
    in
  Lwt.join
    [ engine_thread
    ; server_thread
    ]
  