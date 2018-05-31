(* Aesthetic Integration copyright 2018 *)
open Base_types_json;;
open Datetime_json;;
open Full_app_enums_json;;
open Full_app_records;;
open Json_generator_utils;;
open Yojson;;

let underlyingstipulations_to_string (d)  =
    ""
;;

let underlyingstipulations_to_json (x)  : json =
    assoc_filter_nulls (("NoUnderlyingStips",int_opt_to_json x.f_UnderlyingStipulations_NoUnderlyingStips) :: (("UnderlyingStipType",string_opt_to_json x.f_UnderlyingStipulations_UnderlyingStipType) :: (("UnderlyingStipValue",string_opt_to_json x.f_UnderlyingStipulations_UnderlyingStipValue) :: [])))
;;

let execallocgrp_to_string (d)  =
    ""
;;

let execallocgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoExecs",int_opt_to_json x.f_ExecAllocGrp_NoExecs) :: (("LastQty",float_6_opt_to_json x.f_ExecAllocGrp_LastQty) :: (("ExecID",string_opt_to_json x.f_ExecAllocGrp_ExecID) :: (("SecondaryExecID",string_opt_to_json x.f_ExecAllocGrp_SecondaryExecID) :: (("LastPx",float_4_opt_to_json x.f_ExecAllocGrp_LastPx) :: (("LastParPx",float_4_opt_to_json x.f_ExecAllocGrp_LastParPx) :: (("LastCapacity",lastcapacity_opt_to_json x.f_ExecAllocGrp_LastCapacity) :: [])))))))
;;

let marketdatarequestmdentrytypes_to_string (d)  =
    ""
;;

let marketdatarequestmdentrytypes_to_json (x)  : json =
    assoc_filter_nulls (("NoMDEntryTypes",int_opt_to_json x.f_MarketDataRequestMDEntryTypes_NoMDEntryTypes) :: (("MDEntryType",mdentrytype_opt_to_json x.f_MarketDataRequestMDEntryTypes_MDEntryType) :: []))
;;

let marketdatarequestrelatedsym_to_string (d)  =
    ""
;;

let marketdatarequestrelatedsym_to_json (x)  : json =
    assoc_filter_nulls (("NoRelatedSym",int_opt_to_json x.f_MarketDataRequestRelatedSym_NoRelatedSym) :: (("Symbol",string_opt_to_json x.f_MarketDataRequestRelatedSym_Symbol) :: (("SymbolSfx",string_opt_to_json x.f_MarketDataRequestRelatedSym_SymbolSfx) :: (("SecurityID",string_opt_to_json x.f_MarketDataRequestRelatedSym_SecurityID) :: (("IDSource",idsource_opt_to_json x.f_MarketDataRequestRelatedSym_IDSource) :: (("SecurityType",securitytype_opt_to_json x.f_MarketDataRequestRelatedSym_SecurityType) :: (("MaturityMonthYear",monthyear_opt_to_json x.f_MarketDataRequestRelatedSym_MaturityMonthYear) :: (("MaturityDay",int_opt_to_json x.f_MarketDataRequestRelatedSym_MaturityDay) :: (("PutOrCall",putorcall_opt_to_json x.f_MarketDataRequestRelatedSym_PutOrCall) :: (("StrikePrice",float_4_opt_to_json x.f_MarketDataRequestRelatedSym_StrikePrice) :: (("OptAttribute",char_opt_to_json x.f_MarketDataRequestRelatedSym_OptAttribute) :: (("ContractMultiplier",float_opt_to_json x.f_MarketDataRequestRelatedSym_ContractMultiplier) :: (("CouponRate",float_opt_to_json x.f_MarketDataRequestRelatedSym_CouponRate) :: (("SecurityExchange",exchange_opt_to_json x.f_MarketDataRequestRelatedSym_SecurityExchange) :: (("Issuer",string_opt_to_json x.f_MarketDataRequestRelatedSym_Issuer) :: (("EncodedIssuerLen",int_opt_to_json x.f_MarketDataRequestRelatedSym_EncodedIssuerLen) :: (("EncodedIssuer",string_opt_to_json x.f_MarketDataRequestRelatedSym_EncodedIssuer) :: (("SecurityDesc",string_opt_to_json x.f_MarketDataRequestRelatedSym_SecurityDesc) :: (("EncodedSecurityDescLen",int_opt_to_json x.f_MarketDataRequestRelatedSym_EncodedSecurityDescLen) :: (("EncodedSecurityDesc",string_opt_to_json x.f_MarketDataRequestRelatedSym_EncodedSecurityDesc) :: (("TradingSessionID",string_opt_to_json x.f_MarketDataRequestRelatedSym_TradingSessionID) :: [])))))))))))))))))))))
;;

let quoterequestrelatedsym_to_string (d)  =
    ""
;;

let quoterequestrelatedsym_to_json (x)  : json =
    assoc_filter_nulls (("NoRelatedSym",int_opt_to_json x.f_QuoteRequestRelatedSym_NoRelatedSym) :: (("Symbol",string_opt_to_json x.f_QuoteRequestRelatedSym_Symbol) :: (("SymbolSfx",string_opt_to_json x.f_QuoteRequestRelatedSym_SymbolSfx) :: (("SecurityID",string_opt_to_json x.f_QuoteRequestRelatedSym_SecurityID) :: (("IDSource",idsource_opt_to_json x.f_QuoteRequestRelatedSym_IDSource) :: (("SecurityType",securitytype_opt_to_json x.f_QuoteRequestRelatedSym_SecurityType) :: (("MaturityMonthYear",monthyear_opt_to_json x.f_QuoteRequestRelatedSym_MaturityMonthYear) :: (("MaturityDay",int_opt_to_json x.f_QuoteRequestRelatedSym_MaturityDay) :: (("PutOrCall",putorcall_opt_to_json x.f_QuoteRequestRelatedSym_PutOrCall) :: (("StrikePrice",float_4_opt_to_json x.f_QuoteRequestRelatedSym_StrikePrice) :: (("OptAttribute",char_opt_to_json x.f_QuoteRequestRelatedSym_OptAttribute) :: (("ContractMultiplier",float_opt_to_json x.f_QuoteRequestRelatedSym_ContractMultiplier) :: (("CouponRate",float_opt_to_json x.f_QuoteRequestRelatedSym_CouponRate) :: (("SecurityExchange",exchange_opt_to_json x.f_QuoteRequestRelatedSym_SecurityExchange) :: (("Issuer",string_opt_to_json x.f_QuoteRequestRelatedSym_Issuer) :: (("EncodedIssuerLen",int_opt_to_json x.f_QuoteRequestRelatedSym_EncodedIssuerLen) :: (("EncodedIssuer",string_opt_to_json x.f_QuoteRequestRelatedSym_EncodedIssuer) :: (("SecurityDesc",string_opt_to_json x.f_QuoteRequestRelatedSym_SecurityDesc) :: (("EncodedSecurityDescLen",int_opt_to_json x.f_QuoteRequestRelatedSym_EncodedSecurityDescLen) :: (("EncodedSecurityDesc",string_opt_to_json x.f_QuoteRequestRelatedSym_EncodedSecurityDesc) :: (("PrevClosePx",float_4_opt_to_json x.f_QuoteRequestRelatedSym_PrevClosePx) :: (("QuoteRequestType",quoterequesttype_opt_to_json x.f_QuoteRequestRelatedSym_QuoteRequestType) :: (("TradingSessionID",string_opt_to_json x.f_QuoteRequestRelatedSym_TradingSessionID) :: (("Side",side_opt_to_json x.f_QuoteRequestRelatedSym_Side) :: (("OrderQty",float_6_opt_to_json x.f_QuoteRequestRelatedSym_OrderQty) :: (("FutSettDate",localmktdate_opt_to_json x.f_QuoteRequestRelatedSym_FutSettDate) :: (("OrdType",ordtype_opt_to_json x.f_QuoteRequestRelatedSym_OrdType) :: (("FutSettDate2",localmktdate_opt_to_json x.f_QuoteRequestRelatedSym_FutSettDate2) :: (("OrderQty2",float_6_opt_to_json x.f_QuoteRequestRelatedSym_OrderQty2) :: (("ExpireTime",utctimestamp_opt_to_json x.f_QuoteRequestRelatedSym_ExpireTime) :: (("TransactTime",utctimestamp_opt_to_json x.f_QuoteRequestRelatedSym_TransactTime) :: (("Currency",currency_opt_to_json x.f_QuoteRequestRelatedSym_Currency) :: []))))))))))))))))))))))))))))))))
;;

let financingdetails_to_string (d)  =
    ""
;;

let financingdetails_to_json (x)  : json =
    assoc_filter_nulls (("AgreementDesc",string_opt_to_json x.f_FinancingDetails_AgreementDesc) :: (("AgreementID",string_opt_to_json x.f_FinancingDetails_AgreementID) :: (("AgreementDate",localmktdate_opt_to_json x.f_FinancingDetails_AgreementDate) :: (("AgreementCurrency",currency_opt_to_json x.f_FinancingDetails_AgreementCurrency) :: (("TerminationType",terminationtype_opt_to_json x.f_FinancingDetails_TerminationType) :: (("StartDate",localmktdate_opt_to_json x.f_FinancingDetails_StartDate) :: (("EndDate",localmktdate_opt_to_json x.f_FinancingDetails_EndDate) :: (("DeliveryType",deliverytype_opt_to_json x.f_FinancingDetails_DeliveryType) :: (("MarginRatio",float_6_opt_to_json x.f_FinancingDetails_MarginRatio) :: [])))))))))
;;

let quotecancelquoteentries_to_string (d)  =
    ""
;;

let quotecancelquoteentries_to_json (x)  : json =
    assoc_filter_nulls (("NoQuoteEntries",int_opt_to_json x.f_QuoteCancelQuoteEntries_NoQuoteEntries) :: (("Symbol",string_opt_to_json x.f_QuoteCancelQuoteEntries_Symbol) :: (("SymbolSfx",string_opt_to_json x.f_QuoteCancelQuoteEntries_SymbolSfx) :: (("SecurityID",string_opt_to_json x.f_QuoteCancelQuoteEntries_SecurityID) :: (("IDSource",idsource_opt_to_json x.f_QuoteCancelQuoteEntries_IDSource) :: (("SecurityType",securitytype_opt_to_json x.f_QuoteCancelQuoteEntries_SecurityType) :: (("MaturityMonthYear",monthyear_opt_to_json x.f_QuoteCancelQuoteEntries_MaturityMonthYear) :: (("MaturityDay",int_opt_to_json x.f_QuoteCancelQuoteEntries_MaturityDay) :: (("PutOrCall",putorcall_opt_to_json x.f_QuoteCancelQuoteEntries_PutOrCall) :: (("StrikePrice",float_4_opt_to_json x.f_QuoteCancelQuoteEntries_StrikePrice) :: (("OptAttribute",char_opt_to_json x.f_QuoteCancelQuoteEntries_OptAttribute) :: (("ContractMultiplier",float_opt_to_json x.f_QuoteCancelQuoteEntries_ContractMultiplier) :: (("CouponRate",float_opt_to_json x.f_QuoteCancelQuoteEntries_CouponRate) :: (("SecurityExchange",exchange_opt_to_json x.f_QuoteCancelQuoteEntries_SecurityExchange) :: (("Issuer",string_opt_to_json x.f_QuoteCancelQuoteEntries_Issuer) :: (("EncodedIssuerLen",int_opt_to_json x.f_QuoteCancelQuoteEntries_EncodedIssuerLen) :: (("EncodedIssuer",string_opt_to_json x.f_QuoteCancelQuoteEntries_EncodedIssuer) :: (("SecurityDesc",string_opt_to_json x.f_QuoteCancelQuoteEntries_SecurityDesc) :: (("EncodedSecurityDescLen",int_opt_to_json x.f_QuoteCancelQuoteEntries_EncodedSecurityDescLen) :: (("EncodedSecurityDesc",string_opt_to_json x.f_QuoteCancelQuoteEntries_EncodedSecurityDesc) :: (("UnderlyingSymbol",string_opt_to_json x.f_QuoteCancelQuoteEntries_UnderlyingSymbol) :: [])))))))))))))))))))))
;;

let marketdataincrementalrefreshmdentries_to_string (d)  =
    ""
;;

let marketdataincrementalrefreshmdentries_to_json (x)  : json =
    assoc_filter_nulls (("NoMDEntries",int_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_NoMDEntries) :: (("MDUpdateAction",mdupdateaction_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MDUpdateAction) :: (("DeleteReason",deletereason_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_DeleteReason) :: (("MDEntryType",mdentrytype_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MDEntryType) :: (("MDEntryID",string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MDEntryID) :: (("MDEntryRefID",string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MDEntryRefID) :: (("Symbol",string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_Symbol) :: (("SymbolSfx",string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_SymbolSfx) :: (("SecurityID",string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_SecurityID) :: (("IDSource",idsource_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_IDSource) :: (("SecurityType",securitytype_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_SecurityType) :: (("MaturityMonthYear",monthyear_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MaturityMonthYear) :: (("MaturityDay",int_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MaturityDay) :: (("PutOrCall",putorcall_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_PutOrCall) :: (("StrikePrice",float_4_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_StrikePrice) :: (("OptAttribute",char_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_OptAttribute) :: (("ContractMultiplier",float_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_ContractMultiplier) :: (("CouponRate",float_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_CouponRate) :: (("SecurityExchange",exchange_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_SecurityExchange) :: (("Issuer",string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_Issuer) :: (("EncodedIssuerLen",int_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_EncodedIssuerLen) :: (("EncodedIssuer",string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_EncodedIssuer) :: (("SecurityDesc",string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_SecurityDesc) :: (("EncodedSecurityDescLen",int_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_EncodedSecurityDescLen) :: (("EncodedSecurityDesc",string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_EncodedSecurityDesc) :: (("FinancialStatus",financialstatus_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_FinancialStatus) :: (("CorporateAction",corporateaction_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_CorporateAction) :: (("MDEntryPx",float_4_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MDEntryPx) :: (("Currency",currency_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_Currency) :: (("MDEntrySize",float_6_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MDEntrySize) :: (("MDEntryDate",utcdateonly_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MDEntryDate) :: (("MDEntryTime",utctimeonly_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MDEntryTime) :: (("TickDirection",tickdirection_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_TickDirection) :: (("MDMkt",exchange_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MDMkt) :: (("TradingSessionID",string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_TradingSessionID) :: (("QuoteCondition",quotecondition_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_QuoteCondition) :: (("TradeCondition",tradecondition_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_TradeCondition) :: (("MDEntryOriginator",string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MDEntryOriginator) :: (("LocationID",string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_LocationID) :: (("DeskID",string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_DeskID) :: (("OpenCloseSettleFlag",openclosesettleflag_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_OpenCloseSettleFlag) :: (("TimeInForce",timeinforce_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_TimeInForce) :: (("ExpireDate",localmktdate_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_ExpireDate) :: (("ExpireTime",utctimestamp_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_ExpireTime) :: (("MinQty",float_6_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MinQty) :: (("ExecInst",execinst_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_ExecInst) :: (("SellerDays",int_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_SellerDays) :: (("OrderID",string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_OrderID) :: (("QuoteEntryID",string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_QuoteEntryID) :: (("MDEntryBuyer",string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MDEntryBuyer) :: (("MDEntrySeller",string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MDEntrySeller) :: (("NumberOfOrders",int_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_NumberOfOrders) :: (("MDEntryPositionNo",int_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MDEntryPositionNo) :: (("TotalVolumeTraded",float_6_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_TotalVolumeTraded) :: (("Text",string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_Text) :: (("EncodedTextLen",int_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_EncodedTextLen) :: (("EncodedText",string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_EncodedText) :: [])))))))))))))))))))))))))))))))))))))))))))))))))))))))))
;;

let legbenchmarkcurvedata_to_string (d)  =
    ""
;;

let legbenchmarkcurvedata_to_json (x)  : json =
    assoc_filter_nulls (("LegBenchmarkCurveCurrency",currency_opt_to_json x.f_LegBenchmarkCurveData_LegBenchmarkCurveCurrency) :: (("LegBenchmarkCurveName",string_opt_to_json x.f_LegBenchmarkCurveData_LegBenchmarkCurveName) :: (("LegBenchmarkCurvePoint",string_opt_to_json x.f_LegBenchmarkCurveData_LegBenchmarkCurvePoint) :: (("LegBenchmarkPrice",float_4_opt_to_json x.f_LegBenchmarkCurveData_LegBenchmarkPrice) :: (("LegBenchmarkPriceType",int_opt_to_json x.f_LegBenchmarkCurveData_LegBenchmarkPriceType) :: [])))))
;;

let stipulations_to_string (d)  =
    ""
;;

let stipulations_to_json (x)  : json =
    assoc_filter_nulls (("NoStipulations",int_opt_to_json x.f_Stipulations_NoStipulations) :: (("StipulationType",stipulationtype_opt_to_json x.f_Stipulations_StipulationType) :: (("StipulationValue",string_opt_to_json x.f_Stipulations_StipulationValue) :: [])))
;;

let commissiondata_to_string (d)  =
    ""
;;

let commissiondata_to_json (x)  : json =
    assoc_filter_nulls (("Commission",float_6_opt_to_json x.f_CommissionData_Commission) :: (("CommType",commtype_opt_to_json x.f_CommissionData_CommType) :: (("CommCurrency",currency_opt_to_json x.f_CommissionData_CommCurrency) :: (("FundRenewWaiv",fundrenewwaiv_opt_to_json x.f_CommissionData_FundRenewWaiv) :: []))))
;;

let hop_to_string (d)  =
    ""
;;

let hop_to_json (x)  : json =
    assoc_filter_nulls (("NoHops",int_opt_to_json x.f_Hop_NoHops) :: (("HopCompID",string_opt_to_json x.f_Hop_HopCompID) :: (("HopSendingTime",utctimestamp_opt_to_json x.f_Hop_HopSendingTime) :: (("HopRefID",int_opt_to_json x.f_Hop_HopRefID) :: []))))
;;

let secaltidgrp_to_string (d)  =
    ""
;;

let secaltidgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoSecurityAltID",int_opt_to_json x.f_SecAltIDGrp_NoSecurityAltID) :: (("SecurityAltID",string_opt_to_json x.f_SecAltIDGrp_SecurityAltID) :: (("SecurityAltIDSource",string_opt_to_json x.f_SecAltIDGrp_SecurityAltIDSource) :: [])))
;;

let allocackgrp_to_string (d)  =
    ""
;;

let allocackgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoAllocs",int_opt_to_json x.f_AllocAckGrp_NoAllocs) :: (("AllocAccount",string_opt_to_json x.f_AllocAckGrp_AllocAccount) :: (("AllocAcctIDSource",int_opt_to_json x.f_AllocAckGrp_AllocAcctIDSource) :: (("AllocPrice",float_4_opt_to_json x.f_AllocAckGrp_AllocPrice) :: (("IndividualAllocID",string_opt_to_json x.f_AllocAckGrp_IndividualAllocID) :: (("IndividualAllocRejCode",int_opt_to_json x.f_AllocAckGrp_IndividualAllocRejCode) :: (("AllocText",string_opt_to_json x.f_AllocAckGrp_AllocText) :: (("EncodedAllocTextLen",int_opt_to_json x.f_AllocAckGrp_EncodedAllocTextLen) :: (("EncodedAllocText",string_opt_to_json x.f_AllocAckGrp_EncodedAllocText) :: [])))))))))
;;

let mdrjctgrp_to_string (d)  =
    ""
;;

let mdrjctgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoAltMDSource",int_opt_to_json x.f_MDRjctGrp_NoAltMDSource) :: (("AltMDSourceID",string_opt_to_json x.f_MDRjctGrp_AltMDSourceID) :: []))
;;

let ordercancelreplacerequestallocs_to_string (d)  =
    ""
;;

let ordercancelreplacerequestallocs_to_json (x)  : json =
    assoc_filter_nulls (("NoAllocs",int_opt_to_json x.f_OrderCancelReplaceRequestAllocs_NoAllocs) :: (("AllocAccount",string_opt_to_json x.f_OrderCancelReplaceRequestAllocs_AllocAccount) :: (("AllocShares",float_6_opt_to_json x.f_OrderCancelReplaceRequestAllocs_AllocShares) :: [])))
;;

let settlptyssubgrp_to_string (d)  =
    ""
;;

let settlptyssubgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoSettlPartySubIDs",int_opt_to_json x.f_SettlPtysSubGrp_NoSettlPartySubIDs) :: (("SettlPartySubID",string_opt_to_json x.f_SettlPtysSubGrp_SettlPartySubID) :: (("SettlPartySubIDType",int_opt_to_json x.f_SettlPtysSubGrp_SettlPartySubIDType) :: [])))
;;

let trdcapdtgrp_to_string (d)  =
    ""
;;

let trdcapdtgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoDates",int_opt_to_json x.f_TrdCapDtGrp_NoDates) :: (("TradeDate",localmktdate_opt_to_json x.f_TrdCapDtGrp_TradeDate) :: (("TransactTime",utctimestamp_opt_to_json x.f_TrdCapDtGrp_TransactTime) :: [])))
;;

let discretioninstructions_to_string (d)  =
    ""
;;

let discretioninstructions_to_json (x)  : json =
    assoc_filter_nulls (("DiscretionInst",discretioninst_opt_to_json x.f_DiscretionInstructions_DiscretionInst) :: (("DiscretionOffsetValue",float_opt_to_json x.f_DiscretionInstructions_DiscretionOffsetValue) :: (("DiscretionMoveType",discretionmovetype_opt_to_json x.f_DiscretionInstructions_DiscretionMoveType) :: (("DiscretionOffsetType",discretionoffsettype_opt_to_json x.f_DiscretionInstructions_DiscretionOffsetType) :: (("DiscretionLimitType",discretionlimittype_opt_to_json x.f_DiscretionInstructions_DiscretionLimitType) :: (("DiscretionRoundDirection",discretionrounddirection_opt_to_json x.f_DiscretionInstructions_DiscretionRoundDirection) :: (("DiscretionScope",discretionscope_opt_to_json x.f_DiscretionInstructions_DiscretionScope) :: [])))))))
;;

let rgstdistinstgrp_to_string (d)  =
    ""
;;

let rgstdistinstgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoDistribInsts",int_opt_to_json x.f_RgstDistInstGrp_NoDistribInsts) :: (("DistribPaymentMethod",distribpaymentmethod_opt_to_json x.f_RgstDistInstGrp_DistribPaymentMethod) :: (("DistribPercentage",float_6_opt_to_json x.f_RgstDistInstGrp_DistribPercentage) :: (("CashDistribCurr",currency_opt_to_json x.f_RgstDistInstGrp_CashDistribCurr) :: (("CashDistribAgentName",string_opt_to_json x.f_RgstDistInstGrp_CashDistribAgentName) :: (("CashDistribAgentCode",string_opt_to_json x.f_RgstDistInstGrp_CashDistribAgentCode) :: (("CashDistribAgentAcctNumber",string_opt_to_json x.f_RgstDistInstGrp_CashDistribAgentAcctNumber) :: (("CashDistribPayRef",string_opt_to_json x.f_RgstDistInstGrp_CashDistribPayRef) :: (("CashDistribAgentAcctName",string_opt_to_json x.f_RgstDistInstGrp_CashDistribAgentAcctName) :: [])))))))))
;;

let allocationmiscfees_to_string (d)  =
    ""
;;

let allocationmiscfees_to_json (x)  : json =
    assoc_filter_nulls (("NoMiscFees",int_opt_to_json x.f_AllocationMiscFees_NoMiscFees) :: (("MiscFeeAmt",float_6_opt_to_json x.f_AllocationMiscFees_MiscFeeAmt) :: (("MiscFeeCurr",currency_opt_to_json x.f_AllocationMiscFees_MiscFeeCurr) :: (("MiscFeeType",miscfeetype_opt_to_json x.f_AllocationMiscFees_MiscFeeType) :: []))))
;;

let executionreportcontrabrokers_to_string (d)  =
    ""
;;

