(* @meta[imandra_ignore] on @end *)
open Full_app_enums;;
(* @meta[imandra_ignore] off @end *)

let parse_AccountType ( str ) =
    match str with
        | "1" -> (Some (FIX_AccountType_CarriedCustomerSide))
        | "2" -> (Some (FIX_AccountType_CarriedNonCustomerSide))
        | "3" -> (Some (FIX_AccountType_HouseTrader))
        | "4" -> (Some (FIX_AccountType_FloorTrader))
        | "6" -> (Some (FIX_AccountType_CarriedNonCustomerSideCrossMargined))
        | "7" -> (Some (FIX_AccountType_HouseTraderCrossMargined))
        | "8" -> (Some (FIX_AccountType_JointBackOfficeAccount))
        | _ -> (None)
;;

let parse_AcctIDSource ( str ) =
    match str with
        | "1" -> (Some (FIX_AcctIDSource_BIC))
        | "2" -> (Some (FIX_AcctIDSource_SIDCode))
        | "3" -> (Some (FIX_AcctIDSource_TFM))
        | "4" -> (Some (FIX_AcctIDSource_OMGEO))
        | "5" -> (Some (FIX_AcctIDSource_DTCCCode))
        | "99" -> (Some (FIX_AcctIDSource_Other))
        | _ -> (None)
;;

let parse_Adjustment ( str ) =
    match str with
        | "1" -> (Some (FIX_Adjustment_Cancel))
        | "2" -> (Some (FIX_Adjustment_Error))
        | "3" -> (Some (FIX_Adjustment_Correction))
        | _ -> (None)
;;

let parse_AdjustmentType ( str ) =
    match str with
        | "0" -> (Some (FIX_AdjustmentType_ProcessRequestAsMarginDisposition))
        | "1" -> (Some (FIX_AdjustmentType_DeltaPlus))
        | "2" -> (Some (FIX_AdjustmentType_DeltaMinus))
        | "3" -> (Some (FIX_AdjustmentType_Final))
        | _ -> (None)
;;

let parse_AdvSide ( str ) =
    match str with
        | "B" -> (Some (FIX_AdvSide_Buy))
        | "S" -> (Some (FIX_AdvSide_Sell))
        | "X" -> (Some (FIX_AdvSide_Cross))
        | "T" -> (Some (FIX_AdvSide_Trade))
        | _ -> (None)
;;

let parse_AdvTransType ( str ) =
    match str with
        | "N" -> (Some (FIX_AdvTransType_New))
        | "C" -> (Some (FIX_AdvTransType_Cancel))
        | "R" -> (Some (FIX_AdvTransType_Replace))
        | _ -> (None)
;;

let parse_AffirmStatus ( str ) =
    match str with
        | "1" -> (Some (FIX_AffirmStatus_Received))
        | "2" -> (Some (FIX_AffirmStatus_ConfirmRejected))
        | "3" -> (Some (FIX_AffirmStatus_Affirmed))
        | _ -> (None)
;;

let parse_AggregatedBook ( str ) =
    match str with
        | "Y" -> (Some (FIX_AggregatedBook_BookEntriesToBeAggregated))
        | "N" -> (Some (FIX_AggregatedBook_BookEntriesShouldNotBeAggregated))
        | _ -> (None)
;;

let parse_AllocAccountType ( str ) =
    match str with
        | "1" -> (Some (FIX_AllocAccountType_CarriedCustomerSide))
        | "2" -> (Some (FIX_AllocAccountType_CarriedNonCustomerSide))
        | "3" -> (Some (FIX_AllocAccountType_HouseTrader))
        | "4" -> (Some (FIX_AllocAccountType_FloorTrader))
        | "6" -> (Some (FIX_AllocAccountType_CarriedNonCustomerSideCrossMargined))
        | "7" -> (Some (FIX_AllocAccountType_HouseTraderCrossMargined))
        | "8" -> (Some (FIX_AllocAccountType_JointBackOfficeAccount))
        | _ -> (None)
;;

let parse_AllocCancReplaceReason ( str ) =
    match str with
        | "1" -> (Some (FIX_AllocCancReplaceReason_OriginalDetailsIncomplete))
        | "2" -> (Some (FIX_AllocCancReplaceReason_ChangeInUnderlyingOrderDetails))
        | "99" -> (Some (FIX_AllocCancReplaceReason_Other))
        | _ -> (None)
;;

let parse_AllocHandlInst ( str ) =
    match str with
        | "1" -> (Some (FIX_AllocHandlInst_Match))
        | "2" -> (Some (FIX_AllocHandlInst_Forward))
        | "3" -> (Some (FIX_AllocHandlInst_ForwardAndMatch))
        | _ -> (None)
;;

let parse_AllocIntermedReqType ( str ) =
    match str with
        | "1" -> (Some (FIX_AllocIntermedReqType_PendingAccept))
        | "2" -> (Some (FIX_AllocIntermedReqType_PendingRelease))
        | "3" -> (Some (FIX_AllocIntermedReqType_PendingReversal))
        | "4" -> (Some (FIX_AllocIntermedReqType_Accept))
        | "5" -> (Some (FIX_AllocIntermedReqType_BlockLevelReject))
        | "6" -> (Some (FIX_AllocIntermedReqType_AccountLevelReject))
        | _ -> (None)
;;

let parse_AllocLinkType ( str ) =
    match str with
        | "0" -> (Some (FIX_AllocLinkType_FXNetting))
        | "1" -> (Some (FIX_AllocLinkType_FXSwap))
        | _ -> (None)
;;

let parse_AllocNoOrdersType ( str ) =
    match str with
        | "0" -> (Some (FIX_AllocNoOrdersType_NotSpecified))
        | "1" -> (Some (FIX_AllocNoOrdersType_ExplicitListProvided))
        | _ -> (None)
;;

let parse_AllocRejCode ( str ) =
    match str with
        | "0" -> (Some (FIX_AllocRejCode_UnknownAccount))
        | "1" -> (Some (FIX_AllocRejCode_IncorrectQuantity))
        | "2" -> (Some (FIX_AllocRejCode_IncorrectAveragegPrice))
        | "3" -> (Some (FIX_AllocRejCode_UnknownExecutingBrokerMnemonic))
        | "4" -> (Some (FIX_AllocRejCode_CommissionDifference))
        | "5" -> (Some (FIX_AllocRejCode_UnknownOrderID))
        | "6" -> (Some (FIX_AllocRejCode_UnknownListID))
        | "7" -> (Some (FIX_AllocRejCode_OtherSeeText))
        | "8" -> (Some (FIX_AllocRejCode_IncorrectAllocatedQuantity))
        | "9" -> (Some (FIX_AllocRejCode_CalculationDifference))
        | "10" -> (Some (FIX_AllocRejCode_UnknownOrStaleExecID))
        | "11" -> (Some (FIX_AllocRejCode_MismatchedData))
        | "12" -> (Some (FIX_AllocRejCode_UnknownClOrdID))
        | "13" -> (Some (FIX_AllocRejCode_WarehouseRequestRejected))
        | _ -> (None)
;;

let parse_AllocReportType ( str ) =
    match str with
        | "3" -> (Some (FIX_AllocReportType_SellsideCalculatedUsingPreliminary))
        | "4" -> (Some (FIX_AllocReportType_SellsideCalculatedWithoutPreliminary))
        | "5" -> (Some (FIX_AllocReportType_WarehouseRecap))
        | "8" -> (Some (FIX_AllocReportType_RequestToIntermediary))
        | _ -> (None)
;;

let parse_AllocSettlInstType ( str ) =
    match str with
        | "0" -> (Some (FIX_AllocSettlInstType_UseDefaultInstructions))
        | "1" -> (Some (FIX_AllocSettlInstType_DeriveFromParametersProvided))
        | "2" -> (Some (FIX_AllocSettlInstType_FullDetailsProvided))
        | "3" -> (Some (FIX_AllocSettlInstType_SSIDBIDsProvided))
        | "4" -> (Some (FIX_AllocSettlInstType_PhoneForInstructions))
        | _ -> (None)
;;

let parse_AllocStatus ( str ) =
    match str with
        | "0" -> (Some (FIX_AllocStatus_Accepted))
        | "1" -> (Some (FIX_AllocStatus_BlockLevelReject))
        | "2" -> (Some (FIX_AllocStatus_AccountLevelReject))
        | "3" -> (Some (FIX_AllocStatus_Received))
        | "4" -> (Some (FIX_AllocStatus_Incomplete))
        | "5" -> (Some (FIX_AllocStatus_RejectedByIntermediary))
        | _ -> (None)
;;

let parse_AllocTransType ( str ) =
    match str with
        | "0" -> (Some (FIX_AllocTransType_New))
        | "1" -> (Some (FIX_AllocTransType_Replace))
        | "2" -> (Some (FIX_AllocTransType_Cancel))
        | _ -> (None)
;;

let parse_AllocType ( str ) =
    match str with
        | "1" -> (Some (FIX_AllocType_Calculated))
        | "2" -> (Some (FIX_AllocType_Preliminary))
        | "5" -> (Some (FIX_AllocType_ReadyToBook))
        | "7" -> (Some (FIX_AllocType_WarehouseInstruction))
        | "8" -> (Some (FIX_AllocType_RequestToIntermediary))
        | _ -> (None)
;;

let parse_ApplQueueAction ( str ) =
    match str with
        | "0" -> (Some (FIX_ApplQueueAction_NoActionTaken))
        | "1" -> (Some (FIX_ApplQueueAction_QueueFlushed))
        | "2" -> (Some (FIX_ApplQueueAction_OverlayLast))
        | "3" -> (Some (FIX_ApplQueueAction_EndSession))
        | _ -> (None)
;;

let parse_ApplQueueResolution ( str ) =
    match str with
        | "0" -> (Some (FIX_ApplQueueResolution_NoActionTaken))
        | "1" -> (Some (FIX_ApplQueueResolution_QueueFlushed))
        | "2" -> (Some (FIX_ApplQueueResolution_OverlayLast))
        | "3" -> (Some (FIX_ApplQueueResolution_EndSession))
        | _ -> (None)
;;

let parse_AssignmentMethod ( str ) =
    match str with
        | "R" -> (Some (FIX_AssignmentMethod_Random))
        | "P" -> (Some (FIX_AssignmentMethod_ProRata))
        | _ -> (None)
;;

let parse_AvgPxIndicator ( str ) =
    match str with
        | "0" -> (Some (FIX_AvgPxIndicator_NoAveragePricing))
        | "1" -> (Some (FIX_AvgPxIndicator_Trade))
        | "2" -> (Some (FIX_AvgPxIndicator_LastTrade))
        | _ -> (None)
;;

let parse_BasisPxType ( str ) =
    match str with
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
;;

let parse_BidDescriptorType ( str ) =
    match str with
        | "1" -> (Some (FIX_BidDescriptorType_Sector))
        | "2" -> (Some (FIX_BidDescriptorType_Country))
        | "3" -> (Some (FIX_BidDescriptorType_Index))
        | _ -> (None)
;;

let parse_BidRequestTransType ( str ) =
    match str with
        | "N" -> (Some (FIX_BidRequestTransType_New))
        | "C" -> (Some (FIX_BidRequestTransType_Cancel))
        | _ -> (None)
;;

let parse_BidTradeType ( str ) =
    match str with
        | "R" -> (Some (FIX_BidTradeType_RiskTrade))
        | "G" -> (Some (FIX_BidTradeType_VWAPGuarantee))
        | "A" -> (Some (FIX_BidTradeType_Agency))
        | "J" -> (Some (FIX_BidTradeType_GuaranteedClose))
        | _ -> (None)
;;

let parse_BidType ( str ) =
    match str with
        | "1" -> (Some (FIX_BidType_NonDisclosed))
        | "2" -> (Some (FIX_BidType_Disclosed))
        | "3" -> (Some (FIX_BidType_NoBiddingProcess))
        | _ -> (None)
;;

let parse_BookingType ( str ) =
    match str with
        | "0" -> (Some (FIX_BookingType_RegularBooking))
        | "1" -> (Some (FIX_BookingType_CFD))
        | "2" -> (Some (FIX_BookingType_TotalReturnSwap))
        | _ -> (None)
;;

let parse_BookingUnit ( str ) =
    match str with
        | "0" -> (Some (FIX_BookingUnit_EachPartialExecutionIsABookableUnit))
        | "1" -> (Some (FIX_BookingUnit_AggregatePartialExecutionsOnThisOrder))
        | "2" -> (Some (FIX_BookingUnit_AggregateExecutionsForThisSymbol))
        | _ -> (None)
;;

let parse_BusinessRejectReason ( str ) =
    match str with
        | "0" -> (Some (FIX_BusinessRejectReason_Other))
        | "1" -> (Some (FIX_BusinessRejectReason_UnknownID))
        | "2" -> (Some (FIX_BusinessRejectReason_UnknownSecurity))
        | "3" -> (Some (FIX_BusinessRejectReason_UnsupportedMessageType))
        | "4" -> (Some (FIX_BusinessRejectReason_ApplicationNotAvailable))
        | "5" -> (Some (FIX_BusinessRejectReason_ConditionallyRequiredFieldMissing))
        | "6" -> (Some (FIX_BusinessRejectReason_NotAuthorized))
        | "7" -> (Some (FIX_BusinessRejectReason_DeliverToFirmNotAvailableAtThisTime))
        | _ -> (None)
;;

let parse_CPProgram ( str ) =
    match str with
        | "1" -> (Some (FIX_CPProgram_Program3a3))
        | "2" -> (Some (FIX_CPProgram_Program42))
        | "99" -> (Some (FIX_CPProgram_Other))
        | _ -> (None)
;;

let parse_CancellationRights ( str ) =
    match str with
        | "Y" -> (Some (FIX_CancellationRights_Yes))
        | "N" -> (Some (FIX_CancellationRights_NoExecutionOnly))
        | "M" -> (Some (FIX_CancellationRights_NoWaiverAgreement))
        | "O" -> (Some (FIX_CancellationRights_NoInstitutional))
        | _ -> (None)
;;

let parse_CashMargin ( str ) =
    match str with
        | "1" -> (Some (FIX_CashMargin_Cash))
        | "2" -> (Some (FIX_CashMargin_MarginOpen))
        | "3" -> (Some (FIX_CashMargin_MarginClose))
        | _ -> (None)
;;

let parse_ClearingFeeIndicator ( str ) =
    match str with
        | "B" -> (Some (FIX_ClearingFeeIndicator_CBOEMember))
        | "C" -> (Some (FIX_ClearingFeeIndicator_NonMemberAndCustomer))
        | "E" -> (Some (FIX_ClearingFeeIndicator_EquityMemberAndClearingMember))
        | "F" -> (Some (FIX_ClearingFeeIndicator_FullAndAssociateMember))
        | "H" -> (Some (FIX_ClearingFeeIndicator_Firms106HAnd106J))
        | "I" -> (Some (FIX_ClearingFeeIndicator_GIM))
        | "L" -> (Some (FIX_ClearingFeeIndicator_Lessee106FEmployees))
        | "M" -> (Some (FIX_ClearingFeeIndicator_AllOtherOwnershipTypes))
        | "1" -> (Some (FIX_ClearingFeeIndicator_FirstYearDelegate))
        | "2" -> (Some (FIX_ClearingFeeIndicator_SecondYearDelegate))
        | "3" -> (Some (FIX_ClearingFeeIndicator_ThirdYearDelegate))
        | "4" -> (Some (FIX_ClearingFeeIndicator_FourthYearDelegate))
        | "5" -> (Some (FIX_ClearingFeeIndicator_FifthYearDelegate))
        | "9" -> (Some (FIX_ClearingFeeIndicator_SixthYearDelegate))
        | _ -> (None)
;;

let parse_ClearingInstruction ( str ) =
    match str with
        | "0" -> (Some (FIX_ClearingInstruction_ProcessNormally))
        | "1" -> (Some (FIX_ClearingInstruction_ExcludeFromAllNetting))
        | "2" -> (Some (FIX_ClearingInstruction_BilateralNettingOnly))
        | "3" -> (Some (FIX_ClearingInstruction_ExClearing))
        | "4" -> (Some (FIX_ClearingInstruction_SpecialTrade))
        | "5" -> (Some (FIX_ClearingInstruction_MultilateralNetting))
        | "6" -> (Some (FIX_ClearingInstruction_ClearAgainstCentralCounterparty))
        | "7" -> (Some (FIX_ClearingInstruction_ExcludeFromCentralCounterparty))
        | "8" -> (Some (FIX_ClearingInstruction_ManualMode))
        | "9" -> (Some (FIX_ClearingInstruction_AutomaticPostingMode))
        | "10" -> (Some (FIX_ClearingInstruction_AutomaticGiveUpMode))
        | "11" -> (Some (FIX_ClearingInstruction_QualifiedServiceRepresentativeQSR))
        | "12" -> (Some (FIX_ClearingInstruction_CustomerTrade))
        | "13" -> (Some (FIX_ClearingInstruction_SelfClearing))
        | _ -> (None)
;;

let parse_CollAction ( str ) =
    match str with
        | "0" -> (Some (FIX_CollAction_Retain))
        | "1" -> (Some (FIX_CollAction_Add))
        | "2" -> (Some (FIX_CollAction_Remove))
        | _ -> (None)
;;

let parse_CollAsgnReason ( str ) =
    match str with
        | "0" -> (Some (FIX_CollAsgnReason_Initial))
        | "1" -> (Some (FIX_CollAsgnReason_Scheduled))
        | "2" -> (Some (FIX_CollAsgnReason_TimeWarning))
        | "3" -> (Some (FIX_CollAsgnReason_MarginDeficiency))
        | "4" -> (Some (FIX_CollAsgnReason_MarginExcess))
        | "5" -> (Some (FIX_CollAsgnReason_ForwardCollateralDemand))
        | "6" -> (Some (FIX_CollAsgnReason_EventOfDefault))
        | "7" -> (Some (FIX_CollAsgnReason_AdverseTaxEvent))
        | _ -> (None)
;;

let parse_CollAsgnRejectReason ( str ) =
    match str with
        | "0" -> (Some (FIX_CollAsgnRejectReason_UnknownDeal))
        | "1" -> (Some (FIX_CollAsgnRejectReason_UnknownOrInvalidInstrument))
        | "2" -> (Some (FIX_CollAsgnRejectReason_UnauthorizedTransaction))
        | "3" -> (Some (FIX_CollAsgnRejectReason_InsufficientCollateral))
        | "4" -> (Some (FIX_CollAsgnRejectReason_InvalidTypeOfCollateral))
        | "5" -> (Some (FIX_CollAsgnRejectReason_ExcessiveSubstitution))
        | "99" -> (Some (FIX_CollAsgnRejectReason_Other))
        | _ -> (None)
;;

let parse_CollAsgnRespType ( str ) =
    match str with
        | "0" -> (Some (FIX_CollAsgnRespType_Received))
        | "1" -> (Some (FIX_CollAsgnRespType_Accepted))
        | "2" -> (Some (FIX_CollAsgnRespType_Declined))
        | "3" -> (Some (FIX_CollAsgnRespType_Rejected))
        | _ -> (None)
;;

let parse_CollAsgnTransType ( str ) =
    match str with
        | "0" -> (Some (FIX_CollAsgnTransType_New))
        | "1" -> (Some (FIX_CollAsgnTransType_Replace))
        | "2" -> (Some (FIX_CollAsgnTransType_Cancel))
        | "3" -> (Some (FIX_CollAsgnTransType_Release))
        | "4" -> (Some (FIX_CollAsgnTransType_Reverse))
        | _ -> (None)
;;

let parse_CollInquiryQualifier ( str ) =
    match str with
        | "0" -> (Some (FIX_CollInquiryQualifier_TradeDate))
        | "1" -> (Some (FIX_CollInquiryQualifier_GCInstrument))
        | "2" -> (Some (FIX_CollInquiryQualifier_CollateralInstrument))
        | "3" -> (Some (FIX_CollInquiryQualifier_SubstitutionEligible))
        | "4" -> (Some (FIX_CollInquiryQualifier_NotAssigned))
        | "5" -> (Some (FIX_CollInquiryQualifier_PartiallyAssigned))
        | "6" -> (Some (FIX_CollInquiryQualifier_FullyAssigned))
        | "7" -> (Some (FIX_CollInquiryQualifier_OutstandingTrades))
        | _ -> (None)
;;

let parse_CollInquiryResult ( str ) =
    match str with
        | "0" -> (Some (FIX_CollInquiryResult_Successful))
        | "1" -> (Some (FIX_CollInquiryResult_InvalidOrUnknownInstrument))
        | "2" -> (Some (FIX_CollInquiryResult_InvalidOrUnknownCollateralType))
        | "3" -> (Some (FIX_CollInquiryResult_InvalidParties))
        | "4" -> (Some (FIX_CollInquiryResult_InvalidTransportTypeRequested))
        | "5" -> (Some (FIX_CollInquiryResult_InvalidDestinationRequested))
        | "6" -> (Some (FIX_CollInquiryResult_NoCollateralFoundForTheTradeSpecified))
        | "7" -> (Some (FIX_CollInquiryResult_NoCollateralFoundForTheOrderSpecified))
        | "8" -> (Some (FIX_CollInquiryResult_CollateralInquiryTypeNotSupported))
        | "9" -> (Some (FIX_CollInquiryResult_UnauthorizedForCollateralInquiry))
        | "99" -> (Some (FIX_CollInquiryResult_Other))
        | _ -> (None)
;;

let parse_CollInquiryStatus ( str ) =
    match str with
        | "0" -> (Some (FIX_CollInquiryStatus_Accepted))
        | "1" -> (Some (FIX_CollInquiryStatus_AcceptedWithWarnings))
        | "2" -> (Some (FIX_CollInquiryStatus_Completed))
        | "3" -> (Some (FIX_CollInquiryStatus_CompletedWithWarnings))
        | "4" -> (Some (FIX_CollInquiryStatus_Rejected))
        | _ -> (None)
;;

let parse_CollStatus ( str ) =
    match str with
        | "0" -> (Some (FIX_CollStatus_Unassigned))
        | "1" -> (Some (FIX_CollStatus_PartiallyAssigned))
        | "2" -> (Some (FIX_CollStatus_AssignmentProposed))
        | "3" -> (Some (FIX_CollStatus_Assigned))
        | "4" -> (Some (FIX_CollStatus_Challenged))
        | _ -> (None)
;;

let parse_CommType ( str ) =
    match str with
        | "1" -> (Some (FIX_CommType_PerUnit))
        | "2" -> (Some (FIX_CommType_Percent))
        | "3" -> (Some (FIX_CommType_Absolute))
        | "4" -> (Some (FIX_CommType_PercentageWaivedCashDiscount))
        | "5" -> (Some (FIX_CommType_PercentageWaivedEnhancedUnits))
        | "6" -> (Some (FIX_CommType_PointsPerBondOrContract))
        | _ -> (None)
;;

let parse_ConfirmRejReason ( str ) =
    match str with
        | "1" -> (Some (FIX_ConfirmRejReason_MismatchedAccount))
        | "2" -> (Some (FIX_ConfirmRejReason_MissingSettlementInstructions))
        | "99" -> (Some (FIX_ConfirmRejReason_Other))
        | _ -> (None)
;;

let parse_ConfirmStatus ( str ) =
    match str with
        | "1" -> (Some (FIX_ConfirmStatus_Received))
        | "2" -> (Some (FIX_ConfirmStatus_MismatchedAccount))
        | "3" -> (Some (FIX_ConfirmStatus_MissingSettlementInstructions))
        | "4" -> (Some (FIX_ConfirmStatus_Confirmed))
        | "5" -> (Some (FIX_ConfirmStatus_RequestRejected))
        | _ -> (None)
;;

let parse_ConfirmTransType ( str ) =
    match str with
        | "0" -> (Some (FIX_ConfirmTransType_New))
        | "1" -> (Some (FIX_ConfirmTransType_Replace))
        | "2" -> (Some (FIX_ConfirmTransType_Cancel))
        | _ -> (None)
;;

let parse_ConfirmType ( str ) =
    match str with
        | "1" -> (Some (FIX_ConfirmType_Status))
        | "2" -> (Some (FIX_ConfirmType_Confirmation))
        | "3" -> (Some (FIX_ConfirmType_ConfirmationRequestRejected))
        | _ -> (None)
;;

let parse_ContAmtType ( str ) =
    match str with
        | "1" -> (Some (FIX_ContAmtType_CommissionAmount))
        | "2" -> (Some (FIX_ContAmtType_CommissionPercent))
        | "3" -> (Some (FIX_ContAmtType_InitialChargeAmount))
        | "4" -> (Some (FIX_ContAmtType_InitialChargePercent))
        | "5" -> (Some (FIX_ContAmtType_DiscountAmount))
        | "6" -> (Some (FIX_ContAmtType_DiscountPercent))
        | "7" -> (Some (FIX_ContAmtType_DilutionLevyAmount))
        | "8" -> (Some (FIX_ContAmtType_DilutionLevyPercent))
        | "9" -> (Some (FIX_ContAmtType_ExitChargeAmount))
        | "10" -> (Some (FIX_ContAmtType_ExitChargePercent))
        | "11" -> (Some (FIX_ContAmtType_FundBasedRenewalCommissionPercent))
        | "12" -> (Some (FIX_ContAmtType_ProjectedFundValue))
        | "13" -> (Some (FIX_ContAmtType_FundBasedRenewalCommissionOnOrder))
        | "14" -> (Some (FIX_ContAmtType_FundBasedRenewalCommissionOnFund))
        | "15" -> (Some (FIX_ContAmtType_NetSettlementAmount))
        | _ -> (None)
;;

let parse_CorporateAction ( str ) =
    match str with
        | "A" -> (Some (FIX_CorporateAction_ExDividend))
        | "B" -> (Some (FIX_CorporateAction_ExDistribution))
        | "C" -> (Some (FIX_CorporateAction_ExRights))
        | "D" -> (Some (FIX_CorporateAction_New))
        | "E" -> (Some (FIX_CorporateAction_ExInterest))
        | _ -> (None)
;;

let parse_CoveredOrUncovered ( str ) =
    match str with
        | "0" -> (Some (FIX_CoveredOrUncovered_Covered))
        | "1" -> (Some (FIX_CoveredOrUncovered_Uncovered))
        | _ -> (None)
;;

let parse_CrossPrioritization ( str ) =
    match str with
        | "0" -> (Some (FIX_CrossPrioritization_Unknown))
        | "1" -> (Some (FIX_CrossPrioritization_BuySideIsPrioritized))
        | "2" -> (Some (FIX_CrossPrioritization_SellSideIsPrioritized))
        | _ -> (None)
;;

let parse_CrossType ( str ) =
    match str with
        | "1" -> (Some (FIX_CrossType_CrossAON))
        | "2" -> (Some (FIX_CrossType_CrossIOC))
        | "3" -> (Some (FIX_CrossType_CrossOneSide))
        | "4" -> (Some (FIX_CrossType_CrossSamePrice))
        | _ -> (None)
;;

let parse_CustOrderCapacity ( str ) =
    match str with
        | "1" -> (Some (FIX_CustOrderCapacity_MemberTradingForTheirOwnAccount))
        | "2" -> (Some (FIX_CustOrderCapacity_ClearingFirmTradingForItsProprietaryAccount))
        | "3" -> (Some (FIX_CustOrderCapacity_MemberTradingForAnotherMember))
        | "4" -> (Some (FIX_CustOrderCapacity_AllOther))
        | _ -> (None)
;;

let parse_CxlRejReason ( str ) =
    match str with
        | "0" -> (Some (FIX_CxlRejReason_TooLateToCancel))
        | "1" -> (Some (FIX_CxlRejReason_UnknownOrder))
        | "2" -> (Some (FIX_CxlRejReason_BrokerCredit))
        | "3" -> (Some (FIX_CxlRejReason_OrderAlreadyInPendingStatus))
        | "4" -> (Some (FIX_CxlRejReason_UnableToProcessOrderMassCancelRequest))
        | "5" -> (Some (FIX_CxlRejReason_OrigOrdModTime))
        | "6" -> (Some (FIX_CxlRejReason_DuplicateClOrdID))
        | "99" -> (Some (FIX_CxlRejReason_Other))
        | _ -> (None)
;;

let parse_CxlRejResponseTo ( str ) =
    match str with
        | "1" -> (Some (FIX_CxlRejResponseTo_OrderCancelRequest))
        | "2" -> (Some (FIX_CxlRejResponseTo_OrderCancel))
        | _ -> (None)
;;

let parse_DKReason ( str ) =
    match str with
        | "A" -> (Some (FIX_DKReason_UnknownSymbol))
        | "B" -> (Some (FIX_DKReason_WrongSide))
        | "C" -> (Some (FIX_DKReason_QuantityExceedsOrder))
        | "D" -> (Some (FIX_DKReason_NoMatchingOrder))
        | "E" -> (Some (FIX_DKReason_PriceExceedsLimit))
        | "F" -> (Some (FIX_DKReason_CalculationDifference))
        | "Z" -> (Some (FIX_DKReason_Other))
        | _ -> (None)
;;

let parse_DayBookingInst ( str ) =
    match str with
        | "0" -> (Some (FIX_DayBookingInst_Auto))
        | "1" -> (Some (FIX_DayBookingInst_SpeakWithOrderInitiatorBeforeBooking))
        | "2" -> (Some (FIX_DayBookingInst_Accumulate))
        | _ -> (None)
;;

let parse_DeleteReason ( str ) =
    match str with
        | "0" -> (Some (FIX_DeleteReason_Cancellation))
        | "1" -> (Some (FIX_DeleteReason_Error))
        | _ -> (None)
;;

let parse_DeliveryForm ( str ) =
    match str with
        | "1" -> (Some (FIX_DeliveryForm_BookEntry))
        | "2" -> (Some (FIX_DeliveryForm_Bearer))
        | _ -> (None)
;;

let parse_DeliveryType ( str ) =
    match str with
        | "0" -> (Some (FIX_DeliveryType_VersusPayment))
        | "1" -> (Some (FIX_DeliveryType_Free))
        | "2" -> (Some (FIX_DeliveryType_TriParty))
        | "3" -> (Some (FIX_DeliveryType_HoldInCustody))
        | _ -> (None)
;;

let parse_DiscretionInst ( str ) =
    match str with
        | "0" -> (Some (FIX_DiscretionInst_RelatedToDisplayedPrice))
        | "1" -> (Some (FIX_DiscretionInst_RelatedToMarketPrice))
        | "2" -> (Some (FIX_DiscretionInst_RelatedToPrimaryPrice))
        | "3" -> (Some (FIX_DiscretionInst_RelatedToLocalPrimaryPrice))
        | "4" -> (Some (FIX_DiscretionInst_RelatedToMidpointPrice))
        | "5" -> (Some (FIX_DiscretionInst_RelatedToLastTradePrice))
        | "6" -> (Some (FIX_DiscretionInst_RelatedToVWAP))
        | _ -> (None)
;;

let parse_DiscretionLimitType ( str ) =
    match str with
        | "0" -> (Some (FIX_DiscretionLimitType_OrBetter))
        | "1" -> (Some (FIX_DiscretionLimitType_Strict))
        | "2" -> (Some (FIX_DiscretionLimitType_OrWorse))
        | _ -> (None)
;;

let parse_DiscretionMoveType ( str ) =
    match str with
        | "0" -> (Some (FIX_DiscretionMoveType_Floating))
        | "1" -> (Some (FIX_DiscretionMoveType_Fixed))
        | _ -> (None)
;;

let parse_DiscretionOffsetType ( str ) =
    match str with
        | "0" -> (Some (FIX_DiscretionOffsetType_Price))
        | "1" -> (Some (FIX_DiscretionOffsetType_BasisPoints))
        | "2" -> (Some (FIX_DiscretionOffsetType_Ticks))
        | "3" -> (Some (FIX_DiscretionOffsetType_PriceTier))
        | _ -> (None)
;;

let parse_DiscretionRoundDirection ( str ) =
    match str with
        | "1" -> (Some (FIX_DiscretionRoundDirection_MoreAggressive))
        | "2" -> (Some (FIX_DiscretionRoundDirection_MorePassive))
        | _ -> (None)
;;

let parse_DiscretionScope ( str ) =
    match str with
        | "1" -> (Some (FIX_DiscretionScope_Local))
        | "2" -> (Some (FIX_DiscretionScope_National))
        | "3" -> (Some (FIX_DiscretionScope_Global))
        | "4" -> (Some (FIX_DiscretionScope_NationalExcludingLocal))
        | _ -> (None)
