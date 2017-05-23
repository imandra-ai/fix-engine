type fix_accounttype =
    | FIX_AccountType_CarriedCustomerSide 
    | FIX_AccountType_CarriedNonCustomerSide 
    | FIX_AccountType_HouseTrader 
    | FIX_AccountType_FloorTrader 
    | FIX_AccountType_CarriedNonCustomerSideCrossMargined 
    | FIX_AccountType_HouseTraderCrossMargined 
    | FIX_AccountType_JointBackOfficeAccount 
;;

type fix_acctidsource =
    | FIX_AcctIDSource_BIC 
    | FIX_AcctIDSource_SIDCode 
    | FIX_AcctIDSource_TFM 
    | FIX_AcctIDSource_OMGEO 
    | FIX_AcctIDSource_DTCCCode 
    | FIX_AcctIDSource_Other 
;;

type fix_adjustment =
    | FIX_Adjustment_Cancel 
    | FIX_Adjustment_Error 
    | FIX_Adjustment_Correction 
;;

type fix_adjustmenttype =
    | FIX_AdjustmentType_ProcessRequestAsMarginDisposition 
    | FIX_AdjustmentType_DeltaPlus 
    | FIX_AdjustmentType_DeltaMinus 
    | FIX_AdjustmentType_Final 
;;

type fix_advside =
    | FIX_AdvSide_Buy 
    | FIX_AdvSide_Sell 
    | FIX_AdvSide_Cross 
    | FIX_AdvSide_Trade 
;;

type fix_advtranstype =
    | FIX_AdvTransType_New 
    | FIX_AdvTransType_Cancel 
    | FIX_AdvTransType_Replace 
;;

type fix_affirmstatus =
    | FIX_AffirmStatus_Received 
    | FIX_AffirmStatus_ConfirmRejected 
    | FIX_AffirmStatus_Affirmed 
;;

type fix_aggregatedbook =
    | FIX_AggregatedBook_BookEntriesToBeAggregated 
    | FIX_AggregatedBook_BookEntriesShouldNotBeAggregated 
;;

type fix_allocaccounttype =
    | FIX_AllocAccountType_CarriedCustomerSide 
    | FIX_AllocAccountType_CarriedNonCustomerSide 
    | FIX_AllocAccountType_HouseTrader 
    | FIX_AllocAccountType_FloorTrader 
    | FIX_AllocAccountType_CarriedNonCustomerSideCrossMargined 
    | FIX_AllocAccountType_HouseTraderCrossMargined 
    | FIX_AllocAccountType_JointBackOfficeAccount 
;;

type fix_alloccancreplacereason =
    | FIX_AllocCancReplaceReason_OriginalDetailsIncomplete 
    | FIX_AllocCancReplaceReason_ChangeInUnderlyingOrderDetails 
    | FIX_AllocCancReplaceReason_Other 
;;

type fix_allochandlinst =
    | FIX_AllocHandlInst_Match 
    | FIX_AllocHandlInst_Forward 
    | FIX_AllocHandlInst_ForwardAndMatch 
;;

type fix_allocintermedreqtype =
    | FIX_AllocIntermedReqType_PendingAccept 
    | FIX_AllocIntermedReqType_PendingRelease 
    | FIX_AllocIntermedReqType_PendingReversal 
    | FIX_AllocIntermedReqType_Accept 
    | FIX_AllocIntermedReqType_BlockLevelReject 
    | FIX_AllocIntermedReqType_AccountLevelReject 
;;

type fix_alloclinktype =
    | FIX_AllocLinkType_FXNetting 
    | FIX_AllocLinkType_FXSwap 
;;

type fix_allocnoorderstype =
    | FIX_AllocNoOrdersType_NotSpecified 
    | FIX_AllocNoOrdersType_ExplicitListProvided 
;;

type fix_allocrejcode =
    | FIX_AllocRejCode_UnknownAccount 
    | FIX_AllocRejCode_IncorrectQuantity 
    | FIX_AllocRejCode_IncorrectAveragegPrice 
    | FIX_AllocRejCode_UnknownExecutingBrokerMnemonic 
    | FIX_AllocRejCode_CommissionDifference 
    | FIX_AllocRejCode_UnknownOrderID 
    | FIX_AllocRejCode_UnknownListID 
    | FIX_AllocRejCode_OtherSeeText 
    | FIX_AllocRejCode_IncorrectAllocatedQuantity 
    | FIX_AllocRejCode_CalculationDifference 
    | FIX_AllocRejCode_UnknownOrStaleExecID 
    | FIX_AllocRejCode_MismatchedData 
    | FIX_AllocRejCode_UnknownClOrdID 
    | FIX_AllocRejCode_WarehouseRequestRejected 
;;

type fix_allocreporttype =
    | FIX_AllocReportType_SellsideCalculatedUsingPreliminary 
    | FIX_AllocReportType_SellsideCalculatedWithoutPreliminary 
    | FIX_AllocReportType_WarehouseRecap 
    | FIX_AllocReportType_RequestToIntermediary 
;;

type fix_allocsettlinsttype =
    | FIX_AllocSettlInstType_UseDefaultInstructions 
    | FIX_AllocSettlInstType_DeriveFromParametersProvided 
    | FIX_AllocSettlInstType_FullDetailsProvided 
    | FIX_AllocSettlInstType_SSIDBIDsProvided 
    | FIX_AllocSettlInstType_PhoneForInstructions 
;;

type fix_allocstatus =
    | FIX_AllocStatus_Accepted 
    | FIX_AllocStatus_BlockLevelReject 
    | FIX_AllocStatus_AccountLevelReject 
    | FIX_AllocStatus_Received 
    | FIX_AllocStatus_Incomplete 
    | FIX_AllocStatus_RejectedByIntermediary 
;;

type fix_alloctranstype =
    | FIX_AllocTransType_New 
    | FIX_AllocTransType_Replace 
    | FIX_AllocTransType_Cancel 
;;

type fix_alloctype =
    | FIX_AllocType_Calculated 
    | FIX_AllocType_Preliminary 
    | FIX_AllocType_ReadyToBook 
    | FIX_AllocType_WarehouseInstruction 
    | FIX_AllocType_RequestToIntermediary 
;;

type fix_applqueueaction =
    | FIX_ApplQueueAction_NoActionTaken 
    | FIX_ApplQueueAction_QueueFlushed 
    | FIX_ApplQueueAction_OverlayLast 
    | FIX_ApplQueueAction_EndSession 
;;

type fix_applqueueresolution =
    | FIX_ApplQueueResolution_NoActionTaken 
    | FIX_ApplQueueResolution_QueueFlushed 
    | FIX_ApplQueueResolution_OverlayLast 
    | FIX_ApplQueueResolution_EndSession 
;;

type fix_assignmentmethod =
    | FIX_AssignmentMethod_Random 
    | FIX_AssignmentMethod_ProRata 
;;

type fix_avgpxindicator =
    | FIX_AvgPxIndicator_NoAveragePricing 
    | FIX_AvgPxIndicator_Trade 
    | FIX_AvgPxIndicator_LastTrade 
;;

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

type fix_biddescriptortype =
    | FIX_BidDescriptorType_Sector 
    | FIX_BidDescriptorType_Country 
    | FIX_BidDescriptorType_Index 
;;

type fix_bidrequesttranstype =
    | FIX_BidRequestTransType_New 
    | FIX_BidRequestTransType_Cancel 
;;

type fix_bidtradetype =
    | FIX_BidTradeType_RiskTrade 
    | FIX_BidTradeType_VWAPGuarantee 
    | FIX_BidTradeType_Agency 
    | FIX_BidTradeType_GuaranteedClose 
;;

type fix_bidtype =
    | FIX_BidType_NonDisclosed 
    | FIX_BidType_Disclosed 
    | FIX_BidType_NoBiddingProcess 
;;

type fix_bookingtype =
    | FIX_BookingType_RegularBooking 
    | FIX_BookingType_CFD 
    | FIX_BookingType_TotalReturnSwap 
;;

type fix_bookingunit =
    | FIX_BookingUnit_EachPartialExecutionIsABookableUnit 
    | FIX_BookingUnit_AggregatePartialExecutionsOnThisOrder 
    | FIX_BookingUnit_AggregateExecutionsForThisSymbol 
;;

type fix_cpprogram =
    | FIX_CPProgram_Program3a3 
    | FIX_CPProgram_Program42 
    | FIX_CPProgram_Other 
;;

type fix_cancellationrights =
    | FIX_CancellationRights_Yes 
    | FIX_CancellationRights_NoExecutionOnly 
    | FIX_CancellationRights_NoWaiverAgreement 
    | FIX_CancellationRights_NoInstitutional 
;;

type fix_cashmargin =
    | FIX_CashMargin_Cash 
    | FIX_CashMargin_MarginOpen 
    | FIX_CashMargin_MarginClose 
;;

type fix_clearingfeeindicator =
    | FIX_ClearingFeeIndicator_CBOEMember 
    | FIX_ClearingFeeIndicator_NonMemberAndCustomer 
    | FIX_ClearingFeeIndicator_EquityMemberAndClearingMember 
    | FIX_ClearingFeeIndicator_FullAndAssociateMember 
    | FIX_ClearingFeeIndicator_Firms106HAnd106J 
    | FIX_ClearingFeeIndicator_GIM 
    | FIX_ClearingFeeIndicator_Lessee106FEmployees 
    | FIX_ClearingFeeIndicator_AllOtherOwnershipTypes 
    | FIX_ClearingFeeIndicator_FirstYearDelegate 
    | FIX_ClearingFeeIndicator_SecondYearDelegate 
    | FIX_ClearingFeeIndicator_ThirdYearDelegate 
    | FIX_ClearingFeeIndicator_FourthYearDelegate 
    | FIX_ClearingFeeIndicator_FifthYearDelegate 
    | FIX_ClearingFeeIndicator_SixthYearDelegate 
;;

type fix_clearinginstruction =
    | FIX_ClearingInstruction_ProcessNormally 
    | FIX_ClearingInstruction_ExcludeFromAllNetting 
    | FIX_ClearingInstruction_BilateralNettingOnly 
    | FIX_ClearingInstruction_ExClearing 
    | FIX_ClearingInstruction_SpecialTrade 
    | FIX_ClearingInstruction_MultilateralNetting 
    | FIX_ClearingInstruction_ClearAgainstCentralCounterparty 
    | FIX_ClearingInstruction_ExcludeFromCentralCounterparty 
    | FIX_ClearingInstruction_ManualMode 
    | FIX_ClearingInstruction_AutomaticPostingMode 
    | FIX_ClearingInstruction_AutomaticGiveUpMode 
    | FIX_ClearingInstruction_QualifiedServiceRepresentativeQSR 
    | FIX_ClearingInstruction_CustomerTrade 
    | FIX_ClearingInstruction_SelfClearing 
;;

type fix_collaction =
    | FIX_CollAction_Retain 
    | FIX_CollAction_Add 
    | FIX_CollAction_Remove 
;;

type fix_collasgnreason =
    | FIX_CollAsgnReason_Initial 
    | FIX_CollAsgnReason_Scheduled 
    | FIX_CollAsgnReason_TimeWarning 
    | FIX_CollAsgnReason_MarginDeficiency 
    | FIX_CollAsgnReason_MarginExcess 
    | FIX_CollAsgnReason_ForwardCollateralDemand 
    | FIX_CollAsgnReason_EventOfDefault 
    | FIX_CollAsgnReason_AdverseTaxEvent 
;;

type fix_collasgnrejectreason =
    | FIX_CollAsgnRejectReason_UnknownDeal 
    | FIX_CollAsgnRejectReason_UnknownOrInvalidInstrument 
    | FIX_CollAsgnRejectReason_UnauthorizedTransaction 
    | FIX_CollAsgnRejectReason_InsufficientCollateral 
    | FIX_CollAsgnRejectReason_InvalidTypeOfCollateral 
    | FIX_CollAsgnRejectReason_ExcessiveSubstitution 
    | FIX_CollAsgnRejectReason_Other 
;;

type fix_collasgnresptype =
    | FIX_CollAsgnRespType_Received 
    | FIX_CollAsgnRespType_Accepted 
    | FIX_CollAsgnRespType_Declined 
    | FIX_CollAsgnRespType_Rejected 
