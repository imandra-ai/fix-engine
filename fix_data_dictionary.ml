(** 

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    Implementation of the FIX 4.4 protocol. Contains FIX data dictionary.

    fix_data_dictionary.ml
*)

(* @meta[imandra_ignore] on @end *)
open Datetime;;
(* @meta[imandra_ignore] off @end *)

(** Need to finish the custom string type. *)
type fix_string = int;;
type fix_price  = int;; (** Need to create a custom type *)
type fix_yes_no_type = 
    | FIX_Yes 
    | FIX_No 
    | FIX_YesNo_Invalid
;;

(** Tag 423: http://www.onixs.biz/fix-dictionary/4.4/tagNum_423.html *)
type fix_price_type = 
    | FIX_Price_Percentage
    | FIX_Price_PerUnit 
    | FIX_Price_FixedAmount
    | FIX_Price_Discount
    | FIX_Price_Premium
    | FIX_Price_Spread
    | FIX_Price_TEDPrice
    | FIX_Price_TEDYield
    | FIX_Price_Yield
    | FIX_Price_Invalid
;;

(** Tag 54: http://www.onixs.biz/fix-dictionary/4.4/tagNum_54.html *)
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
    | FIX_Side_Invalid
;;

(** Tag 39: http://www.onixs.biz/fix-dictionary/4.4/tagNum_39.html *)
type fix_order_status = 
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
    | FIX_Ord_Status_Invalid
;;

type fix_order_type = 
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
    | FIX_Ord_Type_Invalid
;;


(** Session rejection reasons *)
type fix_session_reject_reason =
    | InvalidTagNumber
    | RequiredTagMissing
    | TagNotDefined
    | UndefinedTag
    | TagSecifiedWithoutAValue
    | ValueIsIncorrect
    | IncorrectDataFormatForValue
    | DecryptionProblem
    | SignatureProblem
    | CompIDProblem
    | SendingTimeAccuracyProblem
    | InvalidMsgType
    | XMLValidationError
    | TagAppearsMoreThanOnce
    | TagSpecifiedOutOfRequiredOrder
    | RepeatingGroupFieldsOutOfOrder
    | IncorrectNumInGroupCountForRepeatingGroup
    | NonDataValueIncludesFieldDelimiter
;;

(* Business rejection reasons *)
type fix_business_reject_reason = 
    | ApplicationDown
    | MessageTypeNotSupported
    | FieldMissing
;;

(** Standard FIX header. 
    Note that the standard header has tag Tag 35 that is the 
    message type. We do not need this tag as message type is 
    explicit. *)
type fix_header = {
    begin_string                    : int;          (* Tag 8    *)
    body_length                     : int;          (* Tag 9    *)
    sender_comp_id                  : int;          (* Tag 49   *)
    target_comp_id                  : int;          (* Tag 56   *)
    msg_seq_num                     : int;          (* Tag 34   *)

    on_behalf_of_comp_id            : int option;   (* Tag 115  *)
    deliver_to_comp_id              : int option;   (* Tag 128  *)
    secure_data_len                 : int option;   (* Tag 90   *)
    secure_data                     : int option;   (* Tag 91   *)
    sender_sub_id                   : int option;   (* Tag 50   *)
    sender_location_id              : int option;   (* Tag 142  *)
    target_sub_id                   : int option;   (* Tag 57   *)
    target_location_id              : int option;   (* Tag 143  *)
    on_behalf_of_sub_id             : int option;   (* Tag 116  *)
    on_behalf_of_location_id        : int option;   (* Tag 114  *)
    deliver_to_sub_id               : int option;   (* Tag 129  *)
    deliver_to_location_id          : int option;   (* Tag 145  *)
    poss_dup_flag                   : bool option;  (* Tag 43   *)
    poss_resend                     : bool option;  (* Tag 97   *)
    sending_time                    : int option;   (* Tag 52   *)
    orig_sending_time               : int option;   (* Tag 122  *)
    xml_data_len                    : int option;   (* Tag 212  *)
    xml_data                        : int option;   (* Tag 213  *)
    message_enconding               : int option;   (* Tag 347  *)
    last_msg_seq_num_processed      : int option;   (* Tag 369  *)
    no_hops                         : int option;   (* Tag 627  *)
}
;;

let default_fix_header = {
    begin_string                    = 0;
    body_length                     = 0;
    msg_seq_num                     = 0;
    poss_dup_flag                   = None;
    target_comp_id                  = 0;
    sender_comp_id                  = 0;
    on_behalf_of_comp_id            = None;
    deliver_to_comp_id              = None;
    secure_data_len                 = None;
    secure_data                     = None;
    sender_sub_id                   = None;
    sender_location_id              = None;
    target_sub_id                   = None;
    target_location_id              = None;
    on_behalf_of_sub_id             = None;
    on_behalf_of_location_id        = None;
    deliver_to_sub_id               = None;
    deliver_to_location_id          = None;
    poss_resend                     = None;
    sending_time                    = None;
    orig_sending_time               = None;
    xml_data_len                    = None;
    xml_data                        = None;
    message_enconding               = None;
    last_msg_seq_num_processed      = None;
    no_hops                         = None;
}
;;

(** Standard FIX trailer *)
type fix_trailer = {
    signature_length                : int;  (* Tag 93: Signature Length *)
    signature                       : int;  (* Tag 89: Signature text *)
    check_sum                       : int;  (* Tag 10: TODO: need to  *)
}
;;

let default_fix_trailer = {
    signature_length                = 0;
    signature                       = 0;
    check_sum                       = 0;
}
;;

(**  Common Component Blocks - used in various Application Messages *)
type fix_order_qty_block = {
    order_qty                       : int option;
    cash_order_qty                  : int option;
    order_percent                   : int option;
    rounding_direction              : int option;
    rounding_modulus                : int option;
}
;;

(** At least one of the first 3 fields must be specified. *)
let is_order_block_valid b = 
    match b.order_qty, b.cash_order_qty, b.order_percent with 
    | None, None, None -> false
    | _                -> true
;;

(** <Instrument> component block: http://www.onixs.biz/fix-dictionary/4.4/compBlock_Instrument.html 

    Note: this is a good example for blocks -> these may be used by many different 
    application message types -> each one may require different fields to be set. *)
type fix_instrument_block = {
    symbol                          : int option;   (* Tag 55 *)
    symbol_sfx                      : int option;   (* Tag 65 *)
    security_id                     : int option;   (* Tag 48 *)
    security_id_source              : int option;   (* Tag 22 *)
    no_security_alt_id              : int option;   (* Tag 454 *)
    security_alt_id                 : int option;   (* Tag 455 *)
    security_alt_id_source          : int option;   (* Tag 456 *)
    product                         : int option;   (* Tag 460 *)
    cfi_code                        : int option;   (* Tag 461 *)
    security_type                   : int option;   (* Tag 167 *)
    security_sub_type               : int option;   (* Tag 762 *)
    maturity_month_year             : int option;   (* Tag 200 *)
    maturity_date                   : int option;   (* Tag 541 *)
    coupon_payment_date             : int option;   (* Tag 224 *)
    issue_date                      : int option;   (* Tag 225 *)
    repo_collateral_security_type   : int option;   (* Tag 239 *)
    repurchase_term                 : int option;   (* Tag 226 *)
    repurchase_rate                 : int option;   (* Tag 227 *)
    factor                          : int option;   (* Tag 228 *)
    (** TODO finish this! *)
}
;;

(** CommType: Tag 13 -  http://www.onixs.biz/fix-dictionary/4.4/tagNum_13.html *)
type fix_comm_type = 
    | FIX_CommType_PerUnit
    | FIX_CommType_Percentage
    | FIX_CommType_Absolute
    | FIX_CommType_CashDiscount
    | FIX_CommType_EnhancedUnits
;;

(** <CommissionData> component block - http://www.onixs.biz/fix-dictionary/4.4/compBlock_CommissionData.html *)
type fix_commission_data_block = {
    commission                      : int option;               (* Tag 12 *)
    comm_type                       : fix_comm_type option;     (* Tag 13 *)
    comm_currency                   : int option;               (* Tag 479 *)
    fund_renew_waiv                 : fix_yes_no_type option;   (* Tag 497 *)
}
;;

(* Logon message *)
type logon_data = {
    encrypt_method                  : int;                      (* Tag 98 *)
    heartbeat_interval              : fix_duration;             (* Tag 108 *)
    raw_data_length                 : int;                      (* Tag 95 *)
};;

(** Logout message *)
type logout_data = {
    encoded_text_len                : int option;               (* Tag 354 *)
    encoded_text                    : fix_string option;        (* Tag 355 *)
}
;;

(** Heartbeat *)
type heartbeat_data = {
    hb_test_req_id                  : int option;               (* Tag 112: Required when the heartbeat is the result of a Test Request message. *)
}
;;

(** Test request_data *)
type testrequest_data = {
    test_req_id                     : int;                      (* Tag 112 *)
}
;;

(** Resend request data *)
type resendrequest_data = {
    begin_seq_num                   : int;                      (* Tag 7 *)
    end_seq_num                     : int;                      (* Tag 16 *)
}
;;

(** Session reject data *)
type session_reject_data = {
    sr_ref_seq_num                  : int;  (* Tag 45. MsgSeqNum of rejected message *)
    session_reject_reason           : fix_session_reject_reason option; (* Tag 373.  *)
}
;;

(** Sequence reset data. Note that gap_fill_flag is set as Yes/No type for appropriate printing. *)
type sequence_reset_data = {
    new_seq_no                      : int;                      (* Tag 36 *)
    gap_fill_flag                   : fix_yes_no_type option;   (* Tag 123 *)
}
;;

(** Creating new order: http://www.onixs.biz/fix-dictionary/4.4/msgType_D_68.html *)
type new_order_single_data = {
    client_order_id : int;                              (* Tag 11 *)

    side                            : fix_side;                         (* Tag 54 *)
    order_qty_data                  : fix_order_qty_block;              (* See fix_order_qty_block *)
    order_type                      : fix_order_type;                   (* Tag 40 *)
    price_type                      : fix_price_type option;            (* Tag 423 *)
    price                           : fix_price option;                 (* Tag 44 *)
    stop_px                         : fix_price option;                 (* Tag 99 *)

}
;;

(** Cancel order *)
type cancel_order_data = {
    cl_order_id                     : int;
}
;;


(** Trade Capture Report <AE> *)
type tradereport_ae_data = {
    trade_report_id                 : int;              (* Tag 571 *)
    previously_reported             : fix_yes_no_type;  (* Tag 570 *)

    order_id                        : int;
    filled_qty                      : int;
};;

(** Business Reject Message <j> *)
type business_reject_data = {
    br_ref_seq_num                  : int;              (* Tag 45: reference seq number of the rejected message *)
    (* TODO Need to add message type here as well. *)
    business_reject_reason          : fix_business_reject_reason;
};;

(** This is just a small subset -> we would want to cover the full spec, 
    it would need to be auto-generated. *)
type fix_msg_data = 
    | FIX_logon                     of logon_data               (* MsgType = A *)
    | FIX_logout                    of logout_data              (* MsgType = 5 *)
    | FIX_heartbeat                 of heartbeat_data           (* MsgType = 0 *)
    | FIX_test_request              of testrequest_data         (* MsgType = 1 *)
    | FIX_resend_request            of resendrequest_data       (* MsgType = 2 *)
    | FIX_session_reject            of session_reject_data      (* MsgType = 3 *)
    | FIX_sequence_reset            of sequence_reset_data      (* MsgType = 4 *)
    | FIX_new_order_single          of new_order_single_data    (* MsgType = D *)
    | FIX_cancel_order              of cancel_order_data        (* MsgType = ? *)
    | FIX_trade_report_ae           of tradereport_ae_data      (* MsgType = AE *)
    | FIX_business_reject           of business_reject_data     (* MsgType = j *)
;;

(** TODO We need to incorporate more precise information here. *)
type fix_reject_flags = {
    garbled                         : bool;
    session_invalid                 : fix_session_reject_reason option;
    business_invalid                : fix_business_reject_reason option;
}
;;

(** When nothing's rejected... *)
let default_reject_flags = {
    garbled                         = false;
    session_invalid                 = None;
    business_invalid                = None;
}
;;

type fix_message = {
    header                          : fix_header;
    msg_data                        : fix_msg_data;
    trailer                         : fix_trailer;
}
;;

let fix_is_msg_session_invalid m =
    match m.reject_flags.session_invalid with 
    | None -> false
    | Some _ -> true
;;

let fix_is_msg_biz_invalid m = 
    match m.reject_flags.business_invalid with
    | None -> false
    | Some _ -> true
;;

(* Does not apply to custom message rejections! *)
let fix_msg_base_not_rejected m = 
    not (m.reject_flags.garbled) && 
    fix_is_msg_session_invalid m &&
    fix_is_msg_biz_invalid m
;;

(* Is this an administrative message? (vs application-level) *)
let fix_is_admin_msg (m_data : fix_msg_data) =
    match m_data with 
        | FIX_logon  _              -> true          
        | FIX_logout  _             -> true
        | FIX_heartbeat _           -> true
        | FIX_test_request _        -> true
        | FIX_session_reject _      -> true
        | FIX_sequence_reset _      -> true
        | _                         -> false
;;

(** This is used when   *)
let fix_is_msg_reject (m_data : fix_msg_data) = 
    match m_data with 
        | FIX_session_reject _      -> true
        | _                         -> false
;;
