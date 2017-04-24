
type full_admin_msg_tag = 
    | Full_Msg_Heartbeat_Tag
    | Full_Msg_Logon_Tag
    | Full_Msg_Logoff_Tag
    | Full_Msg_Reject_Tag
    | Full_Msg_Business_Reject_Tag
    | Full_Msg_Resend_Request_Tag
    | Full_Msg_Sequence_Reset_Tag
    | Full_Msg_Test_Request_Tag
;;


type full_msg_heartbeat_field_tag = 
    | Full_Msg_Heartbeat_TestReqID_Tag 
;;

type full_msg_logon_field_tag = 
    | Full_Msg_Logon_EncryptMethod_Tag
    | Full_Msg_Logon_HeartBtInt_Tag 
    | Full_Msg_Logon_RawDataLength_Tag 
    | Full_Msg_Logon_RawData_Tag 
    | Full_Msg_Logon_ResetSeqNumFlag_Tag 
    | Full_Msg_Logon_NextExpectedMsgSeqNum_Tag 
    | Full_Msg_Logon_MaxMessageSize_Tag 
    | Full_Msg_Logon_TestMessageIndicator_Tag 
    | Full_Msg_Logon_Username_Tag 
    | Full_Msg_Logon_Password_Tag 
;;

type full_msg_logoff_field_tag = 
    | Full_Msg_Logoff_EncodedText_Tag
    | Full_Msg_Logoff_EncodedTextLen_Tag
;;

(** Resend Request message data. *)
type full_msg_resend_request_field_tag = 
    | Full_Msg_Resend_Request_BeginSeqNo_Tag                               
    | Full_Msg_Resend_Request_EndSeqNo_Tag
;;

(** Reject message data. *)
type full_msg_reject_field_tag = 
    | Full_Msg_Reject_RefSeqNum_Tag
    | Full_Msg_Reject_RefTagID_Tag
    | Full_Msg_Reject_RefMsgType_Tag
    | Full_Msg_Reject_SessionRejectReason_Tag
    | Full_Msg_Reject_Text_Tag
    | Full_Msg_Reject_EncodedTextLen_Tag
    | Full_Msg_Reject_EncodedText_Tag
;;

(** Sequence Reset message data. *)
type full_msg_sequence_reset_field_tag = 
    | Full_Msg_Sequence_Reset_GapFillFlag_Tag
    | Full_Msg_Sequence_Reset_NewSeqNo_Tag 
;;

(** Test Request message data.  *)
type full_msg_test_request_field_tag = 
    | Full_Msg_Test_Request_TestReqID_Tag
;;

(** Business Reject message data. *)
type full_msg_business_reject_field_tag = 
    | Full_Msg_Business_Reject_RefSeqNum_Tag
    | Full_Msg_Business_Reject_BusinessRejectReason_Tag
;;

type full_admin_field_tag =
    | Full_Msg_Heartbeat_Field_Tag       of full_msg_heartbeat_field_tag       
    | Full_Msg_Logon_Field_Tag           of full_msg_logon_field_tag          
    | Full_Msg_Logoff_Field_Tag          of full_msg_logoff_field_tag         
    | Full_Msg_Reject_Field_Tag          of full_msg_reject_field_tag         
    | Full_Msg_Business_Reject_Field_Tag of full_msg_business_reject_field_tag
    | Full_Msg_Resend_Request_Field_Tag  of full_msg_resend_request_field_tag 
    | Full_Msg_Sequence_Reset_Field_Tag  of full_msg_sequence_reset_field_tag 
    | Full_Msg_Test_Request_Field_Tag    of full_msg_test_request_field_tag   
;;


