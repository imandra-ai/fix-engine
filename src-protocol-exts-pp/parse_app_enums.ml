(* Aesthetic Integration copyright 2017 *)
(* @meta[imandra_ignore] on @end *)
open Full_app_enums;;
(* @meta[imandra_ignore] off @end *)

let parse_Adjustment ( str ) =
    (match str with
        | "1" -> (Some (FIX_Adjustment_Cancel))
        | "2" -> (Some (FIX_Adjustment_Error))
        | "3" -> (Some (FIX_Adjustment_Correction))
        | _ -> (None)
    )
;;

let parse_AdvSide ( str ) =
    (match str with
        | "B" -> (Some (FIX_AdvSide_Buy))
        | "S" -> (Some (FIX_AdvSide_Sell))
        | "T" -> (Some (FIX_AdvSide_Trade))
        | "X" -> (Some (FIX_AdvSide_Cross))
        | _ -> (None)
    )
;;

let parse_AdvTransType ( str ) =
    (match str with
        | "C" -> (Some (FIX_AdvTransType_Cancel))
        | "N" -> (Some (FIX_AdvTransType_New))
        | "R" -> (Some (FIX_AdvTransType_Replace))
        | _ -> (None)
    )
;;

let parse_AggregatedBook ( str ) =
    (match str with
        | "N" -> (Some (FIX_AggregatedBook_BookEntriesShouldNotBeAggregated))
        | "Y" -> (Some (FIX_AggregatedBook_BookEntriesToBeAggregated))
        | _ -> (None)
    )
;;

let parse_AllocHandlInst ( str ) =
    (match str with
        | "1" -> (Some (FIX_AllocHandlInst_Match))
        | "2" -> (Some (FIX_AllocHandlInst_Forward))
        | "3" -> (Some (FIX_AllocHandlInst_ForwardAndMatch))
        | _ -> (None)
    )
;;

let parse_AllocLinkType ( str ) =
    (match str with
        | "0" -> (Some (FIX_AllocLinkType_FXNetting))
        | "1" -> (Some (FIX_AllocLinkType_FXSwap))
        | _ -> (None)
    )
;;

let parse_AllocRejCode ( str ) =
    (match str with
        | "0" -> (Some (FIX_AllocRejCode_UnknownAccount))
        | "1" -> (Some (FIX_AllocRejCode_IncorrectQuantity))
        | "2" -> (Some (FIX_AllocRejCode_IncorrectAveragegPrice))
        | "3" -> (Some (FIX_AllocRejCode_UnknownExecutingBrokerMnemonic))
        | "4" -> (Some (FIX_AllocRejCode_CommissionDifference))
        | "5" -> (Some (FIX_AllocRejCode_UnknownOrderID))
        | "6" -> (Some (FIX_AllocRejCode_UnknownListID))
        | "7" -> (Some (FIX_AllocRejCode_OtherSeeText))
        | _ -> (None)
    )
;;

let parse_AllocStatus ( str ) =
    (match str with
        | "0" -> (Some (FIX_AllocStatus_Accepted))
        | "1" -> (Some (FIX_AllocStatus_BlockLevelReject))
        | "2" -> (Some (FIX_AllocStatus_AccountLevelReject))
        | "3" -> (Some (FIX_AllocStatus_Received))
        | _ -> (None)
    )
;;

let parse_AllocTransType ( str ) =
    (match str with
        | "0" -> (Some (FIX_AllocTransType_New))
        | "1" -> (Some (FIX_AllocTransType_Replace))
        | "2" -> (Some (FIX_AllocTransType_Cancel))
        | "3" -> (Some (FIX_AllocTransType_Preliminary))
        | "4" -> (Some (FIX_AllocTransType_Calculated))
        | "5" -> (Some (FIX_AllocTransType_CalculatedWithoutPreliminary))
        | _ -> (None)
    )
;;

let parse_BasisPxType ( str ) =
    (match str with
        | "2" -> (Some (FIX_BasisPxType_ClosingPriceAtMorningSession))
        | "3" -> (Some (FIX_BasisPxType_ClosingPrice))
        | "4" -> (Some (FIX_BasisPxType_CurrentPrice))
        | "5" -> (Some (FIX_BasisPxType_SQ))
        | "6" -> (Some (FIX_BasisPxType_VWAPThroughADay))
        | "7" -> (Some (FIX_BasisPxType_VWAPThroughAMorningSession))
        | "8" -> (Some (FIX_BasisPxType_VWAPThroughAnAfternoonSession))
        | "9" -> (Some (FIX_BasisPxType_VWAPThroughADayExcept))
        | "A" -> (Some (FIX_BasisPxType_VWAPThroughAMorningSessionExcept))
        | "B" -> (Some (FIX_BasisPxType_VWAPThroughAnAfternoonSessionExcept))
        | "C" -> (Some (FIX_BasisPxType_Strike))
        | "D" -> (Some (FIX_BasisPxType_Open))
        | "Z" -> (Some (FIX_BasisPxType_Others))
        | _ -> (None)
    )
;;

let parse_Benchmark ( str ) =
    (match str with
        | "1" -> (Some (FIX_Benchmark_CURVE))
        | "2" -> (Some (FIX_Benchmark_FiveYR))
        | "3" -> (Some (FIX_Benchmark_OLD5))
        | "4" -> (Some (FIX_Benchmark_TenYR))
        | "5" -> (Some (FIX_Benchmark_OLD10))
        | "6" -> (Some (FIX_Benchmark_ThirtyYR))
        | "7" -> (Some (FIX_Benchmark_OLD30))
        | "8" -> (Some (FIX_Benchmark_ThreeMOLIBOR))
        | "9" -> (Some (FIX_Benchmark_SixMOLIBOR))
        | _ -> (None)
    )
;;

let parse_BidRequestTransType ( str ) =
    (match str with
        | "C" -> (Some (FIX_BidRequestTransType_Cancel))
        | "N" -> (Some (FIX_BidRequestTransType_New))
        | _ -> (None)
    )
;;

let parse_CommType ( str ) =
    (match str with
        | "1" -> (Some (FIX_CommType_PerUnit))
        | "2" -> (Some (FIX_CommType_Percent))
        | "3" -> (Some (FIX_CommType_Absolute))
        | _ -> (None)
    )
;;

let parse_CorporateAction ( str ) =
    (match str with
        | "A" -> (Some (FIX_CorporateAction_ExDividend))
        | "B" -> (Some (FIX_CorporateAction_ExDistribution))
        | "C" -> (Some (FIX_CorporateAction_ExRights))
        | "D" -> (Some (FIX_CorporateAction_New))
        | "E" -> (Some (FIX_CorporateAction_ExInterest))
        | _ -> (None)
    )
;;

let parse_CoveredOrUncovered ( str ) =
    (match str with
        | "0" -> (Some (FIX_CoveredOrUncovered_Covered))
        | "1" -> (Some (FIX_CoveredOrUncovered_Uncovered))
        | _ -> (None)
    )
