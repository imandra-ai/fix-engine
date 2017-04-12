(** JSON printers for engine model state. *)
(***
    
    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    fix_engine_json.ml

*)

(* @meta[imandra_ignore] on @end *)
open String;;
open Yojson;;
open Fix_engine;;
open Datetime_json;;
open Base_types_json;;
open Full_app_messages_json;;
open Full_messages_json;;
(* @meta[imandra_ignore] off @end *)

let fix_engine_mode_to_string = function
    | NoActiveSession                                   -> "NoActiveSession"
    | LogonInitiated                                    -> "LogonInitiated"
    | ActiveSession                                     -> "ActiveSession"
    | GapDetected                                       -> "GapDetected"
    | Recovery                                          -> "Recovery"
    | Retransmit                                        -> "Retransmit"
    | ShutdownInitiated                                 -> "ShutdownInitiated"
    | Error                                             -> "Error"
    | CacheReplay                                       -> "CacheReplay"
    | WaitingForHeartbeat                               -> "WaitingForHeartbeat"
;;

(* These are the messages going in/out of the engine to the owner. *)
let int_msg_to_json x : json = match x with
    | TimeChange t                                      -> `Assoc [ ( "time_change",    `Assoc [ ( "new_time"       , utctimestamp_to_json t )]             )]
    | CreateSession cs                                  -> `Assoc [ ( "create_session", `Assoc [ ( "dest_comp_id"   , `Int cs.dest_comp_id )]               )]
    | ApplicationData d                                 -> `Assoc [ ( "app_data",       `Assoc [ ( "msg"            , ( full_app_msg_to_json d) )] )]
    | ManualIntervention m                              -> `Assoc [ ( "man_inter",      `Assoc [ ( "reset"          , `Bool m.session_reset )]              )]
;;

let int_msg_to_str i = 
    Yojson.pretty_to_string (int_msg_to_json i)
;;

let int_msg_list_to_string ml =
    `List (List.map int_msg_to_json ml)
;;

let intmsg_opt_to_json : ( fix_engine_int_msg option -> Yojson.json) = 
    function None -> `Null | Some i -> int_msg_to_json (i)
;;

let fix_engine_state_to_json s = 
    `Assoc [ 
        ( "curr_mode"                                   , `String (fix_engine_mode_to_string s.fe_curr_mode)    );
        ( "initiator"                                   , bool_opt_to_json s.fe_initiator                       );
        ( "curr_time"                                   , utctimestamp_to_json s.fe_curr_time                   );
        ( "comp_id"                                     , `Int s.fe_comp_id                                     );
        ( "target_comp_id"                              , `Int s.fe_target_comp_id                              );
        ( "incoming_int_msgs"                           , intmsg_opt_to_json s.incoming_int_msg                 );
        ( "outgoing_int_msgs"                           , intmsg_opt_to_json s.outgoing_int_msg                 );
        ( "incoming_seq_num"                            , `Int s.incoming_seq_num                               );
        ( "outgoing_seq_num"                            , `Int s.outgoing_seq_num                               );
        ( "incoming_fix_msgs"                           , full_top_level_msg_opt_to_json s.incoming_fix_msg     );
        ( "outgoing_fix_msgs"                           , full_top_level_msg_opt_to_json s.outgoing_fix_msg     );
        ( "cache"                                       , full_msg_list_to_json s.fe_cache                      );
        ( "history"                                     , full_msg_list_to_json s.fe_history                    );
        ( "last_hearbeat_received"                      , utctimestamp_to_json s.fe_last_data_received          );
        ( "heartbeat_interval"                          , utcduration_to_json s.fe_heartbeat_interval           );
        ( "history_to_send"                             , full_msg_list_to_json s.fe_history_to_send            );
        ( "application_up"                              , `Bool s.fe_application_up                             );
    ]
;;

let engine_state_to_str s =
    Yojson.pretty_to_string (fix_engine_state_to_json s)
;;

let print_states states = 
    String.concat "\n" (List.map engine_state_to_str states)
;;
