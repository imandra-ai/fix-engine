let ( >>= ) = Lwt.( >>= )

let log_fix_message pre msg =
  let log = Fix_io.encode ~split:'|' msg in
  Lwt_io.printlf "[%s]: %s" pre log


let fixio_to_engine engine msg =
  log_fix_message "In " msg
  >>= fun () ->
  let msg = Parse_full_messages.parse_top_level_msg msg in
  Engine.send_fix engine msg


let engine_to_fixio fixio msg =
  let wire = Encode_full_messages.packet_full_valid_msg msg in
  log_fix_message "Out" wire >>= fun () -> Fix_io.send fixio wire


let rec loop (fixio_box, fixio) (engine_box, engine) (model_box, model) =
  Lwt.pick
    [ ( Lwt_mvar.take engine_box
      >>= function
      | Engine.FIXMessage (Full_messages.ValidMsg msg) -> 
        Lwt_io.printl "Engine.FIXMessage ValidMsg" >>= fun () -> Lwt_io.flush_all () >>= fun () ->
        engine_to_fixio fixio msg 
      | Engine.FIXMessage (Full_messages.Garbled ) ->
        Lwt_io.printl "Engine.FIXMessage Garbled" >>= fun () -> Lwt_io.flush_all ()
      | Engine.FIXMessage (Full_messages.SessionRejectedMsg m ) ->
        Lwt_io.printl "Engine.FIXMessage SessionRejectedMsg" >>= fun () -> Lwt_io.flush_all () >>= fun () ->
        Lwt_io.printl (Full_messages_json.session_rejected_msg_to_json m |> Yojson.Basic.to_string) >>= fun () -> Lwt_io.flush_all ()
      | Engine.FIXMessage (Full_messages.BusinessRejectedMsg m ) ->
        Lwt_io.printl "Engine.FIXMessage BusinessRejectedMsg" >>= fun () -> Lwt_io.flush_all () >>= fun () ->
        Lwt_io.printl (Full_messages_json.biz_rejected_msg_to_json m |> Yojson.Basic.to_string) >>= fun () -> Lwt_io.flush_all ()
      | Engine.OutFIXData (_,msg) -> 
        Lwt_io.printl "Engine.OutFIXData" >>= fun () -> Lwt_io.flush_all () >>= fun () ->
        Model.send_fix model (OutIntMsg_ApplicationData msg)
      | Engine.State _ -> 
        Lwt_io.printl "Engine.State" >>= fun () -> Lwt_io.flush_all () 
      )
    ; ( Lwt_mvar.take fixio_box >>= fun msg ->
        Lwt_io.printl "fixio_box" >>= fun () -> Lwt_io.flush_all () >>= 
        fun () -> fixio_to_engine engine msg
      )
    ; ( Lwt_mvar.take model_box
      >>= function
      | Model.FIXMessage msg ->
        Lwt_io.printl "Model.FIXMessage" >>= fun () -> Lwt_io.flush_all () >>= fun () ->
        Engine.send_int engine msg
      | Model.State _ ->
        Lwt_io.printl "Model.State" >>= fun () -> Lwt_io.flush_all () 
      )
    ]
  >>= fun () -> loop (fixio_box, fixio) (engine_box, engine) (model_box, model)


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
  let enginethread, engine = Engine.start ~session_dir:"test_runner.session" ~reset:true ~config in
  let modelthread, model = Model.start ~recv:(Lwt_mvar.put model_box) in
  let iothread, fixio =
    Fix_io.start ~recv:(Lwt_mvar.put fixio_box) (inch, outch)
  in
  Lwt.pick
    [ loop (fixio_box, fixio) (engine_box, engine) (model_box, model)
    ; enginethread
    ; iothread
    ; modelthread
    ]


let server_thread =
  let addr = Unix.(ADDR_INET (inet_addr_loopback, 9880)) in
  let _server = Lwt_io.establish_server_with_client_address addr f in
  print_endline "Started server on localhost:9880 ..." ;
  fst (Lwt.wait ())


let () = Lwt_main.run @@ server_thread
