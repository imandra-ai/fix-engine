(* Aesthetic Integration copyright 2018 *)
open Actions;;
open Model_messages;;

let isAction (str : string)  =
    (match str with
        | "Actions.FIX_Action_neworder" -> true
        | "Actions.FIX_Action_cancelreplace" -> true
        | "Actions.FIX_Action_cancel" -> true
        | "Actions.FIX_Action_masscancel" -> true
        | _ -> false
    )
;;

let isActionData (str : string)  =
    (match str with
        | "Actions.m_action_fix_neworder" -> true
        | "Actions.m_action_fix_cancelreplace" -> true
        | "Actions.m_action_fix_cancel" -> true
        | "Actions.m_action_fix_masscancel" -> true
        | _ -> false
    )
;;

let isActionField (str : string)  =
    (match str with
        | "Actions.mod_f_neworder_ClOrdID" -> true
        | "Actions.mod_f_neworder_Symbol" -> true
        | "Actions.mod_f_neworder_Side" -> true
        | "Actions.mod_f_neworder_OrdType" -> true
        | "Actions.mod_f_neworder_TimeInForce" -> true
        | "Actions.mod_f_neworder_ExecInst" -> true
        | "Actions.mod_f_neworder_Price" -> true
        | "Actions.mod_f_neworder_OrderQty" -> true
        | "Actions.mod_f_neworder_BookIndicator" -> true
        | "Actions.mod_f_neworder_MinQty" -> true
        | "Actions.mod_f_neworder_PegDifference" -> true
        | "Actions.mod_f_neworder_TransactTime" -> true
        | "Actions.mod_f_neworder_Currency" -> true
        | "Actions.mod_f_neworder_HandlInst" -> true
        | "Actions.mod_f_neworder_TechnicalOrdType" -> true
        | "Actions.mod_f_neworder_MIC" -> true
        | "Actions.mod_f_neworder_BrokerPrioritization" -> true
        | "Actions.mod_f_neworder_DEAIndicator" -> true
        | "Actions.mod_f_neworder_Parties" -> true
        | "Actions.mod_f_neworder_ClearingEntries" -> true
        | "Actions.mod_f_neworder_OrderAttributeTypes" -> true
        | "Actions.mod_f_cancelreplace_OrderID" -> true
        | "Actions.mod_f_cancelreplace_ClOrdID" -> true
        | "Actions.mod_f_cancelreplace_OrigClOrdID" -> true
        | "Actions.mod_f_cancelreplace_Symbol" -> true
        | "Actions.mod_f_cancelreplace_Side" -> true
        | "Actions.mod_f_cancelreplace_OrdType" -> true
        | "Actions.mod_f_cancelreplace_TimeInForce" -> true
        | "Actions.mod_f_cancelreplace_ExecInst" -> true
        | "Actions.mod_f_cancelreplace_Price" -> true
        | "Actions.mod_f_cancelreplace_OrderQty" -> true
        | "Actions.mod_f_cancelreplace_PegDifference" -> true
        | "Actions.mod_f_cancelreplace_TechnicalOrdType" -> true
        | "Actions.mod_f_cancelreplace_Rule80A" -> true
        | "Actions.mod_f_cancelreplace_Account" -> true
        | "Actions.mod_f_cancelreplace_ClientID" -> true
        | "Actions.mod_f_cancelreplace_FreeText" -> true
        | "Actions.mod_f_cancelreplace_ClearingFirm" -> true
        | "Actions.mod_f_cancelreplace_OpenClose" -> true
        | "Actions.mod_f_cancelreplace_ClearingHandlingType" -> true
        | "Actions.mod_f_cancelreplace_MIC" -> true
        | "Actions.mod_f_cancelreplace_Currency" -> true
        | "Actions.mod_f_cancel_OrderID" -> true
        | "Actions.mod_f_cancel_ClOrdID" -> true
        | "Actions.mod_f_cancel_OrigClOrdID" -> true
        | "Actions.mod_f_cancel_Symbol" -> true
        | "Actions.mod_f_cancel_OrderQty" -> true
        | "Actions.mod_f_cancel_TransactTime" -> true
        | "Actions.mod_f_cancel_MIC" -> true
        | "Actions.mod_f_cancel_Currency" -> true
        | "Actions.mod_f_masscancel_ClOrdID" -> true
        | "Actions.mod_f_masscancel_Symbol" -> true
        | "Actions.mod_f_masscancel_ClassID" -> true
        | "Actions.mod_f_masscancel_MassCancelRequestType" -> true
        | "Actions.mod_f_masscancel_Side" -> true
        | "Actions.mod_f_masscancel_TechnicalOrdType" -> true
        | "Actions.mod_f_masscancel_Rule80A" -> true
        | "Actions.mod_f_masscancel_Account" -> true
        | "Actions.mod_f_masscancel_CancelByLocationID" -> true
        | "Actions.mod_f_masscancel_TransactTime" -> true
        | _ -> false
    )
;;

