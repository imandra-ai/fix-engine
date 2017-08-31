(* Aesthetic Integration copyright 2017 *)

(** Identifies the type of adjustment.*)
type fix_adjustment =
    | FIX_Adjustment_Cancel 
    | FIX_Adjustment_Error 
    | FIX_Adjustment_Correction 
;;

(** Broker's side of advertised trade*)
type fix_advside =
    | FIX_AdvSide_Buy 
    | FIX_AdvSide_Sell 
    | FIX_AdvSide_Trade 
    | FIX_AdvSide_Cross 
;;

(** Identifies advertisement message transaction type*)
type fix_advtranstype =
    | FIX_AdvTransType_Cancel 
    | FIX_AdvTransType_New 
    | FIX_AdvTransType_Replace 
;;

(** Specifies whether or not book entries should be aggregated.*)
type fix_aggregatedbook =
    | FIX_AggregatedBook_BookEntriesShouldNotBeAggregated 
    | FIX_AggregatedBook_BookEntriesToBeAggregated 
;;

(** Indicates how the receiver (i.e. third party) of Allocation message should handle/process the account details.*)
type fix_allochandlinst =
    | FIX_AllocHandlInst_Match 
    | FIX_AllocHandlInst_Forward 
    | FIX_AllocHandlInst_ForwardAndMatch 
;;

(** Identifies the type of Allocation linkage when AllocLinkID is used.*)
type fix_alloclinktype =
    | FIX_AllocLinkType_FXNetting 
    | FIX_AllocLinkType_FXSwap 
;;

(** Identifies reason for rejection.*)
type fix_allocrejcode =
    | FIX_AllocRejCode_UnknownAccount 
    | FIX_AllocRejCode_IncorrectQuantity 
    | FIX_AllocRejCode_IncorrectAveragegPrice 
    | FIX_AllocRejCode_UnknownExecutingBrokerMnemonic 
    | FIX_AllocRejCode_CommissionDifference 
    | FIX_AllocRejCode_UnknownOrderID 
    | FIX_AllocRejCode_UnknownListID 
    | FIX_AllocRejCode_OtherSeeText 
;;

(** Identifies status of allocation.*)
type fix_allocstatus =
    | FIX_AllocStatus_Accepted 
    | FIX_AllocStatus_BlockLevelReject 
    | FIX_AllocStatus_AccountLevelReject 
    | FIX_AllocStatus_Received 
;;

(** Identifies allocation transaction type*)
type fix_alloctranstype =
    | FIX_AllocTransType_New 
    | FIX_AllocTransType_Replace 
    | FIX_AllocTransType_Cancel 
    | FIX_AllocTransType_Preliminary 
    | FIX_AllocTransType_Calculated 
    | FIX_AllocTransType_CalculatedWithoutPreliminary 
;;

(** Code to represent the basis price type.*)
type fix_basispxtype =
    | FIX_BasisPxType_ClosingPriceAtMorningSession 
    | FIX_BasisPxType_ClosingPrice 
    | FIX_BasisPxType_CurrentPrice 
    | FIX_BasisPxType_SQ 
    | FIX_BasisPxType_VWAPThroughADay 
    | FIX_BasisPxType_VWAPThroughAMorningSession 
    | FIX_BasisPxType_VWAPThroughAnAfternoonSession 
    | FIX_BasisPxType_VWAPThroughADayExcept 
    | FIX_BasisPxType_VWAPThroughAMorningSessionExcept 
    | FIX_BasisPxType_VWAPThroughAnAfternoonSessionExcept 
    | FIX_BasisPxType_Strike 
    | FIX_BasisPxType_Open 
    | FIX_BasisPxType_Others 
;;

(** For Fixed Income. Identifies the benchmark (e.g. used in conjunction with the SpreadToBenchmark field).*)
type fix_benchmark =
    | FIX_Benchmark_CURVE 
    | FIX_Benchmark_FiveYR 
    | FIX_Benchmark_OLD5 
    | FIX_Benchmark_TenYR 
    | FIX_Benchmark_OLD10 
    | FIX_Benchmark_ThirtyYR 
    | FIX_Benchmark_OLD30 
    | FIX_Benchmark_ThreeMOLIBOR 
    | FIX_Benchmark_SixMOLIBOR 
;;

(** Identifies the Bid Request message type.*)
type fix_bidrequesttranstype =
    | FIX_BidRequestTransType_Cancel 
    | FIX_BidRequestTransType_New 
;;

(** Commission type*)
type fix_commtype =
    | FIX_CommType_PerUnit 
    | FIX_CommType_Percent 
    | FIX_CommType_Absolute 
;;

(** Identifies the type of Corporate Action.*)
type fix_corporateaction =
    | FIX_CorporateAction_ExDividend 
    | FIX_CorporateAction_ExDistribution 
    | FIX_CorporateAction_ExRights 
    | FIX_CorporateAction_New 
    | FIX_CorporateAction_ExInterest 
;;

(** Used for options*)
type fix_coveredoruncovered =
    | FIX_CoveredOrUncovered_Covered 
    | FIX_CoveredOrUncovered_Uncovered 
;;

(** Used for options when delivering the order to an execution system/exchange to specify if the order is for a customer or the firm placing the order itself.*)
type fix_customerorfirm =
    | FIX_CustomerOrFirm_Customer 
    | FIX_CustomerOrFirm_Firm 
;;

(** Code to identify reason for cancel rejection.*)
type fix_cxlrejreason =
    | FIX_CxlRejReason_TooLateToCancel 
    | FIX_CxlRejReason_UnknownOrder 
    | FIX_CxlRejReason_BrokerCredit 
    | FIX_CxlRejReason_OrderAlreadyInPendingStatus 
;;

(** Identifies the type of request that a Cancel Reject is in response to.*)
type fix_cxlrejresponseto =
    | FIX_CxlRejResponseTo_OrderCancelRequest 
    | FIX_CxlRejResponseTo_OrderCancel 
;;

(** Reason for execution rejection.*)
type fix_dkreason =
    | FIX_DKReason_UnknownSymbol 
    | FIX_DKReason_WrongSide 
    | FIX_DKReason_QuantityExceedsOrder 
    | FIX_DKReason_NoMatchingOrder 
    | FIX_DKReason_PriceExceedsLimit 
    | FIX_DKReason_Other 
;;

(** Reason for deletion.*)
type fix_deletereason =
    | FIX_DeleteReason_Cancellation 
    | FIX_DeleteReason_Error 
;;

(** Code to identify the price a DiscretionOffset is related to and should be mathematically added to.*)
type fix_discretioninst =
    | FIX_DiscretionInst_RelatedToDisplayedPrice 
    | FIX_DiscretionInst_RelatedToMarketPrice 
    | FIX_DiscretionInst_RelatedToPrimaryPrice 
    | FIX_DiscretionInst_RelatedToLocalPrimaryPrice 
    | FIX_DiscretionInst_RelatedToMidpointPrice 
    | FIX_DiscretionInst_RelatedToLastTradePrice 
;;

(** Indicates whether or not the halt was due to the Related Security being halted.*)
type fix_duetorelated =
    | FIX_DueToRelated_NotRelatedToSecurityHalt 
    | FIX_DueToRelated_RelatedToSecurityHalt 
;;

(** Email message type.*)
type fix_emailtype =
    | FIX_EmailType_New 
    | FIX_EmailType_Reply 
    | FIX_EmailType_AdminReply 
;;

(** Indicates whether or not to exchange for phsyical.*)
type fix_exchangeforphysical =
    | FIX_ExchangeForPhysical_False 
    | FIX_ExchangeForPhysical_True 
;;

(** Instructions for order handling on exchange trading floor. If more than one instruction is applicable to an order, this field can contain multiple instructions separated by space.*)
type fix_execinst =
    | FIX_ExecInst_StayOnOfferSide 
    | FIX_ExecInst_NotHeld 
    | FIX_ExecInst_Work 
    | FIX_ExecInst_GoAlong 
    | FIX_ExecInst_OverTheDay 
    | FIX_ExecInst_Held 
    | FIX_ExecInst_ParticipateDoNotInitiate 
    | FIX_ExecInst_StrictScale 
    | FIX_ExecInst_TryToScale 
    | FIX_ExecInst_StayOnBidSide 
    | FIX_ExecInst_NoCross 
    | FIX_ExecInst_OKToCross 
    | FIX_ExecInst_CallFirst 
    | FIX_ExecInst_PercentOfVolume 
    | FIX_ExecInst_DoNotIncrease 
    | FIX_ExecInst_DoNotReduce 
    | FIX_ExecInst_AllOrNone 
    | FIX_ExecInst_InstitutionsOnly 
    | FIX_ExecInst_LastPeg 
    | FIX_ExecInst_MidPricePeg 
    | FIX_ExecInst_NonNegotiable 
    | FIX_ExecInst_OpeningPeg 
    | FIX_ExecInst_MarketPeg 
    | FIX_ExecInst_PrimaryPeg 
    | FIX_ExecInst_Suspend 
    | FIX_ExecInst_FixedPegToLocalBestBidOrOfferAtTimeOfOrder 
    | FIX_ExecInst_CustomerDisplayInstruction 
    | FIX_ExecInst_Netting 
    | FIX_ExecInst_PegToVWAP 
;;

(** Code to identify reason for an ExecutionRpt message sent with ExecType=Restated or used when communicating an unsolicited cancel.*)
type fix_execrestatementreason =
    | FIX_ExecRestatementReason_GTCorporateAction 
    | FIX_ExecRestatementReason_GTRenewal 
    | FIX_ExecRestatementReason_VerbalChange 
    | FIX_ExecRestatementReason_RepricingOfOrder 
    | FIX_ExecRestatementReason_BrokerOption 
    | FIX_ExecRestatementReason_PartialDeclineOfOrderQty 
;;

(** Identifies transaction type*)
type fix_exectranstype =
    | FIX_ExecTransType_New 
    | FIX_ExecTransType_Cancel 
    | FIX_ExecTransType_Correct 
    | FIX_ExecTransType_Status 
;;

(** Describes the specific ExecutionRpt (i.e. Pending Cancel) while OrdStatus will always identify the current order status (i.e. Partially Filled)*)
type fix_exectype =
    | FIX_ExecType_New 
    | FIX_ExecType_PartialFill 
    | FIX_ExecType_Fill 
    | FIX_ExecType_DoneForDay 
    | FIX_ExecType_Canceled 
    | FIX_ExecType_Replaced 
    | FIX_ExecType_PendingCancel 
    | FIX_ExecType_Stopped 
    | FIX_ExecType_Rejected 
    | FIX_ExecType_Suspended 
    | FIX_ExecType_PendingNew 
    | FIX_ExecType_Calculated 
    | FIX_ExecType_Expired 
    | FIX_ExecType_Restated 
    | FIX_ExecType_PendingReplace 
;;

(** Identifies a firm’s financial status.*)
type fix_financialstatus =
    | FIX_FinancialStatus_Bankrupt 
;;

(** Indicates request for forex accommodation trade to be executed along with security transaction.*)
type fix_forexreq =
    | FIX_ForexReq_DoNotExecuteForexAfterSecurityTrade 
    | FIX_ForexReq_ExecuteForexAfterSecurityTrade 
;;

(** Code to identify whether to book out executions on a part-filled GT order on the day of execution or to accumulate.*)
type fix_gtbookinginst =
    | FIX_GTBookingInst_BookOutAllTradesOnDayOfExecution 
    | FIX_GTBookingInst_AccumulateUntilFilledOrExpired 
    | FIX_GTBookingInst_AccumulateUntilVerballlyNotifiedOtherwise 
;;

(** Denotes the reason for the Opening Delay or Trading Halt.*)
type fix_haltreason =
    | FIX_HaltReason_NewsDissemination 
    | FIX_HaltReason_OrderInflux 
    | FIX_HaltReason_OrderImbalance 
    | FIX_HaltReason_AdditionalInformation 
    | FIX_HaltReason_NewsPending 
    | FIX_HaltReason_EquipmentChangeover 
;;

(** Instructions for order handling on Broker trading floor*)
type fix_handlinst =
    | FIX_HandlInst_AutomatedExecutionNoIntervention 
    | FIX_HandlInst_AutomatedExecutionInterventionOK 
    | FIX_HandlInst_ManualOrder 
;;

(** Identifies class of alternative SecurityID*)
type fix_idsource =
    | FIX_IDSource_CUSIP 
    | FIX_IDSource_SEDOL 
    | FIX_IDSource_QUIK 
    | FIX_IDSource_ISINNumber 
    | FIX_IDSource_RICCode 
    | FIX_IDSource_ISOCurrencyCode 
    | FIX_IDSource_ISOCountryCode 
    | FIX_IDSource_ExchangeSymbol 
    | FIX_IDSource_ConsolidatedTapeAssociation 
;;

(** Indicates that IOI is the result of an existing agency order or a facilitation position resulting from an agency order, not from principal trading or order solicitation activity.*)
type fix_ioinaturalflag =
    | FIX_IOINaturalFlag_NotNatural 
    | FIX_IOINaturalFlag_Natural 
;;

(** Relative quality of indication*)
type fix_ioiqltyind =
    | FIX_IOIQltyInd_High 
    | FIX_IOIQltyInd_Low 
    | FIX_IOIQltyInd_Medium 
;;

(** Code to qualify IOI use.*)
type fix_ioiqualifier =
    | FIX_IOIQualifier_AllOrNone 
    | FIX_IOIQualifier_AtTheClose 
    | FIX_IOIQualifier_InTouchWith 
    | FIX_IOIQualifier_Limit 
    | FIX_IOIQualifier_MoreBehind 
    | FIX_IOIQualifier_AtTheOpen 
    | FIX_IOIQualifier_TakingAPosition 
    | FIX_IOIQualifier_AtTheMarket 
    | FIX_IOIQualifier_ReadyToTrade 
    | FIX_IOIQualifier_PortfolioShown 
    | FIX_IOIQualifier_ThroughTheDay 
    | FIX_IOIQualifier_Versus 
    | FIX_IOIQualifier_Indication 
    | FIX_IOIQualifier_CrossingOpportunity 
    | FIX_IOIQualifier_AtTheMidpoint 
    | FIX_IOIQualifier_PreOpen 
;;

(** Number of shares in numeric or relative size.*)
type fix_ioishares =
    | FIX_IOIShares_Large 
    | FIX_IOIShares_Medium 
    | FIX_IOIShares_Small 
;;

(** Identifies IOI message transaction type*)
type fix_ioitranstype =
    | FIX_IOITransType_Cancel 
    | FIX_IOITransType_New 
    | FIX_IOITransType_Replace 
;;

(** Indicates whether or not the halt was due to Common Stock trading being halted.*)
type fix_inviewofcommon =
    | FIX_InViewOfCommon_HaltWasNotRelatedToAHaltOfTheCommonStock 
    | FIX_InViewOfCommon_HaltWasDueToCommonStockBeingHalted 
;;

(** Code to represent whether value is net (inclusive of tax) or gross.*)
type fix_inctaxind =
    | FIX_IncTaxInd_Net 
    | FIX_IncTaxInd_Gross 
;;

(** Broker capacity in order execution*)
type fix_lastcapacity =
    | FIX_LastCapacity_Agent 
    | FIX_LastCapacity_CrossAsAgent 
    | FIX_LastCapacity_CrossAsPrincipal 
    | FIX_LastCapacity_Principal 
;;

(** Code to identify the type of liquidity indicator.*)
type fix_liquidityindtype =
    | FIX_LiquidityIndType_FiveDayMovingAverage 
    | FIX_LiquidityIndType_TwentyDayMovingAverage 
    | FIX_LiquidityIndType_NormalMarketSize 
    | FIX_LiquidityIndType_Other 
;;

(** Identifies the type of ListExecInst.*)
type fix_listexecinsttype =
    | FIX_ListExecInstType_Immediate 
    | FIX_ListExecInstType_WaitForInstruction 
;;

(** Indicates whether the broker is to locate the stock in conjunction with a short sell order.*)
type fix_locatereqd =
    | FIX_LocateReqd_No 
    | FIX_LocateReqd_Yes 
;;

(** Type Market Data entry.*)
type fix_mdentrytype =
    | FIX_MDEntryType_Bid 
    | FIX_MDEntryType_Offer 
    | FIX_MDEntryType_Trade 
    | FIX_MDEntryType_IndexValue 
    | FIX_MDEntryType_OpeningPrice 
    | FIX_MDEntryType_ClosingPrice 
    | FIX_MDEntryType_SettlementPrice 
    | FIX_MDEntryType_TradingSessionHighPrice 
    | FIX_MDEntryType_TradingSessionLowPrice 
    | FIX_MDEntryType_TradingSessionVWAPPrice 
;;

(** Reason for the rejection of a Market Data request.*)
type fix_mdreqrejreason =
    | FIX_MDReqRejReason_UnknownSymbol 
    | FIX_MDReqRejReason_DuplicateMDReqID 
    | FIX_MDReqRejReason_InsufficientBandwidth 
    | FIX_MDReqRejReason_InsufficientPermissions 
    | FIX_MDReqRejReason_UnsupportedSubscriptionRequestType 
    | FIX_MDReqRejReason_UnsupportedMarketDepth 
    | FIX_MDReqRejReason_UnsupportedMDUpdateType 
    | FIX_MDReqRejReason_UnsupportedAggregatedBook 
    | FIX_MDReqRejReason_UnsupportedMDEntryType 
;;

(** Type of Market Data update action.*)
type fix_mdupdateaction =
    | FIX_MDUpdateAction_New 
    | FIX_MDUpdateAction_Change 
    | FIX_MDUpdateAction_Delete 
;;

(** Specifies the type of Market Data update.*)
type fix_mdupdatetype =
    | FIX_MDUpdateType_FullRefresh 
    | FIX_MDUpdateType_IncrementalRefresh 
;;

(** Type of message encoding (non-ASCII (non-English) characters) used in a message’s "Encoded" fields.*)
type fix_messageencoding =
    | FIX_MessageEncoding_EUCJP 
    | FIX_MessageEncoding_ISO2022JP 
    | FIX_MessageEncoding_ShiftJIS 
    | FIX_MessageEncoding_UTF8 
;;

(** Indicates type of miscellaneous fee.*)
type fix_miscfeetype =
    | FIX_MiscFeeType_Regulatory 
    | FIX_MiscFeeType_Tax 
    | FIX_MiscFeeType_LocalCommission 
    | FIX_MiscFeeType_ExchangeFees 
    | FIX_MiscFeeType_Stamp 
    | FIX_MiscFeeType_Levy 
    | FIX_MiscFeeType_Other 
    | FIX_MiscFeeType_Markup 
    | FIX_MiscFeeType_ConsumptionTax 
;;

(** Specifies the direction of the messsage.*)
type fix_msgdirection =
    | FIX_MsgDirection_Receive 
    | FIX_MsgDirection_Send 
;;

(** Used to indicate what an Execution Report represents (e.g. used with multi-leg securiteis, such as option strategies, spreads, etc.).*)
type fix_multilegreportingtype =
    | FIX_MultiLegReportingType_SingleSecurity 
    | FIX_MultiLegReportingType_IndividualLegOfAMultiLegSecurity 
    | FIX_MultiLegReportingType_MultiLegSecurity 
;;

(** Code to represent whether value is net (inclusive of tax) or gross.*)
type fix_netgrossind =
    | FIX_NetGrossInd_Net 
    | FIX_NetGrossInd_Gross 
;;

(** Indicates whether or not details should be communicated to BrokerOfCredit (i.e. step-in broker).*)
type fix_notifybrokerofcredit =
    | FIX_NotifyBrokerOfCredit_DetailsShouldNotBeCommunicated 
    | FIX_NotifyBrokerOfCredit_DetailsShouldBeCommunicated 
;;

(** Indicates whether the resulting position after a trade should be an opening position or closing position. Used for omnibus accounting - where accounts are held on a gross basis instead of being netted together.*)
type fix_openclose =
    | FIX_OpenClose_Close 
    | FIX_OpenClose_Open 
;;

(** Flag that identifies a price.*)
type fix_openclosesettleflag =
    | FIX_OpenCloseSettleFlag_DailyOpen 
    | FIX_OpenCloseSettleFlag_SessionOpen 
    | FIX_OpenCloseSettleFlag_DeliverySettlementEntry 
;;

(** Code to identify reason for order rejection.*)
type fix_ordrejreason =
    | FIX_OrdRejReason_BrokerCredit 
    | FIX_OrdRejReason_UnknownSymbol 
    | FIX_OrdRejReason_ExchangeClosed 
    | FIX_OrdRejReason_OrderExceedsLimit 
    | FIX_OrdRejReason_TooLateToEnter 
    | FIX_OrdRejReason_UnknownOrder 
    | FIX_OrdRejReason_DuplicateOrder 
    | FIX_OrdRejReason_DuplicateOfAVerballyCommunicatedOrder 
    | FIX_OrdRejReason_StaleOrder 
;;

(** Identifies current status of order.*)
type fix_ordstatus =
    | FIX_OrdStatus_New 
    | FIX_OrdStatus_PartiallyFilled 
    | FIX_OrdStatus_Filled 
    | FIX_OrdStatus_DoneForDay 
    | FIX_OrdStatus_Canceled 
    | FIX_OrdStatus_Replaced 
    | FIX_OrdStatus_PendingCancel 
    | FIX_OrdStatus_Stopped 
    | FIX_OrdStatus_Rejected 
    | FIX_OrdStatus_Suspended 
    | FIX_OrdStatus_PendingNew 
    | FIX_OrdStatus_Calculated 
    | FIX_OrdStatus_Expired 
    | FIX_OrdStatus_AcceptedForBidding 
    | FIX_OrdStatus_PendingReplace 
;;

(** Order type.*)
type fix_ordtype =
    | FIX_OrdType_Market 
    | FIX_OrdType_Limit 
    | FIX_OrdType_Stop 
    | FIX_OrdType_StopLimit 
    | FIX_OrdType_MarketOnClose 
    | FIX_OrdType_WithOrWithout 
    | FIX_OrdType_LimitOrBetter 
    | FIX_OrdType_LimitWithOrWithout 
    | FIX_OrdType_OnBasis 
    | FIX_OrdType_OnClose 
    | FIX_OrdType_LimitOnClose 
    | FIX_OrdType_ForexMarket 
    | FIX_OrdType_PreviouslyQuoted 
    | FIX_OrdType_PreviouslyIndicated 
    | FIX_OrdType_ForexLimit 
    | FIX_OrdType_ForexSwap 
    | FIX_OrdType_ForexPreviouslyQuoted 
    | FIX_OrdType_Funari 
    | FIX_OrdType_Pegged 
;;

(** Indicates possible retransmission of message with this sequence number*)
type fix_possdupflag =
    | FIX_PossDupFlag_OriginalTransmission 
    | FIX_PossDupFlag_PossibleDuplicate 
;;

(** Indicates that message may contain information that has been sent under another sequence number.*)
type fix_possresend =
    | FIX_PossResend_OriginalTransmission 
    | FIX_PossResend_PossibleResend 
;;

(** Code to represent the price type.*)
type fix_pricetype =
    | FIX_PriceType_Percentage 
    | FIX_PriceType_PerUnit 
    | FIX_PriceType_FixedAmount 
;;

(** Processing code for sub-account. Absence of this field in AllocAccount / AllocPrice/AllocShares / ProcessCode instance indicates regular trade.*)
type fix_processcode =
    | FIX_ProcessCode_Regular 
    | FIX_ProcessCode_SoftDollar 
    | FIX_ProcessCode_StepIn 
    | FIX_ProcessCode_StepOut 
    | FIX_ProcessCode_SoftDollarStepIn 
    | FIX_ProcessCode_SoftDollarStepOut 
    | FIX_ProcessCode_PlanSponsor 
;;

(** Code to identify the desired frequency of progress reports.*)
type fix_progrptreqs =
    | FIX_ProgRptReqs_BuySideRequests 
    | FIX_ProgRptReqs_SellSideSends 
    | FIX_ProgRptReqs_RealTimeExecutionReports 
;;

(** Indicates whether an Option is for a put or call.*)
type fix_putorcall =
    | FIX_PutOrCall_Put 
    | FIX_PutOrCall_Call 
;;

(** Identifies the status of the quote acknowledgement.*)
type fix_quoteackstatus =
    | FIX_QuoteAckStatus_Accepted 
    | FIX_QuoteAckStatus_CancelForSymbol 
    | FIX_QuoteAckStatus_CanceledForSecurityType 
    | FIX_QuoteAckStatus_CanceledForUnderlying 
    | FIX_QuoteAckStatus_CanceledAll 
    | FIX_QuoteAckStatus_Rejected 
;;

(** Identifies the type of quote cancel.*)
type fix_quotecanceltype =
    | FIX_QuoteCancelType_CancelForOneOrMoreSecurities 
    | FIX_QuoteCancelType_CancelForSecurityType 
    | FIX_QuoteCancelType_CancelForUnderlyingSecurity 
    | FIX_QuoteCancelType_CancelAllQuotes 
;;

(** Space-delimited list of conditions describing a quote.*)
type fix_quotecondition =
    | FIX_QuoteCondition_Open 
    | FIX_QuoteCondition_Closed 
    | FIX_QuoteCondition_ExchangeBest 
    | FIX_QuoteCondition_ConsolidatedBest 
    | FIX_QuoteCondition_Locked 
    | FIX_QuoteCondition_Crossed 
    | FIX_QuoteCondition_Depth 
    | FIX_QuoteCondition_FastTrading 
    | FIX_QuoteCondition_NonFirm 
;;

(** Reason Quote Entry was rejected:*)
type fix_quoteentryrejectreason =
    | FIX_QuoteEntryRejectReason_UnknownSymbol 
    | FIX_QuoteEntryRejectReason_Exchange 
    | FIX_QuoteEntryRejectReason_QuoteExceedsLimit 
    | FIX_QuoteEntryRejectReason_TooLateToEnter 
    | FIX_QuoteEntryRejectReason_UnknownQuote 
    | FIX_QuoteEntryRejectReason_DuplicateQuote 
    | FIX_QuoteEntryRejectReason_InvalidBidAskSpread 
    | FIX_QuoteEntryRejectReason_InvalidPrice 
    | FIX_QuoteEntryRejectReason_NotAuthorizedToQuoteSecurity 
;;

(** Reason Quote was rejected:*)
type fix_quoterejectreason =
    | FIX_QuoteRejectReason_UnknownSymbol 
    | FIX_QuoteRejectReason_Exchange 
    | FIX_QuoteRejectReason_QuoteRequestExceedsLimit 
    | FIX_QuoteRejectReason_TooLateToEnter 
    | FIX_QuoteRejectReason_UnknownQuote 
    | FIX_QuoteRejectReason_DuplicateQuote 
    | FIX_QuoteRejectReason_InvalidBid 
    | FIX_QuoteRejectReason_InvalidPrice 
    | FIX_QuoteRejectReason_NotAuthorizedToQuoteSecurity 
;;

(** Indicates the type of Quote Request being generated*)
type fix_quoterequesttype =
    | FIX_QuoteRequestType_Manual 
    | FIX_QuoteRequestType_Automatic 
;;

(** Level of Response requested from receiver of quote messages.*)
type fix_quoteresponselevel =
    | FIX_QuoteResponseLevel_NoAcknowledgement 
    | FIX_QuoteResponseLevel_AcknowledgeOnlyNegativeOrErroneousQuotes 
    | FIX_QuoteResponseLevel_AcknowledgeEachQuoteMessage 
;;

(** Identifies party of trade responsible for exchange reporting.*)
type fix_reporttoexch =
    | FIX_ReportToExch_SenderReports 
    | FIX_ReportToExch_ReceiverReports 
;;

(** Indicates that the both sides of the FIX session should reset sequence numbers.*)
type fix_resetseqnumflag =
    | FIX_ResetSeqNumFlag_No 
    | FIX_ResetSeqNumFlag_Yes 
;;

(** Indicates the type of RoutingID specified.*)
type fix_routingtype =
    | FIX_RoutingType_TargetFirm 
    | FIX_RoutingType_TargetList 
    | FIX_RoutingType_BlockFirm 
    | FIX_RoutingType_BlockList 
;;

(** Note that the name of this field is changing to "OrderCapacity" as Rule80A is a very US market-specific term. Other world markets need to convey similar information, however, often a subset of the US values. . See the "Rule80A (aka OrderCapacity) Usage by Market" appendix for market-specific usage of this field.*)
type fix_rule80a =
    | FIX_Rule80A_AgencySingleOrder 
    | FIX_Rule80A_ShortExemptTransactionAType 
    | FIX_Rule80A_ProprietaryNonAlgo 
    | FIX_Rule80A_ProgramOrderMember 
    | FIX_Rule80A_ShortExemptTransactionForPrincipal 
    | FIX_Rule80A_ShortExemptTransactionWType 
    | FIX_Rule80A_ShortExemptTransactionIType 
    | FIX_Rule80A_IndividualInvestor 
    | FIX_Rule80A_ProprietaryAlgo 
    | FIX_Rule80A_AgencyAlgo 
    | FIX_Rule80A_ShortExemptTransactionMemberAffliated 
    | FIX_Rule80A_ProgramOrderOtherMember 
    | FIX_Rule80A_AgentForOtherMember 
    | FIX_Rule80A_ProprietaryTransactionAffiliated 
    | FIX_Rule80A_Principal 
    | FIX_Rule80A_TransactionNonMember 
    | FIX_Rule80A_SpecialistTrades 
    | FIX_Rule80A_TransactionUnaffiliatedMember 
    | FIX_Rule80A_AgencyIndexArb 
    | FIX_Rule80A_AllOtherOrdersAsAgentForOtherMember 
    | FIX_Rule80A_ShortExemptTransactionMemberNotAffliated 
    | FIX_Rule80A_AgencyNonAlgo 
    | FIX_Rule80A_ShortExemptTransactionNonMember 
;;

(** Type of Security Definition Request.*)
type fix_securityrequesttype =
    | FIX_SecurityRequestType_RequestSecurityIdentityAndSpecifications 
    | FIX_SecurityRequestType_RequestSecurityIdentityForSpecifications 
    | FIX_SecurityRequestType_RequestListSecurityTypes 
    | FIX_SecurityRequestType_RequestListSecurities 
;;

(** Type of Security Definition message response.*)
type fix_securityresponsetype =
    | FIX_SecurityResponseType_AcceptAsIs 
    | FIX_SecurityResponseType_AcceptWithRevisions 
    | FIX_SecurityResponseType_ListOfSecurityTypesReturnedPerRequest 
    | FIX_SecurityResponseType_ListOfSecuritiesReturnedPerRequest 
    | FIX_SecurityResponseType_RejectSecurityProposal 
    | FIX_SecurityResponseType_CannotMatchSelectionCriteria 
;;

(** Identifies the trading status applicable to the transaction.*)
type fix_securitytradingstatus =
    | FIX_SecurityTradingStatus_OpeningDelay 
    | FIX_SecurityTradingStatus_MarketOnCloseImbalanceSell 
    | FIX_SecurityTradingStatus_NoMarketImbalance 
    | FIX_SecurityTradingStatus_NoMarketOnCloseImbalance 
    | FIX_SecurityTradingStatus_ITSPreOpening 
    | FIX_SecurityTradingStatus_NewPriceIndication 
    | FIX_SecurityTradingStatus_TradeDisseminationTime 
    | FIX_SecurityTradingStatus_ReadyToTrade 
    | FIX_SecurityTradingStatus_NotAvailableForTrading 
    | FIX_SecurityTradingStatus_NotTradedOnThisMarket 
    | FIX_SecurityTradingStatus_TradingHalt 
    | FIX_SecurityTradingStatus_UnknownOrInvalid 
    | FIX_SecurityTradingStatus_Resume 
    | FIX_SecurityTradingStatus_NoOpen 
    | FIX_SecurityTradingStatus_PriceIndication 
    | FIX_SecurityTradingStatus_TradingRangeIndication 
    | FIX_SecurityTradingStatus_MarketImbalanceBuy 
    | FIX_SecurityTradingStatus_MarketImbalanceSell 
    | FIX_SecurityTradingStatus_MarketOnCloseImbalanceBuy 
;;

(** Indicates type of security (ISITC spec)*)
type fix_securitytype =
    | FIX_SecurityType_Wildcard 
    | FIX_SecurityType_BankersAcceptance 
    | FIX_SecurityType_ConvertibleBond 
    | FIX_SecurityType_CertificateOfDeposit 
    | FIX_SecurityType_CollateralizedMortgageObligation 
    | FIX_SecurityType_CorporateBond 
    | FIX_SecurityType_CommercialPaper 
    | FIX_SecurityType_CorporatePrivatePlacement 
    | FIX_SecurityType_CommonStock 
    | FIX_SecurityType_FederalHousingAuthority 
    | FIX_SecurityType_FederalHomeLoan 
    | FIX_SecurityType_FederalNationalMortgageAssociation 
    | FIX_SecurityType_ForeignExchangeContract 
    | FIX_SecurityType_Future 
    | FIX_SecurityType_GovernmentNationalMortgageAssociation 
    | FIX_SecurityType_TreasuriesAgencyDebenture 
    | FIX_SecurityType_IOETTEMortgage 
    | FIX_SecurityType_MutualFund 
    | FIX_SecurityType_MortgageInterestOnly 
    | FIX_SecurityType_MortgagePrincipalOnly 
    | FIX_SecurityType_MortgagePrivatePlacement 
    | FIX_SecurityType_MiscellaneousPassThrough 
    | FIX_SecurityType_MunicipalBond 
    | FIX_SecurityType_NoSecurityType 
    | FIX_SecurityType_Option 
    | FIX_SecurityType_PreferredStock 
    | FIX_SecurityType_RepurchaseAgreement 
    | FIX_SecurityType_ReverseRepurchaseAgreement 
    | FIX_SecurityType_StudentLoanMarketingAssociation 
    | FIX_SecurityType_TimeDeposit 
    | FIX_SecurityType_USTreasuryBillOld 
    | FIX_SecurityType_Warrant 
    | FIX_SecurityType_CatsTigersAndLions 
;;

(** Indicates mode used for Settlement Instructions*)
type fix_settlinstmode =
    | FIX_SettlInstMode_Default 
    | FIX_SettlInstMode_StandingInstructionsProvided 
    | FIX_SettlInstMode_SpecificAllocationAccountOverriding 
    | FIX_SettlInstMode_SpecificAllocationAccountStanding 
;;

(** Indicates source of Settlement Instructions*)
type fix_settlinstsource =
    | FIX_SettlInstSource_BrokerCredit 
    | FIX_SettlInstSource_Institution 
;;

(** Settlement Instructions message transaction type*)
type fix_settlinsttranstype =
    | FIX_SettlInstTransType_Cancel 
    | FIX_SettlInstTransType_New 
    | FIX_SettlInstTransType_Replace 
;;

(** Identifies Settlement Depository or Country Code (ISITC spec)*)
type fix_settllocation =
    | FIX_SettlLocation_CEDEL 
    | FIX_SettlLocation_DepositoryTrustCompany 
    | FIX_SettlLocation_EuroClear 
    | FIX_SettlLocation_FederalBookEntry 
    | FIX_SettlLocation_LocalMarketSettleLocation 
    | FIX_SettlLocation_Physical 
    | FIX_SettlLocation_ParticipantTrustCompany 
;;

(** Indicates order settlement period. Absence of this field is interpreted as Regular. Regular is defined as the default settlement period for the particular security on the exchange of execution.*)
type fix_settlmnttyp =
    | FIX_SettlmntTyp_Regular 
    | FIX_SettlmntTyp_Cash 
    | FIX_SettlmntTyp_NextDay 
    | FIX_SettlmntTyp_TPlus2 
    | FIX_SettlmntTyp_TPlus3 
    | FIX_SettlmntTyp_TPlus4 
    | FIX_SettlmntTyp_Future 
    | FIX_SettlmntTyp_WhenAndIfIssued 
    | FIX_SettlmntTyp_SellersOption 
    | FIX_SettlmntTyp_TPlus5 
;;

(** Side of order*)
type fix_side =
    | FIX_Side_Buy 
    | FIX_Side_Sell 
    | FIX_Side_BuyMinus 
    | FIX_Side_SellPlus 
    | FIX_Side_SellShort 
    | FIX_Side_SellShortExempt 
    | FIX_Side_Undisclosed 
    | FIX_Side_Cross 
    | FIX_Side_CrossShort 
;;

(** Indicates whether or not the order was solicited.*)
type fix_solicitedflag =
    | FIX_SolicitedFlag_WasNotSolicited 
    | FIX_SolicitedFlag_WasSolicited 
;;

(** Identifies the Standing Instruction database used*)
type fix_standinstdbtype =
    | FIX_StandInstDbType_Other 
    | FIX_StandInstDbType_DTCSID 
    | FIX_StandInstDbType_ThomsonALERT 
    | FIX_StandInstDbType_AGlobalCustodian 
;;

(** Subscription Request Type*)
type fix_subscriptionrequesttype =
    | FIX_SubscriptionRequestType_Snapshot 
    | FIX_SubscriptionRequestType_SnapshotAndUpdates 
    | FIX_SubscriptionRequestType_DisablePreviousSnapshot 
;;

(** Direction of the "tick".*)
type fix_tickdirection =
    | FIX_TickDirection_PlusTick 
    | FIX_TickDirection_ZeroPlusTick 
    | FIX_TickDirection_MinusTick 
    | FIX_TickDirection_ZeroMinusTick 
;;

(** Specifies how long the order remains in effect. Absence of this field is interpreted as DAY.*)
type fix_timeinforce =
    | FIX_TimeInForce_Day 
    | FIX_TimeInForce_GoodTillCancel 
    | FIX_TimeInForce_AtTheOpening 
    | FIX_TimeInForce_ImmediateOrCancel 
    | FIX_TimeInForce_FillOrKill 
    | FIX_TimeInForce_GoodTillCrossing 
    | FIX_TimeInForce_GoodTillDate 
;;

(** Method of trading*)
type fix_tradsesmethod =
    | FIX_TradSesMethod_Electronic 
    | FIX_TradSesMethod_OpenOutcry 
    | FIX_TradSesMethod_TwoParty 
;;

(** Trading Session Mode*)
type fix_tradsesmode =
    | FIX_TradSesMode_Testing 
    | FIX_TradSesMode_Simulated 
    | FIX_TradSesMode_Production 
;;

(** State of the trading session.*)
type fix_tradsesstatus =
    | FIX_TradSesStatus_Halted 
    | FIX_TradSesStatus_Open 
    | FIX_TradSesStatus_Closed 
    | FIX_TradSesStatus_PreOpen 
    | FIX_TradSesStatus_PreClose 
;;

(** Space-delimited list of conditions describing a trade*)
type fix_tradecondition =
    | FIX_TradeCondition_Cash 
    | FIX_TradeCondition_AveragePriceTrade 
    | FIX_TradeCondition_CashTrade 
    | FIX_TradeCondition_NextDay 
    | FIX_TradeCondition_Opening 
    | FIX_TradeCondition_IntradayTradeDetail 
    | FIX_TradeCondition_Rule127Trade 
    | FIX_TradeCondition_Rule155Trade 
    | FIX_TradeCondition_SoldLast 
    | FIX_TradeCondition_NextDayTrade 
    | FIX_TradeCondition_Opened 
    | FIX_TradeCondition_Seller 
    | FIX_TradeCondition_Sold 
    | FIX_TradeCondition_StoppedStock 
;;

(** Code to represent the type of trade.*)
type fix_tradetype =
    | FIX_TradeType_Agency 
    | FIX_TradeType_VWAPGuarantee 
    | FIX_TradeType_GuaranteedClose 
    | FIX_TradeType_RiskTrade 
;;

(** Indicates whether or not message is being sent as a result of a subscription request or not.*)
type fix_unsolicitedindicator =
    | FIX_UnsolicitedIndicator_MessageIsBeingSentAsAResultOfAPriorRequest 
    | FIX_UnsolicitedIndicator_MessageIsBeingSentUnsolicited 
;;

(** Urgency flag*)
type fix_urgency =
    | FIX_Urgency_Normal 
    | FIX_Urgency_Flash 
    | FIX_Urgency_Background 
;;

type fix_week =
    | FIX_week_noweek 
    | FIX_week_w1 
    | FIX_week_w2 
    | FIX_week_w3 
    | FIX_week_w4 
    | FIX_week_w5 
;;

(** three letter code from ISO4217*)
type fix_currency =
    | FIX_Currency_EUR 
    | FIX_Currency_GBP 
    | FIX_Currency_USD 
;;

(** 2 letter country code - ISO 3166 *)
type fix_country =
    | FIX_Country_DE 
    | FIX_Country_GB 
    | FIX_Country_US 
;;

(** ISO 10383 Market Identifier Code*)
type fix_exchange =
    | FIX_Exchange_XLON 
    | FIX_Exchange_XNYS 
    | FIX_Exchange_XNAS 
    | FIX_Exchange_XJAS 
    | FIX_Exchange_XSHG 
    | FIX_Exchange_SHSC 
;;
