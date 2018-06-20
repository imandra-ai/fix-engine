(** Implementation of the date/time types and operations. *) 
(**
    
    Aesthetic Integration Limited
    Copyright (c) 2014 - 2018

    datetime.ml
*)

(** UTC Timestamp type. *)
type fix_utctimestamp_milli = {
    utc_timestamp_year      : int;
    utc_timestamp_month     : int;
    utc_timestamp_day       : int;
    utc_timestamp_hour      : int;
    utc_timestamp_minute    : int;
    utc_timestamp_second    : int;
    utc_timestamp_millisec  : int option;
}
;;

type fix_utctimestamp_micro = {
    utc_timestamp_year      : int;
    utc_timestamp_month     : int;
    utc_timestamp_day       : int;
    utc_timestamp_hour      : int;
    utc_timestamp_minute    : int;
    utc_timestamp_second    : int;
    utc_timestamp_microsec  : int option;
}
;;

(** Default timestamp is 0 unix epoch timestamp *)
let default_utctimestamp_milli = {
    utc_timestamp_year      = 1970;
    utc_timestamp_month     = 1;
    utc_timestamp_day       = 1;
    utc_timestamp_hour      = 0;
    utc_timestamp_minute    = 0;
    utc_timestamp_second    = 0;
    utc_timestamp_millisec  = Some 0;
}
;;

(** Default timestamp is 0 unix epoch timestamp *)
let default_utctimestamp_micro = {
    utc_timestamp_year      = 1970;
    utc_timestamp_month     = 1;
    utc_timestamp_day       = 1;
    utc_timestamp_hour      = 0;
    utc_timestamp_minute    = 0;
    utc_timestamp_second    = 0;
    utc_timestamp_microsec  = Some 0;
}
;;

(** Constructor for the UTC timestamp milli  *)
let make_utctimestamp_milli ( year:int) (month:int) (day:int) (hour:int) (minute:int) (second:int) (millisec:int option) : fix_utctimestamp_milli = {
    utc_timestamp_year      = year;
    utc_timestamp_month     = month;
    utc_timestamp_day       = day;
    utc_timestamp_hour      = hour;
    utc_timestamp_minute    = minute;
    utc_timestamp_second    = second;
    utc_timestamp_millisec  = millisec;
}
;;

(** Constructor for the UTC timestamp micro  *)
let make_utctimestamp_micro ( year:int) (month:int) (day:int) (hour:int) (minute:int) (second:int) (microsec:int option) : fix_utctimestamp_micro = {
    utc_timestamp_year      = year;
    utc_timestamp_month     = month;
    utc_timestamp_day       = day;
    utc_timestamp_hour      = hour;
    utc_timestamp_minute    = minute;
    utc_timestamp_second    = second;
    utc_timestamp_microsec  = microsec;
}
;;


(** Helper function that determines wether the year is a leap year *)
let is_leapyear ( year : int ) =
    match year with
    | 1972 -> true
    | 1976 -> true
    | 1980 -> true
    | 1984 -> true
    | 1988 -> true
    | 1992 -> true
    | 1996 -> true
    | 2000 -> true
    | 2004 -> true
    | 2008 -> true
    | 2012 -> true
    | 2016 -> true
    | 2020 -> true
    | 2024 -> true
    | 2028 -> true
    | 2032 -> true
    | _ -> false
;;


(** Days in month helper function *)
let how_many_days ( month:int)  (year : int ) = 
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


let valid_day day month year =
  let days = how_many_days month year in
  1 <= day && day <= days
;;


(** Checking validity of the values in the UTC timestamp milli *)
let is_valid_utctimestamp_milli ( ts : fix_utctimestamp_milli ) =
  0 <= ts.utc_timestamp_year      && ts.utc_timestamp_year    <= 9999 && 
  1 <= ts.utc_timestamp_month     && ts.utc_timestamp_month   <= 12   && 
  valid_day ts.utc_timestamp_day ts.utc_timestamp_month ts.utc_timestamp_year  && 
  0 <= ts.utc_timestamp_hour      && ts.utc_timestamp_hour    <= 23   && 
  0 <= ts.utc_timestamp_minute    && ts.utc_timestamp_minute  <= 59   && 
  0 <= ts.utc_timestamp_second    && ts.utc_timestamp_second  <= 59   && (
        match ts.utc_timestamp_millisec with
        | None -> true
        | Some ms -> 0 <= ms && ms <= 999 )
;;

