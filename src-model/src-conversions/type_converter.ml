(* Aesthetic Integration copyright 2018 *)
open Enum_converter;;
open Full_app_messages;;
open Full_app_records;;
open Model_enum_names;;
open Model_messages;;
open Model_tags;;
open Repeating_groups_converter;;

let convert__full_to_model_OrderSingle (msg : full_fix_ordersingle_data)  =
    let c_mod_f_OrderSingle_OrderAttributeTypes = msg.f_OrderSingle_OrderAttributeTypes in
    (match check_convert_full_to_model__ClearingEntries msg.f_OrderSingle_ClearingEntries with
        | RG_Failure x -> (FIX_TL_None)
        | RG_Success -> let c_mod_f_OrderSingle_ClearingEntries = convert__full_to_model_ClearingEntries msg.f_OrderSingle_ClearingEntries in
        (match check_convert_full_to_model__Parties msg.f_OrderSingle_Parties with
            | RG_Failure x -> (FIX_TL_None)
            | RG_Success -> let c_mod_f_OrderSingle_Parties = convert__full_to_model_Parties msg.f_OrderSingle_Parties in
            (match msg.f_OrderSingle_DEAIndicator with
                | None -> (FIX_TL_None)
                | Some m_f_OrderSingle_DEAIndicator -> let c_mod_f_OrderSingle_DEAIndicator = m_f_OrderSingle_DEAIndicator in
                (match msg.f_OrderSingle_BrokerPrioritization with
                    | None -> (FIX_TL_None)
                    | Some m_f_OrderSingle_BrokerPrioritization -> let c_mod_f_OrderSingle_BrokerPrioritization = m_f_OrderSingle_BrokerPrioritization in
                    (match msg.f_OrderSingle_MIC with
                        | None -> (FIX_TL_None)
                        | Some m_f_OrderSingle_MIC -> let c_mod_f_OrderSingle_MIC = m_f_OrderSingle_MIC in
                        (match msg.f_OrderSingle_TechnicalOrdType with
                            | None -> (FIX_TL_None)
                            | Some m_f_OrderSingle_TechnicalOrdType -> let c_mod_f_OrderSingle_TechnicalOrdType = m_f_OrderSingle_TechnicalOrdType in
                            (match msg.f_OrderSingle_HandlInst with
                                | None -> (FIX_TL_None)
                                | Some m_f_OrderSingle_HandlInst -> let c_mod_f_OrderSingle_HandlInst = m_f_OrderSingle_HandlInst in
                                let c_mod_f_OrderSingle_Currency = msg.f_OrderSingle_Currency in
                                (match msg.f_OrderSingle_TransactTime with
                                    | None -> (FIX_TL_None)
                                    | Some m_f_OrderSingle_TransactTime -> let c_mod_f_OrderSingle_TransactTime = m_f_OrderSingle_TransactTime in
                                    let c_mod_f_OrderSingle_PegDifference = msg.f_OrderSingle_PegDifference in
                                    let c_mod_f_OrderSingle_MinQty = msg.f_OrderSingle_MinQty in
                                    let c_mod_f_OrderSingle_BookIndicator = msg.f_OrderSingle_BookIndicator in
                                    (match msg.f_OrderSingle_OrderQty with
                                        | None -> (FIX_TL_None)
                                        | Some m_f_OrderSingle_OrderQty -> let c_mod_f_OrderSingle_OrderQty = m_f_OrderSingle_OrderQty in
                                        let c_mod_f_OrderSingle_Price = msg.f_OrderSingle_Price in
                                        let c_mod_f_OrderSingle_ExecInst = msg.f_OrderSingle_ExecInst in
                                        let c_mod_f_OrderSingle_TimeInForce = msg.f_OrderSingle_TimeInForce in
                                        (match msg.f_OrderSingle_OrdType with
                                            | None -> (FIX_TL_None)
                                            | Some m_f_OrderSingle_OrdType -> let c_mod_f_OrderSingle_OrdType = m_f_OrderSingle_OrdType in
                                            (match msg.f_OrderSingle_Side with
                                                | None -> (FIX_TL_None)
                                                | Some m_f_OrderSingle_Side -> let c_mod_f_OrderSingle_Side = m_f_OrderSingle_Side in
                                                (match msg.f_OrderSingle_Symbol with
                                                    | None -> (FIX_TL_None)
                                                    | Some m_f_OrderSingle_Symbol -> let c_mod_f_OrderSingle_Symbol = m_f_OrderSingle_Symbol in
                                                    (match msg.f_OrderSingle_ClOrdID with
                                                        | None -> (FIX_TL_None)
                                                        | Some m_f_OrderSingle_ClOrdID -> let c_mod_f_OrderSingle_ClOrdID = m_f_OrderSingle_ClOrdID in
                                                        let fix_msg_data = {
                                                            mod_f_OrderSingle_ClOrdID = c_mod_f_OrderSingle_ClOrdID;
                                                            mod_f_OrderSingle_Symbol = c_mod_f_OrderSingle_Symbol;
                                                            mod_f_OrderSingle_Side = convert__full_to_model_Side c_mod_f_OrderSingle_Side;
                                                            mod_f_OrderSingle_OrdType = convert__full_to_model_OrdType c_mod_f_OrderSingle_OrdType;
                                                            mod_f_OrderSingle_TimeInForce = (match c_mod_f_OrderSingle_TimeInForce with
                                                                | None -> None
                                                                | Some d -> (Some (convert__full_to_model_TimeInForce d))
                                                            );
                                                            mod_f_OrderSingle_ExecInst = (match c_mod_f_OrderSingle_ExecInst with
                                                                | None -> None
                                                                | Some d -> (Some (convert__full_to_model_ExecInst d))
                                                            );
                                                            mod_f_OrderSingle_Price = c_mod_f_OrderSingle_Price;
                                                            mod_f_OrderSingle_OrderQty = c_mod_f_OrderSingle_OrderQty;
                                                            mod_f_OrderSingle_BookIndicator = (match c_mod_f_OrderSingle_BookIndicator with
                                                                | None -> None
                                                                | Some d -> (Some (convert__full_to_model_BookIndicator d))
                                                            );
                                                            mod_f_OrderSingle_MinQty = c_mod_f_OrderSingle_MinQty;
                                                            mod_f_OrderSingle_PegDifference = c_mod_f_OrderSingle_PegDifference;
                                                            mod_f_OrderSingle_TransactTime = c_mod_f_OrderSingle_TransactTime;
                                                            mod_f_OrderSingle_Currency = (match c_mod_f_OrderSingle_Currency with
                                                                | None -> None
                                                                | Some d -> (Some (convert__full_to_model_Currency d))
                                                            );
                                                            mod_f_OrderSingle_HandlInst = convert__full_to_model_HandlInst c_mod_f_OrderSingle_HandlInst;
                                                            mod_f_OrderSingle_TechnicalOrdType = convert__full_to_model_TechnicalOrdType c_mod_f_OrderSingle_TechnicalOrdType;
                                                            mod_f_OrderSingle_MIC = c_mod_f_OrderSingle_MIC;
                                                            mod_f_OrderSingle_BrokerPrioritization = convert__full_to_model_BrokerPrioritization c_mod_f_OrderSingle_BrokerPrioritization;
                                                            mod_f_OrderSingle_DEAIndicator = c_mod_f_OrderSingle_DEAIndicator;
                                                            mod_f_OrderSingle_Parties = c_mod_f_OrderSingle_Parties;
                                                            mod_f_OrderSingle_ClearingEntries = c_mod_f_OrderSingle_ClearingEntries;
                                                            mod_f_OrderSingle_OrderAttributeTypes = (match c_mod_f_OrderSingle_OrderAttributeTypes with
                                                                | None -> None
                                                                | Some d -> (Some (convert__full_to_model_OrderAttributeTypes d))
                                                            )
                                                        } in
                                                        FIX_TL_Normal (FIX_Msg_OrderSingle fix_msg_data)
                                                    )
                                                )
                                            )
                                        )
                                    )
                                )
                            )
                        )
                    )
                )
            )
        )
    )
;;

