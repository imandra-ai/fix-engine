(** 

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    The following verification goals were derived from the table
    on page 9 with description on how messages would be handled.

    fix_seq_num_vgs.ml

*)

(* @meta[imandra_ignore] on @end *)
open Imandra_pervasives;;
open Datetime;;
open Basic_types;;
open Fix_engine;;
open Full_admin_messages;;
open Full_messages;;
(* @meta[imandra_ignore] off @end *)


(** **************************************************************************************** *)
(** 
    SeqNum VG.1

    Logon : "Must always be the first message transmitted. Authenticate and accept the
        connection. After sending a Logon confirmation back, send a
        ResendRequest if a message gap was detected in the Logon sequence
        number."
 
    We check that we either are responding from an internal request to initiate a session,
        thus sending out a Logon message, or we're responding to a request from the
        counterparty engine. *)
(** **************************************************************************************** *)

let is_msg_logon ( msg : full_top_level_msg option ) =
    match msg with 
    | None          -> false
    | Some m        -> 
    match m with 
    | ValidMsg msg_data -> (
        match msg_data.full_msg_data with 
        | Full_FIX_Admin_Msg adm_msg -> (
            match adm_msg with 
            | Full_Msg_Logon _ -> true
            | _ -> false
         )
        | _ -> false
     )
    | _ -> false
;;

let no_msg ( msg : full_top_level_msg option ) =
    match msg with 
    | None  -> true
    |  _    -> false
;;

verify logon_msg_first ( state : fix_engine_state ) =
    let incoming_msg_create_session = 
        match state.incoming_int_msg with 
        | None -> false
        | Some m -> match m with 
            | CreateSession _ -> true
            | _ -> false in

    let incoming_fix_valid_logon = is_msg_logon ( state.incoming_fix_msg ) in
    
    let state' = one_step(state) in
    let next_msg_logon = is_msg_logon ( state'.outgoing_fix_msg ) in 

    (( incoming_msg_create_session || incoming_fix_valid_logon ) && 
        state.fe_cache = [] && no_msg (state.outgoing_fix_msg) )
    ==> next_msg_logon
 ;;

(** **************************************************************************************** *)
(** 
    SeqNum VG.2

    SeqReset-Reset: 
        "Ignore the incoming sequence number. The NewSeqNo field of the SeqReset
         message will contain the sequence number of the next message to be transmitted."    *)
(** **************************************************************************************** *)



(** **************************************************************************************** *)
(** 
    SeqNum VG.3

    All Other Messages : "Perform Gap Fill operations."

    Application messages that result in a gap, we'll transition into gap fill state.         *)
(** **************************************************************************************** *)
