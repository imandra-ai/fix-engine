(** JSON printer/parser for full application message tags. *)
(*** 

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017
    
    full_app_msg_tag_json.ml

*)

(* @meta[imandra_ignore] on @end *)
open Full_app_message_tag;;
(* @meta[imandra_ignore] off @end *)


let app_msg_tag_to_string = function
    | Full_Msg_ExecutionReport_Tag              -> "ExecutionReport"
    | Full_Msg_OrderCancelRequest_Tag           -> "OrderCancelRequest"
    | Full_Msg_OrderCancelReplaceRequest_Tag    -> "OrderCancelReplaceRequest"
    | Full_Msg_NewOrderSingle_Tag               -> "NewOrderSingle"
    | Full_Msg_CancelReject_Tag                 -> "CancelReject"
;;