;;

let parse_DistribPaymentMethod ( str ) =
    match str with
        | "1" -> (Some (FIX_DistribPaymentMethod_CREST))
        | "2" -> (Some (FIX_DistribPaymentMethod_NSCC))
        | "3" -> (Some (FIX_DistribPaymentMethod_Euroclear))
        | "4" -> (Some (FIX_DistribPaymentMethod_Clearstream))
        | "5" -> (Some (FIX_DistribPaymentMethod_Cheque))
        | "6" -> (Some (FIX_DistribPaymentMethod_TelegraphicTransfer))
        | "7" -> (Some (FIX_DistribPaymentMethod_FedWire))
        | "8" -> (Some (FIX_DistribPaymentMethod_DirectCredit))
        | "9" -> (Some (FIX_DistribPaymentMethod_ACHCredit))
        | "10" -> (Some (FIX_DistribPaymentMethod_BPAY))
        | "11" -> (Some (FIX_DistribPaymentMethod_HighValueClearingSystemHVACS))
        | "12" -> (Some (FIX_DistribPaymentMethod_ReinvestInFund))
        | _ -> (None)
;;

let parse_DlvyInstType ( str ) =
    match str with
        | "S" -> (Some (FIX_DlvyInstType_Securities))
        | "C" -> (Some (FIX_DlvyInstType_Cash))
        | _ -> (None)
;;

let parse_DueToRelated ( str ) =
    match str with
        | "Y" -> (Some (FIX_DueToRelated_RelatedToSecurityHalt))
        | "N" -> (Some (FIX_DueToRelated_NotRelatedToSecurityHalt))
        | _ -> (None)
;;

let parse_EmailType ( str ) =
    match str with
        | "0" -> (Some (FIX_EmailType_New))
        | "1" -> (Some (FIX_EmailType_Reply))
        | "2" -> (Some (FIX_EmailType_AdminReply))
        | _ -> (None)
;;

let parse_EncryptMethod ( str ) =
    match str with
        | "0" -> (Some (FIX_EncryptMethod_Unknown))
        | "1" -> (Some (FIX_EncryptMethod_PKCS))
        | "2" -> (Some (FIX_EncryptMethod_DES))
        | "3" -> (Some (FIX_EncryptMethod_PKCSDES))
        | "4" -> (Some (FIX_EncryptMethod_PGPDES))
        | "5" -> (Some (FIX_EncryptMethod_PGPDESMD5))
        | "6" -> (Some (FIX_EncryptMethod_PEM))
        | _ -> (None)
;;

let parse_EventType ( str ) =
    match str with
        | "1" -> (Some (FIX_EventType_Put))
        | "2" -> (Some (FIX_EventType_Call))
        | "3" -> (Some (FIX_EventType_Tender))
        | "4" -> (Some (FIX_EventType_SinkingFundCall))
        | "99" -> (Some (FIX_EventType_Other))
        | _ -> (None)
;;

let parse_ExchangeForPhysical ( str ) =
    match str with
        | "Y" -> (Some (FIX_ExchangeForPhysical_True))
        | "N" -> (Some (FIX_ExchangeForPhysical_False))
        | _ -> (None)
;;

let parse_ExecInst ( str ) =
    match str with
        | "1" -> (Some (FIX_ExecInst_NotHeld))
        | "2" -> (Some (FIX_ExecInst_Work))
        | "3" -> (Some (FIX_ExecInst_GoAlong))
        | "4" -> (Some (FIX_ExecInst_OverTheDay))
        | "5" -> (Some (FIX_ExecInst_Held))
        | "6" -> (Some (FIX_ExecInst_ParticipateDoNotInitiate))
        | "7" -> (Some (FIX_ExecInst_StrictScale))
        | "8" -> (Some (FIX_ExecInst_TryToScale))
        | "9" -> (Some (FIX_ExecInst_StayOnBidSide))
        | "0" -> (Some (FIX_ExecInst_StayOnOfferSide))
        | "A" -> (Some (FIX_ExecInst_NoCross))
        | "B" -> (Some (FIX_ExecInst_OKToCross))
        | "C" -> (Some (FIX_ExecInst_CallFirst))
        | "D" -> (Some (FIX_ExecInst_PercentOfVolume))
        | "E" -> (Some (FIX_ExecInst_DoNotIncrease))
        | "F" -> (Some (FIX_ExecInst_DoNotReduce))
        | "G" -> (Some (FIX_ExecInst_AllOrNone))
        | "H" -> (Some (FIX_ExecInst_ReinstateOnSystemFailure))
        | "I" -> (Some (FIX_ExecInst_InstitutionsOnly))
        | "J" -> (Some (FIX_ExecInst_ReinstateOnTradingHalt))
        | "K" -> (Some (FIX_ExecInst_CancelOnTradingHalt))
        | "L" -> (Some (FIX_ExecInst_LastPeg))
        | "M" -> (Some (FIX_ExecInst_MidPricePeg))
        | "N" -> (Some (FIX_ExecInst_NonNegotiable))
        | "O" -> (Some (FIX_ExecInst_OpeningPeg))
        | "P" -> (Some (FIX_ExecInst_MarketPeg))
        | "Q" -> (Some (FIX_ExecInst_CancelOnSystemFailure))
        | "R" -> (Some (FIX_ExecInst_PrimaryPeg))
        | "S" -> (Some (FIX_ExecInst_Suspend))
        | "U" -> (Some (FIX_ExecInst_CustomerDisplayInstruction))
        | "V" -> (Some (FIX_ExecInst_Netting))
        | "W" -> (Some (FIX_ExecInst_PegToVWAP))
        | "X" -> (Some (FIX_ExecInst_TradeAlong))
        | "Y" -> (Some (FIX_ExecInst_TryToStop))
        | "Z" -> (Some (FIX_ExecInst_CancelIfNotBest))
        | "a" -> (Some (FIX_ExecInst_TrailingStopPeg))
        | "b" -> (Some (FIX_ExecInst_StrictLimit))
        | "c" -> (Some (FIX_ExecInst_IgnorePriceValidityChecks))
        | "d" -> (Some (FIX_ExecInst_PegToLimitPrice))
        | "e" -> (Some (FIX_ExecInst_WorkToTargetStrategy))
        | _ -> (None)
;;

let parse_ExecPriceType ( str ) =
    match str with
        | "B" -> (Some (FIX_ExecPriceType_BidPrice))
        | "C" -> (Some (FIX_ExecPriceType_CreationPrice))
        | "D" -> (Some (FIX_ExecPriceType_CreationPricePlusAdjustmentPercent))
        | "E" -> (Some (FIX_ExecPriceType_CreationPricePlusAdjustmentAmount))
        | "O" -> (Some (FIX_ExecPriceType_OfferPrice))
        | "P" -> (Some (FIX_ExecPriceType_OfferPriceMinusAdjustmentPercent))
        | "Q" -> (Some (FIX_ExecPriceType_OfferPriceMinusAdjustmentAmount))
        | "S" -> (Some (FIX_ExecPriceType_SinglePrice))
        | _ -> (None)
;;

let parse_ExecRestatementReason ( str ) =
    match str with
        | "0" -> (Some (FIX_ExecRestatementReason_GTCorporateAction))
        | "1" -> (Some (FIX_ExecRestatementReason_GTRenewal))
        | "2" -> (Some (FIX_ExecRestatementReason_VerbalChange))
        | "3" -> (Some (FIX_ExecRestatementReason_RepricingOfOrder))
        | "4" -> (Some (FIX_ExecRestatementReason_BrokerOption))
        | "5" -> (Some (FIX_ExecRestatementReason_PartialDeclineOfOrderQty))
        | "6" -> (Some (FIX_ExecRestatementReason_CancelOnTradingHalt))
        | "7" -> (Some (FIX_ExecRestatementReason_CancelOnSystemFailure))
        | "8" -> (Some (FIX_ExecRestatementReason_Market))
        | "9" -> (Some (FIX_ExecRestatementReason_Canceled))
        | "10" -> (Some (FIX_ExecRestatementReason_WarehouseRecap))
        | "99" -> (Some (FIX_ExecRestatementReason_Other))
        | _ -> (None)
;;

let parse_ExecType ( str ) =
    match str with
        | "0" -> (Some (FIX_ExecType_New))
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
        | "F" -> (Some (FIX_ExecType_Trade))
        | "G" -> (Some (FIX_ExecType_TradeCorrect))
        | "H" -> (Some (FIX_ExecType_TradeCancel))
        | "I" -> (Some (FIX_ExecType_OrderStatus))
        | _ -> (None)
;;

let parse_ExerciseMethod ( str ) =
    match str with
        | "A" -> (Some (FIX_ExerciseMethod_Automatic))
        | "M" -> (Some (FIX_ExerciseMethod_Manual))
        | _ -> (None)
;;

let parse_ExpirationCycle ( str ) =
    match str with
        | "0" -> (Some (FIX_ExpirationCycle_ExpireOnTradingSessionClose))
        | "1" -> (Some (FIX_ExpirationCycle_ExpireOnTradingSessionOpen))
        | _ -> (None)
;;

let parse_FinancialStatus ( str ) =
    match str with
        | "1" -> (Some (FIX_FinancialStatus_Bankrupt))
        | "2" -> (Some (FIX_FinancialStatus_PendingDelisting))
        | _ -> (None)
;;

let parse_ForexReq ( str ) =
    match str with
        | "Y" -> (Some (FIX_ForexReq_ExecuteForexAfterSecurityTrade))
        | "N" -> (Some (FIX_ForexReq_DoNotExecuteForexAfterSecurityTrade))
        | _ -> (None)
;;

let parse_FundRenewWaiv ( str ) =
    match str with
        | "Y" -> (Some (FIX_FundRenewWaiv_Yes))
        | "N" -> (Some (FIX_FundRenewWaiv_No))
        | _ -> (None)
;;

let parse_GTBookingInst ( str ) =
    match str with
        | "0" -> (Some (FIX_GTBookingInst_BookOutAllTradesOnDayOfExecution))
        | "1" -> (Some (FIX_GTBookingInst_AccumulateUntilFilledOrExpired))
        | "2" -> (Some (FIX_GTBookingInst_AccumulateUntilVerballlyNotifiedOtherwise))
        | _ -> (None)
;;

let parse_GapFillFlag ( str ) =
    match str with
        | "Y" -> (Some (FIX_GapFillFlag_GapFillMessage))
        | "N" -> (Some (FIX_GapFillFlag_SequenceReset))
        | _ -> (None)
;;

let parse_HaltReason ( str ) =
    match str with
        | "I" -> (Some (FIX_HaltReason_OrderImbalance))
        | "X" -> (Some (FIX_HaltReason_EquipmentChangeover))
        | "P" -> (Some (FIX_HaltReason_NewsPending))
        | "D" -> (Some (FIX_HaltReason_NewsDissemination))
        | "E" -> (Some (FIX_HaltReason_OrderInflux))
        | "M" -> (Some (FIX_HaltReason_AdditionalInformation))
        | _ -> (None)
;;

let parse_HandlInst ( str ) =
    match str with
        | "1" -> (Some (FIX_HandlInst_AutomatedExecutionNoIntervention))
        | "2" -> (Some (FIX_HandlInst_AutomatedExecutionInterventionOK))
        | "3" -> (Some (FIX_HandlInst_ManualOrder))
        | _ -> (None)
;;

let parse_IOINaturalFlag ( str ) =
    match str with
        | "Y" -> (Some (FIX_IOINaturalFlag_Natural))
        | "N" -> (Some (FIX_IOINaturalFlag_NotNatural))
        | _ -> (None)
;;

let parse_IOIQltyInd ( str ) =
    match str with
        | "L" -> (Some (FIX_IOIQltyInd_Low))
        | "M" -> (Some (FIX_IOIQltyInd_Medium))
        | "H" -> (Some (FIX_IOIQltyInd_High))
        | _ -> (None)
;;

let parse_IOIQty ( str ) =
    match str with
        | "S" -> (Some (FIX_IOIQty_Small))
        | "M" -> (Some (FIX_IOIQty_Medium))
        | "L" -> (Some (FIX_IOIQty_Large))
        | _ -> (None)
;;

let parse_IOIQualifier ( str ) =
    match str with
        | "A" -> (Some (FIX_IOIQualifier_AllOrNone))
        | "B" -> (Some (FIX_IOIQualifier_MarketOnClose))
        | "C" -> (Some (FIX_IOIQualifier_AtTheClose))
        | "D" -> (Some (FIX_IOIQualifier_VWAP))
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
;;

let parse_IOITransType ( str ) =
    match str with
        | "N" -> (Some (FIX_IOITransType_New))
        | "C" -> (Some (FIX_IOITransType_Cancel))
        | "R" -> (Some (FIX_IOITransType_Replace))
        | _ -> (None)
;;

let parse_InViewOfCommon ( str ) =
    match str with
        | "Y" -> (Some (FIX_InViewOfCommon_HaltWasDueToCommonStockBeingHalted))
        | "N" -> (Some (FIX_InViewOfCommon_HaltWasNotRelatedToAHaltOfTheCommonStock))
        | _ -> (None)
;;

let parse_IncTaxInd ( str ) =
    match str with
        | "1" -> (Some (FIX_IncTaxInd_Net))
        | "2" -> (Some (FIX_IncTaxInd_Gross))
        | _ -> (None)
;;

let parse_InstrAttribType ( str ) =
    match str with
        | "1" -> (Some (FIX_InstrAttribType_Flat))
        | "2" -> (Some (FIX_InstrAttribType_ZeroCoupon))
        | "3" -> (Some (FIX_InstrAttribType_InterestBearing))
        | "4" -> (Some (FIX_InstrAttribType_NoPeriodicPayments))
        | "5" -> (Some (FIX_InstrAttribType_VariableRate))
        | "6" -> (Some (FIX_InstrAttribType_LessFeeForPut))
        | "7" -> (Some (FIX_InstrAttribType_SteppedCoupon))
        | "8" -> (Some (FIX_InstrAttribType_CouponPeriod))
        | "9" -> (Some (FIX_InstrAttribType_When))
        | "10" -> (Some (FIX_InstrAttribType_OriginalIssueDiscount))
        | "11" -> (Some (FIX_InstrAttribType_Callable))
        | "12" -> (Some (FIX_InstrAttribType_EscrowedToMaturity))
        | "13" -> (Some (FIX_InstrAttribType_EscrowedToRedemptionDate))
        | "14" -> (Some (FIX_InstrAttribType_PreRefunded))
        | "15" -> (Some (FIX_InstrAttribType_InDefault))
        | "16" -> (Some (FIX_InstrAttribType_Unrated))
        | "17" -> (Some (FIX_InstrAttribType_Taxable))
        | "18" -> (Some (FIX_InstrAttribType_Indexed))
        | "19" -> (Some (FIX_InstrAttribType_SubjectToAlternativeMinimumTax))
        | "20" -> (Some (FIX_InstrAttribType_OriginalIssueDiscountPrice))
        | "21" -> (Some (FIX_InstrAttribType_CallableBelowMaturityValue))
        | "22" -> (Some (FIX_InstrAttribType_CallableWithoutNotice))
        | "99" -> (Some (FIX_InstrAttribType_Text))
        | _ -> (None)
;;

let parse_LastCapacity ( str ) =
    match str with
        | "1" -> (Some (FIX_LastCapacity_Agent))
        | "2" -> (Some (FIX_LastCapacity_CrossAsAgent))
        | "3" -> (Some (FIX_LastCapacity_CrossAsPrincipal))
        | "4" -> (Some (FIX_LastCapacity_Principal))
        | _ -> (None)
;;

let parse_LastFragment ( str ) =
    match str with
        | "Y" -> (Some (FIX_LastFragment_LastMessage))
        | "N" -> (Some (FIX_LastFragment_NotLastMessage))
        | _ -> (None)
;;

let parse_LastLiquidityInd ( str ) =
    match str with
        | "1" -> (Some (FIX_LastLiquidityInd_AddedLiquidity))
        | "2" -> (Some (FIX_LastLiquidityInd_RemovedLiquidity))
        | "3" -> (Some (FIX_LastLiquidityInd_LiquidityRoutedOut))
        | _ -> (None)
;;

let parse_LegSwapType ( str ) =
    match str with
        | "1" -> (Some (FIX_LegSwapType_ParForPar))
        | "2" -> (Some (FIX_LegSwapType_ModifiedDuration))
        | "4" -> (Some (FIX_LegSwapType_Risk))
        | "5" -> (Some (FIX_LegSwapType_Proceeds))
        | _ -> (None)
;;

let parse_LegalConfirm ( str ) =
    match str with
        | "Y" -> (Some (FIX_LegalConfirm_LegalConfirm))
        | "N" -> (Some (FIX_LegalConfirm_DoesNotConsituteALegalConfirm))
        | _ -> (None)
;;

let parse_LiquidityIndType ( str ) =
    match str with
        | "1" -> (Some (FIX_LiquidityIndType_FiveDayMovingAverage))
        | "2" -> (Some (FIX_LiquidityIndType_TwentyDayMovingAverage))
        | "3" -> (Some (FIX_LiquidityIndType_NormalMarketSize))
        | "4" -> (Some (FIX_LiquidityIndType_Other))
        | _ -> (None)
;;

let parse_ListExecInstType ( str ) =
    match str with
        | "1" -> (Some (FIX_ListExecInstType_Immediate))
        | "2" -> (Some (FIX_ListExecInstType_WaitForInstruction))
        | "3" -> (Some (FIX_ListExecInstType_SellDriven))
        | "4" -> (Some (FIX_ListExecInstType_BuyDrivenCashTopUp))
        | "5" -> (Some (FIX_ListExecInstType_BuyDrivenCashWithdraw))
        | _ -> (None)
;;

let parse_ListOrderStatus ( str ) =
    match str with
        | "1" -> (Some (FIX_ListOrderStatus_InBiddingProcess))
        | "2" -> (Some (FIX_ListOrderStatus_ReceivedForExecution))
        | "3" -> (Some (FIX_ListOrderStatus_Executing))
        | "4" -> (Some (FIX_ListOrderStatus_Cancelling))
        | "5" -> (Some (FIX_ListOrderStatus_Alert))
        | "6" -> (Some (FIX_ListOrderStatus_AllDone))
        | "7" -> (Some (FIX_ListOrderStatus_Reject))
        | _ -> (None)
;;

let parse_ListStatusType ( str ) =
    match str with
        | "1" -> (Some (FIX_ListStatusType_Ack))
        | "2" -> (Some (FIX_ListStatusType_Response))
        | "3" -> (Some (FIX_ListStatusType_Timed))
        | "4" -> (Some (FIX_ListStatusType_ExecStarted))
        | "5" -> (Some (FIX_ListStatusType_AllDone))
        | "6" -> (Some (FIX_ListStatusType_Alert))
        | _ -> (None)
;;

let parse_LocateReqd ( str ) =
    match str with
        | "Y" -> (Some (FIX_LocateReqd_Yes))
        | "N" -> (Some (FIX_LocateReqd_No))
        | _ -> (None)
;;

let parse_MDEntryType ( str ) =
    match str with
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
        | "A" -> (Some (FIX_MDEntryType_Imbalance))
        | "B" -> (Some (FIX_MDEntryType_TradeVolume))
        | "C" -> (Some (FIX_MDEntryType_OpenInterest))
        | _ -> (None)
;;

let parse_MDImplicitDelete ( str ) =
    match str with
        | "Y" -> (Some (FIX_MDImplicitDelete_Yes))
        | "N" -> (Some (FIX_MDImplicitDelete_No))
        | _ -> (None)
;;

let parse_MDReqRejReason ( str ) =
    match str with
        | "0" -> (Some (FIX_MDReqRejReason_UnknownSymbol))
        | "1" -> (Some (FIX_MDReqRejReason_DuplicateMDReqID))
        | "2" -> (Some (FIX_MDReqRejReason_InsufficientBandwidth))
        | "3" -> (Some (FIX_MDReqRejReason_InsufficientPermissions))
        | "4" -> (Some (FIX_MDReqRejReason_UnsupportedSubscriptionRequestType))
        | "5" -> (Some (FIX_MDReqRejReason_UnsupportedMarketDepth))
        | "6" -> (Some (FIX_MDReqRejReason_UnsupportedMDUpdateType))
        | "7" -> (Some (FIX_MDReqRejReason_UnsupportedAggregatedBook))
        | "8" -> (Some (FIX_MDReqRejReason_UnsupportedMDEntryType))
        | "9" -> (Some (FIX_MDReqRejReason_UnsupportedTradingSessionID))
        | "A" -> (Some (FIX_MDReqRejReason_UnsupportedScope))
        | "B" -> (Some (FIX_MDReqRejReason_UnsupportedOpenCloseSettleFlag))
        | "C" -> (Some (FIX_MDReqRejReason_UnsupportedMDImplicitDelete))
        | _ -> (None)
;;

let parse_MDUpdateAction ( str ) =
    match str with
        | "0" -> (Some (FIX_MDUpdateAction_New))
        | "1" -> (Some (FIX_MDUpdateAction_Change))
        | "2" -> (Some (FIX_MDUpdateAction_Delete))
        | _ -> (None)
;;

let parse_MDUpdateType ( str ) =
    match str with
        | "0" -> (Some (FIX_MDUpdateType_FullRefresh))
        | "1" -> (Some (FIX_MDUpdateType_IncrementalRefresh))
        | _ -> (None)
;;

let parse_MassCancelRejectReason ( str ) =
    match str with
        | "0" -> (Some (FIX_MassCancelRejectReason_MassCancelNotSupported))
        | "1" -> (Some (FIX_MassCancelRejectReason_InvalidOrUnknownSecurity))
        | "2" -> (Some (FIX_MassCancelRejectReason_InvalidOrUnkownUnderlyingSecurity))
        | "3" -> (Some (FIX_MassCancelRejectReason_InvalidOrUnknownProduct))
        | "4" -> (Some (FIX_MassCancelRejectReason_InvalidOrUnknownCFICode))
        | "5" -> (Some (FIX_MassCancelRejectReason_InvalidOrUnknownSecurityType))
        | "6" -> (Some (FIX_MassCancelRejectReason_InvalidOrUnknownTradingSession))
        | "99" -> (Some (FIX_MassCancelRejectReason_Other))
        | _ -> (None)
;;

let parse_MassCancelRequestType ( str ) =
    match str with
        | "1" -> (Some (FIX_MassCancelRequestType_CancelOrdersForASecurity))
        | "2" -> (Some (FIX_MassCancelRequestType_CancelOrdersForAnUnderlyingSecurity))
        | "3" -> (Some (FIX_MassCancelRequestType_CancelOrdersForAProduct))
        | "4" -> (Some (FIX_MassCancelRequestType_CancelOrdersForACFICode))
        | "5" -> (Some (FIX_MassCancelRequestType_CancelOrdersForASecurityType))
        | "6" -> (Some (FIX_MassCancelRequestType_CancelOrdersForATradingSession))
        | "7" -> (Some (FIX_MassCancelRequestType_CancelAllOrders))
        | _ -> (None)
;;

let parse_MassCancelResponse ( str ) =
    match str with
        | "0" -> (Some (FIX_MassCancelResponse_CancelRequestRejected))
        | "1" -> (Some (FIX_MassCancelResponse_CancelOrdersForASecurity))
        | "2" -> (Some (FIX_MassCancelResponse_CancelOrdersForAnUnderlyingSecurity))
        | "3" -> (Some (FIX_MassCancelResponse_CancelOrdersForAProduct))
        | "4" -> (Some (FIX_MassCancelResponse_CancelOrdersForACFICode))
        | "5" -> (Some (FIX_MassCancelResponse_CancelOrdersForASecurityType))
        | "6" -> (Some (FIX_MassCancelResponse_CancelOrdersForATradingSession))
        | "7" -> (Some (FIX_MassCancelResponse_CancelAllOrders))
        | _ -> (None)
;;

let parse_MassStatusReqType ( str ) =
    match str with
        | "1" -> (Some (FIX_MassStatusReqType_StatusForOrdersForASecurity))
        | "2" -> (Some (FIX_MassStatusReqType_StatusForOrdersForAnUnderlyingSecurity))
        | "3" -> (Some (FIX_MassStatusReqType_StatusForOrdersForAProduct))
        | "4" -> (Some (FIX_MassStatusReqType_StatusForOrdersForACFICode))
        | "5" -> (Some (FIX_MassStatusReqType_StatusForOrdersForASecurityType))
        | "6" -> (Some (FIX_MassStatusReqType_StatusForOrdersForATradingSession))
        | "7" -> (Some (FIX_MassStatusReqType_StatusForAllOrders))
        | "8" -> (Some (FIX_MassStatusReqType_StatusForOrdersForAPartyID))
        | _ -> (None)
;;

let parse_MatchStatus ( str ) =
    match str with
        | "0" -> (Some (FIX_MatchStatus_Compared))
        | "1" -> (Some (FIX_MatchStatus_Uncompared))
        | "2" -> (Some (FIX_MatchStatus_AdvisoryOrAlert))
        | _ -> (None)
;;

let parse_MatchType ( str ) =
    match str with
        | "A1" -> (Some (FIX_MatchType_ExactMatchPlus4BadgesExecTime))
        | "A2" -> (Some (FIX_MatchType_ExactMatchPlus4Badges))
        | "A3" -> (Some (FIX_MatchType_ExactMatchPlus2BadgesExecTime))
        | "A4" -> (Some (FIX_MatchType_ExactMatchPlus2Badges))
        | "A5" -> (Some (FIX_MatchType_ExactMatchPlusExecTime))
        | "AQ" -> (Some (FIX_MatchType_StampedAdvisoriesOrSpecialistAccepts))
        | "S1" -> (Some (FIX_MatchType_A1ExactMatchSummarizedQuantity))
        | "S2" -> (Some (FIX_MatchType_A2ExactMatchSummarizedQuantity))
        | "S3" -> (Some (FIX_MatchType_A3ExactMatchSummarizedQuantity))
        | "S4" -> (Some (FIX_MatchType_A4ExactMatchSummarizedQuantity))
        | "S5" -> (Some (FIX_MatchType_A5ExactMatchSummarizedQuantity))
        | "M1" -> (Some (FIX_MatchType_ExactMatchMinusBadgesTimes))
        | "M2" -> (Some (FIX_MatchType_SummarizedMatchMinusBadgesTimes))
        | "MT" -> (Some (FIX_MatchType_OCSLockedIn))
        | "M3" -> (Some (FIX_MatchType_ACTAcceptedTrade))
        | "M4" -> (Some (FIX_MatchType_ACTDefaultTrade))
        | "M5" -> (Some (FIX_MatchType_ACTDefaultAfterM2))
        | "M6" -> (Some (FIX_MatchType_ACTM6Match))
        | _ -> (None)
;;

let parse_MessageEncoding ( str ) =
    match str with
        | "ISO-2022-JP" -> (Some (FIX_MessageEncoding_ISO2022JP))
        | "EUC-JP" -> (Some (FIX_MessageEncoding_EUCJP))
        | "Shift_JIS" -> (Some (FIX_MessageEncoding_ShiftJIS))
        | "UTF-8" -> (Some (FIX_MessageEncoding_UTF8))
        | _ -> (None)
;;

let parse_MiscFeeBasis ( str ) =
    match str with
        | "0" -> (Some (FIX_MiscFeeBasis_Absolute))
        | "1" -> (Some (FIX_MiscFeeBasis_PerUnit))
        | "2" -> (Some (FIX_MiscFeeBasis_Percentage))
        | _ -> (None)
;;

let parse_MiscFeeType ( str ) =
    match str with
        | "1" -> (Some (FIX_MiscFeeType_Regulatory))
        | "2" -> (Some (FIX_MiscFeeType_Tax))
        | "3" -> (Some (FIX_MiscFeeType_LocalCommission))
        | "4" -> (Some (FIX_MiscFeeType_ExchangeFees))
        | "5" -> (Some (FIX_MiscFeeType_Stamp))
        | "6" -> (Some (FIX_MiscFeeType_Levy))
        | "7" -> (Some (FIX_MiscFeeType_Other))
        | "8" -> (Some (FIX_MiscFeeType_Markup))
        | "9" -> (Some (FIX_MiscFeeType_ConsumptionTax))
        | "10" -> (Some (FIX_MiscFeeType_PerTransaction))
        | "11" -> (Some (FIX_MiscFeeType_Conversion))
        | "12" -> (Some (FIX_MiscFeeType_Agent))
        | _ -> (None)
;;

let parse_MoneyLaunderingStatus ( str ) =
    match str with
        | "Y" -> (Some (FIX_MoneyLaunderingStatus_Passed))
        | "N" -> (Some (FIX_MoneyLaunderingStatus_NotChecked))
        | "1" -> (Some (FIX_MoneyLaunderingStatus_ExemptBelowLimit))
        | "2" -> (Some (FIX_MoneyLaunderingStatus_ExemptMoneyType))
        | "3" -> (Some (FIX_MoneyLaunderingStatus_ExemptAuthorised))
        | _ -> (None)
;;

let parse_MsgDirection ( str ) =
    match str with
        | "S" -> (Some (FIX_MsgDirection_Send))
        | "R" -> (Some (FIX_MsgDirection_Receive))
        | _ -> (None)
;;

