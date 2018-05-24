(** Numeric types and operations. *)
(***

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2018

    numeric.ml

*)
type fix_float_0 =
    | Float_0 of int
;;

type fix_float_1 =
    | Float_1 of int
;;

type fix_float_2 =
    | Float_2 of int
;;

type fix_float_3 =
    | Float_3 of int
;;

type fix_float_4 =
    | Float_4 of int
;;

type fix_float = fix_float_4
;;

let float_Create_0 (x : int)  : fix_float_0 =
    Float_0 x
;;

let float_Create_1 (x : int)  : fix_float_1 =
    Float_1 x
;;

let float_Create_2 (x : int)  : fix_float_2 =
    Float_2 x
;;

let float_Create_3 (x : int)  : fix_float_3 =
    Float_3 x
;;

let float_Create_4 (x : int)  : fix_float_4 =
    Float_4 x
;;

let float_Create (x : int)  : fix_float =
    Float_4 x
;;

let float_Convert_0_0 (f : fix_float_0)  : fix_float_0 =
    f
;;

let float_Convert_0_1 (f : fix_float_0)  : fix_float_1 =
    (match f with
        | Float_0 f -> (Float_1 (( * ) f 10))
    )
;;

let float_Convert_0_2 (f : fix_float_0)  : fix_float_2 =
    (match f with
        | Float_0 f -> (Float_2 (( * ) f 100))
    )
;;

let float_Convert_0_3 (f : fix_float_0)  : fix_float_3 =
    (match f with
        | Float_0 f -> (Float_3 (( * ) f 1000))
    )
;;

let float_Convert_0_4 (f : fix_float_0)  : fix_float_4 =
    (match f with
        | Float_0 f -> (Float_4 (( * ) f 10000))
    )
;;

let float_Convert_1_0 (f : fix_float_1)  : fix_float_0 =
    (match f with
        | Float_1 f -> (Float_0 ((/) f 10))
    )
;;

let float_Convert_1_1 (f : fix_float_1)  : fix_float_1 =
    f
;;

let float_Convert_1_2 (f : fix_float_1)  : fix_float_2 =
    (match f with
        | Float_1 f -> (Float_2 (( * ) f 10))
    )
;;

let float_Convert_1_3 (f : fix_float_1)  : fix_float_3 =
    (match f with
        | Float_1 f -> (Float_3 (( * ) f 100))
    )
;;

let float_Convert_1_4 (f : fix_float_1)  : fix_float_4 =
    (match f with
        | Float_1 f -> (Float_4 (( * ) f 1000))
    )
;;

let float_Convert_2_0 (f : fix_float_2)  : fix_float_0 =
    (match f with
        | Float_2 f -> (Float_0 ((/) f 100))
    )
;;

let float_Convert_2_1 (f : fix_float_2)  : fix_float_1 =
    (match f with
        | Float_2 f -> (Float_1 ((/) f 10))
    )
;;

let float_Convert_2_2 (f : fix_float_2)  : fix_float_2 =
    f
;;

let float_Convert_2_3 (f : fix_float_2)  : fix_float_3 =
    (match f with
        | Float_2 f -> (Float_3 (( * ) f 10))
    )
;;

let float_Convert_2_4 (f : fix_float_2)  : fix_float_4 =
    (match f with
        | Float_2 f -> (Float_4 (( * ) f 100))
    )
;;

let float_Convert_3_0 (f : fix_float_3)  : fix_float_0 =
    (match f with
        | Float_3 f -> (Float_0 ((/) f 1000))
    )
;;

let float_Convert_3_1 (f : fix_float_3)  : fix_float_1 =
    (match f with
        | Float_3 f -> (Float_1 ((/) f 100))
    )
;;

let float_Convert_3_2 (f : fix_float_3)  : fix_float_2 =
    (match f with
        | Float_3 f -> (Float_2 ((/) f 10))
    )
;;

let float_Convert_3_3 (f : fix_float_3)  : fix_float_3 =
    f
;;

let float_Convert_3_4 (f : fix_float_3)  : fix_float_4 =
    (match f with
        | Float_3 f -> (Float_4 (( * ) f 10))
    )
;;

let float_Convert_4_0 (f : fix_float_4)  : fix_float_0 =
    (match f with
        | Float_4 f -> (Float_0 ((/) f 10000))
    )
;;

let float_Convert_4_1 (f : fix_float_4)  : fix_float_1 =
    (match f with
        | Float_4 f -> (Float_1 ((/) f 1000))
    )
;;

let float_Convert_4_2 (f : fix_float_4)  : fix_float_2 =
    (match f with
        | Float_4 f -> (Float_2 ((/) f 100))
    )
;;

let float_Convert_4_3 (f : fix_float_4)  : fix_float_3 =
    (match f with
        | Float_4 f -> (Float_3 ((/) f 10))
    )
;;

let float_Convert_4_4 (f : fix_float_4)  : fix_float_4 =
    f
;;

let float_Add_0_0 (f : fix_float_0) (x : fix_float_0)  : fix_float_0 =
    (match (f,x) with
        | (Float_0 f,Float_0 x) -> (Float_0 ((+) f x))
    )
;;

let float_Add_0_1 (f : fix_float_0) (x : fix_float_1)  : fix_float_1 =
    (match (f,x) with
        | (Float_0 f,Float_1 x) -> (Float_1 ((+) (( * ) f 10) x))
    )
;;

let float_Add_0_2 (f : fix_float_0) (x : fix_float_2)  : fix_float_2 =
    (match (f,x) with
        | (Float_0 f,Float_2 x) -> (Float_2 ((+) (( * ) f 100) x))
    )
;;

let float_Add_0_3 (f : fix_float_0) (x : fix_float_3)  : fix_float_3 =
    (match (f,x) with
        | (Float_0 f,Float_3 x) -> (Float_3 ((+) (( * ) f 1000) x))
    )
;;

let float_Add_0_4 (f : fix_float_0) (x : fix_float_4)  : fix_float_4 =
    (match (f,x) with
        | (Float_0 f,Float_4 x) -> (Float_4 ((+) (( * ) f 10000) x))
    )
;;

let float_Add_1_0 (f : fix_float_1) (x : fix_float_0)  : fix_float_1 =
    (match (f,x) with
        | (Float_1 f,Float_0 x) -> (Float_1 ((+) f (( * ) x 10)))
    )
;;

let float_Add_1_1 (f : fix_float_1) (x : fix_float_1)  : fix_float_1 =
    (match (f,x) with
        | (Float_1 f,Float_1 x) -> (Float_1 ((+) f x))
    )
;;

let float_Add_1_2 (f : fix_float_1) (x : fix_float_2)  : fix_float_2 =
    (match (f,x) with
        | (Float_1 f,Float_2 x) -> (Float_2 ((+) (( * ) f 10) x))
    )
;;

let float_Add_1_3 (f : fix_float_1) (x : fix_float_3)  : fix_float_3 =
    (match (f,x) with
        | (Float_1 f,Float_3 x) -> (Float_3 ((+) (( * ) f 100) x))
    )
;;

let float_Add_1_4 (f : fix_float_1) (x : fix_float_4)  : fix_float_4 =
    (match (f,x) with
        | (Float_1 f,Float_4 x) -> (Float_4 ((+) (( * ) f 1000) x))
    )
;;

let float_Add_2_0 (f : fix_float_2) (x : fix_float_0)  : fix_float_2 =
    (match (f,x) with
        | (Float_2 f,Float_0 x) -> (Float_2 ((+) f (( * ) x 100)))
    )
;;

let float_Add_2_1 (f : fix_float_2) (x : fix_float_1)  : fix_float_2 =
    (match (f,x) with
        | (Float_2 f,Float_1 x) -> (Float_2 ((+) f (( * ) x 10)))
    )
