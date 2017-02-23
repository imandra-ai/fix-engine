(** 

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    Conversion b/w different types.

    type_convert.ml

*)

(* @meta[imandra_ignore] on @end *)
open Basic_types;;
open Datetime;;
open Fix_fields;;
open Model_messages;;
open Full_messages;;
(* @meta[imandra_ignore] off @end *)

let convert_FullNewOrderSingle ( m : full_fix_msg_new_order_single_data ) =

    match m.full_newOrderSingle_ClOrdID with 
    | None      -> FIX_TL_Req_Field_Missing { field_missing_data_msg = NewOrderSingle_Tag; field_missing_data_field = FIX_Field_ClOrdID_Tag }
    | Some x    -> 
    let c_clrordid = x in

    match m.full_newOrderSingle_OrigClOrdID with 
    | None      -> FIX_TL_Req_Field_Missing { field_missing_data_msg = NewOrderSingle_Tag; field_missing_data_field = FIX_Field_OrigClOrdID_Tag }
    | Some x    -> 
    let c_origclordid = x in

    match m.full_newOrderSingle_HandlInst with
    | None      -> FIX_TL_Req_Field_Missing { field_missing_data_msg = NewOrderSingle_Tag; field_missing_data_field = FIX_Field_HandlInst_Tag }
    | Some x    -> 
    let c_handleinst = x in 

    match m.full_newOrderSingle_TransactTime with
    | None      -> FIX_TL_Req_Field_Missing { field_missing_data_msg = NewOrderSingle_Tag; field_missing_data_field = FIX_Field_TransactTime_Tag } 
    | Some x    -> 
    let c_transacttime = x in

    match m.full_newOrderSingle_Symbol with 
    | None      -> FIX_TL_Req_Field_Missing { field_missing_data_msg = NewOrderSingle_Tag; field_missing_data_field = FIX_Field_Symbol_Tag } 
    | Some x    ->
    let c_symbol = x in

    match m.full_newOrderSingle_Side with 
    | None      -> FIX_TL_Req_Field_Missing { field_missing_data_msg = NewOrderSingle_Tag; field_missing_data_field = FIX_Field_Side_Tag }
    | Some x    -> 
    let c_side = x in 

    match m.full_newOrderSingle_OrderQty with 
    | None      -> FIX_TL_Req_Field_Missing { field_missing_data_msg = NewOrderSingle_Tag; field_missing_data_field = FIX_Field_OrderQty_Tag }
    | Some x    -> 
    let c_orderqty = x in 

    match m.full_newOrderSingle_OrdType with 
    | None      -> FIX_TL_Req_Field_Missing { field_missing_data_msg = NewOrderSingle_Tag; field_missing_data_field = FIX_Field_OrdType_Tag }
    | Some x    -> 
    let c_ordtype = x in 

    match m.full_newOrderSingle_TimeInForce with 
    | None      -> FIX_TL_Req_Field_Missing { field_missing_data_msg = NewOrderSingle_Tag; field_missing_data_field = FIX_Field_OrdType_Tag }
    | Some x    -> 
    let c_timeinforce = x in 

    match m.full_newOrderSingle_LocateReqd with 
    | None      -> FIX_TL_Req_Field_Missing { field_missing_data_msg = NewOrderSingle_Tag; field_missing_data_field = FIX_Field_OrdType_Tag }
    | Some x    -> 
    let c_locatereqd = x in 

    let fix_msg_data = {
        newOrderSingle_Account          = m.full_newOrderSingle_Account;
        newOrderSingle_ClOrdID          = c_clrordid;
        newOrderSingle_OrigClOrdID      = c_origclordid;
        newOrderSingle_ExecInst         = m.full_newOrderSingle_ExecInst;
        newOrderSingle_HandlInst        = c_handleinst;
        newOrderSingle_TransactTime     = c_transacttime;
        newOrderSingle_Symbol           = c_symbol;
        newOrderSingle_SymbolSfx        = m.full_newOrderSingle_SymbolSfx;
        newOrderSingle_Side             = c_side;
        newOrderSingle_OrderQty         = c_orderqty;
        newOrderSingle_OrdType          = c_ordtype;
        newOrderSingle_Price            = m.full_newOrderSingle_Price;
        newOrderSingle_MinQty           = m.full_newOrderSingle_MinQty;
        newOrderSingle_TimeInForce      = c_timeinforce;
        newOrderSingle_LocateReqd       = c_locatereqd;
        newOrderSingle_LocateBroker     = m.full_newOrderSingle_LocateBroker;
        newOrderSingle_Currency         = m.full_newOrderSingle_Currency;
    } in 

    FIX_TL_Normal ( NewOrderSingle fix_msg_data )
