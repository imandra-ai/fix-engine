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

let utc_timestamp_to_wire ts =
    let open Datetime in 
    Printf.sprintf "%04u%02u%02u-%02u:%02u:%02u.000" 
        ts.utc_timestamp_year 
        ts.utc_timestamp_month 
        ts.utc_timestamp_day
        ts.utc_timestamp_hour
        ts.utc_timestamp_minute
        ts.utc_timestamp_second
;;

let body_length msg =
    let rec scan n msg = match msg with
        | ( "8", _ )::tl 
        | ( "9", _ )::tl -> scan n tl
        | ("10", _ )::tl -> n
        | (  k , v )::tl -> n + scan String.(length k + length v + 2) tl
        | [] -> n in 
    scan 0 msg 
;;
let checksum msg =
    let checksum s = 
        let rec chsum i v =
            if i < 0 then v else chsum (i - 1) (Char.code s.[i] + v)  in
        chsum (String.length s - 1) 0 
    in
    let rec scan n msg = match msg with
        | ("10", v )::tl -> n mod 256
        | (  k , v )::tl -> scan (checksum k + checksum v + 62 + n) tl
        | [] -> n mod 256 in 
    scan 0 msg
;;

let logon_msg seq_num = 
    let timestamp = get_current_utctimstamp () |> utc_timestamp_to_wire in
    let seq_num = seq_num |> string_of_int in
    let msg = [ 
        ( "35"  , "A"       ); 
        ( "34"  , seq_num   ); 
        ( "49"  , "EXEC"    );
        ( "52"  , timestamp );
        ( "56"  , "BANZAI"  );
        ( "98"  , "0"       );
        ( "108" , "30"      )] in  
    let bl = msg |> body_length |> string_of_int in
    let msg = ("8", "FIX.4.4")::( "9", bl)::msg in
    let cs = checksum msg |> string_of_int in
    msg @ [("10", cs )]
        |> List.map ( fun(k,v) -> k^"="^v )
        |> List.fold_left ( fun a s -> a ^ s ^ "\001" ) ""
;;

let is_logon_msg m =
    let logon_tag = 
        Full_message_tags.Full_Admin_Msg_Tag 
            Full_admin_tags.Full_Msg_Logon_Tag in
    let open Full_messages in
    match m with 
        | ValidMsg x -> get_full_msg_tag x.full_msg_data = logon_tag
        | _ -> false
;;


let get_seq_num m =
    let open Full_messages in
    match m with 
        | ValidMsg x -> x.full_msg_header.h_msg_seq_num 
        | _ -> 0
;;


