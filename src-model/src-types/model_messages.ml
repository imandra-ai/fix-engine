(* Aesthetic Integration copyright 2018 *)
open Datetime;;
open Model_app_enums;;
open Model_repeating_groups;;
open Model_tags;;
open Numeric;;

type mod_ordersingle_data = {
    mod_f_OrderSingle_ClOrdID : string;
    mod_f_OrderSingle_Symbol : string;
    mod_f_OrderSingle_Side : model_fix_side;
    mod_f_OrderSingle_OrdType : model_fix_ordtype;
    mod_f_OrderSingle_TimeInForce : model_fix_timeinforce option;
    mod_f_OrderSingle_ExecInst : model_fix_execinst option;
    mod_f_OrderSingle_Price : fix_float_4 option;
    mod_f_OrderSingle_OrderQty : fix_float_4;
    mod_f_OrderSingle_BookIndicator : model_fix_bookindicator option;
    mod_f_OrderSingle_MinQty : fix_float_4 option;
    mod_f_OrderSingle_PegDifference : fix_float_4 option;
    mod_f_OrderSingle_TransactTime : fix_utctimestamp;
    mod_f_OrderSingle_Currency : model_fix_currency option;
    mod_f_OrderSingle_HandlInst : model_fix_handlinst;
    mod_f_OrderSingle_TechnicalOrdType : model_fix_technicalordtype;
    mod_f_OrderSingle_MIC : string;
    mod_f_OrderSingle_BrokerPrioritization : model_fix_brokerprioritization;
    mod_f_OrderSingle_DEAIndicator : int;
    mod_f_OrderSingle_Parties : model_fix_rec_parties;
    mod_f_OrderSingle_ClearingEntries : model_fix_rec_clearingentries;
    mod_f_OrderSingle_OrderAttributeTypes : model_fix_orderattributetypes option
}
;;

type mod_ordercancelreplacerequest_data = {
    mod_f_OrderCancelReplaceRequest_OrderID : string option;
    mod_f_OrderCancelReplaceRequest_ClOrdID : string;
    mod_f_OrderCancelReplaceRequest_OrigClOrdID : string;
    mod_f_OrderCancelReplaceRequest_Symbol : string;
    mod_f_OrderCancelReplaceRequest_Side : model_fix_side;
    mod_f_OrderCancelReplaceRequest_OrdType : model_fix_ordtype;
    mod_f_OrderCancelReplaceRequest_TimeInForce : model_fix_timeinforce option;
    mod_f_OrderCancelReplaceRequest_ExecInst : model_fix_execinst option;
    mod_f_OrderCancelReplaceRequest_Price : fix_float_4 option;
    mod_f_OrderCancelReplaceRequest_OrderQty : fix_float_4;
    mod_f_OrderCancelReplaceRequest_PegDifference : fix_float_4 option;
    mod_f_OrderCancelReplaceRequest_TechnicalOrdType : model_fix_technicalordtype option;
    mod_f_OrderCancelReplaceRequest_Rule80A : model_fix_rule80a;
    mod_f_OrderCancelReplaceRequest_Account : string option;
    mod_f_OrderCancelReplaceRequest_ClientID : string option;
    mod_f_OrderCancelReplaceRequest_FreeText : string option;
    mod_f_OrderCancelReplaceRequest_ClearingFirm : string option;
    mod_f_OrderCancelReplaceRequest_OpenClose : model_fix_openclose option;
    mod_f_OrderCancelReplaceRequest_ClearingHandlingType : model_fix_clearinghandlingtype option;
    mod_f_OrderCancelReplaceRequest_MIC : string option;
    mod_f_OrderCancelReplaceRequest_Currency : model_fix_currency option
}
;;

