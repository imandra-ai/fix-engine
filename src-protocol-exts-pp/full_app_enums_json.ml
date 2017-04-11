(* @meta[imandra_ignore] on @end *)
open Yojson;;
open Full_app_enums;;
(* @meta[imandra_ignore] off @end *)

let pricetype_to_string = function 
    | FIX_Price_Percentage                    -> "Percentage"
    | FIX_Price_PerUnit                       -> "PerUnit"
    | FIX_Price_FixedAmount                   -> "FixedAmount"
    | FIX_Price_Discount                      -> "Discount"
    | FIX_Price_Premium                       -> "Premium"
    | FIX_Price_Spread                        -> "Spread"
    | FIX_Price_TEDPrice                      -> "TEDPrice"
    | FIX_Price_TEDYield                      -> "TEDYield"
    | FIX_Price_Yield                         -> "Yield"
;;

let commtype_to_string = function 
    | FIX_CommType_PerUnit                    -> "PerUnit"
    | FIX_CommType_Percentage                 -> "Percentage"
    | FIX_CommType_Absolute                   -> "Absolute"
    | FIX_CommType_CashDiscount               -> "CashDiscount"
    | FIX_CommType_EnhancedUnits              -> "EnhancedUnits"
;;

let ordstatus_to_string = function 
    | FIX_Ord_Status_New                      -> "New"
    | FIX_Ord_Status_PartiallyFilled          -> "PartiallyFilled"
    | FIX_Ord_Status_Filled                   -> "Filled"
    | FIX_Ord_Status_DoneForDay               -> "DoneForDay"
    | FIX_Ord_Status_Canceled                 -> "Canceled"
    | FIX_Ord_Status_Replaced                 -> "Replaced"
    | FIX_Ord_Status_PendingCancel            -> "PendingCancel"
    | FIX_Ord_Status_Stopped                  -> "Stopped"
    | FIX_Ord_Status_Rejected                 -> "Rejected"
    | FIX_Ord_Status_Suspended                -> "Suspended"
    | FIX_Ord_Status_PendingNew               -> "PendingNew"
    | FIX_Ord_Status_Calculated               -> "Calculated"
    | FIX_Ord_Status_Expired                  -> "Expired"
    | FIX_Ord_Status_AcceptedForBidding       -> "AcceptedForBidding"
    | FIX_Ord_Status_PendingReplace           -> "PendingReplace"
;;

let timeinforce_to_string =function 
    | FIX_TimeInForce_Day                     -> "Day"
    | FIX_TimeInForce_IOC                     -> "IOC"
    | FIX_TimeInForce_OPG                     -> "OPG"
    | FIX_TimeInForce_FOK                     -> "FOK"
    | FIX_TimeInForce_GTK                     -> "GTK"
    | FIX_TimeInForce_GoodTillDate            -> "GoodTillDate"
;;

let execinst_to_string = function 
    | FIX_ExecInst_NotHeld                    -> "NotHeld"
    | FIX_ExecInst_Work                       -> "Work"
    | FIX_ExecInst_GoAlong                    -> "GoAlong"
    | FIX_ExecInst_OverTheDay                 -> "OverTheDay"
    | FIX_ExecInst_Held                       -> "Held"
    | FIX_ExecInst_MidpointPeg                -> "MidpointPeg"
    | FIX_ExecInst_MarketPeg                  -> "MarketPeg"
    | FIX_ExecInst_PrimaryPeg                 -> "PrimaryPeg"
;;

let handlinst_to_string =function 
    | FIX_HandlInst_Automated_NoInt           -> "Automated_NoInt"
    | FIX_HandlInst_Automated_Int             -> "Automated_Int"  
    | FIX_HandlInst_Manual                    -> "Manual"         
;;

let exectype_to_string = function 
    | FIX_ExecType_New                        -> "New"
    | FIX_ExecType_PartialFill                -> "PartialFill"
    | FIX_ExecType_Fill                       -> "Fill"
    | FIX_ExecType_DoneForDay                 -> "DoneForDay"
    | FIX_ExecType_Canceled                   -> "Canceled"
    | FIX_ExecType_Replace                    -> "Replace"
    | FIX_ExecType_PendingCancel              -> "PendingCancel"
    | FIX_ExecType_Stopped                    -> "Stopped"
    | FIX_ExecType_Rejected                   -> "Rejected"
    | FIX_ExecType_Suspended                  -> "Suspended"
    | FIX_ExecType_PendingNew                 -> "PendingNew"
    | FIX_ExecType_Calculated                 -> "Calculated"
;;

