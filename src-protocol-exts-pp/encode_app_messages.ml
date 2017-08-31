(* Aesthetic Integration copyright 2017 *)
(* @meta[imandra_ignore] on @end *)
open Encode_app_enums;;
open Full_app_messages;;
open Encode_base_types;;
open Encode_app_records;;
open Encode_datetime;;
(* @meta[imandra_ignore] off @end *)

let req f x = Some (f x);;
let opt f v = match v with Some x -> Some ( f x ) | None -> None;;
let repeat f tag lst = match lst with [] -> [] | lst ->
    ( tag , lst |> List.length |> req encode_int ) :: (lst |> List.map f |> List.concat );;

let encode_Advertisement msg =
    [
    ( "2" , req encode_string msg.f_Advertisement_AdvId );
    ( "5" , req encode_AdvTransType msg.f_Advertisement_AdvTransType );
    ( "3" , opt encode_string msg.f_Advertisement_AdvRefID );
    ( "55" , req encode_string msg.f_Advertisement_Symbol );
    ( "65" , opt encode_string msg.f_Advertisement_SymbolSfx );
    ( "48" , opt encode_string msg.f_Advertisement_SecurityID );
    ( "22" , opt encode_IDSource msg.f_Advertisement_IDSource );
    ( "167" , opt encode_SecurityType msg.f_Advertisement_SecurityType );
    ( "200" , opt encode_MonthYear msg.f_Advertisement_MaturityMonthYear );
    ( "205" , opt encode_int msg.f_Advertisement_MaturityDay );
    ( "201" , opt encode_PutOrCall msg.f_Advertisement_PutOrCall );
    ( "202" , opt encode_float msg.f_Advertisement_StrikePrice );
    ( "206" , opt encode_char msg.f_Advertisement_OptAttribute );
    ( "231" , opt encode_float msg.f_Advertisement_ContractMultiplier );
    ( "223" , opt encode_float msg.f_Advertisement_CouponRate );
    ( "207" , opt encode_Exchange msg.f_Advertisement_SecurityExchange );
    ( "106" , opt encode_string msg.f_Advertisement_Issuer );
    ( "348" , opt encode_int msg.f_Advertisement_EncodedIssuerLen );
    ( "349" , opt encode_string msg.f_Advertisement_EncodedIssuer );
    ( "107" , opt encode_string msg.f_Advertisement_SecurityDesc );
    ( "350" , opt encode_int msg.f_Advertisement_EncodedSecurityDescLen );
    ( "351" , opt encode_string msg.f_Advertisement_EncodedSecurityDesc );
    ( "4" , req encode_AdvSide msg.f_Advertisement_AdvSide );
    ( "53" , req encode_float msg.f_Advertisement_Shares );
    ( "44" , opt encode_float msg.f_Advertisement_Price );
    ( "15" , opt encode_Currency msg.f_Advertisement_Currency );
    ( "75" , opt encode_LocalMktDate msg.f_Advertisement_TradeDate );
    ( "60" , opt encode_UTCTimestamp msg.f_Advertisement_TransactTime );
    ( "58" , opt encode_string msg.f_Advertisement_Text );
    ( "354" , opt encode_int msg.f_Advertisement_EncodedTextLen );
    ( "355" , opt encode_string msg.f_Advertisement_EncodedText );
    ( "149" , opt encode_string msg.f_Advertisement_URLLink );
    ( "30" , opt encode_Exchange msg.f_Advertisement_LastMkt );
    ( "336" , opt encode_string msg.f_Advertisement_TradingSessionID );
    ]
;;

let encode_Allocation msg =
    [
    ( "70" , req encode_string msg.f_Allocation_AllocID );
    ( "71" , req encode_AllocTransType msg.f_Allocation_AllocTransType );
    ( "72" , opt encode_string msg.f_Allocation_RefAllocID );
    ( "196" , opt encode_string msg.f_Allocation_AllocLinkID );
    ( "197" , opt encode_AllocLinkType msg.f_Allocation_AllocLinkType );
    ( "54" , req encode_Side msg.f_Allocation_Side );
    ( "55" , req encode_string msg.f_Allocation_Symbol );
    ( "65" , opt encode_string msg.f_Allocation_SymbolSfx );
    ( "48" , opt encode_string msg.f_Allocation_SecurityID );
    ( "22" , opt encode_IDSource msg.f_Allocation_IDSource );
    ( "167" , opt encode_SecurityType msg.f_Allocation_SecurityType );
    ( "200" , opt encode_MonthYear msg.f_Allocation_MaturityMonthYear );
    ( "205" , opt encode_int msg.f_Allocation_MaturityDay );
    ( "201" , opt encode_PutOrCall msg.f_Allocation_PutOrCall );
    ( "202" , opt encode_float msg.f_Allocation_StrikePrice );
    ( "206" , opt encode_char msg.f_Allocation_OptAttribute );
    ( "231" , opt encode_float msg.f_Allocation_ContractMultiplier );
    ( "223" , opt encode_float msg.f_Allocation_CouponRate );
    ( "207" , opt encode_Exchange msg.f_Allocation_SecurityExchange );
    ( "106" , opt encode_string msg.f_Allocation_Issuer );
    ( "348" , opt encode_int msg.f_Allocation_EncodedIssuerLen );
    ( "349" , opt encode_string msg.f_Allocation_EncodedIssuer );
    ( "107" , opt encode_string msg.f_Allocation_SecurityDesc );
    ( "350" , opt encode_int msg.f_Allocation_EncodedSecurityDescLen );
    ( "351" , opt encode_string msg.f_Allocation_EncodedSecurityDesc );
    ( "53" , req encode_float msg.f_Allocation_Shares );
    ( "30" , opt encode_Exchange msg.f_Allocation_LastMkt );
    ( "336" , opt encode_string msg.f_Allocation_TradingSessionID );
    ( "6" , req encode_float msg.f_Allocation_AvgPx );
    ( "15" , opt encode_Currency msg.f_Allocation_Currency );
    ( "74" , opt encode_int msg.f_Allocation_AvgPrxPrecision );
    ( "75" , req encode_LocalMktDate msg.f_Allocation_TradeDate );
    ( "60" , opt encode_UTCTimestamp msg.f_Allocation_TransactTime );
    ( "63" , opt encode_SettlmntTyp msg.f_Allocation_SettlmntTyp );
    ( "64" , opt encode_LocalMktDate msg.f_Allocation_FutSettDate );
    ( "381" , opt encode_float msg.f_Allocation_GrossTradeAmt );
    ( "118" , opt encode_float msg.f_Allocation_NetMoney );
    ( "77" , opt encode_OpenClose msg.f_Allocation_OpenClose );
    ( "58" , opt encode_string msg.f_Allocation_Text );
    ( "354" , opt encode_int msg.f_Allocation_EncodedTextLen );
    ( "355" , opt encode_string msg.f_Allocation_EncodedText );
    ( "157" , opt encode_int msg.f_Allocation_NumDaysInterest );
    ( "158" , opt encode_float msg.f_Allocation_AccruedInterestRate );
    ]
    @ repeat encode_AllocationOrders "73" msg.f_Allocation_AllocationOrders
    @ repeat encode_AllocationExecs "124" msg.f_Allocation_AllocationExecs
    @ repeat encode_AllocationAllocs "78" msg.f_Allocation_AllocationAllocs
    @ repeat encode_AllocationMiscFees "136" msg.f_Allocation_AllocationMiscFees
;;

let encode_AllocationInstructionAck msg =
    [
    ( "109" , opt encode_string msg.f_AllocationInstructionAck_ClientID );
    ( "76" , opt encode_string msg.f_AllocationInstructionAck_ExecBroker );
    ( "70" , req encode_string msg.f_AllocationInstructionAck_AllocID );
    ( "75" , req encode_LocalMktDate msg.f_AllocationInstructionAck_TradeDate );
    ( "60" , opt encode_UTCTimestamp msg.f_AllocationInstructionAck_TransactTime );
    ( "87" , req encode_AllocStatus msg.f_AllocationInstructionAck_AllocStatus );
    ( "88" , opt encode_AllocRejCode msg.f_AllocationInstructionAck_AllocRejCode );
    ( "58" , opt encode_string msg.f_AllocationInstructionAck_Text );
    ( "354" , opt encode_int msg.f_AllocationInstructionAck_EncodedTextLen );
    ( "355" , opt encode_string msg.f_AllocationInstructionAck_EncodedText );
    ]
;;

let encode_BidRequest msg =
    [
    ( "390" , opt encode_string msg.f_BidRequest_BidID );
    ( "391" , req encode_string msg.f_BidRequest_ClientBidID );
    ( "374" , req encode_BidRequestTransType msg.f_BidRequest_BidRequestTransType );
    ( "392" , opt encode_string msg.f_BidRequest_ListName );
    ( "393" , req encode_int msg.f_BidRequest_TotalNumSecurities );
    ( "394" , req encode_int msg.f_BidRequest_BidType );
    ( "395" , opt encode_int msg.f_BidRequest_NumTickets );
    ( "15" , opt encode_Currency msg.f_BidRequest_Currency );
    ( "396" , opt encode_float msg.f_BidRequest_SideValue1 );
    ( "397" , opt encode_float msg.f_BidRequest_SideValue2 );
    ( "409" , opt encode_LiquidityIndType msg.f_BidRequest_LiquidityIndType );
    ( "410" , opt encode_float msg.f_BidRequest_WtAverageLiquidity );
    ( "411" , opt encode_ExchangeForPhysical msg.f_BidRequest_ExchangeForPhysical );
    ( "412" , opt encode_float msg.f_BidRequest_OutMainCntryUIndex );
    ( "413" , opt encode_float msg.f_BidRequest_CrossPercent );
    ( "414" , opt encode_ProgRptReqs msg.f_BidRequest_ProgRptReqs );
    ( "415" , opt encode_int msg.f_BidRequest_ProgPeriodInterval );
    ( "416" , opt encode_IncTaxInd msg.f_BidRequest_IncTaxInd );
    ( "121" , opt encode_ForexReq msg.f_BidRequest_ForexReq );
    ( "417" , opt encode_int msg.f_BidRequest_NumBidders );
    ( "75" , opt encode_LocalMktDate msg.f_BidRequest_TradeDate );
    ( "418" , req encode_TradeType msg.f_BidRequest_TradeType );
    ( "419" , req encode_BasisPxType msg.f_BidRequest_BasisPxType );
    ( "443" , opt encode_UTCTimestamp msg.f_BidRequest_StrikeTime );
    ( "58" , opt encode_string msg.f_BidRequest_Text );
    ( "354" , opt encode_int msg.f_BidRequest_EncodedTextLen );
    ( "355" , opt encode_string msg.f_BidRequest_EncodedText );
    ]
    @ repeat encode_BidRequestBidDescriptors "398" msg.f_BidRequest_BidRequestBidDescriptors
    @ repeat encode_BidRequestBidComponents "420" msg.f_BidRequest_BidRequestBidComponents
