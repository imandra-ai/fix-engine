(* Aesthetic Integration copyright 2018 *)
open Encode_datetime;;
open Encode_base_types;;
open Full_app_messages;;
open Encode_app_records;;
open Encode_app_enums;;

let req f x = Some (f x);;
let opt f v = match v with Some x -> Some ( f x ) | None -> None;;
let repeat f tag lst = match lst with [] -> [] | lst ->
    ( tag , lst |> List.length |> req encode_int ) :: (lst |> List.map f |> List.concat );;

let encode_Advertisement msg =
    encode_Instrument msg.f_Advertisement_Instrument @
    [
    ( "2" , req encode_string msg.f_Advertisement_AdvId );
    ( "5" , req encode_AdvTransType msg.f_Advertisement_AdvTransType );
    ( "3" , opt encode_string msg.f_Advertisement_AdvRefID );
    ( "4" , req encode_AdvSide msg.f_Advertisement_AdvSide );
    ( "53" , req encode_float_4 msg.f_Advertisement_Quantity );
    ( "854" , opt encode_QtyType msg.f_Advertisement_QtyType );
    ( "44" , opt encode_float_4 msg.f_Advertisement_Price );
    ( "15" , opt encode_Currency msg.f_Advertisement_Currency );
    ( "75" , opt encode_LocalMktDate msg.f_Advertisement_TradeDate );
    ( "60" , opt encode_UTCTimestamp msg.f_Advertisement_TransactTime );
    ( "58" , opt encode_string msg.f_Advertisement_Text );
    ( "354" , opt encode_int msg.f_Advertisement_EncodedTextLen );
    ( "355" , opt encode_string msg.f_Advertisement_EncodedText );
    ( "149" , opt encode_string msg.f_Advertisement_URLLink );
    ( "30" , opt encode_Exchange msg.f_Advertisement_LastMkt );
    ( "336" , opt encode_string msg.f_Advertisement_TradingSessionID );
    ( "625" , opt encode_string msg.f_Advertisement_TradingSessionSubID );
    ]
    @ repeat encode_InstrmtLegGrp "555" msg.f_Advertisement_InstrmtLegGrp
    @ repeat encode_UndInstrmtGrp "711" msg.f_Advertisement_UndInstrmtGrp
;;

let encode_AllocationInstruction msg =
    encode_Instrument msg.f_AllocationInstruction_Instrument @
    encode_InstrumentExtension msg.f_AllocationInstruction_InstrumentExtension @
    encode_FinancingDetails msg.f_AllocationInstruction_FinancingDetails @
    encode_SpreadOrBenchmarkCurveData msg.f_AllocationInstruction_SpreadOrBenchmarkCurveData @
    encode_YieldData msg.f_AllocationInstruction_YieldData @
    [
    ( "70" , req encode_string msg.f_AllocationInstruction_AllocID );
    ( "71" , req encode_AllocTransType msg.f_AllocationInstruction_AllocTransType );
    ( "626" , req encode_AllocType msg.f_AllocationInstruction_AllocType );
    ( "793" , opt encode_string msg.f_AllocationInstruction_SecondaryAllocID );
    ( "72" , opt encode_string msg.f_AllocationInstruction_RefAllocID );
    ( "796" , opt encode_AllocCancReplaceReason msg.f_AllocationInstruction_AllocCancReplaceReason );
    ( "808" , opt encode_AllocIntermedReqType msg.f_AllocationInstruction_AllocIntermedReqType );
    ( "196" , opt encode_string msg.f_AllocationInstruction_AllocLinkID );
    ( "197" , opt encode_AllocLinkType msg.f_AllocationInstruction_AllocLinkType );
    ( "466" , opt encode_string msg.f_AllocationInstruction_BookingRefID );
    ( "857" , req encode_AllocNoOrdersType msg.f_AllocationInstruction_AllocNoOrdersType );
    ( "570" , opt encode_PreviouslyReported msg.f_AllocationInstruction_PreviouslyReported );
    ( "700" , opt encode_bool msg.f_AllocationInstruction_ReversalIndicator );
    ( "574" , opt encode_MatchType msg.f_AllocationInstruction_MatchType );
    ( "54" , req encode_Side msg.f_AllocationInstruction_Side );
    ( "53" , req encode_float_4 msg.f_AllocationInstruction_Quantity );
    ( "854" , opt encode_QtyType msg.f_AllocationInstruction_QtyType );
    ( "30" , opt encode_Exchange msg.f_AllocationInstruction_LastMkt );
    ( "229" , opt encode_LocalMktDate msg.f_AllocationInstruction_TradeOriginationDate );
    ( "336" , opt encode_string msg.f_AllocationInstruction_TradingSessionID );
    ( "625" , opt encode_string msg.f_AllocationInstruction_TradingSessionSubID );
    ( "423" , opt encode_PriceType msg.f_AllocationInstruction_PriceType );
    ( "6" , req encode_float_4 msg.f_AllocationInstruction_AvgPx );
    ( "860" , opt encode_float_4 msg.f_AllocationInstruction_AvgParPx );
    ( "15" , opt encode_Currency msg.f_AllocationInstruction_Currency );
    ( "74" , opt encode_int msg.f_AllocationInstruction_AvgPxPrecision );
    ( "75" , req encode_LocalMktDate msg.f_AllocationInstruction_TradeDate );
    ( "60" , opt encode_UTCTimestamp msg.f_AllocationInstruction_TransactTime );
    ( "63" , opt encode_SettlType msg.f_AllocationInstruction_SettlType );
    ( "64" , opt encode_LocalMktDate msg.f_AllocationInstruction_SettlDate );
    ( "775" , opt encode_BookingType msg.f_AllocationInstruction_BookingType );
    ( "381" , opt encode_float_4 msg.f_AllocationInstruction_GrossTradeAmt );
    ( "238" , opt encode_float_4 msg.f_AllocationInstruction_Concession );
    ( "237" , opt encode_float_4 msg.f_AllocationInstruction_TotalTakedown );
    ( "118" , opt encode_float_4 msg.f_AllocationInstruction_NetMoney );
    ( "77" , opt encode_PositionEffect msg.f_AllocationInstruction_PositionEffect );
    ( "754" , opt encode_bool msg.f_AllocationInstruction_AutoAcceptIndicator );
    ( "58" , opt encode_string msg.f_AllocationInstruction_Text );
    ( "354" , opt encode_int msg.f_AllocationInstruction_EncodedTextLen );
    ( "355" , opt encode_string msg.f_AllocationInstruction_EncodedText );
    ( "157" , opt encode_int msg.f_AllocationInstruction_NumDaysInterest );
    ( "158" , opt encode_float_4 msg.f_AllocationInstruction_AccruedInterestRate );
    ( "159" , opt encode_float_4 msg.f_AllocationInstruction_AccruedInterestAmt );
    ( "540" , opt encode_float_4 msg.f_AllocationInstruction_TotalAccruedInterestAmt );
    ( "738" , opt encode_float_4 msg.f_AllocationInstruction_InterestAtMaturity );
    ( "920" , opt encode_float_4 msg.f_AllocationInstruction_EndAccruedInterestAmt );
    ( "921" , opt encode_float_4 msg.f_AllocationInstruction_StartCash );
    ( "922" , opt encode_float_4 msg.f_AllocationInstruction_EndCash );
    ( "650" , opt encode_LegalConfirm msg.f_AllocationInstruction_LegalConfirm );
    ( "892" , opt encode_int msg.f_AllocationInstruction_TotNoAllocs );
    ( "893" , opt encode_LastFragment msg.f_AllocationInstruction_LastFragment );
    ]
    @ repeat encode_OrdAllocGrp "73" msg.f_AllocationInstruction_OrdAllocGrp
    @ repeat encode_ExecAllocGrp "124" msg.f_AllocationInstruction_ExecAllocGrp
    @ repeat encode_UndInstrmtGrp "711" msg.f_AllocationInstruction_UndInstrmtGrp
    @ repeat encode_InstrmtLegGrp "555" msg.f_AllocationInstruction_InstrmtLegGrp
    @ repeat encode_Parties "453" msg.f_AllocationInstruction_Parties
    @ repeat encode_Stipulations "232" msg.f_AllocationInstruction_Stipulations
    @ repeat encode_AllocGrp "78" msg.f_AllocationInstruction_AllocGrp
;;

let encode_AllocationInstructionAck msg =
    [
    ( "70" , req encode_string msg.f_AllocationInstructionAck_AllocID );
    ( "793" , opt encode_string msg.f_AllocationInstructionAck_SecondaryAllocID );
    ( "75" , opt encode_LocalMktDate msg.f_AllocationInstructionAck_TradeDate );
    ( "60" , req encode_UTCTimestamp msg.f_AllocationInstructionAck_TransactTime );
    ( "87" , req encode_AllocStatus msg.f_AllocationInstructionAck_AllocStatus );
    ( "88" , opt encode_AllocRejCode msg.f_AllocationInstructionAck_AllocRejCode );
    ( "626" , opt encode_AllocType msg.f_AllocationInstructionAck_AllocType );
    ( "808" , opt encode_AllocIntermedReqType msg.f_AllocationInstructionAck_AllocIntermedReqType );
    ( "573" , opt encode_MatchStatus msg.f_AllocationInstructionAck_MatchStatus );
    ( "460" , opt encode_Product msg.f_AllocationInstructionAck_Product );
    ( "167" , opt encode_SecurityType msg.f_AllocationInstructionAck_SecurityType );
    ( "58" , opt encode_string msg.f_AllocationInstructionAck_Text );
    ( "354" , opt encode_int msg.f_AllocationInstructionAck_EncodedTextLen );
    ( "355" , opt encode_string msg.f_AllocationInstructionAck_EncodedText );
    ]
    @ repeat encode_Parties "453" msg.f_AllocationInstructionAck_Parties
    @ repeat encode_AllocAckGrp "78" msg.f_AllocationInstructionAck_AllocAckGrp
;;

let encode_AllocationReport msg =
    encode_Instrument msg.f_AllocationReport_Instrument @
    encode_InstrumentExtension msg.f_AllocationReport_InstrumentExtension @
    encode_FinancingDetails msg.f_AllocationReport_FinancingDetails @
    encode_SpreadOrBenchmarkCurveData msg.f_AllocationReport_SpreadOrBenchmarkCurveData @
    encode_YieldData msg.f_AllocationReport_YieldData @
    [
    ( "755" , req encode_string msg.f_AllocationReport_AllocReportID );
    ( "70" , opt encode_string msg.f_AllocationReport_AllocID );
    ( "71" , req encode_AllocTransType msg.f_AllocationReport_AllocTransType );
    ( "795" , opt encode_string msg.f_AllocationReport_AllocReportRefID );
    ( "796" , opt encode_AllocCancReplaceReason msg.f_AllocationReport_AllocCancReplaceReason );
    ( "793" , opt encode_string msg.f_AllocationReport_SecondaryAllocID );
    ( "794" , req encode_AllocReportType msg.f_AllocationReport_AllocReportType );
    ( "87" , req encode_AllocStatus msg.f_AllocationReport_AllocStatus );
    ( "88" , opt encode_AllocRejCode msg.f_AllocationReport_AllocRejCode );
    ( "72" , opt encode_string msg.f_AllocationReport_RefAllocID );
    ( "808" , opt encode_AllocIntermedReqType msg.f_AllocationReport_AllocIntermedReqType );
    ( "196" , opt encode_string msg.f_AllocationReport_AllocLinkID );
    ( "197" , opt encode_AllocLinkType msg.f_AllocationReport_AllocLinkType );
    ( "466" , opt encode_string msg.f_AllocationReport_BookingRefID );
    ( "857" , req encode_AllocNoOrdersType msg.f_AllocationReport_AllocNoOrdersType );
    ( "570" , opt encode_PreviouslyReported msg.f_AllocationReport_PreviouslyReported );
    ( "700" , opt encode_bool msg.f_AllocationReport_ReversalIndicator );
    ( "574" , opt encode_MatchType msg.f_AllocationReport_MatchType );
    ( "54" , req encode_Side msg.f_AllocationReport_Side );
    ( "53" , req encode_float_4 msg.f_AllocationReport_Quantity );
    ( "854" , opt encode_QtyType msg.f_AllocationReport_QtyType );
    ( "30" , opt encode_Exchange msg.f_AllocationReport_LastMkt );
    ( "229" , opt encode_LocalMktDate msg.f_AllocationReport_TradeOriginationDate );
    ( "336" , opt encode_string msg.f_AllocationReport_TradingSessionID );
    ( "625" , opt encode_string msg.f_AllocationReport_TradingSessionSubID );
    ( "423" , opt encode_PriceType msg.f_AllocationReport_PriceType );
    ( "6" , req encode_float_4 msg.f_AllocationReport_AvgPx );
    ( "860" , opt encode_float_4 msg.f_AllocationReport_AvgParPx );
    ( "15" , opt encode_Currency msg.f_AllocationReport_Currency );
    ( "74" , opt encode_int msg.f_AllocationReport_AvgPxPrecision );
    ( "75" , req encode_LocalMktDate msg.f_AllocationReport_TradeDate );
    ( "60" , opt encode_UTCTimestamp msg.f_AllocationReport_TransactTime );
    ( "63" , opt encode_SettlType msg.f_AllocationReport_SettlType );
    ( "64" , opt encode_LocalMktDate msg.f_AllocationReport_SettlDate );
    ( "775" , opt encode_BookingType msg.f_AllocationReport_BookingType );
    ( "381" , opt encode_float_4 msg.f_AllocationReport_GrossTradeAmt );
    ( "238" , opt encode_float_4 msg.f_AllocationReport_Concession );
    ( "237" , opt encode_float_4 msg.f_AllocationReport_TotalTakedown );
    ( "118" , opt encode_float_4 msg.f_AllocationReport_NetMoney );
    ( "77" , opt encode_PositionEffect msg.f_AllocationReport_PositionEffect );
    ( "754" , opt encode_bool msg.f_AllocationReport_AutoAcceptIndicator );
    ( "58" , opt encode_string msg.f_AllocationReport_Text );
    ( "354" , opt encode_int msg.f_AllocationReport_EncodedTextLen );
    ( "355" , opt encode_string msg.f_AllocationReport_EncodedText );
    ( "157" , opt encode_int msg.f_AllocationReport_NumDaysInterest );
    ( "158" , opt encode_float_4 msg.f_AllocationReport_AccruedInterestRate );
    ( "159" , opt encode_float_4 msg.f_AllocationReport_AccruedInterestAmt );
    ( "540" , opt encode_float_4 msg.f_AllocationReport_TotalAccruedInterestAmt );
    ( "738" , opt encode_float_4 msg.f_AllocationReport_InterestAtMaturity );
    ( "920" , opt encode_float_4 msg.f_AllocationReport_EndAccruedInterestAmt );
    ( "921" , opt encode_float_4 msg.f_AllocationReport_StartCash );
    ( "922" , opt encode_float_4 msg.f_AllocationReport_EndCash );
    ( "650" , opt encode_LegalConfirm msg.f_AllocationReport_LegalConfirm );
    ( "892" , opt encode_int msg.f_AllocationReport_TotNoAllocs );
    ( "893" , opt encode_LastFragment msg.f_AllocationReport_LastFragment );
    ]
    @ repeat encode_OrdAllocGrp "73" msg.f_AllocationReport_OrdAllocGrp
    @ repeat encode_ExecAllocGrp "124" msg.f_AllocationReport_ExecAllocGrp
    @ repeat encode_UndInstrmtGrp "711" msg.f_AllocationReport_UndInstrmtGrp
    @ repeat encode_InstrmtLegGrp "555" msg.f_AllocationReport_InstrmtLegGrp
    @ repeat encode_Parties "453" msg.f_AllocationReport_Parties
    @ repeat encode_Stipulations "232" msg.f_AllocationReport_Stipulations
    @ repeat encode_AllocGrp "78" msg.f_AllocationReport_AllocGrp
;;

let encode_AllocationReportAck msg =
    [
    ( "755" , req encode_string msg.f_AllocationReportAck_AllocReportID );
    ( "70" , req encode_string msg.f_AllocationReportAck_AllocID );
    ( "793" , opt encode_string msg.f_AllocationReportAck_SecondaryAllocID );
    ( "75" , opt encode_LocalMktDate msg.f_AllocationReportAck_TradeDate );
    ( "60" , req encode_UTCTimestamp msg.f_AllocationReportAck_TransactTime );
    ( "87" , req encode_AllocStatus msg.f_AllocationReportAck_AllocStatus );
    ( "88" , opt encode_AllocRejCode msg.f_AllocationReportAck_AllocRejCode );
    ( "794" , opt encode_AllocReportType msg.f_AllocationReportAck_AllocReportType );
    ( "808" , opt encode_AllocIntermedReqType msg.f_AllocationReportAck_AllocIntermedReqType );
    ( "573" , opt encode_MatchStatus msg.f_AllocationReportAck_MatchStatus );
    ( "460" , opt encode_Product msg.f_AllocationReportAck_Product );
    ( "167" , opt encode_SecurityType msg.f_AllocationReportAck_SecurityType );
    ( "58" , opt encode_string msg.f_AllocationReportAck_Text );
    ( "354" , opt encode_int msg.f_AllocationReportAck_EncodedTextLen );
    ( "355" , opt encode_string msg.f_AllocationReportAck_EncodedText );
    ]
    @ repeat encode_Parties "453" msg.f_AllocationReportAck_Parties
    @ repeat encode_AllocAckGrp "78" msg.f_AllocationReportAck_AllocAckGrp
;;

let encode_AssignmentReport msg =
    encode_Instrument msg.f_AssignmentReport_Instrument @
    [
    ( "833" , req encode_string msg.f_AssignmentReport_AsgnRptID );
    ( "832" , opt encode_int msg.f_AssignmentReport_TotNumAssignmentReports );
    ( "912" , opt encode_bool msg.f_AssignmentReport_LastRptRequested );
    ( "1" , opt encode_string msg.f_AssignmentReport_Account );
    ( "581" , req encode_AccountType msg.f_AssignmentReport_AccountType );
    ( "15" , opt encode_Currency msg.f_AssignmentReport_Currency );
    ( "834" , opt encode_float_4 msg.f_AssignmentReport_ThresholdAmount );
    ( "730" , req encode_float_4 msg.f_AssignmentReport_SettlPrice );
    ( "731" , req encode_SettlPriceType msg.f_AssignmentReport_SettlPriceType );
    ( "732" , req encode_float_4 msg.f_AssignmentReport_UnderlyingSettlPrice );
    ( "432" , opt encode_LocalMktDate msg.f_AssignmentReport_ExpireDate );
    ( "744" , req encode_AssignmentMethod msg.f_AssignmentReport_AssignmentMethod );
    ( "745" , opt encode_float_4 msg.f_AssignmentReport_AssignmentUnit );
    ( "746" , req encode_float_4 msg.f_AssignmentReport_OpenInterest );
    ( "747" , req encode_ExerciseMethod msg.f_AssignmentReport_ExerciseMethod );
    ( "716" , req encode_SettlSessID msg.f_AssignmentReport_SettlSessID );
    ( "717" , req encode_string msg.f_AssignmentReport_SettlSessSubID );
    ( "715" , req encode_LocalMktDate msg.f_AssignmentReport_ClearingBusinessDate );
    ( "58" , opt encode_string msg.f_AssignmentReport_Text );
    ( "354" , opt encode_int msg.f_AssignmentReport_EncodedTextLen );
    ( "355" , opt encode_string msg.f_AssignmentReport_EncodedText );
    ]
    @ repeat encode_Parties "453" msg.f_AssignmentReport_Parties
    @ repeat encode_InstrmtLegGrp "555" msg.f_AssignmentReport_InstrmtLegGrp
    @ repeat encode_UndInstrmtGrp "711" msg.f_AssignmentReport_UndInstrmtGrp
    @ repeat encode_PositionQty "702" msg.f_AssignmentReport_PositionQty
    @ repeat encode_PositionAmountData "753" msg.f_AssignmentReport_PositionAmountData
;;

let encode_BidRequest msg =
    [
    ( "390" , opt encode_string msg.f_BidRequest_BidID );
    ( "391" , req encode_string msg.f_BidRequest_ClientBidID );
    ( "374" , req encode_BidRequestTransType msg.f_BidRequest_BidRequestTransType );
    ( "392" , opt encode_string msg.f_BidRequest_ListName );
    ( "393" , req encode_int msg.f_BidRequest_TotNoRelatedSym );
    ( "394" , req encode_BidType msg.f_BidRequest_BidType );
    ( "395" , opt encode_int msg.f_BidRequest_NumTickets );
    ( "15" , opt encode_Currency msg.f_BidRequest_Currency );
    ( "396" , opt encode_float_4 msg.f_BidRequest_SideValue1 );
    ( "397" , opt encode_float_4 msg.f_BidRequest_SideValue2 );
    ( "409" , opt encode_LiquidityIndType msg.f_BidRequest_LiquidityIndType );
    ( "410" , opt encode_float_4 msg.f_BidRequest_WtAverageLiquidity );
    ( "411" , opt encode_ExchangeForPhysical msg.f_BidRequest_ExchangeForPhysical );
    ( "412" , opt encode_float_4 msg.f_BidRequest_OutMainCntryUIndex );
    ( "413" , opt encode_float_4 msg.f_BidRequest_CrossPercent );
    ( "414" , opt encode_ProgRptReqs msg.f_BidRequest_ProgRptReqs );
    ( "415" , opt encode_int msg.f_BidRequest_ProgPeriodInterval );
    ( "416" , opt encode_IncTaxInd msg.f_BidRequest_IncTaxInd );
    ( "121" , opt encode_ForexReq msg.f_BidRequest_ForexReq );
    ( "417" , opt encode_int msg.f_BidRequest_NumBidders );
    ( "75" , opt encode_LocalMktDate msg.f_BidRequest_TradeDate );
    ( "418" , req encode_BidTradeType msg.f_BidRequest_BidTradeType );
    ( "419" , req encode_BasisPxType msg.f_BidRequest_BasisPxType );
    ( "443" , opt encode_UTCTimestamp msg.f_BidRequest_StrikeTime );
    ( "58" , opt encode_string msg.f_BidRequest_Text );
    ( "354" , opt encode_int msg.f_BidRequest_EncodedTextLen );
    ( "355" , opt encode_string msg.f_BidRequest_EncodedText );
    ]
    @ repeat encode_BidDescReqGrp "398" msg.f_BidRequest_BidDescReqGrp
    @ repeat encode_BidCompReqGrp "420" msg.f_BidRequest_BidCompReqGrp
;;

let encode_BidResponse msg =
    [
    ( "390" , opt encode_string msg.f_BidResponse_BidID );
    ( "391" , opt encode_string msg.f_BidResponse_ClientBidID );
    ]
    @ repeat encode_BidCompRspGrp "420" msg.f_BidResponse_BidCompRspGrp
;;

let encode_CollateralAssignment msg =
    encode_Instrument msg.f_CollateralAssignment_Instrument @
    encode_FinancingDetails msg.f_CollateralAssignment_FinancingDetails @
    encode_SpreadOrBenchmarkCurveData msg.f_CollateralAssignment_SpreadOrBenchmarkCurveData @
    encode_SettlInstructionsData msg.f_CollateralAssignment_SettlInstructionsData @
    [
    ( "902" , req encode_string msg.f_CollateralAssignment_CollAsgnID );
    ( "894" , opt encode_string msg.f_CollateralAssignment_CollReqID );
    ( "895" , req encode_CollAsgnReason msg.f_CollateralAssignment_CollAsgnReason );
    ( "903" , req encode_CollAsgnTransType msg.f_CollateralAssignment_CollAsgnTransType );
    ( "907" , opt encode_string msg.f_CollateralAssignment_CollAsgnRefID );
    ( "60" , req encode_UTCTimestamp msg.f_CollateralAssignment_TransactTime );
    ( "126" , opt encode_UTCTimestamp msg.f_CollateralAssignment_ExpireTime );
    ( "1" , opt encode_string msg.f_CollateralAssignment_Account );
    ( "581" , opt encode_AccountType msg.f_CollateralAssignment_AccountType );
    ( "11" , opt encode_string msg.f_CollateralAssignment_ClOrdID );
    ( "37" , opt encode_string msg.f_CollateralAssignment_OrderID );
    ( "198" , opt encode_string msg.f_CollateralAssignment_SecondaryOrderID );
    ( "526" , opt encode_string msg.f_CollateralAssignment_SecondaryClOrdID );
    ( "64" , opt encode_LocalMktDate msg.f_CollateralAssignment_SettlDate );
    ( "53" , opt encode_float_4 msg.f_CollateralAssignment_Quantity );
    ( "854" , opt encode_QtyType msg.f_CollateralAssignment_QtyType );
    ( "15" , opt encode_Currency msg.f_CollateralAssignment_Currency );
    ( "899" , opt encode_float_4 msg.f_CollateralAssignment_MarginExcess );
    ( "900" , opt encode_float_4 msg.f_CollateralAssignment_TotalNetValue );
    ( "901" , opt encode_float_4 msg.f_CollateralAssignment_CashOutstanding );
    ( "54" , opt encode_Side msg.f_CollateralAssignment_Side );
    ( "44" , opt encode_float_4 msg.f_CollateralAssignment_Price );
    ( "423" , opt encode_PriceType msg.f_CollateralAssignment_PriceType );
    ( "159" , opt encode_float_4 msg.f_CollateralAssignment_AccruedInterestAmt );
    ( "920" , opt encode_float_4 msg.f_CollateralAssignment_EndAccruedInterestAmt );
    ( "921" , opt encode_float_4 msg.f_CollateralAssignment_StartCash );
    ( "922" , opt encode_float_4 msg.f_CollateralAssignment_EndCash );
    ( "336" , opt encode_string msg.f_CollateralAssignment_TradingSessionID );
    ( "625" , opt encode_string msg.f_CollateralAssignment_TradingSessionSubID );
    ( "716" , opt encode_SettlSessID msg.f_CollateralAssignment_SettlSessID );
    ( "717" , opt encode_string msg.f_CollateralAssignment_SettlSessSubID );
    ( "715" , opt encode_LocalMktDate msg.f_CollateralAssignment_ClearingBusinessDate );
    ( "58" , opt encode_string msg.f_CollateralAssignment_Text );
    ( "354" , opt encode_int msg.f_CollateralAssignment_EncodedTextLen );
    ( "355" , opt encode_string msg.f_CollateralAssignment_EncodedText );
    ]
    @ repeat encode_Parties "453" msg.f_CollateralAssignment_Parties
    @ repeat encode_ExecCollGrp "124" msg.f_CollateralAssignment_ExecCollGrp
    @ repeat encode_TrdCollGrp "897" msg.f_CollateralAssignment_TrdCollGrp
    @ repeat encode_InstrmtLegGrp "555" msg.f_CollateralAssignment_InstrmtLegGrp
    @ repeat encode_UndInstrmtCollGrp "711" msg.f_CollateralAssignment_UndInstrmtCollGrp
    @ repeat encode_TrdRegTimestamps "768" msg.f_CollateralAssignment_TrdRegTimestamps
    @ repeat encode_MiscFeesGrp "136" msg.f_CollateralAssignment_MiscFeesGrp
    @ repeat encode_Stipulations "232" msg.f_CollateralAssignment_Stipulations
