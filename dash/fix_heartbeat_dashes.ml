(** 

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    Dash versions of VGs covering behaviour of Heartbeat message ( Vol 2, page 16 ).

    fix_heartbeat_dashes.ml

*)

(* @meta[imandra_ignore] on @end *)
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
let last_time_data_sent_gets_updated ( engine : fix_engine_state ) =
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
            | Full_Msg_Hearbeat _       -> true
            | Full_Msg_Test_Request _   -> true
            | _                         -> false
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

let hbeat_sent_if_no_data_received ( engine : fix_engine_state ) =
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
    We interpret this here as that a Non-garbled message results in update of data received.
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

let non_grabled_updates_clock ( engine : fix_engine_state ) =
    let engine' = one_step (engine) in 
    let received_ts_correct =  ( engine.fe_curr_time = engine'.fe_last_data_received ) in 
    let incoming_processed = engine.incoming_fix_msg <> engine'.incoming_fix_msg in 
    ( incoming_is_not_gargled ( engine.incoming_fix_msg ) && incoming_processed) ==> received_ts_correct
;;

(** **************************************************************************************** *)
(**

    Heartbeat VG.3

    'When either end of the connection has not received any data for (HeartBtInt + “some 
    reasonable transmission time”) seconds, it will transmit a Test Request message.'


    Notes: 'reasonable time' is represented by a 'duration' type field 'fe_testreq_interval'.
*)
(** **************************************************************************************** *)

let no_heartbeats_received ( m, data_received, hbeat_interval, pad_interval : fix_engine_int_msg option * fix_utctimestamp * fix_duration * fix_duration ) =
    match m with
    | None -> false
    | Some mint -> 
    match mint with 
    | TimeChange tc_data -> 
        let valid_time = utctimestamp_add ( data_received, hbeat_interval ) in
        let valid_time_padded = utctimestamp_add ( valid_time, pad_interval ) in
        utctimestamp_greaterThan ( tc_data, valid_time_padded )
    | _ -> false
;;

let msg_is_test_request ( m : full_top_level_msg option ) =
    match m with 
    | None  -> false
    | Some msg ->
    match msg with
    | ValidMsg vmsg -> (
        match vmsg.full_msg_data with 
        | Full_FIX_Admin_Msg admin_msg  -> (
            match admin_msg with 
            | Full_Msg_Test_Request _  -> true
            | _ -> false
        )
        | _ -> false
    )
    | _ -> false
;;

let test_request_sent_out ( engine : fix_engine_state ) =
    let engine' = one_step ( engine ) in
    ( is_int_message_valid ( engine ) &&
      is_state_valid ( engine ) &&
      engine.fe_curr_status = Normal && 
      engine.fe_curr_mode = ActiveSession && 
      no_heartbeats_received ( engine.incoming_int_msg, engine.fe_last_data_received, engine.fe_heartbeat_interval, engine.fe_testreq_interval ) )
    ==> 
    msg_is_test_request ( engine'.outgoing_fix_msg )
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

let no_heartbeats_received_logoff ( m, data_sent_out, hbeat_interval, pad_interval : fix_engine_int_msg option * fix_utctimestamp * fix_duration * fix_duration ) =
    match m with
    | None -> false
    | Some mint -> 
    match mint with 
    | TimeChange tc_data -> 
        let valid_time = utctimestamp_add ( data_sent_out, hbeat_interval ) in
        let valid_time_padded = utctimestamp_add ( valid_time, pad_interval ) in
        utctimestamp_greaterThan ( tc_data, valid_time_padded )
    | _ -> false
;;

let no_response_logoff ( engine : fix_engine_state ) =
    let engine' = one_step ( engine ) in 
    
    ( is_int_message_valid ( engine ) &&
      is_state_valid ( engine ) &&
      engine.fe_curr_mode = WaitingForHeartbeat && 
      no_heartbeats_received ( engine.incoming_int_msg, engine.fe_last_time_data_sent, engine.fe_heartbeat_interval, engine.fe_testreq_interval ) )
    ==> 
    ( engine'.fe_curr_mode = NoActiveSession && 
      engine'.fe_curr_status = ConnTerminatedWithoutLogoff )
;;



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

(*
verify regular_heartbeat_msgs ( engine : fix_engine_state ) = 

    hbeat_interval_null ( engine.fe_heartbeat_interval ) ==>     

;;
 *)

let hbeat_sent_if_no_data_received_new ( engine : fix_engine_state ) =
    let engine' = one_step ( engine ) in 
    ( engine.fe_curr_mode = ActiveSession && 
    is_valid_utctimestamp ( engine.fe_last_data_received ) && 
    is_int_message_valid ( engine) && is_state_valid ( engine ) && 
    time_update_received ( engine.incoming_int_msg, engine.fe_last_data_received, engine.fe_heartbeat_interval ) )
    ==> outbound_msg_heartbeat ( engine'.outgoing_fix_msg )
;;

(** **************************************************************************************** *)
(**

    Heartbeat VG.6

    "Heartbeats issued as the result of Test Request must contain the TestReqID transmitted in 
    the Test Request message. This is useful to verify that the Heartbeat is the result of the 
    Test Request and not as the result of a regular timeout."

    Note: that the sequence number of the TestRequest message must be correct so that the state
        does not transition into Recovery.

*)
(** **************************************************************************************** *)

let msg_is_test_request_id ( m, tr_id, seq_num : full_top_level_msg option * int * int ) =
    match m with 
    | None  -> false
    | Some msg ->
    match msg with
    | ValidMsg vmsg -> seq_num = vmsg.full_msg_header.h_msg_seq_num && (
        match vmsg.full_msg_data with 
        | Full_FIX_Admin_Msg admin_msg  -> (
            match admin_msg with 
            | Full_Msg_Test_Request data -> data.test_req_id = tr_id
            | _ -> false
        )
        | _ -> false
    )
    | _ -> false
;;

let correct_hbeat_sent ( m, tr_id : full_top_level_msg option * int ) =
    match m with
    | None -> false
    | Some msg ->
    match msg with 
    | ValidMsg vmsg -> (
        match vmsg.full_msg_data with 
        | Full_FIX_Admin_Msg admin_msg  -> (
            match admin_msg with 
            | Full_Msg_Hearbeat data ->  (
                match data.hb_test_req_id with 
                | None -> false
                | Some x -> x = tr_id
            )
            | _ -> false
        )
        | _ -> false
    )
    | _ -> false
;;

let heartbeat_has_correct_id ( test_req_id, engine : int * fix_engine_state ) =
    let engine' = one_step ( engine ) in 
    (   test_req_id > 0 && 
        engine.incoming_int_msg = None && 
        engine.fe_curr_mode = ActiveSession && 
        engine.fe_application_up && 
        msg_is_test_request_id ( engine.incoming_fix_msg, test_req_id, engine.incoming_seq_num + 1) )
    ==> correct_hbeat_sent ( engine'.outgoing_fix_msg, test_req_id )
;;

