(* Aesthetic Integration copyright 2017 *)
(* @meta[imandra_ignore] on @end *)
open Base_types_json;;
open Full_app_records_json;;
open Full_app_messages;;
open Datetime_json;;
open Yojson;;
open Full_app_enums_json;;
(* @meta[imandra_ignore] off @end *)

let assoc_filter_nulls l : json =
    `Assoc ( List.filter (function ( _, `Null ) -> false | _ -> true ) l )
;;
let rg f lst : json =
    match lst with [] -> `Null | lst -> `List ( List.map f lst)
;;

let advertisement_to_json x : json =
     assoc_filter_nulls [
    ( "AdvId" , string_to_json x.f_Advertisement_AdvId );
    ( "AdvTransType" , advtranstype_to_json x.f_Advertisement_AdvTransType );
    ( "AdvRefID" , string_opt_to_json x.f_Advertisement_AdvRefID );
    ( "Symbol" , string_to_json x.f_Advertisement_Symbol );
    ( "SymbolSfx" , string_opt_to_json x.f_Advertisement_SymbolSfx );
    ( "SecurityID" , string_opt_to_json x.f_Advertisement_SecurityID );
    ( "IDSource" , idsource_opt_to_json x.f_Advertisement_IDSource );
    ( "SecurityType" , securitytype_opt_to_json x.f_Advertisement_SecurityType );
    ( "MaturityMonthYear" , monthyear_opt_to_json x.f_Advertisement_MaturityMonthYear );
    ( "MaturityDay" , int_opt_to_json x.f_Advertisement_MaturityDay );
    ( "PutOrCall" , putorcall_opt_to_json x.f_Advertisement_PutOrCall );
    ( "StrikePrice" , float_opt_to_json x.f_Advertisement_StrikePrice );
    ( "OptAttribute" , char_opt_to_json x.f_Advertisement_OptAttribute );
    ( "ContractMultiplier" , float_opt_to_json x.f_Advertisement_ContractMultiplier );
    ( "CouponRate" , float_opt_to_json x.f_Advertisement_CouponRate );
    ( "SecurityExchange" , exchange_opt_to_json x.f_Advertisement_SecurityExchange );
    ( "Issuer" , string_opt_to_json x.f_Advertisement_Issuer );
    ( "EncodedIssuerLen" , int_opt_to_json x.f_Advertisement_EncodedIssuerLen );
    ( "EncodedIssuer" , string_opt_to_json x.f_Advertisement_EncodedIssuer );
    ( "SecurityDesc" , string_opt_to_json x.f_Advertisement_SecurityDesc );
    ( "EncodedSecurityDescLen" , int_opt_to_json x.f_Advertisement_EncodedSecurityDescLen );
    ( "EncodedSecurityDesc" , string_opt_to_json x.f_Advertisement_EncodedSecurityDesc );
    ( "AdvSide" , advside_to_json x.f_Advertisement_AdvSide );
    ( "Shares" , float_to_json x.f_Advertisement_Shares );
    ( "Price" , float_opt_to_json x.f_Advertisement_Price );
    ( "Currency" , currency_opt_to_json x.f_Advertisement_Currency );
    ( "TradeDate" , localmktdate_opt_to_json x.f_Advertisement_TradeDate );
    ( "TransactTime" , utctimestamp_opt_to_json x.f_Advertisement_TransactTime );
    ( "Text" , string_opt_to_json x.f_Advertisement_Text );
    ( "EncodedTextLen" , int_opt_to_json x.f_Advertisement_EncodedTextLen );
    ( "EncodedText" , string_opt_to_json x.f_Advertisement_EncodedText );
    ( "URLLink" , string_opt_to_json x.f_Advertisement_URLLink );
    ( "LastMkt" , exchange_opt_to_json x.f_Advertisement_LastMkt );
    ( "TradingSessionID" , string_opt_to_json x.f_Advertisement_TradingSessionID )
    ]
;;

let allocation_to_json x : json =
     assoc_filter_nulls [
    ( "AllocID" , string_to_json x.f_Allocation_AllocID );
    ( "AllocTransType" , alloctranstype_to_json x.f_Allocation_AllocTransType );
    ( "RefAllocID" , string_opt_to_json x.f_Allocation_RefAllocID );
    ( "AllocLinkID" , string_opt_to_json x.f_Allocation_AllocLinkID );
    ( "AllocLinkType" , alloclinktype_opt_to_json x.f_Allocation_AllocLinkType );
    ( "Side" , side_to_json x.f_Allocation_Side );
    ( "Symbol" , string_to_json x.f_Allocation_Symbol );
    ( "SymbolSfx" , string_opt_to_json x.f_Allocation_SymbolSfx );
    ( "SecurityID" , string_opt_to_json x.f_Allocation_SecurityID );
    ( "IDSource" , idsource_opt_to_json x.f_Allocation_IDSource );
    ( "SecurityType" , securitytype_opt_to_json x.f_Allocation_SecurityType );
    ( "MaturityMonthYear" , monthyear_opt_to_json x.f_Allocation_MaturityMonthYear );
    ( "MaturityDay" , int_opt_to_json x.f_Allocation_MaturityDay );
    ( "PutOrCall" , putorcall_opt_to_json x.f_Allocation_PutOrCall );
    ( "StrikePrice" , float_opt_to_json x.f_Allocation_StrikePrice );
    ( "OptAttribute" , char_opt_to_json x.f_Allocation_OptAttribute );
    ( "ContractMultiplier" , float_opt_to_json x.f_Allocation_ContractMultiplier );
    ( "CouponRate" , float_opt_to_json x.f_Allocation_CouponRate );
    ( "SecurityExchange" , exchange_opt_to_json x.f_Allocation_SecurityExchange );
    ( "Issuer" , string_opt_to_json x.f_Allocation_Issuer );
    ( "EncodedIssuerLen" , int_opt_to_json x.f_Allocation_EncodedIssuerLen );
    ( "EncodedIssuer" , string_opt_to_json x.f_Allocation_EncodedIssuer );
    ( "SecurityDesc" , string_opt_to_json x.f_Allocation_SecurityDesc );
    ( "EncodedSecurityDescLen" , int_opt_to_json x.f_Allocation_EncodedSecurityDescLen );
    ( "EncodedSecurityDesc" , string_opt_to_json x.f_Allocation_EncodedSecurityDesc );
    ( "Shares" , float_to_json x.f_Allocation_Shares );
    ( "LastMkt" , exchange_opt_to_json x.f_Allocation_LastMkt );
    ( "TradingSessionID" , string_opt_to_json x.f_Allocation_TradingSessionID );
    ( "AvgPx" , float_to_json x.f_Allocation_AvgPx );
    ( "Currency" , currency_opt_to_json x.f_Allocation_Currency );
    ( "AvgPrxPrecision" , int_opt_to_json x.f_Allocation_AvgPrxPrecision );
    ( "TradeDate" , localmktdate_to_json x.f_Allocation_TradeDate );
    ( "TransactTime" , utctimestamp_opt_to_json x.f_Allocation_TransactTime );
    ( "SettlmntTyp" , settlmnttyp_opt_to_json x.f_Allocation_SettlmntTyp );
    ( "FutSettDate" , localmktdate_opt_to_json x.f_Allocation_FutSettDate );
    ( "GrossTradeAmt" , float_opt_to_json x.f_Allocation_GrossTradeAmt );
    ( "NetMoney" , float_opt_to_json x.f_Allocation_NetMoney );
    ( "OpenClose" , openclose_opt_to_json x.f_Allocation_OpenClose );
    ( "Text" , string_opt_to_json x.f_Allocation_Text );
    ( "EncodedTextLen" , int_opt_to_json x.f_Allocation_EncodedTextLen );
    ( "EncodedText" , string_opt_to_json x.f_Allocation_EncodedText );
    ( "NumDaysInterest" , int_opt_to_json x.f_Allocation_NumDaysInterest );
    ( "AccruedInterestRate" , float_opt_to_json x.f_Allocation_AccruedInterestRate );
    ( "AllocationOrders" , rg allocationorders_to_json x.f_Allocation_AllocationOrders );
    ( "AllocationExecs" , rg allocationexecs_to_json x.f_Allocation_AllocationExecs );
    ( "AllocationAllocs" , rg allocationallocs_to_json x.f_Allocation_AllocationAllocs );
    ( "AllocationMiscFees" , rg allocationmiscfees_to_json x.f_Allocation_AllocationMiscFees )
    ]
;;

let allocationinstructionack_to_json x : json =
     assoc_filter_nulls [
    ( "ClientID" , string_opt_to_json x.f_AllocationInstructionAck_ClientID );
    ( "ExecBroker" , string_opt_to_json x.f_AllocationInstructionAck_ExecBroker );
    ( "AllocID" , string_to_json x.f_AllocationInstructionAck_AllocID );
    ( "TradeDate" , localmktdate_to_json x.f_AllocationInstructionAck_TradeDate );
    ( "TransactTime" , utctimestamp_opt_to_json x.f_AllocationInstructionAck_TransactTime );
    ( "AllocStatus" , allocstatus_to_json x.f_AllocationInstructionAck_AllocStatus );
    ( "AllocRejCode" , allocrejcode_opt_to_json x.f_AllocationInstructionAck_AllocRejCode );
    ( "Text" , string_opt_to_json x.f_AllocationInstructionAck_Text );
    ( "EncodedTextLen" , int_opt_to_json x.f_AllocationInstructionAck_EncodedTextLen );
    ( "EncodedText" , string_opt_to_json x.f_AllocationInstructionAck_EncodedText )
    ]
;;

let bidrequest_to_json x : json =
     assoc_filter_nulls [
    ( "BidID" , string_opt_to_json x.f_BidRequest_BidID );
    ( "ClientBidID" , string_to_json x.f_BidRequest_ClientBidID );
    ( "BidRequestTransType" , bidrequesttranstype_to_json x.f_BidRequest_BidRequestTransType );
    ( "ListName" , string_opt_to_json x.f_BidRequest_ListName );
    ( "TotalNumSecurities" , int_to_json x.f_BidRequest_TotalNumSecurities );
    ( "BidType" , int_to_json x.f_BidRequest_BidType );
    ( "NumTickets" , int_opt_to_json x.f_BidRequest_NumTickets );
    ( "Currency" , currency_opt_to_json x.f_BidRequest_Currency );
    ( "SideValue1" , float_opt_to_json x.f_BidRequest_SideValue1 );
    ( "SideValue2" , float_opt_to_json x.f_BidRequest_SideValue2 );
    ( "LiquidityIndType" , liquidityindtype_opt_to_json x.f_BidRequest_LiquidityIndType );
    ( "WtAverageLiquidity" , float_opt_to_json x.f_BidRequest_WtAverageLiquidity );
    ( "ExchangeForPhysical" , exchangeforphysical_opt_to_json x.f_BidRequest_ExchangeForPhysical );
    ( "OutMainCntryUIndex" , float_opt_to_json x.f_BidRequest_OutMainCntryUIndex );
    ( "CrossPercent" , float_opt_to_json x.f_BidRequest_CrossPercent );
    ( "ProgRptReqs" , progrptreqs_opt_to_json x.f_BidRequest_ProgRptReqs );
    ( "ProgPeriodInterval" , int_opt_to_json x.f_BidRequest_ProgPeriodInterval );
    ( "IncTaxInd" , inctaxind_opt_to_json x.f_BidRequest_IncTaxInd );
    ( "ForexReq" , forexreq_opt_to_json x.f_BidRequest_ForexReq );
    ( "NumBidders" , int_opt_to_json x.f_BidRequest_NumBidders );
    ( "TradeDate" , localmktdate_opt_to_json x.f_BidRequest_TradeDate );
    ( "TradeType" , tradetype_to_json x.f_BidRequest_TradeType );
    ( "BasisPxType" , basispxtype_to_json x.f_BidRequest_BasisPxType );
    ( "StrikeTime" , utctimestamp_opt_to_json x.f_BidRequest_StrikeTime );
    ( "Text" , string_opt_to_json x.f_BidRequest_Text );
    ( "EncodedTextLen" , int_opt_to_json x.f_BidRequest_EncodedTextLen );
    ( "EncodedText" , string_opt_to_json x.f_BidRequest_EncodedText );
    ( "BidRequestBidDescriptors" , rg bidrequestbiddescriptors_to_json x.f_BidRequest_BidRequestBidDescriptors );
    ( "BidRequestBidComponents" , rg bidrequestbidcomponents_to_json x.f_BidRequest_BidRequestBidComponents )
    ]