;;

let encode_BidResponse msg =
    [
    ( "390" , opt encode_string msg.f_BidResponse_BidID );
    ( "391" , opt encode_string msg.f_BidResponse_ClientBidID );
    ]
    @ repeat encode_BidResponseBidComponents "420" msg.f_BidResponse_BidResponseBidComponents
;;

let encode_DontKnowTrade msg =
    [
    ( "37" , req encode_string msg.f_DontKnowTrade_OrderID );
    ( "17" , req encode_string msg.f_DontKnowTrade_ExecID );
    ( "127" , req encode_DKReason msg.f_DontKnowTrade_DKReason );
    ( "55" , req encode_string msg.f_DontKnowTrade_Symbol );
    ( "65" , opt encode_string msg.f_DontKnowTrade_SymbolSfx );
    ( "48" , opt encode_string msg.f_DontKnowTrade_SecurityID );
    ( "22" , opt encode_IDSource msg.f_DontKnowTrade_IDSource );
    ( "167" , opt encode_SecurityType msg.f_DontKnowTrade_SecurityType );
    ( "200" , opt encode_MonthYear msg.f_DontKnowTrade_MaturityMonthYear );
    ( "205" , opt encode_int msg.f_DontKnowTrade_MaturityDay );
    ( "201" , opt encode_PutOrCall msg.f_DontKnowTrade_PutOrCall );
    ( "202" , opt encode_float msg.f_DontKnowTrade_StrikePrice );
    ( "206" , opt encode_char msg.f_DontKnowTrade_OptAttribute );
    ( "231" , opt encode_float msg.f_DontKnowTrade_ContractMultiplier );
    ( "223" , opt encode_float msg.f_DontKnowTrade_CouponRate );
    ( "207" , opt encode_Exchange msg.f_DontKnowTrade_SecurityExchange );
    ( "106" , opt encode_string msg.f_DontKnowTrade_Issuer );
    ( "348" , opt encode_int msg.f_DontKnowTrade_EncodedIssuerLen );
    ( "349" , opt encode_string msg.f_DontKnowTrade_EncodedIssuer );
    ( "107" , opt encode_string msg.f_DontKnowTrade_SecurityDesc );
    ( "350" , opt encode_int msg.f_DontKnowTrade_EncodedSecurityDescLen );
    ( "351" , opt encode_string msg.f_DontKnowTrade_EncodedSecurityDesc );
    ( "54" , req encode_Side msg.f_DontKnowTrade_Side );
    ( "38" , opt encode_float msg.f_DontKnowTrade_OrderQty );
    ( "152" , opt encode_float msg.f_DontKnowTrade_CashOrderQty );
    ( "32" , opt encode_float msg.f_DontKnowTrade_LastShares );
    ( "31" , opt encode_float msg.f_DontKnowTrade_LastPx );
    ( "58" , opt encode_string msg.f_DontKnowTrade_Text );
    ( "354" , opt encode_int msg.f_DontKnowTrade_EncodedTextLen );
    ( "355" , opt encode_string msg.f_DontKnowTrade_EncodedText );
    ]
;;

let encode_Email msg =
    [
    ( "164" , req encode_string msg.f_Email_EmailThreadID );
    ( "94" , req encode_EmailType msg.f_Email_EmailType );
    ( "42" , opt encode_UTCTimestamp msg.f_Email_OrigTime );
    ( "147" , req encode_string msg.f_Email_Subject );
    ( "356" , opt encode_int msg.f_Email_EncodedSubjectLen );
    ( "357" , opt encode_string msg.f_Email_EncodedSubject );
    ( "37" , opt encode_string msg.f_Email_OrderID );
    ( "11" , opt encode_string msg.f_Email_ClOrdID );
    ( "95" , opt encode_int msg.f_Email_RawDataLength );
    ( "96" , opt encode_string msg.f_Email_RawData );
    ]
    @ repeat encode_EmailRoutingIDs "215" msg.f_Email_EmailRoutingIDs
    @ repeat encode_EmailRelatedSym "146" msg.f_Email_EmailRelatedSym
    @ repeat encode_EmailLinesOfText "33" msg.f_Email_EmailLinesOfText
;;

let encode_ExecutionReport msg =
    [
    ( "37" , req encode_string msg.f_ExecutionReport_OrderID );
    ( "198" , opt encode_string msg.f_ExecutionReport_SecondaryOrderID );
    ( "11" , opt encode_string msg.f_ExecutionReport_ClOrdID );
    ( "41" , opt encode_string msg.f_ExecutionReport_OrigClOrdID );
    ( "109" , opt encode_string msg.f_ExecutionReport_ClientID );
    ( "76" , opt encode_string msg.f_ExecutionReport_ExecBroker );
    ( "66" , opt encode_string msg.f_ExecutionReport_ListID );
    ( "17" , req encode_string msg.f_ExecutionReport_ExecID );
    ( "20" , req encode_ExecTransType msg.f_ExecutionReport_ExecTransType );
    ( "19" , opt encode_string msg.f_ExecutionReport_ExecRefID );
    ( "150" , req encode_ExecType msg.f_ExecutionReport_ExecType );
    ( "39" , req encode_OrdStatus msg.f_ExecutionReport_OrdStatus );
    ( "103" , opt encode_OrdRejReason msg.f_ExecutionReport_OrdRejReason );
    ( "378" , opt encode_ExecRestatementReason msg.f_ExecutionReport_ExecRestatementReason );
    ( "1" , opt encode_string msg.f_ExecutionReport_Account );
    ( "63" , opt encode_SettlmntTyp msg.f_ExecutionReport_SettlmntTyp );
    ( "64" , opt encode_LocalMktDate msg.f_ExecutionReport_FutSettDate );
    ( "55" , req encode_string msg.f_ExecutionReport_Symbol );
    ( "65" , opt encode_string msg.f_ExecutionReport_SymbolSfx );
    ( "48" , opt encode_string msg.f_ExecutionReport_SecurityID );
    ( "22" , opt encode_IDSource msg.f_ExecutionReport_IDSource );
    ( "167" , opt encode_SecurityType msg.f_ExecutionReport_SecurityType );
    ( "200" , opt encode_MonthYear msg.f_ExecutionReport_MaturityMonthYear );
    ( "205" , opt encode_int msg.f_ExecutionReport_MaturityDay );
    ( "201" , opt encode_PutOrCall msg.f_ExecutionReport_PutOrCall );
    ( "202" , opt encode_float msg.f_ExecutionReport_StrikePrice );
    ( "206" , opt encode_char msg.f_ExecutionReport_OptAttribute );
    ( "231" , opt encode_float msg.f_ExecutionReport_ContractMultiplier );
    ( "223" , opt encode_float msg.f_ExecutionReport_CouponRate );
    ( "207" , opt encode_Exchange msg.f_ExecutionReport_SecurityExchange );
    ( "106" , opt encode_string msg.f_ExecutionReport_Issuer );
    ( "348" , opt encode_int msg.f_ExecutionReport_EncodedIssuerLen );
    ( "349" , opt encode_string msg.f_ExecutionReport_EncodedIssuer );
    ( "107" , opt encode_string msg.f_ExecutionReport_SecurityDesc );
    ( "350" , opt encode_int msg.f_ExecutionReport_EncodedSecurityDescLen );
    ( "351" , opt encode_string msg.f_ExecutionReport_EncodedSecurityDesc );
    ( "54" , req encode_Side msg.f_ExecutionReport_Side );
    ( "38" , opt encode_float msg.f_ExecutionReport_OrderQty );
    ( "152" , opt encode_float msg.f_ExecutionReport_CashOrderQty );
    ( "40" , opt encode_OrdType msg.f_ExecutionReport_OrdType );
    ( "44" , opt encode_float msg.f_ExecutionReport_Price );
    ( "99" , opt encode_float msg.f_ExecutionReport_StopPx );
    ( "211" , opt encode_float msg.f_ExecutionReport_PegDifference );
    ( "388" , opt encode_DiscretionInst msg.f_ExecutionReport_DiscretionInst );
    ( "389" , opt encode_float msg.f_ExecutionReport_DiscretionOffset );
    ( "15" , opt encode_Currency msg.f_ExecutionReport_Currency );
    ( "376" , opt encode_string msg.f_ExecutionReport_ComplianceID );
    ( "377" , opt encode_SolicitedFlag msg.f_ExecutionReport_SolicitedFlag );
    ( "59" , opt encode_TimeInForce msg.f_ExecutionReport_TimeInForce );
    ( "168" , opt encode_UTCTimestamp msg.f_ExecutionReport_EffectiveTime );
    ( "432" , opt encode_LocalMktDate msg.f_ExecutionReport_ExpireDate );
    ( "126" , opt encode_UTCTimestamp msg.f_ExecutionReport_ExpireTime );
    ( "18" , opt encode_ExecInst msg.f_ExecutionReport_ExecInst );
    ( "47" , opt encode_Rule80A msg.f_ExecutionReport_Rule80A );
    ( "32" , opt encode_float msg.f_ExecutionReport_LastShares );
    ( "31" , opt encode_float msg.f_ExecutionReport_LastPx );
    ( "194" , opt encode_float msg.f_ExecutionReport_LastSpotRate );
    ( "195" , opt encode_float msg.f_ExecutionReport_LastForwardPoints );
    ( "30" , opt encode_Exchange msg.f_ExecutionReport_LastMkt );
    ( "336" , opt encode_string msg.f_ExecutionReport_TradingSessionID );
    ( "29" , opt encode_LastCapacity msg.f_ExecutionReport_LastCapacity );
    ( "151" , req encode_float msg.f_ExecutionReport_LeavesQty );
    ( "14" , req encode_float msg.f_ExecutionReport_CumQty );
    ( "6" , req encode_float msg.f_ExecutionReport_AvgPx );
    ( "424" , opt encode_float msg.f_ExecutionReport_DayOrderQty );
    ( "425" , opt encode_float msg.f_ExecutionReport_DayCumQty );
    ( "426" , opt encode_float msg.f_ExecutionReport_DayAvgPx );
    ( "427" , opt encode_GTBookingInst msg.f_ExecutionReport_GTBookingInst );
    ( "75" , opt encode_LocalMktDate msg.f_ExecutionReport_TradeDate );
    ( "60" , opt encode_UTCTimestamp msg.f_ExecutionReport_TransactTime );
    ( "113" , opt encode_ReportToExch msg.f_ExecutionReport_ReportToExch );
    ( "12" , opt encode_float msg.f_ExecutionReport_Commission );
    ( "13" , opt encode_CommType msg.f_ExecutionReport_CommType );
    ( "381" , opt encode_float msg.f_ExecutionReport_GrossTradeAmt );
    ( "119" , opt encode_float msg.f_ExecutionReport_SettlCurrAmt );
    ( "120" , opt encode_Currency msg.f_ExecutionReport_SettlCurrency );
    ( "155" , opt encode_float msg.f_ExecutionReport_SettlCurrFxRate );
    ( "156" , opt encode_char msg.f_ExecutionReport_SettlCurrFxRateCalc );
    ( "21" , opt encode_HandlInst msg.f_ExecutionReport_HandlInst );
    ( "110" , opt encode_float msg.f_ExecutionReport_MinQty );
    ( "111" , opt encode_float msg.f_ExecutionReport_MaxFloor );
    ( "77" , opt encode_OpenClose msg.f_ExecutionReport_OpenClose );
    ( "210" , opt encode_float msg.f_ExecutionReport_MaxShow );
    ( "58" , opt encode_string msg.f_ExecutionReport_Text );
    ( "354" , opt encode_int msg.f_ExecutionReport_EncodedTextLen );
    ( "355" , opt encode_string msg.f_ExecutionReport_EncodedText );
    ( "193" , opt encode_LocalMktDate msg.f_ExecutionReport_FutSettDate2 );
    ( "192" , opt encode_float msg.f_ExecutionReport_OrderQty2 );
    ( "439" , opt encode_string msg.f_ExecutionReport_ClearingFirm );
    ( "440" , opt encode_string msg.f_ExecutionReport_ClearingAccount );
    ( "442" , opt encode_MultiLegReportingType msg.f_ExecutionReport_MultiLegReportingType );
    ]
    @ repeat encode_ExecutionReportContraBrokers "382" msg.f_ExecutionReport_ExecutionReportContraBrokers
