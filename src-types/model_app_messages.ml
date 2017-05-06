(** Model application message types. *)
(***

    Aesthetic Integration Limited
    Copyright 2014 - 2017


    model_messages.ml

*)

(* @meta[imandra_ignore] on @end *)
open Base_types;;
open Datetime;;
open Numeric;;
open Full_app_enums;;
open Full_app_tags;;
(* @meta[imandra_ignore] off @end *)

(** All of these types are generated based on the model.

    opt Account
    req ClOrdID
    req HandlInst
    req OrigClOrdID
    opt ExecInst
    req TransactTime        
    req Symbol
    opt SymbolSfx
    req Side
    req OrderQty
    req OrdType
    opt Price
    opt MinQty
    req TimeInForce
    req LocateReqd
    opt LocateBroker
*)

type fix_msg_new_order_single_data = {
    newOrderSingle_Account                      : fix_string option;
    newOrderSingle_ClOrdID                      : fix_string;
    newOrderSingle_OrigClOrdID                  : fix_string;
    newOrderSingle_ExecInst                     : fix_execinst option;
    newOrderSingle_HandlInst                    : fix_handlinst;
    newOrderSingle_TransactTime                 : fix_utctimestamp;
    newOrderSingle_Symbol                       : fix_string;
    newOrderSingle_SymbolSfx                    : fix_string option;
    newOrderSingle_Side                         : fix_side;
    newOrderSingle_OrderQty                     : fix_float;
    newOrderSingle_OrdType                      : fix_ordertype;
    newOrderSingle_Price                        : fix_float option;
    newOrderSingle_MinQty                       : fix_float option;
    newOrderSingle_TimeInForce                  : fix_timeinforce;
    newOrderSingle_LocateReqd                   : bool;
    newOrderSingle_LocateBroker                 : fix_string option;
    newOrderSingle_Currency                     : fix_currency option;
}
;;

(** Initialise this with default values from the message declaration. *)
let init_fix_msg_new_order_single_data = {
    newOrderSingle_Account                      = None;
    newOrderSingle_ClOrdID                      = 0;
    newOrderSingle_OrigClOrdID                  = 0;
    newOrderSingle_ExecInst                     = Some FIX_ExecInst_MidpointPeg;
    newOrderSingle_HandlInst                    = FIX_HandlInst_Manual;
    newOrderSingle_TransactTime                 = { utc_timestamp_year      = 2017;
                                                    utc_timestamp_month     = 1;
                                                    utc_timestamp_day       = 1;
                                                    utc_timestamp_hour      = 8;
                                                    utc_timestamp_minute    = 0;
                                                    utc_timestamp_second    = 0;
                                                    utc_timestamp_millisec  = None; };
    newOrderSingle_Symbol                       = 0;
    newOrderSingle_SymbolSfx                    = None;
    newOrderSingle_Side                         = FIX_Side_Buy;
    newOrderSingle_OrderQty                     = Float_0 { fix_float_whole = 0; fix_float_fraction = 0 };
    newOrderSingle_OrdType                      = FIX_Ord_Type_Limit;
    newOrderSingle_Price                        = None;
    newOrderSingle_MinQty                       = None;
    newOrderSingle_TimeInForce                  = FIX_TimeInForce_Day;
    newOrderSingle_LocateReqd                   = false;
    newOrderSingle_LocateBroker                 = None;
    newOrderSingle_Currency                     = None;
}
;;

