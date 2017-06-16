(* @meta[imandra_ignore] on @end *)
open Base_types;;
open Datetime;;
open Numeric;;
open Model_app_enums;;
open Model_tags;;
(* @meta[imandra_ignore] off @end *)

type mod_executionreport_data = {
    f_ExecutionReport_ClOrdID : fix_string;
    f_ExecutionReport_OrderID : fix_string;
    f_ExecutionReport_ExecID : fix_string;
    f_ExecutionReport_ExecType : model_fix_exectype;
    f_ExecutionReport_AvgPx : fix_float;
    f_ExecutionReport_Side : model_fix_side;
    f_ExecutionReport_LeavesQty : fix_float;
    f_ExecutionReport_CumQty : fix_float;
    f_ExecutionReport_OrdStatus : model_fix_ordstatus;
    f_ExecutionReport_Instrument_Symbol : fix_string
}
;;

type mod_newordersingle_data = {
    f_NewOrderSingle_ClOrdID : fix_string;
    f_NewOrderSingle_Side : model_fix_side;
    f_NewOrderSingle_Price : fix_float;
    f_NewOrderSingle_TransactTime : fix_utctimestamp;
    f_NewOrderSingle_OrdType : model_fix_ordtype;
    f_NewOrderSingle_Instrument_Symbol : fix_string
}
;;

type model_msg =
    | FIX_Msg_ExecutionReport of mod_executionreport_data
    | FIX_Msg_NewOrderSingle of mod_newordersingle_data
;;

type field_missing_data = {
    field_missing_data_field : m_field_tag;
    field_missing_data_msg : m_msg_tag
}
;;

type model_top_level_msg =
    | FIX_TL_Normal of model_msg
    | FIX_TL_Req_Field_Missing of field_missing_data
    | FIX_TL_None 
;;