;;

let bidresponse_to_json x : json =
     assoc_filter_nulls [
    ( "BidID" , string_opt_to_json x.f_BidResponse_BidID );
    ( "ClientBidID" , string_opt_to_json x.f_BidResponse_ClientBidID );
    ( "BidResponseBidComponents" , rg bidresponsebidcomponents_to_json x.f_BidResponse_BidResponseBidComponents )
    ]
;;

let dontknowtrade_to_json x : json =
     assoc_filter_nulls [
    ( "OrderID" , string_to_json x.f_DontKnowTrade_OrderID );
    ( "ExecID" , string_to_json x.f_DontKnowTrade_ExecID );
    ( "DKReason" , dkreason_to_json x.f_DontKnowTrade_DKReason );
    ( "Symbol" , string_to_json x.f_DontKnowTrade_Symbol );
    ( "SymbolSfx" , string_opt_to_json x.f_DontKnowTrade_SymbolSfx );
    ( "SecurityID" , string_opt_to_json x.f_DontKnowTrade_SecurityID );
    ( "IDSource" , idsource_opt_to_json x.f_DontKnowTrade_IDSource );
    ( "SecurityType" , securitytype_opt_to_json x.f_DontKnowTrade_SecurityType );
    ( "MaturityMonthYear" , monthyear_opt_to_json x.f_DontKnowTrade_MaturityMonthYear );
    ( "MaturityDay" , int_opt_to_json x.f_DontKnowTrade_MaturityDay );
    ( "PutOrCall" , putorcall_opt_to_json x.f_DontKnowTrade_PutOrCall );
    ( "StrikePrice" , float_opt_to_json x.f_DontKnowTrade_StrikePrice );
    ( "OptAttribute" , char_opt_to_json x.f_DontKnowTrade_OptAttribute );
    ( "ContractMultiplier" , float_opt_to_json x.f_DontKnowTrade_ContractMultiplier );
    ( "CouponRate" , float_opt_to_json x.f_DontKnowTrade_CouponRate );
    ( "SecurityExchange" , exchange_opt_to_json x.f_DontKnowTrade_SecurityExchange );
    ( "Issuer" , string_opt_to_json x.f_DontKnowTrade_Issuer );
    ( "EncodedIssuerLen" , int_opt_to_json x.f_DontKnowTrade_EncodedIssuerLen );
    ( "EncodedIssuer" , string_opt_to_json x.f_DontKnowTrade_EncodedIssuer );
    ( "SecurityDesc" , string_opt_to_json x.f_DontKnowTrade_SecurityDesc );
    ( "EncodedSecurityDescLen" , int_opt_to_json x.f_DontKnowTrade_EncodedSecurityDescLen );
    ( "EncodedSecurityDesc" , string_opt_to_json x.f_DontKnowTrade_EncodedSecurityDesc );
    ( "Side" , side_to_json x.f_DontKnowTrade_Side );
    ( "OrderQty" , float_opt_to_json x.f_DontKnowTrade_OrderQty );
    ( "CashOrderQty" , float_opt_to_json x.f_DontKnowTrade_CashOrderQty );
    ( "LastShares" , float_opt_to_json x.f_DontKnowTrade_LastShares );
    ( "LastPx" , float_opt_to_json x.f_DontKnowTrade_LastPx );
    ( "Text" , string_opt_to_json x.f_DontKnowTrade_Text );
    ( "EncodedTextLen" , int_opt_to_json x.f_DontKnowTrade_EncodedTextLen );
    ( "EncodedText" , string_opt_to_json x.f_DontKnowTrade_EncodedText )
    ]
;;

let email_to_json x : json =
     assoc_filter_nulls [
    ( "EmailThreadID" , string_to_json x.f_Email_EmailThreadID );
    ( "EmailType" , emailtype_to_json x.f_Email_EmailType );
    ( "OrigTime" , utctimestamp_opt_to_json x.f_Email_OrigTime );
    ( "Subject" , string_to_json x.f_Email_Subject );
    ( "EncodedSubjectLen" , int_opt_to_json x.f_Email_EncodedSubjectLen );
    ( "EncodedSubject" , string_opt_to_json x.f_Email_EncodedSubject );
    ( "OrderID" , string_opt_to_json x.f_Email_OrderID );
    ( "ClOrdID" , string_opt_to_json x.f_Email_ClOrdID );
    ( "RawDataLength" , int_opt_to_json x.f_Email_RawDataLength );
    ( "RawData" , string_opt_to_json x.f_Email_RawData );
    ( "EmailRoutingIDs" , rg emailroutingids_to_json x.f_Email_EmailRoutingIDs );
    ( "EmailRelatedSym" , rg emailrelatedsym_to_json x.f_Email_EmailRelatedSym );
    ( "EmailLinesOfText" , rg emaillinesoftext_to_json x.f_Email_EmailLinesOfText )
    ]
;;

let executionreport_to_json x : json =
     assoc_filter_nulls [
    ( "OrderID" , string_to_json x.f_ExecutionReport_OrderID );
    ( "SecondaryOrderID" , string_opt_to_json x.f_ExecutionReport_SecondaryOrderID );
    ( "ClOrdID" , string_opt_to_json x.f_ExecutionReport_ClOrdID );
    ( "OrigClOrdID" , string_opt_to_json x.f_ExecutionReport_OrigClOrdID );
    ( "ClientID" , string_opt_to_json x.f_ExecutionReport_ClientID );
    ( "ExecBroker" , string_opt_to_json x.f_ExecutionReport_ExecBroker );
    ( "ListID" , string_opt_to_json x.f_ExecutionReport_ListID );
    ( "ExecID" , string_to_json x.f_ExecutionReport_ExecID );
    ( "ExecTransType" , exectranstype_to_json x.f_ExecutionReport_ExecTransType );
    ( "ExecRefID" , string_opt_to_json x.f_ExecutionReport_ExecRefID );
    ( "ExecType" , exectype_to_json x.f_ExecutionReport_ExecType );
    ( "OrdStatus" , ordstatus_to_json x.f_ExecutionReport_OrdStatus );
    ( "OrdRejReason" , ordrejreason_opt_to_json x.f_ExecutionReport_OrdRejReason );
    ( "ExecRestatementReason" , execrestatementreason_opt_to_json x.f_ExecutionReport_ExecRestatementReason );
    ( "Account" , string_opt_to_json x.f_ExecutionReport_Account );
    ( "SettlmntTyp" , settlmnttyp_opt_to_json x.f_ExecutionReport_SettlmntTyp );
    ( "FutSettDate" , localmktdate_opt_to_json x.f_ExecutionReport_FutSettDate );
    ( "Symbol" , string_to_json x.f_ExecutionReport_Symbol );
    ( "SymbolSfx" , string_opt_to_json x.f_ExecutionReport_SymbolSfx );
    ( "SecurityID" , string_opt_to_json x.f_ExecutionReport_SecurityID );
    ( "IDSource" , idsource_opt_to_json x.f_ExecutionReport_IDSource );
    ( "SecurityType" , securitytype_opt_to_json x.f_ExecutionReport_SecurityType );
    ( "MaturityMonthYear" , monthyear_opt_to_json x.f_ExecutionReport_MaturityMonthYear );
    ( "MaturityDay" , int_opt_to_json x.f_ExecutionReport_MaturityDay );
    ( "PutOrCall" , putorcall_opt_to_json x.f_ExecutionReport_PutOrCall );
    ( "StrikePrice" , float_opt_to_json x.f_ExecutionReport_StrikePrice );
    ( "OptAttribute" , char_opt_to_json x.f_ExecutionReport_OptAttribute );
    ( "ContractMultiplier" , float_opt_to_json x.f_ExecutionReport_ContractMultiplier );
    ( "CouponRate" , float_opt_to_json x.f_ExecutionReport_CouponRate );
    ( "SecurityExchange" , exchange_opt_to_json x.f_ExecutionReport_SecurityExchange );
    ( "Issuer" , string_opt_to_json x.f_ExecutionReport_Issuer );
    ( "EncodedIssuerLen" , int_opt_to_json x.f_ExecutionReport_EncodedIssuerLen );
    ( "EncodedIssuer" , string_opt_to_json x.f_ExecutionReport_EncodedIssuer );
    ( "SecurityDesc" , string_opt_to_json x.f_ExecutionReport_SecurityDesc );
    ( "EncodedSecurityDescLen" , int_opt_to_json x.f_ExecutionReport_EncodedSecurityDescLen );
    ( "EncodedSecurityDesc" , string_opt_to_json x.f_ExecutionReport_EncodedSecurityDesc );
    ( "Side" , side_to_json x.f_ExecutionReport_Side );
    ( "OrderQty" , float_opt_to_json x.f_ExecutionReport_OrderQty );
    ( "CashOrderQty" , float_opt_to_json x.f_ExecutionReport_CashOrderQty );
    ( "OrdType" , ordtype_opt_to_json x.f_ExecutionReport_OrdType );
    ( "Price" , float_opt_to_json x.f_ExecutionReport_Price );
    ( "StopPx" , float_opt_to_json x.f_ExecutionReport_StopPx );
    ( "PegDifference" , float_opt_to_json x.f_ExecutionReport_PegDifference );
    ( "DiscretionInst" , discretioninst_opt_to_json x.f_ExecutionReport_DiscretionInst );
    ( "DiscretionOffset" , float_opt_to_json x.f_ExecutionReport_DiscretionOffset );
    ( "Currency" , currency_opt_to_json x.f_ExecutionReport_Currency );
    ( "ComplianceID" , string_opt_to_json x.f_ExecutionReport_ComplianceID );
    ( "SolicitedFlag" , solicitedflag_opt_to_json x.f_ExecutionReport_SolicitedFlag );
    ( "TimeInForce" , timeinforce_opt_to_json x.f_ExecutionReport_TimeInForce );
    ( "EffectiveTime" , utctimestamp_opt_to_json x.f_ExecutionReport_EffectiveTime );
    ( "ExpireDate" , localmktdate_opt_to_json x.f_ExecutionReport_ExpireDate );
    ( "ExpireTime" , utctimestamp_opt_to_json x.f_ExecutionReport_ExpireTime );
    ( "ExecInst" , execinst_opt_to_json x.f_ExecutionReport_ExecInst );
    ( "Rule80A" , rule80a_opt_to_json x.f_ExecutionReport_Rule80A );
    ( "LastShares" , float_opt_to_json x.f_ExecutionReport_LastShares );
    ( "LastPx" , float_opt_to_json x.f_ExecutionReport_LastPx );
    ( "LastSpotRate" , float_opt_to_json x.f_ExecutionReport_LastSpotRate );
    ( "LastForwardPoints" , float_opt_to_json x.f_ExecutionReport_LastForwardPoints );
    ( "LastMkt" , exchange_opt_to_json x.f_ExecutionReport_LastMkt );
    ( "TradingSessionID" , string_opt_to_json x.f_ExecutionReport_TradingSessionID );
    ( "LastCapacity" , lastcapacity_opt_to_json x.f_ExecutionReport_LastCapacity );
    ( "LeavesQty" , float_to_json x.f_ExecutionReport_LeavesQty );
    ( "CumQty" , float_to_json x.f_ExecutionReport_CumQty );
    ( "AvgPx" , float_to_json x.f_ExecutionReport_AvgPx );
    ( "DayOrderQty" , float_opt_to_json x.f_ExecutionReport_DayOrderQty );
    ( "DayCumQty" , float_opt_to_json x.f_ExecutionReport_DayCumQty );
    ( "DayAvgPx" , float_opt_to_json x.f_ExecutionReport_DayAvgPx );
    ( "GTBookingInst" , gtbookinginst_opt_to_json x.f_ExecutionReport_GTBookingInst );
    ( "TradeDate" , localmktdate_opt_to_json x.f_ExecutionReport_TradeDate );
    ( "TransactTime" , utctimestamp_opt_to_json x.f_ExecutionReport_TransactTime );
    ( "ReportToExch" , reporttoexch_opt_to_json x.f_ExecutionReport_ReportToExch );
    ( "Commission" , float_opt_to_json x.f_ExecutionReport_Commission );
    ( "CommType" , commtype_opt_to_json x.f_ExecutionReport_CommType );
    ( "GrossTradeAmt" , float_opt_to_json x.f_ExecutionReport_GrossTradeAmt );
    ( "SettlCurrAmt" , float_opt_to_json x.f_ExecutionReport_SettlCurrAmt );
    ( "SettlCurrency" , currency_opt_to_json x.f_ExecutionReport_SettlCurrency );
    ( "SettlCurrFxRate" , float_opt_to_json x.f_ExecutionReport_SettlCurrFxRate );
    ( "SettlCurrFxRateCalc" , char_opt_to_json x.f_ExecutionReport_SettlCurrFxRateCalc );
    ( "HandlInst" , handlinst_opt_to_json x.f_ExecutionReport_HandlInst );
    ( "MinQty" , float_opt_to_json x.f_ExecutionReport_MinQty );
    ( "MaxFloor" , float_opt_to_json x.f_ExecutionReport_MaxFloor );
    ( "OpenClose" , openclose_opt_to_json x.f_ExecutionReport_OpenClose );
    ( "MaxShow" , float_opt_to_json x.f_ExecutionReport_MaxShow );
    ( "Text" , string_opt_to_json x.f_ExecutionReport_Text );
    ( "EncodedTextLen" , int_opt_to_json x.f_ExecutionReport_EncodedTextLen );
    ( "EncodedText" , string_opt_to_json x.f_ExecutionReport_EncodedText );
    ( "FutSettDate2" , localmktdate_opt_to_json x.f_ExecutionReport_FutSettDate2 );
    ( "OrderQty2" , float_opt_to_json x.f_ExecutionReport_OrderQty2 );
    ( "ClearingFirm" , string_opt_to_json x.f_ExecutionReport_ClearingFirm );
    ( "ClearingAccount" , string_opt_to_json x.f_ExecutionReport_ClearingAccount );
    ( "MultiLegReportingType" , multilegreportingtype_opt_to_json x.f_ExecutionReport_MultiLegReportingType );
    ( "ExecutionReportContraBrokers" , rg executionreportcontrabrokers_to_json x.f_ExecutionReport_ExecutionReportContraBrokers )
    ]
