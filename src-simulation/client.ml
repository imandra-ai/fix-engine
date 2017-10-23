(** FIX 4.4 engine client implementation. *)
(***
    
    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    client.ml
    
*)

let (>>=) = Lwt.(>>=);;


let get_current_utctimstamp () =    
    let open Datetime in
    let dtime = Unix.gettimeofday () in 
    let tm = Unix.gmtime dtime in
    let msec = int_of_float (1000. *. (dtime -. floor dtime)) in
    {   utc_timestamp_year   = tm.Unix.tm_year + 1900
    ;   utc_timestamp_month  = tm.Unix.tm_mon + 1
    ;   utc_timestamp_day    = tm.Unix.tm_mday
    ;   utc_timestamp_hour   = tm.Unix.tm_hour
    ;   utc_timestamp_minute = tm.Unix.tm_min
    ;   utc_timestamp_second = tm.Unix.tm_sec
    ;   utc_timestamp_millisec = Some (msec)
    }
;;

let make_engine_state me target = 
    let open Fix_engine_state in
    { init_fix_engine_state with
    fe_comp_id = String_utils.string_to_fix_string me;
    fe_target_comp_id = String_utils.string_to_fix_string target;
    fe_curr_time = get_current_utctimstamp ();
    fe_max_num_logons_sent = 10;
    fe_application_up = true }
;;  

let send_msg outch msg =
    match msg with
        | Full_messages.ValidMsg msg -> begin
            let wire = Encode_full_messages.encode_full_valid_msg msg in
            Lwt_io.print ("Sending (" ^ wire ^ ") " ) >>= fun () ->
            Lwt_io.flush_all ()                       >>= fun () ->
            Lwt_io.write outch wire                   >>= fun () ->
            Lwt_io.flush outch                        >>= fun () ->
            Lwt_io.printl " done."                   
        end
        | _ ->  Lwt.return_unit
;;

let do_timechange mailbox =
    let time = get_current_utctimstamp () in
    let timechange = Fix_engine_state.IncIntMsg_TimeChange time in
    let timechange = Fix_global_state.Internal_Message timechange in
    Lwt_mvar.put mailbox timechange
;;

let rec heartbeat_thread mailbox =
    let open Fix_engine_state in
    Lwt_unix.sleep (1.0) >>= fun () -> 
    do_timechange mailbox >>= fun () -> 
    heartbeat_thread mailbox
;;

let rec zmq_rep_loop (socket, mailbox) =
    let msg = ZMQ.Socket.(recv socket) in
    if msg = "LOGOUT" then Lwt_mvar.put mailbox Fix_global_state.Terminate else
    let action = match msg with 
        | "NEW"     -> Some Actions.(FIX_Action_x {f_x_x = 0})
        | "CANCEL"  -> Some Actions.(FIX_Action_x {f_x_x = 1})
        | "REPLACE" -> Some Actions.(FIX_Action_x {f_x_x = 2})
        | _  -> None
        in
    match action with 
    | None -> (
        Lwt.return ZMQ.Socket.(send socket "REJECTED") >>= fun () ->
        zmq_rep_loop (socket, mailbox) )   
    | Some action -> (
        Lwt_mvar.put mailbox (Fix_global_state.ModelAction action) >>= fun () ->
        Lwt.return ZMQ.Socket.(send socket "ACKED") >>= fun () ->
        zmq_rep_loop (socket, mailbox) )
;;

let f engine_state zmqrep (inch, outch) =
    let close_channels () = 
        Lwt_io.printl "Connection closed, shutting down." >>= fun () ->
        Lwt_io.close inch >>= fun () ->
        Lwt_io.close outch
        in
    let mailbox, global_state = Fix_global_state.start engine_state State.init_model_state (send_msg outch) in 
    let initmsg = Fix_engine_state.(IncIntMsg_CreateSession { dest_comp_id = engine_state.fe_target_comp_id } )in
    Lwt.catch ( fun () ->
        Lwt_mvar.put mailbox ( Fix_global_state.Internal_Message initmsg ) >>= fun () -> 
        Lwt.join [
            heartbeat_thread mailbox;
            Message_stream.from_channel ~verbose:true inch
                |> Lwt_stream.map Parse_full_messages.parse_top_level_msg
                |> Lwt_stream.iter_s ( fun msg ->
                    do_timechange mailbox >>= fun () ->
                    Lwt_mvar.put mailbox (Fix_global_state.FIX_Message msg)
                );
            zmq_rep_loop (zmqrep, mailbox)
        ]
    ) ( fun _ -> close_channels () )
;;


let run_client fixhost fixport compid targetid zmqpub zmqrep = 
    (* Bringing up a ZMQ sockets *)
    let zmqcontext = ZMQ.Context.create () in
    let zmqpubsocket = ZMQ.Socket.(create zmqcontext pub) in
    let () = ZMQ.Socket.bind zmqpubsocket zmqpub in
    let zmqrepsocket = ZMQ.Socket.(create zmqcontext rep) in
    let () = ZMQ.Socket.bind zmqrepsocket zmqrep in    
    (* Creating the address *)
    let addr = Unix.( (gethostbyname fixhost).h_addr_list.(0) ) in      
    let addr = Unix.( ADDR_INET( addr , fixport ) ) in
    (* Creating the global state *)
    let engine_state = make_engine_state compid targetid in
    (**)
    let () = [
        "(*********                   FIX Engine Client                           *********)";
        "(*********  (c)Copyright Aesthetic Integration Limited., 2014 - 2017     *********)\n";
        Printf.sprintf " - FIX client connecting to %s:%d" fixhost fixport;
        Printf.sprintf " - FIX session %s -> %s" compid targetid;
        Printf.sprintf " - Internal messages are published on ZMQ socket %s" zmqpub;
        Printf.sprintf " - Model actions are received on ZMQ socket %s" zmqrep;
        "\n(*********************************************************************************)\n";
        ] |> String.concat "\n" |> print_endline in
    let client_thread = Lwt_io.with_connection addr ( f engine_state zmqrepsocket ) in
    Lwt_main.run client_thread
;;

let () =
    let open Cmdliner in
    let fixhost = let doc = "FIX host address" in
        Arg.(value & opt string "localhost" & info ["fix-host"] ~docv:"FIXHOST" ~doc)
        in
    let fixport = let doc = "Port for the FIX connection" in 
        Arg.(value & opt int 9880 & info ["fix-port"] ~docv:"FIXPORT" ~doc)
        in
    let compid = let doc = "FIX Client ID" in
        Arg.(value & opt string "IMANDRA" & info ["compid"] ~docv:"COMPID" ~doc)
        in
    let targetid = let doc = "FIX Target ID" in
        Arg.(value & opt string "TARGET" & info ["targetid"] ~docv:"TARGETID" ~doc)
        in        
    let zmqpub =
        let doc = "ZMQ PUB socket adress" in
        Arg.(value & opt string "tcp://*:5000" & info ["zmq-pub"] ~docv:"ZMQPUBADDR" ~doc)
        in
    let zmqrep =
        let doc = "ZMQ REP socket adress" in
        Arg.(value & opt string "tcp://*:5001" & info ["zmq-rep"] ~docv:"ZMQREPADDR" ~doc)
        in
    let info = let doc = "FIX engine client, publishing all internal messages on ZMQ socket." in
        Term.info "server" ~version:"%%VERSION%%" ~doc ~exits:Term.default_exits 
        in
    Term.exit @@ Term.eval (Term. (const run_client $ fixhost $ fixport $ compid $ targetid $ zmqpub $ zmqrep ), info)
;;
