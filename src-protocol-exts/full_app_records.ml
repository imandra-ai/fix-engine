(* Aesthetic Integration copyright 2018 *)
open Datetime;;
open Full_app_enums;;
open Numeric;;

type fix_rg_inner_securitydefinitionrelatedsym = {
    f_SecurityDefinitionRelatedSym_UnderlyingIDSource : string option;
    (** Quantity of particular leg in the Security*)
    f_SecurityDefinitionRelatedSym_RatioQty : fix_float_4 option;
    (** For Options.*)
    f_SecurityDefinitionRelatedSym_UnderlyingOptAttribute : string option;
    (** Can be used in conjunction with UnderlyingMaturityMonthYear to specify a particular maturity date.*)
    f_SecurityDefinitionRelatedSym_UnderlyingMaturityDay : int option;
    (** Encoded (non-ASCII characters) representation of the UnderlyingIssuer field in the encoded format specified via the MessageEncoding field.*)
    f_SecurityDefinitionRelatedSym_EncodedUnderlyingIssuer : string option;
    (** Specifiesthe month and year of maturity. Required if UnderlyingMaturityDay is specified.*)
    f_SecurityDefinitionRelatedSym_UnderlyingMaturityMonthYear : fix_monthyear option;
    (** Number of legs that make up the Security*)
    f_SecurityDefinitionRelatedSym_NoRelatedSym : int option;
    (** For Fixed Income.*)
    f_SecurityDefinitionRelatedSym_UnderlyingCouponRate : fix_float option;
    f_SecurityDefinitionRelatedSym_UnderlyingCurrency : fix_currency option;
    (** Must be specified if a Future or Option. If a Future: UnderlyingSymbol, UnderlyingSecurityType, and UnderlyingMaturityMonthYear are required. If an Option: UnderlyingSymbol, UnderlyingSecurityType, UnderlyingMaturityMonthYear, PutOrCall, and UnderlyingStrikePrice are required.*)
    f_SecurityDefinitionRelatedSym_UnderlyingSecurityType : string option;
    (** For Options.*)
    f_SecurityDefinitionRelatedSym_UnderlyingPutOrCall : int option;
    (** Can be used to identify the security.*)
    f_SecurityDefinitionRelatedSym_UnderlyingSecurityExchange : fix_exchange option;
    f_SecurityDefinitionRelatedSym_UnderlyingSecurityID : string option;
    (** Indicates if this leg of the security is to be Bought or Sold as part of this complex security.*)
    f_SecurityDefinitionRelatedSym_Side : fix_side option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc.*)
    f_SecurityDefinitionRelatedSym_UnderlyingContractMultiplier : fix_float option;
    (** Must be set if EncodedUnderlyingSecurityDesc field is specified and must immediately precede it.*)
    f_SecurityDefinitionRelatedSym_EncodedUnderlyingSecurityDescLen : int option;
    f_SecurityDefinitionRelatedSym_UnderlyingSymbolSfx : string option;
    (** Must be set if EncodedUnderlyingIssuer field is specified and must immediately precede it.*)
    f_SecurityDefinitionRelatedSym_EncodedUnderlyingIssuerLen : int option;
    f_SecurityDefinitionRelatedSym_UnderlyingSecurityDesc : string option;
    (** Encoded (non-ASCII characters) representation of the UnderlyingSecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_SecurityDefinitionRelatedSym_EncodedUnderlyingSecurityDesc : string option;
    f_SecurityDefinitionRelatedSym_UnderlyingIssuer : string option;
    (** For Options.*)
    f_SecurityDefinitionRelatedSym_UnderlyingStrikePrice : fix_float_4 option;
    (** Must be specified as the first field in the repeating group. Required if NoRelatedSym > 0.*)
    f_SecurityDefinitionRelatedSym_UnderlyingSymbol : string option
}
;;

type fix_rg_securitydefinitionrelatedsym = fix_rg_inner_securitydefinitionrelatedsym list
;;

type fix_rg_inner_ioiioiqualifiers = {
    (** Required if any IOIQualifiers are specified. Indicates the number of repeating IOIQualifiers.*)
    f_IOIIOIQualifiers_NoIOIQualifiers : int option;
    (** Required if NoIOIQualifiers > 0*)
    f_IOIIOIQualifiers_IOIQualifier : fix_ioiqualifier option
}
;;

type fix_rg_ioiioiqualifiers = fix_rg_inner_ioiioiqualifiers list
;;

type fix_discretioninstructions = {
    (** The scope of "related to" price of the discretion (e.g. local, global etc)*)
    f_DiscretionInstructions_DiscretionScope : fix_discretionscope option;
    (** Amount (signed) added to the "related to" price specified via DiscretionInst, in the context of DiscretionOffsetType*)
    f_DiscretionInstructions_DiscretionOffsetValue : fix_float option;
    (** Type of Discretion Offset (e.g. price offset, tick offset etc)*)
    f_DiscretionInstructions_DiscretionOffsetType : fix_discretionoffsettype option;
    (** Describes whether discretion price is static/fixed or floats*)
    f_DiscretionInstructions_DiscretionMoveType : fix_discretionmovetype option;
    (** If the calculated discretion price is not a valid tick price, specifies how to round the price (e.g. to be more or less aggressive)*)
    f_DiscretionInstructions_DiscretionRoundDirection : fix_discretionrounddirection option;
    (** What the discretionary price is related to (e.g. primary price, display price etc)*)
    f_DiscretionInstructions_DiscretionInst : fix_discretioninst option;
    (** Specifies the nature of the resulting discretion price (e.g. or better limit, strict limit etc)*)
    f_DiscretionInstructions_DiscretionLimitType : fix_discretionlimittype option
}
;;

type fix_rg_inner_compidstatgrp = {
    f_CompIDStatGrp_StatusText : string option;
    f_CompIDStatGrp_LocationID : string option;
    f_CompIDStatGrp_RefSubID : string option;
    f_CompIDStatGrp_NoCompIDs : int option;
    f_CompIDStatGrp_RefCompID : string option;
    f_CompIDStatGrp_DeskID : string option;
    f_CompIDStatGrp_StatusValue : fix_statusvalue option
}
;;

type fix_rg_compidstatgrp = fix_rg_inner_compidstatgrp list
;;

type fix_rg_inner_allocackgrp = {
    f_AllocAckGrp_AllocPrice : fix_float_4 option;
    f_AllocAckGrp_IndividualAllocID : string option;
    f_AllocAckGrp_NoAllocs : int option;
    f_AllocAckGrp_EncodedAllocText : string option;
    f_AllocAckGrp_AllocAcctIDSource : int option;
    f_AllocAckGrp_IndividualAllocRejCode : int option;
    f_AllocAckGrp_AllocText : string option;
    f_AllocAckGrp_EncodedAllocTextLen : int option;
    f_AllocAckGrp_AllocAccount : string option
}
;;

type fix_rg_allocackgrp = fix_rg_inner_allocackgrp list
;;

type fix_rg_inner_quoteacknowledgementquotesets = {
    f_QuoteAcknowledgementQuoteSets_UnderlyingIDSource : string option;
    f_QuoteAcknowledgementQuoteSets_UnderlyingOptAttribute : string option;
    (** Total number of quotes for the quote set across all messages. Should be the sum of all NoQuoteEntries in each message that has repeating quotes that are part of the same quote set.
     Required if NoQuoteEntries > 0*)
    f_QuoteAcknowledgementQuoteSets_TotQuoteEntries : int option;
    f_QuoteAcknowledgementQuoteSets_UnderlyingMaturityDay : int option;
    (** Encoded (non-ASCII characters) representation of the UnderlyingIssuer field in the encoded format specified via the MessageEncoding field.*)
    f_QuoteAcknowledgementQuoteSets_EncodedUnderlyingIssuer : string option;
    (** Required if UnderlyingMaturityDay is specified.*)
    f_QuoteAcknowledgementQuoteSets_UnderlyingMaturityMonthYear : fix_monthyear option;
    (** For Fixed Income.*)
    f_QuoteAcknowledgementQuoteSets_UnderlyingCouponRate : fix_float option;
    f_QuoteAcknowledgementQuoteSets_UnderlyingSecurityType : string option;
    f_QuoteAcknowledgementQuoteSets_UnderlyingPutOrCall : int option;
    f_QuoteAcknowledgementQuoteSets_UnderlyingSecurityExchange : fix_exchange option;
    f_QuoteAcknowledgementQuoteSets_UnderlyingSecurityID : string option;
    (** First field in repeating group. Required if NoQuoteSets > 0*)
    f_QuoteAcknowledgementQuoteSets_QuoteSetID : string option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc.*)
    f_QuoteAcknowledgementQuoteSets_UnderlyingContractMultiplier : fix_float option;
    (** Must be set if EncodedUnderlyingSecurityDesc field is specified and must immediately precede it.*)
    f_QuoteAcknowledgementQuoteSets_EncodedUnderlyingSecurityDescLen : int option;
    f_QuoteAcknowledgementQuoteSets_UnderlyingSymbolSfx : string option;
    (** The number of sets of quotes in the message*)
    f_QuoteAcknowledgementQuoteSets_NoQuoteSets : int option;
    (** Must be set if EncodedUnderlyingIssuer field is specified and must immediately precede it.*)
    f_QuoteAcknowledgementQuoteSets_EncodedUnderlyingIssuerLen : int option;
    f_QuoteAcknowledgementQuoteSets_UnderlyingSecurityDesc : string option;
    (** Encoded (non-ASCII characters) representation of the UnderlyingSecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_QuoteAcknowledgementQuoteSets_EncodedUnderlyingSecurityDesc : string option;
    f_QuoteAcknowledgementQuoteSets_UnderlyingIssuer : string option;
    f_QuoteAcknowledgementQuoteSets_UnderlyingStrikePrice : fix_float_4 option;
    (** Required if NoQuoteSets > 0*)
    f_QuoteAcknowledgementQuoteSets_UnderlyingSymbol : string option
}
;;

type fix_rg_quoteacknowledgementquotesets = fix_rg_inner_quoteacknowledgementquotesets list
;;

type fix_rg_inner_ordersingleallocs = {
    (** Number of repeating groups for pre-trade allocation*)
    f_OrderSingleAllocs_NoAllocs : int option;
    f_OrderSingleAllocs_AllocShares : fix_float_4 option;
    (** Required if NoAllocs > 0. Must be first field in repeating group.*)
    f_OrderSingleAllocs_AllocAccount : string option
}
;;

type fix_rg_ordersingleallocs = fix_rg_inner_ordersingleallocs list
;;

type fix_rg_inner_trdcapdtgrp = {
    f_TrdCapDtGrp_TradeDate : fix_localmktdate option;
    f_TrdCapDtGrp_TransactTime : fix_utctimestamp option;
    f_TrdCapDtGrp_NoDates : int option
}
;;

type fix_rg_trdcapdtgrp = fix_rg_inner_trdcapdtgrp list
;;

type fix_rg_inner_ioiqualgrp = {
    f_IOIQualGrp_NoIOIQualifiers : int option;
    f_IOIQualGrp_IOIQualifier : fix_ioiqualifier option
}
;;

type fix_rg_ioiqualgrp = fix_rg_inner_ioiqualgrp list
;;

type fix_rg_inner_nstdptys3subgrp = {
    f_NstdPtys3SubGrp_Nested3PartySubID : string option;
    f_NstdPtys3SubGrp_Nested3PartySubIDType : int option;
    f_NstdPtys3SubGrp_NoNested3PartySubIDs : int option
}
;;

type fix_rg_nstdptys3subgrp = fix_rg_inner_nstdptys3subgrp list
;;

type fix_rg_inner_affectedordgrp = {
    f_AffectedOrdGrp_AffectedSecondaryOrderID : string option;
    f_AffectedOrdGrp_NoAffectedOrders : int option;
    f_AffectedOrdGrp_AffectedOrderID : string option;
    f_AffectedOrdGrp_OrigClOrdID : string option
}
;;

type fix_rg_affectedordgrp = fix_rg_inner_affectedordgrp list
;;

type fix_rg_inner_quoteacknowledgementquoteentries = {
    f_QuoteAcknowledgementQuoteEntries_SecurityDesc : string option;
    (** Must be specified if a Future or Option. If a Future: Symbol, SecurityType, and MaturityMonthYear are required. If an Option: Symbol, SecurityType, MaturityMonthYear, PutOrCall, and StrikePrice are required.*)
    f_QuoteAcknowledgementQuoteEntries_SecurityType : fix_securitytype option;
    f_QuoteAcknowledgementQuoteEntries_SymbolSfx : string option;
    (** For Fixed Income.*)
    f_QuoteAcknowledgementQuoteEntries_CouponRate : fix_float option;
    f_QuoteAcknowledgementQuoteEntries_Issuer : string option;
    (** Specifiesthe month and year of maturity. Required if MaturityDay is specified.*)
    f_QuoteAcknowledgementQuoteEntries_MaturityMonthYear : fix_monthyear option;
    (** For Options.*)
    f_QuoteAcknowledgementQuoteEntries_StrikePrice : fix_float_4 option;
    f_QuoteAcknowledgementQuoteEntries_IDSource : fix_idsource option;
    f_QuoteAcknowledgementQuoteEntries_Symbol : string option;
    (** For Options.*)
    f_QuoteAcknowledgementQuoteEntries_OptAttribute : string option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_QuoteAcknowledgementQuoteEntries_EncodedIssuer : string option;
    (** Reason Quote Entry was rejected.*)
    f_QuoteAcknowledgementQuoteEntries_QuoteEntryRejectReason : fix_quoteentryrejectreason option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_QuoteAcknowledgementQuoteEntries_EncodedIssuerLen : int option;
    (** Uniquely identifies the quote as part of a QuoteSet.
     First field in repeating group. Required if NoQuoteEntries > 0.*)
    f_QuoteAcknowledgementQuoteEntries_QuoteEntryID : string option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_QuoteAcknowledgementQuoteEntries_ContractMultiplier : fix_float option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_QuoteAcknowledgementQuoteEntries_EncodedSecurityDescLen : int option;
    f_QuoteAcknowledgementQuoteEntries_SecurityID : string option;
    (** For Options.*)
    f_QuoteAcknowledgementQuoteEntries_PutOrCall : fix_putorcall option;
    (** Can be used in conjunction with MaturityMonthYear to specify a particular maturity date.*)
    f_QuoteAcknowledgementQuoteEntries_MaturityDay : int option;
    (** Can be used to identify the security.*)
    f_QuoteAcknowledgementQuoteEntries_SecurityExchange : fix_exchange option;
    (** The number of quotes for this Symbol (QuoteSet) that follow in this message.*)
    f_QuoteAcknowledgementQuoteEntries_NoQuoteEntries : int option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_QuoteAcknowledgementQuoteEntries_EncodedSecurityDesc : string option
}
;;

type fix_rg_quoteacknowledgementquoteentries = fix_rg_inner_quoteacknowledgementquoteentries list
;;

type fix_rg_inner_massquotequotesets = {
    f_MassQuoteQuoteSets_UnderlyingIDSource : string option;
    f_MassQuoteQuoteSets_UnderlyingOptAttribute : string option;
    (** Total number of quotes for the quote set across all messages. Should be the sum of all NoQuoteEntries in each message that has repeating quotes that are part of the same quote set.*)
    f_MassQuoteQuoteSets_TotQuoteEntries : int option;
    f_MassQuoteQuoteSets_UnderlyingMaturityDay : int option;
    (** Encoded (non-ASCII characters) representation of the UnderlyingIssuer field in the encoded format specified via the MessageEncoding field.*)
    f_MassQuoteQuoteSets_EncodedUnderlyingIssuer : string option;
    (** Required if UnderlyingMaturityDay is specified.*)
    f_MassQuoteQuoteSets_UnderlyingMaturityMonthYear : fix_monthyear option;
    (** For Fixed Income.*)
    f_MassQuoteQuoteSets_UnderlyingCouponRate : fix_float option;
    f_MassQuoteQuoteSets_QuoteSetValidUntilTime : fix_utctimestamp option;
    f_MassQuoteQuoteSets_UnderlyingSecurityType : string option;
    f_MassQuoteQuoteSets_UnderlyingPutOrCall : int option;
    f_MassQuoteQuoteSets_UnderlyingSecurityExchange : fix_exchange option;
    f_MassQuoteQuoteSets_UnderlyingSecurityID : string option;
    (** Sequential number for the Quote Set. For a given QuoteID – assumed to start at 1.
     Must be the first field in the repeating group.*)
    f_MassQuoteQuoteSets_QuoteSetID : string option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc.*)
    f_MassQuoteQuoteSets_UnderlyingContractMultiplier : fix_float option;
    (** Must be set if EncodedUnderlyingSecurityDesc field is specified and must immediately precede it.*)
    f_MassQuoteQuoteSets_EncodedUnderlyingSecurityDescLen : int option;
    f_MassQuoteQuoteSets_UnderlyingSymbolSfx : string option;
    (** The number of sets of quotes in the message*)
    f_MassQuoteQuoteSets_NoQuoteSets : int option;
    (** Must be set if EncodedUnderlyingIssuer field is specified and must immediately precede it.*)
    f_MassQuoteQuoteSets_EncodedUnderlyingIssuerLen : int option;
    f_MassQuoteQuoteSets_UnderlyingSecurityDesc : string option;
    (** Encoded (non-ASCII characters) representation of the UnderlyingSecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_MassQuoteQuoteSets_EncodedUnderlyingSecurityDesc : string option;
    f_MassQuoteQuoteSets_UnderlyingIssuer : string option;
    f_MassQuoteQuoteSets_UnderlyingStrikePrice : fix_float_4 option;
    f_MassQuoteQuoteSets_UnderlyingSymbol : string option
}
;;

type fix_rg_massquotequotesets = fix_rg_inner_massquotequotesets list
;;

type fix_rg_inner_biddescreqgrp = {
    f_BidDescReqGrp_LiquidityNumSecurities : int option;
    f_BidDescReqGrp_NoBidDescriptors : int option;
    f_BidDescReqGrp_LiquidityPctLow : fix_float_4 option;
    f_BidDescReqGrp_FairValue : fix_float_4 option;
    f_BidDescReqGrp_ValueOfFutures : fix_float_4 option;
    f_BidDescReqGrp_BidDescriptorType : fix_biddescriptortype option;
    f_BidDescReqGrp_SideValueInd : fix_sidevalueind option;
    f_BidDescReqGrp_OutsideIndexPct : fix_float_4 option;
    f_BidDescReqGrp_BidDescriptor : string option;
    f_BidDescReqGrp_LiquidityValue : fix_float_4 option;
    f_BidDescReqGrp_LiquidityPctHigh : fix_float_4 option;
    f_BidDescReqGrp_EFPTrackingError : fix_float_4 option
}
;;

type fix_rg_biddescreqgrp = fix_rg_inner_biddescreqgrp list
;;

type fix_yielddata = {
    f_YieldData_YieldRedemptionDate : fix_localmktdate option;
    f_YieldData_YieldType : fix_yieldtype option;
    f_YieldData_YieldRedemptionPriceType : int option;
    f_YieldData_YieldCalcDate : fix_localmktdate option;
    f_YieldData_YieldRedemptionPrice : fix_float_4 option;
    f_YieldData_Yield : fix_float_4 option
}
;;

type fix_rg_inner_legstipulations = {
    f_LegStipulations_NoLegStipulations : int option;
    (** Required if NoLegStipulations >0*)
    f_LegStipulations_LegStipulationType : string option;
    f_LegStipulations_LegStipulationValue : string option
}
;;

type fix_rg_legstipulations = fix_rg_inner_legstipulations list
;;

type fix_rg_inner_newslinesoftext = {
    (** Specifies the number of repeating lines of text specified*)
    f_NewsLinesOfText_LinesOfText : int option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_NewsLinesOfText_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_NewsLinesOfText_EncodedText : string option;
    (** Repeating field, number of instances defined in LinesOfText*)
    f_NewsLinesOfText_Text : string option
}
;;

type fix_rg_newslinesoftext = fix_rg_inner_newslinesoftext list
;;

type fix_rg_inner_compidreqgrp = {
    f_CompIDReqGrp_LocationID : string option;
    f_CompIDReqGrp_RefSubID : string option;
    f_CompIDReqGrp_NoCompIDs : int option;
    f_CompIDReqGrp_RefCompID : string option;
    f_CompIDReqGrp_DeskID : string option
}
;;

type fix_rg_compidreqgrp = fix_rg_inner_compidreqgrp list
;;

type fix_rg_inner_evntgrp = {
    f_EvntGrp_EventType : fix_eventtype option;
    f_EvntGrp_NoEvents : int option;
    f_EvntGrp_EventText : string option;
    f_EvntGrp_EventDate : fix_localmktdate option;
    f_EvntGrp_EventPx : fix_float_4 option
}
;;

type fix_rg_evntgrp = fix_rg_inner_evntgrp list
;;

type fix_rg_inner_quotqualgrp = {
    f_QuotQualGrp_NoQuoteQualifiers : int option;
    f_QuotQualGrp_QuoteQualifier : string option
}
;;

type fix_rg_quotqualgrp = fix_rg_inner_quotqualgrp list
;;

type fix_rg_inner_ordercancelreplacerequesttradingsessions = {
    (** Specifies the number of repeating TradingSessionIDs*)
    f_OrderCancelReplaceRequestTradingSessions_NoTradingSessions : int option;
    (** Required if NoTradingSessions is > 0.*)
    f_OrderCancelReplaceRequestTradingSessions_TradingSessionID : string option
}
;;

type fix_rg_ordercancelreplacerequesttradingsessions = fix_rg_inner_ordercancelreplacerequesttradingsessions list
;;

type fix_rg_inner_trdcollgrp = {
    f_TrdCollGrp_SecondaryTradeReportID : string option;
    f_TrdCollGrp_NoTrades : int option;
    f_TrdCollGrp_TradeReportID : string option
}
;;

type fix_rg_trdcollgrp = fix_rg_inner_trdcollgrp list
;;

type fix_rg_inner_settlptyssubgrp = {
    f_SettlPtysSubGrp_SettlPartySubIDType : int option;
    f_SettlPtysSubGrp_NoSettlPartySubIDs : int option;
    f_SettlPtysSubGrp_SettlPartySubID : string option
}
;;

type fix_rg_settlptyssubgrp = fix_rg_inner_settlptyssubgrp list
;;

type fix_legbenchmarkcurvedata = {
    f_LegBenchmarkCurveData_LegBenchmarkPriceType : int option;
    f_LegBenchmarkCurveData_LegBenchmarkCurveCurrency : fix_currency option;
    f_LegBenchmarkCurveData_LegBenchmarkCurvePoint : string option;
    f_LegBenchmarkCurveData_LegBenchmarkCurveName : string option;
    f_LegBenchmarkCurveData_LegBenchmarkPrice : fix_float_4 option
}
;;

type fix_rg_inner_bidcompreqgrp = {
    f_BidCompReqGrp_Account : string option;
    f_BidCompReqGrp_AcctIDSource : fix_acctidsource option;
    f_BidCompReqGrp_Side : fix_side option;
    f_BidCompReqGrp_TradingSessionSubID : string option;
    f_BidCompReqGrp_NoBidComponents : int option;
    f_BidCompReqGrp_ListID : string option;
    f_BidCompReqGrp_SettlType : fix_settltype option;
    f_BidCompReqGrp_SettlDate : fix_localmktdate option;
    f_BidCompReqGrp_TradingSessionID : string option;
    f_BidCompReqGrp_NetGrossInd : fix_netgrossind option
}
;;

type fix_rg_bidcompreqgrp = fix_rg_inner_bidcompreqgrp list
;;

type fix_rg_inner_collinqqualgrp = {
    f_CollInqQualGrp_NoCollInquiryQualifier : int option;
    f_CollInqQualGrp_CollInquiryQualifier : fix_collinquiryqualifier option
}
;;

type fix_rg_collinqqualgrp = fix_rg_inner_collinqqualgrp list
;;