;;

let ioi_to_json x : json =
     assoc_filter_nulls [
    ( "IOIid" , string_to_json x.f_IOI_IOIid );
    ( "IOITransType" , ioitranstype_to_json x.f_IOI_IOITransType );
    ( "IOIRefID" , string_opt_to_json x.f_IOI_IOIRefID );
    ( "Symbol" , string_to_json x.f_IOI_Symbol );
    ( "SymbolSfx" , string_opt_to_json x.f_IOI_SymbolSfx );
    ( "SecurityID" , string_opt_to_json x.f_IOI_SecurityID );
    ( "IDSource" , idsource_opt_to_json x.f_IOI_IDSource );
    ( "SecurityType" , securitytype_opt_to_json x.f_IOI_SecurityType );
    ( "MaturityMonthYear" , monthyear_opt_to_json x.f_IOI_MaturityMonthYear );
    ( "MaturityDay" , int_opt_to_json x.f_IOI_MaturityDay );
    ( "PutOrCall" , putorcall_opt_to_json x.f_IOI_PutOrCall );
    ( "StrikePrice" , float_opt_to_json x.f_IOI_StrikePrice );
    ( "OptAttribute" , char_opt_to_json x.f_IOI_OptAttribute );
    ( "ContractMultiplier" , float_opt_to_json x.f_IOI_ContractMultiplier );
    ( "CouponRate" , float_opt_to_json x.f_IOI_CouponRate );
    ( "SecurityExchange" , exchange_opt_to_json x.f_IOI_SecurityExchange );
    ( "Issuer" , string_opt_to_json x.f_IOI_Issuer );
    ( "EncodedIssuerLen" , int_opt_to_json x.f_IOI_EncodedIssuerLen );
    ( "EncodedIssuer" , string_opt_to_json x.f_IOI_EncodedIssuer );
    ( "SecurityDesc" , string_opt_to_json x.f_IOI_SecurityDesc );
    ( "EncodedSecurityDescLen" , int_opt_to_json x.f_IOI_EncodedSecurityDescLen );
    ( "EncodedSecurityDesc" , string_opt_to_json x.f_IOI_EncodedSecurityDesc );
    ( "Side" , side_to_json x.f_IOI_Side );
    ( "IOIShares" , ioishares_to_json x.f_IOI_IOIShares );
    ( "Price" , float_opt_to_json x.f_IOI_Price );
    ( "Currency" , currency_opt_to_json x.f_IOI_Currency );
    ( "ValidUntilTime" , utctimestamp_opt_to_json x.f_IOI_ValidUntilTime );
    ( "IOIQltyInd" , ioiqltyind_opt_to_json x.f_IOI_IOIQltyInd );
    ( "IOINaturalFlag" , ioinaturalflag_opt_to_json x.f_IOI_IOINaturalFlag );
    ( "Text" , string_opt_to_json x.f_IOI_Text );
    ( "EncodedTextLen" , int_opt_to_json x.f_IOI_EncodedTextLen );
    ( "EncodedText" , string_opt_to_json x.f_IOI_EncodedText );
    ( "TransactTime" , utctimestamp_opt_to_json x.f_IOI_TransactTime );
    ( "URLLink" , string_opt_to_json x.f_IOI_URLLink );
    ( "SpreadToBenchmark" , float_opt_to_json x.f_IOI_SpreadToBenchmark );
    ( "Benchmark" , benchmark_opt_to_json x.f_IOI_Benchmark );
    ( "IOIIOIQualifiers" , rg ioiioiqualifiers_to_json x.f_IOI_IOIIOIQualifiers );
    ( "IOIRoutingIDs" , rg ioiroutingids_to_json x.f_IOI_IOIRoutingIDs )
    ]
;;

let listcancelrequest_to_json x : json =
     assoc_filter_nulls [
    ( "ListID" , string_to_json x.f_ListCancelRequest_ListID );
    ( "TransactTime" , utctimestamp_to_json x.f_ListCancelRequest_TransactTime );
    ( "Text" , string_opt_to_json x.f_ListCancelRequest_Text );
    ( "EncodedTextLen" , int_opt_to_json x.f_ListCancelRequest_EncodedTextLen );
    ( "EncodedText" , string_opt_to_json x.f_ListCancelRequest_EncodedText )
    ]
;;

let listexecute_to_json x : json =
     assoc_filter_nulls [
    ( "ListID" , string_to_json x.f_ListExecute_ListID );
    ( "ClientBidID" , string_opt_to_json x.f_ListExecute_ClientBidID );
    ( "BidID" , string_opt_to_json x.f_ListExecute_BidID );
    ( "TransactTime" , utctimestamp_to_json x.f_ListExecute_TransactTime );
    ( "Text" , string_opt_to_json x.f_ListExecute_Text );
    ( "EncodedTextLen" , int_opt_to_json x.f_ListExecute_EncodedTextLen );
    ( "EncodedText" , string_opt_to_json x.f_ListExecute_EncodedText )
    ]
;;

let liststatus_to_json x : json =
     assoc_filter_nulls [
    ( "ListID" , string_to_json x.f_ListStatus_ListID );
    ( "ListStatusType" , int_to_json x.f_ListStatus_ListStatusType );
    ( "NoRpts" , int_to_json x.f_ListStatus_NoRpts );
    ( "ListOrderStatus" , int_to_json x.f_ListStatus_ListOrderStatus );
    ( "RptSeq" , int_to_json x.f_ListStatus_RptSeq );
    ( "ListStatusText" , string_opt_to_json x.f_ListStatus_ListStatusText );
    ( "EncodedListStatusTextLen" , int_opt_to_json x.f_ListStatus_EncodedListStatusTextLen );
    ( "EncodedListStatusText" , string_opt_to_json x.f_ListStatus_EncodedListStatusText );
    ( "TransactTime" , utctimestamp_opt_to_json x.f_ListStatus_TransactTime );
    ( "TotNoOrders" , int_to_json x.f_ListStatus_TotNoOrders );
    ( "ListStatusOrders" , rg liststatusorders_to_json x.f_ListStatus_ListStatusOrders )
    ]
;;

let liststatusrequest_to_json x : json =
     assoc_filter_nulls [
    ( "ListID" , string_to_json x.f_ListStatusRequest_ListID );
    ( "Text" , string_opt_to_json x.f_ListStatusRequest_Text );
    ( "EncodedTextLen" , int_opt_to_json x.f_ListStatusRequest_EncodedTextLen );
    ( "EncodedText" , string_opt_to_json x.f_ListStatusRequest_EncodedText )
    ]
;;

let liststrikeprice_to_json x : json =
     assoc_filter_nulls [
    ( "ListID" , string_to_json x.f_ListStrikePrice_ListID );
    ( "TotNoStrikes" , int_to_json x.f_ListStrikePrice_TotNoStrikes );
    ( "ListStrikePriceStrikes" , rg liststrikepricestrikes_to_json x.f_ListStrikePrice_ListStrikePriceStrikes )
    ]
;;

let marketdataincrementalrefresh_to_json x : json =
     assoc_filter_nulls [
    ( "MDReqID" , string_opt_to_json x.f_MarketDataIncrementalRefresh_MDReqID );
    ( "MarketDataIncrementalRefreshMDEntries" , rg marketdataincrementalrefreshmdentries_to_json x.f_MarketDataIncrementalRefresh_MarketDataIncrementalRefreshMDEntries )
    ]
;;

let marketdatarequest_to_json x : json =
     assoc_filter_nulls [
    ( "MDReqID" , string_to_json x.f_MarketDataRequest_MDReqID );
    ( "SubscriptionRequestType" , subscriptionrequesttype_to_json x.f_MarketDataRequest_SubscriptionRequestType );
    ( "MarketDepth" , int_to_json x.f_MarketDataRequest_MarketDepth );
    ( "MDUpdateType" , mdupdatetype_opt_to_json x.f_MarketDataRequest_MDUpdateType );
    ( "AggregatedBook" , aggregatedbook_opt_to_json x.f_MarketDataRequest_AggregatedBook );
    ( "MarketDataRequestMDEntryTypes" , rg marketdatarequestmdentrytypes_to_json x.f_MarketDataRequest_MarketDataRequestMDEntryTypes );
    ( "MarketDataRequestRelatedSym" , rg marketdatarequestrelatedsym_to_json x.f_MarketDataRequest_MarketDataRequestRelatedSym )
    ]
;;

let marketdatarequestreject_to_json x : json =
     assoc_filter_nulls [
    ( "MDReqID" , string_to_json x.f_MarketDataRequestReject_MDReqID );
    ( "MDReqRejReason" , mdreqrejreason_opt_to_json x.f_MarketDataRequestReject_MDReqRejReason );
    ( "Text" , string_opt_to_json x.f_MarketDataRequestReject_Text );
    ( "EncodedTextLen" , int_opt_to_json x.f_MarketDataRequestReject_EncodedTextLen );
    ( "EncodedText" , string_opt_to_json x.f_MarketDataRequestReject_EncodedText )
    ]
;;

let marketdatasnapshotfullrefresh_to_json x : json =
     assoc_filter_nulls [
    ( "MDReqID" , string_opt_to_json x.f_MarketDataSnapshotFullRefresh_MDReqID );
    ( "Symbol" , string_to_json x.f_MarketDataSnapshotFullRefresh_Symbol );
    ( "SymbolSfx" , string_opt_to_json x.f_MarketDataSnapshotFullRefresh_SymbolSfx );
    ( "SecurityID" , string_opt_to_json x.f_MarketDataSnapshotFullRefresh_SecurityID );
    ( "IDSource" , idsource_opt_to_json x.f_MarketDataSnapshotFullRefresh_IDSource );
    ( "SecurityType" , securitytype_opt_to_json x.f_MarketDataSnapshotFullRefresh_SecurityType );
    ( "MaturityMonthYear" , monthyear_opt_to_json x.f_MarketDataSnapshotFullRefresh_MaturityMonthYear );
    ( "MaturityDay" , int_opt_to_json x.f_MarketDataSnapshotFullRefresh_MaturityDay );
    ( "PutOrCall" , putorcall_opt_to_json x.f_MarketDataSnapshotFullRefresh_PutOrCall );
    ( "StrikePrice" , float_opt_to_json x.f_MarketDataSnapshotFullRefresh_StrikePrice );
    ( "OptAttribute" , char_opt_to_json x.f_MarketDataSnapshotFullRefresh_OptAttribute );
    ( "ContractMultiplier" , float_opt_to_json x.f_MarketDataSnapshotFullRefresh_ContractMultiplier );
    ( "CouponRate" , float_opt_to_json x.f_MarketDataSnapshotFullRefresh_CouponRate );
    ( "SecurityExchange" , exchange_opt_to_json x.f_MarketDataSnapshotFullRefresh_SecurityExchange );
    ( "Issuer" , string_opt_to_json x.f_MarketDataSnapshotFullRefresh_Issuer );
    ( "EncodedIssuerLen" , int_opt_to_json x.f_MarketDataSnapshotFullRefresh_EncodedIssuerLen );
    ( "EncodedIssuer" , string_opt_to_json x.f_MarketDataSnapshotFullRefresh_EncodedIssuer );
    ( "SecurityDesc" , string_opt_to_json x.f_MarketDataSnapshotFullRefresh_SecurityDesc );
    ( "EncodedSecurityDescLen" , int_opt_to_json x.f_MarketDataSnapshotFullRefresh_EncodedSecurityDescLen );
    ( "EncodedSecurityDesc" , string_opt_to_json x.f_MarketDataSnapshotFullRefresh_EncodedSecurityDesc );
    ( "FinancialStatus" , financialstatus_opt_to_json x.f_MarketDataSnapshotFullRefresh_FinancialStatus );
    ( "CorporateAction" , corporateaction_opt_to_json x.f_MarketDataSnapshotFullRefresh_CorporateAction );
    ( "TotalVolumeTraded" , float_opt_to_json x.f_MarketDataSnapshotFullRefresh_TotalVolumeTraded );
    ( "MarketDataSnapshotFullRefreshMDEntries" , rg marketdatasnapshotfullrefreshmdentries_to_json x.f_MarketDataSnapshotFullRefresh_MarketDataSnapshotFullRefreshMDEntries )
    ]
