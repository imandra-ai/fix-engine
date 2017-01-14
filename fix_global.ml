(** 

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    Implementation of the FIX 4.4 engine. Global state of the model.

    fix_global.ml 
*)

open Fix_data_dictionary
open Fix_engine
open Yojson
open Fix_engine_pp
open Fix_pp

(* We're combining these to make it easier to run simulations. *)
type msg_to_proc = [
    | `FIX_MSG of fix_message 
    | `INT_MSG of fix_engine_int_msg
];;

(* This is an atomic snapshot of any inputs and resulting outputs of the system. *)
type model_frame = {
    frame_idx           : int;                          (* Frame index *)
    in_msg              : msg_to_proc option;           (* Incoming message to process *)

    engine_state        : fix_engine_state;             (* Resulting state of the engine *)
};;

let inc_msg_to_json = function
    | None -> `Null
    | Some f ->
        match f with 
        | `FIX_MSG m ->
            `Assoc [
                ("fix_message",     (fix_msg_to_json m))
            ]
        | `INT_MSG i ->
            `Assoc [
                ("int_message",     (int_msg_to_json i))
            ]
;;

let frame_to_json f =
    `Assoc [
        ("frame_id",                `Int f.frame_idx);
        ("incoming_msg",            (inc_msg_to_json f.in_msg));
        ("engine_",                 (fix_engine_state_to_json f.engine_state));
    ]
;;

let pretty_frame f =
    Yojson.Basic.pretty_to_string (frame_to_json f)
;;

let pretty_frames fs = 
    String.concat "" (List.map pretty_frame fs)
;;

let print_frame fs i = 
    if i < 0 || i >= List.length fs then "Invalid index"
    else 
        pretty_frame (List.nth fs i)
;;

type fix_engine_global_state = {
    incoming_msgs       : msg_to_proc list;

    outgoing_int_msgs   : fix_engine_int_msg list;
    outgoing_fix_msgs   : fix_message list;
};;


(* Default global state. *)
let def_global_state = {
    incoming_msgs           = [];

    outgoing_int_msgs       = [];
    outgoing_fix_msgs       = [];
};;

let clear_outgoing_fix ( global_state : fix_engine_global_state ) = {
    global_state with 
        outgoing_fix_msgs   = [];
};;

let clear_outgoing_int ( global_state : fix_engine_global_state ) = {
    global_state with 
        outgoing_int_msgs   = [];
};;

(** How would we go about doing all of this? *)
let clear_next ( global_state : fix_engine_global_state ) = 
    global_state
;;

(** Process a single internal transition message? *)
let proc_int_msg (s, im : fix_engine_state * fix_engine_int_msg) = 
    one_step ({ s with incoming_int_msg = Some im })
;;

(** Process a FIX message now. *)
let proc_fix_msg (s, fm : fix_engine_state * fix_message) = 
    one_step ({ s with incoming_fix_msg = Some fm })
;;

(** Execute a single instruction. *)
let run_single (x, last_state) = 
    let new_state = match x with
    | `FIX_MSG f -> proc_fix_msg ( last_state, f )
    | `INT_MSG i -> proc_int_msg ( last_state, i ) in

    let outgoing_fix = new_state.outgoing_fix_msg and
        outgoing_int = new_state.outgoing_int_msg in
    
    (** Now collect the output and store it in our global 
        state and clear out the old incoming message. *) {
        new_state with
            incoming_int_msg = None;
            incoming_fix_msg = None;
            outgoing_fix_msg = None;
            outgoing_int_msg = None;
    }
;;

(* Run until there's nothing to do. Helpful in simulations, etc. *)
let rec run_global_step ( frame_idx, m, engine : int * msg_to_proc * fix_engine_state ) = 
    let engine' = run_single (m, engine) and
        curr_frame = {

        } in 
    if engine' = engine then 
        [ curr_frame ]
    else curr_frame :: run_global_step (engine')
;;

(* Run through all of the messages and return a list of frames. *)
let rec run_through_msgs ( last_state, msgs : fix_engine_state * msg_to_proc list) = 
    match msgs with 
    | [] -> []
    | x::xs ->
        let new_state = run_single (x, last_state) in
        (new_state, x) :: run_through_msgs ( new_state, xs )
;;
