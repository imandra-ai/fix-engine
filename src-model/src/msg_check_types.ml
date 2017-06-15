(** Message 'receiving' and 'rejecting' logic. *)
(***

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    msg_check_types.ml

*)

(* @meta[imandra_ignore] on @end *)
open Base_types;;
(* @meta[imandra_ignore] off @end *)

type field_state = {
    is_missing                          : bool;
    is_invalid                          : bool;
    field_text                          : fix_string;
}
;;

let fields_are_good = {
    is_missing                          = false;
    is_invalid                          = false;
    field_text                          = Model_string 0;
}
;;

let field_missing ( text : fix_string ) = {
    is_missing                          = true;
    is_invalid                          = false;
    field_text                          = Model_string 0;
}
;;

let field_invalid ( text : fix_string ) = {
    is_missing                          = false;
    is_invalid                          = true;
    field_text                          = text;
}
;;

type validate_reject = {
    validate_invalid    : bool;
    validate_text       : fix_string;}
;;

let no_invalid_validates = {
    validate_invalid    = false;
    validate_text       = Model_string 0;
}
;;

let make_cond ( cond_result, text_str : bool * fix_string ) = {
    validate_invalid    = cond_result;
    validate_text       = text_str;
}
;;