(** Checking validity of the values in the UTC timestamp micro *)
let is_valid_utctimestamp_micro ( ts : fix_utctimestamp_micro ) =
    0 <= ts.utc_timestamp_year      && ts.utc_timestamp_year    <= 9999 && 
    1 <= ts.utc_timestamp_month     && ts.utc_timestamp_month   <= 12   && 
    valid_day ts.utc_timestamp_day ts.utc_timestamp_month ts.utc_timestamp_year  && 
    0 <= ts.utc_timestamp_hour      && ts.utc_timestamp_hour    <= 23   && 
    0 <= ts.utc_timestamp_minute    && ts.utc_timestamp_minute  <= 59   && 
    0 <= ts.utc_timestamp_second    && ts.utc_timestamp_second  <= 59   && (
          match ts.utc_timestamp_microsec with
          | None -> true
          | Some ms -> 0 <= ms && ms <= 999999 )
  ;;
  
(** Two UTC timestamps are equal if they have equal field values *)
let utctimestamp_Equal_milli_milli ( tOne: fix_utctimestamp_milli) (tTwo : fix_utctimestamp_milli  ) =
    (tOne = tTwo)
 ;;
 
 let utctimestamp_Equal_micro_micro ( tOne: fix_utctimestamp_micro) (tTwo : fix_utctimestamp_micro  ) =
     (tOne = tTwo)
 ;;
 
 let utctimestamp_Equal_milli_micro ( tOne: fix_utctimestamp_milli) (tTwo : fix_utctimestamp_micro  ) =
     (tOne = { 
     utc_timestamp_year      = tTwo.utc_timestamp_year;
     utc_timestamp_month     = tTwo.utc_timestamp_month;
     utc_timestamp_day       = tTwo.utc_timestamp_day;
     utc_timestamp_hour      = tTwo.utc_timestamp_hour;
     utc_timestamp_minute    = tTwo.utc_timestamp_minute;
     utc_timestamp_second    = tTwo.utc_timestamp_second;
     utc_timestamp_millisec = match tTwo.utc_timestamp_microsec with
     | None -> None
     | Some x -> Some (x/1000)}) 
 ;;
 
 let utctimestamp_Equal_micro_milli ( tOne: fix_utctimestamp_micro) (tTwo : fix_utctimestamp_milli  ) =
     ({
     utc_timestamp_year      = tOne.utc_timestamp_year;
     utc_timestamp_month     = tOne.utc_timestamp_month;
     utc_timestamp_day       = tOne.utc_timestamp_day;
     utc_timestamp_hour      = tOne.utc_timestamp_hour;
     utc_timestamp_minute    = tOne.utc_timestamp_minute;
     utc_timestamp_second    = tOne.utc_timestamp_second;
     utc_timestamp_millisec = match tOne.utc_timestamp_microsec with
     | None -> None
     | Some x -> Some (x/1000)} = tTwo)
 ;; 

(** UTC Timestamp milli base comparison operator *)
let utctimestamp_GreaterThan_milli_milli ( tOne: fix_utctimestamp_milli) (tTwo : fix_utctimestamp_milli ) =
  if utctimestamp_Equal_milli_milli tOne tTwo then false
  else
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

(** UTC Timestamp milli base comparison operator *)
let utctimestamp_GreaterThan_micro_micro ( tOne: fix_utctimestamp_micro) (tTwo : fix_utctimestamp_micro ) =
    if utctimestamp_Equal_micro_micro tOne tTwo then false
    else
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
      match tOne.utc_timestamp_microsec, tTwo.utc_timestamp_microsec with 
      | None      , None      -> true
      | Some _    , None      -> true
      | None      , Some _    -> false
      | Some one  , Some two  -> one > two
  ;;

(** UTC Timestamp base comparison operator - milli to micro *)
let utctimestamp_GreaterThan_milli_micro ( tOne: fix_utctimestamp_milli) (tTwo : fix_utctimestamp_micro ) =
    if utctimestamp_Equal_milli_micro tOne tTwo then false
    else
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
      match tOne.utc_timestamp_millisec, tTwo.utc_timestamp_microsec with 
      | None      , None      -> true
      | Some _    , None      -> true
      | None      , Some _    -> false
      | Some one  , Some two  -> one > two/1000
  ;;

(** UTC Timestamp base comparison operator - micro to milli *)
let utctimestamp_GreaterThan_micro_milli ( tOne: fix_utctimestamp_micro) (tTwo : fix_utctimestamp_milli ) =
    if utctimestamp_Equal_micro_milli tOne tTwo then false
    else
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
      match tOne.utc_timestamp_microsec, tTwo.utc_timestamp_millisec with 
      | None      , None      -> true
      | Some _    , None      -> true
      | None      , Some _    -> false
      | Some one  , Some two  -> one/1000 > two
  ;;

