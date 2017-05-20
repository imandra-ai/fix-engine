(** *)
(***

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017
    
    full_admin_messages.ml

*)

(* @meta[imandra_ignore] on @end *)
open Full_app_tags;;
open Full_admin_tags;;
(* @meta[imandra_ignore] off @end *)


(**
  *  Uniion Tag types 
  *)

(** Union message tag type - needs to be here because it's used within rejection messages. *)
type full_msg_tag =
    | Full_Admin_Msg_Tag of full_admin_msg_tag
    | Full_App_Msg_Tag   of full_app_msg_tag
;;

(** Union field tag type. *)
type full_field_tag = 
    | Full_Admin_Field_Tag of full_admin_field_tag
    | Full_App_Field_Tag   of full_app_field_tag
;;

