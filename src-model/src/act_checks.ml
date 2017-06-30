(* @meta[imandra_ignore] on @end *)
open Base_types;;
open Datetime;;
open Numeric;;
open Actions;;
open State;;
open Model_app_enums;;
(* @meta[imandra_ignore] off @end *)

let is_valid_action_x ( action_data : m_action_fix_x ) =
    true
;;

let is_action_valid ( m_state , action : model_state * fix_action ) =
    (match action with
        | FIX_Action_x d -> (is_valid_action_x (d))
    )
;;
