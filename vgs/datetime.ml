(* Basic Datetime VGs *)

verify utc_gt_transitive (x,y,z) =
 utctimestamp_GreaterThan(x,y)
 && utctimestamp_GreaterThan(y,z)
 ==>
 utctimestamp_GreaterThan(x,z)
;;

verify utc_gt_irreflexive (x) =
 not(utctimestamp_GreaterThan(x,x))
;;

verify utc_gt_total (x,y) =
 x = y
 || utctimestamp_GreaterThan(x,y)
 || utctimestamp_GreaterThan(y,x)
;;

verify normalise_id (x) =
 is_valid_utctimestamp x
 ==>
 normalise_timestamp x = x
;;
