(** Full application message tags *)
(***
    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    full_app_message_tag.ml

*)

type full_fix_app_msg_tag = 
    | Full_Msg_ExecutionReport_Tag
    | Full_Msg_OrderCancelRequest_Tag
    | Full_Msg_OrderCancelReplaceRequest_Tag
    | Full_Msg_NewOrderSingle_Tag
    | Full_Msg_CancelReject_Tag
;;