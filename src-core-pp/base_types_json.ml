(** JSON printers/parsers for base FIX types. *)
(***

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    base_types_json.ml 
*)

(* @meta[imandra_ignore] on @end *)
open Base_types;;
open Numeric;;
(* @meta[imandra_ignore] off @end *)

(** Session rejection reasons *)
let fix_session_reject_to_string = function 
    | InvalidTagNumber                                  -> "Invalid Tag Number"
    | RequiredTagMissing                                -> "Required Tag Missing"
    | TagNotDefined                                     -> "Tag not defined"
    | UndefinedTag                                      -> "Undefined Tag"
    | TagSecifiedWithoutAValue                          -> "Tag specified without a value"
    | ValueIsIncorrect                                  -> "Value is incorrect"
    | IncorrectDataFormatForValue                       -> "Incorrect data format for value"
    | DecryptionProblem                                 -> "Decryption problem"
    | SignatureProblem                                  -> "Signature problem"
    | CompIDProblem                                     -> "CompID problem"
    | SendingTimeAccuracyProblem                        -> "Sending time accuracy problem"
    | InvalidMsgType                                    -> "Invalid msg type"
    | XMLValidationError                                -> "XML Validation Error"
    | TagAppearsMoreThanOnce                            -> "Tag appears more than once"
    | TagSpecifiedOutOfRequiredOrder                    -> "Tag specified out of required order"
    | RepeatingGroupFieldsOutOfOrder                    -> "Repeating group fields out of order"
    | IncorrectNumInGroupCountForRepeatingGroup         -> "Incorrect NumInGroup count for repeating group"
    | NonDataValueIncludesFieldDelimiter                -> "Non data value includes field delimiter"
;;

let reject_reason_opt_to_string = function
    | None                                              -> None
    | Some x                                            -> Some (fix_session_reject_to_string x)
;;

let busines_reject_reason_to_string = function
    | ApplicationDown                                   -> "ApplicationDown"
    | MessageTypeNotSupported                           -> "MessageTypeNotSupported"
    | FieldMissing                                      -> "FieldMissing"
;;


(** Business rejection reasons. *)
let fix_business_reject_to_string = function
    | ApplicationDown                                   -> "ApplicationDown"
    | MessageTypeNotSupported                           -> "MessageTypeNotSupported"
    | FieldMissing                                      -> "FieldMissing"
;;

let biz_reject_opt_to_string = function
    | None                                              -> None
    | Some x                                            -> Some (fix_business_reject_to_string x)
;;