;;

let parse_CustomerOrFirm ( str ) =
    (match str with
        | "0" -> (Some (FIX_CustomerOrFirm_Customer))
        | "1" -> (Some (FIX_CustomerOrFirm_Firm))
        | _ -> (None)
    )
;;

let parse_CxlRejReason ( str ) =
    (match str with
        | "0" -> (Some (FIX_CxlRejReason_TooLateToCancel))
        | "1" -> (Some (FIX_CxlRejReason_UnknownOrder))
        | "2" -> (Some (FIX_CxlRejReason_BrokerCredit))
        | "3" -> (Some (FIX_CxlRejReason_OrderAlreadyInPendingStatus))
        | _ -> (None)
    )
;;

let parse_CxlRejResponseTo ( str ) =
    (match str with
        | "1" -> (Some (FIX_CxlRejResponseTo_OrderCancelRequest))
        | "2" -> (Some (FIX_CxlRejResponseTo_OrderCancel))
        | _ -> (None)
    )
;;

let parse_DKReason ( str ) =
    (match str with
        | "A" -> (Some (FIX_DKReason_UnknownSymbol))
        | "B" -> (Some (FIX_DKReason_WrongSide))
        | "C" -> (Some (FIX_DKReason_QuantityExceedsOrder))
        | "D" -> (Some (FIX_DKReason_NoMatchingOrder))
        | "E" -> (Some (FIX_DKReason_PriceExceedsLimit))
        | "Z" -> (Some (FIX_DKReason_Other))
        | _ -> (None)
    )
;;

let parse_DeleteReason ( str ) =
    (match str with
        | "0" -> (Some (FIX_DeleteReason_Cancellation))
        | "1" -> (Some (FIX_DeleteReason_Error))
        | _ -> (None)
    )
;;

let parse_DiscretionInst ( str ) =
    (match str with
        | "0" -> (Some (FIX_DiscretionInst_RelatedToDisplayedPrice))
        | "1" -> (Some (FIX_DiscretionInst_RelatedToMarketPrice))
        | "2" -> (Some (FIX_DiscretionInst_RelatedToPrimaryPrice))
        | "3" -> (Some (FIX_DiscretionInst_RelatedToLocalPrimaryPrice))
        | "4" -> (Some (FIX_DiscretionInst_RelatedToMidpointPrice))
        | "5" -> (Some (FIX_DiscretionInst_RelatedToLastTradePrice))
        | _ -> (None)
    )
;;

let parse_DueToRelated ( str ) =
    (match str with
        | "N" -> (Some (FIX_DueToRelated_NotRelatedToSecurityHalt))
        | "Y" -> (Some (FIX_DueToRelated_RelatedToSecurityHalt))
        | _ -> (None)
    )
;;

let parse_EmailType ( str ) =
    (match str with
        | "0" -> (Some (FIX_EmailType_New))
        | "1" -> (Some (FIX_EmailType_Reply))
        | "2" -> (Some (FIX_EmailType_AdminReply))
        | _ -> (None)
    )
;;

let parse_ExchangeForPhysical ( str ) =
    (match str with
        | "N" -> (Some (FIX_ExchangeForPhysical_False))
        | "Y" -> (Some (FIX_ExchangeForPhysical_True))
        | _ -> (None)
    )
;;

let parse_ExecInst ( str ) =
    (match str with
        | "0" -> (Some (FIX_ExecInst_StayOnOfferSide))
        | "1" -> (Some (FIX_ExecInst_NotHeld))
        | "2" -> (Some (FIX_ExecInst_Work))
        | "3" -> (Some (FIX_ExecInst_GoAlong))
        | "4" -> (Some (FIX_ExecInst_OverTheDay))
        | "5" -> (Some (FIX_ExecInst_Held))
        | "6" -> (Some (FIX_ExecInst_ParticipateDoNotInitiate))
        | "7" -> (Some (FIX_ExecInst_StrictScale))
        | "8" -> (Some (FIX_ExecInst_TryToScale))
        | "9" -> (Some (FIX_ExecInst_StayOnBidSide))
        | "A" -> (Some (FIX_ExecInst_NoCross))
        | "B" -> (Some (FIX_ExecInst_OKToCross))
        | "C" -> (Some (FIX_ExecInst_CallFirst))
        | "D" -> (Some (FIX_ExecInst_PercentOfVolume))
        | "E" -> (Some (FIX_ExecInst_DoNotIncrease))
        | "F" -> (Some (FIX_ExecInst_DoNotReduce))
        | "G" -> (Some (FIX_ExecInst_AllOrNone))
        | "I" -> (Some (FIX_ExecInst_InstitutionsOnly))
        | "L" -> (Some (FIX_ExecInst_LastPeg))
        | "M" -> (Some (FIX_ExecInst_MidPricePeg))
        | "N" -> (Some (FIX_ExecInst_NonNegotiable))
        | "O" -> (Some (FIX_ExecInst_OpeningPeg))
        | "P" -> (Some (FIX_ExecInst_MarketPeg))
        | "R" -> (Some (FIX_ExecInst_PrimaryPeg))
        | "S" -> (Some (FIX_ExecInst_Suspend))
        | "T" -> (Some (FIX_ExecInst_FixedPegToLocalBestBidOrOfferAtTimeOfOrder))
        | "U" -> (Some (FIX_ExecInst_CustomerDisplayInstruction))
        | "V" -> (Some (FIX_ExecInst_Netting))
        | "W" -> (Some (FIX_ExecInst_PegToVWAP))
        | _ -> (None)
    )
;;

let parse_ExecRestatementReason ( str ) =
    (match str with
        | "0" -> (Some (FIX_ExecRestatementReason_GTCorporateAction))
        | "1" -> (Some (FIX_ExecRestatementReason_GTRenewal))
        | "2" -> (Some (FIX_ExecRestatementReason_VerbalChange))
        | "3" -> (Some (FIX_ExecRestatementReason_RepricingOfOrder))
        | "4" -> (Some (FIX_ExecRestatementReason_BrokerOption))
        | "5" -> (Some (FIX_ExecRestatementReason_PartialDeclineOfOrderQty))
        | _ -> (None)
    )
;;

let parse_ExecTransType ( str ) =
    (match str with
        | "0" -> (Some (FIX_ExecTransType_New))
        | "1" -> (Some (FIX_ExecTransType_Cancel))
        | "2" -> (Some (FIX_ExecTransType_Correct))
        | "3" -> (Some (FIX_ExecTransType_Status))
        | _ -> (None)
    )
;;

