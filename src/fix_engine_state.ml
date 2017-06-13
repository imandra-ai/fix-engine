(** FIX 4.4 engine state type. *)
(***
    
    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    fix_engine_state.ml
    
*)


(* @meta[imandra_ignore] on @end *)
open Datetime;;
open Base_types;;
open Full_admin_enums;;
open Full_admin_messages;;
open Full_app_messages;;
open Full_messages;;
open State;;
(* @meta[imandra_ignore] off @end *)

(** Define set of actions + data for manual intervention by the user. *)
type manual_int_data = {
    session_reset           : bool;
}
;;

(** Request to initiate a new session. *)
type session_data = {
    dest_comp_id            : fix_string; (** Destination company ID. *)
}
;;

(** These are internal messages into the Engine. *)
type fix_engine_int_inc_msg = 
    | IncIntMsg_TimeChange          of fix_utctimestamp     (** Updates internal time of the engine. *)
    | IncIntMsg_CreateSession       of session_data         (** Create sessions command. *)
    | IncIntMsg_EndSession                                  (** Terminate current active session. *)
    | IncIntMsg_ApplicationData     of full_app_msg_data    (** App messages to be transmitted over. *)
    | IncIntMsg_ManualIntervention  of manual_int_data      (** TODO: create 'richer' manual commands. *)
;;

(** These are the outgoing internal messages - would be sent into the application model. *)
type fix_engine_int_out_msg = 
    | OutIntMsg_ApplicationData     of full_app_msg_data    (** Sending application message onto the  *)    
    | OutIntMsg_Reject                                      (** Rejecting internal message - when we cannot transmit or create new sessions, etc. *)
;;


(** Represents 'status' of the engine. *)
type fix_engine_status =
    | Normal
    | SessRejectReceived 
    | BusinessRejectReceived
    | TargetAppIsDown
    | ConnTerminatedWithoutLogoff
    | MaxNumLogonMsgsViolated
;;

(** Represents 'modes' of the engine. *)
type fix_engine_mode =
    | NoActiveSession       (** State of the engine before logon. *)
    | LogonInitiated        (** Middle of logon session. *)
    | ActiveSession         (** Application messages are now processed. *)
    | GapDetected           (** Detected out-of-sequence message. Waiting to receive it. *)
    | Recovery              (** RequestResend has been sent out. Waiting to recover the messages. *)
    | CacheReplay           (** Replaying the cache. *)
    | Retransmit            (** Retransmitting sequence of messages because we were asked to retransmit. *)
    | ShutdownInitiated     (** Shutting-down protocol. *)
    | Error                 (** Received a non-dup message with earlier sequence number. *)
    | WaitingForHeartbeat   (** Sent out TestRequest message.  *)
;;

