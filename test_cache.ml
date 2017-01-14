(** 

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    Implementation of the FIX 4.4 engine.

    Scratch-pad for checking cache handling logic.

    test_cache.ml
    
*)

open Fix_data_dictionary
open Fix_engine
open Fix_engine_pp
open Fix_pp

let pe = print_endline;;

let def_fix_msg = {
    header = default_fix_header;
    msg_data = FIX_heartbeat {
        hb_test_req_id = None;
    };
    trailer = default_fix_trailer;
};;

let make_fix_msg i = {
    def_fix_msg with 
        header = {
            default_fix_header with 
                msg_seq_num = i; }
    } 
;;

let cache = [
    make_fix_msg (1);
    make_fix_msg (10);
    make_fix_msg (15);
];;

print_string "The old cache:\n";;
print_string (msg_list_to_string (cache));;

print_string "\n\nThe new cache\n";;
let new_cache = add_to_cache (make_fix_msg (12), cache);;
print_string (msg_list_to_string (new_cache));;

(** Can we transition correctly? *)
let check_cache (c, idx) = 
    if is_cache_complete (c, idx) then
        print_endline "\nCache complete"
    else
        print_endline "\nCache incomplete"
;;

pe "\nShould be fine - since 0th we have everything";;
check_cache([
    make_fix_msg (1);
    make_fix_msg (2);
    make_fix_msg (3);
    make_fix_msg (4);
], 0);;

pe "\nFails - missing 5-9";;
check_cache([
    make_fix_msg (1);
    make_fix_msg (2);
    make_fix_msg (3);
    make_fix_msg (4);
    make_fix_msg (10);
], 0);;

pe "\Fails - missing 1st";; 
check_cache([
    make_fix_msg (2);
    make_fix_msg (3);
    make_fix_msg (4);
    make_fix_msg (5);
], 0);;