;;

let convert_FullExecutionReport ( m : full_fix_msg_execution_report_data ) =
    FIX_TL_Req_Field_Missing { field_missing_data_msg = NewOrderSingle_Tag; field_missing_data_field = FIX_Field_OrdType_Tag } 
;;

let convert_FullCancelReject ( m : full_fix_msg_cancel_reject_data ) = 
    FIX_TL_Req_Field_Missing { field_missing_data_msg = NewOrderSingle_Tag; field_missing_data_field = FIX_Field_OrdType_Tag } 
;;

let convert_FullOrderCancelRequest ( m : full_fix_msg_order_cancel_request_data ) =
    let fix_msg_data = {
        orderCancelRequest_ClOrdID          = m.full_orderCancelRequest_ClOrdID;
        orderCancelRequest_OrigClOrdID      = m.full_orderCancelRequest_OrigClOrdID;
        orderCancelRequest_OrderID          = m.full_orderCancelRequest_OrderID;
        orderCancelRequest_TransactTime     = m.full_orderCancelRequest_TransactTime;
        orderCancelRequest_Symbol           = m.full_orderCancelRequest_Symbol;
        orderCancelRequest_SymbolSfx        = m.full_orderCancelRequest_SymbolSfx;
        orderCancelRequest_Side             = m.full_orderCancelRequest_Side;
    } in 

    FIX_TL_Normal ( OrderCancelRequest fix_msg_data )
;;

let convert_FullOrderCancelReplaceRequest ( m : full_fix_msg_order_cancel_replace_request_data ) = 
    match m.full_orderCancelReplaceRequest_ClOrdID with 
    | None      -> FIX_TL_Req_Field_Missing { field_missing_data_msg = NewOrderSingle_Tag; field_missing_data_field = FIX_Field_ClOrdID_Tag }
    | Some x    -> 
    let c_clrordid = x in

    match m.full_orderCancelReplaceRequest_OrigClOrdID with 
    | None      -> FIX_TL_Req_Field_Missing { field_missing_data_msg = NewOrderSingle_Tag; field_missing_data_field = FIX_Field_OrigClOrdID_Tag }
    | Some x    -> 
    let c_origclordid = x in

    match m.full_orderCancelReplaceRequest_HandlInst with
    | None      -> FIX_TL_Req_Field_Missing { field_missing_data_msg = NewOrderSingle_Tag; field_missing_data_field = FIX_Field_HandlInst_Tag }
    | Some x    -> 
    let c_handleinst = x in 

    match m.full_orderCancelReplaceRequest_TransactTime with
    | None      -> FIX_TL_Req_Field_Missing { field_missing_data_msg = NewOrderSingle_Tag; field_missing_data_field = FIX_Field_TransactTime_Tag } 
    | Some x    -> 
    let c_transacttime = x in

    match m.full_orderCancelReplaceRequest_Symbol with 
    | None      -> FIX_TL_Req_Field_Missing { field_missing_data_msg = NewOrderSingle_Tag; field_missing_data_field = FIX_Field_Symbol_Tag } 
    | Some x    ->
    let c_symbol = x in

    match m.full_orderCancelReplaceRequest_Side with 
    | None      -> FIX_TL_Req_Field_Missing { field_missing_data_msg = NewOrderSingle_Tag; field_missing_data_field = FIX_Field_Side_Tag }
    | Some x    -> 
    let c_side = x in 

    match m.full_orderCancelReplaceRequest_OrderQty with 
    | None      -> FIX_TL_Req_Field_Missing { field_missing_data_msg = NewOrderSingle_Tag; field_missing_data_field = FIX_Field_OrderQty_Tag }
    | Some x    -> 
    let c_orderqty = x in 

    match m.full_orderCancelReplaceRequest_OrdType with 
    | None      -> FIX_TL_Req_Field_Missing { field_missing_data_msg = NewOrderSingle_Tag; field_missing_data_field = FIX_Field_OrdType_Tag }
    | Some x    -> 
    let c_ordtype = x in 

    match m.full_orderCancelReplaceRequest_TimeInForce with 
    | None      -> FIX_TL_Req_Field_Missing { field_missing_data_msg = NewOrderSingle_Tag; field_missing_data_field = FIX_Field_OrdType_Tag }
    | Some x    -> 
    let c_timeinforce = x in 

    match m.full_orderCancelReplaceRequest_LocateReqd with 
    | None      -> FIX_TL_Req_Field_Missing { field_missing_data_msg = NewOrderSingle_Tag; field_missing_data_field = FIX_Field_OrdType_Tag }
    | Some x    -> 
    let c_locatereqd = x in 

    let fix_msg_data = {
        orderCancelReplaceRequest_Account           = m.full_orderCancelReplaceRequest_Account;
        orderCancelReplaceRequest_ClOrdID           = c_clrordid;
        orderCancelReplaceRequest_HandlInst         = c_handleinst;
        orderCancelReplaceRequest_OrigClOrdID       = c_origclordid;
        orderCancelReplaceRequest_ExecInst          = m.full_orderCancelReplaceRequest_ExecInst;
        orderCancelReplaceRequest_TransactTime      = c_transacttime;
        orderCancelReplaceRequest_Symbol            = c_symbol;
        orderCancelReplaceRequest_SymbolSfx         = m.full_orderCancelReplaceRequest_SymbolSfx;
        orderCancelReplaceRequest_Side              = c_side;
        orderCancelReplaceRequest_OrderQty          = c_orderqty;
        orderCancelReplaceRequest_OrdType           = c_ordtype;
        orderCancelReplaceRequest_Price             = m.full_orderCancelReplaceRequest_Price;
        orderCancelReplaceRequest_MinQty            = m.full_orderCancelReplaceRequest_MinQty;
        orderCancelReplaceRequest_TimeInForce       = c_timeinforce;
        orderCancelReplaceRequest_LocateReqd        = c_locatereqd;
        orderCancelReplaceRequest_LocateBroker      = m.full_orderCancelReplaceRequest_LocateBroker;
    } in 

    FIX_TL_Normal ( OrderCancelReplaceRequest fix_msg_data )
