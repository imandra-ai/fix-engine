let (>>=) = Lwt.(>>=)


type incoming_event =
    | FIX_Message      of Full_messages.full_top_level_msg
    | Internal_Message of Fix_engine_state.fix_engine_int_inc_msg
    | ModelAction      of Actions.fix_action
    | Terminate

(** Global state contains a fix_engine state and model_state *)
type fix_global_state = {
         incoming : incoming_event Lwt_mvar.t;
     pub_callback : (Model_messages.model_msg -> unit Lwt.t) option;    
     engine_state : Fix_engine_state.fix_engine_state;
      model_state : State.model_state;
     fix_callback : Full_messages.full_top_level_msg -> unit Lwt.t 
}

(** Populates string hashes, associated with the given message *)
let process_strings msg : unit =
    let open Full_messages in
    match msg with
    | ValidMsg msg -> begin
        match msg.full_msg_data with 
        | Full_FIX_App_Msg data ->
            String_constant_factory.all_model_strings data
                |> List.iter String_utils.add_model_string 
        | _ -> ()
        end
    | _ -> ()
;;

(** Running Fix_engine.one_step while there are outgoing messages and 
    calling the fix_callback function for each *)
let rec send_all_outgoing_fix engine_state fix_callback =
    let open Fix_engine_state in
    match engine_state.outgoing_fix_msg with 
    | None -> Lwt.return engine_state 
    | Some msg -> begin 
        let () = process_strings msg in
        fix_callback msg >>= fun () -> 
        let engine_state = { engine_state with outgoing_fix_msg = None } in (* NOTE: I'm cleaning the out slot here *)
        let engine_state = Fix_engine.one_step engine_state in
        send_all_outgoing_fix engine_state fix_callback 
    end
;;

(** Iterating over a list of model messages, pass each into fix_eigine and
    send anything that fix_engine produces *)
let rec send_messages_list messages engine_state fix_callback =
    let open Fix_engine_state in
    match messages with 
    | [] -> Lwt.return engine_state 
    | hd::tl -> (
        let data = Type_converter.convert_model_to_full_fix hd in
        let msg = IncIntMsg_ApplicationData data in
        let engine_state = { engine_state with incoming_int_msg = Some msg } in
        let engine_state = Fix_engine.one_step engine_state in
        send_all_outgoing_fix engine_state fix_callback >>= fun engine_state ->
        send_messages_list tl engine_state fix_callback
    )
;;


let publish_model_message (state , model_message) =
    let open Model_messages in
    match state.pub_callback with None -> Lwt.return_unit | Some f -> 
    match model_message with 
    | FIX_TL_Normal m | FIX_TL_PossibleResend m -> f m
    | _ -> Lwt.return_unit
;;

let rec while_busy_loop state =
    let engine_state = state.engine_state in
    let engine_state = Fix_engine.one_step engine_state in
    (** THEOREM : after one_step we can get either ontgoing internal
        or outgoing FIX message *)
    begin match ( engine_state.outgoing_fix_msg , engine_state.outgoing_int_msg) with
        (** On outgoing FIX message we send it and clean outgoing slot.*)
        | Some msg, None -> begin  
            state.fix_callback msg >>= fun () -> 
            let engine_state = { engine_state with outgoing_fix_msg = None } in
            Lwt.return { state with engine_state = engine_state } 
        end
        | None, Some msg -> begin
            let model_state = state.model_state in
            begin match engine_state.outgoing_int_msg with
                | Some ( OutIntMsg_ApplicationData data ) ->
                    let model_message = Type_converter.convert_full_to_model_fix data in
                    publish_model_message (state, model_message) >>= fun () ->
                    let model_state = { model_state with State.incoming_msg = model_message } in
                    Lwt.return (Venue.one_step model_state)
                | Some ( OutIntMsg_ResendApplicationData data ) ->
                    let model_message = Type_converter.convert_full_to_model_fix data in
                    let model_message = match model_message with
                    | Model_messages.FIX_TL_Normal m -> Model_messages.FIX_TL_PossibleResend m | m -> m in
                    publish_model_message (state, model_message) >>= fun () ->
                    let model_state = { model_state with State.incoming_msg = model_message } in
                    Lwt.return (Venue.one_step model_state)
                | _ -> Lwt.return model_state (** TODO -- see what to do with other messages *)
            end >>= fun model_state ->    
            let engine_state = { engine_state with outgoing_int_msg = None } in
            send_messages_list 
                model_state.State.outgoing_msgs 
                engine_state 
                state.fix_callback
            >>= fun engine_state ->
            Lwt.return { state with 
                engine_state = engine_state ;
                model_state  = { model_state  with State.outgoing_msgs = [] } } 
        end
        | None, None -> Lwt.return { state with engine_state = engine_state }
        |  _ -> Lwt.fail_with "Critical internal error in fix_engine model" 
    end >>= fun state ->
    if Fix_engine_state.engine_state_busy state.engine_state then
        while_busy_loop state
    else Lwt.return state
;;

let rec main_loop state =
    let open Fix_engine_state in
    Lwt_mvar.take state.incoming >>= fun incoming ->
    Lwt_io.flush_all () >>= fun () ->
    match incoming with 
        | Terminate -> Lwt.return_unit
        | Internal_Message msg -> 
            let state = { state with engine_state = { state.engine_state with incoming_int_msg = Some msg } } in
            while_busy_loop state >>= fun state ->
            main_loop state
        | FIX_Message msg ->
            let () = process_strings msg in
            let state = { state with engine_state = { state.engine_state with incoming_fix_msg = Some msg } } in
            while_busy_loop state >>= fun state ->
            main_loop state
        | ModelAction act ->
            let model_state = {state.model_state with State.incoming_action = Some act }  in
            let model_state = Venue.one_step model_state in
            let engine_state = { state.engine_state with outgoing_int_msg = None } in
            send_messages_list 
                model_state.State.outgoing_msgs
                engine_state 
                state.fix_callback >>= fun engine_state ->
            Lwt.return { state with 
                engine_state = engine_state ;
                model_state  = { model_state  with State.outgoing_msgs = [] } } >>= fun state ->
            while_busy_loop state >>= fun state ->
            main_loop state
        | _ -> main_loop state
;;

let start ?pub:(pub_callback=None) init_engine init_model fix_callback =
    let state = {
        incoming     = Lwt_mvar.create_empty (); 
        engine_state = init_engine;
        model_state  = init_model;
        fix_callback = fix_callback;
        pub_callback = pub_callback   
    } in
    ( state.incoming , main_loop state )
;;