type mod_ordercancelrequest_data = {
    mod_f_OrderCancelRequest_OrderID : string option;
    mod_f_OrderCancelRequest_ClOrdID : string;
    mod_f_OrderCancelRequest_OrigClOrdID : string;
    mod_f_OrderCancelRequest_Symbol : string;
    mod_f_OrderCancelRequest_OrderQty : fix_float_4 option;
    mod_f_OrderCancelRequest_TransactTime : fix_utctimestamp option;
    mod_f_OrderCancelRequest_MIC : string option;
    mod_f_OrderCancelRequest_Currency : model_fix_currency option
}
;;

type mod_ordermasscancelrequest_data = {
    mod_f_OrderMassCancelRequest_ClOrdID : string option;
    mod_f_OrderMassCancelRequest_Symbol : string option;
    mod_f_OrderMassCancelRequest_ClassID : string option;
    mod_f_OrderMassCancelRequest_MassCancelRequestType : model_fix_masscancelrequesttype option;
    mod_f_OrderMassCancelRequest_Side : model_fix_side option;
    mod_f_OrderMassCancelRequest_TechnicalOrdType : model_fix_technicalordtype option;
    mod_f_OrderMassCancelRequest_Rule80A : model_fix_rule80a option;
    mod_f_OrderMassCancelRequest_Account : string option;
    mod_f_OrderMassCancelRequest_CancelByLocationID : string option;
    mod_f_OrderMassCancelRequest_TransactTime : fix_utctimestamp option
}
;;

type mod_executionreport_data = {
    mod_f_ExecutionReport_OrderID : string option;
    mod_f_ExecutionReport_Symbol : string option;
    mod_f_ExecutionReport_ExecID : string;
    mod_f_ExecutionReport_ExecTransType : model_fix_exectranstype;
    mod_f_ExecutionReport_OrdStatus : model_fix_ordstatus;
    mod_f_ExecutionReport_ExecType : model_fix_exectype;
    mod_f_ExecutionReport_AvgPx : fix_float_4;
    mod_f_ExecutionReport_Side : model_fix_side;
    mod_f_ExecutionReport_LeavesQty : fix_float_4;
    mod_f_ExecutionReport_CumQty : fix_float_4;
    mod_f_ExecutionReport_Text : string;
    mod_f_ExecutionReport_FreeText : string option;
    mod_f_ExecutionReport_ClearingHandlingType : model_fix_clearinghandlingtype option;
    mod_f_ExecutionReport_UTPExID : int option;
    mod_f_ExecutionReport_LiquidityIndicator : model_fix_liquidityindicator option;
    mod_f_ExecutionReport_ErrorCode : int option;
    mod_f_ExecutionReport_MIC : string option;
    mod_f_ExecutionReport_BookIndicator : model_fix_bookindicator option;
    mod_f_ExecutionReport_BrokerPrioritization : model_fix_brokerprioritization option;
    mod_f_ExecutionReport_DEAIndicator : int option;
    mod_f_ExecutionReport_OrderAttributeTypes : model_fix_orderattributetypes option;
    mod_f_ExecutionReport_ClOrdID : string option;
    mod_f_ExecutionReport_OrigClOrdID : string option;
    mod_f_ExecutionReport_TransactTime : fix_utctimestamp option;
    mod_f_ExecutionReport_OrdRejReason : model_fix_ordrejreason option;
    mod_f_ExecutionReport_ExecRefID : string option;
    mod_f_ExecutionReport_LastPx : fix_float_4 option;
    mod_f_ExecutionReport_LastShares : fix_float_4 option;
    mod_f_ExecutionReport_OrdType : model_fix_ordtype option;
    mod_f_ExecutionReport_TimeInForce : model_fix_timeinforce option;
    mod_f_ExecutionReport_ExecInst : model_fix_execinst option;
    mod_f_ExecutionReport_Price : fix_float_4 option;
    mod_f_ExecutionReport_OrderQty : fix_float_4 option;
    mod_f_ExecutionReport_PegDifference : fix_float_4 option;
    mod_f_ExecutionReport_Account : string option;
    mod_f_ExecutionReport_ClientID : string option;
    mod_f_ExecutionReport_ClearingFirm : string option;
    mod_f_ExecutionReport_OpenClose : model_fix_openclose option;
    mod_f_ExecutionReport_Currency : model_fix_currency option;
    mod_f_ExecutionReport_TechnicalOrdType : model_fix_technicalordtype option;
    mod_f_ExecutionReport_CrossType : model_fix_crosstype option;
    mod_f_ExecutionReport_IMPTimestamp : fix_utctimeonly option;
    mod_f_ExecutionReport_Parties : model_fix_rec_parties;
    mod_f_ExecutionReport_ContraGrp : model_fix_rec_contragrp
}
;;

