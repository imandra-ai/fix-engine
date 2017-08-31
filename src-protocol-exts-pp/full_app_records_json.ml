(* Aesthetic Integration copyright 2017 *)
(* @meta[imandra_ignore] on @end *)
open Base_types_json;;
open Datetime_json;;
open Yojson;;
open Full_app_enums_json;;
open Full_app_records;;
(* @meta[imandra_ignore] off @end *)

let assoc_filter_nulls l : json =
    `Assoc ( List.filter (function ( _, `Null ) -> false | _ -> true ) l )
;;
let rg f lst : json =
    match lst with [] -> `Null | lst -> `List ( List.map f lst)
;;

let allocationmiscfees_to_json x : json =
    assoc_filter_nulls [
    ( "NoMiscFees" , int_opt_to_json x.f_AllocationMiscFees_NoMiscFees );
    ( "MiscFeeAmt" , float_opt_to_json x.f_AllocationMiscFees_MiscFeeAmt );
    ( "MiscFeeCurr" , currency_opt_to_json x.f_AllocationMiscFees_MiscFeeCurr );
    ( "MiscFeeType" , miscfeetype_opt_to_json x.f_AllocationMiscFees_MiscFeeType )
    ]
;;

let ordercancelreplacerequestallocs_to_json x : json =
    assoc_filter_nulls [
    ( "NoAllocs" , int_opt_to_json x.f_OrderCancelReplaceRequestAllocs_NoAllocs );
    ( "AllocAccount" , string_opt_to_json x.f_OrderCancelReplaceRequestAllocs_AllocAccount );
    ( "AllocShares" , float_opt_to_json x.f_OrderCancelReplaceRequestAllocs_AllocShares )
    ]
;;

let allocationallocs_to_json x : json =
    assoc_filter_nulls [
    ( "NoAllocs" , int_opt_to_json x.f_AllocationAllocs_NoAllocs );
    ( "AllocAccount" , string_opt_to_json x.f_AllocationAllocs_AllocAccount );
    ( "AllocPrice" , float_opt_to_json x.f_AllocationAllocs_AllocPrice );
    ( "AllocShares" , float_to_json x.f_AllocationAllocs_AllocShares );
    ( "ProcessCode" , processcode_opt_to_json x.f_AllocationAllocs_ProcessCode );
    ( "BrokerOfCredit" , string_opt_to_json x.f_AllocationAllocs_BrokerOfCredit );
    ( "NotifyBrokerOfCredit" , notifybrokerofcredit_opt_to_json x.f_AllocationAllocs_NotifyBrokerOfCredit );
    ( "AllocHandlInst" , allochandlinst_opt_to_json x.f_AllocationAllocs_AllocHandlInst );
    ( "AllocText" , string_opt_to_json x.f_AllocationAllocs_AllocText );
    ( "EncodedAllocTextLen" , int_opt_to_json x.f_AllocationAllocs_EncodedAllocTextLen );
    ( "EncodedAllocText" , string_opt_to_json x.f_AllocationAllocs_EncodedAllocText );
    ( "ExecBroker" , string_opt_to_json x.f_AllocationAllocs_ExecBroker );
    ( "ClientID" , string_opt_to_json x.f_AllocationAllocs_ClientID );
    ( "Commission" , float_opt_to_json x.f_AllocationAllocs_Commission );
    ( "CommType" , commtype_opt_to_json x.f_AllocationAllocs_CommType );
    ( "AllocAvgPx" , float_opt_to_json x.f_AllocationAllocs_AllocAvgPx );
    ( "AllocNetMoney" , float_opt_to_json x.f_AllocationAllocs_AllocNetMoney );
    ( "SettlCurrAmt" , float_opt_to_json x.f_AllocationAllocs_SettlCurrAmt );
    ( "SettlCurrency" , currency_opt_to_json x.f_AllocationAllocs_SettlCurrency );
    ( "SettlCurrFxRate" , float_opt_to_json x.f_AllocationAllocs_SettlCurrFxRate );
    ( "SettlCurrFxRateCalc" , char_opt_to_json x.f_AllocationAllocs_SettlCurrFxRateCalc );
    ( "AccruedInterestAmt" , float_opt_to_json x.f_AllocationAllocs_AccruedInterestAmt );
    ( "SettlInstMode" , settlinstmode_opt_to_json x.f_AllocationAllocs_SettlInstMode )
    ]
;;

let newslinesoftext_to_json x : json =
    assoc_filter_nulls [
    ( "LinesOfText" , int_to_json x.f_NewsLinesOfText_LinesOfText );
    ( "Text" , string_to_json x.f_NewsLinesOfText_Text );
    ( "EncodedTextLen" , int_opt_to_json x.f_NewsLinesOfText_EncodedTextLen );
    ( "EncodedText" , string_opt_to_json x.f_NewsLinesOfText_EncodedText )
    ]
;;

let ordersingletradingsessions_to_json x : json =
    assoc_filter_nulls [
    ( "NoTradingSessions" , int_opt_to_json x.f_OrderSingleTradingSessions_NoTradingSessions );
    ( "TradingSessionID" , string_opt_to_json x.f_OrderSingleTradingSessions_TradingSessionID )
    ]
;;

let emailrelatedsym_to_json x : json =
    assoc_filter_nulls [
    ( "NoRelatedSym" , int_opt_to_json x.f_EmailRelatedSym_NoRelatedSym );
    ( "RelatdSym" , string_opt_to_json x.f_EmailRelatedSym_RelatdSym );
    ( "SymbolSfx" , string_opt_to_json x.f_EmailRelatedSym_SymbolSfx );
    ( "SecurityID" , string_opt_to_json x.f_EmailRelatedSym_SecurityID );
    ( "IDSource" , idsource_opt_to_json x.f_EmailRelatedSym_IDSource );
    ( "SecurityType" , securitytype_opt_to_json x.f_EmailRelatedSym_SecurityType );
    ( "MaturityMonthYear" , monthyear_opt_to_json x.f_EmailRelatedSym_MaturityMonthYear );
    ( "MaturityDay" , int_opt_to_json x.f_EmailRelatedSym_MaturityDay );
    ( "PutOrCall" , putorcall_opt_to_json x.f_EmailRelatedSym_PutOrCall );
    ( "StrikePrice" , float_opt_to_json x.f_EmailRelatedSym_StrikePrice );
    ( "OptAttribute" , char_opt_to_json x.f_EmailRelatedSym_OptAttribute );
    ( "ContractMultiplier" , float_opt_to_json x.f_EmailRelatedSym_ContractMultiplier );
    ( "CouponRate" , float_opt_to_json x.f_EmailRelatedSym_CouponRate );
    ( "SecurityExchange" , exchange_opt_to_json x.f_EmailRelatedSym_SecurityExchange );
    ( "Issuer" , string_opt_to_json x.f_EmailRelatedSym_Issuer );
    ( "EncodedIssuerLen" , int_opt_to_json x.f_EmailRelatedSym_EncodedIssuerLen );
    ( "EncodedIssuer" , string_opt_to_json x.f_EmailRelatedSym_EncodedIssuer );
    ( "SecurityDesc" , string_opt_to_json x.f_EmailRelatedSym_SecurityDesc );
    ( "EncodedSecurityDescLen" , int_opt_to_json x.f_EmailRelatedSym_EncodedSecurityDescLen );
    ( "EncodedSecurityDesc" , string_opt_to_json x.f_EmailRelatedSym_EncodedSecurityDesc )
    ]
;;

