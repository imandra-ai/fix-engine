(** 

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    Implementation of the FIX 4.4 engine. Printers/parsers.

    fix_msg_printers.ml

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

let logon_data_to_json x =
    `Assoc [
        ( "encrypt_method",                             `Int x.encrypt_method                           );
        ( "heartbeat_interval",                         utcduration_to_json x.heartbeat_interval        );
        ( "raw_data_length",                            `Int x.raw_data_length                          );
    ]
;;

let logout_data_to_json x = 
    let list_assoc = [
        ( "encoded_text_len",                           intopt_to_json x.encoded_text_len               );
        ( "encoded_text",                               intopt_to_json x.encoded_text                   );
    ] |> filter_nulls in 
    `Assoc list_assoc
;;

let heartbeat_data_to_json x = 
    let list_assoc = [
        ( "test_req_id",                                intopt_to_json x.hb_test_req_id                 );
    ] |> filter_nulls in 
    `Assoc list_assoc
;;

let testrequest_data_to_json x = 
    `Assoc [
        ( "test_req_id",                                `Int x.test_req_id                              );
    ]
;;

let resend_request_data_to_json x = 
    `Assoc [
        ( "begin_seq_num",                              `Int x.begin_seq_num                            );
        ( "end_seq_num",                                `Int x.end_seq_num                              );
    ]
;;

let session_reject_data_to_json x = 
    let list_assoc = [
        ( "ref_seq_num",                                `Int x.sr_ref_seq_num                           );
        ( "sr_ref_tag_id",                              `Int x.sr_ref_tag_id                            );
        ( "sr_ref_msg_type",                            stringopt_to_json ( msg_opt_tag_to_json x.sr_ref_msg_type ));
        ( "session_reject_reason",                      stringopt_to_json ( reject_reason_opt_to_string x.sr_session_reject_reason ));
        ( "sr_text",                                    `Int x.sr_ref_seq_num                           );
        ( "sr_encoded_text_len",                        `Int x.sr_ref_seq_num                           );
        ( "sr_encoded_text",                            `Int x.sr_ref_seq_num                           );
    ] |> filter_nulls in 
    `Assoc list_assoc
;;

let business_reject_data_to_json x = 
    `Assoc [
        ( "br_ref_seq_num",                             `Int x.br_ref_seq_num                           );
        ( "business_reject_reason",                     `String (fix_business_reject_to_string x.business_reject_reason ));
    ]
;;

let sequence_reset_data_to_json x = 
    let list_assoc = [
        ( "new_seq_no",                                 `Int x.new_seq_no                               );
        ( "gap_fill_flag",                              stringopt_to_json ( yes_no_opt_to_string x.gap_fill_flag ));
    ] |> filter_nulls in
    `Assoc list_assoc
;;

(*
let order_qty_block_to_json oq =
    let list_assoc = [
        ( "order_qty",                                  intopt_to_json oq.order_qty );
        ( "cash_order_qty",                             intopt_to_json oq.cash_order_qty );
        ( "order_percent",                              intopt_to_json oq.order_percent );
        ( "rounding_direction",                         intopt_to_json oq.rounding_direction );
        ( "rounding_modulus",                           intopt_to_json oq.rounding_modulus );
    ] |> filter_nulls in 
    `Assoc list_assoc
;;
*)

let create_order_data_to_json x = 
    let list_assoc = [
        ( "client_order_id",                            `Int x.client_order_id                          );
        ( "side",                                       `String ( side_to_string x.side )               );
        ( "order_qty_data",                             order_qty_block_to_json x.order_qty_data        );
        ( "order_type",                                 `String ( ord_type_to_string x.order_type )     );
        ( "price_type",                                 stringopt_to_json ( price_type_opt_to_string x.price_type ));
        ( "price",                                      stringopt_to_json ( priceopt_to_string x.price ));
        ( "stop_px",                                    stringopt_to_json ( priceopt_to_string x.stop_px ));
    ] |> filter_nulls in
    `Assoc list_assoc
;;

let cancel_order_data_to_json x = 
    `Assoc [
        ( "order_id",                                   `Int x.cl_order_id                              );
    ]
;;

let trade_report_data_to_json x = 
    let list_assoc = [
        ( "trade_report_id",                            `Int x.trade_report_id                          );
        ( "previously_reported",                        `String ( yes_no_to_string x.previously_reported ));
        ( "order_id",                                   `Int x.order_id                                 );
        ( "filled_qty",                                 `Int x.filled_qty                               );
    ] |> filter_nulls in
    `Assoc list_assoc
;;

let full_fix_admin_msg_data_to_json = function
    | Full_Msg_Logon x                                  -> `Assoc [ ( "logon",              logon_data_to_json x )          ]
    | Full_Msg_Logoff x                                 -> `Assoc [ ( "logout",             logout_data_to_json x )         ]
    | Full_Msg_Hearbeat x                               -> `Assoc [ ( "heartbeat",          heartbeat_data_to_json x )      ]
    | Full_Msg_Resend_Request x                         -> `Assoc [ ( "resend_request",     resend_request_data_to_json x ) ]
    | Full_Msg_Reject x                                 -> `Assoc [ ( "session_reject",     session_reject_data_to_json x ) ]
    | Full_Msg_Sequence_Reset x                         -> `Assoc [ ( "sequence_rest",      sequence_reset_data_to_json x ) ]
    | Full_Msg_Business_Reject x                        -> `Assoc [ ( "business_reject",    business_reject_data_to_json x )]
    | Full_Msg_Test_Request x                           -> `Assoc [ ( "test_request",       test_request_data_to_json x )   ]
;;

let full_fix_app_msg_data_to_json = function
    | Full_Msg_NewOrderSingle x                         -> `Assoc [ ( "new_order_single",   create_order_data_to_json x)    ]
    | Full_Msg_OrderCancelRequest x                     -> `Assoc [ ( "cancel_order",       cancel_order_data_to_json x)    ]
    | Full_Msg_OrderCancelReplaceRequest x              -> `Assoc [ ( "ordercancelreplace_request", ordercancelreplacerequest_data_to_json x) ]
    | Full_Msg_ExecutionReport x                        -> `Assoc [ ( "trade_report_ae",    trade_report_data_to_json x)    ]
    | Full_Msg_CancelReject x                           -> `Assoc [ ( "business_reject",    business_reject_data_to_json x) ]
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

let full_fix_msg_opt_to_json : ( full_fix_msg option -> Yojson.Basic.json) = 
    function None -> `Null | Some m -> full_fix_msg_to_json (m)
;;

(** This is used in a couple of places. *)
let msg_list_to_json ( msgs : full_fix_msg list) = 
    `List (List.map full_fix_msg_to_json msgs)
;;

let fix_msg_to_str m =
    Yojson.Basic.pretty_to_string (full_fix_msg_to_json m)
;;


let session_rejected_data_to_json x =
    `Assoc [
        ( "srej_msg_msg_seq_num",                       `Int x.srej_msg_msg_seq_num                     );
        ( "srej_msg_field_tag",                         `String x.srej_msg_field_tag                    );
        ( "srej_msg_msg_type",                          `String x.srej_msg_msg_type                     );
        ( "srej_msg_reject_reason",                     `String x.srej_msg_reject_reason                );
        ( "srej_text",                                  `String x.srej_text                             );
        ( "srej_encoded_text",                          `String x.srej_encoded_text                     );
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

let full_top_level_msg_to_json m = function
    | ValidMsg x                                        -> `Assoc [ ( "valid_msg",          full_fix_msg_to_json x ) ]
    | SessionRejectedMsg x                              -> `Assoc [ ( "session_rejected",   session_rejected_data_to_json x ) ]
    | BusinessRejectedMsg x                             -> `Assoc [ ( "business_rejected",  bussiness_rejected_msg_to_json x ) ]
    | Gargled                                           -> `String "Gargled"
;;



let msg_list_to_string (msgs : fix_message list) = 
    String.concat "\n" (List.map fix_msg_to_str msgs)
;;