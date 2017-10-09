(** Numeric types and operations. *)
(***

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017
    
    numeric.ml

*)

(* @meta[imandra_ignore] on @end *)
open Imandra_utils;;
(* @meta[imandra_ignore] off @end *)


let int_Add ( x , y : int * int ) : int = x + y;;


let int_Sub ( x , y : int * int ) : int = x - y;;


let int_Neg ( x : int ) : int = -x;;


let int_Mult ( x, y : int * int ) : int = x * y;;


let int_Div ( x, y : int * int ) : int = x / y;;


let int_GreaterThan (x, y : int * int ) : bool = x > y;;


let int_GreaterThanEqual ( x, y : int * int ) : bool = x >= y;;


let int_LessThan ( x, y : int * int ) : bool =  x < y;;


let int_LessThanEqual ( x, y : int * int ) : bool = x <= y;;

(** To keep track of the floating point precision, the floating point data
    type encodes a number of decimal places used.*)
type fix_float = 
    | Float_0 of int
    | Float_1 of int
    | Float_2 of int
    | Float_3 of int
    | Float_4 of int
;;


let float_Create ( data, num_decs : int * int ) =
    match num_decs with
    | 0 -> Float_0 data
    | 1 -> Float_1 data
    | 2 -> Float_2 data
    | 3 -> Float_3 data
    | _ -> Float_4 data
;;

let float_GetDecs ( f : fix_float ) =
    match f with 
    | Float_0 _ -> 0
    | Float_1 _ -> 1
    | Float_2 _ -> 2
    | Float_3 _ -> 3
    | Float_4 _ -> 4
;;

(** Result of promoting over the other. *)
type promotion_result = {
    f1 : fix_float;
    f2 : fix_float;
}
;;

let promote_0 ( d, v : int * int ) = 
    match v with
    | 0 -> Float_0 d
    | 1 -> Float_1 (d * 10)
    | 2 -> Float_2 (d * 100)
    | 3 -> Float_3 (d * 1000)
    | _ -> Float_4 (d * 10000)
;;

let promote_1 ( d, v : int * int ) = 
    match v with
    | 0 -> Float_1 d
    | 1 -> Float_2 (d * 10)
    | 2 -> Float_3 (d * 100)
    | _ -> Float_4 (d * 1000)
;;

let promote_2 ( d, v : int * int ) = 
    match v with
    | 0 -> Float_2 d
    | 1 -> Float_3 (d * 10)
    | _ -> Float_4 (d * 100)
;;

let promote_3 ( d, v : int * int ) = 
    match v with
    | 0 -> Float_3 d
    | _ -> Float_4 (d * 10)
;;

let promote_float ( f, num_decs : fix_float * int ) =
    match f with 
    | Float_0 d -> promote_0 (d, num_decs)
    | Float_1 d -> promote_1 (d, num_decs)
    | Float_2 d -> promote_2 (d, num_decs)
    | Float_3 d -> promote_3 (d, num_decs)
    | Float_4 d -> f    
;;

let demote_1 ( f, num_decs : int * int ) =
    match num_decs with
    | 0 -> Float_1 f
    | _ -> Float_0 ( f / 10 )
;;

let demote_2 ( f, num_decs : int * int ) =
    match num_decs with
    | 0 -> Float_2 f
    | 1 -> Float_1 ( f / 10 )
    | _ -> Float_0 ( f / 100 )
;;

let demote_3 ( f, num_decs : int * int ) =
    match num_decs with
    | 0 -> Float_3 f
    | 1 -> Float_2 ( f / 10 )
    | 2 -> Float_1 ( f / 100 )    
    | _ -> Float_0 ( f / 1000 )
;;

let demote_4 ( f, num_decs : int * int ) =
    match num_decs with
    | 0 -> Float_4 f
    | 1 -> Float_3 ( f / 10 )
    | 2 -> Float_2 ( f / 100 )    
    | 3 -> Float_1 ( f / 1000 )    
    | _ -> Float_0 ( f / 10000 )
;;

let demote_float ( f, num_decs : fix_float * int ) =
    match f with
    | Float_0 d -> f
    | Float_1 d -> demote_1 (d, num_decs)
    | Float_2 d -> demote_2 (d, num_decs)
    | Float_3 d -> demote_3 (d, num_decs)
    | Float_4 d -> demote_4 (d, num_decs)
;;
    
let convertFloat ( f, target_dec : fix_float * int ) =
    let dec_diff = target_dec - float_GetDecs(f) in
    if target_dec > 0 then
        promote_float(f, dec_diff)
    else
        demote_float(f, -dec_diff)
;;

(* Type-case both floats to match. *)
let promote_floats ( f1, f2 : fix_float * fix_float ) =
    let decs1 = float_GetDecs (f1) in
    let decs2 = float_GetDecs (f2) in
    let max_decs = max(decs1, decs2) in
    let new_f1 = promote_float(f1, max_decs - decs1) in
    let new_f2 = promote_float(f2, max_decs - decs2) in
    {
        f1 = new_f1;
        f2 = new_f2;
    }
;;

