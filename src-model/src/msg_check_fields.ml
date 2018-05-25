(* Aesthetic Integration copyright 2018 *)
open Model_messages;;
open Msg_check_types;;
open State;;

let check_fields_ExecutionReport (msg_data : mod_executionreport_data) (m_state : model_state)  =
    fields_are_good
;;

let check_fields_OrderCancelReject (msg_data : mod_ordercancelreject_data) (m_state : model_state)  =
    fields_are_good
;;

let check_fields_OrderMassCancelReport (msg_data : mod_ordermasscancelreport_data) (m_state : model_state)  =
    fields_are_good
;;
