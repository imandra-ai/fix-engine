(** 

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    VGs covering behaviour of Heartbeat message ( Vol 2, page 16 ).

    fix_heartbeat_vgs.ml

*)

(* @meta[imandra_ignore] one @end *)
open Imandra_pervasives;;
open Datetime;;
open Basic_types;;
open Fix_engine;;
open Full_admin_messages;;
open Full_session_core;;
open Full_messages;;
(* @meta[imandra_ignore] off @end *)


(** **************************************************************************************** *)
(**

    Heartbeat VG.1

    " When either end of a FIX connection has not sent any data for [HeartBtInt] seconds, it 
      will transmit a Heartbeat message."

*)
(** **************************************************************************************** *)

let outbound_msg_heartbeat ( m : full_top_level_msg option )=
    match m with 
    | None  -> false
    | Some msg  ->
    match msg with
    | ValidMsg vmsg -> (
        match vmsg.full_msg_data with 
        | Full_FIX_Admin_Msg admin_msg  -> (
            match admin_msg with 
            | Full_Msg_Hearbeat _   -> true
            | _                     -> false
        )
        | _ -> false
    )
    | _ -> false
;;

let time_update_received' ( m, last_time_received, hbeat_interval : fix_engine_int_msg option * fix_utctimestamp * fix_duration ) =
    match m with 
    | None  -> false
    | Some mint -> 
    match mint with 
    | TimeChange tc_data -> 
        let valid_time = utctimestamp_add ( last_time_received, hbeat_interval ) in
        utctimestamp_lessThanEqual ( valid_time, tc_data )
    | _ -> false 
;;

verify hbeat_sent_if_no_data_received' ( engine : fix_engine_state ) =
    let engine' = one_step ( engine ) in 
    time_update_received' ( engine.incoming_int_msg, engine.fe_last_data_recived, engine.fe_heartbeat_interval )
    ==> outbound_msg_heartbeat ( engine'.outgoing_fix_msg )
;;

(** **************************************************************************************** *)
(**

    Heartbeat VG.2

    "When either end of the connection has not received any data for (HeartBtInt + “some reasonable
    transmission time”) seconds, it will transmit a Test Request message."

    Notes: 

*)
(** **************************************************************************************** *)



let msg_is_test_request ( m : full_top_level_msg option ) =
    match m with 
    | None          -> false
    | Some msg      ->
    match msg with
    | ValidMsg vmsg -> (
        match vmsg.full_msg_data with 
        | Full_FIX_Admin_Msg admin_msg  -> (
            match admin_msg with 
            | Full_Msg_Hearbeat _       -> true
            | _                         -> false
        )
        | _                             -> false
    )
    | _                                 -> false
;;

let testrequest_sent_out ( engine : fix_engine_state ) =
    true
;;

(** **************************************************************************************** *)
(**

    Heartbeat VG.3

    "If there is still no Heartbeat message received after (HeartBtInt + “some reasonable 
    transmission time”) seconds then the connection should be considered lost and corrective 
    action be initiated."

    Notes: note sure what 'corrective action be initiated' means, here we interpret it 
    as meaning that a logoff message to be sent out, session closed and 'status' of the engine
    state set to 'ConnTerminatedWithoutLogoff'. 
*)
(** **************************************************************************************** *)

(** **************************************************************************************** *)
(**

    Heartbeat VG.4

    "If HeartBtInt is set to zero then no regular heartbeat messages will be generated. Note 
    that a test request message can still be sent independent of the value of the HeartBtInt,
    which will force a Heartbeat message."

    Notes: We implement 'test request message can still be sent independent of the value 
        of the HeartBtInt' as internal message.

*)
(** **************************************************************************************** *)





(** **************************************************************************************** *)
(**

    Heartbeat VG.5

    "Heartbeats issued as the result of Test Request must contain the TestReqID transmitted in 
    the Test Request message. This is useful to verify that the Heartbeat is the result of the 
    Test Request and not as the result of a regular timeout. "

    Notes: 

*)
(** **************************************************************************************** *)

