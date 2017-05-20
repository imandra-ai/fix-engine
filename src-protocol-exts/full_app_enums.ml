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

type fix_businessrejectreason =
    | FIX_BusinessRejectReason_Other 
    | FIX_BusinessRejectReason_UnknownID 
    | FIX_BusinessRejectReason_UnknownSecurity 
    | FIX_BusinessRejectReason_UnsupportedMessageType 
    | FIX_BusinessRejectReason_ApplicationNotAvailable 
    | FIX_BusinessRejectReason_ConditionallyRequiredFieldMissing 
    | FIX_BusinessRejectReason_NotAuthorized 
    | FIX_BusinessRejectReason_DeliverToFirmNotAvailableAtThisTime 
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
    | FIX_CrossPrioritization_Unknown 
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

type fix_encryptmethod =
    | FIX_EncryptMethod_Unknown 
    | FIX_EncryptMethod_PKCS 
    | FIX_EncryptMethod_DES 
    | FIX_EncryptMethod_PKCSDES 
    | FIX_EncryptMethod_PGPDES 
    | FIX_EncryptMethod_PGPDESMD5 
    | FIX_EncryptMethod_PEM 
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

type fix_gapfillflag =
    | FIX_GapFillFlag_GapFillMessage 
    | FIX_GapFillFlag_SequenceReset 
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

type fix_sessionrejectreason =
    | FIX_SessionRejectReason_InvalidTagNumber 
    | FIX_SessionRejectReason_RequiredTagMissing 
    | FIX_SessionRejectReason_TagNotDefinedForThisMessageType 
    | FIX_SessionRejectReason_UndefinedTag 
    | FIX_SessionRejectReason_TagSpecifiedWithoutAValue 
    | FIX_SessionRejectReason_ValueIsIncorrect 
    | FIX_SessionRejectReason_IncorrectDataFormatForValue 
    | FIX_SessionRejectReason_DecryptionProblem 
    | FIX_SessionRejectReason_SignatureProblem 
    | FIX_SessionRejectReason_CompIDProblem 
    | FIX_SessionRejectReason_SendingTimeAccuracyProblem 
    | FIX_SessionRejectReason_InvalidMsgType 
    | FIX_SessionRejectReason_XMLValidationError 
    | FIX_SessionRejectReason_TagAppearsMoreThanOnce 
    | FIX_SessionRejectReason_TagSpecifiedOutOfRequiredOrder 
    | FIX_SessionRejectReason_RepeatingGroupFieldsOutOfOrder 
    | FIX_SessionRejectReason_IncorrectNumInGroupCountForRepeatingGroup 
    | FIX_SessionRejectReason_Non 
    | FIX_SessionRejectReason_Other 
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
    | FIX_TaxAdvantageType_Unknown 
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

type fix_currency =
     (** three letter code from ISO4217*)
    | FIX_Currency_AED 
    | FIX_Currency_AFN 
    | FIX_Currency_AMD 
    | FIX_Currency_ANG 
    | FIX_Currency_AOA 
    | FIX_Currency_ARS 
    | FIX_Currency_AUD 
    | FIX_Currency_AWG 
    | FIX_Currency_AZN 
    | FIX_Currency_BAM 
    | FIX_Currency_BBD 
    | FIX_Currency_BDT 
    | FIX_Currency_BGN 
    | FIX_Currency_BHD 
    | FIX_Currency_BIF 
    | FIX_Currency_BMD 
    | FIX_Currency_BND 
    | FIX_Currency_BOB 
    | FIX_Currency_BRL 
    | FIX_Currency_BSD 
    | FIX_Currency_BTN 
    | FIX_Currency_BWP 
    | FIX_Currency_BYN 
    | FIX_Currency_BZD 
    | FIX_Currency_CAD 
    | FIX_Currency_CDF 
    | FIX_Currency_CHF 
    | FIX_Currency_CLP 
    | FIX_Currency_CNY 
    | FIX_Currency_COP 
    | FIX_Currency_CRC 
    | FIX_Currency_CUC 
    | FIX_Currency_CUP 
    | FIX_Currency_CVE 
    | FIX_Currency_CZK 
    | FIX_Currency_DJF 
    | FIX_Currency_DKK 
    | FIX_Currency_DOP 
    | FIX_Currency_DZD 
    | FIX_Currency_EGP 
    | FIX_Currency_ERN 
    | FIX_Currency_ETB 
    | FIX_Currency_EUR 
    | FIX_Currency_FJD 
    | FIX_Currency_FKP 
    | FIX_Currency_GBP 
    | FIX_Currency_GEL 
    | FIX_Currency_GGP 
    | FIX_Currency_GHS 
    | FIX_Currency_GIP 
    | FIX_Currency_GMD 
    | FIX_Currency_GNF 
    | FIX_Currency_GTQ 
    | FIX_Currency_GYD 
    | FIX_Currency_HKD 
    | FIX_Currency_HNL 
    | FIX_Currency_HRK 
    | FIX_Currency_HTG 
    | FIX_Currency_HUF 
    | FIX_Currency_IDR 
    | FIX_Currency_ILS 
    | FIX_Currency_IMP 
    | FIX_Currency_INR 
    | FIX_Currency_IQD 
    | FIX_Currency_IRR 
    | FIX_Currency_ISK 
    | FIX_Currency_JEP 
    | FIX_Currency_JMD 
    | FIX_Currency_JOD 
    | FIX_Currency_JPY 
    | FIX_Currency_KES 
    | FIX_Currency_KGS 
    | FIX_Currency_KHR 
    | FIX_Currency_KMF 
    | FIX_Currency_KPW 
    | FIX_Currency_KRW 
    | FIX_Currency_KWD 
    | FIX_Currency_KYD 
    | FIX_Currency_KZT 
    | FIX_Currency_LAK 
    | FIX_Currency_LBP 
    | FIX_Currency_LKR 
    | FIX_Currency_LRD 
    | FIX_Currency_LSL 
    | FIX_Currency_LYD 
    | FIX_Currency_MAD 
    | FIX_Currency_MDL 
    | FIX_Currency_MGA 
    | FIX_Currency_MKD 
    | FIX_Currency_MMK 
    | FIX_Currency_MNT 
    | FIX_Currency_MOP 
    | FIX_Currency_MRO 
    | FIX_Currency_MUR 
    | FIX_Currency_MVR 
    | FIX_Currency_MWK 
    | FIX_Currency_MXN 
    | FIX_Currency_MYR 
    | FIX_Currency_MZN 
    | FIX_Currency_NAD 
    | FIX_Currency_NGN 
    | FIX_Currency_NIO 
    | FIX_Currency_NOK 
    | FIX_Currency_NPR 
    | FIX_Currency_NZD 
    | FIX_Currency_OMR 
    | FIX_Currency_PAB 
    | FIX_Currency_PEN 
    | FIX_Currency_PGK 
    | FIX_Currency_PHP 
    | FIX_Currency_PKR 
    | FIX_Currency_PLN 
    | FIX_Currency_PYG 
    | FIX_Currency_QAR 
    | FIX_Currency_RON 
    | FIX_Currency_RSD 
    | FIX_Currency_RUB 
    | FIX_Currency_RWF 
    | FIX_Currency_SAR 
    | FIX_Currency_SBD 
    | FIX_Currency_SCR 
    | FIX_Currency_SDG 
    | FIX_Currency_SEK 
    | FIX_Currency_SGD 
    | FIX_Currency_SHP 
    | FIX_Currency_SLL 
    | FIX_Currency_SOS 
    | FIX_Currency_SPL 
    | FIX_Currency_SRD 
    | FIX_Currency_STD 
    | FIX_Currency_SVC 
    | FIX_Currency_SYP 
    | FIX_Currency_SZL 
    | FIX_Currency_THB 
    | FIX_Currency_TJS 
    | FIX_Currency_TMT 
    | FIX_Currency_TND 
    | FIX_Currency_TOP 
    | FIX_Currency_TRY 
    | FIX_Currency_TTD 
    | FIX_Currency_TVD 
    | FIX_Currency_TWD 
    | FIX_Currency_TZS 
    | FIX_Currency_UAH 
    | FIX_Currency_UGX 
    | FIX_Currency_USD 
    | FIX_Currency_UYU 
    | FIX_Currency_UZS 
    | FIX_Currency_VEF 
    | FIX_Currency_VND 
    | FIX_Currency_VUV 
    | FIX_Currency_WST 
    | FIX_Currency_XAF 
    | FIX_Currency_XCD 
    | FIX_Currency_XDR 
    | FIX_Currency_XOF 
    | FIX_Currency_XPF 
    | FIX_Currency_YER 
    | FIX_Currency_ZAR 
    | FIX_Currency_ZMW 
    | FIX_Currency_ZWD 