;;

let encode_IOI msg =
    [
    ( "23" , req encode_string msg.f_IOI_IOIid );
    ( "28" , req encode_IOITransType msg.f_IOI_IOITransType );
    ( "26" , opt encode_string msg.f_IOI_IOIRefID );
    ( "55" , req encode_string msg.f_IOI_Symbol );
    ( "65" , opt encode_string msg.f_IOI_SymbolSfx );
    ( "48" , opt encode_string msg.f_IOI_SecurityID );
    ( "22" , opt encode_IDSource msg.f_IOI_IDSource );
    ( "167" , opt encode_SecurityType msg.f_IOI_SecurityType );
    ( "200" , opt encode_MonthYear msg.f_IOI_MaturityMonthYear );
    ( "205" , opt encode_int msg.f_IOI_MaturityDay );
    ( "201" , opt encode_PutOrCall msg.f_IOI_PutOrCall );
    ( "202" , opt encode_float msg.f_IOI_StrikePrice );
    ( "206" , opt encode_char msg.f_IOI_OptAttribute );
    ( "231" , opt encode_float msg.f_IOI_ContractMultiplier );
    ( "223" , opt encode_float msg.f_IOI_CouponRate );
    ( "207" , opt encode_Exchange msg.f_IOI_SecurityExchange );
    ( "106" , opt encode_string msg.f_IOI_Issuer );
    ( "348" , opt encode_int msg.f_IOI_EncodedIssuerLen );
    ( "349" , opt encode_string msg.f_IOI_EncodedIssuer );
    ( "107" , opt encode_string msg.f_IOI_SecurityDesc );
    ( "350" , opt encode_int msg.f_IOI_EncodedSecurityDescLen );
    ( "351" , opt encode_string msg.f_IOI_EncodedSecurityDesc );
    ( "54" , req encode_Side msg.f_IOI_Side );
    ( "27" , req encode_IOIShares msg.f_IOI_IOIShares );
    ( "44" , opt encode_float msg.f_IOI_Price );
    ( "15" , opt encode_Currency msg.f_IOI_Currency );
    ( "62" , opt encode_UTCTimestamp msg.f_IOI_ValidUntilTime );
    ( "25" , opt encode_IOIQltyInd msg.f_IOI_IOIQltyInd );
    ( "130" , opt encode_IOINaturalFlag msg.f_IOI_IOINaturalFlag );
    ( "58" , opt encode_string msg.f_IOI_Text );
    ( "354" , opt encode_int msg.f_IOI_EncodedTextLen );
    ( "355" , opt encode_string msg.f_IOI_EncodedText );
    ( "60" , opt encode_UTCTimestamp msg.f_IOI_TransactTime );
    ( "149" , opt encode_string msg.f_IOI_URLLink );
    ( "218" , opt encode_float msg.f_IOI_SpreadToBenchmark );
    ( "219" , opt encode_Benchmark msg.f_IOI_Benchmark );
    ]
    @ repeat encode_IOIIOIQualifiers "199" msg.f_IOI_IOIIOIQualifiers
    @ repeat encode_IOIRoutingIDs "215" msg.f_IOI_IOIRoutingIDs
;;

let encode_ListCancelRequest msg =
    [
    ( "66" , req encode_string msg.f_ListCancelRequest_ListID );
    ( "60" , req encode_UTCTimestamp msg.f_ListCancelRequest_TransactTime );
    ( "58" , opt encode_string msg.f_ListCancelRequest_Text );
    ( "354" , opt encode_int msg.f_ListCancelRequest_EncodedTextLen );
    ( "355" , opt encode_string msg.f_ListCancelRequest_EncodedText );
    ]
;;

let encode_ListExecute msg =
    [
    ( "66" , req encode_string msg.f_ListExecute_ListID );
    ( "391" , opt encode_string msg.f_ListExecute_ClientBidID );
    ( "390" , opt encode_string msg.f_ListExecute_BidID );
    ( "60" , req encode_UTCTimestamp msg.f_ListExecute_TransactTime );
    ( "58" , opt encode_string msg.f_ListExecute_Text );
    ( "354" , opt encode_int msg.f_ListExecute_EncodedTextLen );
    ( "355" , opt encode_string msg.f_ListExecute_EncodedText );
    ]
;;

let encode_ListStatus msg =
    [
    ( "66" , req encode_string msg.f_ListStatus_ListID );
    ( "429" , req encode_int msg.f_ListStatus_ListStatusType );
    ( "82" , req encode_int msg.f_ListStatus_NoRpts );
    ( "431" , req encode_int msg.f_ListStatus_ListOrderStatus );
    ( "83" , req encode_int msg.f_ListStatus_RptSeq );
    ( "444" , opt encode_string msg.f_ListStatus_ListStatusText );
    ( "445" , opt encode_int msg.f_ListStatus_EncodedListStatusTextLen );
    ( "446" , opt encode_string msg.f_ListStatus_EncodedListStatusText );
    ( "60" , opt encode_UTCTimestamp msg.f_ListStatus_TransactTime );
    ( "68" , req encode_int msg.f_ListStatus_TotNoOrders );
    ]
    @ repeat encode_ListStatusOrders "73" msg.f_ListStatus_ListStatusOrders
;;

let encode_ListStatusRequest msg =
    [
    ( "66" , req encode_string msg.f_ListStatusRequest_ListID );
    ( "58" , opt encode_string msg.f_ListStatusRequest_Text );
    ( "354" , opt encode_int msg.f_ListStatusRequest_EncodedTextLen );
    ( "355" , opt encode_string msg.f_ListStatusRequest_EncodedText );
    ]
;;

let encode_ListStrikePrice msg =
    [
    ( "66" , req encode_string msg.f_ListStrikePrice_ListID );
    ( "422" , req encode_int msg.f_ListStrikePrice_TotNoStrikes );
    ]
    @ repeat encode_ListStrikePriceStrikes "428" msg.f_ListStrikePrice_ListStrikePriceStrikes
;;

let encode_MarketDataIncrementalRefresh msg =
    [
    ( "262" , opt encode_string msg.f_MarketDataIncrementalRefresh_MDReqID );
    ]
    @ repeat encode_MarketDataIncrementalRefreshMDEntries "268" msg.f_MarketDataIncrementalRefresh_MarketDataIncrementalRefreshMDEntries
;;

let encode_MarketDataRequest msg =
    [
    ( "262" , req encode_string msg.f_MarketDataRequest_MDReqID );
    ( "263" , req encode_SubscriptionRequestType msg.f_MarketDataRequest_SubscriptionRequestType );
    ( "264" , req encode_int msg.f_MarketDataRequest_MarketDepth );
    ( "265" , opt encode_MDUpdateType msg.f_MarketDataRequest_MDUpdateType );
    ( "266" , opt encode_AggregatedBook msg.f_MarketDataRequest_AggregatedBook );
    ]
    @ repeat encode_MarketDataRequestMDEntryTypes "267" msg.f_MarketDataRequest_MarketDataRequestMDEntryTypes
    @ repeat encode_MarketDataRequestRelatedSym "146" msg.f_MarketDataRequest_MarketDataRequestRelatedSym
;;

let encode_MarketDataRequestReject msg =
    [
    ( "262" , req encode_string msg.f_MarketDataRequestReject_MDReqID );
    ( "281" , opt encode_MDReqRejReason msg.f_MarketDataRequestReject_MDReqRejReason );
    ( "58" , opt encode_string msg.f_MarketDataRequestReject_Text );
    ( "354" , opt encode_int msg.f_MarketDataRequestReject_EncodedTextLen );
    ( "355" , opt encode_string msg.f_MarketDataRequestReject_EncodedText );
    ]
;;