let parse_ExecType ( str ) =
    (match str with
        | "0" -> (Some (FIX_ExecType_New))
        | "1" -> (Some (FIX_ExecType_PartialFill))
        | "2" -> (Some (FIX_ExecType_Fill))
        | "3" -> (Some (FIX_ExecType_DoneForDay))
        | "4" -> (Some (FIX_ExecType_Canceled))
        | "5" -> (Some (FIX_ExecType_Replaced))
        | "6" -> (Some (FIX_ExecType_PendingCancel))
        | "7" -> (Some (FIX_ExecType_Stopped))
        | "8" -> (Some (FIX_ExecType_Rejected))
        | "9" -> (Some (FIX_ExecType_Suspended))
        | "A" -> (Some (FIX_ExecType_PendingNew))
        | "B" -> (Some (FIX_ExecType_Calculated))
        | "C" -> (Some (FIX_ExecType_Expired))
        | "D" -> (Some (FIX_ExecType_Restated))
        | "E" -> (Some (FIX_ExecType_PendingReplace))
        | _ -> (None)
    )
;;

let parse_FinancialStatus ( str ) =
    (match str with
        | "1" -> (Some (FIX_FinancialStatus_Bankrupt))
        | _ -> (None)
    )
;;

let parse_ForexReq ( str ) =
    (match str with
        | "N" -> (Some (FIX_ForexReq_DoNotExecuteForexAfterSecurityTrade))
        | "Y" -> (Some (FIX_ForexReq_ExecuteForexAfterSecurityTrade))
        | _ -> (None)
    )
;;

let parse_GTBookingInst ( str ) =
    (match str with
        | "0" -> (Some (FIX_GTBookingInst_BookOutAllTradesOnDayOfExecution))
        | "1" -> (Some (FIX_GTBookingInst_AccumulateUntilFilledOrExpired))
        | "2" -> (Some (FIX_GTBookingInst_AccumulateUntilVerballlyNotifiedOtherwise))
        | _ -> (None)
    )
;;

let parse_HaltReason ( str ) =
    (match str with
        | "D" -> (Some (FIX_HaltReason_NewsDissemination))
        | "E" -> (Some (FIX_HaltReason_OrderInflux))
        | "I" -> (Some (FIX_HaltReason_OrderImbalance))
        | "M" -> (Some (FIX_HaltReason_AdditionalInformation))
        | "P" -> (Some (FIX_HaltReason_NewsPending))
        | "X" -> (Some (FIX_HaltReason_EquipmentChangeover))
        | _ -> (None)
    )
;;

let parse_HandlInst ( str ) =
    (match str with
        | "1" -> (Some (FIX_HandlInst_AutomatedExecutionNoIntervention))
        | "2" -> (Some (FIX_HandlInst_AutomatedExecutionInterventionOK))
        | "3" -> (Some (FIX_HandlInst_ManualOrder))
        | _ -> (None)
    )
;;

let parse_IDSource ( str ) =
    (match str with
        | "1" -> (Some (FIX_IDSource_CUSIP))
        | "2" -> (Some (FIX_IDSource_SEDOL))
        | "3" -> (Some (FIX_IDSource_QUIK))
        | "4" -> (Some (FIX_IDSource_ISINNumber))
        | "5" -> (Some (FIX_IDSource_RICCode))
        | "6" -> (Some (FIX_IDSource_ISOCurrencyCode))
        | "7" -> (Some (FIX_IDSource_ISOCountryCode))
        | "8" -> (Some (FIX_IDSource_ExchangeSymbol))
        | "9" -> (Some (FIX_IDSource_ConsolidatedTapeAssociation))
        | _ -> (None)
    )
;;

let parse_IOINaturalFlag ( str ) =
    (match str with
        | "N" -> (Some (FIX_IOINaturalFlag_NotNatural))
        | "Y" -> (Some (FIX_IOINaturalFlag_Natural))
        | _ -> (None)
    )
;;

let parse_IOIQltyInd ( str ) =
    (match str with
        | "H" -> (Some (FIX_IOIQltyInd_High))
        | "L" -> (Some (FIX_IOIQltyInd_Low))
        | "M" -> (Some (FIX_IOIQltyInd_Medium))
        | _ -> (None)
    )
;;

let parse_IOIQualifier ( str ) =
    (match str with
        | "A" -> (Some (FIX_IOIQualifier_AllOrNone))
        | "C" -> (Some (FIX_IOIQualifier_AtTheClose))
        | "I" -> (Some (FIX_IOIQualifier_InTouchWith))
        | "L" -> (Some (FIX_IOIQualifier_Limit))
        | "M" -> (Some (FIX_IOIQualifier_MoreBehind))
        | "O" -> (Some (FIX_IOIQualifier_AtTheOpen))
        | "P" -> (Some (FIX_IOIQualifier_TakingAPosition))
        | "Q" -> (Some (FIX_IOIQualifier_AtTheMarket))
        | "R" -> (Some (FIX_IOIQualifier_ReadyToTrade))
        | "S" -> (Some (FIX_IOIQualifier_PortfolioShown))
        | "T" -> (Some (FIX_IOIQualifier_ThroughTheDay))
        | "V" -> (Some (FIX_IOIQualifier_Versus))
        | "W" -> (Some (FIX_IOIQualifier_Indication))
        | "X" -> (Some (FIX_IOIQualifier_CrossingOpportunity))
        | "Y" -> (Some (FIX_IOIQualifier_AtTheMidpoint))
        | "Z" -> (Some (FIX_IOIQualifier_PreOpen))
        | _ -> (None)
    )
;;

let parse_IOIShares ( str ) =
    (match str with
        | "L" -> (Some (FIX_IOIShares_Large))
        | "M" -> (Some (FIX_IOIShares_Medium))
        | "S" -> (Some (FIX_IOIShares_Small))
        | _ -> (None)
    )
;;

let parse_IOITransType ( str ) =
    (match str with
        | "C" -> (Some (FIX_IOITransType_Cancel))
        | "N" -> (Some (FIX_IOITransType_New))
        | "R" -> (Some (FIX_IOITransType_Replace))
        | _ -> (None)
    )
;;

let parse_InViewOfCommon ( str ) =
    (match str with
        | "N" -> (Some (FIX_InViewOfCommon_HaltWasNotRelatedToAHaltOfTheCommonStock))
        | "Y" -> (Some (FIX_InViewOfCommon_HaltWasDueToCommonStockBeingHalted))
        | _ -> (None)
    )
;;

let parse_IncTaxInd ( str ) =
    (match str with
        | "1" -> (Some (FIX_IncTaxInd_Net))
        | "2" -> (Some (FIX_IncTaxInd_Gross))
        | _ -> (None)
    )
;;

let parse_LastCapacity ( str ) =
    (match str with
        | "1" -> (Some (FIX_LastCapacity_Agent))
        | "2" -> (Some (FIX_LastCapacity_CrossAsAgent))
        | "3" -> (Some (FIX_LastCapacity_CrossAsPrincipal))
        | "4" -> (Some (FIX_LastCapacity_Principal))
        | _ -> (None)
    )
;;

let parse_LiquidityIndType ( str ) =
    (match str with
        | "1" -> (Some (FIX_LiquidityIndType_FiveDayMovingAverage))
        | "2" -> (Some (FIX_LiquidityIndType_TwentyDayMovingAverage))
        | "3" -> (Some (FIX_LiquidityIndType_NormalMarketSize))
        | "4" -> (Some (FIX_LiquidityIndType_Other))
        | _ -> (None)
    )
