(* Aesthetic Integration copyright 2017 *)
(* @meta[imandra_ignore] on @end *)
open Full_app_enums;;
(* @meta[imandra_ignore] off @end *)

let encode_Adjustment ( d ) =
    (match d with
        | FIX_Adjustment_Cancel -> "1"
        | FIX_Adjustment_Error -> "2"
        | FIX_Adjustment_Correction -> "3"
    )
;;

let encode_AdvSide ( d ) =
    (match d with
        | FIX_AdvSide_Buy -> "B"
        | FIX_AdvSide_Sell -> "S"
        | FIX_AdvSide_Trade -> "T"
        | FIX_AdvSide_Cross -> "X"
    )
;;

let encode_AdvTransType ( d ) =
    (match d with
        | FIX_AdvTransType_Cancel -> "C"
        | FIX_AdvTransType_New -> "N"
        | FIX_AdvTransType_Replace -> "R"
    )
;;

let encode_AggregatedBook ( d ) =
    (match d with
        | FIX_AggregatedBook_BookEntriesShouldNotBeAggregated -> "N"
        | FIX_AggregatedBook_BookEntriesToBeAggregated -> "Y"
    )
;;

let encode_AllocHandlInst ( d ) =
    (match d with
        | FIX_AllocHandlInst_Match -> "1"
        | FIX_AllocHandlInst_Forward -> "2"
        | FIX_AllocHandlInst_ForwardAndMatch -> "3"
    )
;;

let encode_AllocLinkType ( d ) =
    (match d with
        | FIX_AllocLinkType_FXNetting -> "0"
        | FIX_AllocLinkType_FXSwap -> "1"
    )
;;

let encode_AllocRejCode ( d ) =
    (match d with
        | FIX_AllocRejCode_UnknownAccount -> "0"
        | FIX_AllocRejCode_IncorrectQuantity -> "1"
        | FIX_AllocRejCode_IncorrectAveragegPrice -> "2"
        | FIX_AllocRejCode_UnknownExecutingBrokerMnemonic -> "3"
        | FIX_AllocRejCode_CommissionDifference -> "4"
        | FIX_AllocRejCode_UnknownOrderID -> "5"
        | FIX_AllocRejCode_UnknownListID -> "6"
        | FIX_AllocRejCode_OtherSeeText -> "7"
    )
;;

let encode_AllocStatus ( d ) =
    (match d with
        | FIX_AllocStatus_Accepted -> "0"
        | FIX_AllocStatus_BlockLevelReject -> "1"
        | FIX_AllocStatus_AccountLevelReject -> "2"
        | FIX_AllocStatus_Received -> "3"
    )
;;

let encode_AllocTransType ( d ) =
    (match d with
        | FIX_AllocTransType_New -> "0"
        | FIX_AllocTransType_Replace -> "1"
        | FIX_AllocTransType_Cancel -> "2"
        | FIX_AllocTransType_Preliminary -> "3"
        | FIX_AllocTransType_Calculated -> "4"
        | FIX_AllocTransType_CalculatedWithoutPreliminary -> "5"
    )
;;

let encode_BasisPxType ( d ) =
    (match d with
        | FIX_BasisPxType_ClosingPriceAtMorningSession -> "2"
        | FIX_BasisPxType_ClosingPrice -> "3"
        | FIX_BasisPxType_CurrentPrice -> "4"
        | FIX_BasisPxType_SQ -> "5"
        | FIX_BasisPxType_VWAPThroughADay -> "6"
        | FIX_BasisPxType_VWAPThroughAMorningSession -> "7"
        | FIX_BasisPxType_VWAPThroughAnAfternoonSession -> "8"
        | FIX_BasisPxType_VWAPThroughADayExcept -> "9"
        | FIX_BasisPxType_VWAPThroughAMorningSessionExcept -> "A"
        | FIX_BasisPxType_VWAPThroughAnAfternoonSessionExcept -> "B"
        | FIX_BasisPxType_Strike -> "C"
        | FIX_BasisPxType_Open -> "D"
        | FIX_BasisPxType_Others -> "Z"
    )
;;

let encode_Benchmark ( d ) =
    (match d with
        | FIX_Benchmark_CURVE -> "1"
        | FIX_Benchmark_FiveYR -> "2"
        | FIX_Benchmark_OLD5 -> "3"
        | FIX_Benchmark_TenYR -> "4"
        | FIX_Benchmark_OLD10 -> "5"
        | FIX_Benchmark_ThirtyYR -> "6"
        | FIX_Benchmark_OLD30 -> "7"
        | FIX_Benchmark_ThreeMOLIBOR -> "8"
        | FIX_Benchmark_SixMOLIBOR -> "9"
    )
;;

let encode_BidRequestTransType ( d ) =
    (match d with
        | FIX_BidRequestTransType_Cancel -> "C"
        | FIX_BidRequestTransType_New -> "N"
    )
;;

let encode_CommType ( d ) =
    (match d with
        | FIX_CommType_PerUnit -> "1"
        | FIX_CommType_Percent -> "2"
        | FIX_CommType_Absolute -> "3"
    )
;;

let encode_CorporateAction ( d ) =
    (match d with
        | FIX_CorporateAction_ExDividend -> "A"
        | FIX_CorporateAction_ExDistribution -> "B"
        | FIX_CorporateAction_ExRights -> "C"
        | FIX_CorporateAction_New -> "D"
        | FIX_CorporateAction_ExInterest -> "E"
    )
;;

let encode_CoveredOrUncovered ( d ) =
    (match d with
        | FIX_CoveredOrUncovered_Covered -> "0"
        | FIX_CoveredOrUncovered_Uncovered -> "1"
    )
;;

let encode_CustomerOrFirm ( d ) =
    (match d with
        | FIX_CustomerOrFirm_Customer -> "0"
        | FIX_CustomerOrFirm_Firm -> "1"
    )