;;

type fix_collasgntranstype =
    | FIX_CollAsgnTransType_New 
    | FIX_CollAsgnTransType_Replace 
    | FIX_CollAsgnTransType_Cancel 
    | FIX_CollAsgnTransType_Release 
    | FIX_CollAsgnTransType_Reverse 
;;

type fix_collinquiryqualifier =
    | FIX_CollInquiryQualifier_TradeDate 
    | FIX_CollInquiryQualifier_GCInstrument 
    | FIX_CollInquiryQualifier_CollateralInstrument 
    | FIX_CollInquiryQualifier_SubstitutionEligible 
    | FIX_CollInquiryQualifier_NotAssigned 
    | FIX_CollInquiryQualifier_PartiallyAssigned 
    | FIX_CollInquiryQualifier_FullyAssigned 
    | FIX_CollInquiryQualifier_OutstandingTrades 
;;

type fix_collinquiryresult =
    | FIX_CollInquiryResult_Successful 
    | FIX_CollInquiryResult_InvalidOrUnknownInstrument 
    | FIX_CollInquiryResult_InvalidOrUnknownCollateralType 
    | FIX_CollInquiryResult_InvalidParties 
    | FIX_CollInquiryResult_InvalidTransportTypeRequested 
    | FIX_CollInquiryResult_InvalidDestinationRequested 
    | FIX_CollInquiryResult_NoCollateralFoundForTheTradeSpecified 
    | FIX_CollInquiryResult_NoCollateralFoundForTheOrderSpecified 
    | FIX_CollInquiryResult_CollateralInquiryTypeNotSupported 
    | FIX_CollInquiryResult_UnauthorizedForCollateralInquiry 
    | FIX_CollInquiryResult_Other 
;;

type fix_collinquirystatus =
    | FIX_CollInquiryStatus_Accepted 
    | FIX_CollInquiryStatus_AcceptedWithWarnings 
    | FIX_CollInquiryStatus_Completed 
    | FIX_CollInquiryStatus_CompletedWithWarnings 
    | FIX_CollInquiryStatus_Rejected 
;;

type fix_collstatus =
    | FIX_CollStatus_Unassigned 
    | FIX_CollStatus_PartiallyAssigned 
    | FIX_CollStatus_AssignmentProposed 
    | FIX_CollStatus_Assigned 
    | FIX_CollStatus_Challenged 
;;

type fix_commtype =
    | FIX_CommType_PerUnit 
    | FIX_CommType_Percent 
    | FIX_CommType_Absolute 
    | FIX_CommType_PercentageWaivedCashDiscount 
    | FIX_CommType_PercentageWaivedEnhancedUnits 
    | FIX_CommType_PointsPerBondOrContract 
;;

type fix_confirmrejreason =
    | FIX_ConfirmRejReason_MismatchedAccount 
    | FIX_ConfirmRejReason_MissingSettlementInstructions 
    | FIX_ConfirmRejReason_Other 
;;

type fix_confirmstatus =
    | FIX_ConfirmStatus_Received 
    | FIX_ConfirmStatus_MismatchedAccount 
    | FIX_ConfirmStatus_MissingSettlementInstructions 
    | FIX_ConfirmStatus_Confirmed 
    | FIX_ConfirmStatus_RequestRejected 
;;

type fix_confirmtranstype =
    | FIX_ConfirmTransType_New 
    | FIX_ConfirmTransType_Replace 
    | FIX_ConfirmTransType_Cancel 
;;

type fix_confirmtype =
    | FIX_ConfirmType_Status 
    | FIX_ConfirmType_Confirmation 
    | FIX_ConfirmType_ConfirmationRequestRejected 
;;

type fix_contamttype =
    | FIX_ContAmtType_CommissionAmount 
    | FIX_ContAmtType_CommissionPercent 
    | FIX_ContAmtType_InitialChargeAmount 
    | FIX_ContAmtType_InitialChargePercent 
    | FIX_ContAmtType_DiscountAmount 
    | FIX_ContAmtType_DiscountPercent 
    | FIX_ContAmtType_DilutionLevyAmount 
    | FIX_ContAmtType_DilutionLevyPercent 
    | FIX_ContAmtType_ExitChargeAmount 
    | FIX_ContAmtType_ExitChargePercent 
    | FIX_ContAmtType_FundBasedRenewalCommissionPercent 
    | FIX_ContAmtType_ProjectedFundValue 
    | FIX_ContAmtType_FundBasedRenewalCommissionOnOrder 
    | FIX_ContAmtType_FundBasedRenewalCommissionOnFund 
    | FIX_ContAmtType_NetSettlementAmount 
;;

type fix_corporateaction =
    | FIX_CorporateAction_ExDividend 
    | FIX_CorporateAction_ExDistribution 
    | FIX_CorporateAction_ExRights 
    | FIX_CorporateAction_New 
    | FIX_CorporateAction_ExInterest 
;;

type fix_coveredoruncovered =
    | FIX_CoveredOrUncovered_Covered 
    | FIX_CoveredOrUncovered_Uncovered 
;;

type fix_crossprioritization =
    | FIX_CrossPrioritization_FIXNone 
    | FIX_CrossPrioritization_BuySideIsPrioritized 
    | FIX_CrossPrioritization_SellSideIsPrioritized 
;;

type fix_crosstype =
    | FIX_CrossType_CrossAON 
    | FIX_CrossType_CrossIOC 
    | FIX_CrossType_CrossOneSide 
    | FIX_CrossType_CrossSamePrice 
;;

type fix_custordercapacity =
    | FIX_CustOrderCapacity_MemberTradingForTheirOwnAccount 
    | FIX_CustOrderCapacity_ClearingFirmTradingForItsProprietaryAccount 
    | FIX_CustOrderCapacity_MemberTradingForAnotherMember 
    | FIX_CustOrderCapacity_AllOther 
;;

type fix_cxlrejreason =
    | FIX_CxlRejReason_TooLateToCancel 
    | FIX_CxlRejReason_UnknownOrder 
    | FIX_CxlRejReason_BrokerCredit 
    | FIX_CxlRejReason_OrderAlreadyInPendingStatus 
    | FIX_CxlRejReason_UnableToProcessOrderMassCancelRequest 
    | FIX_CxlRejReason_OrigOrdModTime 
    | FIX_CxlRejReason_DuplicateClOrdID 
    | FIX_CxlRejReason_Other 
;;

type fix_cxlrejresponseto =
    | FIX_CxlRejResponseTo_OrderCancelRequest 
    | FIX_CxlRejResponseTo_OrderCancel 
;;

type fix_dkreason =
    | FIX_DKReason_UnknownSymbol 
    | FIX_DKReason_WrongSide 
    | FIX_DKReason_QuantityExceedsOrder 
    | FIX_DKReason_NoMatchingOrder 
    | FIX_DKReason_PriceExceedsLimit 
    | FIX_DKReason_CalculationDifference 
    | FIX_DKReason_Other 
;;

type fix_daybookinginst =
    | FIX_DayBookingInst_Auto 
    | FIX_DayBookingInst_SpeakWithOrderInitiatorBeforeBooking 
    | FIX_DayBookingInst_Accumulate 
;;

type fix_deletereason =
    | FIX_DeleteReason_Cancellation 
    | FIX_DeleteReason_Error 
;;

type fix_deliveryform =
    | FIX_DeliveryForm_BookEntry 
    | FIX_DeliveryForm_Bearer 
;;

type fix_deliverytype =
    | FIX_DeliveryType_VersusPayment 
    | FIX_DeliveryType_Free 
    | FIX_DeliveryType_TriParty 
    | FIX_DeliveryType_HoldInCustody 
;;

type fix_discretioninst =
    | FIX_DiscretionInst_RelatedToDisplayedPrice 
    | FIX_DiscretionInst_RelatedToMarketPrice 
    | FIX_DiscretionInst_RelatedToPrimaryPrice 
    | FIX_DiscretionInst_RelatedToLocalPrimaryPrice 
    | FIX_DiscretionInst_RelatedToMidpointPrice 
    | FIX_DiscretionInst_RelatedToLastTradePrice 
    | FIX_DiscretionInst_RelatedToVWAP 
;;

type fix_discretionlimittype =
    | FIX_DiscretionLimitType_OrBetter 
    | FIX_DiscretionLimitType_Strict 
    | FIX_DiscretionLimitType_OrWorse 
;;

type fix_discretionmovetype =
    | FIX_DiscretionMoveType_Floating 
    | FIX_DiscretionMoveType_Fixed 
;;

type fix_discretionoffsettype =
    | FIX_DiscretionOffsetType_Price 
    | FIX_DiscretionOffsetType_BasisPoints 
    | FIX_DiscretionOffsetType_Ticks 
    | FIX_DiscretionOffsetType_PriceTier 
;;

type fix_discretionrounddirection =
    | FIX_DiscretionRoundDirection_MoreAggressive 
    | FIX_DiscretionRoundDirection_MorePassive 
;;

type fix_discretionscope =
    | FIX_DiscretionScope_Local 
    | FIX_DiscretionScope_National 
    | FIX_DiscretionScope_Global 
    | FIX_DiscretionScope_NationalExcludingLocal 
;;

type fix_distribpaymentmethod =
    | FIX_DistribPaymentMethod_CREST 
    | FIX_DistribPaymentMethod_NSCC 
    | FIX_DistribPaymentMethod_Euroclear 
    | FIX_DistribPaymentMethod_Clearstream 
    | FIX_DistribPaymentMethod_Cheque 
    | FIX_DistribPaymentMethod_TelegraphicTransfer 
    | FIX_DistribPaymentMethod_FedWire 
    | FIX_DistribPaymentMethod_DirectCredit 
    | FIX_DistribPaymentMethod_ACHCredit 
    | FIX_DistribPaymentMethod_BPAY 
    | FIX_DistribPaymentMethod_HighValueClearingSystemHVACS 
    | FIX_DistribPaymentMethod_ReinvestInFund 
;;

type fix_dlvyinsttype =
    | FIX_DlvyInstType_Securities 
    | FIX_DlvyInstType_Cash 
;;

type fix_duetorelated =
    | FIX_DueToRelated_RelatedToSecurityHalt 
    | FIX_DueToRelated_NotRelatedToSecurityHalt 
;;

type fix_emailtype =
    | FIX_EmailType_New 
    | FIX_EmailType_Reply 
    | FIX_EmailType_AdminReply 
;;

type fix_eventtype =
    | FIX_EventType_Put 
    | FIX_EventType_Call 
    | FIX_EventType_Tender 
    | FIX_EventType_SinkingFundCall 
    | FIX_EventType_Other 
;;

type fix_exchangeforphysical =
    | FIX_ExchangeForPhysical_True 
    | FIX_ExchangeForPhysical_False 
;;

type fix_execinst =
    | FIX_ExecInst_NotHeld 
    | FIX_ExecInst_Work 
    | FIX_ExecInst_GoAlong 
    | FIX_ExecInst_OverTheDay 
    | FIX_ExecInst_Held 
    | FIX_ExecInst_ParticipateDoNotInitiate 
    | FIX_ExecInst_StrictScale 
    | FIX_ExecInst_TryToScale 
    | FIX_ExecInst_StayOnBidSide 
    | FIX_ExecInst_StayOnOfferSide 
    | FIX_ExecInst_NoCross 
    | FIX_ExecInst_OKToCross 
    | FIX_ExecInst_CallFirst 
    | FIX_ExecInst_PercentOfVolume 
    | FIX_ExecInst_DoNotIncrease 
    | FIX_ExecInst_DoNotReduce 
    | FIX_ExecInst_AllOrNone 
    | FIX_ExecInst_ReinstateOnSystemFailure 
    | FIX_ExecInst_InstitutionsOnly 
    | FIX_ExecInst_ReinstateOnTradingHalt 
    | FIX_ExecInst_CancelOnTradingHalt 
    | FIX_ExecInst_LastPeg 
    | FIX_ExecInst_MidPricePeg 
    | FIX_ExecInst_NonNegotiable 
    | FIX_ExecInst_OpeningPeg 
    | FIX_ExecInst_MarketPeg 
    | FIX_ExecInst_CancelOnSystemFailure 
    | FIX_ExecInst_PrimaryPeg 
    | FIX_ExecInst_Suspend 
    | FIX_ExecInst_CustomerDisplayInstruction 
    | FIX_ExecInst_Netting 
    | FIX_ExecInst_PegToVWAP 
    | FIX_ExecInst_TradeAlong 
    | FIX_ExecInst_TryToStop 
    | FIX_ExecInst_CancelIfNotBest 
    | FIX_ExecInst_TrailingStopPeg 
    | FIX_ExecInst_StrictLimit 
    | FIX_ExecInst_IgnorePriceValidityChecks 
    | FIX_ExecInst_PegToLimitPrice 
    | FIX_ExecInst_WorkToTargetStrategy 
