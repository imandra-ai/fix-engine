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

(*  Prepeare internal state mutable variable *)

let get_current_utctimstamp () =    
    let tm = Unix.( gettimeofday () |> gmtime ) in
    Datetime.{
        utc_timestamp_year   = tm.Unix.tm_year + 1900;
        utc_timestamp_month  = tm.Unix.tm_mon + 1;
        utc_timestamp_day    = tm.Unix.tm_mday;
        utc_timestamp_hour   = tm.Unix.tm_hour;
        utc_timestamp_minute = tm.Unix.tm_min;
        utc_timestamp_second = tm.Unix.tm_sec;
        utc_timestamp_millisec = Some 0
    }
;;

let state = ref Fix_engine.{ init_fix_engine_state with
    fe_comp_id = String_utils.string_to_fix_string "EXEC";
    fe_target_comp_id = String_utils.string_to_fix_string "BANZAI";
    fe_curr_time = get_current_utctimstamp ();
    fe_max_num_logons_sent = 10
};;  

(* Read msg stream from socket *)

let create_msg_stream char_stream = 
    let stream_map f stream =
        let rec next i =
            try Some (f (Stream.next stream))
            with Stream.Failure -> None in
        Stream.from next 
    in
    char_stream
        |> Parser_utils.split_into_key_value '\001'
        |> Parser_utils.split_into_messages
        |> stream_map ( fun msg -> 
                        let s = msg |> List.map (fun (k,v) -> k ^ "=" ^ v )  
                                    |> List.fold_left ( fun a s -> a ^ s ^ "\001" ) "" in
                        let () = print_endline (" Received raw: (" ^ s ^ ")") in
                        msg ) 
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

let in_chan, out_chan = Unix.( in_channel_of_descr client , out_channel_of_descr client );;
let send_msg msg =
    let () = output out_chan msg 0 (Bytes.length msg) in
    flush out_chan
;;

let treat_message msg = 
    let () = 
        state := { !state with incoming_fix_msg = Some msg } ;
        state := Fix_engine.one_step (!state) ;
        match (!state).outgoing_fix_msg with 
            | Some (ValidMsg msg) -> (
                 msg |> Encode_full_messages.encode_full_valid_msg
                     |> send_msg  )
            | _ -> ()
    in
    let () = print_endline "--== Received ==--" in
    msg |> Full_messages_json.full_top_level_msg_to_json
        |> Yojson.pretty_to_channel stdout 
;;


let in_msg_stream = in_chan |> Stream.of_channel
                            |> create_msg_stream ;;
                           

Stream.iter treat_message in_msg_stream;; 

Unix.close client;;
Unix.close server;;
