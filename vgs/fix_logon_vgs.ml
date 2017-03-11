(** 

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    VGs covering behaviour of Logon message ( Vol 2, page 16 ).

    fix_logon_vgs.ml

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
    
    Logon VG.1


    "The logon message must be the first message sent by the application requesting to 
    initiate a FIX session."

    Note: we augment this with requirement that the engine correctly sets the acceptor/initiator
    flag.

*)
(** **************************************************************************************** *)

let incoming_int_create_session ( m, targetID : fix_engine_int_msg option * int ) = 
    match m with 
    | None      -> false
    | Some msg  ->
    match msg with
    | CreateSession data    -> data.dest_comp_id = targetID
    | _                     -> false
;;

let state_is_init ( engine : fix_engine_state ) =
    engine.incoming_seq_num = 1 && 
    engine.outgoing_seq_num = 1 && 
    engine.fe_initiator = None && 
    engine.fe_curr_mode = NoActiveSession && 
    engine.fe_curr_status = Normal && 
    engine.fe_history = [] && 
    engine.fe_cache = []
;;

let outbound_msg_logon ( m, targetID : full_top_level_msg option * int ) =
    match m with 
    | None      -> false
    | Some msg  -> 
    match msg with 
    | ValidMsg vmsg -> (
    let correct_target_id = vmsg.full_msg_header.h_target_comp_id = targetID in
    match vmsg.full_msg_data with 
    | Full_FIX_App_Msg _        -> false
    | Full_FIX_Admin_Msg amsg   -> 
    match amsg with 
    | Full_Msg_Logon _          -> correct_target_id
    | _                         -> false
    )
    | _             -> false
;;

verify logon_msg_is_first ( engine, targetID : fix_engine_state * int ) =
    let engine' = one_step ( engine ) in 
    ( state_is_init ( engine ) && 
    incoming_int_create_session ( engine.incoming_int_msg, targetID ) ) ==> 
    outbound_msg_logon ( engine'.outgoing_fix_msg, targetID )
;;

(** **************************************************************************************** *)
(**

    Logon VG.2

    "The session acceptor must be prepared to immediately begin processing messages after receipt 
    of the Logon. The session initiator can choose to begin transmission of FIX messages before 
    receipt of the confirmation Logon, however it is recommended that normal message delivery 
    wait until after the return Logon is received to accommodate encryption key negotiation."

    Notes: We take the strict interpretation (i.e. the recommendation in this case) that an
    application message may not be transmitted until counterparty replies with a Logon message
    ( in the case that the engine is the initiator ).

*)
(** **************************************************************************************** *)

