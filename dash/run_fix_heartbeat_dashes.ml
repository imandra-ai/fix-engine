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

dash _ ( engine : fix_engine_state ) = last_time_data_sent_gets_updated ( engine ) ;;
dash _ ( engine : fix_engine_state ) = hbeat_sent_if_no_data_received ( engine ) ;;
dash _ ( engine : fix_engine_state ) = non_grabled_updates_clock ( engine ) ;;
dash _ ( engine : fix_engine_state ) = test_request_sent_out ( engine ) ;;
dash _ ( engine : fix_engine_state ) = no_response_logoff ( engine ) ;;
dash _ ( test_req_id, engine : int * fix_engine_state ) = heartbeat_has_correct_id ( test_req_id, engine ) ;;
