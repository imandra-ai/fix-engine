(* Aesthetic Integration copyright 2017 *)
(* @meta[imandra_ignore] on @end *)
open Full_app_enums;;
open Yojson;;
(* @meta[imandra_ignore] off @end *)

let adjustment_to_string ( d ) =
    (match d with
        | FIX_Adjustment_Cancel -> "Cancel"
        | FIX_Adjustment_Error -> "Error"
        | FIX_Adjustment_Correction -> "Correction"
    )
;;

let advside_to_string ( d ) =
    (match d with
        | FIX_AdvSide_Buy -> "Buy"
        | FIX_AdvSide_Sell -> "Sell"
        | FIX_AdvSide_Trade -> "Trade"
        | FIX_AdvSide_Cross -> "Cross"
    )
;;

let advtranstype_to_string ( d ) =
    (match d with
        | FIX_AdvTransType_Cancel -> "Cancel"
        | FIX_AdvTransType_New -> "New"
        | FIX_AdvTransType_Replace -> "Replace"
    )
;;

let aggregatedbook_to_string ( d ) =
    (match d with
        | FIX_AggregatedBook_BookEntriesShouldNotBeAggregated -> "BookEntriesShouldNotBeAggregated"
        | FIX_AggregatedBook_BookEntriesToBeAggregated -> "BookEntriesToBeAggregated"
    )
;;

let allochandlinst_to_string ( d ) =
    (match d with
        | FIX_AllocHandlInst_Match -> "Match"
        | FIX_AllocHandlInst_Forward -> "Forward"
        | FIX_AllocHandlInst_ForwardAndMatch -> "ForwardAndMatch"
    )
;;

let alloclinktype_to_string ( d ) =
    (match d with
        | FIX_AllocLinkType_FXNetting -> "FXNetting"
        | FIX_AllocLinkType_FXSwap -> "FXSwap"
    )
;;

let allocrejcode_to_string ( d ) =
    (match d with
        | FIX_AllocRejCode_UnknownAccount -> "UnknownAccount"
        | FIX_AllocRejCode_IncorrectQuantity -> "IncorrectQuantity"
        | FIX_AllocRejCode_IncorrectAveragegPrice -> "IncorrectAveragegPrice"
        | FIX_AllocRejCode_UnknownExecutingBrokerMnemonic -> "UnknownExecutingBrokerMnemonic"
        | FIX_AllocRejCode_CommissionDifference -> "CommissionDifference"
        | FIX_AllocRejCode_UnknownOrderID -> "UnknownOrderID"
        | FIX_AllocRejCode_UnknownListID -> "UnknownListID"
        | FIX_AllocRejCode_OtherSeeText -> "OtherSeeText"
    )
;;

let allocstatus_to_string ( d ) =
    (match d with
        | FIX_AllocStatus_Accepted -> "Accepted"
        | FIX_AllocStatus_BlockLevelReject -> "BlockLevelReject"
        | FIX_AllocStatus_AccountLevelReject -> "AccountLevelReject"
        | FIX_AllocStatus_Received -> "Received"
    )
;;

let alloctranstype_to_string ( d ) =
    (match d with
        | FIX_AllocTransType_New -> "New"
        | FIX_AllocTransType_Replace -> "Replace"
        | FIX_AllocTransType_Cancel -> "Cancel"
        | FIX_AllocTransType_Preliminary -> "Preliminary"
        | FIX_AllocTransType_Calculated -> "Calculated"
        | FIX_AllocTransType_CalculatedWithoutPreliminary -> "CalculatedWithoutPreliminary"
    )
;;

let basispxtype_to_string ( d ) =
    (match d with
        | FIX_BasisPxType_ClosingPriceAtMorningSession -> "ClosingPriceAtMorningSession"
        | FIX_BasisPxType_ClosingPrice -> "ClosingPrice"
        | FIX_BasisPxType_CurrentPrice -> "CurrentPrice"
        | FIX_BasisPxType_SQ -> "SQ"
        | FIX_BasisPxType_VWAPThroughADay -> "VWAPThroughADay"
        | FIX_BasisPxType_VWAPThroughAMorningSession -> "VWAPThroughAMorningSession"
        | FIX_BasisPxType_VWAPThroughAnAfternoonSession -> "VWAPThroughAnAfternoonSession"
        | FIX_BasisPxType_VWAPThroughADayExcept -> "VWAPThroughADayExcept"
        | FIX_BasisPxType_VWAPThroughAMorningSessionExcept -> "VWAPThroughAMorningSessionExcept"
        | FIX_BasisPxType_VWAPThroughAnAfternoonSessionExcept -> "VWAPThroughAnAfternoonSessionExcept"
        | FIX_BasisPxType_Strike -> "Strike"
        | FIX_BasisPxType_Open -> "Open"
        | FIX_BasisPxType_Others -> "Others"
    )
;;

let benchmark_to_string ( d ) =
    (match d with
        | FIX_Benchmark_CURVE -> "CURVE"
        | FIX_Benchmark_FiveYR -> "FiveYR"
        | FIX_Benchmark_OLD5 -> "OLD5"
        | FIX_Benchmark_TenYR -> "TenYR"
        | FIX_Benchmark_OLD10 -> "OLD10"
        | FIX_Benchmark_ThirtyYR -> "ThirtyYR"
        | FIX_Benchmark_OLD30 -> "OLD30"
        | FIX_Benchmark_ThreeMOLIBOR -> "ThreeMOLIBOR"
        | FIX_Benchmark_SixMOLIBOR -> "SixMOLIBOR"
    )
;;

let bidrequesttranstype_to_string ( d ) =
    (match d with
        | FIX_BidRequestTransType_Cancel -> "Cancel"
        | FIX_BidRequestTransType_New -> "New"
    )
;;

let commtype_to_string ( d ) =
    (match d with
        | FIX_CommType_PerUnit -> "PerUnit"
        | FIX_CommType_Percent -> "Percent"
        | FIX_CommType_Absolute -> "Absolute"
    )
;;

let corporateaction_to_string ( d ) =
    (match d with
        | FIX_CorporateAction_ExDividend -> "ExDividend"
        | FIX_CorporateAction_ExDistribution -> "ExDistribution"
        | FIX_CorporateAction_ExRights -> "ExRights"
        | FIX_CorporateAction_New -> "New"
        | FIX_CorporateAction_ExInterest -> "ExInterest"
    )
;;

let coveredoruncovered_to_string ( d ) =
    (match d with
        | FIX_CoveredOrUncovered_Covered -> "Covered"
        | FIX_CoveredOrUncovered_Uncovered -> "Uncovered"
    )
;;

let customerorfirm_to_string ( d ) =
    (match d with
        | FIX_CustomerOrFirm_Customer -> "Customer"
        | FIX_CustomerOrFirm_Firm -> "Firm"
    )
;;

let cxlrejreason_to_string ( d ) =
    (match d with
        | FIX_CxlRejReason_TooLateToCancel -> "TooLateToCancel"
        | FIX_CxlRejReason_UnknownOrder -> "UnknownOrder"
        | FIX_CxlRejReason_BrokerCredit -> "BrokerCredit"
        | FIX_CxlRejReason_OrderAlreadyInPendingStatus -> "OrderAlreadyInPendingStatus"
    )
;;

let cxlrejresponseto_to_string ( d ) =
    (match d with
        | FIX_CxlRejResponseTo_OrderCancelRequest -> "OrderCancelRequest"
        | FIX_CxlRejResponseTo_OrderCancel -> "OrderCancel"
    )
;;

let dkreason_to_string ( d ) =
    (match d with
        | FIX_DKReason_UnknownSymbol -> "UnknownSymbol"
        | FIX_DKReason_WrongSide -> "WrongSide"
        | FIX_DKReason_QuantityExceedsOrder -> "QuantityExceedsOrder"
        | FIX_DKReason_NoMatchingOrder -> "NoMatchingOrder"
        | FIX_DKReason_PriceExceedsLimit -> "PriceExceedsLimit"
        | FIX_DKReason_Other -> "Other"
    )
;;

let deletereason_to_string ( d ) =
    (match d with
        | FIX_DeleteReason_Cancellation -> "Cancellation"
        | FIX_DeleteReason_Error -> "Error"
    )
;;

let discretioninst_to_string ( d ) =
    (match d with
        | FIX_DiscretionInst_RelatedToDisplayedPrice -> "RelatedToDisplayedPrice"
        | FIX_DiscretionInst_RelatedToMarketPrice -> "RelatedToMarketPrice"
        | FIX_DiscretionInst_RelatedToPrimaryPrice -> "RelatedToPrimaryPrice"
        | FIX_DiscretionInst_RelatedToLocalPrimaryPrice -> "RelatedToLocalPrimaryPrice"
        | FIX_DiscretionInst_RelatedToMidpointPrice -> "RelatedToMidpointPrice"
        | FIX_DiscretionInst_RelatedToLastTradePrice -> "RelatedToLastTradePrice"
    )
