module Config = struct

  type mode = 
    | Server of { port : int } 
    | Client of { host : string ; port : int }
  
  type t = 
    { engine_config : Engine.config
    ; mode : mode
    ; zmqpub : string
    ; zmqrep : string
    ; reset : bool
    } 

    module Decode(D: Decoders.Decode.S) = struct
      let (let*) = D.(>>=)
      let (>>=) = D.(>>=)

      let field_def field default f =
        let* opt = D.field_opt field f in
        D.succeed ( match opt with None -> default | Some x -> x )  

      let mode = 
        D.single_field ( function
        | "Server" -> 
          let* port = field_def "port" 9880 D.int in
          D.succeed @@ Server { port }
        | "Client" -> 
          let* port = field_def "port" 9880 D.int in
          let* host = field_def "host" "127.0.0.1" D.string in
          D.succeed @@ Client { port ; host }
        | s -> D.fail @@ Printf.sprintf "Unknown mode string '%s'" s 
        )

      let t : t D.decoder =
        let* zmqpub = field_def "zmqpub" "tcp://*:5000" D.string in
        let* zmqrep = field_def "zmqrep" "tcp://*:5001" D.string in
        let def_mode = Server {port=9880} in
        let* mode = field_def "mode" def_mode  mode in
        let def_target = match mode with
          | Server _ -> "CLIENT" | Client _ -> "SERVER"
          in
        let* comp_id = field_def "comp_id" "IMANDRA" D.string in
        let* target_id = field_def "target_id" def_target D.string in
        let* host_id = D.field_opt "host_id" D.string in
        let* on_behalf_id = D.field_opt "on_behalf_id" D.string in
        let* begin_string = field_def "begin_string" "FIX.4.2" D.string in
        let* timer = field_def "timer" 1.0 D.float in
        let* millisecond_precision = field_def "timer" false D.bool in
        let* reset = field_def "reset" false D.bool in
        let engine_config = Engine.
          { comp_id ; target_id
          ; host_id ; on_behalf_id
          ; timer ; millisecond_precision
          ; begin_string
          } in
        D.succeed { zmqpub ; zmqrep ; mode ; engine_config ; reset }
  end
end

module D = Decoders_yojson.Basic.Decode
module CD = Config.Decode(D)
let load_config filename =
  match D.decode_file CD.t filename with Ok x -> x
  | Error err -> 
  let err = D.string_of_error err in
  let err = Printf.sprintf "Error loading %s config json:/n%s" filename err in
  failwith err
  
let (let*) = Lwt.bind

let event_box : Runner.event Lwt_mvar.t = Lwt_mvar.create_empty ()

let pub_thread ( zmqpubsocket : 'a Zmq_lwt.Socket.t ) =
  let rec thread () = 
    let* msg = Lwt_mvar.take event_box in
    let msg = Fix_io.encode ~split:'|' msg.Runner.message in
    let* () = Zmq_lwt.Socket.send zmqpubsocket msg in
    thread ()
    in
  thread ()

let rep_thread ( zmqrepsocket : 'a Zmq_lwt.Socket.t ) =
  let rec thread () = 
    let* msg = Zmq_lwt.Socket.recv zmqrepsocket in
    let msg = String.split_on_char '|' msg in
    let msg = List.filter ( fun x -> not ( x = "" ) ) msg in
    let msg = msg |> List.map ( fun x -> 
      match String.split_on_char '=' x with 
      | h::tl -> (h, String.concat "=" tl)
      | _ -> (x , "")
    ) in
    let* result = Runner.send_message  msg in
    let result = match result with
      | Ok () ->  "OK" 
      | Error _err -> "ERROR" 
      in
    let* () = Zmq_lwt.Socket.send zmqrepsocket result in
    thread ()
    in
  thread ()

let engine_thread ( config : Config.t ) =
  let recv = Lwt_mvar.put event_box in
  let reset = config.reset in
  match config.mode with
  | Server {port} ->  
    Runner.start_server ~reset ~config:config.engine_config ~port ~recv ()
  | Client {host; port} ->  
    Runner.start_client ~reset ~config:config.engine_config ~host ~port ~recv ()
  
let run ( config : Config.t ) =
  let zmqcontext = Zmq.Context.create () in
  let zmqpubsocket = Zmq.Socket.(create zmqcontext pub) in
  let () = Zmq.Socket.bind zmqpubsocket config.zmqpub in
  let zmqpubsocket = Zmq_lwt.Socket.of_socket zmqpubsocket in
  let zmqrepsocket = Zmq.Socket.(create zmqcontext rep) in
  let () = Zmq.Socket.bind zmqrepsocket config.zmqrep in
  let zmqrepsocket = Zmq_lwt.Socket.of_socket zmqrepsocket in
  let thread = Lwt.join
    [ engine_thread config
    ; pub_thread zmqpubsocket
    ; rep_thread zmqrepsocket
    ] in
  let () = Lwt_main.run thread in
  Zmq.Context.terminate zmqcontext

let () =
  let open Cmdliner in
  let config_json =
      let doc = "Configuration JSON" in
      Arg.(value & opt string "config.json" & info ["config"] ~docv:"CONFIG_JSON" ~doc)
      in
  let info = let doc = "FIX engine" in
      Term.info "fix-engine" ~version:"%%VERSION%%" ~doc ~exits:Term.default_exits
      in
  let config = Term.(const load_config $ config_json ) in
  Term.exit @@ Term.eval (Term. (const run $ config ), info)
