(* Aesthetic Integration copyright 2018 *)
open Full_app_enums;;
open Model_app_enums;;

let convert__full_to_model_CxlRejResponseTo (f : fix_cxlrejresponseto)  =
    (match f with
        | FIX_CxlRejResponseTo_OrderCancelRequest -> MOD_FIX_CxlRejResponseTo_OrderCancelRequest
        | FIX_CxlRejResponseTo_OrderCancel -> MOD_FIX_CxlRejResponseTo_OrderCancel
    )
;;

let convert__full_to_model_OrdStatus (f : fix_ordstatus)  =
    (match f with
        | FIX_OrdStatus_PendingCancel -> MOD_FIX_OrdStatus_PendingCancel
        | FIX_OrdStatus_Stopped -> MOD_FIX_OrdStatus_Stopped
        | FIX_OrdStatus_PendingNew -> MOD_FIX_OrdStatus_PendingNew
        | FIX_OrdStatus_Rejected -> MOD_FIX_OrdStatus_Rejected
        | FIX_OrdStatus_Calculated -> MOD_FIX_OrdStatus_Calculated
        | FIX_OrdStatus_Expired -> MOD_FIX_OrdStatus_Expired
        | FIX_OrdStatus_Filled -> MOD_FIX_OrdStatus_Filled
        | FIX_OrdStatus_Canceled -> MOD_FIX_OrdStatus_Canceled
        | FIX_OrdStatus_Replaced -> MOD_FIX_OrdStatus_Replaced
        | FIX_OrdStatus_PendingReplace -> MOD_FIX_OrdStatus_PendingReplace
        | FIX_OrdStatus_DoneForDay -> MOD_FIX_OrdStatus_DoneForDay
        | FIX_OrdStatus_Suspended -> MOD_FIX_OrdStatus_Suspended
        | FIX_OrdStatus_New -> MOD_FIX_OrdStatus_New
        | FIX_OrdStatus_PartiallyFilled -> MOD_FIX_OrdStatus_PartiallyFilled
        | FIX_OrdStatus_AcceptedForBidding -> MOD_FIX_OrdStatus_AcceptedForBidding
    )
;;

let convert__full_to_model_BookIndicator (f : fix_bookindicator)  =
    (match f with
        | FIX_BookIndicator_Auction -> MOD_FIX_BookIndicator_Auction
        | FIX_BookIndicator_RPW -> MOD_FIX_BookIndicator_RPW
    )
;;

let convert__full_to_model_CrossType (f : fix_crosstype)  =
    (match f with
        | FIX_CrossType_CrossIOC -> MOD_FIX_CrossType_CrossIOC
        | FIX_CrossType_CrossOneSide -> MOD_FIX_CrossType_CrossOneSide
        | FIX_CrossType_CrossSamePrice -> MOD_FIX_CrossType_CrossSamePrice
        | FIX_CrossType_CrossAON -> MOD_FIX_CrossType_CrossAON
        | FIX_CrossType_NotSignificant -> MOD_FIX_CrossType_NotSignificant
        | FIX_CrossType_StandardCross -> MOD_FIX_CrossType_StandardCross
    )
;;

let convert__full_to_model_LiquidityIndicator (f : fix_liquidityindicator)  =
    (match f with
        | FIX_LiquidityIndicator_RemoveLiquidity -> MOD_FIX_LiquidityIndicator_RemoveLiquidity
        | FIX_LiquidityIndicator_AddLiquidity -> MOD_FIX_LiquidityIndicator_AddLiquidity
        | FIX_LiquidityIndicator_PeriodicAuction -> MOD_FIX_LiquidityIndicator_PeriodicAuction
    )
;;

let convert__full_to_model_CxlRejReason (f : fix_cxlrejreason)  =
    (match f with
        | FIX_CxlRejReason_Other -> MOD_FIX_CxlRejReason_Other
        | FIX_CxlRejReason_OrderAlreadyInPendingStatus -> MOD_FIX_CxlRejReason_OrderAlreadyInPendingStatus
        | FIX_CxlRejReason_TooLateToCancel -> MOD_FIX_CxlRejReason_TooLateToCancel
        | FIX_CxlRejReason_UnknownOrder -> MOD_FIX_CxlRejReason_UnknownOrder
        | FIX_CxlRejReason_UnableToProcessOrderMassCancelRequest -> MOD_FIX_CxlRejReason_UnableToProcessOrderMassCancelRequest
        | FIX_CxlRejReason_OrigOrdModTime -> MOD_FIX_CxlRejReason_OrigOrdModTime
        | FIX_CxlRejReason_DuplicateClOrdID -> MOD_FIX_CxlRejReason_DuplicateClOrdID
        | FIX_CxlRejReason_BrokerCredit -> MOD_FIX_CxlRejReason_BrokerCredit
    )
;;

let convert__full_to_model_ExecTransType (f : fix_exectranstype)  =
    (match f with
        | FIX_ExecTransType_Status -> MOD_FIX_ExecTransType_Status
        | FIX_ExecTransType_Cancel -> MOD_FIX_ExecTransType_Cancel
        | FIX_ExecTransType_New -> MOD_FIX_ExecTransType_New
        | FIX_ExecTransType_Correct -> MOD_FIX_ExecTransType_Correct
    )
;;

let convert__full_to_model_Rule80A (f : fix_rule80a)  =
    (match f with
        | FIX_Rule80A_AgencySingleOrder -> MOD_FIX_Rule80A_AgencySingleOrder
        | FIX_Rule80A_ShortExemptTransactionForPrincipal -> MOD_FIX_Rule80A_ShortExemptTransactionForPrincipal
        | FIX_Rule80A_ShortExemptTransactionAType -> MOD_FIX_Rule80A_ShortExemptTransactionAType
        | FIX_Rule80A_SpecialistTrades -> MOD_FIX_Rule80A_SpecialistTrades
        | FIX_Rule80A_AgencyNonAlgo -> MOD_FIX_Rule80A_AgencyNonAlgo
        | FIX_Rule80A_TransactionUnaffiliatedMember -> MOD_FIX_Rule80A_TransactionUnaffiliatedMember
        | FIX_Rule80A_ShortExemptTransactionWType -> MOD_FIX_Rule80A_ShortExemptTransactionWType
        | FIX_Rule80A_ProprietaryAlgo -> MOD_FIX_Rule80A_ProprietaryAlgo
        | FIX_Rule80A_ProprietaryTransactionAffiliated -> MOD_FIX_Rule80A_ProprietaryTransactionAffiliated
        | FIX_Rule80A_AgencyAlgo -> MOD_FIX_Rule80A_AgencyAlgo
        | FIX_Rule80A_Principal -> MOD_FIX_Rule80A_Principal
        | FIX_Rule80A_AllOtherOrdersAsAgentForOtherMember -> MOD_FIX_Rule80A_AllOtherOrdersAsAgentForOtherMember
        | FIX_Rule80A_ProprietaryNonAlgo -> MOD_FIX_Rule80A_ProprietaryNonAlgo
        | FIX_Rule80A_ShortExemptTransactionIType -> MOD_FIX_Rule80A_ShortExemptTransactionIType
        | FIX_Rule80A_AgentForOtherMember -> MOD_FIX_Rule80A_AgentForOtherMember
        | FIX_Rule80A_ShortExemptTransactionNonMember -> MOD_FIX_Rule80A_ShortExemptTransactionNonMember
        | FIX_Rule80A_RisklessPrincipal -> MOD_FIX_Rule80A_RisklessPrincipal
        | FIX_Rule80A_AgencyIndexArb -> MOD_FIX_Rule80A_AgencyIndexArb
        | FIX_Rule80A_ProgramOrderOtherMember -> MOD_FIX_Rule80A_ProgramOrderOtherMember
        | FIX_Rule80A_ShortExemptTransactionMemberNotAffliated -> MOD_FIX_Rule80A_ShortExemptTransactionMemberNotAffliated
        | FIX_Rule80A_ProgramOrderMember -> MOD_FIX_Rule80A_ProgramOrderMember
        | FIX_Rule80A_House -> MOD_FIX_Rule80A_House
        | FIX_Rule80A_TransactionNonMember -> MOD_FIX_Rule80A_TransactionNonMember
        | FIX_Rule80A_IndividualInvestor -> MOD_FIX_Rule80A_IndividualInvestor
        | FIX_Rule80A_ShortExemptTransactionMemberAffliated -> MOD_FIX_Rule80A_ShortExemptTransactionMemberAffliated
        | FIX_Rule80A_Client -> MOD_FIX_Rule80A_Client
    )
;;

