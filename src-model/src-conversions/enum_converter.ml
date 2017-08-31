(* Aesthetic Integration copyright 2017 *)
(* @meta[imandra_ignore] on @end *)
open Full_app_enums;;
open Model_app_enums;;
(* @meta[imandra_ignore] off @end *)

let convert__full_to_model_ExecType ( f : fix_exectype ) =
    (match f with
        | FIX_ExecType_New -> MOD_FIX_ExecType_New
        | FIX_ExecType_PartialFill -> MOD_FIX_ExecType_PartialFill
        | FIX_ExecType_Fill -> MOD_FIX_ExecType_Fill
        | FIX_ExecType_DoneForDay -> MOD_FIX_ExecType_DoneForDay
        | FIX_ExecType_Canceled -> MOD_FIX_ExecType_Canceled
        | FIX_ExecType_Replaced -> MOD_FIX_ExecType_Replaced
        | FIX_ExecType_PendingCancel -> MOD_FIX_ExecType_PendingCancel
        | FIX_ExecType_Stopped -> MOD_FIX_ExecType_Stopped
        | FIX_ExecType_Rejected -> MOD_FIX_ExecType_Rejected
        | FIX_ExecType_Suspended -> MOD_FIX_ExecType_Suspended
        | FIX_ExecType_PendingNew -> MOD_FIX_ExecType_PendingNew
        | FIX_ExecType_Calculated -> MOD_FIX_ExecType_Calculated
        | FIX_ExecType_Expired -> MOD_FIX_ExecType_Expired
        | FIX_ExecType_Restated -> MOD_FIX_ExecType_Restated
        | FIX_ExecType_PendingReplace -> MOD_FIX_ExecType_PendingReplace
    )
;;

let convert__full_to_model_Side ( f : fix_side ) =
    (match f with
        | FIX_Side_Buy -> MOD_FIX_Side_Buy
        | FIX_Side_Sell -> MOD_FIX_Side_Sell
        | FIX_Side_BuyMinus -> MOD_FIX_Side_BuyMinus
        | FIX_Side_SellPlus -> MOD_FIX_Side_SellPlus
        | FIX_Side_SellShort -> MOD_FIX_Side_SellShort
        | FIX_Side_SellShortExempt -> MOD_FIX_Side_SellShortExempt
        | FIX_Side_Undisclosed -> MOD_FIX_Side_Undisclosed
        | FIX_Side_Cross -> MOD_FIX_Side_Cross
        | FIX_Side_CrossShort -> MOD_FIX_Side_CrossShort
    )
;;

let convert__full_to_model_OrdStatus ( f : fix_ordstatus ) =
    (match f with
        | FIX_OrdStatus_New -> MOD_FIX_OrdStatus_New
        | FIX_OrdStatus_PartiallyFilled -> MOD_FIX_OrdStatus_PartiallyFilled
        | FIX_OrdStatus_Filled -> MOD_FIX_OrdStatus_Filled
        | FIX_OrdStatus_DoneForDay -> MOD_FIX_OrdStatus_DoneForDay
        | FIX_OrdStatus_Canceled -> MOD_FIX_OrdStatus_Canceled
        | FIX_OrdStatus_Replaced -> MOD_FIX_OrdStatus_Replaced
        | FIX_OrdStatus_PendingCancel -> MOD_FIX_OrdStatus_PendingCancel
        | FIX_OrdStatus_Stopped -> MOD_FIX_OrdStatus_Stopped
        | FIX_OrdStatus_Rejected -> MOD_FIX_OrdStatus_Rejected
        | FIX_OrdStatus_Suspended -> MOD_FIX_OrdStatus_Suspended
        | FIX_OrdStatus_PendingNew -> MOD_FIX_OrdStatus_PendingNew
        | FIX_OrdStatus_Calculated -> MOD_FIX_OrdStatus_Calculated
        | FIX_OrdStatus_Expired -> MOD_FIX_OrdStatus_Expired
        | FIX_OrdStatus_AcceptedForBidding -> MOD_FIX_OrdStatus_AcceptedForBidding
        | FIX_OrdStatus_PendingReplace -> MOD_FIX_OrdStatus_PendingReplace
    )
;;

let convert__full_to_model_ExecTransType ( f : fix_exectranstype ) =
    (match f with
        | FIX_ExecTransType_New -> MOD_FIX_ExecTransType_New
        | FIX_ExecTransType_Cancel -> MOD_FIX_ExecTransType_Cancel
        | FIX_ExecTransType_Correct -> MOD_FIX_ExecTransType_Correct
        | FIX_ExecTransType_Status -> MOD_FIX_ExecTransType_Status
    )
;;