;;

let encode_CollateralInquiry msg =
    encode_Instrument msg.f_CollateralInquiry_Instrument @
    encode_FinancingDetails msg.f_CollateralInquiry_FinancingDetails @
    encode_SpreadOrBenchmarkCurveData msg.f_CollateralInquiry_SpreadOrBenchmarkCurveData @
    encode_SettlInstructionsData msg.f_CollateralInquiry_SettlInstructionsData @
    [
    ( "909" , opt encode_string msg.f_CollateralInquiry_CollInquiryID );
    ( "263" , opt encode_SubscriptionRequestType msg.f_CollateralInquiry_SubscriptionRequestType );
    ( "725" , opt encode_ResponseTransportType msg.f_CollateralInquiry_ResponseTransportType );
    ( "726" , opt encode_string msg.f_CollateralInquiry_ResponseDestination );
    ( "1" , opt encode_string msg.f_CollateralInquiry_Account );
    ( "581" , opt encode_AccountType msg.f_CollateralInquiry_AccountType );
    ( "11" , opt encode_string msg.f_CollateralInquiry_ClOrdID );
    ( "37" , opt encode_string msg.f_CollateralInquiry_OrderID );
    ( "198" , opt encode_string msg.f_CollateralInquiry_SecondaryOrderID );
    ( "526" , opt encode_string msg.f_CollateralInquiry_SecondaryClOrdID );
    ( "64" , opt encode_LocalMktDate msg.f_CollateralInquiry_SettlDate );
    ( "53" , opt encode_float_4 msg.f_CollateralInquiry_Quantity );
    ( "854" , opt encode_QtyType msg.f_CollateralInquiry_QtyType );
    ( "15" , opt encode_Currency msg.f_CollateralInquiry_Currency );
    ( "899" , opt encode_float_4 msg.f_CollateralInquiry_MarginExcess );
    ( "900" , opt encode_float_4 msg.f_CollateralInquiry_TotalNetValue );
    ( "901" , opt encode_float_4 msg.f_CollateralInquiry_CashOutstanding );
    ( "54" , opt encode_Side msg.f_CollateralInquiry_Side );
    ( "44" , opt encode_float_4 msg.f_CollateralInquiry_Price );
    ( "423" , opt encode_PriceType msg.f_CollateralInquiry_PriceType );
    ( "159" , opt encode_float_4 msg.f_CollateralInquiry_AccruedInterestAmt );
    ( "920" , opt encode_float_4 msg.f_CollateralInquiry_EndAccruedInterestAmt );
    ( "921" , opt encode_float_4 msg.f_CollateralInquiry_StartCash );
    ( "922" , opt encode_float_4 msg.f_CollateralInquiry_EndCash );
    ( "336" , opt encode_string msg.f_CollateralInquiry_TradingSessionID );
    ( "625" , opt encode_string msg.f_CollateralInquiry_TradingSessionSubID );
    ( "716" , opt encode_SettlSessID msg.f_CollateralInquiry_SettlSessID );
    ( "717" , opt encode_string msg.f_CollateralInquiry_SettlSessSubID );
    ( "715" , opt encode_LocalMktDate msg.f_CollateralInquiry_ClearingBusinessDate );
    ( "58" , opt encode_string msg.f_CollateralInquiry_Text );
    ( "354" , opt encode_int msg.f_CollateralInquiry_EncodedTextLen );
    ( "355" , opt encode_string msg.f_CollateralInquiry_EncodedText );
    ]
    @ repeat encode_CollInqQualGrp "938" msg.f_CollateralInquiry_CollInqQualGrp
    @ repeat encode_Parties "453" msg.f_CollateralInquiry_Parties
    @ repeat encode_ExecCollGrp "124" msg.f_CollateralInquiry_ExecCollGrp
    @ repeat encode_TrdCollGrp "897" msg.f_CollateralInquiry_TrdCollGrp
    @ repeat encode_InstrmtLegGrp "555" msg.f_CollateralInquiry_InstrmtLegGrp
    @ repeat encode_UndInstrmtGrp "711" msg.f_CollateralInquiry_UndInstrmtGrp
    @ repeat encode_TrdRegTimestamps "768" msg.f_CollateralInquiry_TrdRegTimestamps
    @ repeat encode_Stipulations "232" msg.f_CollateralInquiry_Stipulations
;;

let encode_CollateralInquiryAck msg =
    encode_Instrument msg.f_CollateralInquiryAck_Instrument @
    encode_FinancingDetails msg.f_CollateralInquiryAck_FinancingDetails @
    [
    ( "909" , req encode_string msg.f_CollateralInquiryAck_CollInquiryID );
    ( "945" , req encode_CollInquiryStatus msg.f_CollateralInquiryAck_CollInquiryStatus );
    ( "946" , opt encode_CollInquiryResult msg.f_CollateralInquiryAck_CollInquiryResult );
    ( "911" , opt encode_int msg.f_CollateralInquiryAck_TotNumReports );
    ( "1" , opt encode_string msg.f_CollateralInquiryAck_Account );
    ( "581" , opt encode_AccountType msg.f_CollateralInquiryAck_AccountType );
    ( "11" , opt encode_string msg.f_CollateralInquiryAck_ClOrdID );
    ( "37" , opt encode_string msg.f_CollateralInquiryAck_OrderID );
    ( "198" , opt encode_string msg.f_CollateralInquiryAck_SecondaryOrderID );
    ( "526" , opt encode_string msg.f_CollateralInquiryAck_SecondaryClOrdID );
    ( "64" , opt encode_LocalMktDate msg.f_CollateralInquiryAck_SettlDate );
    ( "53" , opt encode_float_4 msg.f_CollateralInquiryAck_Quantity );
    ( "854" , opt encode_QtyType msg.f_CollateralInquiryAck_QtyType );
    ( "15" , opt encode_Currency msg.f_CollateralInquiryAck_Currency );
    ( "336" , opt encode_string msg.f_CollateralInquiryAck_TradingSessionID );
    ( "625" , opt encode_string msg.f_CollateralInquiryAck_TradingSessionSubID );
    ( "716" , opt encode_SettlSessID msg.f_CollateralInquiryAck_SettlSessID );
    ( "717" , opt encode_string msg.f_CollateralInquiryAck_SettlSessSubID );
    ( "715" , opt encode_LocalMktDate msg.f_CollateralInquiryAck_ClearingBusinessDate );
    ( "725" , opt encode_ResponseTransportType msg.f_CollateralInquiryAck_ResponseTransportType );
    ( "726" , opt encode_string msg.f_CollateralInquiryAck_ResponseDestination );
    ( "58" , opt encode_string msg.f_CollateralInquiryAck_Text );
    ( "354" , opt encode_int msg.f_CollateralInquiryAck_EncodedTextLen );
    ( "355" , opt encode_string msg.f_CollateralInquiryAck_EncodedText );
    ]
    @ repeat encode_CollInqQualGrp "938" msg.f_CollateralInquiryAck_CollInqQualGrp
    @ repeat encode_Parties "453" msg.f_CollateralInquiryAck_Parties
    @ repeat encode_ExecCollGrp "124" msg.f_CollateralInquiryAck_ExecCollGrp
    @ repeat encode_TrdCollGrp "897" msg.f_CollateralInquiryAck_TrdCollGrp
    @ repeat encode_InstrmtLegGrp "555" msg.f_CollateralInquiryAck_InstrmtLegGrp
    @ repeat encode_UndInstrmtGrp "711" msg.f_CollateralInquiryAck_UndInstrmtGrp
;;

let encode_CollateralReport msg =
    encode_Instrument msg.f_CollateralReport_Instrument @
    encode_FinancingDetails msg.f_CollateralReport_FinancingDetails @
    encode_SpreadOrBenchmarkCurveData msg.f_CollateralReport_SpreadOrBenchmarkCurveData @
    encode_SettlInstructionsData msg.f_CollateralReport_SettlInstructionsData @
    [
    ( "908" , req encode_string msg.f_CollateralReport_CollRptID );
    ( "909" , opt encode_string msg.f_CollateralReport_CollInquiryID );
    ( "910" , req encode_CollStatus msg.f_CollateralReport_CollStatus );
    ( "911" , opt encode_int msg.f_CollateralReport_TotNumReports );
    ( "912" , opt encode_bool msg.f_CollateralReport_LastRptRequested );
    ( "1" , opt encode_string msg.f_CollateralReport_Account );
    ( "581" , opt encode_AccountType msg.f_CollateralReport_AccountType );
    ( "11" , opt encode_string msg.f_CollateralReport_ClOrdID );
    ( "37" , opt encode_string msg.f_CollateralReport_OrderID );
    ( "198" , opt encode_string msg.f_CollateralReport_SecondaryOrderID );
    ( "526" , opt encode_string msg.f_CollateralReport_SecondaryClOrdID );
    ( "64" , opt encode_LocalMktDate msg.f_CollateralReport_SettlDate );
    ( "53" , opt encode_float_4 msg.f_CollateralReport_Quantity );
    ( "854" , opt encode_QtyType msg.f_CollateralReport_QtyType );
    ( "15" , opt encode_Currency msg.f_CollateralReport_Currency );
    ( "899" , opt encode_float_4 msg.f_CollateralReport_MarginExcess );
    ( "900" , opt encode_float_4 msg.f_CollateralReport_TotalNetValue );
    ( "901" , opt encode_float_4 msg.f_CollateralReport_CashOutstanding );
    ( "54" , opt encode_Side msg.f_CollateralReport_Side );
    ( "44" , opt encode_float_4 msg.f_CollateralReport_Price );
    ( "423" , opt encode_PriceType msg.f_CollateralReport_PriceType );
    ( "159" , opt encode_float_4 msg.f_CollateralReport_AccruedInterestAmt );
    ( "920" , opt encode_float_4 msg.f_CollateralReport_EndAccruedInterestAmt );
    ( "921" , opt encode_float_4 msg.f_CollateralReport_StartCash );
    ( "922" , opt encode_float_4 msg.f_CollateralReport_EndCash );
    ( "336" , opt encode_string msg.f_CollateralReport_TradingSessionID );
    ( "625" , opt encode_string msg.f_CollateralReport_TradingSessionSubID );
    ( "716" , opt encode_SettlSessID msg.f_CollateralReport_SettlSessID );
    ( "717" , opt encode_string msg.f_CollateralReport_SettlSessSubID );
    ( "715" , opt encode_LocalMktDate msg.f_CollateralReport_ClearingBusinessDate );
    ( "58" , opt encode_string msg.f_CollateralReport_Text );
    ( "354" , opt encode_int msg.f_CollateralReport_EncodedTextLen );
    ( "355" , opt encode_string msg.f_CollateralReport_EncodedText );
    ]
    @ repeat encode_Parties "453" msg.f_CollateralReport_Parties
    @ repeat encode_ExecCollGrp "124" msg.f_CollateralReport_ExecCollGrp
    @ repeat encode_TrdCollGrp "897" msg.f_CollateralReport_TrdCollGrp
    @ repeat encode_InstrmtLegGrp "555" msg.f_CollateralReport_InstrmtLegGrp
    @ repeat encode_UndInstrmtGrp "711" msg.f_CollateralReport_UndInstrmtGrp
    @ repeat encode_TrdRegTimestamps "768" msg.f_CollateralReport_TrdRegTimestamps
    @ repeat encode_MiscFeesGrp "136" msg.f_CollateralReport_MiscFeesGrp
    @ repeat encode_Stipulations "232" msg.f_CollateralReport_Stipulations
;;

let encode_CollateralRequest msg =
    encode_Instrument msg.f_CollateralRequest_Instrument @
    encode_FinancingDetails msg.f_CollateralRequest_FinancingDetails @
    encode_SpreadOrBenchmarkCurveData msg.f_CollateralRequest_SpreadOrBenchmarkCurveData @
    [
    ( "894" , req encode_string msg.f_CollateralRequest_CollReqID );
    ( "895" , req encode_CollAsgnReason msg.f_CollateralRequest_CollAsgnReason );
    ( "60" , req encode_UTCTimestamp msg.f_CollateralRequest_TransactTime );
    ( "126" , opt encode_UTCTimestamp msg.f_CollateralRequest_ExpireTime );
    ( "1" , opt encode_string msg.f_CollateralRequest_Account );
    ( "581" , opt encode_AccountType msg.f_CollateralRequest_AccountType );
    ( "11" , opt encode_string msg.f_CollateralRequest_ClOrdID );
    ( "37" , opt encode_string msg.f_CollateralRequest_OrderID );
    ( "198" , opt encode_string msg.f_CollateralRequest_SecondaryOrderID );
    ( "526" , opt encode_string msg.f_CollateralRequest_SecondaryClOrdID );
    ( "64" , opt encode_LocalMktDate msg.f_CollateralRequest_SettlDate );
    ( "53" , opt encode_float_4 msg.f_CollateralRequest_Quantity );
    ( "854" , opt encode_QtyType msg.f_CollateralRequest_QtyType );
    ( "15" , opt encode_Currency msg.f_CollateralRequest_Currency );
    ( "899" , opt encode_float_4 msg.f_CollateralRequest_MarginExcess );
    ( "900" , opt encode_float_4 msg.f_CollateralRequest_TotalNetValue );
    ( "901" , opt encode_float_4 msg.f_CollateralRequest_CashOutstanding );
    ( "54" , opt encode_Side msg.f_CollateralRequest_Side );
    ( "44" , opt encode_float_4 msg.f_CollateralRequest_Price );
    ( "423" , opt encode_PriceType msg.f_CollateralRequest_PriceType );
    ( "159" , opt encode_float_4 msg.f_CollateralRequest_AccruedInterestAmt );
    ( "920" , opt encode_float_4 msg.f_CollateralRequest_EndAccruedInterestAmt );
    ( "921" , opt encode_float_4 msg.f_CollateralRequest_StartCash );
    ( "922" , opt encode_float_4 msg.f_CollateralRequest_EndCash );
    ( "336" , opt encode_string msg.f_CollateralRequest_TradingSessionID );
    ( "625" , opt encode_string msg.f_CollateralRequest_TradingSessionSubID );
    ( "716" , opt encode_SettlSessID msg.f_CollateralRequest_SettlSessID );
    ( "717" , opt encode_string msg.f_CollateralRequest_SettlSessSubID );
    ( "715" , opt encode_LocalMktDate msg.f_CollateralRequest_ClearingBusinessDate );
    ( "58" , opt encode_string msg.f_CollateralRequest_Text );
    ( "354" , opt encode_int msg.f_CollateralRequest_EncodedTextLen );
    ( "355" , opt encode_string msg.f_CollateralRequest_EncodedText );
    ]
    @ repeat encode_Parties "453" msg.f_CollateralRequest_Parties
    @ repeat encode_ExecCollGrp "124" msg.f_CollateralRequest_ExecCollGrp
    @ repeat encode_TrdCollGrp "897" msg.f_CollateralRequest_TrdCollGrp
    @ repeat encode_InstrmtLegGrp "555" msg.f_CollateralRequest_InstrmtLegGrp
    @ repeat encode_UndInstrmtCollGrp "711" msg.f_CollateralRequest_UndInstrmtCollGrp
    @ repeat encode_TrdRegTimestamps "768" msg.f_CollateralRequest_TrdRegTimestamps
    @ repeat encode_MiscFeesGrp "136" msg.f_CollateralRequest_MiscFeesGrp
    @ repeat encode_Stipulations "232" msg.f_CollateralRequest_Stipulations
;;

let encode_CollateralResponse msg =
    encode_Instrument msg.f_CollateralResponse_Instrument @
    encode_FinancingDetails msg.f_CollateralResponse_FinancingDetails @
    encode_SpreadOrBenchmarkCurveData msg.f_CollateralResponse_SpreadOrBenchmarkCurveData @
    [
    ( "904" , req encode_string msg.f_CollateralResponse_CollRespID );
    ( "902" , req encode_string msg.f_CollateralResponse_CollAsgnID );
    ( "894" , opt encode_string msg.f_CollateralResponse_CollReqID );
    ( "895" , req encode_CollAsgnReason msg.f_CollateralResponse_CollAsgnReason );
    ( "903" , opt encode_CollAsgnTransType msg.f_CollateralResponse_CollAsgnTransType );
    ( "905" , req encode_CollAsgnRespType msg.f_CollateralResponse_CollAsgnRespType );
    ( "906" , opt encode_CollAsgnRejectReason msg.f_CollateralResponse_CollAsgnRejectReason );
    ( "60" , req encode_UTCTimestamp msg.f_CollateralResponse_TransactTime );
    ( "1" , opt encode_string msg.f_CollateralResponse_Account );
    ( "581" , opt encode_AccountType msg.f_CollateralResponse_AccountType );
    ( "11" , opt encode_string msg.f_CollateralResponse_ClOrdID );
    ( "37" , opt encode_string msg.f_CollateralResponse_OrderID );
    ( "198" , opt encode_string msg.f_CollateralResponse_SecondaryOrderID );
    ( "526" , opt encode_string msg.f_CollateralResponse_SecondaryClOrdID );
    ( "64" , opt encode_LocalMktDate msg.f_CollateralResponse_SettlDate );
    ( "53" , opt encode_float_4 msg.f_CollateralResponse_Quantity );
    ( "854" , opt encode_QtyType msg.f_CollateralResponse_QtyType );
    ( "15" , opt encode_Currency msg.f_CollateralResponse_Currency );
    ( "899" , opt encode_float_4 msg.f_CollateralResponse_MarginExcess );
    ( "900" , opt encode_float_4 msg.f_CollateralResponse_TotalNetValue );
    ( "901" , opt encode_float_4 msg.f_CollateralResponse_CashOutstanding );
    ( "54" , opt encode_Side msg.f_CollateralResponse_Side );
    ( "44" , opt encode_float_4 msg.f_CollateralResponse_Price );
    ( "423" , opt encode_PriceType msg.f_CollateralResponse_PriceType );
    ( "159" , opt encode_float_4 msg.f_CollateralResponse_AccruedInterestAmt );
    ( "920" , opt encode_float_4 msg.f_CollateralResponse_EndAccruedInterestAmt );
    ( "921" , opt encode_float_4 msg.f_CollateralResponse_StartCash );
    ( "922" , opt encode_float_4 msg.f_CollateralResponse_EndCash );
    ( "58" , opt encode_string msg.f_CollateralResponse_Text );
    ( "354" , opt encode_int msg.f_CollateralResponse_EncodedTextLen );
    ( "355" , opt encode_string msg.f_CollateralResponse_EncodedText );
    ]
    @ repeat encode_Parties "453" msg.f_CollateralResponse_Parties
    @ repeat encode_ExecCollGrp "124" msg.f_CollateralResponse_ExecCollGrp
    @ repeat encode_TrdCollGrp "897" msg.f_CollateralResponse_TrdCollGrp
    @ repeat encode_InstrmtLegGrp "555" msg.f_CollateralResponse_InstrmtLegGrp
    @ repeat encode_UndInstrmtCollGrp "711" msg.f_CollateralResponse_UndInstrmtCollGrp
    @ repeat encode_TrdRegTimestamps "768" msg.f_CollateralResponse_TrdRegTimestamps
    @ repeat encode_MiscFeesGrp "136" msg.f_CollateralResponse_MiscFeesGrp
    @ repeat encode_Stipulations "232" msg.f_CollateralResponse_Stipulations
;;

let encode_Confirmation msg =
    encode_Instrument msg.f_Confirmation_Instrument @
    encode_InstrumentExtension msg.f_Confirmation_InstrumentExtension @
    encode_FinancingDetails msg.f_Confirmation_FinancingDetails @
    encode_YieldData msg.f_Confirmation_YieldData @
    encode_SpreadOrBenchmarkCurveData msg.f_Confirmation_SpreadOrBenchmarkCurveData @
    encode_SettlInstructionsData msg.f_Confirmation_SettlInstructionsData @
    encode_CommissionData msg.f_Confirmation_CommissionData @
    [
    ( "664" , req encode_string msg.f_Confirmation_ConfirmID );
    ( "772" , opt encode_string msg.f_Confirmation_ConfirmRefID );
    ( "859" , opt encode_string msg.f_Confirmation_ConfirmReqID );
    ( "666" , req encode_ConfirmTransType msg.f_Confirmation_ConfirmTransType );
    ( "773" , req encode_ConfirmType msg.f_Confirmation_ConfirmType );
    ( "797" , opt encode_bool msg.f_Confirmation_CopyMsgIndicator );
    ( "650" , opt encode_LegalConfirm msg.f_Confirmation_LegalConfirm );
    ( "665" , req encode_ConfirmStatus msg.f_Confirmation_ConfirmStatus );
    ( "70" , opt encode_string msg.f_Confirmation_AllocID );
    ( "793" , opt encode_string msg.f_Confirmation_SecondaryAllocID );
    ( "467" , opt encode_string msg.f_Confirmation_IndividualAllocID );
    ( "60" , req encode_UTCTimestamp msg.f_Confirmation_TransactTime );
    ( "75" , req encode_LocalMktDate msg.f_Confirmation_TradeDate );
    ( "80" , req encode_float_4 msg.f_Confirmation_AllocQty );
    ( "854" , opt encode_QtyType msg.f_Confirmation_QtyType );
    ( "54" , req encode_Side msg.f_Confirmation_Side );
    ( "15" , opt encode_Currency msg.f_Confirmation_Currency );
    ( "30" , opt encode_Exchange msg.f_Confirmation_LastMkt );
    ( "79" , req encode_string msg.f_Confirmation_AllocAccount );
    ( "661" , opt encode_int msg.f_Confirmation_AllocAcctIDSource );
    ( "798" , opt encode_AllocAccountType msg.f_Confirmation_AllocAccountType );
    ( "6" , req encode_float_4 msg.f_Confirmation_AvgPx );
    ( "74" , opt encode_int msg.f_Confirmation_AvgPxPrecision );
    ( "423" , opt encode_PriceType msg.f_Confirmation_PriceType );
    ( "860" , opt encode_float_4 msg.f_Confirmation_AvgParPx );
    ( "861" , opt encode_float_4 msg.f_Confirmation_ReportedPx );
    ( "58" , opt encode_string msg.f_Confirmation_Text );
    ( "354" , opt encode_int msg.f_Confirmation_EncodedTextLen );
    ( "355" , opt encode_string msg.f_Confirmation_EncodedText );
    ( "81" , opt encode_ProcessCode msg.f_Confirmation_ProcessCode );
    ( "381" , req encode_float_4 msg.f_Confirmation_GrossTradeAmt );
    ( "157" , opt encode_int msg.f_Confirmation_NumDaysInterest );
    ( "230" , opt encode_LocalMktDate msg.f_Confirmation_ExDate );
    ( "158" , opt encode_float_4 msg.f_Confirmation_AccruedInterestRate );
    ( "159" , opt encode_float_4 msg.f_Confirmation_AccruedInterestAmt );
    ( "738" , opt encode_float_4 msg.f_Confirmation_InterestAtMaturity );
    ( "920" , opt encode_float_4 msg.f_Confirmation_EndAccruedInterestAmt );
    ( "921" , opt encode_float_4 msg.f_Confirmation_StartCash );
    ( "922" , opt encode_float_4 msg.f_Confirmation_EndCash );
    ( "238" , opt encode_float_4 msg.f_Confirmation_Concession );
    ( "237" , opt encode_float_4 msg.f_Confirmation_TotalTakedown );
    ( "118" , req encode_float_4 msg.f_Confirmation_NetMoney );
    ( "890" , opt encode_float_4 msg.f_Confirmation_MaturityNetMoney );
    ( "119" , opt encode_float_4 msg.f_Confirmation_SettlCurrAmt );
    ( "120" , opt encode_Currency msg.f_Confirmation_SettlCurrency );
    ( "155" , opt encode_float_4 msg.f_Confirmation_SettlCurrFxRate );
    ( "156" , opt encode_SettlCurrFxRateCalc msg.f_Confirmation_SettlCurrFxRateCalc );
    ( "63" , opt encode_SettlType msg.f_Confirmation_SettlType );
    ( "64" , opt encode_LocalMktDate msg.f_Confirmation_SettlDate );
    ( "858" , opt encode_float_4 msg.f_Confirmation_SharedCommission );
    ]
    @ repeat encode_Parties "453" msg.f_Confirmation_Parties
    @ repeat encode_OrdAllocGrp "73" msg.f_Confirmation_OrdAllocGrp
    @ repeat encode_TrdRegTimestamps "768" msg.f_Confirmation_TrdRegTimestamps
    @ repeat encode_UndInstrmtGrp "711" msg.f_Confirmation_UndInstrmtGrp
    @ repeat encode_InstrmtLegGrp "555" msg.f_Confirmation_InstrmtLegGrp
    @ repeat encode_CpctyConfGrp "862" msg.f_Confirmation_CpctyConfGrp
    @ repeat encode_Stipulations "232" msg.f_Confirmation_Stipulations
    @ repeat encode_MiscFeesGrp "136" msg.f_Confirmation_MiscFeesGrp
;;

let encode_ConfirmationAck msg =
    [
    ( "664" , req encode_string msg.f_ConfirmationAck_ConfirmID );
    ( "75" , req encode_LocalMktDate msg.f_ConfirmationAck_TradeDate );
    ( "60" , req encode_UTCTimestamp msg.f_ConfirmationAck_TransactTime );
    ( "940" , req encode_AffirmStatus msg.f_ConfirmationAck_AffirmStatus );
    ( "774" , opt encode_ConfirmRejReason msg.f_ConfirmationAck_ConfirmRejReason );
    ( "573" , opt encode_MatchStatus msg.f_ConfirmationAck_MatchStatus );
    ( "58" , opt encode_string msg.f_ConfirmationAck_Text );
    ( "354" , opt encode_int msg.f_ConfirmationAck_EncodedTextLen );
    ( "355" , opt encode_string msg.f_ConfirmationAck_EncodedText );
    ]
;;

