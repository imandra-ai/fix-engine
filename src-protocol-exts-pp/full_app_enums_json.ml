(* @meta[imandra_ignore] on @end *)
open Yojson;;
open Full_app_enums;;
(* @meta[imandra_ignore] off @end *)

let accounttype_to_string ( d ) =
    match d with
        | FIX_AccountType_CarriedCustomerSide -> "CarriedCustomerSide"
        | FIX_AccountType_CarriedNonCustomerSide -> "CarriedNonCustomerSide"
        | FIX_AccountType_HouseTrader -> "HouseTrader"
        | FIX_AccountType_FloorTrader -> "FloorTrader"
        | FIX_AccountType_CarriedNonCustomerSideCrossMargined -> "CarriedNonCustomerSideCrossMargined"
        | FIX_AccountType_HouseTraderCrossMargined -> "HouseTraderCrossMargined"
        | FIX_AccountType_JointBackOfficeAccount -> "JointBackOfficeAccount"
;;

let acctidsource_to_string ( d ) =
    match d with
        | FIX_AcctIDSource_BIC -> "BIC"
        | FIX_AcctIDSource_SIDCode -> "SIDCode"
        | FIX_AcctIDSource_TFM -> "TFM"
        | FIX_AcctIDSource_OMGEO -> "OMGEO"
        | FIX_AcctIDSource_DTCCCode -> "DTCCCode"
        | FIX_AcctIDSource_Other -> "Other"
;;

let adjustment_to_string ( d ) =
    match d with
        | FIX_Adjustment_Cancel -> "Cancel"
        | FIX_Adjustment_Error -> "Error"
        | FIX_Adjustment_Correction -> "Correction"
;;

let adjustmenttype_to_string ( d ) =
    match d with
        | FIX_AdjustmentType_ProcessRequestAsMarginDisposition -> "ProcessRequestAsMarginDisposition"
        | FIX_AdjustmentType_DeltaPlus -> "DeltaPlus"
        | FIX_AdjustmentType_DeltaMinus -> "DeltaMinus"
        | FIX_AdjustmentType_Final -> "Final"
;;

let advside_to_string ( d ) =
    match d with
        | FIX_AdvSide_Buy -> "Buy"
        | FIX_AdvSide_Sell -> "Sell"
        | FIX_AdvSide_Cross -> "Cross"
        | FIX_AdvSide_Trade -> "Trade"
;;

let advtranstype_to_string ( d ) =
    match d with
        | FIX_AdvTransType_New -> "New"
        | FIX_AdvTransType_Cancel -> "Cancel"
        | FIX_AdvTransType_Replace -> "Replace"
;;

let affirmstatus_to_string ( d ) =
    match d with
        | FIX_AffirmStatus_Received -> "Received"
        | FIX_AffirmStatus_ConfirmRejected -> "ConfirmRejected"
        | FIX_AffirmStatus_Affirmed -> "Affirmed"
;;

let aggregatedbook_to_string ( d ) =
    match d with
        | FIX_AggregatedBook_BookEntriesToBeAggregated -> "BookEntriesToBeAggregated"
        | FIX_AggregatedBook_BookEntriesShouldNotBeAggregated -> "BookEntriesShouldNotBeAggregated"
;;

let allocaccounttype_to_string ( d ) =
    match d with
        | FIX_AllocAccountType_CarriedCustomerSide -> "CarriedCustomerSide"
        | FIX_AllocAccountType_CarriedNonCustomerSide -> "CarriedNonCustomerSide"
        | FIX_AllocAccountType_HouseTrader -> "HouseTrader"
        | FIX_AllocAccountType_FloorTrader -> "FloorTrader"
        | FIX_AllocAccountType_CarriedNonCustomerSideCrossMargined -> "CarriedNonCustomerSideCrossMargined"
        | FIX_AllocAccountType_HouseTraderCrossMargined -> "HouseTraderCrossMargined"
        | FIX_AllocAccountType_JointBackOfficeAccount -> "JointBackOfficeAccount"
;;

let alloccancreplacereason_to_string ( d ) =
    match d with
        | FIX_AllocCancReplaceReason_OriginalDetailsIncomplete -> "OriginalDetailsIncomplete"
        | FIX_AllocCancReplaceReason_ChangeInUnderlyingOrderDetails -> "ChangeInUnderlyingOrderDetails"
        | FIX_AllocCancReplaceReason_Other -> "Other"
;;

let allochandlinst_to_string ( d ) =
    match d with
        | FIX_AllocHandlInst_Match -> "Match"
        | FIX_AllocHandlInst_Forward -> "Forward"
        | FIX_AllocHandlInst_ForwardAndMatch -> "ForwardAndMatch"
;;

let allocintermedreqtype_to_string ( d ) =
    match d with
        | FIX_AllocIntermedReqType_PendingAccept -> "PendingAccept"
        | FIX_AllocIntermedReqType_PendingRelease -> "PendingRelease"
        | FIX_AllocIntermedReqType_PendingReversal -> "PendingReversal"
        | FIX_AllocIntermedReqType_Accept -> "Accept"
        | FIX_AllocIntermedReqType_BlockLevelReject -> "BlockLevelReject"
        | FIX_AllocIntermedReqType_AccountLevelReject -> "AccountLevelReject"
;;

let alloclinktype_to_string ( d ) =
    match d with
        | FIX_AllocLinkType_FXNetting -> "FXNetting"
        | FIX_AllocLinkType_FXSwap -> "FXSwap"
;;

let allocnoorderstype_to_string ( d ) =
    match d with
        | FIX_AllocNoOrdersType_NotSpecified -> "NotSpecified"
        | FIX_AllocNoOrdersType_ExplicitListProvided -> "ExplicitListProvided"
;;

let allocrejcode_to_string ( d ) =
    match d with
        | FIX_AllocRejCode_UnknownAccount -> "UnknownAccount"
        | FIX_AllocRejCode_IncorrectQuantity -> "IncorrectQuantity"
        | FIX_AllocRejCode_IncorrectAveragegPrice -> "IncorrectAveragegPrice"
        | FIX_AllocRejCode_UnknownExecutingBrokerMnemonic -> "UnknownExecutingBrokerMnemonic"
        | FIX_AllocRejCode_CommissionDifference -> "CommissionDifference"
        | FIX_AllocRejCode_UnknownOrderID -> "UnknownOrderID"
        | FIX_AllocRejCode_UnknownListID -> "UnknownListID"
        | FIX_AllocRejCode_OtherSeeText -> "OtherSeeText"
        | FIX_AllocRejCode_IncorrectAllocatedQuantity -> "IncorrectAllocatedQuantity"
        | FIX_AllocRejCode_CalculationDifference -> "CalculationDifference"
        | FIX_AllocRejCode_UnknownOrStaleExecID -> "UnknownOrStaleExecID"
        | FIX_AllocRejCode_MismatchedData -> "MismatchedData"
        | FIX_AllocRejCode_UnknownClOrdID -> "UnknownClOrdID"
        | FIX_AllocRejCode_WarehouseRequestRejected -> "WarehouseRequestRejected"
;;

let allocreporttype_to_string ( d ) =
    match d with
        | FIX_AllocReportType_SellsideCalculatedUsingPreliminary -> "SellsideCalculatedUsingPreliminary"
        | FIX_AllocReportType_SellsideCalculatedWithoutPreliminary -> "SellsideCalculatedWithoutPreliminary"
        | FIX_AllocReportType_WarehouseRecap -> "WarehouseRecap"
        | FIX_AllocReportType_RequestToIntermediary -> "RequestToIntermediary"
;;

let allocsettlinsttype_to_string ( d ) =
    match d with
        | FIX_AllocSettlInstType_UseDefaultInstructions -> "UseDefaultInstructions"
        | FIX_AllocSettlInstType_DeriveFromParametersProvided -> "DeriveFromParametersProvided"
        | FIX_AllocSettlInstType_FullDetailsProvided -> "FullDetailsProvided"
        | FIX_AllocSettlInstType_SSIDBIDsProvided -> "SSIDBIDsProvided"
        | FIX_AllocSettlInstType_PhoneForInstructions -> "PhoneForInstructions"
;;

let allocstatus_to_string ( d ) =
    match d with
        | FIX_AllocStatus_Accepted -> "Accepted"
        | FIX_AllocStatus_BlockLevelReject -> "BlockLevelReject"
        | FIX_AllocStatus_AccountLevelReject -> "AccountLevelReject"
        | FIX_AllocStatus_Received -> "Received"
        | FIX_AllocStatus_Incomplete -> "Incomplete"
        | FIX_AllocStatus_RejectedByIntermediary -> "RejectedByIntermediary"
;;

let alloctranstype_to_string ( d ) =
    match d with
        | FIX_AllocTransType_New -> "New"
        | FIX_AllocTransType_Replace -> "Replace"
        | FIX_AllocTransType_Cancel -> "Cancel"
;;

let alloctype_to_string ( d ) =
    match d with
        | FIX_AllocType_Calculated -> "Calculated"
        | FIX_AllocType_Preliminary -> "Preliminary"
        | FIX_AllocType_ReadyToBook -> "ReadyToBook"
        | FIX_AllocType_WarehouseInstruction -> "WarehouseInstruction"
        | FIX_AllocType_RequestToIntermediary -> "RequestToIntermediary"
;;

let applqueueaction_to_string ( d ) =
    match d with
        | FIX_ApplQueueAction_NoActionTaken -> "NoActionTaken"
        | FIX_ApplQueueAction_QueueFlushed -> "QueueFlushed"
        | FIX_ApplQueueAction_OverlayLast -> "OverlayLast"
        | FIX_ApplQueueAction_EndSession -> "EndSession"
;;

let applqueueresolution_to_string ( d ) =
    match d with
        | FIX_ApplQueueResolution_NoActionTaken -> "NoActionTaken"
        | FIX_ApplQueueResolution_QueueFlushed -> "QueueFlushed"
        | FIX_ApplQueueResolution_OverlayLast -> "OverlayLast"
        | FIX_ApplQueueResolution_EndSession -> "EndSession"
;;

let assignmentmethod_to_string ( d ) =
    match d with
        | FIX_AssignmentMethod_Random -> "Random"
        | FIX_AssignmentMethod_ProRata -> "ProRata"
;;

let avgpxindicator_to_string ( d ) =
    match d with
        | FIX_AvgPxIndicator_NoAveragePricing -> "NoAveragePricing"
        | FIX_AvgPxIndicator_Trade -> "Trade"
        | FIX_AvgPxIndicator_LastTrade -> "LastTrade"
;;

let basispxtype_to_string ( d ) =
    match d with
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
;;

let biddescriptortype_to_string ( d ) =
    match d with
        | FIX_BidDescriptorType_Sector -> "Sector"
        | FIX_BidDescriptorType_Country -> "Country"
        | FIX_BidDescriptorType_Index -> "Index"
;;

let bidrequesttranstype_to_string ( d ) =
    match d with
        | FIX_BidRequestTransType_New -> "New"
        | FIX_BidRequestTransType_Cancel -> "Cancel"
;;

let bidtradetype_to_string ( d ) =
    match d with
        | FIX_BidTradeType_RiskTrade -> "RiskTrade"
        | FIX_BidTradeType_VWAPGuarantee -> "VWAPGuarantee"
        | FIX_BidTradeType_Agency -> "Agency"
        | FIX_BidTradeType_GuaranteedClose -> "GuaranteedClose"
;;

let bidtype_to_string ( d ) =
    match d with
        | FIX_BidType_NonDisclosed -> "NonDisclosed"
        | FIX_BidType_Disclosed -> "Disclosed"
        | FIX_BidType_NoBiddingProcess -> "NoBiddingProcess"
;;

let bookingtype_to_string ( d ) =
    match d with
        | FIX_BookingType_RegularBooking -> "RegularBooking"
        | FIX_BookingType_CFD -> "CFD"
        | FIX_BookingType_TotalReturnSwap -> "TotalReturnSwap"
;;

let bookingunit_to_string ( d ) =
    match d with
        | FIX_BookingUnit_EachPartialExecutionIsABookableUnit -> "EachPartialExecutionIsABookableUnit"
        | FIX_BookingUnit_AggregatePartialExecutionsOnThisOrder -> "AggregatePartialExecutionsOnThisOrder"
        | FIX_BookingUnit_AggregateExecutionsForThisSymbol -> "AggregateExecutionsForThisSymbol"
;;

let businessrejectreason_to_string ( d ) =
    match d with
        | FIX_BusinessRejectReason_Other -> "Other"
        | FIX_BusinessRejectReason_UnknownID -> "UnknownID"
        | FIX_BusinessRejectReason_UnknownSecurity -> "UnknownSecurity"
        | FIX_BusinessRejectReason_UnsupportedMessageType -> "UnsupportedMessageType"
        | FIX_BusinessRejectReason_ApplicationNotAvailable -> "ApplicationNotAvailable"
        | FIX_BusinessRejectReason_ConditionallyRequiredFieldMissing -> "ConditionallyRequiredFieldMissing"
        | FIX_BusinessRejectReason_NotAuthorized -> "NotAuthorized"
        | FIX_BusinessRejectReason_DeliverToFirmNotAvailableAtThisTime -> "DeliverToFirmNotAvailableAtThisTime"
;;

let cpprogram_to_string ( d ) =
    match d with
        | FIX_CPProgram_Program3a3 -> "Program3a3"
        | FIX_CPProgram_Program42 -> "Program42"
        | FIX_CPProgram_Other -> "Other"
;;

let cancellationrights_to_string ( d ) =
    match d with
        | FIX_CancellationRights_Yes -> "Yes"
        | FIX_CancellationRights_NoExecutionOnly -> "NoExecutionOnly"
        | FIX_CancellationRights_NoWaiverAgreement -> "NoWaiverAgreement"
        | FIX_CancellationRights_NoInstitutional -> "NoInstitutional"
;;

let cashmargin_to_string ( d ) =
    match d with
        | FIX_CashMargin_Cash -> "Cash"
        | FIX_CashMargin_MarginOpen -> "MarginOpen"
        | FIX_CashMargin_MarginClose -> "MarginClose"
;;

let clearingfeeindicator_to_string ( d ) =
    match d with
        | FIX_ClearingFeeIndicator_CBOEMember -> "CBOEMember"
        | FIX_ClearingFeeIndicator_NonMemberAndCustomer -> "NonMemberAndCustomer"
        | FIX_ClearingFeeIndicator_EquityMemberAndClearingMember -> "EquityMemberAndClearingMember"
        | FIX_ClearingFeeIndicator_FullAndAssociateMember -> "FullAndAssociateMember"
        | FIX_ClearingFeeIndicator_Firms106HAnd106J -> "Firms106HAnd106J"
        | FIX_ClearingFeeIndicator_GIM -> "GIM"
        | FIX_ClearingFeeIndicator_Lessee106FEmployees -> "Lessee106FEmployees"
        | FIX_ClearingFeeIndicator_AllOtherOwnershipTypes -> "AllOtherOwnershipTypes"
        | FIX_ClearingFeeIndicator_FirstYearDelegate -> "FirstYearDelegate"
        | FIX_ClearingFeeIndicator_SecondYearDelegate -> "SecondYearDelegate"
        | FIX_ClearingFeeIndicator_ThirdYearDelegate -> "ThirdYearDelegate"
        | FIX_ClearingFeeIndicator_FourthYearDelegate -> "FourthYearDelegate"
        | FIX_ClearingFeeIndicator_FifthYearDelegate -> "FifthYearDelegate"
        | FIX_ClearingFeeIndicator_SixthYearDelegate -> "SixthYearDelegate"
;;

let clearinginstruction_to_string ( d ) =
    match d with
        | FIX_ClearingInstruction_ProcessNormally -> "ProcessNormally"
        | FIX_ClearingInstruction_ExcludeFromAllNetting -> "ExcludeFromAllNetting"
        | FIX_ClearingInstruction_BilateralNettingOnly -> "BilateralNettingOnly"
        | FIX_ClearingInstruction_ExClearing -> "ExClearing"
        | FIX_ClearingInstruction_SpecialTrade -> "SpecialTrade"
        | FIX_ClearingInstruction_MultilateralNetting -> "MultilateralNetting"
        | FIX_ClearingInstruction_ClearAgainstCentralCounterparty -> "ClearAgainstCentralCounterparty"
        | FIX_ClearingInstruction_ExcludeFromCentralCounterparty -> "ExcludeFromCentralCounterparty"
        | FIX_ClearingInstruction_ManualMode -> "ManualMode"
        | FIX_ClearingInstruction_AutomaticPostingMode -> "AutomaticPostingMode"
        | FIX_ClearingInstruction_AutomaticGiveUpMode -> "AutomaticGiveUpMode"
        | FIX_ClearingInstruction_QualifiedServiceRepresentativeQSR -> "QualifiedServiceRepresentativeQSR"
        | FIX_ClearingInstruction_CustomerTrade -> "CustomerTrade"
        | FIX_ClearingInstruction_SelfClearing -> "SelfClearing"
;;

let collaction_to_string ( d ) =
    match d with
        | FIX_CollAction_Retain -> "Retain"
        | FIX_CollAction_Add -> "Add"
        | FIX_CollAction_Remove -> "Remove"
;;

let collasgnreason_to_string ( d ) =
    match d with
        | FIX_CollAsgnReason_Initial -> "Initial"
        | FIX_CollAsgnReason_Scheduled -> "Scheduled"
        | FIX_CollAsgnReason_TimeWarning -> "TimeWarning"
        | FIX_CollAsgnReason_MarginDeficiency -> "MarginDeficiency"
        | FIX_CollAsgnReason_MarginExcess -> "MarginExcess"
        | FIX_CollAsgnReason_ForwardCollateralDemand -> "ForwardCollateralDemand"
        | FIX_CollAsgnReason_EventOfDefault -> "EventOfDefault"
        | FIX_CollAsgnReason_AdverseTaxEvent -> "AdverseTaxEvent"
;;

let collasgnrejectreason_to_string ( d ) =
    match d with
        | FIX_CollAsgnRejectReason_UnknownDeal -> "UnknownDeal"
        | FIX_CollAsgnRejectReason_UnknownOrInvalidInstrument -> "UnknownOrInvalidInstrument"
        | FIX_CollAsgnRejectReason_UnauthorizedTransaction -> "UnauthorizedTransaction"
        | FIX_CollAsgnRejectReason_InsufficientCollateral -> "InsufficientCollateral"
        | FIX_CollAsgnRejectReason_InvalidTypeOfCollateral -> "InvalidTypeOfCollateral"
        | FIX_CollAsgnRejectReason_ExcessiveSubstitution -> "ExcessiveSubstitution"
        | FIX_CollAsgnRejectReason_Other -> "Other"
;;

let collasgnresptype_to_string ( d ) =
    match d with
        | FIX_CollAsgnRespType_Received -> "Received"
        | FIX_CollAsgnRespType_Accepted -> "Accepted"
        | FIX_CollAsgnRespType_Declined -> "Declined"
        | FIX_CollAsgnRespType_Rejected -> "Rejected"
;;

let collasgntranstype_to_string ( d ) =
    match d with
        | FIX_CollAsgnTransType_New -> "New"
        | FIX_CollAsgnTransType_Replace -> "Replace"
        | FIX_CollAsgnTransType_Cancel -> "Cancel"
        | FIX_CollAsgnTransType_Release -> "Release"
        | FIX_CollAsgnTransType_Reverse -> "Reverse"
;;

let collinquiryqualifier_to_string ( d ) =
    match d with
        | FIX_CollInquiryQualifier_TradeDate -> "TradeDate"
        | FIX_CollInquiryQualifier_GCInstrument -> "GCInstrument"
        | FIX_CollInquiryQualifier_CollateralInstrument -> "CollateralInstrument"
        | FIX_CollInquiryQualifier_SubstitutionEligible -> "SubstitutionEligible"
        | FIX_CollInquiryQualifier_NotAssigned -> "NotAssigned"
        | FIX_CollInquiryQualifier_PartiallyAssigned -> "PartiallyAssigned"
        | FIX_CollInquiryQualifier_FullyAssigned -> "FullyAssigned"
        | FIX_CollInquiryQualifier_OutstandingTrades -> "OutstandingTrades"
;;

let collinquiryresult_to_string ( d ) =
    match d with
        | FIX_CollInquiryResult_Successful -> "Successful"
        | FIX_CollInquiryResult_InvalidOrUnknownInstrument -> "InvalidOrUnknownInstrument"
        | FIX_CollInquiryResult_InvalidOrUnknownCollateralType -> "InvalidOrUnknownCollateralType"
        | FIX_CollInquiryResult_InvalidParties -> "InvalidParties"
        | FIX_CollInquiryResult_InvalidTransportTypeRequested -> "InvalidTransportTypeRequested"
        | FIX_CollInquiryResult_InvalidDestinationRequested -> "InvalidDestinationRequested"
        | FIX_CollInquiryResult_NoCollateralFoundForTheTradeSpecified -> "NoCollateralFoundForTheTradeSpecified"
        | FIX_CollInquiryResult_NoCollateralFoundForTheOrderSpecified -> "NoCollateralFoundForTheOrderSpecified"
        | FIX_CollInquiryResult_CollateralInquiryTypeNotSupported -> "CollateralInquiryTypeNotSupported"
        | FIX_CollInquiryResult_UnauthorizedForCollateralInquiry -> "UnauthorizedForCollateralInquiry"
        | FIX_CollInquiryResult_Other -> "Other"
;;

let collinquirystatus_to_string ( d ) =
    match d with
        | FIX_CollInquiryStatus_Accepted -> "Accepted"
        | FIX_CollInquiryStatus_AcceptedWithWarnings -> "AcceptedWithWarnings"
        | FIX_CollInquiryStatus_Completed -> "Completed"
        | FIX_CollInquiryStatus_CompletedWithWarnings -> "CompletedWithWarnings"
        | FIX_CollInquiryStatus_Rejected -> "Rejected"
;;

let collstatus_to_string ( d ) =
    match d with
        | FIX_CollStatus_Unassigned -> "Unassigned"
        | FIX_CollStatus_PartiallyAssigned -> "PartiallyAssigned"
        | FIX_CollStatus_AssignmentProposed -> "AssignmentProposed"
        | FIX_CollStatus_Assigned -> "Assigned"
        | FIX_CollStatus_Challenged -> "Challenged"
;;

let commtype_to_string ( d ) =
    match d with
        | FIX_CommType_PerUnit -> "PerUnit"
        | FIX_CommType_Percent -> "Percent"
        | FIX_CommType_Absolute -> "Absolute"
        | FIX_CommType_PercentageWaivedCashDiscount -> "PercentageWaivedCashDiscount"
        | FIX_CommType_PercentageWaivedEnhancedUnits -> "PercentageWaivedEnhancedUnits"
        | FIX_CommType_PointsPerBondOrContract -> "PointsPerBondOrContract"
;;

let confirmrejreason_to_string ( d ) =
    match d with
        | FIX_ConfirmRejReason_MismatchedAccount -> "MismatchedAccount"
        | FIX_ConfirmRejReason_MissingSettlementInstructions -> "MissingSettlementInstructions"
        | FIX_ConfirmRejReason_Other -> "Other"
;;

let confirmstatus_to_string ( d ) =
    match d with
        | FIX_ConfirmStatus_Received -> "Received"
        | FIX_ConfirmStatus_MismatchedAccount -> "MismatchedAccount"
        | FIX_ConfirmStatus_MissingSettlementInstructions -> "MissingSettlementInstructions"
        | FIX_ConfirmStatus_Confirmed -> "Confirmed"
        | FIX_ConfirmStatus_RequestRejected -> "RequestRejected"
;;

let confirmtranstype_to_string ( d ) =
    match d with
        | FIX_ConfirmTransType_New -> "New"
        | FIX_ConfirmTransType_Replace -> "Replace"
        | FIX_ConfirmTransType_Cancel -> "Cancel"
;;

let confirmtype_to_string ( d ) =
    match d with
        | FIX_ConfirmType_Status -> "Status"
        | FIX_ConfirmType_Confirmation -> "Confirmation"
        | FIX_ConfirmType_ConfirmationRequestRejected -> "ConfirmationRequestRejected"
;;

let contamttype_to_string ( d ) =
    match d with
        | FIX_ContAmtType_CommissionAmount -> "CommissionAmount"
        | FIX_ContAmtType_CommissionPercent -> "CommissionPercent"
        | FIX_ContAmtType_InitialChargeAmount -> "InitialChargeAmount"
        | FIX_ContAmtType_InitialChargePercent -> "InitialChargePercent"
        | FIX_ContAmtType_DiscountAmount -> "DiscountAmount"
        | FIX_ContAmtType_DiscountPercent -> "DiscountPercent"
        | FIX_ContAmtType_DilutionLevyAmount -> "DilutionLevyAmount"
        | FIX_ContAmtType_DilutionLevyPercent -> "DilutionLevyPercent"
        | FIX_ContAmtType_ExitChargeAmount -> "ExitChargeAmount"
        | FIX_ContAmtType_ExitChargePercent -> "ExitChargePercent"
        | FIX_ContAmtType_FundBasedRenewalCommissionPercent -> "FundBasedRenewalCommissionPercent"
        | FIX_ContAmtType_ProjectedFundValue -> "ProjectedFundValue"
        | FIX_ContAmtType_FundBasedRenewalCommissionOnOrder -> "FundBasedRenewalCommissionOnOrder"
        | FIX_ContAmtType_FundBasedRenewalCommissionOnFund -> "FundBasedRenewalCommissionOnFund"
        | FIX_ContAmtType_NetSettlementAmount -> "NetSettlementAmount"
;;

let corporateaction_to_string ( d ) =
    match d with
        | FIX_CorporateAction_ExDividend -> "ExDividend"
        | FIX_CorporateAction_ExDistribution -> "ExDistribution"
        | FIX_CorporateAction_ExRights -> "ExRights"
        | FIX_CorporateAction_New -> "New"
        | FIX_CorporateAction_ExInterest -> "ExInterest"
;;

let coveredoruncovered_to_string ( d ) =
    match d with
        | FIX_CoveredOrUncovered_Covered -> "Covered"
        | FIX_CoveredOrUncovered_Uncovered -> "Uncovered"
;;

let crossprioritization_to_string ( d ) =
    match d with
        | FIX_CrossPrioritization_Unknown -> "Unknown"
        | FIX_CrossPrioritization_BuySideIsPrioritized -> "BuySideIsPrioritized"
        | FIX_CrossPrioritization_SellSideIsPrioritized -> "SellSideIsPrioritized"
;;

let crosstype_to_string ( d ) =
    match d with
        | FIX_CrossType_CrossAON -> "CrossAON"
        | FIX_CrossType_CrossIOC -> "CrossIOC"
        | FIX_CrossType_CrossOneSide -> "CrossOneSide"
        | FIX_CrossType_CrossSamePrice -> "CrossSamePrice"
;;

let custordercapacity_to_string ( d ) =
    match d with
        | FIX_CustOrderCapacity_MemberTradingForTheirOwnAccount -> "MemberTradingForTheirOwnAccount"
        | FIX_CustOrderCapacity_ClearingFirmTradingForItsProprietaryAccount -> "ClearingFirmTradingForItsProprietaryAccount"
        | FIX_CustOrderCapacity_MemberTradingForAnotherMember -> "MemberTradingForAnotherMember"
        | FIX_CustOrderCapacity_AllOther -> "AllOther"
;;

let cxlrejreason_to_string ( d ) =
    match d with
        | FIX_CxlRejReason_TooLateToCancel -> "TooLateToCancel"
        | FIX_CxlRejReason_UnknownOrder -> "UnknownOrder"
        | FIX_CxlRejReason_BrokerCredit -> "BrokerCredit"
        | FIX_CxlRejReason_OrderAlreadyInPendingStatus -> "OrderAlreadyInPendingStatus"
        | FIX_CxlRejReason_UnableToProcessOrderMassCancelRequest -> "UnableToProcessOrderMassCancelRequest"
        | FIX_CxlRejReason_OrigOrdModTime -> "OrigOrdModTime"
        | FIX_CxlRejReason_DuplicateClOrdID -> "DuplicateClOrdID"
        | FIX_CxlRejReason_Other -> "Other"
;;

let cxlrejresponseto_to_string ( d ) =
    match d with
        | FIX_CxlRejResponseTo_OrderCancelRequest -> "OrderCancelRequest"
        | FIX_CxlRejResponseTo_OrderCancel -> "OrderCancel"
;;

let dkreason_to_string ( d ) =
    match d with
        | FIX_DKReason_UnknownSymbol -> "UnknownSymbol"
        | FIX_DKReason_WrongSide -> "WrongSide"
        | FIX_DKReason_QuantityExceedsOrder -> "QuantityExceedsOrder"
        | FIX_DKReason_NoMatchingOrder -> "NoMatchingOrder"
        | FIX_DKReason_PriceExceedsLimit -> "PriceExceedsLimit"
        | FIX_DKReason_CalculationDifference -> "CalculationDifference"
        | FIX_DKReason_Other -> "Other"
;;

let daybookinginst_to_string ( d ) =
    match d with
        | FIX_DayBookingInst_Auto -> "Auto"
        | FIX_DayBookingInst_SpeakWithOrderInitiatorBeforeBooking -> "SpeakWithOrderInitiatorBeforeBooking"
        | FIX_DayBookingInst_Accumulate -> "Accumulate"
;;

let deletereason_to_string ( d ) =
    match d with
        | FIX_DeleteReason_Cancellation -> "Cancellation"
        | FIX_DeleteReason_Error -> "Error"
;;

let deliveryform_to_string ( d ) =
    match d with
        | FIX_DeliveryForm_BookEntry -> "BookEntry"
        | FIX_DeliveryForm_Bearer -> "Bearer"
;;

let deliverytype_to_string ( d ) =
    match d with
        | FIX_DeliveryType_VersusPayment -> "VersusPayment"
        | FIX_DeliveryType_Free -> "Free"
        | FIX_DeliveryType_TriParty -> "TriParty"
        | FIX_DeliveryType_HoldInCustody -> "HoldInCustody"
;;

let discretioninst_to_string ( d ) =
    match d with
        | FIX_DiscretionInst_RelatedToDisplayedPrice -> "RelatedToDisplayedPrice"
        | FIX_DiscretionInst_RelatedToMarketPrice -> "RelatedToMarketPrice"
        | FIX_DiscretionInst_RelatedToPrimaryPrice -> "RelatedToPrimaryPrice"
        | FIX_DiscretionInst_RelatedToLocalPrimaryPrice -> "RelatedToLocalPrimaryPrice"
        | FIX_DiscretionInst_RelatedToMidpointPrice -> "RelatedToMidpointPrice"
        | FIX_DiscretionInst_RelatedToLastTradePrice -> "RelatedToLastTradePrice"
        | FIX_DiscretionInst_RelatedToVWAP -> "RelatedToVWAP"
;;

let discretionlimittype_to_string ( d ) =
    match d with
        | FIX_DiscretionLimitType_OrBetter -> "OrBetter"
        | FIX_DiscretionLimitType_Strict -> "Strict"
        | FIX_DiscretionLimitType_OrWorse -> "OrWorse"
;;

let discretionmovetype_to_string ( d ) =
    match d with
        | FIX_DiscretionMoveType_Floating -> "Floating"
        | FIX_DiscretionMoveType_Fixed -> "Fixed"
;;

let discretionoffsettype_to_string ( d ) =
    match d with
        | FIX_DiscretionOffsetType_Price -> "Price"
        | FIX_DiscretionOffsetType_BasisPoints -> "BasisPoints"
        | FIX_DiscretionOffsetType_Ticks -> "Ticks"
        | FIX_DiscretionOffsetType_PriceTier -> "PriceTier"
;;

let discretionrounddirection_to_string ( d ) =
    match d with
        | FIX_DiscretionRoundDirection_MoreAggressive -> "MoreAggressive"
        | FIX_DiscretionRoundDirection_MorePassive -> "MorePassive"
;;

let discretionscope_to_string ( d ) =
    match d with
        | FIX_DiscretionScope_Local -> "Local"
        | FIX_DiscretionScope_National -> "National"
        | FIX_DiscretionScope_Global -> "Global"
        | FIX_DiscretionScope_NationalExcludingLocal -> "NationalExcludingLocal"
;;

let distribpaymentmethod_to_string ( d ) =
    match d with
        | FIX_DistribPaymentMethod_CREST -> "CREST"
        | FIX_DistribPaymentMethod_NSCC -> "NSCC"
        | FIX_DistribPaymentMethod_Euroclear -> "Euroclear"
        | FIX_DistribPaymentMethod_Clearstream -> "Clearstream"
        | FIX_DistribPaymentMethod_Cheque -> "Cheque"
        | FIX_DistribPaymentMethod_TelegraphicTransfer -> "TelegraphicTransfer"
        | FIX_DistribPaymentMethod_FedWire -> "FedWire"
        | FIX_DistribPaymentMethod_DirectCredit -> "DirectCredit"
        | FIX_DistribPaymentMethod_ACHCredit -> "ACHCredit"
        | FIX_DistribPaymentMethod_BPAY -> "BPAY"
        | FIX_DistribPaymentMethod_HighValueClearingSystemHVACS -> "HighValueClearingSystemHVACS"
        | FIX_DistribPaymentMethod_ReinvestInFund -> "ReinvestInFund"
;;

let dlvyinsttype_to_string ( d ) =
    match d with
        | FIX_DlvyInstType_Securities -> "Securities"
        | FIX_DlvyInstType_Cash -> "Cash"
;;

let duetorelated_to_string ( d ) =
    match d with
        | FIX_DueToRelated_RelatedToSecurityHalt -> "RelatedToSecurityHalt"
        | FIX_DueToRelated_NotRelatedToSecurityHalt -> "NotRelatedToSecurityHalt"
;;

let emailtype_to_string ( d ) =
    match d with
        | FIX_EmailType_New -> "New"
        | FIX_EmailType_Reply -> "Reply"
        | FIX_EmailType_AdminReply -> "AdminReply"
;;

let encryptmethod_to_string ( d ) =
    match d with
        | FIX_EncryptMethod_Unknown -> "Unknown"
        | FIX_EncryptMethod_PKCS -> "PKCS"
        | FIX_EncryptMethod_DES -> "DES"
        | FIX_EncryptMethod_PKCSDES -> "PKCSDES"
        | FIX_EncryptMethod_PGPDES -> "PGPDES"
        | FIX_EncryptMethod_PGPDESMD5 -> "PGPDESMD5"
        | FIX_EncryptMethod_PEM -> "PEM"
;;

