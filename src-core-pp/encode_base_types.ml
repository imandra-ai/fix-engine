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


let encode_int  = string_of_int ;;
let encode_char = string_of_int ;;

let encode_float = function
    | Float_0 x -> Printf.sprintf "%d" x
    | Float_1 x -> Printf.sprintf "%.1f" ( float_of_int ( x ) /. 10.0 )
    | Float_2 x -> Printf.sprintf "%.2f" ( float_of_int ( x ) /. 100.0 )
    | Float_3 x -> Printf.sprintf "%.3f" ( float_of_int ( x ) /. 1000.0 )
    | Float_4 x -> Printf.sprintf "%.4f" ( float_of_int ( x ) /. 10000.0 )
    | Float_5 x -> Printf.sprintf "%.5f" ( float_of_int ( x ) /. 100000.0 )
    | Float_6 x -> Printf.sprintf "%.6f" ( float_of_int ( x ) /. 1000000.0 )
;;

let encode_string = fix_string_to_string;;
let encode_symbol = fix_string_to_string;;

let encode_bool : bool -> string = function
    | true  -> "Y" 
    | false -> "N" 
;;