(** http://www.onixs.biz/fix-dictionary/4.4/tagNum_423.html *)
let price_type_to_string = function
    | FIX_Price_Percentage                              -> "1"
    | FIX_Price_PerUnit                                 -> "2"
    | FIX_Price_FixedAmount                             -> "3"
    | FIX_Price_Discount                                -> "4"
    | FIX_Price_Premium                                 -> "5"
    | FIX_Price_Spread                                  -> "6"
    | FIX_Price_TEDPrice                                -> "7"
    | FIX_Price_TEDYield                                -> "8"
    | FIX_Price_Yield                                   -> "9"
;;

let price_type_opt_to_string = function
    | None                                              -> None
    | Some x                                            -> Some (price_type_to_string x)
;;

let string_to_price_type = function
    | "1"                                               -> FIX_Price_Percentage
    | "2"                                               -> FIX_Price_PerUnit
    | "3"                                               -> FIX_Price_FixedAmount
    | "4"                                               -> FIX_Price_Discount
    | "5"                                               -> FIX_Price_Premium
    | "6"                                               -> FIX_Price_Spread
    | "7"                                               -> FIX_Price_TEDPrice
    | "8"                                               -> FIX_Price_TEDYield
    | _                                                 -> FIX_Price_Yield
;;

(** http://www.onixs.biz/fix-dictionary/4.4/tagNum_54.html *)
let side_to_string = function
    | FIX_Side_Buy                                      -> "1"
    | FIX_Side_Sell                                     -> "2"
    | FIX_Side_BuyMinus                                 -> "3"
    | FIX_Side_SellPlus                                 -> "4"
    | FIX_Side_SellShort                                -> "5"
    | FIX_Side_SellShortExempt                          -> "6"
    | FIX_Side_Undisclosed                              -> "7"
    | FIX_Side_Cross                                    -> "8"
    | FIX_Side_CrossShort                               -> "9"
    | FIX_Side_CrossShortExempt                         -> "A"
    | FIX_Side_AsDefined                                -> "B"
    | FIX_Side_Opposite                                 -> "C"
    | FIX_Side_Subscribe                                -> "D"
    | FIX_Side_Redeem                                   -> "E"
    | FIX_Side_Lend                                     -> "F"
    | FIX_Side_Borrow                                   -> "G"
;;

let sideopt_to_string = function
    | None                                              -> None
    | Some x                                            -> Some ( side_to_string x )
;;

let string_to_side = function 
    | "1"                                               -> FIX_Side_Buy
    | "2"                                               -> FIX_Side_Sell
    | "3"                                               -> FIX_Side_BuyMinus
    | "4"                                               -> FIX_Side_SellPlus
    | "5"                                               -> FIX_Side_SellShort
    | "6"                                               -> FIX_Side_SellShortExempt
    | "7"                                               -> FIX_Side_Undisclosed
    | "8"                                               -> FIX_Side_Cross
    | "9"                                               -> FIX_Side_CrossShort
    | "A"                                               -> FIX_Side_CrossShortExempt
    | "B"                                               -> FIX_Side_AsDefined
    | "C"                                               -> FIX_Side_Opposite
    | "D"                                               -> FIX_Side_Subscribe
    | "E"                                               -> FIX_Side_Redeem
    | "F"                                               -> FIX_Side_Lend
    | "G"                                               
    |  _                                                -> FIX_Side_Borrow
;;
(** Order statuses: http://www.onixs.biz/fix-dictionary/4.4/tagNum_39.html *)
let ord_status_to_string = function 
    | FIX_Ord_Status_New                                -> "0"
    | FIX_Ord_Status_PartiallyFilled                    -> "1"
    | FIX_Ord_Status_Filled                             -> "2"
    | FIX_Ord_Status_DoneForDay                         -> "3"
    | FIX_Ord_Status_Canceled                           -> "4"
    | FIX_Ord_Status_Replaced                           -> "5"
    | FIX_Ord_Status_PendingCancel                      -> "6"
    | FIX_Ord_Status_Stopped                            -> "7"
    | FIX_Ord_Status_Rejected                           -> "8"
    | FIX_Ord_Status_Suspended                          -> "9"
    | FIX_Ord_Status_PendingNew                         -> "A"
    | FIX_Ord_Status_Calculated                         -> "B"
    | FIX_Ord_Status_Expired                            -> "C"
    | FIX_Ord_Status_AcceptedForBidding                 -> "D"
    | FIX_Ord_Status_PendingReplace                     -> "E"
;;

let ord_status_opt_to_string = function
    | None                                              -> None
    | Some s                                            -> Some (ord_status_to_string (s))
;;

(** The opposite of above - notice that Invalid is mapped to all 
    incorrect strings *)
let string_to_ord_status = function
    | "0"                                               -> FIX_Ord_Status_New
    | "1"                                               -> FIX_Ord_Status_PartiallyFilled
    | "2"                                               -> FIX_Ord_Status_Filled
    | "3"                                               -> FIX_Ord_Status_DoneForDay
    | "4"                                               -> FIX_Ord_Status_Canceled
    | "5"                                               -> FIX_Ord_Status_Replaced
    | "6"                                               -> FIX_Ord_Status_PendingCancel
    | "7"                                               -> FIX_Ord_Status_Stopped
    | "8"                                               -> FIX_Ord_Status_Rejected
    | "9"                                               -> FIX_Ord_Status_Suspended
    | "A"                                               -> FIX_Ord_Status_PendingNew
    | "B"                                               -> FIX_Ord_Status_Calculated
    | "C"                                               -> FIX_Ord_Status_Expired
    | "D"                                               -> FIX_Ord_Status_AcceptedForBidding
    | "E"                                               
    | _                                                 -> FIX_Ord_Status_PendingReplace
;;

(** Order types: http://www.onixs.biz/fix-dictionary/4.4/tagNum_40.html *)
let ord_type_to_string = function 
    | FIX_Ord_Type_Market                               -> "1"
    | FIX_Ord_Type_Limit                                -> "2"
    | FIX_Ord_Type_Stop                                 -> "3"
    | FIX_Ord_Type_StopLimit                            -> "4"
    | FIX_Ord_Type_MarketOnClose                        -> "5"
    | FIX_Ord_Type_WithOrWithout                        -> "6"
    | FIX_Ord_Type_LimitOrBetter                        -> "7"
    | FIX_Ord_Type_LimitWithOrWithout                   -> "8"
    | FIX_Ord_Type_OnBasis                              -> "9"
    | FIX_Ord_Type_OnClose                              -> "A"
    | FIX_Ord_Type_LimitOnClose                         -> "B"
    | FIX_Ord_Type_ForexMarket                          -> "C"
    | FIX_Ord_Type_PreviouslyQuoted                     -> "D"
    | FIX_Ord_Type_PreviouslyIndicated                  -> "E"
    | FIX_Ord_Type_ForexLimit                           -> "F"
    | FIX_Ord_Type_ForexSwap                            -> "G"
    | FIX_Ord_Type_ForexPreviouslyQuoted                -> "H"
    | FIX_Ord_Type_Funari                               -> "I"
    | FIX_Ord_Type_MarketIfTouched                      -> "J"
    | FIX_Ord_Type_MarketWithLeftOverAsLimit            -> "K"
    | FIX_Ord_Type_PreviousFundValuationPoint           -> "L"
    | FIX_Ord_Type_NextFundValuationPoint               -> "M"
    | FIX_Ord_Type_Pegged                               -> "P"
;;

let ordtype_opt_to_string = function
    | None                                              -> None
    | Some x                                            -> Some ( ord_type_to_string x )
;;

let string_to_ord_type = function 
    | "1"                                               -> FIX_Ord_Type_Market
    | "2"                                               -> FIX_Ord_Type_Limit
    | "3"                                               -> FIX_Ord_Type_Stop
    | "4"                                               -> FIX_Ord_Type_StopLimit
    | "5"                                               -> FIX_Ord_Type_MarketOnClose
    | "6"                                               -> FIX_Ord_Type_WithOrWithout
    | "7"                                               -> FIX_Ord_Type_LimitOrBetter
    | "8"                                               -> FIX_Ord_Type_LimitWithOrWithout
    | "9"                                               -> FIX_Ord_Type_OnBasis
    | "A"                                               -> FIX_Ord_Type_OnClose
    | "B"                                               -> FIX_Ord_Type_LimitOnClose
    | "C"                                               -> FIX_Ord_Type_ForexMarket
    | "D"                                               -> FIX_Ord_Type_PreviouslyQuoted
    | "E"                                               -> FIX_Ord_Type_PreviouslyIndicated
    | "F"                                               -> FIX_Ord_Type_ForexLimit
    | "G"                                               -> FIX_Ord_Type_ForexSwap
    | "H"                                               -> FIX_Ord_Type_ForexPreviouslyQuoted
    | "I"                                               -> FIX_Ord_Type_Funari
    | "J"                                               -> FIX_Ord_Type_MarketIfTouched
    | "K"                                               -> FIX_Ord_Type_MarketWithLeftOverAsLimit
    | "L"                                               -> FIX_Ord_Type_PreviousFundValuationPoint
    | "M"                                               -> FIX_Ord_Type_NextFundValuationPoint
    | "P"                                               
    | _                                                 -> FIX_Ord_Type_Pegged
;;

let intopt_to_json : ( int option -> Yojson.Basic.json ) = 
    function None -> `Null | Some n -> `Int  n
;;

let boolopt_to_json : ( bool option -> Yojson.Basic.json ) = 
    function None -> `Null | Some b -> `Bool b
;;

let stringopt_to_json : ( string option -> Yojson.Basic.json) = 
    function None -> `Null | Some s -> `String s
;;

let floatopt_to_json : ( fix_float option -> Yojson.Basic.json ) = function
    | None -> `Null
    | Some b -> `Float ( float_GetFloat ( b ) )
;;

(** Basic Yes/No type *)
let yes_no_to_string = function
    | FIX_Yes                                           -> "Y"
    | FIX_No                                            -> "N"
    | FIX_YesNo_Invalid                                 -> "Invalid"
;;

let yes_no_opt_to_string = function
    | None                                              -> None
    | Some y                                            -> Some (yes_no_to_string y)
;;

let string_to_yes_no = function
    | "Y"                                               -> FIX_Yes    
    | "N"                                               -> FIX_No 
    | _                                                 -> FIX_YesNo_Invalid
;;

let priceopt_to_string p =
    match p with 
    | None                                              -> None
    | Some k                                            -> Some (Printf.sprintf "%.1d" k)
;;


let currency_to_string = function
    | GBP                                               -> "GBP"
    | USD                                               -> "USD"
;;

let currency_opt_to_string = function
    | None                                              -> None
    | Some x                                            -> Some ( currency_to_string x )
;;

let exectype_to_string = function 
    | FIX_ExecType_New                                  -> "New"
    | FIX_ExecType_PartialFill                          -> "PartialFill"
    | FIX_ExecType_Fill                                 -> "Fill"
    | FIX_ExecType_DoneForDay                           -> "DoneForDay"
    | FIX_ExecType_Canceled                             -> "Canceled"
    | FIX_ExecType_Replace                              -> "Replace"
    | FIX_ExecType_PendingCancel                        -> "PendingCancel"
    | FIX_ExecType_Stopped                              -> "Stopped"
    | FIX_ExecType_Rejected                             -> "Rejected"
    | FIX_ExecType_Suspended                            -> "Suspended"
    | FIX_ExecType_PendingNew                           -> "PendingNew"
    | FIX_ExecType_Calculated                           -> "Calculated"
;;

let exectype_opt_to_string = function
    | None                                              -> None
    | Some x                                            -> Some ( exectype_to_string x )
;;

let handleinst_to_string = function
    | FIX_HandlInst_Automated_NoInt                     -> "Automated_NoInt"
    | FIX_HandlInst_Automated_Int                       -> "Automated_Int"
    | FIX_HandlInst_Manual                              -> "Manual"
;;

let handleinst_opt_to_string = function
    | None                                              -> None
    | Some x                                            -> Some ( handleinst_to_string x )
;;

let execinst_to_string = function 
    | FIX_ExecInst_NotHeld                              -> "NotHeld"
    | FIX_ExecInst_Work                                 -> "Work"
    | FIX_ExecInst_GoAlong                              -> "GoAlong"
    | FIX_ExecInst_OverTheDay                           -> "OverTheDay"
    | FIX_ExecInst_Held                                 -> "Held"
    | FIX_ExecInst_MidpointPeg                          -> "MidpointPeg"
    | FIX_ExecInst_MarketPeg                            -> "MarketPeg"
    | FIX_ExecInst_PrimaryPeg                           -> "PrimaryPeg"
;;

let execinst_opt_to_string = function
    | None                                              -> None
    | Some x                                            -> Some ( execinst_to_string x )
;;

let timeinforce_to_string = function
    | FIX_TimeInForce_Day                               -> "Day"
    | FIX_TimeInForce_IOC                               -> "IOC"
    | FIX_TimeInForce_OPG                               -> "OPG"
    | FIX_TimeInForce_FOK                               -> "FOK"
    | FIX_TimeInForce_GTK                               -> "GTK"
    | FIX_TimeInForce_GoodTillDate                      -> "GoodTillDate"
;;

let timeinforce_opt_to_string = function 
    | None                                              -> None
    | Some x                                            -> Some ( timeinforce_to_string x )
;;


let fix_GapFillFlag_opt_to_string = function
    | Some FIX_GapFillFlag_Y -> Some "Y"
    | Some FIX_GapFillFlag_N -> Some "N"
    | None ->  None
;;

let fix_encryption_method_to_str = function
    | PKCS                                             -> "PKCS"
    | DES_ECB                                          -> "DES_ECB"
    | PKCS_DES                                         -> "PKCS_DES"
    | PGP_DES                                          -> "PGP_DES"
    | PGP_DES_MD5                                      -> "PGP_DES_MD5"
    | PEM_DES_MD5                                      -> "PEM_DES_MD5"
    | NoEncryption                                     -> "NoEncryption"
;;
