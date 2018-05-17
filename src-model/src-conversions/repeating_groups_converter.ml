(* Aesthetic Integration copyright 2018 *)
open Imandra_utils;;

let rec cap_length ( d , x , h ) =
    (match d with
        | [] -> (min (x,h))
        | _ :: t -> (cap_length (t,x+1,h))
    )
;;
