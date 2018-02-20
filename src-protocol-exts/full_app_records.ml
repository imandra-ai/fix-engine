(* Aesthetic Integration copyright 2017 *)
(* @meta[imandra_ignore] on @end *)
open Full_app_enums;;
open Base_types;;
open Datetime;;
open Numeric;;
(* @meta[imandra_ignore] off @end *)

type fix_rg_inner_attrbgrp = {
    f_AttrbGrp_NoInstrAttrib : int option;
    f_AttrbGrp_InstrAttribType : fix_instrattribtype option;
    f_AttrbGrp_InstrAttribValue : fix_string option
}
;;

type fix_rg_attrbgrp = fix_rg_inner_attrbgrp list
;;

type fix_rg_inner_positionamountdata = {
    (** Number of Position Amount entries*)
    f_PositionAmountData_NoPosAmt : int option;
    f_PositionAmountData_PosAmtType : fix_posamttype option;
    f_PositionAmountData_PosAmt : fix_float_4 option
}
;;

type fix_rg_positionamountdata = fix_rg_inner_positionamountdata list
;;

type fix_commissiondata = {
    f_CommissionData_Commission : fix_float_4 option;
    f_CommissionData_CommType : fix_commtype option;
    (** For CIV - Optional*)
    f_CommissionData_CommCurrency : fix_currency option;
    (** For CIV - Optional*)
    f_CommissionData_FundRenewWaiv : fix_fundrenewwaiv option
}
;;

type fix_rg_inner_undsecaltidgrp = {
    f_UndSecAltIDGrp_NoUnderlyingSecurityAltID : int option;
    f_UndSecAltIDGrp_UnderlyingSecurityAltID : fix_string option;
    f_UndSecAltIDGrp_UnderlyingSecurityAltIDSource : fix_string option
}
;;

type fix_rg_undsecaltidgrp = fix_rg_inner_undsecaltidgrp list
;;

type fix_discretioninstructions = {
    (** What the discretionary price is related to (e.g. primary price, display price etc)*)
    f_DiscretionInstructions_DiscretionInst : fix_discretioninst option;
    (** Amount (signed) added to the "related to" price specified via DiscretionInst, in the context of DiscretionOffsetType*)
    f_DiscretionInstructions_DiscretionOffsetValue : fix_float_4 option;
    (** Describes whether discretion price is static/fixed or floats*)
    f_DiscretionInstructions_DiscretionMoveType : fix_discretionmovetype option;
    (** Type of Discretion Offset (e.g. price offset, tick offset etc)*)
    f_DiscretionInstructions_DiscretionOffsetType : fix_discretionoffsettype option;
    (** Specifies the nature of the resulting discretion price (e.g. or better limit, strict limit etc)*)
    f_DiscretionInstructions_DiscretionLimitType : fix_discretionlimittype option;
    (** If the calculated discretion price is not a valid tick price, specifies how to round the price (e.g. to be more or less aggressive)*)
    f_DiscretionInstructions_DiscretionRoundDirection : fix_discretionrounddirection option;
    (** The scope of "related to" price of the discretion (e.g. local, global etc)*)
    f_DiscretionInstructions_DiscretionScope : fix_discretionscope option
}
;;

type fix_rg_inner_trdcapdtgrp = {
    f_TrdCapDtGrp_NoDates : int option;
    f_TrdCapDtGrp_TradeDate : fix_localmktdate option;
    f_TrdCapDtGrp_TransactTime : fix_utctimestamp option
}
;;

type fix_rg_trdcapdtgrp = fix_rg_inner_trdcapdtgrp list
;;

type fix_rg_inner_mdrjctgrp = {
    f_MDRjctGrp_NoAltMDSource : int option;
    f_MDRjctGrp_AltMDSourceID : fix_string option
}
;;

type fix_rg_mdrjctgrp = fix_rg_inner_mdrjctgrp list
;;

type fix_rg_inner_biddescreqgrp = {
    f_BidDescReqGrp_NoBidDescriptors : int option;
    f_BidDescReqGrp_BidDescriptorType : fix_biddescriptortype option;
    f_BidDescReqGrp_BidDescriptor : fix_string option;
    f_BidDescReqGrp_SideValueInd : fix_sidevalueind option;
    f_BidDescReqGrp_LiquidityValue : fix_float_4 option;
    f_BidDescReqGrp_LiquidityNumSecurities : int option;
    f_BidDescReqGrp_LiquidityPctLow : fix_float_4 option;
    f_BidDescReqGrp_LiquidityPctHigh : fix_float_4 option;
    f_BidDescReqGrp_EFPTrackingError : fix_float_4 option;
    f_BidDescReqGrp_FairValue : fix_float_4 option;
    f_BidDescReqGrp_OutsideIndexPct : fix_float_4 option;
    f_BidDescReqGrp_ValueOfFutures : fix_float_4 option
}
;;

type fix_rg_biddescreqgrp = fix_rg_inner_biddescreqgrp list
;;

type fix_rg_inner_nstdptys2subgrp = {
    f_NstdPtys2SubGrp_NoNested2PartySubIDs : int option;
    f_NstdPtys2SubGrp_Nested2PartySubID : fix_string option;
    f_NstdPtys2SubGrp_Nested2PartySubIDType : int option
}
;;

type fix_rg_nstdptys2subgrp = fix_rg_inner_nstdptys2subgrp list
;;

type fix_rg_inner_hop = {
    f_Hop_NoHops : int option;
    f_Hop_HopCompID : fix_string option;
    f_Hop_HopSendingTime : fix_utctimestamp option;
    f_Hop_HopRefID : int option
}
;;

type fix_rg_hop = fix_rg_inner_hop list
;;

type fix_rg_inner_bidcompreqgrp = {
    f_BidCompReqGrp_NoBidComponents : int option;
    f_BidCompReqGrp_ListID : fix_string option;
    f_BidCompReqGrp_Side : fix_side option;
    f_BidCompReqGrp_TradingSessionID : fix_string option;
    f_BidCompReqGrp_TradingSessionSubID : fix_string option;
    f_BidCompReqGrp_NetGrossInd : fix_netgrossind option;
    f_BidCompReqGrp_SettlType : fix_settltype option;
    f_BidCompReqGrp_SettlDate : fix_localmktdate option;
    f_BidCompReqGrp_Account : fix_string option;
    f_BidCompReqGrp_AcctIDSource : fix_acctidsource option
}
;;

type fix_rg_bidcompreqgrp = fix_rg_inner_bidcompreqgrp list
;;

type fix_rg_inner_ptyssubgrp = {
    f_PtysSubGrp_NoPartySubIDs : int option;
    f_PtysSubGrp_PartySubID : fix_string option;
    f_PtysSubGrp_PartySubIDType : fix_partysubidtype option
}
;;

type fix_rg_ptyssubgrp = fix_rg_inner_ptyssubgrp list
;;

type fix_rg_inner_execsgrp = {
    f_ExecsGrp_NoExecs : int option;
    f_ExecsGrp_ExecID : fix_string option
}
;;

type fix_rg_execsgrp = fix_rg_inner_execsgrp list
;;

type fix_rg_inner_logonmsgtypes = {
    (** Specifies the number of repeating RefMsgTypes specified*)
    f_LogonMsgTypes_NoMsgTypes : int option;
    (** Specifies a specific, supported MsgType. Required if NoMsgTypes is > 0. Should be specified from the point of view of the sender of the Logon message*)
    f_LogonMsgTypes_RefMsgType : fix_string option;
    (** Indicates direction (send vs. receive) of a supported MsgType. Required if NoMsgTypes is > 0. Should be specified from the point of view of the sender of the Logon message*)
    f_LogonMsgTypes_MsgDirection : fix_msgdirection option
}
;;

type fix_rg_logonmsgtypes = fix_rg_inner_logonmsgtypes list
;;

type fix_rg_inner_trdgsesgrp = {
    f_TrdgSesGrp_NoTradingSessions : int option;
    f_TrdgSesGrp_TradingSessionID : fix_string option;
    f_TrdgSesGrp_TradingSessionSubID : fix_string option
}
;;

type fix_rg_trdgsesgrp = fix_rg_inner_trdgsesgrp list
;;

type fix_rg_inner_settlptyssubgrp = {
    f_SettlPtysSubGrp_NoSettlPartySubIDs : int option;
    f_SettlPtysSubGrp_SettlPartySubID : fix_string option;
    f_SettlPtysSubGrp_SettlPartySubIDType : int option
}
;;

type fix_rg_settlptyssubgrp = fix_rg_inner_settlptyssubgrp list
;;

type fix_rg_inner_nstdptyssubgrp = {
    f_NstdPtysSubGrp_NoNestedPartySubIDs : int option;
    f_NstdPtysSubGrp_NestedPartySubID : fix_string option;
    f_NstdPtysSubGrp_NestedPartySubIDType : int option
}
;;

type fix_rg_nstdptyssubgrp = fix_rg_inner_nstdptyssubgrp list
;;

type fix_rg_inner_nstdptys3subgrp = {
    f_NstdPtys3SubGrp_NoNested3PartySubIDs : int option;
    f_NstdPtys3SubGrp_Nested3PartySubID : fix_string option;
    f_NstdPtys3SubGrp_Nested3PartySubIDType : int option
}
;;

type fix_rg_nstdptys3subgrp = fix_rg_inner_nstdptys3subgrp list
;;

type fix_orderqtydata = {
    (** One of CashOrderQty, OrderQty, or (for CIV only) OrderPercent is required. Note that unless otherwise specified, only one of CashOrderQty, OrderQty, or OrderPercent should be specified.*)
    f_OrderQtyData_OrderQty : fix_float_4 option;
    (** One of CashOrderQty, OrderQty, or (for CIV only) OrderPercent is required. Note that unless otherwise specified, only one of CashOrderQty, OrderQty, or OrderPercent should be specified. Specifies the approximate "monetary quantity" for the order. Broker is responsible for converting and calculating OrderQty in tradeable units (e.g. shares) for subsequent messages.*)
    f_OrderQtyData_CashOrderQty : fix_float_4 option;
    (** For CIV - Optional. One of CashOrderQty, OrderQty or (for CIV only) OrderPercent is required. Note that unless otherwise specified, only one of CashOrderQty, OrderQty, or OrderPercent should be specified.*)
    f_OrderQtyData_OrderPercent : fix_float_4 option;
    (** For CIV - Optional*)
    f_OrderQtyData_RoundingDirection : fix_roundingdirection option;
    (** For CIV - Optional*)
    f_OrderQtyData_RoundingModulus : fix_float_4 option
}
;;

type fix_rg_inner_contamtgrp = {
    f_ContAmtGrp_NoContAmts : int option;
    f_ContAmtGrp_ContAmtType : fix_contamttype option;
    f_ContAmtGrp_ContAmtValue : fix_float_4 option;
    f_ContAmtGrp_ContAmtCurr : fix_currency option
}
;;

type fix_rg_contamtgrp = fix_rg_inner_contamtgrp list
;;

type fix_rg_inner_legsecaltidgrp = {
    f_LegSecAltIDGrp_NoLegSecurityAltID : int option;
    f_LegSecAltIDGrp_LegSecurityAltID : fix_string option;
    f_LegSecAltIDGrp_LegSecurityAltIDSource : fix_string option
}
;;

type fix_rg_legsecaltidgrp = fix_rg_inner_legsecaltidgrp list
;;

type fix_rg_inner_evntgrp = {
    f_EvntGrp_NoEvents : int option;
    f_EvntGrp_EventType : fix_eventtype option;
    f_EvntGrp_EventDate : fix_localmktdate option;
    f_EvntGrp_EventPx : fix_float_4 option;
    f_EvntGrp_EventText : fix_string option
}
;;

type fix_rg_evntgrp = fix_rg_inner_evntgrp list
;;

type fix_rg_inner_compidreqgrp = {
    f_CompIDReqGrp_NoCompIDs : int option;
    f_CompIDReqGrp_RefCompID : fix_string option;
    f_CompIDReqGrp_RefSubID : fix_string option;
    f_CompIDReqGrp_LocationID : fix_string option;
    f_CompIDReqGrp_DeskID : fix_string option
}
;;

type fix_rg_compidreqgrp = fix_rg_inner_compidreqgrp list
;;

type fix_rg_inner_clrinstgrp = {
    f_ClrInstGrp_NoClearingInstructions : int option;
    f_ClrInstGrp_ClearingInstruction : fix_clearinginstruction option
}
;;

type fix_rg_clrinstgrp = fix_rg_inner_clrinstgrp list
;;

type fix_rg_inner_collinqqualgrp = {
    f_CollInqQualGrp_NoCollInquiryQualifier : int option;
    f_CollInqQualGrp_CollInquiryQualifier : fix_collinquiryqualifier option
}
;;

type fix_rg_collinqqualgrp = fix_rg_inner_collinqqualgrp list
;;

type fix_rg_inner_trdregtimestamps = {
    f_TrdRegTimestamps_NoTrdRegTimestamps : int option;
    (** Required if NoTrdRegTimestamps > 1*)
    f_TrdRegTimestamps_TrdRegTimestamp : fix_utctimestamp option;
    (** Required if NoTrdRegTimestamps > 1*)
    f_TrdRegTimestamps_TrdRegTimestampType : fix_trdregtimestamptype option;
    (** Optional*)
    f_TrdRegTimestamps_TrdRegTimestampOrigin : fix_string option
}
;;

type fix_rg_trdregtimestamps = fix_rg_inner_trdregtimestamps list
;;

type fix_rg_inner_underlyingstipulations = {
    f_UnderlyingStipulations_NoUnderlyingStips : int option;
    (** Required if NoUnderlyingStips >0*)
    f_UnderlyingStipulations_UnderlyingStipType : fix_string option;
    f_UnderlyingStipulations_UnderlyingStipValue : fix_string option
}
;;

type fix_rg_underlyingstipulations = fix_rg_inner_underlyingstipulations list
;;

type fix_rg_inner_cpctyconfgrp = {
    f_CpctyConfGrp_NoCapacities : int;
    f_CpctyConfGrp_OrderCapacity : fix_ordercapacity;
    f_CpctyConfGrp_OrderRestrictions : fix_orderrestrictions option;
    f_CpctyConfGrp_OrderCapacityQty : fix_float_4
}
;;

type fix_rg_cpctyconfgrp = fix_rg_inner_cpctyconfgrp list
;;

