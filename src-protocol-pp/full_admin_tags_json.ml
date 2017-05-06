(** *)
(*** 

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017
    
    full_admin_tags_json.ml

*)

open Yojson;;
open Full_admin_tags;;

(** *)
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

(** *)
let full_admin_field_tag_to_string = function
    | Full_Msg_BeginSeqNo_Tag            -> "BeginSeqNo_Tag"
    | Full_Msg_BusinessRejectReason_Tag  -> "BusinessRejectReason_Tag"
    | Full_Msg_EncodedTextLen_Tag        -> "EncodedTextLen_Tag"
    | Full_Msg_EncodedText_Tag           -> "EncodedText_Tag"
    | Full_Msg_EncryptMethod_Tag         -> "EncryptMethod_Tag"
    | Full_Msg_EndSeqNo_Tag              -> "EndSeqNo_Tag"
    | Full_Msg_GapFillFlag_Tag           -> "GapFillFlag_Tag"
    | Full_Msg_HeartBtInt_Tag            -> "HeartBtInt_Tag"
    | Full_Msg_MaxMessageSize_Tag        -> "MaxMessageSize_Tag"
    | Full_Msg_NewSeqNo_Tag              -> "NewSeqNo_Tag"
    | Full_Msg_NextExpectedMsgSeqNum_Tag -> "NextExpectedMsgSeqNum_Tag"
    | Full_Msg_Password_Tag              -> "Password_Tag"
    | Full_Msg_RawDataLength_Tag         -> "RawDataLength_Tag"
    | Full_Msg_RawData_Tag               -> "RawData_Tag"
    | Full_Msg_RefMsgType_Tag            -> "RefMsgType_Tag"
    | Full_Msg_RefSeqNum_Tag             -> "RefSeqNum_Tag"
    | Full_Msg_RefTagID_Tag              -> "RefTagID_Tag"
    | Full_Msg_ResetSeqNumFlag_Tag       -> "ResetSeqNumFlag_Tag"
    | Full_Msg_SessionRejectReason_Tag   -> "SessionRejectReason_Tag"
    | Full_Msg_TestMessageIndicator_Tag  -> "TestMessageIndicator_Tag"
    | Full_Msg_TestReqID_Tag             -> "TestReqID_Tag"
    | Full_Msg_Text_Tag                  -> "Text_Tag"
    | Full_Msg_Username_Tag              -> "Username_Tag"
;;

(** *)
let full_admin_msg_tag_to_json x : json = `String (full_admin_msg_tag_to_string x);;
(** *)
let full_admin_msg_tag_opt_to_json = function None -> `Null | Some x -> full_admin_msg_tag_to_json x;;

(** *)
let full_admin_field_tag_to_json x : json = `String (full_admin_field_tag_to_string x );;
(** *)
let full_admin_field_tag_opt_to_json = function None -> `Null | Some x -> full_admin_field_tag_to_json x ;;
