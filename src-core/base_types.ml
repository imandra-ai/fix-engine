(** Base FIX types. *)
(***

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017
    
    base_types.ml
*)

type fix_string = 
    | Model_string of int
    | Admin_string of int
    | Empty_string
;;

type fix_symbol = fix_string;;