let encode_ConfirmationRequest msg =
    [
    ( "859" , req encode_string msg.f_ConfirmationRequest_ConfirmReqID );
    ( "773" , req encode_ConfirmType msg.f_ConfirmationRequest_ConfirmType );
    ( "70" , opt encode_string msg.f_ConfirmationRequest_AllocID );
    ( "793" , opt encode_string msg.f_ConfirmationRequest_SecondaryAllocID );
    ( "467" , opt encode_string msg.f_ConfirmationRequest_IndividualAllocID );
    ( "60" , req encode_UTCTimestamp msg.f_ConfirmationRequest_TransactTime );
    ( "79" , opt encode_string msg.f_ConfirmationRequest_AllocAccount );
    ( "661" , opt encode_int msg.f_ConfirmationRequest_AllocAcctIDSource );
    ( "798" , opt encode_AllocAccountType msg.f_ConfirmationRequest_AllocAccountType );
    ( "58" , opt encode_string msg.f_ConfirmationRequest_Text );
    ( "354" , opt encode_int msg.f_ConfirmationRequest_EncodedTextLen );
    ( "355" , opt encode_string msg.f_ConfirmationRequest_EncodedText );
    ]
    @ repeat encode_OrdAllocGrp "73" msg.f_ConfirmationRequest_OrdAllocGrp
;;

let encode_CrossOrderCancelReplaceRequest msg =
    encode_Instrument msg.f_CrossOrderCancelReplaceRequest_Instrument @
    encode_SpreadOrBenchmarkCurveData msg.f_CrossOrderCancelReplaceRequest_SpreadOrBenchmarkCurveData @
    encode_YieldData msg.f_CrossOrderCancelReplaceRequest_YieldData @
    encode_PegInstructions msg.f_CrossOrderCancelReplaceRequest_PegInstructions @
    encode_DiscretionInstructions msg.f_CrossOrderCancelReplaceRequest_DiscretionInstructions @
    [
    ( "37" , opt encode_string msg.f_CrossOrderCancelReplaceRequest_OrderID );
    ( "548" , req encode_string msg.f_CrossOrderCancelReplaceRequest_CrossID );
    ( "551" , req encode_string msg.f_CrossOrderCancelReplaceRequest_OrigCrossID );
    ( "549" , req encode_CrossType msg.f_CrossOrderCancelReplaceRequest_CrossType );
    ( "550" , req encode_CrossPrioritization msg.f_CrossOrderCancelReplaceRequest_CrossPrioritization );
    ( "63" , opt encode_SettlType msg.f_CrossOrderCancelReplaceRequest_SettlType );
    ( "64" , opt encode_LocalMktDate msg.f_CrossOrderCancelReplaceRequest_SettlDate );
    ( "21" , opt encode_HandlInst msg.f_CrossOrderCancelReplaceRequest_HandlInst );
    ( "18" , opt encode_ExecInst msg.f_CrossOrderCancelReplaceRequest_ExecInst );
    ( "110" , opt encode_float_4 msg.f_CrossOrderCancelReplaceRequest_MinQty );
    ( "111" , opt encode_float_4 msg.f_CrossOrderCancelReplaceRequest_MaxFloor );
    ( "100" , opt encode_Exchange msg.f_CrossOrderCancelReplaceRequest_ExDestination );
    ( "81" , opt encode_ProcessCode msg.f_CrossOrderCancelReplaceRequest_ProcessCode );
    ( "140" , opt encode_float_4 msg.f_CrossOrderCancelReplaceRequest_PrevClosePx );
    ( "114" , opt encode_LocateReqd msg.f_CrossOrderCancelReplaceRequest_LocateReqd );
    ( "60" , req encode_UTCTimestamp msg.f_CrossOrderCancelReplaceRequest_TransactTime );
    ( "40" , req encode_OrdType msg.f_CrossOrderCancelReplaceRequest_OrdType );
    ( "423" , opt encode_PriceType msg.f_CrossOrderCancelReplaceRequest_PriceType );
    ( "44" , opt encode_float_4 msg.f_CrossOrderCancelReplaceRequest_Price );
    ( "99" , opt encode_float_4 msg.f_CrossOrderCancelReplaceRequest_StopPx );
    ( "15" , opt encode_Currency msg.f_CrossOrderCancelReplaceRequest_Currency );
    ( "376" , opt encode_string msg.f_CrossOrderCancelReplaceRequest_ComplianceID );
    ( "23" , opt encode_string msg.f_CrossOrderCancelReplaceRequest_IOIID );
    ( "117" , opt encode_string msg.f_CrossOrderCancelReplaceRequest_QuoteID );
    ( "59" , opt encode_TimeInForce msg.f_CrossOrderCancelReplaceRequest_TimeInForce );
    ( "168" , opt encode_UTCTimestamp msg.f_CrossOrderCancelReplaceRequest_EffectiveTime );
    ( "432" , opt encode_LocalMktDate msg.f_CrossOrderCancelReplaceRequest_ExpireDate );
    ( "126" , opt encode_UTCTimestamp msg.f_CrossOrderCancelReplaceRequest_ExpireTime );
    ( "427" , opt encode_GTBookingInst msg.f_CrossOrderCancelReplaceRequest_GTBookingInst );
    ( "210" , opt encode_float_4 msg.f_CrossOrderCancelReplaceRequest_MaxShow );
    ( "847" , opt encode_TargetStrategy msg.f_CrossOrderCancelReplaceRequest_TargetStrategy );
    ( "848" , opt encode_string msg.f_CrossOrderCancelReplaceRequest_TargetStrategyParameters );
    ( "849" , opt encode_float_4 msg.f_CrossOrderCancelReplaceRequest_ParticipationRate );
    ( "480" , opt encode_CancellationRights msg.f_CrossOrderCancelReplaceRequest_CancellationRights );
    ( "481" , opt encode_MoneyLaunderingStatus msg.f_CrossOrderCancelReplaceRequest_MoneyLaunderingStatus );
    ( "513" , opt encode_string msg.f_CrossOrderCancelReplaceRequest_RegistID );
    ( "494" , opt encode_string msg.f_CrossOrderCancelReplaceRequest_Designation );
    ]
    @ repeat encode_SideCrossOrdModGrp "552" msg.f_CrossOrderCancelReplaceRequest_SideCrossOrdModGrp
    @ repeat encode_UndInstrmtGrp "711" msg.f_CrossOrderCancelReplaceRequest_UndInstrmtGrp
    @ repeat encode_InstrmtLegGrp "555" msg.f_CrossOrderCancelReplaceRequest_InstrmtLegGrp
    @ repeat encode_TrdgSesGrp "386" msg.f_CrossOrderCancelReplaceRequest_TrdgSesGrp
    @ repeat encode_Stipulations "232" msg.f_CrossOrderCancelReplaceRequest_Stipulations
;;

let encode_CrossOrderCancelRequest msg =
    encode_Instrument msg.f_CrossOrderCancelRequest_Instrument @
    [
    ( "37" , opt encode_string msg.f_CrossOrderCancelRequest_OrderID );
    ( "548" , req encode_string msg.f_CrossOrderCancelRequest_CrossID );
    ( "551" , req encode_string msg.f_CrossOrderCancelRequest_OrigCrossID );
    ( "549" , req encode_CrossType msg.f_CrossOrderCancelRequest_CrossType );
    ( "550" , req encode_CrossPrioritization msg.f_CrossOrderCancelRequest_CrossPrioritization );
    ( "60" , req encode_UTCTimestamp msg.f_CrossOrderCancelRequest_TransactTime );
    ]
    @ repeat encode_SideCrossOrdCxlGrp "552" msg.f_CrossOrderCancelRequest_SideCrossOrdCxlGrp
    @ repeat encode_UndInstrmtGrp "711" msg.f_CrossOrderCancelRequest_UndInstrmtGrp
    @ repeat encode_InstrmtLegGrp "555" msg.f_CrossOrderCancelRequest_InstrmtLegGrp
;;

let encode_DerivativeSecurityList msg =
    encode_UnderlyingInstrument msg.f_DerivativeSecurityList_UnderlyingInstrument @
    [
    ( "320" , req encode_string msg.f_DerivativeSecurityList_SecurityReqID );
    ( "322" , req encode_string msg.f_DerivativeSecurityList_SecurityResponseID );
    ( "560" , req encode_SecurityRequestResult msg.f_DerivativeSecurityList_SecurityRequestResult );
    ( "393" , opt encode_int msg.f_DerivativeSecurityList_TotNoRelatedSym );
    ( "893" , opt encode_LastFragment msg.f_DerivativeSecurityList_LastFragment );
    ]
    @ repeat encode_RelSymDerivSecGrp "146" msg.f_DerivativeSecurityList_RelSymDerivSecGrp
;;

let encode_DerivativeSecurityListRequest msg =
    encode_UnderlyingInstrument msg.f_DerivativeSecurityListRequest_UnderlyingInstrument @
    [
    ( "320" , req encode_string msg.f_DerivativeSecurityListRequest_SecurityReqID );
    ( "559" , req encode_SecurityListRequestType msg.f_DerivativeSecurityListRequest_SecurityListRequestType );
    ( "762" , opt encode_string msg.f_DerivativeSecurityListRequest_SecuritySubType );
    ( "15" , opt encode_Currency msg.f_DerivativeSecurityListRequest_Currency );
    ( "58" , opt encode_string msg.f_DerivativeSecurityListRequest_Text );
    ( "354" , opt encode_int msg.f_DerivativeSecurityListRequest_EncodedTextLen );
    ( "355" , opt encode_string msg.f_DerivativeSecurityListRequest_EncodedText );
    ( "336" , opt encode_string msg.f_DerivativeSecurityListRequest_TradingSessionID );
    ( "625" , opt encode_string msg.f_DerivativeSecurityListRequest_TradingSessionSubID );
    ( "263" , opt encode_SubscriptionRequestType msg.f_DerivativeSecurityListRequest_SubscriptionRequestType );
    ]
;;

let encode_DontKnowTrade msg =
    encode_Instrument msg.f_DontKnowTrade_Instrument @
    encode_OrderQtyData msg.f_DontKnowTrade_OrderQtyData @
    [
    ( "37" , req encode_string msg.f_DontKnowTrade_OrderID );
    ( "198" , opt encode_string msg.f_DontKnowTrade_SecondaryOrderID );
    ( "17" , req encode_string msg.f_DontKnowTrade_ExecID );
    ( "127" , req encode_DKReason msg.f_DontKnowTrade_DKReason );
    ( "54" , req encode_Side msg.f_DontKnowTrade_Side );
    ( "32" , opt encode_float_4 msg.f_DontKnowTrade_LastQty );
    ( "31" , opt encode_float_4 msg.f_DontKnowTrade_LastPx );
    ( "58" , opt encode_string msg.f_DontKnowTrade_Text );
    ( "354" , opt encode_int msg.f_DontKnowTrade_EncodedTextLen );
    ( "355" , opt encode_string msg.f_DontKnowTrade_EncodedText );
    ]
    @ repeat encode_UndInstrmtGrp "711" msg.f_DontKnowTrade_UndInstrmtGrp
    @ repeat encode_InstrmtLegGrp "555" msg.f_DontKnowTrade_InstrmtLegGrp
;;

let encode_Email msg =
    [
    ( "164" , req encode_string msg.f_Email_EmailThreadID );
    ( "94" , req encode_EmailType msg.f_Email_EmailType );
    ( "42" , opt encode_UTCTimestamp msg.f_Email_OrigTime );
    ( "147" , req encode_string msg.f_Email_Subject );
    ( "356" , opt encode_int msg.f_Email_EncodedSubjectLen );
    ( "357" , opt encode_string msg.f_Email_EncodedSubject );
    ( "37" , opt encode_string msg.f_Email_OrderID );
    ( "11" , opt encode_string msg.f_Email_ClOrdID );
    ( "95" , opt encode_int msg.f_Email_RawDataLength );
    ( "96" , opt encode_string msg.f_Email_RawData );
    ]
    @ repeat encode_RoutingGrp "215" msg.f_Email_RoutingGrp
    @ repeat encode_InstrmtGrp "146" msg.f_Email_InstrmtGrp
    @ repeat encode_UndInstrmtGrp "711" msg.f_Email_UndInstrmtGrp
    @ repeat encode_InstrmtLegGrp "555" msg.f_Email_InstrmtLegGrp
    @ repeat encode_LinesOfTextGrp "33" msg.f_Email_LinesOfTextGrp
;;

let encode_ExecutionReport msg =
    encode_Instrument msg.f_ExecutionReport_Instrument @
    encode_FinancingDetails msg.f_ExecutionReport_FinancingDetails @
    encode_OrderQtyData msg.f_ExecutionReport_OrderQtyData @
    encode_PegInstructions msg.f_ExecutionReport_PegInstructions @
    encode_DiscretionInstructions msg.f_ExecutionReport_DiscretionInstructions @
    encode_CommissionData msg.f_ExecutionReport_CommissionData @
    encode_SpreadOrBenchmarkCurveData msg.f_ExecutionReport_SpreadOrBenchmarkCurveData @
    encode_YieldData msg.f_ExecutionReport_YieldData @
    [
    ( "37" , req encode_string msg.f_ExecutionReport_OrderID );
    ( "198" , opt encode_string msg.f_ExecutionReport_SecondaryOrderID );
    ( "526" , opt encode_string msg.f_ExecutionReport_SecondaryClOrdID );
    ( "527" , opt encode_string msg.f_ExecutionReport_SecondaryExecID );
    ( "11" , opt encode_string msg.f_ExecutionReport_ClOrdID );
    ( "41" , opt encode_string msg.f_ExecutionReport_OrigClOrdID );
    ( "583" , opt encode_string msg.f_ExecutionReport_ClOrdLinkID );
    ( "693" , opt encode_string msg.f_ExecutionReport_QuoteRespID );
    ( "790" , opt encode_string msg.f_ExecutionReport_OrdStatusReqID );
    ( "584" , opt encode_string msg.f_ExecutionReport_MassStatusReqID );
    ( "911" , opt encode_int msg.f_ExecutionReport_TotNumReports );
    ( "912" , opt encode_bool msg.f_ExecutionReport_LastRptRequested );
    ( "229" , opt encode_LocalMktDate msg.f_ExecutionReport_TradeOriginationDate );
    ( "66" , opt encode_string msg.f_ExecutionReport_ListID );
    ( "548" , opt encode_string msg.f_ExecutionReport_CrossID );
    ( "551" , opt encode_string msg.f_ExecutionReport_OrigCrossID );
    ( "549" , opt encode_CrossType msg.f_ExecutionReport_CrossType );
    ( "17" , req encode_string msg.f_ExecutionReport_ExecID );
    ( "19" , opt encode_string msg.f_ExecutionReport_ExecRefID );
    ( "150" , req encode_ExecType msg.f_ExecutionReport_ExecType );
    ( "39" , req encode_OrdStatus msg.f_ExecutionReport_OrdStatus );
    ( "636" , opt encode_WorkingIndicator msg.f_ExecutionReport_WorkingIndicator );
    ( "103" , opt encode_OrdRejReason msg.f_ExecutionReport_OrdRejReason );
    ( "378" , opt encode_ExecRestatementReason msg.f_ExecutionReport_ExecRestatementReason );
    ( "1" , opt encode_string msg.f_ExecutionReport_Account );
    ( "660" , opt encode_AcctIDSource msg.f_ExecutionReport_AcctIDSource );
    ( "581" , opt encode_AccountType msg.f_ExecutionReport_AccountType );
    ( "589" , opt encode_DayBookingInst msg.f_ExecutionReport_DayBookingInst );
    ( "590" , opt encode_BookingUnit msg.f_ExecutionReport_BookingUnit );
    ( "591" , opt encode_PreallocMethod msg.f_ExecutionReport_PreallocMethod );
    ( "63" , opt encode_SettlType msg.f_ExecutionReport_SettlType );
    ( "64" , opt encode_LocalMktDate msg.f_ExecutionReport_SettlDate );
    ( "544" , opt encode_CashMargin msg.f_ExecutionReport_CashMargin );
    ( "635" , opt encode_ClearingFeeIndicator msg.f_ExecutionReport_ClearingFeeIndicator );
    ( "54" , req encode_Side msg.f_ExecutionReport_Side );
    ( "854" , opt encode_QtyType msg.f_ExecutionReport_QtyType );
    ( "40" , opt encode_OrdType msg.f_ExecutionReport_OrdType );
    ( "423" , opt encode_PriceType msg.f_ExecutionReport_PriceType );
    ( "44" , opt encode_float_4 msg.f_ExecutionReport_Price );
    ( "99" , opt encode_float_4 msg.f_ExecutionReport_StopPx );
    ( "839" , opt encode_float_4 msg.f_ExecutionReport_PeggedPrice );
    ( "845" , opt encode_float_4 msg.f_ExecutionReport_DiscretionPrice );
    ( "847" , opt encode_TargetStrategy msg.f_ExecutionReport_TargetStrategy );
    ( "848" , opt encode_string msg.f_ExecutionReport_TargetStrategyParameters );
    ( "849" , opt encode_float_4 msg.f_ExecutionReport_ParticipationRate );
    ( "850" , opt encode_float_4 msg.f_ExecutionReport_TargetStrategyPerformance );
    ( "15" , opt encode_Currency msg.f_ExecutionReport_Currency );
    ( "376" , opt encode_string msg.f_ExecutionReport_ComplianceID );
    ( "377" , opt encode_SolicitedFlag msg.f_ExecutionReport_SolicitedFlag );
    ( "59" , opt encode_TimeInForce msg.f_ExecutionReport_TimeInForce );
    ( "168" , opt encode_UTCTimestamp msg.f_ExecutionReport_EffectiveTime );
    ( "432" , opt encode_LocalMktDate msg.f_ExecutionReport_ExpireDate );
    ( "126" , opt encode_UTCTimestamp msg.f_ExecutionReport_ExpireTime );
    ( "18" , opt encode_ExecInst msg.f_ExecutionReport_ExecInst );
    ( "528" , opt encode_OrderCapacity msg.f_ExecutionReport_OrderCapacity );
    ( "529" , opt encode_OrderRestrictions msg.f_ExecutionReport_OrderRestrictions );
    ( "582" , opt encode_CustOrderCapacity msg.f_ExecutionReport_CustOrderCapacity );
    ( "32" , opt encode_float_4 msg.f_ExecutionReport_LastQty );
    ( "652" , opt encode_float_4 msg.f_ExecutionReport_UnderlyingLastQty );
    ( "31" , opt encode_float_4 msg.f_ExecutionReport_LastPx );
    ( "651" , opt encode_float_4 msg.f_ExecutionReport_UnderlyingLastPx );
    ( "669" , opt encode_float_4 msg.f_ExecutionReport_LastParPx );
    ( "194" , opt encode_float_4 msg.f_ExecutionReport_LastSpotRate );
    ( "195" , opt encode_float_4 msg.f_ExecutionReport_LastForwardPoints );
    ( "30" , opt encode_Exchange msg.f_ExecutionReport_LastMkt );
    ( "336" , opt encode_string msg.f_ExecutionReport_TradingSessionID );
    ( "625" , opt encode_string msg.f_ExecutionReport_TradingSessionSubID );
    ( "943" , opt encode_string msg.f_ExecutionReport_TimeBracket );
    ( "29" , opt encode_LastCapacity msg.f_ExecutionReport_LastCapacity );
    ( "151" , req encode_float_4 msg.f_ExecutionReport_LeavesQty );
    ( "14" , req encode_float_4 msg.f_ExecutionReport_CumQty );
    ( "6" , req encode_float_4 msg.f_ExecutionReport_AvgPx );
    ( "424" , opt encode_float_4 msg.f_ExecutionReport_DayOrderQty );
    ( "425" , opt encode_float_4 msg.f_ExecutionReport_DayCumQty );
    ( "426" , opt encode_float_4 msg.f_ExecutionReport_DayAvgPx );
    ( "427" , opt encode_GTBookingInst msg.f_ExecutionReport_GTBookingInst );
    ( "75" , opt encode_LocalMktDate msg.f_ExecutionReport_TradeDate );
    ( "60" , opt encode_UTCTimestamp msg.f_ExecutionReport_TransactTime );
    ( "113" , opt encode_ReportToExch msg.f_ExecutionReport_ReportToExch );
    ( "381" , opt encode_float_4 msg.f_ExecutionReport_GrossTradeAmt );
    ( "157" , opt encode_int msg.f_ExecutionReport_NumDaysInterest );
    ( "230" , opt encode_LocalMktDate msg.f_ExecutionReport_ExDate );
    ( "158" , opt encode_float_4 msg.f_ExecutionReport_AccruedInterestRate );
    ( "159" , opt encode_float_4 msg.f_ExecutionReport_AccruedInterestAmt );
    ( "738" , opt encode_float_4 msg.f_ExecutionReport_InterestAtMaturity );
    ( "920" , opt encode_float_4 msg.f_ExecutionReport_EndAccruedInterestAmt );
    ( "921" , opt encode_float_4 msg.f_ExecutionReport_StartCash );
    ( "922" , opt encode_float_4 msg.f_ExecutionReport_EndCash );
    ( "258" , opt encode_TradedFlatSwitch msg.f_ExecutionReport_TradedFlatSwitch );
    ( "259" , opt encode_LocalMktDate msg.f_ExecutionReport_BasisFeatureDate );
    ( "260" , opt encode_float_4 msg.f_ExecutionReport_BasisFeaturePrice );
    ( "238" , opt encode_float_4 msg.f_ExecutionReport_Concession );
    ( "237" , opt encode_float_4 msg.f_ExecutionReport_TotalTakedown );
    ( "118" , opt encode_float_4 msg.f_ExecutionReport_NetMoney );
    ( "119" , opt encode_float_4 msg.f_ExecutionReport_SettlCurrAmt );
    ( "120" , opt encode_Currency msg.f_ExecutionReport_SettlCurrency );
    ( "155" , opt encode_float_4 msg.f_ExecutionReport_SettlCurrFxRate );
    ( "156" , opt encode_SettlCurrFxRateCalc msg.f_ExecutionReport_SettlCurrFxRateCalc );
    ( "21" , opt encode_HandlInst msg.f_ExecutionReport_HandlInst );
    ( "110" , opt encode_float_4 msg.f_ExecutionReport_MinQty );
    ( "111" , opt encode_float_4 msg.f_ExecutionReport_MaxFloor );
    ( "77" , opt encode_PositionEffect msg.f_ExecutionReport_PositionEffect );
    ( "210" , opt encode_float_4 msg.f_ExecutionReport_MaxShow );
    ( "775" , opt encode_BookingType msg.f_ExecutionReport_BookingType );
    ( "58" , opt encode_string msg.f_ExecutionReport_Text );
    ( "354" , opt encode_int msg.f_ExecutionReport_EncodedTextLen );
    ( "355" , opt encode_string msg.f_ExecutionReport_EncodedText );
    ( "193" , opt encode_LocalMktDate msg.f_ExecutionReport_SettlDate2 );
    ( "192" , opt encode_float_4 msg.f_ExecutionReport_OrderQty2 );
    ( "641" , opt encode_float_4 msg.f_ExecutionReport_LastForwardPoints2 );
    ( "442" , opt encode_MultiLegReportingType msg.f_ExecutionReport_MultiLegReportingType );
    ( "480" , opt encode_CancellationRights msg.f_ExecutionReport_CancellationRights );
    ( "481" , opt encode_MoneyLaunderingStatus msg.f_ExecutionReport_MoneyLaunderingStatus );
    ( "513" , opt encode_string msg.f_ExecutionReport_RegistID );
    ( "494" , opt encode_string msg.f_ExecutionReport_Designation );
    ( "483" , opt encode_UTCTimestamp msg.f_ExecutionReport_TransBkdTime );
    ( "515" , opt encode_UTCTimestamp msg.f_ExecutionReport_ExecValuationPoint );
    ( "484" , opt encode_ExecPriceType msg.f_ExecutionReport_ExecPriceType );
    ( "485" , opt encode_float_4 msg.f_ExecutionReport_ExecPriceAdjustment );
    ( "638" , opt encode_PriorityIndicator msg.f_ExecutionReport_PriorityIndicator );
    ( "639" , opt encode_float_4 msg.f_ExecutionReport_PriceImprovement );
    ( "851" , opt encode_LastLiquidityInd msg.f_ExecutionReport_LastLiquidityInd );
    ( "797" , opt encode_bool msg.f_ExecutionReport_CopyMsgIndicator );
    ]
    @ repeat encode_Parties "453" msg.f_ExecutionReport_Parties
    @ repeat encode_ContraGrp "382" msg.f_ExecutionReport_ContraGrp
    @ repeat encode_UndInstrmtGrp "711" msg.f_ExecutionReport_UndInstrmtGrp
    @ repeat encode_Stipulations "232" msg.f_ExecutionReport_Stipulations
    @ repeat encode_ContAmtGrp "518" msg.f_ExecutionReport_ContAmtGrp
    @ repeat encode_InstrmtLegExecGrp "555" msg.f_ExecutionReport_InstrmtLegExecGrp
    @ repeat encode_MiscFeesGrp "136" msg.f_ExecutionReport_MiscFeesGrp
;;

let encode_IOI msg =
    encode_Instrument msg.f_IOI_Instrument @
    encode_FinancingDetails msg.f_IOI_FinancingDetails @
    encode_OrderQtyData msg.f_IOI_OrderQtyData @
    encode_SpreadOrBenchmarkCurveData msg.f_IOI_SpreadOrBenchmarkCurveData @
    encode_YieldData msg.f_IOI_YieldData @
    [
    ( "23" , req encode_string msg.f_IOI_IOIID );
    ( "28" , req encode_IOITransType msg.f_IOI_IOITransType );
    ( "26" , opt encode_string msg.f_IOI_IOIRefID );
    ( "54" , req encode_Side msg.f_IOI_Side );
    ( "854" , opt encode_QtyType msg.f_IOI_QtyType );
    ( "27" , req encode_IOIQty msg.f_IOI_IOIQty );
    ( "15" , opt encode_Currency msg.f_IOI_Currency );
    ( "423" , opt encode_PriceType msg.f_IOI_PriceType );
    ( "44" , opt encode_float_4 msg.f_IOI_Price );
    ( "62" , opt encode_UTCTimestamp msg.f_IOI_ValidUntilTime );
    ( "25" , opt encode_IOIQltyInd msg.f_IOI_IOIQltyInd );
    ( "130" , opt encode_IOINaturalFlag msg.f_IOI_IOINaturalFlag );
    ( "58" , opt encode_string msg.f_IOI_Text );
    ( "354" , opt encode_int msg.f_IOI_EncodedTextLen );
    ( "355" , opt encode_string msg.f_IOI_EncodedText );
    ( "60" , opt encode_UTCTimestamp msg.f_IOI_TransactTime );
    ( "149" , opt encode_string msg.f_IOI_URLLink );
    ]
    @ repeat encode_UndInstrmtGrp "711" msg.f_IOI_UndInstrmtGrp
    @ repeat encode_Stipulations "232" msg.f_IOI_Stipulations
    @ repeat encode_InstrmtLegIOIGrp "555" msg.f_IOI_InstrmtLegIOIGrp
    @ repeat encode_IOIQualGrp "199" msg.f_IOI_IOIQualGrp
    @ repeat encode_RoutingGrp "215" msg.f_IOI_RoutingGrp
