(* Aesthetic Integration copyright 2017 *)
(* @meta[imandra_ignore] on @end *)
open Model_tags;;
open Full_app_messages;;
open Enum_converter;;
open Model_messages;;
(* @meta[imandra_ignore] off @end *)

let convert__full_to_model_ExecutionReport ( msg : full_fix_executionreport_data ) =
    let c_f_ExecutionReport_Text = msg.f_ExecutionReport_Text in
    let c_f_ExecutionReport_ExecTransType = msg.f_ExecutionReport_ExecTransType in
    let c_f_ExecutionReport_OrdStatus = msg.f_ExecutionReport_OrdStatus in
    let c_f_ExecutionReport_CumQty = msg.f_ExecutionReport_CumQty in
    let c_f_ExecutionReport_LeavesQty = msg.f_ExecutionReport_LeavesQty in
    let c_f_ExecutionReport_Side = msg.f_ExecutionReport_Side in
    let c_f_ExecutionReport_AvgPx = msg.f_ExecutionReport_AvgPx in
    let c_f_ExecutionReport_ExecType = msg.f_ExecutionReport_ExecType in
    let c_f_ExecutionReport_ExecID = msg.f_ExecutionReport_ExecID in
    let c_f_ExecutionReport_OrderID = msg.f_ExecutionReport_OrderID in
    let c_f_ExecutionReport_Symbol = msg.f_ExecutionReport_Symbol in
    (match msg.f_ExecutionReport_ClOrdID with
        | None -> (FIX_TL_Req_Field_Missing {
            field_missing_data_msg = M_Msg_ExecutionReport_Tag;
            field_missing_data_field = M_Field_ClOrdID_Tag
        })
        | Some m_f_ExecutionReport_ClOrdID -> let c_f_ExecutionReport_ClOrdID = m_f_ExecutionReport_ClOrdID in
        let fix_msg_data = {
            f_ExecutionReport_ClOrdID = c_f_ExecutionReport_ClOrdID;
            f_ExecutionReport_Symbol = c_f_ExecutionReport_Symbol;
            f_ExecutionReport_OrderID = c_f_ExecutionReport_OrderID;
            f_ExecutionReport_ExecID = c_f_ExecutionReport_ExecID;
            f_ExecutionReport_ExecType = convert__full_to_model_ExecType c_f_ExecutionReport_ExecType;
            f_ExecutionReport_AvgPx = c_f_ExecutionReport_AvgPx;
            f_ExecutionReport_Side = convert__full_to_model_Side c_f_ExecutionReport_Side;
            f_ExecutionReport_LeavesQty = c_f_ExecutionReport_LeavesQty;
            f_ExecutionReport_CumQty = c_f_ExecutionReport_CumQty;
            f_ExecutionReport_OrdStatus = convert__full_to_model_OrdStatus c_f_ExecutionReport_OrdStatus;
            f_ExecutionReport_ExecTransType = convert__full_to_model_ExecTransType c_f_ExecutionReport_ExecTransType;
            f_ExecutionReport_Text = c_f_ExecutionReport_Text
        } in
        FIX_TL_Normal (FIX_Msg_ExecutionReport fix_msg_data)
    )
;;

let convert__full_to_model_OrderSingle ( msg : full_fix_ordersingle_data ) =
    let c_f_OrderSingle_HandlInst = msg.f_OrderSingle_HandlInst in
    let c_f_OrderSingle_OrdType = msg.f_OrderSingle_OrdType in
    let c_f_OrderSingle_TransactTime = msg.f_OrderSingle_TransactTime in
    let c_f_OrderSingle_Side = msg.f_OrderSingle_Side in
    let c_f_OrderSingle_Symbol = msg.f_OrderSingle_Symbol in
    let c_f_OrderSingle_ClOrdID = msg.f_OrderSingle_ClOrdID in
    let fix_msg_data = {
        f_OrderSingle_ClOrdID = c_f_OrderSingle_ClOrdID;
        f_OrderSingle_Symbol = c_f_OrderSingle_Symbol;
        f_OrderSingle_Side = convert__full_to_model_Side c_f_OrderSingle_Side;
        f_OrderSingle_TransactTime = c_f_OrderSingle_TransactTime;
        f_OrderSingle_OrdType = convert__full_to_model_OrdType c_f_OrderSingle_OrdType;
        f_OrderSingle_HandlInst = convert__full_to_model_HandlInst c_f_OrderSingle_HandlInst
    } in
    FIX_TL_Normal (FIX_Msg_OrderSingle fix_msg_data)
;;

let convert_full_to_model_fix ( msg : full_app_msg_data ) =
    (match msg with
        | FIX_Full_Msg_ExecutionReport msg_data -> (convert__full_to_model_ExecutionReport msg_data)
        | FIX_Full_Msg_OrderSingle msg_data -> (convert__full_to_model_OrderSingle msg_data)
        | _ -> FIX_TL_None
    )
;;