let encode_MarketDataSnapshotFullRefresh msg =
    [
    ( "262" , opt encode_string msg.f_MarketDataSnapshotFullRefresh_MDReqID );
    ( "55" , req encode_string msg.f_MarketDataSnapshotFullRefresh_Symbol );
    ( "65" , opt encode_string msg.f_MarketDataSnapshotFullRefresh_SymbolSfx );
    ( "48" , opt encode_string msg.f_MarketDataSnapshotFullRefresh_SecurityID );
    ( "22" , opt encode_IDSource msg.f_MarketDataSnapshotFullRefresh_IDSource );
    ( "167" , opt encode_SecurityType msg.f_MarketDataSnapshotFullRefresh_SecurityType );
    ( "200" , opt encode_MonthYear msg.f_MarketDataSnapshotFullRefresh_MaturityMonthYear );
    ( "205" , opt encode_int msg.f_MarketDataSnapshotFullRefresh_MaturityDay );
    ( "201" , opt encode_PutOrCall msg.f_MarketDataSnapshotFullRefresh_PutOrCall );
    ( "202" , opt encode_float msg.f_MarketDataSnapshotFullRefresh_StrikePrice );
    ( "206" , opt encode_char msg.f_MarketDataSnapshotFullRefresh_OptAttribute );
    ( "231" , opt encode_float msg.f_MarketDataSnapshotFullRefresh_ContractMultiplier );
    ( "223" , opt encode_float msg.f_MarketDataSnapshotFullRefresh_CouponRate );
    ( "207" , opt encode_Exchange msg.f_MarketDataSnapshotFullRefresh_SecurityExchange );
    ( "106" , opt encode_string msg.f_MarketDataSnapshotFullRefresh_Issuer );
    ( "348" , opt encode_int msg.f_MarketDataSnapshotFullRefresh_EncodedIssuerLen );
    ( "349" , opt encode_string msg.f_MarketDataSnapshotFullRefresh_EncodedIssuer );
    ( "107" , opt encode_string msg.f_MarketDataSnapshotFullRefresh_SecurityDesc );
    ( "350" , opt encode_int msg.f_MarketDataSnapshotFullRefresh_EncodedSecurityDescLen );
    ( "351" , opt encode_string msg.f_MarketDataSnapshotFullRefresh_EncodedSecurityDesc );
    ( "291" , opt encode_FinancialStatus msg.f_MarketDataSnapshotFullRefresh_FinancialStatus );
    ( "292" , opt encode_CorporateAction msg.f_MarketDataSnapshotFullRefresh_CorporateAction );
    ( "387" , opt encode_float msg.f_MarketDataSnapshotFullRefresh_TotalVolumeTraded );
    ]
    @ repeat encode_MarketDataSnapshotFullRefreshMDEntries "268" msg.f_MarketDataSnapshotFullRefresh_MarketDataSnapshotFullRefreshMDEntries
;;

let encode_MassQuote msg =
    [
    ( "131" , opt encode_string msg.f_MassQuote_QuoteReqID );
    ( "117" , req encode_string msg.f_MassQuote_QuoteID );
    ( "301" , opt encode_QuoteResponseLevel msg.f_MassQuote_QuoteResponseLevel );
    ( "293" , opt encode_float msg.f_MassQuote_DefBidSize );
    ( "294" , opt encode_float msg.f_MassQuote_DefOfferSize );
    ]
    @ repeat encode_MassQuoteQuoteSets "296" msg.f_MassQuote_MassQuoteQuoteSets
    @ repeat encode_MassQuoteQuoteEntries "295" msg.f_MassQuote_MassQuoteQuoteEntries
;;

let encode_News msg =
    [
    ( "42" , opt encode_UTCTimestamp msg.f_News_OrigTime );
    ( "61" , opt encode_Urgency msg.f_News_Urgency );
    ( "148" , req encode_string msg.f_News_Headline );
    ( "358" , opt encode_int msg.f_News_EncodedHeadlineLen );
    ( "359" , opt encode_string msg.f_News_EncodedHeadline );
    ( "149" , opt encode_string msg.f_News_URLLink );
    ( "95" , opt encode_int msg.f_News_RawDataLength );
    ( "96" , opt encode_string msg.f_News_RawData );
    ]
    @ repeat encode_NewsRoutingIDs "215" msg.f_News_NewsRoutingIDs
    @ repeat encode_NewsRelatedSym "146" msg.f_News_NewsRelatedSym
    @ repeat encode_NewsLinesOfText "33" msg.f_News_NewsLinesOfText
;;

let encode_OrderCancelReject msg =
    [
    ( "37" , req encode_string msg.f_OrderCancelReject_OrderID );
    ( "198" , opt encode_string msg.f_OrderCancelReject_SecondaryOrderID );
    ( "11" , req encode_string msg.f_OrderCancelReject_ClOrdID );
    ( "41" , req encode_string msg.f_OrderCancelReject_OrigClOrdID );
    ( "39" , req encode_OrdStatus msg.f_OrderCancelReject_OrdStatus );
    ( "109" , opt encode_string msg.f_OrderCancelReject_ClientID );
    ( "76" , opt encode_string msg.f_OrderCancelReject_ExecBroker );
    ( "66" , opt encode_string msg.f_OrderCancelReject_ListID );
    ( "1" , opt encode_string msg.f_OrderCancelReject_Account );
    ( "60" , opt encode_UTCTimestamp msg.f_OrderCancelReject_TransactTime );
    ( "434" , req encode_CxlRejResponseTo msg.f_OrderCancelReject_CxlRejResponseTo );
    ( "102" , opt encode_CxlRejReason msg.f_OrderCancelReject_CxlRejReason );
    ( "58" , opt encode_string msg.f_OrderCancelReject_Text );
    ( "354" , opt encode_int msg.f_OrderCancelReject_EncodedTextLen );
    ( "355" , opt encode_string msg.f_OrderCancelReject_EncodedText );
    ]
;;

let encode_OrderCancelReplaceRequest msg =
    [
    ( "37" , opt encode_string msg.f_OrderCancelReplaceRequest_OrderID );
    ( "109" , opt encode_string msg.f_OrderCancelReplaceRequest_ClientID );
    ( "76" , opt encode_string msg.f_OrderCancelReplaceRequest_ExecBroker );
    ( "41" , req encode_string msg.f_OrderCancelReplaceRequest_OrigClOrdID );
    ( "11" , req encode_string msg.f_OrderCancelReplaceRequest_ClOrdID );
    ( "66" , opt encode_string msg.f_OrderCancelReplaceRequest_ListID );
    ( "1" , opt encode_string msg.f_OrderCancelReplaceRequest_Account );
    ( "63" , opt encode_SettlmntTyp msg.f_OrderCancelReplaceRequest_SettlmntTyp );
    ( "64" , opt encode_LocalMktDate msg.f_OrderCancelReplaceRequest_FutSettDate );
    ( "21" , req encode_HandlInst msg.f_OrderCancelReplaceRequest_HandlInst );
    ( "18" , opt encode_ExecInst msg.f_OrderCancelReplaceRequest_ExecInst );
    ( "110" , opt encode_float msg.f_OrderCancelReplaceRequest_MinQty );
    ( "111" , opt encode_float msg.f_OrderCancelReplaceRequest_MaxFloor );
    ( "100" , opt encode_Exchange msg.f_OrderCancelReplaceRequest_ExDestination );
    ( "55" , req encode_string msg.f_OrderCancelReplaceRequest_Symbol );
    ( "65" , opt encode_string msg.f_OrderCancelReplaceRequest_SymbolSfx );
    ( "48" , opt encode_string msg.f_OrderCancelReplaceRequest_SecurityID );
    ( "22" , opt encode_IDSource msg.f_OrderCancelReplaceRequest_IDSource );
    ( "167" , opt encode_SecurityType msg.f_OrderCancelReplaceRequest_SecurityType );
    ( "200" , opt encode_MonthYear msg.f_OrderCancelReplaceRequest_MaturityMonthYear );
    ( "205" , opt encode_int msg.f_OrderCancelReplaceRequest_MaturityDay );
    ( "201" , opt encode_PutOrCall msg.f_OrderCancelReplaceRequest_PutOrCall );
    ( "202" , opt encode_float msg.f_OrderCancelReplaceRequest_StrikePrice );
    ( "206" , opt encode_char msg.f_OrderCancelReplaceRequest_OptAttribute );
    ( "231" , opt encode_float msg.f_OrderCancelReplaceRequest_ContractMultiplier );
    ( "223" , opt encode_float msg.f_OrderCancelReplaceRequest_CouponRate );
    ( "207" , opt encode_Exchange msg.f_OrderCancelReplaceRequest_SecurityExchange );
    ( "106" , opt encode_string msg.f_OrderCancelReplaceRequest_Issuer );
    ( "348" , opt encode_int msg.f_OrderCancelReplaceRequest_EncodedIssuerLen );
    ( "349" , opt encode_string msg.f_OrderCancelReplaceRequest_EncodedIssuer );
    ( "107" , opt encode_string msg.f_OrderCancelReplaceRequest_SecurityDesc );
    ( "350" , opt encode_int msg.f_OrderCancelReplaceRequest_EncodedSecurityDescLen );
    ( "351" , opt encode_string msg.f_OrderCancelReplaceRequest_EncodedSecurityDesc );
    ( "54" , req encode_Side msg.f_OrderCancelReplaceRequest_Side );
    ( "60" , req encode_UTCTimestamp msg.f_OrderCancelReplaceRequest_TransactTime );
    ( "38" , opt encode_float msg.f_OrderCancelReplaceRequest_OrderQty );
    ( "152" , opt encode_float msg.f_OrderCancelReplaceRequest_CashOrderQty );
    ( "40" , req encode_OrdType msg.f_OrderCancelReplaceRequest_OrdType );
    ( "44" , opt encode_float msg.f_OrderCancelReplaceRequest_Price );
    ( "99" , opt encode_float msg.f_OrderCancelReplaceRequest_StopPx );
    ( "211" , opt encode_float msg.f_OrderCancelReplaceRequest_PegDifference );
    ( "388" , opt encode_DiscretionInst msg.f_OrderCancelReplaceRequest_DiscretionInst );
    ( "389" , opt encode_float msg.f_OrderCancelReplaceRequest_DiscretionOffset );
    ( "376" , opt encode_string msg.f_OrderCancelReplaceRequest_ComplianceID );
    ( "377" , opt encode_SolicitedFlag msg.f_OrderCancelReplaceRequest_SolicitedFlag );
    ( "15" , opt encode_Currency msg.f_OrderCancelReplaceRequest_Currency );
    ( "59" , opt encode_TimeInForce msg.f_OrderCancelReplaceRequest_TimeInForce );
    ( "168" , opt encode_UTCTimestamp msg.f_OrderCancelReplaceRequest_EffectiveTime );
    ( "432" , opt encode_LocalMktDate msg.f_OrderCancelReplaceRequest_ExpireDate );
    ( "126" , opt encode_UTCTimestamp msg.f_OrderCancelReplaceRequest_ExpireTime );
    ( "427" , opt encode_GTBookingInst msg.f_OrderCancelReplaceRequest_GTBookingInst );
    ( "12" , opt encode_float msg.f_OrderCancelReplaceRequest_Commission );
    ( "13" , opt encode_CommType msg.f_OrderCancelReplaceRequest_CommType );
    ( "47" , opt encode_Rule80A msg.f_OrderCancelReplaceRequest_Rule80A );
    ( "121" , opt encode_ForexReq msg.f_OrderCancelReplaceRequest_ForexReq );
    ( "120" , opt encode_Currency msg.f_OrderCancelReplaceRequest_SettlCurrency );
    ( "58" , opt encode_string msg.f_OrderCancelReplaceRequest_Text );
    ( "354" , opt encode_int msg.f_OrderCancelReplaceRequest_EncodedTextLen );
    ( "355" , opt encode_string msg.f_OrderCancelReplaceRequest_EncodedText );
    ( "193" , opt encode_LocalMktDate msg.f_OrderCancelReplaceRequest_FutSettDate2 );
    ( "192" , opt encode_float msg.f_OrderCancelReplaceRequest_OrderQty2 );
    ( "77" , opt encode_OpenClose msg.f_OrderCancelReplaceRequest_OpenClose );
    ( "203" , opt encode_CoveredOrUncovered msg.f_OrderCancelReplaceRequest_CoveredOrUncovered );
    ( "204" , opt encode_CustomerOrFirm msg.f_OrderCancelReplaceRequest_CustomerOrFirm );
    ( "210" , opt encode_float msg.f_OrderCancelReplaceRequest_MaxShow );
    ( "114" , opt encode_LocateReqd msg.f_OrderCancelReplaceRequest_LocateReqd );
    ( "439" , opt encode_string msg.f_OrderCancelReplaceRequest_ClearingFirm );
    ( "440" , opt encode_string msg.f_OrderCancelReplaceRequest_ClearingAccount );
    ]
    @ repeat encode_OrderCancelReplaceRequestAllocs "78" msg.f_OrderCancelReplaceRequest_OrderCancelReplaceRequestAllocs
    @ repeat encode_OrderCancelReplaceRequestTradingSessions "386" msg.f_OrderCancelReplaceRequest_OrderCancelReplaceRequestTradingSessions