;;

let parse_ListExecInstType ( str ) =
    (match str with
        | "1" -> (Some (FIX_ListExecInstType_Immediate))
        | "2" -> (Some (FIX_ListExecInstType_WaitForInstruction))
        | _ -> (None)
    )
;;

let parse_LocateReqd ( str ) =
    (match str with
        | "N" -> (Some (FIX_LocateReqd_No))
        | "Y" -> (Some (FIX_LocateReqd_Yes))
        | _ -> (None)
    )
;;

let parse_MDEntryType ( str ) =
    (match str with
        | "0" -> (Some (FIX_MDEntryType_Bid))
        | "1" -> (Some (FIX_MDEntryType_Offer))
        | "2" -> (Some (FIX_MDEntryType_Trade))
        | "3" -> (Some (FIX_MDEntryType_IndexValue))
        | "4" -> (Some (FIX_MDEntryType_OpeningPrice))
        | "5" -> (Some (FIX_MDEntryType_ClosingPrice))
        | "6" -> (Some (FIX_MDEntryType_SettlementPrice))
        | "7" -> (Some (FIX_MDEntryType_TradingSessionHighPrice))
        | "8" -> (Some (FIX_MDEntryType_TradingSessionLowPrice))
        | "9" -> (Some (FIX_MDEntryType_TradingSessionVWAPPrice))
        | _ -> (None)
    )
;;

let parse_MDReqRejReason ( str ) =
    (match str with
        | "0" -> (Some (FIX_MDReqRejReason_UnknownSymbol))
        | "1" -> (Some (FIX_MDReqRejReason_DuplicateMDReqID))
        | "2" -> (Some (FIX_MDReqRejReason_InsufficientBandwidth))
        | "3" -> (Some (FIX_MDReqRejReason_InsufficientPermissions))
        | "4" -> (Some (FIX_MDReqRejReason_UnsupportedSubscriptionRequestType))
        | "5" -> (Some (FIX_MDReqRejReason_UnsupportedMarketDepth))
        | "6" -> (Some (FIX_MDReqRejReason_UnsupportedMDUpdateType))
        | "7" -> (Some (FIX_MDReqRejReason_UnsupportedAggregatedBook))
        | "8" -> (Some (FIX_MDReqRejReason_UnsupportedMDEntryType))
        | _ -> (None)
    )
;;

let parse_MDUpdateAction ( str ) =
    (match str with
        | "0" -> (Some (FIX_MDUpdateAction_New))
        | "1" -> (Some (FIX_MDUpdateAction_Change))
        | "2" -> (Some (FIX_MDUpdateAction_Delete))
        | _ -> (None)
    )
;;

let parse_MDUpdateType ( str ) =
    (match str with
        | "0" -> (Some (FIX_MDUpdateType_FullRefresh))
        | "1" -> (Some (FIX_MDUpdateType_IncrementalRefresh))
        | _ -> (None)
    )
;;

let parse_MessageEncoding ( str ) =
    (match str with
        | "EUC-JP" -> (Some (FIX_MessageEncoding_EUCJP))
        | "ISO-2022-JP" -> (Some (FIX_MessageEncoding_ISO2022JP))
        | "Shift_JIS" -> (Some (FIX_MessageEncoding_ShiftJIS))
        | "UTF-8" -> (Some (FIX_MessageEncoding_UTF8))
        | _ -> (None)
    )
;;

let parse_MiscFeeType ( str ) =
    (match str with
        | "1" -> (Some (FIX_MiscFeeType_Regulatory))
        | "2" -> (Some (FIX_MiscFeeType_Tax))
        | "3" -> (Some (FIX_MiscFeeType_LocalCommission))
        | "4" -> (Some (FIX_MiscFeeType_ExchangeFees))
        | "5" -> (Some (FIX_MiscFeeType_Stamp))
        | "6" -> (Some (FIX_MiscFeeType_Levy))
        | "7" -> (Some (FIX_MiscFeeType_Other))
        | "8" -> (Some (FIX_MiscFeeType_Markup))
        | "9" -> (Some (FIX_MiscFeeType_ConsumptionTax))
        | _ -> (None)
    )
;;

let parse_MsgDirection ( str ) =
    (match str with
        | "R" -> (Some (FIX_MsgDirection_Receive))
        | "S" -> (Some (FIX_MsgDirection_Send))
        | _ -> (None)
    )
;;

let parse_MultiLegReportingType ( str ) =
    (match str with
        | "1" -> (Some (FIX_MultiLegReportingType_SingleSecurity))
        | "2" -> (Some (FIX_MultiLegReportingType_IndividualLegOfAMultiLegSecurity))
        | "3" -> (Some (FIX_MultiLegReportingType_MultiLegSecurity))
        | _ -> (None)
    )
;;

let parse_NetGrossInd ( str ) =
    (match str with
        | "1" -> (Some (FIX_NetGrossInd_Net))
        | "2" -> (Some (FIX_NetGrossInd_Gross))
        | _ -> (None)
    )
;;

let parse_NotifyBrokerOfCredit ( str ) =
    (match str with
        | "N" -> (Some (FIX_NotifyBrokerOfCredit_DetailsShouldNotBeCommunicated))
        | "Y" -> (Some (FIX_NotifyBrokerOfCredit_DetailsShouldBeCommunicated))
        | _ -> (None)
    )
;;

let parse_OpenClose ( str ) =
    (match str with
        | "C" -> (Some (FIX_OpenClose_Close))
        | "O" -> (Some (FIX_OpenClose_Open))
        | _ -> (None)
    )
;;

let parse_OpenCloseSettleFlag ( str ) =
    (match str with
        | "0" -> (Some (FIX_OpenCloseSettleFlag_DailyOpen))
        | "1" -> (Some (FIX_OpenCloseSettleFlag_SessionOpen))
        | "2" -> (Some (FIX_OpenCloseSettleFlag_DeliverySettlementEntry))
        | _ -> (None)
    )
;;

let parse_OrdRejReason ( str ) =
    (match str with
        | "0" -> (Some (FIX_OrdRejReason_BrokerCredit))
        | "1" -> (Some (FIX_OrdRejReason_UnknownSymbol))
        | "2" -> (Some (FIX_OrdRejReason_ExchangeClosed))
        | "3" -> (Some (FIX_OrdRejReason_OrderExceedsLimit))
        | "4" -> (Some (FIX_OrdRejReason_TooLateToEnter))
        | "5" -> (Some (FIX_OrdRejReason_UnknownOrder))
        | "6" -> (Some (FIX_OrdRejReason_DuplicateOrder))
        | "7" -> (Some (FIX_OrdRejReason_DuplicateOfAVerballyCommunicatedOrder))
        | "8" -> (Some (FIX_OrdRejReason_StaleOrder))
        | _ -> (None)
    )
;;