let convert__full_to_model_ExecInst (f : fix_execinst)  =
    (match f with
        | FIX_ExecInst_ParticipateDoNotInitiate -> MOD_FIX_ExecInst_ParticipateDoNotInitiate
        | FIX_ExecInst_AllOrNone -> MOD_FIX_ExecInst_AllOrNone
        | FIX_ExecInst_CallFirst -> MOD_FIX_ExecInst_CallFirst
        | FIX_ExecInst_PercentOfVolume -> MOD_FIX_ExecInst_PercentOfVolume
        | FIX_ExecInst_InstitutionsOnly -> MOD_FIX_ExecInst_InstitutionsOnly
        | FIX_ExecInst_FullSweep -> MOD_FIX_ExecInst_FullSweep
        | FIX_ExecInst_NoCross -> MOD_FIX_ExecInst_NoCross
        | FIX_ExecInst_BestOfferPeg -> MOD_FIX_ExecInst_BestOfferPeg
        | FIX_ExecInst_OverTheDay -> MOD_FIX_ExecInst_OverTheDay
        | FIX_ExecInst_DoNotIncrease -> MOD_FIX_ExecInst_DoNotIncrease
        | FIX_ExecInst_OpeningPeg -> MOD_FIX_ExecInst_OpeningPeg
        | FIX_ExecInst_TryToStop -> MOD_FIX_ExecInst_TryToStop
        | FIX_ExecInst_Netting -> MOD_FIX_ExecInst_Netting
        | FIX_ExecInst_StayOnBidSide -> MOD_FIX_ExecInst_StayOnBidSide
        | FIX_ExecInst_Held -> MOD_FIX_ExecInst_Held
        | FIX_ExecInst_OKToCross -> MOD_FIX_ExecInst_OKToCross
        | FIX_ExecInst_CustomerDisplayInstruction -> MOD_FIX_ExecInst_CustomerDisplayInstruction
        | FIX_ExecInst_GoAlong -> MOD_FIX_ExecInst_GoAlong
        | FIX_ExecInst_DoNotReduce -> MOD_FIX_ExecInst_DoNotReduce
        | FIX_ExecInst_StayOnOfferSide -> MOD_FIX_ExecInst_StayOnOfferSide
        | FIX_ExecInst_PegToLimitPrice -> MOD_FIX_ExecInst_PegToLimitPrice
        | FIX_ExecInst_TryToScale -> MOD_FIX_ExecInst_TryToScale
        | FIX_ExecInst_ReinstateOnSystemFailure -> MOD_FIX_ExecInst_ReinstateOnSystemFailure
        | FIX_ExecInst_CancelIfNotBest -> MOD_FIX_ExecInst_CancelIfNotBest
        | FIX_ExecInst_BestBidPeg -> MOD_FIX_ExecInst_BestBidPeg
        | FIX_ExecInst_MidPricePeg -> MOD_FIX_ExecInst_MidPricePeg
        | FIX_ExecInst_WorkToTargetStrategy -> MOD_FIX_ExecInst_WorkToTargetStrategy
        | FIX_ExecInst_PegToVWAP -> MOD_FIX_ExecInst_PegToVWAP
        | FIX_ExecInst_TradeAlong -> MOD_FIX_ExecInst_TradeAlong
        | FIX_ExecInst_StrictLimit -> MOD_FIX_ExecInst_StrictLimit
        | FIX_ExecInst_Suspend -> MOD_FIX_ExecInst_Suspend
        | FIX_ExecInst_LastPeg -> MOD_FIX_ExecInst_LastPeg
        | FIX_ExecInst_NonNegotiable -> MOD_FIX_ExecInst_NonNegotiable
        | FIX_ExecInst_HalfSweep -> MOD_FIX_ExecInst_HalfSweep
        | FIX_ExecInst_NotHeld -> MOD_FIX_ExecInst_NotHeld
        | FIX_ExecInst_FixedPegToLocalBestBidOrOfferAtTimeOfOrder -> MOD_FIX_ExecInst_FixedPegToLocalBestBidOrOfferAtTimeOfOrder
        | FIX_ExecInst_CancelOnTradingHalt -> MOD_FIX_ExecInst_CancelOnTradingHalt
        | FIX_ExecInst_CancelOnSystemFailure -> MOD_FIX_ExecInst_CancelOnSystemFailure
        | FIX_ExecInst_IgnorePriceValidityChecks -> MOD_FIX_ExecInst_IgnorePriceValidityChecks
        | FIX_ExecInst_Work -> MOD_FIX_ExecInst_Work
        | FIX_ExecInst_ReinstateOnTradingHalt -> MOD_FIX_ExecInst_ReinstateOnTradingHalt
        | FIX_ExecInst_PrimaryPeg -> MOD_FIX_ExecInst_PrimaryPeg
        | FIX_ExecInst_TrailingStopPeg -> MOD_FIX_ExecInst_TrailingStopPeg
        | FIX_ExecInst_MarketPeg -> MOD_FIX_ExecInst_MarketPeg
        | FIX_ExecInst_StrictScale -> MOD_FIX_ExecInst_StrictScale
    )
;;

let convert__full_to_model_MassCancelRequestType (f : fix_masscancelrequesttype)  =
    (match f with
        | FIX_MassCancelRequestType_CancelOrdersForASecurityType -> MOD_FIX_MassCancelRequestType_CancelOrdersForASecurityType
        | FIX_MassCancelRequestType_CancelOrdersForAProduct -> MOD_FIX_MassCancelRequestType_CancelOrdersForAProduct
        | FIX_MassCancelRequestType_CancelOrdersForASecurity -> MOD_FIX_MassCancelRequestType_CancelOrdersForASecurity
        | FIX_MassCancelRequestType_CancelOrdersForAnUnderlyingSecurity -> MOD_FIX_MassCancelRequestType_CancelOrdersForAnUnderlyingSecurity
        | FIX_MassCancelRequestType_CancelAllOrders -> MOD_FIX_MassCancelRequestType_CancelAllOrders
        | FIX_MassCancelRequestType_CancelOrdersForACFICode -> MOD_FIX_MassCancelRequestType_CancelOrdersForACFICode
        | FIX_MassCancelRequestType_CancelOrdersForATradingSession -> MOD_FIX_MassCancelRequestType_CancelOrdersForATradingSession
    )
;;

let convert__full_to_model_OpenClose (f : fix_openclose)  =
    (match f with
        | FIX_OpenClose_Close -> MOD_FIX_OpenClose_Close
        | FIX_OpenClose_Open -> MOD_FIX_OpenClose_Open
    )
;;

let convert__full_to_model_TechnicalOrdType (f : fix_technicalordtype)  =
    (match f with
        | FIX_TechnicalOrdType_CrossMargining -> MOD_FIX_TechnicalOrdType_CrossMargining
        | FIX_TechnicalOrdType_IndexArbitrage -> MOD_FIX_TechnicalOrdType_IndexArbitrage
        | FIX_TechnicalOrdType_UnwindOrder -> MOD_FIX_TechnicalOrdType_UnwindOrder
        | FIX_TechnicalOrdType_OtherOrders -> MOD_FIX_TechnicalOrdType_OtherOrders
        | FIX_TechnicalOrdType_PortfolioStrategy -> MOD_FIX_TechnicalOrdType_PortfolioStrategy
    )
;;

let convert__full_to_model_TimeInForce (f : fix_timeinforce)  =
    (match f with
        | FIX_TimeInForce_GoodTillCancel -> MOD_FIX_TimeInForce_GoodTillCancel
        | FIX_TimeInForce_AtTheClose -> MOD_FIX_TimeInForce_AtTheClose
        | FIX_TimeInForce_ImmediateOrCancel -> MOD_FIX_TimeInForce_ImmediateOrCancel
        | FIX_TimeInForce_Day -> MOD_FIX_TimeInForce_Day
        | FIX_TimeInForce_FillOrKill -> MOD_FIX_TimeInForce_FillOrKill
        | FIX_TimeInForce_GoodForAuction -> MOD_FIX_TimeInForce_GoodForAuction
        | FIX_TimeInForce_AtTheOpening -> MOD_FIX_TimeInForce_AtTheOpening
        | FIX_TimeInForce_GoodTillCrossing -> MOD_FIX_TimeInForce_GoodTillCrossing
        | FIX_TimeInForce_GoodTillDate -> MOD_FIX_TimeInForce_GoodTillDate
    )
;;

let convert__full_to_model_ExecType (f : fix_exectype)  =
    (match f with
        | FIX_ExecType_PendingCancel -> MOD_FIX_ExecType_PendingCancel
        | FIX_ExecType_Fill -> MOD_FIX_ExecType_Fill
        | FIX_ExecType_Stopped -> MOD_FIX_ExecType_Stopped
        | FIX_ExecType_PendingNew -> MOD_FIX_ExecType_PendingNew
        | FIX_ExecType_Restated -> MOD_FIX_ExecType_Restated
        | FIX_ExecType_Rejected -> MOD_FIX_ExecType_Rejected
        | FIX_ExecType_Calculated -> MOD_FIX_ExecType_Calculated
        | FIX_ExecType_TradeCorrect -> MOD_FIX_ExecType_TradeCorrect
        | FIX_ExecType_TradeCancel -> MOD_FIX_ExecType_TradeCancel
        | FIX_ExecType_Expired -> MOD_FIX_ExecType_Expired
        | FIX_ExecType_OrderStatus -> MOD_FIX_ExecType_OrderStatus
        | FIX_ExecType_PartialFill -> MOD_FIX_ExecType_PartialFill
        | FIX_ExecType_Trade -> MOD_FIX_ExecType_Trade
        | FIX_ExecType_Canceled -> MOD_FIX_ExecType_Canceled
        | FIX_ExecType_Replaced -> MOD_FIX_ExecType_Replaced
        | FIX_ExecType_PendingReplace -> MOD_FIX_ExecType_PendingReplace
        | FIX_ExecType_DoneForDay -> MOD_FIX_ExecType_DoneForDay
        | FIX_ExecType_Suspended -> MOD_FIX_ExecType_Suspended
        | FIX_ExecType_New -> MOD_FIX_ExecType_New
    )
;;

let convert__full_to_model_ClearingHandlingType (f : fix_clearinghandlingtype)  =
    (match f with
        | FIX_ClearingHandlingType_ManualMode -> MOD_FIX_ClearingHandlingType_ManualMode
        | FIX_ClearingHandlingType_AutomaticExtraction -> MOD_FIX_ClearingHandlingType_AutomaticExtraction
        | FIX_ClearingHandlingType_AutomaticAllocation -> MOD_FIX_ClearingHandlingType_AutomaticAllocation
    )
