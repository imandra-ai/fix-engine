(** FIX 4.4 engine server implementation. *)
(***
    
    Aesthetic Integration Limited
    Copyright (c) 2014 - 2018

    server.ml
    
*)

let server_thread =
    let addr = Unix.( ADDR_INET( inet_addr_loopback , 9880 ) ) in
    let _server = Lwt_io.establish_server_with_client_address addr Server_utils.f in
    print_endline "Started server on localhost:9880 ...";
    fst (Lwt.wait ())
;;

Lwt_main.run server_thread
;;
