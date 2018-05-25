(* Aesthetic Integration copyright 2018 *)

type model_fix_currency =
    | MOD_FIX_Currency_EUR 
    | MOD_FIX_Currency_CHF 
    | MOD_FIX_Currency_USD 
    | MOD_FIX_Currency_GBP 
;;

type model_fix_ordstatus =
    | MOD_FIX_OrdStatus_PendingCancel 
    | MOD_FIX_OrdStatus_Stopped 
    | MOD_FIX_OrdStatus_PendingNew 
    | MOD_FIX_OrdStatus_Rejected 
    | MOD_FIX_OrdStatus_Calculated 
    | MOD_FIX_OrdStatus_Expired 
    | MOD_FIX_OrdStatus_Filled 
    | MOD_FIX_OrdStatus_Canceled 
    | MOD_FIX_OrdStatus_Replaced 
    | MOD_FIX_OrdStatus_PendingReplace 
    | MOD_FIX_OrdStatus_DoneForDay 
    | MOD_FIX_OrdStatus_Suspended 
    | MOD_FIX_OrdStatus_New 
    | MOD_FIX_OrdStatus_PartiallyFilled 
    | MOD_FIX_OrdStatus_AcceptedForBidding 
;;

type model_fix_liquidityindicator =
    | MOD_FIX_LiquidityIndicator_RemoveLiquidity 
    | MOD_FIX_LiquidityIndicator_AddLiquidity 
    | MOD_FIX_LiquidityIndicator_PeriodicAuction 
;;

type model_fix_handlinst =
    | MOD_FIX_HandlInst_ManualOrder 
    | MOD_FIX_HandlInst_AutomatedExecutionInterventionOK 
    | MOD_FIX_HandlInst_AutomatedExecutionNoIntervention 
;;

type model_fix_exectype =
    | MOD_FIX_ExecType_PendingCancel 
    | MOD_FIX_ExecType_Fill 
    | MOD_FIX_ExecType_Stopped 
    | MOD_FIX_ExecType_PendingNew 
    | MOD_FIX_ExecType_Restated 
    | MOD_FIX_ExecType_Rejected 
    | MOD_FIX_ExecType_Calculated 
    | MOD_FIX_ExecType_TradeCorrect 
    | MOD_FIX_ExecType_TradeCancel 
    | MOD_FIX_ExecType_Expired 
    | MOD_FIX_ExecType_OrderStatus 
    | MOD_FIX_ExecType_PartialFill 
    | MOD_FIX_ExecType_Trade 
    | MOD_FIX_ExecType_Canceled 
    | MOD_FIX_ExecType_Replaced 
    | MOD_FIX_ExecType_PendingReplace 
    | MOD_FIX_ExecType_DoneForDay 
    | MOD_FIX_ExecType_Suspended 
    | MOD_FIX_ExecType_New 
;;

type model_fix_clearinghandlingtype =
    | MOD_FIX_ClearingHandlingType_ManualMode 
    | MOD_FIX_ClearingHandlingType_AutomaticExtraction 
    | MOD_FIX_ClearingHandlingType_AutomaticAllocation 
;;

type model_fix_rule80a =
    | MOD_FIX_Rule80A_AgencySingleOrder 
    | MOD_FIX_Rule80A_ShortExemptTransactionForPrincipal 
    | MOD_FIX_Rule80A_ShortExemptTransactionAType 
    | MOD_FIX_Rule80A_SpecialistTrades 
    | MOD_FIX_Rule80A_AgencyNonAlgo 
    | MOD_FIX_Rule80A_TransactionUnaffiliatedMember 
    | MOD_FIX_Rule80A_ShortExemptTransactionWType 
    | MOD_FIX_Rule80A_ProprietaryAlgo 
    | MOD_FIX_Rule80A_ProprietaryTransactionAffiliated 
    | MOD_FIX_Rule80A_AgencyAlgo 
    | MOD_FIX_Rule80A_Principal 
    | MOD_FIX_Rule80A_AllOtherOrdersAsAgentForOtherMember 
    | MOD_FIX_Rule80A_ProprietaryNonAlgo 
    | MOD_FIX_Rule80A_ShortExemptTransactionIType 
    | MOD_FIX_Rule80A_AgentForOtherMember 
    | MOD_FIX_Rule80A_ShortExemptTransactionNonMember 
    | MOD_FIX_Rule80A_RisklessPrincipal 
    | MOD_FIX_Rule80A_AgencyIndexArb 
    | MOD_FIX_Rule80A_ProgramOrderOtherMember 
    | MOD_FIX_Rule80A_ShortExemptTransactionMemberNotAffliated 
    | MOD_FIX_Rule80A_ProgramOrderMember 
    | MOD_FIX_Rule80A_House 
    | MOD_FIX_Rule80A_TransactionNonMember 
    | MOD_FIX_Rule80A_IndividualInvestor 
    | MOD_FIX_Rule80A_ShortExemptTransactionMemberAffliated 
    | MOD_FIX_Rule80A_Client 
