(* Aesthetic Integration copyright 2018 *)
open Datetime;;
open Model_app_enums;;
open Model_repeating_groups;;
open Numeric;;

type m_action_fix_neworder = {
    mod_f_neworder_ClOrdID : string;
    mod_f_neworder_Symbol : string;
    mod_f_neworder_Side : model_fix_side;
    mod_f_neworder_OrdType : model_fix_ordtype;
    mod_f_neworder_TimeInForce : model_fix_timeinforce option;
    mod_f_neworder_ExecInst : model_fix_execinst option;
    mod_f_neworder_Price : fix_float_4 option;
    mod_f_neworder_OrderQty : fix_float_4;
    mod_f_neworder_BookIndicator : model_fix_bookindicator option;
    mod_f_neworder_MinQty : fix_float_4 option;
    mod_f_neworder_PegDifference : fix_float option;
    mod_f_neworder_TransactTime : fix_utctimestamp;
    mod_f_neworder_Currency : model_fix_currency option;
    mod_f_neworder_HandlInst : model_fix_handlinst;
    mod_f_neworder_TechnicalOrdType : model_fix_technicalordtype;
    mod_f_neworder_MIC : string;
    mod_f_neworder_BrokerPrioritization : model_fix_brokerprioritization;
    mod_f_neworder_DEAIndicator : int;
    mod_f_neworder_Parties : model_fix_rec_parties;
    mod_f_neworder_ClearingEntries : model_fix_rec_clearingentries;
    mod_f_neworder_OrderAttributeTypes : model_fix_orderattributetypes option
}
;;

type m_action_fix_cancelreplace = {
    mod_f_cancelreplace_OrderID : string option;
    mod_f_cancelreplace_ClOrdID : string;
    mod_f_cancelreplace_OrigClOrdID : string;
    mod_f_cancelreplace_Symbol : string;
    mod_f_cancelreplace_Side : model_fix_side;
    mod_f_cancelreplace_OrdType : model_fix_ordtype;
    mod_f_cancelreplace_TimeInForce : model_fix_timeinforce option;
    mod_f_cancelreplace_ExecInst : model_fix_execinst option;
    mod_f_cancelreplace_Price : fix_float_4 option;
    mod_f_cancelreplace_OrderQty : fix_float_4;
    mod_f_cancelreplace_PegDifference : fix_float option;
    mod_f_cancelreplace_TechnicalOrdType : model_fix_technicalordtype option;
    mod_f_cancelreplace_Rule80A : model_fix_rule80a;
    mod_f_cancelreplace_Account : string option;
    mod_f_cancelreplace_ClientID : string option;
    mod_f_cancelreplace_FreeText : string option;
    mod_f_cancelreplace_ClearingFirm : string option;
    mod_f_cancelreplace_OpenClose : model_fix_openclose option;
    mod_f_cancelreplace_ClearingHandlingType : model_fix_clearinghandlingtype option;
    mod_f_cancelreplace_MIC : string option;
    mod_f_cancelreplace_Currency : model_fix_currency option
}
;;

type m_action_fix_cancel = {
    mod_f_cancel_OrderID : string option;
    mod_f_cancel_ClOrdID : string;
    mod_f_cancel_OrigClOrdID : string;
    mod_f_cancel_Symbol : string;
    mod_f_cancel_OrderQty : fix_float_4 option;
    mod_f_cancel_TransactTime : fix_utctimestamp option;
    mod_f_cancel_MIC : string option;
    mod_f_cancel_Currency : model_fix_currency option
}
;;

type m_action_fix_masscancel = {
    mod_f_masscancel_ClOrdID : string option;
    mod_f_masscancel_Symbol : string option;
    mod_f_masscancel_ClassID : string option;
    mod_f_masscancel_MassCancelRequestType : model_fix_masscancelrequesttype option;
    mod_f_masscancel_Side : model_fix_side option;
    mod_f_masscancel_TechnicalOrdType : model_fix_technicalordtype option;
    mod_f_masscancel_Rule80A : model_fix_rule80a option;
    mod_f_masscancel_Account : string option;
    mod_f_masscancel_CancelByLocationID : string option;
    mod_f_masscancel_TransactTime : fix_utctimestamp option
}
;;

type fix_action =
    | FIX_Action_neworder of m_action_fix_neworder
    | FIX_Action_cancelreplace of m_action_fix_cancelreplace
    | FIX_Action_cancel of m_action_fix_cancel
    | FIX_Action_masscancel of m_action_fix_masscancel
;;
