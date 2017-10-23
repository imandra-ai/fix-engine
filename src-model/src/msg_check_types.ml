(* Aesthetic Integration copyright 2017 *)
(* @meta[imandra_ignore] on @end *)
 open Base_types;;
(* @meta[imandra_ignore] off @end *)

type field_state = {
    is_invalid : bool;
    field_text : fix_string
}
;;

let fields_are_good = {
    is_invalid = false;
    field_text = Model_string 0
};;

let field_invalid ( text : fix_string ) =
    {
        is_invalid = true;
        field_text = text
    }
;;

type validate_reject = {
    validate_invalid : bool;
    validate_text : fix_string
}
;;

let no_invalid_validates = {
    validate_invalid = false;
    validate_text = Model_string 0
};;

let make_cond ( cond_result , text : bool * fix_string ) =
    {
        validate_invalid = not cond_result;
        validate_text = text
    }
;;