;;

let encode_CxlRejReason ( d ) =
    (match d with
        | FIX_CxlRejReason_TooLateToCancel -> "0"
        | FIX_CxlRejReason_UnknownOrder -> "1"
        | FIX_CxlRejReason_BrokerCredit -> "2"
        | FIX_CxlRejReason_OrderAlreadyInPendingStatus -> "3"
    )
;;

let encode_CxlRejResponseTo ( d ) =
    (match d with
        | FIX_CxlRejResponseTo_OrderCancelRequest -> "1"
        | FIX_CxlRejResponseTo_OrderCancel -> "2"
    )
;;

let encode_DKReason ( d ) =
    (match d with
        | FIX_DKReason_UnknownSymbol -> "A"
        | FIX_DKReason_WrongSide -> "B"
        | FIX_DKReason_QuantityExceedsOrder -> "C"
        | FIX_DKReason_NoMatchingOrder -> "D"
        | FIX_DKReason_PriceExceedsLimit -> "E"
        | FIX_DKReason_Other -> "Z"
    )
;;

let encode_DeleteReason ( d ) =
    (match d with
        | FIX_DeleteReason_Cancellation -> "0"
        | FIX_DeleteReason_Error -> "1"
    )
;;

let encode_DiscretionInst ( d ) =
    (match d with
        | FIX_DiscretionInst_RelatedToDisplayedPrice -> "0"
        | FIX_DiscretionInst_RelatedToMarketPrice -> "1"
        | FIX_DiscretionInst_RelatedToPrimaryPrice -> "2"
        | FIX_DiscretionInst_RelatedToLocalPrimaryPrice -> "3"
        | FIX_DiscretionInst_RelatedToMidpointPrice -> "4"
        | FIX_DiscretionInst_RelatedToLastTradePrice -> "5"
    )
;;

let encode_DueToRelated ( d ) =
    (match d with
        | FIX_DueToRelated_NotRelatedToSecurityHalt -> "N"
        | FIX_DueToRelated_RelatedToSecurityHalt -> "Y"
    )
;;

let encode_EmailType ( d ) =
    (match d with
        | FIX_EmailType_New -> "0"
        | FIX_EmailType_Reply -> "1"
        | FIX_EmailType_AdminReply -> "2"
    )
;;

let encode_ExchangeForPhysical ( d ) =
    (match d with
        | FIX_ExchangeForPhysical_False -> "N"
        | FIX_ExchangeForPhysical_True -> "Y"
    )
;;

let encode_ExecInst ( d ) =
    (match d with
        | FIX_ExecInst_StayOnOfferSide -> "0"
        | FIX_ExecInst_NotHeld -> "1"
        | FIX_ExecInst_Work -> "2"
        | FIX_ExecInst_GoAlong -> "3"
        | FIX_ExecInst_OverTheDay -> "4"
        | FIX_ExecInst_Held -> "5"
        | FIX_ExecInst_ParticipateDoNotInitiate -> "6"
        | FIX_ExecInst_StrictScale -> "7"
        | FIX_ExecInst_TryToScale -> "8"
        | FIX_ExecInst_StayOnBidSide -> "9"
        | FIX_ExecInst_NoCross -> "A"
        | FIX_ExecInst_OKToCross -> "B"
        | FIX_ExecInst_CallFirst -> "C"
        | FIX_ExecInst_PercentOfVolume -> "D"
        | FIX_ExecInst_DoNotIncrease -> "E"
        | FIX_ExecInst_DoNotReduce -> "F"
        | FIX_ExecInst_AllOrNone -> "G"
        | FIX_ExecInst_InstitutionsOnly -> "I"
        | FIX_ExecInst_LastPeg -> "L"
        | FIX_ExecInst_MidPricePeg -> "M"
        | FIX_ExecInst_NonNegotiable -> "N"
        | FIX_ExecInst_OpeningPeg -> "O"
        | FIX_ExecInst_MarketPeg -> "P"
        | FIX_ExecInst_PrimaryPeg -> "R"
        | FIX_ExecInst_Suspend -> "S"
        | FIX_ExecInst_FixedPegToLocalBestBidOrOfferAtTimeOfOrder -> "T"
        | FIX_ExecInst_CustomerDisplayInstruction -> "U"
        | FIX_ExecInst_Netting -> "V"
        | FIX_ExecInst_PegToVWAP -> "W"
    )
;;

let encode_ExecRestatementReason ( d ) =
    (match d with
        | FIX_ExecRestatementReason_GTCorporateAction -> "0"
        | FIX_ExecRestatementReason_GTRenewal -> "1"
        | FIX_ExecRestatementReason_VerbalChange -> "2"
        | FIX_ExecRestatementReason_RepricingOfOrder -> "3"
        | FIX_ExecRestatementReason_BrokerOption -> "4"
        | FIX_ExecRestatementReason_PartialDeclineOfOrderQty -> "5"
    )
;;

let encode_ExecTransType ( d ) =
    (match d with
        | FIX_ExecTransType_New -> "0"
        | FIX_ExecTransType_Cancel -> "1"
        | FIX_ExecTransType_Correct -> "2"
        | FIX_ExecTransType_Status -> "3"
    )
;;

let encode_ExecType ( d ) =
    (match d with
        | FIX_ExecType_New -> "0"
        | FIX_ExecType_PartialFill -> "1"
        | FIX_ExecType_Fill -> "2"
        | FIX_ExecType_DoneForDay -> "3"
        | FIX_ExecType_Canceled -> "4"
        | FIX_ExecType_Replaced -> "5"
        | FIX_ExecType_PendingCancel -> "6"
        | FIX_ExecType_Stopped -> "7"
        | FIX_ExecType_Rejected -> "8"
        | FIX_ExecType_Suspended -> "9"
        | FIX_ExecType_PendingNew -> "A"
        | FIX_ExecType_Calculated -> "B"
        | FIX_ExecType_Expired -> "C"
        | FIX_ExecType_Restated -> "D"
        | FIX_ExecType_PendingReplace -> "E"
    )