type fix_rg_inner_miscfeesgrp = {
    f_MiscFeesGrp_NoMiscFees : int option;
    f_MiscFeesGrp_MiscFeeAmt : fix_float_4 option;
    f_MiscFeesGrp_MiscFeeCurr : fix_currency option;
    f_MiscFeesGrp_MiscFeeType : fix_miscfeetype option;
    f_MiscFeesGrp_MiscFeeBasis : fix_miscfeebasis option
}
;;

type fix_rg_miscfeesgrp = fix_rg_inner_miscfeesgrp list
;;

type fix_financingdetails = {
    (** The full name of the base standard agreement, annexes and amendments in place between the principals and applicable to this deal*)
    f_FinancingDetails_AgreementDesc : fix_string option;
    (** A common reference to the applicable standing agreement between the principals*)
    f_FinancingDetails_AgreementID : fix_string option;
    (** A reference to the date the underlying agreement was executed.*)
    f_FinancingDetails_AgreementDate : fix_localmktdate option;
    (** Currency of the underlying agreement.*)
    f_FinancingDetails_AgreementCurrency : fix_currency option;
    (** For Repos the timing or method for terminating the agreement.*)
    f_FinancingDetails_TerminationType : fix_terminationtype option;
    (** Settlement date of the beginning of the deal*)
    f_FinancingDetails_StartDate : fix_localmktdate option;
    (** Repayment / repurchase date*)
    f_FinancingDetails_EndDate : fix_localmktdate option;
    (** Delivery or custody arrangement for the underlying securities*)
    f_FinancingDetails_DeliveryType : fix_deliverytype option;
    (** Percentage of cash value that underlying security collateral must meet.*)
    f_FinancingDetails_MarginRatio : fix_float_4 option
}
;;

type fix_rg_inner_trdcollgrp = {
    f_TrdCollGrp_NoTrades : int option;
    f_TrdCollGrp_TradeReportID : fix_string option;
    f_TrdCollGrp_SecondaryTradeReportID : fix_string option
}
;;

type fix_rg_trdcollgrp = fix_rg_inner_trdcollgrp list
;;

type fix_rg_inner_execallocgrp = {
    f_ExecAllocGrp_NoExecs : int option;
    f_ExecAllocGrp_LastQty : fix_float_4 option;
    f_ExecAllocGrp_ExecID : fix_string option;
    f_ExecAllocGrp_SecondaryExecID : fix_string option;
    f_ExecAllocGrp_LastPx : fix_float_4 option;
    f_ExecAllocGrp_LastParPx : fix_float_4 option;
    f_ExecAllocGrp_LastCapacity : fix_lastcapacity option
}
;;

type fix_rg_execallocgrp = fix_rg_inner_execallocgrp list
;;

type fix_rg_inner_mdfullgrp = {
    f_MDFullGrp_NoMDEntries : int;
    f_MDFullGrp_MDEntryType : fix_mdentrytype;
    f_MDFullGrp_MDEntryPx : fix_float_4 option;
    f_MDFullGrp_Currency : fix_currency option;
    f_MDFullGrp_MDEntrySize : fix_float_4 option;
    f_MDFullGrp_MDEntryDate : fix_utcdateonly option;
    f_MDFullGrp_MDEntryTime : fix_utctimeonly option;
    f_MDFullGrp_TickDirection : fix_tickdirection option;
    f_MDFullGrp_MDMkt : fix_exchange option;
    f_MDFullGrp_TradingSessionID : fix_string option;
    f_MDFullGrp_TradingSessionSubID : fix_string option;
    f_MDFullGrp_QuoteCondition : fix_quotecondition option;
    f_MDFullGrp_TradeCondition : fix_tradecondition option;
    f_MDFullGrp_MDEntryOriginator : fix_string option;
    f_MDFullGrp_LocationID : fix_string option;
    f_MDFullGrp_DeskID : fix_string option;
    f_MDFullGrp_OpenCloseSettlFlag : fix_openclosesettlflag option;
    f_MDFullGrp_TimeInForce : fix_timeinforce option;
    f_MDFullGrp_ExpireDate : fix_localmktdate option;
    f_MDFullGrp_ExpireTime : fix_utctimestamp option;
    f_MDFullGrp_MinQty : fix_float_4 option;
    f_MDFullGrp_ExecInst : fix_execinst option;
    f_MDFullGrp_SellerDays : int option;
    f_MDFullGrp_OrderID : fix_string option;
    f_MDFullGrp_QuoteEntryID : fix_string option;
    f_MDFullGrp_MDEntryBuyer : fix_string option;
    f_MDFullGrp_MDEntrySeller : fix_string option;
    f_MDFullGrp_NumberOfOrders : int option;
    f_MDFullGrp_MDEntryPositionNo : int option;
    f_MDFullGrp_Scope : fix_scope option;
    f_MDFullGrp_PriceDelta : fix_float_4 option;
    f_MDFullGrp_Text : fix_string option;
    f_MDFullGrp_EncodedTextLen : int option;
    f_MDFullGrp_EncodedText : fix_string option
}
;;

type fix_rg_mdfullgrp = fix_rg_inner_mdfullgrp list
;;

type fix_rg_inner_sectypesgrp = {
    f_SecTypesGrp_NoSecurityTypes : int option;
    f_SecTypesGrp_SecurityType : fix_securitytype option;
    f_SecTypesGrp_SecuritySubType : fix_string option;
    f_SecTypesGrp_Product : fix_product option;
    f_SecTypesGrp_CFICode : fix_string option
}
;;

type fix_rg_sectypesgrp = fix_rg_inner_sectypesgrp list
;;

type fix_rg_inner_compidstatgrp = {
    f_CompIDStatGrp_NoCompIDs : int;
    f_CompIDStatGrp_RefCompID : fix_string option;
    f_CompIDStatGrp_RefSubID : fix_string option;
    f_CompIDStatGrp_LocationID : fix_string option;
    f_CompIDStatGrp_DeskID : fix_string option;
    f_CompIDStatGrp_StatusValue : fix_statusvalue option;
    f_CompIDStatGrp_StatusText : fix_string option
}
;;

type fix_rg_compidstatgrp = fix_rg_inner_compidstatgrp list
;;

type fix_rg_inner_legstipulations = {
    f_LegStipulations_NoLegStipulations : int option;
    (** Required if NoLegStipulations >0*)
    f_LegStipulations_LegStipulationType : fix_string option;
    f_LegStipulations_LegStipulationValue : fix_string option
}
;;

type fix_rg_legstipulations = fix_rg_inner_legstipulations list
;;

type fix_legbenchmarkcurvedata = {
    f_LegBenchmarkCurveData_LegBenchmarkCurveCurrency : fix_currency option;
    f_LegBenchmarkCurveData_LegBenchmarkCurveName : fix_string option;
    f_LegBenchmarkCurveData_LegBenchmarkCurvePoint : fix_string option;
    f_LegBenchmarkCurveData_LegBenchmarkPrice : fix_float_4 option;
    f_LegBenchmarkCurveData_LegBenchmarkPriceType : int option
}
;;

type fix_rg_inner_allocackgrp = {
    f_AllocAckGrp_NoAllocs : int option;
    f_AllocAckGrp_AllocAccount : fix_string option;
    f_AllocAckGrp_AllocAcctIDSource : int option;
    f_AllocAckGrp_AllocPrice : fix_float_4 option;
    f_AllocAckGrp_IndividualAllocID : fix_string option;
    f_AllocAckGrp_IndividualAllocRejCode : int option;
    f_AllocAckGrp_AllocText : fix_string option;
    f_AllocAckGrp_EncodedAllocTextLen : int option;
    f_AllocAckGrp_EncodedAllocText : fix_string option
}
;;

type fix_rg_allocackgrp = fix_rg_inner_allocackgrp list
;;

type fix_rg_inner_contragrp = {
    f_ContraGrp_NoContraBrokers : int option;
    f_ContraGrp_ContraBroker : fix_string option;
    f_ContraGrp_ContraTrader : fix_string option;
    f_ContraGrp_ContraTradeQty : fix_float_4 option;
    f_ContraGrp_ContraTradeTime : fix_utctimestamp option;
    f_ContraGrp_ContraLegRefID : fix_string option
}
;;

type fix_rg_contragrp = fix_rg_inner_contragrp list
;;

type fix_rg_inner_mdreqgrp = {
    f_MDReqGrp_NoMDEntryTypes : int;
    f_MDReqGrp_MDEntryType : fix_mdentrytype
}
;;

type fix_rg_mdreqgrp = fix_rg_inner_mdreqgrp list
;;

type fix_rg_inner_stipulations = {
    f_Stipulations_NoStipulations : int option;
    (** Required if NoStipulations >0*)
    f_Stipulations_StipulationType : fix_stipulationtype option;
    f_Stipulations_StipulationValue : fix_string option
}
;;

type fix_rg_stipulations = fix_rg_inner_stipulations list
;;

type fix_rg_inner_quotqualgrp = {
    f_QuotQualGrp_NoQuoteQualifiers : int option;
    f_QuotQualGrp_QuoteQualifier : int option
}
;;

type fix_rg_quotqualgrp = fix_rg_inner_quotqualgrp list
;;

type fix_rg_inner_execcollgrp = {
    f_ExecCollGrp_NoExecs : int option;
    f_ExecCollGrp_ExecID : fix_string option
}
;;

type fix_rg_execcollgrp = fix_rg_inner_execcollgrp list
;;

type fix_peginstructions = {
    (** Amount (signed) added to the peg for a pegged order in the context of the PegOffsetType*)
    f_PegInstructions_PegOffsetValue : fix_float_4 option;
    (** Describes whether peg is static/fixed or floats*)
    f_PegInstructions_PegMoveType : fix_pegmovetype option;
    (** Type of Peg Offset (e.g. price offset, tick offset etc)*)
    f_PegInstructions_PegOffsetType : fix_pegoffsettype option;
    (** Specifies nature of resulting pegged price (e.g. or better limit, strict limit etc)*)
    f_PegInstructions_PegLimitType : fix_peglimittype option;
    (** If the calculated peg price is not a valid tick price, specifies how to round the price (e.g. be more or less aggressive)*)
    f_PegInstructions_PegRoundDirection : fix_pegrounddirection option;
    (** The scope of the "related to" price of the peg (e.g. local, global etc)*)
    f_PegInstructions_PegScope : fix_pegscope option
}
;;

type fix_rg_inner_linesoftextgrp = {
    f_LinesOfTextGrp_NoLinesOfText : int;
    f_LinesOfTextGrp_Text : fix_string;
    f_LinesOfTextGrp_EncodedTextLen : int option;
    f_LinesOfTextGrp_EncodedText : fix_string option
}
;;

type fix_rg_linesoftextgrp = fix_rg_inner_linesoftextgrp list
;;

type fix_rg_inner_secaltidgrp = {
    f_SecAltIDGrp_NoSecurityAltID : int option;
    f_SecAltIDGrp_SecurityAltID : fix_string option;
    f_SecAltIDGrp_SecurityAltIDSource : fix_string option
}
;;

type fix_rg_secaltidgrp = fix_rg_inner_secaltidgrp list
;;

type fix_rg_inner_affectedordgrp = {
    f_AffectedOrdGrp_NoAffectedOrders : int option;
    f_AffectedOrdGrp_OrigClOrdID : fix_string option;
    f_AffectedOrdGrp_AffectedOrderID : fix_string option;
    f_AffectedOrdGrp_AffectedSecondaryOrderID : fix_string option
}
;;

type fix_rg_affectedordgrp = fix_rg_inner_affectedordgrp list
;;

type fix_rg_inner_ordliststatgrp = {
    f_OrdListStatGrp_NoOrders : int;
    f_OrdListStatGrp_ClOrdID : fix_string;
    f_OrdListStatGrp_SecondaryClOrdID : fix_string option;
    f_OrdListStatGrp_CumQty : fix_float_4;
    f_OrdListStatGrp_OrdStatus : fix_ordstatus;
    f_OrdListStatGrp_WorkingIndicator : fix_workingindicator option;
    f_OrdListStatGrp_LeavesQty : fix_float_4;
    f_OrdListStatGrp_CxlQty : fix_float_4;
    f_OrdListStatGrp_AvgPx : fix_float_4;
    f_OrdListStatGrp_OrdRejReason : fix_ordrejreason option;
    f_OrdListStatGrp_Text : fix_string option;
    f_OrdListStatGrp_EncodedTextLen : int option;
    f_OrdListStatGrp_EncodedText : fix_string option
}
;;

type fix_rg_ordliststatgrp = fix_rg_inner_ordliststatgrp list
;;

type fix_rg_inner_ioiqualgrp = {
    f_IOIQualGrp_NoIOIQualifiers : int option;
    f_IOIQualGrp_IOIQualifier : fix_ioiqualifier option
}
;;

type fix_rg_ioiqualgrp = fix_rg_inner_ioiqualgrp list
;;

type fix_rg_inner_rgstdistinstgrp = {
    f_RgstDistInstGrp_NoDistribInsts : int option;
    f_RgstDistInstGrp_DistribPaymentMethod : fix_distribpaymentmethod option;
    f_RgstDistInstGrp_DistribPercentage : fix_float_4 option;
    f_RgstDistInstGrp_CashDistribCurr : fix_currency option;
    f_RgstDistInstGrp_CashDistribAgentName : fix_string option;
    f_RgstDistInstGrp_CashDistribAgentCode : fix_string option;
    f_RgstDistInstGrp_CashDistribAgentAcctNumber : fix_string option;
    f_RgstDistInstGrp_CashDistribPayRef : fix_string option;
    f_RgstDistInstGrp_CashDistribAgentAcctName : fix_string option
}
;;

type fix_rg_rgstdistinstgrp = fix_rg_inner_rgstdistinstgrp list
;;

type fix_interval = {
    f_interval_start_time : fix_utctimestamp;
    f_interval_duration : fix_duration
}
;;

type fix_yielddata = {
    f_YieldData_YieldType : fix_yieldtype option;
    f_YieldData_Yield : fix_float_4 option;
    f_YieldData_YieldCalcDate : fix_localmktdate option;
    f_YieldData_YieldRedemptionDate : fix_localmktdate option;
    f_YieldData_YieldRedemptionPrice : fix_float_4 option;
    f_YieldData_YieldRedemptionPriceType : int option
}
;;

