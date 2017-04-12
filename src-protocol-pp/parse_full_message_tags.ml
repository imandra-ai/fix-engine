(* @meta[imandra_ignore] on @end *)
open Full_message_tags;;
(* open Parse_full_app_tags;; *)
let parse_app_msg_tag str = None;;
open Parse_full_admin_tags;;
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