;;

let encode_OrderCancelRequest msg =
    [
    ( "41" , req encode_string msg.f_OrderCancelRequest_OrigClOrdID );
    ( "37" , opt encode_string msg.f_OrderCancelRequest_OrderID );
    ( "11" , req encode_string msg.f_OrderCancelRequest_ClOrdID );
    ( "66" , opt encode_string msg.f_OrderCancelRequest_ListID );
    ( "1" , opt encode_string msg.f_OrderCancelRequest_Account );
    ( "109" , opt encode_string msg.f_OrderCancelRequest_ClientID );
    ( "76" , opt encode_string msg.f_OrderCancelRequest_ExecBroker );
    ( "55" , req encode_string msg.f_OrderCancelRequest_Symbol );
    ( "65" , opt encode_string msg.f_OrderCancelRequest_SymbolSfx );
    ( "48" , opt encode_string msg.f_OrderCancelRequest_SecurityID );
    ( "22" , opt encode_IDSource msg.f_OrderCancelRequest_IDSource );
    ( "167" , opt encode_SecurityType msg.f_OrderCancelRequest_SecurityType );
    ( "200" , opt encode_MonthYear msg.f_OrderCancelRequest_MaturityMonthYear );
    ( "205" , opt encode_int msg.f_OrderCancelRequest_MaturityDay );
    ( "201" , opt encode_PutOrCall msg.f_OrderCancelRequest_PutOrCall );
    ( "202" , opt encode_float msg.f_OrderCancelRequest_StrikePrice );
    ( "206" , opt encode_char msg.f_OrderCancelRequest_OptAttribute );
    ( "231" , opt encode_float msg.f_OrderCancelRequest_ContractMultiplier );
    ( "223" , opt encode_float msg.f_OrderCancelRequest_CouponRate );
    ( "207" , opt encode_Exchange msg.f_OrderCancelRequest_SecurityExchange );
    ( "106" , opt encode_string msg.f_OrderCancelRequest_Issuer );
    ( "348" , opt encode_int msg.f_OrderCancelRequest_EncodedIssuerLen );
    ( "349" , opt encode_string msg.f_OrderCancelRequest_EncodedIssuer );
    ( "107" , opt encode_string msg.f_OrderCancelRequest_SecurityDesc );
    ( "350" , opt encode_int msg.f_OrderCancelRequest_EncodedSecurityDescLen );
    ( "351" , opt encode_string msg.f_OrderCancelRequest_EncodedSecurityDesc );
    ( "54" , req encode_Side msg.f_OrderCancelRequest_Side );
    ( "60" , req encode_UTCTimestamp msg.f_OrderCancelRequest_TransactTime );
    ( "38" , opt encode_float msg.f_OrderCancelRequest_OrderQty );
    ( "152" , opt encode_float msg.f_OrderCancelRequest_CashOrderQty );
    ( "376" , opt encode_string msg.f_OrderCancelRequest_ComplianceID );
    ( "377" , opt encode_SolicitedFlag msg.f_OrderCancelRequest_SolicitedFlag );
    ( "58" , opt encode_string msg.f_OrderCancelRequest_Text );
    ( "354" , opt encode_int msg.f_OrderCancelRequest_EncodedTextLen );
    ( "355" , opt encode_string msg.f_OrderCancelRequest_EncodedText );
    ]
;;

let encode_OrderList msg =
    [
    ( "66" , req encode_string msg.f_OrderList_ListID );
    ( "390" , opt encode_string msg.f_OrderList_BidID );
    ( "391" , opt encode_string msg.f_OrderList_ClientBidID );
    ( "414" , opt encode_ProgRptReqs msg.f_OrderList_ProgRptReqs );
    ( "394" , req encode_int msg.f_OrderList_BidType );
    ( "415" , opt encode_int msg.f_OrderList_ProgPeriodInterval );
    ( "433" , opt encode_ListExecInstType msg.f_OrderList_ListExecInstType );
    ( "69" , opt encode_string msg.f_OrderList_ListExecInst );
    ( "352" , opt encode_int msg.f_OrderList_EncodedListExecInstLen );
    ( "353" , opt encode_string msg.f_OrderList_EncodedListExecInst );
    ( "68" , req encode_int msg.f_OrderList_TotNoOrders );
    ]
    @ repeat encode_OrderListOrders "73" msg.f_OrderList_OrderListOrders
    @ repeat encode_OrderListAllocs "78" msg.f_OrderList_OrderListAllocs
    @ repeat encode_OrderListTradingSessions "386" msg.f_OrderList_OrderListTradingSessions
;;

let encode_OrderSingle msg =
    [
    ( "11" , req encode_string msg.f_OrderSingle_ClOrdID );
    ( "109" , opt encode_string msg.f_OrderSingle_ClientID );
    ( "76" , opt encode_string msg.f_OrderSingle_ExecBroker );
    ( "1" , opt encode_string msg.f_OrderSingle_Account );
    ( "63" , opt encode_SettlmntTyp msg.f_OrderSingle_SettlmntTyp );
    ( "64" , opt encode_LocalMktDate msg.f_OrderSingle_FutSettDate );
    ( "21" , req encode_HandlInst msg.f_OrderSingle_HandlInst );
    ( "18" , opt encode_ExecInst msg.f_OrderSingle_ExecInst );
    ( "110" , opt encode_float msg.f_OrderSingle_MinQty );
    ( "111" , opt encode_float msg.f_OrderSingle_MaxFloor );
    ( "100" , opt encode_Exchange msg.f_OrderSingle_ExDestination );
    ( "81" , opt encode_ProcessCode msg.f_OrderSingle_ProcessCode );
    ( "55" , req encode_string msg.f_OrderSingle_Symbol );
    ( "65" , opt encode_string msg.f_OrderSingle_SymbolSfx );
    ( "48" , opt encode_string msg.f_OrderSingle_SecurityID );
    ( "22" , opt encode_IDSource msg.f_OrderSingle_IDSource );
    ( "167" , opt encode_SecurityType msg.f_OrderSingle_SecurityType );
    ( "200" , opt encode_MonthYear msg.f_OrderSingle_MaturityMonthYear );
    ( "205" , opt encode_int msg.f_OrderSingle_MaturityDay );
    ( "201" , opt encode_PutOrCall msg.f_OrderSingle_PutOrCall );
    ( "202" , opt encode_float msg.f_OrderSingle_StrikePrice );
    ( "206" , opt encode_char msg.f_OrderSingle_OptAttribute );
    ( "231" , opt encode_float msg.f_OrderSingle_ContractMultiplier );
    ( "223" , opt encode_float msg.f_OrderSingle_CouponRate );
    ( "207" , opt encode_Exchange msg.f_OrderSingle_SecurityExchange );
    ( "106" , opt encode_string msg.f_OrderSingle_Issuer );
    ( "348" , opt encode_int msg.f_OrderSingle_EncodedIssuerLen );
    ( "349" , opt encode_string msg.f_OrderSingle_EncodedIssuer );
    ( "107" , opt encode_string msg.f_OrderSingle_SecurityDesc );
    ( "350" , opt encode_int msg.f_OrderSingle_EncodedSecurityDescLen );
    ( "351" , opt encode_string msg.f_OrderSingle_EncodedSecurityDesc );
    ( "140" , opt encode_float msg.f_OrderSingle_PrevClosePx );
    ( "54" , req encode_Side msg.f_OrderSingle_Side );
    ( "114" , opt encode_LocateReqd msg.f_OrderSingle_LocateReqd );
    ( "60" , req encode_UTCTimestamp msg.f_OrderSingle_TransactTime );
    ( "38" , opt encode_float msg.f_OrderSingle_OrderQty );
    ( "152" , opt encode_float msg.f_OrderSingle_CashOrderQty );
    ( "40" , req encode_OrdType msg.f_OrderSingle_OrdType );
    ( "44" , opt encode_float msg.f_OrderSingle_Price );
    ( "99" , opt encode_float msg.f_OrderSingle_StopPx );
    ( "15" , opt encode_Currency msg.f_OrderSingle_Currency );
    ( "376" , opt encode_string msg.f_OrderSingle_ComplianceID );
    ( "377" , opt encode_SolicitedFlag msg.f_OrderSingle_SolicitedFlag );
    ( "23" , opt encode_string msg.f_OrderSingle_IOIid );
    ( "117" , opt encode_string msg.f_OrderSingle_QuoteID );
    ( "59" , opt encode_TimeInForce msg.f_OrderSingle_TimeInForce );
    ( "168" , opt encode_UTCTimestamp msg.f_OrderSingle_EffectiveTime );
    ( "432" , opt encode_LocalMktDate msg.f_OrderSingle_ExpireDate );
    ( "126" , opt encode_UTCTimestamp msg.f_OrderSingle_ExpireTime );
    ( "427" , opt encode_GTBookingInst msg.f_OrderSingle_GTBookingInst );
    ( "12" , opt encode_float msg.f_OrderSingle_Commission );
    ( "13" , opt encode_CommType msg.f_OrderSingle_CommType );
    ( "47" , opt encode_Rule80A msg.f_OrderSingle_Rule80A );
    ( "121" , opt encode_ForexReq msg.f_OrderSingle_ForexReq );
    ( "120" , opt encode_Currency msg.f_OrderSingle_SettlCurrency );
    ( "58" , opt encode_string msg.f_OrderSingle_Text );
    ( "354" , opt encode_int msg.f_OrderSingle_EncodedTextLen );
    ( "355" , opt encode_string msg.f_OrderSingle_EncodedText );
    ( "193" , opt encode_LocalMktDate msg.f_OrderSingle_FutSettDate2 );
    ( "192" , opt encode_float msg.f_OrderSingle_OrderQty2 );
    ( "77" , opt encode_OpenClose msg.f_OrderSingle_OpenClose );
    ( "203" , opt encode_CoveredOrUncovered msg.f_OrderSingle_CoveredOrUncovered );
    ( "204" , opt encode_CustomerOrFirm msg.f_OrderSingle_CustomerOrFirm );
    ( "210" , opt encode_float msg.f_OrderSingle_MaxShow );
    ( "211" , opt encode_float msg.f_OrderSingle_PegDifference );
    ( "388" , opt encode_DiscretionInst msg.f_OrderSingle_DiscretionInst );
    ( "389" , opt encode_float msg.f_OrderSingle_DiscretionOffset );
    ( "439" , opt encode_string msg.f_OrderSingle_ClearingFirm );
    ( "440" , opt encode_string msg.f_OrderSingle_ClearingAccount );
    ]
    @ repeat encode_OrderSingleAllocs "78" msg.f_OrderSingle_OrderSingleAllocs
    @ repeat encode_OrderSingleTradingSessions "386" msg.f_OrderSingle_OrderSingleTradingSessions
