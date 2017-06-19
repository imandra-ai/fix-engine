
(* @meta[imandra_ignore] on @end *)
open Base_types;;
open Datetime;;
open Model_messages;;
open Full_app_messages;;
open Full_app_records;;
open Model_tags;;
open Full_app_tags;;
open Enum_converter;;
(* @meta[imandra_ignore] off @end *)


let convert_FIX_Full_Msg_ExecutionReport ( msg : full_fix_executionreport_data ) =
    let c_f_ExecutionReport_Text = msg.f_ExecutionReport_Text in
    (match msg.f_ExecutionReport_Instrument.f_Instrument_Symbol with
        | None -> (FIX_TL_Req_Field_Missing {
            field_missing_data_msg = M_Msg_ExecutionReport_Tag;
            field_missing_data_field = M_Field_Symbol_Tag
        })
        | Some m_f_Instrument_Symbol -> let c_f_ExecutionReport_Instrument_Symbol = m_f_Instrument_Symbol in
        let c_f_ExecutionReport_OrdStatus = msg.f_ExecutionReport_OrdStatus in
        let c_f_ExecutionReport_CumQty = msg.f_ExecutionReport_CumQty in
        let c_f_ExecutionReport_LeavesQty = msg.f_ExecutionReport_LeavesQty in
        let c_f_ExecutionReport_Side = msg.f_ExecutionReport_Side in
        let c_f_ExecutionReport_AvgPx = msg.f_ExecutionReport_AvgPx in
        let c_f_ExecutionReport_ExecType = msg.f_ExecutionReport_ExecType in
        let c_f_ExecutionReport_ExecID = msg.f_ExecutionReport_ExecID in
        let c_f_ExecutionReport_OrderID = msg.f_ExecutionReport_OrderID in
        (match msg.f_ExecutionReport_ClOrdID with
            | None -> (FIX_TL_Req_Field_Missing {
                field_missing_data_msg = M_Msg_ExecutionReport_Tag;
                field_missing_data_field = M_Field_ClOrdID_Tag
            })
            | Some m_f_ExecutionReport_ClOrdID -> let c_f_ExecutionReport_ClOrdID = m_f_ExecutionReport_ClOrdID in
            let fix_msg_data = {
                f_ExecutionReport_ClOrdID = c_f_ExecutionReport_ClOrdID;
                f_ExecutionReport_OrderID = c_f_ExecutionReport_OrderID;
                f_ExecutionReport_ExecID = c_f_ExecutionReport_ExecID;
                f_ExecutionReport_ExecType = convert__full_to_model_ExecType c_f_ExecutionReport_ExecType;
                f_ExecutionReport_AvgPx = c_f_ExecutionReport_AvgPx;
                f_ExecutionReport_Side = convert__full_to_model_Side c_f_ExecutionReport_Side;
                f_ExecutionReport_LeavesQty = c_f_ExecutionReport_LeavesQty;
                f_ExecutionReport_CumQty = c_f_ExecutionReport_CumQty;
                f_ExecutionReport_OrdStatus = convert__full_to_model_OrdStatus c_f_ExecutionReport_OrdStatus;
                f_ExecutionReport_Instrument_Symbol = c_f_ExecutionReport_Instrument_Symbol;
                f_ExecutionReport_Text = c_f_ExecutionReport_Text
            } in
            FIX_TL_Normal (FIX_Msg_ExecutionReport fix_msg_data)
        )
    )
;;

let convert_FIX_Full_Msg_NewOrderSingle ( msg : full_fix_newordersingle_data ) =
    (match msg.f_NewOrderSingle_Instrument.f_Instrument_Symbol with
        | None -> (FIX_TL_Req_Field_Missing {
            field_missing_data_msg = M_Msg_NewOrderSingle_Tag;
            field_missing_data_field = M_Field_Symbol_Tag
        })
        | Some m_f_Instrument_Symbol -> let c_f_NewOrderSingle_Instrument_Symbol = m_f_Instrument_Symbol in
        let c_f_NewOrderSingle_OrdType = msg.f_NewOrderSingle_OrdType in
        let c_f_NewOrderSingle_TransactTime = msg.f_NewOrderSingle_TransactTime in
        let c_f_NewOrderSingle_Side = msg.f_NewOrderSingle_Side in
        let c_f_NewOrderSingle_ClOrdID = msg.f_NewOrderSingle_ClOrdID in
        let fix_msg_data = {
            f_NewOrderSingle_ClOrdID = c_f_NewOrderSingle_ClOrdID;
            f_NewOrderSingle_Side = convert__full_to_model_Side c_f_NewOrderSingle_Side;
            f_NewOrderSingle_TransactTime = c_f_NewOrderSingle_TransactTime;
            f_NewOrderSingle_OrdType = convert__full_to_model_OrdType c_f_NewOrderSingle_OrdType;
            f_NewOrderSingle_Instrument_Symbol = c_f_NewOrderSingle_Instrument_Symbol
        } in
        FIX_TL_Normal (FIX_Msg_NewOrderSingle fix_msg_data)
    )
;;

let convert_full_to_model_fix ( msg : full_app_msg_data ) =
    (match msg with
        | FIX_Full_Msg_ExecutionReport msg_data -> (convert_FIX_Full_Msg_ExecutionReport msg_data)
        | FIX_Full_Msg_NewOrderSingle msg_data -> (convert_FIX_Full_Msg_NewOrderSingle msg_data)
        | _ -> FIX_TL_None
    )
;;

