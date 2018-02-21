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

let encode_float_0 = function Float_0 x -> Printf.sprintf "%d" x;;
let encode_float_1 = function Float_1 x -> Printf.sprintf "%.1f" ( float_of_int ( x ) /. 10.0 );;
let encode_float_2 = function Float_2 x -> Printf.sprintf "%.2f" ( float_of_int ( x ) /. 100.0 );;
let encode_float_3 = function Float_3 x -> Printf.sprintf "%.3f" ( float_of_int ( x ) /. 1000.0 );;
let encode_float_4 = function Float_4 x -> Printf.sprintf "%.4f" ( float_of_int ( x ) /. 10000.0 );;
let encode_float x = encode_float_4 x;;



let encode_string = fix_string_to_string;;
let encode_symbol = fix_string_to_string;;

let encode_bool : bool -> string = function
    | true  -> "Y" 
    | false -> "N" 
;;