let parse_MsgType ( str ) =
    match str with
        | "0" -> (Some (FIX_MsgType_Heartbeat))
        | "1" -> (Some (FIX_MsgType_TestRequest))
        | "2" -> (Some (FIX_MsgType_ResendRequest))
        | "3" -> (Some (FIX_MsgType_Reject))
        | "4" -> (Some (FIX_MsgType_SequenceReset))
        | "5" -> (Some (FIX_MsgType_Logout))
        | "6" -> (Some (FIX_MsgType_IOI))
        | "7" -> (Some (FIX_MsgType_Advertisement))
        | "8" -> (Some (FIX_MsgType_ExecutionReport))
        | "9" -> (Some (FIX_MsgType_OrderCancelReject))
        | "A" -> (Some (FIX_MsgType_Logon))
        | "B" -> (Some (FIX_MsgType_News))
        | "C" -> (Some (FIX_MsgType_Email))
        | "D" -> (Some (FIX_MsgType_NewOrderSingle))
        | "E" -> (Some (FIX_MsgType_NewOrderList))
        | "F" -> (Some (FIX_MsgType_OrderCancelRequest))
        | "G" -> (Some (FIX_MsgType_OrderCancelReplaceRequest))
        | "H" -> (Some (FIX_MsgType_OrderStatusRequest))
        | "J" -> (Some (FIX_MsgType_AllocationInstruction))
        | "K" -> (Some (FIX_MsgType_ListCancelRequest))
        | "L" -> (Some (FIX_MsgType_ListExecute))
        | "M" -> (Some (FIX_MsgType_ListStatusRequest))
        | "N" -> (Some (FIX_MsgType_ListStatus))
        | "P" -> (Some (FIX_MsgType_AllocationInstructionAck))
        | "Q" -> (Some (FIX_MsgType_DontKnowTrade))
        | "R" -> (Some (FIX_MsgType_QuoteRequest))
        | "S" -> (Some (FIX_MsgType_Quote))
        | "T" -> (Some (FIX_MsgType_SettlementInstructions))
        | "V" -> (Some (FIX_MsgType_MarketDataRequest))
        | "W" -> (Some (FIX_MsgType_MarketDataSnapshotFullRefresh))
        | "X" -> (Some (FIX_MsgType_MarketDataIncrementalRefresh))
        | "Y" -> (Some (FIX_MsgType_MarketDataRequestReject))
        | "Z" -> (Some (FIX_MsgType_QuoteCancel))
        | "a" -> (Some (FIX_MsgType_QuoteStatusRequest))
        | "b" -> (Some (FIX_MsgType_MassQuoteAcknowledgement))
        | "c" -> (Some (FIX_MsgType_SecurityDefinitionRequest))
        | "d" -> (Some (FIX_MsgType_SecurityDefinition))
        | "e" -> (Some (FIX_MsgType_SecurityStatusRequest))
        | "f" -> (Some (FIX_MsgType_SecurityStatus))
        | "g" -> (Some (FIX_MsgType_TradingSessionStatusRequest))
        | "h" -> (Some (FIX_MsgType_TradingSessionStatus))
        | "i" -> (Some (FIX_MsgType_MassQuote))
        | "j" -> (Some (FIX_MsgType_BusinessMessageReject))
        | "k" -> (Some (FIX_MsgType_BidRequest))
        | "l" -> (Some (FIX_MsgType_BidResponse))
        | "m" -> (Some (FIX_MsgType_ListStrikePrice))
        | "n" -> (Some (FIX_MsgType_XMLNonFIX))
        | "o" -> (Some (FIX_MsgType_RegistrationInstructions))
        | "p" -> (Some (FIX_MsgType_RegistrationInstructionsResponse))
        | "q" -> (Some (FIX_MsgType_OrderMassCancelRequest))
        | "r" -> (Some (FIX_MsgType_OrderMassCancelReport))
        | "s" -> (Some (FIX_MsgType_NewOrderCross))
        | "t" -> (Some (FIX_MsgType_CrossOrderCancelReplaceRequest))
        | "u" -> (Some (FIX_MsgType_CrossOrderCancelRequest))
        | "v" -> (Some (FIX_MsgType_SecurityTypeRequest))
        | "w" -> (Some (FIX_MsgType_SecurityTypes))
        | "x" -> (Some (FIX_MsgType_SecurityListRequest))
        | "y" -> (Some (FIX_MsgType_SecurityList))
        | "z" -> (Some (FIX_MsgType_DerivativeSecurityListRequest))
        | "AA" -> (Some (FIX_MsgType_DerivativeSecurityList))
        | "AB" -> (Some (FIX_MsgType_NewOrderMultileg))
        | "AC" -> (Some (FIX_MsgType_MultilegOrderCancelReplace))
        | "AD" -> (Some (FIX_MsgType_TradeCaptureReportRequest))
        | "AE" -> (Some (FIX_MsgType_TradeCaptureReport))
        | "AF" -> (Some (FIX_MsgType_OrderMassStatusRequest))
        | "AG" -> (Some (FIX_MsgType_QuoteRequestReject))
        | "AH" -> (Some (FIX_MsgType_RFQRequest))
        | "AI" -> (Some (FIX_MsgType_QuoteStatusReport))
        | "AJ" -> (Some (FIX_MsgType_QuoteResponse))
        | "AK" -> (Some (FIX_MsgType_Confirmation))
        | "AL" -> (Some (FIX_MsgType_PositionMaintenanceRequest))
        | "AM" -> (Some (FIX_MsgType_PositionMaintenanceReport))
        | "AN" -> (Some (FIX_MsgType_RequestForPositions))
        | "AO" -> (Some (FIX_MsgType_RequestForPositionsAck))
        | "AP" -> (Some (FIX_MsgType_PositionReport))
        | "AQ" -> (Some (FIX_MsgType_TradeCaptureReportRequestAck))
        | "AR" -> (Some (FIX_MsgType_TradeCaptureReportAck))
        | "AS" -> (Some (FIX_MsgType_AllocationReport))
        | "AT" -> (Some (FIX_MsgType_AllocationReportAck))
        | "AU" -> (Some (FIX_MsgType_ConfirmationAck))
        | "AV" -> (Some (FIX_MsgType_SettlementInstructionRequest))
        | "AW" -> (Some (FIX_MsgType_AssignmentReport))
        | "AX" -> (Some (FIX_MsgType_CollateralRequest))
        | "AY" -> (Some (FIX_MsgType_CollateralAssignment))
        | "AZ" -> (Some (FIX_MsgType_CollateralResponse))
        | "BA" -> (Some (FIX_MsgType_CollateralReport))
        | "BB" -> (Some (FIX_MsgType_CollateralInquiry))
        | "BC" -> (Some (FIX_MsgType_NetworkCounterpartySystemStatusRequest))
        | "BD" -> (Some (FIX_MsgType_NetworkCounterpartySystemStatusResponse))
        | "BE" -> (Some (FIX_MsgType_UserRequest))
        | "BF" -> (Some (FIX_MsgType_UserResponse))
        | "BG" -> (Some (FIX_MsgType_CollateralInquiryAck))
        | "BH" -> (Some (FIX_MsgType_ConfirmationRequest))
        | _ -> (None)
;;

let parse_MultiLegReportingType ( str ) =
    match str with
        | "1" -> (Some (FIX_MultiLegReportingType_SingleSecurity))
        | "2" -> (Some (FIX_MultiLegReportingType_IndividualLegOfAMultiLegSecurity))
        | "3" -> (Some (FIX_MultiLegReportingType_MultiLegSecurity))
        | _ -> (None)
;;

let parse_MultiLegRptTypeReq ( str ) =
    match str with
        | "0" -> (Some (FIX_MultiLegRptTypeReq_ReportByMulitlegSecurityOnly))
        | "1" -> (Some (FIX_MultiLegRptTypeReq_ReportByMultilegSecurityAndInstrumentLegs))
        | "2" -> (Some (FIX_MultiLegRptTypeReq_ReportByInstrumentLegsOnly))
        | _ -> (None)
;;

let parse_NetGrossInd ( str ) =
    match str with
        | "1" -> (Some (FIX_NetGrossInd_Net))
        | "2" -> (Some (FIX_NetGrossInd_Gross))
        | _ -> (None)
;;

let parse_NetworkRequestType ( str ) =
    match str with
        | "1" -> (Some (FIX_NetworkRequestType_Snapshot))
        | "2" -> (Some (FIX_NetworkRequestType_Subscribe))
        | "4" -> (Some (FIX_NetworkRequestType_StopSubscribing))
        | "8" -> (Some (FIX_NetworkRequestType_LevelOfDetail))
        | _ -> (None)
;;

let parse_NetworkStatusResponseType ( str ) =
    match str with
        | "1" -> (Some (FIX_NetworkStatusResponseType_Full))
        | "2" -> (Some (FIX_NetworkStatusResponseType_IncrementalUpdate))
        | _ -> (None)
;;

let parse_NoSides ( str ) =
    match str with
        | "1" -> (Some (FIX_NoSides_OneSide))
        | "2" -> (Some (FIX_NoSides_BothSides))
        | _ -> (None)
;;

let parse_NotifyBrokerOfCredit ( str ) =
    match str with
        | "Y" -> (Some (FIX_NotifyBrokerOfCredit_DetailsShouldBeCommunicated))
        | "N" -> (Some (FIX_NotifyBrokerOfCredit_DetailsShouldNotBeCommunicated))
        | _ -> (None)
;;

let parse_OddLot ( str ) =
    match str with
        | "Y" -> (Some (FIX_OddLot_TreatAsOddLot))
        | "N" -> (Some (FIX_OddLot_TreatAsRoundLot))
        | _ -> (None)
;;

let parse_OpenCloseSettlFlag ( str ) =
    match str with
        | "0" -> (Some (FIX_OpenCloseSettlFlag_DailyOpen))
        | "1" -> (Some (FIX_OpenCloseSettlFlag_SessionOpen))
        | "2" -> (Some (FIX_OpenCloseSettlFlag_DeliverySettlementEntry))
        | "3" -> (Some (FIX_OpenCloseSettlFlag_ExpectedEntry))
        | "4" -> (Some (FIX_OpenCloseSettlFlag_EntryFromPreviousBusinessDay))
        | "5" -> (Some (FIX_OpenCloseSettlFlag_TheoreticalPriceValue))
        | _ -> (None)
;;

let parse_OrdRejReason ( str ) =
    match str with
        | "0" -> (Some (FIX_OrdRejReason_BrokerCredit))
        | "1" -> (Some (FIX_OrdRejReason_UnknownSymbol))
        | "2" -> (Some (FIX_OrdRejReason_ExchangeClosed))
        | "3" -> (Some (FIX_OrdRejReason_OrderExceedsLimit))
        | "4" -> (Some (FIX_OrdRejReason_TooLateToEnter))
        | "5" -> (Some (FIX_OrdRejReason_UnknownOrder))
        | "6" -> (Some (FIX_OrdRejReason_DuplicateOrder))
        | "7" -> (Some (FIX_OrdRejReason_DuplicateOfAVerballyCommunicatedOrder))
        | "8" -> (Some (FIX_OrdRejReason_StaleOrder))
        | "9" -> (Some (FIX_OrdRejReason_TradeAlongRequired))
        | "10" -> (Some (FIX_OrdRejReason_InvalidInvestorID))
        | "11" -> (Some (FIX_OrdRejReason_UnsupportedOrderCharacteristic))
        | "13" -> (Some (FIX_OrdRejReason_IncorrectQuantity))
        | "14" -> (Some (FIX_OrdRejReason_IncorrectAllocatedQuantity))
        | "15" -> (Some (FIX_OrdRejReason_UnknownAccount))
        | "99" -> (Some (FIX_OrdRejReason_Other))
        | _ -> (None)
;;

let parse_OrdStatus ( str ) =
    match str with
        | "0" -> (Some (FIX_OrdStatus_New))
        | "1" -> (Some (FIX_OrdStatus_PartiallyFilled))
        | "2" -> (Some (FIX_OrdStatus_Filled))
        | "3" -> (Some (FIX_OrdStatus_DoneForDay))
        | "4" -> (Some (FIX_OrdStatus_Canceled))
        | "6" -> (Some (FIX_OrdStatus_PendingCancel))
        | "7" -> (Some (FIX_OrdStatus_Stopped))
        | "8" -> (Some (FIX_OrdStatus_Rejected))
        | "9" -> (Some (FIX_OrdStatus_Suspended))
        | "A" -> (Some (FIX_OrdStatus_PendingNew))
        | "B" -> (Some (FIX_OrdStatus_Calculated))
        | "C" -> (Some (FIX_OrdStatus_Expired))
        | "D" -> (Some (FIX_OrdStatus_AcceptedForBidding))
        | "E" -> (Some (FIX_OrdStatus_PendingReplace))
        | "5" -> (Some (FIX_OrdStatus_Replaced))
        | _ -> (None)
;;

let parse_OrdType ( str ) =
    match str with
        | "1" -> (Some (FIX_OrdType_Market))
        | "2" -> (Some (FIX_OrdType_Limit))
        | "3" -> (Some (FIX_OrdType_Stop))
        | "4" -> (Some (FIX_OrdType_StopLimit))
        | "6" -> (Some (FIX_OrdType_WithOrWithout))
        | "7" -> (Some (FIX_OrdType_LimitOrBetter))
        | "8" -> (Some (FIX_OrdType_LimitWithOrWithout))
        | "9" -> (Some (FIX_OrdType_OnBasis))
        | "D" -> (Some (FIX_OrdType_PreviouslyQuoted))
        | "E" -> (Some (FIX_OrdType_PreviouslyIndicated))
        | "G" -> (Some (FIX_OrdType_ForexSwap))
        | "I" -> (Some (FIX_OrdType_Funari))
        | "J" -> (Some (FIX_OrdType_MarketIfTouched))
        | "K" -> (Some (FIX_OrdType_MarketWithLeftOverAsLimit))
        | "L" -> (Some (FIX_OrdType_PreviousFundValuationPoint))
        | "M" -> (Some (FIX_OrdType_NextFundValuationPoint))
        | "P" -> (Some (FIX_OrdType_Pegged))
        | _ -> (None)
;;

let parse_OrderCapacity ( str ) =
    match str with
        | "A" -> (Some (FIX_OrderCapacity_Agency))
        | "G" -> (Some (FIX_OrderCapacity_Proprietary))
        | "I" -> (Some (FIX_OrderCapacity_Individual))
        | "P" -> (Some (FIX_OrderCapacity_Principal))
        | "R" -> (Some (FIX_OrderCapacity_RisklessPrincipal))
        | "W" -> (Some (FIX_OrderCapacity_AgentForOtherMember))
        | _ -> (None)
;;

let parse_OrderRestrictions ( str ) =
    match str with
        | "1" -> (Some (FIX_OrderRestrictions_ProgramTrade))
        | "2" -> (Some (FIX_OrderRestrictions_IndexArbitrage))
        | "3" -> (Some (FIX_OrderRestrictions_NonIndexArbitrage))
        | "4" -> (Some (FIX_OrderRestrictions_CompetingMarketMaker))
        | "5" -> (Some (FIX_OrderRestrictions_ActingAsMarketMakerOrSpecialistInSecurity))
        | "6" -> (Some (FIX_OrderRestrictions_ActingAsMarketMakerOrSpecialistInUnderlying))
        | "7" -> (Some (FIX_OrderRestrictions_ForeignEntity))
        | "8" -> (Some (FIX_OrderRestrictions_ExternalMarketParticipant))
        | "9" -> (Some (FIX_OrderRestrictions_ExternalInterConnectedMarketLinkage))
        | "A" -> (Some (FIX_OrderRestrictions_RisklessArbitrage))
        | _ -> (None)
;;

let parse_OwnerType ( str ) =
    match str with
        | "1" -> (Some (FIX_OwnerType_IndividualInvestor))
        | "2" -> (Some (FIX_OwnerType_PublicCompany))
        | "3" -> (Some (FIX_OwnerType_PrivateCompany))
        | "4" -> (Some (FIX_OwnerType_IndividualTrustee))
        | "5" -> (Some (FIX_OwnerType_CompanyTrustee))
        | "6" -> (Some (FIX_OwnerType_PensionPlan))
        | "7" -> (Some (FIX_OwnerType_CustodianUnderGiftsToMinorsAct))
        | "8" -> (Some (FIX_OwnerType_Trusts))
        | "9" -> (Some (FIX_OwnerType_Fiduciaries))
        | "10" -> (Some (FIX_OwnerType_NetworkingSubAccount))
        | "11" -> (Some (FIX_OwnerType_NonProfitOrganization))
        | "12" -> (Some (FIX_OwnerType_CorporateBody))
        | "13" -> (Some (FIX_OwnerType_Nominee))
        | _ -> (None)
;;

let parse_OwnershipType ( str ) =
    match str with
        | "J" -> (Some (FIX_OwnershipType_JointInvestors))
        | "T" -> (Some (FIX_OwnershipType_TenantsInCommon))
        | "2" -> (Some (FIX_OwnershipType_JointTrustees))
        | _ -> (None)
;;

let parse_PartyIDSource ( str ) =
    match str with
        | "B" -> (Some (FIX_PartyIDSource_BIC))
        | "C" -> (Some (FIX_PartyIDSource_GeneralIdentifier))
        | "D" -> (Some (FIX_PartyIDSource_Proprietary))
        | "E" -> (Some (FIX_PartyIDSource_ISOCountryCode))
        | "F" -> (Some (FIX_PartyIDSource_SettlementEntityLocation))
        | "G" -> (Some (FIX_PartyIDSource_MIC))
        | "H" -> (Some (FIX_PartyIDSource_CSDParticipant))
        | "1" -> (Some (FIX_PartyIDSource_KoreanInvestorID))
        | "2" -> (Some (FIX_PartyIDSource_TaiwaneseForeignInvestorID))
        | "3" -> (Some (FIX_PartyIDSource_TaiwaneseTradingAcct))
        | "4" -> (Some (FIX_PartyIDSource_MalaysianCentralDepository))
        | "5" -> (Some (FIX_PartyIDSource_ChineseInvestorID))
        | "6" -> (Some (FIX_PartyIDSource_UKNationalInsuranceOrPensionNumber))
        | "7" -> (Some (FIX_PartyIDSource_USSocialSecurityNumber))
        | "8" -> (Some (FIX_PartyIDSource_USEmployerOrTaxIDNumber))
        | "9" -> (Some (FIX_PartyIDSource_AustralianBusinessNumber))
        | "A" -> (Some (FIX_PartyIDSource_AustralianTaxFileNumber))
        | "I" -> (Some (FIX_PartyIDSource_ISITCAcronym))
        | _ -> (None)
;;

let parse_PartyRole ( str ) =
    match str with
        | "1" -> (Some (FIX_PartyRole_ExecutingFirm))
        | "2" -> (Some (FIX_PartyRole_BrokerOfCredit))
        | "3" -> (Some (FIX_PartyRole_ClientID))
        | "4" -> (Some (FIX_PartyRole_ClearingFirm))
        | "5" -> (Some (FIX_PartyRole_InvestorID))
        | "6" -> (Some (FIX_PartyRole_IntroducingFirm))
        | "7" -> (Some (FIX_PartyRole_EnteringFirm))
        | "8" -> (Some (FIX_PartyRole_Locate))
        | "9" -> (Some (FIX_PartyRole_FundManagerClientID))
        | "10" -> (Some (FIX_PartyRole_SettlementLocation))
        | "11" -> (Some (FIX_PartyRole_OrderOriginationTrader))
        | "12" -> (Some (FIX_PartyRole_ExecutingTrader))
        | "13" -> (Some (FIX_PartyRole_OrderOriginationFirm))
        | "14" -> (Some (FIX_PartyRole_GiveupClearingFirm))
        | "15" -> (Some (FIX_PartyRole_CorrespondantClearingFirm))
        | "16" -> (Some (FIX_PartyRole_ExecutingSystem))
        | "17" -> (Some (FIX_PartyRole_ContraFirm))
        | "18" -> (Some (FIX_PartyRole_ContraClearingFirm))
        | "19" -> (Some (FIX_PartyRole_SponsoringFirm))
        | "20" -> (Some (FIX_PartyRole_UnderlyingContraFirm))
        | "21" -> (Some (FIX_PartyRole_ClearingOrganization))
        | "22" -> (Some (FIX_PartyRole_Exchange))
        | "24" -> (Some (FIX_PartyRole_CustomerAccount))
        | "25" -> (Some (FIX_PartyRole_CorrespondentClearingOrganization))
        | "26" -> (Some (FIX_PartyRole_CorrespondentBroker))
        | "27" -> (Some (FIX_PartyRole_Buyer))
        | "28" -> (Some (FIX_PartyRole_Custodian))
        | "29" -> (Some (FIX_PartyRole_Intermediary))
        | "30" -> (Some (FIX_PartyRole_Agent))
        | "31" -> (Some (FIX_PartyRole_SubCustodian))
        | "32" -> (Some (FIX_PartyRole_Beneficiary))
        | "33" -> (Some (FIX_PartyRole_InterestedParty))
        | "34" -> (Some (FIX_PartyRole_RegulatoryBody))
        | "35" -> (Some (FIX_PartyRole_LiquidityProvider))
        | "36" -> (Some (FIX_PartyRole_EnteringTrader))
        | "37" -> (Some (FIX_PartyRole_ContraTrader))
        | "38" -> (Some (FIX_PartyRole_PositionAccount))
        | _ -> (None)
;;

let parse_PartySubIDType ( str ) =
    match str with
        | "1" -> (Some (FIX_PartySubIDType_Firm))
        | "2" -> (Some (FIX_PartySubIDType_Person))
        | "3" -> (Some (FIX_PartySubIDType_System))
        | "4" -> (Some (FIX_PartySubIDType_Application))
        | "5" -> (Some (FIX_PartySubIDType_FullLegalNameOfFirm))
        | "6" -> (Some (FIX_PartySubIDType_PostalAddress))
        | "7" -> (Some (FIX_PartySubIDType_PhoneNumber))
        | "8" -> (Some (FIX_PartySubIDType_EmailAddress))
        | "9" -> (Some (FIX_PartySubIDType_ContactName))
        | "10" -> (Some (FIX_PartySubIDType_SecuritiesAccountNumber))
        | "11" -> (Some (FIX_PartySubIDType_RegistrationNumber))
        | "12" -> (Some (FIX_PartySubIDType_RegisteredAddressForConfirmation))
        | "13" -> (Some (FIX_PartySubIDType_RegulatoryStatus))
        | "14" -> (Some (FIX_PartySubIDType_RegistrationName))
        | "15" -> (Some (FIX_PartySubIDType_CashAccountNumber))
        | "16" -> (Some (FIX_PartySubIDType_BIC))
        | "17" -> (Some (FIX_PartySubIDType_CSDParticipantMemberCode))
        | "18" -> (Some (FIX_PartySubIDType_RegisteredAddress))
        | "19" -> (Some (FIX_PartySubIDType_FundAccountName))
        | "20" -> (Some (FIX_PartySubIDType_TelexNumber))
        | "21" -> (Some (FIX_PartySubIDType_FaxNumber))
        | "22" -> (Some (FIX_PartySubIDType_SecuritiesAccountName))
        | "23" -> (Some (FIX_PartySubIDType_CashAccountName))
        | "24" -> (Some (FIX_PartySubIDType_Department))
        | "25" -> (Some (FIX_PartySubIDType_LocationDesk))
        | "26" -> (Some (FIX_PartySubIDType_PositionAccountType))
        | _ -> (None)
;;

let parse_PaymentMethod ( str ) =
    match str with
        | "1" -> (Some (FIX_PaymentMethod_CREST))
        | "2" -> (Some (FIX_PaymentMethod_NSCC))
        | "3" -> (Some (FIX_PaymentMethod_Euroclear))
        | "4" -> (Some (FIX_PaymentMethod_Clearstream))
        | "5" -> (Some (FIX_PaymentMethod_Cheque))
        | "6" -> (Some (FIX_PaymentMethod_TelegraphicTransfer))
        | "7" -> (Some (FIX_PaymentMethod_FedWire))
        | "8" -> (Some (FIX_PaymentMethod_DebitCard))
        | "9" -> (Some (FIX_PaymentMethod_DirectDebit))
        | "10" -> (Some (FIX_PaymentMethod_DirectCredit))
        | "11" -> (Some (FIX_PaymentMethod_CreditCard))
        | "12" -> (Some (FIX_PaymentMethod_ACHDebit))
        | "13" -> (Some (FIX_PaymentMethod_ACHCredit))
        | "14" -> (Some (FIX_PaymentMethod_BPAY))
        | "15" -> (Some (FIX_PaymentMethod_HighValueClearingSystem))
        | _ -> (None)
;;

let parse_PegLimitType ( str ) =
    match str with
        | "0" -> (Some (FIX_PegLimitType_OrBetter))
        | "1" -> (Some (FIX_PegLimitType_Strict))
        | "2" -> (Some (FIX_PegLimitType_OrWorse))
        | _ -> (None)
;;

let parse_PegMoveType ( str ) =
    match str with
        | "0" -> (Some (FIX_PegMoveType_Floating))
        | "1" -> (Some (FIX_PegMoveType_Fixed))
        | _ -> (None)
;;

let parse_PegOffsetType ( str ) =
    match str with
        | "0" -> (Some (FIX_PegOffsetType_Price))
        | "1" -> (Some (FIX_PegOffsetType_BasisPoints))
        | "2" -> (Some (FIX_PegOffsetType_Ticks))
        | "3" -> (Some (FIX_PegOffsetType_PriceTier))
        | _ -> (None)
;;

let parse_PegRoundDirection ( str ) =
    match str with
        | "1" -> (Some (FIX_PegRoundDirection_MoreAggressive))
        | "2" -> (Some (FIX_PegRoundDirection_MorePassive))
        | _ -> (None)
;;

let parse_PegScope ( str ) =
    match str with
        | "1" -> (Some (FIX_PegScope_Local))
        | "2" -> (Some (FIX_PegScope_National))
        | "3" -> (Some (FIX_PegScope_Global))
        | "4" -> (Some (FIX_PegScope_NationalExcludingLocal))
        | _ -> (None)
;;

let parse_PosAmtType ( str ) =
    match str with
        | "FMTM" -> (Some (FIX_PosAmtType_FinalMarkToMarketAmount))
        | "IMTM" -> (Some (FIX_PosAmtType_IncrementalMarkToMarketAmount))
        | "TVAR" -> (Some (FIX_PosAmtType_TradeVariationAmount))
        | "SMTM" -> (Some (FIX_PosAmtType_StartOfDayMarkToMarketAmount))
        | "PREM" -> (Some (FIX_PosAmtType_PremiumAmount))
        | "CRES" -> (Some (FIX_PosAmtType_CashResidualAmount))
        | "CASH" -> (Some (FIX_PosAmtType_CashAmount))
        | "VADJ" -> (Some (FIX_PosAmtType_ValueAdjustedAmount))
        | _ -> (None)
;;

let parse_PosMaintAction ( str ) =
    match str with
        | "1" -> (Some (FIX_PosMaintAction_New))
        | "2" -> (Some (FIX_PosMaintAction_Replace))
        | "3" -> (Some (FIX_PosMaintAction_Cancel))
        | _ -> (None)
;;

let parse_PosMaintResult ( str ) =
    match str with
        | "0" -> (Some (FIX_PosMaintResult_SuccessfulCompletion))
        | "1" -> (Some (FIX_PosMaintResult_Rejected))
        | "99" -> (Some (FIX_PosMaintResult_Other))
        | _ -> (None)
;;

let parse_PosMaintStatus ( str ) =
    match str with
        | "0" -> (Some (FIX_PosMaintStatus_Accepted))
        | "1" -> (Some (FIX_PosMaintStatus_AcceptedWithWarnings))
        | "2" -> (Some (FIX_PosMaintStatus_Rejected))
        | "3" -> (Some (FIX_PosMaintStatus_Completed))
        | "4" -> (Some (FIX_PosMaintStatus_CompletedWithWarnings))
        | _ -> (None)
;;

let parse_PosQtyStatus ( str ) =
    match str with
        | "0" -> (Some (FIX_PosQtyStatus_Submitted))
        | "1" -> (Some (FIX_PosQtyStatus_Accepted))
        | "2" -> (Some (FIX_PosQtyStatus_Rejected))
        | _ -> (None)
;;

let parse_PosReqResult ( str ) =
    match str with
        | "0" -> (Some (FIX_PosReqResult_ValidRequest))
        | "1" -> (Some (FIX_PosReqResult_InvalidOrUnsupportedRequest))
        | "2" -> (Some (FIX_PosReqResult_NoPositionsFoundThatMatchCriteria))
        | "3" -> (Some (FIX_PosReqResult_NotAuthorizedToRequestPositions))
        | "4" -> (Some (FIX_PosReqResult_RequestForPositionNotSupported))
        | "99" -> (Some (FIX_PosReqResult_Other))
        | _ -> (None)
;;

let parse_PosReqStatus ( str ) =
    match str with
        | "0" -> (Some (FIX_PosReqStatus_Completed))
        | "1" -> (Some (FIX_PosReqStatus_CompletedWithWarnings))
        | "2" -> (Some (FIX_PosReqStatus_Rejected))
        | _ -> (None)
;;

let parse_PosReqType ( str ) =
    match str with
        | "0" -> (Some (FIX_PosReqType_Positions))
        | "1" -> (Some (FIX_PosReqType_Trades))
        | "2" -> (Some (FIX_PosReqType_Exercises))
        | "3" -> (Some (FIX_PosReqType_Assignments))
        | _ -> (None)
;;

let parse_PosTransType ( str ) =
    match str with
        | "1" -> (Some (FIX_PosTransType_Exercise))
        | "2" -> (Some (FIX_PosTransType_DoNotExercise))
        | "3" -> (Some (FIX_PosTransType_PositionAdjustment))
        | "4" -> (Some (FIX_PosTransType_PositionChangeSubmission))
        | "5" -> (Some (FIX_PosTransType_Pledge))
        | _ -> (None)
;;

let parse_PosType ( str ) =
    match str with
        | "TQ" -> (Some (FIX_PosType_TransactionQuantity))
        | "IAS" -> (Some (FIX_PosType_IntraSpreadQty))
        | "IES" -> (Some (FIX_PosType_InterSpreadQty))
        | "FIN" -> (Some (FIX_PosType_EndOfDayQty))
        | "SOD" -> (Some (FIX_PosType_StartOfDayQty))
        | "EX" -> (Some (FIX_PosType_OptionExerciseQty))
        | "AS" -> (Some (FIX_PosType_OptionAssignment))
        | "TX" -> (Some (FIX_PosType_TransactionFromExercise))
        | "TA" -> (Some (FIX_PosType_TransactionFromAssignment))
        | "PIT" -> (Some (FIX_PosType_PitTradeQty))
        | "TRF" -> (Some (FIX_PosType_TransferTradeQty))
        | "ETR" -> (Some (FIX_PosType_ElectronicTradeQty))
        | "ALC" -> (Some (FIX_PosType_AllocationTradeQty))
        | "PA" -> (Some (FIX_PosType_AdjustmentQty))
        | "ASF" -> (Some (FIX_PosType_AsOfTradeQty))
        | "DLV" -> (Some (FIX_PosType_DeliveryQty))
        | "TOT" -> (Some (FIX_PosType_TotalTransactionQty))
        | "XM" -> (Some (FIX_PosType_CrossMarginQty))
        | "SPL" -> (Some (FIX_PosType_IntegralSplit))
        | _ -> (None)
;;

let parse_PositionEffect ( str ) =
    match str with
        | "O" -> (Some (FIX_PositionEffect_Open))
        | "C" -> (Some (FIX_PositionEffect_Close))
        | "R" -> (Some (FIX_PositionEffect_Rolled))
        | "F" -> (Some (FIX_PositionEffect_FIFO))
        | _ -> (None)
;;

let parse_PossDupFlag ( str ) =
    match str with
        | "Y" -> (Some (FIX_PossDupFlag_PossibleDuplicate))
        | "N" -> (Some (FIX_PossDupFlag_OriginalTransmission))
        | _ -> (None)
;;

let parse_PossResend ( str ) =
    match str with
        | "Y" -> (Some (FIX_PossResend_PossibleResend))
        | "N" -> (Some (FIX_PossResend_OriginalTransmission))
        | _ -> (None)
;;

let parse_PreallocMethod ( str ) =
    match str with
        | "0" -> (Some (FIX_PreallocMethod_ProRata))
        | "1" -> (Some (FIX_PreallocMethod_DoNotProRata))
        | _ -> (None)
;;

let parse_PreviouslyReported ( str ) =
    match str with
        | "Y" -> (Some (FIX_PreviouslyReported_PerviouslyReportedToCounterparty))
        | "N" -> (Some (FIX_PreviouslyReported_NotReportedToCounterparty))
        | _ -> (None)
;;

let parse_PriceType ( str ) =
    match str with
        | "1" -> (Some (FIX_PriceType_Percentage))
        | "2" -> (Some (FIX_PriceType_PerUnit))
        | "3" -> (Some (FIX_PriceType_FixedAmount))
        | "4" -> (Some (FIX_PriceType_Discount))
        | "5" -> (Some (FIX_PriceType_Premium))
        | "6" -> (Some (FIX_PriceType_Spread))
        | "7" -> (Some (FIX_PriceType_TEDPrice))
        | "8" -> (Some (FIX_PriceType_TEDYield))
        | "9" -> (Some (FIX_PriceType_Yield))
        | "10" -> (Some (FIX_PriceType_FixedCabinetTradePrice))
        | "11" -> (Some (FIX_PriceType_VariableCabinetTradePrice))
        | _ -> (None)
;;

let parse_PriorityIndicator ( str ) =
    match str with
        | "0" -> (Some (FIX_PriorityIndicator_PriorityUnchanged))
        | "1" -> (Some (FIX_PriorityIndicator_LostPriorityAsResultOfOrderChange))
        | _ -> (None)
;;

let parse_ProcessCode ( str ) =
    match str with
        | "0" -> (Some (FIX_ProcessCode_Regular))
        | "1" -> (Some (FIX_ProcessCode_SoftDollar))
        | "2" -> (Some (FIX_ProcessCode_StepIn))
        | "3" -> (Some (FIX_ProcessCode_StepOut))
        | "4" -> (Some (FIX_ProcessCode_SoftDollarStepIn))
        | "5" -> (Some (FIX_ProcessCode_SoftDollarStepOut))
        | "6" -> (Some (FIX_ProcessCode_PlanSponsor))
        | _ -> (None)
;;

let parse_Product ( str ) =
    match str with
        | "1" -> (Some (FIX_Product_AGENCY))
        | "2" -> (Some (FIX_Product_COMMODITY))
        | "3" -> (Some (FIX_Product_CORPORATE))
        | "4" -> (Some (FIX_Product_CURRENCY))
        | "5" -> (Some (FIX_Product_EQUITY))
        | "6" -> (Some (FIX_Product_GOVERNMENT))
        | "7" -> (Some (FIX_Product_INDEX))
        | "8" -> (Some (FIX_Product_LOAN))
        | "9" -> (Some (FIX_Product_MONEYMARKET))
        | "10" -> (Some (FIX_Product_MORTGAGE))
        | "11" -> (Some (FIX_Product_MUNICIPAL))
        | "12" -> (Some (FIX_Product_OTHER))
        | "13" -> (Some (FIX_Product_FINANCING))
        | _ -> (None)
;;

