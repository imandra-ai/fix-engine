(** 

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    Implementation of the FIX 4.4 engine
    
    Usage examples.

    fix_examples.ml
*)

open Fix_data_dictionary
open Fix_engine
open Fix_pp
open Fix_engine_pp

let add_int_msg msg engine = {
    engine with 
        incoming_int_msg = Some msg
};;

let (>>=) s f = f s;;

let examples = ref [];;

let record_example x =
    examples := x :: (!examples)
;;

(* Run single time step 
let run_step (time_step, engine1, engine2) = 
    match engine1.outgoing_fix_msgs with 
    | None -> 
    | Some x ->

    match engine2.outgoing_fix_msgs with 
    | None ->
    | Some x ->
;;*)

(** Process a single internal step *)
let proc_int_msg (s, im : fix_engine_state * fix_engine_int_msg) =  
    one_step ({
        s with incoming_int_msg = Some im
    })
;;

let proc_fix_msg (s, fm : fix_engine_state * fix_message) = 
    one_step ({
        s with incoming_fix_msg = Some fm 
    })
;;

type msg_to_proc = [
    | `FIX_MSG of fix_message 
    | `INT_MSG of fix_engine_int_msg
];;

let run_single (x, last_state) = 
    match x with
    | `FIX_MSG f -> proc_fix_msg ( last_state, f )
    | `INT_MSG i -> proc_int_msg ( last_state, i )
;;

let rec run_through_msgs ( last_state, msgs : fix_engine_state * msg_to_proc list) = 
    match msgs with 
    | [] -> []
    | x::xs ->
        let new_state = run_single (x, last_state) in
        (new_state, x) :: run_through_msgs ( new_state, xs )
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
            print_endline "event:";
            print_endline m_str;
            print_endline "\n\n";
            print_endline "state:";
            print_endline (engine_state_to_str s);
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

record_example ("// Example 1: Session Creation / Termination\n", example_1);;

(** Login, then send an application data message, ensure it get to the second fix engine. *)
let example_2 () = 
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

record_example ("// Example 2: successfully created a session\n", example_2);;


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

record_example ("// Example 3: successfully created a session + submit application message \n", example_3);;


(* Process an out-of-sequence message and transition into recovery *)
let example_4 () =
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

record_example ("// Example 4: transition into Recovery when processing an out-of-sequence message \n", example_4);;