;;

let encode_FinancialStatus ( d ) =
    (match d with
        | FIX_FinancialStatus_Bankrupt -> "1"
    )
;;

let encode_ForexReq ( d ) =
    (match d with
        | FIX_ForexReq_DoNotExecuteForexAfterSecurityTrade -> "N"
        | FIX_ForexReq_ExecuteForexAfterSecurityTrade -> "Y"
    )
;;

let encode_GTBookingInst ( d ) =
    (match d with
        | FIX_GTBookingInst_BookOutAllTradesOnDayOfExecution -> "0"
        | FIX_GTBookingInst_AccumulateUntilFilledOrExpired -> "1"
        | FIX_GTBookingInst_AccumulateUntilVerballlyNotifiedOtherwise -> "2"
    )
;;

let encode_HaltReason ( d ) =
    (match d with
        | FIX_HaltReason_NewsDissemination -> "D"
        | FIX_HaltReason_OrderInflux -> "E"
        | FIX_HaltReason_OrderImbalance -> "I"
        | FIX_HaltReason_AdditionalInformation -> "M"
        | FIX_HaltReason_NewsPending -> "P"
        | FIX_HaltReason_EquipmentChangeover -> "X"
    )
;;

let encode_HandlInst ( d ) =
    (match d with
        | FIX_HandlInst_AutomatedExecutionNoIntervention -> "1"
        | FIX_HandlInst_AutomatedExecutionInterventionOK -> "2"
        | FIX_HandlInst_ManualOrder -> "3"
    )
;;

let encode_IDSource ( d ) =
    (match d with
        | FIX_IDSource_CUSIP -> "1"
        | FIX_IDSource_SEDOL -> "2"
        | FIX_IDSource_QUIK -> "3"
        | FIX_IDSource_ISINNumber -> "4"
        | FIX_IDSource_RICCode -> "5"
        | FIX_IDSource_ISOCurrencyCode -> "6"
        | FIX_IDSource_ISOCountryCode -> "7"
        | FIX_IDSource_ExchangeSymbol -> "8"
        | FIX_IDSource_ConsolidatedTapeAssociation -> "9"
    )
;;

let encode_IOINaturalFlag ( d ) =
    (match d with
        | FIX_IOINaturalFlag_NotNatural -> "N"
        | FIX_IOINaturalFlag_Natural -> "Y"
    )
;;

let encode_IOIQltyInd ( d ) =
    (match d with
        | FIX_IOIQltyInd_High -> "H"
        | FIX_IOIQltyInd_Low -> "L"
        | FIX_IOIQltyInd_Medium -> "M"
    )
;;

let encode_IOIQualifier ( d ) =
    (match d with
        | FIX_IOIQualifier_AllOrNone -> "A"
        | FIX_IOIQualifier_AtTheClose -> "C"
        | FIX_IOIQualifier_InTouchWith -> "I"
        | FIX_IOIQualifier_Limit -> "L"
        | FIX_IOIQualifier_MoreBehind -> "M"
        | FIX_IOIQualifier_AtTheOpen -> "O"
        | FIX_IOIQualifier_TakingAPosition -> "P"
        | FIX_IOIQualifier_AtTheMarket -> "Q"
        | FIX_IOIQualifier_ReadyToTrade -> "R"
        | FIX_IOIQualifier_PortfolioShown -> "S"
        | FIX_IOIQualifier_ThroughTheDay -> "T"
        | FIX_IOIQualifier_Versus -> "V"
        | FIX_IOIQualifier_Indication -> "W"
        | FIX_IOIQualifier_CrossingOpportunity -> "X"
        | FIX_IOIQualifier_AtTheMidpoint -> "Y"
        | FIX_IOIQualifier_PreOpen -> "Z"
    )
;;

let encode_IOIShares ( d ) =
    (match d with
        | FIX_IOIShares_Large -> "L"
        | FIX_IOIShares_Medium -> "M"
        | FIX_IOIShares_Small -> "S"
    )
;;

let encode_IOITransType ( d ) =
    (match d with
        | FIX_IOITransType_Cancel -> "C"
        | FIX_IOITransType_New -> "N"
        | FIX_IOITransType_Replace -> "R"
    )
;;

let encode_InViewOfCommon ( d ) =
    (match d with
        | FIX_InViewOfCommon_HaltWasNotRelatedToAHaltOfTheCommonStock -> "N"
        | FIX_InViewOfCommon_HaltWasDueToCommonStockBeingHalted -> "Y"
    )
;;

let encode_IncTaxInd ( d ) =
    (match d with
        | FIX_IncTaxInd_Net -> "1"
        | FIX_IncTaxInd_Gross -> "2"
    )
;;

let encode_LastCapacity ( d ) =
    (match d with
        | FIX_LastCapacity_Agent -> "1"
        | FIX_LastCapacity_CrossAsAgent -> "2"
        | FIX_LastCapacity_CrossAsPrincipal -> "3"
        | FIX_LastCapacity_Principal -> "4"
    )
;;

let encode_LiquidityIndType ( d ) =
    (match d with
        | FIX_LiquidityIndType_FiveDayMovingAverage -> "1"
        | FIX_LiquidityIndType_TwentyDayMovingAverage -> "2"
        | FIX_LiquidityIndType_NormalMarketSize -> "3"
        | FIX_LiquidityIndType_Other -> "4"
    )
;;