;;

type model_fix_partyidsource =
    | MOD_FIX_PartyIDSource_CSDParticipant 
    | MOD_FIX_PartyIDSource_KoreanInvestorID 
    | MOD_FIX_PartyIDSource_USEmployerOrTaxIDNumber 
    | MOD_FIX_PartyIDSource_TaiwaneseForeignInvestorID 
    | MOD_FIX_PartyIDSource_TaiwaneseTradingAcct 
    | MOD_FIX_PartyIDSource_UKNationalInsuranceOrPensionNumber 
    | MOD_FIX_PartyIDSource_MIC 
    | MOD_FIX_PartyIDSource_USSocialSecurityNumber 
    | MOD_FIX_PartyIDSource_Proprietary 
    | MOD_FIX_PartyIDSource_AustralianTaxFileNumber 
    | MOD_FIX_PartyIDSource_ShortCodeIdentifier 
    | MOD_FIX_PartyIDSource_MalaysianCentralDepository 
    | MOD_FIX_PartyIDSource_ISITCAcronym 
    | MOD_FIX_PartyIDSource_ISOCountryCode 
    | MOD_FIX_PartyIDSource_ChineseInvestorID 
    | MOD_FIX_PartyIDSource_AustralianBusinessNumber 
    | MOD_FIX_PartyIDSource_BIC 
    | MOD_FIX_PartyIDSource_GeneralIdentifier 
    | MOD_FIX_PartyIDSource_SettlementEntityLocation 
;;

type model_fix_brokerprioritization =
    | MOD_FIX_BrokerPrioritization_WithBrokerPrioritization 
    | MOD_FIX_BrokerPrioritization_WithoutBrokerPriotization 
;;

type model_fix_execinst =
    | MOD_FIX_ExecInst_ParticipateDoNotInitiate 
    | MOD_FIX_ExecInst_AllOrNone 
    | MOD_FIX_ExecInst_CallFirst 
    | MOD_FIX_ExecInst_PercentOfVolume 
    | MOD_FIX_ExecInst_InstitutionsOnly 
    | MOD_FIX_ExecInst_FullSweep 
    | MOD_FIX_ExecInst_NoCross 
    | MOD_FIX_ExecInst_BestOfferPeg 
    | MOD_FIX_ExecInst_OverTheDay 
    | MOD_FIX_ExecInst_DoNotIncrease 
    | MOD_FIX_ExecInst_OpeningPeg 
    | MOD_FIX_ExecInst_TryToStop 
    | MOD_FIX_ExecInst_Netting 
    | MOD_FIX_ExecInst_StayOnBidSide 
    | MOD_FIX_ExecInst_Held 
    | MOD_FIX_ExecInst_OKToCross 
    | MOD_FIX_ExecInst_CustomerDisplayInstruction 
    | MOD_FIX_ExecInst_GoAlong 
    | MOD_FIX_ExecInst_DoNotReduce 
    | MOD_FIX_ExecInst_StayOnOfferSide 
    | MOD_FIX_ExecInst_PegToLimitPrice 
    | MOD_FIX_ExecInst_TryToScale 
    | MOD_FIX_ExecInst_ReinstateOnSystemFailure 
    | MOD_FIX_ExecInst_CancelIfNotBest 
    | MOD_FIX_ExecInst_BestBidPeg 
    | MOD_FIX_ExecInst_MidPricePeg 
    | MOD_FIX_ExecInst_WorkToTargetStrategy 
    | MOD_FIX_ExecInst_PegToVWAP 
    | MOD_FIX_ExecInst_TradeAlong 
    | MOD_FIX_ExecInst_StrictLimit 
    | MOD_FIX_ExecInst_Suspend 
    | MOD_FIX_ExecInst_LastPeg 
    | MOD_FIX_ExecInst_NonNegotiable 
    | MOD_FIX_ExecInst_HalfSweep 
    | MOD_FIX_ExecInst_NotHeld 
    | MOD_FIX_ExecInst_FixedPegToLocalBestBidOrOfferAtTimeOfOrder 
    | MOD_FIX_ExecInst_CancelOnTradingHalt 
    | MOD_FIX_ExecInst_CancelOnSystemFailure 
    | MOD_FIX_ExecInst_IgnorePriceValidityChecks 
    | MOD_FIX_ExecInst_Work 
    | MOD_FIX_ExecInst_ReinstateOnTradingHalt 
    | MOD_FIX_ExecInst_PrimaryPeg 
    | MOD_FIX_ExecInst_TrailingStopPeg 
    | MOD_FIX_ExecInst_MarketPeg 
    | MOD_FIX_ExecInst_StrictScale 