;;

type fix_country =
     (** 2 letter country code - ISO 3166 *)
    | FIX_Country_AF 
    | FIX_Country_AX 
    | FIX_Country_AL 
    | FIX_Country_DZ 
    | FIX_Country_AS 
    | FIX_Country_AD 
    | FIX_Country_AO 
    | FIX_Country_AI 
    | FIX_Country_AQ 
    | FIX_Country_AG 
    | FIX_Country_AR 
    | FIX_Country_AM 
    | FIX_Country_AW 
    | FIX_Country_AU 
    | FIX_Country_AT 
    | FIX_Country_AZ 
    | FIX_Country_BS 
    | FIX_Country_BH 
    | FIX_Country_BD 
    | FIX_Country_BB 
    | FIX_Country_BY 
    | FIX_Country_BE 
    | FIX_Country_BZ 
    | FIX_Country_BJ 
    | FIX_Country_BM 
    | FIX_Country_BT 
    | FIX_Country_BO 
    | FIX_Country_BQ 
    | FIX_Country_BA 
    | FIX_Country_BW 
    | FIX_Country_BV 
    | FIX_Country_BR 
    | FIX_Country_IO 
    | FIX_Country_BN 
    | FIX_Country_BG 
    | FIX_Country_BF 
    | FIX_Country_BI 
    | FIX_Country_CV 
    | FIX_Country_KH 
    | FIX_Country_CM 
    | FIX_Country_CA 
    | FIX_Country_KY 
    | FIX_Country_CF 
    | FIX_Country_TD 
    | FIX_Country_CL 
    | FIX_Country_CN 
    | FIX_Country_CX 
    | FIX_Country_CC 
    | FIX_Country_CO 
    | FIX_Country_KM 
    | FIX_Country_CD 
    | FIX_Country_CG 
    | FIX_Country_CK 
    | FIX_Country_CR 
    | FIX_Country_CI 
    | FIX_Country_HR 
    | FIX_Country_CU 
    | FIX_Country_CW 
    | FIX_Country_CY 
    | FIX_Country_CZ 
    | FIX_Country_DK 
    | FIX_Country_DJ 
    | FIX_Country_DM 
    | FIX_Country_DO 
    | FIX_Country_EC 
    | FIX_Country_EG 
    | FIX_Country_SV 
    | FIX_Country_GQ 
    | FIX_Country_ER 
    | FIX_Country_EE 
    | FIX_Country_ET 
    | FIX_Country_FK 
    | FIX_Country_FO 
    | FIX_Country_FJ 
    | FIX_Country_FI 
    | FIX_Country_FR 
    | FIX_Country_GF 
    | FIX_Country_PF 
    | FIX_Country_TF 
    | FIX_Country_GA 
    | FIX_Country_GM 
    | FIX_Country_GE 
    | FIX_Country_DE 
    | FIX_Country_GH 
    | FIX_Country_GI 
    | FIX_Country_GR 
    | FIX_Country_GL 
    | FIX_Country_GD 
    | FIX_Country_GP 
    | FIX_Country_GU 
    | FIX_Country_GT 
    | FIX_Country_GG 
    | FIX_Country_GN 
    | FIX_Country_GW 
    | FIX_Country_GY 
    | FIX_Country_HT 
    | FIX_Country_HM 
    | FIX_Country_VA 
    | FIX_Country_HN 
    | FIX_Country_HK 
    | FIX_Country_HU 
    | FIX_Country_IS 
    | FIX_Country_IN 
    | FIX_Country_ID 
    | FIX_Country_IR 
    | FIX_Country_IQ 
    | FIX_Country_IE 
    | FIX_Country_IM 
    | FIX_Country_IL 
    | FIX_Country_IT 
    | FIX_Country_JM 
    | FIX_Country_JP 
    | FIX_Country_JE 
    | FIX_Country_JO 
    | FIX_Country_KZ 
    | FIX_Country_KE 
    | FIX_Country_KI 
    | FIX_Country_KP 
    | FIX_Country_KR 
    | FIX_Country_KW 
    | FIX_Country_KG 
    | FIX_Country_LA 
    | FIX_Country_LV 
    | FIX_Country_LB 
    | FIX_Country_LS 
    | FIX_Country_LR 
    | FIX_Country_LY 
    | FIX_Country_LI 
    | FIX_Country_LT 
    | FIX_Country_LU 
    | FIX_Country_MO 
    | FIX_Country_MK 
    | FIX_Country_MG 
    | FIX_Country_MW 
    | FIX_Country_MY 
    | FIX_Country_MV 
    | FIX_Country_ML 
    | FIX_Country_MT 
    | FIX_Country_MH 
    | FIX_Country_MQ 
    | FIX_Country_MR 
    | FIX_Country_MU 
    | FIX_Country_YT 
    | FIX_Country_MX 
    | FIX_Country_FM 
    | FIX_Country_MD 
    | FIX_Country_MC 
    | FIX_Country_MN 
    | FIX_Country_ME 
    | FIX_Country_MS 
    | FIX_Country_MA 
    | FIX_Country_MZ 
    | FIX_Country_MM 
    | FIX_Country_NA 
    | FIX_Country_NR 
    | FIX_Country_NP 
    | FIX_Country_NL 
    | FIX_Country_NC 
    | FIX_Country_NZ 
    | FIX_Country_NI 
    | FIX_Country_NE 
    | FIX_Country_NG 
    | FIX_Country_NU 
    | FIX_Country_NF 
    | FIX_Country_MP 
    | FIX_Country_NO 
    | FIX_Country_OM 
    | FIX_Country_PK 
    | FIX_Country_PW 
    | FIX_Country_PS 
    | FIX_Country_PA 
    | FIX_Country_PG 
    | FIX_Country_PY 
    | FIX_Country_PE 
    | FIX_Country_PH 
    | FIX_Country_PN 
    | FIX_Country_PL 
    | FIX_Country_PT 
    | FIX_Country_PR 
    | FIX_Country_QA 
    | FIX_Country_RE 
    | FIX_Country_RO 
    | FIX_Country_RU 
    | FIX_Country_RW 
    | FIX_Country_BL 
    | FIX_Country_SH 
    | FIX_Country_KN 
    | FIX_Country_LC 
    | FIX_Country_MF 
    | FIX_Country_PM 
    | FIX_Country_VC 
    | FIX_Country_WS 
    | FIX_Country_SM 
    | FIX_Country_ST 
    | FIX_Country_SA 
    | FIX_Country_SN 
    | FIX_Country_RS 
    | FIX_Country_SC 
    | FIX_Country_SL 
    | FIX_Country_SG 
    | FIX_Country_SX 
    | FIX_Country_SK 
    | FIX_Country_SI 
    | FIX_Country_SB 
    | FIX_Country_SO 
    | FIX_Country_ZA 
    | FIX_Country_GS 
    | FIX_Country_SS 
    | FIX_Country_ES 
    | FIX_Country_LK 
    | FIX_Country_SD 
    | FIX_Country_SR 
    | FIX_Country_SJ 
    | FIX_Country_SZ 
    | FIX_Country_SE 
    | FIX_Country_CH 
    | FIX_Country_SY 
    | FIX_Country_TW 
    | FIX_Country_TJ 
    | FIX_Country_TZ 
    | FIX_Country_TH 
    | FIX_Country_TL 
    | FIX_Country_TG 
    | FIX_Country_TK 
    | FIX_Country_TO 
    | FIX_Country_TT 
    | FIX_Country_TN 
    | FIX_Country_TR 
    | FIX_Country_TM 
    | FIX_Country_TC 
    | FIX_Country_TV 
    | FIX_Country_UG 
    | FIX_Country_UA 
    | FIX_Country_AE 
    | FIX_Country_GB 
    | FIX_Country_UM 
    | FIX_Country_US 
    | FIX_Country_UY 
    | FIX_Country_UZ 
    | FIX_Country_VU 
    | FIX_Country_VE 
    | FIX_Country_VN 
    | FIX_Country_VG 
    | FIX_Country_VI 
    | FIX_Country_WF 
    | FIX_Country_EH 
    | FIX_Country_YE 
    | FIX_Country_ZM 
    | FIX_Country_ZW 
