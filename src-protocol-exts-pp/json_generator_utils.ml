(* Aesthetic Integration copyright 2017 *)
(* @meta[imandra_ignore] on @end *)
 open Yojson;;
(* @meta[imandra_ignore] off @end *)

let assoc_filter_nulls ( x ) : json =
    `Assoc (List.filter (function (_,`Null) -> false |_ -> true
    ) x)
;;

let rg_for_json (f) (lst)  : json =
    (match lst with
        | [] -> `Null
        | lst -> (`List (List.map f lst))
    )
;;
