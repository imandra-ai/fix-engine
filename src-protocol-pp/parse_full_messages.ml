(** Implementation of the 'full' FIX messages. *)
(***

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    full_messages.ml

*)

(* @meta[imandra_ignore] on @end *)
open Full_message_tags;;
open Full_messages;;
open Parser_utils;;
open Parser_utils.Parse_message_result;;
open Parse_base_types;;
open Parse_datetime;;
open Parse_full_tags;;
(* @meta[imandra_ignore] off @end *)

let parse_msg_data msg_tag msg =
    match msg_tag with
    | Full_Admin_Msg_Tag msg_tag -> Parse_admin_messages.parse_admin_msg_data msg_tag msg
                                 >>= fun x -> ParseSuccess ( Full_Admin_Msg x )
    | Full_App_Msg_Tag   msg_tag -> Parse_app_messages.parse_app_msg_data     msg_tag msg
                                 >>= fun x -> ParseSuccess ( Full_App_Msg x )
;;

let parse_header msg = 
    Parse_message_result.from_parse_field_result @@
    let open Parse_field_result in 
    req msg "8"   parse_str           @@ fun h_begin_string                ->
    req msg "9"   parse_int           @@ fun h_body_length                 ->
    req msg "49"  parse_str           @@ fun h_sender_comp_id              ->
    req msg "56"  parse_str           @@ fun h_target_comp_id              ->
    req msg "34"  parse_int           @@ fun h_msg_seq_num                 ->
    opt msg "115" parse_int           @@ fun h_on_behalf_of_comp_id        -> 
    opt msg "128" parse_int           @@ fun h_deliver_to_comp_id          ->  
    opt msg "90"  parse_int           @@ fun h_secure_data_len             ->   
    opt msg "91"  parse_int           @@ fun h_secure_data                 ->   
    opt msg "50"  parse_int           @@ fun h_sender_sub_id               ->   
    opt msg "142" parse_int           @@ fun h_sender_location_id          ->  
    opt msg "57"  parse_int           @@ fun h_target_sub_id               ->   
    opt msg "143" parse_int           @@ fun h_target_location_id          ->  
    opt msg "116" parse_int           @@ fun h_on_behalf_of_sub_id         ->  
    opt msg "114" parse_int           @@ fun h_on_behalf_of_location_id    ->  
    opt msg "129" parse_int           @@ fun h_deliver_to_sub_id           ->  
    opt msg "145" parse_int           @@ fun h_deliver_to_location_id      ->  
    opt msg "43"  parse_bool          @@ fun h_poss_dup_flag               ->    
    opt msg "97"  parse_bool          @@ fun h_poss_resend                 ->    
    opt msg "52"  parse_utctimestamp  @@ fun h_sending_time                ->   
    opt msg "122" parse_utctimestamp  @@ fun h_orig_sending_time           ->  
    opt msg "212" parse_int           @@ fun h_xml_data_len                ->  
    opt msg "213" parse_int           @@ fun h_xml_data                    ->  
    opt msg "347" parse_int           @@ fun h_message_enconding           ->  
    opt msg "369" parse_int           @@ fun h_last_msg_seq_num_processed  ->  
    opt msg "627" parse_int           @@ fun h_no_hops                     -> 
    ParseFieldSuccess    
    { h_begin_string                   
    ; h_body_length                    
    ; h_sender_comp_id                
    ; h_target_comp_id                
    ; h_msg_seq_num                   
    ; h_on_behalf_of_comp_id        
    ; h_deliver_to_comp_id           
    ; h_secure_data_len               
    ; h_secure_data                   
    ; h_sender_sub_id                 
    ; h_sender_location_id           
    ; h_target_sub_id                 
    ; h_target_location_id           
    ; h_on_behalf_of_sub_id          
    ; h_on_behalf_of_location_id     
    ; h_deliver_to_sub_id            
    ; h_deliver_to_location_id       
    ; h_poss_dup_flag                  
    ; h_poss_resend                    
    ; h_sending_time                  
    ; h_orig_sending_time            
    ; h_xml_data_len                 
    ; h_xml_data                     
    ; h_message_enconding            
    ; h_last_msg_seq_num_processed   
    ; h_no_hops                         
    }
;;


let parse_trailer msg =  
    Parse_message_result.from_parse_field_result @@
    let open Parse_field_result in 
    opt msg "93" parse_int  @@ fun signature_length ->
    opt msg "89" parse_int  @@ fun signature        ->
    req msg "10" parse_int  @@ fun check_sum        -> 
    ParseFieldSuccess 
    { signature_length
    ; signature       
    ; check_sum       
    }
;;



let check_first_three_tags ( msg : (string * string) list ) : string option =
    if List.hd msg |> fst <> "8" then Some "8" else
    let msg = List.tl msg in
    if List.hd msg |> fst <> "9" then Some "9" else
    let msg = List.tl msg in
    if List.hd msg |> fst <> "35" then Some "35" else
    None
