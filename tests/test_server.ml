let (let*) = Lwt.bind

module Model = struct

  type event =
    | FIXMessage of Fix_engine_state.fix_engine_int_inc_msg
    | State of State.model_state

  type send_event =
    | FIX_message of Fix_engine_state.fix_engine_int_out_msg
    | Action of Actions.fix_action
    | GetState
    | Terminate

  type t =
    { recv : event -> unit Lwt.t
    ; send_box : send_event Lwt_mvar.t
    }

  let msg_data_from_model_msg msg = 
    let data = Type_converter.convert_model_to_full_fix msg in
    let data = Encode_app_messages.encode_app_msg_data data in
    let msg_tag = data |> List.assoc_opt "35" in 
    let msg_tag = match msg_tag with Some (Some x) -> x | _ -> "?" in
    let payload = data |> List.filter_map @@ function 
      | ("35" , _ ) -> None  
      | ( a   , Some b) -> Some (a,b) 
      | _ -> None  
      in
    Full_messages.{ msg_tag ; payload }


  let model_msg_from_msg_data data = 
    let open CCOption.Infix in
    let Full_messages.{ msg_tag ; payload } = data in
    let* msg_tag = Parse_app_tags.parse_app_msg_tag msg_tag in
    let* payload = 
      match Parse_app_messages.parse_app_msg_data msg_tag payload with 
      | Parser_utils.Parser.ParseSuccess x -> Some x
      | _ -> None 
    in
    Some(Type_converter.convert_full_to_model_fix payload) 


  let rec send_messages_list t messages =
    let open Fix_engine_state in
    match messages with
    | [] -> Lwt.return_unit
    | hd :: tl ->
    let data = msg_data_from_model_msg hd in
    let* () = t.recv (FIXMessage (IncIntMsg_ApplicationData data)) in
    send_messages_list t tl

  let rec main_loop t model_state =
    let send_to_model data =
      let model_message_opt = model_msg_from_msg_data data in
      match model_message_opt with None -> Lwt.return model_state
      | Some model_message -> 
        let model_state = State_utils.set_incoming model_state model_message in
        Lwt.return @@ Venue.one_step model_state
      in
    let* incoming = Lwt_mvar.take t.send_box in
    let* model_state = match incoming with
      | FIX_message (OutIntMsg_ApplicationData       data) -> send_to_model data
      | FIX_message (OutIntMsg_ResendApplicationData data) -> send_to_model data
      | Action act ->
        let _good = Act_checks.is_action_valid act model_state in
        let model_state = { model_state with State.incoming_action = Some act } in
        Lwt.return @@ Venue.one_step model_state
      | GetState ->
        let* () = t.recv (State model_state) in 
        Lwt.return model_state
      | _ -> Lwt.return model_state 
      in
    let open State in
    let messages =
      State_utils.get_outgoing model_state
      |> List.map (fun x -> x.outgoing_msg_msg)
    in
    let* () = send_messages_list t messages in
    let model_state = State_utils.set_outgoing model_state [] in
    match incoming with
    | Terminate ->
        Lwt.return_unit
    | _ ->
        main_loop t model_state

    let start ~recv =
      let model_state = State.init_model_state in
      let t = { send_box = Lwt_mvar.create_empty (); recv } in
      let thread = main_loop t model_state in
      (thread, t)
      
    let terminate t = Lwt_mvar.put t.send_box Terminate  
    let send_fix t msg = Lwt_mvar.put t.send_box @@ FIX_message ( OutIntMsg_ApplicationData msg)
    let send_act t act = Lwt_mvar.put t.send_box @@ Action act
    let send_get_state t = Lwt_mvar.put t.send_box @@ GetState

end


let log_box : Runner.event Lwt_mvar.t = Lwt_mvar.create_empty ()
let model_box : Runner.event Lwt_mvar.t = Lwt_mvar.create_empty ()


let config = Engine.{
  comp_id       = "TEST_SERVER";
  target_id     = "TEST_CLIENT";
  host_id       = None;
  on_behalf_id  = None;
  timer         = 0.1;
  begin_string  = "FIX.4.2";
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
    let msg = Fix_io.encode ~split:'|' msg.Runner.message in
    let* () = Lwt_io.printl msg in
    thread ()
    in
  thread ()

let engine_thread () =
  let recv msg = 
    let* () = Lwt_mvar.put log_box msg in
    Lwt_mvar.put model_box msg 
    in
  let port, reset = 9880, true in
  Runner.start_server ~reset ~config ~port ~recv ()

let engine_to_model_thread model_handle () =
  let rec thread () = 
    let* msg = Lwt_mvar.take model_box in
    let* () = match msg.direction, msg.msg_type with
      | Incoming , Application -> begin
        let open Full_messages in
        let msg = Parse_full_messages.parse_top_level_msg ts_parser msg.message in
        match msg with 
        | ValidMsg msg -> begin 
          match msg.full_msg_data with
          | Full_FIX_Admin_Msg _ -> Lwt.return_unit
          | Full_FIX_App_Msg data -> 
            Model.send_fix model_handle data
        end
        | _ -> Lwt.return_unit
      end  
      | _ , _  -> Lwt.return_unit
      in
    thread ()
    in
  thread ()

let model_recv (evt : Model.event) =
  match evt with
  | FIXMessage (IncIntMsg_ApplicationData(data)) -> begin
    let msg = ("35", data.msg_tag)::data.payload in
    let* r = Runner.send_message msg in
    Lwt.return ( ignore r)
  end
  | _ -> Lwt.return_unit  

let main () =
  let model_thread , model = Model.start ~recv:model_recv in
  let thread = Lwt.join
    [ engine_thread ()
    ; log_thread ()
    ; model_thread
    ; engine_to_model_thread model () 
    ] in
  Lwt_main.run thread 
