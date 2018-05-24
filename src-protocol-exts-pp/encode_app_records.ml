(* Aesthetic Integration copyright 2018 *)
open Encode_datetime;;
open Encode_base_types;;
open Full_app_records;;
open Encode_app_enums;;

let req f x = Some (f x);;
let opt f v = match v with Some x -> Some ( f x ) | None -> None;;
let repeat f tag lst = match lst with [] -> [] | lst ->
    ( tag , lst |> List.length |> req encode_int ) :: (lst |> List.map f |> List.concat );;

let encode_PtysSubGrp msg =
    [
    ( "802" , opt encode_int msg.f_PtysSubGrp_NoPartySubIDs );
    ( "523" , opt encode_string msg.f_PtysSubGrp_PartySubID );
    ( "803" , opt encode_PartySubIDType msg.f_PtysSubGrp_PartySubIDType );
    ]
;;

let encode_BidCompReqGrp msg =
    [
    ( "420" , opt encode_int msg.f_BidCompReqGrp_NoBidComponents );
    ( "66" , opt encode_string msg.f_BidCompReqGrp_ListID );
    ( "54" , opt encode_Side msg.f_BidCompReqGrp_Side );
    ( "336" , opt encode_string msg.f_BidCompReqGrp_TradingSessionID );
    ( "625" , opt encode_string msg.f_BidCompReqGrp_TradingSessionSubID );
    ( "430" , opt encode_NetGrossInd msg.f_BidCompReqGrp_NetGrossInd );
    ( "63" , opt encode_SettlType msg.f_BidCompReqGrp_SettlType );
    ( "64" , opt encode_LocalMktDate msg.f_BidCompReqGrp_SettlDate );
    ( "1" , opt encode_string msg.f_BidCompReqGrp_Account );
    ( "660" , opt encode_AcctIDSource msg.f_BidCompReqGrp_AcctIDSource );
    ]
;;

let encode_AttrbGrp msg =
    [
    ( "870" , opt encode_int msg.f_AttrbGrp_NoInstrAttrib );
    ( "871" , opt encode_InstrAttribType msg.f_AttrbGrp_InstrAttribType );
    ( "872" , opt encode_string msg.f_AttrbGrp_InstrAttribValue );
    ]
;;

let encode_YieldData msg =
    [
    ( "235" , opt encode_YieldType msg.f_YieldData_YieldType );
    ( "236" , opt encode_float_4 msg.f_YieldData_Yield );
    ( "701" , opt encode_LocalMktDate msg.f_YieldData_YieldCalcDate );
    ( "696" , opt encode_LocalMktDate msg.f_YieldData_YieldRedemptionDate );
    ( "697" , opt encode_float_4 msg.f_YieldData_YieldRedemptionPrice );
    ( "698" , opt encode_int msg.f_YieldData_YieldRedemptionPriceType );
    ]
;;

let encode_CpctyConfGrp msg =
    [
    ( "862" , req encode_int msg.f_CpctyConfGrp_NoCapacities );
    ( "528" , req encode_OrderCapacity msg.f_CpctyConfGrp_OrderCapacity );
    ( "529" , opt encode_OrderRestrictions msg.f_CpctyConfGrp_OrderRestrictions );
    ( "863" , req encode_float_4 msg.f_CpctyConfGrp_OrderCapacityQty );
    ]
;;

let encode_AffectedOrdGrp msg =
    [
    ( "534" , opt encode_int msg.f_AffectedOrdGrp_NoAffectedOrders );
    ( "41" , opt encode_string msg.f_AffectedOrdGrp_OrigClOrdID );
    ( "535" , opt encode_string msg.f_AffectedOrdGrp_AffectedOrderID );
    ( "536" , opt encode_string msg.f_AffectedOrdGrp_AffectedSecondaryOrderID );
    ]
;;

let encode_NstdPtysSubGrp msg =
    [
    ( "804" , opt encode_int msg.f_NstdPtysSubGrp_NoNestedPartySubIDs );
    ( "545" , opt encode_string msg.f_NstdPtysSubGrp_NestedPartySubID );
    ( "805" , opt encode_int msg.f_NstdPtysSubGrp_NestedPartySubIDType );
    ]
;;

let encode_MDRjctGrp msg =
    [
    ( "816" , opt encode_int msg.f_MDRjctGrp_NoAltMDSource );
    ( "817" , opt encode_string msg.f_MDRjctGrp_AltMDSourceID );
    ]
;;

let encode_NstdPtys3SubGrp msg =
    [
    ( "952" , opt encode_int msg.f_NstdPtys3SubGrp_NoNested3PartySubIDs );
    ( "953" , opt encode_string msg.f_NstdPtys3SubGrp_Nested3PartySubID );
    ( "954" , opt encode_int msg.f_NstdPtys3SubGrp_Nested3PartySubIDType );
    ]
;;

let encode_AllocAckGrp msg =
    [
    ( "78" , opt encode_int msg.f_AllocAckGrp_NoAllocs );
    ( "79" , opt encode_string msg.f_AllocAckGrp_AllocAccount );
    ( "661" , opt encode_int msg.f_AllocAckGrp_AllocAcctIDSource );
    ( "366" , opt encode_float_4 msg.f_AllocAckGrp_AllocPrice );
    ( "467" , opt encode_string msg.f_AllocAckGrp_IndividualAllocID );
    ( "776" , opt encode_int msg.f_AllocAckGrp_IndividualAllocRejCode );
    ( "161" , opt encode_string msg.f_AllocAckGrp_AllocText );
    ( "360" , opt encode_int msg.f_AllocAckGrp_EncodedAllocTextLen );
    ( "361" , opt encode_string msg.f_AllocAckGrp_EncodedAllocText );
    ]
;;

let encode_Hop msg =
    [
    ( "627" , opt encode_int msg.f_Hop_NoHops );
    ( "628" , opt encode_string msg.f_Hop_HopCompID );
    ( "629" , opt encode_UTCTimestamp msg.f_Hop_HopSendingTime );
    ( "630" , opt encode_int msg.f_Hop_HopRefID );
    ]
;;

let encode_UndSecAltIDGrp msg =
    [
    ( "457" , opt encode_int msg.f_UndSecAltIDGrp_NoUnderlyingSecurityAltID );
    ( "458" , opt encode_string msg.f_UndSecAltIDGrp_UnderlyingSecurityAltID );
    ( "459" , opt encode_string msg.f_UndSecAltIDGrp_UnderlyingSecurityAltIDSource );
    ]
;;

let encode_NstdPtys2SubGrp msg =
    [
    ( "806" , opt encode_int msg.f_NstdPtys2SubGrp_NoNested2PartySubIDs );
    ( "760" , opt encode_string msg.f_NstdPtys2SubGrp_Nested2PartySubID );
    ( "807" , opt encode_int msg.f_NstdPtys2SubGrp_Nested2PartySubIDType );
    ]
;;

let encode_TrdCollGrp msg =
    [
    ( "897" , opt encode_int msg.f_TrdCollGrp_NoTrades );
    ( "571" , opt encode_string msg.f_TrdCollGrp_TradeReportID );
    ( "818" , opt encode_string msg.f_TrdCollGrp_SecondaryTradeReportID );
    ]
;;

let encode_ContAmtGrp msg =
    [
    ( "518" , opt encode_int msg.f_ContAmtGrp_NoContAmts );
    ( "519" , opt encode_ContAmtType msg.f_ContAmtGrp_ContAmtType );
    ( "520" , opt encode_float_4 msg.f_ContAmtGrp_ContAmtValue );
    ( "521" , opt encode_Currency msg.f_ContAmtGrp_ContAmtCurr );
    ]
;;

let encode_SecAltIDGrp msg =
    [
    ( "454" , opt encode_int msg.f_SecAltIDGrp_NoSecurityAltID );
    ( "455" , opt encode_string msg.f_SecAltIDGrp_SecurityAltID );
    ( "456" , opt encode_string msg.f_SecAltIDGrp_SecurityAltIDSource );
    ]
;;

let encode_CompIDStatGrp msg =
    [
    ( "936" , req encode_int msg.f_CompIDStatGrp_NoCompIDs );
    ( "930" , opt encode_string msg.f_CompIDStatGrp_RefCompID );
    ( "931" , opt encode_string msg.f_CompIDStatGrp_RefSubID );
    ( "283" , opt encode_string msg.f_CompIDStatGrp_LocationID );
    ( "284" , opt encode_string msg.f_CompIDStatGrp_DeskID );
    ( "928" , opt encode_StatusValue msg.f_CompIDStatGrp_StatusValue );
    ( "929" , opt encode_string msg.f_CompIDStatGrp_StatusText );
    ]
;;

let encode_IOIQualGrp msg =
    [
    ( "199" , opt encode_int msg.f_IOIQualGrp_NoIOIQualifiers );
    ( "104" , opt encode_IOIQualifier msg.f_IOIQualGrp_IOIQualifier );
    ]
;;

let encode_LogonMsgTypes msg =
    [
    ( "384" , opt encode_int msg.f_LogonMsgTypes_NoMsgTypes );
    ( "372" , opt encode_string msg.f_LogonMsgTypes_RefMsgType );
    ( "385" , opt encode_MsgDirection msg.f_LogonMsgTypes_MsgDirection );
    ]
;;

let encode_PegInstructions msg =
    [
    ( "211" , opt encode_float_4 msg.f_PegInstructions_PegOffsetValue );
    ( "835" , opt encode_PegMoveType msg.f_PegInstructions_PegMoveType );
    ( "836" , opt encode_PegOffsetType msg.f_PegInstructions_PegOffsetType );
    ( "837" , opt encode_PegLimitType msg.f_PegInstructions_PegLimitType );
    ( "838" , opt encode_PegRoundDirection msg.f_PegInstructions_PegRoundDirection );
    ( "840" , opt encode_PegScope msg.f_PegInstructions_PegScope );
    ]
;;

let encode_LinesOfTextGrp msg =
    [
    ( "33" , req encode_int msg.f_LinesOfTextGrp_NoLinesOfText );
    ( "58" , req encode_string msg.f_LinesOfTextGrp_Text );
    ( "354" , opt encode_int msg.f_LinesOfTextGrp_EncodedTextLen );
    ( "355" , opt encode_string msg.f_LinesOfTextGrp_EncodedText );
    ]
;;

let encode_TrdgSesGrp msg =
    [
    ( "386" , opt encode_int msg.f_TrdgSesGrp_NoTradingSessions );
    ( "336" , opt encode_string msg.f_TrdgSesGrp_TradingSessionID );
    ( "625" , opt encode_string msg.f_TrdgSesGrp_TradingSessionSubID );
    ]
;;

let encode_PositionAmountData msg =
    [
    ( "753" , opt encode_int msg.f_PositionAmountData_NoPosAmt );
    ( "707" , opt encode_PosAmtType msg.f_PositionAmountData_PosAmtType );
    ( "708" , opt encode_float_4 msg.f_PositionAmountData_PosAmt );
    ]
;;

let encode_BidDescReqGrp msg =
    [
    ( "398" , opt encode_int msg.f_BidDescReqGrp_NoBidDescriptors );
    ( "399" , opt encode_BidDescriptorType msg.f_BidDescReqGrp_BidDescriptorType );
    ( "400" , opt encode_string msg.f_BidDescReqGrp_BidDescriptor );
    ( "401" , opt encode_SideValueInd msg.f_BidDescReqGrp_SideValueInd );
    ( "404" , opt encode_float_4 msg.f_BidDescReqGrp_LiquidityValue );
    ( "441" , opt encode_int msg.f_BidDescReqGrp_LiquidityNumSecurities );
    ( "402" , opt encode_float_4 msg.f_BidDescReqGrp_LiquidityPctLow );
    ( "403" , opt encode_float_4 msg.f_BidDescReqGrp_LiquidityPctHigh );
    ( "405" , opt encode_float_4 msg.f_BidDescReqGrp_EFPTrackingError );
    ( "406" , opt encode_float_4 msg.f_BidDescReqGrp_FairValue );
    ( "407" , opt encode_float_4 msg.f_BidDescReqGrp_OutsideIndexPct );
    ( "408" , opt encode_float_4 msg.f_BidDescReqGrp_ValueOfFutures );
    ]
;;

let encode_UnderlyingStipulations msg =
    [
    ( "887" , opt encode_int msg.f_UnderlyingStipulations_NoUnderlyingStips );
    ( "888" , opt encode_string msg.f_UnderlyingStipulations_UnderlyingStipType );
    ( "889" , opt encode_string msg.f_UnderlyingStipulations_UnderlyingStipValue );
    ]
;;

let encode_MDReqGrp msg =
    [
    ( "267" , req encode_int msg.f_MDReqGrp_NoMDEntryTypes );
    ( "269" , req encode_MDEntryType msg.f_MDReqGrp_MDEntryType );
    ]
;;

let encode_QuotQualGrp msg =
    [
    ( "735" , opt encode_int msg.f_QuotQualGrp_NoQuoteQualifiers );
    ( "695" , opt encode_char msg.f_QuotQualGrp_QuoteQualifier );
    ]
;;

let encode_TrdRegTimestamps msg =
    [
    ( "768" , opt encode_int msg.f_TrdRegTimestamps_NoTrdRegTimestamps );
    ( "769" , opt encode_UTCTimestamp msg.f_TrdRegTimestamps_TrdRegTimestamp );
    ( "770" , opt encode_TrdRegTimestampType msg.f_TrdRegTimestamps_TrdRegTimestampType );
    ( "771" , opt encode_string msg.f_TrdRegTimestamps_TrdRegTimestampOrigin );
    ]
;;

let encode_ExecCollGrp msg =
    [
    ( "124" , opt encode_int msg.f_ExecCollGrp_NoExecs );
    ( "17" , opt encode_string msg.f_ExecCollGrp_ExecID );
    ]
;;