let utctimestamp_GreaterThanEqual_milli_milli ( tOne:fix_utctimestamp_milli) (tTwo : fix_utctimestamp_milli) =
    utctimestamp_GreaterThan_milli_milli tOne tTwo || utctimestamp_Equal_milli_milli tOne tTwo
;;

let utctimestamp_GreaterThanEqual_micro_micro ( tOne:fix_utctimestamp_micro) (tTwo : fix_utctimestamp_micro) =
    utctimestamp_GreaterThan_micro_micro tOne tTwo || utctimestamp_Equal_micro_micro tOne tTwo
;;

let utctimestamp_GreaterThanEqual_milli_micro ( tOne:fix_utctimestamp_milli) (tTwo : fix_utctimestamp_micro) =
    utctimestamp_GreaterThan_milli_micro tOne tTwo || utctimestamp_Equal_milli_micro tOne tTwo
;;

let utctimestamp_GreaterThanEqual_milli_milli ( tOne:fix_utctimestamp_micro) (tTwo : fix_utctimestamp_milli) =
    utctimestamp_GreaterThan_micro_milli tOne tTwo || utctimestamp_Equal_micro_milli tOne tTwo
;;

let utctimestamp_LessThan_milli_milli ( tOne :fix_utctimestamp_milli) (tTwo : fix_utctimestamp_milli  ) =
    not ( utctimestamp_GreaterThan_milli_milli tOne tTwo || utctimestamp_Equal_milli_milli tOne tTwo)
;;

let utctimestamp_LessThan_micro_micro ( tOne :fix_utctimestamp_milli) (tTwo : fix_utctimestamp_micro  ) =
    not ( utctimestamp_GreaterThan_milli_micro tOne tTwo || utctimestamp_Equal_milli_micro tOne tTwo)
;;

let utctimestamp_LessThan_milli_micro ( tOne :fix_utctimestamp_micro) (tTwo : fix_utctimestamp_milli  ) =
    not ( utctimestamp_GreaterThan_micro_milli tOne tTwo || utctimestamp_Equal_micro_milli tOne tTwo)
;;

let utctimestamp_LessThan_micro_micro ( tOne :fix_utctimestamp_micro) (tTwo : fix_utctimestamp_micro  ) =
    not ( utctimestamp_GreaterThan_micro_micro tOne tTwo || utctimestamp_Equal_micro_micro tOne tTwo)
;;

let utctimestamp_LessThanEqual_milli_milli ( tOne : fix_utctimestamp_milli) (tTwo : fix_utctimestamp_milli  ) =
    not ( utctimestamp_GreaterThan_milli_milli tOne tTwo )
;;

let utctimestamp_LessThanEqual_micro_micro ( tOne : fix_utctimestamp_micro) (tTwo : fix_utctimestamp_micro  ) =
    not ( utctimestamp_GreaterThan_micro_micro tOne tTwo )
;;

let utctimestamp_LessThanEqual_milli_micro ( tOne : fix_utctimestamp_milli) (tTwo : fix_utctimestamp_micro  ) =
    not ( utctimestamp_GreaterThan_milli_micro tOne tTwo )
;;

let utctimestamp_LessThanEqual_micro_milli ( tOne : fix_utctimestamp_micro) (tTwo : fix_utctimestamp_milli  ) =
    not ( utctimestamp_GreaterThan_micro_milli tOne tTwo )
;;

(** LocalMktDate type denotes a particular date*)
type fix_localmktdate = {
    localmktdate_year       : int;
    localmktdate_month      : int;
    localmktdate_day        : int;
};;

(** Default LocalMktDate corresponds to 0 unix epoch timestamp *)
let default_localmktdate = {
    localmktdate_year       = 1970;
    localmktdate_month      = 1;
    localmktdate_day        = 1;
}
;;

(** LocalMktDate constructor *)
let make_localmktdate ( year:int) (month:int) (day : int) = {
    localmktdate_year = year;
    localmktdate_month = month;
    localmktdate_day = day;
}
;;


let is_valid_localmktdate ( lmd : fix_localmktdate ) =
    0 <= lmd.localmktdate_year && lmd.localmktdate_year <= 9999 && 
    1 <= lmd.localmktdate_month && lmd.localmktdate_month <= 12 && 
    1 <= lmd.localmktdate_day && lmd.localmktdate_day <= 31
;;

let localmktdate_GreaterThan ( lmdOne: fix_localmktdate) (lmdTwo : fix_localmktdate ) = 
    if lmdOne.localmktdate_year > lmdTwo.localmktdate_year then true else
    if lmdOne.localmktdate_year < lmdTwo.localmktdate_year then false else 
    if lmdOne.localmktdate_month > lmdTwo.localmktdate_month then true else
    if lmdOne.localmktdate_month < lmdTwo.localmktdate_month then false else
    lmdOne.localmktdate_day > lmdTwo.localmktdate_day