;;

let encode_ListCancelRequest msg =
    [
    ( "66" , req encode_string msg.f_ListCancelRequest_ListID );
    ( "60" , req encode_UTCTimestamp msg.f_ListCancelRequest_TransactTime );
    ( "229" , opt encode_LocalMktDate msg.f_ListCancelRequest_TradeOriginationDate );
    ( "75" , opt encode_LocalMktDate msg.f_ListCancelRequest_TradeDate );
    ( "58" , opt encode_string msg.f_ListCancelRequest_Text );
    ( "354" , opt encode_int msg.f_ListCancelRequest_EncodedTextLen );
    ( "355" , opt encode_string msg.f_ListCancelRequest_EncodedText );
    ]
;;

let encode_ListExecute msg =
    [
    ( "66" , req encode_string msg.f_ListExecute_ListID );
    ( "391" , opt encode_string msg.f_ListExecute_ClientBidID );
    ( "390" , opt encode_string msg.f_ListExecute_BidID );
    ( "60" , req encode_UTCTimestamp msg.f_ListExecute_TransactTime );
    ( "58" , opt encode_string msg.f_ListExecute_Text );
    ( "354" , opt encode_int msg.f_ListExecute_EncodedTextLen );
    ( "355" , opt encode_string msg.f_ListExecute_EncodedText );
    ]
;;

let encode_ListStatus msg =
    [
    ( "66" , req encode_string msg.f_ListStatus_ListID );
    ( "429" , req encode_ListStatusType msg.f_ListStatus_ListStatusType );
    ( "82" , req encode_int msg.f_ListStatus_NoRpts );
    ( "431" , req encode_ListOrderStatus msg.f_ListStatus_ListOrderStatus );
    ( "83" , req encode_int msg.f_ListStatus_RptSeq );
    ( "444" , opt encode_string msg.f_ListStatus_ListStatusText );
    ( "445" , opt encode_int msg.f_ListStatus_EncodedListStatusTextLen );
    ( "446" , opt encode_string msg.f_ListStatus_EncodedListStatusText );
    ( "60" , opt encode_UTCTimestamp msg.f_ListStatus_TransactTime );
    ( "68" , req encode_int msg.f_ListStatus_TotNoOrders );
    ( "893" , opt encode_LastFragment msg.f_ListStatus_LastFragment );
    ]
    @ repeat encode_OrdListStatGrp "73" msg.f_ListStatus_OrdListStatGrp
;;

let encode_ListStatusRequest msg =
    [
    ( "66" , req encode_string msg.f_ListStatusRequest_ListID );
    ( "58" , opt encode_string msg.f_ListStatusRequest_Text );
    ( "354" , opt encode_int msg.f_ListStatusRequest_EncodedTextLen );
    ( "355" , opt encode_string msg.f_ListStatusRequest_EncodedText );
    ]
;;

let encode_ListStrikePrice msg =
    [
    ( "66" , req encode_string msg.f_ListStrikePrice_ListID );
    ( "422" , req encode_int msg.f_ListStrikePrice_TotNoStrikes );
    ( "893" , opt encode_LastFragment msg.f_ListStrikePrice_LastFragment );
    ]
    @ repeat encode_InstrmtStrkPxGrp "428" msg.f_ListStrikePrice_InstrmtStrkPxGrp
    @ repeat encode_UndInstrmtStrkPxGrp "711" msg.f_ListStrikePrice_UndInstrmtStrkPxGrp
;;

let encode_MarketDataIncrementalRefresh msg =
    [
    ( "262" , opt encode_string msg.f_MarketDataIncrementalRefresh_MDReqID );
    ( "813" , opt encode_int msg.f_MarketDataIncrementalRefresh_ApplQueueDepth );
    ( "814" , opt encode_ApplQueueResolution msg.f_MarketDataIncrementalRefresh_ApplQueueResolution );
    ]
    @ repeat encode_MDIncGrp "268" msg.f_MarketDataIncrementalRefresh_MDIncGrp
;;

let encode_MarketDataRequest msg =
    [
    ( "262" , req encode_string msg.f_MarketDataRequest_MDReqID );
    ( "263" , req encode_SubscriptionRequestType msg.f_MarketDataRequest_SubscriptionRequestType );
    ( "264" , req encode_int msg.f_MarketDataRequest_MarketDepth );
    ( "265" , opt encode_MDUpdateType msg.f_MarketDataRequest_MDUpdateType );
    ( "266" , opt encode_AggregatedBook msg.f_MarketDataRequest_AggregatedBook );
    ( "286" , opt encode_OpenCloseSettlFlag msg.f_MarketDataRequest_OpenCloseSettlFlag );
    ( "546" , opt encode_Scope msg.f_MarketDataRequest_Scope );
    ( "547" , opt encode_MDImplicitDelete msg.f_MarketDataRequest_MDImplicitDelete );
    ( "815" , opt encode_ApplQueueAction msg.f_MarketDataRequest_ApplQueueAction );
    ( "812" , opt encode_int msg.f_MarketDataRequest_ApplQueueMax );
    ]
    @ repeat encode_MDReqGrp "267" msg.f_MarketDataRequest_MDReqGrp
    @ repeat encode_InstrmtMDReqGrp "146" msg.f_MarketDataRequest_InstrmtMDReqGrp
    @ repeat encode_TrdgSesGrp "386" msg.f_MarketDataRequest_TrdgSesGrp
;;

let encode_MarketDataRequestReject msg =
    [
    ( "262" , req encode_string msg.f_MarketDataRequestReject_MDReqID );
    ( "281" , opt encode_MDReqRejReason msg.f_MarketDataRequestReject_MDReqRejReason );
    ( "58" , opt encode_string msg.f_MarketDataRequestReject_Text );
    ( "354" , opt encode_int msg.f_MarketDataRequestReject_EncodedTextLen );
    ( "355" , opt encode_string msg.f_MarketDataRequestReject_EncodedText );
    ]
    @ repeat encode_MDRjctGrp "816" msg.f_MarketDataRequestReject_MDRjctGrp
;;

let encode_MarketDataSnapshotFullRefresh msg =
    encode_Instrument msg.f_MarketDataSnapshotFullRefresh_Instrument @
    [
    ( "262" , opt encode_string msg.f_MarketDataSnapshotFullRefresh_MDReqID );
    ( "291" , opt encode_FinancialStatus msg.f_MarketDataSnapshotFullRefresh_FinancialStatus );
    ( "292" , opt encode_CorporateAction msg.f_MarketDataSnapshotFullRefresh_CorporateAction );
    ( "451" , opt encode_float_4 msg.f_MarketDataSnapshotFullRefresh_NetChgPrevDay );
    ( "813" , opt encode_int msg.f_MarketDataSnapshotFullRefresh_ApplQueueDepth );
    ( "814" , opt encode_ApplQueueResolution msg.f_MarketDataSnapshotFullRefresh_ApplQueueResolution );
    ]
    @ repeat encode_UndInstrmtGrp "711" msg.f_MarketDataSnapshotFullRefresh_UndInstrmtGrp
    @ repeat encode_InstrmtLegGrp "555" msg.f_MarketDataSnapshotFullRefresh_InstrmtLegGrp
    @ repeat encode_MDFullGrp "268" msg.f_MarketDataSnapshotFullRefresh_MDFullGrp
;;

let encode_MassQuote msg =
    [
    ( "131" , opt encode_string msg.f_MassQuote_QuoteReqID );
    ( "117" , req encode_string msg.f_MassQuote_QuoteID );
    ( "537" , opt encode_QuoteType msg.f_MassQuote_QuoteType );
    ( "301" , opt encode_QuoteResponseLevel msg.f_MassQuote_QuoteResponseLevel );
    ( "1" , opt encode_string msg.f_MassQuote_Account );
    ( "660" , opt encode_AcctIDSource msg.f_MassQuote_AcctIDSource );
    ( "581" , opt encode_AccountType msg.f_MassQuote_AccountType );
    ( "293" , opt encode_float_4 msg.f_MassQuote_DefBidSize );
    ( "294" , opt encode_float_4 msg.f_MassQuote_DefOfferSize );
    ]
    @ repeat encode_Parties "453" msg.f_MassQuote_Parties
    @ repeat encode_QuotSetGrp "296" msg.f_MassQuote_QuotSetGrp
;;

let encode_MassQuoteAcknowledgement msg =
    [
    ( "131" , opt encode_string msg.f_MassQuoteAcknowledgement_QuoteReqID );
    ( "117" , opt encode_string msg.f_MassQuoteAcknowledgement_QuoteID );
    ( "297" , req encode_QuoteStatus msg.f_MassQuoteAcknowledgement_QuoteStatus );
    ( "300" , opt encode_QuoteRejectReason msg.f_MassQuoteAcknowledgement_QuoteRejectReason );
    ( "301" , opt encode_QuoteResponseLevel msg.f_MassQuoteAcknowledgement_QuoteResponseLevel );
    ( "537" , opt encode_QuoteType msg.f_MassQuoteAcknowledgement_QuoteType );
    ( "1" , opt encode_string msg.f_MassQuoteAcknowledgement_Account );
    ( "660" , opt encode_AcctIDSource msg.f_MassQuoteAcknowledgement_AcctIDSource );
    ( "581" , opt encode_AccountType msg.f_MassQuoteAcknowledgement_AccountType );
    ( "58" , opt encode_string msg.f_MassQuoteAcknowledgement_Text );
    ( "354" , opt encode_int msg.f_MassQuoteAcknowledgement_EncodedTextLen );
    ( "355" , opt encode_string msg.f_MassQuoteAcknowledgement_EncodedText );
    ]
    @ repeat encode_Parties "453" msg.f_MassQuoteAcknowledgement_Parties
    @ repeat encode_QuotSetAckGrp "296" msg.f_MassQuoteAcknowledgement_QuotSetAckGrp
;;

let encode_MultilegOrderCancelReplace msg =
    encode_Instrument msg.f_MultilegOrderCancelReplace_Instrument @
    encode_OrderQtyData msg.f_MultilegOrderCancelReplace_OrderQtyData @
    encode_CommissionData msg.f_MultilegOrderCancelReplace_CommissionData @
    encode_PegInstructions msg.f_MultilegOrderCancelReplace_PegInstructions @
    encode_DiscretionInstructions msg.f_MultilegOrderCancelReplace_DiscretionInstructions @
    [
    ( "37" , opt encode_string msg.f_MultilegOrderCancelReplace_OrderID );
    ( "41" , req encode_string msg.f_MultilegOrderCancelReplace_OrigClOrdID );
    ( "11" , req encode_string msg.f_MultilegOrderCancelReplace_ClOrdID );
    ( "526" , opt encode_string msg.f_MultilegOrderCancelReplace_SecondaryClOrdID );
    ( "583" , opt encode_string msg.f_MultilegOrderCancelReplace_ClOrdLinkID );
    ( "586" , opt encode_UTCTimestamp msg.f_MultilegOrderCancelReplace_OrigOrdModTime );
    ( "229" , opt encode_LocalMktDate msg.f_MultilegOrderCancelReplace_TradeOriginationDate );
    ( "75" , opt encode_LocalMktDate msg.f_MultilegOrderCancelReplace_TradeDate );
    ( "1" , opt encode_string msg.f_MultilegOrderCancelReplace_Account );
    ( "660" , opt encode_AcctIDSource msg.f_MultilegOrderCancelReplace_AcctIDSource );
    ( "581" , opt encode_AccountType msg.f_MultilegOrderCancelReplace_AccountType );
    ( "589" , opt encode_DayBookingInst msg.f_MultilegOrderCancelReplace_DayBookingInst );
    ( "590" , opt encode_BookingUnit msg.f_MultilegOrderCancelReplace_BookingUnit );
    ( "591" , opt encode_PreallocMethod msg.f_MultilegOrderCancelReplace_PreallocMethod );
    ( "70" , opt encode_string msg.f_MultilegOrderCancelReplace_AllocID );
    ( "63" , opt encode_SettlType msg.f_MultilegOrderCancelReplace_SettlType );
    ( "64" , opt encode_LocalMktDate msg.f_MultilegOrderCancelReplace_SettlDate );
    ( "544" , opt encode_CashMargin msg.f_MultilegOrderCancelReplace_CashMargin );
    ( "635" , opt encode_ClearingFeeIndicator msg.f_MultilegOrderCancelReplace_ClearingFeeIndicator );
    ( "21" , opt encode_HandlInst msg.f_MultilegOrderCancelReplace_HandlInst );
    ( "18" , opt encode_ExecInst msg.f_MultilegOrderCancelReplace_ExecInst );
    ( "110" , opt encode_float_4 msg.f_MultilegOrderCancelReplace_MinQty );
    ( "111" , opt encode_float_4 msg.f_MultilegOrderCancelReplace_MaxFloor );
    ( "100" , opt encode_Exchange msg.f_MultilegOrderCancelReplace_ExDestination );
    ( "81" , opt encode_ProcessCode msg.f_MultilegOrderCancelReplace_ProcessCode );
    ( "54" , req encode_Side msg.f_MultilegOrderCancelReplace_Side );
    ( "140" , opt encode_float_4 msg.f_MultilegOrderCancelReplace_PrevClosePx );
    ( "114" , opt encode_LocateReqd msg.f_MultilegOrderCancelReplace_LocateReqd );
    ( "60" , req encode_UTCTimestamp msg.f_MultilegOrderCancelReplace_TransactTime );
    ( "854" , opt encode_QtyType msg.f_MultilegOrderCancelReplace_QtyType );
    ( "40" , req encode_OrdType msg.f_MultilegOrderCancelReplace_OrdType );
    ( "423" , opt encode_PriceType msg.f_MultilegOrderCancelReplace_PriceType );
    ( "44" , opt encode_float_4 msg.f_MultilegOrderCancelReplace_Price );
    ( "99" , opt encode_float_4 msg.f_MultilegOrderCancelReplace_StopPx );
    ( "15" , opt encode_Currency msg.f_MultilegOrderCancelReplace_Currency );
    ( "376" , opt encode_string msg.f_MultilegOrderCancelReplace_ComplianceID );
    ( "377" , opt encode_SolicitedFlag msg.f_MultilegOrderCancelReplace_SolicitedFlag );
    ( "23" , opt encode_string msg.f_MultilegOrderCancelReplace_IOIID );
    ( "117" , opt encode_string msg.f_MultilegOrderCancelReplace_QuoteID );
    ( "59" , opt encode_TimeInForce msg.f_MultilegOrderCancelReplace_TimeInForce );
    ( "168" , opt encode_UTCTimestamp msg.f_MultilegOrderCancelReplace_EffectiveTime );
    ( "432" , opt encode_LocalMktDate msg.f_MultilegOrderCancelReplace_ExpireDate );
    ( "126" , opt encode_UTCTimestamp msg.f_MultilegOrderCancelReplace_ExpireTime );
    ( "427" , opt encode_GTBookingInst msg.f_MultilegOrderCancelReplace_GTBookingInst );
    ( "528" , opt encode_OrderCapacity msg.f_MultilegOrderCancelReplace_OrderCapacity );
    ( "529" , opt encode_OrderRestrictions msg.f_MultilegOrderCancelReplace_OrderRestrictions );
    ( "582" , opt encode_CustOrderCapacity msg.f_MultilegOrderCancelReplace_CustOrderCapacity );
    ( "121" , opt encode_ForexReq msg.f_MultilegOrderCancelReplace_ForexReq );
    ( "120" , opt encode_Currency msg.f_MultilegOrderCancelReplace_SettlCurrency );
    ( "775" , opt encode_BookingType msg.f_MultilegOrderCancelReplace_BookingType );
    ( "58" , opt encode_string msg.f_MultilegOrderCancelReplace_Text );
    ( "354" , opt encode_int msg.f_MultilegOrderCancelReplace_EncodedTextLen );
    ( "355" , opt encode_string msg.f_MultilegOrderCancelReplace_EncodedText );
    ( "77" , opt encode_PositionEffect msg.f_MultilegOrderCancelReplace_PositionEffect );
    ( "203" , opt encode_CoveredOrUncovered msg.f_MultilegOrderCancelReplace_CoveredOrUncovered );
    ( "210" , opt encode_float_4 msg.f_MultilegOrderCancelReplace_MaxShow );
    ( "847" , opt encode_TargetStrategy msg.f_MultilegOrderCancelReplace_TargetStrategy );
    ( "848" , opt encode_string msg.f_MultilegOrderCancelReplace_TargetStrategyParameters );
    ( "849" , opt encode_float_4 msg.f_MultilegOrderCancelReplace_ParticipationRate );
    ( "480" , opt encode_CancellationRights msg.f_MultilegOrderCancelReplace_CancellationRights );
    ( "481" , opt encode_MoneyLaunderingStatus msg.f_MultilegOrderCancelReplace_MoneyLaunderingStatus );
    ( "513" , opt encode_string msg.f_MultilegOrderCancelReplace_RegistID );
    ( "494" , opt encode_string msg.f_MultilegOrderCancelReplace_Designation );
    ( "563" , opt encode_MultiLegRptTypeReq msg.f_MultilegOrderCancelReplace_MultiLegRptTypeReq );
    ]
    @ repeat encode_Parties "453" msg.f_MultilegOrderCancelReplace_Parties
    @ repeat encode_PreAllocMlegGrp "78" msg.f_MultilegOrderCancelReplace_PreAllocMlegGrp
    @ repeat encode_TrdgSesGrp "386" msg.f_MultilegOrderCancelReplace_TrdgSesGrp
    @ repeat encode_UndInstrmtGrp "711" msg.f_MultilegOrderCancelReplace_UndInstrmtGrp
    @ repeat encode_LegOrdGrp "555" msg.f_MultilegOrderCancelReplace_LegOrdGrp
;;

let encode_NetworkCounterpartySystemStatusRequest msg =
    [
    ( "935" , req encode_NetworkRequestType msg.f_NetworkCounterpartySystemStatusRequest_NetworkRequestType );
    ( "933" , req encode_string msg.f_NetworkCounterpartySystemStatusRequest_NetworkRequestID );
    ]
    @ repeat encode_CompIDReqGrp "936" msg.f_NetworkCounterpartySystemStatusRequest_CompIDReqGrp
;;

let encode_NetworkCounterpartySystemStatusResponse msg =
    [
    ( "937" , req encode_NetworkStatusResponseType msg.f_NetworkCounterpartySystemStatusResponse_NetworkStatusResponseType );
    ( "933" , opt encode_string msg.f_NetworkCounterpartySystemStatusResponse_NetworkRequestID );
    ( "932" , req encode_string msg.f_NetworkCounterpartySystemStatusResponse_NetworkResponseID );
    ( "934" , opt encode_string msg.f_NetworkCounterpartySystemStatusResponse_LastNetworkResponseID );
    ]
    @ repeat encode_CompIDStatGrp "936" msg.f_NetworkCounterpartySystemStatusResponse_CompIDStatGrp
;;

let encode_NewOrderCross msg =
    encode_Instrument msg.f_NewOrderCross_Instrument @
    encode_SpreadOrBenchmarkCurveData msg.f_NewOrderCross_SpreadOrBenchmarkCurveData @
    encode_YieldData msg.f_NewOrderCross_YieldData @
    encode_PegInstructions msg.f_NewOrderCross_PegInstructions @
    encode_DiscretionInstructions msg.f_NewOrderCross_DiscretionInstructions @
    [
    ( "548" , req encode_string msg.f_NewOrderCross_CrossID );
    ( "549" , req encode_CrossType msg.f_NewOrderCross_CrossType );
    ( "550" , req encode_CrossPrioritization msg.f_NewOrderCross_CrossPrioritization );
    ( "63" , opt encode_SettlType msg.f_NewOrderCross_SettlType );
    ( "64" , opt encode_LocalMktDate msg.f_NewOrderCross_SettlDate );
    ( "21" , opt encode_HandlInst msg.f_NewOrderCross_HandlInst );
    ( "18" , opt encode_ExecInst msg.f_NewOrderCross_ExecInst );
    ( "110" , opt encode_float_4 msg.f_NewOrderCross_MinQty );
    ( "111" , opt encode_float_4 msg.f_NewOrderCross_MaxFloor );
    ( "100" , opt encode_Exchange msg.f_NewOrderCross_ExDestination );
    ( "81" , opt encode_ProcessCode msg.f_NewOrderCross_ProcessCode );
    ( "140" , opt encode_float_4 msg.f_NewOrderCross_PrevClosePx );
    ( "114" , opt encode_LocateReqd msg.f_NewOrderCross_LocateReqd );
    ( "60" , req encode_UTCTimestamp msg.f_NewOrderCross_TransactTime );
    ( "40" , req encode_OrdType msg.f_NewOrderCross_OrdType );
    ( "423" , opt encode_PriceType msg.f_NewOrderCross_PriceType );
    ( "44" , opt encode_float_4 msg.f_NewOrderCross_Price );
    ( "99" , opt encode_float_4 msg.f_NewOrderCross_StopPx );
    ( "15" , opt encode_Currency msg.f_NewOrderCross_Currency );
    ( "376" , opt encode_string msg.f_NewOrderCross_ComplianceID );
    ( "23" , opt encode_string msg.f_NewOrderCross_IOIID );
    ( "117" , opt encode_string msg.f_NewOrderCross_QuoteID );
    ( "59" , opt encode_TimeInForce msg.f_NewOrderCross_TimeInForce );
    ( "168" , opt encode_UTCTimestamp msg.f_NewOrderCross_EffectiveTime );
    ( "432" , opt encode_LocalMktDate msg.f_NewOrderCross_ExpireDate );
    ( "126" , opt encode_UTCTimestamp msg.f_NewOrderCross_ExpireTime );
    ( "427" , opt encode_GTBookingInst msg.f_NewOrderCross_GTBookingInst );
    ( "210" , opt encode_float_4 msg.f_NewOrderCross_MaxShow );
    ( "847" , opt encode_TargetStrategy msg.f_NewOrderCross_TargetStrategy );
    ( "848" , opt encode_string msg.f_NewOrderCross_TargetStrategyParameters );
    ( "849" , opt encode_float_4 msg.f_NewOrderCross_ParticipationRate );
    ( "480" , opt encode_CancellationRights msg.f_NewOrderCross_CancellationRights );
    ( "481" , opt encode_MoneyLaunderingStatus msg.f_NewOrderCross_MoneyLaunderingStatus );
    ( "513" , opt encode_string msg.f_NewOrderCross_RegistID );
    ( "494" , opt encode_string msg.f_NewOrderCross_Designation );
    ]
    @ repeat encode_SideCrossOrdModGrp "552" msg.f_NewOrderCross_SideCrossOrdModGrp
    @ repeat encode_UndInstrmtGrp "711" msg.f_NewOrderCross_UndInstrmtGrp
    @ repeat encode_InstrmtLegGrp "555" msg.f_NewOrderCross_InstrmtLegGrp
    @ repeat encode_TrdgSesGrp "386" msg.f_NewOrderCross_TrdgSesGrp
    @ repeat encode_Stipulations "232" msg.f_NewOrderCross_Stipulations
;;

let encode_NewOrderList msg =
    [
    ( "66" , req encode_string msg.f_NewOrderList_ListID );
    ( "390" , opt encode_string msg.f_NewOrderList_BidID );
    ( "391" , opt encode_string msg.f_NewOrderList_ClientBidID );
    ( "414" , opt encode_ProgRptReqs msg.f_NewOrderList_ProgRptReqs );
    ( "394" , req encode_BidType msg.f_NewOrderList_BidType );
    ( "415" , opt encode_int msg.f_NewOrderList_ProgPeriodInterval );
    ( "480" , opt encode_CancellationRights msg.f_NewOrderList_CancellationRights );
    ( "481" , opt encode_MoneyLaunderingStatus msg.f_NewOrderList_MoneyLaunderingStatus );
    ( "513" , opt encode_string msg.f_NewOrderList_RegistID );
    ( "433" , opt encode_ListExecInstType msg.f_NewOrderList_ListExecInstType );
    ( "69" , opt encode_string msg.f_NewOrderList_ListExecInst );
    ( "352" , opt encode_int msg.f_NewOrderList_EncodedListExecInstLen );
    ( "353" , opt encode_string msg.f_NewOrderList_EncodedListExecInst );
    ( "765" , opt encode_float_4 msg.f_NewOrderList_AllowableOneSidednessPct );
    ( "766" , opt encode_float_4 msg.f_NewOrderList_AllowableOneSidednessValue );
    ( "767" , opt encode_Currency msg.f_NewOrderList_AllowableOneSidednessCurr );
    ( "68" , req encode_int msg.f_NewOrderList_TotNoOrders );
    ( "893" , opt encode_LastFragment msg.f_NewOrderList_LastFragment );
    ]
    @ repeat encode_ListOrdGrp "73" msg.f_NewOrderList_ListOrdGrp
;;

