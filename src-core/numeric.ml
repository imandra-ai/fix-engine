(** Numeric types. *)
(***

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017
    
    numeric.ml

*)

(* @meta[imandra_ignore] on @end *)
open Imandra_utils;;
(* @meta[imandra_ignore] off @end *)


type fix_float_data = {
    fix_float_whole       : int;
    fix_float_fraction    : int;
}
;;

type fix_float = 
    | Float_0 of fix_float_data
    | Float_1 of fix_float_data
    | Float_2 of fix_float_data
    | Float_3 of fix_float_data
    | Float_4 of fix_float_data
;;

let float_Create ( data, num_decs : fix_float_data * int ) =
    match num_decs with
    | 0 -> Float_0 data
    | 1 -> Float_1 data
    | 2 -> Float_2 data
    | 3 -> Float_3 data
    | _ -> Float_4 data
;;

let float_GetData ( f : fix_float ) =
    match f with 
    | Float_0 d -> d
    | Float_1 d -> d
    | Float_2 d -> d
    | Float_3 d -> d
    | Float_4 d -> d
;;

let float_GetDecs ( f : fix_float ) =
    match f with 
    | Float_0 _ -> 0
    | Float_1 _ -> 1
    | Float_2 _ -> 2
    | Float_3 _ -> 3
    | _         -> 4
;;

let float_GetFloat ( f : fix_float ) =
    match f with 
    | Float_0 d ->   float_of_int  ( d.fix_float_whole ) 
    | Float_1 d -> ( float_of_int  ( d.fix_float_whole ) ) +. ( float_of_int ( d.fix_float_fraction ) /. 10.0 )
    | Float_2 d -> ( float_of_int  ( d.fix_float_whole ) ) +. ( float_of_int ( d.fix_float_fraction ) /. 100.0) 
    | Float_3 d -> ( float_of_int  ( d.fix_float_whole ) ) +. ( float_of_int ( d.fix_float_fraction ) /. 1000.0)
    | Float_4 d -> ( float_of_int  ( d.fix_float_whole ) ) +. ( float_of_int ( d.fix_float_fraction ) /. 10000.0)
;;

let getDecPow ( d ) = 
    match d with 
    | 0 -> 1.0
    | 1 -> 10.0
    | 2 -> 100.0
    | 3 -> 1000.0
    | _ -> 10000.0
;;

let make_Float ( f, dec : float * int ) = 
    let d = {
        fix_float_whole     = int_of_float f;
        fix_float_fraction  = int_of_float (( f -. float_of_int ( int_of_float (f))) *. getDecPow (dec)) ;
    } in 
    match dec with 
    | 0 -> Float_0 d
    | 1 -> Float_1 d 
    | 2 -> Float_2 d
    | 3 -> Float_3 d
    | _ -> Float_4 d
;;

let float_Add ( fOne, fTwo : fix_float * fix_float ) =
    let dOne = float_GetDecs ( fOne ) in 
    let dTwo = float_GetDecs ( fTwo ) in 

    let data1 = float_GetFloat ( fOne ) in
    let data2 = float_GetFloat ( fTwo ) in 

    make_Float ( data1 +. data2, min (dOne, dTwo))
;;

let add_float (fOne, fTwo) = float_Add(fOne, fTwo);;
let sub_float (fOne, fTwo) = float_Add(fOne, fTwo);;(*semantically wrong!*)


let float_Div ( fOne, fTwo : fix_float * fix_float ) = 
    let dOne = float_GetDecs ( fOne ) in 
    let dTwo = float_GetDecs ( fTwo ) in 

    let data1 = float_GetFloat ( fOne ) in
    let data2 = float_GetFloat ( fTwo ) in 

    make_Float ( data1 /. data2, min (dOne, dTwo))
;;

let div_float (fOne, fTwo) = float_Div(fOne, fTwo);;


let float_Mult ( fOne, fTwo : fix_float * fix_float ) =
    let dOne = float_GetDecs ( fOne ) in 
    let dTwo = float_GetDecs ( fTwo ) in 

    let one = float_GetFloat ( fOne ) in 
    let two = float_GetFloat ( fTwo ) in 

    make_Float ( one *. two, min (dOne, dTwo) )
;;

let mul_float (fOne, fTwo) = float_Mult(fOne,fTwo);;


let float_GreaterThan ( fOne, fTwo : fix_float * fix_float ) =
    float_GetFloat ( fOne ) > float_GetFloat ( fTwo )
;;

let gt_float (fOne, fTwo) = float_GreaterThan(fOne, fTwo)
;;


let float_LessThan ( fOne, fTwo : fix_float * fix_float ) =
    float_GetFloat ( fOne ) < float_GetFloat ( fTwo )
;;


let float_GreaterThanEqual ( fOne, fTwo : fix_float * fix_float ) =
    not (float_LessThan ( fOne, fTwo ))
;;

(** TODO need to do something intelligent here. *)
let float_Equal ( fOne, fTwo : fix_float * fix_float ) =
    let fractQOne = float_GetFloat ( fOne ) in 
    let fractQTwo = float_GetFloat ( fTwo ) in
    fractQOne = fractQTwo
;;

let float_LessThanEqual ( fOne, fTwo : fix_float * fix_float ) =
    float_LessThan (fOne, fTwo) || float_Equal (fOne, fTwo)
;;

let le_float (fOne, fTwo) = float_LessThanEqual(fOne, fTwo)
;;