;;

let float_Add_2_2 (f : fix_float_2) (x : fix_float_2)  : fix_float_2 =
    (match (f,x) with
        | (Float_2 f,Float_2 x) -> (Float_2 ((+) f x))
    )
;;

let float_Add_2_3 (f : fix_float_2) (x : fix_float_3)  : fix_float_3 =
    (match (f,x) with
        | (Float_2 f,Float_3 x) -> (Float_3 ((+) (( * ) f 10) x))
    )
;;

let float_Add_2_4 (f : fix_float_2) (x : fix_float_4)  : fix_float_4 =
    (match (f,x) with
        | (Float_2 f,Float_4 x) -> (Float_4 ((+) (( * ) f 100) x))
    )
;;

let float_Add_3_0 (f : fix_float_3) (x : fix_float_0)  : fix_float_3 =
    (match (f,x) with
        | (Float_3 f,Float_0 x) -> (Float_3 ((+) f (( * ) x 1000)))
    )
;;

let float_Add_3_1 (f : fix_float_3) (x : fix_float_1)  : fix_float_3 =
    (match (f,x) with
        | (Float_3 f,Float_1 x) -> (Float_3 ((+) f (( * ) x 100)))
    )
;;

let float_Add_3_2 (f : fix_float_3) (x : fix_float_2)  : fix_float_3 =
    (match (f,x) with
        | (Float_3 f,Float_2 x) -> (Float_3 ((+) f (( * ) x 10)))
    )
;;

let float_Add_3_3 (f : fix_float_3) (x : fix_float_3)  : fix_float_3 =
    (match (f,x) with
        | (Float_3 f,Float_3 x) -> (Float_3 ((+) f x))
    )
;;

let float_Add_3_4 (f : fix_float_3) (x : fix_float_4)  : fix_float_4 =
    (match (f,x) with
        | (Float_3 f,Float_4 x) -> (Float_4 ((+) (( * ) f 10) x))
    )
;;

let float_Add_4_0 (f : fix_float_4) (x : fix_float_0)  : fix_float_4 =
    (match (f,x) with
        | (Float_4 f,Float_0 x) -> (Float_4 ((+) f (( * ) x 10000)))
    )
;;

let float_Add_4_1 (f : fix_float_4) (x : fix_float_1)  : fix_float_4 =
    (match (f,x) with
        | (Float_4 f,Float_1 x) -> (Float_4 ((+) f (( * ) x 1000)))
    )
;;

let float_Add_4_2 (f : fix_float_4) (x : fix_float_2)  : fix_float_4 =
    (match (f,x) with
        | (Float_4 f,Float_2 x) -> (Float_4 ((+) f (( * ) x 100)))
    )
;;

let float_Add_4_3 (f : fix_float_4) (x : fix_float_3)  : fix_float_4 =
    (match (f,x) with
        | (Float_4 f,Float_3 x) -> (Float_4 ((+) f (( * ) x 10)))
    )
;;

let float_Add_4_4 (f : fix_float_4) (x : fix_float_4)  : fix_float_4 =
    (match (f,x) with
        | (Float_4 f,Float_4 x) -> (Float_4 ((+) f x))
    )
;;

let float_Mult_0_0 (f : fix_float_0) (x : fix_float_0)  : fix_float_0 =
    (match (f,x) with
        | (Float_0 f,Float_0 x) -> (Float_0 (( * ) f x))
    )
;;

let float_Mult_0_1 (f : fix_float_0) (x : fix_float_1)  : fix_float_1 =
    (match (f,x) with
        | (Float_0 f,Float_1 x) -> (Float_1 (( * ) f x))
    )
;;

let float_Mult_0_2 (f : fix_float_0) (x : fix_float_2)  : fix_float_2 =
    (match (f,x) with
        | (Float_0 f,Float_2 x) -> (Float_2 (( * ) f x))
    )
;;

let float_Mult_0_3 (f : fix_float_0) (x : fix_float_3)  : fix_float_3 =
    (match (f,x) with
        | (Float_0 f,Float_3 x) -> (Float_3 (( * ) f x))
    )
;;

let float_Mult_0_4 (f : fix_float_0) (x : fix_float_4)  : fix_float_4 =
    (match (f,x) with
        | (Float_0 f,Float_4 x) -> (Float_4 (( * ) f x))
    )
;;

let float_Mult_1_0 (f : fix_float_1) (x : fix_float_0)  : fix_float_1 =
    (match (f,x) with
        | (Float_1 f,Float_0 x) -> (Float_1 (( * ) f x))
    )
;;

let float_Mult_1_1 (f : fix_float_1) (x : fix_float_1)  : fix_float_1 =
    (match (f,x) with
        | (Float_1 f,Float_1 x) -> (Float_1 (( / ) (( * ) f x) 10))
    )
;;

let float_Mult_1_2 (f : fix_float_1) (x : fix_float_2)  : fix_float_2 =
    (match (f,x) with
        | (Float_1 f,Float_2 x) -> (Float_2 (( / ) (( * ) f x) 10))
    )
;;

let float_Mult_1_3 (f : fix_float_1) (x : fix_float_3)  : fix_float_3 =
    (match (f,x) with
        | (Float_1 f,Float_3 x) -> (Float_3 (( / ) (( * ) f x) 10))
    )
;;

let float_Mult_1_4 (f : fix_float_1) (x : fix_float_4)  : fix_float_4 =
    (match (f,x) with
        | (Float_1 f,Float_4 x) -> (Float_4 (( / ) (( * ) f x) 10))
    )
;;

let float_Mult_2_0 (f : fix_float_2) (x : fix_float_0)  : fix_float_2 =
    (match (f,x) with
        | (Float_2 f,Float_0 x) -> (Float_2 (( * ) f x))
    )
;;

let float_Mult_2_1 (f : fix_float_2) (x : fix_float_1)  : fix_float_2 =
    (match (f,x) with
        | (Float_2 f,Float_1 x) -> (Float_2 (( / ) (( * ) f x) 10))
    )
;;

let float_Mult_2_2 (f : fix_float_2) (x : fix_float_2)  : fix_float_2 =
    (match (f,x) with
        | (Float_2 f,Float_2 x) -> (Float_2 (( / ) (( * ) f x) 100))
    )
;;

let float_Mult_2_3 (f : fix_float_2) (x : fix_float_3)  : fix_float_3 =
    (match (f,x) with
        | (Float_2 f,Float_3 x) -> (Float_3 (( / ) (( * ) f x) 100))
    )
;;

let float_Mult_2_4 (f : fix_float_2) (x : fix_float_4)  : fix_float_4 =
    (match (f,x) with
        | (Float_2 f,Float_4 x) -> (Float_4 (( / ) (( * ) f x) 100))
    )
;;

let float_Mult_3_0 (f : fix_float_3) (x : fix_float_0)  : fix_float_3 =
    (match (f,x) with
        | (Float_3 f,Float_0 x) -> (Float_3 (( * ) f x))
    )
;;

let float_Mult_3_1 (f : fix_float_3) (x : fix_float_1)  : fix_float_3 =
    (match (f,x) with
        | (Float_3 f,Float_1 x) -> (Float_3 (( / ) (( * ) f x) 10))
    )
;;

let float_Mult_3_2 (f : fix_float_3) (x : fix_float_2)  : fix_float_3 =
    (match (f,x) with
        | (Float_3 f,Float_2 x) -> (Float_3 (( / ) (( * ) f x) 100))
    )
;;

