(* Aesthetic Integration copyright 2017 *)
(* @meta[imandra_ignore] on @end *)
 open Base_types_json;;
 open Datetime_json;;
 open Json_generator_utils;;
 open Model_enums_json;;
 open Model_messages;;
 open String_constant_factory_for_model;;
 open Yojson;;
(* @meta[imandra_ignore] off @end *)

let mod_executionreport_to_json ( x ) : json =
    assoc_filter_nulls (("ClOrdID",model_string_to_json_for_region x.mod_f_ExecutionReport_ClOrdID) :: (("OrderID",model_string_to_json_for_region x.mod_f_ExecutionReport_OrderID) :: (("ExecID",model_string_to_json_for_region x.mod_f_ExecutionReport_ExecID) :: (("ExecType",mod_exectype_to_json x.mod_f_ExecutionReport_ExecType) :: (("AvgPx",float_to_json x.mod_f_ExecutionReport_AvgPx) :: (("Side",mod_side_to_json x.mod_f_ExecutionReport_Side) :: (("LeavesQty",float_to_json x.mod_f_ExecutionReport_LeavesQty) :: (("CumQty",float_to_json x.mod_f_ExecutionReport_CumQty) :: (("OrdStatus",mod_ordstatus_to_json x.mod_f_ExecutionReport_OrdStatus) :: (("Instrument.Symbol",model_string_to_json_for_region x.mod_f_ExecutionReport_Instrument_Symbol) :: (("Text",model_string_opt_to_json_for_region x.mod_f_ExecutionReport_Text) :: [])))))))))))
;;

let mod_newordersingle_to_json ( x ) : json =
    assoc_filter_nulls (("ClOrdID",model_string_to_json_for_region x.mod_f_NewOrderSingle_ClOrdID) :: (("Side",mod_side_to_json x.mod_f_NewOrderSingle_Side) :: (("TransactTime",utctimestamp_to_json x.mod_f_NewOrderSingle_TransactTime) :: (("OrdType",mod_ordtype_to_json x.mod_f_NewOrderSingle_OrdType) :: (("Instrument.Symbol",model_string_to_json_for_region x.mod_f_NewOrderSingle_Instrument_Symbol) :: [])))))
;;

let json_of_model_msg ( x ) : json =
    (match x with
        | FIX_Msg_ExecutionReport x -> (`Assoc (("tag",`String "com.aestheticintegration.fixdsl.fixDsl.impl.MessageDeclImpl@2755d705 (name: ExecutionReport) (descriptions: [@description: The execution report message is used to:
        , @description: 1. Confirm the receipt of an order
        , @description: 2. Confirm changes to an existing order (i.e. accept cancel and replace requests)
        , @description: 3. Relay order status information
        , @description: 4. Relay fill information on working orders
        , @description: 5. Relay fill information on tradeable or restricted tradeable quotes
        , @description: 6. Reject orders
        , @description: 7. Report post-trade fees calculations associated with a trade
        ])") :: (("data",mod_executionreport_to_json x) :: [])))
        | FIX_Msg_NewOrderSingle x -> (`Assoc (("tag",`String "com.aestheticintegration.fixdsl.fixDsl.impl.MessageDeclImpl@182f1e9a (name: NewOrderSingle) (descriptions: [@description: The new order message type is used by institutions wishing to electronically submit securities and forex orders to a broker for execution.
        ])") :: (("data",mod_newordersingle_to_json x) :: [])))
    )
;;
