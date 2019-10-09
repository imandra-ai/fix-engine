(** FIX 4.4 engine client implementation. *)
(***
    
    Aesthetic Integration Limited
    Copyright (c) 2014 - 2018

    client.ml
    
*)

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
    let hostid = let doc = "Host ID (will be sent as SenderLocationID<142>)" in
        Arg.(value & opt string "LOGIN" & info ["hostid"] ~docv:"HOSTID" ~doc)
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
    let reset = 
        let doc = "Whether we shall send ResetSeqNum with the logon" in
        Arg.(value & flag & info ["reset-seq"] ~doc)
        in        
    let info = let doc = "FIX engine client, publishing all internal messages on ZMQ socket." in
        Term.info "server" ~version:"%%VERSION%%" ~doc ~exits:Term.default_exits 
        in
    let config = Term.(const Client_utils.mkconfig $ compid $ hostid $ targetid $ reset ) in
    Term.exit @@ Term.eval (Term. (const Client_utils.run_client $ fixhost $ fixport $ config $ zmqpub $ zmqrep ), info)
;;
[@@@logic]