;;

let localmktdate_LessThan ( lmdOne: fix_localmktdate) (lmdTwo : fix_localmktdate ) = 
    if lmdOne.localmktdate_year < lmdTwo.localmktdate_year then true else
    if lmdOne.localmktdate_year > lmdTwo.localmktdate_year then false else 
    if lmdOne.localmktdate_month < lmdTwo.localmktdate_month then true else
    if lmdOne.localmktdate_month > lmdTwo.localmktdate_month then false else
    lmdOne.localmktdate_day < lmdTwo.localmktdate_day
;;

let localmktdate_Equal ( lmdOne :fix_localmktdate) (lmdTwo : fix_localmktdate  ) = 
    lmdOne.localmktdate_year = lmdTwo.localmktdate_year &&
    lmdOne.localmktdate_month = lmdTwo.localmktdate_month &&
    lmdOne.localmktdate_day = lmdTwo.localmktdate_day
;;

let localmktdate_GreaterThanEqual ( lmdOne: fix_localmktdate) (lmdTwo : fix_localmktdate  ) = 
    localmktdate_GreaterThan lmdOne lmdTwo || localmktdate_Equal lmdOne lmdTwo
;;

let localmktdate_LessThanEqual ( lmdOne: fix_localmktdate) (lmdTwo :  fix_localmktdate ) =
    localmktdate_LessThan lmdOne lmdTwo || localmktdate_Equal lmdOne lmdTwo
;;

(** Week *)
type fix_week = 
    | Week_1
    | Week_2
    | Week_3
    | Week_4
    | Week_5
;;

(** MonthYear *)
type fix_monthyear = {
    monthyear_year          : int;
    monthyear_month         : int;
    monthyear_day           : int option;
    monthyear_week          : fix_week option;
};;


let default_monthyear = {
    monthyear_year   = 1970;
    monthyear_month  = 1;
    monthyear_day    = Some 1;
    monthyear_week   = None;
}
;;


