(** 

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    JSON printers for app messages.

    fix_app_msg_json.ml

*)

(* @meta[imandra_ignore] on @end *)
open Yojson;;
open String;;
open List;;
open Basic_types;;
open Datetime;;
open Full_fix_fields;;
open Full_session_core;;
open Fix_basics_json;;
open Full_app_messages;;
(* @meta[imandra_ignore] off @end *)

let new_order_single_to_json x = 
    let list_assoc = [
        ( "Account"                 , intopt_to_json x.full_newOrderSingle_Account                                                      );
        ( "ClOrdID"                 , intopt_to_json x.full_newOrderSingle_ClOrdID                                                      );
        ( "OrigClOrdID"             , intopt_to_json x.full_newOrderSingle_OrigClOrdID                                                  );
        ( "ExecInst"                , stringopt_to_json ( execinst_opt_to_string x.full_newOrderSingle_ExecInst )                       );
        ( "HandlInst"               , stringopt_to_json ( handleinst_opt_to_string x.full_newOrderSingle_HandlInst )                    );
        ( "TransactTime"            , utctimestamp_opt_to_json ( x.full_newOrderSingle_TransactTime )                                   );
        ( "Symbol"                  , intopt_to_json x.full_newOrderSingle_Symbol                                                       );
        ( "SymbolSfx"               , intopt_to_json x.full_newOrderSingle_SymbolSfx                                                    );
        ( "Side"                    , stringopt_to_json ( sideopt_to_string x.full_newOrderSingle_Side )                                );
        ( "OrderQty"                , floatopt_to_json x.full_newOrderSingle_OrderQty                                                   );
        ( "OrdType"                 , stringopt_to_json ( ordtype_opt_to_string x.full_newOrderSingle_OrdType )                         );
        ( "Price"                   , floatopt_to_json x.full_newOrderSingle_Price                                                      );
        ( "MinQty"                  , floatopt_to_json x.full_newOrderSingle_MinQty                                                     );
        ( "TimeInForce"             , stringopt_to_json ( timeinforce_opt_to_string x.full_newOrderSingle_TimeInForce )                 );
        ( "LocateReqd"              , boolopt_to_json x.full_newOrderSingle_LocateReqd                                                  );
        ( "LocateBroker"            , intopt_to_json x.full_newOrderSingle_LocateBroker                                                 );
        ( "Currency"                , stringopt_to_json ( currency_opt_to_string x.full_newOrderSingle_Currency )                       );
    ] |> filter_nulls in
    `Assoc list_assoc
;;

let cancel_order_request_data_to_json x = 
    let list_assoc = [
        ( "ClOrdID"                 , intopt_to_json x.full_orderCancelRequest_ClOrdID                                                  );
        ( "OrigClOrdID"             , intopt_to_json x.full_orderCancelRequest_OrigClOrdID                                              );
        ( "OrderID"                 , intopt_to_json x.full_orderCancelRequest_OrderID                                                  );
        ( "TransactTime"            , utctimestamp_opt_to_json x.full_orderCancelRequest_TransactTime                                   );
        ( "Symbol"                  , intopt_to_json x.full_orderCancelRequest_Symbol                                                   );
        ( "SymbolSfx"               , intopt_to_json x.full_orderCancelRequest_SymbolSfx                                                );
        ( "Side"                    , stringopt_to_json ( sideopt_to_string x.full_orderCancelRequest_Side )                            );
    ] |> filter_nulls in 
    `Assoc list_assoc
;;