let encode_ListExecInstType ( d ) =
    (match d with
        | FIX_ListExecInstType_Immediate -> "1"
        | FIX_ListExecInstType_WaitForInstruction -> "2"
    )
;;

let encode_LocateReqd ( d ) =
    (match d with
        | FIX_LocateReqd_No -> "N"
        | FIX_LocateReqd_Yes -> "Y"
    )
;;

let encode_MDEntryType ( d ) =
    (match d with
        | FIX_MDEntryType_Bid -> "0"
        | FIX_MDEntryType_Offer -> "1"
        | FIX_MDEntryType_Trade -> "2"
        | FIX_MDEntryType_IndexValue -> "3"
        | FIX_MDEntryType_OpeningPrice -> "4"
        | FIX_MDEntryType_ClosingPrice -> "5"
        | FIX_MDEntryType_SettlementPrice -> "6"
        | FIX_MDEntryType_TradingSessionHighPrice -> "7"
        | FIX_MDEntryType_TradingSessionLowPrice -> "8"
        | FIX_MDEntryType_TradingSessionVWAPPrice -> "9"
    )
;;

let encode_MDReqRejReason ( d ) =
    (match d with
        | FIX_MDReqRejReason_UnknownSymbol -> "0"
        | FIX_MDReqRejReason_DuplicateMDReqID -> "1"
        | FIX_MDReqRejReason_InsufficientBandwidth -> "2"
        | FIX_MDReqRejReason_InsufficientPermissions -> "3"
        | FIX_MDReqRejReason_UnsupportedSubscriptionRequestType -> "4"
        | FIX_MDReqRejReason_UnsupportedMarketDepth -> "5"
        | FIX_MDReqRejReason_UnsupportedMDUpdateType -> "6"
        | FIX_MDReqRejReason_UnsupportedAggregatedBook -> "7"
        | FIX_MDReqRejReason_UnsupportedMDEntryType -> "8"
    )
;;

let encode_MDUpdateAction ( d ) =
    (match d with
        | FIX_MDUpdateAction_New -> "0"
        | FIX_MDUpdateAction_Change -> "1"
        | FIX_MDUpdateAction_Delete -> "2"
    )
;;

let encode_MDUpdateType ( d ) =
    (match d with
        | FIX_MDUpdateType_FullRefresh -> "0"
        | FIX_MDUpdateType_IncrementalRefresh -> "1"
    )
;;

let encode_MessageEncoding ( d ) =
    (match d with
        | FIX_MessageEncoding_EUCJP -> "EUC-JP"
        | FIX_MessageEncoding_ISO2022JP -> "ISO-2022-JP"
        | FIX_MessageEncoding_ShiftJIS -> "Shift_JIS"
        | FIX_MessageEncoding_UTF8 -> "UTF-8"
    )
;;

let encode_MiscFeeType ( d ) =
    (match d with
        | FIX_MiscFeeType_Regulatory -> "1"
        | FIX_MiscFeeType_Tax -> "2"
        | FIX_MiscFeeType_LocalCommission -> "3"
        | FIX_MiscFeeType_ExchangeFees -> "4"
        | FIX_MiscFeeType_Stamp -> "5"
        | FIX_MiscFeeType_Levy -> "6"
        | FIX_MiscFeeType_Other -> "7"
        | FIX_MiscFeeType_Markup -> "8"
        | FIX_MiscFeeType_ConsumptionTax -> "9"
    )
;;

let encode_MsgDirection ( d ) =
    (match d with
        | FIX_MsgDirection_Receive -> "R"
        | FIX_MsgDirection_Send -> "S"
    )
;;

let encode_MultiLegReportingType ( d ) =
    (match d with
        | FIX_MultiLegReportingType_SingleSecurity -> "1"
        | FIX_MultiLegReportingType_IndividualLegOfAMultiLegSecurity -> "2"
        | FIX_MultiLegReportingType_MultiLegSecurity -> "3"
    )
;;

let encode_NetGrossInd ( d ) =
    (match d with
        | FIX_NetGrossInd_Net -> "1"
        | FIX_NetGrossInd_Gross -> "2"
    )
;;

let encode_NotifyBrokerOfCredit ( d ) =
    (match d with
        | FIX_NotifyBrokerOfCredit_DetailsShouldNotBeCommunicated -> "N"
        | FIX_NotifyBrokerOfCredit_DetailsShouldBeCommunicated -> "Y"
    )
;;

let encode_OpenClose ( d ) =
    (match d with
        | FIX_OpenClose_Close -> "C"
        | FIX_OpenClose_Open -> "O"
    )
;;

let encode_OpenCloseSettleFlag ( d ) =
    (match d with
        | FIX_OpenCloseSettleFlag_DailyOpen -> "0"
        | FIX_OpenCloseSettleFlag_SessionOpen -> "1"
        | FIX_OpenCloseSettleFlag_DeliverySettlementEntry -> "2"
    )
;;

let encode_OrdRejReason ( d ) =
    (match d with
        | FIX_OrdRejReason_BrokerCredit -> "0"
        | FIX_OrdRejReason_UnknownSymbol -> "1"
        | FIX_OrdRejReason_ExchangeClosed -> "2"
        | FIX_OrdRejReason_OrderExceedsLimit -> "3"
        | FIX_OrdRejReason_TooLateToEnter -> "4"
        | FIX_OrdRejReason_UnknownOrder -> "5"
        | FIX_OrdRejReason_DuplicateOrder -> "6"
        | FIX_OrdRejReason_DuplicateOfAVerballyCommunicatedOrder -> "7"
        | FIX_OrdRejReason_StaleOrder -> "8"
    )
;;

