(* @meta[imandra_ignore] on @end *)
open Base_types;;
open Datetime;;
open Numeric;;
open Model_messages;;
open Actions;;
open State;;
open Model_app_enums;;
(* @meta[imandra_ignore] off @end *)

let receive_action_x ( m_state , action_data : model_state * m_action_fix_x ) =
    m_state
;;

let receive_action ( m_state , action : model_state * fix_action ) =
    (match action with
        | FIX_Action_x d -> (receive_action_x (m_state,d))
    )
;;