type fix_rg_inner_routinggrp = {
    f_RoutingGrp_NoRoutingIDs : int option;
    f_RoutingGrp_RoutingType : fix_routingtype option;
    f_RoutingGrp_RoutingID : fix_string option
}
;;

type fix_rg_routinggrp = fix_rg_inner_routinggrp list
;;

type fix_spreadorbenchmarkcurvedata = {
    (** For Fixed Income*)
    f_SpreadOrBenchmarkCurveData_Spread : fix_float_4 option;
    f_SpreadOrBenchmarkCurveData_BenchmarkCurveCurrency : fix_currency option;
    f_SpreadOrBenchmarkCurveData_BenchmarkCurveName : fix_string option;
    f_SpreadOrBenchmarkCurveData_BenchmarkCurvePoint : fix_string option;
    f_SpreadOrBenchmarkCurveData_BenchmarkPrice : fix_float_4 option;
    (** Must be present if BenchmarkPrice is used.*)
    f_SpreadOrBenchmarkCurveData_BenchmarkPriceType : int option;
    (** The identifier of the benchmark security, e.g. Treasury against Corporate bond.*)
    f_SpreadOrBenchmarkCurveData_BenchmarkSecurityID : fix_string option;
    (** Source of BenchmarkSecurityID. If not specified, then ID Source is understood to be the same as that in the Instrument block.*)
    f_SpreadOrBenchmarkCurveData_BenchmarkSecurityIDSource : fix_string option
}
;;

type fix_rg_inner_bidcomprspgrp = {
    f_BidCompRspGrp_NoBidComponents : int;
    f_BidCompRspGrp_CommissionData : fix_commissiondata;
    f_BidCompRspGrp_ListID : fix_string option;
    f_BidCompRspGrp_Country : fix_country option;
    f_BidCompRspGrp_Side : fix_side option;
    f_BidCompRspGrp_Price : fix_float_4 option;
    f_BidCompRspGrp_PriceType : fix_pricetype option;
    f_BidCompRspGrp_FairValue : fix_float_4 option;
    f_BidCompRspGrp_NetGrossInd : fix_netgrossind option;
    f_BidCompRspGrp_SettlType : fix_settltype option;
    f_BidCompRspGrp_SettlDate : fix_localmktdate option;
    f_BidCompRspGrp_TradingSessionID : fix_string option;
    f_BidCompRspGrp_TradingSessionSubID : fix_string option;
    f_BidCompRspGrp_Text : fix_string option;
    f_BidCompRspGrp_EncodedTextLen : int option;
    f_BidCompRspGrp_EncodedText : fix_string option
}
;;

type fix_rg_bidcomprspgrp = fix_rg_inner_bidcomprspgrp list
;;

type fix_rg_inner_nestedparties2 = {
    (** Repeating group below should contain unique combinations of Nested2PartyID, Nested2PartyIDSource, and Nested2PartyRole*)
    f_NestedParties2_NoNested2PartyIDs : int option;
    (** Used to identify source of Nested2PartyID. Required if Nested2PartyIDSource is specified. Required if NoNested2PartyIDs > 0.*)
    f_NestedParties2_Nested2PartyID : fix_string option;
    (** Used to identify class source of Nested2PartyID value (e.g. BIC). Required if Nested2PartyID is specified. Required if NoNested2PartyIDs > 0.*)
    f_NestedParties2_Nested2PartyIDSource : int option;
    (** Identifies the type of Nested2PartyID (e.g. Executing Broker). Required if NoNested2PartyIDs > 0.*)
    f_NestedParties2_Nested2PartyRole : int option;
    (** Repeating group of Nested2Party sub-identifiers.*)
    f_NestedParties2_NstdPtys2SubGrp : fix_rg_nstdptys2subgrp
}
;;

type fix_rg_nestedparties2 = fix_rg_inner_nestedparties2 list
;;

type fix_rg_inner_settlparties = {
    (** Repeating group below should contain unique combinations of SettlPartyID, SettlPartyIDSource, and SettlPartyRole*)
    f_SettlParties_NoSettlPartyIDs : int option;
    (** Used to identify source of SettlPartyID. Required if SettlPartyIDSource is specified. Required if NoSettlPartyIDs > 0.*)
    f_SettlParties_SettlPartyID : fix_string option;
    (** Used to identify class source of SettlPartyID value (e.g. BIC). Required if SettlPartyID is specified. Required if NoSettlPartyIDs > 0.*)
    f_SettlParties_SettlPartyIDSource : int option;
    (** Identifies the type of SettlPartyID (e.g. Executing Broker). Required if NoSettlPartyIDs > 0.*)
    f_SettlParties_SettlPartyRole : int option;
    (** Repeating group of SettlParty sub-identifiers.*)
    f_SettlParties_SettlPtysSubGrp : fix_rg_settlptyssubgrp
}
;;

type fix_rg_settlparties = fix_rg_inner_settlparties list
;;

type fix_rg_inner_nestedparties = {
    (** Repeating group below should contain unique combinations of NestedPartyID, NestedPartyIDSource, and NestedPartyRole*)
    f_NestedParties_NoNestedPartyIDs : int option;
    (** Used to identify source of NestedPartyID. Required if NestedPartyIDSource is specified. Required if NoNestedPartyIDs > 0.*)
    f_NestedParties_NestedPartyID : fix_string option;
    (** Used to identify class source of NestedPartyID value (e.g. BIC). Required if NestedPartyID is specified. Required if NoNestedPartyIDs > 0.*)
    f_NestedParties_NestedPartyIDSource : int option;
    (** Identifies the type of NestedPartyID (e.g. Executing Broker). Required if NoNestedPartyIDs > 0.*)
    f_NestedParties_NestedPartyRole : int option;
    (** Repeating group of NestedParty sub-identifiers.*)
    f_NestedParties_NstdPtysSubGrp : fix_rg_nstdptyssubgrp
}
;;

type fix_rg_nestedparties = fix_rg_inner_nestedparties list
;;

type fix_instrumentleg = {
    f_InstrumentLeg_LegSymbol : fix_string option;
    f_InstrumentLeg_LegSymbolSfx : fix_string option;
    f_InstrumentLeg_LegSecurityID : fix_string option;
    f_InstrumentLeg_LegSecurityIDSource : fix_string option;
    f_InstrumentLeg_LegSecAltIDGrp : fix_rg_legsecaltidgrp;
    f_InstrumentLeg_LegProduct : int option;
    f_InstrumentLeg_LegCFICode : fix_string option;
    f_InstrumentLeg_LegSecurityType : fix_string option;
    f_InstrumentLeg_LegSecuritySubType : fix_string option;
    f_InstrumentLeg_LegMaturityMonthYear : fix_monthyear option;
    f_InstrumentLeg_LegMaturityDate : fix_localmktdate option;
    f_InstrumentLeg_LegCouponPaymentDate : fix_localmktdate option;
    f_InstrumentLeg_LegIssueDate : fix_localmktdate option;
    (** (Deprecated, not applicable/used for Repos)*)
    f_InstrumentLeg_LegRepoCollateralSecurityType : fix_string option;
    (** (Deprecated, not applicable/used for Repos)*)
    f_InstrumentLeg_LegRepurchaseTerm : int option;
    (** (Deprecated, not applicable/used for Repos)*)
    f_InstrumentLeg_LegRepurchaseRate : fix_float_4 option;
    f_InstrumentLeg_LegFactor : fix_float_4 option;
    f_InstrumentLeg_LegCreditRating : fix_string option;
    f_InstrumentLeg_LegInstrRegistry : fix_string option;
    f_InstrumentLeg_LegCountryOfIssue : fix_country option;
    f_InstrumentLeg_LegStateOrProvinceOfIssue : fix_string option;
    f_InstrumentLeg_LegLocaleOfIssue : fix_string option;
    (** (Deprecated, use YieldRedemptionDate (696) in <YieldData> component block)*)
    f_InstrumentLeg_LegRedemptionDate : fix_localmktdate option;
    f_InstrumentLeg_LegStrikePrice : fix_float_4 option;
    f_InstrumentLeg_LegStrikeCurrency : fix_currency option;
    f_InstrumentLeg_LegOptAttribute : int option;
    f_InstrumentLeg_LegContractMultiplier : fix_float_4 option;
    f_InstrumentLeg_LegCouponRate : fix_float_4 option;
    f_InstrumentLeg_LegSecurityExchange : fix_exchange option;
    f_InstrumentLeg_LegIssuer : fix_string option;
    f_InstrumentLeg_EncodedLegIssuerLen : int option;
    f_InstrumentLeg_EncodedLegIssuer : fix_string option;
    f_InstrumentLeg_LegSecurityDesc : fix_string option;
    f_InstrumentLeg_EncodedLegSecurityDescLen : int option;
    f_InstrumentLeg_EncodedLegSecurityDesc : fix_string option;
    (** Specific to the <InstrumentLeg> (not in <Instrument>)*)
    f_InstrumentLeg_LegRatioQty : fix_float_4 option;
    (** Specific to the <InstrumentLeg> (not in <Instrument>)*)
    f_InstrumentLeg_LegSide : int option;
    (** Specific to the <InstrumentLeg> (not in <Instrument>)*)
    f_InstrumentLeg_LegCurrency : fix_currency option;
    (** Identifies MBS / ABS pool*)
    f_InstrumentLeg_LegPool : fix_string option;
    f_InstrumentLeg_LegDatedDate : fix_localmktdate option;
    f_InstrumentLeg_LegContractSettlMonth : fix_monthyear option;
    f_InstrumentLeg_LegInterestAccrualDate : fix_localmktdate option
}
;;

type fix_instrument = {
    (** Common, "human understood" representation of the security. SecurityID value can be specified if no symbol exists (e.g. non-exchange traded Collective Investment Vehicles)
     Use "[N/A]" for products which do not have a symbol.*)
    f_Instrument_Symbol : fix_string option;
    (** Used in Fixed Income with a value of "WI" to indicate "When Issued" for a security to be reissued under an old CUSIP or ISIN or with a value of "CD" to indicate a EUCP with lump-sum interest rather than discount price.*)
    f_Instrument_SymbolSfx : fix_string option;
    (** Takes precedence in identifying security to counterparty over SecurityAltID block. Requires SecurityIDSource if specified.*)
    f_Instrument_SecurityID : fix_string option;
    (** Required if SecurityID is specified.*)
    f_Instrument_SecurityIDSource : fix_securityidsource option;
    (** Number of alternate Security Identifiers*)
    f_Instrument_SecAltIDGrp : fix_rg_secaltidgrp;
    (** Indicates the type of product the security is associated with (high-level category)*)
    f_Instrument_Product : fix_product option;
    (** Indicates the type of security using ISO 10962 standard, Classification of Financial Instruments (CFI code) values. It is recommended that CFICode be used instead of SecurityType for non-Fixed Income instruments.*)
    f_Instrument_CFICode : fix_string option;
    (** It is recommended that CFICode be used instead of SecurityType for non-Fixed Income instruments.
     Required for Fixed Income. Refer to Volume 7 - Fixed Income
     Futures and Options should be specified using the CFICode[461] field instead of SecurityType[167] (Refer to Volume 7 - Recommendations and Guidelines for Futures and Options Markets.)*)
    f_Instrument_SecurityType : fix_securitytype option;
    (** Sub-type qualification/identification of the SecurityType (e.g. for SecurityType="MLEG"). If specified, SecurityType is required.*)
    f_Instrument_SecuritySubType : fix_string option;
    (** Specifies the month and year of maturity. Applicable for standardized derivatives which are typically only referenced by month and year (e.g. S&P futures). Note MaturityDate (a full date) can also be specified.*)
    f_Instrument_MaturityMonthYear : fix_monthyear option;
    (** Specifies date of maturity (a full date). Note that standardized derivatives which are typically only referenced by month and year (e.g. S&P futures).may use MaturityMonthYear and/or this field.
     When using MaturityMonthYear, it is recommended that markets and sell sides report the MaturityDate on all outbound messages as a means of data enrichment.*)
    f_Instrument_MaturityDate : fix_localmktdate option;
    (** Date interest is to be paid. Used in identifying Corporate Bond issues.*)
    f_Instrument_CouponPaymentDate : fix_localmktdate option;
    (** Date instrument was issued. For Fixed Income IOIs for new issues, specifies the issue date.*)
    f_Instrument_IssueDate : fix_localmktdate option;
    (** (Deprecated, use UnderlyingSecurityType (310) )*)
    f_Instrument_RepoCollateralSecurityType : fix_string option;
    (** (Deprecated, use TerminationType (788) )*)
    f_Instrument_RepurchaseTerm : int option;
    (** (Deprecated, use Price (44) )*)
    f_Instrument_RepurchaseRate : fix_float_4 option;
    (** For Fixed Income: Amortization Factor for deriving Current face from Original face for ABS or MBS securities, note the fraction may be greater than, equal to or less than 1. In TIPS securities this is the Inflation index.
     Qty * Factor * Price = Gross Trade Amount
     For Derivatives: Contract Value Factor by which price must be adjusted to determine the true nominal value of one futures/options contract.
     (Qty * Price) * Factor = Nominal Value*)
    f_Instrument_Factor : fix_float_4 option;
    f_Instrument_CreditRating : fix_string option;
    (** The location at which records of ownership are maintained for this instrument, and at which ownership changes must be recorded. Can be used in conjunction with ISIN to address ISIN uniqueness issues.*)
    f_Instrument_InstrRegistry : fix_string option;
    (** ISO Country code of instrument issue (e.g. the country portion typically used in ISIN). Can be used in conjunction with non-ISIN SecurityID (e.g. CUSIP for Municipal Bonds without ISIN) to provide uniqueness.*)
    f_Instrument_CountryOfIssue : fix_country option;
    (** A two-character state or province abbreviation.*)
    f_Instrument_StateOrProvinceOfIssue : fix_string option;
    (** The three-character IATA code for a locale (e.g. airport code for Municipal Bonds).*)
    f_Instrument_LocaleOfIssue : fix_string option;
    (** (Deprecated, use YieldRedemptionDate (696) in <YieldData> component block)*)
    f_Instrument_RedemptionDate : fix_localmktdate option;
    (** Used for derivatives, such as options and covered warrants*)
    f_Instrument_StrikePrice : fix_float_4 option;
    (** Used for derivatives*)
    f_Instrument_StrikeCurrency : fix_currency option;
    (** Used for derivatives, such as options and covered warrants to indicate a versioning of the contract when required due to corporate actions to the underlying. Should not be used to indicate type of option - use the CFICode[461] for this purpose.*)
    f_Instrument_OptAttribute : int option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_Instrument_ContractMultiplier : fix_float_4 option;
    (** For Fixed Income.*)
    f_Instrument_CouponRate : fix_float_4 option;
    (** Can be used to identify the security.*)
    f_Instrument_SecurityExchange : fix_exchange option;
    f_Instrument_Issuer : fix_string option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_Instrument_EncodedIssuerLen : int option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_Instrument_EncodedIssuer : fix_string option;
    f_Instrument_SecurityDesc : fix_string option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_Instrument_EncodedSecurityDescLen : int option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_Instrument_EncodedSecurityDesc : fix_string option;
    (** Identifies MBS / ABS pool*)
    f_Instrument_Pool : fix_string option;
    (** Must be present for MBS/TBA*)
    f_Instrument_ContractSettlMonth : fix_monthyear option;
    (** The program under which a commercial paper is issued*)
    f_Instrument_CPProgram : fix_cpprogram option;
    (** The registration type of a commercial paper issuance*)
    f_Instrument_CPRegType : fix_string option;
    (** Number of repeating EventType group entries.*)
    f_Instrument_EvntGrp : fix_rg_evntgrp;
    (** If different from IssueDate*)
    f_Instrument_DatedDate : fix_localmktdate option;
    (** If different from IssueDate and DatedDate*)
    f_Instrument_InterestAccrualDate : fix_localmktdate option
}
;;

