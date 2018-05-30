(* Aesthetic Integration copyright 2018 *)
open Model_app_enums;;

let mod_ordtype_to_string (d)  =
    (match d with
        | MOD_FIX_OrdType_Market -> "Market"
        | MOD_FIX_OrdType_Limit -> "Limit"
        | MOD_FIX_OrdType_Stop -> "Stop"
        | MOD_FIX_OrdType_StopLimit -> "StopLimit"
        | MOD_FIX_OrdType_MarketOnClose -> "MarketOnClose"
        | MOD_FIX_OrdType_WithOrWithout -> "WithOrWithout"
        | MOD_FIX_OrdType_LimitOrBetter -> "LimitOrBetter"
        | MOD_FIX_OrdType_LimitWithOrWithout -> "LimitWithOrWithout"
        | MOD_FIX_OrdType_OnBasis -> "OnBasis"
        | MOD_FIX_OrdType_OnClose -> "OnClose"
        | MOD_FIX_OrdType_LimitOnClose -> "LimitOnClose"
        | MOD_FIX_OrdType_ForexMarket -> "ForexMarket"
        | MOD_FIX_OrdType_PreviouslyQuoted -> "PreviouslyQuoted"
        | MOD_FIX_OrdType_PreviouslyIndicated -> "PreviouslyIndicated"
        | MOD_FIX_OrdType_ForexLimit -> "ForexLimit"
        | MOD_FIX_OrdType_ForexSwap -> "ForexSwap"
        | MOD_FIX_OrdType_ForexPreviouslyQuoted -> "ForexPreviouslyQuoted"
        | MOD_FIX_OrdType_Funari -> "Funari"
        | MOD_FIX_OrdType_Pegged -> "Pegged"
        | MOD_FIX_OrdType_MarketIfTouched -> "MarketIfTouched"
        | MOD_FIX_OrdType_MarketWithLeftOverAsLimit -> "MarketWithLeftOverAsLimit"
        | MOD_FIX_OrdType_PreviousFundValuationPoint -> "PreviousFundValuationPoint"
        | MOD_FIX_OrdType_NextFundValuationPoint -> "NextFundValuationPoint"
    )
;;

let mod_openclose_to_string (d)  =
    (match d with
        | MOD_FIX_OpenClose_Close -> "Close"
        | MOD_FIX_OpenClose_Open -> "Open"
    )
;;

let mod_partyrole_to_string (d)  =
    (match d with
        | MOD_FIX_PartyRole_ExecutingFirm -> "ExecutingFirm"
        | MOD_FIX_PartyRole_BrokerOfCredit -> "BrokerOfCredit"
        | MOD_FIX_PartyRole_ClientID -> "ClientID"
        | MOD_FIX_PartyRole_ClearingFirm -> "ClearingFirm"
        | MOD_FIX_PartyRole_InvestorID -> "InvestorID"
        | MOD_FIX_PartyRole_IntroducingFirm -> "IntroducingFirm"
        | MOD_FIX_PartyRole_EnteringFirm -> "EnteringFirm"
        | MOD_FIX_PartyRole_Locate -> "Locate"
        | MOD_FIX_PartyRole_FundManagerClientID -> "FundManagerClientID"
        | MOD_FIX_PartyRole_SettlementLocation -> "SettlementLocation"
        | MOD_FIX_PartyRole_OrderOriginationTrader -> "OrderOriginationTrader"
        | MOD_FIX_PartyRole_ExecutingTrader -> "ExecutingTrader"
        | MOD_FIX_PartyRole_OrderOriginationFirm -> "OrderOriginationFirm"
        | MOD_FIX_PartyRole_GiveupClearingFirm -> "GiveupClearingFirm"
        | MOD_FIX_PartyRole_CorrespondantClearingFirm -> "CorrespondantClearingFirm"
        | MOD_FIX_PartyRole_ExecutingSystem -> "ExecutingSystem"
        | MOD_FIX_PartyRole_ContraFirm -> "ContraFirm"
        | MOD_FIX_PartyRole_ContraClearingFirm -> "ContraClearingFirm"
        | MOD_FIX_PartyRole_SponsoringFirm -> "SponsoringFirm"
        | MOD_FIX_PartyRole_UnderlyingContraFirm -> "UnderlyingContraFirm"
        | MOD_FIX_PartyRole_ClearingOrganization -> "ClearingOrganization"
        | MOD_FIX_PartyRole_Exchange -> "Exchange"
        | MOD_FIX_PartyRole_CustomerAccount -> "CustomerAccount"
        | MOD_FIX_PartyRole_CorrespondentClearingOrganization -> "CorrespondentClearingOrganization"
        | MOD_FIX_PartyRole_CorrespondentBroker -> "CorrespondentBroker"
        | MOD_FIX_PartyRole_Buyer -> "Buyer"
        | MOD_FIX_PartyRole_Custodian -> "Custodian"
        | MOD_FIX_PartyRole_Intermediary -> "Intermediary"
        | MOD_FIX_PartyRole_Agent -> "Agent"
        | MOD_FIX_PartyRole_SubCustodian -> "SubCustodian"
        | MOD_FIX_PartyRole_Beneficiary -> "Beneficiary"
        | MOD_FIX_PartyRole_InterestedParty -> "InterestedParty"
        | MOD_FIX_PartyRole_RegulatoryBody -> "RegulatoryBody"
        | MOD_FIX_PartyRole_LiquidityProvider -> "LiquidityProvider"
        | MOD_FIX_PartyRole_EnteringTrader -> "EnteringTrader"
        | MOD_FIX_PartyRole_ContraTrader -> "ContraTrader"
        | MOD_FIX_PartyRole_PositionAccount -> "PositionAccount"
        | MOD_FIX_PartyRole_InvestmentDecisionMaker -> "InvestmentDecisionMaker"
    )
;;

let mod_brokerprioritization_to_string (d)  =
    (match d with
        | MOD_FIX_BrokerPrioritization_WithoutBrokerPriotization -> "WithoutBrokerPriotization"
        | MOD_FIX_BrokerPrioritization_WithBrokerPrioritization -> "WithBrokerPrioritization"
    )
;;

let mod_partysubidtype_to_string (d)  =
    (match d with
        | MOD_FIX_PartySubIDType_Firm -> "Firm"
        | MOD_FIX_PartySubIDType_Person -> "Person"
        | MOD_FIX_PartySubIDType_System -> "System"
        | MOD_FIX_PartySubIDType_Application -> "Application"
        | MOD_FIX_PartySubIDType_FullLegalNameOfFirm -> "FullLegalNameOfFirm"
        | MOD_FIX_PartySubIDType_PostalAddress -> "PostalAddress"
        | MOD_FIX_PartySubIDType_PhoneNumber -> "PhoneNumber"
        | MOD_FIX_PartySubIDType_EmailAddress -> "EmailAddress"
        | MOD_FIX_PartySubIDType_ContactName -> "ContactName"
        | MOD_FIX_PartySubIDType_SecuritiesAccountNumber -> "SecuritiesAccountNumber"
        | MOD_FIX_PartySubIDType_RegistrationNumber -> "RegistrationNumber"
        | MOD_FIX_PartySubIDType_RegisteredAddressForConfirmation -> "RegisteredAddressForConfirmation"
        | MOD_FIX_PartySubIDType_RegulatoryStatus -> "RegulatoryStatus"
        | MOD_FIX_PartySubIDType_RegistrationName -> "RegistrationName"
        | MOD_FIX_PartySubIDType_CashAccountNumber -> "CashAccountNumber"
        | MOD_FIX_PartySubIDType_BIC -> "BIC"
        | MOD_FIX_PartySubIDType_CSDParticipantMemberCode -> "CSDParticipantMemberCode"
        | MOD_FIX_PartySubIDType_RegisteredAddress -> "RegisteredAddress"
        | MOD_FIX_PartySubIDType_FundAccountName -> "FundAccountName"
        | MOD_FIX_PartySubIDType_TelexNumber -> "TelexNumber"
        | MOD_FIX_PartySubIDType_FaxNumber -> "FaxNumber"
        | MOD_FIX_PartySubIDType_SecuritiesAccountName -> "SecuritiesAccountName"
        | MOD_FIX_PartySubIDType_CashAccountName -> "CashAccountName"
        | MOD_FIX_PartySubIDType_Department -> "Department"
        | MOD_FIX_PartySubIDType_LocationDesk -> "LocationDesk"
        | MOD_FIX_PartySubIDType_PositionAccountType -> "PositionAccountType"
    )