(** float1 + float2 *)
let float_Add (fOne, fTwo : fix_float * fix_float) =
    let pres = promote_floats(fOne, fTwo) in
    match pres.f1, pres.f2 with
    | Float_0 d1, Float_0 d2 -> Float_0 ( d1 + d2 )
    | Float_1 d1, Float_1 d2 -> Float_1 ( d1 + d2 )
    | Float_2 d1, Float_2 d2 -> Float_2 ( d1 + d2 )
    | Float_3 d1, Float_3 d2 -> Float_3 ( d1 + d2 )
    | Float_4 d1, Float_4 d2 -> Float_4 ( d1 + d2 )
    | _, _                   -> fOne (* This should never happen. *)
;;

(** float1 - float2 *)
let float_Sub (fOne, fTwo: fix_float * fix_float) =
    let pres = promote_floats(fOne, fTwo) in
    match pres.f1, pres.f2 with
    | Float_0 d1, Float_0 d2 -> Float_0 ( d1 - d2 )
    | Float_1 d1, Float_1 d2 -> Float_1 ( d1 - d2 )
    | Float_2 d1, Float_2 d2 -> Float_2 ( d1 - d2 )
    | Float_3 d1, Float_3 d2 -> Float_3 ( d1 - d2 )
    | Float_4 d1, Float_4 d2 -> Float_4 ( d1 - d2 )
    | _, _                   -> fOne
;;

(** -float1 *)
let float_Neg (fOne : fix_float) =
    match fOne with
    | Float_0 d -> Float_0 (-d)
    | Float_1 d -> Float_1 (-d)
    | Float_2 d -> Float_2 (-d)
    | Float_3 d -> Float_3 (-d)
    | Float_4 d -> Float_4 (-d)
;;

(** float1 / float2 *)
let float_Div ( fOne, fTwo : fix_float * fix_float ) = 
    let pres = promote_floats(fOne, fTwo) in
    match pres.f1, pres.f2 with
    | Float_0 d1, Float_0 d2 -> Float_0 ( d1 / d2 )
    | Float_1 d1, Float_1 d2 -> Float_1 ( ( d1 * 10 ) / d2 )
    | Float_2 d1, Float_2 d2 -> Float_2 ( ( d1 * 100 ) / d2 )
    | Float_3 d1, Float_3 d2 -> Float_3 ( ( d1 * 1000 ) / d2 )
    | Float_4 d1, Float_4 d2 -> Float_4 ( ( d1 * 10000 ) / d2 )
    | _, _                   -> fOne
;;

(** float1 * float2 *)
let float_Mult ( fOne, fTwo : fix_float * fix_float ) =
    let pres = promote_floats(fOne, fTwo) in
    match pres.f1, pres.f2 with
    | Float_0 d1, Float_0 d2 -> Float_0 ( d1 * d2 )
    | Float_1 d1, Float_1 d2 -> Float_1 ( d1 * d2 / 10 )
    | Float_2 d1, Float_2 d2 -> Float_2 ( d1 * d2 / 100 )
    | Float_3 d1, Float_3 d2 -> Float_3 ( d1 * d2 / 1000 )
    | Float_4 d1, Float_4 d2 -> Float_4 ( d1 * d2 / 10000 )
    | _, _                   -> fOne
;;

(** float1 > float2 *)
let float_GreaterThan ( fOne, fTwo : fix_float * fix_float ) =
    let pres = promote_floats(fOne, fTwo) in
    match pres.f1, pres.f2 with
    | Float_0 d1, Float_0 d2 -> d1 > d2
    | Float_1 d1, Float_1 d2 -> d1 > d2
    | Float_2 d1, Float_2 d2 -> d1 > d2
    | Float_3 d1, Float_3 d2 -> d1 > d2
    | Float_4 d1, Float_4 d2 -> d1 > d2
    | _, _                   -> true
;;

(** float 1 < float 2 *)
let float_LessThan ( fOne, fTwo : fix_float * fix_float ) =
    let pres = promote_floats(fOne, fTwo) in
    match pres.f1, pres.f2 with
    | Float_0 d1, Float_0 d2 -> d1 < d2
    | Float_1 d1, Float_1 d2 -> d1 < d2
    | Float_2 d1, Float_2 d2 -> d1 < d2
    | Float_3 d1, Float_3 d2 -> d1 < d2
    | Float_4 d1, Float_4 d2 -> d1 < d2
    | _, _                   -> true
;;

(** float1 >= float2 *)
let float_GreaterThanEqual ( fOne, fTwo : fix_float * fix_float ) =
    not (float_LessThan (fOne, fTwo))
;;

(** float1 == float2 *)
let float_Equal ( fOne, fTwo : fix_float * fix_float ) =
    let pres = promote_floats(fOne, fTwo) in
    match pres.f1, pres.f2 with
    | Float_0 d1, Float_0 d2 -> d1 = d2
    | Float_1 d1, Float_1 d2 -> d1 = d2
    | Float_2 d1, Float_2 d2 -> d1 = d2
    | Float_3 d1, Float_3 d2 -> d1 = d2
    | Float_4 d1, Float_4 d2 -> d1 = d2
    | _, _                   -> true
;;

(** float1 <= float2 *)
let float_LessThanEqual ( fOne, fTwo : fix_float * fix_float ) =
    float_LessThan (fOne, fTwo) || float_Equal (fOne, fTwo)
;;


