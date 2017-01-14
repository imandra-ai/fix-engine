(** 

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017
    
    Usage examples.

    fix_examples.ml
*)

open Fix_data_dictionary
open Fix_engine
open Fix_pp
open Fix_engine_pp
open Fix_global


let pe = print_endline;;

let (>>=) s f = f s;;

let examples = ref [];;

let record_example x =
    examples := x :: (!examples)
;;

let rec print_results ( events : (fix_engine_state * msg_to_proc) list ) =
    match events with 
    | [] -> ()
    | (s, m) :: xs ->
        let m_str = 
            match m with 
            | `FIX_MSG f -> fix_msg_to_str f
            | `INT_MSG m -> int_msg_to_str m
        in let () =
        begin 
            pe "event:";
            pe m_str;
            pe "\n\n";
            pe "state:";
            pe (engine_state_to_str s);
        end in
        print_results (xs)
;;

(** Instantiate a new session between 2 fix engines. *)
let example_1 () =
    let engine = {
        init_fix_engine_state with 
            comp_id = 1;
    } and
    msgs = [
        `INT_MSG (TimeChange (1));
        `INT_MSG (CreateSession { dest_comp_id = 123 });
    ] in 
    run_through_msgs (engine, msgs)
;;

record_example ("// Example 1: Session Creation\n", example_1);;

let example_2 () =
    let engine = {
        init_fix_engine_state with 
            comp_id = 1;
    } and 
    msgs = [
        `INT_MSG (TimeChange (1));
        `INT_MSG (CreateSession { dest_comp_id = 123 });
    ] in 
    run_through_msgs (engine, msgs)
;;

record_example ("// Example 2: Session termination\n", example_2);;

(** Login, then send an application data message, ensure it get to the second fix engine. *)
let example_3 () = 
    let engine = {
        init_fix_engine_state with 
            comp_id = 1;
    } and 
    msgs = [
        `INT_MSG (TimeChange (1));
        `INT_MSG (CreateSession { dest_comp_id = 123 });
        `FIX_MSG ( {
            
            header = {
                default_fix_header with 
                    target_comp_id = 1;
            };
            
            msg_data = FIX_logon { 
                encrypt_method = 123;
                heartbeat_interval = 123;
                raw_data_length = 123;
                };
            
            trailer = default_fix_trailer;

         });
    ] in
    run_through_msgs (engine, msgs)
;;

record_example ("// Example 3: successfully created a session\n", example_3);;


(** Login, then send an application data message, ensure it get to the second fix engine. *)
let example_4 () = 
    let engine = {
        init_fix_engine_state with 
            comp_id = 1;
    } and 
    msgs = [
        `INT_MSG (TimeChange (1));
        `INT_MSG (CreateSession { dest_comp_id = 123 });
        `FIX_MSG ( {
            header = {
                default_fix_header with 
                    target_comp_id = 1;
            };
            msg_data = FIX_logon { 
                encrypt_method = 123;
                heartbeat_interval = 123;
                raw_data_length = 123;
                };
            
            trailer = default_fix_trailer;
         });
         `INT_MSG (ApplicationData (
                FIX_logon {
                encrypt_method = 123;
                heartbeat_interval = 123;
                raw_data_length = 123;
            }
         ));
    ] in
    run_through_msgs (engine, msgs)
;;

record_example ("// Example 4: successfully created a session + submit application message \n", example_4);;

(* Process an out-of-sequence message and transition into recovery *)
let example_5 () =
    let engine = {
        init_fix_engine_state with 
            comp_id = 1;
            curr_mode = ActiveSession;
            initiator = Some false;
            incoming_seq_num = 1;
    } and 
    msgs = [
        `FIX_MSG ( {
            header = {
                default_fix_header with 
                    target_comp_id = 1;
                    msg_seq_num = 3;        (* Should be 2 *)
            };
            msg_data = FIX_trade_report_ae {
                trade_report_id = 1;
                previously_reported = FIX_Yes;
                order_id = 1;
                filled_qty = 10;
            };
            trailer = default_fix_trailer;
        }

        )
    ] in
    run_through_msgs (engine, msgs)
;;

record_example ("// Example 5: transition into Recovery when processing an out-of-sequence message \n", example_5);;


let example_6 () =
    let engine = {
        init_fix_engine_state with 
            comp_id = 1;
            curr_mode = Recovery;
            initiator = Some false;
            incoming_seq_num = 1;
    } and 
    msgs = [
        `FIX_MSG ( {
            header = {
                default_fix_header with
                    target_comp_id = 1;
                    msg_seq_num = 3;
            };
            msg_data = FIX_trade_report_ae {
                trade_report_id = 1;
                previously_reported = FIX_No;
                order_id = 2;
                filled_qty = 10;
            };
            trailer = default_fix_trailer;
        })
    ] in
    run_through_msgs (engine, msgs)
;;

record_example ("// Example 6: In Recovery mode,receiving missing message and recovering.\n", example_6);;

let example_7 () =
    let engine = {
        init_fix_engine_state with 
            comp_id = 1;
            curr_mode = ActiveSession;
            initiator = Some false;
            incoming_seq_num = 1;
            cache = [

            ];
    } and 
    msgs = [
        `FIX_MSG ( {
            header = {
                default_fix_header with
                    target_comp_id = 1;
                    msg_seq_num = 3;
            };
            msg_data = FIX_trade_report_ae {
                trade_report_id = 1;
                previously_reported = FIX_No;
                order_id = 2;
                filled_qty = 10;
            };
            trailer = default_fix_trailer;
        })
    ] in 
    run_through_msgs (engine, msgs)
;;

record_example ("// Example 7: In Recovery mode and adding further msgs into the cache.\n", example_7);;

let example_8 () =
    let engine = {
        init_fix_engine_state with 
            comp_id = 1;
            curr_time = 10;

            last_hbeat_recived = 1;
            hbeat_interval = 10;

            curr_mode = ActiveSession;
            initiator = Some false;
            incoming_seq_num = 1;
    } and 
    msgs = [
        `INT_MSG ( TimeChange 1000 )
    ] in 
    run_through_msgs (engine, msgs)
;;

record_example ("// Example 8: Internal time clock is updated, yet no heartbeat - transitioning to Shutdown mode.", example_8);;

let example_9 () = 
    let engine = {
        comp_id = 1;
        curr_time = 10;
    } and 
    msgs = [
        `FIX_MSG ( TimeChange 100 )
    ] in 
    run_through_msgs (engine, msgs)
;;

record_example ("// Example 9: In ActiveSession mode and received resend request.", example_9);;