let encode_SpreadOrBenchmarkCurveData msg =
    [
    ( "218" , opt encode_float_4 msg.f_SpreadOrBenchmarkCurveData_Spread );
    ( "220" , opt encode_Currency msg.f_SpreadOrBenchmarkCurveData_BenchmarkCurveCurrency );
    ( "221" , opt encode_string msg.f_SpreadOrBenchmarkCurveData_BenchmarkCurveName );
    ( "222" , opt encode_string msg.f_SpreadOrBenchmarkCurveData_BenchmarkCurvePoint );
    ( "662" , opt encode_float_4 msg.f_SpreadOrBenchmarkCurveData_BenchmarkPrice );
    ( "663" , opt encode_int msg.f_SpreadOrBenchmarkCurveData_BenchmarkPriceType );
    ( "699" , opt encode_string msg.f_SpreadOrBenchmarkCurveData_BenchmarkSecurityID );
    ( "761" , opt encode_string msg.f_SpreadOrBenchmarkCurveData_BenchmarkSecurityIDSource );
    ]
;;

let encode_LegSecAltIDGrp msg =
    [
    ( "604" , opt encode_int msg.f_LegSecAltIDGrp_NoLegSecurityAltID );
    ( "605" , opt encode_string msg.f_LegSecAltIDGrp_LegSecurityAltID );
    ( "606" , opt encode_string msg.f_LegSecAltIDGrp_LegSecurityAltIDSource );
    ]
;;

let encode_Stipulations msg =
    [
    ( "232" , opt encode_int msg.f_Stipulations_NoStipulations );
    ( "233" , opt encode_StipulationType msg.f_Stipulations_StipulationType );
    ( "234" , opt encode_string msg.f_Stipulations_StipulationValue );
    ]
;;

let encode_LegStipulations msg =
    [
    ( "683" , opt encode_int msg.f_LegStipulations_NoLegStipulations );
    ( "688" , opt encode_string msg.f_LegStipulations_LegStipulationType );
    ( "689" , opt encode_string msg.f_LegStipulations_LegStipulationValue );
    ]
;;

let encode_TrdCapDtGrp msg =
    [
    ( "580" , opt encode_int msg.f_TrdCapDtGrp_NoDates );
    ( "75" , opt encode_LocalMktDate msg.f_TrdCapDtGrp_TradeDate );
    ( "60" , opt encode_UTCTimestamp msg.f_TrdCapDtGrp_TransactTime );
    ]
;;

let encode_SettlPtysSubGrp msg =
    [
    ( "801" , opt encode_int msg.f_SettlPtysSubGrp_NoSettlPartySubIDs );
    ( "785" , opt encode_string msg.f_SettlPtysSubGrp_SettlPartySubID );
    ( "786" , opt encode_int msg.f_SettlPtysSubGrp_SettlPartySubIDType );
    ]
;;

let encode_CommissionData msg =
    [
    ( "12" , opt encode_float_4 msg.f_CommissionData_Commission );
    ( "13" , opt encode_CommType msg.f_CommissionData_CommType );
    ( "479" , opt encode_Currency msg.f_CommissionData_CommCurrency );
    ( "497" , opt encode_FundRenewWaiv msg.f_CommissionData_FundRenewWaiv );
    ]
;;

let encode_ExecsGrp msg =
    [
    ( "124" , opt encode_int msg.f_ExecsGrp_NoExecs );
    ( "17" , opt encode_string msg.f_ExecsGrp_ExecID );
    ]
;;

let encode_RgstDistInstGrp msg =
    [
    ( "510" , opt encode_int msg.f_RgstDistInstGrp_NoDistribInsts );
    ( "477" , opt encode_DistribPaymentMethod msg.f_RgstDistInstGrp_DistribPaymentMethod );
    ( "512" , opt encode_float_4 msg.f_RgstDistInstGrp_DistribPercentage );
    ( "478" , opt encode_Currency msg.f_RgstDistInstGrp_CashDistribCurr );
    ( "498" , opt encode_string msg.f_RgstDistInstGrp_CashDistribAgentName );
    ( "499" , opt encode_string msg.f_RgstDistInstGrp_CashDistribAgentCode );
    ( "500" , opt encode_string msg.f_RgstDistInstGrp_CashDistribAgentAcctNumber );
    ( "501" , opt encode_string msg.f_RgstDistInstGrp_CashDistribPayRef );
    ( "502" , opt encode_string msg.f_RgstDistInstGrp_CashDistribAgentAcctName );
    ]
;;

let encode_ExecAllocGrp msg =
    [
    ( "124" , opt encode_int msg.f_ExecAllocGrp_NoExecs );
    ( "32" , opt encode_float_4 msg.f_ExecAllocGrp_LastQty );
    ( "17" , opt encode_string msg.f_ExecAllocGrp_ExecID );
    ( "527" , opt encode_string msg.f_ExecAllocGrp_SecondaryExecID );
    ( "31" , opt encode_float_4 msg.f_ExecAllocGrp_LastPx );
    ( "669" , opt encode_float_4 msg.f_ExecAllocGrp_LastParPx );
    ( "29" , opt encode_LastCapacity msg.f_ExecAllocGrp_LastCapacity );
    ]
;;

let encode_LegBenchmarkCurveData msg =
    [
    ( "676" , opt encode_Currency msg.f_LegBenchmarkCurveData_LegBenchmarkCurveCurrency );
    ( "677" , opt encode_string msg.f_LegBenchmarkCurveData_LegBenchmarkCurveName );
    ( "678" , opt encode_string msg.f_LegBenchmarkCurveData_LegBenchmarkCurvePoint );
    ( "679" , opt encode_float_4 msg.f_LegBenchmarkCurveData_LegBenchmarkPrice );
    ( "680" , opt encode_int msg.f_LegBenchmarkCurveData_LegBenchmarkPriceType );
    ]
;;

let encode_OrdListStatGrp msg =
    [
    ( "73" , req encode_int msg.f_OrdListStatGrp_NoOrders );
    ( "11" , req encode_string msg.f_OrdListStatGrp_ClOrdID );
    ( "526" , opt encode_string msg.f_OrdListStatGrp_SecondaryClOrdID );
    ( "14" , req encode_float_4 msg.f_OrdListStatGrp_CumQty );
    ( "39" , req encode_OrdStatus msg.f_OrdListStatGrp_OrdStatus );
    ( "636" , opt encode_WorkingIndicator msg.f_OrdListStatGrp_WorkingIndicator );
    ( "151" , req encode_float_4 msg.f_OrdListStatGrp_LeavesQty );
    ( "84" , req encode_float_4 msg.f_OrdListStatGrp_CxlQty );
    ( "6" , req encode_float_4 msg.f_OrdListStatGrp_AvgPx );
    ( "103" , opt encode_OrdRejReason msg.f_OrdListStatGrp_OrdRejReason );
    ( "58" , opt encode_string msg.f_OrdListStatGrp_Text );
    ( "354" , opt encode_int msg.f_OrdListStatGrp_EncodedTextLen );
    ( "355" , opt encode_string msg.f_OrdListStatGrp_EncodedText );
    ]
;;

let encode_ClrInstGrp msg =
    [
    ( "576" , opt encode_int msg.f_ClrInstGrp_NoClearingInstructions );
    ( "577" , opt encode_ClearingInstruction msg.f_ClrInstGrp_ClearingInstruction );
    ]
;;

let encode_OrderQtyData msg =
    [
    ( "38" , opt encode_float_4 msg.f_OrderQtyData_OrderQty );
    ( "152" , opt encode_float_4 msg.f_OrderQtyData_CashOrderQty );
    ( "516" , opt encode_float_4 msg.f_OrderQtyData_OrderPercent );
    ( "468" , opt encode_RoundingDirection msg.f_OrderQtyData_RoundingDirection );
    ( "469" , opt encode_float_4 msg.f_OrderQtyData_RoundingModulus );
    ]
;;

let encode_RoutingGrp msg =
    [
    ( "215" , opt encode_int msg.f_RoutingGrp_NoRoutingIDs );
    ( "216" , opt encode_RoutingType msg.f_RoutingGrp_RoutingType );
    ( "217" , opt encode_string msg.f_RoutingGrp_RoutingID );
    ]
;;

let encode_MiscFeesGrp msg =
    [
    ( "136" , opt encode_int msg.f_MiscFeesGrp_NoMiscFees );
    ( "137" , opt encode_float_4 msg.f_MiscFeesGrp_MiscFeeAmt );
    ( "138" , opt encode_Currency msg.f_MiscFeesGrp_MiscFeeCurr );
    ( "139" , opt encode_MiscFeeType msg.f_MiscFeesGrp_MiscFeeType );
    ( "891" , opt encode_MiscFeeBasis msg.f_MiscFeesGrp_MiscFeeBasis );
    ]
;;

let encode_MDFullGrp msg =
    [
    ( "268" , req encode_int msg.f_MDFullGrp_NoMDEntries );
    ( "269" , req encode_MDEntryType msg.f_MDFullGrp_MDEntryType );
    ( "270" , opt encode_float_4 msg.f_MDFullGrp_MDEntryPx );
    ( "15" , opt encode_Currency msg.f_MDFullGrp_Currency );
    ( "271" , opt encode_float_4 msg.f_MDFullGrp_MDEntrySize );
    ( "272" , opt encode_UTCDateOnly msg.f_MDFullGrp_MDEntryDate );
    ( "273" , opt encode_UTCTimeOnly msg.f_MDFullGrp_MDEntryTime );
    ( "274" , opt encode_TickDirection msg.f_MDFullGrp_TickDirection );
    ( "275" , opt encode_Exchange msg.f_MDFullGrp_MDMkt );
    ( "336" , opt encode_string msg.f_MDFullGrp_TradingSessionID );
    ( "625" , opt encode_string msg.f_MDFullGrp_TradingSessionSubID );
    ( "276" , opt encode_QuoteCondition msg.f_MDFullGrp_QuoteCondition );
    ( "277" , opt encode_TradeCondition msg.f_MDFullGrp_TradeCondition );
    ( "282" , opt encode_string msg.f_MDFullGrp_MDEntryOriginator );
    ( "283" , opt encode_string msg.f_MDFullGrp_LocationID );
    ( "284" , opt encode_string msg.f_MDFullGrp_DeskID );
    ( "286" , opt encode_OpenCloseSettlFlag msg.f_MDFullGrp_OpenCloseSettlFlag );
    ( "59" , opt encode_TimeInForce msg.f_MDFullGrp_TimeInForce );
    ( "432" , opt encode_LocalMktDate msg.f_MDFullGrp_ExpireDate );
    ( "126" , opt encode_UTCTimestamp msg.f_MDFullGrp_ExpireTime );
    ( "110" , opt encode_float_4 msg.f_MDFullGrp_MinQty );
    ( "18" , opt encode_ExecInst msg.f_MDFullGrp_ExecInst );
    ( "287" , opt encode_int msg.f_MDFullGrp_SellerDays );
    ( "37" , opt encode_string msg.f_MDFullGrp_OrderID );
    ( "299" , opt encode_string msg.f_MDFullGrp_QuoteEntryID );
    ( "288" , opt encode_string msg.f_MDFullGrp_MDEntryBuyer );
    ( "289" , opt encode_string msg.f_MDFullGrp_MDEntrySeller );
    ( "346" , opt encode_int msg.f_MDFullGrp_NumberOfOrders );
    ( "290" , opt encode_int msg.f_MDFullGrp_MDEntryPositionNo );
    ( "546" , opt encode_Scope msg.f_MDFullGrp_Scope );
    ( "811" , opt encode_float_4 msg.f_MDFullGrp_PriceDelta );
    ( "58" , opt encode_string msg.f_MDFullGrp_Text );
    ( "354" , opt encode_int msg.f_MDFullGrp_EncodedTextLen );
    ( "355" , opt encode_string msg.f_MDFullGrp_EncodedText );
    ]
;;

let encode_SecTypesGrp msg =
    [
    ( "558" , opt encode_int msg.f_SecTypesGrp_NoSecurityTypes );
    ( "167" , opt encode_SecurityType msg.f_SecTypesGrp_SecurityType );
    ( "762" , opt encode_string msg.f_SecTypesGrp_SecuritySubType );
    ( "460" , opt encode_Product msg.f_SecTypesGrp_Product );
    ( "461" , opt encode_string msg.f_SecTypesGrp_CFICode );
    ]
;;

let encode_CollInqQualGrp msg =
    [
    ( "938" , opt encode_int msg.f_CollInqQualGrp_NoCollInquiryQualifier );
    ( "896" , opt encode_CollInquiryQualifier msg.f_CollInqQualGrp_CollInquiryQualifier );
    ]
;;

let encode_FinancingDetails msg =
    [
    ( "913" , opt encode_string msg.f_FinancingDetails_AgreementDesc );
    ( "914" , opt encode_string msg.f_FinancingDetails_AgreementID );
    ( "915" , opt encode_LocalMktDate msg.f_FinancingDetails_AgreementDate );
    ( "918" , opt encode_Currency msg.f_FinancingDetails_AgreementCurrency );
    ( "788" , opt encode_TerminationType msg.f_FinancingDetails_TerminationType );
    ( "916" , opt encode_LocalMktDate msg.f_FinancingDetails_StartDate );
    ( "917" , opt encode_LocalMktDate msg.f_FinancingDetails_EndDate );
    ( "919" , opt encode_DeliveryType msg.f_FinancingDetails_DeliveryType );
    ( "898" , opt encode_float_4 msg.f_FinancingDetails_MarginRatio );
    ]
;;

let encode_ContraGrp msg =
    [
    ( "382" , opt encode_int msg.f_ContraGrp_NoContraBrokers );
    ( "375" , opt encode_string msg.f_ContraGrp_ContraBroker );
    ( "337" , opt encode_string msg.f_ContraGrp_ContraTrader );
    ( "437" , opt encode_float_4 msg.f_ContraGrp_ContraTradeQty );
    ( "438" , opt encode_UTCTimestamp msg.f_ContraGrp_ContraTradeTime );
    ( "655" , opt encode_string msg.f_ContraGrp_ContraLegRefID );
    ]
