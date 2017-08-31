(* Aesthetic Integration copyright 2017 *)
(* @meta[imandra_ignore] on @end *)
open Model_messages;;
open Actions;;
(* @meta[imandra_ignore] off @end *)

type model_state = {
    incoming_action : fix_action option;
    outgoing_msgs : model_msg list;
    incoming_msg : model_top_level_msg
}
;;

let init_model_state = {
    incoming_action = None;
    outgoing_msgs = [];
    incoming_msg = FIX_TL_None
};;

let send_msg ( msg , m_state : model_msg * model_state ) =
    { m_state with
        outgoing_msgs = msg :: m_state.outgoing_msgs
    }
;;
