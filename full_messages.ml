(** 

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    Contains implementation of the 'full' FIX messages.

    full_messages.ml
    
*)

(* @meta[imandra_ignore] on @end *)
open Basic_types;;
open Datetime;;
open Full_fix_fields;;
(* @meta[imandra_ignore] off @end *)

type full_fix_msg_new_order_single_data = {
    full_newOrderSingle_Account                     : fix_string option;
    full_newOrderSingle_ClOrdID                     : fix_string option;
    full_newOrderSingle_OrigClOrdID                 : fix_string option;
    full_newOrderSingle_ExecInst                    : fix_execinst option;
    full_newOrderSingle_HandlInst                   : fix_handlinst option;
    full_newOrderSingle_TransactTime                : fix_utctimestamp option;
    full_newOrderSingle_Symbol                      : fix_string option;
    full_newOrderSingle_SymbolSfx                   : fix_string option;
    full_newOrderSingle_Side                        : fix_side option;
    full_newOrderSingle_OrderQty                    : fix_float option;
    full_newOrderSingle_OrdType                     : fix_ordertype option;
    full_newOrderSingle_Price                       : fix_float option;
    full_newOrderSingle_MinQty                      : fix_float option;
    full_newOrderSingle_TimeInForce                 : fix_timeinforce option;
    full_newOrderSingle_LocateReqd                  : fix_bool option;
    full_newOrderSingle_LocateBroker                : fix_string option;
    full_newOrderSingle_Currency                    : fix_currency option;
}
;;

let init_full_fix_msg_new_order_single_data = {
    full_newOrderSingle_Account                     = None;
    full_newOrderSingle_ClOrdID                     = None;
    full_newOrderSingle_OrigClOrdID                 = None;
    full_newOrderSingle_ExecInst                    = None;
    full_newOrderSingle_HandlInst                   = None;
    full_newOrderSingle_TransactTime                = None;
    full_newOrderSingle_Symbol                      = None;
    full_newOrderSingle_SymbolSfx                   = None;
    full_newOrderSingle_Side                        = None;
    full_newOrderSingle_OrderQty                    = None;
    full_newOrderSingle_OrdType                     = None;
    full_newOrderSingle_Price                       = None;
    full_newOrderSingle_MinQty                      = None;
    full_newOrderSingle_TimeInForce                 = None;
    full_newOrderSingle_LocateReqd                  = None;
    full_newOrderSingle_LocateBroker                = None;
    full_newOrderSingle_Currency                    = None;
}
;;

type full_fix_msg_order_cancel_replace_request_data = {
    full_orderCancelReplaceRequest_Account          : fix_string option;
    full_orderCancelReplaceRequest_ClOrdID          : fix_string option;
    full_orderCancelReplaceRequest_HandlInst        : fix_handlinst option;
    full_orderCancelReplaceRequest_OrigClOrdID      : fix_string option;
    full_orderCancelReplaceRequest_ExecInst         : fix_execinst option;
    full_orderCancelReplaceRequest_TransactTime     : fix_utctimestamp option;
    full_orderCancelReplaceRequest_Symbol           : fix_symbol option;
    full_orderCancelReplaceRequest_SymbolSfx        : fix_string option;
    full_orderCancelReplaceRequest_Side             : fix_side option;
    full_orderCancelReplaceRequest_OrderQty         : fix_float option;
    full_orderCancelReplaceRequest_OrdType          : fix_ordertype option;
    full_orderCancelReplaceRequest_Price            : fix_float option;
    full_orderCancelReplaceRequest_MinQty           : fix_float option;
    full_orderCancelReplaceRequest_TimeInForce      : fix_timeinforce option;
    full_orderCancelReplaceRequest_LocateReqd       : fix_bool option;
    full_orderCancelReplaceRequest_LocateBroker     : fix_string option;
}
;;

let init_fix_msg_ordercancel_replacerequest_data = {
    full_orderCancelReplaceRequest_Account           = None;
    full_orderCancelReplaceRequest_ClOrdID           = None;
    full_orderCancelReplaceRequest_HandlInst         = None;
    full_orderCancelReplaceRequest_OrigClOrdID       = None;
    full_orderCancelReplaceRequest_ExecInst          = None;
    full_orderCancelReplaceRequest_TransactTime      = None;
    full_orderCancelReplaceRequest_Symbol            = None;
    full_orderCancelReplaceRequest_SymbolSfx         = None;
    full_orderCancelReplaceRequest_Side              = None;
    full_orderCancelReplaceRequest_OrderQty          = None;
    full_orderCancelReplaceRequest_OrdType           = None;
    full_orderCancelReplaceRequest_Price             = None;
    full_orderCancelReplaceRequest_MinQty            = None;
    full_orderCancelReplaceRequest_TimeInForce       = None;
    full_orderCancelReplaceRequest_LocateReqd        = None;
    full_orderCancelReplaceRequest_LocateBroker      = None;
}
;;

(* Request to cancel an order *)
type full_fix_msg_order_cancel_request_data = {
    full_orderCancelRequest_ClOrdID                  : fix_string option;
    full_orderCancelRequest_OrigClOrdID              : fix_string option;
    full_orderCancelRequest_OrderID                  : fix_string option;
    full_orderCancelRequest_TransactTime             : fix_string option;
    full_orderCancelRequest_Symbol                   : fix_symbol option;
    full_orderCancelRequest_SymbolSfx                : fix_symbol option;
    full_orderCancelRequest_Side                     : fix_side option;
}
;;

