(* @meta[imandra_ignore] on @end *)
open Full_message_tags;;
open Parse_app_tags;; 
open Parse_admin_tags;;
(* @meta[imandra_ignore] off @end *)

let parse_full_msg_tag str = 
    match parse_admin_msg_tag str with
    | Some x -> Some (Full_Admin_Msg_Tag x)
    | None   -> begin 
        match parse_app_msg_tag str with
        | Some x -> Some (Full_App_Msg_Tag x)
        | None   -> None 
    end
;;


let parse_full_field_tag msg_tag str = 
    match msg_tag with
    | Full_Admin_Msg_Tag msg_tag -> (
        match parse_admin_field_tag msg_tag str with 
        | None   -> None 
        | Some x -> Some (Full_Admin_Field_Tag x)  )
    | Full_App_Msg_Tag   msg_tag -> (
        match parse_app_field_tag msg_tag str with 
        | None   -> None 
        | Some x -> Some (Full_App_Field_Tag x) )
;;