let convert__full_to_model_OrderCancelReplaceRequest (msg : full_fix_ordercancelreplacerequest_data)  =
    let c_mod_f_OrderCancelReplaceRequest_Currency = msg.f_OrderCancelReplaceRequest_Currency in
    let c_mod_f_OrderCancelReplaceRequest_MIC = msg.f_OrderCancelReplaceRequest_MIC in
    let c_mod_f_OrderCancelReplaceRequest_ClearingHandlingType = msg.f_OrderCancelReplaceRequest_ClearingHandlingType in
    let c_mod_f_OrderCancelReplaceRequest_OpenClose = msg.f_OrderCancelReplaceRequest_OpenClose in
    let c_mod_f_OrderCancelReplaceRequest_ClearingFirm = msg.f_OrderCancelReplaceRequest_ClearingFirm in
    let c_mod_f_OrderCancelReplaceRequest_FreeText = msg.f_OrderCancelReplaceRequest_FreeText in
    let c_mod_f_OrderCancelReplaceRequest_ClientID = msg.f_OrderCancelReplaceRequest_ClientID in
    let c_mod_f_OrderCancelReplaceRequest_Account = msg.f_OrderCancelReplaceRequest_Account in
    (match msg.f_OrderCancelReplaceRequest_Rule80A with
        | None -> (FIX_TL_None)
        | Some m_f_OrderCancelReplaceRequest_Rule80A -> let c_mod_f_OrderCancelReplaceRequest_Rule80A = m_f_OrderCancelReplaceRequest_Rule80A in
        let c_mod_f_OrderCancelReplaceRequest_TechnicalOrdType = msg.f_OrderCancelReplaceRequest_TechnicalOrdType in
        let c_mod_f_OrderCancelReplaceRequest_PegDifference = msg.f_OrderCancelReplaceRequest_PegDifference in
        (match msg.f_OrderCancelReplaceRequest_OrderQty with
            | None -> (FIX_TL_None)
            | Some m_f_OrderCancelReplaceRequest_OrderQty -> let c_mod_f_OrderCancelReplaceRequest_OrderQty = m_f_OrderCancelReplaceRequest_OrderQty in
            let c_mod_f_OrderCancelReplaceRequest_Price = msg.f_OrderCancelReplaceRequest_Price in
            let c_mod_f_OrderCancelReplaceRequest_ExecInst = msg.f_OrderCancelReplaceRequest_ExecInst in
            let c_mod_f_OrderCancelReplaceRequest_TimeInForce = msg.f_OrderCancelReplaceRequest_TimeInForce in
            (match msg.f_OrderCancelReplaceRequest_OrdType with
                | None -> (FIX_TL_None)
                | Some m_f_OrderCancelReplaceRequest_OrdType -> let c_mod_f_OrderCancelReplaceRequest_OrdType = m_f_OrderCancelReplaceRequest_OrdType in
                (match msg.f_OrderCancelReplaceRequest_Side with
                    | None -> (FIX_TL_None)
                    | Some m_f_OrderCancelReplaceRequest_Side -> let c_mod_f_OrderCancelReplaceRequest_Side = m_f_OrderCancelReplaceRequest_Side in
                    (match msg.f_OrderCancelReplaceRequest_Symbol with
                        | None -> (FIX_TL_None)
                        | Some m_f_OrderCancelReplaceRequest_Symbol -> let c_mod_f_OrderCancelReplaceRequest_Symbol = m_f_OrderCancelReplaceRequest_Symbol in
                        (match msg.f_OrderCancelReplaceRequest_OrigClOrdID with
                            | None -> (FIX_TL_None)
                            | Some m_f_OrderCancelReplaceRequest_OrigClOrdID -> let c_mod_f_OrderCancelReplaceRequest_OrigClOrdID = m_f_OrderCancelReplaceRequest_OrigClOrdID in
                            (match msg.f_OrderCancelReplaceRequest_ClOrdID with
                                | None -> (FIX_TL_None)
                                | Some m_f_OrderCancelReplaceRequest_ClOrdID -> let c_mod_f_OrderCancelReplaceRequest_ClOrdID = m_f_OrderCancelReplaceRequest_ClOrdID in
                                let c_mod_f_OrderCancelReplaceRequest_OrderID = msg.f_OrderCancelReplaceRequest_OrderID in
                                let fix_msg_data = {
                                    mod_f_OrderCancelReplaceRequest_OrderID = c_mod_f_OrderCancelReplaceRequest_OrderID;
                                    mod_f_OrderCancelReplaceRequest_ClOrdID = c_mod_f_OrderCancelReplaceRequest_ClOrdID;
                                    mod_f_OrderCancelReplaceRequest_OrigClOrdID = c_mod_f_OrderCancelReplaceRequest_OrigClOrdID;
                                    mod_f_OrderCancelReplaceRequest_Symbol = c_mod_f_OrderCancelReplaceRequest_Symbol;
                                    mod_f_OrderCancelReplaceRequest_Side = convert__full_to_model_Side c_mod_f_OrderCancelReplaceRequest_Side;
                                    mod_f_OrderCancelReplaceRequest_OrdType = convert__full_to_model_OrdType c_mod_f_OrderCancelReplaceRequest_OrdType;
                                    mod_f_OrderCancelReplaceRequest_TimeInForce = (match c_mod_f_OrderCancelReplaceRequest_TimeInForce with
                                        | None -> None
                                        | Some d -> (Some (convert__full_to_model_TimeInForce d))
                                    );
                                    mod_f_OrderCancelReplaceRequest_ExecInst = (match c_mod_f_OrderCancelReplaceRequest_ExecInst with
                                        | None -> None
                                        | Some d -> (Some (convert__full_to_model_ExecInst d))
                                    );
                                    mod_f_OrderCancelReplaceRequest_Price = c_mod_f_OrderCancelReplaceRequest_Price;
                                    mod_f_OrderCancelReplaceRequest_OrderQty = c_mod_f_OrderCancelReplaceRequest_OrderQty;
                                    mod_f_OrderCancelReplaceRequest_PegDifference = c_mod_f_OrderCancelReplaceRequest_PegDifference;
                                    mod_f_OrderCancelReplaceRequest_TechnicalOrdType = (match c_mod_f_OrderCancelReplaceRequest_TechnicalOrdType with
                                        | None -> None
                                        | Some d -> (Some (convert__full_to_model_TechnicalOrdType d))
                                    );
                                    mod_f_OrderCancelReplaceRequest_Rule80A = convert__full_to_model_Rule80A c_mod_f_OrderCancelReplaceRequest_Rule80A;
                                    mod_f_OrderCancelReplaceRequest_Account = c_mod_f_OrderCancelReplaceRequest_Account;
                                    mod_f_OrderCancelReplaceRequest_ClientID = c_mod_f_OrderCancelReplaceRequest_ClientID;
                                    mod_f_OrderCancelReplaceRequest_FreeText = c_mod_f_OrderCancelReplaceRequest_FreeText;
                                    mod_f_OrderCancelReplaceRequest_ClearingFirm = c_mod_f_OrderCancelReplaceRequest_ClearingFirm;
                                    mod_f_OrderCancelReplaceRequest_OpenClose = (match c_mod_f_OrderCancelReplaceRequest_OpenClose with
                                        | None -> None
                                        | Some d -> (Some (convert__full_to_model_OpenClose d))
                                    );
                                    mod_f_OrderCancelReplaceRequest_ClearingHandlingType = (match c_mod_f_OrderCancelReplaceRequest_ClearingHandlingType with
                                        | None -> None
                                        | Some d -> (Some (convert__full_to_model_ClearingHandlingType d))
                                    );
                                    mod_f_OrderCancelReplaceRequest_MIC = c_mod_f_OrderCancelReplaceRequest_MIC;
                                    mod_f_OrderCancelReplaceRequest_Currency = (match c_mod_f_OrderCancelReplaceRequest_Currency with
                                        | None -> None
                                        | Some d -> (Some (convert__full_to_model_Currency d))
                                    )
                                } in
                                FIX_TL_Normal (FIX_Msg_OrderCancelReplaceRequest fix_msg_data)
                            )
                        )
                    )
                )
            )
        )
    )
;;

let convert__full_to_model_OrderCancelRequest (msg : full_fix_ordercancelrequest_data)  =
    let c_mod_f_OrderCancelRequest_Currency = msg.f_OrderCancelRequest_Currency in
    let c_mod_f_OrderCancelRequest_MIC = msg.f_OrderCancelRequest_MIC in
    let c_mod_f_OrderCancelRequest_TransactTime = msg.f_OrderCancelRequest_TransactTime in
    let c_mod_f_OrderCancelRequest_OrderQty = msg.f_OrderCancelRequest_OrderQty in
    (match msg.f_OrderCancelRequest_Symbol with
        | None -> (FIX_TL_None)
        | Some m_f_OrderCancelRequest_Symbol -> let c_mod_f_OrderCancelRequest_Symbol = m_f_OrderCancelRequest_Symbol in
        (match msg.f_OrderCancelRequest_OrigClOrdID with
            | None -> (FIX_TL_None)
            | Some m_f_OrderCancelRequest_OrigClOrdID -> let c_mod_f_OrderCancelRequest_OrigClOrdID = m_f_OrderCancelRequest_OrigClOrdID in
            (match msg.f_OrderCancelRequest_ClOrdID with
                | None -> (FIX_TL_None)
                | Some m_f_OrderCancelRequest_ClOrdID -> let c_mod_f_OrderCancelRequest_ClOrdID = m_f_OrderCancelRequest_ClOrdID in
                let c_mod_f_OrderCancelRequest_OrderID = msg.f_OrderCancelRequest_OrderID in
                let fix_msg_data = {
                    mod_f_OrderCancelRequest_OrderID = c_mod_f_OrderCancelRequest_OrderID;
                    mod_f_OrderCancelRequest_ClOrdID = c_mod_f_OrderCancelRequest_ClOrdID;
                    mod_f_OrderCancelRequest_OrigClOrdID = c_mod_f_OrderCancelRequest_OrigClOrdID;
                    mod_f_OrderCancelRequest_Symbol = c_mod_f_OrderCancelRequest_Symbol;
                    mod_f_OrderCancelRequest_OrderQty = c_mod_f_OrderCancelRequest_OrderQty;
                    mod_f_OrderCancelRequest_TransactTime = c_mod_f_OrderCancelRequest_TransactTime;
                    mod_f_OrderCancelRequest_MIC = c_mod_f_OrderCancelRequest_MIC;
                    mod_f_OrderCancelRequest_Currency = (match c_mod_f_OrderCancelRequest_Currency with
                        | None -> None
                        | Some d -> (Some (convert__full_to_model_Currency d))
                    )
                } in
                FIX_TL_Normal (FIX_Msg_OrderCancelRequest fix_msg_data)
            )
        )
    )
;;

let convert__full_to_model_OrderMassCancelRequest (msg : full_fix_ordermasscancelrequest_data)  =
    let c_mod_f_OrderMassCancelRequest_TransactTime = msg.f_OrderMassCancelRequest_TransactTime in
    let c_mod_f_OrderMassCancelRequest_CancelByLocationID = msg.f_OrderMassCancelRequest_CancelByLocationID in
    let c_mod_f_OrderMassCancelRequest_Account = msg.f_OrderMassCancelRequest_Account in
    let c_mod_f_OrderMassCancelRequest_Rule80A = msg.f_OrderMassCancelRequest_Rule80A in
    let c_mod_f_OrderMassCancelRequest_TechnicalOrdType = msg.f_OrderMassCancelRequest_TechnicalOrdType in
    let c_mod_f_OrderMassCancelRequest_Side = msg.f_OrderMassCancelRequest_Side in
    let c_mod_f_OrderMassCancelRequest_MassCancelRequestType = msg.f_OrderMassCancelRequest_MassCancelRequestType in
    let c_mod_f_OrderMassCancelRequest_ClassID = msg.f_OrderMassCancelRequest_ClassID in
    let c_mod_f_OrderMassCancelRequest_Symbol = msg.f_OrderMassCancelRequest_Symbol in
    let c_mod_f_OrderMassCancelRequest_ClOrdID = msg.f_OrderMassCancelRequest_ClOrdID in
    let fix_msg_data = {
        mod_f_OrderMassCancelRequest_ClOrdID = c_mod_f_OrderMassCancelRequest_ClOrdID;
        mod_f_OrderMassCancelRequest_Symbol = c_mod_f_OrderMassCancelRequest_Symbol;
        mod_f_OrderMassCancelRequest_ClassID = c_mod_f_OrderMassCancelRequest_ClassID;
        mod_f_OrderMassCancelRequest_MassCancelRequestType = (match c_mod_f_OrderMassCancelRequest_MassCancelRequestType with
            | None -> None
            | Some d -> (Some (convert__full_to_model_MassCancelRequestType d))
        );
        mod_f_OrderMassCancelRequest_Side = (match c_mod_f_OrderMassCancelRequest_Side with
            | None -> None
            | Some d -> (Some (convert__full_to_model_Side d))
        );
        mod_f_OrderMassCancelRequest_TechnicalOrdType = (match c_mod_f_OrderMassCancelRequest_TechnicalOrdType with
            | None -> None
            | Some d -> (Some (convert__full_to_model_TechnicalOrdType d))
        );
        mod_f_OrderMassCancelRequest_Rule80A = (match c_mod_f_OrderMassCancelRequest_Rule80A with
            | None -> None
            | Some d -> (Some (convert__full_to_model_Rule80A d))
        );
        mod_f_OrderMassCancelRequest_Account = c_mod_f_OrderMassCancelRequest_Account;
        mod_f_OrderMassCancelRequest_CancelByLocationID = c_mod_f_OrderMassCancelRequest_CancelByLocationID;
        mod_f_OrderMassCancelRequest_TransactTime = c_mod_f_OrderMassCancelRequest_TransactTime
    } in
    FIX_TL_Normal (FIX_Msg_OrderMassCancelRequest fix_msg_data)
;;

