(** Tests for caching logic. *)
(***

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    test_cache.ml
    
*)

open Yojson
open Full_admin_messages
open Full_messages
open Fix_engine_transitions


let pe = print_endline;;

let def_fix_msg = {
    full_msg_header = default_fix_header;
    full_msg_data = Full_FIX_Admin_Msg ( Full_Msg_Heartbeat { hb_test_req_id = Some 123 });
    full_msg_trailer = default_fix_trailer;
};;

let make_fix_msg i = {
    def_fix_msg with 
        full_msg_header = {
            default_fix_header with 
                h_msg_seq_num = i; }
    } 
;;

let cache = [
    make_fix_msg (1);
    make_fix_msg (10);
    make_fix_msg (15);
];;

print_string "The old cache:\n";;
print_string ( Yojson.pretty_to_string ( Full_messages_json.full_msg_list_to_json (cache) ));;

print_string "\n\nThe new cache\n";;
let new_cache = add_to_cache (make_fix_msg (12), cache);;
print_string ( Yojson.pretty_to_string ( Full_messages_json.full_msg_list_to_json (new_cache) ));;

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

pe "\nFails - missing 1st";; 
check_cache([
    make_fix_msg (2);
    make_fix_msg (3);
    make_fix_msg (4);
    make_fix_msg (5);
], 0);;

