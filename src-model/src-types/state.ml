(* @meta[imandra_ignore] on @end *)
open Base_types;;
open Datetime;;
open Numeric;;
open Model_tags;;
open Model_messages;;
open Actions;;
open Model_app_enums;;
(* @meta[imandra_ignore] off @end *)

type model_state = {
    incoming_action : fix_action option;
    outgoing_msgs : model_msg list;
    incoming_msg : model_top_level_msg option
}
;;

let init_model_state = {
    incoming_action = None;
    outgoing_msgs = [];
    incoming_msg = None
};;

let send_msg ( msg , m_state : model_msg * model_state ) =
    { m_state with
        outgoing_msgs = msg :: m_state.outgoing_msgs
    }
;;