type fix_rg_inner_quoterequestrelatedsym = {
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_QuoteRequestRelatedSym_SecurityDesc : string option;
    (** For Fixed Income.*)
    f_QuoteRequestRelatedSym_CouponRate : fix_float option;
    (** For Options.*)
    f_QuoteRequestRelatedSym_StrikePrice : fix_float_4 option;
    (** Number of related symbols in Request*)
    f_QuoteRequestRelatedSym_NoRelatedSym : int option;
    (** Can be used to specify the type of order the quote request is for*)
    f_QuoteRequestRelatedSym_OrdType : fix_ordtype option;
    (** For Options.*)
    f_QuoteRequestRelatedSym_OptAttribute : string option;
    (** Indicates the type of Quote Request (e.g. Manual vs. Automatic) being generated.*)
    f_QuoteRequestRelatedSym_QuoteRequestType : fix_quoterequesttype option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_QuoteRequestRelatedSym_EncodedIssuerLen : int option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_QuoteRequestRelatedSym_ContractMultiplier : fix_float option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_QuoteRequestRelatedSym_EncodedSecurityDescLen : int option;
    (** For Options.*)
    f_QuoteRequestRelatedSym_PutOrCall : fix_putorcall option;
    (** Can be used with OrdType = "Forex - Swap" to specify the "value date" for the future portion of a F/X swap.*)
    f_QuoteRequestRelatedSym_FutSettDate2 : fix_localmktdate option;
    (** The time when Quote Request will expire.*)
    f_QuoteRequestRelatedSym_ExpireTime : fix_utctimestamp option;
    (** Can be used in conjunction with MaturityMonthYear to specify a particular maturity date.*)
    f_QuoteRequestRelatedSym_MaturityDay : int option;
    (** Must be specified if a Future or Option. If a Future:Symbol, SecurityType, and MaturityMonthYear are required. If an Option:Symbol, SecurityType, MaturityMonthYear, PutOrCall, and StrikePrice are required.*)
    f_QuoteRequestRelatedSym_SecurityType : fix_securitytype option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_QuoteRequestRelatedSym_SymbolSfx : string option;
    (** Can be used with forex quotes to specify the desired "value date"*)
    f_QuoteRequestRelatedSym_FutSettDate : fix_localmktdate option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_QuoteRequestRelatedSym_Issuer : string option;
    (** Specifiesthe month and year of maturity. Required if MaturityDay is specified.*)
    f_QuoteRequestRelatedSym_MaturityMonthYear : fix_monthyear option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_QuoteRequestRelatedSym_IDSource : fix_idsource option;
    (** Must be the first field in the repeating group.*)
    f_QuoteRequestRelatedSym_Symbol : string option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_QuoteRequestRelatedSym_EncodedIssuer : string option;
    f_QuoteRequestRelatedSym_TradingSessionID : string option;
    f_QuoteRequestRelatedSym_OrderQty : fix_float_4 option;
    (** Time transaction was entered*)
    f_QuoteRequestRelatedSym_TransactTime : fix_utctimestamp option;
    (** Can be used with OrdType = "Forex - Swap" to specify the order quantity for the future portion of a F/X swap.*)
    f_QuoteRequestRelatedSym_OrderQty2 : fix_float_4 option;
    (** If OrdType = "Forex - Swap", should be the side of the future portion of a F/X swap*)
    f_QuoteRequestRelatedSym_Side : fix_side option;
    (** Can be used to specify the currency of the quoted price.*)
    f_QuoteRequestRelatedSym_Currency : fix_currency option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_QuoteRequestRelatedSym_SecurityID : string option;
    (** Useful for verifying security identification*)
    f_QuoteRequestRelatedSym_PrevClosePx : fix_float_4 option;
    (** Can be used to identify the security.*)
    f_QuoteRequestRelatedSym_SecurityExchange : fix_exchange option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_QuoteRequestRelatedSym_EncodedSecurityDesc : string option
}
;;

type fix_rg_quoterequestrelatedsym = fix_rg_inner_quoterequestrelatedsym list
;;

type fix_rg_inner_orderlistorders = {
    f_OrderListOrders_SolicitedFlag : fix_solicitedflag option;
    f_OrderListOrders_ClearingFirm : string option;
    (** Refers to the SideValue1 or SideValue2. These are used as opposed to Buy or Sell so that the basket can be quoted either way as Buy or Sell.*)
    f_OrderListOrders_SideValueInd : int option;
    f_OrderListOrders_OrdType : fix_ordtype option;
    f_OrderListOrders_MaxShow : fix_float_4 option;
    (** For Options.*)
    f_OrderListOrders_OptAttribute : string option;
    f_OrderListOrders_PegDifference : fix_float_4 option;
    f_OrderListOrders_MaxFloor : fix_float_4 option;
    f_OrderListOrders_ProcessCode : fix_processcode option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_OrderListOrders_EncodedIssuerLen : int option;
    f_OrderListOrders_CustomerOrFirm : fix_customerorfirm option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_OrderListOrders_EncodedSecurityDescLen : int option;
    f_OrderListOrders_ClientID : string option;
    (** For Options.*)
    f_OrderListOrders_PutOrCall : fix_putorcall option;
    (** States whether executions are booked out or accumulated on a partially filled GT order*)
    f_OrderListOrders_GTBookingInst : fix_gtbookinginst option;
    f_OrderListOrders_ExDestination : fix_exchange option;
    (** Can be used in conjunction with MaturityMonthYear to specify a particular maturity date.*)
    f_OrderListOrders_MaturityDay : int option;
    f_OrderListOrders_Account : string option;
    (** Must be specified if a Future or Option. If a Future: Symbol, SecurityType, and MaturityMonthYear are required. If an Option: Symbol, SecurityType, MaturityMonthYear, PutOrCall, and StrikePrice are required.*)
    f_OrderListOrders_SecurityType : fix_securitytype option;
    f_OrderListOrders_EffectiveTime : fix_utctimestamp option;
    f_OrderListOrders_FutSettDate : fix_localmktdate option;
    f_OrderListOrders_MinQty : fix_float_4 option;
    (** Conditionally required if TimeInForce = GTD and ExpireTime is not specified.*)
    f_OrderListOrders_ExpireDate : fix_localmktdate option;
    f_OrderListOrders_Symbol : string option;
    f_OrderListOrders_Commission : fix_float_4 option;
    (** Either CashOrderQty or OrderQty is required. Note that either, but not both, CashOrderQty or OrderQty should be specified.*)
    f_OrderListOrders_OrderQty : fix_float_4 option;
    f_OrderListOrders_TransactTime : fix_utctimestamp option;
    (** Can be used with OrdType = "Forex - Swap" to specify the order quantity for the future portion of a F/X swap.*)
    f_OrderListOrders_OrderQty2 : fix_float_4 option;
    (** Note: to indicate the side of SideValue1 or SideValue2, specify Side=Undisclosed and SideValueInd=either the SideValue1 or SideValue2 indicator.*)
    f_OrderListOrders_Side : fix_side option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_OrderListOrders_EncodedTextLen : int option;
    f_OrderListOrders_ForexReq : fix_forexreq option;
    f_OrderListOrders_TimeInForce : fix_timeinforce option;
    f_OrderListOrders_ComplianceID : string option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_OrderListOrders_SecurityID : string option;
    (** Useful for verifying security identification*)
    f_OrderListOrders_PrevClosePx : fix_float_4 option;
    (** Can contain multiple instructions, space delimited. If OrdType=P, exactly one of the following values (ExecInst = L, R, M, P, O, T, or W) must be specified.*)
    f_OrderListOrders_ExecInst : fix_execinst option;
    (** Can be used to identify the security.*)
    f_OrderListOrders_SecurityExchange : fix_exchange option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_OrderListOrders_SecurityDesc : string option;
    f_OrderListOrders_SettlInstMode : fix_settlinstmode option;
    f_OrderListOrders_OpenClose : fix_openclose option;
    (** For Fixed Income.*)
    f_OrderListOrders_CouponRate : fix_float option;
    (** Required for Previously Quoted Orders (OrdType=D)*)
    f_OrderListOrders_QuoteID : string option;
    (** For Options.*)
    f_OrderListOrders_StrikePrice : fix_float_4 option;
    f_OrderListOrders_LocateReqd : fix_locatereqd option;
    (** Either CashOrderQty or OrderQty is required. Note that either, but not both, CashOrderQty or OrderQty should be specified. Specifies the approximate "monetary quantity" for the order. Broker is responsible for converting and calculating OrderQty in shares for subsequent messages.*)
    f_OrderListOrders_CashOrderQty : fix_float_4 option;
    (** Must be the first field in the repeating group.*)
    f_OrderListOrders_ClOrdID : string option;
    f_OrderListOrders_Rule80A : fix_rule80a option;
    f_OrderListOrders_Text : string option;
    (** Order number within the list*)
    f_OrderListOrders_ListSeqNo : int option;
    f_OrderListOrders_CommType : fix_commtype option;
    f_OrderListOrders_ExecBroker : string option;
    f_OrderListOrders_StopPx : fix_float_4 option;
    f_OrderListOrders_Price : fix_float_4 option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_OrderListOrders_ContractMultiplier : fix_float option;
    (** Conditionally required if TimeInForce = GTD and ExpireDate is not specified.*)
    f_OrderListOrders_ExpireTime : fix_utctimestamp option;
    (** Can be used with OrdType = "Forex - Swap" to specify the "value date" for the future portion of a F/X swap.*)
    f_OrderListOrders_FutSettDate2 : fix_localmktdate option;
    f_OrderListOrders_CoveredOrUncovered : fix_coveredoruncovered option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_OrderListOrders_SymbolSfx : string option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_OrderListOrders_Issuer : string option;
    (** Specifiesthe month and year of maturity. Required if MaturityDay is specified.*)
    f_OrderListOrders_MaturityMonthYear : fix_monthyear option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_OrderListOrders_IDSource : fix_idsource option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_OrderListOrders_EncodedText : string option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_OrderListOrders_EncodedIssuer : string option;
    (** Code to identify the price a DiscretionOffset is related to and should be mathematically added to. Required if DiscretionOffset is specified.*)
    f_OrderListOrders_DiscretionInst : fix_discretioninst option;
    (** Amount (signed) added to the "related to" price specified via DiscretionInst.*)
    f_OrderListOrders_DiscretionOffset : fix_float_4 option;
    (** Required for Previously Indicated Orders (OrdType=E)*)
    f_OrderListOrders_IOIid : string option;
    f_OrderListOrders_SettlCurrency : fix_currency option;
    f_OrderListOrders_ClearingAccount : string option;
    (** Number of orders in this message (number of repeating groups to follow)*)
    f_OrderListOrders_NoOrders : int option;
    f_OrderListOrders_Currency : fix_currency option;
    f_OrderListOrders_HandlInst : fix_handlinst option;
    f_OrderListOrders_SettlmntTyp : fix_settlmnttyp option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_OrderListOrders_EncodedSecurityDesc : string option
}
;;

type fix_rg_orderlistorders = fix_rg_inner_orderlistorders list
;;

type fix_spreadorbenchmarkcurvedata = {
    f_SpreadOrBenchmarkCurveData_BenchmarkPrice : fix_float_4 option;
    f_SpreadOrBenchmarkCurveData_BenchmarkCurveName : string option;
    (** For Fixed Income*)
    f_SpreadOrBenchmarkCurveData_Spread : fix_float_4 option;
    (** Must be present if BenchmarkPrice is used.*)
    f_SpreadOrBenchmarkCurveData_BenchmarkPriceType : int option;
    f_SpreadOrBenchmarkCurveData_BenchmarkCurvePoint : string option;
    (** The identifier of the benchmark security, e.g. Treasury against Corporate bond.*)
    f_SpreadOrBenchmarkCurveData_BenchmarkSecurityID : string option;
    (** Source of BenchmarkSecurityID. If not specified, then ID Source is understood to be the same as that in the Instrument block.*)
    f_SpreadOrBenchmarkCurveData_BenchmarkSecurityIDSource : string option;
    f_SpreadOrBenchmarkCurveData_BenchmarkCurveCurrency : fix_currency option
}
;;

type fix_rg_inner_undsecaltidgrp = {
    f_UndSecAltIDGrp_NoUnderlyingSecurityAltID : int option;
    f_UndSecAltIDGrp_UnderlyingSecurityAltID : string option;
    f_UndSecAltIDGrp_UnderlyingSecurityAltIDSource : string option
}
;;

type fix_rg_undsecaltidgrp = fix_rg_inner_undsecaltidgrp list
;;

type fix_rg_inner_rgstdistinstgrp = {
    f_RgstDistInstGrp_NoDistribInsts : int option;
    f_RgstDistInstGrp_CashDistribAgentCode : string option;
    f_RgstDistInstGrp_CashDistribPayRef : string option;
    f_RgstDistInstGrp_CashDistribAgentAcctNumber : string option;
    f_RgstDistInstGrp_DistribPaymentMethod : fix_distribpaymentmethod option;
    f_RgstDistInstGrp_CashDistribCurr : fix_currency option;
    f_RgstDistInstGrp_CashDistribAgentName : string option;
    f_RgstDistInstGrp_DistribPercentage : fix_float_4 option;
    f_RgstDistInstGrp_CashDistribAgentAcctName : string option
}
;;

type fix_rg_rgstdistinstgrp = fix_rg_inner_rgstdistinstgrp list
;;

type fix_rg_inner_emaillinesoftext = {
    (** Specifies the number of repeating lines of text specified*)
    f_EmailLinesOfText_LinesOfText : int option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_EmailLinesOfText_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_EmailLinesOfText_EncodedText : string option;
    (** Repeating field, number of instances defined in LinesOfText*)
    f_EmailLinesOfText_Text : string option
}
;;

type fix_rg_emaillinesoftext = fix_rg_inner_emaillinesoftext list
;;

type fix_rg_inner_mdreqgrp = {
    f_MDReqGrp_NoMDEntryTypes : int option;
    f_MDReqGrp_MDEntryType : fix_mdentrytype option
}
;;

type fix_rg_mdreqgrp = fix_rg_inner_mdreqgrp list
;;

type fix_rg_inner_marketdatarequestmdentrytypes = {
    (** Number of MDEntryType fields requested.*)
    f_MarketDataRequestMDEntryTypes_NoMDEntryTypes : int option;
    (** Must be the first field in this repeating group. This is a list of all the types of Market Data Entries that the firm requesting the Market Data is interested in receiving.*)
    f_MarketDataRequestMDEntryTypes_MDEntryType : fix_mdentrytype option
}
;;

type fix_rg_marketdatarequestmdentrytypes = fix_rg_inner_marketdatarequestmdentrytypes list
;;

type fix_peginstructions = {
    (** Amount (signed) added to the peg for a pegged order in the context of the PegOffsetType*)
    f_PegInstructions_PegOffsetValue : fix_float option;
    (** Describes whether peg is static/fixed or floats*)
    f_PegInstructions_PegMoveType : fix_pegmovetype option;
    (** Specifies nature of resulting pegged price (e.g. or better limit, strict limit etc)*)
    f_PegInstructions_PegLimitType : fix_peglimittype option;
    (** The scope of the "related to" price of the peg (e.g. local, global etc)*)
    f_PegInstructions_PegScope : fix_pegscope option;
    (** If the calculated peg price is not a valid tick price, specifies how to round the price (e.g. be more or less aggressive)*)
    f_PegInstructions_PegRoundDirection : fix_pegrounddirection option;
    (** Type of Peg Offset (e.g. price offset, tick offset etc)*)
    f_PegInstructions_PegOffsetType : fix_pegoffsettype option
}
;;

type fix_rg_inner_execsgrp = {
    f_ExecsGrp_ExecID : string option;
    f_ExecsGrp_NoExecs : int option
}
;;

type fix_rg_execsgrp = fix_rg_inner_execsgrp list
;;

type fix_rg_inner_cpctyconfgrp = {
    f_CpctyConfGrp_OrderCapacity : fix_ordercapacity option;
    f_CpctyConfGrp_NoCapacities : int option;
    f_CpctyConfGrp_OrderCapacityQty : fix_float_4 option;
    f_CpctyConfGrp_OrderRestrictions : fix_orderrestrictions option
}
;;

type fix_rg_cpctyconfgrp = fix_rg_inner_cpctyconfgrp list
;;

type fix_rg_inner_allocationexecs = {
    (** Price of individual execution. Required if NoExecs > 0*)
    f_AllocationExecs_LastPx : fix_float_4 option;
    f_AllocationExecs_ExecID : string option;
    (** Indicates number of individual execution repeating group entries to follow. Absence of this field indicates that no individual execution entries are included. Primarily used to support step-outs.*)
    f_AllocationExecs_NoExecs : int option;
    (** Number of shares in individual execution. Required if NoExecs > 0*)
    f_AllocationExecs_LastShares : fix_float_4 option;
    (** Can be specified by broker for AllocTransTyp=Calculated*)
    f_AllocationExecs_LastCapacity : fix_lastcapacity option
}
;;

type fix_rg_allocationexecs = fix_rg_inner_allocationexecs list
;;

type fix_rg_inner_trdgsesgrp = {
    f_TrdgSesGrp_NoTradingSessions : int option;
    f_TrdgSesGrp_TradingSessionSubID : string option;
    f_TrdgSesGrp_TradingSessionID : string option
}
;;

type fix_rg_trdgsesgrp = fix_rg_inner_trdgsesgrp list
;;

type fix_interval = {
    f_interval_start_time : fix_utctimestamp option;
    f_interval_duration : fix_duration option
}
;;

type fix_rg_inner_allocationorders = {
    (** Required for List Orders.*)
    f_AllocationOrders_ListID : string option;
    (** Indicates number of orders to be combined for allocation. If order(s) were manually delivered set to 1 (one).*)
    f_AllocationOrders_NoOrders : int option;
    (** Can be used to provide order id used by exchange or executing system.*)
    f_AllocationOrders_SecondaryOrderID : string option;
    (** Order ID assigned by client if order(s) were electronically delivered and executed. If order(s) were manually delivered this field should contain string "MANUAL".*)
    f_AllocationOrders_ClOrdID : string option;
    f_AllocationOrders_WaveNo : string option;
    f_AllocationOrders_OrderID : string option
}
;;

type fix_rg_allocationorders = fix_rg_inner_allocationorders list
;;

type fix_rg_inner_underlyingstipulations = {
    f_UnderlyingStipulations_NoUnderlyingStips : int option;
    f_UnderlyingStipulations_UnderlyingStipValue : string option;
    (** Required if NoUnderlyingStips >0*)
    f_UnderlyingStipulations_UnderlyingStipType : string option
}
;;

type fix_rg_underlyingstipulations = fix_rg_inner_underlyingstipulations list
;;

type fix_rg_inner_ioiroutingids = {
    (** Indicates type of RoutingID. Required if NoRoutingIDs is > 0.*)
    f_IOIRoutingIDs_RoutingType : fix_routingtype option;
    (** Required if any RoutingType and RoutingIDs are specified. Indicates the number within repeating group.*)
    f_IOIRoutingIDs_NoRoutingIDs : int option;
    (** Identifies routing destination. Required if NoRoutingIDs is > 0.*)
    f_IOIRoutingIDs_RoutingID : string option
}
;;

type fix_rg_ioiroutingids = fix_rg_inner_ioiroutingids list
;;

type fix_rg_inner_newsrelatedsym = {
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_NewsRelatedSym_SecurityDesc : string option;
    (** Must be specified if a Future or Option. If a Future: RelatdSym, SecurityType, and MaturityMonthYear are required. If an Option: RelatdSym, SecurityType, MaturityMonthYear, PutOrCall, and StrikePrice are required.*)
    f_NewsRelatedSym_SecurityType : fix_securitytype option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_NewsRelatedSym_SymbolSfx : string option;
    (** For Fixed Income.*)
    f_NewsRelatedSym_CouponRate : fix_float option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_NewsRelatedSym_Issuer : string option;
    (** Specifiesthe month and year of maturity. Required if MaturityDay is specified.*)
    f_NewsRelatedSym_MaturityMonthYear : fix_monthyear option;
    (** For Options.*)
    f_NewsRelatedSym_StrikePrice : fix_float_4 option;
    (** Specifies the number of repeating symbols specified*)
    f_NewsRelatedSym_NoRelatedSym : int option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_NewsRelatedSym_IDSource : fix_idsource option;
    (** For Options.*)
    f_NewsRelatedSym_OptAttribute : string option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_NewsRelatedSym_EncodedIssuer : string option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_NewsRelatedSym_EncodedIssuerLen : int option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_NewsRelatedSym_RelatdSym : string option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_NewsRelatedSym_ContractMultiplier : fix_float option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_NewsRelatedSym_EncodedSecurityDescLen : int option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_NewsRelatedSym_SecurityID : string option;
    (** For Options.*)
    f_NewsRelatedSym_PutOrCall : fix_putorcall option;
    (** Can be used in conjunction with MaturityMonthYear to specify a particular maturity date.*)
    f_NewsRelatedSym_MaturityDay : int option;
    (** Can be used to identify the security.*)
    f_NewsRelatedSym_SecurityExchange : fix_exchange option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_NewsRelatedSym_EncodedSecurityDesc : string option
}
;;

type fix_rg_newsrelatedsym = fix_rg_inner_newsrelatedsym list
;;

type fix_rg_inner_clrinstgrp = {
    f_ClrInstGrp_NoClearingInstructions : int option;
    f_ClrInstGrp_ClearingInstruction : fix_clearinginstruction option
}
;;

type fix_rg_clrinstgrp = fix_rg_inner_clrinstgrp list
;;

type fix_rg_inner_mdfullgrp = {
    f_MDFullGrp_MDMkt : fix_exchange option;
    f_MDFullGrp_Text : string option;
    f_MDFullGrp_MDEntryTime : fix_utctimeonly option;
    f_MDFullGrp_TradeCondition : fix_tradecondition option;
    f_MDFullGrp_NoMDEntries : int option;
    f_MDFullGrp_TradingSessionSubID : string option;
    f_MDFullGrp_NumberOfOrders : int option;
    f_MDFullGrp_MDEntrySeller : string option;
    f_MDFullGrp_Scope : fix_scope option;
    f_MDFullGrp_MDEntryPositionNo : int option;
    f_MDFullGrp_SellerDays : int option;
    f_MDFullGrp_ExpireTime : fix_utctimestamp option;
    f_MDFullGrp_MDEntryPx : fix_float_4 option;
    f_MDFullGrp_MinQty : fix_float_4 option;
    f_MDFullGrp_ExpireDate : fix_localmktdate option;
    f_MDFullGrp_EncodedText : string option;
    f_MDFullGrp_MDEntryDate : fix_utcdateonly option;
    f_MDFullGrp_TradingSessionID : string option;
    f_MDFullGrp_OrderID : string option;
    f_MDFullGrp_OpenCloseSettlFlag : fix_openclosesettlflag option;
    f_MDFullGrp_MDEntrySize : fix_float_4 option;
    f_MDFullGrp_TickDirection : fix_tickdirection option;
    f_MDFullGrp_EncodedTextLen : int option;
    f_MDFullGrp_MDEntryBuyer : string option;
    f_MDFullGrp_QuoteCondition : fix_quotecondition option;
    f_MDFullGrp_MDEntryOriginator : string option;
    f_MDFullGrp_Currency : fix_currency option;
    f_MDFullGrp_TimeInForce : fix_timeinforce option;
    f_MDFullGrp_PriceDelta : fix_float option;
    f_MDFullGrp_LocationID : string option;
    f_MDFullGrp_QuoteEntryID : string option;
    f_MDFullGrp_ExecInst : fix_execinst option;
    f_MDFullGrp_DeskID : string option;
    f_MDFullGrp_MDEntryType : fix_mdentrytype option
}
;;

type fix_rg_mdfullgrp = fix_rg_inner_mdfullgrp list
;;

