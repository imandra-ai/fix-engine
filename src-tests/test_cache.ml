(** Tests for caching logic. *)
(***

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2018

    test_cache.ml
    
*)

let pe = print_endline;;


print_string "The old cache:\n";;
print_string ( Yojson.pretty_to_string ( Full_messages_json.full_msg_list_to_json (Test_cache_utils.cache) ));;

print_string "\n\nThe new cache\n";; 
let new_cache = Fix_engine_transitions.add_to_cache (Test_cache_utils.new_cache_fix_msg, Test_cache_utils.cache);;
print_string ( Yojson.pretty_to_string ( Full_messages_json.full_msg_list_to_json (new_cache) ));;

(* Can we transition correctly? *)
(* make these fix_msgs in utils and import *)
pe "\nShould be fine - since 0th we have everything";;
Test_cache_utils.check_cache(Test_cache_utils.cache1, Test_cache_utils.test_cache_index);;

pe "\nFails - missing 5-9";;
Test_cache_utils.check_cache(Test_cache_utils.cache2, Test_cache_utils.test_cache_index);;

pe "\nFails - missing 1st";; 
Test_cache_utils.check_cache(Test_cache_utils.cache3, Test_cache_utils.test_cache_index);;