let convert__full_to_model_ExecutionReport (msg : full_fix_executionreport_data)  =
    (match check_convert_full_to_model__ContraGrp msg.f_ExecutionReport_ContraGrp with
        | RG_Failure x -> (FIX_TL_Req_Field_Missing {
            field_missing_data_msg = M_Msg_ExecutionReport_Tag;
            field_missing_data_field = x
        })
        | RG_Success -> let c_mod_f_ExecutionReport_ContraGrp = convert__full_to_model_ContraGrp msg.f_ExecutionReport_ContraGrp in
        (match check_convert_full_to_model__Parties msg.f_ExecutionReport_Parties with
            | RG_Failure x -> (FIX_TL_Req_Field_Missing {
                field_missing_data_msg = M_Msg_ExecutionReport_Tag;
                field_missing_data_field = x
            })
            | RG_Success -> let c_mod_f_ExecutionReport_Parties = convert__full_to_model_Parties msg.f_ExecutionReport_Parties in
            let c_mod_f_ExecutionReport_IMPTimestamp = msg.f_ExecutionReport_IMPTimestamp in
            let c_mod_f_ExecutionReport_CrossType = msg.f_ExecutionReport_CrossType in
            let c_mod_f_ExecutionReport_TechnicalOrdType = msg.f_ExecutionReport_TechnicalOrdType in
            let c_mod_f_ExecutionReport_Currency = msg.f_ExecutionReport_Currency in
            let c_mod_f_ExecutionReport_OpenClose = msg.f_ExecutionReport_OpenClose in
            let c_mod_f_ExecutionReport_ClearingFirm = msg.f_ExecutionReport_ClearingFirm in
            let c_mod_f_ExecutionReport_ClientID = msg.f_ExecutionReport_ClientID in
            let c_mod_f_ExecutionReport_Account = msg.f_ExecutionReport_Account in
            let c_mod_f_ExecutionReport_PegDifference = msg.f_ExecutionReport_PegDifference in
            let c_mod_f_ExecutionReport_OrderQty = msg.f_ExecutionReport_OrderQty in
            let c_mod_f_ExecutionReport_Price = msg.f_ExecutionReport_Price in
            let c_mod_f_ExecutionReport_ExecInst = msg.f_ExecutionReport_ExecInst in
            let c_mod_f_ExecutionReport_TimeInForce = msg.f_ExecutionReport_TimeInForce in
            let c_mod_f_ExecutionReport_OrdType = msg.f_ExecutionReport_OrdType in
            let c_mod_f_ExecutionReport_LastShares = msg.f_ExecutionReport_LastShares in
            let c_mod_f_ExecutionReport_LastPx = msg.f_ExecutionReport_LastPx in
            let c_mod_f_ExecutionReport_ExecRefID = msg.f_ExecutionReport_ExecRefID in
            let c_mod_f_ExecutionReport_OrdRejReason = msg.f_ExecutionReport_OrdRejReason in
            let c_mod_f_ExecutionReport_TransactTime = msg.f_ExecutionReport_TransactTime in
            let c_mod_f_ExecutionReport_OrigClOrdID = msg.f_ExecutionReport_OrigClOrdID in
            let c_mod_f_ExecutionReport_ClOrdID = msg.f_ExecutionReport_ClOrdID in
            let c_mod_f_ExecutionReport_OrderAttributeTypes = msg.f_ExecutionReport_OrderAttributeTypes in
            let c_mod_f_ExecutionReport_DEAIndicator = msg.f_ExecutionReport_DEAIndicator in
            let c_mod_f_ExecutionReport_BrokerPrioritization = msg.f_ExecutionReport_BrokerPrioritization in
            let c_mod_f_ExecutionReport_BookIndicator = msg.f_ExecutionReport_BookIndicator in
            let c_mod_f_ExecutionReport_MIC = msg.f_ExecutionReport_MIC in
            let c_mod_f_ExecutionReport_ErrorCode = msg.f_ExecutionReport_ErrorCode in
            let c_mod_f_ExecutionReport_LiquidityIndicator = msg.f_ExecutionReport_LiquidityIndicator in
            let c_mod_f_ExecutionReport_UTPExID = msg.f_ExecutionReport_UTPExID in
            let c_mod_f_ExecutionReport_ClearingHandlingType = msg.f_ExecutionReport_ClearingHandlingType in
            let c_mod_f_ExecutionReport_FreeText = msg.f_ExecutionReport_FreeText in
            (match msg.f_ExecutionReport_Text with
                | None -> (FIX_TL_Req_Field_Missing {
                    field_missing_data_msg = M_Msg_ExecutionReport_Tag;
                    field_missing_data_field = M_Field_Text_Tag
                })
                | Some m_f_ExecutionReport_Text -> let c_mod_f_ExecutionReport_Text = m_f_ExecutionReport_Text in
                (match msg.f_ExecutionReport_CumQty with
                    | None -> (FIX_TL_Req_Field_Missing {
                        field_missing_data_msg = M_Msg_ExecutionReport_Tag;
                        field_missing_data_field = M_Field_CumQty_Tag
                    })
                    | Some m_f_ExecutionReport_CumQty -> let c_mod_f_ExecutionReport_CumQty = m_f_ExecutionReport_CumQty in
                    (match msg.f_ExecutionReport_LeavesQty with
                        | None -> (FIX_TL_Req_Field_Missing {
                            field_missing_data_msg = M_Msg_ExecutionReport_Tag;
                            field_missing_data_field = M_Field_LeavesQty_Tag
                        })
                        | Some m_f_ExecutionReport_LeavesQty -> let c_mod_f_ExecutionReport_LeavesQty = m_f_ExecutionReport_LeavesQty in
                        (match msg.f_ExecutionReport_Side with
                            | None -> (FIX_TL_Req_Field_Missing {
                                field_missing_data_msg = M_Msg_ExecutionReport_Tag;
                                field_missing_data_field = M_Field_Side_Tag
                            })
                            | Some m_f_ExecutionReport_Side -> let c_mod_f_ExecutionReport_Side = m_f_ExecutionReport_Side in
                            (match msg.f_ExecutionReport_AvgPx with
                                | None -> (FIX_TL_Req_Field_Missing {
                                    field_missing_data_msg = M_Msg_ExecutionReport_Tag;
                                    field_missing_data_field = M_Field_AvgPx_Tag
                                })
                                | Some m_f_ExecutionReport_AvgPx -> let c_mod_f_ExecutionReport_AvgPx = m_f_ExecutionReport_AvgPx in
                                (match msg.f_ExecutionReport_ExecType with
                                    | None -> (FIX_TL_Req_Field_Missing {
                                        field_missing_data_msg = M_Msg_ExecutionReport_Tag;
                                        field_missing_data_field = M_Field_ExecType_Tag
                                    })
                                    | Some m_f_ExecutionReport_ExecType -> let c_mod_f_ExecutionReport_ExecType = m_f_ExecutionReport_ExecType in
                                    (match msg.f_ExecutionReport_OrdStatus with
                                        | None -> (FIX_TL_Req_Field_Missing {
                                            field_missing_data_msg = M_Msg_ExecutionReport_Tag;
                                            field_missing_data_field = M_Field_OrdStatus_Tag
                                        })
                                        | Some m_f_ExecutionReport_OrdStatus -> let c_mod_f_ExecutionReport_OrdStatus = m_f_ExecutionReport_OrdStatus in
                                        (match msg.f_ExecutionReport_ExecTransType with
                                            | None -> (FIX_TL_Req_Field_Missing {
                                                field_missing_data_msg = M_Msg_ExecutionReport_Tag;
                                                field_missing_data_field = M_Field_ExecTransType_Tag
                                            })
                                            | Some m_f_ExecutionReport_ExecTransType -> let c_mod_f_ExecutionReport_ExecTransType = m_f_ExecutionReport_ExecTransType in
                                            (match msg.f_ExecutionReport_ExecID with
                                                | None -> (FIX_TL_Req_Field_Missing {
                                                    field_missing_data_msg = M_Msg_ExecutionReport_Tag;
                                                    field_missing_data_field = M_Field_ExecID_Tag
                                                })
                                                | Some m_f_ExecutionReport_ExecID -> let c_mod_f_ExecutionReport_ExecID = m_f_ExecutionReport_ExecID in
                                                let c_mod_f_ExecutionReport_Symbol = msg.f_ExecutionReport_Symbol in
                                                let c_mod_f_ExecutionReport_OrderID = msg.f_ExecutionReport_OrderID in
                                                let fix_msg_data = {
                                                    mod_f_ExecutionReport_OrderID = c_mod_f_ExecutionReport_OrderID;
                                                    mod_f_ExecutionReport_Symbol = c_mod_f_ExecutionReport_Symbol;
                                                    mod_f_ExecutionReport_ExecID = c_mod_f_ExecutionReport_ExecID;
                                                    mod_f_ExecutionReport_ExecTransType = convert__full_to_model_ExecTransType c_mod_f_ExecutionReport_ExecTransType;
                                                    mod_f_ExecutionReport_OrdStatus = convert__full_to_model_OrdStatus c_mod_f_ExecutionReport_OrdStatus;
                                                    mod_f_ExecutionReport_ExecType = convert__full_to_model_ExecType c_mod_f_ExecutionReport_ExecType;
                                                    mod_f_ExecutionReport_AvgPx = c_mod_f_ExecutionReport_AvgPx;
                                                    mod_f_ExecutionReport_Side = convert__full_to_model_Side c_mod_f_ExecutionReport_Side;
                                                    mod_f_ExecutionReport_LeavesQty = c_mod_f_ExecutionReport_LeavesQty;
                                                    mod_f_ExecutionReport_CumQty = c_mod_f_ExecutionReport_CumQty;
                                                    mod_f_ExecutionReport_Text = c_mod_f_ExecutionReport_Text;
                                                    mod_f_ExecutionReport_FreeText = c_mod_f_ExecutionReport_FreeText;
                                                    mod_f_ExecutionReport_ClearingHandlingType = (match c_mod_f_ExecutionReport_ClearingHandlingType with
                                                        | None -> None
                                                        | Some d -> (Some (convert__full_to_model_ClearingHandlingType d))
                                                    );
                                                    mod_f_ExecutionReport_UTPExID = c_mod_f_ExecutionReport_UTPExID;
                                                    mod_f_ExecutionReport_LiquidityIndicator = (match c_mod_f_ExecutionReport_LiquidityIndicator with
                                                        | None -> None
                                                        | Some d -> (Some (convert__full_to_model_LiquidityIndicator d))
                                                    );
                                                    mod_f_ExecutionReport_ErrorCode = c_mod_f_ExecutionReport_ErrorCode;
                                                    mod_f_ExecutionReport_MIC = c_mod_f_ExecutionReport_MIC;
                                                    mod_f_ExecutionReport_BookIndicator = (match c_mod_f_ExecutionReport_BookIndicator with
                                                        | None -> None
                                                        | Some d -> (Some (convert__full_to_model_BookIndicator d))
                                                    );
                                                    mod_f_ExecutionReport_BrokerPrioritization = (match c_mod_f_ExecutionReport_BrokerPrioritization with
                                                        | None -> None
                                                        | Some d -> (Some (convert__full_to_model_BrokerPrioritization d))
                                                    );
                                                    mod_f_ExecutionReport_DEAIndicator = c_mod_f_ExecutionReport_DEAIndicator;
                                                    mod_f_ExecutionReport_OrderAttributeTypes = (match c_mod_f_ExecutionReport_OrderAttributeTypes with
                                                        | None -> None
                                                        | Some d -> (Some (convert__full_to_model_OrderAttributeTypes d))
                                                    );
                                                    mod_f_ExecutionReport_ClOrdID = c_mod_f_ExecutionReport_ClOrdID;
                                                    mod_f_ExecutionReport_OrigClOrdID = c_mod_f_ExecutionReport_OrigClOrdID;
                                                    mod_f_ExecutionReport_TransactTime = c_mod_f_ExecutionReport_TransactTime;
                                                    mod_f_ExecutionReport_OrdRejReason = (match c_mod_f_ExecutionReport_OrdRejReason with
                                                        | None -> None
                                                        | Some d -> (Some (convert__full_to_model_OrdRejReason d))
                                                    );
                                                    mod_f_ExecutionReport_ExecRefID = c_mod_f_ExecutionReport_ExecRefID;
                                                    mod_f_ExecutionReport_LastPx = c_mod_f_ExecutionReport_LastPx;
                                                    mod_f_ExecutionReport_LastShares = c_mod_f_ExecutionReport_LastShares;
                                                    mod_f_ExecutionReport_OrdType = (match c_mod_f_ExecutionReport_OrdType with
                                                        | None -> None
                                                        | Some d -> (Some (convert__full_to_model_OrdType d))
                                                    );
                                                    mod_f_ExecutionReport_TimeInForce = (match c_mod_f_ExecutionReport_TimeInForce with
                                                        | None -> None
                                                        | Some d -> (Some (convert__full_to_model_TimeInForce d))
                                                    );
                                                    mod_f_ExecutionReport_ExecInst = (match c_mod_f_ExecutionReport_ExecInst with
                                                        | None -> None
                                                        | Some d -> (Some (convert__full_to_model_ExecInst d))
                                                    );
                                                    mod_f_ExecutionReport_Price = c_mod_f_ExecutionReport_Price;
                                                    mod_f_ExecutionReport_OrderQty = c_mod_f_ExecutionReport_OrderQty;
                                                    mod_f_ExecutionReport_PegDifference = c_mod_f_ExecutionReport_PegDifference;
                                                    mod_f_ExecutionReport_Account = c_mod_f_ExecutionReport_Account;
                                                    mod_f_ExecutionReport_ClientID = c_mod_f_ExecutionReport_ClientID;
                                                    mod_f_ExecutionReport_ClearingFirm = c_mod_f_ExecutionReport_ClearingFirm;
                                                    mod_f_ExecutionReport_OpenClose = (match c_mod_f_ExecutionReport_OpenClose with
                                                        | None -> None
                                                        | Some d -> (Some (convert__full_to_model_OpenClose d))
                                                    );
                                                    mod_f_ExecutionReport_Currency = (match c_mod_f_ExecutionReport_Currency with
                                                        | None -> None
                                                        | Some d -> (Some (convert__full_to_model_Currency d))
                                                    );
                                                    mod_f_ExecutionReport_TechnicalOrdType = (match c_mod_f_ExecutionReport_TechnicalOrdType with
                                                        | None -> None
                                                        | Some d -> (Some (convert__full_to_model_TechnicalOrdType d))
                                                    );
                                                    mod_f_ExecutionReport_CrossType = (match c_mod_f_ExecutionReport_CrossType with
                                                        | None -> None
                                                        | Some d -> (Some (convert__full_to_model_CrossType d))
                                                    );
                                                    mod_f_ExecutionReport_IMPTimestamp = c_mod_f_ExecutionReport_IMPTimestamp;
                                                    mod_f_ExecutionReport_Parties = c_mod_f_ExecutionReport_Parties;
                                                    mod_f_ExecutionReport_ContraGrp = c_mod_f_ExecutionReport_ContraGrp
                                                } in
                                                FIX_TL_Normal (FIX_Msg_ExecutionReport fix_msg_data)
                                            )
                                        )
                                    )
                                )
                            )
                        )
                    )
                )
            )
        )
    )
