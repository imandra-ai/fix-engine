(** 

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    Implementation of the FIX 4.4 engine. Printers/parsers.

    fix_admin_msg_json.ml

*)

open Yojson
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
        ( "sr_ref_msg_type",                            stringopt_to_json ( msg_opt_tag_to_string x.sr_ref_msg_type ));
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

