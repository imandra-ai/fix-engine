(** 

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    JSON printers for app messages.

    fix_app_msg_json.ml

*)

open Yojson
open String
open List
open Basic_types
open Datetime
open Full_fix_fields
open Full_session_core
open Full_messages
open Fix_pp

let new_order_single_to_json x = 
    let list_assoc = [
        ( "Account"         , intopt_to_json x.full_newOrderSingle_Account      );
        ( "ClOrdID"         , intopt_to_json x.full_newOrderSingle_ClOrdID      );
        ( "OrigClOrdID"     , intopt_to_json x.full_newOrderSingle_OrigClOrdID  );
        ( "ExecInst"        , stringopt_to_json ( execinst_opt_to_string x.full_newOrderSingle_ExecInst   ));
        ( "HandlInst"       , stringopt_to_json ( handleinst_opt_to_string x.full_newOrderSingle_HandlInst ));
        ( "TransactTime"    , utctimestamp_opt_to_json ( x.full_newOrderSingle_TransactTime ));
        ( "Symbol"          , intopt_to_json x.full_newOrderSingle_Symbol );
        ( "SymbolSfx"       , intopt_to_json x.full_newOrderSingle_SymbolSfx );
        ( "Side"            , stringopt_to_json ( sideopt_to_string x.full_newOrderSingle_Side) );
        ( "OrderQty"        , floatopt_to_string x.full_newOrderSingle_OrderQty );
        ( "OrdType"         , stringopt_to_json ( ordtype_opt_to_string x.full_newOrderSingle_OrdType));
        ( "Price"           , floatopt_to_string x.full_newOrderSingle_Price );
        ( "MinQty"          , floatopt_to_string x.full_newOrderSingle_MinQty );
        ( "TimeInForce"     , stringopt_to_json ( timeinforce_opt_to_string x.full_newOrderSingle_TimeInForce ));
        ( "LocateReqd"      , boolopt_to_json x.full_newOrderSingle_LocateReqd );
        ( "LocateBroker"    , intopt_to_json x.full_newOrderSingle_LocateBroker );
        ( "Currency"        , stringopt_to_json ( currency_opt_to_string x.full_newOrderSingle_Currency ));
    ] |> filter_nulls in
    `Assoc list_assoc
;;

let cancel_order_request_data_to_json x = 
    let list_assoc = [
        ( "order_id",                                   `Int x.cl_order_id                              );
    ] |> filter_nulls in 
    `Assoc list_assoc
;;

let execution_report_data_to_json x = 
    let list_assoc = [
        ( "trade_report_id",                            `Int x.trade_report_id                          );
        ( "previously_reported",                        `String ( yes_no_to_string x.previously_reported ));
        ( "order_id",                                   `Int x.order_id                                 );
        ( "filled_qty",                                 `Int x.filled_qty                               );
    ] |> filter_nulls in
    `Assoc list_assoc
;;

let order_cancel_replace_request_data_to_json x = 
    let list_assoc = [
        ( ""                                            , );
        ( ""                                            , );
        ( ""                                            , );
        ( ""                                            , );
        ( ""                                            , );
        ( ""                                            , );
        ( ""                                            , );
        ( ""                                            , );
    ] |> filter_nulls in 
    `Assoc list_assoc
;;

let business_reject_data_to_json x = 
    let list_assoc = [
        ( ""                                            , );
        ( ""                                            , );
        ( ""                                            , );
    ] |> filter_nulls in 
    `Assoc list_assoc
;;

let full_fix_app_msg_data_to_json = function
    | Full_Msg_NewOrderSingle x                         -> `Assoc [ ( "new_order_single",   new_order_single_to_json x )        ]
    | Full_Msg_OrderCancelRequest x                     -> `Assoc [ ( "cancel_order",       cancel_order_data_to_json x )       ]
    | Full_Msg_OrderCancelReplaceRequest x              -> `Assoc [ ( "order_cancel_replace_request", order_cancel_replace_request_data_to_json x) ]
    | Full_Msg_ExecutionReport x                        -> `Assoc [ ( "execution_report",   execution_report_data_to_json x )   ]
    | Full_Msg_CancelReject x                           -> `Assoc [ ( "business_reject",    business_reject_data_to_json x)     ]
;;

let msg_data_to_json = function 
    | Full_FIX_Admin_Msg x                              -> `Assoc [ ( "admin_msg",          full_fix_admin_msg_data_to_json x )]
    | Full_FIX_App_Msg x                                -> `Assoc [ ( "app_msg",            full_fix_app_msg_data_to_json x )]
;;

(** Trailer to JSON conversion. *)
let trailer_to_json (t: fix_trailer) = 
    `Assoc [
        ( "signature_length",                           `Int t.signature_length                         );
        ( "signature",                                  `Int t.signature                                );
        ( "check_sum",                                  `Int t.check_sum                                );
    ]
;;

let full_fix_msg_to_json ( m : full_fix_msg) = 
    `Assoc [
        ( "header",                                     ( header_to_json m.full_msg_header )            );
        ( "msg_data",                                   ( msg_data_to_json m.full_msg_data )            );
        ( "trailer",                                    ( trailer_to_json m.full_msg_trailer )          );
    ]
;;


let bussiness_rejected_msg_to_json x =
    `Assoc [
        ( "brej_msg_ref_seq_num",                       `Int x.brej_msg_ref_seq_num                     );
        ( "brej_msg_msg_tag",                           `String ( msg_tag_to_string x.brej_msg_msg_tag)  );
        ( "brej_msg_reject_reason",                     `String ( busines_reject_reason_to_string x.brej_msg_reject_reason ) );
        ( "brej_msg_text",                              optstring_to_json brej_msg_text                 );
        ( "brej_msg_encoded_text",                      brej_msg_encoded_text                           );
    ] 
;;