type fix_rg_inner_nestedparties3 = {
    (** Repeating group below should contain unique combinations of Nested3PartyID, Nested3PartyIDSource, and Nested3PartyRole*)
    f_NestedParties3_NoNested3PartyIDs : int option;
    (** Used to identify source of Nested3PartyID. Required if Nested3PartyIDSource is specified. Required if NoNested3PartyIDs > 0.*)
    f_NestedParties3_Nested3PartyID : fix_string option;
    (** Used to identify class source of Nested3PartyID value (e.g. BIC). Required if Nested3PartyID is specified. Required if NoNested3PartyIDs > 0.*)
    f_NestedParties3_Nested3PartyIDSource : int option;
    (** Identifies the type of Nested3PartyID (e.g. Executing Broker). Required if NoNested3PartyIDs > 0.*)
    f_NestedParties3_Nested3PartyRole : int option;
    (** Repeating group of Nested3Party sub-identifiers.*)
    f_NestedParties3_NstdPtys3SubGrp : fix_rg_nstdptys3subgrp
}
;;

type fix_rg_nestedparties3 = fix_rg_inner_nestedparties3 list
;;

type fix_instrumentextension = {
    (** Identifies the form of delivery.*)
    f_InstrumentExtension_DeliveryForm : fix_deliveryform option;
    (** Percent at risk due to lowest possible call.*)
    f_InstrumentExtension_PctAtRisk : fix_float_4 option;
    (** Number of repeating InstrAttrib group entries.*)
    f_InstrumentExtension_AttrbGrp : fix_rg_attrbgrp
}
;;

type fix_rg_inner_parties = {
    (** Repeating group below should contain unique combinations of PartyID, PartyIDSource, and PartyRole*)
    f_Parties_NoPartyIDs : int option;
    (** Used to identify source of PartyID. Required if PartyIDSource is specified. Required if NoPartyIDs > 0.*)
    f_Parties_PartyID : fix_string option;
    (** Used to identify class source of PartyID value (e.g. BIC). Required if PartyID is specified. Required if NoPartyIDs > 0.*)
    f_Parties_PartyIDSource : fix_partyidsource option;
    (** Identifies the type of PartyID (e.g. Executing Broker). Required if NoPartyIDs > 0.*)
    f_Parties_PartyRole : fix_partyrole option;
    (** Repeating group of Party sub-identifiers.*)
    f_Parties_PtysSubGrp : fix_rg_ptyssubgrp
}
;;

type fix_rg_parties = fix_rg_inner_parties list
;;

type fix_underlyinginstrument = {
    f_UnderlyingInstrument_UnderlyingSymbol : fix_string option;
    f_UnderlyingInstrument_UnderlyingSymbolSfx : fix_string option;
    f_UnderlyingInstrument_UnderlyingSecurityID : fix_string option;
    f_UnderlyingInstrument_UnderlyingSecurityIDSource : fix_string option;
    f_UnderlyingInstrument_UndSecAltIDGrp : fix_rg_undsecaltidgrp;
    f_UnderlyingInstrument_UnderlyingProduct : int option;
    f_UnderlyingInstrument_UnderlyingCFICode : fix_string option;
    f_UnderlyingInstrument_UnderlyingSecurityType : fix_string option;
    f_UnderlyingInstrument_UnderlyingSecuritySubType : fix_string option;
    f_UnderlyingInstrument_UnderlyingMaturityMonthYear : fix_monthyear option;
    f_UnderlyingInstrument_UnderlyingMaturityDate : fix_localmktdate option;
    f_UnderlyingInstrument_UnderlyingCouponPaymentDate : fix_localmktdate option;
    f_UnderlyingInstrument_UnderlyingIssueDate : fix_localmktdate option;
    (** (Deprecated, not applicable/used for Repos)*)
    f_UnderlyingInstrument_UnderlyingRepoCollateralSecurityType : fix_string option;
    (** (Deprecated, not applicable/used for Repos)*)
    f_UnderlyingInstrument_UnderlyingRepurchaseTerm : int option;
    (** (Deprecated, not applicable/used for Repos)*)
    f_UnderlyingInstrument_UnderlyingRepurchaseRate : fix_float_4 option;
    f_UnderlyingInstrument_UnderlyingFactor : fix_float_4 option;
    f_UnderlyingInstrument_UnderlyingCreditRating : fix_string option;
    f_UnderlyingInstrument_UnderlyingInstrRegistry : fix_string option;
    f_UnderlyingInstrument_UnderlyingCountryOfIssue : fix_country option;
    f_UnderlyingInstrument_UnderlyingStateOrProvinceOfIssue : fix_string option;
    f_UnderlyingInstrument_UnderlyingLocaleOfIssue : fix_string option;
    (** (Deprecated, use YieldRedemptionDate (696) in <YieldData> component block)*)
    f_UnderlyingInstrument_UnderlyingRedemptionDate : fix_localmktdate option;
    f_UnderlyingInstrument_UnderlyingStrikePrice : fix_float_4 option;
    f_UnderlyingInstrument_UnderlyingStrikeCurrency : fix_currency option;
    f_UnderlyingInstrument_UnderlyingOptAttribute : int option;
    f_UnderlyingInstrument_UnderlyingContractMultiplier : fix_float_4 option;
    f_UnderlyingInstrument_UnderlyingCouponRate : fix_float_4 option;
    f_UnderlyingInstrument_UnderlyingSecurityExchange : fix_exchange option;
    f_UnderlyingInstrument_UnderlyingIssuer : fix_string option;
    f_UnderlyingInstrument_EncodedUnderlyingIssuerLen : int option;
    f_UnderlyingInstrument_EncodedUnderlyingIssuer : fix_string option;
    f_UnderlyingInstrument_UnderlyingSecurityDesc : fix_string option;
    f_UnderlyingInstrument_EncodedUnderlyingSecurityDescLen : int option;
    f_UnderlyingInstrument_EncodedUnderlyingSecurityDesc : fix_string option;
    f_UnderlyingInstrument_UnderlyingCPProgram : fix_string option;
    f_UnderlyingInstrument_UnderlyingCPRegType : fix_string option;
    (** Specific to the <UnderlyingInstrument> (not in <Instrument>)*)
    f_UnderlyingInstrument_UnderlyingCurrency : fix_currency option;
    (** Specific to the <UnderlyingInstrument> (not in <Instrument>)
     Unit amount of the underlying security (par, shares, currency, etc.)*)
    f_UnderlyingInstrument_UnderlyingQty : fix_float_4 option;
    (** Specific to the <UnderlyingInstrument> (not in <Instrument>)
     In a financing deal clean price (percent-of-par or per unit) of the underlying security or basket.*)
    f_UnderlyingInstrument_UnderlyingPx : fix_float_4 option;
    (** Specific to the <UnderlyingInstrument> (not in <Instrument>)
     In a financing deal price (percent-of-par or per unit) of the underlying security or basket. "Dirty" means it includes accrued interest*)
    f_UnderlyingInstrument_UnderlyingDirtyPrice : fix_float_4 option;
    (** Specific to the <UnderlyingInstrument> (not in <Instrument>)
     In a financing deal price (percent-of-par or per unit) of the underlying security or basket at the end of the agreement.*)
    f_UnderlyingInstrument_UnderlyingEndPrice : fix_float_4 option;
    (** Specific to the <UnderlyingInstrument> (not in <Instrument>)
     Currency value attributed to this collateral at the start of the agreement*)
    f_UnderlyingInstrument_UnderlyingStartValue : fix_float_4 option;
    (** Specific to the <UnderlyingInstrument> (not in <Instrument>)
     Currency value currently attributed to this collateral*)
    f_UnderlyingInstrument_UnderlyingCurrentValue : fix_float_4 option;
    (** Specific to the <UnderlyingInstrument> (not in <Instrument>)
     Currency value attributed to this collateral at the end of the agreement*)
    f_UnderlyingInstrument_UnderlyingEndValue : fix_float_4 option;
    (** Specific to the <UnderlyingInstrument> (not in <Instrument>)
     Insert here the contents of the <UnderlyingStipulations> Component Block*)
    f_UnderlyingInstrument_UnderlyingStipulations : fix_rg_underlyingstipulations
}
;;

type fix_rg_inner_instrmtlegseclistgrp = {
    f_InstrmtLegSecListGrp_NoLegs : int option;
    f_InstrmtLegSecListGrp_InstrumentLeg : fix_instrumentleg;
    f_InstrmtLegSecListGrp_LegSwapType : fix_legswaptype option;
    f_InstrmtLegSecListGrp_LegSettlType : int option;
    f_InstrmtLegSecListGrp_LegStipulations : fix_rg_legstipulations;
    f_InstrmtLegSecListGrp_LegBenchmarkCurveData : fix_legbenchmarkcurvedata
}
;;

type fix_rg_instrmtlegseclistgrp = fix_rg_inner_instrmtlegseclistgrp list
;;

type fix_rg_inner_ordallocgrp = {
    f_OrdAllocGrp_NoOrders : int option;
    f_OrdAllocGrp_ClOrdID : fix_string option;
    f_OrdAllocGrp_OrderID : fix_string option;
    f_OrdAllocGrp_SecondaryOrderID : fix_string option;
    f_OrdAllocGrp_SecondaryClOrdID : fix_string option;
    f_OrdAllocGrp_ListID : fix_string option;
    f_OrdAllocGrp_NestedParties2 : fix_rg_nestedparties2;
    f_OrdAllocGrp_OrderQty : fix_float_4 option;
    f_OrdAllocGrp_OrderAvgPx : fix_float_4 option;
    f_OrdAllocGrp_OrderBookingQty : fix_float_4 option
}
;;

type fix_rg_ordallocgrp = fix_rg_inner_ordallocgrp list
;;

type fix_rg_inner_instrmtlegioigrp = {
    f_InstrmtLegIOIGrp_NoLegs : int option;
    f_InstrmtLegIOIGrp_InstrumentLeg : fix_instrumentleg;
    f_InstrmtLegIOIGrp_LegIOIQty : fix_string option;
    f_InstrmtLegIOIGrp_LegStipulations : fix_rg_legstipulations
}
;;

type fix_rg_instrmtlegioigrp = fix_rg_inner_instrmtlegioigrp list
;;

type fix_rg_inner_preallocgrp = {
    f_PreAllocGrp_NoAllocs : int option;
    f_PreAllocGrp_AllocAccount : fix_string option;
    f_PreAllocGrp_AllocAcctIDSource : int option;
    f_PreAllocGrp_AllocSettlCurrency : fix_currency option;
    f_PreAllocGrp_IndividualAllocID : fix_string option;
    f_PreAllocGrp_NestedParties : fix_rg_nestedparties;
    f_PreAllocGrp_AllocQty : fix_float_4 option
}
;;

type fix_rg_preallocgrp = fix_rg_inner_preallocgrp list
;;

type fix_rg_inner_rgstdtlsgrp = {
    f_RgstDtlsGrp_NoRegistDtls : int option;
    f_RgstDtlsGrp_RegistDtls : fix_string option;
    f_RgstDtlsGrp_RegistEmail : fix_string option;
    f_RgstDtlsGrp_MailingDtls : fix_string option;
    f_RgstDtlsGrp_MailingInst : fix_string option;
    f_RgstDtlsGrp_NestedParties : fix_rg_nestedparties;
    f_RgstDtlsGrp_OwnerType : fix_ownertype option;
    f_RgstDtlsGrp_DateOfBirth : fix_localmktdate option;
    f_RgstDtlsGrp_InvestorCountryOfResidence : fix_country option
}
;;

type fix_rg_rgstdtlsgrp = fix_rg_inner_rgstdtlsgrp list
;;

type fix_rg_inner_positionqty = {
    f_PositionQty_NoPositions : int option;
    (** Required if NoPositions > 1*)
    f_PositionQty_PosType : fix_postype option;
    f_PositionQty_LongQty : fix_float_4 option;
    f_PositionQty_ShortQty : fix_float_4 option;
    f_PositionQty_PosQtyStatus : fix_posqtystatus option;
    (** Optional repeating group - used to associate or distribute position to a specific party other than the party that currently owns the position.*)
    f_PositionQty_NestedParties : fix_rg_nestedparties
}
;;

type fix_rg_positionqty = fix_rg_inner_positionqty list
;;

type fix_rg_inner_quotreqlegsgrp = {
    f_QuotReqLegsGrp_NoLegs : int option;
    f_QuotReqLegsGrp_InstrumentLeg : fix_instrumentleg;
    f_QuotReqLegsGrp_LegQty : fix_float_4 option;
    f_QuotReqLegsGrp_LegSwapType : fix_legswaptype option;
    f_QuotReqLegsGrp_LegSettlType : int option;
    f_QuotReqLegsGrp_LegSettlDate : fix_localmktdate option;
    f_QuotReqLegsGrp_LegStipulations : fix_rg_legstipulations;
    f_QuotReqLegsGrp_NestedParties : fix_rg_nestedparties;
    f_QuotReqLegsGrp_LegBenchmarkCurveData : fix_legbenchmarkcurvedata
}
;;