let execution_report_data_to_json x = 
    let list_assoc = [
        ( "OrderID"                 , intopt_to_json x.full_executionReport_OrderID                                                     );
        ( "ClOrdID"                 , intopt_to_json x.full_executionReport_ClOrdID                                                     );
        ( "ExecType"                , stringopt_to_json (exectype_opt_to_string x.full_executionReport_ExecType )                       );
        ( "ExecID"                  , intopt_to_json x.full_executionReport_ExecID                                                      );
        ( "Account"                 , intopt_to_json x.full_executionReport_Account                                                     );
        ( "Side"                    , stringopt_to_json ( sideopt_to_string x.full_executionReport_Side )                               );
        ( "OrdType"                 , stringopt_to_json ( ordtype_opt_to_string x.full_executionReport_OrdType )                        );
        ( "OrdStatus"               , stringopt_to_json ( ord_status_opt_to_string x.full_executionReport_OrdStatus )                   );
        ( "AvgPx"                   , floatopt_to_json x.full_executionReport_AvgPx                                                     );
        ( "LeavesQty"               , floatopt_to_json x.full_executionReport_LeavesQty                                                 );
        ( "CumQty"                  , floatopt_to_json x.full_executionReport_CumQty                                                    );
    ] |> filter_nulls in
    `Assoc list_assoc
;;

let order_cancel_replace_request_data_to_json x = 
    let list_assoc = [
        ( "Account"                 , intopt_to_json x.full_orderCancelReplaceRequest_Account                                           );
        ( "ClOrdID"                 , intopt_to_json x.full_orderCancelReplaceRequest_ClOrdID                                           );
        ( "HandlInst"               , stringopt_to_json ( handleinst_opt_to_string x.full_orderCancelReplaceRequest_HandlInst )         );
        ( "OrigClOrdID"             , intopt_to_json x.full_orderCancelReplaceRequest_OrigClOrdID                                       );
        ( "ExecInst"                , stringopt_to_json ( execinst_opt_to_string x.full_orderCancelReplaceRequest_ExecInst )            );
        ( "TransactTime"            , utctimestamp_opt_to_json x.full_orderCancelReplaceRequest_TransactTime                            );
        ( "Symbol"                  , intopt_to_json x.full_orderCancelReplaceRequest_Symbol                                            );
        ( "SymbolSfx"               , intopt_to_json x.full_orderCancelReplaceRequest_SymbolSfx                                         );
        ( "Side"                    , stringopt_to_json ( sideopt_to_string x.full_orderCancelReplaceRequest_Side )                     );
        ( "OrderQty"                , floatopt_to_json x.full_orderCancelReplaceRequest_OrderQty                                        );
        ( "OrdType"                 , stringopt_to_json ( ordtype_opt_to_string x.full_orderCancelReplaceRequest_OrdType )              );
        ( "Price"                   , floatopt_to_json x.full_orderCancelReplaceRequest_Price                                           );
        ( "MinQty"                  , floatopt_to_json x.full_orderCancelReplaceRequest_MinQty                                          );
        ( "TimeInForce"             , stringopt_to_json ( timeinforce_opt_to_string x.full_orderCancelReplaceRequest_TimeInForce )      );
        ( "LocateReqd"              , boolopt_to_json x.full_orderCancelReplaceRequest_LocateReqd                                       );
        ( "LocateBroker"            , intopt_to_json x.full_orderCancelReplaceRequest_LocateBroker                                      );

    ] |> filter_nulls in 
    `Assoc list_assoc
;;

let cancel_reject_data_to_json x = 
    let list_assoc = [

    ] |> filter_nulls in 
    `Assoc list_assoc
;;

let full_fix_app_msg_data_to_json = function
    | Full_Msg_NewOrderSingle x             -> `Assoc [ ( "new_order_single",   new_order_single_to_json x )                            ]
    | Full_Msg_OrderCancelRequest x         -> `Assoc [ ( "cancel_order",       cancel_order_request_data_to_json x )                   ]
    | Full_Msg_OrderCancelReplaceRequest x  -> `Assoc [ ( "order_cancel_replace_request", order_cancel_replace_request_data_to_json x)  ]
    | Full_Msg_ExecutionReport x            -> `Assoc [ ( "execution_report",   execution_report_data_to_json x )                       ]
    | Full_Msg_CancelReject x               -> `Assoc [ ( "business_reject",    cancel_reject_data_to_json x)                           ]
;;
