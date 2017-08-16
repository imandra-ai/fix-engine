(** Various parser utilities. *)
(***

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    parser_utils.ml

*)

(**  Splits a stream of characters into a stream of key*value pairs. *)
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

(** Splits a stream of key-value paris into stream of messages. *)
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


let take (key : string) (lst : (string * string) list ) =
    let rec take accu = function
    | (k,v) :: tl -> 
        if k = key then (Some v , List.rev accu @ tl)
        else take ((k,v)::accu) tl
    | [] -> (None, List.rev accu) in
    take [] lst
;;

(** *)
module Parser = struct 
    type 'a t =
        | ParseSuccess         of 'a
        | UnknownMessageTag    of string 
        | RequiredTagMissing   of string 
        | DuplicateTag         of string 
        | WrongValueFormat     of string
        | UndefinedTag         of string
        | EmptyValue           of string
        | GarbledMessage

    let opt msg tag parser f =
        let value, msg = take tag msg in
        match value with
        | None -> f msg None
        | Some "" -> EmptyValue tag
        | Some value -> try 
            match parser value with 
            | None   -> WrongValueFormat tag 
            | Some t -> f msg (Some t)
        with _ -> WrongValueFormat tag

    let req msg tag parser f =
        let value, msg = take tag msg in
        match value with
        | None ->  RequiredTagMissing tag
        | Some "" -> EmptyValue tag
        | Some value -> try 
            match parser value with 
            | None   -> WrongValueFormat tag 
            | Some t -> f msg (Some t)
        with _ -> WrongValueFormat tag



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

