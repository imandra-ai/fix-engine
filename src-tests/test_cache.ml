(** Tests for caching logic. *)

(***

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2021

    test_cache.ml

*)

let pe = print_endline
;;

let _ = print_string "The old cache:\n"
;;

let _ = print_string
  (Yojson.Basic.pretty_to_string
     (Full_messages_json.full_msg_list_to_json Test_cache_utils.cache) )

;;

print_string "\n\nThe new cache\n"

let new_cache =
  Fix_engine_transitions.update_cache
    (List.map 
       (fun x -> Fix_engine_state.CacheMessage x) Test_cache_utils.cache)
    (Fix_engine_state.CacheMessage Test_cache_utils.new_cache_fix_msg)


;;

let print_cache cache_entry = 
  match cache_entry with 
  | Fix_engine_state.CacheMessage m -> 
    Yojson.Basic.pretty_to_string (Full_messages_json.full_valid_msg_to_json m)
  | Fix_engine_state.CacheGap (l,r) -> Yojson.Basic.pretty_to_string 
                                         (`Assoc ([("l",`Int (Z.to_int l));("r",`Int (Z.to_int r))]))
;;

let _ = List.iter 
  (fun x -> let s = print_cache x in print_string s) new_cache


       (* Can we transition correctly? *)
       (* make these fix_msgs in utils and import *)

       ;;
       pe "\nShould be fine - since 0th we have everything"

       ;;
       Test_cache_utils.check_cache
         (List.map (fun x -> Fix_engine_state.CacheMessage x) Test_cache_utils.cache1, Test_cache_utils.test_cache_index)

       ;;
       pe "\nFails - missing 5-9"

       ;;
       Test_cache_utils.check_cache
         (List.map (fun x -> Fix_engine_state.CacheMessage x) Test_cache_utils.cache2, Test_cache_utils.test_cache_index)

       ;;
       pe "\nFails - missing 1st"

       ;;
       Test_cache_utils.check_cache
         (List.map (fun x -> Fix_engine_state.CacheMessage x) Test_cache_utils.cache3, Test_cache_utils.test_cache_index)