type fix_rg_inner_allocationallocs = {
    (** Foreign exchange rate used to compute SettlCurrAmt from Currency to SettlCurrency*)
    f_AllocationAllocs_SettlCurrFxRate : fix_float option;
    (** Indicates number of allocation groups to follow.*)
    f_AllocationAllocs_NoAllocs : int option;
    (** NetMoney for this AllocAccount
     ((AllocShares * AllocAvgPx) - Commission - sum of MiscFeeAmt + AccruedInterestAmt) if a Sell
     ((AllocShares * AllocAvgPx) + Commission + sum of MiscFeeAmt + AccruedInterestAmt) if a Buy*)
    f_AllocationAllocs_AllocNetMoney : fix_float_4 option;
    (** Type of Settlement Instructions which will be provided via Settlement Instructions message (0=Default, 1=Standing Instructions, 2=Specific Allocation Account Overriding, 3=Specific Allocation Account Standing)*)
    f_AllocationAllocs_SettlInstMode : fix_settlinstmode option;
    (** AllocNetMoney in SettlCurrency for this AllocAccount if SettlCurrency is different from "overall" Currency*)
    f_AllocationAllocs_SettlCurrAmt : fix_float_4 option;
    (** Free format text field related to this AllocAccount*)
    f_AllocationAllocs_AllocText : string option;
    (** Specifies whether the SettlCurrFxRate should be multiplied or divided*)
    f_AllocationAllocs_SettlCurrFxRateCalc : string option;
    f_AllocationAllocs_AllocShares : fix_float_4 option;
    (** May be the same value as BrokerOfCredit if ProcessCode is step-out or soft-dollar step-out and Institution does not wish to disclose individual account breakdowns to the ExecBroker. Required if NoAllocs > 0. Must be first field in repeating group.*)
    f_AllocationAllocs_AllocAccount : string option;
    f_AllocationAllocs_Commission : fix_float_4 option;
    f_AllocationAllocs_ProcessCode : fix_processcode option;
    f_AllocationAllocs_CommType : fix_commtype option;
    (** Applicable for Convertible Bonds and fixed income*)
    f_AllocationAllocs_AccruedInterestAmt : fix_float_4 option;
    (** Used when performing "executed price" vs. "average price" allocations (e.g. Japan). AllocAccount plus AllocPrice form a unique Allocs entry. Used in lieu of AllocAvgPx.*)
    f_AllocationAllocs_AllocPrice : fix_float_4 option;
    (** Required for step-in and step-out trades*)
    f_AllocationAllocs_ExecBroker : string option;
    (** Required if ProcessCode is step-out or soft-dollar step-out*)
    f_AllocationAllocs_BrokerOfCredit : string option;
    (** Encoded (non-ASCII characters) representation of the AllocText field in the encoded format specified via the MessageEncoding field.*)
    f_AllocationAllocs_EncodedAllocText : string option;
    (** SettlCurrency for this AllocAccount if different from "overall" Currency. Required if SettlCurrAmt is specified.*)
    f_AllocationAllocs_SettlCurrency : fix_currency option;
    f_AllocationAllocs_NotifyBrokerOfCredit : fix_notifybrokerofcredit option;
    (** AvgPx for this AllocAccount. For F/X orders, should be the "all-in" rate (spot rate adjusted for forward points) for this allocation.*)
    f_AllocationAllocs_AllocAvgPx : fix_float_4 option;
    (** Must be set if EncodedAllocText field is specified and must immediately precede it.*)
    f_AllocationAllocs_EncodedAllocTextLen : int option;
    (** Used for firm identification in third-party transactions (should not be a substitute for OnBehalfOfCompID/DeliverToCompID).*)
    f_AllocationAllocs_ClientID : string option;
    f_AllocationAllocs_AllocHandlInst : fix_allochandlinst option
}
;;

type fix_rg_allocationallocs = fix_rg_inner_allocationallocs list
;;

type fix_rg_inner_clearingentries = {
    f_ClearingEntries_Account : string option;
    f_ClearingEntries_FreeText : string option;
    f_ClearingEntries_OpenClose : fix_openclose option;
    f_ClearingEntries_ClearingFirm : string option;
    f_ClearingEntries_Rule80A : fix_rule80a option;
    f_ClearingEntries_ClientID : string option;
    f_ClearingEntries_NoClearingEntries : int option;
    f_ClearingEntries_ClearingHandlingType : fix_clearinghandlingtype option
}
;;

type fix_rg_clearingentries = fix_rg_inner_clearingentries list
;;

type fix_rg_inner_execcollgrp = {
    f_ExecCollGrp_ExecID : string option;
    f_ExecCollGrp_NoExecs : int option
}
;;

type fix_rg_execcollgrp = fix_rg_inner_execcollgrp list
;;

type fix_rg_inner_ordercancelreplacerequestallocs = {
    (** Number of repeating groups for pre-trade allocation*)
    f_OrderCancelReplaceRequestAllocs_NoAllocs : int option;
    f_OrderCancelReplaceRequestAllocs_AllocShares : fix_float_4 option;
    (** Required if NoAllocs > 0. Must be first field in repeating group.*)
    f_OrderCancelReplaceRequestAllocs_AllocAccount : string option
}
;;

type fix_rg_ordercancelreplacerequestallocs = fix_rg_inner_ordercancelreplacerequestallocs list
;;

type fix_commissiondata = {
    (** For CIV - Optional*)
    f_CommissionData_FundRenewWaiv : fix_fundrenewwaiv option;
    f_CommissionData_Commission : fix_float_4 option;
    (** For CIV - Optional*)
    f_CommissionData_CommCurrency : fix_currency option;
    f_CommissionData_CommType : fix_commtype option
}
;;

type fix_rg_inner_emailroutingids = {
    (** Indicates type of RoutingID. Required if NoRoutingIDs is > 0.*)
    f_EmailRoutingIDs_RoutingType : fix_routingtype option;
    (** Required if any RoutingType and RoutingIDs are specified. Indicates the number within repeating group.*)
    f_EmailRoutingIDs_NoRoutingIDs : int option;
    (** Identifies routing destination. Required if NoRoutingIDs is > 0.*)
    f_EmailRoutingIDs_RoutingID : string option
}
;;

type fix_rg_emailroutingids = fix_rg_inner_emailroutingids list
;;

type fix_rg_inner_execallocgrp = {
    f_ExecAllocGrp_LastPx : fix_float_4 option;
    f_ExecAllocGrp_ExecID : string option;
    f_ExecAllocGrp_NoExecs : int option;
    f_ExecAllocGrp_LastParPx : fix_float_4 option;
    f_ExecAllocGrp_LastQty : fix_float_4 option;
    f_ExecAllocGrp_SecondaryExecID : string option;
    f_ExecAllocGrp_LastCapacity : fix_lastcapacity option
}
;;

type fix_rg_execallocgrp = fix_rg_inner_execallocgrp list
;;

type fix_rg_inner_emailrelatedsym = {
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_EmailRelatedSym_SecurityDesc : string option;
    (** Must be specified if a Future or Option. If a Future: RelatdSym, SecurityType, and MaturityMonthYear are required. If an Option: RelatdSym, SecurityType, MaturityMonthYear, PutOrCall, and StrikePrice are required.*)
    f_EmailRelatedSym_SecurityType : fix_securitytype option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_EmailRelatedSym_SymbolSfx : string option;
    (** For Fixed Income.*)
    f_EmailRelatedSym_CouponRate : fix_float option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_EmailRelatedSym_Issuer : string option;
    (** Specifiesthe month and year of maturity. Required if MaturityDay is specified.*)
    f_EmailRelatedSym_MaturityMonthYear : fix_monthyear option;
    (** For Options.*)
    f_EmailRelatedSym_StrikePrice : fix_float_4 option;
    (** Specifies the number of repeating symbols specified*)
    f_EmailRelatedSym_NoRelatedSym : int option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_EmailRelatedSym_IDSource : fix_idsource option;
    (** For Options.*)
    f_EmailRelatedSym_OptAttribute : string option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_EmailRelatedSym_EncodedIssuer : string option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_EmailRelatedSym_EncodedIssuerLen : int option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_EmailRelatedSym_RelatdSym : string option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_EmailRelatedSym_ContractMultiplier : fix_float option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_EmailRelatedSym_EncodedSecurityDescLen : int option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_EmailRelatedSym_SecurityID : string option;
    (** For Options.*)
    f_EmailRelatedSym_PutOrCall : fix_putorcall option;
    (** Can be used in conjunction with MaturityMonthYear to specify a particular maturity date.*)
    f_EmailRelatedSym_MaturityDay : int option;
    (** Can be used to identify the security.*)
    f_EmailRelatedSym_SecurityExchange : fix_exchange option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_EmailRelatedSym_EncodedSecurityDesc : string option
}
;;

type fix_rg_emailrelatedsym = fix_rg_inner_emailrelatedsym list
;;

type fix_rg_inner_nstdptys2subgrp = {
    f_NstdPtys2SubGrp_Nested2PartySubID : string option;
    f_NstdPtys2SubGrp_Nested2PartySubIDType : int option;
    f_NstdPtys2SubGrp_NoNested2PartySubIDs : int option
}
;;

type fix_rg_nstdptys2subgrp = fix_rg_inner_nstdptys2subgrp list
;;

type fix_rg_inner_massquotequoteentries = {
    f_MassQuoteQuoteEntries_SecurityDesc : string option;
    (** For Fixed Income.*)
    f_MassQuoteQuoteEntries_CouponRate : fix_float option;
    (** For Options.*)
    f_MassQuoteQuoteEntries_StrikePrice : fix_float_4 option;
    f_MassQuoteQuoteEntries_ValidUntilTime : fix_utctimestamp option;
    (** Can be used to specify the type of order the quote is for*)
    f_MassQuoteQuoteEntries_OrdType : fix_ordtype option;
    (** For Options.*)
    f_MassQuoteQuoteEntries_OptAttribute : string option;
    (** May be applicable for F/X quotes*)
    f_MassQuoteQuoteEntries_OfferSpotRate : fix_float_4 option;
    (** May be applicable for F/X quotes*)
    f_MassQuoteQuoteEntries_BidForwardPoints : fix_float_4 option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_MassQuoteQuoteEntries_EncodedIssuerLen : int option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_MassQuoteQuoteEntries_ContractMultiplier : fix_float option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_MassQuoteQuoteEntries_EncodedSecurityDescLen : int option;
    (** For Options.*)
    f_MassQuoteQuoteEntries_PutOrCall : fix_putorcall option;
    (** Can be used with OrdType = "Forex - Swap" to specify the "value date" for the future portion of a F/X swap.*)
    f_MassQuoteQuoteEntries_FutSettDate2 : fix_localmktdate option;
    (** Can be used in conjunction with MaturityMonthYear to specify a particular maturity date.*)
    f_MassQuoteQuoteEntries_MaturityDay : int option;
    (** Must be specified if a Future or Option. If a Future: Symbol, SecurityType, and MaturityMonthYear are required. If an Option: Symbol, SecurityType, MaturityMonthYear, PutOrCall, and StrikePrice are required.*)
    f_MassQuoteQuoteEntries_SecurityType : fix_securitytype option;
    (** May be applicable for F/X quotes*)
    f_MassQuoteQuoteEntries_BidSpotRate : fix_float_4 option;
    f_MassQuoteQuoteEntries_SymbolSfx : string option;
    (** Can be used with forex quotes to specify a specific "value date"*)
    f_MassQuoteQuoteEntries_FutSettDate : fix_localmktdate option;
    f_MassQuoteQuoteEntries_Issuer : string option;
    (** If F/X quote, should be the "all-in" rate (spot rate adjusted for forward points). Note that either BidPx, OfferPx or both must be specified.*)
    f_MassQuoteQuoteEntries_OfferPx : fix_float_4 option;
    (** Specifiesthe month and year of maturity. Required if MaturityDay is specified.*)
    f_MassQuoteQuoteEntries_MaturityMonthYear : fix_monthyear option;
    f_MassQuoteQuoteEntries_OfferSize : fix_float_4 option;
    f_MassQuoteQuoteEntries_IDSource : fix_idsource option;
    f_MassQuoteQuoteEntries_Symbol : string option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_MassQuoteQuoteEntries_EncodedIssuer : string option;
    f_MassQuoteQuoteEntries_TradingSessionID : string option;
    f_MassQuoteQuoteEntries_BidSize : fix_float_4 option;
    f_MassQuoteQuoteEntries_TransactTime : fix_utctimestamp option;
    (** Can be used with OrdType = "Forex - Swap" to specify the order quantity for the future portion of a F/X swap.*)
    f_MassQuoteQuoteEntries_OrderQty2 : fix_float_4 option;
    (** Can be used to specify the currency of the quoted price.*)
    f_MassQuoteQuoteEntries_Currency : fix_currency option;
    (** Uniquely identifies the quote as part of a QuoteSet.
     Must be used if NoQuoteEntries is used*)
    f_MassQuoteQuoteEntries_QuoteEntryID : string option;
    (** If F/X quote, should be the "all-in" rate (spot rate adjusted for forward points). Note that either BidPx, OfferPx or both must be specified.*)
    f_MassQuoteQuoteEntries_BidPx : fix_float_4 option;
    f_MassQuoteQuoteEntries_SecurityID : string option;
    (** May be applicable for F/X quotes*)
    f_MassQuoteQuoteEntries_OfferForwardPoints : fix_float_4 option;
    (** Can be used to identify the security.*)
    f_MassQuoteQuoteEntries_SecurityExchange : fix_exchange option;
    (** The number of quotes for this Symbol (QuoteSet) that follow in this message.
     ** Nested Repeating Group follows ***)
    f_MassQuoteQuoteEntries_NoQuoteEntries : int option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_MassQuoteQuoteEntries_EncodedSecurityDesc : string option
}
;;

type fix_rg_massquotequoteentries = fix_rg_inner_massquotequoteentries list
;;

type fix_rg_inner_attrbgrp = {
    f_AttrbGrp_InstrAttribValue : string option;
    f_AttrbGrp_NoInstrAttrib : int option;
    f_AttrbGrp_InstrAttribType : fix_instrattribtype option
}
;;

type fix_rg_attrbgrp = fix_rg_inner_attrbgrp list
;;

type fix_rg_inner_contamtgrp = {
    f_ContAmtGrp_ContAmtValue : fix_float option;
    f_ContAmtGrp_NoContAmts : int option;
    f_ContAmtGrp_ContAmtCurr : fix_currency option;
    f_ContAmtGrp_ContAmtType : fix_contamttype option
}
;;

type fix_rg_contamtgrp = fix_rg_inner_contamtgrp list
;;

type fix_rg_inner_miscfeesgrp = {
    f_MiscFeesGrp_MiscFeeBasis : fix_miscfeebasis option;
    f_MiscFeesGrp_MiscFeeCurr : fix_currency option;
    f_MiscFeesGrp_MiscFeeType : fix_miscfeetype option;
    f_MiscFeesGrp_MiscFeeAmt : fix_float_4 option;
    f_MiscFeesGrp_NoMiscFees : int option
}
;;

type fix_rg_miscfeesgrp = fix_rg_inner_miscfeesgrp list
;;

type fix_rg_inner_nstdptyssubgrp = {
    f_NstdPtysSubGrp_NestedPartySubIDType : int option;
    f_NstdPtysSubGrp_NestedPartySubID : string option;
    f_NstdPtysSubGrp_NoNestedPartySubIDs : int option
}
;;

type fix_rg_nstdptyssubgrp = fix_rg_inner_nstdptyssubgrp list
;;

type fix_rg_inner_hop = {
    f_Hop_HopSendingTime : fix_utctimestamp option;
    f_Hop_NoHops : int option;
    f_Hop_HopCompID : string option;
    f_Hop_HopRefID : int option
}
;;

type fix_rg_hop = fix_rg_inner_hop list
;;

type fix_rg_inner_executionreportcontrabrokers = {
    f_ExecutionReportContraBrokers_ContraTradeQty : fix_float_4 option;
    (** Number of ContraBrokers repeating group instances.*)
    f_ExecutionReportContraBrokers_NoContraBrokers : int option;
    f_ExecutionReportContraBrokers_ContraTrader : string option;
    (** First field in repeating group. Required if NoContraBrokers > 0.*)
    f_ExecutionReportContraBrokers_ContraBroker : string option;
    f_ExecutionReportContraBrokers_ContraTradeTime : fix_utctimestamp option
}
;;

type fix_rg_executionreportcontrabrokers = fix_rg_inner_executionreportcontrabrokers list
;;

type fix_rg_inner_routinggrp = {
    f_RoutingGrp_RoutingType : fix_routingtype option;
    f_RoutingGrp_NoRoutingIDs : int option;
    f_RoutingGrp_RoutingID : string option
}
;;

type fix_rg_routinggrp = fix_rg_inner_routinggrp list
;;

type fix_rg_inner_orderlisttradingsessions = {
    f_OrderListTradingSessions_NoTradingSessions : int option;
    (** First field in repeating group. Required if NoTradingSessions > 0.*)
    f_OrderListTradingSessions_TradingSessionID : string option
}
;;

type fix_rg_orderlisttradingsessions = fix_rg_inner_orderlisttradingsessions list
;;

type fix_rg_inner_stipulations = {
    (** Required if NoStipulations >0*)
    f_Stipulations_StipulationType : fix_stipulationtype option;
    f_Stipulations_StipulationValue : string option;
    f_Stipulations_NoStipulations : int option
}
;;

type fix_rg_stipulations = fix_rg_inner_stipulations list
;;

type fix_rg_inner_allocationmiscfees = {
    (** Required if NoMiscFees > 0*)
    f_AllocationMiscFees_MiscFeeCurr : fix_currency option;
    (** Required if NoMiscFees > 0*)
    f_AllocationMiscFees_MiscFeeType : fix_miscfeetype option;
    (** Required if NoMiscFees > 0*)
    f_AllocationMiscFees_MiscFeeAmt : fix_float_4 option;
    (** Required if any miscellaneous fees are reported. Indicates number of repeating entries. Repeating group within Alloc repeating group.
     ** Nested Repeating Group follows ***)
    f_AllocationMiscFees_NoMiscFees : int option
}
;;

type fix_rg_allocationmiscfees = fix_rg_inner_allocationmiscfees list
;;

type fix_financingdetails = {
    (** For Repos the timing or method for terminating the agreement.*)
    f_FinancingDetails_TerminationType : fix_terminationtype option;
    (** A common reference to the applicable standing agreement between the principals*)
    f_FinancingDetails_AgreementID : string option;
    (** Currency of the underlying agreement.*)
    f_FinancingDetails_AgreementCurrency : fix_currency option;
    (** The full name of the base standard agreement, annexes and amendments in place between the principals and applicable to this deal*)
    f_FinancingDetails_AgreementDesc : string option;
    (** Percentage of cash value that underlying security collateral must meet.*)
    f_FinancingDetails_MarginRatio : fix_float_4 option;
    (** A reference to the date the underlying agreement was executed.*)
    f_FinancingDetails_AgreementDate : fix_localmktdate option;
    (** Repayment / repurchase date*)
    f_FinancingDetails_EndDate : fix_localmktdate option;
    (** Delivery or custody arrangement for the underlying securities*)
    f_FinancingDetails_DeliveryType : fix_deliverytype option;
    (** Settlement date of the beginning of the deal*)
    f_FinancingDetails_StartDate : fix_localmktdate option
}
;;

type fix_rg_inner_orderlistallocs = {
    (** Indicates number of pre-trade allocation accounts to follow*)
    f_OrderListAllocs_NoAllocs : int option;
    f_OrderListAllocs_AllocShares : fix_float_4 option;
    (** Required if NoAllocs > 0. Must be the first field in the repeating group.*)
    f_OrderListAllocs_AllocAccount : string option
}
;;

type fix_rg_orderlistallocs = fix_rg_inner_orderlistallocs list
;;

type fix_rg_inner_linesoftextgrp = {
    f_LinesOfTextGrp_EncodedTextLen : int option;
    f_LinesOfTextGrp_NoLinesOfText : int option;
    f_LinesOfTextGrp_EncodedText : string option;
    f_LinesOfTextGrp_Text : string option
}
;;

type fix_rg_linesoftextgrp = fix_rg_inner_linesoftextgrp list
;;

type fix_rg_inner_ordliststatgrp = {
    f_OrdListStatGrp_CumQty : fix_float_4 option;
    f_OrdListStatGrp_OrdRejReason : fix_ordrejreason option;
    f_OrdListStatGrp_EncodedText : string option;
    f_OrdListStatGrp_ClOrdID : string option;
    f_OrdListStatGrp_Text : string option;
    f_OrdListStatGrp_SecondaryClOrdID : string option;
    f_OrdListStatGrp_WorkingIndicator : fix_workingindicator option;
    f_OrdListStatGrp_AvgPx : fix_float_4 option;
    f_OrdListStatGrp_EncodedTextLen : int option;
    f_OrdListStatGrp_OrdStatus : fix_ordstatus option;
    f_OrdListStatGrp_NoOrders : int option;
    f_OrdListStatGrp_CxlQty : fix_float_4 option;
    f_OrdListStatGrp_LeavesQty : fix_float_4 option
}
;;

type fix_rg_ordliststatgrp = fix_rg_inner_ordliststatgrp list
;;

type fix_rg_inner_ptyssubgrp = {
    f_PtysSubGrp_PartySubIDType : fix_partysubidtype option;
    f_PtysSubGrp_PartySubID : string option;
    f_PtysSubGrp_NoPartySubIDs : int option
}
;;

type fix_rg_ptyssubgrp = fix_rg_inner_ptyssubgrp list
;;

type fix_rg_inner_bidresponsebidcomponents = {
    f_BidResponseBidComponents_FutSettDate : fix_localmktdate option;
    (** The difference between the value of a future and the value of the underlying equities after allowing for the discounted cash flows associated with the underlying stocks (E.g. Dividends etc).*)
    f_BidResponseBidComponents_FairValue : fix_float_4 option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_BidResponseBidComponents_EncodedText : string option;
    (** First element of price. Required if NoBidComponents > 0.*)
    f_BidResponseBidComponents_Commission : fix_float_4 option;
    f_BidResponseBidComponents_TradingSessionID : string option;
    f_BidResponseBidComponents_Text : string option;
    f_BidResponseBidComponents_CommType : fix_commtype option;
    (** Net/Gross*)
    f_BidResponseBidComponents_NetGrossInd : fix_netgrossind option;
    (** When used in response to a "Disclosed" request indicates whether SideValue1 is Buy or Sell. SideValue2 can be derived by inference.*)
    f_BidResponseBidComponents_Side : fix_side option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_BidResponseBidComponents_EncodedTextLen : int option;
    (** Number of bid repeating groups*)
    f_BidResponseBidComponents_NoBidComponents : int option;
    (** Second element of price*)
    f_BidResponseBidComponents_Price : fix_float_4 option;
    f_BidResponseBidComponents_ListID : string option;
    (** ISO Country Code*)
    f_BidResponseBidComponents_Country : string option;
    f_BidResponseBidComponents_PriceType : fix_pricetype option;
    (** Indicates order settlement period for Detail.*)
    f_BidResponseBidComponents_SettlmntTyp : fix_settlmnttyp option
}
;;

type fix_rg_bidresponsebidcomponents = fix_rg_inner_bidresponsebidcomponents list
;;

type fix_rg_inner_logonmsgtypes = {
    (** Indicates direction (send vs. receive) of a supported MsgType. Required if NoMsgTypes is > 0. Should be specified from the point of view of the sender of the Logon message*)
    f_LogonMsgTypes_MsgDirection : fix_msgdirection option;
    (** Specifies the number of repeating MsgTypes specified*)
    f_LogonMsgTypes_NoMsgTypes : int option;
    (** Specifies a specific, supported MsgType. Required if NoMsgTypes is > 0. Should be specified from the point of view of the sender of the Logon message*)
    f_LogonMsgTypes_RefMsgType : string option
}
;;

type fix_rg_logonmsgtypes = fix_rg_inner_logonmsgtypes list
;;

type fix_rg_inner_sectypesgrp = {
    f_SecTypesGrp_SecurityType : fix_securitytype option;
    f_SecTypesGrp_NoSecurityTypes : int option;
    f_SecTypesGrp_Product : fix_product option;
    f_SecTypesGrp_SecuritySubType : string option;
    f_SecTypesGrp_CFICode : string option
}
;;

type fix_rg_sectypesgrp = fix_rg_inner_sectypesgrp list
;;