let parse_OrdStatus ( str ) =
    (match str with
        | "0" -> (Some (FIX_OrdStatus_New))
        | "1" -> (Some (FIX_OrdStatus_PartiallyFilled))
        | "2" -> (Some (FIX_OrdStatus_Filled))
        | "3" -> (Some (FIX_OrdStatus_DoneForDay))
        | "4" -> (Some (FIX_OrdStatus_Canceled))
        | "5" -> (Some (FIX_OrdStatus_Replaced))
        | "6" -> (Some (FIX_OrdStatus_PendingCancel))
        | "7" -> (Some (FIX_OrdStatus_Stopped))
        | "8" -> (Some (FIX_OrdStatus_Rejected))
        | "9" -> (Some (FIX_OrdStatus_Suspended))
        | "A" -> (Some (FIX_OrdStatus_PendingNew))
        | "B" -> (Some (FIX_OrdStatus_Calculated))
        | "C" -> (Some (FIX_OrdStatus_Expired))
        | "D" -> (Some (FIX_OrdStatus_AcceptedForBidding))
        | "E" -> (Some (FIX_OrdStatus_PendingReplace))
        | _ -> (None)
    )
;;

let parse_OrdType ( str ) =
    (match str with
        | "1" -> (Some (FIX_OrdType_Market))
        | "2" -> (Some (FIX_OrdType_Limit))
        | "3" -> (Some (FIX_OrdType_Stop))
        | "4" -> (Some (FIX_OrdType_StopLimit))
        | "5" -> (Some (FIX_OrdType_MarketOnClose))
        | "6" -> (Some (FIX_OrdType_WithOrWithout))
        | "7" -> (Some (FIX_OrdType_LimitOrBetter))
        | "8" -> (Some (FIX_OrdType_LimitWithOrWithout))
        | "9" -> (Some (FIX_OrdType_OnBasis))
        | "A" -> (Some (FIX_OrdType_OnClose))
        | "B" -> (Some (FIX_OrdType_LimitOnClose))
        | "C" -> (Some (FIX_OrdType_ForexMarket))
        | "D" -> (Some (FIX_OrdType_PreviouslyQuoted))
        | "E" -> (Some (FIX_OrdType_PreviouslyIndicated))
        | "F" -> (Some (FIX_OrdType_ForexLimit))
        | "G" -> (Some (FIX_OrdType_ForexSwap))
        | "H" -> (Some (FIX_OrdType_ForexPreviouslyQuoted))
        | "I" -> (Some (FIX_OrdType_Funari))
        | "P" -> (Some (FIX_OrdType_Pegged))
        | _ -> (None)
    )
;;

let parse_PossDupFlag ( str ) =
    (match str with
        | "N" -> (Some (FIX_PossDupFlag_OriginalTransmission))
        | "Y" -> (Some (FIX_PossDupFlag_PossibleDuplicate))
        | _ -> (None)
    )
;;

let parse_PossResend ( str ) =
    (match str with
        | "N" -> (Some (FIX_PossResend_OriginalTransmission))
        | "Y" -> (Some (FIX_PossResend_PossibleResend))
        | _ -> (None)
    )
;;

let parse_PriceType ( str ) =
    (match str with
        | "1" -> (Some (FIX_PriceType_Percentage))
        | "2" -> (Some (FIX_PriceType_PerUnit))
        | "3" -> (Some (FIX_PriceType_FixedAmount))
        | _ -> (None)
    )
;;

let parse_ProcessCode ( str ) =
    (match str with
        | "0" -> (Some (FIX_ProcessCode_Regular))
        | "1" -> (Some (FIX_ProcessCode_SoftDollar))
        | "2" -> (Some (FIX_ProcessCode_StepIn))
        | "3" -> (Some (FIX_ProcessCode_StepOut))
        | "4" -> (Some (FIX_ProcessCode_SoftDollarStepIn))
        | "5" -> (Some (FIX_ProcessCode_SoftDollarStepOut))
        | "6" -> (Some (FIX_ProcessCode_PlanSponsor))
        | _ -> (None)
    )
;;

let parse_ProgRptReqs ( str ) =
    (match str with
        | "1" -> (Some (FIX_ProgRptReqs_BuySideRequests))
        | "2" -> (Some (FIX_ProgRptReqs_SellSideSends))
        | "3" -> (Some (FIX_ProgRptReqs_RealTimeExecutionReports))
        | _ -> (None)
    )
;;

let parse_PutOrCall ( str ) =
    (match str with
        | "0" -> (Some (FIX_PutOrCall_Put))
        | "1" -> (Some (FIX_PutOrCall_Call))
        | _ -> (None)
    )
;;

let parse_QuoteAckStatus ( str ) =
    (match str with
        | "0" -> (Some (FIX_QuoteAckStatus_Accepted))
        | "1" -> (Some (FIX_QuoteAckStatus_CancelForSymbol))
        | "2" -> (Some (FIX_QuoteAckStatus_CanceledForSecurityType))
        | "3" -> (Some (FIX_QuoteAckStatus_CanceledForUnderlying))
        | "4" -> (Some (FIX_QuoteAckStatus_CanceledAll))
        | "5" -> (Some (FIX_QuoteAckStatus_Rejected))
        | _ -> (None)
    )
;;

let parse_QuoteCancelType ( str ) =
    (match str with
        | "1" -> (Some (FIX_QuoteCancelType_CancelForOneOrMoreSecurities))
        | "2" -> (Some (FIX_QuoteCancelType_CancelForSecurityType))
        | "3" -> (Some (FIX_QuoteCancelType_CancelForUnderlyingSecurity))
        | "4" -> (Some (FIX_QuoteCancelType_CancelAllQuotes))
        | _ -> (None)
    )
;;

let parse_QuoteCondition ( str ) =
    (match str with
        | "A" -> (Some (FIX_QuoteCondition_Open))
        | "B" -> (Some (FIX_QuoteCondition_Closed))
        | "C" -> (Some (FIX_QuoteCondition_ExchangeBest))
        | "D" -> (Some (FIX_QuoteCondition_ConsolidatedBest))
        | "E" -> (Some (FIX_QuoteCondition_Locked))
        | "F" -> (Some (FIX_QuoteCondition_Crossed))
        | "G" -> (Some (FIX_QuoteCondition_Depth))
        | "H" -> (Some (FIX_QuoteCondition_FastTrading))
        | "I" -> (Some (FIX_QuoteCondition_NonFirm))
        | _ -> (None)
    )
;;

let parse_QuoteEntryRejectReason ( str ) =
    (match str with
        | "1" -> (Some (FIX_QuoteEntryRejectReason_UnknownSymbol))
        | "2" -> (Some (FIX_QuoteEntryRejectReason_Exchange))
        | "3" -> (Some (FIX_QuoteEntryRejectReason_QuoteExceedsLimit))
        | "4" -> (Some (FIX_QuoteEntryRejectReason_TooLateToEnter))
        | "5" -> (Some (FIX_QuoteEntryRejectReason_UnknownQuote))
        | "6" -> (Some (FIX_QuoteEntryRejectReason_DuplicateQuote))
        | "7" -> (Some (FIX_QuoteEntryRejectReason_InvalidBidAskSpread))
        | "8" -> (Some (FIX_QuoteEntryRejectReason_InvalidPrice))
        | "9" -> (Some (FIX_QuoteEntryRejectReason_NotAuthorizedToQuoteSecurity))
        | _ -> (None)
    )