let isModelFieldTag (str : string)  =
    (match str with
        | "Model_tags.M_Field_ClOrdID_Tag" -> true
        | "Model_tags.M_Field_Symbol_Tag" -> true
        | "Model_tags.M_Field_Side_Tag" -> true
        | "Model_tags.M_Field_OrdType_Tag" -> true
        | "Model_tags.M_Field_TimeInForce_Tag" -> true
        | "Model_tags.M_Field_ExecInst_Tag" -> true
        | "Model_tags.M_Field_Price_Tag" -> true
        | "Model_tags.M_Field_OrderQty_Tag" -> true
        | "Model_tags.M_Field_BookIndicator_Tag" -> true
        | "Model_tags.M_Field_MinQty_Tag" -> true
        | "Model_tags.M_Field_PegDifference_Tag" -> true
        | "Model_tags.M_Field_TransactTime_Tag" -> true
        | "Model_tags.M_Field_Currency_Tag" -> true
        | "Model_tags.M_Field_HandlInst_Tag" -> true
        | "Model_tags.M_Field_TechnicalOrdType_Tag" -> true
        | "Model_tags.M_Field_MIC_Tag" -> true
        | "Model_tags.M_Field_BrokerPrioritization_Tag" -> true
        | "Model_tags.M_Field_DEAIndicator_Tag" -> true
        | "Model_tags.M_Field_Parties_Tag" -> true
        | "Model_tags.M_Field_ClearingEntries_Tag" -> true
        | "Model_tags.M_Field_OrderAttributeTypes_Tag" -> true
        | "Model_tags.M_Field_OrderID_Tag" -> true
        | "Model_tags.M_Field_OrigClOrdID_Tag" -> true
        | "Model_tags.M_Field_Rule80A_Tag" -> true
        | "Model_tags.M_Field_Account_Tag" -> true
        | "Model_tags.M_Field_ClientID_Tag" -> true
        | "Model_tags.M_Field_FreeText_Tag" -> true
        | "Model_tags.M_Field_ClearingFirm_Tag" -> true
        | "Model_tags.M_Field_OpenClose_Tag" -> true
        | "Model_tags.M_Field_ClearingHandlingType_Tag" -> true
        | "Model_tags.M_Field_ClassID_Tag" -> true
        | "Model_tags.M_Field_MassCancelRequestType_Tag" -> true
        | "Model_tags.M_Field_CancelByLocationID_Tag" -> true
        | "Model_tags.M_Field_ExecID_Tag" -> true
        | "Model_tags.M_Field_ExecTransType_Tag" -> true
        | "Model_tags.M_Field_OrdStatus_Tag" -> true
        | "Model_tags.M_Field_ExecType_Tag" -> true
        | "Model_tags.M_Field_AvgPx_Tag" -> true
        | "Model_tags.M_Field_LeavesQty_Tag" -> true
        | "Model_tags.M_Field_CumQty_Tag" -> true
        | "Model_tags.M_Field_Text_Tag" -> true
        | "Model_tags.M_Field_UTPExID_Tag" -> true
        | "Model_tags.M_Field_LiquidityIndicator_Tag" -> true
        | "Model_tags.M_Field_ErrorCode_Tag" -> true
        | "Model_tags.M_Field_OrdRejReason_Tag" -> true
        | "Model_tags.M_Field_ExecRefID_Tag" -> true
        | "Model_tags.M_Field_LastPx_Tag" -> true
        | "Model_tags.M_Field_LastShares_Tag" -> true
        | "Model_tags.M_Field_CrossType_Tag" -> true
        | "Model_tags.M_Field_IMPTimestamp_Tag" -> true
        | "Model_tags.M_Field_ContraGrp_Tag" -> true
        | "Model_tags.M_Field_CxlRejReason_Tag" -> true
        | "Model_tags.M_Field_CxlRejResponseTo_Tag" -> true
        | "Model_tags.M_Field_TotalAffectedOrders_Tag" -> true
        | _ -> false
    )
;;

let isModelMessageTag (str : string)  =
    (match str with
        | "Model_tags.M_Msg_OrderSingle_Tag" -> true
        | "Model_tags.M_Msg_OrderCancelReplaceRequest_Tag" -> true
        | "Model_tags.M_Msg_OrderCancelRequest_Tag" -> true
        | "Model_tags.M_Msg_OrderMassCancelRequest_Tag" -> true
        | "Model_tags.M_Msg_ExecutionReport_Tag" -> true
        | "Model_tags.M_Msg_OrderCancelReject_Tag" -> true
        | "Model_tags.M_Msg_OrderMassCancelReport_Tag" -> true
        | _ -> false
    )
;;