type fix_rg_inner_quotecancelquoteentries = {
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_QuoteCancelQuoteEntries_SecurityDesc : string option;
    (** Must be specified if a Future or Option. If a Future:Symbol, SecurityType, and MaturityMonthYear are required. If an Option:Symbol, SecurityType, MaturityMonthYear, PutOrCall, and StrikePrice are required.*)
    f_QuoteCancelQuoteEntries_SecurityType : fix_securitytype option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_QuoteCancelQuoteEntries_SymbolSfx : string option;
    (** For Fixed Income.*)
    f_QuoteCancelQuoteEntries_CouponRate : fix_float option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_QuoteCancelQuoteEntries_Issuer : string option;
    (** Specifiesthe month and year of maturity. Required if MaturityDay is specified.*)
    f_QuoteCancelQuoteEntries_MaturityMonthYear : fix_monthyear option;
    (** For Options.*)
    f_QuoteCancelQuoteEntries_StrikePrice : fix_float_4 option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_QuoteCancelQuoteEntries_IDSource : fix_idsource option;
    (** Must be the first field in the repeating group.*)
    f_QuoteCancelQuoteEntries_Symbol : string option;
    (** For Options.*)
    f_QuoteCancelQuoteEntries_OptAttribute : string option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_QuoteCancelQuoteEntries_EncodedIssuer : string option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_QuoteCancelQuoteEntries_EncodedIssuerLen : int option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_QuoteCancelQuoteEntries_ContractMultiplier : fix_float option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_QuoteCancelQuoteEntries_EncodedSecurityDescLen : int option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_QuoteCancelQuoteEntries_SecurityID : string option;
    (** For Options.*)
    f_QuoteCancelQuoteEntries_PutOrCall : fix_putorcall option;
    (** Can be used in conjunction with MaturityMonthYear to specify a particular maturity date.*)
    f_QuoteCancelQuoteEntries_MaturityDay : int option;
    (** Can be used to identify the security.*)
    f_QuoteCancelQuoteEntries_SecurityExchange : fix_exchange option;
    (** The number of securities whose quotes are to be canceled*)
    f_QuoteCancelQuoteEntries_NoQuoteEntries : int option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_QuoteCancelQuoteEntries_EncodedSecurityDesc : string option;
    (** The symbol of the underlying security of options that should be canceled.*)
    f_QuoteCancelQuoteEntries_UnderlyingSymbol : string option
}
;;

type fix_rg_quotecancelquoteentries = fix_rg_inner_quotecancelquoteentries list
;;

type fix_rg_inner_marketdatarequestrelatedsym = {
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_MarketDataRequestRelatedSym_SecurityDesc : string option;
    (** Must be specified if a Future or Option. If a Future:Symbol, SecurityType, and MaturityMonthYear are required. If an Option:Symbol, SecurityType, MaturityMonthYear, PutOrCall, and StrikePrice are required.*)
    f_MarketDataRequestRelatedSym_SecurityType : fix_securitytype option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_MarketDataRequestRelatedSym_SymbolSfx : string option;
    (** For Fixed Income.*)
    f_MarketDataRequestRelatedSym_CouponRate : fix_float option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_MarketDataRequestRelatedSym_Issuer : string option;
    (** Specifiesthe month and year of maturity. Required if MaturityDay is specified.*)
    f_MarketDataRequestRelatedSym_MaturityMonthYear : fix_monthyear option;
    (** For Options.*)
    f_MarketDataRequestRelatedSym_StrikePrice : fix_float_4 option;
    (** Number of symbols requested.*)
    f_MarketDataRequestRelatedSym_NoRelatedSym : int option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_MarketDataRequestRelatedSym_IDSource : fix_idsource option;
    (** Must be the first field in the repeating group.*)
    f_MarketDataRequestRelatedSym_Symbol : string option;
    (** For Options.*)
    f_MarketDataRequestRelatedSym_OptAttribute : string option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_MarketDataRequestRelatedSym_EncodedIssuer : string option;
    f_MarketDataRequestRelatedSym_TradingSessionID : string option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_MarketDataRequestRelatedSym_EncodedIssuerLen : int option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_MarketDataRequestRelatedSym_ContractMultiplier : fix_float option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_MarketDataRequestRelatedSym_EncodedSecurityDescLen : int option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_MarketDataRequestRelatedSym_SecurityID : string option;
    (** For Options.*)
    f_MarketDataRequestRelatedSym_PutOrCall : fix_putorcall option;
    (** Can be used in conjunction with MaturityMonthYear to specify a particular maturity date.*)
    f_MarketDataRequestRelatedSym_MaturityDay : int option;
    (** Can be used to identify the security.*)
    f_MarketDataRequestRelatedSym_SecurityExchange : fix_exchange option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_MarketDataRequestRelatedSym_EncodedSecurityDesc : string option
}
;;

type fix_rg_marketdatarequestrelatedsym = fix_rg_inner_marketdatarequestrelatedsym list
;;

type fix_rg_inner_positionamountdata = {
    (** Number of Position Amount entries*)
    f_PositionAmountData_NoPosAmt : int option;
    f_PositionAmountData_PosAmt : fix_float_4 option;
    f_PositionAmountData_PosAmtType : fix_posamttype option
}
;;

type fix_rg_positionamountdata = fix_rg_inner_positionamountdata list
;;

type fix_rg_inner_mdrjctgrp = {
    f_MDRjctGrp_NoAltMDSource : int option;
    f_MDRjctGrp_AltMDSourceID : string option
}
;;

type fix_rg_mdrjctgrp = fix_rg_inner_mdrjctgrp list
;;

type fix_rg_inner_liststatusorders = {
    f_ListStatusOrders_CumQty : fix_float_4 option;
    f_ListStatusOrders_AvgPx : fix_float_4 option;
    (** Used if the order is rejected*)
    f_ListStatusOrders_OrdRejReason : fix_ordrejreason option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_ListStatusOrders_EncodedTextLen : int option;
    f_ListStatusOrders_OrdStatus : fix_ordstatus option;
    (** Number of orders statused in this message, i.e. number of repeating groups to follow.*)
    f_ListStatusOrders_NoOrders : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_ListStatusOrders_EncodedText : string option;
    f_ListStatusOrders_ClOrdID : string option;
    f_ListStatusOrders_Text : string option;
    f_ListStatusOrders_CxlQty : fix_float_4 option;
    (** Amount of shares open for further execution. LeavesQty = OrderQty - CumQty.*)
    f_ListStatusOrders_LeavesQty : fix_float_4 option
}
;;

type fix_rg_liststatusorders = fix_rg_inner_liststatusorders list
;;

type fix_rg_inner_secaltidgrp = {
    f_SecAltIDGrp_NoSecurityAltID : int option;
    f_SecAltIDGrp_SecurityAltIDSource : string option;
    f_SecAltIDGrp_SecurityAltID : string option
}
;;

type fix_rg_secaltidgrp = fix_rg_inner_secaltidgrp list
;;

type fix_rg_inner_trdregtimestamps = {
    f_TrdRegTimestamps_NoTrdRegTimestamps : int option;
    (** Optional*)
    f_TrdRegTimestamps_TrdRegTimestampOrigin : string option;
    (** Required if NoTrdRegTimestamps > 1*)
    f_TrdRegTimestamps_TrdRegTimestampType : fix_trdregtimestamptype option;
    (** Required if NoTrdRegTimestamps > 1*)
    f_TrdRegTimestamps_TrdRegTimestamp : fix_utctimestamp option
}
;;

type fix_rg_trdregtimestamps = fix_rg_inner_trdregtimestamps list
;;

type fix_rg_inner_bidrequestbidcomponents = {
    f_BidRequestBidComponents_Account : string option;
    (** When used in request for a "Disclosed" bid indicates that bid is required on assumption that SideValue1 is Buy or Sell. SideValue2 can be derived by inference.*)
    f_BidRequestBidComponents_Side : fix_side option;
    f_BidRequestBidComponents_FutSettDate : fix_localmktdate option;
    (** Used if BidType="Disclosed"*)
    f_BidRequestBidComponents_NoBidComponents : int option;
    (** Required if NoBidComponents > 0. Must be first field in repeating group.*)
    f_BidRequestBidComponents_ListID : string option;
    (** Indicates off-exchange type activities for Detail.*)
    f_BidRequestBidComponents_TradingSessionID : string option;
    (** Indicates order settlement period for Detail.*)
    f_BidRequestBidComponents_SettlmntTyp : fix_settlmnttyp option;
    (** Indicates Net or Gross for selling Detail.*)
    f_BidRequestBidComponents_NetGrossInd : fix_netgrossind option
}
;;

type fix_rg_bidrequestbidcomponents = fix_rg_inner_bidrequestbidcomponents list
;;

type fix_rg_inner_liststrikepricestrikes = {
    f_ListStrikePriceStrikes_SecurityDesc : string option;
    (** For Fixed Income.*)
    f_ListStrikePriceStrikes_CouponRate : fix_float option;
    (** For Options.*)
    f_ListStrikePriceStrikes_StrikePrice : fix_float_4 option;
    (** For Options.*)
    f_ListStrikePriceStrikes_OptAttribute : string option;
    (** Can use client order identifier or the symbol and side to uniquely identify the stock in the list.*)
    f_ListStrikePriceStrikes_ClOrdID : string option;
    f_ListStrikePriceStrikes_Text : string option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_ListStrikePriceStrikes_EncodedIssuerLen : int option;
    f_ListStrikePriceStrikes_Price : fix_float_4 option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_ListStrikePriceStrikes_ContractMultiplier : fix_float option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_ListStrikePriceStrikes_EncodedSecurityDescLen : int option;
    (** For Options.*)
    f_ListStrikePriceStrikes_PutOrCall : fix_putorcall option;
    (** Can be used in conjunction with MaturityMonthYear to specify a particular maturity date.*)
    f_ListStrikePriceStrikes_MaturityDay : int option;
    (** Must be specified if a Future or Option. If a Future: Symbol, SecurityType, and MaturityMonthYear are required. If an Option: Symbol, SecurityType, MaturityMonthYear, PutOrCall, and StrikePrice are required.*)
    f_ListStrikePriceStrikes_SecurityType : fix_securitytype option;
    f_ListStrikePriceStrikes_SymbolSfx : string option;
    f_ListStrikePriceStrikes_Issuer : string option;
    (** Specifiesthe month and year of maturity. Required if MaturityDay is specified.*)
    f_ListStrikePriceStrikes_MaturityMonthYear : fix_monthyear option;
    f_ListStrikePriceStrikes_IDSource : fix_idsource option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_ListStrikePriceStrikes_EncodedText : string option;
    (** Required if NoStrikes > 0. Must be first field in repeating group.*)
    f_ListStrikePriceStrikes_Symbol : string option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_ListStrikePriceStrikes_EncodedIssuer : string option;
    f_ListStrikePriceStrikes_Side : fix_side option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_ListStrikePriceStrikes_EncodedTextLen : int option;
    (** Number of strike price entries*)
    f_ListStrikePriceStrikes_NoStrikes : int option;
    f_ListStrikePriceStrikes_Currency : fix_currency option;
    f_ListStrikePriceStrikes_SecurityID : string option;
    (** Useful for verifying security identification*)
    f_ListStrikePriceStrikes_PrevClosePx : fix_float_4 option;
    (** Can be used to identify the security.*)
    f_ListStrikePriceStrikes_SecurityExchange : fix_exchange option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_ListStrikePriceStrikes_EncodedSecurityDesc : string option
}
;;

type fix_rg_liststrikepricestrikes = fix_rg_inner_liststrikepricestrikes list
;;

type fix_rg_inner_newsroutingids = {
    (** Indicates type of RoutingID. Required if NoRoutingIDs is > 0.*)
    f_NewsRoutingIDs_RoutingType : fix_routingtype option;
    (** Required if any RoutingType and RoutingIDs are specified. Indicates the number within repeating group.*)
    f_NewsRoutingIDs_NoRoutingIDs : int option;
    (** Identifies routing destination. Required if NoRoutingIDs is > 0.*)
    f_NewsRoutingIDs_RoutingID : string option
}
;;

type fix_rg_newsroutingids = fix_rg_inner_newsroutingids list
;;

type fix_rg_inner_securitydefinitionrequestrelatedsym = {
    f_SecurityDefinitionRequestRelatedSym_UnderlyingIDSource : string option;
    (** Quantity of particular leg in the Security*)
    f_SecurityDefinitionRequestRelatedSym_RatioQty : fix_float_4 option;
    (** For Options.*)
    f_SecurityDefinitionRequestRelatedSym_UnderlyingOptAttribute : string option;
    (** Can be used in conjunction with UnderlyingMaturityMonthYear to specify a particular maturity date.*)
    f_SecurityDefinitionRequestRelatedSym_UnderlyingMaturityDay : int option;
    (** Encoded (non-ASCII characters) representation of the UnderlyingIssuer field in the encoded format specified via the MessageEncoding field.*)
    f_SecurityDefinitionRequestRelatedSym_EncodedUnderlyingIssuer : string option;
    (** Specifiesthe month and year of maturity. Required if UnderlyingMaturityDay is specified.*)
    f_SecurityDefinitionRequestRelatedSym_UnderlyingMaturityMonthYear : fix_monthyear option;
    (** Number of legs that make up the Security*)
    f_SecurityDefinitionRequestRelatedSym_NoRelatedSym : int option;
    (** For Fixed Income.*)
    f_SecurityDefinitionRequestRelatedSym_UnderlyingCouponRate : fix_float option;
    f_SecurityDefinitionRequestRelatedSym_UnderlyingCurrency : fix_currency option;
    (** Must be specified if a Future or Option. If a Future: UnderlyingSymbol, UnderlyingSecurityType, and UnderlyingMaturityMonthYear are required. If an Option: UnderlyingSymbol, UnderlyingSecurityType, UnderlyingMaturityMonthYear, UnderlyingPutOrCall, and UnderlyingStrikePrice are required.*)
    f_SecurityDefinitionRequestRelatedSym_UnderlyingSecurityType : string option;
    (** For Options.*)
    f_SecurityDefinitionRequestRelatedSym_UnderlyingPutOrCall : int option;
    (** Can be used to identify the security.*)
    f_SecurityDefinitionRequestRelatedSym_UnderlyingSecurityExchange : fix_exchange option;
    f_SecurityDefinitionRequestRelatedSym_UnderlyingSecurityID : string option;
    (** Indicates if this leg of the security is to be Bought or Sold as part of this complex security.*)
    f_SecurityDefinitionRequestRelatedSym_Side : fix_side option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc.*)
    f_SecurityDefinitionRequestRelatedSym_UnderlyingContractMultiplier : fix_float option;
    (** Must be set if EncodedUnderlyingSecurityDesc field is specified and must immediately precede it.*)
    f_SecurityDefinitionRequestRelatedSym_EncodedUnderlyingSecurityDescLen : int option;
    f_SecurityDefinitionRequestRelatedSym_UnderlyingSymbolSfx : string option;
    (** Must be set if EncodedUnderlyingIssuer field is specified and must immediately precede it.*)
    f_SecurityDefinitionRequestRelatedSym_EncodedUnderlyingIssuerLen : int option;
    f_SecurityDefinitionRequestRelatedSym_UnderlyingSecurityDesc : string option;
    (** Encoded (non-ASCII characters) representation of the UnderlyingSecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_SecurityDefinitionRequestRelatedSym_EncodedUnderlyingSecurityDesc : string option;
    f_SecurityDefinitionRequestRelatedSym_UnderlyingIssuer : string option;
    (** For Options.*)
    f_SecurityDefinitionRequestRelatedSym_UnderlyingStrikePrice : fix_float_4 option;
    (** The UnderlyingSymbol must be specified as the first field in the repeating group.
     Required if NoRelatedSym > 0.*)
    f_SecurityDefinitionRequestRelatedSym_UnderlyingSymbol : string option
}
;;

type fix_rg_securitydefinitionrequestrelatedsym = fix_rg_inner_securitydefinitionrequestrelatedsym list
;;

type fix_rg_inner_bidrequestbiddescriptors = {
    (** Number of Securites between LiquidityPctLow and LiquidityPctHigh in Currency*)
    f_BidRequestBidDescriptors_LiquidityNumSecurities : int option;
    (** Used if BidType="Non Disclosed"*)
    f_BidRequestBidDescriptors_NoBidDescriptors : int option;
    (** Liquidity indicator or lower limit if LiquidityNumSecurities > 1*)
    f_BidRequestBidDescriptors_LiquidityPctLow : fix_float option;
    (** Used in EFP trades*)
    f_BidRequestBidDescriptors_FairValue : fix_float_4 option;
    (** Used in EFP trades*)
    f_BidRequestBidDescriptors_ValueOfFutures : fix_float_4 option;
    (** Required if NoBidDescriptors > 0. Must be first field in repeating group.*)
    f_BidRequestBidDescriptors_BidDescriptorType : int option;
    (** Refers to the SideValue1 or SideValue2. These are used as opposed to Buy or Sell so that the basket can be quoted either way as Buy or Sell.*)
    f_BidRequestBidDescriptors_SideValueInd : int option;
    (** Used in EFP trades*)
    f_BidRequestBidDescriptors_OutsideIndexPct : fix_float option;
    f_BidRequestBidDescriptors_BidDescriptor : string option;
    (** Value between LiquidityPctLow and LiquidityPctHigh in Currency*)
    f_BidRequestBidDescriptors_LiquidityValue : fix_float_4 option;
    (** Upper liquidity indicator if LiquidityNumSecurities > 1*)
    f_BidRequestBidDescriptors_LiquidityPctHigh : fix_float option;
    (** Eg Used in EFP (Exchange For Physical) trades 12%*)
    f_BidRequestBidDescriptors_EFPTrackingError : fix_float option
}
;;

type fix_rg_bidrequestbiddescriptors = fix_rg_inner_bidrequestbiddescriptors list
;;

type fix_orderqtydata = {
    (** For CIV - Optional*)
    f_OrderQtyData_RoundingDirection : fix_roundingdirection option;
    (** For CIV - Optional*)
    f_OrderQtyData_RoundingModulus : fix_float option;
    (** For CIV - Optional. One of CashOrderQty, OrderQty or (for CIV only) OrderPercent is required. Note that unless otherwise specified, only one of CashOrderQty, OrderQty, or OrderPercent should be specified.*)
    f_OrderQtyData_OrderPercent : fix_float_4 option;
    (** One of CashOrderQty, OrderQty, or (for CIV only) OrderPercent is required. Note that unless otherwise specified, only one of CashOrderQty, OrderQty, or OrderPercent should be specified. Specifies the approximate "monetary quantity" for the order. Broker is responsible for converting and calculating OrderQty in tradeable units (e.g. shares) for subsequent messages.*)
    f_OrderQtyData_CashOrderQty : fix_float_4 option;
    (** One of CashOrderQty, OrderQty, or (for CIV only) OrderPercent is required. Note that unless otherwise specified, only one of CashOrderQty, OrderQty, or OrderPercent should be specified.*)
    f_OrderQtyData_OrderQty : fix_float_4 option
}
;;

type fix_rg_inner_contragrp = {
    f_ContraGrp_ContraTradeQty : fix_float_4 option;
    f_ContraGrp_NoContraBrokers : int option;
    f_ContraGrp_ContraTrader : string option;
    f_ContraGrp_ContraLegRefID : string option;
    f_ContraGrp_ContraBroker : string option;
    f_ContraGrp_ContraTradeTime : fix_utctimestamp option
}
;;

type fix_rg_contragrp = fix_rg_inner_contragrp list
;;

type fix_rg_inner_ordersingletradingsessions = {
    (** Specifies the number of repeating TradingSessionIDs*)
    f_OrderSingleTradingSessions_NoTradingSessions : int option;
    (** Required if NoTradingSessions is > 0.*)
    f_OrderSingleTradingSessions_TradingSessionID : string option
}
;;

type fix_rg_ordersingletradingsessions = fix_rg_inner_ordersingletradingsessions list
;;

