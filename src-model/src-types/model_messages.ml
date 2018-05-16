(* Aesthetic Integration copyright 2017 *)
(* @meta[imandra_ignore] on @end *)
open Datetime;;
open Model_app_enums;;
open Model_tags;;
open Numeric;;
(* @meta[imandra_ignore] off @end *)

type mod_executionreport_data = {
    f_ExecutionReport_ClOrdID : string;
    f_ExecutionReport_OrderID : string;
    f_ExecutionReport_ExecID : string;
    f_ExecutionReport_ExecType : model_fix_exectype;
    f_ExecutionReport_AvgPx : fix_float_4;
    f_ExecutionReport_Side : model_fix_side;
    f_ExecutionReport_LeavesQty : fix_float_4;
    f_ExecutionReport_CumQty : fix_float_4;
    f_ExecutionReport_OrdStatus : model_fix_ordstatus;
    f_ExecutionReport_Instrument_Symbol : string;
    f_ExecutionReport_Text : string option
}
;;

type mod_newordersingle_data = {
    f_NewOrderSingle_ClOrdID : string;
    f_NewOrderSingle_Side : model_fix_side;
    f_NewOrderSingle_TransactTime : fix_utctimestamp;
    f_NewOrderSingle_OrdType : model_fix_ordtype;
    f_NewOrderSingle_Instrument_Symbol : string
}
;;

type model_msg =
    | FIX_Msg_ExecutionReport of mod_executionreport_data
    | FIX_Msg_NewOrderSingle of mod_newordersingle_data
;;

let is_msg_inbound ( msg : model_msg ) =
    (match msg with
        | FIX_Msg_ExecutionReport _ -> false
        | FIX_Msg_NewOrderSingle _ -> true
    )
;;

type field_missing_data = {
    field_missing_data_field : m_field_tag;
    field_missing_data_msg : m_msg_tag
}
;;

type model_top_level_msg =
    | FIX_TL_Normal of model_msg
    | FIX_TL_PossibleResend of model_msg    
    | FIX_TL_Req_Field_Missing of field_missing_data
    | FIX_TL_None 
;;
