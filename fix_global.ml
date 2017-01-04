(** 

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    Implementation of the FIX 4.4 engine. Global state of the model.

    fix_global.ml 
*)

open Fix_data_dictionary
open Fix_engine

(* We're combining these to make it easier to run simulations. *)
type msg_to_proc = [
    | `FIX_MSG of fix_message 
    | `INT_MSG of fix_engine_int_msg
];;

type fix_engine_global_state = {
    incoming_msgs       : msg_to_proc list;

    outgoing_int_msgs   : fix_engine_int_msg list;
    outgoing_fix_msgs   : fix_message list;
};;

(** Default global state. *)
let def_global_state = {
    incoming_msgs       = [];

    outgoing_int_msgs   = [];
    outgoing_fix_msgs   = [];
};;

let clear_outgoing_fix ( global_state : fix_engine_global_state ) = {
    global_state with 
        outgoing_fix_msgs = [];
};;

let clear_outgoing_int ( global_state : fix_engine_global_state ) = {
    global_state with 
        outgoing_int_msgs = [];
};;

(** Process a *)
let clear_next ( global_state : fix_engine_global_state ) = 
    global_state
;;

(** Process a single internal step *)
let proc_int_msg (s, im : fix_engine_state * fix_engine_int_msg) = 
    one_step ({
        s with incoming_int_msg = Some im
    })
;;

(** Proc to FIX Msg *)
let proc_fix_msg (s, fm : fix_engine_state * fix_message) = 
    one_step ({
        s with incoming_fix_msg = Some fm
    })
;;

(** Add internal message *)
let add_int_msg msg engine = {
    engine with
        incoming_int_msg = Some msg
};;

(** Execute a single instruction *)
let run_single (x, last_state) = 
    match x with
    | `FIX_MSG f -> proc_fix_msg ( last_state, f )
    | `INT_MSG i -> proc_int_msg ( last_state, i )
;;

(** Run until there's nothing to do. Helpful in simulations, etc. *)
let rec run_global_step ( engine : fix_engine_state ) = 
    let engine' = one_step (engine) in 
    if engine' = engine then engine
    else run_global_step (engine')
;;

(** Run through all of the messages. *)
let rec run_through_msgs ( last_state, msgs : fix_engine_state * msg_to_proc list) = 
    match msgs with 
    | [] -> []
    | x::xs ->
        let new_state = run_single (x, last_state) in
        (new_state, x) :: run_through_msgs ( new_state, xs )
;;