let encode_NewOrderMultileg msg =
    encode_Instrument msg.f_NewOrderMultileg_Instrument @
    encode_OrderQtyData msg.f_NewOrderMultileg_OrderQtyData @
    encode_CommissionData msg.f_NewOrderMultileg_CommissionData @
    encode_PegInstructions msg.f_NewOrderMultileg_PegInstructions @
    encode_DiscretionInstructions msg.f_NewOrderMultileg_DiscretionInstructions @
    [
    ( "11" , req encode_string msg.f_NewOrderMultileg_ClOrdID );
    ( "526" , opt encode_string msg.f_NewOrderMultileg_SecondaryClOrdID );
    ( "583" , opt encode_string msg.f_NewOrderMultileg_ClOrdLinkID );
    ( "229" , opt encode_LocalMktDate msg.f_NewOrderMultileg_TradeOriginationDate );
    ( "75" , opt encode_LocalMktDate msg.f_NewOrderMultileg_TradeDate );
    ( "1" , opt encode_string msg.f_NewOrderMultileg_Account );
    ( "660" , opt encode_AcctIDSource msg.f_NewOrderMultileg_AcctIDSource );
    ( "581" , opt encode_AccountType msg.f_NewOrderMultileg_AccountType );
    ( "589" , opt encode_DayBookingInst msg.f_NewOrderMultileg_DayBookingInst );
    ( "590" , opt encode_BookingUnit msg.f_NewOrderMultileg_BookingUnit );
    ( "591" , opt encode_PreallocMethod msg.f_NewOrderMultileg_PreallocMethod );
    ( "70" , opt encode_string msg.f_NewOrderMultileg_AllocID );
    ( "63" , opt encode_SettlType msg.f_NewOrderMultileg_SettlType );
    ( "64" , opt encode_LocalMktDate msg.f_NewOrderMultileg_SettlDate );
    ( "544" , opt encode_CashMargin msg.f_NewOrderMultileg_CashMargin );
    ( "635" , opt encode_ClearingFeeIndicator msg.f_NewOrderMultileg_ClearingFeeIndicator );
    ( "21" , opt encode_HandlInst msg.f_NewOrderMultileg_HandlInst );
    ( "18" , opt encode_ExecInst msg.f_NewOrderMultileg_ExecInst );
    ( "110" , opt encode_float_4 msg.f_NewOrderMultileg_MinQty );
    ( "111" , opt encode_float_4 msg.f_NewOrderMultileg_MaxFloor );
    ( "100" , opt encode_Exchange msg.f_NewOrderMultileg_ExDestination );
    ( "81" , opt encode_ProcessCode msg.f_NewOrderMultileg_ProcessCode );
    ( "54" , req encode_Side msg.f_NewOrderMultileg_Side );
    ( "140" , opt encode_float_4 msg.f_NewOrderMultileg_PrevClosePx );
    ( "114" , opt encode_LocateReqd msg.f_NewOrderMultileg_LocateReqd );
    ( "60" , req encode_UTCTimestamp msg.f_NewOrderMultileg_TransactTime );
    ( "854" , opt encode_QtyType msg.f_NewOrderMultileg_QtyType );
    ( "40" , req encode_OrdType msg.f_NewOrderMultileg_OrdType );
    ( "423" , opt encode_PriceType msg.f_NewOrderMultileg_PriceType );
    ( "44" , opt encode_float_4 msg.f_NewOrderMultileg_Price );
    ( "99" , opt encode_float_4 msg.f_NewOrderMultileg_StopPx );
    ( "15" , opt encode_Currency msg.f_NewOrderMultileg_Currency );
    ( "376" , opt encode_string msg.f_NewOrderMultileg_ComplianceID );
    ( "377" , opt encode_SolicitedFlag msg.f_NewOrderMultileg_SolicitedFlag );
    ( "23" , opt encode_string msg.f_NewOrderMultileg_IOIID );
    ( "117" , opt encode_string msg.f_NewOrderMultileg_QuoteID );
    ( "59" , opt encode_TimeInForce msg.f_NewOrderMultileg_TimeInForce );
    ( "168" , opt encode_UTCTimestamp msg.f_NewOrderMultileg_EffectiveTime );
    ( "432" , opt encode_LocalMktDate msg.f_NewOrderMultileg_ExpireDate );
    ( "126" , opt encode_UTCTimestamp msg.f_NewOrderMultileg_ExpireTime );
    ( "427" , opt encode_GTBookingInst msg.f_NewOrderMultileg_GTBookingInst );
    ( "528" , opt encode_OrderCapacity msg.f_NewOrderMultileg_OrderCapacity );
    ( "529" , opt encode_OrderRestrictions msg.f_NewOrderMultileg_OrderRestrictions );
    ( "582" , opt encode_CustOrderCapacity msg.f_NewOrderMultileg_CustOrderCapacity );
    ( "121" , opt encode_ForexReq msg.f_NewOrderMultileg_ForexReq );
    ( "120" , opt encode_Currency msg.f_NewOrderMultileg_SettlCurrency );
    ( "775" , opt encode_BookingType msg.f_NewOrderMultileg_BookingType );
    ( "58" , opt encode_string msg.f_NewOrderMultileg_Text );
    ( "354" , opt encode_int msg.f_NewOrderMultileg_EncodedTextLen );
    ( "355" , opt encode_string msg.f_NewOrderMultileg_EncodedText );
    ( "77" , opt encode_PositionEffect msg.f_NewOrderMultileg_PositionEffect );
    ( "203" , opt encode_CoveredOrUncovered msg.f_NewOrderMultileg_CoveredOrUncovered );
    ( "210" , opt encode_float_4 msg.f_NewOrderMultileg_MaxShow );
    ( "847" , opt encode_TargetStrategy msg.f_NewOrderMultileg_TargetStrategy );
    ( "848" , opt encode_string msg.f_NewOrderMultileg_TargetStrategyParameters );
    ( "849" , opt encode_float_4 msg.f_NewOrderMultileg_ParticipationRate );
    ( "480" , opt encode_CancellationRights msg.f_NewOrderMultileg_CancellationRights );
    ( "481" , opt encode_MoneyLaunderingStatus msg.f_NewOrderMultileg_MoneyLaunderingStatus );
    ( "513" , opt encode_string msg.f_NewOrderMultileg_RegistID );
    ( "494" , opt encode_string msg.f_NewOrderMultileg_Designation );
    ( "563" , opt encode_MultiLegRptTypeReq msg.f_NewOrderMultileg_MultiLegRptTypeReq );
    ]
    @ repeat encode_Parties "453" msg.f_NewOrderMultileg_Parties
    @ repeat encode_PreAllocMlegGrp "78" msg.f_NewOrderMultileg_PreAllocMlegGrp
    @ repeat encode_TrdgSesGrp "386" msg.f_NewOrderMultileg_TrdgSesGrp
    @ repeat encode_UndInstrmtGrp "711" msg.f_NewOrderMultileg_UndInstrmtGrp
    @ repeat encode_LegOrdGrp "555" msg.f_NewOrderMultileg_LegOrdGrp
;;

let encode_NewOrderSingle msg =
    encode_Instrument msg.f_NewOrderSingle_Instrument @
    encode_FinancingDetails msg.f_NewOrderSingle_FinancingDetails @
    encode_OrderQtyData msg.f_NewOrderSingle_OrderQtyData @
    encode_SpreadOrBenchmarkCurveData msg.f_NewOrderSingle_SpreadOrBenchmarkCurveData @
    encode_YieldData msg.f_NewOrderSingle_YieldData @
    encode_CommissionData msg.f_NewOrderSingle_CommissionData @
    encode_PegInstructions msg.f_NewOrderSingle_PegInstructions @
    encode_DiscretionInstructions msg.f_NewOrderSingle_DiscretionInstructions @
    [
    ( "11" , req encode_string msg.f_NewOrderSingle_ClOrdID );
    ( "526" , opt encode_string msg.f_NewOrderSingle_SecondaryClOrdID );
    ( "583" , opt encode_string msg.f_NewOrderSingle_ClOrdLinkID );
    ( "229" , opt encode_LocalMktDate msg.f_NewOrderSingle_TradeOriginationDate );
    ( "75" , opt encode_LocalMktDate msg.f_NewOrderSingle_TradeDate );
    ( "1" , opt encode_string msg.f_NewOrderSingle_Account );
    ( "660" , opt encode_AcctIDSource msg.f_NewOrderSingle_AcctIDSource );
    ( "581" , opt encode_AccountType msg.f_NewOrderSingle_AccountType );
    ( "589" , opt encode_DayBookingInst msg.f_NewOrderSingle_DayBookingInst );
    ( "590" , opt encode_BookingUnit msg.f_NewOrderSingle_BookingUnit );
    ( "591" , opt encode_PreallocMethod msg.f_NewOrderSingle_PreallocMethod );
    ( "70" , opt encode_string msg.f_NewOrderSingle_AllocID );
    ( "63" , opt encode_SettlType msg.f_NewOrderSingle_SettlType );
    ( "64" , opt encode_LocalMktDate msg.f_NewOrderSingle_SettlDate );
    ( "544" , opt encode_CashMargin msg.f_NewOrderSingle_CashMargin );
    ( "635" , opt encode_ClearingFeeIndicator msg.f_NewOrderSingle_ClearingFeeIndicator );
    ( "21" , opt encode_HandlInst msg.f_NewOrderSingle_HandlInst );
    ( "18" , opt encode_ExecInst msg.f_NewOrderSingle_ExecInst );
    ( "110" , opt encode_float_4 msg.f_NewOrderSingle_MinQty );
    ( "111" , opt encode_float_4 msg.f_NewOrderSingle_MaxFloor );
    ( "100" , opt encode_Exchange msg.f_NewOrderSingle_ExDestination );
    ( "81" , opt encode_ProcessCode msg.f_NewOrderSingle_ProcessCode );
    ( "140" , opt encode_float_4 msg.f_NewOrderSingle_PrevClosePx );
    ( "54" , req encode_Side msg.f_NewOrderSingle_Side );
    ( "114" , opt encode_LocateReqd msg.f_NewOrderSingle_LocateReqd );
    ( "60" , req encode_UTCTimestamp msg.f_NewOrderSingle_TransactTime );
    ( "854" , opt encode_QtyType msg.f_NewOrderSingle_QtyType );
    ( "40" , req encode_OrdType msg.f_NewOrderSingle_OrdType );
    ( "423" , opt encode_PriceType msg.f_NewOrderSingle_PriceType );
    ( "44" , opt encode_float_4 msg.f_NewOrderSingle_Price );
    ( "99" , opt encode_float_4 msg.f_NewOrderSingle_StopPx );
    ( "15" , opt encode_Currency msg.f_NewOrderSingle_Currency );
    ( "376" , opt encode_string msg.f_NewOrderSingle_ComplianceID );
    ( "377" , opt encode_SolicitedFlag msg.f_NewOrderSingle_SolicitedFlag );
    ( "23" , opt encode_string msg.f_NewOrderSingle_IOIID );
    ( "117" , opt encode_string msg.f_NewOrderSingle_QuoteID );
    ( "59" , opt encode_TimeInForce msg.f_NewOrderSingle_TimeInForce );
    ( "168" , opt encode_UTCTimestamp msg.f_NewOrderSingle_EffectiveTime );
    ( "432" , opt encode_LocalMktDate msg.f_NewOrderSingle_ExpireDate );
    ( "126" , opt encode_UTCTimestamp msg.f_NewOrderSingle_ExpireTime );
    ( "427" , opt encode_GTBookingInst msg.f_NewOrderSingle_GTBookingInst );
    ( "528" , opt encode_OrderCapacity msg.f_NewOrderSingle_OrderCapacity );
    ( "529" , opt encode_OrderRestrictions msg.f_NewOrderSingle_OrderRestrictions );
    ( "582" , opt encode_CustOrderCapacity msg.f_NewOrderSingle_CustOrderCapacity );
    ( "121" , opt encode_ForexReq msg.f_NewOrderSingle_ForexReq );
    ( "120" , opt encode_Currency msg.f_NewOrderSingle_SettlCurrency );
    ( "775" , opt encode_BookingType msg.f_NewOrderSingle_BookingType );
    ( "58" , opt encode_string msg.f_NewOrderSingle_Text );
    ( "354" , opt encode_int msg.f_NewOrderSingle_EncodedTextLen );
    ( "355" , opt encode_string msg.f_NewOrderSingle_EncodedText );
    ( "193" , opt encode_LocalMktDate msg.f_NewOrderSingle_SettlDate2 );
    ( "192" , opt encode_float_4 msg.f_NewOrderSingle_OrderQty2 );
    ( "640" , opt encode_float_4 msg.f_NewOrderSingle_Price2 );
    ( "77" , opt encode_PositionEffect msg.f_NewOrderSingle_PositionEffect );
    ( "203" , opt encode_CoveredOrUncovered msg.f_NewOrderSingle_CoveredOrUncovered );
    ( "210" , opt encode_float_4 msg.f_NewOrderSingle_MaxShow );
    ( "847" , opt encode_TargetStrategy msg.f_NewOrderSingle_TargetStrategy );
    ( "848" , opt encode_string msg.f_NewOrderSingle_TargetStrategyParameters );
    ( "849" , opt encode_float_4 msg.f_NewOrderSingle_ParticipationRate );
    ( "480" , opt encode_CancellationRights msg.f_NewOrderSingle_CancellationRights );
    ( "481" , opt encode_MoneyLaunderingStatus msg.f_NewOrderSingle_MoneyLaunderingStatus );
    ( "513" , opt encode_string msg.f_NewOrderSingle_RegistID );
    ( "494" , opt encode_string msg.f_NewOrderSingle_Designation );
    ]
    @ repeat encode_Parties "453" msg.f_NewOrderSingle_Parties
    @ repeat encode_PreAllocGrp "78" msg.f_NewOrderSingle_PreAllocGrp
    @ repeat encode_TrdgSesGrp "386" msg.f_NewOrderSingle_TrdgSesGrp
    @ repeat encode_UndInstrmtGrp "711" msg.f_NewOrderSingle_UndInstrmtGrp
    @ repeat encode_Stipulations "232" msg.f_NewOrderSingle_Stipulations
;;

let encode_News msg =
    [
    ( "42" , opt encode_UTCTimestamp msg.f_News_OrigTime );
    ( "61" , opt encode_Urgency msg.f_News_Urgency );
    ( "148" , req encode_string msg.f_News_Headline );
    ( "358" , opt encode_int msg.f_News_EncodedHeadlineLen );
    ( "359" , opt encode_string msg.f_News_EncodedHeadline );
    ( "149" , opt encode_string msg.f_News_URLLink );
    ( "95" , opt encode_int msg.f_News_RawDataLength );
    ( "96" , opt encode_string msg.f_News_RawData );
    ]
    @ repeat encode_RoutingGrp "215" msg.f_News_RoutingGrp
    @ repeat encode_InstrmtGrp "146" msg.f_News_InstrmtGrp
    @ repeat encode_InstrmtLegGrp "555" msg.f_News_InstrmtLegGrp
    @ repeat encode_UndInstrmtGrp "711" msg.f_News_UndInstrmtGrp
    @ repeat encode_LinesOfTextGrp "33" msg.f_News_LinesOfTextGrp
;;

let encode_OrderCancelReject msg =
    [
    ( "37" , req encode_string msg.f_OrderCancelReject_OrderID );
    ( "198" , opt encode_string msg.f_OrderCancelReject_SecondaryOrderID );
    ( "526" , opt encode_string msg.f_OrderCancelReject_SecondaryClOrdID );
    ( "11" , req encode_string msg.f_OrderCancelReject_ClOrdID );
    ( "583" , opt encode_string msg.f_OrderCancelReject_ClOrdLinkID );
    ( "41" , req encode_string msg.f_OrderCancelReject_OrigClOrdID );
    ( "39" , req encode_OrdStatus msg.f_OrderCancelReject_OrdStatus );
    ( "636" , opt encode_WorkingIndicator msg.f_OrderCancelReject_WorkingIndicator );
    ( "586" , opt encode_UTCTimestamp msg.f_OrderCancelReject_OrigOrdModTime );
    ( "66" , opt encode_string msg.f_OrderCancelReject_ListID );
    ( "1" , opt encode_string msg.f_OrderCancelReject_Account );
    ( "660" , opt encode_AcctIDSource msg.f_OrderCancelReject_AcctIDSource );
    ( "581" , opt encode_AccountType msg.f_OrderCancelReject_AccountType );
    ( "229" , opt encode_LocalMktDate msg.f_OrderCancelReject_TradeOriginationDate );
    ( "75" , opt encode_LocalMktDate msg.f_OrderCancelReject_TradeDate );
    ( "60" , opt encode_UTCTimestamp msg.f_OrderCancelReject_TransactTime );
    ( "434" , req encode_CxlRejResponseTo msg.f_OrderCancelReject_CxlRejResponseTo );
    ( "102" , opt encode_CxlRejReason msg.f_OrderCancelReject_CxlRejReason );
    ( "58" , opt encode_string msg.f_OrderCancelReject_Text );
    ( "354" , opt encode_int msg.f_OrderCancelReject_EncodedTextLen );
    ( "355" , opt encode_string msg.f_OrderCancelReject_EncodedText );
    ]
;;

let encode_OrderCancelReplaceRequest msg =
    encode_Instrument msg.f_OrderCancelReplaceRequest_Instrument @
    encode_FinancingDetails msg.f_OrderCancelReplaceRequest_FinancingDetails @
    encode_OrderQtyData msg.f_OrderCancelReplaceRequest_OrderQtyData @
    encode_SpreadOrBenchmarkCurveData msg.f_OrderCancelReplaceRequest_SpreadOrBenchmarkCurveData @
    encode_YieldData msg.f_OrderCancelReplaceRequest_YieldData @
    encode_PegInstructions msg.f_OrderCancelReplaceRequest_PegInstructions @
    encode_DiscretionInstructions msg.f_OrderCancelReplaceRequest_DiscretionInstructions @
    encode_CommissionData msg.f_OrderCancelReplaceRequest_CommissionData @
    [
    ( "37" , opt encode_string msg.f_OrderCancelReplaceRequest_OrderID );
    ( "229" , opt encode_LocalMktDate msg.f_OrderCancelReplaceRequest_TradeOriginationDate );
    ( "75" , opt encode_LocalMktDate msg.f_OrderCancelReplaceRequest_TradeDate );
    ( "41" , req encode_string msg.f_OrderCancelReplaceRequest_OrigClOrdID );
    ( "11" , req encode_string msg.f_OrderCancelReplaceRequest_ClOrdID );
    ( "526" , opt encode_string msg.f_OrderCancelReplaceRequest_SecondaryClOrdID );
    ( "583" , opt encode_string msg.f_OrderCancelReplaceRequest_ClOrdLinkID );
    ( "66" , opt encode_string msg.f_OrderCancelReplaceRequest_ListID );
    ( "586" , opt encode_UTCTimestamp msg.f_OrderCancelReplaceRequest_OrigOrdModTime );
    ( "1" , opt encode_string msg.f_OrderCancelReplaceRequest_Account );
    ( "660" , opt encode_AcctIDSource msg.f_OrderCancelReplaceRequest_AcctIDSource );
    ( "581" , opt encode_AccountType msg.f_OrderCancelReplaceRequest_AccountType );
    ( "589" , opt encode_DayBookingInst msg.f_OrderCancelReplaceRequest_DayBookingInst );
    ( "590" , opt encode_BookingUnit msg.f_OrderCancelReplaceRequest_BookingUnit );
    ( "591" , opt encode_PreallocMethod msg.f_OrderCancelReplaceRequest_PreallocMethod );
    ( "70" , opt encode_string msg.f_OrderCancelReplaceRequest_AllocID );
    ( "63" , opt encode_SettlType msg.f_OrderCancelReplaceRequest_SettlType );
    ( "64" , opt encode_LocalMktDate msg.f_OrderCancelReplaceRequest_SettlDate );
    ( "544" , opt encode_CashMargin msg.f_OrderCancelReplaceRequest_CashMargin );
    ( "635" , opt encode_ClearingFeeIndicator msg.f_OrderCancelReplaceRequest_ClearingFeeIndicator );
    ( "21" , opt encode_HandlInst msg.f_OrderCancelReplaceRequest_HandlInst );
    ( "18" , opt encode_ExecInst msg.f_OrderCancelReplaceRequest_ExecInst );
    ( "110" , opt encode_float_4 msg.f_OrderCancelReplaceRequest_MinQty );
    ( "111" , opt encode_float_4 msg.f_OrderCancelReplaceRequest_MaxFloor );
    ( "100" , opt encode_Exchange msg.f_OrderCancelReplaceRequest_ExDestination );
    ( "54" , req encode_Side msg.f_OrderCancelReplaceRequest_Side );
    ( "60" , req encode_UTCTimestamp msg.f_OrderCancelReplaceRequest_TransactTime );
    ( "854" , opt encode_QtyType msg.f_OrderCancelReplaceRequest_QtyType );
    ( "40" , req encode_OrdType msg.f_OrderCancelReplaceRequest_OrdType );
    ( "423" , opt encode_PriceType msg.f_OrderCancelReplaceRequest_PriceType );
    ( "44" , opt encode_float_4 msg.f_OrderCancelReplaceRequest_Price );
    ( "99" , opt encode_float_4 msg.f_OrderCancelReplaceRequest_StopPx );
    ( "847" , opt encode_TargetStrategy msg.f_OrderCancelReplaceRequest_TargetStrategy );
    ( "848" , opt encode_string msg.f_OrderCancelReplaceRequest_TargetStrategyParameters );
    ( "849" , opt encode_float_4 msg.f_OrderCancelReplaceRequest_ParticipationRate );
    ( "376" , opt encode_string msg.f_OrderCancelReplaceRequest_ComplianceID );
    ( "377" , opt encode_SolicitedFlag msg.f_OrderCancelReplaceRequest_SolicitedFlag );
    ( "15" , opt encode_Currency msg.f_OrderCancelReplaceRequest_Currency );
    ( "59" , opt encode_TimeInForce msg.f_OrderCancelReplaceRequest_TimeInForce );
    ( "168" , opt encode_UTCTimestamp msg.f_OrderCancelReplaceRequest_EffectiveTime );
    ( "432" , opt encode_LocalMktDate msg.f_OrderCancelReplaceRequest_ExpireDate );
    ( "126" , opt encode_UTCTimestamp msg.f_OrderCancelReplaceRequest_ExpireTime );
    ( "427" , opt encode_GTBookingInst msg.f_OrderCancelReplaceRequest_GTBookingInst );
    ( "528" , opt encode_OrderCapacity msg.f_OrderCancelReplaceRequest_OrderCapacity );
    ( "529" , opt encode_OrderRestrictions msg.f_OrderCancelReplaceRequest_OrderRestrictions );
    ( "582" , opt encode_CustOrderCapacity msg.f_OrderCancelReplaceRequest_CustOrderCapacity );
    ( "121" , opt encode_ForexReq msg.f_OrderCancelReplaceRequest_ForexReq );
    ( "120" , opt encode_Currency msg.f_OrderCancelReplaceRequest_SettlCurrency );
    ( "775" , opt encode_BookingType msg.f_OrderCancelReplaceRequest_BookingType );
    ( "58" , opt encode_string msg.f_OrderCancelReplaceRequest_Text );
    ( "354" , opt encode_int msg.f_OrderCancelReplaceRequest_EncodedTextLen );
    ( "355" , opt encode_string msg.f_OrderCancelReplaceRequest_EncodedText );
    ( "193" , opt encode_LocalMktDate msg.f_OrderCancelReplaceRequest_SettlDate2 );
    ( "192" , opt encode_float_4 msg.f_OrderCancelReplaceRequest_OrderQty2 );
    ( "640" , opt encode_float_4 msg.f_OrderCancelReplaceRequest_Price2 );
    ( "77" , opt encode_PositionEffect msg.f_OrderCancelReplaceRequest_PositionEffect );
    ( "203" , opt encode_CoveredOrUncovered msg.f_OrderCancelReplaceRequest_CoveredOrUncovered );
    ( "210" , opt encode_float_4 msg.f_OrderCancelReplaceRequest_MaxShow );
    ( "114" , opt encode_LocateReqd msg.f_OrderCancelReplaceRequest_LocateReqd );
    ( "480" , opt encode_CancellationRights msg.f_OrderCancelReplaceRequest_CancellationRights );
    ( "481" , opt encode_MoneyLaunderingStatus msg.f_OrderCancelReplaceRequest_MoneyLaunderingStatus );
    ( "513" , opt encode_string msg.f_OrderCancelReplaceRequest_RegistID );
    ( "494" , opt encode_string msg.f_OrderCancelReplaceRequest_Designation );
    ]
    @ repeat encode_Parties "453" msg.f_OrderCancelReplaceRequest_Parties
    @ repeat encode_PreAllocGrp "78" msg.f_OrderCancelReplaceRequest_PreAllocGrp
    @ repeat encode_TrdgSesGrp "386" msg.f_OrderCancelReplaceRequest_TrdgSesGrp
    @ repeat encode_UndInstrmtGrp "711" msg.f_OrderCancelReplaceRequest_UndInstrmtGrp
;;

let encode_OrderCancelRequest msg =
    encode_Instrument msg.f_OrderCancelRequest_Instrument @
    encode_FinancingDetails msg.f_OrderCancelRequest_FinancingDetails @
    encode_OrderQtyData msg.f_OrderCancelRequest_OrderQtyData @
    [
    ( "41" , req encode_string msg.f_OrderCancelRequest_OrigClOrdID );
    ( "37" , opt encode_string msg.f_OrderCancelRequest_OrderID );
    ( "11" , req encode_string msg.f_OrderCancelRequest_ClOrdID );
    ( "526" , opt encode_string msg.f_OrderCancelRequest_SecondaryClOrdID );
    ( "583" , opt encode_string msg.f_OrderCancelRequest_ClOrdLinkID );
    ( "66" , opt encode_string msg.f_OrderCancelRequest_ListID );
    ( "586" , opt encode_UTCTimestamp msg.f_OrderCancelRequest_OrigOrdModTime );
    ( "1" , opt encode_string msg.f_OrderCancelRequest_Account );
    ( "660" , opt encode_AcctIDSource msg.f_OrderCancelRequest_AcctIDSource );
    ( "581" , opt encode_AccountType msg.f_OrderCancelRequest_AccountType );
    ( "54" , req encode_Side msg.f_OrderCancelRequest_Side );
    ( "60" , req encode_UTCTimestamp msg.f_OrderCancelRequest_TransactTime );
    ( "376" , opt encode_string msg.f_OrderCancelRequest_ComplianceID );
    ( "58" , opt encode_string msg.f_OrderCancelRequest_Text );
    ( "354" , opt encode_int msg.f_OrderCancelRequest_EncodedTextLen );
    ( "355" , opt encode_string msg.f_OrderCancelRequest_EncodedText );
    ]
    @ repeat encode_Parties "453" msg.f_OrderCancelRequest_Parties
    @ repeat encode_UndInstrmtGrp "711" msg.f_OrderCancelRequest_UndInstrmtGrp
;;