;;

let massquote_to_json x : json =
     assoc_filter_nulls [
    ( "QuoteReqID" , string_opt_to_json x.f_MassQuote_QuoteReqID );
    ( "QuoteID" , string_to_json x.f_MassQuote_QuoteID );
    ( "QuoteResponseLevel" , quoteresponselevel_opt_to_json x.f_MassQuote_QuoteResponseLevel );
    ( "DefBidSize" , float_opt_to_json x.f_MassQuote_DefBidSize );
    ( "DefOfferSize" , float_opt_to_json x.f_MassQuote_DefOfferSize );
    ( "MassQuoteQuoteSets" , rg massquotequotesets_to_json x.f_MassQuote_MassQuoteQuoteSets );
    ( "MassQuoteQuoteEntries" , rg massquotequoteentries_to_json x.f_MassQuote_MassQuoteQuoteEntries )
    ]
;;

let news_to_json x : json =
     assoc_filter_nulls [
    ( "OrigTime" , utctimestamp_opt_to_json x.f_News_OrigTime );
    ( "Urgency" , urgency_opt_to_json x.f_News_Urgency );
    ( "Headline" , string_to_json x.f_News_Headline );
    ( "EncodedHeadlineLen" , int_opt_to_json x.f_News_EncodedHeadlineLen );
    ( "EncodedHeadline" , string_opt_to_json x.f_News_EncodedHeadline );
    ( "URLLink" , string_opt_to_json x.f_News_URLLink );
    ( "RawDataLength" , int_opt_to_json x.f_News_RawDataLength );
    ( "RawData" , string_opt_to_json x.f_News_RawData );
    ( "NewsRoutingIDs" , rg newsroutingids_to_json x.f_News_NewsRoutingIDs );
    ( "NewsRelatedSym" , rg newsrelatedsym_to_json x.f_News_NewsRelatedSym );
    ( "NewsLinesOfText" , rg newslinesoftext_to_json x.f_News_NewsLinesOfText )
    ]
;;

let ordercancelreject_to_json x : json =
     assoc_filter_nulls [
    ( "OrderID" , string_to_json x.f_OrderCancelReject_OrderID );
    ( "SecondaryOrderID" , string_opt_to_json x.f_OrderCancelReject_SecondaryOrderID );
    ( "ClOrdID" , string_to_json x.f_OrderCancelReject_ClOrdID );
    ( "OrigClOrdID" , string_to_json x.f_OrderCancelReject_OrigClOrdID );
    ( "OrdStatus" , ordstatus_to_json x.f_OrderCancelReject_OrdStatus );
    ( "ClientID" , string_opt_to_json x.f_OrderCancelReject_ClientID );
    ( "ExecBroker" , string_opt_to_json x.f_OrderCancelReject_ExecBroker );
    ( "ListID" , string_opt_to_json x.f_OrderCancelReject_ListID );
    ( "Account" , string_opt_to_json x.f_OrderCancelReject_Account );
    ( "TransactTime" , utctimestamp_opt_to_json x.f_OrderCancelReject_TransactTime );
    ( "CxlRejResponseTo" , cxlrejresponseto_to_json x.f_OrderCancelReject_CxlRejResponseTo );
    ( "CxlRejReason" , cxlrejreason_opt_to_json x.f_OrderCancelReject_CxlRejReason );
    ( "Text" , string_opt_to_json x.f_OrderCancelReject_Text );
    ( "EncodedTextLen" , int_opt_to_json x.f_OrderCancelReject_EncodedTextLen );
    ( "EncodedText" , string_opt_to_json x.f_OrderCancelReject_EncodedText )
    ]
;;

let ordercancelreplacerequest_to_json x : json =
     assoc_filter_nulls [
    ( "OrderID" , string_opt_to_json x.f_OrderCancelReplaceRequest_OrderID );
    ( "ClientID" , string_opt_to_json x.f_OrderCancelReplaceRequest_ClientID );
    ( "ExecBroker" , string_opt_to_json x.f_OrderCancelReplaceRequest_ExecBroker );
    ( "OrigClOrdID" , string_to_json x.f_OrderCancelReplaceRequest_OrigClOrdID );
    ( "ClOrdID" , string_to_json x.f_OrderCancelReplaceRequest_ClOrdID );
    ( "ListID" , string_opt_to_json x.f_OrderCancelReplaceRequest_ListID );
    ( "Account" , string_opt_to_json x.f_OrderCancelReplaceRequest_Account );
    ( "SettlmntTyp" , settlmnttyp_opt_to_json x.f_OrderCancelReplaceRequest_SettlmntTyp );
    ( "FutSettDate" , localmktdate_opt_to_json x.f_OrderCancelReplaceRequest_FutSettDate );
    ( "HandlInst" , handlinst_to_json x.f_OrderCancelReplaceRequest_HandlInst );
    ( "ExecInst" , execinst_opt_to_json x.f_OrderCancelReplaceRequest_ExecInst );
    ( "MinQty" , float_opt_to_json x.f_OrderCancelReplaceRequest_MinQty );
    ( "MaxFloor" , float_opt_to_json x.f_OrderCancelReplaceRequest_MaxFloor );
    ( "ExDestination" , exchange_opt_to_json x.f_OrderCancelReplaceRequest_ExDestination );
    ( "Symbol" , string_to_json x.f_OrderCancelReplaceRequest_Symbol );
    ( "SymbolSfx" , string_opt_to_json x.f_OrderCancelReplaceRequest_SymbolSfx );
    ( "SecurityID" , string_opt_to_json x.f_OrderCancelReplaceRequest_SecurityID );
    ( "IDSource" , idsource_opt_to_json x.f_OrderCancelReplaceRequest_IDSource );
    ( "SecurityType" , securitytype_opt_to_json x.f_OrderCancelReplaceRequest_SecurityType );
    ( "MaturityMonthYear" , monthyear_opt_to_json x.f_OrderCancelReplaceRequest_MaturityMonthYear );
    ( "MaturityDay" , int_opt_to_json x.f_OrderCancelReplaceRequest_MaturityDay );
    ( "PutOrCall" , putorcall_opt_to_json x.f_OrderCancelReplaceRequest_PutOrCall );
    ( "StrikePrice" , float_opt_to_json x.f_OrderCancelReplaceRequest_StrikePrice );
    ( "OptAttribute" , char_opt_to_json x.f_OrderCancelReplaceRequest_OptAttribute );
    ( "ContractMultiplier" , float_opt_to_json x.f_OrderCancelReplaceRequest_ContractMultiplier );
    ( "CouponRate" , float_opt_to_json x.f_OrderCancelReplaceRequest_CouponRate );
    ( "SecurityExchange" , exchange_opt_to_json x.f_OrderCancelReplaceRequest_SecurityExchange );
    ( "Issuer" , string_opt_to_json x.f_OrderCancelReplaceRequest_Issuer );
    ( "EncodedIssuerLen" , int_opt_to_json x.f_OrderCancelReplaceRequest_EncodedIssuerLen );
    ( "EncodedIssuer" , string_opt_to_json x.f_OrderCancelReplaceRequest_EncodedIssuer );
    ( "SecurityDesc" , string_opt_to_json x.f_OrderCancelReplaceRequest_SecurityDesc );
    ( "EncodedSecurityDescLen" , int_opt_to_json x.f_OrderCancelReplaceRequest_EncodedSecurityDescLen );
    ( "EncodedSecurityDesc" , string_opt_to_json x.f_OrderCancelReplaceRequest_EncodedSecurityDesc );
    ( "Side" , side_to_json x.f_OrderCancelReplaceRequest_Side );
    ( "TransactTime" , utctimestamp_to_json x.f_OrderCancelReplaceRequest_TransactTime );
    ( "OrderQty" , float_opt_to_json x.f_OrderCancelReplaceRequest_OrderQty );
    ( "CashOrderQty" , float_opt_to_json x.f_OrderCancelReplaceRequest_CashOrderQty );
    ( "OrdType" , ordtype_to_json x.f_OrderCancelReplaceRequest_OrdType );
    ( "Price" , float_opt_to_json x.f_OrderCancelReplaceRequest_Price );
    ( "StopPx" , float_opt_to_json x.f_OrderCancelReplaceRequest_StopPx );
    ( "PegDifference" , float_opt_to_json x.f_OrderCancelReplaceRequest_PegDifference );
    ( "DiscretionInst" , discretioninst_opt_to_json x.f_OrderCancelReplaceRequest_DiscretionInst );
    ( "DiscretionOffset" , float_opt_to_json x.f_OrderCancelReplaceRequest_DiscretionOffset );
    ( "ComplianceID" , string_opt_to_json x.f_OrderCancelReplaceRequest_ComplianceID );
    ( "SolicitedFlag" , solicitedflag_opt_to_json x.f_OrderCancelReplaceRequest_SolicitedFlag );
    ( "Currency" , currency_opt_to_json x.f_OrderCancelReplaceRequest_Currency );
    ( "TimeInForce" , timeinforce_opt_to_json x.f_OrderCancelReplaceRequest_TimeInForce );
    ( "EffectiveTime" , utctimestamp_opt_to_json x.f_OrderCancelReplaceRequest_EffectiveTime );
    ( "ExpireDate" , localmktdate_opt_to_json x.f_OrderCancelReplaceRequest_ExpireDate );
    ( "ExpireTime" , utctimestamp_opt_to_json x.f_OrderCancelReplaceRequest_ExpireTime );
    ( "GTBookingInst" , gtbookinginst_opt_to_json x.f_OrderCancelReplaceRequest_GTBookingInst );
    ( "Commission" , float_opt_to_json x.f_OrderCancelReplaceRequest_Commission );
    ( "CommType" , commtype_opt_to_json x.f_OrderCancelReplaceRequest_CommType );
    ( "Rule80A" , rule80a_opt_to_json x.f_OrderCancelReplaceRequest_Rule80A );
    ( "ForexReq" , forexreq_opt_to_json x.f_OrderCancelReplaceRequest_ForexReq );
    ( "SettlCurrency" , currency_opt_to_json x.f_OrderCancelReplaceRequest_SettlCurrency );
    ( "Text" , string_opt_to_json x.f_OrderCancelReplaceRequest_Text );
    ( "EncodedTextLen" , int_opt_to_json x.f_OrderCancelReplaceRequest_EncodedTextLen );
    ( "EncodedText" , string_opt_to_json x.f_OrderCancelReplaceRequest_EncodedText );
    ( "FutSettDate2" , localmktdate_opt_to_json x.f_OrderCancelReplaceRequest_FutSettDate2 );
    ( "OrderQty2" , float_opt_to_json x.f_OrderCancelReplaceRequest_OrderQty2 );
    ( "OpenClose" , openclose_opt_to_json x.f_OrderCancelReplaceRequest_OpenClose );
    ( "CoveredOrUncovered" , coveredoruncovered_opt_to_json x.f_OrderCancelReplaceRequest_CoveredOrUncovered );
    ( "CustomerOrFirm" , customerorfirm_opt_to_json x.f_OrderCancelReplaceRequest_CustomerOrFirm );
    ( "MaxShow" , float_opt_to_json x.f_OrderCancelReplaceRequest_MaxShow );
    ( "LocateReqd" , locatereqd_opt_to_json x.f_OrderCancelReplaceRequest_LocateReqd );
    ( "ClearingFirm" , string_opt_to_json x.f_OrderCancelReplaceRequest_ClearingFirm );
    ( "ClearingAccount" , string_opt_to_json x.f_OrderCancelReplaceRequest_ClearingAccount );
    ( "OrderCancelReplaceRequestAllocs" , rg ordercancelreplacerequestallocs_to_json x.f_OrderCancelReplaceRequest_OrderCancelReplaceRequestAllocs );
    ( "OrderCancelReplaceRequestTradingSessions" , rg ordercancelreplacerequesttradingsessions_to_json x.f_OrderCancelReplaceRequest_OrderCancelReplaceRequestTradingSessions )
    ]
