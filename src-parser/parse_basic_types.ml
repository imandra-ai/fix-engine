
let parse_str str = Some str;; (* TODO *)

let parse_int str = 
    try 
        Some(int_of_string str) 
    with _ -> None
;;

let parse_bool str = 
    match str with 
    | "Y" -> Some true 
    | "N" -> Some false 
    | _ -> None
;;