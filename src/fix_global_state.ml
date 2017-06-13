let (>>=) = Lwt.(>>=)


type incoming_event =
    | FIX_Message      of Full_messages.full_top_level_msg
    | Internal_Message of Fix_engine_state.fix_engine_int_inc_msg
    | Terminate


type fix_global_state = {
         incoming : incoming_event Lwt_mvar.t;
     engine_state : Fix_engine_state.fix_engine_state;
      model_state : State.model_state;
     fix_callback : Full_messages.full_top_level_msg -> unit Lwt.t 
}

let rec send_all_outgoing_fix engine_state fix_callback =
    match engine_state.Fix_engine_state.outgoing_fix_msg with 
    | None -> Lwt.return engine_state 
    | Some msg -> begin 
        fix_callback msg >>= fun () -> (
        let engine_state = Fix_engine.one_step engine_state in
        send_all_outgoing_fix engine_state fix_callback )
    end
;;


let rec send_messages_list messages engine_state fix_callback =
    let open Fix_engine_state in
    match messages with 
    | [] -> Lwt.return engine_state 
    | hd::tl -> 
        let data = Type_converter.convert_model_to_full_fix hd in
        let msg = IncIntMsg_ApplicationData data in
        let engine_state = { engine_state with incoming_int_msg = Some msg } in
        let engine_state = Fix_engine.one_step engine_state in
        send_all_outgoing_fix engine_state fix_callback >>= fun engine_state ->
        send_messages_list tl engine_state fix_callback
;;


let rec main_loop state =
    let open Fix_engine_state in
    Lwt_mvar.take state.incoming >>= fun incoming ->
    if incoming = Terminate then Lwt.return_unit else
    let engine_state = state.engine_state in
    let engine_state = match incoming with 
        | Internal_Message msg -> { engine_state with incoming_int_msg = Some msg } 
        |      FIX_Message msg -> { engine_state with incoming_fix_msg = Some msg }  
        |                    _ -> engine_state
        in
    let engine_state = Fix_engine.one_step engine_state in
    send_all_outgoing_fix engine_state state.fix_callback >>= fun engine_state ->
    let model_state = state.model_state in
    let model_state = match engine_state.outgoing_int_msg with
        | Some ( OutIntMsg_ApplicationData data ) ->
            let model_message = Type_converter.convert_full_to_model_fix data in
            let model_state = { model_state with State.incoming_msg = Some model_message } in
            Venue.one_step model_state
        | _ -> model_state
        in
    send_messages_list model_state.State.outgoing_msgs engine_state state.fix_callback >>= fun engine_state ->
    let state = { state with engine_state = engine_state; model_state = model_state } in
    main_loop state
;;


let start init_engine init_model fix_callback =
    let state = {
        incoming     = Lwt_mvar.create_empty (); 
        engine_state = init_engine;
        model_state  = init_model;
        fix_callback = fix_callback   
    } in
    ( state.incoming , main_loop state )
;;

 
