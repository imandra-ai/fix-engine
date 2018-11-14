type config = 
  { comp_id        : string
  ; host_id        : string option
  ; on_behalf_id   : string option
  ; target_id      : string
  ; timer          : float
  ; reset_seq      : bool
  ; pub_callback   : (Model_messages.model_msg -> unit Lwt.t) option  
  }

val get_current_utctimestamp : unit -> TimeDefaults.fix_utctimestamp
val get_last_received_utctimestamp : unit -> TimeDefaults.fix_utctimestamp
val get_last_received_sendingtime : unit -> TimeDefaults.fix_utctimestamp

type t 

val create : config -> (Lwt_io.input_channel * Lwt_io.output_channel ) -> t

val get_heartbeat_thread : t -> unit Lwt.t
val get_fix_thread       : t -> unit Lwt.t
val get_input_mailbox    : t -> Fix_global_state.incoming_event Lwt_mvar.t

val create_session_msg   : t -> Fix_engine_state.fix_engine_int_inc_msg