(* Request to Cancel/Replace an order. 

    opt Account
    req ClOrdID
    req HandlInst
    req OrigClOrdID
    opt ExecInst            valid when it in [ MidpointPeg, MarketPeg, PrimaryPeg ], default = MidpointPeg
    req TransactTime        
    req Symbol
    opt SymbolSfx
    req Side                valid when it in [ Buy, Sell, SellShort ]
    req OrderQty
    req OrdType
    opt Price               valid when it > Price (0.0)
    opt MinQty              valid when it >= Qty (0.0)
    req TimeInForce         valid when it in [ DAY, IOC ]
    req LocateReqd
    opt LocateBroker
*)
type fix_msg_order_cancel_replace_request_data = {
    orderCancelReplaceRequest_Account           : fix_string option;
    orderCancelReplaceRequest_ClOrdID           : fix_string;
    orderCancelReplaceRequest_HandlInst         : fix_handlinst;
    orderCancelReplaceRequest_OrigClOrdID       : fix_string;
    orderCancelReplaceRequest_ExecInst          : fix_execinst option;
    orderCancelReplaceRequest_TransactTime      : fix_utctimestamp;
    orderCancelReplaceRequest_Symbol            : fix_symbol;
    orderCancelReplaceRequest_SymbolSfx         : fix_string option;
    orderCancelReplaceRequest_Side              : fix_side;
    orderCancelReplaceRequest_OrderQty          : fix_float;
    orderCancelReplaceRequest_OrdType           : fix_ordertype;
    orderCancelReplaceRequest_Price             : fix_float option;
    orderCancelReplaceRequest_MinQty            : fix_float option;
    orderCancelReplaceRequest_TimeInForce       : fix_timeinforce;
    orderCancelReplaceRequest_LocateReqd        : bool;
    orderCancelReplaceRequest_LocateBroker      : fix_string option;
};;

let init_fix_msg_ordercancel_replacerequest_data = {
    orderCancelReplaceRequest_Account           = None;
    orderCancelReplaceRequest_ClOrdID           = 0;
    orderCancelReplaceRequest_HandlInst         = FIX_HandlInst_Manual;
    orderCancelReplaceRequest_OrigClOrdID       = 0;
    orderCancelReplaceRequest_ExecInst          = None;
    orderCancelReplaceRequest_TransactTime      = { utc_timestamp_year      = 2017;
                                                    utc_timestamp_month     = 1;
                                                    utc_timestamp_day       = 1;
                                                    utc_timestamp_hour      = 8;
                                                    utc_timestamp_minute    = 0;
                                                    utc_timestamp_second    = 0;
                                                    utc_timestamp_millisec  = None; };
    orderCancelReplaceRequest_Symbol            = 0;
    orderCancelReplaceRequest_SymbolSfx         = None;
    orderCancelReplaceRequest_Side              = FIX_Side_Buy;
    orderCancelReplaceRequest_OrderQty          = Float_0 { fix_float_whole = 0; fix_float_fraction = 0 };
    orderCancelReplaceRequest_OrdType           = FIX_Ord_Type_Limit;
    orderCancelReplaceRequest_Price             = None;
    orderCancelReplaceRequest_MinQty            = None;
    orderCancelReplaceRequest_TimeInForce       = FIX_TimeInForce_Day;
    orderCancelReplaceRequest_LocateReqd        = false;
    orderCancelReplaceRequest_LocateBroker      = None;
}
;;

(* Request to cancel an order *)
type fix_msg_order_cancel_request_data = {
    orderCancelRequest_ClOrdID                  : fix_string option;
    orderCancelRequest_OrigClOrdID              : fix_string option;
    orderCancelRequest_OrderID                  : fix_string option;
    orderCancelRequest_TransactTime             : fix_utctimestamp option;
    orderCancelRequest_Symbol                   : fix_symbol option;
    orderCancelRequest_SymbolSfx                : fix_symbol option;
    orderCancelRequest_Side                     : fix_side option;
}
;;

let init_fix_msg_order_cancel_request_data = {
    orderCancelRequest_ClOrdID                  = None;
    orderCancelRequest_OrigClOrdID              = None;
    orderCancelRequest_OrderID                  = None;
    orderCancelRequest_TransactTime             = None;
    orderCancelRequest_Symbol                   = None;
    orderCancelRequest_SymbolSfx                = None;
    orderCancelRequest_Side                     = None;
}
;;

