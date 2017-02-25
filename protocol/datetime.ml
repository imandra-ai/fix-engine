(** 

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    Implementation of the date time types.

    datetime.ml
*)

type fix_utctimestamp = {
    utc_timestamp_year      : int;
    utc_timestamp_month     : int;
    utc_timestamp_day       : int;
    utc_timestamp_hour      : int;
    utc_timestamp_minute    : int;
    utc_timestamp_second    : int;
    uts_timestamp_millisec  : int option;
}
;;

let is_valid_utctimestamp ( ts : fix_utctimestamp ) =
    0 <= ts.utc_timestamp_year && ts.utc_timestamp_year <= 9999 && 
    1 <= ts.utc_timestamp_month && ts.utc_timestamp_month <= 12 && 
    1 <= ts.utc_timestamp_day && ts.utc_timestamp_day <= 31 && 
    0 <= ts.utc_timestamp_hour && ts.utc_timestamp_hour <= 23 && 
    0 <= ts.utc_timestamp_minute && ts.utc_timestamp_minute <= 59 && 
    0 <= ts.utc_timestamp_second && ts.utc_timestamp_second <= 59 && (
        match ts.uts_timestamp_millisec with
        | None -> true
        | Some ms -> 0 <= ms && ms <= 999 )
;;

let utctimestamp_greaterThan ( tOne, tTwo : fix_utctimestamp * fix_utctimestamp ) =
    if tOne.utc_timestamp_year > tTwo.utc_timestamp_year then true
    else if tOne.utc_timestamp_year < tTwo.utc_timestamp_year then false 
    else if tOne.utc_timestamp_month > tTwo.utc_timestamp_month then true
    else if tOne.utc_timestamp_month < tTwo.utc_timestamp_month then false
    else if tOne.utc_timestamp_day > tTwo.utc_timestamp_day then true
    else if tOne.utc_timestamp_day < tTwo.utc_timestamp_day then false
    else if tOne.utc_timestamp_hour > tTwo.utc_timestamp_hour then true
    else if tOne.utc_timestamp_hour < tTwo.utc_timestamp_hour then false
    else if tOne.utc_timestamp_minute > tTwo.utc_timestamp_minute then true
    else if tOne.utc_timestamp_minute < tTwo.utc_timestamp_minute then false
    else if tOne.utc_timestamp_second > tTwo.utc_timestamp_second then true
    else if tOne.utc_timestamp_second < tTwo.utc_timestamp_second then false
    else true (* TODO We should add milliseconds to this as well. *)
;;

let utctimestamp_Equal ( tOne, tTwo : fix_utctimestamp * fix_utctimestamp ) =
    tOne.utc_timestamp_year = tTwo.utc_timestamp_year && 
    tOne.utc_timestamp_month = tTwo.utc_timestamp_month && 
    tOne.utc_timestamp_day = tTwo.utc_timestamp_day && 
    tOne.utc_timestamp_hour = tTwo.utc_timestamp_hour &&
    tOne.utc_timestamp_minute = tTwo.utc_timestamp_minute && 
    tOne.utc_timestamp_second = tTwo.utc_timestamp_second
;;

let utctimestamp_greaterThanEqual ( tOne, tTwo : fix_utctimestamp * fix_utctimestamp ) =
    utctimestamp_greaterThan (tOne, tTwo) || utctimestamp_Equal (tOne, tTwo)
;;

let utctimestamp_lessThan ( tOne, tTwo : fix_utctimestamp * fix_utctimestamp ) =
    not ( utctimestamp_greaterThan (tOne, tTwo) || utctimestamp_Equal (tOne, tTwo))
;;

let utctimestamp_lessThanEqual ( tOne, tTwo : fix_utctimestamp * fix_utctimestamp ) =
    not ( utctimestamp_greaterThan (tOne, tTwo) )
;;

type fix_localmktdate = {
    localmktdate_year       : int;
    localmktdate_month      : int;
    localmktdate_day        : int;
};;

let is_valid_localmktdate ( lmd : fix_localmktdate ) =
    0 <= lmd.localmktdate_year && lmd.localmktdate_year <= 9999 && 
    1 <= lmd.localmktdate_month && lmd.localmktdate_month <= 12 && 
    1 <= lmd.localmktdate_day && lmd.localmktdate_day <= 31
;;

type fix_week = 
    | Week_1
    | Week_2
    | Week_3
    | Week_4
    | Week_5
;;

type fix_monthyear = {
    monthyear_year          : int;
    monthyear_month         : int;
    monthyear_day           : int option;
    monthyear_week          : fix_week option;
};;

