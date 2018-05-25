(* Aesthetic Integration copyright 2018 *)
open Model_messages;;
open Msg_check_types;;
open State;;

let check_validate_ExecutionReport (msg_data : mod_executionreport_data) (m_state : model_state)  =
    no_invalid_validates
;;

let check_validate_OrderCancelReject (msg_data : mod_ordercancelreject_data) (m_state : model_state)  =
    no_invalid_validates
;;

let check_validate_OrderMassCancelReport (msg_data : mod_ordermasscancelreport_data) (m_state : model_state)  =
    no_invalid_validates
;;