;;

let duetorelated_to_string ( d ) =
    (match d with
        | FIX_DueToRelated_NotRelatedToSecurityHalt -> "NotRelatedToSecurityHalt"
        | FIX_DueToRelated_RelatedToSecurityHalt -> "RelatedToSecurityHalt"
    )
;;

let emailtype_to_string ( d ) =
    (match d with
        | FIX_EmailType_New -> "New"
        | FIX_EmailType_Reply -> "Reply"
        | FIX_EmailType_AdminReply -> "AdminReply"
    )
;;

let exchangeforphysical_to_string ( d ) =
    (match d with
        | FIX_ExchangeForPhysical_False -> "False"
        | FIX_ExchangeForPhysical_True -> "True"
    )
;;

let execinst_to_string ( d ) =
    (match d with
        | FIX_ExecInst_StayOnOfferSide -> "StayOnOfferSide"
        | FIX_ExecInst_NotHeld -> "NotHeld"
        | FIX_ExecInst_Work -> "Work"
        | FIX_ExecInst_GoAlong -> "GoAlong"
        | FIX_ExecInst_OverTheDay -> "OverTheDay"
        | FIX_ExecInst_Held -> "Held"
        | FIX_ExecInst_ParticipateDoNotInitiate -> "ParticipateDoNotInitiate"
        | FIX_ExecInst_StrictScale -> "StrictScale"
        | FIX_ExecInst_TryToScale -> "TryToScale"
        | FIX_ExecInst_StayOnBidSide -> "StayOnBidSide"
        | FIX_ExecInst_NoCross -> "NoCross"
        | FIX_ExecInst_OKToCross -> "OKToCross"
        | FIX_ExecInst_CallFirst -> "CallFirst"
        | FIX_ExecInst_PercentOfVolume -> "PercentOfVolume"
        | FIX_ExecInst_DoNotIncrease -> "DoNotIncrease"
        | FIX_ExecInst_DoNotReduce -> "DoNotReduce"
        | FIX_ExecInst_AllOrNone -> "AllOrNone"
        | FIX_ExecInst_InstitutionsOnly -> "InstitutionsOnly"
        | FIX_ExecInst_LastPeg -> "LastPeg"
        | FIX_ExecInst_MidPricePeg -> "MidPricePeg"
        | FIX_ExecInst_NonNegotiable -> "NonNegotiable"
        | FIX_ExecInst_OpeningPeg -> "OpeningPeg"
        | FIX_ExecInst_MarketPeg -> "MarketPeg"
        | FIX_ExecInst_PrimaryPeg -> "PrimaryPeg"
        | FIX_ExecInst_Suspend -> "Suspend"
        | FIX_ExecInst_FixedPegToLocalBestBidOrOfferAtTimeOfOrder -> "FixedPegToLocalBestBidOrOfferAtTimeOfOrder"
        | FIX_ExecInst_CustomerDisplayInstruction -> "CustomerDisplayInstruction"
        | FIX_ExecInst_Netting -> "Netting"
        | FIX_ExecInst_PegToVWAP -> "PegToVWAP"
    )
;;

let execrestatementreason_to_string ( d ) =
    (match d with
        | FIX_ExecRestatementReason_GTCorporateAction -> "GTCorporateAction"
        | FIX_ExecRestatementReason_GTRenewal -> "GTRenewal"
        | FIX_ExecRestatementReason_VerbalChange -> "VerbalChange"
        | FIX_ExecRestatementReason_RepricingOfOrder -> "RepricingOfOrder"
        | FIX_ExecRestatementReason_BrokerOption -> "BrokerOption"
        | FIX_ExecRestatementReason_PartialDeclineOfOrderQty -> "PartialDeclineOfOrderQty"
    )
;;

let exectranstype_to_string ( d ) =
    (match d with
        | FIX_ExecTransType_New -> "New"
        | FIX_ExecTransType_Cancel -> "Cancel"
        | FIX_ExecTransType_Correct -> "Correct"
        | FIX_ExecTransType_Status -> "Status"
    )
;;

let exectype_to_string ( d ) =
    (match d with
        | FIX_ExecType_New -> "New"
        | FIX_ExecType_PartialFill -> "PartialFill"
        | FIX_ExecType_Fill -> "Fill"
        | FIX_ExecType_DoneForDay -> "DoneForDay"
        | FIX_ExecType_Canceled -> "Canceled"
        | FIX_ExecType_Replaced -> "Replaced"
        | FIX_ExecType_PendingCancel -> "PendingCancel"
        | FIX_ExecType_Stopped -> "Stopped"
        | FIX_ExecType_Rejected -> "Rejected"
        | FIX_ExecType_Suspended -> "Suspended"
        | FIX_ExecType_PendingNew -> "PendingNew"
        | FIX_ExecType_Calculated -> "Calculated"
        | FIX_ExecType_Expired -> "Expired"
        | FIX_ExecType_Restated -> "Restated"
        | FIX_ExecType_PendingReplace -> "PendingReplace"
    )
;;

let financialstatus_to_string ( d ) =
    (match d with
        | FIX_FinancialStatus_Bankrupt -> "Bankrupt"
    )
;;

let forexreq_to_string ( d ) =
    (match d with
        | FIX_ForexReq_DoNotExecuteForexAfterSecurityTrade -> "DoNotExecuteForexAfterSecurityTrade"
        | FIX_ForexReq_ExecuteForexAfterSecurityTrade -> "ExecuteForexAfterSecurityTrade"
    )
;;

let gtbookinginst_to_string ( d ) =
    (match d with
        | FIX_GTBookingInst_BookOutAllTradesOnDayOfExecution -> "BookOutAllTradesOnDayOfExecution"
        | FIX_GTBookingInst_AccumulateUntilFilledOrExpired -> "AccumulateUntilFilledOrExpired"
        | FIX_GTBookingInst_AccumulateUntilVerballlyNotifiedOtherwise -> "AccumulateUntilVerballlyNotifiedOtherwise"
    )
;;

let haltreason_to_string ( d ) =
    (match d with
        | FIX_HaltReason_NewsDissemination -> "NewsDissemination"
        | FIX_HaltReason_OrderInflux -> "OrderInflux"
        | FIX_HaltReason_OrderImbalance -> "OrderImbalance"
        | FIX_HaltReason_AdditionalInformation -> "AdditionalInformation"
        | FIX_HaltReason_NewsPending -> "NewsPending"
        | FIX_HaltReason_EquipmentChangeover -> "EquipmentChangeover"
    )
;;

let handlinst_to_string ( d ) =
    (match d with
        | FIX_HandlInst_AutomatedExecutionNoIntervention -> "AutomatedExecutionNoIntervention"
        | FIX_HandlInst_AutomatedExecutionInterventionOK -> "AutomatedExecutionInterventionOK"
        | FIX_HandlInst_ManualOrder -> "ManualOrder"
    )
;;

let idsource_to_string ( d ) =
    (match d with
        | FIX_IDSource_CUSIP -> "CUSIP"
        | FIX_IDSource_SEDOL -> "SEDOL"
        | FIX_IDSource_QUIK -> "QUIK"
        | FIX_IDSource_ISINNumber -> "ISINNumber"
        | FIX_IDSource_RICCode -> "RICCode"
        | FIX_IDSource_ISOCurrencyCode -> "ISOCurrencyCode"
        | FIX_IDSource_ISOCountryCode -> "ISOCountryCode"
        | FIX_IDSource_ExchangeSymbol -> "ExchangeSymbol"
        | FIX_IDSource_ConsolidatedTapeAssociation -> "ConsolidatedTapeAssociation"
    )
;;

let ioinaturalflag_to_string ( d ) =
    (match d with
        | FIX_IOINaturalFlag_NotNatural -> "NotNatural"
        | FIX_IOINaturalFlag_Natural -> "Natural"
    )
;;

let ioiqltyind_to_string ( d ) =
    (match d with
        | FIX_IOIQltyInd_High -> "High"
        | FIX_IOIQltyInd_Low -> "Low"
        | FIX_IOIQltyInd_Medium -> "Medium"
    )
;;

let ioiqualifier_to_string ( d ) =
    (match d with
        | FIX_IOIQualifier_AllOrNone -> "AllOrNone"
        | FIX_IOIQualifier_AtTheClose -> "AtTheClose"
        | FIX_IOIQualifier_InTouchWith -> "InTouchWith"
        | FIX_IOIQualifier_Limit -> "Limit"
        | FIX_IOIQualifier_MoreBehind -> "MoreBehind"
        | FIX_IOIQualifier_AtTheOpen -> "AtTheOpen"
        | FIX_IOIQualifier_TakingAPosition -> "TakingAPosition"
        | FIX_IOIQualifier_AtTheMarket -> "AtTheMarket"
        | FIX_IOIQualifier_ReadyToTrade -> "ReadyToTrade"
        | FIX_IOIQualifier_PortfolioShown -> "PortfolioShown"
        | FIX_IOIQualifier_ThroughTheDay -> "ThroughTheDay"
        | FIX_IOIQualifier_Versus -> "Versus"
        | FIX_IOIQualifier_Indication -> "Indication"
        | FIX_IOIQualifier_CrossingOpportunity -> "CrossingOpportunity"
        | FIX_IOIQualifier_AtTheMidpoint -> "AtTheMidpoint"
        | FIX_IOIQualifier_PreOpen -> "PreOpen"
    )