let isMessageField (str : string)  =
    (match str with
        | "Model_messages.mod_f_OrderSingle_ClOrdID" -> true
        | "Model_messages.mod_f_OrderSingle_Symbol" -> true
        | "Model_messages.mod_f_OrderSingle_Side" -> true
        | "Model_messages.mod_f_OrderSingle_OrdType" -> true
        | "Model_messages.mod_f_OrderSingle_TimeInForce" -> true
        | "Model_messages.mod_f_OrderSingle_ExecInst" -> true
        | "Model_messages.mod_f_OrderSingle_Price" -> true
        | "Model_messages.mod_f_OrderSingle_OrderQty" -> true
        | "Model_messages.mod_f_OrderSingle_BookIndicator" -> true
        | "Model_messages.mod_f_OrderSingle_MinQty" -> true
        | "Model_messages.mod_f_OrderSingle_PegDifference" -> true
        | "Model_messages.mod_f_OrderSingle_TransactTime" -> true
        | "Model_messages.mod_f_OrderSingle_Currency" -> true
        | "Model_messages.mod_f_OrderSingle_HandlInst" -> true
        | "Model_messages.mod_f_OrderSingle_TechnicalOrdType" -> true
        | "Model_messages.mod_f_OrderSingle_MIC" -> true
        | "Model_messages.mod_f_OrderSingle_BrokerPrioritization" -> true
        | "Model_messages.mod_f_OrderSingle_DEAIndicator" -> true
        | "Model_messages.mod_f_OrderSingle_Parties" -> true
        | "Model_messages.mod_f_OrderSingle_ClearingEntries" -> true
        | "Model_messages.mod_f_OrderSingle_OrderAttributeTypes" -> true
        | "Model_messages.mod_f_OrderCancelReplaceRequest_OrderID" -> true
        | "Model_messages.mod_f_OrderCancelReplaceRequest_ClOrdID" -> true
        | "Model_messages.mod_f_OrderCancelReplaceRequest_OrigClOrdID" -> true
        | "Model_messages.mod_f_OrderCancelReplaceRequest_Symbol" -> true
        | "Model_messages.mod_f_OrderCancelReplaceRequest_Side" -> true
        | "Model_messages.mod_f_OrderCancelReplaceRequest_OrdType" -> true
        | "Model_messages.mod_f_OrderCancelReplaceRequest_TimeInForce" -> true
        | "Model_messages.mod_f_OrderCancelReplaceRequest_ExecInst" -> true
        | "Model_messages.mod_f_OrderCancelReplaceRequest_Price" -> true
        | "Model_messages.mod_f_OrderCancelReplaceRequest_OrderQty" -> true
        | "Model_messages.mod_f_OrderCancelReplaceRequest_PegDifference" -> true
        | "Model_messages.mod_f_OrderCancelReplaceRequest_TechnicalOrdType" -> true
        | "Model_messages.mod_f_OrderCancelReplaceRequest_Rule80A" -> true
        | "Model_messages.mod_f_OrderCancelReplaceRequest_Account" -> true
        | "Model_messages.mod_f_OrderCancelReplaceRequest_ClientID" -> true
        | "Model_messages.mod_f_OrderCancelReplaceRequest_FreeText" -> true
        | "Model_messages.mod_f_OrderCancelReplaceRequest_ClearingFirm" -> true
        | "Model_messages.mod_f_OrderCancelReplaceRequest_OpenClose" -> true
        | "Model_messages.mod_f_OrderCancelReplaceRequest_ClearingHandlingType" -> true
        | "Model_messages.mod_f_OrderCancelReplaceRequest_MIC" -> true
        | "Model_messages.mod_f_OrderCancelReplaceRequest_Currency" -> true
        | "Model_messages.mod_f_OrderCancelRequest_OrderID" -> true
        | "Model_messages.mod_f_OrderCancelRequest_ClOrdID" -> true
        | "Model_messages.mod_f_OrderCancelRequest_OrigClOrdID" -> true
        | "Model_messages.mod_f_OrderCancelRequest_Symbol" -> true
        | "Model_messages.mod_f_OrderCancelRequest_OrderQty" -> true
        | "Model_messages.mod_f_OrderCancelRequest_TransactTime" -> true
        | "Model_messages.mod_f_OrderCancelRequest_MIC" -> true
        | "Model_messages.mod_f_OrderCancelRequest_Currency" -> true
        | "Model_messages.mod_f_OrderMassCancelRequest_ClOrdID" -> true
        | "Model_messages.mod_f_OrderMassCancelRequest_Symbol" -> true
        | "Model_messages.mod_f_OrderMassCancelRequest_ClassID" -> true
        | "Model_messages.mod_f_OrderMassCancelRequest_MassCancelRequestType" -> true
        | "Model_messages.mod_f_OrderMassCancelRequest_Side" -> true
        | "Model_messages.mod_f_OrderMassCancelRequest_TechnicalOrdType" -> true
        | "Model_messages.mod_f_OrderMassCancelRequest_Rule80A" -> true
        | "Model_messages.mod_f_OrderMassCancelRequest_Account" -> true
        | "Model_messages.mod_f_OrderMassCancelRequest_CancelByLocationID" -> true
        | "Model_messages.mod_f_OrderMassCancelRequest_TransactTime" -> true
        | "Model_messages.mod_f_ExecutionReport_OrderID" -> true
        | "Model_messages.mod_f_ExecutionReport_Symbol" -> true
        | "Model_messages.mod_f_ExecutionReport_ExecID" -> true
        | "Model_messages.mod_f_ExecutionReport_ExecTransType" -> true
        | "Model_messages.mod_f_ExecutionReport_OrdStatus" -> true
        | "Model_messages.mod_f_ExecutionReport_ExecType" -> true
        | "Model_messages.mod_f_ExecutionReport_AvgPx" -> true
        | "Model_messages.mod_f_ExecutionReport_Side" -> true
        | "Model_messages.mod_f_ExecutionReport_LeavesQty" -> true
        | "Model_messages.mod_f_ExecutionReport_CumQty" -> true
        | "Model_messages.mod_f_ExecutionReport_Text" -> true
        | "Model_messages.mod_f_ExecutionReport_FreeText" -> true
        | "Model_messages.mod_f_ExecutionReport_ClearingHandlingType" -> true
        | "Model_messages.mod_f_ExecutionReport_UTPExID" -> true
        | "Model_messages.mod_f_ExecutionReport_LiquidityIndicator" -> true
        | "Model_messages.mod_f_ExecutionReport_ErrorCode" -> true
        | "Model_messages.mod_f_ExecutionReport_MIC" -> true
        | "Model_messages.mod_f_ExecutionReport_BookIndicator" -> true
        | "Model_messages.mod_f_ExecutionReport_BrokerPrioritization" -> true
        | "Model_messages.mod_f_ExecutionReport_DEAIndicator" -> true
        | "Model_messages.mod_f_ExecutionReport_OrderAttributeTypes" -> true
        | "Model_messages.mod_f_ExecutionReport_ClOrdID" -> true
        | "Model_messages.mod_f_ExecutionReport_OrigClOrdID" -> true
        | "Model_messages.mod_f_ExecutionReport_TransactTime" -> true
        | "Model_messages.mod_f_ExecutionReport_OrdRejReason" -> true
        | "Model_messages.mod_f_ExecutionReport_ExecRefID" -> true
        | "Model_messages.mod_f_ExecutionReport_LastPx" -> true
        | "Model_messages.mod_f_ExecutionReport_LastShares" -> true
        | "Model_messages.mod_f_ExecutionReport_OrdType" -> true
        | "Model_messages.mod_f_ExecutionReport_TimeInForce" -> true
        | "Model_messages.mod_f_ExecutionReport_ExecInst" -> true
        | "Model_messages.mod_f_ExecutionReport_Price" -> true
        | "Model_messages.mod_f_ExecutionReport_OrderQty" -> true
        | "Model_messages.mod_f_ExecutionReport_PegDifference" -> true
        | "Model_messages.mod_f_ExecutionReport_Account" -> true
        | "Model_messages.mod_f_ExecutionReport_ClientID" -> true
        | "Model_messages.mod_f_ExecutionReport_ClearingFirm" -> true
        | "Model_messages.mod_f_ExecutionReport_OpenClose" -> true
        | "Model_messages.mod_f_ExecutionReport_Currency" -> true
        | "Model_messages.mod_f_ExecutionReport_TechnicalOrdType" -> true
        | "Model_messages.mod_f_ExecutionReport_CrossType" -> true
        | "Model_messages.mod_f_ExecutionReport_IMPTimestamp" -> true
        | "Model_messages.mod_f_ExecutionReport_Parties" -> true
        | "Model_messages.mod_f_ExecutionReport_ContraGrp" -> true
        | "Model_messages.mod_f_OrderCancelReject_ClOrdID" -> true
        | "Model_messages.mod_f_OrderCancelReject_OrigClOrdID" -> true
        | "Model_messages.mod_f_OrderCancelReject_OrderID" -> true
        | "Model_messages.mod_f_OrderCancelReject_Symbol" -> true
        | "Model_messages.mod_f_OrderCancelReject_ExecInst" -> true
        | "Model_messages.mod_f_OrderCancelReject_OrdStatus" -> true
        | "Model_messages.mod_f_OrderCancelReject_ErrorCode" -> true
        | "Model_messages.mod_f_OrderCancelReject_Text" -> true
        | "Model_messages.mod_f_OrderCancelReject_CxlRejReason" -> true
        | "Model_messages.mod_f_OrderCancelReject_CxlRejResponseTo" -> true
        | "Model_messages.mod_f_OrderMassCancelReport_ClOrdID" -> true
        | "Model_messages.mod_f_OrderMassCancelReport_Symbol" -> true
        | "Model_messages.mod_f_OrderMassCancelReport_ClassID" -> true
        | "Model_messages.mod_f_OrderMassCancelReport_MassCancelRequestType" -> true
        | "Model_messages.mod_f_OrderMassCancelReport_Side" -> true
        | "Model_messages.mod_f_OrderMassCancelReport_TechnicalOrdType" -> true
        | "Model_messages.mod_f_OrderMassCancelReport_Rule80A" -> true
        | "Model_messages.mod_f_OrderMassCancelReport_Account" -> true
        | "Model_messages.mod_f_OrderMassCancelReport_CancelByLocationID" -> true
        | "Model_messages.mod_f_OrderMassCancelReport_TotalAffectedOrders" -> true
        | "Model_messages.mod_f_OrderMassCancelReport_TransactTime" -> true
        | "Model_messages.mod_f_OrderMassCancelReport_MIC" -> true
        | _ -> false
    )