let eventtype_to_string ( d ) =
    match d with
        | FIX_EventType_Put -> "Put"
        | FIX_EventType_Call -> "Call"
        | FIX_EventType_Tender -> "Tender"
        | FIX_EventType_SinkingFundCall -> "SinkingFundCall"
        | FIX_EventType_Other -> "Other"
;;

let exchangeforphysical_to_string ( d ) =
    match d with
        | FIX_ExchangeForPhysical_True -> "True"
        | FIX_ExchangeForPhysical_False -> "False"
;;

let execinst_to_string ( d ) =
    match d with
        | FIX_ExecInst_NotHeld -> "NotHeld"
        | FIX_ExecInst_Work -> "Work"
        | FIX_ExecInst_GoAlong -> "GoAlong"
        | FIX_ExecInst_OverTheDay -> "OverTheDay"
        | FIX_ExecInst_Held -> "Held"
        | FIX_ExecInst_ParticipateDoNotInitiate -> "ParticipateDoNotInitiate"
        | FIX_ExecInst_StrictScale -> "StrictScale"
        | FIX_ExecInst_TryToScale -> "TryToScale"
        | FIX_ExecInst_StayOnBidSide -> "StayOnBidSide"
        | FIX_ExecInst_StayOnOfferSide -> "StayOnOfferSide"
        | FIX_ExecInst_NoCross -> "NoCross"
        | FIX_ExecInst_OKToCross -> "OKToCross"
        | FIX_ExecInst_CallFirst -> "CallFirst"
        | FIX_ExecInst_PercentOfVolume -> "PercentOfVolume"
        | FIX_ExecInst_DoNotIncrease -> "DoNotIncrease"
        | FIX_ExecInst_DoNotReduce -> "DoNotReduce"
        | FIX_ExecInst_AllOrNone -> "AllOrNone"
        | FIX_ExecInst_ReinstateOnSystemFailure -> "ReinstateOnSystemFailure"
        | FIX_ExecInst_InstitutionsOnly -> "InstitutionsOnly"
        | FIX_ExecInst_ReinstateOnTradingHalt -> "ReinstateOnTradingHalt"
        | FIX_ExecInst_CancelOnTradingHalt -> "CancelOnTradingHalt"
        | FIX_ExecInst_LastPeg -> "LastPeg"
        | FIX_ExecInst_MidPricePeg -> "MidPricePeg"
        | FIX_ExecInst_NonNegotiable -> "NonNegotiable"
        | FIX_ExecInst_OpeningPeg -> "OpeningPeg"
        | FIX_ExecInst_MarketPeg -> "MarketPeg"
        | FIX_ExecInst_CancelOnSystemFailure -> "CancelOnSystemFailure"
        | FIX_ExecInst_PrimaryPeg -> "PrimaryPeg"
        | FIX_ExecInst_Suspend -> "Suspend"
        | FIX_ExecInst_CustomerDisplayInstruction -> "CustomerDisplayInstruction"
        | FIX_ExecInst_Netting -> "Netting"
        | FIX_ExecInst_PegToVWAP -> "PegToVWAP"
        | FIX_ExecInst_TradeAlong -> "TradeAlong"
        | FIX_ExecInst_TryToStop -> "TryToStop"
        | FIX_ExecInst_CancelIfNotBest -> "CancelIfNotBest"
        | FIX_ExecInst_TrailingStopPeg -> "TrailingStopPeg"
        | FIX_ExecInst_StrictLimit -> "StrictLimit"
        | FIX_ExecInst_IgnorePriceValidityChecks -> "IgnorePriceValidityChecks"
        | FIX_ExecInst_PegToLimitPrice -> "PegToLimitPrice"
        | FIX_ExecInst_WorkToTargetStrategy -> "WorkToTargetStrategy"
;;

let execpricetype_to_string ( d ) =
    match d with
        | FIX_ExecPriceType_BidPrice -> "BidPrice"
        | FIX_ExecPriceType_CreationPrice -> "CreationPrice"
        | FIX_ExecPriceType_CreationPricePlusAdjustmentPercent -> "CreationPricePlusAdjustmentPercent"
        | FIX_ExecPriceType_CreationPricePlusAdjustmentAmount -> "CreationPricePlusAdjustmentAmount"
        | FIX_ExecPriceType_OfferPrice -> "OfferPrice"
        | FIX_ExecPriceType_OfferPriceMinusAdjustmentPercent -> "OfferPriceMinusAdjustmentPercent"
        | FIX_ExecPriceType_OfferPriceMinusAdjustmentAmount -> "OfferPriceMinusAdjustmentAmount"
        | FIX_ExecPriceType_SinglePrice -> "SinglePrice"
;;

let execrestatementreason_to_string ( d ) =
    match d with
        | FIX_ExecRestatementReason_GTCorporateAction -> "GTCorporateAction"
        | FIX_ExecRestatementReason_GTRenewal -> "GTRenewal"
        | FIX_ExecRestatementReason_VerbalChange -> "VerbalChange"
        | FIX_ExecRestatementReason_RepricingOfOrder -> "RepricingOfOrder"
        | FIX_ExecRestatementReason_BrokerOption -> "BrokerOption"
        | FIX_ExecRestatementReason_PartialDeclineOfOrderQty -> "PartialDeclineOfOrderQty"
        | FIX_ExecRestatementReason_CancelOnTradingHalt -> "CancelOnTradingHalt"
        | FIX_ExecRestatementReason_CancelOnSystemFailure -> "CancelOnSystemFailure"
        | FIX_ExecRestatementReason_Market -> "Market"
        | FIX_ExecRestatementReason_Canceled -> "Canceled"
        | FIX_ExecRestatementReason_WarehouseRecap -> "WarehouseRecap"
        | FIX_ExecRestatementReason_Other -> "Other"
;;

let exectype_to_string ( d ) =
    match d with
        | FIX_ExecType_New -> "New"
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
        | FIX_ExecType_Trade -> "Trade"
        | FIX_ExecType_TradeCorrect -> "TradeCorrect"
        | FIX_ExecType_TradeCancel -> "TradeCancel"
        | FIX_ExecType_OrderStatus -> "OrderStatus"
;;

let exercisemethod_to_string ( d ) =
    match d with
        | FIX_ExerciseMethod_Automatic -> "Automatic"
        | FIX_ExerciseMethod_Manual -> "Manual"
;;

let expirationcycle_to_string ( d ) =
    match d with
        | FIX_ExpirationCycle_ExpireOnTradingSessionClose -> "ExpireOnTradingSessionClose"
        | FIX_ExpirationCycle_ExpireOnTradingSessionOpen -> "ExpireOnTradingSessionOpen"
;;

let financialstatus_to_string ( d ) =
    match d with
        | FIX_FinancialStatus_Bankrupt -> "Bankrupt"
        | FIX_FinancialStatus_PendingDelisting -> "PendingDelisting"
;;

let forexreq_to_string ( d ) =
    match d with
        | FIX_ForexReq_ExecuteForexAfterSecurityTrade -> "ExecuteForexAfterSecurityTrade"
        | FIX_ForexReq_DoNotExecuteForexAfterSecurityTrade -> "DoNotExecuteForexAfterSecurityTrade"
;;

let fundrenewwaiv_to_string ( d ) =
    match d with
        | FIX_FundRenewWaiv_Yes -> "Yes"
        | FIX_FundRenewWaiv_No -> "No"
;;

let gtbookinginst_to_string ( d ) =
    match d with
        | FIX_GTBookingInst_BookOutAllTradesOnDayOfExecution -> "BookOutAllTradesOnDayOfExecution"
        | FIX_GTBookingInst_AccumulateUntilFilledOrExpired -> "AccumulateUntilFilledOrExpired"
        | FIX_GTBookingInst_AccumulateUntilVerballlyNotifiedOtherwise -> "AccumulateUntilVerballlyNotifiedOtherwise"
;;

let gapfillflag_to_string ( d ) =
    match d with
        | FIX_GapFillFlag_GapFillMessage -> "GapFillMessage"
        | FIX_GapFillFlag_SequenceReset -> "SequenceReset"
;;

let haltreason_to_string ( d ) =
    match d with
        | FIX_HaltReason_OrderImbalance -> "OrderImbalance"
        | FIX_HaltReason_EquipmentChangeover -> "EquipmentChangeover"
        | FIX_HaltReason_NewsPending -> "NewsPending"
        | FIX_HaltReason_NewsDissemination -> "NewsDissemination"
        | FIX_HaltReason_OrderInflux -> "OrderInflux"
        | FIX_HaltReason_AdditionalInformation -> "AdditionalInformation"
;;

let handlinst_to_string ( d ) =
    match d with
        | FIX_HandlInst_AutomatedExecutionNoIntervention -> "AutomatedExecutionNoIntervention"
        | FIX_HandlInst_AutomatedExecutionInterventionOK -> "AutomatedExecutionInterventionOK"
        | FIX_HandlInst_ManualOrder -> "ManualOrder"
;;

let ioinaturalflag_to_string ( d ) =
    match d with
        | FIX_IOINaturalFlag_Natural -> "Natural"
        | FIX_IOINaturalFlag_NotNatural -> "NotNatural"
;;

let ioiqltyind_to_string ( d ) =
    match d with
        | FIX_IOIQltyInd_Low -> "Low"
        | FIX_IOIQltyInd_Medium -> "Medium"
        | FIX_IOIQltyInd_High -> "High"
;;

let ioiqty_to_string ( d ) =
    match d with
        | FIX_IOIQty_Small -> "Small"
        | FIX_IOIQty_Medium -> "Medium"
        | FIX_IOIQty_Large -> "Large"
;;

let ioiqualifier_to_string ( d ) =
    match d with
        | FIX_IOIQualifier_AllOrNone -> "AllOrNone"
        | FIX_IOIQualifier_MarketOnClose -> "MarketOnClose"
        | FIX_IOIQualifier_AtTheClose -> "AtTheClose"
        | FIX_IOIQualifier_VWAP -> "VWAP"
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
;;

let ioitranstype_to_string ( d ) =
    match d with
        | FIX_IOITransType_New -> "New"
        | FIX_IOITransType_Cancel -> "Cancel"
        | FIX_IOITransType_Replace -> "Replace"
;;

let inviewofcommon_to_string ( d ) =
    match d with
        | FIX_InViewOfCommon_HaltWasDueToCommonStockBeingHalted -> "HaltWasDueToCommonStockBeingHalted"
        | FIX_InViewOfCommon_HaltWasNotRelatedToAHaltOfTheCommonStock -> "HaltWasNotRelatedToAHaltOfTheCommonStock"
;;

let inctaxind_to_string ( d ) =
    match d with
        | FIX_IncTaxInd_Net -> "Net"
        | FIX_IncTaxInd_Gross -> "Gross"
;;

let instrattribtype_to_string ( d ) =
    match d with
        | FIX_InstrAttribType_Flat -> "Flat"
        | FIX_InstrAttribType_ZeroCoupon -> "ZeroCoupon"
        | FIX_InstrAttribType_InterestBearing -> "InterestBearing"
        | FIX_InstrAttribType_NoPeriodicPayments -> "NoPeriodicPayments"
        | FIX_InstrAttribType_VariableRate -> "VariableRate"
        | FIX_InstrAttribType_LessFeeForPut -> "LessFeeForPut"
        | FIX_InstrAttribType_SteppedCoupon -> "SteppedCoupon"
        | FIX_InstrAttribType_CouponPeriod -> "CouponPeriod"
        | FIX_InstrAttribType_When -> "When"
        | FIX_InstrAttribType_OriginalIssueDiscount -> "OriginalIssueDiscount"
        | FIX_InstrAttribType_Callable -> "Callable"
        | FIX_InstrAttribType_EscrowedToMaturity -> "EscrowedToMaturity"
        | FIX_InstrAttribType_EscrowedToRedemptionDate -> "EscrowedToRedemptionDate"
        | FIX_InstrAttribType_PreRefunded -> "PreRefunded"
        | FIX_InstrAttribType_InDefault -> "InDefault"
        | FIX_InstrAttribType_Unrated -> "Unrated"
        | FIX_InstrAttribType_Taxable -> "Taxable"
        | FIX_InstrAttribType_Indexed -> "Indexed"
        | FIX_InstrAttribType_SubjectToAlternativeMinimumTax -> "SubjectToAlternativeMinimumTax"
        | FIX_InstrAttribType_OriginalIssueDiscountPrice -> "OriginalIssueDiscountPrice"
        | FIX_InstrAttribType_CallableBelowMaturityValue -> "CallableBelowMaturityValue"
        | FIX_InstrAttribType_CallableWithoutNotice -> "CallableWithoutNotice"
        | FIX_InstrAttribType_Text -> "Text"
;;

let lastcapacity_to_string ( d ) =
    match d with
        | FIX_LastCapacity_Agent -> "Agent"
        | FIX_LastCapacity_CrossAsAgent -> "CrossAsAgent"
        | FIX_LastCapacity_CrossAsPrincipal -> "CrossAsPrincipal"
        | FIX_LastCapacity_Principal -> "Principal"
;;

let lastfragment_to_string ( d ) =
    match d with
        | FIX_LastFragment_LastMessage -> "LastMessage"
        | FIX_LastFragment_NotLastMessage -> "NotLastMessage"
;;

let lastliquidityind_to_string ( d ) =
    match d with
        | FIX_LastLiquidityInd_AddedLiquidity -> "AddedLiquidity"
        | FIX_LastLiquidityInd_RemovedLiquidity -> "RemovedLiquidity"
        | FIX_LastLiquidityInd_LiquidityRoutedOut -> "LiquidityRoutedOut"
;;

let legswaptype_to_string ( d ) =
    match d with
        | FIX_LegSwapType_ParForPar -> "ParForPar"
        | FIX_LegSwapType_ModifiedDuration -> "ModifiedDuration"
        | FIX_LegSwapType_Risk -> "Risk"
        | FIX_LegSwapType_Proceeds -> "Proceeds"
;;

let legalconfirm_to_string ( d ) =
    match d with
        | FIX_LegalConfirm_LegalConfirm -> "LegalConfirm"
        | FIX_LegalConfirm_DoesNotConsituteALegalConfirm -> "DoesNotConsituteALegalConfirm"
;;

let liquidityindtype_to_string ( d ) =
    match d with
        | FIX_LiquidityIndType_FiveDayMovingAverage -> "FiveDayMovingAverage"
        | FIX_LiquidityIndType_TwentyDayMovingAverage -> "TwentyDayMovingAverage"
        | FIX_LiquidityIndType_NormalMarketSize -> "NormalMarketSize"
        | FIX_LiquidityIndType_Other -> "Other"
;;

let listexecinsttype_to_string ( d ) =
    match d with
        | FIX_ListExecInstType_Immediate -> "Immediate"
        | FIX_ListExecInstType_WaitForInstruction -> "WaitForInstruction"
        | FIX_ListExecInstType_SellDriven -> "SellDriven"
        | FIX_ListExecInstType_BuyDrivenCashTopUp -> "BuyDrivenCashTopUp"
        | FIX_ListExecInstType_BuyDrivenCashWithdraw -> "BuyDrivenCashWithdraw"
;;

let listorderstatus_to_string ( d ) =
    match d with
        | FIX_ListOrderStatus_InBiddingProcess -> "InBiddingProcess"
        | FIX_ListOrderStatus_ReceivedForExecution -> "ReceivedForExecution"
        | FIX_ListOrderStatus_Executing -> "Executing"
        | FIX_ListOrderStatus_Cancelling -> "Cancelling"
        | FIX_ListOrderStatus_Alert -> "Alert"
        | FIX_ListOrderStatus_AllDone -> "AllDone"
        | FIX_ListOrderStatus_Reject -> "Reject"
;;

let liststatustype_to_string ( d ) =
    match d with
        | FIX_ListStatusType_Ack -> "Ack"
        | FIX_ListStatusType_Response -> "Response"
        | FIX_ListStatusType_Timed -> "Timed"
        | FIX_ListStatusType_ExecStarted -> "ExecStarted"
        | FIX_ListStatusType_AllDone -> "AllDone"
        | FIX_ListStatusType_Alert -> "Alert"
;;

let locatereqd_to_string ( d ) =
    match d with
        | FIX_LocateReqd_Yes -> "Yes"
        | FIX_LocateReqd_No -> "No"
;;

let mdentrytype_to_string ( d ) =
    match d with
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
        | FIX_MDEntryType_Imbalance -> "Imbalance"
        | FIX_MDEntryType_TradeVolume -> "TradeVolume"
        | FIX_MDEntryType_OpenInterest -> "OpenInterest"
;;

let mdimplicitdelete_to_string ( d ) =
    match d with
        | FIX_MDImplicitDelete_Yes -> "Yes"
        | FIX_MDImplicitDelete_No -> "No"
;;

let mdreqrejreason_to_string ( d ) =
    match d with
        | FIX_MDReqRejReason_UnknownSymbol -> "UnknownSymbol"
        | FIX_MDReqRejReason_DuplicateMDReqID -> "DuplicateMDReqID"
        | FIX_MDReqRejReason_InsufficientBandwidth -> "InsufficientBandwidth"
        | FIX_MDReqRejReason_InsufficientPermissions -> "InsufficientPermissions"
        | FIX_MDReqRejReason_UnsupportedSubscriptionRequestType -> "UnsupportedSubscriptionRequestType"
        | FIX_MDReqRejReason_UnsupportedMarketDepth -> "UnsupportedMarketDepth"
        | FIX_MDReqRejReason_UnsupportedMDUpdateType -> "UnsupportedMDUpdateType"
        | FIX_MDReqRejReason_UnsupportedAggregatedBook -> "UnsupportedAggregatedBook"
        | FIX_MDReqRejReason_UnsupportedMDEntryType -> "UnsupportedMDEntryType"
        | FIX_MDReqRejReason_UnsupportedTradingSessionID -> "UnsupportedTradingSessionID"
        | FIX_MDReqRejReason_UnsupportedScope -> "UnsupportedScope"
        | FIX_MDReqRejReason_UnsupportedOpenCloseSettleFlag -> "UnsupportedOpenCloseSettleFlag"
        | FIX_MDReqRejReason_UnsupportedMDImplicitDelete -> "UnsupportedMDImplicitDelete"
;;

let mdupdateaction_to_string ( d ) =
    match d with
        | FIX_MDUpdateAction_New -> "New"
        | FIX_MDUpdateAction_Change -> "Change"
        | FIX_MDUpdateAction_Delete -> "Delete"
;;

let mdupdatetype_to_string ( d ) =
    match d with
        | FIX_MDUpdateType_FullRefresh -> "FullRefresh"
        | FIX_MDUpdateType_IncrementalRefresh -> "IncrementalRefresh"
;;

let masscancelrejectreason_to_string ( d ) =
    match d with
        | FIX_MassCancelRejectReason_MassCancelNotSupported -> "MassCancelNotSupported"
        | FIX_MassCancelRejectReason_InvalidOrUnknownSecurity -> "InvalidOrUnknownSecurity"
        | FIX_MassCancelRejectReason_InvalidOrUnkownUnderlyingSecurity -> "InvalidOrUnkownUnderlyingSecurity"
        | FIX_MassCancelRejectReason_InvalidOrUnknownProduct -> "InvalidOrUnknownProduct"
        | FIX_MassCancelRejectReason_InvalidOrUnknownCFICode -> "InvalidOrUnknownCFICode"
        | FIX_MassCancelRejectReason_InvalidOrUnknownSecurityType -> "InvalidOrUnknownSecurityType"
        | FIX_MassCancelRejectReason_InvalidOrUnknownTradingSession -> "InvalidOrUnknownTradingSession"
        | FIX_MassCancelRejectReason_Other -> "Other"
;;

let masscancelrequesttype_to_string ( d ) =
    match d with
        | FIX_MassCancelRequestType_CancelOrdersForASecurity -> "CancelOrdersForASecurity"
        | FIX_MassCancelRequestType_CancelOrdersForAnUnderlyingSecurity -> "CancelOrdersForAnUnderlyingSecurity"
        | FIX_MassCancelRequestType_CancelOrdersForAProduct -> "CancelOrdersForAProduct"
        | FIX_MassCancelRequestType_CancelOrdersForACFICode -> "CancelOrdersForACFICode"
        | FIX_MassCancelRequestType_CancelOrdersForASecurityType -> "CancelOrdersForASecurityType"
        | FIX_MassCancelRequestType_CancelOrdersForATradingSession -> "CancelOrdersForATradingSession"
        | FIX_MassCancelRequestType_CancelAllOrders -> "CancelAllOrders"
;;

let masscancelresponse_to_string ( d ) =
    match d with
        | FIX_MassCancelResponse_CancelRequestRejected -> "CancelRequestRejected"
        | FIX_MassCancelResponse_CancelOrdersForASecurity -> "CancelOrdersForASecurity"
        | FIX_MassCancelResponse_CancelOrdersForAnUnderlyingSecurity -> "CancelOrdersForAnUnderlyingSecurity"
        | FIX_MassCancelResponse_CancelOrdersForAProduct -> "CancelOrdersForAProduct"
        | FIX_MassCancelResponse_CancelOrdersForACFICode -> "CancelOrdersForACFICode"
        | FIX_MassCancelResponse_CancelOrdersForASecurityType -> "CancelOrdersForASecurityType"
        | FIX_MassCancelResponse_CancelOrdersForATradingSession -> "CancelOrdersForATradingSession"
        | FIX_MassCancelResponse_CancelAllOrders -> "CancelAllOrders"
;;

let massstatusreqtype_to_string ( d ) =
    match d with
        | FIX_MassStatusReqType_StatusForOrdersForASecurity -> "StatusForOrdersForASecurity"
        | FIX_MassStatusReqType_StatusForOrdersForAnUnderlyingSecurity -> "StatusForOrdersForAnUnderlyingSecurity"
        | FIX_MassStatusReqType_StatusForOrdersForAProduct -> "StatusForOrdersForAProduct"
        | FIX_MassStatusReqType_StatusForOrdersForACFICode -> "StatusForOrdersForACFICode"
        | FIX_MassStatusReqType_StatusForOrdersForASecurityType -> "StatusForOrdersForASecurityType"
        | FIX_MassStatusReqType_StatusForOrdersForATradingSession -> "StatusForOrdersForATradingSession"
        | FIX_MassStatusReqType_StatusForAllOrders -> "StatusForAllOrders"
        | FIX_MassStatusReqType_StatusForOrdersForAPartyID -> "StatusForOrdersForAPartyID"
;;

let matchstatus_to_string ( d ) =
    match d with
        | FIX_MatchStatus_Compared -> "Compared"
        | FIX_MatchStatus_Uncompared -> "Uncompared"
        | FIX_MatchStatus_AdvisoryOrAlert -> "AdvisoryOrAlert"
;;

let matchtype_to_string ( d ) =
    match d with
        | FIX_MatchType_ExactMatchPlus4BadgesExecTime -> "ExactMatchPlus4BadgesExecTime"
        | FIX_MatchType_ExactMatchPlus4Badges -> "ExactMatchPlus4Badges"
        | FIX_MatchType_ExactMatchPlus2BadgesExecTime -> "ExactMatchPlus2BadgesExecTime"
        | FIX_MatchType_ExactMatchPlus2Badges -> "ExactMatchPlus2Badges"
        | FIX_MatchType_ExactMatchPlusExecTime -> "ExactMatchPlusExecTime"
        | FIX_MatchType_StampedAdvisoriesOrSpecialistAccepts -> "StampedAdvisoriesOrSpecialistAccepts"
        | FIX_MatchType_A1ExactMatchSummarizedQuantity -> "A1ExactMatchSummarizedQuantity"
        | FIX_MatchType_A2ExactMatchSummarizedQuantity -> "A2ExactMatchSummarizedQuantity"
        | FIX_MatchType_A3ExactMatchSummarizedQuantity -> "A3ExactMatchSummarizedQuantity"
        | FIX_MatchType_A4ExactMatchSummarizedQuantity -> "A4ExactMatchSummarizedQuantity"
        | FIX_MatchType_A5ExactMatchSummarizedQuantity -> "A5ExactMatchSummarizedQuantity"
        | FIX_MatchType_ExactMatchMinusBadgesTimes -> "ExactMatchMinusBadgesTimes"
        | FIX_MatchType_SummarizedMatchMinusBadgesTimes -> "SummarizedMatchMinusBadgesTimes"
        | FIX_MatchType_OCSLockedIn -> "OCSLockedIn"
        | FIX_MatchType_ACTAcceptedTrade -> "ACTAcceptedTrade"
        | FIX_MatchType_ACTDefaultTrade -> "ACTDefaultTrade"
        | FIX_MatchType_ACTDefaultAfterM2 -> "ACTDefaultAfterM2"
        | FIX_MatchType_ACTM6Match -> "ACTM6Match"
;;

let messageencoding_to_string ( d ) =
    match d with
        | FIX_MessageEncoding_ISO2022JP -> "ISO2022JP"
        | FIX_MessageEncoding_EUCJP -> "EUCJP"
        | FIX_MessageEncoding_ShiftJIS -> "ShiftJIS"
        | FIX_MessageEncoding_UTF8 -> "UTF8"
;;

let miscfeebasis_to_string ( d ) =
    match d with
        | FIX_MiscFeeBasis_Absolute -> "Absolute"
        | FIX_MiscFeeBasis_PerUnit -> "PerUnit"
        | FIX_MiscFeeBasis_Percentage -> "Percentage"
;;

let miscfeetype_to_string ( d ) =
    match d with
        | FIX_MiscFeeType_Regulatory -> "Regulatory"
        | FIX_MiscFeeType_Tax -> "Tax"
        | FIX_MiscFeeType_LocalCommission -> "LocalCommission"
        | FIX_MiscFeeType_ExchangeFees -> "ExchangeFees"
        | FIX_MiscFeeType_Stamp -> "Stamp"
        | FIX_MiscFeeType_Levy -> "Levy"
        | FIX_MiscFeeType_Other -> "Other"
        | FIX_MiscFeeType_Markup -> "Markup"
        | FIX_MiscFeeType_ConsumptionTax -> "ConsumptionTax"
        | FIX_MiscFeeType_PerTransaction -> "PerTransaction"
        | FIX_MiscFeeType_Conversion -> "Conversion"
        | FIX_MiscFeeType_Agent -> "Agent"
;;

let moneylaunderingstatus_to_string ( d ) =
    match d with
        | FIX_MoneyLaunderingStatus_Passed -> "Passed"
        | FIX_MoneyLaunderingStatus_NotChecked -> "NotChecked"
        | FIX_MoneyLaunderingStatus_ExemptBelowLimit -> "ExemptBelowLimit"
        | FIX_MoneyLaunderingStatus_ExemptMoneyType -> "ExemptMoneyType"
        | FIX_MoneyLaunderingStatus_ExemptAuthorised -> "ExemptAuthorised"
;;

let msgdirection_to_string ( d ) =
    match d with
        | FIX_MsgDirection_Send -> "Send"
        | FIX_MsgDirection_Receive -> "Receive"
;;

let msgtype_to_string ( d ) =
    match d with
        | FIX_MsgType_Heartbeat -> "Heartbeat"
        | FIX_MsgType_TestRequest -> "TestRequest"
        | FIX_MsgType_ResendRequest -> "ResendRequest"
        | FIX_MsgType_Reject -> "Reject"
        | FIX_MsgType_SequenceReset -> "SequenceReset"
        | FIX_MsgType_Logout -> "Logout"
        | FIX_MsgType_IOI -> "IOI"
        | FIX_MsgType_Advertisement -> "Advertisement"
        | FIX_MsgType_ExecutionReport -> "ExecutionReport"
        | FIX_MsgType_OrderCancelReject -> "OrderCancelReject"
        | FIX_MsgType_Logon -> "Logon"
        | FIX_MsgType_News -> "News"
        | FIX_MsgType_Email -> "Email"
        | FIX_MsgType_NewOrderSingle -> "NewOrderSingle"
        | FIX_MsgType_NewOrderList -> "NewOrderList"
        | FIX_MsgType_OrderCancelRequest -> "OrderCancelRequest"
        | FIX_MsgType_OrderCancelReplaceRequest -> "OrderCancelReplaceRequest"
        | FIX_MsgType_OrderStatusRequest -> "OrderStatusRequest"
        | FIX_MsgType_AllocationInstruction -> "AllocationInstruction"
        | FIX_MsgType_ListCancelRequest -> "ListCancelRequest"
        | FIX_MsgType_ListExecute -> "ListExecute"
        | FIX_MsgType_ListStatusRequest -> "ListStatusRequest"
        | FIX_MsgType_ListStatus -> "ListStatus"
        | FIX_MsgType_AllocationInstructionAck -> "AllocationInstructionAck"
        | FIX_MsgType_DontKnowTrade -> "DontKnowTrade"
        | FIX_MsgType_QuoteRequest -> "QuoteRequest"
        | FIX_MsgType_Quote -> "Quote"
        | FIX_MsgType_SettlementInstructions -> "SettlementInstructions"
        | FIX_MsgType_MarketDataRequest -> "MarketDataRequest"
        | FIX_MsgType_MarketDataSnapshotFullRefresh -> "MarketDataSnapshotFullRefresh"
        | FIX_MsgType_MarketDataIncrementalRefresh -> "MarketDataIncrementalRefresh"
        | FIX_MsgType_MarketDataRequestReject -> "MarketDataRequestReject"
        | FIX_MsgType_QuoteCancel -> "QuoteCancel"
        | FIX_MsgType_QuoteStatusRequest -> "QuoteStatusRequest"
        | FIX_MsgType_MassQuoteAcknowledgement -> "MassQuoteAcknowledgement"
        | FIX_MsgType_SecurityDefinitionRequest -> "SecurityDefinitionRequest"
        | FIX_MsgType_SecurityDefinition -> "SecurityDefinition"
        | FIX_MsgType_SecurityStatusRequest -> "SecurityStatusRequest"
        | FIX_MsgType_SecurityStatus -> "SecurityStatus"
        | FIX_MsgType_TradingSessionStatusRequest -> "TradingSessionStatusRequest"
        | FIX_MsgType_TradingSessionStatus -> "TradingSessionStatus"
        | FIX_MsgType_MassQuote -> "MassQuote"
        | FIX_MsgType_BusinessMessageReject -> "BusinessMessageReject"
        | FIX_MsgType_BidRequest -> "BidRequest"
        | FIX_MsgType_BidResponse -> "BidResponse"
        | FIX_MsgType_ListStrikePrice -> "ListStrikePrice"
        | FIX_MsgType_XMLNonFIX -> "XMLNonFIX"
        | FIX_MsgType_RegistrationInstructions -> "RegistrationInstructions"
        | FIX_MsgType_RegistrationInstructionsResponse -> "RegistrationInstructionsResponse"
        | FIX_MsgType_OrderMassCancelRequest -> "OrderMassCancelRequest"
        | FIX_MsgType_OrderMassCancelReport -> "OrderMassCancelReport"
        | FIX_MsgType_NewOrderCross -> "NewOrderCross"
        | FIX_MsgType_CrossOrderCancelReplaceRequest -> "CrossOrderCancelReplaceRequest"
        | FIX_MsgType_CrossOrderCancelRequest -> "CrossOrderCancelRequest"
        | FIX_MsgType_SecurityTypeRequest -> "SecurityTypeRequest"
        | FIX_MsgType_SecurityTypes -> "SecurityTypes"
        | FIX_MsgType_SecurityListRequest -> "SecurityListRequest"
        | FIX_MsgType_SecurityList -> "SecurityList"
        | FIX_MsgType_DerivativeSecurityListRequest -> "DerivativeSecurityListRequest"
        | FIX_MsgType_DerivativeSecurityList -> "DerivativeSecurityList"
        | FIX_MsgType_NewOrderMultileg -> "NewOrderMultileg"
        | FIX_MsgType_MultilegOrderCancelReplace -> "MultilegOrderCancelReplace"
        | FIX_MsgType_TradeCaptureReportRequest -> "TradeCaptureReportRequest"
        | FIX_MsgType_TradeCaptureReport -> "TradeCaptureReport"
        | FIX_MsgType_OrderMassStatusRequest -> "OrderMassStatusRequest"
        | FIX_MsgType_QuoteRequestReject -> "QuoteRequestReject"
        | FIX_MsgType_RFQRequest -> "RFQRequest"
        | FIX_MsgType_QuoteStatusReport -> "QuoteStatusReport"
        | FIX_MsgType_QuoteResponse -> "QuoteResponse"
        | FIX_MsgType_Confirmation -> "Confirmation"
        | FIX_MsgType_PositionMaintenanceRequest -> "PositionMaintenanceRequest"
        | FIX_MsgType_PositionMaintenanceReport -> "PositionMaintenanceReport"
        | FIX_MsgType_RequestForPositions -> "RequestForPositions"
        | FIX_MsgType_RequestForPositionsAck -> "RequestForPositionsAck"
        | FIX_MsgType_PositionReport -> "PositionReport"
        | FIX_MsgType_TradeCaptureReportRequestAck -> "TradeCaptureReportRequestAck"
        | FIX_MsgType_TradeCaptureReportAck -> "TradeCaptureReportAck"
        | FIX_MsgType_AllocationReport -> "AllocationReport"
        | FIX_MsgType_AllocationReportAck -> "AllocationReportAck"
        | FIX_MsgType_ConfirmationAck -> "ConfirmationAck"
        | FIX_MsgType_SettlementInstructionRequest -> "SettlementInstructionRequest"
        | FIX_MsgType_AssignmentReport -> "AssignmentReport"
        | FIX_MsgType_CollateralRequest -> "CollateralRequest"
        | FIX_MsgType_CollateralAssignment -> "CollateralAssignment"
        | FIX_MsgType_CollateralResponse -> "CollateralResponse"
        | FIX_MsgType_CollateralReport -> "CollateralReport"
        | FIX_MsgType_CollateralInquiry -> "CollateralInquiry"
        | FIX_MsgType_NetworkCounterpartySystemStatusRequest -> "NetworkCounterpartySystemStatusRequest"
        | FIX_MsgType_NetworkCounterpartySystemStatusResponse -> "NetworkCounterpartySystemStatusResponse"
        | FIX_MsgType_UserRequest -> "UserRequest"
        | FIX_MsgType_UserResponse -> "UserResponse"
        | FIX_MsgType_CollateralInquiryAck -> "CollateralInquiryAck"
        | FIX_MsgType_ConfirmationRequest -> "ConfirmationRequest"
;;

let multilegreportingtype_to_string ( d ) =
    match d with
        | FIX_MultiLegReportingType_SingleSecurity -> "SingleSecurity"
        | FIX_MultiLegReportingType_IndividualLegOfAMultiLegSecurity -> "IndividualLegOfAMultiLegSecurity"
        | FIX_MultiLegReportingType_MultiLegSecurity -> "MultiLegSecurity"
