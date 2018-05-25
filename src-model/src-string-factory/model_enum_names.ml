(* Aesthetic Integration copyright 2018 *)
open Model_app_enums;;

let mod_currency_to_string (d)  =
    (match d with
        | MOD_FIX_Currency_EUR -> "EUR"
        | MOD_FIX_Currency_CHF -> "CHF"
        | MOD_FIX_Currency_USD -> "USD"
        | MOD_FIX_Currency_GBP -> "GBP"
    )
;;

let mod_ordstatus_to_string (d)  =
    (match d with
        | MOD_FIX_OrdStatus_PendingCancel -> "PendingCancel"
        | MOD_FIX_OrdStatus_Stopped -> "Stopped"
        | MOD_FIX_OrdStatus_PendingNew -> "PendingNew"
        | MOD_FIX_OrdStatus_Rejected -> "Rejected"
        | MOD_FIX_OrdStatus_Calculated -> "Calculated"
        | MOD_FIX_OrdStatus_Expired -> "Expired"
        | MOD_FIX_OrdStatus_Filled -> "Filled"
        | MOD_FIX_OrdStatus_Canceled -> "Canceled"
        | MOD_FIX_OrdStatus_Replaced -> "Replaced"
        | MOD_FIX_OrdStatus_PendingReplace -> "PendingReplace"
        | MOD_FIX_OrdStatus_DoneForDay -> "DoneForDay"
        | MOD_FIX_OrdStatus_Suspended -> "Suspended"
        | MOD_FIX_OrdStatus_New -> "New"
        | MOD_FIX_OrdStatus_PartiallyFilled -> "PartiallyFilled"
        | MOD_FIX_OrdStatus_AcceptedForBidding -> "AcceptedForBidding"
    )
;;

let mod_liquidityindicator_to_string (d)  =
    (match d with
        | MOD_FIX_LiquidityIndicator_RemoveLiquidity -> "RemoveLiquidity"
        | MOD_FIX_LiquidityIndicator_AddLiquidity -> "AddLiquidity"
        | MOD_FIX_LiquidityIndicator_PeriodicAuction -> "PeriodicAuction"
    )
;;

let mod_handlinst_to_string (d)  =
    (match d with
        | MOD_FIX_HandlInst_ManualOrder -> "ManualOrder"
        | MOD_FIX_HandlInst_AutomatedExecutionInterventionOK -> "AutomatedExecutionInterventionOK"
        | MOD_FIX_HandlInst_AutomatedExecutionNoIntervention -> "AutomatedExecutionNoIntervention"
    )
;;

let mod_exectype_to_string (d)  =
    (match d with
        | MOD_FIX_ExecType_PendingCancel -> "PendingCancel"
        | MOD_FIX_ExecType_Fill -> "Fill"
        | MOD_FIX_ExecType_Stopped -> "Stopped"
        | MOD_FIX_ExecType_PendingNew -> "PendingNew"
        | MOD_FIX_ExecType_Restated -> "Restated"
        | MOD_FIX_ExecType_Rejected -> "Rejected"
        | MOD_FIX_ExecType_Calculated -> "Calculated"
        | MOD_FIX_ExecType_TradeCorrect -> "TradeCorrect"
        | MOD_FIX_ExecType_TradeCancel -> "TradeCancel"
        | MOD_FIX_ExecType_Expired -> "Expired"
        | MOD_FIX_ExecType_OrderStatus -> "OrderStatus"
        | MOD_FIX_ExecType_PartialFill -> "PartialFill"
        | MOD_FIX_ExecType_Trade -> "Trade"
        | MOD_FIX_ExecType_Canceled -> "Canceled"
        | MOD_FIX_ExecType_Replaced -> "Replaced"
        | MOD_FIX_ExecType_PendingReplace -> "PendingReplace"
        | MOD_FIX_ExecType_DoneForDay -> "DoneForDay"
        | MOD_FIX_ExecType_Suspended -> "Suspended"
        | MOD_FIX_ExecType_New -> "New"
    )
;;

let mod_clearinghandlingtype_to_string (d)  =
    (match d with
        | MOD_FIX_ClearingHandlingType_ManualMode -> "ManualMode"
        | MOD_FIX_ClearingHandlingType_AutomaticExtraction -> "AutomaticExtraction"
        | MOD_FIX_ClearingHandlingType_AutomaticAllocation -> "AutomaticAllocation"
    )
;;

let mod_rule80a_to_string (d)  =
    (match d with
        | MOD_FIX_Rule80A_AgencySingleOrder -> "AgencySingleOrder"
        | MOD_FIX_Rule80A_ShortExemptTransactionForPrincipal -> "ShortExemptTransactionForPrincipal"
        | MOD_FIX_Rule80A_ShortExemptTransactionAType -> "ShortExemptTransactionAType"
        | MOD_FIX_Rule80A_SpecialistTrades -> "SpecialistTrades"
        | MOD_FIX_Rule80A_AgencyNonAlgo -> "AgencyNonAlgo"
        | MOD_FIX_Rule80A_TransactionUnaffiliatedMember -> "TransactionUnaffiliatedMember"
        | MOD_FIX_Rule80A_ShortExemptTransactionWType -> "ShortExemptTransactionWType"
        | MOD_FIX_Rule80A_ProprietaryAlgo -> "ProprietaryAlgo"
        | MOD_FIX_Rule80A_ProprietaryTransactionAffiliated -> "ProprietaryTransactionAffiliated"
        | MOD_FIX_Rule80A_AgencyAlgo -> "AgencyAlgo"
        | MOD_FIX_Rule80A_Principal -> "Principal"
        | MOD_FIX_Rule80A_AllOtherOrdersAsAgentForOtherMember -> "AllOtherOrdersAsAgentForOtherMember"
        | MOD_FIX_Rule80A_ProprietaryNonAlgo -> "ProprietaryNonAlgo"
        | MOD_FIX_Rule80A_ShortExemptTransactionIType -> "ShortExemptTransactionIType"
        | MOD_FIX_Rule80A_AgentForOtherMember -> "AgentForOtherMember"
        | MOD_FIX_Rule80A_ShortExemptTransactionNonMember -> "ShortExemptTransactionNonMember"
        | MOD_FIX_Rule80A_RisklessPrincipal -> "RisklessPrincipal"
        | MOD_FIX_Rule80A_AgencyIndexArb -> "AgencyIndexArb"
        | MOD_FIX_Rule80A_ProgramOrderOtherMember -> "ProgramOrderOtherMember"
        | MOD_FIX_Rule80A_ShortExemptTransactionMemberNotAffliated -> "ShortExemptTransactionMemberNotAffliated"
        | MOD_FIX_Rule80A_ProgramOrderMember -> "ProgramOrderMember"
        | MOD_FIX_Rule80A_House -> "House"
        | MOD_FIX_Rule80A_TransactionNonMember -> "TransactionNonMember"
        | MOD_FIX_Rule80A_IndividualInvestor -> "IndividualInvestor"
        | MOD_FIX_Rule80A_ShortExemptTransactionMemberAffliated -> "ShortExemptTransactionMemberAffliated"
        | MOD_FIX_Rule80A_Client -> "Client"
    )
;;