type fix_rg_quotreqlegsgrp = fix_rg_inner_quotreqlegsgrp list
;;

type fix_rg_inner_undinstrmtstrkpxgrp = {
    f_UndInstrmtStrkPxGrp_NoUnderlyings : int option;
    f_UndInstrmtStrkPxGrp_UnderlyingInstrument : fix_underlyinginstrument;
    f_UndInstrmtStrkPxGrp_PrevClosePx : fix_float_4 option;
    f_UndInstrmtStrkPxGrp_ClOrdID : fix_string option;
    f_UndInstrmtStrkPxGrp_SecondaryClOrdID : fix_string option;
    f_UndInstrmtStrkPxGrp_Side : fix_side option;
    f_UndInstrmtStrkPxGrp_Price : fix_float_4;
    f_UndInstrmtStrkPxGrp_Currency : fix_currency option;
    f_UndInstrmtStrkPxGrp_Text : fix_string option;
    f_UndInstrmtStrkPxGrp_EncodedTextLen : int option;
    f_UndInstrmtStrkPxGrp_EncodedText : fix_string option
}
;;

type fix_rg_undinstrmtstrkpxgrp = fix_rg_inner_undinstrmtstrkpxgrp list
;;

type fix_rg_inner_trdinstrmtleggrp = {
    f_TrdInstrmtLegGrp_NoLegs : int option;
    f_TrdInstrmtLegGrp_InstrumentLeg : fix_instrumentleg;
    f_TrdInstrmtLegGrp_LegQty : fix_float_4 option;
    f_TrdInstrmtLegGrp_LegSwapType : fix_legswaptype option;
    f_TrdInstrmtLegGrp_LegStipulations : fix_rg_legstipulations;
    f_TrdInstrmtLegGrp_LegPositionEffect : int option;
    f_TrdInstrmtLegGrp_LegCoveredOrUncovered : int option;
    f_TrdInstrmtLegGrp_NestedParties : fix_rg_nestedparties;
    f_TrdInstrmtLegGrp_LegRefID : fix_string option;
    f_TrdInstrmtLegGrp_LegPrice : fix_float_4 option;
    f_TrdInstrmtLegGrp_LegSettlType : int option;
    f_TrdInstrmtLegGrp_LegSettlDate : fix_localmktdate option;
    f_TrdInstrmtLegGrp_LegLastPx : fix_float_4 option
}
;;

type fix_rg_trdinstrmtleggrp = fix_rg_inner_trdinstrmtleggrp list
;;

type fix_rg_inner_legquotgrp = {
    f_LegQuotGrp_NoLegs : int option;
    f_LegQuotGrp_InstrumentLeg : fix_instrumentleg;
    f_LegQuotGrp_LegQty : fix_float_4 option;
    f_LegQuotGrp_LegSwapType : fix_legswaptype option;
    f_LegQuotGrp_LegSettlType : int option;
    f_LegQuotGrp_LegSettlDate : fix_localmktdate option;
    f_LegQuotGrp_LegStipulations : fix_rg_legstipulations;
    f_LegQuotGrp_NestedParties : fix_rg_nestedparties;
    f_LegQuotGrp_LegPriceType : int option;
    f_LegQuotGrp_LegBidPx : fix_float_4 option;
    f_LegQuotGrp_LegOfferPx : fix_float_4 option;
    f_LegQuotGrp_LegBenchmarkCurveData : fix_legbenchmarkcurvedata
}
;;

type fix_rg_legquotgrp = fix_rg_inner_legquotgrp list
;;

type fix_rg_inner_instrmtleggrp = {
    f_InstrmtLegGrp_NoLegs : int option;
    f_InstrmtLegGrp_InstrumentLeg : fix_instrumentleg
}
;;

type fix_rg_instrmtleggrp = fix_rg_inner_instrmtleggrp list
;;

type fix_rg_inner_trdallocgrp = {
    f_TrdAllocGrp_NoAllocs : int option;
    f_TrdAllocGrp_AllocAccount : fix_string option;
    f_TrdAllocGrp_AllocAcctIDSource : int option;
    f_TrdAllocGrp_AllocSettlCurrency : fix_currency option;
    f_TrdAllocGrp_IndividualAllocID : fix_string option;
    f_TrdAllocGrp_NestedParties2 : fix_rg_nestedparties2;
    f_TrdAllocGrp_AllocQty : fix_float_4 option
}
;;

type fix_rg_trdallocgrp = fix_rg_inner_trdallocgrp list
;;

type fix_rg_inner_dlvyinstgrp = {
    f_DlvyInstGrp_NoDlvyInst : int option;
    f_DlvyInstGrp_SettlInstSource : fix_settlinstsource option;
    f_DlvyInstGrp_DlvyInstType : fix_dlvyinsttype option;
    f_DlvyInstGrp_SettlParties : fix_rg_settlparties
}
;;

type fix_rg_dlvyinstgrp = fix_rg_inner_dlvyinstgrp list
;;

type fix_rg_inner_sidecrossordcxlgrp = {
    f_SideCrossOrdCxlGrp_NoSides : int;
    f_SideCrossOrdCxlGrp_Side : fix_side;
    f_SideCrossOrdCxlGrp_OrigClOrdID : fix_string;
    f_SideCrossOrdCxlGrp_ClOrdID : fix_string;
    f_SideCrossOrdCxlGrp_SecondaryClOrdID : fix_string option;
    f_SideCrossOrdCxlGrp_ClOrdLinkID : fix_string option;
    f_SideCrossOrdCxlGrp_OrigOrdModTime : fix_utctimestamp option;
    f_SideCrossOrdCxlGrp_Parties : fix_rg_parties;
    f_SideCrossOrdCxlGrp_TradeOriginationDate : fix_localmktdate option;
    f_SideCrossOrdCxlGrp_TradeDate : fix_localmktdate option;
    f_SideCrossOrdCxlGrp_OrderQtyData : fix_orderqtydata;
    f_SideCrossOrdCxlGrp_ComplianceID : fix_string option;
    f_SideCrossOrdCxlGrp_Text : fix_string option;
    f_SideCrossOrdCxlGrp_EncodedTextLen : int option;
    f_SideCrossOrdCxlGrp_EncodedText : fix_string option
}
;;

type fix_rg_sidecrossordcxlgrp = fix_rg_inner_sidecrossordcxlgrp list
;;

type fix_rg_inner_undinstrmtcollgrp = {
    f_UndInstrmtCollGrp_NoUnderlyings : int option;
    f_UndInstrmtCollGrp_UnderlyingInstrument : fix_underlyinginstrument;
    f_UndInstrmtCollGrp_CollAction : fix_collaction option
}
;;

type fix_rg_undinstrmtcollgrp = fix_rg_inner_undinstrmtcollgrp list
;;

type fix_rg_inner_preallocmleggrp = {
    f_PreAllocMlegGrp_NoAllocs : int option;
    f_PreAllocMlegGrp_AllocAccount : fix_string option;
    f_PreAllocMlegGrp_AllocAcctIDSource : int option;
    f_PreAllocMlegGrp_AllocSettlCurrency : fix_currency option;
    f_PreAllocMlegGrp_IndividualAllocID : fix_string option;
    f_PreAllocMlegGrp_NestedParties3 : fix_rg_nestedparties3;
    f_PreAllocMlegGrp_AllocQty : fix_float_4 option
}
;;

type fix_rg_preallocmleggrp = fix_rg_inner_preallocmleggrp list
;;

type fix_rg_inner_undinstrmtgrp = {
    f_UndInstrmtGrp_NoUnderlyings : int option;
    f_UndInstrmtGrp_UnderlyingInstrument : fix_underlyinginstrument
}
;;

type fix_rg_undinstrmtgrp = fix_rg_inner_undinstrmtgrp list
;;

type fix_rg_inner_posundinstrmtgrp = {
    f_PosUndInstrmtGrp_NoUnderlyings : int option;
    f_PosUndInstrmtGrp_UnderlyingInstrument : fix_underlyinginstrument;
    f_PosUndInstrmtGrp_UnderlyingSettlPrice : fix_float_4;
    f_PosUndInstrmtGrp_UnderlyingSettlPriceType : int
}
;;

type fix_rg_posundinstrmtgrp = fix_rg_inner_posundinstrmtgrp list
;;

type fix_rg_inner_instrmtstrkpxgrp = {
    f_InstrmtStrkPxGrp_NoStrikes : int;
    f_InstrmtStrkPxGrp_Instrument : fix_instrument
}
;;

type fix_rg_instrmtstrkpxgrp = fix_rg_inner_instrmtstrkpxgrp list
;;

type fix_rg_inner_instrmtlegexecgrp = {
    f_InstrmtLegExecGrp_NoLegs : int option;
    f_InstrmtLegExecGrp_InstrumentLeg : fix_instrumentleg;
    f_InstrmtLegExecGrp_LegQty : fix_float_4 option;
    f_InstrmtLegExecGrp_LegSwapType : fix_legswaptype option;
    f_InstrmtLegExecGrp_LegStipulations : fix_rg_legstipulations;
    f_InstrmtLegExecGrp_LegPositionEffect : int option;
    f_InstrmtLegExecGrp_LegCoveredOrUncovered : int option;
    f_InstrmtLegExecGrp_NestedParties : fix_rg_nestedparties;
    f_InstrmtLegExecGrp_LegRefID : fix_string option;
    f_InstrmtLegExecGrp_LegPrice : fix_float_4 option;
    f_InstrmtLegExecGrp_LegSettlType : int option;
    f_InstrmtLegExecGrp_LegSettlDate : fix_localmktdate option;
    f_InstrmtLegExecGrp_LegLastPx : fix_float_4 option
}
;;

type fix_rg_instrmtlegexecgrp = fix_rg_inner_instrmtlegexecgrp list
;;

type fix_rg_inner_legquotstatgrp = {
    f_LegQuotStatGrp_NoLegs : int option;
    f_LegQuotStatGrp_InstrumentLeg : fix_instrumentleg;
    f_LegQuotStatGrp_LegQty : fix_float_4 option;
    f_LegQuotStatGrp_LegSwapType : fix_legswaptype option;
    f_LegQuotStatGrp_LegSettlType : int option;
    f_LegQuotStatGrp_LegSettlDate : fix_localmktdate option;
    f_LegQuotStatGrp_LegStipulations : fix_rg_legstipulations;
    f_LegQuotStatGrp_NestedParties : fix_rg_nestedparties
}
;;

type fix_rg_legquotstatgrp = fix_rg_inner_legquotstatgrp list
;;

type fix_rg_inner_instrmtgrp = {
    f_InstrmtGrp_NoRelatedSym : int option;
    f_InstrmtGrp_Instrument : fix_instrument
}
;;

type fix_rg_instrmtgrp = fix_rg_inner_instrmtgrp list
;;

type fix_rg_inner_legpreallocgrp = {
    f_LegPreAllocGrp_NoLegAllocs : int option;
    f_LegPreAllocGrp_LegAllocAccount : fix_string option;
    f_LegPreAllocGrp_LegIndividualAllocID : fix_string option;
    f_LegPreAllocGrp_NestedParties2 : fix_rg_nestedparties2;
    f_LegPreAllocGrp_LegAllocQty : fix_float_4 option;
    f_LegPreAllocGrp_LegAllocAcctIDSource : fix_string option;
    f_LegPreAllocGrp_LegSettlCurrency : fix_currency option
}
;;

type fix_rg_legpreallocgrp = fix_rg_inner_legpreallocgrp list
;;

type fix_rg_inner_quotreqgrp = {
    f_QuotReqGrp_NoRelatedSym : int;
    f_QuotReqGrp_Instrument : fix_instrument;
    f_QuotReqGrp_FinancingDetails : fix_financingdetails;
    f_QuotReqGrp_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    f_QuotReqGrp_PrevClosePx : fix_float_4 option;
    f_QuotReqGrp_QuoteRequestType : fix_quoterequesttype option;
    f_QuotReqGrp_QuoteType : fix_quotetype option;
    f_QuotReqGrp_TradingSessionID : fix_string option;
    f_QuotReqGrp_TradingSessionSubID : fix_string option;
    f_QuotReqGrp_TradeOriginationDate : fix_localmktdate option;
    f_QuotReqGrp_Side : fix_side option;
    f_QuotReqGrp_QtyType : fix_qtytype option;
    f_QuotReqGrp_OrderQtyData : fix_orderqtydata;
    f_QuotReqGrp_SettlType : fix_settltype option;
    f_QuotReqGrp_SettlDate : fix_localmktdate option;
    f_QuotReqGrp_SettlDate2 : fix_localmktdate option;
    f_QuotReqGrp_OrderQty2 : fix_float_4 option;
    f_QuotReqGrp_Currency : fix_currency option;
    f_QuotReqGrp_Stipulations : fix_rg_stipulations;
    f_QuotReqGrp_Account : fix_string option;
    f_QuotReqGrp_AcctIDSource : fix_acctidsource option;
    f_QuotReqGrp_AccountType : fix_accounttype option;
    f_QuotReqGrp_QuotReqLegsGrp : fix_rg_quotreqlegsgrp;
    f_QuotReqGrp_QuotQualGrp : fix_rg_quotqualgrp;
    f_QuotReqGrp_QuotePriceType : fix_quotepricetype option;
    f_QuotReqGrp_OrdType : fix_ordtype option;
    f_QuotReqGrp_ValidUntilTime : fix_utctimestamp option;
    f_QuotReqGrp_ExpireTime : fix_utctimestamp option;
    f_QuotReqGrp_TransactTime : fix_utctimestamp option;
    f_QuotReqGrp_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    f_QuotReqGrp_PriceType : fix_pricetype option;
    f_QuotReqGrp_Price : fix_float_4 option;
    f_QuotReqGrp_Price2 : fix_float_4 option;
    f_QuotReqGrp_YieldData : fix_yielddata;
    f_QuotReqGrp_Parties : fix_rg_parties
}
;;

type fix_rg_quotreqgrp = fix_rg_inner_quotreqgrp list
;;