;;

let convert__full_to_model_OrderCancelReject (msg : full_fix_ordercancelreject_data)  =
    (match msg.f_OrderCancelReject_CxlRejResponseTo with
        | None -> (FIX_TL_Req_Field_Missing {
            field_missing_data_msg = M_Msg_OrderCancelReject_Tag;
            field_missing_data_field = M_Field_CxlRejResponseTo_Tag
        })
        | Some m_f_OrderCancelReject_CxlRejResponseTo -> let c_mod_f_OrderCancelReject_CxlRejResponseTo = m_f_OrderCancelReject_CxlRejResponseTo in
        (match msg.f_OrderCancelReject_CxlRejReason with
            | None -> (FIX_TL_Req_Field_Missing {
                field_missing_data_msg = M_Msg_OrderCancelReject_Tag;
                field_missing_data_field = M_Field_CxlRejReason_Tag
            })
            | Some m_f_OrderCancelReject_CxlRejReason -> let c_mod_f_OrderCancelReject_CxlRejReason = m_f_OrderCancelReject_CxlRejReason in
            (match msg.f_OrderCancelReject_Text with
                | None -> (FIX_TL_Req_Field_Missing {
                    field_missing_data_msg = M_Msg_OrderCancelReject_Tag;
                    field_missing_data_field = M_Field_Text_Tag
                })
                | Some m_f_OrderCancelReject_Text -> let c_mod_f_OrderCancelReject_Text = m_f_OrderCancelReject_Text in
                (match msg.f_OrderCancelReject_ErrorCode with
                    | None -> (FIX_TL_Req_Field_Missing {
                        field_missing_data_msg = M_Msg_OrderCancelReject_Tag;
                        field_missing_data_field = M_Field_ErrorCode_Tag
                    })
                    | Some m_f_OrderCancelReject_ErrorCode -> let c_mod_f_OrderCancelReject_ErrorCode = m_f_OrderCancelReject_ErrorCode in
                    (match msg.f_OrderCancelReject_OrdStatus with
                        | None -> (FIX_TL_Req_Field_Missing {
                            field_missing_data_msg = M_Msg_OrderCancelReject_Tag;
                            field_missing_data_field = M_Field_OrdStatus_Tag
                        })
                        | Some m_f_OrderCancelReject_OrdStatus -> let c_mod_f_OrderCancelReject_OrdStatus = m_f_OrderCancelReject_OrdStatus in
                        let c_mod_f_OrderCancelReject_ExecInst = msg.f_OrderCancelReject_ExecInst in
                        (match msg.f_OrderCancelReject_Symbol with
                            | None -> (FIX_TL_Req_Field_Missing {
                                field_missing_data_msg = M_Msg_OrderCancelReject_Tag;
                                field_missing_data_field = M_Field_Symbol_Tag
                            })
                            | Some m_f_OrderCancelReject_Symbol -> let c_mod_f_OrderCancelReject_Symbol = m_f_OrderCancelReject_Symbol in
                            let c_mod_f_OrderCancelReject_OrderID = msg.f_OrderCancelReject_OrderID in
                            let c_mod_f_OrderCancelReject_OrigClOrdID = msg.f_OrderCancelReject_OrigClOrdID in
                            let c_mod_f_OrderCancelReject_ClOrdID = msg.f_OrderCancelReject_ClOrdID in
                            let fix_msg_data = {
                                mod_f_OrderCancelReject_ClOrdID = c_mod_f_OrderCancelReject_ClOrdID;
                                mod_f_OrderCancelReject_OrigClOrdID = c_mod_f_OrderCancelReject_OrigClOrdID;
                                mod_f_OrderCancelReject_OrderID = c_mod_f_OrderCancelReject_OrderID;
                                mod_f_OrderCancelReject_Symbol = c_mod_f_OrderCancelReject_Symbol;
                                mod_f_OrderCancelReject_ExecInst = (match c_mod_f_OrderCancelReject_ExecInst with
                                    | None -> None
                                    | Some d -> (Some (convert__full_to_model_ExecInst d))
                                );
                                mod_f_OrderCancelReject_OrdStatus = convert__full_to_model_OrdStatus c_mod_f_OrderCancelReject_OrdStatus;
                                mod_f_OrderCancelReject_ErrorCode = c_mod_f_OrderCancelReject_ErrorCode;
                                mod_f_OrderCancelReject_Text = c_mod_f_OrderCancelReject_Text;
                                mod_f_OrderCancelReject_CxlRejReason = convert__full_to_model_CxlRejReason c_mod_f_OrderCancelReject_CxlRejReason;
                                mod_f_OrderCancelReject_CxlRejResponseTo = convert__full_to_model_CxlRejResponseTo c_mod_f_OrderCancelReject_CxlRejResponseTo
                            } in
                            FIX_TL_Normal (FIX_Msg_OrderCancelReject fix_msg_data)
                        )
                    )
                )
            )
        )
    )
;;

let convert__full_to_model_OrderMassCancelReport (msg : full_fix_ordermasscancelreport_data)  =
    let c_mod_f_OrderMassCancelReport_MIC = msg.f_OrderMassCancelReport_MIC in
    let c_mod_f_OrderMassCancelReport_TransactTime = msg.f_OrderMassCancelReport_TransactTime in
    (match msg.f_OrderMassCancelReport_TotalAffectedOrders with
        | None -> (FIX_TL_Req_Field_Missing {
            field_missing_data_msg = M_Msg_OrderMassCancelReport_Tag;
            field_missing_data_field = M_Field_TotalAffectedOrders_Tag
        })
        | Some m_f_OrderMassCancelReport_TotalAffectedOrders -> let c_mod_f_OrderMassCancelReport_TotalAffectedOrders = m_f_OrderMassCancelReport_TotalAffectedOrders in
        let c_mod_f_OrderMassCancelReport_CancelByLocationID = msg.f_OrderMassCancelReport_CancelByLocationID in
        let c_mod_f_OrderMassCancelReport_Account = msg.f_OrderMassCancelReport_Account in
        let c_mod_f_OrderMassCancelReport_Rule80A = msg.f_OrderMassCancelReport_Rule80A in
        let c_mod_f_OrderMassCancelReport_TechnicalOrdType = msg.f_OrderMassCancelReport_TechnicalOrdType in
        let c_mod_f_OrderMassCancelReport_Side = msg.f_OrderMassCancelReport_Side in
        (match msg.f_OrderMassCancelReport_MassCancelRequestType with
            | None -> (FIX_TL_Req_Field_Missing {
                field_missing_data_msg = M_Msg_OrderMassCancelReport_Tag;
                field_missing_data_field = M_Field_MassCancelRequestType_Tag
            })
            | Some m_f_OrderMassCancelReport_MassCancelRequestType -> let c_mod_f_OrderMassCancelReport_MassCancelRequestType = m_f_OrderMassCancelReport_MassCancelRequestType in
            let c_mod_f_OrderMassCancelReport_ClassID = msg.f_OrderMassCancelReport_ClassID in
            let c_mod_f_OrderMassCancelReport_Symbol = msg.f_OrderMassCancelReport_Symbol in
            let c_mod_f_OrderMassCancelReport_ClOrdID = msg.f_OrderMassCancelReport_ClOrdID in
            let fix_msg_data = {
                mod_f_OrderMassCancelReport_ClOrdID = c_mod_f_OrderMassCancelReport_ClOrdID;
                mod_f_OrderMassCancelReport_Symbol = c_mod_f_OrderMassCancelReport_Symbol;
                mod_f_OrderMassCancelReport_ClassID = c_mod_f_OrderMassCancelReport_ClassID;
                mod_f_OrderMassCancelReport_MassCancelRequestType = convert__full_to_model_MassCancelRequestType c_mod_f_OrderMassCancelReport_MassCancelRequestType;
                mod_f_OrderMassCancelReport_Side = (match c_mod_f_OrderMassCancelReport_Side with
                    | None -> None
                    | Some d -> (Some (convert__full_to_model_Side d))
                );
                mod_f_OrderMassCancelReport_TechnicalOrdType = (match c_mod_f_OrderMassCancelReport_TechnicalOrdType with
                    | None -> None
                    | Some d -> (Some (convert__full_to_model_TechnicalOrdType d))
                );
                mod_f_OrderMassCancelReport_Rule80A = (match c_mod_f_OrderMassCancelReport_Rule80A with
                    | None -> None
                    | Some d -> (Some (convert__full_to_model_Rule80A d))
                );
                mod_f_OrderMassCancelReport_Account = c_mod_f_OrderMassCancelReport_Account;
                mod_f_OrderMassCancelReport_CancelByLocationID = c_mod_f_OrderMassCancelReport_CancelByLocationID;
                mod_f_OrderMassCancelReport_TotalAffectedOrders = c_mod_f_OrderMassCancelReport_TotalAffectedOrders;
                mod_f_OrderMassCancelReport_TransactTime = c_mod_f_OrderMassCancelReport_TransactTime;
                mod_f_OrderMassCancelReport_MIC = c_mod_f_OrderMassCancelReport_MIC
            } in
            FIX_TL_Normal (FIX_Msg_OrderMassCancelReport fix_msg_data)
        )
    )
