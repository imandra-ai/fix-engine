(* Aesthetic Integration copyright 2018 *)

type m_field_tag =
    | M_Field_Text_Tag 
    | M_Field_ExecTransType_Tag 
    | M_Field_ExecID_Tag 
    | M_Field_AvgPx_Tag 
    | M_Field_Side_Tag 
    | M_Field_CxlRejReason_Tag 
    | M_Field_CumQty_Tag 
    | M_Field_MassCancelRequestType_Tag 
    | M_Field_ExecType_Tag 
    | M_Field_CxlRejResponseTo_Tag 
    | M_Field_LeavesQty_Tag 
    | M_Field_TotalAffectedOrders_Tag 
    | M_Field_ErrorCode_Tag 
    | M_Field_Symbol_Tag 
    | M_Field_OrdStatus_Tag 
;;

type m_msg_tag =
    | M_Msg_ExecutionReport_Tag 
    | M_Msg_OrderCancelReject_Tag 
    | M_Msg_OrderMassCancelReport_Tag 
;;