let bidresponsebidcomponents_to_json x : json =
    assoc_filter_nulls [
    ( "NoBidComponents" , int_to_json x.f_BidResponseBidComponents_NoBidComponents );
    ( "Commission" , float_to_json x.f_BidResponseBidComponents_Commission );
    ( "CommType" , commtype_to_json x.f_BidResponseBidComponents_CommType );
    ( "ListID" , string_opt_to_json x.f_BidResponseBidComponents_ListID );
    ( "Country" , string_opt_to_json x.f_BidResponseBidComponents_Country );
    ( "Side" , side_opt_to_json x.f_BidResponseBidComponents_Side );
    ( "Price" , float_opt_to_json x.f_BidResponseBidComponents_Price );
    ( "PriceType" , pricetype_opt_to_json x.f_BidResponseBidComponents_PriceType );
    ( "FairValue" , float_opt_to_json x.f_BidResponseBidComponents_FairValue );
    ( "NetGrossInd" , netgrossind_opt_to_json x.f_BidResponseBidComponents_NetGrossInd );
    ( "SettlmntTyp" , settlmnttyp_opt_to_json x.f_BidResponseBidComponents_SettlmntTyp );
    ( "FutSettDate" , localmktdate_opt_to_json x.f_BidResponseBidComponents_FutSettDate );
    ( "TradingSessionID" , string_opt_to_json x.f_BidResponseBidComponents_TradingSessionID );
    ( "Text" , string_opt_to_json x.f_BidResponseBidComponents_Text );
    ( "EncodedTextLen" , int_opt_to_json x.f_BidResponseBidComponents_EncodedTextLen );
    ( "EncodedText" , string_opt_to_json x.f_BidResponseBidComponents_EncodedText )
    ]
;;

let bidrequestbiddescriptors_to_json x : json =
    assoc_filter_nulls [
    ( "NoBidDescriptors" , int_opt_to_json x.f_BidRequestBidDescriptors_NoBidDescriptors );
    ( "BidDescriptorType" , int_opt_to_json x.f_BidRequestBidDescriptors_BidDescriptorType );
    ( "BidDescriptor" , string_opt_to_json x.f_BidRequestBidDescriptors_BidDescriptor );
    ( "SideValueInd" , int_opt_to_json x.f_BidRequestBidDescriptors_SideValueInd );
    ( "LiquidityValue" , float_opt_to_json x.f_BidRequestBidDescriptors_LiquidityValue );
    ( "LiquidityNumSecurities" , int_opt_to_json x.f_BidRequestBidDescriptors_LiquidityNumSecurities );
    ( "LiquidityPctLow" , float_opt_to_json x.f_BidRequestBidDescriptors_LiquidityPctLow );
    ( "LiquidityPctHigh" , float_opt_to_json x.f_BidRequestBidDescriptors_LiquidityPctHigh );
    ( "EFPTrackingError" , float_opt_to_json x.f_BidRequestBidDescriptors_EFPTrackingError );
    ( "FairValue" , float_opt_to_json x.f_BidRequestBidDescriptors_FairValue );
    ( "OutsideIndexPct" , float_opt_to_json x.f_BidRequestBidDescriptors_OutsideIndexPct );
    ( "ValueOfFutures" , float_opt_to_json x.f_BidRequestBidDescriptors_ValueOfFutures )
    ]
;;

let ordersingleallocs_to_json x : json =
    assoc_filter_nulls [
    ( "NoAllocs" , int_opt_to_json x.f_OrderSingleAllocs_NoAllocs );
    ( "AllocAccount" , string_opt_to_json x.f_OrderSingleAllocs_AllocAccount );
    ( "AllocShares" , float_opt_to_json x.f_OrderSingleAllocs_AllocShares )
    ]
;;

let marketdatarequestmdentrytypes_to_json x : json =
    assoc_filter_nulls [
    ( "NoMDEntryTypes" , int_to_json x.f_MarketDataRequestMDEntryTypes_NoMDEntryTypes );
    ( "MDEntryType" , mdentrytype_to_json x.f_MarketDataRequestMDEntryTypes_MDEntryType )
    ]
;;

let quoterequestrelatedsym_to_json x : json =
    assoc_filter_nulls [
    ( "NoRelatedSym" , int_to_json x.f_QuoteRequestRelatedSym_NoRelatedSym );
    ( "Symbol" , string_to_json x.f_QuoteRequestRelatedSym_Symbol );
    ( "SymbolSfx" , string_opt_to_json x.f_QuoteRequestRelatedSym_SymbolSfx );
    ( "SecurityID" , string_opt_to_json x.f_QuoteRequestRelatedSym_SecurityID );
    ( "IDSource" , idsource_opt_to_json x.f_QuoteRequestRelatedSym_IDSource );
    ( "SecurityType" , securitytype_opt_to_json x.f_QuoteRequestRelatedSym_SecurityType );
    ( "MaturityMonthYear" , monthyear_opt_to_json x.f_QuoteRequestRelatedSym_MaturityMonthYear );
    ( "MaturityDay" , int_opt_to_json x.f_QuoteRequestRelatedSym_MaturityDay );
    ( "PutOrCall" , putorcall_opt_to_json x.f_QuoteRequestRelatedSym_PutOrCall );
    ( "StrikePrice" , float_opt_to_json x.f_QuoteRequestRelatedSym_StrikePrice );
    ( "OptAttribute" , char_opt_to_json x.f_QuoteRequestRelatedSym_OptAttribute );
    ( "ContractMultiplier" , float_opt_to_json x.f_QuoteRequestRelatedSym_ContractMultiplier );
    ( "CouponRate" , float_opt_to_json x.f_QuoteRequestRelatedSym_CouponRate );
    ( "SecurityExchange" , exchange_opt_to_json x.f_QuoteRequestRelatedSym_SecurityExchange );
    ( "Issuer" , string_opt_to_json x.f_QuoteRequestRelatedSym_Issuer );
    ( "EncodedIssuerLen" , int_opt_to_json x.f_QuoteRequestRelatedSym_EncodedIssuerLen );
    ( "EncodedIssuer" , string_opt_to_json x.f_QuoteRequestRelatedSym_EncodedIssuer );
    ( "SecurityDesc" , string_opt_to_json x.f_QuoteRequestRelatedSym_SecurityDesc );
    ( "EncodedSecurityDescLen" , int_opt_to_json x.f_QuoteRequestRelatedSym_EncodedSecurityDescLen );
    ( "EncodedSecurityDesc" , string_opt_to_json x.f_QuoteRequestRelatedSym_EncodedSecurityDesc );
    ( "PrevClosePx" , float_opt_to_json x.f_QuoteRequestRelatedSym_PrevClosePx );
    ( "QuoteRequestType" , quoterequesttype_opt_to_json x.f_QuoteRequestRelatedSym_QuoteRequestType );
    ( "TradingSessionID" , string_opt_to_json x.f_QuoteRequestRelatedSym_TradingSessionID );
    ( "Side" , side_opt_to_json x.f_QuoteRequestRelatedSym_Side );
    ( "OrderQty" , float_opt_to_json x.f_QuoteRequestRelatedSym_OrderQty );
    ( "FutSettDate" , localmktdate_opt_to_json x.f_QuoteRequestRelatedSym_FutSettDate );
    ( "OrdType" , ordtype_opt_to_json x.f_QuoteRequestRelatedSym_OrdType );
    ( "FutSettDate2" , localmktdate_opt_to_json x.f_QuoteRequestRelatedSym_FutSettDate2 );
    ( "OrderQty2" , float_opt_to_json x.f_QuoteRequestRelatedSym_OrderQty2 );
    ( "ExpireTime" , utctimestamp_opt_to_json x.f_QuoteRequestRelatedSym_ExpireTime );
    ( "TransactTime" , utctimestamp_opt_to_json x.f_QuoteRequestRelatedSym_TransactTime );
    ( "Currency" , currency_opt_to_json x.f_QuoteRequestRelatedSym_Currency )
    ]
;;

