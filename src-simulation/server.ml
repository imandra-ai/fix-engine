open Simulation_utils

module Lwt_ = Make(Lwt_IO)

module Server = struct
  open Lwt_
  open IO
  open Lwt

  let engine_config =
    Engine.
      { comp_id = "IMANDRA"
      ; host_id = None
      ; on_behalf_id = None
      ; target_id = "CLIENT"
      }

  type state =
    { sessn  : Session_manager.t
    ; inch : in_channel
    ; outch : out_channel
    ; model_state : State.model_state
    ; engine_state : Fix_engine_state.fix_engine_state
    ; io_q : Fix_IO.message Lwt_mvar.t
    }

  let session_folder config =
    let open Engine in
    let hostid =
      match config.host_id with None -> "NoHostid" | Some host_id -> host_id
    in
    Printf.sprintf "%s.%s.%s.session" config.comp_id config.target_id hostid

  let fix_read_thread state =
    let rec loop () =
      Fix_IO.get_message ~inch:state.inch [] >>= fun msg ->
      Lwt_mvar.put state.io_q msg >>= fun () ->
      loop ()
    in
    loop ()

  let save_state_seqns state =
    let seqin = state.engine_state.Fix_engine_state.incoming_seq_num in
    let seqout = state.engine_state.Fix_engine_state.outgoing_seq_num in
    Session_manager.save state.sessn (seqin, seqout)

  let loop state () =
    let zmq_pub = fun _ ~sending:_ -> Lwt.return_unit in
    let _, engine_handle = handlers ~zmq_pub ~outch:state.outch () in
    let rec loop state () =
      Lwt_mvar.take state.io_q >>= fun msg ->
      save_state_seqns state >>= fun () ->
      let msg = Parse_full_messages.parse_top_level_msg msg in
      let engine_state = { state.engine_state with incoming_fix_msg = Some msg } in
      engine_handle (state.model_state, engine_state) >>= fun (model_state, engine_state) ->
      let state = { state with model_state; engine_state } in
      loop state ()
    in
    loop state ()

  let run _ (inch, outch) =
    Lwt_io.printl "Received connection, starting fix-engine." >>= fun () ->
    let dir = session_folder engine_config in
    Session_manager.create ~reset:false ~dir >>= fun sessn ->
    let seqns = Session_manager.get sessn in
    let model_state = State.init_model_state in
    let engine_state = Engine.make_engine_state seqns engine_config in
    let io_q = Lwt_mvar.create_empty () in
    let state = { inch; outch; engine_state; model_state; io_q; sessn } in
    let fix_io = fix_read_thread state in
    let loop = loop state () in
    Lwt.pick [loop; fix_io]

  let main () =
    let addr = Unix.(ADDR_INET (inet_addr_loopback, 9880)) in
    let _server = Lwt_io.establish_server_with_client_address addr run in
    print_endline "Started server on localhost:9880 ..." ;
    fst (Lwt.wait ())

end

let () = Lwt_main.run @@ Server.main ()
