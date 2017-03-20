(** Printers/parsers for administrative messages. *)
(*** 

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    fix_admin_msg_json.ml

*)

(* @meta[imandra_ignore] on @end *)
open Yojson;;
open Full_fix_fields;;
open Full_session_core;;
open Full_admin_messages;;
open Base_types_json;;
(* @meta[imandra_ignore] off @end *)

let logon_data_to_json x =
    `Assoc [
        ( "ln_encrypt_method"           , `String (fix_encryption_method_to_str x.ln_encrypt_method)                    );
        ( "ln_heartbeat_interval"       , utcduration_to_json x.ln_heartbeat_interval                                   );
        ( "ln_raw_data_length"          , `Int (match x.ln_raw_data_length with | None -> 0 | Some len -> len)          );
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
        ( "sr_ref_tag_id"               , `Int x.sr_ref_tag_id                                                          );
        ( "sr_ref_msg_type"             , stringopt_to_json ( msg_opt_tag_to_string x.sr_ref_msg_type )                 );
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
        ( "seqr_gap_fill_flag"          , stringopt_to_json ( yes_no_opt_to_string x.seqr_gap_fill_flag )               );
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