type fix_rg_inner_marketdataincrementalrefreshmdentries = {
    (** For Options. May not be changed.*)
    f_MarketDataIncrementalRefreshMDEntries_OptAttribute : string option;
    f_MarketDataIncrementalRefreshMDEntries_MDEntryTime : fix_utctimeonly option;
    (** Space-delimited list of conditions describing a trade*)
    f_MarketDataIncrementalRefreshMDEntries_TradeCondition : fix_tradecondition option;
    (** Number of entries following.*)
    f_MarketDataIncrementalRefreshMDEntries_NoMDEntries : int option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_MarketDataIncrementalRefreshMDEntries_EncodedIssuerLen : int option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_MarketDataIncrementalRefreshMDEntries_EncodedSecurityDescLen : int option;
    (** Display position of a bid or offer, numbered from most competitive to least competitive, per market side, beginning with 1*)
    f_MarketDataIncrementalRefreshMDEntries_MDEntryPositionNo : int option;
    f_MarketDataIncrementalRefreshMDEntries_SellerDays : int option;
    (** For Options. May not be changed.*)
    f_MarketDataIncrementalRefreshMDEntries_PutOrCall : fix_putorcall option;
    f_MarketDataIncrementalRefreshMDEntries_CorporateAction : fix_corporateaction option;
    (** Can be used in conjunction with MaturityMonthYear to specify a particular maturity date. May not be changed.*)
    f_MarketDataIncrementalRefreshMDEntries_MaturityDay : int option;
    (** Must be specified if a Future or Option. If a Future: Symbol, SecurityType, and MaturityMonthYear are required. If an Option: Symbol, SecurityType, MaturityMonthYear, PutOrCall, and StrikePrice are required. May not be changed.*)
    f_MarketDataIncrementalRefreshMDEntries_SecurityType : fix_securitytype option;
    (** For optional use when this Bid or Offer represents an order*)
    f_MarketDataIncrementalRefreshMDEntries_MinQty : fix_float_4 option;
    (** For optional use when this Bid or Offer represents an order. ExpireDate and ExpireTime cannot both be specified in one Market Data Entry.*)
    f_MarketDataIncrementalRefreshMDEntries_ExpireDate : fix_localmktdate option;
    (** Must be first field in this repeating group.*)
    f_MarketDataIncrementalRefreshMDEntries_MDUpdateAction : fix_mdupdateaction option;
    (** Either Symbol or MDEntryRefID must be specified if MDUpdateAction = New(0) for the first Market Data Entry in a message. For subsequent Market Data Entries where MDUpdateAction = New(0), the default is the instrument used in the previous Market Data Entry if neither Symbol nor MDEntryRefID are specified, or in the case of options and futures, the previous instrument with changes specified in MaturityMonthYear, MaturityDay, PutOrCall, StrikePrice, OptAttribute, and SecurityExchange. May not be changed.*)
    f_MarketDataIncrementalRefreshMDEntries_Symbol : string option;
    f_MarketDataIncrementalRefreshMDEntries_MDEntryDate : fix_utcdateonly option;
    f_MarketDataIncrementalRefreshMDEntries_FinancialStatus : fix_financialstatus option;
    (** For optional use when this Bid, Offer, or Trade represents an order*)
    f_MarketDataIncrementalRefreshMDEntries_OrderID : string option;
    (** If MDUpdateAction = New(0), for the first Market Data Entry in a message, either this field or a Symbol must be specified. If MDUpdateAction = Change(1), this must refer to a previous MDEntryID.*)
    f_MarketDataIncrementalRefreshMDEntries_MDEntryRefID : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_MarketDataIncrementalRefreshMDEntries_EncodedTextLen : int option;
    (** For optional use in reporting Trades*)
    f_MarketDataIncrementalRefreshMDEntries_MDEntryBuyer : string option;
    (** For optional use when this Bid or Offer represents an order*)
    f_MarketDataIncrementalRefreshMDEntries_TimeInForce : fix_timeinforce option;
    (** May not be changed.*)
    f_MarketDataIncrementalRefreshMDEntries_SecurityID : string option;
    (** Can contain multiple instructions, space delimited.*)
    f_MarketDataIncrementalRefreshMDEntries_ExecInst : fix_execinst option;
    (** Can be used to identify the security. May not be changed.*)
    f_MarketDataIncrementalRefreshMDEntries_SecurityExchange : fix_exchange option;
    (** Conditionally required if MDUpdateAction = New(0). Cannot be changed.*)
    f_MarketDataIncrementalRefreshMDEntries_MDEntryType : fix_mdentrytype option;
    (** May not be changed.*)
    f_MarketDataIncrementalRefreshMDEntries_SecurityDesc : string option;
    (** For Fixed Income.*)
    f_MarketDataIncrementalRefreshMDEntries_CouponRate : fix_float option;
    (** Market posting quote / trade. Valid values:
     See Appendix C*)
    f_MarketDataIncrementalRefreshMDEntries_MDMkt : fix_exchange option;
    (** For Options. May not be changed.*)
    f_MarketDataIncrementalRefreshMDEntries_StrikePrice : fix_float_4 option;
    (** Text to describe the Market Data Entry. Part of repeating group.*)
    f_MarketDataIncrementalRefreshMDEntries_Text : string option;
    (** Total volume traded in this trading session for this security.*)
    f_MarketDataIncrementalRefreshMDEntries_TotalVolumeTraded : fix_float_4 option;
    (** Used if MDEntryType = Opening Price(4), Closing Price(5), or Settlement Price(6).*)
    f_MarketDataIncrementalRefreshMDEntries_OpenCloseSettleFlag : fix_openclosesettleflag option;
    (** In an Aggregated Book, used to show how many individual orders make up an MDEntry*)
    f_MarketDataIncrementalRefreshMDEntries_NumberOfOrders : int option;
    (** For optional use in reporting Trades*)
    f_MarketDataIncrementalRefreshMDEntries_MDEntrySeller : string option;
    (** If specified, must be unique among currently active entries if MDUpdateAction = New (0), must be the same as a previous MDEntryID if MDUpdateAction = Delete (2), and must be the same as a previous MDEntryID if MDUpdateAction = Change (1) and MDEntryRefID is not specified, or must be unique among currently active entries if MDUpdateAction = Change(1) and MDEntryRefID is specified..*)
    f_MarketDataIncrementalRefreshMDEntries_MDEntryID : string option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_MarketDataIncrementalRefreshMDEntries_ContractMultiplier : fix_float option;
    (** For optional use when this Bid or Offer represents an order. ExpireDate and ExpireTime cannot both be specified in one Market Data Entry.*)
    f_MarketDataIncrementalRefreshMDEntries_ExpireTime : fix_utctimestamp option;
    (** If MDUpdateAction = Delete(2), can be used to specify a reason for the deletion.*)
    f_MarketDataIncrementalRefreshMDEntries_DeleteReason : fix_deletereason option;
    (** May not be changed.*)
    f_MarketDataIncrementalRefreshMDEntries_SymbolSfx : string option;
    (** Conditionally required when MDUpdateAction = New(0).*)
    f_MarketDataIncrementalRefreshMDEntries_MDEntryPx : fix_float_4 option;
    (** May not be changed.*)
    f_MarketDataIncrementalRefreshMDEntries_Issuer : string option;
    (** Specifiesthe month and year of maturity. Required if MaturityDay is specified. May not be changed.*)
    f_MarketDataIncrementalRefreshMDEntries_MaturityMonthYear : fix_monthyear option;
    (** May not be changed.*)
    f_MarketDataIncrementalRefreshMDEntries_IDSource : fix_idsource option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_MarketDataIncrementalRefreshMDEntries_EncodedText : string option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_MarketDataIncrementalRefreshMDEntries_EncodedIssuer : string option;
    f_MarketDataIncrementalRefreshMDEntries_TradingSessionID : string option;
    (** Conditionally required when MDUpdateAction = New(0) andMDEntryType = Bid(0), Offer(1), or Trade(2).*)
    f_MarketDataIncrementalRefreshMDEntries_MDEntrySize : fix_float_4 option;
    f_MarketDataIncrementalRefreshMDEntries_TickDirection : fix_tickdirection option;
    (** Space-delimited list of conditions describing a quote.*)
    f_MarketDataIncrementalRefreshMDEntries_QuoteCondition : fix_quotecondition option;
    f_MarketDataIncrementalRefreshMDEntries_MDEntryOriginator : string option;
    (** Can be used to specify the currency of the quoted price.*)
    f_MarketDataIncrementalRefreshMDEntries_Currency : fix_currency option;
    f_MarketDataIncrementalRefreshMDEntries_LocationID : string option;
    (** For optional use when this Bid, Offer, or Trade represents a quote*)
    f_MarketDataIncrementalRefreshMDEntries_QuoteEntryID : string option;
    f_MarketDataIncrementalRefreshMDEntries_DeskID : string option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_MarketDataIncrementalRefreshMDEntries_EncodedSecurityDesc : string option
}
;;

type fix_rg_marketdataincrementalrefreshmdentries = fix_rg_inner_marketdataincrementalrefreshmdentries list
;;

type fix_rg_inner_marketdatasnapshotfullrefreshmdentries = {
    (** Market posting quote / trade. Valid values:
     See Appendix C*)
    f_MarketDataSnapshotFullRefreshMDEntries_MDMkt : fix_exchange option;
    (** Text to describe the Market Data Entry. Part of repeating group.*)
    f_MarketDataSnapshotFullRefreshMDEntries_Text : string option;
    f_MarketDataSnapshotFullRefreshMDEntries_MDEntryTime : fix_utctimeonly option;
    (** Space-delimited list of conditions describing a trade*)
    f_MarketDataSnapshotFullRefreshMDEntries_TradeCondition : fix_tradecondition option;
    (** Number of entries following.*)
    f_MarketDataSnapshotFullRefreshMDEntries_NoMDEntries : int option;
    (** Used if MDEntryType = Opening Price(4), Closing Price(5), or Settlement Price(6).*)
    f_MarketDataSnapshotFullRefreshMDEntries_OpenCloseSettleFlag : fix_openclosesettleflag option;
    (** In an Aggregated Book, used to show how many individual orders make up an MDEntry*)
    f_MarketDataSnapshotFullRefreshMDEntries_NumberOfOrders : int option;
    (** For optional use in reporting Trades*)
    f_MarketDataSnapshotFullRefreshMDEntries_MDEntrySeller : string option;
    (** Display position of a bid or offer, numbered from most competitive to least competitive, per market side, beginning with 1*)
    f_MarketDataSnapshotFullRefreshMDEntries_MDEntryPositionNo : int option;
    f_MarketDataSnapshotFullRefreshMDEntries_SellerDays : int option;
    (** For optional use when this Bid or Offer represents an order. ExpireDate and ExpireTime cannot both be specified in one Market Data Entry.*)
    f_MarketDataSnapshotFullRefreshMDEntries_ExpireTime : fix_utctimestamp option;
    f_MarketDataSnapshotFullRefreshMDEntries_MDEntryPx : fix_float_4 option;
    (** For optional use when this Bid or Offer represents an order*)
    f_MarketDataSnapshotFullRefreshMDEntries_MinQty : fix_float_4 option;
    (** For optional use when this Bid or Offer represents an order. ExpireDate and ExpireTime cannot both be specified in one Market Data Entry.*)
    f_MarketDataSnapshotFullRefreshMDEntries_ExpireDate : fix_localmktdate option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_MarketDataSnapshotFullRefreshMDEntries_EncodedText : string option;
    f_MarketDataSnapshotFullRefreshMDEntries_MDEntryDate : fix_utcdateonly option;
    f_MarketDataSnapshotFullRefreshMDEntries_TradingSessionID : string option;
    (** For optional use when this Bid, Offer, or Trade represents an order*)
    f_MarketDataSnapshotFullRefreshMDEntries_OrderID : string option;
    (** Conditionally required if MDEntryType = Bid(0), Offer(1), or Trade(2)*)
    f_MarketDataSnapshotFullRefreshMDEntries_MDEntrySize : fix_float_4 option;
    f_MarketDataSnapshotFullRefreshMDEntries_TickDirection : fix_tickdirection option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_MarketDataSnapshotFullRefreshMDEntries_EncodedTextLen : int option;
    (** For optional use in reporting Trades*)
    f_MarketDataSnapshotFullRefreshMDEntries_MDEntryBuyer : string option;
    (** Space-delimited list of conditions describing a quote.*)
    f_MarketDataSnapshotFullRefreshMDEntries_QuoteCondition : fix_quotecondition option;
    f_MarketDataSnapshotFullRefreshMDEntries_MDEntryOriginator : string option;
    (** Can be used to specify the currency of the quoted price.*)
    f_MarketDataSnapshotFullRefreshMDEntries_Currency : fix_currency option;
    (** For optional use when this Bid or Offer represents an order*)
    f_MarketDataSnapshotFullRefreshMDEntries_TimeInForce : fix_timeinforce option;
    f_MarketDataSnapshotFullRefreshMDEntries_LocationID : string option;
    (** For optional use when this Bid, Offer, or Trade represents a quote*)
    f_MarketDataSnapshotFullRefreshMDEntries_QuoteEntryID : string option;
    (** Can contain multiple instructions, space delimited.*)
    f_MarketDataSnapshotFullRefreshMDEntries_ExecInst : fix_execinst option;
    f_MarketDataSnapshotFullRefreshMDEntries_DeskID : string option;
    (** Must be the first field in this repeating group.*)
    f_MarketDataSnapshotFullRefreshMDEntries_MDEntryType : fix_mdentrytype option
}
;;

type fix_rg_marketdatasnapshotfullrefreshmdentries = fix_rg_inner_marketdatasnapshotfullrefreshmdentries list
;;

type fix_rg_inner_legsecaltidgrp = {
    f_LegSecAltIDGrp_LegSecurityAltID : string option;
    f_LegSecAltIDGrp_LegSecurityAltIDSource : string option;
    f_LegSecAltIDGrp_NoLegSecurityAltID : int option
}
;;

type fix_rg_legsecaltidgrp = fix_rg_inner_legsecaltidgrp list
;;

type fix_instrumentleg = {
    (** Specific to the <InstrumentLeg> (not in <Instrument>)*)
    f_InstrumentLeg_LegSide : string option;
    f_InstrumentLeg_LegSymbol : string option;
    f_InstrumentLeg_LegIssuer : string option;
    f_InstrumentLeg_LegCFICode : string option;
    (** (Deprecated, use YieldRedemptionDate (696) in <YieldData> component block)*)
    f_InstrumentLeg_LegRedemptionDate : fix_localmktdate option;
    f_InstrumentLeg_LegDatedDate : fix_localmktdate option;
    f_InstrumentLeg_LegContractSettlMonth : fix_monthyear option;
    f_InstrumentLeg_LegIssueDate : fix_localmktdate option;
    f_InstrumentLeg_LegSecurityExchange : fix_exchange option;
    (** Identifies MBS / ABS pool*)
    f_InstrumentLeg_LegPool : string option;
    f_InstrumentLeg_LegLocaleOfIssue : string option;
    f_InstrumentLeg_LegInterestAccrualDate : fix_localmktdate option;
    f_InstrumentLeg_LegSecuritySubType : string option;
    f_InstrumentLeg_LegSecurityDesc : string option;
    f_InstrumentLeg_EncodedLegSecurityDescLen : int option;
    f_InstrumentLeg_LegSecurityType : string option;
    f_InstrumentLeg_LegContractMultiplier : fix_float option;
    f_InstrumentLeg_LegSecurityIDSource : string option;
    f_InstrumentLeg_LegInstrRegistry : string option;
    f_InstrumentLeg_LegStrikeCurrency : fix_currency option;
    f_InstrumentLeg_EncodedLegIssuer : string option;
    (** (Deprecated, not applicable/used for Repos)*)
    f_InstrumentLeg_LegRepoCollateralSecurityType : string option;
    f_InstrumentLeg_LegStateOrProvinceOfIssue : string option;
    (** Specific to the <InstrumentLeg> (not in <Instrument>)*)
    f_InstrumentLeg_LegRatioQty : fix_float option;
    f_InstrumentLeg_LegOptAttribute : string option;
    f_InstrumentLeg_LegSecurityID : string option;
    f_InstrumentLeg_LegProduct : int option;
    f_InstrumentLeg_LegCreditRating : string option;
    f_InstrumentLeg_LegSymbolSfx : string option;
    f_InstrumentLeg_EncodedLegIssuerLen : int option;
    f_InstrumentLeg_LegCountryOfIssue : fix_country option;
    f_InstrumentLeg_LegCouponPaymentDate : fix_localmktdate option;
    (** (Deprecated, not applicable/used for Repos)*)
    f_InstrumentLeg_LegRepurchaseRate : fix_float_4 option;
    f_InstrumentLeg_EncodedLegSecurityDesc : string option;
    (** Specific to the <InstrumentLeg> (not in <Instrument>)*)
    f_InstrumentLeg_LegCurrency : fix_currency option;
    f_InstrumentLeg_LegCouponRate : fix_float_4 option;
    f_InstrumentLeg_LegMaturityMonthYear : fix_monthyear option;
    f_InstrumentLeg_LegMaturityDate : fix_localmktdate option;
    f_InstrumentLeg_LegStrikePrice : fix_float_4 option;
    f_InstrumentLeg_LegSecAltIDGrp : fix_rg_legsecaltidgrp;
    f_InstrumentLeg_LegFactor : fix_float option;
    (** (Deprecated, not applicable/used for Repos)*)
    f_InstrumentLeg_LegRepurchaseTerm : int option
}
;;

type fix_rg_inner_parties = {
    (** Used to identify class source of PartyID value (e.g. BIC). Required if PartyID is specified. Required if NoPartyIDs > 0.*)
    f_Parties_PartyIDSource : fix_partyidsource option;
    f_Parties_PartyRoleQualifier : fix_partyrolequalifier option;
    (** Repeating group of Party sub-identifiers.*)
    f_Parties_PtysSubGrp : fix_rg_ptyssubgrp;
    (** Used to identify source of PartyID. Required if PartyIDSource is specified. Required if NoPartyIDs > 0.*)
    f_Parties_PartyID : string option;
    (** Identifies the type of PartyID (e.g. Executing Broker). Required if NoPartyIDs > 0.*)
    f_Parties_PartyRole : fix_partyrole option;
    (** Repeating group below should contain unique combinations of PartyID, PartyIDSource, and PartyRole*)
    f_Parties_NoPartyIDs : int option
}
;;

type fix_rg_parties = fix_rg_inner_parties list
;;

type fix_rg_inner_nestedparties = {
    (** Repeating group of NestedParty sub-identifiers.*)
    f_NestedParties_NstdPtysSubGrp : fix_rg_nstdptyssubgrp;
    (** Repeating group below should contain unique combinations of NestedPartyID, NestedPartyIDSource, and NestedPartyRole*)
    f_NestedParties_NoNestedPartyIDs : int option;
    (** Used to identify source of NestedPartyID. Required if NestedPartyIDSource is specified. Required if NoNestedPartyIDs > 0.*)
    f_NestedParties_NestedPartyID : string option;
    (** Identifies the type of NestedPartyID (e.g. Executing Broker). Required if NoNestedPartyIDs > 0.*)
    f_NestedParties_NestedPartyRole : int option;
    (** Used to identify class source of NestedPartyID value (e.g. BIC). Required if NestedPartyID is specified. Required if NoNestedPartyIDs > 0.*)
    f_NestedParties_NestedPartyIDSource : string option
}
;;

type fix_rg_nestedparties = fix_rg_inner_nestedparties list
;;

type fix_instrumentextension = {
    (** Number of repeating InstrAttrib group entries.*)
    f_InstrumentExtension_AttrbGrp : fix_rg_attrbgrp;
    (** Percent at risk due to lowest possible call.*)
    f_InstrumentExtension_PctAtRisk : fix_float_4 option;
    (** Identifies the form of delivery.*)
    f_InstrumentExtension_DeliveryForm : fix_deliveryform option
}
;;

type fix_rg_inner_nestedparties2 = {
    (** Identifies the type of Nested2PartyID (e.g. Executing Broker). Required if NoNested2PartyIDs > 0.*)
    f_NestedParties2_Nested2PartyRole : int option;
    (** Repeating group of Nested2Party sub-identifiers.*)
    f_NestedParties2_NstdPtys2SubGrp : fix_rg_nstdptys2subgrp;
    (** Repeating group below should contain unique combinations of Nested2PartyID, Nested2PartyIDSource, and Nested2PartyRole*)
    f_NestedParties2_NoNested2PartyIDs : int option;
    (** Used to identify class source of Nested2PartyID value (e.g. BIC). Required if Nested2PartyID is specified. Required if NoNested2PartyIDs > 0.*)
    f_NestedParties2_Nested2PartyIDSource : string option;
    (** Used to identify source of Nested2PartyID. Required if Nested2PartyIDSource is specified. Required if NoNested2PartyIDs > 0.*)
    f_NestedParties2_Nested2PartyID : string option
}
;;

type fix_rg_nestedparties2 = fix_rg_inner_nestedparties2 list
;;

type fix_rg_inner_bidcomprspgrp = {
    f_BidCompRspGrp_FairValue : fix_float_4 option;
    f_BidCompRspGrp_EncodedText : string option;
    f_BidCompRspGrp_TradingSessionID : string option;
    f_BidCompRspGrp_Text : string option;
    f_BidCompRspGrp_NetGrossInd : fix_netgrossind option;
    f_BidCompRspGrp_Side : fix_side option;
    f_BidCompRspGrp_TradingSessionSubID : string option;
    f_BidCompRspGrp_EncodedTextLen : int option;
    f_BidCompRspGrp_NoBidComponents : int option;
    f_BidCompRspGrp_Price : fix_float_4 option;
    f_BidCompRspGrp_ListID : string option;
    f_BidCompRspGrp_SettlType : fix_settltype option;
    f_BidCompRspGrp_SettlDate : fix_localmktdate option;
    f_BidCompRspGrp_Country : fix_country option;
    f_BidCompRspGrp_PriceType : fix_pricetype option;
    f_BidCompRspGrp_CommissionData : fix_commissiondata
}
;;

type fix_rg_bidcomprspgrp = fix_rg_inner_bidcomprspgrp list
;;

type fix_underlyinginstrument = {
    f_UnderlyingInstrument_UnderlyingProduct : int option;
    (** Specific to the <UnderlyingInstrument> (not in <Instrument>)
     Currency value attributed to this collateral at the start of the agreement*)
    f_UnderlyingInstrument_UnderlyingStartValue : fix_float_4 option;
    f_UnderlyingInstrument_UnderlyingCPProgram : string option;
    (** Specific to the <UnderlyingInstrument> (not in <Instrument>)
     Unit amount of the underlying security (par, shares, currency, etc.)*)
    f_UnderlyingInstrument_UnderlyingQty : fix_float_4 option;
    (** Specific to the <UnderlyingInstrument> (not in <Instrument>)
     Currency value currently attributed to this collateral*)
    f_UnderlyingInstrument_UnderlyingCurrentValue : fix_float_4 option;
    (** Specific to the <UnderlyingInstrument> (not in <Instrument>)*)
    f_UnderlyingInstrument_UnderlyingCurrency : fix_currency option;
    (** Specific to the <UnderlyingInstrument> (not in <Instrument>)
     In a financing deal clean price (percent-of-par or per unit) of the underlying security or basket.*)
    f_UnderlyingInstrument_UnderlyingPx : fix_float_4 option;
    f_UnderlyingInstrument_UnderlyingSecurityType : string option;
    f_UnderlyingInstrument_UnderlyingFactor : fix_float option;
    f_UnderlyingInstrument_UnderlyingCountryOfIssue : fix_country option;
    f_UnderlyingInstrument_UnderlyingSecurityID : string option;
    f_UnderlyingInstrument_UnderlyingInstrRegistry : string option;
    f_UnderlyingInstrument_UnderlyingContractMultiplier : fix_float option;
    f_UnderlyingInstrument_UnderlyingSymbolSfx : string option;
    (** Specific to the <UnderlyingInstrument> (not in <Instrument>)
     In a financing deal price (percent-of-par or per unit) of the underlying security or basket at the end of the agreement.*)
    f_UnderlyingInstrument_UnderlyingEndPrice : fix_float_4 option;
    f_UnderlyingInstrument_UndSecAltIDGrp : fix_rg_undsecaltidgrp;
    f_UnderlyingInstrument_UnderlyingSecuritySubType : string option;
    f_UnderlyingInstrument_EncodedUnderlyingIssuerLen : int option;
    f_UnderlyingInstrument_UnderlyingIssuer : string option;
    f_UnderlyingInstrument_UnderlyingStrikePrice : fix_float_4 option;
    (** Specific to the <UnderlyingInstrument> (not in <Instrument>)
     Currency value attributed to this collateral at the end of the agreement*)
    f_UnderlyingInstrument_UnderlyingEndValue : fix_float_4 option;
    f_UnderlyingInstrument_UnderlyingSymbol : string option;
    f_UnderlyingInstrument_UnderlyingMaturityDate : fix_localmktdate option;
    f_UnderlyingInstrument_UnderlyingOptAttribute : string option;
    f_UnderlyingInstrument_UnderlyingSecurityIDSource : string option;
    f_UnderlyingInstrument_UnderlyingStateOrProvinceOfIssue : string option;
    (** (Deprecated, use YieldRedemptionDate (696) in <YieldData> component block)*)
    f_UnderlyingInstrument_UnderlyingRedemptionDate : fix_localmktdate option;
    f_UnderlyingInstrument_EncodedUnderlyingIssuer : string option;
    f_UnderlyingInstrument_UnderlyingMaturityMonthYear : fix_monthyear option;
    f_UnderlyingInstrument_UnderlyingStrikeCurrency : fix_currency option;
    f_UnderlyingInstrument_UnderlyingCouponPaymentDate : fix_localmktdate option;
    f_UnderlyingInstrument_UnderlyingCouponRate : fix_float_4 option;
    f_UnderlyingInstrument_UnderlyingCreditRating : string option;
    f_UnderlyingInstrument_UnderlyingSecurityExchange : fix_exchange option;
    (** Specific to the <UnderlyingInstrument> (not in <Instrument>)
     Insert here the contents of the <UnderlyingStipulations> Component Block*)
    f_UnderlyingInstrument_UnderlyingStipulations : fix_rg_underlyingstipulations;
    f_UnderlyingInstrument_UnderlyingIssueDate : fix_localmktdate option;
    (** (Deprecated, not applicable/used for Repos)*)
    f_UnderlyingInstrument_UnderlyingRepurchaseRate : fix_float_4 option;
    f_UnderlyingInstrument_UnderlyingCFICode : string option;
    f_UnderlyingInstrument_EncodedUnderlyingSecurityDescLen : int option;
    (** Specific to the <UnderlyingInstrument> (not in <Instrument>)
     In a financing deal price (percent-of-par or per unit) of the underlying security or basket. "Dirty" means it includes accrued interest*)
    f_UnderlyingInstrument_UnderlyingDirtyPrice : fix_float_4 option;
    (** (Deprecated, not applicable/used for Repos)*)
    f_UnderlyingInstrument_UnderlyingRepoCollateralSecurityType : string option;
    f_UnderlyingInstrument_UnderlyingLocaleOfIssue : string option;
    f_UnderlyingInstrument_UnderlyingSecurityDesc : string option;
    f_UnderlyingInstrument_EncodedUnderlyingSecurityDesc : string option;
    f_UnderlyingInstrument_UnderlyingCPRegType : string option;
    (** (Deprecated, not applicable/used for Repos)*)
    f_UnderlyingInstrument_UnderlyingRepurchaseTerm : int option
}
;;

type fix_rg_inner_settlparties = {
    (** Repeating group below should contain unique combinations of SettlPartyID, SettlPartyIDSource, and SettlPartyRole*)
    f_SettlParties_NoSettlPartyIDs : int option;
    (** Repeating group of SettlParty sub-identifiers.*)
    f_SettlParties_SettlPtysSubGrp : fix_rg_settlptyssubgrp;
    (** Used to identify class source of SettlPartyID value (e.g. BIC). Required if SettlPartyID is specified. Required if NoSettlPartyIDs > 0.*)
    f_SettlParties_SettlPartyIDSource : string option;
    (** Identifies the type of SettlPartyID (e.g. Executing Broker). Required if NoSettlPartyIDs > 0.*)
    f_SettlParties_SettlPartyRole : int option;
    (** Used to identify source of SettlPartyID. Required if SettlPartyIDSource is specified. Required if NoSettlPartyIDs > 0.*)
    f_SettlParties_SettlPartyID : string option
}
;;

