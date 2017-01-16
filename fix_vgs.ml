(** 

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    Implementation of the FIX 4.4 protocol. Verification goals.

    fix_vgs.ml
*)

:load fix_data_dictionary.ml
:load imarkets.ml
:load fix_engine.ml


(** When in ActiveSession (normal mode) and receiving a non grabled and non session-level rejected message
    and the application is down. Such message would be sent back with a Business Reject. *)
verify app_down_get_biz_reject ( fengine : fix_engine_state ) =
    ( (match fengine.incoming_fix_msg with 
        | Some x ->  (  not (x.reject_flags.garbled) && 
                        not (fix_is_msg_session_invalid (x)) )
        | None -> false ) && 
        not( fengine.fe_application_up ) && 
        fengine.fe_curr_mode = ActiveSession &&
        ( match fengine.incoming_int_msg with 
            | None -> true
            | Some _ -> false)
        )
         ==> (
        match (one_step (fengine)).outgoing_fix_msg with 
        | None -> false
        | Some x ->
            match x.msg_data with 
            | FIX_business_reject _ -> true
            | _ -> false
    )
;;