let encode_OrderMassCancelReport msg =
    encode_Instrument msg.f_OrderMassCancelReport_Instrument @
    encode_UnderlyingInstrument msg.f_OrderMassCancelReport_UnderlyingInstrument @
    [
    ( "11" , opt encode_string msg.f_OrderMassCancelReport_ClOrdID );
    ( "526" , opt encode_string msg.f_OrderMassCancelReport_SecondaryClOrdID );
    ( "37" , req encode_string msg.f_OrderMassCancelReport_OrderID );
    ( "198" , opt encode_string msg.f_OrderMassCancelReport_SecondaryOrderID );
    ( "530" , req encode_MassCancelRequestType msg.f_OrderMassCancelReport_MassCancelRequestType );
    ( "531" , req encode_MassCancelResponse msg.f_OrderMassCancelReport_MassCancelResponse );
    ( "532" , opt encode_MassCancelRejectReason msg.f_OrderMassCancelReport_MassCancelRejectReason );
    ( "533" , opt encode_int msg.f_OrderMassCancelReport_TotalAffectedOrders );
    ( "336" , opt encode_string msg.f_OrderMassCancelReport_TradingSessionID );
    ( "625" , opt encode_string msg.f_OrderMassCancelReport_TradingSessionSubID );
    ( "54" , opt encode_Side msg.f_OrderMassCancelReport_Side );
    ( "60" , opt encode_UTCTimestamp msg.f_OrderMassCancelReport_TransactTime );
    ( "58" , opt encode_string msg.f_OrderMassCancelReport_Text );
    ( "354" , opt encode_int msg.f_OrderMassCancelReport_EncodedTextLen );
    ( "355" , opt encode_string msg.f_OrderMassCancelReport_EncodedText );
    ]
    @ repeat encode_AffectedOrdGrp "534" msg.f_OrderMassCancelReport_AffectedOrdGrp
;;

let encode_OrderMassCancelRequest msg =
    encode_Instrument msg.f_OrderMassCancelRequest_Instrument @
    encode_UnderlyingInstrument msg.f_OrderMassCancelRequest_UnderlyingInstrument @
    [
    ( "11" , req encode_string msg.f_OrderMassCancelRequest_ClOrdID );
    ( "526" , opt encode_string msg.f_OrderMassCancelRequest_SecondaryClOrdID );
    ( "530" , req encode_MassCancelRequestType msg.f_OrderMassCancelRequest_MassCancelRequestType );
    ( "336" , opt encode_string msg.f_OrderMassCancelRequest_TradingSessionID );
    ( "625" , opt encode_string msg.f_OrderMassCancelRequest_TradingSessionSubID );
    ( "54" , opt encode_Side msg.f_OrderMassCancelRequest_Side );
    ( "60" , req encode_UTCTimestamp msg.f_OrderMassCancelRequest_TransactTime );
    ( "58" , opt encode_string msg.f_OrderMassCancelRequest_Text );
    ( "354" , opt encode_int msg.f_OrderMassCancelRequest_EncodedTextLen );
    ( "355" , opt encode_string msg.f_OrderMassCancelRequest_EncodedText );
    ]
;;

let encode_OrderMassStatusRequest msg =
    encode_Instrument msg.f_OrderMassStatusRequest_Instrument @
    encode_UnderlyingInstrument msg.f_OrderMassStatusRequest_UnderlyingInstrument @
    [
    ( "584" , req encode_string msg.f_OrderMassStatusRequest_MassStatusReqID );
    ( "585" , req encode_MassStatusReqType msg.f_OrderMassStatusRequest_MassStatusReqType );
    ( "1" , opt encode_string msg.f_OrderMassStatusRequest_Account );
    ( "660" , opt encode_AcctIDSource msg.f_OrderMassStatusRequest_AcctIDSource );
    ( "336" , opt encode_string msg.f_OrderMassStatusRequest_TradingSessionID );
    ( "625" , opt encode_string msg.f_OrderMassStatusRequest_TradingSessionSubID );
    ( "54" , opt encode_Side msg.f_OrderMassStatusRequest_Side );
    ]
    @ repeat encode_Parties "453" msg.f_OrderMassStatusRequest_Parties
;;

let encode_OrderStatusRequest msg =
    encode_Instrument msg.f_OrderStatusRequest_Instrument @
    encode_FinancingDetails msg.f_OrderStatusRequest_FinancingDetails @
    [
    ( "37" , opt encode_string msg.f_OrderStatusRequest_OrderID );
    ( "11" , req encode_string msg.f_OrderStatusRequest_ClOrdID );
    ( "526" , opt encode_string msg.f_OrderStatusRequest_SecondaryClOrdID );
    ( "583" , opt encode_string msg.f_OrderStatusRequest_ClOrdLinkID );
    ( "790" , opt encode_string msg.f_OrderStatusRequest_OrdStatusReqID );
    ( "1" , opt encode_string msg.f_OrderStatusRequest_Account );
    ( "660" , opt encode_AcctIDSource msg.f_OrderStatusRequest_AcctIDSource );
    ( "54" , req encode_Side msg.f_OrderStatusRequest_Side );
    ]
    @ repeat encode_Parties "453" msg.f_OrderStatusRequest_Parties
    @ repeat encode_UndInstrmtGrp "711" msg.f_OrderStatusRequest_UndInstrmtGrp
;;

let encode_PositionMaintenanceReport msg =
    encode_Instrument msg.f_PositionMaintenanceReport_Instrument @
    [
    ( "721" , req encode_string msg.f_PositionMaintenanceReport_PosMaintRptID );
    ( "709" , req encode_PosTransType msg.f_PositionMaintenanceReport_PosTransType );
    ( "710" , opt encode_string msg.f_PositionMaintenanceReport_PosReqID );
    ( "712" , req encode_PosMaintAction msg.f_PositionMaintenanceReport_PosMaintAction );
    ( "713" , req encode_string msg.f_PositionMaintenanceReport_OrigPosReqRefID );
    ( "722" , req encode_PosMaintStatus msg.f_PositionMaintenanceReport_PosMaintStatus );
    ( "723" , opt encode_PosMaintResult msg.f_PositionMaintenanceReport_PosMaintResult );
    ( "715" , req encode_LocalMktDate msg.f_PositionMaintenanceReport_ClearingBusinessDate );
    ( "716" , opt encode_SettlSessID msg.f_PositionMaintenanceReport_SettlSessID );
    ( "717" , opt encode_string msg.f_PositionMaintenanceReport_SettlSessSubID );
    ( "1" , req encode_string msg.f_PositionMaintenanceReport_Account );
    ( "660" , opt encode_AcctIDSource msg.f_PositionMaintenanceReport_AcctIDSource );
    ( "581" , req encode_AccountType msg.f_PositionMaintenanceReport_AccountType );
    ( "15" , opt encode_Currency msg.f_PositionMaintenanceReport_Currency );
    ( "60" , req encode_UTCTimestamp msg.f_PositionMaintenanceReport_TransactTime );
    ( "718" , opt encode_AdjustmentType msg.f_PositionMaintenanceReport_AdjustmentType );
    ( "834" , opt encode_float_4 msg.f_PositionMaintenanceReport_ThresholdAmount );
    ( "58" , opt encode_string msg.f_PositionMaintenanceReport_Text );
    ( "354" , opt encode_int msg.f_PositionMaintenanceReport_EncodedTextLen );
    ( "355" , opt encode_string msg.f_PositionMaintenanceReport_EncodedText );
    ]
    @ repeat encode_Parties "453" msg.f_PositionMaintenanceReport_Parties
    @ repeat encode_InstrmtLegGrp "555" msg.f_PositionMaintenanceReport_InstrmtLegGrp
    @ repeat encode_UndInstrmtGrp "711" msg.f_PositionMaintenanceReport_UndInstrmtGrp
    @ repeat encode_TrdgSesGrp "386" msg.f_PositionMaintenanceReport_TrdgSesGrp
    @ repeat encode_PositionQty "702" msg.f_PositionMaintenanceReport_PositionQty
    @ repeat encode_PositionAmountData "753" msg.f_PositionMaintenanceReport_PositionAmountData
;;

let encode_PositionMaintenanceRequest msg =
    encode_Instrument msg.f_PositionMaintenanceRequest_Instrument @
    [
    ( "710" , req encode_string msg.f_PositionMaintenanceRequest_PosReqID );
    ( "709" , req encode_PosTransType msg.f_PositionMaintenanceRequest_PosTransType );
    ( "712" , req encode_PosMaintAction msg.f_PositionMaintenanceRequest_PosMaintAction );
    ( "713" , opt encode_string msg.f_PositionMaintenanceRequest_OrigPosReqRefID );
    ( "714" , opt encode_string msg.f_PositionMaintenanceRequest_PosMaintRptRefID );
    ( "715" , req encode_LocalMktDate msg.f_PositionMaintenanceRequest_ClearingBusinessDate );
    ( "716" , opt encode_SettlSessID msg.f_PositionMaintenanceRequest_SettlSessID );
    ( "717" , opt encode_string msg.f_PositionMaintenanceRequest_SettlSessSubID );
    ( "1" , req encode_string msg.f_PositionMaintenanceRequest_Account );
    ( "660" , opt encode_AcctIDSource msg.f_PositionMaintenanceRequest_AcctIDSource );
    ( "581" , req encode_AccountType msg.f_PositionMaintenanceRequest_AccountType );
    ( "15" , opt encode_Currency msg.f_PositionMaintenanceRequest_Currency );
    ( "60" , req encode_UTCTimestamp msg.f_PositionMaintenanceRequest_TransactTime );
    ( "718" , opt encode_AdjustmentType msg.f_PositionMaintenanceRequest_AdjustmentType );
    ( "719" , opt encode_bool msg.f_PositionMaintenanceRequest_ContraryInstructionIndicator );
    ( "720" , opt encode_bool msg.f_PositionMaintenanceRequest_PriorSpreadIndicator );
    ( "834" , opt encode_float_4 msg.f_PositionMaintenanceRequest_ThresholdAmount );
    ( "58" , opt encode_string msg.f_PositionMaintenanceRequest_Text );
    ( "354" , opt encode_int msg.f_PositionMaintenanceRequest_EncodedTextLen );
    ( "355" , opt encode_string msg.f_PositionMaintenanceRequest_EncodedText );
    ]
    @ repeat encode_Parties "453" msg.f_PositionMaintenanceRequest_Parties
    @ repeat encode_InstrmtLegGrp "555" msg.f_PositionMaintenanceRequest_InstrmtLegGrp
    @ repeat encode_UndInstrmtGrp "711" msg.f_PositionMaintenanceRequest_UndInstrmtGrp
    @ repeat encode_TrdgSesGrp "386" msg.f_PositionMaintenanceRequest_TrdgSesGrp
    @ repeat encode_PositionQty "702" msg.f_PositionMaintenanceRequest_PositionQty
;;

let encode_PositionReport msg =
    encode_Instrument msg.f_PositionReport_Instrument @
    [
    ( "721" , req encode_string msg.f_PositionReport_PosMaintRptID );
    ( "710" , opt encode_string msg.f_PositionReport_PosReqID );
    ( "724" , opt encode_PosReqType msg.f_PositionReport_PosReqType );
    ( "263" , opt encode_SubscriptionRequestType msg.f_PositionReport_SubscriptionRequestType );
    ( "727" , opt encode_int msg.f_PositionReport_TotalNumPosReports );
    ( "325" , opt encode_UnsolicitedIndicator msg.f_PositionReport_UnsolicitedIndicator );
    ( "728" , req encode_PosReqResult msg.f_PositionReport_PosReqResult );
    ( "715" , req encode_LocalMktDate msg.f_PositionReport_ClearingBusinessDate );
    ( "716" , opt encode_SettlSessID msg.f_PositionReport_SettlSessID );
    ( "717" , opt encode_string msg.f_PositionReport_SettlSessSubID );
    ( "1" , req encode_string msg.f_PositionReport_Account );
    ( "660" , opt encode_AcctIDSource msg.f_PositionReport_AcctIDSource );
    ( "581" , req encode_AccountType msg.f_PositionReport_AccountType );
    ( "15" , opt encode_Currency msg.f_PositionReport_Currency );
    ( "730" , req encode_float_4 msg.f_PositionReport_SettlPrice );
    ( "731" , req encode_SettlPriceType msg.f_PositionReport_SettlPriceType );
    ( "734" , req encode_float_4 msg.f_PositionReport_PriorSettlPrice );
    ( "506" , opt encode_RegistStatus msg.f_PositionReport_RegistStatus );
    ( "743" , opt encode_LocalMktDate msg.f_PositionReport_DeliveryDate );
    ( "58" , opt encode_string msg.f_PositionReport_Text );
    ( "354" , opt encode_int msg.f_PositionReport_EncodedTextLen );
    ( "355" , opt encode_string msg.f_PositionReport_EncodedText );
    ]
    @ repeat encode_Parties "453" msg.f_PositionReport_Parties
    @ repeat encode_InstrmtLegGrp "555" msg.f_PositionReport_InstrmtLegGrp
    @ repeat encode_PosUndInstrmtGrp "711" msg.f_PositionReport_PosUndInstrmtGrp
    @ repeat encode_PositionQty "702" msg.f_PositionReport_PositionQty
    @ repeat encode_PositionAmountData "753" msg.f_PositionReport_PositionAmountData
;;

let encode_Quote msg =
    encode_Instrument msg.f_Quote_Instrument @
    encode_FinancingDetails msg.f_Quote_FinancingDetails @
    encode_OrderQtyData msg.f_Quote_OrderQtyData @
    encode_SpreadOrBenchmarkCurveData msg.f_Quote_SpreadOrBenchmarkCurveData @
    encode_YieldData msg.f_Quote_YieldData @
    [
    ( "131" , opt encode_string msg.f_Quote_QuoteReqID );
    ( "117" , req encode_string msg.f_Quote_QuoteID );
    ( "693" , opt encode_string msg.f_Quote_QuoteRespID );
    ( "537" , opt encode_QuoteType msg.f_Quote_QuoteType );
    ( "301" , opt encode_QuoteResponseLevel msg.f_Quote_QuoteResponseLevel );
    ( "336" , opt encode_string msg.f_Quote_TradingSessionID );
    ( "625" , opt encode_string msg.f_Quote_TradingSessionSubID );
    ( "54" , opt encode_Side msg.f_Quote_Side );
    ( "63" , opt encode_SettlType msg.f_Quote_SettlType );
    ( "64" , opt encode_LocalMktDate msg.f_Quote_SettlDate );
    ( "193" , opt encode_LocalMktDate msg.f_Quote_SettlDate2 );
    ( "192" , opt encode_float_4 msg.f_Quote_OrderQty2 );
    ( "15" , opt encode_Currency msg.f_Quote_Currency );
    ( "1" , opt encode_string msg.f_Quote_Account );
    ( "660" , opt encode_AcctIDSource msg.f_Quote_AcctIDSource );
    ( "581" , opt encode_AccountType msg.f_Quote_AccountType );
    ( "132" , opt encode_float_4 msg.f_Quote_BidPx );
    ( "133" , opt encode_float_4 msg.f_Quote_OfferPx );
    ( "645" , opt encode_float_4 msg.f_Quote_MktBidPx );
    ( "646" , opt encode_float_4 msg.f_Quote_MktOfferPx );
    ( "647" , opt encode_float_4 msg.f_Quote_MinBidSize );
    ( "134" , opt encode_float_4 msg.f_Quote_BidSize );
    ( "648" , opt encode_float_4 msg.f_Quote_MinOfferSize );
    ( "135" , opt encode_float_4 msg.f_Quote_OfferSize );
    ( "62" , opt encode_UTCTimestamp msg.f_Quote_ValidUntilTime );
    ( "188" , opt encode_float_4 msg.f_Quote_BidSpotRate );
    ( "190" , opt encode_float_4 msg.f_Quote_OfferSpotRate );
    ( "189" , opt encode_float_4 msg.f_Quote_BidForwardPoints );
    ( "191" , opt encode_float_4 msg.f_Quote_OfferForwardPoints );
    ( "631" , opt encode_float_4 msg.f_Quote_MidPx );
    ( "632" , opt encode_float_4 msg.f_Quote_BidYield );
    ( "633" , opt encode_float_4 msg.f_Quote_MidYield );
    ( "634" , opt encode_float_4 msg.f_Quote_OfferYield );
    ( "60" , opt encode_UTCTimestamp msg.f_Quote_TransactTime );
    ( "40" , opt encode_OrdType msg.f_Quote_OrdType );
    ( "642" , opt encode_float_4 msg.f_Quote_BidForwardPoints2 );
    ( "643" , opt encode_float_4 msg.f_Quote_OfferForwardPoints2 );
    ( "656" , opt encode_float_4 msg.f_Quote_SettlCurrBidFxRate );
    ( "657" , opt encode_float_4 msg.f_Quote_SettlCurrOfferFxRate );
    ( "156" , opt encode_SettlCurrFxRateCalc msg.f_Quote_SettlCurrFxRateCalc );
    ( "13" , opt encode_CommType msg.f_Quote_CommType );
    ( "12" , opt encode_float_4 msg.f_Quote_Commission );
    ( "582" , opt encode_CustOrderCapacity msg.f_Quote_CustOrderCapacity );
    ( "100" , opt encode_Exchange msg.f_Quote_ExDestination );
    ( "528" , opt encode_OrderCapacity msg.f_Quote_OrderCapacity );
    ( "423" , opt encode_PriceType msg.f_Quote_PriceType );
    ( "58" , opt encode_string msg.f_Quote_Text );
    ( "354" , opt encode_int msg.f_Quote_EncodedTextLen );
    ( "355" , opt encode_string msg.f_Quote_EncodedText );
    ]
    @ repeat encode_QuotQualGrp "735" msg.f_Quote_QuotQualGrp
    @ repeat encode_Parties "453" msg.f_Quote_Parties
    @ repeat encode_UndInstrmtGrp "711" msg.f_Quote_UndInstrmtGrp
    @ repeat encode_Stipulations "232" msg.f_Quote_Stipulations
    @ repeat encode_LegQuotGrp "555" msg.f_Quote_LegQuotGrp
;;

let encode_QuoteCancel msg =
    [
    ( "131" , opt encode_string msg.f_QuoteCancel_QuoteReqID );
    ( "117" , req encode_string msg.f_QuoteCancel_QuoteID );
    ( "298" , req encode_QuoteCancelType msg.f_QuoteCancel_QuoteCancelType );
    ( "301" , opt encode_QuoteResponseLevel msg.f_QuoteCancel_QuoteResponseLevel );
    ( "1" , opt encode_string msg.f_QuoteCancel_Account );
    ( "660" , opt encode_AcctIDSource msg.f_QuoteCancel_AcctIDSource );
    ( "581" , opt encode_AccountType msg.f_QuoteCancel_AccountType );
    ( "336" , opt encode_string msg.f_QuoteCancel_TradingSessionID );
    ( "625" , opt encode_string msg.f_QuoteCancel_TradingSessionSubID );
    ]
    @ repeat encode_Parties "453" msg.f_QuoteCancel_Parties
    @ repeat encode_QuotCxlEntriesGrp "295" msg.f_QuoteCancel_QuotCxlEntriesGrp
;;

let encode_QuoteRequest msg =
    [
    ( "131" , req encode_string msg.f_QuoteRequest_QuoteReqID );
    ( "644" , opt encode_string msg.f_QuoteRequest_RFQReqID );
    ( "11" , opt encode_string msg.f_QuoteRequest_ClOrdID );
    ( "528" , opt encode_OrderCapacity msg.f_QuoteRequest_OrderCapacity );
    ( "58" , opt encode_string msg.f_QuoteRequest_Text );
    ( "354" , opt encode_int msg.f_QuoteRequest_EncodedTextLen );
    ( "355" , opt encode_string msg.f_QuoteRequest_EncodedText );
    ]
    @ repeat encode_QuotReqGrp "146" msg.f_QuoteRequest_QuotReqGrp
;;

let encode_QuoteRequestReject msg =
    [
    ( "131" , req encode_string msg.f_QuoteRequestReject_QuoteReqID );
    ( "644" , opt encode_string msg.f_QuoteRequestReject_RFQReqID );
    ( "658" , req encode_QuoteRequestRejectReason msg.f_QuoteRequestReject_QuoteRequestRejectReason );
    ( "58" , opt encode_string msg.f_QuoteRequestReject_Text );
    ( "354" , opt encode_int msg.f_QuoteRequestReject_EncodedTextLen );
    ( "355" , opt encode_string msg.f_QuoteRequestReject_EncodedText );
    ]
    @ repeat encode_QuotReqRjctGrp "146" msg.f_QuoteRequestReject_QuotReqRjctGrp
;;

let encode_QuoteResponse msg =
    encode_Instrument msg.f_QuoteResponse_Instrument @
    encode_FinancingDetails msg.f_QuoteResponse_FinancingDetails @
    encode_OrderQtyData msg.f_QuoteResponse_OrderQtyData @
    encode_SpreadOrBenchmarkCurveData msg.f_QuoteResponse_SpreadOrBenchmarkCurveData @
    encode_YieldData msg.f_QuoteResponse_YieldData @
    [
    ( "693" , req encode_string msg.f_QuoteResponse_QuoteRespID );
    ( "117" , opt encode_string msg.f_QuoteResponse_QuoteID );
    ( "694" , req encode_QuoteRespType msg.f_QuoteResponse_QuoteRespType );
    ( "11" , opt encode_string msg.f_QuoteResponse_ClOrdID );
    ( "528" , opt encode_OrderCapacity msg.f_QuoteResponse_OrderCapacity );
    ( "23" , opt encode_string msg.f_QuoteResponse_IOIID );
    ( "537" , opt encode_QuoteType msg.f_QuoteResponse_QuoteType );
    ( "336" , opt encode_string msg.f_QuoteResponse_TradingSessionID );
    ( "625" , opt encode_string msg.f_QuoteResponse_TradingSessionSubID );
    ( "54" , opt encode_Side msg.f_QuoteResponse_Side );
    ( "63" , opt encode_SettlType msg.f_QuoteResponse_SettlType );
    ( "64" , opt encode_LocalMktDate msg.f_QuoteResponse_SettlDate );
    ( "193" , opt encode_LocalMktDate msg.f_QuoteResponse_SettlDate2 );
    ( "192" , opt encode_float_4 msg.f_QuoteResponse_OrderQty2 );
    ( "15" , opt encode_Currency msg.f_QuoteResponse_Currency );
    ( "1" , opt encode_string msg.f_QuoteResponse_Account );
    ( "660" , opt encode_AcctIDSource msg.f_QuoteResponse_AcctIDSource );
    ( "581" , opt encode_AccountType msg.f_QuoteResponse_AccountType );
    ( "132" , opt encode_float_4 msg.f_QuoteResponse_BidPx );
    ( "133" , opt encode_float_4 msg.f_QuoteResponse_OfferPx );
    ( "645" , opt encode_float_4 msg.f_QuoteResponse_MktBidPx );
    ( "646" , opt encode_float_4 msg.f_QuoteResponse_MktOfferPx );
    ( "647" , opt encode_float_4 msg.f_QuoteResponse_MinBidSize );
    ( "134" , opt encode_float_4 msg.f_QuoteResponse_BidSize );
    ( "648" , opt encode_float_4 msg.f_QuoteResponse_MinOfferSize );
    ( "135" , opt encode_float_4 msg.f_QuoteResponse_OfferSize );
    ( "62" , opt encode_UTCTimestamp msg.f_QuoteResponse_ValidUntilTime );
    ( "188" , opt encode_float_4 msg.f_QuoteResponse_BidSpotRate );
    ( "190" , opt encode_float_4 msg.f_QuoteResponse_OfferSpotRate );
    ( "189" , opt encode_float_4 msg.f_QuoteResponse_BidForwardPoints );
    ( "191" , opt encode_float_4 msg.f_QuoteResponse_OfferForwardPoints );
    ( "631" , opt encode_float_4 msg.f_QuoteResponse_MidPx );
    ( "632" , opt encode_float_4 msg.f_QuoteResponse_BidYield );
    ( "633" , opt encode_float_4 msg.f_QuoteResponse_MidYield );
    ( "634" , opt encode_float_4 msg.f_QuoteResponse_OfferYield );
    ( "60" , opt encode_UTCTimestamp msg.f_QuoteResponse_TransactTime );
    ( "40" , opt encode_OrdType msg.f_QuoteResponse_OrdType );
    ( "642" , opt encode_float_4 msg.f_QuoteResponse_BidForwardPoints2 );
    ( "643" , opt encode_float_4 msg.f_QuoteResponse_OfferForwardPoints2 );
    ( "656" , opt encode_float_4 msg.f_QuoteResponse_SettlCurrBidFxRate );
    ( "657" , opt encode_float_4 msg.f_QuoteResponse_SettlCurrOfferFxRate );
    ( "156" , opt encode_SettlCurrFxRateCalc msg.f_QuoteResponse_SettlCurrFxRateCalc );
    ( "12" , opt encode_float_4 msg.f_QuoteResponse_Commission );
    ( "13" , opt encode_CommType msg.f_QuoteResponse_CommType );
    ( "582" , opt encode_CustOrderCapacity msg.f_QuoteResponse_CustOrderCapacity );
    ( "100" , opt encode_Exchange msg.f_QuoteResponse_ExDestination );
    ( "58" , opt encode_string msg.f_QuoteResponse_Text );
    ( "354" , opt encode_int msg.f_QuoteResponse_EncodedTextLen );
    ( "355" , opt encode_string msg.f_QuoteResponse_EncodedText );
    ( "44" , opt encode_float_4 msg.f_QuoteResponse_Price );
    ( "423" , opt encode_PriceType msg.f_QuoteResponse_PriceType );
    ]
    @ repeat encode_QuotQualGrp "735" msg.f_QuoteResponse_QuotQualGrp
    @ repeat encode_Parties "453" msg.f_QuoteResponse_Parties
    @ repeat encode_UndInstrmtGrp "711" msg.f_QuoteResponse_UndInstrmtGrp
    @ repeat encode_Stipulations "232" msg.f_QuoteResponse_Stipulations
    @ repeat encode_LegQuotGrp "555" msg.f_QuoteResponse_LegQuotGrp
;;