;;

let ioishares_to_string ( d ) =
    (match d with
        | FIX_IOIShares_Large -> "Large"
        | FIX_IOIShares_Medium -> "Medium"
        | FIX_IOIShares_Small -> "Small"
    )
;;

let ioitranstype_to_string ( d ) =
    (match d with
        | FIX_IOITransType_Cancel -> "Cancel"
        | FIX_IOITransType_New -> "New"
        | FIX_IOITransType_Replace -> "Replace"
    )
;;

let inviewofcommon_to_string ( d ) =
    (match d with
        | FIX_InViewOfCommon_HaltWasNotRelatedToAHaltOfTheCommonStock -> "HaltWasNotRelatedToAHaltOfTheCommonStock"
        | FIX_InViewOfCommon_HaltWasDueToCommonStockBeingHalted -> "HaltWasDueToCommonStockBeingHalted"
    )
;;

let inctaxind_to_string ( d ) =
    (match d with
        | FIX_IncTaxInd_Net -> "Net"
        | FIX_IncTaxInd_Gross -> "Gross"
    )
;;

let lastcapacity_to_string ( d ) =
    (match d with
        | FIX_LastCapacity_Agent -> "Agent"
        | FIX_LastCapacity_CrossAsAgent -> "CrossAsAgent"
        | FIX_LastCapacity_CrossAsPrincipal -> "CrossAsPrincipal"
        | FIX_LastCapacity_Principal -> "Principal"
    )
;;

let liquidityindtype_to_string ( d ) =
    (match d with
        | FIX_LiquidityIndType_FiveDayMovingAverage -> "FiveDayMovingAverage"
        | FIX_LiquidityIndType_TwentyDayMovingAverage -> "TwentyDayMovingAverage"
        | FIX_LiquidityIndType_NormalMarketSize -> "NormalMarketSize"
        | FIX_LiquidityIndType_Other -> "Other"
    )
;;

let listexecinsttype_to_string ( d ) =
    (match d with
        | FIX_ListExecInstType_Immediate -> "Immediate"
        | FIX_ListExecInstType_WaitForInstruction -> "WaitForInstruction"
    )
;;

let locatereqd_to_string ( d ) =
    (match d with
        | FIX_LocateReqd_No -> "No"
        | FIX_LocateReqd_Yes -> "Yes"
    )
;;

let mdentrytype_to_string ( d ) =
    (match d with
        | FIX_MDEntryType_Bid -> "Bid"
        | FIX_MDEntryType_Offer -> "Offer"
        | FIX_MDEntryType_Trade -> "Trade"
        | FIX_MDEntryType_IndexValue -> "IndexValue"
        | FIX_MDEntryType_OpeningPrice -> "OpeningPrice"
        | FIX_MDEntryType_ClosingPrice -> "ClosingPrice"
        | FIX_MDEntryType_SettlementPrice -> "SettlementPrice"
        | FIX_MDEntryType_TradingSessionHighPrice -> "TradingSessionHighPrice"
        | FIX_MDEntryType_TradingSessionLowPrice -> "TradingSessionLowPrice"
        | FIX_MDEntryType_TradingSessionVWAPPrice -> "TradingSessionVWAPPrice"
    )
;;

let mdreqrejreason_to_string ( d ) =
    (match d with
        | FIX_MDReqRejReason_UnknownSymbol -> "UnknownSymbol"
        | FIX_MDReqRejReason_DuplicateMDReqID -> "DuplicateMDReqID"
        | FIX_MDReqRejReason_InsufficientBandwidth -> "InsufficientBandwidth"
        | FIX_MDReqRejReason_InsufficientPermissions -> "InsufficientPermissions"
        | FIX_MDReqRejReason_UnsupportedSubscriptionRequestType -> "UnsupportedSubscriptionRequestType"
        | FIX_MDReqRejReason_UnsupportedMarketDepth -> "UnsupportedMarketDepth"
        | FIX_MDReqRejReason_UnsupportedMDUpdateType -> "UnsupportedMDUpdateType"
        | FIX_MDReqRejReason_UnsupportedAggregatedBook -> "UnsupportedAggregatedBook"
        | FIX_MDReqRejReason_UnsupportedMDEntryType -> "UnsupportedMDEntryType"
    )
;;

let mdupdateaction_to_string ( d ) =
    (match d with
        | FIX_MDUpdateAction_New -> "New"
        | FIX_MDUpdateAction_Change -> "Change"
        | FIX_MDUpdateAction_Delete -> "Delete"
    )
;;

let mdupdatetype_to_string ( d ) =
    (match d with
        | FIX_MDUpdateType_FullRefresh -> "FullRefresh"
        | FIX_MDUpdateType_IncrementalRefresh -> "IncrementalRefresh"
    )
;;

let messageencoding_to_string ( d ) =
    (match d with
        | FIX_MessageEncoding_EUCJP -> "EUCJP"
        | FIX_MessageEncoding_ISO2022JP -> "ISO2022JP"
        | FIX_MessageEncoding_ShiftJIS -> "ShiftJIS"
        | FIX_MessageEncoding_UTF8 -> "UTF8"
    )
;;

let miscfeetype_to_string ( d ) =
    (match d with
        | FIX_MiscFeeType_Regulatory -> "Regulatory"
        | FIX_MiscFeeType_Tax -> "Tax"
        | FIX_MiscFeeType_LocalCommission -> "LocalCommission"
        | FIX_MiscFeeType_ExchangeFees -> "ExchangeFees"
        | FIX_MiscFeeType_Stamp -> "Stamp"
        | FIX_MiscFeeType_Levy -> "Levy"
        | FIX_MiscFeeType_Other -> "Other"
        | FIX_MiscFeeType_Markup -> "Markup"
        | FIX_MiscFeeType_ConsumptionTax -> "ConsumptionTax"
    )
;;

let msgdirection_to_string ( d ) =
    (match d with
        | FIX_MsgDirection_Receive -> "Receive"
        | FIX_MsgDirection_Send -> "Send"
    )
;;

let multilegreportingtype_to_string ( d ) =
    (match d with
        | FIX_MultiLegReportingType_SingleSecurity -> "SingleSecurity"
        | FIX_MultiLegReportingType_IndividualLegOfAMultiLegSecurity -> "IndividualLegOfAMultiLegSecurity"
        | FIX_MultiLegReportingType_MultiLegSecurity -> "MultiLegSecurity"
    )
;;

let netgrossind_to_string ( d ) =
    (match d with
        | FIX_NetGrossInd_Net -> "Net"
        | FIX_NetGrossInd_Gross -> "Gross"
    )
;;

let notifybrokerofcredit_to_string ( d ) =
    (match d with
        | FIX_NotifyBrokerOfCredit_DetailsShouldNotBeCommunicated -> "DetailsShouldNotBeCommunicated"
        | FIX_NotifyBrokerOfCredit_DetailsShouldBeCommunicated -> "DetailsShouldBeCommunicated"
    )
;;

let openclose_to_string ( d ) =
    (match d with
        | FIX_OpenClose_Close -> "Close"
        | FIX_OpenClose_Open -> "Open"
    )
;;

let openclosesettleflag_to_string ( d ) =
    (match d with
        | FIX_OpenCloseSettleFlag_DailyOpen -> "DailyOpen"
        | FIX_OpenCloseSettleFlag_SessionOpen -> "SessionOpen"
        | FIX_OpenCloseSettleFlag_DeliverySettlementEntry -> "DeliverySettlementEntry"
    )
;;

let ordrejreason_to_string ( d ) =
    (match d with
        | FIX_OrdRejReason_BrokerCredit -> "BrokerCredit"
        | FIX_OrdRejReason_UnknownSymbol -> "UnknownSymbol"
        | FIX_OrdRejReason_ExchangeClosed -> "ExchangeClosed"
        | FIX_OrdRejReason_OrderExceedsLimit -> "OrderExceedsLimit"
        | FIX_OrdRejReason_TooLateToEnter -> "TooLateToEnter"
        | FIX_OrdRejReason_UnknownOrder -> "UnknownOrder"
        | FIX_OrdRejReason_DuplicateOrder -> "DuplicateOrder"
        | FIX_OrdRejReason_DuplicateOfAVerballyCommunicatedOrder -> "DuplicateOfAVerballyCommunicatedOrder"
        | FIX_OrdRejReason_StaleOrder -> "StaleOrder"
    )
;;

