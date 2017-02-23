(**

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017
    
    Implementation of the FIX 4.4 protocol. Verification goals - the base.

    fix_base_vgs.ml
*)


(* @meta[imandra_ignore] on @end *)
open Fix_engine;;
open Fix_data_dictionary;;
(* @meta[imandra_ignore] off @end *)

(** When in ActiveSession (normal mode) and receiving a non grabled and non session-level
    rejected message and the application is down. Such message would be sent back with a
    Business Reject. *)
verify app_down_get_biz_reject ( state : fix_engine_state ) =
    let incoming_biz_rejected =
       match state.incoming_fix_msg with
       | Some x -> not (x.reject_flags.garbled) && not (fix_is_msg_session_invalid (x))
       | None -> false in

    let no_incoming_msgs =
        match state.incoming_int_msg with
            | None -> true
            | Some _ -> false in

    let state' = one_step (state) in

    let result_biz_reject =
        match state'.outgoing_fix_msg with
        | None -> false
        | Some x ->
            match x.msg_data with
            | FIX_business_reject _ -> true
            | _ -> false
    in

    ( incoming_biz_rejected &&
    not (state.fe_application_up) &&
    state.fe_curr_mode = ActiveSession &&
    no_incoming_msgs)
    ==>
    result_biz_reject
;;

(** From Vol 2. Page 9. "In *ALL* cases except the Sequence Reset - message, the FIX session should be terminated
if the incoming sequence number is less than expected and the PossDupFlag is not set. A Logout
message with some descriptive text should be sent to the other side before closing the session." *)

(** TODO: should this just be a bool type? *)
let poss_dup_flag_not_set ( m : fix_message ) =
    match m.header.poss_dup_flag with
    | None -> true
    | Some _ -> false
;;


let is_msg_seq_reset ( x : fix_message ) =
    match x.msg_data with
    | FIX_sequence_reset _ -> true
    | _ -> false
;;

let incoming_msg_bad ( state : fix_engine_state ) =
  match state.incoming_fix_msg with
  | None -> false
  | Some m ->
     fix_msg_base_not_rejected (m) &&
       poss_dup_flag_not_set (m) &&

         (  is_msg_seq_reset (m) || ( m.header.msg_seq_num < state.incoming_seq_num ))
;;

verify less_seq_num_logout ( state : fix_engine_state ) =
    let no_incoming_internals =
        match state.incoming_int_msg with
        | None -> true
        | Some _ -> false in

    let state_good = not ( state.fe_application_up ) && ( state.fe_curr_mode = ActiveSession) in

    let state' = one_step (state) in

    let logout_sent =
        match state'.outgoing_fix_msg with
        | None -> false
        | Some m ->
            match m.msg_data with
            | FIX_logout _ -> true
            | _ -> false in

    ( no_incoming_internals && state_good && incoming_msg_bad (state) ) ==> logout_sent
;;

(** Messages that are garbled will be ignore (not sequence counter would be incremented) *)
(*let garbled_are_ignored ( state : fix_engine_state ) =
    let incoming_has_garbled = (
        false
    ) in

    let state' = one_step (state) in

    let msg_ignored =

    in
    let msg_seq_num_same = (state'.fe_msg_seq_num = state.fe_msg_seq_num) in

    incoming_has_garbled ==> msg_ignored
;;
*)

(** Session rejected messages are rejected with the right reason and
    counter is incremented. *)
(*
let session_rejects_are_rejected ( state : fix_engine_state ) =
    let incoming_has_reject = (
        match state.incoming_fix_msg with
        | None -> false
        | Some x -> (
            match
        )
    ) in

    let state' = one_step (state) in

    ) in
    let msg_rejected =
        match state'.outgoing_fix_msg with
        | None -> false
        | Some x ->
            match x.msg_data with
            | FIX_reject _ -> true
            | _ -> false in

    let seq_num_updated = ((state.fe_seq_num + 1) = state'.fe_seq_num) in

    incoming_has_reject ==> ( msg_rejected && seq_num_updated )
;;
*)
