let ( >>= ) = Lwt.( >>= )

let log_fix_message pre msg =
  let log = Fix_io.encode ~split:'|' msg in
  Lwt_io.printlf "[%s]: %s" pre log


let engine_to_fixio fixio msg =
  let wire = Encode_full_messages.packet_full_valid_msg msg in
  log_fix_message "Out" wire >>= fun () -> Fix_io.send fixio wire


type state =
  { fixio_box : Fix_io.message Lwt_mvar.t
  ; model_box : Model.event Lwt_mvar.t
  ; engine_box : Engine.event Lwt_mvar.t
  ; fixio : Fix_io.fix_io
  ; engine : Engine.t
  ; model : Model.t
  }

let receive_engine_box state = function
  | Engine.FIXMessage (Full_messages.ValidMsg msg) ->
      engine_to_fixio state.fixio msg
  | Engine.FIXMessage Full_messages.Garbled ->
      Lwt_io.printl "Warning: Engine.FIXMessage Garbled"
      >>= fun () -> Lwt_io.flush_all ()
  | Engine.FIXMessage (Full_messages.SessionRejectedMsg m) ->
      Lwt_io.printl "Warning: Engine.FIXMessage SessionRejectedMsg"
      >>= fun () ->
      Lwt_io.flush_all ()
      >>= fun () ->
      Lwt_io.printl
        ( Full_messages_json.session_rejected_msg_to_json m
        |> Yojson.Basic.to_string )
      >>= fun () -> Lwt_io.flush_all ()
  | Engine.FIXMessage (Full_messages.BusinessRejectedMsg m) ->
      Lwt_io.printl "Warning: Engine.FIXMessage BusinessRejectedMsg"
      >>= fun () ->
      Lwt_io.flush_all ()
      >>= fun () ->
      Lwt_io.printl
        (Full_messages_json.biz_rejected_msg_to_json m |> Yojson.Basic.to_string)
      >>= fun () -> Lwt_io.flush_all ()
  | Engine.OutFIXData (_, msg) ->
      Model.send_fix state.model (OutIntMsg_ApplicationData msg)
  | Engine.State _ ->
      Lwt_io.printl "Warning: unexpected Engine.State"
      >>= fun () -> Lwt_io.flush_all ()


let receive_fixio_box state msg =
  log_fix_message "In " msg
  >>= fun () ->
  let msg = Parse_full_messages.parse_top_level_msg msg in
  Engine.send_fix state.engine msg


let receive_model_box state = function
  | Model.FIXMessage msg ->
      Engine.send_int state.engine msg
  | Model.State _ ->
      Lwt_io.printl "Warning: Unexpected Model.State"
      >>= fun () -> Lwt_io.flush_all ()


let loop state =
  let rec loop_box box receiver =
    Lwt_mvar.take box
    >>= fun x -> receiver state x >>= fun () -> loop_box box receiver
  in
  Lwt.join
    [ loop_box state.engine_box receive_engine_box
    ; loop_box state.fixio_box receive_fixio_box
    ; loop_box state.model_box receive_model_box
    ]


let config box =
  Engine.
    { comp_id = "IMANDRA"
    ; host_id = None
    ; on_behalf_id = None
    ; target_id = "CLIENT"
    ; timer = 3.0
    ; recv = Lwt_mvar.put box
    }


let with_catch_disconnect f =
  Lwt.catch f (fun _ -> Lwt_io.printl "Client disconnected.")


let f _ (inch, outch) =
  Lwt_io.printl "Received connection, starting fix-engine."
  >>= fun () ->
  with_catch_disconnect
  @@ fun () ->
  let engine_box = Lwt_mvar.create_empty () in
  let model_box = Lwt_mvar.create_empty () in
  let fixio_box = Lwt_mvar.create_empty () in
  let config = config engine_box in
  let enginethread, engine =
    Engine.start ~session_dir:"test_runner.session" ~reset:true ~config
  in
  let modelthread, model = Model.start ~recv:(Lwt_mvar.put model_box) in
  let iothread, fixio =
    Fix_io.start ~recv:(Lwt_mvar.put fixio_box) (inch, outch)
  in
  let state = { engine_box; engine; model_box; model; fixio_box; fixio } in
  Lwt.pick [ loop state; enginethread; iothread; modelthread ]


let server_thread =
  let addr = Unix.(ADDR_INET (inet_addr_loopback, 9880)) in
  let _server = Lwt_io.establish_server_with_client_address addr f in
  print_endline "Started server on localhost:9880 ..." ;
  fst (Lwt.wait ())


let () = Lwt_main.run @@ server_thread
