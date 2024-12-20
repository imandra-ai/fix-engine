let ( let* ) = Lwt.bind

let ( let+ ) = Lwt.( >|= )

type direction =
  | Incoming
  | Outgoing
[@@deriving show]

type msg_type =
  | Application
  | Admin
[@@deriving show]

type message = {
  message: (string * string) list;
  direction: direction;
  msg_type: msg_type;
}
[@@deriving show]

type sequence_numbers = {
  next_out: int;
  next_in: int;
}
[@@deriving show]

type transition_message = Fix_engine_state.transition_message

let show_transition_message =
  Fix_engine_json.fix_engine_transition_message_to_string

let pp_transition_message fmt msg =
  CCFormat.fprintf fmt "%s" (show_transition_message msg)

type event =
  | Log of string
  | FIXMessage of message
  | Connected of string
  | Disconnected of string
  | ConnectionRejected of string
  | TransitionMessage of transition_message
  | SequenceNumbers of sequence_numbers
[@@deriving show]

type t = {
  engine_box: Engine.event Lwt_mvar.t;
  fixio_box: Fix_io.message Lwt_mvar.t;
  send_box: Engine.message Lwt_mvar.t;
  result_box: (unit, Engine.err) result Lwt_mvar.t;
  engine: Engine.t;
  log_file: string option;
  fixio: Fix_io.fix_io option;
  recv: event -> unit Lwt.t;
}

type handle = t

let get_msg_type message =
  match List.assoc_opt "35" message with
  | None -> Application
  | Some k ->
    (match Parse_admin_tags.parse_admin_msg_tag k with
    | None -> Application
    | Some _ -> Admin)

let mk_event message direction =
  let msg_type = get_msg_type message in
  FIXMessage { message; direction; msg_type }

let receive_fix_io t message =
  let+ () =
    Lwt.join
      [
        Engine.process_fix_wire t.engine message;
        t.recv (mk_event message Incoming);
      ]
  in
  false

let receive_engine t event =
  match event, t.fixio with
  | Engine.FIXFromEngine message, Some fixio ->
    let+ () =
      Lwt.join [ Fix_io.send fixio message; t.recv (mk_event message Outgoing) ]
    in
    false
  | Engine.Log msg, _ ->
    let+ () = t.recv (Log msg) in
    false
  | Engine.State state, _ ->
    let+ () =
      t.recv
        (SequenceNumbers
           {
             next_in = Z.to_int state.incoming_seq_num + 1;
             next_out = Z.to_int state.outgoing_seq_num + 1;
           })
    in
    false
  | Engine.(SequenceNumbers { next_in; next_out }), _ ->
    let+ () = t.recv (SequenceNumbers { next_in; next_out }) in
    false
  | Engine.TransitionMessage msg, _ ->
    let+ () = t.recv (TransitionMessage msg) in
    (match msg with
    | TerminateTransport _ -> true
    | _ -> false)
  | _ -> Lwt.return_false

let on_disconnect t addr_str =
  let* () =
    Engine.send_internal_message t.engine IncIntMsg_TransportTermination
  in
  t.recv (Disconnected addr_str)

let receive_send t message =
  let* result = Engine.send_fix_message t.engine message in
  let+ () = Lwt_mvar.put t.result_box result in
  false

let engine_io_thread (t : t) : unit Lwt.t =
  let rec loop_box box receiver =
    let* msg = Lwt_mvar.take box in
    let* terminate = receiver t msg in
    if terminate then
      Lwt.return_unit
    else
      loop_box box receiver
  in
  Lwt.pick
    [
      loop_box t.engine_box receive_engine;
      loop_box t.fixio_box receive_fix_io;
      loop_box t.send_box receive_send;
    ]

let with_catch_disconnect t f =
  Lwt.catch f (fun e ->
      let stack = Printexc.get_backtrace () in
      let msg = Printexc.to_string e in
      let msg = Printf.sprintf "\n%s%s\n" msg stack in
      on_disconnect t msg)

let connection_lock = Lwt_mutex.create ()

let with_locks t f =
  Lwt_mutex.with_lock connection_lock @@ fun () -> with_catch_disconnect t f

let addr_to_string = function
  | Unix.ADDR_UNIX s -> s
  | ADDR_INET (h, p) -> Printf.sprintf "%s:%d" (Unix.string_of_inet_addr h) p

