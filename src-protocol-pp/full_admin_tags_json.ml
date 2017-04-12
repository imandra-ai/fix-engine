(* @meta[imandra_ignore] on @end *)
open Yojson;;
open Full_admin_tags;;
(* @meta[imandra_ignore] off @end *)


let full_admin_msg_tag_to_string = function
    | Full_Msg_Heartbeat_Tag       -> "Heartbeat_Tag"      
    | Full_Msg_Logon_Tag           -> "Logon_Tag"          
    | Full_Msg_Logoff_Tag          -> "Logoff_Tag"         
    | Full_Msg_Reject_Tag          -> "Reject_Tag"         
    | Full_Msg_Business_Reject_Tag -> "Business_Reject_Tag"
    | Full_Msg_Resend_Request_Tag  -> "Resend_Request_Tag" 
    | Full_Msg_Sequence_Reset_Tag  -> "Sequence_Reset_Tag" 
    | Full_Msg_Test_Request_Tag    -> "Test_Request_Tag"   
;;


let full_msg_heartbeat_field_tag_to_string = function
    | Full_Msg_Heartbeat_TestReqID_Tag -> "Heartbeat_TestReqID_Tag"
;;

let full_msg_logon_field_tag_to_string = function
    | Full_Msg_Logon_EncryptMethod_Tag         -> "EncryptMethod_Tag"        
    | Full_Msg_Logon_HeartBtInt_Tag            -> "HeartBtInt_Tag"           
    | Full_Msg_Logon_RawDataLength_Tag         -> "RawDataLength_Tag"        
    | Full_Msg_Logon_RawData_Tag               -> "RawData_Tag"              
    | Full_Msg_Logon_ResetSeqNumFlag_Tag       -> "ResetSeqNumFlag_Tag"      
    | Full_Msg_Logon_NextExpectedMsgSeqNum_Tag -> "NextExpectedMsgSeqNum_Tag"
    | Full_Msg_Logon_MaxMessageSize_Tag        -> "MaxMessageSize_Tag"       
    | Full_Msg_Logon_TestMessageIndicator_Tag  -> "TestMessageIndicator_Tag" 
    | Full_Msg_Logon_Username_Tag              -> "Username_Tag"             
    | Full_Msg_Logon_Password_Tag              -> "Password_Tag"             
;;

let full_msg_logoff_field_tag_to_string = function
    | Full_Msg_Logoff_EncodedText_Tag     -> "EncodedText_Tag"   
    | Full_Msg_Logoff_EncodedTextLen_Tag  -> "EncodedTextLen_Tag"
;;

let full_msg_resend_request_field_tag_to_string = function
    | Full_Msg_Resend_Request_BeginSeqNo_Tag -> "BeginSeqNo_Tag"
    | Full_Msg_Resend_Request_EndSeqNo_Tag   -> "EndSeqNo_Tag"  
;;

let full_msg_reject_field_tag_to_string = function
    | Full_Msg_Reject_RefSeqNum_Tag            -> "RefSeqNum_Tag"          
    | Full_Msg_Reject_RefTagID_Tag             -> "RefTagID_Tag"           
    | Full_Msg_Reject_RefMsgType_Tag           -> "RefMsgType_Tag"         
    | Full_Msg_Reject_SessionRejectReason_Tag  -> "SessionRejectReason_Tag"
    | Full_Msg_Reject_Text_Tag                 -> "Text_Tag"               
    | Full_Msg_Reject_EncodedTextLen_Tag       -> "EncodedTextLen_Tag"     
    | Full_Msg_Reject_EncodedText_Tag          -> "EncodedText_Tag"        
;;

let full_msg_sequence_reset_field_tag_to_string = function
    | Full_Msg_Sequence_Reset_GapFillFlag_Tag  -> "Sequence_Reset_GapFillFlag_Tag"
    | Full_Msg_Sequence_Reset_NewSeqNo_Tag     -> "Sequence_Reset_NewSeqNo_Tag"   
;;

let full_msg_test_request_field_tag_to_string = function
    | Full_Msg_Test_Request_TestReqID_Tag      -> "Test_Request_TestReqID_Tag" 
;;

let full_msg_business_reject_field_tag_to_string = function
    | Full_Msg_Business_Reject_RefSeqNum_Tag            -> "Business_Reject_RefSeqNum_Tag"           
    | Full_Msg_Business_Reject_BusinessRejectReason_Tag -> "Business_Reject_BusinessRejectReason_Tag"
;;

let full_admin_field_tag_to_string = function
    | Full_Msg_Heartbeat_Field_Tag       x ->  full_msg_heartbeat_field_tag_to_string x         
    | Full_Msg_Logon_Field_Tag           x ->  full_msg_logon_field_tag_to_string x           
    | Full_Msg_Logoff_Field_Tag          x ->  full_msg_logoff_field_tag_to_string x          
    | Full_Msg_Reject_Field_Tag          x ->  full_msg_reject_field_tag_to_string x          
    | Full_Msg_Business_Reject_Field_Tag x ->  full_msg_business_reject_field_tag_to_string x 
    | Full_Msg_Resend_Request_Field_Tag  x ->  full_msg_resend_request_field_tag_to_string x   
    | Full_Msg_Sequence_Reset_Field_Tag  x ->  full_msg_sequence_reset_field_tag_to_string x  
    | Full_Msg_Test_Request_Field_Tag    x ->  full_msg_test_request_field_tag_to_string x    
;;

let full_admin_msg_tag_to_json x : json = `String (full_admin_msg_tag_to_string x);;
let full_admin_msg_tag_opt_to_json = function None -> `Null | Some x -> full_admin_msg_tag_to_json x;;

let full_admin_field_tag_to_json x : json = `String (full_admin_field_tag_to_string x );;
let full_admin_field_tag_opt_to_json = function None -> `Null | Some x -> full_admin_field_tag_to_json x ;;
