(** 

    Aesthetic Integration Limited
    Copyright (c) 2016

    Implementation of the FIX 4.4 engine.

    High-level TODOs:
        -- Change incoming/outgoing message queues (both fix and internal) to be 
                'msg option' type instead of lists

    --> Concept of a 'frame' --> how any two systems should communicate with each other 
        within a single time frame.

    fix_engine.ml
*)

(** Module depends on FIX4.4 data dictionary. *)
open Imarkets;;
open Fix_data_dictionary;;

(* Define set of actions + data for manual intervention by the user. *)
type manual_int_data = {
    session_reset : bool;                       (* Should we reset the engine? *)
};;

(* Request to initiate a session *)
type session_data = {
    dest_comp_id : int;                         (* Destination company ID *)
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
    | LogonInitiated                            (* Middle of logon session *)
    | ActiveSession                             (* Application messages are now processed *)
    | Recovery                                  (* In recovery mode because we've *)
    | Retransmit                                (* In the middle of retransmitting sequence of messages *)
    | ShutdownInitiated                         (* Shutting-down protocol *)
    | Error                                     (* We've received a non-dup message with earlier sequence number *)
;;

(** Structure containing state of the FIX engine. 

    TODO We need to change the incoming/outgoing messages queues to 
        be 'msg option' types, otherwise test suite generation becomes
        too difficult, it also forces design to be more 'one-step'-like.
*)

type fix_engine_state = {
    curr_mode : fix_engine_mode;                (* High-level mode of the engine. *)

    curr_time : int;                            (** Need to define time so we're aware of heartbeat status. *)

    comp_id : int;                              (* Our company ID *)
    target_comp_id : int;                       (* Target company ID *)

    incoming_int_msgs : fix_engine_int_msg list;  (* Incoming internal messages (application). *)
    outgoing_int_msgs : fix_engine_int_msg list;  (* These are messages we send back to our owner *)

    incoming_seq_num : int;                     (* Sequence number of the last processed incoming message. *)
    outgoing_seq_num : int;                     (* Sequence number of the last sent message. *)

    incoming_fix_msgs : fix_message list;       (* Messages we will send out *)
    outgoing_fix_msgs : fix_message list;       (* Messages we receive *)

    cache : fix_message list;                   (* Maintain a cache of messages in case we detect out of sequence message. *)
    history : fix_message list;                 (* We maintain history of our outgoing messages in case we're asked to retransmit. *)

    last_heartbeat_received : int;              (* Last time we received a heartbeat message. *)
    heartbeat_interval : int;                   (* Negotiated heartbeat interval. *)

    history_to_send : fix_message list;         (* Used in message retransmission. *)
};;

(** Initial engine state. *)
let init_fix_engine_state = {

    curr_mode = NoActiveSession;
    curr_time = 0; (** TODO define a function that converts to milliseconds. *)

    comp_id = 1;
    target_comp_id = 2;

    incoming_int_msgs = [];
    outgoing_int_msgs = [];

    incoming_seq_num = 0;
    outgoing_seq_num = 1;       (** This should be the first ID that's outgoing. *)

    incoming_fix_msgs = [];
    outgoing_fix_msgs = [];

    cache = [];                         
    history = [];

    last_heartbeat_received = 0;
    heartbeat_interval = -1;

    history_to_send = [];
};;

(** Return none if there're no messages *)
let get_next_fix_msg ( engine : fix_engine_state ) =
    match engine.incoming_fix_msgs with 
    | [] -> None
    | x::xs -> Some x
;;

(** TODO Are there any other checks? *)
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

let run_logon_seq ( engine : fix_engine_state ) =
    match engine.incoming_fix_msgs with
    | [] -> engine
    | x::xs -> (
        let engine' = {
            engine with incoming_fix_msgs = xs;
        } in
        if x.header.target_comp_id <> engine.comp_id then 
            engine'
        else
            match x.msg_data with 
            | FIX_logon d -> {
                engine' with 
                    curr_mode = ActiveSession;
                    incoming_seq_num = x.header.msg_seq_num;
            }
            | _ -> engine'
    )
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
                outgoing_fix_msgs = x::engine.outgoing_fix_msgs;
        }
;;

(** Are all the messages with correct IDs? *)
let rec is_msg_list_complete = function
    | [] -> true
    | x::y::xs -> true
;;

(** Check to see whether we have all of the data necessary to transition out of recovery mode. *)
let is_cache_complete ( engine : fix_engine_state ) =
    true

;;

(** We need to ensure we're inserting it in the correct order and there're no duplicates *)
let insert_into_cache (m, msgs : fix_message * fix_message list) =
    true
;;


(** Is the message a non-duplicate and is older than latest sequence number? *)
let msg_inconsistent ( engine, msg_header : fix_engine_state * fix_header ) = 
    match msg_header.poss_dup_flag with 
    | None -> msg_header.msg_seq_num < engine.incoming_seq_num
    | Some b -> (not b) && (msg_header.msg_seq_num < engine.incoming_seq_num)
;;

(** Create outbound FIX message with the appropriate headers, etc. *)
let create_outbound_fix_msg ( engine, msg, is_duplicate ) = {
    header = {
        default_fix_header with 
            msg_seq_num = engine.outgoing_seq_num + 1;
            poss_dup_flag = Some is_duplicate;
            target_comp_id = engine.target_comp_id;
            sender_comp_id = engine.comp_id;
    };
    
    msg_data = msg;

    trailer = {
        signature_length = 0;
        signature = 0;
        check_sum = 0;
    };
};;

(** Create a logon message we would send out to initiate a connection 
    with another FIX engine *)
let create_logon_msg ( targetID, last_seq_num : int * int ) = {
        header = {
            default_fix_header with msg_seq_num = last_seq_num + 1;
        };

        msg_data = FIX_logon {
            encrypt_method      = 1;
            heartbeat_interval  = 60;
            raw_data_length     = 1; 
        };
        
        trailer = {
            signature_length    = 0;
            signature           = 0;
            check_sum           = 0;
        };
    }
;;

(** Create a heartbeat message *)
let create_heartbeat_msg ( engine: fix_engine_state) =
    let msg_data = FIX_heartbeat {
        hb_test_req_id = None;
    } in 
    create_outbound_fix_msg ( engine, msg_data, false)
;;

(** TODO: Need to optimize this -> engine state shouldn't be passed around like this! *)
let process_fix_msg ( f, engine : fix_message * fix_engine_state) = 
    match engine.incoming_fix_msgs with 
    | [] -> engine
    | x::xs -> { engine with incoming_fix_msgs = xs }
;;

(** ********************************************************************************************************** *)
(**  Mode transition functions.                                                                                *)
(** ********************************************************************************************************** *)

(** We reject anything here that's not an internal message (either time change or request to create a session) *)
let run_init_seq (engine : fix_engine_state) = 
    let engine' = {
        engine with 
            incoming_fix_msgs = [];
    } in
    match engine.incoming_int_msgs with 
    | [] -> engine'
    | x::xs ->
        match x with 
        | TimeChange t -> { engine' with curr_time = t }
        | CreateSession sd ->
            let msg = create_logon_msg (sd.dest_comp_id, engine.outgoing_seq_num) in { 
                engine' with 
                    curr_mode = LogonInitiated;
                    outgoing_fix_msgs = [ msg ];
                    target_comp_id = sd.dest_comp_id;
                    outgoing_seq_num = engine.outgoing_seq_num + 1;
            } 
        | _ -> engine'
;;

(*
(** We have an incoming internal message. *)
let process_int_msg (m, engine : fix_engine_int_msg * fix_engine_state) = 
    match m with 
    | TimeChange t ->
        (** We only need to check for heartbeats if we have an active session. *)
        let new_engine = { engine with curr_time = t } in

        if engine.curr_mode = ActiveSession then
            let error_mode = t > (engine.last_heartbeat_received + engine.heartbeat_interval) in 
            
            let out_heartbeat = create_heartbeat_msg (engine) in 
            let outgoing = add_outgoing_msg (out_heartbeat, new_engine, false) in
            { new_engine with outgoing_fix_msgs = outgoing }

        else 
            new_engine
    
    | CreateSession sd ->
        let msg = create_logon_msg (engine) in 
        let outgoing = add_outgoing_msg (msg, engine, false) in { 
            engine with 
                curr_mode = LogonInitiated;
                outgoing_fix_msgs = outgoing;
                outgoing_seq_num = msg.header.msg_seq_num;
        } 

    | ApplicationData d -> 
        let new_msg = create_outbound_fix_msg ( engine, d, false ) in {
            engine with 
                outgoing_fix_msgs = engine.outgoing_fix_msgs @ [new_msg];
                outgoing_seq_num = new_msg.header.msg_seq_num;
            }
    | ManualIntervention d -> engine
    
;;
*)

(** ********************************************************************************************************** *)
(** We're operating in a normal mode.                                                                          *)
(** ********************************************************************************************************** *)
let run_active_session (engine : fix_engine_state) = 
    let msg = get_next_fix_msg (engine) in
    match msg with 
    | None -> engine
    | Some m ->
    (** Make sure the message is in the right sequence. *)
    if msg_inconsistent (engine, m.header) then (
        (** We need to add it to the cache and transition to recovery mode. *)
        let cache' = [ m ] in { 
            engine with 
                curr_mode = Recovery;
                cache = cache';
        }
    ) else (** We should be processing this now. *) 
    if fix_is_admin_msg (m.msg_data) then (
        match m.msg_data with 
        | FIX_logout lo -> engine
        | FIX_heartbeat hb -> engine
        | _ -> engine
    ) else 
        (** We're processing an application type of message. We just need 
            to append it to the list of outgoing application messages. *)
        engine
;;

(** Run the engine through the replay messages. This is used during recovery. 

    Note that the only session-level message we should receive at this point
    should be a Reject message. *)
let rec replay_msgs (engine, msgs : fix_engine_state * fix_message list) = 
    match msgs with 
    | [] -> engine
    | x::xs ->
        if fix_is_msg_reject (x.msg_data) then 
            (** Not sure what should be done here -> perhaps this is custom logic. *)
           engine
        else if not (fix_is_admin_msg (x.msg_data)) then (
            let new_int_msg = ApplicationData (x.msg_data) in {
                engine with 
                    outgoing_int_msgs = new_int_msg :: engine.outgoing_int_msgs;
            }
        ) 
        else 
            (** We're only processing business and session-level reject messages,
                hence we're skipping everything else. *)
            { engine with incoming_fix_msgs = xs; }
;;

(** Here we should transition from our Recovery state to Normal. 
    We assume that our cache is valid here. *)
let transition_from_recovery (engine : fix_engine_state) = 
    let engine' = replay_msgs (engine, engine.cache) in {
        engine' with
            curr_mode = ActiveSession
    }
;; 

(** Is cache valid so that we can transition from recovery. *)
let is_cache_complete (engine : fix_engine_state) = 
    engine
;; 

(** We're in recovery mode. We should add any received messages.
    Check to see whether next message is complete. *)
let run_recovery (engine : fix_engine_state) = 
    engine
;;

(** We're in the processing of closing the session. *)
let run_shutdown (engine : fix_engine_state) = 
    let msg = get_next_fix_msg (engine) in 
    match msg with 
    | None -> engine
    | Some x -> engine
;;

(** We're in error sequence mode. *)
let run_err_seq (engine : fix_engine_state) = 
    let msg = get_next_fix_msg (engine) in 
    match msg with 
    | None -> engine
    | Some x -> engine
;;

(** ********************************************************************************************************** *)
(** End of Mode Transitions                                                                                    *)
(** ********************************************************************************************************** *)


(** This sets validity of the incoming internal messages. *)
let is_int_message_valid (engine, int_msg : fix_engine_state * fix_engine_int_msg) =
    match int_msg with 
    | TimeChange t         -> engine.curr_time < t && t <= Imarkets.end_of_day
    | ApplicationData d    -> not (fix_is_admin_msg (d))   (* Just as long as it's application data *)
    | CreateSession d      -> (
        match engine.curr_mode with
        | NoActiveSession -> true
        | _ -> false
    )
    | ManualIntervention _ -> true
;;

(** ********************************************************************************************************** *)
(**  Our main transition function.                                                                             *)
(** ********************************************************************************************************** *)
let one_step ( engine : fix_engine_state ) =
    match engine.curr_mode with 
    | NoActiveSession ->    run_init_seq (engine)
    | LogonInitiated ->     run_logon_seq (engine)
    | ActiveSession ->      run_active_session (engine)
    | Recovery ->           run_recovery (engine)
    | Retransmit ->         run_retransmit (engine)
    | ShutdownInitiated ->  run_shutdown (engine)
    | Error ->              run_err_seq (engine)
;;

(** Run until there's nothing to do. Helpful in simulations, etc. *)
let rec run_global_step ( engine : fix_engine_state ) = 
    let engine' = one_step (engine) in 
    if engine' = engine then engine
    else run_global_step (engine')
;;