let float_Mult_3_3 (f : fix_float_3) (x : fix_float_3)  : fix_float_3 =
    (match (f,x) with
        | (Float_3 f,Float_3 x) -> (Float_3 (( / ) (( * ) f x) 1000))
    )
;;

let float_Mult_3_4 (f : fix_float_3) (x : fix_float_4)  : fix_float_4 =
    (match (f,x) with
        | (Float_3 f,Float_4 x) -> (Float_4 (( / ) (( * ) f x) 1000))
    )
;;

let float_Mult_4_0 (f : fix_float_4) (x : fix_float_0)  : fix_float_4 =
    (match (f,x) with
        | (Float_4 f,Float_0 x) -> (Float_4 (( * ) f x))
    )
;;

let float_Mult_4_1 (f : fix_float_4) (x : fix_float_1)  : fix_float_4 =
    (match (f,x) with
        | (Float_4 f,Float_1 x) -> (Float_4 (( / ) (( * ) f x) 10))
    )
;;

let float_Mult_4_2 (f : fix_float_4) (x : fix_float_2)  : fix_float_4 =
    (match (f,x) with
        | (Float_4 f,Float_2 x) -> (Float_4 (( / ) (( * ) f x) 100))
    )
;;

let float_Mult_4_3 (f : fix_float_4) (x : fix_float_3)  : fix_float_4 =
    (match (f,x) with
        | (Float_4 f,Float_3 x) -> (Float_4 (( / ) (( * ) f x) 1000))
    )
;;

let float_Mult_4_4 (f : fix_float_4) (x : fix_float_4)  : fix_float_4 =
    (match (f,x) with
        | (Float_4 f,Float_4 x) -> (Float_4 (( / ) (( * ) f x) 10000))
    )
;;

let float_Sub_0_0 (f : fix_float_0) (x : fix_float_0)  : fix_float_0 =
    (match (f,x) with
        | (Float_0 f,Float_0 x) -> (Float_0 ((-) f x))
    )
;;

let float_Sub_0_1 (f : fix_float_0) (x : fix_float_1)  : fix_float_1 =
    (match (f,x) with
        | (Float_0 f,Float_1 x) -> (Float_1 ((-) (( * ) f 10) x))
    )
;;

let float_Sub_0_2 (f : fix_float_0) (x : fix_float_2)  : fix_float_2 =
    (match (f,x) with
        | (Float_0 f,Float_2 x) -> (Float_2 ((-) (( * ) f 100) x))
    )
;;

let float_Sub_0_3 (f : fix_float_0) (x : fix_float_3)  : fix_float_3 =
    (match (f,x) with
        | (Float_0 f,Float_3 x) -> (Float_3 ((-) (( * ) f 1000) x))
    )
;;

let float_Sub_0_4 (f : fix_float_0) (x : fix_float_4)  : fix_float_4 =
    (match (f,x) with
        | (Float_0 f,Float_4 x) -> (Float_4 ((-) (( * ) f 10000) x))
    )
;;

let float_Sub_1_0 (f : fix_float_1) (x : fix_float_0)  : fix_float_1 =
    (match (f,x) with
        | (Float_1 f,Float_0 x) -> (Float_1 ((-) f (( * ) x 10)))
    )
;;

let float_Sub_1_1 (f : fix_float_1) (x : fix_float_1)  : fix_float_1 =
    (match (f,x) with
        | (Float_1 f,Float_1 x) -> (Float_1 ((-) f x))
    )
;;

let float_Sub_1_2 (f : fix_float_1) (x : fix_float_2)  : fix_float_2 =
    (match (f,x) with
        | (Float_1 f,Float_2 x) -> (Float_2 ((-) (( * ) f 10) x))
    )
;;

let float_Sub_1_3 (f : fix_float_1) (x : fix_float_3)  : fix_float_3 =
    (match (f,x) with
        | (Float_1 f,Float_3 x) -> (Float_3 ((-) (( * ) f 100) x))
    )
;;

let float_Sub_1_4 (f : fix_float_1) (x : fix_float_4)  : fix_float_4 =
    (match (f,x) with
        | (Float_1 f,Float_4 x) -> (Float_4 ((-) (( * ) f 1000) x))
    )
;;

let float_Sub_2_0 (f : fix_float_2) (x : fix_float_0)  : fix_float_2 =
    (match (f,x) with
        | (Float_2 f,Float_0 x) -> (Float_2 ((-) f (( * ) x 100)))
    )
;;

let float_Sub_2_1 (f : fix_float_2) (x : fix_float_1)  : fix_float_2 =
    (match (f,x) with
        | (Float_2 f,Float_1 x) -> (Float_2 ((-) f (( * ) x 10)))
    )
;;

let float_Sub_2_2 (f : fix_float_2) (x : fix_float_2)  : fix_float_2 =
    (match (f,x) with
        | (Float_2 f,Float_2 x) -> (Float_2 ((-) f x))
    )
;;

let float_Sub_2_3 (f : fix_float_2) (x : fix_float_3)  : fix_float_3 =
    (match (f,x) with
        | (Float_2 f,Float_3 x) -> (Float_3 ((-) (( * ) f 10) x))
    )
;;

let float_Sub_2_4 (f : fix_float_2) (x : fix_float_4)  : fix_float_4 =
    (match (f,x) with
        | (Float_2 f,Float_4 x) -> (Float_4 ((-) (( * ) f 100) x))
    )
;;

let float_Sub_3_0 (f : fix_float_3) (x : fix_float_0)  : fix_float_3 =
    (match (f,x) with
        | (Float_3 f,Float_0 x) -> (Float_3 ((-) f (( * ) x 1000)))
    )
;;

let float_Sub_3_1 (f : fix_float_3) (x : fix_float_1)  : fix_float_3 =
    (match (f,x) with
        | (Float_3 f,Float_1 x) -> (Float_3 ((-) f (( * ) x 100)))
    )
;;

let float_Sub_3_2 (f : fix_float_3) (x : fix_float_2)  : fix_float_3 =
    (match (f,x) with
        | (Float_3 f,Float_2 x) -> (Float_3 ((-) f (( * ) x 10)))
    )
;;

let float_Sub_3_3 (f : fix_float_3) (x : fix_float_3)  : fix_float_3 =
    (match (f,x) with
        | (Float_3 f,Float_3 x) -> (Float_3 ((-) f x))
    )
;;

let float_Sub_3_4 (f : fix_float_3) (x : fix_float_4)  : fix_float_4 =
    (match (f,x) with
        | (Float_3 f,Float_4 x) -> (Float_4 ((-) (( * ) f 10) x))
    )
;;

let float_Sub_4_0 (f : fix_float_4) (x : fix_float_0)  : fix_float_4 =
    (match (f,x) with
        | (Float_4 f,Float_0 x) -> (Float_4 ((-) f (( * ) x 10000)))
    )
;;

let float_Sub_4_1 (f : fix_float_4) (x : fix_float_1)  : fix_float_4 =
    (match (f,x) with
        | (Float_4 f,Float_1 x) -> (Float_4 ((-) f (( * ) x 1000)))
    )
;;

let float_Sub_4_2 (f : fix_float_4) (x : fix_float_2)  : fix_float_4 =
    (match (f,x) with
        | (Float_4 f,Float_2 x) -> (Float_4 ((-) f (( * ) x 100)))
    )
;;

let float_Sub_4_3 (f : fix_float_4) (x : fix_float_3)  : fix_float_4 =
    (match (f,x) with
        | (Float_4 f,Float_3 x) -> (Float_4 ((-) f (( * ) x 10)))
    )
;;

let float_Sub_4_4 (f : fix_float_4) (x : fix_float_4)  : fix_float_4 =
    (match (f,x) with
        | (Float_4 f,Float_4 x) -> (Float_4 ((-) f x))
    )