let encode_OrdStatus ( d ) =
    (match d with
        | FIX_OrdStatus_New -> "0"
        | FIX_OrdStatus_PartiallyFilled -> "1"
        | FIX_OrdStatus_Filled -> "2"
        | FIX_OrdStatus_DoneForDay -> "3"
        | FIX_OrdStatus_Canceled -> "4"
        | FIX_OrdStatus_Replaced -> "5"
        | FIX_OrdStatus_PendingCancel -> "6"
        | FIX_OrdStatus_Stopped -> "7"
        | FIX_OrdStatus_Rejected -> "8"
        | FIX_OrdStatus_Suspended -> "9"
        | FIX_OrdStatus_PendingNew -> "A"
        | FIX_OrdStatus_Calculated -> "B"
        | FIX_OrdStatus_Expired -> "C"
        | FIX_OrdStatus_AcceptedForBidding -> "D"
        | FIX_OrdStatus_PendingReplace -> "E"
    )
;;

let encode_OrdType ( d ) =
    (match d with
        | FIX_OrdType_Market -> "1"
        | FIX_OrdType_Limit -> "2"
        | FIX_OrdType_Stop -> "3"
        | FIX_OrdType_StopLimit -> "4"
        | FIX_OrdType_MarketOnClose -> "5"
        | FIX_OrdType_WithOrWithout -> "6"
        | FIX_OrdType_LimitOrBetter -> "7"
        | FIX_OrdType_LimitWithOrWithout -> "8"
        | FIX_OrdType_OnBasis -> "9"
        | FIX_OrdType_OnClose -> "A"
        | FIX_OrdType_LimitOnClose -> "B"
        | FIX_OrdType_ForexMarket -> "C"
        | FIX_OrdType_PreviouslyQuoted -> "D"
        | FIX_OrdType_PreviouslyIndicated -> "E"
        | FIX_OrdType_ForexLimit -> "F"
        | FIX_OrdType_ForexSwap -> "G"
        | FIX_OrdType_ForexPreviouslyQuoted -> "H"
        | FIX_OrdType_Funari -> "I"
        | FIX_OrdType_Pegged -> "P"
    )
;;

let encode_PossDupFlag ( d ) =
    (match d with
        | FIX_PossDupFlag_OriginalTransmission -> "N"
        | FIX_PossDupFlag_PossibleDuplicate -> "Y"
    )
;;

let encode_PossResend ( d ) =
    (match d with
        | FIX_PossResend_OriginalTransmission -> "N"
        | FIX_PossResend_PossibleResend -> "Y"
    )
;;

let encode_PriceType ( d ) =
    (match d with
        | FIX_PriceType_Percentage -> "1"
        | FIX_PriceType_PerUnit -> "2"
        | FIX_PriceType_FixedAmount -> "3"
    )
;;

let encode_ProcessCode ( d ) =
    (match d with
        | FIX_ProcessCode_Regular -> "0"
        | FIX_ProcessCode_SoftDollar -> "1"
        | FIX_ProcessCode_StepIn -> "2"
        | FIX_ProcessCode_StepOut -> "3"
        | FIX_ProcessCode_SoftDollarStepIn -> "4"
        | FIX_ProcessCode_SoftDollarStepOut -> "5"
        | FIX_ProcessCode_PlanSponsor -> "6"
    )
;;

let encode_ProgRptReqs ( d ) =
    (match d with
        | FIX_ProgRptReqs_BuySideRequests -> "1"
        | FIX_ProgRptReqs_SellSideSends -> "2"
        | FIX_ProgRptReqs_RealTimeExecutionReports -> "3"
    )
;;

let encode_PutOrCall ( d ) =
    (match d with
        | FIX_PutOrCall_Put -> "0"
        | FIX_PutOrCall_Call -> "1"
    )
;;

let encode_QuoteAckStatus ( d ) =
    (match d with
        | FIX_QuoteAckStatus_Accepted -> "0"
        | FIX_QuoteAckStatus_CancelForSymbol -> "1"
        | FIX_QuoteAckStatus_CanceledForSecurityType -> "2"
        | FIX_QuoteAckStatus_CanceledForUnderlying -> "3"
        | FIX_QuoteAckStatus_CanceledAll -> "4"
        | FIX_QuoteAckStatus_Rejected -> "5"
    )
;;

let encode_QuoteCancelType ( d ) =
    (match d with
        | FIX_QuoteCancelType_CancelForOneOrMoreSecurities -> "1"
        | FIX_QuoteCancelType_CancelForSecurityType -> "2"
        | FIX_QuoteCancelType_CancelForUnderlyingSecurity -> "3"
        | FIX_QuoteCancelType_CancelAllQuotes -> "4"
    )
;;

let encode_QuoteCondition ( d ) =
    (match d with
        | FIX_QuoteCondition_Open -> "A"
        | FIX_QuoteCondition_Closed -> "B"
        | FIX_QuoteCondition_ExchangeBest -> "C"
        | FIX_QuoteCondition_ConsolidatedBest -> "D"
        | FIX_QuoteCondition_Locked -> "E"
        | FIX_QuoteCondition_Crossed -> "F"
        | FIX_QuoteCondition_Depth -> "G"
        | FIX_QuoteCondition_FastTrading -> "H"
        | FIX_QuoteCondition_NonFirm -> "I"
    )
;;

let encode_QuoteEntryRejectReason ( d ) =
    (match d with
        | FIX_QuoteEntryRejectReason_UnknownSymbol -> "1"
        | FIX_QuoteEntryRejectReason_Exchange -> "2"
        | FIX_QuoteEntryRejectReason_QuoteExceedsLimit -> "3"
        | FIX_QuoteEntryRejectReason_TooLateToEnter -> "4"
        | FIX_QuoteEntryRejectReason_UnknownQuote -> "5"
        | FIX_QuoteEntryRejectReason_DuplicateQuote -> "6"
        | FIX_QuoteEntryRejectReason_InvalidBidAskSpread -> "7"
        | FIX_QuoteEntryRejectReason_InvalidPrice -> "8"
        | FIX_QuoteEntryRejectReason_NotAuthorizedToQuoteSecurity -> "9"
    )
