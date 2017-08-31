(* Aesthetic Integration copyright 2017 *)
(* @meta[imandra_ignore] on @end *)
open Msg_receive;;
open State;;
open Msg_defaults;;
open Model_messages;;
open Msg_reject;;
open Msg_check_types;;
open Msg_check_fields;;
open Msg_check_validate;;
(* @meta[imandra_ignore] off @end *)

let process_OrderSingle ( m_state , msg_data : model_state * mod_ordersingle_data ) =
    let msg_data = assign_defaults_OrderSingle (msg_data) in
    let field_check = check_fields_OrderSingle (msg_data,m_state) in
    if field_check.is_invalid then
        (reject_OrderSingle_invalidfield (m_state,msg_data,field_check.field_text))
    else
        let custom_reject = check_validate_OrderSingle (msg_data,m_state) in
        if custom_reject.validate_invalid then
            (reject_OrderSingle_invalid (m_state,msg_data,custom_reject.validate_text))
        else
            (receive_message_OrderSingle (m_state,msg_data))
;;

let process_msg ( m_state , msg : model_state * model_top_level_msg ) =
    (match msg with
        | FIX_TL_Req_Field_Missing d -> (reject_field_missing (m_state,d))
        | FIX_TL_Normal d -> ((match d with
            | FIX_Msg_OrderSingle m_data -> (process_OrderSingle (m_state,m_data))
            | _ -> m_state
        )
        )
        | FIX_TL_PossibleResend d -> m_state
        | FIX_TL_None -> m_state
    )
;;