let parse_ProgRptReqs ( str ) =
    match str with
        | "1" -> (Some (FIX_ProgRptReqs_BuySideRequests))
        | "2" -> (Some (FIX_ProgRptReqs_SellSideSends))
        | "3" -> (Some (FIX_ProgRptReqs_RealTimeExecutionReports))
        | _ -> (None)
;;

let parse_PublishTrdIndicator ( str ) =
    match str with
        | "Y" -> (Some (FIX_PublishTrdIndicator_ReportTrade))
        | "N" -> (Some (FIX_PublishTrdIndicator_DoNotReportTrade))
        | _ -> (None)
;;

let parse_PutOrCall ( str ) =
    match str with
        | "0" -> (Some (FIX_PutOrCall_Put))
        | "1" -> (Some (FIX_PutOrCall_Call))
        | _ -> (None)
;;

let parse_QtyType ( str ) =
    match str with
        | "0" -> (Some (FIX_QtyType_Units))
        | "1" -> (Some (FIX_QtyType_Contracts))
        | _ -> (None)
;;

let parse_QuoteCancelType ( str ) =
    match str with
        | "1" -> (Some (FIX_QuoteCancelType_CancelForOneOrMoreSecurities))
        | "2" -> (Some (FIX_QuoteCancelType_CancelForSecurityType))
        | "3" -> (Some (FIX_QuoteCancelType_CancelForUnderlyingSecurity))
        | "4" -> (Some (FIX_QuoteCancelType_CancelAllQuotes))
        | _ -> (None)
;;

let parse_QuoteCondition ( str ) =
    match str with
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
;;

let parse_QuotePriceType ( str ) =
    match str with
        | "1" -> (Some (FIX_QuotePriceType_Percent))
        | "2" -> (Some (FIX_QuotePriceType_PerShare))
        | "3" -> (Some (FIX_QuotePriceType_FixedAmount))
        | "4" -> (Some (FIX_QuotePriceType_Discount))
        | "5" -> (Some (FIX_QuotePriceType_Premium))
        | "6" -> (Some (FIX_QuotePriceType_Spread))
        | "7" -> (Some (FIX_QuotePriceType_TEDPrice))
        | "8" -> (Some (FIX_QuotePriceType_TEDYield))
        | "9" -> (Some (FIX_QuotePriceType_YieldSpread))
        | "10" -> (Some (FIX_QuotePriceType_Yield))
        | _ -> (None)
;;

let parse_QuoteRejectReason ( str ) =
    match str with
        | "1" -> (Some (FIX_QuoteRejectReason_UnknownSymbol))
        | "2" -> (Some (FIX_QuoteRejectReason_Exchange))
        | "3" -> (Some (FIX_QuoteRejectReason_QuoteRequestExceedsLimit))
        | "4" -> (Some (FIX_QuoteRejectReason_TooLateToEnter))
        | "5" -> (Some (FIX_QuoteRejectReason_UnknownQuote))
        | "6" -> (Some (FIX_QuoteRejectReason_DuplicateQuote))
        | "7" -> (Some (FIX_QuoteRejectReason_InvalidBid))
        | "8" -> (Some (FIX_QuoteRejectReason_InvalidPrice))
        | "9" -> (Some (FIX_QuoteRejectReason_NotAuthorizedToQuoteSecurity))
        | "99" -> (Some (FIX_QuoteRejectReason_Other))
        | _ -> (None)
;;

let parse_QuoteRequestRejectReason ( str ) =
    match str with
        | "1" -> (Some (FIX_QuoteRequestRejectReason_UnknownSymbol))
        | "2" -> (Some (FIX_QuoteRequestRejectReason_Exchange))
        | "3" -> (Some (FIX_QuoteRequestRejectReason_QuoteRequestExceedsLimit))
        | "4" -> (Some (FIX_QuoteRequestRejectReason_TooLateToEnter))
        | "5" -> (Some (FIX_QuoteRequestRejectReason_InvalidPrice))
        | "6" -> (Some (FIX_QuoteRequestRejectReason_NotAuthorizedToRequestQuote))
        | "7" -> (Some (FIX_QuoteRequestRejectReason_NoMatchForInquiry))
        | "8" -> (Some (FIX_QuoteRequestRejectReason_NoMarketForInstrument))
        | "9" -> (Some (FIX_QuoteRequestRejectReason_NoInventory))
        | "10" -> (Some (FIX_QuoteRequestRejectReason_Pass))
        | "99" -> (Some (FIX_QuoteRequestRejectReason_Other))
        | _ -> (None)
;;

let parse_QuoteRequestType ( str ) =
    match str with
        | "1" -> (Some (FIX_QuoteRequestType_Manual))
        | "2" -> (Some (FIX_QuoteRequestType_Automatic))
        | _ -> (None)
;;

let parse_QuoteRespType ( str ) =
    match str with
        | "1" -> (Some (FIX_QuoteRespType_Hit))
        | "2" -> (Some (FIX_QuoteRespType_Counter))
        | "3" -> (Some (FIX_QuoteRespType_Expired))
        | "4" -> (Some (FIX_QuoteRespType_Cover))
        | "5" -> (Some (FIX_QuoteRespType_DoneAway))
        | "6" -> (Some (FIX_QuoteRespType_Pass))
        | _ -> (None)
;;

let parse_QuoteResponseLevel ( str ) =
    match str with
        | "0" -> (Some (FIX_QuoteResponseLevel_NoAcknowledgement))
        | "1" -> (Some (FIX_QuoteResponseLevel_AcknowledgeOnlyNegativeOrErroneousQuotes))
        | "2" -> (Some (FIX_QuoteResponseLevel_AcknowledgeEachQuoteMessage))
        | _ -> (None)
;;

let parse_QuoteStatus ( str ) =
    match str with
        | "0" -> (Some (FIX_QuoteStatus_Accepted))
        | "1" -> (Some (FIX_QuoteStatus_CancelForSymbol))
        | "2" -> (Some (FIX_QuoteStatus_CanceledForSecurityType))
        | "3" -> (Some (FIX_QuoteStatus_CanceledForUnderlying))
        | "4" -> (Some (FIX_QuoteStatus_CanceledAll))
        | "5" -> (Some (FIX_QuoteStatus_Rejected))
        | "6" -> (Some (FIX_QuoteStatus_RemovedFromMarket))
        | "7" -> (Some (FIX_QuoteStatus_Expired))
        | "8" -> (Some (FIX_QuoteStatus_Query))
        | "9" -> (Some (FIX_QuoteStatus_QuoteNotFound))
        | "10" -> (Some (FIX_QuoteStatus_Pending))
        | "11" -> (Some (FIX_QuoteStatus_Pass))
        | "12" -> (Some (FIX_QuoteStatus_LockedMarketWarning))
        | "13" -> (Some (FIX_QuoteStatus_CrossMarketWarning))
        | "14" -> (Some (FIX_QuoteStatus_CanceledDueToLockMarket))
        | "15" -> (Some (FIX_QuoteStatus_CanceledDueToCrossMarket))
        | _ -> (None)
;;

let parse_QuoteType ( str ) =
    match str with
        | "0" -> (Some (FIX_QuoteType_Indicative))
        | "1" -> (Some (FIX_QuoteType_Tradeable))
        | "2" -> (Some (FIX_QuoteType_RestrictedTradeable))
        | "3" -> (Some (FIX_QuoteType_Counter))
        | _ -> (None)
;;

let parse_RegistRejReasonCode ( str ) =
    match str with
        | "1" -> (Some (FIX_RegistRejReasonCode_InvalidAccountType))
        | "2" -> (Some (FIX_RegistRejReasonCode_InvalidTaxExemptType))
        | "3" -> (Some (FIX_RegistRejReasonCode_InvalidOwnershipType))
        | "4" -> (Some (FIX_RegistRejReasonCode_NoRegDetails))
        | "5" -> (Some (FIX_RegistRejReasonCode_InvalidRegSeqNo))
        | "6" -> (Some (FIX_RegistRejReasonCode_InvalidRegDetails))
        | "7" -> (Some (FIX_RegistRejReasonCode_InvalidMailingDetails))
        | "8" -> (Some (FIX_RegistRejReasonCode_InvalidMailingInstructions))
        | "9" -> (Some (FIX_RegistRejReasonCode_InvalidInvestorID))
        | "10" -> (Some (FIX_RegistRejReasonCode_InvalidInvestorIDSource))
        | "11" -> (Some (FIX_RegistRejReasonCode_InvalidDateOfBirth))
        | "12" -> (Some (FIX_RegistRejReasonCode_InvalidCountry))
        | "13" -> (Some (FIX_RegistRejReasonCode_InvalidDistribInstns))
        | "14" -> (Some (FIX_RegistRejReasonCode_InvalidPercentage))
        | "15" -> (Some (FIX_RegistRejReasonCode_InvalidPaymentMethod))
        | "16" -> (Some (FIX_RegistRejReasonCode_InvalidAccountName))
        | "17" -> (Some (FIX_RegistRejReasonCode_InvalidAgentCode))
        | "18" -> (Some (FIX_RegistRejReasonCode_InvalidAccountNum))
        | "99" -> (Some (FIX_RegistRejReasonCode_Other))
        | _ -> (None)
;;

let parse_RegistStatus ( str ) =
    match str with
        | "A" -> (Some (FIX_RegistStatus_Accepted))
        | "R" -> (Some (FIX_RegistStatus_Rejected))
        | "H" -> (Some (FIX_RegistStatus_Held))
        | "N" -> (Some (FIX_RegistStatus_Reminder))
        | _ -> (None)
;;

let parse_RegistTransType ( str ) =
    match str with
        | "0" -> (Some (FIX_RegistTransType_New))
        | "1" -> (Some (FIX_RegistTransType_Replace))
        | "2" -> (Some (FIX_RegistTransType_Cancel))
        | _ -> (None)
;;

let parse_ReportToExch ( str ) =
    match str with
        | "Y" -> (Some (FIX_ReportToExch_ReceiverReports))
        | "N" -> (Some (FIX_ReportToExch_SenderReports))
        | _ -> (None)
;;

let parse_ResetSeqNumFlag ( str ) =
    match str with
        | "Y" -> (Some (FIX_ResetSeqNumFlag_Yes))
        | "N" -> (Some (FIX_ResetSeqNumFlag_No))
        | _ -> (None)
;;

let parse_ResponseTransportType ( str ) =
    match str with
        | "0" -> (Some (FIX_ResponseTransportType_Inband))
        | "1" -> (Some (FIX_ResponseTransportType_OutOfBand))
        | _ -> (None)
;;

let parse_RoundingDirection ( str ) =
    match str with
        | "0" -> (Some (FIX_RoundingDirection_RoundToNearest))
        | "1" -> (Some (FIX_RoundingDirection_RoundDown))
        | "2" -> (Some (FIX_RoundingDirection_RoundUp))
        | _ -> (None)
;;

let parse_RoutingType ( str ) =
    match str with
        | "1" -> (Some (FIX_RoutingType_TargetFirm))
        | "2" -> (Some (FIX_RoutingType_TargetList))
        | "3" -> (Some (FIX_RoutingType_BlockFirm))
        | "4" -> (Some (FIX_RoutingType_BlockList))
        | _ -> (None)
;;

let parse_Scope ( str ) =
    match str with
        | "1" -> (Some (FIX_Scope_LocalMarket))
        | "2" -> (Some (FIX_Scope_National))
        | "3" -> (Some (FIX_Scope_Global))
        | _ -> (None)
;;

let parse_SecurityIDSource ( str ) =
    match str with
        | "1" -> (Some (FIX_SecurityIDSource_CUSIP))
        | "2" -> (Some (FIX_SecurityIDSource_SEDOL))
        | "3" -> (Some (FIX_SecurityIDSource_QUIK))
        | "4" -> (Some (FIX_SecurityIDSource_ISINNumber))
        | "5" -> (Some (FIX_SecurityIDSource_RICCode))
        | "6" -> (Some (FIX_SecurityIDSource_ISOCurrencyCode))
        | "7" -> (Some (FIX_SecurityIDSource_ISOCountryCode))
        | "8" -> (Some (FIX_SecurityIDSource_ExchangeSymbol))
        | "9" -> (Some (FIX_SecurityIDSource_ConsolidatedTapeAssociation))
        | "A" -> (Some (FIX_SecurityIDSource_BloombergSymbol))
        | "B" -> (Some (FIX_SecurityIDSource_Wertpapier))
        | "C" -> (Some (FIX_SecurityIDSource_Dutch))
        | "D" -> (Some (FIX_SecurityIDSource_Valoren))
        | "E" -> (Some (FIX_SecurityIDSource_Sicovam))
        | "F" -> (Some (FIX_SecurityIDSource_Belgian))
        | "G" -> (Some (FIX_SecurityIDSource_Common))
        | "H" -> (Some (FIX_SecurityIDSource_ClearingHouse))
        | "I" -> (Some (FIX_SecurityIDSource_ISDAFpMLSpecification))
        | "J" -> (Some (FIX_SecurityIDSource_OptionPriceReportingAuthority))
        | _ -> (None)
;;

let parse_SecurityListRequestType ( str ) =
    match str with
        | "0" -> (Some (FIX_SecurityListRequestType_Symbol))
        | "1" -> (Some (FIX_SecurityListRequestType_SecurityTypeAnd))
        | "2" -> (Some (FIX_SecurityListRequestType_Product))
        | "3" -> (Some (FIX_SecurityListRequestType_TradingSessionID))
        | "4" -> (Some (FIX_SecurityListRequestType_AllSecurities))
        | _ -> (None)
;;

let parse_SecurityRequestResult ( str ) =
    match str with
        | "0" -> (Some (FIX_SecurityRequestResult_ValidRequest))
        | "1" -> (Some (FIX_SecurityRequestResult_InvalidOrUnsupportedRequest))
        | "2" -> (Some (FIX_SecurityRequestResult_NoInstrumentsFound))
        | "3" -> (Some (FIX_SecurityRequestResult_NotAuthorizedToRetrieveInstrumentData))
        | "4" -> (Some (FIX_SecurityRequestResult_InstrumentDataTemporarilyUnavailable))
        | "5" -> (Some (FIX_SecurityRequestResult_RequestForInstrumentDataNotSupported))
        | _ -> (None)
;;

let parse_SecurityRequestType ( str ) =
    match str with
        | "0" -> (Some (FIX_SecurityRequestType_RequestSecurityIdentityAndSpecifications))
        | "1" -> (Some (FIX_SecurityRequestType_RequestSecurityIdentityForSpecifications))
        | "2" -> (Some (FIX_SecurityRequestType_RequestListSecurityTypes))
        | "3" -> (Some (FIX_SecurityRequestType_RequestListSecurities))
        | _ -> (None)
;;

let parse_SecurityResponseType ( str ) =
    match str with
        | "1" -> (Some (FIX_SecurityResponseType_AcceptAsIs))
        | "2" -> (Some (FIX_SecurityResponseType_AcceptWithRevisions))
        | "5" -> (Some (FIX_SecurityResponseType_RejectSecurityProposal))
        | "6" -> (Some (FIX_SecurityResponseType_CannotMatchSelectionCriteria))
        | _ -> (None)
;;

let parse_SecurityTradingStatus ( str ) =
    match str with
        | "1" -> (Some (FIX_SecurityTradingStatus_OpeningDelay))
        | "2" -> (Some (FIX_SecurityTradingStatus_TradingHalt))
        | "3" -> (Some (FIX_SecurityTradingStatus_Resume))
        | "4" -> (Some (FIX_SecurityTradingStatus_NoOpen))
        | "5" -> (Some (FIX_SecurityTradingStatus_PriceIndication))
        | "6" -> (Some (FIX_SecurityTradingStatus_TradingRangeIndication))
        | "7" -> (Some (FIX_SecurityTradingStatus_MarketImbalanceBuy))
        | "8" -> (Some (FIX_SecurityTradingStatus_MarketImbalanceSell))
        | "9" -> (Some (FIX_SecurityTradingStatus_MarketOnCloseImbalanceBuy))
        | "10" -> (Some (FIX_SecurityTradingStatus_MarketOnCloseImbalanceSell))
        | "12" -> (Some (FIX_SecurityTradingStatus_NoMarketImbalance))
        | "13" -> (Some (FIX_SecurityTradingStatus_NoMarketOnCloseImbalance))
        | "14" -> (Some (FIX_SecurityTradingStatus_ITSPreOpening))
        | "15" -> (Some (FIX_SecurityTradingStatus_NewPriceIndication))
        | "16" -> (Some (FIX_SecurityTradingStatus_TradeDisseminationTime))
        | "17" -> (Some (FIX_SecurityTradingStatus_ReadyToTrade))
        | "18" -> (Some (FIX_SecurityTradingStatus_NotAvailableForTrading))
        | "19" -> (Some (FIX_SecurityTradingStatus_NotTradedOnThisMarket))
        | "20" -> (Some (FIX_SecurityTradingStatus_UnknownOrInvalid))
        | "21" -> (Some (FIX_SecurityTradingStatus_PreOpen))
        | "22" -> (Some (FIX_SecurityTradingStatus_OpeningRotation))
        | "23" -> (Some (FIX_SecurityTradingStatus_FastMarket))
        | _ -> (None)
;;

let parse_SecurityType ( str ) =
    match str with
        | "FUT" -> (Some (FIX_SecurityType_Future))
        | "OPT" -> (Some (FIX_SecurityType_Option))
        | "EUSUPRA" -> (Some (FIX_SecurityType_EuroSupranationalCoupons))
        | "FAC" -> (Some (FIX_SecurityType_FederalAgencyCoupon))
        | "FADN" -> (Some (FIX_SecurityType_FederalAgencyDiscountNote))
        | "PEF" -> (Some (FIX_SecurityType_PrivateExportFunding))
        | "SUPRA" -> (Some (FIX_SecurityType_USDSupranationalCoupons))
        | "CORP" -> (Some (FIX_SecurityType_CorporateBond))
        | "CPP" -> (Some (FIX_SecurityType_CorporatePrivatePlacement))
        | "CB" -> (Some (FIX_SecurityType_ConvertibleBond))
        | "DUAL" -> (Some (FIX_SecurityType_DualCurrency))
        | "EUCORP" -> (Some (FIX_SecurityType_EuroCorporateBond))
        | "XLINKD" -> (Some (FIX_SecurityType_IndexedLinked))
        | "STRUCT" -> (Some (FIX_SecurityType_StructuredNotes))
        | "YANK" -> (Some (FIX_SecurityType_YankeeCorporateBond))
        | "FOR" -> (Some (FIX_SecurityType_ForeignExchangeContract))
        | "CS" -> (Some (FIX_SecurityType_CommonStock))
        | "PS" -> (Some (FIX_SecurityType_PreferredStock))
        | "BRADY" -> (Some (FIX_SecurityType_BradyBond))
        | "EUSOV" -> (Some (FIX_SecurityType_EuroSovereigns))
        | "TBOND" -> (Some (FIX_SecurityType_USTreasuryBond))
        | "TINT" -> (Some (FIX_SecurityType_InterestStripFromAnyBondOrNote))
        | "TIPS" -> (Some (FIX_SecurityType_TreasuryInflationProtectedSecurities))
        | "TCAL" -> (Some (FIX_SecurityType_PrincipalStripOfACallableBondOrNote))
        | "TPRN" -> (Some (FIX_SecurityType_PrincipalStripFromANonCallableBondOrNote))
        | "UST" -> (Some (FIX_SecurityType_USTreasuryNoteOld))
        | "USTB" -> (Some (FIX_SecurityType_USTreasuryBillOld))
        | "TNOTE" -> (Some (FIX_SecurityType_USTreasuryNote))
        | "TBILL" -> (Some (FIX_SecurityType_USTreasuryBill))
        | "REPO" -> (Some (FIX_SecurityType_Repurchase))
        | "FORWARD" -> (Some (FIX_SecurityType_Forward))
        | "BUYSELL" -> (Some (FIX_SecurityType_BuySellback))
        | "SECLOAN" -> (Some (FIX_SecurityType_SecuritiesLoan))
        | "SECPLEDGE" -> (Some (FIX_SecurityType_SecuritiesPledge))
        | "TERM" -> (Some (FIX_SecurityType_TermLoan))
        | "RVLV" -> (Some (FIX_SecurityType_RevolverLoan))
        | "RVLVTRM" -> (Some (FIX_SecurityType_Revolver))
        | "BRIDGE" -> (Some (FIX_SecurityType_BridgeLoan))
        | "LOFC" -> (Some (FIX_SecurityType_LetterOfCredit))
        | "SWING" -> (Some (FIX_SecurityType_SwingLineFacility))
        | "DINP" -> (Some (FIX_SecurityType_DebtorInPossession))
        | "DEFLTED" -> (Some (FIX_SecurityType_Defaulted))
        | "WITHDRN" -> (Some (FIX_SecurityType_Withdrawn))
        | "REPLACD" -> (Some (FIX_SecurityType_Replaced))
        | "MATURED" -> (Some (FIX_SecurityType_Matured))
        | "AMENDED" -> (Some (FIX_SecurityType_Amended))
        | "RETIRED" -> (Some (FIX_SecurityType_Retired))
        | "BA" -> (Some (FIX_SecurityType_BankersAcceptance))
        | "BN" -> (Some (FIX_SecurityType_BankNotes))
        | "BOX" -> (Some (FIX_SecurityType_BillOfExchanges))
        | "CD" -> (Some (FIX_SecurityType_CertificateOfDeposit))
        | "CL" -> (Some (FIX_SecurityType_CallLoans))
        | "CP" -> (Some (FIX_SecurityType_CommercialPaper))
        | "DN" -> (Some (FIX_SecurityType_DepositNotes))
        | "EUCD" -> (Some (FIX_SecurityType_EuroCertificateOfDeposit))
        | "EUCP" -> (Some (FIX_SecurityType_EuroCommercialPaper))
        | "LQN" -> (Some (FIX_SecurityType_LiquidityNote))
        | "MTN" -> (Some (FIX_SecurityType_MediumTermNotes))
        | "ONITE" -> (Some (FIX_SecurityType_Overnight))
        | "PN" -> (Some (FIX_SecurityType_PromissoryNote))
        | "PZFJ" -> (Some (FIX_SecurityType_PlazosFijos))
        | "STN" -> (Some (FIX_SecurityType_ShortTermLoanNote))
        | "TD" -> (Some (FIX_SecurityType_TimeDeposit))
        | "XCN" -> (Some (FIX_SecurityType_ExtendedCommNote))
        | "YCD" -> (Some (FIX_SecurityType_YankeeCertificateOfDeposit))
        | "ABS" -> (Some (FIX_SecurityType_AssetBackedSecurities))
        | "CMBS" -> (Some (FIX_SecurityType_Corp))
        | "CMO" -> (Some (FIX_SecurityType_CollateralizedMortgageObligation))
        | "IET" -> (Some (FIX_SecurityType_IOETTEMortgage))
        | "MBS" -> (Some (FIX_SecurityType_MortgageBackedSecurities))
        | "MIO" -> (Some (FIX_SecurityType_MortgageInterestOnly))
        | "MPO" -> (Some (FIX_SecurityType_MortgagePrincipalOnly))
        | "MPP" -> (Some (FIX_SecurityType_MortgagePrivatePlacement))
        | "MPT" -> (Some (FIX_SecurityType_MiscellaneousPassThrough))
        | "PFAND" -> (Some (FIX_SecurityType_Pfandbriefe))
        | "TBA" -> (Some (FIX_SecurityType_ToBeAnnounced))
        | "AN" -> (Some (FIX_SecurityType_OtherAnticipationNotes))
        | "COFO" -> (Some (FIX_SecurityType_CertificateOfObligation))
        | "COFP" -> (Some (FIX_SecurityType_CertificateOfParticipation))
        | "GO" -> (Some (FIX_SecurityType_GeneralObligationBonds))
        | "MT" -> (Some (FIX_SecurityType_MandatoryTender))
        | "RAN" -> (Some (FIX_SecurityType_RevenueAnticipationNote))
        | "REV" -> (Some (FIX_SecurityType_RevenueBonds))
        | "SPCLA" -> (Some (FIX_SecurityType_SpecialAssessment))
        | "SPCLO" -> (Some (FIX_SecurityType_SpecialObligation))
        | "SPCLT" -> (Some (FIX_SecurityType_SpecialTax))
        | "TAN" -> (Some (FIX_SecurityType_TaxAnticipationNote))
        | "TAXA" -> (Some (FIX_SecurityType_TaxAllocation))
        | "TECP" -> (Some (FIX_SecurityType_TaxExemptCommercialPaper))
        | "TRAN" -> (Some (FIX_SecurityType_TaxRevenueAnticipationNote))
        | "VRDN" -> (Some (FIX_SecurityType_VariableRateDemandNote))
        | "WAR" -> (Some (FIX_SecurityType_Warrant))
        | "MF" -> (Some (FIX_SecurityType_MutualFund))
        | "MLEG" -> (Some (FIX_SecurityType_MultilegInstrument))
        | "NONE" -> (Some (FIX_SecurityType_NoSecurityType))
        | _ -> (None)
;;

let parse_SessionRejectReason ( str ) =
    match str with
        | "0" -> (Some (FIX_SessionRejectReason_InvalidTagNumber))
        | "1" -> (Some (FIX_SessionRejectReason_RequiredTagMissing))
        | "2" -> (Some (FIX_SessionRejectReason_TagNotDefinedForThisMessageType))
        | "3" -> (Some (FIX_SessionRejectReason_UndefinedTag))
        | "4" -> (Some (FIX_SessionRejectReason_TagSpecifiedWithoutAValue))
        | "5" -> (Some (FIX_SessionRejectReason_ValueIsIncorrect))
        | "6" -> (Some (FIX_SessionRejectReason_IncorrectDataFormatForValue))
        | "7" -> (Some (FIX_SessionRejectReason_DecryptionProblem))
        | "8" -> (Some (FIX_SessionRejectReason_SignatureProblem))
        | "9" -> (Some (FIX_SessionRejectReason_CompIDProblem))
        | "10" -> (Some (FIX_SessionRejectReason_SendingTimeAccuracyProblem))
        | "11" -> (Some (FIX_SessionRejectReason_InvalidMsgType))
        | "12" -> (Some (FIX_SessionRejectReason_XMLValidationError))
        | "13" -> (Some (FIX_SessionRejectReason_TagAppearsMoreThanOnce))
        | "14" -> (Some (FIX_SessionRejectReason_TagSpecifiedOutOfRequiredOrder))
        | "15" -> (Some (FIX_SessionRejectReason_RepeatingGroupFieldsOutOfOrder))
        | "16" -> (Some (FIX_SessionRejectReason_IncorrectNumInGroupCountForRepeatingGroup))
        | "17" -> (Some (FIX_SessionRejectReason_Non))
        | "99" -> (Some (FIX_SessionRejectReason_Other))
        | _ -> (None)
;;

let parse_SettlCurrFxRateCalc ( str ) =
    match str with
        | "M" -> (Some (FIX_SettlCurrFxRateCalc_Multiply))
        | "D" -> (Some (FIX_SettlCurrFxRateCalc_Divide))
        | _ -> (None)
;;

let parse_SettlDeliveryType ( str ) =
    match str with
        | "0" -> (Some (FIX_SettlDeliveryType_Versus))
        | "1" -> (Some (FIX_SettlDeliveryType_Free))
        | "2" -> (Some (FIX_SettlDeliveryType_TriParty))
        | "3" -> (Some (FIX_SettlDeliveryType_HoldInCustody))
        | _ -> (None)
;;

let parse_SettlInstMode ( str ) =
    match str with
        | "1" -> (Some (FIX_SettlInstMode_StandingInstructionsProvided))
        | "4" -> (Some (FIX_SettlInstMode_SpecificOrderForASingleAccount))
        | "5" -> (Some (FIX_SettlInstMode_RequestReject))
        | _ -> (None)
;;

let parse_SettlInstReqRejCode ( str ) =
    match str with
        | "0" -> (Some (FIX_SettlInstReqRejCode_UnableToProcessRequest))
        | "1" -> (Some (FIX_SettlInstReqRejCode_UnknownAccount))
        | "2" -> (Some (FIX_SettlInstReqRejCode_NoMatchingSettlementInstructionsFound))
        | "99" -> (Some (FIX_SettlInstReqRejCode_Other))
        | _ -> (None)
;;

let parse_SettlInstSource ( str ) =
    match str with
        | "1" -> (Some (FIX_SettlInstSource_BrokerCredit))
        | "2" -> (Some (FIX_SettlInstSource_Institution))
        | "3" -> (Some (FIX_SettlInstSource_Investor))
        | _ -> (None)
;;

let parse_SettlInstTransType ( str ) =
    match str with
        | "N" -> (Some (FIX_SettlInstTransType_New))
        | "C" -> (Some (FIX_SettlInstTransType_Cancel))
        | "R" -> (Some (FIX_SettlInstTransType_Replace))
        | "T" -> (Some (FIX_SettlInstTransType_Restate))
        | _ -> (None)
;;

let parse_SettlPriceType ( str ) =
    match str with
        | "1" -> (Some (FIX_SettlPriceType_Final))
        | "2" -> (Some (FIX_SettlPriceType_Theoretical))
        | _ -> (None)
;;

let parse_SettlSessID ( str ) =
    match str with
        | "ITD" -> (Some (FIX_SettlSessID_Intraday))
        | "RTH" -> (Some (FIX_SettlSessID_RegularTradingHours))
        | "ETH" -> (Some (FIX_SettlSessID_ElectronicTradingHours))
        | _ -> (None)
;;

let parse_SettlType ( str ) =
    match str with
        | "0" -> (Some (FIX_SettlType_Regular))
        | "1" -> (Some (FIX_SettlType_Cash))
        | "2" -> (Some (FIX_SettlType_NextDay))
        | "3" -> (Some (FIX_SettlType_TPlus2))
        | "4" -> (Some (FIX_SettlType_TPlus3))
        | "5" -> (Some (FIX_SettlType_TPlus4))
        | "6" -> (Some (FIX_SettlType_Future))
        | "7" -> (Some (FIX_SettlType_WhenAndIfIssued))
        | "8" -> (Some (FIX_SettlType_SellersOption))
        | "9" -> (Some (FIX_SettlType_TPlus5))
        | _ -> (None)
;;

let parse_ShortSaleReason ( str ) =
    match str with
        | "0" -> (Some (FIX_ShortSaleReason_DealerSoldShort))
        | "1" -> (Some (FIX_ShortSaleReason_DealerSoldShortExempt))
        | "2" -> (Some (FIX_ShortSaleReason_SellingCustomerSoldShort))
        | "3" -> (Some (FIX_ShortSaleReason_SellingCustomerSoldShortExempt))
        | "4" -> (Some (FIX_ShortSaleReason_QualifiedServiceRepresentative))
        | "5" -> (Some (FIX_ShortSaleReason_QSROrAGUContraSideSoldShortExempt))
        | _ -> (None)
;;

let parse_Side ( str ) =
    match str with
        | "1" -> (Some (FIX_Side_Buy))
        | "2" -> (Some (FIX_Side_Sell))
        | "3" -> (Some (FIX_Side_BuyMinus))
        | "4" -> (Some (FIX_Side_SellPlus))
        | "5" -> (Some (FIX_Side_SellShort))
        | "6" -> (Some (FIX_Side_SellShortExempt))
        | "7" -> (Some (FIX_Side_Undisclosed))
        | "8" -> (Some (FIX_Side_Cross))
        | "9" -> (Some (FIX_Side_CrossShort))
        | "A" -> (Some (FIX_Side_CrossShortExempt))
        | "B" -> (Some (FIX_Side_AsDefined))
        | "C" -> (Some (FIX_Side_Opposite))
        | "D" -> (Some (FIX_Side_Subscribe))
        | "E" -> (Some (FIX_Side_Redeem))
        | "F" -> (Some (FIX_Side_Lend))
        | "G" -> (Some (FIX_Side_Borrow))
        | _ -> (None)
;;

let parse_SideMultiLegReportingType ( str ) =
    match str with
        | "1" -> (Some (FIX_SideMultiLegReportingType_SingleSecurity))
        | "2" -> (Some (FIX_SideMultiLegReportingType_IndividualLegOfAMultilegSecurity))
        | "3" -> (Some (FIX_SideMultiLegReportingType_MultilegSecurity))
        | _ -> (None)
;;

let parse_SideValueInd ( str ) =
    match str with
        | "1" -> (Some (FIX_SideValueInd_SideValue1))
        | "2" -> (Some (FIX_SideValueInd_SideValue2))
        | _ -> (None)
;;