let make_monthyear ( year:int) (month:int) (week : fix_week option) = {
    monthyear_year = year;
    monthyear_month = month;
    monthyear_day = None;
    monthyear_week = week;
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

(** TODO: Add support for weeks! *)
let monthyear_GreaterThan ( myOne: fix_monthyear) (myTwo : fix_monthyear ) =
    if myOne.monthyear_year > myTwo.monthyear_year then true else
    if myOne.monthyear_year < myTwo.monthyear_year then false else
    if myOne.monthyear_month > myTwo.monthyear_month then true else
    if myOne.monthyear_month < myTwo.monthyear_month then false else
    match myOne.monthyear_day, myTwo.monthyear_day with
    | None, None -> false
    | Some d, None -> true
    | None, Some d -> false
    | Some d_one, Some d_two -> d_one > d_two
;;

let monthyear_LessThan ( myOne: fix_monthyear) (myTwo : fix_monthyear ) =
    if myOne.monthyear_year < myTwo.monthyear_year then true else
    if myOne.monthyear_year > myTwo.monthyear_year then false else
    if myOne.monthyear_month < myTwo.monthyear_month then true else
    if myOne.monthyear_month > myTwo.monthyear_month then false else
    match myOne.monthyear_day, myTwo.monthyear_day with
    | None, None -> false
    | Some d, None -> false
    | None, Some d -> true
    | Some d_one, Some d_two -> d_one > d_two
;;

let monthyear_Equal ( myOne: fix_monthyear) (myTwo : fix_monthyear) =
    myOne.monthyear_year = myTwo.monthyear_year &&
    myOne.monthyear_month = myTwo.monthyear_month &&
    myOne.monthyear_day = myTwo.monthyear_day
;;

let monthyear_GreaterThanEqual ( myOne : fix_monthyear) (myTwo : fix_monthyear ) = 
    monthyear_GreaterThan myOne myTwo || monthyear_Equal  myOne myTwo
;;

let monthyear_LessThanEqual ( myOne : fix_monthyear) (myTwo : fix_monthyear  ) = 
    monthyear_LessThan myOne myTwo || monthyear_Equal myOne myTwo
;;


(** UTC Timeonly *)
type fix_utctimeonly_milli = {
    utc_timeonly_hour       : int;
    utc_timeonly_minute     : int;
    utc_timeonly_second     : int;
    utc_timeonly_millisec   : int option;
};;

type fix_utctimeonly_micro = {
    utc_timeonly_hour       : int;
    utc_timeonly_minute     : int;
    utc_timeonly_second     : int;
    utc_timeonly_microsec   : int option;
};;

let default_utctimeonly_milli = {
    utc_timeonly_hour       = 0;
    utc_timeonly_minute     = 0;
    utc_timeonly_second     = 0;
    utc_timeonly_millisec   = Some 0;
};;

let default_utctimeonly_micro = {
    utc_timeonly_hour       = 0;
    utc_timeonly_minute     = 0;
    utc_timeonly_second     = 0;
    utc_timeonly_microsec   = Some 0;
};;


let make_utctimeonly_milli (hour:int) (minute:int) (second:int) (millisec: int option) : fix_utctimeonly_milli = {
    utc_timeonly_hour       = hour;
    utc_timeonly_minute     = minute;
    utc_timeonly_second     = second;
    utc_timeonly_millisec   = millisec;
};;

let make_utctimeonly_micro (hour:int) (minute:int) (second:int) (microsec: int option) : fix_utctimeonly_micro = {
    utc_timeonly_hour       = hour;
    utc_timeonly_minute     = minute;
    utc_timeonly_second     = second;
    utc_timeonly_microsec   = microsec;
};;

let is_valid_utctimeonly_milli ( t : fix_utctimeonly_milli ) =
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

let is_valid_utctimeonly_micro ( t : fix_utctimeonly_micro ) =
    0 <= t.utc_timeonly_hour && 
    t.utc_timeonly_hour <= 23 &&
    0 <= t.utc_timeonly_minute &&
    t.utc_timeonly_minute <= 59 &&
    0 <= t.utc_timeonly_second &&
    t.utc_timeonly_second <= 59 && ( 
        match t.utc_timeonly_microsec with 
        | None      -> true
        | Some ms   -> 0 <= ms && ms <= 999999
    )
;;

let utctimeonly_Equal_milli_milli ( tOne: fix_utctimeonly_milli) (tTwo : fix_utctimeonly_milli  ) =
    (tOne = tTwo)
  ;;
  
  let utctimeonly_Equal_micro_micro ( tOne: fix_utctimeonly_micro) (tTwo : fix_utctimeonly_micro  ) =
      (tOne = tTwo)
    ;;
  
    let utctimeonly_Equal_milli_micro ( tOne: fix_utctimeonly_milli) (tTwo : fix_utctimeonly_micro  ) =
      (tOne = {
      utc_timeonly_hour      = tTwo.utc_timeonly_hour;
      utc_timeonly_minute    = tTwo.utc_timeonly_minute;
      utc_timeonly_second    = tTwo.utc_timeonly_second;
      utc_timeonly_millisec = match tTwo.utc_timeonly_microsec with
      | None -> None
      | Some x -> Some (x/1000)}) 
  ;;
  
  let utctimeonly_Equal_micro_milli ( tOne: fix_utctimeonly_micro) (tTwo : fix_utctimeonly_milli  ) =
      ({
      utc_timeonly_hour      = tOne.utc_timeonly_hour;
      utc_timeonly_minute    = tOne.utc_timeonly_minute;
      utc_timeonly_second    = tOne.utc_timeonly_second;
      utc_timeonly_millisec = match tOne.utc_timeonly_microsec with
      | None -> None
      | Some x -> Some (x/1000)} = tTwo)
  ;;

let utctimeonly_GreaterThan_milli_milli ( tOne:fix_utctimeonly_milli) (tTwo : fix_utctimeonly_milli ) =
    if utctimeonly_Equal_milli_milli tOne tTwo then false 
    else if tOne.utc_timeonly_hour > tTwo.utc_timeonly_hour then true
    else if tOne.utc_timeonly_hour < tTwo.utc_timeonly_hour then false
    else if tOne.utc_timeonly_minute > tTwo.utc_timeonly_minute then true
    else if tOne.utc_timeonly_minute < tTwo.utc_timeonly_minute then false
    else if tOne.utc_timeonly_second > tTwo.utc_timeonly_second then true
    else 
    match tOne.utc_timeonly_millisec, tTwo.utc_timeonly_millisec with 
    | None      , None      -> true
    | Some _    , None      -> true
    | None      , Some _    -> false
    | Some one  , Some two  -> one > two
;;

let utctimeonly_GreaterThan_micro_micro ( tOne:fix_utctimeonly_micro) (tTwo : fix_utctimeonly_micro ) =
    if utctimeonly_Equal_micro_micro tOne tTwo then false 
    else if tOne.utc_timeonly_hour > tTwo.utc_timeonly_hour then true
    else if tOne.utc_timeonly_hour < tTwo.utc_timeonly_hour then false
    else if tOne.utc_timeonly_minute > tTwo.utc_timeonly_minute then true
    else if tOne.utc_timeonly_minute < tTwo.utc_timeonly_minute then false
    else if tOne.utc_timeonly_second > tTwo.utc_timeonly_second then true
    else 
    match tOne.utc_timeonly_microsec, tTwo.utc_timeonly_microsec with 
    | None      , None      -> true
    | Some _    , None      -> true
    | None      , Some _    -> false
    | Some one  , Some two  -> one > two
;;

let utctimeonly_GreaterThan_milli_micro ( tOne:fix_utctimeonly_milli) (tTwo : fix_utctimeonly_micro ) =
    if utctimeonly_Equal_milli_micro tOne tTwo then false 
    else if tOne.utc_timeonly_hour > tTwo.utc_timeonly_hour then true
    else if tOne.utc_timeonly_hour < tTwo.utc_timeonly_hour then false
    else if tOne.utc_timeonly_minute > tTwo.utc_timeonly_minute then true
    else if tOne.utc_timeonly_minute < tTwo.utc_timeonly_minute then false
    else if tOne.utc_timeonly_second > tTwo.utc_timeonly_second then true
    else 
    match tOne.utc_timeonly_millisec, tTwo.utc_timeonly_microsec with 
    | None      , None      -> true
    | Some _    , None      -> true
    | None      , Some _    -> false
    | Some one  , Some two  -> one > two/1000
;;

let utctimeonly_GreaterThan_micro_milli ( tOne:fix_utctimeonly_micro) (tTwo : fix_utctimeonly_milli ) =
    if utctimeonly_Equal_micro_milli tOne tTwo then false 
    else if tOne.utc_timeonly_hour > tTwo.utc_timeonly_hour then true
    else if tOne.utc_timeonly_hour < tTwo.utc_timeonly_hour then false
    else if tOne.utc_timeonly_minute > tTwo.utc_timeonly_minute then true
    else if tOne.utc_timeonly_minute < tTwo.utc_timeonly_minute then false
    else if tOne.utc_timeonly_second > tTwo.utc_timeonly_second then true
    else 
    match tOne.utc_timeonly_microsec, tTwo.utc_timeonly_millisec with 
    | None      , None      -> true
    | Some _    , None      -> true
    | None      , Some _    -> false
    | Some one  , Some two  -> one/1000 > two
;;

let utctimeonly_LessThan_milli_milli ( tOne:fix_utctimeonly_milli) (tTwo : fix_utctimeonly_milli ) =
    not ( utctimeonly_GreaterThan_milli_milli tOne tTwo || utctimeonly_Equal_milli_milli tOne tTwo)
;;

let utctimeonly_LessThan_milli_milli ( tOne:fix_utctimeonly_micro) (tTwo : fix_utctimeonly_micro ) =
    not ( utctimeonly_GreaterThan_micro_micro tOne tTwo || utctimeonly_Equal_micro_micro tOne tTwo)
;;

let utctimeonly_LessThan_milli_micro ( tOne:fix_utctimeonly_milli) (tTwo : fix_utctimeonly_micro ) =
    not ( utctimeonly_GreaterThan_milli_micro tOne tTwo || utctimeonly_Equal_milli_micro tOne tTwo)
;;

let utctimeonly_LessThan_micro_milli ( tOne:fix_utctimeonly_micro) (tTwo : fix_utctimeonly_milli ) =
    not ( utctimeonly_GreaterThan_micro_milli tOne tTwo || utctimeonly_Equal_micro_milli tOne tTwo)
;;

let utctimeonly_LessThanEqual_milli_milli ( tOne:fix_utctimeonly_milli) (tTwo : fix_utctimeonly_milli ) =
    not ( utctimeonly_GreaterThan_milli_milli tOne tTwo )
;;

let utctimeonly_LessThanEqual_micro_micro ( tOne:fix_utctimeonly_micro) (tTwo : fix_utctimeonly_micro ) =
    not ( utctimeonly_GreaterThan_micro_micro tOne tTwo )
;;

let utctimeonly_LessThanEqual_milli_micro ( tOne:fix_utctimeonly_milli) (tTwo : fix_utctimeonly_micro ) =
    not ( utctimeonly_GreaterThan_milli_micro tOne tTwo )
;;

let utctimeonly_LessThanEqual_micro_milli ( tOne:fix_utctimeonly_micro) (tTwo : fix_utctimeonly_milli ) =
    not ( utctimeonly_GreaterThan_micro_milli tOne tTwo )
;;

let utctimeonly_GreaterThanEqual_milli_milli ( tOne:fix_utctimeonly_milli) (tTwo : fix_utctimeonly_milli ) = 
    utctimeonly_GreaterThan_milli_milli tOne tTwo || utctimeonly_Equal_milli_milli tOne tTwo
;;

let utctimeonly_GreaterThanEqual_micro_micro ( tOne:fix_utctimeonly_micro) (tTwo : fix_utctimeonly_micro ) = 
    utctimeonly_GreaterThan_micro_micro tOne tTwo || utctimeonly_Equal_micro_micro tOne tTwo
;;

let utctimeonly_GreaterThanEqual_milli_micro ( tOne:fix_utctimeonly_milli) (tTwo : fix_utctimeonly_micro ) = 
    utctimeonly_GreaterThan_milli_micro tOne tTwo || utctimeonly_Equal_milli_micro tOne tTwo
;;

let utctimeonly_GreaterThanEqual_micro_milli ( tOne:fix_utctimeonly_micro) (tTwo : fix_utctimeonly_milli ) = 
    utctimeonly_GreaterThan_micro_milli tOne tTwo || utctimeonly_Equal_micro_milli tOne tTwo
;;

(** UTC Dateonly *)
type fix_utcdateonly = {
    utc_dateonly_year       : int;
    utc_dateonly_month      : int;
    utc_dateonly_day        : int;
};;

(** UTC Dateonly *)
let default_utcdateonly = {
    utc_dateonly_year       = 1970;
    utc_dateonly_month      = 1;
    utc_dateonly_day        = 1;
};;


let make_utcdateonly ( year:int) (month:int) (day : int) = {
    utc_dateonly_year = year;
    utc_dateonly_month = month;
    utc_dateonly_day = day;
};;


let is_valid_utcdateonly ( d : fix_utcdateonly ) =
    0 <= d.utc_dateonly_year && d.utc_dateonly_year <= 9999 && 
    1 <= d.utc_dateonly_month && d.utc_dateonly_month <= 12 && 
    1 <= d.utc_dateonly_day && d.utc_dateonly_day <= 31
;;

let utcdateonly_GreaterThan ( dOne:fix_utcdateonly) (dTwo : fix_utcdateonly ) =
    if dOne.utc_dateonly_year > dTwo.utc_dateonly_year then true else 
    if dOne.utc_dateonly_year < dTwo.utc_dateonly_year then false else
    if dOne.utc_dateonly_month > dTwo.utc_dateonly_month then true else
    if dOne.utc_dateonly_month < dTwo.utc_dateonly_month then false else
    dOne.utc_dateonly_day > dTwo.utc_dateonly_day
;;

let utcdateonly_LessThan ( dOne:fix_utcdateonly) (dTwo : fix_utcdateonly  ) =
    if dOne.utc_dateonly_year > dTwo.utc_dateonly_year then false else 
    if dOne.utc_dateonly_year < dTwo.utc_dateonly_year then true else
    if dOne.utc_dateonly_month > dTwo.utc_dateonly_month then false else
    if dOne.utc_dateonly_month < dTwo.utc_dateonly_month then true else
    dOne.utc_dateonly_day < dTwo.utc_dateonly_day
;;

let utcdateonly_Equal ( dOne:fix_utcdateonly) (dTwo : fix_utcdateonly ) =
    dOne.utc_dateonly_year = dTwo.utc_dateonly_year &&
    dOne.utc_dateonly_month = dTwo.utc_dateonly_year &&
    dOne.utc_dateonly_day = dTwo.utc_dateonly_month
;;

let utcdateonly_GreaterThanEqual ( dOne:fix_utcdateonly) (dTwo : fix_utcdateonly  ) =
    utcdateonly_GreaterThan dOne dTwo || utcdateonly_Equal dOne dTwo
;;

let utcdateonly_LessThanEqual ( dOne:fix_utcdateonly) (dTwo : fix_utcdateonly ) =
    utcdateonly_LessThan dOne dTwo || utcdateonly_Equal dOne dTwo
;;


(** Duration *)
type fix_duration = {
    dur_years               : int option;
    dur_months              : int option;
    dur_days                : int option;
    dur_hours               : int option;
    dur_minutes             : int option;
    dur_seconds             : int option;
}
;;


let make_duration years months days hours minutes seconds = {
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


type field_carryover = {
    carry_over  : bool;
    new_field   : int;
}
;;


let calculate_carry ( field:int) (max_value:int) (min_value : int  ) =
    if field >= max_value then {
        new_field = field - max_value + min_value;
        carry_over = true;
    } else {
        new_field = field;
        carry_over = false;
    }
;;


let normalise_timestamp_milli ( ts : fix_utctimestamp_milli ) =
    let carry_secs  = calculate_carry ts.utc_timestamp_second 60 0 in
    let new_minute  = if carry_secs.carry_over then ( ts.utc_timestamp_minute + 1)  else ts.utc_timestamp_minute in 
    let carry_mins  = calculate_carry  new_minute            60 0  in
    let new_hour    = if carry_mins.carry_over then ( ts.utc_timestamp_hour + 1 )   else ts.utc_timestamp_hour in 
    let carry_hours = calculate_carry  new_hour               24 0 in 
    let new_days    = if carry_hours.carry_over then ( ts.utc_timestamp_day + 1 )   else ts.utc_timestamp_day in 
    let carry_days  = calculate_carry new_days (1 + (how_many_days ts.utc_timestamp_month ts.utc_timestamp_year )) 1 in
    let new_months  = if carry_days.carry_over then ( ts.utc_timestamp_month + 1 )  else ts.utc_timestamp_month in
    let carry_months = calculate_carry new_months            13 1 in 
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

let normalise_timestamp_micro ( ts : fix_utctimestamp_micro ) =
    let carry_secs  = calculate_carry ts.utc_timestamp_second 60 0 in
    let new_minute  = if carry_secs.carry_over then ( ts.utc_timestamp_minute + 1)  else ts.utc_timestamp_minute in 
    let carry_mins  = calculate_carry  new_minute            60 0  in
    let new_hour    = if carry_mins.carry_over then ( ts.utc_timestamp_hour + 1 )   else ts.utc_timestamp_hour in 
    let carry_hours = calculate_carry  new_hour               24 0 in 
    let new_days    = if carry_hours.carry_over then ( ts.utc_timestamp_day + 1 )   else ts.utc_timestamp_day in 
    let carry_days  = calculate_carry new_days (1 + (how_many_days ts.utc_timestamp_month ts.utc_timestamp_year )) 1 in
    let new_months  = if carry_days.carry_over then ( ts.utc_timestamp_month + 1 )  else ts.utc_timestamp_month in
    let carry_months = calculate_carry new_months            13 1 in 
    let new_years   = if carry_months.carry_over then ( ts.utc_timestamp_year + 1 ) else ts.utc_timestamp_year in {
        utc_timestamp_microsec  = ts.utc_timestamp_microsec;
        utc_timestamp_second    = carry_secs.new_field;
        utc_timestamp_minute    = carry_mins.new_field;
        utc_timestamp_hour      = carry_hours.new_field;
        utc_timestamp_day       = carry_days.new_field;
        utc_timestamp_month     = carry_months.new_field;
        utc_timestamp_year      = new_years;
    }
;;


let utctimestamp_milli_duration_Add ( t:fix_utctimestamp_milli) (dur : fix_duration ) = 
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
    normalise_timestamp_milli ( new_ts )
;;

let utctimestamp_micro_duration_Add ( t:fix_utctimestamp_micro) (dur : fix_duration ) = 
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
        utc_timestamp_microsec  = t.utc_timestamp_microsec; 
        utc_timestamp_second    = new_seconds;
        utc_timestamp_minute    = new_minute;
        utc_timestamp_hour      = new_hour;
        utc_timestamp_day       = new_day;
        utc_timestamp_month     = new_month;
        utc_timestamp_year      = new_year;
    } in
    normalise_timestamp_micro ( new_ts )
;;


let seconds_to_duration ( seconds ) = 
    let ts = normalise_timestamp_milli {
        utc_timestamp_year      = 0;
        utc_timestamp_month     = 0;
        utc_timestamp_day       = 0;
        utc_timestamp_hour      = 0;
        utc_timestamp_minute    = 0;
        utc_timestamp_second    = seconds;
        utc_timestamp_millisec  = None;
    } in { 
        dur_years    = ( match ts.utc_timestamp_year   with 0 -> None | x -> Some x) ; 
        dur_months   = ( match ts.utc_timestamp_month  with 0 -> None | x -> Some x) ; 
        dur_days     = ( match ts.utc_timestamp_day    with 0 -> None | x -> Some x) ; 
        dur_hours    = ( match ts.utc_timestamp_hour   with 0 -> None | x -> Some x) ; 
        dur_minutes  = ( match ts.utc_timestamp_minute with 0 -> None | x -> Some x) ; 
        dur_seconds  = ( match ts.utc_timestamp_second with 0 -> None | x -> Some x) ; 
    }
;;

(** TODO This is unfinished -- check how months are accounted for *)
let duration_to_seconds ( dur ) =
    let sec =       match dur.dur_seconds with None -> 0 | Some x -> x in
    let sec = sec + match dur.dur_minutes with None -> 0 | Some x -> 60 * x in
    let sec = sec + match dur.dur_hours   with None -> 0 | Some x -> 60 * 60 * x in
    let sec = sec + match dur.dur_days    with None -> 0 | Some x -> 24 * 60 * 60 * x in    
    sec
;;