;;

type fix_execpricetype =
    | FIX_ExecPriceType_BidPrice 
    | FIX_ExecPriceType_CreationPrice 
    | FIX_ExecPriceType_CreationPricePlusAdjustmentPercent 
    | FIX_ExecPriceType_CreationPricePlusAdjustmentAmount 
    | FIX_ExecPriceType_OfferPrice 
    | FIX_ExecPriceType_OfferPriceMinusAdjustmentPercent 
    | FIX_ExecPriceType_OfferPriceMinusAdjustmentAmount 
    | FIX_ExecPriceType_SinglePrice 
;;

type fix_execrestatementreason =
    | FIX_ExecRestatementReason_GTCorporateAction 
    | FIX_ExecRestatementReason_GTRenewal 
    | FIX_ExecRestatementReason_VerbalChange 
    | FIX_ExecRestatementReason_RepricingOfOrder 
    | FIX_ExecRestatementReason_BrokerOption 
    | FIX_ExecRestatementReason_PartialDeclineOfOrderQty 
    | FIX_ExecRestatementReason_CancelOnTradingHalt 
    | FIX_ExecRestatementReason_CancelOnSystemFailure 
    | FIX_ExecRestatementReason_Market 
    | FIX_ExecRestatementReason_Canceled 
    | FIX_ExecRestatementReason_WarehouseRecap 
    | FIX_ExecRestatementReason_Other 
;;

type fix_exectype =
    | FIX_ExecType_New 
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
    | FIX_ExecType_Trade 
    | FIX_ExecType_TradeCorrect 
    | FIX_ExecType_TradeCancel 
    | FIX_ExecType_OrderStatus 
;;

type fix_exercisemethod =
    | FIX_ExerciseMethod_Automatic 
    | FIX_ExerciseMethod_Manual 
;;

type fix_expirationcycle =
    | FIX_ExpirationCycle_ExpireOnTradingSessionClose 
    | FIX_ExpirationCycle_ExpireOnTradingSessionOpen 
;;

type fix_financialstatus =
    | FIX_FinancialStatus_Bankrupt 
    | FIX_FinancialStatus_PendingDelisting 
;;

type fix_forexreq =
    | FIX_ForexReq_ExecuteForexAfterSecurityTrade 
    | FIX_ForexReq_DoNotExecuteForexAfterSecurityTrade 
;;

type fix_fundrenewwaiv =
    | FIX_FundRenewWaiv_Yes 
    | FIX_FundRenewWaiv_No 
;;

type fix_gtbookinginst =
    | FIX_GTBookingInst_BookOutAllTradesOnDayOfExecution 
    | FIX_GTBookingInst_AccumulateUntilFilledOrExpired 
    | FIX_GTBookingInst_AccumulateUntilVerballlyNotifiedOtherwise 
;;

type fix_haltreason =
    | FIX_HaltReason_OrderImbalance 
    | FIX_HaltReason_EquipmentChangeover 
    | FIX_HaltReason_NewsPending 
    | FIX_HaltReason_NewsDissemination 
    | FIX_HaltReason_OrderInflux 
    | FIX_HaltReason_AdditionalInformation 
;;

type fix_handlinst =
    | FIX_HandlInst_AutomatedExecutionNoIntervention 
    | FIX_HandlInst_AutomatedExecutionInterventionOK 
    | FIX_HandlInst_ManualOrder 
;;

type fix_ioinaturalflag =
    | FIX_IOINaturalFlag_Natural 
    | FIX_IOINaturalFlag_NotNatural 
;;

type fix_ioiqltyind =
    | FIX_IOIQltyInd_Low 
    | FIX_IOIQltyInd_Medium 
    | FIX_IOIQltyInd_High 
;;

type fix_ioiqty =
    | FIX_IOIQty_Small 
    | FIX_IOIQty_Medium 
    | FIX_IOIQty_Large 
;;

type fix_ioiqualifier =
    | FIX_IOIQualifier_AllOrNone 
    | FIX_IOIQualifier_MarketOnClose 
    | FIX_IOIQualifier_AtTheClose 
    | FIX_IOIQualifier_VWAP 
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

type fix_ioitranstype =
    | FIX_IOITransType_New 
    | FIX_IOITransType_Cancel 
    | FIX_IOITransType_Replace 
;;

type fix_inviewofcommon =
    | FIX_InViewOfCommon_HaltWasDueToCommonStockBeingHalted 
    | FIX_InViewOfCommon_HaltWasNotRelatedToAHaltOfTheCommonStock 
;;

type fix_inctaxind =
    | FIX_IncTaxInd_Net 
    | FIX_IncTaxInd_Gross 
;;

type fix_instrattribtype =
    | FIX_InstrAttribType_Flat 
    | FIX_InstrAttribType_ZeroCoupon 
    | FIX_InstrAttribType_InterestBearing 
    | FIX_InstrAttribType_NoPeriodicPayments 
    | FIX_InstrAttribType_VariableRate 
    | FIX_InstrAttribType_LessFeeForPut 
    | FIX_InstrAttribType_SteppedCoupon 
    | FIX_InstrAttribType_CouponPeriod 
    | FIX_InstrAttribType_When 
    | FIX_InstrAttribType_OriginalIssueDiscount 
    | FIX_InstrAttribType_Callable 
    | FIX_InstrAttribType_EscrowedToMaturity 
    | FIX_InstrAttribType_EscrowedToRedemptionDate 
    | FIX_InstrAttribType_PreRefunded 
    | FIX_InstrAttribType_InDefault 
    | FIX_InstrAttribType_Unrated 
    | FIX_InstrAttribType_Taxable 
    | FIX_InstrAttribType_Indexed 
    | FIX_InstrAttribType_SubjectToAlternativeMinimumTax 
    | FIX_InstrAttribType_OriginalIssueDiscountPrice 
    | FIX_InstrAttribType_CallableBelowMaturityValue 
    | FIX_InstrAttribType_CallableWithoutNotice 
    | FIX_InstrAttribType_Text 
;;

type fix_lastcapacity =
    | FIX_LastCapacity_Agent 
    | FIX_LastCapacity_CrossAsAgent 
    | FIX_LastCapacity_CrossAsPrincipal 
    | FIX_LastCapacity_Principal 
;;

type fix_lastfragment =
    | FIX_LastFragment_LastMessage 
    | FIX_LastFragment_NotLastMessage 
;;

type fix_lastliquidityind =
    | FIX_LastLiquidityInd_AddedLiquidity 
    | FIX_LastLiquidityInd_RemovedLiquidity 
    | FIX_LastLiquidityInd_LiquidityRoutedOut 
;;

type fix_legswaptype =
    | FIX_LegSwapType_ParForPar 
    | FIX_LegSwapType_ModifiedDuration 
    | FIX_LegSwapType_Risk 
    | FIX_LegSwapType_Proceeds 
;;

type fix_legalconfirm =
    | FIX_LegalConfirm_LegalConfirm 
    | FIX_LegalConfirm_DoesNotConsituteALegalConfirm 
;;

type fix_liquidityindtype =
    | FIX_LiquidityIndType_FiveDayMovingAverage 
    | FIX_LiquidityIndType_TwentyDayMovingAverage 
    | FIX_LiquidityIndType_NormalMarketSize 
    | FIX_LiquidityIndType_Other 
;;

type fix_listexecinsttype =
    | FIX_ListExecInstType_Immediate 
    | FIX_ListExecInstType_WaitForInstruction 
    | FIX_ListExecInstType_SellDriven 
    | FIX_ListExecInstType_BuyDrivenCashTopUp 
    | FIX_ListExecInstType_BuyDrivenCashWithdraw 
;;

type fix_listorderstatus =
    | FIX_ListOrderStatus_InBiddingProcess 
    | FIX_ListOrderStatus_ReceivedForExecution 
    | FIX_ListOrderStatus_Executing 
    | FIX_ListOrderStatus_Cancelling 
    | FIX_ListOrderStatus_Alert 
    | FIX_ListOrderStatus_AllDone 
    | FIX_ListOrderStatus_Reject 
;;

type fix_liststatustype =
    | FIX_ListStatusType_Ack 
    | FIX_ListStatusType_Response 
    | FIX_ListStatusType_Timed 
    | FIX_ListStatusType_ExecStarted 
    | FIX_ListStatusType_AllDone 
    | FIX_ListStatusType_Alert 
;;

type fix_locatereqd =
    | FIX_LocateReqd_Yes 
    | FIX_LocateReqd_No 
;;

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
    | FIX_MDEntryType_Imbalance 
    | FIX_MDEntryType_TradeVolume 
    | FIX_MDEntryType_OpenInterest 
;;

type fix_mdimplicitdelete =
    | FIX_MDImplicitDelete_Yes 
    | FIX_MDImplicitDelete_No 
;;

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
    | FIX_MDReqRejReason_UnsupportedTradingSessionID 
    | FIX_MDReqRejReason_UnsupportedScope 
    | FIX_MDReqRejReason_UnsupportedOpenCloseSettleFlag 
    | FIX_MDReqRejReason_UnsupportedMDImplicitDelete 
;;

type fix_mdupdateaction =
    | FIX_MDUpdateAction_New 
    | FIX_MDUpdateAction_Change 
    | FIX_MDUpdateAction_Delete 
;;

type fix_mdupdatetype =
    | FIX_MDUpdateType_FullRefresh 
    | FIX_MDUpdateType_IncrementalRefresh 
;;

type fix_masscancelrejectreason =
    | FIX_MassCancelRejectReason_MassCancelNotSupported 
    | FIX_MassCancelRejectReason_InvalidOrUnknownSecurity 
    | FIX_MassCancelRejectReason_InvalidOrUnkownUnderlyingSecurity 
    | FIX_MassCancelRejectReason_InvalidOrUnknownProduct 
    | FIX_MassCancelRejectReason_InvalidOrUnknownCFICode 
    | FIX_MassCancelRejectReason_InvalidOrUnknownSecurityType 
    | FIX_MassCancelRejectReason_InvalidOrUnknownTradingSession 
    | FIX_MassCancelRejectReason_Other 
;;

type fix_masscancelrequesttype =
    | FIX_MassCancelRequestType_CancelOrdersForASecurity 
    | FIX_MassCancelRequestType_CancelOrdersForAnUnderlyingSecurity 
    | FIX_MassCancelRequestType_CancelOrdersForAProduct 
    | FIX_MassCancelRequestType_CancelOrdersForACFICode 
    | FIX_MassCancelRequestType_CancelOrdersForASecurityType 
    | FIX_MassCancelRequestType_CancelOrdersForATradingSession 
    | FIX_MassCancelRequestType_CancelAllOrders 
;;

type fix_masscancelresponse =
    | FIX_MassCancelResponse_CancelRequestRejected 
    | FIX_MassCancelResponse_CancelOrdersForASecurity 
    | FIX_MassCancelResponse_CancelOrdersForAnUnderlyingSecurity 
    | FIX_MassCancelResponse_CancelOrdersForAProduct 
    | FIX_MassCancelResponse_CancelOrdersForACFICode 
    | FIX_MassCancelResponse_CancelOrdersForASecurityType 
    | FIX_MassCancelResponse_CancelOrdersForATradingSession 
    | FIX_MassCancelResponse_CancelAllOrders 
;;

