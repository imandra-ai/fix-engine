(** Numeric types and operations. *)
(***

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017
    
    numeric.ml

*)

(** To keep track of the floating point precision, the floating point data
    type encodes a number of decimal places used.*)
type fix_float = 
    | Float_0 of int
    | Float_1 of int
    | Float_2 of int
    | Float_3 of int
    | Float_4 of int
;;


let float_Create ( data:int) (num_decs : int) =
    match num_decs with
    | 0 -> Float_0 data
    | 1 -> Float_1 data
    | 2 -> Float_2 data
    | 3 -> Float_3 data
    | _ -> Float_4 data
;;

(** We explicitly write out the pattern matches combinatorially to optimize
    solving constraints around floats. See the Git history for a more
    sophisticated (but slower) implementation.
*)

let float_Convert ( f:fix_float) (num_decs:int) : fix_float =
  match (f, num_decs) with
  | Float_0 d, 0 -> f
  | Float_0 d, 1 -> Float_1 (d * 10)
  | Float_0 d, 2 -> Float_2 (d * 100)
  | Float_0 d, 3 -> Float_3 (d * 1000)
  | Float_0 d, _ -> Float_4 (d * 10000)

  | Float_1 d, 0 -> Float_0 (d / 10)
  | Float_1 d, 1 -> f
  | Float_1 d, 2 -> Float_2 (d * 10)
  | Float_1 d, 3 -> Float_3 (d * 100)
  | Float_1 d, _ -> Float_4 (d * 1000)

  | Float_2 d, 0 -> Float_0 (d / 100)
  | Float_2 d, 1 -> Float_1 (d / 10)
  | Float_2 d, 2 -> f
  | Float_2 d, 3 -> Float_3 (d * 10)
  | Float_2 d, _ -> Float_4 (d * 100)

  | Float_3 d, 0 -> Float_0 (d / 1000)
  | Float_3 d, 1 -> Float_1 (d / 100)
  | Float_3 d, 2 -> Float_2 (d / 10)
  | Float_3 d, 3 -> f
  | Float_3 d, _ -> Float_4 (d * 10)

  | Float_4 d, 0 -> Float_0 (d / 10000)
  | Float_4 d, 1 -> Float_1 (d / 1000)
  | Float_4 d, 2 -> Float_2 (d / 100)
  | Float_4 d, 3 -> Float_3 (d / 10)
  | Float_4 d, _ -> f
;;

(** float1 + float2 *)
let float_Add (fOne:fix_float) (fTwo : fix_float) =
  match (fOne, fTwo) with
  | Float_0 d1, Float_0 d2 -> Float_0 (d1            + d2)
  | Float_0 d1, Float_1 d2 -> Float_1 ((d1 * 10)     + d2)
  | Float_0 d1, Float_2 d2 -> Float_2 ((d1 * 100)    + d2)
  | Float_0 d1, Float_3 d2 -> Float_3 ((d1 * 1000)   + d2)
  | Float_0 d1, Float_4 d2 -> Float_4 ((d1 * 10000)  + d2)
  | Float_1 d1, Float_0 d2 -> Float_1 (d1            + (d2 * 10))
  | Float_1 d1, Float_1 d2 -> Float_1 (d1            + d2)
  | Float_1 d1, Float_2 d2 -> Float_2 ((d1 * 10)     + d2)
  | Float_1 d1, Float_3 d2 -> Float_3 ((d1 * 100)    + d2)
  | Float_1 d1, Float_4 d2 -> Float_4 ((d1 * 1000)   + d2)
  | Float_2 d1, Float_0 d2 -> Float_2 (d1            + (d2 * 100))
  | Float_2 d1, Float_1 d2 -> Float_2 (d1            + (d2 * 10))
  | Float_2 d1, Float_2 d2 -> Float_2 (d1            + d2)
  | Float_2 d1, Float_3 d2 -> Float_3 ((d1 * 10)     + d2)
  | Float_2 d1, Float_4 d2 -> Float_4 ((d1 * 100)    + d2)
  | Float_3 d1, Float_0 d2 -> Float_3 (d1            + (d2 * 1000))
  | Float_3 d1, Float_1 d2 -> Float_3 (d1            + (d2 * 100))
  | Float_3 d1, Float_2 d2 -> Float_3 (d1            + (d2 * 10))
  | Float_3 d1, Float_3 d2 -> Float_3 (d1            + d2)
  | Float_3 d1, Float_4 d2 -> Float_4 ((d1 * 10)     + d2)
  | Float_4 d1, Float_0 d2 -> Float_4 (d1            + (d2 * 10000))
  | Float_4 d1, Float_1 d2 -> Float_4 (d1            + (d2 * 1000))
  | Float_4 d1, Float_2 d2 -> Float_4 (d1            + (d2 * 100))
  | Float_4 d1, Float_3 d2 -> Float_4 (d1            + (d2 * 10))
  | Float_4 d1, Float_4 d2 -> Float_4 (d1            + d2)
