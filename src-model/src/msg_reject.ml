(* Aesthetic Integration copyright 2017 *)
(* @meta[imandra_ignore] on @end *)
open State;;
open Base_types;;
open Model_app_enums;;
open Numeric;;
open Model_tags;;
open Model_messages;;
(* @meta[imandra_ignore] off @end *)

let reject_NewOrderSingle_missingfield ( m_state , reject_text : model_state * fix_string ) =
    let msg_data_inner = {
        f_ExecutionReport_LeavesQty = Float_4 0;
        f_ExecutionReport_ExecID = Model_string 1;
        f_ExecutionReport_ExecType = MOD_FIX_ExecType_Calculated;
        f_ExecutionReport_OrderID = Model_string 2;
        f_ExecutionReport_OrdStatus = MOD_FIX_OrdStatus_New;
        f_ExecutionReport_Text = Some reject_text;
        f_ExecutionReport_AvgPx = Float_4 0;
        f_ExecutionReport_Side = MOD_FIX_Side_Buy;
        f_ExecutionReport_Instrument_Symbol = Model_string 2;
        f_ExecutionReport_CumQty = Float_4 0;
        f_ExecutionReport_ClOrdID = Model_string 2
    } in
    let m_state = send_msg (FIX_Msg_ExecutionReport msg_data_inner,m_state) in
    m_state
;;

let reject_NewOrderSingle_invalidfield ( m_state , msg_data , reject_text : model_state * mod_newordersingle_data * fix_string ) =
    let msg_data_inner = {
        f_ExecutionReport_OrderID = Model_string 2;
        f_ExecutionReport_Side = MOD_FIX_Side_Buy;
        f_ExecutionReport_Text = Some reject_text;
        f_ExecutionReport_AvgPx = Float_4 0;
        f_ExecutionReport_LeavesQty = Float_4 0;
        f_ExecutionReport_ExecType = MOD_FIX_ExecType_Calculated;
        f_ExecutionReport_OrdStatus = MOD_FIX_OrdStatus_New;
        f_ExecutionReport_ClOrdID = Model_string 2;
        f_ExecutionReport_CumQty = Float_4 0;
        f_ExecutionReport_Instrument_Symbol = Model_string 2;
        f_ExecutionReport_ExecID = Model_string 1
    } in
    let m_state = send_msg (FIX_Msg_ExecutionReport msg_data_inner,m_state) in
    m_state
;;

let reject_NewOrderSingle_invalid ( m_state , msg_data , reject_text : model_state * mod_newordersingle_data * fix_string ) =
    let msg_data_inner = {
        f_ExecutionReport_LeavesQty = Float_4 0;
        f_ExecutionReport_Side = MOD_FIX_Side_Buy;
        f_ExecutionReport_AvgPx = Float_4 0;
        f_ExecutionReport_OrderID = Model_string 2;
        f_ExecutionReport_ExecID = Model_string 1;
        f_ExecutionReport_OrdStatus = MOD_FIX_OrdStatus_New;
        f_ExecutionReport_CumQty = Float_4 0;
        f_ExecutionReport_Instrument_Symbol = Model_string 2;
        f_ExecutionReport_ExecType = MOD_FIX_ExecType_Calculated;
        f_ExecutionReport_Text = Some reject_text;
        f_ExecutionReport_ClOrdID = Model_string 2
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