;;

let encode_DiscretionInstructions msg =
    [
    ( "388" , opt encode_DiscretionInst msg.f_DiscretionInstructions_DiscretionInst );
    ( "389" , opt encode_float_4 msg.f_DiscretionInstructions_DiscretionOffsetValue );
    ( "841" , opt encode_DiscretionMoveType msg.f_DiscretionInstructions_DiscretionMoveType );
    ( "842" , opt encode_DiscretionOffsetType msg.f_DiscretionInstructions_DiscretionOffsetType );
    ( "843" , opt encode_DiscretionLimitType msg.f_DiscretionInstructions_DiscretionLimitType );
    ( "844" , opt encode_DiscretionRoundDirection msg.f_DiscretionInstructions_DiscretionRoundDirection );
    ( "846" , opt encode_DiscretionScope msg.f_DiscretionInstructions_DiscretionScope );
    ]
;;

let encode_EvntGrp msg =
    [
    ( "864" , opt encode_int msg.f_EvntGrp_NoEvents );
    ( "865" , opt encode_EventType msg.f_EvntGrp_EventType );
    ( "866" , opt encode_LocalMktDate msg.f_EvntGrp_EventDate );
    ( "867" , opt encode_float_4 msg.f_EvntGrp_EventPx );
    ( "868" , opt encode_string msg.f_EvntGrp_EventText );
    ]
;;

let encode_CompIDReqGrp msg =
    [
    ( "936" , opt encode_int msg.f_CompIDReqGrp_NoCompIDs );
    ( "930" , opt encode_string msg.f_CompIDReqGrp_RefCompID );
    ( "931" , opt encode_string msg.f_CompIDReqGrp_RefSubID );
    ( "283" , opt encode_string msg.f_CompIDReqGrp_LocationID );
    ( "284" , opt encode_string msg.f_CompIDReqGrp_DeskID );
    ]
;;

let encode_Parties msg =
    [
    ( "453" , opt encode_int msg.f_Parties_NoPartyIDs );
    ( "448" , opt encode_string msg.f_Parties_PartyID );
    ( "447" , opt encode_PartyIDSource msg.f_Parties_PartyIDSource );
    ( "452" , opt encode_PartyRole msg.f_Parties_PartyRole );
    ]
    @ repeat encode_PtysSubGrp "802" msg.f_Parties_PtysSubGrp
;;

let encode_UnderlyingInstrument msg =
    [
    ( "311" , opt encode_string msg.f_UnderlyingInstrument_UnderlyingSymbol );
    ( "312" , opt encode_string msg.f_UnderlyingInstrument_UnderlyingSymbolSfx );
    ( "309" , opt encode_string msg.f_UnderlyingInstrument_UnderlyingSecurityID );
    ( "305" , opt encode_string msg.f_UnderlyingInstrument_UnderlyingSecurityIDSource );
    ( "462" , opt encode_int msg.f_UnderlyingInstrument_UnderlyingProduct );
    ( "463" , opt encode_string msg.f_UnderlyingInstrument_UnderlyingCFICode );
    ( "310" , opt encode_string msg.f_UnderlyingInstrument_UnderlyingSecurityType );
    ( "763" , opt encode_string msg.f_UnderlyingInstrument_UnderlyingSecuritySubType );
    ( "313" , opt encode_MonthYear msg.f_UnderlyingInstrument_UnderlyingMaturityMonthYear );
    ( "542" , opt encode_LocalMktDate msg.f_UnderlyingInstrument_UnderlyingMaturityDate );
    ( "241" , opt encode_LocalMktDate msg.f_UnderlyingInstrument_UnderlyingCouponPaymentDate );
    ( "242" , opt encode_LocalMktDate msg.f_UnderlyingInstrument_UnderlyingIssueDate );
    ( "243" , opt encode_string msg.f_UnderlyingInstrument_UnderlyingRepoCollateralSecurityType );
    ( "244" , opt encode_int msg.f_UnderlyingInstrument_UnderlyingRepurchaseTerm );
    ( "245" , opt encode_float_4 msg.f_UnderlyingInstrument_UnderlyingRepurchaseRate );
    ( "246" , opt encode_float_4 msg.f_UnderlyingInstrument_UnderlyingFactor );
    ( "256" , opt encode_string msg.f_UnderlyingInstrument_UnderlyingCreditRating );
    ( "595" , opt encode_string msg.f_UnderlyingInstrument_UnderlyingInstrRegistry );
    ( "592" , opt encode_Country msg.f_UnderlyingInstrument_UnderlyingCountryOfIssue );
    ( "593" , opt encode_string msg.f_UnderlyingInstrument_UnderlyingStateOrProvinceOfIssue );
    ( "594" , opt encode_string msg.f_UnderlyingInstrument_UnderlyingLocaleOfIssue );
    ( "247" , opt encode_LocalMktDate msg.f_UnderlyingInstrument_UnderlyingRedemptionDate );
    ( "316" , opt encode_float_4 msg.f_UnderlyingInstrument_UnderlyingStrikePrice );
    ( "941" , opt encode_Currency msg.f_UnderlyingInstrument_UnderlyingStrikeCurrency );
    ( "317" , opt encode_char msg.f_UnderlyingInstrument_UnderlyingOptAttribute );
    ( "436" , opt encode_float_4 msg.f_UnderlyingInstrument_UnderlyingContractMultiplier );
    ( "435" , opt encode_float_4 msg.f_UnderlyingInstrument_UnderlyingCouponRate );
    ( "308" , opt encode_Exchange msg.f_UnderlyingInstrument_UnderlyingSecurityExchange );
    ( "306" , opt encode_string msg.f_UnderlyingInstrument_UnderlyingIssuer );
    ( "362" , opt encode_int msg.f_UnderlyingInstrument_EncodedUnderlyingIssuerLen );
    ( "363" , opt encode_string msg.f_UnderlyingInstrument_EncodedUnderlyingIssuer );
    ( "307" , opt encode_string msg.f_UnderlyingInstrument_UnderlyingSecurityDesc );
    ( "364" , opt encode_int msg.f_UnderlyingInstrument_EncodedUnderlyingSecurityDescLen );
    ( "365" , opt encode_string msg.f_UnderlyingInstrument_EncodedUnderlyingSecurityDesc );
    ( "877" , opt encode_string msg.f_UnderlyingInstrument_UnderlyingCPProgram );
    ( "878" , opt encode_string msg.f_UnderlyingInstrument_UnderlyingCPRegType );
    ( "318" , opt encode_Currency msg.f_UnderlyingInstrument_UnderlyingCurrency );
    ( "879" , opt encode_float_4 msg.f_UnderlyingInstrument_UnderlyingQty );
    ( "810" , opt encode_float_4 msg.f_UnderlyingInstrument_UnderlyingPx );
    ( "882" , opt encode_float_4 msg.f_UnderlyingInstrument_UnderlyingDirtyPrice );
    ( "883" , opt encode_float_4 msg.f_UnderlyingInstrument_UnderlyingEndPrice );
    ( "884" , opt encode_float_4 msg.f_UnderlyingInstrument_UnderlyingStartValue );
    ( "885" , opt encode_float_4 msg.f_UnderlyingInstrument_UnderlyingCurrentValue );
    ( "886" , opt encode_float_4 msg.f_UnderlyingInstrument_UnderlyingEndValue );
    ]
    @ repeat encode_UndSecAltIDGrp "457" msg.f_UnderlyingInstrument_UndSecAltIDGrp
    @ repeat encode_UnderlyingStipulations "887" msg.f_UnderlyingInstrument_UnderlyingStipulations
;;

let encode_NestedParties2 msg =
    [
    ( "756" , opt encode_int msg.f_NestedParties2_NoNested2PartyIDs );
    ( "757" , opt encode_string msg.f_NestedParties2_Nested2PartyID );
    ( "758" , opt encode_char msg.f_NestedParties2_Nested2PartyIDSource );
    ( "759" , opt encode_int msg.f_NestedParties2_Nested2PartyRole );
    ]
    @ repeat encode_NstdPtys2SubGrp "806" msg.f_NestedParties2_NstdPtys2SubGrp
;;

let encode_InstrumentExtension msg =
    [
    ( "668" , opt encode_DeliveryForm msg.f_InstrumentExtension_DeliveryForm );
    ( "869" , opt encode_float_4 msg.f_InstrumentExtension_PctAtRisk );
    ]
    @ repeat encode_AttrbGrp "870" msg.f_InstrumentExtension_AttrbGrp
;;

let encode_SettlParties msg =
    [
    ( "781" , opt encode_int msg.f_SettlParties_NoSettlPartyIDs );
    ( "782" , opt encode_string msg.f_SettlParties_SettlPartyID );
    ( "783" , opt encode_char msg.f_SettlParties_SettlPartyIDSource );
    ( "784" , opt encode_int msg.f_SettlParties_SettlPartyRole );
    ]
    @ repeat encode_SettlPtysSubGrp "801" msg.f_SettlParties_SettlPtysSubGrp
;;

let encode_NestedParties msg =
    [
    ( "539" , opt encode_int msg.f_NestedParties_NoNestedPartyIDs );
    ( "524" , opt encode_string msg.f_NestedParties_NestedPartyID );
    ( "525" , opt encode_char msg.f_NestedParties_NestedPartyIDSource );
    ( "538" , opt encode_int msg.f_NestedParties_NestedPartyRole );
    ]
    @ repeat encode_NstdPtysSubGrp "804" msg.f_NestedParties_NstdPtysSubGrp
;;

let encode_BidCompRspGrp msg =
    encode_CommissionData msg.f_BidCompRspGrp_CommissionData @
    [
    ( "420" , req encode_int msg.f_BidCompRspGrp_NoBidComponents );
    ( "66" , opt encode_string msg.f_BidCompRspGrp_ListID );
    ( "421" , opt encode_Country msg.f_BidCompRspGrp_Country );
    ( "54" , opt encode_Side msg.f_BidCompRspGrp_Side );
    ( "44" , opt encode_float_4 msg.f_BidCompRspGrp_Price );
    ( "423" , opt encode_PriceType msg.f_BidCompRspGrp_PriceType );
    ( "406" , opt encode_float_4 msg.f_BidCompRspGrp_FairValue );
    ( "430" , opt encode_NetGrossInd msg.f_BidCompRspGrp_NetGrossInd );
    ( "63" , opt encode_SettlType msg.f_BidCompRspGrp_SettlType );
    ( "64" , opt encode_LocalMktDate msg.f_BidCompRspGrp_SettlDate );
    ( "336" , opt encode_string msg.f_BidCompRspGrp_TradingSessionID );
    ( "625" , opt encode_string msg.f_BidCompRspGrp_TradingSessionSubID );
    ( "58" , opt encode_string msg.f_BidCompRspGrp_Text );
    ( "354" , opt encode_int msg.f_BidCompRspGrp_EncodedTextLen );
    ( "355" , opt encode_string msg.f_BidCompRspGrp_EncodedText );
    ]
;;

let encode_Instrument msg =
    [
    ( "55" , opt encode_string msg.f_Instrument_Symbol );
    ( "65" , opt encode_string msg.f_Instrument_SymbolSfx );
    ( "48" , opt encode_string msg.f_Instrument_SecurityID );
    ( "22" , opt encode_SecurityIDSource msg.f_Instrument_SecurityIDSource );
    ( "460" , opt encode_Product msg.f_Instrument_Product );
    ( "461" , opt encode_string msg.f_Instrument_CFICode );
    ( "167" , opt encode_SecurityType msg.f_Instrument_SecurityType );
    ( "762" , opt encode_string msg.f_Instrument_SecuritySubType );
    ( "200" , opt encode_MonthYear msg.f_Instrument_MaturityMonthYear );
    ( "541" , opt encode_LocalMktDate msg.f_Instrument_MaturityDate );
    ( "224" , opt encode_LocalMktDate msg.f_Instrument_CouponPaymentDate );
    ( "225" , opt encode_LocalMktDate msg.f_Instrument_IssueDate );
    ( "239" , opt encode_string msg.f_Instrument_RepoCollateralSecurityType );
    ( "226" , opt encode_int msg.f_Instrument_RepurchaseTerm );
    ( "227" , opt encode_float_4 msg.f_Instrument_RepurchaseRate );
    ( "228" , opt encode_float_4 msg.f_Instrument_Factor );
    ( "255" , opt encode_string msg.f_Instrument_CreditRating );
    ( "543" , opt encode_string msg.f_Instrument_InstrRegistry );
    ( "470" , opt encode_Country msg.f_Instrument_CountryOfIssue );
    ( "471" , opt encode_string msg.f_Instrument_StateOrProvinceOfIssue );
    ( "472" , opt encode_string msg.f_Instrument_LocaleOfIssue );
    ( "240" , opt encode_LocalMktDate msg.f_Instrument_RedemptionDate );
    ( "202" , opt encode_float_4 msg.f_Instrument_StrikePrice );
    ( "947" , opt encode_Currency msg.f_Instrument_StrikeCurrency );
    ( "206" , opt encode_char msg.f_Instrument_OptAttribute );
    ( "231" , opt encode_float_4 msg.f_Instrument_ContractMultiplier );
    ( "223" , opt encode_float_4 msg.f_Instrument_CouponRate );
    ( "207" , opt encode_Exchange msg.f_Instrument_SecurityExchange );
    ( "106" , opt encode_string msg.f_Instrument_Issuer );
    ( "348" , opt encode_int msg.f_Instrument_EncodedIssuerLen );
    ( "349" , opt encode_string msg.f_Instrument_EncodedIssuer );
    ( "107" , opt encode_string msg.f_Instrument_SecurityDesc );
    ( "350" , opt encode_int msg.f_Instrument_EncodedSecurityDescLen );
    ( "351" , opt encode_string msg.f_Instrument_EncodedSecurityDesc );
    ( "691" , opt encode_string msg.f_Instrument_Pool );
    ( "667" , opt encode_MonthYear msg.f_Instrument_ContractSettlMonth );
    ( "875" , opt encode_CPProgram msg.f_Instrument_CPProgram );
    ( "876" , opt encode_string msg.f_Instrument_CPRegType );
    ( "873" , opt encode_LocalMktDate msg.f_Instrument_DatedDate );
    ( "874" , opt encode_LocalMktDate msg.f_Instrument_InterestAccrualDate );
    ]
    @ repeat encode_SecAltIDGrp "454" msg.f_Instrument_SecAltIDGrp
    @ repeat encode_EvntGrp "864" msg.f_Instrument_EvntGrp