let is_valid_monthyear ( my : fix_monthyear ) =
    0 <= my.monthyear_year && my.monthyear_year <= 9999 && 
    0 <= my.monthyear_month && my.monthyear_month <= 12 && (
        match my.monthyear_day with 
        | None -> true
        | Some d -> 0 <= d && d <= 31
    ) && (
        (** You can only specify one of them, but not both. *)
        match my.monthyear_day, my.monthyear_week with
        | Some _, Some _ -> false
        | _, _ -> true
    )
;;

type fix_utctimeonly = {
    utc_timeonly_hour       : int;
    utc_timeonly_minute     : int;
    utc_timeonly_second     : int;
    utc_timeonly_millisec   : int option;
};;

let is_valid_utctimeonly ( t : fix_utctimeonly ) =
    0 <= t.utc_timeonly_hour && 
    t.utc_timeonly_hour <= 23 &&
    0 <= t.utc_timeonly_minute &&
    t.utc_timeonly_minute <= 59 &&
    0 <= t.utc_timeonly_second &&
    t.utc_timeonly_second <= 59 && ( 
        match t.utc_timeonly_millisec with 
        | None      -> true
        | Some ms   -> 0 <= ms && ms <= 999
    )
;;

(* TODO add logic for handling milliseconds. *)
let utc_timeonly_greaterThan ( tOne, tTwo : fix_utctimeonly * fix_utctimeonly ) =
    if tOne.utc_timeonly_hour > tTwo.utc_timeonly_hour then true
    else if tOne.utc_timeonly_hour < tTwo.utc_timeonly_hour then false
    else if tOne.utc_timeonly_minute > tTwo.utc_timeonly_minute then true
    else if tOne.utc_timeonly_minute < tTwo.utc_timeonly_minute then false
    else if tOne.utc_timeonly_second > tTwo.utc_timeonly_second then true
    else false
;;

(* TODO again, need to implement milliseconds *)
let utc_timeonly_Equal ( tOne, tTwo : fix_utctimeonly * fix_utctimeonly ) =
    tOne.utc_timeonly_hour = tTwo.utc_timeonly_hour &&
    tOne.utc_timeonly_minute = tTwo.utc_timeonly_minute && 
    tOne.utc_timeonly_second = tTwo.utc_timeonly_second
;;

let utc_timeonly_lessThan ( tOne, tTwo : fix_utctimeonly * fix_utctimeonly ) =
    not ( utc_timeonly_greaterThan (tOne, tTwo) || utc_timeonly_Equal (tOne, tTwo))
;;

let utc_timeonly_lessThanEqual ( tOne, tTwo : fix_utctimeonly * fix_utctimeonly ) =
    not ( utc_timeonly_greaterThan (tOne, tTwo) )
;;

let utc_timeonly_greaterThanEqual ( tOne, tTwo : fix_utctimeonly * fix_utctimeonly ) = 
    utc_timeonly_greaterThan (tOne, tTwo) || utc_timeonly_Equal (tOne, tTwo)
;;

type fix_utcdateonly = {
    utc_dateonly_year       : int;
    utc_dateonly_month      : int;
    utc_dateonly_day        : int;
};;

let is_valid_utcdateonly ( d : fix_utcdateonly ) =
    0 <= d.utc_dateonly_year && d.utc_dateonly_year <= 9999 && 
    1 <= d.utc_dateonly_month && d.utc_dateonly_month <= 12 && 
    1 <= d.utc_dateonly_day && d.utc_dateonly_day <= 31
;;

type fix_duration = {
    dur_years               : int option;
    dur_months              : int option;
    dur_weeks               : int option;
    dur_days                : int option;
    dur_hours               : int option;
    dur_minutes             : int option;
    dur_seconds             : int option;
}
;;

type fix_interval = {
    i_start                 : fix_utctimestamp;
    i_end                   : fix_utctimestamp;
}
;;

let utctimestamp_add ( t, dur : fix_utctimestamp * fix_duration ) = 
    t
;;

let utctimestamp_sub ( t, dur : fix_utctimestamp * fix_duration ) =
    t
;;

let duration_addto ( t, dur : fix_utctimestamp * fix_duration ) = {
    i_start                 = t;
    i_end                   = utctimestamp_add ( t, dur);
}
;;

let duration_subfrom ( t, dur : fix_utctimestamp * fix_duration ) = {
    i_start                 = utctimestamp_sub ( t, dur ) ;
    i_end                   = t;
}
;;

let interval_Within ( interval, t : fix_interval * fix_utctimestamp ) = 
    not ( utctimestamp_lessThan ( interval.i_start, t  ) || utctimestamp_greaterThan ( interval.i_end, t ) )
;;
