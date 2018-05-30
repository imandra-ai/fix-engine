(* Aesthetic Integration copyright 2018 *)
open State;;
open Model_app_enums;;
open Numeric;;
open Model_messages;;

let receive_message_NewOrderSingle ( m_state , msg_data : model_state * mod_newordersingle_data ) =
    let msg_data_inner = {
        f_ExecutionReport_LeavesQty = Float_6 0;
        f_ExecutionReport_Side = msg_data.f_NewOrderSingle_Side;
        f_ExecutionReport_ExecType = MOD_FIX_ExecType_Calculated;
        f_ExecutionReport_ClOrdID = msg_data.f_NewOrderSingle_ClOrdID;
        f_ExecutionReport_Instrument_Symbol = msg_data.f_NewOrderSingle_Instrument_Symbol;
        f_ExecutionReport_OrderID = msg_data.f_NewOrderSingle_ClOrdID;
        f_ExecutionReport_Text = None;
        f_ExecutionReport_ExecID = "Test";
        f_ExecutionReport_OrdStatus = MOD_FIX_OrdStatus_New;
        f_ExecutionReport_AvgPx = Float_6 0;
        f_ExecutionReport_CumQty = Float_6 0
    } in
    let m_state = send_msg (FIX_Msg_ExecutionReport msg_data_inner,m_state) in
    m_state
;;