type fix_massstatusreqtype =
    | FIX_MassStatusReqType_StatusForOrdersForASecurity 
    | FIX_MassStatusReqType_StatusForOrdersForAnUnderlyingSecurity 
    | FIX_MassStatusReqType_StatusForOrdersForAProduct 
    | FIX_MassStatusReqType_StatusForOrdersForACFICode 
    | FIX_MassStatusReqType_StatusForOrdersForASecurityType 
    | FIX_MassStatusReqType_StatusForOrdersForATradingSession 
    | FIX_MassStatusReqType_StatusForAllOrders 
    | FIX_MassStatusReqType_StatusForOrdersForAPartyID 
;;

type fix_matchstatus =
    | FIX_MatchStatus_Compared 
    | FIX_MatchStatus_Uncompared 
    | FIX_MatchStatus_AdvisoryOrAlert 
;;

type fix_matchtype =
    | FIX_MatchType_ExactMatchPlus4BadgesExecTime 
    | FIX_MatchType_ExactMatchPlus4Badges 
    | FIX_MatchType_ExactMatchPlus2BadgesExecTime 
    | FIX_MatchType_ExactMatchPlus2Badges 
    | FIX_MatchType_ExactMatchPlusExecTime 
    | FIX_MatchType_StampedAdvisoriesOrSpecialistAccepts 
    | FIX_MatchType_A1ExactMatchSummarizedQuantity 
    | FIX_MatchType_A2ExactMatchSummarizedQuantity 
    | FIX_MatchType_A3ExactMatchSummarizedQuantity 
    | FIX_MatchType_A4ExactMatchSummarizedQuantity 
    | FIX_MatchType_A5ExactMatchSummarizedQuantity 
    | FIX_MatchType_ExactMatchMinusBadgesTimes 
    | FIX_MatchType_SummarizedMatchMinusBadgesTimes 
    | FIX_MatchType_OCSLockedIn 
    | FIX_MatchType_ACTAcceptedTrade 
    | FIX_MatchType_ACTDefaultTrade 
    | FIX_MatchType_ACTDefaultAfterM2 
    | FIX_MatchType_ACTM6Match 
;;

type fix_messageencoding =
    | FIX_MessageEncoding_ISO2022JP 
    | FIX_MessageEncoding_EUCJP 
    | FIX_MessageEncoding_ShiftJIS 
    | FIX_MessageEncoding_UTF8 
;;

type fix_miscfeebasis =
    | FIX_MiscFeeBasis_Absolute 
    | FIX_MiscFeeBasis_PerUnit 
    | FIX_MiscFeeBasis_Percentage 
;;

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
    | FIX_MiscFeeType_PerTransaction 
    | FIX_MiscFeeType_Conversion 
    | FIX_MiscFeeType_Agent 
;;

type fix_moneylaunderingstatus =
    | FIX_MoneyLaunderingStatus_Passed 
    | FIX_MoneyLaunderingStatus_NotChecked 
    | FIX_MoneyLaunderingStatus_ExemptBelowLimit 
    | FIX_MoneyLaunderingStatus_ExemptMoneyType 
    | FIX_MoneyLaunderingStatus_ExemptAuthorised 
;;

type fix_msgdirection =
    | FIX_MsgDirection_Send 
    | FIX_MsgDirection_Receive 
;;

type fix_msgtype =
    | FIX_MsgType_Heartbeat 
    | FIX_MsgType_TestRequest 
    | FIX_MsgType_ResendRequest 
    | FIX_MsgType_Reject 
    | FIX_MsgType_SequenceReset 
    | FIX_MsgType_Logout 
    | FIX_MsgType_IOI 
    | FIX_MsgType_Advertisement 
    | FIX_MsgType_ExecutionReport 
    | FIX_MsgType_OrderCancelReject 
    | FIX_MsgType_Logon 
    | FIX_MsgType_News 
    | FIX_MsgType_Email 
    | FIX_MsgType_NewOrderSingle 
    | FIX_MsgType_NewOrderList 
    | FIX_MsgType_OrderCancelRequest 
    | FIX_MsgType_OrderCancelReplaceRequest 
    | FIX_MsgType_OrderStatusRequest 
    | FIX_MsgType_AllocationInstruction 
    | FIX_MsgType_ListCancelRequest 
    | FIX_MsgType_ListExecute 
    | FIX_MsgType_ListStatusRequest 
    | FIX_MsgType_ListStatus 
    | FIX_MsgType_AllocationInstructionAck 
    | FIX_MsgType_DontKnowTrade 
    | FIX_MsgType_QuoteRequest 
    | FIX_MsgType_Quote 
    | FIX_MsgType_SettlementInstructions 
    | FIX_MsgType_MarketDataRequest 
    | FIX_MsgType_MarketDataSnapshotFullRefresh 
    | FIX_MsgType_MarketDataIncrementalRefresh 
    | FIX_MsgType_MarketDataRequestReject 
    | FIX_MsgType_QuoteCancel 
    | FIX_MsgType_QuoteStatusRequest 
    | FIX_MsgType_MassQuoteAcknowledgement 
    | FIX_MsgType_SecurityDefinitionRequest 
    | FIX_MsgType_SecurityDefinition 
    | FIX_MsgType_SecurityStatusRequest 
    | FIX_MsgType_SecurityStatus 
    | FIX_MsgType_TradingSessionStatusRequest 
    | FIX_MsgType_TradingSessionStatus 
    | FIX_MsgType_MassQuote 
    | FIX_MsgType_BusinessMessageReject 
    | FIX_MsgType_BidRequest 
    | FIX_MsgType_BidResponse 
    | FIX_MsgType_ListStrikePrice 
    | FIX_MsgType_XMLNonFIX 
    | FIX_MsgType_RegistrationInstructions 
    | FIX_MsgType_RegistrationInstructionsResponse 
    | FIX_MsgType_OrderMassCancelRequest 
    | FIX_MsgType_OrderMassCancelReport 
    | FIX_MsgType_NewOrderCross 
    | FIX_MsgType_CrossOrderCancelReplaceRequest 
    | FIX_MsgType_CrossOrderCancelRequest 
    | FIX_MsgType_SecurityTypeRequest 
    | FIX_MsgType_SecurityTypes 
    | FIX_MsgType_SecurityListRequest 
    | FIX_MsgType_SecurityList 
    | FIX_MsgType_DerivativeSecurityListRequest 
    | FIX_MsgType_DerivativeSecurityList 
    | FIX_MsgType_NewOrderMultileg 
    | FIX_MsgType_MultilegOrderCancelReplace 
    | FIX_MsgType_TradeCaptureReportRequest 
    | FIX_MsgType_TradeCaptureReport 
    | FIX_MsgType_OrderMassStatusRequest 
    | FIX_MsgType_QuoteRequestReject 
    | FIX_MsgType_RFQRequest 
    | FIX_MsgType_QuoteStatusReport 
    | FIX_MsgType_QuoteResponse 
    | FIX_MsgType_Confirmation 
    | FIX_MsgType_PositionMaintenanceRequest 
    | FIX_MsgType_PositionMaintenanceReport 
    | FIX_MsgType_RequestForPositions 
    | FIX_MsgType_RequestForPositionsAck 
    | FIX_MsgType_PositionReport 
    | FIX_MsgType_TradeCaptureReportRequestAck 
    | FIX_MsgType_TradeCaptureReportAck 
    | FIX_MsgType_AllocationReport 
    | FIX_MsgType_AllocationReportAck 
    | FIX_MsgType_ConfirmationAck 
    | FIX_MsgType_SettlementInstructionRequest 
    | FIX_MsgType_AssignmentReport 
    | FIX_MsgType_CollateralRequest 
    | FIX_MsgType_CollateralAssignment 
    | FIX_MsgType_CollateralResponse 
    | FIX_MsgType_CollateralReport 
    | FIX_MsgType_CollateralInquiry 
    | FIX_MsgType_NetworkCounterpartySystemStatusRequest 
    | FIX_MsgType_NetworkCounterpartySystemStatusResponse 
    | FIX_MsgType_UserRequest 
    | FIX_MsgType_UserResponse 
    | FIX_MsgType_CollateralInquiryAck 
    | FIX_MsgType_ConfirmationRequest 
;;

type fix_multilegreportingtype =
    | FIX_MultiLegReportingType_SingleSecurity 
    | FIX_MultiLegReportingType_IndividualLegOfAMultiLegSecurity 
    | FIX_MultiLegReportingType_MultiLegSecurity 
;;

type fix_multilegrpttypereq =
    | FIX_MultiLegRptTypeReq_ReportByMulitlegSecurityOnly 
    | FIX_MultiLegRptTypeReq_ReportByMultilegSecurityAndInstrumentLegs 
    | FIX_MultiLegRptTypeReq_ReportByInstrumentLegsOnly 
;;

type fix_netgrossind =
    | FIX_NetGrossInd_Net 
    | FIX_NetGrossInd_Gross 
;;

type fix_networkrequesttype =
    | FIX_NetworkRequestType_Snapshot 
    | FIX_NetworkRequestType_Subscribe 
    | FIX_NetworkRequestType_StopSubscribing 
    | FIX_NetworkRequestType_LevelOfDetail 
;;

type fix_networkstatusresponsetype =
    | FIX_NetworkStatusResponseType_Full 
    | FIX_NetworkStatusResponseType_IncrementalUpdate 
;;

type fix_nosides =
    | FIX_NoSides_OneSide 
    | FIX_NoSides_BothSides 
;;

type fix_notifybrokerofcredit =
    | FIX_NotifyBrokerOfCredit_DetailsShouldBeCommunicated 
    | FIX_NotifyBrokerOfCredit_DetailsShouldNotBeCommunicated 
;;

type fix_oddlot =
    | FIX_OddLot_TreatAsOddLot 
    | FIX_OddLot_TreatAsRoundLot 
;;

type fix_openclosesettlflag =
    | FIX_OpenCloseSettlFlag_DailyOpen 
    | FIX_OpenCloseSettlFlag_SessionOpen 
    | FIX_OpenCloseSettlFlag_DeliverySettlementEntry 
    | FIX_OpenCloseSettlFlag_ExpectedEntry 
    | FIX_OpenCloseSettlFlag_EntryFromPreviousBusinessDay 
    | FIX_OpenCloseSettlFlag_TheoreticalPriceValue 
;;

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
    | FIX_OrdRejReason_TradeAlongRequired 
    | FIX_OrdRejReason_InvalidInvestorID 
    | FIX_OrdRejReason_UnsupportedOrderCharacteristic 
    | FIX_OrdRejReason_IncorrectQuantity 
    | FIX_OrdRejReason_IncorrectAllocatedQuantity 
    | FIX_OrdRejReason_UnknownAccount 
    | FIX_OrdRejReason_Other 
;;

type fix_ordstatus =
    | FIX_OrdStatus_New 
    | FIX_OrdStatus_PartiallyFilled 
    | FIX_OrdStatus_Filled 
    | FIX_OrdStatus_DoneForDay 
    | FIX_OrdStatus_Canceled 
    | FIX_OrdStatus_PendingCancel 
    | FIX_OrdStatus_Stopped 
    | FIX_OrdStatus_Rejected 
    | FIX_OrdStatus_Suspended 
    | FIX_OrdStatus_PendingNew 
    | FIX_OrdStatus_Calculated 
    | FIX_OrdStatus_Expired 
    | FIX_OrdStatus_AcceptedForBidding 
    | FIX_OrdStatus_PendingReplace 
    | FIX_OrdStatus_Replaced 
;;

type fix_ordtype =
    | FIX_OrdType_Market 
    | FIX_OrdType_Limit 
    | FIX_OrdType_Stop 
    | FIX_OrdType_StopLimit 
    | FIX_OrdType_WithOrWithout 
    | FIX_OrdType_LimitOrBetter 
    | FIX_OrdType_LimitWithOrWithout 
    | FIX_OrdType_OnBasis 
    | FIX_OrdType_PreviouslyQuoted 
    | FIX_OrdType_PreviouslyIndicated 
    | FIX_OrdType_ForexSwap 
    | FIX_OrdType_Funari 
    | FIX_OrdType_MarketIfTouched 
    | FIX_OrdType_MarketWithLeftOverAsLimit 
    | FIX_OrdType_PreviousFundValuationPoint 
    | FIX_OrdType_NextFundValuationPoint 
    | FIX_OrdType_Pegged 
;;