let parse_SolicitedFlag ( str ) =
    match str with
        | "Y" -> (Some (FIX_SolicitedFlag_WasSolicited))
        | "N" -> (Some (FIX_SolicitedFlag_WasNotSolicited))
        | _ -> (None)
;;

let parse_StandInstDbType ( str ) =
    match str with
        | "0" -> (Some (FIX_StandInstDbType_Other))
        | "1" -> (Some (FIX_StandInstDbType_DTCSID))
        | "2" -> (Some (FIX_StandInstDbType_ThomsonALERT))
        | "3" -> (Some (FIX_StandInstDbType_AGlobalCustodian))
        | "4" -> (Some (FIX_StandInstDbType_AccountNet))
        | _ -> (None)
;;

let parse_StatusValue ( str ) =
    match str with
        | "1" -> (Some (FIX_StatusValue_Connected))
        | "2" -> (Some (FIX_StatusValue_NotConnectedUnexpected))
        | "3" -> (Some (FIX_StatusValue_NotConnectedExpected))
        | "4" -> (Some (FIX_StatusValue_InProcess))
        | _ -> (None)
;;

let parse_StipulationType ( str ) =
    match str with
        | "AMT" -> (Some (FIX_StipulationType_AlternativeMinimumTax))
        | "AUTOREINV" -> (Some (FIX_StipulationType_AutoReinvestment))
        | "BANKQUAL" -> (Some (FIX_StipulationType_BankQualified))
        | "BGNCON" -> (Some (FIX_StipulationType_BargainConditions))
        | "COUPON" -> (Some (FIX_StipulationType_CouponRange))
        | "CURRENCY" -> (Some (FIX_StipulationType_ISOCurrencyCode))
        | "CUSTOMDATE" -> (Some (FIX_StipulationType_CustomStart))
        | "GEOG" -> (Some (FIX_StipulationType_Geographics))
        | "HAIRCUT" -> (Some (FIX_StipulationType_ValuationDiscount))
        | "INSURED" -> (Some (FIX_StipulationType_Insured))
        | "ISSUE" -> (Some (FIX_StipulationType_IssueDate))
        | "ISSUER" -> (Some (FIX_StipulationType_Issuer))
        | "ISSUESIZE" -> (Some (FIX_StipulationType_IssueSizeRange))
        | "LOOKBACK" -> (Some (FIX_StipulationType_LookbackDays))
        | "LOT" -> (Some (FIX_StipulationType_ExplicitLotIdentifier))
        | "LOTVAR" -> (Some (FIX_StipulationType_LotVariance))
        | "MAT" -> (Some (FIX_StipulationType_MaturityYearAndMonth))
        | "MATURITY" -> (Some (FIX_StipulationType_MaturityRange))
        | "MAXSUBS" -> (Some (FIX_StipulationType_MaximumSubstitutions))
        | "MINQTY" -> (Some (FIX_StipulationType_MinimumQuantity))
        | "MININCR" -> (Some (FIX_StipulationType_MinimumIncrement))
        | "MINDNOM" -> (Some (FIX_StipulationType_MinimumDenomination))
        | "PAYFREQ" -> (Some (FIX_StipulationType_PaymentFrequency))
        | "PIECES" -> (Some (FIX_StipulationType_NumberOfPieces))
        | "PMAX" -> (Some (FIX_StipulationType_PoolsMaximum))
        | "PPM" -> (Some (FIX_StipulationType_PoolsPerMillion))
        | "PPL" -> (Some (FIX_StipulationType_PoolsPerLot))
        | "PPT" -> (Some (FIX_StipulationType_PoolsPerTrade))
        | "PRICE" -> (Some (FIX_StipulationType_PriceRange))
        | "PRICEFREQ" -> (Some (FIX_StipulationType_PricingFrequency))
        | "PROD" -> (Some (FIX_StipulationType_ProductionYear))
        | "PROTECT" -> (Some (FIX_StipulationType_CallProtection))
        | "PURPOSE" -> (Some (FIX_StipulationType_Purpose))
        | "PXSOURCE" -> (Some (FIX_StipulationType_BenchmarkPriceSource))
        | "RATING" -> (Some (FIX_StipulationType_RatingSourceAndRange))
        | "REDEMPTION" -> (Some (FIX_StipulationType_TypeOfRedemption))
        | "RESTRICTED" -> (Some (FIX_StipulationType_Restricted))
        | "SECTOR" -> (Some (FIX_StipulationType_MarketSector))
        | "SECTYPE" -> (Some (FIX_StipulationType_SecurityTypeIncludedOrExcluded))
        | "STRUCT" -> (Some (FIX_StipulationType_Structure))
        | "SUBSFREQ" -> (Some (FIX_StipulationType_SubstitutionsFrequency))
        | "SUBSLEFT" -> (Some (FIX_StipulationType_SubstitutionsLeft))
        | "TEXT" -> (Some (FIX_StipulationType_FreeformText))
        | "TRDVAR" -> (Some (FIX_StipulationType_TradeVariance))
        | "WAC" -> (Some (FIX_StipulationType_WeightedAverageCoupon))
        | "WAL" -> (Some (FIX_StipulationType_WeightedAverageLifeCoupon))
        | "WALA" -> (Some (FIX_StipulationType_WeightedAverageLoanAge))
        | "WAM" -> (Some (FIX_StipulationType_WeightedAverageMaturity))
        | "WHOLE" -> (Some (FIX_StipulationType_WholePool))
        | "YIELD" -> (Some (FIX_StipulationType_YieldRange))
        | _ -> (None)
;;

let parse_SubscriptionRequestType ( str ) =
    match str with
        | "0" -> (Some (FIX_SubscriptionRequestType_Snapshot))
        | "1" -> (Some (FIX_SubscriptionRequestType_SnapshotAndUpdates))
        | "2" -> (Some (FIX_SubscriptionRequestType_DisablePreviousSnapshot))
        | _ -> (None)
;;

let parse_TargetStrategy ( str ) =
    match str with
        | "1" -> (Some (FIX_TargetStrategy_VWAP))
        | "2" -> (Some (FIX_TargetStrategy_Participate))
        | "3" -> (Some (FIX_TargetStrategy_MininizeMarketImpact))
        | _ -> (None)
;;

let parse_TaxAdvantageType ( str ) =
    match str with
        | "0" -> (Some (FIX_TaxAdvantageType_Unknown))
        | "1" -> (Some (FIX_TaxAdvantageType_MaxiISA))
        | "2" -> (Some (FIX_TaxAdvantageType_TESSA))
        | "3" -> (Some (FIX_TaxAdvantageType_MiniCashISA))
        | "4" -> (Some (FIX_TaxAdvantageType_MiniStocksAndSharesISA))
        | "5" -> (Some (FIX_TaxAdvantageType_MiniInsuranceISA))
        | "6" -> (Some (FIX_TaxAdvantageType_CurrentYearPayment))
        | "7" -> (Some (FIX_TaxAdvantageType_PriorYearPayment))
        | "8" -> (Some (FIX_TaxAdvantageType_AssetTransfer))
        | "9" -> (Some (FIX_TaxAdvantageType_EmployeePriorYear))
        | "10" -> (Some (FIX_TaxAdvantageType_EmployeeCurrentYear))
        | "11" -> (Some (FIX_TaxAdvantageType_EmployerPriorYear))
        | "12" -> (Some (FIX_TaxAdvantageType_EmployerCurrentYear))
        | "13" -> (Some (FIX_TaxAdvantageType_NonFundPrototypeIRA))
        | "14" -> (Some (FIX_TaxAdvantageType_NonFundQualifiedPlan))
        | "15" -> (Some (FIX_TaxAdvantageType_DefinedContributionPlan))
        | "16" -> (Some (FIX_TaxAdvantageType_IRA))
        | "17" -> (Some (FIX_TaxAdvantageType_IRARollover))
        | "18" -> (Some (FIX_TaxAdvantageType_KEOGH))
        | "19" -> (Some (FIX_TaxAdvantageType_ProfitSharingPlan))
        | "20" -> (Some (FIX_TaxAdvantageType_US401K))
        | "21" -> (Some (FIX_TaxAdvantageType_SelfDirectedIRA))
        | "22" -> (Some (FIX_TaxAdvantageType_US403b))
        | "23" -> (Some (FIX_TaxAdvantageType_US457))
        | "24" -> (Some (FIX_TaxAdvantageType_RothIRAPrototype))
        | "25" -> (Some (FIX_TaxAdvantageType_RothIRANonPrototype))
        | "26" -> (Some (FIX_TaxAdvantageType_RothConversionIRAPrototype))
        | "27" -> (Some (FIX_TaxAdvantageType_RothConversionIRANonPrototype))
        | "28" -> (Some (FIX_TaxAdvantageType_EducationIRAPrototype))
        | "29" -> (Some (FIX_TaxAdvantageType_EducationIRANonPrototype))
        | _ -> (None)
;;

let parse_TerminationType ( str ) =
    match str with
        | "1" -> (Some (FIX_TerminationType_Overnight))
        | "2" -> (Some (FIX_TerminationType_Term))
        | "3" -> (Some (FIX_TerminationType_Flexible))
        | "4" -> (Some (FIX_TerminationType_Open))
        | _ -> (None)
;;

let parse_TestMessageIndicator ( str ) =
    match str with
        | "Y" -> (Some (FIX_TestMessageIndicator_True))
        | "N" -> (Some (FIX_TestMessageIndicator_Fales))
        | _ -> (None)
;;

let parse_TickDirection ( str ) =
    match str with
        | "0" -> (Some (FIX_TickDirection_PlusTick))
        | "1" -> (Some (FIX_TickDirection_ZeroPlusTick))
        | "2" -> (Some (FIX_TickDirection_MinusTick))
        | "3" -> (Some (FIX_TickDirection_ZeroMinusTick))
        | _ -> (None)
;;

let parse_TimeInForce ( str ) =
    match str with
        | "0" -> (Some (FIX_TimeInForce_Day))
        | "1" -> (Some (FIX_TimeInForce_GoodTillCancel))
        | "2" -> (Some (FIX_TimeInForce_AtTheOpening))
        | "3" -> (Some (FIX_TimeInForce_ImmediateOrCancel))
        | "4" -> (Some (FIX_TimeInForce_FillOrKill))
        | "5" -> (Some (FIX_TimeInForce_GoodTillCrossing))
        | "6" -> (Some (FIX_TimeInForce_GoodTillDate))
        | "7" -> (Some (FIX_TimeInForce_AtTheClose))
        | _ -> (None)
;;

let parse_TradSesMethod ( str ) =
    match str with
        | "1" -> (Some (FIX_TradSesMethod_Electronic))
        | "2" -> (Some (FIX_TradSesMethod_OpenOutcry))
        | "3" -> (Some (FIX_TradSesMethod_TwoParty))
        | _ -> (None)
;;

let parse_TradSesMode ( str ) =
    match str with
        | "1" -> (Some (FIX_TradSesMode_Testing))
        | "2" -> (Some (FIX_TradSesMode_Simulated))
        | "3" -> (Some (FIX_TradSesMode_Production))
        | _ -> (None)
;;

let parse_TradSesStatus ( str ) =
    match str with
        | "0" -> (Some (FIX_TradSesStatus_Unknown))
        | "1" -> (Some (FIX_TradSesStatus_Halted))
        | "2" -> (Some (FIX_TradSesStatus_Open))
        | "3" -> (Some (FIX_TradSesStatus_Closed))
        | "4" -> (Some (FIX_TradSesStatus_PreOpen))
        | "5" -> (Some (FIX_TradSesStatus_PreClose))
        | "6" -> (Some (FIX_TradSesStatus_RequestRejected))
        | _ -> (None)
;;

let parse_TradSesStatusRejReason ( str ) =
    match str with
        | "1" -> (Some (FIX_TradSesStatusRejReason_UnknownOrInvalidTradingSessionID))
        | "99" -> (Some (FIX_TradSesStatusRejReason_Other))
        | _ -> (None)
;;

let parse_TradeAllocIndicator ( str ) =
    match str with
        | "0" -> (Some (FIX_TradeAllocIndicator_AllocationNotRequired))
        | "1" -> (Some (FIX_TradeAllocIndicator_AllocationRequired))
        | "2" -> (Some (FIX_TradeAllocIndicator_UseAllocationProvidedWithTheTrade))
        | _ -> (None)
;;

let parse_TradeCondition ( str ) =
    match str with
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
        | "P" -> (Some (FIX_TradeCondition_ImbalanceMoreBuyers))
        | "Q" -> (Some (FIX_TradeCondition_ImbalanceMoreSellers))
        | "R" -> (Some (FIX_TradeCondition_OpeningPrice))
        | _ -> (None)
;;

let parse_TradeReportRejectReason ( str ) =
    match str with
        | "0" -> (Some (FIX_TradeReportRejectReason_Successful))
        | "1" -> (Some (FIX_TradeReportRejectReason_InvalidPartyOnformation))
        | "2" -> (Some (FIX_TradeReportRejectReason_UnknownInstrument))
        | "3" -> (Some (FIX_TradeReportRejectReason_UnauthorizedToReportTrades))
        | "4" -> (Some (FIX_TradeReportRejectReason_InvalidTradeType))
        | "99" -> (Some (FIX_TradeReportRejectReason_Other))
        | _ -> (None)
;;

let parse_TradeReportType ( str ) =
    match str with
        | "0" -> (Some (FIX_TradeReportType_Submit))
        | "1" -> (Some (FIX_TradeReportType_Alleged))
        | "2" -> (Some (FIX_TradeReportType_Accept))
        | "3" -> (Some (FIX_TradeReportType_Decline))
        | "4" -> (Some (FIX_TradeReportType_Addendum))
        | "5" -> (Some (FIX_TradeReportType_No))
        | "6" -> (Some (FIX_TradeReportType_TradeReportCancel))
        | "7" -> (Some (FIX_TradeReportType_LockedIn))
        | _ -> (None)
;;

let parse_TradeRequestResult ( str ) =
    match str with
        | "0" -> (Some (FIX_TradeRequestResult_Successful))
        | "1" -> (Some (FIX_TradeRequestResult_InvalidOrUnknownInstrument))
        | "2" -> (Some (FIX_TradeRequestResult_InvalidTypeOfTradeRequested))
        | "3" -> (Some (FIX_TradeRequestResult_InvalidParties))
        | "4" -> (Some (FIX_TradeRequestResult_InvalidTransportTypeRequested))
        | "5" -> (Some (FIX_TradeRequestResult_InvalidDestinationRequested))
        | "8" -> (Some (FIX_TradeRequestResult_TradeRequestTypeNotSupported))
        | "9" -> (Some (FIX_TradeRequestResult_NotAuthorized))
        | "99" -> (Some (FIX_TradeRequestResult_Other))
        | _ -> (None)
;;

let parse_TradeRequestStatus ( str ) =
    match str with
        | "0" -> (Some (FIX_TradeRequestStatus_Accepted))
        | "1" -> (Some (FIX_TradeRequestStatus_Completed))
        | "2" -> (Some (FIX_TradeRequestStatus_Rejected))
        | _ -> (None)
;;

let parse_TradeRequestType ( str ) =
    match str with
        | "0" -> (Some (FIX_TradeRequestType_AllTrades))
        | "1" -> (Some (FIX_TradeRequestType_MatchedTradesMatchingCriteria))
        | "2" -> (Some (FIX_TradeRequestType_UnmatchedTradesThatMatchCriteria))
        | "3" -> (Some (FIX_TradeRequestType_UnreportedTradesThatMatchCriteria))
        | "4" -> (Some (FIX_TradeRequestType_AdvisoriesThatMatchCriteria))
        | _ -> (None)
;;

let parse_TradedFlatSwitch ( str ) =
    match str with
        | "Y" -> (Some (FIX_TradedFlatSwitch_TradedFlat))
        | "N" -> (Some (FIX_TradedFlatSwitch_NotTradedFlat))
        | _ -> (None)
;;

let parse_TrdRegTimestampType ( str ) =
    match str with
        | "1" -> (Some (FIX_TrdRegTimestampType_ExecutionTime))
        | "2" -> (Some (FIX_TrdRegTimestampType_TimeIn))
        | "3" -> (Some (FIX_TrdRegTimestampType_TimeOut))
        | "4" -> (Some (FIX_TrdRegTimestampType_BrokerReceipt))
        | "5" -> (Some (FIX_TrdRegTimestampType_BrokerExecution))
        | _ -> (None)
;;

let parse_TrdRptStatus ( str ) =
    match str with
        | "0" -> (Some (FIX_TrdRptStatus_Accepted))
        | "1" -> (Some (FIX_TrdRptStatus_Rejected))
        | _ -> (None)
;;

let parse_TrdType ( str ) =
    match str with
        | "0" -> (Some (FIX_TrdType_RegularTrade))
        | "1" -> (Some (FIX_TrdType_BlockTrade))
        | "2" -> (Some (FIX_TrdType_EFP))
        | "3" -> (Some (FIX_TrdType_Transfer))
        | "4" -> (Some (FIX_TrdType_LateTrade))
        | "5" -> (Some (FIX_TrdType_TTrade))
        | "6" -> (Some (FIX_TrdType_WeightedAveragePriceTrade))
        | "7" -> (Some (FIX_TrdType_BunchedTrade))
        | "8" -> (Some (FIX_TrdType_LateBunchedTrade))
        | "9" -> (Some (FIX_TrdType_PriorReferencePriceTrade))
        | "10" -> (Some (FIX_TrdType_AfterHoursTrade))
        | _ -> (None)
;;

let parse_UnsolicitedIndicator ( str ) =
    match str with
        | "Y" -> (Some (FIX_UnsolicitedIndicator_MessageIsBeingSentUnsolicited))
        | "N" -> (Some (FIX_UnsolicitedIndicator_MessageIsBeingSentAsAResultOfAPriorRequest))
        | _ -> (None)
;;

let parse_Urgency ( str ) =
    match str with
        | "0" -> (Some (FIX_Urgency_Normal))
        | "1" -> (Some (FIX_Urgency_Flash))
        | "2" -> (Some (FIX_Urgency_Background))
        | _ -> (None)
;;

let parse_UserRequestType ( str ) =
    match str with
        | "1" -> (Some (FIX_UserRequestType_LogOnUser))
        | "2" -> (Some (FIX_UserRequestType_LogOffUser))
        | "3" -> (Some (FIX_UserRequestType_ChangePasswordForUser))
        | "4" -> (Some (FIX_UserRequestType_RequestIndividualUserStatus))
        | _ -> (None)
;;

let parse_UserStatus ( str ) =
    match str with
        | "1" -> (Some (FIX_UserStatus_LoggedIn))
        | "2" -> (Some (FIX_UserStatus_NotLoggedIn))
        | "3" -> (Some (FIX_UserStatus_UserNotRecognised))
        | "4" -> (Some (FIX_UserStatus_PasswordIncorrect))
        | "5" -> (Some (FIX_UserStatus_PasswordChanged))
        | "6" -> (Some (FIX_UserStatus_Other))
        | _ -> (None)
;;

let parse_WorkingIndicator ( str ) =
    match str with
        | "Y" -> (Some (FIX_WorkingIndicator_Working))
        | "N" -> (Some (FIX_WorkingIndicator_NotWorking))
        | _ -> (None)
;;

let parse_YieldType ( str ) =
    match str with
        | "AFTERTAX" -> (Some (FIX_YieldType_AfterTaxYield))
        | "ANNUAL" -> (Some (FIX_YieldType_AnnualYield))
        | "ATISSUE" -> (Some (FIX_YieldType_YieldAtIssue))
        | "AVGMATURITY" -> (Some (FIX_YieldType_YieldToAverageMaturity))
        | "BOOK" -> (Some (FIX_YieldType_BookYield))
        | "CALL" -> (Some (FIX_YieldType_YieldToNextCall))
        | "CHANGE" -> (Some (FIX_YieldType_YieldChangeSinceClose))
        | "CLOSE" -> (Some (FIX_YieldType_ClosingYield))
        | "COMPOUND" -> (Some (FIX_YieldType_CompoundYield))
        | "CURRENT" -> (Some (FIX_YieldType_CurrentYield))
        | "GROSS" -> (Some (FIX_YieldType_TrueGrossYield))
        | "GOVTEQUIV" -> (Some (FIX_YieldType_GvntEquivalentYield))
        | "INFLATION" -> (Some (FIX_YieldType_YieldWithInflationAssumption))
        | "INVERSEFLOATER" -> (Some (FIX_YieldType_InverseFloaterBondYield))
        | "LASTCLOSE" -> (Some (FIX_YieldType_MostRecentClosingYield))
        | "LASTMONTH" -> (Some (FIX_YieldType_ClosingYieldMostRecentMonth))
        | "LASTQUARTER" -> (Some (FIX_YieldType_ClosingYieldMostRecentQuarter))
        | "LASTYEAR" -> (Some (FIX_YieldType_ClosingYieldMostRecentYear))
        | "LONGAVGLIFE" -> (Some (FIX_YieldType_YieldToLongestAverageLife))
        | "MARK" -> (Some (FIX_YieldType_MarkToMarketYield))
        | "MATURITY" -> (Some (FIX_YieldType_YieldToMaturity))
        | "NEXTREFUND" -> (Some (FIX_YieldType_YieldToNextRefund))
        | "OPENAVG" -> (Some (FIX_YieldType_OpenAverageYield))
        | "PUT" -> (Some (FIX_YieldType_YieldToNextPut))
        | "PREVCLOSE" -> (Some (FIX_YieldType_PreviousCloseYield))
        | "PROCEEDS" -> (Some (FIX_YieldType_ProceedsYield))
        | "SEMIANNUAL" -> (Some (FIX_YieldType_SemiAnnualYield))
        | "SHORTAVGLIFE" -> (Some (FIX_YieldType_YieldToShortestAverageLife))
        | "SIMPLE" -> (Some (FIX_YieldType_SimpleYield))
        | "TAXEQUIV" -> (Some (FIX_YieldType_TaxEquivalentYield))
        | "TENDER" -> (Some (FIX_YieldType_YieldToTenderDate))
        | "TRUE" -> (Some (FIX_YieldType_TrueYield))
        | "VALUE1/32" -> (Some (FIX_YieldType_YieldValueOf132))
        | "WORST" -> (Some (FIX_YieldType_YieldToWorst))
        | _ -> (None)
;;

let parse_week ( str ) =
    match str with
        | "noweek" -> (Some (FIX_week_noweek))
        | "w1" -> (Some (FIX_week_w1))
        | "w2" -> (Some (FIX_week_w2))
        | "w3" -> (Some (FIX_week_w3))
        | "w4" -> (Some (FIX_week_w4))
        | "w5" -> (Some (FIX_week_w5))
        | _ -> (None)
;;

let parse_Currency ( str ) =
    match str with
        | "AED" -> (Some (FIX_Currency_AED))
        | "AFN" -> (Some (FIX_Currency_AFN))
        | "AMD" -> (Some (FIX_Currency_AMD))
        | "ANG" -> (Some (FIX_Currency_ANG))
        | "AOA" -> (Some (FIX_Currency_AOA))
        | "ARS" -> (Some (FIX_Currency_ARS))
        | "AUD" -> (Some (FIX_Currency_AUD))
        | "AWG" -> (Some (FIX_Currency_AWG))
        | "AZN" -> (Some (FIX_Currency_AZN))
        | "BAM" -> (Some (FIX_Currency_BAM))
        | "BBD" -> (Some (FIX_Currency_BBD))
        | "BDT" -> (Some (FIX_Currency_BDT))
        | "BGN" -> (Some (FIX_Currency_BGN))
        | "BHD" -> (Some (FIX_Currency_BHD))
        | "BIF" -> (Some (FIX_Currency_BIF))
        | "BMD" -> (Some (FIX_Currency_BMD))
        | "BND" -> (Some (FIX_Currency_BND))
        | "BOB" -> (Some (FIX_Currency_BOB))
        | "BRL" -> (Some (FIX_Currency_BRL))
        | "BSD" -> (Some (FIX_Currency_BSD))
        | "BTN" -> (Some (FIX_Currency_BTN))
        | "BWP" -> (Some (FIX_Currency_BWP))
        | "BYN" -> (Some (FIX_Currency_BYN))
        | "BZD" -> (Some (FIX_Currency_BZD))
        | "CAD" -> (Some (FIX_Currency_CAD))
        | "CDF" -> (Some (FIX_Currency_CDF))
        | "CHF" -> (Some (FIX_Currency_CHF))
        | "CLP" -> (Some (FIX_Currency_CLP))
        | "CNY" -> (Some (FIX_Currency_CNY))
        | "COP" -> (Some (FIX_Currency_COP))
        | "CRC" -> (Some (FIX_Currency_CRC))
        | "CUC" -> (Some (FIX_Currency_CUC))
        | "CUP" -> (Some (FIX_Currency_CUP))
        | "CVE" -> (Some (FIX_Currency_CVE))
        | "CZK" -> (Some (FIX_Currency_CZK))
        | "DJF" -> (Some (FIX_Currency_DJF))
        | "DKK" -> (Some (FIX_Currency_DKK))
        | "DOP" -> (Some (FIX_Currency_DOP))
        | "DZD" -> (Some (FIX_Currency_DZD))
        | "EGP" -> (Some (FIX_Currency_EGP))
        | "ERN" -> (Some (FIX_Currency_ERN))
        | "ETB" -> (Some (FIX_Currency_ETB))
        | "EUR" -> (Some (FIX_Currency_EUR))
        | "FJD" -> (Some (FIX_Currency_FJD))
        | "FKP" -> (Some (FIX_Currency_FKP))
        | "GBP" -> (Some (FIX_Currency_GBP))
        | "GEL" -> (Some (FIX_Currency_GEL))
        | "GGP" -> (Some (FIX_Currency_GGP))
        | "GHS" -> (Some (FIX_Currency_GHS))
        | "GIP" -> (Some (FIX_Currency_GIP))
        | "GMD" -> (Some (FIX_Currency_GMD))
        | "GNF" -> (Some (FIX_Currency_GNF))
        | "GTQ" -> (Some (FIX_Currency_GTQ))
        | "GYD" -> (Some (FIX_Currency_GYD))
        | "HKD" -> (Some (FIX_Currency_HKD))
        | "HNL" -> (Some (FIX_Currency_HNL))
        | "HRK" -> (Some (FIX_Currency_HRK))
        | "HTG" -> (Some (FIX_Currency_HTG))
        | "HUF" -> (Some (FIX_Currency_HUF))
        | "IDR" -> (Some (FIX_Currency_IDR))
        | "ILS" -> (Some (FIX_Currency_ILS))
        | "IMP" -> (Some (FIX_Currency_IMP))
        | "INR" -> (Some (FIX_Currency_INR))
        | "IQD" -> (Some (FIX_Currency_IQD))
        | "IRR" -> (Some (FIX_Currency_IRR))
        | "ISK" -> (Some (FIX_Currency_ISK))
        | "JEP" -> (Some (FIX_Currency_JEP))
        | "JMD" -> (Some (FIX_Currency_JMD))
        | "JOD" -> (Some (FIX_Currency_JOD))
        | "JPY" -> (Some (FIX_Currency_JPY))
        | "KES" -> (Some (FIX_Currency_KES))
        | "KGS" -> (Some (FIX_Currency_KGS))
        | "KHR" -> (Some (FIX_Currency_KHR))
        | "KMF" -> (Some (FIX_Currency_KMF))
        | "KPW" -> (Some (FIX_Currency_KPW))
        | "KRW" -> (Some (FIX_Currency_KRW))
        | "KWD" -> (Some (FIX_Currency_KWD))
        | "KYD" -> (Some (FIX_Currency_KYD))
        | "KZT" -> (Some (FIX_Currency_KZT))
        | "LAK" -> (Some (FIX_Currency_LAK))
        | "LBP" -> (Some (FIX_Currency_LBP))
        | "LKR" -> (Some (FIX_Currency_LKR))
        | "LRD" -> (Some (FIX_Currency_LRD))
        | "LSL" -> (Some (FIX_Currency_LSL))
        | "LYD" -> (Some (FIX_Currency_LYD))
        | "MAD" -> (Some (FIX_Currency_MAD))
        | "MDL" -> (Some (FIX_Currency_MDL))
        | "MGA" -> (Some (FIX_Currency_MGA))
        | "MKD" -> (Some (FIX_Currency_MKD))
        | "MMK" -> (Some (FIX_Currency_MMK))
        | "MNT" -> (Some (FIX_Currency_MNT))
        | "MOP" -> (Some (FIX_Currency_MOP))
        | "MRO" -> (Some (FIX_Currency_MRO))
        | "MUR" -> (Some (FIX_Currency_MUR))
        | "MVR" -> (Some (FIX_Currency_MVR))
        | "MWK" -> (Some (FIX_Currency_MWK))
        | "MXN" -> (Some (FIX_Currency_MXN))
        | "MYR" -> (Some (FIX_Currency_MYR))
        | "MZN" -> (Some (FIX_Currency_MZN))
        | "NAD" -> (Some (FIX_Currency_NAD))
        | "NGN" -> (Some (FIX_Currency_NGN))
        | "NIO" -> (Some (FIX_Currency_NIO))
        | "NOK" -> (Some (FIX_Currency_NOK))
        | "NPR" -> (Some (FIX_Currency_NPR))
        | "NZD" -> (Some (FIX_Currency_NZD))
        | "OMR" -> (Some (FIX_Currency_OMR))
        | "PAB" -> (Some (FIX_Currency_PAB))
        | "PEN" -> (Some (FIX_Currency_PEN))
        | "PGK" -> (Some (FIX_Currency_PGK))
        | "PHP" -> (Some (FIX_Currency_PHP))
        | "PKR" -> (Some (FIX_Currency_PKR))
        | "PLN" -> (Some (FIX_Currency_PLN))
        | "PYG" -> (Some (FIX_Currency_PYG))
        | "QAR" -> (Some (FIX_Currency_QAR))
        | "RON" -> (Some (FIX_Currency_RON))
        | "RSD" -> (Some (FIX_Currency_RSD))
        | "RUB" -> (Some (FIX_Currency_RUB))
        | "RWF" -> (Some (FIX_Currency_RWF))
        | "SAR" -> (Some (FIX_Currency_SAR))
        | "SBD" -> (Some (FIX_Currency_SBD))
        | "SCR" -> (Some (FIX_Currency_SCR))
        | "SDG" -> (Some (FIX_Currency_SDG))
        | "SEK" -> (Some (FIX_Currency_SEK))
        | "SGD" -> (Some (FIX_Currency_SGD))
        | "SHP" -> (Some (FIX_Currency_SHP))
        | "SLL" -> (Some (FIX_Currency_SLL))
        | "SOS" -> (Some (FIX_Currency_SOS))
        | "SPL" -> (Some (FIX_Currency_SPL))
        | "SRD" -> (Some (FIX_Currency_SRD))
        | "STD" -> (Some (FIX_Currency_STD))
        | "SVC" -> (Some (FIX_Currency_SVC))
        | "SYP" -> (Some (FIX_Currency_SYP))
        | "SZL" -> (Some (FIX_Currency_SZL))
        | "THB" -> (Some (FIX_Currency_THB))
        | "TJS" -> (Some (FIX_Currency_TJS))
        | "TMT" -> (Some (FIX_Currency_TMT))
        | "TND" -> (Some (FIX_Currency_TND))
        | "TOP" -> (Some (FIX_Currency_TOP))
        | "TRY" -> (Some (FIX_Currency_TRY))
        | "TTD" -> (Some (FIX_Currency_TTD))
        | "TVD" -> (Some (FIX_Currency_TVD))
        | "TWD" -> (Some (FIX_Currency_TWD))
        | "TZS" -> (Some (FIX_Currency_TZS))
        | "UAH" -> (Some (FIX_Currency_UAH))
        | "UGX" -> (Some (FIX_Currency_UGX))
        | "USD" -> (Some (FIX_Currency_USD))
        | "UYU" -> (Some (FIX_Currency_UYU))
        | "UZS" -> (Some (FIX_Currency_UZS))
        | "VEF" -> (Some (FIX_Currency_VEF))
        | "VND" -> (Some (FIX_Currency_VND))
        | "VUV" -> (Some (FIX_Currency_VUV))
        | "WST" -> (Some (FIX_Currency_WST))
        | "XAF" -> (Some (FIX_Currency_XAF))
        | "XCD" -> (Some (FIX_Currency_XCD))
        | "XDR" -> (Some (FIX_Currency_XDR))
        | "XOF" -> (Some (FIX_Currency_XOF))
        | "XPF" -> (Some (FIX_Currency_XPF))
        | "YER" -> (Some (FIX_Currency_YER))
        | "ZAR" -> (Some (FIX_Currency_ZAR))
        | "ZMW" -> (Some (FIX_Currency_ZMW))
        | "ZWD" -> (Some (FIX_Currency_ZWD))
        | _ -> (None)