;;

let encode_NestedParties3 msg =
    [
    ( "948" , opt encode_int msg.f_NestedParties3_NoNested3PartyIDs );
    ( "949" , opt encode_string msg.f_NestedParties3_Nested3PartyID );
    ( "950" , opt encode_char msg.f_NestedParties3_Nested3PartyIDSource );
    ( "951" , opt encode_int msg.f_NestedParties3_Nested3PartyRole );
    ]
    @ repeat encode_NstdPtys3SubGrp "952" msg.f_NestedParties3_NstdPtys3SubGrp
;;

let encode_InstrumentLeg msg =
    [
    ( "600" , opt encode_string msg.f_InstrumentLeg_LegSymbol );
    ( "601" , opt encode_string msg.f_InstrumentLeg_LegSymbolSfx );
    ( "602" , opt encode_string msg.f_InstrumentLeg_LegSecurityID );
    ( "603" , opt encode_string msg.f_InstrumentLeg_LegSecurityIDSource );
    ( "607" , opt encode_int msg.f_InstrumentLeg_LegProduct );
    ( "608" , opt encode_string msg.f_InstrumentLeg_LegCFICode );
    ( "609" , opt encode_string msg.f_InstrumentLeg_LegSecurityType );
    ( "764" , opt encode_string msg.f_InstrumentLeg_LegSecuritySubType );
    ( "610" , opt encode_MonthYear msg.f_InstrumentLeg_LegMaturityMonthYear );
    ( "611" , opt encode_LocalMktDate msg.f_InstrumentLeg_LegMaturityDate );
    ( "248" , opt encode_LocalMktDate msg.f_InstrumentLeg_LegCouponPaymentDate );
    ( "249" , opt encode_LocalMktDate msg.f_InstrumentLeg_LegIssueDate );
    ( "250" , opt encode_string msg.f_InstrumentLeg_LegRepoCollateralSecurityType );
    ( "251" , opt encode_int msg.f_InstrumentLeg_LegRepurchaseTerm );
    ( "252" , opt encode_float_4 msg.f_InstrumentLeg_LegRepurchaseRate );
    ( "253" , opt encode_float_4 msg.f_InstrumentLeg_LegFactor );
    ( "257" , opt encode_string msg.f_InstrumentLeg_LegCreditRating );
    ( "599" , opt encode_string msg.f_InstrumentLeg_LegInstrRegistry );
    ( "596" , opt encode_Country msg.f_InstrumentLeg_LegCountryOfIssue );
    ( "597" , opt encode_string msg.f_InstrumentLeg_LegStateOrProvinceOfIssue );
    ( "598" , opt encode_string msg.f_InstrumentLeg_LegLocaleOfIssue );
    ( "254" , opt encode_LocalMktDate msg.f_InstrumentLeg_LegRedemptionDate );
    ( "612" , opt encode_float_4 msg.f_InstrumentLeg_LegStrikePrice );
    ( "942" , opt encode_Currency msg.f_InstrumentLeg_LegStrikeCurrency );
    ( "613" , opt encode_char msg.f_InstrumentLeg_LegOptAttribute );
    ( "614" , opt encode_float_4 msg.f_InstrumentLeg_LegContractMultiplier );
    ( "615" , opt encode_float_4 msg.f_InstrumentLeg_LegCouponRate );
    ( "616" , opt encode_Exchange msg.f_InstrumentLeg_LegSecurityExchange );
    ( "617" , opt encode_string msg.f_InstrumentLeg_LegIssuer );
    ( "618" , opt encode_int msg.f_InstrumentLeg_EncodedLegIssuerLen );
    ( "619" , opt encode_string msg.f_InstrumentLeg_EncodedLegIssuer );
    ( "620" , opt encode_string msg.f_InstrumentLeg_LegSecurityDesc );
    ( "621" , opt encode_int msg.f_InstrumentLeg_EncodedLegSecurityDescLen );
    ( "622" , opt encode_string msg.f_InstrumentLeg_EncodedLegSecurityDesc );
    ( "623" , opt encode_float_4 msg.f_InstrumentLeg_LegRatioQty );
    ( "624" , opt encode_char msg.f_InstrumentLeg_LegSide );
    ( "556" , opt encode_Currency msg.f_InstrumentLeg_LegCurrency );
    ( "740" , opt encode_string msg.f_InstrumentLeg_LegPool );
    ( "739" , opt encode_LocalMktDate msg.f_InstrumentLeg_LegDatedDate );
    ( "955" , opt encode_MonthYear msg.f_InstrumentLeg_LegContractSettlMonth );
    ( "956" , opt encode_LocalMktDate msg.f_InstrumentLeg_LegInterestAccrualDate );
    ]
    @ repeat encode_LegSecAltIDGrp "604" msg.f_InstrumentLeg_LegSecAltIDGrp
;;

let encode_InstrmtLegExecGrp msg =
    encode_InstrumentLeg msg.f_InstrmtLegExecGrp_InstrumentLeg @
    [
    ( "555" , opt encode_int msg.f_InstrmtLegExecGrp_NoLegs );
    ( "687" , opt encode_float_4 msg.f_InstrmtLegExecGrp_LegQty );
    ( "690" , opt encode_LegSwapType msg.f_InstrmtLegExecGrp_LegSwapType );
    ( "564" , opt encode_char msg.f_InstrmtLegExecGrp_LegPositionEffect );
    ( "565" , opt encode_int msg.f_InstrmtLegExecGrp_LegCoveredOrUncovered );
    ( "654" , opt encode_string msg.f_InstrmtLegExecGrp_LegRefID );
    ( "566" , opt encode_float_4 msg.f_InstrmtLegExecGrp_LegPrice );
    ( "587" , opt encode_char msg.f_InstrmtLegExecGrp_LegSettlType );
    ( "588" , opt encode_LocalMktDate msg.f_InstrmtLegExecGrp_LegSettlDate );
    ( "637" , opt encode_float_4 msg.f_InstrmtLegExecGrp_LegLastPx );
    ]
    @ repeat encode_LegStipulations "683" msg.f_InstrmtLegExecGrp_LegStipulations
    @ repeat encode_NestedParties "539" msg.f_InstrmtLegExecGrp_NestedParties
;;

let encode_UndInstrmtStrkPxGrp msg =
    encode_UnderlyingInstrument msg.f_UndInstrmtStrkPxGrp_UnderlyingInstrument @
    [
    ( "711" , opt encode_int msg.f_UndInstrmtStrkPxGrp_NoUnderlyings );
    ( "140" , opt encode_float_4 msg.f_UndInstrmtStrkPxGrp_PrevClosePx );
    ( "11" , opt encode_string msg.f_UndInstrmtStrkPxGrp_ClOrdID );
    ( "526" , opt encode_string msg.f_UndInstrmtStrkPxGrp_SecondaryClOrdID );
    ( "54" , opt encode_Side msg.f_UndInstrmtStrkPxGrp_Side );
    ( "44" , req encode_float_4 msg.f_UndInstrmtStrkPxGrp_Price );
    ( "15" , opt encode_Currency msg.f_UndInstrmtStrkPxGrp_Currency );
    ( "58" , opt encode_string msg.f_UndInstrmtStrkPxGrp_Text );
    ( "354" , opt encode_int msg.f_UndInstrmtStrkPxGrp_EncodedTextLen );
    ( "355" , opt encode_string msg.f_UndInstrmtStrkPxGrp_EncodedText );
    ]
;;

let encode_PreAllocMlegGrp msg =
    [
    ( "78" , opt encode_int msg.f_PreAllocMlegGrp_NoAllocs );
    ( "79" , opt encode_string msg.f_PreAllocMlegGrp_AllocAccount );
    ( "661" , opt encode_int msg.f_PreAllocMlegGrp_AllocAcctIDSource );
    ( "736" , opt encode_Currency msg.f_PreAllocMlegGrp_AllocSettlCurrency );
    ( "467" , opt encode_string msg.f_PreAllocMlegGrp_IndividualAllocID );
    ( "80" , opt encode_float_4 msg.f_PreAllocMlegGrp_AllocQty );
    ]
    @ repeat encode_NestedParties3 "948" msg.f_PreAllocMlegGrp_NestedParties3
;;

let encode_LegQuotGrp msg =
    encode_InstrumentLeg msg.f_LegQuotGrp_InstrumentLeg @
    encode_LegBenchmarkCurveData msg.f_LegQuotGrp_LegBenchmarkCurveData @
    [
    ( "555" , opt encode_int msg.f_LegQuotGrp_NoLegs );
    ( "687" , opt encode_float_4 msg.f_LegQuotGrp_LegQty );
    ( "690" , opt encode_LegSwapType msg.f_LegQuotGrp_LegSwapType );
    ( "587" , opt encode_char msg.f_LegQuotGrp_LegSettlType );
    ( "588" , opt encode_LocalMktDate msg.f_LegQuotGrp_LegSettlDate );
    ( "686" , opt encode_int msg.f_LegQuotGrp_LegPriceType );
    ( "681" , opt encode_float_4 msg.f_LegQuotGrp_LegBidPx );
    ( "684" , opt encode_float_4 msg.f_LegQuotGrp_LegOfferPx );
    ]
    @ repeat encode_LegStipulations "683" msg.f_LegQuotGrp_LegStipulations
    @ repeat encode_NestedParties "539" msg.f_LegQuotGrp_NestedParties
;;

let encode_LegQuotStatGrp msg =
    encode_InstrumentLeg msg.f_LegQuotStatGrp_InstrumentLeg @
    [
    ( "555" , opt encode_int msg.f_LegQuotStatGrp_NoLegs );
    ( "687" , opt encode_float_4 msg.f_LegQuotStatGrp_LegQty );
    ( "690" , opt encode_LegSwapType msg.f_LegQuotStatGrp_LegSwapType );
    ( "587" , opt encode_char msg.f_LegQuotStatGrp_LegSettlType );
    ( "588" , opt encode_LocalMktDate msg.f_LegQuotStatGrp_LegSettlDate );
    ]
    @ repeat encode_LegStipulations "683" msg.f_LegQuotStatGrp_LegStipulations
    @ repeat encode_NestedParties "539" msg.f_LegQuotStatGrp_NestedParties
;;

let encode_TrdAllocGrp msg =
    [
    ( "78" , opt encode_int msg.f_TrdAllocGrp_NoAllocs );
    ( "79" , opt encode_string msg.f_TrdAllocGrp_AllocAccount );
    ( "661" , opt encode_int msg.f_TrdAllocGrp_AllocAcctIDSource );
    ( "736" , opt encode_Currency msg.f_TrdAllocGrp_AllocSettlCurrency );
    ( "467" , opt encode_string msg.f_TrdAllocGrp_IndividualAllocID );
    ( "80" , opt encode_float_4 msg.f_TrdAllocGrp_AllocQty );
    ]
    @ repeat encode_NestedParties2 "756" msg.f_TrdAllocGrp_NestedParties2
;;

let encode_SideCrossOrdCxlGrp msg =
    encode_OrderQtyData msg.f_SideCrossOrdCxlGrp_OrderQtyData @
    [
    ( "552" , req encode_int msg.f_SideCrossOrdCxlGrp_NoSides );
    ( "54" , req encode_Side msg.f_SideCrossOrdCxlGrp_Side );
    ( "41" , req encode_string msg.f_SideCrossOrdCxlGrp_OrigClOrdID );
    ( "11" , req encode_string msg.f_SideCrossOrdCxlGrp_ClOrdID );
    ( "526" , opt encode_string msg.f_SideCrossOrdCxlGrp_SecondaryClOrdID );
    ( "583" , opt encode_string msg.f_SideCrossOrdCxlGrp_ClOrdLinkID );
    ( "586" , opt encode_UTCTimestamp msg.f_SideCrossOrdCxlGrp_OrigOrdModTime );
    ( "229" , opt encode_LocalMktDate msg.f_SideCrossOrdCxlGrp_TradeOriginationDate );
    ( "75" , opt encode_LocalMktDate msg.f_SideCrossOrdCxlGrp_TradeDate );
    ( "376" , opt encode_string msg.f_SideCrossOrdCxlGrp_ComplianceID );
    ( "58" , opt encode_string msg.f_SideCrossOrdCxlGrp_Text );
    ( "354" , opt encode_int msg.f_SideCrossOrdCxlGrp_EncodedTextLen );
    ( "355" , opt encode_string msg.f_SideCrossOrdCxlGrp_EncodedText );
    ]
    @ repeat encode_Parties "453" msg.f_SideCrossOrdCxlGrp_Parties
;;

let encode_InstrmtStrkPxGrp msg =
    encode_Instrument msg.f_InstrmtStrkPxGrp_Instrument @
    [
    ( "428" , req encode_int msg.f_InstrmtStrkPxGrp_NoStrikes );
    ]
;;

let encode_OrdAllocGrp msg =
    [
    ( "73" , opt encode_int msg.f_OrdAllocGrp_NoOrders );
    ( "11" , opt encode_string msg.f_OrdAllocGrp_ClOrdID );
    ( "37" , opt encode_string msg.f_OrdAllocGrp_OrderID );
    ( "198" , opt encode_string msg.f_OrdAllocGrp_SecondaryOrderID );
    ( "526" , opt encode_string msg.f_OrdAllocGrp_SecondaryClOrdID );
    ( "66" , opt encode_string msg.f_OrdAllocGrp_ListID );
    ( "38" , opt encode_float_4 msg.f_OrdAllocGrp_OrderQty );
    ( "799" , opt encode_float_4 msg.f_OrdAllocGrp_OrderAvgPx );
    ( "800" , opt encode_float_4 msg.f_OrdAllocGrp_OrderBookingQty );
    ]
    @ repeat encode_NestedParties2 "756" msg.f_OrdAllocGrp_NestedParties2
