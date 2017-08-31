(* Aesthetic Integration copyright 2017 *)
(* @meta[imandra_ignore] on @end *)
open Model_tags;;
open Base_types;;
open Numeric;;
open State;;
open Model_app_enums;;
open Model_messages;;
(* @meta[imandra_ignore] off @end *)

let reject_OrderSingle_missingfield ( m_state , reject_text : model_state * fix_string ) =
    let msg_data_inner = {
        f_ExecutionReport_Text = Some reject_text;
        f_ExecutionReport_ExecTransType = MOD_FIX_ExecTransType_New;
        f_ExecutionReport_OrderID = Model_string 2;
        f_ExecutionReport_ExecType = MOD_FIX_ExecType_Calculated;
        f_ExecutionReport_CumQty = float_Create ({
            fix_float_whole = 0;
            fix_float_fraction = 0
        },1);
        f_ExecutionReport_Side = MOD_FIX_Side_Buy;
        f_ExecutionReport_Symbol = Model_string 2;
        f_ExecutionReport_LeavesQty = float_Create ({
            fix_float_whole = 0;
            fix_float_fraction = 0
        },1);
        f_ExecutionReport_AvgPx = float_Create ({
            fix_float_whole = 0;
            fix_float_fraction = 0
        },1);
        f_ExecutionReport_ExecID = Model_string 1;
        f_ExecutionReport_OrdStatus = MOD_FIX_OrdStatus_New;
        f_ExecutionReport_ClOrdID = Model_string 2
    } in
    let m_state = send_msg (FIX_Msg_ExecutionReport msg_data_inner,m_state) in
    m_state
;;

let reject_OrderSingle_invalidfield ( m_state , msg_data , reject_text : model_state * mod_ordersingle_data * fix_string ) =
    let msg_data_inner = {
        f_ExecutionReport_Text = Some reject_text;
        f_ExecutionReport_AvgPx = float_Create ({
            fix_float_whole = 0;
            fix_float_fraction = 0
        },1);
        f_ExecutionReport_ExecType = MOD_FIX_ExecType_Calculated;
        f_ExecutionReport_Symbol = Model_string 2;
        f_ExecutionReport_Side = MOD_FIX_Side_Buy;
        f_ExecutionReport_OrdStatus = MOD_FIX_OrdStatus_New;
        f_ExecutionReport_ExecID = Model_string 1;
        f_ExecutionReport_ExecTransType = MOD_FIX_ExecTransType_New;
        f_ExecutionReport_OrderID = Model_string 2;
        f_ExecutionReport_LeavesQty = float_Create ({
            fix_float_whole = 0;
            fix_float_fraction = 0
        },1);
        f_ExecutionReport_ClOrdID = Model_string 2;
        f_ExecutionReport_CumQty = float_Create ({
            fix_float_whole = 0;
            fix_float_fraction = 0
        },1)
    } in
    let m_state = send_msg (FIX_Msg_ExecutionReport msg_data_inner,m_state) in
    m_state
;;

let reject_OrderSingle_invalid ( m_state , msg_data , reject_text : model_state * mod_ordersingle_data * fix_string ) =
    let msg_data_inner = {
        f_ExecutionReport_Symbol = Model_string 2;
        f_ExecutionReport_Text = Some reject_text;
        f_ExecutionReport_ExecType = MOD_FIX_ExecType_Calculated;
        f_ExecutionReport_OrderID = Model_string 2;
        f_ExecutionReport_ExecTransType = MOD_FIX_ExecTransType_New;
        f_ExecutionReport_CumQty = float_Create ({
            fix_float_whole = 0;
            fix_float_fraction = 0
        },1);
        f_ExecutionReport_OrdStatus = MOD_FIX_OrdStatus_New;
        f_ExecutionReport_LeavesQty = float_Create ({
            fix_float_whole = 0;
            fix_float_fraction = 0
        },1);
        f_ExecutionReport_AvgPx = float_Create ({
            fix_float_whole = 0;
            fix_float_fraction = 0
        },1);
        f_ExecutionReport_ClOrdID = Model_string 2;
        f_ExecutionReport_Side = MOD_FIX_Side_Buy;
        f_ExecutionReport_ExecID = Model_string 1
    } in
    let m_state = send_msg (FIX_Msg_ExecutionReport msg_data_inner,m_state) in
    m_state
;;

let reject_field_missing ( m_state , missing_info : model_state * field_missing_data ) =
    (match (missing_info.field_missing_data_msg,missing_info.field_missing_data_field) with
        | (M_Msg_OrderSingle_Tag,M_Field_ClOrdID_Tag) -> (reject_OrderSingle_missingfield (m_state,Model_string 3))
        | (M_Msg_OrderSingle_Tag,M_Field_Symbol_Tag) -> (reject_OrderSingle_missingfield (m_state,Model_string 4))
        | (M_Msg_OrderSingle_Tag,M_Field_Side_Tag) -> (reject_OrderSingle_missingfield (m_state,Model_string 5))
        | (M_Msg_OrderSingle_Tag,M_Field_TransactTime_Tag) -> (reject_OrderSingle_missingfield (m_state,Model_string 6))
        | (M_Msg_OrderSingle_Tag,M_Field_OrdType_Tag) -> (reject_OrderSingle_missingfield (m_state,Model_string 7))
        | (M_Msg_OrderSingle_Tag,M_Field_HandlInst_Tag) -> (reject_OrderSingle_missingfield (m_state,Model_string 8))
        | (_,_) -> m_state
    )
;;