;;

let convert__full_to_model_PartyRoleQualifier (f : fix_partyrolequalifier)  =
    (match f with
        | FIX_PartyRoleQualifier_FirmOrLegalEntity -> MOD_FIX_PartyRoleQualifier_FirmOrLegalEntity
        | FIX_PartyRoleQualifier_Algorithm -> MOD_FIX_PartyRoleQualifier_Algorithm
        | FIX_PartyRoleQualifier_NaturalPerson -> MOD_FIX_PartyRoleQualifier_NaturalPerson
    )
;;

let convert__full_to_model_PartySubIDType (f : fix_partysubidtype)  =
    (match f with
        | FIX_PartySubIDType_EmailAddress -> MOD_FIX_PartySubIDType_EmailAddress
        | FIX_PartySubIDType_Application -> MOD_FIX_PartySubIDType_Application
        | FIX_PartySubIDType_FundAccountName -> MOD_FIX_PartySubIDType_FundAccountName
        | FIX_PartySubIDType_FullLegalNameOfFirm -> MOD_FIX_PartySubIDType_FullLegalNameOfFirm
        | FIX_PartySubIDType_CSDParticipantMemberCode -> MOD_FIX_PartySubIDType_CSDParticipantMemberCode
        | FIX_PartySubIDType_RegistrationName -> MOD_FIX_PartySubIDType_RegistrationName
        | FIX_PartySubIDType_PostalAddress -> MOD_FIX_PartySubIDType_PostalAddress
        | FIX_PartySubIDType_SecuritiesAccountNumber -> MOD_FIX_PartySubIDType_SecuritiesAccountNumber
        | FIX_PartySubIDType_RegisteredAddress -> MOD_FIX_PartySubIDType_RegisteredAddress
        | FIX_PartySubIDType_TelexNumber -> MOD_FIX_PartySubIDType_TelexNumber
        | FIX_PartySubIDType_RegulatoryStatus -> MOD_FIX_PartySubIDType_RegulatoryStatus
        | FIX_PartySubIDType_PhoneNumber -> MOD_FIX_PartySubIDType_PhoneNumber
        | FIX_PartySubIDType_Firm -> MOD_FIX_PartySubIDType_Firm
        | FIX_PartySubIDType_Person -> MOD_FIX_PartySubIDType_Person
        | FIX_PartySubIDType_ContactName -> MOD_FIX_PartySubIDType_ContactName
        | FIX_PartySubIDType_CashAccountNumber -> MOD_FIX_PartySubIDType_CashAccountNumber
        | FIX_PartySubIDType_CashAccountName -> MOD_FIX_PartySubIDType_CashAccountName
        | FIX_PartySubIDType_LocationDesk -> MOD_FIX_PartySubIDType_LocationDesk
        | FIX_PartySubIDType_RegisteredAddressForConfirmation -> MOD_FIX_PartySubIDType_RegisteredAddressForConfirmation
        | FIX_PartySubIDType_PositionAccountType -> MOD_FIX_PartySubIDType_PositionAccountType
        | FIX_PartySubIDType_System -> MOD_FIX_PartySubIDType_System
        | FIX_PartySubIDType_Department -> MOD_FIX_PartySubIDType_Department
        | FIX_PartySubIDType_FaxNumber -> MOD_FIX_PartySubIDType_FaxNumber
        | FIX_PartySubIDType_RegistrationNumber -> MOD_FIX_PartySubIDType_RegistrationNumber
        | FIX_PartySubIDType_BIC -> MOD_FIX_PartySubIDType_BIC
        | FIX_PartySubIDType_SecuritiesAccountName -> MOD_FIX_PartySubIDType_SecuritiesAccountName
    )
;;

let convert__full_to_model_PartyIDSource (f : fix_partyidsource)  =
    (match f with
        | FIX_PartyIDSource_CSDParticipant -> MOD_FIX_PartyIDSource_CSDParticipant
        | FIX_PartyIDSource_KoreanInvestorID -> MOD_FIX_PartyIDSource_KoreanInvestorID
        | FIX_PartyIDSource_USEmployerOrTaxIDNumber -> MOD_FIX_PartyIDSource_USEmployerOrTaxIDNumber
        | FIX_PartyIDSource_TaiwaneseForeignInvestorID -> MOD_FIX_PartyIDSource_TaiwaneseForeignInvestorID
        | FIX_PartyIDSource_TaiwaneseTradingAcct -> MOD_FIX_PartyIDSource_TaiwaneseTradingAcct
        | FIX_PartyIDSource_UKNationalInsuranceOrPensionNumber -> MOD_FIX_PartyIDSource_UKNationalInsuranceOrPensionNumber
        | FIX_PartyIDSource_MIC -> MOD_FIX_PartyIDSource_MIC
        | FIX_PartyIDSource_USSocialSecurityNumber -> MOD_FIX_PartyIDSource_USSocialSecurityNumber
        | FIX_PartyIDSource_Proprietary -> MOD_FIX_PartyIDSource_Proprietary
        | FIX_PartyIDSource_AustralianTaxFileNumber -> MOD_FIX_PartyIDSource_AustralianTaxFileNumber
        | FIX_PartyIDSource_ShortCodeIdentifier -> MOD_FIX_PartyIDSource_ShortCodeIdentifier
        | FIX_PartyIDSource_MalaysianCentralDepository -> MOD_FIX_PartyIDSource_MalaysianCentralDepository
        | FIX_PartyIDSource_ISITCAcronym -> MOD_FIX_PartyIDSource_ISITCAcronym
        | FIX_PartyIDSource_ISOCountryCode -> MOD_FIX_PartyIDSource_ISOCountryCode
        | FIX_PartyIDSource_ChineseInvestorID -> MOD_FIX_PartyIDSource_ChineseInvestorID
        | FIX_PartyIDSource_AustralianBusinessNumber -> MOD_FIX_PartyIDSource_AustralianBusinessNumber
        | FIX_PartyIDSource_BIC -> MOD_FIX_PartyIDSource_BIC
        | FIX_PartyIDSource_GeneralIdentifier -> MOD_FIX_PartyIDSource_GeneralIdentifier
        | FIX_PartyIDSource_SettlementEntityLocation -> MOD_FIX_PartyIDSource_SettlementEntityLocation
    )
;;

let convert__full_to_model_OrdRejReason (f : fix_ordrejreason)  =
    (match f with
        | FIX_OrdRejReason_DuplicateOrder -> MOD_FIX_OrdRejReason_DuplicateOrder
        | FIX_OrdRejReason_Other -> MOD_FIX_OrdRejReason_Other
        | FIX_OrdRejReason_UnknownOrder -> MOD_FIX_OrdRejReason_UnknownOrder
        | FIX_OrdRejReason_DVC_ThresholdBreached -> MOD_FIX_OrdRejReason_DVC_ThresholdBreached
        | FIX_OrdRejReason_TooLateToEnter -> MOD_FIX_OrdRejReason_TooLateToEnter
        | FIX_OrdRejReason_OrderExceedsLimit -> MOD_FIX_OrdRejReason_OrderExceedsLimit
        | FIX_OrdRejReason_UnknownAccount -> MOD_FIX_OrdRejReason_UnknownAccount
        | FIX_OrdRejReason_OtherRejectReason -> MOD_FIX_OrdRejReason_OtherRejectReason
        | FIX_OrdRejReason_BrokerCredit -> MOD_FIX_OrdRejReason_BrokerCredit
        | FIX_OrdRejReason_UnsupportedOrderCharacteristic -> MOD_FIX_OrdRejReason_UnsupportedOrderCharacteristic
        | FIX_OrdRejReason_DuplicateOfAVerballyCommunicatedOrder -> MOD_FIX_OrdRejReason_DuplicateOfAVerballyCommunicatedOrder
        | FIX_OrdRejReason_IncorrectQuantity -> MOD_FIX_OrdRejReason_IncorrectQuantity
        | FIX_OrdRejReason_TradeAlongRequired -> MOD_FIX_OrdRejReason_TradeAlongRequired
        | FIX_OrdRejReason_StaleOrder -> MOD_FIX_OrdRejReason_StaleOrder
        | FIX_OrdRejReason_InvalidInvestorID -> MOD_FIX_OrdRejReason_InvalidInvestorID
        | FIX_OrdRejReason_ExchangeClosed -> MOD_FIX_OrdRejReason_ExchangeClosed
        | FIX_OrdRejReason_IncorrectAllocatedQuantity -> MOD_FIX_OrdRejReason_IncorrectAllocatedQuantity
        | FIX_OrdRejReason_DVC_ProactivelyHaltedInstrument -> MOD_FIX_OrdRejReason_DVC_ProactivelyHaltedInstrument
        | FIX_OrdRejReason_UnknownSymbol -> MOD_FIX_OrdRejReason_UnknownSymbol
    )
;;

let convert__full_to_model_Currency (f : fix_currency)  =
    (match f with
        | FIX_Currency_EUR -> MOD_FIX_Currency_EUR
        | FIX_Currency_CHF -> MOD_FIX_Currency_CHF
        | FIX_Currency_USD -> MOD_FIX_Currency_USD
        | FIX_Currency_GBP -> MOD_FIX_Currency_GBP
    )
;;