type fix_ordercapacity =
    | FIX_OrderCapacity_Agency 
    | FIX_OrderCapacity_Proprietary 
    | FIX_OrderCapacity_Individual 
    | FIX_OrderCapacity_Principal 
    | FIX_OrderCapacity_RisklessPrincipal 
    | FIX_OrderCapacity_AgentForOtherMember 
;;

type fix_orderrestrictions =
    | FIX_OrderRestrictions_ProgramTrade 
    | FIX_OrderRestrictions_IndexArbitrage 
    | FIX_OrderRestrictions_NonIndexArbitrage 
    | FIX_OrderRestrictions_CompetingMarketMaker 
    | FIX_OrderRestrictions_ActingAsMarketMakerOrSpecialistInSecurity 
    | FIX_OrderRestrictions_ActingAsMarketMakerOrSpecialistInUnderlying 
    | FIX_OrderRestrictions_ForeignEntity 
    | FIX_OrderRestrictions_ExternalMarketParticipant 
    | FIX_OrderRestrictions_ExternalInterConnectedMarketLinkage 
    | FIX_OrderRestrictions_RisklessArbitrage 
;;

type fix_ownertype =
    | FIX_OwnerType_IndividualInvestor 
    | FIX_OwnerType_PublicCompany 
    | FIX_OwnerType_PrivateCompany 
    | FIX_OwnerType_IndividualTrustee 
    | FIX_OwnerType_CompanyTrustee 
    | FIX_OwnerType_PensionPlan 
    | FIX_OwnerType_CustodianUnderGiftsToMinorsAct 
    | FIX_OwnerType_Trusts 
    | FIX_OwnerType_Fiduciaries 
    | FIX_OwnerType_NetworkingSubAccount 
    | FIX_OwnerType_NonProfitOrganization 
    | FIX_OwnerType_CorporateBody 
    | FIX_OwnerType_Nominee 
;;

type fix_ownershiptype =
    | FIX_OwnershipType_JointInvestors 
    | FIX_OwnershipType_TenantsInCommon 
    | FIX_OwnershipType_JointTrustees 
;;

type fix_partyidsource =
    | FIX_PartyIDSource_BIC 
    | FIX_PartyIDSource_GeneralIdentifier 
    | FIX_PartyIDSource_Proprietary 
    | FIX_PartyIDSource_ISOCountryCode 
    | FIX_PartyIDSource_SettlementEntityLocation 
    | FIX_PartyIDSource_MIC 
    | FIX_PartyIDSource_CSDParticipant 
    | FIX_PartyIDSource_KoreanInvestorID 
    | FIX_PartyIDSource_TaiwaneseForeignInvestorID 
    | FIX_PartyIDSource_TaiwaneseTradingAcct 
    | FIX_PartyIDSource_MalaysianCentralDepository 
    | FIX_PartyIDSource_ChineseInvestorID 
    | FIX_PartyIDSource_UKNationalInsuranceOrPensionNumber 
    | FIX_PartyIDSource_USSocialSecurityNumber 
    | FIX_PartyIDSource_USEmployerOrTaxIDNumber 
    | FIX_PartyIDSource_AustralianBusinessNumber 
    | FIX_PartyIDSource_AustralianTaxFileNumber 
    | FIX_PartyIDSource_ISITCAcronym 
;;

type fix_partyrole =
    | FIX_PartyRole_ExecutingFirm 
    | FIX_PartyRole_BrokerOfCredit 
    | FIX_PartyRole_ClientID 
    | FIX_PartyRole_ClearingFirm 
    | FIX_PartyRole_InvestorID 
    | FIX_PartyRole_IntroducingFirm 
    | FIX_PartyRole_EnteringFirm 
    | FIX_PartyRole_Locate 
    | FIX_PartyRole_FundManagerClientID 
    | FIX_PartyRole_SettlementLocation 
    | FIX_PartyRole_OrderOriginationTrader 
    | FIX_PartyRole_ExecutingTrader 
    | FIX_PartyRole_OrderOriginationFirm 
    | FIX_PartyRole_GiveupClearingFirm 
    | FIX_PartyRole_CorrespondantClearingFirm 
    | FIX_PartyRole_ExecutingSystem 
    | FIX_PartyRole_ContraFirm 
    | FIX_PartyRole_ContraClearingFirm 
    | FIX_PartyRole_SponsoringFirm 
    | FIX_PartyRole_UnderlyingContraFirm 
    | FIX_PartyRole_ClearingOrganization 
    | FIX_PartyRole_Exchange 
    | FIX_PartyRole_CustomerAccount 
    | FIX_PartyRole_CorrespondentClearingOrganization 
    | FIX_PartyRole_CorrespondentBroker 
    | FIX_PartyRole_Buyer 
    | FIX_PartyRole_Custodian 
    | FIX_PartyRole_Intermediary 
    | FIX_PartyRole_Agent 
    | FIX_PartyRole_SubCustodian 
    | FIX_PartyRole_Beneficiary 
    | FIX_PartyRole_InterestedParty 
    | FIX_PartyRole_RegulatoryBody 
    | FIX_PartyRole_LiquidityProvider 
    | FIX_PartyRole_EnteringTrader 
    | FIX_PartyRole_ContraTrader 
    | FIX_PartyRole_PositionAccount 
;;

type fix_partysubidtype =
    | FIX_PartySubIDType_Firm 
    | FIX_PartySubIDType_Person 
    | FIX_PartySubIDType_System 
    | FIX_PartySubIDType_Application 
    | FIX_PartySubIDType_FullLegalNameOfFirm 
    | FIX_PartySubIDType_PostalAddress 
    | FIX_PartySubIDType_PhoneNumber 
    | FIX_PartySubIDType_EmailAddress 
    | FIX_PartySubIDType_ContactName 
    | FIX_PartySubIDType_SecuritiesAccountNumber 
    | FIX_PartySubIDType_RegistrationNumber 
    | FIX_PartySubIDType_RegisteredAddressForConfirmation 
    | FIX_PartySubIDType_RegulatoryStatus 
    | FIX_PartySubIDType_RegistrationName 
    | FIX_PartySubIDType_CashAccountNumber 
    | FIX_PartySubIDType_BIC 
    | FIX_PartySubIDType_CSDParticipantMemberCode 
    | FIX_PartySubIDType_RegisteredAddress 
    | FIX_PartySubIDType_FundAccountName 
    | FIX_PartySubIDType_TelexNumber 
    | FIX_PartySubIDType_FaxNumber 
    | FIX_PartySubIDType_SecuritiesAccountName 
    | FIX_PartySubIDType_CashAccountName 
    | FIX_PartySubIDType_Department 
    | FIX_PartySubIDType_LocationDesk 
    | FIX_PartySubIDType_PositionAccountType 
;;

type fix_paymentmethod =
    | FIX_PaymentMethod_CREST 
    | FIX_PaymentMethod_NSCC 
    | FIX_PaymentMethod_Euroclear 
    | FIX_PaymentMethod_Clearstream 
    | FIX_PaymentMethod_Cheque 
    | FIX_PaymentMethod_TelegraphicTransfer 
    | FIX_PaymentMethod_FedWire 
    | FIX_PaymentMethod_DebitCard 
    | FIX_PaymentMethod_DirectDebit 
    | FIX_PaymentMethod_DirectCredit 
    | FIX_PaymentMethod_CreditCard 
    | FIX_PaymentMethod_ACHDebit 
    | FIX_PaymentMethod_ACHCredit 
    | FIX_PaymentMethod_BPAY 
    | FIX_PaymentMethod_HighValueClearingSystem 
;;

type fix_peglimittype =
    | FIX_PegLimitType_OrBetter 
    | FIX_PegLimitType_Strict 
    | FIX_PegLimitType_OrWorse 
;;

type fix_pegmovetype =
    | FIX_PegMoveType_Floating 
    | FIX_PegMoveType_Fixed 
;;

type fix_pegoffsettype =
    | FIX_PegOffsetType_Price 
    | FIX_PegOffsetType_BasisPoints 
    | FIX_PegOffsetType_Ticks 
    | FIX_PegOffsetType_PriceTier 
;;

type fix_pegrounddirection =
    | FIX_PegRoundDirection_MoreAggressive 
    | FIX_PegRoundDirection_MorePassive 
;;

type fix_pegscope =
    | FIX_PegScope_Local 
    | FIX_PegScope_National 
    | FIX_PegScope_Global 
    | FIX_PegScope_NationalExcludingLocal 
;;

type fix_posamttype =
    | FIX_PosAmtType_FinalMarkToMarketAmount 
    | FIX_PosAmtType_IncrementalMarkToMarketAmount 
    | FIX_PosAmtType_TradeVariationAmount 
    | FIX_PosAmtType_StartOfDayMarkToMarketAmount 
    | FIX_PosAmtType_PremiumAmount 
    | FIX_PosAmtType_CashResidualAmount 
    | FIX_PosAmtType_CashAmount 
    | FIX_PosAmtType_ValueAdjustedAmount 
;;

type fix_posmaintaction =
    | FIX_PosMaintAction_New 
    | FIX_PosMaintAction_Replace 
    | FIX_PosMaintAction_Cancel 
;;

type fix_posmaintresult =
    | FIX_PosMaintResult_SuccessfulCompletion 
    | FIX_PosMaintResult_Rejected 
    | FIX_PosMaintResult_Other 
;;

type fix_posmaintstatus =
    | FIX_PosMaintStatus_Accepted 
    | FIX_PosMaintStatus_AcceptedWithWarnings 
    | FIX_PosMaintStatus_Rejected 
    | FIX_PosMaintStatus_Completed 
    | FIX_PosMaintStatus_CompletedWithWarnings 
;;

type fix_posqtystatus =
    | FIX_PosQtyStatus_Submitted 
    | FIX_PosQtyStatus_Accepted 
    | FIX_PosQtyStatus_Rejected 
;;

type fix_posreqresult =
    | FIX_PosReqResult_ValidRequest 
    | FIX_PosReqResult_InvalidOrUnsupportedRequest 
    | FIX_PosReqResult_NoPositionsFoundThatMatchCriteria 
    | FIX_PosReqResult_NotAuthorizedToRequestPositions 
    | FIX_PosReqResult_RequestForPositionNotSupported 
    | FIX_PosReqResult_Other 
;;

type fix_posreqstatus =
    | FIX_PosReqStatus_Completed 
    | FIX_PosReqStatus_CompletedWithWarnings 
    | FIX_PosReqStatus_Rejected 
;;

type fix_posreqtype =
    | FIX_PosReqType_Positions 
    | FIX_PosReqType_Trades 
    | FIX_PosReqType_Exercises 
    | FIX_PosReqType_Assignments 
;;

type fix_postranstype =
    | FIX_PosTransType_Exercise 
    | FIX_PosTransType_DoNotExercise 
    | FIX_PosTransType_PositionAdjustment 
    | FIX_PosTransType_PositionChangeSubmission 
    | FIX_PosTransType_Pledge 
;;

type fix_postype =
    | FIX_PosType_TransactionQuantity 
    | FIX_PosType_IntraSpreadQty 
    | FIX_PosType_InterSpreadQty 
    | FIX_PosType_EndOfDayQty 
    | FIX_PosType_StartOfDayQty 
    | FIX_PosType_OptionExerciseQty 
    | FIX_PosType_OptionAssignment 
    | FIX_PosType_TransactionFromExercise 
    | FIX_PosType_TransactionFromAssignment 
    | FIX_PosType_PitTradeQty 
    | FIX_PosType_TransferTradeQty 
    | FIX_PosType_ElectronicTradeQty 
    | FIX_PosType_AllocationTradeQty 
    | FIX_PosType_AdjustmentQty 
    | FIX_PosType_AsOfTradeQty 
    | FIX_PosType_DeliveryQty 
    | FIX_PosType_TotalTransactionQty 
    | FIX_PosType_CrossMarginQty 
    | FIX_PosType_IntegralSplit 
;;

type fix_positioneffect =
    | FIX_PositionEffect_Open 
    | FIX_PositionEffect_Close 
    | FIX_PositionEffect_Rolled 
    | FIX_PositionEffect_FIFO 
;;

type fix_possdupflag =
    | FIX_PossDupFlag_PossibleDuplicate 
    | FIX_PossDupFlag_OriginalTransmission 
;;

