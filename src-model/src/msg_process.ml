(* Aesthetic Integration copyright 2018 *)
open Model_messages;;
open Msg_check_fields;;
open Msg_check_types;;
open Msg_check_validate;;
open Msg_defaults;;
open Msg_receive;;
open Msg_reject;;
open State;;

let process_ExecutionReport (m_state : model_state) (msg_data : mod_executionreport_data)  =
    let msg_data = assign_defaults_ExecutionReport msg_data in
    let field_check = check_fields_ExecutionReport msg_data m_state in
    if field_check.is_invalid then
        (reject_ExecutionReport_invalidfield m_state msg_data field_check.field_text)
    else
        let custom_reject = check_validate_ExecutionReport msg_data m_state in
        if custom_reject.validate_invalid then
            (reject_ExecutionReport_invalid m_state msg_data custom_reject.validate_text)
        else
            (receive_message_ExecutionReport m_state msg_data)
;;

let process_OrderCancelReject (m_state : model_state) (msg_data : mod_ordercancelreject_data)  =
    let msg_data = assign_defaults_OrderCancelReject msg_data in
    let field_check = check_fields_OrderCancelReject msg_data m_state in
    if field_check.is_invalid then
        (reject_OrderCancelReject_invalidfield m_state msg_data field_check.field_text)
    else
        let custom_reject = check_validate_OrderCancelReject msg_data m_state in
        if custom_reject.validate_invalid then
            (reject_OrderCancelReject_invalid m_state msg_data custom_reject.validate_text)
        else
            (receive_message_OrderCancelReject m_state msg_data)
;;

let process_OrderMassCancelReport (m_state : model_state) (msg_data : mod_ordermasscancelreport_data)  =
    let msg_data = assign_defaults_OrderMassCancelReport msg_data in
    let field_check = check_fields_OrderMassCancelReport msg_data m_state in
    if field_check.is_invalid then
        (reject_OrderMassCancelReport_invalidfield m_state msg_data field_check.field_text)
    else
        let custom_reject = check_validate_OrderMassCancelReport msg_data m_state in
        if custom_reject.validate_invalid then
            (reject_OrderMassCancelReport_invalid m_state msg_data custom_reject.validate_text)
        else
            (receive_message_OrderMassCancelReport m_state msg_data)
;;

let process_msg (m_state : model_state) (msg : model_top_level_msg)  =
    (match msg with
        | FIX_TL_Req_Field_Missing d -> (reject_field_missing m_state d)
        | FIX_TL_Normal d -> ((match d with
            | FIX_Msg_ExecutionReport m_data -> (process_ExecutionReport m_state m_data)
            | FIX_Msg_OrderCancelReject m_data -> (process_OrderCancelReject m_state m_data)
            | FIX_Msg_OrderMassCancelReport m_data -> (process_OrderMassCancelReport m_state m_data)
            | _ -> m_state
        )
        )
        | FIX_TL_PossibleResend d -> m_state
        | FIX_TL_None -> m_state
    )
;;

let msg_ExecutionReport_valid (msg_data : mod_executionreport_data) (m_state : model_state)  =
    let fields_result = check_fields_ExecutionReport msg_data m_state in
    let validate_result = check_validate_ExecutionReport msg_data m_state in
    (&&) (not fields_result.is_invalid) (not validate_result.validate_invalid)
;;

let msg_OrderCancelReject_valid (msg_data : mod_ordercancelreject_data) (m_state : model_state)  =
    let fields_result = check_fields_OrderCancelReject msg_data m_state in
    let validate_result = check_validate_OrderCancelReject msg_data m_state in
    (&&) (not fields_result.is_invalid) (not validate_result.validate_invalid)
;;

let msg_OrderMassCancelReport_valid (msg_data : mod_ordermasscancelreport_data) (m_state : model_state)  =
    let fields_result = check_fields_OrderMassCancelReport msg_data m_state in
    let validate_result = check_validate_OrderMassCancelReport msg_data m_state in
    (&&) (not fields_result.is_invalid) (not validate_result.validate_invalid)
;;

let is_message_valid (msg : model_msg) (m_state : model_state)  =
    (match msg with
        | FIX_Msg_ExecutionReport d -> (msg_ExecutionReport_valid d m_state)
        | FIX_Msg_OrderCancelReject d -> (msg_OrderCancelReject_valid d m_state)
        | FIX_Msg_OrderMassCancelReport d -> (msg_OrderMassCancelReport_valid d m_state)
        | _ -> true
    )
;;
