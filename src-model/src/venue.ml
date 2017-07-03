 (* @meta[imandra_ignore] on @end *)
open State;;
open Act_process;;
open Msg_process;;
 (* @meta[imandra_ignore] off @end *)

let one_step ( m_state : model_state ) =
    (match m_state.incoming_action with
        | Some act -> let s' = receive_action (m_state,act) in
        { s' with
            incoming_action = None
        }
        | None -> ((match m_state.incoming_msg with
            | Some msg -> let s' = process_msg (m_state,msg) in
            { s' with
                incoming_msg = None
            }
            | None -> m_state
        )
        )
    )
;;
