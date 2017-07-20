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

let encode_float x : string = 
    let data, precision = match x with
        | Float_0 x -> x, 0
        | Float_1 x -> x, 1
        | Float_2 x -> x, 2
        | Float_3 x -> x, 3
        | Float_4 x -> x, 4
    in Printf.sprintf "%d.%d" data.fix_float_whole data.fix_float_fraction
;;

let encode_string = fix_string_to_string;;
let encode_symbol = fix_string_to_string;;

let encode_bool : bool -> string = function
    | true  -> "Y" 
    | false -> "N" 
;;