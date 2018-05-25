(* Aesthetic Integration copyright 2018 *)
open Base_types_json;;
open Datetime_json;;
open Full_app_enums_json;;
open Full_app_records;;
open Json_generator_utils;;
open Yojson;;

let securitydefinitionrelatedsym_to_string (d)  =
    ""
;;

let securitydefinitionrelatedsym_to_json (x)  : json =
    assoc_filter_nulls (("UnderlyingIDSource",string_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingIDSource) :: (("RatioQty",float_4_opt_to_json x.f_SecurityDefinitionRelatedSym_RatioQty) :: (("UnderlyingOptAttribute",char_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingOptAttribute) :: (("UnderlyingMaturityDay",int_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingMaturityDay) :: (("EncodedUnderlyingIssuer",string_opt_to_json x.f_SecurityDefinitionRelatedSym_EncodedUnderlyingIssuer) :: (("UnderlyingMaturityMonthYear",monthyear_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingMaturityMonthYear) :: (("NoRelatedSym",int_opt_to_json x.f_SecurityDefinitionRelatedSym_NoRelatedSym) :: (("UnderlyingCouponRate",float_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingCouponRate) :: (("UnderlyingCurrency",currency_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingCurrency) :: (("UnderlyingSecurityType",string_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingSecurityType) :: (("UnderlyingPutOrCall",int_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingPutOrCall) :: (("UnderlyingSecurityExchange",exchange_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingSecurityExchange) :: (("UnderlyingSecurityID",string_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingSecurityID) :: (("Side",side_opt_to_json x.f_SecurityDefinitionRelatedSym_Side) :: (("UnderlyingContractMultiplier",float_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingContractMultiplier) :: (("EncodedUnderlyingSecurityDescLen",int_opt_to_json x.f_SecurityDefinitionRelatedSym_EncodedUnderlyingSecurityDescLen) :: (("UnderlyingSymbolSfx",string_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingSymbolSfx) :: (("EncodedUnderlyingIssuerLen",int_opt_to_json x.f_SecurityDefinitionRelatedSym_EncodedUnderlyingIssuerLen) :: (("UnderlyingSecurityDesc",string_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingSecurityDesc) :: (("EncodedUnderlyingSecurityDesc",string_opt_to_json x.f_SecurityDefinitionRelatedSym_EncodedUnderlyingSecurityDesc) :: (("UnderlyingIssuer",string_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingIssuer) :: (("UnderlyingStrikePrice",float_4_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingStrikePrice) :: (("UnderlyingSymbol",string_opt_to_json x.f_SecurityDefinitionRelatedSym_UnderlyingSymbol) :: [])))))))))))))))))))))))
;;

let ioiioiqualifiers_to_string (d)  =
    ""
;;

let ioiioiqualifiers_to_json (x)  : json =
    assoc_filter_nulls (("NoIOIQualifiers",int_opt_to_json x.f_IOIIOIQualifiers_NoIOIQualifiers) :: (("IOIQualifier",ioiqualifier_opt_to_json x.f_IOIIOIQualifiers_IOIQualifier) :: []))
;;

let discretioninstructions_to_string (d)  =
    ""
;;

let discretioninstructions_to_json (x)  : json =
    assoc_filter_nulls (("DiscretionScope",discretionscope_opt_to_json x.f_DiscretionInstructions_DiscretionScope) :: (("DiscretionOffsetValue",float_opt_to_json x.f_DiscretionInstructions_DiscretionOffsetValue) :: (("DiscretionOffsetType",discretionoffsettype_opt_to_json x.f_DiscretionInstructions_DiscretionOffsetType) :: (("DiscretionMoveType",discretionmovetype_opt_to_json x.f_DiscretionInstructions_DiscretionMoveType) :: (("DiscretionRoundDirection",discretionrounddirection_opt_to_json x.f_DiscretionInstructions_DiscretionRoundDirection) :: (("DiscretionInst",discretioninst_opt_to_json x.f_DiscretionInstructions_DiscretionInst) :: (("DiscretionLimitType",discretionlimittype_opt_to_json x.f_DiscretionInstructions_DiscretionLimitType) :: [])))))))
;;

let compidstatgrp_to_string (d)  =
    ""
;;

let compidstatgrp_to_json (x)  : json =
    assoc_filter_nulls (("StatusText",string_opt_to_json x.f_CompIDStatGrp_StatusText) :: (("LocationID",string_opt_to_json x.f_CompIDStatGrp_LocationID) :: (("RefSubID",string_opt_to_json x.f_CompIDStatGrp_RefSubID) :: (("NoCompIDs",int_opt_to_json x.f_CompIDStatGrp_NoCompIDs) :: (("RefCompID",string_opt_to_json x.f_CompIDStatGrp_RefCompID) :: (("DeskID",string_opt_to_json x.f_CompIDStatGrp_DeskID) :: (("StatusValue",statusvalue_opt_to_json x.f_CompIDStatGrp_StatusValue) :: [])))))))
;;

let allocackgrp_to_string (d)  =
    ""
;;

let allocackgrp_to_json (x)  : json =
    assoc_filter_nulls (("AllocPrice",float_4_opt_to_json x.f_AllocAckGrp_AllocPrice) :: (("IndividualAllocID",string_opt_to_json x.f_AllocAckGrp_IndividualAllocID) :: (("NoAllocs",int_opt_to_json x.f_AllocAckGrp_NoAllocs) :: (("EncodedAllocText",string_opt_to_json x.f_AllocAckGrp_EncodedAllocText) :: (("AllocAcctIDSource",int_opt_to_json x.f_AllocAckGrp_AllocAcctIDSource) :: (("IndividualAllocRejCode",int_opt_to_json x.f_AllocAckGrp_IndividualAllocRejCode) :: (("AllocText",string_opt_to_json x.f_AllocAckGrp_AllocText) :: (("EncodedAllocTextLen",int_opt_to_json x.f_AllocAckGrp_EncodedAllocTextLen) :: (("AllocAccount",string_opt_to_json x.f_AllocAckGrp_AllocAccount) :: [])))))))))
;;

let quoteacknowledgementquotesets_to_string (d)  =
    ""
;;

let quoteacknowledgementquotesets_to_json (x)  : json =
    assoc_filter_nulls (("UnderlyingIDSource",string_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingIDSource) :: (("UnderlyingOptAttribute",char_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingOptAttribute) :: (("TotQuoteEntries",int_opt_to_json x.f_QuoteAcknowledgementQuoteSets_TotQuoteEntries) :: (("UnderlyingMaturityDay",int_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingMaturityDay) :: (("EncodedUnderlyingIssuer",string_opt_to_json x.f_QuoteAcknowledgementQuoteSets_EncodedUnderlyingIssuer) :: (("UnderlyingMaturityMonthYear",monthyear_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingMaturityMonthYear) :: (("UnderlyingCouponRate",float_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingCouponRate) :: (("UnderlyingSecurityType",string_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingSecurityType) :: (("UnderlyingPutOrCall",int_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingPutOrCall) :: (("UnderlyingSecurityExchange",exchange_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingSecurityExchange) :: (("UnderlyingSecurityID",string_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingSecurityID) :: (("QuoteSetID",string_opt_to_json x.f_QuoteAcknowledgementQuoteSets_QuoteSetID) :: (("UnderlyingContractMultiplier",float_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingContractMultiplier) :: (("EncodedUnderlyingSecurityDescLen",int_opt_to_json x.f_QuoteAcknowledgementQuoteSets_EncodedUnderlyingSecurityDescLen) :: (("UnderlyingSymbolSfx",string_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingSymbolSfx) :: (("NoQuoteSets",int_opt_to_json x.f_QuoteAcknowledgementQuoteSets_NoQuoteSets) :: (("EncodedUnderlyingIssuerLen",int_opt_to_json x.f_QuoteAcknowledgementQuoteSets_EncodedUnderlyingIssuerLen) :: (("UnderlyingSecurityDesc",string_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingSecurityDesc) :: (("EncodedUnderlyingSecurityDesc",string_opt_to_json x.f_QuoteAcknowledgementQuoteSets_EncodedUnderlyingSecurityDesc) :: (("UnderlyingIssuer",string_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingIssuer) :: (("UnderlyingStrikePrice",float_4_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingStrikePrice) :: (("UnderlyingSymbol",string_opt_to_json x.f_QuoteAcknowledgementQuoteSets_UnderlyingSymbol) :: []))))))))))))))))))))))
;;

let ordersingleallocs_to_string (d)  =
    ""
;;

let ordersingleallocs_to_json (x)  : json =
    assoc_filter_nulls (("NoAllocs",int_opt_to_json x.f_OrderSingleAllocs_NoAllocs) :: (("AllocShares",float_4_opt_to_json x.f_OrderSingleAllocs_AllocShares) :: (("AllocAccount",string_opt_to_json x.f_OrderSingleAllocs_AllocAccount) :: [])))
;;

let trdcapdtgrp_to_string (d)  =
    ""
;;

let trdcapdtgrp_to_json (x)  : json =
    assoc_filter_nulls (("TradeDate",localmktdate_opt_to_json x.f_TrdCapDtGrp_TradeDate) :: (("TransactTime",utctimestamp_opt_to_json x.f_TrdCapDtGrp_TransactTime) :: (("NoDates",int_opt_to_json x.f_TrdCapDtGrp_NoDates) :: [])))
;;

let ioiqualgrp_to_string (d)  =
    ""
;;

let ioiqualgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoIOIQualifiers",int_opt_to_json x.f_IOIQualGrp_NoIOIQualifiers) :: (("IOIQualifier",ioiqualifier_opt_to_json x.f_IOIQualGrp_IOIQualifier) :: []))
;;

let nstdptys3subgrp_to_string (d)  =
    ""
;;

let nstdptys3subgrp_to_json (x)  : json =
    assoc_filter_nulls (("Nested3PartySubID",string_opt_to_json x.f_NstdPtys3SubGrp_Nested3PartySubID) :: (("Nested3PartySubIDType",int_opt_to_json x.f_NstdPtys3SubGrp_Nested3PartySubIDType) :: (("NoNested3PartySubIDs",int_opt_to_json x.f_NstdPtys3SubGrp_NoNested3PartySubIDs) :: [])))
;;

let affectedordgrp_to_string (d)  =
    ""
;;

let affectedordgrp_to_json (x)  : json =
    assoc_filter_nulls (("AffectedSecondaryOrderID",string_opt_to_json x.f_AffectedOrdGrp_AffectedSecondaryOrderID) :: (("NoAffectedOrders",int_opt_to_json x.f_AffectedOrdGrp_NoAffectedOrders) :: (("AffectedOrderID",string_opt_to_json x.f_AffectedOrdGrp_AffectedOrderID) :: (("OrigClOrdID",string_opt_to_json x.f_AffectedOrdGrp_OrigClOrdID) :: []))))
;;

let quoteacknowledgementquoteentries_to_string (d)  =
    ""
;;

let quoteacknowledgementquoteentries_to_json (x)  : json =
    assoc_filter_nulls (("SecurityDesc",string_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_SecurityDesc) :: (("SecurityType",securitytype_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_SecurityType) :: (("SymbolSfx",string_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_SymbolSfx) :: (("CouponRate",float_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_CouponRate) :: (("Issuer",string_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_Issuer) :: (("MaturityMonthYear",monthyear_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_MaturityMonthYear) :: (("StrikePrice",float_4_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_StrikePrice) :: (("IDSource",idsource_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_IDSource) :: (("Symbol",string_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_Symbol) :: (("OptAttribute",char_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_OptAttribute) :: (("EncodedIssuer",string_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_EncodedIssuer) :: (("QuoteEntryRejectReason",quoteentryrejectreason_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_QuoteEntryRejectReason) :: (("EncodedIssuerLen",int_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_EncodedIssuerLen) :: (("QuoteEntryID",string_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_QuoteEntryID) :: (("ContractMultiplier",float_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_ContractMultiplier) :: (("EncodedSecurityDescLen",int_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_EncodedSecurityDescLen) :: (("SecurityID",string_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_SecurityID) :: (("PutOrCall",putorcall_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_PutOrCall) :: (("MaturityDay",int_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_MaturityDay) :: (("SecurityExchange",exchange_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_SecurityExchange) :: (("NoQuoteEntries",int_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_NoQuoteEntries) :: (("EncodedSecurityDesc",string_opt_to_json x.f_QuoteAcknowledgementQuoteEntries_EncodedSecurityDesc) :: []))))))))))))))))))))))
;;

let massquotequotesets_to_string (d)  =
    ""
;;

let massquotequotesets_to_json (x)  : json =
    assoc_filter_nulls (("UnderlyingIDSource",string_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingIDSource) :: (("UnderlyingOptAttribute",char_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingOptAttribute) :: (("TotQuoteEntries",int_opt_to_json x.f_MassQuoteQuoteSets_TotQuoteEntries) :: (("UnderlyingMaturityDay",int_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingMaturityDay) :: (("EncodedUnderlyingIssuer",string_opt_to_json x.f_MassQuoteQuoteSets_EncodedUnderlyingIssuer) :: (("UnderlyingMaturityMonthYear",monthyear_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingMaturityMonthYear) :: (("UnderlyingCouponRate",float_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingCouponRate) :: (("QuoteSetValidUntilTime",utctimestamp_opt_to_json x.f_MassQuoteQuoteSets_QuoteSetValidUntilTime) :: (("UnderlyingSecurityType",string_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingSecurityType) :: (("UnderlyingPutOrCall",int_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingPutOrCall) :: (("UnderlyingSecurityExchange",exchange_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingSecurityExchange) :: (("UnderlyingSecurityID",string_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingSecurityID) :: (("QuoteSetID",string_opt_to_json x.f_MassQuoteQuoteSets_QuoteSetID) :: (("UnderlyingContractMultiplier",float_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingContractMultiplier) :: (("EncodedUnderlyingSecurityDescLen",int_opt_to_json x.f_MassQuoteQuoteSets_EncodedUnderlyingSecurityDescLen) :: (("UnderlyingSymbolSfx",string_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingSymbolSfx) :: (("NoQuoteSets",int_opt_to_json x.f_MassQuoteQuoteSets_NoQuoteSets) :: (("EncodedUnderlyingIssuerLen",int_opt_to_json x.f_MassQuoteQuoteSets_EncodedUnderlyingIssuerLen) :: (("UnderlyingSecurityDesc",string_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingSecurityDesc) :: (("EncodedUnderlyingSecurityDesc",string_opt_to_json x.f_MassQuoteQuoteSets_EncodedUnderlyingSecurityDesc) :: (("UnderlyingIssuer",string_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingIssuer) :: (("UnderlyingStrikePrice",float_4_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingStrikePrice) :: (("UnderlyingSymbol",string_opt_to_json x.f_MassQuoteQuoteSets_UnderlyingSymbol) :: [])))))))))))))))))))))))
;;

let biddescreqgrp_to_string (d)  =
    ""
;;

let biddescreqgrp_to_json (x)  : json =
    assoc_filter_nulls (("LiquidityNumSecurities",int_opt_to_json x.f_BidDescReqGrp_LiquidityNumSecurities) :: (("NoBidDescriptors",int_opt_to_json x.f_BidDescReqGrp_NoBidDescriptors) :: (("LiquidityPctLow",float_4_opt_to_json x.f_BidDescReqGrp_LiquidityPctLow) :: (("FairValue",float_4_opt_to_json x.f_BidDescReqGrp_FairValue) :: (("ValueOfFutures",float_4_opt_to_json x.f_BidDescReqGrp_ValueOfFutures) :: (("BidDescriptorType",biddescriptortype_opt_to_json x.f_BidDescReqGrp_BidDescriptorType) :: (("SideValueInd",sidevalueind_opt_to_json x.f_BidDescReqGrp_SideValueInd) :: (("OutsideIndexPct",float_4_opt_to_json x.f_BidDescReqGrp_OutsideIndexPct) :: (("BidDescriptor",string_opt_to_json x.f_BidDescReqGrp_BidDescriptor) :: (("LiquidityValue",float_4_opt_to_json x.f_BidDescReqGrp_LiquidityValue) :: (("LiquidityPctHigh",float_4_opt_to_json x.f_BidDescReqGrp_LiquidityPctHigh) :: (("EFPTrackingError",float_4_opt_to_json x.f_BidDescReqGrp_EFPTrackingError) :: []))))))))))))
;;

let yielddata_to_string (d)  =
    ""
;;

let yielddata_to_json (x)  : json =
    assoc_filter_nulls (("YieldRedemptionDate",localmktdate_opt_to_json x.f_YieldData_YieldRedemptionDate) :: (("YieldType",yieldtype_opt_to_json x.f_YieldData_YieldType) :: (("YieldRedemptionPriceType",int_opt_to_json x.f_YieldData_YieldRedemptionPriceType) :: (("YieldCalcDate",localmktdate_opt_to_json x.f_YieldData_YieldCalcDate) :: (("YieldRedemptionPrice",float_4_opt_to_json x.f_YieldData_YieldRedemptionPrice) :: (("Yield",float_4_opt_to_json x.f_YieldData_Yield) :: []))))))
;;

let legstipulations_to_string (d)  =
    ""
;;

let legstipulations_to_json (x)  : json =
    assoc_filter_nulls (("NoLegStipulations",int_opt_to_json x.f_LegStipulations_NoLegStipulations) :: (("LegStipulationType",string_opt_to_json x.f_LegStipulations_LegStipulationType) :: (("LegStipulationValue",string_opt_to_json x.f_LegStipulations_LegStipulationValue) :: [])))
;;

let newslinesoftext_to_string (d)  =
    ""
;;

let newslinesoftext_to_json (x)  : json =
    assoc_filter_nulls (("LinesOfText",int_opt_to_json x.f_NewsLinesOfText_LinesOfText) :: (("EncodedTextLen",int_opt_to_json x.f_NewsLinesOfText_EncodedTextLen) :: (("EncodedText",string_opt_to_json x.f_NewsLinesOfText_EncodedText) :: (("Text",string_opt_to_json x.f_NewsLinesOfText_Text) :: []))))
;;

let compidreqgrp_to_string (d)  =
    ""
;;

let compidreqgrp_to_json (x)  : json =
    assoc_filter_nulls (("LocationID",string_opt_to_json x.f_CompIDReqGrp_LocationID) :: (("RefSubID",string_opt_to_json x.f_CompIDReqGrp_RefSubID) :: (("NoCompIDs",int_opt_to_json x.f_CompIDReqGrp_NoCompIDs) :: (("RefCompID",string_opt_to_json x.f_CompIDReqGrp_RefCompID) :: (("DeskID",string_opt_to_json x.f_CompIDReqGrp_DeskID) :: [])))))
;;

let evntgrp_to_string (d)  =
    ""
;;

let evntgrp_to_json (x)  : json =
    assoc_filter_nulls (("EventType",eventtype_opt_to_json x.f_EvntGrp_EventType) :: (("NoEvents",int_opt_to_json x.f_EvntGrp_NoEvents) :: (("EventText",string_opt_to_json x.f_EvntGrp_EventText) :: (("EventDate",localmktdate_opt_to_json x.f_EvntGrp_EventDate) :: (("EventPx",float_4_opt_to_json x.f_EvntGrp_EventPx) :: [])))))
;;

let quotqualgrp_to_string (d)  =
    ""
;;

let quotqualgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoQuoteQualifiers",int_opt_to_json x.f_QuotQualGrp_NoQuoteQualifiers) :: (("QuoteQualifier",char_opt_to_json x.f_QuotQualGrp_QuoteQualifier) :: []))
;;

let ordercancelreplacerequesttradingsessions_to_string (d)  =
    ""
;;

let ordercancelreplacerequesttradingsessions_to_json (x)  : json =
    assoc_filter_nulls (("NoTradingSessions",int_opt_to_json x.f_OrderCancelReplaceRequestTradingSessions_NoTradingSessions) :: (("TradingSessionID",string_opt_to_json x.f_OrderCancelReplaceRequestTradingSessions_TradingSessionID) :: []))
;;

let trdcollgrp_to_string (d)  =
    ""
;;

let trdcollgrp_to_json (x)  : json =
    assoc_filter_nulls (("SecondaryTradeReportID",string_opt_to_json x.f_TrdCollGrp_SecondaryTradeReportID) :: (("NoTrades",int_opt_to_json x.f_TrdCollGrp_NoTrades) :: (("TradeReportID",string_opt_to_json x.f_TrdCollGrp_TradeReportID) :: [])))
;;

let settlptyssubgrp_to_string (d)  =
    ""
;;

let settlptyssubgrp_to_json (x)  : json =
    assoc_filter_nulls (("SettlPartySubIDType",int_opt_to_json x.f_SettlPtysSubGrp_SettlPartySubIDType) :: (("NoSettlPartySubIDs",int_opt_to_json x.f_SettlPtysSubGrp_NoSettlPartySubIDs) :: (("SettlPartySubID",string_opt_to_json x.f_SettlPtysSubGrp_SettlPartySubID) :: [])))
;;

let legbenchmarkcurvedata_to_string (d)  =
    ""
;;

let legbenchmarkcurvedata_to_json (x)  : json =
    assoc_filter_nulls (("LegBenchmarkPriceType",int_opt_to_json x.f_LegBenchmarkCurveData_LegBenchmarkPriceType) :: (("LegBenchmarkCurveCurrency",currency_opt_to_json x.f_LegBenchmarkCurveData_LegBenchmarkCurveCurrency) :: (("LegBenchmarkCurvePoint",string_opt_to_json x.f_LegBenchmarkCurveData_LegBenchmarkCurvePoint) :: (("LegBenchmarkCurveName",string_opt_to_json x.f_LegBenchmarkCurveData_LegBenchmarkCurveName) :: (("LegBenchmarkPrice",float_4_opt_to_json x.f_LegBenchmarkCurveData_LegBenchmarkPrice) :: [])))))
;;

let bidcompreqgrp_to_string (d)  =
    ""
;;

let bidcompreqgrp_to_json (x)  : json =
    assoc_filter_nulls (("Account",string_opt_to_json x.f_BidCompReqGrp_Account) :: (("AcctIDSource",acctidsource_opt_to_json x.f_BidCompReqGrp_AcctIDSource) :: (("Side",side_opt_to_json x.f_BidCompReqGrp_Side) :: (("TradingSessionSubID",string_opt_to_json x.f_BidCompReqGrp_TradingSessionSubID) :: (("NoBidComponents",int_opt_to_json x.f_BidCompReqGrp_NoBidComponents) :: (("ListID",string_opt_to_json x.f_BidCompReqGrp_ListID) :: (("SettlType",settltype_opt_to_json x.f_BidCompReqGrp_SettlType) :: (("SettlDate",localmktdate_opt_to_json x.f_BidCompReqGrp_SettlDate) :: (("TradingSessionID",string_opt_to_json x.f_BidCompReqGrp_TradingSessionID) :: (("NetGrossInd",netgrossind_opt_to_json x.f_BidCompReqGrp_NetGrossInd) :: []))))))))))
;;

let collinqqualgrp_to_string (d)  =
    ""
;;

let collinqqualgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoCollInquiryQualifier",int_opt_to_json x.f_CollInqQualGrp_NoCollInquiryQualifier) :: (("CollInquiryQualifier",collinquiryqualifier_opt_to_json x.f_CollInqQualGrp_CollInquiryQualifier) :: []))
;;

let quoterequestrelatedsym_to_string (d)  =
    ""
;;