;;

let encode_QuoteRejectReason ( d ) =
    (match d with
        | FIX_QuoteRejectReason_UnknownSymbol -> "1"
        | FIX_QuoteRejectReason_Exchange -> "2"
        | FIX_QuoteRejectReason_QuoteRequestExceedsLimit -> "3"
        | FIX_QuoteRejectReason_TooLateToEnter -> "4"
        | FIX_QuoteRejectReason_UnknownQuote -> "5"
        | FIX_QuoteRejectReason_DuplicateQuote -> "6"
        | FIX_QuoteRejectReason_InvalidBid -> "7"
        | FIX_QuoteRejectReason_InvalidPrice -> "8"
        | FIX_QuoteRejectReason_NotAuthorizedToQuoteSecurity -> "9"
    )
;;

let encode_QuoteRequestType ( d ) =
    (match d with
        | FIX_QuoteRequestType_Manual -> "1"
        | FIX_QuoteRequestType_Automatic -> "2"
    )
;;

let encode_QuoteResponseLevel ( d ) =
    (match d with
        | FIX_QuoteResponseLevel_NoAcknowledgement -> "0"
        | FIX_QuoteResponseLevel_AcknowledgeOnlyNegativeOrErroneousQuotes -> "1"
        | FIX_QuoteResponseLevel_AcknowledgeEachQuoteMessage -> "2"
    )
;;

let encode_ReportToExch ( d ) =
    (match d with
        | FIX_ReportToExch_SenderReports -> "N"
        | FIX_ReportToExch_ReceiverReports -> "Y"
    )
;;

let encode_ResetSeqNumFlag ( d ) =
    (match d with
        | FIX_ResetSeqNumFlag_No -> "N"
        | FIX_ResetSeqNumFlag_Yes -> "Y"
    )
;;

let encode_RoutingType ( d ) =
    (match d with
        | FIX_RoutingType_TargetFirm -> "1"
        | FIX_RoutingType_TargetList -> "2"
        | FIX_RoutingType_BlockFirm -> "3"
        | FIX_RoutingType_BlockList -> "4"
    )
;;

let encode_Rule80A ( d ) =
    (match d with
        | FIX_Rule80A_AgencySingleOrder -> "A"
        | FIX_Rule80A_ShortExemptTransactionAType -> "B"
        | FIX_Rule80A_ProprietaryNonAlgo -> "C"
        | FIX_Rule80A_ProgramOrderMember -> "D"
        | FIX_Rule80A_ShortExemptTransactionForPrincipal -> "E"
        | FIX_Rule80A_ShortExemptTransactionWType -> "F"
        | FIX_Rule80A_ShortExemptTransactionIType -> "H"
        | FIX_Rule80A_IndividualInvestor -> "I"
        | FIX_Rule80A_ProprietaryAlgo -> "J"
        | FIX_Rule80A_AgencyAlgo -> "K"
        | FIX_Rule80A_ShortExemptTransactionMemberAffliated -> "L"
        | FIX_Rule80A_ProgramOrderOtherMember -> "M"
        | FIX_Rule80A_AgentForOtherMember -> "N"
        | FIX_Rule80A_ProprietaryTransactionAffiliated -> "O"
        | FIX_Rule80A_Principal -> "P"
        | FIX_Rule80A_TransactionNonMember -> "R"
        | FIX_Rule80A_SpecialistTrades -> "S"
        | FIX_Rule80A_TransactionUnaffiliatedMember -> "T"
        | FIX_Rule80A_AgencyIndexArb -> "U"
        | FIX_Rule80A_AllOtherOrdersAsAgentForOtherMember -> "W"
        | FIX_Rule80A_ShortExemptTransactionMemberNotAffliated -> "X"
        | FIX_Rule80A_AgencyNonAlgo -> "Y"
        | FIX_Rule80A_ShortExemptTransactionNonMember -> "Z"
    )
;;

let encode_SecurityRequestType ( d ) =
    (match d with
        | FIX_SecurityRequestType_RequestSecurityIdentityAndSpecifications -> "0"
        | FIX_SecurityRequestType_RequestSecurityIdentityForSpecifications -> "1"
        | FIX_SecurityRequestType_RequestListSecurityTypes -> "2"
        | FIX_SecurityRequestType_RequestListSecurities -> "3"
    )
;;

let encode_SecurityResponseType ( d ) =
    (match d with
        | FIX_SecurityResponseType_AcceptAsIs -> "1"
        | FIX_SecurityResponseType_AcceptWithRevisions -> "2"
        | FIX_SecurityResponseType_ListOfSecurityTypesReturnedPerRequest -> "3"
        | FIX_SecurityResponseType_ListOfSecuritiesReturnedPerRequest -> "4"
        | FIX_SecurityResponseType_RejectSecurityProposal -> "5"
        | FIX_SecurityResponseType_CannotMatchSelectionCriteria -> "6"
    )
;;

