(* Aesthetic Integration copyright 2018 *)

let isAction ( str : string ) =
    (match str with
        | "FIX_Action_x" -> true
        | _ -> false
    )
;;

let isActionField ( str : string ) =
    (match str with
        | "mod_f_x_x" -> true
        | _ -> false
    )
;;

let isModelFieldTag ( str : string ) =
    (match str with
        | "M_Field_ClOrdID_Tag" -> true
        | "M_Field_OrderID_Tag" -> true
        | "M_Field_ExecID_Tag" -> true
        | "M_Field_ExecType_Tag" -> true
        | "M_Field_AvgPx_Tag" -> true
        | "M_Field_Side_Tag" -> true
        | "M_Field_LeavesQty_Tag" -> true
        | "M_Field_CumQty_Tag" -> true
        | "M_Field_OrdStatus_Tag" -> true
        | "M_Field_Symbol_Tag" -> true
        | "M_Field_Text_Tag" -> true
        | "M_Field_TransactTime_Tag" -> true
        | "M_Field_OrdType_Tag" -> true
        | _ -> false
    )
;;

let isModelMessageTag ( str : string ) =
    (match str with
        | "M_Msg_ExecutionReport_Tag" -> true
        | "M_Msg_NewOrderSingle_Tag" -> true
        | _ -> false
    )
;;

let isMessageField ( str : string ) =
    (match str with
        | "mod_f_ExecutionReport_ClOrdID" -> true
        | "mod_f_ExecutionReport_OrderID" -> true
        | "mod_f_ExecutionReport_ExecID" -> true
        | "mod_f_ExecutionReport_ExecType" -> true
        | "mod_f_ExecutionReport_AvgPx" -> true
        | "mod_f_ExecutionReport_Side" -> true
        | "mod_f_ExecutionReport_LeavesQty" -> true
        | "mod_f_ExecutionReport_CumQty" -> true
        | "mod_f_ExecutionReport_OrdStatus" -> true
        | "mod_f_ExecutionReport_Instrument_Symbol" -> true
        | "mod_f_ExecutionReport_Text" -> true
        | "mod_f_NewOrderSingle_ClOrdID" -> true
        | "mod_f_NewOrderSingle_Side" -> true
        | "mod_f_NewOrderSingle_TransactTime" -> true
        | "mod_f_NewOrderSingle_OrdType" -> true
        | "mod_f_NewOrderSingle_Instrument_Symbol" -> true
        | _ -> false
    )
;;

let isMessage ( str : string ) =
    (match str with
        | "FIX_Msg_ExecutionReport" -> true
        | "FIX_Msg_NewOrderSingle" -> true
        | _ -> false
    )
;;

let isInternal ( str : string ) =
    (match str with
        | _ -> false
    )
;;

let isInternalField ( str : string ) =
    (match str with
        | _ -> false
    )
;;

let isAssignableField ( str : string ) =
    (match str with
        | _ -> false
    )
;;

let isEnum ( str : string ) =
    (match str with
        | "model_fix_exectype" -> true
        | "model_fix_side" -> true
        | "model_fix_ordstatus" -> true
        | "model_fix_ordtype" -> true
        | _ -> false
    )
;;

let isEnumCase ( str : string ) =
    (match str with
        | "MOD_FIX_ExecType_New" -> true
        | "MOD_FIX_ExecType_DoneForDay" -> true
        | "MOD_FIX_ExecType_Canceled" -> true
        | "MOD_FIX_ExecType_Replaced" -> true
        | "MOD_FIX_ExecType_PendingCancel" -> true
        | "MOD_FIX_ExecType_Stopped" -> true
        | "MOD_FIX_ExecType_Rejected" -> true
        | "MOD_FIX_ExecType_Suspended" -> true
        | "MOD_FIX_ExecType_PendingNew" -> true
        | "MOD_FIX_ExecType_Calculated" -> true
        | "MOD_FIX_ExecType_Expired" -> true
        | "MOD_FIX_ExecType_Restated" -> true
        | "MOD_FIX_ExecType_PendingReplace" -> true
        | "MOD_FIX_ExecType_Trade" -> true
        | "MOD_FIX_ExecType_TradeCorrect" -> true
        | "MOD_FIX_ExecType_TradeCancel" -> true
        | "MOD_FIX_ExecType_OrderStatus" -> true
        | "MOD_FIX_Side_Buy" -> true
        | "MOD_FIX_Side_Sell" -> true
        | "MOD_FIX_Side_BuyMinus" -> true
        | "MOD_FIX_Side_SellPlus" -> true
        | "MOD_FIX_Side_SellShort" -> true
        | "MOD_FIX_Side_SellShortExempt" -> true
        | "MOD_FIX_Side_Undisclosed" -> true
        | "MOD_FIX_Side_Cross" -> true
        | "MOD_FIX_Side_CrossShort" -> true
        | "MOD_FIX_Side_CrossShortExempt" -> true
        | "MOD_FIX_Side_AsDefined" -> true
        | "MOD_FIX_Side_Opposite" -> true
        | "MOD_FIX_Side_Subscribe" -> true
        | "MOD_FIX_Side_Redeem" -> true
        | "MOD_FIX_Side_Lend" -> true
        | "MOD_FIX_Side_Borrow" -> true
        | "MOD_FIX_OrdStatus_New" -> true
        | "MOD_FIX_OrdStatus_PartiallyFilled" -> true
        | "MOD_FIX_OrdStatus_Filled" -> true
        | "MOD_FIX_OrdStatus_DoneForDay" -> true
        | "MOD_FIX_OrdStatus_Canceled" -> true
        | "MOD_FIX_OrdStatus_PendingCancel" -> true
        | "MOD_FIX_OrdStatus_Stopped" -> true
        | "MOD_FIX_OrdStatus_Rejected" -> true
        | "MOD_FIX_OrdStatus_Suspended" -> true
        | "MOD_FIX_OrdStatus_PendingNew" -> true
        | "MOD_FIX_OrdStatus_Calculated" -> true
        | "MOD_FIX_OrdStatus_Expired" -> true
        | "MOD_FIX_OrdStatus_AcceptedForBidding" -> true
        | "MOD_FIX_OrdStatus_PendingReplace" -> true
        | "MOD_FIX_OrdStatus_Replaced" -> true
        | "MOD_FIX_OrdType_Market" -> true
        | "MOD_FIX_OrdType_Limit" -> true
        | "MOD_FIX_OrdType_Stop" -> true
        | "MOD_FIX_OrdType_StopLimit" -> true
        | "MOD_FIX_OrdType_WithOrWithout" -> true
        | "MOD_FIX_OrdType_LimitOrBetter" -> true
        | "MOD_FIX_OrdType_LimitWithOrWithout" -> true
        | "MOD_FIX_OrdType_OnBasis" -> true
        | "MOD_FIX_OrdType_PreviouslyQuoted" -> true
        | "MOD_FIX_OrdType_PreviouslyIndicated" -> true
        | "MOD_FIX_OrdType_ForexSwap" -> true
        | "MOD_FIX_OrdType_Funari" -> true
        | "MOD_FIX_OrdType_MarketIfTouched" -> true
        | "MOD_FIX_OrdType_MarketWithLeftOverAsLimit" -> true
        | "MOD_FIX_OrdType_PreviousFundValuationPoint" -> true
        | "MOD_FIX_OrdType_NextFundValuationPoint" -> true
        | "MOD_FIX_OrdType_Pegged" -> true
        | _ -> false
    )
;;
