(** Printers/parsers for administrative messages. *)
(*** 

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    fix_admin_msg_json.ml

*)

(* @meta[imandra_ignore] on @end *)
open Yojson;;
open Model_field_json;;
open Full_protocol_fields;;
open Full_session_core;;
open Full_admin_messages;;
open Base_types_json;;
open Datetime_json;;
open Full_app_msg_tag_json;;
(* @meta[imandra_ignore] off @end *)

let filter_nulls =
    List.filter (function ( _, `Null ) -> false | _ -> true )
;;

let admin_msg_tag_to_string = function
    | Full_Msg_Business_Reject_Tag      -> "BusinessReject"
    | Full_Msg_Hearbeat_Tag             -> "Heartbeat"
    | Full_Msg_Logon_Tag                -> "Logon"
    | Full_Msg_Logoff_Tag               -> "Logoff"
    | Full_Msg_Reject_Tag               -> "Reject"
    | Full_Msg_Resend_Request_Tag       -> "ResendRequest"
    | Full_Msg_Sequence_Reset_Tag       -> "SequenceReset"
    | Full_Msg_Test_Request_Tag         -> "TestRequest"
;;

let msg_tag_to_string = function
    | Full_FIX_Admin_Msg_Tag admin_tag  -> admin_msg_tag_to_string admin_tag
    | Full_FIX_App_Msg_Tag app_tag      -> app_msg_tag_to_string app_tag
;;

let protocol_field_to_string = function
    | Full_FIX_Field_OrigClOrdID        -> "OrigClOrdID"
    | Full_FIX_Field_OrderID            -> "OrderID"
    | Full_FIX_Field_ClOrdID            -> "ClOrdID"
    | Full_FIX_Field_ExecType           -> "ExecType"
    | Full_FIX_Field_ExecID             -> "ExecID"
    | Full_FIX_Field_Account            -> "Account"
    | Full_FIX_Field_Side               -> "Side"
    | Full_FIX_Field_OrdType            -> "OrdType"
    | Full_FIX_Field_OrdStatus          -> "OrdStatus"
    | Full_FIX_Field_AvgPx              -> "AvgPx"
    | Full_FIX_Field_Price              -> "Price"
    | Full_FIX_Field_LeavesQty          -> "LeavesQty"
    | Full_FIX_Field_CumQty             -> "CumQty"
    | Full_FIX_Field_OrderQty           -> "OrderQty"
    | Full_FIX_Field_MinQty             -> "MinQty"
    | Full_FIX_Field_HandlInst          -> "HandlInst"
    | Full_FIX_Field_TransactTime       -> "TransactTime"
    | Full_FIX_Field_Symbol             -> "Symbol"
    | Full_FIX_Field_SymbolSfx          -> "SymbolSfx"
    | Full_FIX_Field_TimeInForce        -> "TimeInForce"
    | Full_FIX_Field_Currency           -> "Currency"
    | Full_FIX_Field_LocateBroker       -> "LocateBroker"
    | Full_FIX_Field_LocateReqd         -> "LocateReqd"
    | Full_FIX_Field_ExecInst           -> "ExecInst"
;;


let full_field_to_string = function
    | Full_FIX_Protocol_Field t         -> protocol_field_to_string t
    | Full_FIX_Model_Field t            -> model_field_to_string t
;;

let full_field_opt_to_json = function
    | Some t -> `String (full_field_to_string t)
    | None -> `Assoc []
;;

let field_tag_opt_to_string = function
    | None                              -> None
    | Some x                            -> Some ( full_field_to_string x )
;;


let msg_tag_opt_to_string = function
    | None                              -> None
    | Some m                            -> Some ( msg_tag_to_string m )
;;

let logon_data_to_json x =
    `Assoc [
        ( "ln_encrypt_method"           , `String ( fix_encryption_method_to_str x.ln_encrypt_method )                  );
        ( "ln_heartbeat_interval"       , utcduration_to_json x.ln_heartbeat_interval                                   );
        ( "ln_raw_data_length"          , `Int ( match x.ln_raw_data_length with | None -> 0 | Some len -> len )        );
    ]
;;

let logout_data_to_json x = 
    let list_assoc = [
        ( "lo_encoded_text_len"         , intopt_to_json x.lo_encoded_text_len                                          );
        ( "lo_encoded_text"             , intopt_to_json x.lo_encoded_text                                              );
    ] |> filter_nulls in 
    `Assoc list_assoc
;;

let heartbeat_data_to_json x = 
    let list_assoc = [
        ( "hb_test_req_id"              , intopt_to_json x.hb_test_req_id                                               );
    ] |> filter_nulls in 
    `Assoc list_assoc
;;

let testrequest_data_to_json x = 
    `Assoc [
        ( "test_req_id"                 , `Int x.test_req_id                                                            );
    ]