;;

let float_Div_0_0 (f : fix_float_0) (x : fix_float_0)  : fix_float_0 =
    (match (f,x) with
        | (Float_0 f,Float_0 x) -> (Float_0 (( / ) f x))
    )
;;

let float_Div_0_1 (f : fix_float_0) (x : fix_float_1)  : fix_float_1 =
    (match (f,x) with
        | (Float_0 f,Float_1 x) -> (Float_1 (( / ) (( * ) f 100) x))
    )
;;

let float_Div_0_2 (f : fix_float_0) (x : fix_float_2)  : fix_float_2 =
    (match (f,x) with
        | (Float_0 f,Float_2 x) -> (Float_2 (( / ) (( * ) f 10000) x))
    )
;;

let float_Div_0_3 (f : fix_float_0) (x : fix_float_3)  : fix_float_3 =
    (match (f,x) with
        | (Float_0 f,Float_3 x) -> (Float_3 (( / ) (( * ) f 1000000) x))
    )
;;

let float_Div_0_4 (f : fix_float_0) (x : fix_float_4)  : fix_float_4 =
    (match (f,x) with
        | (Float_0 f,Float_4 x) -> (Float_4 (( / ) (( * ) f 100000000) x))
    )
;;

let float_Div_1_0 (f : fix_float_1) (x : fix_float_0)  : fix_float_1 =
    (match (f,x) with
        | (Float_1 f,Float_0 x) -> (Float_1 (( / ) f x))
    )
;;

let float_Div_1_1 (f : fix_float_1) (x : fix_float_1)  : fix_float_1 =
    (match (f,x) with
        | (Float_1 f,Float_1 x) -> (Float_1 (( / ) (( * ) f 10) x))
    )
;;

let float_Div_1_2 (f : fix_float_1) (x : fix_float_2)  : fix_float_2 =
    (match (f,x) with
        | (Float_1 f,Float_2 x) -> (Float_2 (( / ) (( * ) f 1000) x))
    )
;;

let float_Div_1_3 (f : fix_float_1) (x : fix_float_3)  : fix_float_3 =
    (match (f,x) with
        | (Float_1 f,Float_3 x) -> (Float_3 (( / ) (( * ) f 100000) x))
    )
;;

let float_Div_1_4 (f : fix_float_1) (x : fix_float_4)  : fix_float_4 =
    (match (f,x) with
        | (Float_1 f,Float_4 x) -> (Float_4 (( / ) (( * ) f 10000000) x))
    )
;;

let float_Div_2_0 (f : fix_float_2) (x : fix_float_0)  : fix_float_2 =
    (match (f,x) with
        | (Float_2 f,Float_0 x) -> (Float_2 (( / ) f x))
    )
;;

let float_Div_2_1 (f : fix_float_2) (x : fix_float_1)  : fix_float_2 =
    (match (f,x) with
        | (Float_2 f,Float_1 x) -> (Float_2 (( / ) (( * ) f 10) x))
    )
;;

let float_Div_2_2 (f : fix_float_2) (x : fix_float_2)  : fix_float_2 =
    (match (f,x) with
        | (Float_2 f,Float_2 x) -> (Float_2 (( / ) (( * ) f 100) x))
    )
;;

let float_Div_2_3 (f : fix_float_2) (x : fix_float_3)  : fix_float_3 =
    (match (f,x) with
        | (Float_2 f,Float_3 x) -> (Float_3 (( / ) (( * ) f 10000) x))
    )
;;

let float_Div_2_4 (f : fix_float_2) (x : fix_float_4)  : fix_float_4 =
    (match (f,x) with
        | (Float_2 f,Float_4 x) -> (Float_4 (( / ) (( * ) f 1000000) x))
    )
;;

let float_Div_3_0 (f : fix_float_3) (x : fix_float_0)  : fix_float_3 =
    (match (f,x) with
        | (Float_3 f,Float_0 x) -> (Float_3 (( / ) f x))
    )
;;

let float_Div_3_1 (f : fix_float_3) (x : fix_float_1)  : fix_float_3 =
    (match (f,x) with
        | (Float_3 f,Float_1 x) -> (Float_3 (( / ) (( * ) f 10) x))
    )
;;

let float_Div_3_2 (f : fix_float_3) (x : fix_float_2)  : fix_float_3 =
    (match (f,x) with
        | (Float_3 f,Float_2 x) -> (Float_3 (( / ) (( * ) f 100) x))
    )
;;

let float_Div_3_3 (f : fix_float_3) (x : fix_float_3)  : fix_float_3 =
    (match (f,x) with
        | (Float_3 f,Float_3 x) -> (Float_3 (( / ) (( * ) f 1000) x))
    )
;;

let float_Div_3_4 (f : fix_float_3) (x : fix_float_4)  : fix_float_4 =
    (match (f,x) with
        | (Float_3 f,Float_4 x) -> (Float_4 (( / ) (( * ) f 100000) x))
    )
;;

let float_Div_4_0 (f : fix_float_4) (x : fix_float_0)  : fix_float_4 =
    (match (f,x) with
        | (Float_4 f,Float_0 x) -> (Float_4 (( / ) f x))
    )
;;

let float_Div_4_1 (f : fix_float_4) (x : fix_float_1)  : fix_float_4 =
    (match (f,x) with
        | (Float_4 f,Float_1 x) -> (Float_4 (( / ) (( * ) f 10) x))
    )
;;

let float_Div_4_2 (f : fix_float_4) (x : fix_float_2)  : fix_float_4 =
    (match (f,x) with
        | (Float_4 f,Float_2 x) -> (Float_4 (( / ) (( * ) f 100) x))
    )
;;

let float_Div_4_3 (f : fix_float_4) (x : fix_float_3)  : fix_float_4 =
    (match (f,x) with
        | (Float_4 f,Float_3 x) -> (Float_4 (( / ) (( * ) f 1000) x))
    )
;;

let float_Div_4_4 (f : fix_float_4) (x : fix_float_4)  : fix_float_4 =
    (match (f,x) with
        | (Float_4 f,Float_4 x) -> (Float_4 (( / ) (( * ) f 10000) x))
    )
;;

let float_Neg_0 (f : fix_float_0)  : fix_float_0 =
    (match f with
        | Float_0 f -> (Float_0 ((-) 0 f))
    )
;;

let float_Neg_1 (f : fix_float_1)  : fix_float_1 =
    (match f with
        | Float_1 f -> (Float_1 ((-) 0 f))
    )
;;

let float_Neg_2 (f : fix_float_2)  : fix_float_2 =
    (match f with
        | Float_2 f -> (Float_2 ((-) 0 f))
    )
;;

let float_Neg_3 (f : fix_float_3)  : fix_float_3 =
    (match f with
        | Float_3 f -> (Float_3 ((-) 0 f))
    )
;;

let float_Neg_4 (f : fix_float_4)  : fix_float_4 =
    (match f with
        | Float_4 f -> (Float_4 ((-) 0 f))
    )
;;

let float_GreaterThan_0_0 (f : fix_float_0) (x : fix_float_0)  : bool =
    (match (f,x) with
        | (Float_0 f,Float_0 x) -> ((>) f x)
    )
;;

let float_GreaterThan_0_1 (f : fix_float_0) (x : fix_float_1)  : bool =
    (match (f,x) with
        | (Float_0 f,Float_1 x) -> ((>) (( * ) f 10) x)
    )
;;

let float_GreaterThan_0_2 (f : fix_float_0) (x : fix_float_2)  : bool =
    (match (f,x) with
        | (Float_0 f,Float_2 x) -> ((>) (( * ) f 100) x)
    )
;;