;;

let encode_DlvyInstGrp msg =
    [
    ( "85" , opt encode_int msg.f_DlvyInstGrp_NoDlvyInst );
    ( "165" , opt encode_SettlInstSource msg.f_DlvyInstGrp_SettlInstSource );
    ( "787" , opt encode_DlvyInstType msg.f_DlvyInstGrp_DlvyInstType );
    ]
    @ repeat encode_SettlParties "781" msg.f_DlvyInstGrp_SettlParties
;;

let encode_PosUndInstrmtGrp msg =
    encode_UnderlyingInstrument msg.f_PosUndInstrmtGrp_UnderlyingInstrument @
    [
    ( "711" , opt encode_int msg.f_PosUndInstrmtGrp_NoUnderlyings );
    ( "732" , req encode_float_4 msg.f_PosUndInstrmtGrp_UnderlyingSettlPrice );
    ( "733" , req encode_int msg.f_PosUndInstrmtGrp_UnderlyingSettlPriceType );
    ]
;;

let encode_InstrmtGrp msg =
    encode_Instrument msg.f_InstrmtGrp_Instrument @
    [
    ( "146" , opt encode_int msg.f_InstrmtGrp_NoRelatedSym );
    ]
;;

let encode_PositionQty msg =
    [
    ( "702" , opt encode_int msg.f_PositionQty_NoPositions );
    ( "703" , opt encode_PosType msg.f_PositionQty_PosType );
    ( "704" , opt encode_float_4 msg.f_PositionQty_LongQty );
    ( "705" , opt encode_float_4 msg.f_PositionQty_ShortQty );
    ( "706" , opt encode_PosQtyStatus msg.f_PositionQty_PosQtyStatus );
    ]
    @ repeat encode_NestedParties "539" msg.f_PositionQty_NestedParties
;;

let encode_InstrmtLegSecListGrp msg =
    encode_InstrumentLeg msg.f_InstrmtLegSecListGrp_InstrumentLeg @
    encode_LegBenchmarkCurveData msg.f_InstrmtLegSecListGrp_LegBenchmarkCurveData @
    [
    ( "555" , opt encode_int msg.f_InstrmtLegSecListGrp_NoLegs );
    ( "690" , opt encode_LegSwapType msg.f_InstrmtLegSecListGrp_LegSwapType );
    ( "587" , opt encode_char msg.f_InstrmtLegSecListGrp_LegSettlType );
    ]
    @ repeat encode_LegStipulations "683" msg.f_InstrmtLegSecListGrp_LegStipulations
;;

let encode_UndInstrmtGrp msg =
    encode_UnderlyingInstrument msg.f_UndInstrmtGrp_UnderlyingInstrument @
    [
    ( "711" , opt encode_int msg.f_UndInstrmtGrp_NoUnderlyings );
    ]
;;

let encode_QuotReqLegsGrp msg =
    encode_InstrumentLeg msg.f_QuotReqLegsGrp_InstrumentLeg @
    encode_LegBenchmarkCurveData msg.f_QuotReqLegsGrp_LegBenchmarkCurveData @
    [
    ( "555" , opt encode_int msg.f_QuotReqLegsGrp_NoLegs );
    ( "687" , opt encode_float_4 msg.f_QuotReqLegsGrp_LegQty );
    ( "690" , opt encode_LegSwapType msg.f_QuotReqLegsGrp_LegSwapType );
    ( "587" , opt encode_char msg.f_QuotReqLegsGrp_LegSettlType );
    ( "588" , opt encode_LocalMktDate msg.f_QuotReqLegsGrp_LegSettlDate );
    ]
    @ repeat encode_LegStipulations "683" msg.f_QuotReqLegsGrp_LegStipulations
    @ repeat encode_NestedParties "539" msg.f_QuotReqLegsGrp_NestedParties
;;

let encode_RgstDtlsGrp msg =
    [
    ( "473" , opt encode_int msg.f_RgstDtlsGrp_NoRegistDtls );
    ( "509" , opt encode_string msg.f_RgstDtlsGrp_RegistDtls );
    ( "511" , opt encode_string msg.f_RgstDtlsGrp_RegistEmail );
    ( "474" , opt encode_string msg.f_RgstDtlsGrp_MailingDtls );
    ( "482" , opt encode_string msg.f_RgstDtlsGrp_MailingInst );
    ( "522" , opt encode_OwnerType msg.f_RgstDtlsGrp_OwnerType );
    ( "486" , opt encode_LocalMktDate msg.f_RgstDtlsGrp_DateOfBirth );
    ( "475" , opt encode_Country msg.f_RgstDtlsGrp_InvestorCountryOfResidence );
    ]
    @ repeat encode_NestedParties "539" msg.f_RgstDtlsGrp_NestedParties
;;

let encode_TrdInstrmtLegGrp msg =
    encode_InstrumentLeg msg.f_TrdInstrmtLegGrp_InstrumentLeg @
    [
    ( "555" , opt encode_int msg.f_TrdInstrmtLegGrp_NoLegs );
    ( "687" , opt encode_float_4 msg.f_TrdInstrmtLegGrp_LegQty );
    ( "690" , opt encode_LegSwapType msg.f_TrdInstrmtLegGrp_LegSwapType );
    ( "564" , opt encode_char msg.f_TrdInstrmtLegGrp_LegPositionEffect );
    ( "565" , opt encode_int msg.f_TrdInstrmtLegGrp_LegCoveredOrUncovered );
    ( "654" , opt encode_string msg.f_TrdInstrmtLegGrp_LegRefID );
    ( "566" , opt encode_float_4 msg.f_TrdInstrmtLegGrp_LegPrice );
    ( "587" , opt encode_char msg.f_TrdInstrmtLegGrp_LegSettlType );
    ( "588" , opt encode_LocalMktDate msg.f_TrdInstrmtLegGrp_LegSettlDate );
    ( "637" , opt encode_float_4 msg.f_TrdInstrmtLegGrp_LegLastPx );
    ]
    @ repeat encode_LegStipulations "683" msg.f_TrdInstrmtLegGrp_LegStipulations
    @ repeat encode_NestedParties "539" msg.f_TrdInstrmtLegGrp_NestedParties
;;

let encode_UndInstrmtCollGrp msg =
    encode_UnderlyingInstrument msg.f_UndInstrmtCollGrp_UnderlyingInstrument @
    [
    ( "711" , opt encode_int msg.f_UndInstrmtCollGrp_NoUnderlyings );
    ( "944" , opt encode_CollAction msg.f_UndInstrmtCollGrp_CollAction );
    ]
;;

let encode_InstrmtLegIOIGrp msg =
    encode_InstrumentLeg msg.f_InstrmtLegIOIGrp_InstrumentLeg @
    [
    ( "555" , opt encode_int msg.f_InstrmtLegIOIGrp_NoLegs );
    ( "682" , opt encode_string msg.f_InstrmtLegIOIGrp_LegIOIQty );
    ]
    @ repeat encode_LegStipulations "683" msg.f_InstrmtLegIOIGrp_LegStipulations
;;

let encode_LegPreAllocGrp msg =
    [
    ( "670" , opt encode_int msg.f_LegPreAllocGrp_NoLegAllocs );
    ( "671" , opt encode_string msg.f_LegPreAllocGrp_LegAllocAccount );
    ( "672" , opt encode_string msg.f_LegPreAllocGrp_LegIndividualAllocID );
    ( "673" , opt encode_float_4 msg.f_LegPreAllocGrp_LegAllocQty );
    ( "674" , opt encode_string msg.f_LegPreAllocGrp_LegAllocAcctIDSource );
    ( "675" , opt encode_Currency msg.f_LegPreAllocGrp_LegSettlCurrency );
    ]
    @ repeat encode_NestedParties2 "756" msg.f_LegPreAllocGrp_NestedParties2
;;

let encode_PreAllocGrp msg =
    [
    ( "78" , opt encode_int msg.f_PreAllocGrp_NoAllocs );
    ( "79" , opt encode_string msg.f_PreAllocGrp_AllocAccount );
    ( "661" , opt encode_int msg.f_PreAllocGrp_AllocAcctIDSource );
    ( "736" , opt encode_Currency msg.f_PreAllocGrp_AllocSettlCurrency );
    ( "467" , opt encode_string msg.f_PreAllocGrp_IndividualAllocID );
    ( "80" , opt encode_float_4 msg.f_PreAllocGrp_AllocQty );
    ]
    @ repeat encode_NestedParties "539" msg.f_PreAllocGrp_NestedParties
;;

let encode_InstrmtLegGrp msg =
    encode_InstrumentLeg msg.f_InstrmtLegGrp_InstrumentLeg @
    [
    ( "555" , opt encode_int msg.f_InstrmtLegGrp_NoLegs );
    ]
;;

let encode_RFQReqGrp msg =
    encode_Instrument msg.f_RFQReqGrp_Instrument @
    [
    ( "146" , req encode_int msg.f_RFQReqGrp_NoRelatedSym );
    ( "140" , opt encode_float_4 msg.f_RFQReqGrp_PrevClosePx );
    ( "303" , opt encode_QuoteRequestType msg.f_RFQReqGrp_QuoteRequestType );
    ( "537" , opt encode_QuoteType msg.f_RFQReqGrp_QuoteType );
    ( "336" , opt encode_string msg.f_RFQReqGrp_TradingSessionID );
    ( "625" , opt encode_string msg.f_RFQReqGrp_TradingSessionSubID );
    ]
    @ repeat encode_UndInstrmtGrp "711" msg.f_RFQReqGrp_UndInstrmtGrp
    @ repeat encode_InstrmtLegGrp "555" msg.f_RFQReqGrp_InstrmtLegGrp
;;

let encode_MDIncGrp msg =
    encode_Instrument msg.f_MDIncGrp_Instrument @
    [
    ( "268" , req encode_int msg.f_MDIncGrp_NoMDEntries );
    ( "279" , req encode_MDUpdateAction msg.f_MDIncGrp_MDUpdateAction );
    ( "285" , opt encode_DeleteReason msg.f_MDIncGrp_DeleteReason );
    ( "269" , opt encode_MDEntryType msg.f_MDIncGrp_MDEntryType );
    ( "278" , opt encode_string msg.f_MDIncGrp_MDEntryID );
    ( "280" , opt encode_string msg.f_MDIncGrp_MDEntryRefID );
    ( "291" , opt encode_FinancialStatus msg.f_MDIncGrp_FinancialStatus );
    ( "292" , opt encode_CorporateAction msg.f_MDIncGrp_CorporateAction );
    ( "270" , opt encode_float_4 msg.f_MDIncGrp_MDEntryPx );
    ( "15" , opt encode_Currency msg.f_MDIncGrp_Currency );
    ( "271" , opt encode_float_4 msg.f_MDIncGrp_MDEntrySize );
    ( "272" , opt encode_UTCDateOnly msg.f_MDIncGrp_MDEntryDate );
    ( "273" , opt encode_UTCTimeOnly msg.f_MDIncGrp_MDEntryTime );
    ( "274" , opt encode_TickDirection msg.f_MDIncGrp_TickDirection );
    ( "275" , opt encode_Exchange msg.f_MDIncGrp_MDMkt );
    ( "336" , opt encode_string msg.f_MDIncGrp_TradingSessionID );
    ( "625" , opt encode_string msg.f_MDIncGrp_TradingSessionSubID );
    ( "276" , opt encode_QuoteCondition msg.f_MDIncGrp_QuoteCondition );
    ( "277" , opt encode_TradeCondition msg.f_MDIncGrp_TradeCondition );
    ( "282" , opt encode_string msg.f_MDIncGrp_MDEntryOriginator );
    ( "283" , opt encode_string msg.f_MDIncGrp_LocationID );
    ( "284" , opt encode_string msg.f_MDIncGrp_DeskID );
    ( "286" , opt encode_OpenCloseSettlFlag msg.f_MDIncGrp_OpenCloseSettlFlag );
    ( "59" , opt encode_TimeInForce msg.f_MDIncGrp_TimeInForce );
    ( "432" , opt encode_LocalMktDate msg.f_MDIncGrp_ExpireDate );
    ( "126" , opt encode_UTCTimestamp msg.f_MDIncGrp_ExpireTime );
    ( "110" , opt encode_float_4 msg.f_MDIncGrp_MinQty );
    ( "18" , opt encode_ExecInst msg.f_MDIncGrp_ExecInst );
    ( "287" , opt encode_int msg.f_MDIncGrp_SellerDays );
    ( "37" , opt encode_string msg.f_MDIncGrp_OrderID );
    ( "299" , opt encode_string msg.f_MDIncGrp_QuoteEntryID );
    ( "288" , opt encode_string msg.f_MDIncGrp_MDEntryBuyer );
    ( "289" , opt encode_string msg.f_MDIncGrp_MDEntrySeller );
    ( "346" , opt encode_int msg.f_MDIncGrp_NumberOfOrders );
    ( "290" , opt encode_int msg.f_MDIncGrp_MDEntryPositionNo );
    ( "546" , opt encode_Scope msg.f_MDIncGrp_Scope );
    ( "811" , opt encode_float_4 msg.f_MDIncGrp_PriceDelta );
    ( "451" , opt encode_float_4 msg.f_MDIncGrp_NetChgPrevDay );
    ( "58" , opt encode_string msg.f_MDIncGrp_Text );
    ( "354" , opt encode_int msg.f_MDIncGrp_EncodedTextLen );
    ( "355" , opt encode_string msg.f_MDIncGrp_EncodedText );
    ]
    @ repeat encode_UndInstrmtGrp "711" msg.f_MDIncGrp_UndInstrmtGrp
    @ repeat encode_InstrmtLegGrp "555" msg.f_MDIncGrp_InstrmtLegGrp