let mod_partyidsource_to_string (d)  =
    (match d with
        | MOD_FIX_PartyIDSource_CSDParticipant -> "CSDParticipant"
        | MOD_FIX_PartyIDSource_KoreanInvestorID -> "KoreanInvestorID"
        | MOD_FIX_PartyIDSource_USEmployerOrTaxIDNumber -> "USEmployerOrTaxIDNumber"
        | MOD_FIX_PartyIDSource_TaiwaneseForeignInvestorID -> "TaiwaneseForeignInvestorID"
        | MOD_FIX_PartyIDSource_TaiwaneseTradingAcct -> "TaiwaneseTradingAcct"
        | MOD_FIX_PartyIDSource_UKNationalInsuranceOrPensionNumber -> "UKNationalInsuranceOrPensionNumber"
        | MOD_FIX_PartyIDSource_MIC -> "MIC"
        | MOD_FIX_PartyIDSource_USSocialSecurityNumber -> "USSocialSecurityNumber"
        | MOD_FIX_PartyIDSource_Proprietary -> "Proprietary"
        | MOD_FIX_PartyIDSource_AustralianTaxFileNumber -> "AustralianTaxFileNumber"
        | MOD_FIX_PartyIDSource_ShortCodeIdentifier -> "ShortCodeIdentifier"
        | MOD_FIX_PartyIDSource_MalaysianCentralDepository -> "MalaysianCentralDepository"
        | MOD_FIX_PartyIDSource_ISITCAcronym -> "ISITCAcronym"
        | MOD_FIX_PartyIDSource_ISOCountryCode -> "ISOCountryCode"
        | MOD_FIX_PartyIDSource_ChineseInvestorID -> "ChineseInvestorID"
        | MOD_FIX_PartyIDSource_AustralianBusinessNumber -> "AustralianBusinessNumber"
        | MOD_FIX_PartyIDSource_BIC -> "BIC"
        | MOD_FIX_PartyIDSource_GeneralIdentifier -> "GeneralIdentifier"
        | MOD_FIX_PartyIDSource_SettlementEntityLocation -> "SettlementEntityLocation"
    )
;;

let mod_brokerprioritization_to_string (d)  =
    (match d with
        | MOD_FIX_BrokerPrioritization_WithBrokerPrioritization -> "WithBrokerPrioritization"
        | MOD_FIX_BrokerPrioritization_WithoutBrokerPriotization -> "WithoutBrokerPriotization"
    )
;;

let mod_execinst_to_string (d)  =
    (match d with
        | MOD_FIX_ExecInst_ParticipateDoNotInitiate -> "ParticipateDoNotInitiate"
        | MOD_FIX_ExecInst_AllOrNone -> "AllOrNone"
        | MOD_FIX_ExecInst_CallFirst -> "CallFirst"
        | MOD_FIX_ExecInst_PercentOfVolume -> "PercentOfVolume"
        | MOD_FIX_ExecInst_InstitutionsOnly -> "InstitutionsOnly"
        | MOD_FIX_ExecInst_FullSweep -> "FullSweep"
        | MOD_FIX_ExecInst_NoCross -> "NoCross"
        | MOD_FIX_ExecInst_BestOfferPeg -> "BestOfferPeg"
        | MOD_FIX_ExecInst_OverTheDay -> "OverTheDay"
        | MOD_FIX_ExecInst_DoNotIncrease -> "DoNotIncrease"
        | MOD_FIX_ExecInst_OpeningPeg -> "OpeningPeg"
        | MOD_FIX_ExecInst_TryToStop -> "TryToStop"
        | MOD_FIX_ExecInst_Netting -> "Netting"
        | MOD_FIX_ExecInst_StayOnBidSide -> "StayOnBidSide"
        | MOD_FIX_ExecInst_Held -> "Held"
        | MOD_FIX_ExecInst_OKToCross -> "OKToCross"
        | MOD_FIX_ExecInst_CustomerDisplayInstruction -> "CustomerDisplayInstruction"
        | MOD_FIX_ExecInst_GoAlong -> "GoAlong"
        | MOD_FIX_ExecInst_DoNotReduce -> "DoNotReduce"
        | MOD_FIX_ExecInst_StayOnOfferSide -> "StayOnOfferSide"
        | MOD_FIX_ExecInst_PegToLimitPrice -> "PegToLimitPrice"
        | MOD_FIX_ExecInst_TryToScale -> "TryToScale"
        | MOD_FIX_ExecInst_ReinstateOnSystemFailure -> "ReinstateOnSystemFailure"
        | MOD_FIX_ExecInst_CancelIfNotBest -> "CancelIfNotBest"
        | MOD_FIX_ExecInst_BestBidPeg -> "BestBidPeg"
        | MOD_FIX_ExecInst_MidPricePeg -> "MidPricePeg"
        | MOD_FIX_ExecInst_WorkToTargetStrategy -> "WorkToTargetStrategy"
        | MOD_FIX_ExecInst_PegToVWAP -> "PegToVWAP"
        | MOD_FIX_ExecInst_TradeAlong -> "TradeAlong"
        | MOD_FIX_ExecInst_StrictLimit -> "StrictLimit"
        | MOD_FIX_ExecInst_Suspend -> "Suspend"
        | MOD_FIX_ExecInst_LastPeg -> "LastPeg"
        | MOD_FIX_ExecInst_NonNegotiable -> "NonNegotiable"
        | MOD_FIX_ExecInst_HalfSweep -> "HalfSweep"
        | MOD_FIX_ExecInst_NotHeld -> "NotHeld"
        | MOD_FIX_ExecInst_FixedPegToLocalBestBidOrOfferAtTimeOfOrder -> "FixedPegToLocalBestBidOrOfferAtTimeOfOrder"
        | MOD_FIX_ExecInst_CancelOnTradingHalt -> "CancelOnTradingHalt"
        | MOD_FIX_ExecInst_CancelOnSystemFailure -> "CancelOnSystemFailure"
        | MOD_FIX_ExecInst_IgnorePriceValidityChecks -> "IgnorePriceValidityChecks"
        | MOD_FIX_ExecInst_Work -> "Work"
        | MOD_FIX_ExecInst_ReinstateOnTradingHalt -> "ReinstateOnTradingHalt"
        | MOD_FIX_ExecInst_PrimaryPeg -> "PrimaryPeg"
        | MOD_FIX_ExecInst_TrailingStopPeg -> "TrailingStopPeg"
        | MOD_FIX_ExecInst_MarketPeg -> "MarketPeg"
        | MOD_FIX_ExecInst_StrictScale -> "StrictScale"
    )
;;

let mod_exectranstype_to_string (d)  =
    (match d with
        | MOD_FIX_ExecTransType_Status -> "Status"
        | MOD_FIX_ExecTransType_Cancel -> "Cancel"
        | MOD_FIX_ExecTransType_New -> "New"
        | MOD_FIX_ExecTransType_Correct -> "Correct"
    )
;;

let mod_cxlrejreason_to_string (d)  =
    (match d with
        | MOD_FIX_CxlRejReason_Other -> "Other"
        | MOD_FIX_CxlRejReason_OrderAlreadyInPendingStatus -> "OrderAlreadyInPendingStatus"
        | MOD_FIX_CxlRejReason_TooLateToCancel -> "TooLateToCancel"
        | MOD_FIX_CxlRejReason_UnknownOrder -> "UnknownOrder"
        | MOD_FIX_CxlRejReason_UnableToProcessOrderMassCancelRequest -> "UnableToProcessOrderMassCancelRequest"
        | MOD_FIX_CxlRejReason_OrigOrdModTime -> "OrigOrdModTime"
        | MOD_FIX_CxlRejReason_DuplicateClOrdID -> "DuplicateClOrdID"
        | MOD_FIX_CxlRejReason_BrokerCredit -> "BrokerCredit"
    )
;;

let mod_ordtype_to_string (d)  =
    (match d with
        | MOD_FIX_OrdType_LimitOrBetter -> "LimitOrBetter"
        | MOD_FIX_OrdType_NextFundValuationPoint -> "NextFundValuationPoint"
        | MOD_FIX_OrdType_WithOrWithout -> "WithOrWithout"
        | MOD_FIX_OrdType_PreviouslyIndicated -> "PreviouslyIndicated"
        | MOD_FIX_OrdType_Stop -> "Stop"
        | MOD_FIX_OrdType_ForexPreviouslyQuoted -> "ForexPreviouslyQuoted"
        | MOD_FIX_OrdType_Market -> "Market"
        | MOD_FIX_OrdType_OnBasis -> "OnBasis"
        | MOD_FIX_OrdType_Funari -> "Funari"
        | MOD_FIX_OrdType_LimitOnClose -> "LimitOnClose"
        | MOD_FIX_OrdType_Pegged -> "Pegged"
        | MOD_FIX_OrdType_LimitWithOrWithout -> "LimitWithOrWithout"
        | MOD_FIX_OrdType_MarketOnClose -> "MarketOnClose"
        | MOD_FIX_OrdType_StopLimit -> "StopLimit"
        | MOD_FIX_OrdType_ForexSwap -> "ForexSwap"
        | MOD_FIX_OrdType_MarketIfTouched -> "MarketIfTouched"
        | MOD_FIX_OrdType_MarketWithLeftOverAsLimit -> "MarketWithLeftOverAsLimit"
        | MOD_FIX_OrdType_PreviouslyQuoted -> "PreviouslyQuoted"
        | MOD_FIX_OrdType_ForexMarket -> "ForexMarket"
        | MOD_FIX_OrdType_Limit -> "Limit"
        | MOD_FIX_OrdType_PreviousFundValuationPoint -> "PreviousFundValuationPoint"
        | MOD_FIX_OrdType_OnClose -> "OnClose"
        | MOD_FIX_OrdType_ForexLimit -> "ForexLimit"
    )
