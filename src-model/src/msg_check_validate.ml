(* Aesthetic Integration copyright 2017 *)
(* @meta[imandra_ignore] on @end *)
open State;;
open Msg_check_types;;
open Model_messages;;
(* @meta[imandra_ignore] off @end *)

let check_validate_ExecutionReport ( msg_data , m_state : mod_executionreport_data * model_state ) =
    no_invalid_validates
;;

let check_validate_OrderSingle ( msg_data , m_state : mod_ordersingle_data * model_state ) =
    no_invalid_validates
;;
