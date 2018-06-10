(* Aesthetic Integration copyright 2018 *)
open Full_app_tags;;
open Yojson;;

let full_app_msg_tag_to_string (tag)  =
    (match tag with
        | Full_Msg_ExecutionReport_Tag -> "ExecutionReport"
        | Full_Msg_NewOrderSingle_Tag -> "NewOrderSingle"
    )
;;

let full_app_field_tag_to_string (tag)  =
    (match tag with
        | Full_Field_OrderID_Tag -> "OrderID"
        | Full_Field_SecondaryOrderID_Tag -> "SecondaryOrderID"
        | Full_Field_SecondaryClOrdID_Tag -> "SecondaryClOrdID"
        | Full_Field_SecondaryExecID_Tag -> "SecondaryExecID"
        | Full_Field_ClOrdID_Tag -> "ClOrdID"
        | Full_Field_OrigClOrdID_Tag -> "OrigClOrdID"
        | Full_Field_ClOrdLinkID_Tag -> "ClOrdLinkID"
        | Full_Field_QuoteRespID_Tag -> "QuoteRespID"
        | Full_Field_OrdStatusReqID_Tag -> "OrdStatusReqID"
        | Full_Field_MassStatusReqID_Tag -> "MassStatusReqID"
        | Full_Field_TotNumReports_Tag -> "TotNumReports"
        | Full_Field_LastRptRequested_Tag -> "LastRptRequested"
        | Full_Field_TradeOriginationDate_Tag -> "TradeOriginationDate"
        | Full_Field_ListID_Tag -> "ListID"
        | Full_Field_CrossID_Tag -> "CrossID"
        | Full_Field_OrigCrossID_Tag -> "OrigCrossID"
        | Full_Field_CrossType_Tag -> "CrossType"
        | Full_Field_ExecID_Tag -> "ExecID"
        | Full_Field_ExecRefID_Tag -> "ExecRefID"
        | Full_Field_ExecType_Tag -> "ExecType"
        | Full_Field_OrdStatus_Tag -> "OrdStatus"
        | Full_Field_WorkingIndicator_Tag -> "WorkingIndicator"
        | Full_Field_OrdRejReason_Tag -> "OrdRejReason"
        | Full_Field_ExecRestatementReason_Tag -> "ExecRestatementReason"
        | Full_Field_Account_Tag -> "Account"
        | Full_Field_AcctIDSource_Tag -> "AcctIDSource"
        | Full_Field_AccountType_Tag -> "AccountType"
        | Full_Field_DayBookingInst_Tag -> "DayBookingInst"
        | Full_Field_BookingUnit_Tag -> "BookingUnit"
        | Full_Field_PreallocMethod_Tag -> "PreallocMethod"
        | Full_Field_SettlType_Tag -> "SettlType"
        | Full_Field_SettlDate_Tag -> "SettlDate"
        | Full_Field_CashMargin_Tag -> "CashMargin"
        | Full_Field_ClearingFeeIndicator_Tag -> "ClearingFeeIndicator"
        | Full_Field_Side_Tag -> "Side"
        | Full_Field_QtyType_Tag -> "QtyType"
        | Full_Field_OrdType_Tag -> "OrdType"
        | Full_Field_PriceType_Tag -> "PriceType"
        | Full_Field_Price_Tag -> "Price"
        | Full_Field_StopPx_Tag -> "StopPx"
        | Full_Field_PeggedPrice_Tag -> "PeggedPrice"
        | Full_Field_DiscretionPrice_Tag -> "DiscretionPrice"
        | Full_Field_TargetStrategy_Tag -> "TargetStrategy"
        | Full_Field_TargetStrategyParameters_Tag -> "TargetStrategyParameters"
        | Full_Field_ParticipationRate_Tag -> "ParticipationRate"
        | Full_Field_TargetStrategyPerformance_Tag -> "TargetStrategyPerformance"
        | Full_Field_Currency_Tag -> "Currency"
        | Full_Field_ComplianceID_Tag -> "ComplianceID"
        | Full_Field_SolicitedFlag_Tag -> "SolicitedFlag"
        | Full_Field_TimeInForce_Tag -> "TimeInForce"
        | Full_Field_EffectiveTime_Tag -> "EffectiveTime"
        | Full_Field_ExpireDate_Tag -> "ExpireDate"
        | Full_Field_ExpireTime_Tag -> "ExpireTime"
        | Full_Field_ExecInst_Tag -> "ExecInst"
        | Full_Field_OrderCapacity_Tag -> "OrderCapacity"
        | Full_Field_OrderRestrictions_Tag -> "OrderRestrictions"
        | Full_Field_CustOrderCapacity_Tag -> "CustOrderCapacity"
        | Full_Field_LastQty_Tag -> "LastQty"
        | Full_Field_UnderlyingLastQty_Tag -> "UnderlyingLastQty"
        | Full_Field_LastPx_Tag -> "LastPx"
        | Full_Field_UnderlyingLastPx_Tag -> "UnderlyingLastPx"
        | Full_Field_LastParPx_Tag -> "LastParPx"
        | Full_Field_LastSpotRate_Tag -> "LastSpotRate"
        | Full_Field_LastForwardPoints_Tag -> "LastForwardPoints"
        | Full_Field_LastMkt_Tag -> "LastMkt"
        | Full_Field_TradingSessionID_Tag -> "TradingSessionID"
        | Full_Field_TradingSessionSubID_Tag -> "TradingSessionSubID"
        | Full_Field_TimeBracket_Tag -> "TimeBracket"
        | Full_Field_LastCapacity_Tag -> "LastCapacity"
        | Full_Field_LeavesQty_Tag -> "LeavesQty"
        | Full_Field_CumQty_Tag -> "CumQty"
        | Full_Field_AvgPx_Tag -> "AvgPx"
        | Full_Field_DayOrderQty_Tag -> "DayOrderQty"
        | Full_Field_DayCumQty_Tag -> "DayCumQty"
        | Full_Field_DayAvgPx_Tag -> "DayAvgPx"
        | Full_Field_GTBookingInst_Tag -> "GTBookingInst"
        | Full_Field_TradeDate_Tag -> "TradeDate"
        | Full_Field_TransactTime_Tag -> "TransactTime"
        | Full_Field_ReportToExch_Tag -> "ReportToExch"
        | Full_Field_GrossTradeAmt_Tag -> "GrossTradeAmt"
        | Full_Field_NumDaysInterest_Tag -> "NumDaysInterest"
        | Full_Field_ExDate_Tag -> "ExDate"
        | Full_Field_AccruedInterestRate_Tag -> "AccruedInterestRate"
        | Full_Field_AccruedInterestAmt_Tag -> "AccruedInterestAmt"
        | Full_Field_InterestAtMaturity_Tag -> "InterestAtMaturity"
        | Full_Field_EndAccruedInterestAmt_Tag -> "EndAccruedInterestAmt"
        | Full_Field_StartCash_Tag -> "StartCash"
        | Full_Field_EndCash_Tag -> "EndCash"
        | Full_Field_TradedFlatSwitch_Tag -> "TradedFlatSwitch"
        | Full_Field_BasisFeatureDate_Tag -> "BasisFeatureDate"
        | Full_Field_BasisFeaturePrice_Tag -> "BasisFeaturePrice"
        | Full_Field_Concession_Tag -> "Concession"
        | Full_Field_TotalTakedown_Tag -> "TotalTakedown"
        | Full_Field_NetMoney_Tag -> "NetMoney"
        | Full_Field_SettlCurrAmt_Tag -> "SettlCurrAmt"
        | Full_Field_SettlCurrency_Tag -> "SettlCurrency"
        | Full_Field_SettlCurrFxRate_Tag -> "SettlCurrFxRate"
        | Full_Field_SettlCurrFxRateCalc_Tag -> "SettlCurrFxRateCalc"
        | Full_Field_HandlInst_Tag -> "HandlInst"
        | Full_Field_MinQty_Tag -> "MinQty"
        | Full_Field_MaxFloor_Tag -> "MaxFloor"
        | Full_Field_PositionEffect_Tag -> "PositionEffect"
        | Full_Field_MaxShow_Tag -> "MaxShow"
        | Full_Field_BookingType_Tag -> "BookingType"
        | Full_Field_Text_Tag -> "Text"
        | Full_Field_EncodedTextLen_Tag -> "EncodedTextLen"
        | Full_Field_EncodedText_Tag -> "EncodedText"
        | Full_Field_SettlDate2_Tag -> "SettlDate2"
        | Full_Field_OrderQty2_Tag -> "OrderQty2"
        | Full_Field_LastForwardPoints2_Tag -> "LastForwardPoints2"
        | Full_Field_MultiLegReportingType_Tag -> "MultiLegReportingType"
        | Full_Field_CancellationRights_Tag -> "CancellationRights"
        | Full_Field_MoneyLaunderingStatus_Tag -> "MoneyLaunderingStatus"
        | Full_Field_RegistID_Tag -> "RegistID"
        | Full_Field_Designation_Tag -> "Designation"
        | Full_Field_TransBkdTime_Tag -> "TransBkdTime"
        | Full_Field_ExecValuationPoint_Tag -> "ExecValuationPoint"
        | Full_Field_ExecPriceType_Tag -> "ExecPriceType"
        | Full_Field_ExecPriceAdjustment_Tag -> "ExecPriceAdjustment"
        | Full_Field_PriorityIndicator_Tag -> "PriorityIndicator"
        | Full_Field_PriceImprovement_Tag -> "PriceImprovement"
        | Full_Field_LastLiquidityInd_Tag -> "LastLiquidityInd"
        | Full_Field_CopyMsgIndicator_Tag -> "CopyMsgIndicator"
        | Full_Field_NoPartyIDs_Tag -> "NoPartyIDs"
        | Full_Field_PartyID_Tag -> "PartyID"
        | Full_Field_PartyIDSource_Tag -> "PartyIDSource"
        | Full_Field_PartyRole_Tag -> "PartyRole"
        | Full_Field_NoPartySubIDs_Tag -> "NoPartySubIDs"
        | Full_Field_PartySubID_Tag -> "PartySubID"
        | Full_Field_PartySubIDType_Tag -> "PartySubIDType"
        | Full_Field_NoContraBrokers_Tag -> "NoContraBrokers"
        | Full_Field_ContraBroker_Tag -> "ContraBroker"
        | Full_Field_ContraTrader_Tag -> "ContraTrader"
        | Full_Field_ContraTradeQty_Tag -> "ContraTradeQty"
        | Full_Field_ContraTradeTime_Tag -> "ContraTradeTime"
        | Full_Field_ContraLegRefID_Tag -> "ContraLegRefID"
        | Full_Field_Symbol_Tag -> "Symbol"
        | Full_Field_SymbolSfx_Tag -> "SymbolSfx"
        | Full_Field_SecurityID_Tag -> "SecurityID"
        | Full_Field_SecurityIDSource_Tag -> "SecurityIDSource"
        | Full_Field_Product_Tag -> "Product"
        | Full_Field_CFICode_Tag -> "CFICode"
        | Full_Field_SecurityType_Tag -> "SecurityType"
        | Full_Field_SecuritySubType_Tag -> "SecuritySubType"
        | Full_Field_MaturityMonthYear_Tag -> "MaturityMonthYear"
        | Full_Field_MaturityDate_Tag -> "MaturityDate"
        | Full_Field_CouponPaymentDate_Tag -> "CouponPaymentDate"
        | Full_Field_IssueDate_Tag -> "IssueDate"
        | Full_Field_RepoCollateralSecurityType_Tag -> "RepoCollateralSecurityType"
        | Full_Field_RepurchaseTerm_Tag -> "RepurchaseTerm"
        | Full_Field_RepurchaseRate_Tag -> "RepurchaseRate"
        | Full_Field_Factor_Tag -> "Factor"
        | Full_Field_CreditRating_Tag -> "CreditRating"
        | Full_Field_InstrRegistry_Tag -> "InstrRegistry"
        | Full_Field_CountryOfIssue_Tag -> "CountryOfIssue"
        | Full_Field_StateOrProvinceOfIssue_Tag -> "StateOrProvinceOfIssue"
        | Full_Field_LocaleOfIssue_Tag -> "LocaleOfIssue"
        | Full_Field_RedemptionDate_Tag -> "RedemptionDate"
        | Full_Field_StrikePrice_Tag -> "StrikePrice"
        | Full_Field_StrikeCurrency_Tag -> "StrikeCurrency"
        | Full_Field_OptAttribute_Tag -> "OptAttribute"
        | Full_Field_ContractMultiplier_Tag -> "ContractMultiplier"
        | Full_Field_CouponRate_Tag -> "CouponRate"
        | Full_Field_SecurityExchange_Tag -> "SecurityExchange"
        | Full_Field_Issuer_Tag -> "Issuer"
        | Full_Field_EncodedIssuerLen_Tag -> "EncodedIssuerLen"
        | Full_Field_EncodedIssuer_Tag -> "EncodedIssuer"
        | Full_Field_SecurityDesc_Tag -> "SecurityDesc"
        | Full_Field_EncodedSecurityDescLen_Tag -> "EncodedSecurityDescLen"
        | Full_Field_EncodedSecurityDesc_Tag -> "EncodedSecurityDesc"
        | Full_Field_Pool_Tag -> "Pool"
        | Full_Field_ContractSettlMonth_Tag -> "ContractSettlMonth"
        | Full_Field_CPProgram_Tag -> "CPProgram"
        | Full_Field_CPRegType_Tag -> "CPRegType"
        | Full_Field_DatedDate_Tag -> "DatedDate"
        | Full_Field_InterestAccrualDate_Tag -> "InterestAccrualDate"
        | Full_Field_NoSecurityAltID_Tag -> "NoSecurityAltID"
        | Full_Field_SecurityAltID_Tag -> "SecurityAltID"
        | Full_Field_SecurityAltIDSource_Tag -> "SecurityAltIDSource"
        | Full_Field_NoEvents_Tag -> "NoEvents"
        | Full_Field_EventType_Tag -> "EventType"
        | Full_Field_EventDate_Tag -> "EventDate"
        | Full_Field_EventPx_Tag -> "EventPx"
        | Full_Field_EventText_Tag -> "EventText"
        | Full_Field_AgreementDesc_Tag -> "AgreementDesc"
        | Full_Field_AgreementID_Tag -> "AgreementID"
        | Full_Field_AgreementDate_Tag -> "AgreementDate"
        | Full_Field_AgreementCurrency_Tag -> "AgreementCurrency"
        | Full_Field_TerminationType_Tag -> "TerminationType"
        | Full_Field_StartDate_Tag -> "StartDate"
        | Full_Field_EndDate_Tag -> "EndDate"
        | Full_Field_DeliveryType_Tag -> "DeliveryType"
        | Full_Field_MarginRatio_Tag -> "MarginRatio"
        | Full_Field_NoUnderlyings_Tag -> "NoUnderlyings"
        | Full_Field_UnderlyingSymbol_Tag -> "UnderlyingSymbol"
        | Full_Field_UnderlyingSymbolSfx_Tag -> "UnderlyingSymbolSfx"
        | Full_Field_UnderlyingSecurityID_Tag -> "UnderlyingSecurityID"
        | Full_Field_UnderlyingSecurityIDSource_Tag -> "UnderlyingSecurityIDSource"
        | Full_Field_UnderlyingProduct_Tag -> "UnderlyingProduct"
        | Full_Field_UnderlyingCFICode_Tag -> "UnderlyingCFICode"
        | Full_Field_UnderlyingSecurityType_Tag -> "UnderlyingSecurityType"
        | Full_Field_UnderlyingSecuritySubType_Tag -> "UnderlyingSecuritySubType"
        | Full_Field_UnderlyingMaturityMonthYear_Tag -> "UnderlyingMaturityMonthYear"
        | Full_Field_UnderlyingMaturityDate_Tag -> "UnderlyingMaturityDate"
        | Full_Field_UnderlyingCouponPaymentDate_Tag -> "UnderlyingCouponPaymentDate"
        | Full_Field_UnderlyingIssueDate_Tag -> "UnderlyingIssueDate"
        | Full_Field_UnderlyingRepoCollateralSecurityType_Tag -> "UnderlyingRepoCollateralSecurityType"
        | Full_Field_UnderlyingRepurchaseTerm_Tag -> "UnderlyingRepurchaseTerm"
        | Full_Field_UnderlyingRepurchaseRate_Tag -> "UnderlyingRepurchaseRate"
        | Full_Field_UnderlyingFactor_Tag -> "UnderlyingFactor"
        | Full_Field_UnderlyingCreditRating_Tag -> "UnderlyingCreditRating"
        | Full_Field_UnderlyingInstrRegistry_Tag -> "UnderlyingInstrRegistry"
        | Full_Field_UnderlyingCountryOfIssue_Tag -> "UnderlyingCountryOfIssue"
        | Full_Field_UnderlyingStateOrProvinceOfIssue_Tag -> "UnderlyingStateOrProvinceOfIssue"
        | Full_Field_UnderlyingLocaleOfIssue_Tag -> "UnderlyingLocaleOfIssue"
        | Full_Field_UnderlyingRedemptionDate_Tag -> "UnderlyingRedemptionDate"
        | Full_Field_UnderlyingStrikePrice_Tag -> "UnderlyingStrikePrice"
        | Full_Field_UnderlyingStrikeCurrency_Tag -> "UnderlyingStrikeCurrency"
        | Full_Field_UnderlyingOptAttribute_Tag -> "UnderlyingOptAttribute"
        | Full_Field_UnderlyingContractMultiplier_Tag -> "UnderlyingContractMultiplier"
        | Full_Field_UnderlyingCouponRate_Tag -> "UnderlyingCouponRate"
        | Full_Field_UnderlyingSecurityExchange_Tag -> "UnderlyingSecurityExchange"
        | Full_Field_UnderlyingIssuer_Tag -> "UnderlyingIssuer"
        | Full_Field_EncodedUnderlyingIssuerLen_Tag -> "EncodedUnderlyingIssuerLen"
        | Full_Field_EncodedUnderlyingIssuer_Tag -> "EncodedUnderlyingIssuer"
        | Full_Field_UnderlyingSecurityDesc_Tag -> "UnderlyingSecurityDesc"
        | Full_Field_EncodedUnderlyingSecurityDescLen_Tag -> "EncodedUnderlyingSecurityDescLen"
        | Full_Field_EncodedUnderlyingSecurityDesc_Tag -> "EncodedUnderlyingSecurityDesc"
        | Full_Field_UnderlyingCPProgram_Tag -> "UnderlyingCPProgram"
        | Full_Field_UnderlyingCPRegType_Tag -> "UnderlyingCPRegType"
        | Full_Field_UnderlyingCurrency_Tag -> "UnderlyingCurrency"
        | Full_Field_UnderlyingQty_Tag -> "UnderlyingQty"
        | Full_Field_UnderlyingPx_Tag -> "UnderlyingPx"
        | Full_Field_UnderlyingDirtyPrice_Tag -> "UnderlyingDirtyPrice"
        | Full_Field_UnderlyingEndPrice_Tag -> "UnderlyingEndPrice"
        | Full_Field_UnderlyingStartValue_Tag -> "UnderlyingStartValue"
        | Full_Field_UnderlyingCurrentValue_Tag -> "UnderlyingCurrentValue"
        | Full_Field_UnderlyingEndValue_Tag -> "UnderlyingEndValue"
        | Full_Field_NoUnderlyingSecurityAltID_Tag -> "NoUnderlyingSecurityAltID"
        | Full_Field_UnderlyingSecurityAltID_Tag -> "UnderlyingSecurityAltID"
        | Full_Field_UnderlyingSecurityAltIDSource_Tag -> "UnderlyingSecurityAltIDSource"
        | Full_Field_NoUnderlyingStips_Tag -> "NoUnderlyingStips"
        | Full_Field_UnderlyingStipType_Tag -> "UnderlyingStipType"
        | Full_Field_UnderlyingStipValue_Tag -> "UnderlyingStipValue"
        | Full_Field_NoStipulations_Tag -> "NoStipulations"
        | Full_Field_StipulationType_Tag -> "StipulationType"
        | Full_Field_StipulationValue_Tag -> "StipulationValue"
        | Full_Field_OrderQty_Tag -> "OrderQty"
        | Full_Field_CashOrderQty_Tag -> "CashOrderQty"
        | Full_Field_OrderPercent_Tag -> "OrderPercent"
        | Full_Field_RoundingDirection_Tag -> "RoundingDirection"
        | Full_Field_RoundingModulus_Tag -> "RoundingModulus"
        | Full_Field_PegOffsetValue_Tag -> "PegOffsetValue"
        | Full_Field_PegMoveType_Tag -> "PegMoveType"
        | Full_Field_PegOffsetType_Tag -> "PegOffsetType"
        | Full_Field_PegLimitType_Tag -> "PegLimitType"
        | Full_Field_PegRoundDirection_Tag -> "PegRoundDirection"
        | Full_Field_PegScope_Tag -> "PegScope"
        | Full_Field_DiscretionInst_Tag -> "DiscretionInst"
        | Full_Field_DiscretionOffsetValue_Tag -> "DiscretionOffsetValue"
        | Full_Field_DiscretionMoveType_Tag -> "DiscretionMoveType"
        | Full_Field_DiscretionOffsetType_Tag -> "DiscretionOffsetType"
        | Full_Field_DiscretionLimitType_Tag -> "DiscretionLimitType"
        | Full_Field_DiscretionRoundDirection_Tag -> "DiscretionRoundDirection"
        | Full_Field_DiscretionScope_Tag -> "DiscretionScope"
        | Full_Field_Commission_Tag -> "Commission"
        | Full_Field_CommType_Tag -> "CommType"
        | Full_Field_CommCurrency_Tag -> "CommCurrency"
        | Full_Field_FundRenewWaiv_Tag -> "FundRenewWaiv"
        | Full_Field_Spread_Tag -> "Spread"
        | Full_Field_BenchmarkCurveCurrency_Tag -> "BenchmarkCurveCurrency"
        | Full_Field_BenchmarkCurveName_Tag -> "BenchmarkCurveName"
        | Full_Field_BenchmarkCurvePoint_Tag -> "BenchmarkCurvePoint"
        | Full_Field_BenchmarkPrice_Tag -> "BenchmarkPrice"
        | Full_Field_BenchmarkPriceType_Tag -> "BenchmarkPriceType"
        | Full_Field_BenchmarkSecurityID_Tag -> "BenchmarkSecurityID"
        | Full_Field_BenchmarkSecurityIDSource_Tag -> "BenchmarkSecurityIDSource"
        | Full_Field_YieldType_Tag -> "YieldType"
        | Full_Field_Yield_Tag -> "Yield"
        | Full_Field_YieldCalcDate_Tag -> "YieldCalcDate"
        | Full_Field_YieldRedemptionDate_Tag -> "YieldRedemptionDate"
        | Full_Field_YieldRedemptionPrice_Tag -> "YieldRedemptionPrice"
        | Full_Field_YieldRedemptionPriceType_Tag -> "YieldRedemptionPriceType"
        | Full_Field_NoContAmts_Tag -> "NoContAmts"
        | Full_Field_ContAmtType_Tag -> "ContAmtType"
        | Full_Field_ContAmtValue_Tag -> "ContAmtValue"
        | Full_Field_ContAmtCurr_Tag -> "ContAmtCurr"
        | Full_Field_NoLegs_Tag -> "NoLegs"
        | Full_Field_LegQty_Tag -> "LegQty"
        | Full_Field_LegSwapType_Tag -> "LegSwapType"
        | Full_Field_LegPositionEffect_Tag -> "LegPositionEffect"
        | Full_Field_LegCoveredOrUncovered_Tag -> "LegCoveredOrUncovered"
        | Full_Field_LegRefID_Tag -> "LegRefID"
        | Full_Field_LegPrice_Tag -> "LegPrice"
        | Full_Field_LegSettlType_Tag -> "LegSettlType"
        | Full_Field_LegSettlDate_Tag -> "LegSettlDate"
        | Full_Field_LegLastPx_Tag -> "LegLastPx"
        | Full_Field_LegSymbol_Tag -> "LegSymbol"
        | Full_Field_LegSymbolSfx_Tag -> "LegSymbolSfx"
        | Full_Field_LegSecurityID_Tag -> "LegSecurityID"
        | Full_Field_LegSecurityIDSource_Tag -> "LegSecurityIDSource"
        | Full_Field_LegProduct_Tag -> "LegProduct"
        | Full_Field_LegCFICode_Tag -> "LegCFICode"
        | Full_Field_LegSecurityType_Tag -> "LegSecurityType"
        | Full_Field_LegSecuritySubType_Tag -> "LegSecuritySubType"
        | Full_Field_LegMaturityMonthYear_Tag -> "LegMaturityMonthYear"
        | Full_Field_LegMaturityDate_Tag -> "LegMaturityDate"
        | Full_Field_LegCouponPaymentDate_Tag -> "LegCouponPaymentDate"
        | Full_Field_LegIssueDate_Tag -> "LegIssueDate"
        | Full_Field_LegRepoCollateralSecurityType_Tag -> "LegRepoCollateralSecurityType"
        | Full_Field_LegRepurchaseTerm_Tag -> "LegRepurchaseTerm"
        | Full_Field_LegRepurchaseRate_Tag -> "LegRepurchaseRate"
        | Full_Field_LegFactor_Tag -> "LegFactor"
        | Full_Field_LegCreditRating_Tag -> "LegCreditRating"
        | Full_Field_LegInstrRegistry_Tag -> "LegInstrRegistry"
        | Full_Field_LegCountryOfIssue_Tag -> "LegCountryOfIssue"
        | Full_Field_LegStateOrProvinceOfIssue_Tag -> "LegStateOrProvinceOfIssue"
        | Full_Field_LegLocaleOfIssue_Tag -> "LegLocaleOfIssue"
        | Full_Field_LegRedemptionDate_Tag -> "LegRedemptionDate"
        | Full_Field_LegStrikePrice_Tag -> "LegStrikePrice"
        | Full_Field_LegStrikeCurrency_Tag -> "LegStrikeCurrency"
        | Full_Field_LegOptAttribute_Tag -> "LegOptAttribute"
        | Full_Field_LegContractMultiplier_Tag -> "LegContractMultiplier"
        | Full_Field_LegCouponRate_Tag -> "LegCouponRate"
        | Full_Field_LegSecurityExchange_Tag -> "LegSecurityExchange"
        | Full_Field_LegIssuer_Tag -> "LegIssuer"
        | Full_Field_EncodedLegIssuerLen_Tag -> "EncodedLegIssuerLen"
        | Full_Field_EncodedLegIssuer_Tag -> "EncodedLegIssuer"
        | Full_Field_LegSecurityDesc_Tag -> "LegSecurityDesc"
        | Full_Field_EncodedLegSecurityDescLen_Tag -> "EncodedLegSecurityDescLen"
        | Full_Field_EncodedLegSecurityDesc_Tag -> "EncodedLegSecurityDesc"
        | Full_Field_LegRatioQty_Tag -> "LegRatioQty"
        | Full_Field_LegSide_Tag -> "LegSide"
        | Full_Field_LegCurrency_Tag -> "LegCurrency"
        | Full_Field_LegPool_Tag -> "LegPool"
        | Full_Field_LegDatedDate_Tag -> "LegDatedDate"
        | Full_Field_LegContractSettlMonth_Tag -> "LegContractSettlMonth"
        | Full_Field_LegInterestAccrualDate_Tag -> "LegInterestAccrualDate"
        | Full_Field_NoLegSecurityAltID_Tag -> "NoLegSecurityAltID"
        | Full_Field_LegSecurityAltID_Tag -> "LegSecurityAltID"
        | Full_Field_LegSecurityAltIDSource_Tag -> "LegSecurityAltIDSource"
        | Full_Field_NoLegStipulations_Tag -> "NoLegStipulations"
        | Full_Field_LegStipulationType_Tag -> "LegStipulationType"
        | Full_Field_LegStipulationValue_Tag -> "LegStipulationValue"
        | Full_Field_NoNestedPartyIDs_Tag -> "NoNestedPartyIDs"
        | Full_Field_NestedPartyID_Tag -> "NestedPartyID"
        | Full_Field_NestedPartyIDSource_Tag -> "NestedPartyIDSource"
        | Full_Field_NestedPartyRole_Tag -> "NestedPartyRole"
        | Full_Field_NoNestedPartySubIDs_Tag -> "NoNestedPartySubIDs"
        | Full_Field_NestedPartySubID_Tag -> "NestedPartySubID"
        | Full_Field_NestedPartySubIDType_Tag -> "NestedPartySubIDType"
        | Full_Field_NoMiscFees_Tag -> "NoMiscFees"
        | Full_Field_MiscFeeAmt_Tag -> "MiscFeeAmt"
        | Full_Field_MiscFeeCurr_Tag -> "MiscFeeCurr"
        | Full_Field_MiscFeeType_Tag -> "MiscFeeType"
        | Full_Field_MiscFeeBasis_Tag -> "MiscFeeBasis"
        | Full_Field_AllocID_Tag -> "AllocID"
        | Full_Field_ExDestination_Tag -> "ExDestination"
        | Full_Field_ProcessCode_Tag -> "ProcessCode"
        | Full_Field_PrevClosePx_Tag -> "PrevClosePx"
        | Full_Field_LocateReqd_Tag -> "LocateReqd"
        | Full_Field_IOIID_Tag -> "IOIID"
        | Full_Field_QuoteID_Tag -> "QuoteID"
        | Full_Field_ForexReq_Tag -> "ForexReq"
        | Full_Field_Price2_Tag -> "Price2"
        | Full_Field_CoveredOrUncovered_Tag -> "CoveredOrUncovered"
        | Full_Field_NoAllocs_Tag -> "NoAllocs"
        | Full_Field_AllocAccount_Tag -> "AllocAccount"
        | Full_Field_AllocAcctIDSource_Tag -> "AllocAcctIDSource"
        | Full_Field_AllocSettlCurrency_Tag -> "AllocSettlCurrency"
        | Full_Field_IndividualAllocID_Tag -> "IndividualAllocID"
        | Full_Field_AllocQty_Tag -> "AllocQty"
        | Full_Field_NoTradingSessions_Tag -> "NoTradingSessions"
    )
;;

let full_app_msg_tag_to_json (tag)  : json =
    `String (full_app_msg_tag_to_string tag)
;;

let full_app_msg_tag_opt_to_json (tag)  : json =
    (match tag with
        | None -> (`Null)
        | Some tag -> (full_app_msg_tag_to_json tag)
    )
;;

let full_app_field_tag_to_json (tag)  : json =
    `String (full_app_field_tag_to_string tag)
;;

let full_app_field_tag_opt_to_json (tag)  : json =
    (match tag with
        | None -> (`Null)
        | Some tag -> (full_app_field_tag_to_json tag)
    )
;;
