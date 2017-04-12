(* @meta[imandra_ignore] on @end *)
open Full_admin_tags;;
(* @meta[imandra_ignore] off @end *)

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


let parse_full_msg_heartbeat_field_tag = function
    | "112" -> Some Full_Msg_Heartbeat_TestReqID_Tag 
    |    _  -> None
;;

let parse_full_msg_logon_field_tag = function
    | "98"  -> Some Full_Msg_Logon_EncryptMethod_Tag         
    | "108" -> Some Full_Msg_Logon_HeartBtInt_Tag            
    | "95"  -> Some Full_Msg_Logon_RawDataLength_Tag         
    | "96"  -> Some Full_Msg_Logon_RawData_Tag               
    | "141" -> Some Full_Msg_Logon_ResetSeqNumFlag_Tag       
    | "789" -> Some Full_Msg_Logon_NextExpectedMsgSeqNum_Tag 
    | "383" -> Some Full_Msg_Logon_MaxMessageSize_Tag        
    | "464" -> Some Full_Msg_Logon_TestMessageIndicator_Tag  
    | "553" -> Some Full_Msg_Logon_Username_Tag              
    | "554" -> Some Full_Msg_Logon_Password_Tag              
    |    _  -> None
;;

let parse_full_msg_logoff_field_tag = function
    | "355" -> Some Full_Msg_Logoff_EncodedText_Tag   
    | "354" -> Some Full_Msg_Logoff_EncodedTextLen_Tag
    |    _  -> None
;;

let parse_full_msg_resend_request_field_tag = function
    | "7"   -> Some Full_Msg_Resend_Request_BeginSeqNo_Tag 
    | "16"  -> Some Full_Msg_Resend_Request_EndSeqNo_Tag   
    |    _  -> None
;;

let parse_full_msg_reject_field_tag = function
    | "45"  -> Some Full_Msg_Reject_RefSeqNum_Tag          
    | "371" -> Some Full_Msg_Reject_RefTagID_Tag           
    | "372" -> Some Full_Msg_Reject_RefMsgType_Tag         
    | "373" -> Some Full_Msg_Reject_SessionRejectReason_Tag
    | "58"  -> Some Full_Msg_Reject_Text_Tag               
    | "354" -> Some Full_Msg_Reject_EncodedTextLen_Tag     
    | "355" -> Some Full_Msg_Reject_EncodedText_Tag        
    |    _  -> None
;;

let parse_full_msg_sequence_reset_field_tag = function
    | "123" -> Some Full_Msg_Sequence_Reset_GapFillFlag_Tag  
    | "36"  -> Some Full_Msg_Sequence_Reset_NewSeqNo_Tag     
    |    _  -> None
;;

let parse_full_msg_test_request_field_tag = function
    | "112" -> Some Full_Msg_Test_Request_TestReqID_Tag      
    |    _  -> None
;;

let parse_full_msg_business_reject_field_tag = function
    | "45"  -> Some Full_Msg_Business_Reject_RefSeqNum_Tag            
    | "380" -> Some Full_Msg_Business_Reject_BusinessRejectReason_Tag 
    |    _  -> None
;;

let parse_full_admin_tags msg_tag fld_tag = match msg_tag with
    | "0" -> ( match parse_full_msg_heartbeat_field_tag       fld_tag with None -> None | Some x -> Some ( Full_Msg_Heartbeat_Field_Tag       x ) )
    | "1" -> ( match parse_full_msg_test_request_field_tag    fld_tag with None -> None | Some x -> Some ( Full_Msg_Test_Request_Field_Tag    x ) )    
    | "2" -> ( match parse_full_msg_resend_request_field_tag  fld_tag with None -> None | Some x -> Some ( Full_Msg_Resend_Request_Field_Tag  x ) )   
    | "3" -> ( match parse_full_msg_reject_field_tag          fld_tag with None -> None | Some x -> Some ( Full_Msg_Reject_Field_Tag          x ) )          
    | "4" -> ( match parse_full_msg_sequence_reset_field_tag  fld_tag with None -> None | Some x -> Some ( Full_Msg_Sequence_Reset_Field_Tag  x ) )  
    | "5" -> ( match parse_full_msg_logon_field_tag           fld_tag with None -> None | Some x -> Some ( Full_Msg_Logon_Field_Tag           x ) )           
    | "A" -> ( match parse_full_msg_logoff_field_tag          fld_tag with None -> None | Some x -> Some ( Full_Msg_Logoff_Field_Tag          x ) )          
    | "j" -> ( match parse_full_msg_business_reject_field_tag fld_tag with None -> None | Some x -> Some ( Full_Msg_Business_Reject_Field_Tag x ) ) 
    |  _  -> None
;;

