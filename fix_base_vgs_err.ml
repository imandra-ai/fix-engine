(**

    See comment at the beginning of fix_err.ml.
    This file shall soon be deleted.

    --

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    Implementation of the FIX 4.4 protocol. Verification goals - the base.

    fix_base_vgs_err.ml
*)


(* @meta[imandra_ignore] on @end *)
open Fix_engine;;
open Fix_data_dictionary;;
(* @meta[imandra_ignore] off @end *)

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

(* A small example that exhibits the untyped NIL issue. *)

check _ ( state : fix_engine_state ) =

  let state_good = true in

  let incoming_msg_bad =
    match state.incoming_fix_msg with
    | None -> false
    | Some m ->
       fix_msg_base_not_rejected (m) &&
         poss_dup_flag_not_set (m) &&
           (  is_msg_seq_reset (m) || ( m.header.msg_seq_num < state.incoming_seq_num ))
  in

  let logout_sent = false in

  ( state_good && incoming_msg_bad ) ==> logout_sent
;;

(* The original VG exhibiting the untyped NIL issue. *)

verify less_seq_num_logout ( state : fix_engine_state ) =
  let no_incoming_internals =
    match state.incoming_int_msg with
    | None -> true
    | Some _ -> false in

  let state_good = not ( state.fe_application_up ) && ( state.fe_curr_mode = ActiveSession) in

  let state' = one_step (state) in

  let incoming_msg_bad =
    match state.incoming_fix_msg with
    | None -> false
    | Some m ->
       fix_msg_base_not_rejected (m) &&
         poss_dup_flag_not_set (m) &&
           (  is_msg_seq_reset (m) || ( m.header.msg_seq_num < state.incoming_seq_num ))
  in

  let logout_sent =
    match state'.outgoing_fix_msg with
    | None -> false
    | Some m ->
       match m.msg_data with
       | FIX_logout _ -> true
       | _ -> false in

  ( no_incoming_internals && state_good && incoming_msg_bad ) ==> logout_sent
;;
