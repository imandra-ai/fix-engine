(* Aesthetic Integration copyright 2018 *)
open Actions;;
open Base_types_json;;
open Datetime_json;;
open Json_generator_utils;;
open Model_enums_json;;
open Model_repeating_groups_json;;
open Yojson;;

let mod_act_neworder_to_json (x)  : json =
    assoc_filter_nulls (("ClOrdID",string_to_json x.mod_f_neworder_ClOrdID) :: (("Symbol",string_to_json x.mod_f_neworder_Symbol) :: (("Side",mod_side_to_json x.mod_f_neworder_Side) :: (("OrdType",mod_ordtype_to_json x.mod_f_neworder_OrdType) :: (("TimeInForce",mod_timeinforce_opt_to_json x.mod_f_neworder_TimeInForce) :: (("ExecInst",mod_execinst_opt_to_json x.mod_f_neworder_ExecInst) :: (("Price",float_4_opt_to_json x.mod_f_neworder_Price) :: (("OrderQty",float_4_to_json x.mod_f_neworder_OrderQty) :: (("BookIndicator",mod_bookindicator_opt_to_json x.mod_f_neworder_BookIndicator) :: (("MinQty",float_4_opt_to_json x.mod_f_neworder_MinQty) :: (("PegDifference",float_opt_to_json x.mod_f_neworder_PegDifference) :: (("TransactTime",utctimestamp_to_json x.mod_f_neworder_TransactTime) :: (("Currency",mod_currency_opt_to_json x.mod_f_neworder_Currency) :: (("HandlInst",mod_handlinst_to_json x.mod_f_neworder_HandlInst) :: (("TechnicalOrdType",mod_technicalordtype_to_json x.mod_f_neworder_TechnicalOrdType) :: (("MIC",string_to_json x.mod_f_neworder_MIC) :: (("BrokerPrioritization",mod_brokerprioritization_to_json x.mod_f_neworder_BrokerPrioritization) :: (("DEAIndicator",int_to_json x.mod_f_neworder_DEAIndicator) :: (("Parties",mod_parties_to_json x.mod_f_neworder_Parties) :: (("ClearingEntries",mod_clearingentries_to_json x.mod_f_neworder_ClearingEntries) :: (("OrderAttributeTypes",mod_orderattributetypes_opt_to_json x.mod_f_neworder_OrderAttributeTypes) :: [])))))))))))))))))))))
;;

let mod_act_cancelreplace_to_json (x)  : json =
    assoc_filter_nulls (("OrderID",string_opt_to_json x.mod_f_cancelreplace_OrderID) :: (("ClOrdID",string_to_json x.mod_f_cancelreplace_ClOrdID) :: (("OrigClOrdID",string_to_json x.mod_f_cancelreplace_OrigClOrdID) :: (("Symbol",string_to_json x.mod_f_cancelreplace_Symbol) :: (("Side",mod_side_to_json x.mod_f_cancelreplace_Side) :: (("OrdType",mod_ordtype_to_json x.mod_f_cancelreplace_OrdType) :: (("TimeInForce",mod_timeinforce_opt_to_json x.mod_f_cancelreplace_TimeInForce) :: (("ExecInst",mod_execinst_opt_to_json x.mod_f_cancelreplace_ExecInst) :: (("Price",float_4_opt_to_json x.mod_f_cancelreplace_Price) :: (("OrderQty",float_4_to_json x.mod_f_cancelreplace_OrderQty) :: (("PegDifference",float_opt_to_json x.mod_f_cancelreplace_PegDifference) :: (("TechnicalOrdType",mod_technicalordtype_opt_to_json x.mod_f_cancelreplace_TechnicalOrdType) :: (("Rule80A",mod_rule80a_to_json x.mod_f_cancelreplace_Rule80A) :: (("Account",string_opt_to_json x.mod_f_cancelreplace_Account) :: (("ClientID",string_opt_to_json x.mod_f_cancelreplace_ClientID) :: (("FreeText",string_opt_to_json x.mod_f_cancelreplace_FreeText) :: (("ClearingFirm",string_opt_to_json x.mod_f_cancelreplace_ClearingFirm) :: (("OpenClose",mod_openclose_opt_to_json x.mod_f_cancelreplace_OpenClose) :: (("ClearingHandlingType",mod_clearinghandlingtype_opt_to_json x.mod_f_cancelreplace_ClearingHandlingType) :: (("MIC",string_opt_to_json x.mod_f_cancelreplace_MIC) :: (("Currency",mod_currency_opt_to_json x.mod_f_cancelreplace_Currency) :: [])))))))))))))))))))))
;;

let mod_act_cancel_to_json (x)  : json =
    assoc_filter_nulls (("OrderID",string_opt_to_json x.mod_f_cancel_OrderID) :: (("ClOrdID",string_to_json x.mod_f_cancel_ClOrdID) :: (("OrigClOrdID",string_to_json x.mod_f_cancel_OrigClOrdID) :: (("Symbol",string_to_json x.mod_f_cancel_Symbol) :: (("OrderQty",float_4_opt_to_json x.mod_f_cancel_OrderQty) :: (("TransactTime",utctimestamp_opt_to_json x.mod_f_cancel_TransactTime) :: (("MIC",string_opt_to_json x.mod_f_cancel_MIC) :: (("Currency",mod_currency_opt_to_json x.mod_f_cancel_Currency) :: []))))))))
;;

let mod_act_masscancel_to_json (x)  : json =
    assoc_filter_nulls (("ClOrdID",string_opt_to_json x.mod_f_masscancel_ClOrdID) :: (("Symbol",string_opt_to_json x.mod_f_masscancel_Symbol) :: (("ClassID",string_opt_to_json x.mod_f_masscancel_ClassID) :: (("MassCancelRequestType",mod_masscancelrequesttype_opt_to_json x.mod_f_masscancel_MassCancelRequestType) :: (("Side",mod_side_opt_to_json x.mod_f_masscancel_Side) :: (("TechnicalOrdType",mod_technicalordtype_opt_to_json x.mod_f_masscancel_TechnicalOrdType) :: (("Rule80A",mod_rule80a_opt_to_json x.mod_f_masscancel_Rule80A) :: (("Account",string_opt_to_json x.mod_f_masscancel_Account) :: (("CancelByLocationID",string_opt_to_json x.mod_f_masscancel_CancelByLocationID) :: (("TransactTime",utctimestamp_opt_to_json x.mod_f_masscancel_TransactTime) :: []))))))))))
;;

let json_of_fix_action (x)  : json =
    (match x with
        | FIX_Action_neworder x -> (`Assoc (("tag",`String "neworder") :: (("data",mod_act_neworder_to_json x) :: [])))
        | FIX_Action_cancelreplace x -> (`Assoc (("tag",`String "cancelreplace") :: (("data",mod_act_cancelreplace_to_json x) :: [])))
        | FIX_Action_cancel x -> (`Assoc (("tag",`String "cancel") :: (("data",mod_act_cancel_to_json x) :: [])))
        | FIX_Action_masscancel x -> (`Assoc (("tag",`String "masscancel") :: (("data",mod_act_masscancel_to_json x) :: [])))
    )
;;