;;

let encode_QuotEntryGrp msg =
    encode_Instrument msg.f_QuotEntryGrp_Instrument @
    [
    ( "295" , req encode_int msg.f_QuotEntryGrp_NoQuoteEntries );
    ( "299" , req encode_string msg.f_QuotEntryGrp_QuoteEntryID );
    ( "132" , opt encode_float_4 msg.f_QuotEntryGrp_BidPx );
    ( "133" , opt encode_float_4 msg.f_QuotEntryGrp_OfferPx );
    ( "134" , opt encode_float_4 msg.f_QuotEntryGrp_BidSize );
    ( "135" , opt encode_float_4 msg.f_QuotEntryGrp_OfferSize );
    ( "62" , opt encode_UTCTimestamp msg.f_QuotEntryGrp_ValidUntilTime );
    ( "188" , opt encode_float_4 msg.f_QuotEntryGrp_BidSpotRate );
    ( "190" , opt encode_float_4 msg.f_QuotEntryGrp_OfferSpotRate );
    ( "189" , opt encode_float_4 msg.f_QuotEntryGrp_BidForwardPoints );
    ( "191" , opt encode_float_4 msg.f_QuotEntryGrp_OfferForwardPoints );
    ( "631" , opt encode_float_4 msg.f_QuotEntryGrp_MidPx );
    ( "632" , opt encode_float_4 msg.f_QuotEntryGrp_BidYield );
    ( "633" , opt encode_float_4 msg.f_QuotEntryGrp_MidYield );
    ( "634" , opt encode_float_4 msg.f_QuotEntryGrp_OfferYield );
    ( "60" , opt encode_UTCTimestamp msg.f_QuotEntryGrp_TransactTime );
    ( "336" , opt encode_string msg.f_QuotEntryGrp_TradingSessionID );
    ( "625" , opt encode_string msg.f_QuotEntryGrp_TradingSessionSubID );
    ( "64" , opt encode_LocalMktDate msg.f_QuotEntryGrp_SettlDate );
    ( "40" , opt encode_OrdType msg.f_QuotEntryGrp_OrdType );
    ( "193" , opt encode_LocalMktDate msg.f_QuotEntryGrp_SettlDate2 );
    ( "192" , opt encode_float_4 msg.f_QuotEntryGrp_OrderQty2 );
    ( "642" , opt encode_float_4 msg.f_QuotEntryGrp_BidForwardPoints2 );
    ( "643" , opt encode_float_4 msg.f_QuotEntryGrp_OfferForwardPoints2 );
    ( "15" , opt encode_Currency msg.f_QuotEntryGrp_Currency );
    ]
    @ repeat encode_InstrmtLegGrp "555" msg.f_QuotEntryGrp_InstrmtLegGrp
;;

let encode_SettlInstructionsData msg =
    [
    ( "172" , opt encode_SettlDeliveryType msg.f_SettlInstructionsData_SettlDeliveryType );
    ( "169" , opt encode_StandInstDbType msg.f_SettlInstructionsData_StandInstDbType );
    ( "170" , opt encode_string msg.f_SettlInstructionsData_StandInstDbName );
    ( "171" , opt encode_string msg.f_SettlInstructionsData_StandInstDbID );
    ]
    @ repeat encode_DlvyInstGrp "85" msg.f_SettlInstructionsData_DlvyInstGrp
;;

let encode_LegOrdGrp msg =
    encode_InstrumentLeg msg.f_LegOrdGrp_InstrumentLeg @
    [
    ( "555" , req encode_int msg.f_LegOrdGrp_NoLegs );
    ( "687" , opt encode_float_4 msg.f_LegOrdGrp_LegQty );
    ( "690" , opt encode_LegSwapType msg.f_LegOrdGrp_LegSwapType );
    ( "564" , opt encode_char msg.f_LegOrdGrp_LegPositionEffect );
    ( "565" , opt encode_int msg.f_LegOrdGrp_LegCoveredOrUncovered );
    ( "654" , opt encode_string msg.f_LegOrdGrp_LegRefID );
    ( "566" , opt encode_float_4 msg.f_LegOrdGrp_LegPrice );
    ( "587" , opt encode_char msg.f_LegOrdGrp_LegSettlType );
    ( "588" , opt encode_LocalMktDate msg.f_LegOrdGrp_LegSettlDate );
    ]
    @ repeat encode_LegStipulations "683" msg.f_LegOrdGrp_LegStipulations
    @ repeat encode_LegPreAllocGrp "670" msg.f_LegOrdGrp_LegPreAllocGrp
    @ repeat encode_NestedParties "539" msg.f_LegOrdGrp_NestedParties
;;

let encode_InstrmtMDReqGrp msg =
    encode_Instrument msg.f_InstrmtMDReqGrp_Instrument @
    [
    ( "146" , req encode_int msg.f_InstrmtMDReqGrp_NoRelatedSym );
    ]
    @ repeat encode_UndInstrmtGrp "711" msg.f_InstrmtMDReqGrp_UndInstrmtGrp
    @ repeat encode_InstrmtLegGrp "555" msg.f_InstrmtMDReqGrp_InstrmtLegGrp
;;

let encode_SideCrossOrdModGrp msg =
    encode_OrderQtyData msg.f_SideCrossOrdModGrp_OrderQtyData @
    encode_CommissionData msg.f_SideCrossOrdModGrp_CommissionData @
    [
    ( "552" , req encode_int msg.f_SideCrossOrdModGrp_NoSides );
    ( "54" , req encode_Side msg.f_SideCrossOrdModGrp_Side );
    ( "11" , req encode_string msg.f_SideCrossOrdModGrp_ClOrdID );
    ( "526" , opt encode_string msg.f_SideCrossOrdModGrp_SecondaryClOrdID );
    ( "583" , opt encode_string msg.f_SideCrossOrdModGrp_ClOrdLinkID );
    ( "229" , opt encode_LocalMktDate msg.f_SideCrossOrdModGrp_TradeOriginationDate );
    ( "75" , opt encode_LocalMktDate msg.f_SideCrossOrdModGrp_TradeDate );
    ( "1" , opt encode_string msg.f_SideCrossOrdModGrp_Account );
    ( "660" , opt encode_AcctIDSource msg.f_SideCrossOrdModGrp_AcctIDSource );
    ( "581" , opt encode_AccountType msg.f_SideCrossOrdModGrp_AccountType );
    ( "589" , opt encode_DayBookingInst msg.f_SideCrossOrdModGrp_DayBookingInst );
    ( "590" , opt encode_BookingUnit msg.f_SideCrossOrdModGrp_BookingUnit );
    ( "591" , opt encode_PreallocMethod msg.f_SideCrossOrdModGrp_PreallocMethod );
    ( "70" , opt encode_string msg.f_SideCrossOrdModGrp_AllocID );
    ( "854" , opt encode_QtyType msg.f_SideCrossOrdModGrp_QtyType );
    ( "528" , opt encode_OrderCapacity msg.f_SideCrossOrdModGrp_OrderCapacity );
    ( "529" , opt encode_OrderRestrictions msg.f_SideCrossOrdModGrp_OrderRestrictions );
    ( "582" , opt encode_CustOrderCapacity msg.f_SideCrossOrdModGrp_CustOrderCapacity );
    ( "121" , opt encode_ForexReq msg.f_SideCrossOrdModGrp_ForexReq );
    ( "120" , opt encode_Currency msg.f_SideCrossOrdModGrp_SettlCurrency );
    ( "775" , opt encode_BookingType msg.f_SideCrossOrdModGrp_BookingType );
    ( "58" , opt encode_string msg.f_SideCrossOrdModGrp_Text );
    ( "354" , opt encode_int msg.f_SideCrossOrdModGrp_EncodedTextLen );
    ( "355" , opt encode_string msg.f_SideCrossOrdModGrp_EncodedText );
    ( "77" , opt encode_PositionEffect msg.f_SideCrossOrdModGrp_PositionEffect );
    ( "203" , opt encode_CoveredOrUncovered msg.f_SideCrossOrdModGrp_CoveredOrUncovered );
    ( "544" , opt encode_CashMargin msg.f_SideCrossOrdModGrp_CashMargin );
    ( "635" , opt encode_ClearingFeeIndicator msg.f_SideCrossOrdModGrp_ClearingFeeIndicator );
    ( "377" , opt encode_SolicitedFlag msg.f_SideCrossOrdModGrp_SolicitedFlag );
    ( "659" , opt encode_string msg.f_SideCrossOrdModGrp_SideComplianceID );
    ]
    @ repeat encode_Parties "453" msg.f_SideCrossOrdModGrp_Parties
    @ repeat encode_PreAllocGrp "78" msg.f_SideCrossOrdModGrp_PreAllocGrp
;;

let encode_ListOrdGrp msg =
    encode_Instrument msg.f_ListOrdGrp_Instrument @
    encode_OrderQtyData msg.f_ListOrdGrp_OrderQtyData @
    encode_SpreadOrBenchmarkCurveData msg.f_ListOrdGrp_SpreadOrBenchmarkCurveData @
    encode_YieldData msg.f_ListOrdGrp_YieldData @
    encode_CommissionData msg.f_ListOrdGrp_CommissionData @
    encode_PegInstructions msg.f_ListOrdGrp_PegInstructions @
    encode_DiscretionInstructions msg.f_ListOrdGrp_DiscretionInstructions @
    [
    ( "73" , req encode_int msg.f_ListOrdGrp_NoOrders );
    ( "11" , req encode_string msg.f_ListOrdGrp_ClOrdID );
    ( "526" , opt encode_string msg.f_ListOrdGrp_SecondaryClOrdID );
    ( "67" , req encode_int msg.f_ListOrdGrp_ListSeqNo );
    ( "583" , opt encode_string msg.f_ListOrdGrp_ClOrdLinkID );
    ( "160" , opt encode_SettlInstMode msg.f_ListOrdGrp_SettlInstMode );
    ( "229" , opt encode_LocalMktDate msg.f_ListOrdGrp_TradeOriginationDate );
    ( "75" , opt encode_LocalMktDate msg.f_ListOrdGrp_TradeDate );
    ( "1" , opt encode_string msg.f_ListOrdGrp_Account );
    ( "660" , opt encode_AcctIDSource msg.f_ListOrdGrp_AcctIDSource );
    ( "581" , opt encode_AccountType msg.f_ListOrdGrp_AccountType );
    ( "589" , opt encode_DayBookingInst msg.f_ListOrdGrp_DayBookingInst );
    ( "590" , opt encode_BookingUnit msg.f_ListOrdGrp_BookingUnit );
    ( "70" , opt encode_string msg.f_ListOrdGrp_AllocID );
    ( "591" , opt encode_PreallocMethod msg.f_ListOrdGrp_PreallocMethod );
    ( "63" , opt encode_SettlType msg.f_ListOrdGrp_SettlType );
    ( "64" , opt encode_LocalMktDate msg.f_ListOrdGrp_SettlDate );
    ( "544" , opt encode_CashMargin msg.f_ListOrdGrp_CashMargin );
    ( "635" , opt encode_ClearingFeeIndicator msg.f_ListOrdGrp_ClearingFeeIndicator );
    ( "21" , opt encode_HandlInst msg.f_ListOrdGrp_HandlInst );
    ( "18" , opt encode_ExecInst msg.f_ListOrdGrp_ExecInst );
    ( "110" , opt encode_float_4 msg.f_ListOrdGrp_MinQty );
    ( "111" , opt encode_float_4 msg.f_ListOrdGrp_MaxFloor );
    ( "100" , opt encode_Exchange msg.f_ListOrdGrp_ExDestination );
    ( "81" , opt encode_ProcessCode msg.f_ListOrdGrp_ProcessCode );
    ( "140" , opt encode_float_4 msg.f_ListOrdGrp_PrevClosePx );
    ( "54" , req encode_Side msg.f_ListOrdGrp_Side );
    ( "401" , opt encode_SideValueInd msg.f_ListOrdGrp_SideValueInd );
    ( "114" , opt encode_LocateReqd msg.f_ListOrdGrp_LocateReqd );
    ( "60" , opt encode_UTCTimestamp msg.f_ListOrdGrp_TransactTime );
    ( "854" , opt encode_QtyType msg.f_ListOrdGrp_QtyType );
    ( "40" , opt encode_OrdType msg.f_ListOrdGrp_OrdType );
    ( "423" , opt encode_PriceType msg.f_ListOrdGrp_PriceType );
    ( "44" , opt encode_float_4 msg.f_ListOrdGrp_Price );
    ( "99" , opt encode_float_4 msg.f_ListOrdGrp_StopPx );
    ( "15" , opt encode_Currency msg.f_ListOrdGrp_Currency );
    ( "376" , opt encode_string msg.f_ListOrdGrp_ComplianceID );
    ( "377" , opt encode_SolicitedFlag msg.f_ListOrdGrp_SolicitedFlag );
    ( "23" , opt encode_string msg.f_ListOrdGrp_IOIID );
    ( "117" , opt encode_string msg.f_ListOrdGrp_QuoteID );
    ( "59" , opt encode_TimeInForce msg.f_ListOrdGrp_TimeInForce );
    ( "168" , opt encode_UTCTimestamp msg.f_ListOrdGrp_EffectiveTime );
    ( "432" , opt encode_LocalMktDate msg.f_ListOrdGrp_ExpireDate );
    ( "126" , opt encode_UTCTimestamp msg.f_ListOrdGrp_ExpireTime );
    ( "427" , opt encode_GTBookingInst msg.f_ListOrdGrp_GTBookingInst );
    ( "528" , opt encode_OrderCapacity msg.f_ListOrdGrp_OrderCapacity );
    ( "529" , opt encode_OrderRestrictions msg.f_ListOrdGrp_OrderRestrictions );
    ( "582" , opt encode_CustOrderCapacity msg.f_ListOrdGrp_CustOrderCapacity );
    ( "121" , opt encode_ForexReq msg.f_ListOrdGrp_ForexReq );
    ( "120" , opt encode_Currency msg.f_ListOrdGrp_SettlCurrency );
    ( "775" , opt encode_BookingType msg.f_ListOrdGrp_BookingType );
    ( "58" , opt encode_string msg.f_ListOrdGrp_Text );
    ( "354" , opt encode_int msg.f_ListOrdGrp_EncodedTextLen );
    ( "355" , opt encode_string msg.f_ListOrdGrp_EncodedText );
    ( "193" , opt encode_LocalMktDate msg.f_ListOrdGrp_SettlDate2 );
    ( "192" , opt encode_float_4 msg.f_ListOrdGrp_OrderQty2 );
    ( "640" , opt encode_float_4 msg.f_ListOrdGrp_Price2 );
    ( "77" , opt encode_PositionEffect msg.f_ListOrdGrp_PositionEffect );
    ( "203" , opt encode_CoveredOrUncovered msg.f_ListOrdGrp_CoveredOrUncovered );
    ( "210" , opt encode_float_4 msg.f_ListOrdGrp_MaxShow );
    ( "847" , opt encode_TargetStrategy msg.f_ListOrdGrp_TargetStrategy );
    ( "848" , opt encode_string msg.f_ListOrdGrp_TargetStrategyParameters );
    ( "849" , opt encode_float_4 msg.f_ListOrdGrp_ParticipationRate );
    ( "494" , opt encode_string msg.f_ListOrdGrp_Designation );
    ]
    @ repeat encode_Parties "453" msg.f_ListOrdGrp_Parties
    @ repeat encode_PreAllocGrp "78" msg.f_ListOrdGrp_PreAllocGrp
    @ repeat encode_TrdgSesGrp "386" msg.f_ListOrdGrp_TrdgSesGrp
    @ repeat encode_UndInstrmtGrp "711" msg.f_ListOrdGrp_UndInstrmtGrp
    @ repeat encode_Stipulations "232" msg.f_ListOrdGrp_Stipulations
