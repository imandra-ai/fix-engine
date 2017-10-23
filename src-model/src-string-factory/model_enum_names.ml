(* Aesthetic Integration copyright 2017 *)
(* @meta[imandra_ignore] on @end *)
 open Model_app_enums;;
(* @meta[imandra_ignore] off @end *)

let mod_exectype_to_string ( d ) =
    (match d with
        | MOD_FIX_ExecType_New -> "New"
        | MOD_FIX_ExecType_DoneForDay -> "DoneForDay"
        | MOD_FIX_ExecType_Canceled -> "Canceled"
        | MOD_FIX_ExecType_Replaced -> "Replaced"
        | MOD_FIX_ExecType_PendingCancel -> "PendingCancel"
        | MOD_FIX_ExecType_Stopped -> "Stopped"
        | MOD_FIX_ExecType_Rejected -> "Rejected"
        | MOD_FIX_ExecType_Suspended -> "Suspended"
        | MOD_FIX_ExecType_PendingNew -> "PendingNew"
        | MOD_FIX_ExecType_Calculated -> "Calculated"
        | MOD_FIX_ExecType_Expired -> "Expired"
        | MOD_FIX_ExecType_Restated -> "Restated"
        | MOD_FIX_ExecType_PendingReplace -> "PendingReplace"
        | MOD_FIX_ExecType_Trade -> "Trade"
        | MOD_FIX_ExecType_TradeCorrect -> "TradeCorrect"
        | MOD_FIX_ExecType_TradeCancel -> "TradeCancel"
        | MOD_FIX_ExecType_OrderStatus -> "OrderStatus"
    )
;;

let mod_side_to_string ( d ) =
    (match d with
        | MOD_FIX_Side_Buy -> "Buy"
        | MOD_FIX_Side_Sell -> "Sell"
        | MOD_FIX_Side_BuyMinus -> "BuyMinus"
        | MOD_FIX_Side_SellPlus -> "SellPlus"
        | MOD_FIX_Side_SellShort -> "SellShort"
        | MOD_FIX_Side_SellShortExempt -> "SellShortExempt"
        | MOD_FIX_Side_Undisclosed -> "Undisclosed"
        | MOD_FIX_Side_Cross -> "Cross"
        | MOD_FIX_Side_CrossShort -> "CrossShort"
        | MOD_FIX_Side_CrossShortExempt -> "CrossShortExempt"
        | MOD_FIX_Side_AsDefined -> "AsDefined"
        | MOD_FIX_Side_Opposite -> "Opposite"
        | MOD_FIX_Side_Subscribe -> "Subscribe"
        | MOD_FIX_Side_Redeem -> "Redeem"
        | MOD_FIX_Side_Lend -> "Lend"
        | MOD_FIX_Side_Borrow -> "Borrow"
    )
;;

let mod_ordstatus_to_string ( d ) =
    (match d with
        | MOD_FIX_OrdStatus_New -> "New"
        | MOD_FIX_OrdStatus_PartiallyFilled -> "PartiallyFilled"
        | MOD_FIX_OrdStatus_Filled -> "Filled"
        | MOD_FIX_OrdStatus_DoneForDay -> "DoneForDay"
        | MOD_FIX_OrdStatus_Canceled -> "Canceled"
        | MOD_FIX_OrdStatus_PendingCancel -> "PendingCancel"
        | MOD_FIX_OrdStatus_Stopped -> "Stopped"
        | MOD_FIX_OrdStatus_Rejected -> "Rejected"
        | MOD_FIX_OrdStatus_Suspended -> "Suspended"
        | MOD_FIX_OrdStatus_PendingNew -> "PendingNew"
        | MOD_FIX_OrdStatus_Calculated -> "Calculated"
        | MOD_FIX_OrdStatus_Expired -> "Expired"
        | MOD_FIX_OrdStatus_AcceptedForBidding -> "AcceptedForBidding"
        | MOD_FIX_OrdStatus_PendingReplace -> "PendingReplace"
        | MOD_FIX_OrdStatus_Replaced -> "Replaced"
    )
;;

let mod_ordtype_to_string ( d ) =
    (match d with
        | MOD_FIX_OrdType_Market -> "Market"
        | MOD_FIX_OrdType_Limit -> "Limit"
        | MOD_FIX_OrdType_Stop -> "Stop"
        | MOD_FIX_OrdType_StopLimit -> "StopLimit"
        | MOD_FIX_OrdType_WithOrWithout -> "WithOrWithout"
        | MOD_FIX_OrdType_LimitOrBetter -> "LimitOrBetter"
        | MOD_FIX_OrdType_LimitWithOrWithout -> "LimitWithOrWithout"
        | MOD_FIX_OrdType_OnBasis -> "OnBasis"
        | MOD_FIX_OrdType_PreviouslyQuoted -> "PreviouslyQuoted"
        | MOD_FIX_OrdType_PreviouslyIndicated -> "PreviouslyIndicated"
        | MOD_FIX_OrdType_ForexSwap -> "ForexSwap"
        | MOD_FIX_OrdType_Funari -> "Funari"
        | MOD_FIX_OrdType_MarketIfTouched -> "MarketIfTouched"
        | MOD_FIX_OrdType_MarketWithLeftOverAsLimit -> "MarketWithLeftOverAsLimit"
        | MOD_FIX_OrdType_PreviousFundValuationPoint -> "PreviousFundValuationPoint"
        | MOD_FIX_OrdType_NextFundValuationPoint -> "NextFundValuationPoint"
        | MOD_FIX_OrdType_Pegged -> "Pegged"
    )
;;