let convert__full_to_model_BrokerPrioritization (f : fix_brokerprioritization)  =
    (match f with
        | FIX_BrokerPrioritization_WithBrokerPrioritization -> MOD_FIX_BrokerPrioritization_WithBrokerPrioritization
        | FIX_BrokerPrioritization_WithoutBrokerPriotization -> MOD_FIX_BrokerPrioritization_WithoutBrokerPriotization
    )
;;

let convert__full_to_model_Side (f : fix_side)  =
    (match f with
        | FIX_Side_AsDefined -> MOD_FIX_Side_AsDefined
        | FIX_Side_Opposite -> MOD_FIX_Side_Opposite
        | FIX_Side_Buy -> MOD_FIX_Side_Buy
        | FIX_Side_CrossShortExempt -> MOD_FIX_Side_CrossShortExempt
        | FIX_Side_Borrow -> MOD_FIX_Side_Borrow
        | FIX_Side_BuyMinus -> MOD_FIX_Side_BuyMinus
        | FIX_Side_Subscribe -> MOD_FIX_Side_Subscribe
        | FIX_Side_Lend -> MOD_FIX_Side_Lend
        | FIX_Side_SellShortExempt -> MOD_FIX_Side_SellShortExempt
        | FIX_Side_Redeem -> MOD_FIX_Side_Redeem
        | FIX_Side_SellPlus -> MOD_FIX_Side_SellPlus
        | FIX_Side_Sell -> MOD_FIX_Side_Sell
        | FIX_Side_Undisclosed -> MOD_FIX_Side_Undisclosed
        | FIX_Side_Cross -> MOD_FIX_Side_Cross
        | FIX_Side_CrossShort -> MOD_FIX_Side_CrossShort
        | FIX_Side_SellShort -> MOD_FIX_Side_SellShort
    )
;;

let convert__full_to_model_HandlInst (f : fix_handlinst)  =
    (match f with
        | FIX_HandlInst_ManualOrder -> MOD_FIX_HandlInst_ManualOrder
        | FIX_HandlInst_AutomatedExecutionInterventionOK -> MOD_FIX_HandlInst_AutomatedExecutionInterventionOK
        | FIX_HandlInst_AutomatedExecutionNoIntervention -> MOD_FIX_HandlInst_AutomatedExecutionNoIntervention
    )
;;

let convert__full_to_model_OrdType (f : fix_ordtype)  =
    (match f with
        | FIX_OrdType_LimitOrBetter -> MOD_FIX_OrdType_LimitOrBetter
        | FIX_OrdType_NextFundValuationPoint -> MOD_FIX_OrdType_NextFundValuationPoint
        | FIX_OrdType_WithOrWithout -> MOD_FIX_OrdType_WithOrWithout
        | FIX_OrdType_PreviouslyIndicated -> MOD_FIX_OrdType_PreviouslyIndicated
        | FIX_OrdType_Stop -> MOD_FIX_OrdType_Stop
        | FIX_OrdType_ForexPreviouslyQuoted -> MOD_FIX_OrdType_ForexPreviouslyQuoted
        | FIX_OrdType_Market -> MOD_FIX_OrdType_Market
        | FIX_OrdType_OnBasis -> MOD_FIX_OrdType_OnBasis
        | FIX_OrdType_Funari -> MOD_FIX_OrdType_Funari
        | FIX_OrdType_LimitOnClose -> MOD_FIX_OrdType_LimitOnClose
        | FIX_OrdType_Pegged -> MOD_FIX_OrdType_Pegged
        | FIX_OrdType_LimitWithOrWithout -> MOD_FIX_OrdType_LimitWithOrWithout
        | FIX_OrdType_MarketOnClose -> MOD_FIX_OrdType_MarketOnClose
        | FIX_OrdType_StopLimit -> MOD_FIX_OrdType_StopLimit
        | FIX_OrdType_ForexSwap -> MOD_FIX_OrdType_ForexSwap
        | FIX_OrdType_MarketIfTouched -> MOD_FIX_OrdType_MarketIfTouched
        | FIX_OrdType_MarketWithLeftOverAsLimit -> MOD_FIX_OrdType_MarketWithLeftOverAsLimit
        | FIX_OrdType_PreviouslyQuoted -> MOD_FIX_OrdType_PreviouslyQuoted
        | FIX_OrdType_ForexMarket -> MOD_FIX_OrdType_ForexMarket
        | FIX_OrdType_Limit -> MOD_FIX_OrdType_Limit
        | FIX_OrdType_PreviousFundValuationPoint -> MOD_FIX_OrdType_PreviousFundValuationPoint
        | FIX_OrdType_OnClose -> MOD_FIX_OrdType_OnClose
        | FIX_OrdType_ForexLimit -> MOD_FIX_OrdType_ForexLimit
    )
;;

let convert_inner_full_to_model_OrderAttributeTypes (f)  =
    (match f with
        | FIX_OrderAttributeTypes_AlgorithmicOrder -> MOD_FIX_OrderAttributeTypes_AlgorithmicOrder
        | FIX_OrderAttributeTypes_LiquidityProvisionActivity -> MOD_FIX_OrderAttributeTypes_LiquidityProvisionActivity
    )
;;

let rec convert__full_to_model_OrderAttributeTypes (f)  : (model_fix_orderattributetypes,bool) Map.t =
    (match f with
        | [] -> (Map.const false)
        | h :: t -> let x = convert__full_to_model_OrderAttributeTypes t in
        Map.add (convert_inner_full_to_model_OrderAttributeTypes h) true x
    )
;;

let convert__full_to_model_PartyRole (f : fix_partyrole)  =
    (match f with
        | FIX_PartyRole_CorrespondantClearingFirm -> MOD_FIX_PartyRole_CorrespondantClearingFirm
        | FIX_PartyRole_Agent -> MOD_FIX_PartyRole_Agent
        | FIX_PartyRole_ExecutingSystem -> MOD_FIX_PartyRole_ExecutingSystem
        | FIX_PartyRole_SponsoringFirm -> MOD_FIX_PartyRole_SponsoringFirm
        | FIX_PartyRole_Intermediary -> MOD_FIX_PartyRole_Intermediary
        | FIX_PartyRole_IntroducingFirm -> MOD_FIX_PartyRole_IntroducingFirm
        | FIX_PartyRole_EnteringFirm -> MOD_FIX_PartyRole_EnteringFirm
        | FIX_PartyRole_LiquidityProvider -> MOD_FIX_PartyRole_LiquidityProvider
        | FIX_PartyRole_ClearingFirm -> MOD_FIX_PartyRole_ClearingFirm
        | FIX_PartyRole_ContraFirm -> MOD_FIX_PartyRole_ContraFirm
        | FIX_PartyRole_ContraTrader -> MOD_FIX_PartyRole_ContraTrader
        | FIX_PartyRole_CustomerAccount -> MOD_FIX_PartyRole_CustomerAccount
        | FIX_PartyRole_RegulatoryBody -> MOD_FIX_PartyRole_RegulatoryBody
        | FIX_PartyRole_SettlementLocation -> MOD_FIX_PartyRole_SettlementLocation
        | FIX_PartyRole_Exchange -> MOD_FIX_PartyRole_Exchange
        | FIX_PartyRole_Custodian -> MOD_FIX_PartyRole_Custodian
        | FIX_PartyRole_CorrespondentClearingOrganization -> MOD_FIX_PartyRole_CorrespondentClearingOrganization
        | FIX_PartyRole_ExecutingTrader -> MOD_FIX_PartyRole_ExecutingTrader
        | FIX_PartyRole_CorrespondentBroker -> MOD_FIX_PartyRole_CorrespondentBroker
        | FIX_PartyRole_ClientID -> MOD_FIX_PartyRole_ClientID
        | FIX_PartyRole_OrderOriginationTrader -> MOD_FIX_PartyRole_OrderOriginationTrader
        | FIX_PartyRole_Beneficiary -> MOD_FIX_PartyRole_Beneficiary
        | FIX_PartyRole_InterestedParty -> MOD_FIX_PartyRole_InterestedParty
        | FIX_PartyRole_UnderlyingContraFirm -> MOD_FIX_PartyRole_UnderlyingContraFirm
        | FIX_PartyRole_GiveupClearingFirm -> MOD_FIX_PartyRole_GiveupClearingFirm
        | FIX_PartyRole_ClearingOrganization -> MOD_FIX_PartyRole_ClearingOrganization
        | FIX_PartyRole_Locate -> MOD_FIX_PartyRole_Locate
        | FIX_PartyRole_Buyer -> MOD_FIX_PartyRole_Buyer
        | FIX_PartyRole_PositionAccount -> MOD_FIX_PartyRole_PositionAccount
        | FIX_PartyRole_OrderOriginationFirm -> MOD_FIX_PartyRole_OrderOriginationFirm
        | FIX_PartyRole_BrokerOfCredit -> MOD_FIX_PartyRole_BrokerOfCredit
        | FIX_PartyRole_SubCustodian -> MOD_FIX_PartyRole_SubCustodian
        | FIX_PartyRole_EnteringTrader -> MOD_FIX_PartyRole_EnteringTrader
        | FIX_PartyRole_InvestmentDecisionMaker -> MOD_FIX_PartyRole_InvestmentDecisionMaker
        | FIX_PartyRole_ExecutingFirm -> MOD_FIX_PartyRole_ExecutingFirm
        | FIX_PartyRole_FundManagerClientID -> MOD_FIX_PartyRole_FundManagerClientID
        | FIX_PartyRole_ContraClearingFirm -> MOD_FIX_PartyRole_ContraClearingFirm
        | FIX_PartyRole_InvestorID -> MOD_FIX_PartyRole_InvestorID
    )
;;