type fix_possresend =
    | FIX_PossResend_PossibleResend 
    | FIX_PossResend_OriginalTransmission 
;;

type fix_preallocmethod =
    | FIX_PreallocMethod_ProRata 
    | FIX_PreallocMethod_DoNotProRata 
;;

type fix_previouslyreported =
    | FIX_PreviouslyReported_PerviouslyReportedToCounterparty 
    | FIX_PreviouslyReported_NotReportedToCounterparty 
;;

type fix_pricetype =
    | FIX_PriceType_Percentage 
    | FIX_PriceType_PerUnit 
    | FIX_PriceType_FixedAmount 
    | FIX_PriceType_Discount 
    | FIX_PriceType_Premium 
    | FIX_PriceType_Spread 
    | FIX_PriceType_TEDPrice 
    | FIX_PriceType_TEDYield 
    | FIX_PriceType_Yield 
    | FIX_PriceType_FixedCabinetTradePrice 
    | FIX_PriceType_VariableCabinetTradePrice 
;;

type fix_priorityindicator =
    | FIX_PriorityIndicator_PriorityUnchanged 
    | FIX_PriorityIndicator_LostPriorityAsResultOfOrderChange 
;;

type fix_processcode =
    | FIX_ProcessCode_Regular 
    | FIX_ProcessCode_SoftDollar 
    | FIX_ProcessCode_StepIn 
    | FIX_ProcessCode_StepOut 
    | FIX_ProcessCode_SoftDollarStepIn 
    | FIX_ProcessCode_SoftDollarStepOut 
    | FIX_ProcessCode_PlanSponsor 
;;

type fix_product =
    | FIX_Product_AGENCY 
    | FIX_Product_COMMODITY 
    | FIX_Product_CORPORATE 
    | FIX_Product_CURRENCY 
    | FIX_Product_EQUITY 
    | FIX_Product_GOVERNMENT 
    | FIX_Product_INDEX 
    | FIX_Product_LOAN 
    | FIX_Product_MONEYMARKET 
    | FIX_Product_MORTGAGE 
    | FIX_Product_MUNICIPAL 
    | FIX_Product_OTHER 
    | FIX_Product_FINANCING 
;;

type fix_progrptreqs =
    | FIX_ProgRptReqs_BuySideRequests 
    | FIX_ProgRptReqs_SellSideSends 
    | FIX_ProgRptReqs_RealTimeExecutionReports 
;;

type fix_publishtrdindicator =
    | FIX_PublishTrdIndicator_ReportTrade 
    | FIX_PublishTrdIndicator_DoNotReportTrade 
;;

type fix_putorcall =
    | FIX_PutOrCall_Put 
    | FIX_PutOrCall_Call 
;;

type fix_qtytype =
    | FIX_QtyType_Units 
    | FIX_QtyType_Contracts 
;;

type fix_quotecanceltype =
    | FIX_QuoteCancelType_CancelForOneOrMoreSecurities 
    | FIX_QuoteCancelType_CancelForSecurityType 
    | FIX_QuoteCancelType_CancelForUnderlyingSecurity 
    | FIX_QuoteCancelType_CancelAllQuotes 
;;

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

type fix_quotepricetype =
    | FIX_QuotePriceType_Percent 
    | FIX_QuotePriceType_PerShare 
    | FIX_QuotePriceType_FixedAmount 
    | FIX_QuotePriceType_Discount 
    | FIX_QuotePriceType_Premium 
    | FIX_QuotePriceType_Spread 
    | FIX_QuotePriceType_TEDPrice 
    | FIX_QuotePriceType_TEDYield 
    | FIX_QuotePriceType_YieldSpread 
    | FIX_QuotePriceType_Yield 
;;

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
    | FIX_QuoteRejectReason_Other 
;;

type fix_quoterequestrejectreason =
    | FIX_QuoteRequestRejectReason_UnknownSymbol 
    | FIX_QuoteRequestRejectReason_Exchange 
    | FIX_QuoteRequestRejectReason_QuoteRequestExceedsLimit 
    | FIX_QuoteRequestRejectReason_TooLateToEnter 
    | FIX_QuoteRequestRejectReason_InvalidPrice 
    | FIX_QuoteRequestRejectReason_NotAuthorizedToRequestQuote 
    | FIX_QuoteRequestRejectReason_NoMatchForInquiry 
    | FIX_QuoteRequestRejectReason_NoMarketForInstrument 
    | FIX_QuoteRequestRejectReason_NoInventory 
    | FIX_QuoteRequestRejectReason_Pass 
    | FIX_QuoteRequestRejectReason_Other 
;;

type fix_quoterequesttype =
    | FIX_QuoteRequestType_Manual 
    | FIX_QuoteRequestType_Automatic 
;;

type fix_quoteresptype =
    | FIX_QuoteRespType_Hit 
    | FIX_QuoteRespType_Counter 
    | FIX_QuoteRespType_Expired 
    | FIX_QuoteRespType_Cover 
    | FIX_QuoteRespType_DoneAway 
    | FIX_QuoteRespType_Pass 
;;

type fix_quoteresponselevel =
    | FIX_QuoteResponseLevel_NoAcknowledgement 
    | FIX_QuoteResponseLevel_AcknowledgeOnlyNegativeOrErroneousQuotes 
    | FIX_QuoteResponseLevel_AcknowledgeEachQuoteMessage 
;;

type fix_quotestatus =
    | FIX_QuoteStatus_Accepted 
    | FIX_QuoteStatus_CancelForSymbol 
    | FIX_QuoteStatus_CanceledForSecurityType 
    | FIX_QuoteStatus_CanceledForUnderlying 
    | FIX_QuoteStatus_CanceledAll 
    | FIX_QuoteStatus_Rejected 
    | FIX_QuoteStatus_RemovedFromMarket 
    | FIX_QuoteStatus_Expired 
    | FIX_QuoteStatus_Query 
    | FIX_QuoteStatus_QuoteNotFound 
    | FIX_QuoteStatus_Pending 
    | FIX_QuoteStatus_Pass 
    | FIX_QuoteStatus_LockedMarketWarning 
    | FIX_QuoteStatus_CrossMarketWarning 
    | FIX_QuoteStatus_CanceledDueToLockMarket 
    | FIX_QuoteStatus_CanceledDueToCrossMarket 
;;

type fix_quotetype =
    | FIX_QuoteType_Indicative 
    | FIX_QuoteType_Tradeable 
    | FIX_QuoteType_RestrictedTradeable 
    | FIX_QuoteType_Counter 
;;

type fix_registrejreasoncode =
    | FIX_RegistRejReasonCode_InvalidAccountType 
    | FIX_RegistRejReasonCode_InvalidTaxExemptType 
    | FIX_RegistRejReasonCode_InvalidOwnershipType 
    | FIX_RegistRejReasonCode_NoRegDetails 
    | FIX_RegistRejReasonCode_InvalidRegSeqNo 
    | FIX_RegistRejReasonCode_InvalidRegDetails 
    | FIX_RegistRejReasonCode_InvalidMailingDetails 
    | FIX_RegistRejReasonCode_InvalidMailingInstructions 
    | FIX_RegistRejReasonCode_InvalidInvestorID 
    | FIX_RegistRejReasonCode_InvalidInvestorIDSource 
    | FIX_RegistRejReasonCode_InvalidDateOfBirth 
    | FIX_RegistRejReasonCode_InvalidCountry 
    | FIX_RegistRejReasonCode_InvalidDistribInstns 
    | FIX_RegistRejReasonCode_InvalidPercentage 
    | FIX_RegistRejReasonCode_InvalidPaymentMethod 
    | FIX_RegistRejReasonCode_InvalidAccountName 
    | FIX_RegistRejReasonCode_InvalidAgentCode 
    | FIX_RegistRejReasonCode_InvalidAccountNum 
    | FIX_RegistRejReasonCode_Other 
;;

type fix_registstatus =
    | FIX_RegistStatus_Accepted 
    | FIX_RegistStatus_Rejected 
    | FIX_RegistStatus_Held 
    | FIX_RegistStatus_Reminder 
;;

type fix_registtranstype =
    | FIX_RegistTransType_New 
    | FIX_RegistTransType_Replace 
    | FIX_RegistTransType_Cancel 
;;

type fix_reporttoexch =
    | FIX_ReportToExch_ReceiverReports 
    | FIX_ReportToExch_SenderReports 
;;

type fix_resetseqnumflag =
    | FIX_ResetSeqNumFlag_Yes 
    | FIX_ResetSeqNumFlag_No 
;;

type fix_responsetransporttype =
    | FIX_ResponseTransportType_Inband 
    | FIX_ResponseTransportType_OutOfBand 
;;

type fix_roundingdirection =
    | FIX_RoundingDirection_RoundToNearest 
    | FIX_RoundingDirection_RoundDown 
    | FIX_RoundingDirection_RoundUp 
;;

type fix_routingtype =
    | FIX_RoutingType_TargetFirm 
    | FIX_RoutingType_TargetList 
    | FIX_RoutingType_BlockFirm 
    | FIX_RoutingType_BlockList 
;;

type fix_scope =
    | FIX_Scope_LocalMarket 
    | FIX_Scope_National 
    | FIX_Scope_Global 
;;

type fix_securityidsource =
    | FIX_SecurityIDSource_CUSIP 
    | FIX_SecurityIDSource_SEDOL 
    | FIX_SecurityIDSource_QUIK 
    | FIX_SecurityIDSource_ISINNumber 
    | FIX_SecurityIDSource_RICCode 
    | FIX_SecurityIDSource_ISOCurrencyCode 
    | FIX_SecurityIDSource_ISOCountryCode 
    | FIX_SecurityIDSource_ExchangeSymbol 
    | FIX_SecurityIDSource_ConsolidatedTapeAssociation 
    | FIX_SecurityIDSource_BloombergSymbol 
    | FIX_SecurityIDSource_Wertpapier 
    | FIX_SecurityIDSource_Dutch 
    | FIX_SecurityIDSource_Valoren 
    | FIX_SecurityIDSource_Sicovam 
    | FIX_SecurityIDSource_Belgian 
    | FIX_SecurityIDSource_Common 
    | FIX_SecurityIDSource_ClearingHouse 
    | FIX_SecurityIDSource_ISDAFpMLSpecification 
    | FIX_SecurityIDSource_OptionPriceReportingAuthority 
;;

type fix_securitylistrequesttype =
    | FIX_SecurityListRequestType_Symbol 
    | FIX_SecurityListRequestType_SecurityTypeAnd 
    | FIX_SecurityListRequestType_Product 
    | FIX_SecurityListRequestType_TradingSessionID 
    | FIX_SecurityListRequestType_AllSecurities 
;;

type fix_securityrequestresult =
    | FIX_SecurityRequestResult_ValidRequest 
    | FIX_SecurityRequestResult_InvalidOrUnsupportedRequest 
    | FIX_SecurityRequestResult_NoInstrumentsFound 
    | FIX_SecurityRequestResult_NotAuthorizedToRetrieveInstrumentData 
    | FIX_SecurityRequestResult_InstrumentDataTemporarilyUnavailable 
    | FIX_SecurityRequestResult_RequestForInstrumentDataNotSupported 
;;

type fix_securityrequesttype =
    | FIX_SecurityRequestType_RequestSecurityIdentityAndSpecifications 
    | FIX_SecurityRequestType_RequestSecurityIdentityForSpecifications 
    | FIX_SecurityRequestType_RequestListSecurityTypes 
    | FIX_SecurityRequestType_RequestListSecurities 
;;

type fix_securityresponsetype =
    | FIX_SecurityResponseType_AcceptAsIs 
    | FIX_SecurityResponseType_AcceptWithRevisions 
    | FIX_SecurityResponseType_RejectSecurityProposal 
    | FIX_SecurityResponseType_CannotMatchSelectionCriteria 
;;