;;

let mod_technicalordtype_to_string (d)  =
    (match d with
        | MOD_FIX_TechnicalOrdType_CrossMargining -> "CrossMargining"
        | MOD_FIX_TechnicalOrdType_IndexArbitrage -> "IndexArbitrage"
        | MOD_FIX_TechnicalOrdType_UnwindOrder -> "UnwindOrder"
        | MOD_FIX_TechnicalOrdType_OtherOrders -> "OtherOrders"
        | MOD_FIX_TechnicalOrdType_PortfolioStrategy -> "PortfolioStrategy"
    )
;;

let mod_bookindicator_to_string (d)  =
    (match d with
        | MOD_FIX_BookIndicator_Auction -> "Auction"
        | MOD_FIX_BookIndicator_RPW -> "RPW"
    )
;;

let mod_orderattributetypes_to_string (d)  =
    (match d with
        | MOD_FIX_OrderAttributeTypes_AlgorithmicOrder -> "AlgorithmicOrder"
        | MOD_FIX_OrderAttributeTypes_LiquidityProvisionActivity -> "LiquidityProvisionActivity"
    )
;;

let mod_ordrejreason_to_string (d)  =
    (match d with
        | MOD_FIX_OrdRejReason_DuplicateOrder -> "DuplicateOrder"
        | MOD_FIX_OrdRejReason_Other -> "Other"
        | MOD_FIX_OrdRejReason_UnknownOrder -> "UnknownOrder"
        | MOD_FIX_OrdRejReason_DVC_ThresholdBreached -> "DVC_ThresholdBreached"
        | MOD_FIX_OrdRejReason_TooLateToEnter -> "TooLateToEnter"
        | MOD_FIX_OrdRejReason_OrderExceedsLimit -> "OrderExceedsLimit"
        | MOD_FIX_OrdRejReason_UnknownAccount -> "UnknownAccount"
        | MOD_FIX_OrdRejReason_OtherRejectReason -> "OtherRejectReason"
        | MOD_FIX_OrdRejReason_BrokerCredit -> "BrokerCredit"
        | MOD_FIX_OrdRejReason_UnsupportedOrderCharacteristic -> "UnsupportedOrderCharacteristic"
        | MOD_FIX_OrdRejReason_DuplicateOfAVerballyCommunicatedOrder -> "DuplicateOfAVerballyCommunicatedOrder"
        | MOD_FIX_OrdRejReason_IncorrectQuantity -> "IncorrectQuantity"
        | MOD_FIX_OrdRejReason_TradeAlongRequired -> "TradeAlongRequired"
        | MOD_FIX_OrdRejReason_StaleOrder -> "StaleOrder"
        | MOD_FIX_OrdRejReason_InvalidInvestorID -> "InvalidInvestorID"
        | MOD_FIX_OrdRejReason_ExchangeClosed -> "ExchangeClosed"
        | MOD_FIX_OrdRejReason_IncorrectAllocatedQuantity -> "IncorrectAllocatedQuantity"
        | MOD_FIX_OrdRejReason_DVC_ProactivelyHaltedInstrument -> "DVC_ProactivelyHaltedInstrument"
        | MOD_FIX_OrdRejReason_UnknownSymbol -> "UnknownSymbol"
    )
;;

let mod_side_to_string (d)  =
    (match d with
        | MOD_FIX_Side_AsDefined -> "AsDefined"
        | MOD_FIX_Side_Opposite -> "Opposite"
        | MOD_FIX_Side_Buy -> "Buy"
        | MOD_FIX_Side_CrossShortExempt -> "CrossShortExempt"
        | MOD_FIX_Side_Borrow -> "Borrow"
        | MOD_FIX_Side_BuyMinus -> "BuyMinus"
        | MOD_FIX_Side_Subscribe -> "Subscribe"
        | MOD_FIX_Side_Lend -> "Lend"
        | MOD_FIX_Side_SellShortExempt -> "SellShortExempt"
        | MOD_FIX_Side_Redeem -> "Redeem"
        | MOD_FIX_Side_SellPlus -> "SellPlus"
        | MOD_FIX_Side_Sell -> "Sell"
        | MOD_FIX_Side_Undisclosed -> "Undisclosed"
        | MOD_FIX_Side_Cross -> "Cross"
        | MOD_FIX_Side_CrossShort -> "CrossShort"
        | MOD_FIX_Side_SellShort -> "SellShort"
    )
;;

let mod_masscancelrequesttype_to_string (d)  =
    (match d with
        | MOD_FIX_MassCancelRequestType_CancelOrdersForASecurityType -> "CancelOrdersForASecurityType"
        | MOD_FIX_MassCancelRequestType_CancelOrdersForAProduct -> "CancelOrdersForAProduct"
        | MOD_FIX_MassCancelRequestType_CancelOrdersForASecurity -> "CancelOrdersForASecurity"
        | MOD_FIX_MassCancelRequestType_CancelOrdersForAnUnderlyingSecurity -> "CancelOrdersForAnUnderlyingSecurity"
        | MOD_FIX_MassCancelRequestType_CancelAllOrders -> "CancelAllOrders"
        | MOD_FIX_MassCancelRequestType_CancelOrdersForACFICode -> "CancelOrdersForACFICode"
        | MOD_FIX_MassCancelRequestType_CancelOrdersForATradingSession -> "CancelOrdersForATradingSession"
    )
;;

let mod_cxlrejresponseto_to_string (d)  =
    (match d with
        | MOD_FIX_CxlRejResponseTo_OrderCancelRequest -> "OrderCancelRequest"
        | MOD_FIX_CxlRejResponseTo_OrderCancel -> "OrderCancel"
    )
;;

let mod_partyrolequalifier_to_string (d)  =
    (match d with
        | MOD_FIX_PartyRoleQualifier_FirmOrLegalEntity -> "FirmOrLegalEntity"
        | MOD_FIX_PartyRoleQualifier_Algorithm -> "Algorithm"
        | MOD_FIX_PartyRoleQualifier_NaturalPerson -> "NaturalPerson"
    )
;;

let mod_timeinforce_to_string (d)  =
    (match d with
        | MOD_FIX_TimeInForce_GoodTillCancel -> "GoodTillCancel"
        | MOD_FIX_TimeInForce_AtTheClose -> "AtTheClose"
        | MOD_FIX_TimeInForce_ImmediateOrCancel -> "ImmediateOrCancel"
        | MOD_FIX_TimeInForce_Day -> "Day"
        | MOD_FIX_TimeInForce_FillOrKill -> "FillOrKill"
        | MOD_FIX_TimeInForce_GoodForAuction -> "GoodForAuction"
        | MOD_FIX_TimeInForce_AtTheOpening -> "AtTheOpening"
        | MOD_FIX_TimeInForce_GoodTillCrossing -> "GoodTillCrossing"
        | MOD_FIX_TimeInForce_GoodTillDate -> "GoodTillDate"
    )
;;

let mod_openclose_to_string (d)  =
    (match d with
        | MOD_FIX_OpenClose_Close -> "Close"
        | MOD_FIX_OpenClose_Open -> "Open"
    )
;;

