(** 
    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    Implementation of the FIX 4.4 engine. Printers/parsers.

    fix_engine_pp.ml
*)

open Fix_pp
open Fix_engine
open Yojson

let fix_engine_mode_to_string = function
    | NoActiveSession       -> "NoActiveSession"
    | LogonInitiated        -> "LogonInitiated"
    | ActiveSession         -> "ActiveSession"
    | Recovery              -> "Recovery"
    | Retransmit            -> "Retransmit"
    | ShutdownInitiated     -> "ShutdownInitiated"
    | Error                 -> "Error"
    | CacheReplay           -> "CacheReplay"
;;

(* These are the messages going in/out of the engine to the owner. *)
let int_msg_to_json = function
    | TimeChange t          ->  `Assoc [ ( "time_change",       `Assoc [ ( "new_time", `Int t)] )]
    | CreateSession cs      ->  `Assoc [ ( "create_session",    `Assoc [ ( "dest_comp_id", `Int cs.dest_comp_id )])]
    | ApplicationData d     ->  `Assoc [ ( "app_data",          `Assoc [ ( "msg", (msg_data_to_json d) )])]
    | ManualIntervention m  ->  `Assoc [ ( "man_inter",         `Assoc [ ( "reset", `Bool m.session_reset)])]
;;

let int_msg_to_str i = 
    Yojson.Basic.pretty_to_string (int_msg_to_json i)
;;

let int_msg_list_to_string ml =
    `List (List.map int_msg_to_json ml)
;;

let intmsg_opt_to_json : ( fix_engine_int_msg option -> Yojson.Basic.json) = 
    function None -> `Null | Some i -> int_msg_to_json (i)
;;

let fix_engine_state_to_json s = 
    `Assoc [ 
        ( "curr_mode",              `String (fix_engine_mode_to_string s.curr_mode));
        ( "initiator",              (boolopt_to_json s.initiator));
        ( "curr_time",              `Int s.curr_time);
        ( "comp_id",                `Int s.comp_id);
        ( "target_comp_id",         `Int s.target_comp_id);
        ( "incoming_int_msgs",      (intmsg_opt_to_json s.incoming_int_msg));
        ( "outgoing_int_msgs",      (intmsg_opt_to_json s.outgoing_int_msg));
        ( "incoming_seq_num",       `Int s.incoming_seq_num);
        ( "outgoing_seq_num",       `Int s.outgoing_seq_num);
        ( "incoming_fix_msgs",      (fixmsg_opt_to_json s.incoming_fix_msg));
        ( "outgoing_fix_msgs",      (fixmsg_opt_to_json s.outgoing_fix_msg));
        ( "cache",                  (msg_list_to_json s.cache));
        ( "history",                (msg_list_to_json s.history));
        ( "last_hearbeat_received", `Int s.last_hbeat_recived);
        ( "heartbeat_interval",     `Int s.heartbeat_interval);
        ( "history_to_send",        (msg_list_to_json s.history_to_send));
    ]
;;

let engine_state_to_str s =
    Yojson.Basic.pretty_to_string (fix_engine_state_to_json s)
;;