let encode_SecurityTradingStatus ( d ) =
    (match d with
        | FIX_SecurityTradingStatus_OpeningDelay -> "1"
        | FIX_SecurityTradingStatus_MarketOnCloseImbalanceSell -> "10"
        | FIX_SecurityTradingStatus_NoMarketImbalance -> "12"
        | FIX_SecurityTradingStatus_NoMarketOnCloseImbalance -> "13"
        | FIX_SecurityTradingStatus_ITSPreOpening -> "14"
        | FIX_SecurityTradingStatus_NewPriceIndication -> "15"
        | FIX_SecurityTradingStatus_TradeDisseminationTime -> "16"
        | FIX_SecurityTradingStatus_ReadyToTrade -> "17"
        | FIX_SecurityTradingStatus_NotAvailableForTrading -> "18"
        | FIX_SecurityTradingStatus_NotTradedOnThisMarket -> "19"
        | FIX_SecurityTradingStatus_TradingHalt -> "2"
        | FIX_SecurityTradingStatus_UnknownOrInvalid -> "20"
        | FIX_SecurityTradingStatus_Resume -> "3"
        | FIX_SecurityTradingStatus_NoOpen -> "4"
        | FIX_SecurityTradingStatus_PriceIndication -> "5"
        | FIX_SecurityTradingStatus_TradingRangeIndication -> "6"
        | FIX_SecurityTradingStatus_MarketImbalanceBuy -> "7"
        | FIX_SecurityTradingStatus_MarketImbalanceSell -> "8"
        | FIX_SecurityTradingStatus_MarketOnCloseImbalanceBuy -> "9"
    )
;;

let encode_SecurityType ( d ) =
    (match d with
        | FIX_SecurityType_Wildcard -> "?"
        | FIX_SecurityType_BankersAcceptance -> "BA"
        | FIX_SecurityType_ConvertibleBond -> "CB"
        | FIX_SecurityType_CertificateOfDeposit -> "CD"
        | FIX_SecurityType_CollateralizedMortgageObligation -> "CMO"
        | FIX_SecurityType_CorporateBond -> "CORP"
        | FIX_SecurityType_CommercialPaper -> "CP"
        | FIX_SecurityType_CorporatePrivatePlacement -> "CPP"
        | FIX_SecurityType_CommonStock -> "CS"
        | FIX_SecurityType_FederalHousingAuthority -> "FHA"
        | FIX_SecurityType_FederalHomeLoan -> "FHL"
        | FIX_SecurityType_FederalNationalMortgageAssociation -> "FN"
        | FIX_SecurityType_ForeignExchangeContract -> "FOR"
        | FIX_SecurityType_Future -> "FUT"
        | FIX_SecurityType_GovernmentNationalMortgageAssociation -> "GN"
        | FIX_SecurityType_TreasuriesAgencyDebenture -> "GOVT"
        | FIX_SecurityType_IOETTEMortgage -> "IET"
        | FIX_SecurityType_MutualFund -> "MF"
        | FIX_SecurityType_MortgageInterestOnly -> "MIO"
        | FIX_SecurityType_MortgagePrincipalOnly -> "MPO"
        | FIX_SecurityType_MortgagePrivatePlacement -> "MPP"
        | FIX_SecurityType_MiscellaneousPassThrough -> "MPT"
        | FIX_SecurityType_MunicipalBond -> "MUNI"
        | FIX_SecurityType_NoSecurityType -> "NONE"
        | FIX_SecurityType_Option -> "OPT"
        | FIX_SecurityType_PreferredStock -> "PS"
        | FIX_SecurityType_RepurchaseAgreement -> "RP"
        | FIX_SecurityType_ReverseRepurchaseAgreement -> "RVRP"
        | FIX_SecurityType_StudentLoanMarketingAssociation -> "SL"
        | FIX_SecurityType_TimeDeposit -> "TD"
        | FIX_SecurityType_USTreasuryBillOld -> "USTB"
        | FIX_SecurityType_Warrant -> "WAR"
        | FIX_SecurityType_CatsTigersAndLions -> "ZOO"
    )
;;

let encode_SettlInstMode ( d ) =
    (match d with
        | FIX_SettlInstMode_Default -> "0"
        | FIX_SettlInstMode_StandingInstructionsProvided -> "1"
        | FIX_SettlInstMode_SpecificAllocationAccountOverriding -> "2"
        | FIX_SettlInstMode_SpecificAllocationAccountStanding -> "3"
    )
;;

let encode_SettlInstSource ( d ) =
    (match d with
        | FIX_SettlInstSource_BrokerCredit -> "1"
        | FIX_SettlInstSource_Institution -> "2"
    )
;;

let encode_SettlInstTransType ( d ) =
    (match d with
        | FIX_SettlInstTransType_Cancel -> "C"
        | FIX_SettlInstTransType_New -> "N"
        | FIX_SettlInstTransType_Replace -> "R"
    )
;;

let encode_SettlLocation ( d ) =
    (match d with
        | FIX_SettlLocation_CEDEL -> "CED"
        | FIX_SettlLocation_DepositoryTrustCompany -> "DTC"
        | FIX_SettlLocation_EuroClear -> "EUR"
        | FIX_SettlLocation_FederalBookEntry -> "FED"
        | FIX_SettlLocation_LocalMarketSettleLocation -> "ISO Country Code"
        | FIX_SettlLocation_Physical -> "PNY"
        | FIX_SettlLocation_ParticipantTrustCompany -> "PTC"
    )
;;

let encode_SettlmntTyp ( d ) =
    (match d with
        | FIX_SettlmntTyp_Regular -> "0"
        | FIX_SettlmntTyp_Cash -> "1"
        | FIX_SettlmntTyp_NextDay -> "2"
        | FIX_SettlmntTyp_TPlus2 -> "3"
        | FIX_SettlmntTyp_TPlus3 -> "4"
        | FIX_SettlmntTyp_TPlus4 -> "5"
        | FIX_SettlmntTyp_Future -> "6"
        | FIX_SettlmntTyp_WhenAndIfIssued -> "7"
        | FIX_SettlmntTyp_SellersOption -> "8"
        | FIX_SettlmntTyp_TPlus5 -> "9"
    )
;;

let encode_Side ( d ) =
    (match d with
        | FIX_Side_Buy -> "1"
        | FIX_Side_Sell -> "2"
        | FIX_Side_BuyMinus -> "3"
        | FIX_Side_SellPlus -> "4"
        | FIX_Side_SellShort -> "5"
        | FIX_Side_SellShortExempt -> "6"
        | FIX_Side_Undisclosed -> "7"
        | FIX_Side_Cross -> "8"
        | FIX_Side_CrossShort -> "9"
    )
