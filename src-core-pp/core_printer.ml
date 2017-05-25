(** Printers for core types appearing in messages *)
(***

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    core_printer.ml
    
*)

open Encode_base_types
open Encode_datetime

let fix_float_to_string x =
  encode_float x
;;

let int_to_string x =
  encode_int x
;;

let bool_to_string x =
  encode_bool x
;;

let fix_string_to_string x =
  encode_string x
;;

let fix_utcdateonly_to_string x =
  encode_UTCDateOnly x
;;

let fix_localmktdate_to_string x =
  encode_LocalMktDate x
;;

let fix_utctimeonly_to_string x =
  encode_UTCTimeOnly x
;;

let fix_utctimestamp_to_string x =
  encode_UTCTimestamp x
;;

let fix_monthyear_to_string x =
  encode_MonthYear x
;;

let fix_duration_to_string x =
  encode_Duration x
;;
