open Config_parser
open Datetime

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


let prepare_message msg =
    let id x = x in
    let time = get_current_utctimstamp () in
    let fill_placeholder (k,v) = 
        if String.length v < 5 then (k,v) else
        if String.sub v 0 5 <> "<TIME" then (k,v) else 
        begin
            let adds = Scanf.sscanf v "<TIME%s@>" id in
            let adds = if adds = "" then 0 else Scanf.sscanf adds "%d" id in
            let time = { time with 
                utc_timestamp_second = time.utc_timestamp_second + adds 
            } |> normalise_timestamp in
            ( k , Core_printer.fix_utctimestamp_to_string time ) 
        end in
    let fill_empty_ts (k,v) =
        if v <> "00000000-00:00:00.000" then (k,v) else
        ( k , Core_printer.fix_utctimestamp_to_string time ) 
        in
    msg |> List.filter ( function "8",_ |"9",_ |"10",_ -> false| _ -> true)
        |> Encode_full_messages.prepare_packet 
        |> List.map fill_placeholder
        |> List.map fill_empty_ts
        |> List.map (fun (a,b) -> a ^ "=" ^ b)
        |> List.fold_left ( fun a s -> a ^ s ^ "\001" ) ""
;;

    
let perform_action  (inch, outch) act =
    Lwt_io.printl ("Got action") >>= fun () ->
    Lwt_io.flush_all () >>= fun () ->
    begin
    match act with 
    | InitiateMessage msg -> begin
            Lwt_io.printl ("Initiated" ^ prepare_message msg ) >>= fun () ->
            Lwt_io.write outch (prepare_message msg) 
        end
    | ExpectMessage msg -> begin 
            Lwt_io.read inch >>= fun rmsg ->
            Lwt_io.printl ( "Received: " ^ rmsg) >>= fun () ->
            Lwt_io.printl ( "Expected: " ^ prepare_message msg) 
        end
    | ExpectAction Disconnect -> begin
            Lwt_io.printl ( "Disconnecting" ) >>= fun () ->
            Lwt_io.close inch  >>= fun () ->
            Lwt_io.close outch >>= fun () ->
            Lwt.return_unit    
        end
    | _ -> begin
            Lwt_io.printl ( "Unexpected action." ) >>= fun () ->
            Lwt_io.close inch  >>= fun () ->
            Lwt_io.close outch >>= fun () ->
            Lwt.return_unit    
        end
    end >>= fun () -> Lwt_unix.sleep 1.0

let setup_client msgs =
    let addr = Unix.( ADDR_INET( inet_addr_loopback , 9880 ) ) in
    Lwt_io.open_connection addr >>= fun (inch, outch) ->
    Lwt_io.printl "Connnection on localhost:9880 ..." >>= fun() ->
    Lwt_io.flush_all () >>= fun () ->
    perform_action (inch, outch) (List.hd msgs)
;;

let def_reader filename =
    let config_actions = parse_file filename in
    let rec scan = function
        | InitiateAction Connect :: tl -> setup_client tl
        | ExpectAction Connect :: tl -> failwith "Not implemented"
        | _ :: tl -> scan tl
        | [] -> Lwt.return_unit
        in
    scan config_actions
;;

let _ =
    def_reader "defs/10_MsgSeqNumEqual.def"
;;
