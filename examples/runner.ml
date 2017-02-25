(** 

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    Implementation of the FIX 4.4 engine. Runner of the model.

    runner.ml 
*)

open Full_messages
open Fix_engine

type fix_engine_global_state = {
    incoming_int_msgs : fix_engine_int_msg list;
    outgoing_int_msgs : fix_engine_int_msg list;

    incoming_fix_msgs : fix_message list;
    outgoing_fix_msgs : fix_message list;
};;

let def_global_state = {
    incoming_int_msgs = [];
    outgoing_int_msgs = [];

    incoming_fix_msgs = [];
    outgoing_fix_msgs = [];
};;

let clear_outgoing_fix ( global_state : fix_engine_global_state ) = {
    global_state with 
        outgoing_fix_msgs = [];
};;

let clear_outgoing_int ( global_state : fix_engine_global_state ) = {
    global_state with 
        outgoing_int_msgs = [];
};;

(** Run until there's nothing to do. Helpful in simulations, etc. *)
let rec run_global_step ( engine : fix_engine_state ) = 
    let engine' = one_step (engine) in 
    if engine' = engine then engine
    else run_global_step (engine')
;;
