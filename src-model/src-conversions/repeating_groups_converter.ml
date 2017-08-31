(* Aesthetic Integration copyright 2017 *)
(* @meta[imandra_ignore] on @end *)
open Imandra_utils;;
(* @meta[imandra_ignore] off @end *)

let rec cap_length ( d , x , h ) =
    (match d with
        | [] -> (min (x,h))
        | _ :: t -> (cap_length (t,x+1,h))
    )
;;