let marketdatasnapshotfullrefreshmdentries_to_json x : json =
    assoc_filter_nulls [
    ( "NoMDEntries" , int_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_NoMDEntries );
    ( "MDEntryType" , mdentrytype_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_MDEntryType );
    ( "MDEntryPx" , float_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_MDEntryPx );
    ( "Currency" , currency_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_Currency );
    ( "MDEntrySize" , float_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_MDEntrySize );
    ( "MDEntryDate" , utcdateonly_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_MDEntryDate );
    ( "MDEntryTime" , utctimeonly_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_MDEntryTime );
    ( "TickDirection" , tickdirection_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_TickDirection );
    ( "MDMkt" , exchange_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_MDMkt );
    ( "TradingSessionID" , string_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_TradingSessionID );
    ( "QuoteCondition" , quotecondition_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_QuoteCondition );
    ( "TradeCondition" , tradecondition_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_TradeCondition );
    ( "MDEntryOriginator" , string_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_MDEntryOriginator );
    ( "LocationID" , string_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_LocationID );
    ( "DeskID" , string_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_DeskID );
    ( "OpenCloseSettleFlag" , openclosesettleflag_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_OpenCloseSettleFlag );
    ( "TimeInForce" , timeinforce_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_TimeInForce );
    ( "ExpireDate" , localmktdate_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_ExpireDate );
    ( "ExpireTime" , utctimestamp_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_ExpireTime );
    ( "MinQty" , float_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_MinQty );
    ( "ExecInst" , execinst_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_ExecInst );
    ( "SellerDays" , int_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_SellerDays );
    ( "OrderID" , string_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_OrderID );
    ( "QuoteEntryID" , string_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_QuoteEntryID );
    ( "MDEntryBuyer" , string_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_MDEntryBuyer );
    ( "MDEntrySeller" , string_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_MDEntrySeller );
    ( "NumberOfOrders" , int_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_NumberOfOrders );
    ( "MDEntryPositionNo" , int_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_MDEntryPositionNo );
    ( "Text" , string_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_Text );
    ( "EncodedTextLen" , int_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_EncodedTextLen );
    ( "EncodedText" , string_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_EncodedText )
    ]
;;

let orderlisttradingsessions_to_json x : json =
    assoc_filter_nulls [
    ( "NoTradingSessions" , int_opt_to_json x.f_OrderListTradingSessions_NoTradingSessions );
    ( "TradingSessionID" , string_opt_to_json x.f_OrderListTradingSessions_TradingSessionID )
    ]
;;

let ordercancelreplacerequesttradingsessions_to_json x : json =
    assoc_filter_nulls [
    ( "NoTradingSessions" , int_opt_to_json x.f_OrderCancelReplaceRequestTradingSessions_NoTradingSessions );
    ( "TradingSessionID" , string_opt_to_json x.f_OrderCancelReplaceRequestTradingSessions_TradingSessionID )
    ]
;;

let orderlistorders_to_json x : json =
    assoc_filter_nulls [
    ( "NoOrders" , int_to_json x.f_OrderListOrders_NoOrders );
    ( "ClOrdID" , string_to_json x.f_OrderListOrders_ClOrdID );
    ( "ListSeqNo" , int_to_json x.f_OrderListOrders_ListSeqNo );
    ( "SettlInstMode" , settlinstmode_opt_to_json x.f_OrderListOrders_SettlInstMode );
    ( "ClientID" , string_opt_to_json x.f_OrderListOrders_ClientID );
    ( "ExecBroker" , string_opt_to_json x.f_OrderListOrders_ExecBroker );
    ( "Account" , string_opt_to_json x.f_OrderListOrders_Account );
    ( "SettlmntTyp" , settlmnttyp_opt_to_json x.f_OrderListOrders_SettlmntTyp );
    ( "FutSettDate" , localmktdate_opt_to_json x.f_OrderListOrders_FutSettDate );
    ( "HandlInst" , handlinst_opt_to_json x.f_OrderListOrders_HandlInst );
    ( "ExecInst" , execinst_opt_to_json x.f_OrderListOrders_ExecInst );
    ( "MinQty" , float_opt_to_json x.f_OrderListOrders_MinQty );
    ( "MaxFloor" , float_opt_to_json x.f_OrderListOrders_MaxFloor );
    ( "ExDestination" , exchange_opt_to_json x.f_OrderListOrders_ExDestination );
    ( "ProcessCode" , processcode_opt_to_json x.f_OrderListOrders_ProcessCode );
    ( "Symbol" , string_to_json x.f_OrderListOrders_Symbol );
    ( "SymbolSfx" , string_opt_to_json x.f_OrderListOrders_SymbolSfx );
    ( "SecurityID" , string_opt_to_json x.f_OrderListOrders_SecurityID );
    ( "IDSource" , idsource_opt_to_json x.f_OrderListOrders_IDSource );
    ( "SecurityType" , securitytype_opt_to_json x.f_OrderListOrders_SecurityType );
    ( "MaturityMonthYear" , monthyear_opt_to_json x.f_OrderListOrders_MaturityMonthYear );
    ( "MaturityDay" , int_opt_to_json x.f_OrderListOrders_MaturityDay );
    ( "PutOrCall" , putorcall_opt_to_json x.f_OrderListOrders_PutOrCall );
    ( "StrikePrice" , float_opt_to_json x.f_OrderListOrders_StrikePrice );
    ( "OptAttribute" , char_opt_to_json x.f_OrderListOrders_OptAttribute );
    ( "ContractMultiplier" , float_opt_to_json x.f_OrderListOrders_ContractMultiplier );
    ( "CouponRate" , float_opt_to_json x.f_OrderListOrders_CouponRate );
    ( "SecurityExchange" , exchange_opt_to_json x.f_OrderListOrders_SecurityExchange );
    ( "Issuer" , string_opt_to_json x.f_OrderListOrders_Issuer );
    ( "EncodedIssuerLen" , int_opt_to_json x.f_OrderListOrders_EncodedIssuerLen );
    ( "EncodedIssuer" , string_opt_to_json x.f_OrderListOrders_EncodedIssuer );
    ( "SecurityDesc" , string_opt_to_json x.f_OrderListOrders_SecurityDesc );
    ( "EncodedSecurityDescLen" , int_opt_to_json x.f_OrderListOrders_EncodedSecurityDescLen );
    ( "EncodedSecurityDesc" , string_opt_to_json x.f_OrderListOrders_EncodedSecurityDesc );
    ( "PrevClosePx" , float_opt_to_json x.f_OrderListOrders_PrevClosePx );
    ( "Side" , side_to_json x.f_OrderListOrders_Side );
    ( "SideValueInd" , int_opt_to_json x.f_OrderListOrders_SideValueInd );
    ( "LocateReqd" , locatereqd_opt_to_json x.f_OrderListOrders_LocateReqd );
    ( "TransactTime" , utctimestamp_opt_to_json x.f_OrderListOrders_TransactTime );
    ( "OrderQty" , float_opt_to_json x.f_OrderListOrders_OrderQty );
    ( "CashOrderQty" , float_opt_to_json x.f_OrderListOrders_CashOrderQty );
    ( "OrdType" , ordtype_opt_to_json x.f_OrderListOrders_OrdType );
    ( "Price" , float_opt_to_json x.f_OrderListOrders_Price );
    ( "StopPx" , float_opt_to_json x.f_OrderListOrders_StopPx );
    ( "Currency" , currency_opt_to_json x.f_OrderListOrders_Currency );
    ( "ComplianceID" , string_opt_to_json x.f_OrderListOrders_ComplianceID );
    ( "SolicitedFlag" , solicitedflag_opt_to_json x.f_OrderListOrders_SolicitedFlag );
    ( "IOIid" , string_opt_to_json x.f_OrderListOrders_IOIid );
    ( "QuoteID" , string_opt_to_json x.f_OrderListOrders_QuoteID );
    ( "TimeInForce" , timeinforce_opt_to_json x.f_OrderListOrders_TimeInForce );
    ( "EffectiveTime" , utctimestamp_opt_to_json x.f_OrderListOrders_EffectiveTime );
    ( "ExpireDate" , localmktdate_opt_to_json x.f_OrderListOrders_ExpireDate );
    ( "ExpireTime" , utctimestamp_opt_to_json x.f_OrderListOrders_ExpireTime );
    ( "GTBookingInst" , gtbookinginst_opt_to_json x.f_OrderListOrders_GTBookingInst );
    ( "Commission" , float_opt_to_json x.f_OrderListOrders_Commission );
    ( "CommType" , commtype_opt_to_json x.f_OrderListOrders_CommType );
    ( "Rule80A" , rule80a_opt_to_json x.f_OrderListOrders_Rule80A );
    ( "ForexReq" , forexreq_opt_to_json x.f_OrderListOrders_ForexReq );
    ( "SettlCurrency" , currency_opt_to_json x.f_OrderListOrders_SettlCurrency );
    ( "Text" , string_opt_to_json x.f_OrderListOrders_Text );
    ( "EncodedTextLen" , int_opt_to_json x.f_OrderListOrders_EncodedTextLen );
    ( "EncodedText" , string_opt_to_json x.f_OrderListOrders_EncodedText );
    ( "FutSettDate2" , localmktdate_opt_to_json x.f_OrderListOrders_FutSettDate2 );
    ( "OrderQty2" , float_opt_to_json x.f_OrderListOrders_OrderQty2 );
    ( "OpenClose" , openclose_opt_to_json x.f_OrderListOrders_OpenClose );
    ( "CoveredOrUncovered" , coveredoruncovered_opt_to_json x.f_OrderListOrders_CoveredOrUncovered );
    ( "CustomerOrFirm" , customerorfirm_opt_to_json x.f_OrderListOrders_CustomerOrFirm );
    ( "MaxShow" , float_opt_to_json x.f_OrderListOrders_MaxShow );
    ( "PegDifference" , float_opt_to_json x.f_OrderListOrders_PegDifference );
    ( "DiscretionInst" , discretioninst_opt_to_json x.f_OrderListOrders_DiscretionInst );
    ( "DiscretionOffset" , float_opt_to_json x.f_OrderListOrders_DiscretionOffset );
    ( "ClearingFirm" , string_opt_to_json x.f_OrderListOrders_ClearingFirm );
    ( "ClearingAccount" , string_opt_to_json x.f_OrderListOrders_ClearingAccount )
    ]