;;

let encode_RelSymDerivSecGrp msg =
    encode_Instrument msg.f_RelSymDerivSecGrp_Instrument @
    encode_InstrumentExtension msg.f_RelSymDerivSecGrp_InstrumentExtension @
    [
    ( "146" , opt encode_int msg.f_RelSymDerivSecGrp_NoRelatedSym );
    ( "15" , opt encode_Currency msg.f_RelSymDerivSecGrp_Currency );
    ( "827" , opt encode_ExpirationCycle msg.f_RelSymDerivSecGrp_ExpirationCycle );
    ( "336" , opt encode_string msg.f_RelSymDerivSecGrp_TradingSessionID );
    ( "625" , opt encode_string msg.f_RelSymDerivSecGrp_TradingSessionSubID );
    ( "58" , opt encode_string msg.f_RelSymDerivSecGrp_Text );
    ( "354" , opt encode_int msg.f_RelSymDerivSecGrp_EncodedTextLen );
    ( "355" , opt encode_string msg.f_RelSymDerivSecGrp_EncodedText );
    ]
    @ repeat encode_InstrmtLegGrp "555" msg.f_RelSymDerivSecGrp_InstrmtLegGrp
;;

let encode_QuotReqGrp msg =
    encode_Instrument msg.f_QuotReqGrp_Instrument @
    encode_FinancingDetails msg.f_QuotReqGrp_FinancingDetails @
    encode_OrderQtyData msg.f_QuotReqGrp_OrderQtyData @
    encode_SpreadOrBenchmarkCurveData msg.f_QuotReqGrp_SpreadOrBenchmarkCurveData @
    encode_YieldData msg.f_QuotReqGrp_YieldData @
    [
    ( "146" , req encode_int msg.f_QuotReqGrp_NoRelatedSym );
    ( "140" , opt encode_float_4 msg.f_QuotReqGrp_PrevClosePx );
    ( "303" , opt encode_QuoteRequestType msg.f_QuotReqGrp_QuoteRequestType );
    ( "537" , opt encode_QuoteType msg.f_QuotReqGrp_QuoteType );
    ( "336" , opt encode_string msg.f_QuotReqGrp_TradingSessionID );
    ( "625" , opt encode_string msg.f_QuotReqGrp_TradingSessionSubID );
    ( "229" , opt encode_LocalMktDate msg.f_QuotReqGrp_TradeOriginationDate );
    ( "54" , opt encode_Side msg.f_QuotReqGrp_Side );
    ( "854" , opt encode_QtyType msg.f_QuotReqGrp_QtyType );
    ( "63" , opt encode_SettlType msg.f_QuotReqGrp_SettlType );
    ( "64" , opt encode_LocalMktDate msg.f_QuotReqGrp_SettlDate );
    ( "193" , opt encode_LocalMktDate msg.f_QuotReqGrp_SettlDate2 );
    ( "192" , opt encode_float_4 msg.f_QuotReqGrp_OrderQty2 );
    ( "15" , opt encode_Currency msg.f_QuotReqGrp_Currency );
    ( "1" , opt encode_string msg.f_QuotReqGrp_Account );
    ( "660" , opt encode_AcctIDSource msg.f_QuotReqGrp_AcctIDSource );
    ( "581" , opt encode_AccountType msg.f_QuotReqGrp_AccountType );
    ( "692" , opt encode_QuotePriceType msg.f_QuotReqGrp_QuotePriceType );
    ( "40" , opt encode_OrdType msg.f_QuotReqGrp_OrdType );
    ( "62" , opt encode_UTCTimestamp msg.f_QuotReqGrp_ValidUntilTime );
    ( "126" , opt encode_UTCTimestamp msg.f_QuotReqGrp_ExpireTime );
    ( "60" , opt encode_UTCTimestamp msg.f_QuotReqGrp_TransactTime );
    ( "423" , opt encode_PriceType msg.f_QuotReqGrp_PriceType );
    ( "44" , opt encode_float_4 msg.f_QuotReqGrp_Price );
    ( "640" , opt encode_float_4 msg.f_QuotReqGrp_Price2 );
    ]
    @ repeat encode_UndInstrmtGrp "711" msg.f_QuotReqGrp_UndInstrmtGrp
    @ repeat encode_Stipulations "232" msg.f_QuotReqGrp_Stipulations
    @ repeat encode_QuotReqLegsGrp "555" msg.f_QuotReqGrp_QuotReqLegsGrp
    @ repeat encode_QuotQualGrp "735" msg.f_QuotReqGrp_QuotQualGrp
    @ repeat encode_Parties "453" msg.f_QuotReqGrp_Parties
;;

let encode_QuotEntryAckGrp msg =
    encode_Instrument msg.f_QuotEntryAckGrp_Instrument @
    [
    ( "295" , opt encode_int msg.f_QuotEntryAckGrp_NoQuoteEntries );
    ( "299" , opt encode_string msg.f_QuotEntryAckGrp_QuoteEntryID );
    ( "132" , opt encode_float_4 msg.f_QuotEntryAckGrp_BidPx );
    ( "133" , opt encode_float_4 msg.f_QuotEntryAckGrp_OfferPx );
    ( "134" , opt encode_float_4 msg.f_QuotEntryAckGrp_BidSize );
    ( "135" , opt encode_float_4 msg.f_QuotEntryAckGrp_OfferSize );
    ( "62" , opt encode_UTCTimestamp msg.f_QuotEntryAckGrp_ValidUntilTime );
    ( "188" , opt encode_float_4 msg.f_QuotEntryAckGrp_BidSpotRate );
    ( "190" , opt encode_float_4 msg.f_QuotEntryAckGrp_OfferSpotRate );
    ( "189" , opt encode_float_4 msg.f_QuotEntryAckGrp_BidForwardPoints );
    ( "191" , opt encode_float_4 msg.f_QuotEntryAckGrp_OfferForwardPoints );
    ( "631" , opt encode_float_4 msg.f_QuotEntryAckGrp_MidPx );
    ( "632" , opt encode_float_4 msg.f_QuotEntryAckGrp_BidYield );
    ( "633" , opt encode_float_4 msg.f_QuotEntryAckGrp_MidYield );
    ( "634" , opt encode_float_4 msg.f_QuotEntryAckGrp_OfferYield );
    ( "60" , opt encode_UTCTimestamp msg.f_QuotEntryAckGrp_TransactTime );
    ( "336" , opt encode_string msg.f_QuotEntryAckGrp_TradingSessionID );
    ( "625" , opt encode_string msg.f_QuotEntryAckGrp_TradingSessionSubID );
    ( "64" , opt encode_LocalMktDate msg.f_QuotEntryAckGrp_SettlDate );
    ( "40" , opt encode_OrdType msg.f_QuotEntryAckGrp_OrdType );
    ( "193" , opt encode_LocalMktDate msg.f_QuotEntryAckGrp_SettlDate2 );
    ( "192" , opt encode_float_4 msg.f_QuotEntryAckGrp_OrderQty2 );
    ( "642" , opt encode_float_4 msg.f_QuotEntryAckGrp_BidForwardPoints2 );
    ( "643" , opt encode_float_4 msg.f_QuotEntryAckGrp_OfferForwardPoints2 );
    ( "15" , opt encode_Currency msg.f_QuotEntryAckGrp_Currency );
    ( "368" , opt encode_int msg.f_QuotEntryAckGrp_QuoteEntryRejectReason );
    ]
    @ repeat encode_InstrmtLegGrp "555" msg.f_QuotEntryAckGrp_InstrmtLegGrp
;;

let encode_QuotCxlEntriesGrp msg =
    encode_Instrument msg.f_QuotCxlEntriesGrp_Instrument @
    encode_FinancingDetails msg.f_QuotCxlEntriesGrp_FinancingDetails @
    [
    ( "295" , opt encode_int msg.f_QuotCxlEntriesGrp_NoQuoteEntries );
    ]
    @ repeat encode_UndInstrmtGrp "711" msg.f_QuotCxlEntriesGrp_UndInstrmtGrp
    @ repeat encode_InstrmtLegGrp "555" msg.f_QuotCxlEntriesGrp_InstrmtLegGrp
;;

let encode_QuotReqRjctGrp msg =
    encode_Instrument msg.f_QuotReqRjctGrp_Instrument @
    encode_FinancingDetails msg.f_QuotReqRjctGrp_FinancingDetails @
    encode_OrderQtyData msg.f_QuotReqRjctGrp_OrderQtyData @
    encode_SpreadOrBenchmarkCurveData msg.f_QuotReqRjctGrp_SpreadOrBenchmarkCurveData @
    encode_YieldData msg.f_QuotReqRjctGrp_YieldData @
    [
    ( "146" , req encode_int msg.f_QuotReqRjctGrp_NoRelatedSym );
    ( "140" , opt encode_float_4 msg.f_QuotReqRjctGrp_PrevClosePx );
    ( "303" , opt encode_QuoteRequestType msg.f_QuotReqRjctGrp_QuoteRequestType );
    ( "537" , opt encode_QuoteType msg.f_QuotReqRjctGrp_QuoteType );
    ( "336" , opt encode_string msg.f_QuotReqRjctGrp_TradingSessionID );
    ( "625" , opt encode_string msg.f_QuotReqRjctGrp_TradingSessionSubID );
    ( "229" , opt encode_LocalMktDate msg.f_QuotReqRjctGrp_TradeOriginationDate );
    ( "54" , opt encode_Side msg.f_QuotReqRjctGrp_Side );
    ( "854" , opt encode_QtyType msg.f_QuotReqRjctGrp_QtyType );
    ( "63" , opt encode_SettlType msg.f_QuotReqRjctGrp_SettlType );
    ( "64" , opt encode_LocalMktDate msg.f_QuotReqRjctGrp_SettlDate );
    ( "193" , opt encode_LocalMktDate msg.f_QuotReqRjctGrp_SettlDate2 );
    ( "192" , opt encode_float_4 msg.f_QuotReqRjctGrp_OrderQty2 );
    ( "15" , opt encode_Currency msg.f_QuotReqRjctGrp_Currency );
    ( "1" , opt encode_string msg.f_QuotReqRjctGrp_Account );
    ( "660" , opt encode_AcctIDSource msg.f_QuotReqRjctGrp_AcctIDSource );
    ( "581" , opt encode_AccountType msg.f_QuotReqRjctGrp_AccountType );
    ( "692" , opt encode_QuotePriceType msg.f_QuotReqRjctGrp_QuotePriceType );
    ( "40" , opt encode_OrdType msg.f_QuotReqRjctGrp_OrdType );
    ( "126" , opt encode_UTCTimestamp msg.f_QuotReqRjctGrp_ExpireTime );
    ( "60" , opt encode_UTCTimestamp msg.f_QuotReqRjctGrp_TransactTime );
    ( "423" , opt encode_PriceType msg.f_QuotReqRjctGrp_PriceType );
    ( "44" , opt encode_float_4 msg.f_QuotReqRjctGrp_Price );
    ( "640" , opt encode_float_4 msg.f_QuotReqRjctGrp_Price2 );
    ]
    @ repeat encode_UndInstrmtGrp "711" msg.f_QuotReqRjctGrp_UndInstrmtGrp
    @ repeat encode_Stipulations "232" msg.f_QuotReqRjctGrp_Stipulations
    @ repeat encode_QuotReqLegsGrp "555" msg.f_QuotReqRjctGrp_QuotReqLegsGrp
    @ repeat encode_QuotQualGrp "735" msg.f_QuotReqRjctGrp_QuotQualGrp
    @ repeat encode_Parties "453" msg.f_QuotReqRjctGrp_Parties
;;