;;

let convert_full_to_model_fix (msg : full_app_msg_data)  =
    (match msg with
        | FIX_Full_Msg_OrderSingle msg_data -> (convert__full_to_model_OrderSingle msg_data)
        | FIX_Full_Msg_OrderCancelReplaceRequest msg_data -> (convert__full_to_model_OrderCancelReplaceRequest msg_data)
        | FIX_Full_Msg_OrderCancelRequest msg_data -> (convert__full_to_model_OrderCancelRequest msg_data)
        | FIX_Full_Msg_OrderMassCancelRequest msg_data -> (convert__full_to_model_OrderMassCancelRequest msg_data)
        | FIX_Full_Msg_ExecutionReport msg_data -> (convert__full_to_model_ExecutionReport msg_data)
        | FIX_Full_Msg_OrderCancelReject msg_data -> (convert__full_to_model_OrderCancelReject msg_data)
        | FIX_Full_Msg_OrderMassCancelReport msg_data -> (convert__full_to_model_OrderMassCancelReport msg_data)
    )
;;

let convert__model_to_full_OrderSingle (msg : mod_ordersingle_data)  =
    FIX_Full_Msg_OrderSingle {
        f_OrderSingle_ClOrdID = Some msg.mod_f_OrderSingle_ClOrdID;
        f_OrderSingle_ClientID = None;
        f_OrderSingle_ExecBroker = None;
        f_OrderSingle_Account = None;
        f_OrderSingle_SettlmntTyp = None;
        f_OrderSingle_FutSettDate = None;
        f_OrderSingle_HandlInst = Some (convert__model_to_full_HandlInst msg.mod_f_OrderSingle_HandlInst);
        f_OrderSingle_ExecInst = (match msg.mod_f_OrderSingle_ExecInst with
            | None -> None
            | Some d -> (Some (convert__model_to_full_ExecInst d))
        );
        f_OrderSingle_MinQty = msg.mod_f_OrderSingle_MinQty;
        f_OrderSingle_MaxFloor = None;
        f_OrderSingle_ExDestination = None;
        f_OrderSingle_ProcessCode = None;
        f_OrderSingle_Symbol = Some msg.mod_f_OrderSingle_Symbol;
        f_OrderSingle_SymbolSfx = None;
        f_OrderSingle_SecurityID = None;
        f_OrderSingle_IDSource = None;
        f_OrderSingle_SecurityType = None;
        f_OrderSingle_MaturityMonthYear = None;
        f_OrderSingle_MaturityDay = None;
        f_OrderSingle_PutOrCall = None;
        f_OrderSingle_StrikePrice = None;
        f_OrderSingle_OptAttribute = None;
        f_OrderSingle_ContractMultiplier = None;
        f_OrderSingle_CouponRate = None;
        f_OrderSingle_SecurityExchange = None;
        f_OrderSingle_Issuer = None;
        f_OrderSingle_EncodedIssuerLen = None;
        f_OrderSingle_EncodedIssuer = None;
        f_OrderSingle_SecurityDesc = None;
        f_OrderSingle_EncodedSecurityDescLen = None;
        f_OrderSingle_EncodedSecurityDesc = None;
        f_OrderSingle_PrevClosePx = None;
        f_OrderSingle_Side = Some (convert__model_to_full_Side msg.mod_f_OrderSingle_Side);
        f_OrderSingle_LocateReqd = None;
        f_OrderSingle_TransactTime = Some msg.mod_f_OrderSingle_TransactTime;
        f_OrderSingle_OrderQty = Some msg.mod_f_OrderSingle_OrderQty;
        f_OrderSingle_CashOrderQty = None;
        f_OrderSingle_OrdType = Some (convert__model_to_full_OrdType msg.mod_f_OrderSingle_OrdType);
        f_OrderSingle_Price = msg.mod_f_OrderSingle_Price;
        f_OrderSingle_StopPx = None;
        f_OrderSingle_Currency = (match msg.mod_f_OrderSingle_Currency with
            | None -> None
            | Some d -> (Some (convert__model_to_full_Currency d))
        );
        f_OrderSingle_ComplianceID = None;
        f_OrderSingle_SolicitedFlag = None;
        f_OrderSingle_IOIid = None;
        f_OrderSingle_QuoteID = None;
        f_OrderSingle_TimeInForce = (match msg.mod_f_OrderSingle_TimeInForce with
            | None -> None
            | Some d -> (Some (convert__model_to_full_TimeInForce d))
        );
        f_OrderSingle_EffectiveTime = None;
        f_OrderSingle_ExpireDate = None;
        f_OrderSingle_ExpireTime = None;
        f_OrderSingle_GTBookingInst = None;
        f_OrderSingle_Commission = None;
        f_OrderSingle_CommType = None;
        f_OrderSingle_Rule80A = None;
        f_OrderSingle_ForexReq = None;
        f_OrderSingle_SettlCurrency = None;
        f_OrderSingle_Text = None;
        f_OrderSingle_EncodedTextLen = None;
        f_OrderSingle_EncodedText = None;
        f_OrderSingle_FutSettDate2 = None;
        f_OrderSingle_OrderQty2 = None;
        f_OrderSingle_OpenClose = None;
        f_OrderSingle_CoveredOrUncovered = None;
        f_OrderSingle_CustomerOrFirm = None;
        f_OrderSingle_MaxShow = None;
        f_OrderSingle_PegDifference = msg.mod_f_OrderSingle_PegDifference;
        f_OrderSingle_DiscretionInst = None;
        f_OrderSingle_DiscretionOffset = None;
        f_OrderSingle_ClearingFirm = None;
        f_OrderSingle_ClearingAccount = None;
        f_OrderSingle_OrderSingleAllocs = [];
        f_OrderSingle_OrderSingleTradingSessions = [];
        f_OrderSingle_TechnicalOrdType = Some (convert__model_to_full_TechnicalOrdType msg.mod_f_OrderSingle_TechnicalOrdType);
        f_OrderSingle_BookIndicator = (match msg.mod_f_OrderSingle_BookIndicator with
            | None -> None
            | Some d -> (Some (convert__model_to_full_BookIndicator d))
        );
        f_OrderSingle_MIC = Some msg.mod_f_OrderSingle_MIC;
        f_OrderSingle_BrokerPrioritization = Some (convert__model_to_full_BrokerPrioritization msg.mod_f_OrderSingle_BrokerPrioritization);
        f_OrderSingle_DEAIndicator = Some msg.mod_f_OrderSingle_DEAIndicator;
        f_OrderSingle_OrderAttributeTypes = (match msg.mod_f_OrderSingle_OrderAttributeTypes with
            | None -> None
            | Some d -> (Some (convert__model_to_full_OrderAttributeTypes d list_model_vals_OrderAttributeTypes))
        );
        f_OrderSingle_Parties = convert__model_to_full_Parties msg.mod_f_OrderSingle_Parties;
        f_OrderSingle_ClearingEntries = convert__model_to_full_ClearingEntries msg.mod_f_OrderSingle_ClearingEntries
    }
;;

let convert__model_to_full_OrderCancelReplaceRequest (msg : mod_ordercancelreplacerequest_data)  =
    FIX_Full_Msg_OrderCancelReplaceRequest {
        f_OrderCancelReplaceRequest_OrderID = msg.mod_f_OrderCancelReplaceRequest_OrderID;
        f_OrderCancelReplaceRequest_ClientID = msg.mod_f_OrderCancelReplaceRequest_ClientID;
        f_OrderCancelReplaceRequest_ExecBroker = None;
        f_OrderCancelReplaceRequest_OrigClOrdID = Some msg.mod_f_OrderCancelReplaceRequest_OrigClOrdID;
        f_OrderCancelReplaceRequest_ClOrdID = Some msg.mod_f_OrderCancelReplaceRequest_ClOrdID;
        f_OrderCancelReplaceRequest_ListID = None;
        f_OrderCancelReplaceRequest_Account = msg.mod_f_OrderCancelReplaceRequest_Account;
        f_OrderCancelReplaceRequest_SettlmntTyp = None;
        f_OrderCancelReplaceRequest_FutSettDate = None;
        f_OrderCancelReplaceRequest_HandlInst = None;
        f_OrderCancelReplaceRequest_ExecInst = (match msg.mod_f_OrderCancelReplaceRequest_ExecInst with
            | None -> None
            | Some d -> (Some (convert__model_to_full_ExecInst d))
        );
        f_OrderCancelReplaceRequest_MinQty = None;
        f_OrderCancelReplaceRequest_MaxFloor = None;
        f_OrderCancelReplaceRequest_ExDestination = None;
        f_OrderCancelReplaceRequest_Symbol = Some msg.mod_f_OrderCancelReplaceRequest_Symbol;
        f_OrderCancelReplaceRequest_SymbolSfx = None;
        f_OrderCancelReplaceRequest_SecurityID = None;
        f_OrderCancelReplaceRequest_IDSource = None;
        f_OrderCancelReplaceRequest_SecurityType = None;
        f_OrderCancelReplaceRequest_MaturityMonthYear = None;
        f_OrderCancelReplaceRequest_MaturityDay = None;
        f_OrderCancelReplaceRequest_PutOrCall = None;
        f_OrderCancelReplaceRequest_StrikePrice = None;
        f_OrderCancelReplaceRequest_OptAttribute = None;
        f_OrderCancelReplaceRequest_ContractMultiplier = None;
        f_OrderCancelReplaceRequest_CouponRate = None;
        f_OrderCancelReplaceRequest_SecurityExchange = None;
        f_OrderCancelReplaceRequest_Issuer = None;
        f_OrderCancelReplaceRequest_EncodedIssuerLen = None;
        f_OrderCancelReplaceRequest_EncodedIssuer = None;
        f_OrderCancelReplaceRequest_SecurityDesc = None;
        f_OrderCancelReplaceRequest_EncodedSecurityDescLen = None;
        f_OrderCancelReplaceRequest_EncodedSecurityDesc = None;
        f_OrderCancelReplaceRequest_Side = Some (convert__model_to_full_Side msg.mod_f_OrderCancelReplaceRequest_Side);
        f_OrderCancelReplaceRequest_TransactTime = None;
        f_OrderCancelReplaceRequest_OrderQty = Some msg.mod_f_OrderCancelReplaceRequest_OrderQty;
        f_OrderCancelReplaceRequest_CashOrderQty = None;
        f_OrderCancelReplaceRequest_OrdType = Some (convert__model_to_full_OrdType msg.mod_f_OrderCancelReplaceRequest_OrdType);
        f_OrderCancelReplaceRequest_Price = msg.mod_f_OrderCancelReplaceRequest_Price;
        f_OrderCancelReplaceRequest_StopPx = None;
        f_OrderCancelReplaceRequest_PegDifference = msg.mod_f_OrderCancelReplaceRequest_PegDifference;
        f_OrderCancelReplaceRequest_DiscretionInst = None;
        f_OrderCancelReplaceRequest_DiscretionOffset = None;
        f_OrderCancelReplaceRequest_ComplianceID = None;
        f_OrderCancelReplaceRequest_SolicitedFlag = None;
        f_OrderCancelReplaceRequest_Currency = (match msg.mod_f_OrderCancelReplaceRequest_Currency with
            | None -> None
            | Some d -> (Some (convert__model_to_full_Currency d))
        );
        f_OrderCancelReplaceRequest_TimeInForce = (match msg.mod_f_OrderCancelReplaceRequest_TimeInForce with
            | None -> None
            | Some d -> (Some (convert__model_to_full_TimeInForce d))
        );
        f_OrderCancelReplaceRequest_EffectiveTime = None;
        f_OrderCancelReplaceRequest_ExpireDate = None;
        f_OrderCancelReplaceRequest_ExpireTime = None;
        f_OrderCancelReplaceRequest_GTBookingInst = None;
        f_OrderCancelReplaceRequest_Commission = None;
        f_OrderCancelReplaceRequest_CommType = None;
        f_OrderCancelReplaceRequest_Rule80A = Some (convert__model_to_full_Rule80A msg.mod_f_OrderCancelReplaceRequest_Rule80A);
        f_OrderCancelReplaceRequest_ForexReq = None;
        f_OrderCancelReplaceRequest_SettlCurrency = None;
        f_OrderCancelReplaceRequest_Text = None;
        f_OrderCancelReplaceRequest_EncodedTextLen = None;
        f_OrderCancelReplaceRequest_EncodedText = None;
        f_OrderCancelReplaceRequest_FutSettDate2 = None;
        f_OrderCancelReplaceRequest_OrderQty2 = None;
        f_OrderCancelReplaceRequest_OpenClose = (match msg.mod_f_OrderCancelReplaceRequest_OpenClose with
            | None -> None
            | Some d -> (Some (convert__model_to_full_OpenClose d))
        );
        f_OrderCancelReplaceRequest_CoveredOrUncovered = None;
        f_OrderCancelReplaceRequest_CustomerOrFirm = None;
        f_OrderCancelReplaceRequest_MaxShow = None;
        f_OrderCancelReplaceRequest_LocateReqd = None;
        f_OrderCancelReplaceRequest_ClearingFirm = msg.mod_f_OrderCancelReplaceRequest_ClearingFirm;
        f_OrderCancelReplaceRequest_ClearingAccount = None;
        f_OrderCancelReplaceRequest_OrderCancelReplaceRequestAllocs = [];
        f_OrderCancelReplaceRequest_OrderCancelReplaceRequestTradingSessions = [];
        f_OrderCancelReplaceRequest_TechnicalOrdType = (match msg.mod_f_OrderCancelReplaceRequest_TechnicalOrdType with
            | None -> None
            | Some d -> (Some (convert__model_to_full_TechnicalOrdType d))
        );
        f_OrderCancelReplaceRequest_FreeText = msg.mod_f_OrderCancelReplaceRequest_FreeText;
        f_OrderCancelReplaceRequest_ClearingHandlingType = (match msg.mod_f_OrderCancelReplaceRequest_ClearingHandlingType with
            | None -> None
            | Some d -> (Some (convert__model_to_full_ClearingHandlingType d))
        );
        f_OrderCancelReplaceRequest_MIC = msg.mod_f_OrderCancelReplaceRequest_MIC;
        f_OrderCancelReplaceRequest_DEAIndicator = None;
        f_OrderCancelReplaceRequest_Parties = []
    }
