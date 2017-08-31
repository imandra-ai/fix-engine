(* Aesthetic Integration copyright 2017 *)
(* @meta[imandra_ignore] on @end *)
open Model_tags;;
open Base_types;;
open Datetime;;
open Numeric;;
open Model_app_enums;;
(* @meta[imandra_ignore] off @end *)

type mod_executionreport_data = {
    f_ExecutionReport_ClOrdID : fix_string;
    f_ExecutionReport_Symbol : fix_string;
    f_ExecutionReport_OrderID : fix_string;
    f_ExecutionReport_ExecID : fix_string;
    f_ExecutionReport_ExecType : model_fix_exectype;
    f_ExecutionReport_AvgPx : fix_float;
    f_ExecutionReport_Side : model_fix_side;
    f_ExecutionReport_LeavesQty : fix_float;
    f_ExecutionReport_CumQty : fix_float;
    f_ExecutionReport_OrdStatus : model_fix_ordstatus;
    f_ExecutionReport_ExecTransType : model_fix_exectranstype;
    f_ExecutionReport_Text : fix_string option
}
;;

type mod_ordersingle_data = {
    f_OrderSingle_ClOrdID : fix_string;
    f_OrderSingle_Symbol : fix_string;
    f_OrderSingle_Side : model_fix_side;
    f_OrderSingle_TransactTime : fix_utctimestamp;
    f_OrderSingle_OrdType : model_fix_ordtype;
    f_OrderSingle_HandlInst : model_fix_handlinst
}
;;

type model_msg =
    | FIX_Msg_ExecutionReport of mod_executionreport_data
    | FIX_Msg_OrderSingle of mod_ordersingle_data
;;

let is_msg_inbound ( msg : model_msg ) =
    (match msg with
        | FIX_Msg_ExecutionReport _ -> false
        | FIX_Msg_OrderSingle _ -> true
    )
;;

type field_missing_data = {
    field_missing_data_field : m_field_tag;
    field_missing_data_msg : m_msg_tag
}
;;

type model_top_level_msg =
    | FIX_TL_Normal of model_msg
    | FIX_TL_Req_Field_Missing of field_missing_data
    | FIX_TL_PossibleResend of model_msg
    | FIX_TL_None 
;;
