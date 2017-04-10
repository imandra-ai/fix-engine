(** Tag 423: http://www.onixs.biz/fix-dictionary/4.4/tagNum_423.html *)
type fix_pricetype = 
    | FIX_Price_Percentage
    | FIX_Price_PerUnit 
    | FIX_Price_FixedAmount
    | FIX_Price_Discount
    | FIX_Price_Premium
    | FIX_Price_Spread
    | FIX_Price_TEDPrice
    | FIX_Price_TEDYield
    | FIX_Price_Yield
;;

(** CommType: Tag 13 -  http://www.onixs.biz/fix-dictionary/4.4/tagNum_13.html *)
type fix_commtype = 
    | FIX_CommType_PerUnit
    | FIX_CommType_Percentage
    | FIX_CommType_Absolute
    | FIX_CommType_CashDiscount
    | FIX_CommType_EnhancedUnits
;;

(** Tag 39: http://www.onixs.biz/fix-dictionary/4.4/tagNum_39.html *)
type fix_ordstatus = 
    | FIX_Ord_Status_New
    | FIX_Ord_Status_PartiallyFilled
    | FIX_Ord_Status_Filled
    | FIX_Ord_Status_DoneForDay
    | FIX_Ord_Status_Canceled
    | FIX_Ord_Status_Replaced
    | FIX_Ord_Status_PendingCancel
    | FIX_Ord_Status_Stopped
    | FIX_Ord_Status_Rejected
    | FIX_Ord_Status_Suspended
    | FIX_Ord_Status_PendingNew
    | FIX_Ord_Status_Calculated
    | FIX_Ord_Status_Expired
    | FIX_Ord_Status_AcceptedForBidding
    | FIX_Ord_Status_PendingReplace
;;

type fix_timeinforce =
    | FIX_TimeInForce_Day
    | FIX_TimeInForce_IOC
    | FIX_TimeInForce_OPG
    | FIX_TimeInForce_FOK
    | FIX_TimeInForce_GTK
    | FIX_TimeInForce_GoodTillDate
;;

type fix_execinst = 
    | FIX_ExecInst_NotHeld
    | FIX_ExecInst_Work
    | FIX_ExecInst_GoAlong
    | FIX_ExecInst_OverTheDay
    | FIX_ExecInst_Held
    | FIX_ExecInst_MidpointPeg
    | FIX_ExecInst_MarketPeg
    | FIX_ExecInst_PrimaryPeg
;;

type fix_handlinst =
    | FIX_HandlInst_Automated_NoInt
    | FIX_HandlInst_Automated_Int
    | FIX_HandlInst_Manual
;;

type fix_exectype = 
    | FIX_ExecType_New
    | FIX_ExecType_PartialFill
    | FIX_ExecType_Fill
    | FIX_ExecType_DoneForDay
    | FIX_ExecType_Canceled
    | FIX_ExecType_Replace
    | FIX_ExecType_PendingCancel
    | FIX_ExecType_Stopped
    | FIX_ExecType_Rejected
    | FIX_ExecType_Suspended
    | FIX_ExecType_PendingNew
    | FIX_ExecType_Calculated
;;

type fix_ordertype = 
    | FIX_Ord_Type_Market
    | FIX_Ord_Type_Limit
    | FIX_Ord_Type_Stop
    | FIX_Ord_Type_StopLimit
    | FIX_Ord_Type_MarketOnClose
    | FIX_Ord_Type_WithOrWithout
    | FIX_Ord_Type_LimitOrBetter
    | FIX_Ord_Type_LimitWithOrWithout
    | FIX_Ord_Type_OnBasis
    | FIX_Ord_Type_OnClose
    | FIX_Ord_Type_LimitOnClose
    | FIX_Ord_Type_ForexMarket
    | FIX_Ord_Type_PreviouslyQuoted
    | FIX_Ord_Type_PreviouslyIndicated
    | FIX_Ord_Type_ForexLimit
    | FIX_Ord_Type_ForexSwap
    | FIX_Ord_Type_ForexPreviouslyQuoted
    | FIX_Ord_Type_Funari
    | FIX_Ord_Type_MarketIfTouched
    | FIX_Ord_Type_MarketWithLeftOverAsLimit
    | FIX_Ord_Type_PreviousFundValuationPoint
    | FIX_Ord_Type_NextFundValuationPoint
    | FIX_Ord_Type_Pegged
;;

(** Side *)
type fix_side =
    | FIX_Side_Buy
    | FIX_Side_Sell
    | FIX_Side_BuyMinus
    | FIX_Side_SellPlus
    | FIX_Side_SellShort
    | FIX_Side_SellShortExempt
    | FIX_Side_Undisclosed
    | FIX_Side_Cross
    | FIX_Side_CrossShort
    | FIX_Side_CrossShortExempt
    | FIX_Side_AsDefined
    | FIX_Side_Opposite
    | FIX_Side_Subscribe
    | FIX_Side_Redeem
    | FIX_Side_Lend
    | FIX_Side_Borrow
;;