let mod_partysubidtype_to_string (d)  =
    (match d with
        | MOD_FIX_PartySubIDType_EmailAddress -> "EmailAddress"
        | MOD_FIX_PartySubIDType_Application -> "Application"
        | MOD_FIX_PartySubIDType_FundAccountName -> "FundAccountName"
        | MOD_FIX_PartySubIDType_FullLegalNameOfFirm -> "FullLegalNameOfFirm"
        | MOD_FIX_PartySubIDType_CSDParticipantMemberCode -> "CSDParticipantMemberCode"
        | MOD_FIX_PartySubIDType_RegistrationName -> "RegistrationName"
        | MOD_FIX_PartySubIDType_PostalAddress -> "PostalAddress"
        | MOD_FIX_PartySubIDType_SecuritiesAccountNumber -> "SecuritiesAccountNumber"
        | MOD_FIX_PartySubIDType_RegisteredAddress -> "RegisteredAddress"
        | MOD_FIX_PartySubIDType_TelexNumber -> "TelexNumber"
        | MOD_FIX_PartySubIDType_RegulatoryStatus -> "RegulatoryStatus"
        | MOD_FIX_PartySubIDType_PhoneNumber -> "PhoneNumber"
        | MOD_FIX_PartySubIDType_Firm -> "Firm"
        | MOD_FIX_PartySubIDType_Person -> "Person"
        | MOD_FIX_PartySubIDType_ContactName -> "ContactName"
        | MOD_FIX_PartySubIDType_CashAccountNumber -> "CashAccountNumber"
        | MOD_FIX_PartySubIDType_CashAccountName -> "CashAccountName"
        | MOD_FIX_PartySubIDType_LocationDesk -> "LocationDesk"
        | MOD_FIX_PartySubIDType_RegisteredAddressForConfirmation -> "RegisteredAddressForConfirmation"
        | MOD_FIX_PartySubIDType_PositionAccountType -> "PositionAccountType"
        | MOD_FIX_PartySubIDType_System -> "System"
        | MOD_FIX_PartySubIDType_Department -> "Department"
        | MOD_FIX_PartySubIDType_FaxNumber -> "FaxNumber"
        | MOD_FIX_PartySubIDType_RegistrationNumber -> "RegistrationNumber"
        | MOD_FIX_PartySubIDType_BIC -> "BIC"
        | MOD_FIX_PartySubIDType_SecuritiesAccountName -> "SecuritiesAccountName"
    )
;;

let mod_crosstype_to_string (d)  =
    (match d with
        | MOD_FIX_CrossType_CrossIOC -> "CrossIOC"
        | MOD_FIX_CrossType_CrossOneSide -> "CrossOneSide"
        | MOD_FIX_CrossType_CrossSamePrice -> "CrossSamePrice"
        | MOD_FIX_CrossType_CrossAON -> "CrossAON"
        | MOD_FIX_CrossType_NotSignificant -> "NotSignificant"
        | MOD_FIX_CrossType_StandardCross -> "StandardCross"
    )
;;

let mod_partyrole_to_string (d)  =
    (match d with
        | MOD_FIX_PartyRole_CorrespondantClearingFirm -> "CorrespondantClearingFirm"
        | MOD_FIX_PartyRole_Agent -> "Agent"
        | MOD_FIX_PartyRole_ExecutingSystem -> "ExecutingSystem"
        | MOD_FIX_PartyRole_SponsoringFirm -> "SponsoringFirm"
        | MOD_FIX_PartyRole_Intermediary -> "Intermediary"
        | MOD_FIX_PartyRole_IntroducingFirm -> "IntroducingFirm"
        | MOD_FIX_PartyRole_EnteringFirm -> "EnteringFirm"
        | MOD_FIX_PartyRole_LiquidityProvider -> "LiquidityProvider"
        | MOD_FIX_PartyRole_ClearingFirm -> "ClearingFirm"
        | MOD_FIX_PartyRole_ContraFirm -> "ContraFirm"
        | MOD_FIX_PartyRole_ContraTrader -> "ContraTrader"
        | MOD_FIX_PartyRole_CustomerAccount -> "CustomerAccount"
        | MOD_FIX_PartyRole_RegulatoryBody -> "RegulatoryBody"
        | MOD_FIX_PartyRole_SettlementLocation -> "SettlementLocation"
        | MOD_FIX_PartyRole_Exchange -> "Exchange"
        | MOD_FIX_PartyRole_Custodian -> "Custodian"
        | MOD_FIX_PartyRole_CorrespondentClearingOrganization -> "CorrespondentClearingOrganization"
        | MOD_FIX_PartyRole_ExecutingTrader -> "ExecutingTrader"
        | MOD_FIX_PartyRole_CorrespondentBroker -> "CorrespondentBroker"
        | MOD_FIX_PartyRole_ClientID -> "ClientID"
        | MOD_FIX_PartyRole_OrderOriginationTrader -> "OrderOriginationTrader"
        | MOD_FIX_PartyRole_Beneficiary -> "Beneficiary"
        | MOD_FIX_PartyRole_InterestedParty -> "InterestedParty"
        | MOD_FIX_PartyRole_UnderlyingContraFirm -> "UnderlyingContraFirm"
        | MOD_FIX_PartyRole_GiveupClearingFirm -> "GiveupClearingFirm"
        | MOD_FIX_PartyRole_ClearingOrganization -> "ClearingOrganization"
        | MOD_FIX_PartyRole_Locate -> "Locate"
        | MOD_FIX_PartyRole_Buyer -> "Buyer"
        | MOD_FIX_PartyRole_PositionAccount -> "PositionAccount"
        | MOD_FIX_PartyRole_OrderOriginationFirm -> "OrderOriginationFirm"
        | MOD_FIX_PartyRole_BrokerOfCredit -> "BrokerOfCredit"
        | MOD_FIX_PartyRole_SubCustodian -> "SubCustodian"
        | MOD_FIX_PartyRole_EnteringTrader -> "EnteringTrader"
        | MOD_FIX_PartyRole_InvestmentDecisionMaker -> "InvestmentDecisionMaker"
        | MOD_FIX_PartyRole_ExecutingFirm -> "ExecutingFirm"
        | MOD_FIX_PartyRole_FundManagerClientID -> "FundManagerClientID"
        | MOD_FIX_PartyRole_ContraClearingFirm -> "ContraClearingFirm"
        | MOD_FIX_PartyRole_InvestorID -> "InvestorID"
    )
;;

let string_to_mod_currency_opt (d)  =
    (match d with
        | "EUR" -> (Some (MOD_FIX_Currency_EUR))
        | "CHF" -> (Some (MOD_FIX_Currency_CHF))
        | "USD" -> (Some (MOD_FIX_Currency_USD))
        | "GBP" -> (Some (MOD_FIX_Currency_GBP))
        | _ -> (None)
    )
;;

let string_to_mod_ordstatus_opt (d)  =
    (match d with
        | "PendingCancel" -> (Some (MOD_FIX_OrdStatus_PendingCancel))
        | "Stopped" -> (Some (MOD_FIX_OrdStatus_Stopped))
        | "PendingNew" -> (Some (MOD_FIX_OrdStatus_PendingNew))
        | "Rejected" -> (Some (MOD_FIX_OrdStatus_Rejected))
        | "Calculated" -> (Some (MOD_FIX_OrdStatus_Calculated))
        | "Expired" -> (Some (MOD_FIX_OrdStatus_Expired))
        | "Filled" -> (Some (MOD_FIX_OrdStatus_Filled))
        | "Canceled" -> (Some (MOD_FIX_OrdStatus_Canceled))
        | "Replaced" -> (Some (MOD_FIX_OrdStatus_Replaced))
        | "PendingReplace" -> (Some (MOD_FIX_OrdStatus_PendingReplace))
        | "DoneForDay" -> (Some (MOD_FIX_OrdStatus_DoneForDay))
        | "Suspended" -> (Some (MOD_FIX_OrdStatus_Suspended))
        | "New" -> (Some (MOD_FIX_OrdStatus_New))
        | "PartiallyFilled" -> (Some (MOD_FIX_OrdStatus_PartiallyFilled))
        | "AcceptedForBidding" -> (Some (MOD_FIX_OrdStatus_AcceptedForBidding))
        | _ -> (None)
    )
;;

let string_to_mod_liquidityindicator_opt (d)  =
    (match d with
        | "RemoveLiquidity" -> (Some (MOD_FIX_LiquidityIndicator_RemoveLiquidity))
        | "AddLiquidity" -> (Some (MOD_FIX_LiquidityIndicator_AddLiquidity))
        | "PeriodicAuction" -> (Some (MOD_FIX_LiquidityIndicator_PeriodicAuction))
        | _ -> (None)
    )