;;

let mod_partyidsource_to_string (d)  =
    (match d with
        | MOD_FIX_PartyIDSource_BIC -> "BIC"
        | MOD_FIX_PartyIDSource_GeneralIdentifier -> "GeneralIdentifier"
        | MOD_FIX_PartyIDSource_Proprietary -> "Proprietary"
        | MOD_FIX_PartyIDSource_ISOCountryCode -> "ISOCountryCode"
        | MOD_FIX_PartyIDSource_SettlementEntityLocation -> "SettlementEntityLocation"
        | MOD_FIX_PartyIDSource_MIC -> "MIC"
        | MOD_FIX_PartyIDSource_CSDParticipant -> "CSDParticipant"
        | MOD_FIX_PartyIDSource_KoreanInvestorID -> "KoreanInvestorID"
        | MOD_FIX_PartyIDSource_TaiwaneseForeignInvestorID -> "TaiwaneseForeignInvestorID"
        | MOD_FIX_PartyIDSource_TaiwaneseTradingAcct -> "TaiwaneseTradingAcct"
        | MOD_FIX_PartyIDSource_MalaysianCentralDepository -> "MalaysianCentralDepository"
        | MOD_FIX_PartyIDSource_ChineseInvestorID -> "ChineseInvestorID"
        | MOD_FIX_PartyIDSource_UKNationalInsuranceOrPensionNumber -> "UKNationalInsuranceOrPensionNumber"
        | MOD_FIX_PartyIDSource_USSocialSecurityNumber -> "USSocialSecurityNumber"
        | MOD_FIX_PartyIDSource_USEmployerOrTaxIDNumber -> "USEmployerOrTaxIDNumber"
        | MOD_FIX_PartyIDSource_AustralianBusinessNumber -> "AustralianBusinessNumber"
        | MOD_FIX_PartyIDSource_AustralianTaxFileNumber -> "AustralianTaxFileNumber"
        | MOD_FIX_PartyIDSource_ISITCAcronym -> "ISITCAcronym"
        | MOD_FIX_PartyIDSource_ShortCodeIdentifier -> "ShortCodeIdentifier"
    )
;;

let mod_timeinforce_to_string (d)  =
    (match d with
        | MOD_FIX_TimeInForce_Day -> "Day"
        | MOD_FIX_TimeInForce_GoodTillCancel -> "GoodTillCancel"
        | MOD_FIX_TimeInForce_AtTheOpening -> "AtTheOpening"
        | MOD_FIX_TimeInForce_ImmediateOrCancel -> "ImmediateOrCancel"
        | MOD_FIX_TimeInForce_FillOrKill -> "FillOrKill"
        | MOD_FIX_TimeInForce_GoodTillCrossing -> "GoodTillCrossing"
        | MOD_FIX_TimeInForce_GoodTillDate -> "GoodTillDate"
        | MOD_FIX_TimeInForce_AtTheClose -> "AtTheClose"
        | MOD_FIX_TimeInForce_GoodForAuction -> "GoodForAuction"
    )
;;

let mod_execinst_to_string (d)  =
    (match d with
        | MOD_FIX_ExecInst_StayOnOfferSide -> "StayOnOfferSide"
        | MOD_FIX_ExecInst_NotHeld -> "NotHeld"
        | MOD_FIX_ExecInst_Work -> "Work"
        | MOD_FIX_ExecInst_GoAlong -> "GoAlong"
        | MOD_FIX_ExecInst_OverTheDay -> "OverTheDay"
        | MOD_FIX_ExecInst_Held -> "Held"
        | MOD_FIX_ExecInst_ParticipateDoNotInitiate -> "ParticipateDoNotInitiate"
        | MOD_FIX_ExecInst_StrictScale -> "StrictScale"
        | MOD_FIX_ExecInst_TryToScale -> "TryToScale"
        | MOD_FIX_ExecInst_StayOnBidSide -> "StayOnBidSide"
        | MOD_FIX_ExecInst_NoCross -> "NoCross"
        | MOD_FIX_ExecInst_OKToCross -> "OKToCross"
        | MOD_FIX_ExecInst_CallFirst -> "CallFirst"
        | MOD_FIX_ExecInst_PercentOfVolume -> "PercentOfVolume"
        | MOD_FIX_ExecInst_DoNotIncrease -> "DoNotIncrease"
        | MOD_FIX_ExecInst_DoNotReduce -> "DoNotReduce"
        | MOD_FIX_ExecInst_AllOrNone -> "AllOrNone"
        | MOD_FIX_ExecInst_InstitutionsOnly -> "InstitutionsOnly"
        | MOD_FIX_ExecInst_LastPeg -> "LastPeg"
        | MOD_FIX_ExecInst_MidPricePeg -> "MidPricePeg"
        | MOD_FIX_ExecInst_NonNegotiable -> "NonNegotiable"
        | MOD_FIX_ExecInst_OpeningPeg -> "OpeningPeg"
        | MOD_FIX_ExecInst_MarketPeg -> "MarketPeg"
        | MOD_FIX_ExecInst_PrimaryPeg -> "PrimaryPeg"
        | MOD_FIX_ExecInst_Suspend -> "Suspend"
        | MOD_FIX_ExecInst_FixedPegToLocalBestBidOrOfferAtTimeOfOrder -> "FixedPegToLocalBestBidOrOfferAtTimeOfOrder"
        | MOD_FIX_ExecInst_CustomerDisplayInstruction -> "CustomerDisplayInstruction"
        | MOD_FIX_ExecInst_Netting -> "Netting"
        | MOD_FIX_ExecInst_PegToVWAP -> "PegToVWAP"
        | MOD_FIX_ExecInst_ReinstateOnSystemFailure -> "ReinstateOnSystemFailure"
        | MOD_FIX_ExecInst_ReinstateOnTradingHalt -> "ReinstateOnTradingHalt"
        | MOD_FIX_ExecInst_CancelOnTradingHalt -> "CancelOnTradingHalt"
        | MOD_FIX_ExecInst_CancelOnSystemFailure -> "CancelOnSystemFailure"
        | MOD_FIX_ExecInst_TradeAlong -> "TradeAlong"
        | MOD_FIX_ExecInst_TryToStop -> "TryToStop"
        | MOD_FIX_ExecInst_CancelIfNotBest -> "CancelIfNotBest"
        | MOD_FIX_ExecInst_TrailingStopPeg -> "TrailingStopPeg"
        | MOD_FIX_ExecInst_StrictLimit -> "StrictLimit"
        | MOD_FIX_ExecInst_IgnorePriceValidityChecks -> "IgnorePriceValidityChecks"
        | MOD_FIX_ExecInst_PegToLimitPrice -> "PegToLimitPrice"
        | MOD_FIX_ExecInst_WorkToTargetStrategy -> "WorkToTargetStrategy"
        | MOD_FIX_ExecInst_BestBidPeg -> "BestBidPeg"
        | MOD_FIX_ExecInst_BestOfferPeg -> "BestOfferPeg"
        | MOD_FIX_ExecInst_HalfSweep -> "HalfSweep"
        | MOD_FIX_ExecInst_FullSweep -> "FullSweep"
    )
;;

