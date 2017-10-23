(* Aesthetic Integration copyright 2017 *)
(* @meta[imandra_ignore] on @end *)
 open Base_types;;
 open Model_app_enums;;
 open Model_messages;;
 open Model_tags;;
 open Numeric;;
 open State;;
(* @meta[imandra_ignore] off @end *)

let reject_NewOrderSingle_missingfield ( m_state , reject_text : model_state * fix_string ) =
    let msg_data_inner = {
        mod_f_ExecutionReport_AvgPx = float_Create (00,1);
        mod_f_ExecutionReport_ClOrdID = Model_string 2;
        mod_f_ExecutionReport_CumQty = float_Create (00,1);
        mod_f_ExecutionReport_ExecID = Model_string 1;
        mod_f_ExecutionReport_ExecType = MOD_FIX_ExecType_Calculated;
        mod_f_ExecutionReport_Instrument_Symbol = Model_string 2;
        mod_f_ExecutionReport_LeavesQty = float_Create (00,1);
        mod_f_ExecutionReport_OrdStatus = MOD_FIX_OrdStatus_New;
        mod_f_ExecutionReport_OrderID = Model_string 2;
        mod_f_ExecutionReport_Side = MOD_FIX_Side_Buy;
        mod_f_ExecutionReport_Text = Some reject_text
    } in
    let m_state = send_msg (FIX_Msg_ExecutionReport msg_data_inner,m_state) in
    m_state
;;

let reject_NewOrderSingle_invalidfield ( m_state , msg_data , reject_text : model_state * mod_newordersingle_data * fix_string ) =
    let msg_data_inner = {
        mod_f_ExecutionReport_AvgPx = float_Create (00,1);
        mod_f_ExecutionReport_ClOrdID = Model_string 2;
        mod_f_ExecutionReport_CumQty = float_Create (00,1);
        mod_f_ExecutionReport_ExecID = Model_string 1;
        mod_f_ExecutionReport_ExecType = MOD_FIX_ExecType_Calculated;
        mod_f_ExecutionReport_Instrument_Symbol = Model_string 2;
        mod_f_ExecutionReport_LeavesQty = float_Create (00,1);
        mod_f_ExecutionReport_OrdStatus = MOD_FIX_OrdStatus_New;
        mod_f_ExecutionReport_OrderID = Model_string 2;
        mod_f_ExecutionReport_Side = MOD_FIX_Side_Buy;
        mod_f_ExecutionReport_Text = Some reject_text
    } in
    let m_state = send_msg (FIX_Msg_ExecutionReport msg_data_inner,m_state) in
    m_state
;;

let reject_NewOrderSingle_invalid ( m_state , msg_data , reject_text : model_state * mod_newordersingle_data * fix_string ) =
    let msg_data_inner = {
        mod_f_ExecutionReport_AvgPx = float_Create (00,1);
        mod_f_ExecutionReport_ClOrdID = Model_string 2;
        mod_f_ExecutionReport_CumQty = float_Create (00,1);
        mod_f_ExecutionReport_ExecID = Model_string 1;
        mod_f_ExecutionReport_ExecType = MOD_FIX_ExecType_Calculated;
        mod_f_ExecutionReport_Instrument_Symbol = Model_string 2;
        mod_f_ExecutionReport_LeavesQty = float_Create (00,1);
        mod_f_ExecutionReport_OrdStatus = MOD_FIX_OrdStatus_New;
        mod_f_ExecutionReport_OrderID = Model_string 2;
        mod_f_ExecutionReport_Side = MOD_FIX_Side_Buy;
        mod_f_ExecutionReport_Text = Some reject_text
    } in
    let m_state = send_msg (FIX_Msg_ExecutionReport msg_data_inner,m_state) in
    m_state
;;

let reject_field_missing ( m_state , missing_info : model_state * field_missing_data ) =
    (match (missing_info.field_missing_data_msg,missing_info.field_missing_data_field) with
        | (M_Msg_NewOrderSingle_Tag,M_Field_ClOrdID_Tag) -> (reject_NewOrderSingle_missingfield (m_state,Model_string 3))
        | (M_Msg_NewOrderSingle_Tag,M_Field_Side_Tag) -> (reject_NewOrderSingle_missingfield (m_state,Model_string 4))
        | (M_Msg_NewOrderSingle_Tag,M_Field_TransactTime_Tag) -> (reject_NewOrderSingle_missingfield (m_state,Model_string 5))
        | (M_Msg_NewOrderSingle_Tag,M_Field_OrdType_Tag) -> (reject_NewOrderSingle_missingfield (m_state,Model_string 6))
        | (M_Msg_NewOrderSingle_Tag,M_Field_Symbol_Tag) -> (reject_NewOrderSingle_missingfield (m_state,Model_string 7))
        | (_,_) -> m_state
    )
;;