;;

let isMessage (str : string)  =
    (match str with
        | "Model_messages.FIX_Msg_OrderSingle" -> true
        | "Model_messages.FIX_Msg_OrderCancelReplaceRequest" -> true
        | "Model_messages.FIX_Msg_OrderCancelRequest" -> true
        | "Model_messages.FIX_Msg_OrderMassCancelRequest" -> true
        | "Model_messages.FIX_Msg_ExecutionReport" -> true
        | "Model_messages.FIX_Msg_OrderCancelReject" -> true
        | "Model_messages.FIX_Msg_OrderMassCancelReport" -> true
        | _ -> false
    )
;;

let isMessageData (str : string)  =
    (match str with
        | "Model_messages.mod_ordersingle_data" -> true
        | "Model_messages.mod_ordercancelreplacerequest_data" -> true
        | "Model_messages.mod_ordercancelrequest_data" -> true
        | "Model_messages.mod_ordermasscancelrequest_data" -> true
        | "Model_messages.mod_executionreport_data" -> true
        | "Model_messages.mod_ordercancelreject_data" -> true
        | "Model_messages.mod_ordermasscancelreport_data" -> true
        | _ -> false
    )
;;

let isInternal (str : string)  =
    (match str with
        | _ -> false
    )
;;

let isInternalField (str : string)  =
    (match str with
        | _ -> false
    )
;;

let isAssignableField (str : string)  =
    (match str with
        | _ -> false
    )
;;

let isEnum (str : string)  =
    (match str with
        | "Model_app_enums.model_fix_cxlrejreason" -> true
        | "Model_app_enums.model_fix_technicalordtype" -> true
        | "Model_app_enums.model_fix_masscancelrequesttype" -> true
        | "Model_app_enums.model_fix_exectranstype" -> true
        | "Model_app_enums.model_fix_ordstatus" -> true
        | "Model_app_enums.model_fix_crosstype" -> true
        | "Model_app_enums.model_fix_partyidsource" -> true
        | "Model_app_enums.model_fix_side" -> true
        | "Model_app_enums.model_fix_exectype" -> true
        | "Model_app_enums.model_fix_bookindicator" -> true
        | "Model_app_enums.model_fix_execinst" -> true
        | "Model_app_enums.model_fix_handlinst" -> true
        | "Model_app_enums.model_fix_clearinghandlingtype" -> true
        | "Model_app_enums.model_fix_ordrejreason" -> true
        | "Model_app_enums.model_fix_partyrole" -> true
        | "Model_app_enums.model_fix_currency" -> true
        | "Model_app_enums.model_fix_ordtype" -> true
        | "Model_app_enums.model_fix_partyrolequalifier" -> true
        | "Model_app_enums.model_fix_openclose" -> true
        | "Model_app_enums.model_fix_liquidityindicator" -> true
        | "Model_app_enums.model_fix_orderattributetypes" -> true
        | "Model_app_enums.model_fix_cxlrejresponseto" -> true
        | "Model_app_enums.model_fix_timeinforce" -> true
        | "Model_app_enums.model_fix_partysubidtype" -> true
        | "Model_app_enums.model_fix_brokerprioritization" -> true
        | "Model_app_enums.model_fix_rule80a" -> true
        | _ -> false
    )
;;