let init_fix_msg_order_cancel_request_data = {
    full_orderCancelRequest_ClOrdID                  = None;
    full_orderCancelRequest_OrigClOrdID              = None;
    full_orderCancelRequest_OrderID                  = None;
    full_orderCancelRequest_TransactTime             = None;
    full_orderCancelRequest_Symbol                   = None;
    full_orderCancelRequest_SymbolSfx                = None;
    full_orderCancelRequest_Side                     = None;
}
;;

(* For rejecting orders. *)
type full_fix_msg_cancel_reject_data = {
    full_cancelReject_Account                        : fix_string option;
    full_cancelReject_ClOrdID                        : fix_string option;
    full_cancelReject_OrigClOrdID                    : fix_string option;
    full_cancelReject_OrderID                        : fix_string option;
    full_cancelReject_OrdStatus                      : fix_ordstatus option;
    full_cancelReject_CxlRejReason                   : fix_string option;
    full_cancelReject_Text                           : fix_string option;
}
;;

let init_fix_msg_CancelReject_data = {
    full_cancelReject_Account                        = None;
    full_cancelReject_ClOrdID                        = None;
    full_cancelReject_OrigClOrdID                    = None;
    full_cancelReject_OrderID                        = None;
    full_cancelReject_OrdStatus                      = None;
    full_cancelReject_CxlRejReason                   = None;
    full_cancelReject_Text                           = None;
}
;;

(* Is used to send out non cancellation-rejections, etc... *)
type full_fix_msg_execution_report_data = {
    full_executionReport_OrderID                     : fix_string option;
    full_executionReport_ClOrdID                     : fix_string option;
    full_executionReport_ExecType                    : fix_exectype option;  (* Custom enum that we have *)
    full_executionReport_ExecID                      : fix_string option;
    full_executionReport_Account                     : fix_string option;
    full_executionReport_Side                        : fix_side option; 
    full_executionReport_OrdType                     : fix_ordertype option;
    full_executionReport_OrdStatus                   : fix_ordstatus option;
    full_executionReport_AvgPx                       : fix_float option;
    full_executionReport_LeavesQty                   : fix_float option;
    full_executionReport_CumQty                      : fix_float option;
}
;;

let init_fix_msg_execution_report_data = {
    full_executionReport_OrderID                     = None;
    full_executionReport_ClOrdID                     = None;
    full_executionReport_ExecType                    = None;
    full_executionReport_ExecID                      = None;
    full_executionReport_Account                     = None;
    full_executionReport_Side                        = None;
    full_executionReport_OrdType                     = None;
    full_executionReport_OrdStatus                   = None;
    full_executionReport_AvgPx                       = None;
    full_executionReport_LeavesQty                   = None;
    full_executionReport_CumQty                      = None;
}
;;

(* Global type with all of the messages. *)
type full_fix_app_msg = 
    | Full_Msg_ExecutionReport                       of full_fix_msg_execution_report_data
    | Full_Msg_OrderCancelRequest                    of full_fix_msg_order_cancel_request_data
    | Full_Msg_OrderCancelReplaceRequest             of full_fix_msg_order_cancel_replace_request_data
    | Full_Msg_NewOrderSingle                        of full_fix_msg_new_order_single_data
    | Full_Msg_CancelReject                          of full_fix_msg_cancel_reject_data                           
;;

type full_fix_admin_msg = 
    | Full_Msg_Hearbeat                              of full_fix_msg_heartbeat_data
    | Full_Msg_Logon                                 of full_fix_msg_logon_data
    | Full_Msg_Logoff                                of full_fix_msg_logoff_data
    | Full_Msg_Session_Reject                        of full_fix_msg_session_reject_data
    | Full_Msg_Business_Reject                       of full_fix_msg_business_reject_data
    | Full_Msg_Resend_Request                        of full_fix_msg_resend_request_data
    | Full_Msg_Sequence_Reset                        of full_fix_msg_sequence_reset_data
    | Full_Msg_Test_Request                          of full_fix_msg_test_request_data
;;

(** Message tags - a way for us to identify messages without their full data. *)
type full_fix_msg_tag = 
    | Full_Msg_ExecutionReport_Tag
    | Full_Msg_OrderCancelRequest_Tag
    | Full_Msg_OrderCancelReplaceRequest_Tag
    | Full_Msg_NewOrderSingle_Tag
    | Full_Msg_CancelReject_Tag
;;

(** Contains the missing field information. *)
type full_field_missing_data = {
    field_missing_field                             : full_fix_field;
    field_missing_msg                               : full_fix_msg_tag;
}
;;

(** Contains the complete fix. *)
type full_top_level_msg = 
    | ValidAdminMsg                                 of full_fix_admin_msg
    | ValidAppMsg                                   of full_fix_app_msg
    | ReqFieldMissing                               of full_field_missing_data
   (* | InvalidField                                  of full_fix_msg *)
    | UnsupportedByApp                              of full_fix_app_msg
    | Gargled
;;
