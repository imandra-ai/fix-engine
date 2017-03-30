


(**  Splits a stream of characters into a stream of key*value pairs *)
let split_into_key_value ( stream : char Stream.t ) : (int * string) Stream.t =
    let current = ref [] in
    let listref_to_string lst =
        !lst |> List.rev |> String.concat "" in
    let rec next i =
        try 
            let c = Stream.next stream in
            if c = '|' then (
                let entry = listref_to_string current in
                current := [];
                Scanf.sscanf entry " %d=%s " (fun k v -> Some (k,v))
            ) else (
                current := Char.escaped c :: !current;
                next i
            )
        with Stream.Failure -> None in
    Stream.from next
;;

(** Splits a stream of key-value paris into stream of  messages *)
let split_into_messages (stream : (int * string) Stream.t) =
    let current = ref [] in
    let rec next i =
        try 
            let key,value = Stream.next stream in    
            if (key = 8) && (!current != []) then (
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