let convert__model_to_full_CxlRejResponseTo (f : model_fix_cxlrejresponseto)  =
    (match f with
        | MOD_FIX_CxlRejResponseTo_OrderCancelRequest -> FIX_CxlRejResponseTo_OrderCancelRequest
        | MOD_FIX_CxlRejResponseTo_OrderCancel -> FIX_CxlRejResponseTo_OrderCancel
    )
;;

let convert__model_to_full_OrdStatus (f : model_fix_ordstatus)  =
    (match f with
        | MOD_FIX_OrdStatus_PendingCancel -> FIX_OrdStatus_PendingCancel
        | MOD_FIX_OrdStatus_Stopped -> FIX_OrdStatus_Stopped
        | MOD_FIX_OrdStatus_PendingNew -> FIX_OrdStatus_PendingNew
        | MOD_FIX_OrdStatus_Rejected -> FIX_OrdStatus_Rejected
        | MOD_FIX_OrdStatus_Calculated -> FIX_OrdStatus_Calculated
        | MOD_FIX_OrdStatus_Expired -> FIX_OrdStatus_Expired
        | MOD_FIX_OrdStatus_Filled -> FIX_OrdStatus_Filled
        | MOD_FIX_OrdStatus_Canceled -> FIX_OrdStatus_Canceled
        | MOD_FIX_OrdStatus_Replaced -> FIX_OrdStatus_Replaced
        | MOD_FIX_OrdStatus_PendingReplace -> FIX_OrdStatus_PendingReplace
        | MOD_FIX_OrdStatus_DoneForDay -> FIX_OrdStatus_DoneForDay
        | MOD_FIX_OrdStatus_Suspended -> FIX_OrdStatus_Suspended
        | MOD_FIX_OrdStatus_New -> FIX_OrdStatus_New
        | MOD_FIX_OrdStatus_PartiallyFilled -> FIX_OrdStatus_PartiallyFilled
        | MOD_FIX_OrdStatus_AcceptedForBidding -> FIX_OrdStatus_AcceptedForBidding
    )
;;

let convert__model_to_full_BookIndicator (f : model_fix_bookindicator)  =
    (match f with
        | MOD_FIX_BookIndicator_Auction -> FIX_BookIndicator_Auction
        | MOD_FIX_BookIndicator_RPW -> FIX_BookIndicator_RPW
    )
;;

let convert__model_to_full_CrossType (f : model_fix_crosstype)  =
    (match f with
        | MOD_FIX_CrossType_CrossIOC -> FIX_CrossType_CrossIOC
        | MOD_FIX_CrossType_CrossOneSide -> FIX_CrossType_CrossOneSide
        | MOD_FIX_CrossType_CrossSamePrice -> FIX_CrossType_CrossSamePrice
        | MOD_FIX_CrossType_CrossAON -> FIX_CrossType_CrossAON
        | MOD_FIX_CrossType_NotSignificant -> FIX_CrossType_NotSignificant
        | MOD_FIX_CrossType_StandardCross -> FIX_CrossType_StandardCross
    )
;;

let convert__model_to_full_LiquidityIndicator (f : model_fix_liquidityindicator)  =
    (match f with
        | MOD_FIX_LiquidityIndicator_RemoveLiquidity -> FIX_LiquidityIndicator_RemoveLiquidity
        | MOD_FIX_LiquidityIndicator_AddLiquidity -> FIX_LiquidityIndicator_AddLiquidity
        | MOD_FIX_LiquidityIndicator_PeriodicAuction -> FIX_LiquidityIndicator_PeriodicAuction
    )
;;

let convert__model_to_full_CxlRejReason (f : model_fix_cxlrejreason)  =
    (match f with
        | MOD_FIX_CxlRejReason_Other -> FIX_CxlRejReason_Other
        | MOD_FIX_CxlRejReason_OrderAlreadyInPendingStatus -> FIX_CxlRejReason_OrderAlreadyInPendingStatus
        | MOD_FIX_CxlRejReason_TooLateToCancel -> FIX_CxlRejReason_TooLateToCancel
        | MOD_FIX_CxlRejReason_UnknownOrder -> FIX_CxlRejReason_UnknownOrder
        | MOD_FIX_CxlRejReason_UnableToProcessOrderMassCancelRequest -> FIX_CxlRejReason_UnableToProcessOrderMassCancelRequest
        | MOD_FIX_CxlRejReason_OrigOrdModTime -> FIX_CxlRejReason_OrigOrdModTime
        | MOD_FIX_CxlRejReason_DuplicateClOrdID -> FIX_CxlRejReason_DuplicateClOrdID
        | MOD_FIX_CxlRejReason_BrokerCredit -> FIX_CxlRejReason_BrokerCredit
    )
;;

let convert__model_to_full_ExecTransType (f : model_fix_exectranstype)  =
    (match f with
        | MOD_FIX_ExecTransType_Status -> FIX_ExecTransType_Status
        | MOD_FIX_ExecTransType_Cancel -> FIX_ExecTransType_Cancel
        | MOD_FIX_ExecTransType_New -> FIX_ExecTransType_New
        | MOD_FIX_ExecTransType_Correct -> FIX_ExecTransType_Correct
    )
;;

let convert__model_to_full_Rule80A (f : model_fix_rule80a)  =
    (match f with
        | MOD_FIX_Rule80A_AgencySingleOrder -> FIX_Rule80A_AgencySingleOrder
        | MOD_FIX_Rule80A_ShortExemptTransactionForPrincipal -> FIX_Rule80A_ShortExemptTransactionForPrincipal
        | MOD_FIX_Rule80A_ShortExemptTransactionAType -> FIX_Rule80A_ShortExemptTransactionAType
        | MOD_FIX_Rule80A_SpecialistTrades -> FIX_Rule80A_SpecialistTrades
        | MOD_FIX_Rule80A_AgencyNonAlgo -> FIX_Rule80A_AgencyNonAlgo
        | MOD_FIX_Rule80A_TransactionUnaffiliatedMember -> FIX_Rule80A_TransactionUnaffiliatedMember
        | MOD_FIX_Rule80A_ShortExemptTransactionWType -> FIX_Rule80A_ShortExemptTransactionWType
        | MOD_FIX_Rule80A_ProprietaryAlgo -> FIX_Rule80A_ProprietaryAlgo
        | MOD_FIX_Rule80A_ProprietaryTransactionAffiliated -> FIX_Rule80A_ProprietaryTransactionAffiliated
        | MOD_FIX_Rule80A_AgencyAlgo -> FIX_Rule80A_AgencyAlgo
        | MOD_FIX_Rule80A_Principal -> FIX_Rule80A_Principal
        | MOD_FIX_Rule80A_AllOtherOrdersAsAgentForOtherMember -> FIX_Rule80A_AllOtherOrdersAsAgentForOtherMember
        | MOD_FIX_Rule80A_ProprietaryNonAlgo -> FIX_Rule80A_ProprietaryNonAlgo
        | MOD_FIX_Rule80A_ShortExemptTransactionIType -> FIX_Rule80A_ShortExemptTransactionIType
        | MOD_FIX_Rule80A_AgentForOtherMember -> FIX_Rule80A_AgentForOtherMember
        | MOD_FIX_Rule80A_ShortExemptTransactionNonMember -> FIX_Rule80A_ShortExemptTransactionNonMember
        | MOD_FIX_Rule80A_RisklessPrincipal -> FIX_Rule80A_RisklessPrincipal
        | MOD_FIX_Rule80A_AgencyIndexArb -> FIX_Rule80A_AgencyIndexArb
        | MOD_FIX_Rule80A_ProgramOrderOtherMember -> FIX_Rule80A_ProgramOrderOtherMember
        | MOD_FIX_Rule80A_ShortExemptTransactionMemberNotAffliated -> FIX_Rule80A_ShortExemptTransactionMemberNotAffliated
        | MOD_FIX_Rule80A_ProgramOrderMember -> FIX_Rule80A_ProgramOrderMember
        | MOD_FIX_Rule80A_House -> FIX_Rule80A_House
        | MOD_FIX_Rule80A_TransactionNonMember -> FIX_Rule80A_TransactionNonMember
        | MOD_FIX_Rule80A_IndividualInvestor -> FIX_Rule80A_IndividualInvestor
        | MOD_FIX_Rule80A_ShortExemptTransactionMemberAffliated -> FIX_Rule80A_ShortExemptTransactionMemberAffliated
        | MOD_FIX_Rule80A_Client -> FIX_Rule80A_Client
    )
;;

