(* Aesthetic Integration copyright 2017 *)
(* @meta[imandra_ignore] on @end *)
 open Act_checks;;
 open Actions;;
 open State;;
(* @meta[imandra_ignore] off @end *)

let receive_action_x ( m_state , action_data : model_state * m_action_fix_x ) =
    m_state
;;

let receive_action ( m_state , action : model_state * fix_action ) =
    if (is_action_valid (action,m_state)) then
        ((match action with
            | FIX_Action_x d -> (receive_action_x (m_state,d))
        )
        )
    else
        m_state
;;