;;

let marketdatarequestrelatedsym_to_json x : json =
    assoc_filter_nulls [
    ( "NoRelatedSym" , int_to_json x.f_MarketDataRequestRelatedSym_NoRelatedSym );
    ( "Symbol" , string_to_json x.f_MarketDataRequestRelatedSym_Symbol );
    ( "SymbolSfx" , string_opt_to_json x.f_MarketDataRequestRelatedSym_SymbolSfx );
    ( "SecurityID" , string_opt_to_json x.f_MarketDataRequestRelatedSym_SecurityID );
    ( "IDSource" , idsource_opt_to_json x.f_MarketDataRequestRelatedSym_IDSource );
    ( "SecurityType" , securitytype_opt_to_json x.f_MarketDataRequestRelatedSym_SecurityType );
    ( "MaturityMonthYear" , monthyear_opt_to_json x.f_MarketDataRequestRelatedSym_MaturityMonthYear );
    ( "MaturityDay" , int_opt_to_json x.f_MarketDataRequestRelatedSym_MaturityDay );
    ( "PutOrCall" , putorcall_opt_to_json x.f_MarketDataRequestRelatedSym_PutOrCall );
    ( "StrikePrice" , float_opt_to_json x.f_MarketDataRequestRelatedSym_StrikePrice );
    ( "OptAttribute" , char_opt_to_json x.f_MarketDataRequestRelatedSym_OptAttribute );
    ( "ContractMultiplier" , float_opt_to_json x.f_MarketDataRequestRelatedSym_ContractMultiplier );
    ( "CouponRate" , float_opt_to_json x.f_MarketDataRequestRelatedSym_CouponRate );
    ( "SecurityExchange" , exchange_opt_to_json x.f_MarketDataRequestRelatedSym_SecurityExchange );
    ( "Issuer" , string_opt_to_json x.f_MarketDataRequestRelatedSym_Issuer );
    ( "EncodedIssuerLen" , int_opt_to_json x.f_MarketDataRequestRelatedSym_EncodedIssuerLen );
    ( "EncodedIssuer" , string_opt_to_json x.f_MarketDataRequestRelatedSym_EncodedIssuer );
    ( "SecurityDesc" , string_opt_to_json x.f_MarketDataRequestRelatedSym_SecurityDesc );
    ( "EncodedSecurityDescLen" , int_opt_to_json x.f_MarketDataRequestRelatedSym_EncodedSecurityDescLen );
    ( "EncodedSecurityDesc" , string_opt_to_json x.f_MarketDataRequestRelatedSym_EncodedSecurityDesc );
    ( "TradingSessionID" , string_opt_to_json x.f_MarketDataRequestRelatedSym_TradingSessionID )
    ]
;;

let quotecancelquoteentries_to_json x : json =
    assoc_filter_nulls [
    ( "NoQuoteEntries" , int_to_json x.f_QuoteCancelQuoteEntries_NoQuoteEntries );
    ( "Symbol" , string_to_json x.f_QuoteCancelQuoteEntries_Symbol );
    ( "SymbolSfx" , string_opt_to_json x.f_QuoteCancelQuoteEntries_SymbolSfx );
    ( "SecurityID" , string_opt_to_json x.f_QuoteCancelQuoteEntries_SecurityID );
    ( "IDSource" , idsource_opt_to_json x.f_QuoteCancelQuoteEntries_IDSource );
    ( "SecurityType" , securitytype_opt_to_json x.f_QuoteCancelQuoteEntries_SecurityType );
    ( "MaturityMonthYear" , monthyear_opt_to_json x.f_QuoteCancelQuoteEntries_MaturityMonthYear );
    ( "MaturityDay" , int_opt_to_json x.f_QuoteCancelQuoteEntries_MaturityDay );
    ( "PutOrCall" , putorcall_opt_to_json x.f_QuoteCancelQuoteEntries_PutOrCall );
    ( "StrikePrice" , float_opt_to_json x.f_QuoteCancelQuoteEntries_StrikePrice );
    ( "OptAttribute" , char_opt_to_json x.f_QuoteCancelQuoteEntries_OptAttribute );
    ( "ContractMultiplier" , float_opt_to_json x.f_QuoteCancelQuoteEntries_ContractMultiplier );
    ( "CouponRate" , float_opt_to_json x.f_QuoteCancelQuoteEntries_CouponRate );
    ( "SecurityExchange" , exchange_opt_to_json x.f_QuoteCancelQuoteEntries_SecurityExchange );
    ( "Issuer" , string_opt_to_json x.f_QuoteCancelQuoteEntries_Issuer );
    ( "EncodedIssuerLen" , int_opt_to_json x.f_QuoteCancelQuoteEntries_EncodedIssuerLen );
    ( "EncodedIssuer" , string_opt_to_json x.f_QuoteCancelQuoteEntries_EncodedIssuer );
    ( "SecurityDesc" , string_opt_to_json x.f_QuoteCancelQuoteEntries_SecurityDesc );
    ( "EncodedSecurityDescLen" , int_opt_to_json x.f_QuoteCancelQuoteEntries_EncodedSecurityDescLen );
    ( "EncodedSecurityDesc" , string_opt_to_json x.f_QuoteCancelQuoteEntries_EncodedSecurityDesc );
    ( "UnderlyingSymbol" , string_opt_to_json x.f_QuoteCancelQuoteEntries_UnderlyingSymbol )
    ]
;;

