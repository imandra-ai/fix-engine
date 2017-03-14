(**

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    Dash version:

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


dash _ ( state : fix_engine_state ) = app_down_get_biz_reject state ;;
dash _ ( state : fix_engine_state ) = less_seq_num_logout state ;;
dash _ ( state : fix_engine_state ) = garbled_are_ignored state ;;
dash _ ( state : fix_engine_state ) = session_rejects_are_rejected state ;;
dash _ ( state : fix_engine_state ) = skipped_heartbeat_causes_logout state ;;
dash _ ( state : fix_engine_state ) = heartbeat_updated_correctly state ;;
dash _ ( state : fix_engine_state ) = heartbeat_sent_out_correctly state ;;
