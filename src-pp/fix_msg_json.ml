(** 

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    JSON printers for admin and app messages.
    
    fix_msg_json.ml

*)

open Yojson
open List
open Full_session_core
open Full_messages
open Fix_admin_msg_json
open Fix_app_msg_json
open Fix_basics_json

let msg_data_to_json = function 
    | Full_FIX_Admin_Msg x                              -> `Assoc [ ( "admin_msg",          full_fix_admin_msg_data_to_json x ) ]
    | Full_FIX_App_Msg x                                -> `Assoc [ ( "app_msg",            full_fix_app_msg_data_to_json x )   ]
;;

let msg_data_list_to_json msgs = 
    `List ( List.map msg_data_to_json msgs )
;;

(** Trailer to JSON conversion. *)
let trailer_to_json ( t: fix_trailer ) = 
    `Assoc [
        ( "signature_length",                           `Int t.signature_length                                                 );
        ( "signature",                                  `Int t.signature                                                        );
        ( "check_sum",                                  `Int t.check_sum                                                        );
    ]
;;

(** Header to JSON conversion. *)
let header_to_json ( fh : fix_header ) =
    let list_assoc = [
        ( "begin_string"                                , `Int fh.h_begin_string                                                );                        
        ( "body_length"                                 , `Int fh.h_body_length                                                 );
        ( "sender_comp_id"                              , `Int fh.h_sender_comp_id                                              );
        ( "target_comp_id"                              , `Int fh.h_target_comp_id                                              );
        ( "msg_seq_num"                                 , `Int fh.h_msg_seq_num                                                 );
                                       
        ( "on_behalf_of_comp_id"                        , intopt_to_json fh.h_on_behalf_of_comp_id                              );
        ( "deliver_to_comp_id"                          , intopt_to_json fh.h_deliver_to_comp_id                                );
        ( "secure_data_len"                             , intopt_to_json fh.h_secure_data_len                                   );
        ( "secure_data"                                 , intopt_to_json fh.h_secure_data                                       );
        ( "sender_sub_id"                               , intopt_to_json fh.h_sender_sub_id                                     );
        ( "sender_location_id"                          , intopt_to_json fh.h_sender_location_id                                );
        ( "target_sub_id"                               , intopt_to_json fh.h_target_sub_id                                     );
        ( "target_location_id"                          , intopt_to_json fh.h_target_location_id                                );
        ( "on_behalf_of_sub_id"                         , intopt_to_json fh.h_on_behalf_of_sub_id                               );
        ( "on_behalf_of_location_id"                    , intopt_to_json fh.h_on_behalf_of_location_id                          );
        ( "deliver_to_sub_id"                           , intopt_to_json fh.h_deliver_to_sub_id                                 );
        ( "deliver_to_location_id"                      , intopt_to_json fh.h_deliver_to_location_id                            );   
        ( "poss_dup_flag"                               , boolopt_to_json fh.h_poss_dup_flag                                    );
        ( "poss_resend"                                 , boolopt_to_json fh.h_poss_resend                                      );             
        ( "sending_time"                                , intopt_to_json fh.h_sending_time                                      );
        ( "orig_sending_time"                           , intopt_to_json fh.h_orig_sending_time                                 );
        ( "xml_data_len"                                , intopt_to_json fh.h_xml_data_len                                      );
        ( "xml_data"                                    , intopt_to_json fh.h_xml_data                                          );
        ( "message_enconding"                           , intopt_to_json fh.h_message_enconding                                 );
        ( "last_msg_seq_num_processed"                  , intopt_to_json fh.h_last_msg_seq_num_processed                        );
        ( "no_hops"                                     , intopt_to_json fh.h_no_hops                                           );
        ] |> filter_nulls
        in
    `Assoc list_assoc
;;

let full_fix_msg_to_json ( m : full_fix_msg) = 
    `Assoc [
        ( "header"                                      , ( header_to_json m.full_msg_header )                                  );
        ( "msg_data"                                    , ( msg_data_to_json m.full_msg_data )                                  );
        ( "trailer"                                     , ( trailer_to_json m.full_msg_trailer )                                );
    ]
;;


let full_fix_msg_list_to_json msgs = 
    `List ( List.map full_fix_msg_to_json msgs )
;;


let business_rejected_msg_to_json x =
    let list_assoc = [
        ( "brej_msg_ref_seq_num"                        , `Int x.brej_msg_ref_seq_num                                           );
        ( "brej_msg_msg_tag"                            , `String ( msg_tag_to_string x.brej_msg_msg_tag )                      );
        ( "brej_msg_reject_reason"                      , `String ( busines_reject_reason_to_string x.brej_msg_reject_reason )  );
        ( "brej_msg_text"                               , intopt_to_json x.brej_msg_text                                        );
        ( "brej_msg_encoded_text"                       , intopt_to_json x.brej_msg_encoded_text                                );
    ] |> filter_nulls in
    `Assoc list_assoc
;;

let session_rejected_data_to_json x =
    `Assoc [
        ( "srej_msg_msg_seq_num"                        , `Int x.srej_msg_msg_seq_num                                           );
        ( "srej_msg_field_tag"                          , `String ( fix_field_to_string x.srej_msg_field_tag)                   );
        ( "srej_msg_msg_type"                           , `String ( msg_tag_to_string x.srej_msg_msg_type )                     );
        ( "srej_msg_reject_reason"                      , `String ( fix_session_reject_to_string x.srej_msg_reject_reason )     );
        ( "srej_text"                                   , `Int x.srej_text                                                      );
        ( "srej_encoded_text_len"                       , `Int x.srej_encoded_text_len                                          );
        ( "srej_encoded_text"                           , `Int x.srej_encoded_text                                              );
    ]
;;

let full_fix_msg_opt_to_json = 
    function None -> `Null | Some m -> full_fix_msg_to_json (m)
;;

let full_top_level_msg_to_json = function
    | ValidMsg x                                        -> `Assoc [ ( "valid_msg"         , full_fix_msg_to_json x )            ]
    | SessionRejectedMsg x                              -> `Assoc [ ( "session_rejected"  , (session_rejected_data_to_json x) ) ]
    | BusinessRejectedMsg x                             -> `Assoc [ ( "business_rejected" , (business_rejected_msg_to_json x) ) ]
    | Gargled                                           -> `String "gargled"
;;

let full_top_level_msg_opt_to_json = function
    | None                                              -> `Null
    | Some m                                            -> full_top_level_msg_to_json (m)
;;

let full_top_level_msg_to_str ( m : full_top_level_msg ) : string =
    Yojson.Basic.pretty_to_string ( full_top_level_msg_to_json m )
;;

let fill_top_level_msg_list_to_string msgs = 
    String.concat "\n" ( List.map full_top_level_msg_to_str msgs )
;;

let full_top_level_msg_list_to_json msgs = 
    `List ( List.map full_top_level_msg_to_json msgs )
;;