;;

(** Convert from the full-blown model to model-specific one. *)
let convert_full_to_model_fix ( msg : full_fix_msg ) =
    match msg with
    | Full_Msg_ExecutionReport msg_data             -> convert_FullExecutionReport ( msg_data )
    | Full_Msg_OrderCancelRequest msg_data          -> convert_FullOrderCancelRequest ( msg_data )
    | Full_Msg_OrderCancelReplaceRequest msg_data   -> convert_FullOrderCancelReplaceRequest ( msg_data )
    | Full_Msg_NewOrderSingle msg_data              -> convert_FullNewOrderSingle ( msg_data )
    | Full_Msg_CancelReject msg_data                -> convert_FullCancelReject ( msg_data )
;;

(** **************************************************************************************************** *)
(**                                                                                                      *)
(** **************************************************************************************************** *)
let convert_ExecutionReport ( m : fix_msg_execution_report_data ) =
    Format_Validated ( Full_Msg_ExecutionReport {
    full_executionReport_OrderID                     = m.executionReport_OrderID;
    full_executionReport_ClOrdID                     = m.executionReport_ClOrdID;
    full_executionReport_ExecType                    = m.executionReport_ExecType;
    full_executionReport_ExecID                      = m.executionReport_ExecID;
    full_executionReport_Account                     = m.executionReport_Account;
    full_executionReport_Side                        = m.executionReport_Side;
    full_executionReport_OrdType                     = m.executionReport_OrdType;
    full_executionReport_OrdStatus                   = m.executionReport_OrdStatus;
    full_executionReport_AvgPx                       = m.executionReport_AvgPx;
    full_executionReport_LeavesQty                   = m.executionReport_LeavesQty;
    full_executionReport_CumQty                      = m.executionReport_CumQty;
} )
;;

let convert_OrderCancelRequest ( m : fix_msg_order_cancel_request_data ) = 
    Format_Validated ( Full_Msg_OrderCancelRequest {
    full_orderCancelRequest_ClOrdID                 = m.orderCancelRequest_ClOrdID;
    full_orderCancelRequest_OrigClOrdID             = m.orderCancelRequest_OrigClOrdID;
    full_orderCancelRequest_OrderID                 = m.orderCancelRequest_OrderID;
    full_orderCancelRequest_TransactTime            = m.orderCancelRequest_TransactTime;
    full_orderCancelRequest_Symbol                  = m.orderCancelRequest_Symbol;
    full_orderCancelRequest_SymbolSfx               = m.orderCancelRequest_SymbolSfx;
    full_orderCancelRequest_Side                    = m.orderCancelRequest_Side;
} )
;;