let float_GreaterThan_0_3 (f : fix_float_0) (x : fix_float_3)  : bool =
    (match (f,x) with
        | (Float_0 f,Float_3 x) -> ((>) (( * ) f 1000) x)
    )
;;

let float_GreaterThan_0_4 (f : fix_float_0) (x : fix_float_4)  : bool =
    (match (f,x) with
        | (Float_0 f,Float_4 x) -> ((>) (( * ) f 10000) x)
    )
;;

let float_GreaterThan_1_0 (f : fix_float_1) (x : fix_float_0)  : bool =
    (match (f,x) with
        | (Float_1 f,Float_0 x) -> ((>) f (( * ) x 10))
    )
;;

let float_GreaterThan_1_1 (f : fix_float_1) (x : fix_float_1)  : bool =
    (match (f,x) with
        | (Float_1 f,Float_1 x) -> ((>) f x)
    )
;;

let float_GreaterThan_1_2 (f : fix_float_1) (x : fix_float_2)  : bool =
    (match (f,x) with
        | (Float_1 f,Float_2 x) -> ((>) (( * ) f 10) x)
    )
;;

let float_GreaterThan_1_3 (f : fix_float_1) (x : fix_float_3)  : bool =
    (match (f,x) with
        | (Float_1 f,Float_3 x) -> ((>) (( * ) f 100) x)
    )
;;

let float_GreaterThan_1_4 (f : fix_float_1) (x : fix_float_4)  : bool =
    (match (f,x) with
        | (Float_1 f,Float_4 x) -> ((>) (( * ) f 1000) x)
    )
;;

let float_GreaterThan_2_0 (f : fix_float_2) (x : fix_float_0)  : bool =
    (match (f,x) with
        | (Float_2 f,Float_0 x) -> ((>) f (( * ) x 100))
    )
;;

let float_GreaterThan_2_1 (f : fix_float_2) (x : fix_float_1)  : bool =
    (match (f,x) with
        | (Float_2 f,Float_1 x) -> ((>) f (( * ) x 10))
    )
;;

let float_GreaterThan_2_2 (f : fix_float_2) (x : fix_float_2)  : bool =
    (match (f,x) with
        | (Float_2 f,Float_2 x) -> ((>) f x)
    )
;;

let float_GreaterThan_2_3 (f : fix_float_2) (x : fix_float_3)  : bool =
    (match (f,x) with
        | (Float_2 f,Float_3 x) -> ((>) (( * ) f 10) x)
    )
;;

let float_GreaterThan_2_4 (f : fix_float_2) (x : fix_float_4)  : bool =
    (match (f,x) with
        | (Float_2 f,Float_4 x) -> ((>) (( * ) f 100) x)
    )
;;

let float_GreaterThan_3_0 (f : fix_float_3) (x : fix_float_0)  : bool =
    (match (f,x) with
        | (Float_3 f,Float_0 x) -> ((>) f (( * ) x 1000))
    )
;;

let float_GreaterThan_3_1 (f : fix_float_3) (x : fix_float_1)  : bool =
    (match (f,x) with
        | (Float_3 f,Float_1 x) -> ((>) f (( * ) x 100))
    )
;;

let float_GreaterThan_3_2 (f : fix_float_3) (x : fix_float_2)  : bool =
    (match (f,x) with
        | (Float_3 f,Float_2 x) -> ((>) f (( * ) x 10))
    )
;;

let float_GreaterThan_3_3 (f : fix_float_3) (x : fix_float_3)  : bool =
    (match (f,x) with
        | (Float_3 f,Float_3 x) -> ((>) f x)
    )
;;

let float_GreaterThan_3_4 (f : fix_float_3) (x : fix_float_4)  : bool =
    (match (f,x) with
        | (Float_3 f,Float_4 x) -> ((>) (( * ) f 10) x)
    )
;;

let float_GreaterThan_4_0 (f : fix_float_4) (x : fix_float_0)  : bool =
    (match (f,x) with
        | (Float_4 f,Float_0 x) -> ((>) f (( * ) x 10000))
    )
;;

let float_GreaterThan_4_1 (f : fix_float_4) (x : fix_float_1)  : bool =
    (match (f,x) with
        | (Float_4 f,Float_1 x) -> ((>) f (( * ) x 1000))
    )
;;

let float_GreaterThan_4_2 (f : fix_float_4) (x : fix_float_2)  : bool =
    (match (f,x) with
        | (Float_4 f,Float_2 x) -> ((>) f (( * ) x 100))
    )
;;

let float_GreaterThan_4_3 (f : fix_float_4) (x : fix_float_3)  : bool =
    (match (f,x) with
        | (Float_4 f,Float_3 x) -> ((>) f (( * ) x 10))
    )
;;

let float_GreaterThan_4_4 (f : fix_float_4) (x : fix_float_4)  : bool =
    (match (f,x) with
        | (Float_4 f,Float_4 x) -> ((>) f x)
    )
;;

let float_LessThan_0_0 (f : fix_float_0) (x : fix_float_0)  : bool =
    (match (f,x) with
        | (Float_0 f,Float_0 x) -> ((<) f x)
    )
;;

let float_LessThan_0_1 (f : fix_float_0) (x : fix_float_1)  : bool =
    (match (f,x) with
        | (Float_0 f,Float_1 x) -> ((<) (( * ) f 10) x)
    )
;;

let float_LessThan_0_2 (f : fix_float_0) (x : fix_float_2)  : bool =
    (match (f,x) with
        | (Float_0 f,Float_2 x) -> ((<) (( * ) f 100) x)
    )
;;

let float_LessThan_0_3 (f : fix_float_0) (x : fix_float_3)  : bool =
    (match (f,x) with
        | (Float_0 f,Float_3 x) -> ((<) (( * ) f 1000) x)
    )
;;

let float_LessThan_0_4 (f : fix_float_0) (x : fix_float_4)  : bool =
    (match (f,x) with
        | (Float_0 f,Float_4 x) -> ((<) (( * ) f 10000) x)
    )
;;

let float_LessThan_1_0 (f : fix_float_1) (x : fix_float_0)  : bool =
    (match (f,x) with
        | (Float_1 f,Float_0 x) -> ((<) f (( * ) x 10))
    )
;;

let float_LessThan_1_1 (f : fix_float_1) (x : fix_float_1)  : bool =
    (match (f,x) with
        | (Float_1 f,Float_1 x) -> ((<) f x)
    )
;;

let float_LessThan_1_2 (f : fix_float_1) (x : fix_float_2)  : bool =
    (match (f,x) with
        | (Float_1 f,Float_2 x) -> ((<) (( * ) f 10) x)
    )
;;

let float_LessThan_1_3 (f : fix_float_1) (x : fix_float_3)  : bool =
    (match (f,x) with
        | (Float_1 f,Float_3 x) -> ((<) (( * ) f 100) x)
    )
;;

let float_LessThan_1_4 (f : fix_float_1) (x : fix_float_4)  : bool =
    (match (f,x) with
        | (Float_1 f,Float_4 x) -> ((<) (( * ) f 1000) x)
    )
;;

let float_LessThan_2_0 (f : fix_float_2) (x : fix_float_0)  : bool =
    (match (f,x) with
        | (Float_2 f,Float_0 x) -> ((<) f (( * ) x 100))
    )
;;

let float_LessThan_2_1 (f : fix_float_2) (x : fix_float_1)  : bool =
    (match (f,x) with
        | (Float_2 f,Float_1 x) -> ((<) f (( * ) x 10))
    )
;;

let float_LessThan_2_2 (f : fix_float_2) (x : fix_float_2)  : bool =
    (match (f,x) with
        | (Float_2 f,Float_2 x) -> ((<) f x)
    )