type fix_securitytradingstatus =
    | FIX_SecurityTradingStatus_OpeningDelay 
    | FIX_SecurityTradingStatus_TradingHalt 
    | FIX_SecurityTradingStatus_Resume 
    | FIX_SecurityTradingStatus_NoOpen 
    | FIX_SecurityTradingStatus_PriceIndication 
    | FIX_SecurityTradingStatus_TradingRangeIndication 
    | FIX_SecurityTradingStatus_MarketImbalanceBuy 
    | FIX_SecurityTradingStatus_MarketImbalanceSell 
    | FIX_SecurityTradingStatus_MarketOnCloseImbalanceBuy 
    | FIX_SecurityTradingStatus_MarketOnCloseImbalanceSell 
    | FIX_SecurityTradingStatus_NoMarketImbalance 
    | FIX_SecurityTradingStatus_NoMarketOnCloseImbalance 
    | FIX_SecurityTradingStatus_ITSPreOpening 
    | FIX_SecurityTradingStatus_NewPriceIndication 
    | FIX_SecurityTradingStatus_TradeDisseminationTime 
    | FIX_SecurityTradingStatus_ReadyToTrade 
    | FIX_SecurityTradingStatus_NotAvailableForTrading 
    | FIX_SecurityTradingStatus_NotTradedOnThisMarket 
    | FIX_SecurityTradingStatus_UnknownOrInvalid 
    | FIX_SecurityTradingStatus_PreOpen 
    | FIX_SecurityTradingStatus_OpeningRotation 
    | FIX_SecurityTradingStatus_FastMarket 
;;

type fix_securitytype =
    | FIX_SecurityType_Future 
    | FIX_SecurityType_Option 
    | FIX_SecurityType_EuroSupranationalCoupons 
    | FIX_SecurityType_FederalAgencyCoupon 
    | FIX_SecurityType_FederalAgencyDiscountNote 
    | FIX_SecurityType_PrivateExportFunding 
    | FIX_SecurityType_USDSupranationalCoupons 
    | FIX_SecurityType_CorporateBond 
    | FIX_SecurityType_CorporatePrivatePlacement 
    | FIX_SecurityType_ConvertibleBond 
    | FIX_SecurityType_DualCurrency 
    | FIX_SecurityType_EuroCorporateBond 
    | FIX_SecurityType_IndexedLinked 
    | FIX_SecurityType_StructuredNotes 
    | FIX_SecurityType_YankeeCorporateBond 
    | FIX_SecurityType_ForeignExchangeContract 
    | FIX_SecurityType_CommonStock 
    | FIX_SecurityType_PreferredStock 
    | FIX_SecurityType_BradyBond 
    | FIX_SecurityType_EuroSovereigns 
    | FIX_SecurityType_USTreasuryBond 
    | FIX_SecurityType_InterestStripFromAnyBondOrNote 
    | FIX_SecurityType_TreasuryInflationProtectedSecurities 
    | FIX_SecurityType_PrincipalStripOfACallableBondOrNote 
    | FIX_SecurityType_PrincipalStripFromANonCallableBondOrNote 
    | FIX_SecurityType_USTreasuryNoteOld 
    | FIX_SecurityType_USTreasuryBillOld 
    | FIX_SecurityType_USTreasuryNote 
    | FIX_SecurityType_USTreasuryBill 
    | FIX_SecurityType_Repurchase 
    | FIX_SecurityType_Forward 
    | FIX_SecurityType_BuySellback 
    | FIX_SecurityType_SecuritiesLoan 
    | FIX_SecurityType_SecuritiesPledge 
    | FIX_SecurityType_TermLoan 
    | FIX_SecurityType_RevolverLoan 
    | FIX_SecurityType_Revolver 
    | FIX_SecurityType_BridgeLoan 
    | FIX_SecurityType_LetterOfCredit 
    | FIX_SecurityType_SwingLineFacility 
    | FIX_SecurityType_DebtorInPossession 
    | FIX_SecurityType_Defaulted 
    | FIX_SecurityType_Withdrawn 
    | FIX_SecurityType_Replaced 
    | FIX_SecurityType_Matured 
    | FIX_SecurityType_Amended 
    | FIX_SecurityType_Retired 
    | FIX_SecurityType_BankersAcceptance 
    | FIX_SecurityType_BankNotes 
    | FIX_SecurityType_BillOfExchanges 
    | FIX_SecurityType_CertificateOfDeposit 
    | FIX_SecurityType_CallLoans 
    | FIX_SecurityType_CommercialPaper 
    | FIX_SecurityType_DepositNotes 
    | FIX_SecurityType_EuroCertificateOfDeposit 
    | FIX_SecurityType_EuroCommercialPaper 
    | FIX_SecurityType_LiquidityNote 
    | FIX_SecurityType_MediumTermNotes 
    | FIX_SecurityType_Overnight 
    | FIX_SecurityType_PromissoryNote 
    | FIX_SecurityType_PlazosFijos 
    | FIX_SecurityType_ShortTermLoanNote 
    | FIX_SecurityType_TimeDeposit 
    | FIX_SecurityType_ExtendedCommNote 
    | FIX_SecurityType_YankeeCertificateOfDeposit 
    | FIX_SecurityType_AssetBackedSecurities 
    | FIX_SecurityType_Corp 
    | FIX_SecurityType_CollateralizedMortgageObligation 
    | FIX_SecurityType_IOETTEMortgage 
    | FIX_SecurityType_MortgageBackedSecurities 
    | FIX_SecurityType_MortgageInterestOnly 
    | FIX_SecurityType_MortgagePrincipalOnly 
    | FIX_SecurityType_MortgagePrivatePlacement 
    | FIX_SecurityType_MiscellaneousPassThrough 
    | FIX_SecurityType_Pfandbriefe 
    | FIX_SecurityType_ToBeAnnounced 
    | FIX_SecurityType_OtherAnticipationNotes 
    | FIX_SecurityType_CertificateOfObligation 
    | FIX_SecurityType_CertificateOfParticipation 
    | FIX_SecurityType_GeneralObligationBonds 
    | FIX_SecurityType_MandatoryTender 
    | FIX_SecurityType_RevenueAnticipationNote 
    | FIX_SecurityType_RevenueBonds 
    | FIX_SecurityType_SpecialAssessment 
    | FIX_SecurityType_SpecialObligation 
    | FIX_SecurityType_SpecialTax 
    | FIX_SecurityType_TaxAnticipationNote 
    | FIX_SecurityType_TaxAllocation 
    | FIX_SecurityType_TaxExemptCommercialPaper 
    | FIX_SecurityType_TaxRevenueAnticipationNote 
    | FIX_SecurityType_VariableRateDemandNote 
    | FIX_SecurityType_Warrant 
    | FIX_SecurityType_MutualFund 
    | FIX_SecurityType_MultilegInstrument 
    | FIX_SecurityType_NoSecurityType 
;;

type fix_settlcurrfxratecalc =
    | FIX_SettlCurrFxRateCalc_Multiply 
    | FIX_SettlCurrFxRateCalc_Divide 
;;

type fix_settldeliverytype =
    | FIX_SettlDeliveryType_Versus 
    | FIX_SettlDeliveryType_Free 
    | FIX_SettlDeliveryType_TriParty 
    | FIX_SettlDeliveryType_HoldInCustody 
;;

type fix_settlinstmode =
    | FIX_SettlInstMode_StandingInstructionsProvided 
    | FIX_SettlInstMode_SpecificOrderForASingleAccount 
    | FIX_SettlInstMode_RequestReject 
;;

type fix_settlinstreqrejcode =
    | FIX_SettlInstReqRejCode_UnableToProcessRequest 
    | FIX_SettlInstReqRejCode_UnknownAccount 
    | FIX_SettlInstReqRejCode_NoMatchingSettlementInstructionsFound 
    | FIX_SettlInstReqRejCode_Other 
;;

type fix_settlinstsource =
    | FIX_SettlInstSource_BrokerCredit 
    | FIX_SettlInstSource_Institution 
    | FIX_SettlInstSource_Investor 
;;

type fix_settlinsttranstype =
    | FIX_SettlInstTransType_New 
    | FIX_SettlInstTransType_Cancel 
    | FIX_SettlInstTransType_Replace 
    | FIX_SettlInstTransType_Restate 
;;

type fix_settlpricetype =
    | FIX_SettlPriceType_Final 
    | FIX_SettlPriceType_Theoretical 
;;

type fix_settlsessid =
    | FIX_SettlSessID_Intraday 
    | FIX_SettlSessID_RegularTradingHours 
    | FIX_SettlSessID_ElectronicTradingHours 
;;

type fix_settltype =
    | FIX_SettlType_Regular 
    | FIX_SettlType_Cash 
    | FIX_SettlType_NextDay 
    | FIX_SettlType_TPlus2 
    | FIX_SettlType_TPlus3 
    | FIX_SettlType_TPlus4 
    | FIX_SettlType_Future 
    | FIX_SettlType_WhenAndIfIssued 
    | FIX_SettlType_SellersOption 
    | FIX_SettlType_TPlus5 
;;

type fix_shortsalereason =
    | FIX_ShortSaleReason_DealerSoldShort 
    | FIX_ShortSaleReason_DealerSoldShortExempt 
    | FIX_ShortSaleReason_SellingCustomerSoldShort 
    | FIX_ShortSaleReason_SellingCustomerSoldShortExempt 
    | FIX_ShortSaleReason_QualifiedServiceRepresentative 
    | FIX_ShortSaleReason_QSROrAGUContraSideSoldShortExempt 
;;

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
    | FIX_Side_CrossShortExempt 
    | FIX_Side_AsDefined 
    | FIX_Side_Opposite 
    | FIX_Side_Subscribe 
    | FIX_Side_Redeem 
    | FIX_Side_Lend 
    | FIX_Side_Borrow 
;;

type fix_sidemultilegreportingtype =
    | FIX_SideMultiLegReportingType_SingleSecurity 
    | FIX_SideMultiLegReportingType_IndividualLegOfAMultilegSecurity 
    | FIX_SideMultiLegReportingType_MultilegSecurity 
;;

type fix_sidevalueind =
    | FIX_SideValueInd_SideValue1 
    | FIX_SideValueInd_SideValue2 
;;

type fix_solicitedflag =
    | FIX_SolicitedFlag_WasSolicited 
    | FIX_SolicitedFlag_WasNotSolicited 
;;

type fix_standinstdbtype =
    | FIX_StandInstDbType_Other 
    | FIX_StandInstDbType_DTCSID 
    | FIX_StandInstDbType_ThomsonALERT 
    | FIX_StandInstDbType_AGlobalCustodian 
    | FIX_StandInstDbType_AccountNet 
;;

type fix_statusvalue =
    | FIX_StatusValue_Connected 
    | FIX_StatusValue_NotConnectedUnexpected 
    | FIX_StatusValue_NotConnectedExpected 
    | FIX_StatusValue_InProcess 
;;

type fix_stipulationtype =
    | FIX_StipulationType_AlternativeMinimumTax 
    | FIX_StipulationType_AutoReinvestment 
    | FIX_StipulationType_BankQualified 
    | FIX_StipulationType_BargainConditions 
    | FIX_StipulationType_CouponRange 
    | FIX_StipulationType_ISOCurrencyCode 
    | FIX_StipulationType_CustomStart 
    | FIX_StipulationType_Geographics 
    | FIX_StipulationType_ValuationDiscount 
    | FIX_StipulationType_Insured 
    | FIX_StipulationType_IssueDate 
    | FIX_StipulationType_Issuer 
    | FIX_StipulationType_IssueSizeRange 
    | FIX_StipulationType_LookbackDays 
    | FIX_StipulationType_ExplicitLotIdentifier 
    | FIX_StipulationType_LotVariance 
    | FIX_StipulationType_MaturityYearAndMonth 
    | FIX_StipulationType_MaturityRange 
    | FIX_StipulationType_MaximumSubstitutions 
    | FIX_StipulationType_MinimumQuantity 
    | FIX_StipulationType_MinimumIncrement 
    | FIX_StipulationType_MinimumDenomination 
    | FIX_StipulationType_PaymentFrequency 
    | FIX_StipulationType_NumberOfPieces 
    | FIX_StipulationType_PoolsMaximum 
    | FIX_StipulationType_PoolsPerMillion 
    | FIX_StipulationType_PoolsPerLot 
    | FIX_StipulationType_PoolsPerTrade 
    | FIX_StipulationType_PriceRange 
    | FIX_StipulationType_PricingFrequency 
    | FIX_StipulationType_ProductionYear 
    | FIX_StipulationType_CallProtection 
    | FIX_StipulationType_Purpose 
    | FIX_StipulationType_BenchmarkPriceSource 
    | FIX_StipulationType_RatingSourceAndRange 
    | FIX_StipulationType_TypeOfRedemption 
    | FIX_StipulationType_Restricted 
    | FIX_StipulationType_MarketSector 
    | FIX_StipulationType_SecurityTypeIncludedOrExcluded 
    | FIX_StipulationType_Structure 
    | FIX_StipulationType_SubstitutionsFrequency 
    | FIX_StipulationType_SubstitutionsLeft 
    | FIX_StipulationType_FreeformText 
    | FIX_StipulationType_TradeVariance 
    | FIX_StipulationType_WeightedAverageCoupon 
    | FIX_StipulationType_WeightedAverageLifeCoupon 
    | FIX_StipulationType_WeightedAverageLoanAge 
    | FIX_StipulationType_WeightedAverageMaturity 
    | FIX_StipulationType_WholePool 
    | FIX_StipulationType_YieldRange 
