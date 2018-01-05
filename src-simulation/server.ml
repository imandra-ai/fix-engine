(** FIX 4.4 engine server implementation. *)
(***
    
    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    server.ml
    
*)

let (>>=) = Lwt.(>>=);;

let ctime = Fix_connection.get_current_utctimstamp;;

let config = Fix_connection.{
    comp_id = "IMANDRA";
    host_id = None;
    target_id = "BANZAI";
    pub_callback = None;
    reset_seq = false;
    timer = 1.0;
};;

let f (inch, outch) =
    let close_channels () = 
        Lwt_io.printl "Connection closed, shutting down." >>= fun () ->
        Lwt_io.close inch >>= fun () ->
        Lwt_io.close outch
        in
    let open Fix_connection in
    let connection = create config (inch, outch) in 
    Lwt.async ( fun () ->     
    Lwt.catch ( fun () ->
        Lwt.choose [
            get_heartbeat_thread connection;
            get_fix_thread connection
        ]
    ) ( fun _ -> close_channels () )
    )
;;

let server_thread =
    let addr = Unix.( ADDR_INET( inet_addr_loopback , 9880 ) ) in
    let server = Lwt_io.establish_server addr f in
    print_endline "Started server on localhost:9880 ...";
    fst (Lwt.wait ())
;;


Lwt_main.run server_thread
;;
