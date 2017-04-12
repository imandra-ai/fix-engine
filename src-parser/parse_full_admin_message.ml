open Base_types;;
open Parse_datetime;;
open Parse_basic_types;;
open Full_admin_messages;;

(** Hearbeat parsing *)
let parse_heartbeat_data = 
    let open Fixparser.Util in
    opt msg "112" parse_int @@ fun hb_test_req_id ->
    ParseSuccess { hb_test_req_id }
;;

(** Logon parsing *)
let parse_encryption_method str = match str with
    | "1" -> Some PKCS          
    | "2" -> Some DES_ECB       
    | "3" -> Some PKCS_DES      
    | "4" -> Some PGP_DES       
    | "5" -> Some PGP_DES_MD5   
    | "6" -> Some PEM_DES_MD5   
    | "0" -> Some NoEncryption
    | _   -> None
;;

let parse_logon_data msg =
    let open Fixparser.Util in
    req msg "98"  parse_encryption_method @@ fun ln_encrypt_method            ->
    req msg "108" parse_Duration          @@ fun ln_heartbeat_interval        ->
    opt msg "95"  parse_int               @@ fun ln_raw_data_length           ->
    opt msg "96"  parse_str               @@ fun ln_raw_data                  ->
    opt msg "141" parse_int               @@ fun ln_reset_seq_num_flag        ->
    opt msg "789" parse_int               @@ fun ln_next_expected_msg_seq_num ->
    opt msg "383" parse_int               @@ fun ln_max_message_size          ->
    opt msg "464" parse_bool              @@ fun ln_test_message_indicator    ->
    opt msg "553" parse_str               @@ fun ln_username                  ->
    opt msg "554" parse_str               @@ fun ln_password                  ->
    ParseSuccess {
        ln_encrypt_method            ; 
        ln_heartbeat_interval        ;
        ln_raw_data_length           ;
        ln_raw_data                  ;
        ln_reset_seq_num_flag        ; 
        ln_next_expected_msg_seq_num ;
        ln_max_message_size          ;
        ln_test_message_indicator    ;
        ln_username                  ;
        ln_password                  ;
    } 
;;

(** Logoff parsing *)
let parse_logoff_data msg = 
    let open Fixparser.Util in
    opt msg "354" parse_int @@ fun lo_encoded_text_len ->  
    opt msg "355" parse_str @@ fun lo_encoded_text     -> 
    ParseSuccess {
        lo_encoded_text_len ; 
        lo_encoded_text     ;  
    }
;;


(** ResendRequest parsing *)
let parse_resend_request_data msg = 
    let open Fixparser.Util in
    req msg "7"  parse_int @@ fun rr_begin_seq_num -> 
    req msg "16" parse_int @@ fun rr_end_seq_num   ->
    ParseSuccess {
        rr_begin_seq_num ; 
        rr_end_seq_num   ;  
    }
;;

(** SequenceReset parsing *)
let parse_GapFillFlag str =
    match str with 
    | "Y" -> Some FIX_GapFillFlag_Y
    | "N" -> Some FIX_GapFillFlag_N
    | _ -> None
;;

let parse_sequence_reset_data msg = 
    let open Fixparser.Util in
    req msg "36"  parse_int           @@ fun seqr_new_seq_no    -> 
    opt msg "123" parse_GapFillFlag   @@ fun seqr_gap_fill_flag ->
    ParseSuccess {
        seqr_new_seq_no    ;
        seqr_gap_fill_flag ;
    }
;;

(** TestRequest parsing *)
let parse_test_request_data msg = 
    let open Fixparser.Util in
    req msg "112" parse_int @@ fun test_req_id ->
    ParseSuccess { test_req_id }
;;


