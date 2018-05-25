(* Aesthetic Integration copyright 2018 *)
open Model_messages;;
open State;;

let reject_ExecutionReport_missingfield (m_state : model_state) (reject_text : string)  =
    m_state
;;

let reject_ExecutionReport_invalidfield (m_state : model_state) (msg_data : mod_executionreport_data) (reject_text : string)  =
    m_state
;;

let reject_ExecutionReport_invalid (m_state : model_state) (msg_data : mod_executionreport_data) (reject_text : string)  =
    m_state
;;

let reject_OrderCancelReject_missingfield (m_state : model_state) (reject_text : string)  =
    m_state
;;

let reject_OrderCancelReject_invalidfield (m_state : model_state) (msg_data : mod_ordercancelreject_data) (reject_text : string)  =
    m_state
;;

let reject_OrderCancelReject_invalid (m_state : model_state) (msg_data : mod_ordercancelreject_data) (reject_text : string)  =
    m_state
;;

let reject_OrderMassCancelReport_missingfield (m_state : model_state) (reject_text : string)  =
    m_state
;;

let reject_OrderMassCancelReport_invalidfield (m_state : model_state) (msg_data : mod_ordermasscancelreport_data) (reject_text : string)  =
    m_state
;;

let reject_OrderMassCancelReport_invalid (m_state : model_state) (msg_data : mod_ordermasscancelreport_data) (reject_text : string)  =
    m_state
;;

let reject_field_missing (m_state : model_state) (missing_info : field_missing_data)  =
    (match (missing_info.field_missing_data_msg,missing_info.field_missing_data_field) with
        | (_,_) -> m_state
    )
;;
