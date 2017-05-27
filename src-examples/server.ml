let (>>=) = Lwt.(>>=);;

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

let split_into_key_value (spliton : char) ( stream : char Lwt_stream.t ) : (string * string) Lwt_stream.t =
    (** Converts [ '5'; '2'; '='; 'A' ] to ("52" , "A" ) *)
    let get_key_value (chlist : char list) : string * string =
        List.fold_left (fun ((k,v),f) char -> match char with
            | '=' -> ((k,v), true)
            |  c  -> if f then (( k, v ^ String.make 1 c ), f)
                          else (( k ^ String.make 1 c, v ), f)   
            ) (("", ""), false) chlist
        |> fst
        in
    let f () =
        Lwt_stream.get_while (fun c -> c <> spliton) stream >>= fun chlist ->
        Lwt_stream.junk stream >>= fun () ->
        if chlist <> [] 
        then Lwt.return_some @@ get_key_value chlist
        else Lwt.return_none
        in
    Lwt_stream.from f
;;

let split_into_messages (stream : (string * string) Lwt_stream.t) =
    let f () =
        Lwt_stream.get_while (fun (k,v) -> k <> "10") stream >>= fun msg ->
        Lwt_stream.get stream >>= function None -> Lwt.return_none | Some chsum ->
        if msg <> [] 
        then Lwt.return_some (msg @ [chsum])
        else Lwt.return_none
        in
    Lwt_stream.from f    
;;


let f (inch, outch) =
    let msg_stream = Lwt_io.read_chars inch
        |> split_into_key_value '\001'
        |> split_into_messages 
        |> Lwt_stream.map Parse_full_messages.parse_top_level_msg
        in
    let send_msg msg =
        msg |> Encode_full_messages.encode_full_valid_msg 
            |> Lwt_io.write outch >>= fun () ->
        Lwt_io.flush outch 
        in
    msg_stream |> Lwt_stream.iter_s ( fun msg ->
    Lwt_io.printl " -- == Received == -- " >>= fun () ->
    begin
        state := { !state with incoming_fix_msg = Some msg } ;
        state := Fix_engine.one_step (!state) ;
        match (!state).outgoing_fix_msg with 
            | Some (ValidMsg msg) -> send_msg msg 
            | _ -> Lwt.return ()
    end)
;;

let server_thread =
    let addr = Unix.( ADDR_INET( inet_addr_loopback , 9880 ) ) in
    let server = Lwt_io.establish_server addr f in
    fst (Lwt.wait ())
;;

Lwt_main.run server_thread
;;
