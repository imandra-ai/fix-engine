(** Utility module for conversion between raw OCaml strings and their int representation in imandra *)
(***

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    datetime_json.ml 
*)


open Base_types;;

let fix_to_str_hashtbl : (fix_string, string) Hashtbl.t = Hashtbl.create 10;;
let str_to_fix_hashtbl : (string, fix_string) Hashtbl.t = Hashtbl.create 10;;

let add_model_string ( fixstr, rawstr : fix_string * string ) : unit = 
    ( match fixstr with
        | Model_string hash -> print_endline ( "Adding model string \"" ^ string_of_int hash ^ "\".")
        | Admin_string hash -> print_endline ( "Adding admin string \"" ^ string_of_int hash ^ "\".")
    );
    Hashtbl.add str_to_fix_hashtbl rawstr fixstr;
    Hashtbl.add fix_to_str_hashtbl fixstr rawstr
;;

add_model_string ( Model_string 1, "Empty");;

let fix_string_to_string fixstr = 
    if not (Hashtbl.mem fix_to_str_hashtbl fixstr) then
        ( match fixstr with
            | Model_string hash -> failwith ( "Unrecognized model string \"" ^ string_of_int hash ^ "\".")
            | Admin_string hash -> failwith ( "Unrecognized admin string \"" ^ string_of_int hash ^ "\".")
        )
    else Hashtbl.find fix_to_str_hashtbl fixstr;;

let string_to_fix_string rawstr =
    if Hashtbl.mem str_to_fix_hashtbl rawstr then
        Hashtbl.find str_to_fix_hashtbl rawstr
    else begin
        let hash = Admin_string ( Hashtbl.hash rawstr ) in
        Hashtbl.add str_to_fix_hashtbl rawstr hash;
        Hashtbl.add fix_to_str_hashtbl hash rawstr;
        hash
    end
;;