let massquotequoteentries_to_json x : json =
    assoc_filter_nulls [
    ( "NoQuoteEntries" , int_to_json x.f_MassQuoteQuoteEntries_NoQuoteEntries );
    ( "QuoteEntryID" , string_to_json x.f_MassQuoteQuoteEntries_QuoteEntryID );
    ( "Symbol" , string_opt_to_json x.f_MassQuoteQuoteEntries_Symbol );
    ( "SymbolSfx" , string_opt_to_json x.f_MassQuoteQuoteEntries_SymbolSfx );
    ( "SecurityID" , string_opt_to_json x.f_MassQuoteQuoteEntries_SecurityID );
    ( "IDSource" , idsource_opt_to_json x.f_MassQuoteQuoteEntries_IDSource );
    ( "SecurityType" , securitytype_opt_to_json x.f_MassQuoteQuoteEntries_SecurityType );
    ( "MaturityMonthYear" , monthyear_opt_to_json x.f_MassQuoteQuoteEntries_MaturityMonthYear );
    ( "MaturityDay" , int_opt_to_json x.f_MassQuoteQuoteEntries_MaturityDay );
    ( "PutOrCall" , putorcall_opt_to_json x.f_MassQuoteQuoteEntries_PutOrCall );
    ( "StrikePrice" , float_opt_to_json x.f_MassQuoteQuoteEntries_StrikePrice );
    ( "OptAttribute" , char_opt_to_json x.f_MassQuoteQuoteEntries_OptAttribute );
    ( "ContractMultiplier" , float_opt_to_json x.f_MassQuoteQuoteEntries_ContractMultiplier );
    ( "CouponRate" , float_opt_to_json x.f_MassQuoteQuoteEntries_CouponRate );
    ( "SecurityExchange" , exchange_opt_to_json x.f_MassQuoteQuoteEntries_SecurityExchange );
    ( "Issuer" , string_opt_to_json x.f_MassQuoteQuoteEntries_Issuer );
    ( "EncodedIssuerLen" , int_opt_to_json x.f_MassQuoteQuoteEntries_EncodedIssuerLen );
    ( "EncodedIssuer" , string_opt_to_json x.f_MassQuoteQuoteEntries_EncodedIssuer );
    ( "SecurityDesc" , string_opt_to_json x.f_MassQuoteQuoteEntries_SecurityDesc );
    ( "EncodedSecurityDescLen" , int_opt_to_json x.f_MassQuoteQuoteEntries_EncodedSecurityDescLen );
    ( "EncodedSecurityDesc" , string_opt_to_json x.f_MassQuoteQuoteEntries_EncodedSecurityDesc );
    ( "BidPx" , float_opt_to_json x.f_MassQuoteQuoteEntries_BidPx );
    ( "OfferPx" , float_opt_to_json x.f_MassQuoteQuoteEntries_OfferPx );
    ( "BidSize" , float_opt_to_json x.f_MassQuoteQuoteEntries_BidSize );
    ( "OfferSize" , float_opt_to_json x.f_MassQuoteQuoteEntries_OfferSize );
    ( "ValidUntilTime" , utctimestamp_opt_to_json x.f_MassQuoteQuoteEntries_ValidUntilTime );
    ( "BidSpotRate" , float_opt_to_json x.f_MassQuoteQuoteEntries_BidSpotRate );
    ( "OfferSpotRate" , float_opt_to_json x.f_MassQuoteQuoteEntries_OfferSpotRate );
    ( "BidForwardPoints" , float_opt_to_json x.f_MassQuoteQuoteEntries_BidForwardPoints );
    ( "OfferForwardPoints" , float_opt_to_json x.f_MassQuoteQuoteEntries_OfferForwardPoints );
    ( "TransactTime" , utctimestamp_opt_to_json x.f_MassQuoteQuoteEntries_TransactTime );
    ( "TradingSessionID" , string_opt_to_json x.f_MassQuoteQuoteEntries_TradingSessionID );
    ( "FutSettDate" , localmktdate_opt_to_json x.f_MassQuoteQuoteEntries_FutSettDate );
    ( "OrdType" , ordtype_opt_to_json x.f_MassQuoteQuoteEntries_OrdType );
    ( "FutSettDate2" , localmktdate_opt_to_json x.f_MassQuoteQuoteEntries_FutSettDate2 );
    ( "OrderQty2" , float_opt_to_json x.f_MassQuoteQuoteEntries_OrderQty2 );
    ( "Currency" , currency_opt_to_json x.f_MassQuoteQuoteEntries_Currency )
    ]
;;

let newsroutingids_to_json x : json =
    assoc_filter_nulls [
    ( "NoRoutingIDs" , int_opt_to_json x.f_NewsRoutingIDs_NoRoutingIDs );
    ( "RoutingType" , routingtype_opt_to_json x.f_NewsRoutingIDs_RoutingType );
    ( "RoutingID" , string_opt_to_json x.f_NewsRoutingIDs_RoutingID )
    ]
;;

let quoteacknowledgementquoteentries_to_json x : json =
    assoc_filter_nulls [
    ( "NoQuoteEntries" , int_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_NoQuoteEntries );
    ( "QuoteEntryID" , string_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_QuoteEntryID );
    ( "Symbol" , string_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_Symbol );
    ( "SymbolSfx" , string_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_SymbolSfx );
    ( "SecurityID" , string_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_SecurityID );
    ( "IDSource" , idsource_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_IDSource );
    ( "SecurityType" , securitytype_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_SecurityType );
    ( "MaturityMonthYear" , monthyear_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_MaturityMonthYear );
    ( "MaturityDay" , int_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_MaturityDay );
    ( "PutOrCall" , putorcall_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_PutOrCall );
    ( "StrikePrice" , float_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_StrikePrice );
    ( "OptAttribute" , char_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_OptAttribute );
    ( "ContractMultiplier" , float_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_ContractMultiplier );
    ( "CouponRate" , float_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_CouponRate );
    ( "SecurityExchange" , exchange_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_SecurityExchange );
    ( "Issuer" , string_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_Issuer );
    ( "EncodedIssuerLen" , int_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_EncodedIssuerLen );
    ( "EncodedIssuer" , string_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_EncodedIssuer );
    ( "SecurityDesc" , string_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_SecurityDesc );
    ( "EncodedSecurityDescLen" , int_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_EncodedSecurityDescLen );
    ( "EncodedSecurityDesc" , string_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_EncodedSecurityDesc );
    ( "QuoteEntryRejectReason" , quoteentryrejectreason_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_QuoteEntryRejectReason )
    ]
;;

let quoteacknowledgementquotesets_to_json x : json =
    assoc_filter_nulls [
    ( "NoQuoteSets" , int_opt_to_json x.f_QuoteAcknowledgementQuoteSets_NoQuoteSets );
    ( "QuoteSetID" , string_opt_to_json x.f_QuoteAcknowledgementQuoteSets_QuoteSetID );
    ( "UnderlyingSymbol" , string_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingSymbol );
    ( "UnderlyingSymbolSfx" , string_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingSymbolSfx );
    ( "UnderlyingSecurityID" , string_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingSecurityID );
    ( "UnderlyingIDSource" , string_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingIDSource );
    ( "UnderlyingSecurityType" , string_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingSecurityType );
    ( "UnderlyingMaturityMonthYear" , monthyear_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingMaturityMonthYear );
    ( "UnderlyingMaturityDay" , int_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingMaturityDay );
    ( "UnderlyingPutOrCall" , int_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingPutOrCall );
    ( "UnderlyingStrikePrice" , float_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingStrikePrice );
    ( "UnderlyingOptAttribute" , char_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingOptAttribute );
    ( "UnderlyingContractMultiplier" , float_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingContractMultiplier );
    ( "UnderlyingCouponRate" , float_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingCouponRate );
    ( "UnderlyingSecurityExchange" , exchange_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingSecurityExchange );
    ( "UnderlyingIssuer" , string_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingIssuer );
    ( "EncodedUnderlyingIssuerLen" , int_opt_to_json x.f_QuoteAcknowledgementQuoteSets_EncodedUnderlyingIssuerLen );
    ( "EncodedUnderlyingIssuer" , string_opt_to_json x.f_QuoteAcknowledgementQuoteSets_EncodedUnderlyingIssuer );
    ( "UnderlyingSecurityDesc" , string_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingSecurityDesc );
    ( "EncodedUnderlyingSecurityDescLen" , int_opt_to_json x.f_QuoteAcknowledgementQuoteSets_EncodedUnderlyingSecurityDescLen );
    ( "EncodedUnderlyingSecurityDesc" , string_opt_to_json x.f_QuoteAcknowledgementQuoteSets_EncodedUnderlyingSecurityDesc );
    ( "TotQuoteEntries" , int_opt_to_json x.f_QuoteAcknowledgementQuoteSets_TotQuoteEntries )
    ]