type fix_rg_settlparties = fix_rg_inner_settlparties list
;;

type fix_instrument = {
    f_Instrument_SecurityDesc : string option;
    (** Number of repeating EventType group entries.*)
    f_Instrument_EvntGrp : fix_rg_evntgrp;
    (** For Fixed Income.*)
    f_Instrument_CouponRate : fix_float_4 option;
    (** Used for derivatives, such as options and covered warrants*)
    f_Instrument_StrikePrice : fix_float_4 option;
    f_Instrument_CreditRating : string option;
    (** Date instrument was issued. For Fixed Income IOIs for new issues, specifies the issue date.*)
    f_Instrument_IssueDate : fix_localmktdate option;
    (** Used for derivatives, such as options and covered warrants to indicate a versioning of the contract when required due to corporate actions to the underlying. Should not be used to indicate type of option - use the CFICode[461] for this purpose.*)
    f_Instrument_OptAttribute : string option;
    (** Specifies date of maturity (a full date). Note that standardized derivatives which are typically only referenced by month and year (e.g. S&P futures).may use MaturityMonthYear and/or this field.
     When using MaturityMonthYear, it is recommended that markets and sell sides report the MaturityDate on all outbound messages as a means of data enrichment.*)
    f_Instrument_MaturityDate : fix_localmktdate option;
    (** Required if SecurityID is specified.*)
    f_Instrument_SecurityIDSource : fix_securityidsource option;
    (** Number of alternate Security Identifiers*)
    f_Instrument_SecAltIDGrp : fix_rg_secaltidgrp;
    (** If different from IssueDate*)
    f_Instrument_DatedDate : fix_localmktdate option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_Instrument_EncodedIssuerLen : int option;
    (** The registration type of a commercial paper issuance*)
    f_Instrument_CPRegType : string option;
    (** If different from IssueDate and DatedDate*)
    f_Instrument_InterestAccrualDate : fix_localmktdate option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_Instrument_ContractMultiplier : fix_float option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_Instrument_EncodedSecurityDescLen : int option;
    (** A two-character state or province abbreviation.*)
    f_Instrument_StateOrProvinceOfIssue : string option;
    (** (Deprecated, use YieldRedemptionDate (696) in <YieldData> component block)*)
    f_Instrument_RedemptionDate : fix_localmktdate option;
    (** (Deprecated, use UnderlyingSecurityType (310) )*)
    f_Instrument_RepoCollateralSecurityType : string option;
    (** ISO Country code of instrument issue (e.g. the country portion typically used in ISIN). Can be used in conjunction with non-ISIN SecurityID (e.g. CUSIP for Municipal Bonds without ISIN) to provide uniqueness.*)
    f_Instrument_CountryOfIssue : fix_country option;
    (** It is recommended that CFICode be used instead of SecurityType for non-Fixed Income instruments.
     Required for Fixed Income. Refer to Volume 7 - Fixed Income
     Futures and Options should be specified using the CFICode[461] field instead of SecurityType[167] (Refer to Volume 7 - Recommendations and Guidelines for Futures and Options Markets.)*)
    f_Instrument_SecurityType : fix_securitytype option;
    (** Used in Fixed Income with a value of "WI" to indicate "When Issued" for a security to be reissued under an old CUSIP or ISIN or with a value of "CD" to indicate a EUCP with lump-sum interest rather than discount price.*)
    f_Instrument_SymbolSfx : string option;
    f_Instrument_Issuer : string option;
    (** Must be present for MBS/TBA*)
    f_Instrument_ContractSettlMonth : fix_monthyear option;
    (** Specifies the month and year of maturity. Applicable for standardized derivatives which are typically only referenced by month and year (e.g. S&P futures). Note MaturityDate (a full date) can also be specified.*)
    f_Instrument_MaturityMonthYear : fix_monthyear option;
    (** Indicates the type of product the security is associated with (high-level category)*)
    f_Instrument_Product : fix_product option;
    (** Common, "human understood" representation of the security. SecurityID value can be specified if no symbol exists (e.g. non-exchange traded Collective Investment Vehicles)
     Use "[N/A]" for products which do not have a symbol.*)
    f_Instrument_Symbol : string option;
    (** Used for derivatives*)
    f_Instrument_StrikeCurrency : fix_currency option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_Instrument_EncodedIssuer : string option;
    (** Indicates the type of security using ISO 10962 standard, Classification of Financial Instruments (CFI code) values. It is recommended that CFICode be used instead of SecurityType for non-Fixed Income instruments.*)
    f_Instrument_CFICode : string option;
    (** The location at which records of ownership are maintained for this instrument, and at which ownership changes must be recorded. Can be used in conjunction with ISIN to address ISIN uniqueness issues.*)
    f_Instrument_InstrRegistry : string option;
    (** (Deprecated, use TerminationType (788) )*)
    f_Instrument_RepurchaseTerm : int option;
    (** For Fixed Income: Amortization Factor for deriving Current face from Original face for ABS or MBS securities, note the fraction may be greater than, equal to or less than 1. In TIPS securities this is the Inflation index.
     Qty * Factor * Price = Gross Trade Amount
     For Derivatives: Contract Value Factor by which price must be adjusted to determine the true nominal value of one futures/options contract.
     (Qty * Price) * Factor = Nominal Value*)
    f_Instrument_Factor : fix_float option;
    (** Date interest is to be paid. Used in identifying Corporate Bond issues.*)
    f_Instrument_CouponPaymentDate : fix_localmktdate option;
    (** The program under which a commercial paper is issued*)
    f_Instrument_CPProgram : fix_cpprogram option;
    (** Takes precedence in identifying security to counterparty over SecurityAltID block. Requires SecurityIDSource if specified.*)
    f_Instrument_SecurityID : string option;
    (** Sub-type qualification/identification of the SecurityType (e.g. for SecurityType="MLEG"). If specified, SecurityType is required.*)
    f_Instrument_SecuritySubType : string option;
    (** The three-character IATA code for a locale (e.g. airport code for Municipal Bonds).*)
    f_Instrument_LocaleOfIssue : string option;
    (** (Deprecated, use Price (44) )*)
    f_Instrument_RepurchaseRate : fix_float_4 option;
    (** Can be used to identify the security.*)
    f_Instrument_SecurityExchange : fix_exchange option;
    (** Identifies MBS / ABS pool*)
    f_Instrument_Pool : string option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_Instrument_EncodedSecurityDesc : string option
}
;;

type fix_rg_inner_nestedparties3 = {
    (** Identifies the type of Nested3PartyID (e.g. Executing Broker). Required if NoNested3PartyIDs > 0.*)
    f_NestedParties3_Nested3PartyRole : int option;
    (** Repeating group of Nested3Party sub-identifiers.*)
    f_NestedParties3_NstdPtys3SubGrp : fix_rg_nstdptys3subgrp;
    (** Used to identify class source of Nested3PartyID value (e.g. BIC). Required if Nested3PartyID is specified. Required if NoNested3PartyIDs > 0.*)
    f_NestedParties3_Nested3PartyIDSource : string option;
    (** Repeating group below should contain unique combinations of Nested3PartyID, Nested3PartyIDSource, and Nested3PartyRole*)
    f_NestedParties3_NoNested3PartyIDs : int option;
    (** Used to identify source of Nested3PartyID. Required if Nested3PartyIDSource is specified. Required if NoNested3PartyIDs > 0.*)
    f_NestedParties3_Nested3PartyID : string option
}
;;

type fix_rg_nestedparties3 = fix_rg_inner_nestedparties3 list
;;

type fix_rg_inner_preallocmleggrp = {
    f_PreAllocMlegGrp_IndividualAllocID : string option;
    f_PreAllocMlegGrp_NoAllocs : int option;
    f_PreAllocMlegGrp_AllocSettlCurrency : fix_currency option;
    f_PreAllocMlegGrp_AllocQty : fix_float_4 option;
    f_PreAllocMlegGrp_AllocAcctIDSource : int option;
    f_PreAllocMlegGrp_AllocAccount : string option;
    f_PreAllocMlegGrp_NestedParties3 : fix_rg_nestedparties3
}
;;

type fix_rg_preallocmleggrp = fix_rg_inner_preallocmleggrp list
;;

type fix_rg_inner_instrmtgrp = {
    f_InstrmtGrp_NoRelatedSym : int option;
    f_InstrmtGrp_Instrument : fix_instrument
}
;;

type fix_rg_instrmtgrp = fix_rg_inner_instrmtgrp list
;;

type fix_rg_inner_instrmtstrkpxgrp = {
    f_InstrmtStrkPxGrp_NoStrikes : int option;
    f_InstrmtStrkPxGrp_Instrument : fix_instrument
}
;;

type fix_rg_instrmtstrkpxgrp = fix_rg_inner_instrmtstrkpxgrp list
;;

type fix_rg_inner_dlvyinstgrp = {
    f_DlvyInstGrp_DlvyInstType : fix_dlvyinsttype option;
    f_DlvyInstGrp_NoDlvyInst : int option;
    f_DlvyInstGrp_SettlParties : fix_rg_settlparties;
    f_DlvyInstGrp_SettlInstSource : fix_settlinstsource option
}
;;

type fix_rg_dlvyinstgrp = fix_rg_inner_dlvyinstgrp list
;;

type fix_rg_inner_undinstrmtstrkpxgrp = {
    f_UndInstrmtStrkPxGrp_UnderlyingInstrument : fix_underlyinginstrument;
    f_UndInstrmtStrkPxGrp_Side : fix_side option;
    f_UndInstrmtStrkPxGrp_EncodedTextLen : int option;
    f_UndInstrmtStrkPxGrp_Price : fix_float_4 option;
    f_UndInstrmtStrkPxGrp_Currency : fix_currency option;
    f_UndInstrmtStrkPxGrp_EncodedText : string option;
    f_UndInstrmtStrkPxGrp_PrevClosePx : fix_float_4 option;
    f_UndInstrmtStrkPxGrp_ClOrdID : string option;
    f_UndInstrmtStrkPxGrp_NoUnderlyings : int option;
    f_UndInstrmtStrkPxGrp_Text : string option;
    f_UndInstrmtStrkPxGrp_SecondaryClOrdID : string option
}
;;

type fix_rg_undinstrmtstrkpxgrp = fix_rg_inner_undinstrmtstrkpxgrp list
;;

type fix_rg_inner_posundinstrmtgrp = {
    f_PosUndInstrmtGrp_UnderlyingSettlPriceType : int option;
    f_PosUndInstrmtGrp_UnderlyingInstrument : fix_underlyinginstrument;
    f_PosUndInstrmtGrp_NoUnderlyings : int option;
    f_PosUndInstrmtGrp_UnderlyingSettlPrice : fix_float_4 option
}
;;

type fix_rg_posundinstrmtgrp = fix_rg_inner_posundinstrmtgrp list
;;

type fix_rg_inner_undinstrmtgrp = {
    f_UndInstrmtGrp_UnderlyingInstrument : fix_underlyinginstrument;
    f_UndInstrmtGrp_NoUnderlyings : int option
}
;;

type fix_rg_undinstrmtgrp = fix_rg_inner_undinstrmtgrp list
;;

type fix_rg_inner_undinstrmtcollgrp = {
    f_UndInstrmtCollGrp_UnderlyingInstrument : fix_underlyinginstrument;
    f_UndInstrmtCollGrp_CollAction : fix_collaction option;
    f_UndInstrmtCollGrp_NoUnderlyings : int option
}
;;

type fix_rg_undinstrmtcollgrp = fix_rg_inner_undinstrmtcollgrp list
;;

type fix_rg_inner_ordallocgrp = {
    f_OrdAllocGrp_OrderBookingQty : fix_float_4 option;
    f_OrdAllocGrp_ListID : string option;
    f_OrdAllocGrp_NoOrders : int option;
    f_OrdAllocGrp_SecondaryOrderID : string option;
    f_OrdAllocGrp_ClOrdID : string option;
    f_OrdAllocGrp_OrderAvgPx : fix_float_4 option;
    f_OrdAllocGrp_NestedParties2 : fix_rg_nestedparties2;
    f_OrdAllocGrp_OrderQty : fix_float_4 option;
    f_OrdAllocGrp_SecondaryClOrdID : string option;
    f_OrdAllocGrp_OrderID : string option
}
;;

type fix_rg_ordallocgrp = fix_rg_inner_ordallocgrp list
;;

type fix_rg_inner_legpreallocgrp = {
    f_LegPreAllocGrp_LegAllocAcctIDSource : string option;
    f_LegPreAllocGrp_LegIndividualAllocID : string option;
    f_LegPreAllocGrp_LegAllocQty : fix_float_4 option;
    f_LegPreAllocGrp_NoLegAllocs : int option;
    f_LegPreAllocGrp_LegSettlCurrency : fix_currency option;
    f_LegPreAllocGrp_NestedParties2 : fix_rg_nestedparties2;
    f_LegPreAllocGrp_LegAllocAccount : string option
}
;;

type fix_rg_legpreallocgrp = fix_rg_inner_legpreallocgrp list
;;

type fix_rg_inner_trdallocgrp = {
    f_TrdAllocGrp_IndividualAllocID : string option;
    f_TrdAllocGrp_NoAllocs : int option;
    f_TrdAllocGrp_AllocSettlCurrency : fix_currency option;
    f_TrdAllocGrp_AllocQty : fix_float_4 option;
    f_TrdAllocGrp_AllocAcctIDSource : int option;
    f_TrdAllocGrp_AllocAccount : string option;
    f_TrdAllocGrp_NestedParties2 : fix_rg_nestedparties2
}
;;

type fix_rg_trdallocgrp = fix_rg_inner_trdallocgrp list
;;

type fix_rg_inner_preallocgrp = {
    f_PreAllocGrp_IndividualAllocID : string option;
    f_PreAllocGrp_NoAllocs : int option;
    f_PreAllocGrp_AllocSettlCurrency : fix_currency option;
    f_PreAllocGrp_AllocQty : fix_float_4 option;
    f_PreAllocGrp_AllocAcctIDSource : int option;
    f_PreAllocGrp_AllocAccount : string option;
    f_PreAllocGrp_NestedParties : fix_rg_nestedparties
}
;;

type fix_rg_preallocgrp = fix_rg_inner_preallocgrp list
;;

type fix_rg_inner_positionqty = {
    f_PositionQty_NoPositions : int option;
    (** Required if NoPositions > 1*)
    f_PositionQty_PosType : fix_postype option;
    f_PositionQty_ShortQty : fix_float_4 option;
    f_PositionQty_LongQty : fix_float_4 option;
    f_PositionQty_PosQtyStatus : fix_posqtystatus option;
    (** Optional repeating group - used to associate or distribute position to a specific party other than the party that currently owns the position.*)
    f_PositionQty_NestedParties : fix_rg_nestedparties
}
;;

type fix_rg_positionqty = fix_rg_inner_positionqty list
;;

type fix_rg_inner_rgstdtlsgrp = {
    f_RgstDtlsGrp_RegistDtls : string option;
    f_RgstDtlsGrp_OwnerType : fix_ownertype option;
    f_RgstDtlsGrp_DateOfBirth : fix_localmktdate option;
    f_RgstDtlsGrp_RegistEmail : string option;
    f_RgstDtlsGrp_NoRegistDtls : int option;
    f_RgstDtlsGrp_InvestorCountryOfResidence : fix_country option;
    f_RgstDtlsGrp_MailingDtls : string option;
    f_RgstDtlsGrp_NestedParties : fix_rg_nestedparties;
    f_RgstDtlsGrp_MailingInst : string option
}
;;

type fix_rg_rgstdtlsgrp = fix_rg_inner_rgstdtlsgrp list
;;

type fix_rg_inner_sidecrossordcxlgrp = {
    f_SideCrossOrdCxlGrp_OrderQtyData : fix_orderqtydata;
    f_SideCrossOrdCxlGrp_EncodedText : string option;
    f_SideCrossOrdCxlGrp_NoSides : int option;
    f_SideCrossOrdCxlGrp_ClOrdID : string option;
    f_SideCrossOrdCxlGrp_TradeOriginationDate : fix_localmktdate option;
    f_SideCrossOrdCxlGrp_Text : string option;
    f_SideCrossOrdCxlGrp_SecondaryClOrdID : string option;
    f_SideCrossOrdCxlGrp_Side : fix_side option;
    f_SideCrossOrdCxlGrp_EncodedTextLen : int option;
    f_SideCrossOrdCxlGrp_Parties : fix_rg_parties;
    f_SideCrossOrdCxlGrp_OrigOrdModTime : fix_utctimestamp option;
    f_SideCrossOrdCxlGrp_ComplianceID : string option;
    f_SideCrossOrdCxlGrp_ClOrdLinkID : string option;
    f_SideCrossOrdCxlGrp_TradeDate : fix_localmktdate option;
    f_SideCrossOrdCxlGrp_OrigClOrdID : string option
}
;;

type fix_rg_sidecrossordcxlgrp = fix_rg_inner_sidecrossordcxlgrp list
;;

type fix_rg_inner_instrmtleggrp = {
    f_InstrmtLegGrp_InstrumentLeg : fix_instrumentleg;
    f_InstrmtLegGrp_NoLegs : int option
}
;;

type fix_rg_instrmtleggrp = fix_rg_inner_instrmtleggrp list
;;

type fix_rg_inner_legquotstatgrp = {
    f_LegQuotStatGrp_LegStipulations : fix_rg_legstipulations;
    f_LegQuotStatGrp_LegQty : fix_float_4 option;
    f_LegQuotStatGrp_InstrumentLeg : fix_instrumentleg;
    f_LegQuotStatGrp_LegSettlDate : fix_localmktdate option;
    f_LegQuotStatGrp_LegSwapType : fix_legswaptype option;
    f_LegQuotStatGrp_LegSettlType : string option;
    f_LegQuotStatGrp_NestedParties : fix_rg_nestedparties;
    f_LegQuotStatGrp_NoLegs : int option
}
;;

type fix_rg_legquotstatgrp = fix_rg_inner_legquotstatgrp list
;;

type fix_rg_inner_instrmtlegioigrp = {
    f_InstrmtLegIOIGrp_LegStipulations : fix_rg_legstipulations;
    f_InstrmtLegIOIGrp_LegIOIQty : string option;
    f_InstrmtLegIOIGrp_InstrumentLeg : fix_instrumentleg;
    f_InstrmtLegIOIGrp_NoLegs : int option
}
;;

type fix_rg_instrmtlegioigrp = fix_rg_inner_instrmtlegioigrp list
;;

type fix_rg_inner_instrmtlegexecgrp = {
    f_InstrmtLegExecGrp_LegStipulations : fix_rg_legstipulations;
    f_InstrmtLegExecGrp_LegQty : fix_float_4 option;
    f_InstrmtLegExecGrp_LegPositionEffect : string option;
    f_InstrmtLegExecGrp_LegSettlType : string option;
    f_InstrmtLegExecGrp_LegLastPx : fix_float_4 option;
    f_InstrmtLegExecGrp_LegPrice : fix_float_4 option;
    f_InstrmtLegExecGrp_InstrumentLeg : fix_instrumentleg;
    f_InstrmtLegExecGrp_LegRefID : string option;
    f_InstrmtLegExecGrp_LegSettlDate : fix_localmktdate option;
    f_InstrmtLegExecGrp_LegSwapType : fix_legswaptype option;
    f_InstrmtLegExecGrp_NestedParties : fix_rg_nestedparties;
    f_InstrmtLegExecGrp_LegCoveredOrUncovered : int option;
    f_InstrmtLegExecGrp_NoLegs : int option
}
;;

type fix_rg_instrmtlegexecgrp = fix_rg_inner_instrmtlegexecgrp list
;;

type fix_rg_inner_instrmtlegseclistgrp = {
    f_InstrmtLegSecListGrp_LegBenchmarkCurveData : fix_legbenchmarkcurvedata;
    f_InstrmtLegSecListGrp_LegStipulations : fix_rg_legstipulations;
    f_InstrmtLegSecListGrp_InstrumentLeg : fix_instrumentleg;
    f_InstrmtLegSecListGrp_LegSwapType : fix_legswaptype option;
    f_InstrmtLegSecListGrp_LegSettlType : string option;
    f_InstrmtLegSecListGrp_NoLegs : int option
}
;;

type fix_rg_instrmtlegseclistgrp = fix_rg_inner_instrmtlegseclistgrp list
;;

type fix_rg_inner_legquotgrp = {
    f_LegQuotGrp_LegBenchmarkCurveData : fix_legbenchmarkcurvedata;
    f_LegQuotGrp_LegStipulations : fix_rg_legstipulations;
    f_LegQuotGrp_LegBidPx : fix_float_4 option;
    f_LegQuotGrp_LegPriceType : int option;
    f_LegQuotGrp_LegQty : fix_float_4 option;
    f_LegQuotGrp_InstrumentLeg : fix_instrumentleg;
    f_LegQuotGrp_LegSettlDate : fix_localmktdate option;
    f_LegQuotGrp_LegOfferPx : fix_float_4 option;
    f_LegQuotGrp_LegSwapType : fix_legswaptype option;
    f_LegQuotGrp_LegSettlType : string option;
    f_LegQuotGrp_NestedParties : fix_rg_nestedparties;
    f_LegQuotGrp_NoLegs : int option
}
;;

type fix_rg_legquotgrp = fix_rg_inner_legquotgrp list
;;

type fix_rg_inner_trdinstrmtleggrp = {
    f_TrdInstrmtLegGrp_LegStipulations : fix_rg_legstipulations;
    f_TrdInstrmtLegGrp_LegQty : fix_float_4 option;
    f_TrdInstrmtLegGrp_LegPositionEffect : string option;
    f_TrdInstrmtLegGrp_LegSettlType : string option;
    f_TrdInstrmtLegGrp_LegLastPx : fix_float_4 option;
    f_TrdInstrmtLegGrp_LegPrice : fix_float_4 option;
    f_TrdInstrmtLegGrp_InstrumentLeg : fix_instrumentleg;
    f_TrdInstrmtLegGrp_LegRefID : string option;
    f_TrdInstrmtLegGrp_LegSettlDate : fix_localmktdate option;
    f_TrdInstrmtLegGrp_LegSwapType : fix_legswaptype option;
    f_TrdInstrmtLegGrp_NestedParties : fix_rg_nestedparties;
    f_TrdInstrmtLegGrp_LegCoveredOrUncovered : int option;
    f_TrdInstrmtLegGrp_NoLegs : int option
}
;;

type fix_rg_trdinstrmtleggrp = fix_rg_inner_trdinstrmtleggrp list
;;

type fix_rg_inner_quotreqlegsgrp = {
    f_QuotReqLegsGrp_LegBenchmarkCurveData : fix_legbenchmarkcurvedata;
    f_QuotReqLegsGrp_LegStipulations : fix_rg_legstipulations;
    f_QuotReqLegsGrp_LegQty : fix_float_4 option;
    f_QuotReqLegsGrp_InstrumentLeg : fix_instrumentleg;
    f_QuotReqLegsGrp_LegSettlDate : fix_localmktdate option;
    f_QuotReqLegsGrp_LegSwapType : fix_legswaptype option;
    f_QuotReqLegsGrp_LegSettlType : string option;
    f_QuotReqLegsGrp_NestedParties : fix_rg_nestedparties;
    f_QuotReqLegsGrp_NoLegs : int option
}
;;

type fix_rg_quotreqlegsgrp = fix_rg_inner_quotreqlegsgrp list
;;

type fix_rg_inner_relsymderivsecgrp = {
    f_RelSymDerivSecGrp_TradingSessionSubID : string option;
    f_RelSymDerivSecGrp_ExpirationCycle : fix_expirationcycle option;
    f_RelSymDerivSecGrp_EncodedTextLen : int option;
    f_RelSymDerivSecGrp_Currency : fix_currency option;
    f_RelSymDerivSecGrp_NoRelatedSym : int option;
    f_RelSymDerivSecGrp_EncodedText : string option;
    f_RelSymDerivSecGrp_InstrmtLegGrp : fix_rg_instrmtleggrp;
    f_RelSymDerivSecGrp_Instrument : fix_instrument;
    f_RelSymDerivSecGrp_TradingSessionID : string option;
    f_RelSymDerivSecGrp_Text : string option;
    f_RelSymDerivSecGrp_InstrumentExtension : fix_instrumentextension
}
;;

