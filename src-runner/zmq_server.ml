let (let*) = Lwt.bind

let config = Engine.{
  comp_id = "IMANDRA"; 
  target_id = "CLIENT";
  host_id = None;  
  on_behalf_id = None;
  timer = 1.0;
  begin_string = None;
  millisecond_precision = None
}

let event_box : Server.event Lwt_mvar.t = Lwt_mvar.create_empty ()

let rec echo_thread () =
  let* event : Server.event = Lwt_mvar.take event_box in
  let msg = Fix_io.encode ~split:'|' event.message in
  let* () = Lwt_io.printl msg in
  let* () = Lwt_io.flush_all () in
  echo_thread ()


let main () =
  let recv = Lwt_mvar.put event_box in
  Lwt.join
  [ Server.start ~config ~port:9880 ~recv ()
  ; echo_thread ()
  ] 


let () = Lwt_main.run ( main () )