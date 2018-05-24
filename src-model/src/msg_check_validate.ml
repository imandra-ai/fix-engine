(* Aesthetic Integration copyright 2018 *)
open Msg_check_types;;
open Model_messages;;
open State;;

let check_validate_ExecutionReport ( msg_data , m_state : mod_executionreport_data * model_state ) =
    no_invalid_validates
;;

let check_validate_NewOrderSingle ( msg_data , m_state : mod_newordersingle_data * model_state ) =
    no_invalid_validates
;;
