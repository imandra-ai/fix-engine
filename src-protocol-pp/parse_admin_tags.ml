(** Parse full administrative tags. *)
(***

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017
    
    parse_admin_tags.ml

*)

open Full_admin_tags;;


let parse_admin_msg_tag = function
    |   "0" -> Some Full_Msg_Heartbeat_Tag       
    |   "1" -> Some Full_Msg_Test_Request_Tag    
    |   "2" -> Some Full_Msg_Resend_Request_Tag  
    |   "3" -> Some Full_Msg_Reject_Tag          
    |   "4" -> Some Full_Msg_Sequence_Reset_Tag  
    |   "5" -> Some Full_Msg_Logoff_Tag          
    |   "A" -> Some Full_Msg_Logon_Tag           
    |   "j" -> Some Full_Msg_Business_Reject_Tag 
    |    _  -> None
;;


let parse_admin_field_tag = function
    | "108" -> Some Full_Msg_HeartBtInt_Tag
    | "112" -> Some Full_Msg_TestReqID_Tag
    | "123" -> Some Full_Msg_GapFillFlag_Tag
    | "141" -> Some Full_Msg_ResetSeqNumFlag_Tag
    | "16"  -> Some Full_Msg_EndSeqNo_Tag
    | "354" -> Some Full_Msg_EncodedTextLen_Tag
    | "355" -> Some Full_Msg_EncodedText_Tag
    | "36"  -> Some Full_Msg_NewSeqNo_Tag
    | "372" -> Some Full_Msg_RefMsgType_Tag
    | "373" -> Some Full_Msg_SessionRejectReason_Tag
    | "380" -> Some Full_Msg_BusinessRejectReason_Tag
    | "383" -> Some Full_Msg_MaxMessageSize_Tag
    | "45"  -> Some Full_Msg_RefSeqNum_Tag
    | "464" -> Some Full_Msg_TestMessageIndicator_Tag
    | "553" -> Some Full_Msg_Username_Tag
    | "554" -> Some Full_Msg_Password_Tag
    | "58"  -> Some Full_Msg_Text_Tag
    | "7"   -> Some Full_Msg_BeginSeqNo_Tag
    | "789" -> Some Full_Msg_NextExpectedMsgSeqNum_Tag
    | "95"  -> Some Full_Msg_RawDataLength_Tag
    | "96"  -> Some Full_Msg_RawData_Tag
    | "98"  -> Some Full_Msg_EncryptMethod_Tag
    | "371" -> Some Full_Msg_RefTagID_Tag  
    |    _  -> None
;;


