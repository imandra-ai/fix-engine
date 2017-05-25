(** Utility module for conversion between raw OCaml strings and their int representation in imandra *)
(***

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    datetime_json.ml 
*)


open Base_types;;

let fix_to_str_hashtbl : (fix_string, string) Hashtbl.t = Hashtbl.create 10;;
let str_to_fix_hashtbl : (string, fix_string) Hashtbl.t = Hashtbl.create 10;;

let fix_string_to_string fixstr = Hashtbl.find fix_to_str_hashtbl fixstr;;

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
