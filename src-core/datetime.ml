(** Implementation of the date/time types. *) 
(**
    
    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    datetime.ml
*)

type fix_utctimestamp = {
    utc_timestamp_year      : int;
    utc_timestamp_month     : int;
    utc_timestamp_day       : int;
    utc_timestamp_hour      : int;
    utc_timestamp_minute    : int;
    utc_timestamp_second    : int;
    utc_timestamp_millisec  : int option;
}
;;

let make_utctimestamp ( year, month, day, hour, minute, second, millisec : int * int * int * int * int * int * int option ) = {
    utc_timestamp_year      = year;
    utc_timestamp_month     = month;
    utc_timestamp_day       = day;
    utc_timestamp_hour      = hour;
    utc_timestamp_minute    = minute;
    utc_timestamp_second    = second;
    utc_timestamp_millisec  = millisec;
}
;;

let is_valid_utctimestamp ( ts : fix_utctimestamp ) =
    0 <= ts.utc_timestamp_year      && ts.utc_timestamp_year    <= 9999 && 
    1 <= ts.utc_timestamp_month     && ts.utc_timestamp_month   <= 12   && 
    1 <= ts.utc_timestamp_day       && ts.utc_timestamp_day     <= 31   && 
    0 <= ts.utc_timestamp_hour      && ts.utc_timestamp_hour    <= 23   && 
    0 <= ts.utc_timestamp_minute    && ts.utc_timestamp_minute  <= 59   && 
    0 <= ts.utc_timestamp_second    && ts.utc_timestamp_second  <= 59   && (
        match ts.utc_timestamp_millisec with
        | None -> true
        | Some ms -> 0 <= ms && ms <= 999 )
;;

let utctimestamp_greaterThan ( tOne, tTwo : fix_utctimestamp * fix_utctimestamp ) =
    if tOne.utc_timestamp_year          > tTwo.utc_timestamp_year   then true
    else if tOne.utc_timestamp_year     < tTwo.utc_timestamp_year   then false 
    else if tOne.utc_timestamp_month    > tTwo.utc_timestamp_month  then true
    else if tOne.utc_timestamp_month    < tTwo.utc_timestamp_month  then false
    else if tOne.utc_timestamp_day      > tTwo.utc_timestamp_day    then true
    else if tOne.utc_timestamp_day      < tTwo.utc_timestamp_day    then false
    else if tOne.utc_timestamp_hour     > tTwo.utc_timestamp_hour   then true
    else if tOne.utc_timestamp_hour     < tTwo.utc_timestamp_hour   then false
    else if tOne.utc_timestamp_minute   > tTwo.utc_timestamp_minute then true
    else if tOne.utc_timestamp_minute   < tTwo.utc_timestamp_minute then false
    else if tOne.utc_timestamp_second   > tTwo.utc_timestamp_second then true
    else if tOne.utc_timestamp_second   < tTwo.utc_timestamp_second then false
    else 
        match tOne.utc_timestamp_millisec, tTwo.utc_timestamp_millisec with 
        | None      , None      -> true
        | Some _    , None      -> true
        | None      , Some _    -> false
        | Some one  , Some two  -> one > two
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
    dur_days                : int option;
    dur_hours               : int option;
    dur_minutes             : int option;
    dur_seconds             : int option;
}
;;

let make_duration ( years, months, days, hours, minutes, seconds ) = {
    dur_years               = years;
    dur_months              = months;
    dur_days                = days;
    dur_hours               = hours;
    dur_minutes             = minutes;
    dur_seconds             = seconds;
}
;;

let is_valid_duration ( d : fix_duration ) =
    match d.dur_years with 
    | Some y    -> 0 <= y && y <= 100
    | None      ->
    match d.dur_months with 
    | Some m    -> 0 <= m && m <= 12
    | None      -> 
    match d.dur_days with
    | Some d    -> 0 <= d && d <= 31
    | None      -> 
    match d.dur_hours with 
    | Some h    -> 0 <= h && h <= 24
    | None      ->
    match d.dur_minutes with
    | Some m    -> 0 <= m && m <= 59
    | None      -> 
    match d.dur_seconds with
    | Some s    -> 0 <= s && s <= 59
    | None      -> true
;;

let utctimestamp_sub ( t, dur : fix_utctimestamp * fix_duration ) =
    t
;;

let is_leapyear ( year : int ) =
    match year with 
    | 1972 | 1976 | 1980 | 1984 | 1988 | 1992 | 1996 | 2000 | 2004 | 2008 | 2012 | 2016 | 2020 | 2024 | 2028 | 2032 -> true
    | _ -> false
;;