;;

type model_fix_exectranstype =
    | MOD_FIX_ExecTransType_Status 
    | MOD_FIX_ExecTransType_Cancel 
    | MOD_FIX_ExecTransType_New 
    | MOD_FIX_ExecTransType_Correct 
;;

type model_fix_cxlrejreason =
    | MOD_FIX_CxlRejReason_Other 
    | MOD_FIX_CxlRejReason_OrderAlreadyInPendingStatus 
    | MOD_FIX_CxlRejReason_TooLateToCancel 
    | MOD_FIX_CxlRejReason_UnknownOrder 
    | MOD_FIX_CxlRejReason_UnableToProcessOrderMassCancelRequest 
    | MOD_FIX_CxlRejReason_OrigOrdModTime 
    | MOD_FIX_CxlRejReason_DuplicateClOrdID 
    | MOD_FIX_CxlRejReason_BrokerCredit 
;;

type model_fix_ordtype =
    | MOD_FIX_OrdType_LimitOrBetter 
    | MOD_FIX_OrdType_NextFundValuationPoint 
    | MOD_FIX_OrdType_WithOrWithout 
    | MOD_FIX_OrdType_PreviouslyIndicated 
    | MOD_FIX_OrdType_Stop 
    | MOD_FIX_OrdType_ForexPreviouslyQuoted 
    | MOD_FIX_OrdType_Market 
    | MOD_FIX_OrdType_OnBasis 
    | MOD_FIX_OrdType_Funari 
    | MOD_FIX_OrdType_LimitOnClose 
    | MOD_FIX_OrdType_Pegged 
    | MOD_FIX_OrdType_LimitWithOrWithout 
    | MOD_FIX_OrdType_MarketOnClose 
    | MOD_FIX_OrdType_StopLimit 
    | MOD_FIX_OrdType_ForexSwap 
    | MOD_FIX_OrdType_MarketIfTouched 
    | MOD_FIX_OrdType_MarketWithLeftOverAsLimit 
    | MOD_FIX_OrdType_PreviouslyQuoted 
    | MOD_FIX_OrdType_ForexMarket 
    | MOD_FIX_OrdType_Limit 
    | MOD_FIX_OrdType_PreviousFundValuationPoint 
    | MOD_FIX_OrdType_OnClose 
    | MOD_FIX_OrdType_ForexLimit 
;;

type model_fix_technicalordtype =
    | MOD_FIX_TechnicalOrdType_CrossMargining 
    | MOD_FIX_TechnicalOrdType_IndexArbitrage 
    | MOD_FIX_TechnicalOrdType_UnwindOrder 
    | MOD_FIX_TechnicalOrdType_OtherOrders 
    | MOD_FIX_TechnicalOrdType_PortfolioStrategy 
;;

type model_fix_bookindicator =
    | MOD_FIX_BookIndicator_Auction 
    | MOD_FIX_BookIndicator_RPW 
;;

type model_fix_orderattributetypes =
    | MOD_FIX_OrderAttributeTypes_AlgorithmicOrder 
    | MOD_FIX_OrderAttributeTypes_LiquidityProvisionActivity 
;;