;;

let float_LessThan_2_3 (f : fix_float_2) (x : fix_float_3)  : bool =
    (match (f,x) with
        | (Float_2 f,Float_3 x) -> ((<) (( * ) f 10) x)
    )
;;

let float_LessThan_2_4 (f : fix_float_2) (x : fix_float_4)  : bool =
    (match (f,x) with
        | (Float_2 f,Float_4 x) -> ((<) (( * ) f 100) x)
    )
;;

let float_LessThan_3_0 (f : fix_float_3) (x : fix_float_0)  : bool =
    (match (f,x) with
        | (Float_3 f,Float_0 x) -> ((<) f (( * ) x 1000))
    )
;;

let float_LessThan_3_1 (f : fix_float_3) (x : fix_float_1)  : bool =
    (match (f,x) with
        | (Float_3 f,Float_1 x) -> ((<) f (( * ) x 100))
    )
;;

let float_LessThan_3_2 (f : fix_float_3) (x : fix_float_2)  : bool =
    (match (f,x) with
        | (Float_3 f,Float_2 x) -> ((<) f (( * ) x 10))
    )
;;

let float_LessThan_3_3 (f : fix_float_3) (x : fix_float_3)  : bool =
    (match (f,x) with
        | (Float_3 f,Float_3 x) -> ((<) f x)
    )
;;

let float_LessThan_3_4 (f : fix_float_3) (x : fix_float_4)  : bool =
    (match (f,x) with
        | (Float_3 f,Float_4 x) -> ((<) (( * ) f 10) x)
    )
;;

let float_LessThan_4_0 (f : fix_float_4) (x : fix_float_0)  : bool =
    (match (f,x) with
        | (Float_4 f,Float_0 x) -> ((<) f (( * ) x 10000))
    )
;;

let float_LessThan_4_1 (f : fix_float_4) (x : fix_float_1)  : bool =
    (match (f,x) with
        | (Float_4 f,Float_1 x) -> ((<) f (( * ) x 1000))
    )
;;

let float_LessThan_4_2 (f : fix_float_4) (x : fix_float_2)  : bool =
    (match (f,x) with
        | (Float_4 f,Float_2 x) -> ((<) f (( * ) x 100))
    )
;;

let float_LessThan_4_3 (f : fix_float_4) (x : fix_float_3)  : bool =
    (match (f,x) with
        | (Float_4 f,Float_3 x) -> ((<) f (( * ) x 10))
    )
;;

let float_LessThan_4_4 (f : fix_float_4) (x : fix_float_4)  : bool =
    (match (f,x) with
        | (Float_4 f,Float_4 x) -> ((<) f x)
    )
;;

let float_GreaterThanEqual_0_0 (f : fix_float_0) (x : fix_float_0)  : bool =
    not (float_LessThan_0_0 f x)
;;

let float_GreaterThanEqual_0_1 (f : fix_float_0) (x : fix_float_1)  : bool =
    not (float_LessThan_0_1 f x)
;;

let float_GreaterThanEqual_0_2 (f : fix_float_0) (x : fix_float_2)  : bool =
    not (float_LessThan_0_2 f x)
;;

let float_GreaterThanEqual_0_3 (f : fix_float_0) (x : fix_float_3)  : bool =
    not (float_LessThan_0_3 f x)
;;

let float_GreaterThanEqual_0_4 (f : fix_float_0) (x : fix_float_4)  : bool =
    not (float_LessThan_0_4 f x)
;;

let float_GreaterThanEqual_1_0 (f : fix_float_1) (x : fix_float_0)  : bool =
    not (float_LessThan_1_0 f x)
;;

let float_GreaterThanEqual_1_1 (f : fix_float_1) (x : fix_float_1)  : bool =
    not (float_LessThan_1_1 f x)
;;

let float_GreaterThanEqual_1_2 (f : fix_float_1) (x : fix_float_2)  : bool =
    not (float_LessThan_1_2 f x)
;;

let float_GreaterThanEqual_1_3 (f : fix_float_1) (x : fix_float_3)  : bool =
    not (float_LessThan_1_3 f x)
;;

let float_GreaterThanEqual_1_4 (f : fix_float_1) (x : fix_float_4)  : bool =
    not (float_LessThan_1_4 f x)
;;

let float_GreaterThanEqual_2_0 (f : fix_float_2) (x : fix_float_0)  : bool =
    not (float_LessThan_2_0 f x)
;;

let float_GreaterThanEqual_2_1 (f : fix_float_2) (x : fix_float_1)  : bool =
    not (float_LessThan_2_1 f x)
;;

let float_GreaterThanEqual_2_2 (f : fix_float_2) (x : fix_float_2)  : bool =
    not (float_LessThan_2_2 f x)
;;

let float_GreaterThanEqual_2_3 (f : fix_float_2) (x : fix_float_3)  : bool =
    not (float_LessThan_2_3 f x)
;;

let float_GreaterThanEqual_2_4 (f : fix_float_2) (x : fix_float_4)  : bool =
    not (float_LessThan_2_4 f x)
;;

let float_GreaterThanEqual_3_0 (f : fix_float_3) (x : fix_float_0)  : bool =
    not (float_LessThan_3_0 f x)
;;

let float_GreaterThanEqual_3_1 (f : fix_float_3) (x : fix_float_1)  : bool =
    not (float_LessThan_3_1 f x)
;;

let float_GreaterThanEqual_3_2 (f : fix_float_3) (x : fix_float_2)  : bool =
    not (float_LessThan_3_2 f x)
;;

let float_GreaterThanEqual_3_3 (f : fix_float_3) (x : fix_float_3)  : bool =
    not (float_LessThan_3_3 f x)
;;

let float_GreaterThanEqual_3_4 (f : fix_float_3) (x : fix_float_4)  : bool =
    not (float_LessThan_3_4 f x)
;;

let float_GreaterThanEqual_4_0 (f : fix_float_4) (x : fix_float_0)  : bool =
    not (float_LessThan_4_0 f x)
;;

let float_GreaterThanEqual_4_1 (f : fix_float_4) (x : fix_float_1)  : bool =
    not (float_LessThan_4_1 f x)
;;

let float_GreaterThanEqual_4_2 (f : fix_float_4) (x : fix_float_2)  : bool =
    not (float_LessThan_4_2 f x)
;;

let float_GreaterThanEqual_4_3 (f : fix_float_4) (x : fix_float_3)  : bool =
    not (float_LessThan_4_3 f x)
;;

let float_GreaterThanEqual_4_4 (f : fix_float_4) (x : fix_float_4)  : bool =
    not (float_LessThan_4_4 f x)
;;

let float_LessThanEqual_0_0 (f : fix_float_0) (x : fix_float_0)  : bool =
    not (float_GreaterThan_0_0 f x)
;;

let float_LessThanEqual_0_1 (f : fix_float_0) (x : fix_float_1)  : bool =
    not (float_GreaterThan_0_1 f x)
;;

let float_LessThanEqual_0_2 (f : fix_float_0) (x : fix_float_2)  : bool =
    not (float_GreaterThan_0_2 f x)
;;

let float_LessThanEqual_0_3 (f : fix_float_0) (x : fix_float_3)  : bool =
    not (float_GreaterThan_0_3 f x)
;;

let float_LessThanEqual_0_4 (f : fix_float_0) (x : fix_float_4)  : bool =
    not (float_GreaterThan_0_4 f x)
;;

let float_LessThanEqual_1_0 (f : fix_float_1) (x : fix_float_0)  : bool =
    not (float_GreaterThan_1_0 f x)
;;

let float_LessThanEqual_1_1 (f : fix_float_1) (x : fix_float_1)  : bool =
    not (float_GreaterThan_1_1 f x)