let encode_SecListGrp msg =
    encode_Instrument msg.f_SecListGrp_Instrument @
    encode_InstrumentExtension msg.f_SecListGrp_InstrumentExtension @
    encode_FinancingDetails msg.f_SecListGrp_FinancingDetails @
    encode_SpreadOrBenchmarkCurveData msg.f_SecListGrp_SpreadOrBenchmarkCurveData @
    encode_YieldData msg.f_SecListGrp_YieldData @
    [
    ( "146" , opt encode_int msg.f_SecListGrp_NoRelatedSym );
    ( "15" , opt encode_Currency msg.f_SecListGrp_Currency );
    ( "561" , opt encode_float_4 msg.f_SecListGrp_RoundLot );
    ( "562" , opt encode_float_4 msg.f_SecListGrp_MinTradeVol );
    ( "336" , opt encode_string msg.f_SecListGrp_TradingSessionID );
    ( "625" , opt encode_string msg.f_SecListGrp_TradingSessionSubID );
    ( "827" , opt encode_ExpirationCycle msg.f_SecListGrp_ExpirationCycle );
    ( "58" , opt encode_string msg.f_SecListGrp_Text );
    ( "354" , opt encode_int msg.f_SecListGrp_EncodedTextLen );
    ( "355" , opt encode_string msg.f_SecListGrp_EncodedText );
    ]
    @ repeat encode_UndInstrmtGrp "711" msg.f_SecListGrp_UndInstrmtGrp
    @ repeat encode_Stipulations "232" msg.f_SecListGrp_Stipulations
    @ repeat encode_InstrmtLegSecListGrp "555" msg.f_SecListGrp_InstrmtLegSecListGrp
;;

let encode_TrdCapRptSideGrp msg =
    encode_CommissionData msg.f_TrdCapRptSideGrp_CommissionData @
    [
    ( "552" , req encode_int msg.f_TrdCapRptSideGrp_NoSides );
    ( "54" , req encode_Side msg.f_TrdCapRptSideGrp_Side );
    ( "37" , req encode_string msg.f_TrdCapRptSideGrp_OrderID );
    ( "198" , opt encode_string msg.f_TrdCapRptSideGrp_SecondaryOrderID );
    ( "11" , opt encode_string msg.f_TrdCapRptSideGrp_ClOrdID );
    ( "526" , opt encode_string msg.f_TrdCapRptSideGrp_SecondaryClOrdID );
    ( "66" , opt encode_string msg.f_TrdCapRptSideGrp_ListID );
    ( "1" , opt encode_string msg.f_TrdCapRptSideGrp_Account );
    ( "660" , opt encode_AcctIDSource msg.f_TrdCapRptSideGrp_AcctIDSource );
    ( "581" , opt encode_AccountType msg.f_TrdCapRptSideGrp_AccountType );
    ( "81" , opt encode_ProcessCode msg.f_TrdCapRptSideGrp_ProcessCode );
    ( "575" , opt encode_OddLot msg.f_TrdCapRptSideGrp_OddLot );
    ( "578" , opt encode_string msg.f_TrdCapRptSideGrp_TradeInputSource );
    ( "579" , opt encode_string msg.f_TrdCapRptSideGrp_TradeInputDevice );
    ( "821" , opt encode_string msg.f_TrdCapRptSideGrp_OrderInputDevice );
    ( "15" , opt encode_Currency msg.f_TrdCapRptSideGrp_Currency );
    ( "376" , opt encode_string msg.f_TrdCapRptSideGrp_ComplianceID );
    ( "377" , opt encode_SolicitedFlag msg.f_TrdCapRptSideGrp_SolicitedFlag );
    ( "528" , opt encode_OrderCapacity msg.f_TrdCapRptSideGrp_OrderCapacity );
    ( "529" , opt encode_OrderRestrictions msg.f_TrdCapRptSideGrp_OrderRestrictions );
    ( "582" , opt encode_CustOrderCapacity msg.f_TrdCapRptSideGrp_CustOrderCapacity );
    ( "40" , opt encode_OrdType msg.f_TrdCapRptSideGrp_OrdType );
    ( "18" , opt encode_ExecInst msg.f_TrdCapRptSideGrp_ExecInst );
    ( "483" , opt encode_UTCTimestamp msg.f_TrdCapRptSideGrp_TransBkdTime );
    ( "336" , opt encode_string msg.f_TrdCapRptSideGrp_TradingSessionID );
    ( "625" , opt encode_string msg.f_TrdCapRptSideGrp_TradingSessionSubID );
    ( "943" , opt encode_string msg.f_TrdCapRptSideGrp_TimeBracket );
    ( "381" , opt encode_float_4 msg.f_TrdCapRptSideGrp_GrossTradeAmt );
    ( "157" , opt encode_int msg.f_TrdCapRptSideGrp_NumDaysInterest );
    ( "230" , opt encode_LocalMktDate msg.f_TrdCapRptSideGrp_ExDate );
    ( "158" , opt encode_float_4 msg.f_TrdCapRptSideGrp_AccruedInterestRate );
    ( "159" , opt encode_float_4 msg.f_TrdCapRptSideGrp_AccruedInterestAmt );
    ( "738" , opt encode_float_4 msg.f_TrdCapRptSideGrp_InterestAtMaturity );
    ( "920" , opt encode_float_4 msg.f_TrdCapRptSideGrp_EndAccruedInterestAmt );
    ( "921" , opt encode_float_4 msg.f_TrdCapRptSideGrp_StartCash );
    ( "922" , opt encode_float_4 msg.f_TrdCapRptSideGrp_EndCash );
    ( "238" , opt encode_float_4 msg.f_TrdCapRptSideGrp_Concession );
    ( "237" , opt encode_float_4 msg.f_TrdCapRptSideGrp_TotalTakedown );
    ( "118" , opt encode_float_4 msg.f_TrdCapRptSideGrp_NetMoney );
    ( "119" , opt encode_float_4 msg.f_TrdCapRptSideGrp_SettlCurrAmt );
    ( "120" , opt encode_Currency msg.f_TrdCapRptSideGrp_SettlCurrency );
    ( "155" , opt encode_float_4 msg.f_TrdCapRptSideGrp_SettlCurrFxRate );
    ( "156" , opt encode_SettlCurrFxRateCalc msg.f_TrdCapRptSideGrp_SettlCurrFxRateCalc );
    ( "77" , opt encode_PositionEffect msg.f_TrdCapRptSideGrp_PositionEffect );
    ( "58" , opt encode_string msg.f_TrdCapRptSideGrp_Text );
    ( "354" , opt encode_int msg.f_TrdCapRptSideGrp_EncodedTextLen );
    ( "355" , opt encode_string msg.f_TrdCapRptSideGrp_EncodedText );
    ( "752" , opt encode_SideMultiLegReportingType msg.f_TrdCapRptSideGrp_SideMultiLegReportingType );
    ( "825" , opt encode_string msg.f_TrdCapRptSideGrp_ExchangeRule );
    ( "826" , opt encode_TradeAllocIndicator msg.f_TrdCapRptSideGrp_TradeAllocIndicator );
    ( "591" , opt encode_PreallocMethod msg.f_TrdCapRptSideGrp_PreallocMethod );
    ( "70" , opt encode_string msg.f_TrdCapRptSideGrp_AllocID );
    ]
    @ repeat encode_Parties "453" msg.f_TrdCapRptSideGrp_Parties
    @ repeat encode_ClrInstGrp "576" msg.f_TrdCapRptSideGrp_ClrInstGrp
    @ repeat encode_ContAmtGrp "518" msg.f_TrdCapRptSideGrp_ContAmtGrp
    @ repeat encode_Stipulations "232" msg.f_TrdCapRptSideGrp_Stipulations
    @ repeat encode_MiscFeesGrp "136" msg.f_TrdCapRptSideGrp_MiscFeesGrp
    @ repeat encode_TrdAllocGrp "78" msg.f_TrdCapRptSideGrp_TrdAllocGrp
;;

let encode_QuotSetAckGrp msg =
    encode_UnderlyingInstrument msg.f_QuotSetAckGrp_UnderlyingInstrument @
    [
    ( "296" , opt encode_int msg.f_QuotSetAckGrp_NoQuoteSets );
    ( "302" , opt encode_string msg.f_QuotSetAckGrp_QuoteSetID );
    ( "304" , opt encode_int msg.f_QuotSetAckGrp_TotNoQuoteEntries );
    ( "893" , opt encode_LastFragment msg.f_QuotSetAckGrp_LastFragment );
    ]
    @ repeat encode_QuotEntryAckGrp "295" msg.f_QuotSetAckGrp_QuotEntryAckGrp
;;

let encode_QuotSetGrp msg =
    encode_UnderlyingInstrument msg.f_QuotSetGrp_UnderlyingInstrument @
    [
    ( "296" , req encode_int msg.f_QuotSetGrp_NoQuoteSets );
    ( "302" , req encode_string msg.f_QuotSetGrp_QuoteSetID );
    ( "367" , opt encode_UTCTimestamp msg.f_QuotSetGrp_QuoteSetValidUntilTime );
    ( "304" , req encode_int msg.f_QuotSetGrp_TotNoQuoteEntries );
    ( "893" , opt encode_LastFragment msg.f_QuotSetGrp_LastFragment );
    ]
    @ repeat encode_QuotEntryGrp "295" msg.f_QuotSetGrp_QuotEntryGrp
;;

let encode_SettlInstGrp msg =
    encode_SettlInstructionsData msg.f_SettlInstGrp_SettlInstructionsData @
    [
    ( "778" , opt encode_int msg.f_SettlInstGrp_NoSettlInst );
    ( "162" , opt encode_string msg.f_SettlInstGrp_SettlInstID );
    ( "163" , opt encode_SettlInstTransType msg.f_SettlInstGrp_SettlInstTransType );
    ( "214" , opt encode_string msg.f_SettlInstGrp_SettlInstRefID );
    ( "54" , opt encode_Side msg.f_SettlInstGrp_Side );
    ( "460" , opt encode_Product msg.f_SettlInstGrp_Product );
    ( "167" , opt encode_SecurityType msg.f_SettlInstGrp_SecurityType );
    ( "461" , opt encode_string msg.f_SettlInstGrp_CFICode );
    ( "168" , opt encode_UTCTimestamp msg.f_SettlInstGrp_EffectiveTime );
    ( "126" , opt encode_UTCTimestamp msg.f_SettlInstGrp_ExpireTime );
    ( "779" , opt encode_UTCTimestamp msg.f_SettlInstGrp_LastUpdateTime );
    ( "492" , opt encode_PaymentMethod msg.f_SettlInstGrp_PaymentMethod );
    ( "476" , opt encode_string msg.f_SettlInstGrp_PaymentRef );
    ( "488" , opt encode_string msg.f_SettlInstGrp_CardHolderName );
    ( "489" , opt encode_string msg.f_SettlInstGrp_CardNumber );
    ( "503" , opt encode_LocalMktDate msg.f_SettlInstGrp_CardStartDate );
    ( "490" , opt encode_LocalMktDate msg.f_SettlInstGrp_CardExpDate );
    ( "491" , opt encode_string msg.f_SettlInstGrp_CardIssNum );
    ( "504" , opt encode_LocalMktDate msg.f_SettlInstGrp_PaymentDate );
    ( "505" , opt encode_string msg.f_SettlInstGrp_PaymentRemitterID );
    ]
    @ repeat encode_Parties "453" msg.f_SettlInstGrp_Parties
;;

let encode_AllocGrp msg =
    encode_CommissionData msg.f_AllocGrp_CommissionData @
    encode_SettlInstructionsData msg.f_AllocGrp_SettlInstructionsData @
    [
    ( "78" , opt encode_int msg.f_AllocGrp_NoAllocs );
    ( "79" , opt encode_string msg.f_AllocGrp_AllocAccount );
    ( "661" , opt encode_int msg.f_AllocGrp_AllocAcctIDSource );
    ( "573" , opt encode_MatchStatus msg.f_AllocGrp_MatchStatus );
    ( "366" , opt encode_float_4 msg.f_AllocGrp_AllocPrice );
    ( "80" , opt encode_float_4 msg.f_AllocGrp_AllocQty );
    ( "467" , opt encode_string msg.f_AllocGrp_IndividualAllocID );
    ( "81" , opt encode_ProcessCode msg.f_AllocGrp_ProcessCode );
    ( "208" , opt encode_NotifyBrokerOfCredit msg.f_AllocGrp_NotifyBrokerOfCredit );
    ( "209" , opt encode_AllocHandlInst msg.f_AllocGrp_AllocHandlInst );
    ( "161" , opt encode_string msg.f_AllocGrp_AllocText );
    ( "360" , opt encode_int msg.f_AllocGrp_EncodedAllocTextLen );
    ( "361" , opt encode_string msg.f_AllocGrp_EncodedAllocText );
    ( "153" , opt encode_float_4 msg.f_AllocGrp_AllocAvgPx );
    ( "154" , opt encode_float_4 msg.f_AllocGrp_AllocNetMoney );
    ( "119" , opt encode_float_4 msg.f_AllocGrp_SettlCurrAmt );
    ( "737" , opt encode_float_4 msg.f_AllocGrp_AllocSettlCurrAmt );
    ( "120" , opt encode_Currency msg.f_AllocGrp_SettlCurrency );
    ( "736" , opt encode_Currency msg.f_AllocGrp_AllocSettlCurrency );
    ( "155" , opt encode_float_4 msg.f_AllocGrp_SettlCurrFxRate );
    ( "156" , opt encode_SettlCurrFxRateCalc msg.f_AllocGrp_SettlCurrFxRateCalc );
    ( "742" , opt encode_float_4 msg.f_AllocGrp_AllocAccruedInterestAmt );
    ( "741" , opt encode_float_4 msg.f_AllocGrp_AllocInterestAtMaturity );
    ( "780" , opt encode_AllocSettlInstType msg.f_AllocGrp_AllocSettlInstType );
    ]
    @ repeat encode_NestedParties "539" msg.f_AllocGrp_NestedParties
    @ repeat encode_MiscFeesGrp "136" msg.f_AllocGrp_MiscFeesGrp
    @ repeat encode_ClrInstGrp "576" msg.f_AllocGrp_ClrInstGrp
;;