let convert__model_to_full_ExecInst (f : model_fix_execinst)  =
    (match f with
        | MOD_FIX_ExecInst_ParticipateDoNotInitiate -> FIX_ExecInst_ParticipateDoNotInitiate
        | MOD_FIX_ExecInst_AllOrNone -> FIX_ExecInst_AllOrNone
        | MOD_FIX_ExecInst_CallFirst -> FIX_ExecInst_CallFirst
        | MOD_FIX_ExecInst_PercentOfVolume -> FIX_ExecInst_PercentOfVolume
        | MOD_FIX_ExecInst_InstitutionsOnly -> FIX_ExecInst_InstitutionsOnly
        | MOD_FIX_ExecInst_FullSweep -> FIX_ExecInst_FullSweep
        | MOD_FIX_ExecInst_NoCross -> FIX_ExecInst_NoCross
        | MOD_FIX_ExecInst_BestOfferPeg -> FIX_ExecInst_BestOfferPeg
        | MOD_FIX_ExecInst_OverTheDay -> FIX_ExecInst_OverTheDay
        | MOD_FIX_ExecInst_DoNotIncrease -> FIX_ExecInst_DoNotIncrease
        | MOD_FIX_ExecInst_OpeningPeg -> FIX_ExecInst_OpeningPeg
        | MOD_FIX_ExecInst_TryToStop -> FIX_ExecInst_TryToStop
        | MOD_FIX_ExecInst_Netting -> FIX_ExecInst_Netting
        | MOD_FIX_ExecInst_StayOnBidSide -> FIX_ExecInst_StayOnBidSide
        | MOD_FIX_ExecInst_Held -> FIX_ExecInst_Held
        | MOD_FIX_ExecInst_OKToCross -> FIX_ExecInst_OKToCross
        | MOD_FIX_ExecInst_CustomerDisplayInstruction -> FIX_ExecInst_CustomerDisplayInstruction
        | MOD_FIX_ExecInst_GoAlong -> FIX_ExecInst_GoAlong
        | MOD_FIX_ExecInst_DoNotReduce -> FIX_ExecInst_DoNotReduce
        | MOD_FIX_ExecInst_StayOnOfferSide -> FIX_ExecInst_StayOnOfferSide
        | MOD_FIX_ExecInst_PegToLimitPrice -> FIX_ExecInst_PegToLimitPrice
        | MOD_FIX_ExecInst_TryToScale -> FIX_ExecInst_TryToScale
        | MOD_FIX_ExecInst_ReinstateOnSystemFailure -> FIX_ExecInst_ReinstateOnSystemFailure
        | MOD_FIX_ExecInst_CancelIfNotBest -> FIX_ExecInst_CancelIfNotBest
        | MOD_FIX_ExecInst_BestBidPeg -> FIX_ExecInst_BestBidPeg
        | MOD_FIX_ExecInst_MidPricePeg -> FIX_ExecInst_MidPricePeg
        | MOD_FIX_ExecInst_WorkToTargetStrategy -> FIX_ExecInst_WorkToTargetStrategy
        | MOD_FIX_ExecInst_PegToVWAP -> FIX_ExecInst_PegToVWAP
        | MOD_FIX_ExecInst_TradeAlong -> FIX_ExecInst_TradeAlong
        | MOD_FIX_ExecInst_StrictLimit -> FIX_ExecInst_StrictLimit
        | MOD_FIX_ExecInst_Suspend -> FIX_ExecInst_Suspend
        | MOD_FIX_ExecInst_LastPeg -> FIX_ExecInst_LastPeg
        | MOD_FIX_ExecInst_NonNegotiable -> FIX_ExecInst_NonNegotiable
        | MOD_FIX_ExecInst_HalfSweep -> FIX_ExecInst_HalfSweep
        | MOD_FIX_ExecInst_NotHeld -> FIX_ExecInst_NotHeld
        | MOD_FIX_ExecInst_FixedPegToLocalBestBidOrOfferAtTimeOfOrder -> FIX_ExecInst_FixedPegToLocalBestBidOrOfferAtTimeOfOrder
        | MOD_FIX_ExecInst_CancelOnTradingHalt -> FIX_ExecInst_CancelOnTradingHalt
        | MOD_FIX_ExecInst_CancelOnSystemFailure -> FIX_ExecInst_CancelOnSystemFailure
        | MOD_FIX_ExecInst_IgnorePriceValidityChecks -> FIX_ExecInst_IgnorePriceValidityChecks
        | MOD_FIX_ExecInst_Work -> FIX_ExecInst_Work
        | MOD_FIX_ExecInst_ReinstateOnTradingHalt -> FIX_ExecInst_ReinstateOnTradingHalt
        | MOD_FIX_ExecInst_PrimaryPeg -> FIX_ExecInst_PrimaryPeg
        | MOD_FIX_ExecInst_TrailingStopPeg -> FIX_ExecInst_TrailingStopPeg
        | MOD_FIX_ExecInst_MarketPeg -> FIX_ExecInst_MarketPeg
        | MOD_FIX_ExecInst_StrictScale -> FIX_ExecInst_StrictScale
    )
;;

let convert__model_to_full_MassCancelRequestType (f : model_fix_masscancelrequesttype)  =
    (match f with
        | MOD_FIX_MassCancelRequestType_CancelOrdersForASecurityType -> FIX_MassCancelRequestType_CancelOrdersForASecurityType
        | MOD_FIX_MassCancelRequestType_CancelOrdersForAProduct -> FIX_MassCancelRequestType_CancelOrdersForAProduct
        | MOD_FIX_MassCancelRequestType_CancelOrdersForASecurity -> FIX_MassCancelRequestType_CancelOrdersForASecurity
        | MOD_FIX_MassCancelRequestType_CancelOrdersForAnUnderlyingSecurity -> FIX_MassCancelRequestType_CancelOrdersForAnUnderlyingSecurity
        | MOD_FIX_MassCancelRequestType_CancelAllOrders -> FIX_MassCancelRequestType_CancelAllOrders
        | MOD_FIX_MassCancelRequestType_CancelOrdersForACFICode -> FIX_MassCancelRequestType_CancelOrdersForACFICode
        | MOD_FIX_MassCancelRequestType_CancelOrdersForATradingSession -> FIX_MassCancelRequestType_CancelOrdersForATradingSession
    )
;;

let convert__model_to_full_OpenClose (f : model_fix_openclose)  =
    (match f with
        | MOD_FIX_OpenClose_Close -> FIX_OpenClose_Close
        | MOD_FIX_OpenClose_Open -> FIX_OpenClose_Open
    )
;;

let convert__model_to_full_TechnicalOrdType (f : model_fix_technicalordtype)  =
    (match f with
        | MOD_FIX_TechnicalOrdType_CrossMargining -> FIX_TechnicalOrdType_CrossMargining
        | MOD_FIX_TechnicalOrdType_IndexArbitrage -> FIX_TechnicalOrdType_IndexArbitrage
        | MOD_FIX_TechnicalOrdType_UnwindOrder -> FIX_TechnicalOrdType_UnwindOrder
        | MOD_FIX_TechnicalOrdType_OtherOrders -> FIX_TechnicalOrdType_OtherOrders
        | MOD_FIX_TechnicalOrdType_PortfolioStrategy -> FIX_TechnicalOrdType_PortfolioStrategy
    )
;;

let convert__model_to_full_TimeInForce (f : model_fix_timeinforce)  =
    (match f with
        | MOD_FIX_TimeInForce_GoodTillCancel -> FIX_TimeInForce_GoodTillCancel
        | MOD_FIX_TimeInForce_AtTheClose -> FIX_TimeInForce_AtTheClose
        | MOD_FIX_TimeInForce_ImmediateOrCancel -> FIX_TimeInForce_ImmediateOrCancel
        | MOD_FIX_TimeInForce_Day -> FIX_TimeInForce_Day
        | MOD_FIX_TimeInForce_FillOrKill -> FIX_TimeInForce_FillOrKill
        | MOD_FIX_TimeInForce_GoodForAuction -> FIX_TimeInForce_GoodForAuction
        | MOD_FIX_TimeInForce_AtTheOpening -> FIX_TimeInForce_AtTheOpening
        | MOD_FIX_TimeInForce_GoodTillCrossing -> FIX_TimeInForce_GoodTillCrossing
        | MOD_FIX_TimeInForce_GoodTillDate -> FIX_TimeInForce_GoodTillDate
    )
;;

let convert__model_to_full_ExecType (f : model_fix_exectype)  =
    (match f with
        | MOD_FIX_ExecType_PendingCancel -> FIX_ExecType_PendingCancel
        | MOD_FIX_ExecType_Fill -> FIX_ExecType_Fill
        | MOD_FIX_ExecType_Stopped -> FIX_ExecType_Stopped
        | MOD_FIX_ExecType_PendingNew -> FIX_ExecType_PendingNew
        | MOD_FIX_ExecType_Restated -> FIX_ExecType_Restated
        | MOD_FIX_ExecType_Rejected -> FIX_ExecType_Rejected
        | MOD_FIX_ExecType_Calculated -> FIX_ExecType_Calculated
        | MOD_FIX_ExecType_TradeCorrect -> FIX_ExecType_TradeCorrect
        | MOD_FIX_ExecType_TradeCancel -> FIX_ExecType_TradeCancel
        | MOD_FIX_ExecType_Expired -> FIX_ExecType_Expired
        | MOD_FIX_ExecType_OrderStatus -> FIX_ExecType_OrderStatus
        | MOD_FIX_ExecType_PartialFill -> FIX_ExecType_PartialFill
        | MOD_FIX_ExecType_Trade -> FIX_ExecType_Trade
        | MOD_FIX_ExecType_Canceled -> FIX_ExecType_Canceled
        | MOD_FIX_ExecType_Replaced -> FIX_ExecType_Replaced
        | MOD_FIX_ExecType_PendingReplace -> FIX_ExecType_PendingReplace
        | MOD_FIX_ExecType_DoneForDay -> FIX_ExecType_DoneForDay
        | MOD_FIX_ExecType_Suspended -> FIX_ExecType_Suspended
        | MOD_FIX_ExecType_New -> FIX_ExecType_New
    )
;;

let convert__model_to_full_ClearingHandlingType (f : model_fix_clearinghandlingtype)  =
    (match f with
        | MOD_FIX_ClearingHandlingType_ManualMode -> FIX_ClearingHandlingType_ManualMode
        | MOD_FIX_ClearingHandlingType_AutomaticExtraction -> FIX_ClearingHandlingType_AutomaticExtraction
        | MOD_FIX_ClearingHandlingType_AutomaticAllocation -> FIX_ClearingHandlingType_AutomaticAllocation
    )