;;

let string_to_mod_handlinst_opt (d)  =
    (match d with
        | "ManualOrder" -> (Some (MOD_FIX_HandlInst_ManualOrder))
        | "AutomatedExecutionInterventionOK" -> (Some (MOD_FIX_HandlInst_AutomatedExecutionInterventionOK))
        | "AutomatedExecutionNoIntervention" -> (Some (MOD_FIX_HandlInst_AutomatedExecutionNoIntervention))
        | _ -> (None)
    )
;;

let string_to_mod_exectype_opt (d)  =
    (match d with
        | "PendingCancel" -> (Some (MOD_FIX_ExecType_PendingCancel))
        | "Fill" -> (Some (MOD_FIX_ExecType_Fill))
        | "Stopped" -> (Some (MOD_FIX_ExecType_Stopped))
        | "PendingNew" -> (Some (MOD_FIX_ExecType_PendingNew))
        | "Restated" -> (Some (MOD_FIX_ExecType_Restated))
        | "Rejected" -> (Some (MOD_FIX_ExecType_Rejected))
        | "Calculated" -> (Some (MOD_FIX_ExecType_Calculated))
        | "TradeCorrect" -> (Some (MOD_FIX_ExecType_TradeCorrect))
        | "TradeCancel" -> (Some (MOD_FIX_ExecType_TradeCancel))
        | "Expired" -> (Some (MOD_FIX_ExecType_Expired))
        | "OrderStatus" -> (Some (MOD_FIX_ExecType_OrderStatus))
        | "PartialFill" -> (Some (MOD_FIX_ExecType_PartialFill))
        | "Trade" -> (Some (MOD_FIX_ExecType_Trade))
        | "Canceled" -> (Some (MOD_FIX_ExecType_Canceled))
        | "Replaced" -> (Some (MOD_FIX_ExecType_Replaced))
        | "PendingReplace" -> (Some (MOD_FIX_ExecType_PendingReplace))
        | "DoneForDay" -> (Some (MOD_FIX_ExecType_DoneForDay))
        | "Suspended" -> (Some (MOD_FIX_ExecType_Suspended))
        | "New" -> (Some (MOD_FIX_ExecType_New))
        | _ -> (None)
    )
;;

let string_to_mod_clearinghandlingtype_opt (d)  =
    (match d with
        | "ManualMode" -> (Some (MOD_FIX_ClearingHandlingType_ManualMode))
        | "AutomaticExtraction" -> (Some (MOD_FIX_ClearingHandlingType_AutomaticExtraction))
        | "AutomaticAllocation" -> (Some (MOD_FIX_ClearingHandlingType_AutomaticAllocation))
        | _ -> (None)
    )
;;

let string_to_mod_rule80a_opt (d)  =
    (match d with
        | "AgencySingleOrder" -> (Some (MOD_FIX_Rule80A_AgencySingleOrder))
        | "ShortExemptTransactionForPrincipal" -> (Some (MOD_FIX_Rule80A_ShortExemptTransactionForPrincipal))
        | "ShortExemptTransactionAType" -> (Some (MOD_FIX_Rule80A_ShortExemptTransactionAType))
        | "SpecialistTrades" -> (Some (MOD_FIX_Rule80A_SpecialistTrades))
        | "AgencyNonAlgo" -> (Some (MOD_FIX_Rule80A_AgencyNonAlgo))
        | "TransactionUnaffiliatedMember" -> (Some (MOD_FIX_Rule80A_TransactionUnaffiliatedMember))
        | "ShortExemptTransactionWType" -> (Some (MOD_FIX_Rule80A_ShortExemptTransactionWType))
        | "ProprietaryAlgo" -> (Some (MOD_FIX_Rule80A_ProprietaryAlgo))
        | "ProprietaryTransactionAffiliated" -> (Some (MOD_FIX_Rule80A_ProprietaryTransactionAffiliated))
        | "AgencyAlgo" -> (Some (MOD_FIX_Rule80A_AgencyAlgo))
        | "Principal" -> (Some (MOD_FIX_Rule80A_Principal))
        | "AllOtherOrdersAsAgentForOtherMember" -> (Some (MOD_FIX_Rule80A_AllOtherOrdersAsAgentForOtherMember))
        | "ProprietaryNonAlgo" -> (Some (MOD_FIX_Rule80A_ProprietaryNonAlgo))
        | "ShortExemptTransactionIType" -> (Some (MOD_FIX_Rule80A_ShortExemptTransactionIType))
        | "AgentForOtherMember" -> (Some (MOD_FIX_Rule80A_AgentForOtherMember))
        | "ShortExemptTransactionNonMember" -> (Some (MOD_FIX_Rule80A_ShortExemptTransactionNonMember))
        | "RisklessPrincipal" -> (Some (MOD_FIX_Rule80A_RisklessPrincipal))
        | "AgencyIndexArb" -> (Some (MOD_FIX_Rule80A_AgencyIndexArb))
        | "ProgramOrderOtherMember" -> (Some (MOD_FIX_Rule80A_ProgramOrderOtherMember))
        | "ShortExemptTransactionMemberNotAffliated" -> (Some (MOD_FIX_Rule80A_ShortExemptTransactionMemberNotAffliated))
        | "ProgramOrderMember" -> (Some (MOD_FIX_Rule80A_ProgramOrderMember))
        | "House" -> (Some (MOD_FIX_Rule80A_House))
        | "TransactionNonMember" -> (Some (MOD_FIX_Rule80A_TransactionNonMember))
        | "IndividualInvestor" -> (Some (MOD_FIX_Rule80A_IndividualInvestor))
        | "ShortExemptTransactionMemberAffliated" -> (Some (MOD_FIX_Rule80A_ShortExemptTransactionMemberAffliated))
        | "Client" -> (Some (MOD_FIX_Rule80A_Client))
        | _ -> (None)
    )
;;

let string_to_mod_partyidsource_opt (d)  =
    (match d with
        | "CSDParticipant" -> (Some (MOD_FIX_PartyIDSource_CSDParticipant))
        | "KoreanInvestorID" -> (Some (MOD_FIX_PartyIDSource_KoreanInvestorID))
        | "USEmployerOrTaxIDNumber" -> (Some (MOD_FIX_PartyIDSource_USEmployerOrTaxIDNumber))
        | "TaiwaneseForeignInvestorID" -> (Some (MOD_FIX_PartyIDSource_TaiwaneseForeignInvestorID))
        | "TaiwaneseTradingAcct" -> (Some (MOD_FIX_PartyIDSource_TaiwaneseTradingAcct))
        | "UKNationalInsuranceOrPensionNumber" -> (Some (MOD_FIX_PartyIDSource_UKNationalInsuranceOrPensionNumber))
        | "MIC" -> (Some (MOD_FIX_PartyIDSource_MIC))
        | "USSocialSecurityNumber" -> (Some (MOD_FIX_PartyIDSource_USSocialSecurityNumber))
        | "Proprietary" -> (Some (MOD_FIX_PartyIDSource_Proprietary))
        | "AustralianTaxFileNumber" -> (Some (MOD_FIX_PartyIDSource_AustralianTaxFileNumber))
        | "ShortCodeIdentifier" -> (Some (MOD_FIX_PartyIDSource_ShortCodeIdentifier))
        | "MalaysianCentralDepository" -> (Some (MOD_FIX_PartyIDSource_MalaysianCentralDepository))
        | "ISITCAcronym" -> (Some (MOD_FIX_PartyIDSource_ISITCAcronym))
        | "ISOCountryCode" -> (Some (MOD_FIX_PartyIDSource_ISOCountryCode))
        | "ChineseInvestorID" -> (Some (MOD_FIX_PartyIDSource_ChineseInvestorID))
        | "AustralianBusinessNumber" -> (Some (MOD_FIX_PartyIDSource_AustralianBusinessNumber))
        | "BIC" -> (Some (MOD_FIX_PartyIDSource_BIC))
        | "GeneralIdentifier" -> (Some (MOD_FIX_PartyIDSource_GeneralIdentifier))
        | "SettlementEntityLocation" -> (Some (MOD_FIX_PartyIDSource_SettlementEntityLocation))
        | _ -> (None)
    )
