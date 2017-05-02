(** Parse full administrative messages. *)
(***

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017
    
    parse_admin_messages.ml

*)

(* @meta[imandra_ignore] on @end *)
open Full_admin_tags;;
open Full_admin_messages;;
open Parser_utils.Parse_field_result;;
open Parser_utils.Parse_message_result;;
open Parse_base_types;;
open Parse_datetime;;
open Parse_admin_enums;;
open Parse_full_tags;;
(* @meta[imandra_ignore] off @end *)

let parse_msg_heartbeat_data msg =
    from_parse_field_result @@
    opt msg "112" parse_int @@ fun hb_test_req_id ->
    ParseFieldSuccess { hb_test_req_id }
;;

let parse_msg_logon_data msg =
    from_parse_field_result @@
    req msg "98"  parse_encryption_method @@ fun ln_encrypt_method            ->
    req msg "108" parse_Duration          @@ fun ln_heartbeat_interval        ->
    opt msg "95"  parse_int               @@ fun ln_raw_data_length           ->
    opt msg "96"  parse_string               @@ fun ln_raw_data                  ->
    opt msg "141" parse_int               @@ fun ln_reset_seq_num_flag        ->
    opt msg "789" parse_int               @@ fun ln_next_expected_msg_seq_num ->
    opt msg "383" parse_int               @@ fun ln_max_message_size          ->
    opt msg "464" parse_bool              @@ fun ln_test_message_indicator    ->
    opt msg "553" parse_string               @@ fun ln_username                  ->
    opt msg "554" parse_string               @@ fun ln_password                  -> 
    ParseFieldSuccess 
    { ln_encrypt_method             
    ; ln_heartbeat_interval         
    ; ln_raw_data_length            
    ; ln_raw_data                   
    ; ln_reset_seq_num_flag         
    ; ln_next_expected_msg_seq_num  
    ; ln_max_message_size           
    ; ln_test_message_indicator     
    ; ln_username                   
    ; ln_password                   
    }
;;

let parse_msg_logoff_data msg = 
    from_parse_field_result @@
    opt msg "355" parse_int @@ fun lo_encoded_text_len -> 
    opt msg "354" parse_string @@ fun lo_encoded_text     -> 
    ParseFieldSuccess 
    { lo_encoded_text_len 
    ; lo_encoded_text    
    }
;;

let parse_msg_resend_request_data msg = 
    from_parse_field_result @@ 
    req msg "7"  parse_int @@ fun rr_begin_seq_num -> 
    req msg "16" parse_string @@ fun rr_end_seq_num   -> 
    ParseFieldSuccess 
    { rr_begin_seq_num  
    ; rr_end_seq_num    
    } 
;;

let parse_msg_reject_data msg = 
    from_parse_field_result @@
    req msg "45"  parse_int                    @@ fun sr_ref_seq_num           -> 
    opt msg "371" parse_string                    @@ fun sr_ref_tag_id            -> 
    opt msg "372" parse_full_msg_tag           @@ fun sr_ref_msg_type          -> 
    opt msg "373" parse_session_reject_reason  @@ fun sr_session_reject_reason ->
    opt msg "58"  parse_string                    @@ fun sr_text                  -> 
    opt msg "354" parse_int                    @@ fun sr_encoded_text_len      -> 
    opt msg "355" parse_string                    @@ fun sr_encoded_text          -> 
    ParseFieldSuccess
    { sr_ref_seq_num           
    ; sr_ref_tag_id            
    ; sr_ref_msg_type          
    ; sr_session_reject_reason 
    ; sr_text                  
    ; sr_encoded_text_len      
    ; sr_encoded_text          
    }
;;

let parse_msg_sequence_reset_data msg = 
    from_parse_field_result @@
    req msg "" parse_int         @@ fun seqr_new_seq_no    ->
    opt msg "" parse_GapFillFlag @@ fun seqr_gap_fill_flag -> 
    ParseFieldSuccess
    { seqr_new_seq_no     
    ; seqr_gap_fill_flag  
    } 
;;

let parse_msg_test_request_data msg = 
    from_parse_field_result @@
    req msg "" parse_int @@ fun test_req_id -> 
    ParseFieldSuccess
    { test_req_id }
;;

let parse_msg_business_reject_data msg = 
    from_parse_field_result @@
    req msg "" parse_int                    @@ fun br_ref_seq_num            ->
    req msg "" parse_business_reject_reason @@ fun br_business_reject_reason -> 
    ParseFieldSuccess
    { br_ref_seq_num           
    ; br_business_reject_reason
    }
;;

let parse_admin_msg_data msg_tag msg = 
    match msg_tag with
    | Full_Msg_Heartbeat_Tag        -> parse_msg_heartbeat_data       msg >>= fun x -> ParseSuccess ( Full_Msg_Heartbeat       x )    
    | Full_Msg_Test_Request_Tag     -> parse_msg_test_request_data    msg >>= fun x -> ParseSuccess ( Full_Msg_Test_Request    x )  
    | Full_Msg_Resend_Request_Tag   -> parse_msg_resend_request_data  msg >>= fun x -> ParseSuccess ( Full_Msg_Resend_Request  x )
    | Full_Msg_Reject_Tag           -> parse_msg_reject_data          msg >>= fun x -> ParseSuccess ( Full_Msg_Reject          x )       
    | Full_Msg_Sequence_Reset_Tag   -> parse_msg_sequence_reset_data  msg >>= fun x -> ParseSuccess ( Full_Msg_Sequence_Reset  x )
    | Full_Msg_Logoff_Tag           -> parse_msg_logon_data           msg >>= fun x -> ParseSuccess ( Full_Msg_Logon           x )        
    | Full_Msg_Logon_Tag            -> parse_msg_logoff_data          msg >>= fun x -> ParseSuccess ( Full_Msg_Logoff          x )       
    | Full_Msg_Business_Reject_Tag  -> parse_msg_business_reject_data msg >>= fun x -> ParseSuccess ( Full_Msg_Business_Reject x )
;;