;;

(** float1 - float2 *)
let float_Sub (fOne:fix_float) (fTwo: fix_float) =
  match (fOne, fTwo) with
  | Float_0 d1, Float_0 d2 -> Float_0 (d1           - d2)
  | Float_0 d1, Float_1 d2 -> Float_1 ((d1 * 10)    - d2)
  | Float_0 d1, Float_2 d2 -> Float_2 ((d1 * 100)   - d2)
  | Float_0 d1, Float_3 d2 -> Float_3 ((d1 * 1000)  - d2)
  | Float_0 d1, Float_4 d2 -> Float_4 ((d1 * 10000) - d2)
  | Float_1 d1, Float_0 d2 -> Float_1 (d1           - (d2 * 10))
  | Float_1 d1, Float_1 d2 -> Float_1 (d1           - d2)
  | Float_1 d1, Float_2 d2 -> Float_2 ((d1 * 10)    - d2)
  | Float_1 d1, Float_3 d2 -> Float_3 ((d1 * 100)   - d2)
  | Float_1 d1, Float_4 d2 -> Float_4 ((d1 * 1000)  - d2)
  | Float_2 d1, Float_0 d2 -> Float_2 (d1           - (d2 * 100))
  | Float_2 d1, Float_1 d2 -> Float_2 (d1           - (d2 * 10))
  | Float_2 d1, Float_2 d2 -> Float_2 (d1           - d2)
  | Float_2 d1, Float_3 d2 -> Float_3 ((d1 * 10)    - d2)
  | Float_2 d1, Float_4 d2 -> Float_4 ((d1 * 100)   - d2)
  | Float_3 d1, Float_0 d2 -> Float_3 (d1           - (d2 * 1000))
  | Float_3 d1, Float_1 d2 -> Float_3 (d1           - (d2 * 100))
  | Float_3 d1, Float_2 d2 -> Float_3 (d1           - (d2 * 10))
  | Float_3 d1, Float_3 d2 -> Float_3 (d1           - d2)
  | Float_3 d1, Float_4 d2 -> Float_4 ((d1 * 10)    - d2)
  | Float_4 d1, Float_0 d2 -> Float_4 (d1           - (d2 * 10000))
  | Float_4 d1, Float_1 d2 -> Float_4 (d1           - (d2 * 1000))
  | Float_4 d1, Float_2 d2 -> Float_4 (d1           - (d2 * 100))
  | Float_4 d1, Float_3 d2 -> Float_4 (d1           - (d2 * 10))
  | Float_4 d1, Float_4 d2 -> Float_4 (d1           - d2)
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
let float_Div ( fOne: fix_float) (fTwo : fix_float) = 
  match (fOne, fTwo) with
  | Float_0 d1, Float_0 d2 -> Float_0 ((d1 * 1     * 1)     / d2)
  | Float_0 d1, Float_1 d2 -> Float_1 ((d1 * 10    * 10)    / d2)
  | Float_0 d1, Float_2 d2 -> Float_2 ((d1 * 100   * 100)   / d2)
  | Float_0 d1, Float_3 d2 -> Float_3 ((d1 * 1000  * 1000)  / d2)
  | Float_0 d1, Float_4 d2 -> Float_4 ((d1 * 10000 * 10000) / d2)
  | Float_1 d1, Float_0 d2 -> Float_1 ((d1 * 1     * 10)    / (d2 * 10))
  | Float_1 d1, Float_1 d2 -> Float_1 ((d1 * 1     * 10)    / d2)
  | Float_1 d1, Float_2 d2 -> Float_2 ((d1 * 10    * 100)   / d2)
  | Float_1 d1, Float_3 d2 -> Float_3 ((d1 * 100   * 1000)  / d2)
  | Float_1 d1, Float_4 d2 -> Float_4 ((d1 * 1000  * 10000) / d2)
  | Float_2 d1, Float_0 d2 -> Float_2 ((d1 * 1     * 100)   / (d2 * 100))
  | Float_2 d1, Float_1 d2 -> Float_2 ((d1 * 1     * 100)   / (d2 * 10))
  | Float_2 d1, Float_2 d2 -> Float_2 ((d1 * 1     * 100)   / d2)
  | Float_2 d1, Float_3 d2 -> Float_3 ((d1 * 10    * 1000)  / d2)
  | Float_2 d1, Float_4 d2 -> Float_4 ((d1 * 100   * 10000) / d2)
  | Float_3 d1, Float_0 d2 -> Float_3 ((d1 * 1     * 1000)  / (d2 * 1000))
  | Float_3 d1, Float_1 d2 -> Float_3 ((d1 * 1     * 1000)  / (d2 * 100))
  | Float_3 d1, Float_2 d2 -> Float_3 ((d1 * 1     * 1000)  / (d2 * 10))
  | Float_3 d1, Float_3 d2 -> Float_3 ((d1 * 1     * 1000)  / d2)
  | Float_3 d1, Float_4 d2 -> Float_4 ((d1 * 10    * 10000) / d2)
  | Float_4 d1, Float_0 d2 -> Float_4 ((d1 * 1     * 10000) / (d2 * 10000))
  | Float_4 d1, Float_1 d2 -> Float_4 ((d1 * 1     * 10000) / (d2 * 1000))
  | Float_4 d1, Float_2 d2 -> Float_4 ((d1 * 1     * 10000) / (d2 * 100))
  | Float_4 d1, Float_3 d2 -> Float_4 ((d1 * 1     * 10000) / (d2 * 10))
  | Float_4 d1, Float_4 d2 -> Float_4 ((d1 * 1     * 10000) / d2)