;;

let float_LessThanEqual_1_2 (f : fix_float_1) (x : fix_float_2)  : bool =
    not (float_GreaterThan_1_2 f x)
;;

let float_LessThanEqual_1_3 (f : fix_float_1) (x : fix_float_3)  : bool =
    not (float_GreaterThan_1_3 f x)
;;

let float_LessThanEqual_1_4 (f : fix_float_1) (x : fix_float_4)  : bool =
    not (float_GreaterThan_1_4 f x)
;;

let float_LessThanEqual_2_0 (f : fix_float_2) (x : fix_float_0)  : bool =
    not (float_GreaterThan_2_0 f x)
;;

let float_LessThanEqual_2_1 (f : fix_float_2) (x : fix_float_1)  : bool =
    not (float_GreaterThan_2_1 f x)
;;

let float_LessThanEqual_2_2 (f : fix_float_2) (x : fix_float_2)  : bool =
    not (float_GreaterThan_2_2 f x)
;;

let float_LessThanEqual_2_3 (f : fix_float_2) (x : fix_float_3)  : bool =
    not (float_GreaterThan_2_3 f x)
;;

let float_LessThanEqual_2_4 (f : fix_float_2) (x : fix_float_4)  : bool =
    not (float_GreaterThan_2_4 f x)
;;

let float_LessThanEqual_3_0 (f : fix_float_3) (x : fix_float_0)  : bool =
    not (float_GreaterThan_3_0 f x)
;;

let float_LessThanEqual_3_1 (f : fix_float_3) (x : fix_float_1)  : bool =
    not (float_GreaterThan_3_1 f x)
;;

let float_LessThanEqual_3_2 (f : fix_float_3) (x : fix_float_2)  : bool =
    not (float_GreaterThan_3_2 f x)
;;

let float_LessThanEqual_3_3 (f : fix_float_3) (x : fix_float_3)  : bool =
    not (float_GreaterThan_3_3 f x)
;;

let float_LessThanEqual_3_4 (f : fix_float_3) (x : fix_float_4)  : bool =
    not (float_GreaterThan_3_4 f x)
;;

let float_LessThanEqual_4_0 (f : fix_float_4) (x : fix_float_0)  : bool =
    not (float_GreaterThan_4_0 f x)
;;

let float_LessThanEqual_4_1 (f : fix_float_4) (x : fix_float_1)  : bool =
    not (float_GreaterThan_4_1 f x)
;;

let float_LessThanEqual_4_2 (f : fix_float_4) (x : fix_float_2)  : bool =
    not (float_GreaterThan_4_2 f x)
;;

let float_LessThanEqual_4_3 (f : fix_float_4) (x : fix_float_3)  : bool =
    not (float_GreaterThan_4_3 f x)
;;

let float_LessThanEqual_4_4 (f : fix_float_4) (x : fix_float_4)  : bool =
    not (float_GreaterThan_4_4 f x)
;;

let float_Equal_0_0 (f : fix_float_0) (x : fix_float_0)  : bool =
    (match (f,x) with
        | (Float_0 f,Float_0 x) -> ((=) f x)
    )
;;

let float_Equal_0_1 (f : fix_float_0) (x : fix_float_1)  : bool =
    (match (f,x) with
        | (Float_0 f,Float_1 x) -> ((=) (( * ) f 10) x)
    )
;;

let float_Equal_0_2 (f : fix_float_0) (x : fix_float_2)  : bool =
    (match (f,x) with
        | (Float_0 f,Float_2 x) -> ((=) (( * ) f 100) x)
    )
;;

let float_Equal_0_3 (f : fix_float_0) (x : fix_float_3)  : bool =
    (match (f,x) with
        | (Float_0 f,Float_3 x) -> ((=) (( * ) f 1000) x)
    )
;;

let float_Equal_0_4 (f : fix_float_0) (x : fix_float_4)  : bool =
    (match (f,x) with
        | (Float_0 f,Float_4 x) -> ((=) (( * ) f 10000) x)
    )
;;

let float_Equal_1_0 (f : fix_float_1) (x : fix_float_0)  : bool =
    (match (f,x) with
        | (Float_1 f,Float_0 x) -> ((=) f (( * ) x 10))
    )
;;

let float_Equal_1_1 (f : fix_float_1) (x : fix_float_1)  : bool =
    (match (f,x) with
        | (Float_1 f,Float_1 x) -> ((=) f x)
    )
;;

let float_Equal_1_2 (f : fix_float_1) (x : fix_float_2)  : bool =
    (match (f,x) with
        | (Float_1 f,Float_2 x) -> ((=) (( * ) f 10) x)
    )
;;

let float_Equal_1_3 (f : fix_float_1) (x : fix_float_3)  : bool =
    (match (f,x) with
        | (Float_1 f,Float_3 x) -> ((=) (( * ) f 100) x)
    )
;;

let float_Equal_1_4 (f : fix_float_1) (x : fix_float_4)  : bool =
    (match (f,x) with
        | (Float_1 f,Float_4 x) -> ((=) (( * ) f 1000) x)
    )
;;

let float_Equal_2_0 (f : fix_float_2) (x : fix_float_0)  : bool =
    (match (f,x) with
        | (Float_2 f,Float_0 x) -> ((=) f (( * ) x 100))
    )
;;

let float_Equal_2_1 (f : fix_float_2) (x : fix_float_1)  : bool =
    (match (f,x) with
        | (Float_2 f,Float_1 x) -> ((=) f (( * ) x 10))
    )
;;

let float_Equal_2_2 (f : fix_float_2) (x : fix_float_2)  : bool =
    (match (f,x) with
        | (Float_2 f,Float_2 x) -> ((=) f x)
    )
;;

let float_Equal_2_3 (f : fix_float_2) (x : fix_float_3)  : bool =
    (match (f,x) with
        | (Float_2 f,Float_3 x) -> ((=) (( * ) f 10) x)
    )
;;

let float_Equal_2_4 (f : fix_float_2) (x : fix_float_4)  : bool =
    (match (f,x) with
        | (Float_2 f,Float_4 x) -> ((=) (( * ) f 100) x)
    )
;;

let float_Equal_3_0 (f : fix_float_3) (x : fix_float_0)  : bool =
    (match (f,x) with
        | (Float_3 f,Float_0 x) -> ((=) f (( * ) x 1000))
    )
;;

let float_Equal_3_1 (f : fix_float_3) (x : fix_float_1)  : bool =
    (match (f,x) with
        | (Float_3 f,Float_1 x) -> ((=) f (( * ) x 100))
    )
;;

let float_Equal_3_2 (f : fix_float_3) (x : fix_float_2)  : bool =
    (match (f,x) with
        | (Float_3 f,Float_2 x) -> ((=) f (( * ) x 10))
    )
;;

let float_Equal_3_3 (f : fix_float_3) (x : fix_float_3)  : bool =
    (match (f,x) with
        | (Float_3 f,Float_3 x) -> ((=) f x)
    )
;;

let float_Equal_3_4 (f : fix_float_3) (x : fix_float_4)  : bool =
    (match (f,x) with
        | (Float_3 f,Float_4 x) -> ((=) (( * ) f 10) x)
    )
;;

let float_Equal_4_0 (f : fix_float_4) (x : fix_float_0)  : bool =
    (match (f,x) with
        | (Float_4 f,Float_0 x) -> ((=) f (( * ) x 10000))
    )
;;

let float_Equal_4_1 (f : fix_float_4) (x : fix_float_1)  : bool =
    (match (f,x) with
        | (Float_4 f,Float_1 x) -> ((=) f (( * ) x 1000))
    )
;;