;;

let ordercancelrequest_to_json x : json =
     assoc_filter_nulls [
    ( "OrigClOrdID" , string_to_json x.f_OrderCancelRequest_OrigClOrdID );
    ( "OrderID" , string_opt_to_json x.f_OrderCancelRequest_OrderID );
    ( "ClOrdID" , string_to_json x.f_OrderCancelRequest_ClOrdID );
    ( "ListID" , string_opt_to_json x.f_OrderCancelRequest_ListID );
    ( "Account" , string_opt_to_json x.f_OrderCancelRequest_Account );
    ( "ClientID" , string_opt_to_json x.f_OrderCancelRequest_ClientID );
    ( "ExecBroker" , string_opt_to_json x.f_OrderCancelRequest_ExecBroker );
    ( "Symbol" , string_to_json x.f_OrderCancelRequest_Symbol );
    ( "SymbolSfx" , string_opt_to_json x.f_OrderCancelRequest_SymbolSfx );
    ( "SecurityID" , string_opt_to_json x.f_OrderCancelRequest_SecurityID );
    ( "IDSource" , idsource_opt_to_json x.f_OrderCancelRequest_IDSource );
    ( "SecurityType" , securitytype_opt_to_json x.f_OrderCancelRequest_SecurityType );
    ( "MaturityMonthYear" , monthyear_opt_to_json x.f_OrderCancelRequest_MaturityMonthYear );
    ( "MaturityDay" , int_opt_to_json x.f_OrderCancelRequest_MaturityDay );
    ( "PutOrCall" , putorcall_opt_to_json x.f_OrderCancelRequest_PutOrCall );
    ( "StrikePrice" , float_opt_to_json x.f_OrderCancelRequest_StrikePrice );
    ( "OptAttribute" , char_opt_to_json x.f_OrderCancelRequest_OptAttribute );
    ( "ContractMultiplier" , float_opt_to_json x.f_OrderCancelRequest_ContractMultiplier );
    ( "CouponRate" , float_opt_to_json x.f_OrderCancelRequest_CouponRate );
    ( "SecurityExchange" , exchange_opt_to_json x.f_OrderCancelRequest_SecurityExchange );
    ( "Issuer" , string_opt_to_json x.f_OrderCancelRequest_Issuer );
    ( "EncodedIssuerLen" , int_opt_to_json x.f_OrderCancelRequest_EncodedIssuerLen );
    ( "EncodedIssuer" , string_opt_to_json x.f_OrderCancelRequest_EncodedIssuer );
    ( "SecurityDesc" , string_opt_to_json x.f_OrderCancelRequest_SecurityDesc );
    ( "EncodedSecurityDescLen" , int_opt_to_json x.f_OrderCancelRequest_EncodedSecurityDescLen );
    ( "EncodedSecurityDesc" , string_opt_to_json x.f_OrderCancelRequest_EncodedSecurityDesc );
    ( "Side" , side_to_json x.f_OrderCancelRequest_Side );
    ( "TransactTime" , utctimestamp_to_json x.f_OrderCancelRequest_TransactTime );
    ( "OrderQty" , float_opt_to_json x.f_OrderCancelRequest_OrderQty );
    ( "CashOrderQty" , float_opt_to_json x.f_OrderCancelRequest_CashOrderQty );
    ( "ComplianceID" , string_opt_to_json x.f_OrderCancelRequest_ComplianceID );
    ( "SolicitedFlag" , solicitedflag_opt_to_json x.f_OrderCancelRequest_SolicitedFlag );
    ( "Text" , string_opt_to_json x.f_OrderCancelRequest_Text );
    ( "EncodedTextLen" , int_opt_to_json x.f_OrderCancelRequest_EncodedTextLen );
    ( "EncodedText" , string_opt_to_json x.f_OrderCancelRequest_EncodedText )
    ]
;;

let orderlist_to_json x : json =
     assoc_filter_nulls [
    ( "ListID" , string_to_json x.f_OrderList_ListID );
    ( "BidID" , string_opt_to_json x.f_OrderList_BidID );
    ( "ClientBidID" , string_opt_to_json x.f_OrderList_ClientBidID );
    ( "ProgRptReqs" , progrptreqs_opt_to_json x.f_OrderList_ProgRptReqs );
    ( "BidType" , int_to_json x.f_OrderList_BidType );
    ( "ProgPeriodInterval" , int_opt_to_json x.f_OrderList_ProgPeriodInterval );
    ( "ListExecInstType" , listexecinsttype_opt_to_json x.f_OrderList_ListExecInstType );
    ( "ListExecInst" , string_opt_to_json x.f_OrderList_ListExecInst );
    ( "EncodedListExecInstLen" , int_opt_to_json x.f_OrderList_EncodedListExecInstLen );
    ( "EncodedListExecInst" , string_opt_to_json x.f_OrderList_EncodedListExecInst );
    ( "TotNoOrders" , int_to_json x.f_OrderList_TotNoOrders );
    ( "OrderListOrders" , rg orderlistorders_to_json x.f_OrderList_OrderListOrders );
    ( "OrderListAllocs" , rg orderlistallocs_to_json x.f_OrderList_OrderListAllocs );
    ( "OrderListTradingSessions" , rg orderlisttradingsessions_to_json x.f_OrderList_OrderListTradingSessions )
    ]
;;

let ordersingle_to_json x : json =
     assoc_filter_nulls [
    ( "ClOrdID" , string_to_json x.f_OrderSingle_ClOrdID );
    ( "ClientID" , string_opt_to_json x.f_OrderSingle_ClientID );
    ( "ExecBroker" , string_opt_to_json x.f_OrderSingle_ExecBroker );
    ( "Account" , string_opt_to_json x.f_OrderSingle_Account );
    ( "SettlmntTyp" , settlmnttyp_opt_to_json x.f_OrderSingle_SettlmntTyp );
    ( "FutSettDate" , localmktdate_opt_to_json x.f_OrderSingle_FutSettDate );
    ( "HandlInst" , handlinst_to_json x.f_OrderSingle_HandlInst );
    ( "ExecInst" , execinst_opt_to_json x.f_OrderSingle_ExecInst );
    ( "MinQty" , float_opt_to_json x.f_OrderSingle_MinQty );
    ( "MaxFloor" , float_opt_to_json x.f_OrderSingle_MaxFloor );
    ( "ExDestination" , exchange_opt_to_json x.f_OrderSingle_ExDestination );
    ( "ProcessCode" , processcode_opt_to_json x.f_OrderSingle_ProcessCode );
    ( "Symbol" , string_to_json x.f_OrderSingle_Symbol );
    ( "SymbolSfx" , string_opt_to_json x.f_OrderSingle_SymbolSfx );
    ( "SecurityID" , string_opt_to_json x.f_OrderSingle_SecurityID );
    ( "IDSource" , idsource_opt_to_json x.f_OrderSingle_IDSource );
    ( "SecurityType" , securitytype_opt_to_json x.f_OrderSingle_SecurityType );
    ( "MaturityMonthYear" , monthyear_opt_to_json x.f_OrderSingle_MaturityMonthYear );
    ( "MaturityDay" , int_opt_to_json x.f_OrderSingle_MaturityDay );
    ( "PutOrCall" , putorcall_opt_to_json x.f_OrderSingle_PutOrCall );
    ( "StrikePrice" , float_opt_to_json x.f_OrderSingle_StrikePrice );
    ( "OptAttribute" , char_opt_to_json x.f_OrderSingle_OptAttribute );
    ( "ContractMultiplier" , float_opt_to_json x.f_OrderSingle_ContractMultiplier );
    ( "CouponRate" , float_opt_to_json x.f_OrderSingle_CouponRate );
    ( "SecurityExchange" , exchange_opt_to_json x.f_OrderSingle_SecurityExchange );
    ( "Issuer" , string_opt_to_json x.f_OrderSingle_Issuer );
    ( "EncodedIssuerLen" , int_opt_to_json x.f_OrderSingle_EncodedIssuerLen );
    ( "EncodedIssuer" , string_opt_to_json x.f_OrderSingle_EncodedIssuer );
    ( "SecurityDesc" , string_opt_to_json x.f_OrderSingle_SecurityDesc );
    ( "EncodedSecurityDescLen" , int_opt_to_json x.f_OrderSingle_EncodedSecurityDescLen );
    ( "EncodedSecurityDesc" , string_opt_to_json x.f_OrderSingle_EncodedSecurityDesc );
    ( "PrevClosePx" , float_opt_to_json x.f_OrderSingle_PrevClosePx );
    ( "Side" , side_to_json x.f_OrderSingle_Side );
    ( "LocateReqd" , locatereqd_opt_to_json x.f_OrderSingle_LocateReqd );
    ( "TransactTime" , utctimestamp_to_json x.f_OrderSingle_TransactTime );
    ( "OrderQty" , float_opt_to_json x.f_OrderSingle_OrderQty );
    ( "CashOrderQty" , float_opt_to_json x.f_OrderSingle_CashOrderQty );
    ( "OrdType" , ordtype_to_json x.f_OrderSingle_OrdType );
    ( "Price" , float_opt_to_json x.f_OrderSingle_Price );
    ( "StopPx" , float_opt_to_json x.f_OrderSingle_StopPx );
    ( "Currency" , currency_opt_to_json x.f_OrderSingle_Currency );
    ( "ComplianceID" , string_opt_to_json x.f_OrderSingle_ComplianceID );
    ( "SolicitedFlag" , solicitedflag_opt_to_json x.f_OrderSingle_SolicitedFlag );
    ( "IOIid" , string_opt_to_json x.f_OrderSingle_IOIid );
    ( "QuoteID" , string_opt_to_json x.f_OrderSingle_QuoteID );
    ( "TimeInForce" , timeinforce_opt_to_json x.f_OrderSingle_TimeInForce );
    ( "EffectiveTime" , utctimestamp_opt_to_json x.f_OrderSingle_EffectiveTime );
    ( "ExpireDate" , localmktdate_opt_to_json x.f_OrderSingle_ExpireDate );
    ( "ExpireTime" , utctimestamp_opt_to_json x.f_OrderSingle_ExpireTime );
    ( "GTBookingInst" , gtbookinginst_opt_to_json x.f_OrderSingle_GTBookingInst );
    ( "Commission" , float_opt_to_json x.f_OrderSingle_Commission );
    ( "CommType" , commtype_opt_to_json x.f_OrderSingle_CommType );
    ( "Rule80A" , rule80a_opt_to_json x.f_OrderSingle_Rule80A );
    ( "ForexReq" , forexreq_opt_to_json x.f_OrderSingle_ForexReq );
    ( "SettlCurrency" , currency_opt_to_json x.f_OrderSingle_SettlCurrency );
    ( "Text" , string_opt_to_json x.f_OrderSingle_Text );
    ( "EncodedTextLen" , int_opt_to_json x.f_OrderSingle_EncodedTextLen );
    ( "EncodedText" , string_opt_to_json x.f_OrderSingle_EncodedText );
    ( "FutSettDate2" , localmktdate_opt_to_json x.f_OrderSingle_FutSettDate2 );
    ( "OrderQty2" , float_opt_to_json x.f_OrderSingle_OrderQty2 );
    ( "OpenClose" , openclose_opt_to_json x.f_OrderSingle_OpenClose );
    ( "CoveredOrUncovered" , coveredoruncovered_opt_to_json x.f_OrderSingle_CoveredOrUncovered );
    ( "CustomerOrFirm" , customerorfirm_opt_to_json x.f_OrderSingle_CustomerOrFirm );
    ( "MaxShow" , float_opt_to_json x.f_OrderSingle_MaxShow );
    ( "PegDifference" , float_opt_to_json x.f_OrderSingle_PegDifference );
    ( "DiscretionInst" , discretioninst_opt_to_json x.f_OrderSingle_DiscretionInst );
    ( "DiscretionOffset" , float_opt_to_json x.f_OrderSingle_DiscretionOffset );
    ( "ClearingFirm" , string_opt_to_json x.f_OrderSingle_ClearingFirm );
    ( "ClearingAccount" , string_opt_to_json x.f_OrderSingle_ClearingAccount );
    ( "OrderSingleAllocs" , rg ordersingleallocs_to_json x.f_OrderSingle_OrderSingleAllocs );
    ( "OrderSingleTradingSessions" , rg ordersingletradingsessions_to_json x.f_OrderSingle_OrderSingleTradingSessions )
    ]
