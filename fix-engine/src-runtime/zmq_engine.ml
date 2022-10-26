open Common
module D = Decoders_yojson.Basic.Decode
module CD = Config.Decode (D)

let load_config filename =
  match D.decode_file CD.t filename with
  | Ok x -> x
  | Error err ->
    let err = D.string_of_error err in
    Log.err (fun k -> k "Error loading %S config json:%s" filename err);
    failwith "could not load config"

let ( let* ) = Lwt.bind

let event_box : Runtime.event Lwt_mvar.t = Lwt_mvar.create_empty ()

let pub_thread (zmqpubsocket : 'a Zmq_lwt.Socket.t) : unit Lwt.t =
  let rec thread () =
    let ( let*? ) x f =
      match x with
      | Some x -> f x
      | None -> thread ()
    in
    let* msg = Lwt_mvar.take event_box in
    let*? msg =
      match msg with
      | Runtime.FIXMessage msg -> Some msg
      | _ -> None
    in
    let msg = Fix_io.encode ~split:'|' msg.Runtime.message in
    let* () = Zmq_lwt.Socket.send zmqpubsocket msg in
    thread ()
  in
  thread ()

let rep_thread handle (zmqrepsocket : 'a Zmq_lwt.Socket.t) =
  let rec thread () =
    let* msg = Zmq_lwt.Socket.recv zmqrepsocket in
    let msg = String.split_on_char '|' msg in
    let msg = List.filter (fun x -> not (x = "")) msg in
    let msg =
      msg
      |> List.map (fun x ->
             match String.split_on_char '=' x with
             | h :: tl -> h, String.concat "=" tl
             | _ -> x, "")
    in
    let* result = Runtime.send_message handle msg in
    let result =
      match result with
      | Ok () -> "OK"
      | Error _err -> "ERROR"
    in
    let* () = Zmq_lwt.Socket.send zmqrepsocket result in
    thread ()
  in
  thread ()

let engine_thread (config : Config.t) =
  let recv = Lwt_mvar.put event_box in
  let reset = config.reset in
  match config.mode with
  | Server { port } ->
    Runtime.start_server ~reset ~config:config.engine_config ~port ~recv ()
  | Client { host; port } ->
    Runtime.start_client ~reset ~config:config.engine_config ~host ~port ~recv
      ()

let run (config : Config.t) (log_level : Logs.level option) =
  Logs.set_level ~all:true log_level;
  Logs.set_reporter @@ Logs.format_reporter ();
  let handle, engine = engine_thread config in
  let zmqcontext = Zmq.Context.create () in
  let zmqpubsocket = Zmq.Socket.(create zmqcontext pub) in
  Zmq.Socket.bind zmqpubsocket config.zmqpub;
  let zmqpubsocket = Zmq_lwt.Socket.of_socket zmqpubsocket in
  let zmqrepsocket = Zmq.Socket.(create zmqcontext rep) in
  Zmq.Socket.bind zmqrepsocket config.zmqrep;
  let zmqrepsocket = Zmq_lwt.Socket.of_socket zmqrepsocket in
  let thread =
    Lwt.join [ engine; pub_thread zmqpubsocket; rep_thread handle zmqrepsocket ]
  in
  let () = Lwt_main.run thread in
  Zmq.Context.terminate zmqcontext

let () =
  let open Cmdliner in
  let config_json =
    let doc = "Configuration JSON" in
    Arg.(
      value & opt string "config.json"
      & info [ "config" ] ~docv:"CONFIG_JSON" ~doc)
  in
  let info =
    let doc = "FIX engine" in
    Cmd.info "fix-engine" ~version:"%%VERSION%%" ~doc ~exits:Cmd.Exit.defaults
  in
  let logs = Logs_cli.level () in
  let config = Term.(const load_config $ config_json) in
  Cmd.eval (Cmd.v info Term.(const run $ config $ logs)) |> ignore
