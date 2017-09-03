(* Aesthetic Integration copyright 2017 *)
(* @meta[imandra_ignore] on @end *)
open State;;
open Actions;;
open Act_checks;;
(* @meta[imandra_ignore] off @end *)

let receive_action_x ( m_state , action_data : model_state * m_action_fix_x ) =
    m_state
;;

let receive_action ( m_state , action : model_state * fix_action ) =
    if (is_action_valid (m_state,action)) then
        ((match action with
            | FIX_Action_x d -> (receive_action_x (m_state,d))
        )
        )
    else
        m_state
;;