;;

let multilegrpttypereq_to_string ( d ) =
    match d with
        | FIX_MultiLegRptTypeReq_ReportByMulitlegSecurityOnly -> "ReportByMulitlegSecurityOnly"
        | FIX_MultiLegRptTypeReq_ReportByMultilegSecurityAndInstrumentLegs -> "ReportByMultilegSecurityAndInstrumentLegs"
        | FIX_MultiLegRptTypeReq_ReportByInstrumentLegsOnly -> "ReportByInstrumentLegsOnly"
;;

let netgrossind_to_string ( d ) =
    match d with
        | FIX_NetGrossInd_Net -> "Net"
        | FIX_NetGrossInd_Gross -> "Gross"
;;

let networkrequesttype_to_string ( d ) =
    match d with
        | FIX_NetworkRequestType_Snapshot -> "Snapshot"
        | FIX_NetworkRequestType_Subscribe -> "Subscribe"
        | FIX_NetworkRequestType_StopSubscribing -> "StopSubscribing"
        | FIX_NetworkRequestType_LevelOfDetail -> "LevelOfDetail"
;;

let networkstatusresponsetype_to_string ( d ) =
    match d with
        | FIX_NetworkStatusResponseType_Full -> "Full"
        | FIX_NetworkStatusResponseType_IncrementalUpdate -> "IncrementalUpdate"
;;

let nosides_to_string ( d ) =
    match d with
        | FIX_NoSides_OneSide -> "OneSide"
        | FIX_NoSides_BothSides -> "BothSides"
;;

let notifybrokerofcredit_to_string ( d ) =
    match d with
        | FIX_NotifyBrokerOfCredit_DetailsShouldBeCommunicated -> "DetailsShouldBeCommunicated"
        | FIX_NotifyBrokerOfCredit_DetailsShouldNotBeCommunicated -> "DetailsShouldNotBeCommunicated"
;;

let oddlot_to_string ( d ) =
    match d with
        | FIX_OddLot_TreatAsOddLot -> "TreatAsOddLot"
        | FIX_OddLot_TreatAsRoundLot -> "TreatAsRoundLot"
;;

let openclosesettlflag_to_string ( d ) =
    match d with
        | FIX_OpenCloseSettlFlag_DailyOpen -> "DailyOpen"
        | FIX_OpenCloseSettlFlag_SessionOpen -> "SessionOpen"
        | FIX_OpenCloseSettlFlag_DeliverySettlementEntry -> "DeliverySettlementEntry"
        | FIX_OpenCloseSettlFlag_ExpectedEntry -> "ExpectedEntry"
        | FIX_OpenCloseSettlFlag_EntryFromPreviousBusinessDay -> "EntryFromPreviousBusinessDay"
        | FIX_OpenCloseSettlFlag_TheoreticalPriceValue -> "TheoreticalPriceValue"
;;

let ordrejreason_to_string ( d ) =
    match d with
        | FIX_OrdRejReason_BrokerCredit -> "BrokerCredit"
        | FIX_OrdRejReason_UnknownSymbol -> "UnknownSymbol"
        | FIX_OrdRejReason_ExchangeClosed -> "ExchangeClosed"
        | FIX_OrdRejReason_OrderExceedsLimit -> "OrderExceedsLimit"
        | FIX_OrdRejReason_TooLateToEnter -> "TooLateToEnter"
        | FIX_OrdRejReason_UnknownOrder -> "UnknownOrder"
        | FIX_OrdRejReason_DuplicateOrder -> "DuplicateOrder"
        | FIX_OrdRejReason_DuplicateOfAVerballyCommunicatedOrder -> "DuplicateOfAVerballyCommunicatedOrder"
        | FIX_OrdRejReason_StaleOrder -> "StaleOrder"
        | FIX_OrdRejReason_TradeAlongRequired -> "TradeAlongRequired"
        | FIX_OrdRejReason_InvalidInvestorID -> "InvalidInvestorID"
        | FIX_OrdRejReason_UnsupportedOrderCharacteristic -> "UnsupportedOrderCharacteristic"
        | FIX_OrdRejReason_IncorrectQuantity -> "IncorrectQuantity"
        | FIX_OrdRejReason_IncorrectAllocatedQuantity -> "IncorrectAllocatedQuantity"
        | FIX_OrdRejReason_UnknownAccount -> "UnknownAccount"
        | FIX_OrdRejReason_Other -> "Other"
;;

let ordstatus_to_string ( d ) =
    match d with
        | FIX_OrdStatus_New -> "New"
        | FIX_OrdStatus_PartiallyFilled -> "PartiallyFilled"
        | FIX_OrdStatus_Filled -> "Filled"
        | FIX_OrdStatus_DoneForDay -> "DoneForDay"
        | FIX_OrdStatus_Canceled -> "Canceled"
        | FIX_OrdStatus_PendingCancel -> "PendingCancel"
        | FIX_OrdStatus_Stopped -> "Stopped"
        | FIX_OrdStatus_Rejected -> "Rejected"
        | FIX_OrdStatus_Suspended -> "Suspended"
        | FIX_OrdStatus_PendingNew -> "PendingNew"
        | FIX_OrdStatus_Calculated -> "Calculated"
        | FIX_OrdStatus_Expired -> "Expired"
        | FIX_OrdStatus_AcceptedForBidding -> "AcceptedForBidding"
        | FIX_OrdStatus_PendingReplace -> "PendingReplace"
        | FIX_OrdStatus_Replaced -> "Replaced"
;;

let ordtype_to_string ( d ) =
    match d with
        | FIX_OrdType_Market -> "Market"
        | FIX_OrdType_Limit -> "Limit"
        | FIX_OrdType_Stop -> "Stop"
        | FIX_OrdType_StopLimit -> "StopLimit"
        | FIX_OrdType_WithOrWithout -> "WithOrWithout"
        | FIX_OrdType_LimitOrBetter -> "LimitOrBetter"
        | FIX_OrdType_LimitWithOrWithout -> "LimitWithOrWithout"
        | FIX_OrdType_OnBasis -> "OnBasis"
        | FIX_OrdType_PreviouslyQuoted -> "PreviouslyQuoted"
        | FIX_OrdType_PreviouslyIndicated -> "PreviouslyIndicated"
        | FIX_OrdType_ForexSwap -> "ForexSwap"
        | FIX_OrdType_Funari -> "Funari"
        | FIX_OrdType_MarketIfTouched -> "MarketIfTouched"
        | FIX_OrdType_MarketWithLeftOverAsLimit -> "MarketWithLeftOverAsLimit"
        | FIX_OrdType_PreviousFundValuationPoint -> "PreviousFundValuationPoint"
        | FIX_OrdType_NextFundValuationPoint -> "NextFundValuationPoint"
        | FIX_OrdType_Pegged -> "Pegged"
;;

let ordercapacity_to_string ( d ) =
    match d with
        | FIX_OrderCapacity_Agency -> "Agency"
        | FIX_OrderCapacity_Proprietary -> "Proprietary"
        | FIX_OrderCapacity_Individual -> "Individual"
        | FIX_OrderCapacity_Principal -> "Principal"
        | FIX_OrderCapacity_RisklessPrincipal -> "RisklessPrincipal"
        | FIX_OrderCapacity_AgentForOtherMember -> "AgentForOtherMember"
;;

let orderrestrictions_to_string ( d ) =
    match d with
        | FIX_OrderRestrictions_ProgramTrade -> "ProgramTrade"
        | FIX_OrderRestrictions_IndexArbitrage -> "IndexArbitrage"
        | FIX_OrderRestrictions_NonIndexArbitrage -> "NonIndexArbitrage"
        | FIX_OrderRestrictions_CompetingMarketMaker -> "CompetingMarketMaker"
        | FIX_OrderRestrictions_ActingAsMarketMakerOrSpecialistInSecurity -> "ActingAsMarketMakerOrSpecialistInSecurity"
        | FIX_OrderRestrictions_ActingAsMarketMakerOrSpecialistInUnderlying -> "ActingAsMarketMakerOrSpecialistInUnderlying"
        | FIX_OrderRestrictions_ForeignEntity -> "ForeignEntity"
        | FIX_OrderRestrictions_ExternalMarketParticipant -> "ExternalMarketParticipant"
        | FIX_OrderRestrictions_ExternalInterConnectedMarketLinkage -> "ExternalInterConnectedMarketLinkage"
        | FIX_OrderRestrictions_RisklessArbitrage -> "RisklessArbitrage"
;;

let ownertype_to_string ( d ) =
    match d with
        | FIX_OwnerType_IndividualInvestor -> "IndividualInvestor"
        | FIX_OwnerType_PublicCompany -> "PublicCompany"
        | FIX_OwnerType_PrivateCompany -> "PrivateCompany"
        | FIX_OwnerType_IndividualTrustee -> "IndividualTrustee"
        | FIX_OwnerType_CompanyTrustee -> "CompanyTrustee"
        | FIX_OwnerType_PensionPlan -> "PensionPlan"
        | FIX_OwnerType_CustodianUnderGiftsToMinorsAct -> "CustodianUnderGiftsToMinorsAct"
        | FIX_OwnerType_Trusts -> "Trusts"
        | FIX_OwnerType_Fiduciaries -> "Fiduciaries"
        | FIX_OwnerType_NetworkingSubAccount -> "NetworkingSubAccount"
        | FIX_OwnerType_NonProfitOrganization -> "NonProfitOrganization"
        | FIX_OwnerType_CorporateBody -> "CorporateBody"
        | FIX_OwnerType_Nominee -> "Nominee"
;;

let ownershiptype_to_string ( d ) =
    match d with
        | FIX_OwnershipType_JointInvestors -> "JointInvestors"
        | FIX_OwnershipType_TenantsInCommon -> "TenantsInCommon"
        | FIX_OwnershipType_JointTrustees -> "JointTrustees"
;;

let partyidsource_to_string ( d ) =
    match d with
        | FIX_PartyIDSource_BIC -> "BIC"
        | FIX_PartyIDSource_GeneralIdentifier -> "GeneralIdentifier"
        | FIX_PartyIDSource_Proprietary -> "Proprietary"
        | FIX_PartyIDSource_ISOCountryCode -> "ISOCountryCode"
        | FIX_PartyIDSource_SettlementEntityLocation -> "SettlementEntityLocation"
        | FIX_PartyIDSource_MIC -> "MIC"
        | FIX_PartyIDSource_CSDParticipant -> "CSDParticipant"
        | FIX_PartyIDSource_KoreanInvestorID -> "KoreanInvestorID"
        | FIX_PartyIDSource_TaiwaneseForeignInvestorID -> "TaiwaneseForeignInvestorID"
        | FIX_PartyIDSource_TaiwaneseTradingAcct -> "TaiwaneseTradingAcct"
        | FIX_PartyIDSource_MalaysianCentralDepository -> "MalaysianCentralDepository"
        | FIX_PartyIDSource_ChineseInvestorID -> "ChineseInvestorID"
        | FIX_PartyIDSource_UKNationalInsuranceOrPensionNumber -> "UKNationalInsuranceOrPensionNumber"
        | FIX_PartyIDSource_USSocialSecurityNumber -> "USSocialSecurityNumber"
        | FIX_PartyIDSource_USEmployerOrTaxIDNumber -> "USEmployerOrTaxIDNumber"
        | FIX_PartyIDSource_AustralianBusinessNumber -> "AustralianBusinessNumber"
        | FIX_PartyIDSource_AustralianTaxFileNumber -> "AustralianTaxFileNumber"
        | FIX_PartyIDSource_ISITCAcronym -> "ISITCAcronym"
;;

let partyrole_to_string ( d ) =
    match d with
        | FIX_PartyRole_ExecutingFirm -> "ExecutingFirm"
        | FIX_PartyRole_BrokerOfCredit -> "BrokerOfCredit"
        | FIX_PartyRole_ClientID -> "ClientID"
        | FIX_PartyRole_ClearingFirm -> "ClearingFirm"
        | FIX_PartyRole_InvestorID -> "InvestorID"
        | FIX_PartyRole_IntroducingFirm -> "IntroducingFirm"
        | FIX_PartyRole_EnteringFirm -> "EnteringFirm"
        | FIX_PartyRole_Locate -> "Locate"
        | FIX_PartyRole_FundManagerClientID -> "FundManagerClientID"
        | FIX_PartyRole_SettlementLocation -> "SettlementLocation"
        | FIX_PartyRole_OrderOriginationTrader -> "OrderOriginationTrader"
        | FIX_PartyRole_ExecutingTrader -> "ExecutingTrader"
        | FIX_PartyRole_OrderOriginationFirm -> "OrderOriginationFirm"
        | FIX_PartyRole_GiveupClearingFirm -> "GiveupClearingFirm"
        | FIX_PartyRole_CorrespondantClearingFirm -> "CorrespondantClearingFirm"
        | FIX_PartyRole_ExecutingSystem -> "ExecutingSystem"
        | FIX_PartyRole_ContraFirm -> "ContraFirm"
        | FIX_PartyRole_ContraClearingFirm -> "ContraClearingFirm"
        | FIX_PartyRole_SponsoringFirm -> "SponsoringFirm"
        | FIX_PartyRole_UnderlyingContraFirm -> "UnderlyingContraFirm"
        | FIX_PartyRole_ClearingOrganization -> "ClearingOrganization"
        | FIX_PartyRole_Exchange -> "Exchange"
        | FIX_PartyRole_CustomerAccount -> "CustomerAccount"
        | FIX_PartyRole_CorrespondentClearingOrganization -> "CorrespondentClearingOrganization"
        | FIX_PartyRole_CorrespondentBroker -> "CorrespondentBroker"
        | FIX_PartyRole_Buyer -> "Buyer"
        | FIX_PartyRole_Custodian -> "Custodian"
        | FIX_PartyRole_Intermediary -> "Intermediary"
        | FIX_PartyRole_Agent -> "Agent"
        | FIX_PartyRole_SubCustodian -> "SubCustodian"
        | FIX_PartyRole_Beneficiary -> "Beneficiary"
        | FIX_PartyRole_InterestedParty -> "InterestedParty"
        | FIX_PartyRole_RegulatoryBody -> "RegulatoryBody"
        | FIX_PartyRole_LiquidityProvider -> "LiquidityProvider"
        | FIX_PartyRole_EnteringTrader -> "EnteringTrader"
        | FIX_PartyRole_ContraTrader -> "ContraTrader"
        | FIX_PartyRole_PositionAccount -> "PositionAccount"
;;

let partysubidtype_to_string ( d ) =
    match d with
        | FIX_PartySubIDType_Firm -> "Firm"
        | FIX_PartySubIDType_Person -> "Person"
        | FIX_PartySubIDType_System -> "System"
        | FIX_PartySubIDType_Application -> "Application"
        | FIX_PartySubIDType_FullLegalNameOfFirm -> "FullLegalNameOfFirm"
        | FIX_PartySubIDType_PostalAddress -> "PostalAddress"
        | FIX_PartySubIDType_PhoneNumber -> "PhoneNumber"
        | FIX_PartySubIDType_EmailAddress -> "EmailAddress"
        | FIX_PartySubIDType_ContactName -> "ContactName"
        | FIX_PartySubIDType_SecuritiesAccountNumber -> "SecuritiesAccountNumber"
        | FIX_PartySubIDType_RegistrationNumber -> "RegistrationNumber"
        | FIX_PartySubIDType_RegisteredAddressForConfirmation -> "RegisteredAddressForConfirmation"
        | FIX_PartySubIDType_RegulatoryStatus -> "RegulatoryStatus"
        | FIX_PartySubIDType_RegistrationName -> "RegistrationName"
        | FIX_PartySubIDType_CashAccountNumber -> "CashAccountNumber"
        | FIX_PartySubIDType_BIC -> "BIC"
        | FIX_PartySubIDType_CSDParticipantMemberCode -> "CSDParticipantMemberCode"
        | FIX_PartySubIDType_RegisteredAddress -> "RegisteredAddress"
        | FIX_PartySubIDType_FundAccountName -> "FundAccountName"
        | FIX_PartySubIDType_TelexNumber -> "TelexNumber"
        | FIX_PartySubIDType_FaxNumber -> "FaxNumber"
        | FIX_PartySubIDType_SecuritiesAccountName -> "SecuritiesAccountName"
        | FIX_PartySubIDType_CashAccountName -> "CashAccountName"
        | FIX_PartySubIDType_Department -> "Department"
        | FIX_PartySubIDType_LocationDesk -> "LocationDesk"
        | FIX_PartySubIDType_PositionAccountType -> "PositionAccountType"
;;

let paymentmethod_to_string ( d ) =
    match d with
        | FIX_PaymentMethod_CREST -> "CREST"
        | FIX_PaymentMethod_NSCC -> "NSCC"
        | FIX_PaymentMethod_Euroclear -> "Euroclear"
        | FIX_PaymentMethod_Clearstream -> "Clearstream"
        | FIX_PaymentMethod_Cheque -> "Cheque"
        | FIX_PaymentMethod_TelegraphicTransfer -> "TelegraphicTransfer"
        | FIX_PaymentMethod_FedWire -> "FedWire"
        | FIX_PaymentMethod_DebitCard -> "DebitCard"
        | FIX_PaymentMethod_DirectDebit -> "DirectDebit"
        | FIX_PaymentMethod_DirectCredit -> "DirectCredit"
        | FIX_PaymentMethod_CreditCard -> "CreditCard"
        | FIX_PaymentMethod_ACHDebit -> "ACHDebit"
        | FIX_PaymentMethod_ACHCredit -> "ACHCredit"
        | FIX_PaymentMethod_BPAY -> "BPAY"
        | FIX_PaymentMethod_HighValueClearingSystem -> "HighValueClearingSystem"
;;

let peglimittype_to_string ( d ) =
    match d with
        | FIX_PegLimitType_OrBetter -> "OrBetter"
        | FIX_PegLimitType_Strict -> "Strict"
        | FIX_PegLimitType_OrWorse -> "OrWorse"
;;

let pegmovetype_to_string ( d ) =
    match d with
        | FIX_PegMoveType_Floating -> "Floating"
        | FIX_PegMoveType_Fixed -> "Fixed"
;;

let pegoffsettype_to_string ( d ) =
    match d with
        | FIX_PegOffsetType_Price -> "Price"
        | FIX_PegOffsetType_BasisPoints -> "BasisPoints"
        | FIX_PegOffsetType_Ticks -> "Ticks"
        | FIX_PegOffsetType_PriceTier -> "PriceTier"
;;

let pegrounddirection_to_string ( d ) =
    match d with
        | FIX_PegRoundDirection_MoreAggressive -> "MoreAggressive"
        | FIX_PegRoundDirection_MorePassive -> "MorePassive"
;;

let pegscope_to_string ( d ) =
    match d with
        | FIX_PegScope_Local -> "Local"
        | FIX_PegScope_National -> "National"
        | FIX_PegScope_Global -> "Global"
        | FIX_PegScope_NationalExcludingLocal -> "NationalExcludingLocal"
;;

let posamttype_to_string ( d ) =
    match d with
        | FIX_PosAmtType_FinalMarkToMarketAmount -> "FinalMarkToMarketAmount"
        | FIX_PosAmtType_IncrementalMarkToMarketAmount -> "IncrementalMarkToMarketAmount"
        | FIX_PosAmtType_TradeVariationAmount -> "TradeVariationAmount"
        | FIX_PosAmtType_StartOfDayMarkToMarketAmount -> "StartOfDayMarkToMarketAmount"
        | FIX_PosAmtType_PremiumAmount -> "PremiumAmount"
        | FIX_PosAmtType_CashResidualAmount -> "CashResidualAmount"
        | FIX_PosAmtType_CashAmount -> "CashAmount"
        | FIX_PosAmtType_ValueAdjustedAmount -> "ValueAdjustedAmount"
;;

let posmaintaction_to_string ( d ) =
    match d with
        | FIX_PosMaintAction_New -> "New"
        | FIX_PosMaintAction_Replace -> "Replace"
        | FIX_PosMaintAction_Cancel -> "Cancel"
;;

let posmaintresult_to_string ( d ) =
    match d with
        | FIX_PosMaintResult_SuccessfulCompletion -> "SuccessfulCompletion"
        | FIX_PosMaintResult_Rejected -> "Rejected"
        | FIX_PosMaintResult_Other -> "Other"
;;

let posmaintstatus_to_string ( d ) =
    match d with
        | FIX_PosMaintStatus_Accepted -> "Accepted"
        | FIX_PosMaintStatus_AcceptedWithWarnings -> "AcceptedWithWarnings"
        | FIX_PosMaintStatus_Rejected -> "Rejected"
        | FIX_PosMaintStatus_Completed -> "Completed"
        | FIX_PosMaintStatus_CompletedWithWarnings -> "CompletedWithWarnings"
;;

let posqtystatus_to_string ( d ) =
    match d with
        | FIX_PosQtyStatus_Submitted -> "Submitted"
        | FIX_PosQtyStatus_Accepted -> "Accepted"
        | FIX_PosQtyStatus_Rejected -> "Rejected"
;;

let posreqresult_to_string ( d ) =
    match d with
        | FIX_PosReqResult_ValidRequest -> "ValidRequest"
        | FIX_PosReqResult_InvalidOrUnsupportedRequest -> "InvalidOrUnsupportedRequest"
        | FIX_PosReqResult_NoPositionsFoundThatMatchCriteria -> "NoPositionsFoundThatMatchCriteria"
        | FIX_PosReqResult_NotAuthorizedToRequestPositions -> "NotAuthorizedToRequestPositions"
        | FIX_PosReqResult_RequestForPositionNotSupported -> "RequestForPositionNotSupported"
        | FIX_PosReqResult_Other -> "Other"
;;

let posreqstatus_to_string ( d ) =
    match d with
        | FIX_PosReqStatus_Completed -> "Completed"
        | FIX_PosReqStatus_CompletedWithWarnings -> "CompletedWithWarnings"
        | FIX_PosReqStatus_Rejected -> "Rejected"
;;

let posreqtype_to_string ( d ) =
    match d with
        | FIX_PosReqType_Positions -> "Positions"
        | FIX_PosReqType_Trades -> "Trades"
        | FIX_PosReqType_Exercises -> "Exercises"
        | FIX_PosReqType_Assignments -> "Assignments"
;;

let postranstype_to_string ( d ) =
    match d with
        | FIX_PosTransType_Exercise -> "Exercise"
        | FIX_PosTransType_DoNotExercise -> "DoNotExercise"
        | FIX_PosTransType_PositionAdjustment -> "PositionAdjustment"
        | FIX_PosTransType_PositionChangeSubmission -> "PositionChangeSubmission"
        | FIX_PosTransType_Pledge -> "Pledge"
;;

let postype_to_string ( d ) =
    match d with
        | FIX_PosType_TransactionQuantity -> "TransactionQuantity"
        | FIX_PosType_IntraSpreadQty -> "IntraSpreadQty"
        | FIX_PosType_InterSpreadQty -> "InterSpreadQty"
        | FIX_PosType_EndOfDayQty -> "EndOfDayQty"
        | FIX_PosType_StartOfDayQty -> "StartOfDayQty"
        | FIX_PosType_OptionExerciseQty -> "OptionExerciseQty"
        | FIX_PosType_OptionAssignment -> "OptionAssignment"
        | FIX_PosType_TransactionFromExercise -> "TransactionFromExercise"
        | FIX_PosType_TransactionFromAssignment -> "TransactionFromAssignment"
        | FIX_PosType_PitTradeQty -> "PitTradeQty"
        | FIX_PosType_TransferTradeQty -> "TransferTradeQty"
        | FIX_PosType_ElectronicTradeQty -> "ElectronicTradeQty"
        | FIX_PosType_AllocationTradeQty -> "AllocationTradeQty"
        | FIX_PosType_AdjustmentQty -> "AdjustmentQty"
        | FIX_PosType_AsOfTradeQty -> "AsOfTradeQty"
        | FIX_PosType_DeliveryQty -> "DeliveryQty"
        | FIX_PosType_TotalTransactionQty -> "TotalTransactionQty"
        | FIX_PosType_CrossMarginQty -> "CrossMarginQty"
        | FIX_PosType_IntegralSplit -> "IntegralSplit"
;;

let positioneffect_to_string ( d ) =
    match d with
        | FIX_PositionEffect_Open -> "Open"
        | FIX_PositionEffect_Close -> "Close"
        | FIX_PositionEffect_Rolled -> "Rolled"
        | FIX_PositionEffect_FIFO -> "FIFO"
;;

let possdupflag_to_string ( d ) =
    match d with
        | FIX_PossDupFlag_PossibleDuplicate -> "PossibleDuplicate"
        | FIX_PossDupFlag_OriginalTransmission -> "OriginalTransmission"
;;

let possresend_to_string ( d ) =
    match d with
        | FIX_PossResend_PossibleResend -> "PossibleResend"
        | FIX_PossResend_OriginalTransmission -> "OriginalTransmission"
;;

let preallocmethod_to_string ( d ) =
    match d with
        | FIX_PreallocMethod_ProRata -> "ProRata"
        | FIX_PreallocMethod_DoNotProRata -> "DoNotProRata"
;;

let previouslyreported_to_string ( d ) =
    match d with
        | FIX_PreviouslyReported_PerviouslyReportedToCounterparty -> "PerviouslyReportedToCounterparty"
        | FIX_PreviouslyReported_NotReportedToCounterparty -> "NotReportedToCounterparty"
;;

let pricetype_to_string ( d ) =
    match d with
        | FIX_PriceType_Percentage -> "Percentage"
        | FIX_PriceType_PerUnit -> "PerUnit"
        | FIX_PriceType_FixedAmount -> "FixedAmount"
        | FIX_PriceType_Discount -> "Discount"
        | FIX_PriceType_Premium -> "Premium"
        | FIX_PriceType_Spread -> "Spread"
        | FIX_PriceType_TEDPrice -> "TEDPrice"
        | FIX_PriceType_TEDYield -> "TEDYield"
        | FIX_PriceType_Yield -> "Yield"
        | FIX_PriceType_FixedCabinetTradePrice -> "FixedCabinetTradePrice"
        | FIX_PriceType_VariableCabinetTradePrice -> "VariableCabinetTradePrice"
;;

let priorityindicator_to_string ( d ) =
    match d with
        | FIX_PriorityIndicator_PriorityUnchanged -> "PriorityUnchanged"
        | FIX_PriorityIndicator_LostPriorityAsResultOfOrderChange -> "LostPriorityAsResultOfOrderChange"
;;

let processcode_to_string ( d ) =
    match d with
        | FIX_ProcessCode_Regular -> "Regular"
        | FIX_ProcessCode_SoftDollar -> "SoftDollar"
        | FIX_ProcessCode_StepIn -> "StepIn"
        | FIX_ProcessCode_StepOut -> "StepOut"
        | FIX_ProcessCode_SoftDollarStepIn -> "SoftDollarStepIn"
        | FIX_ProcessCode_SoftDollarStepOut -> "SoftDollarStepOut"
        | FIX_ProcessCode_PlanSponsor -> "PlanSponsor"
;;

let product_to_string ( d ) =
    match d with
        | FIX_Product_AGENCY -> "AGENCY"
        | FIX_Product_COMMODITY -> "COMMODITY"
        | FIX_Product_CORPORATE -> "CORPORATE"
        | FIX_Product_CURRENCY -> "CURRENCY"
        | FIX_Product_EQUITY -> "EQUITY"
        | FIX_Product_GOVERNMENT -> "GOVERNMENT"
        | FIX_Product_INDEX -> "INDEX"
        | FIX_Product_LOAN -> "LOAN"
        | FIX_Product_MONEYMARKET -> "MONEYMARKET"
        | FIX_Product_MORTGAGE -> "MORTGAGE"
        | FIX_Product_MUNICIPAL -> "MUNICIPAL"
        | FIX_Product_OTHER -> "OTHER"
        | FIX_Product_FINANCING -> "FINANCING"
;;

let progrptreqs_to_string ( d ) =
    match d with
        | FIX_ProgRptReqs_BuySideRequests -> "BuySideRequests"
        | FIX_ProgRptReqs_SellSideSends -> "SellSideSends"
        | FIX_ProgRptReqs_RealTimeExecutionReports -> "RealTimeExecutionReports"
;;

let publishtrdindicator_to_string ( d ) =
    match d with
        | FIX_PublishTrdIndicator_ReportTrade -> "ReportTrade"
        | FIX_PublishTrdIndicator_DoNotReportTrade -> "DoNotReportTrade"
;;

let putorcall_to_string ( d ) =
    match d with
        | FIX_PutOrCall_Put -> "Put"
        | FIX_PutOrCall_Call -> "Call"
;;

let qtytype_to_string ( d ) =
    match d with
        | FIX_QtyType_Units -> "Units"
        | FIX_QtyType_Contracts -> "Contracts"
;;

let quotecanceltype_to_string ( d ) =
    match d with
        | FIX_QuoteCancelType_CancelForOneOrMoreSecurities -> "CancelForOneOrMoreSecurities"
        | FIX_QuoteCancelType_CancelForSecurityType -> "CancelForSecurityType"
        | FIX_QuoteCancelType_CancelForUnderlyingSecurity -> "CancelForUnderlyingSecurity"
        | FIX_QuoteCancelType_CancelAllQuotes -> "CancelAllQuotes"
;;

let quotecondition_to_string ( d ) =
    match d with
        | FIX_QuoteCondition_Open -> "Open"
        | FIX_QuoteCondition_Closed -> "Closed"
        | FIX_QuoteCondition_ExchangeBest -> "ExchangeBest"
        | FIX_QuoteCondition_ConsolidatedBest -> "ConsolidatedBest"
        | FIX_QuoteCondition_Locked -> "Locked"
        | FIX_QuoteCondition_Crossed -> "Crossed"
        | FIX_QuoteCondition_Depth -> "Depth"
        | FIX_QuoteCondition_FastTrading -> "FastTrading"
        | FIX_QuoteCondition_NonFirm -> "NonFirm"
;;

let quotepricetype_to_string ( d ) =
    match d with
        | FIX_QuotePriceType_Percent -> "Percent"
        | FIX_QuotePriceType_PerShare -> "PerShare"
        | FIX_QuotePriceType_FixedAmount -> "FixedAmount"
        | FIX_QuotePriceType_Discount -> "Discount"
        | FIX_QuotePriceType_Premium -> "Premium"
        | FIX_QuotePriceType_Spread -> "Spread"
        | FIX_QuotePriceType_TEDPrice -> "TEDPrice"
        | FIX_QuotePriceType_TEDYield -> "TEDYield"
        | FIX_QuotePriceType_YieldSpread -> "YieldSpread"
        | FIX_QuotePriceType_Yield -> "Yield"
;;

let quoterejectreason_to_string ( d ) =
    match d with
        | FIX_QuoteRejectReason_UnknownSymbol -> "UnknownSymbol"
        | FIX_QuoteRejectReason_Exchange -> "Exchange"
        | FIX_QuoteRejectReason_QuoteRequestExceedsLimit -> "QuoteRequestExceedsLimit"
        | FIX_QuoteRejectReason_TooLateToEnter -> "TooLateToEnter"
        | FIX_QuoteRejectReason_UnknownQuote -> "UnknownQuote"
        | FIX_QuoteRejectReason_DuplicateQuote -> "DuplicateQuote"
        | FIX_QuoteRejectReason_InvalidBid -> "InvalidBid"
        | FIX_QuoteRejectReason_InvalidPrice -> "InvalidPrice"
        | FIX_QuoteRejectReason_NotAuthorizedToQuoteSecurity -> "NotAuthorizedToQuoteSecurity"
        | FIX_QuoteRejectReason_Other -> "Other"
;;

let quoterequestrejectreason_to_string ( d ) =
    match d with
        | FIX_QuoteRequestRejectReason_UnknownSymbol -> "UnknownSymbol"
        | FIX_QuoteRequestRejectReason_Exchange -> "Exchange"
        | FIX_QuoteRequestRejectReason_QuoteRequestExceedsLimit -> "QuoteRequestExceedsLimit"
        | FIX_QuoteRequestRejectReason_TooLateToEnter -> "TooLateToEnter"
        | FIX_QuoteRequestRejectReason_InvalidPrice -> "InvalidPrice"
        | FIX_QuoteRequestRejectReason_NotAuthorizedToRequestQuote -> "NotAuthorizedToRequestQuote"
        | FIX_QuoteRequestRejectReason_NoMatchForInquiry -> "NoMatchForInquiry"
        | FIX_QuoteRequestRejectReason_NoMarketForInstrument -> "NoMarketForInstrument"
        | FIX_QuoteRequestRejectReason_NoInventory -> "NoInventory"
        | FIX_QuoteRequestRejectReason_Pass -> "Pass"
        | FIX_QuoteRequestRejectReason_Other -> "Other"
;;

let quoterequesttype_to_string ( d ) =
    match d with
        | FIX_QuoteRequestType_Manual -> "Manual"
        | FIX_QuoteRequestType_Automatic -> "Automatic"
;;

let quoteresptype_to_string ( d ) =
    match d with
        | FIX_QuoteRespType_Hit -> "Hit"
        | FIX_QuoteRespType_Counter -> "Counter"
        | FIX_QuoteRespType_Expired -> "Expired"
        | FIX_QuoteRespType_Cover -> "Cover"
        | FIX_QuoteRespType_DoneAway -> "DoneAway"
        | FIX_QuoteRespType_Pass -> "Pass"
;;

let quoteresponselevel_to_string ( d ) =
    match d with
        | FIX_QuoteResponseLevel_NoAcknowledgement -> "NoAcknowledgement"
        | FIX_QuoteResponseLevel_AcknowledgeOnlyNegativeOrErroneousQuotes -> "AcknowledgeOnlyNegativeOrErroneousQuotes"
        | FIX_QuoteResponseLevel_AcknowledgeEachQuoteMessage -> "AcknowledgeEachQuoteMessage"
;;

let quotestatus_to_string ( d ) =
    match d with
        | FIX_QuoteStatus_Accepted -> "Accepted"
        | FIX_QuoteStatus_CancelForSymbol -> "CancelForSymbol"
        | FIX_QuoteStatus_CanceledForSecurityType -> "CanceledForSecurityType"
        | FIX_QuoteStatus_CanceledForUnderlying -> "CanceledForUnderlying"
        | FIX_QuoteStatus_CanceledAll -> "CanceledAll"
        | FIX_QuoteStatus_Rejected -> "Rejected"
        | FIX_QuoteStatus_RemovedFromMarket -> "RemovedFromMarket"
        | FIX_QuoteStatus_Expired -> "Expired"
        | FIX_QuoteStatus_Query -> "Query"
        | FIX_QuoteStatus_QuoteNotFound -> "QuoteNotFound"
        | FIX_QuoteStatus_Pending -> "Pending"
        | FIX_QuoteStatus_Pass -> "Pass"
        | FIX_QuoteStatus_LockedMarketWarning -> "LockedMarketWarning"
        | FIX_QuoteStatus_CrossMarketWarning -> "CrossMarketWarning"
        | FIX_QuoteStatus_CanceledDueToLockMarket -> "CanceledDueToLockMarket"
        | FIX_QuoteStatus_CanceledDueToCrossMarket -> "CanceledDueToCrossMarket"
