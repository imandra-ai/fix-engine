(* Aesthetic Integration copyright 2017 *)
(* @meta[imandra_ignore] on @end *)
open State;;
open Base_types;;
open Model_app_enums;;
open Numeric;;
open Model_messages;;
(* @meta[imandra_ignore] off @end *)

let receive_message_NewOrderSingle ( m_state , msg_data : model_state * mod_newordersingle_data ) =
    let msg_data_inner = {
        f_ExecutionReport_LeavesQty = float_Create (0,1);
        f_ExecutionReport_Side = msg_data.f_NewOrderSingle_Side;
        f_ExecutionReport_ExecType = MOD_FIX_ExecType_Calculated;
        f_ExecutionReport_ClOrdID = msg_data.f_NewOrderSingle_ClOrdID;
        f_ExecutionReport_Instrument_Symbol = msg_data.f_NewOrderSingle_Instrument_Symbol;
        f_ExecutionReport_OrderID = msg_data.f_NewOrderSingle_ClOrdID;
        f_ExecutionReport_Text = None;
        f_ExecutionReport_ExecID = Model_string 1;
        f_ExecutionReport_OrdStatus = MOD_FIX_OrdStatus_New;
        f_ExecutionReport_AvgPx = float_Create (0,1);
        f_ExecutionReport_CumQty = float_Create (0,1)
    } in
    let m_state = send_msg (FIX_Msg_ExecutionReport msg_data_inner,m_state) in
    m_state
;;
