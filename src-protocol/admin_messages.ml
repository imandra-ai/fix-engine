(** Full messages - administrative *)
(***

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017
    
    full_admin_messages.ml

*)

(* @meta[imandra_ignore] on @end *)
open Basic_types;;
open Datetime;;
open Full_session_core;;
open Full_fix_fields;;
(* @meta[imandra_ignore] off @end *)

(** Message tags - a way for us to identify messages without their full data. *)
type full_fix_msg_tag = 
    | Full_Msg_ExecutionReport_Tag
    | Full_Msg_OrderCancelRequest_Tag
    | Full_Msg_OrderCancelReplaceRequest_Tag
    | Full_Msg_NewOrderSingle_Tag
    | Full_Msg_CancelReject_Tag
    | Full_Msg_BusinessReject_Tag
    | Full_Msg_Hearbeat_Tag
    | Full_Msg_Logon_Tag
    | Full_Msg_Logoff_Tag
    | Full_Msg_Reject_Tag
    | Full_Msg_Business_Reject_Tag
    | Full_Msg_Resend_Request_Tag
    | Full_Msg_Sequence_Reset_Tag
    | Full_Msg_Test_Request_Tag
;;

(** *)
type full_fix_msg_heartbeat_data = {
    hb_test_req_id                                  : int option;                       (** Tag 112: Required when the heartbeat 
                                                                                            is the result of a Test Request message. *)
}
;;

(** *)
type full_fix_msg_logon_data = {
    ln_encrypt_method                               : fix_encryption_method;            (** Tag  98 *)
    ln_heartbeat_interval                           : fix_duration;                     (** Tag 108 *)
    ln_raw_data_length                              : int option;                       (** Tag  95 *)
    ln_raw_data                                     : fix_string option;                (** Tag  96 *)
    ln_reset_seq_num_flag                           : int option;                       (** Tag 141 *)
    ln_next_expected_msg_seq_num                    : int option;                       (** Tag 789 *)
    ln_max_message_size                             : int option;                       (** Tag 383 *)

    ln_test_message_indicator                       : bool option;                      (** Tag 464 *)
    ln_username                                     : fix_string option;                (** Tag 553 *)
    ln_password                                     : fix_string option;                (** Tag 554 *)
}
;;

(**  *)
type full_fix_msg_logoff_data = {
    lo_encoded_text_len                             : int option;                       (** Tag 354 *)
    lo_encoded_text                                 : fix_string option;                (** Tag 355 *)
}
;;

(**  *)
type full_fix_msg_reject_data = {
    sr_ref_seq_num                                  : int;                              (** Tag 45. MsgSeqNum of rejected message. *)
    sr_ref_tag_id                                   : fix_string;                       (** *)
    sr_ref_msg_type                                 : full_fix_msg_tag option;          (** *)
    sr_session_reject_reason                        : fix_session_reject_reason option; (** Tag 373. *)
    sr_text                                         : fix_string option;                (** *)
    sr_encoded_text_len                             : int option;                       (** *)
    sr_encoded_text                                 : fix_string;                       (** *)
}
;;

(**  *)
type full_fix_msg_business_reject_data = {
    br_ref_seq_num                                  : int;                              (** Tag 45: reference seq number 
                                                                                            of the rejected message *)
    br_business_reject_reason                       : fix_business_reject_reason;       (** TODO Need to add message type here as well. *)
}
;;

(**  *)
type full_fix_msg_resend_request_data = {
    rr_begin_seq_num                                : int;                              (** Tag 7 *)
    rr_end_seq_num                                  : int;                              (** Tag 16 *)
}
;;

(**  *)
type full_fix_msg_sequence_reset_data = {
    seqr_new_seq_no                                 : int;                              (** Tag 36 *)
    seqr_gap_fill_flag                              : fix_yes_no_type option;           (** Tag 123 *)
}
;;

(**  *)
type full_fix_msg_test_request_data = {
    test_req_id                                     : int;                              (** Tag 112 *)
}
;;

(** *)
type full_fix_admin_msg_data = 
    | Full_Msg_Hearbeat                              of full_fix_msg_heartbeat_data
    | Full_Msg_Logon                                 of full_fix_msg_logon_data
    | Full_Msg_Logoff                                of full_fix_msg_logoff_data
    | Full_Msg_Reject                                of full_fix_msg_reject_data
    | Full_Msg_Business_Reject                       of full_fix_msg_business_reject_data
    | Full_Msg_Resend_Request                        of full_fix_msg_resend_request_data
    | Full_Msg_Sequence_Reset                        of full_fix_msg_sequence_reset_data
    | Full_Msg_Test_Request                          of full_fix_msg_test_request_data
;;