;;

let quotetype_to_string ( d ) =
    match d with
        | FIX_QuoteType_Indicative -> "Indicative"
        | FIX_QuoteType_Tradeable -> "Tradeable"
        | FIX_QuoteType_RestrictedTradeable -> "RestrictedTradeable"
        | FIX_QuoteType_Counter -> "Counter"
;;

let registrejreasoncode_to_string ( d ) =
    match d with
        | FIX_RegistRejReasonCode_InvalidAccountType -> "InvalidAccountType"
        | FIX_RegistRejReasonCode_InvalidTaxExemptType -> "InvalidTaxExemptType"
        | FIX_RegistRejReasonCode_InvalidOwnershipType -> "InvalidOwnershipType"
        | FIX_RegistRejReasonCode_NoRegDetails -> "NoRegDetails"
        | FIX_RegistRejReasonCode_InvalidRegSeqNo -> "InvalidRegSeqNo"
        | FIX_RegistRejReasonCode_InvalidRegDetails -> "InvalidRegDetails"
        | FIX_RegistRejReasonCode_InvalidMailingDetails -> "InvalidMailingDetails"
        | FIX_RegistRejReasonCode_InvalidMailingInstructions -> "InvalidMailingInstructions"
        | FIX_RegistRejReasonCode_InvalidInvestorID -> "InvalidInvestorID"
        | FIX_RegistRejReasonCode_InvalidInvestorIDSource -> "InvalidInvestorIDSource"
        | FIX_RegistRejReasonCode_InvalidDateOfBirth -> "InvalidDateOfBirth"
        | FIX_RegistRejReasonCode_InvalidCountry -> "InvalidCountry"
        | FIX_RegistRejReasonCode_InvalidDistribInstns -> "InvalidDistribInstns"
        | FIX_RegistRejReasonCode_InvalidPercentage -> "InvalidPercentage"
        | FIX_RegistRejReasonCode_InvalidPaymentMethod -> "InvalidPaymentMethod"
        | FIX_RegistRejReasonCode_InvalidAccountName -> "InvalidAccountName"
        | FIX_RegistRejReasonCode_InvalidAgentCode -> "InvalidAgentCode"
        | FIX_RegistRejReasonCode_InvalidAccountNum -> "InvalidAccountNum"
        | FIX_RegistRejReasonCode_Other -> "Other"
;;

let registstatus_to_string ( d ) =
    match d with
        | FIX_RegistStatus_Accepted -> "Accepted"
        | FIX_RegistStatus_Rejected -> "Rejected"
        | FIX_RegistStatus_Held -> "Held"
        | FIX_RegistStatus_Reminder -> "Reminder"
;;

let registtranstype_to_string ( d ) =
    match d with
        | FIX_RegistTransType_New -> "New"
        | FIX_RegistTransType_Replace -> "Replace"
        | FIX_RegistTransType_Cancel -> "Cancel"
;;

let reporttoexch_to_string ( d ) =
    match d with
        | FIX_ReportToExch_ReceiverReports -> "ReceiverReports"
        | FIX_ReportToExch_SenderReports -> "SenderReports"
;;

let resetseqnumflag_to_string ( d ) =
    match d with
        | FIX_ResetSeqNumFlag_Yes -> "Yes"
        | FIX_ResetSeqNumFlag_No -> "No"
;;

let responsetransporttype_to_string ( d ) =
    match d with
        | FIX_ResponseTransportType_Inband -> "Inband"
        | FIX_ResponseTransportType_OutOfBand -> "OutOfBand"
;;

let roundingdirection_to_string ( d ) =
    match d with
        | FIX_RoundingDirection_RoundToNearest -> "RoundToNearest"
        | FIX_RoundingDirection_RoundDown -> "RoundDown"
        | FIX_RoundingDirection_RoundUp -> "RoundUp"
;;

let routingtype_to_string ( d ) =
    match d with
        | FIX_RoutingType_TargetFirm -> "TargetFirm"
        | FIX_RoutingType_TargetList -> "TargetList"
        | FIX_RoutingType_BlockFirm -> "BlockFirm"
        | FIX_RoutingType_BlockList -> "BlockList"
;;

let scope_to_string ( d ) =
    match d with
        | FIX_Scope_LocalMarket -> "LocalMarket"
        | FIX_Scope_National -> "National"
        | FIX_Scope_Global -> "Global"
;;

let securityidsource_to_string ( d ) =
    match d with
        | FIX_SecurityIDSource_CUSIP -> "CUSIP"
        | FIX_SecurityIDSource_SEDOL -> "SEDOL"
        | FIX_SecurityIDSource_QUIK -> "QUIK"
        | FIX_SecurityIDSource_ISINNumber -> "ISINNumber"
        | FIX_SecurityIDSource_RICCode -> "RICCode"
        | FIX_SecurityIDSource_ISOCurrencyCode -> "ISOCurrencyCode"
        | FIX_SecurityIDSource_ISOCountryCode -> "ISOCountryCode"
        | FIX_SecurityIDSource_ExchangeSymbol -> "ExchangeSymbol"
        | FIX_SecurityIDSource_ConsolidatedTapeAssociation -> "ConsolidatedTapeAssociation"
        | FIX_SecurityIDSource_BloombergSymbol -> "BloombergSymbol"
        | FIX_SecurityIDSource_Wertpapier -> "Wertpapier"
        | FIX_SecurityIDSource_Dutch -> "Dutch"
        | FIX_SecurityIDSource_Valoren -> "Valoren"
        | FIX_SecurityIDSource_Sicovam -> "Sicovam"
        | FIX_SecurityIDSource_Belgian -> "Belgian"
        | FIX_SecurityIDSource_Common -> "Common"
        | FIX_SecurityIDSource_ClearingHouse -> "ClearingHouse"
        | FIX_SecurityIDSource_ISDAFpMLSpecification -> "ISDAFpMLSpecification"
        | FIX_SecurityIDSource_OptionPriceReportingAuthority -> "OptionPriceReportingAuthority"
;;

let securitylistrequesttype_to_string ( d ) =
    match d with
        | FIX_SecurityListRequestType_Symbol -> "Symbol"
        | FIX_SecurityListRequestType_SecurityTypeAnd -> "SecurityTypeAnd"
        | FIX_SecurityListRequestType_Product -> "Product"
        | FIX_SecurityListRequestType_TradingSessionID -> "TradingSessionID"
        | FIX_SecurityListRequestType_AllSecurities -> "AllSecurities"
;;

let securityrequestresult_to_string ( d ) =
    match d with
        | FIX_SecurityRequestResult_ValidRequest -> "ValidRequest"
        | FIX_SecurityRequestResult_InvalidOrUnsupportedRequest -> "InvalidOrUnsupportedRequest"
        | FIX_SecurityRequestResult_NoInstrumentsFound -> "NoInstrumentsFound"
        | FIX_SecurityRequestResult_NotAuthorizedToRetrieveInstrumentData -> "NotAuthorizedToRetrieveInstrumentData"
        | FIX_SecurityRequestResult_InstrumentDataTemporarilyUnavailable -> "InstrumentDataTemporarilyUnavailable"
        | FIX_SecurityRequestResult_RequestForInstrumentDataNotSupported -> "RequestForInstrumentDataNotSupported"
;;

let securityrequesttype_to_string ( d ) =
    match d with
        | FIX_SecurityRequestType_RequestSecurityIdentityAndSpecifications -> "RequestSecurityIdentityAndSpecifications"
        | FIX_SecurityRequestType_RequestSecurityIdentityForSpecifications -> "RequestSecurityIdentityForSpecifications"
        | FIX_SecurityRequestType_RequestListSecurityTypes -> "RequestListSecurityTypes"
        | FIX_SecurityRequestType_RequestListSecurities -> "RequestListSecurities"
;;

let securityresponsetype_to_string ( d ) =
    match d with
        | FIX_SecurityResponseType_AcceptAsIs -> "AcceptAsIs"
        | FIX_SecurityResponseType_AcceptWithRevisions -> "AcceptWithRevisions"
        | FIX_SecurityResponseType_RejectSecurityProposal -> "RejectSecurityProposal"
        | FIX_SecurityResponseType_CannotMatchSelectionCriteria -> "CannotMatchSelectionCriteria"
;;

let securitytradingstatus_to_string ( d ) =
    match d with
        | FIX_SecurityTradingStatus_OpeningDelay -> "OpeningDelay"
        | FIX_SecurityTradingStatus_TradingHalt -> "TradingHalt"
        | FIX_SecurityTradingStatus_Resume -> "Resume"
        | FIX_SecurityTradingStatus_NoOpen -> "NoOpen"
        | FIX_SecurityTradingStatus_PriceIndication -> "PriceIndication"
        | FIX_SecurityTradingStatus_TradingRangeIndication -> "TradingRangeIndication"
        | FIX_SecurityTradingStatus_MarketImbalanceBuy -> "MarketImbalanceBuy"
        | FIX_SecurityTradingStatus_MarketImbalanceSell -> "MarketImbalanceSell"
        | FIX_SecurityTradingStatus_MarketOnCloseImbalanceBuy -> "MarketOnCloseImbalanceBuy"
        | FIX_SecurityTradingStatus_MarketOnCloseImbalanceSell -> "MarketOnCloseImbalanceSell"
        | FIX_SecurityTradingStatus_NoMarketImbalance -> "NoMarketImbalance"
        | FIX_SecurityTradingStatus_NoMarketOnCloseImbalance -> "NoMarketOnCloseImbalance"
        | FIX_SecurityTradingStatus_ITSPreOpening -> "ITSPreOpening"
        | FIX_SecurityTradingStatus_NewPriceIndication -> "NewPriceIndication"
        | FIX_SecurityTradingStatus_TradeDisseminationTime -> "TradeDisseminationTime"
        | FIX_SecurityTradingStatus_ReadyToTrade -> "ReadyToTrade"
        | FIX_SecurityTradingStatus_NotAvailableForTrading -> "NotAvailableForTrading"
        | FIX_SecurityTradingStatus_NotTradedOnThisMarket -> "NotTradedOnThisMarket"
        | FIX_SecurityTradingStatus_UnknownOrInvalid -> "UnknownOrInvalid"
        | FIX_SecurityTradingStatus_PreOpen -> "PreOpen"
        | FIX_SecurityTradingStatus_OpeningRotation -> "OpeningRotation"
        | FIX_SecurityTradingStatus_FastMarket -> "FastMarket"
;;

let securitytype_to_string ( d ) =
    match d with
        | FIX_SecurityType_Future -> "Future"
        | FIX_SecurityType_Option -> "Option"
        | FIX_SecurityType_EuroSupranationalCoupons -> "EuroSupranationalCoupons"
        | FIX_SecurityType_FederalAgencyCoupon -> "FederalAgencyCoupon"
        | FIX_SecurityType_FederalAgencyDiscountNote -> "FederalAgencyDiscountNote"
        | FIX_SecurityType_PrivateExportFunding -> "PrivateExportFunding"
        | FIX_SecurityType_USDSupranationalCoupons -> "USDSupranationalCoupons"
        | FIX_SecurityType_CorporateBond -> "CorporateBond"
        | FIX_SecurityType_CorporatePrivatePlacement -> "CorporatePrivatePlacement"
        | FIX_SecurityType_ConvertibleBond -> "ConvertibleBond"
        | FIX_SecurityType_DualCurrency -> "DualCurrency"
        | FIX_SecurityType_EuroCorporateBond -> "EuroCorporateBond"
        | FIX_SecurityType_IndexedLinked -> "IndexedLinked"
        | FIX_SecurityType_StructuredNotes -> "StructuredNotes"
        | FIX_SecurityType_YankeeCorporateBond -> "YankeeCorporateBond"
        | FIX_SecurityType_ForeignExchangeContract -> "ForeignExchangeContract"
        | FIX_SecurityType_CommonStock -> "CommonStock"
        | FIX_SecurityType_PreferredStock -> "PreferredStock"
        | FIX_SecurityType_BradyBond -> "BradyBond"
        | FIX_SecurityType_EuroSovereigns -> "EuroSovereigns"
        | FIX_SecurityType_USTreasuryBond -> "USTreasuryBond"
        | FIX_SecurityType_InterestStripFromAnyBondOrNote -> "InterestStripFromAnyBondOrNote"
        | FIX_SecurityType_TreasuryInflationProtectedSecurities -> "TreasuryInflationProtectedSecurities"
        | FIX_SecurityType_PrincipalStripOfACallableBondOrNote -> "PrincipalStripOfACallableBondOrNote"
        | FIX_SecurityType_PrincipalStripFromANonCallableBondOrNote -> "PrincipalStripFromANonCallableBondOrNote"
        | FIX_SecurityType_USTreasuryNoteOld -> "USTreasuryNoteOld"
        | FIX_SecurityType_USTreasuryBillOld -> "USTreasuryBillOld"
        | FIX_SecurityType_USTreasuryNote -> "USTreasuryNote"
        | FIX_SecurityType_USTreasuryBill -> "USTreasuryBill"
        | FIX_SecurityType_Repurchase -> "Repurchase"
        | FIX_SecurityType_Forward -> "Forward"
        | FIX_SecurityType_BuySellback -> "BuySellback"
        | FIX_SecurityType_SecuritiesLoan -> "SecuritiesLoan"
        | FIX_SecurityType_SecuritiesPledge -> "SecuritiesPledge"
        | FIX_SecurityType_TermLoan -> "TermLoan"
        | FIX_SecurityType_RevolverLoan -> "RevolverLoan"
        | FIX_SecurityType_Revolver -> "Revolver"
        | FIX_SecurityType_BridgeLoan -> "BridgeLoan"
        | FIX_SecurityType_LetterOfCredit -> "LetterOfCredit"
        | FIX_SecurityType_SwingLineFacility -> "SwingLineFacility"
        | FIX_SecurityType_DebtorInPossession -> "DebtorInPossession"
        | FIX_SecurityType_Defaulted -> "Defaulted"
        | FIX_SecurityType_Withdrawn -> "Withdrawn"
        | FIX_SecurityType_Replaced -> "Replaced"
        | FIX_SecurityType_Matured -> "Matured"
        | FIX_SecurityType_Amended -> "Amended"
        | FIX_SecurityType_Retired -> "Retired"
        | FIX_SecurityType_BankersAcceptance -> "BankersAcceptance"
        | FIX_SecurityType_BankNotes -> "BankNotes"
        | FIX_SecurityType_BillOfExchanges -> "BillOfExchanges"
        | FIX_SecurityType_CertificateOfDeposit -> "CertificateOfDeposit"
        | FIX_SecurityType_CallLoans -> "CallLoans"
        | FIX_SecurityType_CommercialPaper -> "CommercialPaper"
        | FIX_SecurityType_DepositNotes -> "DepositNotes"
        | FIX_SecurityType_EuroCertificateOfDeposit -> "EuroCertificateOfDeposit"
        | FIX_SecurityType_EuroCommercialPaper -> "EuroCommercialPaper"
        | FIX_SecurityType_LiquidityNote -> "LiquidityNote"
        | FIX_SecurityType_MediumTermNotes -> "MediumTermNotes"
        | FIX_SecurityType_Overnight -> "Overnight"
        | FIX_SecurityType_PromissoryNote -> "PromissoryNote"
        | FIX_SecurityType_PlazosFijos -> "PlazosFijos"
        | FIX_SecurityType_ShortTermLoanNote -> "ShortTermLoanNote"
        | FIX_SecurityType_TimeDeposit -> "TimeDeposit"
        | FIX_SecurityType_ExtendedCommNote -> "ExtendedCommNote"
        | FIX_SecurityType_YankeeCertificateOfDeposit -> "YankeeCertificateOfDeposit"
        | FIX_SecurityType_AssetBackedSecurities -> "AssetBackedSecurities"
        | FIX_SecurityType_Corp -> "Corp"
        | FIX_SecurityType_CollateralizedMortgageObligation -> "CollateralizedMortgageObligation"
        | FIX_SecurityType_IOETTEMortgage -> "IOETTEMortgage"
        | FIX_SecurityType_MortgageBackedSecurities -> "MortgageBackedSecurities"
        | FIX_SecurityType_MortgageInterestOnly -> "MortgageInterestOnly"
        | FIX_SecurityType_MortgagePrincipalOnly -> "MortgagePrincipalOnly"
        | FIX_SecurityType_MortgagePrivatePlacement -> "MortgagePrivatePlacement"
        | FIX_SecurityType_MiscellaneousPassThrough -> "MiscellaneousPassThrough"
        | FIX_SecurityType_Pfandbriefe -> "Pfandbriefe"
        | FIX_SecurityType_ToBeAnnounced -> "ToBeAnnounced"
        | FIX_SecurityType_OtherAnticipationNotes -> "OtherAnticipationNotes"
        | FIX_SecurityType_CertificateOfObligation -> "CertificateOfObligation"
        | FIX_SecurityType_CertificateOfParticipation -> "CertificateOfParticipation"
        | FIX_SecurityType_GeneralObligationBonds -> "GeneralObligationBonds"
        | FIX_SecurityType_MandatoryTender -> "MandatoryTender"
        | FIX_SecurityType_RevenueAnticipationNote -> "RevenueAnticipationNote"
        | FIX_SecurityType_RevenueBonds -> "RevenueBonds"
        | FIX_SecurityType_SpecialAssessment -> "SpecialAssessment"
        | FIX_SecurityType_SpecialObligation -> "SpecialObligation"
        | FIX_SecurityType_SpecialTax -> "SpecialTax"
        | FIX_SecurityType_TaxAnticipationNote -> "TaxAnticipationNote"
        | FIX_SecurityType_TaxAllocation -> "TaxAllocation"
        | FIX_SecurityType_TaxExemptCommercialPaper -> "TaxExemptCommercialPaper"
        | FIX_SecurityType_TaxRevenueAnticipationNote -> "TaxRevenueAnticipationNote"
        | FIX_SecurityType_VariableRateDemandNote -> "VariableRateDemandNote"
        | FIX_SecurityType_Warrant -> "Warrant"
        | FIX_SecurityType_MutualFund -> "MutualFund"
        | FIX_SecurityType_MultilegInstrument -> "MultilegInstrument"
        | FIX_SecurityType_NoSecurityType -> "NoSecurityType"
;;

let sessionrejectreason_to_string ( d ) =
    match d with
        | FIX_SessionRejectReason_InvalidTagNumber -> "InvalidTagNumber"
        | FIX_SessionRejectReason_RequiredTagMissing -> "RequiredTagMissing"
        | FIX_SessionRejectReason_TagNotDefinedForThisMessageType -> "TagNotDefinedForThisMessageType"
        | FIX_SessionRejectReason_UndefinedTag -> "UndefinedTag"
        | FIX_SessionRejectReason_TagSpecifiedWithoutAValue -> "TagSpecifiedWithoutAValue"
        | FIX_SessionRejectReason_ValueIsIncorrect -> "ValueIsIncorrect"
        | FIX_SessionRejectReason_IncorrectDataFormatForValue -> "IncorrectDataFormatForValue"
        | FIX_SessionRejectReason_DecryptionProblem -> "DecryptionProblem"
        | FIX_SessionRejectReason_SignatureProblem -> "SignatureProblem"
        | FIX_SessionRejectReason_CompIDProblem -> "CompIDProblem"
        | FIX_SessionRejectReason_SendingTimeAccuracyProblem -> "SendingTimeAccuracyProblem"
        | FIX_SessionRejectReason_InvalidMsgType -> "InvalidMsgType"
        | FIX_SessionRejectReason_XMLValidationError -> "XMLValidationError"
        | FIX_SessionRejectReason_TagAppearsMoreThanOnce -> "TagAppearsMoreThanOnce"
        | FIX_SessionRejectReason_TagSpecifiedOutOfRequiredOrder -> "TagSpecifiedOutOfRequiredOrder"
        | FIX_SessionRejectReason_RepeatingGroupFieldsOutOfOrder -> "RepeatingGroupFieldsOutOfOrder"
        | FIX_SessionRejectReason_IncorrectNumInGroupCountForRepeatingGroup -> "IncorrectNumInGroupCountForRepeatingGroup"
        | FIX_SessionRejectReason_Non -> "Non"
        | FIX_SessionRejectReason_Other -> "Other"
;;

let settlcurrfxratecalc_to_string ( d ) =
    match d with
        | FIX_SettlCurrFxRateCalc_Multiply -> "Multiply"
        | FIX_SettlCurrFxRateCalc_Divide -> "Divide"
;;

let settldeliverytype_to_string ( d ) =
    match d with
        | FIX_SettlDeliveryType_Versus -> "Versus"
        | FIX_SettlDeliveryType_Free -> "Free"
        | FIX_SettlDeliveryType_TriParty -> "TriParty"
        | FIX_SettlDeliveryType_HoldInCustody -> "HoldInCustody"
;;

let settlinstmode_to_string ( d ) =
    match d with
        | FIX_SettlInstMode_StandingInstructionsProvided -> "StandingInstructionsProvided"
        | FIX_SettlInstMode_SpecificOrderForASingleAccount -> "SpecificOrderForASingleAccount"
        | FIX_SettlInstMode_RequestReject -> "RequestReject"
;;

let settlinstreqrejcode_to_string ( d ) =
    match d with
        | FIX_SettlInstReqRejCode_UnableToProcessRequest -> "UnableToProcessRequest"
        | FIX_SettlInstReqRejCode_UnknownAccount -> "UnknownAccount"
        | FIX_SettlInstReqRejCode_NoMatchingSettlementInstructionsFound -> "NoMatchingSettlementInstructionsFound"
        | FIX_SettlInstReqRejCode_Other -> "Other"
;;

let settlinstsource_to_string ( d ) =
    match d with
        | FIX_SettlInstSource_BrokerCredit -> "BrokerCredit"
        | FIX_SettlInstSource_Institution -> "Institution"
        | FIX_SettlInstSource_Investor -> "Investor"
;;

let settlinsttranstype_to_string ( d ) =
    match d with
        | FIX_SettlInstTransType_New -> "New"
        | FIX_SettlInstTransType_Cancel -> "Cancel"
        | FIX_SettlInstTransType_Replace -> "Replace"
        | FIX_SettlInstTransType_Restate -> "Restate"
;;

let settlpricetype_to_string ( d ) =
    match d with
        | FIX_SettlPriceType_Final -> "Final"
        | FIX_SettlPriceType_Theoretical -> "Theoretical"
;;

let settlsessid_to_string ( d ) =
    match d with
        | FIX_SettlSessID_Intraday -> "Intraday"
        | FIX_SettlSessID_RegularTradingHours -> "RegularTradingHours"
        | FIX_SettlSessID_ElectronicTradingHours -> "ElectronicTradingHours"
;;

let settltype_to_string ( d ) =
    match d with
        | FIX_SettlType_Regular -> "Regular"
        | FIX_SettlType_Cash -> "Cash"
        | FIX_SettlType_NextDay -> "NextDay"
        | FIX_SettlType_TPlus2 -> "TPlus2"
        | FIX_SettlType_TPlus3 -> "TPlus3"
        | FIX_SettlType_TPlus4 -> "TPlus4"
        | FIX_SettlType_Future -> "Future"
        | FIX_SettlType_WhenAndIfIssued -> "WhenAndIfIssued"
        | FIX_SettlType_SellersOption -> "SellersOption"
        | FIX_SettlType_TPlus5 -> "TPlus5"
;;

let shortsalereason_to_string ( d ) =
    match d with
        | FIX_ShortSaleReason_DealerSoldShort -> "DealerSoldShort"
        | FIX_ShortSaleReason_DealerSoldShortExempt -> "DealerSoldShortExempt"
        | FIX_ShortSaleReason_SellingCustomerSoldShort -> "SellingCustomerSoldShort"
        | FIX_ShortSaleReason_SellingCustomerSoldShortExempt -> "SellingCustomerSoldShortExempt"
        | FIX_ShortSaleReason_QualifiedServiceRepresentative -> "QualifiedServiceRepresentative"
        | FIX_ShortSaleReason_QSROrAGUContraSideSoldShortExempt -> "QSROrAGUContraSideSoldShortExempt"
;;

let side_to_string ( d ) =
    match d with
        | FIX_Side_Buy -> "Buy"
        | FIX_Side_Sell -> "Sell"
        | FIX_Side_BuyMinus -> "BuyMinus"
        | FIX_Side_SellPlus -> "SellPlus"
        | FIX_Side_SellShort -> "SellShort"
        | FIX_Side_SellShortExempt -> "SellShortExempt"
        | FIX_Side_Undisclosed -> "Undisclosed"
        | FIX_Side_Cross -> "Cross"
        | FIX_Side_CrossShort -> "CrossShort"
        | FIX_Side_CrossShortExempt -> "CrossShortExempt"
        | FIX_Side_AsDefined -> "AsDefined"
        | FIX_Side_Opposite -> "Opposite"
        | FIX_Side_Subscribe -> "Subscribe"
        | FIX_Side_Redeem -> "Redeem"
        | FIX_Side_Lend -> "Lend"
        | FIX_Side_Borrow -> "Borrow"
;;

let sidemultilegreportingtype_to_string ( d ) =
    match d with
        | FIX_SideMultiLegReportingType_SingleSecurity -> "SingleSecurity"
        | FIX_SideMultiLegReportingType_IndividualLegOfAMultilegSecurity -> "IndividualLegOfAMultilegSecurity"
        | FIX_SideMultiLegReportingType_MultilegSecurity -> "MultilegSecurity"
;;

let sidevalueind_to_string ( d ) =
    match d with
        | FIX_SideValueInd_SideValue1 -> "SideValue1"
        | FIX_SideValueInd_SideValue2 -> "SideValue2"
;;

let solicitedflag_to_string ( d ) =
    match d with
        | FIX_SolicitedFlag_WasSolicited -> "WasSolicited"
        | FIX_SolicitedFlag_WasNotSolicited -> "WasNotSolicited"
;;

let standinstdbtype_to_string ( d ) =
    match d with
        | FIX_StandInstDbType_Other -> "Other"
        | FIX_StandInstDbType_DTCSID -> "DTCSID"
        | FIX_StandInstDbType_ThomsonALERT -> "ThomsonALERT"
        | FIX_StandInstDbType_AGlobalCustodian -> "AGlobalCustodian"
        | FIX_StandInstDbType_AccountNet -> "AccountNet"
;;

let statusvalue_to_string ( d ) =
    match d with
        | FIX_StatusValue_Connected -> "Connected"
        | FIX_StatusValue_NotConnectedUnexpected -> "NotConnectedUnexpected"
        | FIX_StatusValue_NotConnectedExpected -> "NotConnectedExpected"
        | FIX_StatusValue_InProcess -> "InProcess"
;;

let stipulationtype_to_string ( d ) =
    match d with
        | FIX_StipulationType_AlternativeMinimumTax -> "AlternativeMinimumTax"
        | FIX_StipulationType_AutoReinvestment -> "AutoReinvestment"
        | FIX_StipulationType_BankQualified -> "BankQualified"
        | FIX_StipulationType_BargainConditions -> "BargainConditions"
        | FIX_StipulationType_CouponRange -> "CouponRange"
        | FIX_StipulationType_ISOCurrencyCode -> "ISOCurrencyCode"
        | FIX_StipulationType_CustomStart -> "CustomStart"
        | FIX_StipulationType_Geographics -> "Geographics"
        | FIX_StipulationType_ValuationDiscount -> "ValuationDiscount"
        | FIX_StipulationType_Insured -> "Insured"
        | FIX_StipulationType_IssueDate -> "IssueDate"
        | FIX_StipulationType_Issuer -> "Issuer"
        | FIX_StipulationType_IssueSizeRange -> "IssueSizeRange"
        | FIX_StipulationType_LookbackDays -> "LookbackDays"
        | FIX_StipulationType_ExplicitLotIdentifier -> "ExplicitLotIdentifier"
        | FIX_StipulationType_LotVariance -> "LotVariance"
        | FIX_StipulationType_MaturityYearAndMonth -> "MaturityYearAndMonth"
        | FIX_StipulationType_MaturityRange -> "MaturityRange"
        | FIX_StipulationType_MaximumSubstitutions -> "MaximumSubstitutions"
        | FIX_StipulationType_MinimumQuantity -> "MinimumQuantity"
        | FIX_StipulationType_MinimumIncrement -> "MinimumIncrement"
        | FIX_StipulationType_MinimumDenomination -> "MinimumDenomination"
        | FIX_StipulationType_PaymentFrequency -> "PaymentFrequency"
        | FIX_StipulationType_NumberOfPieces -> "NumberOfPieces"
        | FIX_StipulationType_PoolsMaximum -> "PoolsMaximum"
        | FIX_StipulationType_PoolsPerMillion -> "PoolsPerMillion"
        | FIX_StipulationType_PoolsPerLot -> "PoolsPerLot"
        | FIX_StipulationType_PoolsPerTrade -> "PoolsPerTrade"
        | FIX_StipulationType_PriceRange -> "PriceRange"
        | FIX_StipulationType_PricingFrequency -> "PricingFrequency"
        | FIX_StipulationType_ProductionYear -> "ProductionYear"
        | FIX_StipulationType_CallProtection -> "CallProtection"
        | FIX_StipulationType_Purpose -> "Purpose"
        | FIX_StipulationType_BenchmarkPriceSource -> "BenchmarkPriceSource"
        | FIX_StipulationType_RatingSourceAndRange -> "RatingSourceAndRange"
        | FIX_StipulationType_TypeOfRedemption -> "TypeOfRedemption"
        | FIX_StipulationType_Restricted -> "Restricted"
        | FIX_StipulationType_MarketSector -> "MarketSector"
        | FIX_StipulationType_SecurityTypeIncludedOrExcluded -> "SecurityTypeIncludedOrExcluded"
        | FIX_StipulationType_Structure -> "Structure"
        | FIX_StipulationType_SubstitutionsFrequency -> "SubstitutionsFrequency"
        | FIX_StipulationType_SubstitutionsLeft -> "SubstitutionsLeft"
        | FIX_StipulationType_FreeformText -> "FreeformText"
        | FIX_StipulationType_TradeVariance -> "TradeVariance"
        | FIX_StipulationType_WeightedAverageCoupon -> "WeightedAverageCoupon"
        | FIX_StipulationType_WeightedAverageLifeCoupon -> "WeightedAverageLifeCoupon"
        | FIX_StipulationType_WeightedAverageLoanAge -> "WeightedAverageLoanAge"
        | FIX_StipulationType_WeightedAverageMaturity -> "WeightedAverageMaturity"
        | FIX_StipulationType_WholePool -> "WholePool"
        | FIX_StipulationType_YieldRange -> "YieldRange"
;;

let subscriptionrequesttype_to_string ( d ) =
    match d with
        | FIX_SubscriptionRequestType_Snapshot -> "Snapshot"
        | FIX_SubscriptionRequestType_SnapshotAndUpdates -> "SnapshotAndUpdates"
        | FIX_SubscriptionRequestType_DisablePreviousSnapshot -> "DisablePreviousSnapshot"
;;

let targetstrategy_to_string ( d ) =
    match d with
        | FIX_TargetStrategy_VWAP -> "VWAP"
        | FIX_TargetStrategy_Participate -> "Participate"
        | FIX_TargetStrategy_MininizeMarketImpact -> "MininizeMarketImpact"
;;

let taxadvantagetype_to_string ( d ) =
    match d with
        | FIX_TaxAdvantageType_Unknown -> "Unknown"
        | FIX_TaxAdvantageType_MaxiISA -> "MaxiISA"
        | FIX_TaxAdvantageType_TESSA -> "TESSA"
        | FIX_TaxAdvantageType_MiniCashISA -> "MiniCashISA"
        | FIX_TaxAdvantageType_MiniStocksAndSharesISA -> "MiniStocksAndSharesISA"
        | FIX_TaxAdvantageType_MiniInsuranceISA -> "MiniInsuranceISA"
        | FIX_TaxAdvantageType_CurrentYearPayment -> "CurrentYearPayment"
        | FIX_TaxAdvantageType_PriorYearPayment -> "PriorYearPayment"
        | FIX_TaxAdvantageType_AssetTransfer -> "AssetTransfer"
        | FIX_TaxAdvantageType_EmployeePriorYear -> "EmployeePriorYear"
        | FIX_TaxAdvantageType_EmployeeCurrentYear -> "EmployeeCurrentYear"
        | FIX_TaxAdvantageType_EmployerPriorYear -> "EmployerPriorYear"
        | FIX_TaxAdvantageType_EmployerCurrentYear -> "EmployerCurrentYear"
        | FIX_TaxAdvantageType_NonFundPrototypeIRA -> "NonFundPrototypeIRA"
        | FIX_TaxAdvantageType_NonFundQualifiedPlan -> "NonFundQualifiedPlan"
        | FIX_TaxAdvantageType_DefinedContributionPlan -> "DefinedContributionPlan"
        | FIX_TaxAdvantageType_IRA -> "IRA"
        | FIX_TaxAdvantageType_IRARollover -> "IRARollover"
        | FIX_TaxAdvantageType_KEOGH -> "KEOGH"
        | FIX_TaxAdvantageType_ProfitSharingPlan -> "ProfitSharingPlan"
        | FIX_TaxAdvantageType_US401K -> "US401K"
        | FIX_TaxAdvantageType_SelfDirectedIRA -> "SelfDirectedIRA"
        | FIX_TaxAdvantageType_US403b -> "US403b"
        | FIX_TaxAdvantageType_US457 -> "US457"
        | FIX_TaxAdvantageType_RothIRAPrototype -> "RothIRAPrototype"
        | FIX_TaxAdvantageType_RothIRANonPrototype -> "RothIRANonPrototype"
        | FIX_TaxAdvantageType_RothConversionIRAPrototype -> "RothConversionIRAPrototype"
        | FIX_TaxAdvantageType_RothConversionIRANonPrototype -> "RothConversionIRANonPrototype"
        | FIX_TaxAdvantageType_EducationIRAPrototype -> "EducationIRAPrototype"
        | FIX_TaxAdvantageType_EducationIRANonPrototype -> "EducationIRANonPrototype"