type model_fix_ordrejreason =
    | MOD_FIX_OrdRejReason_DuplicateOrder 
    | MOD_FIX_OrdRejReason_Other 
    | MOD_FIX_OrdRejReason_UnknownOrder 
    | MOD_FIX_OrdRejReason_DVC_ThresholdBreached 
    | MOD_FIX_OrdRejReason_TooLateToEnter 
    | MOD_FIX_OrdRejReason_OrderExceedsLimit 
    | MOD_FIX_OrdRejReason_UnknownAccount 
    | MOD_FIX_OrdRejReason_OtherRejectReason 
    | MOD_FIX_OrdRejReason_BrokerCredit 
    | MOD_FIX_OrdRejReason_UnsupportedOrderCharacteristic 
    | MOD_FIX_OrdRejReason_DuplicateOfAVerballyCommunicatedOrder 
    | MOD_FIX_OrdRejReason_IncorrectQuantity 
    | MOD_FIX_OrdRejReason_TradeAlongRequired 
    | MOD_FIX_OrdRejReason_StaleOrder 
    | MOD_FIX_OrdRejReason_InvalidInvestorID 
    | MOD_FIX_OrdRejReason_ExchangeClosed 
    | MOD_FIX_OrdRejReason_IncorrectAllocatedQuantity 
    | MOD_FIX_OrdRejReason_DVC_ProactivelyHaltedInstrument 
    | MOD_FIX_OrdRejReason_UnknownSymbol 
;;

type model_fix_side =
    | MOD_FIX_Side_AsDefined 
    | MOD_FIX_Side_Opposite 
    | MOD_FIX_Side_Buy 
    | MOD_FIX_Side_CrossShortExempt 
    | MOD_FIX_Side_Borrow 
    | MOD_FIX_Side_BuyMinus 
    | MOD_FIX_Side_Subscribe 
    | MOD_FIX_Side_Lend 
    | MOD_FIX_Side_SellShortExempt 
    | MOD_FIX_Side_Redeem 
    | MOD_FIX_Side_SellPlus 
    | MOD_FIX_Side_Sell 
    | MOD_FIX_Side_Undisclosed 
    | MOD_FIX_Side_Cross 
    | MOD_FIX_Side_CrossShort 
    | MOD_FIX_Side_SellShort 
;;

type model_fix_masscancelrequesttype =
    | MOD_FIX_MassCancelRequestType_CancelOrdersForASecurityType 
    | MOD_FIX_MassCancelRequestType_CancelOrdersForAProduct 
    | MOD_FIX_MassCancelRequestType_CancelOrdersForASecurity 
    | MOD_FIX_MassCancelRequestType_CancelOrdersForAnUnderlyingSecurity 
    | MOD_FIX_MassCancelRequestType_CancelAllOrders 
    | MOD_FIX_MassCancelRequestType_CancelOrdersForACFICode 
    | MOD_FIX_MassCancelRequestType_CancelOrdersForATradingSession 
;;

type model_fix_cxlrejresponseto =
    | MOD_FIX_CxlRejResponseTo_OrderCancelRequest 
    | MOD_FIX_CxlRejResponseTo_OrderCancel 
;;

type model_fix_partyrolequalifier =
    | MOD_FIX_PartyRoleQualifier_FirmOrLegalEntity 
    | MOD_FIX_PartyRoleQualifier_Algorithm 
    | MOD_FIX_PartyRoleQualifier_NaturalPerson 
;;

type model_fix_timeinforce =
    | MOD_FIX_TimeInForce_GoodTillCancel 
    | MOD_FIX_TimeInForce_AtTheClose 
    | MOD_FIX_TimeInForce_ImmediateOrCancel 
    | MOD_FIX_TimeInForce_Day 
    | MOD_FIX_TimeInForce_FillOrKill 
    | MOD_FIX_TimeInForce_GoodForAuction 
    | MOD_FIX_TimeInForce_AtTheOpening 
    | MOD_FIX_TimeInForce_GoodTillCrossing 
    | MOD_FIX_TimeInForce_GoodTillDate 
;;

type model_fix_openclose =
    | MOD_FIX_OpenClose_Close 
    | MOD_FIX_OpenClose_Open 
;;