;;

let parse_QuoteRejectReason ( str ) =
    (match str with
        | "1" -> (Some (FIX_QuoteRejectReason_UnknownSymbol))
        | "2" -> (Some (FIX_QuoteRejectReason_Exchange))
        | "3" -> (Some (FIX_QuoteRejectReason_QuoteRequestExceedsLimit))
        | "4" -> (Some (FIX_QuoteRejectReason_TooLateToEnter))
        | "5" -> (Some (FIX_QuoteRejectReason_UnknownQuote))
        | "6" -> (Some (FIX_QuoteRejectReason_DuplicateQuote))
        | "7" -> (Some (FIX_QuoteRejectReason_InvalidBid))
        | "8" -> (Some (FIX_QuoteRejectReason_InvalidPrice))
        | "9" -> (Some (FIX_QuoteRejectReason_NotAuthorizedToQuoteSecurity))
        | _ -> (None)
    )
;;

let parse_QuoteRequestType ( str ) =
    (match str with
        | "1" -> (Some (FIX_QuoteRequestType_Manual))
        | "2" -> (Some (FIX_QuoteRequestType_Automatic))
        | _ -> (None)
    )
;;

let parse_QuoteResponseLevel ( str ) =
    (match str with
        | "0" -> (Some (FIX_QuoteResponseLevel_NoAcknowledgement))
        | "1" -> (Some (FIX_QuoteResponseLevel_AcknowledgeOnlyNegativeOrErroneousQuotes))
        | "2" -> (Some (FIX_QuoteResponseLevel_AcknowledgeEachQuoteMessage))
        | _ -> (None)
    )
;;

let parse_ReportToExch ( str ) =
    (match str with
        | "N" -> (Some (FIX_ReportToExch_SenderReports))
        | "Y" -> (Some (FIX_ReportToExch_ReceiverReports))
        | _ -> (None)
    )
;;

let parse_ResetSeqNumFlag ( str ) =
    (match str with
        | "N" -> (Some (FIX_ResetSeqNumFlag_No))
        | "Y" -> (Some (FIX_ResetSeqNumFlag_Yes))
        | _ -> (None)
    )
;;

let parse_RoutingType ( str ) =
    (match str with
        | "1" -> (Some (FIX_RoutingType_TargetFirm))
        | "2" -> (Some (FIX_RoutingType_TargetList))
        | "3" -> (Some (FIX_RoutingType_BlockFirm))
        | "4" -> (Some (FIX_RoutingType_BlockList))
        | _ -> (None)
    )
;;

let parse_Rule80A ( str ) =
    (match str with
        | "A" -> (Some (FIX_Rule80A_AgencySingleOrder))
        | "B" -> (Some (FIX_Rule80A_ShortExemptTransactionAType))
        | "C" -> (Some (FIX_Rule80A_ProprietaryNonAlgo))
        | "D" -> (Some (FIX_Rule80A_ProgramOrderMember))
        | "E" -> (Some (FIX_Rule80A_ShortExemptTransactionForPrincipal))
        | "F" -> (Some (FIX_Rule80A_ShortExemptTransactionWType))
        | "H" -> (Some (FIX_Rule80A_ShortExemptTransactionIType))
        | "I" -> (Some (FIX_Rule80A_IndividualInvestor))
        | "J" -> (Some (FIX_Rule80A_ProprietaryAlgo))
        | "K" -> (Some (FIX_Rule80A_AgencyAlgo))
        | "L" -> (Some (FIX_Rule80A_ShortExemptTransactionMemberAffliated))
        | "M" -> (Some (FIX_Rule80A_ProgramOrderOtherMember))
        | "N" -> (Some (FIX_Rule80A_AgentForOtherMember))
        | "O" -> (Some (FIX_Rule80A_ProprietaryTransactionAffiliated))
        | "P" -> (Some (FIX_Rule80A_Principal))
        | "R" -> (Some (FIX_Rule80A_TransactionNonMember))
        | "S" -> (Some (FIX_Rule80A_SpecialistTrades))
        | "T" -> (Some (FIX_Rule80A_TransactionUnaffiliatedMember))
        | "U" -> (Some (FIX_Rule80A_AgencyIndexArb))
        | "W" -> (Some (FIX_Rule80A_AllOtherOrdersAsAgentForOtherMember))
        | "X" -> (Some (FIX_Rule80A_ShortExemptTransactionMemberNotAffliated))
        | "Y" -> (Some (FIX_Rule80A_AgencyNonAlgo))
        | "Z" -> (Some (FIX_Rule80A_ShortExemptTransactionNonMember))
        | _ -> (None)
    )
;;

let parse_SecurityRequestType ( str ) =
    (match str with
        | "0" -> (Some (FIX_SecurityRequestType_RequestSecurityIdentityAndSpecifications))
        | "1" -> (Some (FIX_SecurityRequestType_RequestSecurityIdentityForSpecifications))
        | "2" -> (Some (FIX_SecurityRequestType_RequestListSecurityTypes))
        | "3" -> (Some (FIX_SecurityRequestType_RequestListSecurities))
        | _ -> (None)
    )
;;

let parse_SecurityResponseType ( str ) =
    (match str with
        | "1" -> (Some (FIX_SecurityResponseType_AcceptAsIs))
        | "2" -> (Some (FIX_SecurityResponseType_AcceptWithRevisions))
        | "3" -> (Some (FIX_SecurityResponseType_ListOfSecurityTypesReturnedPerRequest))
        | "4" -> (Some (FIX_SecurityResponseType_ListOfSecuritiesReturnedPerRequest))
        | "5" -> (Some (FIX_SecurityResponseType_RejectSecurityProposal))
        | "6" -> (Some (FIX_SecurityResponseType_CannotMatchSelectionCriteria))
        | _ -> (None)
    )
;;

