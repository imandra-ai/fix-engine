(** JSON printers/parsers for datetime types. *)
(***

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    datetime_json.ml 
*)

(* @meta[imandra_ignore] on @end *)
open Yojson;;
open Datetime;;
open Base_types_json;;
(* @meta[imandra_ignore] off @end *)

let filter_nulls =
    List.filter (function ( _, `Null ) -> false | _ -> true )
;;

let utctimestamp_to_json ( ts : fix_utctimestamp ) : json =
    let list_assoc = [
        ( "utc_timestamp_year"     , `Int ts.utc_timestamp_year                     );
        ( "utc_timestamp_month"    , `Int ts.utc_timestamp_month                    );
        ( "utc_timestamp_day"      , `Int ts.utc_timestamp_day                      );
        ( "utc_timestamp_hour"     , `Int ts.utc_timestamp_hour                     );
        ( "utc_timestamp_minute"   , `Int ts.utc_timestamp_minute                   );
        ( "utc_timestamp_second"   , `Int ts.utc_timestamp_second                   );
        ( "utc_timestamp_millisec" , int_opt_to_json ts.utc_timestamp_millisec      );
    ] |> filter_nulls in
    `Assoc list_assoc
;;

let utctimestamp_opt_to_json = function
    | None    -> `Null
    | Some x  -> utctimestamp_to_json x
;;

let duration_to_json ( d : fix_duration ) = 
    let list_assoc = [
        ( "dur_years"   , int_opt_to_json d.dur_years   );
        ( "dur_months"  , int_opt_to_json d.dur_months  );
        ( "dur_days"    , int_opt_to_json d.dur_days    );
        ( "dur_hours"   , int_opt_to_json d.dur_hours   );
        ( "dur_minutes" , int_opt_to_json d.dur_minutes );
        ( "dur_seconds" , int_opt_to_json d.dur_seconds );
    ] |> filter_nulls in 
    `Assoc list_assoc
;;

let duration_opt_to_json = function
    | None   -> `Null
    | Some x -> duration_to_json x
;;

let localmktdate_to_json ( d : fix_localmktdate ) =
    let list_assoc = [
        ( "localmktdate_year"  , int_to_json d.localmktdate_year  );
        ( "localmktdate_month" , int_to_json d.localmktdate_month );
        ( "localmktdate_day"   , int_to_json d.localmktdate_day   );
    ] |> filter_nulls in
    `Assoc list_assoc
;;

let localmktdate_opt_to_json = function
    | None    -> `Null
    | Some x  -> localmktdate_to_json x
;;


let utcdateonly_to_json ( d : fix_utcdateonly ) =  
    let list_assoc = [
        ( "utc_dateonly_year"  , int_to_json d.utc_dateonly_year  );
        ( "utc_dateonly_month" , int_to_json d.utc_dateonly_month );
        ( "utc_dateonly_day"   , int_to_json d.utc_dateonly_day   )
    ] |> filter_nulls in
    `Assoc list_assoc
;;

let utcdateonly_opt_to_json = function  
    | None    -> `Null
    | Some x  -> utcdateonly_to_json x
;;


(** UTC Timeonly *)
let utctimeonly_to_json ( d : fix_utctimeonly ) = 
    let list_assoc = [
        ( "utc_timeonly_hour"     ,  int_to_json d.utc_timeonly_hour          );    
        ( "utc_timeonly_minute"   ,  int_to_json d.utc_timeonly_minute        );
        ( "utc_timeonly_second"   ,  int_to_json d.utc_timeonly_second        );
        ( "utc_timeonly_millisec" ,  int_opt_to_json d.utc_timeonly_millisec  ) 
    ] |> filter_nulls in
    `Assoc list_assoc
;;

let utctimeonly_opt_to_json  = function
    | None    -> `Null
    | Some x  -> utctimeonly_to_json x
;;

let week_to_json = function
    | Week_1 -> `String "Week1"
    | Week_2 -> `String "Week2"
    | Week_3 -> `String "Week3"
    | Week_4 -> `String "Week4"
    | Week_5 -> `String "Week5"
;;

let week_opt_to_json = function
    | None    -> `Null
    | Some x  -> week_to_json x
;;


let monthyear_to_json ( d : fix_monthyear) = 
    let list_assoc = [
        ( "monthyear_year"  , int_to_json       d.monthyear_year  );
        ( "monthyear_month" , int_to_json       d.monthyear_month );
        ( "monthyear_day"   , int_opt_to_json   d.monthyear_day   );
        ( "monthyear_week"  , week_opt_to_json  d.monthyear_week  );
    ] |> filter_nulls in
    `Assoc list_assoc
;;

let monthyear_opt_to_json = function
    | None    -> `Null
    | Some x  -> monthyear_to_json x
;;

