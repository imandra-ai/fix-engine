(* Aesthetic Integration copyright 2017 *)
(* @meta[imandra_ignore] on @end *)
 open Actions;;
 open Base_types_json;;
 open Datetime_json;;
 open Json_generator_utils;;
 open Model_repeating_groups;;
 open Yojson;;
(* @meta[imandra_ignore] off @end *)

let mod_act_x_to_json ( x ) : json =
    assoc_filter_nulls (("x",int_to_json x.mod_f_x_x) :: [])
;;

let json_of_fix_action ( x ) : json =
    (match x with
        | FIX_Action_x x -> (`Assoc (("tag",`String "x") :: (("data",mod_act_x_to_json x) :: [])))
    )
;;