;;

let convert__model_to_full_PartyRoleQualifier (f : model_fix_partyrolequalifier)  =
    (match f with
        | MOD_FIX_PartyRoleQualifier_FirmOrLegalEntity -> FIX_PartyRoleQualifier_FirmOrLegalEntity
        | MOD_FIX_PartyRoleQualifier_Algorithm -> FIX_PartyRoleQualifier_Algorithm
        | MOD_FIX_PartyRoleQualifier_NaturalPerson -> FIX_PartyRoleQualifier_NaturalPerson
    )
;;

let convert__model_to_full_PartySubIDType (f : model_fix_partysubidtype)  =
    (match f with
        | MOD_FIX_PartySubIDType_EmailAddress -> FIX_PartySubIDType_EmailAddress
        | MOD_FIX_PartySubIDType_Application -> FIX_PartySubIDType_Application
        | MOD_FIX_PartySubIDType_FundAccountName -> FIX_PartySubIDType_FundAccountName
        | MOD_FIX_PartySubIDType_FullLegalNameOfFirm -> FIX_PartySubIDType_FullLegalNameOfFirm
        | MOD_FIX_PartySubIDType_CSDParticipantMemberCode -> FIX_PartySubIDType_CSDParticipantMemberCode
        | MOD_FIX_PartySubIDType_RegistrationName -> FIX_PartySubIDType_RegistrationName
        | MOD_FIX_PartySubIDType_PostalAddress -> FIX_PartySubIDType_PostalAddress
        | MOD_FIX_PartySubIDType_SecuritiesAccountNumber -> FIX_PartySubIDType_SecuritiesAccountNumber
        | MOD_FIX_PartySubIDType_RegisteredAddress -> FIX_PartySubIDType_RegisteredAddress
        | MOD_FIX_PartySubIDType_TelexNumber -> FIX_PartySubIDType_TelexNumber
        | MOD_FIX_PartySubIDType_RegulatoryStatus -> FIX_PartySubIDType_RegulatoryStatus
        | MOD_FIX_PartySubIDType_PhoneNumber -> FIX_PartySubIDType_PhoneNumber
        | MOD_FIX_PartySubIDType_Firm -> FIX_PartySubIDType_Firm
        | MOD_FIX_PartySubIDType_Person -> FIX_PartySubIDType_Person
        | MOD_FIX_PartySubIDType_ContactName -> FIX_PartySubIDType_ContactName
        | MOD_FIX_PartySubIDType_CashAccountNumber -> FIX_PartySubIDType_CashAccountNumber
        | MOD_FIX_PartySubIDType_CashAccountName -> FIX_PartySubIDType_CashAccountName
        | MOD_FIX_PartySubIDType_LocationDesk -> FIX_PartySubIDType_LocationDesk
        | MOD_FIX_PartySubIDType_RegisteredAddressForConfirmation -> FIX_PartySubIDType_RegisteredAddressForConfirmation
        | MOD_FIX_PartySubIDType_PositionAccountType -> FIX_PartySubIDType_PositionAccountType
        | MOD_FIX_PartySubIDType_System -> FIX_PartySubIDType_System
        | MOD_FIX_PartySubIDType_Department -> FIX_PartySubIDType_Department
        | MOD_FIX_PartySubIDType_FaxNumber -> FIX_PartySubIDType_FaxNumber
        | MOD_FIX_PartySubIDType_RegistrationNumber -> FIX_PartySubIDType_RegistrationNumber
        | MOD_FIX_PartySubIDType_BIC -> FIX_PartySubIDType_BIC
        | MOD_FIX_PartySubIDType_SecuritiesAccountName -> FIX_PartySubIDType_SecuritiesAccountName
    )
;;

let convert__model_to_full_PartyIDSource (f : model_fix_partyidsource)  =
    (match f with
        | MOD_FIX_PartyIDSource_CSDParticipant -> FIX_PartyIDSource_CSDParticipant
        | MOD_FIX_PartyIDSource_KoreanInvestorID -> FIX_PartyIDSource_KoreanInvestorID
        | MOD_FIX_PartyIDSource_USEmployerOrTaxIDNumber -> FIX_PartyIDSource_USEmployerOrTaxIDNumber
        | MOD_FIX_PartyIDSource_TaiwaneseForeignInvestorID -> FIX_PartyIDSource_TaiwaneseForeignInvestorID
        | MOD_FIX_PartyIDSource_TaiwaneseTradingAcct -> FIX_PartyIDSource_TaiwaneseTradingAcct
        | MOD_FIX_PartyIDSource_UKNationalInsuranceOrPensionNumber -> FIX_PartyIDSource_UKNationalInsuranceOrPensionNumber
        | MOD_FIX_PartyIDSource_MIC -> FIX_PartyIDSource_MIC
        | MOD_FIX_PartyIDSource_USSocialSecurityNumber -> FIX_PartyIDSource_USSocialSecurityNumber
        | MOD_FIX_PartyIDSource_Proprietary -> FIX_PartyIDSource_Proprietary
        | MOD_FIX_PartyIDSource_AustralianTaxFileNumber -> FIX_PartyIDSource_AustralianTaxFileNumber
        | MOD_FIX_PartyIDSource_ShortCodeIdentifier -> FIX_PartyIDSource_ShortCodeIdentifier
        | MOD_FIX_PartyIDSource_MalaysianCentralDepository -> FIX_PartyIDSource_MalaysianCentralDepository
        | MOD_FIX_PartyIDSource_ISITCAcronym -> FIX_PartyIDSource_ISITCAcronym
        | MOD_FIX_PartyIDSource_ISOCountryCode -> FIX_PartyIDSource_ISOCountryCode
        | MOD_FIX_PartyIDSource_ChineseInvestorID -> FIX_PartyIDSource_ChineseInvestorID
        | MOD_FIX_PartyIDSource_AustralianBusinessNumber -> FIX_PartyIDSource_AustralianBusinessNumber
        | MOD_FIX_PartyIDSource_BIC -> FIX_PartyIDSource_BIC
        | MOD_FIX_PartyIDSource_GeneralIdentifier -> FIX_PartyIDSource_GeneralIdentifier
        | MOD_FIX_PartyIDSource_SettlementEntityLocation -> FIX_PartyIDSource_SettlementEntityLocation
    )
;;

let convert__model_to_full_OrdRejReason (f : model_fix_ordrejreason)  =
    (match f with
        | MOD_FIX_OrdRejReason_DuplicateOrder -> FIX_OrdRejReason_DuplicateOrder
        | MOD_FIX_OrdRejReason_Other -> FIX_OrdRejReason_Other
        | MOD_FIX_OrdRejReason_UnknownOrder -> FIX_OrdRejReason_UnknownOrder
        | MOD_FIX_OrdRejReason_DVC_ThresholdBreached -> FIX_OrdRejReason_DVC_ThresholdBreached
        | MOD_FIX_OrdRejReason_TooLateToEnter -> FIX_OrdRejReason_TooLateToEnter
        | MOD_FIX_OrdRejReason_OrderExceedsLimit -> FIX_OrdRejReason_OrderExceedsLimit
        | MOD_FIX_OrdRejReason_UnknownAccount -> FIX_OrdRejReason_UnknownAccount
        | MOD_FIX_OrdRejReason_OtherRejectReason -> FIX_OrdRejReason_OtherRejectReason
        | MOD_FIX_OrdRejReason_BrokerCredit -> FIX_OrdRejReason_BrokerCredit
        | MOD_FIX_OrdRejReason_UnsupportedOrderCharacteristic -> FIX_OrdRejReason_UnsupportedOrderCharacteristic
        | MOD_FIX_OrdRejReason_DuplicateOfAVerballyCommunicatedOrder -> FIX_OrdRejReason_DuplicateOfAVerballyCommunicatedOrder
        | MOD_FIX_OrdRejReason_IncorrectQuantity -> FIX_OrdRejReason_IncorrectQuantity
        | MOD_FIX_OrdRejReason_TradeAlongRequired -> FIX_OrdRejReason_TradeAlongRequired
        | MOD_FIX_OrdRejReason_StaleOrder -> FIX_OrdRejReason_StaleOrder
        | MOD_FIX_OrdRejReason_InvalidInvestorID -> FIX_OrdRejReason_InvalidInvestorID
        | MOD_FIX_OrdRejReason_ExchangeClosed -> FIX_OrdRejReason_ExchangeClosed
        | MOD_FIX_OrdRejReason_IncorrectAllocatedQuantity -> FIX_OrdRejReason_IncorrectAllocatedQuantity
        | MOD_FIX_OrdRejReason_DVC_ProactivelyHaltedInstrument -> FIX_OrdRejReason_DVC_ProactivelyHaltedInstrument
        | MOD_FIX_OrdRejReason_UnknownSymbol -> FIX_OrdRejReason_UnknownSymbol
    )
;;

let convert__model_to_full_Currency (f : model_fix_currency)  =
    (match f with
        | MOD_FIX_Currency_EUR -> FIX_Currency_EUR
        | MOD_FIX_Currency_CHF -> FIX_Currency_CHF
        | MOD_FIX_Currency_USD -> FIX_Currency_USD
        | MOD_FIX_Currency_GBP -> FIX_Currency_GBP
    )
;;

let convert__model_to_full_BrokerPrioritization (f : model_fix_brokerprioritization)  =
    (match f with
        | MOD_FIX_BrokerPrioritization_WithBrokerPrioritization -> FIX_BrokerPrioritization_WithBrokerPrioritization
        | MOD_FIX_BrokerPrioritization_WithoutBrokerPriotization -> FIX_BrokerPrioritization_WithoutBrokerPriotization
    )
