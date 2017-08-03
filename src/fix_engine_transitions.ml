(** FIX 4.4 engine transition functions. *)
(***
    
    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    fix_engine_transitions.ml
    
*)

(* @meta[imandra_ignore] on @end *)
open Datetime;;
open Base_types;;
open Full_admin_enums;;
open Full_admin_messages;;
open Full_app_messages;;
open Full_messages;;
open Fix_engine_state;;
open Fix_engine_utils;;
(* @meta[imandra_ignore] off @end *)

(** In many abnormal cases we need to send out the Logout messages and
    transition to ShutdownInitiated state. *)
let logoff_and_shutdown ( engine : fix_engine_state ) = 
    let logoff_msg = create_logoff_msg ( engine ) in 
    { engine with
        fe_last_time_data_sent  = engine.fe_curr_time;
        fe_curr_mode            = ShutdownInitiated;
        outgoing_fix_msg        = Some ( ValidMsg ( logoff_msg ));
        outgoing_seq_num        = engine.outgoing_seq_num + 1;
        fe_history              = add_msg_to_history ( engine.fe_history, logoff_msg );
    }
;;



(** We're in the middle of retransmitting historic messages. 
    Note: when we transition into Retransmit mode, we set up a 
    queue with messages that should be sent out. These messages are a function
    of the parameters that were sent to the engine. *)