;;

let convert__model_to_full_OrderCancelRequest (msg : mod_ordercancelrequest_data)  =
    FIX_Full_Msg_OrderCancelRequest {
        f_OrderCancelRequest_OrigClOrdID = Some msg.mod_f_OrderCancelRequest_OrigClOrdID;
        f_OrderCancelRequest_OrderID = msg.mod_f_OrderCancelRequest_OrderID;
        f_OrderCancelRequest_ClOrdID = Some msg.mod_f_OrderCancelRequest_ClOrdID;
        f_OrderCancelRequest_ListID = None;
        f_OrderCancelRequest_Account = None;
        f_OrderCancelRequest_ClientID = None;
        f_OrderCancelRequest_ExecBroker = None;
        f_OrderCancelRequest_Symbol = Some msg.mod_f_OrderCancelRequest_Symbol;
        f_OrderCancelRequest_SymbolSfx = None;
        f_OrderCancelRequest_SecurityID = None;
        f_OrderCancelRequest_IDSource = None;
        f_OrderCancelRequest_SecurityType = None;
        f_OrderCancelRequest_MaturityMonthYear = None;
        f_OrderCancelRequest_MaturityDay = None;
        f_OrderCancelRequest_PutOrCall = None;
        f_OrderCancelRequest_StrikePrice = None;
        f_OrderCancelRequest_OptAttribute = None;
        f_OrderCancelRequest_ContractMultiplier = None;
        f_OrderCancelRequest_CouponRate = None;
        f_OrderCancelRequest_SecurityExchange = None;
        f_OrderCancelRequest_Issuer = None;
        f_OrderCancelRequest_EncodedIssuerLen = None;
        f_OrderCancelRequest_EncodedIssuer = None;
        f_OrderCancelRequest_SecurityDesc = None;
        f_OrderCancelRequest_EncodedSecurityDescLen = None;
        f_OrderCancelRequest_EncodedSecurityDesc = None;
        f_OrderCancelRequest_Side = None;
        f_OrderCancelRequest_TransactTime = msg.mod_f_OrderCancelRequest_TransactTime;
        f_OrderCancelRequest_OrderQty = msg.mod_f_OrderCancelRequest_OrderQty;
        f_OrderCancelRequest_CashOrderQty = None;
        f_OrderCancelRequest_ComplianceID = None;
        f_OrderCancelRequest_SolicitedFlag = None;
        f_OrderCancelRequest_Text = None;
        f_OrderCancelRequest_EncodedTextLen = None;
        f_OrderCancelRequest_EncodedText = None;
        f_OrderCancelRequest_MIC = msg.mod_f_OrderCancelRequest_MIC;
        f_OrderCancelRequest_Currency = (match msg.mod_f_OrderCancelRequest_Currency with
            | None -> None
            | Some d -> (Some (convert__model_to_full_Currency d))
        )
    }
;;

let convert__model_to_full_OrderMassCancelRequest (msg : mod_ordermasscancelrequest_data)  =
    FIX_Full_Msg_OrderMassCancelRequest {
        f_OrderMassCancelRequest_ClOrdID = msg.mod_f_OrderMassCancelRequest_ClOrdID;
        f_OrderMassCancelRequest_SecondaryClOrdID = None;
        f_OrderMassCancelRequest_MassCancelRequestType = (match msg.mod_f_OrderMassCancelRequest_MassCancelRequestType with
            | None -> None
            | Some d -> (Some (convert__model_to_full_MassCancelRequestType d))
        );
        f_OrderMassCancelRequest_TradingSessionID = None;
        f_OrderMassCancelRequest_TradingSessionSubID = None;
        f_OrderMassCancelRequest_Instrument = {
            f_Instrument_Symbol = None;
            f_Instrument_SymbolSfx = None;
            f_Instrument_SecurityID = None;
            f_Instrument_SecurityIDSource = None;
            f_Instrument_SecAltIDGrp = [];
            f_Instrument_Product = None;
            f_Instrument_CFICode = None;
            f_Instrument_SecurityType = None;
            f_Instrument_SecuritySubType = None;
            f_Instrument_MaturityMonthYear = None;
            f_Instrument_MaturityDate = None;
            f_Instrument_CouponPaymentDate = None;
            f_Instrument_IssueDate = None;
            f_Instrument_RepoCollateralSecurityType = None;
            f_Instrument_RepurchaseTerm = None;
            f_Instrument_RepurchaseRate = None;
            f_Instrument_Factor = None;
            f_Instrument_CreditRating = None;
            f_Instrument_InstrRegistry = None;
            f_Instrument_CountryOfIssue = None;
            f_Instrument_StateOrProvinceOfIssue = None;
            f_Instrument_LocaleOfIssue = None;
            f_Instrument_RedemptionDate = None;
            f_Instrument_StrikePrice = None;
            f_Instrument_StrikeCurrency = None;
            f_Instrument_OptAttribute = None;
            f_Instrument_ContractMultiplier = None;
            f_Instrument_CouponRate = None;
            f_Instrument_SecurityExchange = None;
            f_Instrument_Issuer = None;
            f_Instrument_EncodedIssuerLen = None;
            f_Instrument_EncodedIssuer = None;
            f_Instrument_SecurityDesc = None;
            f_Instrument_EncodedSecurityDescLen = None;
            f_Instrument_EncodedSecurityDesc = None;
            f_Instrument_Pool = None;
            f_Instrument_ContractSettlMonth = None;
            f_Instrument_CPProgram = None;
            f_Instrument_CPRegType = None;
            f_Instrument_EvntGrp = [];
            f_Instrument_DatedDate = None;
            f_Instrument_InterestAccrualDate = None
        };
        f_OrderMassCancelRequest_UnderlyingInstrument = {
            f_UnderlyingInstrument_UnderlyingSymbol = None;
            f_UnderlyingInstrument_UnderlyingSymbolSfx = None;
            f_UnderlyingInstrument_UnderlyingSecurityID = None;
            f_UnderlyingInstrument_UnderlyingSecurityIDSource = None;
            f_UnderlyingInstrument_UndSecAltIDGrp = [];
            f_UnderlyingInstrument_UnderlyingProduct = None;
            f_UnderlyingInstrument_UnderlyingCFICode = None;
            f_UnderlyingInstrument_UnderlyingSecurityType = None;
            f_UnderlyingInstrument_UnderlyingSecuritySubType = None;
            f_UnderlyingInstrument_UnderlyingMaturityMonthYear = None;
            f_UnderlyingInstrument_UnderlyingMaturityDate = None;
            f_UnderlyingInstrument_UnderlyingCouponPaymentDate = None;
            f_UnderlyingInstrument_UnderlyingIssueDate = None;
            f_UnderlyingInstrument_UnderlyingRepoCollateralSecurityType = None;
            f_UnderlyingInstrument_UnderlyingRepurchaseTerm = None;
            f_UnderlyingInstrument_UnderlyingRepurchaseRate = None;
            f_UnderlyingInstrument_UnderlyingFactor = None;
            f_UnderlyingInstrument_UnderlyingCreditRating = None;
            f_UnderlyingInstrument_UnderlyingInstrRegistry = None;
            f_UnderlyingInstrument_UnderlyingCountryOfIssue = None;
            f_UnderlyingInstrument_UnderlyingStateOrProvinceOfIssue = None;
            f_UnderlyingInstrument_UnderlyingLocaleOfIssue = None;
            f_UnderlyingInstrument_UnderlyingRedemptionDate = None;
            f_UnderlyingInstrument_UnderlyingStrikePrice = None;
            f_UnderlyingInstrument_UnderlyingStrikeCurrency = None;
            f_UnderlyingInstrument_UnderlyingOptAttribute = None;
            f_UnderlyingInstrument_UnderlyingContractMultiplier = None;
            f_UnderlyingInstrument_UnderlyingCouponRate = None;
            f_UnderlyingInstrument_UnderlyingSecurityExchange = None;
            f_UnderlyingInstrument_UnderlyingIssuer = None;
            f_UnderlyingInstrument_EncodedUnderlyingIssuerLen = None;
            f_UnderlyingInstrument_EncodedUnderlyingIssuer = None;
            f_UnderlyingInstrument_UnderlyingSecurityDesc = None;
            f_UnderlyingInstrument_EncodedUnderlyingSecurityDescLen = None;
            f_UnderlyingInstrument_EncodedUnderlyingSecurityDesc = None;
            f_UnderlyingInstrument_UnderlyingCPProgram = None;
            f_UnderlyingInstrument_UnderlyingCPRegType = None;
            f_UnderlyingInstrument_UnderlyingCurrency = None;
            f_UnderlyingInstrument_UnderlyingQty = None;
            f_UnderlyingInstrument_UnderlyingPx = None;
            f_UnderlyingInstrument_UnderlyingDirtyPrice = None;
            f_UnderlyingInstrument_UnderlyingEndPrice = None;
            f_UnderlyingInstrument_UnderlyingStartValue = None;
            f_UnderlyingInstrument_UnderlyingCurrentValue = None;
            f_UnderlyingInstrument_UnderlyingEndValue = None;
            f_UnderlyingInstrument_UnderlyingStipulations = []
        };
        f_OrderMassCancelRequest_Side = (match msg.mod_f_OrderMassCancelRequest_Side with
            | None -> None
            | Some d -> (Some (convert__model_to_full_Side d))
        );
        f_OrderMassCancelRequest_TransactTime = msg.mod_f_OrderMassCancelRequest_TransactTime;
        f_OrderMassCancelRequest_Text = None;
        f_OrderMassCancelRequest_EncodedTextLen = None;
        f_OrderMassCancelRequest_EncodedText = None;
        f_OrderMassCancelRequest_Account = msg.mod_f_OrderMassCancelRequest_Account;
        f_OrderMassCancelRequest_Symbol = msg.mod_f_OrderMassCancelRequest_Symbol;
        f_OrderMassCancelRequest_ClassID = msg.mod_f_OrderMassCancelRequest_ClassID;
        f_OrderMassCancelRequest_TechnicalOrdType = (match msg.mod_f_OrderMassCancelRequest_TechnicalOrdType with
            | None -> None
            | Some d -> (Some (convert__model_to_full_TechnicalOrdType d))
        );
        f_OrderMassCancelRequest_Rule80A = (match msg.mod_f_OrderMassCancelRequest_Rule80A with
            | None -> None
            | Some d -> (Some (convert__model_to_full_Rule80A d))
        );
        f_OrderMassCancelRequest_CancelByLocationID = msg.mod_f_OrderMassCancelRequest_CancelByLocationID
    }