;;

let emaillinesoftext_to_json x : json =
    assoc_filter_nulls [
    ( "LinesOfText" , int_to_json x.f_EmailLinesOfText_LinesOfText );
    ( "Text" , string_to_json x.f_EmailLinesOfText_Text );
    ( "EncodedTextLen" , int_opt_to_json x.f_EmailLinesOfText_EncodedTextLen );
    ( "EncodedText" , string_opt_to_json x.f_EmailLinesOfText_EncodedText )
    ]
;;

let allocationorders_to_json x : json =
    assoc_filter_nulls [
    ( "NoOrders" , int_opt_to_json x.f_AllocationOrders_NoOrders );
    ( "ClOrdID" , string_opt_to_json x.f_AllocationOrders_ClOrdID );
    ( "OrderID" , string_opt_to_json x.f_AllocationOrders_OrderID );
    ( "SecondaryOrderID" , string_opt_to_json x.f_AllocationOrders_SecondaryOrderID );
    ( "ListID" , string_opt_to_json x.f_AllocationOrders_ListID );
    ( "WaveNo" , string_opt_to_json x.f_AllocationOrders_WaveNo )
    ]
;;

let massquotequotesets_to_json x : json =
    assoc_filter_nulls [
    ( "NoQuoteSets" , int_to_json x.f_MassQuoteQuoteSets_NoQuoteSets );
    ( "QuoteSetID" , string_to_json x.f_MassQuoteQuoteSets_QuoteSetID );
    ( "UnderlyingSymbol" , string_to_json x.f_MassQuoteQuoteSets_UnderlyingSymbol );
    ( "UnderlyingSymbolSfx" , string_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingSymbolSfx );
    ( "UnderlyingSecurityID" , string_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingSecurityID );
    ( "UnderlyingIDSource" , string_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingIDSource );
    ( "UnderlyingSecurityType" , string_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingSecurityType );
    ( "UnderlyingMaturityMonthYear" , monthyear_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingMaturityMonthYear );
    ( "UnderlyingMaturityDay" , int_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingMaturityDay );
    ( "UnderlyingPutOrCall" , int_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingPutOrCall );
    ( "UnderlyingStrikePrice" , float_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingStrikePrice );
    ( "UnderlyingOptAttribute" , char_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingOptAttribute );
    ( "UnderlyingContractMultiplier" , float_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingContractMultiplier );
    ( "UnderlyingCouponRate" , float_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingCouponRate );
    ( "UnderlyingSecurityExchange" , exchange_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingSecurityExchange );
    ( "UnderlyingIssuer" , string_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingIssuer );
    ( "EncodedUnderlyingIssuerLen" , int_opt_to_json x.f_MassQuoteQuoteSets_EncodedUnderlyingIssuerLen );
    ( "EncodedUnderlyingIssuer" , string_opt_to_json x.f_MassQuoteQuoteSets_EncodedUnderlyingIssuer );
    ( "UnderlyingSecurityDesc" , string_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingSecurityDesc );
    ( "EncodedUnderlyingSecurityDescLen" , int_opt_to_json x.f_MassQuoteQuoteSets_EncodedUnderlyingSecurityDescLen );
    ( "EncodedUnderlyingSecurityDesc" , string_opt_to_json x.f_MassQuoteQuoteSets_EncodedUnderlyingSecurityDesc );
    ( "QuoteSetValidUntilTime" , utctimestamp_opt_to_json x.f_MassQuoteQuoteSets_QuoteSetValidUntilTime );
    ( "TotQuoteEntries" , int_to_json x.f_MassQuoteQuoteSets_TotQuoteEntries )
    ]
;;

let orderlistallocs_to_json x : json =
    assoc_filter_nulls [
    ( "NoAllocs" , int_opt_to_json x.f_OrderListAllocs_NoAllocs );
    ( "AllocAccount" , string_opt_to_json x.f_OrderListAllocs_AllocAccount );
    ( "AllocShares" , float_opt_to_json x.f_OrderListAllocs_AllocShares )
    ]
;;

let marketdataincrementalrefreshmdentries_to_json x : json =
    assoc_filter_nulls [
    ( "NoMDEntries" , int_to_json x.f_MarketDataIncrementalRefreshMDEntries_NoMDEntries );
    ( "MDUpdateAction" , mdupdateaction_to_json x.f_MarketDataIncrementalRefreshMDEntries_MDUpdateAction );
    ( "DeleteReason" , deletereason_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_DeleteReason );
    ( "MDEntryType" , mdentrytype_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MDEntryType );
    ( "MDEntryID" , string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MDEntryID );
    ( "MDEntryRefID" , string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MDEntryRefID );
    ( "Symbol" , string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_Symbol );
    ( "SymbolSfx" , string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_SymbolSfx );
    ( "SecurityID" , string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_SecurityID );
    ( "IDSource" , idsource_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_IDSource );
    ( "SecurityType" , securitytype_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_SecurityType );
    ( "MaturityMonthYear" , monthyear_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MaturityMonthYear );
    ( "MaturityDay" , int_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MaturityDay );
    ( "PutOrCall" , putorcall_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_PutOrCall );
    ( "StrikePrice" , float_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_StrikePrice );
    ( "OptAttribute" , char_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_OptAttribute );
    ( "ContractMultiplier" , float_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_ContractMultiplier );
    ( "CouponRate" , float_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_CouponRate );
    ( "SecurityExchange" , exchange_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_SecurityExchange );
    ( "Issuer" , string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_Issuer );
    ( "EncodedIssuerLen" , int_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_EncodedIssuerLen );
    ( "EncodedIssuer" , string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_EncodedIssuer );
    ( "SecurityDesc" , string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_SecurityDesc );
    ( "EncodedSecurityDescLen" , int_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_EncodedSecurityDescLen );
    ( "EncodedSecurityDesc" , string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_EncodedSecurityDesc );
    ( "FinancialStatus" , financialstatus_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_FinancialStatus );
    ( "CorporateAction" , corporateaction_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_CorporateAction );
    ( "MDEntryPx" , float_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MDEntryPx );
    ( "Currency" , currency_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_Currency );
    ( "MDEntrySize" , float_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MDEntrySize );
    ( "MDEntryDate" , utcdateonly_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MDEntryDate );
    ( "MDEntryTime" , utctimeonly_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MDEntryTime );
    ( "TickDirection" , tickdirection_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_TickDirection );
    ( "MDMkt" , exchange_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MDMkt );
    ( "TradingSessionID" , string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_TradingSessionID );
    ( "QuoteCondition" , quotecondition_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_QuoteCondition );
    ( "TradeCondition" , tradecondition_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_TradeCondition );
    ( "MDEntryOriginator" , string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MDEntryOriginator );
    ( "LocationID" , string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_LocationID );
    ( "DeskID" , string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_DeskID );
    ( "OpenCloseSettleFlag" , openclosesettleflag_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_OpenCloseSettleFlag );
    ( "TimeInForce" , timeinforce_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_TimeInForce );
    ( "ExpireDate" , localmktdate_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_ExpireDate );
    ( "ExpireTime" , utctimestamp_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_ExpireTime );
    ( "MinQty" , float_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MinQty );
    ( "ExecInst" , execinst_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_ExecInst );
    ( "SellerDays" , int_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_SellerDays );
    ( "OrderID" , string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_OrderID );
    ( "QuoteEntryID" , string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_QuoteEntryID );
    ( "MDEntryBuyer" , string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MDEntryBuyer );
    ( "MDEntrySeller" , string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MDEntrySeller );
    ( "NumberOfOrders" , int_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_NumberOfOrders );
    ( "MDEntryPositionNo" , int_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MDEntryPositionNo );
    ( "TotalVolumeTraded" , float_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_TotalVolumeTraded );
    ( "Text" , string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_Text );
    ( "EncodedTextLen" , int_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_EncodedTextLen );
    ( "EncodedText" , string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_EncodedText )
    ]