;;

type fix_subscriptionrequesttype =
    | FIX_SubscriptionRequestType_Snapshot 
    | FIX_SubscriptionRequestType_SnapshotAndUpdates 
    | FIX_SubscriptionRequestType_DisablePreviousSnapshot 
;;

type fix_targetstrategy =
    | FIX_TargetStrategy_VWAP 
    | FIX_TargetStrategy_Participate 
    | FIX_TargetStrategy_MininizeMarketImpact 
;;

type fix_taxadvantagetype =
    | FIX_TaxAdvantageType_FIXNone 
    | FIX_TaxAdvantageType_MaxiISA 
    | FIX_TaxAdvantageType_TESSA 
    | FIX_TaxAdvantageType_MiniCashISA 
    | FIX_TaxAdvantageType_MiniStocksAndSharesISA 
    | FIX_TaxAdvantageType_MiniInsuranceISA 
    | FIX_TaxAdvantageType_CurrentYearPayment 
    | FIX_TaxAdvantageType_PriorYearPayment 
    | FIX_TaxAdvantageType_AssetTransfer 
    | FIX_TaxAdvantageType_EmployeePriorYear 
    | FIX_TaxAdvantageType_EmployeeCurrentYear 
    | FIX_TaxAdvantageType_EmployerPriorYear 
    | FIX_TaxAdvantageType_EmployerCurrentYear 
    | FIX_TaxAdvantageType_NonFundPrototypeIRA 
    | FIX_TaxAdvantageType_NonFundQualifiedPlan 
    | FIX_TaxAdvantageType_DefinedContributionPlan 
    | FIX_TaxAdvantageType_IRA 
    | FIX_TaxAdvantageType_IRARollover 
    | FIX_TaxAdvantageType_KEOGH 
    | FIX_TaxAdvantageType_ProfitSharingPlan 
    | FIX_TaxAdvantageType_US401K 
    | FIX_TaxAdvantageType_SelfDirectedIRA 
    | FIX_TaxAdvantageType_US403b 
    | FIX_TaxAdvantageType_US457 
    | FIX_TaxAdvantageType_RothIRAPrototype 
    | FIX_TaxAdvantageType_RothIRANonPrototype 
    | FIX_TaxAdvantageType_RothConversionIRAPrototype 
    | FIX_TaxAdvantageType_RothConversionIRANonPrototype 
    | FIX_TaxAdvantageType_EducationIRAPrototype 
    | FIX_TaxAdvantageType_EducationIRANonPrototype 
;;

type fix_terminationtype =
    | FIX_TerminationType_Overnight 
    | FIX_TerminationType_Term 
    | FIX_TerminationType_Flexible 
    | FIX_TerminationType_Open 
;;

type fix_testmessageindicator =
    | FIX_TestMessageIndicator_True 
    | FIX_TestMessageIndicator_Fales 
;;

type fix_tickdirection =
    | FIX_TickDirection_PlusTick 
    | FIX_TickDirection_ZeroPlusTick 
    | FIX_TickDirection_MinusTick 
    | FIX_TickDirection_ZeroMinusTick 
;;

type fix_timeinforce =
    | FIX_TimeInForce_Day 
    | FIX_TimeInForce_GoodTillCancel 
    | FIX_TimeInForce_AtTheOpening 
    | FIX_TimeInForce_ImmediateOrCancel 
    | FIX_TimeInForce_FillOrKill 
    | FIX_TimeInForce_GoodTillCrossing 
    | FIX_TimeInForce_GoodTillDate 
    | FIX_TimeInForce_AtTheClose 
;;

type fix_tradsesmethod =
    | FIX_TradSesMethod_Electronic 
    | FIX_TradSesMethod_OpenOutcry 
    | FIX_TradSesMethod_TwoParty 
;;

type fix_tradsesmode =
    | FIX_TradSesMode_Testing 
    | FIX_TradSesMode_Simulated 
    | FIX_TradSesMode_Production 
;;

type fix_tradsesstatus =
    | FIX_TradSesStatus_Unknown 
    | FIX_TradSesStatus_Halted 
    | FIX_TradSesStatus_Open 
    | FIX_TradSesStatus_Closed 
    | FIX_TradSesStatus_PreOpen 
    | FIX_TradSesStatus_PreClose 
    | FIX_TradSesStatus_RequestRejected 
;;

type fix_tradsesstatusrejreason =
    | FIX_TradSesStatusRejReason_UnknownOrInvalidTradingSessionID 
    | FIX_TradSesStatusRejReason_Other 
;;

type fix_tradeallocindicator =
    | FIX_TradeAllocIndicator_AllocationNotRequired 
    | FIX_TradeAllocIndicator_AllocationRequired 
    | FIX_TradeAllocIndicator_UseAllocationProvidedWithTheTrade 
;;

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
    | FIX_TradeCondition_ImbalanceMoreBuyers 
    | FIX_TradeCondition_ImbalanceMoreSellers 
    | FIX_TradeCondition_OpeningPrice 
;;

type fix_tradereportrejectreason =
    | FIX_TradeReportRejectReason_Successful 
    | FIX_TradeReportRejectReason_InvalidPartyOnformation 
    | FIX_TradeReportRejectReason_UnknownInstrument 
    | FIX_TradeReportRejectReason_UnauthorizedToReportTrades 
    | FIX_TradeReportRejectReason_InvalidTradeType 
    | FIX_TradeReportRejectReason_Other 
;;

type fix_tradereporttype =
    | FIX_TradeReportType_Submit 
    | FIX_TradeReportType_Alleged 
    | FIX_TradeReportType_Accept 
    | FIX_TradeReportType_Decline 
    | FIX_TradeReportType_Addendum 
    | FIX_TradeReportType_No 
    | FIX_TradeReportType_TradeReportCancel 
    | FIX_TradeReportType_LockedIn 
;;

type fix_traderequestresult =
    | FIX_TradeRequestResult_Successful 
    | FIX_TradeRequestResult_InvalidOrUnknownInstrument 
    | FIX_TradeRequestResult_InvalidTypeOfTradeRequested 
    | FIX_TradeRequestResult_InvalidParties 
    | FIX_TradeRequestResult_InvalidTransportTypeRequested 
    | FIX_TradeRequestResult_InvalidDestinationRequested 
    | FIX_TradeRequestResult_TradeRequestTypeNotSupported 
    | FIX_TradeRequestResult_NotAuthorized 
    | FIX_TradeRequestResult_Other 
;;

type fix_traderequeststatus =
    | FIX_TradeRequestStatus_Accepted 
    | FIX_TradeRequestStatus_Completed 
    | FIX_TradeRequestStatus_Rejected 
;;

type fix_traderequesttype =
    | FIX_TradeRequestType_AllTrades 
    | FIX_TradeRequestType_MatchedTradesMatchingCriteria 
    | FIX_TradeRequestType_UnmatchedTradesThatMatchCriteria 
    | FIX_TradeRequestType_UnreportedTradesThatMatchCriteria 
    | FIX_TradeRequestType_AdvisoriesThatMatchCriteria 
;;

type fix_tradedflatswitch =
    | FIX_TradedFlatSwitch_TradedFlat 
    | FIX_TradedFlatSwitch_NotTradedFlat 
;;

type fix_trdregtimestamptype =
    | FIX_TrdRegTimestampType_ExecutionTime 
    | FIX_TrdRegTimestampType_TimeIn 
    | FIX_TrdRegTimestampType_TimeOut 
    | FIX_TrdRegTimestampType_BrokerReceipt 
    | FIX_TrdRegTimestampType_BrokerExecution 
;;

type fix_trdrptstatus =
    | FIX_TrdRptStatus_Accepted 
    | FIX_TrdRptStatus_Rejected 
;;

type fix_trdtype =
    | FIX_TrdType_RegularTrade 
    | FIX_TrdType_BlockTrade 
    | FIX_TrdType_EFP 
    | FIX_TrdType_Transfer 
    | FIX_TrdType_LateTrade 
    | FIX_TrdType_TTrade 
    | FIX_TrdType_WeightedAveragePriceTrade 
    | FIX_TrdType_BunchedTrade 
    | FIX_TrdType_LateBunchedTrade 
    | FIX_TrdType_PriorReferencePriceTrade 
    | FIX_TrdType_AfterHoursTrade 
;;

type fix_unsolicitedindicator =
    | FIX_UnsolicitedIndicator_MessageIsBeingSentUnsolicited 
    | FIX_UnsolicitedIndicator_MessageIsBeingSentAsAResultOfAPriorRequest 
;;

type fix_urgency =
    | FIX_Urgency_Normal 
    | FIX_Urgency_Flash 
    | FIX_Urgency_Background 
;;

type fix_userrequesttype =
    | FIX_UserRequestType_LogOnUser 
    | FIX_UserRequestType_LogOffUser 
    | FIX_UserRequestType_ChangePasswordForUser 
    | FIX_UserRequestType_RequestIndividualUserStatus 
;;

type fix_userstatus =
    | FIX_UserStatus_LoggedIn 
    | FIX_UserStatus_NotLoggedIn 
    | FIX_UserStatus_UserNotRecognised 
    | FIX_UserStatus_PasswordIncorrect 
    | FIX_UserStatus_PasswordChanged 
    | FIX_UserStatus_Other 
;;

type fix_workingindicator =
    | FIX_WorkingIndicator_Working 
    | FIX_WorkingIndicator_NotWorking 
;;

type fix_yieldtype =
    | FIX_YieldType_AfterTaxYield 
    | FIX_YieldType_AnnualYield 
    | FIX_YieldType_YieldAtIssue 
    | FIX_YieldType_YieldToAverageMaturity 
    | FIX_YieldType_BookYield 
    | FIX_YieldType_YieldToNextCall 
    | FIX_YieldType_YieldChangeSinceClose 
    | FIX_YieldType_ClosingYield 
    | FIX_YieldType_CompoundYield 
    | FIX_YieldType_CurrentYield 
    | FIX_YieldType_TrueGrossYield 
    | FIX_YieldType_GvntEquivalentYield 
    | FIX_YieldType_YieldWithInflationAssumption 
    | FIX_YieldType_InverseFloaterBondYield 
    | FIX_YieldType_MostRecentClosingYield 
    | FIX_YieldType_ClosingYieldMostRecentMonth 
    | FIX_YieldType_ClosingYieldMostRecentQuarter 
    | FIX_YieldType_ClosingYieldMostRecentYear 
    | FIX_YieldType_YieldToLongestAverageLife 
    | FIX_YieldType_MarkToMarketYield 
    | FIX_YieldType_YieldToMaturity 
    | FIX_YieldType_YieldToNextRefund 
    | FIX_YieldType_OpenAverageYield 
    | FIX_YieldType_YieldToNextPut 
    | FIX_YieldType_PreviousCloseYield 
    | FIX_YieldType_ProceedsYield 
    | FIX_YieldType_SemiAnnualYield 
    | FIX_YieldType_YieldToShortestAverageLife 
    | FIX_YieldType_SimpleYield 
    | FIX_YieldType_TaxEquivalentYield 
    | FIX_YieldType_YieldToTenderDate 
    | FIX_YieldType_TrueYield 
    | FIX_YieldType_YieldValueOf132 
    | FIX_YieldType_YieldToWorst 
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
