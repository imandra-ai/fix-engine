(** 

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    Implementation of the FIX 4.4 engine. Printers/parsers.

    fix_pp.ml 
*)

open Yojson
open String
open List
open Basic_types
open Datetime
open Full_fix_fields
open Full_session_core

let fix_field_to_string = function 
    | Full_FIX_Field_OrigClOrdID                        -> "OrigClOrdID"
    | Full_FIX_Field_OrderID                            -> "OrderID"
    | Full_FIX_Field_ClOrdID                            -> "ClOrdID"
    | Full_FIX_Field_ExecType                           -> "ExecType"
    | Full_FIX_Field_ExecID                             -> "ExecID"
    | Full_FIX_Field_Account                            -> "Account"
    | Full_FIX_Field_Side                               -> "Side"
    | Full_FIX_Field_OrdType                            -> "OrdType"
    | Full_FIX_Field_OrdStatus                          -> "OrdStatus"
    | Full_FIX_Field_AvgPx                              -> "AvgPx"
    | Full_FIX_Field_Price                              -> "Price"
    | Full_FIX_Field_LeavesQty                          -> "LeavesQty"
    | Full_FIX_Field_CumQty                             -> "CumQty"
    | Full_FIX_Field_OrderQty                           -> "OrderQty"
    | Full_FIX_Field_MinQty                             -> "MinQty"
    | Full_FIX_Field_HandlInst                          -> "HandlInst"
    | Full_FIX_Field_TransactTime                       -> "TransactTime"
    | Full_FIX_Field_Symbol                             -> "Symbol"
    | Full_FIX_Field_SymbolSfx                          -> "SymbolSfx"
    | Full_FIX_Field_TimeInForce                        -> "TimeInForce"
    | Full_FIX_Field_Currency                           -> "Currency"
    | Full_FIX_Field_LocateBroker                       -> "LocateBroker"
    | Full_FIX_Field_LocateReqd                         -> "LocateReqd"
    | Full_FIX_Field_ExecInst                           -> "ExecInst"
;;

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

let filter_nulls =
    List.filter (function ( _, `Null ) -> false | _ -> true )
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


let utctimestampt_to_json ( ts : fix_utctimestamp ) =
    let list_assoc = [
        ( "utc_timestamp_year"                          , `Int ts.utc_timestamp_year                     );
        ( "utc_timestamp_month"                         , `Int ts.utc_timestamp_month                    );
        ( "utc_timestamp_day"                           , `Int ts.utc_timestamp_day                      );
        ( "utc_timestamp_hour"                          , `Int ts.utc_timestamp_hour                     );
        ( "utc_timestamp_minute"                        , `Int ts.utc_timestamp_minute                   );
        ( "utc_timestamp_second"                        , `Int ts.utc_timestamp_second                   );
        ( "uts_timestamp_millisec"                      , intopt_to_json ts.uts_timestamp_millisec       );
    ] |> filter_nulls in
    `Assoc list_assoc
;;

let utcduration_to_json ( d : fix_duration ) = 
    let list_assoc = [
        ( "dur_years"                                   , intopt_to_json d.dur_years                     );
        ( "dur_months"                                  , intopt_to_json d.dur_months                    );
        ( "dur_weeks"                                   , intopt_to_json d.dur_weeks                     );
        ( "dur_days"                                    , intopt_to_json d.dur_days                      );
        ( "dur_hours"                                   , intopt_to_json d.dur_hours                     );
        ( "dur_minutes"                                 , intopt_to_json d.dur_minutes                   );
        ( "dur_seconds"                                 , intopt_to_json d.dur_seconds                   );
    ] |> filter_nulls in 
    `Assoc list_assoc
;;


let header_to_json (fh : fix_header) : Yojson.Basic.json =
    let list_assoc = [
        ( "begin_string"                                , `Int fh.begin_string                           );                        
        ( "body_length"                                 , `Int fh.body_length                            );
        ( "sender_comp_id"                              , `Int fh.sender_comp_id                         );
        ( "target_comp_id"                              , `Int fh.target_comp_id                         );
        ( "msg_seq_num"                                 , `Int fh.msg_seq_num                            );
                                       
        ( "on_behalf_of_comp_id"                        , intopt_to_json fh.on_behalf_of_comp_id         );
        ( "deliver_to_comp_id"                          , intopt_to_json fh.deliver_to_comp_id           );
        ( "secure_data_len"                             , intopt_to_json fh.secure_data_len              );
        ( "secure_data"                                 , intopt_to_json fh.secure_data                  );
        ( "sender_sub_id"                               , intopt_to_json fh.sender_sub_id                );
        ( "sender_location_id"                          , intopt_to_json fh.sender_location_id           );
        ( "target_sub_id"                               , intopt_to_json fh.target_sub_id                );
        ( "target_location_id"                          , intopt_to_json fh.target_location_id           );
        ( "on_behalf_of_sub_id"                         , intopt_to_json fh.on_behalf_of_sub_id          );
        ( "on_behalf_of_location_id"                    , intopt_to_json fh.on_behalf_of_location_id     );
        ( "deliver_to_sub_id"                           , intopt_to_json fh.deliver_to_sub_id            );
        ( "deliver_to_location_id"                      , intopt_to_json fh.deliver_to_location_id       );   
        ( "poss_dup_flag"                               , boolopt_to_json fh.poss_dup_flag               );
        ( "poss_resend"                                 , boolopt_to_json fh.poss_resend                 );             
        ( "sending_time"                                , intopt_to_json fh.sending_time                 );
        ( "orig_sending_time"                           , intopt_to_json fh.orig_sending_time            );
        ( "xml_data_len"                                , intopt_to_json fh.xml_data_len                 );
        ( "xml_data"                                    , intopt_to_json fh.xml_data                     );
        ( "message_enconding"                           , intopt_to_json fh.message_enconding            );
        ( "last_msg_seq_num_processed"                  , intopt_to_json fh.last_msg_seq_num_processed   );
        ( "no_hops"                                     , intopt_to_json fh.no_hops                      );
        ] |> filter_nulls
        in
    `Assoc list_assoc
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