let float_Equal_4_2 (f : fix_float_4) (x : fix_float_2)  : bool =
    (match (f,x) with
        | (Float_4 f,Float_2 x) -> ((=) f (( * ) x 100))
    )
;;

let float_Equal_4_3 (f : fix_float_4) (x : fix_float_3)  : bool =
    (match (f,x) with
        | (Float_4 f,Float_3 x) -> ((=) f (( * ) x 10))
    )
;;

let float_Equal_4_4 (f : fix_float_4) (x : fix_float_4)  : bool =
    (match (f,x) with
        | (Float_4 f,Float_4 x) -> ((=) f x)
    )
;;

let float_is_zero_0 (f : fix_float_0)  : bool =
    (match f with
        | Float_0 0 -> true
        | _ -> false
    )
;;

let float_is_zero_1 (f : fix_float_1)  : bool =
    (match f with
        | Float_1 0 -> true
        | _ -> false
    )
;;

let float_is_zero_2 (f : fix_float_2)  : bool =
    (match f with
        | Float_2 0 -> true
        | _ -> false
    )
;;

let float_is_zero_3 (f : fix_float_3)  : bool =
    (match f with
        | Float_3 0 -> true
        | _ -> false
    )
;;

let float_is_zero_4 (f : fix_float_4)  : bool =
    (match f with
        | Float_4 0 -> true
        | _ -> false
    )
;;

let float_is_one_0 (f : fix_float_0)  : bool =
    (match f with
        | Float_0 1 -> true
        | _ -> false
    )
;;

let float_is_one_1 (f : fix_float_1)  : bool =
    (match f with
        | Float_1 10 -> true
        | _ -> false
    )
;;

let float_is_one_2 (f : fix_float_2)  : bool =
    (match f with
        | Float_2 100 -> true
        | _ -> false
    )
;;

let float_is_one_3 (f : fix_float_3)  : bool =
    (match f with
        | Float_3 1000 -> true
        | _ -> false
    )
;;

let float_is_one_4 (f : fix_float_4)  : bool =
    (match f with
        | Float_4 10000 -> true
        | _ -> false
    )
;;

let float_higher_precision_0_0 (f : fix_float_0) (x : fix_float_0)  : bool =
    false
;;

let float_higher_precision_0_1 (f : fix_float_0) (x : fix_float_1)  : bool =
    false
;;

let float_higher_precision_0_2 (f : fix_float_0) (x : fix_float_2)  : bool =
    false
;;

let float_higher_precision_0_3 (f : fix_float_0) (x : fix_float_3)  : bool =
    false
;;

let float_higher_precision_0_4 (f : fix_float_0) (x : fix_float_4)  : bool =
    false
;;

let float_higher_precision_1_0 (f : fix_float_1) (x : fix_float_0)  : bool =
    true
;;

let float_higher_precision_1_1 (f : fix_float_1) (x : fix_float_1)  : bool =
    false
;;

let float_higher_precision_1_2 (f : fix_float_1) (x : fix_float_2)  : bool =
    false
;;

let float_higher_precision_1_3 (f : fix_float_1) (x : fix_float_3)  : bool =
    false
;;

let float_higher_precision_1_4 (f : fix_float_1) (x : fix_float_4)  : bool =
    false
;;

let float_higher_precision_2_0 (f : fix_float_2) (x : fix_float_0)  : bool =
    true
;;

let float_higher_precision_2_1 (f : fix_float_2) (x : fix_float_1)  : bool =
    true
;;

let float_higher_precision_2_2 (f : fix_float_2) (x : fix_float_2)  : bool =
    false
;;

let float_higher_precision_2_3 (f : fix_float_2) (x : fix_float_3)  : bool =
    false
;;

let float_higher_precision_2_4 (f : fix_float_2) (x : fix_float_4)  : bool =
    false
;;

let float_higher_precision_3_0 (f : fix_float_3) (x : fix_float_0)  : bool =
    true
;;

let float_higher_precision_3_1 (f : fix_float_3) (x : fix_float_1)  : bool =
    true
;;

let float_higher_precision_3_2 (f : fix_float_3) (x : fix_float_2)  : bool =
    true
;;

let float_higher_precision_3_3 (f : fix_float_3) (x : fix_float_3)  : bool =
    false
;;

let float_higher_precision_3_4 (f : fix_float_3) (x : fix_float_4)  : bool =
    false
;;

let float_higher_precision_4_0 (f : fix_float_4) (x : fix_float_0)  : bool =
    true
;;

let float_higher_precision_4_1 (f : fix_float_4) (x : fix_float_1)  : bool =
    true
;;

let float_higher_precision_4_2 (f : fix_float_4) (x : fix_float_2)  : bool =
    true
;;

let float_higher_precision_4_3 (f : fix_float_4) (x : fix_float_3)  : bool =
    true
;;

let float_higher_precision_4_4 (f : fix_float_4) (x : fix_float_4)  : bool =
    false
;;

let float_equal_precision_0_0 (f : fix_float_0) (x : fix_float_0)  : bool =
    true
;;

let float_equal_precision_0_1 (f : fix_float_0) (x : fix_float_1)  : bool =
    false
;;

let float_equal_precision_0_2 (f : fix_float_0) (x : fix_float_2)  : bool =
    false
;;

let float_equal_precision_0_3 (f : fix_float_0) (x : fix_float_3)  : bool =
    false
;;

let float_equal_precision_0_4 (f : fix_float_0) (x : fix_float_4)  : bool =
    false
;;

let float_equal_precision_1_0 (f : fix_float_1) (x : fix_float_0)  : bool =
    false
;;

let float_equal_precision_1_1 (f : fix_float_1) (x : fix_float_1)  : bool =
    true
;;

let float_equal_precision_1_2 (f : fix_float_1) (x : fix_float_2)  : bool =
    false
;;

let float_equal_precision_1_3 (f : fix_float_1) (x : fix_float_3)  : bool =
    false
;;

let float_equal_precision_1_4 (f : fix_float_1) (x : fix_float_4)  : bool =
    false
;;

let float_equal_precision_2_0 (f : fix_float_2) (x : fix_float_0)  : bool =
    false
;;

let float_equal_precision_2_1 (f : fix_float_2) (x : fix_float_1)  : bool =
    false
;;

let float_equal_precision_2_2 (f : fix_float_2) (x : fix_float_2)  : bool =
    true
;;

let float_equal_precision_2_3 (f : fix_float_2) (x : fix_float_3)  : bool =
    false
;;

let float_equal_precision_2_4 (f : fix_float_2) (x : fix_float_4)  : bool =
    false
;;

let float_equal_precision_3_0 (f : fix_float_3) (x : fix_float_0)  : bool =
    false
;;

let float_equal_precision_3_1 (f : fix_float_3) (x : fix_float_1)  : bool =
    false
;;

let float_equal_precision_3_2 (f : fix_float_3) (x : fix_float_2)  : bool =
    false
;;

let float_equal_precision_3_3 (f : fix_float_3) (x : fix_float_3)  : bool =
    true
;;

let float_equal_precision_3_4 (f : fix_float_3) (x : fix_float_4)  : bool =
    false
;;

let float_equal_precision_4_0 (f : fix_float_4) (x : fix_float_0)  : bool =
    false
;;

let float_equal_precision_4_1 (f : fix_float_4) (x : fix_float_1)  : bool =
    false
;;

let float_equal_precision_4_2 (f : fix_float_4) (x : fix_float_2)  : bool =
    false
;;

let float_equal_precision_4_3 (f : fix_float_4) (x : fix_float_3)  : bool =
    false
;;

let float_equal_precision_4_4 (f : fix_float_4) (x : fix_float_4)  : bool =
    true
;;
