(* Aesthetic Integration copyright 2017 *)
(* @meta[imandra_ignore] on @end *)
open Base_types;;
open Numeric;;
open State;;
open Model_app_enums;;
open Model_messages;;
(* @meta[imandra_ignore] off @end *)

let receive_message_OrderSingle ( m_state , msg_data : model_state * mod_ordersingle_data ) =
    let msg_data_inner = {
        f_ExecutionReport_CumQty = float_Create ({
            fix_float_whole = 0;
            fix_float_fraction = 0
        },1);
        f_ExecutionReport_Side = msg_data.f_OrderSingle_Side;
        f_ExecutionReport_AvgPx = float_Create ({
            fix_float_whole = 0;
            fix_float_fraction = 0
        },1);
        f_ExecutionReport_OrdStatus = MOD_FIX_OrdStatus_New;
        f_ExecutionReport_OrderID = msg_data.f_OrderSingle_ClOrdID;
        f_ExecutionReport_ExecTransType = MOD_FIX_ExecTransType_New;
        f_ExecutionReport_Text = None;
        f_ExecutionReport_Symbol = Model_string 2;
        f_ExecutionReport_ExecType = MOD_FIX_ExecType_Calculated;
        f_ExecutionReport_ClOrdID = msg_data.f_OrderSingle_ClOrdID;
        f_ExecutionReport_LeavesQty = float_Create ({
            fix_float_whole = 0;
            fix_float_fraction = 0
        },1);
        f_ExecutionReport_ExecID = Model_string 1
    } in
    let m_state = send_msg (FIX_Msg_ExecutionReport msg_data_inner,m_state) in
    m_state
;;
