(**

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017
    
    Verification goals: base vgs.

    fix_base_vgs.ml
*)


(* @meta[imandra_ignore] on @end *)
open Imandra_pervasives;;
open Datetime;;
open Basic_types;;
open Fix_engine;;
open Full_session_core;;
open Full_admin_messages;;
open Full_messages;;
(* @meta[imandra_ignore] off @end *)


(** **************************************************************************************** *)
(** 
    Base VG.1

    When in ActiveSession (normal mode) and receiving a non grabled and non session-level
    rejected message and the application is down. Such message would be sent back with a
    Business Reject. *)
(** **************************************************************************************** *)
let msg_is_biz_reject ( msg : full_top_level_msg option ) =
    match msg with
    | None          -> false
    | Some m        ->
    match m with 
    | ValidMsg msg_data    -> (
        match msg_data.full_msg_data with 
        | Full_FIX_Admin_Msg adm_msg    -> (
            match adm_msg with
            | Full_Msg_Business_Reject _    -> true
            | _                             -> false
        )
        | _ -> false
     )
    | _ -> false
;;

let msg_is_valid ( msg : full_top_level_msg option ) = 
    match msg with 
    | None          -> false
    | Some m        ->     
    match m with 
    | ValidMsg _    -> true
    | _             -> false
;;

verify app_down_get_biz_reject ( state : fix_engine_state ) =
    let incoming_biz_rejected = msg_is_valid ( state.incoming_fix_msg ) in 

    let no_incoming_msgs =
        match state.incoming_int_msg with
            | None      -> true
            | Some _    -> false in

    let state' = one_step (state) in

    let result_biz_reject = msg_is_biz_reject ( state'.outgoing_fix_msg ) in 

    ( state.fe_cache = [] &&
      incoming_biz_rejected && not (state.fe_application_up) &&
      state.fe_curr_mode = ActiveSession && no_incoming_msgs )
    ==> 
    result_biz_reject
;;

(** **************************************************************************************** *)
(** 
    Base VG.2

    From Vol 2. Page 9. "In *ALL* cases except the Sequence Reset - message, the FIX session 
    should be terminated if the incoming sequence number is less than expected and the 
    PossDupFlag is not set. A Logout message with some descriptive text should be sent to the 
    other side before closing the session." *)
(** **************************************************************************************** *)

(** TODO: should this just be a bool type? *)
let poss_dup_flag_not_set ( flag : bool option ) =
    match flag with
    | None -> true
    | Some _ -> false
;;

let incoming_msg_not_valid ( msg, state_inc_seq_num : full_top_level_msg option * int ) =
  match msg with
  | None            -> false
  | Some m          -> 
  match m with 
  | ValidMsg vmsg   -> (
      let seq_num_incorrect = vmsg.full_msg_header.h_msg_seq_num < state_inc_seq_num in
      let msg_is_seq_reset = 
      match vmsg.full_msg_data with 
      | Full_FIX_Admin_Msg admin_msg    -> (
            match admin_msg with 
            | Full_Msg_Sequence_Reset _ -> true
            | _                         -> false
      )
      | _   -> false in
      seq_num_incorrect && msg_is_seq_reset && 
      poss_dup_flag_not_set ( vmsg.full_msg_header.h_poss_dup_flag )
  ) 
  | _   -> false 
;;

let msg_is_logout ( msg : full_top_level_msg option ) = 
    match msg with 
    | None  -> false
    | Some m    ->
    match m with 
    | ValidMsg vmsg -> (
        match vmsg.full_msg_data with 
        | Full_FIX_Admin_Msg amsg -> ( 
            match amsg with 
            | Full_Msg_Logoff _ -> true
            | _ -> false
        )
        | _ -> false
     )
    | _ -> false
;;

verify less_seq_num_logout ( state : fix_engine_state ) =
    let no_incoming_int_msgs =
        match state.incoming_int_msg with
        | None -> true
        | Some _ -> false in

    let state_good = not ( state.fe_application_up ) && ( state.fe_curr_mode = ActiveSession ) in

    let state' = one_step (state) in

    ( no_incoming_int_msgs && state_good && state.fe_cache = [] &&
    incoming_msg_not_valid ( state.incoming_fix_msg, 1 ) ) 
    ==> msg_is_logout ( state'.outgoing_fix_msg )
;;

(** **************************************************************************************** *)
(** 
    Base VG.3

    Messages that are garbled will be ignore (not sequence counter would be incremented).
    
*)
(** **************************************************************************************** *)

let incoming_msg_garblged ( msg : full_top_level_msg option ) =
    match msg with 
    | None      -> false
    | Some m    ->
    match m with 
    | Gargled   -> true
    | _         -> false
;;

verify garbled_are_ignored ( state : fix_engine_state ) =
    let state' = one_step (state) in
    let msg_ignored = ( state' =  { state with incoming_fix_msg = None } ) in 
    let no_internal_msgs = state.incoming_int_msg = None in
    let no_cache_replay_or_retransmit = not ( state.fe_curr_mode = CacheReplay || state.fe_curr_mode = Retransmit ) in
    ( incoming_msg_garblged (state.incoming_fix_msg) && no_cache_replay_or_retransmit && no_internal_msgs ) ==> msg_ignored
;;


(** **************************************************************************************** *)
(** 
    Base VG.4

    Session rejected messages are rejected with the right reason and counter is incremented. *)
(** **************************************************************************************** *)

let incoming_msg_session_reject ( msg : full_top_level_msg option ) =
    match msg with 
    | None                  -> false
    | Some m                ->
    match m with 
    | SessionRejectedMsg _  -> true
    | _                     -> false
;;

let msg_is_reject ( msg : full_top_level_msg option ) =
    match msg with
    | None                  -> false
    | Some m                -> 
    match m with
    | ValidMsg vmsg         -> (
        match vmsg.full_msg_data with 
        | Full_FIX_Admin_Msg amsg -> ( 
            match amsg with 
            | Full_Msg_Reject _ -> true
            | _ -> false  
         )
        | _ -> false
     )
    | _ -> false
;;

verify session_rejects_are_rejected ( state : fix_engine_state ) =
    let incoming_rejected = incoming_msg_session_reject ( state.incoming_fix_msg ) in
    let state' = one_step (state) in
    let msg_rejected = msg_is_reject ( state'.outgoing_fix_msg ) in 
    let seq_num_updated = ( ( state.outgoing_seq_num + 1 ) = state'.outgoing_seq_num ) in

    incoming_rejected ==> ( msg_rejected && seq_num_updated )
;;

