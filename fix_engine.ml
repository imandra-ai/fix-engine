(** 

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    Implementation of the FIX 4.4 engine.

    High-level TODOs:
    -- Concept of a 'frame' --> how any two systems should communicate with each other 
        within a single time frame.

    -- Implement basic types from the FIX spec.

    fix_engine.ml
*)

(** Module depends on FIX4.4 data dictionary. *)
open Imarkets;;
open Fix_data_dictionary;;  (* Note this may be generated for DSL-based FIX engines *)

(* Define set of actions + data for manual intervention by the user. *)
type manual_int_data = {
    session_reset : bool;                       (* Should we reset the engine? *)
};;

(* Request to initiate a session. *)
type session_data = {
    dest_comp_id : int;                         (* Destination company ID. *)
};;

(* These are internal messages into the Engine. *)
type fix_engine_int_msg = 
    | TimeChange of int                         (* TODO change this to appropriate time datatype. *)
    | CreateSession of session_data             (* Create sessions command. *)
    | ApplicationData of fix_msg_data           (* These should only be Application message data types. See 'is_admin_msg'.  *)
    | ManualIntervention of manual_int_data     (* TODO Define what can be done here. *)
;;

(* Represents 'modes' of the engine.            *)
type fix_engine_mode =      
    | NoActiveSession                           (* State of the engine before logon *)
    | LogonInitiated                            (* Middle of logon session. *)
    | ActiveSession                             (* Application messages are now processed *)
    | Recovery                                  (* In recovery mode because we've detected out-of-sequence message. *)
    | CacheReplay                               (* We're in the middle of replaying the cache *)
    | Retransmit                                (* In the middle of retransmitting sequence of messages because 
                                                    we were asked to retransmit. *)
    | ShutdownInitiated                         (* Shutting-down protocol. *)
    | Error                                     (* We've received a non-dup message with earlier sequence number. *)
;;

(** Structure containing state of the FIX engine. 

    TODO We need to change the incoming/outgoing messages queues to 
        be 'msg option' types, otherwise test suite generation becomes
        too difficult, it also forces design to be more 'one-step'-like.
*)
type fix_engine_state = {
    curr_mode           : fix_engine_mode;              (* High-level mode of the engine. *)

    initiator           : bool option;                  (* initiator = True if we've received an internal message to initiate 
                                                            the connection. It's False if we've received a Logon request first.
                                                            It's None by default prior to any Logon sequences. *)

    curr_time           : int;                          (* Need to define time so we're aware of heartbeat status. *)

    comp_id             : int;                          (* Our company ID *)
    target_comp_id      : int;                          (* Target company ID *)

    incoming_int_msg    : fix_engine_int_msg option;    (* Incoming internal messages (application). *)
    outgoing_int_msg    : fix_engine_int_msg option;    (* These are messages we send back to our owner *)

    incoming_seq_num    : int;                          (* Sequence number of the last processed incoming message. *)
    outgoing_seq_num    : int;                          (* Sequence number of the last sent message. *)

    incoming_fix_msg    : fix_message option;           (* Messages we will send out *)
    outgoing_fix_msg    : fix_message option;           (* Messages we receive *)

    cache               : fix_message list;             (* Maintain a cache of messages in case we detect out of sequence message. *)
    history             : fix_message list;             (* We maintain history of our outgoing messages in case we're asked to retransmit. *)

    last_hbeat_recived  : int;                          (* Last time we received a heartbeat message. *)
    heartbeat_interval  : int;                          (* Negotiated heartbeat interval. *)

    history_to_send     : fix_message list;             (* Used in message retransmission. *)
};;

(** Initial engine state. *)
let init_fix_engine_state = {

    initiator           = None;                         
    curr_mode           = NoActiveSession;              
    curr_time           = 0;                            

    comp_id             = 1;                            
    target_comp_id      = 2;

    incoming_int_msg    = None;                           
    outgoing_int_msg    = None;

    incoming_seq_num    = 0;                         
    outgoing_seq_num    = 1; 

    incoming_fix_msg    = None;
    outgoing_fix_msg    = None;

    cache               = [];
    history             = [];

    last_hbeat_recived  = 0;              
    heartbeat_interval  = -1;
    history_to_send     = [];
};;

(** 
    TODO Are there any other checks? 
    Answer: Yes - we need to add those checks to raw OCaml parser.
*)
let incoming_header_correct ( fh, comp_id : fix_header * int) =
    fh.target_comp_id = comp_id
;;

(**
    We're running within Logon sequence. Here's the specification: 
    
    " The initiator sends a Logon message.  The acceptor will authenticate the identity of the initiator by examining the Logon message.  
    The Logon message will contain the data necessary to support the previously agreed upon authentication method.   If the initiator 
    is successfully authenticated, the acceptor responds with a Logon message.  If authentication fails, the session acceptor should 
    shut down the connection after optionally sending a Logout message to indicate the reason of failure. Sending a Logout in this case 
    is not required because doing so would consume a sequence number for that session, which in some cases may be problematic.  The 
    session initiator may begin to send messages immediately following the Logon message, however, the acceptor may not be ready to 
    receive them. The initiator must wait for the confirming Logon message from the acceptor before declaring the session fully established.
	
    After the initiator has been authenticated, the acceptor will respond immediately with a confirming Logon message.  Depending on 
    the encryption method being used for that session, this Logon message may or may not contain the same session encryption key.  The 
    initiator side will use the Logon message being returned from the acceptor as confirmation that a FIX session has been established.  
    
    If the session acceptor has chosen to change the session encryption key, the session initiator must send a third Logon back to the 
    other side in order to acknowledge the key change request. This also allows the session acceptor to know when the session initiator 
    has started to encrypt using the new session key.  Both parties are responsible for infinite loop detection and prevention during 
    this phase of the session."
*)

let run_logon_sequence ( m, engine : fix_message * fix_engine_state ) =
    let engine' = {
        engine with incoming_fix_msg = None;
    } in
    if m.header.target_comp_id <> engine.comp_id then 
        engine'
    else
        match m.msg_data with 
        | FIX_logon d -> {
            engine' with 
                curr_mode = ActiveSession;
                incoming_seq_num = m.header.msg_seq_num;
         }
        | _ -> engine'
;;

(** We're in the middle of retransmitting historic messages. 
    Note: when we transition into Retransmit mode, we set up a 
    queue with messages that should be sent out. These messages are a function
    of the parameters that were sent to the engine. *)
let run_retransmit ( engine : fix_engine_state ) = 
    match engine.history_to_send with 
    | [] -> { engine with curr_mode = ActiveSession; } (* We're done - need to change mode. *)
    | x::xs -> {
            engine with 
                history_to_send = xs;
                outgoing_fix_msg = None;
        }
;;

(** Is the message with the right sequence number?

    This is when we need to transfer into Recovery Mode and request the 
    missing sequence to be retransmitted. *)
let msg_consistent ( engine, msg_header : fix_engine_state * fix_header ) = 
    let seq_num_correct = msg_header.msg_seq_num = (engine.incoming_seq_num + 1) in 
    match msg_header.poss_dup_flag with 
    | None -> seq_num_correct
    | Some dup -> dup || ((not dup) && seq_num_correct)
;;

(** Create outbound FIX message with the appropriate header and trailer. *)
let create_outbound_fix_msg ( engine, msg, is_duplicate ) = {
    header = {
        default_fix_header with 
            msg_seq_num = engine.outgoing_seq_num + 1;
            poss_dup_flag = Some is_duplicate;
            target_comp_id = engine.target_comp_id;
            sender_comp_id = engine.comp_id;
    };
    
    (* We're simply attaching the message data here. *)
    msg_data = msg;

    (** Trailers would be augmented by raw OCaml printers/parsers. *)
    trailer = {
        signature_length = 0;
        signature = 0;
        check_sum = 0;
    };
};;

(** Create a logon message we would send out to initiate a connection 
    with another FIX engine. *)
let create_logon_msg ( targetID, last_seq_num : int * int ) = {
        header = {
            default_fix_header 
                with msg_seq_num = last_seq_num + 1;
        };

        msg_data = FIX_logon {
            encrypt_method      = 1;
            heartbeat_interval  = 60;
            raw_data_length     = 1; 
        };
        
        (* This will be augmented by raw OCaml printer/parser library. *)
        trailer = default_fix_trailer;
    }
;;

(** Create a heartbeat message *)
let create_heartbeat_msg ( engine: fix_engine_state) =
    let msg_data = FIX_heartbeat {
        hb_test_req_id = None;
    } in 
    create_outbound_fix_msg ( engine, msg_data, false)
;;

(** ********************************************************************************************************** *)
(**  Mode transition functions.                                                                                *)
(** ********************************************************************************************************** *)

(** We reject anything here that's not an internal message (either time change or request to create a session) *)
let run_init_seq (engine : fix_engine_state) = 
    match engine.incoming_int_msg with 
    | None -> engine
    | Some x ->
        match x with 
        | TimeChange t -> { engine with curr_time = t }
        | CreateSession sd ->
            let msg = create_logon_msg (sd.dest_comp_id, engine.outgoing_seq_num) in { 
                engine with 
                    curr_mode           = LogonInitiated;
                    outgoing_fix_msg    = Some msg;
                    target_comp_id      = sd.dest_comp_id;
                    outgoing_seq_num    = engine.outgoing_seq_num + 1;
                    incoming_fix_msg    = None;
            } 
        | _ -> { engine with incoming_fix_msg = None }
;;

(** Here we will only accept an incoming Logon message to establish a connection. *)
let run_no_active_session (m, engine : fix_message * fix_engine_state) =
    match m.msg_data with 
    | FIX_logon d -> 
        let logon_msg = create_logon_msg (m.header.sender_comp_id, engine.outgoing_seq_num) in 
        { 
            engine with
                initiator = Some false;
                outgoing_fix_msg = Some logon_msg;
                outgoing_seq_num = logon_msg.header.msg_seq_num;
                target_comp_id = m.header.sender_comp_id;
                curr_mode = ActiveSession;            
        }
    | _ -> { 
        engine with 
            incoming_fix_msg = None 
    }
;;

(** ********************************************************************************************************** *)
(** We're operating in a normal mode.                                                                          *)
(** ********************************************************************************************************** *)
let run_active_session (m, engine : fix_message * fix_engine_state) = 
    if not (msg_consistent (engine, m.header)) then (
        (** We need to add it to the cache and transition to recovery mode. *)
        let cache' = [ m ] in { 
            engine with 
                curr_mode = Recovery;
                cache = cache';
        }
    ) else (** We should be processing this now. *) 
    if fix_is_admin_msg (m.msg_data) then (
        match m.msg_data with 
        | FIX_logout        lo -> engine
        | FIX_heartbeat     hb -> engine
        | _ -> engine
    ) else 
        (** We're processing an application type of message. We just need 
        to append it to the list of outgoing application messages and 
        update the last seq number processed. *) {
        engine with
            incoming_seq_num = m.header.msg_seq_num;
            outgoing_int_msg = Some (ApplicationData m.msg_data);
            incoming_fix_msg = None;
    }
;;

(* Here we can only handle a subset of the FIX messages. *)
let replay_single_msg (m, engine : fix_message * fix_engine_state) =
    if fix_is_msg_reject (m.msg_data) then 
        (* This is the only session-level type of message that we would
            process under these conditions. *)
        engine
    else if not (fix_is_admin_msg (m.msg_data)) then {
        engine with 
            incoming_seq_num = m.header.msg_seq_num;
            outgoing_int_msg = Some (ApplicationData m.msg_data);
        }
    else {
        engine with 
            incoming_seq_num = m.header.msg_seq_num;
    }
;; 

(** Run the engine through the replay messages. This is used during recovery. 

    Note that the only session-level message we should receive at this point
    should be a Reject message. We need to ensure that this function cannot 
    lead to another Recovery state. *)
let run_cache_replay (engine : fix_engine_state) = 
    match engine.cache with 
    | [] -> (* Nothing to process in cache, we've recovered *) {
        engine with
            curr_mode = ActiveSession;
        }
    | x::xs -> replay_single_msg (x, engine)
;;

(** Check to make sure there're no sequence gaps *)
let rec no_seq_gaps ( msg_list, last_seq_num : fix_message list * int) = 
    match msg_list with 
    | [] -> true
    | x::xs ->
        if x.header.msg_seq_num <> (last_seq_num + 1) then 
            false
        else
            no_seq_gaps ( xs, x.header.msg_seq_num )
;;

(** Is cache valid so that we can transition from recovery?

    Cache is considered valid when:
    1. It is non-empty
    2. The sequence IDs of the messages within cache are continuous (i.e. there're no gaps)
    3. First sequence ID (of the cache) is next message from the last one correctly
        processed. *)
let is_cache_complete (cache, last_seq_processed : fix_message list * int) = 
    match cache with 
    | [] -> false
    | x::xs -> 
        let correct_seq_num = x.header.msg_seq_num = (last_seq_processed + 1) in 
        let no_gaps = no_seq_gaps ( xs, x.header.msg_seq_num ) in 
        correct_seq_num && no_gaps
;;

(** Add message to cache so that ordering is maintained. *)
let rec add_to_cache (m, cache : fix_message * fix_message list) = 
    match cache with 
    | []        -> [ m ]
    | x::[]     -> if x.header.msg_seq_num > m.header.msg_seq_num then [m; x] else [ x; m ]
    | x::xs     -> if x.header.msg_seq_num > m.header.msg_seq_num then 
                    m::x::xs else x:: ( add_to_cache (m, xs) )
;;

(** We're in recovery mode. We should add any received messages to our cache.
    Check to see whether next message is complete. *)
let run_recovery (m, engine : fix_message * fix_engine_state) = 
    let new_cache = add_to_cache (m, engine.cache) in 
    if is_cache_complete (new_cache, engine.incoming_seq_num) then {
        engine with 
            curr_mode = CacheReplay;
            incoming_fix_msg = None;
    } else {
        engine with
            cache = new_cache;
            incoming_fix_msg = None;
    }
;;

(** We've sent out a Logout message and are now waiting for a confirmation. *) 
let run_shutdown (m, engine : fix_message * fix_engine_state) = 
    match m.msg_data with
    | FIX_logout x          ->  {
        engine with
            curr_mode = NoActiveSession;
    }
    | _                     -> run_active_session (m, engine)
;;

(* Process incoming internal transition message. *)
let proc_incoming_int_msg ( x, engine : fix_engine_int_msg * fix_engine_state) = 
    match x with 
    | TimeChange t          -> { engine with curr_time = t; incoming_int_msg = None; }
    | CreateSession sd      ->
        if engine.curr_mode = NoActiveSession then (
            (* Let's initiate a session here. *)
            let logon_msg = create_logon_msg ( sd.dest_comp_id, engine.outgoing_seq_num ) in { 
                engine with 
                    outgoing_fix_msg    = Some logon_msg;
                    curr_mode           = LogonInitiated;
                    initiator           = Some true;
                    incoming_fix_msg    = None;
                }
            ) 
        else 
        (* We just disregard it here - this may vary for different implementations. *)
            { engine with incoming_int_msg = None; }
        
    | ApplicationData ad    -> (
        match engine.curr_mode with 
        | ActiveSession     -> 
            let msg = create_outbound_fix_msg (engine, ad, false) in { 
                engine with 
                    outgoing_fix_msg = Some msg; 
                    incoming_int_msg = None;
                    outgoing_seq_num = msg.header.msg_seq_num;
            }
        | _                 ->
            (* TODO How should all of this be handled? *)
            { engine with incoming_int_msg = None }
        )
        
    | ManualIntervention mi -> 
        (* TODO implement this to have more detailed user data
            that would reset engine state. *)
        { engine with incoming_int_msg = None }
;;

(* A NO-OPeration *)
let noop (m, engine : fix_message * fix_engine_state) = { 
    engine
        with incoming_fix_msg = None
}
;;

(* Process incoming FIX message here. *)
let proc_incoming_fix_msg ( m, engine : fix_message * fix_engine_state) = 
    match engine.curr_mode with
    | NoActiveSession       -> run_no_active_session (m, engine)
    | LogonInitiated        -> run_logon_sequence (m, engine)
    | ActiveSession         -> run_active_session (m, engine)
    | Recovery              -> run_recovery (m, engine)
    | Retransmit            -> noop (m, engine)
    | ShutdownInitiated     -> run_shutdown (m, engine)
    | Error                 -> noop (m, engine)
    | CacheReplay           -> noop (m, engine)
;; 

(** This sets validity of the incoming internal messages. *)
let is_int_message_valid (engine, int_msg : fix_engine_state * fix_engine_int_msg) =
    match int_msg with 
    | TimeChange t          -> engine.curr_time < t && t <= Imarkets.end_of_day
    | ApplicationData d     -> not (fix_is_admin_msg (d))   (* Just as long as it's application data *)
    | CreateSession d       -> (
        match engine.curr_mode with
        | NoActiveSession   -> true
        | _ -> false
    )
    | ManualIntervention _  -> true
;;

(** ********************************************************************************************************** *)
(**  Our main transition function.                                                                             *)
(** ********************************************************************************************************** *)
(** Note that the choice of order, i.e. in which we process messages, etc is completely 
    arbitrary. The FIX specification does not at all describe how this should be done.  *)
let one_step ( engine : fix_engine_state ) =
    (* First, check if we're in the middle of replaying our cache. *)
    if engine.curr_mode = CacheReplay then
        run_cache_replay (engine)
    (* Second, let's check that we're resending to *)
    else if engine.curr_mode = Retransmit then 
        run_retransmit (engine)
    else 
        (* Now we look for internal and then external messages. *)
        match engine.incoming_int_msg with 
        | Some i -> proc_incoming_int_msg (i, engine)
        | None -> 
            match engine.incoming_fix_msg with 
            | Some m -> proc_incoming_fix_msg (m, engine)
            | None -> engine
;;
