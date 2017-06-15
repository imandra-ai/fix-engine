(* @meta[imandra_ignore] on @end *)
open Base_types;;
open Numeric;;
open Datetime;;
open Model_tags;;
open State;;
open Imandra_utils;;
open Model_messages;;
open Msg_check_types;;
open Model_app_enums;;
(* @meta[imandra_ignore] off @end *)

let check_field_f_ExecutionReport_OrderID ( msg_data : mod_executionreport_data ) =
    fields_are_good
;;

let check_field_f_ExecutionReport_ExecID ( msg_data : mod_executionreport_data ) =
    fields_are_good
;;

let check_field_f_ExecutionReport_ExecType ( msg_data : mod_executionreport_data ) =
    fields_are_good
;;

let check_field_f_ExecutionReport_AvgPx ( msg_data : mod_executionreport_data ) =
    fields_are_good
;;

let check_field_f_ExecutionReport_Side ( msg_data : mod_executionreport_data ) =
    fields_are_good
;;

let check_field_f_ExecutionReport_LeavesQty ( msg_data : mod_executionreport_data ) =
    fields_are_good
;;

let check_field_f_ExecutionReport_CumQty ( msg_data : mod_executionreport_data ) =
    fields_are_good
;;

let check_field_f_ExecutionReport_OrdStatus ( msg_data : mod_executionreport_data ) =
    fields_are_good
;;

let check_field_f_ExecutionReport_Instrument_Symbol ( msg_data : mod_executionreport_data ) =
    fields_are_good
;;

let check_fields_ExecutionReport ( msg_data , m_state : mod_executionreport_data * model_state ) =
    let f_ExecutionReport_Instrument_Symbol_result = check_field_f_ExecutionReport_Instrument_Symbol (msg_data) in
    if f_ExecutionReport_Instrument_Symbol_result.is_invalid then
        f_ExecutionReport_Instrument_Symbol_result
    else
        let f_ExecutionReport_OrdStatus_result = check_field_f_ExecutionReport_OrdStatus (msg_data) in
        if f_ExecutionReport_OrdStatus_result.is_invalid then
            f_ExecutionReport_OrdStatus_result
        else
            let f_ExecutionReport_CumQty_result = check_field_f_ExecutionReport_CumQty (msg_data) in
            if f_ExecutionReport_CumQty_result.is_invalid then
                f_ExecutionReport_CumQty_result
            else
                let f_ExecutionReport_LeavesQty_result = check_field_f_ExecutionReport_LeavesQty (msg_data) in
                if f_ExecutionReport_LeavesQty_result.is_invalid then
                    f_ExecutionReport_LeavesQty_result
                else
                    let f_ExecutionReport_Side_result = check_field_f_ExecutionReport_Side (msg_data) in
                    if f_ExecutionReport_Side_result.is_invalid then
                        f_ExecutionReport_Side_result
                    else
                        let f_ExecutionReport_AvgPx_result = check_field_f_ExecutionReport_AvgPx (msg_data) in
                        if f_ExecutionReport_AvgPx_result.is_invalid then
                            f_ExecutionReport_AvgPx_result
                        else
                            let f_ExecutionReport_ExecType_result = check_field_f_ExecutionReport_ExecType (msg_data) in
                            if f_ExecutionReport_ExecType_result.is_invalid then
                                f_ExecutionReport_ExecType_result
                            else
                                let f_ExecutionReport_ExecID_result = check_field_f_ExecutionReport_ExecID (msg_data) in
                                if f_ExecutionReport_ExecID_result.is_invalid then
                                    f_ExecutionReport_ExecID_result
                                else
                                    let f_ExecutionReport_OrderID_result = check_field_f_ExecutionReport_OrderID (msg_data) in
                                    if f_ExecutionReport_OrderID_result.is_invalid then
                                        f_ExecutionReport_OrderID_result
                                    else
                                        fields_are_good
;;

let check_field_f_NewOrderSingle_ClOrdID ( msg_data : mod_newordersingle_data ) =
    fields_are_good
;;

let check_field_f_NewOrderSingle_Side ( msg_data : mod_newordersingle_data ) =
    if ((&&) ((||) ((||) ((=) msg_data.f_NewOrderSingle_Side MOD_FIX_Side_Buy) ((=) msg_data.f_NewOrderSingle_Side MOD_FIX_Side_Sell)) ((=) msg_data.f_NewOrderSingle_Side MOD_FIX_Side_SellShort)) true) then
        fields_are_good
    else
        (field_invalid (Model_string 18))
;;

let check_field_f_NewOrderSingle_Price ( msg_data : mod_newordersingle_data ) =
    if ((&&) (float_GreaterThan (msg_data.f_NewOrderSingle_Price,float_Create ({
        fix_float_whole = 0;
        fix_float_fraction = 0
    },1))) true) then
        fields_are_good
    else
        (field_invalid (Model_string 19))
;;

let check_field_f_NewOrderSingle_TransactTime ( msg_data : mod_newordersingle_data ) =
    fields_are_good
;;

let check_field_f_NewOrderSingle_OrdType ( msg_data : mod_newordersingle_data ) =
    fields_are_good
;;

let check_field_f_NewOrderSingle_Instrument_Symbol ( msg_data : mod_newordersingle_data ) =
    fields_are_good
;;

let check_fields_NewOrderSingle ( msg_data , m_state : mod_newordersingle_data * model_state ) =
    let f_NewOrderSingle_Instrument_Symbol_result = check_field_f_NewOrderSingle_Instrument_Symbol (msg_data) in
    if f_NewOrderSingle_Instrument_Symbol_result.is_invalid then
        f_NewOrderSingle_Instrument_Symbol_result
    else
        let f_NewOrderSingle_OrdType_result = check_field_f_NewOrderSingle_OrdType (msg_data) in
        if f_NewOrderSingle_OrdType_result.is_invalid then
            f_NewOrderSingle_OrdType_result
        else
            let f_NewOrderSingle_TransactTime_result = check_field_f_NewOrderSingle_TransactTime (msg_data) in
            if f_NewOrderSingle_TransactTime_result.is_invalid then
                f_NewOrderSingle_TransactTime_result
            else
                let f_NewOrderSingle_Price_result = check_field_f_NewOrderSingle_Price (msg_data) in
                if f_NewOrderSingle_Price_result.is_invalid then
                    f_NewOrderSingle_Price_result
                else
                    let f_NewOrderSingle_Side_result = check_field_f_NewOrderSingle_Side (msg_data) in
                    if f_NewOrderSingle_Side_result.is_invalid then
                        f_NewOrderSingle_Side_result
                    else
                        let f_NewOrderSingle_ClOrdID_result = check_field_f_NewOrderSingle_ClOrdID (msg_data) in
                        if f_NewOrderSingle_ClOrdID_result.is_invalid then
                            f_NewOrderSingle_ClOrdID_result
                        else
                            fields_are_good
;;