;;

let parse_Country ( str ) =
    match str with
        | "AF" -> (Some (FIX_Country_AF))
        | "AX" -> (Some (FIX_Country_AX))
        | "AL" -> (Some (FIX_Country_AL))
        | "DZ" -> (Some (FIX_Country_DZ))
        | "AS" -> (Some (FIX_Country_AS))
        | "AD" -> (Some (FIX_Country_AD))
        | "AO" -> (Some (FIX_Country_AO))
        | "AI" -> (Some (FIX_Country_AI))
        | "AQ" -> (Some (FIX_Country_AQ))
        | "AG" -> (Some (FIX_Country_AG))
        | "AR" -> (Some (FIX_Country_AR))
        | "AM" -> (Some (FIX_Country_AM))
        | "AW" -> (Some (FIX_Country_AW))
        | "AU" -> (Some (FIX_Country_AU))
        | "AT" -> (Some (FIX_Country_AT))
        | "AZ" -> (Some (FIX_Country_AZ))
        | "BS" -> (Some (FIX_Country_BS))
        | "BH" -> (Some (FIX_Country_BH))
        | "BD" -> (Some (FIX_Country_BD))
        | "BB" -> (Some (FIX_Country_BB))
        | "BY" -> (Some (FIX_Country_BY))
        | "BE" -> (Some (FIX_Country_BE))
        | "BZ" -> (Some (FIX_Country_BZ))
        | "BJ" -> (Some (FIX_Country_BJ))
        | "BM" -> (Some (FIX_Country_BM))
        | "BT" -> (Some (FIX_Country_BT))
        | "BO" -> (Some (FIX_Country_BO))
        | "BQ" -> (Some (FIX_Country_BQ))
        | "BA" -> (Some (FIX_Country_BA))
        | "BW" -> (Some (FIX_Country_BW))
        | "BV" -> (Some (FIX_Country_BV))
        | "BR" -> (Some (FIX_Country_BR))
        | "IO" -> (Some (FIX_Country_IO))
        | "BN" -> (Some (FIX_Country_BN))
        | "BG" -> (Some (FIX_Country_BG))
        | "BF" -> (Some (FIX_Country_BF))
        | "BI" -> (Some (FIX_Country_BI))
        | "CV" -> (Some (FIX_Country_CV))
        | "KH" -> (Some (FIX_Country_KH))
        | "CM" -> (Some (FIX_Country_CM))
        | "CA" -> (Some (FIX_Country_CA))
        | "KY" -> (Some (FIX_Country_KY))
        | "CF" -> (Some (FIX_Country_CF))
        | "TD" -> (Some (FIX_Country_TD))
        | "CL" -> (Some (FIX_Country_CL))
        | "CN" -> (Some (FIX_Country_CN))
        | "CX" -> (Some (FIX_Country_CX))
        | "CC" -> (Some (FIX_Country_CC))
        | "CO" -> (Some (FIX_Country_CO))
        | "KM" -> (Some (FIX_Country_KM))
        | "CD" -> (Some (FIX_Country_CD))
        | "CG" -> (Some (FIX_Country_CG))
        | "CK" -> (Some (FIX_Country_CK))
        | "CR" -> (Some (FIX_Country_CR))
        | "CI" -> (Some (FIX_Country_CI))
        | "HR" -> (Some (FIX_Country_HR))
        | "CU" -> (Some (FIX_Country_CU))
        | "CW" -> (Some (FIX_Country_CW))
        | "CY" -> (Some (FIX_Country_CY))
        | "CZ" -> (Some (FIX_Country_CZ))
        | "DK" -> (Some (FIX_Country_DK))
        | "DJ" -> (Some (FIX_Country_DJ))
        | "DM" -> (Some (FIX_Country_DM))
        | "DO" -> (Some (FIX_Country_DO))
        | "EC" -> (Some (FIX_Country_EC))
        | "EG" -> (Some (FIX_Country_EG))
        | "SV" -> (Some (FIX_Country_SV))
        | "GQ" -> (Some (FIX_Country_GQ))
        | "ER" -> (Some (FIX_Country_ER))
        | "EE" -> (Some (FIX_Country_EE))
        | "ET" -> (Some (FIX_Country_ET))
        | "FK" -> (Some (FIX_Country_FK))
        | "FO" -> (Some (FIX_Country_FO))
        | "FJ" -> (Some (FIX_Country_FJ))
        | "FI" -> (Some (FIX_Country_FI))
        | "FR" -> (Some (FIX_Country_FR))
        | "GF" -> (Some (FIX_Country_GF))
        | "PF" -> (Some (FIX_Country_PF))
        | "TF" -> (Some (FIX_Country_TF))
        | "GA" -> (Some (FIX_Country_GA))
        | "GM" -> (Some (FIX_Country_GM))
        | "GE" -> (Some (FIX_Country_GE))
        | "DE" -> (Some (FIX_Country_DE))
        | "GH" -> (Some (FIX_Country_GH))
        | "GI" -> (Some (FIX_Country_GI))
        | "GR" -> (Some (FIX_Country_GR))
        | "GL" -> (Some (FIX_Country_GL))
        | "GD" -> (Some (FIX_Country_GD))
        | "GP" -> (Some (FIX_Country_GP))
        | "GU" -> (Some (FIX_Country_GU))
        | "GT" -> (Some (FIX_Country_GT))
        | "GG" -> (Some (FIX_Country_GG))
        | "GN" -> (Some (FIX_Country_GN))
        | "GW" -> (Some (FIX_Country_GW))
        | "GY" -> (Some (FIX_Country_GY))
        | "HT" -> (Some (FIX_Country_HT))
        | "HM" -> (Some (FIX_Country_HM))
        | "VA" -> (Some (FIX_Country_VA))
        | "HN" -> (Some (FIX_Country_HN))
        | "HK" -> (Some (FIX_Country_HK))
        | "HU" -> (Some (FIX_Country_HU))
        | "IS" -> (Some (FIX_Country_IS))
        | "IN" -> (Some (FIX_Country_IN))
        | "ID" -> (Some (FIX_Country_ID))
        | "IR" -> (Some (FIX_Country_IR))
        | "IQ" -> (Some (FIX_Country_IQ))
        | "IE" -> (Some (FIX_Country_IE))
        | "IM" -> (Some (FIX_Country_IM))
        | "IL" -> (Some (FIX_Country_IL))
        | "IT" -> (Some (FIX_Country_IT))
        | "JM" -> (Some (FIX_Country_JM))
        | "JP" -> (Some (FIX_Country_JP))
        | "JE" -> (Some (FIX_Country_JE))
        | "JO" -> (Some (FIX_Country_JO))
        | "KZ" -> (Some (FIX_Country_KZ))
        | "KE" -> (Some (FIX_Country_KE))
        | "KI" -> (Some (FIX_Country_KI))
        | "KP" -> (Some (FIX_Country_KP))
        | "KR" -> (Some (FIX_Country_KR))
        | "KW" -> (Some (FIX_Country_KW))
        | "KG" -> (Some (FIX_Country_KG))
        | "LA" -> (Some (FIX_Country_LA))
        | "LV" -> (Some (FIX_Country_LV))
        | "LB" -> (Some (FIX_Country_LB))
        | "LS" -> (Some (FIX_Country_LS))
        | "LR" -> (Some (FIX_Country_LR))
        | "LY" -> (Some (FIX_Country_LY))
        | "LI" -> (Some (FIX_Country_LI))
        | "LT" -> (Some (FIX_Country_LT))
        | "LU" -> (Some (FIX_Country_LU))
        | "MO" -> (Some (FIX_Country_MO))
        | "MK" -> (Some (FIX_Country_MK))
        | "MG" -> (Some (FIX_Country_MG))
        | "MW" -> (Some (FIX_Country_MW))
        | "MY" -> (Some (FIX_Country_MY))
        | "MV" -> (Some (FIX_Country_MV))
        | "ML" -> (Some (FIX_Country_ML))
        | "MT" -> (Some (FIX_Country_MT))
        | "MH" -> (Some (FIX_Country_MH))
        | "MQ" -> (Some (FIX_Country_MQ))
        | "MR" -> (Some (FIX_Country_MR))
        | "MU" -> (Some (FIX_Country_MU))
        | "YT" -> (Some (FIX_Country_YT))
        | "MX" -> (Some (FIX_Country_MX))
        | "FM" -> (Some (FIX_Country_FM))
        | "MD" -> (Some (FIX_Country_MD))
        | "MC" -> (Some (FIX_Country_MC))
        | "MN" -> (Some (FIX_Country_MN))
        | "ME" -> (Some (FIX_Country_ME))
        | "MS" -> (Some (FIX_Country_MS))
        | "MA" -> (Some (FIX_Country_MA))
        | "MZ" -> (Some (FIX_Country_MZ))
        | "MM" -> (Some (FIX_Country_MM))
        | "NA" -> (Some (FIX_Country_NA))
        | "NR" -> (Some (FIX_Country_NR))
        | "NP" -> (Some (FIX_Country_NP))
        | "NL" -> (Some (FIX_Country_NL))
        | "NC" -> (Some (FIX_Country_NC))
        | "NZ" -> (Some (FIX_Country_NZ))
        | "NI" -> (Some (FIX_Country_NI))
        | "NE" -> (Some (FIX_Country_NE))
        | "NG" -> (Some (FIX_Country_NG))
        | "NU" -> (Some (FIX_Country_NU))
        | "NF" -> (Some (FIX_Country_NF))
        | "MP" -> (Some (FIX_Country_MP))
        | "NO" -> (Some (FIX_Country_NO))
        | "OM" -> (Some (FIX_Country_OM))
        | "PK" -> (Some (FIX_Country_PK))
        | "PW" -> (Some (FIX_Country_PW))
        | "PS" -> (Some (FIX_Country_PS))
        | "PA" -> (Some (FIX_Country_PA))
        | "PG" -> (Some (FIX_Country_PG))
        | "PY" -> (Some (FIX_Country_PY))
        | "PE" -> (Some (FIX_Country_PE))
        | "PH" -> (Some (FIX_Country_PH))
        | "PN" -> (Some (FIX_Country_PN))
        | "PL" -> (Some (FIX_Country_PL))
        | "PT" -> (Some (FIX_Country_PT))
        | "PR" -> (Some (FIX_Country_PR))
        | "QA" -> (Some (FIX_Country_QA))
        | "RE" -> (Some (FIX_Country_RE))
        | "RO" -> (Some (FIX_Country_RO))
        | "RU" -> (Some (FIX_Country_RU))
        | "RW" -> (Some (FIX_Country_RW))
        | "BL" -> (Some (FIX_Country_BL))
        | "SH" -> (Some (FIX_Country_SH))
        | "KN" -> (Some (FIX_Country_KN))
        | "LC" -> (Some (FIX_Country_LC))
        | "MF" -> (Some (FIX_Country_MF))
        | "PM" -> (Some (FIX_Country_PM))
        | "VC" -> (Some (FIX_Country_VC))
        | "WS" -> (Some (FIX_Country_WS))
        | "SM" -> (Some (FIX_Country_SM))
        | "ST" -> (Some (FIX_Country_ST))
        | "SA" -> (Some (FIX_Country_SA))
        | "SN" -> (Some (FIX_Country_SN))
        | "RS" -> (Some (FIX_Country_RS))
        | "SC" -> (Some (FIX_Country_SC))
        | "SL" -> (Some (FIX_Country_SL))
        | "SG" -> (Some (FIX_Country_SG))
        | "SX" -> (Some (FIX_Country_SX))
        | "SK" -> (Some (FIX_Country_SK))
        | "SI" -> (Some (FIX_Country_SI))
        | "SB" -> (Some (FIX_Country_SB))
        | "SO" -> (Some (FIX_Country_SO))
        | "ZA" -> (Some (FIX_Country_ZA))
        | "GS" -> (Some (FIX_Country_GS))
        | "SS" -> (Some (FIX_Country_SS))
        | "ES" -> (Some (FIX_Country_ES))
        | "LK" -> (Some (FIX_Country_LK))
        | "SD" -> (Some (FIX_Country_SD))
        | "SR" -> (Some (FIX_Country_SR))
        | "SJ" -> (Some (FIX_Country_SJ))
        | "SZ" -> (Some (FIX_Country_SZ))
        | "SE" -> (Some (FIX_Country_SE))
        | "CH" -> (Some (FIX_Country_CH))
        | "SY" -> (Some (FIX_Country_SY))
        | "TW" -> (Some (FIX_Country_TW))
        | "TJ" -> (Some (FIX_Country_TJ))
        | "TZ" -> (Some (FIX_Country_TZ))
        | "TH" -> (Some (FIX_Country_TH))
        | "TL" -> (Some (FIX_Country_TL))
        | "TG" -> (Some (FIX_Country_TG))
        | "TK" -> (Some (FIX_Country_TK))
        | "TO" -> (Some (FIX_Country_TO))
        | "TT" -> (Some (FIX_Country_TT))
        | "TN" -> (Some (FIX_Country_TN))
        | "TR" -> (Some (FIX_Country_TR))
        | "TM" -> (Some (FIX_Country_TM))
        | "TC" -> (Some (FIX_Country_TC))
        | "TV" -> (Some (FIX_Country_TV))
        | "UG" -> (Some (FIX_Country_UG))
        | "UA" -> (Some (FIX_Country_UA))
        | "AE" -> (Some (FIX_Country_AE))
        | "GB" -> (Some (FIX_Country_GB))
        | "UM" -> (Some (FIX_Country_UM))
        | "US" -> (Some (FIX_Country_US))
        | "UY" -> (Some (FIX_Country_UY))
        | "UZ" -> (Some (FIX_Country_UZ))
        | "VU" -> (Some (FIX_Country_VU))
        | "VE" -> (Some (FIX_Country_VE))
        | "VN" -> (Some (FIX_Country_VN))
        | "VG" -> (Some (FIX_Country_VG))
        | "VI" -> (Some (FIX_Country_VI))
        | "WF" -> (Some (FIX_Country_WF))
        | "EH" -> (Some (FIX_Country_EH))
        | "YE" -> (Some (FIX_Country_YE))
        | "ZM" -> (Some (FIX_Country_ZM))
        | "ZW" -> (Some (FIX_Country_ZW))
        | _ -> (None)
;;