;;

let securitydefinitionrelatedsym_to_json x : json =
    assoc_filter_nulls [
    ( "NoRelatedSym" , int_opt_to_json x.f_SecurityDefinitionRelatedSym_NoRelatedSym );
    ( "UnderlyingSymbol" , string_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingSymbol );
    ( "UnderlyingSymbolSfx" , string_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingSymbolSfx );
    ( "UnderlyingSecurityID" , string_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingSecurityID );
    ( "UnderlyingIDSource" , string_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingIDSource );
    ( "UnderlyingSecurityType" , string_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingSecurityType );
    ( "UnderlyingMaturityMonthYear" , monthyear_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingMaturityMonthYear );
    ( "UnderlyingMaturityDay" , int_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingMaturityDay );
    ( "UnderlyingPutOrCall" , int_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingPutOrCall );
    ( "UnderlyingStrikePrice" , float_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingStrikePrice );
    ( "UnderlyingOptAttribute" , char_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingOptAttribute );
    ( "UnderlyingContractMultiplier" , float_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingContractMultiplier );
    ( "UnderlyingCouponRate" , float_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingCouponRate );
    ( "UnderlyingSecurityExchange" , exchange_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingSecurityExchange );
    ( "UnderlyingIssuer" , string_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingIssuer );
    ( "EncodedUnderlyingIssuerLen" , int_opt_to_json x.f_SecurityDefinitionRelatedSym_EncodedUnderlyingIssuerLen );
    ( "EncodedUnderlyingIssuer" , string_opt_to_json x.f_SecurityDefinitionRelatedSym_EncodedUnderlyingIssuer );
    ( "UnderlyingSecurityDesc" , string_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingSecurityDesc );
    ( "EncodedUnderlyingSecurityDescLen" , int_opt_to_json x.f_SecurityDefinitionRelatedSym_EncodedUnderlyingSecurityDescLen );
    ( "EncodedUnderlyingSecurityDesc" , string_opt_to_json x.f_SecurityDefinitionRelatedSym_EncodedUnderlyingSecurityDesc );
    ( "RatioQty" , float_opt_to_json x.f_SecurityDefinitionRelatedSym_RatioQty );
    ( "Side" , side_opt_to_json x.f_SecurityDefinitionRelatedSym_Side );
    ( "UnderlyingCurrency" , currency_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingCurrency )
    ]
;;

let bidrequestbidcomponents_to_json x : json =
    assoc_filter_nulls [
    ( "NoBidComponents" , int_opt_to_json x.f_BidRequestBidComponents_NoBidComponents );
    ( "ListID" , string_opt_to_json x.f_BidRequestBidComponents_ListID );
    ( "Side" , side_opt_to_json x.f_BidRequestBidComponents_Side );
    ( "TradingSessionID" , string_opt_to_json x.f_BidRequestBidComponents_TradingSessionID );
    ( "NetGrossInd" , netgrossind_opt_to_json x.f_BidRequestBidComponents_NetGrossInd );
    ( "SettlmntTyp" , settlmnttyp_opt_to_json x.f_BidRequestBidComponents_SettlmntTyp );
    ( "FutSettDate" , localmktdate_opt_to_json x.f_BidRequestBidComponents_FutSettDate );
    ( "Account" , string_opt_to_json x.f_BidRequestBidComponents_Account )
    ]
;;

let liststatusorders_to_json x : json =
    assoc_filter_nulls [
    ( "NoOrders" , int_to_json x.f_ListStatusOrders_NoOrders );
    ( "ClOrdID" , string_to_json x.f_ListStatusOrders_ClOrdID );
    ( "CumQty" , float_to_json x.f_ListStatusOrders_CumQty );
    ( "OrdStatus" , ordstatus_to_json x.f_ListStatusOrders_OrdStatus );
    ( "LeavesQty" , float_to_json x.f_ListStatusOrders_LeavesQty );
    ( "CxlQty" , float_to_json x.f_ListStatusOrders_CxlQty );
    ( "AvgPx" , float_to_json x.f_ListStatusOrders_AvgPx );
    ( "OrdRejReason" , ordrejreason_opt_to_json x.f_ListStatusOrders_OrdRejReason );
    ( "Text" , string_opt_to_json x.f_ListStatusOrders_Text );
    ( "EncodedTextLen" , int_opt_to_json x.f_ListStatusOrders_EncodedTextLen );
    ( "EncodedText" , string_opt_to_json x.f_ListStatusOrders_EncodedText )
    ]
;;

let logonmsgtypes_to_json x : json =
    assoc_filter_nulls [
    ( "NoMsgTypes" , int_opt_to_json x.f_LogonMsgTypes_NoMsgTypes );
    ( "RefMsgType" , string_opt_to_json x.f_LogonMsgTypes_RefMsgType );
    ( "MsgDirection" , msgdirection_opt_to_json x.f_LogonMsgTypes_MsgDirection )
    ]
;;

let liststrikepricestrikes_to_json x : json =
    assoc_filter_nulls [
    ( "NoStrikes" , int_to_json x.f_ListStrikePriceStrikes_NoStrikes );
    ( "Symbol" , string_to_json x.f_ListStrikePriceStrikes_Symbol );
    ( "SymbolSfx" , string_opt_to_json x.f_ListStrikePriceStrikes_SymbolSfx );
    ( "SecurityID" , string_opt_to_json x.f_ListStrikePriceStrikes_SecurityID );
    ( "IDSource" , idsource_opt_to_json x.f_ListStrikePriceStrikes_IDSource );
    ( "SecurityType" , securitytype_opt_to_json x.f_ListStrikePriceStrikes_SecurityType );
    ( "MaturityMonthYear" , monthyear_opt_to_json x.f_ListStrikePriceStrikes_MaturityMonthYear );
    ( "MaturityDay" , int_opt_to_json x.f_ListStrikePriceStrikes_MaturityDay );
    ( "PutOrCall" , putorcall_opt_to_json x.f_ListStrikePriceStrikes_PutOrCall );
    ( "StrikePrice" , float_opt_to_json x.f_ListStrikePriceStrikes_StrikePrice );
    ( "OptAttribute" , char_opt_to_json x.f_ListStrikePriceStrikes_OptAttribute );
    ( "ContractMultiplier" , float_opt_to_json x.f_ListStrikePriceStrikes_ContractMultiplier );
    ( "CouponRate" , float_opt_to_json x.f_ListStrikePriceStrikes_CouponRate );
    ( "SecurityExchange" , exchange_opt_to_json x.f_ListStrikePriceStrikes_SecurityExchange );
    ( "Issuer" , string_opt_to_json x.f_ListStrikePriceStrikes_Issuer );
    ( "EncodedIssuerLen" , int_opt_to_json x.f_ListStrikePriceStrikes_EncodedIssuerLen );
    ( "EncodedIssuer" , string_opt_to_json x.f_ListStrikePriceStrikes_EncodedIssuer );
    ( "SecurityDesc" , string_opt_to_json x.f_ListStrikePriceStrikes_SecurityDesc );
    ( "EncodedSecurityDescLen" , int_opt_to_json x.f_ListStrikePriceStrikes_EncodedSecurityDescLen );
    ( "EncodedSecurityDesc" , string_opt_to_json x.f_ListStrikePriceStrikes_EncodedSecurityDesc );
    ( "PrevClosePx" , float_opt_to_json x.f_ListStrikePriceStrikes_PrevClosePx );
    ( "ClOrdID" , string_opt_to_json x.f_ListStrikePriceStrikes_ClOrdID );
    ( "Side" , side_opt_to_json x.f_ListStrikePriceStrikes_Side );
    ( "Price" , float_to_json x.f_ListStrikePriceStrikes_Price );
    ( "Currency" , currency_opt_to_json x.f_ListStrikePriceStrikes_Currency );
    ( "Text" , string_opt_to_json x.f_ListStrikePriceStrikes_Text );
    ( "EncodedTextLen" , int_opt_to_json x.f_ListStrikePriceStrikes_EncodedTextLen );
    ( "EncodedText" , string_opt_to_json x.f_ListStrikePriceStrikes_EncodedText )
    ]
