type fix_global_state 

type incoming_event =
    | FIX_Message      of Full_messages.full_top_level_msg
    | Internal_Message of Fix_engine_state.fix_engine_int_inc_msg
    | Terminate


val start : Fix_engine_state.fix_engine_state ->
            State.model_state ->
            ( Full_messages.full_top_level_msg -> unit Lwt.t ) ->
            ( incoming_event Lwt_mvar.t * unit Lwt.t)