let server_handler (t : t) (in_addr : Unix.sockaddr) (inch, outch) =
  let addr_str = addr_to_string in_addr in
  if Lwt_mutex.is_locked connection_lock then
    t.recv (ConnectionRejected addr_str)
  else
    let* () = t.recv (Connected addr_str) in
    with_locks t @@ fun () ->
    (* FIX IO loop *)
    let recv = Lwt_mvar.put t.fixio_box in
    let log_file = t.log_file in
    let fixio_thread, fixio = Fix_io.start ~recv ?log_file (inch, outch) in
    let t = { t with fixio = Some fixio } in
    Lwt.finalize
      (fun () -> Lwt.pick [ fixio_thread; engine_io_thread t ])
      (fun _ -> on_disconnect t addr_str)

let default_session_folder ~(config : Engine.config) =
  (* Sometimes, we want comp/target ids to have forwards slashes.
     Since '/' is illegal in a unix file name, we replace with underscores. *)
  let sanitize_id =
    let f = function
      | '/' -> '_'
      | c -> c
    in
    String.map f
  in
  let hostid =
    match config.host_id with
    | None -> "NoHostid"
    | Some host_id -> host_id
  in
  Printf.sprintf "%s.%s.%s.session"
    (sanitize_id config.comp_id)
    (sanitize_id config.target_id)
    hostid

let make_state_and_thread ~(session_dir : string option)
    ~(log_file : string option) ~(reset : bool option) ~(config : Engine.config)
    ~(recv : event -> unit Lwt.t) =
  let reset =
    match reset with
    | None -> false
    | Some x -> x
  in
  let session_dir =
    match session_dir with
    | Some x -> x
    | None -> default_session_folder ~config
  in
  let engine_box = Lwt_mvar.create_empty () in
  let fixio_box = Lwt_mvar.create_empty () in
  let send_box = Lwt_mvar.create_empty () in
  let result_box = Lwt_mvar.create_empty () in
  let engine_thread, engine =
    let recv = Lwt_mvar.put engine_box in
    Engine.start ~reset ~session_dir ~config ~recv
  in
  let state =
    {
      fixio = None;
      engine;
      engine_box;
      fixio_box;
      send_box;
      result_box;
      recv;
      log_file;
    }
  in
  state, engine_thread

let start_server ?(session_dir : string option) ?(log_file : string option)
    ?(reset : bool option) ~(config : Engine.config) ~(port : int)
    ~(recv : event -> unit Lwt.t) () =
  let state, engine_thread =
    make_state_and_thread ~session_dir ~log_file ~reset ~config ~recv
  in
  let addr = Unix.(ADDR_INET (inet_addr_any, port)) in
  let server_thread =
    let handler = server_handler state in
    let _server = Lwt_io.establish_server_with_client_address addr handler in
    let* () = Lwt_io.printlf "FIX Server established on localhost:%d" port in
    Lwt.return_unit
  in
  let thread = Lwt.join [ engine_thread; server_thread ] in
  state, thread

let client_handler addr_str (t, engine_thread, init_msg) (inch, outch) =
  let* () = t.recv (Connected addr_str) in
  with_catch_disconnect t @@ fun () ->
  let recv = Lwt_mvar.put t.fixio_box in
  let log_file = t.log_file in
  let fixio_thread, fixio = Fix_io.start ~recv ?log_file (inch, outch) in
  let fixio_thread =
    let* () = fixio_thread in
    on_disconnect t addr_str
  in
  let t = { t with fixio = Some fixio } in
  let* () = Engine.send_internal_message t.engine init_msg in
  Lwt.pick [ engine_thread; fixio_thread; engine_io_thread t ]

let start_client ?(session_dir : string option) ?(log_file : string option)
    ?(reset : bool option) ~(config : Engine.config) ~(host : string)
    ~(port : int) ~(recv : event -> unit Lwt.t) () =
  let state, engine_thread =
    make_state_and_thread ~session_dir ~log_file ~reset ~config ~recv
  in
  let init_msg =
    Fix_engine_state.(
      IncIntMsg_CreateSession
        { dest_comp_id = config.target_id; reset_seq_num = false })
  in
  let addr = Unix.inet_addr_of_string host in
  let addr = Unix.(ADDR_INET (addr, port)) in
  let addr_str = addr_to_string addr in
  let handler = client_handler addr_str (state, engine_thread, init_msg) in
  let thread = Lwt_io.with_connection addr handler in
  state, thread

let send_message t msg =
  let* () = Lwt_mvar.put t.send_box msg in
  Lwt_mvar.take t.result_box

(** If [final_seqnums] is passed, these are written to the session dir
    to be read on next startup of fix-engine.

    If no seqnums are present on startup, fix-engine just starts from 0
 *)
let terminate ?final_seqnums (t : t) =
  let () =
    match final_seqnums with
    | None -> ()
    | Some (seqin, seqout) ->
      Engine.persist_final_seqnums t.engine (seqin, seqout)
  in
  Engine.terminate t.engine