let convert_FIX_Msg_ExecutionReport ( msg : mod_executionreport_data ) =
    FIX_Full_Msg_ExecutionReport {
        f_ExecutionReport_OrderID = msg.f_ExecutionReport_OrderID;
        f_ExecutionReport_SecondaryOrderID = None;
        f_ExecutionReport_SecondaryClOrdID = None;
        f_ExecutionReport_SecondaryExecID = None;
        f_ExecutionReport_ClOrdID = Some msg.f_ExecutionReport_ClOrdID;
        f_ExecutionReport_OrigClOrdID = None;
        f_ExecutionReport_ClOrdLinkID = None;
        f_ExecutionReport_QuoteRespID = None;
        f_ExecutionReport_OrdStatusReqID = None;
        f_ExecutionReport_MassStatusReqID = None;
        f_ExecutionReport_TotNumReports = None;
        f_ExecutionReport_LastRptRequested = None;
        f_ExecutionReport_Parties = {
            f_Parties_NoPartyIDs = None;
            f_Parties_PartyID = None;
            f_Parties_PartyIDSource = None;
            f_Parties_PartyRole = None;
            f_Parties_PtysSubGrp = {
                f_PtysSubGrp_NoPartySubIDs = None;
                f_PtysSubGrp_PartySubID = None;
                f_PtysSubGrp_PartySubIDType = None
            }
        };
        f_ExecutionReport_TradeOriginationDate = None;
        f_ExecutionReport_ContraGrp = {
            f_ContraGrp_ContraBroker = None;
            f_ContraGrp_ContraLegRefID = None;
            f_ContraGrp_ContraTradeQty = None;
            f_ContraGrp_ContraTradeTime = None;
            f_ContraGrp_ContraTrader = None;
            f_ContraGrp_NoContraBrokers = None
        };
        f_ExecutionReport_ListID = None;
        f_ExecutionReport_CrossID = None;
        f_ExecutionReport_OrigCrossID = None;
        f_ExecutionReport_CrossType = None;
        f_ExecutionReport_ExecID = msg.f_ExecutionReport_ExecID;
        f_ExecutionReport_ExecRefID = None;
        f_ExecutionReport_ExecType = convert__model_to_full_ExecType msg.f_ExecutionReport_ExecType;
        f_ExecutionReport_OrdStatus = convert__model_to_full_OrdStatus msg.f_ExecutionReport_OrdStatus;
        f_ExecutionReport_WorkingIndicator = None;
        f_ExecutionReport_OrdRejReason = None;
        f_ExecutionReport_ExecRestatementReason = None;
        f_ExecutionReport_Account = None;
        f_ExecutionReport_AcctIDSource = None;
        f_ExecutionReport_AccountType = None;
        f_ExecutionReport_DayBookingInst = None;
        f_ExecutionReport_BookingUnit = None;
        f_ExecutionReport_PreallocMethod = None;
        f_ExecutionReport_SettlType = None;
        f_ExecutionReport_SettlDate = None;
        f_ExecutionReport_CashMargin = None;
        f_ExecutionReport_ClearingFeeIndicator = None;
        f_ExecutionReport_Instrument = {
            f_Instrument_Symbol = Some msg.f_ExecutionReport_Instrument_Symbol;
            f_Instrument_CFICode = None;
            f_Instrument_CPProgram = None;
            f_Instrument_CPRegType = None;
            f_Instrument_ContractMultiplier = None;
            f_Instrument_ContractSettlMonth = None;
            f_Instrument_CountryOfIssue = None;
            f_Instrument_CouponPaymentDate = None;
            f_Instrument_CouponRate = None;
            f_Instrument_CreditRating = None;
            f_Instrument_DatedDate = None;
            f_Instrument_EncodedIssuer = None;
            f_Instrument_EncodedIssuerLen = None;
            f_Instrument_EncodedSecurityDesc = None;
            f_Instrument_EncodedSecurityDescLen = None;
            f_Instrument_Factor = None;
            f_Instrument_InstrRegistry = None;
            f_Instrument_InterestAccrualDate = None;
            f_Instrument_IssueDate = None;
            f_Instrument_Issuer = None;
            f_Instrument_LocaleOfIssue = None;
            f_Instrument_MaturityDate = None;
            f_Instrument_MaturityMonthYear = None;
            f_Instrument_OptAttribute = None;
            f_Instrument_Pool = None;
            f_Instrument_Product = None;
            f_Instrument_PutOrCall = None;
            f_Instrument_RedemptionDate = None;
            f_Instrument_RepoCollateralSecurityType = None;
            f_Instrument_RepurchaseRate = None;
            f_Instrument_RepurchaseTerm = None;
            f_Instrument_SecurityDesc = None;
            f_Instrument_SecurityExchange = None;
            f_Instrument_SecurityID = None;
            f_Instrument_SecurityIDSource = None;
            f_Instrument_SecuritySubType = None;
            f_Instrument_SecurityType = None;
            f_Instrument_StateOrProvinceOfIssue = None;
            f_Instrument_StrikeCurrency = None;
            f_Instrument_StrikePrice = None;
            f_Instrument_SymbolSfx = None;
            f_Instrument_EvntGrp = {
                f_EvntGrp_EventDate = None;
                f_EvntGrp_EventPx = None;
                f_EvntGrp_EventText = None;
                f_EvntGrp_EventType = None;
                f_EvntGrp_NoEvents = None
            };
            f_Instrument_SecAltIDGrp = {
                f_SecAltIDGrp_NoSecurityAltID = None;
                f_SecAltIDGrp_SecurityAltID = None;
                f_SecAltIDGrp_SecurityAltIDSource = None
            }
        };
        f_ExecutionReport_FinancingDetails = {
            f_FinancingDetails_AgreementCurrency = None;
            f_FinancingDetails_AgreementDate = None;
            f_FinancingDetails_AgreementDesc = None;
            f_FinancingDetails_AgreementID = None;
            f_FinancingDetails_DeliveryType = None;
            f_FinancingDetails_EndDate = None;
            f_FinancingDetails_MarginRatio = None;
            f_FinancingDetails_StartDate = None;
            f_FinancingDetails_TerminationType = None
        };
        f_ExecutionReport_UndInstrmtGrp = {
            f_UndInstrmtGrp_NoUnderlyings = None;
            f_UndInstrmtGrp_UnderlyingInstrument = {
                f_UnderlyingInstrument_EncodedUnderlyingIssuer = None;
                f_UnderlyingInstrument_EncodedUnderlyingIssuerLen = None;
                f_UnderlyingInstrument_EncodedUnderlyingSecurityDesc = None;
                f_UnderlyingInstrument_EncodedUnderlyingSecurityDescLen = None;
                f_UnderlyingInstrument_UnderlyingCFICode = None;
                f_UnderlyingInstrument_UnderlyingCPProgram = None;
                f_UnderlyingInstrument_UnderlyingCPRegType = None;
                f_UnderlyingInstrument_UnderlyingContractMultiplier = None;
                f_UnderlyingInstrument_UnderlyingCountryOfIssue = None;
                f_UnderlyingInstrument_UnderlyingCouponPaymentDate = None;
                f_UnderlyingInstrument_UnderlyingCouponRate = None;
                f_UnderlyingInstrument_UnderlyingCreditRating = None;
                f_UnderlyingInstrument_UnderlyingCurrency = None;
                f_UnderlyingInstrument_UnderlyingCurrentValue = None;
                f_UnderlyingInstrument_UnderlyingDirtyPrice = None;
                f_UnderlyingInstrument_UnderlyingEndPrice = None;
                f_UnderlyingInstrument_UnderlyingEndValue = None;
                f_UnderlyingInstrument_UnderlyingFactor = None;
                f_UnderlyingInstrument_UnderlyingInstrRegistry = None;
                f_UnderlyingInstrument_UnderlyingIssueDate = None;
                f_UnderlyingInstrument_UnderlyingIssuer = None;
                f_UnderlyingInstrument_UnderlyingLocaleOfIssue = None;
                f_UnderlyingInstrument_UnderlyingMaturityDate = None;
                f_UnderlyingInstrument_UnderlyingMaturityMonthYear = None;
                f_UnderlyingInstrument_UnderlyingOptAttribute = None;
                f_UnderlyingInstrument_UnderlyingProduct = None;
                f_UnderlyingInstrument_UnderlyingPutOrCall = None;
                f_UnderlyingInstrument_UnderlyingPx = None;
                f_UnderlyingInstrument_UnderlyingQty = None;
                f_UnderlyingInstrument_UnderlyingRedemptionDate = None;
                f_UnderlyingInstrument_UnderlyingRepoCollateralSecurityType = None;
                f_UnderlyingInstrument_UnderlyingRepurchaseRate = None;
                f_UnderlyingInstrument_UnderlyingRepurchaseTerm = None;
                f_UnderlyingInstrument_UnderlyingSecurityDesc = None;
                f_UnderlyingInstrument_UnderlyingSecurityExchange = None;
                f_UnderlyingInstrument_UnderlyingSecurityID = None;
                f_UnderlyingInstrument_UnderlyingSecurityIDSource = None;
                f_UnderlyingInstrument_UnderlyingSecuritySubType = None;
                f_UnderlyingInstrument_UnderlyingSecurityType = None;
                f_UnderlyingInstrument_UnderlyingStartValue = None;
                f_UnderlyingInstrument_UnderlyingStateOrProvinceOfIssue = None;
                f_UnderlyingInstrument_UnderlyingStrikeCurrency = None;
                f_UnderlyingInstrument_UnderlyingStrikePrice = None;
                f_UnderlyingInstrument_UnderlyingSymbol = None;
                f_UnderlyingInstrument_UnderlyingSymbolSfx = None;
                f_UnderlyingInstrument_UndSecAltIDGrp = {
                    f_UndSecAltIDGrp_NoUnderlyingSecurityAltID = None;
                    f_UndSecAltIDGrp_UnderlyingSecurityAltID = None;
                    f_UndSecAltIDGrp_UnderlyingSecurityAltIDSource = None
                };
                f_UnderlyingInstrument_UnderlyingStipulations = {
                    f_UnderlyingStipulations_NoUnderlyingStips = None;
                    f_UnderlyingStipulations_UnderlyingStipType = None;
                    f_UnderlyingStipulations_UnderlyingStipValue = None
                }
            }
        };
        f_ExecutionReport_Side = convert__model_to_full_Side msg.f_ExecutionReport_Side;
        f_ExecutionReport_Stipulations = {
            f_Stipulations_NoStipulations = None;
            f_Stipulations_StipulationType = None;
            f_Stipulations_StipulationValue = None
        };
        f_ExecutionReport_QtyType = None;
        f_ExecutionReport_OrderQtyData = {
            f_OrderQtyData_CashOrderQty = None;
            f_OrderQtyData_OrderPercent = None;
            f_OrderQtyData_OrderQty = None;
            f_OrderQtyData_RoundingDirection = None;
            f_OrderQtyData_RoundingModulus = None
        };
        f_ExecutionReport_OrdType = None;
        f_ExecutionReport_PriceType = None;
        f_ExecutionReport_Price = None;
        f_ExecutionReport_StopPx = None;
        f_ExecutionReport_PegInstructions = {
            f_PegInstructions_PegLimitType = None;
            f_PegInstructions_PegMoveType = None;
            f_PegInstructions_PegOffsetType = None;
            f_PegInstructions_PegOffsetValue = None;
            f_PegInstructions_PegRoundDirection = None;
            f_PegInstructions_PegScope = None
        };
        f_ExecutionReport_DiscretionInstructions = {
            f_DiscretionInstructions_DiscretionInst = None;
            f_DiscretionInstructions_DiscretionLimitType = None;
            f_DiscretionInstructions_DiscretionMoveType = None;
            f_DiscretionInstructions_DiscretionOffsetType = None;
            f_DiscretionInstructions_DiscretionOffsetValue = None;
            f_DiscretionInstructions_DiscretionRoundDirection = None;
            f_DiscretionInstructions_DiscretionScope = None
        };
        f_ExecutionReport_PeggedPrice = None;
        f_ExecutionReport_DiscretionPrice = None;
        f_ExecutionReport_TargetStrategy = None;
        f_ExecutionReport_TargetStrategyParameters = None;
        f_ExecutionReport_ParticipationRate = None;
        f_ExecutionReport_TargetStrategyPerformance = None;
        f_ExecutionReport_Currency = None;
        f_ExecutionReport_ComplianceID = None;
        f_ExecutionReport_SolicitedFlag = None;
        f_ExecutionReport_TimeInForce = None;
        f_ExecutionReport_EffectiveTime = None;
        f_ExecutionReport_ExpireDate = None;
        f_ExecutionReport_ExpireTime = None;
        f_ExecutionReport_ExecInst = None;
        f_ExecutionReport_OrderCapacity = None;
        f_ExecutionReport_OrderRestrictions = None;
        f_ExecutionReport_CustOrderCapacity = None;
        f_ExecutionReport_LastQty = None;
        f_ExecutionReport_UnderlyingLastQty = None;
        f_ExecutionReport_LastPx = None;
        f_ExecutionReport_UnderlyingLastPx = None;
        f_ExecutionReport_LastParPx = None;
        f_ExecutionReport_LastSpotRate = None;
        f_ExecutionReport_LastForwardPoints = None;
        f_ExecutionReport_LastMkt = None;
        f_ExecutionReport_TradingSessionID = None;
        f_ExecutionReport_TradingSessionSubID = None;
        f_ExecutionReport_TimeBracket = None;
        f_ExecutionReport_LastCapacity = None;
        f_ExecutionReport_LeavesQty = msg.f_ExecutionReport_LeavesQty;
        f_ExecutionReport_CumQty = msg.f_ExecutionReport_CumQty;
        f_ExecutionReport_AvgPx = msg.f_ExecutionReport_AvgPx;
        f_ExecutionReport_DayOrderQty = None;
        f_ExecutionReport_DayCumQty = None;
        f_ExecutionReport_DayAvgPx = None;
        f_ExecutionReport_GTBookingInst = None;
        f_ExecutionReport_TradeDate = None;
        f_ExecutionReport_TransactTime = None;
        f_ExecutionReport_ReportToExch = None;
        f_ExecutionReport_CommissionData = {
            f_CommissionData_CommCurrency = None;
            f_CommissionData_CommType = None;
            f_CommissionData_Commission = None;
            f_CommissionData_FundRenewWaiv = None
        };
        f_ExecutionReport_SpreadOrBenchmarkCurveData = {
            f_SpreadOrBenchmarkCurveData_BenchmarkCurveCurrency = None;
            f_SpreadOrBenchmarkCurveData_BenchmarkCurveName = None;
            f_SpreadOrBenchmarkCurveData_BenchmarkCurvePoint = None;
            f_SpreadOrBenchmarkCurveData_BenchmarkPrice = None;
            f_SpreadOrBenchmarkCurveData_BenchmarkPriceType = None;
            f_SpreadOrBenchmarkCurveData_BenchmarkSecurityID = None;
            f_SpreadOrBenchmarkCurveData_BenchmarkSecurityIDSource = None;
            f_SpreadOrBenchmarkCurveData_Spread = None
        };
        f_ExecutionReport_YieldData = {
            f_YieldData_Yield = None;
            f_YieldData_YieldCalcDate = None;
            f_YieldData_YieldRedemptionDate = None;
            f_YieldData_YieldRedemptionPrice = None;
            f_YieldData_YieldRedemptionPriceType = None;
            f_YieldData_YieldType = None
        };
        f_ExecutionReport_GrossTradeAmt = None;
        f_ExecutionReport_NumDaysInterest = None;
        f_ExecutionReport_ExDate = None;
        f_ExecutionReport_AccruedInterestRate = None;
        f_ExecutionReport_AccruedInterestAmt = None;
        f_ExecutionReport_InterestAtMaturity = None;
        f_ExecutionReport_EndAccruedInterestAmt = None;
        f_ExecutionReport_StartCash = None;
        f_ExecutionReport_EndCash = None;
        f_ExecutionReport_TradedFlatSwitch = None;
        f_ExecutionReport_BasisFeatureDate = None;
        f_ExecutionReport_BasisFeaturePrice = None;
        f_ExecutionReport_Concession = None;
        f_ExecutionReport_TotalTakedown = None;
        f_ExecutionReport_NetMoney = None;
        f_ExecutionReport_SettlCurrAmt = None;
        f_ExecutionReport_SettlCurrency = None;
        f_ExecutionReport_SettlCurrFxRate = None;
        f_ExecutionReport_SettlCurrFxRateCalc = None;
        f_ExecutionReport_HandlInst = None;
        f_ExecutionReport_MinQty = None;
        f_ExecutionReport_MaxFloor = None;
        f_ExecutionReport_PositionEffect = None;
        f_ExecutionReport_MaxShow = None;
        f_ExecutionReport_BookingType = None;
        f_ExecutionReport_Text = msg.f_ExecutionReport_Text;
        f_ExecutionReport_EncodedTextLen = None;
        f_ExecutionReport_EncodedText = None;
        f_ExecutionReport_SettlDate2 = None;
        f_ExecutionReport_OrderQty2 = None;
        f_ExecutionReport_LastForwardPoints2 = None;
        f_ExecutionReport_MultiLegReportingType = None;
        f_ExecutionReport_CancellationRights = None;
        f_ExecutionReport_MoneyLaunderingStatus = None;
        f_ExecutionReport_RegistID = None;
        f_ExecutionReport_Designation = None;
        f_ExecutionReport_TransBkdTime = None;
        f_ExecutionReport_ExecValuationPoint = None;
        f_ExecutionReport_ExecPriceType = None;
        f_ExecutionReport_ExecPriceAdjustment = None;
        f_ExecutionReport_PriorityIndicator = None;
        f_ExecutionReport_PriceImprovement = None;
        f_ExecutionReport_LastLiquidityInd = None;
        f_ExecutionReport_ContAmtGrp = {
            f_ContAmtGrp_ContAmtCurr = None;
            f_ContAmtGrp_ContAmtType = None;
            f_ContAmtGrp_ContAmtValue = None;
            f_ContAmtGrp_NoContAmts = None
        };
        f_ExecutionReport_InstrmtLegExecGrp = {
            f_InstrmtLegExecGrp_LegCoveredOrUncovered = None;
            f_InstrmtLegExecGrp_LegLastPx = None;
            f_InstrmtLegExecGrp_LegPositionEffect = None;
            f_InstrmtLegExecGrp_LegPrice = None;
            f_InstrmtLegExecGrp_LegQty = None;
            f_InstrmtLegExecGrp_LegRefID = None;
            f_InstrmtLegExecGrp_LegSettlDate = None;
            f_InstrmtLegExecGrp_LegSettlType = None;
            f_InstrmtLegExecGrp_LegSwapType = None;
            f_InstrmtLegExecGrp_NoLegs = None;
            f_InstrmtLegExecGrp_InstrumentLeg = {
                f_InstrumentLeg_EncodedLegIssuer = None;
                f_InstrumentLeg_EncodedLegIssuerLen = None;
                f_InstrumentLeg_EncodedLegSecurityDesc = None;
                f_InstrumentLeg_EncodedLegSecurityDescLen = None;
                f_InstrumentLeg_LegCFICode = None;
                f_InstrumentLeg_LegContractMultiplier = None;
                f_InstrumentLeg_LegContractSettlMonth = None;
                f_InstrumentLeg_LegCountryOfIssue = None;
                f_InstrumentLeg_LegCouponPaymentDate = None;
                f_InstrumentLeg_LegCouponRate = None;
                f_InstrumentLeg_LegCreditRating = None;
                f_InstrumentLeg_LegCurrency = None;
                f_InstrumentLeg_LegDatedDate = None;
                f_InstrumentLeg_LegFactor = None;
                f_InstrumentLeg_LegInstrRegistry = None;
                f_InstrumentLeg_LegInterestAccrualDate = None;
                f_InstrumentLeg_LegIssueDate = None;
                f_InstrumentLeg_LegIssuer = None;
                f_InstrumentLeg_LegLocaleOfIssue = None;
                f_InstrumentLeg_LegMaturityDate = None;
                f_InstrumentLeg_LegMaturityMonthYear = None;
                f_InstrumentLeg_LegOptAttribute = None;
                f_InstrumentLeg_LegPool = None;
                f_InstrumentLeg_LegProduct = None;
                f_InstrumentLeg_LegRatioQty = None;
                f_InstrumentLeg_LegRedemptionDate = None;
                f_InstrumentLeg_LegRepoCollateralSecurityType = None;
                f_InstrumentLeg_LegRepurchaseRate = None;
                f_InstrumentLeg_LegRepurchaseTerm = None;
                f_InstrumentLeg_LegSecurityDesc = None;
                f_InstrumentLeg_LegSecurityExchange = None;
                f_InstrumentLeg_LegSecurityID = None;
                f_InstrumentLeg_LegSecurityIDSource = None;
                f_InstrumentLeg_LegSecuritySubType = None;
                f_InstrumentLeg_LegSecurityType = None;
                f_InstrumentLeg_LegSide = None;
                f_InstrumentLeg_LegStateOrProvinceOfIssue = None;
                f_InstrumentLeg_LegStrikeCurrency = None;
                f_InstrumentLeg_LegStrikePrice = None;
                f_InstrumentLeg_LegSymbol = None;
                f_InstrumentLeg_LegSymbolSfx = None;
                f_InstrumentLeg_LegSecAltIDGrp = {
                    f_LegSecAltIDGrp_LegSecurityAltID = None;
                    f_LegSecAltIDGrp_LegSecurityAltIDSource = None;
                    f_LegSecAltIDGrp_NoLegSecurityAltID = None
                }
            };
            f_InstrmtLegExecGrp_LegStipulations = {
                f_LegStipulations_LegStipulationType = None;
                f_LegStipulations_LegStipulationValue = None;
                f_LegStipulations_NoLegStipulations = None
            };
            f_InstrmtLegExecGrp_NestedParties = {
                f_NestedParties_NestedPartyID = None;
                f_NestedParties_NestedPartyIDSource = None;
                f_NestedParties_NestedPartyRole = None;
                f_NestedParties_NoNestedPartyIDs = None;
                f_NestedParties_NstdPtysSubGrp = {
                    f_NstdPtysSubGrp_NestedPartySubID = None;
                    f_NstdPtysSubGrp_NestedPartySubIDType = None;
                    f_NstdPtysSubGrp_NoNestedPartySubIDs = None
                }
            }
        };
        f_ExecutionReport_CopyMsgIndicator = None;
        f_ExecutionReport_MiscFeesGrp = {
            f_MiscFeesGrp_MiscFeeAmt = None;
            f_MiscFeesGrp_MiscFeeBasis = None;
            f_MiscFeesGrp_MiscFeeCurr = None;
            f_MiscFeesGrp_MiscFeeType = None;
            f_MiscFeesGrp_NoMiscFees = None
        }
    }