let ordstatus_to_string ( d ) =
    (match d with
        | FIX_OrdStatus_New -> "New"
        | FIX_OrdStatus_PartiallyFilled -> "PartiallyFilled"
        | FIX_OrdStatus_Filled -> "Filled"
        | FIX_OrdStatus_DoneForDay -> "DoneForDay"
        | FIX_OrdStatus_Canceled -> "Canceled"
        | FIX_OrdStatus_Replaced -> "Replaced"
        | FIX_OrdStatus_PendingCancel -> "PendingCancel"
        | FIX_OrdStatus_Stopped -> "Stopped"
        | FIX_OrdStatus_Rejected -> "Rejected"
        | FIX_OrdStatus_Suspended -> "Suspended"
        | FIX_OrdStatus_PendingNew -> "PendingNew"
        | FIX_OrdStatus_Calculated -> "Calculated"
        | FIX_OrdStatus_Expired -> "Expired"
        | FIX_OrdStatus_AcceptedForBidding -> "AcceptedForBidding"
        | FIX_OrdStatus_PendingReplace -> "PendingReplace"
    )
;;

let ordtype_to_string ( d ) =
    (match d with
        | FIX_OrdType_Market -> "Market"
        | FIX_OrdType_Limit -> "Limit"
        | FIX_OrdType_Stop -> "Stop"
        | FIX_OrdType_StopLimit -> "StopLimit"
        | FIX_OrdType_MarketOnClose -> "MarketOnClose"
        | FIX_OrdType_WithOrWithout -> "WithOrWithout"
        | FIX_OrdType_LimitOrBetter -> "LimitOrBetter"
        | FIX_OrdType_LimitWithOrWithout -> "LimitWithOrWithout"
        | FIX_OrdType_OnBasis -> "OnBasis"
        | FIX_OrdType_OnClose -> "OnClose"
        | FIX_OrdType_LimitOnClose -> "LimitOnClose"
        | FIX_OrdType_ForexMarket -> "ForexMarket"
        | FIX_OrdType_PreviouslyQuoted -> "PreviouslyQuoted"
        | FIX_OrdType_PreviouslyIndicated -> "PreviouslyIndicated"
        | FIX_OrdType_ForexLimit -> "ForexLimit"
        | FIX_OrdType_ForexSwap -> "ForexSwap"
        | FIX_OrdType_ForexPreviouslyQuoted -> "ForexPreviouslyQuoted"
        | FIX_OrdType_Funari -> "Funari"
        | FIX_OrdType_Pegged -> "Pegged"
    )
;;

let possdupflag_to_string ( d ) =
    (match d with
        | FIX_PossDupFlag_OriginalTransmission -> "OriginalTransmission"
        | FIX_PossDupFlag_PossibleDuplicate -> "PossibleDuplicate"
    )
;;

let possresend_to_string ( d ) =
    (match d with
        | FIX_PossResend_OriginalTransmission -> "OriginalTransmission"
        | FIX_PossResend_PossibleResend -> "PossibleResend"
    )
;;

let pricetype_to_string ( d ) =
    (match d with
        | FIX_PriceType_Percentage -> "Percentage"
        | FIX_PriceType_PerUnit -> "PerUnit"
        | FIX_PriceType_FixedAmount -> "FixedAmount"
    )
;;

let processcode_to_string ( d ) =
    (match d with
        | FIX_ProcessCode_Regular -> "Regular"
        | FIX_ProcessCode_SoftDollar -> "SoftDollar"
        | FIX_ProcessCode_StepIn -> "StepIn"
        | FIX_ProcessCode_StepOut -> "StepOut"
        | FIX_ProcessCode_SoftDollarStepIn -> "SoftDollarStepIn"
        | FIX_ProcessCode_SoftDollarStepOut -> "SoftDollarStepOut"
        | FIX_ProcessCode_PlanSponsor -> "PlanSponsor"
    )
;;

let progrptreqs_to_string ( d ) =
    (match d with
        | FIX_ProgRptReqs_BuySideRequests -> "BuySideRequests"
        | FIX_ProgRptReqs_SellSideSends -> "SellSideSends"
        | FIX_ProgRptReqs_RealTimeExecutionReports -> "RealTimeExecutionReports"
    )
;;

let putorcall_to_string ( d ) =
    (match d with
        | FIX_PutOrCall_Put -> "Put"
        | FIX_PutOrCall_Call -> "Call"
    )
;;

let quoteackstatus_to_string ( d ) =
    (match d with
        | FIX_QuoteAckStatus_Accepted -> "Accepted"
        | FIX_QuoteAckStatus_CancelForSymbol -> "CancelForSymbol"
        | FIX_QuoteAckStatus_CanceledForSecurityType -> "CanceledForSecurityType"
        | FIX_QuoteAckStatus_CanceledForUnderlying -> "CanceledForUnderlying"
        | FIX_QuoteAckStatus_CanceledAll -> "CanceledAll"
        | FIX_QuoteAckStatus_Rejected -> "Rejected"
    )
;;

let quotecanceltype_to_string ( d ) =
    (match d with
        | FIX_QuoteCancelType_CancelForOneOrMoreSecurities -> "CancelForOneOrMoreSecurities"
        | FIX_QuoteCancelType_CancelForSecurityType -> "CancelForSecurityType"
        | FIX_QuoteCancelType_CancelForUnderlyingSecurity -> "CancelForUnderlyingSecurity"
        | FIX_QuoteCancelType_CancelAllQuotes -> "CancelAllQuotes"
    )
;;

let quotecondition_to_string ( d ) =
    (match d with
        | FIX_QuoteCondition_Open -> "Open"
        | FIX_QuoteCondition_Closed -> "Closed"
        | FIX_QuoteCondition_ExchangeBest -> "ExchangeBest"
        | FIX_QuoteCondition_ConsolidatedBest -> "ConsolidatedBest"
        | FIX_QuoteCondition_Locked -> "Locked"
        | FIX_QuoteCondition_Crossed -> "Crossed"
        | FIX_QuoteCondition_Depth -> "Depth"
        | FIX_QuoteCondition_FastTrading -> "FastTrading"
        | FIX_QuoteCondition_NonFirm -> "NonFirm"
    )
;;

let quoteentryrejectreason_to_string ( d ) =
    (match d with
        | FIX_QuoteEntryRejectReason_UnknownSymbol -> "UnknownSymbol"
        | FIX_QuoteEntryRejectReason_Exchange -> "Exchange"
        | FIX_QuoteEntryRejectReason_QuoteExceedsLimit -> "QuoteExceedsLimit"
        | FIX_QuoteEntryRejectReason_TooLateToEnter -> "TooLateToEnter"
        | FIX_QuoteEntryRejectReason_UnknownQuote -> "UnknownQuote"
        | FIX_QuoteEntryRejectReason_DuplicateQuote -> "DuplicateQuote"
        | FIX_QuoteEntryRejectReason_InvalidBidAskSpread -> "InvalidBidAskSpread"
        | FIX_QuoteEntryRejectReason_InvalidPrice -> "InvalidPrice"
        | FIX_QuoteEntryRejectReason_NotAuthorizedToQuoteSecurity -> "NotAuthorizedToQuoteSecurity"
    )
;;

let quoterejectreason_to_string ( d ) =
    (match d with
        | FIX_QuoteRejectReason_UnknownSymbol -> "UnknownSymbol"
        | FIX_QuoteRejectReason_Exchange -> "Exchange"
        | FIX_QuoteRejectReason_QuoteRequestExceedsLimit -> "QuoteRequestExceedsLimit"
        | FIX_QuoteRejectReason_TooLateToEnter -> "TooLateToEnter"
        | FIX_QuoteRejectReason_UnknownQuote -> "UnknownQuote"
        | FIX_QuoteRejectReason_DuplicateQuote -> "DuplicateQuote"
        | FIX_QuoteRejectReason_InvalidBid -> "InvalidBid"
        | FIX_QuoteRejectReason_InvalidPrice -> "InvalidPrice"
        | FIX_QuoteRejectReason_NotAuthorizedToQuoteSecurity -> "NotAuthorizedToQuoteSecurity"
    )
;;

let quoterequesttype_to_string ( d ) =
    (match d with
        | FIX_QuoteRequestType_Manual -> "Manual"
        | FIX_QuoteRequestType_Automatic -> "Automatic"
    )
;;

let quoteresponselevel_to_string ( d ) =
    (match d with
        | FIX_QuoteResponseLevel_NoAcknowledgement -> "NoAcknowledgement"
        | FIX_QuoteResponseLevel_AcknowledgeOnlyNegativeOrErroneousQuotes -> "AcknowledgeOnlyNegativeOrErroneousQuotes"
        | FIX_QuoteResponseLevel_AcknowledgeEachQuoteMessage -> "AcknowledgeEachQuoteMessage"
    )
;;

let reporttoexch_to_string ( d ) =
    (match d with
        | FIX_ReportToExch_SenderReports -> "SenderReports"
        | FIX_ReportToExch_ReceiverReports -> "ReceiverReports"
    )