;;

(** float1 * float2 *)
let float_Mult ( fOne : fix_float)  (fTwo : fix_float ) =
  match (fOne, fTwo) with
  | Float_0 d1, Float_0 d2 -> Float_0 (d1           * d2)
  | Float_0 d1, Float_1 d2 -> Float_1 ((d1 * 10)    * d2           / 10)
  | Float_0 d1, Float_2 d2 -> Float_2 ((d1 * 100)   * d2           / 100)
  | Float_0 d1, Float_3 d2 -> Float_3 ((d1 * 1000)  * d2           / 1000)
  | Float_0 d1, Float_4 d2 -> Float_4 ((d1 * 10000) * d2           / 10000)
  | Float_1 d1, Float_0 d2 -> Float_1 (d1           * (d2 * 10)    / 10)
  | Float_1 d1, Float_1 d2 -> Float_1 (d1           * d2           / 10)
  | Float_1 d1, Float_2 d2 -> Float_2 ((d1 * 10)    * d2           / 100)
  | Float_1 d1, Float_3 d2 -> Float_3 ((d1 * 100)   * d2           / 1000)
  | Float_1 d1, Float_4 d2 -> Float_4 ((d1 * 1000)  * d2           / 10000)
  | Float_2 d1, Float_0 d2 -> Float_2 (d1           * (d2 * 100)   / 100)
  | Float_2 d1, Float_1 d2 -> Float_2 (d1           * (d2 * 10)    / 100)
  | Float_2 d1, Float_2 d2 -> Float_2 (d1           * d2           / 100)
  | Float_2 d1, Float_3 d2 -> Float_3 ((d1 * 10)    * d2           / 1000)
  | Float_2 d1, Float_4 d2 -> Float_4 ((d1 * 100)   * d2           / 10000)
  | Float_3 d1, Float_0 d2 -> Float_3 (d1           * (d2 * 1000)  / 1000)
  | Float_3 d1, Float_1 d2 -> Float_3 (d1           * (d2 * 100)   / 1000)
  | Float_3 d1, Float_2 d2 -> Float_3 (d1           * (d2 * 10)    / 1000)
  | Float_3 d1, Float_3 d2 -> Float_3 (d1           * d2           / 1000)
  | Float_3 d1, Float_4 d2 -> Float_4 ((d1 * 10)    * d2           / 10000)
  | Float_4 d1, Float_0 d2 -> Float_4 (d1           * (d2 * 10000) / 10000)
  | Float_4 d1, Float_1 d2 -> Float_4 (d1           * (d2 * 1000)  / 10000)
  | Float_4 d1, Float_2 d2 -> Float_4 (d1           * (d2 * 100)   / 10000)
  | Float_4 d1, Float_3 d2 -> Float_4 (d1           * (d2 * 10)    / 10000)
  | Float_4 d1, Float_4 d2 -> Float_4 (d1           * d2           / 10000)
