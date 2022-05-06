let (let*) = Lwt.bind

let log_box : Runtime.event Lwt_mvar.t = Lwt_mvar.create_empty ()
let model_box : Runtime.event Lwt_mvar.t = Lwt_mvar.create_empty ()

let config = Engine.{
  comp_id       = "TEST_SERVER";
  target_id     = "TEST_CLIENT";
  host_id       = None;
  on_behalf_id  = None;
  timer         = 0.1;
  begin_string  = "FIX.4.4";
  millisecond_precision = false
}

let ts_parser =
  let parse_milli x =
    match Parse_datetime.parse_UTCTimestamp_milli x with None -> None
    | Some x -> Some ( Datetime.convert_utctimestamp_milli_micro x)
    in
  if config.millisecond_precision then parse_milli   
  else Parse_datetime.parse_UTCTimestamp_micro 
  

let log_thread () =
  let rec thread () = 
    let* msg = Lwt_mvar.take log_box in
    let msg = Fix_io.encode ~split:'|' msg.Runtime.message in
    let* () = Lwt_io.printl ("Log thread: "  ^ msg) in
    thread ()
    in
  thread ()

let engine_thread () =
  let recv msg = 
    let* () = Lwt_mvar.put log_box msg in
    Lwt_mvar.put model_box msg 
    in
  let port, reset = 9880, true in
  Runtime.start_server ~reset ~config ~port ~recv ()

let engine_to_model_thread model_handle () =
  let rec thread () = 
    let* msg = Lwt_mvar.take model_box in
    let* () = Lwt_io.printl ("engine_to_model_got message") in
    let* () = match msg.direction, msg.msg_type with
      | Incoming , Application -> begin
        let open Full_messages in
        let msg = Parse_full_messages.parse_top_level_msg ts_parser msg.message in
        let* () = Lwt_io.printl ("Incoming app message") in
        match msg with 
        | ValidMsg msg -> begin 
          let* () = Lwt_io.printl ("Valid message") in
          match msg.full_msg_data with
          | Full_FIX_Admin_Msg _ -> 
            Lwt.return_unit
          | Full_FIX_App_Msg data -> 
            Model.send_fix model_handle data
        end
        | _ -> Lwt.return_unit
      end  
      | _ , _  -> 
        let* () = Lwt_io.printl ("Irrelevant. skipping") in
        Lwt.return_unit
      in
    thread ()
    in
  thread ()

let model_recv (evt : Model.event) =
  match evt with
  | FIXMessage (IncIntMsg_ApplicationData(data)) -> begin
    let msg = ("35", data.msg_tag)::data.payload in
    let* r = Runtime.send_message msg in
    Lwt.return ( ignore r)
  end
  | _ -> Lwt.return_unit  

let () =
  let model_thread , model = Model.start ~recv:model_recv in
  let thread = Lwt.join
    [ engine_thread ()
    ; log_thread ()
    ; model_thread
    ; engine_to_model_thread model () 
    ] in
  Lwt_main.run thread 

