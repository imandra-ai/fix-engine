(** JSON printer/parser for full application message tags. *)
(*** 

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017
    
    full_app_msg_tag_json.ml

*)

(* @meta[imandra_ignore] on @end *)
open Model_fields;;
(* @meta[imandra_ignore] off @end *)

let model_field_to_string = function
    | NoField   -> "NoField"
;;