let isEnumCase (str : string)  =
    (match str with
        | "Model_app_enums.MOD_FIX_CxlRejReason_Other" -> true
        | "Model_app_enums.MOD_FIX_CxlRejReason_OrderAlreadyInPendingStatus" -> true
        | "Model_app_enums.MOD_FIX_CxlRejReason_TooLateToCancel" -> true
        | "Model_app_enums.MOD_FIX_CxlRejReason_UnknownOrder" -> true
        | "Model_app_enums.MOD_FIX_CxlRejReason_UnableToProcessOrderMassCancelRequest" -> true
        | "Model_app_enums.MOD_FIX_CxlRejReason_OrigOrdModTime" -> true
        | "Model_app_enums.MOD_FIX_CxlRejReason_DuplicateClOrdID" -> true
        | "Model_app_enums.MOD_FIX_CxlRejReason_BrokerCredit" -> true
        | "Model_app_enums.MOD_FIX_TechnicalOrdType_CrossMargining" -> true
        | "Model_app_enums.MOD_FIX_TechnicalOrdType_IndexArbitrage" -> true
        | "Model_app_enums.MOD_FIX_TechnicalOrdType_UnwindOrder" -> true
        | "Model_app_enums.MOD_FIX_TechnicalOrdType_OtherOrders" -> true
        | "Model_app_enums.MOD_FIX_TechnicalOrdType_PortfolioStrategy" -> true
        | "Model_app_enums.MOD_FIX_MassCancelRequestType_CancelOrdersForASecurityType" -> true
        | "Model_app_enums.MOD_FIX_MassCancelRequestType_CancelOrdersForAProduct" -> true
        | "Model_app_enums.MOD_FIX_MassCancelRequestType_CancelOrdersForASecurity" -> true
        | "Model_app_enums.MOD_FIX_MassCancelRequestType_CancelOrdersForAnUnderlyingSecurity" -> true
        | "Model_app_enums.MOD_FIX_MassCancelRequestType_CancelAllOrders" -> true
        | "Model_app_enums.MOD_FIX_MassCancelRequestType_CancelOrdersForACFICode" -> true
        | "Model_app_enums.MOD_FIX_MassCancelRequestType_CancelOrdersForATradingSession" -> true
        | "Model_app_enums.MOD_FIX_ExecTransType_Status" -> true
        | "Model_app_enums.MOD_FIX_ExecTransType_Cancel" -> true
        | "Model_app_enums.MOD_FIX_ExecTransType_New" -> true
        | "Model_app_enums.MOD_FIX_ExecTransType_Correct" -> true
        | "Model_app_enums.MOD_FIX_OrdStatus_PendingCancel" -> true
        | "Model_app_enums.MOD_FIX_OrdStatus_Stopped" -> true
        | "Model_app_enums.MOD_FIX_OrdStatus_PendingNew" -> true
        | "Model_app_enums.MOD_FIX_OrdStatus_Rejected" -> true
        | "Model_app_enums.MOD_FIX_OrdStatus_Calculated" -> true
        | "Model_app_enums.MOD_FIX_OrdStatus_Expired" -> true
        | "Model_app_enums.MOD_FIX_OrdStatus_Filled" -> true
        | "Model_app_enums.MOD_FIX_OrdStatus_Canceled" -> true
        | "Model_app_enums.MOD_FIX_OrdStatus_Replaced" -> true
        | "Model_app_enums.MOD_FIX_OrdStatus_PendingReplace" -> true
        | "Model_app_enums.MOD_FIX_OrdStatus_DoneForDay" -> true
        | "Model_app_enums.MOD_FIX_OrdStatus_Suspended" -> true
        | "Model_app_enums.MOD_FIX_OrdStatus_New" -> true
        | "Model_app_enums.MOD_FIX_OrdStatus_PartiallyFilled" -> true
        | "Model_app_enums.MOD_FIX_OrdStatus_AcceptedForBidding" -> true
        | "Model_app_enums.MOD_FIX_CrossType_CrossIOC" -> true
        | "Model_app_enums.MOD_FIX_CrossType_CrossOneSide" -> true
        | "Model_app_enums.MOD_FIX_CrossType_CrossSamePrice" -> true
        | "Model_app_enums.MOD_FIX_CrossType_CrossAON" -> true
        | "Model_app_enums.MOD_FIX_CrossType_NotSignificant" -> true
        | "Model_app_enums.MOD_FIX_CrossType_StandardCross" -> true
        | "Model_app_enums.MOD_FIX_PartyIDSource_CSDParticipant" -> true
        | "Model_app_enums.MOD_FIX_PartyIDSource_KoreanInvestorID" -> true
        | "Model_app_enums.MOD_FIX_PartyIDSource_USEmployerOrTaxIDNumber" -> true
        | "Model_app_enums.MOD_FIX_PartyIDSource_TaiwaneseForeignInvestorID" -> true
        | "Model_app_enums.MOD_FIX_PartyIDSource_TaiwaneseTradingAcct" -> true
        | "Model_app_enums.MOD_FIX_PartyIDSource_UKNationalInsuranceOrPensionNumber" -> true
        | "Model_app_enums.MOD_FIX_PartyIDSource_MIC" -> true
        | "Model_app_enums.MOD_FIX_PartyIDSource_USSocialSecurityNumber" -> true
        | "Model_app_enums.MOD_FIX_PartyIDSource_Proprietary" -> true
        | "Model_app_enums.MOD_FIX_PartyIDSource_AustralianTaxFileNumber" -> true
        | "Model_app_enums.MOD_FIX_PartyIDSource_ShortCodeIdentifier" -> true
        | "Model_app_enums.MOD_FIX_PartyIDSource_MalaysianCentralDepository" -> true
        | "Model_app_enums.MOD_FIX_PartyIDSource_ISITCAcronym" -> true
        | "Model_app_enums.MOD_FIX_PartyIDSource_ISOCountryCode" -> true
        | "Model_app_enums.MOD_FIX_PartyIDSource_ChineseInvestorID" -> true
        | "Model_app_enums.MOD_FIX_PartyIDSource_AustralianBusinessNumber" -> true
        | "Model_app_enums.MOD_FIX_PartyIDSource_BIC" -> true
        | "Model_app_enums.MOD_FIX_PartyIDSource_GeneralIdentifier" -> true
        | "Model_app_enums.MOD_FIX_PartyIDSource_SettlementEntityLocation" -> true
        | "Model_app_enums.MOD_FIX_Side_AsDefined" -> true
        | "Model_app_enums.MOD_FIX_Side_Opposite" -> true
        | "Model_app_enums.MOD_FIX_Side_Buy" -> true
        | "Model_app_enums.MOD_FIX_Side_CrossShortExempt" -> true
        | "Model_app_enums.MOD_FIX_Side_Borrow" -> true
        | "Model_app_enums.MOD_FIX_Side_BuyMinus" -> true
        | "Model_app_enums.MOD_FIX_Side_Subscribe" -> true
        | "Model_app_enums.MOD_FIX_Side_Lend" -> true
        | "Model_app_enums.MOD_FIX_Side_SellShortExempt" -> true
        | "Model_app_enums.MOD_FIX_Side_Redeem" -> true
        | "Model_app_enums.MOD_FIX_Side_SellPlus" -> true
        | "Model_app_enums.MOD_FIX_Side_Sell" -> true
        | "Model_app_enums.MOD_FIX_Side_Undisclosed" -> true
        | "Model_app_enums.MOD_FIX_Side_Cross" -> true
        | "Model_app_enums.MOD_FIX_Side_CrossShort" -> true
        | "Model_app_enums.MOD_FIX_Side_SellShort" -> true
        | "Model_app_enums.MOD_FIX_ExecType_PendingCancel" -> true
        | "Model_app_enums.MOD_FIX_ExecType_Fill" -> true
        | "Model_app_enums.MOD_FIX_ExecType_Stopped" -> true
        | "Model_app_enums.MOD_FIX_ExecType_PendingNew" -> true
        | "Model_app_enums.MOD_FIX_ExecType_Restated" -> true
        | "Model_app_enums.MOD_FIX_ExecType_Rejected" -> true
        | "Model_app_enums.MOD_FIX_ExecType_Calculated" -> true
        | "Model_app_enums.MOD_FIX_ExecType_TradeCorrect" -> true
        | "Model_app_enums.MOD_FIX_ExecType_TradeCancel" -> true
        | "Model_app_enums.MOD_FIX_ExecType_Expired" -> true
        | "Model_app_enums.MOD_FIX_ExecType_OrderStatus" -> true
        | "Model_app_enums.MOD_FIX_ExecType_PartialFill" -> true
        | "Model_app_enums.MOD_FIX_ExecType_Trade" -> true
        | "Model_app_enums.MOD_FIX_ExecType_Canceled" -> true
        | "Model_app_enums.MOD_FIX_ExecType_Replaced" -> true
        | "Model_app_enums.MOD_FIX_ExecType_PendingReplace" -> true
        | "Model_app_enums.MOD_FIX_ExecType_DoneForDay" -> true
        | "Model_app_enums.MOD_FIX_ExecType_Suspended" -> true
        | "Model_app_enums.MOD_FIX_ExecType_New" -> true
        | "Model_app_enums.MOD_FIX_BookIndicator_Auction" -> true
        | "Model_app_enums.MOD_FIX_BookIndicator_RPW" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_ParticipateDoNotInitiate" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_AllOrNone" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_CallFirst" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_PercentOfVolume" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_InstitutionsOnly" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_FullSweep" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_NoCross" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_BestOfferPeg" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_OverTheDay" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_DoNotIncrease" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_OpeningPeg" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_TryToStop" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_Netting" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_StayOnBidSide" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_Held" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_OKToCross" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_CustomerDisplayInstruction" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_GoAlong" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_DoNotReduce" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_StayOnOfferSide" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_PegToLimitPrice" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_TryToScale" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_ReinstateOnSystemFailure" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_CancelIfNotBest" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_BestBidPeg" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_MidPricePeg" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_WorkToTargetStrategy" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_PegToVWAP" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_TradeAlong" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_StrictLimit" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_Suspend" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_LastPeg" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_NonNegotiable" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_HalfSweep" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_NotHeld" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_FixedPegToLocalBestBidOrOfferAtTimeOfOrder" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_CancelOnTradingHalt" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_CancelOnSystemFailure" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_IgnorePriceValidityChecks" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_Work" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_ReinstateOnTradingHalt" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_PrimaryPeg" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_TrailingStopPeg" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_MarketPeg" -> true
        | "Model_app_enums.MOD_FIX_ExecInst_StrictScale" -> true
        | "Model_app_enums.MOD_FIX_HandlInst_ManualOrder" -> true
        | "Model_app_enums.MOD_FIX_HandlInst_AutomatedExecutionInterventionOK" -> true
        | "Model_app_enums.MOD_FIX_HandlInst_AutomatedExecutionNoIntervention" -> true
        | "Model_app_enums.MOD_FIX_ClearingHandlingType_ManualMode" -> true
        | "Model_app_enums.MOD_FIX_ClearingHandlingType_AutomaticExtraction" -> true
        | "Model_app_enums.MOD_FIX_ClearingHandlingType_AutomaticAllocation" -> true
        | "Model_app_enums.MOD_FIX_OrdRejReason_DuplicateOrder" -> true
        | "Model_app_enums.MOD_FIX_OrdRejReason_Other" -> true
        | "Model_app_enums.MOD_FIX_OrdRejReason_UnknownOrder" -> true
        | "Model_app_enums.MOD_FIX_OrdRejReason_DVC_ThresholdBreached" -> true
        | "Model_app_enums.MOD_FIX_OrdRejReason_TooLateToEnter" -> true
        | "Model_app_enums.MOD_FIX_OrdRejReason_OrderExceedsLimit" -> true
        | "Model_app_enums.MOD_FIX_OrdRejReason_UnknownAccount" -> true
        | "Model_app_enums.MOD_FIX_OrdRejReason_OtherRejectReason" -> true
        | "Model_app_enums.MOD_FIX_OrdRejReason_BrokerCredit" -> true
        | "Model_app_enums.MOD_FIX_OrdRejReason_UnsupportedOrderCharacteristic" -> true
        | "Model_app_enums.MOD_FIX_OrdRejReason_DuplicateOfAVerballyCommunicatedOrder" -> true
        | "Model_app_enums.MOD_FIX_OrdRejReason_IncorrectQuantity" -> true
        | "Model_app_enums.MOD_FIX_OrdRejReason_TradeAlongRequired" -> true
        | "Model_app_enums.MOD_FIX_OrdRejReason_StaleOrder" -> true
        | "Model_app_enums.MOD_FIX_OrdRejReason_InvalidInvestorID" -> true
        | "Model_app_enums.MOD_FIX_OrdRejReason_ExchangeClosed" -> true
        | "Model_app_enums.MOD_FIX_OrdRejReason_IncorrectAllocatedQuantity" -> true
        | "Model_app_enums.MOD_FIX_OrdRejReason_DVC_ProactivelyHaltedInstrument" -> true
        | "Model_app_enums.MOD_FIX_OrdRejReason_UnknownSymbol" -> true
        | "Model_app_enums.MOD_FIX_PartyRole_CorrespondantClearingFirm" -> true
        | "Model_app_enums.MOD_FIX_PartyRole_Agent" -> true
        | "Model_app_enums.MOD_FIX_PartyRole_ExecutingSystem" -> true
        | "Model_app_enums.MOD_FIX_PartyRole_SponsoringFirm" -> true
        | "Model_app_enums.MOD_FIX_PartyRole_Intermediary" -> true
        | "Model_app_enums.MOD_FIX_PartyRole_IntroducingFirm" -> true
        | "Model_app_enums.MOD_FIX_PartyRole_EnteringFirm" -> true
        | "Model_app_enums.MOD_FIX_PartyRole_LiquidityProvider" -> true
        | "Model_app_enums.MOD_FIX_PartyRole_ClearingFirm" -> true
        | "Model_app_enums.MOD_FIX_PartyRole_ContraFirm" -> true
        | "Model_app_enums.MOD_FIX_PartyRole_ContraTrader" -> true
        | "Model_app_enums.MOD_FIX_PartyRole_CustomerAccount" -> true
        | "Model_app_enums.MOD_FIX_PartyRole_RegulatoryBody" -> true
        | "Model_app_enums.MOD_FIX_PartyRole_SettlementLocation" -> true
        | "Model_app_enums.MOD_FIX_PartyRole_Exchange" -> true
        | "Model_app_enums.MOD_FIX_PartyRole_Custodian" -> true
        | "Model_app_enums.MOD_FIX_PartyRole_CorrespondentClearingOrganization" -> true
        | "Model_app_enums.MOD_FIX_PartyRole_ExecutingTrader" -> true
        | "Model_app_enums.MOD_FIX_PartyRole_CorrespondentBroker" -> true
        | "Model_app_enums.MOD_FIX_PartyRole_ClientID" -> true
        | "Model_app_enums.MOD_FIX_PartyRole_OrderOriginationTrader" -> true
        | "Model_app_enums.MOD_FIX_PartyRole_Beneficiary" -> true
        | "Model_app_enums.MOD_FIX_PartyRole_InterestedParty" -> true
        | "Model_app_enums.MOD_FIX_PartyRole_UnderlyingContraFirm" -> true
        | "Model_app_enums.MOD_FIX_PartyRole_GiveupClearingFirm" -> true
        | "Model_app_enums.MOD_FIX_PartyRole_ClearingOrganization" -> true
        | "Model_app_enums.MOD_FIX_PartyRole_Locate" -> true
        | "Model_app_enums.MOD_FIX_PartyRole_Buyer" -> true
        | "Model_app_enums.MOD_FIX_PartyRole_PositionAccount" -> true
        | "Model_app_enums.MOD_FIX_PartyRole_OrderOriginationFirm" -> true
        | "Model_app_enums.MOD_FIX_PartyRole_BrokerOfCredit" -> true
        | "Model_app_enums.MOD_FIX_PartyRole_SubCustodian" -> true
        | "Model_app_enums.MOD_FIX_PartyRole_EnteringTrader" -> true
        | "Model_app_enums.MOD_FIX_PartyRole_InvestmentDecisionMaker" -> true
        | "Model_app_enums.MOD_FIX_PartyRole_ExecutingFirm" -> true
        | "Model_app_enums.MOD_FIX_PartyRole_FundManagerClientID" -> true
        | "Model_app_enums.MOD_FIX_PartyRole_ContraClearingFirm" -> true
        | "Model_app_enums.MOD_FIX_PartyRole_InvestorID" -> true
        | "Model_app_enums.MOD_FIX_Currency_EUR" -> true
        | "Model_app_enums.MOD_FIX_Currency_CHF" -> true
        | "Model_app_enums.MOD_FIX_Currency_USD" -> true
        | "Model_app_enums.MOD_FIX_Currency_GBP" -> true
        | "Model_app_enums.MOD_FIX_OrdType_LimitOrBetter" -> true
        | "Model_app_enums.MOD_FIX_OrdType_NextFundValuationPoint" -> true
        | "Model_app_enums.MOD_FIX_OrdType_WithOrWithout" -> true
        | "Model_app_enums.MOD_FIX_OrdType_PreviouslyIndicated" -> true
        | "Model_app_enums.MOD_FIX_OrdType_Stop" -> true
        | "Model_app_enums.MOD_FIX_OrdType_ForexPreviouslyQuoted" -> true
        | "Model_app_enums.MOD_FIX_OrdType_Market" -> true
        | "Model_app_enums.MOD_FIX_OrdType_OnBasis" -> true
        | "Model_app_enums.MOD_FIX_OrdType_Funari" -> true
        | "Model_app_enums.MOD_FIX_OrdType_LimitOnClose" -> true
        | "Model_app_enums.MOD_FIX_OrdType_Pegged" -> true
        | "Model_app_enums.MOD_FIX_OrdType_LimitWithOrWithout" -> true
        | "Model_app_enums.MOD_FIX_OrdType_MarketOnClose" -> true
        | "Model_app_enums.MOD_FIX_OrdType_StopLimit" -> true
        | "Model_app_enums.MOD_FIX_OrdType_ForexSwap" -> true
        | "Model_app_enums.MOD_FIX_OrdType_MarketIfTouched" -> true
        | "Model_app_enums.MOD_FIX_OrdType_MarketWithLeftOverAsLimit" -> true
        | "Model_app_enums.MOD_FIX_OrdType_PreviouslyQuoted" -> true
        | "Model_app_enums.MOD_FIX_OrdType_ForexMarket" -> true
        | "Model_app_enums.MOD_FIX_OrdType_Limit" -> true
        | "Model_app_enums.MOD_FIX_OrdType_PreviousFundValuationPoint" -> true
        | "Model_app_enums.MOD_FIX_OrdType_OnClose" -> true
        | "Model_app_enums.MOD_FIX_OrdType_ForexLimit" -> true
        | "Model_app_enums.MOD_FIX_PartyRoleQualifier_FirmOrLegalEntity" -> true
        | "Model_app_enums.MOD_FIX_PartyRoleQualifier_Algorithm" -> true
        | "Model_app_enums.MOD_FIX_PartyRoleQualifier_NaturalPerson" -> true
        | "Model_app_enums.MOD_FIX_OpenClose_Close" -> true
        | "Model_app_enums.MOD_FIX_OpenClose_Open" -> true
        | "Model_app_enums.MOD_FIX_LiquidityIndicator_RemoveLiquidity" -> true
        | "Model_app_enums.MOD_FIX_LiquidityIndicator_AddLiquidity" -> true
        | "Model_app_enums.MOD_FIX_LiquidityIndicator_PeriodicAuction" -> true
        | "Model_app_enums.MOD_FIX_OrderAttributeTypes_AlgorithmicOrder" -> true
        | "Model_app_enums.MOD_FIX_OrderAttributeTypes_LiquidityProvisionActivity" -> true
        | "Model_app_enums.MOD_FIX_CxlRejResponseTo_OrderCancelRequest" -> true
        | "Model_app_enums.MOD_FIX_CxlRejResponseTo_OrderCancel" -> true
        | "Model_app_enums.MOD_FIX_TimeInForce_GoodTillCancel" -> true
        | "Model_app_enums.MOD_FIX_TimeInForce_AtTheClose" -> true
        | "Model_app_enums.MOD_FIX_TimeInForce_ImmediateOrCancel" -> true
        | "Model_app_enums.MOD_FIX_TimeInForce_Day" -> true
        | "Model_app_enums.MOD_FIX_TimeInForce_FillOrKill" -> true
        | "Model_app_enums.MOD_FIX_TimeInForce_GoodForAuction" -> true
        | "Model_app_enums.MOD_FIX_TimeInForce_AtTheOpening" -> true
        | "Model_app_enums.MOD_FIX_TimeInForce_GoodTillCrossing" -> true
        | "Model_app_enums.MOD_FIX_TimeInForce_GoodTillDate" -> true
        | "Model_app_enums.MOD_FIX_PartySubIDType_EmailAddress" -> true
        | "Model_app_enums.MOD_FIX_PartySubIDType_Application" -> true
        | "Model_app_enums.MOD_FIX_PartySubIDType_FundAccountName" -> true
        | "Model_app_enums.MOD_FIX_PartySubIDType_FullLegalNameOfFirm" -> true
        | "Model_app_enums.MOD_FIX_PartySubIDType_CSDParticipantMemberCode" -> true
        | "Model_app_enums.MOD_FIX_PartySubIDType_RegistrationName" -> true
        | "Model_app_enums.MOD_FIX_PartySubIDType_PostalAddress" -> true
        | "Model_app_enums.MOD_FIX_PartySubIDType_SecuritiesAccountNumber" -> true
        | "Model_app_enums.MOD_FIX_PartySubIDType_RegisteredAddress" -> true
        | "Model_app_enums.MOD_FIX_PartySubIDType_TelexNumber" -> true
        | "Model_app_enums.MOD_FIX_PartySubIDType_RegulatoryStatus" -> true
        | "Model_app_enums.MOD_FIX_PartySubIDType_PhoneNumber" -> true
        | "Model_app_enums.MOD_FIX_PartySubIDType_Firm" -> true
        | "Model_app_enums.MOD_FIX_PartySubIDType_Person" -> true
        | "Model_app_enums.MOD_FIX_PartySubIDType_ContactName" -> true
        | "Model_app_enums.MOD_FIX_PartySubIDType_CashAccountNumber" -> true
        | "Model_app_enums.MOD_FIX_PartySubIDType_CashAccountName" -> true
        | "Model_app_enums.MOD_FIX_PartySubIDType_LocationDesk" -> true
        | "Model_app_enums.MOD_FIX_PartySubIDType_RegisteredAddressForConfirmation" -> true
        | "Model_app_enums.MOD_FIX_PartySubIDType_PositionAccountType" -> true
        | "Model_app_enums.MOD_FIX_PartySubIDType_System" -> true
        | "Model_app_enums.MOD_FIX_PartySubIDType_Department" -> true
        | "Model_app_enums.MOD_FIX_PartySubIDType_FaxNumber" -> true
        | "Model_app_enums.MOD_FIX_PartySubIDType_RegistrationNumber" -> true
        | "Model_app_enums.MOD_FIX_PartySubIDType_BIC" -> true
        | "Model_app_enums.MOD_FIX_PartySubIDType_SecuritiesAccountName" -> true
        | "Model_app_enums.MOD_FIX_BrokerPrioritization_WithBrokerPrioritization" -> true
        | "Model_app_enums.MOD_FIX_BrokerPrioritization_WithoutBrokerPriotization" -> true
        | "Model_app_enums.MOD_FIX_Rule80A_AgencySingleOrder" -> true
        | "Model_app_enums.MOD_FIX_Rule80A_ShortExemptTransactionForPrincipal" -> true
        | "Model_app_enums.MOD_FIX_Rule80A_ShortExemptTransactionAType" -> true
        | "Model_app_enums.MOD_FIX_Rule80A_SpecialistTrades" -> true
        | "Model_app_enums.MOD_FIX_Rule80A_AgencyNonAlgo" -> true
        | "Model_app_enums.MOD_FIX_Rule80A_TransactionUnaffiliatedMember" -> true
        | "Model_app_enums.MOD_FIX_Rule80A_ShortExemptTransactionWType" -> true
        | "Model_app_enums.MOD_FIX_Rule80A_ProprietaryAlgo" -> true
        | "Model_app_enums.MOD_FIX_Rule80A_ProprietaryTransactionAffiliated" -> true
        | "Model_app_enums.MOD_FIX_Rule80A_AgencyAlgo" -> true
        | "Model_app_enums.MOD_FIX_Rule80A_Principal" -> true
        | "Model_app_enums.MOD_FIX_Rule80A_AllOtherOrdersAsAgentForOtherMember" -> true
        | "Model_app_enums.MOD_FIX_Rule80A_ProprietaryNonAlgo" -> true
        | "Model_app_enums.MOD_FIX_Rule80A_ShortExemptTransactionIType" -> true
        | "Model_app_enums.MOD_FIX_Rule80A_AgentForOtherMember" -> true
        | "Model_app_enums.MOD_FIX_Rule80A_ShortExemptTransactionNonMember" -> true
        | "Model_app_enums.MOD_FIX_Rule80A_RisklessPrincipal" -> true
        | "Model_app_enums.MOD_FIX_Rule80A_AgencyIndexArb" -> true
        | "Model_app_enums.MOD_FIX_Rule80A_ProgramOrderOtherMember" -> true
        | "Model_app_enums.MOD_FIX_Rule80A_ShortExemptTransactionMemberNotAffliated" -> true
        | "Model_app_enums.MOD_FIX_Rule80A_ProgramOrderMember" -> true
        | "Model_app_enums.MOD_FIX_Rule80A_House" -> true
        | "Model_app_enums.MOD_FIX_Rule80A_TransactionNonMember" -> true
        | "Model_app_enums.MOD_FIX_Rule80A_IndividualInvestor" -> true
        | "Model_app_enums.MOD_FIX_Rule80A_ShortExemptTransactionMemberAffliated" -> true
        | "Model_app_enums.MOD_FIX_Rule80A_Client" -> true
        | _ -> false
    )