let encode_QuoteStatusReport msg =
    encode_Instrument msg.f_QuoteStatusReport_Instrument @
    encode_FinancingDetails msg.f_QuoteStatusReport_FinancingDetails @
    encode_OrderQtyData msg.f_QuoteStatusReport_OrderQtyData @
    encode_SpreadOrBenchmarkCurveData msg.f_QuoteStatusReport_SpreadOrBenchmarkCurveData @
    encode_YieldData msg.f_QuoteStatusReport_YieldData @
    [
    ( "649" , opt encode_string msg.f_QuoteStatusReport_QuoteStatusReqID );
    ( "131" , opt encode_string msg.f_QuoteStatusReport_QuoteReqID );
    ( "117" , req encode_string msg.f_QuoteStatusReport_QuoteID );
    ( "693" , opt encode_string msg.f_QuoteStatusReport_QuoteRespID );
    ( "537" , opt encode_QuoteType msg.f_QuoteStatusReport_QuoteType );
    ( "336" , opt encode_string msg.f_QuoteStatusReport_TradingSessionID );
    ( "625" , opt encode_string msg.f_QuoteStatusReport_TradingSessionSubID );
    ( "54" , opt encode_Side msg.f_QuoteStatusReport_Side );
    ( "63" , opt encode_SettlType msg.f_QuoteStatusReport_SettlType );
    ( "64" , opt encode_LocalMktDate msg.f_QuoteStatusReport_SettlDate );
    ( "193" , opt encode_LocalMktDate msg.f_QuoteStatusReport_SettlDate2 );
    ( "192" , opt encode_float_4 msg.f_QuoteStatusReport_OrderQty2 );
    ( "15" , opt encode_Currency msg.f_QuoteStatusReport_Currency );
    ( "1" , opt encode_string msg.f_QuoteStatusReport_Account );
    ( "660" , opt encode_AcctIDSource msg.f_QuoteStatusReport_AcctIDSource );
    ( "581" , opt encode_AccountType msg.f_QuoteStatusReport_AccountType );
    ( "126" , opt encode_UTCTimestamp msg.f_QuoteStatusReport_ExpireTime );
    ( "44" , opt encode_float_4 msg.f_QuoteStatusReport_Price );
    ( "423" , opt encode_PriceType msg.f_QuoteStatusReport_PriceType );
    ( "132" , opt encode_float_4 msg.f_QuoteStatusReport_BidPx );
    ( "133" , opt encode_float_4 msg.f_QuoteStatusReport_OfferPx );
    ( "645" , opt encode_float_4 msg.f_QuoteStatusReport_MktBidPx );
    ( "646" , opt encode_float_4 msg.f_QuoteStatusReport_MktOfferPx );
    ( "647" , opt encode_float_4 msg.f_QuoteStatusReport_MinBidSize );
    ( "134" , opt encode_float_4 msg.f_QuoteStatusReport_BidSize );
    ( "648" , opt encode_float_4 msg.f_QuoteStatusReport_MinOfferSize );
    ( "135" , opt encode_float_4 msg.f_QuoteStatusReport_OfferSize );
    ( "62" , opt encode_UTCTimestamp msg.f_QuoteStatusReport_ValidUntilTime );
    ( "188" , opt encode_float_4 msg.f_QuoteStatusReport_BidSpotRate );
    ( "190" , opt encode_float_4 msg.f_QuoteStatusReport_OfferSpotRate );
    ( "189" , opt encode_float_4 msg.f_QuoteStatusReport_BidForwardPoints );
    ( "191" , opt encode_float_4 msg.f_QuoteStatusReport_OfferForwardPoints );
    ( "631" , opt encode_float_4 msg.f_QuoteStatusReport_MidPx );
    ( "632" , opt encode_float_4 msg.f_QuoteStatusReport_BidYield );
    ( "633" , opt encode_float_4 msg.f_QuoteStatusReport_MidYield );
    ( "634" , opt encode_float_4 msg.f_QuoteStatusReport_OfferYield );
    ( "60" , opt encode_UTCTimestamp msg.f_QuoteStatusReport_TransactTime );
    ( "40" , opt encode_OrdType msg.f_QuoteStatusReport_OrdType );
    ( "642" , opt encode_float_4 msg.f_QuoteStatusReport_BidForwardPoints2 );
    ( "643" , opt encode_float_4 msg.f_QuoteStatusReport_OfferForwardPoints2 );
    ( "656" , opt encode_float_4 msg.f_QuoteStatusReport_SettlCurrBidFxRate );
    ( "657" , opt encode_float_4 msg.f_QuoteStatusReport_SettlCurrOfferFxRate );
    ( "156" , opt encode_SettlCurrFxRateCalc msg.f_QuoteStatusReport_SettlCurrFxRateCalc );
    ( "13" , opt encode_CommType msg.f_QuoteStatusReport_CommType );
    ( "12" , opt encode_float_4 msg.f_QuoteStatusReport_Commission );
    ( "582" , opt encode_CustOrderCapacity msg.f_QuoteStatusReport_CustOrderCapacity );
    ( "100" , opt encode_Exchange msg.f_QuoteStatusReport_ExDestination );
    ( "297" , opt encode_QuoteStatus msg.f_QuoteStatusReport_QuoteStatus );
    ( "58" , opt encode_string msg.f_QuoteStatusReport_Text );
    ( "354" , opt encode_int msg.f_QuoteStatusReport_EncodedTextLen );
    ( "355" , opt encode_string msg.f_QuoteStatusReport_EncodedText );
    ]
    @ repeat encode_Parties "453" msg.f_QuoteStatusReport_Parties
    @ repeat encode_UndInstrmtGrp "711" msg.f_QuoteStatusReport_UndInstrmtGrp
    @ repeat encode_Stipulations "232" msg.f_QuoteStatusReport_Stipulations
    @ repeat encode_LegQuotStatGrp "555" msg.f_QuoteStatusReport_LegQuotStatGrp
    @ repeat encode_QuotQualGrp "735" msg.f_QuoteStatusReport_QuotQualGrp
;;

let encode_QuoteStatusRequest msg =
    encode_Instrument msg.f_QuoteStatusRequest_Instrument @
    encode_FinancingDetails msg.f_QuoteStatusRequest_FinancingDetails @
    [
    ( "649" , opt encode_string msg.f_QuoteStatusRequest_QuoteStatusReqID );
    ( "117" , opt encode_string msg.f_QuoteStatusRequest_QuoteID );
    ( "1" , opt encode_string msg.f_QuoteStatusRequest_Account );
    ( "660" , opt encode_AcctIDSource msg.f_QuoteStatusRequest_AcctIDSource );
    ( "581" , opt encode_AccountType msg.f_QuoteStatusRequest_AccountType );
    ( "336" , opt encode_string msg.f_QuoteStatusRequest_TradingSessionID );
    ( "625" , opt encode_string msg.f_QuoteStatusRequest_TradingSessionSubID );
    ( "263" , opt encode_SubscriptionRequestType msg.f_QuoteStatusRequest_SubscriptionRequestType );
    ]
    @ repeat encode_UndInstrmtGrp "711" msg.f_QuoteStatusRequest_UndInstrmtGrp
    @ repeat encode_InstrmtLegGrp "555" msg.f_QuoteStatusRequest_InstrmtLegGrp
    @ repeat encode_Parties "453" msg.f_QuoteStatusRequest_Parties
;;

let encode_RFQRequest msg =
    [
    ( "644" , req encode_string msg.f_RFQRequest_RFQReqID );
    ( "263" , opt encode_SubscriptionRequestType msg.f_RFQRequest_SubscriptionRequestType );
    ]
    @ repeat encode_RFQReqGrp "146" msg.f_RFQRequest_RFQReqGrp
;;

let encode_RegistrationInstructions msg =
    [
    ( "513" , req encode_string msg.f_RegistrationInstructions_RegistID );
    ( "514" , req encode_RegistTransType msg.f_RegistrationInstructions_RegistTransType );
    ( "508" , req encode_string msg.f_RegistrationInstructions_RegistRefID );
    ( "11" , opt encode_string msg.f_RegistrationInstructions_ClOrdID );
    ( "1" , opt encode_string msg.f_RegistrationInstructions_Account );
    ( "660" , opt encode_AcctIDSource msg.f_RegistrationInstructions_AcctIDSource );
    ( "493" , opt encode_string msg.f_RegistrationInstructions_RegistAcctType );
    ( "495" , opt encode_TaxAdvantageType msg.f_RegistrationInstructions_TaxAdvantageType );
    ( "517" , opt encode_OwnershipType msg.f_RegistrationInstructions_OwnershipType );
    ]
    @ repeat encode_Parties "453" msg.f_RegistrationInstructions_Parties
    @ repeat encode_RgstDtlsGrp "473" msg.f_RegistrationInstructions_RgstDtlsGrp
    @ repeat encode_RgstDistInstGrp "510" msg.f_RegistrationInstructions_RgstDistInstGrp
;;

let encode_RegistrationInstructionsResponse msg =
    [
    ( "513" , req encode_string msg.f_RegistrationInstructionsResponse_RegistID );
    ( "514" , req encode_RegistTransType msg.f_RegistrationInstructionsResponse_RegistTransType );
    ( "508" , req encode_string msg.f_RegistrationInstructionsResponse_RegistRefID );
    ( "11" , opt encode_string msg.f_RegistrationInstructionsResponse_ClOrdID );
    ( "1" , opt encode_string msg.f_RegistrationInstructionsResponse_Account );
    ( "660" , opt encode_AcctIDSource msg.f_RegistrationInstructionsResponse_AcctIDSource );
    ( "506" , req encode_RegistStatus msg.f_RegistrationInstructionsResponse_RegistStatus );
    ( "507" , opt encode_RegistRejReasonCode msg.f_RegistrationInstructionsResponse_RegistRejReasonCode );
    ( "496" , opt encode_string msg.f_RegistrationInstructionsResponse_RegistRejReasonText );
    ]
    @ repeat encode_Parties "453" msg.f_RegistrationInstructionsResponse_Parties
;;

let encode_RequestForPositions msg =
    encode_Instrument msg.f_RequestForPositions_Instrument @
    [
    ( "710" , req encode_string msg.f_RequestForPositions_PosReqID );
    ( "724" , req encode_PosReqType msg.f_RequestForPositions_PosReqType );
    ( "573" , opt encode_MatchStatus msg.f_RequestForPositions_MatchStatus );
    ( "263" , opt encode_SubscriptionRequestType msg.f_RequestForPositions_SubscriptionRequestType );
    ( "1" , req encode_string msg.f_RequestForPositions_Account );
    ( "660" , opt encode_AcctIDSource msg.f_RequestForPositions_AcctIDSource );
    ( "581" , req encode_AccountType msg.f_RequestForPositions_AccountType );
    ( "15" , opt encode_Currency msg.f_RequestForPositions_Currency );
    ( "715" , req encode_LocalMktDate msg.f_RequestForPositions_ClearingBusinessDate );
    ( "716" , opt encode_SettlSessID msg.f_RequestForPositions_SettlSessID );
    ( "717" , opt encode_string msg.f_RequestForPositions_SettlSessSubID );
    ( "60" , req encode_UTCTimestamp msg.f_RequestForPositions_TransactTime );
    ( "725" , opt encode_ResponseTransportType msg.f_RequestForPositions_ResponseTransportType );
    ( "726" , opt encode_string msg.f_RequestForPositions_ResponseDestination );
    ( "58" , opt encode_string msg.f_RequestForPositions_Text );
    ( "354" , opt encode_int msg.f_RequestForPositions_EncodedTextLen );
    ( "355" , opt encode_string msg.f_RequestForPositions_EncodedText );
    ]
    @ repeat encode_Parties "453" msg.f_RequestForPositions_Parties
    @ repeat encode_InstrmtLegGrp "555" msg.f_RequestForPositions_InstrmtLegGrp
    @ repeat encode_UndInstrmtGrp "711" msg.f_RequestForPositions_UndInstrmtGrp
    @ repeat encode_TrdgSesGrp "386" msg.f_RequestForPositions_TrdgSesGrp
;;

let encode_RequestForPositionsAck msg =
    encode_Instrument msg.f_RequestForPositionsAck_Instrument @
    [
    ( "721" , req encode_string msg.f_RequestForPositionsAck_PosMaintRptID );
    ( "710" , opt encode_string msg.f_RequestForPositionsAck_PosReqID );
    ( "727" , opt encode_int msg.f_RequestForPositionsAck_TotalNumPosReports );
    ( "325" , opt encode_UnsolicitedIndicator msg.f_RequestForPositionsAck_UnsolicitedIndicator );
    ( "728" , req encode_PosReqResult msg.f_RequestForPositionsAck_PosReqResult );
    ( "729" , req encode_PosReqStatus msg.f_RequestForPositionsAck_PosReqStatus );
    ( "1" , req encode_string msg.f_RequestForPositionsAck_Account );
    ( "660" , opt encode_AcctIDSource msg.f_RequestForPositionsAck_AcctIDSource );
    ( "581" , req encode_AccountType msg.f_RequestForPositionsAck_AccountType );
    ( "15" , opt encode_Currency msg.f_RequestForPositionsAck_Currency );
    ( "725" , opt encode_ResponseTransportType msg.f_RequestForPositionsAck_ResponseTransportType );
    ( "726" , opt encode_string msg.f_RequestForPositionsAck_ResponseDestination );
    ( "58" , opt encode_string msg.f_RequestForPositionsAck_Text );
    ( "354" , opt encode_int msg.f_RequestForPositionsAck_EncodedTextLen );
    ( "355" , opt encode_string msg.f_RequestForPositionsAck_EncodedText );
    ]
    @ repeat encode_Parties "453" msg.f_RequestForPositionsAck_Parties
    @ repeat encode_InstrmtLegGrp "555" msg.f_RequestForPositionsAck_InstrmtLegGrp
    @ repeat encode_UndInstrmtGrp "711" msg.f_RequestForPositionsAck_UndInstrmtGrp
;;

let encode_SecurityDefinition msg =
    encode_Instrument msg.f_SecurityDefinition_Instrument @
    encode_InstrumentExtension msg.f_SecurityDefinition_InstrumentExtension @
    [
    ( "320" , req encode_string msg.f_SecurityDefinition_SecurityReqID );
    ( "322" , req encode_string msg.f_SecurityDefinition_SecurityResponseID );
    ( "323" , req encode_SecurityResponseType msg.f_SecurityDefinition_SecurityResponseType );
    ( "15" , opt encode_Currency msg.f_SecurityDefinition_Currency );
    ( "336" , opt encode_string msg.f_SecurityDefinition_TradingSessionID );
    ( "625" , opt encode_string msg.f_SecurityDefinition_TradingSessionSubID );
    ( "58" , opt encode_string msg.f_SecurityDefinition_Text );
    ( "354" , opt encode_int msg.f_SecurityDefinition_EncodedTextLen );
    ( "355" , opt encode_string msg.f_SecurityDefinition_EncodedText );
    ( "827" , opt encode_ExpirationCycle msg.f_SecurityDefinition_ExpirationCycle );
    ( "561" , opt encode_float_4 msg.f_SecurityDefinition_RoundLot );
    ( "562" , opt encode_float_4 msg.f_SecurityDefinition_MinTradeVol );
    ]
    @ repeat encode_UndInstrmtGrp "711" msg.f_SecurityDefinition_UndInstrmtGrp
    @ repeat encode_InstrmtLegGrp "555" msg.f_SecurityDefinition_InstrmtLegGrp
;;

let encode_SecurityDefinitionRequest msg =
    encode_Instrument msg.f_SecurityDefinitionRequest_Instrument @
    encode_InstrumentExtension msg.f_SecurityDefinitionRequest_InstrumentExtension @
    [
    ( "320" , req encode_string msg.f_SecurityDefinitionRequest_SecurityReqID );
    ( "321" , req encode_SecurityRequestType msg.f_SecurityDefinitionRequest_SecurityRequestType );
    ( "15" , opt encode_Currency msg.f_SecurityDefinitionRequest_Currency );
    ( "58" , opt encode_string msg.f_SecurityDefinitionRequest_Text );
    ( "354" , opt encode_int msg.f_SecurityDefinitionRequest_EncodedTextLen );
    ( "355" , opt encode_string msg.f_SecurityDefinitionRequest_EncodedText );
    ( "336" , opt encode_string msg.f_SecurityDefinitionRequest_TradingSessionID );
    ( "625" , opt encode_string msg.f_SecurityDefinitionRequest_TradingSessionSubID );
    ( "827" , opt encode_ExpirationCycle msg.f_SecurityDefinitionRequest_ExpirationCycle );
    ( "263" , opt encode_SubscriptionRequestType msg.f_SecurityDefinitionRequest_SubscriptionRequestType );
    ]
    @ repeat encode_UndInstrmtGrp "711" msg.f_SecurityDefinitionRequest_UndInstrmtGrp
    @ repeat encode_InstrmtLegGrp "555" msg.f_SecurityDefinitionRequest_InstrmtLegGrp
;;

let encode_SecurityList msg =
    [
    ( "320" , req encode_string msg.f_SecurityList_SecurityReqID );
    ( "322" , req encode_string msg.f_SecurityList_SecurityResponseID );
    ( "560" , req encode_SecurityRequestResult msg.f_SecurityList_SecurityRequestResult );
    ( "393" , opt encode_int msg.f_SecurityList_TotNoRelatedSym );
    ( "893" , opt encode_LastFragment msg.f_SecurityList_LastFragment );
    ]
    @ repeat encode_SecListGrp "146" msg.f_SecurityList_SecListGrp
;;

let encode_SecurityListRequest msg =
    encode_Instrument msg.f_SecurityListRequest_Instrument @
    encode_InstrumentExtension msg.f_SecurityListRequest_InstrumentExtension @
    encode_FinancingDetails msg.f_SecurityListRequest_FinancingDetails @
    [
    ( "320" , req encode_string msg.f_SecurityListRequest_SecurityReqID );
    ( "559" , req encode_SecurityListRequestType msg.f_SecurityListRequest_SecurityListRequestType );
    ( "15" , opt encode_Currency msg.f_SecurityListRequest_Currency );
    ( "58" , opt encode_string msg.f_SecurityListRequest_Text );
    ( "354" , opt encode_int msg.f_SecurityListRequest_EncodedTextLen );
    ( "355" , opt encode_string msg.f_SecurityListRequest_EncodedText );
    ( "336" , opt encode_string msg.f_SecurityListRequest_TradingSessionID );
    ( "625" , opt encode_string msg.f_SecurityListRequest_TradingSessionSubID );
    ( "263" , opt encode_SubscriptionRequestType msg.f_SecurityListRequest_SubscriptionRequestType );
    ]
    @ repeat encode_UndInstrmtGrp "711" msg.f_SecurityListRequest_UndInstrmtGrp
    @ repeat encode_InstrmtLegGrp "555" msg.f_SecurityListRequest_InstrmtLegGrp
;;

let encode_SecurityStatus msg =
    encode_Instrument msg.f_SecurityStatus_Instrument @
    encode_InstrumentExtension msg.f_SecurityStatus_InstrumentExtension @
    [
    ( "324" , opt encode_string msg.f_SecurityStatus_SecurityStatusReqID );
    ( "15" , opt encode_Currency msg.f_SecurityStatus_Currency );
    ( "336" , opt encode_string msg.f_SecurityStatus_TradingSessionID );
    ( "625" , opt encode_string msg.f_SecurityStatus_TradingSessionSubID );
    ( "325" , opt encode_UnsolicitedIndicator msg.f_SecurityStatus_UnsolicitedIndicator );
    ( "326" , opt encode_SecurityTradingStatus msg.f_SecurityStatus_SecurityTradingStatus );
    ( "291" , opt encode_FinancialStatus msg.f_SecurityStatus_FinancialStatus );
    ( "292" , opt encode_CorporateAction msg.f_SecurityStatus_CorporateAction );
    ( "327" , opt encode_HaltReason msg.f_SecurityStatus_HaltReason );
    ( "328" , opt encode_InViewOfCommon msg.f_SecurityStatus_InViewOfCommon );
    ( "329" , opt encode_DueToRelated msg.f_SecurityStatus_DueToRelated );
    ( "330" , opt encode_float_4 msg.f_SecurityStatus_BuyVolume );
    ( "331" , opt encode_float_4 msg.f_SecurityStatus_SellVolume );
    ( "332" , opt encode_float_4 msg.f_SecurityStatus_HighPx );
    ( "333" , opt encode_float_4 msg.f_SecurityStatus_LowPx );
    ( "31" , opt encode_float_4 msg.f_SecurityStatus_LastPx );
    ( "60" , opt encode_UTCTimestamp msg.f_SecurityStatus_TransactTime );
    ( "334" , opt encode_Adjustment msg.f_SecurityStatus_Adjustment );
    ( "58" , opt encode_string msg.f_SecurityStatus_Text );
    ( "354" , opt encode_int msg.f_SecurityStatus_EncodedTextLen );
    ( "355" , opt encode_string msg.f_SecurityStatus_EncodedText );
    ]
    @ repeat encode_UndInstrmtGrp "711" msg.f_SecurityStatus_UndInstrmtGrp
    @ repeat encode_InstrmtLegGrp "555" msg.f_SecurityStatus_InstrmtLegGrp
;;

let encode_SecurityStatusRequest msg =
    encode_Instrument msg.f_SecurityStatusRequest_Instrument @
    encode_InstrumentExtension msg.f_SecurityStatusRequest_InstrumentExtension @
    [
    ( "324" , req encode_string msg.f_SecurityStatusRequest_SecurityStatusReqID );
    ( "15" , opt encode_Currency msg.f_SecurityStatusRequest_Currency );
    ( "263" , req encode_SubscriptionRequestType msg.f_SecurityStatusRequest_SubscriptionRequestType );
    ( "336" , opt encode_string msg.f_SecurityStatusRequest_TradingSessionID );
    ( "625" , opt encode_string msg.f_SecurityStatusRequest_TradingSessionSubID );
    ]
    @ repeat encode_UndInstrmtGrp "711" msg.f_SecurityStatusRequest_UndInstrmtGrp
    @ repeat encode_InstrmtLegGrp "555" msg.f_SecurityStatusRequest_InstrmtLegGrp
;;

let encode_SecurityTypeRequest msg =
    [
    ( "320" , req encode_string msg.f_SecurityTypeRequest_SecurityReqID );
    ( "58" , opt encode_string msg.f_SecurityTypeRequest_Text );
    ( "354" , opt encode_int msg.f_SecurityTypeRequest_EncodedTextLen );
    ( "355" , opt encode_string msg.f_SecurityTypeRequest_EncodedText );
    ( "336" , opt encode_string msg.f_SecurityTypeRequest_TradingSessionID );
    ( "625" , opt encode_string msg.f_SecurityTypeRequest_TradingSessionSubID );
    ( "460" , opt encode_Product msg.f_SecurityTypeRequest_Product );
    ( "167" , opt encode_SecurityType msg.f_SecurityTypeRequest_SecurityType );
    ( "762" , opt encode_string msg.f_SecurityTypeRequest_SecuritySubType );
    ]
;;

let encode_SecurityTypes msg =
    [
    ( "320" , req encode_string msg.f_SecurityTypes_SecurityReqID );
    ( "322" , req encode_string msg.f_SecurityTypes_SecurityResponseID );
    ( "323" , req encode_SecurityResponseType msg.f_SecurityTypes_SecurityResponseType );
    ( "557" , opt encode_int msg.f_SecurityTypes_TotNoSecurityTypes );
    ( "893" , opt encode_LastFragment msg.f_SecurityTypes_LastFragment );
    ( "58" , opt encode_string msg.f_SecurityTypes_Text );
    ( "354" , opt encode_int msg.f_SecurityTypes_EncodedTextLen );
    ( "355" , opt encode_string msg.f_SecurityTypes_EncodedText );
    ( "336" , opt encode_string msg.f_SecurityTypes_TradingSessionID );
    ( "625" , opt encode_string msg.f_SecurityTypes_TradingSessionSubID );
    ( "263" , opt encode_SubscriptionRequestType msg.f_SecurityTypes_SubscriptionRequestType );
    ]
    @ repeat encode_SecTypesGrp "558" msg.f_SecurityTypes_SecTypesGrp
;;

let encode_SettlementInstructionRequest msg =
    [
    ( "791" , req encode_string msg.f_SettlementInstructionRequest_SettlInstReqID );
    ( "60" , req encode_UTCTimestamp msg.f_SettlementInstructionRequest_TransactTime );
    ( "79" , opt encode_string msg.f_SettlementInstructionRequest_AllocAccount );
    ( "661" , opt encode_int msg.f_SettlementInstructionRequest_AllocAcctIDSource );
    ( "54" , opt encode_Side msg.f_SettlementInstructionRequest_Side );
    ( "460" , opt encode_Product msg.f_SettlementInstructionRequest_Product );
    ( "167" , opt encode_SecurityType msg.f_SettlementInstructionRequest_SecurityType );
    ( "461" , opt encode_string msg.f_SettlementInstructionRequest_CFICode );
    ( "168" , opt encode_UTCTimestamp msg.f_SettlementInstructionRequest_EffectiveTime );
    ( "126" , opt encode_UTCTimestamp msg.f_SettlementInstructionRequest_ExpireTime );
    ( "779" , opt encode_UTCTimestamp msg.f_SettlementInstructionRequest_LastUpdateTime );
    ( "169" , opt encode_StandInstDbType msg.f_SettlementInstructionRequest_StandInstDbType );
    ( "170" , opt encode_string msg.f_SettlementInstructionRequest_StandInstDbName );
    ( "171" , opt encode_string msg.f_SettlementInstructionRequest_StandInstDbID );
    ]
    @ repeat encode_Parties "453" msg.f_SettlementInstructionRequest_Parties
;;

let encode_SettlementInstructions msg =
    [
    ( "777" , req encode_string msg.f_SettlementInstructions_SettlInstMsgID );
    ( "791" , opt encode_string msg.f_SettlementInstructions_SettlInstReqID );
    ( "160" , req encode_SettlInstMode msg.f_SettlementInstructions_SettlInstMode );
    ( "792" , opt encode_SettlInstReqRejCode msg.f_SettlementInstructions_SettlInstReqRejCode );
    ( "58" , opt encode_string msg.f_SettlementInstructions_Text );
    ( "354" , opt encode_int msg.f_SettlementInstructions_EncodedTextLen );
    ( "355" , opt encode_string msg.f_SettlementInstructions_EncodedText );
    ( "11" , opt encode_string msg.f_SettlementInstructions_ClOrdID );
    ( "60" , req encode_UTCTimestamp msg.f_SettlementInstructions_TransactTime );
    ]
    @ repeat encode_SettlInstGrp "778" msg.f_SettlementInstructions_SettlInstGrp
;;

