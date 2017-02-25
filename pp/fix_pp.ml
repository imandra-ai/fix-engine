(** 

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    Implementation of the FIX 4.4 engine. Printers/parsers.

    fix_pp.ml 
*)

open Yojson
open String
open List
open Fix_data_dictionary

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
    | None -> None
    | Some x -> Some (fix_session_reject_to_string x)
;;

(** Business rejection reasons. *)
let fix_business_reject_to_string = function
    | ApplicationDown                                   -> "ApplicationDown"
    | MessageTypeNotSupported                           -> "MessageTypeNotSupported"
    | FieldMissing                                      -> "FieldMissing"
;;

let biz_reject_opt_to_string = function
    | None -> None
    | Some x -> Some (fix_business_reject_to_string x)
;;

(** http://www.onixs.biz/fix-dictionary/4.4/tagNum_423.html *)
let price_type_to_string = function
    | FIX_Price_Percentage  -> "1"
    | FIX_Price_PerUnit     -> "2"
    | FIX_Price_FixedAmount -> "3"
    | FIX_Price_Discount    -> "4"
    | FIX_Price_Premium     -> "5"
    | FIX_Price_Spread      -> "6"
    | FIX_Price_TEDPrice    -> "7"
    | FIX_Price_TEDYield    -> "8"
    | FIX_Price_Yield       -> "9"
    | FIX_Price_Invalid     -> "Invalid"
;;

let price_type_opt_to_string = function
    | None -> None
    | Some x -> Some (price_type_to_string x)
;;

let string_to_price_type = function
    | "1" -> FIX_Price_Percentage
    | "2" -> FIX_Price_PerUnit
    | "3" -> FIX_Price_FixedAmount
    | "4" -> FIX_Price_Discount
    | "5" -> FIX_Price_Premium
    | "6" -> FIX_Price_Spread
    | "7" -> FIX_Price_TEDPrice
    | "8" -> FIX_Price_TEDYield
    | "9" -> FIX_Price_Yield
    | _   -> FIX_Price_Invalid
;;

(** http://www.onixs.biz/fix-dictionary/4.4/tagNum_54.html *)
let side_to_string = function
    | FIX_Side_Buy                      -> "1"
    | FIX_Side_Sell                     -> "2"
    | FIX_Side_BuyMinus                 -> "3"
    | FIX_Side_SellPlus                 -> "4"
    | FIX_Side_SellShort                -> "5"
    | FIX_Side_SellShortExempt          -> "6"
    | FIX_Side_Undisclosed              -> "7"
    | FIX_Side_Cross                    -> "8"
    | FIX_Side_CrossShort               -> "9"
    | FIX_Side_CrossShortExempt         -> "A"
    | FIX_Side_AsDefined                -> "B"
    | FIX_Side_Opposite                 -> "C"
    | FIX_Side_Subscribe                -> "D"
    | FIX_Side_Redeem                   -> "E"
    | FIX_Side_Lend                     -> "F"
    | FIX_Side_Borrow                   -> "G"
    | FIX_Side_Invalid                  -> "Invalid"
;;

let string_to_side = function 
    | "1" -> FIX_Side_Buy
    | "2" -> FIX_Side_Sell
    | "3" -> FIX_Side_BuyMinus
    | "4" -> FIX_Side_SellPlus
    | "5" -> FIX_Side_SellShort
    | "6" -> FIX_Side_SellShortExempt
    | "7" -> FIX_Side_Undisclosed
    | "8" -> FIX_Side_Cross
    | "9" -> FIX_Side_CrossShort
    | "A" -> FIX_Side_CrossShortExempt
    | "B" -> FIX_Side_AsDefined
    | "C" -> FIX_Side_Opposite
    | "D" -> FIX_Side_Subscribe
    | "E" -> FIX_Side_Redeem
    | "F" -> FIX_Side_Lend
    | "G" -> FIX_Side_Borrow
    | _   -> FIX_Side_Invalid
;;
(** Order statuses: http://www.onixs.biz/fix-dictionary/4.4/tagNum_39.html *)
let ord_status_to_string = function 
    | FIX_Ord_Status_New                -> "0"
    | FIX_Ord_Status_PartiallyFilled    -> "1"
    | FIX_Ord_Status_Filled             -> "2"
    | FIX_Ord_Status_DoneForDay         -> "3"
    | FIX_Ord_Status_Canceled           -> "4"
    | FIX_Ord_Status_Replaced           -> "5"
    | FIX_Ord_Status_PendingCancel      -> "6"
    | FIX_Ord_Status_Stopped            -> "7"
    | FIX_Ord_Status_Rejected           -> "8"
    | FIX_Ord_Status_Suspended          -> "9"
    | FIX_Ord_Status_PendingNew         -> "A"
    | FIX_Ord_Status_Calculated         -> "B"
    | FIX_Ord_Status_Expired            -> "C"
    | FIX_Ord_Status_AcceptedForBidding -> "D"
    | FIX_Ord_Status_PendingReplace     -> "E"
    | FIX_Ord_Status_Invalid            -> "Invalid"
;;

(** The opposite of above - notice that Invalid is mapped to all 
    incorrect strings *)
let string_to_ord_status = function
    | "0" -> FIX_Ord_Status_New
    | "1" -> FIX_Ord_Status_PartiallyFilled
    | "2" -> FIX_Ord_Status_Filled
    | "3" -> FIX_Ord_Status_DoneForDay
    | "4" -> FIX_Ord_Status_Canceled
    | "5" -> FIX_Ord_Status_Replaced
    | "6" -> FIX_Ord_Status_PendingCancel
    | "7" -> FIX_Ord_Status_Stopped
    | "8" -> FIX_Ord_Status_Rejected
    | "9" -> FIX_Ord_Status_Suspended
    | "A" -> FIX_Ord_Status_PendingNew
    | "B" -> FIX_Ord_Status_Calculated
    | "C" -> FIX_Ord_Status_Expired
    | "D" -> FIX_Ord_Status_AcceptedForBidding
    | "E" -> FIX_Ord_Status_PendingReplace
    | _   -> FIX_Ord_Status_Invalid
;;

(** Order types: http://www.onixs.biz/fix-dictionary/4.4/tagNum_40.html *)
let ord_type_to_string = function 
    | FIX_Ord_Type_Market                       -> "1"
    | FIX_Ord_Type_Limit                        -> "2"
    | FIX_Ord_Type_Stop                         -> "3"
    | FIX_Ord_Type_StopLimit                    -> "4"
    | FIX_Ord_Type_MarketOnClose                -> "5"
    | FIX_Ord_Type_WithOrWithout                -> "6"
    | FIX_Ord_Type_LimitOrBetter                -> "7"
    | FIX_Ord_Type_LimitWithOrWithout           -> "8"
    | FIX_Ord_Type_OnBasis                      -> "9"
    | FIX_Ord_Type_OnClose                      -> "A"
    | FIX_Ord_Type_LimitOnClose                 -> "B"
    | FIX_Ord_Type_ForexMarket                  -> "C"
    | FIX_Ord_Type_PreviouslyQuoted             -> "D"
    | FIX_Ord_Type_PreviouslyIndicated          -> "E"
    | FIX_Ord_Type_ForexLimit                   -> "F"
    | FIX_Ord_Type_ForexSwap                    -> "G"
    | FIX_Ord_Type_ForexPreviouslyQuoted        -> "H"
    | FIX_Ord_Type_Funari                       -> "I"
    | FIX_Ord_Type_MarketIfTouched              -> "J"
    | FIX_Ord_Type_MarketWithLeftOverAsLimit    -> "K"
    | FIX_Ord_Type_PreviousFundValuationPoint   -> "L"
    | FIX_Ord_Type_NextFundValuationPoint       -> "M"
    | FIX_Ord_Type_Pegged                       -> "P"
    | FIX_Ord_Type_Invalid                      -> "Invalid"
;;

let string_to_ord_type = function 
    | "1" -> FIX_Ord_Type_Market
    | "2" -> FIX_Ord_Type_Limit
    | "3" -> FIX_Ord_Type_Stop
    | "4" -> FIX_Ord_Type_StopLimit
    | "5" -> FIX_Ord_Type_MarketOnClose
    | "6" -> FIX_Ord_Type_WithOrWithout
    | "7" -> FIX_Ord_Type_LimitOrBetter
    | "8" -> FIX_Ord_Type_LimitWithOrWithout
    | "9" -> FIX_Ord_Type_OnBasis
    | "A" -> FIX_Ord_Type_OnClose
    | "B" -> FIX_Ord_Type_LimitOnClose
    | "C" -> FIX_Ord_Type_ForexMarket
    | "D" -> FIX_Ord_Type_PreviouslyQuoted
    | "E" -> FIX_Ord_Type_PreviouslyIndicated
    | "F" -> FIX_Ord_Type_ForexLimit
    | "G" -> FIX_Ord_Type_ForexSwap
    | "H" -> FIX_Ord_Type_ForexPreviouslyQuoted
    | "I" -> FIX_Ord_Type_Funari
    | "J" -> FIX_Ord_Type_MarketIfTouched
    | "K" -> FIX_Ord_Type_MarketWithLeftOverAsLimit
    | "L" -> FIX_Ord_Type_PreviousFundValuationPoint
    | "M" -> FIX_Ord_Type_NextFundValuationPoint
    | "P" -> FIX_Ord_Type_Pegged
    | _   -> FIX_Ord_Type_Invalid
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

let filter_nulls =
    List.filter (function ( _, `Null ) -> false | _ -> true )
;;

let header_to_json (fh : fix_header) : Yojson.Basic.json =
    let list_assoc = [
        ( "begin_string"               , `Int fh.begin_string                           );                        
        ( "body_length"                , `Int fh.body_length                            );
(*        ( "msg_type"                  , `Int fh.msg_type       ); *)
        ( "sender_comp_id"             , `Int fh.sender_comp_id                         );
        ( "target_comp_id"             , `Int fh.target_comp_id                         );
        ( "msg_seq_num"                , `Int fh.msg_seq_num                            );
                                       
        ( "on_behalf_of_comp_id"       , intopt_to_json fh.on_behalf_of_comp_id         );
        ( "deliver_to_comp_id"         , intopt_to_json fh.deliver_to_comp_id           );
        ( "secure_data_len"            , intopt_to_json fh.secure_data_len              );
        ( "secure_data"                , intopt_to_json fh.secure_data                  );
        ( "sender_sub_id"              , intopt_to_json fh.sender_sub_id                );
        ( "sender_location_id"         , intopt_to_json fh.sender_location_id           );
        ( "target_sub_id"              , intopt_to_json fh.target_sub_id                );
        ( "target_location_id"         , intopt_to_json fh.target_location_id           );
        ( "on_behalf_of_sub_id"        , intopt_to_json fh.on_behalf_of_sub_id          );
        ( "on_behalf_of_location_id"   , intopt_to_json fh.on_behalf_of_location_id     );
        ( "deliver_to_sub_id"          , intopt_to_json fh.deliver_to_sub_id            );
        ( "deliver_to_location_id"     , intopt_to_json fh.deliver_to_location_id       );   
        ( "poss_dup_flag"              , boolopt_to_json fh.poss_dup_flag               );
        ( "poss_resend"                , boolopt_to_json fh.poss_resend                 );             
        ( "sending_time"               , intopt_to_json fh.sending_time                 );
        ( "orig_sending_time"          , intopt_to_json fh.orig_sending_time            );
        ( "xml_data_len"               , intopt_to_json fh.xml_data_len                 );
        ( "xml_data"                   , intopt_to_json fh.xml_data                     );
        ( "message_enconding"          , intopt_to_json fh.message_enconding            );
        ( "last_msg_seq_num_processed" , intopt_to_json fh.last_msg_seq_num_processed   );
        ( "no_hops"                    , intopt_to_json fh.no_hops                      )
        ] |> filter_nulls
        in
    `Assoc list_assoc
;;

(** Basic Yes/No type *)
let yes_no_to_string = function
    | FIX_Yes                   -> "Y"
    | FIX_No                    -> "N"
    | FIX_YesNo_Invalid         -> "Invalid"
;;

let yes_no_opt_to_string = function
    | None -> None
    | Some y -> Some (yes_no_to_string y)
;;

let string_to_yes_no = function
    | "Y"                       -> FIX_Yes    
    | "N"                       -> FIX_No 
    | _                         -> FIX_YesNo_Invalid
;;

let priceopt_to_string p =
    match p with 
    | None                      -> None
    | Some k                    -> Some (Printf.sprintf "%.1d" k)
;;

let logon_data_to_json x =
    `Assoc [
        ( "encrypt_method",     `Int x.encrypt_method);
        ( "heartbeat_interval", `Int x.heartbeat_interval);
        ( "raw_data_length",    `Int x.raw_data_length)
    ]
;;

let logout_data_to_json x = 
    let list_assoc = [
        ( "encoded_text_len",   intopt_to_json x.encoded_text_len);
        ( "encoded_text",       intopt_to_json x.encoded_text)
    ] |> filter_nulls in 
    `Assoc list_assoc
;;

let heartbeat_data_to_json x = 
    let list_assoc = [
        ( "test_req_id",        intopt_to_json x.hb_test_req_id)
    ] |> filter_nulls in 
    `Assoc list_assoc
;;

let testrequest_data_to_json x = 
    `Assoc [
        ( "test_req_id",        `Int x.test_req_id)
    ]
;;

let resend_request_data_to_json x = 
    `Assoc [
        ( "begin_seq_num",      `Int x.begin_seq_num);
        ( "end_seq_num",        `Int x.end_seq_num)
    ]
;;

let session_reject_data_to_json x = 
    let list_assoc = [
        ( "ref_seq_num",        `Int x.sr_ref_seq_num);
        ( "session_reject_reason", stringopt_to_json (reject_reason_opt_to_string x.session_reject_reason))
    ] |> filter_nulls in 
    `Assoc list_assoc
;;

let business_reject_data_to_json x = 
    `Assoc [
        ( "br_ref_seq_num",     `Int x.br_ref_seq_num );
        ( "business_reject_reason", `String (fix_business_reject_to_string x.business_reject_reason ));
    ]
