(* Aesthetic Integration copyright 2017 *)
(* @meta[imandra_ignore] on @end *)
 open Encode_base_types;;
 open Encode_datetime;;
(* @meta[imandra_ignore] off @end *)

let enc_req (f) (x)  =
    Some (f x)
;;

let enc_opt (f) (x)  =
    (match x with
        | None -> None
        | Some y -> (Some (f y))
    )
;;

let enc_repeat (f) (tag) (lst)  =
    (match lst with
        | [] -> []
        | lst -> ((tag,(lst |> List.length) |> (enc_req encode_int)) :: ((lst |> (List.map f)) |> List.concat))
    )
;;
