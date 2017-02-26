(** 

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    JSON printers for admin and app messages.
    
    fix_msg_json.ml

*)

open Yojson
open List
open Full_messages
open Fix_admin_msg_json
open Fix_app_msg_json


let full_fix_msg_opt_to_json : ( full_fix_msg option -> Yojson.Basic.json) = 
    function None -> `Null | Some m -> full_fix_msg_to_json (m)
;;

let full_top_level_msg_to_json m = function
    | ValidMsg x                                        -> `Assoc [ ( "valid_msg",          full_fix_msg_to_json x ) ]
    | SessionRejectedMsg x                              -> `Assoc [ ( "session_rejected",   session_rejected_data_to_json x ) ]
    | BusinessRejectedMsg x                             -> `Assoc [ ( "business_rejected",  bussiness_rejected_msg_to_json x ) ]
    | Gargled                                           -> `String "Gargled"
;;

let full_top_level_msg_to_str m =
    Yojson.Basic.pretty_to_string (full_top_level_msg_to_json m)
;;

let fill_top_level_msg_list_to_string msgs = 
    String.concat "\n" (List.map full_top_level_msg_to_str msgs)
;;