;;

let sequence_reset_data_to_json x = 
    let list_assoc = [
        ( "new_seq_no",         `Int x.new_seq_no);
        ( "gap_fill_flag",      stringopt_to_json ( yes_no_opt_to_string x.gap_fill_flag ));
    ] |> filter_nulls in
    `Assoc list_assoc
;;

let order_qty_block_to_json oq =
    let list_assoc = [
        ( "order_qty",          intopt_to_json oq.order_qty );
        ( "cash_order_qty",     intopt_to_json oq.cash_order_qty );
        ( "order_percent",      intopt_to_json oq.order_percent );
        ( "rounding_direction", intopt_to_json oq.rounding_direction );
        ( "rounding_modulus",   intopt_to_json oq.rounding_modulus );
    ] |> filter_nulls in 
    `Assoc list_assoc
;;

let create_order_data_to_json x = 
    let list_assoc = [
        ( "client_order_id",    `Int x.client_order_id );
        ( "side",               `String ( side_to_string x.side ));
        ( "order_qty_data",     order_qty_block_to_json x.order_qty_data );
        ( "order_type",         `String ( ord_type_to_string x.order_type ));
        ( "price_type",         stringopt_to_json ( price_type_opt_to_string x.price_type ));
        ( "price",              stringopt_to_json ( priceopt_to_string x.price ));
        ( "stop_px",            stringopt_to_json ( priceopt_to_string x.stop_px ));
    ] |> filter_nulls in
    `Assoc list_assoc
;;

let cancel_order_data_to_json x = 
    `Assoc [
        ( "order_id",           `Int x.cl_order_id)
    ]
;;

let trade_report_data_to_json x = 
    let list_assoc = [
        ( "trade_report_id",    `Int x.trade_report_id);
        ( "previously_reported",`String (yes_no_to_string x.previously_reported));
        ( "order_id",           `Int x.order_id);
        ( "filled_qty",         `Int x.filled_qty)
    ] |> filter_nulls in
    `Assoc list_assoc
;;

let msg_data_to_json = function
    | FIX_logon x ->            `Assoc [ ( "logon",             logon_data_to_json x) ]
    | FIX_logout x ->           `Assoc [ ( "logout",            logout_data_to_json x) ]
    | FIX_heartbeat x ->        `Assoc [ ( "heartbeat",         heartbeat_data_to_json x) ]
    | FIX_test_request x ->     `Assoc [ ( "test_request",      testrequest_data_to_json x) ]
    | FIX_resend_request x ->   `Assoc [ ( "resend_request",    resend_request_data_to_json x) ]
    | FIX_session_reject x ->   `Assoc [ ( "session_reject",    session_reject_data_to_json x) ]
    | FIX_sequence_reset x ->   `Assoc [ ( "sequence_rest",     sequence_reset_data_to_json x) ]
    | FIX_new_order_single x -> `Assoc [ ( "new_order_single",  create_order_data_to_json x) ]
    | FIX_cancel_order x ->     `Assoc [ ( "cancel_order",      cancel_order_data_to_json x) ]
    | FIX_trade_report_ae x ->  `Assoc [ ( "trade_report_ae",   trade_report_data_to_json x) ]
    | FIX_business_reject x ->  `Assoc [ ( "business_reject",   business_reject_data_to_json x)]
;;

(** Trailer to JSON conversion. *)
let trailer_to_json (t: fix_trailer) = 
    `Assoc [
        ( "signature_length",   `Int t.signature_length);
        ( "signature",          `Int t.signature);
        ( "check_sum",          `Int t.check_sum)
    ]
;;

(* Reject reasons *)
let reject_flags_to_json rf = 
    `Assoc [
        ( "garbled",            `Bool rf.garbled);
        ( "session_invalid",    stringopt_to_json (reject_reason_opt_to_string rf.session_invalid));
        ( "business_invalid",   stringopt_to_json (biz_reject_opt_to_string rf.business_invalid));
    ]
;;

let fix_msg_to_json ( m : fix_message) = 
    `Assoc [
        ( "header",             (header_to_json m.header));
        ( "data",               (msg_data_to_json m.msg_data));
        ( "trailer",            (trailer_to_json m.trailer));
        ( "reject_flags",       (reject_flags_to_json m.reject_flags));
    ]
;;

let fixmsg_opt_to_json : ( fix_message option -> Yojson.Basic.json) = 
    function None -> `Null | Some m -> fix_msg_to_json (m)
;;

(** This is used in a couple of places. *)
let msg_list_to_json ( msgs : fix_message list) = 
    `List (List.map fix_msg_to_json msgs)
;;

let fix_msg_to_str m =
    Yojson.Basic.pretty_to_string (fix_msg_to_json m)
;;

let msg_list_to_string (msgs : fix_message list) = 
    String.concat "\n" (List.map fix_msg_to_str msgs)
;;