let parse_SecurityTradingStatus ( str ) =
    (match str with
        | "1" -> (Some (FIX_SecurityTradingStatus_OpeningDelay))
        | "10" -> (Some (FIX_SecurityTradingStatus_MarketOnCloseImbalanceSell))
        | "12" -> (Some (FIX_SecurityTradingStatus_NoMarketImbalance))
        | "13" -> (Some (FIX_SecurityTradingStatus_NoMarketOnCloseImbalance))
        | "14" -> (Some (FIX_SecurityTradingStatus_ITSPreOpening))
        | "15" -> (Some (FIX_SecurityTradingStatus_NewPriceIndication))
        | "16" -> (Some (FIX_SecurityTradingStatus_TradeDisseminationTime))
        | "17" -> (Some (FIX_SecurityTradingStatus_ReadyToTrade))
        | "18" -> (Some (FIX_SecurityTradingStatus_NotAvailableForTrading))
        | "19" -> (Some (FIX_SecurityTradingStatus_NotTradedOnThisMarket))
        | "2" -> (Some (FIX_SecurityTradingStatus_TradingHalt))
        | "20" -> (Some (FIX_SecurityTradingStatus_UnknownOrInvalid))
        | "3" -> (Some (FIX_SecurityTradingStatus_Resume))
        | "4" -> (Some (FIX_SecurityTradingStatus_NoOpen))
        | "5" -> (Some (FIX_SecurityTradingStatus_PriceIndication))
        | "6" -> (Some (FIX_SecurityTradingStatus_TradingRangeIndication))
        | "7" -> (Some (FIX_SecurityTradingStatus_MarketImbalanceBuy))
        | "8" -> (Some (FIX_SecurityTradingStatus_MarketImbalanceSell))
        | "9" -> (Some (FIX_SecurityTradingStatus_MarketOnCloseImbalanceBuy))
        | _ -> (None)
    )
;;

let parse_SecurityType ( str ) =
    (match str with
        | "?" -> (Some (FIX_SecurityType_Wildcard))
        | "BA" -> (Some (FIX_SecurityType_BankersAcceptance))
        | "CB" -> (Some (FIX_SecurityType_ConvertibleBond))
        | "CD" -> (Some (FIX_SecurityType_CertificateOfDeposit))
        | "CMO" -> (Some (FIX_SecurityType_CollateralizedMortgageObligation))
        | "CORP" -> (Some (FIX_SecurityType_CorporateBond))
        | "CP" -> (Some (FIX_SecurityType_CommercialPaper))
        | "CPP" -> (Some (FIX_SecurityType_CorporatePrivatePlacement))
        | "CS" -> (Some (FIX_SecurityType_CommonStock))
        | "FHA" -> (Some (FIX_SecurityType_FederalHousingAuthority))
        | "FHL" -> (Some (FIX_SecurityType_FederalHomeLoan))
        | "FN" -> (Some (FIX_SecurityType_FederalNationalMortgageAssociation))
        | "FOR" -> (Some (FIX_SecurityType_ForeignExchangeContract))
        | "FUT" -> (Some (FIX_SecurityType_Future))
        | "GN" -> (Some (FIX_SecurityType_GovernmentNationalMortgageAssociation))
        | "GOVT" -> (Some (FIX_SecurityType_TreasuriesAgencyDebenture))
        | "IET" -> (Some (FIX_SecurityType_IOETTEMortgage))
        | "MF" -> (Some (FIX_SecurityType_MutualFund))
        | "MIO" -> (Some (FIX_SecurityType_MortgageInterestOnly))
        | "MPO" -> (Some (FIX_SecurityType_MortgagePrincipalOnly))
        | "MPP" -> (Some (FIX_SecurityType_MortgagePrivatePlacement))
        | "MPT" -> (Some (FIX_SecurityType_MiscellaneousPassThrough))
        | "MUNI" -> (Some (FIX_SecurityType_MunicipalBond))
        | "NONE" -> (Some (FIX_SecurityType_NoSecurityType))
        | "OPT" -> (Some (FIX_SecurityType_Option))
        | "PS" -> (Some (FIX_SecurityType_PreferredStock))
        | "RP" -> (Some (FIX_SecurityType_RepurchaseAgreement))
        | "RVRP" -> (Some (FIX_SecurityType_ReverseRepurchaseAgreement))
        | "SL" -> (Some (FIX_SecurityType_StudentLoanMarketingAssociation))
        | "TD" -> (Some (FIX_SecurityType_TimeDeposit))
        | "USTB" -> (Some (FIX_SecurityType_USTreasuryBillOld))
        | "WAR" -> (Some (FIX_SecurityType_Warrant))
        | "ZOO" -> (Some (FIX_SecurityType_CatsTigersAndLions))
        | _ -> (None)
    )
;;

let parse_SettlInstMode ( str ) =
    (match str with
        | "0" -> (Some (FIX_SettlInstMode_Default))
        | "1" -> (Some (FIX_SettlInstMode_StandingInstructionsProvided))
        | "2" -> (Some (FIX_SettlInstMode_SpecificAllocationAccountOverriding))
        | "3" -> (Some (FIX_SettlInstMode_SpecificAllocationAccountStanding))
        | _ -> (None)
    )
;;

let parse_SettlInstSource ( str ) =
    (match str with
        | "1" -> (Some (FIX_SettlInstSource_BrokerCredit))
        | "2" -> (Some (FIX_SettlInstSource_Institution))
        | _ -> (None)
    )
;;

let parse_SettlInstTransType ( str ) =
    (match str with
        | "C" -> (Some (FIX_SettlInstTransType_Cancel))
        | "N" -> (Some (FIX_SettlInstTransType_New))
        | "R" -> (Some (FIX_SettlInstTransType_Replace))
        | _ -> (None)
    )
;;

let parse_SettlLocation ( str ) =
    (match str with
        | "CED" -> (Some (FIX_SettlLocation_CEDEL))
        | "DTC" -> (Some (FIX_SettlLocation_DepositoryTrustCompany))
        | "EUR" -> (Some (FIX_SettlLocation_EuroClear))
        | "FED" -> (Some (FIX_SettlLocation_FederalBookEntry))
        | "ISO Country Code" -> (Some (FIX_SettlLocation_LocalMarketSettleLocation))
        | "PNY" -> (Some (FIX_SettlLocation_Physical))
        | "PTC" -> (Some (FIX_SettlLocation_ParticipantTrustCompany))
        | _ -> (None)
    )
;;

let parse_SettlmntTyp ( str ) =
    (match str with
        | "0" -> (Some (FIX_SettlmntTyp_Regular))
        | "1" -> (Some (FIX_SettlmntTyp_Cash))
        | "2" -> (Some (FIX_SettlmntTyp_NextDay))
        | "3" -> (Some (FIX_SettlmntTyp_TPlus2))
        | "4" -> (Some (FIX_SettlmntTyp_TPlus3))
        | "5" -> (Some (FIX_SettlmntTyp_TPlus4))
        | "6" -> (Some (FIX_SettlmntTyp_Future))
        | "7" -> (Some (FIX_SettlmntTyp_WhenAndIfIssued))
        | "8" -> (Some (FIX_SettlmntTyp_SellersOption))
        | "9" -> (Some (FIX_SettlmntTyp_TPlus5))
        | _ -> (None)
    )
;;

let parse_Side ( str ) =
    (match str with
        | "1" -> (Some (FIX_Side_Buy))
        | "2" -> (Some (FIX_Side_Sell))
        | "3" -> (Some (FIX_Side_BuyMinus))
        | "4" -> (Some (FIX_Side_SellPlus))
        | "5" -> (Some (FIX_Side_SellShort))
        | "6" -> (Some (FIX_Side_SellShortExempt))
        | "7" -> (Some (FIX_Side_Undisclosed))
        | "8" -> (Some (FIX_Side_Cross))
        | "9" -> (Some (FIX_Side_CrossShort))
        | _ -> (None)
    )
