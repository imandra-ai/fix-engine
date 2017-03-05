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

    "When either end of a FIX connection has not sent any data for [HeartBtInt] seconds, it 
      will transmit a Heartbeat message."

    Notes: we transform this statement into 2 VGs:
        - VG.1.1 -- any outbound message will result in an updated 'fe_last_time_data_sent' field
        - VG.1.2 -- any time update will result in check whether Heartbeat should be sent out
*)
(** **************************************************************************************** *)

(** VG.1.1 *)
verify last_time_data_sent_gets_updated ( engine : fix_engine_state ) =
    let engine' = one_step ( engine ) in
    ( engine.outgoing_fix_msg = None && engine'.outgoing_fix_msg <> None ) 
    ==> (engine'.fe_last_time_data_sent = engine'.fe_curr_time )
;;


(** VG.1.2 *)

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

let time_update_received ( m, last_time_data_sent, hbeat_interval : fix_engine_int_msg option * fix_utctimestamp * fix_duration ) =
    match m with 
    | None -> false
    | Some mint -> 
    match mint with 
    | TimeChange tc_data -> 
        let valid_time = utctimestamp_add ( last_time_data_sent, hbeat_interval ) in
        utctimestamp_greaterThan ( tc_data, valid_time )
    | _ -> false
;;

verify hbeat_sent_if_no_data_received_new ( engine : fix_engine_state ) =
    let engine' = one_step ( engine ) in ( 
    engine.fe_curr_mode = ActiveSession && 
    is_int_message_valid ( engine) && 
    is_state_valid ( engine ) && 
    time_update_received ( engine.incoming_int_msg, engine.fe_last_time_data_sent, engine.fe_heartbeat_interval ) )
    
    ==> outbound_msg_heartbeat ( engine'.outgoing_fix_msg )
;;

(** **************************************************************************************** *)
(**

    Heartbeat VG.2

    Notes: there's no mention of what constitutes a successful data -
    i.e. is it a non-garbled (but still rejected message)? 
    We interpret this here as thatNon-garbled message results in update of data received.
    Also, it's important to note that we would not process an incoming message if the engine
    is in a Retransmit or CacheReplay mode, hence we use 
    'let incoming_processed = engine.incoming_fix_msg <> engine'.incoming_fix_msg' 

*)
(** **************************************************************************************** *)

let incoming_is_not_gargled ( m : full_top_level_msg option ) = 
    match m with 
    | None -> false
    | Some msg ->
    match msg with
    | Gargled -> false
    | _ -> true
;;

verify non_grabled_updates_clock ( engine : fix_engine_state ) =
    let engine' = one_step (engine) in 
    let received_ts_correct =  ( engine.fe_curr_time = engine'.fe_last_data_recived ) in 
    let incoming_processed = engine.incoming_fix_msg <> engine'.incoming_fix_msg in 
    ( incoming_is_not_gargled ( engine.incoming_fix_msg ) && incoming_processed) ==> received_ts_correct
;;


(** **************************************************************************************** *)
(**

    Heartbeat VG.3

    'When either end of the connection has not received any data for (HeartBtInt + “some reasonable
    transmission time”) seconds, it will transmit a Test Request message.'


    Notes: we transform this statement into 3 VGs:
        -- 


*)
(** **************************************************************************************** *)


(**  *)


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




(** **************************************************************************************** *)
(**

    Heartbeat VG.4

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

    Heartbeat VG.5

    "If HeartBtInt is set to zero then no regular heartbeat messages will be generated. Note 
    that a test request message can still be sent independent of the value of the HeartBtInt,
    which will force a Heartbeat message."

    Notes: We implement 'test request message can still be sent independent of the value 
        of the HeartBtInt' as internal message.

*)
(** **************************************************************************************** *)


let field_null ( f : int option ) =
    match f with 
    | None      -> true
    | Some x    -> x = 0
;;

let hbeat_interval_null ( interval : fix_duration ) =
    field_null ( interval.dur_years )   &&
    field_null ( interval.dur_months )  && 
    field_null ( interval.dur_days )    && 
    field_null ( interval.dur_hours )   &&
    field_null ( interval.dur_minutes ) &&
    field_null ( interval.dur_seconds )
;;

verify regular_heartbeat_msgs ( engine : fix_engine_state ) = 

    hbeat_interval_null ( engine.fe_heartbeat_interval ) ==>     

;;


verify hbeat_sent_if_no_data_received_new ( engine : fix_engine_state ) =
    let engine' = one_step ( engine ) in 
    ( engine.fe_curr_mode = ActiveSession && 
    is_valid_utctimestamp ( engine.fe_last_data_recived ) && 
    is_int_message_valid ( engine) && is_state_valid ( engine ) && 
    time_update_received ( engine.incoming_int_msg, engine.fe_last_data_recived, engine.fe_heartbeat_interval ) )
    ==> outbound_msg_heartbeat ( engine'.outgoing_fix_msg )
;;

(** **************************************************************************************** *)
(**

    Heartbeat VG.6

    "Heartbeats issued as the result of Test Request must contain the TestReqID transmitted in 
    the Test Request message. This is useful to verify that the Heartbeat is the result of the 
    Test Request and not as the result of a regular timeout. "

    Notes: 

*)
(** **************************************************************************************** *)