;;

let encode_OrderStatusRequest msg =
    [
    ( "37" , opt encode_string msg.f_OrderStatusRequest_OrderID );
    ( "11" , req encode_string msg.f_OrderStatusRequest_ClOrdID );
    ( "109" , opt encode_string msg.f_OrderStatusRequest_ClientID );
    ( "1" , opt encode_string msg.f_OrderStatusRequest_Account );
    ( "76" , opt encode_string msg.f_OrderStatusRequest_ExecBroker );
    ( "55" , req encode_string msg.f_OrderStatusRequest_Symbol );
    ( "65" , opt encode_string msg.f_OrderStatusRequest_SymbolSfx );
    ( "48" , opt encode_string msg.f_OrderStatusRequest_SecurityID );
    ( "22" , opt encode_IDSource msg.f_OrderStatusRequest_IDSource );
    ( "167" , opt encode_SecurityType msg.f_OrderStatusRequest_SecurityType );
    ( "200" , opt encode_MonthYear msg.f_OrderStatusRequest_MaturityMonthYear );
    ( "205" , opt encode_int msg.f_OrderStatusRequest_MaturityDay );
    ( "201" , opt encode_PutOrCall msg.f_OrderStatusRequest_PutOrCall );
    ( "202" , opt encode_float msg.f_OrderStatusRequest_StrikePrice );
    ( "206" , opt encode_char msg.f_OrderStatusRequest_OptAttribute );
    ( "231" , opt encode_float msg.f_OrderStatusRequest_ContractMultiplier );
    ( "223" , opt encode_float msg.f_OrderStatusRequest_CouponRate );
    ( "207" , opt encode_Exchange msg.f_OrderStatusRequest_SecurityExchange );
    ( "106" , opt encode_string msg.f_OrderStatusRequest_Issuer );
    ( "348" , opt encode_int msg.f_OrderStatusRequest_EncodedIssuerLen );
    ( "349" , opt encode_string msg.f_OrderStatusRequest_EncodedIssuer );
    ( "107" , opt encode_string msg.f_OrderStatusRequest_SecurityDesc );
    ( "350" , opt encode_int msg.f_OrderStatusRequest_EncodedSecurityDescLen );
    ( "351" , opt encode_string msg.f_OrderStatusRequest_EncodedSecurityDesc );
    ( "54" , req encode_Side msg.f_OrderStatusRequest_Side );
    ]
;;

let encode_Quote msg =
    [
    ( "131" , opt encode_string msg.f_Quote_QuoteReqID );
    ( "117" , req encode_string msg.f_Quote_QuoteID );
    ( "301" , opt encode_QuoteResponseLevel msg.f_Quote_QuoteResponseLevel );
    ( "336" , opt encode_string msg.f_Quote_TradingSessionID );
    ( "55" , req encode_string msg.f_Quote_Symbol );
    ( "65" , opt encode_string msg.f_Quote_SymbolSfx );
    ( "48" , opt encode_string msg.f_Quote_SecurityID );
    ( "22" , opt encode_IDSource msg.f_Quote_IDSource );
    ( "167" , opt encode_SecurityType msg.f_Quote_SecurityType );
    ( "200" , opt encode_MonthYear msg.f_Quote_MaturityMonthYear );
    ( "205" , opt encode_int msg.f_Quote_MaturityDay );
    ( "201" , opt encode_PutOrCall msg.f_Quote_PutOrCall );
    ( "202" , opt encode_float msg.f_Quote_StrikePrice );
    ( "206" , opt encode_char msg.f_Quote_OptAttribute );
    ( "231" , opt encode_float msg.f_Quote_ContractMultiplier );
    ( "223" , opt encode_float msg.f_Quote_CouponRate );
    ( "207" , opt encode_Exchange msg.f_Quote_SecurityExchange );
    ( "106" , opt encode_string msg.f_Quote_Issuer );
    ( "348" , opt encode_int msg.f_Quote_EncodedIssuerLen );
    ( "349" , opt encode_string msg.f_Quote_EncodedIssuer );
    ( "107" , opt encode_string msg.f_Quote_SecurityDesc );
    ( "350" , opt encode_int msg.f_Quote_EncodedSecurityDescLen );
    ( "351" , opt encode_string msg.f_Quote_EncodedSecurityDesc );
    ( "132" , opt encode_float msg.f_Quote_BidPx );
    ( "133" , opt encode_float msg.f_Quote_OfferPx );
    ( "134" , opt encode_float msg.f_Quote_BidSize );
    ( "135" , opt encode_float msg.f_Quote_OfferSize );
    ( "62" , opt encode_UTCTimestamp msg.f_Quote_ValidUntilTime );
    ( "188" , opt encode_float msg.f_Quote_BidSpotRate );
    ( "190" , opt encode_float msg.f_Quote_OfferSpotRate );
    ( "189" , opt encode_float msg.f_Quote_BidForwardPoints );
    ( "191" , opt encode_float msg.f_Quote_OfferForwardPoints );
    ( "60" , opt encode_UTCTimestamp msg.f_Quote_TransactTime );
    ( "64" , opt encode_LocalMktDate msg.f_Quote_FutSettDate );
    ( "40" , opt encode_OrdType msg.f_Quote_OrdType );
    ( "193" , opt encode_LocalMktDate msg.f_Quote_FutSettDate2 );
    ( "192" , opt encode_float msg.f_Quote_OrderQty2 );
    ( "15" , opt encode_Currency msg.f_Quote_Currency );
    ]
;;

let encode_QuoteAcknowledgement msg =
    [
    ( "131" , opt encode_string msg.f_QuoteAcknowledgement_QuoteReqID );
    ( "117" , opt encode_string msg.f_QuoteAcknowledgement_QuoteID );
    ( "297" , req encode_QuoteAckStatus msg.f_QuoteAcknowledgement_QuoteAckStatus );
    ( "300" , opt encode_QuoteRejectReason msg.f_QuoteAcknowledgement_QuoteRejectReason );
    ( "301" , opt encode_QuoteResponseLevel msg.f_QuoteAcknowledgement_QuoteResponseLevel );
    ( "336" , opt encode_string msg.f_QuoteAcknowledgement_TradingSessionID );
    ( "58" , opt encode_string msg.f_QuoteAcknowledgement_Text );
    ]
    @ repeat encode_QuoteAcknowledgementQuoteSets "296" msg.f_QuoteAcknowledgement_QuoteAcknowledgementQuoteSets
    @ repeat encode_QuoteAcknowledgementQuoteEntries "295" msg.f_QuoteAcknowledgement_QuoteAcknowledgementQuoteEntries
;;

let encode_QuoteCancel msg =
    [
    ( "131" , opt encode_string msg.f_QuoteCancel_QuoteReqID );
    ( "117" , req encode_string msg.f_QuoteCancel_QuoteID );
    ( "298" , req encode_QuoteCancelType msg.f_QuoteCancel_QuoteCancelType );
    ( "301" , opt encode_QuoteResponseLevel msg.f_QuoteCancel_QuoteResponseLevel );
    ( "336" , opt encode_string msg.f_QuoteCancel_TradingSessionID );
    ]
    @ repeat encode_QuoteCancelQuoteEntries "295" msg.f_QuoteCancel_QuoteCancelQuoteEntries
;;

let encode_QuoteRequest msg =
    [
    ( "131" , req encode_string msg.f_QuoteRequest_QuoteReqID );
    ]
    @ repeat encode_QuoteRequestRelatedSym "146" msg.f_QuoteRequest_QuoteRequestRelatedSym
;;

let encode_QuoteStatusRequest msg =
    [
    ( "117" , opt encode_string msg.f_QuoteStatusRequest_QuoteID );
    ( "55" , req encode_string msg.f_QuoteStatusRequest_Symbol );
    ( "65" , opt encode_string msg.f_QuoteStatusRequest_SymbolSfx );
    ( "48" , opt encode_string msg.f_QuoteStatusRequest_SecurityID );
    ( "22" , opt encode_IDSource msg.f_QuoteStatusRequest_IDSource );
    ( "167" , opt encode_SecurityType msg.f_QuoteStatusRequest_SecurityType );
    ( "200" , opt encode_MonthYear msg.f_QuoteStatusRequest_MaturityMonthYear );
    ( "205" , opt encode_int msg.f_QuoteStatusRequest_MaturityDay );
    ( "201" , opt encode_PutOrCall msg.f_QuoteStatusRequest_PutOrCall );
    ( "202" , opt encode_float msg.f_QuoteStatusRequest_StrikePrice );
    ( "206" , opt encode_char msg.f_QuoteStatusRequest_OptAttribute );
    ( "231" , opt encode_float msg.f_QuoteStatusRequest_ContractMultiplier );
    ( "223" , opt encode_float msg.f_QuoteStatusRequest_CouponRate );
    ( "207" , opt encode_Exchange msg.f_QuoteStatusRequest_SecurityExchange );
    ( "106" , opt encode_string msg.f_QuoteStatusRequest_Issuer );
    ( "348" , opt encode_int msg.f_QuoteStatusRequest_EncodedIssuerLen );
    ( "349" , opt encode_string msg.f_QuoteStatusRequest_EncodedIssuer );
    ( "107" , opt encode_string msg.f_QuoteStatusRequest_SecurityDesc );
    ( "350" , opt encode_int msg.f_QuoteStatusRequest_EncodedSecurityDescLen );
    ( "351" , opt encode_string msg.f_QuoteStatusRequest_EncodedSecurityDesc );
    ( "54" , opt encode_Side msg.f_QuoteStatusRequest_Side );
    ( "336" , opt encode_string msg.f_QuoteStatusRequest_TradingSessionID );
    ]