;;

let parse_SolicitedFlag ( str ) =
    (match str with
        | "N" -> (Some (FIX_SolicitedFlag_WasNotSolicited))
        | "Y" -> (Some (FIX_SolicitedFlag_WasSolicited))
        | _ -> (None)
    )
;;

let parse_StandInstDbType ( str ) =
    (match str with
        | "0" -> (Some (FIX_StandInstDbType_Other))
        | "1" -> (Some (FIX_StandInstDbType_DTCSID))
        | "2" -> (Some (FIX_StandInstDbType_ThomsonALERT))
        | "3" -> (Some (FIX_StandInstDbType_AGlobalCustodian))
        | _ -> (None)
    )
;;

let parse_SubscriptionRequestType ( str ) =
    (match str with
        | "0" -> (Some (FIX_SubscriptionRequestType_Snapshot))
        | "1" -> (Some (FIX_SubscriptionRequestType_SnapshotAndUpdates))
        | "2" -> (Some (FIX_SubscriptionRequestType_DisablePreviousSnapshot))
        | _ -> (None)
    )
;;

let parse_TickDirection ( str ) =
    (match str with
        | "0" -> (Some (FIX_TickDirection_PlusTick))
        | "1" -> (Some (FIX_TickDirection_ZeroPlusTick))
        | "2" -> (Some (FIX_TickDirection_MinusTick))
        | "3" -> (Some (FIX_TickDirection_ZeroMinusTick))
        | _ -> (None)
    )
;;

let parse_TimeInForce ( str ) =
    (match str with
        | "0" -> (Some (FIX_TimeInForce_Day))
        | "1" -> (Some (FIX_TimeInForce_GoodTillCancel))
        | "2" -> (Some (FIX_TimeInForce_AtTheOpening))
        | "3" -> (Some (FIX_TimeInForce_ImmediateOrCancel))
        | "4" -> (Some (FIX_TimeInForce_FillOrKill))
        | "5" -> (Some (FIX_TimeInForce_GoodTillCrossing))
        | "6" -> (Some (FIX_TimeInForce_GoodTillDate))
        | _ -> (None)
    )
;;

let parse_TradSesMethod ( str ) =
    (match str with
        | "1" -> (Some (FIX_TradSesMethod_Electronic))
        | "2" -> (Some (FIX_TradSesMethod_OpenOutcry))
        | "3" -> (Some (FIX_TradSesMethod_TwoParty))
        | _ -> (None)
    )
;;

let parse_TradSesMode ( str ) =
    (match str with
        | "1" -> (Some (FIX_TradSesMode_Testing))
        | "2" -> (Some (FIX_TradSesMode_Simulated))
        | "3" -> (Some (FIX_TradSesMode_Production))
        | _ -> (None)
    )
;;

let parse_TradSesStatus ( str ) =
    (match str with
        | "1" -> (Some (FIX_TradSesStatus_Halted))
        | "2" -> (Some (FIX_TradSesStatus_Open))
        | "3" -> (Some (FIX_TradSesStatus_Closed))
        | "4" -> (Some (FIX_TradSesStatus_PreOpen))
        | "5" -> (Some (FIX_TradSesStatus_PreClose))
        | _ -> (None)
    )
;;

let parse_TradeCondition ( str ) =
    (match str with
        | "A" -> (Some (FIX_TradeCondition_Cash))
        | "B" -> (Some (FIX_TradeCondition_AveragePriceTrade))
        | "C" -> (Some (FIX_TradeCondition_CashTrade))
        | "D" -> (Some (FIX_TradeCondition_NextDay))
        | "E" -> (Some (FIX_TradeCondition_Opening))
        | "F" -> (Some (FIX_TradeCondition_IntradayTradeDetail))
        | "G" -> (Some (FIX_TradeCondition_Rule127Trade))
        | "H" -> (Some (FIX_TradeCondition_Rule155Trade))
        | "I" -> (Some (FIX_TradeCondition_SoldLast))
        | "J" -> (Some (FIX_TradeCondition_NextDayTrade))
        | "K" -> (Some (FIX_TradeCondition_Opened))
        | "L" -> (Some (FIX_TradeCondition_Seller))
        | "M" -> (Some (FIX_TradeCondition_Sold))
        | "N" -> (Some (FIX_TradeCondition_StoppedStock))
        | _ -> (None)
    )
;;

let parse_TradeType ( str ) =
    (match str with
        | "A" -> (Some (FIX_TradeType_Agency))
        | "G" -> (Some (FIX_TradeType_VWAPGuarantee))
        | "J" -> (Some (FIX_TradeType_GuaranteedClose))
        | "R" -> (Some (FIX_TradeType_RiskTrade))
        | _ -> (None)
    )
;;

let parse_UnsolicitedIndicator ( str ) =
    (match str with
        | "N" -> (Some (FIX_UnsolicitedIndicator_MessageIsBeingSentAsAResultOfAPriorRequest))
        | "Y" -> (Some (FIX_UnsolicitedIndicator_MessageIsBeingSentUnsolicited))
        | _ -> (None)
    )
;;

let parse_Urgency ( str ) =
    (match str with
        | "0" -> (Some (FIX_Urgency_Normal))
        | "1" -> (Some (FIX_Urgency_Flash))
        | "2" -> (Some (FIX_Urgency_Background))
        | _ -> (None)
    )
;;

let parse_week ( str ) =
    (match str with
        | "noweek" -> (Some (FIX_week_noweek))
        | "w1" -> (Some (FIX_week_w1))
        | "w2" -> (Some (FIX_week_w2))
        | "w3" -> (Some (FIX_week_w3))
        | "w4" -> (Some (FIX_week_w4))
        | "w5" -> (Some (FIX_week_w5))
        | _ -> (None)
    )
;;

let parse_Currency ( str ) =
    (match str with
        | "EUR" -> (Some (FIX_Currency_EUR))
        | "GBP" -> (Some (FIX_Currency_GBP))
        | "USD" -> (Some (FIX_Currency_USD))
        | _ -> (None)
    )
;;

let parse_Country ( str ) =
    (match str with
        | "DE" -> (Some (FIX_Country_DE))
        | "GB" -> (Some (FIX_Country_GB))
        | "US" -> (Some (FIX_Country_US))
        | _ -> (None)
    )
;;

let parse_Exchange ( str ) =
    (match str with
        | "XLON" -> (Some (FIX_Exchange_XLON))
        | "XNYS" -> (Some (FIX_Exchange_XNYS))
        | "XNAS" -> (Some (FIX_Exchange_XNAS))
        | "XJAS" -> (Some (FIX_Exchange_XJAS))
        | "XSHG" -> (Some (FIX_Exchange_XSHG))
        | "SHSC" -> (Some (FIX_Exchange_SHSC))
        | _ -> (None)
    )
;;
