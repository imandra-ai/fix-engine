(** Parsers for base types. *)
(***

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    datetime_json.ml 
*)

open Numeric;;
open Base_types;;

let parse_string (str : string) : fix_string option = 
    Some ( String_utils.string_to_fix_string str )
;; 

let parse_symbol (str : string) : fix_symbol option = 
    Some ( String_utils.string_to_fix_string str )
;;

let parse_char (str: string) : int option =
    Some (Char.code str.[0])

let parse_int ( str : string ) : int option = 
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

let parse_float ( str : string ) : fix_float option =
    let mkfloat w f = {fix_float_whole = w; fix_float_fraction = f } in
    let whole, tail = Scanf.sscanf str "%d%s" (fun w f -> (w,f)) in
    if (tail = "") || (tail = ".") then Some ( Float_0 (mkfloat whole 0) ) else
    if String.get tail 0 != '.' then None else
    let fraction = Scanf.sscanf tail ".%d" (fun t -> t) in
    match String.length tail - 1 with
        | 1 -> Some ( Float_1 ( mkfloat whole fraction ) )  
        | 2 -> Some ( Float_2 ( mkfloat whole fraction ) ) 
        | 3 -> Some ( Float_3 ( mkfloat whole fraction ) )
        | 4 -> Some ( Float_4 ( mkfloat whole fraction ) )
        | _ -> None
;;



