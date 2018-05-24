(** JSON printers/parsers for base FIX types. *)
(***

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2018

    base_types_json.ml 
*)

open Yojson;;
open Numeric;;

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

let char_to_json x = `String x ;;
let char_opt_to_json = function 
    | None -> `Null
    | Some x -> `String x;;

(**
  *  FIX_Float
  *)

let float_0_to_json : fix_float_0 -> json = function
  | Float_0 x ->
     `Assoc
      [ ( "Precision", `Int 0 )
      ; ( "Number"   , `Int x      )
      ]
;;

let float_0_opt_to_json = function 
    | None -> `Null
    | Some x -> float_0_to_json x
;;

let float_1_to_json : fix_float_1 -> json = function
  | Float_1 x ->
    `Assoc
    [ ( "Precision", `Int 1 )
    ; ( "Number"   , `Int x      )
    ]
;;

let float_1_opt_to_json = function 
    | None -> `Null
    | Some x -> float_1_to_json x
;;

let float_2_to_json : fix_float_2 -> json = function
  | Float_2 x ->
    `Assoc
    [ ( "Precision", `Int 2 )
    ; ( "Number"   , `Int x      )
    ]
;;

let float_2_opt_to_json = function 
    | None -> `Null
    | Some x -> float_2_to_json x
;;

let float_3_to_json : fix_float_3 -> json = function
  | Float_3 x ->
    `Assoc
    [ ( "Precision", `Int 3 )
    ; ( "Number"   , `Int x      )
    ]
;;

let float_3_opt_to_json = function 
    | None -> `Null
    | Some x -> float_3_to_json x
;;

let float_4_to_json : fix_float_4 -> json = function
  | Float_4 x ->
    `Assoc
    [ ( "Precision", `Int 4)
    ; ( "Number"   , `Int x      )
    ]
;;

let float_4_opt_to_json = function 
    | None -> `Null
    | Some x -> float_4_to_json x
;;

let float_to_json x = float_4_to_json x;;

let float_opt_to_json x = float_4_opt_to_json x;;

(**
  *  FIX_String
  *)

let string_to_json x : json = 
    `String  x  
;;

let string_opt_to_json = function 
    | None   -> `Null
    | Some x -> string_to_json x
;;


(**
  *  FIX_Symbol
  *)

let symbol_to_json x : json = 
    `String x  
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