;;

type fix_exchange =
     (** ISO 10383 Market Identifier Code*)
    | FIX_Exchange_XTIR 
    | FIX_Exchange_XALG 
    | FIX_Exchange_BACE 
    | FIX_Exchange_BCFS 
    | FIX_Exchange_XMVL 
    | FIX_Exchange_ROFX 
    | FIX_Exchange_XBCC 
    | FIX_Exchange_MVCX 
    | FIX_Exchange_XBCM 
    | FIX_Exchange_XBCX 
    | FIX_Exchange_XBUE 
    | FIX_Exchange_XMEV 
    | FIX_Exchange_XCNF 
    | FIX_Exchange_XMAB 
    | FIX_Exchange_XMTB 
    | FIX_Exchange_XROS 
    | FIX_Exchange_XROX 
    | FIX_Exchange_XTUC 
    | FIX_Exchange_XARM 
    | FIX_Exchange_APXL 
    | FIX_Exchange_AWBX 
    | FIX_Exchange_AWEX 
    | FIX_Exchange_BLEV 
    | FIX_Exchange_CGMA 
    | FIX_Exchange_CHIA 
    | FIX_Exchange_CXAC 
    | FIX_Exchange_CXAV 
    | FIX_Exchange_CXAM 
    | FIX_Exchange_CXAP 
    | FIX_Exchange_CXAN 
    | FIX_Exchange_CXAF 
    | FIX_Exchange_CXAW 
    | FIX_Exchange_CXAR 
    | FIX_Exchange_CXAQ 
    | FIX_Exchange_CLAU 
    | FIX_Exchange_CSAU 
    | FIX_Exchange_CFAU 
    | FIX_Exchange_MAQX 
    | FIX_Exchange_MSAL 
    | FIX_Exchange_NSXB 
    | FIX_Exchange_SIGA 
    | FIX_Exchange_SIMV 
    | FIX_Exchange_XASX 
    | FIX_Exchange_ASXC 
    | FIX_Exchange_ASXP 
    | FIX_Exchange_ASXT 
    | FIX_Exchange_ASXV 
    | FIX_Exchange_XSFE 
    | FIX_Exchange_ASXB 
    | FIX_Exchange_XFEX 
    | FIX_Exchange_XNEC 
    | FIX_Exchange_XYIE 
    | FIX_Exchange_EGSI 
    | FIX_Exchange_XWBO 
    | FIX_Exchange_EXAA 
    | FIX_Exchange_WBAH 
    | FIX_Exchange_WBDM 
    | FIX_Exchange_WBGF 
    | FIX_Exchange_XCEG 
    | FIX_Exchange_XVIE 
    | FIX_Exchange_BSEX 
    | FIX_Exchange_XIBE 
    | FIX_Exchange_XBAA 
    | FIX_Exchange_BFEX 
    | FIX_Exchange_XBAH 
    | FIX_Exchange_XCHG 
    | FIX_Exchange_XDHA 
    | FIX_Exchange_XBAB 
    | FIX_Exchange_BAJM 
    | FIX_Exchange_BCSE 
    | FIX_Exchange_BLPX 
    | FIX_Exchange_BMTS 
    | FIX_Exchange_MTSD 
    | FIX_Exchange_MTSF 
    | FIX_Exchange_XBRU 
    | FIX_Exchange_ALXB 
    | FIX_Exchange_ENXB 
    | FIX_Exchange_MLXB 
    | FIX_Exchange_TNLB 
    | FIX_Exchange_VPXB 
    | FIX_Exchange_XBRD 
    | FIX_Exchange_XBDA 
    | FIX_Exchange_XBOL 
    | FIX_Exchange_XBLB 
    | FIX_Exchange_BLBF 
    | FIX_Exchange_XSSE 
    | FIX_Exchange_XBOT 
    | FIX_Exchange_BOTV 
    | FIX_Exchange_BOTE 
    | FIX_Exchange_BCMM 
    | FIX_Exchange_BOVM 
    | FIX_Exchange_BRIX 
    | FIX_Exchange_BVMF 
    | FIX_Exchange_CETI 
    | FIX_Exchange_SELC 
    | FIX_Exchange_IBEX 
    | FIX_Exchange_MBUL 
    | FIX_Exchange_XBUL 
    | FIX_Exchange_ABUL 
    | FIX_Exchange_XCSX 
    | FIX_Exchange_XDSX 
    | FIX_Exchange_CAND 
    | FIX_Exchange_CANX 
    | FIX_Exchange_CHIC 
    | FIX_Exchange_XCX2 
    | FIX_Exchange_COTC 
    | FIX_Exchange_IFCA 
    | FIX_Exchange_IVZX 
    | FIX_Exchange_LICA 
    | FIX_Exchange_MATN 
    | FIX_Exchange_NEOE 
    | FIX_Exchange_NGXC 
    | FIX_Exchange_OMGA 
    | FIX_Exchange_LYNX 
    | FIX_Exchange_TMXS 
    | FIX_Exchange_XATS 
    | FIX_Exchange_XBBK 
    | FIX_Exchange_XCNQ 
    | FIX_Exchange_PURE 
    | FIX_Exchange_XCXD 
    | FIX_Exchange_XICX 
    | FIX_Exchange_XMOC 
    | FIX_Exchange_XMOD 
    | FIX_Exchange_XTSE 
    | FIX_Exchange_XTSX 
    | FIX_Exchange_XTNX 
    | FIX_Exchange_XBVC 
    | FIX_Exchange_XCAY 
    | FIX_Exchange_BOVA 
    | FIX_Exchange_XBCL 
    | FIX_Exchange_XSGO 
    | FIX_Exchange_CCFX 
    | FIX_Exchange_CSSX 
    | FIX_Exchange_SGEX 
    | FIX_Exchange_XCFE 
    | FIX_Exchange_XDCE 
    | FIX_Exchange_XSGE 
    | FIX_Exchange_XINE 
    | FIX_Exchange_XSHE 
    | FIX_Exchange_XSEC 
    | FIX_Exchange_XSHG 
    | FIX_Exchange_XSSC 
    | FIX_Exchange_XZCE 
    | FIX_Exchange_XBOG 
    | FIX_Exchange_XBNV 
    | FIX_Exchange_XCRO 
    | FIX_Exchange_XTRZ 
    | FIX_Exchange_XZAG 
    | FIX_Exchange_XZAM 
    | FIX_Exchange_DCSX 
    | FIX_Exchange_XCYS 
    | FIX_Exchange_XCYO 
    | FIX_Exchange_XECM 
    | FIX_Exchange_FTFS 
    | FIX_Exchange_XPRA 
    | FIX_Exchange_XPRM 
    | FIX_Exchange_XPXE 
    | FIX_Exchange_XRMZ 
    | FIX_Exchange_XRMO 
    | FIX_Exchange_DKTC 
    | FIX_Exchange_GXGR 
    | FIX_Exchange_GXGF 
    | FIX_Exchange_GXGM 
    | FIX_Exchange_NPGA 
    | FIX_Exchange_XCSE 
    | FIX_Exchange_DCSE 
    | FIX_Exchange_FNDK 
    | FIX_Exchange_DNDK 
    | FIX_Exchange_MCSE 
    | FIX_Exchange_MNDK 
    | FIX_Exchange_XBVR 
    | FIX_Exchange_XGUA 
    | FIX_Exchange_XQUI 
    | FIX_Exchange_NILX 
    | FIX_Exchange_XCAI 
    | FIX_Exchange_XSVA 
    | FIX_Exchange_XTAL 
    | FIX_Exchange_FNEE 
    | FIX_Exchange_VMFX 
    | FIX_Exchange_XSPS 
    | FIX_Exchange_FGEX 
    | FIX_Exchange_XHEL 
    | FIX_Exchange_FNFI 
    | FIX_Exchange_DHEL 
    | FIX_Exchange_DNFI 
    | FIX_Exchange_MHEL 
    | FIX_Exchange_MNFI 
    | FIX_Exchange_COAL 
    | FIX_Exchange_EPEX 
    | FIX_Exchange_FMTS 
    | FIX_Exchange_GMTF 
    | FIX_Exchange_LCHC 
    | FIX_Exchange_XAFR 
    | FIX_Exchange_XBLN 
    | FIX_Exchange_XPAR 
    | FIX_Exchange_ALXP 
    | FIX_Exchange_MTCH 
    | FIX_Exchange_XMAT 
    | FIX_Exchange_XMLI 
    | FIX_Exchange_XMON 
    | FIX_Exchange_XSPM 
    | FIX_Exchange_XPOW 
    | FIX_Exchange_XPSF 
    | FIX_Exchange_XPOT 
    | FIX_Exchange_XGSE 
    | FIX_Exchange__360T 
    | FIX_Exchange_CATS 
    | FIX_Exchange_DBOX 
    | FIX_Exchange_AUTO 
    | FIX_Exchange_ECAG 
    | FIX_Exchange_FICX 
    | FIX_Exchange_TGAT 
    | FIX_Exchange_XGAT 
    | FIX_Exchange_XGRM 
    | FIX_Exchange_XBER 
    | FIX_Exchange_BERA 
    | FIX_Exchange_BERB 
    | FIX_Exchange_BERC 
    | FIX_Exchange_EQTA 
    | FIX_Exchange_EQTB 
    | FIX_Exchange_EQTC 
    | FIX_Exchange_EQTD 
    | FIX_Exchange_XEQT 
    | FIX_Exchange_ZOBX 
    | FIX_Exchange_XDUS 
    | FIX_Exchange_DUSA 
    | FIX_Exchange_DUSB 
    | FIX_Exchange_DUSC 
    | FIX_Exchange_DUSD 
    | FIX_Exchange_XQTX 
    | FIX_Exchange_XECB 
    | FIX_Exchange_XECC 
    | FIX_Exchange_XEEE 
    | FIX_Exchange_XEEO 
    | FIX_Exchange_XEER 
    | FIX_Exchange_XETR 
    | FIX_Exchange_XEUB 
    | FIX_Exchange_XETA 
    | FIX_Exchange_XETB 
    | FIX_Exchange_XEUP 
    | FIX_Exchange_XEUM 
    | FIX_Exchange_XERE 
    | FIX_Exchange_XERT 
    | FIX_Exchange_XEUR 
    | FIX_Exchange_XFRA 
    | FIX_Exchange_FRAA 
    | FIX_Exchange_FRAB 
    | FIX_Exchange_XDBC 
    | FIX_Exchange_XDBV 
    | FIX_Exchange_XDBX 
    | FIX_Exchange_XHAM 
    | FIX_Exchange_HAMA 
    | FIX_Exchange_HAMB 
    | FIX_Exchange_HAML 
    | FIX_Exchange_HAMM 
    | FIX_Exchange_HAMN 
    | FIX_Exchange_XHAN 
    | FIX_Exchange_HANA 
    | FIX_Exchange_HANB 
    | FIX_Exchange_XINV 
    | FIX_Exchange_XMUN 
    | FIX_Exchange_MUNA 
    | FIX_Exchange_MUNB 
    | FIX_Exchange_MUNC 
    | FIX_Exchange_MUND 
    | FIX_Exchange_XSCO 
    | FIX_Exchange_XSC1 
    | FIX_Exchange_XSC2 
    | FIX_Exchange_XSC3 
    | FIX_Exchange_XSTU 
    | FIX_Exchange_EUWX 
    | FIX_Exchange_STUA 
    | FIX_Exchange_STUB 
    | FIX_Exchange_XXSC 
    | FIX_Exchange_XGHA 
    | FIX_Exchange_GSXL 
    | FIX_Exchange_ASEX 
    | FIX_Exchange_ENAX 
    | FIX_Exchange_HOTC 
    | FIX_Exchange_XADE 
    | FIX_Exchange_XATH 
    | FIX_Exchange_XIPO 
    | FIX_Exchange_HDAT 
    | FIX_Exchange_HEMO 
    | FIX_Exchange_XGTG 
    | FIX_Exchange_XCIE 
    | FIX_Exchange_GSCI 
    | FIX_Exchange_XBCV 
    | FIX_Exchange_CGMH 
    | FIX_Exchange_CLHK 
    | FIX_Exchange_CSHK 
    | FIX_Exchange_CFHK 
    | FIX_Exchange_DBHK 
    | FIX_Exchange_EOTC 
    | FIX_Exchange_GSXH 
    | FIX_Exchange_HSXA 
    | FIX_Exchange_JPMI 
    | FIX_Exchange_MAQH 
    | FIX_Exchange_SIGH 
    | FIX_Exchange_TOCP 
    | FIX_Exchange_UBSX 
    | FIX_Exchange_XCGS 
    | FIX_Exchange_XHKF 
    | FIX_Exchange_XHKG 
    | FIX_Exchange_XGEM 
    | FIX_Exchange_SHSC 
    | FIX_Exchange_SZSC 
    | FIX_Exchange_XIHK 
    | FIX_Exchange_XPST 
    | FIX_Exchange_BETA 
    | FIX_Exchange_HUPX 
    | FIX_Exchange_KCCP 
    | FIX_Exchange_XBUD 
    | FIX_Exchange_XGAS 
    | FIX_Exchange_XICE 
    | FIX_Exchange_DICE 
    | FIX_Exchange_FNIS 
    | FIX_Exchange_DNIS 
    | FIX_Exchange_MICE 
    | FIX_Exchange_MNIS 
    | FIX_Exchange_ACEX 
    | FIX_Exchange_CDSL 
    | FIX_Exchange_FXCL 
    | FIX_Exchange_FXSW 
    | FIX_Exchange_ASTR 
    | FIX_Exchange_ICXL 
    | FIX_Exchange_ISEX 
    | FIX_Exchange_MCXX 
    | FIX_Exchange_NBOT 
    | FIX_Exchange_NMCE 
    | FIX_Exchange_OTCX 
    | FIX_Exchange_PXIL 
    | FIX_Exchange_XBAN 
    | FIX_Exchange_XBOM 
    | FIX_Exchange_BSME 
    | FIX_Exchange_XCAL 
    | FIX_Exchange_XDES 
    | FIX_Exchange_XIMC 
    | FIX_Exchange_XMDS 
    | FIX_Exchange_XNCD 
    | FIX_Exchange_XNSE 
    | FIX_Exchange_XUSE 
    | FIX_Exchange_ICDX 
    | FIX_Exchange_XBBJ 
    | FIX_Exchange_XIDX 
    | FIX_Exchange_XJNB 
    | FIX_Exchange_IMEX 
    | FIX_Exchange_XTEH 
    | FIX_Exchange_XIQS 
    | FIX_Exchange_AREX 
    | FIX_Exchange_XPOS 
    | FIX_Exchange_XCDE 
    | FIX_Exchange_XDUB 
    | FIX_Exchange_XEYE 
    | FIX_Exchange_XESM 
    | FIX_Exchange_XMSM 
    | FIX_Exchange_XATL 
    | FIX_Exchange_XEBI 
    | FIX_Exchange_XTAE 
    | FIX_Exchange_CGIT 
    | FIX_Exchange_CGQT 
    | FIX_Exchange_CGDB 
    | FIX_Exchange_CGEB 
    | FIX_Exchange_CGTR 
    | FIX_Exchange_CGQD 
    | FIX_Exchange_CGND 
    | FIX_Exchange_CGGD 
    | FIX_Exchange_CGCM 
    | FIX_Exchange_EMID 
    | FIX_Exchange_EMDR 
    | FIX_Exchange_EMIR 
    | FIX_Exchange_EMIB 
    | FIX_Exchange_ETLX 
    | FIX_Exchange_HMTF 
    | FIX_Exchange_HMOD 
    | FIX_Exchange_HRFQ 
    | FIX_Exchange_MTSC 
    | FIX_Exchange_BOND 
    | FIX_Exchange_MTSM 
    | FIX_Exchange_SSOB 
    | FIX_Exchange_XGME 
    | FIX_Exchange_XMIL 
    | FIX_Exchange_MTAH 
    | FIX_Exchange_ETFP 
    | FIX_Exchange_MIVX 
    | FIX_Exchange_MOTX 
    | FIX_Exchange_MTAA 
    | FIX_Exchange_SEDX 
    | FIX_Exchange_XAIM 
    | FIX_Exchange_XDMI 
    | FIX_Exchange_XMOT 
    | FIX_Exchange_XBRV 
    | FIX_Exchange_XJAM 
    | FIX_Exchange_BETP 
    | FIX_Exchange_CHIJ 
    | FIX_Exchange_CHIV 
    | FIX_Exchange_CHIS 
    | FIX_Exchange_KAIX 
    | FIX_Exchange_CITX 
    | FIX_Exchange_CITD 
    | FIX_Exchange_CLJP 
    | FIX_Exchange_CMET 
    | FIX_Exchange_CSJP 
    | FIX_Exchange_CFJP 
    | FIX_Exchange_DRCT 
    | FIX_Exchange_LXJP 
    | FIX_Exchange_MAQJ 
    | FIX_Exchange_MIZX 
    | FIX_Exchange_MSMS 
    | FIX_Exchange_NMRJ 
    | FIX_Exchange_NXJP 
    | FIX_Exchange_NXVW 
    | FIX_Exchange_NXSE 
    | FIX_Exchange_SBIJ 
    | FIX_Exchange_XSBI 
    | FIX_Exchange_SBIV 
    | FIX_Exchange_SBIU 
    | FIX_Exchange_SIGJ 
    | FIX_Exchange_XFKA 
    | FIX_Exchange_XIJP 
    | FIX_Exchange_JASR 
    | FIX_Exchange_XJPX 
    | FIX_Exchange_XJAS 
    | FIX_Exchange_XOSE 
    | FIX_Exchange_XOSJ 
    | FIX_Exchange_XTAM 
    | FIX_Exchange_XTK1 
    | FIX_Exchange_XTK2 
    | FIX_Exchange_XTK3 
    | FIX_Exchange_XTKS 
    | FIX_Exchange_XKAC 
    | FIX_Exchange_XNGO 
    | FIX_Exchange_XNKS 
    | FIX_Exchange_XSAP 
    | FIX_Exchange_XTFF 
    | FIX_Exchange_XTKT 
    | FIX_Exchange_XAMM 
    | FIX_Exchange_ETSC 
    | FIX_Exchange_XKAZ 
    | FIX_Exchange_XNAI 
    | FIX_Exchange_XKFB 
    | FIX_Exchange_XKRX 
    | FIX_Exchange_XKFE 
    | FIX_Exchange_XKOS 
    | FIX_Exchange_XKON 
    | FIX_Exchange_XKCM 
    | FIX_Exchange_XKEM 
    | FIX_Exchange_XKUW 
    | FIX_Exchange_XKSE 
    | FIX_Exchange_XLAO 
    | FIX_Exchange_XRIS 
    | FIX_Exchange_FNLV 
    | FIX_Exchange_XBEY 
    | FIX_Exchange_XLSM 
    | FIX_Exchange_BAPX 
    | FIX_Exchange_GETB 
    | FIX_Exchange_XLIT 
    | FIX_Exchange_FNLT 
    | FIX_Exchange_CCLX 
    | FIX_Exchange_XLUX 
    | FIX_Exchange_EMTF 
    | FIX_Exchange_XVES 
    | FIX_Exchange_XMAE 
    | FIX_Exchange_XMDG 
    | FIX_Exchange_XMSW 
    | FIX_Exchange_XKLS 
    | FIX_Exchange_MESQ 
    | FIX_Exchange_XLFX 
    | FIX_Exchange_XRBM 
    | FIX_Exchange_MALX 
    | FIX_Exchange_EWSM 
    | FIX_Exchange_XMAL 
    | FIX_Exchange_PROS 
    | FIX_Exchange_GBOT 
    | FIX_Exchange_XAFX 
    | FIX_Exchange_XMAU 
    | FIX_Exchange_CGMX 
    | FIX_Exchange_XEMD 
    | FIX_Exchange_XMEX 
    | FIX_Exchange_XMOL 
    | FIX_Exchange_XULA 
    | FIX_Exchange_XMNX 
    | FIX_Exchange_XCAS 
    | FIX_Exchange_XBVM 
    | FIX_Exchange_XNAM 
    | FIX_Exchange_XNEP 
    | FIX_Exchange_NZFX 
    | FIX_Exchange_XNZE 
    | FIX_Exchange_XMAN 
    | FIX_Exchange_NASX 
    | FIX_Exchange_XNSA 
    | FIX_Exchange_FISH 
    | FIX_Exchange_FSHX 
    | FIX_Exchange_ICAS 
    | FIX_Exchange_NEXO 
    | FIX_Exchange_NOPS 
    | FIX_Exchange_NORX 
    | FIX_Exchange_NOSC 
    | FIX_Exchange_NOTC 
    | FIX_Exchange_OSLC 
    | FIX_Exchange_XIMA 
    | FIX_Exchange_XOSL 
    | FIX_Exchange_XOAM 
    | FIX_Exchange_XOAS 
    | FIX_Exchange_XOSC 
    | FIX_Exchange_NIBR 
    | FIX_Exchange_XOAD 
    | FIX_Exchange_XOSD 
    | FIX_Exchange_MERD 
    | FIX_Exchange_MERK 
    | FIX_Exchange_XMUS 
    | FIX_Exchange_NCEL 
    | FIX_Exchange_XISL 
    | FIX_Exchange_XKAR 
    | FIX_Exchange_XLAH 
    | FIX_Exchange_XPAE 
    | FIX_Exchange_XPTY 
    | FIX_Exchange_XPOM 
    | FIX_Exchange_XVPA 
    | FIX_Exchange_XLIM 
    | FIX_Exchange_CLPH 
    | FIX_Exchange_PDEX 
    | FIX_Exchange_XPHS 
    | FIX_Exchange_IENG 
    | FIX_Exchange_KDPW 
    | FIX_Exchange_PTPG 
    | FIX_Exchange_XWAR 
    | FIX_Exchange_PLPX 
    | FIX_Exchange_BOSP 
    | FIX_Exchange_RPWC 
    | FIX_Exchange_TBSP 
    | FIX_Exchange_XNCO 
    | FIX_Exchange_WBON 
    | FIX_Exchange_WDER 
    | FIX_Exchange_WETP 
    | FIX_Exchange_WGAS 
    | FIX_Exchange_WIND 
    | FIX_Exchange_WMTF 
    | FIX_Exchange_WBCL 
    | FIX_Exchange_PLPD 
    | FIX_Exchange_OMIC 
    | FIX_Exchange_OPEX 
    | FIX_Exchange_XLIS 
    | FIX_Exchange_ALXL 
    | FIX_Exchange_ENXL 
    | FIX_Exchange_MFOX 
    | FIX_Exchange_OMIP 
    | FIX_Exchange_WQXL 
    | FIX_Exchange_DSMD 
    | FIX_Exchange_TRPX 
    | FIX_Exchange_BMFX 
    | FIX_Exchange_BMFA 
    | FIX_Exchange_BMFM 
    | FIX_Exchange_SBMF 
    | FIX_Exchange_XBRM 
    | FIX_Exchange_XBSE 
    | FIX_Exchange_XBSD 
    | FIX_Exchange_XCAN 
    | FIX_Exchange_XRAS 
    | FIX_Exchange_XRPM 
    | FIX_Exchange_MISX 
    | FIX_Exchange_RTSX 
    | FIX_Exchange_NAMX 
    | FIX_Exchange_RPDX 
    | FIX_Exchange_RUSX 
    | FIX_Exchange_SPIM 
    | FIX_Exchange_XMOS 
    | FIX_Exchange_XPET 
    | FIX_Exchange_XPIC 
    | FIX_Exchange_XRUS 
    | FIX_Exchange_XSAM 
    | FIX_Exchange_XSIB 
    | FIX_Exchange_ROTC 
    | FIX_Exchange_RSEX 
    | FIX_Exchange_XECS 
    | FIX_Exchange_XSAU 
    | FIX_Exchange_XBEL 
    | FIX_Exchange_CLTD 
    | FIX_Exchange_ECAL 
    | FIX_Exchange_EEAL 
    | FIX_Exchange_IFSG 
    | FIX_Exchange_JADX 
    | FIX_Exchange_SMEX 
    | FIX_Exchange_TFSA 
    | FIX_Exchange_XSES 
    | FIX_Exchange_XSCE 
    | FIX_Exchange_XSCA 
    | FIX_Exchange_XSIM 
    | FIX_Exchange_SPXE 
    | FIX_Exchange_XBRA 
    | FIX_Exchange_EBRA 
    | FIX_Exchange_XLJU 
    | FIX_Exchange_XLJM 
    | FIX_Exchange_XSOP 
    | FIX_Exchange_XJSE 
    | FIX_Exchange_ALTX 
    | FIX_Exchange_XBES 
    | FIX_Exchange_XSAF 
    | FIX_Exchange_XSFA 
    | FIX_Exchange_YLDX 
    | FIX_Exchange_BMEX 
    | FIX_Exchange_MABX 
    | FIX_Exchange_SEND 
    | FIX_Exchange_XBAR 
    | FIX_Exchange_XBIL 
    | FIX_Exchange_XDRF 
    | FIX_Exchange_XLAT 
    | FIX_Exchange_XMAD 
    | FIX_Exchange_XMCE 
    | FIX_Exchange_XMRV 
    | FIX_Exchange_XVAL 
    | FIX_Exchange_MERF 
    | FIX_Exchange_MARF 
    | FIX_Exchange_BMCL 
    | FIX_Exchange_XMPW 
    | FIX_Exchange_IBGH 
    | FIX_Exchange_MIBG 
    | FIX_Exchange_OMEL 
    | FIX_Exchange_PAVE 
    | FIX_Exchange_XDPA 
    | FIX_Exchange_XNAF 
    | FIX_Exchange_XCOL 
    | FIX_Exchange_XKHA 
    | FIX_Exchange_XSWA 
    | FIX_Exchange_CRYD 
    | FIX_Exchange_CRYX 
    | FIX_Exchange_SEBX 
    | FIX_Exchange_ENSX 
    | FIX_Exchange_XNGM 
    | FIX_Exchange_NMTF 
    | FIX_Exchange_XNDX 
    | FIX_Exchange_XNMR 
    | FIX_Exchange_XSAT 
    | FIX_Exchange_XSTO 
    | FIX_Exchange_FNSE 
    | FIX_Exchange_XOPV 
    | FIX_Exchange_CSTO 
    | FIX_Exchange_DSTO 
    | FIX_Exchange_DNSE 
    | FIX_Exchange_MSTO 
    | FIX_Exchange_MNSE 
    | FIX_Exchange_AIXE 
    | FIX_Exchange_DOTS 
    | FIX_Exchange_EUCH 
    | FIX_Exchange_EUSP 
    | FIX_Exchange_EURM 
    | FIX_Exchange_EUSC 
    | FIX_Exchange_S3FM 
    | FIX_Exchange_STOX 
    | FIX_Exchange_XSCU 
    | FIX_Exchange_XSTV 
    | FIX_Exchange_XSTX 
    | FIX_Exchange_UBSG 
    | FIX_Exchange_UBSF 
    | FIX_Exchange_UBSC 
    | FIX_Exchange_VLEX 
    | FIX_Exchange_XBRN 
    | FIX_Exchange_XSWX 
    | FIX_Exchange_XQMH 
    | FIX_Exchange_XVTX 
    | FIX_Exchange_XBTR 
    | FIX_Exchange_XICB 
    | FIX_Exchange_XSWM 
    | FIX_Exchange_XSLS 
    | FIX_Exchange_ZKBX 
    | FIX_Exchange_XDSE 
    | FIX_Exchange_ROCO 
    | FIX_Exchange_XTAF 
    | FIX_Exchange_XTAI 
    | FIX_Exchange_XDAR 
    | FIX_Exchange_AFET 
    | FIX_Exchange_BEEX 
    | FIX_Exchange_TFEX 
    | FIX_Exchange_XBKK 
    | FIX_Exchange_XBKF 
    | FIX_Exchange_XMAI 
    | FIX_Exchange_CLMX 
    | FIX_Exchange_HCHC 
    | FIX_Exchange_NDEX 
    | FIX_Exchange_NDXS 
    | FIX_Exchange_NLPX 
    | FIX_Exchange_TOMX 
    | FIX_Exchange_TOMD 
    | FIX_Exchange_XAMS 
    | FIX_Exchange_ALXA 
    | FIX_Exchange_TNLA 
    | FIX_Exchange_XEUC 
    | FIX_Exchange_XEUE 
    | FIX_Exchange_XEUI 
    | FIX_Exchange_XEMS 
    | FIX_Exchange_XNXC 
    | FIX_Exchange_XTRN 
    | FIX_Exchange_XTUN 
    | FIX_Exchange_EXTR 
    | FIX_Exchange_XEID 
    | FIX_Exchange_XEDA 
    | FIX_Exchange_XIST 
    | FIX_Exchange_XFNO 
    | FIX_Exchange_XEQY 
    | FIX_Exchange_XDSM 
    | FIX_Exchange_XPMS 
    | FIX_Exchange_ULTX 
    | FIX_Exchange_XUGA 
    | FIX_Exchange_EESE 
    | FIX_Exchange_PFTS 
    | FIX_Exchange_PFTQ 
    | FIX_Exchange_SEPE 
    | FIX_Exchange_UKEX 
    | FIX_Exchange_XDFB 
    | FIX_Exchange_XKHR 
    | FIX_Exchange_XKIE 
    | FIX_Exchange_XKIS 
    | FIX_Exchange_XODE 
    | FIX_Exchange_XPRI 
    | FIX_Exchange_XUAX 
    | FIX_Exchange_XUKR 
    | FIX_Exchange_DGCX 
    | FIX_Exchange_DIFX 
    | FIX_Exchange_DUMX 
    | FIX_Exchange_XADS 
    | FIX_Exchange_XDFM 
    | FIX_Exchange_AQXE 
    | FIX_Exchange_ARAX 
    | FIX_Exchange_ATLB 
    | FIX_Exchange_BALT 
    | FIX_Exchange_BLTX 
    | FIX_Exchange_BCXE 
    | FIX_Exchange_BATE 
    | FIX_Exchange_CHIX 
    | FIX_Exchange_BATD 
    | FIX_Exchange_CHID 
    | FIX_Exchange_BATF 
    | FIX_Exchange_CHIO 
    | FIX_Exchange_BOTC 
    | FIX_Exchange_BATP 
    | FIX_Exchange_BARO 
    | FIX_Exchange_BARK 
    | FIX_Exchange_BART 
    | FIX_Exchange_LISX 
    | FIX_Exchange_BGCI 
    | FIX_Exchange_BGCB 
    | FIX_Exchange_BLOX 
    | FIX_Exchange_BMTF 
    | FIX_Exchange_BOAT 
    | FIX_Exchange_BOSC 
    | FIX_Exchange_BRNX 
    | FIX_Exchange_CCO2 
    | FIX_Exchange_CGME 
    | FIX_Exchange_CHEV 
    | FIX_Exchange_BLNK 
    | FIX_Exchange_CMEE 
    | FIX_Exchange_CMEC 
    | FIX_Exchange_CMED 
    | FIX_Exchange_CMMT 
    | FIX_Exchange_CRYP 
    | FIX_Exchange_CSEU 
    | FIX_Exchange_CSCF 
    | FIX_Exchange_DBIX 
    | FIX_Exchange_DBDC 
    | FIX_Exchange_DBCX 
    | FIX_Exchange_DBCR 
    | FIX_Exchange_DBMO 
    | FIX_Exchange_DBSE 
    | FIX_Exchange_EMBX 
    | FIX_Exchange_ENCL 
    | FIX_Exchange_EQLD 
    | FIX_Exchange_EXEU 
    | FIX_Exchange_EXMP 
    | FIX_Exchange_EXOR 
    | FIX_Exchange_EXVP 
    | FIX_Exchange_EXBO 
    | FIX_Exchange_EXSI 
    | FIX_Exchange_EXCP 
    | FIX_Exchange_EXLP 
    | FIX_Exchange_EXDC 
    | FIX_Exchange_FAIR 
    | FIX_Exchange_GEMX 
    | FIX_Exchange_GFIC 
    | FIX_Exchange_GFIF 
    | FIX_Exchange_GFIN 
    | FIX_Exchange_GFIR 
    | FIX_Exchange_GMEG 
    | FIX_Exchange_XLDX 
    | FIX_Exchange_XGDX 
    | FIX_Exchange_XGSX 
    | FIX_Exchange_XGCX 
    | FIX_Exchange_GRIF 
    | FIX_Exchange_GRSE 
    | FIX_Exchange_GSIL 
    | FIX_Exchange_GSSI 
    | FIX_Exchange_GSBX 
    | FIX_Exchange_HSXE 
    | FIX_Exchange_IBAL 
    | FIX_Exchange_ICAP 
    | FIX_Exchange_ICAH 
    | FIX_Exchange_BTEE 
    | FIX_Exchange_ICEN 
    | FIX_Exchange_ICSE 
    | FIX_Exchange_ICTQ 
    | FIX_Exchange_WCLK 
    | FIX_Exchange_ISDX 
    | FIX_Exchange_EBSX 
    | FIX_Exchange_NEXS 
    | FIX_Exchange_IGDL 
    | FIX_Exchange_IFEU 
    | FIX_Exchange_CXRT 
    | FIX_Exchange_IFLO 
    | FIX_Exchange_IFLL 
    | FIX_Exchange_IFUT 
    | FIX_Exchange_IFLX 
    | FIX_Exchange_IFEN 
    | FIX_Exchange_ISWA 
    | FIX_Exchange_JPSI 
    | FIX_Exchange_KLEU 
    | FIX_Exchange_LCUR 
    | FIX_Exchange_LIQU 
    | FIX_Exchange_LIQH 
    | FIX_Exchange_LIQF 
    | FIX_Exchange_LMAX 
    | FIX_Exchange_LMAD 
    | FIX_Exchange_LMAE 
    | FIX_Exchange_LMAF 
    | FIX_Exchange_LMAO 
    | FIX_Exchange_LMEC 
    | FIX_Exchange_LOTC 
    | FIX_Exchange_PLDX 
    | FIX_Exchange_LPPM 
    | FIX_Exchange_MAEL 
    | FIX_Exchange_MFGL 
    | FIX_Exchange_MLXN 
    | FIX_Exchange_MLAX 
    | FIX_Exchange_MLEU 
    | FIX_Exchange_MLVE 
    | FIX_Exchange_MSIP 
    | FIX_Exchange_MYTR 
    | FIX_Exchange_N2EX 
    | FIX_Exchange_NDCM 
    | FIX_Exchange_NOFF 
    | FIX_Exchange_NURO 
    | FIX_Exchange_XNLX 
    | FIX_Exchange_NURD 
    | FIX_Exchange_NXEU 
    | FIX_Exchange_OTCE 
    | FIX_Exchange_PEEL 
    | FIX_Exchange_XRSP 
    | FIX_Exchange_XPHX 
    | FIX_Exchange_PIEU 
    | FIX_Exchange_PIRM 
    | FIX_Exchange_QWIX 
    | FIX_Exchange_RBCE 
    | FIX_Exchange_RBSX 
    | FIX_Exchange_RTSL 
    | FIX_Exchange_SECF 
    | FIX_Exchange_SGMX 
    | FIX_Exchange_SHAR 
    | FIX_Exchange_SPEC 
    | FIX_Exchange_SPRZ 
    | FIX_Exchange_SSEX 
    | FIX_Exchange_SWAP 
    | FIX_Exchange_TFSV 
    | FIX_Exchange_TPIE 
    | FIX_Exchange_TRDE 
    | FIX_Exchange_TCDS 
    | FIX_Exchange_TRDX 
    | FIX_Exchange_VOLA 
    | FIX_Exchange_TFSG 
    | FIX_Exchange_PARX 
    | FIX_Exchange_ELIX 
    | FIX_Exchange_EMCH 
    | FIX_Exchange_TREU 
    | FIX_Exchange_TRQX 
    | FIX_Exchange_TRQM 
    | FIX_Exchange_UBSL 
    | FIX_Exchange_UBSE 
    | FIX_Exchange_UKGD 
    | FIX_Exchange_UKPX 
    | FIX_Exchange_VEGA 
    | FIX_Exchange_WINS 
    | FIX_Exchange_XALT 
    | FIX_Exchange_XCOR 
    | FIX_Exchange_XGCL 
    | FIX_Exchange_XLBM 
    | FIX_Exchange_XLCH 
    | FIX_Exchange_XLDN 
    | FIX_Exchange_XLME 
    | FIX_Exchange_XLON 
    | FIX_Exchange_XLOD 
    | FIX_Exchange_XMTS 
    | FIX_Exchange_HUNG 
    | FIX_Exchange_PRME 
    | FIX_Exchange_AMTS 
    | FIX_Exchange_EMTS 
    | FIX_Exchange_GMTS 
    | FIX_Exchange_IMTS 
    | FIX_Exchange_MCZK 
    | FIX_Exchange_MTSA 
    | FIX_Exchange_MTSG 
    | FIX_Exchange_MTSS 
    | FIX_Exchange_RMTS 
    | FIX_Exchange_SMTS 
    | FIX_Exchange_VMTS 
    | FIX_Exchange_BVUK 
    | FIX_Exchange_PORT 
    | FIX_Exchange_MTSW 
    | FIX_Exchange_XSGA 
    | FIX_Exchange_XSMP 
    | FIX_Exchange_XSWB 
    | FIX_Exchange_XTUP 
    | FIX_Exchange_TPEQ 
    | FIX_Exchange_TBEN 
    | FIX_Exchange_TBLA 
    | FIX_Exchange_TPCD 
    | FIX_Exchange_TPFD 
    | FIX_Exchange_TPRE 
    | FIX_Exchange_TPSD 
    | FIX_Exchange_XTPE 
    | FIX_Exchange_TPEL 
    | FIX_Exchange_TPSL 
    | FIX_Exchange_XUBS 
    | FIX_Exchange_AATS 
    | FIX_Exchange_AQUA 
    | FIX_Exchange_ATDF 
    | FIX_Exchange_CORE 
    | FIX_Exchange_BAML 
    | FIX_Exchange_MLVX 
    | FIX_Exchange_MLCO 
    | FIX_Exchange_BARX 
    | FIX_Exchange_BARD 
    | FIX_Exchange_BARL 
    | FIX_Exchange_BCDX 
    | FIX_Exchange_BATS 
    | FIX_Exchange_BATO 
    | FIX_Exchange_BATY 
    | FIX_Exchange_BZXD 
    | FIX_Exchange_BYXD 
    | FIX_Exchange_BBSF 
    | FIX_Exchange_BGCF 
    | FIX_Exchange_BGCD 
    | FIX_Exchange_BHSF 
    | FIX_Exchange_BIDS 
    | FIX_Exchange_BLTD 
    | FIX_Exchange_BPOL 
    | FIX_Exchange_BNYC 
    | FIX_Exchange_VTEX 
    | FIX_Exchange_NYFX 
    | FIX_Exchange_BTEC 
    | FIX_Exchange_ICSU 
    | FIX_Exchange_CDED 
    | FIX_Exchange_CGMI 
    | FIX_Exchange_CGMU 
    | FIX_Exchange_CICX 
    | FIX_Exchange_LQFI 
    | FIX_Exchange_CBLC 
    | FIX_Exchange_CMSF 
    | FIX_Exchange_CRED 
    | FIX_Exchange_CAES 
    | FIX_Exchange_CSLP 
    | FIX_Exchange_DBSX 
    | FIX_Exchange_DEAL 
    | FIX_Exchange_EDGE 
    | FIX_Exchange_EDDP 
    | FIX_Exchange_EDGA 
    | FIX_Exchange_EDGD 
    | FIX_Exchange_EDGX 
    | FIX_Exchange_EDGO 
    | FIX_Exchange_EGMT 
    | FIX_Exchange_ERIS 
    | FIX_Exchange_FAST 
    | FIX_Exchange_FINR 
    | FIX_Exchange_FINN 
    | FIX_Exchange_FINO 
    | FIX_Exchange_FINY 
    | FIX_Exchange_XADF 
    | FIX_Exchange_OOTC 
    | FIX_Exchange_FSEF 
    | FIX_Exchange_FXAL 
    | FIX_Exchange_FXCM 
    | FIX_Exchange_G1XX 
    | FIX_Exchange_GLLC 
    | FIX_Exchange_GLPS 
    | FIX_Exchange_GLPX 
    | FIX_Exchange_GOVX 
    | FIX_Exchange_GREE 
    | FIX_Exchange_GSEF 
    | FIX_Exchange_GTCO 
    | FIX_Exchange_GTXS 
    | FIX_Exchange_HEGX 
    | FIX_Exchange_HPPO 
    | FIX_Exchange_HSFX 
    | FIX_Exchange_ICEL 
    | FIX_Exchange_IEXG 
    | FIX_Exchange_IFUS 
    | FIX_Exchange_IEPA 
    | FIX_Exchange_IMFX 
    | FIX_Exchange_IMAG 
    | FIX_Exchange_IMBD 
    | FIX_Exchange_IMCO 
    | FIX_Exchange_IMCR 
    | FIX_Exchange_IMEN 
    | FIX_Exchange_IMEQ 
    | FIX_Exchange_IMIR 
    | FIX_Exchange_IFED 
    | FIX_Exchange_IMCG 
    | FIX_Exchange_IMCC 
    | FIX_Exchange_ICES 
    | FIX_Exchange_ISDA 
    | FIX_Exchange_ITGI 
    | FIX_Exchange_JEFX 
    | FIX_Exchange_JPBX 
    | FIX_Exchange_JPMX 
    | FIX_Exchange_JSES 
    | FIX_Exchange_JSJX 
    | FIX_Exchange_KNIG 
    | FIX_Exchange_KNCM 
    | FIX_Exchange_KNEM 
    | FIX_Exchange_KNLI 
    | FIX_Exchange_KNMX 
    | FIX_Exchange_LASF 
    | FIX_Exchange_LEVL 
    | FIX_Exchange_LIUS 
    | FIX_Exchange_LIUH 
    | FIX_Exchange_LIFI 
    | FIX_Exchange_LQED 
    | FIX_Exchange_LTAA 
    | FIX_Exchange_LMNX 
    | FIX_Exchange_MIHI 
    | FIX_Exchange_XMIO 
    | FIX_Exchange_MPRL 
    | FIX_Exchange_MSCO 
    | FIX_Exchange_MSPL 
    | FIX_Exchange_MSRP 
    | FIX_Exchange_MSTX 
    | FIX_Exchange_MSLP 
    | FIX_Exchange_MTUS 
    | FIX_Exchange_BVUS 
    | FIX_Exchange_MTSB 
    | FIX_Exchange_MTXX 
    | FIX_Exchange_MTXM 
    | FIX_Exchange_MTXC 
    | FIX_Exchange_MTXS 
    | FIX_Exchange_MTXA 
    | FIX_Exchange_NBLX 
    | FIX_Exchange_NFSC 
    | FIX_Exchange_NFSA 
    | FIX_Exchange_NFSD 
    | FIX_Exchange_XSTM 
    | FIX_Exchange_NMRA 
    | FIX_Exchange_NODX 
    | FIX_Exchange_NXUS 
    | FIX_Exchange_NYPC 
    | FIX_Exchange_OLLC 
    | FIX_Exchange_OPRA 
    | FIX_Exchange_OTCM 
    | FIX_Exchange_OTCB 
    | FIX_Exchange_OTCQ 
    | FIX_Exchange_PINC 
    | FIX_Exchange_PINI 
    | FIX_Exchange_PINL 
    | FIX_Exchange_PINX 
    | FIX_Exchange_PSGM 
    | FIX_Exchange_CAVE 
    | FIX_Exchange_PDQX 
    | FIX_Exchange_PDQD 
    | FIX_Exchange_PIPE 
    | FIX_Exchange_PRSE 
    | FIX_Exchange_PULX 
    | FIX_Exchange_RICX 
    | FIX_Exchange_RICD 
    | FIX_Exchange_SCXS 
    | FIX_Exchange_SGMA 
    | FIX_Exchange_SGMT 
    | FIX_Exchange_SHAW 
    | FIX_Exchange_SHAD 
    | FIX_Exchange_SOHO 
    | FIX_Exchange_SSTX 
    | FIX_Exchange_TERA 
    | FIX_Exchange_TFSU 
    | FIX_Exchange_THRE 
    | FIX_Exchange_TPSE 
    | FIX_Exchange_TRCK 
    | FIX_Exchange_TRUX 
    | FIX_Exchange_TRU1 
    | FIX_Exchange_TRU2 
    | FIX_Exchange_TRWB 
    | FIX_Exchange_BNDD 
    | FIX_Exchange_TWSF 
    | FIX_Exchange_DWSF 
    | FIX_Exchange_TSBX 
    | FIX_Exchange_TSEF 
    | FIX_Exchange_UBSA 
    | FIX_Exchange_UBSP 
    | FIX_Exchange_VFCM 
    | FIX_Exchange_WELX 
    | FIX_Exchange_WSAG 
    | FIX_Exchange_XAQS 
    | FIX_Exchange_XBOX 
    | FIX_Exchange_XCBO 
    | FIX_Exchange_C2OX 
    | FIX_Exchange_CBSX 
    | FIX_Exchange_XCBF 
    | FIX_Exchange_XCBT 
    | FIX_Exchange_FCBT 
    | FIX_Exchange_XKBT 
    | FIX_Exchange_XCFF 
    | FIX_Exchange_XCHI 
    | FIX_Exchange_XCIS 
    | FIX_Exchange_XCME 
    | FIX_Exchange_FCME 
    | FIX_Exchange_GLBX 
    | FIX_Exchange_XIMM 
    | FIX_Exchange_XIOM 
    | FIX_Exchange_CMES 
    | FIX_Exchange_CBTS 
    | FIX_Exchange_CECS 
    | FIX_Exchange_NYMS 
    | FIX_Exchange_XCUR 
    | FIX_Exchange_XELX 
    | FIX_Exchange_XFCI 
    | FIX_Exchange_XGMX 
    | FIX_Exchange_XINS 
    | FIX_Exchange_IBLX 
    | FIX_Exchange_ICBX 
    | FIX_Exchange_ICRO 
    | FIX_Exchange_IIDX 
    | FIX_Exchange_RCBX 
    | FIX_Exchange_MOCX 
    | FIX_Exchange_XISX 
    | FIX_Exchange_XISA 
    | FIX_Exchange_XISE 
    | FIX_Exchange_GMNI 
    | FIX_Exchange_MCRY 
    | FIX_Exchange_XMER 
    | FIX_Exchange_XMGE 
    | FIX_Exchange_XNAS 
    | FIX_Exchange_XBXO 
    | FIX_Exchange_BOSD 
    | FIX_Exchange_NASD 
    | FIX_Exchange_XBRT 
    | FIX_Exchange_XNCM 
    | FIX_Exchange_XNDQ 
    | FIX_Exchange_XNGS 
    | FIX_Exchange_XNIM 
    | FIX_Exchange_XNMS 
    | FIX_Exchange_XPBT 
    | FIX_Exchange_XPHL 
    | FIX_Exchange_XPHO 
    | FIX_Exchange_XPOR 
    | FIX_Exchange_XPSX 
    | FIX_Exchange_XBOS 
    | FIX_Exchange_ESPD 
    | FIX_Exchange_XNYM 
    | FIX_Exchange_XCEC 
    | FIX_Exchange_XNYE 
    | FIX_Exchange_XNYL 
    | FIX_Exchange_XNYS 
    | FIX_Exchange_ALDP 
    | FIX_Exchange_AMXO 
    | FIX_Exchange_ARCD 
    | FIX_Exchange_ARCO 
    | FIX_Exchange_ARCX 
    | FIX_Exchange_NYSD 
    | FIX_Exchange_XASE 
    | FIX_Exchange_XNLI 
    | FIX_Exchange_XOCH 
    | FIX_Exchange_XOTC 
    | FIX_Exchange_XSEF 
    | FIX_Exchange_XWEE 
    | FIX_Exchange_BVUR 
    | FIX_Exchange_UFEX 
    | FIX_Exchange_XMNT 
    | FIX_Exchange_XCET 
    | FIX_Exchange_XCUE 
    | FIX_Exchange_XKCE 
    | FIX_Exchange_XSTE 
    | FIX_Exchange_XUNI 
    | FIX_Exchange_GXMA 
    | FIX_Exchange_BVCA 
    | FIX_Exchange_HSTC 
    | FIX_Exchange_XHNX 
    | FIX_Exchange_XSTC 
    | FIX_Exchange_XLUS 
    | FIX_Exchange_XZIM 
    | FIX_Exchange_XOFF 
    | FIX_Exchange_XXXX 
;;