;;

let resetseqnumflag_to_string ( d ) =
    (match d with
        | FIX_ResetSeqNumFlag_No -> "No"
        | FIX_ResetSeqNumFlag_Yes -> "Yes"
    )
;;

let routingtype_to_string ( d ) =
    (match d with
        | FIX_RoutingType_TargetFirm -> "TargetFirm"
        | FIX_RoutingType_TargetList -> "TargetList"
        | FIX_RoutingType_BlockFirm -> "BlockFirm"
        | FIX_RoutingType_BlockList -> "BlockList"
    )
;;

let rule80a_to_string ( d ) =
    (match d with
        | FIX_Rule80A_AgencySingleOrder -> "AgencySingleOrder"
        | FIX_Rule80A_ShortExemptTransactionAType -> "ShortExemptTransactionAType"
        | FIX_Rule80A_ProprietaryNonAlgo -> "ProprietaryNonAlgo"
        | FIX_Rule80A_ProgramOrderMember -> "ProgramOrderMember"
        | FIX_Rule80A_ShortExemptTransactionForPrincipal -> "ShortExemptTransactionForPrincipal"
        | FIX_Rule80A_ShortExemptTransactionWType -> "ShortExemptTransactionWType"
        | FIX_Rule80A_ShortExemptTransactionIType -> "ShortExemptTransactionIType"
        | FIX_Rule80A_IndividualInvestor -> "IndividualInvestor"
        | FIX_Rule80A_ProprietaryAlgo -> "ProprietaryAlgo"
        | FIX_Rule80A_AgencyAlgo -> "AgencyAlgo"
        | FIX_Rule80A_ShortExemptTransactionMemberAffliated -> "ShortExemptTransactionMemberAffliated"
        | FIX_Rule80A_ProgramOrderOtherMember -> "ProgramOrderOtherMember"
        | FIX_Rule80A_AgentForOtherMember -> "AgentForOtherMember"
        | FIX_Rule80A_ProprietaryTransactionAffiliated -> "ProprietaryTransactionAffiliated"
        | FIX_Rule80A_Principal -> "Principal"
        | FIX_Rule80A_TransactionNonMember -> "TransactionNonMember"
        | FIX_Rule80A_SpecialistTrades -> "SpecialistTrades"
        | FIX_Rule80A_TransactionUnaffiliatedMember -> "TransactionUnaffiliatedMember"
        | FIX_Rule80A_AgencyIndexArb -> "AgencyIndexArb"
        | FIX_Rule80A_AllOtherOrdersAsAgentForOtherMember -> "AllOtherOrdersAsAgentForOtherMember"
        | FIX_Rule80A_ShortExemptTransactionMemberNotAffliated -> "ShortExemptTransactionMemberNotAffliated"
        | FIX_Rule80A_AgencyNonAlgo -> "AgencyNonAlgo"
        | FIX_Rule80A_ShortExemptTransactionNonMember -> "ShortExemptTransactionNonMember"
    )
;;

let securityrequesttype_to_string ( d ) =
    (match d with
        | FIX_SecurityRequestType_RequestSecurityIdentityAndSpecifications -> "RequestSecurityIdentityAndSpecifications"
        | FIX_SecurityRequestType_RequestSecurityIdentityForSpecifications -> "RequestSecurityIdentityForSpecifications"
        | FIX_SecurityRequestType_RequestListSecurityTypes -> "RequestListSecurityTypes"
        | FIX_SecurityRequestType_RequestListSecurities -> "RequestListSecurities"
    )
;;

let securityresponsetype_to_string ( d ) =
    (match d with
        | FIX_SecurityResponseType_AcceptAsIs -> "AcceptAsIs"
        | FIX_SecurityResponseType_AcceptWithRevisions -> "AcceptWithRevisions"
        | FIX_SecurityResponseType_ListOfSecurityTypesReturnedPerRequest -> "ListOfSecurityTypesReturnedPerRequest"
        | FIX_SecurityResponseType_ListOfSecuritiesReturnedPerRequest -> "ListOfSecuritiesReturnedPerRequest"
        | FIX_SecurityResponseType_RejectSecurityProposal -> "RejectSecurityProposal"
        | FIX_SecurityResponseType_CannotMatchSelectionCriteria -> "CannotMatchSelectionCriteria"
    )
;;

let securitytradingstatus_to_string ( d ) =
    (match d with
        | FIX_SecurityTradingStatus_OpeningDelay -> "OpeningDelay"
        | FIX_SecurityTradingStatus_MarketOnCloseImbalanceSell -> "MarketOnCloseImbalanceSell"
        | FIX_SecurityTradingStatus_NoMarketImbalance -> "NoMarketImbalance"
        | FIX_SecurityTradingStatus_NoMarketOnCloseImbalance -> "NoMarketOnCloseImbalance"
        | FIX_SecurityTradingStatus_ITSPreOpening -> "ITSPreOpening"
        | FIX_SecurityTradingStatus_NewPriceIndication -> "NewPriceIndication"
        | FIX_SecurityTradingStatus_TradeDisseminationTime -> "TradeDisseminationTime"
        | FIX_SecurityTradingStatus_ReadyToTrade -> "ReadyToTrade"
        | FIX_SecurityTradingStatus_NotAvailableForTrading -> "NotAvailableForTrading"
        | FIX_SecurityTradingStatus_NotTradedOnThisMarket -> "NotTradedOnThisMarket"
        | FIX_SecurityTradingStatus_TradingHalt -> "TradingHalt"
        | FIX_SecurityTradingStatus_UnknownOrInvalid -> "UnknownOrInvalid"
        | FIX_SecurityTradingStatus_Resume -> "Resume"
        | FIX_SecurityTradingStatus_NoOpen -> "NoOpen"
        | FIX_SecurityTradingStatus_PriceIndication -> "PriceIndication"
        | FIX_SecurityTradingStatus_TradingRangeIndication -> "TradingRangeIndication"
        | FIX_SecurityTradingStatus_MarketImbalanceBuy -> "MarketImbalanceBuy"
        | FIX_SecurityTradingStatus_MarketImbalanceSell -> "MarketImbalanceSell"
        | FIX_SecurityTradingStatus_MarketOnCloseImbalanceBuy -> "MarketOnCloseImbalanceBuy"
    )
;;

let securitytype_to_string ( d ) =
    (match d with
        | FIX_SecurityType_Wildcard -> "Wildcard"
        | FIX_SecurityType_BankersAcceptance -> "BankersAcceptance"
        | FIX_SecurityType_ConvertibleBond -> "ConvertibleBond"
        | FIX_SecurityType_CertificateOfDeposit -> "CertificateOfDeposit"
        | FIX_SecurityType_CollateralizedMortgageObligation -> "CollateralizedMortgageObligation"
        | FIX_SecurityType_CorporateBond -> "CorporateBond"
        | FIX_SecurityType_CommercialPaper -> "CommercialPaper"
        | FIX_SecurityType_CorporatePrivatePlacement -> "CorporatePrivatePlacement"
        | FIX_SecurityType_CommonStock -> "CommonStock"
        | FIX_SecurityType_FederalHousingAuthority -> "FederalHousingAuthority"
        | FIX_SecurityType_FederalHomeLoan -> "FederalHomeLoan"
        | FIX_SecurityType_FederalNationalMortgageAssociation -> "FederalNationalMortgageAssociation"
        | FIX_SecurityType_ForeignExchangeContract -> "ForeignExchangeContract"
        | FIX_SecurityType_Future -> "Future"
        | FIX_SecurityType_GovernmentNationalMortgageAssociation -> "GovernmentNationalMortgageAssociation"
        | FIX_SecurityType_TreasuriesAgencyDebenture -> "TreasuriesAgencyDebenture"
        | FIX_SecurityType_IOETTEMortgage -> "IOETTEMortgage"
        | FIX_SecurityType_MutualFund -> "MutualFund"
        | FIX_SecurityType_MortgageInterestOnly -> "MortgageInterestOnly"
        | FIX_SecurityType_MortgagePrincipalOnly -> "MortgagePrincipalOnly"
        | FIX_SecurityType_MortgagePrivatePlacement -> "MortgagePrivatePlacement"
        | FIX_SecurityType_MiscellaneousPassThrough -> "MiscellaneousPassThrough"
        | FIX_SecurityType_MunicipalBond -> "MunicipalBond"
        | FIX_SecurityType_NoSecurityType -> "NoSecurityType"
        | FIX_SecurityType_Option -> "Option"
        | FIX_SecurityType_PreferredStock -> "PreferredStock"
        | FIX_SecurityType_RepurchaseAgreement -> "RepurchaseAgreement"
        | FIX_SecurityType_ReverseRepurchaseAgreement -> "ReverseRepurchaseAgreement"
        | FIX_SecurityType_StudentLoanMarketingAssociation -> "StudentLoanMarketingAssociation"
        | FIX_SecurityType_TimeDeposit -> "TimeDeposit"
        | FIX_SecurityType_USTreasuryBillOld -> "USTreasuryBillOld"
        | FIX_SecurityType_Warrant -> "Warrant"
        | FIX_SecurityType_CatsTigersAndLions -> "CatsTigersAndLions"
    )
