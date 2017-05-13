(** Base FIX types. *)
(***

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017
    
    base_types.ml
*)

type fix_symbol = int;;
type fix_string = Model_string of int;;

(** This should be built-in. *)
type fix_currency =
    | GBP
    | USD
;;

(** Country *)
type fix_country = 
    | UK
    | USA
    | France
    | Germany
;;

(** There's a list for this as well. *)
type fix_exchange = 
    | BATS
    | DBSuperX
;;



