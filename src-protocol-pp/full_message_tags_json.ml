(* @meta[imandra_ignore] on @end *)
open Full_message_tags;;
open Full_app_tags_json;;
open Full_admin_tags_json;;
(* @meta[imandra_ignore] off @end *)


let full_msg_tag_to_json = function
    | Full_Admin_Msg_Tag x -> full_admin_msg_tag_to_json x
    | Full_App_Msg_Tag   x -> full_app_msg_tag_to_json x
;;

let full_msg_tag_opt_to_json = function
    | None -> `Null 
    | Some x -> full_msg_tag_to_json x
;;

let full_field_tag_to_json = function
    | Full_Admin_Field_Tag x -> full_admin_field_tag_to_json x
    | Full_App_Field_Tag   x -> full_app_field_tag_to_json x
;;

let full_field_tag_opt_to_json = function
    | None -> `Null 
    | Some x -> full_field_tag_to_json x
;;
