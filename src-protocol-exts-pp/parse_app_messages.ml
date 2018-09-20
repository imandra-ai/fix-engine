(* Aesthetic Integration copyright 2018 *)
open Full_app_messages;;
open Full_app_tags;;
open Parse_app_enums;;
open Parse_app_records;;
open Parse_base_types;;
open Parse_datetime;;
open Parser_utils.Parser;;
open TimeDefaults_parser;;


let parse_ExecutionReport (msg)  =
    (repeating msg "453" parse_Parties (fun msg f_ExecutionReport_Parties -> repeating msg "382" parse_ContraGrp (fun msg f_ExecutionReport_ContraGrp -> repeating msg "711" parse_UndInstrmtGrp (fun msg f_ExecutionReport_UndInstrmtGrp -> repeating msg "232" parse_Stipulations (fun msg f_ExecutionReport_Stipulations -> repeating msg "518" parse_ContAmtGrp (fun msg f_ExecutionReport_ContAmtGrp -> repeating msg "555" parse_InstrmtLegExecGrp (fun msg f_ExecutionReport_InstrmtLegExecGrp -> repeating msg "136" parse_MiscFeesGrp (fun msg f_ExecutionReport_MiscFeesGrp -> check_duplicate_tags msg (fun () -> block msg parse_Instrument (fun msg f_ExecutionReport_Instrument -> block msg parse_FinancingDetails (fun msg f_ExecutionReport_FinancingDetails -> block msg parse_OrderQtyData (fun msg f_ExecutionReport_OrderQtyData -> block msg parse_PegInstructions (fun msg f_ExecutionReport_PegInstructions -> block msg parse_DiscretionInstructions (fun msg f_ExecutionReport_DiscretionInstructions -> block msg parse_CommissionData (fun msg f_ExecutionReport_CommissionData -> block msg parse_SpreadOrBenchmarkCurveData (fun msg f_ExecutionReport_SpreadOrBenchmarkCurveData -> block msg parse_YieldData (fun msg f_ExecutionReport_YieldData -> opt msg "37" parse_string (fun msg f_ExecutionReport_OrderID -> opt msg "198" parse_string (fun msg f_ExecutionReport_SecondaryOrderID -> opt msg "526" parse_string (fun msg f_ExecutionReport_SecondaryClOrdID -> opt msg "527" parse_string (fun msg f_ExecutionReport_SecondaryExecID -> opt msg "11" parse_string (fun msg f_ExecutionReport_ClOrdID -> opt msg "41" parse_string (fun msg f_ExecutionReport_OrigClOrdID -> opt msg "583" parse_string (fun msg f_ExecutionReport_ClOrdLinkID -> opt msg "693" parse_string (fun msg f_ExecutionReport_QuoteRespID -> opt msg "790" parse_string (fun msg f_ExecutionReport_OrdStatusReqID -> opt msg "584" parse_string (fun msg f_ExecutionReport_MassStatusReqID -> opt msg "911" parse_int (fun msg f_ExecutionReport_TotNumReports -> opt msg "912" parse_bool (fun msg f_ExecutionReport_LastRptRequested -> opt msg "229" parse_LocalMktDate (fun msg f_ExecutionReport_TradeOriginationDate -> opt msg "66" parse_string (fun msg f_ExecutionReport_ListID -> opt msg "548" parse_string (fun msg f_ExecutionReport_CrossID -> opt msg "551" parse_string (fun msg f_ExecutionReport_OrigCrossID -> opt msg "549" parse_CrossType (fun msg f_ExecutionReport_CrossType -> opt msg "17" parse_string (fun msg f_ExecutionReport_ExecID -> opt msg "19" parse_string (fun msg f_ExecutionReport_ExecRefID -> opt msg "150" parse_ExecType (fun msg f_ExecutionReport_ExecType -> opt msg "39" parse_OrdStatus (fun msg f_ExecutionReport_OrdStatus -> opt msg "636" parse_WorkingIndicator (fun msg f_ExecutionReport_WorkingIndicator -> opt msg "103" parse_OrdRejReason (fun msg f_ExecutionReport_OrdRejReason -> opt msg "378" parse_ExecRestatementReason (fun msg f_ExecutionReport_ExecRestatementReason -> opt msg "1" parse_string (fun msg f_ExecutionReport_Account -> opt msg "660" parse_AcctIDSource (fun msg f_ExecutionReport_AcctIDSource -> opt msg "581" parse_AccountType (fun msg f_ExecutionReport_AccountType -> opt msg "589" parse_DayBookingInst (fun msg f_ExecutionReport_DayBookingInst -> opt msg "590" parse_BookingUnit (fun msg f_ExecutionReport_BookingUnit -> opt msg "591" parse_PreallocMethod (fun msg f_ExecutionReport_PreallocMethod -> opt msg "63" parse_SettlType (fun msg f_ExecutionReport_SettlType -> opt msg "64" parse_LocalMktDate (fun msg f_ExecutionReport_SettlDate -> opt msg "544" parse_CashMargin (fun msg f_ExecutionReport_CashMargin -> opt msg "635" parse_ClearingFeeIndicator (fun msg f_ExecutionReport_ClearingFeeIndicator -> opt msg "54" parse_Side (fun msg f_ExecutionReport_Side -> opt msg "854" parse_QtyType (fun msg f_ExecutionReport_QtyType -> opt msg "40" parse_OrdType (fun msg f_ExecutionReport_OrdType -> opt msg "423" parse_PriceType (fun msg f_ExecutionReport_PriceType -> opt msg "44" parse_float (fun msg f_ExecutionReport_Price -> opt msg "99" parse_float (fun msg f_ExecutionReport_StopPx -> opt msg "839" parse_float (fun msg f_ExecutionReport_PeggedPrice -> opt msg "845" parse_float (fun msg f_ExecutionReport_DiscretionPrice -> opt msg "847" parse_TargetStrategy (fun msg f_ExecutionReport_TargetStrategy -> opt msg "848" parse_string (fun msg f_ExecutionReport_TargetStrategyParameters -> opt msg "849" parse_float (fun msg f_ExecutionReport_ParticipationRate -> opt msg "850" parse_float (fun msg f_ExecutionReport_TargetStrategyPerformance -> opt msg "15" parse_Currency (fun msg f_ExecutionReport_Currency -> opt msg "376" parse_string (fun msg f_ExecutionReport_ComplianceID -> opt msg "377" parse_SolicitedFlag (fun msg f_ExecutionReport_SolicitedFlag -> opt msg "59" parse_TimeInForce (fun msg f_ExecutionReport_TimeInForce -> opt msg "168" parse_UTCTimestamp (fun msg f_ExecutionReport_EffectiveTime -> opt msg "432" parse_LocalMktDate (fun msg f_ExecutionReport_ExpireDate -> opt msg "126" parse_UTCTimestamp (fun msg f_ExecutionReport_ExpireTime -> opt msg "18" parse_ExecInst (fun msg f_ExecutionReport_ExecInst -> opt msg "528" parse_OrderCapacity (fun msg f_ExecutionReport_OrderCapacity -> opt msg "529" parse_OrderRestrictions (fun msg f_ExecutionReport_OrderRestrictions -> opt msg "582" parse_CustOrderCapacity (fun msg f_ExecutionReport_CustOrderCapacity -> opt msg "32" parse_float (fun msg f_ExecutionReport_LastQty -> opt msg "652" parse_float (fun msg f_ExecutionReport_UnderlyingLastQty -> opt msg "31" parse_float (fun msg f_ExecutionReport_LastPx -> opt msg "651" parse_float (fun msg f_ExecutionReport_UnderlyingLastPx -> opt msg "669" parse_float (fun msg f_ExecutionReport_LastParPx -> opt msg "194" parse_float (fun msg f_ExecutionReport_LastSpotRate -> opt msg "195" parse_float (fun msg f_ExecutionReport_LastForwardPoints -> opt msg "30" parse_Exchange (fun msg f_ExecutionReport_LastMkt -> opt msg "336" parse_string (fun msg f_ExecutionReport_TradingSessionID -> opt msg "625" parse_string (fun msg f_ExecutionReport_TradingSessionSubID -> opt msg "943" parse_string (fun msg f_ExecutionReport_TimeBracket -> opt msg "29" parse_LastCapacity (fun msg f_ExecutionReport_LastCapacity -> opt msg "151" parse_float (fun msg f_ExecutionReport_LeavesQty -> opt msg "14" parse_float (fun msg f_ExecutionReport_CumQty -> opt msg "6" parse_float (fun msg f_ExecutionReport_AvgPx -> opt msg "424" parse_float (fun msg f_ExecutionReport_DayOrderQty -> opt msg "425" parse_float (fun msg f_ExecutionReport_DayCumQty -> opt msg "426" parse_float (fun msg f_ExecutionReport_DayAvgPx -> opt msg "427" parse_GTBookingInst (fun msg f_ExecutionReport_GTBookingInst -> opt msg "75" parse_LocalMktDate (fun msg f_ExecutionReport_TradeDate -> opt msg "60" parse_UTCTimestamp (fun msg f_ExecutionReport_TransactTime -> opt msg "113" parse_ReportToExch (fun msg f_ExecutionReport_ReportToExch -> opt msg "381" parse_float (fun msg f_ExecutionReport_GrossTradeAmt -> opt msg "157" parse_int (fun msg f_ExecutionReport_NumDaysInterest -> opt msg "230" parse_LocalMktDate (fun msg f_ExecutionReport_ExDate -> opt msg "158" parse_float (fun msg f_ExecutionReport_AccruedInterestRate -> opt msg "159" parse_float (fun msg f_ExecutionReport_AccruedInterestAmt -> opt msg "738" parse_float (fun msg f_ExecutionReport_InterestAtMaturity -> opt msg "920" parse_float (fun msg f_ExecutionReport_EndAccruedInterestAmt -> opt msg "921" parse_float (fun msg f_ExecutionReport_StartCash -> opt msg "922" parse_float (fun msg f_ExecutionReport_EndCash -> opt msg "258" parse_TradedFlatSwitch (fun msg f_ExecutionReport_TradedFlatSwitch -> opt msg "259" parse_LocalMktDate (fun msg f_ExecutionReport_BasisFeatureDate -> opt msg "260" parse_float (fun msg f_ExecutionReport_BasisFeaturePrice -> opt msg "238" parse_float (fun msg f_ExecutionReport_Concession -> opt msg "237" parse_float (fun msg f_ExecutionReport_TotalTakedown -> opt msg "118" parse_float (fun msg f_ExecutionReport_NetMoney -> opt msg "119" parse_float (fun msg f_ExecutionReport_SettlCurrAmt -> opt msg "120" parse_Currency (fun msg f_ExecutionReport_SettlCurrency -> opt msg "155" parse_float (fun msg f_ExecutionReport_SettlCurrFxRate -> opt msg "156" parse_SettlCurrFxRateCalc (fun msg f_ExecutionReport_SettlCurrFxRateCalc -> opt msg "21" parse_HandlInst (fun msg f_ExecutionReport_HandlInst -> opt msg "110" parse_float (fun msg f_ExecutionReport_MinQty -> opt msg "111" parse_float (fun msg f_ExecutionReport_MaxFloor -> opt msg "77" parse_PositionEffect (fun msg f_ExecutionReport_PositionEffect -> opt msg "210" parse_float (fun msg f_ExecutionReport_MaxShow -> opt msg "775" parse_BookingType (fun msg f_ExecutionReport_BookingType -> opt msg "58" parse_string (fun msg f_ExecutionReport_Text -> opt msg "354" parse_int (fun msg f_ExecutionReport_EncodedTextLen -> opt msg "355" parse_string (fun msg f_ExecutionReport_EncodedText -> opt msg "193" parse_LocalMktDate (fun msg f_ExecutionReport_SettlDate2 -> opt msg "192" parse_float (fun msg f_ExecutionReport_OrderQty2 -> opt msg "641" parse_float (fun msg f_ExecutionReport_LastForwardPoints2 -> opt msg "442" parse_MultiLegReportingType (fun msg f_ExecutionReport_MultiLegReportingType -> opt msg "480" parse_CancellationRights (fun msg f_ExecutionReport_CancellationRights -> opt msg "481" parse_MoneyLaunderingStatus (fun msg f_ExecutionReport_MoneyLaunderingStatus -> opt msg "513" parse_string (fun msg f_ExecutionReport_RegistID -> opt msg "494" parse_string (fun msg f_ExecutionReport_Designation -> opt msg "483" parse_UTCTimestamp (fun msg f_ExecutionReport_TransBkdTime -> opt msg "515" parse_UTCTimestamp (fun msg f_ExecutionReport_ExecValuationPoint -> opt msg "484" parse_ExecPriceType (fun msg f_ExecutionReport_ExecPriceType -> opt msg "485" parse_float (fun msg f_ExecutionReport_ExecPriceAdjustment -> opt msg "638" parse_PriorityIndicator (fun msg f_ExecutionReport_PriorityIndicator -> opt msg "639" parse_float (fun msg f_ExecutionReport_PriceImprovement -> opt msg "851" parse_LastLiquidityInd (fun msg f_ExecutionReport_LastLiquidityInd -> opt msg "797" parse_bool (fun msg f_ExecutionReport_CopyMsgIndicator -> (ParseSuccess {
        f_ExecutionReport_Parties = f_ExecutionReport_Parties;
        f_ExecutionReport_ContraGrp = f_ExecutionReport_ContraGrp;
        f_ExecutionReport_UndInstrmtGrp = f_ExecutionReport_UndInstrmtGrp;
        f_ExecutionReport_Stipulations = f_ExecutionReport_Stipulations;
        f_ExecutionReport_ContAmtGrp = f_ExecutionReport_ContAmtGrp;
        f_ExecutionReport_InstrmtLegExecGrp = f_ExecutionReport_InstrmtLegExecGrp;
        f_ExecutionReport_MiscFeesGrp = f_ExecutionReport_MiscFeesGrp;
        f_ExecutionReport_Instrument = f_ExecutionReport_Instrument;
        f_ExecutionReport_FinancingDetails = f_ExecutionReport_FinancingDetails;
        f_ExecutionReport_OrderQtyData = f_ExecutionReport_OrderQtyData;
        f_ExecutionReport_PegInstructions = f_ExecutionReport_PegInstructions;
        f_ExecutionReport_DiscretionInstructions = f_ExecutionReport_DiscretionInstructions;
        f_ExecutionReport_CommissionData = f_ExecutionReport_CommissionData;
        f_ExecutionReport_SpreadOrBenchmarkCurveData = f_ExecutionReport_SpreadOrBenchmarkCurveData;
        f_ExecutionReport_YieldData = f_ExecutionReport_YieldData;
        f_ExecutionReport_OrderID = f_ExecutionReport_OrderID;
        f_ExecutionReport_SecondaryOrderID = f_ExecutionReport_SecondaryOrderID;
        f_ExecutionReport_SecondaryClOrdID = f_ExecutionReport_SecondaryClOrdID;
        f_ExecutionReport_SecondaryExecID = f_ExecutionReport_SecondaryExecID;
        f_ExecutionReport_ClOrdID = f_ExecutionReport_ClOrdID;
        f_ExecutionReport_OrigClOrdID = f_ExecutionReport_OrigClOrdID;
        f_ExecutionReport_ClOrdLinkID = f_ExecutionReport_ClOrdLinkID;
        f_ExecutionReport_QuoteRespID = f_ExecutionReport_QuoteRespID;
        f_ExecutionReport_OrdStatusReqID = f_ExecutionReport_OrdStatusReqID;
        f_ExecutionReport_MassStatusReqID = f_ExecutionReport_MassStatusReqID;
        f_ExecutionReport_TotNumReports = f_ExecutionReport_TotNumReports;
        f_ExecutionReport_LastRptRequested = f_ExecutionReport_LastRptRequested;
        f_ExecutionReport_TradeOriginationDate = f_ExecutionReport_TradeOriginationDate;
        f_ExecutionReport_ListID = f_ExecutionReport_ListID;
        f_ExecutionReport_CrossID = f_ExecutionReport_CrossID;
        f_ExecutionReport_OrigCrossID = f_ExecutionReport_OrigCrossID;
        f_ExecutionReport_CrossType = f_ExecutionReport_CrossType;
        f_ExecutionReport_ExecID = f_ExecutionReport_ExecID;
        f_ExecutionReport_ExecRefID = f_ExecutionReport_ExecRefID;
        f_ExecutionReport_ExecType = f_ExecutionReport_ExecType;
        f_ExecutionReport_OrdStatus = f_ExecutionReport_OrdStatus;
        f_ExecutionReport_WorkingIndicator = f_ExecutionReport_WorkingIndicator;
        f_ExecutionReport_OrdRejReason = f_ExecutionReport_OrdRejReason;
        f_ExecutionReport_ExecRestatementReason = f_ExecutionReport_ExecRestatementReason;
        f_ExecutionReport_Account = f_ExecutionReport_Account;
        f_ExecutionReport_AcctIDSource = f_ExecutionReport_AcctIDSource;
        f_ExecutionReport_AccountType = f_ExecutionReport_AccountType;
        f_ExecutionReport_DayBookingInst = f_ExecutionReport_DayBookingInst;
        f_ExecutionReport_BookingUnit = f_ExecutionReport_BookingUnit;
        f_ExecutionReport_PreallocMethod = f_ExecutionReport_PreallocMethod;
        f_ExecutionReport_SettlType = f_ExecutionReport_SettlType;
        f_ExecutionReport_SettlDate = f_ExecutionReport_SettlDate;
        f_ExecutionReport_CashMargin = f_ExecutionReport_CashMargin;
        f_ExecutionReport_ClearingFeeIndicator = f_ExecutionReport_ClearingFeeIndicator;
        f_ExecutionReport_Side = f_ExecutionReport_Side;
        f_ExecutionReport_QtyType = f_ExecutionReport_QtyType;
        f_ExecutionReport_OrdType = f_ExecutionReport_OrdType;
        f_ExecutionReport_PriceType = f_ExecutionReport_PriceType;
        f_ExecutionReport_Price = f_ExecutionReport_Price;
        f_ExecutionReport_StopPx = f_ExecutionReport_StopPx;
        f_ExecutionReport_PeggedPrice = f_ExecutionReport_PeggedPrice;
        f_ExecutionReport_DiscretionPrice = f_ExecutionReport_DiscretionPrice;
        f_ExecutionReport_TargetStrategy = f_ExecutionReport_TargetStrategy;
        f_ExecutionReport_TargetStrategyParameters = f_ExecutionReport_TargetStrategyParameters;
        f_ExecutionReport_ParticipationRate = f_ExecutionReport_ParticipationRate;
        f_ExecutionReport_TargetStrategyPerformance = f_ExecutionReport_TargetStrategyPerformance;
        f_ExecutionReport_Currency = f_ExecutionReport_Currency;
        f_ExecutionReport_ComplianceID = f_ExecutionReport_ComplianceID;
        f_ExecutionReport_SolicitedFlag = f_ExecutionReport_SolicitedFlag;
        f_ExecutionReport_TimeInForce = f_ExecutionReport_TimeInForce;
        f_ExecutionReport_EffectiveTime = f_ExecutionReport_EffectiveTime;
        f_ExecutionReport_ExpireDate = f_ExecutionReport_ExpireDate;
        f_ExecutionReport_ExpireTime = f_ExecutionReport_ExpireTime;
        f_ExecutionReport_ExecInst = f_ExecutionReport_ExecInst;
        f_ExecutionReport_OrderCapacity = f_ExecutionReport_OrderCapacity;
        f_ExecutionReport_OrderRestrictions = f_ExecutionReport_OrderRestrictions;
        f_ExecutionReport_CustOrderCapacity = f_ExecutionReport_CustOrderCapacity;
        f_ExecutionReport_LastQty = f_ExecutionReport_LastQty;
        f_ExecutionReport_UnderlyingLastQty = f_ExecutionReport_UnderlyingLastQty;
        f_ExecutionReport_LastPx = f_ExecutionReport_LastPx;
        f_ExecutionReport_UnderlyingLastPx = f_ExecutionReport_UnderlyingLastPx;
        f_ExecutionReport_LastParPx = f_ExecutionReport_LastParPx;
        f_ExecutionReport_LastSpotRate = f_ExecutionReport_LastSpotRate;
        f_ExecutionReport_LastForwardPoints = f_ExecutionReport_LastForwardPoints;
        f_ExecutionReport_LastMkt = f_ExecutionReport_LastMkt;
        f_ExecutionReport_TradingSessionID = f_ExecutionReport_TradingSessionID;
        f_ExecutionReport_TradingSessionSubID = f_ExecutionReport_TradingSessionSubID;
        f_ExecutionReport_TimeBracket = f_ExecutionReport_TimeBracket;
        f_ExecutionReport_LastCapacity = f_ExecutionReport_LastCapacity;
        f_ExecutionReport_LeavesQty = f_ExecutionReport_LeavesQty;
        f_ExecutionReport_CumQty = f_ExecutionReport_CumQty;
        f_ExecutionReport_AvgPx = f_ExecutionReport_AvgPx;
        f_ExecutionReport_DayOrderQty = f_ExecutionReport_DayOrderQty;
        f_ExecutionReport_DayCumQty = f_ExecutionReport_DayCumQty;
        f_ExecutionReport_DayAvgPx = f_ExecutionReport_DayAvgPx;
        f_ExecutionReport_GTBookingInst = f_ExecutionReport_GTBookingInst;
        f_ExecutionReport_TradeDate = f_ExecutionReport_TradeDate;
        f_ExecutionReport_TransactTime = f_ExecutionReport_TransactTime;
        f_ExecutionReport_ReportToExch = f_ExecutionReport_ReportToExch;
        f_ExecutionReport_GrossTradeAmt = f_ExecutionReport_GrossTradeAmt;
        f_ExecutionReport_NumDaysInterest = f_ExecutionReport_NumDaysInterest;
        f_ExecutionReport_ExDate = f_ExecutionReport_ExDate;
        f_ExecutionReport_AccruedInterestRate = f_ExecutionReport_AccruedInterestRate;
        f_ExecutionReport_AccruedInterestAmt = f_ExecutionReport_AccruedInterestAmt;
        f_ExecutionReport_InterestAtMaturity = f_ExecutionReport_InterestAtMaturity;
        f_ExecutionReport_EndAccruedInterestAmt = f_ExecutionReport_EndAccruedInterestAmt;
        f_ExecutionReport_StartCash = f_ExecutionReport_StartCash;
        f_ExecutionReport_EndCash = f_ExecutionReport_EndCash;
        f_ExecutionReport_TradedFlatSwitch = f_ExecutionReport_TradedFlatSwitch;
        f_ExecutionReport_BasisFeatureDate = f_ExecutionReport_BasisFeatureDate;
        f_ExecutionReport_BasisFeaturePrice = f_ExecutionReport_BasisFeaturePrice;
        f_ExecutionReport_Concession = f_ExecutionReport_Concession;
        f_ExecutionReport_TotalTakedown = f_ExecutionReport_TotalTakedown;
        f_ExecutionReport_NetMoney = f_ExecutionReport_NetMoney;
        f_ExecutionReport_SettlCurrAmt = f_ExecutionReport_SettlCurrAmt;
        f_ExecutionReport_SettlCurrency = f_ExecutionReport_SettlCurrency;
        f_ExecutionReport_SettlCurrFxRate = f_ExecutionReport_SettlCurrFxRate;
        f_ExecutionReport_SettlCurrFxRateCalc = f_ExecutionReport_SettlCurrFxRateCalc;
        f_ExecutionReport_HandlInst = f_ExecutionReport_HandlInst;
        f_ExecutionReport_MinQty = f_ExecutionReport_MinQty;
        f_ExecutionReport_MaxFloor = f_ExecutionReport_MaxFloor;
        f_ExecutionReport_PositionEffect = f_ExecutionReport_PositionEffect;
        f_ExecutionReport_MaxShow = f_ExecutionReport_MaxShow;
        f_ExecutionReport_BookingType = f_ExecutionReport_BookingType;
        f_ExecutionReport_Text = f_ExecutionReport_Text;
        f_ExecutionReport_EncodedTextLen = f_ExecutionReport_EncodedTextLen;
        f_ExecutionReport_EncodedText = f_ExecutionReport_EncodedText;
        f_ExecutionReport_SettlDate2 = f_ExecutionReport_SettlDate2;
        f_ExecutionReport_OrderQty2 = f_ExecutionReport_OrderQty2;
        f_ExecutionReport_LastForwardPoints2 = f_ExecutionReport_LastForwardPoints2;
        f_ExecutionReport_MultiLegReportingType = f_ExecutionReport_MultiLegReportingType;
        f_ExecutionReport_CancellationRights = f_ExecutionReport_CancellationRights;
        f_ExecutionReport_MoneyLaunderingStatus = f_ExecutionReport_MoneyLaunderingStatus;
        f_ExecutionReport_RegistID = f_ExecutionReport_RegistID;
        f_ExecutionReport_Designation = f_ExecutionReport_Designation;
        f_ExecutionReport_TransBkdTime = f_ExecutionReport_TransBkdTime;
        f_ExecutionReport_ExecValuationPoint = f_ExecutionReport_ExecValuationPoint;
        f_ExecutionReport_ExecPriceType = f_ExecutionReport_ExecPriceType;
        f_ExecutionReport_ExecPriceAdjustment = f_ExecutionReport_ExecPriceAdjustment;
        f_ExecutionReport_PriorityIndicator = f_ExecutionReport_PriorityIndicator;
        f_ExecutionReport_PriceImprovement = f_ExecutionReport_PriceImprovement;
        f_ExecutionReport_LastLiquidityInd = f_ExecutionReport_LastLiquidityInd;
        f_ExecutionReport_CopyMsgIndicator = f_ExecutionReport_CopyMsgIndicator
    },msg)
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )) |> check_unknown_tags
;;

let parse_NewOrderSingle (msg)  =
    (repeating msg "453" parse_Parties (fun msg f_NewOrderSingle_Parties -> repeating msg "78" parse_PreAllocGrp (fun msg f_NewOrderSingle_PreAllocGrp -> repeating msg "386" parse_TrdgSesGrp (fun msg f_NewOrderSingle_TrdgSesGrp -> repeating msg "711" parse_UndInstrmtGrp (fun msg f_NewOrderSingle_UndInstrmtGrp -> repeating msg "232" parse_Stipulations (fun msg f_NewOrderSingle_Stipulations -> check_duplicate_tags msg (fun () -> block msg parse_Instrument (fun msg f_NewOrderSingle_Instrument -> block msg parse_FinancingDetails (fun msg f_NewOrderSingle_FinancingDetails -> block msg parse_OrderQtyData (fun msg f_NewOrderSingle_OrderQtyData -> block msg parse_SpreadOrBenchmarkCurveData (fun msg f_NewOrderSingle_SpreadOrBenchmarkCurveData -> block msg parse_YieldData (fun msg f_NewOrderSingle_YieldData -> block msg parse_CommissionData (fun msg f_NewOrderSingle_CommissionData -> block msg parse_PegInstructions (fun msg f_NewOrderSingle_PegInstructions -> block msg parse_DiscretionInstructions (fun msg f_NewOrderSingle_DiscretionInstructions -> opt msg "11" parse_string (fun msg f_NewOrderSingle_ClOrdID -> opt msg "526" parse_string (fun msg f_NewOrderSingle_SecondaryClOrdID -> opt msg "583" parse_string (fun msg f_NewOrderSingle_ClOrdLinkID -> opt msg "229" parse_LocalMktDate (fun msg f_NewOrderSingle_TradeOriginationDate -> opt msg "75" parse_LocalMktDate (fun msg f_NewOrderSingle_TradeDate -> opt msg "1" parse_string (fun msg f_NewOrderSingle_Account -> opt msg "660" parse_AcctIDSource (fun msg f_NewOrderSingle_AcctIDSource -> opt msg "581" parse_AccountType (fun msg f_NewOrderSingle_AccountType -> opt msg "589" parse_DayBookingInst (fun msg f_NewOrderSingle_DayBookingInst -> opt msg "590" parse_BookingUnit (fun msg f_NewOrderSingle_BookingUnit -> opt msg "591" parse_PreallocMethod (fun msg f_NewOrderSingle_PreallocMethod -> opt msg "70" parse_string (fun msg f_NewOrderSingle_AllocID -> opt msg "63" parse_SettlType (fun msg f_NewOrderSingle_SettlType -> opt msg "64" parse_LocalMktDate (fun msg f_NewOrderSingle_SettlDate -> opt msg "544" parse_CashMargin (fun msg f_NewOrderSingle_CashMargin -> opt msg "635" parse_ClearingFeeIndicator (fun msg f_NewOrderSingle_ClearingFeeIndicator -> opt msg "21" parse_HandlInst (fun msg f_NewOrderSingle_HandlInst -> opt msg "18" parse_ExecInst (fun msg f_NewOrderSingle_ExecInst -> opt msg "110" parse_float (fun msg f_NewOrderSingle_MinQty -> opt msg "111" parse_float (fun msg f_NewOrderSingle_MaxFloor -> opt msg "100" parse_Exchange (fun msg f_NewOrderSingle_ExDestination -> opt msg "81" parse_ProcessCode (fun msg f_NewOrderSingle_ProcessCode -> opt msg "140" parse_float (fun msg f_NewOrderSingle_PrevClosePx -> opt msg "54" parse_Side (fun msg f_NewOrderSingle_Side -> opt msg "114" parse_LocateReqd (fun msg f_NewOrderSingle_LocateReqd -> opt msg "60" parse_UTCTimestamp (fun msg f_NewOrderSingle_TransactTime -> opt msg "854" parse_QtyType (fun msg f_NewOrderSingle_QtyType -> opt msg "40" parse_OrdType (fun msg f_NewOrderSingle_OrdType -> opt msg "423" parse_PriceType (fun msg f_NewOrderSingle_PriceType -> opt msg "44" parse_float (fun msg f_NewOrderSingle_Price -> opt msg "99" parse_float (fun msg f_NewOrderSingle_StopPx -> opt msg "15" parse_Currency (fun msg f_NewOrderSingle_Currency -> opt msg "376" parse_string (fun msg f_NewOrderSingle_ComplianceID -> opt msg "377" parse_SolicitedFlag (fun msg f_NewOrderSingle_SolicitedFlag -> opt msg "23" parse_string (fun msg f_NewOrderSingle_IOIID -> opt msg "117" parse_string (fun msg f_NewOrderSingle_QuoteID -> opt msg "59" parse_TimeInForce (fun msg f_NewOrderSingle_TimeInForce -> opt msg "168" parse_UTCTimestamp (fun msg f_NewOrderSingle_EffectiveTime -> opt msg "432" parse_LocalMktDate (fun msg f_NewOrderSingle_ExpireDate -> opt msg "126" parse_UTCTimestamp (fun msg f_NewOrderSingle_ExpireTime -> opt msg "427" parse_GTBookingInst (fun msg f_NewOrderSingle_GTBookingInst -> opt msg "528" parse_OrderCapacity (fun msg f_NewOrderSingle_OrderCapacity -> opt msg "529" parse_OrderRestrictions (fun msg f_NewOrderSingle_OrderRestrictions -> opt msg "582" parse_CustOrderCapacity (fun msg f_NewOrderSingle_CustOrderCapacity -> opt msg "121" parse_ForexReq (fun msg f_NewOrderSingle_ForexReq -> opt msg "120" parse_Currency (fun msg f_NewOrderSingle_SettlCurrency -> opt msg "775" parse_BookingType (fun msg f_NewOrderSingle_BookingType -> opt msg "58" parse_string (fun msg f_NewOrderSingle_Text -> opt msg "354" parse_int (fun msg f_NewOrderSingle_EncodedTextLen -> opt msg "355" parse_string (fun msg f_NewOrderSingle_EncodedText -> opt msg "193" parse_LocalMktDate (fun msg f_NewOrderSingle_SettlDate2 -> opt msg "192" parse_float (fun msg f_NewOrderSingle_OrderQty2 -> opt msg "640" parse_float (fun msg f_NewOrderSingle_Price2 -> opt msg "77" parse_PositionEffect (fun msg f_NewOrderSingle_PositionEffect -> opt msg "203" parse_CoveredOrUncovered (fun msg f_NewOrderSingle_CoveredOrUncovered -> opt msg "210" parse_float (fun msg f_NewOrderSingle_MaxShow -> opt msg "847" parse_TargetStrategy (fun msg f_NewOrderSingle_TargetStrategy -> opt msg "848" parse_string (fun msg f_NewOrderSingle_TargetStrategyParameters -> opt msg "849" parse_float (fun msg f_NewOrderSingle_ParticipationRate -> opt msg "480" parse_CancellationRights (fun msg f_NewOrderSingle_CancellationRights -> opt msg "481" parse_MoneyLaunderingStatus (fun msg f_NewOrderSingle_MoneyLaunderingStatus -> opt msg "513" parse_string (fun msg f_NewOrderSingle_RegistID -> opt msg "494" parse_string (fun msg f_NewOrderSingle_Designation -> (ParseSuccess {
        f_NewOrderSingle_Parties = f_NewOrderSingle_Parties;
        f_NewOrderSingle_PreAllocGrp = f_NewOrderSingle_PreAllocGrp;
        f_NewOrderSingle_TrdgSesGrp = f_NewOrderSingle_TrdgSesGrp;
        f_NewOrderSingle_UndInstrmtGrp = f_NewOrderSingle_UndInstrmtGrp;
        f_NewOrderSingle_Stipulations = f_NewOrderSingle_Stipulations;
        f_NewOrderSingle_Instrument = f_NewOrderSingle_Instrument;
        f_NewOrderSingle_FinancingDetails = f_NewOrderSingle_FinancingDetails;
        f_NewOrderSingle_OrderQtyData = f_NewOrderSingle_OrderQtyData;
        f_NewOrderSingle_SpreadOrBenchmarkCurveData = f_NewOrderSingle_SpreadOrBenchmarkCurveData;
        f_NewOrderSingle_YieldData = f_NewOrderSingle_YieldData;
        f_NewOrderSingle_CommissionData = f_NewOrderSingle_CommissionData;
        f_NewOrderSingle_PegInstructions = f_NewOrderSingle_PegInstructions;
        f_NewOrderSingle_DiscretionInstructions = f_NewOrderSingle_DiscretionInstructions;
        f_NewOrderSingle_ClOrdID = f_NewOrderSingle_ClOrdID;
        f_NewOrderSingle_SecondaryClOrdID = f_NewOrderSingle_SecondaryClOrdID;
        f_NewOrderSingle_ClOrdLinkID = f_NewOrderSingle_ClOrdLinkID;
        f_NewOrderSingle_TradeOriginationDate = f_NewOrderSingle_TradeOriginationDate;
        f_NewOrderSingle_TradeDate = f_NewOrderSingle_TradeDate;
        f_NewOrderSingle_Account = f_NewOrderSingle_Account;
        f_NewOrderSingle_AcctIDSource = f_NewOrderSingle_AcctIDSource;
        f_NewOrderSingle_AccountType = f_NewOrderSingle_AccountType;
        f_NewOrderSingle_DayBookingInst = f_NewOrderSingle_DayBookingInst;
        f_NewOrderSingle_BookingUnit = f_NewOrderSingle_BookingUnit;
        f_NewOrderSingle_PreallocMethod = f_NewOrderSingle_PreallocMethod;
        f_NewOrderSingle_AllocID = f_NewOrderSingle_AllocID;
        f_NewOrderSingle_SettlType = f_NewOrderSingle_SettlType;
        f_NewOrderSingle_SettlDate = f_NewOrderSingle_SettlDate;
        f_NewOrderSingle_CashMargin = f_NewOrderSingle_CashMargin;
        f_NewOrderSingle_ClearingFeeIndicator = f_NewOrderSingle_ClearingFeeIndicator;
        f_NewOrderSingle_HandlInst = f_NewOrderSingle_HandlInst;
        f_NewOrderSingle_ExecInst = f_NewOrderSingle_ExecInst;
        f_NewOrderSingle_MinQty = f_NewOrderSingle_MinQty;
        f_NewOrderSingle_MaxFloor = f_NewOrderSingle_MaxFloor;
        f_NewOrderSingle_ExDestination = f_NewOrderSingle_ExDestination;
        f_NewOrderSingle_ProcessCode = f_NewOrderSingle_ProcessCode;
        f_NewOrderSingle_PrevClosePx = f_NewOrderSingle_PrevClosePx;
        f_NewOrderSingle_Side = f_NewOrderSingle_Side;
        f_NewOrderSingle_LocateReqd = f_NewOrderSingle_LocateReqd;
        f_NewOrderSingle_TransactTime = f_NewOrderSingle_TransactTime;
        f_NewOrderSingle_QtyType = f_NewOrderSingle_QtyType;
        f_NewOrderSingle_OrdType = f_NewOrderSingle_OrdType;
        f_NewOrderSingle_PriceType = f_NewOrderSingle_PriceType;
        f_NewOrderSingle_Price = f_NewOrderSingle_Price;
        f_NewOrderSingle_StopPx = f_NewOrderSingle_StopPx;
        f_NewOrderSingle_Currency = f_NewOrderSingle_Currency;
        f_NewOrderSingle_ComplianceID = f_NewOrderSingle_ComplianceID;
        f_NewOrderSingle_SolicitedFlag = f_NewOrderSingle_SolicitedFlag;
        f_NewOrderSingle_IOIID = f_NewOrderSingle_IOIID;
        f_NewOrderSingle_QuoteID = f_NewOrderSingle_QuoteID;
        f_NewOrderSingle_TimeInForce = f_NewOrderSingle_TimeInForce;
        f_NewOrderSingle_EffectiveTime = f_NewOrderSingle_EffectiveTime;
        f_NewOrderSingle_ExpireDate = f_NewOrderSingle_ExpireDate;
        f_NewOrderSingle_ExpireTime = f_NewOrderSingle_ExpireTime;
        f_NewOrderSingle_GTBookingInst = f_NewOrderSingle_GTBookingInst;
        f_NewOrderSingle_OrderCapacity = f_NewOrderSingle_OrderCapacity;
        f_NewOrderSingle_OrderRestrictions = f_NewOrderSingle_OrderRestrictions;
        f_NewOrderSingle_CustOrderCapacity = f_NewOrderSingle_CustOrderCapacity;
        f_NewOrderSingle_ForexReq = f_NewOrderSingle_ForexReq;
        f_NewOrderSingle_SettlCurrency = f_NewOrderSingle_SettlCurrency;
        f_NewOrderSingle_BookingType = f_NewOrderSingle_BookingType;
        f_NewOrderSingle_Text = f_NewOrderSingle_Text;
        f_NewOrderSingle_EncodedTextLen = f_NewOrderSingle_EncodedTextLen;
        f_NewOrderSingle_EncodedText = f_NewOrderSingle_EncodedText;
        f_NewOrderSingle_SettlDate2 = f_NewOrderSingle_SettlDate2;
        f_NewOrderSingle_OrderQty2 = f_NewOrderSingle_OrderQty2;
        f_NewOrderSingle_Price2 = f_NewOrderSingle_Price2;
        f_NewOrderSingle_PositionEffect = f_NewOrderSingle_PositionEffect;
        f_NewOrderSingle_CoveredOrUncovered = f_NewOrderSingle_CoveredOrUncovered;
        f_NewOrderSingle_MaxShow = f_NewOrderSingle_MaxShow;
        f_NewOrderSingle_TargetStrategy = f_NewOrderSingle_TargetStrategy;
        f_NewOrderSingle_TargetStrategyParameters = f_NewOrderSingle_TargetStrategyParameters;
        f_NewOrderSingle_ParticipationRate = f_NewOrderSingle_ParticipationRate;
        f_NewOrderSingle_CancellationRights = f_NewOrderSingle_CancellationRights;
        f_NewOrderSingle_MoneyLaunderingStatus = f_NewOrderSingle_MoneyLaunderingStatus;
        f_NewOrderSingle_RegistID = f_NewOrderSingle_RegistID;
        f_NewOrderSingle_Designation = f_NewOrderSingle_Designation
    },msg)
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )
    )) |> check_unknown_tags
;;

let parse_app_msg_data (msg_tag) (msg)  =
    (match msg_tag with
        | Full_Msg_ExecutionReport_Tag -> ((>>=) (parse_ExecutionReport msg) (fun f -> ParseSuccess (FIX_Full_Msg_ExecutionReport f)
        ))
        | Full_Msg_NewOrderSingle_Tag -> ((>>=) (parse_NewOrderSingle msg) (fun f -> ParseSuccess (FIX_Full_Msg_NewOrderSingle f)
        ))
    )
;;
