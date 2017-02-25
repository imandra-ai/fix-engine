(** 

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    Implementation of the FIX 4.4 engine.

    The following verification goals were derived from the table
    on page 9 with description on how messages would be handled.

    fix_seq_num_vgs.ml

*)

(* @meta[imandra_ignore] on @end *)
open Fix_engine;;
open Fix_data_dictionary;;
(* @meta[imandra_ignore] off @end *)

(** Logon : "Must always be the first message transmitted. Authenticate and accept the
        connection. After sending a Logon confirmation back, send a
        ResendRequest if a message gap was detected in the Logon sequence
        number."
 
    We check that we either are responding from an internal request to initiate a session,
        thus sending out a Logon message, or we're responding to a request from the
        counterparty engine. *)

verify logon_msg_first ( state : fix_engine_state ) =
    
    let incoming_msg_create_session = 
        match state.incoming_int_msg with 
        | None -> false
        | Some m -> match m with 
            | CreateSession _ -> true
            | _ -> false in

    let incoming_fix_valid_logon =
        match state.incoming_fix_msg with
        | None -> false
        | Some m -> match m.msg_data with 
            | FIX_logon _ -> true
            | _ -> false in
    
    let state' = one_step(state) in

    let next_msg_logon =
        match state'.outgoing_fix_msg with 
        | None -> false
        | Some m -> match m.msg_data with
            | FIX_logon _ -> true
            | _ -> false in

    ( incoming_msg_create_session || incoming_fix_valid_logon ) && state.fe_cache = [] ==> next_msg_logon
 ;;


 (**
    SeqReset-Reset: "Ignore the incoming sequence number. The NewSeqNo field of the SeqReset
                    message will contain the sequence number of the next message to be transmitted."
*)


(** 
    All Other Messages : "Perform Gap Fill operations."

    Application messages that result in a gap, we'll transition into gap fill state.
*)