;;

let terminationtype_to_string ( d ) =
    match d with
        | FIX_TerminationType_Overnight -> "Overnight"
        | FIX_TerminationType_Term -> "Term"
        | FIX_TerminationType_Flexible -> "Flexible"
        | FIX_TerminationType_Open -> "Open"
;;

let testmessageindicator_to_string ( d ) =
    match d with
        | FIX_TestMessageIndicator_True -> "True"
        | FIX_TestMessageIndicator_Fales -> "Fales"
;;

let tickdirection_to_string ( d ) =
    match d with
        | FIX_TickDirection_PlusTick -> "PlusTick"
        | FIX_TickDirection_ZeroPlusTick -> "ZeroPlusTick"
        | FIX_TickDirection_MinusTick -> "MinusTick"
        | FIX_TickDirection_ZeroMinusTick -> "ZeroMinusTick"
;;

let timeinforce_to_string ( d ) =
    match d with
        | FIX_TimeInForce_Day -> "Day"
        | FIX_TimeInForce_GoodTillCancel -> "GoodTillCancel"
        | FIX_TimeInForce_AtTheOpening -> "AtTheOpening"
        | FIX_TimeInForce_ImmediateOrCancel -> "ImmediateOrCancel"
        | FIX_TimeInForce_FillOrKill -> "FillOrKill"
        | FIX_TimeInForce_GoodTillCrossing -> "GoodTillCrossing"
        | FIX_TimeInForce_GoodTillDate -> "GoodTillDate"
        | FIX_TimeInForce_AtTheClose -> "AtTheClose"
;;

let tradsesmethod_to_string ( d ) =
    match d with
        | FIX_TradSesMethod_Electronic -> "Electronic"
        | FIX_TradSesMethod_OpenOutcry -> "OpenOutcry"
        | FIX_TradSesMethod_TwoParty -> "TwoParty"
;;

let tradsesmode_to_string ( d ) =
    match d with
        | FIX_TradSesMode_Testing -> "Testing"
        | FIX_TradSesMode_Simulated -> "Simulated"
        | FIX_TradSesMode_Production -> "Production"
;;

let tradsesstatus_to_string ( d ) =
    match d with
        | FIX_TradSesStatus_Unknown -> "Unknown"
        | FIX_TradSesStatus_Halted -> "Halted"
        | FIX_TradSesStatus_Open -> "Open"
        | FIX_TradSesStatus_Closed -> "Closed"
        | FIX_TradSesStatus_PreOpen -> "PreOpen"
        | FIX_TradSesStatus_PreClose -> "PreClose"
        | FIX_TradSesStatus_RequestRejected -> "RequestRejected"
;;

let tradsesstatusrejreason_to_string ( d ) =
    match d with
        | FIX_TradSesStatusRejReason_UnknownOrInvalidTradingSessionID -> "UnknownOrInvalidTradingSessionID"
        | FIX_TradSesStatusRejReason_Other -> "Other"
;;

let tradeallocindicator_to_string ( d ) =
    match d with
        | FIX_TradeAllocIndicator_AllocationNotRequired -> "AllocationNotRequired"
        | FIX_TradeAllocIndicator_AllocationRequired -> "AllocationRequired"
        | FIX_TradeAllocIndicator_UseAllocationProvidedWithTheTrade -> "UseAllocationProvidedWithTheTrade"
;;

let tradecondition_to_string ( d ) =
    match d with
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
        | FIX_TradeCondition_ImbalanceMoreBuyers -> "ImbalanceMoreBuyers"
        | FIX_TradeCondition_ImbalanceMoreSellers -> "ImbalanceMoreSellers"
        | FIX_TradeCondition_OpeningPrice -> "OpeningPrice"
;;

let tradereportrejectreason_to_string ( d ) =
    match d with
        | FIX_TradeReportRejectReason_Successful -> "Successful"
        | FIX_TradeReportRejectReason_InvalidPartyOnformation -> "InvalidPartyOnformation"
        | FIX_TradeReportRejectReason_UnknownInstrument -> "UnknownInstrument"
        | FIX_TradeReportRejectReason_UnauthorizedToReportTrades -> "UnauthorizedToReportTrades"
        | FIX_TradeReportRejectReason_InvalidTradeType -> "InvalidTradeType"
        | FIX_TradeReportRejectReason_Other -> "Other"
;;

let tradereporttype_to_string ( d ) =
    match d with
        | FIX_TradeReportType_Submit -> "Submit"
        | FIX_TradeReportType_Alleged -> "Alleged"
        | FIX_TradeReportType_Accept -> "Accept"
        | FIX_TradeReportType_Decline -> "Decline"
        | FIX_TradeReportType_Addendum -> "Addendum"
        | FIX_TradeReportType_No -> "No"
        | FIX_TradeReportType_TradeReportCancel -> "TradeReportCancel"
        | FIX_TradeReportType_LockedIn -> "LockedIn"
;;

let traderequestresult_to_string ( d ) =
    match d with
        | FIX_TradeRequestResult_Successful -> "Successful"
        | FIX_TradeRequestResult_InvalidOrUnknownInstrument -> "InvalidOrUnknownInstrument"
        | FIX_TradeRequestResult_InvalidTypeOfTradeRequested -> "InvalidTypeOfTradeRequested"
        | FIX_TradeRequestResult_InvalidParties -> "InvalidParties"
        | FIX_TradeRequestResult_InvalidTransportTypeRequested -> "InvalidTransportTypeRequested"
        | FIX_TradeRequestResult_InvalidDestinationRequested -> "InvalidDestinationRequested"
        | FIX_TradeRequestResult_TradeRequestTypeNotSupported -> "TradeRequestTypeNotSupported"
        | FIX_TradeRequestResult_NotAuthorized -> "NotAuthorized"
        | FIX_TradeRequestResult_Other -> "Other"
;;

let traderequeststatus_to_string ( d ) =
    match d with
        | FIX_TradeRequestStatus_Accepted -> "Accepted"
        | FIX_TradeRequestStatus_Completed -> "Completed"
        | FIX_TradeRequestStatus_Rejected -> "Rejected"
;;

let traderequesttype_to_string ( d ) =
    match d with
        | FIX_TradeRequestType_AllTrades -> "AllTrades"
        | FIX_TradeRequestType_MatchedTradesMatchingCriteria -> "MatchedTradesMatchingCriteria"
        | FIX_TradeRequestType_UnmatchedTradesThatMatchCriteria -> "UnmatchedTradesThatMatchCriteria"
        | FIX_TradeRequestType_UnreportedTradesThatMatchCriteria -> "UnreportedTradesThatMatchCriteria"
        | FIX_TradeRequestType_AdvisoriesThatMatchCriteria -> "AdvisoriesThatMatchCriteria"
;;

let tradedflatswitch_to_string ( d ) =
    match d with
        | FIX_TradedFlatSwitch_TradedFlat -> "TradedFlat"
        | FIX_TradedFlatSwitch_NotTradedFlat -> "NotTradedFlat"
;;

let trdregtimestamptype_to_string ( d ) =
    match d with
        | FIX_TrdRegTimestampType_ExecutionTime -> "ExecutionTime"
        | FIX_TrdRegTimestampType_TimeIn -> "TimeIn"
        | FIX_TrdRegTimestampType_TimeOut -> "TimeOut"
        | FIX_TrdRegTimestampType_BrokerReceipt -> "BrokerReceipt"
        | FIX_TrdRegTimestampType_BrokerExecution -> "BrokerExecution"
;;

let trdrptstatus_to_string ( d ) =
    match d with
        | FIX_TrdRptStatus_Accepted -> "Accepted"
        | FIX_TrdRptStatus_Rejected -> "Rejected"
;;

let trdtype_to_string ( d ) =
    match d with
        | FIX_TrdType_RegularTrade -> "RegularTrade"
        | FIX_TrdType_BlockTrade -> "BlockTrade"
        | FIX_TrdType_EFP -> "EFP"
        | FIX_TrdType_Transfer -> "Transfer"
        | FIX_TrdType_LateTrade -> "LateTrade"
        | FIX_TrdType_TTrade -> "TTrade"
        | FIX_TrdType_WeightedAveragePriceTrade -> "WeightedAveragePriceTrade"
        | FIX_TrdType_BunchedTrade -> "BunchedTrade"
        | FIX_TrdType_LateBunchedTrade -> "LateBunchedTrade"
        | FIX_TrdType_PriorReferencePriceTrade -> "PriorReferencePriceTrade"
        | FIX_TrdType_AfterHoursTrade -> "AfterHoursTrade"
;;

let unsolicitedindicator_to_string ( d ) =
    match d with
        | FIX_UnsolicitedIndicator_MessageIsBeingSentUnsolicited -> "MessageIsBeingSentUnsolicited"
        | FIX_UnsolicitedIndicator_MessageIsBeingSentAsAResultOfAPriorRequest -> "MessageIsBeingSentAsAResultOfAPriorRequest"
;;

let urgency_to_string ( d ) =
    match d with
        | FIX_Urgency_Normal -> "Normal"
        | FIX_Urgency_Flash -> "Flash"
        | FIX_Urgency_Background -> "Background"
;;

let userrequesttype_to_string ( d ) =
    match d with
        | FIX_UserRequestType_LogOnUser -> "LogOnUser"
        | FIX_UserRequestType_LogOffUser -> "LogOffUser"
        | FIX_UserRequestType_ChangePasswordForUser -> "ChangePasswordForUser"
        | FIX_UserRequestType_RequestIndividualUserStatus -> "RequestIndividualUserStatus"
;;

let userstatus_to_string ( d ) =
    match d with
        | FIX_UserStatus_LoggedIn -> "LoggedIn"
        | FIX_UserStatus_NotLoggedIn -> "NotLoggedIn"
        | FIX_UserStatus_UserNotRecognised -> "UserNotRecognised"
        | FIX_UserStatus_PasswordIncorrect -> "PasswordIncorrect"
        | FIX_UserStatus_PasswordChanged -> "PasswordChanged"
        | FIX_UserStatus_Other -> "Other"
;;

let workingindicator_to_string ( d ) =
    match d with
        | FIX_WorkingIndicator_Working -> "Working"
        | FIX_WorkingIndicator_NotWorking -> "NotWorking"
;;

let yieldtype_to_string ( d ) =
    match d with
        | FIX_YieldType_AfterTaxYield -> "AfterTaxYield"
        | FIX_YieldType_AnnualYield -> "AnnualYield"
        | FIX_YieldType_YieldAtIssue -> "YieldAtIssue"
        | FIX_YieldType_YieldToAverageMaturity -> "YieldToAverageMaturity"
        | FIX_YieldType_BookYield -> "BookYield"
        | FIX_YieldType_YieldToNextCall -> "YieldToNextCall"
        | FIX_YieldType_YieldChangeSinceClose -> "YieldChangeSinceClose"
        | FIX_YieldType_ClosingYield -> "ClosingYield"
        | FIX_YieldType_CompoundYield -> "CompoundYield"
        | FIX_YieldType_CurrentYield -> "CurrentYield"
        | FIX_YieldType_TrueGrossYield -> "TrueGrossYield"
        | FIX_YieldType_GvntEquivalentYield -> "GvntEquivalentYield"
        | FIX_YieldType_YieldWithInflationAssumption -> "YieldWithInflationAssumption"
        | FIX_YieldType_InverseFloaterBondYield -> "InverseFloaterBondYield"
        | FIX_YieldType_MostRecentClosingYield -> "MostRecentClosingYield"
        | FIX_YieldType_ClosingYieldMostRecentMonth -> "ClosingYieldMostRecentMonth"
        | FIX_YieldType_ClosingYieldMostRecentQuarter -> "ClosingYieldMostRecentQuarter"
        | FIX_YieldType_ClosingYieldMostRecentYear -> "ClosingYieldMostRecentYear"
        | FIX_YieldType_YieldToLongestAverageLife -> "YieldToLongestAverageLife"
        | FIX_YieldType_MarkToMarketYield -> "MarkToMarketYield"
        | FIX_YieldType_YieldToMaturity -> "YieldToMaturity"
        | FIX_YieldType_YieldToNextRefund -> "YieldToNextRefund"
        | FIX_YieldType_OpenAverageYield -> "OpenAverageYield"
        | FIX_YieldType_YieldToNextPut -> "YieldToNextPut"
        | FIX_YieldType_PreviousCloseYield -> "PreviousCloseYield"
        | FIX_YieldType_ProceedsYield -> "ProceedsYield"
        | FIX_YieldType_SemiAnnualYield -> "SemiAnnualYield"
        | FIX_YieldType_YieldToShortestAverageLife -> "YieldToShortestAverageLife"
        | FIX_YieldType_SimpleYield -> "SimpleYield"
        | FIX_YieldType_TaxEquivalentYield -> "TaxEquivalentYield"
        | FIX_YieldType_YieldToTenderDate -> "YieldToTenderDate"
        | FIX_YieldType_TrueYield -> "TrueYield"
        | FIX_YieldType_YieldValueOf132 -> "YieldValueOf132"
        | FIX_YieldType_YieldToWorst -> "YieldToWorst"
;;

let week_to_string ( d ) =
    match d with
        | FIX_week_noweek -> "noweek"
        | FIX_week_w1 -> "w1"
        | FIX_week_w2 -> "w2"
        | FIX_week_w3 -> "w3"
        | FIX_week_w4 -> "w4"
        | FIX_week_w5 -> "w5"
;;

let currency_to_string ( d ) =
    match d with
        | FIX_Currency_AED -> "AED"
        | FIX_Currency_AFN -> "AFN"
        | FIX_Currency_AMD -> "AMD"
        | FIX_Currency_ANG -> "ANG"
        | FIX_Currency_AOA -> "AOA"
        | FIX_Currency_ARS -> "ARS"
        | FIX_Currency_AUD -> "AUD"
        | FIX_Currency_AWG -> "AWG"
        | FIX_Currency_AZN -> "AZN"
        | FIX_Currency_BAM -> "BAM"
        | FIX_Currency_BBD -> "BBD"
        | FIX_Currency_BDT -> "BDT"
        | FIX_Currency_BGN -> "BGN"
        | FIX_Currency_BHD -> "BHD"
        | FIX_Currency_BIF -> "BIF"
        | FIX_Currency_BMD -> "BMD"
        | FIX_Currency_BND -> "BND"
        | FIX_Currency_BOB -> "BOB"
        | FIX_Currency_BRL -> "BRL"
        | FIX_Currency_BSD -> "BSD"
        | FIX_Currency_BTN -> "BTN"
        | FIX_Currency_BWP -> "BWP"
        | FIX_Currency_BYN -> "BYN"
        | FIX_Currency_BZD -> "BZD"
        | FIX_Currency_CAD -> "CAD"
        | FIX_Currency_CDF -> "CDF"
        | FIX_Currency_CHF -> "CHF"
        | FIX_Currency_CLP -> "CLP"
        | FIX_Currency_CNY -> "CNY"
        | FIX_Currency_COP -> "COP"
        | FIX_Currency_CRC -> "CRC"
        | FIX_Currency_CUC -> "CUC"
        | FIX_Currency_CUP -> "CUP"
        | FIX_Currency_CVE -> "CVE"
        | FIX_Currency_CZK -> "CZK"
        | FIX_Currency_DJF -> "DJF"
        | FIX_Currency_DKK -> "DKK"
        | FIX_Currency_DOP -> "DOP"
        | FIX_Currency_DZD -> "DZD"
        | FIX_Currency_EGP -> "EGP"
        | FIX_Currency_ERN -> "ERN"
        | FIX_Currency_ETB -> "ETB"
        | FIX_Currency_EUR -> "EUR"
        | FIX_Currency_FJD -> "FJD"
        | FIX_Currency_FKP -> "FKP"
        | FIX_Currency_GBP -> "GBP"
        | FIX_Currency_GEL -> "GEL"
        | FIX_Currency_GGP -> "GGP"
        | FIX_Currency_GHS -> "GHS"
        | FIX_Currency_GIP -> "GIP"
        | FIX_Currency_GMD -> "GMD"
        | FIX_Currency_GNF -> "GNF"
        | FIX_Currency_GTQ -> "GTQ"
        | FIX_Currency_GYD -> "GYD"
        | FIX_Currency_HKD -> "HKD"
        | FIX_Currency_HNL -> "HNL"
        | FIX_Currency_HRK -> "HRK"
        | FIX_Currency_HTG -> "HTG"
        | FIX_Currency_HUF -> "HUF"
        | FIX_Currency_IDR -> "IDR"
        | FIX_Currency_ILS -> "ILS"
        | FIX_Currency_IMP -> "IMP"
        | FIX_Currency_INR -> "INR"
        | FIX_Currency_IQD -> "IQD"
        | FIX_Currency_IRR -> "IRR"
        | FIX_Currency_ISK -> "ISK"
        | FIX_Currency_JEP -> "JEP"
        | FIX_Currency_JMD -> "JMD"
        | FIX_Currency_JOD -> "JOD"
        | FIX_Currency_JPY -> "JPY"
        | FIX_Currency_KES -> "KES"
        | FIX_Currency_KGS -> "KGS"
        | FIX_Currency_KHR -> "KHR"
        | FIX_Currency_KMF -> "KMF"
        | FIX_Currency_KPW -> "KPW"
        | FIX_Currency_KRW -> "KRW"
        | FIX_Currency_KWD -> "KWD"
        | FIX_Currency_KYD -> "KYD"
        | FIX_Currency_KZT -> "KZT"
        | FIX_Currency_LAK -> "LAK"
        | FIX_Currency_LBP -> "LBP"
        | FIX_Currency_LKR -> "LKR"
        | FIX_Currency_LRD -> "LRD"
        | FIX_Currency_LSL -> "LSL"
        | FIX_Currency_LYD -> "LYD"
        | FIX_Currency_MAD -> "MAD"
        | FIX_Currency_MDL -> "MDL"
        | FIX_Currency_MGA -> "MGA"
        | FIX_Currency_MKD -> "MKD"
        | FIX_Currency_MMK -> "MMK"
        | FIX_Currency_MNT -> "MNT"
        | FIX_Currency_MOP -> "MOP"
        | FIX_Currency_MRO -> "MRO"
        | FIX_Currency_MUR -> "MUR"
        | FIX_Currency_MVR -> "MVR"
        | FIX_Currency_MWK -> "MWK"
        | FIX_Currency_MXN -> "MXN"
        | FIX_Currency_MYR -> "MYR"
        | FIX_Currency_MZN -> "MZN"
        | FIX_Currency_NAD -> "NAD"
        | FIX_Currency_NGN -> "NGN"
        | FIX_Currency_NIO -> "NIO"
        | FIX_Currency_NOK -> "NOK"
        | FIX_Currency_NPR -> "NPR"
        | FIX_Currency_NZD -> "NZD"
        | FIX_Currency_OMR -> "OMR"
        | FIX_Currency_PAB -> "PAB"
        | FIX_Currency_PEN -> "PEN"
        | FIX_Currency_PGK -> "PGK"
        | FIX_Currency_PHP -> "PHP"
        | FIX_Currency_PKR -> "PKR"
        | FIX_Currency_PLN -> "PLN"
        | FIX_Currency_PYG -> "PYG"
        | FIX_Currency_QAR -> "QAR"
        | FIX_Currency_RON -> "RON"
        | FIX_Currency_RSD -> "RSD"
        | FIX_Currency_RUB -> "RUB"
        | FIX_Currency_RWF -> "RWF"
        | FIX_Currency_SAR -> "SAR"
        | FIX_Currency_SBD -> "SBD"
        | FIX_Currency_SCR -> "SCR"
        | FIX_Currency_SDG -> "SDG"
        | FIX_Currency_SEK -> "SEK"
        | FIX_Currency_SGD -> "SGD"
        | FIX_Currency_SHP -> "SHP"
        | FIX_Currency_SLL -> "SLL"
        | FIX_Currency_SOS -> "SOS"
        | FIX_Currency_SPL -> "SPL"
        | FIX_Currency_SRD -> "SRD"
        | FIX_Currency_STD -> "STD"
        | FIX_Currency_SVC -> "SVC"
        | FIX_Currency_SYP -> "SYP"
        | FIX_Currency_SZL -> "SZL"
        | FIX_Currency_THB -> "THB"
        | FIX_Currency_TJS -> "TJS"
        | FIX_Currency_TMT -> "TMT"
        | FIX_Currency_TND -> "TND"
        | FIX_Currency_TOP -> "TOP"
        | FIX_Currency_TRY -> "TRY"
        | FIX_Currency_TTD -> "TTD"
        | FIX_Currency_TVD -> "TVD"
        | FIX_Currency_TWD -> "TWD"
        | FIX_Currency_TZS -> "TZS"
        | FIX_Currency_UAH -> "UAH"
        | FIX_Currency_UGX -> "UGX"
        | FIX_Currency_USD -> "USD"
        | FIX_Currency_UYU -> "UYU"
        | FIX_Currency_UZS -> "UZS"
        | FIX_Currency_VEF -> "VEF"
        | FIX_Currency_VND -> "VND"
        | FIX_Currency_VUV -> "VUV"
        | FIX_Currency_WST -> "WST"
        | FIX_Currency_XAF -> "XAF"
        | FIX_Currency_XCD -> "XCD"
        | FIX_Currency_XDR -> "XDR"
        | FIX_Currency_XOF -> "XOF"
        | FIX_Currency_XPF -> "XPF"
        | FIX_Currency_YER -> "YER"
        | FIX_Currency_ZAR -> "ZAR"
        | FIX_Currency_ZMW -> "ZMW"
        | FIX_Currency_ZWD -> "ZWD"
;;

let country_to_string ( d ) =
    match d with
        | FIX_Country_AF -> "AF"
        | FIX_Country_AX -> "AX"
        | FIX_Country_AL -> "AL"
        | FIX_Country_DZ -> "DZ"
        | FIX_Country_AS -> "AS"
        | FIX_Country_AD -> "AD"
        | FIX_Country_AO -> "AO"
        | FIX_Country_AI -> "AI"
        | FIX_Country_AQ -> "AQ"
        | FIX_Country_AG -> "AG"
        | FIX_Country_AR -> "AR"
        | FIX_Country_AM -> "AM"
        | FIX_Country_AW -> "AW"
        | FIX_Country_AU -> "AU"
        | FIX_Country_AT -> "AT"
        | FIX_Country_AZ -> "AZ"
        | FIX_Country_BS -> "BS"
        | FIX_Country_BH -> "BH"
        | FIX_Country_BD -> "BD"
        | FIX_Country_BB -> "BB"
        | FIX_Country_BY -> "BY"
        | FIX_Country_BE -> "BE"
        | FIX_Country_BZ -> "BZ"
        | FIX_Country_BJ -> "BJ"
        | FIX_Country_BM -> "BM"
        | FIX_Country_BT -> "BT"
        | FIX_Country_BO -> "BO"
        | FIX_Country_BQ -> "BQ"
        | FIX_Country_BA -> "BA"
        | FIX_Country_BW -> "BW"
        | FIX_Country_BV -> "BV"
        | FIX_Country_BR -> "BR"
        | FIX_Country_IO -> "IO"
        | FIX_Country_BN -> "BN"
        | FIX_Country_BG -> "BG"
        | FIX_Country_BF -> "BF"
        | FIX_Country_BI -> "BI"
        | FIX_Country_CV -> "CV"
        | FIX_Country_KH -> "KH"
        | FIX_Country_CM -> "CM"
        | FIX_Country_CA -> "CA"
        | FIX_Country_KY -> "KY"
        | FIX_Country_CF -> "CF"
        | FIX_Country_TD -> "TD"
        | FIX_Country_CL -> "CL"
        | FIX_Country_CN -> "CN"
        | FIX_Country_CX -> "CX"
        | FIX_Country_CC -> "CC"
        | FIX_Country_CO -> "CO"
        | FIX_Country_KM -> "KM"
        | FIX_Country_CD -> "CD"
        | FIX_Country_CG -> "CG"
        | FIX_Country_CK -> "CK"
        | FIX_Country_CR -> "CR"
        | FIX_Country_CI -> "CI"
        | FIX_Country_HR -> "HR"
        | FIX_Country_CU -> "CU"
        | FIX_Country_CW -> "CW"
        | FIX_Country_CY -> "CY"
        | FIX_Country_CZ -> "CZ"
        | FIX_Country_DK -> "DK"
        | FIX_Country_DJ -> "DJ"
        | FIX_Country_DM -> "DM"
        | FIX_Country_DO -> "DO"
        | FIX_Country_EC -> "EC"
        | FIX_Country_EG -> "EG"
        | FIX_Country_SV -> "SV"
        | FIX_Country_GQ -> "GQ"
        | FIX_Country_ER -> "ER"
        | FIX_Country_EE -> "EE"
        | FIX_Country_ET -> "ET"
        | FIX_Country_FK -> "FK"
        | FIX_Country_FO -> "FO"
        | FIX_Country_FJ -> "FJ"
        | FIX_Country_FI -> "FI"
        | FIX_Country_FR -> "FR"
        | FIX_Country_GF -> "GF"
        | FIX_Country_PF -> "PF"
        | FIX_Country_TF -> "TF"
        | FIX_Country_GA -> "GA"
        | FIX_Country_GM -> "GM"
        | FIX_Country_GE -> "GE"
        | FIX_Country_DE -> "DE"
        | FIX_Country_GH -> "GH"
        | FIX_Country_GI -> "GI"
        | FIX_Country_GR -> "GR"
        | FIX_Country_GL -> "GL"
        | FIX_Country_GD -> "GD"
        | FIX_Country_GP -> "GP"
        | FIX_Country_GU -> "GU"
        | FIX_Country_GT -> "GT"
        | FIX_Country_GG -> "GG"
        | FIX_Country_GN -> "GN"
        | FIX_Country_GW -> "GW"
        | FIX_Country_GY -> "GY"
        | FIX_Country_HT -> "HT"
        | FIX_Country_HM -> "HM"
        | FIX_Country_VA -> "VA"
        | FIX_Country_HN -> "HN"
        | FIX_Country_HK -> "HK"
        | FIX_Country_HU -> "HU"
        | FIX_Country_IS -> "IS"
        | FIX_Country_IN -> "IN"
        | FIX_Country_ID -> "ID"
        | FIX_Country_IR -> "IR"
        | FIX_Country_IQ -> "IQ"
        | FIX_Country_IE -> "IE"
        | FIX_Country_IM -> "IM"
        | FIX_Country_IL -> "IL"
        | FIX_Country_IT -> "IT"
        | FIX_Country_JM -> "JM"
        | FIX_Country_JP -> "JP"
        | FIX_Country_JE -> "JE"
        | FIX_Country_JO -> "JO"
        | FIX_Country_KZ -> "KZ"
        | FIX_Country_KE -> "KE"
        | FIX_Country_KI -> "KI"
        | FIX_Country_KP -> "KP"
        | FIX_Country_KR -> "KR"
        | FIX_Country_KW -> "KW"
        | FIX_Country_KG -> "KG"
        | FIX_Country_LA -> "LA"
        | FIX_Country_LV -> "LV"
        | FIX_Country_LB -> "LB"
        | FIX_Country_LS -> "LS"
        | FIX_Country_LR -> "LR"
        | FIX_Country_LY -> "LY"
        | FIX_Country_LI -> "LI"
        | FIX_Country_LT -> "LT"
        | FIX_Country_LU -> "LU"
        | FIX_Country_MO -> "MO"
        | FIX_Country_MK -> "MK"
        | FIX_Country_MG -> "MG"
        | FIX_Country_MW -> "MW"
        | FIX_Country_MY -> "MY"
        | FIX_Country_MV -> "MV"
        | FIX_Country_ML -> "ML"
        | FIX_Country_MT -> "MT"
        | FIX_Country_MH -> "MH"
        | FIX_Country_MQ -> "MQ"
        | FIX_Country_MR -> "MR"
        | FIX_Country_MU -> "MU"
        | FIX_Country_YT -> "YT"
        | FIX_Country_MX -> "MX"
        | FIX_Country_FM -> "FM"
        | FIX_Country_MD -> "MD"
        | FIX_Country_MC -> "MC"
        | FIX_Country_MN -> "MN"
        | FIX_Country_ME -> "ME"
        | FIX_Country_MS -> "MS"
        | FIX_Country_MA -> "MA"
        | FIX_Country_MZ -> "MZ"
        | FIX_Country_MM -> "MM"
        | FIX_Country_NA -> "NA"
        | FIX_Country_NR -> "NR"
        | FIX_Country_NP -> "NP"
        | FIX_Country_NL -> "NL"
        | FIX_Country_NC -> "NC"
        | FIX_Country_NZ -> "NZ"
        | FIX_Country_NI -> "NI"
        | FIX_Country_NE -> "NE"
        | FIX_Country_NG -> "NG"
        | FIX_Country_NU -> "NU"
        | FIX_Country_NF -> "NF"
        | FIX_Country_MP -> "MP"
        | FIX_Country_NO -> "NO"
        | FIX_Country_OM -> "OM"
        | FIX_Country_PK -> "PK"
        | FIX_Country_PW -> "PW"
        | FIX_Country_PS -> "PS"
        | FIX_Country_PA -> "PA"
        | FIX_Country_PG -> "PG"
        | FIX_Country_PY -> "PY"
        | FIX_Country_PE -> "PE"
        | FIX_Country_PH -> "PH"
        | FIX_Country_PN -> "PN"
        | FIX_Country_PL -> "PL"
        | FIX_Country_PT -> "PT"
        | FIX_Country_PR -> "PR"
        | FIX_Country_QA -> "QA"
        | FIX_Country_RE -> "RE"
        | FIX_Country_RO -> "RO"
        | FIX_Country_RU -> "RU"
        | FIX_Country_RW -> "RW"
        | FIX_Country_BL -> "BL"
        | FIX_Country_SH -> "SH"
        | FIX_Country_KN -> "KN"
        | FIX_Country_LC -> "LC"
        | FIX_Country_MF -> "MF"
        | FIX_Country_PM -> "PM"
        | FIX_Country_VC -> "VC"
        | FIX_Country_WS -> "WS"
        | FIX_Country_SM -> "SM"
        | FIX_Country_ST -> "ST"
        | FIX_Country_SA -> "SA"
        | FIX_Country_SN -> "SN"
        | FIX_Country_RS -> "RS"
        | FIX_Country_SC -> "SC"
        | FIX_Country_SL -> "SL"
        | FIX_Country_SG -> "SG"
        | FIX_Country_SX -> "SX"
        | FIX_Country_SK -> "SK"
        | FIX_Country_SI -> "SI"
        | FIX_Country_SB -> "SB"
        | FIX_Country_SO -> "SO"
        | FIX_Country_ZA -> "ZA"
        | FIX_Country_GS -> "GS"
        | FIX_Country_SS -> "SS"
        | FIX_Country_ES -> "ES"
        | FIX_Country_LK -> "LK"
        | FIX_Country_SD -> "SD"
        | FIX_Country_SR -> "SR"
        | FIX_Country_SJ -> "SJ"
        | FIX_Country_SZ -> "SZ"
        | FIX_Country_SE -> "SE"
        | FIX_Country_CH -> "CH"
        | FIX_Country_SY -> "SY"
        | FIX_Country_TW -> "TW"
        | FIX_Country_TJ -> "TJ"
        | FIX_Country_TZ -> "TZ"
        | FIX_Country_TH -> "TH"
        | FIX_Country_TL -> "TL"
        | FIX_Country_TG -> "TG"
        | FIX_Country_TK -> "TK"
        | FIX_Country_TO -> "TO"
        | FIX_Country_TT -> "TT"
        | FIX_Country_TN -> "TN"
        | FIX_Country_TR -> "TR"
        | FIX_Country_TM -> "TM"
        | FIX_Country_TC -> "TC"
        | FIX_Country_TV -> "TV"
        | FIX_Country_UG -> "UG"
        | FIX_Country_UA -> "UA"
        | FIX_Country_AE -> "AE"
        | FIX_Country_GB -> "GB"
        | FIX_Country_UM -> "UM"
        | FIX_Country_US -> "US"
        | FIX_Country_UY -> "UY"
        | FIX_Country_UZ -> "UZ"
        | FIX_Country_VU -> "VU"
        | FIX_Country_VE -> "VE"
        | FIX_Country_VN -> "VN"
        | FIX_Country_VG -> "VG"
        | FIX_Country_VI -> "VI"
        | FIX_Country_WF -> "WF"
        | FIX_Country_EH -> "EH"
        | FIX_Country_YE -> "YE"
        | FIX_Country_ZM -> "ZM"
        | FIX_Country_ZW -> "ZW"
;;