(** Engine state structure containing all of the information required for it operate. *)
type fix_engine_state = {
    fe_curr_status          : fix_engine_status;            (** Status. *)
    fe_curr_mode            : fix_engine_mode;              (** High-level mode of the engine. *)
    fe_initiator            : bool option;                  (** initiator = True if we've received an internal message to initiate 
                                                                the connection. It's False if we've received a Logon request first.
                                                                It's None by default prior to any Logon sequences. *)

    fe_curr_time            : fix_utctimestamp;             (** Need to define time so we're aware of heartbeat status. *)

    fe_comp_id              : fix_string;                   (** Our company ID *)
    fe_target_comp_id       : fix_string;                   (** Target company ID *)

    incoming_int_msg        : fix_engine_int_inc_msg option;(** Incoming internal messages (application). *)
    outgoing_int_msg        : fix_engine_int_out_msg option;(** These are messages we send back to our owner *)

    incoming_seq_num        : int;                          (** Sequence number of the last processed incoming message. *)
    outgoing_seq_num        : int;                          (** Sequence number of the last sent message. *)

    incoming_fix_msg        : full_top_level_msg option;    (** Messages we will send out *)
    outgoing_fix_msg        : full_top_level_msg option;    (** Messages we receive *)

    fe_cache                : full_valid_fix_msg list;      (** Maintain a cache of messages in case we detect out-of-sequence message(s). *)
    fe_history              : full_valid_fix_msg list;      (** We maintain history of our outgoing messages in case we're asked to retransmit. *)

    fe_last_time_data_sent  : fix_utctimestamp;             (** Last time we sent out data to the corresponding engine *)
    fe_last_data_received   : fix_utctimestamp;             (** Last time we received a heartbeat or other message. *)
    fe_heartbeat_interval   : fix_duration;                 (** Negotiated heartbeat interval. *)
    fe_testreq_interval     : fix_duration;                 (** Interval used to 'pad' heartbeat interval before a TestRequest message is sent out. *)

    fe_retransmit_start_idx : int;                          (** Starting index of the retransmitting history. *)
    fe_retransmit_end_idx   : int;                          (** Ending index ... *)

    fe_history_to_send      : full_valid_fix_msg list;      (** Used in message retransmission. *)
    fe_after_resend_logout  : bool;                         (** Should engine go to LogoffTerminated after finishing GapRefill mode completes? *)

    fe_application_up       : bool;                         (** Is the application that's receiving messages up and running?
                                                                TODO: we might need to constitute a heartbeat to enforce this. *)

    last_test_req_id        : int;                          (** These are used to send out TestRequest messages that should be replied 
                                                                with Heartbeat messages containing the testrequest ID. Any string
                                                                may be used, we use int's for now. *) 

    fe_num_logons_sent      : int;                          (** Number of logons sent during session initialization. This is done to 
                                                                ensure that the engine does not go into infinite loop. *)
    fe_max_num_logons_sent  : int;                          (** Setting: maximum number of logons to be sent out. *)
    fe_encrypt_method       : fix_encryption_method;
}
;;

(** Initial engine state. *)
let init_fix_engine_state = {
    fe_curr_status          = Normal;
    fe_initiator            = None;                         
    fe_curr_mode            = NoActiveSession;              
    fe_curr_time            = make_utctimestamp ( 2017, 1, 1, 0, 1, 0, None );

    fe_comp_id              = Admin_string 183924456; (* Hash of "IMANDRA" *)
    fe_target_comp_id       = Admin_string 780720412; (* Hash of "TARGET"  *)

    incoming_int_msg        = None;                           
    outgoing_int_msg        = None;

    incoming_seq_num        = 0;        
    outgoing_seq_num        = 0; 

    incoming_fix_msg        = None;
    outgoing_fix_msg        = None;

    fe_cache                = [];
    fe_history              = [];

    fe_last_data_received   = make_utctimestamp ( 2017, 1, 1, 0, 1, 0, None );
    fe_heartbeat_interval   = make_duration ( None, None, None, None, None, Some 30 ); (* 30 seconds *)
    fe_last_time_data_sent  = make_utctimestamp ( 2017, 1, 1, 0, 1, 0, None );
    fe_testreq_interval     = make_duration ( None, None, None, None, None, Some 30 );

    fe_history_to_send      = [];
    fe_retransmit_start_idx = 0;
    fe_retransmit_end_idx   = 0;
    fe_after_resend_logout  = false;

    fe_application_up       = true;

    last_test_req_id        = 0;

    fe_num_logons_sent      = 0;
    fe_max_num_logons_sent  = 0;
    fe_encrypt_method       = NoEncryption;
}
;;


(** Properties of a valid state. 

    TODO: augment these properties and verify that if we're in a good state, cannot
    transition out of it (i.e. new state would always be valid).

    TODO: once we have the full library of checks for incoming messages
    we need to maintain that every state transition from a valid state 
    would result in another valid state. *)
let is_state_valid ( engine : fix_engine_state ) =
    utctimestamp_LessThanEqual ( engine.fe_last_data_received, engine.fe_curr_time ) &&
    utctimestamp_LessThanEqual ( engine.fe_last_time_data_sent, engine.fe_curr_time ) &&
    is_valid_utctimestamp ( engine.fe_curr_time ) && 
    is_valid_utctimestamp ( engine.fe_last_time_data_sent ) && 
    is_valid_utctimestamp ( engine.fe_last_data_received ) &&
    is_valid_duration ( engine.fe_heartbeat_interval ) &&
    is_valid_duration ( engine.fe_testreq_interval )
;;