;;

(** float1 > float2 *)
let float_GreaterThan ( fOne : fix_float)  (fTwo : fix_float ) =
  match (fOne, fTwo) with
  | Float_0 d1, Float_0 d2 -> d1           > d2
  | Float_0 d1, Float_1 d2 -> (d1 * 10)    > d2
  | Float_0 d1, Float_2 d2 -> (d1 * 100)   > d2
  | Float_0 d1, Float_3 d2 -> (d1 * 1000)  > d2
  | Float_0 d1, Float_4 d2 -> (d1 * 10000) > d2

  | Float_1 d1, Float_0 d2 -> d1           > (d2 * 10)
  | Float_1 d1, Float_1 d2 -> d1           > d2
  | Float_1 d1, Float_2 d2 -> (d1 * 10)    > d2
  | Float_1 d1, Float_3 d2 -> (d1 * 100)   > d2
  | Float_1 d1, Float_4 d2 -> (d1 * 1000)  > d2

  | Float_2 d1, Float_0 d2 -> d1           > (d2 * 100)
  | Float_2 d1, Float_1 d2 -> d1           > (d2 * 10)
  | Float_2 d1, Float_2 d2 -> d1           > d2
  | Float_2 d1, Float_3 d2 -> (d1 * 10)    > d2
  | Float_2 d1, Float_4 d2 -> (d1 * 100)   > d2

  | Float_3 d1, Float_0 d2 -> d1           > (d2 * 1000)
  | Float_3 d1, Float_1 d2 -> d1           > (d2 * 100)
  | Float_3 d1, Float_2 d2 -> d1           > (d2 * 10)
  | Float_3 d1, Float_3 d2 -> d1           > d2
  | Float_3 d1, Float_4 d2 -> (d1 * 10)    > d2

  | Float_4 d1, Float_0 d2 -> d1           > (d2 * 10000)
  | Float_4 d1, Float_1 d2 -> d1           > (d2 * 1000)
  | Float_4 d1, Float_2 d2 -> d1           > (d2 * 100)
  | Float_4 d1, Float_3 d2 -> d1           > (d2 * 10)
  | Float_4 d1, Float_4 d2 -> d1           > d2
;;

(** float 1 < float 2 *)
let float_LessThan ( fOne :fix_float) (fTwo : fix_float ) =
  match (fOne, fTwo) with
  | Float_0 d1, Float_0 d2 -> d1           < d2
  | Float_0 d1, Float_1 d2 -> (d1 * 10)    < d2
  | Float_0 d1, Float_2 d2 -> (d1 * 100)   < d2
  | Float_0 d1, Float_3 d2 -> (d1 * 1000)  < d2
  | Float_0 d1, Float_4 d2 -> (d1 * 10000) < d2

  | Float_1 d1, Float_0 d2 -> d1           < (d2 * 10)
  | Float_1 d1, Float_1 d2 -> d1           < d2
  | Float_1 d1, Float_2 d2 -> (d1 * 10)    < d2
  | Float_1 d1, Float_3 d2 -> (d1 * 100)   < d2
  | Float_1 d1, Float_4 d2 -> (d1 * 1000)  < d2

  | Float_2 d1, Float_0 d2 -> d1           < (d2 * 100)
  | Float_2 d1, Float_1 d2 -> d1           < (d2 * 10)
  | Float_2 d1, Float_2 d2 -> d1           < d2
  | Float_2 d1, Float_3 d2 -> (d1 * 10)    < d2
  | Float_2 d1, Float_4 d2 -> (d1 * 100)   < d2

  | Float_3 d1, Float_0 d2 -> d1           < (d2 * 1000)
  | Float_3 d1, Float_1 d2 -> d1           < (d2 * 100)
  | Float_3 d1, Float_2 d2 -> d1           < (d2 * 10)
  | Float_3 d1, Float_3 d2 -> d1           < d2
  | Float_3 d1, Float_4 d2 -> (d1 * 10)    < d2

  | Float_4 d1, Float_0 d2 -> d1           < (d2 * 10000)
  | Float_4 d1, Float_1 d2 -> d1           < (d2 * 1000)
  | Float_4 d1, Float_2 d2 -> d1           < (d2 * 100)
  | Float_4 d1, Float_3 d2 -> d1           < (d2 * 10)
  | Float_4 d1, Float_4 d2 -> d1           < d2
;;