let mod_masscancelrequesttype_to_string (d)  =
    (match d with
        | MOD_FIX_MassCancelRequestType_CancelOrdersForASecurity -> "CancelOrdersForASecurity"
        | MOD_FIX_MassCancelRequestType_CancelOrdersForAnUnderlyingSecurity -> "CancelOrdersForAnUnderlyingSecurity"
        | MOD_FIX_MassCancelRequestType_CancelOrdersForAProduct -> "CancelOrdersForAProduct"
        | MOD_FIX_MassCancelRequestType_CancelOrdersForACFICode -> "CancelOrdersForACFICode"
        | MOD_FIX_MassCancelRequestType_CancelOrdersForASecurityType -> "CancelOrdersForASecurityType"
        | MOD_FIX_MassCancelRequestType_CancelOrdersForATradingSession -> "CancelOrdersForATradingSession"
        | MOD_FIX_MassCancelRequestType_CancelAllOrders -> "CancelAllOrders"
    )
;;

let mod_exectranstype_to_string (d)  =
    (match d with
        | MOD_FIX_ExecTransType_New -> "New"
        | MOD_FIX_ExecTransType_Cancel -> "Cancel"
        | MOD_FIX_ExecTransType_Correct -> "Correct"
        | MOD_FIX_ExecTransType_Status -> "Status"
    )
;;

let mod_cxlrejreason_to_string (d)  =
    (match d with
        | MOD_FIX_CxlRejReason_TooLateToCancel -> "TooLateToCancel"
        | MOD_FIX_CxlRejReason_UnknownOrder -> "UnknownOrder"
        | MOD_FIX_CxlRejReason_BrokerCredit -> "BrokerCredit"
        | MOD_FIX_CxlRejReason_OrderAlreadyInPendingStatus -> "OrderAlreadyInPendingStatus"
        | MOD_FIX_CxlRejReason_UnableToProcessOrderMassCancelRequest -> "UnableToProcessOrderMassCancelRequest"
        | MOD_FIX_CxlRejReason_OrigOrdModTime -> "OrigOrdModTime"
        | MOD_FIX_CxlRejReason_DuplicateClOrdID -> "DuplicateClOrdID"
        | MOD_FIX_CxlRejReason_Other -> "Other"
    )
;;

let mod_ordstatus_to_string (d)  =
    (match d with
        | MOD_FIX_OrdStatus_New -> "New"
        | MOD_FIX_OrdStatus_PartiallyFilled -> "PartiallyFilled"
        | MOD_FIX_OrdStatus_Filled -> "Filled"
        | MOD_FIX_OrdStatus_DoneForDay -> "DoneForDay"
        | MOD_FIX_OrdStatus_Canceled -> "Canceled"
        | MOD_FIX_OrdStatus_Replaced -> "Replaced"
        | MOD_FIX_OrdStatus_PendingCancel -> "PendingCancel"
        | MOD_FIX_OrdStatus_Stopped -> "Stopped"
        | MOD_FIX_OrdStatus_Rejected -> "Rejected"
        | MOD_FIX_OrdStatus_Suspended -> "Suspended"
        | MOD_FIX_OrdStatus_PendingNew -> "PendingNew"
        | MOD_FIX_OrdStatus_Calculated -> "Calculated"
        | MOD_FIX_OrdStatus_Expired -> "Expired"
        | MOD_FIX_OrdStatus_AcceptedForBidding -> "AcceptedForBidding"
        | MOD_FIX_OrdStatus_PendingReplace -> "PendingReplace"
    )
;;

let mod_technicalordtype_to_string (d)  =
    (match d with
        | MOD_FIX_TechnicalOrdType_IndexArbitrage -> "IndexArbitrage"
        | MOD_FIX_TechnicalOrdType_PortfolioStrategy -> "PortfolioStrategy"
        | MOD_FIX_TechnicalOrdType_UnwindOrder -> "UnwindOrder"
        | MOD_FIX_TechnicalOrdType_OtherOrders -> "OtherOrders"
        | MOD_FIX_TechnicalOrdType_CrossMargining -> "CrossMargining"
    )
;;

let mod_side_to_string (d)  =
    (match d with
        | MOD_FIX_Side_Buy -> "Buy"
        | MOD_FIX_Side_Sell -> "Sell"
        | MOD_FIX_Side_BuyMinus -> "BuyMinus"
        | MOD_FIX_Side_SellPlus -> "SellPlus"
        | MOD_FIX_Side_SellShort -> "SellShort"
        | MOD_FIX_Side_SellShortExempt -> "SellShortExempt"
        | MOD_FIX_Side_Undisclosed -> "Undisclosed"
        | MOD_FIX_Side_Cross -> "Cross"
        | MOD_FIX_Side_CrossShort -> "CrossShort"
        | MOD_FIX_Side_CrossShortExempt -> "CrossShortExempt"
        | MOD_FIX_Side_AsDefined -> "AsDefined"
        | MOD_FIX_Side_Opposite -> "Opposite"
        | MOD_FIX_Side_Subscribe -> "Subscribe"
        | MOD_FIX_Side_Redeem -> "Redeem"
        | MOD_FIX_Side_Lend -> "Lend"
        | MOD_FIX_Side_Borrow -> "Borrow"
    )
;;

let mod_handlinst_to_string (d)  =
    (match d with
        | MOD_FIX_HandlInst_AutomatedExecutionNoIntervention -> "AutomatedExecutionNoIntervention"
        | MOD_FIX_HandlInst_AutomatedExecutionInterventionOK -> "AutomatedExecutionInterventionOK"
        | MOD_FIX_HandlInst_ManualOrder -> "ManualOrder"
    )
;;

let mod_currency_to_string (d)  =
    (match d with
        | MOD_FIX_Currency_EUR -> "EUR"
        | MOD_FIX_Currency_GBP -> "GBP"
        | MOD_FIX_Currency_USD -> "USD"
        | MOD_FIX_Currency_CHF -> "CHF"
    )
;;

let mod_liquidityindicator_to_string (d)  =
    (match d with
        | MOD_FIX_LiquidityIndicator_AddLiquidity -> "AddLiquidity"
        | MOD_FIX_LiquidityIndicator_RemoveLiquidity -> "RemoveLiquidity"
        | MOD_FIX_LiquidityIndicator_PeriodicAuction -> "PeriodicAuction"
    )
;;

let mod_partyrolequalifier_to_string (d)  =
    (match d with
        | MOD_FIX_PartyRoleQualifier_Algorithm -> "Algorithm"
        | MOD_FIX_PartyRoleQualifier_FirmOrLegalEntity -> "FirmOrLegalEntity"
        | MOD_FIX_PartyRoleQualifier_NaturalPerson -> "NaturalPerson"
    )
;;

let mod_crosstype_to_string (d)  =
    (match d with
        | MOD_FIX_CrossType_CrossAON -> "CrossAON"
        | MOD_FIX_CrossType_CrossIOC -> "CrossIOC"
        | MOD_FIX_CrossType_CrossOneSide -> "CrossOneSide"
        | MOD_FIX_CrossType_CrossSamePrice -> "CrossSamePrice"
        | MOD_FIX_CrossType_NotSignificant -> "NotSignificant"
        | MOD_FIX_CrossType_StandardCross -> "StandardCross"
    )
;;

let mod_orderattributetypes_to_string (d)  =
    (match d with
        | MOD_FIX_OrderAttributeTypes_LiquidityProvisionActivity -> "LiquidityProvisionActivity"
        | MOD_FIX_OrderAttributeTypes_AlgorithmicOrder -> "AlgorithmicOrder"
    )
;;

let mod_bookindicator_to_string (d)  =
    (match d with
        | MOD_FIX_BookIndicator_Auction -> "Auction"
        | MOD_FIX_BookIndicator_RPW -> "RPW"
    )
;;

