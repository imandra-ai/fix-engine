let get_current_utctimestamp () =    
  let open TimeDefaults in
  let dtime = Unix.gettimeofday () in 
  let tm = Unix.gmtime dtime in
  let msec = int_of_float 
    (match default_time_precision with Milli -> 1000. | Micro -> 1000000.
    *. (dtime -. floor dtime)) in
  make_utctimestamp (tm.Unix.tm_year + 1900)
    (tm.Unix.tm_mon + 1) tm.Unix.tm_mday tm.Unix.tm_hour
    tm.Unix.tm_min tm.Unix.tm_sec  (Some msec)
;;