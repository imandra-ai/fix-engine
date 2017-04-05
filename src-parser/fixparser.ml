open Base_types;;
open Datetime;;
open Full_session_core;;

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

let parse_fix_header msg = 
    let parse_str = fun x -> Some x in
    let assoc key parser = 
        if List.mem_assoc key msg then begin
            match List.assoc key msg |> parser with
            | Some v -> Some ( Some v )
            | None   -> None
        end else Some None
        in
    let assoc_strict key parser =
        match assoc key parser with
        | Some ( Some v ) -> Some v
        | _ -> None
        in
    (* These matches require that the tags are present *)
    match assoc_strict  "8" parse_str with None -> None | Some h_begin_string   ->
    match assoc_strict  "9" parse_int with None -> None | Some h_body_length    ->
    match assoc_strict "49" parse_str with None -> None | Some h_sender_comp_id ->
    match assoc_strict "56" parse_str with None -> None | Some h_target_comp_id ->
    match assoc_strict "34" parse_int with None -> None | Some h_msg_seq_num    ->
    (* Standard parsing  *)
    match assoc "115" parse_int  with None -> None | Some h_on_behalf_of_comp_id        -> 
    match assoc "128" parse_int  with None -> None | Some h_deliver_to_comp_id          ->  
    match assoc "90"  parse_int  with None -> None | Some h_secure_data_len             ->   
    match assoc "91"  parse_int  with None -> None | Some h_secure_data                 ->   
    match assoc "50"  parse_int  with None -> None | Some h_sender_sub_id               ->   
    match assoc "142" parse_int  with None -> None | Some h_sender_location_id          ->  
    match assoc "57"  parse_int  with None -> None | Some h_target_sub_id               ->   
    match assoc "143" parse_int  with None -> None | Some h_target_location_id          ->  
    match assoc "116" parse_int  with None -> None | Some h_on_behalf_of_sub_id         ->  
    match assoc "114" parse_int  with None -> None | Some h_on_behalf_of_location_id    ->  
    match assoc "129" parse_int  with None -> None | Some h_deliver_to_sub_id           ->  
    match assoc "145" parse_int  with None -> None | Some h_deliver_to_location_id      ->  
    match assoc "43"  parse_bool with None -> None | Some h_poss_dup_flag               ->    
    match assoc "97"  parse_bool with None -> None | Some h_poss_resend                 ->    
    match assoc "52"  parse_UTCTimeStamp  with None -> None | Some h_sending_time       ->   
    match assoc "122" parse_UTCTimeStamp  with None -> None | Some h_orig_sending_time  ->  
    match assoc "212" parse_int  with None -> None | Some h_xml_data_len                ->  
    match assoc "213" parse_int  with None -> None | Some h_xml_data                    ->  
    match assoc "347" parse_int  with None -> None | Some h_message_enconding           ->  
    match assoc "369" parse_int  with None -> None | Some h_last_msg_seq_num_processed  ->  
    match assoc "627" parse_int  with None -> None | Some h_no_hops                     ->      
    Some {   
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