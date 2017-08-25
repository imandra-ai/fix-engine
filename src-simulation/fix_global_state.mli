(** The Fix_global_state esnures  correct message passing between the fix-engine model and the fix-venue-model *)


type fix_global_state 

(** Three types of incoming messages to the Fix_global_state
 - an incomming FIX message
 - an incoming fix-engine event
 - terminate command *)
type incoming_event =
    | FIX_Message      of Full_messages.full_top_level_msg
    | Internal_Message of Fix_engine_state.fix_engine_int_inc_msg
    | Terminate

(** Starts the Fix_global_state loop, given initial values for fix-engine and
    fix-venue-model states, a FIX message sending callback function and a mailbox
    variable for incoming event. *)
val start : Fix_engine_state.fix_engine_state ->
            State.model_state ->
            ( Full_messages.full_top_level_msg -> unit Lwt.t ) ->
            ( incoming_event Lwt_mvar.t * unit Lwt.t)