let executionreportcontrabrokers_to_json (x)  : json =
    assoc_filter_nulls (("NoContraBrokers",int_opt_to_json x.f_ExecutionReportContraBrokers_NoContraBrokers) :: (("ContraBroker",string_opt_to_json x.f_ExecutionReportContraBrokers_ContraBroker) :: (("ContraTrader",string_opt_to_json x.f_ExecutionReportContraBrokers_ContraTrader) :: (("ContraTradeQty",float_6_opt_to_json x.f_ExecutionReportContraBrokers_ContraTradeQty) :: (("ContraTradeTime",utctimestamp_opt_to_json x.f_ExecutionReportContraBrokers_ContraTradeTime) :: [])))))
;;

let newsrelatedsym_to_string (d)  =
    ""
;;

let newsrelatedsym_to_json (x)  : json =
    assoc_filter_nulls (("NoRelatedSym",int_opt_to_json x.f_NewsRelatedSym_NoRelatedSym) :: (("RelatdSym",string_opt_to_json x.f_NewsRelatedSym_RelatdSym) :: (("SymbolSfx",string_opt_to_json x.f_NewsRelatedSym_SymbolSfx) :: (("SecurityID",string_opt_to_json x.f_NewsRelatedSym_SecurityID) :: (("IDSource",idsource_opt_to_json x.f_NewsRelatedSym_IDSource) :: (("SecurityType",securitytype_opt_to_json x.f_NewsRelatedSym_SecurityType) :: (("MaturityMonthYear",monthyear_opt_to_json x.f_NewsRelatedSym_MaturityMonthYear) :: (("MaturityDay",int_opt_to_json x.f_NewsRelatedSym_MaturityDay) :: (("PutOrCall",putorcall_opt_to_json x.f_NewsRelatedSym_PutOrCall) :: (("StrikePrice",float_4_opt_to_json x.f_NewsRelatedSym_StrikePrice) :: (("OptAttribute",char_opt_to_json x.f_NewsRelatedSym_OptAttribute) :: (("ContractMultiplier",float_opt_to_json x.f_NewsRelatedSym_ContractMultiplier) :: (("CouponRate",float_opt_to_json x.f_NewsRelatedSym_CouponRate) :: (("SecurityExchange",exchange_opt_to_json x.f_NewsRelatedSym_SecurityExchange) :: (("Issuer",string_opt_to_json x.f_NewsRelatedSym_Issuer) :: (("EncodedIssuerLen",int_opt_to_json x.f_NewsRelatedSym_EncodedIssuerLen) :: (("EncodedIssuer",string_opt_to_json x.f_NewsRelatedSym_EncodedIssuer) :: (("SecurityDesc",string_opt_to_json x.f_NewsRelatedSym_SecurityDesc) :: (("EncodedSecurityDescLen",int_opt_to_json x.f_NewsRelatedSym_EncodedSecurityDescLen) :: (("EncodedSecurityDesc",string_opt_to_json x.f_NewsRelatedSym_EncodedSecurityDesc) :: []))))))))))))))))))))
;;

let orderlistorders_to_string (d)  =
    ""
;;