(** float1 >= float2 *)
let float_GreaterThanEqual ( fOne : fix_float) (fTwo : fix_float  ) =
    not (float_LessThan fOne fTwo)
;;

(** float1 <= float2 *)
let float_LessThanEqual ( fOne : fix_float) (fTwo : fix_float  ) =
    not (float_GreaterThan fOne fTwo)
;;

(** float1 == float2 *)
let float_Equal (fOne : fix_float) (fTwo : fix_float) =
  match (fOne, fTwo) with
  | Float_0 d1, Float_0 d2 -> d1           = d2
  | Float_0 d1, Float_1 d2 -> (d1 * 10)    = d2
  | Float_0 d1, Float_2 d2 -> (d1 * 100)   = d2
  | Float_0 d1, Float_3 d2 -> (d1 * 1000)  = d2
  | Float_0 d1, Float_4 d2 -> (d1 * 10000) = d2

  | Float_1 d1, Float_0 d2 -> d1           = (d2 * 10)
  | Float_1 d1, Float_1 d2 -> d1           = d2
  | Float_1 d1, Float_2 d2 -> (d1 * 10)    = d2
  | Float_1 d1, Float_3 d2 -> (d1 * 100)   = d2
  | Float_1 d1, Float_4 d2 -> (d1 * 1000)  = d2

  | Float_2 d1, Float_0 d2 -> d1           = (d2 * 100)
  | Float_2 d1, Float_1 d2 -> d1           = (d2 * 10)
  | Float_2 d1, Float_2 d2 -> d1           = d2
  | Float_2 d1, Float_3 d2 -> (d1 * 10)    = d2
  | Float_2 d1, Float_4 d2 -> (d1 * 100)   = d2

  | Float_3 d1, Float_0 d2 -> d1           = (d2 * 1000)
  | Float_3 d1, Float_1 d2 -> d1           = (d2 * 100)
  | Float_3 d1, Float_2 d2 -> d1           = (d2 * 10)
  | Float_3 d1, Float_3 d2 -> d1           = d2
  | Float_3 d1, Float_4 d2 -> (d1 * 10)    = d2

  | Float_4 d1, Float_0 d2 -> d1           = (d2 * 10000)
  | Float_4 d1, Float_1 d2 -> d1           = (d2 * 1000)
  | Float_4 d1, Float_2 d2 -> d1           = (d2 * 100)
  | Float_4 d1, Float_3 d2 -> d1           = (d2 * 10)
  | Float_4 d1, Float_4 d2 -> d1           = d2
;;

let float_is_zero (x : fix_float) =
  match x with
  | Float_0 0 -> true
  | Float_0 _ -> false
  | Float_1 0 -> true
  | Float_1 _ -> false
  | Float_2 0 -> true
  | Float_2 _ -> false
  | Float_3 0 -> true
  | Float_3 _ -> false
  | Float_4 0 -> true
  | Float_4 _ -> false
;;

let float_is_one (x : fix_float) =
  match x with
  | Float_0 1     -> true
  | Float_0 _     -> false
  | Float_1 10    -> true
  | Float_1 _     -> false
  | Float_2 100   -> true
  | Float_2 _     -> false
  | Float_3 1000  -> true
  | Float_3 _     -> false
  | Float_4 10000 -> true
  | Float_4 _     -> false
;;

let float_higher_precision (x : fix_float) (y : fix_float) =
  match (x, y) with
  | Float_0 _, _ -> false
  | Float_1 _, Float_0 _ -> true
  | Float_1 _, _ -> false
  | Float_2 _, Float_0 _ -> true
  | Float_2 _, Float_1 _ -> true
  | Float_2 _, _ -> false
  | Float_3 _, Float_0 _ -> true
  | Float_3 _, Float_1 _ -> true
  | Float_3 _, Float_2 _ -> true
  | Float_3 _, _ -> false
  | Float_4 _, Float_0 _ -> true
  | Float_4 _, Float_1 _ -> true
  | Float_4 _, Float_2 _ -> true
  | Float_4 _, Float_3 _ -> true
  | Float_4 _, _ -> false
;;

let float_equal_precision (x: fix_float) (y : fix_float) =
  match (x, y) with
  | Float_0 _, Float_0 _ -> true
  | Float_1 _, Float_1 _ -> true
  | Float_2 _, Float_2 _ -> true
  | Float_3 _, Float_3 _ -> true
  | Float_4 _, Float_4 _ -> true
  | _ -> false
;;