let run_retransmit ( engine : fix_engine_state ) = 
    match engine.fe_history_to_send with 
    | [] -> 
        (* Since after initiating a Logoff, we can still process Resend request, 
            then need to check whether we need to return there. *)
        if engine.fe_after_resend_logout then 
            { engine with fe_curr_mode = ShutdownInitiated; fe_after_resend_logout = false; }
        else 
            { engine with fe_curr_mode = ActiveSession; } (* We're done - need to change mode. *)
    | x::xs -> 
        (* First check: have we 'reached' the starting message to be sent out? If not, continue. *)
        if x.full_msg_header.h_msg_seq_num < engine.fe_retransmit_start_idx then {
            engine with
                fe_history_to_send = xs;
                outgoing_fix_msg = None;
        } else 

        (* Second check: have we over-shot the last message. Note that fe_retransmit_end_idx = 0 means that all messages
            starting from the fe_retransmit_start_idx should be retransmitted. *)
        if engine.fe_retransmit_end_idx <> 0 && x.full_msg_header.h_msg_seq_num > engine.fe_retransmit_end_idx then {
            engine with
                fe_history_to_send = [];
                outgoing_fix_msg = None;

        (* Otherwise: we're in the zone and should send out the current message. *)
        } else {
            engine with 
                fe_history_to_send = xs;
                outgoing_fix_msg = Some ( ValidMsg x );
        }
;;


(** Here we will only accept an incoming Logon message to establish a connection. *)
let run_no_active_session ( m, engine : full_valid_fix_msg * fix_engine_state ) =
    match m.full_msg_data with 
    | Full_FIX_Admin_Msg ( Full_Msg_Logon d ) ->
        begin
            (* TODO: better timestamp comparison *)
            if (m.full_msg_header.h_sending_time.utc_timestamp_year <> engine.fe_curr_time.utc_timestamp_year ) then
                logoff_and_shutdown engine
            else if ( engine.fe_encrypt_method <> d.ln_encrypt_method && 
                engine.fe_num_logons_sent >= engine.fe_max_num_logons_sent ) then { 
                    engine with 
                        fe_curr_mode = Error;
                        fe_curr_status = MaxNumLogonMsgsViolated;
            } else 
                begin
                    let engine'  = { engine with fe_encrypt_method  = d.ln_encrypt_method } in
                    let logon_msg = create_logon_msg ( engine' ) in
                    let engine'' = { engine' with 
                        fe_initiator            = Some false;
                        (*  TODO -- check if we really have to accept all incoming senders *)
                        outgoing_fix_msg        = Some (ValidMsg ( logon_msg ));
                        outgoing_seq_num        = engine.outgoing_seq_num + 1;
                        fe_target_comp_id       = m.full_msg_header.h_sender_comp_id;
                        fe_last_time_data_sent  = engine.fe_curr_time;
                        fe_num_logons_sent      = engine.fe_num_logons_sent + 1;
                        fe_history              = add_msg_to_history ( engine.fe_history, logon_msg );
                    } in 
                    if m.full_msg_header.h_msg_seq_num < (engine.incoming_seq_num + 1) then
                        logoff_and_shutdown engine
                    else if msg_is_sequence_gap ( engine, m.full_msg_header )
                    then { engine'' with
                        incoming_seq_num  = engine.incoming_seq_num + 1;
                        fe_curr_mode      = GapDetected;
                    } else { engine'' with
                        fe_curr_mode      = ActiveSession;
                        incoming_seq_num  = m.full_msg_header.h_msg_seq_num;
                        fe_history        = add_msg_to_history ( engine.fe_history, logon_msg );
                    }
                end
        end
    | _ -> engine
;;

(**  *)
let run_logon_sequence ( m, engine : full_valid_fix_msg * fix_engine_state ) =
    let engine' = {
        engine with incoming_fix_msg = None;
    } in
    if m.full_msg_header.h_target_comp_id <> engine.fe_comp_id then 
        engine'
    else
        match m.full_msg_data with
        | Full_FIX_Admin_Msg ( Full_Msg_Logon d ) ->
            begin
                if engine.fe_encrypt_method <> d.ln_encrypt_method then
                    begin
                        let engine' = { engine with fe_encrypt_method = d.ln_encrypt_method } in 
                        let logon_msg = create_logon_msg ( engine' ) in {
                            engine' with
                                outgoing_fix_msg        = Some ( ValidMsg (logon_msg ));
                                outgoing_seq_num        = engine.outgoing_seq_num + 1;
                                fe_target_comp_id       = m.full_msg_header.h_sender_comp_id;
                                fe_last_time_data_sent  = engine.fe_curr_time;
                                fe_num_logons_sent      = engine.fe_num_logons_sent + 1;
                                fe_history              = add_msg_to_history ( engine.fe_history, logon_msg );
                        }
                    end
                else {
                    engine' with 
                        fe_curr_mode = ActiveSession;
                        incoming_seq_num = m.full_msg_header.h_msg_seq_num;
                }
            end
        | _ -> engine'
;;




(** Response to resend request. Note that we're copyng over the whole list of historic messages -
    we will use the starting/ending indexes to ensure we're only sending out the right ones. 
    Perhaps there's a better way to do this - it's important that we always maintain the spirit
    of 'one_step' - all operations are are atomic. *)
let initiate_Resend ( request, engine : full_msg_resend_request_data * fix_engine_state ) = {
    engine with
        fe_curr_mode = Retransmit;
        fe_retransmit_start_idx = request.rr_begin_seq_num;
        fe_retransmit_end_idx = request.rr_end_seq_num;
        fe_history_to_send = List.rev engine.fe_history; 
        (* Important note: We store messages in a reverse-chronological order b/c on each outbound
        message we have to do pattern matching on the list to ensure consecutive GapFill messages
        are 'compressed' into one. OCaml pattern matching doesn't work on last elements, hence 
        we maintain it in a reverse order, but do List.rev when we need to send it out. *)
}
;;

(** We're operating in a normal mode. *)
let run_active_session ( m, engine : full_valid_fix_msg * fix_engine_state ) =
    let header = m.full_msg_header in
    let msgtag = get_full_msg_tag m.full_msg_data in
    (** Check msg header. If something is wrong - send the reject and start shutdown. *)
    match validate_message_header ( engine, header, msgtag ) with 
    | Some engine -> engine | None ->
    (** Performing squence number checks *)
    let is_duplicate = header.h_msg_seq_num < (engine.incoming_seq_num + 1) in
    let possdup = match header.h_poss_dup_flag with Some true -> true | _ -> false in
    if is_duplicate && not possdup then 
        (** Message is a duplicate, but no PossibleDuplicate flag -- we instantly logoff *)
        logoff_and_shutdown engine
    else if is_duplicate then 
        (** Message is a duplicate and passed all checks -- ignore it. *)
        engine
    else if msg_is_sequence_gap ( engine, m.full_msg_header ) then {
        (** We've detected a gap in messages. We therefore need to 
            transition into GapDetected mode. We place the message into the cahce. *)
        engine with 
            fe_curr_mode = GapDetected;
            incoming_seq_num  = engine.incoming_seq_num + 1;
            fe_cache = [ m ];
    } else
    (** Message sequence number is OK -- lets process its data *)
    match m.full_msg_data with 
    | Full_FIX_Admin_Msg adm_msg ->
        begin 
            match adm_msg with 
            | Full_Msg_Heartbeat hb          -> {
                (* Update information about the last received message. *)
                    engine with 
                        incoming_seq_num = m.full_msg_header.h_msg_seq_num;
                        incoming_fix_msg = None;
                }
            | Full_Msg_Logon data           -> engine
            | Full_Msg_Logoff data          -> logoff_and_shutdown ( engine )
            | Full_Msg_Reject data          -> { engine with incoming_seq_num = m.full_msg_header.h_msg_seq_num }
            | Full_Msg_Business_Reject data -> engine
            | Full_Msg_Resend_Request data  -> initiate_Resend ( data, { engine with fe_after_resend_logout = false } )
            | Full_Msg_Sequence_Reset data  -> engine
            | Full_Msg_Test_Request data    ->
                let hearbeat_msg = create_heartbeat_msg ( engine, Some data.test_req_id ) in {
                    engine with 
                        fe_last_time_data_sent  = engine.fe_curr_time;
                        outgoing_fix_msg        = Some ( ValidMsg ( hearbeat_msg ));
                        fe_history              = add_msg_to_history ( engine.fe_history, hearbeat_msg );
                        outgoing_seq_num        = engine.outgoing_seq_num + 1;
                        incoming_seq_num        = m.full_msg_header.h_msg_seq_num;
                }
        end
    | Full_FIX_App_Msg app_msg          -> 
        (** We're processing an application type of message. We just need 
        to append it to the list of outgoing application messages and 
        update the last seq number processed. *) 
        if engine.fe_application_up then {
            engine with
                incoming_seq_num = m.full_msg_header.h_msg_seq_num;
                outgoing_int_msg = Some (OutIntMsg_ApplicationData app_msg );
                incoming_fix_msg = None;
        } else
            begin
                let biz_reject_data = {
                    brej_msg_ref_seq_num    = m.full_msg_header.h_msg_seq_num;
                    brej_msg_msg_tag        = get_full_msg_tag ( m.full_msg_data );
                    brej_msg_reject_reason  = ApplicationDown;
                    brej_msg_field_tag      = None;
                    brej_msg_text           = None;
                    brej_msg_encoded_text   = None;
                } in
                business_reject ( biz_reject_data, engine )
            end
;;


let run_gap_detected ( engine : fix_engine_state ) = 
    let resend_msg = create_resend_request_msg (engine) in
    { engine with
        fe_curr_mode     = Recovery;
        fe_last_time_data_sent = engine.fe_curr_time;
        outgoing_fix_msg = Some ( ValidMsg ( resend_msg ) );
        fe_history       = add_msg_to_history ( engine.fe_history, resend_msg );
        outgoing_seq_num = engine.outgoing_seq_num + 1;
    }
;; 


(** Here we can only handle a subset of the FIX messages. *)
let replay_single_msg ( m, engine : full_valid_fix_msg * fix_engine_state ) =
    match m.full_msg_data with 
    | Full_FIX_App_Msg app_msg -> {
        engine with 
            incoming_seq_num = m.full_msg_header.h_msg_seq_num;
            outgoing_int_msg = Some ( OutIntMsg_ApplicationData app_msg );
            incoming_fix_msg = None;
        }
    | Full_FIX_Admin_Msg msg -> {
        engine with 
            incoming_seq_num = m.full_msg_header.h_msg_seq_num;
        }
;; 

(** Run the engine through the replay messages. This is used during recovery. 

    Note that the only session-level message we should receive at this point
    should be a Reject message. We need to ensure that this function cannot 
    lead to another Recovery state. *)
let run_cache_replay ( engine : fix_engine_state ) =
    match engine.fe_cache with 
    | [] -> (* Nothing to process in cache, we've recovered *) {
        engine with
            fe_curr_mode = ActiveSession;
        }
    | x::xs -> 
        let engine = replay_single_msg (x, engine) in
        { engine with fe_cache = xs }
;;


(** Check to make sure there're no sequence gaps *)
let rec no_seq_gaps ( msg_list, last_seq_num : full_valid_fix_msg list * int) = 
    match msg_list with
    | [] -> true
    | x::xs ->
        if x.full_msg_header.h_msg_seq_num <> ( last_seq_num + 1 ) then 
            false
        else
            no_seq_gaps ( xs, x.full_msg_header.h_msg_seq_num )
;;

(** 
    Is cache valid so that we can transition from recovery?

    Cache is considered valid when:
    1. It is non-empty
    2. The sequence IDs of the messages within cache are continuous (i.e. there're no gaps)
    3. First sequence ID (of the cache) is next message from the last one correctly processed. *)
let is_cache_complete ( cache, last_seq_processed : full_valid_fix_msg list * int ) = 
    match cache with
    | [] -> false
    | x::xs ->
        begin 
            let correct_seq_num = x.full_msg_header.h_msg_seq_num = last_seq_processed in 
            let no_gaps = no_seq_gaps ( xs, x.full_msg_header.h_msg_seq_num ) in 
            correct_seq_num && no_gaps
        end
;;

(** Add message to cache so that ordering is maintained. *)
let rec add_to_cache ( m, cache : full_valid_fix_msg * full_valid_fix_msg list ) = 
    match cache with 
    | []    -> [ m ]
    | [x]   -> if x.full_msg_header.h_msg_seq_num > m.full_msg_header.h_msg_seq_num then [ m; x ] else [ x; m ]
    | x::xs -> if x.full_msg_header.h_msg_seq_num > m.full_msg_header.h_msg_seq_num then 
                m::x::xs else ( x :: ( add_to_cache (m, xs) ) )
;;

(** We're in recovery mode. We should add any (except logoff) received messages to our cache.
    Check to see whether next message is complete. *)
let run_recovery ( m, engine : full_valid_fix_msg * fix_engine_state ) = 
    match m.full_msg_data with 
    | Full_FIX_Admin_Msg (Full_Msg_Logoff data) -> logoff_and_shutdown ( engine )
    | _ ->
    let new_cache = add_to_cache (m, engine.fe_cache) in 
    if is_cache_complete (new_cache, engine.incoming_seq_num) then {
        engine with 
            fe_cache = new_cache;
            fe_curr_mode = CacheReplay;
            incoming_fix_msg = None;
    } else {
        engine with
            fe_cache = new_cache;
            incoming_fix_msg = None;
    }
;;

(** We've sent out a Logout message and are now waiting for a confirmation of logout. *) 
let run_shutdown ( m, engine : full_valid_fix_msg * fix_engine_state ) = 
    match m.full_msg_data with 
    | Full_FIX_Admin_Msg ( Full_Msg_Logoff m )          -> { engine with fe_curr_mode = NoActiveSession; }
    | Full_FIX_Admin_Msg ( Full_Msg_Resend_Request m )  -> initiate_Resend ( m, { engine with fe_after_resend_logout = true })
    | _ -> engine
;;