let convert__full_to_model_OrdType ( f : fix_ordtype ) =
    (match f with
        | FIX_OrdType_Market -> MOD_FIX_OrdType_Market
        | FIX_OrdType_Limit -> MOD_FIX_OrdType_Limit
        | FIX_OrdType_Stop -> MOD_FIX_OrdType_Stop
        | FIX_OrdType_StopLimit -> MOD_FIX_OrdType_StopLimit
        | FIX_OrdType_MarketOnClose -> MOD_FIX_OrdType_MarketOnClose
        | FIX_OrdType_WithOrWithout -> MOD_FIX_OrdType_WithOrWithout
        | FIX_OrdType_LimitOrBetter -> MOD_FIX_OrdType_LimitOrBetter
        | FIX_OrdType_LimitWithOrWithout -> MOD_FIX_OrdType_LimitWithOrWithout
        | FIX_OrdType_OnBasis -> MOD_FIX_OrdType_OnBasis
        | FIX_OrdType_OnClose -> MOD_FIX_OrdType_OnClose
        | FIX_OrdType_LimitOnClose -> MOD_FIX_OrdType_LimitOnClose
        | FIX_OrdType_ForexMarket -> MOD_FIX_OrdType_ForexMarket
        | FIX_OrdType_PreviouslyQuoted -> MOD_FIX_OrdType_PreviouslyQuoted
        | FIX_OrdType_PreviouslyIndicated -> MOD_FIX_OrdType_PreviouslyIndicated
        | FIX_OrdType_ForexLimit -> MOD_FIX_OrdType_ForexLimit
        | FIX_OrdType_ForexSwap -> MOD_FIX_OrdType_ForexSwap
        | FIX_OrdType_ForexPreviouslyQuoted -> MOD_FIX_OrdType_ForexPreviouslyQuoted
        | FIX_OrdType_Funari -> MOD_FIX_OrdType_Funari
        | FIX_OrdType_Pegged -> MOD_FIX_OrdType_Pegged
    )
;;

let convert__full_to_model_HandlInst ( f : fix_handlinst ) =
    (match f with
        | FIX_HandlInst_AutomatedExecutionNoIntervention -> MOD_FIX_HandlInst_AutomatedExecutionNoIntervention
        | FIX_HandlInst_AutomatedExecutionInterventionOK -> MOD_FIX_HandlInst_AutomatedExecutionInterventionOK
        | FIX_HandlInst_ManualOrder -> MOD_FIX_HandlInst_ManualOrder
    )
;;

let convert__model_to_full_ExecType ( f : model_fix_exectype ) =
    (match f with
        | MOD_FIX_ExecType_New -> FIX_ExecType_New
        | MOD_FIX_ExecType_PartialFill -> FIX_ExecType_PartialFill
        | MOD_FIX_ExecType_Fill -> FIX_ExecType_Fill
        | MOD_FIX_ExecType_DoneForDay -> FIX_ExecType_DoneForDay
        | MOD_FIX_ExecType_Canceled -> FIX_ExecType_Canceled
        | MOD_FIX_ExecType_Replaced -> FIX_ExecType_Replaced
        | MOD_FIX_ExecType_PendingCancel -> FIX_ExecType_PendingCancel
        | MOD_FIX_ExecType_Stopped -> FIX_ExecType_Stopped
        | MOD_FIX_ExecType_Rejected -> FIX_ExecType_Rejected
        | MOD_FIX_ExecType_Suspended -> FIX_ExecType_Suspended
        | MOD_FIX_ExecType_PendingNew -> FIX_ExecType_PendingNew
        | MOD_FIX_ExecType_Calculated -> FIX_ExecType_Calculated
        | MOD_FIX_ExecType_Expired -> FIX_ExecType_Expired
        | MOD_FIX_ExecType_Restated -> FIX_ExecType_Restated
        | MOD_FIX_ExecType_PendingReplace -> FIX_ExecType_PendingReplace
    )
;;

let convert__model_to_full_Side ( f : model_fix_side ) =
    (match f with
        | MOD_FIX_Side_Buy -> FIX_Side_Buy
        | MOD_FIX_Side_Sell -> FIX_Side_Sell
        | MOD_FIX_Side_BuyMinus -> FIX_Side_BuyMinus
        | MOD_FIX_Side_SellPlus -> FIX_Side_SellPlus
        | MOD_FIX_Side_SellShort -> FIX_Side_SellShort
        | MOD_FIX_Side_SellShortExempt -> FIX_Side_SellShortExempt
        | MOD_FIX_Side_Undisclosed -> FIX_Side_Undisclosed
        | MOD_FIX_Side_Cross -> FIX_Side_Cross
        | MOD_FIX_Side_CrossShort -> FIX_Side_CrossShort
    )