type fix_rg_relsymderivsecgrp = fix_rg_inner_relsymderivsecgrp list
;;

type fix_rg_inner_quotentryackgrp = {
    f_QuotEntryAckGrp_MidYield : fix_float_4 option;
    f_QuotEntryAckGrp_MidPx : fix_float_4 option;
    f_QuotEntryAckGrp_ValidUntilTime : fix_utctimestamp option;
    f_QuotEntryAckGrp_OrdType : fix_ordtype option;
    f_QuotEntryAckGrp_BidForwardPoints2 : fix_float_4 option;
    f_QuotEntryAckGrp_OfferSpotRate : fix_float_4 option;
    f_QuotEntryAckGrp_OfferYield : fix_float_4 option;
    f_QuotEntryAckGrp_BidForwardPoints : fix_float_4 option;
    f_QuotEntryAckGrp_TradingSessionSubID : string option;
    f_QuotEntryAckGrp_Instrument : fix_instrument;
    f_QuotEntryAckGrp_BidSpotRate : fix_float_4 option;
    f_QuotEntryAckGrp_OfferPx : fix_float_4 option;
    f_QuotEntryAckGrp_OfferSize : fix_float_4 option;
    f_QuotEntryAckGrp_TradingSessionID : string option;
    f_QuotEntryAckGrp_SettlDate2 : fix_localmktdate option;
    f_QuotEntryAckGrp_BidSize : fix_float_4 option;
    f_QuotEntryAckGrp_TransactTime : fix_utctimestamp option;
    f_QuotEntryAckGrp_QuoteEntryRejectReason : int option;
    f_QuotEntryAckGrp_OrderQty2 : fix_float_4 option;
    f_QuotEntryAckGrp_Currency : fix_currency option;
    f_QuotEntryAckGrp_QuoteEntryID : string option;
    f_QuotEntryAckGrp_BidPx : fix_float_4 option;
    f_QuotEntryAckGrp_InstrmtLegGrp : fix_rg_instrmtleggrp;
    f_QuotEntryAckGrp_BidYield : fix_float_4 option;
    f_QuotEntryAckGrp_SettlDate : fix_localmktdate option;
    f_QuotEntryAckGrp_OfferForwardPoints : fix_float_4 option;
    f_QuotEntryAckGrp_OfferForwardPoints2 : fix_float_4 option;
    f_QuotEntryAckGrp_NoQuoteEntries : int option
}
;;

type fix_rg_quotentryackgrp = fix_rg_inner_quotentryackgrp list
;;

type fix_rg_inner_quotentrygrp = {
    f_QuotEntryGrp_MidYield : fix_float_4 option;
    f_QuotEntryGrp_MidPx : fix_float_4 option;
    f_QuotEntryGrp_ValidUntilTime : fix_utctimestamp option;
    f_QuotEntryGrp_OrdType : fix_ordtype option;
    f_QuotEntryGrp_BidForwardPoints2 : fix_float_4 option;
    f_QuotEntryGrp_OfferSpotRate : fix_float_4 option;
    f_QuotEntryGrp_OfferYield : fix_float_4 option;
    f_QuotEntryGrp_BidForwardPoints : fix_float_4 option;
    f_QuotEntryGrp_TradingSessionSubID : string option;
    f_QuotEntryGrp_Instrument : fix_instrument;
    f_QuotEntryGrp_BidSpotRate : fix_float_4 option;
    f_QuotEntryGrp_OfferPx : fix_float_4 option;
    f_QuotEntryGrp_OfferSize : fix_float_4 option;
    f_QuotEntryGrp_TradingSessionID : string option;
    f_QuotEntryGrp_SettlDate2 : fix_localmktdate option;
    f_QuotEntryGrp_BidSize : fix_float_4 option;
    f_QuotEntryGrp_TransactTime : fix_utctimestamp option;
    f_QuotEntryGrp_OrderQty2 : fix_float_4 option;
    f_QuotEntryGrp_Currency : fix_currency option;
    f_QuotEntryGrp_QuoteEntryID : string option;
    f_QuotEntryGrp_BidPx : fix_float_4 option;
    f_QuotEntryGrp_InstrmtLegGrp : fix_rg_instrmtleggrp;
    f_QuotEntryGrp_BidYield : fix_float_4 option;
    f_QuotEntryGrp_SettlDate : fix_localmktdate option;
    f_QuotEntryGrp_OfferForwardPoints : fix_float_4 option;
    f_QuotEntryGrp_OfferForwardPoints2 : fix_float_4 option;
    f_QuotEntryGrp_NoQuoteEntries : int option
}
;;

type fix_rg_quotentrygrp = fix_rg_inner_quotentrygrp list
;;

type fix_rg_inner_sidecrossordmodgrp = {
    f_SideCrossOrdModGrp_SolicitedFlag : fix_solicitedflag option;
    f_SideCrossOrdModGrp_OrderCapacity : fix_ordercapacity option;
    f_SideCrossOrdModGrp_CustOrderCapacity : fix_custordercapacity option;
    f_SideCrossOrdModGrp_CashMargin : fix_cashmargin option;
    f_SideCrossOrdModGrp_SideComplianceID : string option;
    f_SideCrossOrdModGrp_ClOrdID : string option;
    f_SideCrossOrdModGrp_Text : string option;
    f_SideCrossOrdModGrp_SecondaryClOrdID : string option;
    f_SideCrossOrdModGrp_AccountType : fix_accounttype option;
    f_SideCrossOrdModGrp_DayBookingInst : fix_daybookinginst option;
    f_SideCrossOrdModGrp_QtyType : fix_qtytype option;
    f_SideCrossOrdModGrp_ClearingFeeIndicator : fix_clearingfeeindicator option;
    f_SideCrossOrdModGrp_OrderRestrictions : fix_orderrestrictions option;
    f_SideCrossOrdModGrp_CoveredOrUncovered : fix_coveredoruncovered option;
    f_SideCrossOrdModGrp_CommissionData : fix_commissiondata;
    f_SideCrossOrdModGrp_Account : string option;
    f_SideCrossOrdModGrp_AcctIDSource : fix_acctidsource option;
    f_SideCrossOrdModGrp_PreallocMethod : fix_preallocmethod option;
    f_SideCrossOrdModGrp_OrderQtyData : fix_orderqtydata;
    f_SideCrossOrdModGrp_EncodedText : string option;
    f_SideCrossOrdModGrp_NoSides : int option;
    f_SideCrossOrdModGrp_TradeOriginationDate : fix_localmktdate option;
    f_SideCrossOrdModGrp_AllocID : string option;
    f_SideCrossOrdModGrp_Side : fix_side option;
    f_SideCrossOrdModGrp_EncodedTextLen : int option;
    f_SideCrossOrdModGrp_BookingUnit : fix_bookingunit option;
    f_SideCrossOrdModGrp_ForexReq : fix_forexreq option;
    f_SideCrossOrdModGrp_SettlCurrency : fix_currency option;
    f_SideCrossOrdModGrp_PositionEffect : fix_positioneffect option;
    f_SideCrossOrdModGrp_Parties : fix_rg_parties;
    f_SideCrossOrdModGrp_ClOrdLinkID : string option;
    f_SideCrossOrdModGrp_TradeDate : fix_localmktdate option;
    f_SideCrossOrdModGrp_BookingType : fix_bookingtype option;
    f_SideCrossOrdModGrp_PreAllocGrp : fix_rg_preallocgrp
}
;;

type fix_rg_sidecrossordmodgrp = fix_rg_inner_sidecrossordmodgrp list
;;

type fix_rg_inner_trdcaprptsidegrp = {
    f_TrdCapRptSideGrp_TransBkdTime : fix_utctimestamp option;
    f_TrdCapRptSideGrp_SolicitedFlag : fix_solicitedflag option;
    f_TrdCapRptSideGrp_OrderCapacity : fix_ordercapacity option;
    f_TrdCapRptSideGrp_OrdType : fix_ordtype option;
    f_TrdCapRptSideGrp_SecondaryOrderID : string option;
    f_TrdCapRptSideGrp_TradeInputSource : string option;
    f_TrdCapRptSideGrp_SecondaryClOrdID : string option;
    f_TrdCapRptSideGrp_AccountType : fix_accounttype option;
    f_TrdCapRptSideGrp_ProcessCode : fix_processcode option;
    f_TrdCapRptSideGrp_AccruedInterestAmt : fix_float_4 option;
    f_TrdCapRptSideGrp_Concession : fix_float_4 option;
    f_TrdCapRptSideGrp_Stipulations : fix_rg_stipulations;
    f_TrdCapRptSideGrp_TimeBracket : string option;
    f_TrdCapRptSideGrp_ContAmtGrp : fix_rg_contamtgrp;
    f_TrdCapRptSideGrp_CommissionData : fix_commissiondata;
    f_TrdCapRptSideGrp_OddLot : fix_oddlot option;
    f_TrdCapRptSideGrp_Account : string option;
    f_TrdCapRptSideGrp_AcctIDSource : fix_acctidsource option;
    f_TrdCapRptSideGrp_PreallocMethod : fix_preallocmethod option;
    f_TrdCapRptSideGrp_MiscFeesGrp : fix_rg_miscfeesgrp;
    f_TrdCapRptSideGrp_OrderID : string option;
    f_TrdCapRptSideGrp_Side : fix_side option;
    f_TrdCapRptSideGrp_EncodedTextLen : int option;
    f_TrdCapRptSideGrp_AccruedInterestRate : fix_float_4 option;
    f_TrdCapRptSideGrp_InterestAtMaturity : fix_float_4 option;
    f_TrdCapRptSideGrp_NetMoney : fix_float_4 option;
    f_TrdCapRptSideGrp_ComplianceID : string option;
    f_TrdCapRptSideGrp_ExDate : fix_localmktdate option;
    f_TrdCapRptSideGrp_OrderInputDevice : string option;
    f_TrdCapRptSideGrp_ExecInst : fix_execinst option;
    f_TrdCapRptSideGrp_TradeAllocIndicator : fix_tradeallocindicator option;
    f_TrdCapRptSideGrp_TotalTakedown : fix_float_4 option;
    f_TrdCapRptSideGrp_SettlCurrAmt : fix_float_4 option;
    f_TrdCapRptSideGrp_CustOrderCapacity : fix_custordercapacity option;
    f_TrdCapRptSideGrp_ClOrdID : string option;
    f_TrdCapRptSideGrp_EndCash : fix_float_4 option;
    f_TrdCapRptSideGrp_StartCash : fix_float_4 option;
    f_TrdCapRptSideGrp_Text : string option;
    f_TrdCapRptSideGrp_SideMultiLegReportingType : fix_sidemultilegreportingtype option;
    f_TrdCapRptSideGrp_TradingSessionSubID : string option;
    f_TrdCapRptSideGrp_GrossTradeAmt : fix_float_4 option;
    f_TrdCapRptSideGrp_ListID : string option;
    f_TrdCapRptSideGrp_ClrInstGrp : fix_rg_clrinstgrp;
    f_TrdCapRptSideGrp_TradeInputDevice : string option;
    f_TrdCapRptSideGrp_OrderRestrictions : fix_orderrestrictions option;
    f_TrdCapRptSideGrp_SettlCurrFxRate : fix_float option;
    f_TrdCapRptSideGrp_NumDaysInterest : int option;
    f_TrdCapRptSideGrp_SettlCurrFxRateCalc : fix_settlcurrfxratecalc option;
    f_TrdCapRptSideGrp_EncodedText : string option;
    f_TrdCapRptSideGrp_NoSides : int option;
    f_TrdCapRptSideGrp_TrdAllocGrp : fix_rg_trdallocgrp;
    f_TrdCapRptSideGrp_AllocID : string option;
    f_TrdCapRptSideGrp_TradingSessionID : string option;
    f_TrdCapRptSideGrp_EndAccruedInterestAmt : fix_float_4 option;
    f_TrdCapRptSideGrp_SettlCurrency : fix_currency option;
    f_TrdCapRptSideGrp_PositionEffect : fix_positioneffect option;
    f_TrdCapRptSideGrp_Parties : fix_rg_parties;
    f_TrdCapRptSideGrp_Currency : fix_currency option;
    f_TrdCapRptSideGrp_ExchangeRule : string option
}
;;

type fix_rg_trdcaprptsidegrp = fix_rg_inner_trdcaprptsidegrp list
;;

type fix_rg_inner_legordgrp = {
    f_LegOrdGrp_LegStipulations : fix_rg_legstipulations;
    f_LegOrdGrp_LegQty : fix_float_4 option;
    f_LegOrdGrp_LegPositionEffect : string option;
    f_LegOrdGrp_LegSettlType : string option;
    f_LegOrdGrp_LegPrice : fix_float_4 option;
    f_LegOrdGrp_LegPreAllocGrp : fix_rg_legpreallocgrp;
    f_LegOrdGrp_InstrumentLeg : fix_instrumentleg;
    f_LegOrdGrp_LegRefID : string option;
    f_LegOrdGrp_LegSettlDate : fix_localmktdate option;
    f_LegOrdGrp_LegSwapType : fix_legswaptype option;
    f_LegOrdGrp_NestedParties : fix_rg_nestedparties;
    f_LegOrdGrp_LegCoveredOrUncovered : int option;
    f_LegOrdGrp_NoLegs : int option
}
;;

type fix_rg_legordgrp = fix_rg_inner_legordgrp list
;;

type fix_rg_inner_mdincgrp = {
    f_MDIncGrp_MDMkt : fix_exchange option;
    f_MDIncGrp_Text : string option;
    f_MDIncGrp_MDEntryTime : fix_utctimeonly option;
    f_MDIncGrp_TradeCondition : fix_tradecondition option;
    f_MDIncGrp_NoMDEntries : int option;
    f_MDIncGrp_TradingSessionSubID : string option;
    f_MDIncGrp_NumberOfOrders : int option;
    f_MDIncGrp_MDEntrySeller : string option;
    f_MDIncGrp_Scope : fix_scope option;
    f_MDIncGrp_MDEntryID : string option;
    f_MDIncGrp_MDEntryPositionNo : int option;
    f_MDIncGrp_Instrument : fix_instrument;
    f_MDIncGrp_SellerDays : int option;
    f_MDIncGrp_ExpireTime : fix_utctimestamp option;
    f_MDIncGrp_CorporateAction : fix_corporateaction option;
    f_MDIncGrp_DeleteReason : fix_deletereason option;
    f_MDIncGrp_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    f_MDIncGrp_NetChgPrevDay : fix_float_4 option;
    f_MDIncGrp_MDEntryPx : fix_float_4 option;
    f_MDIncGrp_MinQty : fix_float_4 option;
    f_MDIncGrp_ExpireDate : fix_localmktdate option;
    f_MDIncGrp_EncodedText : string option;
    f_MDIncGrp_MDUpdateAction : fix_mdupdateaction option;
    f_MDIncGrp_MDEntryDate : fix_utcdateonly option;
    f_MDIncGrp_TradingSessionID : string option;
    f_MDIncGrp_FinancialStatus : fix_financialstatus option;
    f_MDIncGrp_OrderID : string option;
    f_MDIncGrp_MDEntryRefID : string option;
    f_MDIncGrp_OpenCloseSettlFlag : fix_openclosesettlflag option;
    f_MDIncGrp_MDEntrySize : fix_float_4 option;
    f_MDIncGrp_TickDirection : fix_tickdirection option;
    f_MDIncGrp_EncodedTextLen : int option;
    f_MDIncGrp_MDEntryBuyer : string option;
    f_MDIncGrp_QuoteCondition : fix_quotecondition option;
    f_MDIncGrp_MDEntryOriginator : string option;
    f_MDIncGrp_Currency : fix_currency option;
    f_MDIncGrp_TimeInForce : fix_timeinforce option;
    f_MDIncGrp_PriceDelta : fix_float option;
    f_MDIncGrp_LocationID : string option;
    f_MDIncGrp_QuoteEntryID : string option;
    f_MDIncGrp_InstrmtLegGrp : fix_rg_instrmtleggrp;
    f_MDIncGrp_ExecInst : fix_execinst option;
    f_MDIncGrp_DeskID : string option;
    f_MDIncGrp_MDEntryType : fix_mdentrytype option
}
;;

type fix_rg_mdincgrp = fix_rg_inner_mdincgrp list
;;

type fix_rg_inner_instrmtmdreqgrp = {
    f_InstrmtMDReqGrp_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    f_InstrmtMDReqGrp_NoRelatedSym : int option;
    f_InstrmtMDReqGrp_InstrmtLegGrp : fix_rg_instrmtleggrp;
    f_InstrmtMDReqGrp_Instrument : fix_instrument
}
;;

type fix_rg_instrmtmdreqgrp = fix_rg_inner_instrmtmdreqgrp list
;;

type fix_rg_inner_rfqreqgrp = {
    f_RFQReqGrp_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    f_RFQReqGrp_TradingSessionSubID : string option;
    f_RFQReqGrp_NoRelatedSym : int option;
    f_RFQReqGrp_InstrmtLegGrp : fix_rg_instrmtleggrp;
    f_RFQReqGrp_QuoteType : fix_quotetype option;
    f_RFQReqGrp_Instrument : fix_instrument;
    f_RFQReqGrp_PrevClosePx : fix_float_4 option;
    f_RFQReqGrp_QuoteRequestType : fix_quoterequesttype option;
    f_RFQReqGrp_TradingSessionID : string option
}
;;

type fix_rg_rfqreqgrp = fix_rg_inner_rfqreqgrp list
;;

type fix_rg_inner_listordgrp = {
    f_ListOrdGrp_SolicitedFlag : fix_solicitedflag option;
    f_ListOrdGrp_OrderCapacity : fix_ordercapacity option;
    f_ListOrdGrp_SideValueInd : fix_sidevalueind option;
    f_ListOrdGrp_OrdType : fix_ordtype option;
    f_ListOrdGrp_MaxShow : fix_float_4 option;
    f_ListOrdGrp_SecondaryClOrdID : string option;
    f_ListOrdGrp_AccountType : fix_accounttype option;
    f_ListOrdGrp_MaxFloor : fix_float_4 option;
    f_ListOrdGrp_ProcessCode : fix_processcode option;
    f_ListOrdGrp_Stipulations : fix_rg_stipulations;
    f_ListOrdGrp_TargetStrategy : fix_targetstrategy option;
    f_ListOrdGrp_QtyType : fix_qtytype option;
    f_ListOrdGrp_ClearingFeeIndicator : fix_clearingfeeindicator option;
    f_ListOrdGrp_GTBookingInst : fix_gtbookinginst option;
    f_ListOrdGrp_ExDestination : fix_exchange option;
    f_ListOrdGrp_PriceType : fix_pricetype option;
    f_ListOrdGrp_CommissionData : fix_commissiondata;
    f_ListOrdGrp_Account : string option;
    f_ListOrdGrp_AcctIDSource : fix_acctidsource option;
    f_ListOrdGrp_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    f_ListOrdGrp_EffectiveTime : fix_utctimestamp option;
    f_ListOrdGrp_MinQty : fix_float_4 option;
    f_ListOrdGrp_PreallocMethod : fix_preallocmethod option;
    f_ListOrdGrp_OrderQtyData : fix_orderqtydata;
    f_ListOrdGrp_ExpireDate : fix_localmktdate option;
    f_ListOrdGrp_TradeOriginationDate : fix_localmktdate option;
    f_ListOrdGrp_SettlDate2 : fix_localmktdate option;
    f_ListOrdGrp_TransactTime : fix_utctimestamp option;
    f_ListOrdGrp_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    f_ListOrdGrp_OrderQty2 : fix_float_4 option;
    f_ListOrdGrp_Side : fix_side option;
    f_ListOrdGrp_EncodedTextLen : int option;
    f_ListOrdGrp_ParticipationRate : fix_float_4 option;
    f_ListOrdGrp_Price2 : fix_float_4 option;
    f_ListOrdGrp_ForexReq : fix_forexreq option;
    f_ListOrdGrp_TimeInForce : fix_timeinforce option;
    f_ListOrdGrp_ComplianceID : string option;
    f_ListOrdGrp_ClOrdLinkID : string option;
    f_ListOrdGrp_PrevClosePx : fix_float_4 option;
    f_ListOrdGrp_ExecInst : fix_execinst option;
    f_ListOrdGrp_BookingType : fix_bookingtype option;
    f_ListOrdGrp_PreAllocGrp : fix_rg_preallocgrp;
    f_ListOrdGrp_YieldData : fix_yielddata;
    f_ListOrdGrp_Designation : string option;
    f_ListOrdGrp_SettlInstMode : fix_settlinstmode option;
    f_ListOrdGrp_QuoteID : string option;
    f_ListOrdGrp_LocateReqd : fix_locatereqd option;
    f_ListOrdGrp_CustOrderCapacity : fix_custordercapacity option;
    f_ListOrdGrp_CashMargin : fix_cashmargin option;
    f_ListOrdGrp_ClOrdID : string option;
    f_ListOrdGrp_Text : string option;
    f_ListOrdGrp_ListSeqNo : int option;
    f_ListOrdGrp_DayBookingInst : fix_daybookinginst option;
    f_ListOrdGrp_StopPx : fix_float_4 option;
    f_ListOrdGrp_TargetStrategyParameters : string option;
    f_ListOrdGrp_Price : fix_float_4 option;
    f_ListOrdGrp_SettlType : fix_settltype option;
    f_ListOrdGrp_Instrument : fix_instrument;
    f_ListOrdGrp_ExpireTime : fix_utctimestamp option;
    f_ListOrdGrp_OrderRestrictions : fix_orderrestrictions option;
    f_ListOrdGrp_CoveredOrUncovered : fix_coveredoruncovered option;
    f_ListOrdGrp_EncodedText : string option;
    f_ListOrdGrp_AllocID : string option;
    f_ListOrdGrp_PegInstructions : fix_peginstructions;
    f_ListOrdGrp_DiscretionInstructions : fix_discretioninstructions;
    f_ListOrdGrp_BookingUnit : fix_bookingunit option;
    f_ListOrdGrp_TrdgSesGrp : fix_rg_trdgsesgrp;
    f_ListOrdGrp_IOIID : string option;
    f_ListOrdGrp_SettlCurrency : fix_currency option;
    f_ListOrdGrp_PositionEffect : fix_positioneffect option;
    f_ListOrdGrp_NoOrders : int option;
    f_ListOrdGrp_Parties : fix_rg_parties;
    f_ListOrdGrp_Currency : fix_currency option;
    f_ListOrdGrp_SettlDate : fix_localmktdate option;
    f_ListOrdGrp_TradeDate : fix_localmktdate option;
    f_ListOrdGrp_HandlInst : fix_handlinst option
}
;;

type fix_rg_listordgrp = fix_rg_inner_listordgrp list
;;

type fix_rg_inner_seclistgrp = {
    f_SecListGrp_FinancingDetails : fix_financingdetails;
    f_SecListGrp_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    f_SecListGrp_InstrmtLegSecListGrp : fix_rg_instrmtlegseclistgrp;
    f_SecListGrp_NoRelatedSym : int option;
    f_SecListGrp_EncodedText : string option;
    f_SecListGrp_TradingSessionID : string option;
    f_SecListGrp_Text : string option;
    f_SecListGrp_InstrumentExtension : fix_instrumentextension;
    f_SecListGrp_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    f_SecListGrp_MinTradeVol : fix_float_4 option;
    f_SecListGrp_TradingSessionSubID : string option;
    f_SecListGrp_Stipulations : fix_rg_stipulations;
    f_SecListGrp_ExpirationCycle : fix_expirationcycle option;
    f_SecListGrp_EncodedTextLen : int option;
    f_SecListGrp_RoundLot : fix_float_4 option;
    f_SecListGrp_Currency : fix_currency option;
    f_SecListGrp_Instrument : fix_instrument;
    f_SecListGrp_YieldData : fix_yielddata
}
;;