;;

let convert_FIX_Msg_NewOrderSingle ( msg : mod_newordersingle_data ) =
    FIX_Full_Msg_NewOrderSingle {
        f_NewOrderSingle_ClOrdID = msg.f_NewOrderSingle_ClOrdID;
        f_NewOrderSingle_SecondaryClOrdID = None;
        f_NewOrderSingle_ClOrdLinkID = None;
        f_NewOrderSingle_Parties = {
            f_Parties_NoPartyIDs = None;
            f_Parties_PartyID = None;
            f_Parties_PartyIDSource = None;
            f_Parties_PartyRole = None;
            f_Parties_PtysSubGrp = {
                f_PtysSubGrp_NoPartySubIDs = None;
                f_PtysSubGrp_PartySubID = None;
                f_PtysSubGrp_PartySubIDType = None
            }
        };
        f_NewOrderSingle_TradeOriginationDate = None;
        f_NewOrderSingle_TradeDate = None;
        f_NewOrderSingle_Account = None;
        f_NewOrderSingle_AcctIDSource = None;
        f_NewOrderSingle_AccountType = None;
        f_NewOrderSingle_DayBookingInst = None;
        f_NewOrderSingle_BookingUnit = None;
        f_NewOrderSingle_PreallocMethod = None;
        f_NewOrderSingle_AllocID = None;
        f_NewOrderSingle_PreAllocGrp = {
            f_PreAllocGrp_AllocAccount = None;
            f_PreAllocGrp_AllocAcctIDSource = None;
            f_PreAllocGrp_AllocQty = None;
            f_PreAllocGrp_AllocSettlCurrency = None;
            f_PreAllocGrp_IndividualAllocID = None;
            f_PreAllocGrp_NoAllocs = None;
            f_PreAllocGrp_NestedParties = {
                f_NestedParties_NestedPartyID = None;
                f_NestedParties_NestedPartyIDSource = None;
                f_NestedParties_NestedPartyRole = None;
                f_NestedParties_NoNestedPartyIDs = None;
                f_NestedParties_NstdPtysSubGrp = {
                    f_NstdPtysSubGrp_NestedPartySubID = None;
                    f_NstdPtysSubGrp_NestedPartySubIDType = None;
                    f_NstdPtysSubGrp_NoNestedPartySubIDs = None
                }
            }
        };
        f_NewOrderSingle_SettlType = None;
        f_NewOrderSingle_SettlDate = None;
        f_NewOrderSingle_CashMargin = None;
        f_NewOrderSingle_ClearingFeeIndicator = None;
        f_NewOrderSingle_HandlInst = None;
        f_NewOrderSingle_ExecInst = None;
        f_NewOrderSingle_MinQty = None;
        f_NewOrderSingle_MaxFloor = None;
        f_NewOrderSingle_ExDestination = None;
        f_NewOrderSingle_TrdgSesGrp = {
            f_TrdgSesGrp_NoTradingSessions = None;
            f_TrdgSesGrp_TradingSessionID = None;
            f_TrdgSesGrp_TradingSessionSubID = None
        };
        f_NewOrderSingle_ProcessCode = None;
        f_NewOrderSingle_Instrument = {
            f_Instrument_Symbol = Some msg.f_NewOrderSingle_Instrument_Symbol;
            f_Instrument_CFICode = None;
            f_Instrument_CPProgram = None;
            f_Instrument_CPRegType = None;
            f_Instrument_ContractMultiplier = None;
            f_Instrument_ContractSettlMonth = None;
            f_Instrument_CountryOfIssue = None;
            f_Instrument_CouponPaymentDate = None;
            f_Instrument_CouponRate = None;
            f_Instrument_CreditRating = None;
            f_Instrument_DatedDate = None;
            f_Instrument_EncodedIssuer = None;
            f_Instrument_EncodedIssuerLen = None;
            f_Instrument_EncodedSecurityDesc = None;
            f_Instrument_EncodedSecurityDescLen = None;
            f_Instrument_Factor = None;
            f_Instrument_InstrRegistry = None;
            f_Instrument_InterestAccrualDate = None;
            f_Instrument_IssueDate = None;
            f_Instrument_Issuer = None;
            f_Instrument_LocaleOfIssue = None;
            f_Instrument_MaturityDate = None;
            f_Instrument_MaturityMonthYear = None;
            f_Instrument_OptAttribute = None;
            f_Instrument_Pool = None;
            f_Instrument_Product = None;
            f_Instrument_PutOrCall = None;
            f_Instrument_RedemptionDate = None;
            f_Instrument_RepoCollateralSecurityType = None;
            f_Instrument_RepurchaseRate = None;
            f_Instrument_RepurchaseTerm = None;
            f_Instrument_SecurityDesc = None;
            f_Instrument_SecurityExchange = None;
            f_Instrument_SecurityID = None;
            f_Instrument_SecurityIDSource = None;
            f_Instrument_SecuritySubType = None;
            f_Instrument_SecurityType = None;
            f_Instrument_StateOrProvinceOfIssue = None;
            f_Instrument_StrikeCurrency = None;
            f_Instrument_StrikePrice = None;
            f_Instrument_SymbolSfx = None;
            f_Instrument_EvntGrp = {
                f_EvntGrp_EventDate = None;
                f_EvntGrp_EventPx = None;
                f_EvntGrp_EventText = None;
                f_EvntGrp_EventType = None;
                f_EvntGrp_NoEvents = None
            };
            f_Instrument_SecAltIDGrp = {
                f_SecAltIDGrp_NoSecurityAltID = None;
                f_SecAltIDGrp_SecurityAltID = None;
                f_SecAltIDGrp_SecurityAltIDSource = None
            }
        };
        f_NewOrderSingle_FinancingDetails = {
            f_FinancingDetails_AgreementCurrency = None;
            f_FinancingDetails_AgreementDate = None;
            f_FinancingDetails_AgreementDesc = None;
            f_FinancingDetails_AgreementID = None;
            f_FinancingDetails_DeliveryType = None;
            f_FinancingDetails_EndDate = None;
            f_FinancingDetails_MarginRatio = None;
            f_FinancingDetails_StartDate = None;
            f_FinancingDetails_TerminationType = None
        };
        f_NewOrderSingle_UndInstrmtGrp = {
            f_UndInstrmtGrp_NoUnderlyings = None;
            f_UndInstrmtGrp_UnderlyingInstrument = {
                f_UnderlyingInstrument_EncodedUnderlyingIssuer = None;
                f_UnderlyingInstrument_EncodedUnderlyingIssuerLen = None;
                f_UnderlyingInstrument_EncodedUnderlyingSecurityDesc = None;
                f_UnderlyingInstrument_EncodedUnderlyingSecurityDescLen = None;
                f_UnderlyingInstrument_UnderlyingCFICode = None;
                f_UnderlyingInstrument_UnderlyingCPProgram = None;
                f_UnderlyingInstrument_UnderlyingCPRegType = None;
                f_UnderlyingInstrument_UnderlyingContractMultiplier = None;
                f_UnderlyingInstrument_UnderlyingCountryOfIssue = None;
                f_UnderlyingInstrument_UnderlyingCouponPaymentDate = None;
                f_UnderlyingInstrument_UnderlyingCouponRate = None;
                f_UnderlyingInstrument_UnderlyingCreditRating = None;
                f_UnderlyingInstrument_UnderlyingCurrency = None;
                f_UnderlyingInstrument_UnderlyingCurrentValue = None;
                f_UnderlyingInstrument_UnderlyingDirtyPrice = None;
                f_UnderlyingInstrument_UnderlyingEndPrice = None;
                f_UnderlyingInstrument_UnderlyingEndValue = None;
                f_UnderlyingInstrument_UnderlyingFactor = None;
                f_UnderlyingInstrument_UnderlyingInstrRegistry = None;
                f_UnderlyingInstrument_UnderlyingIssueDate = None;
                f_UnderlyingInstrument_UnderlyingIssuer = None;
                f_UnderlyingInstrument_UnderlyingLocaleOfIssue = None;
                f_UnderlyingInstrument_UnderlyingMaturityDate = None;
                f_UnderlyingInstrument_UnderlyingMaturityMonthYear = None;
                f_UnderlyingInstrument_UnderlyingOptAttribute = None;
                f_UnderlyingInstrument_UnderlyingProduct = None;
                f_UnderlyingInstrument_UnderlyingPutOrCall = None;
                f_UnderlyingInstrument_UnderlyingPx = None;
                f_UnderlyingInstrument_UnderlyingQty = None;
                f_UnderlyingInstrument_UnderlyingRedemptionDate = None;
                f_UnderlyingInstrument_UnderlyingRepoCollateralSecurityType = None;
                f_UnderlyingInstrument_UnderlyingRepurchaseRate = None;
                f_UnderlyingInstrument_UnderlyingRepurchaseTerm = None;
                f_UnderlyingInstrument_UnderlyingSecurityDesc = None;
                f_UnderlyingInstrument_UnderlyingSecurityExchange = None;
                f_UnderlyingInstrument_UnderlyingSecurityID = None;
                f_UnderlyingInstrument_UnderlyingSecurityIDSource = None;
                f_UnderlyingInstrument_UnderlyingSecuritySubType = None;
                f_UnderlyingInstrument_UnderlyingSecurityType = None;
                f_UnderlyingInstrument_UnderlyingStartValue = None;
                f_UnderlyingInstrument_UnderlyingStateOrProvinceOfIssue = None;
                f_UnderlyingInstrument_UnderlyingStrikeCurrency = None;
                f_UnderlyingInstrument_UnderlyingStrikePrice = None;
                f_UnderlyingInstrument_UnderlyingSymbol = None;
                f_UnderlyingInstrument_UnderlyingSymbolSfx = None;
                f_UnderlyingInstrument_UndSecAltIDGrp = {
                    f_UndSecAltIDGrp_NoUnderlyingSecurityAltID = None;
                    f_UndSecAltIDGrp_UnderlyingSecurityAltID = None;
                    f_UndSecAltIDGrp_UnderlyingSecurityAltIDSource = None
                };
                f_UnderlyingInstrument_UnderlyingStipulations = {
                    f_UnderlyingStipulations_NoUnderlyingStips = None;
                    f_UnderlyingStipulations_UnderlyingStipType = None;
                    f_UnderlyingStipulations_UnderlyingStipValue = None
                }
            }
        };
        f_NewOrderSingle_PrevClosePx = None;
        f_NewOrderSingle_Side = convert__model_to_full_Side msg.f_NewOrderSingle_Side;
        f_NewOrderSingle_LocateReqd = None;
        f_NewOrderSingle_TransactTime = msg.f_NewOrderSingle_TransactTime;
        f_NewOrderSingle_Stipulations = {
            f_Stipulations_NoStipulations = None;
            f_Stipulations_StipulationType = None;
            f_Stipulations_StipulationValue = None
        };
        f_NewOrderSingle_QtyType = None;
        f_NewOrderSingle_OrderQtyData = {
            f_OrderQtyData_CashOrderQty = None;
            f_OrderQtyData_OrderPercent = None;
            f_OrderQtyData_OrderQty = None;
            f_OrderQtyData_RoundingDirection = None;
            f_OrderQtyData_RoundingModulus = None
        };
        f_NewOrderSingle_OrdType = convert__model_to_full_OrdType msg.f_NewOrderSingle_OrdType;
        f_NewOrderSingle_PriceType = None;
        f_NewOrderSingle_Price = None;
        f_NewOrderSingle_StopPx = None;
        f_NewOrderSingle_SpreadOrBenchmarkCurveData = {
            f_SpreadOrBenchmarkCurveData_BenchmarkCurveCurrency = None;
            f_SpreadOrBenchmarkCurveData_BenchmarkCurveName = None;
            f_SpreadOrBenchmarkCurveData_BenchmarkCurvePoint = None;
            f_SpreadOrBenchmarkCurveData_BenchmarkPrice = None;
            f_SpreadOrBenchmarkCurveData_BenchmarkPriceType = None;
            f_SpreadOrBenchmarkCurveData_BenchmarkSecurityID = None;
            f_SpreadOrBenchmarkCurveData_BenchmarkSecurityIDSource = None;
            f_SpreadOrBenchmarkCurveData_Spread = None
        };
        f_NewOrderSingle_YieldData = {
            f_YieldData_Yield = None;
            f_YieldData_YieldCalcDate = None;
            f_YieldData_YieldRedemptionDate = None;
            f_YieldData_YieldRedemptionPrice = None;
            f_YieldData_YieldRedemptionPriceType = None;
            f_YieldData_YieldType = None
        };
        f_NewOrderSingle_Currency = None;
        f_NewOrderSingle_ComplianceID = None;
        f_NewOrderSingle_SolicitedFlag = None;
        f_NewOrderSingle_IOIID = None;
        f_NewOrderSingle_QuoteID = None;
        f_NewOrderSingle_TimeInForce = None;
        f_NewOrderSingle_EffectiveTime = None;
        f_NewOrderSingle_ExpireDate = None;
        f_NewOrderSingle_ExpireTime = None;
        f_NewOrderSingle_GTBookingInst = None;
        f_NewOrderSingle_CommissionData = {
            f_CommissionData_CommCurrency = None;
            f_CommissionData_CommType = None;
            f_CommissionData_Commission = None;
            f_CommissionData_FundRenewWaiv = None
        };
        f_NewOrderSingle_OrderCapacity = None;
        f_NewOrderSingle_OrderRestrictions = None;
        f_NewOrderSingle_CustOrderCapacity = None;
        f_NewOrderSingle_ForexReq = None;
        f_NewOrderSingle_SettlCurrency = None;
        f_NewOrderSingle_BookingType = None;
        f_NewOrderSingle_Text = None;
        f_NewOrderSingle_EncodedTextLen = None;
        f_NewOrderSingle_EncodedText = None;
        f_NewOrderSingle_SettlDate2 = None;
        f_NewOrderSingle_OrderQty2 = None;
        f_NewOrderSingle_Price2 = None;
        f_NewOrderSingle_PositionEffect = None;
        f_NewOrderSingle_CoveredOrUncovered = None;
        f_NewOrderSingle_MaxShow = None;
        f_NewOrderSingle_PegInstructions = {
            f_PegInstructions_PegLimitType = None;
            f_PegInstructions_PegMoveType = None;
            f_PegInstructions_PegOffsetType = None;
            f_PegInstructions_PegOffsetValue = None;
            f_PegInstructions_PegRoundDirection = None;
            f_PegInstructions_PegScope = None
        };
        f_NewOrderSingle_DiscretionInstructions = {
            f_DiscretionInstructions_DiscretionInst = None;
            f_DiscretionInstructions_DiscretionLimitType = None;
            f_DiscretionInstructions_DiscretionMoveType = None;
            f_DiscretionInstructions_DiscretionOffsetType = None;
            f_DiscretionInstructions_DiscretionOffsetValue = None;
            f_DiscretionInstructions_DiscretionRoundDirection = None;
            f_DiscretionInstructions_DiscretionScope = None
        };
        f_NewOrderSingle_TargetStrategy = None;
        f_NewOrderSingle_TargetStrategyParameters = None;
        f_NewOrderSingle_ParticipationRate = None;
        f_NewOrderSingle_CancellationRights = None;
        f_NewOrderSingle_MoneyLaunderingStatus = None;
        f_NewOrderSingle_RegistID = None;
        f_NewOrderSingle_Designation = None
    }
;;

let convert_model_to_full_fix ( msg : model_msg ) =
    (match msg with
        | FIX_Msg_ExecutionReport msg_data -> (convert_FIX_Msg_ExecutionReport msg_data)
        | FIX_Msg_NewOrderSingle msg_data -> (convert_FIX_Msg_NewOrderSingle msg_data)
    )
;;