let how_many_days ( month, year : int * int ) = 
    match month with
    | 1     -> 31
    | 2     -> if is_leapyear ( year ) then 29 else 28
    | 3     -> 31
    | 4     -> 30
    | 5     -> 31
    | 6     -> 30
    | 7     -> 31
    | 8     -> 31
    | 9     -> 30
    | 10    -> 31
    | 11    -> 30
    | _     -> 31
;;

type field_carryover = {
    carry_over  : bool;
    new_field   : int;
}
;;

let calculate_carry ( field, max_value, min_value : int * int * int ) =
    if field >= max_value then {
        new_field = field - max_value + min_value;
        carry_over = true;
    } else {
        new_field = field;
        carry_over = false;
    }
;;

let normalise_timestamp ( ts : fix_utctimestamp ) =
    let carry_secs  = calculate_carry ( ts.utc_timestamp_second, 60, 0) in
    let new_minute  = if carry_secs.carry_over then ( ts.utc_timestamp_minute + 1)  else ts.utc_timestamp_minute in 
    let carry_mins  = calculate_carry ( new_minute,     60, 0 ) in
    let new_hour    = if carry_mins.carry_over then ( ts.utc_timestamp_hour + 1 )   else ts.utc_timestamp_hour in 
    let carry_hours = calculate_carry ( new_hour,       24, 0 ) in 
    let new_days    = if carry_hours.carry_over then ( ts.utc_timestamp_day + 1 )   else ts.utc_timestamp_day in 
    let carry_days  = calculate_carry ( new_days, how_many_days ( ts.utc_timestamp_month, ts.utc_timestamp_year ), 1) in
    let new_months  = if carry_days.carry_over then ( ts.utc_timestamp_month + 1 )  else ts.utc_timestamp_month in
    let carry_months = calculate_carry ( new_months,    13, 1 ) in 
    let new_years   = if carry_months.carry_over then ( ts.utc_timestamp_year + 1 ) else ts.utc_timestamp_year in {
        utc_timestamp_millisec  = ts.utc_timestamp_millisec;
        utc_timestamp_second    = carry_secs.new_field;
        utc_timestamp_minute    = carry_mins.new_field;
        utc_timestamp_hour      = carry_hours.new_field;
        utc_timestamp_day       = carry_days.new_field;
        utc_timestamp_month     = carry_months.new_field;
        utc_timestamp_year      = new_years;
    }
;;

let utctimestamp_add ( t, dur : fix_utctimestamp * fix_duration ) = 

    let new_seconds = match dur.dur_seconds with
        | None -> t.utc_timestamp_second
        | Some s -> t.utc_timestamp_second + s in
    let new_minute = match dur.dur_minutes with
        | None -> t.utc_timestamp_minute
        | Some m -> t.utc_timestamp_minute + m in
    let new_hour = match dur.dur_hours with 
        | None -> t.utc_timestamp_hour
        | Some h -> t.utc_timestamp_hour + h in 
    let new_day = match dur.dur_days with
        | None -> t.utc_timestamp_day
        | Some d -> t.utc_timestamp_day + d in
    let new_month = match dur.dur_months with
        | None -> t.utc_timestamp_month
        | Some m -> t.utc_timestamp_month + m in 
    let new_year = match dur.dur_years with
        | None -> t.utc_timestamp_year 
        | Some y -> t.utc_timestamp_year + y in 
    let new_ts = {
        utc_timestamp_millisec  = t.utc_timestamp_millisec; 
        utc_timestamp_second    = new_seconds;
        utc_timestamp_minute    = new_minute;
        utc_timestamp_hour      = new_hour;
        utc_timestamp_day       = new_day;
        utc_timestamp_month     = new_month;
        utc_timestamp_year      = new_year;
    } in
    normalise_timestamp ( new_ts )
;;

(** 
verify ts_correct ( ) = 
let ts = make_utctimestamp ( 2017, 1, 1, 1, 0, 0, None ) in 
let dOne = make_duration ( None, None, None, None, None, Some 30 ) in
let dTwo = make_duration ( None, None, None, None, Some 1, Some 30 ) in 
let tsOne = utctimestamp_add ( ts, dOne ) in 
let tsTwo = utctimestamp_add ( ts, dTwo ) in

utctimestamp_greaterThan (tsOne, tsTwo)
;;


verify ts_correct (ts : fix_utctimestamp ) = 
let dOne = make_duration ( None, None, None, None, None, Some 30 ) in
let dTwo = make_duration ( None, None, None, None, Some 1, Some 30 ) in 
let tsOne = utctimestamp_add ( ts, dOne ) in 
let tsTwo = utctimestamp_add ( ts, dTwo ) in

is_valid_utctimestamp ( ts) ==>
utctimestamp_greaterThan (tsTwo, tsOne)
;;
*)