;;

let convert__model_to_full_Side (f : model_fix_side)  =
    (match f with
        | MOD_FIX_Side_AsDefined -> FIX_Side_AsDefined
        | MOD_FIX_Side_Opposite -> FIX_Side_Opposite
        | MOD_FIX_Side_Buy -> FIX_Side_Buy
        | MOD_FIX_Side_CrossShortExempt -> FIX_Side_CrossShortExempt
        | MOD_FIX_Side_Borrow -> FIX_Side_Borrow
        | MOD_FIX_Side_BuyMinus -> FIX_Side_BuyMinus
        | MOD_FIX_Side_Subscribe -> FIX_Side_Subscribe
        | MOD_FIX_Side_Lend -> FIX_Side_Lend
        | MOD_FIX_Side_SellShortExempt -> FIX_Side_SellShortExempt
        | MOD_FIX_Side_Redeem -> FIX_Side_Redeem
        | MOD_FIX_Side_SellPlus -> FIX_Side_SellPlus
        | MOD_FIX_Side_Sell -> FIX_Side_Sell
        | MOD_FIX_Side_Undisclosed -> FIX_Side_Undisclosed
        | MOD_FIX_Side_Cross -> FIX_Side_Cross
        | MOD_FIX_Side_CrossShort -> FIX_Side_CrossShort
        | MOD_FIX_Side_SellShort -> FIX_Side_SellShort
    )
;;

let convert__model_to_full_HandlInst (f : model_fix_handlinst)  =
    (match f with
        | MOD_FIX_HandlInst_ManualOrder -> FIX_HandlInst_ManualOrder
        | MOD_FIX_HandlInst_AutomatedExecutionInterventionOK -> FIX_HandlInst_AutomatedExecutionInterventionOK
        | MOD_FIX_HandlInst_AutomatedExecutionNoIntervention -> FIX_HandlInst_AutomatedExecutionNoIntervention
    )
;;

let convert__model_to_full_OrdType (f : model_fix_ordtype)  =
    (match f with
        | MOD_FIX_OrdType_LimitOrBetter -> FIX_OrdType_LimitOrBetter
        | MOD_FIX_OrdType_NextFundValuationPoint -> FIX_OrdType_NextFundValuationPoint
        | MOD_FIX_OrdType_WithOrWithout -> FIX_OrdType_WithOrWithout
        | MOD_FIX_OrdType_PreviouslyIndicated -> FIX_OrdType_PreviouslyIndicated
        | MOD_FIX_OrdType_Stop -> FIX_OrdType_Stop
        | MOD_FIX_OrdType_ForexPreviouslyQuoted -> FIX_OrdType_ForexPreviouslyQuoted
        | MOD_FIX_OrdType_Market -> FIX_OrdType_Market
        | MOD_FIX_OrdType_OnBasis -> FIX_OrdType_OnBasis
        | MOD_FIX_OrdType_Funari -> FIX_OrdType_Funari
        | MOD_FIX_OrdType_LimitOnClose -> FIX_OrdType_LimitOnClose
        | MOD_FIX_OrdType_Pegged -> FIX_OrdType_Pegged
        | MOD_FIX_OrdType_LimitWithOrWithout -> FIX_OrdType_LimitWithOrWithout
        | MOD_FIX_OrdType_MarketOnClose -> FIX_OrdType_MarketOnClose
        | MOD_FIX_OrdType_StopLimit -> FIX_OrdType_StopLimit
        | MOD_FIX_OrdType_ForexSwap -> FIX_OrdType_ForexSwap
        | MOD_FIX_OrdType_MarketIfTouched -> FIX_OrdType_MarketIfTouched
        | MOD_FIX_OrdType_MarketWithLeftOverAsLimit -> FIX_OrdType_MarketWithLeftOverAsLimit
        | MOD_FIX_OrdType_PreviouslyQuoted -> FIX_OrdType_PreviouslyQuoted
        | MOD_FIX_OrdType_ForexMarket -> FIX_OrdType_ForexMarket
        | MOD_FIX_OrdType_Limit -> FIX_OrdType_Limit
        | MOD_FIX_OrdType_PreviousFundValuationPoint -> FIX_OrdType_PreviousFundValuationPoint
        | MOD_FIX_OrdType_OnClose -> FIX_OrdType_OnClose
        | MOD_FIX_OrdType_ForexLimit -> FIX_OrdType_ForexLimit
    )
;;

let convert_inner_model_to_full_OrderAttributeTypes (f : model_fix_orderattributetypes)  =
    (match f with
        | MOD_FIX_OrderAttributeTypes_AlgorithmicOrder -> FIX_OrderAttributeTypes_AlgorithmicOrder
        | MOD_FIX_OrderAttributeTypes_LiquidityProvisionActivity -> FIX_OrderAttributeTypes_LiquidityProvisionActivity
    )
;;

let rec convert__model_to_full_OrderAttributeTypes (f) (x)  =
    (match x with
        | [] -> []
        | h :: t -> (if (Map.get h f) then
            ((convert_inner_model_to_full_OrderAttributeTypes h) :: (convert__model_to_full_OrderAttributeTypes f t))
        else
            (convert__model_to_full_OrderAttributeTypes f t)
        )
    )
;;

let convert__model_to_full_PartyRole (f : model_fix_partyrole)  =
    (match f with
        | MOD_FIX_PartyRole_CorrespondantClearingFirm -> FIX_PartyRole_CorrespondantClearingFirm
        | MOD_FIX_PartyRole_Agent -> FIX_PartyRole_Agent
        | MOD_FIX_PartyRole_ExecutingSystem -> FIX_PartyRole_ExecutingSystem
        | MOD_FIX_PartyRole_SponsoringFirm -> FIX_PartyRole_SponsoringFirm
        | MOD_FIX_PartyRole_Intermediary -> FIX_PartyRole_Intermediary
        | MOD_FIX_PartyRole_IntroducingFirm -> FIX_PartyRole_IntroducingFirm
        | MOD_FIX_PartyRole_EnteringFirm -> FIX_PartyRole_EnteringFirm
        | MOD_FIX_PartyRole_LiquidityProvider -> FIX_PartyRole_LiquidityProvider
        | MOD_FIX_PartyRole_ClearingFirm -> FIX_PartyRole_ClearingFirm
        | MOD_FIX_PartyRole_ContraFirm -> FIX_PartyRole_ContraFirm
        | MOD_FIX_PartyRole_ContraTrader -> FIX_PartyRole_ContraTrader
        | MOD_FIX_PartyRole_CustomerAccount -> FIX_PartyRole_CustomerAccount
        | MOD_FIX_PartyRole_RegulatoryBody -> FIX_PartyRole_RegulatoryBody
        | MOD_FIX_PartyRole_SettlementLocation -> FIX_PartyRole_SettlementLocation
        | MOD_FIX_PartyRole_Exchange -> FIX_PartyRole_Exchange
        | MOD_FIX_PartyRole_Custodian -> FIX_PartyRole_Custodian
        | MOD_FIX_PartyRole_CorrespondentClearingOrganization -> FIX_PartyRole_CorrespondentClearingOrganization
        | MOD_FIX_PartyRole_ExecutingTrader -> FIX_PartyRole_ExecutingTrader
        | MOD_FIX_PartyRole_CorrespondentBroker -> FIX_PartyRole_CorrespondentBroker
        | MOD_FIX_PartyRole_ClientID -> FIX_PartyRole_ClientID
        | MOD_FIX_PartyRole_OrderOriginationTrader -> FIX_PartyRole_OrderOriginationTrader
        | MOD_FIX_PartyRole_Beneficiary -> FIX_PartyRole_Beneficiary
        | MOD_FIX_PartyRole_InterestedParty -> FIX_PartyRole_InterestedParty
        | MOD_FIX_PartyRole_UnderlyingContraFirm -> FIX_PartyRole_UnderlyingContraFirm
        | MOD_FIX_PartyRole_GiveupClearingFirm -> FIX_PartyRole_GiveupClearingFirm
        | MOD_FIX_PartyRole_ClearingOrganization -> FIX_PartyRole_ClearingOrganization
        | MOD_FIX_PartyRole_Locate -> FIX_PartyRole_Locate
        | MOD_FIX_PartyRole_Buyer -> FIX_PartyRole_Buyer
        | MOD_FIX_PartyRole_PositionAccount -> FIX_PartyRole_PositionAccount
        | MOD_FIX_PartyRole_OrderOriginationFirm -> FIX_PartyRole_OrderOriginationFirm
        | MOD_FIX_PartyRole_BrokerOfCredit -> FIX_PartyRole_BrokerOfCredit
        | MOD_FIX_PartyRole_SubCustodian -> FIX_PartyRole_SubCustodian
        | MOD_FIX_PartyRole_EnteringTrader -> FIX_PartyRole_EnteringTrader
        | MOD_FIX_PartyRole_InvestmentDecisionMaker -> FIX_PartyRole_InvestmentDecisionMaker
        | MOD_FIX_PartyRole_ExecutingFirm -> FIX_PartyRole_ExecutingFirm
        | MOD_FIX_PartyRole_FundManagerClientID -> FIX_PartyRole_FundManagerClientID
        | MOD_FIX_PartyRole_ContraClearingFirm -> FIX_PartyRole_ContraClearingFirm
        | MOD_FIX_PartyRole_InvestorID -> FIX_PartyRole_InvestorID
    )
;;
