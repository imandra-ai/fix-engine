open Config_parser

let def_reader filename =
    let f s =
        s |> List.map (fun (a,b) -> a ^ "=" ^ b)
          |> List.fold_left (fun acc s -> acc ^ "|" ^ s) ""
        in
    parse_file filename
        |> List.map (function
            | ExpectMessage s           -> print_endline ("Expect: " ^ f s)      
            | InitiateMessage s         -> print_endline ("Init:"    ^ f s)
            | ExpectAction Connect      -> print_endline ("Expect connect")
            | ExpectAction Disconnect   -> print_endline ("Expect disconnect")
            | InitiateAction Connect    -> print_endline ("Init connect")
            | InitiateAction Disconnect -> print_endline ("Init disconnect")                 
        )
;;

let _ =
    def_reader "defs/10_MsgSeqNumEqual.def"
;;
