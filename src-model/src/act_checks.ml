(* Aesthetic Integration copyright 2018 *)
open Actions;;
open State;;

let is_valid_action_neworder (action_data : m_action_fix_neworder)  =
    true
;;

let is_valid_action_cancelreplace (action_data : m_action_fix_cancelreplace)  =
    true
;;

let is_valid_action_cancel (action_data : m_action_fix_cancel)  =
    true
;;

let is_valid_action_masscancel (action_data : m_action_fix_masscancel)  =
    true
;;

let is_action_valid (action : fix_action) (m_state : model_state)  =
    (match action with
        | FIX_Action_neworder d -> (is_valid_action_neworder d)
        | FIX_Action_cancelreplace d -> (is_valid_action_cancelreplace d)
        | FIX_Action_cancel d -> (is_valid_action_cancel d)
        | FIX_Action_masscancel d -> (is_valid_action_masscancel d)
    )
;;