;;

let string_to_mod_brokerprioritization_opt (d)  =
    (match d with
        | "WithBrokerPrioritization" -> (Some (MOD_FIX_BrokerPrioritization_WithBrokerPrioritization))
        | "WithoutBrokerPriotization" -> (Some (MOD_FIX_BrokerPrioritization_WithoutBrokerPriotization))
        | _ -> (None)
    )
;;

let string_to_mod_execinst_opt (d)  =
    (match d with
        | "ParticipateDoNotInitiate" -> (Some (MOD_FIX_ExecInst_ParticipateDoNotInitiate))
        | "AllOrNone" -> (Some (MOD_FIX_ExecInst_AllOrNone))
        | "CallFirst" -> (Some (MOD_FIX_ExecInst_CallFirst))
        | "PercentOfVolume" -> (Some (MOD_FIX_ExecInst_PercentOfVolume))
        | "InstitutionsOnly" -> (Some (MOD_FIX_ExecInst_InstitutionsOnly))
        | "FullSweep" -> (Some (MOD_FIX_ExecInst_FullSweep))
        | "NoCross" -> (Some (MOD_FIX_ExecInst_NoCross))
        | "BestOfferPeg" -> (Some (MOD_FIX_ExecInst_BestOfferPeg))
        | "OverTheDay" -> (Some (MOD_FIX_ExecInst_OverTheDay))
        | "DoNotIncrease" -> (Some (MOD_FIX_ExecInst_DoNotIncrease))
        | "OpeningPeg" -> (Some (MOD_FIX_ExecInst_OpeningPeg))
        | "TryToStop" -> (Some (MOD_FIX_ExecInst_TryToStop))
        | "Netting" -> (Some (MOD_FIX_ExecInst_Netting))
        | "StayOnBidSide" -> (Some (MOD_FIX_ExecInst_StayOnBidSide))
        | "Held" -> (Some (MOD_FIX_ExecInst_Held))
        | "OKToCross" -> (Some (MOD_FIX_ExecInst_OKToCross))
        | "CustomerDisplayInstruction" -> (Some (MOD_FIX_ExecInst_CustomerDisplayInstruction))
        | "GoAlong" -> (Some (MOD_FIX_ExecInst_GoAlong))
        | "DoNotReduce" -> (Some (MOD_FIX_ExecInst_DoNotReduce))
        | "StayOnOfferSide" -> (Some (MOD_FIX_ExecInst_StayOnOfferSide))
        | "PegToLimitPrice" -> (Some (MOD_FIX_ExecInst_PegToLimitPrice))
        | "TryToScale" -> (Some (MOD_FIX_ExecInst_TryToScale))
        | "ReinstateOnSystemFailure" -> (Some (MOD_FIX_ExecInst_ReinstateOnSystemFailure))
        | "CancelIfNotBest" -> (Some (MOD_FIX_ExecInst_CancelIfNotBest))
        | "BestBidPeg" -> (Some (MOD_FIX_ExecInst_BestBidPeg))
        | "MidPricePeg" -> (Some (MOD_FIX_ExecInst_MidPricePeg))
        | "WorkToTargetStrategy" -> (Some (MOD_FIX_ExecInst_WorkToTargetStrategy))
        | "PegToVWAP" -> (Some (MOD_FIX_ExecInst_PegToVWAP))
        | "TradeAlong" -> (Some (MOD_FIX_ExecInst_TradeAlong))
        | "StrictLimit" -> (Some (MOD_FIX_ExecInst_StrictLimit))
        | "Suspend" -> (Some (MOD_FIX_ExecInst_Suspend))
        | "LastPeg" -> (Some (MOD_FIX_ExecInst_LastPeg))
        | "NonNegotiable" -> (Some (MOD_FIX_ExecInst_NonNegotiable))
        | "HalfSweep" -> (Some (MOD_FIX_ExecInst_HalfSweep))
        | "NotHeld" -> (Some (MOD_FIX_ExecInst_NotHeld))
        | "FixedPegToLocalBestBidOrOfferAtTimeOfOrder" -> (Some (MOD_FIX_ExecInst_FixedPegToLocalBestBidOrOfferAtTimeOfOrder))
        | "CancelOnTradingHalt" -> (Some (MOD_FIX_ExecInst_CancelOnTradingHalt))
        | "CancelOnSystemFailure" -> (Some (MOD_FIX_ExecInst_CancelOnSystemFailure))
        | "IgnorePriceValidityChecks" -> (Some (MOD_FIX_ExecInst_IgnorePriceValidityChecks))
        | "Work" -> (Some (MOD_FIX_ExecInst_Work))
        | "ReinstateOnTradingHalt" -> (Some (MOD_FIX_ExecInst_ReinstateOnTradingHalt))
        | "PrimaryPeg" -> (Some (MOD_FIX_ExecInst_PrimaryPeg))
        | "TrailingStopPeg" -> (Some (MOD_FIX_ExecInst_TrailingStopPeg))
        | "MarketPeg" -> (Some (MOD_FIX_ExecInst_MarketPeg))
        | "StrictScale" -> (Some (MOD_FIX_ExecInst_StrictScale))
        | _ -> (None)
    )
;;

let string_to_mod_exectranstype_opt (d)  =
    (match d with
        | "Status" -> (Some (MOD_FIX_ExecTransType_Status))
        | "Cancel" -> (Some (MOD_FIX_ExecTransType_Cancel))
        | "New" -> (Some (MOD_FIX_ExecTransType_New))
        | "Correct" -> (Some (MOD_FIX_ExecTransType_Correct))
        | _ -> (None)
    )
;;

let string_to_mod_cxlrejreason_opt (d)  =
    (match d with
        | "Other" -> (Some (MOD_FIX_CxlRejReason_Other))
        | "OrderAlreadyInPendingStatus" -> (Some (MOD_FIX_CxlRejReason_OrderAlreadyInPendingStatus))
        | "TooLateToCancel" -> (Some (MOD_FIX_CxlRejReason_TooLateToCancel))
        | "UnknownOrder" -> (Some (MOD_FIX_CxlRejReason_UnknownOrder))
        | "UnableToProcessOrderMassCancelRequest" -> (Some (MOD_FIX_CxlRejReason_UnableToProcessOrderMassCancelRequest))
        | "OrigOrdModTime" -> (Some (MOD_FIX_CxlRejReason_OrigOrdModTime))
        | "DuplicateClOrdID" -> (Some (MOD_FIX_CxlRejReason_DuplicateClOrdID))
        | "BrokerCredit" -> (Some (MOD_FIX_CxlRejReason_BrokerCredit))
        | _ -> (None)
    )
;;

let string_to_mod_ordtype_opt (d)  =
    (match d with
        | "LimitOrBetter" -> (Some (MOD_FIX_OrdType_LimitOrBetter))
        | "NextFundValuationPoint" -> (Some (MOD_FIX_OrdType_NextFundValuationPoint))
        | "WithOrWithout" -> (Some (MOD_FIX_OrdType_WithOrWithout))
        | "PreviouslyIndicated" -> (Some (MOD_FIX_OrdType_PreviouslyIndicated))
        | "Stop" -> (Some (MOD_FIX_OrdType_Stop))
        | "ForexPreviouslyQuoted" -> (Some (MOD_FIX_OrdType_ForexPreviouslyQuoted))
        | "Market" -> (Some (MOD_FIX_OrdType_Market))
        | "OnBasis" -> (Some (MOD_FIX_OrdType_OnBasis))
        | "Funari" -> (Some (MOD_FIX_OrdType_Funari))
        | "LimitOnClose" -> (Some (MOD_FIX_OrdType_LimitOnClose))
        | "Pegged" -> (Some (MOD_FIX_OrdType_Pegged))
        | "LimitWithOrWithout" -> (Some (MOD_FIX_OrdType_LimitWithOrWithout))
        | "MarketOnClose" -> (Some (MOD_FIX_OrdType_MarketOnClose))
        | "StopLimit" -> (Some (MOD_FIX_OrdType_StopLimit))
        | "ForexSwap" -> (Some (MOD_FIX_OrdType_ForexSwap))
        | "MarketIfTouched" -> (Some (MOD_FIX_OrdType_MarketIfTouched))
        | "MarketWithLeftOverAsLimit" -> (Some (MOD_FIX_OrdType_MarketWithLeftOverAsLimit))
        | "PreviouslyQuoted" -> (Some (MOD_FIX_OrdType_PreviouslyQuoted))
        | "ForexMarket" -> (Some (MOD_FIX_OrdType_ForexMarket))
        | "Limit" -> (Some (MOD_FIX_OrdType_Limit))
        | "PreviousFundValuationPoint" -> (Some (MOD_FIX_OrdType_PreviousFundValuationPoint))
        | "OnClose" -> (Some (MOD_FIX_OrdType_OnClose))
        | "ForexLimit" -> (Some (MOD_FIX_OrdType_ForexLimit))
        | _ -> (None)
    )