type fix_rg_seclistgrp = fix_rg_inner_seclistgrp list
;;

type fix_rg_inner_quotreqrjctgrp = {
    f_QuotReqRjctGrp_NoRelatedSym : int option;
    f_QuotReqRjctGrp_OrdType : fix_ordtype option;
    f_QuotReqRjctGrp_QuoteRequestType : fix_quoterequesttype option;
    f_QuotReqRjctGrp_AccountType : fix_accounttype option;
    f_QuotReqRjctGrp_TradingSessionSubID : string option;
    f_QuotReqRjctGrp_Stipulations : fix_rg_stipulations;
    f_QuotReqRjctGrp_QtyType : fix_qtytype option;
    f_QuotReqRjctGrp_Price : fix_float_4 option;
    f_QuotReqRjctGrp_SettlType : fix_settltype option;
    f_QuotReqRjctGrp_QuoteType : fix_quotetype option;
    f_QuotReqRjctGrp_Instrument : fix_instrument;
    f_QuotReqRjctGrp_ExpireTime : fix_utctimestamp option;
    f_QuotReqRjctGrp_PriceType : fix_pricetype option;
    f_QuotReqRjctGrp_QuotReqLegsGrp : fix_rg_quotreqlegsgrp;
    f_QuotReqRjctGrp_Account : string option;
    f_QuotReqRjctGrp_AcctIDSource : fix_acctidsource option;
    f_QuotReqRjctGrp_FinancingDetails : fix_financingdetails;
    f_QuotReqRjctGrp_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    f_QuotReqRjctGrp_OrderQtyData : fix_orderqtydata;
    f_QuotReqRjctGrp_QuotQualGrp : fix_rg_quotqualgrp;
    f_QuotReqRjctGrp_QuotePriceType : fix_quotepricetype option;
    f_QuotReqRjctGrp_TradeOriginationDate : fix_localmktdate option;
    f_QuotReqRjctGrp_TradingSessionID : string option;
    f_QuotReqRjctGrp_SettlDate2 : fix_localmktdate option;
    f_QuotReqRjctGrp_TransactTime : fix_utctimestamp option;
    f_QuotReqRjctGrp_OrderQty2 : fix_float_4 option;
    f_QuotReqRjctGrp_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    f_QuotReqRjctGrp_Side : fix_side option;
    f_QuotReqRjctGrp_Price2 : fix_float_4 option;
    f_QuotReqRjctGrp_Currency : fix_currency option;
    f_QuotReqRjctGrp_Parties : fix_rg_parties;
    f_QuotReqRjctGrp_PrevClosePx : fix_float_4 option;
    f_QuotReqRjctGrp_SettlDate : fix_localmktdate option;
    f_QuotReqRjctGrp_YieldData : fix_yielddata
}
;;

type fix_rg_quotreqrjctgrp = fix_rg_inner_quotreqrjctgrp list
;;

type fix_rg_inner_quotreqgrp = {
    f_QuotReqGrp_NoRelatedSym : int option;
    f_QuotReqGrp_OrdType : fix_ordtype option;
    f_QuotReqGrp_ValidUntilTime : fix_utctimestamp option;
    f_QuotReqGrp_QuoteRequestType : fix_quoterequesttype option;
    f_QuotReqGrp_AccountType : fix_accounttype option;
    f_QuotReqGrp_TradingSessionSubID : string option;
    f_QuotReqGrp_Stipulations : fix_rg_stipulations;
    f_QuotReqGrp_QtyType : fix_qtytype option;
    f_QuotReqGrp_Price : fix_float_4 option;
    f_QuotReqGrp_SettlType : fix_settltype option;
    f_QuotReqGrp_QuoteType : fix_quotetype option;
    f_QuotReqGrp_Instrument : fix_instrument;
    f_QuotReqGrp_ExpireTime : fix_utctimestamp option;
    f_QuotReqGrp_PriceType : fix_pricetype option;
    f_QuotReqGrp_QuotReqLegsGrp : fix_rg_quotreqlegsgrp;
    f_QuotReqGrp_Account : string option;
    f_QuotReqGrp_AcctIDSource : fix_acctidsource option;
    f_QuotReqGrp_FinancingDetails : fix_financingdetails;
    f_QuotReqGrp_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    f_QuotReqGrp_OrderQtyData : fix_orderqtydata;
    f_QuotReqGrp_QuotQualGrp : fix_rg_quotqualgrp;
    f_QuotReqGrp_QuotePriceType : fix_quotepricetype option;
    f_QuotReqGrp_TradeOriginationDate : fix_localmktdate option;
    f_QuotReqGrp_TradingSessionID : string option;
    f_QuotReqGrp_SettlDate2 : fix_localmktdate option;
    f_QuotReqGrp_TransactTime : fix_utctimestamp option;
    f_QuotReqGrp_OrderQty2 : fix_float_4 option;
    f_QuotReqGrp_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    f_QuotReqGrp_Side : fix_side option;
    f_QuotReqGrp_Price2 : fix_float_4 option;
    f_QuotReqGrp_Currency : fix_currency option;
    f_QuotReqGrp_Parties : fix_rg_parties;
    f_QuotReqGrp_PrevClosePx : fix_float_4 option;
    f_QuotReqGrp_SettlDate : fix_localmktdate option;
    f_QuotReqGrp_YieldData : fix_yielddata
}
;;

type fix_rg_quotreqgrp = fix_rg_inner_quotreqgrp list
;;

type fix_rg_inner_quotcxlentriesgrp = {
    f_QuotCxlEntriesGrp_FinancingDetails : fix_financingdetails;
    f_QuotCxlEntriesGrp_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    f_QuotCxlEntriesGrp_InstrmtLegGrp : fix_rg_instrmtleggrp;
    f_QuotCxlEntriesGrp_Instrument : fix_instrument;
    f_QuotCxlEntriesGrp_NoQuoteEntries : int option
}
;;

type fix_rg_quotcxlentriesgrp = fix_rg_inner_quotcxlentriesgrp list
;;

type fix_settlinstructionsdata = {
    (** Required if AllocSettlInstType = 1 or 2*)
    f_SettlInstructionsData_SettlDeliveryType : fix_settldeliverytype option;
    (** Required (and must be > 0) if AllocSettlInstType = 2 (should not be populated otherwise)*)
    f_SettlInstructionsData_DlvyInstGrp : fix_rg_dlvyinstgrp;
    (** Identifier used within the StandInstDbType
     Required if AllocSettlInstType = 3 (should not be populated otherwise)*)
    f_SettlInstructionsData_StandInstDbID : string option;
    (** Required if AllocSettlInstType = 3 (should not be populated otherwise)*)
    f_SettlInstructionsData_StandInstDbName : string option;
    (** Required if AllocSettlInstType = 3 (should not be populated otherwise)*)
    f_SettlInstructionsData_StandInstDbType : fix_standinstdbtype option
}
;;

type fix_rg_inner_allocgrp = {
    f_AllocGrp_AllocAccruedInterestAmt : fix_float_4 option;
    f_AllocGrp_NoAllocs : int option;
    f_AllocGrp_AllocSettlCurrAmt : fix_float_4 option;
    f_AllocGrp_SettlCurrAmt : fix_float_4 option;
    f_AllocGrp_AllocText : string option;
    f_AllocGrp_SettlInstructionsData : fix_settlinstructionsdata;
    f_AllocGrp_AllocSettlInstType : fix_allocsettlinsttype option;
    f_AllocGrp_ProcessCode : fix_processcode option;
    f_AllocGrp_EncodedAllocText : string option;
    f_AllocGrp_AllocAvgPx : fix_float_4 option;
    f_AllocGrp_ClrInstGrp : fix_rg_clrinstgrp;
    f_AllocGrp_EncodedAllocTextLen : int option;
    f_AllocGrp_AllocHandlInst : fix_allochandlinst option;
    f_AllocGrp_CommissionData : fix_commissiondata;
    f_AllocGrp_SettlCurrFxRate : fix_float option;
    f_AllocGrp_AllocNetMoney : fix_float_4 option;
    f_AllocGrp_AllocQty : fix_float_4 option;
    f_AllocGrp_AllocAcctIDSource : int option;
    f_AllocGrp_MiscFeesGrp : fix_rg_miscfeesgrp;
    f_AllocGrp_SettlCurrFxRateCalc : fix_settlcurrfxratecalc option;
    f_AllocGrp_AllocAccount : string option;
    f_AllocGrp_AllocPrice : fix_float_4 option;
    f_AllocGrp_IndividualAllocID : string option;
    f_AllocGrp_AllocSettlCurrency : fix_currency option;
    f_AllocGrp_SettlCurrency : fix_currency option;
    f_AllocGrp_NotifyBrokerOfCredit : fix_notifybrokerofcredit option;
    f_AllocGrp_AllocInterestAtMaturity : fix_float_4 option;
    f_AllocGrp_MatchStatus : fix_matchstatus option;
    f_AllocGrp_NestedParties : fix_rg_nestedparties
}
;;

type fix_rg_allocgrp = fix_rg_inner_allocgrp list
;;

type fix_rg_inner_settlinstgrp = {
    f_SettlInstGrp_SettlInstRefID : string option;
    f_SettlInstGrp_SecurityType : fix_securitytype option;
    f_SettlInstGrp_CardNumber : string option;
    f_SettlInstGrp_CardExpDate : fix_localmktdate option;
    f_SettlInstGrp_EffectiveTime : fix_utctimestamp option;
    f_SettlInstGrp_PaymentDate : fix_localmktdate option;
    f_SettlInstGrp_PaymentRemitterID : string option;
    f_SettlInstGrp_SettlInstTransType : fix_settlinsttranstype option;
    f_SettlInstGrp_SettlInstructionsData : fix_settlinstructionsdata;
    f_SettlInstGrp_Product : fix_product option;
    f_SettlInstGrp_CFICode : string option;
    f_SettlInstGrp_CardHolderName : string option;
    f_SettlInstGrp_Side : fix_side option;
    f_SettlInstGrp_LastUpdateTime : fix_utctimestamp option;
    f_SettlInstGrp_Parties : fix_rg_parties;
    f_SettlInstGrp_NoSettlInst : int option;
    f_SettlInstGrp_PaymentMethod : fix_paymentmethod option;
    f_SettlInstGrp_PaymentRef : string option;
    f_SettlInstGrp_SettlInstID : string option;
    f_SettlInstGrp_ExpireTime : fix_utctimestamp option;
    f_SettlInstGrp_CardIssNum : string option;
    f_SettlInstGrp_CardStartDate : fix_localmktdate option
}
;;

type fix_rg_settlinstgrp = fix_rg_inner_settlinstgrp list
;;

type fix_rg_inner_quotsetgrp = {
    f_QuotSetGrp_UnderlyingInstrument : fix_underlyinginstrument;
    f_QuotSetGrp_QuoteSetID : string option;
    f_QuotSetGrp_LastFragment : fix_lastfragment option;
    f_QuotSetGrp_NoQuoteSets : int option;
    f_QuotSetGrp_QuoteSetValidUntilTime : fix_utctimestamp option;
    f_QuotSetGrp_TotNoQuoteEntries : int option;
    f_QuotSetGrp_QuotEntryGrp : fix_rg_quotentrygrp
}
;;

type fix_rg_quotsetgrp = fix_rg_inner_quotsetgrp list
;;

type fix_rg_inner_quotsetackgrp = {
    f_QuotSetAckGrp_UnderlyingInstrument : fix_underlyinginstrument;
    f_QuotSetAckGrp_QuotEntryAckGrp : fix_rg_quotentryackgrp;
    f_QuotSetAckGrp_QuoteSetID : string option;
    f_QuotSetAckGrp_LastFragment : fix_lastfragment option;
    f_QuotSetAckGrp_NoQuoteSets : int option;
    f_QuotSetAckGrp_TotNoQuoteEntries : int option
}
;;

type fix_rg_quotsetackgrp = fix_rg_inner_quotsetackgrp list
;;

type full_fix_app_record_data =
    | FIX_Record_SecurityDefinitionRelatedSym of fix_rg_securitydefinitionrelatedsym
    | FIX_Record_IOIIOIQualifiers of fix_rg_ioiioiqualifiers
    | FIX_Record_DiscretionInstructions of fix_discretioninstructions
    | FIX_Record_CompIDStatGrp of fix_rg_compidstatgrp
    | FIX_Record_AllocAckGrp of fix_rg_allocackgrp
    | FIX_Record_QuoteAcknowledgementQuoteSets of fix_rg_quoteacknowledgementquotesets
    | FIX_Record_OrderSingleAllocs of fix_rg_ordersingleallocs
    | FIX_Record_TrdCapDtGrp of fix_rg_trdcapdtgrp
    | FIX_Record_IOIQualGrp of fix_rg_ioiqualgrp
    | FIX_Record_NstdPtys3SubGrp of fix_rg_nstdptys3subgrp
    | FIX_Record_AffectedOrdGrp of fix_rg_affectedordgrp
    | FIX_Record_QuoteAcknowledgementQuoteEntries of fix_rg_quoteacknowledgementquoteentries
    | FIX_Record_MassQuoteQuoteSets of fix_rg_massquotequotesets
    | FIX_Record_BidDescReqGrp of fix_rg_biddescreqgrp
    | FIX_Record_YieldData of fix_yielddata
    | FIX_Record_LegStipulations of fix_rg_legstipulations
    | FIX_Record_NewsLinesOfText of fix_rg_newslinesoftext
    | FIX_Record_CompIDReqGrp of fix_rg_compidreqgrp
    | FIX_Record_EvntGrp of fix_rg_evntgrp
    | FIX_Record_QuotQualGrp of fix_rg_quotqualgrp
    | FIX_Record_OrderCancelReplaceRequestTradingSessions of fix_rg_ordercancelreplacerequesttradingsessions
    | FIX_Record_TrdCollGrp of fix_rg_trdcollgrp
    | FIX_Record_SettlPtysSubGrp of fix_rg_settlptyssubgrp
    | FIX_Record_LegBenchmarkCurveData of fix_legbenchmarkcurvedata
    | FIX_Record_BidCompReqGrp of fix_rg_bidcompreqgrp
    | FIX_Record_CollInqQualGrp of fix_rg_collinqqualgrp
    | FIX_Record_QuoteRequestRelatedSym of fix_rg_quoterequestrelatedsym
    | FIX_Record_OrderListOrders of fix_rg_orderlistorders
    | FIX_Record_SpreadOrBenchmarkCurveData of fix_spreadorbenchmarkcurvedata
    | FIX_Record_UndSecAltIDGrp of fix_rg_undsecaltidgrp
    | FIX_Record_RgstDistInstGrp of fix_rg_rgstdistinstgrp
    | FIX_Record_EmailLinesOfText of fix_rg_emaillinesoftext
    | FIX_Record_MDReqGrp of fix_rg_mdreqgrp
    | FIX_Record_MarketDataRequestMDEntryTypes of fix_rg_marketdatarequestmdentrytypes
    | FIX_Record_PegInstructions of fix_peginstructions
    | FIX_Record_ExecsGrp of fix_rg_execsgrp
    | FIX_Record_CpctyConfGrp of fix_rg_cpctyconfgrp
    | FIX_Record_AllocationExecs of fix_rg_allocationexecs
    | FIX_Record_TrdgSesGrp of fix_rg_trdgsesgrp
    | FIX_Record_interval of fix_interval
    | FIX_Record_AllocationOrders of fix_rg_allocationorders
    | FIX_Record_UnderlyingStipulations of fix_rg_underlyingstipulations
    | FIX_Record_IOIRoutingIDs of fix_rg_ioiroutingids
    | FIX_Record_NewsRelatedSym of fix_rg_newsrelatedsym
    | FIX_Record_ClrInstGrp of fix_rg_clrinstgrp
    | FIX_Record_MDFullGrp of fix_rg_mdfullgrp
    | FIX_Record_AllocationAllocs of fix_rg_allocationallocs
    | FIX_Record_ClearingEntries of fix_rg_clearingentries
    | FIX_Record_ExecCollGrp of fix_rg_execcollgrp
    | FIX_Record_OrderCancelReplaceRequestAllocs of fix_rg_ordercancelreplacerequestallocs
    | FIX_Record_CommissionData of fix_commissiondata
    | FIX_Record_EmailRoutingIDs of fix_rg_emailroutingids
    | FIX_Record_ExecAllocGrp of fix_rg_execallocgrp
    | FIX_Record_EmailRelatedSym of fix_rg_emailrelatedsym
    | FIX_Record_NstdPtys2SubGrp of fix_rg_nstdptys2subgrp
    | FIX_Record_MassQuoteQuoteEntries of fix_rg_massquotequoteentries
    | FIX_Record_AttrbGrp of fix_rg_attrbgrp
    | FIX_Record_ContAmtGrp of fix_rg_contamtgrp
    | FIX_Record_MiscFeesGrp of fix_rg_miscfeesgrp
    | FIX_Record_NstdPtysSubGrp of fix_rg_nstdptyssubgrp
    | FIX_Record_Hop of fix_rg_hop
    | FIX_Record_ExecutionReportContraBrokers of fix_rg_executionreportcontrabrokers
    | FIX_Record_RoutingGrp of fix_rg_routinggrp
    | FIX_Record_OrderListTradingSessions of fix_rg_orderlisttradingsessions
    | FIX_Record_Stipulations of fix_rg_stipulations
    | FIX_Record_AllocationMiscFees of fix_rg_allocationmiscfees
    | FIX_Record_FinancingDetails of fix_financingdetails
    | FIX_Record_OrderListAllocs of fix_rg_orderlistallocs
    | FIX_Record_LinesOfTextGrp of fix_rg_linesoftextgrp
    | FIX_Record_OrdListStatGrp of fix_rg_ordliststatgrp
    | FIX_Record_PtysSubGrp of fix_rg_ptyssubgrp
    | FIX_Record_BidResponseBidComponents of fix_rg_bidresponsebidcomponents
    | FIX_Record_LogonMsgTypes of fix_rg_logonmsgtypes
    | FIX_Record_SecTypesGrp of fix_rg_sectypesgrp
    | FIX_Record_QuoteCancelQuoteEntries of fix_rg_quotecancelquoteentries
    | FIX_Record_MarketDataRequestRelatedSym of fix_rg_marketdatarequestrelatedsym
    | FIX_Record_PositionAmountData of fix_rg_positionamountdata
    | FIX_Record_MDRjctGrp of fix_rg_mdrjctgrp
    | FIX_Record_ListStatusOrders of fix_rg_liststatusorders
    | FIX_Record_SecAltIDGrp of fix_rg_secaltidgrp
    | FIX_Record_TrdRegTimestamps of fix_rg_trdregtimestamps
    | FIX_Record_BidRequestBidComponents of fix_rg_bidrequestbidcomponents
    | FIX_Record_ListStrikePriceStrikes of fix_rg_liststrikepricestrikes
    | FIX_Record_NewsRoutingIDs of fix_rg_newsroutingids
    | FIX_Record_SecurityDefinitionRequestRelatedSym of fix_rg_securitydefinitionrequestrelatedsym
    | FIX_Record_BidRequestBidDescriptors of fix_rg_bidrequestbiddescriptors
    | FIX_Record_OrderQtyData of fix_orderqtydata
    | FIX_Record_ContraGrp of fix_rg_contragrp
    | FIX_Record_OrderSingleTradingSessions of fix_rg_ordersingletradingsessions
    | FIX_Record_MarketDataIncrementalRefreshMDEntries of fix_rg_marketdataincrementalrefreshmdentries
    | FIX_Record_MarketDataSnapshotFullRefreshMDEntries of fix_rg_marketdatasnapshotfullrefreshmdentries
    | FIX_Record_LegSecAltIDGrp of fix_rg_legsecaltidgrp
    | FIX_Record_InstrumentLeg of fix_instrumentleg
    | FIX_Record_Parties of fix_rg_parties
    | FIX_Record_NestedParties of fix_rg_nestedparties
    | FIX_Record_InstrumentExtension of fix_instrumentextension
    | FIX_Record_NestedParties2 of fix_rg_nestedparties2
    | FIX_Record_BidCompRspGrp of fix_rg_bidcomprspgrp
    | FIX_Record_UnderlyingInstrument of fix_underlyinginstrument
    | FIX_Record_SettlParties of fix_rg_settlparties
    | FIX_Record_Instrument of fix_instrument
    | FIX_Record_NestedParties3 of fix_rg_nestedparties3
    | FIX_Record_PreAllocMlegGrp of fix_rg_preallocmleggrp
    | FIX_Record_InstrmtGrp of fix_rg_instrmtgrp
    | FIX_Record_InstrmtStrkPxGrp of fix_rg_instrmtstrkpxgrp
    | FIX_Record_DlvyInstGrp of fix_rg_dlvyinstgrp
    | FIX_Record_UndInstrmtStrkPxGrp of fix_rg_undinstrmtstrkpxgrp
    | FIX_Record_PosUndInstrmtGrp of fix_rg_posundinstrmtgrp
    | FIX_Record_UndInstrmtGrp of fix_rg_undinstrmtgrp
    | FIX_Record_UndInstrmtCollGrp of fix_rg_undinstrmtcollgrp
    | FIX_Record_OrdAllocGrp of fix_rg_ordallocgrp
    | FIX_Record_LegPreAllocGrp of fix_rg_legpreallocgrp
    | FIX_Record_TrdAllocGrp of fix_rg_trdallocgrp
    | FIX_Record_PreAllocGrp of fix_rg_preallocgrp
    | FIX_Record_PositionQty of fix_rg_positionqty
    | FIX_Record_RgstDtlsGrp of fix_rg_rgstdtlsgrp
    | FIX_Record_SideCrossOrdCxlGrp of fix_rg_sidecrossordcxlgrp
    | FIX_Record_InstrmtLegGrp of fix_rg_instrmtleggrp
    | FIX_Record_LegQuotStatGrp of fix_rg_legquotstatgrp
    | FIX_Record_InstrmtLegIOIGrp of fix_rg_instrmtlegioigrp
    | FIX_Record_InstrmtLegExecGrp of fix_rg_instrmtlegexecgrp
    | FIX_Record_InstrmtLegSecListGrp of fix_rg_instrmtlegseclistgrp
    | FIX_Record_LegQuotGrp of fix_rg_legquotgrp
    | FIX_Record_TrdInstrmtLegGrp of fix_rg_trdinstrmtleggrp
    | FIX_Record_QuotReqLegsGrp of fix_rg_quotreqlegsgrp
    | FIX_Record_RelSymDerivSecGrp of fix_rg_relsymderivsecgrp
    | FIX_Record_QuotEntryAckGrp of fix_rg_quotentryackgrp
    | FIX_Record_QuotEntryGrp of fix_rg_quotentrygrp
    | FIX_Record_SideCrossOrdModGrp of fix_rg_sidecrossordmodgrp
    | FIX_Record_TrdCapRptSideGrp of fix_rg_trdcaprptsidegrp
    | FIX_Record_LegOrdGrp of fix_rg_legordgrp
    | FIX_Record_MDIncGrp of fix_rg_mdincgrp
    | FIX_Record_InstrmtMDReqGrp of fix_rg_instrmtmdreqgrp
    | FIX_Record_RFQReqGrp of fix_rg_rfqreqgrp
    | FIX_Record_ListOrdGrp of fix_rg_listordgrp
    | FIX_Record_SecListGrp of fix_rg_seclistgrp
    | FIX_Record_QuotReqRjctGrp of fix_rg_quotreqrjctgrp
    | FIX_Record_QuotReqGrp of fix_rg_quotreqgrp
    | FIX_Record_QuotCxlEntriesGrp of fix_rg_quotcxlentriesgrp
    | FIX_Record_SettlInstructionsData of fix_settlinstructionsdata
    | FIX_Record_AllocGrp of fix_rg_allocgrp
    | FIX_Record_SettlInstGrp of fix_rg_settlinstgrp
    | FIX_Record_QuotSetGrp of fix_rg_quotsetgrp
    | FIX_Record_QuotSetAckGrp of fix_rg_quotsetackgrp
;;
