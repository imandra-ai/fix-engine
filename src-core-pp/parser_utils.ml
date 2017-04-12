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

type 'a parse_field_result =
    | ParseSuccess of 'a
    | WrongFieldFormat of string
    | RequiredFieldMissing of string 
    | UnknownMessageTag of string
;;

let assoc msg key parser = 
    if List.mem_assoc key msg then begin
        match List.assoc key msg |> parser with
        | Some v -> Some ( Some v )
        | None   -> None
    end else Some None
;;

let opt msg tag parser f =
    match assoc msg tag parser with 
    | None -> WrongFieldFormat tag 
    | Some t -> f t
;;

let req msg tag parser f =
    match assoc msg tag parser with 
    | None -> WrongFieldFormat tag 
    | Some None -> RequiredFieldMissing tag
    | Some (Some t) -> f t
;;

let ( >>= ) x f = match x with
    | ParseSuccess x -> f x   
    | WrongFieldFormat x     -> WrongFieldFormat x 
    | RequiredFieldMissing x -> RequiredFieldMissing x
    | UnknownMessageTag x    -> UnknownMessageTag x   
;;
