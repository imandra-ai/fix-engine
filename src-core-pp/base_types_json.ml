(** JSON printers/parsers for base FIX types. *)
(***

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    base_types_json.ml 
*)

(* @meta[imandra_ignore] on @end *)
open Yojson;;
open Base_types;;
open Numeric;;
open String_utils;;
(* @meta[imandra_ignore] off @end *)

(**
  *  Int
  *)

let int_to_json x : json = `Int x ;;

let int_opt_to_json : int option -> json = function
    | None   -> `Null
    | Some x -> int_to_json x
;;


(**
  *  Char
  *)

let char_to_json = int_to_json ;;
let char_opt_to_json = int_opt_to_json;;

(**
  *  FIX_Float
  *)

let float_0_to_json x : json = 
    `Assoc 
    [ ( "Precision", `Int 0 ) 
    ; ( "Number"   , `Int x      ) 
    ] 
;;

let float_0_opt_to_json = function 
    | None -> `Null
    | Some x -> float_0_to_json x
;;

let float_1_to_json x : json = 
    `Assoc 
    [ ( "Precision", `Int 1 ) 
    ; ( "Number"   , `Int x      ) 
    ] 
;;

let float_1_opt_to_json = function 
    | None -> `Null
    | Some x -> float_1_to_json x
;;

let float_2_to_json x : json = 
    `Assoc 
    [ ( "Precision", `Int 2 ) 
    ; ( "Number"   , `Int x      ) 
    ] 
;;

let float_2_opt_to_json = function 
    | None -> `Null
    | Some x -> float_1_to_json x
;;

let float_3_to_json x : json = 
    `Assoc 
    [ ( "Precision", `Int 3 ) 
    ; ( "Number"   , `Int x      ) 
    ] 
;;

let float_3_opt_to_json = function 
    | None -> `Null
    | Some x -> float_1_to_json x
;;

let float_4_to_json x : json = 
    `Assoc 
    [ ( "Precision", `Int 4) 
    ; ( "Number"   , `Int x      ) 
    ] 
;;

let float_4_opt_to_json = function 
    | None -> `Null
    | Some x -> float_1_to_json x
;;

(**
  *  FIX_String
  *)

let string_to_json x : json = 
    `String ( fix_string_to_string x ) 
;;

let string_opt_to_json = function 
    | None   -> `Null
    | Some x -> string_to_json x
;;


(**
  *  FIX_Symbol
  *)

let symbol_to_json x : json = 
    `String ( fix_string_to_string x ) 
;;

let symbol_opt_to_json = function 
    | None   -> `Null
    | Some x -> symbol_to_json x
;;


(**
  *  FIX_Bool
  *)

let bool_to_json : bool -> json = function
    | true  -> `String "true" 
    | false -> `String "false" 
;;


let bool_opt_to_json : bool option -> json = function
    | None   -> `Null
    | Some x -> bool_to_json x 
;;