;;

let settlinstmode_to_string ( d ) =
    (match d with
        | FIX_SettlInstMode_Default -> "Default"
        | FIX_SettlInstMode_StandingInstructionsProvided -> "StandingInstructionsProvided"
        | FIX_SettlInstMode_SpecificAllocationAccountOverriding -> "SpecificAllocationAccountOverriding"
        | FIX_SettlInstMode_SpecificAllocationAccountStanding -> "SpecificAllocationAccountStanding"
    )
;;

let settlinstsource_to_string ( d ) =
    (match d with
        | FIX_SettlInstSource_BrokerCredit -> "BrokerCredit"
        | FIX_SettlInstSource_Institution -> "Institution"
    )
;;

let settlinsttranstype_to_string ( d ) =
    (match d with
        | FIX_SettlInstTransType_Cancel -> "Cancel"
        | FIX_SettlInstTransType_New -> "New"
        | FIX_SettlInstTransType_Replace -> "Replace"
    )
;;

let settllocation_to_string ( d ) =
    (match d with
        | FIX_SettlLocation_CEDEL -> "CEDEL"
        | FIX_SettlLocation_DepositoryTrustCompany -> "DepositoryTrustCompany"
        | FIX_SettlLocation_EuroClear -> "EuroClear"
        | FIX_SettlLocation_FederalBookEntry -> "FederalBookEntry"
        | FIX_SettlLocation_LocalMarketSettleLocation -> "LocalMarketSettleLocation"
        | FIX_SettlLocation_Physical -> "Physical"
        | FIX_SettlLocation_ParticipantTrustCompany -> "ParticipantTrustCompany"
    )
;;

let settlmnttyp_to_string ( d ) =
    (match d with
        | FIX_SettlmntTyp_Regular -> "Regular"
        | FIX_SettlmntTyp_Cash -> "Cash"
        | FIX_SettlmntTyp_NextDay -> "NextDay"
        | FIX_SettlmntTyp_TPlus2 -> "TPlus2"
        | FIX_SettlmntTyp_TPlus3 -> "TPlus3"
        | FIX_SettlmntTyp_TPlus4 -> "TPlus4"
        | FIX_SettlmntTyp_Future -> "Future"
        | FIX_SettlmntTyp_WhenAndIfIssued -> "WhenAndIfIssued"
        | FIX_SettlmntTyp_SellersOption -> "SellersOption"
        | FIX_SettlmntTyp_TPlus5 -> "TPlus5"
    )
;;

let side_to_string ( d ) =
    (match d with
        | FIX_Side_Buy -> "Buy"
        | FIX_Side_Sell -> "Sell"
        | FIX_Side_BuyMinus -> "BuyMinus"
        | FIX_Side_SellPlus -> "SellPlus"
        | FIX_Side_SellShort -> "SellShort"
        | FIX_Side_SellShortExempt -> "SellShortExempt"
        | FIX_Side_Undisclosed -> "Undisclosed"
        | FIX_Side_Cross -> "Cross"
        | FIX_Side_CrossShort -> "CrossShort"
    )
;;

let solicitedflag_to_string ( d ) =
    (match d with
        | FIX_SolicitedFlag_WasNotSolicited -> "WasNotSolicited"
        | FIX_SolicitedFlag_WasSolicited -> "WasSolicited"
    )
;;

let standinstdbtype_to_string ( d ) =
    (match d with
        | FIX_StandInstDbType_Other -> "Other"
        | FIX_StandInstDbType_DTCSID -> "DTCSID"
        | FIX_StandInstDbType_ThomsonALERT -> "ThomsonALERT"
        | FIX_StandInstDbType_AGlobalCustodian -> "AGlobalCustodian"
    )
;;

let subscriptionrequesttype_to_string ( d ) =
    (match d with
        | FIX_SubscriptionRequestType_Snapshot -> "Snapshot"
        | FIX_SubscriptionRequestType_SnapshotAndUpdates -> "SnapshotAndUpdates"
        | FIX_SubscriptionRequestType_DisablePreviousSnapshot -> "DisablePreviousSnapshot"
    )
;;

let tickdirection_to_string ( d ) =
    (match d with
        | FIX_TickDirection_PlusTick -> "PlusTick"
        | FIX_TickDirection_ZeroPlusTick -> "ZeroPlusTick"
        | FIX_TickDirection_MinusTick -> "MinusTick"
        | FIX_TickDirection_ZeroMinusTick -> "ZeroMinusTick"
    )
;;

let timeinforce_to_string ( d ) =
    (match d with
        | FIX_TimeInForce_Day -> "Day"
        | FIX_TimeInForce_GoodTillCancel -> "GoodTillCancel"
        | FIX_TimeInForce_AtTheOpening -> "AtTheOpening"
        | FIX_TimeInForce_ImmediateOrCancel -> "ImmediateOrCancel"
        | FIX_TimeInForce_FillOrKill -> "FillOrKill"
        | FIX_TimeInForce_GoodTillCrossing -> "GoodTillCrossing"
        | FIX_TimeInForce_GoodTillDate -> "GoodTillDate"
    )
;;

let tradsesmethod_to_string ( d ) =
    (match d with
        | FIX_TradSesMethod_Electronic -> "Electronic"
        | FIX_TradSesMethod_OpenOutcry -> "OpenOutcry"
        | FIX_TradSesMethod_TwoParty -> "TwoParty"
    )
;;

let tradsesmode_to_string ( d ) =
    (match d with
        | FIX_TradSesMode_Testing -> "Testing"
        | FIX_TradSesMode_Simulated -> "Simulated"
        | FIX_TradSesMode_Production -> "Production"
    )
;;

let tradsesstatus_to_string ( d ) =
    (match d with
        | FIX_TradSesStatus_Halted -> "Halted"
        | FIX_TradSesStatus_Open -> "Open"
        | FIX_TradSesStatus_Closed -> "Closed"
        | FIX_TradSesStatus_PreOpen -> "PreOpen"
        | FIX_TradSesStatus_PreClose -> "PreClose"
    )
;;

let tradecondition_to_string ( d ) =
    (match d with
        | FIX_TradeCondition_Cash -> "Cash"
        | FIX_TradeCondition_AveragePriceTrade -> "AveragePriceTrade"
        | FIX_TradeCondition_CashTrade -> "CashTrade"
        | FIX_TradeCondition_NextDay -> "NextDay"
        | FIX_TradeCondition_Opening -> "Opening"
        | FIX_TradeCondition_IntradayTradeDetail -> "IntradayTradeDetail"
        | FIX_TradeCondition_Rule127Trade -> "Rule127Trade"
        | FIX_TradeCondition_Rule155Trade -> "Rule155Trade"
        | FIX_TradeCondition_SoldLast -> "SoldLast"
        | FIX_TradeCondition_NextDayTrade -> "NextDayTrade"
        | FIX_TradeCondition_Opened -> "Opened"
        | FIX_TradeCondition_Seller -> "Seller"
        | FIX_TradeCondition_Sold -> "Sold"
        | FIX_TradeCondition_StoppedStock -> "StoppedStock"
    )
;;

let tradetype_to_string ( d ) =
    (match d with
        | FIX_TradeType_Agency -> "Agency"
        | FIX_TradeType_VWAPGuarantee -> "VWAPGuarantee"
        | FIX_TradeType_GuaranteedClose -> "GuaranteedClose"
        | FIX_TradeType_RiskTrade -> "RiskTrade"
    )
;;

let unsolicitedindicator_to_string ( d ) =
    (match d with
        | FIX_UnsolicitedIndicator_MessageIsBeingSentAsAResultOfAPriorRequest -> "MessageIsBeingSentAsAResultOfAPriorRequest"
        | FIX_UnsolicitedIndicator_MessageIsBeingSentUnsolicited -> "MessageIsBeingSentUnsolicited"
    )
;;

let urgency_to_string ( d ) =
    (match d with
        | FIX_Urgency_Normal -> "Normal"
        | FIX_Urgency_Flash -> "Flash"
        | FIX_Urgency_Background -> "Background"
    )
;;

let week_to_string ( d ) =
    (match d with
        | FIX_week_noweek -> "noweek"
        | FIX_week_w1 -> "w1"
        | FIX_week_w2 -> "w2"
        | FIX_week_w3 -> "w3"
        | FIX_week_w4 -> "w4"
        | FIX_week_w5 -> "w5"
    )
;;

let currency_to_string ( d ) =
    (match d with
        | FIX_Currency_EUR -> "EUR"
        | FIX_Currency_GBP -> "GBP"
        | FIX_Currency_USD -> "USD"
    )
;;

