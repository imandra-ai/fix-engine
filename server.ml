#use "topfind"
#require "yojson"
#require "unix"

#load "_build/src-core/core.cma";;
#load "_build/src-protocol-exts/protocol_exts.cma";;
#load "_build/src-protocol/protocol.cma";;
#load "_build/src-core-pp/core_pp.cma";;
#load "_build/src-protocol-exts-pp/protocol_exts_pp.cma";;
#load "_build/src-protocol-pp/protocol_pp.cma";;
#load "_build/src/fix_engine.cma";;

#directory "_build/src-core/";;
#directory "_build/src-protocol-exts/";;
#directory "_build/src-protocol/";;
#directory "_build/src-core-pp/";;
#directory "_build/src-protocol-exts-pp/";;
#directory "_build/src-protocol-pp/";;
#directory "_build/src/";;

#use "server_utils.ml";;

let create_msg_stream channel = 
    let stream_map f stream =
        let rec next i =
            try Some (f (Stream.next stream))
            with Stream.Failure -> None in
        Stream.from next in
    Stream.of_channel channel
        |> Parser_utils.split_into_key_value '\001'
        |> Parser_utils.split_into_messages
        |> stream_map Parse_full_messages.parse_top_level_msg
;;


let server, client = 
     let server = Unix.( socket PF_INET SOCK_STREAM 0 ) in
     let () = Unix.(setsockopt server SO_REUSEADDR true) in
     let () = print_endline "--== Starting listening on localhost:9880 ==--" in
     let addr = Unix.( ADDR_INET( inet_addr_loopback , 9880 ) ) in
     let server = try 
         Unix.bind server addr;
         Unix.listen server 10;
         server
     with exn -> Unix.close server; raise exn in
     let client, caddr = Unix.accept server in
     ( server, client )
;;

let in_chan, out_chan = 
    Unix.( in_channel_of_descr client, out_channel_of_descr client );;
    
let send_logon seq_num =
    let l = logon_msg seq_num in
    let () = output out_chan l 0 (Bytes.length l) in
    flush out_chan
;;

let treat_message msg = 
    let () = 
        if is_logon_msg msg then begin
            print_endline "--== Logon received, sending reply ==--";
            send_logon (get_seq_num msg + 1) 
        end
        else () 
    in
    let () = print_endline "--== Received ==--" in
    msg |> Full_messages_json.full_top_level_msg_to_json
        |> Yojson.pretty_to_channel stdout 
;;

let in_msg_stream = create_msg_stream in_chan;;

Stream.iter treat_message in_msg_stream;;

Unix.close client;;
Unix.close server;;