;;

let string_to_mod_technicalordtype_opt (d)  =
    (match d with
        | "CrossMargining" -> (Some (MOD_FIX_TechnicalOrdType_CrossMargining))
        | "IndexArbitrage" -> (Some (MOD_FIX_TechnicalOrdType_IndexArbitrage))
        | "UnwindOrder" -> (Some (MOD_FIX_TechnicalOrdType_UnwindOrder))
        | "OtherOrders" -> (Some (MOD_FIX_TechnicalOrdType_OtherOrders))
        | "PortfolioStrategy" -> (Some (MOD_FIX_TechnicalOrdType_PortfolioStrategy))
        | _ -> (None)
    )
;;

let string_to_mod_bookindicator_opt (d)  =
    (match d with
        | "Auction" -> (Some (MOD_FIX_BookIndicator_Auction))
        | "RPW" -> (Some (MOD_FIX_BookIndicator_RPW))
        | _ -> (None)
    )
;;

let string_to_mod_orderattributetypes_opt (d)  =
    (match d with
        | "AlgorithmicOrder" -> (Some (MOD_FIX_OrderAttributeTypes_AlgorithmicOrder))
        | "LiquidityProvisionActivity" -> (Some (MOD_FIX_OrderAttributeTypes_LiquidityProvisionActivity))
        | _ -> (None)
    )
;;

let string_to_mod_ordrejreason_opt (d)  =
    (match d with
        | "DuplicateOrder" -> (Some (MOD_FIX_OrdRejReason_DuplicateOrder))
        | "Other" -> (Some (MOD_FIX_OrdRejReason_Other))
        | "UnknownOrder" -> (Some (MOD_FIX_OrdRejReason_UnknownOrder))
        | "DVC_ThresholdBreached" -> (Some (MOD_FIX_OrdRejReason_DVC_ThresholdBreached))
        | "TooLateToEnter" -> (Some (MOD_FIX_OrdRejReason_TooLateToEnter))
        | "OrderExceedsLimit" -> (Some (MOD_FIX_OrdRejReason_OrderExceedsLimit))
        | "UnknownAccount" -> (Some (MOD_FIX_OrdRejReason_UnknownAccount))
        | "OtherRejectReason" -> (Some (MOD_FIX_OrdRejReason_OtherRejectReason))
        | "BrokerCredit" -> (Some (MOD_FIX_OrdRejReason_BrokerCredit))
        | "UnsupportedOrderCharacteristic" -> (Some (MOD_FIX_OrdRejReason_UnsupportedOrderCharacteristic))
        | "DuplicateOfAVerballyCommunicatedOrder" -> (Some (MOD_FIX_OrdRejReason_DuplicateOfAVerballyCommunicatedOrder))
        | "IncorrectQuantity" -> (Some (MOD_FIX_OrdRejReason_IncorrectQuantity))
        | "TradeAlongRequired" -> (Some (MOD_FIX_OrdRejReason_TradeAlongRequired))
        | "StaleOrder" -> (Some (MOD_FIX_OrdRejReason_StaleOrder))
        | "InvalidInvestorID" -> (Some (MOD_FIX_OrdRejReason_InvalidInvestorID))
        | "ExchangeClosed" -> (Some (MOD_FIX_OrdRejReason_ExchangeClosed))
        | "IncorrectAllocatedQuantity" -> (Some (MOD_FIX_OrdRejReason_IncorrectAllocatedQuantity))
        | "DVC_ProactivelyHaltedInstrument" -> (Some (MOD_FIX_OrdRejReason_DVC_ProactivelyHaltedInstrument))
        | "UnknownSymbol" -> (Some (MOD_FIX_OrdRejReason_UnknownSymbol))
        | _ -> (None)
    )
;;

let string_to_mod_side_opt (d)  =
    (match d with
        | "AsDefined" -> (Some (MOD_FIX_Side_AsDefined))
        | "Opposite" -> (Some (MOD_FIX_Side_Opposite))
        | "Buy" -> (Some (MOD_FIX_Side_Buy))
        | "CrossShortExempt" -> (Some (MOD_FIX_Side_CrossShortExempt))
        | "Borrow" -> (Some (MOD_FIX_Side_Borrow))
        | "BuyMinus" -> (Some (MOD_FIX_Side_BuyMinus))
        | "Subscribe" -> (Some (MOD_FIX_Side_Subscribe))
        | "Lend" -> (Some (MOD_FIX_Side_Lend))
        | "SellShortExempt" -> (Some (MOD_FIX_Side_SellShortExempt))
        | "Redeem" -> (Some (MOD_FIX_Side_Redeem))
        | "SellPlus" -> (Some (MOD_FIX_Side_SellPlus))
        | "Sell" -> (Some (MOD_FIX_Side_Sell))
        | "Undisclosed" -> (Some (MOD_FIX_Side_Undisclosed))
        | "Cross" -> (Some (MOD_FIX_Side_Cross))
        | "CrossShort" -> (Some (MOD_FIX_Side_CrossShort))
        | "SellShort" -> (Some (MOD_FIX_Side_SellShort))
        | _ -> (None)
    )
;;

let string_to_mod_masscancelrequesttype_opt (d)  =
    (match d with
        | "CancelOrdersForASecurityType" -> (Some (MOD_FIX_MassCancelRequestType_CancelOrdersForASecurityType))
        | "CancelOrdersForAProduct" -> (Some (MOD_FIX_MassCancelRequestType_CancelOrdersForAProduct))
        | "CancelOrdersForASecurity" -> (Some (MOD_FIX_MassCancelRequestType_CancelOrdersForASecurity))
        | "CancelOrdersForAnUnderlyingSecurity" -> (Some (MOD_FIX_MassCancelRequestType_CancelOrdersForAnUnderlyingSecurity))
        | "CancelAllOrders" -> (Some (MOD_FIX_MassCancelRequestType_CancelAllOrders))
        | "CancelOrdersForACFICode" -> (Some (MOD_FIX_MassCancelRequestType_CancelOrdersForACFICode))
        | "CancelOrdersForATradingSession" -> (Some (MOD_FIX_MassCancelRequestType_CancelOrdersForATradingSession))
        | _ -> (None)
    )
;;

let string_to_mod_cxlrejresponseto_opt (d)  =
    (match d with
        | "OrderCancelRequest" -> (Some (MOD_FIX_CxlRejResponseTo_OrderCancelRequest))
        | "OrderCancel" -> (Some (MOD_FIX_CxlRejResponseTo_OrderCancel))
        | _ -> (None)
    )
;;

let string_to_mod_partyrolequalifier_opt (d)  =
    (match d with
        | "FirmOrLegalEntity" -> (Some (MOD_FIX_PartyRoleQualifier_FirmOrLegalEntity))
        | "Algorithm" -> (Some (MOD_FIX_PartyRoleQualifier_Algorithm))
        | "NaturalPerson" -> (Some (MOD_FIX_PartyRoleQualifier_NaturalPerson))
        | _ -> (None)
    )
;;

