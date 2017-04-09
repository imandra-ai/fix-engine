open Full_session_core;;
open Full_messages;;
open Parse_basic_types;;
open Parse_datetime;;

(**  Splits a stream of characters into a stream of key*value pairs *)
let split_into_key_value (spliton : char) ( stream : char Stream.t ) : (string * string) Stream.t =
    let current = ref [] in
    let listref_to_string lst =
        !lst |> List.rev |> String.concat "" in
    let rec next i =
        try 
            let c = Stream.next stream in
            if c = spliton then (
                let entry = listref_to_string current in
                current := [];
                Scanf.sscanf entry " %s@=%s " (fun k v -> Some (k,v))
            ) else (
                current := Char.escaped c :: !current;
                next i
            )
        with Stream.Failure -> None in
    Stream.from next
;;

(** Splits a stream of key-value paris into stream of  messages *)
let split_into_messages (stream : (string * string) Stream.t) =
    let current = ref [] in
    let rec next i =
        try 
            let key,value = Stream.next stream in    
            if (int_of_string key = 8) && (!current != []) then (
                let message = List.rev !current in
                current := [(key,value)];
                Some message
            ) else (
                current := (key,value) :: !current;
                next i
            )
        with Stream.Failure -> (
            if (!current != []) then (
                let message = List.rev !current in
                current := [];
                Some message
            ) else None
        ) in
    Stream.from next
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
let valid_no_duplicate_keys ( msg : (string * string) list ) : string option =
    let rec has_duplicates lst = match lst with
        | a::b::tl when a = b -> Some a
        | a::tl -> has_duplicates tl
        | [] -> None
        in
    List.map fst msg 
        |> List.sort String.compare
        |> has_duplicates
;;

(* -
*)

module Util = struct
    type 'a parse_field_result =
        | ParseSuccess of 'a
        | WrongFieldFormat of string
        | RequiredFieldMissing of string
        
    let assoc msg key parser = 
        if List.mem_assoc key msg then begin
            match List.assoc key msg |> parser with
            | Some v -> Some ( Some v )
            | None   -> None
        end else Some None

    let opt msg tag parser f =
        match assoc msg tag parser with 
        | None -> WrongFieldFormat tag 
        | Some t -> f t

    let req msg tag parser f =
        match assoc msg tag parser with 
        | None -> WrongFieldFormat tag 
        | Some None -> RequiredFieldMissing tag
        | Some (Some t) -> f t
        
    let make_reject_data seq_num = {
        srej_msg_msg_seq_num    = seq_num;
        srej_msg_field_tag      = None;      
        srej_msg_msg_type       = None;     
        srej_msg_reject_reason  = None;     
        srej_text               = None;      
        srej_encoded_text_len   = None;      
        srej_encoded_text       = None;      
    }
end;;

let parse_fix_header msg = 
    let open Util in 
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
    opt msg "52"  parse_UTCTimeStamp  @@ fun h_sending_time                ->   
    opt msg "122" parse_UTCTimeStamp  @@ fun h_orig_sending_time           ->  
    opt msg "212" parse_int           @@ fun h_xml_data_len                ->  
    opt msg "213" parse_int           @@ fun h_xml_data                    ->  
    opt msg "347" parse_int           @@ fun h_message_enconding           ->  
    opt msg "369" parse_int           @@ fun h_last_msg_seq_num_processed  ->  
    opt msg "627" parse_int           @@ fun h_no_hops                     ->    
    ParseSuccess {   
        h_begin_string               ;    
        h_body_length                ;    
        h_sender_comp_id             ;   
        h_target_comp_id             ;   
        h_msg_seq_num                ;   
        h_on_behalf_of_comp_id       ; 
        h_deliver_to_comp_id         ;  
        h_secure_data_len            ;   
        h_secure_data                ;   
        h_sender_sub_id              ;   
        h_sender_location_id         ;  
        h_target_sub_id              ;   
        h_target_location_id         ;  
        h_on_behalf_of_sub_id        ;  
        h_on_behalf_of_location_id   ;  
        h_deliver_to_sub_id          ;  
        h_deliver_to_location_id     ;  
        h_poss_dup_flag              ;    
        h_poss_resend                ;    
        h_sending_time               ;   
        h_orig_sending_time          ;  
        h_xml_data_len               ;  
        h_xml_data                   ;  
        h_message_enconding          ;  
        h_last_msg_seq_num_processed ;  
        h_no_hops                          
    }
;;