let orderlistorders_to_json (x)  : json =
    assoc_filter_nulls (("NoOrders",int_opt_to_json x.f_OrderListOrders_NoOrders) :: (("ClOrdID",string_opt_to_json x.f_OrderListOrders_ClOrdID) :: (("ListSeqNo",int_opt_to_json x.f_OrderListOrders_ListSeqNo) :: (("SettlInstMode",settlinstmode_opt_to_json x.f_OrderListOrders_SettlInstMode) :: (("ClientID",string_opt_to_json x.f_OrderListOrders_ClientID) :: (("ExecBroker",string_opt_to_json x.f_OrderListOrders_ExecBroker) :: (("Account",string_opt_to_json x.f_OrderListOrders_Account) :: (("SettlmntTyp",settlmnttyp_opt_to_json x.f_OrderListOrders_SettlmntTyp) :: (("FutSettDate",localmktdate_opt_to_json x.f_OrderListOrders_FutSettDate) :: (("HandlInst",handlinst_opt_to_json x.f_OrderListOrders_HandlInst) :: (("ExecInst",execinst_opt_to_json x.f_OrderListOrders_ExecInst) :: (("MinQty",float_6_opt_to_json x.f_OrderListOrders_MinQty) :: (("MaxFloor",float_6_opt_to_json x.f_OrderListOrders_MaxFloor) :: (("ExDestination",exchange_opt_to_json x.f_OrderListOrders_ExDestination) :: (("ProcessCode",processcode_opt_to_json x.f_OrderListOrders_ProcessCode) :: (("Symbol",string_opt_to_json x.f_OrderListOrders_Symbol) :: (("SymbolSfx",string_opt_to_json x.f_OrderListOrders_SymbolSfx) :: (("SecurityID",string_opt_to_json x.f_OrderListOrders_SecurityID) :: (("IDSource",idsource_opt_to_json x.f_OrderListOrders_IDSource) :: (("SecurityType",securitytype_opt_to_json x.f_OrderListOrders_SecurityType) :: (("MaturityMonthYear",monthyear_opt_to_json x.f_OrderListOrders_MaturityMonthYear) :: (("MaturityDay",int_opt_to_json x.f_OrderListOrders_MaturityDay) :: (("PutOrCall",putorcall_opt_to_json x.f_OrderListOrders_PutOrCall) :: (("StrikePrice",float_4_opt_to_json x.f_OrderListOrders_StrikePrice) :: (("OptAttribute",char_opt_to_json x.f_OrderListOrders_OptAttribute) :: (("ContractMultiplier",float_opt_to_json x.f_OrderListOrders_ContractMultiplier) :: (("CouponRate",float_opt_to_json x.f_OrderListOrders_CouponRate) :: (("SecurityExchange",exchange_opt_to_json x.f_OrderListOrders_SecurityExchange) :: (("Issuer",string_opt_to_json x.f_OrderListOrders_Issuer) :: (("EncodedIssuerLen",int_opt_to_json x.f_OrderListOrders_EncodedIssuerLen) :: (("EncodedIssuer",string_opt_to_json x.f_OrderListOrders_EncodedIssuer) :: (("SecurityDesc",string_opt_to_json x.f_OrderListOrders_SecurityDesc) :: (("EncodedSecurityDescLen",int_opt_to_json x.f_OrderListOrders_EncodedSecurityDescLen) :: (("EncodedSecurityDesc",string_opt_to_json x.f_OrderListOrders_EncodedSecurityDesc) :: (("PrevClosePx",float_4_opt_to_json x.f_OrderListOrders_PrevClosePx) :: (("Side",side_opt_to_json x.f_OrderListOrders_Side) :: (("SideValueInd",int_opt_to_json x.f_OrderListOrders_SideValueInd) :: (("LocateReqd",locatereqd_opt_to_json x.f_OrderListOrders_LocateReqd) :: (("TransactTime",utctimestamp_opt_to_json x.f_OrderListOrders_TransactTime) :: (("OrderQty",float_6_opt_to_json x.f_OrderListOrders_OrderQty) :: (("CashOrderQty",float_6_opt_to_json x.f_OrderListOrders_CashOrderQty) :: (("OrdType",ordtype_opt_to_json x.f_OrderListOrders_OrdType) :: (("Price",float_4_opt_to_json x.f_OrderListOrders_Price) :: (("StopPx",float_4_opt_to_json x.f_OrderListOrders_StopPx) :: (("Currency",currency_opt_to_json x.f_OrderListOrders_Currency) :: (("ComplianceID",string_opt_to_json x.f_OrderListOrders_ComplianceID) :: (("SolicitedFlag",solicitedflag_opt_to_json x.f_OrderListOrders_SolicitedFlag) :: (("IOIid",string_opt_to_json x.f_OrderListOrders_IOIid) :: (("QuoteID",string_opt_to_json x.f_OrderListOrders_QuoteID) :: (("TimeInForce",timeinforce_opt_to_json x.f_OrderListOrders_TimeInForce) :: (("EffectiveTime",utctimestamp_opt_to_json x.f_OrderListOrders_EffectiveTime) :: (("ExpireDate",localmktdate_opt_to_json x.f_OrderListOrders_ExpireDate) :: (("ExpireTime",utctimestamp_opt_to_json x.f_OrderListOrders_ExpireTime) :: (("GTBookingInst",gtbookinginst_opt_to_json x.f_OrderListOrders_GTBookingInst) :: (("Commission",float_6_opt_to_json x.f_OrderListOrders_Commission) :: (("CommType",commtype_opt_to_json x.f_OrderListOrders_CommType) :: (("Rule80A",rule80a_opt_to_json x.f_OrderListOrders_Rule80A) :: (("ForexReq",forexreq_opt_to_json x.f_OrderListOrders_ForexReq) :: (("SettlCurrency",currency_opt_to_json x.f_OrderListOrders_SettlCurrency) :: (("Text",string_opt_to_json x.f_OrderListOrders_Text) :: (("EncodedTextLen",int_opt_to_json x.f_OrderListOrders_EncodedTextLen) :: (("EncodedText",string_opt_to_json x.f_OrderListOrders_EncodedText) :: (("FutSettDate2",localmktdate_opt_to_json x.f_OrderListOrders_FutSettDate2) :: (("OrderQty2",float_6_opt_to_json x.f_OrderListOrders_OrderQty2) :: (("OpenClose",openclose_opt_to_json x.f_OrderListOrders_OpenClose) :: (("CoveredOrUncovered",coveredoruncovered_opt_to_json x.f_OrderListOrders_CoveredOrUncovered) :: (("CustomerOrFirm",customerorfirm_opt_to_json x.f_OrderListOrders_CustomerOrFirm) :: (("MaxShow",float_6_opt_to_json x.f_OrderListOrders_MaxShow) :: (("PegDifference",float_6_opt_to_json x.f_OrderListOrders_PegDifference) :: (("DiscretionInst",discretioninst_opt_to_json x.f_OrderListOrders_DiscretionInst) :: (("DiscretionOffset",float_6_opt_to_json x.f_OrderListOrders_DiscretionOffset) :: (("ClearingFirm",string_opt_to_json x.f_OrderListOrders_ClearingFirm) :: (("ClearingAccount",string_opt_to_json x.f_OrderListOrders_ClearingAccount) :: [])))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
;;

let newslinesoftext_to_string (d)  =
    ""
;;

let newslinesoftext_to_json (x)  : json =
    assoc_filter_nulls (("LinesOfText",int_opt_to_json x.f_NewsLinesOfText_LinesOfText) :: (("Text",string_opt_to_json x.f_NewsLinesOfText_Text) :: (("EncodedTextLen",int_opt_to_json x.f_NewsLinesOfText_EncodedTextLen) :: (("EncodedText",string_opt_to_json x.f_NewsLinesOfText_EncodedText) :: []))))
;;

let logonmsgtypes_to_string (d)  =
    ""
;;

let logonmsgtypes_to_json (x)  : json =
    assoc_filter_nulls (("NoMsgTypes",int_opt_to_json x.f_LogonMsgTypes_NoMsgTypes) :: (("RefMsgType",string_opt_to_json x.f_LogonMsgTypes_RefMsgType) :: (("MsgDirection",msgdirection_opt_to_json x.f_LogonMsgTypes_MsgDirection) :: [])))
;;

let contragrp_to_string (d)  =
    ""
;;

let contragrp_to_json (x)  : json =
    assoc_filter_nulls (("NoContraBrokers",int_opt_to_json x.f_ContraGrp_NoContraBrokers) :: (("ContraBroker",string_opt_to_json x.f_ContraGrp_ContraBroker) :: (("ContraTrader",string_opt_to_json x.f_ContraGrp_ContraTrader) :: (("ContraTradeQty",float_6_opt_to_json x.f_ContraGrp_ContraTradeQty) :: (("ContraTradeTime",utctimestamp_opt_to_json x.f_ContraGrp_ContraTradeTime) :: (("ContraLegRefID",string_opt_to_json x.f_ContraGrp_ContraLegRefID) :: []))))))
;;

let evntgrp_to_string (d)  =
    ""
;;

let evntgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoEvents",int_opt_to_json x.f_EvntGrp_NoEvents) :: (("EventType",eventtype_opt_to_json x.f_EvntGrp_EventType) :: (("EventDate",localmktdate_opt_to_json x.f_EvntGrp_EventDate) :: (("EventPx",float_4_opt_to_json x.f_EvntGrp_EventPx) :: (("EventText",string_opt_to_json x.f_EvntGrp_EventText) :: [])))))
;;

let clrinstgrp_to_string (d)  =
    ""
;;

let clrinstgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoClearingInstructions",int_opt_to_json x.f_ClrInstGrp_NoClearingInstructions) :: (("ClearingInstruction",clearinginstruction_opt_to_json x.f_ClrInstGrp_ClearingInstruction) :: []))
;;

let ordersingleallocs_to_string (d)  =
    ""
;;

let ordersingleallocs_to_json (x)  : json =
    assoc_filter_nulls (("NoAllocs",int_opt_to_json x.f_OrderSingleAllocs_NoAllocs) :: (("AllocAccount",string_opt_to_json x.f_OrderSingleAllocs_AllocAccount) :: (("AllocShares",float_6_opt_to_json x.f_OrderSingleAllocs_AllocShares) :: [])))
;;

let marketdatasnapshotfullrefreshmdentries_to_string (d)  =
    ""
;;

let marketdatasnapshotfullrefreshmdentries_to_json (x)  : json =
    assoc_filter_nulls (("NoMDEntries",int_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_NoMDEntries) :: (("MDEntryType",mdentrytype_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_MDEntryType) :: (("MDEntryPx",float_4_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_MDEntryPx) :: (("Currency",currency_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_Currency) :: (("MDEntrySize",float_6_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_MDEntrySize) :: (("MDEntryDate",utcdateonly_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_MDEntryDate) :: (("MDEntryTime",utctimeonly_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_MDEntryTime) :: (("TickDirection",tickdirection_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_TickDirection) :: (("MDMkt",exchange_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_MDMkt) :: (("TradingSessionID",string_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_TradingSessionID) :: (("QuoteCondition",quotecondition_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_QuoteCondition) :: (("TradeCondition",tradecondition_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_TradeCondition) :: (("MDEntryOriginator",string_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_MDEntryOriginator) :: (("LocationID",string_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_LocationID) :: (("DeskID",string_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_DeskID) :: (("OpenCloseSettleFlag",openclosesettleflag_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_OpenCloseSettleFlag) :: (("TimeInForce",timeinforce_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_TimeInForce) :: (("ExpireDate",localmktdate_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_ExpireDate) :: (("ExpireTime",utctimestamp_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_ExpireTime) :: (("MinQty",float_6_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_MinQty) :: (("ExecInst",execinst_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_ExecInst) :: (("SellerDays",int_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_SellerDays) :: (("OrderID",string_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_OrderID) :: (("QuoteEntryID",string_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_QuoteEntryID) :: (("MDEntryBuyer",string_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_MDEntryBuyer) :: (("MDEntrySeller",string_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_MDEntrySeller) :: (("NumberOfOrders",int_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_NumberOfOrders) :: (("MDEntryPositionNo",int_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_MDEntryPositionNo) :: (("Text",string_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_Text) :: (("EncodedTextLen",int_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_EncodedTextLen) :: (("EncodedText",string_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_EncodedText) :: [])))))))))))))))))))))))))))))))
;;

let affectedordgrp_to_string (d)  =
    ""
;;

let affectedordgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoAffectedOrders",int_opt_to_json x.f_AffectedOrdGrp_NoAffectedOrders) :: (("OrigClOrdID",string_opt_to_json x.f_AffectedOrdGrp_OrigClOrdID) :: (("AffectedOrderID",string_opt_to_json x.f_AffectedOrdGrp_AffectedOrderID) :: (("AffectedSecondaryOrderID",string_opt_to_json x.f_AffectedOrdGrp_AffectedSecondaryOrderID) :: []))))
;;

let routinggrp_to_string (d)  =
    ""
;;

let routinggrp_to_json (x)  : json =
    assoc_filter_nulls (("NoRoutingIDs",int_opt_to_json x.f_RoutingGrp_NoRoutingIDs) :: (("RoutingType",routingtype_opt_to_json x.f_RoutingGrp_RoutingType) :: (("RoutingID",string_opt_to_json x.f_RoutingGrp_RoutingID) :: [])))
;;

let securitydefinitionrelatedsym_to_string (d)  =
    ""
;;

let securitydefinitionrelatedsym_to_json (x)  : json =
    assoc_filter_nulls (("NoRelatedSym",int_opt_to_json x.f_SecurityDefinitionRelatedSym_NoRelatedSym) :: (("UnderlyingSymbol",string_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingSymbol) :: (("UnderlyingSymbolSfx",string_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingSymbolSfx) :: (("UnderlyingSecurityID",string_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingSecurityID) :: (("UnderlyingIDSource",string_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingIDSource) :: (("UnderlyingSecurityType",string_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingSecurityType) :: (("UnderlyingMaturityMonthYear",monthyear_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingMaturityMonthYear) :: (("UnderlyingMaturityDay",int_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingMaturityDay) :: (("UnderlyingPutOrCall",int_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingPutOrCall) :: (("UnderlyingStrikePrice",float_4_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingStrikePrice) :: (("UnderlyingOptAttribute",char_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingOptAttribute) :: (("UnderlyingContractMultiplier",float_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingContractMultiplier) :: (("UnderlyingCouponRate",float_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingCouponRate) :: (("UnderlyingSecurityExchange",exchange_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingSecurityExchange) :: (("UnderlyingIssuer",string_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingIssuer) :: (("EncodedUnderlyingIssuerLen",int_opt_to_json x.f_SecurityDefinitionRelatedSym_EncodedUnderlyingIssuerLen) :: (("EncodedUnderlyingIssuer",string_opt_to_json x.f_SecurityDefinitionRelatedSym_EncodedUnderlyingIssuer) :: (("UnderlyingSecurityDesc",string_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingSecurityDesc) :: (("EncodedUnderlyingSecurityDescLen",int_opt_to_json x.f_SecurityDefinitionRelatedSym_EncodedUnderlyingSecurityDescLen) :: (("EncodedUnderlyingSecurityDesc",string_opt_to_json x.f_SecurityDefinitionRelatedSym_EncodedUnderlyingSecurityDesc) :: (("RatioQty",float_6_opt_to_json x.f_SecurityDefinitionRelatedSym_RatioQty) :: (("Side",side_opt_to_json x.f_SecurityDefinitionRelatedSym_Side) :: (("UnderlyingCurrency",currency_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingCurrency) :: [])))))))))))))))))))))))
;;

let contamtgrp_to_string (d)  =
    ""
;;

let contamtgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoContAmts",int_opt_to_json x.f_ContAmtGrp_NoContAmts) :: (("ContAmtType",contamttype_opt_to_json x.f_ContAmtGrp_ContAmtType) :: (("ContAmtValue",float_opt_to_json x.f_ContAmtGrp_ContAmtValue) :: (("ContAmtCurr",currency_opt_to_json x.f_ContAmtGrp_ContAmtCurr) :: []))))
;;

let yielddata_to_string (d)  =
    ""
;;

let yielddata_to_json (x)  : json =
    assoc_filter_nulls (("YieldType",yieldtype_opt_to_json x.f_YieldData_YieldType) :: (("Yield",float_6_opt_to_json x.f_YieldData_Yield) :: (("YieldCalcDate",localmktdate_opt_to_json x.f_YieldData_YieldCalcDate) :: (("YieldRedemptionDate",localmktdate_opt_to_json x.f_YieldData_YieldRedemptionDate) :: (("YieldRedemptionPrice",float_4_opt_to_json x.f_YieldData_YieldRedemptionPrice) :: (("YieldRedemptionPriceType",int_opt_to_json x.f_YieldData_YieldRedemptionPriceType) :: []))))))
;;

let clearingentries_to_string (d)  =
    ""
;;

let clearingentries_to_json (x)  : json =
    assoc_filter_nulls (("NoClearingEntries",int_opt_to_json x.f_ClearingEntries_NoClearingEntries) :: (("Rule80A",rule80a_opt_to_json x.f_ClearingEntries_Rule80A) :: (("Account",string_opt_to_json x.f_ClearingEntries_Account) :: (("ClientID",string_opt_to_json x.f_ClearingEntries_ClientID) :: (("FreeText",string_opt_to_json x.f_ClearingEntries_FreeText) :: (("ClearingFirm",string_opt_to_json x.f_ClearingEntries_ClearingFirm) :: (("OpenClose",openclose_opt_to_json x.f_ClearingEntries_OpenClose) :: (("ClearingHandlingType",clearinghandlingtype_opt_to_json x.f_ClearingEntries_ClearingHandlingType) :: []))))))))
;;

let bidcompreqgrp_to_string (d)  =
    ""
;;

let bidcompreqgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoBidComponents",int_opt_to_json x.f_BidCompReqGrp_NoBidComponents) :: (("ListID",string_opt_to_json x.f_BidCompReqGrp_ListID) :: (("Side",side_opt_to_json x.f_BidCompReqGrp_Side) :: (("TradingSessionID",string_opt_to_json x.f_BidCompReqGrp_TradingSessionID) :: (("TradingSessionSubID",string_opt_to_json x.f_BidCompReqGrp_TradingSessionSubID) :: (("NetGrossInd",netgrossind_opt_to_json x.f_BidCompReqGrp_NetGrossInd) :: (("SettlType",settltype_opt_to_json x.f_BidCompReqGrp_SettlType) :: (("SettlDate",localmktdate_opt_to_json x.f_BidCompReqGrp_SettlDate) :: (("Account",string_opt_to_json x.f_BidCompReqGrp_Account) :: (("AcctIDSource",acctidsource_opt_to_json x.f_BidCompReqGrp_AcctIDSource) :: []))))))))))
;;

let massquotequotesets_to_string (d)  =
    ""
;;

let massquotequotesets_to_json (x)  : json =
    assoc_filter_nulls (("NoQuoteSets",int_opt_to_json x.f_MassQuoteQuoteSets_NoQuoteSets) :: (("QuoteSetID",string_opt_to_json x.f_MassQuoteQuoteSets_QuoteSetID) :: (("UnderlyingSymbol",string_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingSymbol) :: (("UnderlyingSymbolSfx",string_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingSymbolSfx) :: (("UnderlyingSecurityID",string_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingSecurityID) :: (("UnderlyingIDSource",string_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingIDSource) :: (("UnderlyingSecurityType",string_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingSecurityType) :: (("UnderlyingMaturityMonthYear",monthyear_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingMaturityMonthYear) :: (("UnderlyingMaturityDay",int_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingMaturityDay) :: (("UnderlyingPutOrCall",int_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingPutOrCall) :: (("UnderlyingStrikePrice",float_4_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingStrikePrice) :: (("UnderlyingOptAttribute",char_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingOptAttribute) :: (("UnderlyingContractMultiplier",float_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingContractMultiplier) :: (("UnderlyingCouponRate",float_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingCouponRate) :: (("UnderlyingSecurityExchange",exchange_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingSecurityExchange) :: (("UnderlyingIssuer",string_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingIssuer) :: (("EncodedUnderlyingIssuerLen",int_opt_to_json x.f_MassQuoteQuoteSets_EncodedUnderlyingIssuerLen) :: (("EncodedUnderlyingIssuer",string_opt_to_json x.f_MassQuoteQuoteSets_EncodedUnderlyingIssuer) :: (("UnderlyingSecurityDesc",string_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingSecurityDesc) :: (("EncodedUnderlyingSecurityDescLen",int_opt_to_json x.f_MassQuoteQuoteSets_EncodedUnderlyingSecurityDescLen) :: (("EncodedUnderlyingSecurityDesc",string_opt_to_json x.f_MassQuoteQuoteSets_EncodedUnderlyingSecurityDesc) :: (("QuoteSetValidUntilTime",utctimestamp_opt_to_json x.f_MassQuoteQuoteSets_QuoteSetValidUntilTime) :: (("TotQuoteEntries",int_opt_to_json x.f_MassQuoteQuoteSets_TotQuoteEntries) :: [])))))))))))))))))))))))
;;

let linesoftextgrp_to_string (d)  =
    ""
;;

let linesoftextgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoLinesOfText",int_opt_to_json x.f_LinesOfTextGrp_NoLinesOfText) :: (("Text",string_opt_to_json x.f_LinesOfTextGrp_Text) :: (("EncodedTextLen",int_opt_to_json x.f_LinesOfTextGrp_EncodedTextLen) :: (("EncodedText",string_opt_to_json x.f_LinesOfTextGrp_EncodedText) :: []))))
;;

let quoteacknowledgementquoteentries_to_string (d)  =
    ""
;;

let quoteacknowledgementquoteentries_to_json (x)  : json =
    assoc_filter_nulls (("NoQuoteEntries",int_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_NoQuoteEntries) :: (("QuoteEntryID",string_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_QuoteEntryID) :: (("Symbol",string_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_Symbol) :: (("SymbolSfx",string_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_SymbolSfx) :: (("SecurityID",string_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_SecurityID) :: (("IDSource",idsource_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_IDSource) :: (("SecurityType",securitytype_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_SecurityType) :: (("MaturityMonthYear",monthyear_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_MaturityMonthYear) :: (("MaturityDay",int_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_MaturityDay) :: (("PutOrCall",putorcall_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_PutOrCall) :: (("StrikePrice",float_4_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_StrikePrice) :: (("OptAttribute",char_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_OptAttribute) :: (("ContractMultiplier",float_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_ContractMultiplier) :: (("CouponRate",float_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_CouponRate) :: (("SecurityExchange",exchange_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_SecurityExchange) :: (("Issuer",string_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_Issuer) :: (("EncodedIssuerLen",int_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_EncodedIssuerLen) :: (("EncodedIssuer",string_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_EncodedIssuer) :: (("SecurityDesc",string_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_SecurityDesc) :: (("EncodedSecurityDescLen",int_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_EncodedSecurityDescLen) :: (("EncodedSecurityDesc",string_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_EncodedSecurityDesc) :: (("QuoteEntryRejectReason",quoteentryrejectreason_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_QuoteEntryRejectReason) :: []))))))))))))))))))))))
;;

let emaillinesoftext_to_string (d)  =
    ""
;;

let emaillinesoftext_to_json (x)  : json =
    assoc_filter_nulls (("LinesOfText",int_opt_to_json x.f_EmailLinesOfText_LinesOfText) :: (("Text",string_opt_to_json x.f_EmailLinesOfText_Text) :: (("EncodedTextLen",int_opt_to_json x.f_EmailLinesOfText_EncodedTextLen) :: (("EncodedText",string_opt_to_json x.f_EmailLinesOfText_EncodedText) :: []))))
;;

let ioiqualgrp_to_string (d)  =
    ""
;;

let ioiqualgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoIOIQualifiers",int_opt_to_json x.f_IOIQualGrp_NoIOIQualifiers) :: (("IOIQualifier",ioiqualifier_opt_to_json x.f_IOIQualGrp_IOIQualifier) :: []))
;;

let execsgrp_to_string (d)  =
    ""
;;

let execsgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoExecs",int_opt_to_json x.f_ExecsGrp_NoExecs) :: (("ExecID",string_opt_to_json x.f_ExecsGrp_ExecID) :: []))
;;

let quoteacknowledgementquotesets_to_string (d)  =
    ""
;;

let quoteacknowledgementquotesets_to_json (x)  : json =
    assoc_filter_nulls (("NoQuoteSets",int_opt_to_json x.f_QuoteAcknowledgementQuoteSets_NoQuoteSets) :: (("QuoteSetID",string_opt_to_json x.f_QuoteAcknowledgementQuoteSets_QuoteSetID) :: (("UnderlyingSymbol",string_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingSymbol) :: (("UnderlyingSymbolSfx",string_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingSymbolSfx) :: (("UnderlyingSecurityID",string_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingSecurityID) :: (("UnderlyingIDSource",string_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingIDSource) :: (("UnderlyingSecurityType",string_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingSecurityType) :: (("UnderlyingMaturityMonthYear",monthyear_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingMaturityMonthYear) :: (("UnderlyingMaturityDay",int_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingMaturityDay) :: (("UnderlyingPutOrCall",int_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingPutOrCall) :: (("UnderlyingStrikePrice",float_4_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingStrikePrice) :: (("UnderlyingOptAttribute",char_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingOptAttribute) :: (("UnderlyingContractMultiplier",float_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingContractMultiplier) :: (("UnderlyingCouponRate",float_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingCouponRate) :: (("UnderlyingSecurityExchange",exchange_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingSecurityExchange) :: (("UnderlyingIssuer",string_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingIssuer) :: (("EncodedUnderlyingIssuerLen",int_opt_to_json x.f_QuoteAcknowledgementQuoteSets_EncodedUnderlyingIssuerLen) :: (("EncodedUnderlyingIssuer",string_opt_to_json x.f_QuoteAcknowledgementQuoteSets_EncodedUnderlyingIssuer) :: (("UnderlyingSecurityDesc",string_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingSecurityDesc) :: (("EncodedUnderlyingSecurityDescLen",int_opt_to_json x.f_QuoteAcknowledgementQuoteSets_EncodedUnderlyingSecurityDescLen) :: (("EncodedUnderlyingSecurityDesc",string_opt_to_json x.f_QuoteAcknowledgementQuoteSets_EncodedUnderlyingSecurityDesc) :: (("TotQuoteEntries",int_opt_to_json x.f_QuoteAcknowledgementQuoteSets_TotQuoteEntries) :: []))))))))))))))))))))))
;;

let allocationexecs_to_string (d)  =
    ""
;;

let allocationexecs_to_json (x)  : json =
    assoc_filter_nulls (("NoExecs",int_opt_to_json x.f_AllocationExecs_NoExecs) :: (("LastShares",float_6_opt_to_json x.f_AllocationExecs_LastShares) :: (("ExecID",string_opt_to_json x.f_AllocationExecs_ExecID) :: (("LastPx",float_4_opt_to_json x.f_AllocationExecs_LastPx) :: (("LastCapacity",lastcapacity_opt_to_json x.f_AllocationExecs_LastCapacity) :: [])))))
;;

let legsecaltidgrp_to_string (d)  =
    ""
;;

let legsecaltidgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoLegSecurityAltID",int_opt_to_json x.f_LegSecAltIDGrp_NoLegSecurityAltID) :: (("LegSecurityAltID",string_opt_to_json x.f_LegSecAltIDGrp_LegSecurityAltID) :: (("LegSecurityAltIDSource",string_opt_to_json x.f_LegSecAltIDGrp_LegSecurityAltIDSource) :: [])))
;;

let attrbgrp_to_string (d)  =
    ""
;;

let attrbgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoInstrAttrib",int_opt_to_json x.f_AttrbGrp_NoInstrAttrib) :: (("InstrAttribType",instrattribtype_opt_to_json x.f_AttrbGrp_InstrAttribType) :: (("InstrAttribValue",string_opt_to_json x.f_AttrbGrp_InstrAttribValue) :: [])))
;;

let trdregtimestamps_to_string (d)  =
    ""
;;

let trdregtimestamps_to_json (x)  : json =
    assoc_filter_nulls (("NoTrdRegTimestamps",int_opt_to_json x.f_TrdRegTimestamps_NoTrdRegTimestamps) :: (("TrdRegTimestamp",utctimestamp_opt_to_json x.f_TrdRegTimestamps_TrdRegTimestamp) :: (("TrdRegTimestampType",trdregtimestamptype_opt_to_json x.f_TrdRegTimestamps_TrdRegTimestampType) :: (("TrdRegTimestampOrigin",string_opt_to_json x.f_TrdRegTimestamps_TrdRegTimestampOrigin) :: []))))
;;

let emailroutingids_to_string (d)  =
    ""
;;

let emailroutingids_to_json (x)  : json =
    assoc_filter_nulls (("NoRoutingIDs",int_opt_to_json x.f_EmailRoutingIDs_NoRoutingIDs) :: (("RoutingType",routingtype_opt_to_json x.f_EmailRoutingIDs_RoutingType) :: (("RoutingID",string_opt_to_json x.f_EmailRoutingIDs_RoutingID) :: [])))
;;

let emailrelatedsym_to_string (d)  =
    ""
;;

let emailrelatedsym_to_json (x)  : json =
    assoc_filter_nulls (("NoRelatedSym",int_opt_to_json x.f_EmailRelatedSym_NoRelatedSym) :: (("RelatdSym",string_opt_to_json x.f_EmailRelatedSym_RelatdSym) :: (("SymbolSfx",string_opt_to_json x.f_EmailRelatedSym_SymbolSfx) :: (("SecurityID",string_opt_to_json x.f_EmailRelatedSym_SecurityID) :: (("IDSource",idsource_opt_to_json x.f_EmailRelatedSym_IDSource) :: (("SecurityType",securitytype_opt_to_json x.f_EmailRelatedSym_SecurityType) :: (("MaturityMonthYear",monthyear_opt_to_json x.f_EmailRelatedSym_MaturityMonthYear) :: (("MaturityDay",int_opt_to_json x.f_EmailRelatedSym_MaturityDay) :: (("PutOrCall",putorcall_opt_to_json x.f_EmailRelatedSym_PutOrCall) :: (("StrikePrice",float_4_opt_to_json x.f_EmailRelatedSym_StrikePrice) :: (("OptAttribute",char_opt_to_json x.f_EmailRelatedSym_OptAttribute) :: (("ContractMultiplier",float_opt_to_json x.f_EmailRelatedSym_ContractMultiplier) :: (("CouponRate",float_opt_to_json x.f_EmailRelatedSym_CouponRate) :: (("SecurityExchange",exchange_opt_to_json x.f_EmailRelatedSym_SecurityExchange) :: (("Issuer",string_opt_to_json x.f_EmailRelatedSym_Issuer) :: (("EncodedIssuerLen",int_opt_to_json x.f_EmailRelatedSym_EncodedIssuerLen) :: (("EncodedIssuer",string_opt_to_json x.f_EmailRelatedSym_EncodedIssuer) :: (("SecurityDesc",string_opt_to_json x.f_EmailRelatedSym_SecurityDesc) :: (("EncodedSecurityDescLen",int_opt_to_json x.f_EmailRelatedSym_EncodedSecurityDescLen) :: (("EncodedSecurityDesc",string_opt_to_json x.f_EmailRelatedSym_EncodedSecurityDesc) :: []))))))))))))))))))))
;;

let bidresponsebidcomponents_to_string (d)  =
    ""
;;

let bidresponsebidcomponents_to_json (x)  : json =
    assoc_filter_nulls (("NoBidComponents",int_opt_to_json x.f_BidResponseBidComponents_NoBidComponents) :: (("Commission",float_6_opt_to_json x.f_BidResponseBidComponents_Commission) :: (("CommType",commtype_opt_to_json x.f_BidResponseBidComponents_CommType) :: (("ListID",string_opt_to_json x.f_BidResponseBidComponents_ListID) :: (("Country",string_opt_to_json x.f_BidResponseBidComponents_Country) :: (("Side",side_opt_to_json x.f_BidResponseBidComponents_Side) :: (("Price",float_4_opt_to_json x.f_BidResponseBidComponents_Price) :: (("PriceType",pricetype_opt_to_json x.f_BidResponseBidComponents_PriceType) :: (("FairValue",float_6_opt_to_json x.f_BidResponseBidComponents_FairValue) :: (("NetGrossInd",netgrossind_opt_to_json x.f_BidResponseBidComponents_NetGrossInd) :: (("SettlmntTyp",settlmnttyp_opt_to_json x.f_BidResponseBidComponents_SettlmntTyp) :: (("FutSettDate",localmktdate_opt_to_json x.f_BidResponseBidComponents_FutSettDate) :: (("TradingSessionID",string_opt_to_json x.f_BidResponseBidComponents_TradingSessionID) :: (("Text",string_opt_to_json x.f_BidResponseBidComponents_Text) :: (("EncodedTextLen",int_opt_to_json x.f_BidResponseBidComponents_EncodedTextLen) :: (("EncodedText",string_opt_to_json x.f_BidResponseBidComponents_EncodedText) :: []))))))))))))))))
;;

let securitydefinitionrequestrelatedsym_to_string (d)  =
    ""
;;

let securitydefinitionrequestrelatedsym_to_json (x)  : json =
    assoc_filter_nulls (("NoRelatedSym",int_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_NoRelatedSym) :: (("UnderlyingSymbol",string_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingSymbol) :: (("UnderlyingSymbolSfx",string_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingSymbolSfx) :: (("UnderlyingSecurityID",string_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingSecurityID) :: (("UnderlyingIDSource",string_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingIDSource) :: (("UnderlyingSecurityType",string_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingSecurityType) :: (("UnderlyingMaturityMonthYear",monthyear_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingMaturityMonthYear) :: (("UnderlyingMaturityDay",int_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingMaturityDay) :: (("UnderlyingPutOrCall",int_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingPutOrCall) :: (("UnderlyingStrikePrice",float_4_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingStrikePrice) :: (("UnderlyingOptAttribute",char_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingOptAttribute) :: (("UnderlyingContractMultiplier",float_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingContractMultiplier) :: (("UnderlyingCouponRate",float_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingCouponRate) :: (("UnderlyingSecurityExchange",exchange_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingSecurityExchange) :: (("UnderlyingIssuer",string_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingIssuer) :: (("EncodedUnderlyingIssuerLen",int_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_EncodedUnderlyingIssuerLen) :: (("EncodedUnderlyingIssuer",string_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_EncodedUnderlyingIssuer) :: (("UnderlyingSecurityDesc",string_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingSecurityDesc) :: (("EncodedUnderlyingSecurityDescLen",int_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_EncodedUnderlyingSecurityDescLen) :: (("EncodedUnderlyingSecurityDesc",string_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_EncodedUnderlyingSecurityDesc) :: (("RatioQty",float_6_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_RatioQty) :: (("Side",side_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_Side) :: (("UnderlyingCurrency",currency_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingCurrency) :: [])))))))))))))))))))))))
;;

let ordersingletradingsessions_to_string (d)  =
    ""
;;

let ordersingletradingsessions_to_json (x)  : json =
    assoc_filter_nulls (("NoTradingSessions",int_opt_to_json x.f_OrderSingleTradingSessions_NoTradingSessions) :: (("TradingSessionID",string_opt_to_json x.f_OrderSingleTradingSessions_TradingSessionID) :: []))
;;

let nstdptys2subgrp_to_string (d)  =
    ""
;;

let nstdptys2subgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoNested2PartySubIDs",int_opt_to_json x.f_NstdPtys2SubGrp_NoNested2PartySubIDs) :: (("Nested2PartySubID",string_opt_to_json x.f_NstdPtys2SubGrp_Nested2PartySubID) :: (("Nested2PartySubIDType",int_opt_to_json x.f_NstdPtys2SubGrp_Nested2PartySubIDType) :: [])))
;;

let ioiroutingids_to_string (d)  =
    ""
;;

let ioiroutingids_to_json (x)  : json =
    assoc_filter_nulls (("NoRoutingIDs",int_opt_to_json x.f_IOIRoutingIDs_NoRoutingIDs) :: (("RoutingType",routingtype_opt_to_json x.f_IOIRoutingIDs_RoutingType) :: (("RoutingID",string_opt_to_json x.f_IOIRoutingIDs_RoutingID) :: [])))
;;

let legstipulations_to_string (d)  =
    ""
;;

let legstipulations_to_json (x)  : json =
    assoc_filter_nulls (("NoLegStipulations",int_opt_to_json x.f_LegStipulations_NoLegStipulations) :: (("LegStipulationType",string_opt_to_json x.f_LegStipulations_LegStipulationType) :: (("LegStipulationValue",string_opt_to_json x.f_LegStipulations_LegStipulationValue) :: [])))
;;

let cpctyconfgrp_to_string (d)  =
    ""
;;

let cpctyconfgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoCapacities",int_opt_to_json x.f_CpctyConfGrp_NoCapacities) :: (("OrderCapacity",ordercapacity_opt_to_json x.f_CpctyConfGrp_OrderCapacity) :: (("OrderRestrictions",orderrestrictions_opt_to_json x.f_CpctyConfGrp_OrderRestrictions) :: (("OrderCapacityQty",float_6_opt_to_json x.f_CpctyConfGrp_OrderCapacityQty) :: []))))
;;

let biddescreqgrp_to_string (d)  =
    ""
;;

let biddescreqgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoBidDescriptors",int_opt_to_json x.f_BidDescReqGrp_NoBidDescriptors) :: (("BidDescriptorType",biddescriptortype_opt_to_json x.f_BidDescReqGrp_BidDescriptorType) :: (("BidDescriptor",string_opt_to_json x.f_BidDescReqGrp_BidDescriptor) :: (("SideValueInd",sidevalueind_opt_to_json x.f_BidDescReqGrp_SideValueInd) :: (("LiquidityValue",float_6_opt_to_json x.f_BidDescReqGrp_LiquidityValue) :: (("LiquidityNumSecurities",int_opt_to_json x.f_BidDescReqGrp_LiquidityNumSecurities) :: (("LiquidityPctLow",float_6_opt_to_json x.f_BidDescReqGrp_LiquidityPctLow) :: (("LiquidityPctHigh",float_6_opt_to_json x.f_BidDescReqGrp_LiquidityPctHigh) :: (("EFPTrackingError",float_6_opt_to_json x.f_BidDescReqGrp_EFPTrackingError) :: (("FairValue",float_6_opt_to_json x.f_BidDescReqGrp_FairValue) :: (("OutsideIndexPct",float_6_opt_to_json x.f_BidDescReqGrp_OutsideIndexPct) :: (("ValueOfFutures",float_6_opt_to_json x.f_BidDescReqGrp_ValueOfFutures) :: []))))))))))))
;;

let ptyssubgrp_to_string (d)  =
    ""
;;

let ptyssubgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoPartySubIDs",int_opt_to_json x.f_PtysSubGrp_NoPartySubIDs) :: (("PartySubID",string_opt_to_json x.f_PtysSubGrp_PartySubID) :: (("PartySubIDType",partysubidtype_opt_to_json x.f_PtysSubGrp_PartySubIDType) :: [])))
;;

let peginstructions_to_string (d)  =
    ""
;;

let peginstructions_to_json (x)  : json =
    assoc_filter_nulls (("PegOffsetValue",float_opt_to_json x.f_PegInstructions_PegOffsetValue) :: (("PegMoveType",pegmovetype_opt_to_json x.f_PegInstructions_PegMoveType) :: (("PegOffsetType",pegoffsettype_opt_to_json x.f_PegInstructions_PegOffsetType) :: (("PegLimitType",peglimittype_opt_to_json x.f_PegInstructions_PegLimitType) :: (("PegRoundDirection",pegrounddirection_opt_to_json x.f_PegInstructions_PegRoundDirection) :: (("PegScope",pegscope_opt_to_json x.f_PegInstructions_PegScope) :: []))))))
;;

let mdfullgrp_to_string (d)  =
    ""
;;

let mdfullgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoMDEntries",int_opt_to_json x.f_MDFullGrp_NoMDEntries) :: (("MDEntryType",mdentrytype_opt_to_json x.f_MDFullGrp_MDEntryType) :: (("MDEntryPx",float_4_opt_to_json x.f_MDFullGrp_MDEntryPx) :: (("Currency",currency_opt_to_json x.f_MDFullGrp_Currency) :: (("MDEntrySize",float_6_opt_to_json x.f_MDFullGrp_MDEntrySize) :: (("MDEntryDate",utcdateonly_opt_to_json x.f_MDFullGrp_MDEntryDate) :: (("MDEntryTime",utctimeonly_opt_to_json x.f_MDFullGrp_MDEntryTime) :: (("TickDirection",tickdirection_opt_to_json x.f_MDFullGrp_TickDirection) :: (("MDMkt",exchange_opt_to_json x.f_MDFullGrp_MDMkt) :: (("TradingSessionID",string_opt_to_json x.f_MDFullGrp_TradingSessionID) :: (("TradingSessionSubID",string_opt_to_json x.f_MDFullGrp_TradingSessionSubID) :: (("QuoteCondition",quotecondition_opt_to_json x.f_MDFullGrp_QuoteCondition) :: (("TradeCondition",tradecondition_opt_to_json x.f_MDFullGrp_TradeCondition) :: (("MDEntryOriginator",string_opt_to_json x.f_MDFullGrp_MDEntryOriginator) :: (("LocationID",string_opt_to_json x.f_MDFullGrp_LocationID) :: (("DeskID",string_opt_to_json x.f_MDFullGrp_DeskID) :: (("OpenCloseSettlFlag",openclosesettlflag_opt_to_json x.f_MDFullGrp_OpenCloseSettlFlag) :: (("TimeInForce",timeinforce_opt_to_json x.f_MDFullGrp_TimeInForce) :: (("ExpireDate",localmktdate_opt_to_json x.f_MDFullGrp_ExpireDate) :: (("ExpireTime",utctimestamp_opt_to_json x.f_MDFullGrp_ExpireTime) :: (("MinQty",float_6_opt_to_json x.f_MDFullGrp_MinQty) :: (("ExecInst",execinst_opt_to_json x.f_MDFullGrp_ExecInst) :: (("SellerDays",int_opt_to_json x.f_MDFullGrp_SellerDays) :: (("OrderID",string_opt_to_json x.f_MDFullGrp_OrderID) :: (("QuoteEntryID",string_opt_to_json x.f_MDFullGrp_QuoteEntryID) :: (("MDEntryBuyer",string_opt_to_json x.f_MDFullGrp_MDEntryBuyer) :: (("MDEntrySeller",string_opt_to_json x.f_MDFullGrp_MDEntrySeller) :: (("NumberOfOrders",int_opt_to_json x.f_MDFullGrp_NumberOfOrders) :: (("MDEntryPositionNo",int_opt_to_json x.f_MDFullGrp_MDEntryPositionNo) :: (("Scope",scope_opt_to_json x.f_MDFullGrp_Scope) :: (("PriceDelta",float_opt_to_json x.f_MDFullGrp_PriceDelta) :: (("Text",string_opt_to_json x.f_MDFullGrp_Text) :: (("EncodedTextLen",int_opt_to_json x.f_MDFullGrp_EncodedTextLen) :: (("EncodedText",string_opt_to_json x.f_MDFullGrp_EncodedText) :: []))))))))))))))))))))))))))))))))))
;;

let allocationallocs_to_string (d)  =
    ""
;;

let allocationallocs_to_json (x)  : json =
    assoc_filter_nulls (("NoAllocs",int_opt_to_json x.f_AllocationAllocs_NoAllocs) :: (("AllocAccount",string_opt_to_json x.f_AllocationAllocs_AllocAccount) :: (("AllocPrice",float_4_opt_to_json x.f_AllocationAllocs_AllocPrice) :: (("AllocShares",float_6_opt_to_json x.f_AllocationAllocs_AllocShares) :: (("ProcessCode",processcode_opt_to_json x.f_AllocationAllocs_ProcessCode) :: (("BrokerOfCredit",string_opt_to_json x.f_AllocationAllocs_BrokerOfCredit) :: (("NotifyBrokerOfCredit",notifybrokerofcredit_opt_to_json x.f_AllocationAllocs_NotifyBrokerOfCredit) :: (("AllocHandlInst",allochandlinst_opt_to_json x.f_AllocationAllocs_AllocHandlInst) :: (("AllocText",string_opt_to_json x.f_AllocationAllocs_AllocText) :: (("EncodedAllocTextLen",int_opt_to_json x.f_AllocationAllocs_EncodedAllocTextLen) :: (("EncodedAllocText",string_opt_to_json x.f_AllocationAllocs_EncodedAllocText) :: (("ExecBroker",string_opt_to_json x.f_AllocationAllocs_ExecBroker) :: (("ClientID",string_opt_to_json x.f_AllocationAllocs_ClientID) :: (("Commission",float_6_opt_to_json x.f_AllocationAllocs_Commission) :: (("CommType",commtype_opt_to_json x.f_AllocationAllocs_CommType) :: (("AllocAvgPx",float_4_opt_to_json x.f_AllocationAllocs_AllocAvgPx) :: (("AllocNetMoney",float_6_opt_to_json x.f_AllocationAllocs_AllocNetMoney) :: (("SettlCurrAmt",float_6_opt_to_json x.f_AllocationAllocs_SettlCurrAmt) :: (("SettlCurrency",currency_opt_to_json x.f_AllocationAllocs_SettlCurrency) :: (("SettlCurrFxRate",float_opt_to_json x.f_AllocationAllocs_SettlCurrFxRate) :: (("SettlCurrFxRateCalc",char_opt_to_json x.f_AllocationAllocs_SettlCurrFxRateCalc) :: (("AccruedInterestAmt",float_6_opt_to_json x.f_AllocationAllocs_AccruedInterestAmt) :: (("SettlInstMode",settlinstmode_opt_to_json x.f_AllocationAllocs_SettlInstMode) :: [])))))))))))))))))))))))
;;

let allocationorders_to_string (d)  =
    ""
;;

let allocationorders_to_json (x)  : json =
    assoc_filter_nulls (("NoOrders",int_opt_to_json x.f_AllocationOrders_NoOrders) :: (("ClOrdID",string_opt_to_json x.f_AllocationOrders_ClOrdID) :: (("OrderID",string_opt_to_json x.f_AllocationOrders_OrderID) :: (("SecondaryOrderID",string_opt_to_json x.f_AllocationOrders_SecondaryOrderID) :: (("ListID",string_opt_to_json x.f_AllocationOrders_ListID) :: (("WaveNo",string_opt_to_json x.f_AllocationOrders_WaveNo) :: []))))))
;;

let newsroutingids_to_string (d)  =
    ""
;;

let newsroutingids_to_json (x)  : json =
    assoc_filter_nulls (("NoRoutingIDs",int_opt_to_json x.f_NewsRoutingIDs_NoRoutingIDs) :: (("RoutingType",routingtype_opt_to_json x.f_NewsRoutingIDs_RoutingType) :: (("RoutingID",string_opt_to_json x.f_NewsRoutingIDs_RoutingID) :: [])))
;;

let positionamountdata_to_string (d)  =
    ""
;;

let positionamountdata_to_json (x)  : json =
    assoc_filter_nulls (("NoPosAmt",int_opt_to_json x.f_PositionAmountData_NoPosAmt) :: (("PosAmtType",posamttype_opt_to_json x.f_PositionAmountData_PosAmtType) :: (("PosAmt",float_6_opt_to_json x.f_PositionAmountData_PosAmt) :: [])))
;;

let nstdptyssubgrp_to_string (d)  =
    ""
;;

let nstdptyssubgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoNestedPartySubIDs",int_opt_to_json x.f_NstdPtysSubGrp_NoNestedPartySubIDs) :: (("NestedPartySubID",string_opt_to_json x.f_NstdPtysSubGrp_NestedPartySubID) :: (("NestedPartySubIDType",int_opt_to_json x.f_NstdPtysSubGrp_NestedPartySubIDType) :: [])))
;;

let liststatusorders_to_string (d)  =
    ""
;;

let liststatusorders_to_json (x)  : json =
    assoc_filter_nulls (("NoOrders",int_opt_to_json x.f_ListStatusOrders_NoOrders) :: (("ClOrdID",string_opt_to_json x.f_ListStatusOrders_ClOrdID) :: (("CumQty",float_6_opt_to_json x.f_ListStatusOrders_CumQty) :: (("OrdStatus",ordstatus_opt_to_json x.f_ListStatusOrders_OrdStatus) :: (("LeavesQty",float_6_opt_to_json x.f_ListStatusOrders_LeavesQty) :: (("CxlQty",float_6_opt_to_json x.f_ListStatusOrders_CxlQty) :: (("AvgPx",float_4_opt_to_json x.f_ListStatusOrders_AvgPx) :: (("OrdRejReason",ordrejreason_opt_to_json x.f_ListStatusOrders_OrdRejReason) :: (("Text",string_opt_to_json x.f_ListStatusOrders_Text) :: (("EncodedTextLen",int_opt_to_json x.f_ListStatusOrders_EncodedTextLen) :: (("EncodedText",string_opt_to_json x.f_ListStatusOrders_EncodedText) :: [])))))))))))
;;

let massquotequoteentries_to_string (d)  =
    ""
;;

let massquotequoteentries_to_json (x)  : json =
    assoc_filter_nulls (("NoQuoteEntries",int_opt_to_json x.f_MassQuoteQuoteEntries_NoQuoteEntries) :: (("QuoteEntryID",string_opt_to_json x.f_MassQuoteQuoteEntries_QuoteEntryID) :: (("Symbol",string_opt_to_json x.f_MassQuoteQuoteEntries_Symbol) :: (("SymbolSfx",string_opt_to_json x.f_MassQuoteQuoteEntries_SymbolSfx) :: (("SecurityID",string_opt_to_json x.f_MassQuoteQuoteEntries_SecurityID) :: (("IDSource",idsource_opt_to_json x.f_MassQuoteQuoteEntries_IDSource) :: (("SecurityType",securitytype_opt_to_json x.f_MassQuoteQuoteEntries_SecurityType) :: (("MaturityMonthYear",monthyear_opt_to_json x.f_MassQuoteQuoteEntries_MaturityMonthYear) :: (("MaturityDay",int_opt_to_json x.f_MassQuoteQuoteEntries_MaturityDay) :: (("PutOrCall",putorcall_opt_to_json x.f_MassQuoteQuoteEntries_PutOrCall) :: (("StrikePrice",float_4_opt_to_json x.f_MassQuoteQuoteEntries_StrikePrice) :: (("OptAttribute",char_opt_to_json x.f_MassQuoteQuoteEntries_OptAttribute) :: (("ContractMultiplier",float_opt_to_json x.f_MassQuoteQuoteEntries_ContractMultiplier) :: (("CouponRate",float_opt_to_json x.f_MassQuoteQuoteEntries_CouponRate) :: (("SecurityExchange",exchange_opt_to_json x.f_MassQuoteQuoteEntries_SecurityExchange) :: (("Issuer",string_opt_to_json x.f_MassQuoteQuoteEntries_Issuer) :: (("EncodedIssuerLen",int_opt_to_json x.f_MassQuoteQuoteEntries_EncodedIssuerLen) :: (("EncodedIssuer",string_opt_to_json x.f_MassQuoteQuoteEntries_EncodedIssuer) :: (("SecurityDesc",string_opt_to_json x.f_MassQuoteQuoteEntries_SecurityDesc) :: (("EncodedSecurityDescLen",int_opt_to_json x.f_MassQuoteQuoteEntries_EncodedSecurityDescLen) :: (("EncodedSecurityDesc",string_opt_to_json x.f_MassQuoteQuoteEntries_EncodedSecurityDesc) :: (("BidPx",float_4_opt_to_json x.f_MassQuoteQuoteEntries_BidPx) :: (("OfferPx",float_4_opt_to_json x.f_MassQuoteQuoteEntries_OfferPx) :: (("BidSize",float_6_opt_to_json x.f_MassQuoteQuoteEntries_BidSize) :: (("OfferSize",float_6_opt_to_json x.f_MassQuoteQuoteEntries_OfferSize) :: (("ValidUntilTime",utctimestamp_opt_to_json x.f_MassQuoteQuoteEntries_ValidUntilTime) :: (("BidSpotRate",float_4_opt_to_json x.f_MassQuoteQuoteEntries_BidSpotRate) :: (("OfferSpotRate",float_4_opt_to_json x.f_MassQuoteQuoteEntries_OfferSpotRate) :: (("BidForwardPoints",float_6_opt_to_json x.f_MassQuoteQuoteEntries_BidForwardPoints) :: (("OfferForwardPoints",float_6_opt_to_json x.f_MassQuoteQuoteEntries_OfferForwardPoints) :: (("TransactTime",utctimestamp_opt_to_json x.f_MassQuoteQuoteEntries_TransactTime) :: (("TradingSessionID",string_opt_to_json x.f_MassQuoteQuoteEntries_TradingSessionID) :: (("FutSettDate",localmktdate_opt_to_json x.f_MassQuoteQuoteEntries_FutSettDate) :: (("OrdType",ordtype_opt_to_json x.f_MassQuoteQuoteEntries_OrdType) :: (("FutSettDate2",localmktdate_opt_to_json x.f_MassQuoteQuoteEntries_FutSettDate2) :: (("OrderQty2",float_6_opt_to_json x.f_MassQuoteQuoteEntries_OrderQty2) :: (("Currency",currency_opt_to_json x.f_MassQuoteQuoteEntries_Currency) :: [])))))))))))))))))))))))))))))))))))))
;;

let quotqualgrp_to_string (d)  =
    ""
;;

let quotqualgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoQuoteQualifiers",int_opt_to_json x.f_QuotQualGrp_NoQuoteQualifiers) :: (("QuoteQualifier",char_opt_to_json x.f_QuotQualGrp_QuoteQualifier) :: []))
;;

let miscfeesgrp_to_string (d)  =
    ""
;;

let miscfeesgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoMiscFees",int_opt_to_json x.f_MiscFeesGrp_NoMiscFees) :: (("MiscFeeAmt",float_6_opt_to_json x.f_MiscFeesGrp_MiscFeeAmt) :: (("MiscFeeCurr",currency_opt_to_json x.f_MiscFeesGrp_MiscFeeCurr) :: (("MiscFeeType",miscfeetype_opt_to_json x.f_MiscFeesGrp_MiscFeeType) :: (("MiscFeeBasis",miscfeebasis_opt_to_json x.f_MiscFeesGrp_MiscFeeBasis) :: [])))))
;;

let collinqqualgrp_to_string (d)  =
    ""
;;

let collinqqualgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoCollInquiryQualifier",int_opt_to_json x.f_CollInqQualGrp_NoCollInquiryQualifier) :: (("CollInquiryQualifier",collinquiryqualifier_opt_to_json x.f_CollInqQualGrp_CollInquiryQualifier) :: []))
;;

let trdgsesgrp_to_string (d)  =
    ""
;;

let trdgsesgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoTradingSessions",int_opt_to_json x.f_TrdgSesGrp_NoTradingSessions) :: (("TradingSessionID",string_opt_to_json x.f_TrdgSesGrp_TradingSessionID) :: (("TradingSessionSubID",string_opt_to_json x.f_TrdgSesGrp_TradingSessionSubID) :: [])))
;;

let mdreqgrp_to_string (d)  =
    ""
;;

let mdreqgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoMDEntryTypes",int_opt_to_json x.f_MDReqGrp_NoMDEntryTypes) :: (("MDEntryType",mdentrytype_opt_to_json x.f_MDReqGrp_MDEntryType) :: []))
;;

let spreadorbenchmarkcurvedata_to_string (d)  =
    ""
;;

let spreadorbenchmarkcurvedata_to_json (x)  : json =
    assoc_filter_nulls (("Spread",float_6_opt_to_json x.f_SpreadOrBenchmarkCurveData_Spread) :: (("BenchmarkCurveCurrency",currency_opt_to_json x.f_SpreadOrBenchmarkCurveData_BenchmarkCurveCurrency) :: (("BenchmarkCurveName",string_opt_to_json x.f_SpreadOrBenchmarkCurveData_BenchmarkCurveName) :: (("BenchmarkCurvePoint",string_opt_to_json x.f_SpreadOrBenchmarkCurveData_BenchmarkCurvePoint) :: (("BenchmarkPrice",float_4_opt_to_json x.f_SpreadOrBenchmarkCurveData_BenchmarkPrice) :: (("BenchmarkPriceType",int_opt_to_json x.f_SpreadOrBenchmarkCurveData_BenchmarkPriceType) :: (("BenchmarkSecurityID",string_opt_to_json x.f_SpreadOrBenchmarkCurveData_BenchmarkSecurityID) :: (("BenchmarkSecurityIDSource",string_opt_to_json x.f_SpreadOrBenchmarkCurveData_BenchmarkSecurityIDSource) :: []))))))))
;;

let ordliststatgrp_to_string (d)  =
    ""
;;

let ordliststatgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoOrders",int_opt_to_json x.f_OrdListStatGrp_NoOrders) :: (("ClOrdID",string_opt_to_json x.f_OrdListStatGrp_ClOrdID) :: (("SecondaryClOrdID",string_opt_to_json x.f_OrdListStatGrp_SecondaryClOrdID) :: (("CumQty",float_6_opt_to_json x.f_OrdListStatGrp_CumQty) :: (("OrdStatus",ordstatus_opt_to_json x.f_OrdListStatGrp_OrdStatus) :: (("WorkingIndicator",workingindicator_opt_to_json x.f_OrdListStatGrp_WorkingIndicator) :: (("LeavesQty",float_6_opt_to_json x.f_OrdListStatGrp_LeavesQty) :: (("CxlQty",float_6_opt_to_json x.f_OrdListStatGrp_CxlQty) :: (("AvgPx",float_4_opt_to_json x.f_OrdListStatGrp_AvgPx) :: (("OrdRejReason",ordrejreason_opt_to_json x.f_OrdListStatGrp_OrdRejReason) :: (("Text",string_opt_to_json x.f_OrdListStatGrp_Text) :: (("EncodedTextLen",int_opt_to_json x.f_OrdListStatGrp_EncodedTextLen) :: (("EncodedText",string_opt_to_json x.f_OrdListStatGrp_EncodedText) :: [])))))))))))))
;;

let execcollgrp_to_string (d)  =
    ""
;;

let execcollgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoExecs",int_opt_to_json x.f_ExecCollGrp_NoExecs) :: (("ExecID",string_opt_to_json x.f_ExecCollGrp_ExecID) :: []))
;;

let compidstatgrp_to_string (d)  =
    ""
;;

let compidstatgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoCompIDs",int_opt_to_json x.f_CompIDStatGrp_NoCompIDs) :: (("RefCompID",string_opt_to_json x.f_CompIDStatGrp_RefCompID) :: (("RefSubID",string_opt_to_json x.f_CompIDStatGrp_RefSubID) :: (("LocationID",string_opt_to_json x.f_CompIDStatGrp_LocationID) :: (("DeskID",string_opt_to_json x.f_CompIDStatGrp_DeskID) :: (("StatusValue",statusvalue_opt_to_json x.f_CompIDStatGrp_StatusValue) :: (("StatusText",string_opt_to_json x.f_CompIDStatGrp_StatusText) :: [])))))))
;;

let trdcollgrp_to_string (d)  =
    ""
;;

let trdcollgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoTrades",int_opt_to_json x.f_TrdCollGrp_NoTrades) :: (("TradeReportID",string_opt_to_json x.f_TrdCollGrp_TradeReportID) :: (("SecondaryTradeReportID",string_opt_to_json x.f_TrdCollGrp_SecondaryTradeReportID) :: [])))
;;

let bidrequestbidcomponents_to_string (d)  =
    ""
;;

let bidrequestbidcomponents_to_json (x)  : json =
    assoc_filter_nulls (("NoBidComponents",int_opt_to_json x.f_BidRequestBidComponents_NoBidComponents) :: (("ListID",string_opt_to_json x.f_BidRequestBidComponents_ListID) :: (("Side",side_opt_to_json x.f_BidRequestBidComponents_Side) :: (("TradingSessionID",string_opt_to_json x.f_BidRequestBidComponents_TradingSessionID) :: (("NetGrossInd",netgrossind_opt_to_json x.f_BidRequestBidComponents_NetGrossInd) :: (("SettlmntTyp",settlmnttyp_opt_to_json x.f_BidRequestBidComponents_SettlmntTyp) :: (("FutSettDate",localmktdate_opt_to_json x.f_BidRequestBidComponents_FutSettDate) :: (("Account",string_opt_to_json x.f_BidRequestBidComponents_Account) :: []))))))))
;;

let liststrikepricestrikes_to_string (d)  =
    ""
;;

let liststrikepricestrikes_to_json (x)  : json =
    assoc_filter_nulls (("NoStrikes",int_opt_to_json x.f_ListStrikePriceStrikes_NoStrikes) :: (("Symbol",string_opt_to_json x.f_ListStrikePriceStrikes_Symbol) :: (("SymbolSfx",string_opt_to_json x.f_ListStrikePriceStrikes_SymbolSfx) :: (("SecurityID",string_opt_to_json x.f_ListStrikePriceStrikes_SecurityID) :: (("IDSource",idsource_opt_to_json x.f_ListStrikePriceStrikes_IDSource) :: (("SecurityType",securitytype_opt_to_json x.f_ListStrikePriceStrikes_SecurityType) :: (("MaturityMonthYear",monthyear_opt_to_json x.f_ListStrikePriceStrikes_MaturityMonthYear) :: (("MaturityDay",int_opt_to_json x.f_ListStrikePriceStrikes_MaturityDay) :: (("PutOrCall",putorcall_opt_to_json x.f_ListStrikePriceStrikes_PutOrCall) :: (("StrikePrice",float_4_opt_to_json x.f_ListStrikePriceStrikes_StrikePrice) :: (("OptAttribute",char_opt_to_json x.f_ListStrikePriceStrikes_OptAttribute) :: (("ContractMultiplier",float_opt_to_json x.f_ListStrikePriceStrikes_ContractMultiplier) :: (("CouponRate",float_opt_to_json x.f_ListStrikePriceStrikes_CouponRate) :: (("SecurityExchange",exchange_opt_to_json x.f_ListStrikePriceStrikes_SecurityExchange) :: (("Issuer",string_opt_to_json x.f_ListStrikePriceStrikes_Issuer) :: (("EncodedIssuerLen",int_opt_to_json x.f_ListStrikePriceStrikes_EncodedIssuerLen) :: (("EncodedIssuer",string_opt_to_json x.f_ListStrikePriceStrikes_EncodedIssuer) :: (("SecurityDesc",string_opt_to_json x.f_ListStrikePriceStrikes_SecurityDesc) :: (("EncodedSecurityDescLen",int_opt_to_json x.f_ListStrikePriceStrikes_EncodedSecurityDescLen) :: (("EncodedSecurityDesc",string_opt_to_json x.f_ListStrikePriceStrikes_EncodedSecurityDesc) :: (("PrevClosePx",float_4_opt_to_json x.f_ListStrikePriceStrikes_PrevClosePx) :: (("ClOrdID",string_opt_to_json x.f_ListStrikePriceStrikes_ClOrdID) :: (("Side",side_opt_to_json x.f_ListStrikePriceStrikes_Side) :: (("Price",float_4_opt_to_json x.f_ListStrikePriceStrikes_Price) :: (("Currency",currency_opt_to_json x.f_ListStrikePriceStrikes_Currency) :: (("Text",string_opt_to_json x.f_ListStrikePriceStrikes_Text) :: (("EncodedTextLen",int_opt_to_json x.f_ListStrikePriceStrikes_EncodedTextLen) :: (("EncodedText",string_opt_to_json x.f_ListStrikePriceStrikes_EncodedText) :: []))))))))))))))))))))))))))))
;;

let orderlistallocs_to_string (d)  =
    ""
;;

let orderlistallocs_to_json (x)  : json =
    assoc_filter_nulls (("NoAllocs",int_opt_to_json x.f_OrderListAllocs_NoAllocs) :: (("AllocAccount",string_opt_to_json x.f_OrderListAllocs_AllocAccount) :: (("AllocShares",float_6_opt_to_json x.f_OrderListAllocs_AllocShares) :: [])))
;;

let ioiioiqualifiers_to_string (d)  =
    ""
;;

let ioiioiqualifiers_to_json (x)  : json =
    assoc_filter_nulls (("NoIOIQualifiers",int_opt_to_json x.f_IOIIOIQualifiers_NoIOIQualifiers) :: (("IOIQualifier",ioiqualifier_opt_to_json x.f_IOIIOIQualifiers_IOIQualifier) :: []))
;;

let undsecaltidgrp_to_string (d)  =
    ""
;;

let undsecaltidgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoUnderlyingSecurityAltID",int_opt_to_json x.f_UndSecAltIDGrp_NoUnderlyingSecurityAltID) :: (("UnderlyingSecurityAltID",string_opt_to_json x.f_UndSecAltIDGrp_UnderlyingSecurityAltID) :: (("UnderlyingSecurityAltIDSource",string_opt_to_json x.f_UndSecAltIDGrp_UnderlyingSecurityAltIDSource) :: [])))
;;

let interval_to_string (d)  =
    ""
;;

let interval_to_json (x)  : json =
    assoc_filter_nulls (("start_time",utctimestamp_opt_to_json x.f_interval_start_time) :: (("duration",duration_opt_to_json x.f_interval_duration) :: []))
;;

let sectypesgrp_to_string (d)  =
    ""
;;

let sectypesgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoSecurityTypes",int_opt_to_json x.f_SecTypesGrp_NoSecurityTypes) :: (("SecurityType",securitytype_opt_to_json x.f_SecTypesGrp_SecurityType) :: (("SecuritySubType",string_opt_to_json x.f_SecTypesGrp_SecuritySubType) :: (("Product",product_opt_to_json x.f_SecTypesGrp_Product) :: (("CFICode",string_opt_to_json x.f_SecTypesGrp_CFICode) :: [])))))
;;

let compidreqgrp_to_string (d)  =
    ""
;;

let compidreqgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoCompIDs",int_opt_to_json x.f_CompIDReqGrp_NoCompIDs) :: (("RefCompID",string_opt_to_json x.f_CompIDReqGrp_RefCompID) :: (("RefSubID",string_opt_to_json x.f_CompIDReqGrp_RefSubID) :: (("LocationID",string_opt_to_json x.f_CompIDReqGrp_LocationID) :: (("DeskID",string_opt_to_json x.f_CompIDReqGrp_DeskID) :: [])))))
;;

let ordercancelreplacerequesttradingsessions_to_string (d)  =
    ""
;;

let ordercancelreplacerequesttradingsessions_to_json (x)  : json =
    assoc_filter_nulls (("NoTradingSessions",int_opt_to_json x.f_OrderCancelReplaceRequestTradingSessions_NoTradingSessions) :: (("TradingSessionID",string_opt_to_json x.f_OrderCancelReplaceRequestTradingSessions_TradingSessionID) :: []))
;;

let orderlisttradingsessions_to_string (d)  =
    ""
;;

let orderlisttradingsessions_to_json (x)  : json =
    assoc_filter_nulls (("NoTradingSessions",int_opt_to_json x.f_OrderListTradingSessions_NoTradingSessions) :: (("TradingSessionID",string_opt_to_json x.f_OrderListTradingSessions_TradingSessionID) :: []))
;;

let bidrequestbiddescriptors_to_string (d)  =
    ""
;;

let bidrequestbiddescriptors_to_json (x)  : json =
    assoc_filter_nulls (("NoBidDescriptors",int_opt_to_json x.f_BidRequestBidDescriptors_NoBidDescriptors) :: (("BidDescriptorType",int_opt_to_json x.f_BidRequestBidDescriptors_BidDescriptorType) :: (("BidDescriptor",string_opt_to_json x.f_BidRequestBidDescriptors_BidDescriptor) :: (("SideValueInd",int_opt_to_json x.f_BidRequestBidDescriptors_SideValueInd) :: (("LiquidityValue",float_6_opt_to_json x.f_BidRequestBidDescriptors_LiquidityValue) :: (("LiquidityNumSecurities",int_opt_to_json x.f_BidRequestBidDescriptors_LiquidityNumSecurities) :: (("LiquidityPctLow",float_opt_to_json x.f_BidRequestBidDescriptors_LiquidityPctLow) :: (("LiquidityPctHigh",float_opt_to_json x.f_BidRequestBidDescriptors_LiquidityPctHigh) :: (("EFPTrackingError",float_opt_to_json x.f_BidRequestBidDescriptors_EFPTrackingError) :: (("FairValue",float_6_opt_to_json x.f_BidRequestBidDescriptors_FairValue) :: (("OutsideIndexPct",float_opt_to_json x.f_BidRequestBidDescriptors_OutsideIndexPct) :: (("ValueOfFutures",float_6_opt_to_json x.f_BidRequestBidDescriptors_ValueOfFutures) :: []))))))))))))
;;

let orderqtydata_to_string (d)  =
    ""
;;

let orderqtydata_to_json (x)  : json =
    assoc_filter_nulls (("OrderQty",float_6_opt_to_json x.f_OrderQtyData_OrderQty) :: (("CashOrderQty",float_6_opt_to_json x.f_OrderQtyData_CashOrderQty) :: (("OrderPercent",float_6_opt_to_json x.f_OrderQtyData_OrderPercent) :: (("RoundingDirection",roundingdirection_opt_to_json x.f_OrderQtyData_RoundingDirection) :: (("RoundingModulus",float_opt_to_json x.f_OrderQtyData_RoundingModulus) :: [])))))
;;

let nstdptys3subgrp_to_string (d)  =
    ""
;;

let nstdptys3subgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoNested3PartySubIDs",int_opt_to_json x.f_NstdPtys3SubGrp_NoNested3PartySubIDs) :: (("Nested3PartySubID",string_opt_to_json x.f_NstdPtys3SubGrp_Nested3PartySubID) :: (("Nested3PartySubIDType",int_opt_to_json x.f_NstdPtys3SubGrp_Nested3PartySubIDType) :: [])))
;;

let nestedparties3_to_string (d)  =
    ""
;;

let nestedparties3_to_json (x)  : json =
    assoc_filter_nulls (("NoNested3PartyIDs",int_opt_to_json x.f_NestedParties3_NoNested3PartyIDs) :: (("Nested3PartyID",string_opt_to_json x.f_NestedParties3_Nested3PartyID) :: (("Nested3PartyIDSource",char_opt_to_json x.f_NestedParties3_Nested3PartyIDSource) :: (("Nested3PartyRole",int_opt_to_json x.f_NestedParties3_Nested3PartyRole) :: (("NstdPtys3SubGrp",rg_for_json nstdptys3subgrp_to_json x.f_NestedParties3_NstdPtys3SubGrp) :: [])))))
;;

let nestedparties_to_string (d)  =
    ""
;;

let nestedparties_to_json (x)  : json =
    assoc_filter_nulls (("NoNestedPartyIDs",int_opt_to_json x.f_NestedParties_NoNestedPartyIDs) :: (("NestedPartyID",string_opt_to_json x.f_NestedParties_NestedPartyID) :: (("NestedPartyIDSource",char_opt_to_json x.f_NestedParties_NestedPartyIDSource) :: (("NestedPartyRole",int_opt_to_json x.f_NestedParties_NestedPartyRole) :: (("NstdPtysSubGrp",rg_for_json nstdptyssubgrp_to_json x.f_NestedParties_NstdPtysSubGrp) :: [])))))
;;

let parties_to_string (d)  =
    ""
;;

let parties_to_json (x)  : json =
    assoc_filter_nulls (("NoPartyIDs",int_opt_to_json x.f_Parties_NoPartyIDs) :: (("PartyID",string_opt_to_json x.f_Parties_PartyID) :: (("PartyIDSource",partyidsource_opt_to_json x.f_Parties_PartyIDSource) :: (("PartyRole",partyrole_opt_to_json x.f_Parties_PartyRole) :: (("PartyRoleQualifier",partyrolequalifier_opt_to_json x.f_Parties_PartyRoleQualifier) :: (("PtysSubGrp",rg_for_json ptyssubgrp_to_json x.f_Parties_PtysSubGrp) :: []))))))
;;

let nestedparties2_to_string (d)  =
    ""
;;

let nestedparties2_to_json (x)  : json =
    assoc_filter_nulls (("NoNested2PartyIDs",int_opt_to_json x.f_NestedParties2_NoNested2PartyIDs) :: (("Nested2PartyID",string_opt_to_json x.f_NestedParties2_Nested2PartyID) :: (("Nested2PartyIDSource",char_opt_to_json x.f_NestedParties2_Nested2PartyIDSource) :: (("Nested2PartyRole",int_opt_to_json x.f_NestedParties2_Nested2PartyRole) :: (("NstdPtys2SubGrp",rg_for_json nstdptys2subgrp_to_json x.f_NestedParties2_NstdPtys2SubGrp) :: [])))))
;;

let instrumentextension_to_string (d)  =
    ""
;;

let instrumentextension_to_json (x)  : json =
    assoc_filter_nulls (("DeliveryForm",deliveryform_opt_to_json x.f_InstrumentExtension_DeliveryForm) :: (("PctAtRisk",float_6_opt_to_json x.f_InstrumentExtension_PctAtRisk) :: (("AttrbGrp",rg_for_json attrbgrp_to_json x.f_InstrumentExtension_AttrbGrp) :: [])))
;;

let instrumentleg_to_string (d)  =
    ""
;;

let instrumentleg_to_json (x)  : json =
    assoc_filter_nulls (("LegSymbol",string_opt_to_json x.f_InstrumentLeg_LegSymbol) :: (("LegSymbolSfx",string_opt_to_json x.f_InstrumentLeg_LegSymbolSfx) :: (("LegSecurityID",string_opt_to_json x.f_InstrumentLeg_LegSecurityID) :: (("LegSecurityIDSource",string_opt_to_json x.f_InstrumentLeg_LegSecurityIDSource) :: (("LegProduct",int_opt_to_json x.f_InstrumentLeg_LegProduct) :: (("LegCFICode",string_opt_to_json x.f_InstrumentLeg_LegCFICode) :: (("LegSecurityType",string_opt_to_json x.f_InstrumentLeg_LegSecurityType) :: (("LegSecuritySubType",string_opt_to_json x.f_InstrumentLeg_LegSecuritySubType) :: (("LegMaturityMonthYear",monthyear_opt_to_json x.f_InstrumentLeg_LegMaturityMonthYear) :: (("LegMaturityDate",localmktdate_opt_to_json x.f_InstrumentLeg_LegMaturityDate) :: (("LegCouponPaymentDate",localmktdate_opt_to_json x.f_InstrumentLeg_LegCouponPaymentDate) :: (("LegIssueDate",localmktdate_opt_to_json x.f_InstrumentLeg_LegIssueDate) :: (("LegRepoCollateralSecurityType",string_opt_to_json x.f_InstrumentLeg_LegRepoCollateralSecurityType) :: (("LegRepurchaseTerm",int_opt_to_json x.f_InstrumentLeg_LegRepurchaseTerm) :: (("LegRepurchaseRate",float_6_opt_to_json x.f_InstrumentLeg_LegRepurchaseRate) :: (("LegFactor",float_opt_to_json x.f_InstrumentLeg_LegFactor) :: (("LegCreditRating",string_opt_to_json x.f_InstrumentLeg_LegCreditRating) :: (("LegInstrRegistry",string_opt_to_json x.f_InstrumentLeg_LegInstrRegistry) :: (("LegCountryOfIssue",country_opt_to_json x.f_InstrumentLeg_LegCountryOfIssue) :: (("LegStateOrProvinceOfIssue",string_opt_to_json x.f_InstrumentLeg_LegStateOrProvinceOfIssue) :: (("LegLocaleOfIssue",string_opt_to_json x.f_InstrumentLeg_LegLocaleOfIssue) :: (("LegRedemptionDate",localmktdate_opt_to_json x.f_InstrumentLeg_LegRedemptionDate) :: (("LegStrikePrice",float_4_opt_to_json x.f_InstrumentLeg_LegStrikePrice) :: (("LegStrikeCurrency",currency_opt_to_json x.f_InstrumentLeg_LegStrikeCurrency) :: (("LegOptAttribute",char_opt_to_json x.f_InstrumentLeg_LegOptAttribute) :: (("LegContractMultiplier",float_opt_to_json x.f_InstrumentLeg_LegContractMultiplier) :: (("LegCouponRate",float_6_opt_to_json x.f_InstrumentLeg_LegCouponRate) :: (("LegSecurityExchange",exchange_opt_to_json x.f_InstrumentLeg_LegSecurityExchange) :: (("LegIssuer",string_opt_to_json x.f_InstrumentLeg_LegIssuer) :: (("EncodedLegIssuerLen",int_opt_to_json x.f_InstrumentLeg_EncodedLegIssuerLen) :: (("EncodedLegIssuer",string_opt_to_json x.f_InstrumentLeg_EncodedLegIssuer) :: (("LegSecurityDesc",string_opt_to_json x.f_InstrumentLeg_LegSecurityDesc) :: (("EncodedLegSecurityDescLen",int_opt_to_json x.f_InstrumentLeg_EncodedLegSecurityDescLen) :: (("EncodedLegSecurityDesc",string_opt_to_json x.f_InstrumentLeg_EncodedLegSecurityDesc) :: (("LegRatioQty",float_opt_to_json x.f_InstrumentLeg_LegRatioQty) :: (("LegSide",char_opt_to_json x.f_InstrumentLeg_LegSide) :: (("LegCurrency",currency_opt_to_json x.f_InstrumentLeg_LegCurrency) :: (("LegPool",string_opt_to_json x.f_InstrumentLeg_LegPool) :: (("LegDatedDate",localmktdate_opt_to_json x.f_InstrumentLeg_LegDatedDate) :: (("LegContractSettlMonth",monthyear_opt_to_json x.f_InstrumentLeg_LegContractSettlMonth) :: (("LegInterestAccrualDate",localmktdate_opt_to_json x.f_InstrumentLeg_LegInterestAccrualDate) :: (("LegSecAltIDGrp",rg_for_json legsecaltidgrp_to_json x.f_InstrumentLeg_LegSecAltIDGrp) :: []))))))))))))))))))))))))))))))))))))))))))
;;

let settlparties_to_string (d)  =
    ""
;;

let settlparties_to_json (x)  : json =
    assoc_filter_nulls (("NoSettlPartyIDs",int_opt_to_json x.f_SettlParties_NoSettlPartyIDs) :: (("SettlPartyID",string_opt_to_json x.f_SettlParties_SettlPartyID) :: (("SettlPartyIDSource",char_opt_to_json x.f_SettlParties_SettlPartyIDSource) :: (("SettlPartyRole",int_opt_to_json x.f_SettlParties_SettlPartyRole) :: (("SettlPtysSubGrp",rg_for_json settlptyssubgrp_to_json x.f_SettlParties_SettlPtysSubGrp) :: [])))))
;;

let instrument_to_string (d)  =
    ""
;;

let instrument_to_json (x)  : json =
    assoc_filter_nulls (("Symbol",string_opt_to_json x.f_Instrument_Symbol) :: (("SymbolSfx",string_opt_to_json x.f_Instrument_SymbolSfx) :: (("SecurityID",string_opt_to_json x.f_Instrument_SecurityID) :: (("SecurityIDSource",securityidsource_opt_to_json x.f_Instrument_SecurityIDSource) :: (("Product",product_opt_to_json x.f_Instrument_Product) :: (("CFICode",string_opt_to_json x.f_Instrument_CFICode) :: (("SecurityType",securitytype_opt_to_json x.f_Instrument_SecurityType) :: (("SecuritySubType",string_opt_to_json x.f_Instrument_SecuritySubType) :: (("MaturityMonthYear",monthyear_opt_to_json x.f_Instrument_MaturityMonthYear) :: (("MaturityDate",localmktdate_opt_to_json x.f_Instrument_MaturityDate) :: (("CouponPaymentDate",localmktdate_opt_to_json x.f_Instrument_CouponPaymentDate) :: (("IssueDate",localmktdate_opt_to_json x.f_Instrument_IssueDate) :: (("RepoCollateralSecurityType",string_opt_to_json x.f_Instrument_RepoCollateralSecurityType) :: (("RepurchaseTerm",int_opt_to_json x.f_Instrument_RepurchaseTerm) :: (("RepurchaseRate",float_6_opt_to_json x.f_Instrument_RepurchaseRate) :: (("Factor",float_opt_to_json x.f_Instrument_Factor) :: (("CreditRating",string_opt_to_json x.f_Instrument_CreditRating) :: (("InstrRegistry",string_opt_to_json x.f_Instrument_InstrRegistry) :: (("CountryOfIssue",country_opt_to_json x.f_Instrument_CountryOfIssue) :: (("StateOrProvinceOfIssue",string_opt_to_json x.f_Instrument_StateOrProvinceOfIssue) :: (("LocaleOfIssue",string_opt_to_json x.f_Instrument_LocaleOfIssue) :: (("RedemptionDate",localmktdate_opt_to_json x.f_Instrument_RedemptionDate) :: (("StrikePrice",float_4_opt_to_json x.f_Instrument_StrikePrice) :: (("StrikeCurrency",currency_opt_to_json x.f_Instrument_StrikeCurrency) :: (("OptAttribute",char_opt_to_json x.f_Instrument_OptAttribute) :: (("ContractMultiplier",float_opt_to_json x.f_Instrument_ContractMultiplier) :: (("CouponRate",float_6_opt_to_json x.f_Instrument_CouponRate) :: (("SecurityExchange",exchange_opt_to_json x.f_Instrument_SecurityExchange) :: (("Issuer",string_opt_to_json x.f_Instrument_Issuer) :: (("EncodedIssuerLen",int_opt_to_json x.f_Instrument_EncodedIssuerLen) :: (("EncodedIssuer",string_opt_to_json x.f_Instrument_EncodedIssuer) :: (("SecurityDesc",string_opt_to_json x.f_Instrument_SecurityDesc) :: (("EncodedSecurityDescLen",int_opt_to_json x.f_Instrument_EncodedSecurityDescLen) :: (("EncodedSecurityDesc",string_opt_to_json x.f_Instrument_EncodedSecurityDesc) :: (("Pool",string_opt_to_json x.f_Instrument_Pool) :: (("ContractSettlMonth",monthyear_opt_to_json x.f_Instrument_ContractSettlMonth) :: (("CPProgram",cpprogram_opt_to_json x.f_Instrument_CPProgram) :: (("CPRegType",string_opt_to_json x.f_Instrument_CPRegType) :: (("DatedDate",localmktdate_opt_to_json x.f_Instrument_DatedDate) :: (("InterestAccrualDate",localmktdate_opt_to_json x.f_Instrument_InterestAccrualDate) :: (("SecAltIDGrp",rg_for_json secaltidgrp_to_json x.f_Instrument_SecAltIDGrp) :: (("EvntGrp",rg_for_json evntgrp_to_json x.f_Instrument_EvntGrp) :: []))))))))))))))))))))))))))))))))))))))))))
;;

let bidcomprspgrp_to_string (d)  =
    ""
;;

let bidcomprspgrp_to_json (x)  : json =
    assoc_filter_nulls (("CommissionData",commissiondata_to_json x.f_BidCompRspGrp_CommissionData) :: (("NoBidComponents",int_opt_to_json x.f_BidCompRspGrp_NoBidComponents) :: (("ListID",string_opt_to_json x.f_BidCompRspGrp_ListID) :: (("Country",country_opt_to_json x.f_BidCompRspGrp_Country) :: (("Side",side_opt_to_json x.f_BidCompRspGrp_Side) :: (("Price",float_4_opt_to_json x.f_BidCompRspGrp_Price) :: (("PriceType",pricetype_opt_to_json x.f_BidCompRspGrp_PriceType) :: (("FairValue",float_6_opt_to_json x.f_BidCompRspGrp_FairValue) :: (("NetGrossInd",netgrossind_opt_to_json x.f_BidCompRspGrp_NetGrossInd) :: (("SettlType",settltype_opt_to_json x.f_BidCompRspGrp_SettlType) :: (("SettlDate",localmktdate_opt_to_json x.f_BidCompRspGrp_SettlDate) :: (("TradingSessionID",string_opt_to_json x.f_BidCompRspGrp_TradingSessionID) :: (("TradingSessionSubID",string_opt_to_json x.f_BidCompRspGrp_TradingSessionSubID) :: (("Text",string_opt_to_json x.f_BidCompRspGrp_Text) :: (("EncodedTextLen",int_opt_to_json x.f_BidCompRspGrp_EncodedTextLen) :: (("EncodedText",string_opt_to_json x.f_BidCompRspGrp_EncodedText) :: []))))))))))))))))
;;

let underlyinginstrument_to_string (d)  =
    ""
;;

let underlyinginstrument_to_json (x)  : json =
    assoc_filter_nulls (("UnderlyingSymbol",string_opt_to_json x.f_UnderlyingInstrument_UnderlyingSymbol) :: (("UnderlyingSymbolSfx",string_opt_to_json x.f_UnderlyingInstrument_UnderlyingSymbolSfx) :: (("UnderlyingSecurityID",string_opt_to_json x.f_UnderlyingInstrument_UnderlyingSecurityID) :: (("UnderlyingSecurityIDSource",string_opt_to_json x.f_UnderlyingInstrument_UnderlyingSecurityIDSource) :: (("UnderlyingProduct",int_opt_to_json x.f_UnderlyingInstrument_UnderlyingProduct) :: (("UnderlyingCFICode",string_opt_to_json x.f_UnderlyingInstrument_UnderlyingCFICode) :: (("UnderlyingSecurityType",string_opt_to_json x.f_UnderlyingInstrument_UnderlyingSecurityType) :: (("UnderlyingSecuritySubType",string_opt_to_json x.f_UnderlyingInstrument_UnderlyingSecuritySubType) :: (("UnderlyingMaturityMonthYear",monthyear_opt_to_json x.f_UnderlyingInstrument_UnderlyingMaturityMonthYear) :: (("UnderlyingMaturityDate",localmktdate_opt_to_json x.f_UnderlyingInstrument_UnderlyingMaturityDate) :: (("UnderlyingCouponPaymentDate",localmktdate_opt_to_json x.f_UnderlyingInstrument_UnderlyingCouponPaymentDate) :: (("UnderlyingIssueDate",localmktdate_opt_to_json x.f_UnderlyingInstrument_UnderlyingIssueDate) :: (("UnderlyingRepoCollateralSecurityType",string_opt_to_json x.f_UnderlyingInstrument_UnderlyingRepoCollateralSecurityType) :: (("UnderlyingRepurchaseTerm",int_opt_to_json x.f_UnderlyingInstrument_UnderlyingRepurchaseTerm) :: (("UnderlyingRepurchaseRate",float_6_opt_to_json x.f_UnderlyingInstrument_UnderlyingRepurchaseRate) :: (("UnderlyingFactor",float_opt_to_json x.f_UnderlyingInstrument_UnderlyingFactor) :: (("UnderlyingCreditRating",string_opt_to_json x.f_UnderlyingInstrument_UnderlyingCreditRating) :: (("UnderlyingInstrRegistry",string_opt_to_json x.f_UnderlyingInstrument_UnderlyingInstrRegistry) :: (("UnderlyingCountryOfIssue",country_opt_to_json x.f_UnderlyingInstrument_UnderlyingCountryOfIssue) :: (("UnderlyingStateOrProvinceOfIssue",string_opt_to_json x.f_UnderlyingInstrument_UnderlyingStateOrProvinceOfIssue) :: (("UnderlyingLocaleOfIssue",string_opt_to_json x.f_UnderlyingInstrument_UnderlyingLocaleOfIssue) :: (("UnderlyingRedemptionDate",localmktdate_opt_to_json x.f_UnderlyingInstrument_UnderlyingRedemptionDate) :: (("UnderlyingStrikePrice",float_4_opt_to_json x.f_UnderlyingInstrument_UnderlyingStrikePrice) :: (("UnderlyingStrikeCurrency",currency_opt_to_json x.f_UnderlyingInstrument_UnderlyingStrikeCurrency) :: (("UnderlyingOptAttribute",char_opt_to_json x.f_UnderlyingInstrument_UnderlyingOptAttribute) :: (("UnderlyingContractMultiplier",float_opt_to_json x.f_UnderlyingInstrument_UnderlyingContractMultiplier) :: (("UnderlyingCouponRate",float_6_opt_to_json x.f_UnderlyingInstrument_UnderlyingCouponRate) :: (("UnderlyingSecurityExchange",exchange_opt_to_json x.f_UnderlyingInstrument_UnderlyingSecurityExchange) :: (("UnderlyingIssuer",string_opt_to_json x.f_UnderlyingInstrument_UnderlyingIssuer) :: (("EncodedUnderlyingIssuerLen",int_opt_to_json x.f_UnderlyingInstrument_EncodedUnderlyingIssuerLen) :: (("EncodedUnderlyingIssuer",string_opt_to_json x.f_UnderlyingInstrument_EncodedUnderlyingIssuer) :: (("UnderlyingSecurityDesc",string_opt_to_json x.f_UnderlyingInstrument_UnderlyingSecurityDesc) :: (("EncodedUnderlyingSecurityDescLen",int_opt_to_json x.f_UnderlyingInstrument_EncodedUnderlyingSecurityDescLen) :: (("EncodedUnderlyingSecurityDesc",string_opt_to_json x.f_UnderlyingInstrument_EncodedUnderlyingSecurityDesc) :: (("UnderlyingCPProgram",string_opt_to_json x.f_UnderlyingInstrument_UnderlyingCPProgram) :: (("UnderlyingCPRegType",string_opt_to_json x.f_UnderlyingInstrument_UnderlyingCPRegType) :: (("UnderlyingCurrency",currency_opt_to_json x.f_UnderlyingInstrument_UnderlyingCurrency) :: (("UnderlyingQty",float_6_opt_to_json x.f_UnderlyingInstrument_UnderlyingQty) :: (("UnderlyingPx",float_4_opt_to_json x.f_UnderlyingInstrument_UnderlyingPx) :: (("UnderlyingDirtyPrice",float_4_opt_to_json x.f_UnderlyingInstrument_UnderlyingDirtyPrice) :: (("UnderlyingEndPrice",float_4_opt_to_json x.f_UnderlyingInstrument_UnderlyingEndPrice) :: (("UnderlyingStartValue",float_6_opt_to_json x.f_UnderlyingInstrument_UnderlyingStartValue) :: (("UnderlyingCurrentValue",float_6_opt_to_json x.f_UnderlyingInstrument_UnderlyingCurrentValue) :: (("UnderlyingEndValue",float_6_opt_to_json x.f_UnderlyingInstrument_UnderlyingEndValue) :: (("UndSecAltIDGrp",rg_for_json undsecaltidgrp_to_json x.f_UnderlyingInstrument_UndSecAltIDGrp) :: (("UnderlyingStipulations",rg_for_json underlyingstipulations_to_json x.f_UnderlyingInstrument_UnderlyingStipulations) :: []))))))))))))))))))))))))))))))))))))))))))))))
;;

let undinstrmtgrp_to_string (d)  =
    ""
;;

let undinstrmtgrp_to_json (x)  : json =
    assoc_filter_nulls (("UnderlyingInstrument",underlyinginstrument_to_json x.f_UndInstrmtGrp_UnderlyingInstrument) :: (("NoUnderlyings",int_opt_to_json x.f_UndInstrmtGrp_NoUnderlyings) :: []))
;;

let undinstrmtstrkpxgrp_to_string (d)  =
    ""
;;

let undinstrmtstrkpxgrp_to_json (x)  : json =
    assoc_filter_nulls (("UnderlyingInstrument",underlyinginstrument_to_json x.f_UndInstrmtStrkPxGrp_UnderlyingInstrument) :: (("NoUnderlyings",int_opt_to_json x.f_UndInstrmtStrkPxGrp_NoUnderlyings) :: (("PrevClosePx",float_4_opt_to_json x.f_UndInstrmtStrkPxGrp_PrevClosePx) :: (("ClOrdID",string_opt_to_json x.f_UndInstrmtStrkPxGrp_ClOrdID) :: (("SecondaryClOrdID",string_opt_to_json x.f_UndInstrmtStrkPxGrp_SecondaryClOrdID) :: (("Side",side_opt_to_json x.f_UndInstrmtStrkPxGrp_Side) :: (("Price",float_4_opt_to_json x.f_UndInstrmtStrkPxGrp_Price) :: (("Currency",currency_opt_to_json x.f_UndInstrmtStrkPxGrp_Currency) :: (("Text",string_opt_to_json x.f_UndInstrmtStrkPxGrp_Text) :: (("EncodedTextLen",int_opt_to_json x.f_UndInstrmtStrkPxGrp_EncodedTextLen) :: (("EncodedText",string_opt_to_json x.f_UndInstrmtStrkPxGrp_EncodedText) :: [])))))))))))
;;

let posundinstrmtgrp_to_string (d)  =
    ""
;;

let posundinstrmtgrp_to_json (x)  : json =
    assoc_filter_nulls (("UnderlyingInstrument",underlyinginstrument_to_json x.f_PosUndInstrmtGrp_UnderlyingInstrument) :: (("NoUnderlyings",int_opt_to_json x.f_PosUndInstrmtGrp_NoUnderlyings) :: (("UnderlyingSettlPrice",float_4_opt_to_json x.f_PosUndInstrmtGrp_UnderlyingSettlPrice) :: (("UnderlyingSettlPriceType",int_opt_to_json x.f_PosUndInstrmtGrp_UnderlyingSettlPriceType) :: []))))
;;

let undinstrmtcollgrp_to_string (d)  =
    ""
;;

let undinstrmtcollgrp_to_json (x)  : json =
    assoc_filter_nulls (("UnderlyingInstrument",underlyinginstrument_to_json x.f_UndInstrmtCollGrp_UnderlyingInstrument) :: (("NoUnderlyings",int_opt_to_json x.f_UndInstrmtCollGrp_NoUnderlyings) :: (("CollAction",collaction_opt_to_json x.f_UndInstrmtCollGrp_CollAction) :: [])))
;;

let instrmtstrkpxgrp_to_string (d)  =
    ""
;;

let instrmtstrkpxgrp_to_json (x)  : json =
    assoc_filter_nulls (("Instrument",instrument_to_json x.f_InstrmtStrkPxGrp_Instrument) :: (("NoStrikes",int_opt_to_json x.f_InstrmtStrkPxGrp_NoStrikes) :: []))
;;

let instrmtgrp_to_string (d)  =
    ""
;;

let instrmtgrp_to_json (x)  : json =
    assoc_filter_nulls (("Instrument",instrument_to_json x.f_InstrmtGrp_Instrument) :: (("NoRelatedSym",int_opt_to_json x.f_InstrmtGrp_NoRelatedSym) :: []))
;;

let dlvyinstgrp_to_string (d)  =
    ""
;;

let dlvyinstgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoDlvyInst",int_opt_to_json x.f_DlvyInstGrp_NoDlvyInst) :: (("SettlInstSource",settlinstsource_opt_to_json x.f_DlvyInstGrp_SettlInstSource) :: (("DlvyInstType",dlvyinsttype_opt_to_json x.f_DlvyInstGrp_DlvyInstType) :: (("SettlParties",rg_for_json settlparties_to_json x.f_DlvyInstGrp_SettlParties) :: []))))
;;

let instrmtlegseclistgrp_to_string (d)  =
    ""
;;

let instrmtlegseclistgrp_to_json (x)  : json =
    assoc_filter_nulls (("InstrumentLeg",instrumentleg_to_json x.f_InstrmtLegSecListGrp_InstrumentLeg) :: (("LegBenchmarkCurveData",legbenchmarkcurvedata_to_json x.f_InstrmtLegSecListGrp_LegBenchmarkCurveData) :: (("NoLegs",int_opt_to_json x.f_InstrmtLegSecListGrp_NoLegs) :: (("LegSwapType",legswaptype_opt_to_json x.f_InstrmtLegSecListGrp_LegSwapType) :: (("LegSettlType",char_opt_to_json x.f_InstrmtLegSecListGrp_LegSettlType) :: (("LegStipulations",rg_for_json legstipulations_to_json x.f_InstrmtLegSecListGrp_LegStipulations) :: []))))))
;;

let instrmtleggrp_to_string (d)  =
    ""
;;

let instrmtleggrp_to_json (x)  : json =
    assoc_filter_nulls (("InstrumentLeg",instrumentleg_to_json x.f_InstrmtLegGrp_InstrumentLeg) :: (("NoLegs",int_opt_to_json x.f_InstrmtLegGrp_NoLegs) :: []))
;;

let instrmtlegioigrp_to_string (d)  =
    ""
;;

let instrmtlegioigrp_to_json (x)  : json =
    assoc_filter_nulls (("InstrumentLeg",instrumentleg_to_json x.f_InstrmtLegIOIGrp_InstrumentLeg) :: (("NoLegs",int_opt_to_json x.f_InstrmtLegIOIGrp_NoLegs) :: (("LegIOIQty",string_opt_to_json x.f_InstrmtLegIOIGrp_LegIOIQty) :: (("LegStipulations",rg_for_json legstipulations_to_json x.f_InstrmtLegIOIGrp_LegStipulations) :: []))))
;;

let trdallocgrp_to_string (d)  =
    ""
;;

let trdallocgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoAllocs",int_opt_to_json x.f_TrdAllocGrp_NoAllocs) :: (("AllocAccount",string_opt_to_json x.f_TrdAllocGrp_AllocAccount) :: (("AllocAcctIDSource",int_opt_to_json x.f_TrdAllocGrp_AllocAcctIDSource) :: (("AllocSettlCurrency",currency_opt_to_json x.f_TrdAllocGrp_AllocSettlCurrency) :: (("IndividualAllocID",string_opt_to_json x.f_TrdAllocGrp_IndividualAllocID) :: (("AllocQty",float_6_opt_to_json x.f_TrdAllocGrp_AllocQty) :: (("NestedParties2",rg_for_json nestedparties2_to_json x.f_TrdAllocGrp_NestedParties2) :: [])))))))
;;

let ordallocgrp_to_string (d)  =
    ""
;;

let ordallocgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoOrders",int_opt_to_json x.f_OrdAllocGrp_NoOrders) :: (("ClOrdID",string_opt_to_json x.f_OrdAllocGrp_ClOrdID) :: (("OrderID",string_opt_to_json x.f_OrdAllocGrp_OrderID) :: (("SecondaryOrderID",string_opt_to_json x.f_OrdAllocGrp_SecondaryOrderID) :: (("SecondaryClOrdID",string_opt_to_json x.f_OrdAllocGrp_SecondaryClOrdID) :: (("ListID",string_opt_to_json x.f_OrdAllocGrp_ListID) :: (("OrderQty",float_6_opt_to_json x.f_OrdAllocGrp_OrderQty) :: (("OrderAvgPx",float_4_opt_to_json x.f_OrdAllocGrp_OrderAvgPx) :: (("OrderBookingQty",float_6_opt_to_json x.f_OrdAllocGrp_OrderBookingQty) :: (("NestedParties2",rg_for_json nestedparties2_to_json x.f_OrdAllocGrp_NestedParties2) :: []))))))))))
;;

let legpreallocgrp_to_string (d)  =
    ""
;;

let legpreallocgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoLegAllocs",int_opt_to_json x.f_LegPreAllocGrp_NoLegAllocs) :: (("LegAllocAccount",string_opt_to_json x.f_LegPreAllocGrp_LegAllocAccount) :: (("LegIndividualAllocID",string_opt_to_json x.f_LegPreAllocGrp_LegIndividualAllocID) :: (("LegAllocQty",float_6_opt_to_json x.f_LegPreAllocGrp_LegAllocQty) :: (("LegAllocAcctIDSource",string_opt_to_json x.f_LegPreAllocGrp_LegAllocAcctIDSource) :: (("LegSettlCurrency",currency_opt_to_json x.f_LegPreAllocGrp_LegSettlCurrency) :: (("NestedParties2",rg_for_json nestedparties2_to_json x.f_LegPreAllocGrp_NestedParties2) :: [])))))))
;;

let sidecrossordcxlgrp_to_string (d)  =
    ""
;;

let sidecrossordcxlgrp_to_json (x)  : json =
    assoc_filter_nulls (("OrderQtyData",orderqtydata_to_json x.f_SideCrossOrdCxlGrp_OrderQtyData) :: (("NoSides",int_opt_to_json x.f_SideCrossOrdCxlGrp_NoSides) :: (("Side",side_opt_to_json x.f_SideCrossOrdCxlGrp_Side) :: (("OrigClOrdID",string_opt_to_json x.f_SideCrossOrdCxlGrp_OrigClOrdID) :: (("ClOrdID",string_opt_to_json x.f_SideCrossOrdCxlGrp_ClOrdID) :: (("SecondaryClOrdID",string_opt_to_json x.f_SideCrossOrdCxlGrp_SecondaryClOrdID) :: (("ClOrdLinkID",string_opt_to_json x.f_SideCrossOrdCxlGrp_ClOrdLinkID) :: (("OrigOrdModTime",utctimestamp_opt_to_json x.f_SideCrossOrdCxlGrp_OrigOrdModTime) :: (("TradeOriginationDate",localmktdate_opt_to_json x.f_SideCrossOrdCxlGrp_TradeOriginationDate) :: (("TradeDate",localmktdate_opt_to_json x.f_SideCrossOrdCxlGrp_TradeDate) :: (("ComplianceID",string_opt_to_json x.f_SideCrossOrdCxlGrp_ComplianceID) :: (("Text",string_opt_to_json x.f_SideCrossOrdCxlGrp_Text) :: (("EncodedTextLen",int_opt_to_json x.f_SideCrossOrdCxlGrp_EncodedTextLen) :: (("EncodedText",string_opt_to_json x.f_SideCrossOrdCxlGrp_EncodedText) :: (("Parties",rg_for_json parties_to_json x.f_SideCrossOrdCxlGrp_Parties) :: [])))))))))))))))
;;

let instrmtlegexecgrp_to_string (d)  =
    ""
;;

let instrmtlegexecgrp_to_json (x)  : json =
    assoc_filter_nulls (("InstrumentLeg",instrumentleg_to_json x.f_InstrmtLegExecGrp_InstrumentLeg) :: (("NoLegs",int_opt_to_json x.f_InstrmtLegExecGrp_NoLegs) :: (("LegQty",float_6_opt_to_json x.f_InstrmtLegExecGrp_LegQty) :: (("LegSwapType",legswaptype_opt_to_json x.f_InstrmtLegExecGrp_LegSwapType) :: (("LegPositionEffect",char_opt_to_json x.f_InstrmtLegExecGrp_LegPositionEffect) :: (("LegCoveredOrUncovered",int_opt_to_json x.f_InstrmtLegExecGrp_LegCoveredOrUncovered) :: (("LegRefID",string_opt_to_json x.f_InstrmtLegExecGrp_LegRefID) :: (("LegPrice",float_4_opt_to_json x.f_InstrmtLegExecGrp_LegPrice) :: (("LegSettlType",char_opt_to_json x.f_InstrmtLegExecGrp_LegSettlType) :: (("LegSettlDate",localmktdate_opt_to_json x.f_InstrmtLegExecGrp_LegSettlDate) :: (("LegLastPx",float_4_opt_to_json x.f_InstrmtLegExecGrp_LegLastPx) :: (("LegStipulations",rg_for_json legstipulations_to_json x.f_InstrmtLegExecGrp_LegStipulations) :: (("NestedParties",rg_for_json nestedparties_to_json x.f_InstrmtLegExecGrp_NestedParties) :: [])))))))))))))
;;

let preallocgrp_to_string (d)  =
    ""
;;

let preallocgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoAllocs",int_opt_to_json x.f_PreAllocGrp_NoAllocs) :: (("AllocAccount",string_opt_to_json x.f_PreAllocGrp_AllocAccount) :: (("AllocAcctIDSource",int_opt_to_json x.f_PreAllocGrp_AllocAcctIDSource) :: (("AllocSettlCurrency",currency_opt_to_json x.f_PreAllocGrp_AllocSettlCurrency) :: (("IndividualAllocID",string_opt_to_json x.f_PreAllocGrp_IndividualAllocID) :: (("AllocQty",float_6_opt_to_json x.f_PreAllocGrp_AllocQty) :: (("NestedParties",rg_for_json nestedparties_to_json x.f_PreAllocGrp_NestedParties) :: [])))))))
;;

let legquotstatgrp_to_string (d)  =
    ""
;;

let legquotstatgrp_to_json (x)  : json =
    assoc_filter_nulls (("InstrumentLeg",instrumentleg_to_json x.f_LegQuotStatGrp_InstrumentLeg) :: (("NoLegs",int_opt_to_json x.f_LegQuotStatGrp_NoLegs) :: (("LegQty",float_6_opt_to_json x.f_LegQuotStatGrp_LegQty) :: (("LegSwapType",legswaptype_opt_to_json x.f_LegQuotStatGrp_LegSwapType) :: (("LegSettlType",char_opt_to_json x.f_LegQuotStatGrp_LegSettlType) :: (("LegSettlDate",localmktdate_opt_to_json x.f_LegQuotStatGrp_LegSettlDate) :: (("LegStipulations",rg_for_json legstipulations_to_json x.f_LegQuotStatGrp_LegStipulations) :: (("NestedParties",rg_for_json nestedparties_to_json x.f_LegQuotStatGrp_NestedParties) :: []))))))))
;;

let quotreqlegsgrp_to_string (d)  =
    ""
;;

let quotreqlegsgrp_to_json (x)  : json =
    assoc_filter_nulls (("InstrumentLeg",instrumentleg_to_json x.f_QuotReqLegsGrp_InstrumentLeg) :: (("LegBenchmarkCurveData",legbenchmarkcurvedata_to_json x.f_QuotReqLegsGrp_LegBenchmarkCurveData) :: (("NoLegs",int_opt_to_json x.f_QuotReqLegsGrp_NoLegs) :: (("LegQty",float_6_opt_to_json x.f_QuotReqLegsGrp_LegQty) :: (("LegSwapType",legswaptype_opt_to_json x.f_QuotReqLegsGrp_LegSwapType) :: (("LegSettlType",char_opt_to_json x.f_QuotReqLegsGrp_LegSettlType) :: (("LegSettlDate",localmktdate_opt_to_json x.f_QuotReqLegsGrp_LegSettlDate) :: (("LegStipulations",rg_for_json legstipulations_to_json x.f_QuotReqLegsGrp_LegStipulations) :: (("NestedParties",rg_for_json nestedparties_to_json x.f_QuotReqLegsGrp_NestedParties) :: [])))))))))
;;

let positionqty_to_string (d)  =
    ""
;;

let positionqty_to_json (x)  : json =
    assoc_filter_nulls (("NoPositions",int_opt_to_json x.f_PositionQty_NoPositions) :: (("PosType",postype_opt_to_json x.f_PositionQty_PosType) :: (("LongQty",float_6_opt_to_json x.f_PositionQty_LongQty) :: (("ShortQty",float_6_opt_to_json x.f_PositionQty_ShortQty) :: (("PosQtyStatus",posqtystatus_opt_to_json x.f_PositionQty_PosQtyStatus) :: (("NestedParties",rg_for_json nestedparties_to_json x.f_PositionQty_NestedParties) :: []))))))
;;

let legquotgrp_to_string (d)  =
    ""
;;

let legquotgrp_to_json (x)  : json =
    assoc_filter_nulls (("InstrumentLeg",instrumentleg_to_json x.f_LegQuotGrp_InstrumentLeg) :: (("LegBenchmarkCurveData",legbenchmarkcurvedata_to_json x.f_LegQuotGrp_LegBenchmarkCurveData) :: (("NoLegs",int_opt_to_json x.f_LegQuotGrp_NoLegs) :: (("LegQty",float_6_opt_to_json x.f_LegQuotGrp_LegQty) :: (("LegSwapType",legswaptype_opt_to_json x.f_LegQuotGrp_LegSwapType) :: (("LegSettlType",char_opt_to_json x.f_LegQuotGrp_LegSettlType) :: (("LegSettlDate",localmktdate_opt_to_json x.f_LegQuotGrp_LegSettlDate) :: (("LegPriceType",int_opt_to_json x.f_LegQuotGrp_LegPriceType) :: (("LegBidPx",float_4_opt_to_json x.f_LegQuotGrp_LegBidPx) :: (("LegOfferPx",float_4_opt_to_json x.f_LegQuotGrp_LegOfferPx) :: (("LegStipulations",rg_for_json legstipulations_to_json x.f_LegQuotGrp_LegStipulations) :: (("NestedParties",rg_for_json nestedparties_to_json x.f_LegQuotGrp_NestedParties) :: []))))))))))))
;;

let rgstdtlsgrp_to_string (d)  =
    ""
;;

let rgstdtlsgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoRegistDtls",int_opt_to_json x.f_RgstDtlsGrp_NoRegistDtls) :: (("RegistDtls",string_opt_to_json x.f_RgstDtlsGrp_RegistDtls) :: (("RegistEmail",string_opt_to_json x.f_RgstDtlsGrp_RegistEmail) :: (("MailingDtls",string_opt_to_json x.f_RgstDtlsGrp_MailingDtls) :: (("MailingInst",string_opt_to_json x.f_RgstDtlsGrp_MailingInst) :: (("OwnerType",ownertype_opt_to_json x.f_RgstDtlsGrp_OwnerType) :: (("DateOfBirth",localmktdate_opt_to_json x.f_RgstDtlsGrp_DateOfBirth) :: (("InvestorCountryOfResidence",country_opt_to_json x.f_RgstDtlsGrp_InvestorCountryOfResidence) :: (("NestedParties",rg_for_json nestedparties_to_json x.f_RgstDtlsGrp_NestedParties) :: [])))))))))
;;

let trdinstrmtleggrp_to_string (d)  =
    ""
;;

let trdinstrmtleggrp_to_json (x)  : json =
    assoc_filter_nulls (("InstrumentLeg",instrumentleg_to_json x.f_TrdInstrmtLegGrp_InstrumentLeg) :: (("NoLegs",int_opt_to_json x.f_TrdInstrmtLegGrp_NoLegs) :: (("LegQty",float_6_opt_to_json x.f_TrdInstrmtLegGrp_LegQty) :: (("LegSwapType",legswaptype_opt_to_json x.f_TrdInstrmtLegGrp_LegSwapType) :: (("LegPositionEffect",char_opt_to_json x.f_TrdInstrmtLegGrp_LegPositionEffect) :: (("LegCoveredOrUncovered",int_opt_to_json x.f_TrdInstrmtLegGrp_LegCoveredOrUncovered) :: (("LegRefID",string_opt_to_json x.f_TrdInstrmtLegGrp_LegRefID) :: (("LegPrice",float_4_opt_to_json x.f_TrdInstrmtLegGrp_LegPrice) :: (("LegSettlType",char_opt_to_json x.f_TrdInstrmtLegGrp_LegSettlType) :: (("LegSettlDate",localmktdate_opt_to_json x.f_TrdInstrmtLegGrp_LegSettlDate) :: (("LegLastPx",float_4_opt_to_json x.f_TrdInstrmtLegGrp_LegLastPx) :: (("LegStipulations",rg_for_json legstipulations_to_json x.f_TrdInstrmtLegGrp_LegStipulations) :: (("NestedParties",rg_for_json nestedparties_to_json x.f_TrdInstrmtLegGrp_NestedParties) :: [])))))))))))))
;;

let preallocmleggrp_to_string (d)  =
    ""
;;

let preallocmleggrp_to_json (x)  : json =
    assoc_filter_nulls (("NoAllocs",int_opt_to_json x.f_PreAllocMlegGrp_NoAllocs) :: (("AllocAccount",string_opt_to_json x.f_PreAllocMlegGrp_AllocAccount) :: (("AllocAcctIDSource",int_opt_to_json x.f_PreAllocMlegGrp_AllocAcctIDSource) :: (("AllocSettlCurrency",currency_opt_to_json x.f_PreAllocMlegGrp_AllocSettlCurrency) :: (("IndividualAllocID",string_opt_to_json x.f_PreAllocMlegGrp_IndividualAllocID) :: (("AllocQty",float_6_opt_to_json x.f_PreAllocMlegGrp_AllocQty) :: (("NestedParties3",rg_for_json nestedparties3_to_json x.f_PreAllocMlegGrp_NestedParties3) :: [])))))))
;;

let sidecrossordmodgrp_to_string (d)  =
    ""
;;

let sidecrossordmodgrp_to_json (x)  : json =
    assoc_filter_nulls (("OrderQtyData",orderqtydata_to_json x.f_SideCrossOrdModGrp_OrderQtyData) :: (("CommissionData",commissiondata_to_json x.f_SideCrossOrdModGrp_CommissionData) :: (("NoSides",int_opt_to_json x.f_SideCrossOrdModGrp_NoSides) :: (("Side",side_opt_to_json x.f_SideCrossOrdModGrp_Side) :: (("ClOrdID",string_opt_to_json x.f_SideCrossOrdModGrp_ClOrdID) :: (("SecondaryClOrdID",string_opt_to_json x.f_SideCrossOrdModGrp_SecondaryClOrdID) :: (("ClOrdLinkID",string_opt_to_json x.f_SideCrossOrdModGrp_ClOrdLinkID) :: (("TradeOriginationDate",localmktdate_opt_to_json x.f_SideCrossOrdModGrp_TradeOriginationDate) :: (("TradeDate",localmktdate_opt_to_json x.f_SideCrossOrdModGrp_TradeDate) :: (("Account",string_opt_to_json x.f_SideCrossOrdModGrp_Account) :: (("AcctIDSource",acctidsource_opt_to_json x.f_SideCrossOrdModGrp_AcctIDSource) :: (("AccountType",accounttype_opt_to_json x.f_SideCrossOrdModGrp_AccountType) :: (("DayBookingInst",daybookinginst_opt_to_json x.f_SideCrossOrdModGrp_DayBookingInst) :: (("BookingUnit",bookingunit_opt_to_json x.f_SideCrossOrdModGrp_BookingUnit) :: (("PreallocMethod",preallocmethod_opt_to_json x.f_SideCrossOrdModGrp_PreallocMethod) :: (("AllocID",string_opt_to_json x.f_SideCrossOrdModGrp_AllocID) :: (("QtyType",qtytype_opt_to_json x.f_SideCrossOrdModGrp_QtyType) :: (("OrderCapacity",ordercapacity_opt_to_json x.f_SideCrossOrdModGrp_OrderCapacity) :: (("OrderRestrictions",orderrestrictions_opt_to_json x.f_SideCrossOrdModGrp_OrderRestrictions) :: (("CustOrderCapacity",custordercapacity_opt_to_json x.f_SideCrossOrdModGrp_CustOrderCapacity) :: (("ForexReq",forexreq_opt_to_json x.f_SideCrossOrdModGrp_ForexReq) :: (("SettlCurrency",currency_opt_to_json x.f_SideCrossOrdModGrp_SettlCurrency) :: (("BookingType",bookingtype_opt_to_json x.f_SideCrossOrdModGrp_BookingType) :: (("Text",string_opt_to_json x.f_SideCrossOrdModGrp_Text) :: (("EncodedTextLen",int_opt_to_json x.f_SideCrossOrdModGrp_EncodedTextLen) :: (("EncodedText",string_opt_to_json x.f_SideCrossOrdModGrp_EncodedText) :: (("PositionEffect",positioneffect_opt_to_json x.f_SideCrossOrdModGrp_PositionEffect) :: (("CoveredOrUncovered",coveredoruncovered_opt_to_json x.f_SideCrossOrdModGrp_CoveredOrUncovered) :: (("CashMargin",cashmargin_opt_to_json x.f_SideCrossOrdModGrp_CashMargin) :: (("ClearingFeeIndicator",clearingfeeindicator_opt_to_json x.f_SideCrossOrdModGrp_ClearingFeeIndicator) :: (("SolicitedFlag",solicitedflag_opt_to_json x.f_SideCrossOrdModGrp_SolicitedFlag) :: (("SideComplianceID",string_opt_to_json x.f_SideCrossOrdModGrp_SideComplianceID) :: (("Parties",rg_for_json parties_to_json x.f_SideCrossOrdModGrp_Parties) :: (("PreAllocGrp",rg_for_json preallocgrp_to_json x.f_SideCrossOrdModGrp_PreAllocGrp) :: []))))))))))))))))))))))))))))))))))
;;

let legordgrp_to_string (d)  =
    ""
;;

let legordgrp_to_json (x)  : json =
    assoc_filter_nulls (("InstrumentLeg",instrumentleg_to_json x.f_LegOrdGrp_InstrumentLeg) :: (("NoLegs",int_opt_to_json x.f_LegOrdGrp_NoLegs) :: (("LegQty",float_6_opt_to_json x.f_LegOrdGrp_LegQty) :: (("LegSwapType",legswaptype_opt_to_json x.f_LegOrdGrp_LegSwapType) :: (("LegPositionEffect",char_opt_to_json x.f_LegOrdGrp_LegPositionEffect) :: (("LegCoveredOrUncovered",int_opt_to_json x.f_LegOrdGrp_LegCoveredOrUncovered) :: (("LegRefID",string_opt_to_json x.f_LegOrdGrp_LegRefID) :: (("LegPrice",float_4_opt_to_json x.f_LegOrdGrp_LegPrice) :: (("LegSettlType",char_opt_to_json x.f_LegOrdGrp_LegSettlType) :: (("LegSettlDate",localmktdate_opt_to_json x.f_LegOrdGrp_LegSettlDate) :: (("LegStipulations",rg_for_json legstipulations_to_json x.f_LegOrdGrp_LegStipulations) :: (("LegPreAllocGrp",rg_for_json legpreallocgrp_to_json x.f_LegOrdGrp_LegPreAllocGrp) :: (("NestedParties",rg_for_json nestedparties_to_json x.f_LegOrdGrp_NestedParties) :: [])))))))))))))
;;

let trdcaprptsidegrp_to_string (d)  =
    ""
;;

let trdcaprptsidegrp_to_json (x)  : json =
    assoc_filter_nulls (("CommissionData",commissiondata_to_json x.f_TrdCapRptSideGrp_CommissionData) :: (("NoSides",int_opt_to_json x.f_TrdCapRptSideGrp_NoSides) :: (("Side",side_opt_to_json x.f_TrdCapRptSideGrp_Side) :: (("OrderID",string_opt_to_json x.f_TrdCapRptSideGrp_OrderID) :: (("SecondaryOrderID",string_opt_to_json x.f_TrdCapRptSideGrp_SecondaryOrderID) :: (("ClOrdID",string_opt_to_json x.f_TrdCapRptSideGrp_ClOrdID) :: (("SecondaryClOrdID",string_opt_to_json x.f_TrdCapRptSideGrp_SecondaryClOrdID) :: (("ListID",string_opt_to_json x.f_TrdCapRptSideGrp_ListID) :: (("Account",string_opt_to_json x.f_TrdCapRptSideGrp_Account) :: (("AcctIDSource",acctidsource_opt_to_json x.f_TrdCapRptSideGrp_AcctIDSource) :: (("AccountType",accounttype_opt_to_json x.f_TrdCapRptSideGrp_AccountType) :: (("ProcessCode",processcode_opt_to_json x.f_TrdCapRptSideGrp_ProcessCode) :: (("OddLot",oddlot_opt_to_json x.f_TrdCapRptSideGrp_OddLot) :: (("TradeInputSource",string_opt_to_json x.f_TrdCapRptSideGrp_TradeInputSource) :: (("TradeInputDevice",string_opt_to_json x.f_TrdCapRptSideGrp_TradeInputDevice) :: (("OrderInputDevice",string_opt_to_json x.f_TrdCapRptSideGrp_OrderInputDevice) :: (("Currency",currency_opt_to_json x.f_TrdCapRptSideGrp_Currency) :: (("ComplianceID",string_opt_to_json x.f_TrdCapRptSideGrp_ComplianceID) :: (("SolicitedFlag",solicitedflag_opt_to_json x.f_TrdCapRptSideGrp_SolicitedFlag) :: (("OrderCapacity",ordercapacity_opt_to_json x.f_TrdCapRptSideGrp_OrderCapacity) :: (("OrderRestrictions",orderrestrictions_opt_to_json x.f_TrdCapRptSideGrp_OrderRestrictions) :: (("CustOrderCapacity",custordercapacity_opt_to_json x.f_TrdCapRptSideGrp_CustOrderCapacity) :: (("OrdType",ordtype_opt_to_json x.f_TrdCapRptSideGrp_OrdType) :: (("ExecInst",execinst_opt_to_json x.f_TrdCapRptSideGrp_ExecInst) :: (("TransBkdTime",utctimestamp_opt_to_json x.f_TrdCapRptSideGrp_TransBkdTime) :: (("TradingSessionID",string_opt_to_json x.f_TrdCapRptSideGrp_TradingSessionID) :: (("TradingSessionSubID",string_opt_to_json x.f_TrdCapRptSideGrp_TradingSessionSubID) :: (("TimeBracket",string_opt_to_json x.f_TrdCapRptSideGrp_TimeBracket) :: (("GrossTradeAmt",float_6_opt_to_json x.f_TrdCapRptSideGrp_GrossTradeAmt) :: (("NumDaysInterest",int_opt_to_json x.f_TrdCapRptSideGrp_NumDaysInterest) :: (("ExDate",localmktdate_opt_to_json x.f_TrdCapRptSideGrp_ExDate) :: (("AccruedInterestRate",float_6_opt_to_json x.f_TrdCapRptSideGrp_AccruedInterestRate) :: (("AccruedInterestAmt",float_6_opt_to_json x.f_TrdCapRptSideGrp_AccruedInterestAmt) :: (("InterestAtMaturity",float_6_opt_to_json x.f_TrdCapRptSideGrp_InterestAtMaturity) :: (("EndAccruedInterestAmt",float_6_opt_to_json x.f_TrdCapRptSideGrp_EndAccruedInterestAmt) :: (("StartCash",float_6_opt_to_json x.f_TrdCapRptSideGrp_StartCash) :: (("EndCash",float_6_opt_to_json x.f_TrdCapRptSideGrp_EndCash) :: (("Concession",float_6_opt_to_json x.f_TrdCapRptSideGrp_Concession) :: (("TotalTakedown",float_6_opt_to_json x.f_TrdCapRptSideGrp_TotalTakedown) :: (("NetMoney",float_6_opt_to_json x.f_TrdCapRptSideGrp_NetMoney) :: (("SettlCurrAmt",float_6_opt_to_json x.f_TrdCapRptSideGrp_SettlCurrAmt) :: (("SettlCurrency",currency_opt_to_json x.f_TrdCapRptSideGrp_SettlCurrency) :: (("SettlCurrFxRate",float_opt_to_json x.f_TrdCapRptSideGrp_SettlCurrFxRate) :: (("SettlCurrFxRateCalc",settlcurrfxratecalc_opt_to_json x.f_TrdCapRptSideGrp_SettlCurrFxRateCalc) :: (("PositionEffect",positioneffect_opt_to_json x.f_TrdCapRptSideGrp_PositionEffect) :: (("Text",string_opt_to_json x.f_TrdCapRptSideGrp_Text) :: (("EncodedTextLen",int_opt_to_json x.f_TrdCapRptSideGrp_EncodedTextLen) :: (("EncodedText",string_opt_to_json x.f_TrdCapRptSideGrp_EncodedText) :: (("SideMultiLegReportingType",sidemultilegreportingtype_opt_to_json x.f_TrdCapRptSideGrp_SideMultiLegReportingType) :: (("ExchangeRule",string_opt_to_json x.f_TrdCapRptSideGrp_ExchangeRule) :: (("TradeAllocIndicator",tradeallocindicator_opt_to_json x.f_TrdCapRptSideGrp_TradeAllocIndicator) :: (("PreallocMethod",preallocmethod_opt_to_json x.f_TrdCapRptSideGrp_PreallocMethod) :: (("AllocID",string_opt_to_json x.f_TrdCapRptSideGrp_AllocID) :: (("Parties",rg_for_json parties_to_json x.f_TrdCapRptSideGrp_Parties) :: (("ClrInstGrp",rg_for_json clrinstgrp_to_json x.f_TrdCapRptSideGrp_ClrInstGrp) :: (("ContAmtGrp",rg_for_json contamtgrp_to_json x.f_TrdCapRptSideGrp_ContAmtGrp) :: (("Stipulations",rg_for_json stipulations_to_json x.f_TrdCapRptSideGrp_Stipulations) :: (("MiscFeesGrp",rg_for_json miscfeesgrp_to_json x.f_TrdCapRptSideGrp_MiscFeesGrp) :: (("TrdAllocGrp",rg_for_json trdallocgrp_to_json x.f_TrdCapRptSideGrp_TrdAllocGrp) :: [])))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
;;

let relsymderivsecgrp_to_string (d)  =
    ""
;;

let relsymderivsecgrp_to_json (x)  : json =
    assoc_filter_nulls (("Instrument",instrument_to_json x.f_RelSymDerivSecGrp_Instrument) :: (("InstrumentExtension",instrumentextension_to_json x.f_RelSymDerivSecGrp_InstrumentExtension) :: (("NoRelatedSym",int_opt_to_json x.f_RelSymDerivSecGrp_NoRelatedSym) :: (("Currency",currency_opt_to_json x.f_RelSymDerivSecGrp_Currency) :: (("ExpirationCycle",expirationcycle_opt_to_json x.f_RelSymDerivSecGrp_ExpirationCycle) :: (("TradingSessionID",string_opt_to_json x.f_RelSymDerivSecGrp_TradingSessionID) :: (("TradingSessionSubID",string_opt_to_json x.f_RelSymDerivSecGrp_TradingSessionSubID) :: (("Text",string_opt_to_json x.f_RelSymDerivSecGrp_Text) :: (("EncodedTextLen",int_opt_to_json x.f_RelSymDerivSecGrp_EncodedTextLen) :: (("EncodedText",string_opt_to_json x.f_RelSymDerivSecGrp_EncodedText) :: (("InstrmtLegGrp",rg_for_json instrmtleggrp_to_json x.f_RelSymDerivSecGrp_InstrmtLegGrp) :: [])))))))))))
;;

let quotentryackgrp_to_string (d)  =
    ""
;;

let quotentryackgrp_to_json (x)  : json =
    assoc_filter_nulls (("Instrument",instrument_to_json x.f_QuotEntryAckGrp_Instrument) :: (("NoQuoteEntries",int_opt_to_json x.f_QuotEntryAckGrp_NoQuoteEntries) :: (("QuoteEntryID",string_opt_to_json x.f_QuotEntryAckGrp_QuoteEntryID) :: (("BidPx",float_4_opt_to_json x.f_QuotEntryAckGrp_BidPx) :: (("OfferPx",float_4_opt_to_json x.f_QuotEntryAckGrp_OfferPx) :: (("BidSize",float_6_opt_to_json x.f_QuotEntryAckGrp_BidSize) :: (("OfferSize",float_6_opt_to_json x.f_QuotEntryAckGrp_OfferSize) :: (("ValidUntilTime",utctimestamp_opt_to_json x.f_QuotEntryAckGrp_ValidUntilTime) :: (("BidSpotRate",float_4_opt_to_json x.f_QuotEntryAckGrp_BidSpotRate) :: (("OfferSpotRate",float_4_opt_to_json x.f_QuotEntryAckGrp_OfferSpotRate) :: (("BidForwardPoints",float_6_opt_to_json x.f_QuotEntryAckGrp_BidForwardPoints) :: (("OfferForwardPoints",float_6_opt_to_json x.f_QuotEntryAckGrp_OfferForwardPoints) :: (("MidPx",float_4_opt_to_json x.f_QuotEntryAckGrp_MidPx) :: (("BidYield",float_6_opt_to_json x.f_QuotEntryAckGrp_BidYield) :: (("MidYield",float_6_opt_to_json x.f_QuotEntryAckGrp_MidYield) :: (("OfferYield",float_6_opt_to_json x.f_QuotEntryAckGrp_OfferYield) :: (("TransactTime",utctimestamp_opt_to_json x.f_QuotEntryAckGrp_TransactTime) :: (("TradingSessionID",string_opt_to_json x.f_QuotEntryAckGrp_TradingSessionID) :: (("TradingSessionSubID",string_opt_to_json x.f_QuotEntryAckGrp_TradingSessionSubID) :: (("SettlDate",localmktdate_opt_to_json x.f_QuotEntryAckGrp_SettlDate) :: (("OrdType",ordtype_opt_to_json x.f_QuotEntryAckGrp_OrdType) :: (("SettlDate2",localmktdate_opt_to_json x.f_QuotEntryAckGrp_SettlDate2) :: (("OrderQty2",float_6_opt_to_json x.f_QuotEntryAckGrp_OrderQty2) :: (("BidForwardPoints2",float_6_opt_to_json x.f_QuotEntryAckGrp_BidForwardPoints2) :: (("OfferForwardPoints2",float_6_opt_to_json x.f_QuotEntryAckGrp_OfferForwardPoints2) :: (("Currency",currency_opt_to_json x.f_QuotEntryAckGrp_Currency) :: (("QuoteEntryRejectReason",int_opt_to_json x.f_QuotEntryAckGrp_QuoteEntryRejectReason) :: (("InstrmtLegGrp",rg_for_json instrmtleggrp_to_json x.f_QuotEntryAckGrp_InstrmtLegGrp) :: []))))))))))))))))))))))))))))
;;

let quotentrygrp_to_string (d)  =
    ""
;;

let quotentrygrp_to_json (x)  : json =
    assoc_filter_nulls (("Instrument",instrument_to_json x.f_QuotEntryGrp_Instrument) :: (("NoQuoteEntries",int_opt_to_json x.f_QuotEntryGrp_NoQuoteEntries) :: (("QuoteEntryID",string_opt_to_json x.f_QuotEntryGrp_QuoteEntryID) :: (("BidPx",float_4_opt_to_json x.f_QuotEntryGrp_BidPx) :: (("OfferPx",float_4_opt_to_json x.f_QuotEntryGrp_OfferPx) :: (("BidSize",float_6_opt_to_json x.f_QuotEntryGrp_BidSize) :: (("OfferSize",float_6_opt_to_json x.f_QuotEntryGrp_OfferSize) :: (("ValidUntilTime",utctimestamp_opt_to_json x.f_QuotEntryGrp_ValidUntilTime) :: (("BidSpotRate",float_4_opt_to_json x.f_QuotEntryGrp_BidSpotRate) :: (("OfferSpotRate",float_4_opt_to_json x.f_QuotEntryGrp_OfferSpotRate) :: (("BidForwardPoints",float_6_opt_to_json x.f_QuotEntryGrp_BidForwardPoints) :: (("OfferForwardPoints",float_6_opt_to_json x.f_QuotEntryGrp_OfferForwardPoints) :: (("MidPx",float_4_opt_to_json x.f_QuotEntryGrp_MidPx) :: (("BidYield",float_6_opt_to_json x.f_QuotEntryGrp_BidYield) :: (("MidYield",float_6_opt_to_json x.f_QuotEntryGrp_MidYield) :: (("OfferYield",float_6_opt_to_json x.f_QuotEntryGrp_OfferYield) :: (("TransactTime",utctimestamp_opt_to_json x.f_QuotEntryGrp_TransactTime) :: (("TradingSessionID",string_opt_to_json x.f_QuotEntryGrp_TradingSessionID) :: (("TradingSessionSubID",string_opt_to_json x.f_QuotEntryGrp_TradingSessionSubID) :: (("SettlDate",localmktdate_opt_to_json x.f_QuotEntryGrp_SettlDate) :: (("OrdType",ordtype_opt_to_json x.f_QuotEntryGrp_OrdType) :: (("SettlDate2",localmktdate_opt_to_json x.f_QuotEntryGrp_SettlDate2) :: (("OrderQty2",float_6_opt_to_json x.f_QuotEntryGrp_OrderQty2) :: (("BidForwardPoints2",float_6_opt_to_json x.f_QuotEntryGrp_BidForwardPoints2) :: (("OfferForwardPoints2",float_6_opt_to_json x.f_QuotEntryGrp_OfferForwardPoints2) :: (("Currency",currency_opt_to_json x.f_QuotEntryGrp_Currency) :: (("InstrmtLegGrp",rg_for_json instrmtleggrp_to_json x.f_QuotEntryGrp_InstrmtLegGrp) :: [])))))))))))))))))))))))))))
;;

let settlinstructionsdata_to_string (d)  =
    ""
;;

let settlinstructionsdata_to_json (x)  : json =
    assoc_filter_nulls (("SettlDeliveryType",settldeliverytype_opt_to_json x.f_SettlInstructionsData_SettlDeliveryType) :: (("StandInstDbType",standinstdbtype_opt_to_json x.f_SettlInstructionsData_StandInstDbType) :: (("StandInstDbName",string_opt_to_json x.f_SettlInstructionsData_StandInstDbName) :: (("StandInstDbID",string_opt_to_json x.f_SettlInstructionsData_StandInstDbID) :: (("DlvyInstGrp",rg_for_json dlvyinstgrp_to_json x.f_SettlInstructionsData_DlvyInstGrp) :: [])))))
;;

let seclistgrp_to_string (d)  =
    ""
;;

let seclistgrp_to_json (x)  : json =
    assoc_filter_nulls (("Instrument",instrument_to_json x.f_SecListGrp_Instrument) :: (("InstrumentExtension",instrumentextension_to_json x.f_SecListGrp_InstrumentExtension) :: (("FinancingDetails",financingdetails_to_json x.f_SecListGrp_FinancingDetails) :: (("SpreadOrBenchmarkCurveData",spreadorbenchmarkcurvedata_to_json x.f_SecListGrp_SpreadOrBenchmarkCurveData) :: (("YieldData",yielddata_to_json x.f_SecListGrp_YieldData) :: (("NoRelatedSym",int_opt_to_json x.f_SecListGrp_NoRelatedSym) :: (("Currency",currency_opt_to_json x.f_SecListGrp_Currency) :: (("RoundLot",float_6_opt_to_json x.f_SecListGrp_RoundLot) :: (("MinTradeVol",float_6_opt_to_json x.f_SecListGrp_MinTradeVol) :: (("TradingSessionID",string_opt_to_json x.f_SecListGrp_TradingSessionID) :: (("TradingSessionSubID",string_opt_to_json x.f_SecListGrp_TradingSessionSubID) :: (("ExpirationCycle",expirationcycle_opt_to_json x.f_SecListGrp_ExpirationCycle) :: (("Text",string_opt_to_json x.f_SecListGrp_Text) :: (("EncodedTextLen",int_opt_to_json x.f_SecListGrp_EncodedTextLen) :: (("EncodedText",string_opt_to_json x.f_SecListGrp_EncodedText) :: (("UndInstrmtGrp",rg_for_json undinstrmtgrp_to_json x.f_SecListGrp_UndInstrmtGrp) :: (("Stipulations",rg_for_json stipulations_to_json x.f_SecListGrp_Stipulations) :: (("InstrmtLegSecListGrp",rg_for_json instrmtlegseclistgrp_to_json x.f_SecListGrp_InstrmtLegSecListGrp) :: []))))))))))))))))))
;;

let quotreqrjctgrp_to_string (d)  =
    ""
;;

let quotreqrjctgrp_to_json (x)  : json =
    assoc_filter_nulls (("Instrument",instrument_to_json x.f_QuotReqRjctGrp_Instrument) :: (("FinancingDetails",financingdetails_to_json x.f_QuotReqRjctGrp_FinancingDetails) :: (("OrderQtyData",orderqtydata_to_json x.f_QuotReqRjctGrp_OrderQtyData) :: (("SpreadOrBenchmarkCurveData",spreadorbenchmarkcurvedata_to_json x.f_QuotReqRjctGrp_SpreadOrBenchmarkCurveData) :: (("YieldData",yielddata_to_json x.f_QuotReqRjctGrp_YieldData) :: (("NoRelatedSym",int_opt_to_json x.f_QuotReqRjctGrp_NoRelatedSym) :: (("PrevClosePx",float_4_opt_to_json x.f_QuotReqRjctGrp_PrevClosePx) :: (("QuoteRequestType",quoterequesttype_opt_to_json x.f_QuotReqRjctGrp_QuoteRequestType) :: (("QuoteType",quotetype_opt_to_json x.f_QuotReqRjctGrp_QuoteType) :: (("TradingSessionID",string_opt_to_json x.f_QuotReqRjctGrp_TradingSessionID) :: (("TradingSessionSubID",string_opt_to_json x.f_QuotReqRjctGrp_TradingSessionSubID) :: (("TradeOriginationDate",localmktdate_opt_to_json x.f_QuotReqRjctGrp_TradeOriginationDate) :: (("Side",side_opt_to_json x.f_QuotReqRjctGrp_Side) :: (("QtyType",qtytype_opt_to_json x.f_QuotReqRjctGrp_QtyType) :: (("SettlType",settltype_opt_to_json x.f_QuotReqRjctGrp_SettlType) :: (("SettlDate",localmktdate_opt_to_json x.f_QuotReqRjctGrp_SettlDate) :: (("SettlDate2",localmktdate_opt_to_json x.f_QuotReqRjctGrp_SettlDate2) :: (("OrderQty2",float_6_opt_to_json x.f_QuotReqRjctGrp_OrderQty2) :: (("Currency",currency_opt_to_json x.f_QuotReqRjctGrp_Currency) :: (("Account",string_opt_to_json x.f_QuotReqRjctGrp_Account) :: (("AcctIDSource",acctidsource_opt_to_json x.f_QuotReqRjctGrp_AcctIDSource) :: (("AccountType",accounttype_opt_to_json x.f_QuotReqRjctGrp_AccountType) :: (("QuotePriceType",quotepricetype_opt_to_json x.f_QuotReqRjctGrp_QuotePriceType) :: (("OrdType",ordtype_opt_to_json x.f_QuotReqRjctGrp_OrdType) :: (("ExpireTime",utctimestamp_opt_to_json x.f_QuotReqRjctGrp_ExpireTime) :: (("TransactTime",utctimestamp_opt_to_json x.f_QuotReqRjctGrp_TransactTime) :: (("PriceType",pricetype_opt_to_json x.f_QuotReqRjctGrp_PriceType) :: (("Price",float_4_opt_to_json x.f_QuotReqRjctGrp_Price) :: (("Price2",float_4_opt_to_json x.f_QuotReqRjctGrp_Price2) :: (("UndInstrmtGrp",rg_for_json undinstrmtgrp_to_json x.f_QuotReqRjctGrp_UndInstrmtGrp) :: (("Stipulations",rg_for_json stipulations_to_json x.f_QuotReqRjctGrp_Stipulations) :: (("QuotReqLegsGrp",rg_for_json quotreqlegsgrp_to_json x.f_QuotReqRjctGrp_QuotReqLegsGrp) :: (("QuotQualGrp",rg_for_json quotqualgrp_to_json x.f_QuotReqRjctGrp_QuotQualGrp) :: (("Parties",rg_for_json parties_to_json x.f_QuotReqRjctGrp_Parties) :: []))))))))))))))))))))))))))))))))))
;;

let instrmtmdreqgrp_to_string (d)  =
    ""
;;

let instrmtmdreqgrp_to_json (x)  : json =
    assoc_filter_nulls (("Instrument",instrument_to_json x.f_InstrmtMDReqGrp_Instrument) :: (("NoRelatedSym",int_opt_to_json x.f_InstrmtMDReqGrp_NoRelatedSym) :: (("UndInstrmtGrp",rg_for_json undinstrmtgrp_to_json x.f_InstrmtMDReqGrp_UndInstrmtGrp) :: (("InstrmtLegGrp",rg_for_json instrmtleggrp_to_json x.f_InstrmtMDReqGrp_InstrmtLegGrp) :: []))))
;;

let mdincgrp_to_string (d)  =
    ""
;;

let mdincgrp_to_json (x)  : json =
    assoc_filter_nulls (("Instrument",instrument_to_json x.f_MDIncGrp_Instrument) :: (("NoMDEntries",int_opt_to_json x.f_MDIncGrp_NoMDEntries) :: (("MDUpdateAction",mdupdateaction_opt_to_json x.f_MDIncGrp_MDUpdateAction) :: (("DeleteReason",deletereason_opt_to_json x.f_MDIncGrp_DeleteReason) :: (("MDEntryType",mdentrytype_opt_to_json x.f_MDIncGrp_MDEntryType) :: (("MDEntryID",string_opt_to_json x.f_MDIncGrp_MDEntryID) :: (("MDEntryRefID",string_opt_to_json x.f_MDIncGrp_MDEntryRefID) :: (("FinancialStatus",financialstatus_opt_to_json x.f_MDIncGrp_FinancialStatus) :: (("CorporateAction",corporateaction_opt_to_json x.f_MDIncGrp_CorporateAction) :: (("MDEntryPx",float_4_opt_to_json x.f_MDIncGrp_MDEntryPx) :: (("Currency",currency_opt_to_json x.f_MDIncGrp_Currency) :: (("MDEntrySize",float_6_opt_to_json x.f_MDIncGrp_MDEntrySize) :: (("MDEntryDate",utcdateonly_opt_to_json x.f_MDIncGrp_MDEntryDate) :: (("MDEntryTime",utctimeonly_opt_to_json x.f_MDIncGrp_MDEntryTime) :: (("TickDirection",tickdirection_opt_to_json x.f_MDIncGrp_TickDirection) :: (("MDMkt",exchange_opt_to_json x.f_MDIncGrp_MDMkt) :: (("TradingSessionID",string_opt_to_json x.f_MDIncGrp_TradingSessionID) :: (("TradingSessionSubID",string_opt_to_json x.f_MDIncGrp_TradingSessionSubID) :: (("QuoteCondition",quotecondition_opt_to_json x.f_MDIncGrp_QuoteCondition) :: (("TradeCondition",tradecondition_opt_to_json x.f_MDIncGrp_TradeCondition) :: (("MDEntryOriginator",string_opt_to_json x.f_MDIncGrp_MDEntryOriginator) :: (("LocationID",string_opt_to_json x.f_MDIncGrp_LocationID) :: (("DeskID",string_opt_to_json x.f_MDIncGrp_DeskID) :: (("OpenCloseSettlFlag",openclosesettlflag_opt_to_json x.f_MDIncGrp_OpenCloseSettlFlag) :: (("TimeInForce",timeinforce_opt_to_json x.f_MDIncGrp_TimeInForce) :: (("ExpireDate",localmktdate_opt_to_json x.f_MDIncGrp_ExpireDate) :: (("ExpireTime",utctimestamp_opt_to_json x.f_MDIncGrp_ExpireTime) :: (("MinQty",float_6_opt_to_json x.f_MDIncGrp_MinQty) :: (("ExecInst",execinst_opt_to_json x.f_MDIncGrp_ExecInst) :: (("SellerDays",int_opt_to_json x.f_MDIncGrp_SellerDays) :: (("OrderID",string_opt_to_json x.f_MDIncGrp_OrderID) :: (("QuoteEntryID",string_opt_to_json x.f_MDIncGrp_QuoteEntryID) :: (("MDEntryBuyer",string_opt_to_json x.f_MDIncGrp_MDEntryBuyer) :: (("MDEntrySeller",string_opt_to_json x.f_MDIncGrp_MDEntrySeller) :: (("NumberOfOrders",int_opt_to_json x.f_MDIncGrp_NumberOfOrders) :: (("MDEntryPositionNo",int_opt_to_json x.f_MDIncGrp_MDEntryPositionNo) :: (("Scope",scope_opt_to_json x.f_MDIncGrp_Scope) :: (("PriceDelta",float_opt_to_json x.f_MDIncGrp_PriceDelta) :: (("NetChgPrevDay",float_6_opt_to_json x.f_MDIncGrp_NetChgPrevDay) :: (("Text",string_opt_to_json x.f_MDIncGrp_Text) :: (("EncodedTextLen",int_opt_to_json x.f_MDIncGrp_EncodedTextLen) :: (("EncodedText",string_opt_to_json x.f_MDIncGrp_EncodedText) :: (("UndInstrmtGrp",rg_for_json undinstrmtgrp_to_json x.f_MDIncGrp_UndInstrmtGrp) :: (("InstrmtLegGrp",rg_for_json instrmtleggrp_to_json x.f_MDIncGrp_InstrmtLegGrp) :: []))))))))))))))))))))))))))))))))))))))))))))
;;

let quotreqgrp_to_string (d)  =
    ""
;;

let quotreqgrp_to_json (x)  : json =
    assoc_filter_nulls (("Instrument",instrument_to_json x.f_QuotReqGrp_Instrument) :: (("FinancingDetails",financingdetails_to_json x.f_QuotReqGrp_FinancingDetails) :: (("OrderQtyData",orderqtydata_to_json x.f_QuotReqGrp_OrderQtyData) :: (("SpreadOrBenchmarkCurveData",spreadorbenchmarkcurvedata_to_json x.f_QuotReqGrp_SpreadOrBenchmarkCurveData) :: (("YieldData",yielddata_to_json x.f_QuotReqGrp_YieldData) :: (("NoRelatedSym",int_opt_to_json x.f_QuotReqGrp_NoRelatedSym) :: (("PrevClosePx",float_4_opt_to_json x.f_QuotReqGrp_PrevClosePx) :: (("QuoteRequestType",quoterequesttype_opt_to_json x.f_QuotReqGrp_QuoteRequestType) :: (("QuoteType",quotetype_opt_to_json x.f_QuotReqGrp_QuoteType) :: (("TradingSessionID",string_opt_to_json x.f_QuotReqGrp_TradingSessionID) :: (("TradingSessionSubID",string_opt_to_json x.f_QuotReqGrp_TradingSessionSubID) :: (("TradeOriginationDate",localmktdate_opt_to_json x.f_QuotReqGrp_TradeOriginationDate) :: (("Side",side_opt_to_json x.f_QuotReqGrp_Side) :: (("QtyType",qtytype_opt_to_json x.f_QuotReqGrp_QtyType) :: (("SettlType",settltype_opt_to_json x.f_QuotReqGrp_SettlType) :: (("SettlDate",localmktdate_opt_to_json x.f_QuotReqGrp_SettlDate) :: (("SettlDate2",localmktdate_opt_to_json x.f_QuotReqGrp_SettlDate2) :: (("OrderQty2",float_6_opt_to_json x.f_QuotReqGrp_OrderQty2) :: (("Currency",currency_opt_to_json x.f_QuotReqGrp_Currency) :: (("Account",string_opt_to_json x.f_QuotReqGrp_Account) :: (("AcctIDSource",acctidsource_opt_to_json x.f_QuotReqGrp_AcctIDSource) :: (("AccountType",accounttype_opt_to_json x.f_QuotReqGrp_AccountType) :: (("QuotePriceType",quotepricetype_opt_to_json x.f_QuotReqGrp_QuotePriceType) :: (("OrdType",ordtype_opt_to_json x.f_QuotReqGrp_OrdType) :: (("ValidUntilTime",utctimestamp_opt_to_json x.f_QuotReqGrp_ValidUntilTime) :: (("ExpireTime",utctimestamp_opt_to_json x.f_QuotReqGrp_ExpireTime) :: (("TransactTime",utctimestamp_opt_to_json x.f_QuotReqGrp_TransactTime) :: (("PriceType",pricetype_opt_to_json x.f_QuotReqGrp_PriceType) :: (("Price",float_4_opt_to_json x.f_QuotReqGrp_Price) :: (("Price2",float_4_opt_to_json x.f_QuotReqGrp_Price2) :: (("UndInstrmtGrp",rg_for_json undinstrmtgrp_to_json x.f_QuotReqGrp_UndInstrmtGrp) :: (("Stipulations",rg_for_json stipulations_to_json x.f_QuotReqGrp_Stipulations) :: (("QuotReqLegsGrp",rg_for_json quotreqlegsgrp_to_json x.f_QuotReqGrp_QuotReqLegsGrp) :: (("QuotQualGrp",rg_for_json quotqualgrp_to_json x.f_QuotReqGrp_QuotQualGrp) :: (("Parties",rg_for_json parties_to_json x.f_QuotReqGrp_Parties) :: [])))))))))))))))))))))))))))))))))))
;;

let listordgrp_to_string (d)  =
    ""
;;

let listordgrp_to_json (x)  : json =
    assoc_filter_nulls (("Instrument",instrument_to_json x.f_ListOrdGrp_Instrument) :: (("OrderQtyData",orderqtydata_to_json x.f_ListOrdGrp_OrderQtyData) :: (("SpreadOrBenchmarkCurveData",spreadorbenchmarkcurvedata_to_json x.f_ListOrdGrp_SpreadOrBenchmarkCurveData) :: (("YieldData",yielddata_to_json x.f_ListOrdGrp_YieldData) :: (("CommissionData",commissiondata_to_json x.f_ListOrdGrp_CommissionData) :: (("PegInstructions",peginstructions_to_json x.f_ListOrdGrp_PegInstructions) :: (("DiscretionInstructions",discretioninstructions_to_json x.f_ListOrdGrp_DiscretionInstructions) :: (("NoOrders",int_opt_to_json x.f_ListOrdGrp_NoOrders) :: (("ClOrdID",string_opt_to_json x.f_ListOrdGrp_ClOrdID) :: (("SecondaryClOrdID",string_opt_to_json x.f_ListOrdGrp_SecondaryClOrdID) :: (("ListSeqNo",int_opt_to_json x.f_ListOrdGrp_ListSeqNo) :: (("ClOrdLinkID",string_opt_to_json x.f_ListOrdGrp_ClOrdLinkID) :: (("SettlInstMode",settlinstmode_opt_to_json x.f_ListOrdGrp_SettlInstMode) :: (("TradeOriginationDate",localmktdate_opt_to_json x.f_ListOrdGrp_TradeOriginationDate) :: (("TradeDate",localmktdate_opt_to_json x.f_ListOrdGrp_TradeDate) :: (("Account",string_opt_to_json x.f_ListOrdGrp_Account) :: (("AcctIDSource",acctidsource_opt_to_json x.f_ListOrdGrp_AcctIDSource) :: (("AccountType",accounttype_opt_to_json x.f_ListOrdGrp_AccountType) :: (("DayBookingInst",daybookinginst_opt_to_json x.f_ListOrdGrp_DayBookingInst) :: (("BookingUnit",bookingunit_opt_to_json x.f_ListOrdGrp_BookingUnit) :: (("AllocID",string_opt_to_json x.f_ListOrdGrp_AllocID) :: (("PreallocMethod",preallocmethod_opt_to_json x.f_ListOrdGrp_PreallocMethod) :: (("SettlType",settltype_opt_to_json x.f_ListOrdGrp_SettlType) :: (("SettlDate",localmktdate_opt_to_json x.f_ListOrdGrp_SettlDate) :: (("CashMargin",cashmargin_opt_to_json x.f_ListOrdGrp_CashMargin) :: (("ClearingFeeIndicator",clearingfeeindicator_opt_to_json x.f_ListOrdGrp_ClearingFeeIndicator) :: (("HandlInst",handlinst_opt_to_json x.f_ListOrdGrp_HandlInst) :: (("ExecInst",execinst_opt_to_json x.f_ListOrdGrp_ExecInst) :: (("MinQty",float_6_opt_to_json x.f_ListOrdGrp_MinQty) :: (("MaxFloor",float_6_opt_to_json x.f_ListOrdGrp_MaxFloor) :: (("ExDestination",exchange_opt_to_json x.f_ListOrdGrp_ExDestination) :: (("ProcessCode",processcode_opt_to_json x.f_ListOrdGrp_ProcessCode) :: (("PrevClosePx",float_4_opt_to_json x.f_ListOrdGrp_PrevClosePx) :: (("Side",side_opt_to_json x.f_ListOrdGrp_Side) :: (("SideValueInd",sidevalueind_opt_to_json x.f_ListOrdGrp_SideValueInd) :: (("LocateReqd",locatereqd_opt_to_json x.f_ListOrdGrp_LocateReqd) :: (("TransactTime",utctimestamp_opt_to_json x.f_ListOrdGrp_TransactTime) :: (("QtyType",qtytype_opt_to_json x.f_ListOrdGrp_QtyType) :: (("OrdType",ordtype_opt_to_json x.f_ListOrdGrp_OrdType) :: (("PriceType",pricetype_opt_to_json x.f_ListOrdGrp_PriceType) :: (("Price",float_4_opt_to_json x.f_ListOrdGrp_Price) :: (("StopPx",float_4_opt_to_json x.f_ListOrdGrp_StopPx) :: (("Currency",currency_opt_to_json x.f_ListOrdGrp_Currency) :: (("ComplianceID",string_opt_to_json x.f_ListOrdGrp_ComplianceID) :: (("SolicitedFlag",solicitedflag_opt_to_json x.f_ListOrdGrp_SolicitedFlag) :: (("IOIID",string_opt_to_json x.f_ListOrdGrp_IOIID) :: (("QuoteID",string_opt_to_json x.f_ListOrdGrp_QuoteID) :: (("TimeInForce",timeinforce_opt_to_json x.f_ListOrdGrp_TimeInForce) :: (("EffectiveTime",utctimestamp_opt_to_json x.f_ListOrdGrp_EffectiveTime) :: (("ExpireDate",localmktdate_opt_to_json x.f_ListOrdGrp_ExpireDate) :: (("ExpireTime",utctimestamp_opt_to_json x.f_ListOrdGrp_ExpireTime) :: (("GTBookingInst",gtbookinginst_opt_to_json x.f_ListOrdGrp_GTBookingInst) :: (("OrderCapacity",ordercapacity_opt_to_json x.f_ListOrdGrp_OrderCapacity) :: (("OrderRestrictions",orderrestrictions_opt_to_json x.f_ListOrdGrp_OrderRestrictions) :: (("CustOrderCapacity",custordercapacity_opt_to_json x.f_ListOrdGrp_CustOrderCapacity) :: (("ForexReq",forexreq_opt_to_json x.f_ListOrdGrp_ForexReq) :: (("SettlCurrency",currency_opt_to_json x.f_ListOrdGrp_SettlCurrency) :: (("BookingType",bookingtype_opt_to_json x.f_ListOrdGrp_BookingType) :: (("Text",string_opt_to_json x.f_ListOrdGrp_Text) :: (("EncodedTextLen",int_opt_to_json x.f_ListOrdGrp_EncodedTextLen) :: (("EncodedText",string_opt_to_json x.f_ListOrdGrp_EncodedText) :: (("SettlDate2",localmktdate_opt_to_json x.f_ListOrdGrp_SettlDate2) :: (("OrderQty2",float_6_opt_to_json x.f_ListOrdGrp_OrderQty2) :: (("Price2",float_4_opt_to_json x.f_ListOrdGrp_Price2) :: (("PositionEffect",positioneffect_opt_to_json x.f_ListOrdGrp_PositionEffect) :: (("CoveredOrUncovered",coveredoruncovered_opt_to_json x.f_ListOrdGrp_CoveredOrUncovered) :: (("MaxShow",float_6_opt_to_json x.f_ListOrdGrp_MaxShow) :: (("TargetStrategy",targetstrategy_opt_to_json x.f_ListOrdGrp_TargetStrategy) :: (("TargetStrategyParameters",string_opt_to_json x.f_ListOrdGrp_TargetStrategyParameters) :: (("ParticipationRate",float_6_opt_to_json x.f_ListOrdGrp_ParticipationRate) :: (("Designation",string_opt_to_json x.f_ListOrdGrp_Designation) :: (("Parties",rg_for_json parties_to_json x.f_ListOrdGrp_Parties) :: (("PreAllocGrp",rg_for_json preallocgrp_to_json x.f_ListOrdGrp_PreAllocGrp) :: (("TrdgSesGrp",rg_for_json trdgsesgrp_to_json x.f_ListOrdGrp_TrdgSesGrp) :: (("UndInstrmtGrp",rg_for_json undinstrmtgrp_to_json x.f_ListOrdGrp_UndInstrmtGrp) :: (("Stipulations",rg_for_json stipulations_to_json x.f_ListOrdGrp_Stipulations) :: []))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
;;

let quotcxlentriesgrp_to_string (d)  =
    ""
;;

let quotcxlentriesgrp_to_json (x)  : json =
    assoc_filter_nulls (("Instrument",instrument_to_json x.f_QuotCxlEntriesGrp_Instrument) :: (("FinancingDetails",financingdetails_to_json x.f_QuotCxlEntriesGrp_FinancingDetails) :: (("NoQuoteEntries",int_opt_to_json x.f_QuotCxlEntriesGrp_NoQuoteEntries) :: (("UndInstrmtGrp",rg_for_json undinstrmtgrp_to_json x.f_QuotCxlEntriesGrp_UndInstrmtGrp) :: (("InstrmtLegGrp",rg_for_json instrmtleggrp_to_json x.f_QuotCxlEntriesGrp_InstrmtLegGrp) :: [])))))
;;

let rfqreqgrp_to_string (d)  =
    ""
;;

let rfqreqgrp_to_json (x)  : json =
    assoc_filter_nulls (("Instrument",instrument_to_json x.f_RFQReqGrp_Instrument) :: (("NoRelatedSym",int_opt_to_json x.f_RFQReqGrp_NoRelatedSym) :: (("PrevClosePx",float_4_opt_to_json x.f_RFQReqGrp_PrevClosePx) :: (("QuoteRequestType",quoterequesttype_opt_to_json x.f_RFQReqGrp_QuoteRequestType) :: (("QuoteType",quotetype_opt_to_json x.f_RFQReqGrp_QuoteType) :: (("TradingSessionID",string_opt_to_json x.f_RFQReqGrp_TradingSessionID) :: (("TradingSessionSubID",string_opt_to_json x.f_RFQReqGrp_TradingSessionSubID) :: (("UndInstrmtGrp",rg_for_json undinstrmtgrp_to_json x.f_RFQReqGrp_UndInstrmtGrp) :: (("InstrmtLegGrp",rg_for_json instrmtleggrp_to_json x.f_RFQReqGrp_InstrmtLegGrp) :: [])))))))))
;;

let allocgrp_to_string (d)  =
    ""
;;

let allocgrp_to_json (x)  : json =
    assoc_filter_nulls (("CommissionData",commissiondata_to_json x.f_AllocGrp_CommissionData) :: (("SettlInstructionsData",settlinstructionsdata_to_json x.f_AllocGrp_SettlInstructionsData) :: (("NoAllocs",int_opt_to_json x.f_AllocGrp_NoAllocs) :: (("AllocAccount",string_opt_to_json x.f_AllocGrp_AllocAccount) :: (("AllocAcctIDSource",int_opt_to_json x.f_AllocGrp_AllocAcctIDSource) :: (("MatchStatus",matchstatus_opt_to_json x.f_AllocGrp_MatchStatus) :: (("AllocPrice",float_4_opt_to_json x.f_AllocGrp_AllocPrice) :: (("AllocQty",float_6_opt_to_json x.f_AllocGrp_AllocQty) :: (("IndividualAllocID",string_opt_to_json x.f_AllocGrp_IndividualAllocID) :: (("ProcessCode",processcode_opt_to_json x.f_AllocGrp_ProcessCode) :: (("NotifyBrokerOfCredit",notifybrokerofcredit_opt_to_json x.f_AllocGrp_NotifyBrokerOfCredit) :: (("AllocHandlInst",allochandlinst_opt_to_json x.f_AllocGrp_AllocHandlInst) :: (("AllocText",string_opt_to_json x.f_AllocGrp_AllocText) :: (("EncodedAllocTextLen",int_opt_to_json x.f_AllocGrp_EncodedAllocTextLen) :: (("EncodedAllocText",string_opt_to_json x.f_AllocGrp_EncodedAllocText) :: (("AllocAvgPx",float_4_opt_to_json x.f_AllocGrp_AllocAvgPx) :: (("AllocNetMoney",float_6_opt_to_json x.f_AllocGrp_AllocNetMoney) :: (("SettlCurrAmt",float_6_opt_to_json x.f_AllocGrp_SettlCurrAmt) :: (("AllocSettlCurrAmt",float_6_opt_to_json x.f_AllocGrp_AllocSettlCurrAmt) :: (("SettlCurrency",currency_opt_to_json x.f_AllocGrp_SettlCurrency) :: (("AllocSettlCurrency",currency_opt_to_json x.f_AllocGrp_AllocSettlCurrency) :: (("SettlCurrFxRate",float_opt_to_json x.f_AllocGrp_SettlCurrFxRate) :: (("SettlCurrFxRateCalc",settlcurrfxratecalc_opt_to_json x.f_AllocGrp_SettlCurrFxRateCalc) :: (("AllocAccruedInterestAmt",float_6_opt_to_json x.f_AllocGrp_AllocAccruedInterestAmt) :: (("AllocInterestAtMaturity",float_6_opt_to_json x.f_AllocGrp_AllocInterestAtMaturity) :: (("AllocSettlInstType",allocsettlinsttype_opt_to_json x.f_AllocGrp_AllocSettlInstType) :: (("NestedParties",rg_for_json nestedparties_to_json x.f_AllocGrp_NestedParties) :: (("MiscFeesGrp",rg_for_json miscfeesgrp_to_json x.f_AllocGrp_MiscFeesGrp) :: (("ClrInstGrp",rg_for_json clrinstgrp_to_json x.f_AllocGrp_ClrInstGrp) :: [])))))))))))))))))))))))))))))
;;

let settlinstgrp_to_string (d)  =
    ""
;;

let settlinstgrp_to_json (x)  : json =
    assoc_filter_nulls (("SettlInstructionsData",settlinstructionsdata_to_json x.f_SettlInstGrp_SettlInstructionsData) :: (("NoSettlInst",int_opt_to_json x.f_SettlInstGrp_NoSettlInst) :: (("SettlInstID",string_opt_to_json x.f_SettlInstGrp_SettlInstID) :: (("SettlInstTransType",settlinsttranstype_opt_to_json x.f_SettlInstGrp_SettlInstTransType) :: (("SettlInstRefID",string_opt_to_json x.f_SettlInstGrp_SettlInstRefID) :: (("Side",side_opt_to_json x.f_SettlInstGrp_Side) :: (("Product",product_opt_to_json x.f_SettlInstGrp_Product) :: (("SecurityType",securitytype_opt_to_json x.f_SettlInstGrp_SecurityType) :: (("CFICode",string_opt_to_json x.f_SettlInstGrp_CFICode) :: (("EffectiveTime",utctimestamp_opt_to_json x.f_SettlInstGrp_EffectiveTime) :: (("ExpireTime",utctimestamp_opt_to_json x.f_SettlInstGrp_ExpireTime) :: (("LastUpdateTime",utctimestamp_opt_to_json x.f_SettlInstGrp_LastUpdateTime) :: (("PaymentMethod",paymentmethod_opt_to_json x.f_SettlInstGrp_PaymentMethod) :: (("PaymentRef",string_opt_to_json x.f_SettlInstGrp_PaymentRef) :: (("CardHolderName",string_opt_to_json x.f_SettlInstGrp_CardHolderName) :: (("CardNumber",string_opt_to_json x.f_SettlInstGrp_CardNumber) :: (("CardStartDate",localmktdate_opt_to_json x.f_SettlInstGrp_CardStartDate) :: (("CardExpDate",localmktdate_opt_to_json x.f_SettlInstGrp_CardExpDate) :: (("CardIssNum",string_opt_to_json x.f_SettlInstGrp_CardIssNum) :: (("PaymentDate",localmktdate_opt_to_json x.f_SettlInstGrp_PaymentDate) :: (("PaymentRemitterID",string_opt_to_json x.f_SettlInstGrp_PaymentRemitterID) :: (("Parties",rg_for_json parties_to_json x.f_SettlInstGrp_Parties) :: []))))))))))))))))))))))
;;

let quotsetgrp_to_string (d)  =
    ""
;;

let quotsetgrp_to_json (x)  : json =
    assoc_filter_nulls (("UnderlyingInstrument",underlyinginstrument_to_json x.f_QuotSetGrp_UnderlyingInstrument) :: (("NoQuoteSets",int_opt_to_json x.f_QuotSetGrp_NoQuoteSets) :: (("QuoteSetID",string_opt_to_json x.f_QuotSetGrp_QuoteSetID) :: (("QuoteSetValidUntilTime",utctimestamp_opt_to_json x.f_QuotSetGrp_QuoteSetValidUntilTime) :: (("TotNoQuoteEntries",int_opt_to_json x.f_QuotSetGrp_TotNoQuoteEntries) :: (("LastFragment",lastfragment_opt_to_json x.f_QuotSetGrp_LastFragment) :: (("QuotEntryGrp",rg_for_json quotentrygrp_to_json x.f_QuotSetGrp_QuotEntryGrp) :: [])))))))
;;

let quotsetackgrp_to_string (d)  =
    ""
;;

let quotsetackgrp_to_json (x)  : json =
    assoc_filter_nulls (("UnderlyingInstrument",underlyinginstrument_to_json x.f_QuotSetAckGrp_UnderlyingInstrument) :: (("NoQuoteSets",int_opt_to_json x.f_QuotSetAckGrp_NoQuoteSets) :: (("QuoteSetID",string_opt_to_json x.f_QuotSetAckGrp_QuoteSetID) :: (("TotNoQuoteEntries",int_opt_to_json x.f_QuotSetAckGrp_TotNoQuoteEntries) :: (("LastFragment",lastfragment_opt_to_json x.f_QuotSetAckGrp_LastFragment) :: (("QuotEntryAckGrp",rg_for_json quotentryackgrp_to_json x.f_QuotSetAckGrp_QuotEntryAckGrp) :: []))))))
;;