;;

let convert__model_to_full_ExecutionReport (msg : mod_executionreport_data)  =
    FIX_Full_Msg_ExecutionReport {
        f_ExecutionReport_OrderID = msg.mod_f_ExecutionReport_OrderID;
        f_ExecutionReport_SecondaryOrderID = None;
        f_ExecutionReport_ClOrdID = msg.mod_f_ExecutionReport_ClOrdID;
        f_ExecutionReport_OrigClOrdID = msg.mod_f_ExecutionReport_OrigClOrdID;
        f_ExecutionReport_ClientID = msg.mod_f_ExecutionReport_ClientID;
        f_ExecutionReport_ExecBroker = None;
        f_ExecutionReport_ListID = None;
        f_ExecutionReport_ExecID = Some msg.mod_f_ExecutionReport_ExecID;
        f_ExecutionReport_ExecTransType = Some (convert__model_to_full_ExecTransType msg.mod_f_ExecutionReport_ExecTransType);
        f_ExecutionReport_ExecRefID = msg.mod_f_ExecutionReport_ExecRefID;
        f_ExecutionReport_ExecType = Some (convert__model_to_full_ExecType msg.mod_f_ExecutionReport_ExecType);
        f_ExecutionReport_OrdStatus = Some (convert__model_to_full_OrdStatus msg.mod_f_ExecutionReport_OrdStatus);
        f_ExecutionReport_OrdRejReason = (match msg.mod_f_ExecutionReport_OrdRejReason with
            | None -> None
            | Some d -> (Some (convert__model_to_full_OrdRejReason d))
        );
        f_ExecutionReport_ExecRestatementReason = None;
        f_ExecutionReport_Account = msg.mod_f_ExecutionReport_Account;
        f_ExecutionReport_SettlmntTyp = None;
        f_ExecutionReport_FutSettDate = None;
        f_ExecutionReport_Symbol = msg.mod_f_ExecutionReport_Symbol;
        f_ExecutionReport_SymbolSfx = None;
        f_ExecutionReport_SecurityID = None;
        f_ExecutionReport_IDSource = None;
        f_ExecutionReport_SecurityType = None;
        f_ExecutionReport_MaturityMonthYear = None;
        f_ExecutionReport_MaturityDay = None;
        f_ExecutionReport_PutOrCall = None;
        f_ExecutionReport_StrikePrice = None;
        f_ExecutionReport_OptAttribute = None;
        f_ExecutionReport_ContractMultiplier = None;
        f_ExecutionReport_CouponRate = None;
        f_ExecutionReport_SecurityExchange = None;
        f_ExecutionReport_Issuer = None;
        f_ExecutionReport_EncodedIssuerLen = None;
        f_ExecutionReport_EncodedIssuer = None;
        f_ExecutionReport_SecurityDesc = None;
        f_ExecutionReport_EncodedSecurityDescLen = None;
        f_ExecutionReport_EncodedSecurityDesc = None;
        f_ExecutionReport_Side = Some (convert__model_to_full_Side msg.mod_f_ExecutionReport_Side);
        f_ExecutionReport_OrderQty = msg.mod_f_ExecutionReport_OrderQty;
        f_ExecutionReport_CashOrderQty = None;
        f_ExecutionReport_OrdType = (match msg.mod_f_ExecutionReport_OrdType with
            | None -> None
            | Some d -> (Some (convert__model_to_full_OrdType d))
        );
        f_ExecutionReport_Price = msg.mod_f_ExecutionReport_Price;
        f_ExecutionReport_StopPx = None;
        f_ExecutionReport_PegDifference = msg.mod_f_ExecutionReport_PegDifference;
        f_ExecutionReport_DiscretionInst = None;
        f_ExecutionReport_DiscretionOffset = None;
        f_ExecutionReport_Currency = (match msg.mod_f_ExecutionReport_Currency with
            | None -> None
            | Some d -> (Some (convert__model_to_full_Currency d))
        );
        f_ExecutionReport_ComplianceID = None;
        f_ExecutionReport_SolicitedFlag = None;
        f_ExecutionReport_TimeInForce = (match msg.mod_f_ExecutionReport_TimeInForce with
            | None -> None
            | Some d -> (Some (convert__model_to_full_TimeInForce d))
        );
        f_ExecutionReport_EffectiveTime = None;
        f_ExecutionReport_ExpireDate = None;
        f_ExecutionReport_ExpireTime = None;
        f_ExecutionReport_ExecInst = (match msg.mod_f_ExecutionReport_ExecInst with
            | None -> None
            | Some d -> (Some (convert__model_to_full_ExecInst d))
        );
        f_ExecutionReport_Rule80A = None;
        f_ExecutionReport_LastShares = msg.mod_f_ExecutionReport_LastShares;
        f_ExecutionReport_LastPx = msg.mod_f_ExecutionReport_LastPx;
        f_ExecutionReport_LastSpotRate = None;
        f_ExecutionReport_LastForwardPoints = None;
        f_ExecutionReport_LastMkt = None;
        f_ExecutionReport_TradingSessionID = None;
        f_ExecutionReport_LastCapacity = None;
        f_ExecutionReport_LeavesQty = Some msg.mod_f_ExecutionReport_LeavesQty;
        f_ExecutionReport_CumQty = Some msg.mod_f_ExecutionReport_CumQty;
        f_ExecutionReport_AvgPx = Some msg.mod_f_ExecutionReport_AvgPx;
        f_ExecutionReport_DayOrderQty = None;
        f_ExecutionReport_DayCumQty = None;
        f_ExecutionReport_DayAvgPx = None;
        f_ExecutionReport_GTBookingInst = None;
        f_ExecutionReport_TradeDate = None;
        f_ExecutionReport_TransactTime = msg.mod_f_ExecutionReport_TransactTime;
        f_ExecutionReport_ReportToExch = None;
        f_ExecutionReport_Commission = None;
        f_ExecutionReport_CommType = None;
        f_ExecutionReport_GrossTradeAmt = None;
        f_ExecutionReport_SettlCurrAmt = None;
        f_ExecutionReport_SettlCurrency = None;
        f_ExecutionReport_SettlCurrFxRate = None;
        f_ExecutionReport_SettlCurrFxRateCalc = None;
        f_ExecutionReport_HandlInst = None;
        f_ExecutionReport_MinQty = None;
        f_ExecutionReport_MaxFloor = None;
        f_ExecutionReport_OpenClose = (match msg.mod_f_ExecutionReport_OpenClose with
            | None -> None
            | Some d -> (Some (convert__model_to_full_OpenClose d))
        );
        f_ExecutionReport_MaxShow = None;
        f_ExecutionReport_Text = Some msg.mod_f_ExecutionReport_Text;
        f_ExecutionReport_EncodedTextLen = None;
        f_ExecutionReport_EncodedText = None;
        f_ExecutionReport_FutSettDate2 = None;
        f_ExecutionReport_OrderQty2 = None;
        f_ExecutionReport_ClearingFirm = msg.mod_f_ExecutionReport_ClearingFirm;
        f_ExecutionReport_ClearingAccount = None;
        f_ExecutionReport_MultiLegReportingType = None;
        f_ExecutionReport_ExecutionReportContraBrokers = [];
        f_ExecutionReport_CrossType = (match msg.mod_f_ExecutionReport_CrossType with
            | None -> None
            | Some d -> (Some (convert__model_to_full_CrossType d))
        );
        f_ExecutionReport_TechnicalOrdType = (match msg.mod_f_ExecutionReport_TechnicalOrdType with
            | None -> None
            | Some d -> (Some (convert__model_to_full_TechnicalOrdType d))
        );
        f_ExecutionReport_FreeText = msg.mod_f_ExecutionReport_FreeText;
        f_ExecutionReport_ClearingHandlingType = (match msg.mod_f_ExecutionReport_ClearingHandlingType with
            | None -> None
            | Some d -> (Some (convert__model_to_full_ClearingHandlingType d))
        );
        f_ExecutionReport_UTPExID = msg.mod_f_ExecutionReport_UTPExID;
        f_ExecutionReport_LiquidityIndicator = (match msg.mod_f_ExecutionReport_LiquidityIndicator with
            | None -> None
            | Some d -> (Some (convert__model_to_full_LiquidityIndicator d))
        );
        f_ExecutionReport_ErrorCode = msg.mod_f_ExecutionReport_ErrorCode;
        f_ExecutionReport_MIC = msg.mod_f_ExecutionReport_MIC;
        f_ExecutionReport_BookIndicator = (match msg.mod_f_ExecutionReport_BookIndicator with
            | None -> None
            | Some d -> (Some (convert__model_to_full_BookIndicator d))
        );
        f_ExecutionReport_BrokerPrioritization = (match msg.mod_f_ExecutionReport_BrokerPrioritization with
            | None -> None
            | Some d -> (Some (convert__model_to_full_BrokerPrioritization d))
        );
        f_ExecutionReport_IMPTimestamp = msg.mod_f_ExecutionReport_IMPTimestamp;
        f_ExecutionReport_DEAIndicator = msg.mod_f_ExecutionReport_DEAIndicator;
        f_ExecutionReport_OrderAttributeTypes = (match msg.mod_f_ExecutionReport_OrderAttributeTypes with
            | None -> None
            | Some d -> (Some (convert__model_to_full_OrderAttributeTypes d list_model_vals_OrderAttributeTypes))
        );
        f_ExecutionReport_Parties = convert__model_to_full_Parties msg.mod_f_ExecutionReport_Parties;
        f_ExecutionReport_ContraGrp = convert__model_to_full_ContraGrp msg.mod_f_ExecutionReport_ContraGrp
    }