;;

let encode_SolicitedFlag ( d ) =
    (match d with
        | FIX_SolicitedFlag_WasNotSolicited -> "N"
        | FIX_SolicitedFlag_WasSolicited -> "Y"
    )
;;

let encode_StandInstDbType ( d ) =
    (match d with
        | FIX_StandInstDbType_Other -> "0"
        | FIX_StandInstDbType_DTCSID -> "1"
        | FIX_StandInstDbType_ThomsonALERT -> "2"
        | FIX_StandInstDbType_AGlobalCustodian -> "3"
    )
;;

let encode_SubscriptionRequestType ( d ) =
    (match d with
        | FIX_SubscriptionRequestType_Snapshot -> "0"
        | FIX_SubscriptionRequestType_SnapshotAndUpdates -> "1"
        | FIX_SubscriptionRequestType_DisablePreviousSnapshot -> "2"
    )
;;

let encode_TickDirection ( d ) =
    (match d with
        | FIX_TickDirection_PlusTick -> "0"
        | FIX_TickDirection_ZeroPlusTick -> "1"
        | FIX_TickDirection_MinusTick -> "2"
        | FIX_TickDirection_ZeroMinusTick -> "3"
    )
;;

let encode_TimeInForce ( d ) =
    (match d with
        | FIX_TimeInForce_Day -> "0"
        | FIX_TimeInForce_GoodTillCancel -> "1"
        | FIX_TimeInForce_AtTheOpening -> "2"
        | FIX_TimeInForce_ImmediateOrCancel -> "3"
        | FIX_TimeInForce_FillOrKill -> "4"
        | FIX_TimeInForce_GoodTillCrossing -> "5"
        | FIX_TimeInForce_GoodTillDate -> "6"
    )
;;

let encode_TradSesMethod ( d ) =
    (match d with
        | FIX_TradSesMethod_Electronic -> "1"
        | FIX_TradSesMethod_OpenOutcry -> "2"
        | FIX_TradSesMethod_TwoParty -> "3"
    )
;;

let encode_TradSesMode ( d ) =
    (match d with
        | FIX_TradSesMode_Testing -> "1"
        | FIX_TradSesMode_Simulated -> "2"
        | FIX_TradSesMode_Production -> "3"
    )
;;

let encode_TradSesStatus ( d ) =
    (match d with
        | FIX_TradSesStatus_Halted -> "1"
        | FIX_TradSesStatus_Open -> "2"
        | FIX_TradSesStatus_Closed -> "3"
        | FIX_TradSesStatus_PreOpen -> "4"
        | FIX_TradSesStatus_PreClose -> "5"
    )
;;

let encode_TradeCondition ( d ) =
    (match d with
        | FIX_TradeCondition_Cash -> "A"
        | FIX_TradeCondition_AveragePriceTrade -> "B"
        | FIX_TradeCondition_CashTrade -> "C"
        | FIX_TradeCondition_NextDay -> "D"
        | FIX_TradeCondition_Opening -> "E"
        | FIX_TradeCondition_IntradayTradeDetail -> "F"
        | FIX_TradeCondition_Rule127Trade -> "G"
        | FIX_TradeCondition_Rule155Trade -> "H"
        | FIX_TradeCondition_SoldLast -> "I"
        | FIX_TradeCondition_NextDayTrade -> "J"
        | FIX_TradeCondition_Opened -> "K"
        | FIX_TradeCondition_Seller -> "L"
        | FIX_TradeCondition_Sold -> "M"
        | FIX_TradeCondition_StoppedStock -> "N"
    )
;;

let encode_TradeType ( d ) =
    (match d with
        | FIX_TradeType_Agency -> "A"
        | FIX_TradeType_VWAPGuarantee -> "G"
        | FIX_TradeType_GuaranteedClose -> "J"
        | FIX_TradeType_RiskTrade -> "R"
    )
;;

let encode_UnsolicitedIndicator ( d ) =
    (match d with
        | FIX_UnsolicitedIndicator_MessageIsBeingSentAsAResultOfAPriorRequest -> "N"
        | FIX_UnsolicitedIndicator_MessageIsBeingSentUnsolicited -> "Y"
    )
;;

let encode_Urgency ( d ) =
    (match d with
        | FIX_Urgency_Normal -> "0"
        | FIX_Urgency_Flash -> "1"
        | FIX_Urgency_Background -> "2"
    )
;;

let encode_week ( d ) =
    (match d with
        | FIX_week_noweek -> "noweek"
        | FIX_week_w1 -> "w1"
        | FIX_week_w2 -> "w2"
        | FIX_week_w3 -> "w3"
        | FIX_week_w4 -> "w4"
        | FIX_week_w5 -> "w5"
    )
;;

let encode_Currency ( d ) =
    (match d with
        | FIX_Currency_EUR -> "EUR"
        | FIX_Currency_GBP -> "GBP"
        | FIX_Currency_USD -> "USD"
    )
;;

let encode_Country ( d ) =
    (match d with
        | FIX_Country_DE -> "DE"
        | FIX_Country_GB -> "GB"
        | FIX_Country_US -> "US"
    )
;;

let encode_Exchange ( d ) =
    (match d with
        | FIX_Exchange_XLON -> "XLON"
        | FIX_Exchange_XNYS -> "XNYS"
        | FIX_Exchange_XNAS -> "XNAS"
        | FIX_Exchange_XJAS -> "XJAS"
        | FIX_Exchange_XSHG -> "XSHG"
        | FIX_Exchange_SHSC -> "SHSC"
    )
;;