(* For rejecting orders. *)
type fix_msg_cancel_reject_data = {
    cancelReject_Account                        : fix_string option;
    cancelReject_ClOrdID                        : fix_string option;
    cancelReject_OrigClOrdID                    : fix_string option;
    cancelReject_OrderID                        : fix_string option;
    cancelReject_OrdStatus                      : fix_ordstatus option;
    cancelReject_CxlRejReason                   : fix_string option;
    cancelReject_Text                           : fix_string option;
}
;;

let init_fix_msg_cancelreject_data = {
    cancelReject_Account                        = None;
    cancelReject_ClOrdID                        = None;
    cancelReject_OrigClOrdID                    = None;
    cancelReject_OrderID                        = None;
    cancelReject_OrdStatus                      = None;
    cancelReject_CxlRejReason                   = None;
    cancelReject_Text                           = None;
}
;;

(* Is used to send out non cancellation-rejections, etc... *)
type fix_msg_execution_report_data = {
    executionReport_OrderID                     : fix_string option;
    executionReport_ClOrdID                     : fix_string option;
    executionReport_ExecType                    : fix_exectype option;  (* Custom enum that we have *)
    executionReport_ExecID                      : fix_string option;
    executionReport_Account                     : fix_string option;
    executionReport_Side                        : fix_side option; 
    executionReport_OrdType                     : fix_ordertype option;
    executionReport_OrdStatus                   : fix_ordstatus option;
    executionReport_AvgPx                       : fix_float option;
    executionReport_LeavesQty                   : fix_float option;
    executionReport_CumQty                      : fix_float option;
}
;;

let init_fix_msg_execution_report_data = {
    executionReport_OrderID                     = None;
    executionReport_ClOrdID                     = None;
    executionReport_ExecType                    = None;
    executionReport_ExecID                      = None;
    executionReport_Account                     = None;
    executionReport_Side                        = None;
    executionReport_OrdType                     = None;
    executionReport_OrdStatus                   = None;
    executionReport_AvgPx                       = None;
    executionReport_LeavesQty                   = None;
    executionReport_CumQty                      = None;
}
;;

(* Global type with all of the messages. *)
type fix_msg = 
    | ExecutionReport                           of fix_msg_execution_report_data
    | OrderCancelRequest                        of fix_msg_order_cancel_request_data
    | OrderCancelReplaceRequest                 of fix_msg_order_cancel_replace_request_data
    | NewOrderSingle                            of fix_msg_new_order_single_data
    | CancelReject                              of fix_msg_cancel_reject_data
;;

type fix_msg_tag = 
    | ExecutionReport_Tag
    | OrderCancelRequest_Tag
    | OrderCancelReplaceRequest_Tag
    | NewOrderSingle_Tag
    | CancelReject_Tag
;;

(** End of autogenerated code *)

type custom_reject_strings = 
    | CustomReject_NewOrderSingle_1
    | CustomReject_NewOrderSingle_2
    | CustomReject_NewOrderSingle_3
    | CustomReject_OrderCancelReplaceRequest_1
    | CustomReject_OrderCancelReplaceRequest_2
    | CustomReject_OrderCancelReplaceRequest_3
    | CustomReject_OrderCancelRequest_1
;;

let get_custom_reject_str ( s : custom_reject_strings ) =
    match s with 
    | CustomReject_NewOrderSingle_1                 -> 1
    | CustomReject_NewOrderSingle_2                 -> 2
    | CustomReject_NewOrderSingle_3                 -> 3
    | CustomReject_OrderCancelReplaceRequest_1      -> 4
    | CustomReject_OrderCancelReplaceRequest_2      -> 5
    | CustomReject_OrderCancelReplaceRequest_3      -> 6
    | CustomReject_OrderCancelRequest_1             -> 7
;;

type field_missing_data = {
    field_missing_data_field                        : full_app_field_tag;
    field_missing_data_msg                          : full_app_msg_tag;
}
;;

type fix_top_level_msg =
    | FIX_TL_Normal                                 of fix_msg
    | FIX_TL_Req_Field_Missing                      of field_missing_data
;;