let convert_OrderCancelReplaceRequest ( m : fix_msg_order_cancel_replace_request_data ) = 
    Format_Validated ( Full_Msg_OrderCancelReplaceRequest {
    full_orderCancelReplaceRequest_Account          = m.orderCancelReplaceRequest_Account;
    full_orderCancelReplaceRequest_ClOrdID          = Some m.orderCancelReplaceRequest_ClOrdID;
    full_orderCancelReplaceRequest_HandlInst        = Some m.orderCancelReplaceRequest_HandlInst;
    full_orderCancelReplaceRequest_OrigClOrdID      = Some m.orderCancelReplaceRequest_OrigClOrdID;
    full_orderCancelReplaceRequest_ExecInst         = m.orderCancelReplaceRequest_ExecInst;
    full_orderCancelReplaceRequest_TransactTime     = Some m.orderCancelReplaceRequest_TransactTime;
    full_orderCancelReplaceRequest_Symbol           = Some m.orderCancelReplaceRequest_Symbol;
    full_orderCancelReplaceRequest_SymbolSfx        = m.orderCancelReplaceRequest_SymbolSfx;
    full_orderCancelReplaceRequest_Side             = Some m.orderCancelReplaceRequest_Side;
    full_orderCancelReplaceRequest_OrderQty         = Some m.orderCancelReplaceRequest_OrderQty;
    full_orderCancelReplaceRequest_OrdType          = Some m.orderCancelReplaceRequest_OrdType;
    full_orderCancelReplaceRequest_Price            = m.orderCancelReplaceRequest_Price;
    full_orderCancelReplaceRequest_MinQty           = m.orderCancelReplaceRequest_MinQty;
    full_orderCancelReplaceRequest_TimeInForce      = Some m.orderCancelReplaceRequest_TimeInForce;
    full_orderCancelReplaceRequest_LocateReqd       = Some m.orderCancelReplaceRequest_LocateReqd;
    full_orderCancelReplaceRequest_LocateBroker     = m.orderCancelReplaceRequest_LocateBroker;
} )
;;

let convert_NewOrderSingle ( m : fix_msg_new_order_single_data ) = 
    Format_Validated ( Full_Msg_NewOrderSingle {
    full_newOrderSingle_Account                     = m.newOrderSingle_Account;
    full_newOrderSingle_ClOrdID                     = Some m.newOrderSingle_ClOrdID;
    full_newOrderSingle_OrigClOrdID                 = Some m.newOrderSingle_OrigClOrdID;
    full_newOrderSingle_ExecInst                    = m.newOrderSingle_ExecInst;
    full_newOrderSingle_HandlInst                   = Some m.newOrderSingle_HandlInst;
    full_newOrderSingle_TransactTime                = Some m.newOrderSingle_TransactTime;
    full_newOrderSingle_Symbol                      = Some m.newOrderSingle_Symbol;
    full_newOrderSingle_SymbolSfx                   = m.newOrderSingle_SymbolSfx;
    full_newOrderSingle_Side                        = Some m.newOrderSingle_Side;
    full_newOrderSingle_OrderQty                    = Some m.newOrderSingle_OrderQty;
    full_newOrderSingle_OrdType                     = Some m.newOrderSingle_OrdType;
    full_newOrderSingle_Price                       = m.newOrderSingle_Price;
    full_newOrderSingle_MinQty                      = m.newOrderSingle_MinQty;
    full_newOrderSingle_TimeInForce                 = Some m.newOrderSingle_TimeInForce;
    full_newOrderSingle_LocateReqd                  = Some m.newOrderSingle_LocateReqd;
    full_newOrderSingle_LocateBroker                = m.newOrderSingle_LocateBroker;
    full_newOrderSingle_Currency                    = m.newOrderSingle_Currency;
} )
;;

let convert_CancelReject ( m : fix_msg_cancel_reject_data ) = 
    Format_Validated ( Full_Msg_CancelReject {
    full_cancelReject_Account                       = m.cancelReject_Account;
    full_cancelReject_ClOrdID                       = m.cancelReject_ClOrdID;
    full_cancelReject_OrigClOrdID                   = m.cancelReject_OrigClOrdID;
    full_cancelReject_OrderID                       = m.cancelReject_OrderID;
    full_cancelReject_OrdStatus                     = m.cancelReject_OrdStatus;
    full_cancelReject_CxlRejReason                  = m.cancelReject_CxlRejReason;
    full_cancelReject_Text                          = m.cancelReject_Text;
} )
;;

let convert_model_to_full_fix ( msg: fix_msg ) = 
    match msg with 
    | ExecutionReport msg_data                      -> convert_ExecutionReport ( msg_data )
    | OrderCancelRequest msg_data                   -> convert_OrderCancelRequest ( msg_data )
    | OrderCancelReplaceRequest msg_data            -> convert_OrderCancelReplaceRequest ( msg_data )
    | NewOrderSingle msg_data                       -> convert_NewOrderSingle ( msg_data )
    | CancelReject msg_data                         -> convert_CancelReject ( msg_data )
;; 


(** **************************************************************************************************** *)
(**                                                                                                      *)
(** **************************************************************************************************** *)
