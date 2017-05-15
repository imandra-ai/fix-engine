(** Various parser utilities. *)
(***

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    parser_utils.ml 
*)

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
            if (int_of_string key = 10) then (
                let message = List.rev ( (key,value)::!current ) in
                current := [];
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

module Parse_field_result = struct 
    type 'a t =
        | ParseFieldSuccess of 'a
        | WrongFieldFormat of string
        | RequiredFieldMissing of string 
        | EmptyField of string 

    let opt msg tag parser f =
        if not (List.mem_assoc tag msg) then f None else
        let value = List.assoc tag msg in
        if value = "" then EmptyField tag else
        try 
            match parser value with 
            | None   -> WrongFieldFormat tag 
            | Some t -> f (Some t)
        with _ -> WrongFieldFormat tag

    let req msg tag parser f =
        if not (List.mem_assoc tag msg) then RequiredFieldMissing tag else
        let value = List.assoc tag msg in
        if value = "" then EmptyField tag else
        try 
            match parser value with 
            | None   -> WrongFieldFormat tag 
            | Some t -> f t
        with _ -> WrongFieldFormat tag
            
end

module Parse_message_result = struct 
    type 'a t =
        | ParseSuccess         of 'a
        | UnknownMessageTag    of string 
        | RequiredTagMissing   of string 
        | DuplicateTag         of string 
        | WrongValueFormat     of string
        | UndefinedTag         of string
        | EmptyValue           of string
        | GarbledMessage


    let from_parse_field_result = function
        | Parse_field_result.ParseFieldSuccess    x -> ParseSuccess x   
        | Parse_field_result.WrongFieldFormat     x -> WrongValueFormat x 
        | Parse_field_result.RequiredFieldMissing x -> RequiredTagMissing x


    let ( >>= ) x f = match x with
        | ParseSuccess       x -> f x   
        | UnknownMessageTag  x -> UnknownMessageTag  x
        | RequiredTagMissing x -> RequiredTagMissing x
        | DuplicateTag       x -> DuplicateTag       x
        | WrongValueFormat   x -> WrongValueFormat   x
        | UndefinedTag       x -> UndefinedTag       x
        | EmptyValue         x -> EmptyValue         x
        | GarbledMessage       -> GarbledMessage
end
