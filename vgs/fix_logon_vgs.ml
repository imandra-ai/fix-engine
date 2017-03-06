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


let incoming_int_create_session ( create_session : incoming_int_msg option ) {



}
;;


verify logon_msg_is_first ( engine : fix_engine_state ) =
    
    ( engine = init_fix_engine_state ) 

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