type model_fix_partysubidtype =
    | MOD_FIX_PartySubIDType_EmailAddress 
    | MOD_FIX_PartySubIDType_Application 
    | MOD_FIX_PartySubIDType_FundAccountName 
    | MOD_FIX_PartySubIDType_FullLegalNameOfFirm 
    | MOD_FIX_PartySubIDType_CSDParticipantMemberCode 
    | MOD_FIX_PartySubIDType_RegistrationName 
    | MOD_FIX_PartySubIDType_PostalAddress 
    | MOD_FIX_PartySubIDType_SecuritiesAccountNumber 
    | MOD_FIX_PartySubIDType_RegisteredAddress 
    | MOD_FIX_PartySubIDType_TelexNumber 
    | MOD_FIX_PartySubIDType_RegulatoryStatus 
    | MOD_FIX_PartySubIDType_PhoneNumber 
    | MOD_FIX_PartySubIDType_Firm 
    | MOD_FIX_PartySubIDType_Person 
    | MOD_FIX_PartySubIDType_ContactName 
    | MOD_FIX_PartySubIDType_CashAccountNumber 
    | MOD_FIX_PartySubIDType_CashAccountName 
    | MOD_FIX_PartySubIDType_LocationDesk 
    | MOD_FIX_PartySubIDType_RegisteredAddressForConfirmation 
    | MOD_FIX_PartySubIDType_PositionAccountType 
    | MOD_FIX_PartySubIDType_System 
    | MOD_FIX_PartySubIDType_Department 
    | MOD_FIX_PartySubIDType_FaxNumber 
    | MOD_FIX_PartySubIDType_RegistrationNumber 
    | MOD_FIX_PartySubIDType_BIC 
    | MOD_FIX_PartySubIDType_SecuritiesAccountName 
;;

type model_fix_crosstype =
    | MOD_FIX_CrossType_CrossIOC 
    | MOD_FIX_CrossType_CrossOneSide 
    | MOD_FIX_CrossType_CrossSamePrice 
    | MOD_FIX_CrossType_CrossAON 
    | MOD_FIX_CrossType_NotSignificant 
    | MOD_FIX_CrossType_StandardCross 
;;

type model_fix_partyrole =
    | MOD_FIX_PartyRole_CorrespondantClearingFirm 
    | MOD_FIX_PartyRole_Agent 
    | MOD_FIX_PartyRole_ExecutingSystem 
    | MOD_FIX_PartyRole_SponsoringFirm 
    | MOD_FIX_PartyRole_Intermediary 
    | MOD_FIX_PartyRole_IntroducingFirm 
    | MOD_FIX_PartyRole_EnteringFirm 
    | MOD_FIX_PartyRole_LiquidityProvider 
    | MOD_FIX_PartyRole_ClearingFirm 
    | MOD_FIX_PartyRole_ContraFirm 
    | MOD_FIX_PartyRole_ContraTrader 
    | MOD_FIX_PartyRole_CustomerAccount 
    | MOD_FIX_PartyRole_RegulatoryBody 
    | MOD_FIX_PartyRole_SettlementLocation 
    | MOD_FIX_PartyRole_Exchange 
    | MOD_FIX_PartyRole_Custodian 
    | MOD_FIX_PartyRole_CorrespondentClearingOrganization 
    | MOD_FIX_PartyRole_ExecutingTrader 
    | MOD_FIX_PartyRole_CorrespondentBroker 
    | MOD_FIX_PartyRole_ClientID 
    | MOD_FIX_PartyRole_OrderOriginationTrader 
    | MOD_FIX_PartyRole_Beneficiary 
    | MOD_FIX_PartyRole_InterestedParty 
    | MOD_FIX_PartyRole_UnderlyingContraFirm 
    | MOD_FIX_PartyRole_GiveupClearingFirm 
    | MOD_FIX_PartyRole_ClearingOrganization 
    | MOD_FIX_PartyRole_Locate 
    | MOD_FIX_PartyRole_Buyer 
    | MOD_FIX_PartyRole_PositionAccount 
    | MOD_FIX_PartyRole_OrderOriginationFirm 
    | MOD_FIX_PartyRole_BrokerOfCredit 
    | MOD_FIX_PartyRole_SubCustodian 
    | MOD_FIX_PartyRole_EnteringTrader 
    | MOD_FIX_PartyRole_InvestmentDecisionMaker 
    | MOD_FIX_PartyRole_ExecutingFirm 
    | MOD_FIX_PartyRole_FundManagerClientID 
    | MOD_FIX_PartyRole_ContraClearingFirm 
    | MOD_FIX_PartyRole_InvestorID 
;;