let encode_TradeCaptureReport msg =
    encode_Instrument msg.f_TradeCaptureReport_Instrument @
    encode_FinancingDetails msg.f_TradeCaptureReport_FinancingDetails @
    encode_OrderQtyData msg.f_TradeCaptureReport_OrderQtyData @
    encode_YieldData msg.f_TradeCaptureReport_YieldData @
    encode_SpreadOrBenchmarkCurveData msg.f_TradeCaptureReport_SpreadOrBenchmarkCurveData @
    [
    ( "571" , req encode_string msg.f_TradeCaptureReport_TradeReportID );
    ( "487" , opt encode_int msg.f_TradeCaptureReport_TradeReportTransType );
    ( "856" , opt encode_TradeReportType msg.f_TradeCaptureReport_TradeReportType );
    ( "568" , opt encode_string msg.f_TradeCaptureReport_TradeRequestID );
    ( "828" , opt encode_TrdType msg.f_TradeCaptureReport_TrdType );
    ( "829" , opt encode_int msg.f_TradeCaptureReport_TrdSubType );
    ( "855" , opt encode_int msg.f_TradeCaptureReport_SecondaryTrdType );
    ( "830" , opt encode_string msg.f_TradeCaptureReport_TransferReason );
    ( "150" , opt encode_ExecType msg.f_TradeCaptureReport_ExecType );
    ( "748" , opt encode_int msg.f_TradeCaptureReport_TotNumTradeReports );
    ( "912" , opt encode_bool msg.f_TradeCaptureReport_LastRptRequested );
    ( "325" , opt encode_UnsolicitedIndicator msg.f_TradeCaptureReport_UnsolicitedIndicator );
    ( "263" , opt encode_SubscriptionRequestType msg.f_TradeCaptureReport_SubscriptionRequestType );
    ( "572" , opt encode_string msg.f_TradeCaptureReport_TradeReportRefID );
    ( "881" , opt encode_string msg.f_TradeCaptureReport_SecondaryTradeReportRefID );
    ( "818" , opt encode_string msg.f_TradeCaptureReport_SecondaryTradeReportID );
    ( "820" , opt encode_string msg.f_TradeCaptureReport_TradeLinkID );
    ( "880" , opt encode_string msg.f_TradeCaptureReport_TrdMatchID );
    ( "17" , opt encode_string msg.f_TradeCaptureReport_ExecID );
    ( "39" , opt encode_OrdStatus msg.f_TradeCaptureReport_OrdStatus );
    ( "527" , opt encode_string msg.f_TradeCaptureReport_SecondaryExecID );
    ( "378" , opt encode_ExecRestatementReason msg.f_TradeCaptureReport_ExecRestatementReason );
    ( "570" , req encode_PreviouslyReported msg.f_TradeCaptureReport_PreviouslyReported );
    ( "423" , opt encode_PriceType msg.f_TradeCaptureReport_PriceType );
    ( "854" , opt encode_QtyType msg.f_TradeCaptureReport_QtyType );
    ( "822" , opt encode_string msg.f_TradeCaptureReport_UnderlyingTradingSessionID );
    ( "823" , opt encode_string msg.f_TradeCaptureReport_UnderlyingTradingSessionSubID );
    ( "32" , req encode_float_4 msg.f_TradeCaptureReport_LastQty );
    ( "31" , req encode_float_4 msg.f_TradeCaptureReport_LastPx );
    ( "669" , opt encode_float_4 msg.f_TradeCaptureReport_LastParPx );
    ( "194" , opt encode_float_4 msg.f_TradeCaptureReport_LastSpotRate );
    ( "195" , opt encode_float_4 msg.f_TradeCaptureReport_LastForwardPoints );
    ( "30" , opt encode_Exchange msg.f_TradeCaptureReport_LastMkt );
    ( "75" , req encode_LocalMktDate msg.f_TradeCaptureReport_TradeDate );
    ( "715" , opt encode_LocalMktDate msg.f_TradeCaptureReport_ClearingBusinessDate );
    ( "6" , opt encode_float_4 msg.f_TradeCaptureReport_AvgPx );
    ( "819" , opt encode_AvgPxIndicator msg.f_TradeCaptureReport_AvgPxIndicator );
    ( "442" , opt encode_MultiLegReportingType msg.f_TradeCaptureReport_MultiLegReportingType );
    ( "824" , opt encode_string msg.f_TradeCaptureReport_TradeLegRefID );
    ( "60" , req encode_UTCTimestamp msg.f_TradeCaptureReport_TransactTime );
    ( "63" , opt encode_SettlType msg.f_TradeCaptureReport_SettlType );
    ( "64" , opt encode_LocalMktDate msg.f_TradeCaptureReport_SettlDate );
    ( "573" , opt encode_MatchStatus msg.f_TradeCaptureReport_MatchStatus );
    ( "574" , opt encode_MatchType msg.f_TradeCaptureReport_MatchType );
    ( "797" , opt encode_bool msg.f_TradeCaptureReport_CopyMsgIndicator );
    ( "852" , opt encode_PublishTrdIndicator msg.f_TradeCaptureReport_PublishTrdIndicator );
    ( "853" , opt encode_ShortSaleReason msg.f_TradeCaptureReport_ShortSaleReason );
    ]
    @ repeat encode_UndInstrmtGrp "711" msg.f_TradeCaptureReport_UndInstrmtGrp
    @ repeat encode_PositionAmountData "753" msg.f_TradeCaptureReport_PositionAmountData
    @ repeat encode_TrdInstrmtLegGrp "555" msg.f_TradeCaptureReport_TrdInstrmtLegGrp
    @ repeat encode_TrdRegTimestamps "768" msg.f_TradeCaptureReport_TrdRegTimestamps
    @ repeat encode_TrdCapRptSideGrp "552" msg.f_TradeCaptureReport_TrdCapRptSideGrp
;;

let encode_TradeCaptureReportAck msg =
    encode_Instrument msg.f_TradeCaptureReportAck_Instrument @
    [
    ( "571" , req encode_string msg.f_TradeCaptureReportAck_TradeReportID );
    ( "487" , opt encode_int msg.f_TradeCaptureReportAck_TradeReportTransType );
    ( "856" , opt encode_TradeReportType msg.f_TradeCaptureReportAck_TradeReportType );
    ( "828" , opt encode_TrdType msg.f_TradeCaptureReportAck_TrdType );
    ( "829" , opt encode_int msg.f_TradeCaptureReportAck_TrdSubType );
    ( "855" , opt encode_int msg.f_TradeCaptureReportAck_SecondaryTrdType );
    ( "830" , opt encode_string msg.f_TradeCaptureReportAck_TransferReason );
    ( "150" , req encode_ExecType msg.f_TradeCaptureReportAck_ExecType );
    ( "572" , opt encode_string msg.f_TradeCaptureReportAck_TradeReportRefID );
    ( "881" , opt encode_string msg.f_TradeCaptureReportAck_SecondaryTradeReportRefID );
    ( "939" , opt encode_TrdRptStatus msg.f_TradeCaptureReportAck_TrdRptStatus );
    ( "751" , opt encode_TradeReportRejectReason msg.f_TradeCaptureReportAck_TradeReportRejectReason );
    ( "818" , opt encode_string msg.f_TradeCaptureReportAck_SecondaryTradeReportID );
    ( "263" , opt encode_SubscriptionRequestType msg.f_TradeCaptureReportAck_SubscriptionRequestType );
    ( "820" , opt encode_string msg.f_TradeCaptureReportAck_TradeLinkID );
    ( "880" , opt encode_string msg.f_TradeCaptureReportAck_TrdMatchID );
    ( "17" , opt encode_string msg.f_TradeCaptureReportAck_ExecID );
    ( "527" , opt encode_string msg.f_TradeCaptureReportAck_SecondaryExecID );
    ( "60" , opt encode_UTCTimestamp msg.f_TradeCaptureReportAck_TransactTime );
    ( "725" , opt encode_ResponseTransportType msg.f_TradeCaptureReportAck_ResponseTransportType );
    ( "726" , opt encode_string msg.f_TradeCaptureReportAck_ResponseDestination );
    ( "58" , opt encode_string msg.f_TradeCaptureReportAck_Text );
    ( "354" , opt encode_int msg.f_TradeCaptureReportAck_EncodedTextLen );
    ( "355" , opt encode_string msg.f_TradeCaptureReportAck_EncodedText );
    ( "635" , opt encode_ClearingFeeIndicator msg.f_TradeCaptureReportAck_ClearingFeeIndicator );
    ( "528" , opt encode_OrderCapacity msg.f_TradeCaptureReportAck_OrderCapacity );
    ( "529" , opt encode_OrderRestrictions msg.f_TradeCaptureReportAck_OrderRestrictions );
    ( "582" , opt encode_CustOrderCapacity msg.f_TradeCaptureReportAck_CustOrderCapacity );
    ( "1" , opt encode_string msg.f_TradeCaptureReportAck_Account );
    ( "660" , opt encode_AcctIDSource msg.f_TradeCaptureReportAck_AcctIDSource );
    ( "581" , opt encode_AccountType msg.f_TradeCaptureReportAck_AccountType );
    ( "77" , opt encode_PositionEffect msg.f_TradeCaptureReportAck_PositionEffect );
    ( "591" , opt encode_PreallocMethod msg.f_TradeCaptureReportAck_PreallocMethod );
    ]
    @ repeat encode_TrdRegTimestamps "768" msg.f_TradeCaptureReportAck_TrdRegTimestamps
    @ repeat encode_TrdInstrmtLegGrp "555" msg.f_TradeCaptureReportAck_TrdInstrmtLegGrp
    @ repeat encode_TrdAllocGrp "78" msg.f_TradeCaptureReportAck_TrdAllocGrp
;;

let encode_TradeCaptureReportRequest msg =
    encode_Instrument msg.f_TradeCaptureReportRequest_Instrument @
    encode_InstrumentExtension msg.f_TradeCaptureReportRequest_InstrumentExtension @
    encode_FinancingDetails msg.f_TradeCaptureReportRequest_FinancingDetails @
    [
    ( "568" , req encode_string msg.f_TradeCaptureReportRequest_TradeRequestID );
    ( "569" , req encode_TradeRequestType msg.f_TradeCaptureReportRequest_TradeRequestType );
    ( "263" , opt encode_SubscriptionRequestType msg.f_TradeCaptureReportRequest_SubscriptionRequestType );
    ( "571" , opt encode_string msg.f_TradeCaptureReportRequest_TradeReportID );
    ( "818" , opt encode_string msg.f_TradeCaptureReportRequest_SecondaryTradeReportID );
    ( "17" , opt encode_string msg.f_TradeCaptureReportRequest_ExecID );
    ( "150" , opt encode_ExecType msg.f_TradeCaptureReportRequest_ExecType );
    ( "37" , opt encode_string msg.f_TradeCaptureReportRequest_OrderID );
    ( "11" , opt encode_string msg.f_TradeCaptureReportRequest_ClOrdID );
    ( "573" , opt encode_MatchStatus msg.f_TradeCaptureReportRequest_MatchStatus );
    ( "828" , opt encode_TrdType msg.f_TradeCaptureReportRequest_TrdType );
    ( "829" , opt encode_int msg.f_TradeCaptureReportRequest_TrdSubType );
    ( "830" , opt encode_string msg.f_TradeCaptureReportRequest_TransferReason );
    ( "855" , opt encode_int msg.f_TradeCaptureReportRequest_SecondaryTrdType );
    ( "820" , opt encode_string msg.f_TradeCaptureReportRequest_TradeLinkID );
    ( "880" , opt encode_string msg.f_TradeCaptureReportRequest_TrdMatchID );
    ( "715" , opt encode_LocalMktDate msg.f_TradeCaptureReportRequest_ClearingBusinessDate );
    ( "336" , opt encode_string msg.f_TradeCaptureReportRequest_TradingSessionID );
    ( "625" , opt encode_string msg.f_TradeCaptureReportRequest_TradingSessionSubID );
    ( "943" , opt encode_string msg.f_TradeCaptureReportRequest_TimeBracket );
    ( "54" , opt encode_Side msg.f_TradeCaptureReportRequest_Side );
    ( "442" , opt encode_MultiLegReportingType msg.f_TradeCaptureReportRequest_MultiLegReportingType );
    ( "578" , opt encode_string msg.f_TradeCaptureReportRequest_TradeInputSource );
    ( "579" , opt encode_string msg.f_TradeCaptureReportRequest_TradeInputDevice );
    ( "725" , opt encode_ResponseTransportType msg.f_TradeCaptureReportRequest_ResponseTransportType );
    ( "726" , opt encode_string msg.f_TradeCaptureReportRequest_ResponseDestination );
    ( "58" , opt encode_string msg.f_TradeCaptureReportRequest_Text );
    ( "354" , opt encode_int msg.f_TradeCaptureReportRequest_EncodedTextLen );
    ( "355" , opt encode_string msg.f_TradeCaptureReportRequest_EncodedText );
    ]
    @ repeat encode_Parties "453" msg.f_TradeCaptureReportRequest_Parties
    @ repeat encode_UndInstrmtGrp "711" msg.f_TradeCaptureReportRequest_UndInstrmtGrp
    @ repeat encode_InstrmtLegGrp "555" msg.f_TradeCaptureReportRequest_InstrmtLegGrp
    @ repeat encode_TrdCapDtGrp "580" msg.f_TradeCaptureReportRequest_TrdCapDtGrp
;;

let encode_TradeCaptureReportRequestAck msg =
    encode_Instrument msg.f_TradeCaptureReportRequestAck_Instrument @
    [
    ( "568" , req encode_string msg.f_TradeCaptureReportRequestAck_TradeRequestID );
    ( "569" , req encode_TradeRequestType msg.f_TradeCaptureReportRequestAck_TradeRequestType );
    ( "263" , opt encode_SubscriptionRequestType msg.f_TradeCaptureReportRequestAck_SubscriptionRequestType );
    ( "748" , opt encode_int msg.f_TradeCaptureReportRequestAck_TotNumTradeReports );
    ( "749" , req encode_TradeRequestResult msg.f_TradeCaptureReportRequestAck_TradeRequestResult );
    ( "750" , req encode_TradeRequestStatus msg.f_TradeCaptureReportRequestAck_TradeRequestStatus );
    ( "442" , opt encode_MultiLegReportingType msg.f_TradeCaptureReportRequestAck_MultiLegReportingType );
    ( "725" , opt encode_ResponseTransportType msg.f_TradeCaptureReportRequestAck_ResponseTransportType );
    ( "726" , opt encode_string msg.f_TradeCaptureReportRequestAck_ResponseDestination );
    ( "58" , opt encode_string msg.f_TradeCaptureReportRequestAck_Text );
    ( "354" , opt encode_int msg.f_TradeCaptureReportRequestAck_EncodedTextLen );
    ( "355" , opt encode_string msg.f_TradeCaptureReportRequestAck_EncodedText );
    ]
    @ repeat encode_UndInstrmtGrp "711" msg.f_TradeCaptureReportRequestAck_UndInstrmtGrp
    @ repeat encode_InstrmtLegGrp "555" msg.f_TradeCaptureReportRequestAck_InstrmtLegGrp
;;

let encode_TradingSessionStatus msg =
    [
    ( "335" , opt encode_string msg.f_TradingSessionStatus_TradSesReqID );
    ( "336" , req encode_string msg.f_TradingSessionStatus_TradingSessionID );
    ( "625" , opt encode_string msg.f_TradingSessionStatus_TradingSessionSubID );
    ( "338" , opt encode_TradSesMethod msg.f_TradingSessionStatus_TradSesMethod );
    ( "339" , opt encode_TradSesMode msg.f_TradingSessionStatus_TradSesMode );
    ( "325" , opt encode_UnsolicitedIndicator msg.f_TradingSessionStatus_UnsolicitedIndicator );
    ( "340" , req encode_TradSesStatus msg.f_TradingSessionStatus_TradSesStatus );
    ( "567" , opt encode_TradSesStatusRejReason msg.f_TradingSessionStatus_TradSesStatusRejReason );
    ( "341" , opt encode_UTCTimestamp msg.f_TradingSessionStatus_TradSesStartTime );
    ( "342" , opt encode_UTCTimestamp msg.f_TradingSessionStatus_TradSesOpenTime );
    ( "343" , opt encode_UTCTimestamp msg.f_TradingSessionStatus_TradSesPreCloseTime );
    ( "344" , opt encode_UTCTimestamp msg.f_TradingSessionStatus_TradSesCloseTime );
    ( "345" , opt encode_UTCTimestamp msg.f_TradingSessionStatus_TradSesEndTime );
    ( "387" , opt encode_float_4 msg.f_TradingSessionStatus_TotalVolumeTraded );
    ( "58" , opt encode_string msg.f_TradingSessionStatus_Text );
    ( "354" , opt encode_int msg.f_TradingSessionStatus_EncodedTextLen );
    ( "355" , opt encode_string msg.f_TradingSessionStatus_EncodedText );
    ]
;;

let encode_TradingSessionStatusRequest msg =
    [
    ( "335" , req encode_string msg.f_TradingSessionStatusRequest_TradSesReqID );
    ( "336" , opt encode_string msg.f_TradingSessionStatusRequest_TradingSessionID );
    ( "625" , opt encode_string msg.f_TradingSessionStatusRequest_TradingSessionSubID );
    ( "338" , opt encode_TradSesMethod msg.f_TradingSessionStatusRequest_TradSesMethod );
    ( "339" , opt encode_TradSesMode msg.f_TradingSessionStatusRequest_TradSesMode );
    ( "263" , req encode_SubscriptionRequestType msg.f_TradingSessionStatusRequest_SubscriptionRequestType );
    ]
;;

let encode_UserRequest msg =
    [
    ( "923" , req encode_string msg.f_UserRequest_UserRequestID );
    ( "924" , req encode_UserRequestType msg.f_UserRequest_UserRequestType );
    ( "553" , req encode_string msg.f_UserRequest_Username );
    ( "554" , opt encode_string msg.f_UserRequest_Password );
    ( "925" , opt encode_string msg.f_UserRequest_NewPassword );
    ( "95" , opt encode_int msg.f_UserRequest_RawDataLength );
    ( "96" , opt encode_string msg.f_UserRequest_RawData );
    ]
;;

let encode_UserResponse msg =
    [
    ( "923" , req encode_string msg.f_UserResponse_UserRequestID );
    ( "553" , req encode_string msg.f_UserResponse_Username );
    ( "926" , opt encode_UserStatus msg.f_UserResponse_UserStatus );
    ( "927" , opt encode_string msg.f_UserResponse_UserStatusText );
    ]
;;

let encode_app_msg_data msg =
    (match msg with
        | FIX_Full_Msg_Advertisement msg -> (encode_Advertisement msg)
        | FIX_Full_Msg_AllocationInstruction msg -> (encode_AllocationInstruction msg)
        | FIX_Full_Msg_AllocationInstructionAck msg -> (encode_AllocationInstructionAck msg)
        | FIX_Full_Msg_AllocationReport msg -> (encode_AllocationReport msg)
        | FIX_Full_Msg_AllocationReportAck msg -> (encode_AllocationReportAck msg)
        | FIX_Full_Msg_AssignmentReport msg -> (encode_AssignmentReport msg)
        | FIX_Full_Msg_BidRequest msg -> (encode_BidRequest msg)
        | FIX_Full_Msg_BidResponse msg -> (encode_BidResponse msg)
        | FIX_Full_Msg_CollateralAssignment msg -> (encode_CollateralAssignment msg)
        | FIX_Full_Msg_CollateralInquiry msg -> (encode_CollateralInquiry msg)
        | FIX_Full_Msg_CollateralInquiryAck msg -> (encode_CollateralInquiryAck msg)
        | FIX_Full_Msg_CollateralReport msg -> (encode_CollateralReport msg)
        | FIX_Full_Msg_CollateralRequest msg -> (encode_CollateralRequest msg)
        | FIX_Full_Msg_CollateralResponse msg -> (encode_CollateralResponse msg)
        | FIX_Full_Msg_Confirmation msg -> (encode_Confirmation msg)
        | FIX_Full_Msg_ConfirmationAck msg -> (encode_ConfirmationAck msg)
        | FIX_Full_Msg_ConfirmationRequest msg -> (encode_ConfirmationRequest msg)
        | FIX_Full_Msg_CrossOrderCancelReplaceRequest msg -> (encode_CrossOrderCancelReplaceRequest msg)
        | FIX_Full_Msg_CrossOrderCancelRequest msg -> (encode_CrossOrderCancelRequest msg)
        | FIX_Full_Msg_DerivativeSecurityList msg -> (encode_DerivativeSecurityList msg)
        | FIX_Full_Msg_DerivativeSecurityListRequest msg -> (encode_DerivativeSecurityListRequest msg)
        | FIX_Full_Msg_DontKnowTrade msg -> (encode_DontKnowTrade msg)
        | FIX_Full_Msg_Email msg -> (encode_Email msg)
        | FIX_Full_Msg_ExecutionReport msg -> (encode_ExecutionReport msg)
        | FIX_Full_Msg_IOI msg -> (encode_IOI msg)
        | FIX_Full_Msg_ListCancelRequest msg -> (encode_ListCancelRequest msg)
        | FIX_Full_Msg_ListExecute msg -> (encode_ListExecute msg)
        | FIX_Full_Msg_ListStatus msg -> (encode_ListStatus msg)
        | FIX_Full_Msg_ListStatusRequest msg -> (encode_ListStatusRequest msg)
        | FIX_Full_Msg_ListStrikePrice msg -> (encode_ListStrikePrice msg)
        | FIX_Full_Msg_MarketDataIncrementalRefresh msg -> (encode_MarketDataIncrementalRefresh msg)
        | FIX_Full_Msg_MarketDataRequest msg -> (encode_MarketDataRequest msg)
        | FIX_Full_Msg_MarketDataRequestReject msg -> (encode_MarketDataRequestReject msg)
        | FIX_Full_Msg_MarketDataSnapshotFullRefresh msg -> (encode_MarketDataSnapshotFullRefresh msg)
        | FIX_Full_Msg_MassQuote msg -> (encode_MassQuote msg)
        | FIX_Full_Msg_MassQuoteAcknowledgement msg -> (encode_MassQuoteAcknowledgement msg)
        | FIX_Full_Msg_MultilegOrderCancelReplace msg -> (encode_MultilegOrderCancelReplace msg)
        | FIX_Full_Msg_NetworkCounterpartySystemStatusRequest msg -> (encode_NetworkCounterpartySystemStatusRequest msg)
        | FIX_Full_Msg_NetworkCounterpartySystemStatusResponse msg -> (encode_NetworkCounterpartySystemStatusResponse msg)
        | FIX_Full_Msg_NewOrderCross msg -> (encode_NewOrderCross msg)
        | FIX_Full_Msg_NewOrderList msg -> (encode_NewOrderList msg)
        | FIX_Full_Msg_NewOrderMultileg msg -> (encode_NewOrderMultileg msg)
        | FIX_Full_Msg_NewOrderSingle msg -> (encode_NewOrderSingle msg)
        | FIX_Full_Msg_News msg -> (encode_News msg)
        | FIX_Full_Msg_OrderCancelReject msg -> (encode_OrderCancelReject msg)
        | FIX_Full_Msg_OrderCancelReplaceRequest msg -> (encode_OrderCancelReplaceRequest msg)
        | FIX_Full_Msg_OrderCancelRequest msg -> (encode_OrderCancelRequest msg)
        | FIX_Full_Msg_OrderMassCancelReport msg -> (encode_OrderMassCancelReport msg)
        | FIX_Full_Msg_OrderMassCancelRequest msg -> (encode_OrderMassCancelRequest msg)
        | FIX_Full_Msg_OrderMassStatusRequest msg -> (encode_OrderMassStatusRequest msg)
        | FIX_Full_Msg_OrderStatusRequest msg -> (encode_OrderStatusRequest msg)
        | FIX_Full_Msg_PositionMaintenanceReport msg -> (encode_PositionMaintenanceReport msg)
        | FIX_Full_Msg_PositionMaintenanceRequest msg -> (encode_PositionMaintenanceRequest msg)
        | FIX_Full_Msg_PositionReport msg -> (encode_PositionReport msg)
        | FIX_Full_Msg_Quote msg -> (encode_Quote msg)
        | FIX_Full_Msg_QuoteCancel msg -> (encode_QuoteCancel msg)
        | FIX_Full_Msg_QuoteRequest msg -> (encode_QuoteRequest msg)
        | FIX_Full_Msg_QuoteRequestReject msg -> (encode_QuoteRequestReject msg)
        | FIX_Full_Msg_QuoteResponse msg -> (encode_QuoteResponse msg)
        | FIX_Full_Msg_QuoteStatusReport msg -> (encode_QuoteStatusReport msg)
        | FIX_Full_Msg_QuoteStatusRequest msg -> (encode_QuoteStatusRequest msg)
        | FIX_Full_Msg_RFQRequest msg -> (encode_RFQRequest msg)
        | FIX_Full_Msg_RegistrationInstructions msg -> (encode_RegistrationInstructions msg)
        | FIX_Full_Msg_RegistrationInstructionsResponse msg -> (encode_RegistrationInstructionsResponse msg)
        | FIX_Full_Msg_RequestForPositions msg -> (encode_RequestForPositions msg)
        | FIX_Full_Msg_RequestForPositionsAck msg -> (encode_RequestForPositionsAck msg)
        | FIX_Full_Msg_SecurityDefinition msg -> (encode_SecurityDefinition msg)
        | FIX_Full_Msg_SecurityDefinitionRequest msg -> (encode_SecurityDefinitionRequest msg)
        | FIX_Full_Msg_SecurityList msg -> (encode_SecurityList msg)
        | FIX_Full_Msg_SecurityListRequest msg -> (encode_SecurityListRequest msg)
        | FIX_Full_Msg_SecurityStatus msg -> (encode_SecurityStatus msg)
        | FIX_Full_Msg_SecurityStatusRequest msg -> (encode_SecurityStatusRequest msg)
        | FIX_Full_Msg_SecurityTypeRequest msg -> (encode_SecurityTypeRequest msg)
        | FIX_Full_Msg_SecurityTypes msg -> (encode_SecurityTypes msg)
        | FIX_Full_Msg_SettlementInstructionRequest msg -> (encode_SettlementInstructionRequest msg)
        | FIX_Full_Msg_SettlementInstructions msg -> (encode_SettlementInstructions msg)
        | FIX_Full_Msg_TradeCaptureReport msg -> (encode_TradeCaptureReport msg)
        | FIX_Full_Msg_TradeCaptureReportAck msg -> (encode_TradeCaptureReportAck msg)
        | FIX_Full_Msg_TradeCaptureReportRequest msg -> (encode_TradeCaptureReportRequest msg)
        | FIX_Full_Msg_TradeCaptureReportRequestAck msg -> (encode_TradeCaptureReportRequestAck msg)
        | FIX_Full_Msg_TradingSessionStatus msg -> (encode_TradingSessionStatus msg)
        | FIX_Full_Msg_TradingSessionStatusRequest msg -> (encode_TradingSessionStatusRequest msg)
        | FIX_Full_Msg_UserRequest msg -> (encode_UserRequest msg)
        | FIX_Full_Msg_UserResponse msg -> (encode_UserResponse msg)
    )
;;