let convert__model_to_full_ExecutionReport ( msg : mod_executionreport_data ) =
    FIX_Full_Msg_ExecutionReport {
        f_ExecutionReport_OrderID = msg.f_ExecutionReport_OrderID;
        f_ExecutionReport_SecondaryOrderID = None;
        f_ExecutionReport_ClOrdID = Some msg.f_ExecutionReport_ClOrdID;
        f_ExecutionReport_OrigClOrdID = None;
        f_ExecutionReport_ClientID = None;
        f_ExecutionReport_ExecBroker = None;
        f_ExecutionReport_ListID = None;
        f_ExecutionReport_ExecID = msg.f_ExecutionReport_ExecID;
        f_ExecutionReport_ExecTransType = convert__model_to_full_ExecTransType msg.f_ExecutionReport_ExecTransType;
        f_ExecutionReport_ExecRefID = None;
        f_ExecutionReport_ExecType = convert__model_to_full_ExecType msg.f_ExecutionReport_ExecType;
        f_ExecutionReport_OrdStatus = convert__model_to_full_OrdStatus msg.f_ExecutionReport_OrdStatus;
        f_ExecutionReport_OrdRejReason = None;
        f_ExecutionReport_ExecRestatementReason = None;
        f_ExecutionReport_Account = None;
        f_ExecutionReport_SettlmntTyp = None;
        f_ExecutionReport_FutSettDate = None;
        f_ExecutionReport_Symbol = msg.f_ExecutionReport_Symbol;
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
        f_ExecutionReport_Side = convert__model_to_full_Side msg.f_ExecutionReport_Side;
        f_ExecutionReport_OrderQty = None;
        f_ExecutionReport_CashOrderQty = None;
        f_ExecutionReport_OrdType = None;
        f_ExecutionReport_Price = None;
        f_ExecutionReport_StopPx = None;
        f_ExecutionReport_PegDifference = None;
        f_ExecutionReport_DiscretionInst = None;
        f_ExecutionReport_DiscretionOffset = None;
        f_ExecutionReport_Currency = None;
        f_ExecutionReport_ComplianceID = None;
        f_ExecutionReport_SolicitedFlag = None;
        f_ExecutionReport_TimeInForce = None;
        f_ExecutionReport_EffectiveTime = None;
        f_ExecutionReport_ExpireDate = None;
        f_ExecutionReport_ExpireTime = None;
        f_ExecutionReport_ExecInst = None;
        f_ExecutionReport_Rule80A = None;
        f_ExecutionReport_LastShares = None;
        f_ExecutionReport_LastPx = None;
        f_ExecutionReport_LastSpotRate = None;
        f_ExecutionReport_LastForwardPoints = None;
        f_ExecutionReport_LastMkt = None;
        f_ExecutionReport_TradingSessionID = None;
        f_ExecutionReport_LastCapacity = None;
        f_ExecutionReport_LeavesQty = msg.f_ExecutionReport_LeavesQty;
        f_ExecutionReport_CumQty = msg.f_ExecutionReport_CumQty;
        f_ExecutionReport_AvgPx = msg.f_ExecutionReport_AvgPx;
        f_ExecutionReport_DayOrderQty = None;
        f_ExecutionReport_DayCumQty = None;
        f_ExecutionReport_DayAvgPx = None;
        f_ExecutionReport_GTBookingInst = None;
        f_ExecutionReport_TradeDate = None;
        f_ExecutionReport_TransactTime = None;
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
        f_ExecutionReport_OpenClose = None;
        f_ExecutionReport_MaxShow = None;
        f_ExecutionReport_Text = msg.f_ExecutionReport_Text;
        f_ExecutionReport_EncodedTextLen = None;
        f_ExecutionReport_EncodedText = None;
        f_ExecutionReport_FutSettDate2 = None;
        f_ExecutionReport_OrderQty2 = None;
        f_ExecutionReport_ClearingFirm = None;
        f_ExecutionReport_ClearingAccount = None;
        f_ExecutionReport_MultiLegReportingType = None;
        f_ExecutionReport_ExecutionReportContraBrokers = []
    }
;;

let convert__model_to_full_OrderSingle ( msg : mod_ordersingle_data ) =
    FIX_Full_Msg_OrderSingle {
        f_OrderSingle_ClOrdID = msg.f_OrderSingle_ClOrdID;
        f_OrderSingle_ClientID = None;
        f_OrderSingle_ExecBroker = None;
        f_OrderSingle_Account = None;
        f_OrderSingle_SettlmntTyp = None;
        f_OrderSingle_FutSettDate = None;
        f_OrderSingle_HandlInst = convert__model_to_full_HandlInst msg.f_OrderSingle_HandlInst;
        f_OrderSingle_ExecInst = None;
        f_OrderSingle_MinQty = None;
        f_OrderSingle_MaxFloor = None;
        f_OrderSingle_ExDestination = None;
        f_OrderSingle_ProcessCode = None;
        f_OrderSingle_Symbol = msg.f_OrderSingle_Symbol;
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
        f_OrderSingle_Side = convert__model_to_full_Side msg.f_OrderSingle_Side;
        f_OrderSingle_LocateReqd = None;
        f_OrderSingle_TransactTime = msg.f_OrderSingle_TransactTime;
        f_OrderSingle_OrderQty = None;
        f_OrderSingle_CashOrderQty = None;
        f_OrderSingle_OrdType = convert__model_to_full_OrdType msg.f_OrderSingle_OrdType;
        f_OrderSingle_Price = None;
        f_OrderSingle_StopPx = None;
        f_OrderSingle_Currency = None;
        f_OrderSingle_ComplianceID = None;
        f_OrderSingle_SolicitedFlag = None;
        f_OrderSingle_IOIid = None;
        f_OrderSingle_QuoteID = None;
        f_OrderSingle_TimeInForce = None;
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
        f_OrderSingle_PegDifference = None;
        f_OrderSingle_DiscretionInst = None;
        f_OrderSingle_DiscretionOffset = None;
        f_OrderSingle_ClearingFirm = None;
        f_OrderSingle_ClearingAccount = None;
        f_OrderSingle_OrderSingleAllocs = [];
        f_OrderSingle_OrderSingleTradingSessions = []
    }
;;

let convert_model_to_full_fix ( msg : model_msg ) =
    (match msg with
        | FIX_Msg_ExecutionReport msg_data -> (convert__model_to_full_ExecutionReport msg_data)
        | FIX_Msg_OrderSingle msg_data -> (convert__model_to_full_OrderSingle msg_data)
    )
;;