let country_to_string ( d ) =
    (match d with
        | FIX_Country_DE -> "DE"
        | FIX_Country_GB -> "GB"
        | FIX_Country_US -> "US"
    )
;;

let exchange_to_string ( d ) =
    (match d with
        | FIX_Exchange_XLON -> "XLON"
        | FIX_Exchange_XNYS -> "XNYS"
        | FIX_Exchange_XNAS -> "XNAS"
        | FIX_Exchange_XJAS -> "XJAS"
        | FIX_Exchange_XSHG -> "XSHG"
        | FIX_Exchange_SHSC -> "SHSC"
    )
;;

let adjustment_to_json ( d ) : json =
    `String (adjustment_to_string d)
;;

let advside_to_json ( d ) : json =
    `String (advside_to_string d)
;;

let advtranstype_to_json ( d ) : json =
    `String (advtranstype_to_string d)
;;

let aggregatedbook_to_json ( d ) : json =
    `String (aggregatedbook_to_string d)
;;

let allochandlinst_to_json ( d ) : json =
    `String (allochandlinst_to_string d)
;;

let alloclinktype_to_json ( d ) : json =
    `String (alloclinktype_to_string d)
;;

let allocrejcode_to_json ( d ) : json =
    `String (allocrejcode_to_string d)
;;

let allocstatus_to_json ( d ) : json =
    `String (allocstatus_to_string d)
;;

let alloctranstype_to_json ( d ) : json =
    `String (alloctranstype_to_string d)
;;

let basispxtype_to_json ( d ) : json =
    `String (basispxtype_to_string d)
;;

let benchmark_to_json ( d ) : json =
    `String (benchmark_to_string d)
;;

let bidrequesttranstype_to_json ( d ) : json =
    `String (bidrequesttranstype_to_string d)
;;

let commtype_to_json ( d ) : json =
    `String (commtype_to_string d)
;;

let corporateaction_to_json ( d ) : json =
    `String (corporateaction_to_string d)
;;

let coveredoruncovered_to_json ( d ) : json =
    `String (coveredoruncovered_to_string d)
;;

let customerorfirm_to_json ( d ) : json =
    `String (customerorfirm_to_string d)
;;

let cxlrejreason_to_json ( d ) : json =
    `String (cxlrejreason_to_string d)
;;

let cxlrejresponseto_to_json ( d ) : json =
    `String (cxlrejresponseto_to_string d)
;;

let dkreason_to_json ( d ) : json =
    `String (dkreason_to_string d)
;;

let deletereason_to_json ( d ) : json =
    `String (deletereason_to_string d)
;;

let discretioninst_to_json ( d ) : json =
    `String (discretioninst_to_string d)
;;

let duetorelated_to_json ( d ) : json =
    `String (duetorelated_to_string d)
;;

let emailtype_to_json ( d ) : json =
    `String (emailtype_to_string d)
;;

let exchangeforphysical_to_json ( d ) : json =
    `String (exchangeforphysical_to_string d)
;;

let execinst_to_json ( d ) : json =
    `String (execinst_to_string d)
;;

let execrestatementreason_to_json ( d ) : json =
    `String (execrestatementreason_to_string d)
;;

let exectranstype_to_json ( d ) : json =
    `String (exectranstype_to_string d)
;;

let exectype_to_json ( d ) : json =
    `String (exectype_to_string d)
;;

let financialstatus_to_json ( d ) : json =
    `String (financialstatus_to_string d)
;;

let forexreq_to_json ( d ) : json =
    `String (forexreq_to_string d)
;;

let gtbookinginst_to_json ( d ) : json =
    `String (gtbookinginst_to_string d)
;;

let haltreason_to_json ( d ) : json =
    `String (haltreason_to_string d)
;;

let handlinst_to_json ( d ) : json =
    `String (handlinst_to_string d)
;;

let idsource_to_json ( d ) : json =
    `String (idsource_to_string d)
;;

let ioinaturalflag_to_json ( d ) : json =
    `String (ioinaturalflag_to_string d)
;;

let ioiqltyind_to_json ( d ) : json =
    `String (ioiqltyind_to_string d)
;;

let ioiqualifier_to_json ( d ) : json =
    `String (ioiqualifier_to_string d)
;;

let ioishares_to_json ( d ) : json =
    `String (ioishares_to_string d)
;;

let ioitranstype_to_json ( d ) : json =
    `String (ioitranstype_to_string d)
;;

let inviewofcommon_to_json ( d ) : json =
    `String (inviewofcommon_to_string d)
;;

let inctaxind_to_json ( d ) : json =
    `String (inctaxind_to_string d)
;;

let lastcapacity_to_json ( d ) : json =
    `String (lastcapacity_to_string d)
;;

let liquidityindtype_to_json ( d ) : json =
    `String (liquidityindtype_to_string d)
;;

let listexecinsttype_to_json ( d ) : json =
    `String (listexecinsttype_to_string d)
;;

let locatereqd_to_json ( d ) : json =
    `String (locatereqd_to_string d)
;;

let mdentrytype_to_json ( d ) : json =
    `String (mdentrytype_to_string d)
;;

let mdreqrejreason_to_json ( d ) : json =
    `String (mdreqrejreason_to_string d)
;;

let mdupdateaction_to_json ( d ) : json =
    `String (mdupdateaction_to_string d)
;;

let mdupdatetype_to_json ( d ) : json =
    `String (mdupdatetype_to_string d)
;;

let messageencoding_to_json ( d ) : json =
    `String (messageencoding_to_string d)
;;

let miscfeetype_to_json ( d ) : json =
    `String (miscfeetype_to_string d)
;;

let msgdirection_to_json ( d ) : json =
    `String (msgdirection_to_string d)
;;

let multilegreportingtype_to_json ( d ) : json =
    `String (multilegreportingtype_to_string d)
;;

let netgrossind_to_json ( d ) : json =
    `String (netgrossind_to_string d)
;;

let notifybrokerofcredit_to_json ( d ) : json =
    `String (notifybrokerofcredit_to_string d)
;;

let openclose_to_json ( d ) : json =
    `String (openclose_to_string d)
;;

let openclosesettleflag_to_json ( d ) : json =
    `String (openclosesettleflag_to_string d)
;;

let ordrejreason_to_json ( d ) : json =
    `String (ordrejreason_to_string d)
;;

let ordstatus_to_json ( d ) : json =
    `String (ordstatus_to_string d)
;;

let ordtype_to_json ( d ) : json =
    `String (ordtype_to_string d)
;;

let possdupflag_to_json ( d ) : json =
    `String (possdupflag_to_string d)
;;

let possresend_to_json ( d ) : json =
    `String (possresend_to_string d)
;;

let pricetype_to_json ( d ) : json =
    `String (pricetype_to_string d)
;;

let processcode_to_json ( d ) : json =
    `String (processcode_to_string d)
;;

let progrptreqs_to_json ( d ) : json =
    `String (progrptreqs_to_string d)
;;

let putorcall_to_json ( d ) : json =
    `String (putorcall_to_string d)
;;

let quoteackstatus_to_json ( d ) : json =
    `String (quoteackstatus_to_string d)
;;

let quotecanceltype_to_json ( d ) : json =
    `String (quotecanceltype_to_string d)
;;

let quotecondition_to_json ( d ) : json =
    `String (quotecondition_to_string d)
;;

let quoteentryrejectreason_to_json ( d ) : json =
    `String (quoteentryrejectreason_to_string d)
;;

let quoterejectreason_to_json ( d ) : json =
    `String (quoterejectreason_to_string d)
;;

let quoterequesttype_to_json ( d ) : json =
    `String (quoterequesttype_to_string d)
;;

let quoteresponselevel_to_json ( d ) : json =
    `String (quoteresponselevel_to_string d)
;;

let reporttoexch_to_json ( d ) : json =
    `String (reporttoexch_to_string d)
;;

let resetseqnumflag_to_json ( d ) : json =
    `String (resetseqnumflag_to_string d)
;;

let routingtype_to_json ( d ) : json =
    `String (routingtype_to_string d)
;;

let rule80a_to_json ( d ) : json =
    `String (rule80a_to_string d)
;;

let securityrequesttype_to_json ( d ) : json =
    `String (securityrequesttype_to_string d)
;;

let securityresponsetype_to_json ( d ) : json =
    `String (securityresponsetype_to_string d)
;;

let securitytradingstatus_to_json ( d ) : json =
    `String (securitytradingstatus_to_string d)
;;

let securitytype_to_json ( d ) : json =
    `String (securitytype_to_string d)
;;

let settlinstmode_to_json ( d ) : json =
    `String (settlinstmode_to_string d)
;;

let settlinstsource_to_json ( d ) : json =
    `String (settlinstsource_to_string d)
;;

let settlinsttranstype_to_json ( d ) : json =
    `String (settlinsttranstype_to_string d)
;;

let settllocation_to_json ( d ) : json =
    `String (settllocation_to_string d)
;;

let settlmnttyp_to_json ( d ) : json =
    `String (settlmnttyp_to_string d)