let mod_rule80a_to_string (d)  =
    (match d with
        | MOD_FIX_Rule80A_AgencySingleOrder -> "AgencySingleOrder"
        | MOD_FIX_Rule80A_ShortExemptTransactionAType -> "ShortExemptTransactionAType"
        | MOD_FIX_Rule80A_ProprietaryNonAlgo -> "ProprietaryNonAlgo"
        | MOD_FIX_Rule80A_ProgramOrderMember -> "ProgramOrderMember"
        | MOD_FIX_Rule80A_ShortExemptTransactionForPrincipal -> "ShortExemptTransactionForPrincipal"
        | MOD_FIX_Rule80A_ShortExemptTransactionWType -> "ShortExemptTransactionWType"
        | MOD_FIX_Rule80A_ShortExemptTransactionIType -> "ShortExemptTransactionIType"
        | MOD_FIX_Rule80A_IndividualInvestor -> "IndividualInvestor"
        | MOD_FIX_Rule80A_ProprietaryAlgo -> "ProprietaryAlgo"
        | MOD_FIX_Rule80A_AgencyAlgo -> "AgencyAlgo"
        | MOD_FIX_Rule80A_ShortExemptTransactionMemberAffliated -> "ShortExemptTransactionMemberAffliated"
        | MOD_FIX_Rule80A_ProgramOrderOtherMember -> "ProgramOrderOtherMember"
        | MOD_FIX_Rule80A_AgentForOtherMember -> "AgentForOtherMember"
        | MOD_FIX_Rule80A_ProprietaryTransactionAffiliated -> "ProprietaryTransactionAffiliated"
        | MOD_FIX_Rule80A_Principal -> "Principal"
        | MOD_FIX_Rule80A_TransactionNonMember -> "TransactionNonMember"
        | MOD_FIX_Rule80A_SpecialistTrades -> "SpecialistTrades"
        | MOD_FIX_Rule80A_TransactionUnaffiliatedMember -> "TransactionUnaffiliatedMember"
        | MOD_FIX_Rule80A_AgencyIndexArb -> "AgencyIndexArb"
        | MOD_FIX_Rule80A_AllOtherOrdersAsAgentForOtherMember -> "AllOtherOrdersAsAgentForOtherMember"
        | MOD_FIX_Rule80A_ShortExemptTransactionMemberNotAffliated -> "ShortExemptTransactionMemberNotAffliated"
        | MOD_FIX_Rule80A_AgencyNonAlgo -> "AgencyNonAlgo"
        | MOD_FIX_Rule80A_ShortExemptTransactionNonMember -> "ShortExemptTransactionNonMember"
        | MOD_FIX_Rule80A_Client -> "Client"
        | MOD_FIX_Rule80A_House -> "House"
        | MOD_FIX_Rule80A_RisklessPrincipal -> "RisklessPrincipal"
    )
;;

let mod_exectype_to_string (d)  =
    (match d with
        | MOD_FIX_ExecType_New -> "New"
        | MOD_FIX_ExecType_PartialFill -> "PartialFill"
        | MOD_FIX_ExecType_Fill -> "Fill"
        | MOD_FIX_ExecType_DoneForDay -> "DoneForDay"
        | MOD_FIX_ExecType_Canceled -> "Canceled"
        | MOD_FIX_ExecType_Replaced -> "Replaced"
        | MOD_FIX_ExecType_PendingCancel -> "PendingCancel"
        | MOD_FIX_ExecType_Stopped -> "Stopped"
        | MOD_FIX_ExecType_Rejected -> "Rejected"
        | MOD_FIX_ExecType_Suspended -> "Suspended"
        | MOD_FIX_ExecType_PendingNew -> "PendingNew"
        | MOD_FIX_ExecType_Calculated -> "Calculated"
        | MOD_FIX_ExecType_Expired -> "Expired"
        | MOD_FIX_ExecType_Restated -> "Restated"
        | MOD_FIX_ExecType_PendingReplace -> "PendingReplace"
        | MOD_FIX_ExecType_Trade -> "Trade"
        | MOD_FIX_ExecType_TradeCorrect -> "TradeCorrect"
        | MOD_FIX_ExecType_TradeCancel -> "TradeCancel"
        | MOD_FIX_ExecType_OrderStatus -> "OrderStatus"
    )
;;

let mod_clearinghandlingtype_to_string (d)  =
    (match d with
        | MOD_FIX_ClearingHandlingType_ManualMode -> "ManualMode"
        | MOD_FIX_ClearingHandlingType_AutomaticExtraction -> "AutomaticExtraction"
        | MOD_FIX_ClearingHandlingType_AutomaticAllocation -> "AutomaticAllocation"
    )
;;

let mod_cxlrejresponseto_to_string (d)  =
    (match d with
        | MOD_FIX_CxlRejResponseTo_OrderCancelRequest -> "OrderCancelRequest"
        | MOD_FIX_CxlRejResponseTo_OrderCancel -> "OrderCancel"
    )
;;

let mod_ordrejreason_to_string (d)  =
    (match d with
        | MOD_FIX_OrdRejReason_BrokerCredit -> "BrokerCredit"
        | MOD_FIX_OrdRejReason_UnknownSymbol -> "UnknownSymbol"
        | MOD_FIX_OrdRejReason_ExchangeClosed -> "ExchangeClosed"
        | MOD_FIX_OrdRejReason_OrderExceedsLimit -> "OrderExceedsLimit"
        | MOD_FIX_OrdRejReason_TooLateToEnter -> "TooLateToEnter"
        | MOD_FIX_OrdRejReason_UnknownOrder -> "UnknownOrder"
        | MOD_FIX_OrdRejReason_DuplicateOrder -> "DuplicateOrder"
        | MOD_FIX_OrdRejReason_DuplicateOfAVerballyCommunicatedOrder -> "DuplicateOfAVerballyCommunicatedOrder"
        | MOD_FIX_OrdRejReason_StaleOrder -> "StaleOrder"
        | MOD_FIX_OrdRejReason_TradeAlongRequired -> "TradeAlongRequired"
        | MOD_FIX_OrdRejReason_InvalidInvestorID -> "InvalidInvestorID"
        | MOD_FIX_OrdRejReason_UnsupportedOrderCharacteristic -> "UnsupportedOrderCharacteristic"
        | MOD_FIX_OrdRejReason_IncorrectQuantity -> "IncorrectQuantity"
        | MOD_FIX_OrdRejReason_IncorrectAllocatedQuantity -> "IncorrectAllocatedQuantity"
        | MOD_FIX_OrdRejReason_UnknownAccount -> "UnknownAccount"
        | MOD_FIX_OrdRejReason_Other -> "Other"
        | MOD_FIX_OrdRejReason_DVC_ProactivelyHaltedInstrument -> "DVC_ProactivelyHaltedInstrument"
        | MOD_FIX_OrdRejReason_DVC_ThresholdBreached -> "DVC_ThresholdBreached"
        | MOD_FIX_OrdRejReason_OtherRejectReason -> "OtherRejectReason"
    )
;;