type mod_ordercancelreject_data = {
    mod_f_OrderCancelReject_ClOrdID : string option;
    mod_f_OrderCancelReject_OrigClOrdID : string option;
    mod_f_OrderCancelReject_OrderID : string option;
    mod_f_OrderCancelReject_Symbol : string;
    mod_f_OrderCancelReject_ExecInst : model_fix_execinst option;
    mod_f_OrderCancelReject_OrdStatus : model_fix_ordstatus;
    mod_f_OrderCancelReject_ErrorCode : int;
    mod_f_OrderCancelReject_Text : string;
    mod_f_OrderCancelReject_CxlRejReason : model_fix_cxlrejreason;
    mod_f_OrderCancelReject_CxlRejResponseTo : model_fix_cxlrejresponseto
}
;;

type mod_ordermasscancelreport_data = {
    mod_f_OrderMassCancelReport_ClOrdID : string option;
    mod_f_OrderMassCancelReport_Symbol : string option;
    mod_f_OrderMassCancelReport_ClassID : string option;
    mod_f_OrderMassCancelReport_MassCancelRequestType : model_fix_masscancelrequesttype;
    mod_f_OrderMassCancelReport_Side : model_fix_side option;
    mod_f_OrderMassCancelReport_TechnicalOrdType : model_fix_technicalordtype option;
    mod_f_OrderMassCancelReport_Rule80A : model_fix_rule80a option;
    mod_f_OrderMassCancelReport_Account : string option;
    mod_f_OrderMassCancelReport_CancelByLocationID : string option;
    mod_f_OrderMassCancelReport_TotalAffectedOrders : int;
    mod_f_OrderMassCancelReport_TransactTime : fix_utctimestamp option;
    mod_f_OrderMassCancelReport_MIC : string option
}
;;

type model_msg =
    | FIX_Msg_OrderSingle of mod_ordersingle_data
    | FIX_Msg_OrderCancelReplaceRequest of mod_ordercancelreplacerequest_data
    | FIX_Msg_OrderCancelRequest of mod_ordercancelrequest_data
    | FIX_Msg_OrderMassCancelRequest of mod_ordermasscancelrequest_data
    | FIX_Msg_ExecutionReport of mod_executionreport_data
    | FIX_Msg_OrderCancelReject of mod_ordercancelreject_data
    | FIX_Msg_OrderMassCancelReport of mod_ordermasscancelreport_data
;;

let is_msg_inbound (msg : model_msg)  =
    (match msg with
        | FIX_Msg_OrderSingle _ -> false
        | FIX_Msg_OrderCancelReplaceRequest _ -> false
        | FIX_Msg_OrderCancelRequest _ -> false
        | FIX_Msg_OrderMassCancelRequest _ -> false
        | FIX_Msg_ExecutionReport _ -> true
        | FIX_Msg_OrderCancelReject _ -> true
        | FIX_Msg_OrderMassCancelReport _ -> true
    )
;;

type field_missing_data = {
    field_missing_data_field : m_field_tag;
    field_missing_data_msg : m_msg_tag
}
;;

type model_top_level_msg =
    | FIX_TL_Normal of model_msg
    | FIX_TL_Req_Field_Missing of field_missing_data
    | FIX_TL_PossibleResend of model_msg
    | FIX_TL_None 
;;
