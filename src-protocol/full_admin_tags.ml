
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


type full_admin_field_tag =
    | Full_Msg_BeginSeqNo_Tag                               
    | Full_Msg_BusinessRejectReason_Tag
    | Full_Msg_EncodedTextLen_Tag
    | Full_Msg_EncodedText_Tag
    | Full_Msg_EncryptMethod_Tag
    | Full_Msg_EndSeqNo_Tag
    | Full_Msg_GapFillFlag_Tag
    | Full_Msg_HeartBtInt_Tag 
    | Full_Msg_MaxMessageSize_Tag 
    | Full_Msg_NewSeqNo_Tag 
    | Full_Msg_NextExpectedMsgSeqNum_Tag 
    | Full_Msg_Password_Tag 
    | Full_Msg_RawDataLength_Tag 
    | Full_Msg_RawData_Tag 
    | Full_Msg_RefMsgType_Tag
    | Full_Msg_RefSeqNum_Tag
    | Full_Msg_RefTagID_Tag
    | Full_Msg_ResetSeqNumFlag_Tag 
    | Full_Msg_SessionRejectReason_Tag
    | Full_Msg_TestMessageIndicator_Tag 
    | Full_Msg_TestReqID_Tag 
    | Full_Msg_Text_Tag
    | Full_Msg_Username_Tag 
;;

