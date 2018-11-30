open Datetime

let get_current_utctimestamp () = 
  let open TimeDefaults in
  let inc_value = match default_time_precision with
    | Milli -> 1000.
    | Micro -> 1000000. in 
  let dtime = Unix.gettimeofday () in 
  let tm = Unix.gmtime dtime in
  let msec = int_of_float (inc_value *. (dtime -. floor dtime)) in
  make_utctimestamp (tm.Unix.tm_year + 1900)
    (tm.Unix.tm_mon + 1) tm.Unix.tm_mday tm.Unix.tm_hour
    tm.Unix.tm_min tm.Unix.tm_sec  (Some msec)
;;

let get_current_utctimestamp_milli () : Datetime.fix_utctimestamp_milli =    
  let open Datetime in
  let dtime = Unix.gettimeofday () in 
  let tm = Unix.gmtime dtime in
  let msec = int_of_float (1000. *. (dtime -. floor dtime)) in
  make_utctimestamp_milli (tm.Unix.tm_year + 1900)
    (tm.Unix.tm_mon + 1) tm.Unix.tm_mday tm.Unix.tm_hour
    tm.Unix.tm_min tm.Unix.tm_sec  (Some msec)
;;

let get_current_utctimestamp_micro () : Datetime.fix_utctimestamp_micro =    
  let open Datetime in
  let dtime = Unix.gettimeofday () in 
  let tm = Unix.gmtime dtime in
  let msec = int_of_float (1000000. *. (dtime -. floor dtime)) in
  make_utctimestamp_micro (tm.Unix.tm_year + 1900)
    (tm.Unix.tm_mon + 1) tm.Unix.tm_mday tm.Unix.tm_hour
    tm.Unix.tm_min tm.Unix.tm_sec  (Some msec)
;;

let get_current_utctimeonly_milli () : fix_utctimeonly_milli =    
  convert_utctimestamp_milli_utctimeonly_milli 
  (get_current_utctimestamp_milli ())
;;

let get_current_utctimeonly_micro () : fix_utctimeonly_micro =    
  convert_utctimestamp_micro_utctimeonly_micro 
  (get_current_utctimestamp_micro ())
;;

let get_current_utcdateonly () : fix_utcdateonly = 
    convert_utctimestamp_milli_dateonly 
    (get_current_utctimestamp_milli ())
;;

let get_current_monthyear () : fix_monthyear = 
    convert_utctimestamp_milli_monthyear 
    (get_current_utctimestamp_milli ())
;;

let get_current_localmktdate () : fix_localmktdate = 
     convert_utctimestamp_milli_localmktdate
    (get_current_utctimestamp_milli ())
;;