let exchange_to_string ( d ) =
    match d with
        | FIX_Exchange_XTIR -> "XTIR"
        | FIX_Exchange_XALG -> "XALG"
        | FIX_Exchange_BACE -> "BACE"
        | FIX_Exchange_BCFS -> "BCFS"
        | FIX_Exchange_XMVL -> "XMVL"
        | FIX_Exchange_ROFX -> "ROFX"
        | FIX_Exchange_XBCC -> "XBCC"
        | FIX_Exchange_MVCX -> "MVCX"
        | FIX_Exchange_XBCM -> "XBCM"
        | FIX_Exchange_XBCX -> "XBCX"
        | FIX_Exchange_XBUE -> "XBUE"
        | FIX_Exchange_XMEV -> "XMEV"
        | FIX_Exchange_XCNF -> "XCNF"
        | FIX_Exchange_XMAB -> "XMAB"
        | FIX_Exchange_XMTB -> "XMTB"
        | FIX_Exchange_XROS -> "XROS"
        | FIX_Exchange_XROX -> "XROX"
        | FIX_Exchange_XTUC -> "XTUC"
        | FIX_Exchange_XARM -> "XARM"
        | FIX_Exchange_APXL -> "APXL"
        | FIX_Exchange_AWBX -> "AWBX"
        | FIX_Exchange_AWEX -> "AWEX"
        | FIX_Exchange_BLEV -> "BLEV"
        | FIX_Exchange_CGMA -> "CGMA"
        | FIX_Exchange_CHIA -> "CHIA"
        | FIX_Exchange_CXAC -> "CXAC"
        | FIX_Exchange_CXAV -> "CXAV"
        | FIX_Exchange_CXAM -> "CXAM"
        | FIX_Exchange_CXAP -> "CXAP"
        | FIX_Exchange_CXAN -> "CXAN"
        | FIX_Exchange_CXAF -> "CXAF"
        | FIX_Exchange_CXAW -> "CXAW"
        | FIX_Exchange_CXAR -> "CXAR"
        | FIX_Exchange_CXAQ -> "CXAQ"
        | FIX_Exchange_CLAU -> "CLAU"
        | FIX_Exchange_CSAU -> "CSAU"
        | FIX_Exchange_CFAU -> "CFAU"
        | FIX_Exchange_MAQX -> "MAQX"
        | FIX_Exchange_MSAL -> "MSAL"
        | FIX_Exchange_NSXB -> "NSXB"
        | FIX_Exchange_SIGA -> "SIGA"
        | FIX_Exchange_SIMV -> "SIMV"
        | FIX_Exchange_XASX -> "XASX"
        | FIX_Exchange_ASXC -> "ASXC"
        | FIX_Exchange_ASXP -> "ASXP"
        | FIX_Exchange_ASXT -> "ASXT"
        | FIX_Exchange_ASXV -> "ASXV"
        | FIX_Exchange_XSFE -> "XSFE"
        | FIX_Exchange_ASXB -> "ASXB"
        | FIX_Exchange_XFEX -> "XFEX"
        | FIX_Exchange_XNEC -> "XNEC"
        | FIX_Exchange_XYIE -> "XYIE"
        | FIX_Exchange_EGSI -> "EGSI"
        | FIX_Exchange_XWBO -> "XWBO"
        | FIX_Exchange_EXAA -> "EXAA"
        | FIX_Exchange_WBAH -> "WBAH"
        | FIX_Exchange_WBDM -> "WBDM"
        | FIX_Exchange_WBGF -> "WBGF"
        | FIX_Exchange_XCEG -> "XCEG"
        | FIX_Exchange_XVIE -> "XVIE"
        | FIX_Exchange_BSEX -> "BSEX"
        | FIX_Exchange_XIBE -> "XIBE"
        | FIX_Exchange_XBAA -> "XBAA"
        | FIX_Exchange_BFEX -> "BFEX"
        | FIX_Exchange_XBAH -> "XBAH"
        | FIX_Exchange_XCHG -> "XCHG"
        | FIX_Exchange_XDHA -> "XDHA"
        | FIX_Exchange_XBAB -> "XBAB"
        | FIX_Exchange_BAJM -> "BAJM"
        | FIX_Exchange_BCSE -> "BCSE"
        | FIX_Exchange_BLPX -> "BLPX"
        | FIX_Exchange_BMTS -> "BMTS"
        | FIX_Exchange_MTSD -> "MTSD"
        | FIX_Exchange_MTSF -> "MTSF"
        | FIX_Exchange_XBRU -> "XBRU"
        | FIX_Exchange_ALXB -> "ALXB"
        | FIX_Exchange_ENXB -> "ENXB"
        | FIX_Exchange_MLXB -> "MLXB"
        | FIX_Exchange_TNLB -> "TNLB"
        | FIX_Exchange_VPXB -> "VPXB"
        | FIX_Exchange_XBRD -> "XBRD"
        | FIX_Exchange_XBDA -> "XBDA"
        | FIX_Exchange_XBOL -> "XBOL"
        | FIX_Exchange_XBLB -> "XBLB"
        | FIX_Exchange_BLBF -> "BLBF"
        | FIX_Exchange_XSSE -> "XSSE"
        | FIX_Exchange_XBOT -> "XBOT"
        | FIX_Exchange_BOTV -> "BOTV"
        | FIX_Exchange_BOTE -> "BOTE"
        | FIX_Exchange_BCMM -> "BCMM"
        | FIX_Exchange_BOVM -> "BOVM"
        | FIX_Exchange_BRIX -> "BRIX"
        | FIX_Exchange_BVMF -> "BVMF"
        | FIX_Exchange_CETI -> "CETI"
        | FIX_Exchange_SELC -> "SELC"
        | FIX_Exchange_IBEX -> "IBEX"
        | FIX_Exchange_MBUL -> "MBUL"
        | FIX_Exchange_XBUL -> "XBUL"
        | FIX_Exchange_ABUL -> "ABUL"
        | FIX_Exchange_XCSX -> "XCSX"
        | FIX_Exchange_XDSX -> "XDSX"
        | FIX_Exchange_CAND -> "CAND"
        | FIX_Exchange_CANX -> "CANX"
        | FIX_Exchange_CHIC -> "CHIC"
        | FIX_Exchange_XCX2 -> "XCX2"
        | FIX_Exchange_COTC -> "COTC"
        | FIX_Exchange_IFCA -> "IFCA"
        | FIX_Exchange_IVZX -> "IVZX"
        | FIX_Exchange_LICA -> "LICA"
        | FIX_Exchange_MATN -> "MATN"
        | FIX_Exchange_NEOE -> "NEOE"
        | FIX_Exchange_NGXC -> "NGXC"
        | FIX_Exchange_OMGA -> "OMGA"
        | FIX_Exchange_LYNX -> "LYNX"
        | FIX_Exchange_TMXS -> "TMXS"
        | FIX_Exchange_XATS -> "XATS"
        | FIX_Exchange_XBBK -> "XBBK"
        | FIX_Exchange_XCNQ -> "XCNQ"
        | FIX_Exchange_PURE -> "PURE"
        | FIX_Exchange_XCXD -> "XCXD"
        | FIX_Exchange_XICX -> "XICX"
        | FIX_Exchange_XMOC -> "XMOC"
        | FIX_Exchange_XMOD -> "XMOD"
        | FIX_Exchange_XTSE -> "XTSE"
        | FIX_Exchange_XTSX -> "XTSX"
        | FIX_Exchange_XTNX -> "XTNX"
        | FIX_Exchange_XBVC -> "XBVC"
        | FIX_Exchange_XCAY -> "XCAY"
        | FIX_Exchange_BOVA -> "BOVA"
        | FIX_Exchange_XBCL -> "XBCL"
        | FIX_Exchange_XSGO -> "XSGO"
        | FIX_Exchange_CCFX -> "CCFX"
        | FIX_Exchange_CSSX -> "CSSX"
        | FIX_Exchange_SGEX -> "SGEX"
        | FIX_Exchange_XCFE -> "XCFE"
        | FIX_Exchange_XDCE -> "XDCE"
        | FIX_Exchange_XSGE -> "XSGE"
        | FIX_Exchange_XINE -> "XINE"
        | FIX_Exchange_XSHE -> "XSHE"
        | FIX_Exchange_XSEC -> "XSEC"
        | FIX_Exchange_XSHG -> "XSHG"
        | FIX_Exchange_XSSC -> "XSSC"
        | FIX_Exchange_XZCE -> "XZCE"
        | FIX_Exchange_XBOG -> "XBOG"
        | FIX_Exchange_XBNV -> "XBNV"
        | FIX_Exchange_XCRO -> "XCRO"
        | FIX_Exchange_XTRZ -> "XTRZ"
        | FIX_Exchange_XZAG -> "XZAG"
        | FIX_Exchange_XZAM -> "XZAM"
        | FIX_Exchange_DCSX -> "DCSX"
        | FIX_Exchange_XCYS -> "XCYS"
        | FIX_Exchange_XCYO -> "XCYO"
        | FIX_Exchange_XECM -> "XECM"
        | FIX_Exchange_FTFS -> "FTFS"
        | FIX_Exchange_XPRA -> "XPRA"
        | FIX_Exchange_XPRM -> "XPRM"
        | FIX_Exchange_XPXE -> "XPXE"
        | FIX_Exchange_XRMZ -> "XRMZ"
        | FIX_Exchange_XRMO -> "XRMO"
        | FIX_Exchange_DKTC -> "DKTC"
        | FIX_Exchange_GXGR -> "GXGR"
        | FIX_Exchange_GXGF -> "GXGF"
        | FIX_Exchange_GXGM -> "GXGM"
        | FIX_Exchange_NPGA -> "NPGA"
        | FIX_Exchange_XCSE -> "XCSE"
        | FIX_Exchange_DCSE -> "DCSE"
        | FIX_Exchange_FNDK -> "FNDK"
        | FIX_Exchange_DNDK -> "DNDK"
        | FIX_Exchange_MCSE -> "MCSE"
        | FIX_Exchange_MNDK -> "MNDK"
        | FIX_Exchange_XBVR -> "XBVR"
        | FIX_Exchange_XGUA -> "XGUA"
        | FIX_Exchange_XQUI -> "XQUI"
        | FIX_Exchange_NILX -> "NILX"
        | FIX_Exchange_XCAI -> "XCAI"
        | FIX_Exchange_XSVA -> "XSVA"
        | FIX_Exchange_XTAL -> "XTAL"
        | FIX_Exchange_FNEE -> "FNEE"
        | FIX_Exchange_VMFX -> "VMFX"
        | FIX_Exchange_XSPS -> "XSPS"
        | FIX_Exchange_FGEX -> "FGEX"
        | FIX_Exchange_XHEL -> "XHEL"
        | FIX_Exchange_FNFI -> "FNFI"
        | FIX_Exchange_DHEL -> "DHEL"
        | FIX_Exchange_DNFI -> "DNFI"
        | FIX_Exchange_MHEL -> "MHEL"
        | FIX_Exchange_MNFI -> "MNFI"
        | FIX_Exchange_COAL -> "COAL"
        | FIX_Exchange_EPEX -> "EPEX"
        | FIX_Exchange_FMTS -> "FMTS"
        | FIX_Exchange_GMTF -> "GMTF"
        | FIX_Exchange_LCHC -> "LCHC"
        | FIX_Exchange_XAFR -> "XAFR"
        | FIX_Exchange_XBLN -> "XBLN"
        | FIX_Exchange_XPAR -> "XPAR"
        | FIX_Exchange_ALXP -> "ALXP"
        | FIX_Exchange_MTCH -> "MTCH"
        | FIX_Exchange_XMAT -> "XMAT"
        | FIX_Exchange_XMLI -> "XMLI"
        | FIX_Exchange_XMON -> "XMON"
        | FIX_Exchange_XSPM -> "XSPM"
        | FIX_Exchange_XPOW -> "XPOW"
        | FIX_Exchange_XPSF -> "XPSF"
        | FIX_Exchange_XPOT -> "XPOT"
        | FIX_Exchange_XGSE -> "XGSE"
        | FIX_Exchange__360T -> "_360T"
        | FIX_Exchange_CATS -> "CATS"
        | FIX_Exchange_DBOX -> "DBOX"
        | FIX_Exchange_AUTO -> "AUTO"
        | FIX_Exchange_ECAG -> "ECAG"
        | FIX_Exchange_FICX -> "FICX"
        | FIX_Exchange_TGAT -> "TGAT"
        | FIX_Exchange_XGAT -> "XGAT"
        | FIX_Exchange_XGRM -> "XGRM"
        | FIX_Exchange_XBER -> "XBER"
        | FIX_Exchange_BERA -> "BERA"
        | FIX_Exchange_BERB -> "BERB"
        | FIX_Exchange_BERC -> "BERC"
        | FIX_Exchange_EQTA -> "EQTA"
        | FIX_Exchange_EQTB -> "EQTB"
        | FIX_Exchange_EQTC -> "EQTC"
        | FIX_Exchange_EQTD -> "EQTD"
        | FIX_Exchange_XEQT -> "XEQT"
        | FIX_Exchange_ZOBX -> "ZOBX"
        | FIX_Exchange_XDUS -> "XDUS"
        | FIX_Exchange_DUSA -> "DUSA"
        | FIX_Exchange_DUSB -> "DUSB"
        | FIX_Exchange_DUSC -> "DUSC"
        | FIX_Exchange_DUSD -> "DUSD"
        | FIX_Exchange_XQTX -> "XQTX"
        | FIX_Exchange_XECB -> "XECB"
        | FIX_Exchange_XECC -> "XECC"
        | FIX_Exchange_XEEE -> "XEEE"
        | FIX_Exchange_XEEO -> "XEEO"
        | FIX_Exchange_XEER -> "XEER"
        | FIX_Exchange_XETR -> "XETR"
        | FIX_Exchange_XEUB -> "XEUB"
        | FIX_Exchange_XETA -> "XETA"
        | FIX_Exchange_XETB -> "XETB"
        | FIX_Exchange_XEUP -> "XEUP"
        | FIX_Exchange_XEUM -> "XEUM"
        | FIX_Exchange_XERE -> "XERE"
        | FIX_Exchange_XERT -> "XERT"
        | FIX_Exchange_XEUR -> "XEUR"
        | FIX_Exchange_XFRA -> "XFRA"
        | FIX_Exchange_FRAA -> "FRAA"
        | FIX_Exchange_FRAB -> "FRAB"
        | FIX_Exchange_XDBC -> "XDBC"
        | FIX_Exchange_XDBV -> "XDBV"
        | FIX_Exchange_XDBX -> "XDBX"
        | FIX_Exchange_XHAM -> "XHAM"
        | FIX_Exchange_HAMA -> "HAMA"
        | FIX_Exchange_HAMB -> "HAMB"
        | FIX_Exchange_HAML -> "HAML"
        | FIX_Exchange_HAMM -> "HAMM"
        | FIX_Exchange_HAMN -> "HAMN"
        | FIX_Exchange_XHAN -> "XHAN"
        | FIX_Exchange_HANA -> "HANA"
        | FIX_Exchange_HANB -> "HANB"
        | FIX_Exchange_XINV -> "XINV"
        | FIX_Exchange_XMUN -> "XMUN"
        | FIX_Exchange_MUNA -> "MUNA"
        | FIX_Exchange_MUNB -> "MUNB"
        | FIX_Exchange_MUNC -> "MUNC"
        | FIX_Exchange_MUND -> "MUND"
        | FIX_Exchange_XSCO -> "XSCO"
        | FIX_Exchange_XSC1 -> "XSC1"
        | FIX_Exchange_XSC2 -> "XSC2"
        | FIX_Exchange_XSC3 -> "XSC3"
        | FIX_Exchange_XSTU -> "XSTU"
        | FIX_Exchange_EUWX -> "EUWX"
        | FIX_Exchange_STUA -> "STUA"
        | FIX_Exchange_STUB -> "STUB"
        | FIX_Exchange_XXSC -> "XXSC"
        | FIX_Exchange_XGHA -> "XGHA"
        | FIX_Exchange_GSXL -> "GSXL"
        | FIX_Exchange_ASEX -> "ASEX"
        | FIX_Exchange_ENAX -> "ENAX"
        | FIX_Exchange_HOTC -> "HOTC"
        | FIX_Exchange_XADE -> "XADE"
        | FIX_Exchange_XATH -> "XATH"
        | FIX_Exchange_XIPO -> "XIPO"
        | FIX_Exchange_HDAT -> "HDAT"
        | FIX_Exchange_HEMO -> "HEMO"
        | FIX_Exchange_XGTG -> "XGTG"
        | FIX_Exchange_XCIE -> "XCIE"
        | FIX_Exchange_GSCI -> "GSCI"
        | FIX_Exchange_XBCV -> "XBCV"
        | FIX_Exchange_CGMH -> "CGMH"
        | FIX_Exchange_CLHK -> "CLHK"
        | FIX_Exchange_CSHK -> "CSHK"
        | FIX_Exchange_CFHK -> "CFHK"
        | FIX_Exchange_DBHK -> "DBHK"
        | FIX_Exchange_EOTC -> "EOTC"
        | FIX_Exchange_GSXH -> "GSXH"
        | FIX_Exchange_HSXA -> "HSXA"
        | FIX_Exchange_JPMI -> "JPMI"
        | FIX_Exchange_MAQH -> "MAQH"
        | FIX_Exchange_SIGH -> "SIGH"
        | FIX_Exchange_TOCP -> "TOCP"
        | FIX_Exchange_UBSX -> "UBSX"
        | FIX_Exchange_XCGS -> "XCGS"
        | FIX_Exchange_XHKF -> "XHKF"
        | FIX_Exchange_XHKG -> "XHKG"
        | FIX_Exchange_XGEM -> "XGEM"
        | FIX_Exchange_SHSC -> "SHSC"
        | FIX_Exchange_SZSC -> "SZSC"
        | FIX_Exchange_XIHK -> "XIHK"
        | FIX_Exchange_XPST -> "XPST"
        | FIX_Exchange_BETA -> "BETA"
        | FIX_Exchange_HUPX -> "HUPX"
        | FIX_Exchange_KCCP -> "KCCP"
        | FIX_Exchange_XBUD -> "XBUD"
        | FIX_Exchange_XGAS -> "XGAS"
        | FIX_Exchange_XICE -> "XICE"
        | FIX_Exchange_DICE -> "DICE"
        | FIX_Exchange_FNIS -> "FNIS"
        | FIX_Exchange_DNIS -> "DNIS"
        | FIX_Exchange_MICE -> "MICE"
        | FIX_Exchange_MNIS -> "MNIS"
        | FIX_Exchange_ACEX -> "ACEX"
        | FIX_Exchange_CDSL -> "CDSL"
        | FIX_Exchange_FXCL -> "FXCL"
        | FIX_Exchange_FXSW -> "FXSW"
        | FIX_Exchange_ASTR -> "ASTR"
        | FIX_Exchange_ICXL -> "ICXL"
        | FIX_Exchange_ISEX -> "ISEX"
        | FIX_Exchange_MCXX -> "MCXX"
        | FIX_Exchange_NBOT -> "NBOT"
        | FIX_Exchange_NMCE -> "NMCE"
        | FIX_Exchange_OTCX -> "OTCX"
        | FIX_Exchange_PXIL -> "PXIL"
        | FIX_Exchange_XBAN -> "XBAN"
        | FIX_Exchange_XBOM -> "XBOM"
        | FIX_Exchange_BSME -> "BSME"
        | FIX_Exchange_XCAL -> "XCAL"
        | FIX_Exchange_XDES -> "XDES"
        | FIX_Exchange_XIMC -> "XIMC"
        | FIX_Exchange_XMDS -> "XMDS"
        | FIX_Exchange_XNCD -> "XNCD"
        | FIX_Exchange_XNSE -> "XNSE"
        | FIX_Exchange_XUSE -> "XUSE"
        | FIX_Exchange_ICDX -> "ICDX"
        | FIX_Exchange_XBBJ -> "XBBJ"
        | FIX_Exchange_XIDX -> "XIDX"
        | FIX_Exchange_XJNB -> "XJNB"
        | FIX_Exchange_IMEX -> "IMEX"
        | FIX_Exchange_XTEH -> "XTEH"
        | FIX_Exchange_XIQS -> "XIQS"
        | FIX_Exchange_AREX -> "AREX"
        | FIX_Exchange_XPOS -> "XPOS"
        | FIX_Exchange_XCDE -> "XCDE"
        | FIX_Exchange_XDUB -> "XDUB"
        | FIX_Exchange_XEYE -> "XEYE"
        | FIX_Exchange_XESM -> "XESM"
        | FIX_Exchange_XMSM -> "XMSM"
        | FIX_Exchange_XATL -> "XATL"
        | FIX_Exchange_XEBI -> "XEBI"
        | FIX_Exchange_XTAE -> "XTAE"
        | FIX_Exchange_CGIT -> "CGIT"
        | FIX_Exchange_CGQT -> "CGQT"
        | FIX_Exchange_CGDB -> "CGDB"
        | FIX_Exchange_CGEB -> "CGEB"
        | FIX_Exchange_CGTR -> "CGTR"
        | FIX_Exchange_CGQD -> "CGQD"
        | FIX_Exchange_CGND -> "CGND"
        | FIX_Exchange_CGGD -> "CGGD"
        | FIX_Exchange_CGCM -> "CGCM"
        | FIX_Exchange_EMID -> "EMID"
        | FIX_Exchange_EMDR -> "EMDR"
        | FIX_Exchange_EMIR -> "EMIR"
        | FIX_Exchange_EMIB -> "EMIB"
        | FIX_Exchange_ETLX -> "ETLX"
        | FIX_Exchange_HMTF -> "HMTF"
        | FIX_Exchange_HMOD -> "HMOD"
        | FIX_Exchange_HRFQ -> "HRFQ"
        | FIX_Exchange_MTSC -> "MTSC"
        | FIX_Exchange_BOND -> "BOND"
        | FIX_Exchange_MTSM -> "MTSM"
        | FIX_Exchange_SSOB -> "SSOB"
        | FIX_Exchange_XGME -> "XGME"
        | FIX_Exchange_XMIL -> "XMIL"
        | FIX_Exchange_MTAH -> "MTAH"
        | FIX_Exchange_ETFP -> "ETFP"
        | FIX_Exchange_MIVX -> "MIVX"
        | FIX_Exchange_MOTX -> "MOTX"
        | FIX_Exchange_MTAA -> "MTAA"
        | FIX_Exchange_SEDX -> "SEDX"
        | FIX_Exchange_XAIM -> "XAIM"
        | FIX_Exchange_XDMI -> "XDMI"
        | FIX_Exchange_XMOT -> "XMOT"
        | FIX_Exchange_XBRV -> "XBRV"
        | FIX_Exchange_XJAM -> "XJAM"
        | FIX_Exchange_BETP -> "BETP"
        | FIX_Exchange_CHIJ -> "CHIJ"
        | FIX_Exchange_CHIV -> "CHIV"
        | FIX_Exchange_CHIS -> "CHIS"
        | FIX_Exchange_KAIX -> "KAIX"
        | FIX_Exchange_CITX -> "CITX"
        | FIX_Exchange_CITD -> "CITD"
        | FIX_Exchange_CLJP -> "CLJP"
        | FIX_Exchange_CMET -> "CMET"
        | FIX_Exchange_CSJP -> "CSJP"
        | FIX_Exchange_CFJP -> "CFJP"
        | FIX_Exchange_DRCT -> "DRCT"
        | FIX_Exchange_LXJP -> "LXJP"
        | FIX_Exchange_MAQJ -> "MAQJ"
        | FIX_Exchange_MIZX -> "MIZX"
        | FIX_Exchange_MSMS -> "MSMS"
        | FIX_Exchange_NMRJ -> "NMRJ"
        | FIX_Exchange_NXJP -> "NXJP"
        | FIX_Exchange_NXVW -> "NXVW"
        | FIX_Exchange_NXSE -> "NXSE"
        | FIX_Exchange_SBIJ -> "SBIJ"
        | FIX_Exchange_XSBI -> "XSBI"
        | FIX_Exchange_SBIV -> "SBIV"
        | FIX_Exchange_SBIU -> "SBIU"
        | FIX_Exchange_SIGJ -> "SIGJ"
        | FIX_Exchange_XFKA -> "XFKA"
        | FIX_Exchange_XIJP -> "XIJP"
        | FIX_Exchange_JASR -> "JASR"
        | FIX_Exchange_XJPX -> "XJPX"
        | FIX_Exchange_XJAS -> "XJAS"
        | FIX_Exchange_XOSE -> "XOSE"
        | FIX_Exchange_XOSJ -> "XOSJ"
        | FIX_Exchange_XTAM -> "XTAM"
        | FIX_Exchange_XTK1 -> "XTK1"
        | FIX_Exchange_XTK2 -> "XTK2"
        | FIX_Exchange_XTK3 -> "XTK3"
        | FIX_Exchange_XTKS -> "XTKS"
        | FIX_Exchange_XKAC -> "XKAC"
        | FIX_Exchange_XNGO -> "XNGO"
        | FIX_Exchange_XNKS -> "XNKS"
        | FIX_Exchange_XSAP -> "XSAP"
        | FIX_Exchange_XTFF -> "XTFF"
        | FIX_Exchange_XTKT -> "XTKT"
        | FIX_Exchange_XAMM -> "XAMM"
        | FIX_Exchange_ETSC -> "ETSC"
        | FIX_Exchange_XKAZ -> "XKAZ"
        | FIX_Exchange_XNAI -> "XNAI"
        | FIX_Exchange_XKFB -> "XKFB"
        | FIX_Exchange_XKRX -> "XKRX"
        | FIX_Exchange_XKFE -> "XKFE"
        | FIX_Exchange_XKOS -> "XKOS"
        | FIX_Exchange_XKON -> "XKON"
        | FIX_Exchange_XKCM -> "XKCM"
        | FIX_Exchange_XKEM -> "XKEM"
        | FIX_Exchange_XKUW -> "XKUW"
        | FIX_Exchange_XKSE -> "XKSE"
        | FIX_Exchange_XLAO -> "XLAO"
        | FIX_Exchange_XRIS -> "XRIS"
        | FIX_Exchange_FNLV -> "FNLV"
        | FIX_Exchange_XBEY -> "XBEY"
        | FIX_Exchange_XLSM -> "XLSM"
        | FIX_Exchange_BAPX -> "BAPX"
        | FIX_Exchange_GETB -> "GETB"
        | FIX_Exchange_XLIT -> "XLIT"
        | FIX_Exchange_FNLT -> "FNLT"
        | FIX_Exchange_CCLX -> "CCLX"
        | FIX_Exchange_XLUX -> "XLUX"
        | FIX_Exchange_EMTF -> "EMTF"
        | FIX_Exchange_XVES -> "XVES"
        | FIX_Exchange_XMAE -> "XMAE"
        | FIX_Exchange_XMDG -> "XMDG"
        | FIX_Exchange_XMSW -> "XMSW"
        | FIX_Exchange_XKLS -> "XKLS"
        | FIX_Exchange_MESQ -> "MESQ"
        | FIX_Exchange_XLFX -> "XLFX"
        | FIX_Exchange_XRBM -> "XRBM"
        | FIX_Exchange_MALX -> "MALX"
        | FIX_Exchange_EWSM -> "EWSM"
        | FIX_Exchange_XMAL -> "XMAL"
        | FIX_Exchange_PROS -> "PROS"
        | FIX_Exchange_GBOT -> "GBOT"
        | FIX_Exchange_XAFX -> "XAFX"
        | FIX_Exchange_XMAU -> "XMAU"
        | FIX_Exchange_CGMX -> "CGMX"
        | FIX_Exchange_XEMD -> "XEMD"
        | FIX_Exchange_XMEX -> "XMEX"
        | FIX_Exchange_XMOL -> "XMOL"
        | FIX_Exchange_XULA -> "XULA"
        | FIX_Exchange_XMNX -> "XMNX"
        | FIX_Exchange_XCAS -> "XCAS"
        | FIX_Exchange_XBVM -> "XBVM"
        | FIX_Exchange_XNAM -> "XNAM"
        | FIX_Exchange_XNEP -> "XNEP"
        | FIX_Exchange_NZFX -> "NZFX"
        | FIX_Exchange_XNZE -> "XNZE"
        | FIX_Exchange_XMAN -> "XMAN"
        | FIX_Exchange_NASX -> "NASX"
        | FIX_Exchange_XNSA -> "XNSA"
        | FIX_Exchange_FISH -> "FISH"
        | FIX_Exchange_FSHX -> "FSHX"
        | FIX_Exchange_ICAS -> "ICAS"
        | FIX_Exchange_NEXO -> "NEXO"
        | FIX_Exchange_NOPS -> "NOPS"
        | FIX_Exchange_NORX -> "NORX"
        | FIX_Exchange_NOSC -> "NOSC"
        | FIX_Exchange_NOTC -> "NOTC"
        | FIX_Exchange_OSLC -> "OSLC"
        | FIX_Exchange_XIMA -> "XIMA"
        | FIX_Exchange_XOSL -> "XOSL"
        | FIX_Exchange_XOAM -> "XOAM"
        | FIX_Exchange_XOAS -> "XOAS"
        | FIX_Exchange_XOSC -> "XOSC"
        | FIX_Exchange_NIBR -> "NIBR"
        | FIX_Exchange_XOAD -> "XOAD"
        | FIX_Exchange_XOSD -> "XOSD"
        | FIX_Exchange_MERD -> "MERD"
        | FIX_Exchange_MERK -> "MERK"
        | FIX_Exchange_XMUS -> "XMUS"
        | FIX_Exchange_NCEL -> "NCEL"
        | FIX_Exchange_XISL -> "XISL"
        | FIX_Exchange_XKAR -> "XKAR"
        | FIX_Exchange_XLAH -> "XLAH"
        | FIX_Exchange_XPAE -> "XPAE"
        | FIX_Exchange_XPTY -> "XPTY"
        | FIX_Exchange_XPOM -> "XPOM"
        | FIX_Exchange_XVPA -> "XVPA"
        | FIX_Exchange_XLIM -> "XLIM"
        | FIX_Exchange_CLPH -> "CLPH"
        | FIX_Exchange_PDEX -> "PDEX"
        | FIX_Exchange_XPHS -> "XPHS"
        | FIX_Exchange_IENG -> "IENG"
        | FIX_Exchange_KDPW -> "KDPW"
        | FIX_Exchange_PTPG -> "PTPG"
        | FIX_Exchange_XWAR -> "XWAR"
        | FIX_Exchange_PLPX -> "PLPX"
        | FIX_Exchange_BOSP -> "BOSP"
        | FIX_Exchange_RPWC -> "RPWC"
        | FIX_Exchange_TBSP -> "TBSP"
        | FIX_Exchange_XNCO -> "XNCO"
        | FIX_Exchange_WBON -> "WBON"
        | FIX_Exchange_WDER -> "WDER"
        | FIX_Exchange_WETP -> "WETP"
        | FIX_Exchange_WGAS -> "WGAS"
        | FIX_Exchange_WIND -> "WIND"
        | FIX_Exchange_WMTF -> "WMTF"
        | FIX_Exchange_WBCL -> "WBCL"
        | FIX_Exchange_PLPD -> "PLPD"
        | FIX_Exchange_OMIC -> "OMIC"
        | FIX_Exchange_OPEX -> "OPEX"
        | FIX_Exchange_XLIS -> "XLIS"
        | FIX_Exchange_ALXL -> "ALXL"
        | FIX_Exchange_ENXL -> "ENXL"
        | FIX_Exchange_MFOX -> "MFOX"
        | FIX_Exchange_OMIP -> "OMIP"
        | FIX_Exchange_WQXL -> "WQXL"
        | FIX_Exchange_DSMD -> "DSMD"
        | FIX_Exchange_TRPX -> "TRPX"
        | FIX_Exchange_BMFX -> "BMFX"
        | FIX_Exchange_BMFA -> "BMFA"
        | FIX_Exchange_BMFM -> "BMFM"
        | FIX_Exchange_SBMF -> "SBMF"
        | FIX_Exchange_XBRM -> "XBRM"
        | FIX_Exchange_XBSE -> "XBSE"
        | FIX_Exchange_XBSD -> "XBSD"
        | FIX_Exchange_XCAN -> "XCAN"
        | FIX_Exchange_XRAS -> "XRAS"
        | FIX_Exchange_XRPM -> "XRPM"
        | FIX_Exchange_MISX -> "MISX"
        | FIX_Exchange_RTSX -> "RTSX"
        | FIX_Exchange_NAMX -> "NAMX"
        | FIX_Exchange_RPDX -> "RPDX"
        | FIX_Exchange_RUSX -> "RUSX"
        | FIX_Exchange_SPIM -> "SPIM"
        | FIX_Exchange_XMOS -> "XMOS"
        | FIX_Exchange_XPET -> "XPET"
        | FIX_Exchange_XPIC -> "XPIC"
        | FIX_Exchange_XRUS -> "XRUS"
        | FIX_Exchange_XSAM -> "XSAM"
        | FIX_Exchange_XSIB -> "XSIB"
        | FIX_Exchange_ROTC -> "ROTC"
        | FIX_Exchange_RSEX -> "RSEX"
        | FIX_Exchange_XECS -> "XECS"
        | FIX_Exchange_XSAU -> "XSAU"
        | FIX_Exchange_XBEL -> "XBEL"
        | FIX_Exchange_CLTD -> "CLTD"
        | FIX_Exchange_ECAL -> "ECAL"
        | FIX_Exchange_EEAL -> "EEAL"
        | FIX_Exchange_IFSG -> "IFSG"
        | FIX_Exchange_JADX -> "JADX"
        | FIX_Exchange_SMEX -> "SMEX"
        | FIX_Exchange_TFSA -> "TFSA"
        | FIX_Exchange_XSES -> "XSES"
        | FIX_Exchange_XSCE -> "XSCE"
        | FIX_Exchange_XSCA -> "XSCA"
        | FIX_Exchange_XSIM -> "XSIM"
        | FIX_Exchange_SPXE -> "SPXE"
        | FIX_Exchange_XBRA -> "XBRA"
        | FIX_Exchange_EBRA -> "EBRA"
        | FIX_Exchange_XLJU -> "XLJU"
        | FIX_Exchange_XLJM -> "XLJM"
        | FIX_Exchange_XSOP -> "XSOP"
        | FIX_Exchange_XJSE -> "XJSE"
        | FIX_Exchange_ALTX -> "ALTX"
        | FIX_Exchange_XBES -> "XBES"
        | FIX_Exchange_XSAF -> "XSAF"
        | FIX_Exchange_XSFA -> "XSFA"
        | FIX_Exchange_YLDX -> "YLDX"
        | FIX_Exchange_BMEX -> "BMEX"
        | FIX_Exchange_MABX -> "MABX"
        | FIX_Exchange_SEND -> "SEND"
        | FIX_Exchange_XBAR -> "XBAR"
        | FIX_Exchange_XBIL -> "XBIL"
        | FIX_Exchange_XDRF -> "XDRF"
        | FIX_Exchange_XLAT -> "XLAT"
        | FIX_Exchange_XMAD -> "XMAD"
        | FIX_Exchange_XMCE -> "XMCE"
        | FIX_Exchange_XMRV -> "XMRV"
        | FIX_Exchange_XVAL -> "XVAL"
        | FIX_Exchange_MERF -> "MERF"
        | FIX_Exchange_MARF -> "MARF"
        | FIX_Exchange_BMCL -> "BMCL"
        | FIX_Exchange_XMPW -> "XMPW"
        | FIX_Exchange_IBGH -> "IBGH"
        | FIX_Exchange_MIBG -> "MIBG"
        | FIX_Exchange_OMEL -> "OMEL"
        | FIX_Exchange_PAVE -> "PAVE"
        | FIX_Exchange_XDPA -> "XDPA"
        | FIX_Exchange_XNAF -> "XNAF"
        | FIX_Exchange_XCOL -> "XCOL"
        | FIX_Exchange_XKHA -> "XKHA"
        | FIX_Exchange_XSWA -> "XSWA"
        | FIX_Exchange_CRYD -> "CRYD"
        | FIX_Exchange_CRYX -> "CRYX"
        | FIX_Exchange_SEBX -> "SEBX"
        | FIX_Exchange_ENSX -> "ENSX"
        | FIX_Exchange_XNGM -> "XNGM"
        | FIX_Exchange_NMTF -> "NMTF"
        | FIX_Exchange_XNDX -> "XNDX"
        | FIX_Exchange_XNMR -> "XNMR"
        | FIX_Exchange_XSAT -> "XSAT"
        | FIX_Exchange_XSTO -> "XSTO"
        | FIX_Exchange_FNSE -> "FNSE"
        | FIX_Exchange_XOPV -> "XOPV"
        | FIX_Exchange_CSTO -> "CSTO"
        | FIX_Exchange_DSTO -> "DSTO"
        | FIX_Exchange_DNSE -> "DNSE"
        | FIX_Exchange_MSTO -> "MSTO"
        | FIX_Exchange_MNSE -> "MNSE"
        | FIX_Exchange_AIXE -> "AIXE"
        | FIX_Exchange_DOTS -> "DOTS"
        | FIX_Exchange_EUCH -> "EUCH"
        | FIX_Exchange_EUSP -> "EUSP"
        | FIX_Exchange_EURM -> "EURM"
        | FIX_Exchange_EUSC -> "EUSC"
        | FIX_Exchange_S3FM -> "S3FM"
        | FIX_Exchange_STOX -> "STOX"
        | FIX_Exchange_XSCU -> "XSCU"
        | FIX_Exchange_XSTV -> "XSTV"
        | FIX_Exchange_XSTX -> "XSTX"
        | FIX_Exchange_UBSG -> "UBSG"
        | FIX_Exchange_UBSF -> "UBSF"
        | FIX_Exchange_UBSC -> "UBSC"
        | FIX_Exchange_VLEX -> "VLEX"
        | FIX_Exchange_XBRN -> "XBRN"
        | FIX_Exchange_XSWX -> "XSWX"
        | FIX_Exchange_XQMH -> "XQMH"
        | FIX_Exchange_XVTX -> "XVTX"
        | FIX_Exchange_XBTR -> "XBTR"
        | FIX_Exchange_XICB -> "XICB"
        | FIX_Exchange_XSWM -> "XSWM"
        | FIX_Exchange_XSLS -> "XSLS"
        | FIX_Exchange_ZKBX -> "ZKBX"
        | FIX_Exchange_XDSE -> "XDSE"
        | FIX_Exchange_ROCO -> "ROCO"
        | FIX_Exchange_XTAF -> "XTAF"
        | FIX_Exchange_XTAI -> "XTAI"
        | FIX_Exchange_XDAR -> "XDAR"
        | FIX_Exchange_AFET -> "AFET"
        | FIX_Exchange_BEEX -> "BEEX"
        | FIX_Exchange_TFEX -> "TFEX"
        | FIX_Exchange_XBKK -> "XBKK"
        | FIX_Exchange_XBKF -> "XBKF"
        | FIX_Exchange_XMAI -> "XMAI"
        | FIX_Exchange_CLMX -> "CLMX"
        | FIX_Exchange_HCHC -> "HCHC"
        | FIX_Exchange_NDEX -> "NDEX"
        | FIX_Exchange_NDXS -> "NDXS"
        | FIX_Exchange_NLPX -> "NLPX"
        | FIX_Exchange_TOMX -> "TOMX"
        | FIX_Exchange_TOMD -> "TOMD"
        | FIX_Exchange_XAMS -> "XAMS"
        | FIX_Exchange_ALXA -> "ALXA"
        | FIX_Exchange_TNLA -> "TNLA"
        | FIX_Exchange_XEUC -> "XEUC"
        | FIX_Exchange_XEUE -> "XEUE"
        | FIX_Exchange_XEUI -> "XEUI"
        | FIX_Exchange_XEMS -> "XEMS"
        | FIX_Exchange_XNXC -> "XNXC"
        | FIX_Exchange_XTRN -> "XTRN"
        | FIX_Exchange_XTUN -> "XTUN"
        | FIX_Exchange_EXTR -> "EXTR"
        | FIX_Exchange_XEID -> "XEID"
        | FIX_Exchange_XEDA -> "XEDA"
        | FIX_Exchange_XIST -> "XIST"
        | FIX_Exchange_XFNO -> "XFNO"
        | FIX_Exchange_XEQY -> "XEQY"
        | FIX_Exchange_XDSM -> "XDSM"
        | FIX_Exchange_XPMS -> "XPMS"
        | FIX_Exchange_ULTX -> "ULTX"
        | FIX_Exchange_XUGA -> "XUGA"
        | FIX_Exchange_EESE -> "EESE"
        | FIX_Exchange_PFTS -> "PFTS"
        | FIX_Exchange_PFTQ -> "PFTQ"
        | FIX_Exchange_SEPE -> "SEPE"
        | FIX_Exchange_UKEX -> "UKEX"
        | FIX_Exchange_XDFB -> "XDFB"
        | FIX_Exchange_XKHR -> "XKHR"
        | FIX_Exchange_XKIE -> "XKIE"
        | FIX_Exchange_XKIS -> "XKIS"
        | FIX_Exchange_XODE -> "XODE"
        | FIX_Exchange_XPRI -> "XPRI"
        | FIX_Exchange_XUAX -> "XUAX"
        | FIX_Exchange_XUKR -> "XUKR"
        | FIX_Exchange_DGCX -> "DGCX"
        | FIX_Exchange_DIFX -> "DIFX"
        | FIX_Exchange_DUMX -> "DUMX"
        | FIX_Exchange_XADS -> "XADS"
        | FIX_Exchange_XDFM -> "XDFM"
        | FIX_Exchange_AQXE -> "AQXE"
        | FIX_Exchange_ARAX -> "ARAX"
        | FIX_Exchange_ATLB -> "ATLB"
        | FIX_Exchange_BALT -> "BALT"
        | FIX_Exchange_BLTX -> "BLTX"
        | FIX_Exchange_BCXE -> "BCXE"
        | FIX_Exchange_BATE -> "BATE"
        | FIX_Exchange_CHIX -> "CHIX"
        | FIX_Exchange_BATD -> "BATD"
        | FIX_Exchange_CHID -> "CHID"
        | FIX_Exchange_BATF -> "BATF"
        | FIX_Exchange_CHIO -> "CHIO"
        | FIX_Exchange_BOTC -> "BOTC"
        | FIX_Exchange_BATP -> "BATP"
        | FIX_Exchange_BARO -> "BARO"
        | FIX_Exchange_BARK -> "BARK"
        | FIX_Exchange_BART -> "BART"
        | FIX_Exchange_LISX -> "LISX"
        | FIX_Exchange_BGCI -> "BGCI"
        | FIX_Exchange_BGCB -> "BGCB"
        | FIX_Exchange_BLOX -> "BLOX"
        | FIX_Exchange_BMTF -> "BMTF"
        | FIX_Exchange_BOAT -> "BOAT"
        | FIX_Exchange_BOSC -> "BOSC"
        | FIX_Exchange_BRNX -> "BRNX"
        | FIX_Exchange_CCO2 -> "CCO2"
        | FIX_Exchange_CGME -> "CGME"
        | FIX_Exchange_CHEV -> "CHEV"
        | FIX_Exchange_BLNK -> "BLNK"
        | FIX_Exchange_CMEE -> "CMEE"
        | FIX_Exchange_CMEC -> "CMEC"
        | FIX_Exchange_CMED -> "CMED"
        | FIX_Exchange_CMMT -> "CMMT"
        | FIX_Exchange_CRYP -> "CRYP"
        | FIX_Exchange_CSEU -> "CSEU"
        | FIX_Exchange_CSCF -> "CSCF"
        | FIX_Exchange_DBIX -> "DBIX"
        | FIX_Exchange_DBDC -> "DBDC"
        | FIX_Exchange_DBCX -> "DBCX"
        | FIX_Exchange_DBCR -> "DBCR"
        | FIX_Exchange_DBMO -> "DBMO"
        | FIX_Exchange_DBSE -> "DBSE"
        | FIX_Exchange_EMBX -> "EMBX"
        | FIX_Exchange_ENCL -> "ENCL"
        | FIX_Exchange_EQLD -> "EQLD"
        | FIX_Exchange_EXEU -> "EXEU"
        | FIX_Exchange_EXMP -> "EXMP"
        | FIX_Exchange_EXOR -> "EXOR"
        | FIX_Exchange_EXVP -> "EXVP"
        | FIX_Exchange_EXBO -> "EXBO"
        | FIX_Exchange_EXSI -> "EXSI"
        | FIX_Exchange_EXCP -> "EXCP"
        | FIX_Exchange_EXLP -> "EXLP"
        | FIX_Exchange_EXDC -> "EXDC"
        | FIX_Exchange_FAIR -> "FAIR"
        | FIX_Exchange_GEMX -> "GEMX"
        | FIX_Exchange_GFIC -> "GFIC"
        | FIX_Exchange_GFIF -> "GFIF"
        | FIX_Exchange_GFIN -> "GFIN"
        | FIX_Exchange_GFIR -> "GFIR"
        | FIX_Exchange_GMEG -> "GMEG"
        | FIX_Exchange_XLDX -> "XLDX"
        | FIX_Exchange_XGDX -> "XGDX"
        | FIX_Exchange_XGSX -> "XGSX"
        | FIX_Exchange_XGCX -> "XGCX"
        | FIX_Exchange_GRIF -> "GRIF"
        | FIX_Exchange_GRSE -> "GRSE"
        | FIX_Exchange_GSIL -> "GSIL"
        | FIX_Exchange_GSSI -> "GSSI"
        | FIX_Exchange_GSBX -> "GSBX"
        | FIX_Exchange_HSXE -> "HSXE"
        | FIX_Exchange_IBAL -> "IBAL"
        | FIX_Exchange_ICAP -> "ICAP"
        | FIX_Exchange_ICAH -> "ICAH"
        | FIX_Exchange_BTEE -> "BTEE"
        | FIX_Exchange_ICEN -> "ICEN"
        | FIX_Exchange_ICSE -> "ICSE"
        | FIX_Exchange_ICTQ -> "ICTQ"
        | FIX_Exchange_WCLK -> "WCLK"
        | FIX_Exchange_ISDX -> "ISDX"
        | FIX_Exchange_EBSX -> "EBSX"
        | FIX_Exchange_NEXS -> "NEXS"
        | FIX_Exchange_IGDL -> "IGDL"
        | FIX_Exchange_IFEU -> "IFEU"
        | FIX_Exchange_CXRT -> "CXRT"
        | FIX_Exchange_IFLO -> "IFLO"
        | FIX_Exchange_IFLL -> "IFLL"
        | FIX_Exchange_IFUT -> "IFUT"
        | FIX_Exchange_IFLX -> "IFLX"
        | FIX_Exchange_IFEN -> "IFEN"
        | FIX_Exchange_ISWA -> "ISWA"
        | FIX_Exchange_JPSI -> "JPSI"
        | FIX_Exchange_KLEU -> "KLEU"
        | FIX_Exchange_LCUR -> "LCUR"
        | FIX_Exchange_LIQU -> "LIQU"
        | FIX_Exchange_LIQH -> "LIQH"
        | FIX_Exchange_LIQF -> "LIQF"
        | FIX_Exchange_LMAX -> "LMAX"
        | FIX_Exchange_LMAD -> "LMAD"
        | FIX_Exchange_LMAE -> "LMAE"
        | FIX_Exchange_LMAF -> "LMAF"
        | FIX_Exchange_LMAO -> "LMAO"
        | FIX_Exchange_LMEC -> "LMEC"
        | FIX_Exchange_LOTC -> "LOTC"
        | FIX_Exchange_PLDX -> "PLDX"
        | FIX_Exchange_LPPM -> "LPPM"
        | FIX_Exchange_MAEL -> "MAEL"
        | FIX_Exchange_MFGL -> "MFGL"
        | FIX_Exchange_MLXN -> "MLXN"
        | FIX_Exchange_MLAX -> "MLAX"
        | FIX_Exchange_MLEU -> "MLEU"
        | FIX_Exchange_MLVE -> "MLVE"
        | FIX_Exchange_MSIP -> "MSIP"
        | FIX_Exchange_MYTR -> "MYTR"
        | FIX_Exchange_N2EX -> "N2EX"
        | FIX_Exchange_NDCM -> "NDCM"
        | FIX_Exchange_NOFF -> "NOFF"
        | FIX_Exchange_NURO -> "NURO"
        | FIX_Exchange_XNLX -> "XNLX"
        | FIX_Exchange_NURD -> "NURD"
        | FIX_Exchange_NXEU -> "NXEU"
        | FIX_Exchange_OTCE -> "OTCE"
        | FIX_Exchange_PEEL -> "PEEL"
        | FIX_Exchange_XRSP -> "XRSP"
        | FIX_Exchange_XPHX -> "XPHX"
        | FIX_Exchange_PIEU -> "PIEU"
        | FIX_Exchange_PIRM -> "PIRM"
        | FIX_Exchange_QWIX -> "QWIX"
        | FIX_Exchange_RBCE -> "RBCE"
        | FIX_Exchange_RBSX -> "RBSX"
        | FIX_Exchange_RTSL -> "RTSL"
        | FIX_Exchange_SECF -> "SECF"
        | FIX_Exchange_SGMX -> "SGMX"
        | FIX_Exchange_SHAR -> "SHAR"
        | FIX_Exchange_SPEC -> "SPEC"
        | FIX_Exchange_SPRZ -> "SPRZ"
        | FIX_Exchange_SSEX -> "SSEX"
        | FIX_Exchange_SWAP -> "SWAP"
        | FIX_Exchange_TFSV -> "TFSV"
        | FIX_Exchange_TPIE -> "TPIE"
        | FIX_Exchange_TRDE -> "TRDE"
        | FIX_Exchange_TCDS -> "TCDS"
        | FIX_Exchange_TRDX -> "TRDX"
        | FIX_Exchange_VOLA -> "VOLA"
        | FIX_Exchange_TFSG -> "TFSG"
        | FIX_Exchange_PARX -> "PARX"
        | FIX_Exchange_ELIX -> "ELIX"
        | FIX_Exchange_EMCH -> "EMCH"
        | FIX_Exchange_TREU -> "TREU"
        | FIX_Exchange_TRQX -> "TRQX"
        | FIX_Exchange_TRQM -> "TRQM"
        | FIX_Exchange_UBSL -> "UBSL"
        | FIX_Exchange_UBSE -> "UBSE"
        | FIX_Exchange_UKGD -> "UKGD"
        | FIX_Exchange_UKPX -> "UKPX"
        | FIX_Exchange_VEGA -> "VEGA"
        | FIX_Exchange_WINS -> "WINS"
        | FIX_Exchange_XALT -> "XALT"
        | FIX_Exchange_XCOR -> "XCOR"
        | FIX_Exchange_XGCL -> "XGCL"
        | FIX_Exchange_XLBM -> "XLBM"
        | FIX_Exchange_XLCH -> "XLCH"
        | FIX_Exchange_XLDN -> "XLDN"
        | FIX_Exchange_XLME -> "XLME"
        | FIX_Exchange_XLON -> "XLON"
        | FIX_Exchange_XLOD -> "XLOD"
        | FIX_Exchange_XMTS -> "XMTS"
        | FIX_Exchange_HUNG -> "HUNG"
        | FIX_Exchange_PRME -> "PRME"
        | FIX_Exchange_AMTS -> "AMTS"
        | FIX_Exchange_EMTS -> "EMTS"
        | FIX_Exchange_GMTS -> "GMTS"
        | FIX_Exchange_IMTS -> "IMTS"
        | FIX_Exchange_MCZK -> "MCZK"
        | FIX_Exchange_MTSA -> "MTSA"
        | FIX_Exchange_MTSG -> "MTSG"
        | FIX_Exchange_MTSS -> "MTSS"
        | FIX_Exchange_RMTS -> "RMTS"
        | FIX_Exchange_SMTS -> "SMTS"
        | FIX_Exchange_VMTS -> "VMTS"
        | FIX_Exchange_BVUK -> "BVUK"
        | FIX_Exchange_PORT -> "PORT"
        | FIX_Exchange_MTSW -> "MTSW"
        | FIX_Exchange_XSGA -> "XSGA"
        | FIX_Exchange_XSMP -> "XSMP"
        | FIX_Exchange_XSWB -> "XSWB"
        | FIX_Exchange_XTUP -> "XTUP"
        | FIX_Exchange_TPEQ -> "TPEQ"
        | FIX_Exchange_TBEN -> "TBEN"
        | FIX_Exchange_TBLA -> "TBLA"
        | FIX_Exchange_TPCD -> "TPCD"
        | FIX_Exchange_TPFD -> "TPFD"
        | FIX_Exchange_TPRE -> "TPRE"
        | FIX_Exchange_TPSD -> "TPSD"
        | FIX_Exchange_XTPE -> "XTPE"
        | FIX_Exchange_TPEL -> "TPEL"
        | FIX_Exchange_TPSL -> "TPSL"
        | FIX_Exchange_XUBS -> "XUBS"
        | FIX_Exchange_AATS -> "AATS"
        | FIX_Exchange_AQUA -> "AQUA"
        | FIX_Exchange_ATDF -> "ATDF"
        | FIX_Exchange_CORE -> "CORE"
        | FIX_Exchange_BAML -> "BAML"
        | FIX_Exchange_MLVX -> "MLVX"
        | FIX_Exchange_MLCO -> "MLCO"
        | FIX_Exchange_BARX -> "BARX"
        | FIX_Exchange_BARD -> "BARD"
        | FIX_Exchange_BARL -> "BARL"
        | FIX_Exchange_BCDX -> "BCDX"
        | FIX_Exchange_BATS -> "BATS"
        | FIX_Exchange_BATO -> "BATO"
        | FIX_Exchange_BATY -> "BATY"
        | FIX_Exchange_BZXD -> "BZXD"
        | FIX_Exchange_BYXD -> "BYXD"
        | FIX_Exchange_BBSF -> "BBSF"
        | FIX_Exchange_BGCF -> "BGCF"
        | FIX_Exchange_BGCD -> "BGCD"
        | FIX_Exchange_BHSF -> "BHSF"
        | FIX_Exchange_BIDS -> "BIDS"
        | FIX_Exchange_BLTD -> "BLTD"
        | FIX_Exchange_BPOL -> "BPOL"
        | FIX_Exchange_BNYC -> "BNYC"
        | FIX_Exchange_VTEX -> "VTEX"
        | FIX_Exchange_NYFX -> "NYFX"
        | FIX_Exchange_BTEC -> "BTEC"
        | FIX_Exchange_ICSU -> "ICSU"
        | FIX_Exchange_CDED -> "CDED"
        | FIX_Exchange_CGMI -> "CGMI"
        | FIX_Exchange_CGMU -> "CGMU"
        | FIX_Exchange_CICX -> "CICX"
        | FIX_Exchange_LQFI -> "LQFI"
        | FIX_Exchange_CBLC -> "CBLC"
        | FIX_Exchange_CMSF -> "CMSF"
        | FIX_Exchange_CRED -> "CRED"
        | FIX_Exchange_CAES -> "CAES"
        | FIX_Exchange_CSLP -> "CSLP"
        | FIX_Exchange_DBSX -> "DBSX"
        | FIX_Exchange_DEAL -> "DEAL"
        | FIX_Exchange_EDGE -> "EDGE"
        | FIX_Exchange_EDDP -> "EDDP"
        | FIX_Exchange_EDGA -> "EDGA"
        | FIX_Exchange_EDGD -> "EDGD"
        | FIX_Exchange_EDGX -> "EDGX"
        | FIX_Exchange_EDGO -> "EDGO"
        | FIX_Exchange_EGMT -> "EGMT"
        | FIX_Exchange_ERIS -> "ERIS"
        | FIX_Exchange_FAST -> "FAST"
        | FIX_Exchange_FINR -> "FINR"
        | FIX_Exchange_FINN -> "FINN"
        | FIX_Exchange_FINO -> "FINO"
        | FIX_Exchange_FINY -> "FINY"
        | FIX_Exchange_XADF -> "XADF"
        | FIX_Exchange_OOTC -> "OOTC"
        | FIX_Exchange_FSEF -> "FSEF"
        | FIX_Exchange_FXAL -> "FXAL"
        | FIX_Exchange_FXCM -> "FXCM"
        | FIX_Exchange_G1XX -> "G1XX"
        | FIX_Exchange_GLLC -> "GLLC"
        | FIX_Exchange_GLPS -> "GLPS"
        | FIX_Exchange_GLPX -> "GLPX"
        | FIX_Exchange_GOVX -> "GOVX"
        | FIX_Exchange_GREE -> "GREE"
        | FIX_Exchange_GSEF -> "GSEF"
        | FIX_Exchange_GTCO -> "GTCO"
        | FIX_Exchange_GTXS -> "GTXS"
        | FIX_Exchange_HEGX -> "HEGX"
        | FIX_Exchange_HPPO -> "HPPO"
        | FIX_Exchange_HSFX -> "HSFX"
        | FIX_Exchange_ICEL -> "ICEL"
        | FIX_Exchange_IEXG -> "IEXG"
        | FIX_Exchange_IFUS -> "IFUS"
        | FIX_Exchange_IEPA -> "IEPA"
        | FIX_Exchange_IMFX -> "IMFX"
        | FIX_Exchange_IMAG -> "IMAG"
        | FIX_Exchange_IMBD -> "IMBD"
        | FIX_Exchange_IMCO -> "IMCO"
        | FIX_Exchange_IMCR -> "IMCR"
        | FIX_Exchange_IMEN -> "IMEN"
        | FIX_Exchange_IMEQ -> "IMEQ"
        | FIX_Exchange_IMIR -> "IMIR"
        | FIX_Exchange_IFED -> "IFED"
        | FIX_Exchange_IMCG -> "IMCG"
        | FIX_Exchange_IMCC -> "IMCC"
        | FIX_Exchange_ICES -> "ICES"
        | FIX_Exchange_ISDA -> "ISDA"
        | FIX_Exchange_ITGI -> "ITGI"
        | FIX_Exchange_JEFX -> "JEFX"
        | FIX_Exchange_JPBX -> "JPBX"
        | FIX_Exchange_JPMX -> "JPMX"
        | FIX_Exchange_JSES -> "JSES"
        | FIX_Exchange_JSJX -> "JSJX"
        | FIX_Exchange_KNIG -> "KNIG"
        | FIX_Exchange_KNCM -> "KNCM"
        | FIX_Exchange_KNEM -> "KNEM"
        | FIX_Exchange_KNLI -> "KNLI"
        | FIX_Exchange_KNMX -> "KNMX"
        | FIX_Exchange_LASF -> "LASF"
        | FIX_Exchange_LEVL -> "LEVL"
        | FIX_Exchange_LIUS -> "LIUS"
        | FIX_Exchange_LIUH -> "LIUH"
        | FIX_Exchange_LIFI -> "LIFI"
        | FIX_Exchange_LQED -> "LQED"
        | FIX_Exchange_LTAA -> "LTAA"
        | FIX_Exchange_LMNX -> "LMNX"
        | FIX_Exchange_MIHI -> "MIHI"
        | FIX_Exchange_XMIO -> "XMIO"
        | FIX_Exchange_MPRL -> "MPRL"
        | FIX_Exchange_MSCO -> "MSCO"
        | FIX_Exchange_MSPL -> "MSPL"
        | FIX_Exchange_MSRP -> "MSRP"
        | FIX_Exchange_MSTX -> "MSTX"
        | FIX_Exchange_MSLP -> "MSLP"
        | FIX_Exchange_MTUS -> "MTUS"
        | FIX_Exchange_BVUS -> "BVUS"
        | FIX_Exchange_MTSB -> "MTSB"
        | FIX_Exchange_MTXX -> "MTXX"
        | FIX_Exchange_MTXM -> "MTXM"
        | FIX_Exchange_MTXC -> "MTXC"
        | FIX_Exchange_MTXS -> "MTXS"
        | FIX_Exchange_MTXA -> "MTXA"
        | FIX_Exchange_NBLX -> "NBLX"
        | FIX_Exchange_NFSC -> "NFSC"
        | FIX_Exchange_NFSA -> "NFSA"
        | FIX_Exchange_NFSD -> "NFSD"
        | FIX_Exchange_XSTM -> "XSTM"
        | FIX_Exchange_NMRA -> "NMRA"
        | FIX_Exchange_NODX -> "NODX"
        | FIX_Exchange_NXUS -> "NXUS"
        | FIX_Exchange_NYPC -> "NYPC"
        | FIX_Exchange_OLLC -> "OLLC"
        | FIX_Exchange_OPRA -> "OPRA"
        | FIX_Exchange_OTCM -> "OTCM"
        | FIX_Exchange_OTCB -> "OTCB"
        | FIX_Exchange_OTCQ -> "OTCQ"
        | FIX_Exchange_PINC -> "PINC"
        | FIX_Exchange_PINI -> "PINI"
        | FIX_Exchange_PINL -> "PINL"
        | FIX_Exchange_PINX -> "PINX"
        | FIX_Exchange_PSGM -> "PSGM"
        | FIX_Exchange_CAVE -> "CAVE"
        | FIX_Exchange_PDQX -> "PDQX"
        | FIX_Exchange_PDQD -> "PDQD"
        | FIX_Exchange_PIPE -> "PIPE"
        | FIX_Exchange_PRSE -> "PRSE"
        | FIX_Exchange_PULX -> "PULX"
        | FIX_Exchange_RICX -> "RICX"
        | FIX_Exchange_RICD -> "RICD"
        | FIX_Exchange_SCXS -> "SCXS"
        | FIX_Exchange_SGMA -> "SGMA"
        | FIX_Exchange_SGMT -> "SGMT"
        | FIX_Exchange_SHAW -> "SHAW"
        | FIX_Exchange_SHAD -> "SHAD"
        | FIX_Exchange_SOHO -> "SOHO"
        | FIX_Exchange_SSTX -> "SSTX"
        | FIX_Exchange_TERA -> "TERA"
        | FIX_Exchange_TFSU -> "TFSU"
        | FIX_Exchange_THRE -> "THRE"
        | FIX_Exchange_TPSE -> "TPSE"
        | FIX_Exchange_TRCK -> "TRCK"
        | FIX_Exchange_TRUX -> "TRUX"
        | FIX_Exchange_TRU1 -> "TRU1"
        | FIX_Exchange_TRU2 -> "TRU2"
        | FIX_Exchange_TRWB -> "TRWB"
        | FIX_Exchange_BNDD -> "BNDD"
        | FIX_Exchange_TWSF -> "TWSF"
        | FIX_Exchange_DWSF -> "DWSF"
        | FIX_Exchange_TSBX -> "TSBX"
        | FIX_Exchange_TSEF -> "TSEF"
        | FIX_Exchange_UBSA -> "UBSA"
        | FIX_Exchange_UBSP -> "UBSP"
        | FIX_Exchange_VFCM -> "VFCM"
        | FIX_Exchange_WELX -> "WELX"
        | FIX_Exchange_WSAG -> "WSAG"
        | FIX_Exchange_XAQS -> "XAQS"
        | FIX_Exchange_XBOX -> "XBOX"
        | FIX_Exchange_XCBO -> "XCBO"
        | FIX_Exchange_C2OX -> "C2OX"
        | FIX_Exchange_CBSX -> "CBSX"
        | FIX_Exchange_XCBF -> "XCBF"
        | FIX_Exchange_XCBT -> "XCBT"
        | FIX_Exchange_FCBT -> "FCBT"
        | FIX_Exchange_XKBT -> "XKBT"
        | FIX_Exchange_XCFF -> "XCFF"
        | FIX_Exchange_XCHI -> "XCHI"
        | FIX_Exchange_XCIS -> "XCIS"
        | FIX_Exchange_XCME -> "XCME"
        | FIX_Exchange_FCME -> "FCME"
        | FIX_Exchange_GLBX -> "GLBX"
        | FIX_Exchange_XIMM -> "XIMM"
        | FIX_Exchange_XIOM -> "XIOM"
        | FIX_Exchange_CMES -> "CMES"
        | FIX_Exchange_CBTS -> "CBTS"
        | FIX_Exchange_CECS -> "CECS"
        | FIX_Exchange_NYMS -> "NYMS"
        | FIX_Exchange_XCUR -> "XCUR"
        | FIX_Exchange_XELX -> "XELX"
        | FIX_Exchange_XFCI -> "XFCI"
        | FIX_Exchange_XGMX -> "XGMX"
        | FIX_Exchange_XINS -> "XINS"
        | FIX_Exchange_IBLX -> "IBLX"
        | FIX_Exchange_ICBX -> "ICBX"
        | FIX_Exchange_ICRO -> "ICRO"
        | FIX_Exchange_IIDX -> "IIDX"
        | FIX_Exchange_RCBX -> "RCBX"
        | FIX_Exchange_MOCX -> "MOCX"
        | FIX_Exchange_XISX -> "XISX"
        | FIX_Exchange_XISA -> "XISA"
        | FIX_Exchange_XISE -> "XISE"
        | FIX_Exchange_GMNI -> "GMNI"
        | FIX_Exchange_MCRY -> "MCRY"
        | FIX_Exchange_XMER -> "XMER"
        | FIX_Exchange_XMGE -> "XMGE"
        | FIX_Exchange_XNAS -> "XNAS"
        | FIX_Exchange_XBXO -> "XBXO"
        | FIX_Exchange_BOSD -> "BOSD"
        | FIX_Exchange_NASD -> "NASD"
        | FIX_Exchange_XBRT -> "XBRT"
        | FIX_Exchange_XNCM -> "XNCM"
        | FIX_Exchange_XNDQ -> "XNDQ"
        | FIX_Exchange_XNGS -> "XNGS"
        | FIX_Exchange_XNIM -> "XNIM"
        | FIX_Exchange_XNMS -> "XNMS"
        | FIX_Exchange_XPBT -> "XPBT"
        | FIX_Exchange_XPHL -> "XPHL"
        | FIX_Exchange_XPHO -> "XPHO"
        | FIX_Exchange_XPOR -> "XPOR"
        | FIX_Exchange_XPSX -> "XPSX"
        | FIX_Exchange_XBOS -> "XBOS"
        | FIX_Exchange_ESPD -> "ESPD"
        | FIX_Exchange_XNYM -> "XNYM"
        | FIX_Exchange_XCEC -> "XCEC"
        | FIX_Exchange_XNYE -> "XNYE"
        | FIX_Exchange_XNYL -> "XNYL"
        | FIX_Exchange_XNYS -> "XNYS"
        | FIX_Exchange_ALDP -> "ALDP"
        | FIX_Exchange_AMXO -> "AMXO"
        | FIX_Exchange_ARCD -> "ARCD"
        | FIX_Exchange_ARCO -> "ARCO"
        | FIX_Exchange_ARCX -> "ARCX"
        | FIX_Exchange_NYSD -> "NYSD"
        | FIX_Exchange_XASE -> "XASE"
        | FIX_Exchange_XNLI -> "XNLI"
        | FIX_Exchange_XOCH -> "XOCH"
        | FIX_Exchange_XOTC -> "XOTC"
        | FIX_Exchange_XSEF -> "XSEF"
        | FIX_Exchange_XWEE -> "XWEE"
        | FIX_Exchange_BVUR -> "BVUR"
        | FIX_Exchange_UFEX -> "UFEX"
        | FIX_Exchange_XMNT -> "XMNT"
        | FIX_Exchange_XCET -> "XCET"
        | FIX_Exchange_XCUE -> "XCUE"
        | FIX_Exchange_XKCE -> "XKCE"
        | FIX_Exchange_XSTE -> "XSTE"
        | FIX_Exchange_XUNI -> "XUNI"
        | FIX_Exchange_GXMA -> "GXMA"
        | FIX_Exchange_BVCA -> "BVCA"
        | FIX_Exchange_HSTC -> "HSTC"
        | FIX_Exchange_XHNX -> "XHNX"
        | FIX_Exchange_XSTC -> "XSTC"
        | FIX_Exchange_XLUS -> "XLUS"
        | FIX_Exchange_XZIM -> "XZIM"
        | FIX_Exchange_XOFF -> "XOFF"
        | FIX_Exchange_XXXX -> "XXXX"