let quoterequestrelatedsym_to_json (x)  : json =
    assoc_filter_nulls (("SecurityDesc",string_opt_to_json x.f_QuoteRequestRelatedSym_SecurityDesc) :: (("CouponRate",float_opt_to_json x.f_QuoteRequestRelatedSym_CouponRate) :: (("StrikePrice",float_4_opt_to_json x.f_QuoteRequestRelatedSym_StrikePrice) :: (("NoRelatedSym",int_opt_to_json x.f_QuoteRequestRelatedSym_NoRelatedSym) :: (("OrdType",ordtype_opt_to_json x.f_QuoteRequestRelatedSym_OrdType) :: (("OptAttribute",char_opt_to_json x.f_QuoteRequestRelatedSym_OptAttribute) :: (("QuoteRequestType",quoterequesttype_opt_to_json x.f_QuoteRequestRelatedSym_QuoteRequestType) :: (("EncodedIssuerLen",int_opt_to_json x.f_QuoteRequestRelatedSym_EncodedIssuerLen) :: (("ContractMultiplier",float_opt_to_json x.f_QuoteRequestRelatedSym_ContractMultiplier) :: (("EncodedSecurityDescLen",int_opt_to_json x.f_QuoteRequestRelatedSym_EncodedSecurityDescLen) :: (("PutOrCall",putorcall_opt_to_json x.f_QuoteRequestRelatedSym_PutOrCall) :: (("FutSettDate2",localmktdate_opt_to_json x.f_QuoteRequestRelatedSym_FutSettDate2) :: (("ExpireTime",utctimestamp_opt_to_json x.f_QuoteRequestRelatedSym_ExpireTime) :: (("MaturityDay",int_opt_to_json x.f_QuoteRequestRelatedSym_MaturityDay) :: (("SecurityType",securitytype_opt_to_json x.f_QuoteRequestRelatedSym_SecurityType) :: (("SymbolSfx",string_opt_to_json x.f_QuoteRequestRelatedSym_SymbolSfx) :: (("FutSettDate",localmktdate_opt_to_json x.f_QuoteRequestRelatedSym_FutSettDate) :: (("Issuer",string_opt_to_json x.f_QuoteRequestRelatedSym_Issuer) :: (("MaturityMonthYear",monthyear_opt_to_json x.f_QuoteRequestRelatedSym_MaturityMonthYear) :: (("IDSource",idsource_opt_to_json x.f_QuoteRequestRelatedSym_IDSource) :: (("Symbol",string_opt_to_json x.f_QuoteRequestRelatedSym_Symbol) :: (("EncodedIssuer",string_opt_to_json x.f_QuoteRequestRelatedSym_EncodedIssuer) :: (("TradingSessionID",string_opt_to_json x.f_QuoteRequestRelatedSym_TradingSessionID) :: (("OrderQty",float_4_opt_to_json x.f_QuoteRequestRelatedSym_OrderQty) :: (("TransactTime",utctimestamp_opt_to_json x.f_QuoteRequestRelatedSym_TransactTime) :: (("OrderQty2",float_4_opt_to_json x.f_QuoteRequestRelatedSym_OrderQty2) :: (("Side",side_opt_to_json x.f_QuoteRequestRelatedSym_Side) :: (("Currency",currency_opt_to_json x.f_QuoteRequestRelatedSym_Currency) :: (("SecurityID",string_opt_to_json x.f_QuoteRequestRelatedSym_SecurityID) :: (("PrevClosePx",float_4_opt_to_json x.f_QuoteRequestRelatedSym_PrevClosePx) :: (("SecurityExchange",exchange_opt_to_json x.f_QuoteRequestRelatedSym_SecurityExchange) :: (("EncodedSecurityDesc",string_opt_to_json x.f_QuoteRequestRelatedSym_EncodedSecurityDesc) :: []))))))))))))))))))))))))))))))))
;;

let orderlistorders_to_string (d)  =
    ""
;;

