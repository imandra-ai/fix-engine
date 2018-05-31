(* Aesthetic Integration copyright 2018 *)
open Full_app_messages;;
open Full_app_tags;;
open Numeric;;
open Parse_app_enums;;
open Parse_app_records;;
open Parse_base_types;;
open Parse_datetime;;
open Parser_utils.Parser;;

let parse_OrderSingle (msg)  =
    (repeating msg "78" parse_OrderSingleAllocs (fun msg f_OrderSingle_OrderSingleAllocs -> repeating msg "386" parse_OrderSingleTradingSessions (fun msg f_OrderSingle_OrderSingleTradingSessions -> repeating msg "453" parse_Parties (fun msg f_OrderSingle_Parties -> repeating msg "9933" parse_ClearingEntries (fun msg f_OrderSingle_ClearingEntries -> check_duplicate_tags msg (fun () -> opt msg "11" parse_string (fun msg f_OrderSingle_ClOrdID -> opt msg "109" parse_string (fun msg f_OrderSingle_ClientID -> opt msg "76" parse_string (fun msg f_OrderSingle_ExecBroker -> opt msg "1" parse_string (fun msg f_OrderSingle_Account -> opt msg "63" parse_SettlmntTyp (fun msg f_OrderSingle_SettlmntTyp -> opt msg "64" parse_LocalMktDate (fun msg f_OrderSingle_FutSettDate -> opt msg "21" parse_HandlInst (fun msg f_OrderSingle_HandlInst -> opt msg "18" parse_ExecInst (fun msg f_OrderSingle_ExecInst -> opt msg "110" parse_float (fun msg f_OrderSingle_MinQty -> opt msg "111" parse_float (fun msg f_OrderSingle_MaxFloor -> opt msg "100" parse_Exchange (fun msg f_OrderSingle_ExDestination -> opt msg "81" parse_ProcessCode (fun msg f_OrderSingle_ProcessCode -> opt msg "55" parse_string (fun msg f_OrderSingle_Symbol -> opt msg "65" parse_string (fun msg f_OrderSingle_SymbolSfx -> opt msg "48" parse_string (fun msg f_OrderSingle_SecurityID -> opt msg "22" parse_IDSource (fun msg f_OrderSingle_IDSource -> opt msg "167" parse_SecurityType (fun msg f_OrderSingle_SecurityType -> opt msg "200" parse_MonthYear (fun msg f_OrderSingle_MaturityMonthYear -> opt msg "205" parse_int (fun msg f_OrderSingle_MaturityDay -> opt msg "201" parse_PutOrCall (fun msg f_OrderSingle_PutOrCall -> opt msg "202" (fun x -> (match parse_float x with
        | None -> None
        | Some d -> (Some (float_Convert_6_4 d))
    )
    ) (fun msg f_OrderSingle_StrikePrice -> opt msg "206" parse_char (fun msg f_OrderSingle_OptAttribute -> opt msg "231" parse_float (fun msg f_OrderSingle_ContractMultiplier -> opt msg "223" parse_float (fun msg f_OrderSingle_CouponRate -> opt msg "207" parse_Exchange (fun msg f_OrderSingle_SecurityExchange -> opt msg "106" parse_string (fun msg f_OrderSingle_Issuer -> opt msg "348" parse_int (fun msg f_OrderSingle_EncodedIssuerLen -> opt msg "349" parse_string (fun msg f_OrderSingle_EncodedIssuer -> opt msg "107" parse_string (fun msg f_OrderSingle_SecurityDesc -> opt msg "350" parse_int (fun msg f_OrderSingle_EncodedSecurityDescLen -> opt msg "351" parse_string (fun msg f_OrderSingle_EncodedSecurityDesc -> opt msg "140" (fun x -> (match parse_float x with
        | None -> None
        | Some d -> (Some (float_Convert_6_4 d))
    )
    ) (fun msg f_OrderSingle_PrevClosePx -> opt msg "54" parse_Side (fun msg f_OrderSingle_Side -> opt msg "114" parse_LocateReqd (fun msg f_OrderSingle_LocateReqd -> opt msg "60" parse_UTCTimestamp (fun msg f_OrderSingle_TransactTime -> opt msg "38" parse_float (fun msg f_OrderSingle_OrderQty -> opt msg "152" parse_float (fun msg f_OrderSingle_CashOrderQty -> opt msg "40" parse_OrdType (fun msg f_OrderSingle_OrdType -> opt msg "44" (fun x -> (match parse_float x with
        | None -> None
        | Some d -> (Some (float_Convert_6_4 d))
    )
    ) (fun msg f_OrderSingle_Price -> opt msg "99" (fun x -> (match parse_float x with
        | None -> None
        | Some d -> (Some (float_Convert_6_4 d))
    )
    ) (fun msg f_OrderSingle_StopPx -> opt msg "15" parse_Currency (fun msg f_OrderSingle_Currency -> opt msg "376" parse_string (fun msg f_OrderSingle_ComplianceID -> opt msg "377" parse_SolicitedFlag (fun msg f_OrderSingle_SolicitedFlag -> opt msg "23" parse_string (fun msg f_OrderSingle_IOIid -> opt msg "117" parse_string (fun msg f_OrderSingle_QuoteID -> opt msg "59" parse_TimeInForce (fun msg f_OrderSingle_TimeInForce -> opt msg "168" parse_UTCTimestamp (fun msg f_OrderSingle_EffectiveTime -> opt msg "432" parse_LocalMktDate (fun msg f_OrderSingle_ExpireDate -> opt msg "126" parse_UTCTimestamp (fun msg f_OrderSingle_ExpireTime -> opt msg "427" parse_GTBookingInst (fun msg f_OrderSingle_GTBookingInst -> opt msg "12" parse_float (fun msg f_OrderSingle_Commission -> opt msg "13" parse_CommType (fun msg f_OrderSingle_CommType -> opt msg "47" parse_Rule80A (fun msg f_OrderSingle_Rule80A -> opt msg "121" parse_ForexReq (fun msg f_OrderSingle_ForexReq -> opt msg "120" parse_Currency (fun msg f_OrderSingle_SettlCurrency -> opt msg "58" parse_string (fun msg f_OrderSingle_Text -> opt msg "354" parse_int (fun msg f_OrderSingle_EncodedTextLen -> opt msg "355" parse_string (fun msg f_OrderSingle_EncodedText -> opt msg "193" parse_LocalMktDate (fun msg f_OrderSingle_FutSettDate2 -> opt msg "192" parse_float (fun msg f_OrderSingle_OrderQty2 -> opt msg "77" parse_OpenClose (fun msg f_OrderSingle_OpenClose -> opt msg "203" parse_CoveredOrUncovered (fun msg f_OrderSingle_CoveredOrUncovered -> opt msg "204" parse_CustomerOrFirm (fun msg f_OrderSingle_CustomerOrFirm -> opt msg "210" parse_float (fun msg f_OrderSingle_MaxShow -> opt msg "211" parse_float (fun msg f_OrderSingle_PegDifference -> opt msg "388" parse_DiscretionInst (fun msg f_OrderSingle_DiscretionInst -> opt msg "389" parse_float (fun msg f_OrderSingle_DiscretionOffset -> opt msg "439" parse_string (fun msg f_OrderSingle_ClearingFirm -> opt msg "440" parse_string (fun msg f_OrderSingle_ClearingAccount -> opt msg "9941" parse_TechnicalOrdType (fun msg f_OrderSingle_TechnicalOrdType -> opt msg "10078" parse_BookIndicator (fun msg f_OrderSingle_BookIndicator -> opt msg "9949" parse_string (fun msg f_OrderSingle_MIC -> opt msg "10079" parse_BrokerPrioritization (fun msg f_OrderSingle_BrokerPrioritization -> opt msg "21017" parse_int (fun msg f_OrderSingle_DEAIndicator -> opt msg "8015" parse_OrderAttributeTypes (fun msg f_OrderSingle_OrderAttributeTypes -> (ParseSuccess {
        f_OrderSingle_OrderSingleAllocs = f_OrderSingle_OrderSingleAllocs;
        f_OrderSingle_OrderSingleTradingSessions = f_OrderSingle_OrderSingleTradingSessions;
        f_OrderSingle_Parties = f_OrderSingle_Parties;
        f_OrderSingle_ClearingEntries = f_OrderSingle_ClearingEntries;
        f_OrderSingle_ClOrdID = f_OrderSingle_ClOrdID;
        f_OrderSingle_ClientID = f_OrderSingle_ClientID;
        f_OrderSingle_ExecBroker = f_OrderSingle_ExecBroker;
        f_OrderSingle_Account = f_OrderSingle_Account;
        f_OrderSingle_SettlmntTyp = f_OrderSingle_SettlmntTyp;
        f_OrderSingle_FutSettDate = f_OrderSingle_FutSettDate;
        f_OrderSingle_HandlInst = f_OrderSingle_HandlInst;
        f_OrderSingle_ExecInst = f_OrderSingle_ExecInst;
        f_OrderSingle_MinQty = f_OrderSingle_MinQty;
        f_OrderSingle_MaxFloor = f_OrderSingle_MaxFloor;
        f_OrderSingle_ExDestination = f_OrderSingle_ExDestination;
        f_OrderSingle_ProcessCode = f_OrderSingle_ProcessCode;
        f_OrderSingle_Symbol = f_OrderSingle_Symbol;
        f_OrderSingle_SymbolSfx = f_OrderSingle_SymbolSfx;
        f_OrderSingle_SecurityID = f_OrderSingle_SecurityID;
        f_OrderSingle_IDSource = f_OrderSingle_IDSource;
        f_OrderSingle_SecurityType = f_OrderSingle_SecurityType;
        f_OrderSingle_MaturityMonthYear = f_OrderSingle_MaturityMonthYear;
        f_OrderSingle_MaturityDay = f_OrderSingle_MaturityDay;
        f_OrderSingle_PutOrCall = f_OrderSingle_PutOrCall;
        f_OrderSingle_StrikePrice = f_OrderSingle_StrikePrice;
        f_OrderSingle_OptAttribute = f_OrderSingle_OptAttribute;
        f_OrderSingle_ContractMultiplier = f_OrderSingle_ContractMultiplier;
        f_OrderSingle_CouponRate = f_OrderSingle_CouponRate;
        f_OrderSingle_SecurityExchange = f_OrderSingle_SecurityExchange;
        f_OrderSingle_Issuer = f_OrderSingle_Issuer;
        f_OrderSingle_EncodedIssuerLen = f_OrderSingle_EncodedIssuerLen;
        f_OrderSingle_EncodedIssuer = f_OrderSingle_EncodedIssuer;
        f_OrderSingle_SecurityDesc = f_OrderSingle_SecurityDesc;
        f_OrderSingle_EncodedSecurityDescLen = f_OrderSingle_EncodedSecurityDescLen;
        f_OrderSingle_EncodedSecurityDesc = f_OrderSingle_EncodedSecurityDesc;
        f_OrderSingle_PrevClosePx = f_OrderSingle_PrevClosePx;
        f_OrderSingle_Side = f_OrderSingle_Side;
        f_OrderSingle_LocateReqd = f_OrderSingle_LocateReqd;
        f_OrderSingle_TransactTime = f_OrderSingle_TransactTime;
        f_OrderSingle_OrderQty = f_OrderSingle_OrderQty;
        f_OrderSingle_CashOrderQty = f_OrderSingle_CashOrderQty;
        f_OrderSingle_OrdType = f_OrderSingle_OrdType;
        f_OrderSingle_Price = f_OrderSingle_Price;
        f_OrderSingle_StopPx = f_OrderSingle_StopPx;
        f_OrderSingle_Currency = f_OrderSingle_Currency;
        f_OrderSingle_ComplianceID = f_OrderSingle_ComplianceID;
        f_OrderSingle_SolicitedFlag = f_OrderSingle_SolicitedFlag;
        f_OrderSingle_IOIid = f_OrderSingle_IOIid;
        f_OrderSingle_QuoteID = f_OrderSingle_QuoteID;
        f_OrderSingle_TimeInForce = f_OrderSingle_TimeInForce;
        f_OrderSingle_EffectiveTime = f_OrderSingle_EffectiveTime;
        f_OrderSingle_ExpireDate = f_OrderSingle_ExpireDate;
        f_OrderSingle_ExpireTime = f_OrderSingle_ExpireTime;
        f_OrderSingle_GTBookingInst = f_OrderSingle_GTBookingInst;
        f_OrderSingle_Commission = f_OrderSingle_Commission;
        f_OrderSingle_CommType = f_OrderSingle_CommType;
        f_OrderSingle_Rule80A = f_OrderSingle_Rule80A;
        f_OrderSingle_ForexReq = f_OrderSingle_ForexReq;
        f_OrderSingle_SettlCurrency = f_OrderSingle_SettlCurrency;
        f_OrderSingle_Text = f_OrderSingle_Text;
        f_OrderSingle_EncodedTextLen = f_OrderSingle_EncodedTextLen;
        f_OrderSingle_EncodedText = f_OrderSingle_EncodedText;
        f_OrderSingle_FutSettDate2 = f_OrderSingle_FutSettDate2;
        f_OrderSingle_OrderQty2 = f_OrderSingle_OrderQty2;
        f_OrderSingle_OpenClose = f_OrderSingle_OpenClose;
        f_OrderSingle_CoveredOrUncovered = f_OrderSingle_CoveredOrUncovered;
        f_OrderSingle_CustomerOrFirm = f_OrderSingle_CustomerOrFirm;
        f_OrderSingle_MaxShow = f_OrderSingle_MaxShow;
        f_OrderSingle_PegDifference = f_OrderSingle_PegDifference;
        f_OrderSingle_DiscretionInst = f_OrderSingle_DiscretionInst;
        f_OrderSingle_DiscretionOffset = f_OrderSingle_DiscretionOffset;
        f_OrderSingle_ClearingFirm = f_OrderSingle_ClearingFirm;
        f_OrderSingle_ClearingAccount = f_OrderSingle_ClearingAccount;
        f_OrderSingle_TechnicalOrdType = f_OrderSingle_TechnicalOrdType;
        f_OrderSingle_BookIndicator = f_OrderSingle_BookIndicator;
        f_OrderSingle_MIC = f_OrderSingle_MIC;
        f_OrderSingle_BrokerPrioritization = f_OrderSingle_BrokerPrioritization;
        f_OrderSingle_DEAIndicator = f_OrderSingle_DEAIndicator;
        f_OrderSingle_OrderAttributeTypes = f_OrderSingle_OrderAttributeTypes
    },msg)
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
    )
    )) |> check_unknown_tags
;;

let parse_OrderCancelReplaceRequest (msg)  =
    (repeating msg "78" parse_OrderCancelReplaceRequestAllocs (fun msg f_OrderCancelReplaceRequest_OrderCancelReplaceRequestAllocs -> repeating msg "386" parse_OrderCancelReplaceRequestTradingSessions (fun msg f_OrderCancelReplaceRequest_OrderCancelReplaceRequestTradingSessions -> repeating msg "453" parse_Parties (fun msg f_OrderCancelReplaceRequest_Parties -> check_duplicate_tags msg (fun () -> opt msg "37" parse_string (fun msg f_OrderCancelReplaceRequest_OrderID -> opt msg "109" parse_string (fun msg f_OrderCancelReplaceRequest_ClientID -> opt msg "76" parse_string (fun msg f_OrderCancelReplaceRequest_ExecBroker -> opt msg "41" parse_string (fun msg f_OrderCancelReplaceRequest_OrigClOrdID -> opt msg "11" parse_string (fun msg f_OrderCancelReplaceRequest_ClOrdID -> opt msg "66" parse_string (fun msg f_OrderCancelReplaceRequest_ListID -> opt msg "1" parse_string (fun msg f_OrderCancelReplaceRequest_Account -> opt msg "63" parse_SettlmntTyp (fun msg f_OrderCancelReplaceRequest_SettlmntTyp -> opt msg "64" parse_LocalMktDate (fun msg f_OrderCancelReplaceRequest_FutSettDate -> opt msg "21" parse_HandlInst (fun msg f_OrderCancelReplaceRequest_HandlInst -> opt msg "18" parse_ExecInst (fun msg f_OrderCancelReplaceRequest_ExecInst -> opt msg "110" parse_float (fun msg f_OrderCancelReplaceRequest_MinQty -> opt msg "111" parse_float (fun msg f_OrderCancelReplaceRequest_MaxFloor -> opt msg "100" parse_Exchange (fun msg f_OrderCancelReplaceRequest_ExDestination -> opt msg "55" parse_string (fun msg f_OrderCancelReplaceRequest_Symbol -> opt msg "65" parse_string (fun msg f_OrderCancelReplaceRequest_SymbolSfx -> opt msg "48" parse_string (fun msg f_OrderCancelReplaceRequest_SecurityID -> opt msg "22" parse_IDSource (fun msg f_OrderCancelReplaceRequest_IDSource -> opt msg "167" parse_SecurityType (fun msg f_OrderCancelReplaceRequest_SecurityType -> opt msg "200" parse_MonthYear (fun msg f_OrderCancelReplaceRequest_MaturityMonthYear -> opt msg "205" parse_int (fun msg f_OrderCancelReplaceRequest_MaturityDay -> opt msg "201" parse_PutOrCall (fun msg f_OrderCancelReplaceRequest_PutOrCall -> opt msg "202" (fun x -> (match parse_float x with
        | None -> None
        | Some d -> (Some (float_Convert_6_4 d))
    )
    ) (fun msg f_OrderCancelReplaceRequest_StrikePrice -> opt msg "206" parse_char (fun msg f_OrderCancelReplaceRequest_OptAttribute -> opt msg "231" parse_float (fun msg f_OrderCancelReplaceRequest_ContractMultiplier -> opt msg "223" parse_float (fun msg f_OrderCancelReplaceRequest_CouponRate -> opt msg "207" parse_Exchange (fun msg f_OrderCancelReplaceRequest_SecurityExchange -> opt msg "106" parse_string (fun msg f_OrderCancelReplaceRequest_Issuer -> opt msg "348" parse_int (fun msg f_OrderCancelReplaceRequest_EncodedIssuerLen -> opt msg "349" parse_string (fun msg f_OrderCancelReplaceRequest_EncodedIssuer -> opt msg "107" parse_string (fun msg f_OrderCancelReplaceRequest_SecurityDesc -> opt msg "350" parse_int (fun msg f_OrderCancelReplaceRequest_EncodedSecurityDescLen -> opt msg "351" parse_string (fun msg f_OrderCancelReplaceRequest_EncodedSecurityDesc -> opt msg "54" parse_Side (fun msg f_OrderCancelReplaceRequest_Side -> opt msg "60" parse_UTCTimestamp (fun msg f_OrderCancelReplaceRequest_TransactTime -> opt msg "38" parse_float (fun msg f_OrderCancelReplaceRequest_OrderQty -> opt msg "152" parse_float (fun msg f_OrderCancelReplaceRequest_CashOrderQty -> opt msg "40" parse_OrdType (fun msg f_OrderCancelReplaceRequest_OrdType -> opt msg "44" (fun x -> (match parse_float x with
        | None -> None
        | Some d -> (Some (float_Convert_6_4 d))
    )
    ) (fun msg f_OrderCancelReplaceRequest_Price -> opt msg "99" (fun x -> (match parse_float x with
        | None -> None
        | Some d -> (Some (float_Convert_6_4 d))
    )
    ) (fun msg f_OrderCancelReplaceRequest_StopPx -> opt msg "211" parse_float (fun msg f_OrderCancelReplaceRequest_PegDifference -> opt msg "388" parse_DiscretionInst (fun msg f_OrderCancelReplaceRequest_DiscretionInst -> opt msg "389" parse_float (fun msg f_OrderCancelReplaceRequest_DiscretionOffset -> opt msg "376" parse_string (fun msg f_OrderCancelReplaceRequest_ComplianceID -> opt msg "377" parse_SolicitedFlag (fun msg f_OrderCancelReplaceRequest_SolicitedFlag -> opt msg "15" parse_Currency (fun msg f_OrderCancelReplaceRequest_Currency -> opt msg "59" parse_TimeInForce (fun msg f_OrderCancelReplaceRequest_TimeInForce -> opt msg "168" parse_UTCTimestamp (fun msg f_OrderCancelReplaceRequest_EffectiveTime -> opt msg "432" parse_LocalMktDate (fun msg f_OrderCancelReplaceRequest_ExpireDate -> opt msg "126" parse_UTCTimestamp (fun msg f_OrderCancelReplaceRequest_ExpireTime -> opt msg "427" parse_GTBookingInst (fun msg f_OrderCancelReplaceRequest_GTBookingInst -> opt msg "12" parse_float (fun msg f_OrderCancelReplaceRequest_Commission -> opt msg "13" parse_CommType (fun msg f_OrderCancelReplaceRequest_CommType -> opt msg "47" parse_Rule80A (fun msg f_OrderCancelReplaceRequest_Rule80A -> opt msg "121" parse_ForexReq (fun msg f_OrderCancelReplaceRequest_ForexReq -> opt msg "120" parse_Currency (fun msg f_OrderCancelReplaceRequest_SettlCurrency -> opt msg "58" parse_string (fun msg f_OrderCancelReplaceRequest_Text -> opt msg "354" parse_int (fun msg f_OrderCancelReplaceRequest_EncodedTextLen -> opt msg "355" parse_string (fun msg f_OrderCancelReplaceRequest_EncodedText -> opt msg "193" parse_LocalMktDate (fun msg f_OrderCancelReplaceRequest_FutSettDate2 -> opt msg "192" parse_float (fun msg f_OrderCancelReplaceRequest_OrderQty2 -> opt msg "77" parse_OpenClose (fun msg f_OrderCancelReplaceRequest_OpenClose -> opt msg "203" parse_CoveredOrUncovered (fun msg f_OrderCancelReplaceRequest_CoveredOrUncovered -> opt msg "204" parse_CustomerOrFirm (fun msg f_OrderCancelReplaceRequest_CustomerOrFirm -> opt msg "210" parse_float (fun msg f_OrderCancelReplaceRequest_MaxShow -> opt msg "114" parse_LocateReqd (fun msg f_OrderCancelReplaceRequest_LocateReqd -> opt msg "439" parse_string (fun msg f_OrderCancelReplaceRequest_ClearingFirm -> opt msg "440" parse_string (fun msg f_OrderCancelReplaceRequest_ClearingAccount -> opt msg "9941" parse_TechnicalOrdType (fun msg f_OrderCancelReplaceRequest_TechnicalOrdType -> opt msg "9952" parse_string (fun msg f_OrderCancelReplaceRequest_FreeText -> opt msg "9938" parse_ClearingHandlingType (fun msg f_OrderCancelReplaceRequest_ClearingHandlingType -> opt msg "9949" parse_string (fun msg f_OrderCancelReplaceRequest_MIC -> opt msg "21017" parse_int (fun msg f_OrderCancelReplaceRequest_DEAIndicator -> (ParseSuccess {
        f_OrderCancelReplaceRequest_OrderCancelReplaceRequestAllocs = f_OrderCancelReplaceRequest_OrderCancelReplaceRequestAllocs;
        f_OrderCancelReplaceRequest_OrderCancelReplaceRequestTradingSessions = f_OrderCancelReplaceRequest_OrderCancelReplaceRequestTradingSessions;
        f_OrderCancelReplaceRequest_Parties = f_OrderCancelReplaceRequest_Parties;
        f_OrderCancelReplaceRequest_OrderID = f_OrderCancelReplaceRequest_OrderID;
        f_OrderCancelReplaceRequest_ClientID = f_OrderCancelReplaceRequest_ClientID;
        f_OrderCancelReplaceRequest_ExecBroker = f_OrderCancelReplaceRequest_ExecBroker;
        f_OrderCancelReplaceRequest_OrigClOrdID = f_OrderCancelReplaceRequest_OrigClOrdID;
        f_OrderCancelReplaceRequest_ClOrdID = f_OrderCancelReplaceRequest_ClOrdID;
        f_OrderCancelReplaceRequest_ListID = f_OrderCancelReplaceRequest_ListID;
        f_OrderCancelReplaceRequest_Account = f_OrderCancelReplaceRequest_Account;
        f_OrderCancelReplaceRequest_SettlmntTyp = f_OrderCancelReplaceRequest_SettlmntTyp;
        f_OrderCancelReplaceRequest_FutSettDate = f_OrderCancelReplaceRequest_FutSettDate;
        f_OrderCancelReplaceRequest_HandlInst = f_OrderCancelReplaceRequest_HandlInst;
        f_OrderCancelReplaceRequest_ExecInst = f_OrderCancelReplaceRequest_ExecInst;
        f_OrderCancelReplaceRequest_MinQty = f_OrderCancelReplaceRequest_MinQty;
        f_OrderCancelReplaceRequest_MaxFloor = f_OrderCancelReplaceRequest_MaxFloor;
        f_OrderCancelReplaceRequest_ExDestination = f_OrderCancelReplaceRequest_ExDestination;
        f_OrderCancelReplaceRequest_Symbol = f_OrderCancelReplaceRequest_Symbol;
        f_OrderCancelReplaceRequest_SymbolSfx = f_OrderCancelReplaceRequest_SymbolSfx;
        f_OrderCancelReplaceRequest_SecurityID = f_OrderCancelReplaceRequest_SecurityID;
        f_OrderCancelReplaceRequest_IDSource = f_OrderCancelReplaceRequest_IDSource;
        f_OrderCancelReplaceRequest_SecurityType = f_OrderCancelReplaceRequest_SecurityType;
        f_OrderCancelReplaceRequest_MaturityMonthYear = f_OrderCancelReplaceRequest_MaturityMonthYear;
        f_OrderCancelReplaceRequest_MaturityDay = f_OrderCancelReplaceRequest_MaturityDay;
        f_OrderCancelReplaceRequest_PutOrCall = f_OrderCancelReplaceRequest_PutOrCall;
        f_OrderCancelReplaceRequest_StrikePrice = f_OrderCancelReplaceRequest_StrikePrice;
        f_OrderCancelReplaceRequest_OptAttribute = f_OrderCancelReplaceRequest_OptAttribute;
        f_OrderCancelReplaceRequest_ContractMultiplier = f_OrderCancelReplaceRequest_ContractMultiplier;
        f_OrderCancelReplaceRequest_CouponRate = f_OrderCancelReplaceRequest_CouponRate;
        f_OrderCancelReplaceRequest_SecurityExchange = f_OrderCancelReplaceRequest_SecurityExchange;
        f_OrderCancelReplaceRequest_Issuer = f_OrderCancelReplaceRequest_Issuer;
        f_OrderCancelReplaceRequest_EncodedIssuerLen = f_OrderCancelReplaceRequest_EncodedIssuerLen;
        f_OrderCancelReplaceRequest_EncodedIssuer = f_OrderCancelReplaceRequest_EncodedIssuer;
        f_OrderCancelReplaceRequest_SecurityDesc = f_OrderCancelReplaceRequest_SecurityDesc;
        f_OrderCancelReplaceRequest_EncodedSecurityDescLen = f_OrderCancelReplaceRequest_EncodedSecurityDescLen;
        f_OrderCancelReplaceRequest_EncodedSecurityDesc = f_OrderCancelReplaceRequest_EncodedSecurityDesc;
        f_OrderCancelReplaceRequest_Side = f_OrderCancelReplaceRequest_Side;
        f_OrderCancelReplaceRequest_TransactTime = f_OrderCancelReplaceRequest_TransactTime;
        f_OrderCancelReplaceRequest_OrderQty = f_OrderCancelReplaceRequest_OrderQty;
        f_OrderCancelReplaceRequest_CashOrderQty = f_OrderCancelReplaceRequest_CashOrderQty;
        f_OrderCancelReplaceRequest_OrdType = f_OrderCancelReplaceRequest_OrdType;
        f_OrderCancelReplaceRequest_Price = f_OrderCancelReplaceRequest_Price;
        f_OrderCancelReplaceRequest_StopPx = f_OrderCancelReplaceRequest_StopPx;
        f_OrderCancelReplaceRequest_PegDifference = f_OrderCancelReplaceRequest_PegDifference;
        f_OrderCancelReplaceRequest_DiscretionInst = f_OrderCancelReplaceRequest_DiscretionInst;
        f_OrderCancelReplaceRequest_DiscretionOffset = f_OrderCancelReplaceRequest_DiscretionOffset;
        f_OrderCancelReplaceRequest_ComplianceID = f_OrderCancelReplaceRequest_ComplianceID;
        f_OrderCancelReplaceRequest_SolicitedFlag = f_OrderCancelReplaceRequest_SolicitedFlag;
        f_OrderCancelReplaceRequest_Currency = f_OrderCancelReplaceRequest_Currency;
        f_OrderCancelReplaceRequest_TimeInForce = f_OrderCancelReplaceRequest_TimeInForce;
        f_OrderCancelReplaceRequest_EffectiveTime = f_OrderCancelReplaceRequest_EffectiveTime;
        f_OrderCancelReplaceRequest_ExpireDate = f_OrderCancelReplaceRequest_ExpireDate;
        f_OrderCancelReplaceRequest_ExpireTime = f_OrderCancelReplaceRequest_ExpireTime;
        f_OrderCancelReplaceRequest_GTBookingInst = f_OrderCancelReplaceRequest_GTBookingInst;
        f_OrderCancelReplaceRequest_Commission = f_OrderCancelReplaceRequest_Commission;
        f_OrderCancelReplaceRequest_CommType = f_OrderCancelReplaceRequest_CommType;
        f_OrderCancelReplaceRequest_Rule80A = f_OrderCancelReplaceRequest_Rule80A;
        f_OrderCancelReplaceRequest_ForexReq = f_OrderCancelReplaceRequest_ForexReq;
        f_OrderCancelReplaceRequest_SettlCurrency = f_OrderCancelReplaceRequest_SettlCurrency;
        f_OrderCancelReplaceRequest_Text = f_OrderCancelReplaceRequest_Text;
        f_OrderCancelReplaceRequest_EncodedTextLen = f_OrderCancelReplaceRequest_EncodedTextLen;
        f_OrderCancelReplaceRequest_EncodedText = f_OrderCancelReplaceRequest_EncodedText;
        f_OrderCancelReplaceRequest_FutSettDate2 = f_OrderCancelReplaceRequest_FutSettDate2;
        f_OrderCancelReplaceRequest_OrderQty2 = f_OrderCancelReplaceRequest_OrderQty2;
        f_OrderCancelReplaceRequest_OpenClose = f_OrderCancelReplaceRequest_OpenClose;
        f_OrderCancelReplaceRequest_CoveredOrUncovered = f_OrderCancelReplaceRequest_CoveredOrUncovered;
        f_OrderCancelReplaceRequest_CustomerOrFirm = f_OrderCancelReplaceRequest_CustomerOrFirm;
        f_OrderCancelReplaceRequest_MaxShow = f_OrderCancelReplaceRequest_MaxShow;
        f_OrderCancelReplaceRequest_LocateReqd = f_OrderCancelReplaceRequest_LocateReqd;
        f_OrderCancelReplaceRequest_ClearingFirm = f_OrderCancelReplaceRequest_ClearingFirm;
        f_OrderCancelReplaceRequest_ClearingAccount = f_OrderCancelReplaceRequest_ClearingAccount;
        f_OrderCancelReplaceRequest_TechnicalOrdType = f_OrderCancelReplaceRequest_TechnicalOrdType;
        f_OrderCancelReplaceRequest_FreeText = f_OrderCancelReplaceRequest_FreeText;
        f_OrderCancelReplaceRequest_ClearingHandlingType = f_OrderCancelReplaceRequest_ClearingHandlingType;
        f_OrderCancelReplaceRequest_MIC = f_OrderCancelReplaceRequest_MIC;
        f_OrderCancelReplaceRequest_DEAIndicator = f_OrderCancelReplaceRequest_DEAIndicator
    },msg)
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
    )) |> check_unknown_tags
;;

let parse_OrderCancelRequest (msg)  =
    (check_duplicate_tags msg (fun () -> opt msg "41" parse_string (fun msg f_OrderCancelRequest_OrigClOrdID -> opt msg "37" parse_string (fun msg f_OrderCancelRequest_OrderID -> opt msg "11" parse_string (fun msg f_OrderCancelRequest_ClOrdID -> opt msg "66" parse_string (fun msg f_OrderCancelRequest_ListID -> opt msg "1" parse_string (fun msg f_OrderCancelRequest_Account -> opt msg "109" parse_string (fun msg f_OrderCancelRequest_ClientID -> opt msg "76" parse_string (fun msg f_OrderCancelRequest_ExecBroker -> opt msg "55" parse_string (fun msg f_OrderCancelRequest_Symbol -> opt msg "65" parse_string (fun msg f_OrderCancelRequest_SymbolSfx -> opt msg "48" parse_string (fun msg f_OrderCancelRequest_SecurityID -> opt msg "22" parse_IDSource (fun msg f_OrderCancelRequest_IDSource -> opt msg "167" parse_SecurityType (fun msg f_OrderCancelRequest_SecurityType -> opt msg "200" parse_MonthYear (fun msg f_OrderCancelRequest_MaturityMonthYear -> opt msg "205" parse_int (fun msg f_OrderCancelRequest_MaturityDay -> opt msg "201" parse_PutOrCall (fun msg f_OrderCancelRequest_PutOrCall -> opt msg "202" (fun x -> (match parse_float x with
        | None -> None
        | Some d -> (Some (float_Convert_6_4 d))
    )
    ) (fun msg f_OrderCancelRequest_StrikePrice -> opt msg "206" parse_char (fun msg f_OrderCancelRequest_OptAttribute -> opt msg "231" parse_float (fun msg f_OrderCancelRequest_ContractMultiplier -> opt msg "223" parse_float (fun msg f_OrderCancelRequest_CouponRate -> opt msg "207" parse_Exchange (fun msg f_OrderCancelRequest_SecurityExchange -> opt msg "106" parse_string (fun msg f_OrderCancelRequest_Issuer -> opt msg "348" parse_int (fun msg f_OrderCancelRequest_EncodedIssuerLen -> opt msg "349" parse_string (fun msg f_OrderCancelRequest_EncodedIssuer -> opt msg "107" parse_string (fun msg f_OrderCancelRequest_SecurityDesc -> opt msg "350" parse_int (fun msg f_OrderCancelRequest_EncodedSecurityDescLen -> opt msg "351" parse_string (fun msg f_OrderCancelRequest_EncodedSecurityDesc -> opt msg "54" parse_Side (fun msg f_OrderCancelRequest_Side -> opt msg "60" parse_UTCTimestamp (fun msg f_OrderCancelRequest_TransactTime -> opt msg "38" parse_float (fun msg f_OrderCancelRequest_OrderQty -> opt msg "152" parse_float (fun msg f_OrderCancelRequest_CashOrderQty -> opt msg "376" parse_string (fun msg f_OrderCancelRequest_ComplianceID -> opt msg "377" parse_SolicitedFlag (fun msg f_OrderCancelRequest_SolicitedFlag -> opt msg "58" parse_string (fun msg f_OrderCancelRequest_Text -> opt msg "354" parse_int (fun msg f_OrderCancelRequest_EncodedTextLen -> opt msg "355" parse_string (fun msg f_OrderCancelRequest_EncodedText -> opt msg "9949" parse_string (fun msg f_OrderCancelRequest_MIC -> opt msg "15" parse_Currency (fun msg f_OrderCancelRequest_Currency -> (ParseSuccess {
        f_OrderCancelRequest_OrigClOrdID = f_OrderCancelRequest_OrigClOrdID;
        f_OrderCancelRequest_OrderID = f_OrderCancelRequest_OrderID;
        f_OrderCancelRequest_ClOrdID = f_OrderCancelRequest_ClOrdID;
        f_OrderCancelRequest_ListID = f_OrderCancelRequest_ListID;
        f_OrderCancelRequest_Account = f_OrderCancelRequest_Account;
        f_OrderCancelRequest_ClientID = f_OrderCancelRequest_ClientID;
        f_OrderCancelRequest_ExecBroker = f_OrderCancelRequest_ExecBroker;
        f_OrderCancelRequest_Symbol = f_OrderCancelRequest_Symbol;
        f_OrderCancelRequest_SymbolSfx = f_OrderCancelRequest_SymbolSfx;
        f_OrderCancelRequest_SecurityID = f_OrderCancelRequest_SecurityID;
        f_OrderCancelRequest_IDSource = f_OrderCancelRequest_IDSource;
        f_OrderCancelRequest_SecurityType = f_OrderCancelRequest_SecurityType;
        f_OrderCancelRequest_MaturityMonthYear = f_OrderCancelRequest_MaturityMonthYear;
        f_OrderCancelRequest_MaturityDay = f_OrderCancelRequest_MaturityDay;
        f_OrderCancelRequest_PutOrCall = f_OrderCancelRequest_PutOrCall;
        f_OrderCancelRequest_StrikePrice = f_OrderCancelRequest_StrikePrice;
        f_OrderCancelRequest_OptAttribute = f_OrderCancelRequest_OptAttribute;
        f_OrderCancelRequest_ContractMultiplier = f_OrderCancelRequest_ContractMultiplier;
        f_OrderCancelRequest_CouponRate = f_OrderCancelRequest_CouponRate;
        f_OrderCancelRequest_SecurityExchange = f_OrderCancelRequest_SecurityExchange;
        f_OrderCancelRequest_Issuer = f_OrderCancelRequest_Issuer;
        f_OrderCancelRequest_EncodedIssuerLen = f_OrderCancelRequest_EncodedIssuerLen;
        f_OrderCancelRequest_EncodedIssuer = f_OrderCancelRequest_EncodedIssuer;
        f_OrderCancelRequest_SecurityDesc = f_OrderCancelRequest_SecurityDesc;
        f_OrderCancelRequest_EncodedSecurityDescLen = f_OrderCancelRequest_EncodedSecurityDescLen;
        f_OrderCancelRequest_EncodedSecurityDesc = f_OrderCancelRequest_EncodedSecurityDesc;
        f_OrderCancelRequest_Side = f_OrderCancelRequest_Side;
        f_OrderCancelRequest_TransactTime = f_OrderCancelRequest_TransactTime;
        f_OrderCancelRequest_OrderQty = f_OrderCancelRequest_OrderQty;
        f_OrderCancelRequest_CashOrderQty = f_OrderCancelRequest_CashOrderQty;
        f_OrderCancelRequest_ComplianceID = f_OrderCancelRequest_ComplianceID;
        f_OrderCancelRequest_SolicitedFlag = f_OrderCancelRequest_SolicitedFlag;
        f_OrderCancelRequest_Text = f_OrderCancelRequest_Text;
        f_OrderCancelRequest_EncodedTextLen = f_OrderCancelRequest_EncodedTextLen;
        f_OrderCancelRequest_EncodedText = f_OrderCancelRequest_EncodedText;
        f_OrderCancelRequest_MIC = f_OrderCancelRequest_MIC;
        f_OrderCancelRequest_Currency = f_OrderCancelRequest_Currency
    },msg)
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
    )) |> check_unknown_tags
;;

let parse_OrderMassCancelRequest (msg)  =
    (check_duplicate_tags msg (fun () -> block msg parse_Instrument (fun msg f_OrderMassCancelRequest_Instrument -> block msg parse_UnderlyingInstrument (fun msg f_OrderMassCancelRequest_UnderlyingInstrument -> opt msg "11" parse_string (fun msg f_OrderMassCancelRequest_ClOrdID -> opt msg "526" parse_string (fun msg f_OrderMassCancelRequest_SecondaryClOrdID -> opt msg "530" parse_MassCancelRequestType (fun msg f_OrderMassCancelRequest_MassCancelRequestType -> opt msg "336" parse_string (fun msg f_OrderMassCancelRequest_TradingSessionID -> opt msg "625" parse_string (fun msg f_OrderMassCancelRequest_TradingSessionSubID -> opt msg "54" parse_Side (fun msg f_OrderMassCancelRequest_Side -> opt msg "60" parse_UTCTimestamp (fun msg f_OrderMassCancelRequest_TransactTime -> opt msg "58" parse_string (fun msg f_OrderMassCancelRequest_Text -> opt msg "354" parse_int (fun msg f_OrderMassCancelRequest_EncodedTextLen -> opt msg "355" parse_string (fun msg f_OrderMassCancelRequest_EncodedText -> opt msg "1" parse_string (fun msg f_OrderMassCancelRequest_Account -> opt msg "55" parse_string (fun msg f_OrderMassCancelRequest_Symbol -> opt msg "9945" parse_string (fun msg f_OrderMassCancelRequest_ClassID -> opt msg "9941" parse_TechnicalOrdType (fun msg f_OrderMassCancelRequest_TechnicalOrdType -> opt msg "47" parse_Rule80A (fun msg f_OrderMassCancelRequest_Rule80A -> opt msg "9960" parse_string (fun msg f_OrderMassCancelRequest_CancelByLocationID -> (ParseSuccess {
        f_OrderMassCancelRequest_Instrument = f_OrderMassCancelRequest_Instrument;
        f_OrderMassCancelRequest_UnderlyingInstrument = f_OrderMassCancelRequest_UnderlyingInstrument;
        f_OrderMassCancelRequest_ClOrdID = f_OrderMassCancelRequest_ClOrdID;
        f_OrderMassCancelRequest_SecondaryClOrdID = f_OrderMassCancelRequest_SecondaryClOrdID;
        f_OrderMassCancelRequest_MassCancelRequestType = f_OrderMassCancelRequest_MassCancelRequestType;
        f_OrderMassCancelRequest_TradingSessionID = f_OrderMassCancelRequest_TradingSessionID;
        f_OrderMassCancelRequest_TradingSessionSubID = f_OrderMassCancelRequest_TradingSessionSubID;
        f_OrderMassCancelRequest_Side = f_OrderMassCancelRequest_Side;
        f_OrderMassCancelRequest_TransactTime = f_OrderMassCancelRequest_TransactTime;
        f_OrderMassCancelRequest_Text = f_OrderMassCancelRequest_Text;
        f_OrderMassCancelRequest_EncodedTextLen = f_OrderMassCancelRequest_EncodedTextLen;
        f_OrderMassCancelRequest_EncodedText = f_OrderMassCancelRequest_EncodedText;
        f_OrderMassCancelRequest_Account = f_OrderMassCancelRequest_Account;
        f_OrderMassCancelRequest_Symbol = f_OrderMassCancelRequest_Symbol;
        f_OrderMassCancelRequest_ClassID = f_OrderMassCancelRequest_ClassID;
        f_OrderMassCancelRequest_TechnicalOrdType = f_OrderMassCancelRequest_TechnicalOrdType;
        f_OrderMassCancelRequest_Rule80A = f_OrderMassCancelRequest_Rule80A;
        f_OrderMassCancelRequest_CancelByLocationID = f_OrderMassCancelRequest_CancelByLocationID
    },msg)
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
    )
    )
    )
    )
    )
    )) |> check_unknown_tags
;;

let parse_ExecutionReport (msg)  =
    (repeating msg "382" parse_ExecutionReportContraBrokers (fun msg f_ExecutionReport_ExecutionReportContraBrokers -> repeating msg "453" parse_Parties (fun msg f_ExecutionReport_Parties -> repeating msg "382" parse_ContraGrp (fun msg f_ExecutionReport_ContraGrp -> check_duplicate_tags msg (fun () -> opt msg "37" parse_string (fun msg f_ExecutionReport_OrderID -> opt msg "198" parse_string (fun msg f_ExecutionReport_SecondaryOrderID -> opt msg "11" parse_string (fun msg f_ExecutionReport_ClOrdID -> opt msg "41" parse_string (fun msg f_ExecutionReport_OrigClOrdID -> opt msg "109" parse_string (fun msg f_ExecutionReport_ClientID -> opt msg "76" parse_string (fun msg f_ExecutionReport_ExecBroker -> opt msg "66" parse_string (fun msg f_ExecutionReport_ListID -> opt msg "17" parse_string (fun msg f_ExecutionReport_ExecID -> opt msg "20" parse_ExecTransType (fun msg f_ExecutionReport_ExecTransType -> opt msg "19" parse_string (fun msg f_ExecutionReport_ExecRefID -> opt msg "150" parse_ExecType (fun msg f_ExecutionReport_ExecType -> opt msg "39" parse_OrdStatus (fun msg f_ExecutionReport_OrdStatus -> opt msg "103" parse_OrdRejReason (fun msg f_ExecutionReport_OrdRejReason -> opt msg "378" parse_ExecRestatementReason (fun msg f_ExecutionReport_ExecRestatementReason -> opt msg "1" parse_string (fun msg f_ExecutionReport_Account -> opt msg "63" parse_SettlmntTyp (fun msg f_ExecutionReport_SettlmntTyp -> opt msg "64" parse_LocalMktDate (fun msg f_ExecutionReport_FutSettDate -> opt msg "55" parse_string (fun msg f_ExecutionReport_Symbol -> opt msg "65" parse_string (fun msg f_ExecutionReport_SymbolSfx -> opt msg "48" parse_string (fun msg f_ExecutionReport_SecurityID -> opt msg "22" parse_IDSource (fun msg f_ExecutionReport_IDSource -> opt msg "167" parse_SecurityType (fun msg f_ExecutionReport_SecurityType -> opt msg "200" parse_MonthYear (fun msg f_ExecutionReport_MaturityMonthYear -> opt msg "205" parse_int (fun msg f_ExecutionReport_MaturityDay -> opt msg "201" parse_PutOrCall (fun msg f_ExecutionReport_PutOrCall -> opt msg "202" (fun x -> (match parse_float x with
        | None -> None
        | Some d -> (Some (float_Convert_6_4 d))
    )
    ) (fun msg f_ExecutionReport_StrikePrice -> opt msg "206" parse_char (fun msg f_ExecutionReport_OptAttribute -> opt msg "231" parse_float (fun msg f_ExecutionReport_ContractMultiplier -> opt msg "223" parse_float (fun msg f_ExecutionReport_CouponRate -> opt msg "207" parse_Exchange (fun msg f_ExecutionReport_SecurityExchange -> opt msg "106" parse_string (fun msg f_ExecutionReport_Issuer -> opt msg "348" parse_int (fun msg f_ExecutionReport_EncodedIssuerLen -> opt msg "349" parse_string (fun msg f_ExecutionReport_EncodedIssuer -> opt msg "107" parse_string (fun msg f_ExecutionReport_SecurityDesc -> opt msg "350" parse_int (fun msg f_ExecutionReport_EncodedSecurityDescLen -> opt msg "351" parse_string (fun msg f_ExecutionReport_EncodedSecurityDesc -> opt msg "54" parse_Side (fun msg f_ExecutionReport_Side -> opt msg "38" parse_float (fun msg f_ExecutionReport_OrderQty -> opt msg "152" parse_float (fun msg f_ExecutionReport_CashOrderQty -> opt msg "40" parse_OrdType (fun msg f_ExecutionReport_OrdType -> opt msg "44" (fun x -> (match parse_float x with
        | None -> None
        | Some d -> (Some (float_Convert_6_4 d))
    )
    ) (fun msg f_ExecutionReport_Price -> opt msg "99" (fun x -> (match parse_float x with
        | None -> None
        | Some d -> (Some (float_Convert_6_4 d))
    )
    ) (fun msg f_ExecutionReport_StopPx -> opt msg "211" parse_float (fun msg f_ExecutionReport_PegDifference -> opt msg "388" parse_DiscretionInst (fun msg f_ExecutionReport_DiscretionInst -> opt msg "389" parse_float (fun msg f_ExecutionReport_DiscretionOffset -> opt msg "15" parse_Currency (fun msg f_ExecutionReport_Currency -> opt msg "376" parse_string (fun msg f_ExecutionReport_ComplianceID -> opt msg "377" parse_SolicitedFlag (fun msg f_ExecutionReport_SolicitedFlag -> opt msg "59" parse_TimeInForce (fun msg f_ExecutionReport_TimeInForce -> opt msg "168" parse_UTCTimestamp (fun msg f_ExecutionReport_EffectiveTime -> opt msg "432" parse_LocalMktDate (fun msg f_ExecutionReport_ExpireDate -> opt msg "126" parse_UTCTimestamp (fun msg f_ExecutionReport_ExpireTime -> opt msg "18" parse_ExecInst (fun msg f_ExecutionReport_ExecInst -> opt msg "47" parse_Rule80A (fun msg f_ExecutionReport_Rule80A -> opt msg "32" parse_float (fun msg f_ExecutionReport_LastShares -> opt msg "31" (fun x -> (match parse_float x with
        | None -> None
        | Some d -> (Some (float_Convert_6_4 d))
    )
    ) (fun msg f_ExecutionReport_LastPx -> opt msg "194" (fun x -> (match parse_float x with
        | None -> None
        | Some d -> (Some (float_Convert_6_4 d))
    )
    ) (fun msg f_ExecutionReport_LastSpotRate -> opt msg "195" parse_float (fun msg f_ExecutionReport_LastForwardPoints -> opt msg "30" parse_Exchange (fun msg f_ExecutionReport_LastMkt -> opt msg "336" parse_string (fun msg f_ExecutionReport_TradingSessionID -> opt msg "29" parse_LastCapacity (fun msg f_ExecutionReport_LastCapacity -> opt msg "151" parse_float (fun msg f_ExecutionReport_LeavesQty -> opt msg "14" parse_float (fun msg f_ExecutionReport_CumQty -> opt msg "6" (fun x -> (match parse_float x with
        | None -> None
        | Some d -> (Some (float_Convert_6_4 d))
    )
    ) (fun msg f_ExecutionReport_AvgPx -> opt msg "424" parse_float (fun msg f_ExecutionReport_DayOrderQty -> opt msg "425" parse_float (fun msg f_ExecutionReport_DayCumQty -> opt msg "426" (fun x -> (match parse_float x with
        | None -> None
        | Some d -> (Some (float_Convert_6_4 d))
    )
    ) (fun msg f_ExecutionReport_DayAvgPx -> opt msg "427" parse_GTBookingInst (fun msg f_ExecutionReport_GTBookingInst -> opt msg "75" parse_LocalMktDate (fun msg f_ExecutionReport_TradeDate -> opt msg "60" parse_UTCTimestamp (fun msg f_ExecutionReport_TransactTime -> opt msg "113" parse_ReportToExch (fun msg f_ExecutionReport_ReportToExch -> opt msg "12" parse_float (fun msg f_ExecutionReport_Commission -> opt msg "13" parse_CommType (fun msg f_ExecutionReport_CommType -> opt msg "381" parse_float (fun msg f_ExecutionReport_GrossTradeAmt -> opt msg "119" parse_float (fun msg f_ExecutionReport_SettlCurrAmt -> opt msg "120" parse_Currency (fun msg f_ExecutionReport_SettlCurrency -> opt msg "155" parse_float (fun msg f_ExecutionReport_SettlCurrFxRate -> opt msg "156" parse_char (fun msg f_ExecutionReport_SettlCurrFxRateCalc -> opt msg "21" parse_HandlInst (fun msg f_ExecutionReport_HandlInst -> opt msg "110" parse_float (fun msg f_ExecutionReport_MinQty -> opt msg "111" parse_float (fun msg f_ExecutionReport_MaxFloor -> opt msg "77" parse_OpenClose (fun msg f_ExecutionReport_OpenClose -> opt msg "210" parse_float (fun msg f_ExecutionReport_MaxShow -> opt msg "58" parse_string (fun msg f_ExecutionReport_Text -> opt msg "354" parse_int (fun msg f_ExecutionReport_EncodedTextLen -> opt msg "355" parse_string (fun msg f_ExecutionReport_EncodedText -> opt msg "193" parse_LocalMktDate (fun msg f_ExecutionReport_FutSettDate2 -> opt msg "192" parse_float (fun msg f_ExecutionReport_OrderQty2 -> opt msg "439" parse_string (fun msg f_ExecutionReport_ClearingFirm -> opt msg "440" parse_string (fun msg f_ExecutionReport_ClearingAccount -> opt msg "442" parse_MultiLegReportingType (fun msg f_ExecutionReport_MultiLegReportingType -> opt msg "549" parse_CrossType (fun msg f_ExecutionReport_CrossType -> opt msg "9941" parse_TechnicalOrdType (fun msg f_ExecutionReport_TechnicalOrdType -> opt msg "9952" parse_string (fun msg f_ExecutionReport_FreeText -> opt msg "9938" parse_ClearingHandlingType (fun msg f_ExecutionReport_ClearingHandlingType -> opt msg "9731" parse_int (fun msg f_ExecutionReport_UTPExID -> opt msg "9730" parse_LiquidityIndicator (fun msg f_ExecutionReport_LiquidityIndicator -> opt msg "9955" parse_int (fun msg f_ExecutionReport_ErrorCode -> opt msg "9949" parse_string (fun msg f_ExecutionReport_MIC -> opt msg "10078" parse_BookIndicator (fun msg f_ExecutionReport_BookIndicator -> opt msg "10079" parse_BrokerPrioritization (fun msg f_ExecutionReport_BrokerPrioritization -> opt msg "10080" parse_UTCTimeOnly (fun msg f_ExecutionReport_IMPTimestamp -> opt msg "21017" parse_int (fun msg f_ExecutionReport_DEAIndicator -> opt msg "8015" parse_OrderAttributeTypes (fun msg f_ExecutionReport_OrderAttributeTypes -> (ParseSuccess {
        f_ExecutionReport_ExecutionReportContraBrokers = f_ExecutionReport_ExecutionReportContraBrokers;
        f_ExecutionReport_Parties = f_ExecutionReport_Parties;
        f_ExecutionReport_ContraGrp = f_ExecutionReport_ContraGrp;
        f_ExecutionReport_OrderID = f_ExecutionReport_OrderID;
        f_ExecutionReport_SecondaryOrderID = f_ExecutionReport_SecondaryOrderID;
        f_ExecutionReport_ClOrdID = f_ExecutionReport_ClOrdID;
        f_ExecutionReport_OrigClOrdID = f_ExecutionReport_OrigClOrdID;
        f_ExecutionReport_ClientID = f_ExecutionReport_ClientID;
        f_ExecutionReport_ExecBroker = f_ExecutionReport_ExecBroker;
        f_ExecutionReport_ListID = f_ExecutionReport_ListID;
        f_ExecutionReport_ExecID = f_ExecutionReport_ExecID;
        f_ExecutionReport_ExecTransType = f_ExecutionReport_ExecTransType;
        f_ExecutionReport_ExecRefID = f_ExecutionReport_ExecRefID;
        f_ExecutionReport_ExecType = f_ExecutionReport_ExecType;
        f_ExecutionReport_OrdStatus = f_ExecutionReport_OrdStatus;
        f_ExecutionReport_OrdRejReason = f_ExecutionReport_OrdRejReason;
        f_ExecutionReport_ExecRestatementReason = f_ExecutionReport_ExecRestatementReason;
        f_ExecutionReport_Account = f_ExecutionReport_Account;
        f_ExecutionReport_SettlmntTyp = f_ExecutionReport_SettlmntTyp;
        f_ExecutionReport_FutSettDate = f_ExecutionReport_FutSettDate;
        f_ExecutionReport_Symbol = f_ExecutionReport_Symbol;
        f_ExecutionReport_SymbolSfx = f_ExecutionReport_SymbolSfx;
        f_ExecutionReport_SecurityID = f_ExecutionReport_SecurityID;
        f_ExecutionReport_IDSource = f_ExecutionReport_IDSource;
        f_ExecutionReport_SecurityType = f_ExecutionReport_SecurityType;
        f_ExecutionReport_MaturityMonthYear = f_ExecutionReport_MaturityMonthYear;
        f_ExecutionReport_MaturityDay = f_ExecutionReport_MaturityDay;
        f_ExecutionReport_PutOrCall = f_ExecutionReport_PutOrCall;
        f_ExecutionReport_StrikePrice = f_ExecutionReport_StrikePrice;
        f_ExecutionReport_OptAttribute = f_ExecutionReport_OptAttribute;
        f_ExecutionReport_ContractMultiplier = f_ExecutionReport_ContractMultiplier;
        f_ExecutionReport_CouponRate = f_ExecutionReport_CouponRate;
        f_ExecutionReport_SecurityExchange = f_ExecutionReport_SecurityExchange;
        f_ExecutionReport_Issuer = f_ExecutionReport_Issuer;
        f_ExecutionReport_EncodedIssuerLen = f_ExecutionReport_EncodedIssuerLen;
        f_ExecutionReport_EncodedIssuer = f_ExecutionReport_EncodedIssuer;
        f_ExecutionReport_SecurityDesc = f_ExecutionReport_SecurityDesc;
        f_ExecutionReport_EncodedSecurityDescLen = f_ExecutionReport_EncodedSecurityDescLen;
        f_ExecutionReport_EncodedSecurityDesc = f_ExecutionReport_EncodedSecurityDesc;
        f_ExecutionReport_Side = f_ExecutionReport_Side;
        f_ExecutionReport_OrderQty = f_ExecutionReport_OrderQty;
        f_ExecutionReport_CashOrderQty = f_ExecutionReport_CashOrderQty;
        f_ExecutionReport_OrdType = f_ExecutionReport_OrdType;
        f_ExecutionReport_Price = f_ExecutionReport_Price;
        f_ExecutionReport_StopPx = f_ExecutionReport_StopPx;
        f_ExecutionReport_PegDifference = f_ExecutionReport_PegDifference;
        f_ExecutionReport_DiscretionInst = f_ExecutionReport_DiscretionInst;
        f_ExecutionReport_DiscretionOffset = f_ExecutionReport_DiscretionOffset;
        f_ExecutionReport_Currency = f_ExecutionReport_Currency;
        f_ExecutionReport_ComplianceID = f_ExecutionReport_ComplianceID;
        f_ExecutionReport_SolicitedFlag = f_ExecutionReport_SolicitedFlag;
        f_ExecutionReport_TimeInForce = f_ExecutionReport_TimeInForce;
        f_ExecutionReport_EffectiveTime = f_ExecutionReport_EffectiveTime;
        f_ExecutionReport_ExpireDate = f_ExecutionReport_ExpireDate;
        f_ExecutionReport_ExpireTime = f_ExecutionReport_ExpireTime;
        f_ExecutionReport_ExecInst = f_ExecutionReport_ExecInst;
        f_ExecutionReport_Rule80A = f_ExecutionReport_Rule80A;
        f_ExecutionReport_LastShares = f_ExecutionReport_LastShares;
        f_ExecutionReport_LastPx = f_ExecutionReport_LastPx;
        f_ExecutionReport_LastSpotRate = f_ExecutionReport_LastSpotRate;
        f_ExecutionReport_LastForwardPoints = f_ExecutionReport_LastForwardPoints;
        f_ExecutionReport_LastMkt = f_ExecutionReport_LastMkt;
        f_ExecutionReport_TradingSessionID = f_ExecutionReport_TradingSessionID;
        f_ExecutionReport_LastCapacity = f_ExecutionReport_LastCapacity;
        f_ExecutionReport_LeavesQty = f_ExecutionReport_LeavesQty;
        f_ExecutionReport_CumQty = f_ExecutionReport_CumQty;
        f_ExecutionReport_AvgPx = f_ExecutionReport_AvgPx;
        f_ExecutionReport_DayOrderQty = f_ExecutionReport_DayOrderQty;
        f_ExecutionReport_DayCumQty = f_ExecutionReport_DayCumQty;
        f_ExecutionReport_DayAvgPx = f_ExecutionReport_DayAvgPx;
        f_ExecutionReport_GTBookingInst = f_ExecutionReport_GTBookingInst;
        f_ExecutionReport_TradeDate = f_ExecutionReport_TradeDate;
        f_ExecutionReport_TransactTime = f_ExecutionReport_TransactTime;
        f_ExecutionReport_ReportToExch = f_ExecutionReport_ReportToExch;
        f_ExecutionReport_Commission = f_ExecutionReport_Commission;
        f_ExecutionReport_CommType = f_ExecutionReport_CommType;
        f_ExecutionReport_GrossTradeAmt = f_ExecutionReport_GrossTradeAmt;
        f_ExecutionReport_SettlCurrAmt = f_ExecutionReport_SettlCurrAmt;
        f_ExecutionReport_SettlCurrency = f_ExecutionReport_SettlCurrency;
        f_ExecutionReport_SettlCurrFxRate = f_ExecutionReport_SettlCurrFxRate;
        f_ExecutionReport_SettlCurrFxRateCalc = f_ExecutionReport_SettlCurrFxRateCalc;
        f_ExecutionReport_HandlInst = f_ExecutionReport_HandlInst;
        f_ExecutionReport_MinQty = f_ExecutionReport_MinQty;
        f_ExecutionReport_MaxFloor = f_ExecutionReport_MaxFloor;
        f_ExecutionReport_OpenClose = f_ExecutionReport_OpenClose;
        f_ExecutionReport_MaxShow = f_ExecutionReport_MaxShow;
        f_ExecutionReport_Text = f_ExecutionReport_Text;
        f_ExecutionReport_EncodedTextLen = f_ExecutionReport_EncodedTextLen;
        f_ExecutionReport_EncodedText = f_ExecutionReport_EncodedText;
        f_ExecutionReport_FutSettDate2 = f_ExecutionReport_FutSettDate2;
        f_ExecutionReport_OrderQty2 = f_ExecutionReport_OrderQty2;
        f_ExecutionReport_ClearingFirm = f_ExecutionReport_ClearingFirm;
        f_ExecutionReport_ClearingAccount = f_ExecutionReport_ClearingAccount;
        f_ExecutionReport_MultiLegReportingType = f_ExecutionReport_MultiLegReportingType;
        f_ExecutionReport_CrossType = f_ExecutionReport_CrossType;
        f_ExecutionReport_TechnicalOrdType = f_ExecutionReport_TechnicalOrdType;
        f_ExecutionReport_FreeText = f_ExecutionReport_FreeText;
        f_ExecutionReport_ClearingHandlingType = f_ExecutionReport_ClearingHandlingType;
        f_ExecutionReport_UTPExID = f_ExecutionReport_UTPExID;
        f_ExecutionReport_LiquidityIndicator = f_ExecutionReport_LiquidityIndicator;
        f_ExecutionReport_ErrorCode = f_ExecutionReport_ErrorCode;
        f_ExecutionReport_MIC = f_ExecutionReport_MIC;
        f_ExecutionReport_BookIndicator = f_ExecutionReport_BookIndicator;
        f_ExecutionReport_BrokerPrioritization = f_ExecutionReport_BrokerPrioritization;
        f_ExecutionReport_IMPTimestamp = f_ExecutionReport_IMPTimestamp;
        f_ExecutionReport_DEAIndicator = f_ExecutionReport_DEAIndicator;
        f_ExecutionReport_OrderAttributeTypes = f_ExecutionReport_OrderAttributeTypes
    },msg)
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
    )
    )
    )
    )) |> check_unknown_tags
;;

let parse_OrderCancelReject (msg)  =
    (check_duplicate_tags msg (fun () -> opt msg "37" parse_string (fun msg f_OrderCancelReject_OrderID -> opt msg "198" parse_string (fun msg f_OrderCancelReject_SecondaryOrderID -> opt msg "11" parse_string (fun msg f_OrderCancelReject_ClOrdID -> opt msg "41" parse_string (fun msg f_OrderCancelReject_OrigClOrdID -> opt msg "39" parse_OrdStatus (fun msg f_OrderCancelReject_OrdStatus -> opt msg "109" parse_string (fun msg f_OrderCancelReject_ClientID -> opt msg "76" parse_string (fun msg f_OrderCancelReject_ExecBroker -> opt msg "66" parse_string (fun msg f_OrderCancelReject_ListID -> opt msg "1" parse_string (fun msg f_OrderCancelReject_Account -> opt msg "60" parse_UTCTimestamp (fun msg f_OrderCancelReject_TransactTime -> opt msg "434" parse_CxlRejResponseTo (fun msg f_OrderCancelReject_CxlRejResponseTo -> opt msg "102" parse_CxlRejReason (fun msg f_OrderCancelReject_CxlRejReason -> opt msg "58" parse_string (fun msg f_OrderCancelReject_Text -> opt msg "354" parse_int (fun msg f_OrderCancelReject_EncodedTextLen -> opt msg "355" parse_string (fun msg f_OrderCancelReject_EncodedText -> opt msg "9955" parse_int (fun msg f_OrderCancelReject_ErrorCode -> opt msg "55" parse_string (fun msg f_OrderCancelReject_Symbol -> opt msg "18" parse_ExecInst (fun msg f_OrderCancelReject_ExecInst -> (ParseSuccess {
        f_OrderCancelReject_OrderID = f_OrderCancelReject_OrderID;
        f_OrderCancelReject_SecondaryOrderID = f_OrderCancelReject_SecondaryOrderID;
        f_OrderCancelReject_ClOrdID = f_OrderCancelReject_ClOrdID;
        f_OrderCancelReject_OrigClOrdID = f_OrderCancelReject_OrigClOrdID;
        f_OrderCancelReject_OrdStatus = f_OrderCancelReject_OrdStatus;
        f_OrderCancelReject_ClientID = f_OrderCancelReject_ClientID;
        f_OrderCancelReject_ExecBroker = f_OrderCancelReject_ExecBroker;
        f_OrderCancelReject_ListID = f_OrderCancelReject_ListID;
        f_OrderCancelReject_Account = f_OrderCancelReject_Account;
        f_OrderCancelReject_TransactTime = f_OrderCancelReject_TransactTime;
        f_OrderCancelReject_CxlRejResponseTo = f_OrderCancelReject_CxlRejResponseTo;
        f_OrderCancelReject_CxlRejReason = f_OrderCancelReject_CxlRejReason;
        f_OrderCancelReject_Text = f_OrderCancelReject_Text;
        f_OrderCancelReject_EncodedTextLen = f_OrderCancelReject_EncodedTextLen;
        f_OrderCancelReject_EncodedText = f_OrderCancelReject_EncodedText;
        f_OrderCancelReject_ErrorCode = f_OrderCancelReject_ErrorCode;
        f_OrderCancelReject_Symbol = f_OrderCancelReject_Symbol;
        f_OrderCancelReject_ExecInst = f_OrderCancelReject_ExecInst
    },msg)
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
    )
    )
    )
    )
    )
    )) |> check_unknown_tags
;;

let parse_OrderMassCancelReport (msg)  =
    (repeating msg "534" parse_AffectedOrdGrp (fun msg f_OrderMassCancelReport_AffectedOrdGrp -> check_duplicate_tags msg (fun () -> block msg parse_Instrument (fun msg f_OrderMassCancelReport_Instrument -> block msg parse_UnderlyingInstrument (fun msg f_OrderMassCancelReport_UnderlyingInstrument -> opt msg "11" parse_string (fun msg f_OrderMassCancelReport_ClOrdID -> opt msg "526" parse_string (fun msg f_OrderMassCancelReport_SecondaryClOrdID -> opt msg "37" parse_string (fun msg f_OrderMassCancelReport_OrderID -> opt msg "198" parse_string (fun msg f_OrderMassCancelReport_SecondaryOrderID -> opt msg "530" parse_MassCancelRequestType (fun msg f_OrderMassCancelReport_MassCancelRequestType -> opt msg "531" parse_MassCancelResponse (fun msg f_OrderMassCancelReport_MassCancelResponse -> opt msg "532" parse_MassCancelRejectReason (fun msg f_OrderMassCancelReport_MassCancelRejectReason -> opt msg "533" parse_int (fun msg f_OrderMassCancelReport_TotalAffectedOrders -> opt msg "336" parse_string (fun msg f_OrderMassCancelReport_TradingSessionID -> opt msg "625" parse_string (fun msg f_OrderMassCancelReport_TradingSessionSubID -> opt msg "54" parse_Side (fun msg f_OrderMassCancelReport_Side -> opt msg "60" parse_UTCTimestamp (fun msg f_OrderMassCancelReport_TransactTime -> opt msg "58" parse_string (fun msg f_OrderMassCancelReport_Text -> opt msg "354" parse_int (fun msg f_OrderMassCancelReport_EncodedTextLen -> opt msg "355" parse_string (fun msg f_OrderMassCancelReport_EncodedText -> opt msg "55" parse_string (fun msg f_OrderMassCancelReport_Symbol -> opt msg "9945" parse_string (fun msg f_OrderMassCancelReport_ClassID -> opt msg "9941" parse_TechnicalOrdType (fun msg f_OrderMassCancelReport_TechnicalOrdType -> opt msg "47" parse_Rule80A (fun msg f_OrderMassCancelReport_Rule80A -> opt msg "1" parse_string (fun msg f_OrderMassCancelReport_Account -> opt msg "9960" parse_string (fun msg f_OrderMassCancelReport_CancelByLocationID -> opt msg "9949" parse_string (fun msg f_OrderMassCancelReport_MIC -> (ParseSuccess {
        f_OrderMassCancelReport_AffectedOrdGrp = f_OrderMassCancelReport_AffectedOrdGrp;
        f_OrderMassCancelReport_Instrument = f_OrderMassCancelReport_Instrument;
        f_OrderMassCancelReport_UnderlyingInstrument = f_OrderMassCancelReport_UnderlyingInstrument;
        f_OrderMassCancelReport_ClOrdID = f_OrderMassCancelReport_ClOrdID;
        f_OrderMassCancelReport_SecondaryClOrdID = f_OrderMassCancelReport_SecondaryClOrdID;
        f_OrderMassCancelReport_OrderID = f_OrderMassCancelReport_OrderID;
        f_OrderMassCancelReport_SecondaryOrderID = f_OrderMassCancelReport_SecondaryOrderID;
        f_OrderMassCancelReport_MassCancelRequestType = f_OrderMassCancelReport_MassCancelRequestType;
        f_OrderMassCancelReport_MassCancelResponse = f_OrderMassCancelReport_MassCancelResponse;
        f_OrderMassCancelReport_MassCancelRejectReason = f_OrderMassCancelReport_MassCancelRejectReason;
        f_OrderMassCancelReport_TotalAffectedOrders = f_OrderMassCancelReport_TotalAffectedOrders;
        f_OrderMassCancelReport_TradingSessionID = f_OrderMassCancelReport_TradingSessionID;
        f_OrderMassCancelReport_TradingSessionSubID = f_OrderMassCancelReport_TradingSessionSubID;
        f_OrderMassCancelReport_Side = f_OrderMassCancelReport_Side;
        f_OrderMassCancelReport_TransactTime = f_OrderMassCancelReport_TransactTime;
        f_OrderMassCancelReport_Text = f_OrderMassCancelReport_Text;
        f_OrderMassCancelReport_EncodedTextLen = f_OrderMassCancelReport_EncodedTextLen;
        f_OrderMassCancelReport_EncodedText = f_OrderMassCancelReport_EncodedText;
        f_OrderMassCancelReport_Symbol = f_OrderMassCancelReport_Symbol;
        f_OrderMassCancelReport_ClassID = f_OrderMassCancelReport_ClassID;
        f_OrderMassCancelReport_TechnicalOrdType = f_OrderMassCancelReport_TechnicalOrdType;
        f_OrderMassCancelReport_Rule80A = f_OrderMassCancelReport_Rule80A;
        f_OrderMassCancelReport_Account = f_OrderMassCancelReport_Account;
        f_OrderMassCancelReport_CancelByLocationID = f_OrderMassCancelReport_CancelByLocationID;
        f_OrderMassCancelReport_MIC = f_OrderMassCancelReport_MIC
    },msg)
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
    )) |> check_unknown_tags
;;

let parse_app_msg_data (msg_tag) (msg)  =
    (match msg_tag with
        | Full_Msg_OrderSingle_Tag -> ((>>=) (parse_OrderSingle msg) (fun f -> ParseSuccess (FIX_Full_Msg_OrderSingle f)
        ))
        | Full_Msg_OrderCancelReplaceRequest_Tag -> ((>>=) (parse_OrderCancelReplaceRequest msg) (fun f -> ParseSuccess (FIX_Full_Msg_OrderCancelReplaceRequest f)
        ))
        | Full_Msg_OrderCancelRequest_Tag -> ((>>=) (parse_OrderCancelRequest msg) (fun f -> ParseSuccess (FIX_Full_Msg_OrderCancelRequest f)
        ))
        | Full_Msg_OrderMassCancelRequest_Tag -> ((>>=) (parse_OrderMassCancelRequest msg) (fun f -> ParseSuccess (FIX_Full_Msg_OrderMassCancelRequest f)
        ))
        | Full_Msg_ExecutionReport_Tag -> ((>>=) (parse_ExecutionReport msg) (fun f -> ParseSuccess (FIX_Full_Msg_ExecutionReport f)
        ))
        | Full_Msg_OrderCancelReject_Tag -> ((>>=) (parse_OrderCancelReject msg) (fun f -> ParseSuccess (FIX_Full_Msg_OrderCancelReject f)
        ))
        | Full_Msg_OrderMassCancelReport_Tag -> ((>>=) (parse_OrderMassCancelReport msg) (fun f -> ParseSuccess (FIX_Full_Msg_OrderMassCancelReport f)
        ))
    )
;;
