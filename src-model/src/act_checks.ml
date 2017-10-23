(* Aesthetic Integration copyright 2017 *)
(* @meta[imandra_ignore] on @end *)
 open Actions;;
 open State;;
(* @meta[imandra_ignore] off @end *)

let is_valid_action_x ( action_data : m_action_fix_x ) =
    true
;;

let is_action_valid ( action , m_state : fix_action * model_state ) =
    (match action with
        | FIX_Action_x d -> (is_valid_action_x (d))
    )
;;
