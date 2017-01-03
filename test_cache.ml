
open Fix_data_dictionary
open Fix_engine
open Fix_engine_pp
open Fix_pp

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


let cache_2 = [
    make_fix_msg (1);
    make_fix_msg (2);
    make_fix_msg (3);
    make_fix_msg (4);
];;



let check_cache (c, idx) = 
    if is_cache_complete (c, idx) then
        print_endline "\nCache complete"
    else
        print_endline "\nCache incomplete"
;;

check_cache(cache_2, 0);;


check_cache([
    make_fix_msg (1);
    make_fix_msg (2);
    make_fix_msg (3);
    make_fix_msg (4);
    make_fix_msg (10);
], 0);;


check_cache([
    make_fix_msg (2);
    make_fix_msg (3);
    make_fix_msg (4);
    make_fix_msg (5);
], 0);;