;;

let convert__model_to_full_OrderCancelReject (msg : mod_ordercancelreject_data)  =
    FIX_Full_Msg_OrderCancelReject {
        f_OrderCancelReject_OrderID = msg.mod_f_OrderCancelReject_OrderID;
        f_OrderCancelReject_SecondaryOrderID = None;
        f_OrderCancelReject_ClOrdID = msg.mod_f_OrderCancelReject_ClOrdID;
        f_OrderCancelReject_OrigClOrdID = msg.mod_f_OrderCancelReject_OrigClOrdID;
        f_OrderCancelReject_OrdStatus = Some (convert__model_to_full_OrdStatus msg.mod_f_OrderCancelReject_OrdStatus);
        f_OrderCancelReject_ClientID = None;
        f_OrderCancelReject_ExecBroker = None;
        f_OrderCancelReject_ListID = None;
        f_OrderCancelReject_Account = None;
        f_OrderCancelReject_TransactTime = None;
        f_OrderCancelReject_CxlRejResponseTo = Some (convert__model_to_full_CxlRejResponseTo msg.mod_f_OrderCancelReject_CxlRejResponseTo);
        f_OrderCancelReject_CxlRejReason = Some (convert__model_to_full_CxlRejReason msg.mod_f_OrderCancelReject_CxlRejReason);
        f_OrderCancelReject_Text = Some msg.mod_f_OrderCancelReject_Text;
        f_OrderCancelReject_EncodedTextLen = None;
        f_OrderCancelReject_EncodedText = None;
        f_OrderCancelReject_ErrorCode = Some msg.mod_f_OrderCancelReject_ErrorCode;
        f_OrderCancelReject_Symbol = Some msg.mod_f_OrderCancelReject_Symbol;
        f_OrderCancelReject_ExecInst = (match msg.mod_f_OrderCancelReject_ExecInst with
            | None -> None
            | Some d -> (Some (convert__model_to_full_ExecInst d))
        )
    }
;;

let convert__model_to_full_OrderMassCancelReport (msg : mod_ordermasscancelreport_data)  =
    FIX_Full_Msg_OrderMassCancelReport {
        f_OrderMassCancelReport_ClOrdID = msg.mod_f_OrderMassCancelReport_ClOrdID;
        f_OrderMassCancelReport_SecondaryClOrdID = None;
        f_OrderMassCancelReport_OrderID = None;
        f_OrderMassCancelReport_SecondaryOrderID = None;
        f_OrderMassCancelReport_MassCancelRequestType = Some (convert__model_to_full_MassCancelRequestType msg.mod_f_OrderMassCancelReport_MassCancelRequestType);
        f_OrderMassCancelReport_MassCancelResponse = None;
        f_OrderMassCancelReport_MassCancelRejectReason = None;
        f_OrderMassCancelReport_TotalAffectedOrders = Some msg.mod_f_OrderMassCancelReport_TotalAffectedOrders;
        f_OrderMassCancelReport_AffectedOrdGrp = [];
        f_OrderMassCancelReport_TradingSessionID = None;
        f_OrderMassCancelReport_TradingSessionSubID = None;
        f_OrderMassCancelReport_Instrument = {
            f_Instrument_Symbol = None;
            f_Instrument_SymbolSfx = None;
            f_Instrument_SecurityID = None;
            f_Instrument_SecurityIDSource = None;
            f_Instrument_SecAltIDGrp = [];
            f_Instrument_Product = None;
            f_Instrument_CFICode = None;
            f_Instrument_SecurityType = None;
            f_Instrument_SecuritySubType = None;
            f_Instrument_MaturityMonthYear = None;
            f_Instrument_MaturityDate = None;
            f_Instrument_CouponPaymentDate = None;
            f_Instrument_IssueDate = None;
            f_Instrument_RepoCollateralSecurityType = None;
            f_Instrument_RepurchaseTerm = None;
            f_Instrument_RepurchaseRate = None;
            f_Instrument_Factor = None;
            f_Instrument_CreditRating = None;
            f_Instrument_InstrRegistry = None;
            f_Instrument_CountryOfIssue = None;
            f_Instrument_StateOrProvinceOfIssue = None;
            f_Instrument_LocaleOfIssue = None;
            f_Instrument_RedemptionDate = None;
            f_Instrument_StrikePrice = None;
            f_Instrument_StrikeCurrency = None;
            f_Instrument_OptAttribute = None;
            f_Instrument_ContractMultiplier = None;
            f_Instrument_CouponRate = None;
            f_Instrument_SecurityExchange = None;
            f_Instrument_Issuer = None;
            f_Instrument_EncodedIssuerLen = None;
            f_Instrument_EncodedIssuer = None;
            f_Instrument_SecurityDesc = None;
            f_Instrument_EncodedSecurityDescLen = None;
            f_Instrument_EncodedSecurityDesc = None;
            f_Instrument_Pool = None;
            f_Instrument_ContractSettlMonth = None;
            f_Instrument_CPProgram = None;
            f_Instrument_CPRegType = None;
            f_Instrument_EvntGrp = [];
            f_Instrument_DatedDate = None;
            f_Instrument_InterestAccrualDate = None
        };
        f_OrderMassCancelReport_UnderlyingInstrument = {
            f_UnderlyingInstrument_UnderlyingSymbol = None;
            f_UnderlyingInstrument_UnderlyingSymbolSfx = None;
            f_UnderlyingInstrument_UnderlyingSecurityID = None;
            f_UnderlyingInstrument_UnderlyingSecurityIDSource = None;
            f_UnderlyingInstrument_UndSecAltIDGrp = [];
            f_UnderlyingInstrument_UnderlyingProduct = None;
            f_UnderlyingInstrument_UnderlyingCFICode = None;
            f_UnderlyingInstrument_UnderlyingSecurityType = None;
            f_UnderlyingInstrument_UnderlyingSecuritySubType = None;
            f_UnderlyingInstrument_UnderlyingMaturityMonthYear = None;
            f_UnderlyingInstrument_UnderlyingMaturityDate = None;
            f_UnderlyingInstrument_UnderlyingCouponPaymentDate = None;
            f_UnderlyingInstrument_UnderlyingIssueDate = None;
            f_UnderlyingInstrument_UnderlyingRepoCollateralSecurityType = None;
            f_UnderlyingInstrument_UnderlyingRepurchaseTerm = None;
            f_UnderlyingInstrument_UnderlyingRepurchaseRate = None;
            f_UnderlyingInstrument_UnderlyingFactor = None;
            f_UnderlyingInstrument_UnderlyingCreditRating = None;
            f_UnderlyingInstrument_UnderlyingInstrRegistry = None;
            f_UnderlyingInstrument_UnderlyingCountryOfIssue = None;
            f_UnderlyingInstrument_UnderlyingStateOrProvinceOfIssue = None;
            f_UnderlyingInstrument_UnderlyingLocaleOfIssue = None;
            f_UnderlyingInstrument_UnderlyingRedemptionDate = None;
            f_UnderlyingInstrument_UnderlyingStrikePrice = None;
            f_UnderlyingInstrument_UnderlyingStrikeCurrency = None;
            f_UnderlyingInstrument_UnderlyingOptAttribute = None;
            f_UnderlyingInstrument_UnderlyingContractMultiplier = None;
            f_UnderlyingInstrument_UnderlyingCouponRate = None;
            f_UnderlyingInstrument_UnderlyingSecurityExchange = None;
            f_UnderlyingInstrument_UnderlyingIssuer = None;
            f_UnderlyingInstrument_EncodedUnderlyingIssuerLen = None;
            f_UnderlyingInstrument_EncodedUnderlyingIssuer = None;
            f_UnderlyingInstrument_UnderlyingSecurityDesc = None;
            f_UnderlyingInstrument_EncodedUnderlyingSecurityDescLen = None;
            f_UnderlyingInstrument_EncodedUnderlyingSecurityDesc = None;
            f_UnderlyingInstrument_UnderlyingCPProgram = None;
            f_UnderlyingInstrument_UnderlyingCPRegType = None;
            f_UnderlyingInstrument_UnderlyingCurrency = None;
            f_UnderlyingInstrument_UnderlyingQty = None;
            f_UnderlyingInstrument_UnderlyingPx = None;
            f_UnderlyingInstrument_UnderlyingDirtyPrice = None;
            f_UnderlyingInstrument_UnderlyingEndPrice = None;
            f_UnderlyingInstrument_UnderlyingStartValue = None;
            f_UnderlyingInstrument_UnderlyingCurrentValue = None;
            f_UnderlyingInstrument_UnderlyingEndValue = None;
            f_UnderlyingInstrument_UnderlyingStipulations = []
        };
        f_OrderMassCancelReport_Side = (match msg.mod_f_OrderMassCancelReport_Side with
            | None -> None
            | Some d -> (Some (convert__model_to_full_Side d))
        );
        f_OrderMassCancelReport_TransactTime = msg.mod_f_OrderMassCancelReport_TransactTime;
        f_OrderMassCancelReport_Text = None;
        f_OrderMassCancelReport_EncodedTextLen = None;
        f_OrderMassCancelReport_EncodedText = None;
        f_OrderMassCancelReport_Symbol = msg.mod_f_OrderMassCancelReport_Symbol;
        f_OrderMassCancelReport_ClassID = msg.mod_f_OrderMassCancelReport_ClassID;
        f_OrderMassCancelReport_TechnicalOrdType = (match msg.mod_f_OrderMassCancelReport_TechnicalOrdType with
            | None -> None
            | Some d -> (Some (convert__model_to_full_TechnicalOrdType d))
        );
        f_OrderMassCancelReport_Rule80A = (match msg.mod_f_OrderMassCancelReport_Rule80A with
            | None -> None
            | Some d -> (Some (convert__model_to_full_Rule80A d))
        );
        f_OrderMassCancelReport_Account = msg.mod_f_OrderMassCancelReport_Account;
        f_OrderMassCancelReport_CancelByLocationID = msg.mod_f_OrderMassCancelReport_CancelByLocationID;
        f_OrderMassCancelReport_MIC = msg.mod_f_OrderMassCancelReport_MIC
    }
;;

let convert_model_to_full_fix (msg : model_msg)  =
    (match msg with
        | FIX_Msg_OrderSingle msg_data -> (convert__model_to_full_OrderSingle msg_data)
        | FIX_Msg_OrderCancelReplaceRequest msg_data -> (convert__model_to_full_OrderCancelReplaceRequest msg_data)
        | FIX_Msg_OrderCancelRequest msg_data -> (convert__model_to_full_OrderCancelRequest msg_data)
        | FIX_Msg_OrderMassCancelRequest msg_data -> (convert__model_to_full_OrderMassCancelRequest msg_data)
        | FIX_Msg_ExecutionReport msg_data -> (convert__model_to_full_ExecutionReport msg_data)
        | FIX_Msg_OrderCancelReject msg_data -> (convert__model_to_full_OrderCancelReject msg_data)
        | FIX_Msg_OrderMassCancelReport msg_data -> (convert__model_to_full_OrderMassCancelReport msg_data)
    )
;;