;;

let side_to_json ( d ) : json =
    `String (side_to_string d)
;;

let solicitedflag_to_json ( d ) : json =
    `String (solicitedflag_to_string d)
;;

let standinstdbtype_to_json ( d ) : json =
    `String (standinstdbtype_to_string d)
;;

let subscriptionrequesttype_to_json ( d ) : json =
    `String (subscriptionrequesttype_to_string d)
;;

let tickdirection_to_json ( d ) : json =
    `String (tickdirection_to_string d)
;;

let timeinforce_to_json ( d ) : json =
    `String (timeinforce_to_string d)
;;

let tradsesmethod_to_json ( d ) : json =
    `String (tradsesmethod_to_string d)
;;

let tradsesmode_to_json ( d ) : json =
    `String (tradsesmode_to_string d)
;;

let tradsesstatus_to_json ( d ) : json =
    `String (tradsesstatus_to_string d)
;;

let tradecondition_to_json ( d ) : json =
    `String (tradecondition_to_string d)
;;

let tradetype_to_json ( d ) : json =
    `String (tradetype_to_string d)
;;

let unsolicitedindicator_to_json ( d ) : json =
    `String (unsolicitedindicator_to_string d)
;;

let urgency_to_json ( d ) : json =
    `String (urgency_to_string d)
;;

let week_to_json ( d ) : json =
    `String (week_to_string d)
;;

let currency_to_json ( d ) : json =
    `String (currency_to_string d)
;;

let country_to_json ( d ) : json =
    `String (country_to_string d)
;;

let exchange_to_json ( d ) : json =
    `String (exchange_to_string d)
;;

let adjustment_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (adjustment_to_json d)
    )
;;

let advside_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (advside_to_json d)
    )
;;

let advtranstype_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (advtranstype_to_json d)
    )
;;

let aggregatedbook_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (aggregatedbook_to_json d)
    )
;;

let allochandlinst_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (allochandlinst_to_json d)
    )
;;

let alloclinktype_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (alloclinktype_to_json d)
    )
;;

let allocrejcode_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (allocrejcode_to_json d)
    )
;;

let allocstatus_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (allocstatus_to_json d)
    )
;;

let alloctranstype_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (alloctranstype_to_json d)
    )
;;

let basispxtype_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (basispxtype_to_json d)
    )
;;

let benchmark_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (benchmark_to_json d)
    )
;;

let bidrequesttranstype_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (bidrequesttranstype_to_json d)
    )
;;

let commtype_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (commtype_to_json d)
    )
;;

let corporateaction_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (corporateaction_to_json d)
    )
;;

let coveredoruncovered_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (coveredoruncovered_to_json d)
    )
;;

let customerorfirm_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (customerorfirm_to_json d)
    )
;;

let cxlrejreason_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (cxlrejreason_to_json d)
    )
;;

let cxlrejresponseto_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (cxlrejresponseto_to_json d)
    )
;;

let dkreason_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (dkreason_to_json d)
    )
;;

let deletereason_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (deletereason_to_json d)
    )
;;

let discretioninst_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (discretioninst_to_json d)
    )
;;

let duetorelated_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (duetorelated_to_json d)
    )
;;

let emailtype_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (emailtype_to_json d)
    )
;;

let exchangeforphysical_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (exchangeforphysical_to_json d)
    )
;;

let execinst_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (execinst_to_json d)
    )
;;

let execrestatementreason_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (execrestatementreason_to_json d)
    )
;;

let exectranstype_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (exectranstype_to_json d)
    )
;;

let exectype_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (exectype_to_json d)
    )
;;

let financialstatus_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (financialstatus_to_json d)
    )
;;

let forexreq_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (forexreq_to_json d)
    )
;;

let gtbookinginst_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (gtbookinginst_to_json d)
    )
;;

let haltreason_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (haltreason_to_json d)
    )
;;

let handlinst_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (handlinst_to_json d)
    )
;;

let idsource_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (idsource_to_json d)
    )
;;

let ioinaturalflag_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (ioinaturalflag_to_json d)
    )
;;

let ioiqltyind_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (ioiqltyind_to_json d)
    )
;;

let ioiqualifier_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (ioiqualifier_to_json d)
    )
;;

let ioishares_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (ioishares_to_json d)
    )
;;

let ioitranstype_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (ioitranstype_to_json d)
    )
;;

let inviewofcommon_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (inviewofcommon_to_json d)
    )
;;

let inctaxind_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (inctaxind_to_json d)
    )
;;

let lastcapacity_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (lastcapacity_to_json d)
    )
;;

let liquidityindtype_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (liquidityindtype_to_json d)
    )
;;

let listexecinsttype_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (listexecinsttype_to_json d)
    )
;;

let locatereqd_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (locatereqd_to_json d)
    )
;;

let mdentrytype_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (mdentrytype_to_json d)
    )
;;

let mdreqrejreason_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (mdreqrejreason_to_json d)
    )
;;

let mdupdateaction_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (mdupdateaction_to_json d)
    )
;;

let mdupdatetype_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (mdupdatetype_to_json d)
    )
;;

let messageencoding_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (messageencoding_to_json d)
    )
;;

let miscfeetype_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (miscfeetype_to_json d)
    )
;;

let msgdirection_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (msgdirection_to_json d)
    )
;;

let multilegreportingtype_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (multilegreportingtype_to_json d)
    )
;;

let netgrossind_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (netgrossind_to_json d)
    )
;;

let notifybrokerofcredit_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (notifybrokerofcredit_to_json d)
    )
;;

let openclose_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (openclose_to_json d)
    )
;;

let openclosesettleflag_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (openclosesettleflag_to_json d)
    )
;;

let ordrejreason_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (ordrejreason_to_json d)
    )
;;

let ordstatus_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (ordstatus_to_json d)
    )
;;

let ordtype_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (ordtype_to_json d)
    )
;;

let possdupflag_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (possdupflag_to_json d)
    )
;;

let possresend_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (possresend_to_json d)
    )
;;

let pricetype_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (pricetype_to_json d)
    )
;;

let processcode_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (processcode_to_json d)
    )
;;

let progrptreqs_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (progrptreqs_to_json d)
    )
;;

let putorcall_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (putorcall_to_json d)
    )
;;

let quoteackstatus_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (quoteackstatus_to_json d)
    )
;;

let quotecanceltype_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (quotecanceltype_to_json d)
    )
;;

let quotecondition_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (quotecondition_to_json d)
    )
;;

let quoteentryrejectreason_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (quoteentryrejectreason_to_json d)
    )
;;

let quoterejectreason_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (quoterejectreason_to_json d)
    )
;;

let quoterequesttype_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (quoterequesttype_to_json d)
    )
;;

let quoteresponselevel_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (quoteresponselevel_to_json d)
    )
;;

let reporttoexch_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (reporttoexch_to_json d)
    )
;;

let resetseqnumflag_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (resetseqnumflag_to_json d)
    )
;;

let routingtype_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (routingtype_to_json d)
    )
;;

let rule80a_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (rule80a_to_json d)
    )
;;

let securityrequesttype_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (securityrequesttype_to_json d)
    )
;;

let securityresponsetype_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (securityresponsetype_to_json d)
    )
;;

let securitytradingstatus_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (securitytradingstatus_to_json d)
    )
;;

let securitytype_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (securitytype_to_json d)
    )
;;

let settlinstmode_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (settlinstmode_to_json d)
    )
;;

let settlinstsource_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (settlinstsource_to_json d)
    )
;;

let settlinsttranstype_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (settlinsttranstype_to_json d)
    )
;;

let settllocation_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (settllocation_to_json d)
    )
;;

let settlmnttyp_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (settlmnttyp_to_json d)
    )
;;

let side_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (side_to_json d)
    )
;;

let solicitedflag_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (solicitedflag_to_json d)
    )
;;

let standinstdbtype_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (standinstdbtype_to_json d)
    )
;;

let subscriptionrequesttype_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (subscriptionrequesttype_to_json d)
    )
;;

let tickdirection_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (tickdirection_to_json d)
    )
;;

let timeinforce_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (timeinforce_to_json d)
    )
;;

let tradsesmethod_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (tradsesmethod_to_json d)
    )
;;

let tradsesmode_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (tradsesmode_to_json d)
    )
;;

let tradsesstatus_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (tradsesstatus_to_json d)
    )
;;

let tradecondition_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (tradecondition_to_json d)
    )
;;

let tradetype_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (tradetype_to_json d)
    )
;;

let unsolicitedindicator_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (unsolicitedindicator_to_json d)
    )
;;

let urgency_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (urgency_to_json d)
    )
;;

let week_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (week_to_json d)
    )
;;

let currency_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (currency_to_json d)
    )
;;

let country_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (country_to_json d)
    )
;;

let exchange_opt_to_json ( d ) : json =
    (match d with
        | None -> (`Null)
        | Some d -> (exchange_to_json d)
    )
;;