let orderlistorders_to_json (x)  : json =
    assoc_filter_nulls (("SolicitedFlag",solicitedflag_opt_to_json x.f_OrderListOrders_SolicitedFlag) :: (("ClearingFirm",string_opt_to_json x.f_OrderListOrders_ClearingFirm) :: (("SideValueInd",int_opt_to_json x.f_OrderListOrders_SideValueInd) :: (("OrdType",ordtype_opt_to_json x.f_OrderListOrders_OrdType) :: (("MaxShow",float_4_opt_to_json x.f_OrderListOrders_MaxShow) :: (("OptAttribute",char_opt_to_json x.f_OrderListOrders_OptAttribute) :: (("PegDifference",float_4_opt_to_json x.f_OrderListOrders_PegDifference) :: (("MaxFloor",float_4_opt_to_json x.f_OrderListOrders_MaxFloor) :: (("ProcessCode",processcode_opt_to_json x.f_OrderListOrders_ProcessCode) :: (("EncodedIssuerLen",int_opt_to_json x.f_OrderListOrders_EncodedIssuerLen) :: (("CustomerOrFirm",customerorfirm_opt_to_json x.f_OrderListOrders_CustomerOrFirm) :: (("EncodedSecurityDescLen",int_opt_to_json x.f_OrderListOrders_EncodedSecurityDescLen) :: (("ClientID",string_opt_to_json x.f_OrderListOrders_ClientID) :: (("PutOrCall",putorcall_opt_to_json x.f_OrderListOrders_PutOrCall) :: (("GTBookingInst",gtbookinginst_opt_to_json x.f_OrderListOrders_GTBookingInst) :: (("ExDestination",exchange_opt_to_json x.f_OrderListOrders_ExDestination) :: (("MaturityDay",int_opt_to_json x.f_OrderListOrders_MaturityDay) :: (("Account",string_opt_to_json x.f_OrderListOrders_Account) :: (("SecurityType",securitytype_opt_to_json x.f_OrderListOrders_SecurityType) :: (("EffectiveTime",utctimestamp_opt_to_json x.f_OrderListOrders_EffectiveTime) :: (("FutSettDate",localmktdate_opt_to_json x.f_OrderListOrders_FutSettDate) :: (("MinQty",float_4_opt_to_json x.f_OrderListOrders_MinQty) :: (("ExpireDate",localmktdate_opt_to_json x.f_OrderListOrders_ExpireDate) :: (("Symbol",string_opt_to_json x.f_OrderListOrders_Symbol) :: (("Commission",float_4_opt_to_json x.f_OrderListOrders_Commission) :: (("OrderQty",float_4_opt_to_json x.f_OrderListOrders_OrderQty) :: (("TransactTime",utctimestamp_opt_to_json x.f_OrderListOrders_TransactTime) :: (("OrderQty2",float_4_opt_to_json x.f_OrderListOrders_OrderQty2) :: (("Side",side_opt_to_json x.f_OrderListOrders_Side) :: (("EncodedTextLen",int_opt_to_json x.f_OrderListOrders_EncodedTextLen) :: (("ForexReq",forexreq_opt_to_json x.f_OrderListOrders_ForexReq) :: (("TimeInForce",timeinforce_opt_to_json x.f_OrderListOrders_TimeInForce) :: (("ComplianceID",string_opt_to_json x.f_OrderListOrders_ComplianceID) :: (("SecurityID",string_opt_to_json x.f_OrderListOrders_SecurityID) :: (("PrevClosePx",float_4_opt_to_json x.f_OrderListOrders_PrevClosePx) :: (("ExecInst",execinst_opt_to_json x.f_OrderListOrders_ExecInst) :: (("SecurityExchange",exchange_opt_to_json x.f_OrderListOrders_SecurityExchange) :: (("SecurityDesc",string_opt_to_json x.f_OrderListOrders_SecurityDesc) :: (("SettlInstMode",settlinstmode_opt_to_json x.f_OrderListOrders_SettlInstMode) :: (("OpenClose",openclose_opt_to_json x.f_OrderListOrders_OpenClose) :: (("CouponRate",float_opt_to_json x.f_OrderListOrders_CouponRate) :: (("QuoteID",string_opt_to_json x.f_OrderListOrders_QuoteID) :: (("StrikePrice",float_4_opt_to_json x.f_OrderListOrders_StrikePrice) :: (("LocateReqd",locatereqd_opt_to_json x.f_OrderListOrders_LocateReqd) :: (("CashOrderQty",float_4_opt_to_json x.f_OrderListOrders_CashOrderQty) :: (("ClOrdID",string_opt_to_json x.f_OrderListOrders_ClOrdID) :: (("Rule80A",rule80a_opt_to_json x.f_OrderListOrders_Rule80A) :: (("Text",string_opt_to_json x.f_OrderListOrders_Text) :: (("ListSeqNo",int_opt_to_json x.f_OrderListOrders_ListSeqNo) :: (("CommType",commtype_opt_to_json x.f_OrderListOrders_CommType) :: (("ExecBroker",string_opt_to_json x.f_OrderListOrders_ExecBroker) :: (("StopPx",float_4_opt_to_json x.f_OrderListOrders_StopPx) :: (("Price",float_4_opt_to_json x.f_OrderListOrders_Price) :: (("ContractMultiplier",float_opt_to_json x.f_OrderListOrders_ContractMultiplier) :: (("ExpireTime",utctimestamp_opt_to_json x.f_OrderListOrders_ExpireTime) :: (("FutSettDate2",localmktdate_opt_to_json x.f_OrderListOrders_FutSettDate2) :: (("CoveredOrUncovered",coveredoruncovered_opt_to_json x.f_OrderListOrders_CoveredOrUncovered) :: (("SymbolSfx",string_opt_to_json x.f_OrderListOrders_SymbolSfx) :: (("Issuer",string_opt_to_json x.f_OrderListOrders_Issuer) :: (("MaturityMonthYear",monthyear_opt_to_json x.f_OrderListOrders_MaturityMonthYear) :: (("IDSource",idsource_opt_to_json x.f_OrderListOrders_IDSource) :: (("EncodedText",string_opt_to_json x.f_OrderListOrders_EncodedText) :: (("EncodedIssuer",string_opt_to_json x.f_OrderListOrders_EncodedIssuer) :: (("DiscretionInst",discretioninst_opt_to_json x.f_OrderListOrders_DiscretionInst) :: (("DiscretionOffset",float_4_opt_to_json x.f_OrderListOrders_DiscretionOffset) :: (("IOIid",string_opt_to_json x.f_OrderListOrders_IOIid) :: (("SettlCurrency",currency_opt_to_json x.f_OrderListOrders_SettlCurrency) :: (("ClearingAccount",string_opt_to_json x.f_OrderListOrders_ClearingAccount) :: (("NoOrders",int_opt_to_json x.f_OrderListOrders_NoOrders) :: (("Currency",currency_opt_to_json x.f_OrderListOrders_Currency) :: (("HandlInst",handlinst_opt_to_json x.f_OrderListOrders_HandlInst) :: (("SettlmntTyp",settlmnttyp_opt_to_json x.f_OrderListOrders_SettlmntTyp) :: (("EncodedSecurityDesc",string_opt_to_json x.f_OrderListOrders_EncodedSecurityDesc) :: [])))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
;;

let spreadorbenchmarkcurvedata_to_string (d)  =
    ""
;;

let spreadorbenchmarkcurvedata_to_json (x)  : json =
    assoc_filter_nulls (("BenchmarkPrice",float_4_opt_to_json x.f_SpreadOrBenchmarkCurveData_BenchmarkPrice) :: (("BenchmarkCurveName",string_opt_to_json x.f_SpreadOrBenchmarkCurveData_BenchmarkCurveName) :: (("Spread",float_4_opt_to_json x.f_SpreadOrBenchmarkCurveData_Spread) :: (("BenchmarkPriceType",int_opt_to_json x.f_SpreadOrBenchmarkCurveData_BenchmarkPriceType) :: (("BenchmarkCurvePoint",string_opt_to_json x.f_SpreadOrBenchmarkCurveData_BenchmarkCurvePoint) :: (("BenchmarkSecurityID",string_opt_to_json x.f_SpreadOrBenchmarkCurveData_BenchmarkSecurityID) :: (("BenchmarkSecurityIDSource",string_opt_to_json x.f_SpreadOrBenchmarkCurveData_BenchmarkSecurityIDSource) :: (("BenchmarkCurveCurrency",currency_opt_to_json x.f_SpreadOrBenchmarkCurveData_BenchmarkCurveCurrency) :: []))))))))
;;

let undsecaltidgrp_to_string (d)  =
    ""
;;

let undsecaltidgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoUnderlyingSecurityAltID",int_opt_to_json x.f_UndSecAltIDGrp_NoUnderlyingSecurityAltID) :: (("UnderlyingSecurityAltID",string_opt_to_json x.f_UndSecAltIDGrp_UnderlyingSecurityAltID) :: (("UnderlyingSecurityAltIDSource",string_opt_to_json x.f_UndSecAltIDGrp_UnderlyingSecurityAltIDSource) :: [])))
;;

let rgstdistinstgrp_to_string (d)  =
    ""
;;

let rgstdistinstgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoDistribInsts",int_opt_to_json x.f_RgstDistInstGrp_NoDistribInsts) :: (("CashDistribAgentCode",string_opt_to_json x.f_RgstDistInstGrp_CashDistribAgentCode) :: (("CashDistribPayRef",string_opt_to_json x.f_RgstDistInstGrp_CashDistribPayRef) :: (("CashDistribAgentAcctNumber",string_opt_to_json x.f_RgstDistInstGrp_CashDistribAgentAcctNumber) :: (("DistribPaymentMethod",distribpaymentmethod_opt_to_json x.f_RgstDistInstGrp_DistribPaymentMethod) :: (("CashDistribCurr",currency_opt_to_json x.f_RgstDistInstGrp_CashDistribCurr) :: (("CashDistribAgentName",string_opt_to_json x.f_RgstDistInstGrp_CashDistribAgentName) :: (("DistribPercentage",float_4_opt_to_json x.f_RgstDistInstGrp_DistribPercentage) :: (("CashDistribAgentAcctName",string_opt_to_json x.f_RgstDistInstGrp_CashDistribAgentAcctName) :: [])))))))))
;;

let emaillinesoftext_to_string (d)  =
    ""
;;

let emaillinesoftext_to_json (x)  : json =
    assoc_filter_nulls (("LinesOfText",int_opt_to_json x.f_EmailLinesOfText_LinesOfText) :: (("EncodedTextLen",int_opt_to_json x.f_EmailLinesOfText_EncodedTextLen) :: (("EncodedText",string_opt_to_json x.f_EmailLinesOfText_EncodedText) :: (("Text",string_opt_to_json x.f_EmailLinesOfText_Text) :: []))))
;;

let mdreqgrp_to_string (d)  =
    ""
;;

let mdreqgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoMDEntryTypes",int_opt_to_json x.f_MDReqGrp_NoMDEntryTypes) :: (("MDEntryType",mdentrytype_opt_to_json x.f_MDReqGrp_MDEntryType) :: []))
;;

let marketdatarequestmdentrytypes_to_string (d)  =
    ""
;;

let marketdatarequestmdentrytypes_to_json (x)  : json =
    assoc_filter_nulls (("NoMDEntryTypes",int_opt_to_json x.f_MarketDataRequestMDEntryTypes_NoMDEntryTypes) :: (("MDEntryType",mdentrytype_opt_to_json x.f_MarketDataRequestMDEntryTypes_MDEntryType) :: []))
;;

let peginstructions_to_string (d)  =
    ""
;;

let peginstructions_to_json (x)  : json =
    assoc_filter_nulls (("PegOffsetValue",float_opt_to_json x.f_PegInstructions_PegOffsetValue) :: (("PegMoveType",pegmovetype_opt_to_json x.f_PegInstructions_PegMoveType) :: (("PegLimitType",peglimittype_opt_to_json x.f_PegInstructions_PegLimitType) :: (("PegScope",pegscope_opt_to_json x.f_PegInstructions_PegScope) :: (("PegRoundDirection",pegrounddirection_opt_to_json x.f_PegInstructions_PegRoundDirection) :: (("PegOffsetType",pegoffsettype_opt_to_json x.f_PegInstructions_PegOffsetType) :: []))))))
;;

let execsgrp_to_string (d)  =
    ""
;;

let execsgrp_to_json (x)  : json =
    assoc_filter_nulls (("ExecID",string_opt_to_json x.f_ExecsGrp_ExecID) :: (("NoExecs",int_opt_to_json x.f_ExecsGrp_NoExecs) :: []))
;;

let cpctyconfgrp_to_string (d)  =
    ""
;;

let cpctyconfgrp_to_json (x)  : json =
    assoc_filter_nulls (("OrderCapacity",ordercapacity_opt_to_json x.f_CpctyConfGrp_OrderCapacity) :: (("NoCapacities",int_opt_to_json x.f_CpctyConfGrp_NoCapacities) :: (("OrderCapacityQty",float_4_opt_to_json x.f_CpctyConfGrp_OrderCapacityQty) :: (("OrderRestrictions",orderrestrictions_opt_to_json x.f_CpctyConfGrp_OrderRestrictions) :: []))))
;;

let allocationexecs_to_string (d)  =
    ""
;;

let allocationexecs_to_json (x)  : json =
    assoc_filter_nulls (("LastPx",float_4_opt_to_json x.f_AllocationExecs_LastPx) :: (("ExecID",string_opt_to_json x.f_AllocationExecs_ExecID) :: (("NoExecs",int_opt_to_json x.f_AllocationExecs_NoExecs) :: (("LastShares",float_4_opt_to_json x.f_AllocationExecs_LastShares) :: (("LastCapacity",lastcapacity_opt_to_json x.f_AllocationExecs_LastCapacity) :: [])))))
;;

let trdgsesgrp_to_string (d)  =
    ""
;;

let trdgsesgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoTradingSessions",int_opt_to_json x.f_TrdgSesGrp_NoTradingSessions) :: (("TradingSessionSubID",string_opt_to_json x.f_TrdgSesGrp_TradingSessionSubID) :: (("TradingSessionID",string_opt_to_json x.f_TrdgSesGrp_TradingSessionID) :: [])))
;;

let interval_to_string (d)  =
    ""
;;

let interval_to_json (x)  : json =
    assoc_filter_nulls (("start_time",utctimestamp_opt_to_json x.f_interval_start_time) :: (("duration",duration_opt_to_json x.f_interval_duration) :: []))
;;

let allocationorders_to_string (d)  =
    ""
;;

let allocationorders_to_json (x)  : json =
    assoc_filter_nulls (("ListID",string_opt_to_json x.f_AllocationOrders_ListID) :: (("NoOrders",int_opt_to_json x.f_AllocationOrders_NoOrders) :: (("SecondaryOrderID",string_opt_to_json x.f_AllocationOrders_SecondaryOrderID) :: (("ClOrdID",string_opt_to_json x.f_AllocationOrders_ClOrdID) :: (("WaveNo",string_opt_to_json x.f_AllocationOrders_WaveNo) :: (("OrderID",string_opt_to_json x.f_AllocationOrders_OrderID) :: []))))))
;;

let underlyingstipulations_to_string (d)  =
    ""
;;

let underlyingstipulations_to_json (x)  : json =
    assoc_filter_nulls (("NoUnderlyingStips",int_opt_to_json x.f_UnderlyingStipulations_NoUnderlyingStips) :: (("UnderlyingStipValue",string_opt_to_json x.f_UnderlyingStipulations_UnderlyingStipValue) :: (("UnderlyingStipType",string_opt_to_json x.f_UnderlyingStipulations_UnderlyingStipType) :: [])))
;;

let ioiroutingids_to_string (d)  =
    ""
;;

let ioiroutingids_to_json (x)  : json =
    assoc_filter_nulls (("RoutingType",routingtype_opt_to_json x.f_IOIRoutingIDs_RoutingType) :: (("NoRoutingIDs",int_opt_to_json x.f_IOIRoutingIDs_NoRoutingIDs) :: (("RoutingID",string_opt_to_json x.f_IOIRoutingIDs_RoutingID) :: [])))
;;

let newsrelatedsym_to_string (d)  =
    ""
;;

let newsrelatedsym_to_json (x)  : json =
    assoc_filter_nulls (("SecurityDesc",string_opt_to_json x.f_NewsRelatedSym_SecurityDesc) :: (("SecurityType",securitytype_opt_to_json x.f_NewsRelatedSym_SecurityType) :: (("SymbolSfx",string_opt_to_json x.f_NewsRelatedSym_SymbolSfx) :: (("CouponRate",float_opt_to_json x.f_NewsRelatedSym_CouponRate) :: (("Issuer",string_opt_to_json x.f_NewsRelatedSym_Issuer) :: (("MaturityMonthYear",monthyear_opt_to_json x.f_NewsRelatedSym_MaturityMonthYear) :: (("StrikePrice",float_4_opt_to_json x.f_NewsRelatedSym_StrikePrice) :: (("NoRelatedSym",int_opt_to_json x.f_NewsRelatedSym_NoRelatedSym) :: (("IDSource",idsource_opt_to_json x.f_NewsRelatedSym_IDSource) :: (("OptAttribute",char_opt_to_json x.f_NewsRelatedSym_OptAttribute) :: (("EncodedIssuer",string_opt_to_json x.f_NewsRelatedSym_EncodedIssuer) :: (("EncodedIssuerLen",int_opt_to_json x.f_NewsRelatedSym_EncodedIssuerLen) :: (("RelatdSym",string_opt_to_json x.f_NewsRelatedSym_RelatdSym) :: (("ContractMultiplier",float_opt_to_json x.f_NewsRelatedSym_ContractMultiplier) :: (("EncodedSecurityDescLen",int_opt_to_json x.f_NewsRelatedSym_EncodedSecurityDescLen) :: (("SecurityID",string_opt_to_json x.f_NewsRelatedSym_SecurityID) :: (("PutOrCall",putorcall_opt_to_json x.f_NewsRelatedSym_PutOrCall) :: (("MaturityDay",int_opt_to_json x.f_NewsRelatedSym_MaturityDay) :: (("SecurityExchange",exchange_opt_to_json x.f_NewsRelatedSym_SecurityExchange) :: (("EncodedSecurityDesc",string_opt_to_json x.f_NewsRelatedSym_EncodedSecurityDesc) :: []))))))))))))))))))))
;;

let clrinstgrp_to_string (d)  =
    ""
;;

let clrinstgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoClearingInstructions",int_opt_to_json x.f_ClrInstGrp_NoClearingInstructions) :: (("ClearingInstruction",clearinginstruction_opt_to_json x.f_ClrInstGrp_ClearingInstruction) :: []))
;;

let mdfullgrp_to_string (d)  =
    ""
;;

let mdfullgrp_to_json (x)  : json =
    assoc_filter_nulls (("MDMkt",exchange_opt_to_json x.f_MDFullGrp_MDMkt) :: (("Text",string_opt_to_json x.f_MDFullGrp_Text) :: (("MDEntryTime",utctimeonly_opt_to_json x.f_MDFullGrp_MDEntryTime) :: (("TradeCondition",tradecondition_opt_to_json x.f_MDFullGrp_TradeCondition) :: (("NoMDEntries",int_opt_to_json x.f_MDFullGrp_NoMDEntries) :: (("TradingSessionSubID",string_opt_to_json x.f_MDFullGrp_TradingSessionSubID) :: (("NumberOfOrders",int_opt_to_json x.f_MDFullGrp_NumberOfOrders) :: (("MDEntrySeller",string_opt_to_json x.f_MDFullGrp_MDEntrySeller) :: (("Scope",scope_opt_to_json x.f_MDFullGrp_Scope) :: (("MDEntryPositionNo",int_opt_to_json x.f_MDFullGrp_MDEntryPositionNo) :: (("SellerDays",int_opt_to_json x.f_MDFullGrp_SellerDays) :: (("ExpireTime",utctimestamp_opt_to_json x.f_MDFullGrp_ExpireTime) :: (("MDEntryPx",float_4_opt_to_json x.f_MDFullGrp_MDEntryPx) :: (("MinQty",float_4_opt_to_json x.f_MDFullGrp_MinQty) :: (("ExpireDate",localmktdate_opt_to_json x.f_MDFullGrp_ExpireDate) :: (("EncodedText",string_opt_to_json x.f_MDFullGrp_EncodedText) :: (("MDEntryDate",utcdateonly_opt_to_json x.f_MDFullGrp_MDEntryDate) :: (("TradingSessionID",string_opt_to_json x.f_MDFullGrp_TradingSessionID) :: (("OrderID",string_opt_to_json x.f_MDFullGrp_OrderID) :: (("OpenCloseSettlFlag",openclosesettlflag_opt_to_json x.f_MDFullGrp_OpenCloseSettlFlag) :: (("MDEntrySize",float_4_opt_to_json x.f_MDFullGrp_MDEntrySize) :: (("TickDirection",tickdirection_opt_to_json x.f_MDFullGrp_TickDirection) :: (("EncodedTextLen",int_opt_to_json x.f_MDFullGrp_EncodedTextLen) :: (("MDEntryBuyer",string_opt_to_json x.f_MDFullGrp_MDEntryBuyer) :: (("QuoteCondition",quotecondition_opt_to_json x.f_MDFullGrp_QuoteCondition) :: (("MDEntryOriginator",string_opt_to_json x.f_MDFullGrp_MDEntryOriginator) :: (("Currency",currency_opt_to_json x.f_MDFullGrp_Currency) :: (("TimeInForce",timeinforce_opt_to_json x.f_MDFullGrp_TimeInForce) :: (("PriceDelta",float_opt_to_json x.f_MDFullGrp_PriceDelta) :: (("LocationID",string_opt_to_json x.f_MDFullGrp_LocationID) :: (("QuoteEntryID",string_opt_to_json x.f_MDFullGrp_QuoteEntryID) :: (("ExecInst",execinst_opt_to_json x.f_MDFullGrp_ExecInst) :: (("DeskID",string_opt_to_json x.f_MDFullGrp_DeskID) :: (("MDEntryType",mdentrytype_opt_to_json x.f_MDFullGrp_MDEntryType) :: []))))))))))))))))))))))))))))))))))
;;

let allocationallocs_to_string (d)  =
    ""
;;

let allocationallocs_to_json (x)  : json =
    assoc_filter_nulls (("SettlCurrFxRate",float_opt_to_json x.f_AllocationAllocs_SettlCurrFxRate) :: (("NoAllocs",int_opt_to_json x.f_AllocationAllocs_NoAllocs) :: (("AllocNetMoney",float_4_opt_to_json x.f_AllocationAllocs_AllocNetMoney) :: (("SettlInstMode",settlinstmode_opt_to_json x.f_AllocationAllocs_SettlInstMode) :: (("SettlCurrAmt",float_4_opt_to_json x.f_AllocationAllocs_SettlCurrAmt) :: (("AllocText",string_opt_to_json x.f_AllocationAllocs_AllocText) :: (("SettlCurrFxRateCalc",char_opt_to_json x.f_AllocationAllocs_SettlCurrFxRateCalc) :: (("AllocShares",float_4_opt_to_json x.f_AllocationAllocs_AllocShares) :: (("AllocAccount",string_opt_to_json x.f_AllocationAllocs_AllocAccount) :: (("Commission",float_4_opt_to_json x.f_AllocationAllocs_Commission) :: (("ProcessCode",processcode_opt_to_json x.f_AllocationAllocs_ProcessCode) :: (("CommType",commtype_opt_to_json x.f_AllocationAllocs_CommType) :: (("AccruedInterestAmt",float_4_opt_to_json x.f_AllocationAllocs_AccruedInterestAmt) :: (("AllocPrice",float_4_opt_to_json x.f_AllocationAllocs_AllocPrice) :: (("ExecBroker",string_opt_to_json x.f_AllocationAllocs_ExecBroker) :: (("BrokerOfCredit",string_opt_to_json x.f_AllocationAllocs_BrokerOfCredit) :: (("EncodedAllocText",string_opt_to_json x.f_AllocationAllocs_EncodedAllocText) :: (("SettlCurrency",currency_opt_to_json x.f_AllocationAllocs_SettlCurrency) :: (("NotifyBrokerOfCredit",notifybrokerofcredit_opt_to_json x.f_AllocationAllocs_NotifyBrokerOfCredit) :: (("AllocAvgPx",float_4_opt_to_json x.f_AllocationAllocs_AllocAvgPx) :: (("EncodedAllocTextLen",int_opt_to_json x.f_AllocationAllocs_EncodedAllocTextLen) :: (("ClientID",string_opt_to_json x.f_AllocationAllocs_ClientID) :: (("AllocHandlInst",allochandlinst_opt_to_json x.f_AllocationAllocs_AllocHandlInst) :: [])))))))))))))))))))))))
;;

let clearingentries_to_string (d)  =
    ""
;;

let clearingentries_to_json (x)  : json =
    assoc_filter_nulls (("Account",string_opt_to_json x.f_ClearingEntries_Account) :: (("FreeText",string_opt_to_json x.f_ClearingEntries_FreeText) :: (("OpenClose",openclose_opt_to_json x.f_ClearingEntries_OpenClose) :: (("ClearingFirm",string_opt_to_json x.f_ClearingEntries_ClearingFirm) :: (("Rule80A",rule80a_opt_to_json x.f_ClearingEntries_Rule80A) :: (("ClientID",string_opt_to_json x.f_ClearingEntries_ClientID) :: (("NoClearingEntries",int_opt_to_json x.f_ClearingEntries_NoClearingEntries) :: (("ClearingHandlingType",clearinghandlingtype_opt_to_json x.f_ClearingEntries_ClearingHandlingType) :: []))))))))
;;

let execcollgrp_to_string (d)  =
    ""
;;

let execcollgrp_to_json (x)  : json =
    assoc_filter_nulls (("ExecID",string_opt_to_json x.f_ExecCollGrp_ExecID) :: (("NoExecs",int_opt_to_json x.f_ExecCollGrp_NoExecs) :: []))
;;

let ordercancelreplacerequestallocs_to_string (d)  =
    ""
;;

let ordercancelreplacerequestallocs_to_json (x)  : json =
    assoc_filter_nulls (("NoAllocs",int_opt_to_json x.f_OrderCancelReplaceRequestAllocs_NoAllocs) :: (("AllocShares",float_4_opt_to_json x.f_OrderCancelReplaceRequestAllocs_AllocShares) :: (("AllocAccount",string_opt_to_json x.f_OrderCancelReplaceRequestAllocs_AllocAccount) :: [])))
;;

let commissiondata_to_string (d)  =
    ""
;;

let commissiondata_to_json (x)  : json =
    assoc_filter_nulls (("FundRenewWaiv",fundrenewwaiv_opt_to_json x.f_CommissionData_FundRenewWaiv) :: (("Commission",float_4_opt_to_json x.f_CommissionData_Commission) :: (("CommCurrency",currency_opt_to_json x.f_CommissionData_CommCurrency) :: (("CommType",commtype_opt_to_json x.f_CommissionData_CommType) :: []))))
;;

let emailroutingids_to_string (d)  =
    ""
;;

let emailroutingids_to_json (x)  : json =
    assoc_filter_nulls (("RoutingType",routingtype_opt_to_json x.f_EmailRoutingIDs_RoutingType) :: (("NoRoutingIDs",int_opt_to_json x.f_EmailRoutingIDs_NoRoutingIDs) :: (("RoutingID",string_opt_to_json x.f_EmailRoutingIDs_RoutingID) :: [])))
;;

let execallocgrp_to_string (d)  =
    ""
;;

let execallocgrp_to_json (x)  : json =
    assoc_filter_nulls (("LastPx",float_4_opt_to_json x.f_ExecAllocGrp_LastPx) :: (("ExecID",string_opt_to_json x.f_ExecAllocGrp_ExecID) :: (("NoExecs",int_opt_to_json x.f_ExecAllocGrp_NoExecs) :: (("LastParPx",float_4_opt_to_json x.f_ExecAllocGrp_LastParPx) :: (("LastQty",float_4_opt_to_json x.f_ExecAllocGrp_LastQty) :: (("SecondaryExecID",string_opt_to_json x.f_ExecAllocGrp_SecondaryExecID) :: (("LastCapacity",lastcapacity_opt_to_json x.f_ExecAllocGrp_LastCapacity) :: [])))))))
;;

let emailrelatedsym_to_string (d)  =
    ""
;;

let emailrelatedsym_to_json (x)  : json =
    assoc_filter_nulls (("SecurityDesc",string_opt_to_json x.f_EmailRelatedSym_SecurityDesc) :: (("SecurityType",securitytype_opt_to_json x.f_EmailRelatedSym_SecurityType) :: (("SymbolSfx",string_opt_to_json x.f_EmailRelatedSym_SymbolSfx) :: (("CouponRate",float_opt_to_json x.f_EmailRelatedSym_CouponRate) :: (("Issuer",string_opt_to_json x.f_EmailRelatedSym_Issuer) :: (("MaturityMonthYear",monthyear_opt_to_json x.f_EmailRelatedSym_MaturityMonthYear) :: (("StrikePrice",float_4_opt_to_json x.f_EmailRelatedSym_StrikePrice) :: (("NoRelatedSym",int_opt_to_json x.f_EmailRelatedSym_NoRelatedSym) :: (("IDSource",idsource_opt_to_json x.f_EmailRelatedSym_IDSource) :: (("OptAttribute",char_opt_to_json x.f_EmailRelatedSym_OptAttribute) :: (("EncodedIssuer",string_opt_to_json x.f_EmailRelatedSym_EncodedIssuer) :: (("EncodedIssuerLen",int_opt_to_json x.f_EmailRelatedSym_EncodedIssuerLen) :: (("RelatdSym",string_opt_to_json x.f_EmailRelatedSym_RelatdSym) :: (("ContractMultiplier",float_opt_to_json x.f_EmailRelatedSym_ContractMultiplier) :: (("EncodedSecurityDescLen",int_opt_to_json x.f_EmailRelatedSym_EncodedSecurityDescLen) :: (("SecurityID",string_opt_to_json x.f_EmailRelatedSym_SecurityID) :: (("PutOrCall",putorcall_opt_to_json x.f_EmailRelatedSym_PutOrCall) :: (("MaturityDay",int_opt_to_json x.f_EmailRelatedSym_MaturityDay) :: (("SecurityExchange",exchange_opt_to_json x.f_EmailRelatedSym_SecurityExchange) :: (("EncodedSecurityDesc",string_opt_to_json x.f_EmailRelatedSym_EncodedSecurityDesc) :: []))))))))))))))))))))
;;

let nstdptys2subgrp_to_string (d)  =
    ""
;;

let nstdptys2subgrp_to_json (x)  : json =
    assoc_filter_nulls (("Nested2PartySubID",string_opt_to_json x.f_NstdPtys2SubGrp_Nested2PartySubID) :: (("Nested2PartySubIDType",int_opt_to_json x.f_NstdPtys2SubGrp_Nested2PartySubIDType) :: (("NoNested2PartySubIDs",int_opt_to_json x.f_NstdPtys2SubGrp_NoNested2PartySubIDs) :: [])))
;;

let massquotequoteentries_to_string (d)  =
    ""
;;

let massquotequoteentries_to_json (x)  : json =
    assoc_filter_nulls (("SecurityDesc",string_opt_to_json x.f_MassQuoteQuoteEntries_SecurityDesc) :: (("CouponRate",float_opt_to_json x.f_MassQuoteQuoteEntries_CouponRate) :: (("StrikePrice",float_4_opt_to_json x.f_MassQuoteQuoteEntries_StrikePrice) :: (("ValidUntilTime",utctimestamp_opt_to_json x.f_MassQuoteQuoteEntries_ValidUntilTime) :: (("OrdType",ordtype_opt_to_json x.f_MassQuoteQuoteEntries_OrdType) :: (("OptAttribute",char_opt_to_json x.f_MassQuoteQuoteEntries_OptAttribute) :: (("OfferSpotRate",float_4_opt_to_json x.f_MassQuoteQuoteEntries_OfferSpotRate) :: (("BidForwardPoints",float_4_opt_to_json x.f_MassQuoteQuoteEntries_BidForwardPoints) :: (("EncodedIssuerLen",int_opt_to_json x.f_MassQuoteQuoteEntries_EncodedIssuerLen) :: (("ContractMultiplier",float_opt_to_json x.f_MassQuoteQuoteEntries_ContractMultiplier) :: (("EncodedSecurityDescLen",int_opt_to_json x.f_MassQuoteQuoteEntries_EncodedSecurityDescLen) :: (("PutOrCall",putorcall_opt_to_json x.f_MassQuoteQuoteEntries_PutOrCall) :: (("FutSettDate2",localmktdate_opt_to_json x.f_MassQuoteQuoteEntries_FutSettDate2) :: (("MaturityDay",int_opt_to_json x.f_MassQuoteQuoteEntries_MaturityDay) :: (("SecurityType",securitytype_opt_to_json x.f_MassQuoteQuoteEntries_SecurityType) :: (("BidSpotRate",float_4_opt_to_json x.f_MassQuoteQuoteEntries_BidSpotRate) :: (("SymbolSfx",string_opt_to_json x.f_MassQuoteQuoteEntries_SymbolSfx) :: (("FutSettDate",localmktdate_opt_to_json x.f_MassQuoteQuoteEntries_FutSettDate) :: (("Issuer",string_opt_to_json x.f_MassQuoteQuoteEntries_Issuer) :: (("OfferPx",float_4_opt_to_json x.f_MassQuoteQuoteEntries_OfferPx) :: (("MaturityMonthYear",monthyear_opt_to_json x.f_MassQuoteQuoteEntries_MaturityMonthYear) :: (("OfferSize",float_4_opt_to_json x.f_MassQuoteQuoteEntries_OfferSize) :: (("IDSource",idsource_opt_to_json x.f_MassQuoteQuoteEntries_IDSource) :: (("Symbol",string_opt_to_json x.f_MassQuoteQuoteEntries_Symbol) :: (("EncodedIssuer",string_opt_to_json x.f_MassQuoteQuoteEntries_EncodedIssuer) :: (("TradingSessionID",string_opt_to_json x.f_MassQuoteQuoteEntries_TradingSessionID) :: (("BidSize",float_4_opt_to_json x.f_MassQuoteQuoteEntries_BidSize) :: (("TransactTime",utctimestamp_opt_to_json x.f_MassQuoteQuoteEntries_TransactTime) :: (("OrderQty2",float_4_opt_to_json x.f_MassQuoteQuoteEntries_OrderQty2) :: (("Currency",currency_opt_to_json x.f_MassQuoteQuoteEntries_Currency) :: (("QuoteEntryID",string_opt_to_json x.f_MassQuoteQuoteEntries_QuoteEntryID) :: (("BidPx",float_4_opt_to_json x.f_MassQuoteQuoteEntries_BidPx) :: (("SecurityID",string_opt_to_json x.f_MassQuoteQuoteEntries_SecurityID) :: (("OfferForwardPoints",float_4_opt_to_json x.f_MassQuoteQuoteEntries_OfferForwardPoints) :: (("SecurityExchange",exchange_opt_to_json x.f_MassQuoteQuoteEntries_SecurityExchange) :: (("NoQuoteEntries",int_opt_to_json x.f_MassQuoteQuoteEntries_NoQuoteEntries) :: (("EncodedSecurityDesc",string_opt_to_json x.f_MassQuoteQuoteEntries_EncodedSecurityDesc) :: [])))))))))))))))))))))))))))))))))))))
;;

let attrbgrp_to_string (d)  =
    ""
;;

let attrbgrp_to_json (x)  : json =
    assoc_filter_nulls (("InstrAttribValue",string_opt_to_json x.f_AttrbGrp_InstrAttribValue) :: (("NoInstrAttrib",int_opt_to_json x.f_AttrbGrp_NoInstrAttrib) :: (("InstrAttribType",instrattribtype_opt_to_json x.f_AttrbGrp_InstrAttribType) :: [])))
;;

let contamtgrp_to_string (d)  =
    ""
;;

let contamtgrp_to_json (x)  : json =
    assoc_filter_nulls (("ContAmtValue",float_opt_to_json x.f_ContAmtGrp_ContAmtValue) :: (("NoContAmts",int_opt_to_json x.f_ContAmtGrp_NoContAmts) :: (("ContAmtCurr",currency_opt_to_json x.f_ContAmtGrp_ContAmtCurr) :: (("ContAmtType",contamttype_opt_to_json x.f_ContAmtGrp_ContAmtType) :: []))))
;;

let miscfeesgrp_to_string (d)  =
    ""
;;

let miscfeesgrp_to_json (x)  : json =
    assoc_filter_nulls (("MiscFeeBasis",miscfeebasis_opt_to_json x.f_MiscFeesGrp_MiscFeeBasis) :: (("MiscFeeCurr",currency_opt_to_json x.f_MiscFeesGrp_MiscFeeCurr) :: (("MiscFeeType",miscfeetype_opt_to_json x.f_MiscFeesGrp_MiscFeeType) :: (("MiscFeeAmt",float_4_opt_to_json x.f_MiscFeesGrp_MiscFeeAmt) :: (("NoMiscFees",int_opt_to_json x.f_MiscFeesGrp_NoMiscFees) :: [])))))
;;

let nstdptyssubgrp_to_string (d)  =
    ""
;;

let nstdptyssubgrp_to_json (x)  : json =
    assoc_filter_nulls (("NestedPartySubIDType",int_opt_to_json x.f_NstdPtysSubGrp_NestedPartySubIDType) :: (("NestedPartySubID",string_opt_to_json x.f_NstdPtysSubGrp_NestedPartySubID) :: (("NoNestedPartySubIDs",int_opt_to_json x.f_NstdPtysSubGrp_NoNestedPartySubIDs) :: [])))
;;

let hop_to_string (d)  =
    ""
;;

let hop_to_json (x)  : json =
    assoc_filter_nulls (("HopSendingTime",utctimestamp_opt_to_json x.f_Hop_HopSendingTime) :: (("NoHops",int_opt_to_json x.f_Hop_NoHops) :: (("HopCompID",string_opt_to_json x.f_Hop_HopCompID) :: (("HopRefID",int_opt_to_json x.f_Hop_HopRefID) :: []))))
;;

let executionreportcontrabrokers_to_string (d)  =
    ""
;;

let executionreportcontrabrokers_to_json (x)  : json =
    assoc_filter_nulls (("ContraTradeQty",float_4_opt_to_json x.f_ExecutionReportContraBrokers_ContraTradeQty) :: (("NoContraBrokers",int_opt_to_json x.f_ExecutionReportContraBrokers_NoContraBrokers) :: (("ContraTrader",string_opt_to_json x.f_ExecutionReportContraBrokers_ContraTrader) :: (("ContraBroker",string_opt_to_json x.f_ExecutionReportContraBrokers_ContraBroker) :: (("ContraTradeTime",utctimestamp_opt_to_json x.f_ExecutionReportContraBrokers_ContraTradeTime) :: [])))))
;;

let routinggrp_to_string (d)  =
    ""
;;

let routinggrp_to_json (x)  : json =
    assoc_filter_nulls (("RoutingType",routingtype_opt_to_json x.f_RoutingGrp_RoutingType) :: (("NoRoutingIDs",int_opt_to_json x.f_RoutingGrp_NoRoutingIDs) :: (("RoutingID",string_opt_to_json x.f_RoutingGrp_RoutingID) :: [])))
;;

let orderlisttradingsessions_to_string (d)  =
    ""
;;

let orderlisttradingsessions_to_json (x)  : json =
    assoc_filter_nulls (("NoTradingSessions",int_opt_to_json x.f_OrderListTradingSessions_NoTradingSessions) :: (("TradingSessionID",string_opt_to_json x.f_OrderListTradingSessions_TradingSessionID) :: []))
;;

let stipulations_to_string (d)  =
    ""
;;

let stipulations_to_json (x)  : json =
    assoc_filter_nulls (("StipulationType",stipulationtype_opt_to_json x.f_Stipulations_StipulationType) :: (("StipulationValue",string_opt_to_json x.f_Stipulations_StipulationValue) :: (("NoStipulations",int_opt_to_json x.f_Stipulations_NoStipulations) :: [])))
;;

let allocationmiscfees_to_string (d)  =
    ""
;;

let allocationmiscfees_to_json (x)  : json =
    assoc_filter_nulls (("MiscFeeCurr",currency_opt_to_json x.f_AllocationMiscFees_MiscFeeCurr) :: (("MiscFeeType",miscfeetype_opt_to_json x.f_AllocationMiscFees_MiscFeeType) :: (("MiscFeeAmt",float_4_opt_to_json x.f_AllocationMiscFees_MiscFeeAmt) :: (("NoMiscFees",int_opt_to_json x.f_AllocationMiscFees_NoMiscFees) :: []))))
;;

let financingdetails_to_string (d)  =
    ""
;;

let financingdetails_to_json (x)  : json =
    assoc_filter_nulls (("TerminationType",terminationtype_opt_to_json x.f_FinancingDetails_TerminationType) :: (("AgreementID",string_opt_to_json x.f_FinancingDetails_AgreementID) :: (("AgreementCurrency",currency_opt_to_json x.f_FinancingDetails_AgreementCurrency) :: (("AgreementDesc",string_opt_to_json x.f_FinancingDetails_AgreementDesc) :: (("MarginRatio",float_4_opt_to_json x.f_FinancingDetails_MarginRatio) :: (("AgreementDate",localmktdate_opt_to_json x.f_FinancingDetails_AgreementDate) :: (("EndDate",localmktdate_opt_to_json x.f_FinancingDetails_EndDate) :: (("DeliveryType",deliverytype_opt_to_json x.f_FinancingDetails_DeliveryType) :: (("StartDate",localmktdate_opt_to_json x.f_FinancingDetails_StartDate) :: [])))))))))
;;

let orderlistallocs_to_string (d)  =
    ""
;;

let orderlistallocs_to_json (x)  : json =
    assoc_filter_nulls (("NoAllocs",int_opt_to_json x.f_OrderListAllocs_NoAllocs) :: (("AllocShares",float_4_opt_to_json x.f_OrderListAllocs_AllocShares) :: (("AllocAccount",string_opt_to_json x.f_OrderListAllocs_AllocAccount) :: [])))
;;

let linesoftextgrp_to_string (d)  =
    ""
;;

let linesoftextgrp_to_json (x)  : json =
    assoc_filter_nulls (("EncodedTextLen",int_opt_to_json x.f_LinesOfTextGrp_EncodedTextLen) :: (("NoLinesOfText",int_opt_to_json x.f_LinesOfTextGrp_NoLinesOfText) :: (("EncodedText",string_opt_to_json x.f_LinesOfTextGrp_EncodedText) :: (("Text",string_opt_to_json x.f_LinesOfTextGrp_Text) :: []))))
;;

let ordliststatgrp_to_string (d)  =
    ""
;;

let ordliststatgrp_to_json (x)  : json =
    assoc_filter_nulls (("CumQty",float_4_opt_to_json x.f_OrdListStatGrp_CumQty) :: (("OrdRejReason",ordrejreason_opt_to_json x.f_OrdListStatGrp_OrdRejReason) :: (("EncodedText",string_opt_to_json x.f_OrdListStatGrp_EncodedText) :: (("ClOrdID",string_opt_to_json x.f_OrdListStatGrp_ClOrdID) :: (("Text",string_opt_to_json x.f_OrdListStatGrp_Text) :: (("SecondaryClOrdID",string_opt_to_json x.f_OrdListStatGrp_SecondaryClOrdID) :: (("WorkingIndicator",workingindicator_opt_to_json x.f_OrdListStatGrp_WorkingIndicator) :: (("AvgPx",float_4_opt_to_json x.f_OrdListStatGrp_AvgPx) :: (("EncodedTextLen",int_opt_to_json x.f_OrdListStatGrp_EncodedTextLen) :: (("OrdStatus",ordstatus_opt_to_json x.f_OrdListStatGrp_OrdStatus) :: (("NoOrders",int_opt_to_json x.f_OrdListStatGrp_NoOrders) :: (("CxlQty",float_4_opt_to_json x.f_OrdListStatGrp_CxlQty) :: (("LeavesQty",float_4_opt_to_json x.f_OrdListStatGrp_LeavesQty) :: [])))))))))))))
;;

let ptyssubgrp_to_string (d)  =
    ""
;;

let ptyssubgrp_to_json (x)  : json =
    assoc_filter_nulls (("PartySubIDType",partysubidtype_opt_to_json x.f_PtysSubGrp_PartySubIDType) :: (("PartySubID",string_opt_to_json x.f_PtysSubGrp_PartySubID) :: (("NoPartySubIDs",int_opt_to_json x.f_PtysSubGrp_NoPartySubIDs) :: [])))
;;

let bidresponsebidcomponents_to_string (d)  =
    ""
;;

let bidresponsebidcomponents_to_json (x)  : json =
    assoc_filter_nulls (("FutSettDate",localmktdate_opt_to_json x.f_BidResponseBidComponents_FutSettDate) :: (("FairValue",float_4_opt_to_json x.f_BidResponseBidComponents_FairValue) :: (("EncodedText",string_opt_to_json x.f_BidResponseBidComponents_EncodedText) :: (("Commission",float_4_opt_to_json x.f_BidResponseBidComponents_Commission) :: (("TradingSessionID",string_opt_to_json x.f_BidResponseBidComponents_TradingSessionID) :: (("Text",string_opt_to_json x.f_BidResponseBidComponents_Text) :: (("CommType",commtype_opt_to_json x.f_BidResponseBidComponents_CommType) :: (("NetGrossInd",netgrossind_opt_to_json x.f_BidResponseBidComponents_NetGrossInd) :: (("Side",side_opt_to_json x.f_BidResponseBidComponents_Side) :: (("EncodedTextLen",int_opt_to_json x.f_BidResponseBidComponents_EncodedTextLen) :: (("NoBidComponents",int_opt_to_json x.f_BidResponseBidComponents_NoBidComponents) :: (("Price",float_4_opt_to_json x.f_BidResponseBidComponents_Price) :: (("ListID",string_opt_to_json x.f_BidResponseBidComponents_ListID) :: (("Country",string_opt_to_json x.f_BidResponseBidComponents_Country) :: (("PriceType",pricetype_opt_to_json x.f_BidResponseBidComponents_PriceType) :: (("SettlmntTyp",settlmnttyp_opt_to_json x.f_BidResponseBidComponents_SettlmntTyp) :: []))))))))))))))))
;;

let logonmsgtypes_to_string (d)  =
    ""
;;

let logonmsgtypes_to_json (x)  : json =
    assoc_filter_nulls (("MsgDirection",msgdirection_opt_to_json x.f_LogonMsgTypes_MsgDirection) :: (("NoMsgTypes",int_opt_to_json x.f_LogonMsgTypes_NoMsgTypes) :: (("RefMsgType",string_opt_to_json x.f_LogonMsgTypes_RefMsgType) :: [])))
;;

let sectypesgrp_to_string (d)  =
    ""
;;

let sectypesgrp_to_json (x)  : json =
    assoc_filter_nulls (("SecurityType",securitytype_opt_to_json x.f_SecTypesGrp_SecurityType) :: (("NoSecurityTypes",int_opt_to_json x.f_SecTypesGrp_NoSecurityTypes) :: (("Product",product_opt_to_json x.f_SecTypesGrp_Product) :: (("SecuritySubType",string_opt_to_json x.f_SecTypesGrp_SecuritySubType) :: (("CFICode",string_opt_to_json x.f_SecTypesGrp_CFICode) :: [])))))
;;

let quotecancelquoteentries_to_string (d)  =
    ""
;;

let quotecancelquoteentries_to_json (x)  : json =
    assoc_filter_nulls (("SecurityDesc",string_opt_to_json x.f_QuoteCancelQuoteEntries_SecurityDesc) :: (("SecurityType",securitytype_opt_to_json x.f_QuoteCancelQuoteEntries_SecurityType) :: (("SymbolSfx",string_opt_to_json x.f_QuoteCancelQuoteEntries_SymbolSfx) :: (("CouponRate",float_opt_to_json x.f_QuoteCancelQuoteEntries_CouponRate) :: (("Issuer",string_opt_to_json x.f_QuoteCancelQuoteEntries_Issuer) :: (("MaturityMonthYear",monthyear_opt_to_json x.f_QuoteCancelQuoteEntries_MaturityMonthYear) :: (("StrikePrice",float_4_opt_to_json x.f_QuoteCancelQuoteEntries_StrikePrice) :: (("IDSource",idsource_opt_to_json x.f_QuoteCancelQuoteEntries_IDSource) :: (("Symbol",string_opt_to_json x.f_QuoteCancelQuoteEntries_Symbol) :: (("OptAttribute",char_opt_to_json x.f_QuoteCancelQuoteEntries_OptAttribute) :: (("EncodedIssuer",string_opt_to_json x.f_QuoteCancelQuoteEntries_EncodedIssuer) :: (("EncodedIssuerLen",int_opt_to_json x.f_QuoteCancelQuoteEntries_EncodedIssuerLen) :: (("ContractMultiplier",float_opt_to_json x.f_QuoteCancelQuoteEntries_ContractMultiplier) :: (("EncodedSecurityDescLen",int_opt_to_json x.f_QuoteCancelQuoteEntries_EncodedSecurityDescLen) :: (("SecurityID",string_opt_to_json x.f_QuoteCancelQuoteEntries_SecurityID) :: (("PutOrCall",putorcall_opt_to_json x.f_QuoteCancelQuoteEntries_PutOrCall) :: (("MaturityDay",int_opt_to_json x.f_QuoteCancelQuoteEntries_MaturityDay) :: (("SecurityExchange",exchange_opt_to_json x.f_QuoteCancelQuoteEntries_SecurityExchange) :: (("NoQuoteEntries",int_opt_to_json x.f_QuoteCancelQuoteEntries_NoQuoteEntries) :: (("EncodedSecurityDesc",string_opt_to_json x.f_QuoteCancelQuoteEntries_EncodedSecurityDesc) :: (("UnderlyingSymbol",string_opt_to_json x.f_QuoteCancelQuoteEntries_UnderlyingSymbol) :: [])))))))))))))))))))))
;;

let marketdatarequestrelatedsym_to_string (d)  =
    ""
;;

let marketdatarequestrelatedsym_to_json (x)  : json =
    assoc_filter_nulls (("SecurityDesc",string_opt_to_json x.f_MarketDataRequestRelatedSym_SecurityDesc) :: (("SecurityType",securitytype_opt_to_json x.f_MarketDataRequestRelatedSym_SecurityType) :: (("SymbolSfx",string_opt_to_json x.f_MarketDataRequestRelatedSym_SymbolSfx) :: (("CouponRate",float_opt_to_json x.f_MarketDataRequestRelatedSym_CouponRate) :: (("Issuer",string_opt_to_json x.f_MarketDataRequestRelatedSym_Issuer) :: (("MaturityMonthYear",monthyear_opt_to_json x.f_MarketDataRequestRelatedSym_MaturityMonthYear) :: (("StrikePrice",float_4_opt_to_json x.f_MarketDataRequestRelatedSym_StrikePrice) :: (("NoRelatedSym",int_opt_to_json x.f_MarketDataRequestRelatedSym_NoRelatedSym) :: (("IDSource",idsource_opt_to_json x.f_MarketDataRequestRelatedSym_IDSource) :: (("Symbol",string_opt_to_json x.f_MarketDataRequestRelatedSym_Symbol) :: (("OptAttribute",char_opt_to_json x.f_MarketDataRequestRelatedSym_OptAttribute) :: (("EncodedIssuer",string_opt_to_json x.f_MarketDataRequestRelatedSym_EncodedIssuer) :: (("TradingSessionID",string_opt_to_json x.f_MarketDataRequestRelatedSym_TradingSessionID) :: (("EncodedIssuerLen",int_opt_to_json x.f_MarketDataRequestRelatedSym_EncodedIssuerLen) :: (("ContractMultiplier",float_opt_to_json x.f_MarketDataRequestRelatedSym_ContractMultiplier) :: (("EncodedSecurityDescLen",int_opt_to_json x.f_MarketDataRequestRelatedSym_EncodedSecurityDescLen) :: (("SecurityID",string_opt_to_json x.f_MarketDataRequestRelatedSym_SecurityID) :: (("PutOrCall",putorcall_opt_to_json x.f_MarketDataRequestRelatedSym_PutOrCall) :: (("MaturityDay",int_opt_to_json x.f_MarketDataRequestRelatedSym_MaturityDay) :: (("SecurityExchange",exchange_opt_to_json x.f_MarketDataRequestRelatedSym_SecurityExchange) :: (("EncodedSecurityDesc",string_opt_to_json x.f_MarketDataRequestRelatedSym_EncodedSecurityDesc) :: [])))))))))))))))))))))
;;

let positionamountdata_to_string (d)  =
    ""
;;

let positionamountdata_to_json (x)  : json =
    assoc_filter_nulls (("NoPosAmt",int_opt_to_json x.f_PositionAmountData_NoPosAmt) :: (("PosAmt",float_4_opt_to_json x.f_PositionAmountData_PosAmt) :: (("PosAmtType",posamttype_opt_to_json x.f_PositionAmountData_PosAmtType) :: [])))
;;

let mdrjctgrp_to_string (d)  =
    ""
;;

let mdrjctgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoAltMDSource",int_opt_to_json x.f_MDRjctGrp_NoAltMDSource) :: (("AltMDSourceID",string_opt_to_json x.f_MDRjctGrp_AltMDSourceID) :: []))
;;

let liststatusorders_to_string (d)  =
    ""
;;

let liststatusorders_to_json (x)  : json =
    assoc_filter_nulls (("CumQty",float_4_opt_to_json x.f_ListStatusOrders_CumQty) :: (("AvgPx",float_4_opt_to_json x.f_ListStatusOrders_AvgPx) :: (("OrdRejReason",ordrejreason_opt_to_json x.f_ListStatusOrders_OrdRejReason) :: (("EncodedTextLen",int_opt_to_json x.f_ListStatusOrders_EncodedTextLen) :: (("OrdStatus",ordstatus_opt_to_json x.f_ListStatusOrders_OrdStatus) :: (("NoOrders",int_opt_to_json x.f_ListStatusOrders_NoOrders) :: (("EncodedText",string_opt_to_json x.f_ListStatusOrders_EncodedText) :: (("ClOrdID",string_opt_to_json x.f_ListStatusOrders_ClOrdID) :: (("Text",string_opt_to_json x.f_ListStatusOrders_Text) :: (("CxlQty",float_4_opt_to_json x.f_ListStatusOrders_CxlQty) :: (("LeavesQty",float_4_opt_to_json x.f_ListStatusOrders_LeavesQty) :: [])))))))))))
;;

let secaltidgrp_to_string (d)  =
    ""
;;

let secaltidgrp_to_json (x)  : json =
    assoc_filter_nulls (("NoSecurityAltID",int_opt_to_json x.f_SecAltIDGrp_NoSecurityAltID) :: (("SecurityAltIDSource",string_opt_to_json x.f_SecAltIDGrp_SecurityAltIDSource) :: (("SecurityAltID",string_opt_to_json x.f_SecAltIDGrp_SecurityAltID) :: [])))
;;

let trdregtimestamps_to_string (d)  =
    ""
;;

let trdregtimestamps_to_json (x)  : json =
    assoc_filter_nulls (("NoTrdRegTimestamps",int_opt_to_json x.f_TrdRegTimestamps_NoTrdRegTimestamps) :: (("TrdRegTimestampOrigin",string_opt_to_json x.f_TrdRegTimestamps_TrdRegTimestampOrigin) :: (("TrdRegTimestampType",trdregtimestamptype_opt_to_json x.f_TrdRegTimestamps_TrdRegTimestampType) :: (("TrdRegTimestamp",utctimestamp_opt_to_json x.f_TrdRegTimestamps_TrdRegTimestamp) :: []))))
;;

let bidrequestbidcomponents_to_string (d)  =
    ""
;;

let bidrequestbidcomponents_to_json (x)  : json =
    assoc_filter_nulls (("Account",string_opt_to_json x.f_BidRequestBidComponents_Account) :: (("Side",side_opt_to_json x.f_BidRequestBidComponents_Side) :: (("FutSettDate",localmktdate_opt_to_json x.f_BidRequestBidComponents_FutSettDate) :: (("NoBidComponents",int_opt_to_json x.f_BidRequestBidComponents_NoBidComponents) :: (("ListID",string_opt_to_json x.f_BidRequestBidComponents_ListID) :: (("TradingSessionID",string_opt_to_json x.f_BidRequestBidComponents_TradingSessionID) :: (("SettlmntTyp",settlmnttyp_opt_to_json x.f_BidRequestBidComponents_SettlmntTyp) :: (("NetGrossInd",netgrossind_opt_to_json x.f_BidRequestBidComponents_NetGrossInd) :: []))))))))
;;

let liststrikepricestrikes_to_string (d)  =
    ""
;;

let liststrikepricestrikes_to_json (x)  : json =
    assoc_filter_nulls (("SecurityDesc",string_opt_to_json x.f_ListStrikePriceStrikes_SecurityDesc) :: (("CouponRate",float_opt_to_json x.f_ListStrikePriceStrikes_CouponRate) :: (("StrikePrice",float_4_opt_to_json x.f_ListStrikePriceStrikes_StrikePrice) :: (("OptAttribute",char_opt_to_json x.f_ListStrikePriceStrikes_OptAttribute) :: (("ClOrdID",string_opt_to_json x.f_ListStrikePriceStrikes_ClOrdID) :: (("Text",string_opt_to_json x.f_ListStrikePriceStrikes_Text) :: (("EncodedIssuerLen",int_opt_to_json x.f_ListStrikePriceStrikes_EncodedIssuerLen) :: (("Price",float_4_opt_to_json x.f_ListStrikePriceStrikes_Price) :: (("ContractMultiplier",float_opt_to_json x.f_ListStrikePriceStrikes_ContractMultiplier) :: (("EncodedSecurityDescLen",int_opt_to_json x.f_ListStrikePriceStrikes_EncodedSecurityDescLen) :: (("PutOrCall",putorcall_opt_to_json x.f_ListStrikePriceStrikes_PutOrCall) :: (("MaturityDay",int_opt_to_json x.f_ListStrikePriceStrikes_MaturityDay) :: (("SecurityType",securitytype_opt_to_json x.f_ListStrikePriceStrikes_SecurityType) :: (("SymbolSfx",string_opt_to_json x.f_ListStrikePriceStrikes_SymbolSfx) :: (("Issuer",string_opt_to_json x.f_ListStrikePriceStrikes_Issuer) :: (("MaturityMonthYear",monthyear_opt_to_json x.f_ListStrikePriceStrikes_MaturityMonthYear) :: (("IDSource",idsource_opt_to_json x.f_ListStrikePriceStrikes_IDSource) :: (("EncodedText",string_opt_to_json x.f_ListStrikePriceStrikes_EncodedText) :: (("Symbol",string_opt_to_json x.f_ListStrikePriceStrikes_Symbol) :: (("EncodedIssuer",string_opt_to_json x.f_ListStrikePriceStrikes_EncodedIssuer) :: (("Side",side_opt_to_json x.f_ListStrikePriceStrikes_Side) :: (("EncodedTextLen",int_opt_to_json x.f_ListStrikePriceStrikes_EncodedTextLen) :: (("NoStrikes",int_opt_to_json x.f_ListStrikePriceStrikes_NoStrikes) :: (("Currency",currency_opt_to_json x.f_ListStrikePriceStrikes_Currency) :: (("SecurityID",string_opt_to_json x.f_ListStrikePriceStrikes_SecurityID) :: (("PrevClosePx",float_4_opt_to_json x.f_ListStrikePriceStrikes_PrevClosePx) :: (("SecurityExchange",exchange_opt_to_json x.f_ListStrikePriceStrikes_SecurityExchange) :: (("EncodedSecurityDesc",string_opt_to_json x.f_ListStrikePriceStrikes_EncodedSecurityDesc) :: []))))))))))))))))))))))))))))
;;

let newsroutingids_to_string (d)  =
    ""
;;

let newsroutingids_to_json (x)  : json =
    assoc_filter_nulls (("RoutingType",routingtype_opt_to_json x.f_NewsRoutingIDs_RoutingType) :: (("NoRoutingIDs",int_opt_to_json x.f_NewsRoutingIDs_NoRoutingIDs) :: (("RoutingID",string_opt_to_json x.f_NewsRoutingIDs_RoutingID) :: [])))
;;

let securitydefinitionrequestrelatedsym_to_string (d)  =
    ""
;;

let securitydefinitionrequestrelatedsym_to_json (x)  : json =
    assoc_filter_nulls (("UnderlyingIDSource",string_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingIDSource) :: (("RatioQty",float_4_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_RatioQty) :: (("UnderlyingOptAttribute",char_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingOptAttribute) :: (("UnderlyingMaturityDay",int_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingMaturityDay) :: (("EncodedUnderlyingIssuer",string_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_EncodedUnderlyingIssuer) :: (("UnderlyingMaturityMonthYear",monthyear_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingMaturityMonthYear) :: (("NoRelatedSym",int_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_NoRelatedSym) :: (("UnderlyingCouponRate",float_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingCouponRate) :: (("UnderlyingCurrency",currency_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingCurrency) :: (("UnderlyingSecurityType",string_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingSecurityType) :: (("UnderlyingPutOrCall",int_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingPutOrCall) :: (("UnderlyingSecurityExchange",exchange_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingSecurityExchange) :: (("UnderlyingSecurityID",string_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingSecurityID) :: (("Side",side_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_Side) :: (("UnderlyingContractMultiplier",float_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingContractMultiplier) :: (("EncodedUnderlyingSecurityDescLen",int_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_EncodedUnderlyingSecurityDescLen) :: (("UnderlyingSymbolSfx",string_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingSymbolSfx) :: (("EncodedUnderlyingIssuerLen",int_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_EncodedUnderlyingIssuerLen) :: (("UnderlyingSecurityDesc",string_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingSecurityDesc) :: (("EncodedUnderlyingSecurityDesc",string_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_EncodedUnderlyingSecurityDesc) :: (("UnderlyingIssuer",string_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingIssuer) :: (("UnderlyingStrikePrice",float_4_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingStrikePrice) :: (("UnderlyingSymbol",string_opt_to_json x.f_SecurityDefinitionRequestRelatedSym_UnderlyingSymbol) :: [])))))))))))))))))))))))
;;

let bidrequestbiddescriptors_to_string (d)  =
    ""
;;

let bidrequestbiddescriptors_to_json (x)  : json =
    assoc_filter_nulls (("LiquidityNumSecurities",int_opt_to_json x.f_BidRequestBidDescriptors_LiquidityNumSecurities) :: (("NoBidDescriptors",int_opt_to_json x.f_BidRequestBidDescriptors_NoBidDescriptors) :: (("LiquidityPctLow",float_opt_to_json x.f_BidRequestBidDescriptors_LiquidityPctLow) :: (("FairValue",float_4_opt_to_json x.f_BidRequestBidDescriptors_FairValue) :: (("ValueOfFutures",float_4_opt_to_json x.f_BidRequestBidDescriptors_ValueOfFutures) :: (("BidDescriptorType",int_opt_to_json x.f_BidRequestBidDescriptors_BidDescriptorType) :: (("SideValueInd",int_opt_to_json x.f_BidRequestBidDescriptors_SideValueInd) :: (("OutsideIndexPct",float_opt_to_json x.f_BidRequestBidDescriptors_OutsideIndexPct) :: (("BidDescriptor",string_opt_to_json x.f_BidRequestBidDescriptors_BidDescriptor) :: (("LiquidityValue",float_4_opt_to_json x.f_BidRequestBidDescriptors_LiquidityValue) :: (("LiquidityPctHigh",float_opt_to_json x.f_BidRequestBidDescriptors_LiquidityPctHigh) :: (("EFPTrackingError",float_opt_to_json x.f_BidRequestBidDescriptors_EFPTrackingError) :: []))))))))))))
;;

let orderqtydata_to_string (d)  =
    ""
;;

let orderqtydata_to_json (x)  : json =
    assoc_filter_nulls (("RoundingDirection",roundingdirection_opt_to_json x.f_OrderQtyData_RoundingDirection) :: (("RoundingModulus",float_opt_to_json x.f_OrderQtyData_RoundingModulus) :: (("OrderPercent",float_4_opt_to_json x.f_OrderQtyData_OrderPercent) :: (("CashOrderQty",float_4_opt_to_json x.f_OrderQtyData_CashOrderQty) :: (("OrderQty",float_4_opt_to_json x.f_OrderQtyData_OrderQty) :: [])))))
;;

let contragrp_to_string (d)  =
    ""
;;

let contragrp_to_json (x)  : json =
    assoc_filter_nulls (("ContraTradeQty",float_4_opt_to_json x.f_ContraGrp_ContraTradeQty) :: (("NoContraBrokers",int_opt_to_json x.f_ContraGrp_NoContraBrokers) :: (("ContraTrader",string_opt_to_json x.f_ContraGrp_ContraTrader) :: (("ContraLegRefID",string_opt_to_json x.f_ContraGrp_ContraLegRefID) :: (("ContraBroker",string_opt_to_json x.f_ContraGrp_ContraBroker) :: (("ContraTradeTime",utctimestamp_opt_to_json x.f_ContraGrp_ContraTradeTime) :: []))))))
;;

let ordersingletradingsessions_to_string (d)  =
    ""
;;

let ordersingletradingsessions_to_json (x)  : json =
    assoc_filter_nulls (("NoTradingSessions",int_opt_to_json x.f_OrderSingleTradingSessions_NoTradingSessions) :: (("TradingSessionID",string_opt_to_json x.f_OrderSingleTradingSessions_TradingSessionID) :: []))
;;

let marketdataincrementalrefreshmdentries_to_string (d)  =
    ""
;;

let marketdataincrementalrefreshmdentries_to_json (x)  : json =
    assoc_filter_nulls (("OptAttribute",char_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_OptAttribute) :: (("MDEntryTime",utctimeonly_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MDEntryTime) :: (("TradeCondition",tradecondition_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_TradeCondition) :: (("NoMDEntries",int_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_NoMDEntries) :: (("EncodedIssuerLen",int_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_EncodedIssuerLen) :: (("EncodedSecurityDescLen",int_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_EncodedSecurityDescLen) :: (("MDEntryPositionNo",int_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MDEntryPositionNo) :: (("SellerDays",int_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_SellerDays) :: (("PutOrCall",putorcall_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_PutOrCall) :: (("CorporateAction",corporateaction_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_CorporateAction) :: (("MaturityDay",int_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MaturityDay) :: (("SecurityType",securitytype_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_SecurityType) :: (("MinQty",float_4_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MinQty) :: (("ExpireDate",localmktdate_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_ExpireDate) :: (("MDUpdateAction",mdupdateaction_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MDUpdateAction) :: (("Symbol",string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_Symbol) :: (("MDEntryDate",utcdateonly_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MDEntryDate) :: (("FinancialStatus",financialstatus_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_FinancialStatus) :: (("OrderID",string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_OrderID) :: (("MDEntryRefID",string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MDEntryRefID) :: (("EncodedTextLen",int_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_EncodedTextLen) :: (("MDEntryBuyer",string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MDEntryBuyer) :: (("TimeInForce",timeinforce_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_TimeInForce) :: (("SecurityID",string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_SecurityID) :: (("ExecInst",execinst_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_ExecInst) :: (("SecurityExchange",exchange_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_SecurityExchange) :: (("MDEntryType",mdentrytype_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MDEntryType) :: (("SecurityDesc",string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_SecurityDesc) :: (("CouponRate",float_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_CouponRate) :: (("MDMkt",exchange_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MDMkt) :: (("StrikePrice",float_4_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_StrikePrice) :: (("Text",string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_Text) :: (("TotalVolumeTraded",float_4_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_TotalVolumeTraded) :: (("OpenCloseSettleFlag",openclosesettleflag_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_OpenCloseSettleFlag) :: (("NumberOfOrders",int_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_NumberOfOrders) :: (("MDEntrySeller",string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MDEntrySeller) :: (("MDEntryID",string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MDEntryID) :: (("ContractMultiplier",float_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_ContractMultiplier) :: (("ExpireTime",utctimestamp_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_ExpireTime) :: (("DeleteReason",deletereason_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_DeleteReason) :: (("SymbolSfx",string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_SymbolSfx) :: (("MDEntryPx",float_4_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MDEntryPx) :: (("Issuer",string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_Issuer) :: (("MaturityMonthYear",monthyear_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MaturityMonthYear) :: (("IDSource",idsource_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_IDSource) :: (("EncodedText",string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_EncodedText) :: (("EncodedIssuer",string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_EncodedIssuer) :: (("TradingSessionID",string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_TradingSessionID) :: (("MDEntrySize",float_4_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MDEntrySize) :: (("TickDirection",tickdirection_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_TickDirection) :: (("QuoteCondition",quotecondition_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_QuoteCondition) :: (("MDEntryOriginator",string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_MDEntryOriginator) :: (("Currency",currency_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_Currency) :: (("LocationID",string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_LocationID) :: (("QuoteEntryID",string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_QuoteEntryID) :: (("DeskID",string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_DeskID) :: (("EncodedSecurityDesc",string_opt_to_json x.f_MarketDataIncrementalRefreshMDEntries_EncodedSecurityDesc) :: [])))))))))))))))))))))))))))))))))))))))))))))))))))))))))
;;

let marketdatasnapshotfullrefreshmdentries_to_string (d)  =
    ""
;;

let marketdatasnapshotfullrefreshmdentries_to_json (x)  : json =
    assoc_filter_nulls (("MDMkt",exchange_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_MDMkt) :: (("Text",string_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_Text) :: (("MDEntryTime",utctimeonly_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_MDEntryTime) :: (("TradeCondition",tradecondition_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_TradeCondition) :: (("NoMDEntries",int_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_NoMDEntries) :: (("OpenCloseSettleFlag",openclosesettleflag_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_OpenCloseSettleFlag) :: (("NumberOfOrders",int_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_NumberOfOrders) :: (("MDEntrySeller",string_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_MDEntrySeller) :: (("MDEntryPositionNo",int_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_MDEntryPositionNo) :: (("SellerDays",int_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_SellerDays) :: (("ExpireTime",utctimestamp_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_ExpireTime) :: (("MDEntryPx",float_4_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_MDEntryPx) :: (("MinQty",float_4_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_MinQty) :: (("ExpireDate",localmktdate_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_ExpireDate) :: (("EncodedText",string_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_EncodedText) :: (("MDEntryDate",utcdateonly_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_MDEntryDate) :: (("TradingSessionID",string_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_TradingSessionID) :: (("OrderID",string_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_OrderID) :: (("MDEntrySize",float_4_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_MDEntrySize) :: (("TickDirection",tickdirection_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_TickDirection) :: (("EncodedTextLen",int_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_EncodedTextLen) :: (("MDEntryBuyer",string_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_MDEntryBuyer) :: (("QuoteCondition",quotecondition_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_QuoteCondition) :: (("MDEntryOriginator",string_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_MDEntryOriginator) :: (("Currency",currency_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_Currency) :: (("TimeInForce",timeinforce_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_TimeInForce) :: (("LocationID",string_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_LocationID) :: (("QuoteEntryID",string_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_QuoteEntryID) :: (("ExecInst",execinst_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_ExecInst) :: (("DeskID",string_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_DeskID) :: (("MDEntryType",mdentrytype_opt_to_json x.f_MarketDataSnapshotFullRefreshMDEntries_MDEntryType) :: [])))))))))))))))))))))))))))))))
;;

let legsecaltidgrp_to_string (d)  =
    ""
;;

let legsecaltidgrp_to_json (x)  : json =
    assoc_filter_nulls (("LegSecurityAltID",string_opt_to_json x.f_LegSecAltIDGrp_LegSecurityAltID) :: (("LegSecurityAltIDSource",string_opt_to_json x.f_LegSecAltIDGrp_LegSecurityAltIDSource) :: (("NoLegSecurityAltID",int_opt_to_json x.f_LegSecAltIDGrp_NoLegSecurityAltID) :: [])))
;;

let instrumentleg_to_string (d)  =
    ""
;;

let instrumentleg_to_json (x)  : json =
    assoc_filter_nulls (("LegSide",char_opt_to_json x.f_InstrumentLeg_LegSide) :: (("LegSymbol",string_opt_to_json x.f_InstrumentLeg_LegSymbol) :: (("LegIssuer",string_opt_to_json x.f_InstrumentLeg_LegIssuer) :: (("LegCFICode",string_opt_to_json x.f_InstrumentLeg_LegCFICode) :: (("LegRedemptionDate",localmktdate_opt_to_json x.f_InstrumentLeg_LegRedemptionDate) :: (("LegDatedDate",localmktdate_opt_to_json x.f_InstrumentLeg_LegDatedDate) :: (("LegContractSettlMonth",monthyear_opt_to_json x.f_InstrumentLeg_LegContractSettlMonth) :: (("LegIssueDate",localmktdate_opt_to_json x.f_InstrumentLeg_LegIssueDate) :: (("LegSecurityExchange",exchange_opt_to_json x.f_InstrumentLeg_LegSecurityExchange) :: (("LegPool",string_opt_to_json x.f_InstrumentLeg_LegPool) :: (("LegLocaleOfIssue",string_opt_to_json x.f_InstrumentLeg_LegLocaleOfIssue) :: (("LegInterestAccrualDate",localmktdate_opt_to_json x.f_InstrumentLeg_LegInterestAccrualDate) :: (("LegSecuritySubType",string_opt_to_json x.f_InstrumentLeg_LegSecuritySubType) :: (("LegSecurityDesc",string_opt_to_json x.f_InstrumentLeg_LegSecurityDesc) :: (("EncodedLegSecurityDescLen",int_opt_to_json x.f_InstrumentLeg_EncodedLegSecurityDescLen) :: (("LegSecurityType",string_opt_to_json x.f_InstrumentLeg_LegSecurityType) :: (("LegContractMultiplier",float_opt_to_json x.f_InstrumentLeg_LegContractMultiplier) :: (("LegSecurityIDSource",string_opt_to_json x.f_InstrumentLeg_LegSecurityIDSource) :: (("LegInstrRegistry",string_opt_to_json x.f_InstrumentLeg_LegInstrRegistry) :: (("LegStrikeCurrency",currency_opt_to_json x.f_InstrumentLeg_LegStrikeCurrency) :: (("EncodedLegIssuer",string_opt_to_json x.f_InstrumentLeg_EncodedLegIssuer) :: (("LegRepoCollateralSecurityType",string_opt_to_json x.f_InstrumentLeg_LegRepoCollateralSecurityType) :: (("LegStateOrProvinceOfIssue",string_opt_to_json x.f_InstrumentLeg_LegStateOrProvinceOfIssue) :: (("LegRatioQty",float_opt_to_json x.f_InstrumentLeg_LegRatioQty) :: (("LegOptAttribute",char_opt_to_json x.f_InstrumentLeg_LegOptAttribute) :: (("LegSecurityID",string_opt_to_json x.f_InstrumentLeg_LegSecurityID) :: (("LegProduct",int_opt_to_json x.f_InstrumentLeg_LegProduct) :: (("LegCreditRating",string_opt_to_json x.f_InstrumentLeg_LegCreditRating) :: (("LegSymbolSfx",string_opt_to_json x.f_InstrumentLeg_LegSymbolSfx) :: (("EncodedLegIssuerLen",int_opt_to_json x.f_InstrumentLeg_EncodedLegIssuerLen) :: (("LegCountryOfIssue",country_opt_to_json x.f_InstrumentLeg_LegCountryOfIssue) :: (("LegCouponPaymentDate",localmktdate_opt_to_json x.f_InstrumentLeg_LegCouponPaymentDate) :: (("LegRepurchaseRate",float_4_opt_to_json x.f_InstrumentLeg_LegRepurchaseRate) :: (("EncodedLegSecurityDesc",string_opt_to_json x.f_InstrumentLeg_EncodedLegSecurityDesc) :: (("LegCurrency",currency_opt_to_json x.f_InstrumentLeg_LegCurrency) :: (("LegCouponRate",float_4_opt_to_json x.f_InstrumentLeg_LegCouponRate) :: (("LegMaturityMonthYear",monthyear_opt_to_json x.f_InstrumentLeg_LegMaturityMonthYear) :: (("LegMaturityDate",localmktdate_opt_to_json x.f_InstrumentLeg_LegMaturityDate) :: (("LegStrikePrice",float_4_opt_to_json x.f_InstrumentLeg_LegStrikePrice) :: (("LegFactor",float_opt_to_json x.f_InstrumentLeg_LegFactor) :: (("LegRepurchaseTerm",int_opt_to_json x.f_InstrumentLeg_LegRepurchaseTerm) :: (("LegSecAltIDGrp",rg_for_json legsecaltidgrp_to_json x.f_InstrumentLeg_LegSecAltIDGrp) :: []))))))))))))))))))))))))))))))))))))))))))
;;

let parties_to_string (d)  =
    ""
;;

let parties_to_json (x)  : json =
    assoc_filter_nulls (("PartyIDSource",partyidsource_opt_to_json x.f_Parties_PartyIDSource) :: (("PartyRoleQualifier",partyrolequalifier_opt_to_json x.f_Parties_PartyRoleQualifier) :: (("PartyID",string_opt_to_json x.f_Parties_PartyID) :: (("PartyRole",partyrole_opt_to_json x.f_Parties_PartyRole) :: (("NoPartyIDs",int_opt_to_json x.f_Parties_NoPartyIDs) :: (("PtysSubGrp",rg_for_json ptyssubgrp_to_json x.f_Parties_PtysSubGrp) :: []))))))
;;

let nestedparties_to_string (d)  =
    ""
;;

let nestedparties_to_json (x)  : json =
    assoc_filter_nulls (("NoNestedPartyIDs",int_opt_to_json x.f_NestedParties_NoNestedPartyIDs) :: (("NestedPartyID",string_opt_to_json x.f_NestedParties_NestedPartyID) :: (("NestedPartyRole",int_opt_to_json x.f_NestedParties_NestedPartyRole) :: (("NestedPartyIDSource",char_opt_to_json x.f_NestedParties_NestedPartyIDSource) :: (("NstdPtysSubGrp",rg_for_json nstdptyssubgrp_to_json x.f_NestedParties_NstdPtysSubGrp) :: [])))))
;;

let instrumentextension_to_string (d)  =
    ""
;;

let instrumentextension_to_json (x)  : json =
    assoc_filter_nulls (("PctAtRisk",float_4_opt_to_json x.f_InstrumentExtension_PctAtRisk) :: (("DeliveryForm",deliveryform_opt_to_json x.f_InstrumentExtension_DeliveryForm) :: (("AttrbGrp",rg_for_json attrbgrp_to_json x.f_InstrumentExtension_AttrbGrp) :: [])))
;;

let nestedparties2_to_string (d)  =
    ""
;;

let nestedparties2_to_json (x)  : json =
    assoc_filter_nulls (("Nested2PartyRole",int_opt_to_json x.f_NestedParties2_Nested2PartyRole) :: (("NoNested2PartyIDs",int_opt_to_json x.f_NestedParties2_NoNested2PartyIDs) :: (("Nested2PartyIDSource",char_opt_to_json x.f_NestedParties2_Nested2PartyIDSource) :: (("Nested2PartyID",string_opt_to_json x.f_NestedParties2_Nested2PartyID) :: (("NstdPtys2SubGrp",rg_for_json nstdptys2subgrp_to_json x.f_NestedParties2_NstdPtys2SubGrp) :: [])))))
;;

let bidcomprspgrp_to_string (d)  =
    ""
;;

let bidcomprspgrp_to_json (x)  : json =
    assoc_filter_nulls (("CommissionData",commissiondata_to_json x.f_BidCompRspGrp_CommissionData) :: (("FairValue",float_4_opt_to_json x.f_BidCompRspGrp_FairValue) :: (("EncodedText",string_opt_to_json x.f_BidCompRspGrp_EncodedText) :: (("TradingSessionID",string_opt_to_json x.f_BidCompRspGrp_TradingSessionID) :: (("Text",string_opt_to_json x.f_BidCompRspGrp_Text) :: (("NetGrossInd",netgrossind_opt_to_json x.f_BidCompRspGrp_NetGrossInd) :: (("Side",side_opt_to_json x.f_BidCompRspGrp_Side) :: (("TradingSessionSubID",string_opt_to_json x.f_BidCompRspGrp_TradingSessionSubID) :: (("EncodedTextLen",int_opt_to_json x.f_BidCompRspGrp_EncodedTextLen) :: (("NoBidComponents",int_opt_to_json x.f_BidCompRspGrp_NoBidComponents) :: (("Price",float_4_opt_to_json x.f_BidCompRspGrp_Price) :: (("ListID",string_opt_to_json x.f_BidCompRspGrp_ListID) :: (("SettlType",settltype_opt_to_json x.f_BidCompRspGrp_SettlType) :: (("SettlDate",localmktdate_opt_to_json x.f_BidCompRspGrp_SettlDate) :: (("Country",country_opt_to_json x.f_BidCompRspGrp_Country) :: (("PriceType",pricetype_opt_to_json x.f_BidCompRspGrp_PriceType) :: []))))))))))))))))
;;

let underlyinginstrument_to_string (d)  =
    ""
;;

let underlyinginstrument_to_json (x)  : json =
    assoc_filter_nulls (("UnderlyingProduct",int_opt_to_json x.f_UnderlyingInstrument_UnderlyingProduct) :: (("UnderlyingStartValue",float_4_opt_to_json x.f_UnderlyingInstrument_UnderlyingStartValue) :: (("UnderlyingCPProgram",string_opt_to_json x.f_UnderlyingInstrument_UnderlyingCPProgram) :: (("UnderlyingQty",float_4_opt_to_json x.f_UnderlyingInstrument_UnderlyingQty) :: (("UnderlyingCurrentValue",float_4_opt_to_json x.f_UnderlyingInstrument_UnderlyingCurrentValue) :: (("UnderlyingCurrency",currency_opt_to_json x.f_UnderlyingInstrument_UnderlyingCurrency) :: (("UnderlyingPx",float_4_opt_to_json x.f_UnderlyingInstrument_UnderlyingPx) :: (("UnderlyingSecurityType",string_opt_to_json x.f_UnderlyingInstrument_UnderlyingSecurityType) :: (("UnderlyingFactor",float_opt_to_json x.f_UnderlyingInstrument_UnderlyingFactor) :: (("UnderlyingCountryOfIssue",country_opt_to_json x.f_UnderlyingInstrument_UnderlyingCountryOfIssue) :: (("UnderlyingSecurityID",string_opt_to_json x.f_UnderlyingInstrument_UnderlyingSecurityID) :: (("UnderlyingInstrRegistry",string_opt_to_json x.f_UnderlyingInstrument_UnderlyingInstrRegistry) :: (("UnderlyingContractMultiplier",float_opt_to_json x.f_UnderlyingInstrument_UnderlyingContractMultiplier) :: (("UnderlyingSymbolSfx",string_opt_to_json x.f_UnderlyingInstrument_UnderlyingSymbolSfx) :: (("UnderlyingEndPrice",float_4_opt_to_json x.f_UnderlyingInstrument_UnderlyingEndPrice) :: (("UnderlyingSecuritySubType",string_opt_to_json x.f_UnderlyingInstrument_UnderlyingSecuritySubType) :: (("EncodedUnderlyingIssuerLen",int_opt_to_json x.f_UnderlyingInstrument_EncodedUnderlyingIssuerLen) :: (("UnderlyingIssuer",string_opt_to_json x.f_UnderlyingInstrument_UnderlyingIssuer) :: (("UnderlyingStrikePrice",float_4_opt_to_json x.f_UnderlyingInstrument_UnderlyingStrikePrice) :: (("UnderlyingEndValue",float_4_opt_to_json x.f_UnderlyingInstrument_UnderlyingEndValue) :: (("UnderlyingSymbol",string_opt_to_json x.f_UnderlyingInstrument_UnderlyingSymbol) :: (("UnderlyingMaturityDate",localmktdate_opt_to_json x.f_UnderlyingInstrument_UnderlyingMaturityDate) :: (("UnderlyingOptAttribute",char_opt_to_json x.f_UnderlyingInstrument_UnderlyingOptAttribute) :: (("UnderlyingSecurityIDSource",string_opt_to_json x.f_UnderlyingInstrument_UnderlyingSecurityIDSource) :: (("UnderlyingStateOrProvinceOfIssue",string_opt_to_json x.f_UnderlyingInstrument_UnderlyingStateOrProvinceOfIssue) :: (("UnderlyingRedemptionDate",localmktdate_opt_to_json x.f_UnderlyingInstrument_UnderlyingRedemptionDate) :: (("EncodedUnderlyingIssuer",string_opt_to_json x.f_UnderlyingInstrument_EncodedUnderlyingIssuer) :: (("UnderlyingMaturityMonthYear",monthyear_opt_to_json x.f_UnderlyingInstrument_UnderlyingMaturityMonthYear) :: (("UnderlyingStrikeCurrency",currency_opt_to_json x.f_UnderlyingInstrument_UnderlyingStrikeCurrency) :: (("UnderlyingCouponPaymentDate",localmktdate_opt_to_json x.f_UnderlyingInstrument_UnderlyingCouponPaymentDate) :: (("UnderlyingCouponRate",float_4_opt_to_json x.f_UnderlyingInstrument_UnderlyingCouponRate) :: (("UnderlyingCreditRating",string_opt_to_json x.f_UnderlyingInstrument_UnderlyingCreditRating) :: (("UnderlyingSecurityExchange",exchange_opt_to_json x.f_UnderlyingInstrument_UnderlyingSecurityExchange) :: (("UnderlyingIssueDate",localmktdate_opt_to_json x.f_UnderlyingInstrument_UnderlyingIssueDate) :: (("UnderlyingRepurchaseRate",float_4_opt_to_json x.f_UnderlyingInstrument_UnderlyingRepurchaseRate) :: (("UnderlyingCFICode",string_opt_to_json x.f_UnderlyingInstrument_UnderlyingCFICode) :: (("EncodedUnderlyingSecurityDescLen",int_opt_to_json x.f_UnderlyingInstrument_EncodedUnderlyingSecurityDescLen) :: (("UnderlyingDirtyPrice",float_4_opt_to_json x.f_UnderlyingInstrument_UnderlyingDirtyPrice) :: (("UnderlyingRepoCollateralSecurityType",string_opt_to_json x.f_UnderlyingInstrument_UnderlyingRepoCollateralSecurityType) :: (("UnderlyingLocaleOfIssue",string_opt_to_json x.f_UnderlyingInstrument_UnderlyingLocaleOfIssue) :: (("UnderlyingSecurityDesc",string_opt_to_json x.f_UnderlyingInstrument_UnderlyingSecurityDesc) :: (("EncodedUnderlyingSecurityDesc",string_opt_to_json x.f_UnderlyingInstrument_EncodedUnderlyingSecurityDesc) :: (("UnderlyingCPRegType",string_opt_to_json x.f_UnderlyingInstrument_UnderlyingCPRegType) :: (("UnderlyingRepurchaseTerm",int_opt_to_json x.f_UnderlyingInstrument_UnderlyingRepurchaseTerm) :: (("UndSecAltIDGrp",rg_for_json undsecaltidgrp_to_json x.f_UnderlyingInstrument_UndSecAltIDGrp) :: (("UnderlyingStipulations",rg_for_json underlyingstipulations_to_json x.f_UnderlyingInstrument_UnderlyingStipulations) :: []))))))))))))))))))))))))))))))))))))))))))))))
;;

let settlparties_to_string (d)  =
    ""
;;

let settlparties_to_json (x)  : json =
    assoc_filter_nulls (("NoSettlPartyIDs",int_opt_to_json x.f_SettlParties_NoSettlPartyIDs) :: (("SettlPartyIDSource",char_opt_to_json x.f_SettlParties_SettlPartyIDSource) :: (("SettlPartyRole",int_opt_to_json x.f_SettlParties_SettlPartyRole) :: (("SettlPartyID",string_opt_to_json x.f_SettlParties_SettlPartyID) :: (("SettlPtysSubGrp",rg_for_json settlptyssubgrp_to_json x.f_SettlParties_SettlPtysSubGrp) :: [])))))
;;

let instrument_to_string (d)  =
    ""
;;

let instrument_to_json (x)  : json =
    assoc_filter_nulls (("SecurityDesc",string_opt_to_json x.f_Instrument_SecurityDesc) :: (("CouponRate",float_4_opt_to_json x.f_Instrument_CouponRate) :: (("StrikePrice",float_4_opt_to_json x.f_Instrument_StrikePrice) :: (("CreditRating",string_opt_to_json x.f_Instrument_CreditRating) :: (("IssueDate",localmktdate_opt_to_json x.f_Instrument_IssueDate) :: (("OptAttribute",char_opt_to_json x.f_Instrument_OptAttribute) :: (("MaturityDate",localmktdate_opt_to_json x.f_Instrument_MaturityDate) :: (("SecurityIDSource",securityidsource_opt_to_json x.f_Instrument_SecurityIDSource) :: (("DatedDate",localmktdate_opt_to_json x.f_Instrument_DatedDate) :: (("EncodedIssuerLen",int_opt_to_json x.f_Instrument_EncodedIssuerLen) :: (("CPRegType",string_opt_to_json x.f_Instrument_CPRegType) :: (("InterestAccrualDate",localmktdate_opt_to_json x.f_Instrument_InterestAccrualDate) :: (("ContractMultiplier",float_opt_to_json x.f_Instrument_ContractMultiplier) :: (("EncodedSecurityDescLen",int_opt_to_json x.f_Instrument_EncodedSecurityDescLen) :: (("StateOrProvinceOfIssue",string_opt_to_json x.f_Instrument_StateOrProvinceOfIssue) :: (("RedemptionDate",localmktdate_opt_to_json x.f_Instrument_RedemptionDate) :: (("RepoCollateralSecurityType",string_opt_to_json x.f_Instrument_RepoCollateralSecurityType) :: (("CountryOfIssue",country_opt_to_json x.f_Instrument_CountryOfIssue) :: (("SecurityType",securitytype_opt_to_json x.f_Instrument_SecurityType) :: (("SymbolSfx",string_opt_to_json x.f_Instrument_SymbolSfx) :: (("Issuer",string_opt_to_json x.f_Instrument_Issuer) :: (("ContractSettlMonth",monthyear_opt_to_json x.f_Instrument_ContractSettlMonth) :: (("MaturityMonthYear",monthyear_opt_to_json x.f_Instrument_MaturityMonthYear) :: (("Product",product_opt_to_json x.f_Instrument_Product) :: (("Symbol",string_opt_to_json x.f_Instrument_Symbol) :: (("StrikeCurrency",currency_opt_to_json x.f_Instrument_StrikeCurrency) :: (("EncodedIssuer",string_opt_to_json x.f_Instrument_EncodedIssuer) :: (("CFICode",string_opt_to_json x.f_Instrument_CFICode) :: (("InstrRegistry",string_opt_to_json x.f_Instrument_InstrRegistry) :: (("RepurchaseTerm",int_opt_to_json x.f_Instrument_RepurchaseTerm) :: (("Factor",float_opt_to_json x.f_Instrument_Factor) :: (("CouponPaymentDate",localmktdate_opt_to_json x.f_Instrument_CouponPaymentDate) :: (("CPProgram",cpprogram_opt_to_json x.f_Instrument_CPProgram) :: (("SecurityID",string_opt_to_json x.f_Instrument_SecurityID) :: (("SecuritySubType",string_opt_to_json x.f_Instrument_SecuritySubType) :: (("LocaleOfIssue",string_opt_to_json x.f_Instrument_LocaleOfIssue) :: (("RepurchaseRate",float_4_opt_to_json x.f_Instrument_RepurchaseRate) :: (("SecurityExchange",exchange_opt_to_json x.f_Instrument_SecurityExchange) :: (("Pool",string_opt_to_json x.f_Instrument_Pool) :: (("EncodedSecurityDesc",string_opt_to_json x.f_Instrument_EncodedSecurityDesc) :: (("EvntGrp",rg_for_json evntgrp_to_json x.f_Instrument_EvntGrp) :: (("SecAltIDGrp",rg_for_json secaltidgrp_to_json x.f_Instrument_SecAltIDGrp) :: []))))))))))))))))))))))))))))))))))))))))))
;;

let nestedparties3_to_string (d)  =
    ""
;;

let nestedparties3_to_json (x)  : json =
    assoc_filter_nulls (("Nested3PartyRole",int_opt_to_json x.f_NestedParties3_Nested3PartyRole) :: (("Nested3PartyIDSource",char_opt_to_json x.f_NestedParties3_Nested3PartyIDSource) :: (("NoNested3PartyIDs",int_opt_to_json x.f_NestedParties3_NoNested3PartyIDs) :: (("Nested3PartyID",string_opt_to_json x.f_NestedParties3_Nested3PartyID) :: (("NstdPtys3SubGrp",rg_for_json nstdptys3subgrp_to_json x.f_NestedParties3_NstdPtys3SubGrp) :: [])))))
;;

let preallocmleggrp_to_string (d)  =
    ""
;;

let preallocmleggrp_to_json (x)  : json =
    assoc_filter_nulls (("IndividualAllocID",string_opt_to_json x.f_PreAllocMlegGrp_IndividualAllocID) :: (("NoAllocs",int_opt_to_json x.f_PreAllocMlegGrp_NoAllocs) :: (("AllocSettlCurrency",currency_opt_to_json x.f_PreAllocMlegGrp_AllocSettlCurrency) :: (("AllocQty",float_4_opt_to_json x.f_PreAllocMlegGrp_AllocQty) :: (("AllocAcctIDSource",int_opt_to_json x.f_PreAllocMlegGrp_AllocAcctIDSource) :: (("AllocAccount",string_opt_to_json x.f_PreAllocMlegGrp_AllocAccount) :: (("NestedParties3",rg_for_json nestedparties3_to_json x.f_PreAllocMlegGrp_NestedParties3) :: [])))))))
;;

let instrmtgrp_to_string (d)  =
    ""
;;

let instrmtgrp_to_json (x)  : json =
    assoc_filter_nulls (("Instrument",instrument_to_json x.f_InstrmtGrp_Instrument) :: (("NoRelatedSym",int_opt_to_json x.f_InstrmtGrp_NoRelatedSym) :: []))
;;

let instrmtstrkpxgrp_to_string (d)  =
    ""
;;

let instrmtstrkpxgrp_to_json (x)  : json =
    assoc_filter_nulls (("Instrument",instrument_to_json x.f_InstrmtStrkPxGrp_Instrument) :: (("NoStrikes",int_opt_to_json x.f_InstrmtStrkPxGrp_NoStrikes) :: []))
;;

let dlvyinstgrp_to_string (d)  =
    ""
;;

let dlvyinstgrp_to_json (x)  : json =
    assoc_filter_nulls (("DlvyInstType",dlvyinsttype_opt_to_json x.f_DlvyInstGrp_DlvyInstType) :: (("NoDlvyInst",int_opt_to_json x.f_DlvyInstGrp_NoDlvyInst) :: (("SettlInstSource",settlinstsource_opt_to_json x.f_DlvyInstGrp_SettlInstSource) :: (("SettlParties",rg_for_json settlparties_to_json x.f_DlvyInstGrp_SettlParties) :: []))))
;;

let undinstrmtstrkpxgrp_to_string (d)  =
    ""
;;

let undinstrmtstrkpxgrp_to_json (x)  : json =
    assoc_filter_nulls (("UnderlyingInstrument",underlyinginstrument_to_json x.f_UndInstrmtStrkPxGrp_UnderlyingInstrument) :: (("Side",side_opt_to_json x.f_UndInstrmtStrkPxGrp_Side) :: (("EncodedTextLen",int_opt_to_json x.f_UndInstrmtStrkPxGrp_EncodedTextLen) :: (("Price",float_4_opt_to_json x.f_UndInstrmtStrkPxGrp_Price) :: (("Currency",currency_opt_to_json x.f_UndInstrmtStrkPxGrp_Currency) :: (("EncodedText",string_opt_to_json x.f_UndInstrmtStrkPxGrp_EncodedText) :: (("PrevClosePx",float_4_opt_to_json x.f_UndInstrmtStrkPxGrp_PrevClosePx) :: (("ClOrdID",string_opt_to_json x.f_UndInstrmtStrkPxGrp_ClOrdID) :: (("NoUnderlyings",int_opt_to_json x.f_UndInstrmtStrkPxGrp_NoUnderlyings) :: (("Text",string_opt_to_json x.f_UndInstrmtStrkPxGrp_Text) :: (("SecondaryClOrdID",string_opt_to_json x.f_UndInstrmtStrkPxGrp_SecondaryClOrdID) :: [])))))))))))
;;

let posundinstrmtgrp_to_string (d)  =
    ""
;;

let posundinstrmtgrp_to_json (x)  : json =
    assoc_filter_nulls (("UnderlyingInstrument",underlyinginstrument_to_json x.f_PosUndInstrmtGrp_UnderlyingInstrument) :: (("UnderlyingSettlPriceType",int_opt_to_json x.f_PosUndInstrmtGrp_UnderlyingSettlPriceType) :: (("NoUnderlyings",int_opt_to_json x.f_PosUndInstrmtGrp_NoUnderlyings) :: (("UnderlyingSettlPrice",float_4_opt_to_json x.f_PosUndInstrmtGrp_UnderlyingSettlPrice) :: []))))
;;

let undinstrmtgrp_to_string (d)  =
    ""
;;

let undinstrmtgrp_to_json (x)  : json =
    assoc_filter_nulls (("UnderlyingInstrument",underlyinginstrument_to_json x.f_UndInstrmtGrp_UnderlyingInstrument) :: (("NoUnderlyings",int_opt_to_json x.f_UndInstrmtGrp_NoUnderlyings) :: []))
;;

let undinstrmtcollgrp_to_string (d)  =
    ""
;;

let undinstrmtcollgrp_to_json (x)  : json =
    assoc_filter_nulls (("UnderlyingInstrument",underlyinginstrument_to_json x.f_UndInstrmtCollGrp_UnderlyingInstrument) :: (("CollAction",collaction_opt_to_json x.f_UndInstrmtCollGrp_CollAction) :: (("NoUnderlyings",int_opt_to_json x.f_UndInstrmtCollGrp_NoUnderlyings) :: [])))
;;

let ordallocgrp_to_string (d)  =
    ""
;;

let ordallocgrp_to_json (x)  : json =
    assoc_filter_nulls (("OrderBookingQty",float_4_opt_to_json x.f_OrdAllocGrp_OrderBookingQty) :: (("ListID",string_opt_to_json x.f_OrdAllocGrp_ListID) :: (("NoOrders",int_opt_to_json x.f_OrdAllocGrp_NoOrders) :: (("SecondaryOrderID",string_opt_to_json x.f_OrdAllocGrp_SecondaryOrderID) :: (("ClOrdID",string_opt_to_json x.f_OrdAllocGrp_ClOrdID) :: (("OrderAvgPx",float_4_opt_to_json x.f_OrdAllocGrp_OrderAvgPx) :: (("OrderQty",float_4_opt_to_json x.f_OrdAllocGrp_OrderQty) :: (("SecondaryClOrdID",string_opt_to_json x.f_OrdAllocGrp_SecondaryClOrdID) :: (("OrderID",string_opt_to_json x.f_OrdAllocGrp_OrderID) :: (("NestedParties2",rg_for_json nestedparties2_to_json x.f_OrdAllocGrp_NestedParties2) :: []))))))))))
;;

let legpreallocgrp_to_string (d)  =
    ""
;;

let legpreallocgrp_to_json (x)  : json =
    assoc_filter_nulls (("LegAllocAcctIDSource",string_opt_to_json x.f_LegPreAllocGrp_LegAllocAcctIDSource) :: (("LegIndividualAllocID",string_opt_to_json x.f_LegPreAllocGrp_LegIndividualAllocID) :: (("LegAllocQty",float_4_opt_to_json x.f_LegPreAllocGrp_LegAllocQty) :: (("NoLegAllocs",int_opt_to_json x.f_LegPreAllocGrp_NoLegAllocs) :: (("LegSettlCurrency",currency_opt_to_json x.f_LegPreAllocGrp_LegSettlCurrency) :: (("LegAllocAccount",string_opt_to_json x.f_LegPreAllocGrp_LegAllocAccount) :: (("NestedParties2",rg_for_json nestedparties2_to_json x.f_LegPreAllocGrp_NestedParties2) :: [])))))))
;;

let trdallocgrp_to_string (d)  =
    ""
;;

let trdallocgrp_to_json (x)  : json =
    assoc_filter_nulls (("IndividualAllocID",string_opt_to_json x.f_TrdAllocGrp_IndividualAllocID) :: (("NoAllocs",int_opt_to_json x.f_TrdAllocGrp_NoAllocs) :: (("AllocSettlCurrency",currency_opt_to_json x.f_TrdAllocGrp_AllocSettlCurrency) :: (("AllocQty",float_4_opt_to_json x.f_TrdAllocGrp_AllocQty) :: (("AllocAcctIDSource",int_opt_to_json x.f_TrdAllocGrp_AllocAcctIDSource) :: (("AllocAccount",string_opt_to_json x.f_TrdAllocGrp_AllocAccount) :: (("NestedParties2",rg_for_json nestedparties2_to_json x.f_TrdAllocGrp_NestedParties2) :: [])))))))
;;

let preallocgrp_to_string (d)  =
    ""
;;

let preallocgrp_to_json (x)  : json =
    assoc_filter_nulls (("IndividualAllocID",string_opt_to_json x.f_PreAllocGrp_IndividualAllocID) :: (("NoAllocs",int_opt_to_json x.f_PreAllocGrp_NoAllocs) :: (("AllocSettlCurrency",currency_opt_to_json x.f_PreAllocGrp_AllocSettlCurrency) :: (("AllocQty",float_4_opt_to_json x.f_PreAllocGrp_AllocQty) :: (("AllocAcctIDSource",int_opt_to_json x.f_PreAllocGrp_AllocAcctIDSource) :: (("AllocAccount",string_opt_to_json x.f_PreAllocGrp_AllocAccount) :: (("NestedParties",rg_for_json nestedparties_to_json x.f_PreAllocGrp_NestedParties) :: [])))))))
;;

let positionqty_to_string (d)  =
    ""
;;

let positionqty_to_json (x)  : json =
    assoc_filter_nulls (("NoPositions",int_opt_to_json x.f_PositionQty_NoPositions) :: (("PosType",postype_opt_to_json x.f_PositionQty_PosType) :: (("ShortQty",float_4_opt_to_json x.f_PositionQty_ShortQty) :: (("LongQty",float_4_opt_to_json x.f_PositionQty_LongQty) :: (("PosQtyStatus",posqtystatus_opt_to_json x.f_PositionQty_PosQtyStatus) :: (("NestedParties",rg_for_json nestedparties_to_json x.f_PositionQty_NestedParties) :: []))))))
;;

let rgstdtlsgrp_to_string (d)  =
    ""
;;

let rgstdtlsgrp_to_json (x)  : json =
    assoc_filter_nulls (("RegistDtls",string_opt_to_json x.f_RgstDtlsGrp_RegistDtls) :: (("OwnerType",ownertype_opt_to_json x.f_RgstDtlsGrp_OwnerType) :: (("DateOfBirth",localmktdate_opt_to_json x.f_RgstDtlsGrp_DateOfBirth) :: (("RegistEmail",string_opt_to_json x.f_RgstDtlsGrp_RegistEmail) :: (("NoRegistDtls",int_opt_to_json x.f_RgstDtlsGrp_NoRegistDtls) :: (("InvestorCountryOfResidence",country_opt_to_json x.f_RgstDtlsGrp_InvestorCountryOfResidence) :: (("MailingDtls",string_opt_to_json x.f_RgstDtlsGrp_MailingDtls) :: (("MailingInst",string_opt_to_json x.f_RgstDtlsGrp_MailingInst) :: (("NestedParties",rg_for_json nestedparties_to_json x.f_RgstDtlsGrp_NestedParties) :: [])))))))))
;;

let sidecrossordcxlgrp_to_string (d)  =
    ""
;;

let sidecrossordcxlgrp_to_json (x)  : json =
    assoc_filter_nulls (("OrderQtyData",orderqtydata_to_json x.f_SideCrossOrdCxlGrp_OrderQtyData) :: (("EncodedText",string_opt_to_json x.f_SideCrossOrdCxlGrp_EncodedText) :: (("NoSides",int_opt_to_json x.f_SideCrossOrdCxlGrp_NoSides) :: (("ClOrdID",string_opt_to_json x.f_SideCrossOrdCxlGrp_ClOrdID) :: (("TradeOriginationDate",localmktdate_opt_to_json x.f_SideCrossOrdCxlGrp_TradeOriginationDate) :: (("Text",string_opt_to_json x.f_SideCrossOrdCxlGrp_Text) :: (("SecondaryClOrdID",string_opt_to_json x.f_SideCrossOrdCxlGrp_SecondaryClOrdID) :: (("Side",side_opt_to_json x.f_SideCrossOrdCxlGrp_Side) :: (("EncodedTextLen",int_opt_to_json x.f_SideCrossOrdCxlGrp_EncodedTextLen) :: (("OrigOrdModTime",utctimestamp_opt_to_json x.f_SideCrossOrdCxlGrp_OrigOrdModTime) :: (("ComplianceID",string_opt_to_json x.f_SideCrossOrdCxlGrp_ComplianceID) :: (("ClOrdLinkID",string_opt_to_json x.f_SideCrossOrdCxlGrp_ClOrdLinkID) :: (("TradeDate",localmktdate_opt_to_json x.f_SideCrossOrdCxlGrp_TradeDate) :: (("OrigClOrdID",string_opt_to_json x.f_SideCrossOrdCxlGrp_OrigClOrdID) :: (("Parties",rg_for_json parties_to_json x.f_SideCrossOrdCxlGrp_Parties) :: [])))))))))))))))
;;

let instrmtleggrp_to_string (d)  =
    ""
;;

let instrmtleggrp_to_json (x)  : json =
    assoc_filter_nulls (("InstrumentLeg",instrumentleg_to_json x.f_InstrmtLegGrp_InstrumentLeg) :: (("NoLegs",int_opt_to_json x.f_InstrmtLegGrp_NoLegs) :: []))
;;

let legquotstatgrp_to_string (d)  =
    ""
;;

let legquotstatgrp_to_json (x)  : json =
    assoc_filter_nulls (("InstrumentLeg",instrumentleg_to_json x.f_LegQuotStatGrp_InstrumentLeg) :: (("LegQty",float_4_opt_to_json x.f_LegQuotStatGrp_LegQty) :: (("LegSettlDate",localmktdate_opt_to_json x.f_LegQuotStatGrp_LegSettlDate) :: (("LegSwapType",legswaptype_opt_to_json x.f_LegQuotStatGrp_LegSwapType) :: (("LegSettlType",char_opt_to_json x.f_LegQuotStatGrp_LegSettlType) :: (("NoLegs",int_opt_to_json x.f_LegQuotStatGrp_NoLegs) :: (("LegStipulations",rg_for_json legstipulations_to_json x.f_LegQuotStatGrp_LegStipulations) :: (("NestedParties",rg_for_json nestedparties_to_json x.f_LegQuotStatGrp_NestedParties) :: []))))))))
;;

let instrmtlegioigrp_to_string (d)  =
    ""
;;

let instrmtlegioigrp_to_json (x)  : json =
    assoc_filter_nulls (("InstrumentLeg",instrumentleg_to_json x.f_InstrmtLegIOIGrp_InstrumentLeg) :: (("LegIOIQty",string_opt_to_json x.f_InstrmtLegIOIGrp_LegIOIQty) :: (("NoLegs",int_opt_to_json x.f_InstrmtLegIOIGrp_NoLegs) :: (("LegStipulations",rg_for_json legstipulations_to_json x.f_InstrmtLegIOIGrp_LegStipulations) :: []))))
;;

let instrmtlegexecgrp_to_string (d)  =
    ""
;;

let instrmtlegexecgrp_to_json (x)  : json =
    assoc_filter_nulls (("InstrumentLeg",instrumentleg_to_json x.f_InstrmtLegExecGrp_InstrumentLeg) :: (("LegQty",float_4_opt_to_json x.f_InstrmtLegExecGrp_LegQty) :: (("LegPositionEffect",char_opt_to_json x.f_InstrmtLegExecGrp_LegPositionEffect) :: (("LegSettlType",char_opt_to_json x.f_InstrmtLegExecGrp_LegSettlType) :: (("LegLastPx",float_4_opt_to_json x.f_InstrmtLegExecGrp_LegLastPx) :: (("LegPrice",float_4_opt_to_json x.f_InstrmtLegExecGrp_LegPrice) :: (("LegRefID",string_opt_to_json x.f_InstrmtLegExecGrp_LegRefID) :: (("LegSettlDate",localmktdate_opt_to_json x.f_InstrmtLegExecGrp_LegSettlDate) :: (("LegSwapType",legswaptype_opt_to_json x.f_InstrmtLegExecGrp_LegSwapType) :: (("LegCoveredOrUncovered",int_opt_to_json x.f_InstrmtLegExecGrp_LegCoveredOrUncovered) :: (("NoLegs",int_opt_to_json x.f_InstrmtLegExecGrp_NoLegs) :: (("LegStipulations",rg_for_json legstipulations_to_json x.f_InstrmtLegExecGrp_LegStipulations) :: (("NestedParties",rg_for_json nestedparties_to_json x.f_InstrmtLegExecGrp_NestedParties) :: [])))))))))))))
;;

let instrmtlegseclistgrp_to_string (d)  =
    ""
;;

let instrmtlegseclistgrp_to_json (x)  : json =
    assoc_filter_nulls (("LegBenchmarkCurveData",legbenchmarkcurvedata_to_json x.f_InstrmtLegSecListGrp_LegBenchmarkCurveData) :: (("InstrumentLeg",instrumentleg_to_json x.f_InstrmtLegSecListGrp_InstrumentLeg) :: (("LegSwapType",legswaptype_opt_to_json x.f_InstrmtLegSecListGrp_LegSwapType) :: (("LegSettlType",char_opt_to_json x.f_InstrmtLegSecListGrp_LegSettlType) :: (("NoLegs",int_opt_to_json x.f_InstrmtLegSecListGrp_NoLegs) :: (("LegStipulations",rg_for_json legstipulations_to_json x.f_InstrmtLegSecListGrp_LegStipulations) :: []))))))
;;

let legquotgrp_to_string (d)  =
    ""
;;

let legquotgrp_to_json (x)  : json =
    assoc_filter_nulls (("LegBenchmarkCurveData",legbenchmarkcurvedata_to_json x.f_LegQuotGrp_LegBenchmarkCurveData) :: (("InstrumentLeg",instrumentleg_to_json x.f_LegQuotGrp_InstrumentLeg) :: (("LegBidPx",float_4_opt_to_json x.f_LegQuotGrp_LegBidPx) :: (("LegPriceType",int_opt_to_json x.f_LegQuotGrp_LegPriceType) :: (("LegQty",float_4_opt_to_json x.f_LegQuotGrp_LegQty) :: (("LegSettlDate",localmktdate_opt_to_json x.f_LegQuotGrp_LegSettlDate) :: (("LegOfferPx",float_4_opt_to_json x.f_LegQuotGrp_LegOfferPx) :: (("LegSwapType",legswaptype_opt_to_json x.f_LegQuotGrp_LegSwapType) :: (("LegSettlType",char_opt_to_json x.f_LegQuotGrp_LegSettlType) :: (("NoLegs",int_opt_to_json x.f_LegQuotGrp_NoLegs) :: (("LegStipulations",rg_for_json legstipulations_to_json x.f_LegQuotGrp_LegStipulations) :: (("NestedParties",rg_for_json nestedparties_to_json x.f_LegQuotGrp_NestedParties) :: []))))))))))))
;;

let trdinstrmtleggrp_to_string (d)  =
    ""
;;

let trdinstrmtleggrp_to_json (x)  : json =
    assoc_filter_nulls (("InstrumentLeg",instrumentleg_to_json x.f_TrdInstrmtLegGrp_InstrumentLeg) :: (("LegQty",float_4_opt_to_json x.f_TrdInstrmtLegGrp_LegQty) :: (("LegPositionEffect",char_opt_to_json x.f_TrdInstrmtLegGrp_LegPositionEffect) :: (("LegSettlType",char_opt_to_json x.f_TrdInstrmtLegGrp_LegSettlType) :: (("LegLastPx",float_4_opt_to_json x.f_TrdInstrmtLegGrp_LegLastPx) :: (("LegPrice",float_4_opt_to_json x.f_TrdInstrmtLegGrp_LegPrice) :: (("LegRefID",string_opt_to_json x.f_TrdInstrmtLegGrp_LegRefID) :: (("LegSettlDate",localmktdate_opt_to_json x.f_TrdInstrmtLegGrp_LegSettlDate) :: (("LegSwapType",legswaptype_opt_to_json x.f_TrdInstrmtLegGrp_LegSwapType) :: (("LegCoveredOrUncovered",int_opt_to_json x.f_TrdInstrmtLegGrp_LegCoveredOrUncovered) :: (("NoLegs",int_opt_to_json x.f_TrdInstrmtLegGrp_NoLegs) :: (("LegStipulations",rg_for_json legstipulations_to_json x.f_TrdInstrmtLegGrp_LegStipulations) :: (("NestedParties",rg_for_json nestedparties_to_json x.f_TrdInstrmtLegGrp_NestedParties) :: [])))))))))))))
;;

let quotreqlegsgrp_to_string (d)  =
    ""
;;

let quotreqlegsgrp_to_json (x)  : json =
    assoc_filter_nulls (("LegBenchmarkCurveData",legbenchmarkcurvedata_to_json x.f_QuotReqLegsGrp_LegBenchmarkCurveData) :: (("InstrumentLeg",instrumentleg_to_json x.f_QuotReqLegsGrp_InstrumentLeg) :: (("LegQty",float_4_opt_to_json x.f_QuotReqLegsGrp_LegQty) :: (("LegSettlDate",localmktdate_opt_to_json x.f_QuotReqLegsGrp_LegSettlDate) :: (("LegSwapType",legswaptype_opt_to_json x.f_QuotReqLegsGrp_LegSwapType) :: (("LegSettlType",char_opt_to_json x.f_QuotReqLegsGrp_LegSettlType) :: (("NoLegs",int_opt_to_json x.f_QuotReqLegsGrp_NoLegs) :: (("LegStipulations",rg_for_json legstipulations_to_json x.f_QuotReqLegsGrp_LegStipulations) :: (("NestedParties",rg_for_json nestedparties_to_json x.f_QuotReqLegsGrp_NestedParties) :: [])))))))))
;;

let relsymderivsecgrp_to_string (d)  =
    ""
;;

let relsymderivsecgrp_to_json (x)  : json =
    assoc_filter_nulls (("Instrument",instrument_to_json x.f_RelSymDerivSecGrp_Instrument) :: (("InstrumentExtension",instrumentextension_to_json x.f_RelSymDerivSecGrp_InstrumentExtension) :: (("TradingSessionSubID",string_opt_to_json x.f_RelSymDerivSecGrp_TradingSessionSubID) :: (("ExpirationCycle",expirationcycle_opt_to_json x.f_RelSymDerivSecGrp_ExpirationCycle) :: (("EncodedTextLen",int_opt_to_json x.f_RelSymDerivSecGrp_EncodedTextLen) :: (("Currency",currency_opt_to_json x.f_RelSymDerivSecGrp_Currency) :: (("NoRelatedSym",int_opt_to_json x.f_RelSymDerivSecGrp_NoRelatedSym) :: (("EncodedText",string_opt_to_json x.f_RelSymDerivSecGrp_EncodedText) :: (("TradingSessionID",string_opt_to_json x.f_RelSymDerivSecGrp_TradingSessionID) :: (("Text",string_opt_to_json x.f_RelSymDerivSecGrp_Text) :: (("InstrmtLegGrp",rg_for_json instrmtleggrp_to_json x.f_RelSymDerivSecGrp_InstrmtLegGrp) :: [])))))))))))
;;

let quotentryackgrp_to_string (d)  =
    ""
;;

let quotentryackgrp_to_json (x)  : json =
    assoc_filter_nulls (("Instrument",instrument_to_json x.f_QuotEntryAckGrp_Instrument) :: (("MidYield",float_4_opt_to_json x.f_QuotEntryAckGrp_MidYield) :: (("MidPx",float_4_opt_to_json x.f_QuotEntryAckGrp_MidPx) :: (("ValidUntilTime",utctimestamp_opt_to_json x.f_QuotEntryAckGrp_ValidUntilTime) :: (("OrdType",ordtype_opt_to_json x.f_QuotEntryAckGrp_OrdType) :: (("BidForwardPoints2",float_4_opt_to_json x.f_QuotEntryAckGrp_BidForwardPoints2) :: (("OfferSpotRate",float_4_opt_to_json x.f_QuotEntryAckGrp_OfferSpotRate) :: (("OfferYield",float_4_opt_to_json x.f_QuotEntryAckGrp_OfferYield) :: (("BidForwardPoints",float_4_opt_to_json x.f_QuotEntryAckGrp_BidForwardPoints) :: (("TradingSessionSubID",string_opt_to_json x.f_QuotEntryAckGrp_TradingSessionSubID) :: (("BidSpotRate",float_4_opt_to_json x.f_QuotEntryAckGrp_BidSpotRate) :: (("OfferPx",float_4_opt_to_json x.f_QuotEntryAckGrp_OfferPx) :: (("OfferSize",float_4_opt_to_json x.f_QuotEntryAckGrp_OfferSize) :: (("TradingSessionID",string_opt_to_json x.f_QuotEntryAckGrp_TradingSessionID) :: (("SettlDate2",localmktdate_opt_to_json x.f_QuotEntryAckGrp_SettlDate2) :: (("BidSize",float_4_opt_to_json x.f_QuotEntryAckGrp_BidSize) :: (("TransactTime",utctimestamp_opt_to_json x.f_QuotEntryAckGrp_TransactTime) :: (("QuoteEntryRejectReason",int_opt_to_json x.f_QuotEntryAckGrp_QuoteEntryRejectReason) :: (("OrderQty2",float_4_opt_to_json x.f_QuotEntryAckGrp_OrderQty2) :: (("Currency",currency_opt_to_json x.f_QuotEntryAckGrp_Currency) :: (("QuoteEntryID",string_opt_to_json x.f_QuotEntryAckGrp_QuoteEntryID) :: (("BidPx",float_4_opt_to_json x.f_QuotEntryAckGrp_BidPx) :: (("BidYield",float_4_opt_to_json x.f_QuotEntryAckGrp_BidYield) :: (("SettlDate",localmktdate_opt_to_json x.f_QuotEntryAckGrp_SettlDate) :: (("OfferForwardPoints",float_4_opt_to_json x.f_QuotEntryAckGrp_OfferForwardPoints) :: (("OfferForwardPoints2",float_4_opt_to_json x.f_QuotEntryAckGrp_OfferForwardPoints2) :: (("NoQuoteEntries",int_opt_to_json x.f_QuotEntryAckGrp_NoQuoteEntries) :: (("InstrmtLegGrp",rg_for_json instrmtleggrp_to_json x.f_QuotEntryAckGrp_InstrmtLegGrp) :: []))))))))))))))))))))))))))))
;;

let quotentrygrp_to_string (d)  =
    ""
;;

let quotentrygrp_to_json (x)  : json =
    assoc_filter_nulls (("Instrument",instrument_to_json x.f_QuotEntryGrp_Instrument) :: (("MidYield",float_4_opt_to_json x.f_QuotEntryGrp_MidYield) :: (("MidPx",float_4_opt_to_json x.f_QuotEntryGrp_MidPx) :: (("ValidUntilTime",utctimestamp_opt_to_json x.f_QuotEntryGrp_ValidUntilTime) :: (("OrdType",ordtype_opt_to_json x.f_QuotEntryGrp_OrdType) :: (("BidForwardPoints2",float_4_opt_to_json x.f_QuotEntryGrp_BidForwardPoints2) :: (("OfferSpotRate",float_4_opt_to_json x.f_QuotEntryGrp_OfferSpotRate) :: (("OfferYield",float_4_opt_to_json x.f_QuotEntryGrp_OfferYield) :: (("BidForwardPoints",float_4_opt_to_json x.f_QuotEntryGrp_BidForwardPoints) :: (("TradingSessionSubID",string_opt_to_json x.f_QuotEntryGrp_TradingSessionSubID) :: (("BidSpotRate",float_4_opt_to_json x.f_QuotEntryGrp_BidSpotRate) :: (("OfferPx",float_4_opt_to_json x.f_QuotEntryGrp_OfferPx) :: (("OfferSize",float_4_opt_to_json x.f_QuotEntryGrp_OfferSize) :: (("TradingSessionID",string_opt_to_json x.f_QuotEntryGrp_TradingSessionID) :: (("SettlDate2",localmktdate_opt_to_json x.f_QuotEntryGrp_SettlDate2) :: (("BidSize",float_4_opt_to_json x.f_QuotEntryGrp_BidSize) :: (("TransactTime",utctimestamp_opt_to_json x.f_QuotEntryGrp_TransactTime) :: (("OrderQty2",float_4_opt_to_json x.f_QuotEntryGrp_OrderQty2) :: (("Currency",currency_opt_to_json x.f_QuotEntryGrp_Currency) :: (("QuoteEntryID",string_opt_to_json x.f_QuotEntryGrp_QuoteEntryID) :: (("BidPx",float_4_opt_to_json x.f_QuotEntryGrp_BidPx) :: (("BidYield",float_4_opt_to_json x.f_QuotEntryGrp_BidYield) :: (("SettlDate",localmktdate_opt_to_json x.f_QuotEntryGrp_SettlDate) :: (("OfferForwardPoints",float_4_opt_to_json x.f_QuotEntryGrp_OfferForwardPoints) :: (("OfferForwardPoints2",float_4_opt_to_json x.f_QuotEntryGrp_OfferForwardPoints2) :: (("NoQuoteEntries",int_opt_to_json x.f_QuotEntryGrp_NoQuoteEntries) :: (("InstrmtLegGrp",rg_for_json instrmtleggrp_to_json x.f_QuotEntryGrp_InstrmtLegGrp) :: [])))))))))))))))))))))))))))
;;

let sidecrossordmodgrp_to_string (d)  =
    ""
;;

let sidecrossordmodgrp_to_json (x)  : json =
    assoc_filter_nulls (("CommissionData",commissiondata_to_json x.f_SideCrossOrdModGrp_CommissionData) :: (("OrderQtyData",orderqtydata_to_json x.f_SideCrossOrdModGrp_OrderQtyData) :: (("SolicitedFlag",solicitedflag_opt_to_json x.f_SideCrossOrdModGrp_SolicitedFlag) :: (("OrderCapacity",ordercapacity_opt_to_json x.f_SideCrossOrdModGrp_OrderCapacity) :: (("CustOrderCapacity",custordercapacity_opt_to_json x.f_SideCrossOrdModGrp_CustOrderCapacity) :: (("CashMargin",cashmargin_opt_to_json x.f_SideCrossOrdModGrp_CashMargin) :: (("SideComplianceID",string_opt_to_json x.f_SideCrossOrdModGrp_SideComplianceID) :: (("ClOrdID",string_opt_to_json x.f_SideCrossOrdModGrp_ClOrdID) :: (("Text",string_opt_to_json x.f_SideCrossOrdModGrp_Text) :: (("SecondaryClOrdID",string_opt_to_json x.f_SideCrossOrdModGrp_SecondaryClOrdID) :: (("AccountType",accounttype_opt_to_json x.f_SideCrossOrdModGrp_AccountType) :: (("DayBookingInst",daybookinginst_opt_to_json x.f_SideCrossOrdModGrp_DayBookingInst) :: (("QtyType",qtytype_opt_to_json x.f_SideCrossOrdModGrp_QtyType) :: (("ClearingFeeIndicator",clearingfeeindicator_opt_to_json x.f_SideCrossOrdModGrp_ClearingFeeIndicator) :: (("OrderRestrictions",orderrestrictions_opt_to_json x.f_SideCrossOrdModGrp_OrderRestrictions) :: (("CoveredOrUncovered",coveredoruncovered_opt_to_json x.f_SideCrossOrdModGrp_CoveredOrUncovered) :: (("Account",string_opt_to_json x.f_SideCrossOrdModGrp_Account) :: (("AcctIDSource",acctidsource_opt_to_json x.f_SideCrossOrdModGrp_AcctIDSource) :: (("PreallocMethod",preallocmethod_opt_to_json x.f_SideCrossOrdModGrp_PreallocMethod) :: (("EncodedText",string_opt_to_json x.f_SideCrossOrdModGrp_EncodedText) :: (("NoSides",int_opt_to_json x.f_SideCrossOrdModGrp_NoSides) :: (("TradeOriginationDate",localmktdate_opt_to_json x.f_SideCrossOrdModGrp_TradeOriginationDate) :: (("AllocID",string_opt_to_json x.f_SideCrossOrdModGrp_AllocID) :: (("Side",side_opt_to_json x.f_SideCrossOrdModGrp_Side) :: (("EncodedTextLen",int_opt_to_json x.f_SideCrossOrdModGrp_EncodedTextLen) :: (("BookingUnit",bookingunit_opt_to_json x.f_SideCrossOrdModGrp_BookingUnit) :: (("ForexReq",forexreq_opt_to_json x.f_SideCrossOrdModGrp_ForexReq) :: (("SettlCurrency",currency_opt_to_json x.f_SideCrossOrdModGrp_SettlCurrency) :: (("PositionEffect",positioneffect_opt_to_json x.f_SideCrossOrdModGrp_PositionEffect) :: (("ClOrdLinkID",string_opt_to_json x.f_SideCrossOrdModGrp_ClOrdLinkID) :: (("TradeDate",localmktdate_opt_to_json x.f_SideCrossOrdModGrp_TradeDate) :: (("BookingType",bookingtype_opt_to_json x.f_SideCrossOrdModGrp_BookingType) :: (("Parties",rg_for_json parties_to_json x.f_SideCrossOrdModGrp_Parties) :: (("PreAllocGrp",rg_for_json preallocgrp_to_json x.f_SideCrossOrdModGrp_PreAllocGrp) :: []))))))))))))))))))))))))))))))))))
;;

let trdcaprptsidegrp_to_string (d)  =
    ""
;;

let trdcaprptsidegrp_to_json (x)  : json =
    assoc_filter_nulls (("CommissionData",commissiondata_to_json x.f_TrdCapRptSideGrp_CommissionData) :: (("TransBkdTime",utctimestamp_opt_to_json x.f_TrdCapRptSideGrp_TransBkdTime) :: (("SolicitedFlag",solicitedflag_opt_to_json x.f_TrdCapRptSideGrp_SolicitedFlag) :: (("OrderCapacity",ordercapacity_opt_to_json x.f_TrdCapRptSideGrp_OrderCapacity) :: (("OrdType",ordtype_opt_to_json x.f_TrdCapRptSideGrp_OrdType) :: (("SecondaryOrderID",string_opt_to_json x.f_TrdCapRptSideGrp_SecondaryOrderID) :: (("TradeInputSource",string_opt_to_json x.f_TrdCapRptSideGrp_TradeInputSource) :: (("SecondaryClOrdID",string_opt_to_json x.f_TrdCapRptSideGrp_SecondaryClOrdID) :: (("AccountType",accounttype_opt_to_json x.f_TrdCapRptSideGrp_AccountType) :: (("ProcessCode",processcode_opt_to_json x.f_TrdCapRptSideGrp_ProcessCode) :: (("AccruedInterestAmt",float_4_opt_to_json x.f_TrdCapRptSideGrp_AccruedInterestAmt) :: (("Concession",float_4_opt_to_json x.f_TrdCapRptSideGrp_Concession) :: (("TimeBracket",string_opt_to_json x.f_TrdCapRptSideGrp_TimeBracket) :: (("OddLot",oddlot_opt_to_json x.f_TrdCapRptSideGrp_OddLot) :: (("Account",string_opt_to_json x.f_TrdCapRptSideGrp_Account) :: (("AcctIDSource",acctidsource_opt_to_json x.f_TrdCapRptSideGrp_AcctIDSource) :: (("PreallocMethod",preallocmethod_opt_to_json x.f_TrdCapRptSideGrp_PreallocMethod) :: (("OrderID",string_opt_to_json x.f_TrdCapRptSideGrp_OrderID) :: (("Side",side_opt_to_json x.f_TrdCapRptSideGrp_Side) :: (("EncodedTextLen",int_opt_to_json x.f_TrdCapRptSideGrp_EncodedTextLen) :: (("AccruedInterestRate",float_4_opt_to_json x.f_TrdCapRptSideGrp_AccruedInterestRate) :: (("InterestAtMaturity",float_4_opt_to_json x.f_TrdCapRptSideGrp_InterestAtMaturity) :: (("NetMoney",float_4_opt_to_json x.f_TrdCapRptSideGrp_NetMoney) :: (("ComplianceID",string_opt_to_json x.f_TrdCapRptSideGrp_ComplianceID) :: (("ExDate",localmktdate_opt_to_json x.f_TrdCapRptSideGrp_ExDate) :: (("OrderInputDevice",string_opt_to_json x.f_TrdCapRptSideGrp_OrderInputDevice) :: (("ExecInst",execinst_opt_to_json x.f_TrdCapRptSideGrp_ExecInst) :: (("TradeAllocIndicator",tradeallocindicator_opt_to_json x.f_TrdCapRptSideGrp_TradeAllocIndicator) :: (("TotalTakedown",float_4_opt_to_json x.f_TrdCapRptSideGrp_TotalTakedown) :: (("SettlCurrAmt",float_4_opt_to_json x.f_TrdCapRptSideGrp_SettlCurrAmt) :: (("CustOrderCapacity",custordercapacity_opt_to_json x.f_TrdCapRptSideGrp_CustOrderCapacity) :: (("ClOrdID",string_opt_to_json x.f_TrdCapRptSideGrp_ClOrdID) :: (("EndCash",float_4_opt_to_json x.f_TrdCapRptSideGrp_EndCash) :: (("StartCash",float_4_opt_to_json x.f_TrdCapRptSideGrp_StartCash) :: (("Text",string_opt_to_json x.f_TrdCapRptSideGrp_Text) :: (("SideMultiLegReportingType",sidemultilegreportingtype_opt_to_json x.f_TrdCapRptSideGrp_SideMultiLegReportingType) :: (("TradingSessionSubID",string_opt_to_json x.f_TrdCapRptSideGrp_TradingSessionSubID) :: (("GrossTradeAmt",float_4_opt_to_json x.f_TrdCapRptSideGrp_GrossTradeAmt) :: (("ListID",string_opt_to_json x.f_TrdCapRptSideGrp_ListID) :: (("TradeInputDevice",string_opt_to_json x.f_TrdCapRptSideGrp_TradeInputDevice) :: (("OrderRestrictions",orderrestrictions_opt_to_json x.f_TrdCapRptSideGrp_OrderRestrictions) :: (("SettlCurrFxRate",float_opt_to_json x.f_TrdCapRptSideGrp_SettlCurrFxRate) :: (("NumDaysInterest",int_opt_to_json x.f_TrdCapRptSideGrp_NumDaysInterest) :: (("SettlCurrFxRateCalc",settlcurrfxratecalc_opt_to_json x.f_TrdCapRptSideGrp_SettlCurrFxRateCalc) :: (("EncodedText",string_opt_to_json x.f_TrdCapRptSideGrp_EncodedText) :: (("NoSides",int_opt_to_json x.f_TrdCapRptSideGrp_NoSides) :: (("AllocID",string_opt_to_json x.f_TrdCapRptSideGrp_AllocID) :: (("TradingSessionID",string_opt_to_json x.f_TrdCapRptSideGrp_TradingSessionID) :: (("EndAccruedInterestAmt",float_4_opt_to_json x.f_TrdCapRptSideGrp_EndAccruedInterestAmt) :: (("SettlCurrency",currency_opt_to_json x.f_TrdCapRptSideGrp_SettlCurrency) :: (("PositionEffect",positioneffect_opt_to_json x.f_TrdCapRptSideGrp_PositionEffect) :: (("Currency",currency_opt_to_json x.f_TrdCapRptSideGrp_Currency) :: (("ExchangeRule",string_opt_to_json x.f_TrdCapRptSideGrp_ExchangeRule) :: (("Stipulations",rg_for_json stipulations_to_json x.f_TrdCapRptSideGrp_Stipulations) :: (("ContAmtGrp",rg_for_json contamtgrp_to_json x.f_TrdCapRptSideGrp_ContAmtGrp) :: (("MiscFeesGrp",rg_for_json miscfeesgrp_to_json x.f_TrdCapRptSideGrp_MiscFeesGrp) :: (("ClrInstGrp",rg_for_json clrinstgrp_to_json x.f_TrdCapRptSideGrp_ClrInstGrp) :: (("TrdAllocGrp",rg_for_json trdallocgrp_to_json x.f_TrdCapRptSideGrp_TrdAllocGrp) :: (("Parties",rg_for_json parties_to_json x.f_TrdCapRptSideGrp_Parties) :: [])))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
;;

let legordgrp_to_string (d)  =
    ""
;;

let legordgrp_to_json (x)  : json =
    assoc_filter_nulls (("InstrumentLeg",instrumentleg_to_json x.f_LegOrdGrp_InstrumentLeg) :: (("LegQty",float_4_opt_to_json x.f_LegOrdGrp_LegQty) :: (("LegPositionEffect",char_opt_to_json x.f_LegOrdGrp_LegPositionEffect) :: (("LegSettlType",char_opt_to_json x.f_LegOrdGrp_LegSettlType) :: (("LegPrice",float_4_opt_to_json x.f_LegOrdGrp_LegPrice) :: (("LegRefID",string_opt_to_json x.f_LegOrdGrp_LegRefID) :: (("LegSettlDate",localmktdate_opt_to_json x.f_LegOrdGrp_LegSettlDate) :: (("LegSwapType",legswaptype_opt_to_json x.f_LegOrdGrp_LegSwapType) :: (("LegCoveredOrUncovered",int_opt_to_json x.f_LegOrdGrp_LegCoveredOrUncovered) :: (("NoLegs",int_opt_to_json x.f_LegOrdGrp_NoLegs) :: (("LegStipulations",rg_for_json legstipulations_to_json x.f_LegOrdGrp_LegStipulations) :: (("LegPreAllocGrp",rg_for_json legpreallocgrp_to_json x.f_LegOrdGrp_LegPreAllocGrp) :: (("NestedParties",rg_for_json nestedparties_to_json x.f_LegOrdGrp_NestedParties) :: [])))))))))))))
;;

let mdincgrp_to_string (d)  =
    ""
;;

let mdincgrp_to_json (x)  : json =
    assoc_filter_nulls (("Instrument",instrument_to_json x.f_MDIncGrp_Instrument) :: (("MDMkt",exchange_opt_to_json x.f_MDIncGrp_MDMkt) :: (("Text",string_opt_to_json x.f_MDIncGrp_Text) :: (("MDEntryTime",utctimeonly_opt_to_json x.f_MDIncGrp_MDEntryTime) :: (("TradeCondition",tradecondition_opt_to_json x.f_MDIncGrp_TradeCondition) :: (("NoMDEntries",int_opt_to_json x.f_MDIncGrp_NoMDEntries) :: (("TradingSessionSubID",string_opt_to_json x.f_MDIncGrp_TradingSessionSubID) :: (("NumberOfOrders",int_opt_to_json x.f_MDIncGrp_NumberOfOrders) :: (("MDEntrySeller",string_opt_to_json x.f_MDIncGrp_MDEntrySeller) :: (("Scope",scope_opt_to_json x.f_MDIncGrp_Scope) :: (("MDEntryID",string_opt_to_json x.f_MDIncGrp_MDEntryID) :: (("MDEntryPositionNo",int_opt_to_json x.f_MDIncGrp_MDEntryPositionNo) :: (("SellerDays",int_opt_to_json x.f_MDIncGrp_SellerDays) :: (("ExpireTime",utctimestamp_opt_to_json x.f_MDIncGrp_ExpireTime) :: (("CorporateAction",corporateaction_opt_to_json x.f_MDIncGrp_CorporateAction) :: (("DeleteReason",deletereason_opt_to_json x.f_MDIncGrp_DeleteReason) :: (("NetChgPrevDay",float_4_opt_to_json x.f_MDIncGrp_NetChgPrevDay) :: (("MDEntryPx",float_4_opt_to_json x.f_MDIncGrp_MDEntryPx) :: (("MinQty",float_4_opt_to_json x.f_MDIncGrp_MinQty) :: (("ExpireDate",localmktdate_opt_to_json x.f_MDIncGrp_ExpireDate) :: (("EncodedText",string_opt_to_json x.f_MDIncGrp_EncodedText) :: (("MDUpdateAction",mdupdateaction_opt_to_json x.f_MDIncGrp_MDUpdateAction) :: (("MDEntryDate",utcdateonly_opt_to_json x.f_MDIncGrp_MDEntryDate) :: (("TradingSessionID",string_opt_to_json x.f_MDIncGrp_TradingSessionID) :: (("FinancialStatus",financialstatus_opt_to_json x.f_MDIncGrp_FinancialStatus) :: (("OrderID",string_opt_to_json x.f_MDIncGrp_OrderID) :: (("MDEntryRefID",string_opt_to_json x.f_MDIncGrp_MDEntryRefID) :: (("OpenCloseSettlFlag",openclosesettlflag_opt_to_json x.f_MDIncGrp_OpenCloseSettlFlag) :: (("MDEntrySize",float_4_opt_to_json x.f_MDIncGrp_MDEntrySize) :: (("TickDirection",tickdirection_opt_to_json x.f_MDIncGrp_TickDirection) :: (("EncodedTextLen",int_opt_to_json x.f_MDIncGrp_EncodedTextLen) :: (("MDEntryBuyer",string_opt_to_json x.f_MDIncGrp_MDEntryBuyer) :: (("QuoteCondition",quotecondition_opt_to_json x.f_MDIncGrp_QuoteCondition) :: (("MDEntryOriginator",string_opt_to_json x.f_MDIncGrp_MDEntryOriginator) :: (("Currency",currency_opt_to_json x.f_MDIncGrp_Currency) :: (("TimeInForce",timeinforce_opt_to_json x.f_MDIncGrp_TimeInForce) :: (("PriceDelta",float_opt_to_json x.f_MDIncGrp_PriceDelta) :: (("LocationID",string_opt_to_json x.f_MDIncGrp_LocationID) :: (("QuoteEntryID",string_opt_to_json x.f_MDIncGrp_QuoteEntryID) :: (("ExecInst",execinst_opt_to_json x.f_MDIncGrp_ExecInst) :: (("DeskID",string_opt_to_json x.f_MDIncGrp_DeskID) :: (("MDEntryType",mdentrytype_opt_to_json x.f_MDIncGrp_MDEntryType) :: (("UndInstrmtGrp",rg_for_json undinstrmtgrp_to_json x.f_MDIncGrp_UndInstrmtGrp) :: (("InstrmtLegGrp",rg_for_json instrmtleggrp_to_json x.f_MDIncGrp_InstrmtLegGrp) :: []))))))))))))))))))))))))))))))))))))))))))))
;;

let instrmtmdreqgrp_to_string (d)  =
    ""
;;

let instrmtmdreqgrp_to_json (x)  : json =
    assoc_filter_nulls (("Instrument",instrument_to_json x.f_InstrmtMDReqGrp_Instrument) :: (("NoRelatedSym",int_opt_to_json x.f_InstrmtMDReqGrp_NoRelatedSym) :: (("UndInstrmtGrp",rg_for_json undinstrmtgrp_to_json x.f_InstrmtMDReqGrp_UndInstrmtGrp) :: (("InstrmtLegGrp",rg_for_json instrmtleggrp_to_json x.f_InstrmtMDReqGrp_InstrmtLegGrp) :: []))))
;;

let rfqreqgrp_to_string (d)  =
    ""
;;

let rfqreqgrp_to_json (x)  : json =
    assoc_filter_nulls (("Instrument",instrument_to_json x.f_RFQReqGrp_Instrument) :: (("TradingSessionSubID",string_opt_to_json x.f_RFQReqGrp_TradingSessionSubID) :: (("NoRelatedSym",int_opt_to_json x.f_RFQReqGrp_NoRelatedSym) :: (("QuoteType",quotetype_opt_to_json x.f_RFQReqGrp_QuoteType) :: (("PrevClosePx",float_4_opt_to_json x.f_RFQReqGrp_PrevClosePx) :: (("QuoteRequestType",quoterequesttype_opt_to_json x.f_RFQReqGrp_QuoteRequestType) :: (("TradingSessionID",string_opt_to_json x.f_RFQReqGrp_TradingSessionID) :: (("UndInstrmtGrp",rg_for_json undinstrmtgrp_to_json x.f_RFQReqGrp_UndInstrmtGrp) :: (("InstrmtLegGrp",rg_for_json instrmtleggrp_to_json x.f_RFQReqGrp_InstrmtLegGrp) :: [])))))))))
;;

let listordgrp_to_string (d)  =
    ""
;;

let listordgrp_to_json (x)  : json =
    assoc_filter_nulls (("CommissionData",commissiondata_to_json x.f_ListOrdGrp_CommissionData) :: (("OrderQtyData",orderqtydata_to_json x.f_ListOrdGrp_OrderQtyData) :: (("SpreadOrBenchmarkCurveData",spreadorbenchmarkcurvedata_to_json x.f_ListOrdGrp_SpreadOrBenchmarkCurveData) :: (("YieldData",yielddata_to_json x.f_ListOrdGrp_YieldData) :: (("Instrument",instrument_to_json x.f_ListOrdGrp_Instrument) :: (("PegInstructions",peginstructions_to_json x.f_ListOrdGrp_PegInstructions) :: (("DiscretionInstructions",discretioninstructions_to_json x.f_ListOrdGrp_DiscretionInstructions) :: (("SolicitedFlag",solicitedflag_opt_to_json x.f_ListOrdGrp_SolicitedFlag) :: (("OrderCapacity",ordercapacity_opt_to_json x.f_ListOrdGrp_OrderCapacity) :: (("SideValueInd",sidevalueind_opt_to_json x.f_ListOrdGrp_SideValueInd) :: (("OrdType",ordtype_opt_to_json x.f_ListOrdGrp_OrdType) :: (("MaxShow",float_4_opt_to_json x.f_ListOrdGrp_MaxShow) :: (("SecondaryClOrdID",string_opt_to_json x.f_ListOrdGrp_SecondaryClOrdID) :: (("AccountType",accounttype_opt_to_json x.f_ListOrdGrp_AccountType) :: (("MaxFloor",float_4_opt_to_json x.f_ListOrdGrp_MaxFloor) :: (("ProcessCode",processcode_opt_to_json x.f_ListOrdGrp_ProcessCode) :: (("TargetStrategy",targetstrategy_opt_to_json x.f_ListOrdGrp_TargetStrategy) :: (("QtyType",qtytype_opt_to_json x.f_ListOrdGrp_QtyType) :: (("ClearingFeeIndicator",clearingfeeindicator_opt_to_json x.f_ListOrdGrp_ClearingFeeIndicator) :: (("GTBookingInst",gtbookinginst_opt_to_json x.f_ListOrdGrp_GTBookingInst) :: (("ExDestination",exchange_opt_to_json x.f_ListOrdGrp_ExDestination) :: (("PriceType",pricetype_opt_to_json x.f_ListOrdGrp_PriceType) :: (("Account",string_opt_to_json x.f_ListOrdGrp_Account) :: (("AcctIDSource",acctidsource_opt_to_json x.f_ListOrdGrp_AcctIDSource) :: (("EffectiveTime",utctimestamp_opt_to_json x.f_ListOrdGrp_EffectiveTime) :: (("MinQty",float_4_opt_to_json x.f_ListOrdGrp_MinQty) :: (("PreallocMethod",preallocmethod_opt_to_json x.f_ListOrdGrp_PreallocMethod) :: (("ExpireDate",localmktdate_opt_to_json x.f_ListOrdGrp_ExpireDate) :: (("TradeOriginationDate",localmktdate_opt_to_json x.f_ListOrdGrp_TradeOriginationDate) :: (("SettlDate2",localmktdate_opt_to_json x.f_ListOrdGrp_SettlDate2) :: (("TransactTime",utctimestamp_opt_to_json x.f_ListOrdGrp_TransactTime) :: (("OrderQty2",float_4_opt_to_json x.f_ListOrdGrp_OrderQty2) :: (("Side",side_opt_to_json x.f_ListOrdGrp_Side) :: (("EncodedTextLen",int_opt_to_json x.f_ListOrdGrp_EncodedTextLen) :: (("ParticipationRate",float_4_opt_to_json x.f_ListOrdGrp_ParticipationRate) :: (("Price2",float_4_opt_to_json x.f_ListOrdGrp_Price2) :: (("ForexReq",forexreq_opt_to_json x.f_ListOrdGrp_ForexReq) :: (("TimeInForce",timeinforce_opt_to_json x.f_ListOrdGrp_TimeInForce) :: (("ComplianceID",string_opt_to_json x.f_ListOrdGrp_ComplianceID) :: (("ClOrdLinkID",string_opt_to_json x.f_ListOrdGrp_ClOrdLinkID) :: (("PrevClosePx",float_4_opt_to_json x.f_ListOrdGrp_PrevClosePx) :: (("ExecInst",execinst_opt_to_json x.f_ListOrdGrp_ExecInst) :: (("BookingType",bookingtype_opt_to_json x.f_ListOrdGrp_BookingType) :: (("Designation",string_opt_to_json x.f_ListOrdGrp_Designation) :: (("SettlInstMode",settlinstmode_opt_to_json x.f_ListOrdGrp_SettlInstMode) :: (("QuoteID",string_opt_to_json x.f_ListOrdGrp_QuoteID) :: (("LocateReqd",locatereqd_opt_to_json x.f_ListOrdGrp_LocateReqd) :: (("CustOrderCapacity",custordercapacity_opt_to_json x.f_ListOrdGrp_CustOrderCapacity) :: (("CashMargin",cashmargin_opt_to_json x.f_ListOrdGrp_CashMargin) :: (("ClOrdID",string_opt_to_json x.f_ListOrdGrp_ClOrdID) :: (("Text",string_opt_to_json x.f_ListOrdGrp_Text) :: (("ListSeqNo",int_opt_to_json x.f_ListOrdGrp_ListSeqNo) :: (("DayBookingInst",daybookinginst_opt_to_json x.f_ListOrdGrp_DayBookingInst) :: (("StopPx",float_4_opt_to_json x.f_ListOrdGrp_StopPx) :: (("TargetStrategyParameters",string_opt_to_json x.f_ListOrdGrp_TargetStrategyParameters) :: (("Price",float_4_opt_to_json x.f_ListOrdGrp_Price) :: (("SettlType",settltype_opt_to_json x.f_ListOrdGrp_SettlType) :: (("ExpireTime",utctimestamp_opt_to_json x.f_ListOrdGrp_ExpireTime) :: (("OrderRestrictions",orderrestrictions_opt_to_json x.f_ListOrdGrp_OrderRestrictions) :: (("CoveredOrUncovered",coveredoruncovered_opt_to_json x.f_ListOrdGrp_CoveredOrUncovered) :: (("EncodedText",string_opt_to_json x.f_ListOrdGrp_EncodedText) :: (("AllocID",string_opt_to_json x.f_ListOrdGrp_AllocID) :: (("BookingUnit",bookingunit_opt_to_json x.f_ListOrdGrp_BookingUnit) :: (("IOIID",string_opt_to_json x.f_ListOrdGrp_IOIID) :: (("SettlCurrency",currency_opt_to_json x.f_ListOrdGrp_SettlCurrency) :: (("PositionEffect",positioneffect_opt_to_json x.f_ListOrdGrp_PositionEffect) :: (("NoOrders",int_opt_to_json x.f_ListOrdGrp_NoOrders) :: (("Currency",currency_opt_to_json x.f_ListOrdGrp_Currency) :: (("SettlDate",localmktdate_opt_to_json x.f_ListOrdGrp_SettlDate) :: (("TradeDate",localmktdate_opt_to_json x.f_ListOrdGrp_TradeDate) :: (("HandlInst",handlinst_opt_to_json x.f_ListOrdGrp_HandlInst) :: (("Stipulations",rg_for_json stipulations_to_json x.f_ListOrdGrp_Stipulations) :: (("UndInstrmtGrp",rg_for_json undinstrmtgrp_to_json x.f_ListOrdGrp_UndInstrmtGrp) :: (("PreAllocGrp",rg_for_json preallocgrp_to_json x.f_ListOrdGrp_PreAllocGrp) :: (("TrdgSesGrp",rg_for_json trdgsesgrp_to_json x.f_ListOrdGrp_TrdgSesGrp) :: (("Parties",rg_for_json parties_to_json x.f_ListOrdGrp_Parties) :: []))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
;;

let seclistgrp_to_string (d)  =
    ""
;;

let seclistgrp_to_json (x)  : json =
    assoc_filter_nulls (("FinancingDetails",financingdetails_to_json x.f_SecListGrp_FinancingDetails) :: (("InstrumentExtension",instrumentextension_to_json x.f_SecListGrp_InstrumentExtension) :: (("SpreadOrBenchmarkCurveData",spreadorbenchmarkcurvedata_to_json x.f_SecListGrp_SpreadOrBenchmarkCurveData) :: (("Instrument",instrument_to_json x.f_SecListGrp_Instrument) :: (("YieldData",yielddata_to_json x.f_SecListGrp_YieldData) :: (("NoRelatedSym",int_opt_to_json x.f_SecListGrp_NoRelatedSym) :: (("EncodedText",string_opt_to_json x.f_SecListGrp_EncodedText) :: (("TradingSessionID",string_opt_to_json x.f_SecListGrp_TradingSessionID) :: (("Text",string_opt_to_json x.f_SecListGrp_Text) :: (("MinTradeVol",float_4_opt_to_json x.f_SecListGrp_MinTradeVol) :: (("TradingSessionSubID",string_opt_to_json x.f_SecListGrp_TradingSessionSubID) :: (("ExpirationCycle",expirationcycle_opt_to_json x.f_SecListGrp_ExpirationCycle) :: (("EncodedTextLen",int_opt_to_json x.f_SecListGrp_EncodedTextLen) :: (("RoundLot",float_4_opt_to_json x.f_SecListGrp_RoundLot) :: (("Currency",currency_opt_to_json x.f_SecListGrp_Currency) :: (("UndInstrmtGrp",rg_for_json undinstrmtgrp_to_json x.f_SecListGrp_UndInstrmtGrp) :: (("InstrmtLegSecListGrp",rg_for_json instrmtlegseclistgrp_to_json x.f_SecListGrp_InstrmtLegSecListGrp) :: (("Stipulations",rg_for_json stipulations_to_json x.f_SecListGrp_Stipulations) :: []))))))))))))))))))
;;

let quotreqrjctgrp_to_string (d)  =
    ""
;;

let quotreqrjctgrp_to_json (x)  : json =
    assoc_filter_nulls (("Instrument",instrument_to_json x.f_QuotReqRjctGrp_Instrument) :: (("FinancingDetails",financingdetails_to_json x.f_QuotReqRjctGrp_FinancingDetails) :: (("OrderQtyData",orderqtydata_to_json x.f_QuotReqRjctGrp_OrderQtyData) :: (("SpreadOrBenchmarkCurveData",spreadorbenchmarkcurvedata_to_json x.f_QuotReqRjctGrp_SpreadOrBenchmarkCurveData) :: (("YieldData",yielddata_to_json x.f_QuotReqRjctGrp_YieldData) :: (("NoRelatedSym",int_opt_to_json x.f_QuotReqRjctGrp_NoRelatedSym) :: (("OrdType",ordtype_opt_to_json x.f_QuotReqRjctGrp_OrdType) :: (("QuoteRequestType",quoterequesttype_opt_to_json x.f_QuotReqRjctGrp_QuoteRequestType) :: (("AccountType",accounttype_opt_to_json x.f_QuotReqRjctGrp_AccountType) :: (("TradingSessionSubID",string_opt_to_json x.f_QuotReqRjctGrp_TradingSessionSubID) :: (("QtyType",qtytype_opt_to_json x.f_QuotReqRjctGrp_QtyType) :: (("Price",float_4_opt_to_json x.f_QuotReqRjctGrp_Price) :: (("SettlType",settltype_opt_to_json x.f_QuotReqRjctGrp_SettlType) :: (("QuoteType",quotetype_opt_to_json x.f_QuotReqRjctGrp_QuoteType) :: (("ExpireTime",utctimestamp_opt_to_json x.f_QuotReqRjctGrp_ExpireTime) :: (("PriceType",pricetype_opt_to_json x.f_QuotReqRjctGrp_PriceType) :: (("Account",string_opt_to_json x.f_QuotReqRjctGrp_Account) :: (("AcctIDSource",acctidsource_opt_to_json x.f_QuotReqRjctGrp_AcctIDSource) :: (("QuotePriceType",quotepricetype_opt_to_json x.f_QuotReqRjctGrp_QuotePriceType) :: (("TradeOriginationDate",localmktdate_opt_to_json x.f_QuotReqRjctGrp_TradeOriginationDate) :: (("TradingSessionID",string_opt_to_json x.f_QuotReqRjctGrp_TradingSessionID) :: (("SettlDate2",localmktdate_opt_to_json x.f_QuotReqRjctGrp_SettlDate2) :: (("TransactTime",utctimestamp_opt_to_json x.f_QuotReqRjctGrp_TransactTime) :: (("OrderQty2",float_4_opt_to_json x.f_QuotReqRjctGrp_OrderQty2) :: (("Side",side_opt_to_json x.f_QuotReqRjctGrp_Side) :: (("Price2",float_4_opt_to_json x.f_QuotReqRjctGrp_Price2) :: (("Currency",currency_opt_to_json x.f_QuotReqRjctGrp_Currency) :: (("PrevClosePx",float_4_opt_to_json x.f_QuotReqRjctGrp_PrevClosePx) :: (("SettlDate",localmktdate_opt_to_json x.f_QuotReqRjctGrp_SettlDate) :: (("Stipulations",rg_for_json stipulations_to_json x.f_QuotReqRjctGrp_Stipulations) :: (("QuotReqLegsGrp",rg_for_json quotreqlegsgrp_to_json x.f_QuotReqRjctGrp_QuotReqLegsGrp) :: (("UndInstrmtGrp",rg_for_json undinstrmtgrp_to_json x.f_QuotReqRjctGrp_UndInstrmtGrp) :: (("QuotQualGrp",rg_for_json quotqualgrp_to_json x.f_QuotReqRjctGrp_QuotQualGrp) :: (("Parties",rg_for_json parties_to_json x.f_QuotReqRjctGrp_Parties) :: []))))))))))))))))))))))))))))))))))
;;

let quotreqgrp_to_string (d)  =
    ""
;;

let quotreqgrp_to_json (x)  : json =
    assoc_filter_nulls (("Instrument",instrument_to_json x.f_QuotReqGrp_Instrument) :: (("FinancingDetails",financingdetails_to_json x.f_QuotReqGrp_FinancingDetails) :: (("OrderQtyData",orderqtydata_to_json x.f_QuotReqGrp_OrderQtyData) :: (("SpreadOrBenchmarkCurveData",spreadorbenchmarkcurvedata_to_json x.f_QuotReqGrp_SpreadOrBenchmarkCurveData) :: (("YieldData",yielddata_to_json x.f_QuotReqGrp_YieldData) :: (("NoRelatedSym",int_opt_to_json x.f_QuotReqGrp_NoRelatedSym) :: (("OrdType",ordtype_opt_to_json x.f_QuotReqGrp_OrdType) :: (("ValidUntilTime",utctimestamp_opt_to_json x.f_QuotReqGrp_ValidUntilTime) :: (("QuoteRequestType",quoterequesttype_opt_to_json x.f_QuotReqGrp_QuoteRequestType) :: (("AccountType",accounttype_opt_to_json x.f_QuotReqGrp_AccountType) :: (("TradingSessionSubID",string_opt_to_json x.f_QuotReqGrp_TradingSessionSubID) :: (("QtyType",qtytype_opt_to_json x.f_QuotReqGrp_QtyType) :: (("Price",float_4_opt_to_json x.f_QuotReqGrp_Price) :: (("SettlType",settltype_opt_to_json x.f_QuotReqGrp_SettlType) :: (("QuoteType",quotetype_opt_to_json x.f_QuotReqGrp_QuoteType) :: (("ExpireTime",utctimestamp_opt_to_json x.f_QuotReqGrp_ExpireTime) :: (("PriceType",pricetype_opt_to_json x.f_QuotReqGrp_PriceType) :: (("Account",string_opt_to_json x.f_QuotReqGrp_Account) :: (("AcctIDSource",acctidsource_opt_to_json x.f_QuotReqGrp_AcctIDSource) :: (("QuotePriceType",quotepricetype_opt_to_json x.f_QuotReqGrp_QuotePriceType) :: (("TradeOriginationDate",localmktdate_opt_to_json x.f_QuotReqGrp_TradeOriginationDate) :: (("TradingSessionID",string_opt_to_json x.f_QuotReqGrp_TradingSessionID) :: (("SettlDate2",localmktdate_opt_to_json x.f_QuotReqGrp_SettlDate2) :: (("TransactTime",utctimestamp_opt_to_json x.f_QuotReqGrp_TransactTime) :: (("OrderQty2",float_4_opt_to_json x.f_QuotReqGrp_OrderQty2) :: (("Side",side_opt_to_json x.f_QuotReqGrp_Side) :: (("Price2",float_4_opt_to_json x.f_QuotReqGrp_Price2) :: (("Currency",currency_opt_to_json x.f_QuotReqGrp_Currency) :: (("PrevClosePx",float_4_opt_to_json x.f_QuotReqGrp_PrevClosePx) :: (("SettlDate",localmktdate_opt_to_json x.f_QuotReqGrp_SettlDate) :: (("Stipulations",rg_for_json stipulations_to_json x.f_QuotReqGrp_Stipulations) :: (("QuotReqLegsGrp",rg_for_json quotreqlegsgrp_to_json x.f_QuotReqGrp_QuotReqLegsGrp) :: (("UndInstrmtGrp",rg_for_json undinstrmtgrp_to_json x.f_QuotReqGrp_UndInstrmtGrp) :: (("QuotQualGrp",rg_for_json quotqualgrp_to_json x.f_QuotReqGrp_QuotQualGrp) :: (("Parties",rg_for_json parties_to_json x.f_QuotReqGrp_Parties) :: [])))))))))))))))))))))))))))))))))))
;;

let quotcxlentriesgrp_to_string (d)  =
    ""
;;

let quotcxlentriesgrp_to_json (x)  : json =
    assoc_filter_nulls (("FinancingDetails",financingdetails_to_json x.f_QuotCxlEntriesGrp_FinancingDetails) :: (("Instrument",instrument_to_json x.f_QuotCxlEntriesGrp_Instrument) :: (("NoQuoteEntries",int_opt_to_json x.f_QuotCxlEntriesGrp_NoQuoteEntries) :: (("UndInstrmtGrp",rg_for_json undinstrmtgrp_to_json x.f_QuotCxlEntriesGrp_UndInstrmtGrp) :: (("InstrmtLegGrp",rg_for_json instrmtleggrp_to_json x.f_QuotCxlEntriesGrp_InstrmtLegGrp) :: [])))))
;;

let settlinstructionsdata_to_string (d)  =
    ""
;;

let settlinstructionsdata_to_json (x)  : json =
    assoc_filter_nulls (("SettlDeliveryType",settldeliverytype_opt_to_json x.f_SettlInstructionsData_SettlDeliveryType) :: (("StandInstDbID",string_opt_to_json x.f_SettlInstructionsData_StandInstDbID) :: (("StandInstDbName",string_opt_to_json x.f_SettlInstructionsData_StandInstDbName) :: (("StandInstDbType",standinstdbtype_opt_to_json x.f_SettlInstructionsData_StandInstDbType) :: (("DlvyInstGrp",rg_for_json dlvyinstgrp_to_json x.f_SettlInstructionsData_DlvyInstGrp) :: [])))))
;;

let allocgrp_to_string (d)  =
    ""
;;

let allocgrp_to_json (x)  : json =
    assoc_filter_nulls (("SettlInstructionsData",settlinstructionsdata_to_json x.f_AllocGrp_SettlInstructionsData) :: (("CommissionData",commissiondata_to_json x.f_AllocGrp_CommissionData) :: (("AllocAccruedInterestAmt",float_4_opt_to_json x.f_AllocGrp_AllocAccruedInterestAmt) :: (("NoAllocs",int_opt_to_json x.f_AllocGrp_NoAllocs) :: (("AllocSettlCurrAmt",float_4_opt_to_json x.f_AllocGrp_AllocSettlCurrAmt) :: (("SettlCurrAmt",float_4_opt_to_json x.f_AllocGrp_SettlCurrAmt) :: (("AllocText",string_opt_to_json x.f_AllocGrp_AllocText) :: (("AllocSettlInstType",allocsettlinsttype_opt_to_json x.f_AllocGrp_AllocSettlInstType) :: (("ProcessCode",processcode_opt_to_json x.f_AllocGrp_ProcessCode) :: (("EncodedAllocText",string_opt_to_json x.f_AllocGrp_EncodedAllocText) :: (("AllocAvgPx",float_4_opt_to_json x.f_AllocGrp_AllocAvgPx) :: (("EncodedAllocTextLen",int_opt_to_json x.f_AllocGrp_EncodedAllocTextLen) :: (("AllocHandlInst",allochandlinst_opt_to_json x.f_AllocGrp_AllocHandlInst) :: (("SettlCurrFxRate",float_opt_to_json x.f_AllocGrp_SettlCurrFxRate) :: (("AllocNetMoney",float_4_opt_to_json x.f_AllocGrp_AllocNetMoney) :: (("AllocQty",float_4_opt_to_json x.f_AllocGrp_AllocQty) :: (("AllocAcctIDSource",int_opt_to_json x.f_AllocGrp_AllocAcctIDSource) :: (("SettlCurrFxRateCalc",settlcurrfxratecalc_opt_to_json x.f_AllocGrp_SettlCurrFxRateCalc) :: (("AllocAccount",string_opt_to_json x.f_AllocGrp_AllocAccount) :: (("AllocPrice",float_4_opt_to_json x.f_AllocGrp_AllocPrice) :: (("IndividualAllocID",string_opt_to_json x.f_AllocGrp_IndividualAllocID) :: (("AllocSettlCurrency",currency_opt_to_json x.f_AllocGrp_AllocSettlCurrency) :: (("SettlCurrency",currency_opt_to_json x.f_AllocGrp_SettlCurrency) :: (("NotifyBrokerOfCredit",notifybrokerofcredit_opt_to_json x.f_AllocGrp_NotifyBrokerOfCredit) :: (("AllocInterestAtMaturity",float_4_opt_to_json x.f_AllocGrp_AllocInterestAtMaturity) :: (("MatchStatus",matchstatus_opt_to_json x.f_AllocGrp_MatchStatus) :: (("ClrInstGrp",rg_for_json clrinstgrp_to_json x.f_AllocGrp_ClrInstGrp) :: (("MiscFeesGrp",rg_for_json miscfeesgrp_to_json x.f_AllocGrp_MiscFeesGrp) :: (("NestedParties",rg_for_json nestedparties_to_json x.f_AllocGrp_NestedParties) :: [])))))))))))))))))))))))))))))
;;

let settlinstgrp_to_string (d)  =
    ""
;;

let settlinstgrp_to_json (x)  : json =
    assoc_filter_nulls (("SettlInstructionsData",settlinstructionsdata_to_json x.f_SettlInstGrp_SettlInstructionsData) :: (("SettlInstRefID",string_opt_to_json x.f_SettlInstGrp_SettlInstRefID) :: (("SecurityType",securitytype_opt_to_json x.f_SettlInstGrp_SecurityType) :: (("CardNumber",string_opt_to_json x.f_SettlInstGrp_CardNumber) :: (("CardExpDate",localmktdate_opt_to_json x.f_SettlInstGrp_CardExpDate) :: (("EffectiveTime",utctimestamp_opt_to_json x.f_SettlInstGrp_EffectiveTime) :: (("PaymentDate",localmktdate_opt_to_json x.f_SettlInstGrp_PaymentDate) :: (("PaymentRemitterID",string_opt_to_json x.f_SettlInstGrp_PaymentRemitterID) :: (("SettlInstTransType",settlinsttranstype_opt_to_json x.f_SettlInstGrp_SettlInstTransType) :: (("Product",product_opt_to_json x.f_SettlInstGrp_Product) :: (("CFICode",string_opt_to_json x.f_SettlInstGrp_CFICode) :: (("CardHolderName",string_opt_to_json x.f_SettlInstGrp_CardHolderName) :: (("Side",side_opt_to_json x.f_SettlInstGrp_Side) :: (("LastUpdateTime",utctimestamp_opt_to_json x.f_SettlInstGrp_LastUpdateTime) :: (("NoSettlInst",int_opt_to_json x.f_SettlInstGrp_NoSettlInst) :: (("PaymentMethod",paymentmethod_opt_to_json x.f_SettlInstGrp_PaymentMethod) :: (("PaymentRef",string_opt_to_json x.f_SettlInstGrp_PaymentRef) :: (("SettlInstID",string_opt_to_json x.f_SettlInstGrp_SettlInstID) :: (("ExpireTime",utctimestamp_opt_to_json x.f_SettlInstGrp_ExpireTime) :: (("CardIssNum",string_opt_to_json x.f_SettlInstGrp_CardIssNum) :: (("CardStartDate",localmktdate_opt_to_json x.f_SettlInstGrp_CardStartDate) :: (("Parties",rg_for_json parties_to_json x.f_SettlInstGrp_Parties) :: []))))))))))))))))))))))
;;

let quotsetgrp_to_string (d)  =
    ""
;;

let quotsetgrp_to_json (x)  : json =
    assoc_filter_nulls (("UnderlyingInstrument",underlyinginstrument_to_json x.f_QuotSetGrp_UnderlyingInstrument) :: (("QuoteSetID",string_opt_to_json x.f_QuotSetGrp_QuoteSetID) :: (("LastFragment",lastfragment_opt_to_json x.f_QuotSetGrp_LastFragment) :: (("NoQuoteSets",int_opt_to_json x.f_QuotSetGrp_NoQuoteSets) :: (("QuoteSetValidUntilTime",utctimestamp_opt_to_json x.f_QuotSetGrp_QuoteSetValidUntilTime) :: (("TotNoQuoteEntries",int_opt_to_json x.f_QuotSetGrp_TotNoQuoteEntries) :: (("QuotEntryGrp",rg_for_json quotentrygrp_to_json x.f_QuotSetGrp_QuotEntryGrp) :: [])))))))
;;

let quotsetackgrp_to_string (d)  =
    ""
;;

let quotsetackgrp_to_json (x)  : json =
    assoc_filter_nulls (("UnderlyingInstrument",underlyinginstrument_to_json x.f_QuotSetAckGrp_UnderlyingInstrument) :: (("QuoteSetID",string_opt_to_json x.f_QuotSetAckGrp_QuoteSetID) :: (("LastFragment",lastfragment_opt_to_json x.f_QuotSetAckGrp_LastFragment) :: (("NoQuoteSets",int_opt_to_json x.f_QuotSetAckGrp_NoQuoteSets) :: (("TotNoQuoteEntries",int_opt_to_json x.f_QuotSetAckGrp_TotNoQuoteEntries) :: (("QuotEntryAckGrp",rg_for_json quotentryackgrp_to_json x.f_QuotSetAckGrp_QuotEntryAckGrp) :: []))))))
;;