;;

let accounttype_to_json ( d ) : json =
    `String (accounttype_to_string d)
;;

let acctidsource_to_json ( d ) : json =
    `String (acctidsource_to_string d)
;;

let adjustment_to_json ( d ) : json =
    `String (adjustment_to_string d)
;;

let adjustmenttype_to_json ( d ) : json =
    `String (adjustmenttype_to_string d)
;;

let advside_to_json ( d ) : json =
    `String (advside_to_string d)
;;

let advtranstype_to_json ( d ) : json =
    `String (advtranstype_to_string d)
;;

let affirmstatus_to_json ( d ) : json =
    `String (affirmstatus_to_string d)
;;

let aggregatedbook_to_json ( d ) : json =
    `String (aggregatedbook_to_string d)
;;

let allocaccounttype_to_json ( d ) : json =
    `String (allocaccounttype_to_string d)
;;

let alloccancreplacereason_to_json ( d ) : json =
    `String (alloccancreplacereason_to_string d)
;;

let allochandlinst_to_json ( d ) : json =
    `String (allochandlinst_to_string d)
;;

let allocintermedreqtype_to_json ( d ) : json =
    `String (allocintermedreqtype_to_string d)
;;

let alloclinktype_to_json ( d ) : json =
    `String (alloclinktype_to_string d)
;;

let allocnoorderstype_to_json ( d ) : json =
    `String (allocnoorderstype_to_string d)
;;

let allocrejcode_to_json ( d ) : json =
    `String (allocrejcode_to_string d)
;;

let allocreporttype_to_json ( d ) : json =
    `String (allocreporttype_to_string d)
;;

let allocsettlinsttype_to_json ( d ) : json =
    `String (allocsettlinsttype_to_string d)
;;

let allocstatus_to_json ( d ) : json =
    `String (allocstatus_to_string d)
;;

let alloctranstype_to_json ( d ) : json =
    `String (alloctranstype_to_string d)
;;

let alloctype_to_json ( d ) : json =
    `String (alloctype_to_string d)
;;

let applqueueaction_to_json ( d ) : json =
    `String (applqueueaction_to_string d)
;;

let applqueueresolution_to_json ( d ) : json =
    `String (applqueueresolution_to_string d)
;;

let assignmentmethod_to_json ( d ) : json =
    `String (assignmentmethod_to_string d)
;;

let avgpxindicator_to_json ( d ) : json =
    `String (avgpxindicator_to_string d)
;;

let basispxtype_to_json ( d ) : json =
    `String (basispxtype_to_string d)
;;

let biddescriptortype_to_json ( d ) : json =
    `String (biddescriptortype_to_string d)
;;

let bidrequesttranstype_to_json ( d ) : json =
    `String (bidrequesttranstype_to_string d)
;;

let bidtradetype_to_json ( d ) : json =
    `String (bidtradetype_to_string d)
;;

let bidtype_to_json ( d ) : json =
    `String (bidtype_to_string d)
;;

let bookingtype_to_json ( d ) : json =
    `String (bookingtype_to_string d)
