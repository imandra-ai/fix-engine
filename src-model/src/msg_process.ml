 (* @meta[imandra_ignore] on @end *)
open Model_messages;;
open Msg_check_fields;;
open Msg_check_types;;
open Msg_check_validate;;
open Msg_reject;;
open Msg_receive;;
open Msg_defaults;;
open State;;
open Model_tags;;
 (* @meta[imandra_ignore] off @end *)

let process_NewOrderSingle ( m_state , msg_data : model_state * mod_newordersingle_data ) =
    let field_check = check_fields_NewOrderSingle (msg_data,m_state) in
    if field_check.is_invalid then
        (reject_NewOrderSingle_invalidfield (m_state,msg_data,field_check.field_text))
    else
        let custom_reject = check_validate_NewOrderSingle (msg_data,m_state) in
        if custom_reject.validate_invalid then
            (reject_NewOrderSingle_invalid (m_state,msg_data,custom_reject.validate_text))
        else
            let msg_data = assign_defaults_NewOrderSingle (msg_data) in
            receive_message_NewOrderSingle (m_state,msg_data)
;;

let process_msg ( m_state , msg : model_state * model_top_level_msg ) =
    (match msg with
        | FIX_TL_Req_Field_Missing d -> (reject_field_missing (m_state,d))
        | FIX_TL_Normal d -> ((match d with
            | FIX_Msg_NewOrderSingle m_data -> (process_NewOrderSingle (m_state,m_data))
            | _ -> m_state
        )
        )
        | FIX_TL_PossibleResend d -> m_state
        | FIX_TL_None -> m_state
    )
;;
