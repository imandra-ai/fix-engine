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
    | "7"   -> Some Full_Msg_BeginSeqNo_Tag
    | "8"   -> Some Full_Msg_BeginString_Tag
    | "9"   -> Some Full_Msg_BodyLength_Tag
    | "10"  -> Some Full_Msg_CheckSum_Tag       
    | "16"  -> Some Full_Msg_EndSeqNo_Tag
    | "34"  -> Some Full_Msg_MsgSeqNum_Tag                 
    | "36"  -> Some Full_Msg_NewSeqNo_Tag
    | "43"  -> Some Full_Msg_PossDupFlag_Tag                   
    | "45"  -> Some Full_Msg_RefSeqNum_Tag
    | "49"  -> Some Full_Msg_SenderCompID_Tag              
    | "50"  -> Some Full_Msg_SenderSubID_Tag                  
    | "52"  -> Some Full_Msg_SendingTime_Tag                   
    | "56"  -> Some Full_Msg_TargetCompID_Tag              
    | "57"  -> Some Full_Msg_TargetSubID_Tag                  
    | "58"  -> Some Full_Msg_Text_Tag
    | "89"  -> Some Full_Msg_Signature_Tag
    | "90"  -> Some Full_Msg_SecureDataLen_Tag                
    | "91"  -> Some Full_Msg_SecureData_Tag                    
    | "93"  -> Some Full_Msg_SignatureLength_Tag
    | "95"  -> Some Full_Msg_RawDataLength_Tag
    | "96"  -> Some Full_Msg_RawData_Tag
    | "97"  -> Some Full_Msg_PossResend_Tag                     
    | "98"  -> Some Full_Msg_EncryptMethod_Tag
    | "108" -> Some Full_Msg_HeartBtInt_Tag
    | "112" -> Some Full_Msg_TestReqID_Tag
    | "114" -> Some Full_Msg_OnBehalfOfLocationID_Tag      
    | "115" -> Some Full_Msg_OnBehalfOfCompID_Tag         
    | "116" -> Some Full_Msg_OnBehalfOfSubID_Tag           
    | "122" -> Some Full_Msg_OrigSendingTime_Tag             
    | "123" -> Some Full_Msg_GapFillFlag_Tag
    | "128" -> Some Full_Msg_DeliverToCompID_Tag            
    | "129" -> Some Full_Msg_DeliverToSubID_Tag             
    | "141" -> Some Full_Msg_ResetSeqNumFlag_Tag
    | "142" -> Some Full_Msg_SenderLocationID_Tag            
    | "143" -> Some Full_Msg_TargetLocationID_Tag            
    | "145" -> Some Full_Msg_DeliverToLocationID_Tag        
    | "212" -> Some Full_Msg_XMLDataLen_Tag                  
    | "213" -> Some Full_Msg_XMLData_Tag                      
    | "347" -> Some Full_Msg_MessageEnconding_Tag             
    | "354" -> Some Full_Msg_EncodedTextLen_Tag
    | "355" -> Some Full_Msg_EncodedText_Tag
    | "369" -> Some Full_Msg_LastMsgSeqNumProcessed_Tag    
    | "371" -> Some Full_Msg_RefTagID_Tag  
    | "372" -> Some Full_Msg_RefMsgType_Tag
    | "373" -> Some Full_Msg_SessionRejectReason_Tag
    | "380" -> Some Full_Msg_BusinessRejectReason_Tag
    | "383" -> Some Full_Msg_MaxMessageSize_Tag
    | "464" -> Some Full_Msg_TestMessageIndicator_Tag
    | "553" -> Some Full_Msg_Username_Tag
    | "554" -> Some Full_Msg_Password_Tag
    | "627" -> Some Full_Msg_NoHops_Tag                      
    | "789" -> Some Full_Msg_NextExpectedMsgSeqNum_Tag          
    |    _  -> None
;;

