(** Model field tags. *)
(***

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    model_fix_fields.ml

*)

(* @meta[imandra_ignore] on @end *)
open Base_types;;
open Datetime;;
(* @meta[imandra_ignore] off @end *)

(** The model would extend this with custom fields. *)
type full_model_field_tag =
    | NoField
;;