let string_to_mod_ordtype_opt (d)  =
    (match d with
        | "Market" -> (Some (MOD_FIX_OrdType_Market))
        | "Limit" -> (Some (MOD_FIX_OrdType_Limit))
        | "Stop" -> (Some (MOD_FIX_OrdType_Stop))
        | "StopLimit" -> (Some (MOD_FIX_OrdType_StopLimit))
        | "MarketOnClose" -> (Some (MOD_FIX_OrdType_MarketOnClose))
        | "WithOrWithout" -> (Some (MOD_FIX_OrdType_WithOrWithout))
        | "LimitOrBetter" -> (Some (MOD_FIX_OrdType_LimitOrBetter))
        | "LimitWithOrWithout" -> (Some (MOD_FIX_OrdType_LimitWithOrWithout))
        | "OnBasis" -> (Some (MOD_FIX_OrdType_OnBasis))
        | "OnClose" -> (Some (MOD_FIX_OrdType_OnClose))
        | "LimitOnClose" -> (Some (MOD_FIX_OrdType_LimitOnClose))
        | "ForexMarket" -> (Some (MOD_FIX_OrdType_ForexMarket))
        | "PreviouslyQuoted" -> (Some (MOD_FIX_OrdType_PreviouslyQuoted))
        | "PreviouslyIndicated" -> (Some (MOD_FIX_OrdType_PreviouslyIndicated))
        | "ForexLimit" -> (Some (MOD_FIX_OrdType_ForexLimit))
        | "ForexSwap" -> (Some (MOD_FIX_OrdType_ForexSwap))
        | "ForexPreviouslyQuoted" -> (Some (MOD_FIX_OrdType_ForexPreviouslyQuoted))
        | "Funari" -> (Some (MOD_FIX_OrdType_Funari))
        | "Pegged" -> (Some (MOD_FIX_OrdType_Pegged))
        | "MarketIfTouched" -> (Some (MOD_FIX_OrdType_MarketIfTouched))
        | "MarketWithLeftOverAsLimit" -> (Some (MOD_FIX_OrdType_MarketWithLeftOverAsLimit))
        | "PreviousFundValuationPoint" -> (Some (MOD_FIX_OrdType_PreviousFundValuationPoint))
        | "NextFundValuationPoint" -> (Some (MOD_FIX_OrdType_NextFundValuationPoint))
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

let string_to_mod_partyrole_opt (d)  =
    (match d with
        | "ExecutingFirm" -> (Some (MOD_FIX_PartyRole_ExecutingFirm))
        | "BrokerOfCredit" -> (Some (MOD_FIX_PartyRole_BrokerOfCredit))
        | "ClientID" -> (Some (MOD_FIX_PartyRole_ClientID))
        | "ClearingFirm" -> (Some (MOD_FIX_PartyRole_ClearingFirm))
        | "InvestorID" -> (Some (MOD_FIX_PartyRole_InvestorID))
        | "IntroducingFirm" -> (Some (MOD_FIX_PartyRole_IntroducingFirm))
        | "EnteringFirm" -> (Some (MOD_FIX_PartyRole_EnteringFirm))
        | "Locate" -> (Some (MOD_FIX_PartyRole_Locate))
        | "FundManagerClientID" -> (Some (MOD_FIX_PartyRole_FundManagerClientID))
        | "SettlementLocation" -> (Some (MOD_FIX_PartyRole_SettlementLocation))
        | "OrderOriginationTrader" -> (Some (MOD_FIX_PartyRole_OrderOriginationTrader))
        | "ExecutingTrader" -> (Some (MOD_FIX_PartyRole_ExecutingTrader))
        | "OrderOriginationFirm" -> (Some (MOD_FIX_PartyRole_OrderOriginationFirm))
        | "GiveupClearingFirm" -> (Some (MOD_FIX_PartyRole_GiveupClearingFirm))
        | "CorrespondantClearingFirm" -> (Some (MOD_FIX_PartyRole_CorrespondantClearingFirm))
        | "ExecutingSystem" -> (Some (MOD_FIX_PartyRole_ExecutingSystem))
        | "ContraFirm" -> (Some (MOD_FIX_PartyRole_ContraFirm))
        | "ContraClearingFirm" -> (Some (MOD_FIX_PartyRole_ContraClearingFirm))
        | "SponsoringFirm" -> (Some (MOD_FIX_PartyRole_SponsoringFirm))
        | "UnderlyingContraFirm" -> (Some (MOD_FIX_PartyRole_UnderlyingContraFirm))
        | "ClearingOrganization" -> (Some (MOD_FIX_PartyRole_ClearingOrganization))
        | "Exchange" -> (Some (MOD_FIX_PartyRole_Exchange))
        | "CustomerAccount" -> (Some (MOD_FIX_PartyRole_CustomerAccount))
        | "CorrespondentClearingOrganization" -> (Some (MOD_FIX_PartyRole_CorrespondentClearingOrganization))
        | "CorrespondentBroker" -> (Some (MOD_FIX_PartyRole_CorrespondentBroker))
        | "Buyer" -> (Some (MOD_FIX_PartyRole_Buyer))
        | "Custodian" -> (Some (MOD_FIX_PartyRole_Custodian))
        | "Intermediary" -> (Some (MOD_FIX_PartyRole_Intermediary))
        | "Agent" -> (Some (MOD_FIX_PartyRole_Agent))
        | "SubCustodian" -> (Some (MOD_FIX_PartyRole_SubCustodian))
        | "Beneficiary" -> (Some (MOD_FIX_PartyRole_Beneficiary))
        | "InterestedParty" -> (Some (MOD_FIX_PartyRole_InterestedParty))
        | "RegulatoryBody" -> (Some (MOD_FIX_PartyRole_RegulatoryBody))
        | "LiquidityProvider" -> (Some (MOD_FIX_PartyRole_LiquidityProvider))
        | "EnteringTrader" -> (Some (MOD_FIX_PartyRole_EnteringTrader))
        | "ContraTrader" -> (Some (MOD_FIX_PartyRole_ContraTrader))
        | "PositionAccount" -> (Some (MOD_FIX_PartyRole_PositionAccount))
        | "InvestmentDecisionMaker" -> (Some (MOD_FIX_PartyRole_InvestmentDecisionMaker))
        | _ -> (None)
    )
;;

let string_to_mod_brokerprioritization_opt (d)  =
    (match d with
        | "WithoutBrokerPriotization" -> (Some (MOD_FIX_BrokerPrioritization_WithoutBrokerPriotization))
        | "WithBrokerPrioritization" -> (Some (MOD_FIX_BrokerPrioritization_WithBrokerPrioritization))
        | _ -> (None)
    )
;;

let string_to_mod_partysubidtype_opt (d)  =
    (match d with
        | "Firm" -> (Some (MOD_FIX_PartySubIDType_Firm))
        | "Person" -> (Some (MOD_FIX_PartySubIDType_Person))
        | "System" -> (Some (MOD_FIX_PartySubIDType_System))
        | "Application" -> (Some (MOD_FIX_PartySubIDType_Application))
        | "FullLegalNameOfFirm" -> (Some (MOD_FIX_PartySubIDType_FullLegalNameOfFirm))
        | "PostalAddress" -> (Some (MOD_FIX_PartySubIDType_PostalAddress))
        | "PhoneNumber" -> (Some (MOD_FIX_PartySubIDType_PhoneNumber))
        | "EmailAddress" -> (Some (MOD_FIX_PartySubIDType_EmailAddress))
        | "ContactName" -> (Some (MOD_FIX_PartySubIDType_ContactName))
        | "SecuritiesAccountNumber" -> (Some (MOD_FIX_PartySubIDType_SecuritiesAccountNumber))
        | "RegistrationNumber" -> (Some (MOD_FIX_PartySubIDType_RegistrationNumber))
        | "RegisteredAddressForConfirmation" -> (Some (MOD_FIX_PartySubIDType_RegisteredAddressForConfirmation))
        | "RegulatoryStatus" -> (Some (MOD_FIX_PartySubIDType_RegulatoryStatus))
        | "RegistrationName" -> (Some (MOD_FIX_PartySubIDType_RegistrationName))
        | "CashAccountNumber" -> (Some (MOD_FIX_PartySubIDType_CashAccountNumber))
        | "BIC" -> (Some (MOD_FIX_PartySubIDType_BIC))
        | "CSDParticipantMemberCode" -> (Some (MOD_FIX_PartySubIDType_CSDParticipantMemberCode))
        | "RegisteredAddress" -> (Some (MOD_FIX_PartySubIDType_RegisteredAddress))
        | "FundAccountName" -> (Some (MOD_FIX_PartySubIDType_FundAccountName))
        | "TelexNumber" -> (Some (MOD_FIX_PartySubIDType_TelexNumber))
        | "FaxNumber" -> (Some (MOD_FIX_PartySubIDType_FaxNumber))
        | "SecuritiesAccountName" -> (Some (MOD_FIX_PartySubIDType_SecuritiesAccountName))
        | "CashAccountName" -> (Some (MOD_FIX_PartySubIDType_CashAccountName))
        | "Department" -> (Some (MOD_FIX_PartySubIDType_Department))
        | "LocationDesk" -> (Some (MOD_FIX_PartySubIDType_LocationDesk))
        | "PositionAccountType" -> (Some (MOD_FIX_PartySubIDType_PositionAccountType))
        | _ -> (None)
    )
;;

let string_to_mod_partyidsource_opt (d)  =
    (match d with
        | "BIC" -> (Some (MOD_FIX_PartyIDSource_BIC))
        | "GeneralIdentifier" -> (Some (MOD_FIX_PartyIDSource_GeneralIdentifier))
        | "Proprietary" -> (Some (MOD_FIX_PartyIDSource_Proprietary))
        | "ISOCountryCode" -> (Some (MOD_FIX_PartyIDSource_ISOCountryCode))
        | "SettlementEntityLocation" -> (Some (MOD_FIX_PartyIDSource_SettlementEntityLocation))
        | "MIC" -> (Some (MOD_FIX_PartyIDSource_MIC))
        | "CSDParticipant" -> (Some (MOD_FIX_PartyIDSource_CSDParticipant))
        | "KoreanInvestorID" -> (Some (MOD_FIX_PartyIDSource_KoreanInvestorID))
        | "TaiwaneseForeignInvestorID" -> (Some (MOD_FIX_PartyIDSource_TaiwaneseForeignInvestorID))
        | "TaiwaneseTradingAcct" -> (Some (MOD_FIX_PartyIDSource_TaiwaneseTradingAcct))
        | "MalaysianCentralDepository" -> (Some (MOD_FIX_PartyIDSource_MalaysianCentralDepository))
        | "ChineseInvestorID" -> (Some (MOD_FIX_PartyIDSource_ChineseInvestorID))
        | "UKNationalInsuranceOrPensionNumber" -> (Some (MOD_FIX_PartyIDSource_UKNationalInsuranceOrPensionNumber))
        | "USSocialSecurityNumber" -> (Some (MOD_FIX_PartyIDSource_USSocialSecurityNumber))
        | "USEmployerOrTaxIDNumber" -> (Some (MOD_FIX_PartyIDSource_USEmployerOrTaxIDNumber))
        | "AustralianBusinessNumber" -> (Some (MOD_FIX_PartyIDSource_AustralianBusinessNumber))
        | "AustralianTaxFileNumber" -> (Some (MOD_FIX_PartyIDSource_AustralianTaxFileNumber))
        | "ISITCAcronym" -> (Some (MOD_FIX_PartyIDSource_ISITCAcronym))
        | "ShortCodeIdentifier" -> (Some (MOD_FIX_PartyIDSource_ShortCodeIdentifier))
        | _ -> (None)
    )
;;

let string_to_mod_timeinforce_opt (d)  =
    (match d with
        | "Day" -> (Some (MOD_FIX_TimeInForce_Day))
        | "GoodTillCancel" -> (Some (MOD_FIX_TimeInForce_GoodTillCancel))
        | "AtTheOpening" -> (Some (MOD_FIX_TimeInForce_AtTheOpening))
        | "ImmediateOrCancel" -> (Some (MOD_FIX_TimeInForce_ImmediateOrCancel))
        | "FillOrKill" -> (Some (MOD_FIX_TimeInForce_FillOrKill))
        | "GoodTillCrossing" -> (Some (MOD_FIX_TimeInForce_GoodTillCrossing))
        | "GoodTillDate" -> (Some (MOD_FIX_TimeInForce_GoodTillDate))
        | "AtTheClose" -> (Some (MOD_FIX_TimeInForce_AtTheClose))
        | "GoodForAuction" -> (Some (MOD_FIX_TimeInForce_GoodForAuction))
        | _ -> (None)
    )
;;

let string_to_mod_execinst_opt (d)  =
    (match d with
        | "StayOnOfferSide" -> (Some (MOD_FIX_ExecInst_StayOnOfferSide))
        | "NotHeld" -> (Some (MOD_FIX_ExecInst_NotHeld))
        | "Work" -> (Some (MOD_FIX_ExecInst_Work))
        | "GoAlong" -> (Some (MOD_FIX_ExecInst_GoAlong))
        | "OverTheDay" -> (Some (MOD_FIX_ExecInst_OverTheDay))
        | "Held" -> (Some (MOD_FIX_ExecInst_Held))
        | "ParticipateDoNotInitiate" -> (Some (MOD_FIX_ExecInst_ParticipateDoNotInitiate))
        | "StrictScale" -> (Some (MOD_FIX_ExecInst_StrictScale))
        | "TryToScale" -> (Some (MOD_FIX_ExecInst_TryToScale))
        | "StayOnBidSide" -> (Some (MOD_FIX_ExecInst_StayOnBidSide))
        | "NoCross" -> (Some (MOD_FIX_ExecInst_NoCross))
        | "OKToCross" -> (Some (MOD_FIX_ExecInst_OKToCross))
        | "CallFirst" -> (Some (MOD_FIX_ExecInst_CallFirst))
        | "PercentOfVolume" -> (Some (MOD_FIX_ExecInst_PercentOfVolume))
        | "DoNotIncrease" -> (Some (MOD_FIX_ExecInst_DoNotIncrease))
        | "DoNotReduce" -> (Some (MOD_FIX_ExecInst_DoNotReduce))
        | "AllOrNone" -> (Some (MOD_FIX_ExecInst_AllOrNone))
        | "InstitutionsOnly" -> (Some (MOD_FIX_ExecInst_InstitutionsOnly))
        | "LastPeg" -> (Some (MOD_FIX_ExecInst_LastPeg))
        | "MidPricePeg" -> (Some (MOD_FIX_ExecInst_MidPricePeg))
        | "NonNegotiable" -> (Some (MOD_FIX_ExecInst_NonNegotiable))
        | "OpeningPeg" -> (Some (MOD_FIX_ExecInst_OpeningPeg))
        | "MarketPeg" -> (Some (MOD_FIX_ExecInst_MarketPeg))
        | "PrimaryPeg" -> (Some (MOD_FIX_ExecInst_PrimaryPeg))
        | "Suspend" -> (Some (MOD_FIX_ExecInst_Suspend))
        | "FixedPegToLocalBestBidOrOfferAtTimeOfOrder" -> (Some (MOD_FIX_ExecInst_FixedPegToLocalBestBidOrOfferAtTimeOfOrder))
        | "CustomerDisplayInstruction" -> (Some (MOD_FIX_ExecInst_CustomerDisplayInstruction))
        | "Netting" -> (Some (MOD_FIX_ExecInst_Netting))
        | "PegToVWAP" -> (Some (MOD_FIX_ExecInst_PegToVWAP))
        | "ReinstateOnSystemFailure" -> (Some (MOD_FIX_ExecInst_ReinstateOnSystemFailure))
        | "ReinstateOnTradingHalt" -> (Some (MOD_FIX_ExecInst_ReinstateOnTradingHalt))
        | "CancelOnTradingHalt" -> (Some (MOD_FIX_ExecInst_CancelOnTradingHalt))
        | "CancelOnSystemFailure" -> (Some (MOD_FIX_ExecInst_CancelOnSystemFailure))
        | "TradeAlong" -> (Some (MOD_FIX_ExecInst_TradeAlong))
        | "TryToStop" -> (Some (MOD_FIX_ExecInst_TryToStop))
        | "CancelIfNotBest" -> (Some (MOD_FIX_ExecInst_CancelIfNotBest))
        | "TrailingStopPeg" -> (Some (MOD_FIX_ExecInst_TrailingStopPeg))
        | "StrictLimit" -> (Some (MOD_FIX_ExecInst_StrictLimit))
        | "IgnorePriceValidityChecks" -> (Some (MOD_FIX_ExecInst_IgnorePriceValidityChecks))
        | "PegToLimitPrice" -> (Some (MOD_FIX_ExecInst_PegToLimitPrice))
        | "WorkToTargetStrategy" -> (Some (MOD_FIX_ExecInst_WorkToTargetStrategy))
        | "BestBidPeg" -> (Some (MOD_FIX_ExecInst_BestBidPeg))
        | "BestOfferPeg" -> (Some (MOD_FIX_ExecInst_BestOfferPeg))
        | "HalfSweep" -> (Some (MOD_FIX_ExecInst_HalfSweep))
        | "FullSweep" -> (Some (MOD_FIX_ExecInst_FullSweep))
        | _ -> (None)
    )
;;

let string_to_mod_masscancelrequesttype_opt (d)  =
    (match d with
        | "CancelOrdersForASecurity" -> (Some (MOD_FIX_MassCancelRequestType_CancelOrdersForASecurity))
        | "CancelOrdersForAnUnderlyingSecurity" -> (Some (MOD_FIX_MassCancelRequestType_CancelOrdersForAnUnderlyingSecurity))
        | "CancelOrdersForAProduct" -> (Some (MOD_FIX_MassCancelRequestType_CancelOrdersForAProduct))
        | "CancelOrdersForACFICode" -> (Some (MOD_FIX_MassCancelRequestType_CancelOrdersForACFICode))
        | "CancelOrdersForASecurityType" -> (Some (MOD_FIX_MassCancelRequestType_CancelOrdersForASecurityType))
        | "CancelOrdersForATradingSession" -> (Some (MOD_FIX_MassCancelRequestType_CancelOrdersForATradingSession))
        | "CancelAllOrders" -> (Some (MOD_FIX_MassCancelRequestType_CancelAllOrders))
        | _ -> (None)
    )
;;

let string_to_mod_exectranstype_opt (d)  =
    (match d with
        | "New" -> (Some (MOD_FIX_ExecTransType_New))
        | "Cancel" -> (Some (MOD_FIX_ExecTransType_Cancel))
        | "Correct" -> (Some (MOD_FIX_ExecTransType_Correct))
        | "Status" -> (Some (MOD_FIX_ExecTransType_Status))
        | _ -> (None)
    )
;;

let string_to_mod_cxlrejreason_opt (d)  =
    (match d with
        | "TooLateToCancel" -> (Some (MOD_FIX_CxlRejReason_TooLateToCancel))
        | "UnknownOrder" -> (Some (MOD_FIX_CxlRejReason_UnknownOrder))
        | "BrokerCredit" -> (Some (MOD_FIX_CxlRejReason_BrokerCredit))
        | "OrderAlreadyInPendingStatus" -> (Some (MOD_FIX_CxlRejReason_OrderAlreadyInPendingStatus))
        | "UnableToProcessOrderMassCancelRequest" -> (Some (MOD_FIX_CxlRejReason_UnableToProcessOrderMassCancelRequest))
        | "OrigOrdModTime" -> (Some (MOD_FIX_CxlRejReason_OrigOrdModTime))
        | "DuplicateClOrdID" -> (Some (MOD_FIX_CxlRejReason_DuplicateClOrdID))
        | "Other" -> (Some (MOD_FIX_CxlRejReason_Other))
        | _ -> (None)
    )
;;

let string_to_mod_ordstatus_opt (d)  =
    (match d with
        | "New" -> (Some (MOD_FIX_OrdStatus_New))
        | "PartiallyFilled" -> (Some (MOD_FIX_OrdStatus_PartiallyFilled))
        | "Filled" -> (Some (MOD_FIX_OrdStatus_Filled))
        | "DoneForDay" -> (Some (MOD_FIX_OrdStatus_DoneForDay))
        | "Canceled" -> (Some (MOD_FIX_OrdStatus_Canceled))
        | "Replaced" -> (Some (MOD_FIX_OrdStatus_Replaced))
        | "PendingCancel" -> (Some (MOD_FIX_OrdStatus_PendingCancel))
        | "Stopped" -> (Some (MOD_FIX_OrdStatus_Stopped))
        | "Rejected" -> (Some (MOD_FIX_OrdStatus_Rejected))
        | "Suspended" -> (Some (MOD_FIX_OrdStatus_Suspended))
        | "PendingNew" -> (Some (MOD_FIX_OrdStatus_PendingNew))
        | "Calculated" -> (Some (MOD_FIX_OrdStatus_Calculated))
        | "Expired" -> (Some (MOD_FIX_OrdStatus_Expired))
        | "AcceptedForBidding" -> (Some (MOD_FIX_OrdStatus_AcceptedForBidding))
        | "PendingReplace" -> (Some (MOD_FIX_OrdStatus_PendingReplace))
        | _ -> (None)
    )
;;

let string_to_mod_technicalordtype_opt (d)  =
    (match d with
        | "IndexArbitrage" -> (Some (MOD_FIX_TechnicalOrdType_IndexArbitrage))
        | "PortfolioStrategy" -> (Some (MOD_FIX_TechnicalOrdType_PortfolioStrategy))
        | "UnwindOrder" -> (Some (MOD_FIX_TechnicalOrdType_UnwindOrder))
        | "OtherOrders" -> (Some (MOD_FIX_TechnicalOrdType_OtherOrders))
        | "CrossMargining" -> (Some (MOD_FIX_TechnicalOrdType_CrossMargining))
        | _ -> (None)
    )
;;

let string_to_mod_side_opt (d)  =
    (match d with
        | "Buy" -> (Some (MOD_FIX_Side_Buy))
        | "Sell" -> (Some (MOD_FIX_Side_Sell))
        | "BuyMinus" -> (Some (MOD_FIX_Side_BuyMinus))
        | "SellPlus" -> (Some (MOD_FIX_Side_SellPlus))
        | "SellShort" -> (Some (MOD_FIX_Side_SellShort))
        | "SellShortExempt" -> (Some (MOD_FIX_Side_SellShortExempt))
        | "Undisclosed" -> (Some (MOD_FIX_Side_Undisclosed))
        | "Cross" -> (Some (MOD_FIX_Side_Cross))
        | "CrossShort" -> (Some (MOD_FIX_Side_CrossShort))
        | "CrossShortExempt" -> (Some (MOD_FIX_Side_CrossShortExempt))
        | "AsDefined" -> (Some (MOD_FIX_Side_AsDefined))
        | "Opposite" -> (Some (MOD_FIX_Side_Opposite))
        | "Subscribe" -> (Some (MOD_FIX_Side_Subscribe))
        | "Redeem" -> (Some (MOD_FIX_Side_Redeem))
        | "Lend" -> (Some (MOD_FIX_Side_Lend))
        | "Borrow" -> (Some (MOD_FIX_Side_Borrow))
        | _ -> (None)
    )
;;

let string_to_mod_handlinst_opt (d)  =
    (match d with
        | "AutomatedExecutionNoIntervention" -> (Some (MOD_FIX_HandlInst_AutomatedExecutionNoIntervention))
        | "AutomatedExecutionInterventionOK" -> (Some (MOD_FIX_HandlInst_AutomatedExecutionInterventionOK))
        | "ManualOrder" -> (Some (MOD_FIX_HandlInst_ManualOrder))
        | _ -> (None)
    )
;;

let string_to_mod_currency_opt (d)  =
    (match d with
        | "EUR" -> (Some (MOD_FIX_Currency_EUR))
        | "GBP" -> (Some (MOD_FIX_Currency_GBP))
        | "USD" -> (Some (MOD_FIX_Currency_USD))
        | "CHF" -> (Some (MOD_FIX_Currency_CHF))
        | _ -> (None)
    )
;;

let string_to_mod_liquidityindicator_opt (d)  =
    (match d with
        | "AddLiquidity" -> (Some (MOD_FIX_LiquidityIndicator_AddLiquidity))
        | "RemoveLiquidity" -> (Some (MOD_FIX_LiquidityIndicator_RemoveLiquidity))
        | "PeriodicAuction" -> (Some (MOD_FIX_LiquidityIndicator_PeriodicAuction))
        | _ -> (None)
    )
;;

let string_to_mod_partyrolequalifier_opt (d)  =
    (match d with
        | "Algorithm" -> (Some (MOD_FIX_PartyRoleQualifier_Algorithm))
        | "FirmOrLegalEntity" -> (Some (MOD_FIX_PartyRoleQualifier_FirmOrLegalEntity))
        | "NaturalPerson" -> (Some (MOD_FIX_PartyRoleQualifier_NaturalPerson))
        | _ -> (None)
    )
;;

let string_to_mod_crosstype_opt (d)  =
    (match d with
        | "CrossAON" -> (Some (MOD_FIX_CrossType_CrossAON))
        | "CrossIOC" -> (Some (MOD_FIX_CrossType_CrossIOC))
        | "CrossOneSide" -> (Some (MOD_FIX_CrossType_CrossOneSide))
        | "CrossSamePrice" -> (Some (MOD_FIX_CrossType_CrossSamePrice))
        | "NotSignificant" -> (Some (MOD_FIX_CrossType_NotSignificant))
        | "StandardCross" -> (Some (MOD_FIX_CrossType_StandardCross))
        | _ -> (None)
    )
;;

let string_to_mod_orderattributetypes_opt (d)  =
    (match d with
        | "LiquidityProvisionActivity" -> (Some (MOD_FIX_OrderAttributeTypes_LiquidityProvisionActivity))
        | "AlgorithmicOrder" -> (Some (MOD_FIX_OrderAttributeTypes_AlgorithmicOrder))
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

let string_to_mod_rule80a_opt (d)  =
    (match d with
        | "AgencySingleOrder" -> (Some (MOD_FIX_Rule80A_AgencySingleOrder))
        | "ShortExemptTransactionAType" -> (Some (MOD_FIX_Rule80A_ShortExemptTransactionAType))
        | "ProprietaryNonAlgo" -> (Some (MOD_FIX_Rule80A_ProprietaryNonAlgo))
        | "ProgramOrderMember" -> (Some (MOD_FIX_Rule80A_ProgramOrderMember))
        | "ShortExemptTransactionForPrincipal" -> (Some (MOD_FIX_Rule80A_ShortExemptTransactionForPrincipal))
        | "ShortExemptTransactionWType" -> (Some (MOD_FIX_Rule80A_ShortExemptTransactionWType))
        | "ShortExemptTransactionIType" -> (Some (MOD_FIX_Rule80A_ShortExemptTransactionIType))
        | "IndividualInvestor" -> (Some (MOD_FIX_Rule80A_IndividualInvestor))
        | "ProprietaryAlgo" -> (Some (MOD_FIX_Rule80A_ProprietaryAlgo))
        | "AgencyAlgo" -> (Some (MOD_FIX_Rule80A_AgencyAlgo))
        | "ShortExemptTransactionMemberAffliated" -> (Some (MOD_FIX_Rule80A_ShortExemptTransactionMemberAffliated))
        | "ProgramOrderOtherMember" -> (Some (MOD_FIX_Rule80A_ProgramOrderOtherMember))
        | "AgentForOtherMember" -> (Some (MOD_FIX_Rule80A_AgentForOtherMember))
        | "ProprietaryTransactionAffiliated" -> (Some (MOD_FIX_Rule80A_ProprietaryTransactionAffiliated))
        | "Principal" -> (Some (MOD_FIX_Rule80A_Principal))
        | "TransactionNonMember" -> (Some (MOD_FIX_Rule80A_TransactionNonMember))
        | "SpecialistTrades" -> (Some (MOD_FIX_Rule80A_SpecialistTrades))
        | "TransactionUnaffiliatedMember" -> (Some (MOD_FIX_Rule80A_TransactionUnaffiliatedMember))
        | "AgencyIndexArb" -> (Some (MOD_FIX_Rule80A_AgencyIndexArb))
        | "AllOtherOrdersAsAgentForOtherMember" -> (Some (MOD_FIX_Rule80A_AllOtherOrdersAsAgentForOtherMember))
        | "ShortExemptTransactionMemberNotAffliated" -> (Some (MOD_FIX_Rule80A_ShortExemptTransactionMemberNotAffliated))
        | "AgencyNonAlgo" -> (Some (MOD_FIX_Rule80A_AgencyNonAlgo))
        | "ShortExemptTransactionNonMember" -> (Some (MOD_FIX_Rule80A_ShortExemptTransactionNonMember))
        | "Client" -> (Some (MOD_FIX_Rule80A_Client))
        | "House" -> (Some (MOD_FIX_Rule80A_House))
        | "RisklessPrincipal" -> (Some (MOD_FIX_Rule80A_RisklessPrincipal))
        | _ -> (None)
    )
;;

let string_to_mod_exectype_opt (d)  =
    (match d with
        | "New" -> (Some (MOD_FIX_ExecType_New))
        | "PartialFill" -> (Some (MOD_FIX_ExecType_PartialFill))
        | "Fill" -> (Some (MOD_FIX_ExecType_Fill))
        | "DoneForDay" -> (Some (MOD_FIX_ExecType_DoneForDay))
        | "Canceled" -> (Some (MOD_FIX_ExecType_Canceled))
        | "Replaced" -> (Some (MOD_FIX_ExecType_Replaced))
        | "PendingCancel" -> (Some (MOD_FIX_ExecType_PendingCancel))
        | "Stopped" -> (Some (MOD_FIX_ExecType_Stopped))
        | "Rejected" -> (Some (MOD_FIX_ExecType_Rejected))
        | "Suspended" -> (Some (MOD_FIX_ExecType_Suspended))
        | "PendingNew" -> (Some (MOD_FIX_ExecType_PendingNew))
        | "Calculated" -> (Some (MOD_FIX_ExecType_Calculated))
        | "Expired" -> (Some (MOD_FIX_ExecType_Expired))
        | "Restated" -> (Some (MOD_FIX_ExecType_Restated))
        | "PendingReplace" -> (Some (MOD_FIX_ExecType_PendingReplace))
        | "Trade" -> (Some (MOD_FIX_ExecType_Trade))
        | "TradeCorrect" -> (Some (MOD_FIX_ExecType_TradeCorrect))
        | "TradeCancel" -> (Some (MOD_FIX_ExecType_TradeCancel))
        | "OrderStatus" -> (Some (MOD_FIX_ExecType_OrderStatus))
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

let string_to_mod_cxlrejresponseto_opt (d)  =
    (match d with
        | "OrderCancelRequest" -> (Some (MOD_FIX_CxlRejResponseTo_OrderCancelRequest))
        | "OrderCancel" -> (Some (MOD_FIX_CxlRejResponseTo_OrderCancel))
        | _ -> (None)
    )
;;

let string_to_mod_ordrejreason_opt (d)  =
    (match d with
        | "BrokerCredit" -> (Some (MOD_FIX_OrdRejReason_BrokerCredit))
        | "UnknownSymbol" -> (Some (MOD_FIX_OrdRejReason_UnknownSymbol))
        | "ExchangeClosed" -> (Some (MOD_FIX_OrdRejReason_ExchangeClosed))
        | "OrderExceedsLimit" -> (Some (MOD_FIX_OrdRejReason_OrderExceedsLimit))
        | "TooLateToEnter" -> (Some (MOD_FIX_OrdRejReason_TooLateToEnter))
        | "UnknownOrder" -> (Some (MOD_FIX_OrdRejReason_UnknownOrder))
        | "DuplicateOrder" -> (Some (MOD_FIX_OrdRejReason_DuplicateOrder))
        | "DuplicateOfAVerballyCommunicatedOrder" -> (Some (MOD_FIX_OrdRejReason_DuplicateOfAVerballyCommunicatedOrder))
        | "StaleOrder" -> (Some (MOD_FIX_OrdRejReason_StaleOrder))
        | "TradeAlongRequired" -> (Some (MOD_FIX_OrdRejReason_TradeAlongRequired))
        | "InvalidInvestorID" -> (Some (MOD_FIX_OrdRejReason_InvalidInvestorID))
        | "UnsupportedOrderCharacteristic" -> (Some (MOD_FIX_OrdRejReason_UnsupportedOrderCharacteristic))
        | "IncorrectQuantity" -> (Some (MOD_FIX_OrdRejReason_IncorrectQuantity))
        | "IncorrectAllocatedQuantity" -> (Some (MOD_FIX_OrdRejReason_IncorrectAllocatedQuantity))
        | "UnknownAccount" -> (Some (MOD_FIX_OrdRejReason_UnknownAccount))
        | "Other" -> (Some (MOD_FIX_OrdRejReason_Other))
        | "DVC_ProactivelyHaltedInstrument" -> (Some (MOD_FIX_OrdRejReason_DVC_ProactivelyHaltedInstrument))
        | "DVC_ThresholdBreached" -> (Some (MOD_FIX_OrdRejReason_DVC_ThresholdBreached))
        | "OtherRejectReason" -> (Some (MOD_FIX_OrdRejReason_OtherRejectReason))
        | _ -> (None)
    )
;;