;;

(**  Checks that the message contains BodyLength<9> field as a second entry 
     in the message. And that the value equals to the number of bytes between 
     BodyLength<9> and CheckSum<10> entries in the message.
*)
let valid_body_length ( msg : (string * string) list ) : bool =
    let body_length =
        let rec scan n msg = match msg with
            | ( "8", _ )::tl 
            | ( "9", _ )::tl -> scan n tl
            | ("10", _ )::tl -> n
            | (  k , v )::tl -> n + scan String.(length k + length v + 2) tl
            | [] -> n in 
        scan 0 msg 
        in
    match msg with 
        | ("8", _ ) :: ("9", bl) :: _ -> 
            ( try body_length = int_of_string bl with _ -> false )
        | _ -> false
;;

(**  Verifies the checksum (sum of all bytes mod 256) of all bytes in 
    the message up to the CheckSum<10> entry. Returns true if the computed 
    checksum is equal to the value of CheckSum<10>.
*)
let valid_checksum ( msg : (string * string) list ) : bool  =
    let checksum s = 
        let rec chsum i v =
            if i < 0 then v else chsum (i - 1) (Char.code s.[i] + v)  in
        chsum (String.length s - 1) 0 
        in
    let checksum, msg_checksum =
        let rec scan n msg = match msg with
            | ("10", v )::tl -> ( n mod 256 , v )
            | (  k , v )::tl -> scan (checksum k + checksum v + 62 + n) tl
            | [] -> ( n mod 256 , "") in 
        scan 0 msg
        in
    try checksum = int_of_string msg_checksum with _ -> false
;;

(** Checks that the message doesnt contain duplicate tags *)
let find_duplicate_tags ( msg : (string * string) list ) : string option =
    let rec get_duplicates lst = match lst with
        | a::b::tl when a = b -> Some a
        | a::tl -> get_duplicates tl
        | [] -> None
        in
    List.map fst msg 
        |> List.sort String.compare
        |> get_duplicates
;;

(**
    Runs basic message intergrity checks. Returns ParseSuccess ()  on success.
*)
let message_basic_check msg = 
    match check_first_three_tags msg with Some tag -> RequiredTagMissing tag | None ->
    if not (valid_checksum      msg ) then GarbledMessage else  
    if not (valid_body_length   msg ) then GarbledMessage else  
    match find_duplicate_tags msg with Some tag -> DuplicateTag tag | None ->
    ParseSuccess ()
;;

let make_session_reject reason tagstr msg =
    if not (List.mem_assoc "34" msg ) then Garbled else
    match ( List.assoc "34" msg |> parse_int ) with None -> Garbled | Some seq_num ->
    let msg_tag = List.assoc "35" msg |> parse_full_msg_tag in
    let field_tag = match msg_tag with 
        | None -> None 
        | Some msg_tag -> parse_full_field_tag msg_tag tagstr 
        in
    SessionRejectedMsg {
        srej_msg_msg_seq_num   = seq_num   ;
        srej_msg_field_tag     = field_tag ;     
        srej_msg_msg_type      = msg_tag;
        srej_msg_reject_reason = Some reason ;
        srej_text              = None ;              
        srej_encoded_text_len  = None ;
        srej_encoded_text      = None ;      
    }
;;

    

let parse_top_level_msg msg = 
    let parse_result = begin
        message_basic_check msg >>= fun () ->
        parse_header        msg >>= fun full_msg_header   ->
        parse_trailer       msg >>= fun full_msg_trailer  ->
        let msg_tag_str = List.assoc "35" msg in
        match ( msg_tag_str |> parse_full_msg_tag ) with None -> UnknownMessageTag msg_tag_str | Some msg_tag ->
        parse_msg_data  msg_tag msg >>= fun full_msg_data -> ParseSuccess 
        { full_msg_header
        ; full_msg_data
        ; full_msg_trailer
        }
    end in match parse_result with
        | ParseSuccess msg       -> ValidMsg msg
        | GarbledMessage         -> Garbled 
        | UnknownMessageTag  tagstr -> make_session_reject Full_admin_enums.InvalidMsgType tagstr msg
        | RequiredTagMissing tagstr -> make_session_reject Full_admin_enums.RequiredTagMissing tagstr msg
        | DuplicateTag       tagstr -> make_session_reject Full_admin_enums.TagAppearsMoreThanOnce tagstr msg
        | WrongValueFormat   tagstr -> make_session_reject Full_admin_enums.IncorrectDataFormatForValue tagstr msg
        | UndefinedTag       tagstr -> make_session_reject Full_admin_enums.UndefinedTag tagstr msg
        | EmptyValue         tag -> make_session_reject Full_admin_enums.TagSecifiedWithoutAValue tag msg
;;