type fix_rg_inner_quotentrygrp = {
    f_QuotEntryGrp_NoQuoteEntries : int;
    f_QuotEntryGrp_QuoteEntryID : fix_string;
    f_QuotEntryGrp_Instrument : fix_instrument;
    f_QuotEntryGrp_InstrmtLegGrp : fix_rg_instrmtleggrp;
    f_QuotEntryGrp_BidPx : fix_float_4 option;
    f_QuotEntryGrp_OfferPx : fix_float_4 option;
    f_QuotEntryGrp_BidSize : fix_float_4 option;
    f_QuotEntryGrp_OfferSize : fix_float_4 option;
    f_QuotEntryGrp_ValidUntilTime : fix_utctimestamp option;
    f_QuotEntryGrp_BidSpotRate : fix_float_4 option;
    f_QuotEntryGrp_OfferSpotRate : fix_float_4 option;
    f_QuotEntryGrp_BidForwardPoints : fix_float_4 option;
    f_QuotEntryGrp_OfferForwardPoints : fix_float_4 option;
    f_QuotEntryGrp_MidPx : fix_float_4 option;
    f_QuotEntryGrp_BidYield : fix_float_4 option;
    f_QuotEntryGrp_MidYield : fix_float_4 option;
    f_QuotEntryGrp_OfferYield : fix_float_4 option;
    f_QuotEntryGrp_TransactTime : fix_utctimestamp option;
    f_QuotEntryGrp_TradingSessionID : fix_string option;
    f_QuotEntryGrp_TradingSessionSubID : fix_string option;
    f_QuotEntryGrp_SettlDate : fix_localmktdate option;
    f_QuotEntryGrp_OrdType : fix_ordtype option;
    f_QuotEntryGrp_SettlDate2 : fix_localmktdate option;
    f_QuotEntryGrp_OrderQty2 : fix_float_4 option;
    f_QuotEntryGrp_BidForwardPoints2 : fix_float_4 option;
    f_QuotEntryGrp_OfferForwardPoints2 : fix_float_4 option;
    f_QuotEntryGrp_Currency : fix_currency option
}
;;

type fix_rg_quotentrygrp = fix_rg_inner_quotentrygrp list
;;

type fix_rg_inner_legordgrp = {
    f_LegOrdGrp_NoLegs : int;
    f_LegOrdGrp_InstrumentLeg : fix_instrumentleg;
    f_LegOrdGrp_LegQty : fix_float_4 option;
    f_LegOrdGrp_LegSwapType : fix_legswaptype option;
    f_LegOrdGrp_LegStipulations : fix_rg_legstipulations;
    f_LegOrdGrp_LegPreAllocGrp : fix_rg_legpreallocgrp;
    f_LegOrdGrp_LegPositionEffect : int option;
    f_LegOrdGrp_LegCoveredOrUncovered : int option;
    f_LegOrdGrp_NestedParties : fix_rg_nestedparties;
    f_LegOrdGrp_LegRefID : fix_string option;
    f_LegOrdGrp_LegPrice : fix_float_4 option;
    f_LegOrdGrp_LegSettlType : int option;
    f_LegOrdGrp_LegSettlDate : fix_localmktdate option
}
;;

type fix_rg_legordgrp = fix_rg_inner_legordgrp list
;;

type fix_rg_inner_trdcaprptsidegrp = {
    f_TrdCapRptSideGrp_NoSides : int;
    f_TrdCapRptSideGrp_Side : fix_side;
    f_TrdCapRptSideGrp_OrderID : fix_string;
    f_TrdCapRptSideGrp_SecondaryOrderID : fix_string option;
    f_TrdCapRptSideGrp_ClOrdID : fix_string option;
    f_TrdCapRptSideGrp_SecondaryClOrdID : fix_string option;
    f_TrdCapRptSideGrp_ListID : fix_string option;
    f_TrdCapRptSideGrp_Parties : fix_rg_parties;
    f_TrdCapRptSideGrp_Account : fix_string option;
    f_TrdCapRptSideGrp_AcctIDSource : fix_acctidsource option;
    f_TrdCapRptSideGrp_AccountType : fix_accounttype option;
    f_TrdCapRptSideGrp_ProcessCode : fix_processcode option;
    f_TrdCapRptSideGrp_OddLot : fix_oddlot option;
    f_TrdCapRptSideGrp_ClrInstGrp : fix_rg_clrinstgrp;
    f_TrdCapRptSideGrp_TradeInputSource : fix_string option;
    f_TrdCapRptSideGrp_TradeInputDevice : fix_string option;
    f_TrdCapRptSideGrp_OrderInputDevice : fix_string option;
    f_TrdCapRptSideGrp_Currency : fix_currency option;
    f_TrdCapRptSideGrp_ComplianceID : fix_string option;
    f_TrdCapRptSideGrp_SolicitedFlag : fix_solicitedflag option;
    f_TrdCapRptSideGrp_OrderCapacity : fix_ordercapacity option;
    f_TrdCapRptSideGrp_OrderRestrictions : fix_orderrestrictions option;
    f_TrdCapRptSideGrp_CustOrderCapacity : fix_custordercapacity option;
    f_TrdCapRptSideGrp_OrdType : fix_ordtype option;
    f_TrdCapRptSideGrp_ExecInst : fix_execinst option;
    f_TrdCapRptSideGrp_TransBkdTime : fix_utctimestamp option;
    f_TrdCapRptSideGrp_TradingSessionID : fix_string option;
    f_TrdCapRptSideGrp_TradingSessionSubID : fix_string option;
    f_TrdCapRptSideGrp_TimeBracket : fix_string option;
    f_TrdCapRptSideGrp_CommissionData : fix_commissiondata;
    f_TrdCapRptSideGrp_GrossTradeAmt : fix_float_4 option;
    f_TrdCapRptSideGrp_NumDaysInterest : int option;
    f_TrdCapRptSideGrp_ExDate : fix_localmktdate option;
    f_TrdCapRptSideGrp_AccruedInterestRate : fix_float_4 option;
    f_TrdCapRptSideGrp_AccruedInterestAmt : fix_float_4 option;
    f_TrdCapRptSideGrp_InterestAtMaturity : fix_float_4 option;
    f_TrdCapRptSideGrp_EndAccruedInterestAmt : fix_float_4 option;
    f_TrdCapRptSideGrp_StartCash : fix_float_4 option;
    f_TrdCapRptSideGrp_EndCash : fix_float_4 option;
    f_TrdCapRptSideGrp_Concession : fix_float_4 option;
    f_TrdCapRptSideGrp_TotalTakedown : fix_float_4 option;
    f_TrdCapRptSideGrp_NetMoney : fix_float_4 option;
    f_TrdCapRptSideGrp_SettlCurrAmt : fix_float_4 option;
    f_TrdCapRptSideGrp_SettlCurrency : fix_currency option;
    f_TrdCapRptSideGrp_SettlCurrFxRate : fix_float_4 option;
    f_TrdCapRptSideGrp_SettlCurrFxRateCalc : fix_settlcurrfxratecalc option;
    f_TrdCapRptSideGrp_PositionEffect : fix_positioneffect option;
    f_TrdCapRptSideGrp_Text : fix_string option;
    f_TrdCapRptSideGrp_EncodedTextLen : int option;
    f_TrdCapRptSideGrp_EncodedText : fix_string option;
    f_TrdCapRptSideGrp_SideMultiLegReportingType : fix_sidemultilegreportingtype option;
    f_TrdCapRptSideGrp_ContAmtGrp : fix_rg_contamtgrp;
    f_TrdCapRptSideGrp_Stipulations : fix_rg_stipulations;
    f_TrdCapRptSideGrp_MiscFeesGrp : fix_rg_miscfeesgrp;
    f_TrdCapRptSideGrp_ExchangeRule : fix_string option;
    f_TrdCapRptSideGrp_TradeAllocIndicator : fix_tradeallocindicator option;
    f_TrdCapRptSideGrp_PreallocMethod : fix_preallocmethod option;
    f_TrdCapRptSideGrp_AllocID : fix_string option;
    f_TrdCapRptSideGrp_TrdAllocGrp : fix_rg_trdallocgrp
}
;;

type fix_rg_trdcaprptsidegrp = fix_rg_inner_trdcaprptsidegrp list
;;

type fix_rg_inner_listordgrp = {
    f_ListOrdGrp_NoOrders : int;
    f_ListOrdGrp_ClOrdID : fix_string;
    f_ListOrdGrp_SecondaryClOrdID : fix_string option;
    f_ListOrdGrp_ListSeqNo : int;
    f_ListOrdGrp_ClOrdLinkID : fix_string option;
    f_ListOrdGrp_SettlInstMode : fix_settlinstmode option;
    f_ListOrdGrp_Parties : fix_rg_parties;
    f_ListOrdGrp_TradeOriginationDate : fix_localmktdate option;
    f_ListOrdGrp_TradeDate : fix_localmktdate option;
    f_ListOrdGrp_Account : fix_string option;
    f_ListOrdGrp_AcctIDSource : fix_acctidsource option;
    f_ListOrdGrp_AccountType : fix_accounttype option;
    f_ListOrdGrp_DayBookingInst : fix_daybookinginst option;
    f_ListOrdGrp_BookingUnit : fix_bookingunit option;
    f_ListOrdGrp_AllocID : fix_string option;
    f_ListOrdGrp_PreallocMethod : fix_preallocmethod option;
    f_ListOrdGrp_PreAllocGrp : fix_rg_preallocgrp;
    f_ListOrdGrp_SettlType : fix_settltype option;
    f_ListOrdGrp_SettlDate : fix_localmktdate option;
    f_ListOrdGrp_CashMargin : fix_cashmargin option;
    f_ListOrdGrp_ClearingFeeIndicator : fix_clearingfeeindicator option;
    f_ListOrdGrp_HandlInst : fix_handlinst option;
    f_ListOrdGrp_ExecInst : fix_execinst option;
    f_ListOrdGrp_MinQty : fix_float_4 option;
    f_ListOrdGrp_MaxFloor : fix_float_4 option;
    f_ListOrdGrp_ExDestination : fix_exchange option;
    f_ListOrdGrp_TrdgSesGrp : fix_rg_trdgsesgrp;
    f_ListOrdGrp_ProcessCode : fix_processcode option;
    f_ListOrdGrp_Instrument : fix_instrument;
    f_ListOrdGrp_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    f_ListOrdGrp_PrevClosePx : fix_float_4 option;
    f_ListOrdGrp_Side : fix_side;
    f_ListOrdGrp_SideValueInd : fix_sidevalueind option;
    f_ListOrdGrp_LocateReqd : fix_locatereqd option;
    f_ListOrdGrp_TransactTime : fix_utctimestamp option;
    f_ListOrdGrp_Stipulations : fix_rg_stipulations;
    f_ListOrdGrp_QtyType : fix_qtytype option;
    f_ListOrdGrp_OrderQtyData : fix_orderqtydata;
    f_ListOrdGrp_OrdType : fix_ordtype option;
    f_ListOrdGrp_PriceType : fix_pricetype option;
    f_ListOrdGrp_Price : fix_float_4 option;
    f_ListOrdGrp_StopPx : fix_float_4 option;
    f_ListOrdGrp_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    f_ListOrdGrp_YieldData : fix_yielddata;
    f_ListOrdGrp_Currency : fix_currency option;
    f_ListOrdGrp_ComplianceID : fix_string option;
    f_ListOrdGrp_SolicitedFlag : fix_solicitedflag option;
    f_ListOrdGrp_IOIID : fix_string option;
    f_ListOrdGrp_QuoteID : fix_string option;
    f_ListOrdGrp_TimeInForce : fix_timeinforce option;
    f_ListOrdGrp_EffectiveTime : fix_utctimestamp option;
    f_ListOrdGrp_ExpireDate : fix_localmktdate option;
    f_ListOrdGrp_ExpireTime : fix_utctimestamp option;
    f_ListOrdGrp_GTBookingInst : fix_gtbookinginst option;
    f_ListOrdGrp_CommissionData : fix_commissiondata;
    f_ListOrdGrp_OrderCapacity : fix_ordercapacity option;
    f_ListOrdGrp_OrderRestrictions : fix_orderrestrictions option;
    f_ListOrdGrp_CustOrderCapacity : fix_custordercapacity option;
    f_ListOrdGrp_ForexReq : fix_forexreq option;
    f_ListOrdGrp_SettlCurrency : fix_currency option;
    f_ListOrdGrp_BookingType : fix_bookingtype option;
    f_ListOrdGrp_Text : fix_string option;
    f_ListOrdGrp_EncodedTextLen : int option;
    f_ListOrdGrp_EncodedText : fix_string option;
    f_ListOrdGrp_SettlDate2 : fix_localmktdate option;
    f_ListOrdGrp_OrderQty2 : fix_float_4 option;
    f_ListOrdGrp_Price2 : fix_float_4 option;
    f_ListOrdGrp_PositionEffect : fix_positioneffect option;
    f_ListOrdGrp_CoveredOrUncovered : fix_coveredoruncovered option;
    f_ListOrdGrp_MaxShow : fix_float_4 option;
    f_ListOrdGrp_PegInstructions : fix_peginstructions;
    f_ListOrdGrp_DiscretionInstructions : fix_discretioninstructions;
    f_ListOrdGrp_TargetStrategy : fix_targetstrategy option;
    f_ListOrdGrp_TargetStrategyParameters : fix_string option;
    f_ListOrdGrp_ParticipationRate : fix_float_4 option;
    f_ListOrdGrp_Designation : fix_string option
}
;;

type fix_rg_listordgrp = fix_rg_inner_listordgrp list
;;

type fix_rg_inner_rfqreqgrp = {
    f_RFQReqGrp_NoRelatedSym : int;
    f_RFQReqGrp_Instrument : fix_instrument;
    f_RFQReqGrp_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    f_RFQReqGrp_InstrmtLegGrp : fix_rg_instrmtleggrp;
    f_RFQReqGrp_PrevClosePx : fix_float_4 option;
    f_RFQReqGrp_QuoteRequestType : fix_quoterequesttype option;
    f_RFQReqGrp_QuoteType : fix_quotetype option;
    f_RFQReqGrp_TradingSessionID : fix_string option;
    f_RFQReqGrp_TradingSessionSubID : fix_string option
}
;;

type fix_rg_rfqreqgrp = fix_rg_inner_rfqreqgrp list
;;

type fix_rg_inner_instrmtmdreqgrp = {
    f_InstrmtMDReqGrp_NoRelatedSym : int;
    f_InstrmtMDReqGrp_Instrument : fix_instrument;
    f_InstrmtMDReqGrp_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    f_InstrmtMDReqGrp_InstrmtLegGrp : fix_rg_instrmtleggrp
}
;;