;;

let orderstatusrequest_to_json x : json =
     assoc_filter_nulls [
    ( "OrderID" , string_opt_to_json x.f_OrderStatusRequest_OrderID );
    ( "ClOrdID" , string_to_json x.f_OrderStatusRequest_ClOrdID );
    ( "ClientID" , string_opt_to_json x.f_OrderStatusRequest_ClientID );
    ( "Account" , string_opt_to_json x.f_OrderStatusRequest_Account );
    ( "ExecBroker" , string_opt_to_json x.f_OrderStatusRequest_ExecBroker );
    ( "Symbol" , string_to_json x.f_OrderStatusRequest_Symbol );
    ( "SymbolSfx" , string_opt_to_json x.f_OrderStatusRequest_SymbolSfx );
    ( "SecurityID" , string_opt_to_json x.f_OrderStatusRequest_SecurityID );
    ( "IDSource" , idsource_opt_to_json x.f_OrderStatusRequest_IDSource );
    ( "SecurityType" , securitytype_opt_to_json x.f_OrderStatusRequest_SecurityType );
    ( "MaturityMonthYear" , monthyear_opt_to_json x.f_OrderStatusRequest_MaturityMonthYear );
    ( "MaturityDay" , int_opt_to_json x.f_OrderStatusRequest_MaturityDay );
    ( "PutOrCall" , putorcall_opt_to_json x.f_OrderStatusRequest_PutOrCall );
    ( "StrikePrice" , float_opt_to_json x.f_OrderStatusRequest_StrikePrice );
    ( "OptAttribute" , char_opt_to_json x.f_OrderStatusRequest_OptAttribute );
    ( "ContractMultiplier" , float_opt_to_json x.f_OrderStatusRequest_ContractMultiplier );
    ( "CouponRate" , float_opt_to_json x.f_OrderStatusRequest_CouponRate );
    ( "SecurityExchange" , exchange_opt_to_json x.f_OrderStatusRequest_SecurityExchange );
    ( "Issuer" , string_opt_to_json x.f_OrderStatusRequest_Issuer );
    ( "EncodedIssuerLen" , int_opt_to_json x.f_OrderStatusRequest_EncodedIssuerLen );
    ( "EncodedIssuer" , string_opt_to_json x.f_OrderStatusRequest_EncodedIssuer );
    ( "SecurityDesc" , string_opt_to_json x.f_OrderStatusRequest_SecurityDesc );
    ( "EncodedSecurityDescLen" , int_opt_to_json x.f_OrderStatusRequest_EncodedSecurityDescLen );
    ( "EncodedSecurityDesc" , string_opt_to_json x.f_OrderStatusRequest_EncodedSecurityDesc );
    ( "Side" , side_to_json x.f_OrderStatusRequest_Side )
    ]
;;

let quote_to_json x : json =
     assoc_filter_nulls [
    ( "QuoteReqID" , string_opt_to_json x.f_Quote_QuoteReqID );
    ( "QuoteID" , string_to_json x.f_Quote_QuoteID );
    ( "QuoteResponseLevel" , quoteresponselevel_opt_to_json x.f_Quote_QuoteResponseLevel );
    ( "TradingSessionID" , string_opt_to_json x.f_Quote_TradingSessionID );
    ( "Symbol" , string_to_json x.f_Quote_Symbol );
    ( "SymbolSfx" , string_opt_to_json x.f_Quote_SymbolSfx );
    ( "SecurityID" , string_opt_to_json x.f_Quote_SecurityID );
    ( "IDSource" , idsource_opt_to_json x.f_Quote_IDSource );
    ( "SecurityType" , securitytype_opt_to_json x.f_Quote_SecurityType );
    ( "MaturityMonthYear" , monthyear_opt_to_json x.f_Quote_MaturityMonthYear );
    ( "MaturityDay" , int_opt_to_json x.f_Quote_MaturityDay );
    ( "PutOrCall" , putorcall_opt_to_json x.f_Quote_PutOrCall );
    ( "StrikePrice" , float_opt_to_json x.f_Quote_StrikePrice );
    ( "OptAttribute" , char_opt_to_json x.f_Quote_OptAttribute );
    ( "ContractMultiplier" , float_opt_to_json x.f_Quote_ContractMultiplier );
    ( "CouponRate" , float_opt_to_json x.f_Quote_CouponRate );
    ( "SecurityExchange" , exchange_opt_to_json x.f_Quote_SecurityExchange );
    ( "Issuer" , string_opt_to_json x.f_Quote_Issuer );
    ( "EncodedIssuerLen" , int_opt_to_json x.f_Quote_EncodedIssuerLen );
    ( "EncodedIssuer" , string_opt_to_json x.f_Quote_EncodedIssuer );
    ( "SecurityDesc" , string_opt_to_json x.f_Quote_SecurityDesc );
    ( "EncodedSecurityDescLen" , int_opt_to_json x.f_Quote_EncodedSecurityDescLen );
    ( "EncodedSecurityDesc" , string_opt_to_json x.f_Quote_EncodedSecurityDesc );
    ( "BidPx" , float_opt_to_json x.f_Quote_BidPx );
    ( "OfferPx" , float_opt_to_json x.f_Quote_OfferPx );
    ( "BidSize" , float_opt_to_json x.f_Quote_BidSize );
    ( "OfferSize" , float_opt_to_json x.f_Quote_OfferSize );
    ( "ValidUntilTime" , utctimestamp_opt_to_json x.f_Quote_ValidUntilTime );
    ( "BidSpotRate" , float_opt_to_json x.f_Quote_BidSpotRate );
    ( "OfferSpotRate" , float_opt_to_json x.f_Quote_OfferSpotRate );
    ( "BidForwardPoints" , float_opt_to_json x.f_Quote_BidForwardPoints );
    ( "OfferForwardPoints" , float_opt_to_json x.f_Quote_OfferForwardPoints );
    ( "TransactTime" , utctimestamp_opt_to_json x.f_Quote_TransactTime );
    ( "FutSettDate" , localmktdate_opt_to_json x.f_Quote_FutSettDate );
    ( "OrdType" , ordtype_opt_to_json x.f_Quote_OrdType );
    ( "FutSettDate2" , localmktdate_opt_to_json x.f_Quote_FutSettDate2 );
    ( "OrderQty2" , float_opt_to_json x.f_Quote_OrderQty2 );
    ( "Currency" , currency_opt_to_json x.f_Quote_Currency )
    ]
;;

let quoteacknowledgement_to_json x : json =
     assoc_filter_nulls [
    ( "QuoteReqID" , string_opt_to_json x.f_QuoteAcknowledgement_QuoteReqID );
    ( "QuoteID" , string_opt_to_json x.f_QuoteAcknowledgement_QuoteID );
    ( "QuoteAckStatus" , quoteackstatus_to_json x.f_QuoteAcknowledgement_QuoteAckStatus );
    ( "QuoteRejectReason" , quoterejectreason_opt_to_json x.f_QuoteAcknowledgement_QuoteRejectReason );
    ( "QuoteResponseLevel" , quoteresponselevel_opt_to_json x.f_QuoteAcknowledgement_QuoteResponseLevel );
    ( "TradingSessionID" , string_opt_to_json x.f_QuoteAcknowledgement_TradingSessionID );
    ( "Text" , string_opt_to_json x.f_QuoteAcknowledgement_Text );
    ( "QuoteAcknowledgementQuoteSets" , rg quoteacknowledgementquotesets_to_json x.f_QuoteAcknowledgement_QuoteAcknowledgementQuoteSets );
    ( "QuoteAcknowledgementQuoteEntries" , rg quoteacknowledgementquoteentries_to_json x.f_QuoteAcknowledgement_QuoteAcknowledgementQuoteEntries )
    ]
;;

let quotecancel_to_json x : json =
     assoc_filter_nulls [
    ( "QuoteReqID" , string_opt_to_json x.f_QuoteCancel_QuoteReqID );
    ( "QuoteID" , string_to_json x.f_QuoteCancel_QuoteID );
    ( "QuoteCancelType" , quotecanceltype_to_json x.f_QuoteCancel_QuoteCancelType );
    ( "QuoteResponseLevel" , quoteresponselevel_opt_to_json x.f_QuoteCancel_QuoteResponseLevel );
    ( "TradingSessionID" , string_opt_to_json x.f_QuoteCancel_TradingSessionID );
    ( "QuoteCancelQuoteEntries" , rg quotecancelquoteentries_to_json x.f_QuoteCancel_QuoteCancelQuoteEntries )
    ]
;;

let quoterequest_to_json x : json =
     assoc_filter_nulls [
    ( "QuoteReqID" , string_to_json x.f_QuoteRequest_QuoteReqID );
    ( "QuoteRequestRelatedSym" , rg quoterequestrelatedsym_to_json x.f_QuoteRequest_QuoteRequestRelatedSym )
    ]
;;

let quotestatusrequest_to_json x : json =
     assoc_filter_nulls [
    ( "QuoteID" , string_opt_to_json x.f_QuoteStatusRequest_QuoteID );
    ( "Symbol" , string_to_json x.f_QuoteStatusRequest_Symbol );
    ( "SymbolSfx" , string_opt_to_json x.f_QuoteStatusRequest_SymbolSfx );
    ( "SecurityID" , string_opt_to_json x.f_QuoteStatusRequest_SecurityID );
    ( "IDSource" , idsource_opt_to_json x.f_QuoteStatusRequest_IDSource );
    ( "SecurityType" , securitytype_opt_to_json x.f_QuoteStatusRequest_SecurityType );
    ( "MaturityMonthYear" , monthyear_opt_to_json x.f_QuoteStatusRequest_MaturityMonthYear );
    ( "MaturityDay" , int_opt_to_json x.f_QuoteStatusRequest_MaturityDay );
    ( "PutOrCall" , putorcall_opt_to_json x.f_QuoteStatusRequest_PutOrCall );
    ( "StrikePrice" , float_opt_to_json x.f_QuoteStatusRequest_StrikePrice );
    ( "OptAttribute" , char_opt_to_json x.f_QuoteStatusRequest_OptAttribute );
    ( "ContractMultiplier" , float_opt_to_json x.f_QuoteStatusRequest_ContractMultiplier );
    ( "CouponRate" , float_opt_to_json x.f_QuoteStatusRequest_CouponRate );
    ( "SecurityExchange" , exchange_opt_to_json x.f_QuoteStatusRequest_SecurityExchange );
    ( "Issuer" , string_opt_to_json x.f_QuoteStatusRequest_Issuer );
    ( "EncodedIssuerLen" , int_opt_to_json x.f_QuoteStatusRequest_EncodedIssuerLen );
    ( "EncodedIssuer" , string_opt_to_json x.f_QuoteStatusRequest_EncodedIssuer );
    ( "SecurityDesc" , string_opt_to_json x.f_QuoteStatusRequest_SecurityDesc );
    ( "EncodedSecurityDescLen" , int_opt_to_json x.f_QuoteStatusRequest_EncodedSecurityDescLen );
    ( "EncodedSecurityDesc" , string_opt_to_json x.f_QuoteStatusRequest_EncodedSecurityDesc );
    ( "Side" , side_opt_to_json x.f_QuoteStatusRequest_Side );
    ( "TradingSessionID" , string_opt_to_json x.f_QuoteStatusRequest_TradingSessionID )
    ]
;;