;;

let isRepeatingGroup (str : string)  =
    (match str with
        | "Model_repeating_groups.model_fix_rec_contragrp" -> true
        | "Model_repeating_groups.model_fix_rec_ptyssubgrp" -> true
        | "Model_repeating_groups.model_fix_rec_clearingentries" -> true
        | "Model_repeating_groups.model_fix_rec_parties" -> true
        | _ -> false
    )
;;

let name_of_action (x)  =
    (match x with
        | FIX_Action_neworder _ -> "Action:neworder"
        | FIX_Action_cancelreplace _ -> "Action:cancelreplace"
        | FIX_Action_cancel _ -> "Action:cancel"
        | FIX_Action_masscancel _ -> "Action:masscancel"
    )
;;

let name_of_model_msg (x)  =
    (match x with
        | FIX_Msg_OrderSingle _ -> "Msg:OrderSingle"
        | FIX_Msg_OrderCancelReplaceRequest _ -> "Msg:OrderCancelReplaceRequest"
        | FIX_Msg_OrderCancelRequest _ -> "Msg:OrderCancelRequest"
        | FIX_Msg_OrderMassCancelRequest _ -> "Msg:OrderMassCancelRequest"
        | FIX_Msg_ExecutionReport _ -> "Msg:ExecutionReport"
        | FIX_Msg_OrderCancelReject _ -> "Msg:OrderCancelReject"
        | FIX_Msg_OrderMassCancelReport _ -> "Msg:OrderMassCancelReport"
    )
;;

let name_of_msg (x)  =
    (match x with
        | FIX_TL_Normal d -> (name_of_model_msg d)
        | FIX_TL_Req_Field_Missing _ -> "Msg:Field_missing"
        | FIX_TL_PossibleResend _ -> "Msg:Possible_resend"
        | FIX_TL_None -> "Msg:None"
    )
;;
