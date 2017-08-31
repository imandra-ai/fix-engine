(* Aesthetic Integration copyright 2017 *)

type model_fix_exectype =
    | MOD_FIX_ExecType_New 
    | MOD_FIX_ExecType_PartialFill 
    | MOD_FIX_ExecType_Fill 
    | MOD_FIX_ExecType_DoneForDay 
    | MOD_FIX_ExecType_Canceled 
    | MOD_FIX_ExecType_Replaced 
    | MOD_FIX_ExecType_PendingCancel 
    | MOD_FIX_ExecType_Stopped 
    | MOD_FIX_ExecType_Rejected 
    | MOD_FIX_ExecType_Suspended 
    | MOD_FIX_ExecType_PendingNew 
    | MOD_FIX_ExecType_Calculated 
    | MOD_FIX_ExecType_Expired 
    | MOD_FIX_ExecType_Restated 
    | MOD_FIX_ExecType_PendingReplace 
;;

type model_fix_side =
    | MOD_FIX_Side_Buy 
    | MOD_FIX_Side_Sell 
    | MOD_FIX_Side_BuyMinus 
    | MOD_FIX_Side_SellPlus 
    | MOD_FIX_Side_SellShort 
    | MOD_FIX_Side_SellShortExempt 
    | MOD_FIX_Side_Undisclosed 
    | MOD_FIX_Side_Cross 
    | MOD_FIX_Side_CrossShort 
;;

type model_fix_ordstatus =
    | MOD_FIX_OrdStatus_New 
    | MOD_FIX_OrdStatus_PartiallyFilled 
    | MOD_FIX_OrdStatus_Filled 
    | MOD_FIX_OrdStatus_DoneForDay 
    | MOD_FIX_OrdStatus_Canceled 
    | MOD_FIX_OrdStatus_Replaced 
    | MOD_FIX_OrdStatus_PendingCancel 
    | MOD_FIX_OrdStatus_Stopped 
    | MOD_FIX_OrdStatus_Rejected 
    | MOD_FIX_OrdStatus_Suspended 
    | MOD_FIX_OrdStatus_PendingNew 
    | MOD_FIX_OrdStatus_Calculated 
    | MOD_FIX_OrdStatus_Expired 
    | MOD_FIX_OrdStatus_AcceptedForBidding 
    | MOD_FIX_OrdStatus_PendingReplace 
;;

type model_fix_exectranstype =
    | MOD_FIX_ExecTransType_New 
    | MOD_FIX_ExecTransType_Cancel 
    | MOD_FIX_ExecTransType_Correct 
    | MOD_FIX_ExecTransType_Status 
;;

type model_fix_ordtype =
    | MOD_FIX_OrdType_Market 
    | MOD_FIX_OrdType_Limit 
    | MOD_FIX_OrdType_Stop 
    | MOD_FIX_OrdType_StopLimit 
    | MOD_FIX_OrdType_MarketOnClose 
    | MOD_FIX_OrdType_WithOrWithout 
    | MOD_FIX_OrdType_LimitOrBetter 
    | MOD_FIX_OrdType_LimitWithOrWithout 
    | MOD_FIX_OrdType_OnBasis 
    | MOD_FIX_OrdType_OnClose 
    | MOD_FIX_OrdType_LimitOnClose 
    | MOD_FIX_OrdType_ForexMarket 
    | MOD_FIX_OrdType_PreviouslyQuoted 
    | MOD_FIX_OrdType_PreviouslyIndicated 
    | MOD_FIX_OrdType_ForexLimit 
    | MOD_FIX_OrdType_ForexSwap 
    | MOD_FIX_OrdType_ForexPreviouslyQuoted 
    | MOD_FIX_OrdType_Funari 
    | MOD_FIX_OrdType_Pegged 
;;

type model_fix_handlinst =
    | MOD_FIX_HandlInst_AutomatedExecutionNoIntervention 
    | MOD_FIX_HandlInst_AutomatedExecutionInterventionOK 
    | MOD_FIX_HandlInst_ManualOrder 
;;