let parse_Exchange ( str ) =
    match str with
        | "XTIR" -> (Some (FIX_Exchange_XTIR))
        | "XALG" -> (Some (FIX_Exchange_XALG))
        | "BACE" -> (Some (FIX_Exchange_BACE))
        | "BCFS" -> (Some (FIX_Exchange_BCFS))
        | "XMVL" -> (Some (FIX_Exchange_XMVL))
        | "ROFX" -> (Some (FIX_Exchange_ROFX))
        | "XBCC" -> (Some (FIX_Exchange_XBCC))
        | "MVCX" -> (Some (FIX_Exchange_MVCX))
        | "XBCM" -> (Some (FIX_Exchange_XBCM))
        | "XBCX" -> (Some (FIX_Exchange_XBCX))
        | "XBUE" -> (Some (FIX_Exchange_XBUE))
        | "XMEV" -> (Some (FIX_Exchange_XMEV))
        | "XCNF" -> (Some (FIX_Exchange_XCNF))
        | "XMAB" -> (Some (FIX_Exchange_XMAB))
        | "XMTB" -> (Some (FIX_Exchange_XMTB))
        | "XROS" -> (Some (FIX_Exchange_XROS))
        | "XROX" -> (Some (FIX_Exchange_XROX))
        | "XTUC" -> (Some (FIX_Exchange_XTUC))
        | "XARM" -> (Some (FIX_Exchange_XARM))
        | "APXL" -> (Some (FIX_Exchange_APXL))
        | "AWBX" -> (Some (FIX_Exchange_AWBX))
        | "AWEX" -> (Some (FIX_Exchange_AWEX))
        | "BLEV" -> (Some (FIX_Exchange_BLEV))
        | "CGMA" -> (Some (FIX_Exchange_CGMA))
        | "CHIA" -> (Some (FIX_Exchange_CHIA))
        | "CXAC" -> (Some (FIX_Exchange_CXAC))
        | "CXAV" -> (Some (FIX_Exchange_CXAV))
        | "CXAM" -> (Some (FIX_Exchange_CXAM))
        | "CXAP" -> (Some (FIX_Exchange_CXAP))
        | "CXAN" -> (Some (FIX_Exchange_CXAN))
        | "CXAF" -> (Some (FIX_Exchange_CXAF))
        | "CXAW" -> (Some (FIX_Exchange_CXAW))
        | "CXAR" -> (Some (FIX_Exchange_CXAR))
        | "CXAQ" -> (Some (FIX_Exchange_CXAQ))
        | "CLAU" -> (Some (FIX_Exchange_CLAU))
        | "CSAU" -> (Some (FIX_Exchange_CSAU))
        | "CFAU" -> (Some (FIX_Exchange_CFAU))
        | "MAQX" -> (Some (FIX_Exchange_MAQX))
        | "MSAL" -> (Some (FIX_Exchange_MSAL))
        | "NSXB" -> (Some (FIX_Exchange_NSXB))
        | "SIGA" -> (Some (FIX_Exchange_SIGA))
        | "SIMV" -> (Some (FIX_Exchange_SIMV))
        | "XASX" -> (Some (FIX_Exchange_XASX))
        | "ASXC" -> (Some (FIX_Exchange_ASXC))
        | "ASXP" -> (Some (FIX_Exchange_ASXP))
        | "ASXT" -> (Some (FIX_Exchange_ASXT))
        | "ASXV" -> (Some (FIX_Exchange_ASXV))
        | "XSFE" -> (Some (FIX_Exchange_XSFE))
        | "ASXB" -> (Some (FIX_Exchange_ASXB))
        | "XFEX" -> (Some (FIX_Exchange_XFEX))
        | "XNEC" -> (Some (FIX_Exchange_XNEC))
        | "XYIE" -> (Some (FIX_Exchange_XYIE))
        | "EGSI" -> (Some (FIX_Exchange_EGSI))
        | "XWBO" -> (Some (FIX_Exchange_XWBO))
        | "EXAA" -> (Some (FIX_Exchange_EXAA))
        | "WBAH" -> (Some (FIX_Exchange_WBAH))
        | "WBDM" -> (Some (FIX_Exchange_WBDM))
        | "WBGF" -> (Some (FIX_Exchange_WBGF))
        | "XCEG" -> (Some (FIX_Exchange_XCEG))
        | "XVIE" -> (Some (FIX_Exchange_XVIE))
        | "BSEX" -> (Some (FIX_Exchange_BSEX))
        | "XIBE" -> (Some (FIX_Exchange_XIBE))
        | "XBAA" -> (Some (FIX_Exchange_XBAA))
        | "BFEX" -> (Some (FIX_Exchange_BFEX))
        | "XBAH" -> (Some (FIX_Exchange_XBAH))
        | "XCHG" -> (Some (FIX_Exchange_XCHG))
        | "XDHA" -> (Some (FIX_Exchange_XDHA))
        | "XBAB" -> (Some (FIX_Exchange_XBAB))
        | "BAJM" -> (Some (FIX_Exchange_BAJM))
        | "BCSE" -> (Some (FIX_Exchange_BCSE))
        | "BLPX" -> (Some (FIX_Exchange_BLPX))
        | "BMTS" -> (Some (FIX_Exchange_BMTS))
        | "MTSD" -> (Some (FIX_Exchange_MTSD))
        | "MTSF" -> (Some (FIX_Exchange_MTSF))
        | "XBRU" -> (Some (FIX_Exchange_XBRU))
        | "ALXB" -> (Some (FIX_Exchange_ALXB))
        | "ENXB" -> (Some (FIX_Exchange_ENXB))
        | "MLXB" -> (Some (FIX_Exchange_MLXB))
        | "TNLB" -> (Some (FIX_Exchange_TNLB))
        | "VPXB" -> (Some (FIX_Exchange_VPXB))
        | "XBRD" -> (Some (FIX_Exchange_XBRD))
        | "XBDA" -> (Some (FIX_Exchange_XBDA))
        | "XBOL" -> (Some (FIX_Exchange_XBOL))
        | "XBLB" -> (Some (FIX_Exchange_XBLB))
        | "BLBF" -> (Some (FIX_Exchange_BLBF))
        | "XSSE" -> (Some (FIX_Exchange_XSSE))
        | "XBOT" -> (Some (FIX_Exchange_XBOT))
        | "BOTV" -> (Some (FIX_Exchange_BOTV))
        | "BOTE" -> (Some (FIX_Exchange_BOTE))
        | "BCMM" -> (Some (FIX_Exchange_BCMM))
        | "BOVM" -> (Some (FIX_Exchange_BOVM))
        | "BRIX" -> (Some (FIX_Exchange_BRIX))
        | "BVMF" -> (Some (FIX_Exchange_BVMF))
        | "CETI" -> (Some (FIX_Exchange_CETI))
        | "SELC" -> (Some (FIX_Exchange_SELC))
        | "IBEX" -> (Some (FIX_Exchange_IBEX))
        | "MBUL" -> (Some (FIX_Exchange_MBUL))
        | "XBUL" -> (Some (FIX_Exchange_XBUL))
        | "ABUL" -> (Some (FIX_Exchange_ABUL))
        | "XCSX" -> (Some (FIX_Exchange_XCSX))
        | "XDSX" -> (Some (FIX_Exchange_XDSX))
        | "CAND" -> (Some (FIX_Exchange_CAND))
        | "CANX" -> (Some (FIX_Exchange_CANX))
        | "CHIC" -> (Some (FIX_Exchange_CHIC))
        | "XCX2" -> (Some (FIX_Exchange_XCX2))
        | "COTC" -> (Some (FIX_Exchange_COTC))
        | "IFCA" -> (Some (FIX_Exchange_IFCA))
        | "IVZX" -> (Some (FIX_Exchange_IVZX))
        | "LICA" -> (Some (FIX_Exchange_LICA))
        | "MATN" -> (Some (FIX_Exchange_MATN))
        | "NEOE" -> (Some (FIX_Exchange_NEOE))
        | "NGXC" -> (Some (FIX_Exchange_NGXC))
        | "OMGA" -> (Some (FIX_Exchange_OMGA))
        | "LYNX" -> (Some (FIX_Exchange_LYNX))
        | "TMXS" -> (Some (FIX_Exchange_TMXS))
        | "XATS" -> (Some (FIX_Exchange_XATS))
        | "XBBK" -> (Some (FIX_Exchange_XBBK))
        | "XCNQ" -> (Some (FIX_Exchange_XCNQ))
        | "PURE" -> (Some (FIX_Exchange_PURE))
        | "XCXD" -> (Some (FIX_Exchange_XCXD))
        | "XICX" -> (Some (FIX_Exchange_XICX))
        | "XMOC" -> (Some (FIX_Exchange_XMOC))
        | "XMOD" -> (Some (FIX_Exchange_XMOD))
        | "XTSE" -> (Some (FIX_Exchange_XTSE))
        | "XTSX" -> (Some (FIX_Exchange_XTSX))
        | "XTNX" -> (Some (FIX_Exchange_XTNX))
        | "XBVC" -> (Some (FIX_Exchange_XBVC))
        | "XCAY" -> (Some (FIX_Exchange_XCAY))
        | "BOVA" -> (Some (FIX_Exchange_BOVA))
        | "XBCL" -> (Some (FIX_Exchange_XBCL))
        | "XSGO" -> (Some (FIX_Exchange_XSGO))
        | "CCFX" -> (Some (FIX_Exchange_CCFX))
        | "CSSX" -> (Some (FIX_Exchange_CSSX))
        | "SGEX" -> (Some (FIX_Exchange_SGEX))
        | "XCFE" -> (Some (FIX_Exchange_XCFE))
        | "XDCE" -> (Some (FIX_Exchange_XDCE))
        | "XSGE" -> (Some (FIX_Exchange_XSGE))
        | "XINE" -> (Some (FIX_Exchange_XINE))
        | "XSHE" -> (Some (FIX_Exchange_XSHE))
        | "XSEC" -> (Some (FIX_Exchange_XSEC))
        | "XSHG" -> (Some (FIX_Exchange_XSHG))
        | "XSSC" -> (Some (FIX_Exchange_XSSC))
        | "XZCE" -> (Some (FIX_Exchange_XZCE))
        | "XBOG" -> (Some (FIX_Exchange_XBOG))
        | "XBNV" -> (Some (FIX_Exchange_XBNV))
        | "XCRO" -> (Some (FIX_Exchange_XCRO))
        | "XTRZ" -> (Some (FIX_Exchange_XTRZ))
        | "XZAG" -> (Some (FIX_Exchange_XZAG))
        | "XZAM" -> (Some (FIX_Exchange_XZAM))
        | "DCSX" -> (Some (FIX_Exchange_DCSX))
        | "XCYS" -> (Some (FIX_Exchange_XCYS))
        | "XCYO" -> (Some (FIX_Exchange_XCYO))
        | "XECM" -> (Some (FIX_Exchange_XECM))
        | "FTFS" -> (Some (FIX_Exchange_FTFS))
        | "XPRA" -> (Some (FIX_Exchange_XPRA))
        | "XPRM" -> (Some (FIX_Exchange_XPRM))
        | "XPXE" -> (Some (FIX_Exchange_XPXE))
        | "XRMZ" -> (Some (FIX_Exchange_XRMZ))
        | "XRMO" -> (Some (FIX_Exchange_XRMO))
        | "DKTC" -> (Some (FIX_Exchange_DKTC))
        | "GXGR" -> (Some (FIX_Exchange_GXGR))
        | "GXGF" -> (Some (FIX_Exchange_GXGF))
        | "GXGM" -> (Some (FIX_Exchange_GXGM))
        | "NPGA" -> (Some (FIX_Exchange_NPGA))
        | "XCSE" -> (Some (FIX_Exchange_XCSE))
        | "DCSE" -> (Some (FIX_Exchange_DCSE))
        | "FNDK" -> (Some (FIX_Exchange_FNDK))
        | "DNDK" -> (Some (FIX_Exchange_DNDK))
        | "MCSE" -> (Some (FIX_Exchange_MCSE))
        | "MNDK" -> (Some (FIX_Exchange_MNDK))
        | "XBVR" -> (Some (FIX_Exchange_XBVR))
        | "XGUA" -> (Some (FIX_Exchange_XGUA))
        | "XQUI" -> (Some (FIX_Exchange_XQUI))
        | "NILX" -> (Some (FIX_Exchange_NILX))
        | "XCAI" -> (Some (FIX_Exchange_XCAI))
        | "XSVA" -> (Some (FIX_Exchange_XSVA))
        | "XTAL" -> (Some (FIX_Exchange_XTAL))
        | "FNEE" -> (Some (FIX_Exchange_FNEE))
        | "VMFX" -> (Some (FIX_Exchange_VMFX))
        | "XSPS" -> (Some (FIX_Exchange_XSPS))
        | "FGEX" -> (Some (FIX_Exchange_FGEX))
        | "XHEL" -> (Some (FIX_Exchange_XHEL))
        | "FNFI" -> (Some (FIX_Exchange_FNFI))
        | "DHEL" -> (Some (FIX_Exchange_DHEL))
        | "DNFI" -> (Some (FIX_Exchange_DNFI))
        | "MHEL" -> (Some (FIX_Exchange_MHEL))
        | "MNFI" -> (Some (FIX_Exchange_MNFI))
        | "COAL" -> (Some (FIX_Exchange_COAL))
        | "EPEX" -> (Some (FIX_Exchange_EPEX))
        | "FMTS" -> (Some (FIX_Exchange_FMTS))
        | "GMTF" -> (Some (FIX_Exchange_GMTF))
        | "LCHC" -> (Some (FIX_Exchange_LCHC))
        | "XAFR" -> (Some (FIX_Exchange_XAFR))
        | "XBLN" -> (Some (FIX_Exchange_XBLN))
        | "XPAR" -> (Some (FIX_Exchange_XPAR))
        | "ALXP" -> (Some (FIX_Exchange_ALXP))
        | "MTCH" -> (Some (FIX_Exchange_MTCH))
        | "XMAT" -> (Some (FIX_Exchange_XMAT))
        | "XMLI" -> (Some (FIX_Exchange_XMLI))
        | "XMON" -> (Some (FIX_Exchange_XMON))
        | "XSPM" -> (Some (FIX_Exchange_XSPM))
        | "XPOW" -> (Some (FIX_Exchange_XPOW))
        | "XPSF" -> (Some (FIX_Exchange_XPSF))
        | "XPOT" -> (Some (FIX_Exchange_XPOT))
        | "XGSE" -> (Some (FIX_Exchange_XGSE))
        | "360T" -> (Some (FIX_Exchange__360T))
        | "CATS" -> (Some (FIX_Exchange_CATS))
        | "DBOX" -> (Some (FIX_Exchange_DBOX))
        | "AUTO" -> (Some (FIX_Exchange_AUTO))
        | "ECAG" -> (Some (FIX_Exchange_ECAG))
        | "FICX" -> (Some (FIX_Exchange_FICX))
        | "TGAT" -> (Some (FIX_Exchange_TGAT))
        | "XGAT" -> (Some (FIX_Exchange_XGAT))
        | "XGRM" -> (Some (FIX_Exchange_XGRM))
        | "XBER" -> (Some (FIX_Exchange_XBER))
        | "BERA" -> (Some (FIX_Exchange_BERA))
        | "BERB" -> (Some (FIX_Exchange_BERB))
        | "BERC" -> (Some (FIX_Exchange_BERC))
        | "EQTA" -> (Some (FIX_Exchange_EQTA))
        | "EQTB" -> (Some (FIX_Exchange_EQTB))
        | "EQTC" -> (Some (FIX_Exchange_EQTC))
        | "EQTD" -> (Some (FIX_Exchange_EQTD))
        | "XEQT" -> (Some (FIX_Exchange_XEQT))
        | "ZOBX" -> (Some (FIX_Exchange_ZOBX))
        | "XDUS" -> (Some (FIX_Exchange_XDUS))
        | "DUSA" -> (Some (FIX_Exchange_DUSA))
        | "DUSB" -> (Some (FIX_Exchange_DUSB))
        | "DUSC" -> (Some (FIX_Exchange_DUSC))
        | "DUSD" -> (Some (FIX_Exchange_DUSD))
        | "XQTX" -> (Some (FIX_Exchange_XQTX))
        | "XECB" -> (Some (FIX_Exchange_XECB))
        | "XECC" -> (Some (FIX_Exchange_XECC))
        | "XEEE" -> (Some (FIX_Exchange_XEEE))
        | "XEEO" -> (Some (FIX_Exchange_XEEO))
        | "XEER" -> (Some (FIX_Exchange_XEER))
        | "XETR" -> (Some (FIX_Exchange_XETR))
        | "XEUB" -> (Some (FIX_Exchange_XEUB))
        | "XETA" -> (Some (FIX_Exchange_XETA))
        | "XETB" -> (Some (FIX_Exchange_XETB))
        | "XEUP" -> (Some (FIX_Exchange_XEUP))
        | "XEUM" -> (Some (FIX_Exchange_XEUM))
        | "XERE" -> (Some (FIX_Exchange_XERE))
        | "XERT" -> (Some (FIX_Exchange_XERT))
        | "XEUR" -> (Some (FIX_Exchange_XEUR))
        | "XFRA" -> (Some (FIX_Exchange_XFRA))
        | "FRAA" -> (Some (FIX_Exchange_FRAA))
        | "FRAB" -> (Some (FIX_Exchange_FRAB))
        | "XDBC" -> (Some (FIX_Exchange_XDBC))
        | "XDBV" -> (Some (FIX_Exchange_XDBV))
        | "XDBX" -> (Some (FIX_Exchange_XDBX))
        | "XHAM" -> (Some (FIX_Exchange_XHAM))
        | "HAMA" -> (Some (FIX_Exchange_HAMA))
        | "HAMB" -> (Some (FIX_Exchange_HAMB))
        | "HAML" -> (Some (FIX_Exchange_HAML))
        | "HAMM" -> (Some (FIX_Exchange_HAMM))
        | "HAMN" -> (Some (FIX_Exchange_HAMN))
        | "XHAN" -> (Some (FIX_Exchange_XHAN))
        | "HANA" -> (Some (FIX_Exchange_HANA))
        | "HANB" -> (Some (FIX_Exchange_HANB))
        | "XINV" -> (Some (FIX_Exchange_XINV))
        | "XMUN" -> (Some (FIX_Exchange_XMUN))
        | "MUNA" -> (Some (FIX_Exchange_MUNA))
        | "MUNB" -> (Some (FIX_Exchange_MUNB))
        | "MUNC" -> (Some (FIX_Exchange_MUNC))
        | "MUND" -> (Some (FIX_Exchange_MUND))
        | "XSCO" -> (Some (FIX_Exchange_XSCO))
        | "XSC1" -> (Some (FIX_Exchange_XSC1))
        | "XSC2" -> (Some (FIX_Exchange_XSC2))
        | "XSC3" -> (Some (FIX_Exchange_XSC3))
        | "XSTU" -> (Some (FIX_Exchange_XSTU))
        | "EUWX" -> (Some (FIX_Exchange_EUWX))
        | "STUA" -> (Some (FIX_Exchange_STUA))
        | "STUB" -> (Some (FIX_Exchange_STUB))
        | "XXSC" -> (Some (FIX_Exchange_XXSC))
        | "XGHA" -> (Some (FIX_Exchange_XGHA))
        | "GSXL" -> (Some (FIX_Exchange_GSXL))
        | "ASEX" -> (Some (FIX_Exchange_ASEX))
        | "ENAX" -> (Some (FIX_Exchange_ENAX))
        | "HOTC" -> (Some (FIX_Exchange_HOTC))
        | "XADE" -> (Some (FIX_Exchange_XADE))
        | "XATH" -> (Some (FIX_Exchange_XATH))
        | "XIPO" -> (Some (FIX_Exchange_XIPO))
        | "HDAT" -> (Some (FIX_Exchange_HDAT))
        | "HEMO" -> (Some (FIX_Exchange_HEMO))
        | "XGTG" -> (Some (FIX_Exchange_XGTG))
        | "XCIE" -> (Some (FIX_Exchange_XCIE))
        | "GSCI" -> (Some (FIX_Exchange_GSCI))
        | "XBCV" -> (Some (FIX_Exchange_XBCV))
        | "CGMH" -> (Some (FIX_Exchange_CGMH))
        | "CLHK" -> (Some (FIX_Exchange_CLHK))
        | "CSHK" -> (Some (FIX_Exchange_CSHK))
        | "CFHK" -> (Some (FIX_Exchange_CFHK))
        | "DBHK" -> (Some (FIX_Exchange_DBHK))
        | "EOTC" -> (Some (FIX_Exchange_EOTC))
        | "GSXH" -> (Some (FIX_Exchange_GSXH))
        | "HSXA" -> (Some (FIX_Exchange_HSXA))
        | "JPMI" -> (Some (FIX_Exchange_JPMI))
        | "MAQH" -> (Some (FIX_Exchange_MAQH))
        | "SIGH" -> (Some (FIX_Exchange_SIGH))
        | "TOCP" -> (Some (FIX_Exchange_TOCP))
        | "UBSX" -> (Some (FIX_Exchange_UBSX))
        | "XCGS" -> (Some (FIX_Exchange_XCGS))
        | "XHKF" -> (Some (FIX_Exchange_XHKF))
        | "XHKG" -> (Some (FIX_Exchange_XHKG))
        | "XGEM" -> (Some (FIX_Exchange_XGEM))
        | "SHSC" -> (Some (FIX_Exchange_SHSC))
        | "SZSC" -> (Some (FIX_Exchange_SZSC))
        | "XIHK" -> (Some (FIX_Exchange_XIHK))
        | "XPST" -> (Some (FIX_Exchange_XPST))
        | "BETA" -> (Some (FIX_Exchange_BETA))
        | "HUPX" -> (Some (FIX_Exchange_HUPX))
        | "KCCP" -> (Some (FIX_Exchange_KCCP))
        | "XBUD" -> (Some (FIX_Exchange_XBUD))
        | "XGAS" -> (Some (FIX_Exchange_XGAS))
        | "XICE" -> (Some (FIX_Exchange_XICE))
        | "DICE" -> (Some (FIX_Exchange_DICE))
        | "FNIS" -> (Some (FIX_Exchange_FNIS))
        | "DNIS" -> (Some (FIX_Exchange_DNIS))
        | "MICE" -> (Some (FIX_Exchange_MICE))
        | "MNIS" -> (Some (FIX_Exchange_MNIS))
        | "ACEX" -> (Some (FIX_Exchange_ACEX))
        | "CDSL" -> (Some (FIX_Exchange_CDSL))
        | "FXCL" -> (Some (FIX_Exchange_FXCL))
        | "FXSW" -> (Some (FIX_Exchange_FXSW))
        | "ASTR" -> (Some (FIX_Exchange_ASTR))
        | "ICXL" -> (Some (FIX_Exchange_ICXL))
        | "ISEX" -> (Some (FIX_Exchange_ISEX))
        | "MCXX" -> (Some (FIX_Exchange_MCXX))
        | "NBOT" -> (Some (FIX_Exchange_NBOT))
        | "NMCE" -> (Some (FIX_Exchange_NMCE))
        | "OTCX" -> (Some (FIX_Exchange_OTCX))
        | "PXIL" -> (Some (FIX_Exchange_PXIL))
        | "XBAN" -> (Some (FIX_Exchange_XBAN))
        | "XBOM" -> (Some (FIX_Exchange_XBOM))
        | "BSME" -> (Some (FIX_Exchange_BSME))
        | "XCAL" -> (Some (FIX_Exchange_XCAL))
        | "XDES" -> (Some (FIX_Exchange_XDES))
        | "XIMC" -> (Some (FIX_Exchange_XIMC))
        | "XMDS" -> (Some (FIX_Exchange_XMDS))
        | "XNCD" -> (Some (FIX_Exchange_XNCD))
        | "XNSE" -> (Some (FIX_Exchange_XNSE))
        | "XUSE" -> (Some (FIX_Exchange_XUSE))
        | "ICDX" -> (Some (FIX_Exchange_ICDX))
        | "XBBJ" -> (Some (FIX_Exchange_XBBJ))
        | "XIDX" -> (Some (FIX_Exchange_XIDX))
        | "XJNB" -> (Some (FIX_Exchange_XJNB))
        | "IMEX" -> (Some (FIX_Exchange_IMEX))
        | "XTEH" -> (Some (FIX_Exchange_XTEH))
        | "XIQS" -> (Some (FIX_Exchange_XIQS))
        | "AREX" -> (Some (FIX_Exchange_AREX))
        | "XPOS" -> (Some (FIX_Exchange_XPOS))
        | "XCDE" -> (Some (FIX_Exchange_XCDE))
        | "XDUB" -> (Some (FIX_Exchange_XDUB))
        | "XEYE" -> (Some (FIX_Exchange_XEYE))
        | "XESM" -> (Some (FIX_Exchange_XESM))
        | "XMSM" -> (Some (FIX_Exchange_XMSM))
        | "XATL" -> (Some (FIX_Exchange_XATL))
        | "XEBI" -> (Some (FIX_Exchange_XEBI))
        | "XTAE" -> (Some (FIX_Exchange_XTAE))
        | "CGIT" -> (Some (FIX_Exchange_CGIT))
        | "CGQT" -> (Some (FIX_Exchange_CGQT))
        | "CGDB" -> (Some (FIX_Exchange_CGDB))
        | "CGEB" -> (Some (FIX_Exchange_CGEB))
        | "CGTR" -> (Some (FIX_Exchange_CGTR))
        | "CGQD" -> (Some (FIX_Exchange_CGQD))
        | "CGND" -> (Some (FIX_Exchange_CGND))
        | "CGGD" -> (Some (FIX_Exchange_CGGD))
        | "CGCM" -> (Some (FIX_Exchange_CGCM))
        | "EMID" -> (Some (FIX_Exchange_EMID))
        | "EMDR" -> (Some (FIX_Exchange_EMDR))
        | "EMIR" -> (Some (FIX_Exchange_EMIR))
        | "EMIB" -> (Some (FIX_Exchange_EMIB))
        | "ETLX" -> (Some (FIX_Exchange_ETLX))
        | "HMTF" -> (Some (FIX_Exchange_HMTF))
        | "HMOD" -> (Some (FIX_Exchange_HMOD))
        | "HRFQ" -> (Some (FIX_Exchange_HRFQ))
        | "MTSC" -> (Some (FIX_Exchange_MTSC))
        | "BOND" -> (Some (FIX_Exchange_BOND))
        | "MTSM" -> (Some (FIX_Exchange_MTSM))
        | "SSOB" -> (Some (FIX_Exchange_SSOB))
        | "XGME" -> (Some (FIX_Exchange_XGME))
        | "XMIL" -> (Some (FIX_Exchange_XMIL))
        | "MTAH" -> (Some (FIX_Exchange_MTAH))
        | "ETFP" -> (Some (FIX_Exchange_ETFP))
        | "MIVX" -> (Some (FIX_Exchange_MIVX))
        | "MOTX" -> (Some (FIX_Exchange_MOTX))
        | "MTAA" -> (Some (FIX_Exchange_MTAA))
        | "SEDX" -> (Some (FIX_Exchange_SEDX))
        | "XAIM" -> (Some (FIX_Exchange_XAIM))
        | "XDMI" -> (Some (FIX_Exchange_XDMI))
        | "XMOT" -> (Some (FIX_Exchange_XMOT))
        | "XBRV" -> (Some (FIX_Exchange_XBRV))
        | "XJAM" -> (Some (FIX_Exchange_XJAM))
        | "BETP" -> (Some (FIX_Exchange_BETP))
        | "CHIJ" -> (Some (FIX_Exchange_CHIJ))
        | "CHIV" -> (Some (FIX_Exchange_CHIV))
        | "CHIS" -> (Some (FIX_Exchange_CHIS))
        | "KAIX" -> (Some (FIX_Exchange_KAIX))
        | "CITX" -> (Some (FIX_Exchange_CITX))
        | "CITD" -> (Some (FIX_Exchange_CITD))
        | "CLJP" -> (Some (FIX_Exchange_CLJP))
        | "CMET" -> (Some (FIX_Exchange_CMET))
        | "CSJP" -> (Some (FIX_Exchange_CSJP))
        | "CFJP" -> (Some (FIX_Exchange_CFJP))
        | "DRCT" -> (Some (FIX_Exchange_DRCT))
        | "LXJP" -> (Some (FIX_Exchange_LXJP))
        | "MAQJ" -> (Some (FIX_Exchange_MAQJ))
        | "MIZX" -> (Some (FIX_Exchange_MIZX))
        | "MSMS" -> (Some (FIX_Exchange_MSMS))
        | "NMRJ" -> (Some (FIX_Exchange_NMRJ))
        | "NXJP" -> (Some (FIX_Exchange_NXJP))
        | "NXVW" -> (Some (FIX_Exchange_NXVW))
        | "NXSE" -> (Some (FIX_Exchange_NXSE))
        | "SBIJ" -> (Some (FIX_Exchange_SBIJ))
        | "XSBI" -> (Some (FIX_Exchange_XSBI))
        | "SBIV" -> (Some (FIX_Exchange_SBIV))
        | "SBIU" -> (Some (FIX_Exchange_SBIU))
        | "SIGJ" -> (Some (FIX_Exchange_SIGJ))
        | "XFKA" -> (Some (FIX_Exchange_XFKA))
        | "XIJP" -> (Some (FIX_Exchange_XIJP))
        | "JASR" -> (Some (FIX_Exchange_JASR))
        | "XJPX" -> (Some (FIX_Exchange_XJPX))
        | "XJAS" -> (Some (FIX_Exchange_XJAS))
        | "XOSE" -> (Some (FIX_Exchange_XOSE))
        | "XOSJ" -> (Some (FIX_Exchange_XOSJ))
        | "XTAM" -> (Some (FIX_Exchange_XTAM))
        | "XTK1" -> (Some (FIX_Exchange_XTK1))
        | "XTK2" -> (Some (FIX_Exchange_XTK2))
        | "XTK3" -> (Some (FIX_Exchange_XTK3))
        | "XTKS" -> (Some (FIX_Exchange_XTKS))
        | "XKAC" -> (Some (FIX_Exchange_XKAC))
        | "XNGO" -> (Some (FIX_Exchange_XNGO))
        | "XNKS" -> (Some (FIX_Exchange_XNKS))
        | "XSAP" -> (Some (FIX_Exchange_XSAP))
        | "XTFF" -> (Some (FIX_Exchange_XTFF))
        | "XTKT" -> (Some (FIX_Exchange_XTKT))
        | "XAMM" -> (Some (FIX_Exchange_XAMM))
        | "ETSC" -> (Some (FIX_Exchange_ETSC))
        | "XKAZ" -> (Some (FIX_Exchange_XKAZ))
        | "XNAI" -> (Some (FIX_Exchange_XNAI))
        | "XKFB" -> (Some (FIX_Exchange_XKFB))
        | "XKRX" -> (Some (FIX_Exchange_XKRX))
        | "XKFE" -> (Some (FIX_Exchange_XKFE))
        | "XKOS" -> (Some (FIX_Exchange_XKOS))
        | "XKON" -> (Some (FIX_Exchange_XKON))
        | "XKCM" -> (Some (FIX_Exchange_XKCM))
        | "XKEM" -> (Some (FIX_Exchange_XKEM))
        | "XKUW" -> (Some (FIX_Exchange_XKUW))
        | "XKSE" -> (Some (FIX_Exchange_XKSE))
        | "XLAO" -> (Some (FIX_Exchange_XLAO))
        | "XRIS" -> (Some (FIX_Exchange_XRIS))
        | "FNLV" -> (Some (FIX_Exchange_FNLV))
        | "XBEY" -> (Some (FIX_Exchange_XBEY))
        | "XLSM" -> (Some (FIX_Exchange_XLSM))
        | "BAPX" -> (Some (FIX_Exchange_BAPX))
        | "GETB" -> (Some (FIX_Exchange_GETB))
        | "XLIT" -> (Some (FIX_Exchange_XLIT))
        | "FNLT" -> (Some (FIX_Exchange_FNLT))
        | "CCLX" -> (Some (FIX_Exchange_CCLX))
        | "XLUX" -> (Some (FIX_Exchange_XLUX))
        | "EMTF" -> (Some (FIX_Exchange_EMTF))
        | "XVES" -> (Some (FIX_Exchange_XVES))
        | "XMAE" -> (Some (FIX_Exchange_XMAE))
        | "XMDG" -> (Some (FIX_Exchange_XMDG))
        | "XMSW" -> (Some (FIX_Exchange_XMSW))
        | "XKLS" -> (Some (FIX_Exchange_XKLS))
        | "MESQ" -> (Some (FIX_Exchange_MESQ))
        | "XLFX" -> (Some (FIX_Exchange_XLFX))
        | "XRBM" -> (Some (FIX_Exchange_XRBM))
        | "MALX" -> (Some (FIX_Exchange_MALX))
        | "EWSM" -> (Some (FIX_Exchange_EWSM))
        | "XMAL" -> (Some (FIX_Exchange_XMAL))
        | "PROS" -> (Some (FIX_Exchange_PROS))
        | "GBOT" -> (Some (FIX_Exchange_GBOT))
        | "XAFX" -> (Some (FIX_Exchange_XAFX))
        | "XMAU" -> (Some (FIX_Exchange_XMAU))
        | "CGMX" -> (Some (FIX_Exchange_CGMX))
        | "XEMD" -> (Some (FIX_Exchange_XEMD))
        | "XMEX" -> (Some (FIX_Exchange_XMEX))
        | "XMOL" -> (Some (FIX_Exchange_XMOL))
        | "XULA" -> (Some (FIX_Exchange_XULA))
        | "XMNX" -> (Some (FIX_Exchange_XMNX))
        | "XCAS" -> (Some (FIX_Exchange_XCAS))
        | "XBVM" -> (Some (FIX_Exchange_XBVM))
        | "XNAM" -> (Some (FIX_Exchange_XNAM))
        | "XNEP" -> (Some (FIX_Exchange_XNEP))
        | "NZFX" -> (Some (FIX_Exchange_NZFX))
        | "XNZE" -> (Some (FIX_Exchange_XNZE))
        | "XMAN" -> (Some (FIX_Exchange_XMAN))
        | "NASX" -> (Some (FIX_Exchange_NASX))
        | "XNSA" -> (Some (FIX_Exchange_XNSA))
        | "FISH" -> (Some (FIX_Exchange_FISH))
        | "FSHX" -> (Some (FIX_Exchange_FSHX))
        | "ICAS" -> (Some (FIX_Exchange_ICAS))
        | "NEXO" -> (Some (FIX_Exchange_NEXO))
        | "NOPS" -> (Some (FIX_Exchange_NOPS))
        | "NORX" -> (Some (FIX_Exchange_NORX))
        | "NOSC" -> (Some (FIX_Exchange_NOSC))
        | "NOTC" -> (Some (FIX_Exchange_NOTC))
        | "OSLC" -> (Some (FIX_Exchange_OSLC))
        | "XIMA" -> (Some (FIX_Exchange_XIMA))
        | "XOSL" -> (Some (FIX_Exchange_XOSL))
        | "XOAM" -> (Some (FIX_Exchange_XOAM))
        | "XOAS" -> (Some (FIX_Exchange_XOAS))
        | "XOSC" -> (Some (FIX_Exchange_XOSC))
        | "NIBR" -> (Some (FIX_Exchange_NIBR))
        | "XOAD" -> (Some (FIX_Exchange_XOAD))
        | "XOSD" -> (Some (FIX_Exchange_XOSD))
        | "MERD" -> (Some (FIX_Exchange_MERD))
        | "MERK" -> (Some (FIX_Exchange_MERK))
        | "XMUS" -> (Some (FIX_Exchange_XMUS))
        | "NCEL" -> (Some (FIX_Exchange_NCEL))
        | "XISL" -> (Some (FIX_Exchange_XISL))
        | "XKAR" -> (Some (FIX_Exchange_XKAR))
        | "XLAH" -> (Some (FIX_Exchange_XLAH))
        | "XPAE" -> (Some (FIX_Exchange_XPAE))
        | "XPTY" -> (Some (FIX_Exchange_XPTY))
        | "XPOM" -> (Some (FIX_Exchange_XPOM))
        | "XVPA" -> (Some (FIX_Exchange_XVPA))
        | "XLIM" -> (Some (FIX_Exchange_XLIM))
        | "CLPH" -> (Some (FIX_Exchange_CLPH))
        | "PDEX" -> (Some (FIX_Exchange_PDEX))
        | "XPHS" -> (Some (FIX_Exchange_XPHS))
        | "IENG" -> (Some (FIX_Exchange_IENG))
        | "KDPW" -> (Some (FIX_Exchange_KDPW))
        | "PTPG" -> (Some (FIX_Exchange_PTPG))
        | "XWAR" -> (Some (FIX_Exchange_XWAR))
        | "PLPX" -> (Some (FIX_Exchange_PLPX))
        | "BOSP" -> (Some (FIX_Exchange_BOSP))
        | "RPWC" -> (Some (FIX_Exchange_RPWC))
        | "TBSP" -> (Some (FIX_Exchange_TBSP))
        | "XNCO" -> (Some (FIX_Exchange_XNCO))
        | "WBON" -> (Some (FIX_Exchange_WBON))
        | "WDER" -> (Some (FIX_Exchange_WDER))
        | "WETP" -> (Some (FIX_Exchange_WETP))
        | "WGAS" -> (Some (FIX_Exchange_WGAS))
        | "WIND" -> (Some (FIX_Exchange_WIND))
        | "WMTF" -> (Some (FIX_Exchange_WMTF))
        | "WBCL" -> (Some (FIX_Exchange_WBCL))
        | "PLPD" -> (Some (FIX_Exchange_PLPD))
        | "OMIC" -> (Some (FIX_Exchange_OMIC))
        | "OPEX" -> (Some (FIX_Exchange_OPEX))
        | "XLIS" -> (Some (FIX_Exchange_XLIS))
        | "ALXL" -> (Some (FIX_Exchange_ALXL))
        | "ENXL" -> (Some (FIX_Exchange_ENXL))
        | "MFOX" -> (Some (FIX_Exchange_MFOX))
        | "OMIP" -> (Some (FIX_Exchange_OMIP))
        | "WQXL" -> (Some (FIX_Exchange_WQXL))
        | "DSMD" -> (Some (FIX_Exchange_DSMD))
        | "TRPX" -> (Some (FIX_Exchange_TRPX))
        | "BMFX" -> (Some (FIX_Exchange_BMFX))
        | "BMFA" -> (Some (FIX_Exchange_BMFA))
        | "BMFM" -> (Some (FIX_Exchange_BMFM))
        | "SBMF" -> (Some (FIX_Exchange_SBMF))
        | "XBRM" -> (Some (FIX_Exchange_XBRM))
        | "XBSE" -> (Some (FIX_Exchange_XBSE))
        | "XBSD" -> (Some (FIX_Exchange_XBSD))
        | "XCAN" -> (Some (FIX_Exchange_XCAN))
        | "XRAS" -> (Some (FIX_Exchange_XRAS))
        | "XRPM" -> (Some (FIX_Exchange_XRPM))
        | "MISX" -> (Some (FIX_Exchange_MISX))
        | "RTSX" -> (Some (FIX_Exchange_RTSX))
        | "NAMX" -> (Some (FIX_Exchange_NAMX))
        | "RPDX" -> (Some (FIX_Exchange_RPDX))
        | "RUSX" -> (Some (FIX_Exchange_RUSX))
        | "SPIM" -> (Some (FIX_Exchange_SPIM))
        | "XMOS" -> (Some (FIX_Exchange_XMOS))
        | "XPET" -> (Some (FIX_Exchange_XPET))
        | "XPIC" -> (Some (FIX_Exchange_XPIC))
        | "XRUS" -> (Some (FIX_Exchange_XRUS))
        | "XSAM" -> (Some (FIX_Exchange_XSAM))
        | "XSIB" -> (Some (FIX_Exchange_XSIB))
        | "ROTC" -> (Some (FIX_Exchange_ROTC))
        | "RSEX" -> (Some (FIX_Exchange_RSEX))
        | "XECS" -> (Some (FIX_Exchange_XECS))
        | "XSAU" -> (Some (FIX_Exchange_XSAU))
        | "XBEL" -> (Some (FIX_Exchange_XBEL))
        | "CLTD" -> (Some (FIX_Exchange_CLTD))
        | "ECAL" -> (Some (FIX_Exchange_ECAL))
        | "EEAL" -> (Some (FIX_Exchange_EEAL))
        | "IFSG" -> (Some (FIX_Exchange_IFSG))
        | "JADX" -> (Some (FIX_Exchange_JADX))
        | "SMEX" -> (Some (FIX_Exchange_SMEX))
        | "TFSA" -> (Some (FIX_Exchange_TFSA))
        | "XSES" -> (Some (FIX_Exchange_XSES))
        | "XSCE" -> (Some (FIX_Exchange_XSCE))
        | "XSCA" -> (Some (FIX_Exchange_XSCA))
        | "XSIM" -> (Some (FIX_Exchange_XSIM))
        | "SPXE" -> (Some (FIX_Exchange_SPXE))
        | "XBRA" -> (Some (FIX_Exchange_XBRA))
        | "EBRA" -> (Some (FIX_Exchange_EBRA))
        | "XLJU" -> (Some (FIX_Exchange_XLJU))
        | "XLJM" -> (Some (FIX_Exchange_XLJM))
        | "XSOP" -> (Some (FIX_Exchange_XSOP))
        | "XJSE" -> (Some (FIX_Exchange_XJSE))
        | "ALTX" -> (Some (FIX_Exchange_ALTX))
        | "XBES" -> (Some (FIX_Exchange_XBES))
        | "XSAF" -> (Some (FIX_Exchange_XSAF))
        | "XSFA" -> (Some (FIX_Exchange_XSFA))
        | "YLDX" -> (Some (FIX_Exchange_YLDX))
        | "BMEX" -> (Some (FIX_Exchange_BMEX))
        | "MABX" -> (Some (FIX_Exchange_MABX))
        | "SEND" -> (Some (FIX_Exchange_SEND))
        | "XBAR" -> (Some (FIX_Exchange_XBAR))
        | "XBIL" -> (Some (FIX_Exchange_XBIL))
        | "XDRF" -> (Some (FIX_Exchange_XDRF))
        | "XLAT" -> (Some (FIX_Exchange_XLAT))
        | "XMAD" -> (Some (FIX_Exchange_XMAD))
        | "XMCE" -> (Some (FIX_Exchange_XMCE))
        | "XMRV" -> (Some (FIX_Exchange_XMRV))
        | "XVAL" -> (Some (FIX_Exchange_XVAL))
        | "MERF" -> (Some (FIX_Exchange_MERF))
        | "MARF" -> (Some (FIX_Exchange_MARF))
        | "BMCL" -> (Some (FIX_Exchange_BMCL))
        | "XMPW" -> (Some (FIX_Exchange_XMPW))
        | "IBGH" -> (Some (FIX_Exchange_IBGH))
        | "MIBG" -> (Some (FIX_Exchange_MIBG))
        | "OMEL" -> (Some (FIX_Exchange_OMEL))
        | "PAVE" -> (Some (FIX_Exchange_PAVE))
        | "XDPA" -> (Some (FIX_Exchange_XDPA))
        | "XNAF" -> (Some (FIX_Exchange_XNAF))
        | "XCOL" -> (Some (FIX_Exchange_XCOL))
        | "XKHA" -> (Some (FIX_Exchange_XKHA))
        | "XSWA" -> (Some (FIX_Exchange_XSWA))
        | "CRYD" -> (Some (FIX_Exchange_CRYD))
        | "CRYX" -> (Some (FIX_Exchange_CRYX))
        | "SEBX" -> (Some (FIX_Exchange_SEBX))
        | "ENSX" -> (Some (FIX_Exchange_ENSX))
        | "XNGM" -> (Some (FIX_Exchange_XNGM))
        | "NMTF" -> (Some (FIX_Exchange_NMTF))
        | "XNDX" -> (Some (FIX_Exchange_XNDX))
        | "XNMR" -> (Some (FIX_Exchange_XNMR))
        | "XSAT" -> (Some (FIX_Exchange_XSAT))
        | "XSTO" -> (Some (FIX_Exchange_XSTO))
        | "FNSE" -> (Some (FIX_Exchange_FNSE))
        | "XOPV" -> (Some (FIX_Exchange_XOPV))
        | "CSTO" -> (Some (FIX_Exchange_CSTO))
        | "DSTO" -> (Some (FIX_Exchange_DSTO))
        | "DNSE" -> (Some (FIX_Exchange_DNSE))
        | "MSTO" -> (Some (FIX_Exchange_MSTO))
        | "MNSE" -> (Some (FIX_Exchange_MNSE))
        | "AIXE" -> (Some (FIX_Exchange_AIXE))
        | "DOTS" -> (Some (FIX_Exchange_DOTS))
        | "EUCH" -> (Some (FIX_Exchange_EUCH))
        | "EUSP" -> (Some (FIX_Exchange_EUSP))
        | "EURM" -> (Some (FIX_Exchange_EURM))
        | "EUSC" -> (Some (FIX_Exchange_EUSC))
        | "S3FM" -> (Some (FIX_Exchange_S3FM))
        | "STOX" -> (Some (FIX_Exchange_STOX))
        | "XSCU" -> (Some (FIX_Exchange_XSCU))
        | "XSTV" -> (Some (FIX_Exchange_XSTV))
        | "XSTX" -> (Some (FIX_Exchange_XSTX))
        | "UBSG" -> (Some (FIX_Exchange_UBSG))
        | "UBSF" -> (Some (FIX_Exchange_UBSF))
        | "UBSC" -> (Some (FIX_Exchange_UBSC))
        | "VLEX" -> (Some (FIX_Exchange_VLEX))
        | "XBRN" -> (Some (FIX_Exchange_XBRN))
        | "XSWX" -> (Some (FIX_Exchange_XSWX))
        | "XQMH" -> (Some (FIX_Exchange_XQMH))
        | "XVTX" -> (Some (FIX_Exchange_XVTX))
        | "XBTR" -> (Some (FIX_Exchange_XBTR))
        | "XICB" -> (Some (FIX_Exchange_XICB))
        | "XSWM" -> (Some (FIX_Exchange_XSWM))
        | "XSLS" -> (Some (FIX_Exchange_XSLS))
        | "ZKBX" -> (Some (FIX_Exchange_ZKBX))
        | "XDSE" -> (Some (FIX_Exchange_XDSE))
        | "ROCO" -> (Some (FIX_Exchange_ROCO))
        | "XTAF" -> (Some (FIX_Exchange_XTAF))
        | "XTAI" -> (Some (FIX_Exchange_XTAI))
        | "XDAR" -> (Some (FIX_Exchange_XDAR))
        | "AFET" -> (Some (FIX_Exchange_AFET))
        | "BEEX" -> (Some (FIX_Exchange_BEEX))
        | "TFEX" -> (Some (FIX_Exchange_TFEX))
        | "XBKK" -> (Some (FIX_Exchange_XBKK))
        | "XBKF" -> (Some (FIX_Exchange_XBKF))
        | "XMAI" -> (Some (FIX_Exchange_XMAI))
        | "CLMX" -> (Some (FIX_Exchange_CLMX))
        | "HCHC" -> (Some (FIX_Exchange_HCHC))
        | "NDEX" -> (Some (FIX_Exchange_NDEX))
        | "NDXS" -> (Some (FIX_Exchange_NDXS))
        | "NLPX" -> (Some (FIX_Exchange_NLPX))
        | "TOMX" -> (Some (FIX_Exchange_TOMX))
        | "TOMD" -> (Some (FIX_Exchange_TOMD))
        | "XAMS" -> (Some (FIX_Exchange_XAMS))
        | "ALXA" -> (Some (FIX_Exchange_ALXA))
        | "TNLA" -> (Some (FIX_Exchange_TNLA))
        | "XEUC" -> (Some (FIX_Exchange_XEUC))
        | "XEUE" -> (Some (FIX_Exchange_XEUE))
        | "XEUI" -> (Some (FIX_Exchange_XEUI))
        | "XEMS" -> (Some (FIX_Exchange_XEMS))
        | "XNXC" -> (Some (FIX_Exchange_XNXC))
        | "XTRN" -> (Some (FIX_Exchange_XTRN))
        | "XTUN" -> (Some (FIX_Exchange_XTUN))
        | "EXTR" -> (Some (FIX_Exchange_EXTR))
        | "XEID" -> (Some (FIX_Exchange_XEID))
        | "XEDA" -> (Some (FIX_Exchange_XEDA))
        | "XIST" -> (Some (FIX_Exchange_XIST))
        | "XFNO" -> (Some (FIX_Exchange_XFNO))
        | "XEQY" -> (Some (FIX_Exchange_XEQY))
        | "XDSM" -> (Some (FIX_Exchange_XDSM))
        | "XPMS" -> (Some (FIX_Exchange_XPMS))
        | "ULTX" -> (Some (FIX_Exchange_ULTX))
        | "XUGA" -> (Some (FIX_Exchange_XUGA))
        | "EESE" -> (Some (FIX_Exchange_EESE))
        | "PFTS" -> (Some (FIX_Exchange_PFTS))
        | "PFTQ" -> (Some (FIX_Exchange_PFTQ))
        | "SEPE" -> (Some (FIX_Exchange_SEPE))
        | "UKEX" -> (Some (FIX_Exchange_UKEX))
        | "XDFB" -> (Some (FIX_Exchange_XDFB))
        | "XKHR" -> (Some (FIX_Exchange_XKHR))
        | "XKIE" -> (Some (FIX_Exchange_XKIE))
        | "XKIS" -> (Some (FIX_Exchange_XKIS))
        | "XODE" -> (Some (FIX_Exchange_XODE))
        | "XPRI" -> (Some (FIX_Exchange_XPRI))
        | "XUAX" -> (Some (FIX_Exchange_XUAX))
        | "XUKR" -> (Some (FIX_Exchange_XUKR))
        | "DGCX" -> (Some (FIX_Exchange_DGCX))
        | "DIFX" -> (Some (FIX_Exchange_DIFX))
        | "DUMX" -> (Some (FIX_Exchange_DUMX))
        | "XADS" -> (Some (FIX_Exchange_XADS))
        | "XDFM" -> (Some (FIX_Exchange_XDFM))
        | "AQXE" -> (Some (FIX_Exchange_AQXE))
        | "ARAX" -> (Some (FIX_Exchange_ARAX))
        | "ATLB" -> (Some (FIX_Exchange_ATLB))
        | "BALT" -> (Some (FIX_Exchange_BALT))
        | "BLTX" -> (Some (FIX_Exchange_BLTX))
        | "BCXE" -> (Some (FIX_Exchange_BCXE))
        | "BATE" -> (Some (FIX_Exchange_BATE))
        | "CHIX" -> (Some (FIX_Exchange_CHIX))
        | "BATD" -> (Some (FIX_Exchange_BATD))
        | "CHID" -> (Some (FIX_Exchange_CHID))
        | "BATF" -> (Some (FIX_Exchange_BATF))
        | "CHIO" -> (Some (FIX_Exchange_CHIO))
        | "BOTC" -> (Some (FIX_Exchange_BOTC))
        | "BATP" -> (Some (FIX_Exchange_BATP))
        | "BARO" -> (Some (FIX_Exchange_BARO))
        | "BARK" -> (Some (FIX_Exchange_BARK))
        | "BART" -> (Some (FIX_Exchange_BART))
        | "LISX" -> (Some (FIX_Exchange_LISX))
        | "BGCI" -> (Some (FIX_Exchange_BGCI))
        | "BGCB" -> (Some (FIX_Exchange_BGCB))
        | "BLOX" -> (Some (FIX_Exchange_BLOX))
        | "BMTF" -> (Some (FIX_Exchange_BMTF))
        | "BOAT" -> (Some (FIX_Exchange_BOAT))
        | "BOSC" -> (Some (FIX_Exchange_BOSC))
        | "BRNX" -> (Some (FIX_Exchange_BRNX))
        | "CCO2" -> (Some (FIX_Exchange_CCO2))
        | "CGME" -> (Some (FIX_Exchange_CGME))
        | "CHEV" -> (Some (FIX_Exchange_CHEV))
        | "BLNK" -> (Some (FIX_Exchange_BLNK))
        | "CMEE" -> (Some (FIX_Exchange_CMEE))
        | "CMEC" -> (Some (FIX_Exchange_CMEC))
        | "CMED" -> (Some (FIX_Exchange_CMED))
        | "CMMT" -> (Some (FIX_Exchange_CMMT))
        | "CRYP" -> (Some (FIX_Exchange_CRYP))
        | "CSEU" -> (Some (FIX_Exchange_CSEU))
        | "CSCF" -> (Some (FIX_Exchange_CSCF))
        | "DBIX" -> (Some (FIX_Exchange_DBIX))
        | "DBDC" -> (Some (FIX_Exchange_DBDC))
        | "DBCX" -> (Some (FIX_Exchange_DBCX))
        | "DBCR" -> (Some (FIX_Exchange_DBCR))
        | "DBMO" -> (Some (FIX_Exchange_DBMO))
        | "DBSE" -> (Some (FIX_Exchange_DBSE))
        | "EMBX" -> (Some (FIX_Exchange_EMBX))
        | "ENCL" -> (Some (FIX_Exchange_ENCL))
        | "EQLD" -> (Some (FIX_Exchange_EQLD))
        | "EXEU" -> (Some (FIX_Exchange_EXEU))
        | "EXMP" -> (Some (FIX_Exchange_EXMP))
        | "EXOR" -> (Some (FIX_Exchange_EXOR))
        | "EXVP" -> (Some (FIX_Exchange_EXVP))
        | "EXBO" -> (Some (FIX_Exchange_EXBO))
        | "EXSI" -> (Some (FIX_Exchange_EXSI))
        | "EXCP" -> (Some (FIX_Exchange_EXCP))
        | "EXLP" -> (Some (FIX_Exchange_EXLP))
        | "EXDC" -> (Some (FIX_Exchange_EXDC))
        | "FAIR" -> (Some (FIX_Exchange_FAIR))
        | "GEMX" -> (Some (FIX_Exchange_GEMX))
        | "GFIC" -> (Some (FIX_Exchange_GFIC))
        | "GFIF" -> (Some (FIX_Exchange_GFIF))
        | "GFIN" -> (Some (FIX_Exchange_GFIN))
        | "GFIR" -> (Some (FIX_Exchange_GFIR))
        | "GMEG" -> (Some (FIX_Exchange_GMEG))
        | "XLDX" -> (Some (FIX_Exchange_XLDX))
        | "XGDX" -> (Some (FIX_Exchange_XGDX))
        | "XGSX" -> (Some (FIX_Exchange_XGSX))
        | "XGCX" -> (Some (FIX_Exchange_XGCX))
        | "GRIF" -> (Some (FIX_Exchange_GRIF))
        | "GRSE" -> (Some (FIX_Exchange_GRSE))
        | "GSIL" -> (Some (FIX_Exchange_GSIL))
        | "GSSI" -> (Some (FIX_Exchange_GSSI))
        | "GSBX" -> (Some (FIX_Exchange_GSBX))
        | "HSXE" -> (Some (FIX_Exchange_HSXE))
        | "IBAL" -> (Some (FIX_Exchange_IBAL))
        | "ICAP" -> (Some (FIX_Exchange_ICAP))
        | "ICAH" -> (Some (FIX_Exchange_ICAH))
        | "BTEE" -> (Some (FIX_Exchange_BTEE))
        | "ICEN" -> (Some (FIX_Exchange_ICEN))
        | "ICSE" -> (Some (FIX_Exchange_ICSE))
        | "ICTQ" -> (Some (FIX_Exchange_ICTQ))
        | "WCLK" -> (Some (FIX_Exchange_WCLK))
        | "ISDX" -> (Some (FIX_Exchange_ISDX))
        | "EBSX" -> (Some (FIX_Exchange_EBSX))
        | "NEXS" -> (Some (FIX_Exchange_NEXS))
        | "IGDL" -> (Some (FIX_Exchange_IGDL))
        | "IFEU" -> (Some (FIX_Exchange_IFEU))
        | "CXRT" -> (Some (FIX_Exchange_CXRT))
        | "IFLO" -> (Some (FIX_Exchange_IFLO))
        | "IFLL" -> (Some (FIX_Exchange_IFLL))
        | "IFUT" -> (Some (FIX_Exchange_IFUT))
        | "IFLX" -> (Some (FIX_Exchange_IFLX))
        | "IFEN" -> (Some (FIX_Exchange_IFEN))
        | "ISWA" -> (Some (FIX_Exchange_ISWA))
        | "JPSI" -> (Some (FIX_Exchange_JPSI))
        | "KLEU" -> (Some (FIX_Exchange_KLEU))
        | "LCUR" -> (Some (FIX_Exchange_LCUR))
        | "LIQU" -> (Some (FIX_Exchange_LIQU))
        | "LIQH" -> (Some (FIX_Exchange_LIQH))
        | "LIQF" -> (Some (FIX_Exchange_LIQF))
        | "LMAX" -> (Some (FIX_Exchange_LMAX))
        | "LMAD" -> (Some (FIX_Exchange_LMAD))
        | "LMAE" -> (Some (FIX_Exchange_LMAE))
        | "LMAF" -> (Some (FIX_Exchange_LMAF))
        | "LMAO" -> (Some (FIX_Exchange_LMAO))
        | "LMEC" -> (Some (FIX_Exchange_LMEC))
        | "LOTC" -> (Some (FIX_Exchange_LOTC))
        | "PLDX" -> (Some (FIX_Exchange_PLDX))
        | "LPPM" -> (Some (FIX_Exchange_LPPM))
        | "MAEL" -> (Some (FIX_Exchange_MAEL))
        | "MFGL" -> (Some (FIX_Exchange_MFGL))
        | "MLXN" -> (Some (FIX_Exchange_MLXN))
        | "MLAX" -> (Some (FIX_Exchange_MLAX))
        | "MLEU" -> (Some (FIX_Exchange_MLEU))
        | "MLVE" -> (Some (FIX_Exchange_MLVE))
        | "MSIP" -> (Some (FIX_Exchange_MSIP))
        | "MYTR" -> (Some (FIX_Exchange_MYTR))
        | "N2EX" -> (Some (FIX_Exchange_N2EX))
        | "NDCM" -> (Some (FIX_Exchange_NDCM))
        | "NOFF" -> (Some (FIX_Exchange_NOFF))
        | "NURO" -> (Some (FIX_Exchange_NURO))
        | "XNLX" -> (Some (FIX_Exchange_XNLX))
        | "NURD" -> (Some (FIX_Exchange_NURD))
        | "NXEU" -> (Some (FIX_Exchange_NXEU))
        | "OTCE" -> (Some (FIX_Exchange_OTCE))
        | "PEEL" -> (Some (FIX_Exchange_PEEL))
        | "XRSP" -> (Some (FIX_Exchange_XRSP))
        | "XPHX" -> (Some (FIX_Exchange_XPHX))
        | "PIEU" -> (Some (FIX_Exchange_PIEU))
        | "PIRM" -> (Some (FIX_Exchange_PIRM))
        | "QWIX" -> (Some (FIX_Exchange_QWIX))
        | "RBCE" -> (Some (FIX_Exchange_RBCE))
        | "RBSX" -> (Some (FIX_Exchange_RBSX))
        | "RTSL" -> (Some (FIX_Exchange_RTSL))
        | "SECF" -> (Some (FIX_Exchange_SECF))
        | "SGMX" -> (Some (FIX_Exchange_SGMX))
        | "SHAR" -> (Some (FIX_Exchange_SHAR))
        | "SPEC" -> (Some (FIX_Exchange_SPEC))
        | "SPRZ" -> (Some (FIX_Exchange_SPRZ))
        | "SSEX" -> (Some (FIX_Exchange_SSEX))
        | "SWAP" -> (Some (FIX_Exchange_SWAP))
        | "TFSV" -> (Some (FIX_Exchange_TFSV))
        | "TPIE" -> (Some (FIX_Exchange_TPIE))
        | "TRDE" -> (Some (FIX_Exchange_TRDE))
        | "TCDS" -> (Some (FIX_Exchange_TCDS))
        | "TRDX" -> (Some (FIX_Exchange_TRDX))
        | "VOLA" -> (Some (FIX_Exchange_VOLA))
        | "TFSG" -> (Some (FIX_Exchange_TFSG))
        | "PARX" -> (Some (FIX_Exchange_PARX))
        | "ELIX" -> (Some (FIX_Exchange_ELIX))
        | "EMCH" -> (Some (FIX_Exchange_EMCH))
        | "TREU" -> (Some (FIX_Exchange_TREU))
        | "TRQX" -> (Some (FIX_Exchange_TRQX))
        | "TRQM" -> (Some (FIX_Exchange_TRQM))
        | "UBSL" -> (Some (FIX_Exchange_UBSL))
        | "UBSE" -> (Some (FIX_Exchange_UBSE))
        | "UKGD" -> (Some (FIX_Exchange_UKGD))
        | "UKPX" -> (Some (FIX_Exchange_UKPX))
        | "VEGA" -> (Some (FIX_Exchange_VEGA))
        | "WINS" -> (Some (FIX_Exchange_WINS))
        | "XALT" -> (Some (FIX_Exchange_XALT))
        | "XCOR" -> (Some (FIX_Exchange_XCOR))
        | "XGCL" -> (Some (FIX_Exchange_XGCL))
        | "XLBM" -> (Some (FIX_Exchange_XLBM))
        | "XLCH" -> (Some (FIX_Exchange_XLCH))
        | "XLDN" -> (Some (FIX_Exchange_XLDN))
        | "XLME" -> (Some (FIX_Exchange_XLME))
        | "XLON" -> (Some (FIX_Exchange_XLON))
        | "XLOD" -> (Some (FIX_Exchange_XLOD))
        | "XMTS" -> (Some (FIX_Exchange_XMTS))
        | "HUNG" -> (Some (FIX_Exchange_HUNG))
        | "PRME" -> (Some (FIX_Exchange_PRME))
        | "AMTS" -> (Some (FIX_Exchange_AMTS))
        | "EMTS" -> (Some (FIX_Exchange_EMTS))
        | "GMTS" -> (Some (FIX_Exchange_GMTS))
        | "IMTS" -> (Some (FIX_Exchange_IMTS))
        | "MCZK" -> (Some (FIX_Exchange_MCZK))
        | "MTSA" -> (Some (FIX_Exchange_MTSA))
        | "MTSG" -> (Some (FIX_Exchange_MTSG))
        | "MTSS" -> (Some (FIX_Exchange_MTSS))
        | "RMTS" -> (Some (FIX_Exchange_RMTS))
        | "SMTS" -> (Some (FIX_Exchange_SMTS))
        | "VMTS" -> (Some (FIX_Exchange_VMTS))
        | "BVUK" -> (Some (FIX_Exchange_BVUK))
        | "PORT" -> (Some (FIX_Exchange_PORT))
        | "MTSW" -> (Some (FIX_Exchange_MTSW))
        | "XSGA" -> (Some (FIX_Exchange_XSGA))
        | "XSMP" -> (Some (FIX_Exchange_XSMP))
        | "XSWB" -> (Some (FIX_Exchange_XSWB))
        | "XTUP" -> (Some (FIX_Exchange_XTUP))
        | "TPEQ" -> (Some (FIX_Exchange_TPEQ))
        | "TBEN" -> (Some (FIX_Exchange_TBEN))
        | "TBLA" -> (Some (FIX_Exchange_TBLA))
        | "TPCD" -> (Some (FIX_Exchange_TPCD))
        | "TPFD" -> (Some (FIX_Exchange_TPFD))
        | "TPRE" -> (Some (FIX_Exchange_TPRE))
        | "TPSD" -> (Some (FIX_Exchange_TPSD))
        | "XTPE" -> (Some (FIX_Exchange_XTPE))
        | "TPEL" -> (Some (FIX_Exchange_TPEL))
        | "TPSL" -> (Some (FIX_Exchange_TPSL))
        | "XUBS" -> (Some (FIX_Exchange_XUBS))
        | "AATS" -> (Some (FIX_Exchange_AATS))
        | "AQUA" -> (Some (FIX_Exchange_AQUA))
        | "ATDF" -> (Some (FIX_Exchange_ATDF))
        | "CORE" -> (Some (FIX_Exchange_CORE))
        | "BAML" -> (Some (FIX_Exchange_BAML))
        | "MLVX" -> (Some (FIX_Exchange_MLVX))
        | "MLCO" -> (Some (FIX_Exchange_MLCO))
        | "BARX" -> (Some (FIX_Exchange_BARX))
        | "BARD" -> (Some (FIX_Exchange_BARD))
        | "BARL" -> (Some (FIX_Exchange_BARL))
        | "BCDX" -> (Some (FIX_Exchange_BCDX))
        | "BATS" -> (Some (FIX_Exchange_BATS))
        | "BATO" -> (Some (FIX_Exchange_BATO))
        | "BATY" -> (Some (FIX_Exchange_BATY))
        | "BZXD" -> (Some (FIX_Exchange_BZXD))
        | "BYXD" -> (Some (FIX_Exchange_BYXD))
        | "BBSF" -> (Some (FIX_Exchange_BBSF))
        | "BGCF" -> (Some (FIX_Exchange_BGCF))
        | "BGCD" -> (Some (FIX_Exchange_BGCD))
        | "BHSF" -> (Some (FIX_Exchange_BHSF))
        | "BIDS" -> (Some (FIX_Exchange_BIDS))
        | "BLTD" -> (Some (FIX_Exchange_BLTD))
        | "BPOL" -> (Some (FIX_Exchange_BPOL))
        | "BNYC" -> (Some (FIX_Exchange_BNYC))
        | "VTEX" -> (Some (FIX_Exchange_VTEX))
        | "NYFX" -> (Some (FIX_Exchange_NYFX))
        | "BTEC" -> (Some (FIX_Exchange_BTEC))
        | "ICSU" -> (Some (FIX_Exchange_ICSU))
        | "CDED" -> (Some (FIX_Exchange_CDED))
        | "CGMI" -> (Some (FIX_Exchange_CGMI))
        | "CGMU" -> (Some (FIX_Exchange_CGMU))
        | "CICX" -> (Some (FIX_Exchange_CICX))
        | "LQFI" -> (Some (FIX_Exchange_LQFI))
        | "CBLC" -> (Some (FIX_Exchange_CBLC))
        | "CMSF" -> (Some (FIX_Exchange_CMSF))
        | "CRED" -> (Some (FIX_Exchange_CRED))
        | "CAES" -> (Some (FIX_Exchange_CAES))
        | "CSLP" -> (Some (FIX_Exchange_CSLP))
        | "DBSX" -> (Some (FIX_Exchange_DBSX))
        | "DEAL" -> (Some (FIX_Exchange_DEAL))
        | "EDGE" -> (Some (FIX_Exchange_EDGE))
        | "EDDP" -> (Some (FIX_Exchange_EDDP))
        | "EDGA" -> (Some (FIX_Exchange_EDGA))
        | "EDGD" -> (Some (FIX_Exchange_EDGD))
        | "EDGX" -> (Some (FIX_Exchange_EDGX))
        | "EDGO" -> (Some (FIX_Exchange_EDGO))
        | "EGMT" -> (Some (FIX_Exchange_EGMT))
        | "ERIS" -> (Some (FIX_Exchange_ERIS))
        | "FAST" -> (Some (FIX_Exchange_FAST))
        | "FINR" -> (Some (FIX_Exchange_FINR))
        | "FINN" -> (Some (FIX_Exchange_FINN))
        | "FINO" -> (Some (FIX_Exchange_FINO))
        | "FINY" -> (Some (FIX_Exchange_FINY))
        | "XADF" -> (Some (FIX_Exchange_XADF))
        | "OOTC" -> (Some (FIX_Exchange_OOTC))
        | "FSEF" -> (Some (FIX_Exchange_FSEF))
        | "FXAL" -> (Some (FIX_Exchange_FXAL))
        | "FXCM" -> (Some (FIX_Exchange_FXCM))
        | "G1XX" -> (Some (FIX_Exchange_G1XX))
        | "GLLC" -> (Some (FIX_Exchange_GLLC))
        | "GLPS" -> (Some (FIX_Exchange_GLPS))
        | "GLPX" -> (Some (FIX_Exchange_GLPX))
        | "GOVX" -> (Some (FIX_Exchange_GOVX))
        | "GREE" -> (Some (FIX_Exchange_GREE))
        | "GSEF" -> (Some (FIX_Exchange_GSEF))
        | "GTCO" -> (Some (FIX_Exchange_GTCO))
        | "GTXS" -> (Some (FIX_Exchange_GTXS))
        | "HEGX" -> (Some (FIX_Exchange_HEGX))
        | "HPPO" -> (Some (FIX_Exchange_HPPO))
        | "HSFX" -> (Some (FIX_Exchange_HSFX))
        | "ICEL" -> (Some (FIX_Exchange_ICEL))
        | "IEXG" -> (Some (FIX_Exchange_IEXG))
        | "IFUS" -> (Some (FIX_Exchange_IFUS))
        | "IEPA" -> (Some (FIX_Exchange_IEPA))
        | "IMFX" -> (Some (FIX_Exchange_IMFX))
        | "IMAG" -> (Some (FIX_Exchange_IMAG))
        | "IMBD" -> (Some (FIX_Exchange_IMBD))
        | "IMCO" -> (Some (FIX_Exchange_IMCO))
        | "IMCR" -> (Some (FIX_Exchange_IMCR))
        | "IMEN" -> (Some (FIX_Exchange_IMEN))
        | "IMEQ" -> (Some (FIX_Exchange_IMEQ))
        | "IMIR" -> (Some (FIX_Exchange_IMIR))
        | "IFED" -> (Some (FIX_Exchange_IFED))
        | "IMCG" -> (Some (FIX_Exchange_IMCG))
        | "IMCC" -> (Some (FIX_Exchange_IMCC))
        | "ICES" -> (Some (FIX_Exchange_ICES))
        | "ISDA" -> (Some (FIX_Exchange_ISDA))
        | "ITGI" -> (Some (FIX_Exchange_ITGI))
        | "JEFX" -> (Some (FIX_Exchange_JEFX))
        | "JPBX" -> (Some (FIX_Exchange_JPBX))
        | "JPMX" -> (Some (FIX_Exchange_JPMX))
        | "JSES" -> (Some (FIX_Exchange_JSES))
        | "JSJX" -> (Some (FIX_Exchange_JSJX))
        | "KNIG" -> (Some (FIX_Exchange_KNIG))
        | "KNCM" -> (Some (FIX_Exchange_KNCM))
        | "KNEM" -> (Some (FIX_Exchange_KNEM))
        | "KNLI" -> (Some (FIX_Exchange_KNLI))
        | "KNMX" -> (Some (FIX_Exchange_KNMX))
        | "LASF" -> (Some (FIX_Exchange_LASF))
        | "LEVL" -> (Some (FIX_Exchange_LEVL))
        | "LIUS" -> (Some (FIX_Exchange_LIUS))
        | "LIUH" -> (Some (FIX_Exchange_LIUH))
        | "LIFI" -> (Some (FIX_Exchange_LIFI))
        | "LQED" -> (Some (FIX_Exchange_LQED))
        | "LTAA" -> (Some (FIX_Exchange_LTAA))
        | "LMNX" -> (Some (FIX_Exchange_LMNX))
        | "MIHI" -> (Some (FIX_Exchange_MIHI))
        | "XMIO" -> (Some (FIX_Exchange_XMIO))
        | "MPRL" -> (Some (FIX_Exchange_MPRL))
        | "MSCO" -> (Some (FIX_Exchange_MSCO))
        | "MSPL" -> (Some (FIX_Exchange_MSPL))
        | "MSRP" -> (Some (FIX_Exchange_MSRP))
        | "MSTX" -> (Some (FIX_Exchange_MSTX))
        | "MSLP" -> (Some (FIX_Exchange_MSLP))
        | "MTUS" -> (Some (FIX_Exchange_MTUS))
        | "BVUS" -> (Some (FIX_Exchange_BVUS))
        | "MTSB" -> (Some (FIX_Exchange_MTSB))
        | "MTXX" -> (Some (FIX_Exchange_MTXX))
        | "MTXM" -> (Some (FIX_Exchange_MTXM))
        | "MTXC" -> (Some (FIX_Exchange_MTXC))
        | "MTXS" -> (Some (FIX_Exchange_MTXS))
        | "MTXA" -> (Some (FIX_Exchange_MTXA))
        | "NBLX" -> (Some (FIX_Exchange_NBLX))
        | "NFSC" -> (Some (FIX_Exchange_NFSC))
        | "NFSA" -> (Some (FIX_Exchange_NFSA))
        | "NFSD" -> (Some (FIX_Exchange_NFSD))
        | "XSTM" -> (Some (FIX_Exchange_XSTM))
        | "NMRA" -> (Some (FIX_Exchange_NMRA))
        | "NODX" -> (Some (FIX_Exchange_NODX))
        | "NXUS" -> (Some (FIX_Exchange_NXUS))
        | "NYPC" -> (Some (FIX_Exchange_NYPC))
        | "OLLC" -> (Some (FIX_Exchange_OLLC))
        | "OPRA" -> (Some (FIX_Exchange_OPRA))
        | "OTCM" -> (Some (FIX_Exchange_OTCM))
        | "OTCB" -> (Some (FIX_Exchange_OTCB))
        | "OTCQ" -> (Some (FIX_Exchange_OTCQ))
        | "PINC" -> (Some (FIX_Exchange_PINC))
        | "PINI" -> (Some (FIX_Exchange_PINI))
        | "PINL" -> (Some (FIX_Exchange_PINL))
        | "PINX" -> (Some (FIX_Exchange_PINX))
        | "PSGM" -> (Some (FIX_Exchange_PSGM))
        | "CAVE" -> (Some (FIX_Exchange_CAVE))
        | "PDQX" -> (Some (FIX_Exchange_PDQX))
        | "PDQD" -> (Some (FIX_Exchange_PDQD))
        | "PIPE" -> (Some (FIX_Exchange_PIPE))
        | "PRSE" -> (Some (FIX_Exchange_PRSE))
        | "PULX" -> (Some (FIX_Exchange_PULX))
        | "RICX" -> (Some (FIX_Exchange_RICX))
        | "RICD" -> (Some (FIX_Exchange_RICD))
        | "SCXS" -> (Some (FIX_Exchange_SCXS))
        | "SGMA" -> (Some (FIX_Exchange_SGMA))
        | "SGMT" -> (Some (FIX_Exchange_SGMT))
        | "SHAW" -> (Some (FIX_Exchange_SHAW))
        | "SHAD" -> (Some (FIX_Exchange_SHAD))
        | "SOHO" -> (Some (FIX_Exchange_SOHO))
        | "SSTX" -> (Some (FIX_Exchange_SSTX))
        | "TERA" -> (Some (FIX_Exchange_TERA))
        | "TFSU" -> (Some (FIX_Exchange_TFSU))
        | "THRE" -> (Some (FIX_Exchange_THRE))
        | "TPSE" -> (Some (FIX_Exchange_TPSE))
        | "TRCK" -> (Some (FIX_Exchange_TRCK))
        | "TRUX" -> (Some (FIX_Exchange_TRUX))
        | "TRU1" -> (Some (FIX_Exchange_TRU1))
        | "TRU2" -> (Some (FIX_Exchange_TRU2))
        | "TRWB" -> (Some (FIX_Exchange_TRWB))
        | "BNDD" -> (Some (FIX_Exchange_BNDD))
        | "TWSF" -> (Some (FIX_Exchange_TWSF))
        | "DWSF" -> (Some (FIX_Exchange_DWSF))
        | "TSBX" -> (Some (FIX_Exchange_TSBX))
        | "TSEF" -> (Some (FIX_Exchange_TSEF))
        | "UBSA" -> (Some (FIX_Exchange_UBSA))
        | "UBSP" -> (Some (FIX_Exchange_UBSP))
        | "VFCM" -> (Some (FIX_Exchange_VFCM))
        | "WELX" -> (Some (FIX_Exchange_WELX))
        | "WSAG" -> (Some (FIX_Exchange_WSAG))
        | "XAQS" -> (Some (FIX_Exchange_XAQS))
        | "XBOX" -> (Some (FIX_Exchange_XBOX))
        | "XCBO" -> (Some (FIX_Exchange_XCBO))
        | "C2OX" -> (Some (FIX_Exchange_C2OX))
        | "CBSX" -> (Some (FIX_Exchange_CBSX))
        | "XCBF" -> (Some (FIX_Exchange_XCBF))
        | "XCBT" -> (Some (FIX_Exchange_XCBT))
        | "FCBT" -> (Some (FIX_Exchange_FCBT))
        | "XKBT" -> (Some (FIX_Exchange_XKBT))
        | "XCFF" -> (Some (FIX_Exchange_XCFF))
        | "XCHI" -> (Some (FIX_Exchange_XCHI))
        | "XCIS" -> (Some (FIX_Exchange_XCIS))
        | "XCME" -> (Some (FIX_Exchange_XCME))
        | "FCME" -> (Some (FIX_Exchange_FCME))
        | "GLBX" -> (Some (FIX_Exchange_GLBX))
        | "XIMM" -> (Some (FIX_Exchange_XIMM))
        | "XIOM" -> (Some (FIX_Exchange_XIOM))
        | "CMES" -> (Some (FIX_Exchange_CMES))
        | "CBTS" -> (Some (FIX_Exchange_CBTS))
        | "CECS" -> (Some (FIX_Exchange_CECS))
        | "NYMS" -> (Some (FIX_Exchange_NYMS))
        | "XCUR" -> (Some (FIX_Exchange_XCUR))
        | "XELX" -> (Some (FIX_Exchange_XELX))
        | "XFCI" -> (Some (FIX_Exchange_XFCI))
        | "XGMX" -> (Some (FIX_Exchange_XGMX))
        | "XINS" -> (Some (FIX_Exchange_XINS))
        | "IBLX" -> (Some (FIX_Exchange_IBLX))
        | "ICBX" -> (Some (FIX_Exchange_ICBX))
        | "ICRO" -> (Some (FIX_Exchange_ICRO))
        | "IIDX" -> (Some (FIX_Exchange_IIDX))
        | "RCBX" -> (Some (FIX_Exchange_RCBX))
        | "MOCX" -> (Some (FIX_Exchange_MOCX))
        | "XISX" -> (Some (FIX_Exchange_XISX))
        | "XISA" -> (Some (FIX_Exchange_XISA))
        | "XISE" -> (Some (FIX_Exchange_XISE))
        | "GMNI" -> (Some (FIX_Exchange_GMNI))
        | "MCRY" -> (Some (FIX_Exchange_MCRY))
        | "XMER" -> (Some (FIX_Exchange_XMER))
        | "XMGE" -> (Some (FIX_Exchange_XMGE))
        | "XNAS" -> (Some (FIX_Exchange_XNAS))
        | "XBXO" -> (Some (FIX_Exchange_XBXO))
        | "BOSD" -> (Some (FIX_Exchange_BOSD))
        | "NASD" -> (Some (FIX_Exchange_NASD))
        | "XBRT" -> (Some (FIX_Exchange_XBRT))
        | "XNCM" -> (Some (FIX_Exchange_XNCM))
        | "XNDQ" -> (Some (FIX_Exchange_XNDQ))
        | "XNGS" -> (Some (FIX_Exchange_XNGS))
        | "XNIM" -> (Some (FIX_Exchange_XNIM))
        | "XNMS" -> (Some (FIX_Exchange_XNMS))
        | "XPBT" -> (Some (FIX_Exchange_XPBT))
        | "XPHL" -> (Some (FIX_Exchange_XPHL))
        | "XPHO" -> (Some (FIX_Exchange_XPHO))
        | "XPOR" -> (Some (FIX_Exchange_XPOR))
        | "XPSX" -> (Some (FIX_Exchange_XPSX))
        | "XBOS" -> (Some (FIX_Exchange_XBOS))
        | "ESPD" -> (Some (FIX_Exchange_ESPD))
        | "XNYM" -> (Some (FIX_Exchange_XNYM))
        | "XCEC" -> (Some (FIX_Exchange_XCEC))
        | "XNYE" -> (Some (FIX_Exchange_XNYE))
        | "XNYL" -> (Some (FIX_Exchange_XNYL))
        | "XNYS" -> (Some (FIX_Exchange_XNYS))
        | "ALDP" -> (Some (FIX_Exchange_ALDP))
        | "AMXO" -> (Some (FIX_Exchange_AMXO))
        | "ARCD" -> (Some (FIX_Exchange_ARCD))
        | "ARCO" -> (Some (FIX_Exchange_ARCO))
        | "ARCX" -> (Some (FIX_Exchange_ARCX))
        | "NYSD" -> (Some (FIX_Exchange_NYSD))
        | "XASE" -> (Some (FIX_Exchange_XASE))
        | "XNLI" -> (Some (FIX_Exchange_XNLI))
        | "XOCH" -> (Some (FIX_Exchange_XOCH))
        | "XOTC" -> (Some (FIX_Exchange_XOTC))
        | "XSEF" -> (Some (FIX_Exchange_XSEF))
        | "XWEE" -> (Some (FIX_Exchange_XWEE))
        | "BVUR" -> (Some (FIX_Exchange_BVUR))
        | "UFEX" -> (Some (FIX_Exchange_UFEX))
        | "XMNT" -> (Some (FIX_Exchange_XMNT))
        | "XCET" -> (Some (FIX_Exchange_XCET))
        | "XCUE" -> (Some (FIX_Exchange_XCUE))
        | "XKCE" -> (Some (FIX_Exchange_XKCE))
        | "XSTE" -> (Some (FIX_Exchange_XSTE))
        | "XUNI" -> (Some (FIX_Exchange_XUNI))
        | "GXMA" -> (Some (FIX_Exchange_GXMA))
        | "BVCA" -> (Some (FIX_Exchange_BVCA))
        | "HSTC" -> (Some (FIX_Exchange_HSTC))
        | "XHNX" -> (Some (FIX_Exchange_XHNX))
        | "XSTC" -> (Some (FIX_Exchange_XSTC))
        | "XLUS" -> (Some (FIX_Exchange_XLUS))
        | "XZIM" -> (Some (FIX_Exchange_XZIM))
        | "XOFF" -> (Some (FIX_Exchange_XOFF))
        | "XXXX" -> (Some (FIX_Exchange_XXXX))
        | _ -> (None)
;;