let string_to_mod_timeinforce_opt (d)  =
    (match d with
        | "GoodTillCancel" -> (Some (MOD_FIX_TimeInForce_GoodTillCancel))
        | "AtTheClose" -> (Some (MOD_FIX_TimeInForce_AtTheClose))
        | "ImmediateOrCancel" -> (Some (MOD_FIX_TimeInForce_ImmediateOrCancel))
        | "Day" -> (Some (MOD_FIX_TimeInForce_Day))
        | "FillOrKill" -> (Some (MOD_FIX_TimeInForce_FillOrKill))
        | "GoodForAuction" -> (Some (MOD_FIX_TimeInForce_GoodForAuction))
        | "AtTheOpening" -> (Some (MOD_FIX_TimeInForce_AtTheOpening))
        | "GoodTillCrossing" -> (Some (MOD_FIX_TimeInForce_GoodTillCrossing))
        | "GoodTillDate" -> (Some (MOD_FIX_TimeInForce_GoodTillDate))
        | _ -> (None)
    )
;;

let string_to_mod_openclose_opt (d)  =
    (match d with
        | "Close" -> (Some (MOD_FIX_OpenClose_Close))
        | "Open" -> (Some (MOD_FIX_OpenClose_Open))
        | _ -> (None)
    )
;;

let string_to_mod_partysubidtype_opt (d)  =
    (match d with
        | "EmailAddress" -> (Some (MOD_FIX_PartySubIDType_EmailAddress))
        | "Application" -> (Some (MOD_FIX_PartySubIDType_Application))
        | "FundAccountName" -> (Some (MOD_FIX_PartySubIDType_FundAccountName))
        | "FullLegalNameOfFirm" -> (Some (MOD_FIX_PartySubIDType_FullLegalNameOfFirm))
        | "CSDParticipantMemberCode" -> (Some (MOD_FIX_PartySubIDType_CSDParticipantMemberCode))
        | "RegistrationName" -> (Some (MOD_FIX_PartySubIDType_RegistrationName))
        | "PostalAddress" -> (Some (MOD_FIX_PartySubIDType_PostalAddress))
        | "SecuritiesAccountNumber" -> (Some (MOD_FIX_PartySubIDType_SecuritiesAccountNumber))
        | "RegisteredAddress" -> (Some (MOD_FIX_PartySubIDType_RegisteredAddress))
        | "TelexNumber" -> (Some (MOD_FIX_PartySubIDType_TelexNumber))
        | "RegulatoryStatus" -> (Some (MOD_FIX_PartySubIDType_RegulatoryStatus))
        | "PhoneNumber" -> (Some (MOD_FIX_PartySubIDType_PhoneNumber))
        | "Firm" -> (Some (MOD_FIX_PartySubIDType_Firm))
        | "Person" -> (Some (MOD_FIX_PartySubIDType_Person))
        | "ContactName" -> (Some (MOD_FIX_PartySubIDType_ContactName))
        | "CashAccountNumber" -> (Some (MOD_FIX_PartySubIDType_CashAccountNumber))
        | "CashAccountName" -> (Some (MOD_FIX_PartySubIDType_CashAccountName))
        | "LocationDesk" -> (Some (MOD_FIX_PartySubIDType_LocationDesk))
        | "RegisteredAddressForConfirmation" -> (Some (MOD_FIX_PartySubIDType_RegisteredAddressForConfirmation))
        | "PositionAccountType" -> (Some (MOD_FIX_PartySubIDType_PositionAccountType))
        | "System" -> (Some (MOD_FIX_PartySubIDType_System))
        | "Department" -> (Some (MOD_FIX_PartySubIDType_Department))
        | "FaxNumber" -> (Some (MOD_FIX_PartySubIDType_FaxNumber))
        | "RegistrationNumber" -> (Some (MOD_FIX_PartySubIDType_RegistrationNumber))
        | "BIC" -> (Some (MOD_FIX_PartySubIDType_BIC))
        | "SecuritiesAccountName" -> (Some (MOD_FIX_PartySubIDType_SecuritiesAccountName))
        | _ -> (None)
    )
;;

let string_to_mod_crosstype_opt (d)  =
    (match d with
        | "CrossIOC" -> (Some (MOD_FIX_CrossType_CrossIOC))
        | "CrossOneSide" -> (Some (MOD_FIX_CrossType_CrossOneSide))
        | "CrossSamePrice" -> (Some (MOD_FIX_CrossType_CrossSamePrice))
        | "CrossAON" -> (Some (MOD_FIX_CrossType_CrossAON))
        | "NotSignificant" -> (Some (MOD_FIX_CrossType_NotSignificant))
        | "StandardCross" -> (Some (MOD_FIX_CrossType_StandardCross))
        | _ -> (None)
    )
;;

let string_to_mod_partyrole_opt (d)  =
    (match d with
        | "CorrespondantClearingFirm" -> (Some (MOD_FIX_PartyRole_CorrespondantClearingFirm))
        | "Agent" -> (Some (MOD_FIX_PartyRole_Agent))
        | "ExecutingSystem" -> (Some (MOD_FIX_PartyRole_ExecutingSystem))
        | "SponsoringFirm" -> (Some (MOD_FIX_PartyRole_SponsoringFirm))
        | "Intermediary" -> (Some (MOD_FIX_PartyRole_Intermediary))
        | "IntroducingFirm" -> (Some (MOD_FIX_PartyRole_IntroducingFirm))
        | "EnteringFirm" -> (Some (MOD_FIX_PartyRole_EnteringFirm))
        | "LiquidityProvider" -> (Some (MOD_FIX_PartyRole_LiquidityProvider))
        | "ClearingFirm" -> (Some (MOD_FIX_PartyRole_ClearingFirm))
        | "ContraFirm" -> (Some (MOD_FIX_PartyRole_ContraFirm))
        | "ContraTrader" -> (Some (MOD_FIX_PartyRole_ContraTrader))
        | "CustomerAccount" -> (Some (MOD_FIX_PartyRole_CustomerAccount))
        | "RegulatoryBody" -> (Some (MOD_FIX_PartyRole_RegulatoryBody))
        | "SettlementLocation" -> (Some (MOD_FIX_PartyRole_SettlementLocation))
        | "Exchange" -> (Some (MOD_FIX_PartyRole_Exchange))
        | "Custodian" -> (Some (MOD_FIX_PartyRole_Custodian))
        | "CorrespondentClearingOrganization" -> (Some (MOD_FIX_PartyRole_CorrespondentClearingOrganization))
        | "ExecutingTrader" -> (Some (MOD_FIX_PartyRole_ExecutingTrader))
        | "CorrespondentBroker" -> (Some (MOD_FIX_PartyRole_CorrespondentBroker))
        | "ClientID" -> (Some (MOD_FIX_PartyRole_ClientID))
        | "OrderOriginationTrader" -> (Some (MOD_FIX_PartyRole_OrderOriginationTrader))
        | "Beneficiary" -> (Some (MOD_FIX_PartyRole_Beneficiary))
        | "InterestedParty" -> (Some (MOD_FIX_PartyRole_InterestedParty))
        | "UnderlyingContraFirm" -> (Some (MOD_FIX_PartyRole_UnderlyingContraFirm))
        | "GiveupClearingFirm" -> (Some (MOD_FIX_PartyRole_GiveupClearingFirm))
        | "ClearingOrganization" -> (Some (MOD_FIX_PartyRole_ClearingOrganization))
        | "Locate" -> (Some (MOD_FIX_PartyRole_Locate))
        | "Buyer" -> (Some (MOD_FIX_PartyRole_Buyer))
        | "PositionAccount" -> (Some (MOD_FIX_PartyRole_PositionAccount))
        | "OrderOriginationFirm" -> (Some (MOD_FIX_PartyRole_OrderOriginationFirm))
        | "BrokerOfCredit" -> (Some (MOD_FIX_PartyRole_BrokerOfCredit))
        | "SubCustodian" -> (Some (MOD_FIX_PartyRole_SubCustodian))
        | "EnteringTrader" -> (Some (MOD_FIX_PartyRole_EnteringTrader))
        | "InvestmentDecisionMaker" -> (Some (MOD_FIX_PartyRole_InvestmentDecisionMaker))
        | "ExecutingFirm" -> (Some (MOD_FIX_PartyRole_ExecutingFirm))
        | "FundManagerClientID" -> (Some (MOD_FIX_PartyRole_FundManagerClientID))
        | "ContraClearingFirm" -> (Some (MOD_FIX_PartyRole_ContraClearingFirm))
        | "InvestorID" -> (Some (MOD_FIX_PartyRole_InvestorID))
        | _ -> (None)
    )
;;