;;

let interval_to_json x : json =
    assoc_filter_nulls [
    ( "start_time" , utctimestamp_to_json x.f_interval_start_time );
    ( "duration" , duration_to_json x.f_interval_duration )
    ]
;;

let executionreportcontrabrokers_to_json x : json =
    assoc_filter_nulls [
    ( "NoContraBrokers" , int_opt_to_json x.f_ExecutionReportContraBrokers_NoContraBrokers );
    ( "ContraBroker" , string_opt_to_json x.f_ExecutionReportContraBrokers_ContraBroker );
    ( "ContraTrader" , string_opt_to_json x.f_ExecutionReportContraBrokers_ContraTrader );
    ( "ContraTradeQty" , float_opt_to_json x.f_ExecutionReportContraBrokers_ContraTradeQty );
    ( "ContraTradeTime" , utctimestamp_opt_to_json x.f_ExecutionReportContraBrokers_ContraTradeTime )
    ]
;;

let ioiroutingids_to_json x : json =
    assoc_filter_nulls [
    ( "NoRoutingIDs" , int_opt_to_json x.f_IOIRoutingIDs_NoRoutingIDs );
    ( "RoutingType" , routingtype_opt_to_json x.f_IOIRoutingIDs_RoutingType );
    ( "RoutingID" , string_opt_to_json x.f_IOIRoutingIDs_RoutingID )
    ]
;;

let securitydefinitionrequestrelatedsym_to_json x : json =
    assoc_filter_nulls [
    ( "NoRelatedSym" , int_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_NoRelatedSym );
    ( "UnderlyingSymbol" , string_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingSymbol );
    ( "UnderlyingSymbolSfx" , string_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingSymbolSfx );
    ( "UnderlyingSecurityID" , string_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingSecurityID );
    ( "UnderlyingIDSource" , string_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingIDSource );
    ( "UnderlyingSecurityType" , string_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingSecurityType );
    ( "UnderlyingMaturityMonthYear" , monthyear_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingMaturityMonthYear );
    ( "UnderlyingMaturityDay" , int_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingMaturityDay );
    ( "UnderlyingPutOrCall" , int_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingPutOrCall );
    ( "UnderlyingStrikePrice" , float_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingStrikePrice );
    ( "UnderlyingOptAttribute" , char_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingOptAttribute );
    ( "UnderlyingContractMultiplier" , float_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingContractMultiplier );
    ( "UnderlyingCouponRate" , float_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingCouponRate );
    ( "UnderlyingSecurityExchange" , exchange_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingSecurityExchange );
    ( "UnderlyingIssuer" , string_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingIssuer );
    ( "EncodedUnderlyingIssuerLen" , int_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_EncodedUnderlyingIssuerLen );
    ( "EncodedUnderlyingIssuer" , string_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_EncodedUnderlyingIssuer );
    ( "UnderlyingSecurityDesc" , string_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingSecurityDesc );
    ( "EncodedUnderlyingSecurityDescLen" , int_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_EncodedUnderlyingSecurityDescLen );
    ( "EncodedUnderlyingSecurityDesc" , string_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_EncodedUnderlyingSecurityDesc );
    ( "RatioQty" , float_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_RatioQty );
    ( "Side" , side_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_Side );
    ( "UnderlyingCurrency" , currency_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingCurrency )
    ]
;;

let ioiioiqualifiers_to_json x : json =
    assoc_filter_nulls [
    ( "NoIOIQualifiers" , int_opt_to_json x.f_IOIIOIQualifiers_NoIOIQualifiers );
    ( "IOIQualifier" , ioiqualifier_opt_to_json x.f_IOIIOIQualifiers_IOIQualifier )
    ]
;;

let newsrelatedsym_to_json x : json =
    assoc_filter_nulls [
    ( "NoRelatedSym" , int_opt_to_json x.f_NewsRelatedSym_NoRelatedSym );
    ( "RelatdSym" , string_opt_to_json x.f_NewsRelatedSym_RelatdSym );
    ( "SymbolSfx" , string_opt_to_json x.f_NewsRelatedSym_SymbolSfx );
    ( "SecurityID" , string_opt_to_json x.f_NewsRelatedSym_SecurityID );
    ( "IDSource" , idsource_opt_to_json x.f_NewsRelatedSym_IDSource );
    ( "SecurityType" , securitytype_opt_to_json x.f_NewsRelatedSym_SecurityType );
    ( "MaturityMonthYear" , monthyear_opt_to_json x.f_NewsRelatedSym_MaturityMonthYear );
    ( "MaturityDay" , int_opt_to_json x.f_NewsRelatedSym_MaturityDay );
    ( "PutOrCall" , putorcall_opt_to_json x.f_NewsRelatedSym_PutOrCall );
    ( "StrikePrice" , float_opt_to_json x.f_NewsRelatedSym_StrikePrice );
    ( "OptAttribute" , char_opt_to_json x.f_NewsRelatedSym_OptAttribute );
    ( "ContractMultiplier" , float_opt_to_json x.f_NewsRelatedSym_ContractMultiplier );
    ( "CouponRate" , float_opt_to_json x.f_NewsRelatedSym_CouponRate );
    ( "SecurityExchange" , exchange_opt_to_json x.f_NewsRelatedSym_SecurityExchange );
    ( "Issuer" , string_opt_to_json x.f_NewsRelatedSym_Issuer );
    ( "EncodedIssuerLen" , int_opt_to_json x.f_NewsRelatedSym_EncodedIssuerLen );
    ( "EncodedIssuer" , string_opt_to_json x.f_NewsRelatedSym_EncodedIssuer );
    ( "SecurityDesc" , string_opt_to_json x.f_NewsRelatedSym_SecurityDesc );
    ( "EncodedSecurityDescLen" , int_opt_to_json x.f_NewsRelatedSym_EncodedSecurityDescLen );
    ( "EncodedSecurityDesc" , string_opt_to_json x.f_NewsRelatedSym_EncodedSecurityDesc )
    ]
;;

let emailroutingids_to_json x : json =
    assoc_filter_nulls [
    ( "NoRoutingIDs" , int_opt_to_json x.f_EmailRoutingIDs_NoRoutingIDs );
    ( "RoutingType" , routingtype_opt_to_json x.f_EmailRoutingIDs_RoutingType );
    ( "RoutingID" , string_opt_to_json x.f_EmailRoutingIDs_RoutingID )
    ]
;;

let allocationexecs_to_json x : json =
    assoc_filter_nulls [
    ( "NoExecs" , int_opt_to_json x.f_AllocationExecs_NoExecs );
    ( "LastShares" , float_opt_to_json x.f_AllocationExecs_LastShares );
    ( "ExecID" , string_opt_to_json x.f_AllocationExecs_ExecID );
    ( "LastPx" , float_opt_to_json x.f_AllocationExecs_LastPx );
    ( "LastCapacity" , lastcapacity_opt_to_json x.f_AllocationExecs_LastCapacity )
    ]
;;