;;

let encode_SecurityDefinition msg =
    [
    ( "320" , req encode_string msg.f_SecurityDefinition_SecurityReqID );
    ( "322" , req encode_string msg.f_SecurityDefinition_SecurityResponseID );
    ( "323" , opt encode_SecurityResponseType msg.f_SecurityDefinition_SecurityResponseType );
    ( "393" , req encode_int msg.f_SecurityDefinition_TotalNumSecurities );
    ( "55" , opt encode_string msg.f_SecurityDefinition_Symbol );
    ( "65" , opt encode_string msg.f_SecurityDefinition_SymbolSfx );
    ( "48" , opt encode_string msg.f_SecurityDefinition_SecurityID );
    ( "22" , opt encode_IDSource msg.f_SecurityDefinition_IDSource );
    ( "167" , opt encode_SecurityType msg.f_SecurityDefinition_SecurityType );
    ( "200" , opt encode_MonthYear msg.f_SecurityDefinition_MaturityMonthYear );
    ( "205" , opt encode_int msg.f_SecurityDefinition_MaturityDay );
    ( "201" , opt encode_PutOrCall msg.f_SecurityDefinition_PutOrCall );
    ( "202" , opt encode_float msg.f_SecurityDefinition_StrikePrice );
    ( "206" , opt encode_char msg.f_SecurityDefinition_OptAttribute );
    ( "231" , opt encode_float msg.f_SecurityDefinition_ContractMultiplier );
    ( "223" , opt encode_float msg.f_SecurityDefinition_CouponRate );
    ( "207" , opt encode_Exchange msg.f_SecurityDefinition_SecurityExchange );
    ( "106" , opt encode_string msg.f_SecurityDefinition_Issuer );
    ( "348" , opt encode_int msg.f_SecurityDefinition_EncodedIssuerLen );
    ( "349" , opt encode_string msg.f_SecurityDefinition_EncodedIssuer );
    ( "107" , opt encode_string msg.f_SecurityDefinition_SecurityDesc );
    ( "350" , opt encode_int msg.f_SecurityDefinition_EncodedSecurityDescLen );
    ( "351" , opt encode_string msg.f_SecurityDefinition_EncodedSecurityDesc );
    ( "15" , opt encode_Currency msg.f_SecurityDefinition_Currency );
    ( "336" , opt encode_string msg.f_SecurityDefinition_TradingSessionID );
    ( "58" , opt encode_string msg.f_SecurityDefinition_Text );
    ( "354" , opt encode_int msg.f_SecurityDefinition_EncodedTextLen );
    ( "355" , opt encode_string msg.f_SecurityDefinition_EncodedText );
    ]
    @ repeat encode_SecurityDefinitionRelatedSym "146" msg.f_SecurityDefinition_SecurityDefinitionRelatedSym
;;

let encode_SecurityDefinitionRequest msg =
    [
    ( "320" , req encode_string msg.f_SecurityDefinitionRequest_SecurityReqID );
    ( "321" , req encode_SecurityRequestType msg.f_SecurityDefinitionRequest_SecurityRequestType );
    ( "55" , opt encode_string msg.f_SecurityDefinitionRequest_Symbol );
    ( "65" , opt encode_string msg.f_SecurityDefinitionRequest_SymbolSfx );
    ( "48" , opt encode_string msg.f_SecurityDefinitionRequest_SecurityID );
    ( "22" , opt encode_IDSource msg.f_SecurityDefinitionRequest_IDSource );
    ( "167" , opt encode_SecurityType msg.f_SecurityDefinitionRequest_SecurityType );
    ( "200" , opt encode_MonthYear msg.f_SecurityDefinitionRequest_MaturityMonthYear );
    ( "205" , opt encode_int msg.f_SecurityDefinitionRequest_MaturityDay );
    ( "201" , opt encode_PutOrCall msg.f_SecurityDefinitionRequest_PutOrCall );
    ( "202" , opt encode_float msg.f_SecurityDefinitionRequest_StrikePrice );
    ( "206" , opt encode_char msg.f_SecurityDefinitionRequest_OptAttribute );
    ( "231" , opt encode_float msg.f_SecurityDefinitionRequest_ContractMultiplier );
    ( "223" , opt encode_float msg.f_SecurityDefinitionRequest_CouponRate );
    ( "207" , opt encode_Exchange msg.f_SecurityDefinitionRequest_SecurityExchange );
    ( "106" , opt encode_string msg.f_SecurityDefinitionRequest_Issuer );
    ( "348" , opt encode_int msg.f_SecurityDefinitionRequest_EncodedIssuerLen );
    ( "349" , opt encode_string msg.f_SecurityDefinitionRequest_EncodedIssuer );
    ( "107" , opt encode_string msg.f_SecurityDefinitionRequest_SecurityDesc );
    ( "350" , opt encode_int msg.f_SecurityDefinitionRequest_EncodedSecurityDescLen );
    ( "351" , opt encode_string msg.f_SecurityDefinitionRequest_EncodedSecurityDesc );
    ( "15" , opt encode_Currency msg.f_SecurityDefinitionRequest_Currency );
    ( "58" , opt encode_string msg.f_SecurityDefinitionRequest_Text );
    ( "354" , opt encode_int msg.f_SecurityDefinitionRequest_EncodedTextLen );
    ( "355" , opt encode_string msg.f_SecurityDefinitionRequest_EncodedText );
    ( "336" , opt encode_string msg.f_SecurityDefinitionRequest_TradingSessionID );
    ]
    @ repeat encode_SecurityDefinitionRequestRelatedSym "146" msg.f_SecurityDefinitionRequest_SecurityDefinitionRequestRelatedSym
;;

let encode_SecurityStatus msg =
    [
    ( "324" , opt encode_string msg.f_SecurityStatus_SecurityStatusReqID );
    ( "55" , req encode_string msg.f_SecurityStatus_Symbol );
    ( "65" , opt encode_string msg.f_SecurityStatus_SymbolSfx );
    ( "48" , opt encode_string msg.f_SecurityStatus_SecurityID );
    ( "22" , opt encode_IDSource msg.f_SecurityStatus_IDSource );
    ( "167" , opt encode_SecurityType msg.f_SecurityStatus_SecurityType );
    ( "200" , opt encode_MonthYear msg.f_SecurityStatus_MaturityMonthYear );
    ( "205" , opt encode_int msg.f_SecurityStatus_MaturityDay );
    ( "201" , opt encode_PutOrCall msg.f_SecurityStatus_PutOrCall );
    ( "202" , opt encode_float msg.f_SecurityStatus_StrikePrice );
    ( "206" , opt encode_char msg.f_SecurityStatus_OptAttribute );
    ( "231" , opt encode_float msg.f_SecurityStatus_ContractMultiplier );
    ( "223" , opt encode_float msg.f_SecurityStatus_CouponRate );
    ( "207" , opt encode_Exchange msg.f_SecurityStatus_SecurityExchange );
    ( "106" , opt encode_string msg.f_SecurityStatus_Issuer );
    ( "348" , opt encode_int msg.f_SecurityStatus_EncodedIssuerLen );
    ( "349" , opt encode_string msg.f_SecurityStatus_EncodedIssuer );
    ( "107" , opt encode_string msg.f_SecurityStatus_SecurityDesc );
    ( "350" , opt encode_int msg.f_SecurityStatus_EncodedSecurityDescLen );
    ( "351" , opt encode_string msg.f_SecurityStatus_EncodedSecurityDesc );
    ( "15" , opt encode_Currency msg.f_SecurityStatus_Currency );
    ( "336" , opt encode_string msg.f_SecurityStatus_TradingSessionID );
    ( "325" , opt encode_UnsolicitedIndicator msg.f_SecurityStatus_UnsolicitedIndicator );
    ( "326" , opt encode_SecurityTradingStatus msg.f_SecurityStatus_SecurityTradingStatus );
    ( "291" , opt encode_FinancialStatus msg.f_SecurityStatus_FinancialStatus );
    ( "292" , opt encode_CorporateAction msg.f_SecurityStatus_CorporateAction );
    ( "327" , opt encode_HaltReason msg.f_SecurityStatus_HaltReason );
    ( "328" , opt encode_InViewOfCommon msg.f_SecurityStatus_InViewOfCommon );
    ( "329" , opt encode_DueToRelated msg.f_SecurityStatus_DueToRelated );
    ( "330" , opt encode_float msg.f_SecurityStatus_BuyVolume );
    ( "331" , opt encode_float msg.f_SecurityStatus_SellVolume );
    ( "332" , opt encode_float msg.f_SecurityStatus_HighPx );
    ( "333" , opt encode_float msg.f_SecurityStatus_LowPx );
    ( "31" , opt encode_float msg.f_SecurityStatus_LastPx );
    ( "60" , opt encode_UTCTimestamp msg.f_SecurityStatus_TransactTime );
    ( "334" , opt encode_Adjustment msg.f_SecurityStatus_Adjustment );
    ]
;;

let encode_SecurityStatusRequest msg =
    [
    ( "324" , req encode_string msg.f_SecurityStatusRequest_SecurityStatusReqID );
    ( "55" , req encode_string msg.f_SecurityStatusRequest_Symbol );
    ( "65" , opt encode_string msg.f_SecurityStatusRequest_SymbolSfx );
    ( "48" , opt encode_string msg.f_SecurityStatusRequest_SecurityID );
    ( "22" , opt encode_IDSource msg.f_SecurityStatusRequest_IDSource );
    ( "167" , opt encode_SecurityType msg.f_SecurityStatusRequest_SecurityType );
    ( "200" , opt encode_MonthYear msg.f_SecurityStatusRequest_MaturityMonthYear );
    ( "205" , opt encode_int msg.f_SecurityStatusRequest_MaturityDay );
    ( "201" , opt encode_PutOrCall msg.f_SecurityStatusRequest_PutOrCall );
    ( "202" , opt encode_float msg.f_SecurityStatusRequest_StrikePrice );
    ( "206" , opt encode_char msg.f_SecurityStatusRequest_OptAttribute );
    ( "231" , opt encode_float msg.f_SecurityStatusRequest_ContractMultiplier );
    ( "223" , opt encode_float msg.f_SecurityStatusRequest_CouponRate );
    ( "207" , opt encode_Exchange msg.f_SecurityStatusRequest_SecurityExchange );
    ( "106" , opt encode_string msg.f_SecurityStatusRequest_Issuer );
    ( "348" , opt encode_int msg.f_SecurityStatusRequest_EncodedIssuerLen );
    ( "349" , opt encode_string msg.f_SecurityStatusRequest_EncodedIssuer );
    ( "107" , opt encode_string msg.f_SecurityStatusRequest_SecurityDesc );
    ( "350" , opt encode_int msg.f_SecurityStatusRequest_EncodedSecurityDescLen );
    ( "351" , opt encode_string msg.f_SecurityStatusRequest_EncodedSecurityDesc );
    ( "15" , opt encode_Currency msg.f_SecurityStatusRequest_Currency );
    ( "263" , req encode_SubscriptionRequestType msg.f_SecurityStatusRequest_SubscriptionRequestType );
    ( "336" , opt encode_string msg.f_SecurityStatusRequest_TradingSessionID );
    ]