type fix_rg_instrmtmdreqgrp = fix_rg_inner_instrmtmdreqgrp list
;;

type fix_rg_inner_sidecrossordmodgrp = {
    f_SideCrossOrdModGrp_NoSides : int;
    f_SideCrossOrdModGrp_Side : fix_side;
    f_SideCrossOrdModGrp_ClOrdID : fix_string;
    f_SideCrossOrdModGrp_SecondaryClOrdID : fix_string option;
    f_SideCrossOrdModGrp_ClOrdLinkID : fix_string option;
    f_SideCrossOrdModGrp_Parties : fix_rg_parties;
    f_SideCrossOrdModGrp_TradeOriginationDate : fix_localmktdate option;
    f_SideCrossOrdModGrp_TradeDate : fix_localmktdate option;
    f_SideCrossOrdModGrp_Account : fix_string option;
    f_SideCrossOrdModGrp_AcctIDSource : fix_acctidsource option;
    f_SideCrossOrdModGrp_AccountType : fix_accounttype option;
    f_SideCrossOrdModGrp_DayBookingInst : fix_daybookinginst option;
    f_SideCrossOrdModGrp_BookingUnit : fix_bookingunit option;
    f_SideCrossOrdModGrp_PreallocMethod : fix_preallocmethod option;
    f_SideCrossOrdModGrp_AllocID : fix_string option;
    f_SideCrossOrdModGrp_PreAllocGrp : fix_rg_preallocgrp;
    f_SideCrossOrdModGrp_QtyType : fix_qtytype option;
    f_SideCrossOrdModGrp_OrderQtyData : fix_orderqtydata;
    f_SideCrossOrdModGrp_CommissionData : fix_commissiondata;
    f_SideCrossOrdModGrp_OrderCapacity : fix_ordercapacity option;
    f_SideCrossOrdModGrp_OrderRestrictions : fix_orderrestrictions option;
    f_SideCrossOrdModGrp_CustOrderCapacity : fix_custordercapacity option;
    f_SideCrossOrdModGrp_ForexReq : fix_forexreq option;
    f_SideCrossOrdModGrp_SettlCurrency : fix_currency option;
    f_SideCrossOrdModGrp_BookingType : fix_bookingtype option;
    f_SideCrossOrdModGrp_Text : fix_string option;
    f_SideCrossOrdModGrp_EncodedTextLen : int option;
    f_SideCrossOrdModGrp_EncodedText : fix_string option;
    f_SideCrossOrdModGrp_PositionEffect : fix_positioneffect option;
    f_SideCrossOrdModGrp_CoveredOrUncovered : fix_coveredoruncovered option;
    f_SideCrossOrdModGrp_CashMargin : fix_cashmargin option;
    f_SideCrossOrdModGrp_ClearingFeeIndicator : fix_clearingfeeindicator option;
    f_SideCrossOrdModGrp_SolicitedFlag : fix_solicitedflag option;
    f_SideCrossOrdModGrp_SideComplianceID : fix_string option
}
;;

type fix_rg_sidecrossordmodgrp = fix_rg_inner_sidecrossordmodgrp list
;;

type fix_rg_inner_seclistgrp = {
    f_SecListGrp_NoRelatedSym : int option;
    f_SecListGrp_Instrument : fix_instrument;
    f_SecListGrp_InstrumentExtension : fix_instrumentextension;
    f_SecListGrp_FinancingDetails : fix_financingdetails;
    f_SecListGrp_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    f_SecListGrp_Currency : fix_currency option;
    f_SecListGrp_Stipulations : fix_rg_stipulations;
    f_SecListGrp_InstrmtLegSecListGrp : fix_rg_instrmtlegseclistgrp;
    f_SecListGrp_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    f_SecListGrp_YieldData : fix_yielddata;
    f_SecListGrp_RoundLot : fix_float_4 option;
    f_SecListGrp_MinTradeVol : fix_float_4 option;
    f_SecListGrp_TradingSessionID : fix_string option;
    f_SecListGrp_TradingSessionSubID : fix_string option;
    f_SecListGrp_ExpirationCycle : fix_expirationcycle option;
    f_SecListGrp_Text : fix_string option;
    f_SecListGrp_EncodedTextLen : int option;
    f_SecListGrp_EncodedText : fix_string option
}
;;

type fix_rg_seclistgrp = fix_rg_inner_seclistgrp list
;;

type fix_settlinstructionsdata = {
    (** Required if AllocSettlInstType = 1 or 2*)
    f_SettlInstructionsData_SettlDeliveryType : fix_settldeliverytype option;
    (** Required if AllocSettlInstType = 3 (should not be populated otherwise)*)
    f_SettlInstructionsData_StandInstDbType : fix_standinstdbtype option;
    (** Required if AllocSettlInstType = 3 (should not be populated otherwise)*)
    f_SettlInstructionsData_StandInstDbName : fix_string option;
    (** Identifier used within the StandInstDbType
     Required if AllocSettlInstType = 3 (should not be populated otherwise)*)
    f_SettlInstructionsData_StandInstDbID : fix_string option;
    (** Required (and must be > 0) if AllocSettlInstType = 2 (should not be populated otherwise)*)
    f_SettlInstructionsData_DlvyInstGrp : fix_rg_dlvyinstgrp
}
;;

type fix_rg_inner_quotentryackgrp = {
    f_QuotEntryAckGrp_NoQuoteEntries : int option;
    f_QuotEntryAckGrp_QuoteEntryID : fix_string option;
    f_QuotEntryAckGrp_Instrument : fix_instrument;
    f_QuotEntryAckGrp_InstrmtLegGrp : fix_rg_instrmtleggrp;
    f_QuotEntryAckGrp_BidPx : fix_float_4 option;
    f_QuotEntryAckGrp_OfferPx : fix_float_4 option;
    f_QuotEntryAckGrp_BidSize : fix_float_4 option;
    f_QuotEntryAckGrp_OfferSize : fix_float_4 option;
    f_QuotEntryAckGrp_ValidUntilTime : fix_utctimestamp option;
    f_QuotEntryAckGrp_BidSpotRate : fix_float_4 option;
    f_QuotEntryAckGrp_OfferSpotRate : fix_float_4 option;
    f_QuotEntryAckGrp_BidForwardPoints : fix_float_4 option;
    f_QuotEntryAckGrp_OfferForwardPoints : fix_float_4 option;
    f_QuotEntryAckGrp_MidPx : fix_float_4 option;
    f_QuotEntryAckGrp_BidYield : fix_float_4 option;
    f_QuotEntryAckGrp_MidYield : fix_float_4 option;
    f_QuotEntryAckGrp_OfferYield : fix_float_4 option;
    f_QuotEntryAckGrp_TransactTime : fix_utctimestamp option;
    f_QuotEntryAckGrp_TradingSessionID : fix_string option;
    f_QuotEntryAckGrp_TradingSessionSubID : fix_string option;
    f_QuotEntryAckGrp_SettlDate : fix_localmktdate option;
    f_QuotEntryAckGrp_OrdType : fix_ordtype option;
    f_QuotEntryAckGrp_SettlDate2 : fix_localmktdate option;
    f_QuotEntryAckGrp_OrderQty2 : fix_float_4 option;
    f_QuotEntryAckGrp_BidForwardPoints2 : fix_float_4 option;
    f_QuotEntryAckGrp_OfferForwardPoints2 : fix_float_4 option;
    f_QuotEntryAckGrp_Currency : fix_currency option;
    f_QuotEntryAckGrp_QuoteEntryRejectReason : int option
}
;;

type fix_rg_quotentryackgrp = fix_rg_inner_quotentryackgrp list
;;

type fix_rg_inner_quotreqrjctgrp = {
    f_QuotReqRjctGrp_NoRelatedSym : int;
    f_QuotReqRjctGrp_Instrument : fix_instrument;
    f_QuotReqRjctGrp_FinancingDetails : fix_financingdetails;
    f_QuotReqRjctGrp_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    f_QuotReqRjctGrp_PrevClosePx : fix_float_4 option;
    f_QuotReqRjctGrp_QuoteRequestType : fix_quoterequesttype option;
    f_QuotReqRjctGrp_QuoteType : fix_quotetype option;
    f_QuotReqRjctGrp_TradingSessionID : fix_string option;
    f_QuotReqRjctGrp_TradingSessionSubID : fix_string option;
    f_QuotReqRjctGrp_TradeOriginationDate : fix_localmktdate option;
    f_QuotReqRjctGrp_Side : fix_side option;
    f_QuotReqRjctGrp_QtyType : fix_qtytype option;
    f_QuotReqRjctGrp_OrderQtyData : fix_orderqtydata;
    f_QuotReqRjctGrp_SettlType : fix_settltype option;
    f_QuotReqRjctGrp_SettlDate : fix_localmktdate option;
    f_QuotReqRjctGrp_SettlDate2 : fix_localmktdate option;
    f_QuotReqRjctGrp_OrderQty2 : fix_float_4 option;
    f_QuotReqRjctGrp_Currency : fix_currency option;
    f_QuotReqRjctGrp_Stipulations : fix_rg_stipulations;
    f_QuotReqRjctGrp_Account : fix_string option;
    f_QuotReqRjctGrp_AcctIDSource : fix_acctidsource option;
    f_QuotReqRjctGrp_AccountType : fix_accounttype option;
    f_QuotReqRjctGrp_QuotReqLegsGrp : fix_rg_quotreqlegsgrp;
    f_QuotReqRjctGrp_QuotQualGrp : fix_rg_quotqualgrp;
    f_QuotReqRjctGrp_QuotePriceType : fix_quotepricetype option;
    f_QuotReqRjctGrp_OrdType : fix_ordtype option;
    f_QuotReqRjctGrp_ExpireTime : fix_utctimestamp option;
    f_QuotReqRjctGrp_TransactTime : fix_utctimestamp option;
    f_QuotReqRjctGrp_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    f_QuotReqRjctGrp_PriceType : fix_pricetype option;
    f_QuotReqRjctGrp_Price : fix_float_4 option;
    f_QuotReqRjctGrp_Price2 : fix_float_4 option;
    f_QuotReqRjctGrp_YieldData : fix_yielddata;
    f_QuotReqRjctGrp_Parties : fix_rg_parties
}
;;

type fix_rg_quotreqrjctgrp = fix_rg_inner_quotreqrjctgrp list
;;

type fix_rg_inner_quotcxlentriesgrp = {
    f_QuotCxlEntriesGrp_NoQuoteEntries : int option;
    f_QuotCxlEntriesGrp_Instrument : fix_instrument;
    f_QuotCxlEntriesGrp_FinancingDetails : fix_financingdetails;
    f_QuotCxlEntriesGrp_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    f_QuotCxlEntriesGrp_InstrmtLegGrp : fix_rg_instrmtleggrp
}
;;

type fix_rg_quotcxlentriesgrp = fix_rg_inner_quotcxlentriesgrp list
;;

type fix_rg_inner_relsymderivsecgrp = {
    f_RelSymDerivSecGrp_NoRelatedSym : int option;
    f_RelSymDerivSecGrp_Instrument : fix_instrument;
    f_RelSymDerivSecGrp_Currency : fix_currency option;
    f_RelSymDerivSecGrp_ExpirationCycle : fix_expirationcycle option;
    f_RelSymDerivSecGrp_InstrumentExtension : fix_instrumentextension;
    f_RelSymDerivSecGrp_InstrmtLegGrp : fix_rg_instrmtleggrp;
    f_RelSymDerivSecGrp_TradingSessionID : fix_string option;
    f_RelSymDerivSecGrp_TradingSessionSubID : fix_string option;
    f_RelSymDerivSecGrp_Text : fix_string option;
    f_RelSymDerivSecGrp_EncodedTextLen : int option;
    f_RelSymDerivSecGrp_EncodedText : fix_string option
}
;;

type fix_rg_relsymderivsecgrp = fix_rg_inner_relsymderivsecgrp list
;;

type fix_rg_inner_mdincgrp = {
    f_MDIncGrp_NoMDEntries : int;
    f_MDIncGrp_MDUpdateAction : fix_mdupdateaction;
    f_MDIncGrp_DeleteReason : fix_deletereason option;
    f_MDIncGrp_MDEntryType : fix_mdentrytype option;
    f_MDIncGrp_MDEntryID : fix_string option;
    f_MDIncGrp_MDEntryRefID : fix_string option;
    f_MDIncGrp_Instrument : fix_instrument;
    f_MDIncGrp_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    f_MDIncGrp_InstrmtLegGrp : fix_rg_instrmtleggrp;
    f_MDIncGrp_FinancialStatus : fix_financialstatus option;
    f_MDIncGrp_CorporateAction : fix_corporateaction option;
    f_MDIncGrp_MDEntryPx : fix_float_4 option;
    f_MDIncGrp_Currency : fix_currency option;
    f_MDIncGrp_MDEntrySize : fix_float_4 option;
    f_MDIncGrp_MDEntryDate : fix_utcdateonly option;
    f_MDIncGrp_MDEntryTime : fix_utctimeonly option;
    f_MDIncGrp_TickDirection : fix_tickdirection option;
    f_MDIncGrp_MDMkt : fix_exchange option;
    f_MDIncGrp_TradingSessionID : fix_string option;
    f_MDIncGrp_TradingSessionSubID : fix_string option;
    f_MDIncGrp_QuoteCondition : fix_quotecondition option;
    f_MDIncGrp_TradeCondition : fix_tradecondition option;
    f_MDIncGrp_MDEntryOriginator : fix_string option;
    f_MDIncGrp_LocationID : fix_string option;
    f_MDIncGrp_DeskID : fix_string option;
    f_MDIncGrp_OpenCloseSettlFlag : fix_openclosesettlflag option;
    f_MDIncGrp_TimeInForce : fix_timeinforce option;
    f_MDIncGrp_ExpireDate : fix_localmktdate option;
    f_MDIncGrp_ExpireTime : fix_utctimestamp option;
    f_MDIncGrp_MinQty : fix_float_4 option;
    f_MDIncGrp_ExecInst : fix_execinst option;
    f_MDIncGrp_SellerDays : int option;
    f_MDIncGrp_OrderID : fix_string option;
    f_MDIncGrp_QuoteEntryID : fix_string option;
    f_MDIncGrp_MDEntryBuyer : fix_string option;
    f_MDIncGrp_MDEntrySeller : fix_string option;
    f_MDIncGrp_NumberOfOrders : int option;
    f_MDIncGrp_MDEntryPositionNo : int option;
    f_MDIncGrp_Scope : fix_scope option;
    f_MDIncGrp_PriceDelta : fix_float_4 option;
    f_MDIncGrp_NetChgPrevDay : fix_float_4 option;
    f_MDIncGrp_Text : fix_string option;
    f_MDIncGrp_EncodedTextLen : int option;
    f_MDIncGrp_EncodedText : fix_string option
}
;;