let ordertype_to_string = function 
    | FIX_Ord_Type_Market                     -> "Market"
    | FIX_Ord_Type_Limit                      -> "Limit"
    | FIX_Ord_Type_Stop                       -> "Stop"
    | FIX_Ord_Type_StopLimit                  -> "StopLimit"
    | FIX_Ord_Type_MarketOnClose              -> "MarketOnClose"
    | FIX_Ord_Type_WithOrWithout              -> "WithOrWithout"
    | FIX_Ord_Type_LimitOrBetter              -> "LimitOrBetter"
    | FIX_Ord_Type_LimitWithOrWithout         -> "LimitWithOrWithout"
    | FIX_Ord_Type_OnBasis                    -> "OnBasis"
    | FIX_Ord_Type_OnClose                    -> "OnClose"
    | FIX_Ord_Type_LimitOnClose               -> "LimitOnClose"
    | FIX_Ord_Type_ForexMarket                -> "ForexMarket"
    | FIX_Ord_Type_PreviouslyQuoted           -> "PreviouslyQuoted"
    | FIX_Ord_Type_PreviouslyIndicated        -> "PreviouslyIndicated"
    | FIX_Ord_Type_ForexLimit                 -> "ForexLimit"
    | FIX_Ord_Type_ForexSwap                  -> "ForexSwap"
    | FIX_Ord_Type_ForexPreviouslyQuoted      -> "ForexPreviouslyQuoted"
    | FIX_Ord_Type_Funari                     -> "Funari"
    | FIX_Ord_Type_MarketIfTouched            -> "MarketIfTouched"
    | FIX_Ord_Type_MarketWithLeftOverAsLimit  -> "MarketWithLeftOverAsLimit"
    | FIX_Ord_Type_PreviousFundValuationPoint -> "PreviousFundValuationPoint"
    | FIX_Ord_Type_NextFundValuationPoint     -> "NextFundValuationPoint"
    | FIX_Ord_Type_Pegged                     -> "Pegged"
;;

let side_to_string = function 
    | FIX_Side_Buy                            -> "Buy"
    | FIX_Side_Sell                           -> "Sell"
    | FIX_Side_BuyMinus                       -> "BuyMinus"
    | FIX_Side_SellPlus                       -> "SellPlus"
    | FIX_Side_SellShort                      -> "SellShort"
    | FIX_Side_SellShortExempt                -> "SellShortExempt"
    | FIX_Side_Undisclosed                    -> "Undisclosed"
    | FIX_Side_Cross                          -> "Cross"
    | FIX_Side_CrossShort                     -> "CrossShort"
    | FIX_Side_CrossShortExempt               -> "CrossShortExempt"
    | FIX_Side_AsDefined                      -> "AsDefined"
    | FIX_Side_Opposite                       -> "Opposite"
    | FIX_Side_Subscribe                      -> "Subscribe"
    | FIX_Side_Redeem                         -> "Redeem"
    | FIX_Side_Lend                           -> "Lend"
    | FIX_Side_Borrow                         -> "Borrow"
;;

let pricetype_to_json   x : json = `String ( pricetype_to_string   x ) ;;
let commtype_to_json    x : json = `String ( commtype_to_string    x ) ;;
let ordstatus_to_json   x : json = `String ( ordstatus_to_string   x ) ;;
let timeinforce_to_json x : json = `String ( timeinforce_to_string x ) ;;
let execinst_to_json    x : json = `String ( execinst_to_string    x ) ;;
let handlinst_to_json   x : json = `String ( handlinst_to_string   x ) ;;
let exectype_to_json    x : json = `String ( exectype_to_string    x ) ;;
let ordertype_to_json   x : json = `String ( ordertype_to_string   x ) ;;
let side_to_json        x : json = `String ( side_to_string        x ) ;;

let pricetype_opt_to_json   = function None -> `Null | Some x -> pricetype_to_json   x ;;
let commtype_opt_to_json    = function None -> `Null | Some x -> commtype_to_json    x ;;
let ordstatus_opt_to_json   = function None -> `Null | Some x -> ordstatus_to_json   x ;;
let timeinforce_opt_to_json = function None -> `Null | Some x -> timeinforce_to_json x ;;
let execinst_opt_to_json    = function None -> `Null | Some x -> execinst_to_json    x ;;
let handlinst_opt_to_json   = function None -> `Null | Some x -> handlinst_to_json   x ;;
let exectype_opt_to_json    = function None -> `Null | Some x -> exectype_to_json    x ;;
let ordertype_opt_to_json   = function None -> `Null | Some x -> ordertype_to_json   x ;;
let side_opt_to_json        = function None -> `Null | Some x -> side_to_json        x ;;