;;

let convert__model_to_full_OrdStatus ( f : model_fix_ordstatus ) =
    (match f with
        | MOD_FIX_OrdStatus_New -> FIX_OrdStatus_New
        | MOD_FIX_OrdStatus_PartiallyFilled -> FIX_OrdStatus_PartiallyFilled
        | MOD_FIX_OrdStatus_Filled -> FIX_OrdStatus_Filled
        | MOD_FIX_OrdStatus_DoneForDay -> FIX_OrdStatus_DoneForDay
        | MOD_FIX_OrdStatus_Canceled -> FIX_OrdStatus_Canceled
        | MOD_FIX_OrdStatus_Replaced -> FIX_OrdStatus_Replaced
        | MOD_FIX_OrdStatus_PendingCancel -> FIX_OrdStatus_PendingCancel
        | MOD_FIX_OrdStatus_Stopped -> FIX_OrdStatus_Stopped
        | MOD_FIX_OrdStatus_Rejected -> FIX_OrdStatus_Rejected
        | MOD_FIX_OrdStatus_Suspended -> FIX_OrdStatus_Suspended
        | MOD_FIX_OrdStatus_PendingNew -> FIX_OrdStatus_PendingNew
        | MOD_FIX_OrdStatus_Calculated -> FIX_OrdStatus_Calculated
        | MOD_FIX_OrdStatus_Expired -> FIX_OrdStatus_Expired
        | MOD_FIX_OrdStatus_AcceptedForBidding -> FIX_OrdStatus_AcceptedForBidding
        | MOD_FIX_OrdStatus_PendingReplace -> FIX_OrdStatus_PendingReplace
    )
;;

let convert__model_to_full_ExecTransType ( f : model_fix_exectranstype ) =
    (match f with
        | MOD_FIX_ExecTransType_New -> FIX_ExecTransType_New
        | MOD_FIX_ExecTransType_Cancel -> FIX_ExecTransType_Cancel
        | MOD_FIX_ExecTransType_Correct -> FIX_ExecTransType_Correct
        | MOD_FIX_ExecTransType_Status -> FIX_ExecTransType_Status
    )
;;

let convert__model_to_full_OrdType ( f : model_fix_ordtype ) =
    (match f with
        | MOD_FIX_OrdType_Market -> FIX_OrdType_Market
        | MOD_FIX_OrdType_Limit -> FIX_OrdType_Limit
        | MOD_FIX_OrdType_Stop -> FIX_OrdType_Stop
        | MOD_FIX_OrdType_StopLimit -> FIX_OrdType_StopLimit
        | MOD_FIX_OrdType_MarketOnClose -> FIX_OrdType_MarketOnClose
        | MOD_FIX_OrdType_WithOrWithout -> FIX_OrdType_WithOrWithout
        | MOD_FIX_OrdType_LimitOrBetter -> FIX_OrdType_LimitOrBetter
        | MOD_FIX_OrdType_LimitWithOrWithout -> FIX_OrdType_LimitWithOrWithout
        | MOD_FIX_OrdType_OnBasis -> FIX_OrdType_OnBasis
        | MOD_FIX_OrdType_OnClose -> FIX_OrdType_OnClose
        | MOD_FIX_OrdType_LimitOnClose -> FIX_OrdType_LimitOnClose
        | MOD_FIX_OrdType_ForexMarket -> FIX_OrdType_ForexMarket
        | MOD_FIX_OrdType_PreviouslyQuoted -> FIX_OrdType_PreviouslyQuoted
        | MOD_FIX_OrdType_PreviouslyIndicated -> FIX_OrdType_PreviouslyIndicated
        | MOD_FIX_OrdType_ForexLimit -> FIX_OrdType_ForexLimit
        | MOD_FIX_OrdType_ForexSwap -> FIX_OrdType_ForexSwap
        | MOD_FIX_OrdType_ForexPreviouslyQuoted -> FIX_OrdType_ForexPreviouslyQuoted
        | MOD_FIX_OrdType_Funari -> FIX_OrdType_Funari
        | MOD_FIX_OrdType_Pegged -> FIX_OrdType_Pegged
    )
;;

let convert__model_to_full_HandlInst ( f : model_fix_handlinst ) =
    (match f with
        | MOD_FIX_HandlInst_AutomatedExecutionNoIntervention -> FIX_HandlInst_AutomatedExecutionNoIntervention
        | MOD_FIX_HandlInst_AutomatedExecutionInterventionOK -> FIX_HandlInst_AutomatedExecutionInterventionOK
        | MOD_FIX_HandlInst_ManualOrder -> FIX_HandlInst_ManualOrder
    )
;;
