(** Parsers for base types. *)
(***

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    datetime_json.ml 
*)

(* @meta[imandra_ignore] on @end *)
open Numeric;;
open Base_types;;
(* @meta[imandra_ignore] off @end *)

let parse_string (str : string) : fix_string option = 
    Some ( String_utils.string_to_fix_string str )
;; 

let parse_symbol (str : string) : fix_symbol option = 
    Some ( String_utils.string_to_fix_string str )
;;

let parse_char (str: string) : int option =
    Some (Char.code str.[0])

let parse_int ( str : string ) : int option = 
    if String.get str 0 = '+' then None else
    try 
        Some(int_of_string str) 
    with _ -> None
;;

let parse_bool ( str : string) : bool option = 
    match str with 
    | "Y" -> Some true 
    | "N" -> Some false 
    | _ -> None
;;

(** Convert string to fix_float type. *)
let parse_float (str: string) : fix_float_4 option = 
    if String.get str 0 = '+' then None else
    let whole, tail = Scanf.sscanf str "%d%s" (fun w f -> (w,f)) in
    if (tail = "") || (tail = ".") then Some ( whole * 10000 ) else
    if String.get tail 0 != '.' then None else
    let fraction = Scanf.sscanf tail ".%d" (fun t -> t) in
    if (String.length tail - 1) <= 4 then
    Some (whole * 10000 + fraction)
    else None
;;