;;

let resend_request_data_to_json x = 
    `Assoc [
        ( "rr_begin_seq_num"            , `Int x.rr_begin_seq_num                                                       );
        ( "rr_end_seq_num"              , `Int x.rr_end_seq_num                                                         );
    ]
;;

let session_reject_data_to_json x = 
    let list_assoc = [
        ( "sr_ref_seq_num"              , `Int x.sr_ref_seq_num                                                         );
        ( "sr_ref_tag_id"               , intopt_to_json x.sr_ref_tag_id                                                );
        ( "sr_ref_msg_type"             , stringopt_to_json ( msg_tag_opt_to_string x.sr_ref_msg_type )                 );
        ( "sr_session_reject_reason"    , stringopt_to_json ( reject_reason_opt_to_string x.sr_session_reject_reason )  );
        ( "sr_text"                     , `Int x.sr_ref_seq_num                                                         );
        ( "sr_encoded_text_len"         , `Int x.sr_ref_seq_num                                                         );
        ( "sr_encoded_text"             , `Int x.sr_ref_seq_num                                                         );
    ] |> filter_nulls in 
    `Assoc list_assoc
;;

let business_reject_data_to_json x = 
    `Assoc [
        ( "br_ref_seq_num"              , `Int x.br_ref_seq_num                                                         );
        ( "br_business_reject_reason"   , `String (fix_business_reject_to_string x.br_business_reject_reason )          );
    ]
;;

let sequence_reset_data_to_json x = 
    let list_assoc = [
        ( "seqr_new_seq_no"             , `Int x.seqr_new_seq_no                                                        );
        ( "seqr_gap_fill_flag"          , stringopt_to_json ( fix_GapFillFlag_opt_to_string x.seqr_gap_fill_flag )       );
    ] |> filter_nulls in
    `Assoc list_assoc
;;

let test_request_data_to_json x = 
    let list_assoc = [

    ] |> filter_nulls in
    `Assoc list_assoc
;;

let full_fix_admin_msg_data_to_json = function
    | Full_Msg_Logon x                  -> `Assoc [ ( "logon",              logon_data_to_json x )                      ]
    | Full_Msg_Logoff x                 -> `Assoc [ ( "logout",             logout_data_to_json x )                     ]
    | Full_Msg_Hearbeat x               -> `Assoc [ ( "heartbeat",          heartbeat_data_to_json x )                  ]
    | Full_Msg_Resend_Request x         -> `Assoc [ ( "resend_request",     resend_request_data_to_json x )             ]
    | Full_Msg_Reject x                 -> `Assoc [ ( "session_reject",     session_reject_data_to_json x )             ]
    | Full_Msg_Sequence_Reset x         -> `Assoc [ ( "sequence_rest",      sequence_reset_data_to_json x )             ]
    | Full_Msg_Business_Reject x        -> `Assoc [ ( "business_reject",    business_reject_data_to_json x )            ]
    | Full_Msg_Test_Request x           -> `Assoc [ ( "test_request",       test_request_data_to_json x )               ]
;;