let securitydefinition_to_json x : json =
     assoc_filter_nulls [
    ( "SecurityReqID" , string_to_json x.f_SecurityDefinition_SecurityReqID );
    ( "SecurityResponseID" , string_to_json x.f_SecurityDefinition_SecurityResponseID );
    ( "SecurityResponseType" , securityresponsetype_opt_to_json x.f_SecurityDefinition_SecurityResponseType );
    ( "TotalNumSecurities" , int_to_json x.f_SecurityDefinition_TotalNumSecurities );
    ( "Symbol" , string_opt_to_json x.f_SecurityDefinition_Symbol );
    ( "SymbolSfx" , string_opt_to_json x.f_SecurityDefinition_SymbolSfx );
    ( "SecurityID" , string_opt_to_json x.f_SecurityDefinition_SecurityID );
    ( "IDSource" , idsource_opt_to_json x.f_SecurityDefinition_IDSource );
    ( "SecurityType" , securitytype_opt_to_json x.f_SecurityDefinition_SecurityType );
    ( "MaturityMonthYear" , monthyear_opt_to_json x.f_SecurityDefinition_MaturityMonthYear );
    ( "MaturityDay" , int_opt_to_json x.f_SecurityDefinition_MaturityDay );
    ( "PutOrCall" , putorcall_opt_to_json x.f_SecurityDefinition_PutOrCall );
    ( "StrikePrice" , float_opt_to_json x.f_SecurityDefinition_StrikePrice );
    ( "OptAttribute" , char_opt_to_json x.f_SecurityDefinition_OptAttribute );
    ( "ContractMultiplier" , float_opt_to_json x.f_SecurityDefinition_ContractMultiplier );
    ( "CouponRate" , float_opt_to_json x.f_SecurityDefinition_CouponRate );
    ( "SecurityExchange" , exchange_opt_to_json x.f_SecurityDefinition_SecurityExchange );
    ( "Issuer" , string_opt_to_json x.f_SecurityDefinition_Issuer );
    ( "EncodedIssuerLen" , int_opt_to_json x.f_SecurityDefinition_EncodedIssuerLen );
    ( "EncodedIssuer" , string_opt_to_json x.f_SecurityDefinition_EncodedIssuer );
    ( "SecurityDesc" , string_opt_to_json x.f_SecurityDefinition_SecurityDesc );
    ( "EncodedSecurityDescLen" , int_opt_to_json x.f_SecurityDefinition_EncodedSecurityDescLen );
    ( "EncodedSecurityDesc" , string_opt_to_json x.f_SecurityDefinition_EncodedSecurityDesc );
    ( "Currency" , currency_opt_to_json x.f_SecurityDefinition_Currency );
    ( "TradingSessionID" , string_opt_to_json x.f_SecurityDefinition_TradingSessionID );
    ( "Text" , string_opt_to_json x.f_SecurityDefinition_Text );
    ( "EncodedTextLen" , int_opt_to_json x.f_SecurityDefinition_EncodedTextLen );
    ( "EncodedText" , string_opt_to_json x.f_SecurityDefinition_EncodedText );
    ( "SecurityDefinitionRelatedSym" , rg securitydefinitionrelatedsym_to_json x.f_SecurityDefinition_SecurityDefinitionRelatedSym )
    ]
;;

let securitydefinitionrequest_to_json x : json =
     assoc_filter_nulls [
    ( "SecurityReqID" , string_to_json x.f_SecurityDefinitionRequest_SecurityReqID );
    ( "SecurityRequestType" , securityrequesttype_to_json x.f_SecurityDefinitionRequest_SecurityRequestType );
    ( "Symbol" , string_opt_to_json x.f_SecurityDefinitionRequest_Symbol );
    ( "SymbolSfx" , string_opt_to_json x.f_SecurityDefinitionRequest_SymbolSfx );
    ( "SecurityID" , string_opt_to_json x.f_SecurityDefinitionRequest_SecurityID );
    ( "IDSource" , idsource_opt_to_json x.f_SecurityDefinitionRequest_IDSource );
    ( "SecurityType" , securitytype_opt_to_json x.f_SecurityDefinitionRequest_SecurityType );
    ( "MaturityMonthYear" , monthyear_opt_to_json x.f_SecurityDefinitionRequest_MaturityMonthYear );
    ( "MaturityDay" , int_opt_to_json x.f_SecurityDefinitionRequest_MaturityDay );
    ( "PutOrCall" , putorcall_opt_to_json x.f_SecurityDefinitionRequest_PutOrCall );
    ( "StrikePrice" , float_opt_to_json x.f_SecurityDefinitionRequest_StrikePrice );
    ( "OptAttribute" , char_opt_to_json x.f_SecurityDefinitionRequest_OptAttribute );
    ( "ContractMultiplier" , float_opt_to_json x.f_SecurityDefinitionRequest_ContractMultiplier );
    ( "CouponRate" , float_opt_to_json x.f_SecurityDefinitionRequest_CouponRate );
    ( "SecurityExchange" , exchange_opt_to_json x.f_SecurityDefinitionRequest_SecurityExchange );
    ( "Issuer" , string_opt_to_json x.f_SecurityDefinitionRequest_Issuer );
    ( "EncodedIssuerLen" , int_opt_to_json x.f_SecurityDefinitionRequest_EncodedIssuerLen );
    ( "EncodedIssuer" , string_opt_to_json x.f_SecurityDefinitionRequest_EncodedIssuer );
    ( "SecurityDesc" , string_opt_to_json x.f_SecurityDefinitionRequest_SecurityDesc );
    ( "EncodedSecurityDescLen" , int_opt_to_json x.f_SecurityDefinitionRequest_EncodedSecurityDescLen );
    ( "EncodedSecurityDesc" , string_opt_to_json x.f_SecurityDefinitionRequest_EncodedSecurityDesc );
    ( "Currency" , currency_opt_to_json x.f_SecurityDefinitionRequest_Currency );
    ( "Text" , string_opt_to_json x.f_SecurityDefinitionRequest_Text );
    ( "EncodedTextLen" , int_opt_to_json x.f_SecurityDefinitionRequest_EncodedTextLen );
    ( "EncodedText" , string_opt_to_json x.f_SecurityDefinitionRequest_EncodedText );
    ( "TradingSessionID" , string_opt_to_json x.f_SecurityDefinitionRequest_TradingSessionID );
    ( "SecurityDefinitionRequestRelatedSym" , rg securitydefinitionrequestrelatedsym_to_json x.f_SecurityDefinitionRequest_SecurityDefinitionRequestRelatedSym )
    ]
;;

let securitystatus_to_json x : json =
     assoc_filter_nulls [
    ( "SecurityStatusReqID" , string_opt_to_json x.f_SecurityStatus_SecurityStatusReqID );
    ( "Symbol" , string_to_json x.f_SecurityStatus_Symbol );
    ( "SymbolSfx" , string_opt_to_json x.f_SecurityStatus_SymbolSfx );
    ( "SecurityID" , string_opt_to_json x.f_SecurityStatus_SecurityID );
    ( "IDSource" , idsource_opt_to_json x.f_SecurityStatus_IDSource );
    ( "SecurityType" , securitytype_opt_to_json x.f_SecurityStatus_SecurityType );
    ( "MaturityMonthYear" , monthyear_opt_to_json x.f_SecurityStatus_MaturityMonthYear );
    ( "MaturityDay" , int_opt_to_json x.f_SecurityStatus_MaturityDay );
    ( "PutOrCall" , putorcall_opt_to_json x.f_SecurityStatus_PutOrCall );
    ( "StrikePrice" , float_opt_to_json x.f_SecurityStatus_StrikePrice );
    ( "OptAttribute" , char_opt_to_json x.f_SecurityStatus_OptAttribute );
    ( "ContractMultiplier" , float_opt_to_json x.f_SecurityStatus_ContractMultiplier );
    ( "CouponRate" , float_opt_to_json x.f_SecurityStatus_CouponRate );
    ( "SecurityExchange" , exchange_opt_to_json x.f_SecurityStatus_SecurityExchange );
    ( "Issuer" , string_opt_to_json x.f_SecurityStatus_Issuer );
    ( "EncodedIssuerLen" , int_opt_to_json x.f_SecurityStatus_EncodedIssuerLen );
    ( "EncodedIssuer" , string_opt_to_json x.f_SecurityStatus_EncodedIssuer );
    ( "SecurityDesc" , string_opt_to_json x.f_SecurityStatus_SecurityDesc );
    ( "EncodedSecurityDescLen" , int_opt_to_json x.f_SecurityStatus_EncodedSecurityDescLen );
    ( "EncodedSecurityDesc" , string_opt_to_json x.f_SecurityStatus_EncodedSecurityDesc );
    ( "Currency" , currency_opt_to_json x.f_SecurityStatus_Currency );
    ( "TradingSessionID" , string_opt_to_json x.f_SecurityStatus_TradingSessionID );
    ( "UnsolicitedIndicator" , unsolicitedindicator_opt_to_json x.f_SecurityStatus_UnsolicitedIndicator );
    ( "SecurityTradingStatus" , securitytradingstatus_opt_to_json x.f_SecurityStatus_SecurityTradingStatus );
    ( "FinancialStatus" , financialstatus_opt_to_json x.f_SecurityStatus_FinancialStatus );
    ( "CorporateAction" , corporateaction_opt_to_json x.f_SecurityStatus_CorporateAction );
    ( "HaltReason" , haltreason_opt_to_json x.f_SecurityStatus_HaltReason );
    ( "InViewOfCommon" , inviewofcommon_opt_to_json x.f_SecurityStatus_InViewOfCommon );
    ( "DueToRelated" , duetorelated_opt_to_json x.f_SecurityStatus_DueToRelated );
    ( "BuyVolume" , float_opt_to_json x.f_SecurityStatus_BuyVolume );
    ( "SellVolume" , float_opt_to_json x.f_SecurityStatus_SellVolume );
    ( "HighPx" , float_opt_to_json x.f_SecurityStatus_HighPx );
    ( "LowPx" , float_opt_to_json x.f_SecurityStatus_LowPx );
    ( "LastPx" , float_opt_to_json x.f_SecurityStatus_LastPx );
    ( "TransactTime" , utctimestamp_opt_to_json x.f_SecurityStatus_TransactTime );
    ( "Adjustment" , adjustment_opt_to_json x.f_SecurityStatus_Adjustment )
    ]
;;

let securitystatusrequest_to_json x : json =
     assoc_filter_nulls [
    ( "SecurityStatusReqID" , string_to_json x.f_SecurityStatusRequest_SecurityStatusReqID );
    ( "Symbol" , string_to_json x.f_SecurityStatusRequest_Symbol );
    ( "SymbolSfx" , string_opt_to_json x.f_SecurityStatusRequest_SymbolSfx );
    ( "SecurityID" , string_opt_to_json x.f_SecurityStatusRequest_SecurityID );
    ( "IDSource" , idsource_opt_to_json x.f_SecurityStatusRequest_IDSource );
    ( "SecurityType" , securitytype_opt_to_json x.f_SecurityStatusRequest_SecurityType );
    ( "MaturityMonthYear" , monthyear_opt_to_json x.f_SecurityStatusRequest_MaturityMonthYear );
    ( "MaturityDay" , int_opt_to_json x.f_SecurityStatusRequest_MaturityDay );
    ( "PutOrCall" , putorcall_opt_to_json x.f_SecurityStatusRequest_PutOrCall );
    ( "StrikePrice" , float_opt_to_json x.f_SecurityStatusRequest_StrikePrice );
    ( "OptAttribute" , char_opt_to_json x.f_SecurityStatusRequest_OptAttribute );
    ( "ContractMultiplier" , float_opt_to_json x.f_SecurityStatusRequest_ContractMultiplier );
    ( "CouponRate" , float_opt_to_json x.f_SecurityStatusRequest_CouponRate );
    ( "SecurityExchange" , exchange_opt_to_json x.f_SecurityStatusRequest_SecurityExchange );
    ( "Issuer" , string_opt_to_json x.f_SecurityStatusRequest_Issuer );
    ( "EncodedIssuerLen" , int_opt_to_json x.f_SecurityStatusRequest_EncodedIssuerLen );
    ( "EncodedIssuer" , string_opt_to_json x.f_SecurityStatusRequest_EncodedIssuer );
    ( "SecurityDesc" , string_opt_to_json x.f_SecurityStatusRequest_SecurityDesc );
    ( "EncodedSecurityDescLen" , int_opt_to_json x.f_SecurityStatusRequest_EncodedSecurityDescLen );
    ( "EncodedSecurityDesc" , string_opt_to_json x.f_SecurityStatusRequest_EncodedSecurityDesc );
    ( "Currency" , currency_opt_to_json x.f_SecurityStatusRequest_Currency );
    ( "SubscriptionRequestType" , subscriptionrequesttype_to_json x.f_SecurityStatusRequest_SubscriptionRequestType );
    ( "TradingSessionID" , string_opt_to_json x.f_SecurityStatusRequest_TradingSessionID )
    ]
