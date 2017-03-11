(** 

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    Contains implementation of the 'full' FIX messages.

    full_messages.ml
    
*)

(* @meta[imandra_ignore] on @end *)
open Basic_types;;
open Datetime;;
open Full_session_core;;
open Full_fix_fields;;
open Full_admin_messages;;
open Full_app_messages;;
(* @meta[imandra_ignore] off @end *)

(** Contains the missing field information. *)
type full_field_missing_data = {
    field_missing_field                             : full_fix_field;
    field_missing_msg                               : full_fix_msg_tag;
}
;;

(** *)
type full_fix_msg_data = 
    | Full_FIX_Admin_Msg                            of full_fix_admin_msg_data
    | Full_FIX_App_Msg                              of full_fix_app_msg_data
;;

(** Applicatoin messages *)
type full_fix_msg = {
    full_msg_header                                 : fix_header;
    full_msg_data                                   : full_fix_msg_data;
    full_msg_trailer                                : fix_trailer;
}
;;

let get_full_msg_tag ( m : full_fix_msg_data ) =
    match m with
    | Full_FIX_Admin_Msg msg -> (
        match msg with 
        | Full_Msg_Hearbeat                     _ -> Full_Msg_Hearbeat_Tag
        | Full_Msg_Logon                        _ -> Full_Msg_Logon_Tag
        | Full_Msg_Logoff                       _ -> Full_Msg_Logoff_Tag
        | Full_Msg_Reject                       _ -> Full_Msg_Reject_Tag 
        | Full_Msg_Business_Reject              _ -> Full_Msg_Business_Reject_Tag
        | Full_Msg_Resend_Request               _ -> Full_Msg_Resend_Request_Tag
        | Full_Msg_Sequence_Reset               _ -> Full_Msg_Sequence_Reset_Tag
        | Full_Msg_Test_Request                 _ -> Full_Msg_Test_Request_Tag
     )
    | Full_FIX_App_Msg msg -> (
        match msg with
        | Full_Msg_ExecutionReport              _ -> Full_Msg_ExecutionReport_Tag
        | Full_Msg_OrderCancelRequest           _ -> Full_Msg_OrderCancelRequest_Tag
        | Full_Msg_OrderCancelReplaceRequest    _ -> Full_Msg_OrderCancelReplaceRequest_Tag
        | Full_Msg_NewOrderSingle               _ -> Full_Msg_NewOrderSingle_Tag
        | Full_Msg_CancelReject                 _ -> Full_Msg_CancelReject_Tag
     )
;;

(** 
    Note that information contained in the data structures for Business and Session
        Rejected messages should be enough to send out the 'Reject' and 'BusinessReject' messages.

    Reject message

    45	RefSeqNum               - Required - MsgSeqNum <34> of rejected message
    371	RefTagID                - Optional - The tag number of the FIX field being referenced.
    372	RefMsgType              - Optional - The MsgType <35> of the FIX message being referenced.
    373	SessionRejectReason	    - Optional - Code to identify reason for a session-level Reject <3> message.
    58	Text	                - Optional - Where possible, message to explain reason for rejection
    354	EncodedTextLen	        - Optional - Must be set if EncodedText <355> field is specified and must immediately precede it.
    355	EncodedText	            - Optional - Encoded (non-ASCII characters) representation of the Text <58> field in the encoded 
                                                format specified via the MessageEncoding <347> field. *)
type session_rejected_msg_data = {
    srej_msg_msg_seq_num                            : int;
    srej_msg_field_tag                              : full_fix_field;
    srej_msg_msg_type                               : full_fix_msg_tag;
    srej_msg_reject_reason                          : fix_session_reject_reason;
    srej_text                                       : fix_string;
    srej_encoded_text_len                           : int;
    srej_encoded_text                               : fix_string;
}
;;

(** 
    Business Reject message

    45	RefSeqNum	            - Optional - MsgSeqNum <34> of rejected message
    372	RefMsgType	Y	        - Required - The MsgType <35> of the FIX message being referenced.
    379	BusinessRejectRefID	    - Optional - The value of the business-level 'ID' field on the message being referenced. 
                                                Required unless the corresponding ID field (see list above) was not specified.
    380	BusinessRejectReason    - Required - Code to identify reason for a Business Message Reject <j> message.
    58	Text	                - Optional - Where possible, message to explain reason for rejection
    354	EncodedTextLen	        - Optional - Must be set if EncodedText <355> field is specified and must immediately precede it.
    355	EncodedText	            - Optional - Encoded (non-ASCII characters) representation of the Text <58> field in the encoded 
                                                format specified via the MessageEncoding <347> field. *)
type biz_rejected_msg_data = {
    brej_msg_ref_seq_num                            : int;
    brej_msg_msg_tag                                : full_fix_msg_tag;
    brej_msg_reject_reason                          : fix_business_reject_reason;
    brej_msg_text                                   : fix_string option;
    brej_msg_encoded_text                           : fix_string option;
}
;;

(** *)
type full_top_level_msg = 
    | ValidMsg                                      of full_fix_msg
    | SessionRejectedMsg                            of session_rejected_msg_data
    | BusinessRejectedMsg                           of biz_rejected_msg_data
    | Gargled
;;