;;

let encode_SettlementInstructions msg =
    [
    ( "162" , req encode_string msg.f_SettlementInstructions_SettlInstID );
    ( "163" , req encode_SettlInstTransType msg.f_SettlementInstructions_SettlInstTransType );
    ( "214" , req encode_string msg.f_SettlementInstructions_SettlInstRefID );
    ( "160" , req encode_SettlInstMode msg.f_SettlementInstructions_SettlInstMode );
    ( "165" , req encode_SettlInstSource msg.f_SettlementInstructions_SettlInstSource );
    ( "79" , req encode_string msg.f_SettlementInstructions_AllocAccount );
    ( "166" , opt encode_SettlLocation msg.f_SettlementInstructions_SettlLocation );
    ( "75" , opt encode_LocalMktDate msg.f_SettlementInstructions_TradeDate );
    ( "70" , opt encode_string msg.f_SettlementInstructions_AllocID );
    ( "30" , opt encode_Exchange msg.f_SettlementInstructions_LastMkt );
    ( "336" , opt encode_string msg.f_SettlementInstructions_TradingSessionID );
    ( "54" , opt encode_Side msg.f_SettlementInstructions_Side );
    ( "167" , opt encode_SecurityType msg.f_SettlementInstructions_SecurityType );
    ( "168" , opt encode_UTCTimestamp msg.f_SettlementInstructions_EffectiveTime );
    ( "60" , req encode_UTCTimestamp msg.f_SettlementInstructions_TransactTime );
    ( "109" , opt encode_string msg.f_SettlementInstructions_ClientID );
    ( "76" , opt encode_string msg.f_SettlementInstructions_ExecBroker );
    ( "169" , opt encode_StandInstDbType msg.f_SettlementInstructions_StandInstDbType );
    ( "170" , opt encode_string msg.f_SettlementInstructions_StandInstDbName );
    ( "171" , opt encode_string msg.f_SettlementInstructions_StandInstDbID );
    ( "172" , opt encode_int msg.f_SettlementInstructions_SettlDeliveryType );
    ( "173" , opt encode_string msg.f_SettlementInstructions_SettlDepositoryCode );
    ( "174" , opt encode_string msg.f_SettlementInstructions_SettlBrkrCode );
    ( "175" , opt encode_string msg.f_SettlementInstructions_SettlInstCode );
    ( "176" , opt encode_string msg.f_SettlementInstructions_SecuritySettlAgentName );
    ( "177" , opt encode_string msg.f_SettlementInstructions_SecuritySettlAgentCode );
    ( "178" , opt encode_string msg.f_SettlementInstructions_SecuritySettlAgentAcctNum );
    ( "179" , opt encode_string msg.f_SettlementInstructions_SecuritySettlAgentAcctName );
    ( "180" , opt encode_string msg.f_SettlementInstructions_SecuritySettlAgentContactName );
    ( "181" , opt encode_string msg.f_SettlementInstructions_SecuritySettlAgentContactPhone );
    ( "182" , opt encode_string msg.f_SettlementInstructions_CashSettlAgentName );
    ( "183" , opt encode_string msg.f_SettlementInstructions_CashSettlAgentCode );
    ( "184" , opt encode_string msg.f_SettlementInstructions_CashSettlAgentAcctNum );
    ( "185" , opt encode_string msg.f_SettlementInstructions_CashSettlAgentAcctName );
    ( "186" , opt encode_string msg.f_SettlementInstructions_CashSettlAgentContactName );
    ( "187" , opt encode_string msg.f_SettlementInstructions_CashSettlAgentContactPhone );
    ]
;;

let encode_TradingSessionStatus msg =
    [
    ( "335" , opt encode_string msg.f_TradingSessionStatus_TradSesReqID );
    ( "336" , req encode_string msg.f_TradingSessionStatus_TradingSessionID );
    ( "338" , opt encode_TradSesMethod msg.f_TradingSessionStatus_TradSesMethod );
    ( "339" , opt encode_TradSesMode msg.f_TradingSessionStatus_TradSesMode );
    ( "325" , opt encode_UnsolicitedIndicator msg.f_TradingSessionStatus_UnsolicitedIndicator );
    ( "340" , req encode_TradSesStatus msg.f_TradingSessionStatus_TradSesStatus );
    ( "341" , opt encode_UTCTimestamp msg.f_TradingSessionStatus_TradSesStartTime );
    ( "342" , opt encode_UTCTimestamp msg.f_TradingSessionStatus_TradSesOpenTime );
    ( "343" , opt encode_UTCTimestamp msg.f_TradingSessionStatus_TradSesPreCloseTime );
    ( "344" , opt encode_UTCTimestamp msg.f_TradingSessionStatus_TradSesCloseTime );
    ( "345" , opt encode_UTCTimestamp msg.f_TradingSessionStatus_TradSesEndTime );
    ( "387" , opt encode_float msg.f_TradingSessionStatus_TotalVolumeTraded );
    ( "58" , opt encode_string msg.f_TradingSessionStatus_Text );
    ( "354" , opt encode_int msg.f_TradingSessionStatus_EncodedTextLen );
    ( "355" , opt encode_string msg.f_TradingSessionStatus_EncodedText );
    ]
;;

let encode_TradingSessionStatusRequest msg =
    [
    ( "335" , req encode_string msg.f_TradingSessionStatusRequest_TradSesReqID );
    ( "336" , opt encode_string msg.f_TradingSessionStatusRequest_TradingSessionID );
    ( "338" , opt encode_TradSesMethod msg.f_TradingSessionStatusRequest_TradSesMethod );
    ( "339" , opt encode_TradSesMode msg.f_TradingSessionStatusRequest_TradSesMode );
    ( "263" , req encode_SubscriptionRequestType msg.f_TradingSessionStatusRequest_SubscriptionRequestType );
    ]
;;

let encode_app_msg_data msg =
    (match msg with
        | FIX_Full_Msg_Advertisement msg -> (encode_Advertisement msg)
        | FIX_Full_Msg_Allocation msg -> (encode_Allocation msg)
        | FIX_Full_Msg_AllocationInstructionAck msg -> (encode_AllocationInstructionAck msg)
        | FIX_Full_Msg_BidRequest msg -> (encode_BidRequest msg)
        | FIX_Full_Msg_BidResponse msg -> (encode_BidResponse msg)
        | FIX_Full_Msg_DontKnowTrade msg -> (encode_DontKnowTrade msg)
        | FIX_Full_Msg_Email msg -> (encode_Email msg)
        | FIX_Full_Msg_ExecutionReport msg -> (encode_ExecutionReport msg)
        | FIX_Full_Msg_IOI msg -> (encode_IOI msg)
        | FIX_Full_Msg_ListCancelRequest msg -> (encode_ListCancelRequest msg)
        | FIX_Full_Msg_ListExecute msg -> (encode_ListExecute msg)
        | FIX_Full_Msg_ListStatus msg -> (encode_ListStatus msg)
        | FIX_Full_Msg_ListStatusRequest msg -> (encode_ListStatusRequest msg)
        | FIX_Full_Msg_ListStrikePrice msg -> (encode_ListStrikePrice msg)
        | FIX_Full_Msg_MarketDataIncrementalRefresh msg -> (encode_MarketDataIncrementalRefresh msg)
        | FIX_Full_Msg_MarketDataRequest msg -> (encode_MarketDataRequest msg)
        | FIX_Full_Msg_MarketDataRequestReject msg -> (encode_MarketDataRequestReject msg)
        | FIX_Full_Msg_MarketDataSnapshotFullRefresh msg -> (encode_MarketDataSnapshotFullRefresh msg)
        | FIX_Full_Msg_MassQuote msg -> (encode_MassQuote msg)
        | FIX_Full_Msg_News msg -> (encode_News msg)
        | FIX_Full_Msg_OrderCancelReject msg -> (encode_OrderCancelReject msg)
        | FIX_Full_Msg_OrderCancelReplaceRequest msg -> (encode_OrderCancelReplaceRequest msg)
        | FIX_Full_Msg_OrderCancelRequest msg -> (encode_OrderCancelRequest msg)
        | FIX_Full_Msg_OrderList msg -> (encode_OrderList msg)
        | FIX_Full_Msg_OrderSingle msg -> (encode_OrderSingle msg)
        | FIX_Full_Msg_OrderStatusRequest msg -> (encode_OrderStatusRequest msg)
        | FIX_Full_Msg_Quote msg -> (encode_Quote msg)
        | FIX_Full_Msg_QuoteAcknowledgement msg -> (encode_QuoteAcknowledgement msg)
        | FIX_Full_Msg_QuoteCancel msg -> (encode_QuoteCancel msg)
        | FIX_Full_Msg_QuoteRequest msg -> (encode_QuoteRequest msg)
        | FIX_Full_Msg_QuoteStatusRequest msg -> (encode_QuoteStatusRequest msg)
        | FIX_Full_Msg_SecurityDefinition msg -> (encode_SecurityDefinition msg)
        | FIX_Full_Msg_SecurityDefinitionRequest msg -> (encode_SecurityDefinitionRequest msg)
        | FIX_Full_Msg_SecurityStatus msg -> (encode_SecurityStatus msg)
        | FIX_Full_Msg_SecurityStatusRequest msg -> (encode_SecurityStatusRequest msg)
        | FIX_Full_Msg_SettlementInstructions msg -> (encode_SettlementInstructions msg)
        | FIX_Full_Msg_TradingSessionStatus msg -> (encode_TradingSessionStatus msg)
        | FIX_Full_Msg_TradingSessionStatusRequest msg -> (encode_TradingSessionStatusRequest msg)
    )
;;