type fix_rg_mdincgrp = fix_rg_inner_mdincgrp list
;;

type fix_rg_inner_settlinstgrp = {
    f_SettlInstGrp_NoSettlInst : int option;
    f_SettlInstGrp_SettlInstID : fix_string option;
    f_SettlInstGrp_SettlInstTransType : fix_settlinsttranstype option;
    f_SettlInstGrp_SettlInstRefID : fix_string option;
    f_SettlInstGrp_Parties : fix_rg_parties;
    f_SettlInstGrp_Side : fix_side option;
    f_SettlInstGrp_Product : fix_product option;
    f_SettlInstGrp_SecurityType : fix_securitytype option;
    f_SettlInstGrp_CFICode : fix_string option;
    f_SettlInstGrp_EffectiveTime : fix_utctimestamp option;
    f_SettlInstGrp_ExpireTime : fix_utctimestamp option;
    f_SettlInstGrp_LastUpdateTime : fix_utctimestamp option;
    f_SettlInstGrp_SettlInstructionsData : fix_settlinstructionsdata;
    f_SettlInstGrp_PaymentMethod : fix_paymentmethod option;
    f_SettlInstGrp_PaymentRef : fix_string option;
    f_SettlInstGrp_CardHolderName : fix_string option;
    f_SettlInstGrp_CardNumber : fix_string option;
    f_SettlInstGrp_CardStartDate : fix_localmktdate option;
    f_SettlInstGrp_CardExpDate : fix_localmktdate option;
    f_SettlInstGrp_CardIssNum : fix_string option;
    f_SettlInstGrp_PaymentDate : fix_localmktdate option;
    f_SettlInstGrp_PaymentRemitterID : fix_string option
}
;;

type fix_rg_settlinstgrp = fix_rg_inner_settlinstgrp list
;;

type fix_rg_inner_allocgrp = {
    f_AllocGrp_NoAllocs : int option;
    f_AllocGrp_AllocAccount : fix_string option;
    f_AllocGrp_AllocAcctIDSource : int option;
    f_AllocGrp_MatchStatus : fix_matchstatus option;
    f_AllocGrp_AllocPrice : fix_float_4 option;
    f_AllocGrp_AllocQty : fix_float_4 option;
    f_AllocGrp_IndividualAllocID : fix_string option;
    f_AllocGrp_ProcessCode : fix_processcode option;
    f_AllocGrp_NestedParties : fix_rg_nestedparties;
    f_AllocGrp_NotifyBrokerOfCredit : fix_notifybrokerofcredit option;
    f_AllocGrp_AllocHandlInst : fix_allochandlinst option;
    f_AllocGrp_AllocText : fix_string option;
    f_AllocGrp_EncodedAllocTextLen : int option;
    f_AllocGrp_EncodedAllocText : fix_string option;
    f_AllocGrp_CommissionData : fix_commissiondata;
    f_AllocGrp_AllocAvgPx : fix_float_4 option;
    f_AllocGrp_AllocNetMoney : fix_float_4 option;
    f_AllocGrp_SettlCurrAmt : fix_float_4 option;
    f_AllocGrp_AllocSettlCurrAmt : fix_float_4 option;
    f_AllocGrp_SettlCurrency : fix_currency option;
    f_AllocGrp_AllocSettlCurrency : fix_currency option;
    f_AllocGrp_SettlCurrFxRate : fix_float_4 option;
    f_AllocGrp_SettlCurrFxRateCalc : fix_settlcurrfxratecalc option;
    f_AllocGrp_AllocAccruedInterestAmt : fix_float_4 option;
    f_AllocGrp_AllocInterestAtMaturity : fix_float_4 option;
    f_AllocGrp_MiscFeesGrp : fix_rg_miscfeesgrp;
    f_AllocGrp_ClrInstGrp : fix_rg_clrinstgrp;
    f_AllocGrp_AllocSettlInstType : fix_allocsettlinsttype option;
    f_AllocGrp_SettlInstructionsData : fix_settlinstructionsdata
}
;;

type fix_rg_allocgrp = fix_rg_inner_allocgrp list
;;

type fix_rg_inner_quotsetackgrp = {
    f_QuotSetAckGrp_NoQuoteSets : int option;
    f_QuotSetAckGrp_QuoteSetID : fix_string option;
    f_QuotSetAckGrp_UnderlyingInstrument : fix_underlyinginstrument;
    f_QuotSetAckGrp_TotNoQuoteEntries : int option;
    f_QuotSetAckGrp_LastFragment : fix_lastfragment option;
    f_QuotSetAckGrp_QuotEntryAckGrp : fix_rg_quotentryackgrp
}
;;

type fix_rg_quotsetackgrp = fix_rg_inner_quotsetackgrp list
;;

type fix_rg_inner_quotsetgrp = {
    f_QuotSetGrp_NoQuoteSets : int;
    f_QuotSetGrp_QuoteSetID : fix_string;
    f_QuotSetGrp_UnderlyingInstrument : fix_underlyinginstrument;
    f_QuotSetGrp_QuoteSetValidUntilTime : fix_utctimestamp option;
    f_QuotSetGrp_TotNoQuoteEntries : int;
    f_QuotSetGrp_LastFragment : fix_lastfragment option;
    f_QuotSetGrp_QuotEntryGrp : fix_rg_quotentrygrp
}
;;

type fix_rg_quotsetgrp = fix_rg_inner_quotsetgrp list
;;

type full_fix_app_record_data =
    | FIX_Record_AttrbGrp of fix_rg_attrbgrp
    | FIX_Record_PositionAmountData of fix_rg_positionamountdata
    | FIX_Record_CommissionData of fix_commissiondata
    | FIX_Record_UndSecAltIDGrp of fix_rg_undsecaltidgrp
    | FIX_Record_DiscretionInstructions of fix_discretioninstructions
    | FIX_Record_TrdCapDtGrp of fix_rg_trdcapdtgrp
    | FIX_Record_MDRjctGrp of fix_rg_mdrjctgrp
    | FIX_Record_BidDescReqGrp of fix_rg_biddescreqgrp
    | FIX_Record_NstdPtys2SubGrp of fix_rg_nstdptys2subgrp
    | FIX_Record_Hop of fix_rg_hop
    | FIX_Record_BidCompReqGrp of fix_rg_bidcompreqgrp
    | FIX_Record_PtysSubGrp of fix_rg_ptyssubgrp
    | FIX_Record_ExecsGrp of fix_rg_execsgrp
    | FIX_Record_LogonMsgTypes of fix_rg_logonmsgtypes
    | FIX_Record_TrdgSesGrp of fix_rg_trdgsesgrp
    | FIX_Record_SettlPtysSubGrp of fix_rg_settlptyssubgrp
    | FIX_Record_NstdPtysSubGrp of fix_rg_nstdptyssubgrp
    | FIX_Record_NstdPtys3SubGrp of fix_rg_nstdptys3subgrp
    | FIX_Record_OrderQtyData of fix_orderqtydata
    | FIX_Record_ContAmtGrp of fix_rg_contamtgrp
    | FIX_Record_LegSecAltIDGrp of fix_rg_legsecaltidgrp
    | FIX_Record_EvntGrp of fix_rg_evntgrp
    | FIX_Record_CompIDReqGrp of fix_rg_compidreqgrp
    | FIX_Record_ClrInstGrp of fix_rg_clrinstgrp
    | FIX_Record_CollInqQualGrp of fix_rg_collinqqualgrp
    | FIX_Record_TrdRegTimestamps of fix_rg_trdregtimestamps
    | FIX_Record_UnderlyingStipulations of fix_rg_underlyingstipulations
    | FIX_Record_CpctyConfGrp of fix_rg_cpctyconfgrp
    | FIX_Record_MiscFeesGrp of fix_rg_miscfeesgrp
    | FIX_Record_FinancingDetails of fix_financingdetails
    | FIX_Record_TrdCollGrp of fix_rg_trdcollgrp
    | FIX_Record_ExecAllocGrp of fix_rg_execallocgrp
    | FIX_Record_MDFullGrp of fix_rg_mdfullgrp
    | FIX_Record_SecTypesGrp of fix_rg_sectypesgrp
    | FIX_Record_CompIDStatGrp of fix_rg_compidstatgrp
    | FIX_Record_LegStipulations of fix_rg_legstipulations
    | FIX_Record_LegBenchmarkCurveData of fix_legbenchmarkcurvedata
    | FIX_Record_AllocAckGrp of fix_rg_allocackgrp
    | FIX_Record_ContraGrp of fix_rg_contragrp
    | FIX_Record_MDReqGrp of fix_rg_mdreqgrp
    | FIX_Record_Stipulations of fix_rg_stipulations
    | FIX_Record_QuotQualGrp of fix_rg_quotqualgrp
    | FIX_Record_ExecCollGrp of fix_rg_execcollgrp
    | FIX_Record_PegInstructions of fix_peginstructions
    | FIX_Record_LinesOfTextGrp of fix_rg_linesoftextgrp
    | FIX_Record_SecAltIDGrp of fix_rg_secaltidgrp
    | FIX_Record_AffectedOrdGrp of fix_rg_affectedordgrp
    | FIX_Record_OrdListStatGrp of fix_rg_ordliststatgrp
    | FIX_Record_IOIQualGrp of fix_rg_ioiqualgrp
    | FIX_Record_RgstDistInstGrp of fix_rg_rgstdistinstgrp
    | FIX_Record_interval of fix_interval
    | FIX_Record_YieldData of fix_yielddata
    | FIX_Record_RoutingGrp of fix_rg_routinggrp
    | FIX_Record_SpreadOrBenchmarkCurveData of fix_spreadorbenchmarkcurvedata
    | FIX_Record_BidCompRspGrp of fix_rg_bidcomprspgrp
    | FIX_Record_NestedParties2 of fix_rg_nestedparties2
    | FIX_Record_SettlParties of fix_rg_settlparties
    | FIX_Record_NestedParties of fix_rg_nestedparties
    | FIX_Record_InstrumentLeg of fix_instrumentleg
    | FIX_Record_Instrument of fix_instrument
    | FIX_Record_NestedParties3 of fix_rg_nestedparties3
    | FIX_Record_InstrumentExtension of fix_instrumentextension
    | FIX_Record_Parties of fix_rg_parties
    | FIX_Record_UnderlyingInstrument of fix_underlyinginstrument
    | FIX_Record_InstrmtLegSecListGrp of fix_rg_instrmtlegseclistgrp
    | FIX_Record_OrdAllocGrp of fix_rg_ordallocgrp
    | FIX_Record_InstrmtLegIOIGrp of fix_rg_instrmtlegioigrp
    | FIX_Record_PreAllocGrp of fix_rg_preallocgrp
    | FIX_Record_RgstDtlsGrp of fix_rg_rgstdtlsgrp
    | FIX_Record_PositionQty of fix_rg_positionqty
    | FIX_Record_QuotReqLegsGrp of fix_rg_quotreqlegsgrp
    | FIX_Record_UndInstrmtStrkPxGrp of fix_rg_undinstrmtstrkpxgrp
    | FIX_Record_TrdInstrmtLegGrp of fix_rg_trdinstrmtleggrp
    | FIX_Record_LegQuotGrp of fix_rg_legquotgrp
    | FIX_Record_InstrmtLegGrp of fix_rg_instrmtleggrp
    | FIX_Record_TrdAllocGrp of fix_rg_trdallocgrp
    | FIX_Record_DlvyInstGrp of fix_rg_dlvyinstgrp
    | FIX_Record_SideCrossOrdCxlGrp of fix_rg_sidecrossordcxlgrp
    | FIX_Record_UndInstrmtCollGrp of fix_rg_undinstrmtcollgrp
    | FIX_Record_PreAllocMlegGrp of fix_rg_preallocmleggrp
    | FIX_Record_UndInstrmtGrp of fix_rg_undinstrmtgrp
    | FIX_Record_PosUndInstrmtGrp of fix_rg_posundinstrmtgrp
    | FIX_Record_InstrmtStrkPxGrp of fix_rg_instrmtstrkpxgrp
    | FIX_Record_InstrmtLegExecGrp of fix_rg_instrmtlegexecgrp
    | FIX_Record_LegQuotStatGrp of fix_rg_legquotstatgrp
    | FIX_Record_InstrmtGrp of fix_rg_instrmtgrp
    | FIX_Record_LegPreAllocGrp of fix_rg_legpreallocgrp
    | FIX_Record_QuotReqGrp of fix_rg_quotreqgrp
    | FIX_Record_QuotEntryGrp of fix_rg_quotentrygrp
    | FIX_Record_LegOrdGrp of fix_rg_legordgrp
    | FIX_Record_TrdCapRptSideGrp of fix_rg_trdcaprptsidegrp
    | FIX_Record_ListOrdGrp of fix_rg_listordgrp
    | FIX_Record_RFQReqGrp of fix_rg_rfqreqgrp
    | FIX_Record_InstrmtMDReqGrp of fix_rg_instrmtmdreqgrp
    | FIX_Record_SideCrossOrdModGrp of fix_rg_sidecrossordmodgrp
    | FIX_Record_SecListGrp of fix_rg_seclistgrp
    | FIX_Record_SettlInstructionsData of fix_settlinstructionsdata
    | FIX_Record_QuotEntryAckGrp of fix_rg_quotentryackgrp
    | FIX_Record_QuotReqRjctGrp of fix_rg_quotreqrjctgrp
    | FIX_Record_QuotCxlEntriesGrp of fix_rg_quotcxlentriesgrp
    | FIX_Record_RelSymDerivSecGrp of fix_rg_relsymderivsecgrp
    | FIX_Record_MDIncGrp of fix_rg_mdincgrp
    | FIX_Record_SettlInstGrp of fix_rg_settlinstgrp
    | FIX_Record_AllocGrp of fix_rg_allocgrp
    | FIX_Record_QuotSetAckGrp of fix_rg_quotsetackgrp
    | FIX_Record_QuotSetGrp of fix_rg_quotsetgrp
;;