;;

let settlementinstructions_to_json x : json =
     assoc_filter_nulls [
    ( "SettlInstID" , string_to_json x.f_SettlementInstructions_SettlInstID );
    ( "SettlInstTransType" , settlinsttranstype_to_json x.f_SettlementInstructions_SettlInstTransType );
    ( "SettlInstRefID" , string_to_json x.f_SettlementInstructions_SettlInstRefID );
    ( "SettlInstMode" , settlinstmode_to_json x.f_SettlementInstructions_SettlInstMode );
    ( "SettlInstSource" , settlinstsource_to_json x.f_SettlementInstructions_SettlInstSource );
    ( "AllocAccount" , string_to_json x.f_SettlementInstructions_AllocAccount );
    ( "SettlLocation" , settllocation_opt_to_json x.f_SettlementInstructions_SettlLocation );
    ( "TradeDate" , localmktdate_opt_to_json x.f_SettlementInstructions_TradeDate );
    ( "AllocID" , string_opt_to_json x.f_SettlementInstructions_AllocID );
    ( "LastMkt" , exchange_opt_to_json x.f_SettlementInstructions_LastMkt );
    ( "TradingSessionID" , string_opt_to_json x.f_SettlementInstructions_TradingSessionID );
    ( "Side" , side_opt_to_json x.f_SettlementInstructions_Side );
    ( "SecurityType" , securitytype_opt_to_json x.f_SettlementInstructions_SecurityType );
    ( "EffectiveTime" , utctimestamp_opt_to_json x.f_SettlementInstructions_EffectiveTime );
    ( "TransactTime" , utctimestamp_to_json x.f_SettlementInstructions_TransactTime );
    ( "ClientID" , string_opt_to_json x.f_SettlementInstructions_ClientID );
    ( "ExecBroker" , string_opt_to_json x.f_SettlementInstructions_ExecBroker );
    ( "StandInstDbType" , standinstdbtype_opt_to_json x.f_SettlementInstructions_StandInstDbType );
    ( "StandInstDbName" , string_opt_to_json x.f_SettlementInstructions_StandInstDbName );
    ( "StandInstDbID" , string_opt_to_json x.f_SettlementInstructions_StandInstDbID );
    ( "SettlDeliveryType" , int_opt_to_json x.f_SettlementInstructions_SettlDeliveryType );
    ( "SettlDepositoryCode" , string_opt_to_json x.f_SettlementInstructions_SettlDepositoryCode );
    ( "SettlBrkrCode" , string_opt_to_json x.f_SettlementInstructions_SettlBrkrCode );
    ( "SettlInstCode" , string_opt_to_json x.f_SettlementInstructions_SettlInstCode );
    ( "SecuritySettlAgentName" , string_opt_to_json x.f_SettlementInstructions_SecuritySettlAgentName );
    ( "SecuritySettlAgentCode" , string_opt_to_json x.f_SettlementInstructions_SecuritySettlAgentCode );
    ( "SecuritySettlAgentAcctNum" , string_opt_to_json x.f_SettlementInstructions_SecuritySettlAgentAcctNum );
    ( "SecuritySettlAgentAcctName" , string_opt_to_json x.f_SettlementInstructions_SecuritySettlAgentAcctName );
    ( "SecuritySettlAgentContactName" , string_opt_to_json x.f_SettlementInstructions_SecuritySettlAgentContactName );
    ( "SecuritySettlAgentContactPhone" , string_opt_to_json x.f_SettlementInstructions_SecuritySettlAgentContactPhone );
    ( "CashSettlAgentName" , string_opt_to_json x.f_SettlementInstructions_CashSettlAgentName );
    ( "CashSettlAgentCode" , string_opt_to_json x.f_SettlementInstructions_CashSettlAgentCode );
    ( "CashSettlAgentAcctNum" , string_opt_to_json x.f_SettlementInstructions_CashSettlAgentAcctNum );
    ( "CashSettlAgentAcctName" , string_opt_to_json x.f_SettlementInstructions_CashSettlAgentAcctName );
    ( "CashSettlAgentContactName" , string_opt_to_json x.f_SettlementInstructions_CashSettlAgentContactName );
    ( "CashSettlAgentContactPhone" , string_opt_to_json x.f_SettlementInstructions_CashSettlAgentContactPhone )
    ]
;;

let tradingsessionstatus_to_json x : json =
     assoc_filter_nulls [
    ( "TradSesReqID" , string_opt_to_json x.f_TradingSessionStatus_TradSesReqID );
    ( "TradingSessionID" , string_to_json x.f_TradingSessionStatus_TradingSessionID );
    ( "TradSesMethod" , tradsesmethod_opt_to_json x.f_TradingSessionStatus_TradSesMethod );
    ( "TradSesMode" , tradsesmode_opt_to_json x.f_TradingSessionStatus_TradSesMode );
    ( "UnsolicitedIndicator" , unsolicitedindicator_opt_to_json x.f_TradingSessionStatus_UnsolicitedIndicator );
    ( "TradSesStatus" , tradsesstatus_to_json x.f_TradingSessionStatus_TradSesStatus );
    ( "TradSesStartTime" , utctimestamp_opt_to_json x.f_TradingSessionStatus_TradSesStartTime );
    ( "TradSesOpenTime" , utctimestamp_opt_to_json x.f_TradingSessionStatus_TradSesOpenTime );
    ( "TradSesPreCloseTime" , utctimestamp_opt_to_json x.f_TradingSessionStatus_TradSesPreCloseTime );
    ( "TradSesCloseTime" , utctimestamp_opt_to_json x.f_TradingSessionStatus_TradSesCloseTime );
    ( "TradSesEndTime" , utctimestamp_opt_to_json x.f_TradingSessionStatus_TradSesEndTime );
    ( "TotalVolumeTraded" , float_opt_to_json x.f_TradingSessionStatus_TotalVolumeTraded );
    ( "Text" , string_opt_to_json x.f_TradingSessionStatus_Text );
    ( "EncodedTextLen" , int_opt_to_json x.f_TradingSessionStatus_EncodedTextLen );
    ( "EncodedText" , string_opt_to_json x.f_TradingSessionStatus_EncodedText )
    ]
;;

let tradingsessionstatusrequest_to_json x : json =
     assoc_filter_nulls [
    ( "TradSesReqID" , string_to_json x.f_TradingSessionStatusRequest_TradSesReqID );
    ( "TradingSessionID" , string_opt_to_json x.f_TradingSessionStatusRequest_TradingSessionID );
    ( "TradSesMethod" , tradsesmethod_opt_to_json x.f_TradingSessionStatusRequest_TradSesMethod );
    ( "TradSesMode" , tradsesmode_opt_to_json x.f_TradingSessionStatusRequest_TradSesMode );
    ( "SubscriptionRequestType" , subscriptionrequesttype_to_json x.f_TradingSessionStatusRequest_SubscriptionRequestType )
    ]
;;

let full_app_msg_to_json x : json = match x with
    | FIX_Full_Msg_Advertisement x -> `Assoc [( "Advertisement", advertisement_to_json x)]
    | FIX_Full_Msg_Allocation x -> `Assoc [( "Allocation", allocation_to_json x)]
    | FIX_Full_Msg_AllocationInstructionAck x -> `Assoc [( "AllocationInstructionAck", allocationinstructionack_to_json x)]
    | FIX_Full_Msg_BidRequest x -> `Assoc [( "BidRequest", bidrequest_to_json x)]
    | FIX_Full_Msg_BidResponse x -> `Assoc [( "BidResponse", bidresponse_to_json x)]
    | FIX_Full_Msg_DontKnowTrade x -> `Assoc [( "DontKnowTrade", dontknowtrade_to_json x)]
    | FIX_Full_Msg_Email x -> `Assoc [( "Email", email_to_json x)]
    | FIX_Full_Msg_ExecutionReport x -> `Assoc [( "ExecutionReport", executionreport_to_json x)]
    | FIX_Full_Msg_IOI x -> `Assoc [( "IOI", ioi_to_json x)]
    | FIX_Full_Msg_ListCancelRequest x -> `Assoc [( "ListCancelRequest", listcancelrequest_to_json x)]
    | FIX_Full_Msg_ListExecute x -> `Assoc [( "ListExecute", listexecute_to_json x)]
    | FIX_Full_Msg_ListStatus x -> `Assoc [( "ListStatus", liststatus_to_json x)]
    | FIX_Full_Msg_ListStatusRequest x -> `Assoc [( "ListStatusRequest", liststatusrequest_to_json x)]
    | FIX_Full_Msg_ListStrikePrice x -> `Assoc [( "ListStrikePrice", liststrikeprice_to_json x)]
    | FIX_Full_Msg_MarketDataIncrementalRefresh x -> `Assoc [( "MarketDataIncrementalRefresh", marketdataincrementalrefresh_to_json x)]
    | FIX_Full_Msg_MarketDataRequest x -> `Assoc [( "MarketDataRequest", marketdatarequest_to_json x)]
    | FIX_Full_Msg_MarketDataRequestReject x -> `Assoc [( "MarketDataRequestReject", marketdatarequestreject_to_json x)]
    | FIX_Full_Msg_MarketDataSnapshotFullRefresh x -> `Assoc [( "MarketDataSnapshotFullRefresh", marketdatasnapshotfullrefresh_to_json x)]
    | FIX_Full_Msg_MassQuote x -> `Assoc [( "MassQuote", massquote_to_json x)]
    | FIX_Full_Msg_News x -> `Assoc [( "News", news_to_json x)]
    | FIX_Full_Msg_OrderCancelReject x -> `Assoc [( "OrderCancelReject", ordercancelreject_to_json x)]
    | FIX_Full_Msg_OrderCancelReplaceRequest x -> `Assoc [( "OrderCancelReplaceRequest", ordercancelreplacerequest_to_json x)]
    | FIX_Full_Msg_OrderCancelRequest x -> `Assoc [( "OrderCancelRequest", ordercancelrequest_to_json x)]
    | FIX_Full_Msg_OrderList x -> `Assoc [( "OrderList", orderlist_to_json x)]
    | FIX_Full_Msg_OrderSingle x -> `Assoc [( "OrderSingle", ordersingle_to_json x)]
    | FIX_Full_Msg_OrderStatusRequest x -> `Assoc [( "OrderStatusRequest", orderstatusrequest_to_json x)]
    | FIX_Full_Msg_Quote x -> `Assoc [( "Quote", quote_to_json x)]
    | FIX_Full_Msg_QuoteAcknowledgement x -> `Assoc [( "QuoteAcknowledgement", quoteacknowledgement_to_json x)]
    | FIX_Full_Msg_QuoteCancel x -> `Assoc [( "QuoteCancel", quotecancel_to_json x)]
    | FIX_Full_Msg_QuoteRequest x -> `Assoc [( "QuoteRequest", quoterequest_to_json x)]
    | FIX_Full_Msg_QuoteStatusRequest x -> `Assoc [( "QuoteStatusRequest", quotestatusrequest_to_json x)]
    | FIX_Full_Msg_SecurityDefinition x -> `Assoc [( "SecurityDefinition", securitydefinition_to_json x)]
    | FIX_Full_Msg_SecurityDefinitionRequest x -> `Assoc [( "SecurityDefinitionRequest", securitydefinitionrequest_to_json x)]
    | FIX_Full_Msg_SecurityStatus x -> `Assoc [( "SecurityStatus", securitystatus_to_json x)]
    | FIX_Full_Msg_SecurityStatusRequest x -> `Assoc [( "SecurityStatusRequest", securitystatusrequest_to_json x)]
    | FIX_Full_Msg_SettlementInstructions x -> `Assoc [( "SettlementInstructions", settlementinstructions_to_json x)]
    | FIX_Full_Msg_TradingSessionStatus x -> `Assoc [( "TradingSessionStatus", tradingsessionstatus_to_json x)]
    | FIX_Full_Msg_TradingSessionStatusRequest x -> `Assoc [( "TradingSessionStatusRequest", tradingsessionstatusrequest_to_json x)]
;;