;;

let bookingunit_to_json ( d ) : json =
    `String (bookingunit_to_string d)
;;

let businessrejectreason_to_json ( d ) : json =
    `String (businessrejectreason_to_string d)
;;

let cpprogram_to_json ( d ) : json =
    `String (cpprogram_to_string d)
;;

let cancellationrights_to_json ( d ) : json =
    `String (cancellationrights_to_string d)
;;

let cashmargin_to_json ( d ) : json =
    `String (cashmargin_to_string d)
;;

let clearingfeeindicator_to_json ( d ) : json =
    `String (clearingfeeindicator_to_string d)
;;

let clearinginstruction_to_json ( d ) : json =
    `String (clearinginstruction_to_string d)
;;

let collaction_to_json ( d ) : json =
    `String (collaction_to_string d)
;;

let collasgnreason_to_json ( d ) : json =
    `String (collasgnreason_to_string d)
;;

let collasgnrejectreason_to_json ( d ) : json =
    `String (collasgnrejectreason_to_string d)
;;

let collasgnresptype_to_json ( d ) : json =
    `String (collasgnresptype_to_string d)
;;

let collasgntranstype_to_json ( d ) : json =
    `String (collasgntranstype_to_string d)
;;

let collinquiryqualifier_to_json ( d ) : json =
    `String (collinquiryqualifier_to_string d)
;;

let collinquiryresult_to_json ( d ) : json =
    `String (collinquiryresult_to_string d)
;;

let collinquirystatus_to_json ( d ) : json =
    `String (collinquirystatus_to_string d)
;;

let collstatus_to_json ( d ) : json =
    `String (collstatus_to_string d)
;;

let commtype_to_json ( d ) : json =
    `String (commtype_to_string d)
;;

let confirmrejreason_to_json ( d ) : json =
    `String (confirmrejreason_to_string d)
;;

let confirmstatus_to_json ( d ) : json =
    `String (confirmstatus_to_string d)
;;

let confirmtranstype_to_json ( d ) : json =
    `String (confirmtranstype_to_string d)
;;

let confirmtype_to_json ( d ) : json =
    `String (confirmtype_to_string d)
;;

let contamttype_to_json ( d ) : json =
    `String (contamttype_to_string d)
;;

let corporateaction_to_json ( d ) : json =
    `String (corporateaction_to_string d)
;;

let coveredoruncovered_to_json ( d ) : json =
    `String (coveredoruncovered_to_string d)
;;

let crossprioritization_to_json ( d ) : json =
    `String (crossprioritization_to_string d)
;;

let crosstype_to_json ( d ) : json =
    `String (crosstype_to_string d)
;;

let custordercapacity_to_json ( d ) : json =
    `String (custordercapacity_to_string d)
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

let daybookinginst_to_json ( d ) : json =
    `String (daybookinginst_to_string d)
;;

let deletereason_to_json ( d ) : json =
    `String (deletereason_to_string d)
;;

let deliveryform_to_json ( d ) : json =
    `String (deliveryform_to_string d)
;;

let deliverytype_to_json ( d ) : json =
    `String (deliverytype_to_string d)
;;

let discretioninst_to_json ( d ) : json =
    `String (discretioninst_to_string d)
;;

let discretionlimittype_to_json ( d ) : json =
    `String (discretionlimittype_to_string d)
;;

let discretionmovetype_to_json ( d ) : json =
    `String (discretionmovetype_to_string d)
;;

let discretionoffsettype_to_json ( d ) : json =
    `String (discretionoffsettype_to_string d)
;;

let discretionrounddirection_to_json ( d ) : json =
    `String (discretionrounddirection_to_string d)
;;

let discretionscope_to_json ( d ) : json =
    `String (discretionscope_to_string d)
;;

let distribpaymentmethod_to_json ( d ) : json =
    `String (distribpaymentmethod_to_string d)
;;

let dlvyinsttype_to_json ( d ) : json =
    `String (dlvyinsttype_to_string d)
;;

let duetorelated_to_json ( d ) : json =
    `String (duetorelated_to_string d)
;;

let emailtype_to_json ( d ) : json =
    `String (emailtype_to_string d)
;;

let encryptmethod_to_json ( d ) : json =
    `String (encryptmethod_to_string d)
;;

let eventtype_to_json ( d ) : json =
    `String (eventtype_to_string d)
;;

let exchangeforphysical_to_json ( d ) : json =
    `String (exchangeforphysical_to_string d)
;;

let execinst_to_json ( d ) : json =
    `String (execinst_to_string d)
;;

let execpricetype_to_json ( d ) : json =
    `String (execpricetype_to_string d)
;;

let execrestatementreason_to_json ( d ) : json =
    `String (execrestatementreason_to_string d)
;;

let exectype_to_json ( d ) : json =
    `String (exectype_to_string d)
;;

let exercisemethod_to_json ( d ) : json =
    `String (exercisemethod_to_string d)
;;

let expirationcycle_to_json ( d ) : json =
    `String (expirationcycle_to_string d)
;;

let financialstatus_to_json ( d ) : json =
    `String (financialstatus_to_string d)
;;

let forexreq_to_json ( d ) : json =
    `String (forexreq_to_string d)
;;

let fundrenewwaiv_to_json ( d ) : json =
    `String (fundrenewwaiv_to_string d)
;;

let gtbookinginst_to_json ( d ) : json =
    `String (gtbookinginst_to_string d)
;;

let gapfillflag_to_json ( d ) : json =
    `String (gapfillflag_to_string d)
;;

let haltreason_to_json ( d ) : json =
    `String (haltreason_to_string d)
;;

let handlinst_to_json ( d ) : json =
    `String (handlinst_to_string d)
;;

let ioinaturalflag_to_json ( d ) : json =
    `String (ioinaturalflag_to_string d)
;;

let ioiqltyind_to_json ( d ) : json =
    `String (ioiqltyind_to_string d)
;;

let ioiqty_to_json ( d ) : json =
    `String (ioiqty_to_string d)
;;

let ioiqualifier_to_json ( d ) : json =
    `String (ioiqualifier_to_string d)
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

let instrattribtype_to_json ( d ) : json =
    `String (instrattribtype_to_string d)
;;

let lastcapacity_to_json ( d ) : json =
    `String (lastcapacity_to_string d)
;;

let lastfragment_to_json ( d ) : json =
    `String (lastfragment_to_string d)
;;

let lastliquidityind_to_json ( d ) : json =
    `String (lastliquidityind_to_string d)
;;

let legswaptype_to_json ( d ) : json =
    `String (legswaptype_to_string d)
;;

let legalconfirm_to_json ( d ) : json =
    `String (legalconfirm_to_string d)
;;

let liquidityindtype_to_json ( d ) : json =
    `String (liquidityindtype_to_string d)
;;

let listexecinsttype_to_json ( d ) : json =
    `String (listexecinsttype_to_string d)
;;

let listorderstatus_to_json ( d ) : json =
    `String (listorderstatus_to_string d)
;;

let liststatustype_to_json ( d ) : json =
    `String (liststatustype_to_string d)
;;

let locatereqd_to_json ( d ) : json =
    `String (locatereqd_to_string d)
;;

let mdentrytype_to_json ( d ) : json =
    `String (mdentrytype_to_string d)
;;

let mdimplicitdelete_to_json ( d ) : json =
    `String (mdimplicitdelete_to_string d)
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

let masscancelrejectreason_to_json ( d ) : json =
    `String (masscancelrejectreason_to_string d)
;;

let masscancelrequesttype_to_json ( d ) : json =
    `String (masscancelrequesttype_to_string d)
;;

let masscancelresponse_to_json ( d ) : json =
    `String (masscancelresponse_to_string d)
;;

let massstatusreqtype_to_json ( d ) : json =
    `String (massstatusreqtype_to_string d)
;;

let matchstatus_to_json ( d ) : json =
    `String (matchstatus_to_string d)
;;

let matchtype_to_json ( d ) : json =
    `String (matchtype_to_string d)
;;

let messageencoding_to_json ( d ) : json =
    `String (messageencoding_to_string d)
;;

let miscfeebasis_to_json ( d ) : json =
    `String (miscfeebasis_to_string d)
;;

let miscfeetype_to_json ( d ) : json =
    `String (miscfeetype_to_string d)
;;

let moneylaunderingstatus_to_json ( d ) : json =
    `String (moneylaunderingstatus_to_string d)
;;

let msgdirection_to_json ( d ) : json =
    `String (msgdirection_to_string d)
;;

let msgtype_to_json ( d ) : json =
    `String (msgtype_to_string d)
;;

let multilegreportingtype_to_json ( d ) : json =
    `String (multilegreportingtype_to_string d)
;;

let multilegrpttypereq_to_json ( d ) : json =
    `String (multilegrpttypereq_to_string d)
;;

let netgrossind_to_json ( d ) : json =
    `String (netgrossind_to_string d)
;;

let networkrequesttype_to_json ( d ) : json =
    `String (networkrequesttype_to_string d)
;;

let networkstatusresponsetype_to_json ( d ) : json =
    `String (networkstatusresponsetype_to_string d)
;;

let nosides_to_json ( d ) : json =
    `String (nosides_to_string d)
;;

let notifybrokerofcredit_to_json ( d ) : json =
    `String (notifybrokerofcredit_to_string d)
;;

let oddlot_to_json ( d ) : json =
    `String (oddlot_to_string d)
;;

let openclosesettlflag_to_json ( d ) : json =
    `String (openclosesettlflag_to_string d)
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

let ordercapacity_to_json ( d ) : json =
    `String (ordercapacity_to_string d)
;;

let orderrestrictions_to_json ( d ) : json =
    `String (orderrestrictions_to_string d)
;;

let ownertype_to_json ( d ) : json =
    `String (ownertype_to_string d)
;;

let ownershiptype_to_json ( d ) : json =
    `String (ownershiptype_to_string d)
;;

let partyidsource_to_json ( d ) : json =
    `String (partyidsource_to_string d)
;;

let partyrole_to_json ( d ) : json =
    `String (partyrole_to_string d)
;;

let partysubidtype_to_json ( d ) : json =
    `String (partysubidtype_to_string d)
;;

let paymentmethod_to_json ( d ) : json =
    `String (paymentmethod_to_string d)
;;

let peglimittype_to_json ( d ) : json =
    `String (peglimittype_to_string d)
;;

let pegmovetype_to_json ( d ) : json =
    `String (pegmovetype_to_string d)
;;

let pegoffsettype_to_json ( d ) : json =
    `String (pegoffsettype_to_string d)
;;

let pegrounddirection_to_json ( d ) : json =
    `String (pegrounddirection_to_string d)
;;

let pegscope_to_json ( d ) : json =
    `String (pegscope_to_string d)
;;

let posamttype_to_json ( d ) : json =
    `String (posamttype_to_string d)
;;

let posmaintaction_to_json ( d ) : json =
    `String (posmaintaction_to_string d)
;;

let posmaintresult_to_json ( d ) : json =
    `String (posmaintresult_to_string d)
;;

let posmaintstatus_to_json ( d ) : json =
    `String (posmaintstatus_to_string d)
;;

let posqtystatus_to_json ( d ) : json =
    `String (posqtystatus_to_string d)
;;

let posreqresult_to_json ( d ) : json =
    `String (posreqresult_to_string d)
;;

let posreqstatus_to_json ( d ) : json =
    `String (posreqstatus_to_string d)
;;

let posreqtype_to_json ( d ) : json =
    `String (posreqtype_to_string d)
;;

let postranstype_to_json ( d ) : json =
    `String (postranstype_to_string d)
;;

let postype_to_json ( d ) : json =
    `String (postype_to_string d)
;;

let positioneffect_to_json ( d ) : json =
    `String (positioneffect_to_string d)
;;

let possdupflag_to_json ( d ) : json =
    `String (possdupflag_to_string d)
;;

let possresend_to_json ( d ) : json =
    `String (possresend_to_string d)
;;

let preallocmethod_to_json ( d ) : json =
    `String (preallocmethod_to_string d)
;;

let previouslyreported_to_json ( d ) : json =
    `String (previouslyreported_to_string d)
;;

let pricetype_to_json ( d ) : json =
    `String (pricetype_to_string d)
;;

let priorityindicator_to_json ( d ) : json =
    `String (priorityindicator_to_string d)
;;

let processcode_to_json ( d ) : json =
    `String (processcode_to_string d)
;;

let product_to_json ( d ) : json =
    `String (product_to_string d)
;;

let progrptreqs_to_json ( d ) : json =
    `String (progrptreqs_to_string d)
;;

let publishtrdindicator_to_json ( d ) : json =
    `String (publishtrdindicator_to_string d)
;;

let putorcall_to_json ( d ) : json =
    `String (putorcall_to_string d)
;;

let qtytype_to_json ( d ) : json =
    `String (qtytype_to_string d)
;;

let quotecanceltype_to_json ( d ) : json =
    `String (quotecanceltype_to_string d)
;;

let quotecondition_to_json ( d ) : json =
    `String (quotecondition_to_string d)
;;

let quotepricetype_to_json ( d ) : json =
    `String (quotepricetype_to_string d)
;;

let quoterejectreason_to_json ( d ) : json =
    `String (quoterejectreason_to_string d)
;;

let quoterequestrejectreason_to_json ( d ) : json =
    `String (quoterequestrejectreason_to_string d)
;;

let quoterequesttype_to_json ( d ) : json =
    `String (quoterequesttype_to_string d)
;;

let quoteresptype_to_json ( d ) : json =
    `String (quoteresptype_to_string d)
;;

let quoteresponselevel_to_json ( d ) : json =
    `String (quoteresponselevel_to_string d)
;;

let quotestatus_to_json ( d ) : json =
    `String (quotestatus_to_string d)
;;

let quotetype_to_json ( d ) : json =
    `String (quotetype_to_string d)
;;

let registrejreasoncode_to_json ( d ) : json =
    `String (registrejreasoncode_to_string d)
;;

let registstatus_to_json ( d ) : json =
    `String (registstatus_to_string d)
;;

let registtranstype_to_json ( d ) : json =
    `String (registtranstype_to_string d)
;;

let reporttoexch_to_json ( d ) : json =
    `String (reporttoexch_to_string d)
;;

let resetseqnumflag_to_json ( d ) : json =
    `String (resetseqnumflag_to_string d)
;;

let responsetransporttype_to_json ( d ) : json =
    `String (responsetransporttype_to_string d)
;;

let roundingdirection_to_json ( d ) : json =
    `String (roundingdirection_to_string d)
;;

let routingtype_to_json ( d ) : json =
    `String (routingtype_to_string d)
;;

let scope_to_json ( d ) : json =
    `String (scope_to_string d)
;;

let securityidsource_to_json ( d ) : json =
    `String (securityidsource_to_string d)
;;

let securitylistrequesttype_to_json ( d ) : json =
    `String (securitylistrequesttype_to_string d)
;;

let securityrequestresult_to_json ( d ) : json =
    `String (securityrequestresult_to_string d)
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

let sessionrejectreason_to_json ( d ) : json =
    `String (sessionrejectreason_to_string d)
;;

let settlcurrfxratecalc_to_json ( d ) : json =
    `String (settlcurrfxratecalc_to_string d)
;;

let settldeliverytype_to_json ( d ) : json =
    `String (settldeliverytype_to_string d)
;;

let settlinstmode_to_json ( d ) : json =
    `String (settlinstmode_to_string d)
;;

let settlinstreqrejcode_to_json ( d ) : json =
    `String (settlinstreqrejcode_to_string d)
;;

let settlinstsource_to_json ( d ) : json =
    `String (settlinstsource_to_string d)
;;

let settlinsttranstype_to_json ( d ) : json =
    `String (settlinsttranstype_to_string d)
;;

let settlpricetype_to_json ( d ) : json =
    `String (settlpricetype_to_string d)
;;

let settlsessid_to_json ( d ) : json =
    `String (settlsessid_to_string d)
;;

let settltype_to_json ( d ) : json =
    `String (settltype_to_string d)
;;

let shortsalereason_to_json ( d ) : json =
    `String (shortsalereason_to_string d)
;;

let side_to_json ( d ) : json =
    `String (side_to_string d)
;;

let sidemultilegreportingtype_to_json ( d ) : json =
    `String (sidemultilegreportingtype_to_string d)
;;

let sidevalueind_to_json ( d ) : json =
    `String (sidevalueind_to_string d)
;;

let solicitedflag_to_json ( d ) : json =
    `String (solicitedflag_to_string d)
;;

let standinstdbtype_to_json ( d ) : json =
    `String (standinstdbtype_to_string d)
;;

let statusvalue_to_json ( d ) : json =
    `String (statusvalue_to_string d)
;;

let stipulationtype_to_json ( d ) : json =
    `String (stipulationtype_to_string d)
;;

let subscriptionrequesttype_to_json ( d ) : json =
    `String (subscriptionrequesttype_to_string d)
;;

let targetstrategy_to_json ( d ) : json =
    `String (targetstrategy_to_string d)
;;

let taxadvantagetype_to_json ( d ) : json =
    `String (taxadvantagetype_to_string d)
;;

let terminationtype_to_json ( d ) : json =
    `String (terminationtype_to_string d)
;;

let testmessageindicator_to_json ( d ) : json =
    `String (testmessageindicator_to_string d)
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

let tradsesstatusrejreason_to_json ( d ) : json =
    `String (tradsesstatusrejreason_to_string d)
;;

let tradeallocindicator_to_json ( d ) : json =
    `String (tradeallocindicator_to_string d)
;;

let tradecondition_to_json ( d ) : json =
    `String (tradecondition_to_string d)
;;

let tradereportrejectreason_to_json ( d ) : json =
    `String (tradereportrejectreason_to_string d)
;;

let tradereporttype_to_json ( d ) : json =
    `String (tradereporttype_to_string d)
;;

let traderequestresult_to_json ( d ) : json =
    `String (traderequestresult_to_string d)
;;

let traderequeststatus_to_json ( d ) : json =
    `String (traderequeststatus_to_string d)
;;

let traderequesttype_to_json ( d ) : json =
    `String (traderequesttype_to_string d)
;;

let tradedflatswitch_to_json ( d ) : json =
    `String (tradedflatswitch_to_string d)
;;

let trdregtimestamptype_to_json ( d ) : json =
    `String (trdregtimestamptype_to_string d)
;;

let trdrptstatus_to_json ( d ) : json =
    `String (trdrptstatus_to_string d)
;;

let trdtype_to_json ( d ) : json =
    `String (trdtype_to_string d)
;;

let unsolicitedindicator_to_json ( d ) : json =
    `String (unsolicitedindicator_to_string d)
;;

let urgency_to_json ( d ) : json =
    `String (urgency_to_string d)
;;

let userrequesttype_to_json ( d ) : json =
    `String (userrequesttype_to_string d)
;;

let userstatus_to_json ( d ) : json =
    `String (userstatus_to_string d)
;;

let workingindicator_to_json ( d ) : json =
    `String (workingindicator_to_string d)
;;

let yieldtype_to_json ( d ) : json =
    `String (yieldtype_to_string d)
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

let accounttype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (accounttype_to_json d)
;;

let acctidsource_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (acctidsource_to_json d)
;;

let adjustment_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (adjustment_to_json d)
;;

let adjustmenttype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (adjustmenttype_to_json d)
;;

let advside_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (advside_to_json d)
;;

let advtranstype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (advtranstype_to_json d)
;;

let affirmstatus_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (affirmstatus_to_json d)
;;

let aggregatedbook_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (aggregatedbook_to_json d)
;;

let allocaccounttype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (allocaccounttype_to_json d)
;;

let alloccancreplacereason_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (alloccancreplacereason_to_json d)
;;

let allochandlinst_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (allochandlinst_to_json d)
;;

let allocintermedreqtype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (allocintermedreqtype_to_json d)
;;

let alloclinktype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (alloclinktype_to_json d)
;;

let allocnoorderstype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (allocnoorderstype_to_json d)
;;

let allocrejcode_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (allocrejcode_to_json d)
;;

let allocreporttype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (allocreporttype_to_json d)
;;

let allocsettlinsttype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (allocsettlinsttype_to_json d)
;;

let allocstatus_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (allocstatus_to_json d)
;;

let alloctranstype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (alloctranstype_to_json d)
;;

let alloctype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (alloctype_to_json d)
;;

let applqueueaction_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (applqueueaction_to_json d)
;;

let applqueueresolution_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (applqueueresolution_to_json d)
;;

let assignmentmethod_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (assignmentmethod_to_json d)
;;

let avgpxindicator_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (avgpxindicator_to_json d)
;;

let basispxtype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (basispxtype_to_json d)
;;

let biddescriptortype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (biddescriptortype_to_json d)
;;

let bidrequesttranstype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (bidrequesttranstype_to_json d)
;;

let bidtradetype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (bidtradetype_to_json d)
;;

let bidtype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (bidtype_to_json d)
;;

let bookingtype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (bookingtype_to_json d)
;;

let bookingunit_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (bookingunit_to_json d)
;;

let businessrejectreason_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (businessrejectreason_to_json d)
;;

let cpprogram_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (cpprogram_to_json d)
;;

let cancellationrights_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (cancellationrights_to_json d)
;;

let cashmargin_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (cashmargin_to_json d)
;;

let clearingfeeindicator_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (clearingfeeindicator_to_json d)
;;

let clearinginstruction_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (clearinginstruction_to_json d)
;;

let collaction_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (collaction_to_json d)
;;

let collasgnreason_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (collasgnreason_to_json d)
;;

let collasgnrejectreason_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (collasgnrejectreason_to_json d)
;;

let collasgnresptype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (collasgnresptype_to_json d)
;;

let collasgntranstype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (collasgntranstype_to_json d)
;;

let collinquiryqualifier_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (collinquiryqualifier_to_json d)
;;

let collinquiryresult_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (collinquiryresult_to_json d)
;;

let collinquirystatus_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (collinquirystatus_to_json d)
;;

let collstatus_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (collstatus_to_json d)
;;

let commtype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (commtype_to_json d)
;;

let confirmrejreason_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (confirmrejreason_to_json d)
;;

let confirmstatus_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (confirmstatus_to_json d)
;;

let confirmtranstype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (confirmtranstype_to_json d)
;;

let confirmtype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (confirmtype_to_json d)
;;

let contamttype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (contamttype_to_json d)
;;

let corporateaction_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (corporateaction_to_json d)
;;

let coveredoruncovered_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (coveredoruncovered_to_json d)
;;

let crossprioritization_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (crossprioritization_to_json d)
;;

let crosstype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (crosstype_to_json d)
;;

let custordercapacity_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (custordercapacity_to_json d)
;;

let cxlrejreason_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (cxlrejreason_to_json d)
;;

let cxlrejresponseto_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (cxlrejresponseto_to_json d)
;;

let dkreason_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (dkreason_to_json d)
;;

let daybookinginst_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (daybookinginst_to_json d)
;;

let deletereason_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (deletereason_to_json d)
;;

let deliveryform_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (deliveryform_to_json d)
;;

let deliverytype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (deliverytype_to_json d)
;;

let discretioninst_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (discretioninst_to_json d)
;;

let discretionlimittype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (discretionlimittype_to_json d)
;;

let discretionmovetype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (discretionmovetype_to_json d)
;;

let discretionoffsettype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (discretionoffsettype_to_json d)
;;

let discretionrounddirection_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (discretionrounddirection_to_json d)
;;

let discretionscope_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (discretionscope_to_json d)
;;

let distribpaymentmethod_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (distribpaymentmethod_to_json d)
;;

let dlvyinsttype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (dlvyinsttype_to_json d)
;;

let duetorelated_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (duetorelated_to_json d)
;;

let emailtype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (emailtype_to_json d)
;;

let encryptmethod_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (encryptmethod_to_json d)
;;

let eventtype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (eventtype_to_json d)
;;

let exchangeforphysical_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (exchangeforphysical_to_json d)
;;

let execinst_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (execinst_to_json d)
;;

let execpricetype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (execpricetype_to_json d)
;;

let execrestatementreason_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (execrestatementreason_to_json d)
;;

let exectype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (exectype_to_json d)
;;

let exercisemethod_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (exercisemethod_to_json d)
;;

let expirationcycle_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (expirationcycle_to_json d)
;;

let financialstatus_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (financialstatus_to_json d)
;;

let forexreq_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (forexreq_to_json d)
;;

let fundrenewwaiv_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (fundrenewwaiv_to_json d)
;;

let gtbookinginst_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (gtbookinginst_to_json d)
;;

let gapfillflag_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (gapfillflag_to_json d)
;;

let haltreason_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (haltreason_to_json d)
;;

let handlinst_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (handlinst_to_json d)
;;

let ioinaturalflag_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (ioinaturalflag_to_json d)
;;

let ioiqltyind_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (ioiqltyind_to_json d)
;;

let ioiqty_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (ioiqty_to_json d)
;;

let ioiqualifier_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (ioiqualifier_to_json d)
;;

let ioitranstype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (ioitranstype_to_json d)
;;

let inviewofcommon_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (inviewofcommon_to_json d)
;;

let inctaxind_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (inctaxind_to_json d)
;;

let instrattribtype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (instrattribtype_to_json d)
;;

let lastcapacity_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (lastcapacity_to_json d)
;;

let lastfragment_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (lastfragment_to_json d)
;;

let lastliquidityind_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (lastliquidityind_to_json d)
;;

let legswaptype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (legswaptype_to_json d)
;;

let legalconfirm_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (legalconfirm_to_json d)
;;

let liquidityindtype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (liquidityindtype_to_json d)
;;

let listexecinsttype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (listexecinsttype_to_json d)
;;

let listorderstatus_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (listorderstatus_to_json d)
;;

let liststatustype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (liststatustype_to_json d)
;;

let locatereqd_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (locatereqd_to_json d)
;;

let mdentrytype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (mdentrytype_to_json d)
;;

let mdimplicitdelete_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (mdimplicitdelete_to_json d)
;;

let mdreqrejreason_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (mdreqrejreason_to_json d)
;;

let mdupdateaction_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (mdupdateaction_to_json d)
;;

let mdupdatetype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (mdupdatetype_to_json d)
;;

let masscancelrejectreason_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (masscancelrejectreason_to_json d)
;;

let masscancelrequesttype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (masscancelrequesttype_to_json d)
;;

let masscancelresponse_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (masscancelresponse_to_json d)
;;

let massstatusreqtype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (massstatusreqtype_to_json d)
;;

let matchstatus_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (matchstatus_to_json d)
;;

let matchtype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (matchtype_to_json d)
;;

let messageencoding_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (messageencoding_to_json d)
;;

let miscfeebasis_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (miscfeebasis_to_json d)
;;

let miscfeetype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (miscfeetype_to_json d)
;;

let moneylaunderingstatus_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (moneylaunderingstatus_to_json d)
;;

let msgdirection_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (msgdirection_to_json d)
;;

let msgtype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (msgtype_to_json d)
;;

let multilegreportingtype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (multilegreportingtype_to_json d)
;;

let multilegrpttypereq_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (multilegrpttypereq_to_json d)
;;

let netgrossind_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (netgrossind_to_json d)
;;

let networkrequesttype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (networkrequesttype_to_json d)
;;

let networkstatusresponsetype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (networkstatusresponsetype_to_json d)
;;

let nosides_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (nosides_to_json d)
;;

let notifybrokerofcredit_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (notifybrokerofcredit_to_json d)
;;

let oddlot_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (oddlot_to_json d)
;;

let openclosesettlflag_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (openclosesettlflag_to_json d)
;;

let ordrejreason_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (ordrejreason_to_json d)
;;

let ordstatus_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (ordstatus_to_json d)
;;

let ordtype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (ordtype_to_json d)
;;

let ordercapacity_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (ordercapacity_to_json d)
;;

let orderrestrictions_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (orderrestrictions_to_json d)
;;

let ownertype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (ownertype_to_json d)
;;

let ownershiptype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (ownershiptype_to_json d)
;;

let partyidsource_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (partyidsource_to_json d)
;;

let partyrole_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (partyrole_to_json d)
;;

let partysubidtype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (partysubidtype_to_json d)
;;

let paymentmethod_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (paymentmethod_to_json d)
;;

let peglimittype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (peglimittype_to_json d)
;;

let pegmovetype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (pegmovetype_to_json d)
;;

let pegoffsettype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (pegoffsettype_to_json d)
;;

let pegrounddirection_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (pegrounddirection_to_json d)
;;

let pegscope_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (pegscope_to_json d)
;;

let posamttype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (posamttype_to_json d)
;;

let posmaintaction_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (posmaintaction_to_json d)
;;

let posmaintresult_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (posmaintresult_to_json d)
;;

let posmaintstatus_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (posmaintstatus_to_json d)
;;

let posqtystatus_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (posqtystatus_to_json d)
;;

let posreqresult_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (posreqresult_to_json d)
;;

let posreqstatus_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (posreqstatus_to_json d)
;;

let posreqtype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (posreqtype_to_json d)
;;

let postranstype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (postranstype_to_json d)
;;

let postype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (postype_to_json d)
;;

let positioneffect_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (positioneffect_to_json d)
;;

let possdupflag_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (possdupflag_to_json d)
;;

let possresend_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (possresend_to_json d)
;;

let preallocmethod_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (preallocmethod_to_json d)
;;

let previouslyreported_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (previouslyreported_to_json d)
;;

let pricetype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (pricetype_to_json d)
;;

let priorityindicator_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (priorityindicator_to_json d)
;;

let processcode_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (processcode_to_json d)
;;

let product_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (product_to_json d)
;;

let progrptreqs_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (progrptreqs_to_json d)
;;

let publishtrdindicator_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (publishtrdindicator_to_json d)
;;

let putorcall_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (putorcall_to_json d)
;;

let qtytype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (qtytype_to_json d)
;;

let quotecanceltype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (quotecanceltype_to_json d)
;;

let quotecondition_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (quotecondition_to_json d)
;;

let quotepricetype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (quotepricetype_to_json d)
;;

let quoterejectreason_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (quoterejectreason_to_json d)
;;

let quoterequestrejectreason_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (quoterequestrejectreason_to_json d)
;;

let quoterequesttype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (quoterequesttype_to_json d)
;;

let quoteresptype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (quoteresptype_to_json d)
;;

let quoteresponselevel_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (quoteresponselevel_to_json d)
;;

let quotestatus_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (quotestatus_to_json d)
;;

let quotetype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (quotetype_to_json d)
;;

let registrejreasoncode_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (registrejreasoncode_to_json d)
;;

let registstatus_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (registstatus_to_json d)
;;

let registtranstype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (registtranstype_to_json d)
;;

let reporttoexch_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (reporttoexch_to_json d)
;;

let resetseqnumflag_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (resetseqnumflag_to_json d)
;;

let responsetransporttype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (responsetransporttype_to_json d)
;;

let roundingdirection_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (roundingdirection_to_json d)
;;

let routingtype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (routingtype_to_json d)
;;

let scope_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (scope_to_json d)
;;

let securityidsource_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (securityidsource_to_json d)
;;

let securitylistrequesttype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (securitylistrequesttype_to_json d)
;;

let securityrequestresult_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (securityrequestresult_to_json d)
;;

let securityrequesttype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (securityrequesttype_to_json d)
;;

let securityresponsetype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (securityresponsetype_to_json d)
;;

let securitytradingstatus_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (securitytradingstatus_to_json d)
;;

let securitytype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (securitytype_to_json d)
;;

let sessionrejectreason_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (sessionrejectreason_to_json d)
;;

let settlcurrfxratecalc_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (settlcurrfxratecalc_to_json d)
;;

let settldeliverytype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (settldeliverytype_to_json d)
;;

let settlinstmode_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (settlinstmode_to_json d)
;;

let settlinstreqrejcode_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (settlinstreqrejcode_to_json d)
;;

let settlinstsource_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (settlinstsource_to_json d)
;;

let settlinsttranstype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (settlinsttranstype_to_json d)
;;

let settlpricetype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (settlpricetype_to_json d)
;;

let settlsessid_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (settlsessid_to_json d)
;;

let settltype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (settltype_to_json d)
;;

let shortsalereason_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (shortsalereason_to_json d)
;;

let side_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (side_to_json d)
;;

let sidemultilegreportingtype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (sidemultilegreportingtype_to_json d)
;;

let sidevalueind_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (sidevalueind_to_json d)
;;

let solicitedflag_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (solicitedflag_to_json d)
;;

let standinstdbtype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (standinstdbtype_to_json d)
;;

let statusvalue_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (statusvalue_to_json d)
;;

let stipulationtype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (stipulationtype_to_json d)
;;

let subscriptionrequesttype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (subscriptionrequesttype_to_json d)
;;

let targetstrategy_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (targetstrategy_to_json d)
;;

let taxadvantagetype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (taxadvantagetype_to_json d)
;;

let terminationtype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (terminationtype_to_json d)
;;

let testmessageindicator_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (testmessageindicator_to_json d)
;;

let tickdirection_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (tickdirection_to_json d)
;;

let timeinforce_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (timeinforce_to_json d)
;;

let tradsesmethod_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (tradsesmethod_to_json d)
;;

let tradsesmode_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (tradsesmode_to_json d)
;;

let tradsesstatus_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (tradsesstatus_to_json d)
;;

let tradsesstatusrejreason_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (tradsesstatusrejreason_to_json d)
;;

let tradeallocindicator_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (tradeallocindicator_to_json d)
;;

let tradecondition_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (tradecondition_to_json d)
;;

let tradereportrejectreason_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (tradereportrejectreason_to_json d)
;;

let tradereporttype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (tradereporttype_to_json d)
;;

let traderequestresult_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (traderequestresult_to_json d)
;;

let traderequeststatus_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (traderequeststatus_to_json d)
;;

let traderequesttype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (traderequesttype_to_json d)
;;

let tradedflatswitch_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (tradedflatswitch_to_json d)
;;

let trdregtimestamptype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (trdregtimestamptype_to_json d)
;;

let trdrptstatus_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (trdrptstatus_to_json d)
;;

let trdtype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (trdtype_to_json d)
;;

let unsolicitedindicator_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (unsolicitedindicator_to_json d)
;;

let urgency_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (urgency_to_json d)
;;

let userrequesttype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (userrequesttype_to_json d)
;;

let userstatus_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (userstatus_to_json d)
;;

let workingindicator_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (workingindicator_to_json d)
;;

let yieldtype_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (yieldtype_to_json d)
;;

let week_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (week_to_json d)
;;

let currency_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (currency_to_json d)
;;

let country_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (country_to_json d)
;;

let exchange_opt_to_json ( d ) : json =
    match d with
        | None -> (`Null)
        | Some d -> (exchange_to_json d)
;;
