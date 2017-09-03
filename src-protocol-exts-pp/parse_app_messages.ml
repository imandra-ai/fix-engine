(* Aesthetic Integration copyright 2017 *)
(* @meta[imandra_ignore] on @end *)
open Parser_utils.Parser;;
open Parse_datetime;;
open Parse_app_records;;
open Parse_base_types;;
open Full_app_messages;;
open Parse_app_enums;;
open Full_app_tags;;
(* @meta[imandra_ignore] off @end *)

let parse_Advertisement msg = (
    repeating msg "555" parse_InstrmtLegGrp @@ fun msg f_Advertisement_InstrmtLegGrp ->
    repeating msg "711" parse_UndInstrmtGrp @@ fun msg f_Advertisement_UndInstrmtGrp ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_Advertisement_Instrument ->
    req msg "2" parse_string @@ fun msg f_Advertisement_AdvId ->
    req msg "5" parse_AdvTransType @@ fun msg f_Advertisement_AdvTransType ->
    opt msg "3" parse_string @@ fun msg f_Advertisement_AdvRefID ->
    req msg "4" parse_AdvSide @@ fun msg f_Advertisement_AdvSide ->
    req msg "53" parse_float @@ fun msg f_Advertisement_Quantity ->
    opt msg "854" parse_QtyType @@ fun msg f_Advertisement_QtyType ->
    opt msg "44" parse_float @@ fun msg f_Advertisement_Price ->
    opt msg "15" parse_Currency @@ fun msg f_Advertisement_Currency ->
    opt msg "75" parse_LocalMktDate @@ fun msg f_Advertisement_TradeDate ->
    opt msg "60" parse_UTCTimestamp @@ fun msg f_Advertisement_TransactTime ->
    opt msg "58" parse_string @@ fun msg f_Advertisement_Text ->
    opt msg "354" parse_int @@ fun msg f_Advertisement_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_Advertisement_EncodedText ->
    opt msg "149" parse_string @@ fun msg f_Advertisement_URLLink ->
    opt msg "30" parse_Exchange @@ fun msg f_Advertisement_LastMkt ->
    opt msg "336" parse_string @@ fun msg f_Advertisement_TradingSessionID ->
    opt msg "625" parse_string @@ fun msg f_Advertisement_TradingSessionSubID ->
    ParseSuccess {
    f_Advertisement_InstrmtLegGrp;
    f_Advertisement_UndInstrmtGrp;
    f_Advertisement_Instrument;
    f_Advertisement_AdvId;
    f_Advertisement_AdvTransType;
    f_Advertisement_AdvRefID;
    f_Advertisement_AdvSide;
    f_Advertisement_Quantity;
    f_Advertisement_QtyType;
    f_Advertisement_Price;
    f_Advertisement_Currency;
    f_Advertisement_TradeDate;
    f_Advertisement_TransactTime;
    f_Advertisement_Text;
    f_Advertisement_EncodedTextLen;
    f_Advertisement_EncodedText;
    f_Advertisement_URLLink;
    f_Advertisement_LastMkt;
    f_Advertisement_TradingSessionID;
    f_Advertisement_TradingSessionSubID;
    } , msg ) |> check_unknown_tags;;

let parse_AllocationInstruction msg = (
    repeating msg "73" parse_OrdAllocGrp @@ fun msg f_AllocationInstruction_OrdAllocGrp ->
    repeating msg "124" parse_ExecAllocGrp @@ fun msg f_AllocationInstruction_ExecAllocGrp ->
    repeating msg "711" parse_UndInstrmtGrp @@ fun msg f_AllocationInstruction_UndInstrmtGrp ->
    repeating msg "555" parse_InstrmtLegGrp @@ fun msg f_AllocationInstruction_InstrmtLegGrp ->
    repeating msg "453" parse_Parties @@ fun msg f_AllocationInstruction_Parties ->
    repeating msg "232" parse_Stipulations @@ fun msg f_AllocationInstruction_Stipulations ->
    repeating msg "78" parse_AllocGrp @@ fun msg f_AllocationInstruction_AllocGrp ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_AllocationInstruction_Instrument ->
    block msg  parse_InstrumentExtension @@ fun msg f_AllocationInstruction_InstrumentExtension ->
    block msg  parse_FinancingDetails @@ fun msg f_AllocationInstruction_FinancingDetails ->
    block msg  parse_SpreadOrBenchmarkCurveData @@ fun msg f_AllocationInstruction_SpreadOrBenchmarkCurveData ->
    block msg  parse_YieldData @@ fun msg f_AllocationInstruction_YieldData ->
    req msg "70" parse_string @@ fun msg f_AllocationInstruction_AllocID ->
    req msg "71" parse_AllocTransType @@ fun msg f_AllocationInstruction_AllocTransType ->
    req msg "626" parse_AllocType @@ fun msg f_AllocationInstruction_AllocType ->
    opt msg "793" parse_string @@ fun msg f_AllocationInstruction_SecondaryAllocID ->
    opt msg "72" parse_string @@ fun msg f_AllocationInstruction_RefAllocID ->
    opt msg "796" parse_AllocCancReplaceReason @@ fun msg f_AllocationInstruction_AllocCancReplaceReason ->
    opt msg "808" parse_AllocIntermedReqType @@ fun msg f_AllocationInstruction_AllocIntermedReqType ->
    opt msg "196" parse_string @@ fun msg f_AllocationInstruction_AllocLinkID ->
    opt msg "197" parse_AllocLinkType @@ fun msg f_AllocationInstruction_AllocLinkType ->
    opt msg "466" parse_string @@ fun msg f_AllocationInstruction_BookingRefID ->
    req msg "857" parse_AllocNoOrdersType @@ fun msg f_AllocationInstruction_AllocNoOrdersType ->
    opt msg "570" parse_PreviouslyReported @@ fun msg f_AllocationInstruction_PreviouslyReported ->
    opt msg "700" parse_bool @@ fun msg f_AllocationInstruction_ReversalIndicator ->
    opt msg "574" parse_MatchType @@ fun msg f_AllocationInstruction_MatchType ->
    req msg "54" parse_Side @@ fun msg f_AllocationInstruction_Side ->
    req msg "53" parse_float @@ fun msg f_AllocationInstruction_Quantity ->
    opt msg "854" parse_QtyType @@ fun msg f_AllocationInstruction_QtyType ->
    opt msg "30" parse_Exchange @@ fun msg f_AllocationInstruction_LastMkt ->
    opt msg "229" parse_LocalMktDate @@ fun msg f_AllocationInstruction_TradeOriginationDate ->
    opt msg "336" parse_string @@ fun msg f_AllocationInstruction_TradingSessionID ->
    opt msg "625" parse_string @@ fun msg f_AllocationInstruction_TradingSessionSubID ->
    opt msg "423" parse_PriceType @@ fun msg f_AllocationInstruction_PriceType ->
    req msg "6" parse_float @@ fun msg f_AllocationInstruction_AvgPx ->
    opt msg "860" parse_float @@ fun msg f_AllocationInstruction_AvgParPx ->
    opt msg "15" parse_Currency @@ fun msg f_AllocationInstruction_Currency ->
    opt msg "74" parse_int @@ fun msg f_AllocationInstruction_AvgPxPrecision ->
    req msg "75" parse_LocalMktDate @@ fun msg f_AllocationInstruction_TradeDate ->
    opt msg "60" parse_UTCTimestamp @@ fun msg f_AllocationInstruction_TransactTime ->
    opt msg "63" parse_SettlType @@ fun msg f_AllocationInstruction_SettlType ->
    opt msg "64" parse_LocalMktDate @@ fun msg f_AllocationInstruction_SettlDate ->
    opt msg "775" parse_BookingType @@ fun msg f_AllocationInstruction_BookingType ->
    opt msg "381" parse_float @@ fun msg f_AllocationInstruction_GrossTradeAmt ->
    opt msg "238" parse_float @@ fun msg f_AllocationInstruction_Concession ->
    opt msg "237" parse_float @@ fun msg f_AllocationInstruction_TotalTakedown ->
    opt msg "118" parse_float @@ fun msg f_AllocationInstruction_NetMoney ->
    opt msg "77" parse_PositionEffect @@ fun msg f_AllocationInstruction_PositionEffect ->
    opt msg "754" parse_bool @@ fun msg f_AllocationInstruction_AutoAcceptIndicator ->
    opt msg "58" parse_string @@ fun msg f_AllocationInstruction_Text ->
    opt msg "354" parse_int @@ fun msg f_AllocationInstruction_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_AllocationInstruction_EncodedText ->
    opt msg "157" parse_int @@ fun msg f_AllocationInstruction_NumDaysInterest ->
    opt msg "158" parse_float @@ fun msg f_AllocationInstruction_AccruedInterestRate ->
    opt msg "159" parse_float @@ fun msg f_AllocationInstruction_AccruedInterestAmt ->
    opt msg "540" parse_float @@ fun msg f_AllocationInstruction_TotalAccruedInterestAmt ->
    opt msg "738" parse_float @@ fun msg f_AllocationInstruction_InterestAtMaturity ->
    opt msg "920" parse_float @@ fun msg f_AllocationInstruction_EndAccruedInterestAmt ->
    opt msg "921" parse_float @@ fun msg f_AllocationInstruction_StartCash ->
    opt msg "922" parse_float @@ fun msg f_AllocationInstruction_EndCash ->
    opt msg "650" parse_LegalConfirm @@ fun msg f_AllocationInstruction_LegalConfirm ->
    opt msg "892" parse_int @@ fun msg f_AllocationInstruction_TotNoAllocs ->
    opt msg "893" parse_LastFragment @@ fun msg f_AllocationInstruction_LastFragment ->
    ParseSuccess {
    f_AllocationInstruction_OrdAllocGrp;
    f_AllocationInstruction_ExecAllocGrp;
    f_AllocationInstruction_UndInstrmtGrp;
    f_AllocationInstruction_InstrmtLegGrp;
    f_AllocationInstruction_Parties;
    f_AllocationInstruction_Stipulations;
    f_AllocationInstruction_AllocGrp;
    f_AllocationInstruction_Instrument;
    f_AllocationInstruction_InstrumentExtension;
    f_AllocationInstruction_FinancingDetails;
    f_AllocationInstruction_SpreadOrBenchmarkCurveData;
    f_AllocationInstruction_YieldData;
    f_AllocationInstruction_AllocID;
    f_AllocationInstruction_AllocTransType;
    f_AllocationInstruction_AllocType;
    f_AllocationInstruction_SecondaryAllocID;
    f_AllocationInstruction_RefAllocID;
    f_AllocationInstruction_AllocCancReplaceReason;
    f_AllocationInstruction_AllocIntermedReqType;
    f_AllocationInstruction_AllocLinkID;
    f_AllocationInstruction_AllocLinkType;
    f_AllocationInstruction_BookingRefID;
    f_AllocationInstruction_AllocNoOrdersType;
    f_AllocationInstruction_PreviouslyReported;
    f_AllocationInstruction_ReversalIndicator;
    f_AllocationInstruction_MatchType;
    f_AllocationInstruction_Side;
    f_AllocationInstruction_Quantity;
    f_AllocationInstruction_QtyType;
    f_AllocationInstruction_LastMkt;
    f_AllocationInstruction_TradeOriginationDate;
    f_AllocationInstruction_TradingSessionID;
    f_AllocationInstruction_TradingSessionSubID;
    f_AllocationInstruction_PriceType;
    f_AllocationInstruction_AvgPx;
    f_AllocationInstruction_AvgParPx;
    f_AllocationInstruction_Currency;
    f_AllocationInstruction_AvgPxPrecision;
    f_AllocationInstruction_TradeDate;
    f_AllocationInstruction_TransactTime;
    f_AllocationInstruction_SettlType;
    f_AllocationInstruction_SettlDate;
    f_AllocationInstruction_BookingType;
    f_AllocationInstruction_GrossTradeAmt;
    f_AllocationInstruction_Concession;
    f_AllocationInstruction_TotalTakedown;
    f_AllocationInstruction_NetMoney;
    f_AllocationInstruction_PositionEffect;
    f_AllocationInstruction_AutoAcceptIndicator;
    f_AllocationInstruction_Text;
    f_AllocationInstruction_EncodedTextLen;
    f_AllocationInstruction_EncodedText;
    f_AllocationInstruction_NumDaysInterest;
    f_AllocationInstruction_AccruedInterestRate;
    f_AllocationInstruction_AccruedInterestAmt;
    f_AllocationInstruction_TotalAccruedInterestAmt;
    f_AllocationInstruction_InterestAtMaturity;
    f_AllocationInstruction_EndAccruedInterestAmt;
    f_AllocationInstruction_StartCash;
    f_AllocationInstruction_EndCash;
    f_AllocationInstruction_LegalConfirm;
    f_AllocationInstruction_TotNoAllocs;
    f_AllocationInstruction_LastFragment;
    } , msg ) |> check_unknown_tags;;

let parse_AllocationInstructionAck msg = (
    repeating msg "453" parse_Parties @@ fun msg f_AllocationInstructionAck_Parties ->
    repeating msg "78" parse_AllocAckGrp @@ fun msg f_AllocationInstructionAck_AllocAckGrp ->
    check_duplicate_tags msg @@ fun () ->
    req msg "70" parse_string @@ fun msg f_AllocationInstructionAck_AllocID ->
    opt msg "793" parse_string @@ fun msg f_AllocationInstructionAck_SecondaryAllocID ->
    opt msg "75" parse_LocalMktDate @@ fun msg f_AllocationInstructionAck_TradeDate ->
    req msg "60" parse_UTCTimestamp @@ fun msg f_AllocationInstructionAck_TransactTime ->
    req msg "87" parse_AllocStatus @@ fun msg f_AllocationInstructionAck_AllocStatus ->
    opt msg "88" parse_AllocRejCode @@ fun msg f_AllocationInstructionAck_AllocRejCode ->
    opt msg "626" parse_AllocType @@ fun msg f_AllocationInstructionAck_AllocType ->
    opt msg "808" parse_AllocIntermedReqType @@ fun msg f_AllocationInstructionAck_AllocIntermedReqType ->
    opt msg "573" parse_MatchStatus @@ fun msg f_AllocationInstructionAck_MatchStatus ->
    opt msg "460" parse_Product @@ fun msg f_AllocationInstructionAck_Product ->
    opt msg "167" parse_SecurityType @@ fun msg f_AllocationInstructionAck_SecurityType ->
    opt msg "58" parse_string @@ fun msg f_AllocationInstructionAck_Text ->
    opt msg "354" parse_int @@ fun msg f_AllocationInstructionAck_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_AllocationInstructionAck_EncodedText ->
    ParseSuccess {
    f_AllocationInstructionAck_Parties;
    f_AllocationInstructionAck_AllocAckGrp;
    f_AllocationInstructionAck_AllocID;
    f_AllocationInstructionAck_SecondaryAllocID;
    f_AllocationInstructionAck_TradeDate;
    f_AllocationInstructionAck_TransactTime;
    f_AllocationInstructionAck_AllocStatus;
    f_AllocationInstructionAck_AllocRejCode;
    f_AllocationInstructionAck_AllocType;
    f_AllocationInstructionAck_AllocIntermedReqType;
    f_AllocationInstructionAck_MatchStatus;
    f_AllocationInstructionAck_Product;
    f_AllocationInstructionAck_SecurityType;
    f_AllocationInstructionAck_Text;
    f_AllocationInstructionAck_EncodedTextLen;
    f_AllocationInstructionAck_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_AllocationReport msg = (
    repeating msg "73" parse_OrdAllocGrp @@ fun msg f_AllocationReport_OrdAllocGrp ->
    repeating msg "124" parse_ExecAllocGrp @@ fun msg f_AllocationReport_ExecAllocGrp ->
    repeating msg "711" parse_UndInstrmtGrp @@ fun msg f_AllocationReport_UndInstrmtGrp ->
    repeating msg "555" parse_InstrmtLegGrp @@ fun msg f_AllocationReport_InstrmtLegGrp ->
    repeating msg "453" parse_Parties @@ fun msg f_AllocationReport_Parties ->
    repeating msg "232" parse_Stipulations @@ fun msg f_AllocationReport_Stipulations ->
    repeating msg "78" parse_AllocGrp @@ fun msg f_AllocationReport_AllocGrp ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_AllocationReport_Instrument ->
    block msg  parse_InstrumentExtension @@ fun msg f_AllocationReport_InstrumentExtension ->
    block msg  parse_FinancingDetails @@ fun msg f_AllocationReport_FinancingDetails ->
    block msg  parse_SpreadOrBenchmarkCurveData @@ fun msg f_AllocationReport_SpreadOrBenchmarkCurveData ->
    block msg  parse_YieldData @@ fun msg f_AllocationReport_YieldData ->
    req msg "755" parse_string @@ fun msg f_AllocationReport_AllocReportID ->
    opt msg "70" parse_string @@ fun msg f_AllocationReport_AllocID ->
    req msg "71" parse_AllocTransType @@ fun msg f_AllocationReport_AllocTransType ->
    opt msg "795" parse_string @@ fun msg f_AllocationReport_AllocReportRefID ->
    opt msg "796" parse_AllocCancReplaceReason @@ fun msg f_AllocationReport_AllocCancReplaceReason ->
    opt msg "793" parse_string @@ fun msg f_AllocationReport_SecondaryAllocID ->
    req msg "794" parse_AllocReportType @@ fun msg f_AllocationReport_AllocReportType ->
    req msg "87" parse_AllocStatus @@ fun msg f_AllocationReport_AllocStatus ->
    opt msg "88" parse_AllocRejCode @@ fun msg f_AllocationReport_AllocRejCode ->
    opt msg "72" parse_string @@ fun msg f_AllocationReport_RefAllocID ->
    opt msg "808" parse_AllocIntermedReqType @@ fun msg f_AllocationReport_AllocIntermedReqType ->
    opt msg "196" parse_string @@ fun msg f_AllocationReport_AllocLinkID ->
    opt msg "197" parse_AllocLinkType @@ fun msg f_AllocationReport_AllocLinkType ->
    opt msg "466" parse_string @@ fun msg f_AllocationReport_BookingRefID ->
    req msg "857" parse_AllocNoOrdersType @@ fun msg f_AllocationReport_AllocNoOrdersType ->
    opt msg "570" parse_PreviouslyReported @@ fun msg f_AllocationReport_PreviouslyReported ->
    opt msg "700" parse_bool @@ fun msg f_AllocationReport_ReversalIndicator ->
    opt msg "574" parse_MatchType @@ fun msg f_AllocationReport_MatchType ->
    req msg "54" parse_Side @@ fun msg f_AllocationReport_Side ->
    req msg "53" parse_float @@ fun msg f_AllocationReport_Quantity ->
    opt msg "854" parse_QtyType @@ fun msg f_AllocationReport_QtyType ->
    opt msg "30" parse_Exchange @@ fun msg f_AllocationReport_LastMkt ->
    opt msg "229" parse_LocalMktDate @@ fun msg f_AllocationReport_TradeOriginationDate ->
    opt msg "336" parse_string @@ fun msg f_AllocationReport_TradingSessionID ->
    opt msg "625" parse_string @@ fun msg f_AllocationReport_TradingSessionSubID ->
    opt msg "423" parse_PriceType @@ fun msg f_AllocationReport_PriceType ->
    req msg "6" parse_float @@ fun msg f_AllocationReport_AvgPx ->
    opt msg "860" parse_float @@ fun msg f_AllocationReport_AvgParPx ->
    opt msg "15" parse_Currency @@ fun msg f_AllocationReport_Currency ->
    opt msg "74" parse_int @@ fun msg f_AllocationReport_AvgPxPrecision ->
    req msg "75" parse_LocalMktDate @@ fun msg f_AllocationReport_TradeDate ->
    opt msg "60" parse_UTCTimestamp @@ fun msg f_AllocationReport_TransactTime ->
    opt msg "63" parse_SettlType @@ fun msg f_AllocationReport_SettlType ->
    opt msg "64" parse_LocalMktDate @@ fun msg f_AllocationReport_SettlDate ->
    opt msg "775" parse_BookingType @@ fun msg f_AllocationReport_BookingType ->
    opt msg "381" parse_float @@ fun msg f_AllocationReport_GrossTradeAmt ->
    opt msg "238" parse_float @@ fun msg f_AllocationReport_Concession ->
    opt msg "237" parse_float @@ fun msg f_AllocationReport_TotalTakedown ->
    opt msg "118" parse_float @@ fun msg f_AllocationReport_NetMoney ->
    opt msg "77" parse_PositionEffect @@ fun msg f_AllocationReport_PositionEffect ->
    opt msg "754" parse_bool @@ fun msg f_AllocationReport_AutoAcceptIndicator ->
    opt msg "58" parse_string @@ fun msg f_AllocationReport_Text ->
    opt msg "354" parse_int @@ fun msg f_AllocationReport_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_AllocationReport_EncodedText ->
    opt msg "157" parse_int @@ fun msg f_AllocationReport_NumDaysInterest ->
    opt msg "158" parse_float @@ fun msg f_AllocationReport_AccruedInterestRate ->
    opt msg "159" parse_float @@ fun msg f_AllocationReport_AccruedInterestAmt ->
    opt msg "540" parse_float @@ fun msg f_AllocationReport_TotalAccruedInterestAmt ->
    opt msg "738" parse_float @@ fun msg f_AllocationReport_InterestAtMaturity ->
    opt msg "920" parse_float @@ fun msg f_AllocationReport_EndAccruedInterestAmt ->
    opt msg "921" parse_float @@ fun msg f_AllocationReport_StartCash ->
    opt msg "922" parse_float @@ fun msg f_AllocationReport_EndCash ->
    opt msg "650" parse_LegalConfirm @@ fun msg f_AllocationReport_LegalConfirm ->
    opt msg "892" parse_int @@ fun msg f_AllocationReport_TotNoAllocs ->
    opt msg "893" parse_LastFragment @@ fun msg f_AllocationReport_LastFragment ->
    ParseSuccess {
    f_AllocationReport_OrdAllocGrp;
    f_AllocationReport_ExecAllocGrp;
    f_AllocationReport_UndInstrmtGrp;
    f_AllocationReport_InstrmtLegGrp;
    f_AllocationReport_Parties;
    f_AllocationReport_Stipulations;
    f_AllocationReport_AllocGrp;
    f_AllocationReport_Instrument;
    f_AllocationReport_InstrumentExtension;
    f_AllocationReport_FinancingDetails;
    f_AllocationReport_SpreadOrBenchmarkCurveData;
    f_AllocationReport_YieldData;
    f_AllocationReport_AllocReportID;
    f_AllocationReport_AllocID;
    f_AllocationReport_AllocTransType;
    f_AllocationReport_AllocReportRefID;
    f_AllocationReport_AllocCancReplaceReason;
    f_AllocationReport_SecondaryAllocID;
    f_AllocationReport_AllocReportType;
    f_AllocationReport_AllocStatus;
    f_AllocationReport_AllocRejCode;
    f_AllocationReport_RefAllocID;
    f_AllocationReport_AllocIntermedReqType;
    f_AllocationReport_AllocLinkID;
    f_AllocationReport_AllocLinkType;
    f_AllocationReport_BookingRefID;
    f_AllocationReport_AllocNoOrdersType;
    f_AllocationReport_PreviouslyReported;
    f_AllocationReport_ReversalIndicator;
    f_AllocationReport_MatchType;
    f_AllocationReport_Side;
    f_AllocationReport_Quantity;
    f_AllocationReport_QtyType;
    f_AllocationReport_LastMkt;
    f_AllocationReport_TradeOriginationDate;
    f_AllocationReport_TradingSessionID;
    f_AllocationReport_TradingSessionSubID;
    f_AllocationReport_PriceType;
    f_AllocationReport_AvgPx;
    f_AllocationReport_AvgParPx;
    f_AllocationReport_Currency;
    f_AllocationReport_AvgPxPrecision;
    f_AllocationReport_TradeDate;
    f_AllocationReport_TransactTime;
    f_AllocationReport_SettlType;
    f_AllocationReport_SettlDate;
    f_AllocationReport_BookingType;
    f_AllocationReport_GrossTradeAmt;
    f_AllocationReport_Concession;
    f_AllocationReport_TotalTakedown;
    f_AllocationReport_NetMoney;
    f_AllocationReport_PositionEffect;
    f_AllocationReport_AutoAcceptIndicator;
    f_AllocationReport_Text;
    f_AllocationReport_EncodedTextLen;
    f_AllocationReport_EncodedText;
    f_AllocationReport_NumDaysInterest;
    f_AllocationReport_AccruedInterestRate;
    f_AllocationReport_AccruedInterestAmt;
    f_AllocationReport_TotalAccruedInterestAmt;
    f_AllocationReport_InterestAtMaturity;
    f_AllocationReport_EndAccruedInterestAmt;
    f_AllocationReport_StartCash;
    f_AllocationReport_EndCash;
    f_AllocationReport_LegalConfirm;
    f_AllocationReport_TotNoAllocs;
    f_AllocationReport_LastFragment;
    } , msg ) |> check_unknown_tags;;

let parse_AllocationReportAck msg = (
    repeating msg "453" parse_Parties @@ fun msg f_AllocationReportAck_Parties ->
    repeating msg "78" parse_AllocAckGrp @@ fun msg f_AllocationReportAck_AllocAckGrp ->
    check_duplicate_tags msg @@ fun () ->
    req msg "755" parse_string @@ fun msg f_AllocationReportAck_AllocReportID ->
    req msg "70" parse_string @@ fun msg f_AllocationReportAck_AllocID ->
    opt msg "793" parse_string @@ fun msg f_AllocationReportAck_SecondaryAllocID ->
    opt msg "75" parse_LocalMktDate @@ fun msg f_AllocationReportAck_TradeDate ->
    req msg "60" parse_UTCTimestamp @@ fun msg f_AllocationReportAck_TransactTime ->
    req msg "87" parse_AllocStatus @@ fun msg f_AllocationReportAck_AllocStatus ->
    opt msg "88" parse_AllocRejCode @@ fun msg f_AllocationReportAck_AllocRejCode ->
    opt msg "794" parse_AllocReportType @@ fun msg f_AllocationReportAck_AllocReportType ->
    opt msg "808" parse_AllocIntermedReqType @@ fun msg f_AllocationReportAck_AllocIntermedReqType ->
    opt msg "573" parse_MatchStatus @@ fun msg f_AllocationReportAck_MatchStatus ->
    opt msg "460" parse_Product @@ fun msg f_AllocationReportAck_Product ->
    opt msg "167" parse_SecurityType @@ fun msg f_AllocationReportAck_SecurityType ->
    opt msg "58" parse_string @@ fun msg f_AllocationReportAck_Text ->
    opt msg "354" parse_int @@ fun msg f_AllocationReportAck_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_AllocationReportAck_EncodedText ->
    ParseSuccess {
    f_AllocationReportAck_Parties;
    f_AllocationReportAck_AllocAckGrp;
    f_AllocationReportAck_AllocReportID;
    f_AllocationReportAck_AllocID;
    f_AllocationReportAck_SecondaryAllocID;
    f_AllocationReportAck_TradeDate;
    f_AllocationReportAck_TransactTime;
    f_AllocationReportAck_AllocStatus;
    f_AllocationReportAck_AllocRejCode;
    f_AllocationReportAck_AllocReportType;
    f_AllocationReportAck_AllocIntermedReqType;
    f_AllocationReportAck_MatchStatus;
    f_AllocationReportAck_Product;
    f_AllocationReportAck_SecurityType;
    f_AllocationReportAck_Text;
    f_AllocationReportAck_EncodedTextLen;
    f_AllocationReportAck_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_AssignmentReport msg = (
    repeating msg "453" parse_Parties @@ fun msg f_AssignmentReport_Parties ->
    repeating msg "555" parse_InstrmtLegGrp @@ fun msg f_AssignmentReport_InstrmtLegGrp ->
    repeating msg "711" parse_UndInstrmtGrp @@ fun msg f_AssignmentReport_UndInstrmtGrp ->
    repeating msg "702" parse_PositionQty @@ fun msg f_AssignmentReport_PositionQty ->
    repeating msg "753" parse_PositionAmountData @@ fun msg f_AssignmentReport_PositionAmountData ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_AssignmentReport_Instrument ->
    req msg "833" parse_string @@ fun msg f_AssignmentReport_AsgnRptID ->
    opt msg "832" parse_int @@ fun msg f_AssignmentReport_TotNumAssignmentReports ->
    opt msg "912" parse_bool @@ fun msg f_AssignmentReport_LastRptRequested ->
    opt msg "1" parse_string @@ fun msg f_AssignmentReport_Account ->
    req msg "581" parse_AccountType @@ fun msg f_AssignmentReport_AccountType ->
    opt msg "15" parse_Currency @@ fun msg f_AssignmentReport_Currency ->
    opt msg "834" parse_float @@ fun msg f_AssignmentReport_ThresholdAmount ->
    req msg "730" parse_float @@ fun msg f_AssignmentReport_SettlPrice ->
    req msg "731" parse_SettlPriceType @@ fun msg f_AssignmentReport_SettlPriceType ->
    req msg "732" parse_float @@ fun msg f_AssignmentReport_UnderlyingSettlPrice ->
    opt msg "432" parse_LocalMktDate @@ fun msg f_AssignmentReport_ExpireDate ->
    req msg "744" parse_AssignmentMethod @@ fun msg f_AssignmentReport_AssignmentMethod ->
    opt msg "745" parse_float @@ fun msg f_AssignmentReport_AssignmentUnit ->
    req msg "746" parse_float @@ fun msg f_AssignmentReport_OpenInterest ->
    req msg "747" parse_ExerciseMethod @@ fun msg f_AssignmentReport_ExerciseMethod ->
    req msg "716" parse_SettlSessID @@ fun msg f_AssignmentReport_SettlSessID ->
    req msg "717" parse_string @@ fun msg f_AssignmentReport_SettlSessSubID ->
    req msg "715" parse_LocalMktDate @@ fun msg f_AssignmentReport_ClearingBusinessDate ->
    opt msg "58" parse_string @@ fun msg f_AssignmentReport_Text ->
    opt msg "354" parse_int @@ fun msg f_AssignmentReport_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_AssignmentReport_EncodedText ->
    ParseSuccess {
    f_AssignmentReport_Parties;
    f_AssignmentReport_InstrmtLegGrp;
    f_AssignmentReport_UndInstrmtGrp;
    f_AssignmentReport_PositionQty;
    f_AssignmentReport_PositionAmountData;
    f_AssignmentReport_Instrument;
    f_AssignmentReport_AsgnRptID;
    f_AssignmentReport_TotNumAssignmentReports;
    f_AssignmentReport_LastRptRequested;
    f_AssignmentReport_Account;
    f_AssignmentReport_AccountType;
    f_AssignmentReport_Currency;
    f_AssignmentReport_ThresholdAmount;
    f_AssignmentReport_SettlPrice;
    f_AssignmentReport_SettlPriceType;
    f_AssignmentReport_UnderlyingSettlPrice;
    f_AssignmentReport_ExpireDate;
    f_AssignmentReport_AssignmentMethod;
    f_AssignmentReport_AssignmentUnit;
    f_AssignmentReport_OpenInterest;
    f_AssignmentReport_ExerciseMethod;
    f_AssignmentReport_SettlSessID;
    f_AssignmentReport_SettlSessSubID;
    f_AssignmentReport_ClearingBusinessDate;
    f_AssignmentReport_Text;
    f_AssignmentReport_EncodedTextLen;
    f_AssignmentReport_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_BidRequest msg = (
    repeating msg "398" parse_BidDescReqGrp @@ fun msg f_BidRequest_BidDescReqGrp ->
    repeating msg "420" parse_BidCompReqGrp @@ fun msg f_BidRequest_BidCompReqGrp ->
    check_duplicate_tags msg @@ fun () ->
    opt msg "390" parse_string @@ fun msg f_BidRequest_BidID ->
    req msg "391" parse_string @@ fun msg f_BidRequest_ClientBidID ->
    req msg "374" parse_BidRequestTransType @@ fun msg f_BidRequest_BidRequestTransType ->
    opt msg "392" parse_string @@ fun msg f_BidRequest_ListName ->
    req msg "393" parse_int @@ fun msg f_BidRequest_TotNoRelatedSym ->
    req msg "394" parse_BidType @@ fun msg f_BidRequest_BidType ->
    opt msg "395" parse_int @@ fun msg f_BidRequest_NumTickets ->
    opt msg "15" parse_Currency @@ fun msg f_BidRequest_Currency ->
    opt msg "396" parse_float @@ fun msg f_BidRequest_SideValue1 ->
    opt msg "397" parse_float @@ fun msg f_BidRequest_SideValue2 ->
    opt msg "409" parse_LiquidityIndType @@ fun msg f_BidRequest_LiquidityIndType ->
    opt msg "410" parse_float @@ fun msg f_BidRequest_WtAverageLiquidity ->
    opt msg "411" parse_ExchangeForPhysical @@ fun msg f_BidRequest_ExchangeForPhysical ->
    opt msg "412" parse_float @@ fun msg f_BidRequest_OutMainCntryUIndex ->
    opt msg "413" parse_float @@ fun msg f_BidRequest_CrossPercent ->
    opt msg "414" parse_ProgRptReqs @@ fun msg f_BidRequest_ProgRptReqs ->
    opt msg "415" parse_int @@ fun msg f_BidRequest_ProgPeriodInterval ->
    opt msg "416" parse_IncTaxInd @@ fun msg f_BidRequest_IncTaxInd ->
    opt msg "121" parse_ForexReq @@ fun msg f_BidRequest_ForexReq ->
    opt msg "417" parse_int @@ fun msg f_BidRequest_NumBidders ->
    opt msg "75" parse_LocalMktDate @@ fun msg f_BidRequest_TradeDate ->
    req msg "418" parse_BidTradeType @@ fun msg f_BidRequest_BidTradeType ->
    req msg "419" parse_BasisPxType @@ fun msg f_BidRequest_BasisPxType ->
    opt msg "443" parse_UTCTimestamp @@ fun msg f_BidRequest_StrikeTime ->
    opt msg "58" parse_string @@ fun msg f_BidRequest_Text ->
    opt msg "354" parse_int @@ fun msg f_BidRequest_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_BidRequest_EncodedText ->
    ParseSuccess {
    f_BidRequest_BidDescReqGrp;
    f_BidRequest_BidCompReqGrp;
    f_BidRequest_BidID;
    f_BidRequest_ClientBidID;
    f_BidRequest_BidRequestTransType;
    f_BidRequest_ListName;
    f_BidRequest_TotNoRelatedSym;
    f_BidRequest_BidType;
    f_BidRequest_NumTickets;
    f_BidRequest_Currency;
    f_BidRequest_SideValue1;
    f_BidRequest_SideValue2;
    f_BidRequest_LiquidityIndType;
    f_BidRequest_WtAverageLiquidity;
    f_BidRequest_ExchangeForPhysical;
    f_BidRequest_OutMainCntryUIndex;
    f_BidRequest_CrossPercent;
    f_BidRequest_ProgRptReqs;
    f_BidRequest_ProgPeriodInterval;
    f_BidRequest_IncTaxInd;
    f_BidRequest_ForexReq;
    f_BidRequest_NumBidders;
    f_BidRequest_TradeDate;
    f_BidRequest_BidTradeType;
    f_BidRequest_BasisPxType;
    f_BidRequest_StrikeTime;
    f_BidRequest_Text;
    f_BidRequest_EncodedTextLen;
    f_BidRequest_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_BidResponse msg = (
    repeating msg "420" parse_BidCompRspGrp @@ fun msg f_BidResponse_BidCompRspGrp ->
    check_duplicate_tags msg @@ fun () ->
    opt msg "390" parse_string @@ fun msg f_BidResponse_BidID ->
    opt msg "391" parse_string @@ fun msg f_BidResponse_ClientBidID ->
    ParseSuccess {
    f_BidResponse_BidCompRspGrp;
    f_BidResponse_BidID;
    f_BidResponse_ClientBidID;
    } , msg ) |> check_unknown_tags;;

let parse_CollateralAssignment msg = (
    repeating msg "453" parse_Parties @@ fun msg f_CollateralAssignment_Parties ->
    repeating msg "124" parse_ExecCollGrp @@ fun msg f_CollateralAssignment_ExecCollGrp ->
    repeating msg "897" parse_TrdCollGrp @@ fun msg f_CollateralAssignment_TrdCollGrp ->
    repeating msg "555" parse_InstrmtLegGrp @@ fun msg f_CollateralAssignment_InstrmtLegGrp ->
    repeating msg "711" parse_UndInstrmtCollGrp @@ fun msg f_CollateralAssignment_UndInstrmtCollGrp ->
    repeating msg "768" parse_TrdRegTimestamps @@ fun msg f_CollateralAssignment_TrdRegTimestamps ->
    repeating msg "136" parse_MiscFeesGrp @@ fun msg f_CollateralAssignment_MiscFeesGrp ->
    repeating msg "232" parse_Stipulations @@ fun msg f_CollateralAssignment_Stipulations ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_CollateralAssignment_Instrument ->
    block msg  parse_FinancingDetails @@ fun msg f_CollateralAssignment_FinancingDetails ->
    block msg  parse_SpreadOrBenchmarkCurveData @@ fun msg f_CollateralAssignment_SpreadOrBenchmarkCurveData ->
    block msg  parse_SettlInstructionsData @@ fun msg f_CollateralAssignment_SettlInstructionsData ->
    req msg "902" parse_string @@ fun msg f_CollateralAssignment_CollAsgnID ->
    opt msg "894" parse_string @@ fun msg f_CollateralAssignment_CollReqID ->
    req msg "895" parse_CollAsgnReason @@ fun msg f_CollateralAssignment_CollAsgnReason ->
    req msg "903" parse_CollAsgnTransType @@ fun msg f_CollateralAssignment_CollAsgnTransType ->
    opt msg "907" parse_string @@ fun msg f_CollateralAssignment_CollAsgnRefID ->
    req msg "60" parse_UTCTimestamp @@ fun msg f_CollateralAssignment_TransactTime ->
    opt msg "126" parse_UTCTimestamp @@ fun msg f_CollateralAssignment_ExpireTime ->
    opt msg "1" parse_string @@ fun msg f_CollateralAssignment_Account ->
    opt msg "581" parse_AccountType @@ fun msg f_CollateralAssignment_AccountType ->
    opt msg "11" parse_string @@ fun msg f_CollateralAssignment_ClOrdID ->
    opt msg "37" parse_string @@ fun msg f_CollateralAssignment_OrderID ->
    opt msg "198" parse_string @@ fun msg f_CollateralAssignment_SecondaryOrderID ->
    opt msg "526" parse_string @@ fun msg f_CollateralAssignment_SecondaryClOrdID ->
    opt msg "64" parse_LocalMktDate @@ fun msg f_CollateralAssignment_SettlDate ->
    opt msg "53" parse_float @@ fun msg f_CollateralAssignment_Quantity ->
    opt msg "854" parse_QtyType @@ fun msg f_CollateralAssignment_QtyType ->
    opt msg "15" parse_Currency @@ fun msg f_CollateralAssignment_Currency ->
    opt msg "899" parse_float @@ fun msg f_CollateralAssignment_MarginExcess ->
    opt msg "900" parse_float @@ fun msg f_CollateralAssignment_TotalNetValue ->
    opt msg "901" parse_float @@ fun msg f_CollateralAssignment_CashOutstanding ->
    opt msg "54" parse_Side @@ fun msg f_CollateralAssignment_Side ->
    opt msg "44" parse_float @@ fun msg f_CollateralAssignment_Price ->
    opt msg "423" parse_PriceType @@ fun msg f_CollateralAssignment_PriceType ->
    opt msg "159" parse_float @@ fun msg f_CollateralAssignment_AccruedInterestAmt ->
    opt msg "920" parse_float @@ fun msg f_CollateralAssignment_EndAccruedInterestAmt ->
    opt msg "921" parse_float @@ fun msg f_CollateralAssignment_StartCash ->
    opt msg "922" parse_float @@ fun msg f_CollateralAssignment_EndCash ->
    opt msg "336" parse_string @@ fun msg f_CollateralAssignment_TradingSessionID ->
    opt msg "625" parse_string @@ fun msg f_CollateralAssignment_TradingSessionSubID ->
    opt msg "716" parse_SettlSessID @@ fun msg f_CollateralAssignment_SettlSessID ->
    opt msg "717" parse_string @@ fun msg f_CollateralAssignment_SettlSessSubID ->
    opt msg "715" parse_LocalMktDate @@ fun msg f_CollateralAssignment_ClearingBusinessDate ->
    opt msg "58" parse_string @@ fun msg f_CollateralAssignment_Text ->
    opt msg "354" parse_int @@ fun msg f_CollateralAssignment_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_CollateralAssignment_EncodedText ->
    ParseSuccess {
    f_CollateralAssignment_Parties;
    f_CollateralAssignment_ExecCollGrp;
    f_CollateralAssignment_TrdCollGrp;
    f_CollateralAssignment_InstrmtLegGrp;
    f_CollateralAssignment_UndInstrmtCollGrp;
    f_CollateralAssignment_TrdRegTimestamps;
    f_CollateralAssignment_MiscFeesGrp;
    f_CollateralAssignment_Stipulations;
    f_CollateralAssignment_Instrument;
    f_CollateralAssignment_FinancingDetails;
    f_CollateralAssignment_SpreadOrBenchmarkCurveData;
    f_CollateralAssignment_SettlInstructionsData;
    f_CollateralAssignment_CollAsgnID;
    f_CollateralAssignment_CollReqID;
    f_CollateralAssignment_CollAsgnReason;
    f_CollateralAssignment_CollAsgnTransType;
    f_CollateralAssignment_CollAsgnRefID;
    f_CollateralAssignment_TransactTime;
    f_CollateralAssignment_ExpireTime;
    f_CollateralAssignment_Account;
    f_CollateralAssignment_AccountType;
    f_CollateralAssignment_ClOrdID;
    f_CollateralAssignment_OrderID;
    f_CollateralAssignment_SecondaryOrderID;
    f_CollateralAssignment_SecondaryClOrdID;
    f_CollateralAssignment_SettlDate;
    f_CollateralAssignment_Quantity;
    f_CollateralAssignment_QtyType;
    f_CollateralAssignment_Currency;
    f_CollateralAssignment_MarginExcess;
    f_CollateralAssignment_TotalNetValue;
    f_CollateralAssignment_CashOutstanding;
    f_CollateralAssignment_Side;
    f_CollateralAssignment_Price;
    f_CollateralAssignment_PriceType;
    f_CollateralAssignment_AccruedInterestAmt;
    f_CollateralAssignment_EndAccruedInterestAmt;
    f_CollateralAssignment_StartCash;
    f_CollateralAssignment_EndCash;
    f_CollateralAssignment_TradingSessionID;
    f_CollateralAssignment_TradingSessionSubID;
    f_CollateralAssignment_SettlSessID;
    f_CollateralAssignment_SettlSessSubID;
    f_CollateralAssignment_ClearingBusinessDate;
    f_CollateralAssignment_Text;
    f_CollateralAssignment_EncodedTextLen;
    f_CollateralAssignment_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_CollateralInquiry msg = (
    repeating msg "938" parse_CollInqQualGrp @@ fun msg f_CollateralInquiry_CollInqQualGrp ->
    repeating msg "453" parse_Parties @@ fun msg f_CollateralInquiry_Parties ->
    repeating msg "124" parse_ExecCollGrp @@ fun msg f_CollateralInquiry_ExecCollGrp ->
    repeating msg "897" parse_TrdCollGrp @@ fun msg f_CollateralInquiry_TrdCollGrp ->
    repeating msg "555" parse_InstrmtLegGrp @@ fun msg f_CollateralInquiry_InstrmtLegGrp ->
    repeating msg "711" parse_UndInstrmtGrp @@ fun msg f_CollateralInquiry_UndInstrmtGrp ->
    repeating msg "768" parse_TrdRegTimestamps @@ fun msg f_CollateralInquiry_TrdRegTimestamps ->
    repeating msg "232" parse_Stipulations @@ fun msg f_CollateralInquiry_Stipulations ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_CollateralInquiry_Instrument ->
    block msg  parse_FinancingDetails @@ fun msg f_CollateralInquiry_FinancingDetails ->
    block msg  parse_SpreadOrBenchmarkCurveData @@ fun msg f_CollateralInquiry_SpreadOrBenchmarkCurveData ->
    block msg  parse_SettlInstructionsData @@ fun msg f_CollateralInquiry_SettlInstructionsData ->
    opt msg "909" parse_string @@ fun msg f_CollateralInquiry_CollInquiryID ->
    opt msg "263" parse_SubscriptionRequestType @@ fun msg f_CollateralInquiry_SubscriptionRequestType ->
    opt msg "725" parse_ResponseTransportType @@ fun msg f_CollateralInquiry_ResponseTransportType ->
    opt msg "726" parse_string @@ fun msg f_CollateralInquiry_ResponseDestination ->
    opt msg "1" parse_string @@ fun msg f_CollateralInquiry_Account ->
    opt msg "581" parse_AccountType @@ fun msg f_CollateralInquiry_AccountType ->
    opt msg "11" parse_string @@ fun msg f_CollateralInquiry_ClOrdID ->
    opt msg "37" parse_string @@ fun msg f_CollateralInquiry_OrderID ->
    opt msg "198" parse_string @@ fun msg f_CollateralInquiry_SecondaryOrderID ->
    opt msg "526" parse_string @@ fun msg f_CollateralInquiry_SecondaryClOrdID ->
    opt msg "64" parse_LocalMktDate @@ fun msg f_CollateralInquiry_SettlDate ->
    opt msg "53" parse_float @@ fun msg f_CollateralInquiry_Quantity ->
    opt msg "854" parse_QtyType @@ fun msg f_CollateralInquiry_QtyType ->
    opt msg "15" parse_Currency @@ fun msg f_CollateralInquiry_Currency ->
    opt msg "899" parse_float @@ fun msg f_CollateralInquiry_MarginExcess ->
    opt msg "900" parse_float @@ fun msg f_CollateralInquiry_TotalNetValue ->
    opt msg "901" parse_float @@ fun msg f_CollateralInquiry_CashOutstanding ->
    opt msg "54" parse_Side @@ fun msg f_CollateralInquiry_Side ->
    opt msg "44" parse_float @@ fun msg f_CollateralInquiry_Price ->
    opt msg "423" parse_PriceType @@ fun msg f_CollateralInquiry_PriceType ->
    opt msg "159" parse_float @@ fun msg f_CollateralInquiry_AccruedInterestAmt ->
    opt msg "920" parse_float @@ fun msg f_CollateralInquiry_EndAccruedInterestAmt ->
    opt msg "921" parse_float @@ fun msg f_CollateralInquiry_StartCash ->
    opt msg "922" parse_float @@ fun msg f_CollateralInquiry_EndCash ->
    opt msg "336" parse_string @@ fun msg f_CollateralInquiry_TradingSessionID ->
    opt msg "625" parse_string @@ fun msg f_CollateralInquiry_TradingSessionSubID ->
    opt msg "716" parse_SettlSessID @@ fun msg f_CollateralInquiry_SettlSessID ->
    opt msg "717" parse_string @@ fun msg f_CollateralInquiry_SettlSessSubID ->
    opt msg "715" parse_LocalMktDate @@ fun msg f_CollateralInquiry_ClearingBusinessDate ->
    opt msg "58" parse_string @@ fun msg f_CollateralInquiry_Text ->
    opt msg "354" parse_int @@ fun msg f_CollateralInquiry_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_CollateralInquiry_EncodedText ->
    ParseSuccess {
    f_CollateralInquiry_CollInqQualGrp;
    f_CollateralInquiry_Parties;
    f_CollateralInquiry_ExecCollGrp;
    f_CollateralInquiry_TrdCollGrp;
    f_CollateralInquiry_InstrmtLegGrp;
    f_CollateralInquiry_UndInstrmtGrp;
    f_CollateralInquiry_TrdRegTimestamps;
    f_CollateralInquiry_Stipulations;
    f_CollateralInquiry_Instrument;
    f_CollateralInquiry_FinancingDetails;
    f_CollateralInquiry_SpreadOrBenchmarkCurveData;
    f_CollateralInquiry_SettlInstructionsData;
    f_CollateralInquiry_CollInquiryID;
    f_CollateralInquiry_SubscriptionRequestType;
    f_CollateralInquiry_ResponseTransportType;
    f_CollateralInquiry_ResponseDestination;
    f_CollateralInquiry_Account;
    f_CollateralInquiry_AccountType;
    f_CollateralInquiry_ClOrdID;
    f_CollateralInquiry_OrderID;
    f_CollateralInquiry_SecondaryOrderID;
    f_CollateralInquiry_SecondaryClOrdID;
    f_CollateralInquiry_SettlDate;
    f_CollateralInquiry_Quantity;
    f_CollateralInquiry_QtyType;
    f_CollateralInquiry_Currency;
    f_CollateralInquiry_MarginExcess;
    f_CollateralInquiry_TotalNetValue;
    f_CollateralInquiry_CashOutstanding;
    f_CollateralInquiry_Side;
    f_CollateralInquiry_Price;
    f_CollateralInquiry_PriceType;
    f_CollateralInquiry_AccruedInterestAmt;
    f_CollateralInquiry_EndAccruedInterestAmt;
    f_CollateralInquiry_StartCash;
    f_CollateralInquiry_EndCash;
    f_CollateralInquiry_TradingSessionID;
    f_CollateralInquiry_TradingSessionSubID;
    f_CollateralInquiry_SettlSessID;
    f_CollateralInquiry_SettlSessSubID;
    f_CollateralInquiry_ClearingBusinessDate;
    f_CollateralInquiry_Text;
    f_CollateralInquiry_EncodedTextLen;
    f_CollateralInquiry_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_CollateralInquiryAck msg = (
    repeating msg "938" parse_CollInqQualGrp @@ fun msg f_CollateralInquiryAck_CollInqQualGrp ->
    repeating msg "453" parse_Parties @@ fun msg f_CollateralInquiryAck_Parties ->
    repeating msg "124" parse_ExecCollGrp @@ fun msg f_CollateralInquiryAck_ExecCollGrp ->
    repeating msg "897" parse_TrdCollGrp @@ fun msg f_CollateralInquiryAck_TrdCollGrp ->
    repeating msg "555" parse_InstrmtLegGrp @@ fun msg f_CollateralInquiryAck_InstrmtLegGrp ->
    repeating msg "711" parse_UndInstrmtGrp @@ fun msg f_CollateralInquiryAck_UndInstrmtGrp ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_CollateralInquiryAck_Instrument ->
    block msg  parse_FinancingDetails @@ fun msg f_CollateralInquiryAck_FinancingDetails ->
    req msg "909" parse_string @@ fun msg f_CollateralInquiryAck_CollInquiryID ->
    req msg "945" parse_CollInquiryStatus @@ fun msg f_CollateralInquiryAck_CollInquiryStatus ->
    opt msg "946" parse_CollInquiryResult @@ fun msg f_CollateralInquiryAck_CollInquiryResult ->
    opt msg "911" parse_int @@ fun msg f_CollateralInquiryAck_TotNumReports ->
    opt msg "1" parse_string @@ fun msg f_CollateralInquiryAck_Account ->
    opt msg "581" parse_AccountType @@ fun msg f_CollateralInquiryAck_AccountType ->
    opt msg "11" parse_string @@ fun msg f_CollateralInquiryAck_ClOrdID ->
    opt msg "37" parse_string @@ fun msg f_CollateralInquiryAck_OrderID ->
    opt msg "198" parse_string @@ fun msg f_CollateralInquiryAck_SecondaryOrderID ->
    opt msg "526" parse_string @@ fun msg f_CollateralInquiryAck_SecondaryClOrdID ->
    opt msg "64" parse_LocalMktDate @@ fun msg f_CollateralInquiryAck_SettlDate ->
    opt msg "53" parse_float @@ fun msg f_CollateralInquiryAck_Quantity ->
    opt msg "854" parse_QtyType @@ fun msg f_CollateralInquiryAck_QtyType ->
    opt msg "15" parse_Currency @@ fun msg f_CollateralInquiryAck_Currency ->
    opt msg "336" parse_string @@ fun msg f_CollateralInquiryAck_TradingSessionID ->
    opt msg "625" parse_string @@ fun msg f_CollateralInquiryAck_TradingSessionSubID ->
    opt msg "716" parse_SettlSessID @@ fun msg f_CollateralInquiryAck_SettlSessID ->
    opt msg "717" parse_string @@ fun msg f_CollateralInquiryAck_SettlSessSubID ->
    opt msg "715" parse_LocalMktDate @@ fun msg f_CollateralInquiryAck_ClearingBusinessDate ->
    opt msg "725" parse_ResponseTransportType @@ fun msg f_CollateralInquiryAck_ResponseTransportType ->
    opt msg "726" parse_string @@ fun msg f_CollateralInquiryAck_ResponseDestination ->
    opt msg "58" parse_string @@ fun msg f_CollateralInquiryAck_Text ->
    opt msg "354" parse_int @@ fun msg f_CollateralInquiryAck_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_CollateralInquiryAck_EncodedText ->
    ParseSuccess {
    f_CollateralInquiryAck_CollInqQualGrp;
    f_CollateralInquiryAck_Parties;
    f_CollateralInquiryAck_ExecCollGrp;
    f_CollateralInquiryAck_TrdCollGrp;
    f_CollateralInquiryAck_InstrmtLegGrp;
    f_CollateralInquiryAck_UndInstrmtGrp;
    f_CollateralInquiryAck_Instrument;
    f_CollateralInquiryAck_FinancingDetails;
    f_CollateralInquiryAck_CollInquiryID;
    f_CollateralInquiryAck_CollInquiryStatus;
    f_CollateralInquiryAck_CollInquiryResult;
    f_CollateralInquiryAck_TotNumReports;
    f_CollateralInquiryAck_Account;
    f_CollateralInquiryAck_AccountType;
    f_CollateralInquiryAck_ClOrdID;
    f_CollateralInquiryAck_OrderID;
    f_CollateralInquiryAck_SecondaryOrderID;
    f_CollateralInquiryAck_SecondaryClOrdID;
    f_CollateralInquiryAck_SettlDate;
    f_CollateralInquiryAck_Quantity;
    f_CollateralInquiryAck_QtyType;
    f_CollateralInquiryAck_Currency;
    f_CollateralInquiryAck_TradingSessionID;
    f_CollateralInquiryAck_TradingSessionSubID;
    f_CollateralInquiryAck_SettlSessID;
    f_CollateralInquiryAck_SettlSessSubID;
    f_CollateralInquiryAck_ClearingBusinessDate;
    f_CollateralInquiryAck_ResponseTransportType;
    f_CollateralInquiryAck_ResponseDestination;
    f_CollateralInquiryAck_Text;
    f_CollateralInquiryAck_EncodedTextLen;
    f_CollateralInquiryAck_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_CollateralReport msg = (
    repeating msg "453" parse_Parties @@ fun msg f_CollateralReport_Parties ->
    repeating msg "124" parse_ExecCollGrp @@ fun msg f_CollateralReport_ExecCollGrp ->
    repeating msg "897" parse_TrdCollGrp @@ fun msg f_CollateralReport_TrdCollGrp ->
    repeating msg "555" parse_InstrmtLegGrp @@ fun msg f_CollateralReport_InstrmtLegGrp ->
    repeating msg "711" parse_UndInstrmtGrp @@ fun msg f_CollateralReport_UndInstrmtGrp ->
    repeating msg "768" parse_TrdRegTimestamps @@ fun msg f_CollateralReport_TrdRegTimestamps ->
    repeating msg "136" parse_MiscFeesGrp @@ fun msg f_CollateralReport_MiscFeesGrp ->
    repeating msg "232" parse_Stipulations @@ fun msg f_CollateralReport_Stipulations ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_CollateralReport_Instrument ->
    block msg  parse_FinancingDetails @@ fun msg f_CollateralReport_FinancingDetails ->
    block msg  parse_SpreadOrBenchmarkCurveData @@ fun msg f_CollateralReport_SpreadOrBenchmarkCurveData ->
    block msg  parse_SettlInstructionsData @@ fun msg f_CollateralReport_SettlInstructionsData ->
    req msg "908" parse_string @@ fun msg f_CollateralReport_CollRptID ->
    opt msg "909" parse_string @@ fun msg f_CollateralReport_CollInquiryID ->
    req msg "910" parse_CollStatus @@ fun msg f_CollateralReport_CollStatus ->
    opt msg "911" parse_int @@ fun msg f_CollateralReport_TotNumReports ->
    opt msg "912" parse_bool @@ fun msg f_CollateralReport_LastRptRequested ->
    opt msg "1" parse_string @@ fun msg f_CollateralReport_Account ->
    opt msg "581" parse_AccountType @@ fun msg f_CollateralReport_AccountType ->
    opt msg "11" parse_string @@ fun msg f_CollateralReport_ClOrdID ->
    opt msg "37" parse_string @@ fun msg f_CollateralReport_OrderID ->
    opt msg "198" parse_string @@ fun msg f_CollateralReport_SecondaryOrderID ->
    opt msg "526" parse_string @@ fun msg f_CollateralReport_SecondaryClOrdID ->
    opt msg "64" parse_LocalMktDate @@ fun msg f_CollateralReport_SettlDate ->
    opt msg "53" parse_float @@ fun msg f_CollateralReport_Quantity ->
    opt msg "854" parse_QtyType @@ fun msg f_CollateralReport_QtyType ->
    opt msg "15" parse_Currency @@ fun msg f_CollateralReport_Currency ->
    opt msg "899" parse_float @@ fun msg f_CollateralReport_MarginExcess ->
    opt msg "900" parse_float @@ fun msg f_CollateralReport_TotalNetValue ->
    opt msg "901" parse_float @@ fun msg f_CollateralReport_CashOutstanding ->
    opt msg "54" parse_Side @@ fun msg f_CollateralReport_Side ->
    opt msg "44" parse_float @@ fun msg f_CollateralReport_Price ->
    opt msg "423" parse_PriceType @@ fun msg f_CollateralReport_PriceType ->
    opt msg "159" parse_float @@ fun msg f_CollateralReport_AccruedInterestAmt ->
    opt msg "920" parse_float @@ fun msg f_CollateralReport_EndAccruedInterestAmt ->
    opt msg "921" parse_float @@ fun msg f_CollateralReport_StartCash ->
    opt msg "922" parse_float @@ fun msg f_CollateralReport_EndCash ->
    opt msg "336" parse_string @@ fun msg f_CollateralReport_TradingSessionID ->
    opt msg "625" parse_string @@ fun msg f_CollateralReport_TradingSessionSubID ->
    opt msg "716" parse_SettlSessID @@ fun msg f_CollateralReport_SettlSessID ->
    opt msg "717" parse_string @@ fun msg f_CollateralReport_SettlSessSubID ->
    opt msg "715" parse_LocalMktDate @@ fun msg f_CollateralReport_ClearingBusinessDate ->
    opt msg "58" parse_string @@ fun msg f_CollateralReport_Text ->
    opt msg "354" parse_int @@ fun msg f_CollateralReport_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_CollateralReport_EncodedText ->
    ParseSuccess {
    f_CollateralReport_Parties;
    f_CollateralReport_ExecCollGrp;
    f_CollateralReport_TrdCollGrp;
    f_CollateralReport_InstrmtLegGrp;
    f_CollateralReport_UndInstrmtGrp;
    f_CollateralReport_TrdRegTimestamps;
    f_CollateralReport_MiscFeesGrp;
    f_CollateralReport_Stipulations;
    f_CollateralReport_Instrument;
    f_CollateralReport_FinancingDetails;
    f_CollateralReport_SpreadOrBenchmarkCurveData;
    f_CollateralReport_SettlInstructionsData;
    f_CollateralReport_CollRptID;
    f_CollateralReport_CollInquiryID;
    f_CollateralReport_CollStatus;
    f_CollateralReport_TotNumReports;
    f_CollateralReport_LastRptRequested;
    f_CollateralReport_Account;
    f_CollateralReport_AccountType;
    f_CollateralReport_ClOrdID;
    f_CollateralReport_OrderID;
    f_CollateralReport_SecondaryOrderID;
    f_CollateralReport_SecondaryClOrdID;
    f_CollateralReport_SettlDate;
    f_CollateralReport_Quantity;
    f_CollateralReport_QtyType;
    f_CollateralReport_Currency;
    f_CollateralReport_MarginExcess;
    f_CollateralReport_TotalNetValue;
    f_CollateralReport_CashOutstanding;
    f_CollateralReport_Side;
    f_CollateralReport_Price;
    f_CollateralReport_PriceType;
    f_CollateralReport_AccruedInterestAmt;
    f_CollateralReport_EndAccruedInterestAmt;
    f_CollateralReport_StartCash;
    f_CollateralReport_EndCash;
    f_CollateralReport_TradingSessionID;
    f_CollateralReport_TradingSessionSubID;
    f_CollateralReport_SettlSessID;
    f_CollateralReport_SettlSessSubID;
    f_CollateralReport_ClearingBusinessDate;
    f_CollateralReport_Text;
    f_CollateralReport_EncodedTextLen;
    f_CollateralReport_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_CollateralRequest msg = (
    repeating msg "453" parse_Parties @@ fun msg f_CollateralRequest_Parties ->
    repeating msg "124" parse_ExecCollGrp @@ fun msg f_CollateralRequest_ExecCollGrp ->
    repeating msg "897" parse_TrdCollGrp @@ fun msg f_CollateralRequest_TrdCollGrp ->
    repeating msg "555" parse_InstrmtLegGrp @@ fun msg f_CollateralRequest_InstrmtLegGrp ->
    repeating msg "711" parse_UndInstrmtCollGrp @@ fun msg f_CollateralRequest_UndInstrmtCollGrp ->
    repeating msg "768" parse_TrdRegTimestamps @@ fun msg f_CollateralRequest_TrdRegTimestamps ->
    repeating msg "136" parse_MiscFeesGrp @@ fun msg f_CollateralRequest_MiscFeesGrp ->
    repeating msg "232" parse_Stipulations @@ fun msg f_CollateralRequest_Stipulations ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_CollateralRequest_Instrument ->
    block msg  parse_FinancingDetails @@ fun msg f_CollateralRequest_FinancingDetails ->
    block msg  parse_SpreadOrBenchmarkCurveData @@ fun msg f_CollateralRequest_SpreadOrBenchmarkCurveData ->
    req msg "894" parse_string @@ fun msg f_CollateralRequest_CollReqID ->
    req msg "895" parse_CollAsgnReason @@ fun msg f_CollateralRequest_CollAsgnReason ->
    req msg "60" parse_UTCTimestamp @@ fun msg f_CollateralRequest_TransactTime ->
    opt msg "126" parse_UTCTimestamp @@ fun msg f_CollateralRequest_ExpireTime ->
    opt msg "1" parse_string @@ fun msg f_CollateralRequest_Account ->
    opt msg "581" parse_AccountType @@ fun msg f_CollateralRequest_AccountType ->
    opt msg "11" parse_string @@ fun msg f_CollateralRequest_ClOrdID ->
    opt msg "37" parse_string @@ fun msg f_CollateralRequest_OrderID ->
    opt msg "198" parse_string @@ fun msg f_CollateralRequest_SecondaryOrderID ->
    opt msg "526" parse_string @@ fun msg f_CollateralRequest_SecondaryClOrdID ->
    opt msg "64" parse_LocalMktDate @@ fun msg f_CollateralRequest_SettlDate ->
    opt msg "53" parse_float @@ fun msg f_CollateralRequest_Quantity ->
    opt msg "854" parse_QtyType @@ fun msg f_CollateralRequest_QtyType ->
    opt msg "15" parse_Currency @@ fun msg f_CollateralRequest_Currency ->
    opt msg "899" parse_float @@ fun msg f_CollateralRequest_MarginExcess ->
    opt msg "900" parse_float @@ fun msg f_CollateralRequest_TotalNetValue ->
    opt msg "901" parse_float @@ fun msg f_CollateralRequest_CashOutstanding ->
    opt msg "54" parse_Side @@ fun msg f_CollateralRequest_Side ->
    opt msg "44" parse_float @@ fun msg f_CollateralRequest_Price ->
    opt msg "423" parse_PriceType @@ fun msg f_CollateralRequest_PriceType ->
    opt msg "159" parse_float @@ fun msg f_CollateralRequest_AccruedInterestAmt ->
    opt msg "920" parse_float @@ fun msg f_CollateralRequest_EndAccruedInterestAmt ->
    opt msg "921" parse_float @@ fun msg f_CollateralRequest_StartCash ->
    opt msg "922" parse_float @@ fun msg f_CollateralRequest_EndCash ->
    opt msg "336" parse_string @@ fun msg f_CollateralRequest_TradingSessionID ->
    opt msg "625" parse_string @@ fun msg f_CollateralRequest_TradingSessionSubID ->
    opt msg "716" parse_SettlSessID @@ fun msg f_CollateralRequest_SettlSessID ->
    opt msg "717" parse_string @@ fun msg f_CollateralRequest_SettlSessSubID ->
    opt msg "715" parse_LocalMktDate @@ fun msg f_CollateralRequest_ClearingBusinessDate ->
    opt msg "58" parse_string @@ fun msg f_CollateralRequest_Text ->
    opt msg "354" parse_int @@ fun msg f_CollateralRequest_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_CollateralRequest_EncodedText ->
    ParseSuccess {
    f_CollateralRequest_Parties;
    f_CollateralRequest_ExecCollGrp;
    f_CollateralRequest_TrdCollGrp;
    f_CollateralRequest_InstrmtLegGrp;
    f_CollateralRequest_UndInstrmtCollGrp;
    f_CollateralRequest_TrdRegTimestamps;
    f_CollateralRequest_MiscFeesGrp;
    f_CollateralRequest_Stipulations;
    f_CollateralRequest_Instrument;
    f_CollateralRequest_FinancingDetails;
    f_CollateralRequest_SpreadOrBenchmarkCurveData;
    f_CollateralRequest_CollReqID;
    f_CollateralRequest_CollAsgnReason;
    f_CollateralRequest_TransactTime;
    f_CollateralRequest_ExpireTime;
    f_CollateralRequest_Account;
    f_CollateralRequest_AccountType;
    f_CollateralRequest_ClOrdID;
    f_CollateralRequest_OrderID;
    f_CollateralRequest_SecondaryOrderID;
    f_CollateralRequest_SecondaryClOrdID;
    f_CollateralRequest_SettlDate;
    f_CollateralRequest_Quantity;
    f_CollateralRequest_QtyType;
    f_CollateralRequest_Currency;
    f_CollateralRequest_MarginExcess;
    f_CollateralRequest_TotalNetValue;
    f_CollateralRequest_CashOutstanding;
    f_CollateralRequest_Side;
    f_CollateralRequest_Price;
    f_CollateralRequest_PriceType;
    f_CollateralRequest_AccruedInterestAmt;
    f_CollateralRequest_EndAccruedInterestAmt;
    f_CollateralRequest_StartCash;
    f_CollateralRequest_EndCash;
    f_CollateralRequest_TradingSessionID;
    f_CollateralRequest_TradingSessionSubID;
    f_CollateralRequest_SettlSessID;
    f_CollateralRequest_SettlSessSubID;
    f_CollateralRequest_ClearingBusinessDate;
    f_CollateralRequest_Text;
    f_CollateralRequest_EncodedTextLen;
    f_CollateralRequest_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_CollateralResponse msg = (
    repeating msg "453" parse_Parties @@ fun msg f_CollateralResponse_Parties ->
    repeating msg "124" parse_ExecCollGrp @@ fun msg f_CollateralResponse_ExecCollGrp ->
    repeating msg "897" parse_TrdCollGrp @@ fun msg f_CollateralResponse_TrdCollGrp ->
    repeating msg "555" parse_InstrmtLegGrp @@ fun msg f_CollateralResponse_InstrmtLegGrp ->
    repeating msg "711" parse_UndInstrmtCollGrp @@ fun msg f_CollateralResponse_UndInstrmtCollGrp ->
    repeating msg "768" parse_TrdRegTimestamps @@ fun msg f_CollateralResponse_TrdRegTimestamps ->
    repeating msg "136" parse_MiscFeesGrp @@ fun msg f_CollateralResponse_MiscFeesGrp ->
    repeating msg "232" parse_Stipulations @@ fun msg f_CollateralResponse_Stipulations ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_CollateralResponse_Instrument ->
    block msg  parse_FinancingDetails @@ fun msg f_CollateralResponse_FinancingDetails ->
    block msg  parse_SpreadOrBenchmarkCurveData @@ fun msg f_CollateralResponse_SpreadOrBenchmarkCurveData ->
    req msg "904" parse_string @@ fun msg f_CollateralResponse_CollRespID ->
    req msg "902" parse_string @@ fun msg f_CollateralResponse_CollAsgnID ->
    opt msg "894" parse_string @@ fun msg f_CollateralResponse_CollReqID ->
    req msg "895" parse_CollAsgnReason @@ fun msg f_CollateralResponse_CollAsgnReason ->
    opt msg "903" parse_CollAsgnTransType @@ fun msg f_CollateralResponse_CollAsgnTransType ->
    req msg "905" parse_CollAsgnRespType @@ fun msg f_CollateralResponse_CollAsgnRespType ->
    opt msg "906" parse_CollAsgnRejectReason @@ fun msg f_CollateralResponse_CollAsgnRejectReason ->
    req msg "60" parse_UTCTimestamp @@ fun msg f_CollateralResponse_TransactTime ->
    opt msg "1" parse_string @@ fun msg f_CollateralResponse_Account ->
    opt msg "581" parse_AccountType @@ fun msg f_CollateralResponse_AccountType ->
    opt msg "11" parse_string @@ fun msg f_CollateralResponse_ClOrdID ->
    opt msg "37" parse_string @@ fun msg f_CollateralResponse_OrderID ->
    opt msg "198" parse_string @@ fun msg f_CollateralResponse_SecondaryOrderID ->
    opt msg "526" parse_string @@ fun msg f_CollateralResponse_SecondaryClOrdID ->
    opt msg "64" parse_LocalMktDate @@ fun msg f_CollateralResponse_SettlDate ->
    opt msg "53" parse_float @@ fun msg f_CollateralResponse_Quantity ->
    opt msg "854" parse_QtyType @@ fun msg f_CollateralResponse_QtyType ->
    opt msg "15" parse_Currency @@ fun msg f_CollateralResponse_Currency ->
    opt msg "899" parse_float @@ fun msg f_CollateralResponse_MarginExcess ->
    opt msg "900" parse_float @@ fun msg f_CollateralResponse_TotalNetValue ->
    opt msg "901" parse_float @@ fun msg f_CollateralResponse_CashOutstanding ->
    opt msg "54" parse_Side @@ fun msg f_CollateralResponse_Side ->
    opt msg "44" parse_float @@ fun msg f_CollateralResponse_Price ->
    opt msg "423" parse_PriceType @@ fun msg f_CollateralResponse_PriceType ->
    opt msg "159" parse_float @@ fun msg f_CollateralResponse_AccruedInterestAmt ->
    opt msg "920" parse_float @@ fun msg f_CollateralResponse_EndAccruedInterestAmt ->
    opt msg "921" parse_float @@ fun msg f_CollateralResponse_StartCash ->
    opt msg "922" parse_float @@ fun msg f_CollateralResponse_EndCash ->
    opt msg "58" parse_string @@ fun msg f_CollateralResponse_Text ->
    opt msg "354" parse_int @@ fun msg f_CollateralResponse_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_CollateralResponse_EncodedText ->
    ParseSuccess {
    f_CollateralResponse_Parties;
    f_CollateralResponse_ExecCollGrp;
    f_CollateralResponse_TrdCollGrp;
    f_CollateralResponse_InstrmtLegGrp;
    f_CollateralResponse_UndInstrmtCollGrp;
    f_CollateralResponse_TrdRegTimestamps;
    f_CollateralResponse_MiscFeesGrp;
    f_CollateralResponse_Stipulations;
    f_CollateralResponse_Instrument;
    f_CollateralResponse_FinancingDetails;
    f_CollateralResponse_SpreadOrBenchmarkCurveData;
    f_CollateralResponse_CollRespID;
    f_CollateralResponse_CollAsgnID;
    f_CollateralResponse_CollReqID;
    f_CollateralResponse_CollAsgnReason;
    f_CollateralResponse_CollAsgnTransType;
    f_CollateralResponse_CollAsgnRespType;
    f_CollateralResponse_CollAsgnRejectReason;
    f_CollateralResponse_TransactTime;
    f_CollateralResponse_Account;
    f_CollateralResponse_AccountType;
    f_CollateralResponse_ClOrdID;
    f_CollateralResponse_OrderID;
    f_CollateralResponse_SecondaryOrderID;
    f_CollateralResponse_SecondaryClOrdID;
    f_CollateralResponse_SettlDate;
    f_CollateralResponse_Quantity;
    f_CollateralResponse_QtyType;
    f_CollateralResponse_Currency;
    f_CollateralResponse_MarginExcess;
    f_CollateralResponse_TotalNetValue;
    f_CollateralResponse_CashOutstanding;
    f_CollateralResponse_Side;
    f_CollateralResponse_Price;
    f_CollateralResponse_PriceType;
    f_CollateralResponse_AccruedInterestAmt;
    f_CollateralResponse_EndAccruedInterestAmt;
    f_CollateralResponse_StartCash;
    f_CollateralResponse_EndCash;
    f_CollateralResponse_Text;
    f_CollateralResponse_EncodedTextLen;
    f_CollateralResponse_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_Confirmation msg = (
    repeating msg "453" parse_Parties @@ fun msg f_Confirmation_Parties ->
    repeating msg "73" parse_OrdAllocGrp @@ fun msg f_Confirmation_OrdAllocGrp ->
    repeating msg "768" parse_TrdRegTimestamps @@ fun msg f_Confirmation_TrdRegTimestamps ->
    repeating msg "711" parse_UndInstrmtGrp @@ fun msg f_Confirmation_UndInstrmtGrp ->
    repeating msg "555" parse_InstrmtLegGrp @@ fun msg f_Confirmation_InstrmtLegGrp ->
    repeating msg "862" parse_CpctyConfGrp @@ fun msg f_Confirmation_CpctyConfGrp ->
    repeating msg "232" parse_Stipulations @@ fun msg f_Confirmation_Stipulations ->
    repeating msg "136" parse_MiscFeesGrp @@ fun msg f_Confirmation_MiscFeesGrp ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_Confirmation_Instrument ->
    block msg  parse_InstrumentExtension @@ fun msg f_Confirmation_InstrumentExtension ->
    block msg  parse_FinancingDetails @@ fun msg f_Confirmation_FinancingDetails ->
    block msg  parse_YieldData @@ fun msg f_Confirmation_YieldData ->
    block msg  parse_SpreadOrBenchmarkCurveData @@ fun msg f_Confirmation_SpreadOrBenchmarkCurveData ->
    block msg  parse_SettlInstructionsData @@ fun msg f_Confirmation_SettlInstructionsData ->
    block msg  parse_CommissionData @@ fun msg f_Confirmation_CommissionData ->
    req msg "664" parse_string @@ fun msg f_Confirmation_ConfirmID ->
    opt msg "772" parse_string @@ fun msg f_Confirmation_ConfirmRefID ->
    opt msg "859" parse_string @@ fun msg f_Confirmation_ConfirmReqID ->
    req msg "666" parse_ConfirmTransType @@ fun msg f_Confirmation_ConfirmTransType ->
    req msg "773" parse_ConfirmType @@ fun msg f_Confirmation_ConfirmType ->
    opt msg "797" parse_bool @@ fun msg f_Confirmation_CopyMsgIndicator ->
    opt msg "650" parse_LegalConfirm @@ fun msg f_Confirmation_LegalConfirm ->
    req msg "665" parse_ConfirmStatus @@ fun msg f_Confirmation_ConfirmStatus ->
    opt msg "70" parse_string @@ fun msg f_Confirmation_AllocID ->
    opt msg "793" parse_string @@ fun msg f_Confirmation_SecondaryAllocID ->
    opt msg "467" parse_string @@ fun msg f_Confirmation_IndividualAllocID ->
    req msg "60" parse_UTCTimestamp @@ fun msg f_Confirmation_TransactTime ->
    req msg "75" parse_LocalMktDate @@ fun msg f_Confirmation_TradeDate ->
    req msg "80" parse_float @@ fun msg f_Confirmation_AllocQty ->
    opt msg "854" parse_QtyType @@ fun msg f_Confirmation_QtyType ->
    req msg "54" parse_Side @@ fun msg f_Confirmation_Side ->
    opt msg "15" parse_Currency @@ fun msg f_Confirmation_Currency ->
    opt msg "30" parse_Exchange @@ fun msg f_Confirmation_LastMkt ->
    req msg "79" parse_string @@ fun msg f_Confirmation_AllocAccount ->
    opt msg "661" parse_int @@ fun msg f_Confirmation_AllocAcctIDSource ->
    opt msg "798" parse_AllocAccountType @@ fun msg f_Confirmation_AllocAccountType ->
    req msg "6" parse_float @@ fun msg f_Confirmation_AvgPx ->
    opt msg "74" parse_int @@ fun msg f_Confirmation_AvgPxPrecision ->
    opt msg "423" parse_PriceType @@ fun msg f_Confirmation_PriceType ->
    opt msg "860" parse_float @@ fun msg f_Confirmation_AvgParPx ->
    opt msg "861" parse_float @@ fun msg f_Confirmation_ReportedPx ->
    opt msg "58" parse_string @@ fun msg f_Confirmation_Text ->
    opt msg "354" parse_int @@ fun msg f_Confirmation_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_Confirmation_EncodedText ->
    opt msg "81" parse_ProcessCode @@ fun msg f_Confirmation_ProcessCode ->
    req msg "381" parse_float @@ fun msg f_Confirmation_GrossTradeAmt ->
    opt msg "157" parse_int @@ fun msg f_Confirmation_NumDaysInterest ->
    opt msg "230" parse_LocalMktDate @@ fun msg f_Confirmation_ExDate ->
    opt msg "158" parse_float @@ fun msg f_Confirmation_AccruedInterestRate ->
    opt msg "159" parse_float @@ fun msg f_Confirmation_AccruedInterestAmt ->
    opt msg "738" parse_float @@ fun msg f_Confirmation_InterestAtMaturity ->
    opt msg "920" parse_float @@ fun msg f_Confirmation_EndAccruedInterestAmt ->
    opt msg "921" parse_float @@ fun msg f_Confirmation_StartCash ->
    opt msg "922" parse_float @@ fun msg f_Confirmation_EndCash ->
    opt msg "238" parse_float @@ fun msg f_Confirmation_Concession ->
    opt msg "237" parse_float @@ fun msg f_Confirmation_TotalTakedown ->
    req msg "118" parse_float @@ fun msg f_Confirmation_NetMoney ->
    opt msg "890" parse_float @@ fun msg f_Confirmation_MaturityNetMoney ->
    opt msg "119" parse_float @@ fun msg f_Confirmation_SettlCurrAmt ->
    opt msg "120" parse_Currency @@ fun msg f_Confirmation_SettlCurrency ->
    opt msg "155" parse_float @@ fun msg f_Confirmation_SettlCurrFxRate ->
    opt msg "156" parse_SettlCurrFxRateCalc @@ fun msg f_Confirmation_SettlCurrFxRateCalc ->
    opt msg "63" parse_SettlType @@ fun msg f_Confirmation_SettlType ->
    opt msg "64" parse_LocalMktDate @@ fun msg f_Confirmation_SettlDate ->
    opt msg "858" parse_float @@ fun msg f_Confirmation_SharedCommission ->
    ParseSuccess {
    f_Confirmation_Parties;
    f_Confirmation_OrdAllocGrp;
    f_Confirmation_TrdRegTimestamps;
    f_Confirmation_UndInstrmtGrp;
    f_Confirmation_InstrmtLegGrp;
    f_Confirmation_CpctyConfGrp;
    f_Confirmation_Stipulations;
    f_Confirmation_MiscFeesGrp;
    f_Confirmation_Instrument;
    f_Confirmation_InstrumentExtension;
    f_Confirmation_FinancingDetails;
    f_Confirmation_YieldData;
    f_Confirmation_SpreadOrBenchmarkCurveData;
    f_Confirmation_SettlInstructionsData;
    f_Confirmation_CommissionData;
    f_Confirmation_ConfirmID;
    f_Confirmation_ConfirmRefID;
    f_Confirmation_ConfirmReqID;
    f_Confirmation_ConfirmTransType;
    f_Confirmation_ConfirmType;
    f_Confirmation_CopyMsgIndicator;
    f_Confirmation_LegalConfirm;
    f_Confirmation_ConfirmStatus;
    f_Confirmation_AllocID;
    f_Confirmation_SecondaryAllocID;
    f_Confirmation_IndividualAllocID;
    f_Confirmation_TransactTime;
    f_Confirmation_TradeDate;
    f_Confirmation_AllocQty;
    f_Confirmation_QtyType;
    f_Confirmation_Side;
    f_Confirmation_Currency;
    f_Confirmation_LastMkt;
    f_Confirmation_AllocAccount;
    f_Confirmation_AllocAcctIDSource;
    f_Confirmation_AllocAccountType;
    f_Confirmation_AvgPx;
    f_Confirmation_AvgPxPrecision;
    f_Confirmation_PriceType;
    f_Confirmation_AvgParPx;
    f_Confirmation_ReportedPx;
    f_Confirmation_Text;
    f_Confirmation_EncodedTextLen;
    f_Confirmation_EncodedText;
    f_Confirmation_ProcessCode;
    f_Confirmation_GrossTradeAmt;
    f_Confirmation_NumDaysInterest;
    f_Confirmation_ExDate;
    f_Confirmation_AccruedInterestRate;
    f_Confirmation_AccruedInterestAmt;
    f_Confirmation_InterestAtMaturity;
    f_Confirmation_EndAccruedInterestAmt;
    f_Confirmation_StartCash;
    f_Confirmation_EndCash;
    f_Confirmation_Concession;
    f_Confirmation_TotalTakedown;
    f_Confirmation_NetMoney;
    f_Confirmation_MaturityNetMoney;
    f_Confirmation_SettlCurrAmt;
    f_Confirmation_SettlCurrency;
    f_Confirmation_SettlCurrFxRate;
    f_Confirmation_SettlCurrFxRateCalc;
    f_Confirmation_SettlType;
    f_Confirmation_SettlDate;
    f_Confirmation_SharedCommission;
    } , msg ) |> check_unknown_tags;;

let parse_ConfirmationAck msg = (
    check_duplicate_tags msg @@ fun () ->
    req msg "664" parse_string @@ fun msg f_ConfirmationAck_ConfirmID ->
    req msg "75" parse_LocalMktDate @@ fun msg f_ConfirmationAck_TradeDate ->
    req msg "60" parse_UTCTimestamp @@ fun msg f_ConfirmationAck_TransactTime ->
    req msg "940" parse_AffirmStatus @@ fun msg f_ConfirmationAck_AffirmStatus ->
    opt msg "774" parse_ConfirmRejReason @@ fun msg f_ConfirmationAck_ConfirmRejReason ->
    opt msg "573" parse_MatchStatus @@ fun msg f_ConfirmationAck_MatchStatus ->
    opt msg "58" parse_string @@ fun msg f_ConfirmationAck_Text ->
    opt msg "354" parse_int @@ fun msg f_ConfirmationAck_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_ConfirmationAck_EncodedText ->
    ParseSuccess {
    f_ConfirmationAck_ConfirmID;
    f_ConfirmationAck_TradeDate;
    f_ConfirmationAck_TransactTime;
    f_ConfirmationAck_AffirmStatus;
    f_ConfirmationAck_ConfirmRejReason;
    f_ConfirmationAck_MatchStatus;
    f_ConfirmationAck_Text;
    f_ConfirmationAck_EncodedTextLen;
    f_ConfirmationAck_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_ConfirmationRequest msg = (
    repeating msg "73" parse_OrdAllocGrp @@ fun msg f_ConfirmationRequest_OrdAllocGrp ->
    check_duplicate_tags msg @@ fun () ->
    req msg "859" parse_string @@ fun msg f_ConfirmationRequest_ConfirmReqID ->
    req msg "773" parse_ConfirmType @@ fun msg f_ConfirmationRequest_ConfirmType ->
    opt msg "70" parse_string @@ fun msg f_ConfirmationRequest_AllocID ->
    opt msg "793" parse_string @@ fun msg f_ConfirmationRequest_SecondaryAllocID ->
    opt msg "467" parse_string @@ fun msg f_ConfirmationRequest_IndividualAllocID ->
    req msg "60" parse_UTCTimestamp @@ fun msg f_ConfirmationRequest_TransactTime ->
    opt msg "79" parse_string @@ fun msg f_ConfirmationRequest_AllocAccount ->
    opt msg "661" parse_int @@ fun msg f_ConfirmationRequest_AllocAcctIDSource ->
    opt msg "798" parse_AllocAccountType @@ fun msg f_ConfirmationRequest_AllocAccountType ->
    opt msg "58" parse_string @@ fun msg f_ConfirmationRequest_Text ->
    opt msg "354" parse_int @@ fun msg f_ConfirmationRequest_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_ConfirmationRequest_EncodedText ->
    ParseSuccess {
    f_ConfirmationRequest_OrdAllocGrp;
    f_ConfirmationRequest_ConfirmReqID;
    f_ConfirmationRequest_ConfirmType;
    f_ConfirmationRequest_AllocID;
    f_ConfirmationRequest_SecondaryAllocID;
    f_ConfirmationRequest_IndividualAllocID;
    f_ConfirmationRequest_TransactTime;
    f_ConfirmationRequest_AllocAccount;
    f_ConfirmationRequest_AllocAcctIDSource;
    f_ConfirmationRequest_AllocAccountType;
    f_ConfirmationRequest_Text;
    f_ConfirmationRequest_EncodedTextLen;
    f_ConfirmationRequest_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_CrossOrderCancelReplaceRequest msg = (
    repeating msg "552" parse_SideCrossOrdModGrp @@ fun msg f_CrossOrderCancelReplaceRequest_SideCrossOrdModGrp ->
    repeating msg "711" parse_UndInstrmtGrp @@ fun msg f_CrossOrderCancelReplaceRequest_UndInstrmtGrp ->
    repeating msg "555" parse_InstrmtLegGrp @@ fun msg f_CrossOrderCancelReplaceRequest_InstrmtLegGrp ->
    repeating msg "386" parse_TrdgSesGrp @@ fun msg f_CrossOrderCancelReplaceRequest_TrdgSesGrp ->
    repeating msg "232" parse_Stipulations @@ fun msg f_CrossOrderCancelReplaceRequest_Stipulations ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_CrossOrderCancelReplaceRequest_Instrument ->
    block msg  parse_SpreadOrBenchmarkCurveData @@ fun msg f_CrossOrderCancelReplaceRequest_SpreadOrBenchmarkCurveData ->
    block msg  parse_YieldData @@ fun msg f_CrossOrderCancelReplaceRequest_YieldData ->
    block msg  parse_PegInstructions @@ fun msg f_CrossOrderCancelReplaceRequest_PegInstructions ->
    block msg  parse_DiscretionInstructions @@ fun msg f_CrossOrderCancelReplaceRequest_DiscretionInstructions ->
    opt msg "37" parse_string @@ fun msg f_CrossOrderCancelReplaceRequest_OrderID ->
    req msg "548" parse_string @@ fun msg f_CrossOrderCancelReplaceRequest_CrossID ->
    req msg "551" parse_string @@ fun msg f_CrossOrderCancelReplaceRequest_OrigCrossID ->
    req msg "549" parse_CrossType @@ fun msg f_CrossOrderCancelReplaceRequest_CrossType ->
    req msg "550" parse_CrossPrioritization @@ fun msg f_CrossOrderCancelReplaceRequest_CrossPrioritization ->
    opt msg "63" parse_SettlType @@ fun msg f_CrossOrderCancelReplaceRequest_SettlType ->
    opt msg "64" parse_LocalMktDate @@ fun msg f_CrossOrderCancelReplaceRequest_SettlDate ->
    opt msg "21" parse_HandlInst @@ fun msg f_CrossOrderCancelReplaceRequest_HandlInst ->
    opt msg "18" parse_ExecInst @@ fun msg f_CrossOrderCancelReplaceRequest_ExecInst ->
    opt msg "110" parse_float @@ fun msg f_CrossOrderCancelReplaceRequest_MinQty ->
    opt msg "111" parse_float @@ fun msg f_CrossOrderCancelReplaceRequest_MaxFloor ->
    opt msg "100" parse_Exchange @@ fun msg f_CrossOrderCancelReplaceRequest_ExDestination ->
    opt msg "81" parse_ProcessCode @@ fun msg f_CrossOrderCancelReplaceRequest_ProcessCode ->
    opt msg "140" parse_float @@ fun msg f_CrossOrderCancelReplaceRequest_PrevClosePx ->
    opt msg "114" parse_LocateReqd @@ fun msg f_CrossOrderCancelReplaceRequest_LocateReqd ->
    req msg "60" parse_UTCTimestamp @@ fun msg f_CrossOrderCancelReplaceRequest_TransactTime ->
    req msg "40" parse_OrdType @@ fun msg f_CrossOrderCancelReplaceRequest_OrdType ->
    opt msg "423" parse_PriceType @@ fun msg f_CrossOrderCancelReplaceRequest_PriceType ->
    opt msg "44" parse_float @@ fun msg f_CrossOrderCancelReplaceRequest_Price ->
    opt msg "99" parse_float @@ fun msg f_CrossOrderCancelReplaceRequest_StopPx ->
    opt msg "15" parse_Currency @@ fun msg f_CrossOrderCancelReplaceRequest_Currency ->
    opt msg "376" parse_string @@ fun msg f_CrossOrderCancelReplaceRequest_ComplianceID ->
    opt msg "23" parse_string @@ fun msg f_CrossOrderCancelReplaceRequest_IOIID ->
    opt msg "117" parse_string @@ fun msg f_CrossOrderCancelReplaceRequest_QuoteID ->
    opt msg "59" parse_TimeInForce @@ fun msg f_CrossOrderCancelReplaceRequest_TimeInForce ->
    opt msg "168" parse_UTCTimestamp @@ fun msg f_CrossOrderCancelReplaceRequest_EffectiveTime ->
    opt msg "432" parse_LocalMktDate @@ fun msg f_CrossOrderCancelReplaceRequest_ExpireDate ->
    opt msg "126" parse_UTCTimestamp @@ fun msg f_CrossOrderCancelReplaceRequest_ExpireTime ->
    opt msg "427" parse_GTBookingInst @@ fun msg f_CrossOrderCancelReplaceRequest_GTBookingInst ->
    opt msg "210" parse_float @@ fun msg f_CrossOrderCancelReplaceRequest_MaxShow ->
    opt msg "847" parse_TargetStrategy @@ fun msg f_CrossOrderCancelReplaceRequest_TargetStrategy ->
    opt msg "848" parse_string @@ fun msg f_CrossOrderCancelReplaceRequest_TargetStrategyParameters ->
    opt msg "849" parse_float @@ fun msg f_CrossOrderCancelReplaceRequest_ParticipationRate ->
    opt msg "480" parse_CancellationRights @@ fun msg f_CrossOrderCancelReplaceRequest_CancellationRights ->
    opt msg "481" parse_MoneyLaunderingStatus @@ fun msg f_CrossOrderCancelReplaceRequest_MoneyLaunderingStatus ->
    opt msg "513" parse_string @@ fun msg f_CrossOrderCancelReplaceRequest_RegistID ->
    opt msg "494" parse_string @@ fun msg f_CrossOrderCancelReplaceRequest_Designation ->
    ParseSuccess {
    f_CrossOrderCancelReplaceRequest_SideCrossOrdModGrp;
    f_CrossOrderCancelReplaceRequest_UndInstrmtGrp;
    f_CrossOrderCancelReplaceRequest_InstrmtLegGrp;
    f_CrossOrderCancelReplaceRequest_TrdgSesGrp;
    f_CrossOrderCancelReplaceRequest_Stipulations;
    f_CrossOrderCancelReplaceRequest_Instrument;
    f_CrossOrderCancelReplaceRequest_SpreadOrBenchmarkCurveData;
    f_CrossOrderCancelReplaceRequest_YieldData;
    f_CrossOrderCancelReplaceRequest_PegInstructions;
    f_CrossOrderCancelReplaceRequest_DiscretionInstructions;
    f_CrossOrderCancelReplaceRequest_OrderID;
    f_CrossOrderCancelReplaceRequest_CrossID;
    f_CrossOrderCancelReplaceRequest_OrigCrossID;
    f_CrossOrderCancelReplaceRequest_CrossType;
    f_CrossOrderCancelReplaceRequest_CrossPrioritization;
    f_CrossOrderCancelReplaceRequest_SettlType;
    f_CrossOrderCancelReplaceRequest_SettlDate;
    f_CrossOrderCancelReplaceRequest_HandlInst;
    f_CrossOrderCancelReplaceRequest_ExecInst;
    f_CrossOrderCancelReplaceRequest_MinQty;
    f_CrossOrderCancelReplaceRequest_MaxFloor;
    f_CrossOrderCancelReplaceRequest_ExDestination;
    f_CrossOrderCancelReplaceRequest_ProcessCode;
    f_CrossOrderCancelReplaceRequest_PrevClosePx;
    f_CrossOrderCancelReplaceRequest_LocateReqd;
    f_CrossOrderCancelReplaceRequest_TransactTime;
    f_CrossOrderCancelReplaceRequest_OrdType;
    f_CrossOrderCancelReplaceRequest_PriceType;
    f_CrossOrderCancelReplaceRequest_Price;
    f_CrossOrderCancelReplaceRequest_StopPx;
    f_CrossOrderCancelReplaceRequest_Currency;
    f_CrossOrderCancelReplaceRequest_ComplianceID;
    f_CrossOrderCancelReplaceRequest_IOIID;
    f_CrossOrderCancelReplaceRequest_QuoteID;
    f_CrossOrderCancelReplaceRequest_TimeInForce;
    f_CrossOrderCancelReplaceRequest_EffectiveTime;
    f_CrossOrderCancelReplaceRequest_ExpireDate;
    f_CrossOrderCancelReplaceRequest_ExpireTime;
    f_CrossOrderCancelReplaceRequest_GTBookingInst;
    f_CrossOrderCancelReplaceRequest_MaxShow;
    f_CrossOrderCancelReplaceRequest_TargetStrategy;
    f_CrossOrderCancelReplaceRequest_TargetStrategyParameters;
    f_CrossOrderCancelReplaceRequest_ParticipationRate;
    f_CrossOrderCancelReplaceRequest_CancellationRights;
    f_CrossOrderCancelReplaceRequest_MoneyLaunderingStatus;
    f_CrossOrderCancelReplaceRequest_RegistID;
    f_CrossOrderCancelReplaceRequest_Designation;
    } , msg ) |> check_unknown_tags;;

let parse_CrossOrderCancelRequest msg = (
    repeating msg "552" parse_SideCrossOrdCxlGrp @@ fun msg f_CrossOrderCancelRequest_SideCrossOrdCxlGrp ->
    repeating msg "711" parse_UndInstrmtGrp @@ fun msg f_CrossOrderCancelRequest_UndInstrmtGrp ->
    repeating msg "555" parse_InstrmtLegGrp @@ fun msg f_CrossOrderCancelRequest_InstrmtLegGrp ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_CrossOrderCancelRequest_Instrument ->
    opt msg "37" parse_string @@ fun msg f_CrossOrderCancelRequest_OrderID ->
    req msg "548" parse_string @@ fun msg f_CrossOrderCancelRequest_CrossID ->
    req msg "551" parse_string @@ fun msg f_CrossOrderCancelRequest_OrigCrossID ->
    req msg "549" parse_CrossType @@ fun msg f_CrossOrderCancelRequest_CrossType ->
    req msg "550" parse_CrossPrioritization @@ fun msg f_CrossOrderCancelRequest_CrossPrioritization ->
    req msg "60" parse_UTCTimestamp @@ fun msg f_CrossOrderCancelRequest_TransactTime ->
    ParseSuccess {
    f_CrossOrderCancelRequest_SideCrossOrdCxlGrp;
    f_CrossOrderCancelRequest_UndInstrmtGrp;
    f_CrossOrderCancelRequest_InstrmtLegGrp;
    f_CrossOrderCancelRequest_Instrument;
    f_CrossOrderCancelRequest_OrderID;
    f_CrossOrderCancelRequest_CrossID;
    f_CrossOrderCancelRequest_OrigCrossID;
    f_CrossOrderCancelRequest_CrossType;
    f_CrossOrderCancelRequest_CrossPrioritization;
    f_CrossOrderCancelRequest_TransactTime;
    } , msg ) |> check_unknown_tags;;

let parse_DerivativeSecurityList msg = (
    repeating msg "146" parse_RelSymDerivSecGrp @@ fun msg f_DerivativeSecurityList_RelSymDerivSecGrp ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_UnderlyingInstrument @@ fun msg f_DerivativeSecurityList_UnderlyingInstrument ->
    req msg "320" parse_string @@ fun msg f_DerivativeSecurityList_SecurityReqID ->
    req msg "322" parse_string @@ fun msg f_DerivativeSecurityList_SecurityResponseID ->
    req msg "560" parse_SecurityRequestResult @@ fun msg f_DerivativeSecurityList_SecurityRequestResult ->
    opt msg "393" parse_int @@ fun msg f_DerivativeSecurityList_TotNoRelatedSym ->
    opt msg "893" parse_LastFragment @@ fun msg f_DerivativeSecurityList_LastFragment ->
    ParseSuccess {
    f_DerivativeSecurityList_RelSymDerivSecGrp;
    f_DerivativeSecurityList_UnderlyingInstrument;
    f_DerivativeSecurityList_SecurityReqID;
    f_DerivativeSecurityList_SecurityResponseID;
    f_DerivativeSecurityList_SecurityRequestResult;
    f_DerivativeSecurityList_TotNoRelatedSym;
    f_DerivativeSecurityList_LastFragment;
    } , msg ) |> check_unknown_tags;;

let parse_DerivativeSecurityListRequest msg = (
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_UnderlyingInstrument @@ fun msg f_DerivativeSecurityListRequest_UnderlyingInstrument ->
    req msg "320" parse_string @@ fun msg f_DerivativeSecurityListRequest_SecurityReqID ->
    req msg "559" parse_SecurityListRequestType @@ fun msg f_DerivativeSecurityListRequest_SecurityListRequestType ->
    opt msg "762" parse_string @@ fun msg f_DerivativeSecurityListRequest_SecuritySubType ->
    opt msg "15" parse_Currency @@ fun msg f_DerivativeSecurityListRequest_Currency ->
    opt msg "58" parse_string @@ fun msg f_DerivativeSecurityListRequest_Text ->
    opt msg "354" parse_int @@ fun msg f_DerivativeSecurityListRequest_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_DerivativeSecurityListRequest_EncodedText ->
    opt msg "336" parse_string @@ fun msg f_DerivativeSecurityListRequest_TradingSessionID ->
    opt msg "625" parse_string @@ fun msg f_DerivativeSecurityListRequest_TradingSessionSubID ->
    opt msg "263" parse_SubscriptionRequestType @@ fun msg f_DerivativeSecurityListRequest_SubscriptionRequestType ->
    ParseSuccess {
    f_DerivativeSecurityListRequest_UnderlyingInstrument;
    f_DerivativeSecurityListRequest_SecurityReqID;
    f_DerivativeSecurityListRequest_SecurityListRequestType;
    f_DerivativeSecurityListRequest_SecuritySubType;
    f_DerivativeSecurityListRequest_Currency;
    f_DerivativeSecurityListRequest_Text;
    f_DerivativeSecurityListRequest_EncodedTextLen;
    f_DerivativeSecurityListRequest_EncodedText;
    f_DerivativeSecurityListRequest_TradingSessionID;
    f_DerivativeSecurityListRequest_TradingSessionSubID;
    f_DerivativeSecurityListRequest_SubscriptionRequestType;
    } , msg ) |> check_unknown_tags;;

let parse_DontKnowTrade msg = (
    repeating msg "711" parse_UndInstrmtGrp @@ fun msg f_DontKnowTrade_UndInstrmtGrp ->
    repeating msg "555" parse_InstrmtLegGrp @@ fun msg f_DontKnowTrade_InstrmtLegGrp ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_DontKnowTrade_Instrument ->
    block msg  parse_OrderQtyData @@ fun msg f_DontKnowTrade_OrderQtyData ->
    req msg "37" parse_string @@ fun msg f_DontKnowTrade_OrderID ->
    opt msg "198" parse_string @@ fun msg f_DontKnowTrade_SecondaryOrderID ->
    req msg "17" parse_string @@ fun msg f_DontKnowTrade_ExecID ->
    req msg "127" parse_DKReason @@ fun msg f_DontKnowTrade_DKReason ->
    req msg "54" parse_Side @@ fun msg f_DontKnowTrade_Side ->
    opt msg "32" parse_float @@ fun msg f_DontKnowTrade_LastQty ->
    opt msg "31" parse_float @@ fun msg f_DontKnowTrade_LastPx ->
    opt msg "58" parse_string @@ fun msg f_DontKnowTrade_Text ->
    opt msg "354" parse_int @@ fun msg f_DontKnowTrade_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_DontKnowTrade_EncodedText ->
    ParseSuccess {
    f_DontKnowTrade_UndInstrmtGrp;
    f_DontKnowTrade_InstrmtLegGrp;
    f_DontKnowTrade_Instrument;
    f_DontKnowTrade_OrderQtyData;
    f_DontKnowTrade_OrderID;
    f_DontKnowTrade_SecondaryOrderID;
    f_DontKnowTrade_ExecID;
    f_DontKnowTrade_DKReason;
    f_DontKnowTrade_Side;
    f_DontKnowTrade_LastQty;
    f_DontKnowTrade_LastPx;
    f_DontKnowTrade_Text;
    f_DontKnowTrade_EncodedTextLen;
    f_DontKnowTrade_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_Email msg = (
    repeating msg "215" parse_RoutingGrp @@ fun msg f_Email_RoutingGrp ->
    repeating msg "146" parse_InstrmtGrp @@ fun msg f_Email_InstrmtGrp ->
    repeating msg "711" parse_UndInstrmtGrp @@ fun msg f_Email_UndInstrmtGrp ->
    repeating msg "555" parse_InstrmtLegGrp @@ fun msg f_Email_InstrmtLegGrp ->
    repeating msg "33" parse_LinesOfTextGrp @@ fun msg f_Email_LinesOfTextGrp ->
    check_duplicate_tags msg @@ fun () ->
    req msg "164" parse_string @@ fun msg f_Email_EmailThreadID ->
    req msg "94" parse_EmailType @@ fun msg f_Email_EmailType ->
    opt msg "42" parse_UTCTimestamp @@ fun msg f_Email_OrigTime ->
    req msg "147" parse_string @@ fun msg f_Email_Subject ->
    opt msg "356" parse_int @@ fun msg f_Email_EncodedSubjectLen ->
    opt msg "357" parse_string @@ fun msg f_Email_EncodedSubject ->
    opt msg "37" parse_string @@ fun msg f_Email_OrderID ->
    opt msg "11" parse_string @@ fun msg f_Email_ClOrdID ->
    opt msg "95" parse_int @@ fun msg f_Email_RawDataLength ->
    opt msg "96" parse_string @@ fun msg f_Email_RawData ->
    ParseSuccess {
    f_Email_RoutingGrp;
    f_Email_InstrmtGrp;
    f_Email_UndInstrmtGrp;
    f_Email_InstrmtLegGrp;
    f_Email_LinesOfTextGrp;
    f_Email_EmailThreadID;
    f_Email_EmailType;
    f_Email_OrigTime;
    f_Email_Subject;
    f_Email_EncodedSubjectLen;
    f_Email_EncodedSubject;
    f_Email_OrderID;
    f_Email_ClOrdID;
    f_Email_RawDataLength;
    f_Email_RawData;
    } , msg ) |> check_unknown_tags;;

let parse_ExecutionReport msg = (
    repeating msg "453" parse_Parties @@ fun msg f_ExecutionReport_Parties ->
    repeating msg "382" parse_ContraGrp @@ fun msg f_ExecutionReport_ContraGrp ->
    repeating msg "711" parse_UndInstrmtGrp @@ fun msg f_ExecutionReport_UndInstrmtGrp ->
    repeating msg "232" parse_Stipulations @@ fun msg f_ExecutionReport_Stipulations ->
    repeating msg "518" parse_ContAmtGrp @@ fun msg f_ExecutionReport_ContAmtGrp ->
    repeating msg "555" parse_InstrmtLegExecGrp @@ fun msg f_ExecutionReport_InstrmtLegExecGrp ->
    repeating msg "136" parse_MiscFeesGrp @@ fun msg f_ExecutionReport_MiscFeesGrp ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_ExecutionReport_Instrument ->
    block msg  parse_FinancingDetails @@ fun msg f_ExecutionReport_FinancingDetails ->
    block msg  parse_OrderQtyData @@ fun msg f_ExecutionReport_OrderQtyData ->
    block msg  parse_PegInstructions @@ fun msg f_ExecutionReport_PegInstructions ->
    block msg  parse_DiscretionInstructions @@ fun msg f_ExecutionReport_DiscretionInstructions ->
    block msg  parse_CommissionData @@ fun msg f_ExecutionReport_CommissionData ->
    block msg  parse_SpreadOrBenchmarkCurveData @@ fun msg f_ExecutionReport_SpreadOrBenchmarkCurveData ->
    block msg  parse_YieldData @@ fun msg f_ExecutionReport_YieldData ->
    req msg "37" parse_string @@ fun msg f_ExecutionReport_OrderID ->
    opt msg "198" parse_string @@ fun msg f_ExecutionReport_SecondaryOrderID ->
    opt msg "526" parse_string @@ fun msg f_ExecutionReport_SecondaryClOrdID ->
    opt msg "527" parse_string @@ fun msg f_ExecutionReport_SecondaryExecID ->
    opt msg "11" parse_string @@ fun msg f_ExecutionReport_ClOrdID ->
    opt msg "41" parse_string @@ fun msg f_ExecutionReport_OrigClOrdID ->
    opt msg "583" parse_string @@ fun msg f_ExecutionReport_ClOrdLinkID ->
    opt msg "693" parse_string @@ fun msg f_ExecutionReport_QuoteRespID ->
    opt msg "790" parse_string @@ fun msg f_ExecutionReport_OrdStatusReqID ->
    opt msg "584" parse_string @@ fun msg f_ExecutionReport_MassStatusReqID ->
    opt msg "911" parse_int @@ fun msg f_ExecutionReport_TotNumReports ->
    opt msg "912" parse_bool @@ fun msg f_ExecutionReport_LastRptRequested ->
    opt msg "229" parse_LocalMktDate @@ fun msg f_ExecutionReport_TradeOriginationDate ->
    opt msg "66" parse_string @@ fun msg f_ExecutionReport_ListID ->
    opt msg "548" parse_string @@ fun msg f_ExecutionReport_CrossID ->
    opt msg "551" parse_string @@ fun msg f_ExecutionReport_OrigCrossID ->
    opt msg "549" parse_CrossType @@ fun msg f_ExecutionReport_CrossType ->
    req msg "17" parse_string @@ fun msg f_ExecutionReport_ExecID ->
    opt msg "19" parse_string @@ fun msg f_ExecutionReport_ExecRefID ->
    req msg "150" parse_ExecType @@ fun msg f_ExecutionReport_ExecType ->
    req msg "39" parse_OrdStatus @@ fun msg f_ExecutionReport_OrdStatus ->
    opt msg "636" parse_WorkingIndicator @@ fun msg f_ExecutionReport_WorkingIndicator ->
    opt msg "103" parse_OrdRejReason @@ fun msg f_ExecutionReport_OrdRejReason ->
    opt msg "378" parse_ExecRestatementReason @@ fun msg f_ExecutionReport_ExecRestatementReason ->
    opt msg "1" parse_string @@ fun msg f_ExecutionReport_Account ->
    opt msg "660" parse_AcctIDSource @@ fun msg f_ExecutionReport_AcctIDSource ->
    opt msg "581" parse_AccountType @@ fun msg f_ExecutionReport_AccountType ->
    opt msg "589" parse_DayBookingInst @@ fun msg f_ExecutionReport_DayBookingInst ->
    opt msg "590" parse_BookingUnit @@ fun msg f_ExecutionReport_BookingUnit ->
    opt msg "591" parse_PreallocMethod @@ fun msg f_ExecutionReport_PreallocMethod ->
    opt msg "63" parse_SettlType @@ fun msg f_ExecutionReport_SettlType ->
    opt msg "64" parse_LocalMktDate @@ fun msg f_ExecutionReport_SettlDate ->
    opt msg "544" parse_CashMargin @@ fun msg f_ExecutionReport_CashMargin ->
    opt msg "635" parse_ClearingFeeIndicator @@ fun msg f_ExecutionReport_ClearingFeeIndicator ->
    req msg "54" parse_Side @@ fun msg f_ExecutionReport_Side ->
    opt msg "854" parse_QtyType @@ fun msg f_ExecutionReport_QtyType ->
    opt msg "40" parse_OrdType @@ fun msg f_ExecutionReport_OrdType ->
    opt msg "423" parse_PriceType @@ fun msg f_ExecutionReport_PriceType ->
    opt msg "44" parse_float @@ fun msg f_ExecutionReport_Price ->
    opt msg "99" parse_float @@ fun msg f_ExecutionReport_StopPx ->
    opt msg "839" parse_float @@ fun msg f_ExecutionReport_PeggedPrice ->
    opt msg "845" parse_float @@ fun msg f_ExecutionReport_DiscretionPrice ->
    opt msg "847" parse_TargetStrategy @@ fun msg f_ExecutionReport_TargetStrategy ->
    opt msg "848" parse_string @@ fun msg f_ExecutionReport_TargetStrategyParameters ->
    opt msg "849" parse_float @@ fun msg f_ExecutionReport_ParticipationRate ->
    opt msg "850" parse_float @@ fun msg f_ExecutionReport_TargetStrategyPerformance ->
    opt msg "15" parse_Currency @@ fun msg f_ExecutionReport_Currency ->
    opt msg "376" parse_string @@ fun msg f_ExecutionReport_ComplianceID ->
    opt msg "377" parse_SolicitedFlag @@ fun msg f_ExecutionReport_SolicitedFlag ->
    opt msg "59" parse_TimeInForce @@ fun msg f_ExecutionReport_TimeInForce ->
    opt msg "168" parse_UTCTimestamp @@ fun msg f_ExecutionReport_EffectiveTime ->
    opt msg "432" parse_LocalMktDate @@ fun msg f_ExecutionReport_ExpireDate ->
    opt msg "126" parse_UTCTimestamp @@ fun msg f_ExecutionReport_ExpireTime ->
    opt msg "18" parse_ExecInst @@ fun msg f_ExecutionReport_ExecInst ->
    opt msg "528" parse_OrderCapacity @@ fun msg f_ExecutionReport_OrderCapacity ->
    opt msg "529" parse_OrderRestrictions @@ fun msg f_ExecutionReport_OrderRestrictions ->
    opt msg "582" parse_CustOrderCapacity @@ fun msg f_ExecutionReport_CustOrderCapacity ->
    opt msg "32" parse_float @@ fun msg f_ExecutionReport_LastQty ->
    opt msg "652" parse_float @@ fun msg f_ExecutionReport_UnderlyingLastQty ->
    opt msg "31" parse_float @@ fun msg f_ExecutionReport_LastPx ->
    opt msg "651" parse_float @@ fun msg f_ExecutionReport_UnderlyingLastPx ->
    opt msg "669" parse_float @@ fun msg f_ExecutionReport_LastParPx ->
    opt msg "194" parse_float @@ fun msg f_ExecutionReport_LastSpotRate ->
    opt msg "195" parse_float @@ fun msg f_ExecutionReport_LastForwardPoints ->
    opt msg "30" parse_Exchange @@ fun msg f_ExecutionReport_LastMkt ->
    opt msg "336" parse_string @@ fun msg f_ExecutionReport_TradingSessionID ->
    opt msg "625" parse_string @@ fun msg f_ExecutionReport_TradingSessionSubID ->
    opt msg "943" parse_string @@ fun msg f_ExecutionReport_TimeBracket ->
    opt msg "29" parse_LastCapacity @@ fun msg f_ExecutionReport_LastCapacity ->
    req msg "151" parse_float @@ fun msg f_ExecutionReport_LeavesQty ->
    req msg "14" parse_float @@ fun msg f_ExecutionReport_CumQty ->
    req msg "6" parse_float @@ fun msg f_ExecutionReport_AvgPx ->
    opt msg "424" parse_float @@ fun msg f_ExecutionReport_DayOrderQty ->
    opt msg "425" parse_float @@ fun msg f_ExecutionReport_DayCumQty ->
    opt msg "426" parse_float @@ fun msg f_ExecutionReport_DayAvgPx ->
    opt msg "427" parse_GTBookingInst @@ fun msg f_ExecutionReport_GTBookingInst ->
    opt msg "75" parse_LocalMktDate @@ fun msg f_ExecutionReport_TradeDate ->
    opt msg "60" parse_UTCTimestamp @@ fun msg f_ExecutionReport_TransactTime ->
    opt msg "113" parse_ReportToExch @@ fun msg f_ExecutionReport_ReportToExch ->
    opt msg "381" parse_float @@ fun msg f_ExecutionReport_GrossTradeAmt ->
    opt msg "157" parse_int @@ fun msg f_ExecutionReport_NumDaysInterest ->
    opt msg "230" parse_LocalMktDate @@ fun msg f_ExecutionReport_ExDate ->
    opt msg "158" parse_float @@ fun msg f_ExecutionReport_AccruedInterestRate ->
    opt msg "159" parse_float @@ fun msg f_ExecutionReport_AccruedInterestAmt ->
    opt msg "738" parse_float @@ fun msg f_ExecutionReport_InterestAtMaturity ->
    opt msg "920" parse_float @@ fun msg f_ExecutionReport_EndAccruedInterestAmt ->
    opt msg "921" parse_float @@ fun msg f_ExecutionReport_StartCash ->
    opt msg "922" parse_float @@ fun msg f_ExecutionReport_EndCash ->
    opt msg "258" parse_TradedFlatSwitch @@ fun msg f_ExecutionReport_TradedFlatSwitch ->
    opt msg "259" parse_LocalMktDate @@ fun msg f_ExecutionReport_BasisFeatureDate ->
    opt msg "260" parse_float @@ fun msg f_ExecutionReport_BasisFeaturePrice ->
    opt msg "238" parse_float @@ fun msg f_ExecutionReport_Concession ->
    opt msg "237" parse_float @@ fun msg f_ExecutionReport_TotalTakedown ->
    opt msg "118" parse_float @@ fun msg f_ExecutionReport_NetMoney ->
    opt msg "119" parse_float @@ fun msg f_ExecutionReport_SettlCurrAmt ->
    opt msg "120" parse_Currency @@ fun msg f_ExecutionReport_SettlCurrency ->
    opt msg "155" parse_float @@ fun msg f_ExecutionReport_SettlCurrFxRate ->
    opt msg "156" parse_SettlCurrFxRateCalc @@ fun msg f_ExecutionReport_SettlCurrFxRateCalc ->
    opt msg "21" parse_HandlInst @@ fun msg f_ExecutionReport_HandlInst ->
    opt msg "110" parse_float @@ fun msg f_ExecutionReport_MinQty ->
    opt msg "111" parse_float @@ fun msg f_ExecutionReport_MaxFloor ->
    opt msg "77" parse_PositionEffect @@ fun msg f_ExecutionReport_PositionEffect ->
    opt msg "210" parse_float @@ fun msg f_ExecutionReport_MaxShow ->
    opt msg "775" parse_BookingType @@ fun msg f_ExecutionReport_BookingType ->
    opt msg "58" parse_string @@ fun msg f_ExecutionReport_Text ->
    opt msg "354" parse_int @@ fun msg f_ExecutionReport_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_ExecutionReport_EncodedText ->
    opt msg "193" parse_LocalMktDate @@ fun msg f_ExecutionReport_SettlDate2 ->
    opt msg "192" parse_float @@ fun msg f_ExecutionReport_OrderQty2 ->
    opt msg "641" parse_float @@ fun msg f_ExecutionReport_LastForwardPoints2 ->
    opt msg "442" parse_MultiLegReportingType @@ fun msg f_ExecutionReport_MultiLegReportingType ->
    opt msg "480" parse_CancellationRights @@ fun msg f_ExecutionReport_CancellationRights ->
    opt msg "481" parse_MoneyLaunderingStatus @@ fun msg f_ExecutionReport_MoneyLaunderingStatus ->
    opt msg "513" parse_string @@ fun msg f_ExecutionReport_RegistID ->
    opt msg "494" parse_string @@ fun msg f_ExecutionReport_Designation ->
    opt msg "483" parse_UTCTimestamp @@ fun msg f_ExecutionReport_TransBkdTime ->
    opt msg "515" parse_UTCTimestamp @@ fun msg f_ExecutionReport_ExecValuationPoint ->
    opt msg "484" parse_ExecPriceType @@ fun msg f_ExecutionReport_ExecPriceType ->
    opt msg "485" parse_float @@ fun msg f_ExecutionReport_ExecPriceAdjustment ->
    opt msg "638" parse_PriorityIndicator @@ fun msg f_ExecutionReport_PriorityIndicator ->
    opt msg "639" parse_float @@ fun msg f_ExecutionReport_PriceImprovement ->
    opt msg "851" parse_LastLiquidityInd @@ fun msg f_ExecutionReport_LastLiquidityInd ->
    opt msg "797" parse_bool @@ fun msg f_ExecutionReport_CopyMsgIndicator ->
    ParseSuccess {
    f_ExecutionReport_Parties;
    f_ExecutionReport_ContraGrp;
    f_ExecutionReport_UndInstrmtGrp;
    f_ExecutionReport_Stipulations;
    f_ExecutionReport_ContAmtGrp;
    f_ExecutionReport_InstrmtLegExecGrp;
    f_ExecutionReport_MiscFeesGrp;
    f_ExecutionReport_Instrument;
    f_ExecutionReport_FinancingDetails;
    f_ExecutionReport_OrderQtyData;
    f_ExecutionReport_PegInstructions;
    f_ExecutionReport_DiscretionInstructions;
    f_ExecutionReport_CommissionData;
    f_ExecutionReport_SpreadOrBenchmarkCurveData;
    f_ExecutionReport_YieldData;
    f_ExecutionReport_OrderID;
    f_ExecutionReport_SecondaryOrderID;
    f_ExecutionReport_SecondaryClOrdID;
    f_ExecutionReport_SecondaryExecID;
    f_ExecutionReport_ClOrdID;
    f_ExecutionReport_OrigClOrdID;
    f_ExecutionReport_ClOrdLinkID;
    f_ExecutionReport_QuoteRespID;
    f_ExecutionReport_OrdStatusReqID;
    f_ExecutionReport_MassStatusReqID;
    f_ExecutionReport_TotNumReports;
    f_ExecutionReport_LastRptRequested;
    f_ExecutionReport_TradeOriginationDate;
    f_ExecutionReport_ListID;
    f_ExecutionReport_CrossID;
    f_ExecutionReport_OrigCrossID;
    f_ExecutionReport_CrossType;
    f_ExecutionReport_ExecID;
    f_ExecutionReport_ExecRefID;
    f_ExecutionReport_ExecType;
    f_ExecutionReport_OrdStatus;
    f_ExecutionReport_WorkingIndicator;
    f_ExecutionReport_OrdRejReason;
    f_ExecutionReport_ExecRestatementReason;
    f_ExecutionReport_Account;
    f_ExecutionReport_AcctIDSource;
    f_ExecutionReport_AccountType;
    f_ExecutionReport_DayBookingInst;
    f_ExecutionReport_BookingUnit;
    f_ExecutionReport_PreallocMethod;
    f_ExecutionReport_SettlType;
    f_ExecutionReport_SettlDate;
    f_ExecutionReport_CashMargin;
    f_ExecutionReport_ClearingFeeIndicator;
    f_ExecutionReport_Side;
    f_ExecutionReport_QtyType;
    f_ExecutionReport_OrdType;
    f_ExecutionReport_PriceType;
    f_ExecutionReport_Price;
    f_ExecutionReport_StopPx;
    f_ExecutionReport_PeggedPrice;
    f_ExecutionReport_DiscretionPrice;
    f_ExecutionReport_TargetStrategy;
    f_ExecutionReport_TargetStrategyParameters;
    f_ExecutionReport_ParticipationRate;
    f_ExecutionReport_TargetStrategyPerformance;
    f_ExecutionReport_Currency;
    f_ExecutionReport_ComplianceID;
    f_ExecutionReport_SolicitedFlag;
    f_ExecutionReport_TimeInForce;
    f_ExecutionReport_EffectiveTime;
    f_ExecutionReport_ExpireDate;
    f_ExecutionReport_ExpireTime;
    f_ExecutionReport_ExecInst;
    f_ExecutionReport_OrderCapacity;
    f_ExecutionReport_OrderRestrictions;
    f_ExecutionReport_CustOrderCapacity;
    f_ExecutionReport_LastQty;
    f_ExecutionReport_UnderlyingLastQty;
    f_ExecutionReport_LastPx;
    f_ExecutionReport_UnderlyingLastPx;
    f_ExecutionReport_LastParPx;
    f_ExecutionReport_LastSpotRate;
    f_ExecutionReport_LastForwardPoints;
    f_ExecutionReport_LastMkt;
    f_ExecutionReport_TradingSessionID;
    f_ExecutionReport_TradingSessionSubID;
    f_ExecutionReport_TimeBracket;
    f_ExecutionReport_LastCapacity;
    f_ExecutionReport_LeavesQty;
    f_ExecutionReport_CumQty;
    f_ExecutionReport_AvgPx;
    f_ExecutionReport_DayOrderQty;
    f_ExecutionReport_DayCumQty;
    f_ExecutionReport_DayAvgPx;
    f_ExecutionReport_GTBookingInst;
    f_ExecutionReport_TradeDate;
    f_ExecutionReport_TransactTime;
    f_ExecutionReport_ReportToExch;
    f_ExecutionReport_GrossTradeAmt;
    f_ExecutionReport_NumDaysInterest;
    f_ExecutionReport_ExDate;
    f_ExecutionReport_AccruedInterestRate;
    f_ExecutionReport_AccruedInterestAmt;
    f_ExecutionReport_InterestAtMaturity;
    f_ExecutionReport_EndAccruedInterestAmt;
    f_ExecutionReport_StartCash;
    f_ExecutionReport_EndCash;
    f_ExecutionReport_TradedFlatSwitch;
    f_ExecutionReport_BasisFeatureDate;
    f_ExecutionReport_BasisFeaturePrice;
    f_ExecutionReport_Concession;
    f_ExecutionReport_TotalTakedown;
    f_ExecutionReport_NetMoney;
    f_ExecutionReport_SettlCurrAmt;
    f_ExecutionReport_SettlCurrency;
    f_ExecutionReport_SettlCurrFxRate;
    f_ExecutionReport_SettlCurrFxRateCalc;
    f_ExecutionReport_HandlInst;
    f_ExecutionReport_MinQty;
    f_ExecutionReport_MaxFloor;
    f_ExecutionReport_PositionEffect;
    f_ExecutionReport_MaxShow;
    f_ExecutionReport_BookingType;
    f_ExecutionReport_Text;
    f_ExecutionReport_EncodedTextLen;
    f_ExecutionReport_EncodedText;
    f_ExecutionReport_SettlDate2;
    f_ExecutionReport_OrderQty2;
    f_ExecutionReport_LastForwardPoints2;
    f_ExecutionReport_MultiLegReportingType;
    f_ExecutionReport_CancellationRights;
    f_ExecutionReport_MoneyLaunderingStatus;
    f_ExecutionReport_RegistID;
    f_ExecutionReport_Designation;
    f_ExecutionReport_TransBkdTime;
    f_ExecutionReport_ExecValuationPoint;
    f_ExecutionReport_ExecPriceType;
    f_ExecutionReport_ExecPriceAdjustment;
    f_ExecutionReport_PriorityIndicator;
    f_ExecutionReport_PriceImprovement;
    f_ExecutionReport_LastLiquidityInd;
    f_ExecutionReport_CopyMsgIndicator;
    } , msg ) |> check_unknown_tags;;

let parse_IOI msg = (
    repeating msg "711" parse_UndInstrmtGrp @@ fun msg f_IOI_UndInstrmtGrp ->
    repeating msg "232" parse_Stipulations @@ fun msg f_IOI_Stipulations ->
    repeating msg "555" parse_InstrmtLegIOIGrp @@ fun msg f_IOI_InstrmtLegIOIGrp ->
    repeating msg "199" parse_IOIQualGrp @@ fun msg f_IOI_IOIQualGrp ->
    repeating msg "215" parse_RoutingGrp @@ fun msg f_IOI_RoutingGrp ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_IOI_Instrument ->
    block msg  parse_FinancingDetails @@ fun msg f_IOI_FinancingDetails ->
    block msg  parse_OrderQtyData @@ fun msg f_IOI_OrderQtyData ->
    block msg  parse_SpreadOrBenchmarkCurveData @@ fun msg f_IOI_SpreadOrBenchmarkCurveData ->
    block msg  parse_YieldData @@ fun msg f_IOI_YieldData ->
    req msg "23" parse_string @@ fun msg f_IOI_IOIID ->
    req msg "28" parse_IOITransType @@ fun msg f_IOI_IOITransType ->
    opt msg "26" parse_string @@ fun msg f_IOI_IOIRefID ->
    req msg "54" parse_Side @@ fun msg f_IOI_Side ->
    opt msg "854" parse_QtyType @@ fun msg f_IOI_QtyType ->
    req msg "27" parse_IOIQty @@ fun msg f_IOI_IOIQty ->
    opt msg "15" parse_Currency @@ fun msg f_IOI_Currency ->
    opt msg "423" parse_PriceType @@ fun msg f_IOI_PriceType ->
    opt msg "44" parse_float @@ fun msg f_IOI_Price ->
    opt msg "62" parse_UTCTimestamp @@ fun msg f_IOI_ValidUntilTime ->
    opt msg "25" parse_IOIQltyInd @@ fun msg f_IOI_IOIQltyInd ->
    opt msg "130" parse_IOINaturalFlag @@ fun msg f_IOI_IOINaturalFlag ->
    opt msg "58" parse_string @@ fun msg f_IOI_Text ->
    opt msg "354" parse_int @@ fun msg f_IOI_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_IOI_EncodedText ->
    opt msg "60" parse_UTCTimestamp @@ fun msg f_IOI_TransactTime ->
    opt msg "149" parse_string @@ fun msg f_IOI_URLLink ->
    ParseSuccess {
    f_IOI_UndInstrmtGrp;
    f_IOI_Stipulations;
    f_IOI_InstrmtLegIOIGrp;
    f_IOI_IOIQualGrp;
    f_IOI_RoutingGrp;
    f_IOI_Instrument;
    f_IOI_FinancingDetails;
    f_IOI_OrderQtyData;
    f_IOI_SpreadOrBenchmarkCurveData;
    f_IOI_YieldData;
    f_IOI_IOIID;
    f_IOI_IOITransType;
    f_IOI_IOIRefID;
    f_IOI_Side;
    f_IOI_QtyType;
    f_IOI_IOIQty;
    f_IOI_Currency;
    f_IOI_PriceType;
    f_IOI_Price;
    f_IOI_ValidUntilTime;
    f_IOI_IOIQltyInd;
    f_IOI_IOINaturalFlag;
    f_IOI_Text;
    f_IOI_EncodedTextLen;
    f_IOI_EncodedText;
    f_IOI_TransactTime;
    f_IOI_URLLink;
    } , msg ) |> check_unknown_tags;;

let parse_ListCancelRequest msg = (
    check_duplicate_tags msg @@ fun () ->
    req msg "66" parse_string @@ fun msg f_ListCancelRequest_ListID ->
    req msg "60" parse_UTCTimestamp @@ fun msg f_ListCancelRequest_TransactTime ->
    opt msg "229" parse_LocalMktDate @@ fun msg f_ListCancelRequest_TradeOriginationDate ->
    opt msg "75" parse_LocalMktDate @@ fun msg f_ListCancelRequest_TradeDate ->
    opt msg "58" parse_string @@ fun msg f_ListCancelRequest_Text ->
    opt msg "354" parse_int @@ fun msg f_ListCancelRequest_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_ListCancelRequest_EncodedText ->
    ParseSuccess {
    f_ListCancelRequest_ListID;
    f_ListCancelRequest_TransactTime;
    f_ListCancelRequest_TradeOriginationDate;
    f_ListCancelRequest_TradeDate;
    f_ListCancelRequest_Text;
    f_ListCancelRequest_EncodedTextLen;
    f_ListCancelRequest_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_ListExecute msg = (
    check_duplicate_tags msg @@ fun () ->
    req msg "66" parse_string @@ fun msg f_ListExecute_ListID ->
    opt msg "391" parse_string @@ fun msg f_ListExecute_ClientBidID ->
    opt msg "390" parse_string @@ fun msg f_ListExecute_BidID ->
    req msg "60" parse_UTCTimestamp @@ fun msg f_ListExecute_TransactTime ->
    opt msg "58" parse_string @@ fun msg f_ListExecute_Text ->
    opt msg "354" parse_int @@ fun msg f_ListExecute_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_ListExecute_EncodedText ->
    ParseSuccess {
    f_ListExecute_ListID;
    f_ListExecute_ClientBidID;
    f_ListExecute_BidID;
    f_ListExecute_TransactTime;
    f_ListExecute_Text;
    f_ListExecute_EncodedTextLen;
    f_ListExecute_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_ListStatus msg = (
    repeating msg "73" parse_OrdListStatGrp @@ fun msg f_ListStatus_OrdListStatGrp ->
    check_duplicate_tags msg @@ fun () ->
    req msg "66" parse_string @@ fun msg f_ListStatus_ListID ->
    req msg "429" parse_ListStatusType @@ fun msg f_ListStatus_ListStatusType ->
    req msg "82" parse_int @@ fun msg f_ListStatus_NoRpts ->
    req msg "431" parse_ListOrderStatus @@ fun msg f_ListStatus_ListOrderStatus ->
    req msg "83" parse_int @@ fun msg f_ListStatus_RptSeq ->
    opt msg "444" parse_string @@ fun msg f_ListStatus_ListStatusText ->
    opt msg "445" parse_int @@ fun msg f_ListStatus_EncodedListStatusTextLen ->
    opt msg "446" parse_string @@ fun msg f_ListStatus_EncodedListStatusText ->
    opt msg "60" parse_UTCTimestamp @@ fun msg f_ListStatus_TransactTime ->
    req msg "68" parse_int @@ fun msg f_ListStatus_TotNoOrders ->
    opt msg "893" parse_LastFragment @@ fun msg f_ListStatus_LastFragment ->
    ParseSuccess {
    f_ListStatus_OrdListStatGrp;
    f_ListStatus_ListID;
    f_ListStatus_ListStatusType;
    f_ListStatus_NoRpts;
    f_ListStatus_ListOrderStatus;
    f_ListStatus_RptSeq;
    f_ListStatus_ListStatusText;
    f_ListStatus_EncodedListStatusTextLen;
    f_ListStatus_EncodedListStatusText;
    f_ListStatus_TransactTime;
    f_ListStatus_TotNoOrders;
    f_ListStatus_LastFragment;
    } , msg ) |> check_unknown_tags;;

let parse_ListStatusRequest msg = (
    check_duplicate_tags msg @@ fun () ->
    req msg "66" parse_string @@ fun msg f_ListStatusRequest_ListID ->
    opt msg "58" parse_string @@ fun msg f_ListStatusRequest_Text ->
    opt msg "354" parse_int @@ fun msg f_ListStatusRequest_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_ListStatusRequest_EncodedText ->
    ParseSuccess {
    f_ListStatusRequest_ListID;
    f_ListStatusRequest_Text;
    f_ListStatusRequest_EncodedTextLen;
    f_ListStatusRequest_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_ListStrikePrice msg = (
    repeating msg "428" parse_InstrmtStrkPxGrp @@ fun msg f_ListStrikePrice_InstrmtStrkPxGrp ->
    repeating msg "711" parse_UndInstrmtStrkPxGrp @@ fun msg f_ListStrikePrice_UndInstrmtStrkPxGrp ->
    check_duplicate_tags msg @@ fun () ->
    req msg "66" parse_string @@ fun msg f_ListStrikePrice_ListID ->
    req msg "422" parse_int @@ fun msg f_ListStrikePrice_TotNoStrikes ->
    opt msg "893" parse_LastFragment @@ fun msg f_ListStrikePrice_LastFragment ->
    ParseSuccess {
    f_ListStrikePrice_InstrmtStrkPxGrp;
    f_ListStrikePrice_UndInstrmtStrkPxGrp;
    f_ListStrikePrice_ListID;
    f_ListStrikePrice_TotNoStrikes;
    f_ListStrikePrice_LastFragment;
    } , msg ) |> check_unknown_tags;;

let parse_MarketDataIncrementalRefresh msg = (
    repeating msg "268" parse_MDIncGrp @@ fun msg f_MarketDataIncrementalRefresh_MDIncGrp ->
    check_duplicate_tags msg @@ fun () ->
    opt msg "262" parse_string @@ fun msg f_MarketDataIncrementalRefresh_MDReqID ->
    opt msg "813" parse_int @@ fun msg f_MarketDataIncrementalRefresh_ApplQueueDepth ->
    opt msg "814" parse_ApplQueueResolution @@ fun msg f_MarketDataIncrementalRefresh_ApplQueueResolution ->
    ParseSuccess {
    f_MarketDataIncrementalRefresh_MDIncGrp;
    f_MarketDataIncrementalRefresh_MDReqID;
    f_MarketDataIncrementalRefresh_ApplQueueDepth;
    f_MarketDataIncrementalRefresh_ApplQueueResolution;
    } , msg ) |> check_unknown_tags;;

let parse_MarketDataRequest msg = (
    repeating msg "267" parse_MDReqGrp @@ fun msg f_MarketDataRequest_MDReqGrp ->
    repeating msg "146" parse_InstrmtMDReqGrp @@ fun msg f_MarketDataRequest_InstrmtMDReqGrp ->
    repeating msg "386" parse_TrdgSesGrp @@ fun msg f_MarketDataRequest_TrdgSesGrp ->
    check_duplicate_tags msg @@ fun () ->
    req msg "262" parse_string @@ fun msg f_MarketDataRequest_MDReqID ->
    req msg "263" parse_SubscriptionRequestType @@ fun msg f_MarketDataRequest_SubscriptionRequestType ->
    req msg "264" parse_int @@ fun msg f_MarketDataRequest_MarketDepth ->
    opt msg "265" parse_MDUpdateType @@ fun msg f_MarketDataRequest_MDUpdateType ->
    opt msg "266" parse_AggregatedBook @@ fun msg f_MarketDataRequest_AggregatedBook ->
    opt msg "286" parse_OpenCloseSettlFlag @@ fun msg f_MarketDataRequest_OpenCloseSettlFlag ->
    opt msg "546" parse_Scope @@ fun msg f_MarketDataRequest_Scope ->
    opt msg "547" parse_MDImplicitDelete @@ fun msg f_MarketDataRequest_MDImplicitDelete ->
    opt msg "815" parse_ApplQueueAction @@ fun msg f_MarketDataRequest_ApplQueueAction ->
    opt msg "812" parse_int @@ fun msg f_MarketDataRequest_ApplQueueMax ->
    ParseSuccess {
    f_MarketDataRequest_MDReqGrp;
    f_MarketDataRequest_InstrmtMDReqGrp;
    f_MarketDataRequest_TrdgSesGrp;
    f_MarketDataRequest_MDReqID;
    f_MarketDataRequest_SubscriptionRequestType;
    f_MarketDataRequest_MarketDepth;
    f_MarketDataRequest_MDUpdateType;
    f_MarketDataRequest_AggregatedBook;
    f_MarketDataRequest_OpenCloseSettlFlag;
    f_MarketDataRequest_Scope;
    f_MarketDataRequest_MDImplicitDelete;
    f_MarketDataRequest_ApplQueueAction;
    f_MarketDataRequest_ApplQueueMax;
    } , msg ) |> check_unknown_tags;;

let parse_MarketDataRequestReject msg = (
    repeating msg "816" parse_MDRjctGrp @@ fun msg f_MarketDataRequestReject_MDRjctGrp ->
    check_duplicate_tags msg @@ fun () ->
    req msg "262" parse_string @@ fun msg f_MarketDataRequestReject_MDReqID ->
    opt msg "281" parse_MDReqRejReason @@ fun msg f_MarketDataRequestReject_MDReqRejReason ->
    opt msg "58" parse_string @@ fun msg f_MarketDataRequestReject_Text ->
    opt msg "354" parse_int @@ fun msg f_MarketDataRequestReject_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_MarketDataRequestReject_EncodedText ->
    ParseSuccess {
    f_MarketDataRequestReject_MDRjctGrp;
    f_MarketDataRequestReject_MDReqID;
    f_MarketDataRequestReject_MDReqRejReason;
    f_MarketDataRequestReject_Text;
    f_MarketDataRequestReject_EncodedTextLen;
    f_MarketDataRequestReject_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_MarketDataSnapshotFullRefresh msg = (
    repeating msg "711" parse_UndInstrmtGrp @@ fun msg f_MarketDataSnapshotFullRefresh_UndInstrmtGrp ->
    repeating msg "555" parse_InstrmtLegGrp @@ fun msg f_MarketDataSnapshotFullRefresh_InstrmtLegGrp ->
    repeating msg "268" parse_MDFullGrp @@ fun msg f_MarketDataSnapshotFullRefresh_MDFullGrp ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_MarketDataSnapshotFullRefresh_Instrument ->
    opt msg "262" parse_string @@ fun msg f_MarketDataSnapshotFullRefresh_MDReqID ->
    opt msg "291" parse_FinancialStatus @@ fun msg f_MarketDataSnapshotFullRefresh_FinancialStatus ->
    opt msg "292" parse_CorporateAction @@ fun msg f_MarketDataSnapshotFullRefresh_CorporateAction ->
    opt msg "451" parse_float @@ fun msg f_MarketDataSnapshotFullRefresh_NetChgPrevDay ->
    opt msg "813" parse_int @@ fun msg f_MarketDataSnapshotFullRefresh_ApplQueueDepth ->
    opt msg "814" parse_ApplQueueResolution @@ fun msg f_MarketDataSnapshotFullRefresh_ApplQueueResolution ->
    ParseSuccess {
    f_MarketDataSnapshotFullRefresh_UndInstrmtGrp;
    f_MarketDataSnapshotFullRefresh_InstrmtLegGrp;
    f_MarketDataSnapshotFullRefresh_MDFullGrp;
    f_MarketDataSnapshotFullRefresh_Instrument;
    f_MarketDataSnapshotFullRefresh_MDReqID;
    f_MarketDataSnapshotFullRefresh_FinancialStatus;
    f_MarketDataSnapshotFullRefresh_CorporateAction;
    f_MarketDataSnapshotFullRefresh_NetChgPrevDay;
    f_MarketDataSnapshotFullRefresh_ApplQueueDepth;
    f_MarketDataSnapshotFullRefresh_ApplQueueResolution;
    } , msg ) |> check_unknown_tags;;

let parse_MassQuote msg = (
    repeating msg "453" parse_Parties @@ fun msg f_MassQuote_Parties ->
    repeating msg "296" parse_QuotSetGrp @@ fun msg f_MassQuote_QuotSetGrp ->
    check_duplicate_tags msg @@ fun () ->
    opt msg "131" parse_string @@ fun msg f_MassQuote_QuoteReqID ->
    req msg "117" parse_string @@ fun msg f_MassQuote_QuoteID ->
    opt msg "537" parse_QuoteType @@ fun msg f_MassQuote_QuoteType ->
    opt msg "301" parse_QuoteResponseLevel @@ fun msg f_MassQuote_QuoteResponseLevel ->
    opt msg "1" parse_string @@ fun msg f_MassQuote_Account ->
    opt msg "660" parse_AcctIDSource @@ fun msg f_MassQuote_AcctIDSource ->
    opt msg "581" parse_AccountType @@ fun msg f_MassQuote_AccountType ->
    opt msg "293" parse_float @@ fun msg f_MassQuote_DefBidSize ->
    opt msg "294" parse_float @@ fun msg f_MassQuote_DefOfferSize ->
    ParseSuccess {
    f_MassQuote_Parties;
    f_MassQuote_QuotSetGrp;
    f_MassQuote_QuoteReqID;
    f_MassQuote_QuoteID;
    f_MassQuote_QuoteType;
    f_MassQuote_QuoteResponseLevel;
    f_MassQuote_Account;
    f_MassQuote_AcctIDSource;
    f_MassQuote_AccountType;
    f_MassQuote_DefBidSize;
    f_MassQuote_DefOfferSize;
    } , msg ) |> check_unknown_tags;;

let parse_MassQuoteAcknowledgement msg = (
    repeating msg "453" parse_Parties @@ fun msg f_MassQuoteAcknowledgement_Parties ->
    repeating msg "296" parse_QuotSetAckGrp @@ fun msg f_MassQuoteAcknowledgement_QuotSetAckGrp ->
    check_duplicate_tags msg @@ fun () ->
    opt msg "131" parse_string @@ fun msg f_MassQuoteAcknowledgement_QuoteReqID ->
    opt msg "117" parse_string @@ fun msg f_MassQuoteAcknowledgement_QuoteID ->
    req msg "297" parse_QuoteStatus @@ fun msg f_MassQuoteAcknowledgement_QuoteStatus ->
    opt msg "300" parse_QuoteRejectReason @@ fun msg f_MassQuoteAcknowledgement_QuoteRejectReason ->
    opt msg "301" parse_QuoteResponseLevel @@ fun msg f_MassQuoteAcknowledgement_QuoteResponseLevel ->
    opt msg "537" parse_QuoteType @@ fun msg f_MassQuoteAcknowledgement_QuoteType ->
    opt msg "1" parse_string @@ fun msg f_MassQuoteAcknowledgement_Account ->
    opt msg "660" parse_AcctIDSource @@ fun msg f_MassQuoteAcknowledgement_AcctIDSource ->
    opt msg "581" parse_AccountType @@ fun msg f_MassQuoteAcknowledgement_AccountType ->
    opt msg "58" parse_string @@ fun msg f_MassQuoteAcknowledgement_Text ->
    opt msg "354" parse_int @@ fun msg f_MassQuoteAcknowledgement_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_MassQuoteAcknowledgement_EncodedText ->
    ParseSuccess {
    f_MassQuoteAcknowledgement_Parties;
    f_MassQuoteAcknowledgement_QuotSetAckGrp;
    f_MassQuoteAcknowledgement_QuoteReqID;
    f_MassQuoteAcknowledgement_QuoteID;
    f_MassQuoteAcknowledgement_QuoteStatus;
    f_MassQuoteAcknowledgement_QuoteRejectReason;
    f_MassQuoteAcknowledgement_QuoteResponseLevel;
    f_MassQuoteAcknowledgement_QuoteType;
    f_MassQuoteAcknowledgement_Account;
    f_MassQuoteAcknowledgement_AcctIDSource;
    f_MassQuoteAcknowledgement_AccountType;
    f_MassQuoteAcknowledgement_Text;
    f_MassQuoteAcknowledgement_EncodedTextLen;
    f_MassQuoteAcknowledgement_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_MultilegOrderCancelReplace msg = (
    repeating msg "453" parse_Parties @@ fun msg f_MultilegOrderCancelReplace_Parties ->
    repeating msg "78" parse_PreAllocMlegGrp @@ fun msg f_MultilegOrderCancelReplace_PreAllocMlegGrp ->
    repeating msg "386" parse_TrdgSesGrp @@ fun msg f_MultilegOrderCancelReplace_TrdgSesGrp ->
    repeating msg "711" parse_UndInstrmtGrp @@ fun msg f_MultilegOrderCancelReplace_UndInstrmtGrp ->
    repeating msg "555" parse_LegOrdGrp @@ fun msg f_MultilegOrderCancelReplace_LegOrdGrp ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_MultilegOrderCancelReplace_Instrument ->
    block msg  parse_OrderQtyData @@ fun msg f_MultilegOrderCancelReplace_OrderQtyData ->
    block msg  parse_CommissionData @@ fun msg f_MultilegOrderCancelReplace_CommissionData ->
    block msg  parse_PegInstructions @@ fun msg f_MultilegOrderCancelReplace_PegInstructions ->
    block msg  parse_DiscretionInstructions @@ fun msg f_MultilegOrderCancelReplace_DiscretionInstructions ->
    opt msg "37" parse_string @@ fun msg f_MultilegOrderCancelReplace_OrderID ->
    req msg "41" parse_string @@ fun msg f_MultilegOrderCancelReplace_OrigClOrdID ->
    req msg "11" parse_string @@ fun msg f_MultilegOrderCancelReplace_ClOrdID ->
    opt msg "526" parse_string @@ fun msg f_MultilegOrderCancelReplace_SecondaryClOrdID ->
    opt msg "583" parse_string @@ fun msg f_MultilegOrderCancelReplace_ClOrdLinkID ->
    opt msg "586" parse_UTCTimestamp @@ fun msg f_MultilegOrderCancelReplace_OrigOrdModTime ->
    opt msg "229" parse_LocalMktDate @@ fun msg f_MultilegOrderCancelReplace_TradeOriginationDate ->
    opt msg "75" parse_LocalMktDate @@ fun msg f_MultilegOrderCancelReplace_TradeDate ->
    opt msg "1" parse_string @@ fun msg f_MultilegOrderCancelReplace_Account ->
    opt msg "660" parse_AcctIDSource @@ fun msg f_MultilegOrderCancelReplace_AcctIDSource ->
    opt msg "581" parse_AccountType @@ fun msg f_MultilegOrderCancelReplace_AccountType ->
    opt msg "589" parse_DayBookingInst @@ fun msg f_MultilegOrderCancelReplace_DayBookingInst ->
    opt msg "590" parse_BookingUnit @@ fun msg f_MultilegOrderCancelReplace_BookingUnit ->
    opt msg "591" parse_PreallocMethod @@ fun msg f_MultilegOrderCancelReplace_PreallocMethod ->
    opt msg "70" parse_string @@ fun msg f_MultilegOrderCancelReplace_AllocID ->
    opt msg "63" parse_SettlType @@ fun msg f_MultilegOrderCancelReplace_SettlType ->
    opt msg "64" parse_LocalMktDate @@ fun msg f_MultilegOrderCancelReplace_SettlDate ->
    opt msg "544" parse_CashMargin @@ fun msg f_MultilegOrderCancelReplace_CashMargin ->
    opt msg "635" parse_ClearingFeeIndicator @@ fun msg f_MultilegOrderCancelReplace_ClearingFeeIndicator ->
    opt msg "21" parse_HandlInst @@ fun msg f_MultilegOrderCancelReplace_HandlInst ->
    opt msg "18" parse_ExecInst @@ fun msg f_MultilegOrderCancelReplace_ExecInst ->
    opt msg "110" parse_float @@ fun msg f_MultilegOrderCancelReplace_MinQty ->
    opt msg "111" parse_float @@ fun msg f_MultilegOrderCancelReplace_MaxFloor ->
    opt msg "100" parse_Exchange @@ fun msg f_MultilegOrderCancelReplace_ExDestination ->
    opt msg "81" parse_ProcessCode @@ fun msg f_MultilegOrderCancelReplace_ProcessCode ->
    req msg "54" parse_Side @@ fun msg f_MultilegOrderCancelReplace_Side ->
    opt msg "140" parse_float @@ fun msg f_MultilegOrderCancelReplace_PrevClosePx ->
    opt msg "114" parse_LocateReqd @@ fun msg f_MultilegOrderCancelReplace_LocateReqd ->
    req msg "60" parse_UTCTimestamp @@ fun msg f_MultilegOrderCancelReplace_TransactTime ->
    opt msg "854" parse_QtyType @@ fun msg f_MultilegOrderCancelReplace_QtyType ->
    req msg "40" parse_OrdType @@ fun msg f_MultilegOrderCancelReplace_OrdType ->
    opt msg "423" parse_PriceType @@ fun msg f_MultilegOrderCancelReplace_PriceType ->
    opt msg "44" parse_float @@ fun msg f_MultilegOrderCancelReplace_Price ->
    opt msg "99" parse_float @@ fun msg f_MultilegOrderCancelReplace_StopPx ->
    opt msg "15" parse_Currency @@ fun msg f_MultilegOrderCancelReplace_Currency ->
    opt msg "376" parse_string @@ fun msg f_MultilegOrderCancelReplace_ComplianceID ->
    opt msg "377" parse_SolicitedFlag @@ fun msg f_MultilegOrderCancelReplace_SolicitedFlag ->
    opt msg "23" parse_string @@ fun msg f_MultilegOrderCancelReplace_IOIID ->
    opt msg "117" parse_string @@ fun msg f_MultilegOrderCancelReplace_QuoteID ->
    opt msg "59" parse_TimeInForce @@ fun msg f_MultilegOrderCancelReplace_TimeInForce ->
    opt msg "168" parse_UTCTimestamp @@ fun msg f_MultilegOrderCancelReplace_EffectiveTime ->
    opt msg "432" parse_LocalMktDate @@ fun msg f_MultilegOrderCancelReplace_ExpireDate ->
    opt msg "126" parse_UTCTimestamp @@ fun msg f_MultilegOrderCancelReplace_ExpireTime ->
    opt msg "427" parse_GTBookingInst @@ fun msg f_MultilegOrderCancelReplace_GTBookingInst ->
    opt msg "528" parse_OrderCapacity @@ fun msg f_MultilegOrderCancelReplace_OrderCapacity ->
    opt msg "529" parse_OrderRestrictions @@ fun msg f_MultilegOrderCancelReplace_OrderRestrictions ->
    opt msg "582" parse_CustOrderCapacity @@ fun msg f_MultilegOrderCancelReplace_CustOrderCapacity ->
    opt msg "121" parse_ForexReq @@ fun msg f_MultilegOrderCancelReplace_ForexReq ->
    opt msg "120" parse_Currency @@ fun msg f_MultilegOrderCancelReplace_SettlCurrency ->
    opt msg "775" parse_BookingType @@ fun msg f_MultilegOrderCancelReplace_BookingType ->
    opt msg "58" parse_string @@ fun msg f_MultilegOrderCancelReplace_Text ->
    opt msg "354" parse_int @@ fun msg f_MultilegOrderCancelReplace_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_MultilegOrderCancelReplace_EncodedText ->
    opt msg "77" parse_PositionEffect @@ fun msg f_MultilegOrderCancelReplace_PositionEffect ->
    opt msg "203" parse_CoveredOrUncovered @@ fun msg f_MultilegOrderCancelReplace_CoveredOrUncovered ->
    opt msg "210" parse_float @@ fun msg f_MultilegOrderCancelReplace_MaxShow ->
    opt msg "847" parse_TargetStrategy @@ fun msg f_MultilegOrderCancelReplace_TargetStrategy ->
    opt msg "848" parse_string @@ fun msg f_MultilegOrderCancelReplace_TargetStrategyParameters ->
    opt msg "849" parse_float @@ fun msg f_MultilegOrderCancelReplace_ParticipationRate ->
    opt msg "480" parse_CancellationRights @@ fun msg f_MultilegOrderCancelReplace_CancellationRights ->
    opt msg "481" parse_MoneyLaunderingStatus @@ fun msg f_MultilegOrderCancelReplace_MoneyLaunderingStatus ->
    opt msg "513" parse_string @@ fun msg f_MultilegOrderCancelReplace_RegistID ->
    opt msg "494" parse_string @@ fun msg f_MultilegOrderCancelReplace_Designation ->
    opt msg "563" parse_MultiLegRptTypeReq @@ fun msg f_MultilegOrderCancelReplace_MultiLegRptTypeReq ->
    ParseSuccess {
    f_MultilegOrderCancelReplace_Parties;
    f_MultilegOrderCancelReplace_PreAllocMlegGrp;
    f_MultilegOrderCancelReplace_TrdgSesGrp;
    f_MultilegOrderCancelReplace_UndInstrmtGrp;
    f_MultilegOrderCancelReplace_LegOrdGrp;
    f_MultilegOrderCancelReplace_Instrument;
    f_MultilegOrderCancelReplace_OrderQtyData;
    f_MultilegOrderCancelReplace_CommissionData;
    f_MultilegOrderCancelReplace_PegInstructions;
    f_MultilegOrderCancelReplace_DiscretionInstructions;
    f_MultilegOrderCancelReplace_OrderID;
    f_MultilegOrderCancelReplace_OrigClOrdID;
    f_MultilegOrderCancelReplace_ClOrdID;
    f_MultilegOrderCancelReplace_SecondaryClOrdID;
    f_MultilegOrderCancelReplace_ClOrdLinkID;
    f_MultilegOrderCancelReplace_OrigOrdModTime;
    f_MultilegOrderCancelReplace_TradeOriginationDate;
    f_MultilegOrderCancelReplace_TradeDate;
    f_MultilegOrderCancelReplace_Account;
    f_MultilegOrderCancelReplace_AcctIDSource;
    f_MultilegOrderCancelReplace_AccountType;
    f_MultilegOrderCancelReplace_DayBookingInst;
    f_MultilegOrderCancelReplace_BookingUnit;
    f_MultilegOrderCancelReplace_PreallocMethod;
    f_MultilegOrderCancelReplace_AllocID;
    f_MultilegOrderCancelReplace_SettlType;
    f_MultilegOrderCancelReplace_SettlDate;
    f_MultilegOrderCancelReplace_CashMargin;
    f_MultilegOrderCancelReplace_ClearingFeeIndicator;
    f_MultilegOrderCancelReplace_HandlInst;
    f_MultilegOrderCancelReplace_ExecInst;
    f_MultilegOrderCancelReplace_MinQty;
    f_MultilegOrderCancelReplace_MaxFloor;
    f_MultilegOrderCancelReplace_ExDestination;
    f_MultilegOrderCancelReplace_ProcessCode;
    f_MultilegOrderCancelReplace_Side;
    f_MultilegOrderCancelReplace_PrevClosePx;
    f_MultilegOrderCancelReplace_LocateReqd;
    f_MultilegOrderCancelReplace_TransactTime;
    f_MultilegOrderCancelReplace_QtyType;
    f_MultilegOrderCancelReplace_OrdType;
    f_MultilegOrderCancelReplace_PriceType;
    f_MultilegOrderCancelReplace_Price;
    f_MultilegOrderCancelReplace_StopPx;
    f_MultilegOrderCancelReplace_Currency;
    f_MultilegOrderCancelReplace_ComplianceID;
    f_MultilegOrderCancelReplace_SolicitedFlag;
    f_MultilegOrderCancelReplace_IOIID;
    f_MultilegOrderCancelReplace_QuoteID;
    f_MultilegOrderCancelReplace_TimeInForce;
    f_MultilegOrderCancelReplace_EffectiveTime;
    f_MultilegOrderCancelReplace_ExpireDate;
    f_MultilegOrderCancelReplace_ExpireTime;
    f_MultilegOrderCancelReplace_GTBookingInst;
    f_MultilegOrderCancelReplace_OrderCapacity;
    f_MultilegOrderCancelReplace_OrderRestrictions;
    f_MultilegOrderCancelReplace_CustOrderCapacity;
    f_MultilegOrderCancelReplace_ForexReq;
    f_MultilegOrderCancelReplace_SettlCurrency;
    f_MultilegOrderCancelReplace_BookingType;
    f_MultilegOrderCancelReplace_Text;
    f_MultilegOrderCancelReplace_EncodedTextLen;
    f_MultilegOrderCancelReplace_EncodedText;
    f_MultilegOrderCancelReplace_PositionEffect;
    f_MultilegOrderCancelReplace_CoveredOrUncovered;
    f_MultilegOrderCancelReplace_MaxShow;
    f_MultilegOrderCancelReplace_TargetStrategy;
    f_MultilegOrderCancelReplace_TargetStrategyParameters;
    f_MultilegOrderCancelReplace_ParticipationRate;
    f_MultilegOrderCancelReplace_CancellationRights;
    f_MultilegOrderCancelReplace_MoneyLaunderingStatus;
    f_MultilegOrderCancelReplace_RegistID;
    f_MultilegOrderCancelReplace_Designation;
    f_MultilegOrderCancelReplace_MultiLegRptTypeReq;
    } , msg ) |> check_unknown_tags;;

let parse_NetworkCounterpartySystemStatusRequest msg = (
    repeating msg "936" parse_CompIDReqGrp @@ fun msg f_NetworkCounterpartySystemStatusRequest_CompIDReqGrp ->
    check_duplicate_tags msg @@ fun () ->
    req msg "935" parse_NetworkRequestType @@ fun msg f_NetworkCounterpartySystemStatusRequest_NetworkRequestType ->
    req msg "933" parse_string @@ fun msg f_NetworkCounterpartySystemStatusRequest_NetworkRequestID ->
    ParseSuccess {
    f_NetworkCounterpartySystemStatusRequest_CompIDReqGrp;
    f_NetworkCounterpartySystemStatusRequest_NetworkRequestType;
    f_NetworkCounterpartySystemStatusRequest_NetworkRequestID;
    } , msg ) |> check_unknown_tags;;

let parse_NetworkCounterpartySystemStatusResponse msg = (
    repeating msg "936" parse_CompIDStatGrp @@ fun msg f_NetworkCounterpartySystemStatusResponse_CompIDStatGrp ->
    check_duplicate_tags msg @@ fun () ->
    req msg "937" parse_NetworkStatusResponseType @@ fun msg f_NetworkCounterpartySystemStatusResponse_NetworkStatusResponseType ->
    opt msg "933" parse_string @@ fun msg f_NetworkCounterpartySystemStatusResponse_NetworkRequestID ->
    req msg "932" parse_string @@ fun msg f_NetworkCounterpartySystemStatusResponse_NetworkResponseID ->
    opt msg "934" parse_string @@ fun msg f_NetworkCounterpartySystemStatusResponse_LastNetworkResponseID ->
    ParseSuccess {
    f_NetworkCounterpartySystemStatusResponse_CompIDStatGrp;
    f_NetworkCounterpartySystemStatusResponse_NetworkStatusResponseType;
    f_NetworkCounterpartySystemStatusResponse_NetworkRequestID;
    f_NetworkCounterpartySystemStatusResponse_NetworkResponseID;
    f_NetworkCounterpartySystemStatusResponse_LastNetworkResponseID;
    } , msg ) |> check_unknown_tags;;

let parse_NewOrderCross msg = (
    repeating msg "552" parse_SideCrossOrdModGrp @@ fun msg f_NewOrderCross_SideCrossOrdModGrp ->
    repeating msg "711" parse_UndInstrmtGrp @@ fun msg f_NewOrderCross_UndInstrmtGrp ->
    repeating msg "555" parse_InstrmtLegGrp @@ fun msg f_NewOrderCross_InstrmtLegGrp ->
    repeating msg "386" parse_TrdgSesGrp @@ fun msg f_NewOrderCross_TrdgSesGrp ->
    repeating msg "232" parse_Stipulations @@ fun msg f_NewOrderCross_Stipulations ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_NewOrderCross_Instrument ->
    block msg  parse_SpreadOrBenchmarkCurveData @@ fun msg f_NewOrderCross_SpreadOrBenchmarkCurveData ->
    block msg  parse_YieldData @@ fun msg f_NewOrderCross_YieldData ->
    block msg  parse_PegInstructions @@ fun msg f_NewOrderCross_PegInstructions ->
    block msg  parse_DiscretionInstructions @@ fun msg f_NewOrderCross_DiscretionInstructions ->
    req msg "548" parse_string @@ fun msg f_NewOrderCross_CrossID ->
    req msg "549" parse_CrossType @@ fun msg f_NewOrderCross_CrossType ->
    req msg "550" parse_CrossPrioritization @@ fun msg f_NewOrderCross_CrossPrioritization ->
    opt msg "63" parse_SettlType @@ fun msg f_NewOrderCross_SettlType ->
    opt msg "64" parse_LocalMktDate @@ fun msg f_NewOrderCross_SettlDate ->
    opt msg "21" parse_HandlInst @@ fun msg f_NewOrderCross_HandlInst ->
    opt msg "18" parse_ExecInst @@ fun msg f_NewOrderCross_ExecInst ->
    opt msg "110" parse_float @@ fun msg f_NewOrderCross_MinQty ->
    opt msg "111" parse_float @@ fun msg f_NewOrderCross_MaxFloor ->
    opt msg "100" parse_Exchange @@ fun msg f_NewOrderCross_ExDestination ->
    opt msg "81" parse_ProcessCode @@ fun msg f_NewOrderCross_ProcessCode ->
    opt msg "140" parse_float @@ fun msg f_NewOrderCross_PrevClosePx ->
    opt msg "114" parse_LocateReqd @@ fun msg f_NewOrderCross_LocateReqd ->
    req msg "60" parse_UTCTimestamp @@ fun msg f_NewOrderCross_TransactTime ->
    req msg "40" parse_OrdType @@ fun msg f_NewOrderCross_OrdType ->
    opt msg "423" parse_PriceType @@ fun msg f_NewOrderCross_PriceType ->
    opt msg "44" parse_float @@ fun msg f_NewOrderCross_Price ->
    opt msg "99" parse_float @@ fun msg f_NewOrderCross_StopPx ->
    opt msg "15" parse_Currency @@ fun msg f_NewOrderCross_Currency ->
    opt msg "376" parse_string @@ fun msg f_NewOrderCross_ComplianceID ->
    opt msg "23" parse_string @@ fun msg f_NewOrderCross_IOIID ->
    opt msg "117" parse_string @@ fun msg f_NewOrderCross_QuoteID ->
    opt msg "59" parse_TimeInForce @@ fun msg f_NewOrderCross_TimeInForce ->
    opt msg "168" parse_UTCTimestamp @@ fun msg f_NewOrderCross_EffectiveTime ->
    opt msg "432" parse_LocalMktDate @@ fun msg f_NewOrderCross_ExpireDate ->
    opt msg "126" parse_UTCTimestamp @@ fun msg f_NewOrderCross_ExpireTime ->
    opt msg "427" parse_GTBookingInst @@ fun msg f_NewOrderCross_GTBookingInst ->
    opt msg "210" parse_float @@ fun msg f_NewOrderCross_MaxShow ->
    opt msg "847" parse_TargetStrategy @@ fun msg f_NewOrderCross_TargetStrategy ->
    opt msg "848" parse_string @@ fun msg f_NewOrderCross_TargetStrategyParameters ->
    opt msg "849" parse_float @@ fun msg f_NewOrderCross_ParticipationRate ->
    opt msg "480" parse_CancellationRights @@ fun msg f_NewOrderCross_CancellationRights ->
    opt msg "481" parse_MoneyLaunderingStatus @@ fun msg f_NewOrderCross_MoneyLaunderingStatus ->
    opt msg "513" parse_string @@ fun msg f_NewOrderCross_RegistID ->
    opt msg "494" parse_string @@ fun msg f_NewOrderCross_Designation ->
    ParseSuccess {
    f_NewOrderCross_SideCrossOrdModGrp;
    f_NewOrderCross_UndInstrmtGrp;
    f_NewOrderCross_InstrmtLegGrp;
    f_NewOrderCross_TrdgSesGrp;
    f_NewOrderCross_Stipulations;
    f_NewOrderCross_Instrument;
    f_NewOrderCross_SpreadOrBenchmarkCurveData;
    f_NewOrderCross_YieldData;
    f_NewOrderCross_PegInstructions;
    f_NewOrderCross_DiscretionInstructions;
    f_NewOrderCross_CrossID;
    f_NewOrderCross_CrossType;
    f_NewOrderCross_CrossPrioritization;
    f_NewOrderCross_SettlType;
    f_NewOrderCross_SettlDate;
    f_NewOrderCross_HandlInst;
    f_NewOrderCross_ExecInst;
    f_NewOrderCross_MinQty;
    f_NewOrderCross_MaxFloor;
    f_NewOrderCross_ExDestination;
    f_NewOrderCross_ProcessCode;
    f_NewOrderCross_PrevClosePx;
    f_NewOrderCross_LocateReqd;
    f_NewOrderCross_TransactTime;
    f_NewOrderCross_OrdType;
    f_NewOrderCross_PriceType;
    f_NewOrderCross_Price;
    f_NewOrderCross_StopPx;
    f_NewOrderCross_Currency;
    f_NewOrderCross_ComplianceID;
    f_NewOrderCross_IOIID;
    f_NewOrderCross_QuoteID;
    f_NewOrderCross_TimeInForce;
    f_NewOrderCross_EffectiveTime;
    f_NewOrderCross_ExpireDate;
    f_NewOrderCross_ExpireTime;
    f_NewOrderCross_GTBookingInst;
    f_NewOrderCross_MaxShow;
    f_NewOrderCross_TargetStrategy;
    f_NewOrderCross_TargetStrategyParameters;
    f_NewOrderCross_ParticipationRate;
    f_NewOrderCross_CancellationRights;
    f_NewOrderCross_MoneyLaunderingStatus;
    f_NewOrderCross_RegistID;
    f_NewOrderCross_Designation;
    } , msg ) |> check_unknown_tags;;

let parse_NewOrderList msg = (
    repeating msg "73" parse_ListOrdGrp @@ fun msg f_NewOrderList_ListOrdGrp ->
    check_duplicate_tags msg @@ fun () ->
    req msg "66" parse_string @@ fun msg f_NewOrderList_ListID ->
    opt msg "390" parse_string @@ fun msg f_NewOrderList_BidID ->
    opt msg "391" parse_string @@ fun msg f_NewOrderList_ClientBidID ->
    opt msg "414" parse_ProgRptReqs @@ fun msg f_NewOrderList_ProgRptReqs ->
    req msg "394" parse_BidType @@ fun msg f_NewOrderList_BidType ->
    opt msg "415" parse_int @@ fun msg f_NewOrderList_ProgPeriodInterval ->
    opt msg "480" parse_CancellationRights @@ fun msg f_NewOrderList_CancellationRights ->
    opt msg "481" parse_MoneyLaunderingStatus @@ fun msg f_NewOrderList_MoneyLaunderingStatus ->
    opt msg "513" parse_string @@ fun msg f_NewOrderList_RegistID ->
    opt msg "433" parse_ListExecInstType @@ fun msg f_NewOrderList_ListExecInstType ->
    opt msg "69" parse_string @@ fun msg f_NewOrderList_ListExecInst ->
    opt msg "352" parse_int @@ fun msg f_NewOrderList_EncodedListExecInstLen ->
    opt msg "353" parse_string @@ fun msg f_NewOrderList_EncodedListExecInst ->
    opt msg "765" parse_float @@ fun msg f_NewOrderList_AllowableOneSidednessPct ->
    opt msg "766" parse_float @@ fun msg f_NewOrderList_AllowableOneSidednessValue ->
    opt msg "767" parse_Currency @@ fun msg f_NewOrderList_AllowableOneSidednessCurr ->
    req msg "68" parse_int @@ fun msg f_NewOrderList_TotNoOrders ->
    opt msg "893" parse_LastFragment @@ fun msg f_NewOrderList_LastFragment ->
    ParseSuccess {
    f_NewOrderList_ListOrdGrp;
    f_NewOrderList_ListID;
    f_NewOrderList_BidID;
    f_NewOrderList_ClientBidID;
    f_NewOrderList_ProgRptReqs;
    f_NewOrderList_BidType;
    f_NewOrderList_ProgPeriodInterval;
    f_NewOrderList_CancellationRights;
    f_NewOrderList_MoneyLaunderingStatus;
    f_NewOrderList_RegistID;
    f_NewOrderList_ListExecInstType;
    f_NewOrderList_ListExecInst;
    f_NewOrderList_EncodedListExecInstLen;
    f_NewOrderList_EncodedListExecInst;
    f_NewOrderList_AllowableOneSidednessPct;
    f_NewOrderList_AllowableOneSidednessValue;
    f_NewOrderList_AllowableOneSidednessCurr;
    f_NewOrderList_TotNoOrders;
    f_NewOrderList_LastFragment;
    } , msg ) |> check_unknown_tags;;

let parse_NewOrderMultileg msg = (
    repeating msg "453" parse_Parties @@ fun msg f_NewOrderMultileg_Parties ->
    repeating msg "78" parse_PreAllocMlegGrp @@ fun msg f_NewOrderMultileg_PreAllocMlegGrp ->
    repeating msg "386" parse_TrdgSesGrp @@ fun msg f_NewOrderMultileg_TrdgSesGrp ->
    repeating msg "711" parse_UndInstrmtGrp @@ fun msg f_NewOrderMultileg_UndInstrmtGrp ->
    repeating msg "555" parse_LegOrdGrp @@ fun msg f_NewOrderMultileg_LegOrdGrp ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_NewOrderMultileg_Instrument ->
    block msg  parse_OrderQtyData @@ fun msg f_NewOrderMultileg_OrderQtyData ->
    block msg  parse_CommissionData @@ fun msg f_NewOrderMultileg_CommissionData ->
    block msg  parse_PegInstructions @@ fun msg f_NewOrderMultileg_PegInstructions ->
    block msg  parse_DiscretionInstructions @@ fun msg f_NewOrderMultileg_DiscretionInstructions ->
    req msg "11" parse_string @@ fun msg f_NewOrderMultileg_ClOrdID ->
    opt msg "526" parse_string @@ fun msg f_NewOrderMultileg_SecondaryClOrdID ->
    opt msg "583" parse_string @@ fun msg f_NewOrderMultileg_ClOrdLinkID ->
    opt msg "229" parse_LocalMktDate @@ fun msg f_NewOrderMultileg_TradeOriginationDate ->
    opt msg "75" parse_LocalMktDate @@ fun msg f_NewOrderMultileg_TradeDate ->
    opt msg "1" parse_string @@ fun msg f_NewOrderMultileg_Account ->
    opt msg "660" parse_AcctIDSource @@ fun msg f_NewOrderMultileg_AcctIDSource ->
    opt msg "581" parse_AccountType @@ fun msg f_NewOrderMultileg_AccountType ->
    opt msg "589" parse_DayBookingInst @@ fun msg f_NewOrderMultileg_DayBookingInst ->
    opt msg "590" parse_BookingUnit @@ fun msg f_NewOrderMultileg_BookingUnit ->
    opt msg "591" parse_PreallocMethod @@ fun msg f_NewOrderMultileg_PreallocMethod ->
    opt msg "70" parse_string @@ fun msg f_NewOrderMultileg_AllocID ->
    opt msg "63" parse_SettlType @@ fun msg f_NewOrderMultileg_SettlType ->
    opt msg "64" parse_LocalMktDate @@ fun msg f_NewOrderMultileg_SettlDate ->
    opt msg "544" parse_CashMargin @@ fun msg f_NewOrderMultileg_CashMargin ->
    opt msg "635" parse_ClearingFeeIndicator @@ fun msg f_NewOrderMultileg_ClearingFeeIndicator ->
    opt msg "21" parse_HandlInst @@ fun msg f_NewOrderMultileg_HandlInst ->
    opt msg "18" parse_ExecInst @@ fun msg f_NewOrderMultileg_ExecInst ->
    opt msg "110" parse_float @@ fun msg f_NewOrderMultileg_MinQty ->
    opt msg "111" parse_float @@ fun msg f_NewOrderMultileg_MaxFloor ->
    opt msg "100" parse_Exchange @@ fun msg f_NewOrderMultileg_ExDestination ->
    opt msg "81" parse_ProcessCode @@ fun msg f_NewOrderMultileg_ProcessCode ->
    req msg "54" parse_Side @@ fun msg f_NewOrderMultileg_Side ->
    opt msg "140" parse_float @@ fun msg f_NewOrderMultileg_PrevClosePx ->
    opt msg "114" parse_LocateReqd @@ fun msg f_NewOrderMultileg_LocateReqd ->
    req msg "60" parse_UTCTimestamp @@ fun msg f_NewOrderMultileg_TransactTime ->
    opt msg "854" parse_QtyType @@ fun msg f_NewOrderMultileg_QtyType ->
    req msg "40" parse_OrdType @@ fun msg f_NewOrderMultileg_OrdType ->
    opt msg "423" parse_PriceType @@ fun msg f_NewOrderMultileg_PriceType ->
    opt msg "44" parse_float @@ fun msg f_NewOrderMultileg_Price ->
    opt msg "99" parse_float @@ fun msg f_NewOrderMultileg_StopPx ->
    opt msg "15" parse_Currency @@ fun msg f_NewOrderMultileg_Currency ->
    opt msg "376" parse_string @@ fun msg f_NewOrderMultileg_ComplianceID ->
    opt msg "377" parse_SolicitedFlag @@ fun msg f_NewOrderMultileg_SolicitedFlag ->
    opt msg "23" parse_string @@ fun msg f_NewOrderMultileg_IOIID ->
    opt msg "117" parse_string @@ fun msg f_NewOrderMultileg_QuoteID ->
    opt msg "59" parse_TimeInForce @@ fun msg f_NewOrderMultileg_TimeInForce ->
    opt msg "168" parse_UTCTimestamp @@ fun msg f_NewOrderMultileg_EffectiveTime ->
    opt msg "432" parse_LocalMktDate @@ fun msg f_NewOrderMultileg_ExpireDate ->
    opt msg "126" parse_UTCTimestamp @@ fun msg f_NewOrderMultileg_ExpireTime ->
    opt msg "427" parse_GTBookingInst @@ fun msg f_NewOrderMultileg_GTBookingInst ->
    opt msg "528" parse_OrderCapacity @@ fun msg f_NewOrderMultileg_OrderCapacity ->
    opt msg "529" parse_OrderRestrictions @@ fun msg f_NewOrderMultileg_OrderRestrictions ->
    opt msg "582" parse_CustOrderCapacity @@ fun msg f_NewOrderMultileg_CustOrderCapacity ->
    opt msg "121" parse_ForexReq @@ fun msg f_NewOrderMultileg_ForexReq ->
    opt msg "120" parse_Currency @@ fun msg f_NewOrderMultileg_SettlCurrency ->
    opt msg "775" parse_BookingType @@ fun msg f_NewOrderMultileg_BookingType ->
    opt msg "58" parse_string @@ fun msg f_NewOrderMultileg_Text ->
    opt msg "354" parse_int @@ fun msg f_NewOrderMultileg_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_NewOrderMultileg_EncodedText ->
    opt msg "77" parse_PositionEffect @@ fun msg f_NewOrderMultileg_PositionEffect ->
    opt msg "203" parse_CoveredOrUncovered @@ fun msg f_NewOrderMultileg_CoveredOrUncovered ->
    opt msg "210" parse_float @@ fun msg f_NewOrderMultileg_MaxShow ->
    opt msg "847" parse_TargetStrategy @@ fun msg f_NewOrderMultileg_TargetStrategy ->
    opt msg "848" parse_string @@ fun msg f_NewOrderMultileg_TargetStrategyParameters ->
    opt msg "849" parse_float @@ fun msg f_NewOrderMultileg_ParticipationRate ->
    opt msg "480" parse_CancellationRights @@ fun msg f_NewOrderMultileg_CancellationRights ->
    opt msg "481" parse_MoneyLaunderingStatus @@ fun msg f_NewOrderMultileg_MoneyLaunderingStatus ->
    opt msg "513" parse_string @@ fun msg f_NewOrderMultileg_RegistID ->
    opt msg "494" parse_string @@ fun msg f_NewOrderMultileg_Designation ->
    opt msg "563" parse_MultiLegRptTypeReq @@ fun msg f_NewOrderMultileg_MultiLegRptTypeReq ->
    ParseSuccess {
    f_NewOrderMultileg_Parties;
    f_NewOrderMultileg_PreAllocMlegGrp;
    f_NewOrderMultileg_TrdgSesGrp;
    f_NewOrderMultileg_UndInstrmtGrp;
    f_NewOrderMultileg_LegOrdGrp;
    f_NewOrderMultileg_Instrument;
    f_NewOrderMultileg_OrderQtyData;
    f_NewOrderMultileg_CommissionData;
    f_NewOrderMultileg_PegInstructions;
    f_NewOrderMultileg_DiscretionInstructions;
    f_NewOrderMultileg_ClOrdID;
    f_NewOrderMultileg_SecondaryClOrdID;
    f_NewOrderMultileg_ClOrdLinkID;
    f_NewOrderMultileg_TradeOriginationDate;
    f_NewOrderMultileg_TradeDate;
    f_NewOrderMultileg_Account;
    f_NewOrderMultileg_AcctIDSource;
    f_NewOrderMultileg_AccountType;
    f_NewOrderMultileg_DayBookingInst;
    f_NewOrderMultileg_BookingUnit;
    f_NewOrderMultileg_PreallocMethod;
    f_NewOrderMultileg_AllocID;
    f_NewOrderMultileg_SettlType;
    f_NewOrderMultileg_SettlDate;
    f_NewOrderMultileg_CashMargin;
    f_NewOrderMultileg_ClearingFeeIndicator;
    f_NewOrderMultileg_HandlInst;
    f_NewOrderMultileg_ExecInst;
    f_NewOrderMultileg_MinQty;
    f_NewOrderMultileg_MaxFloor;
    f_NewOrderMultileg_ExDestination;
    f_NewOrderMultileg_ProcessCode;
    f_NewOrderMultileg_Side;
    f_NewOrderMultileg_PrevClosePx;
    f_NewOrderMultileg_LocateReqd;
    f_NewOrderMultileg_TransactTime;
    f_NewOrderMultileg_QtyType;
    f_NewOrderMultileg_OrdType;
    f_NewOrderMultileg_PriceType;
    f_NewOrderMultileg_Price;
    f_NewOrderMultileg_StopPx;
    f_NewOrderMultileg_Currency;
    f_NewOrderMultileg_ComplianceID;
    f_NewOrderMultileg_SolicitedFlag;
    f_NewOrderMultileg_IOIID;
    f_NewOrderMultileg_QuoteID;
    f_NewOrderMultileg_TimeInForce;
    f_NewOrderMultileg_EffectiveTime;
    f_NewOrderMultileg_ExpireDate;
    f_NewOrderMultileg_ExpireTime;
    f_NewOrderMultileg_GTBookingInst;
    f_NewOrderMultileg_OrderCapacity;
    f_NewOrderMultileg_OrderRestrictions;
    f_NewOrderMultileg_CustOrderCapacity;
    f_NewOrderMultileg_ForexReq;
    f_NewOrderMultileg_SettlCurrency;
    f_NewOrderMultileg_BookingType;
    f_NewOrderMultileg_Text;
    f_NewOrderMultileg_EncodedTextLen;
    f_NewOrderMultileg_EncodedText;
    f_NewOrderMultileg_PositionEffect;
    f_NewOrderMultileg_CoveredOrUncovered;
    f_NewOrderMultileg_MaxShow;
    f_NewOrderMultileg_TargetStrategy;
    f_NewOrderMultileg_TargetStrategyParameters;
    f_NewOrderMultileg_ParticipationRate;
    f_NewOrderMultileg_CancellationRights;
    f_NewOrderMultileg_MoneyLaunderingStatus;
    f_NewOrderMultileg_RegistID;
    f_NewOrderMultileg_Designation;
    f_NewOrderMultileg_MultiLegRptTypeReq;
    } , msg ) |> check_unknown_tags;;

let parse_NewOrderSingle msg = (
    repeating msg "453" parse_Parties @@ fun msg f_NewOrderSingle_Parties ->
    repeating msg "78" parse_PreAllocGrp @@ fun msg f_NewOrderSingle_PreAllocGrp ->
    repeating msg "386" parse_TrdgSesGrp @@ fun msg f_NewOrderSingle_TrdgSesGrp ->
    repeating msg "711" parse_UndInstrmtGrp @@ fun msg f_NewOrderSingle_UndInstrmtGrp ->
    repeating msg "232" parse_Stipulations @@ fun msg f_NewOrderSingle_Stipulations ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_NewOrderSingle_Instrument ->
    block msg  parse_FinancingDetails @@ fun msg f_NewOrderSingle_FinancingDetails ->
    block msg  parse_OrderQtyData @@ fun msg f_NewOrderSingle_OrderQtyData ->
    block msg  parse_SpreadOrBenchmarkCurveData @@ fun msg f_NewOrderSingle_SpreadOrBenchmarkCurveData ->
    block msg  parse_YieldData @@ fun msg f_NewOrderSingle_YieldData ->
    block msg  parse_CommissionData @@ fun msg f_NewOrderSingle_CommissionData ->
    block msg  parse_PegInstructions @@ fun msg f_NewOrderSingle_PegInstructions ->
    block msg  parse_DiscretionInstructions @@ fun msg f_NewOrderSingle_DiscretionInstructions ->
    req msg "11" parse_string @@ fun msg f_NewOrderSingle_ClOrdID ->
    opt msg "526" parse_string @@ fun msg f_NewOrderSingle_SecondaryClOrdID ->
    opt msg "583" parse_string @@ fun msg f_NewOrderSingle_ClOrdLinkID ->
    opt msg "229" parse_LocalMktDate @@ fun msg f_NewOrderSingle_TradeOriginationDate ->
    opt msg "75" parse_LocalMktDate @@ fun msg f_NewOrderSingle_TradeDate ->
    opt msg "1" parse_string @@ fun msg f_NewOrderSingle_Account ->
    opt msg "660" parse_AcctIDSource @@ fun msg f_NewOrderSingle_AcctIDSource ->
    opt msg "581" parse_AccountType @@ fun msg f_NewOrderSingle_AccountType ->
    opt msg "589" parse_DayBookingInst @@ fun msg f_NewOrderSingle_DayBookingInst ->
    opt msg "590" parse_BookingUnit @@ fun msg f_NewOrderSingle_BookingUnit ->
    opt msg "591" parse_PreallocMethod @@ fun msg f_NewOrderSingle_PreallocMethod ->
    opt msg "70" parse_string @@ fun msg f_NewOrderSingle_AllocID ->
    opt msg "63" parse_SettlType @@ fun msg f_NewOrderSingle_SettlType ->
    opt msg "64" parse_LocalMktDate @@ fun msg f_NewOrderSingle_SettlDate ->
    opt msg "544" parse_CashMargin @@ fun msg f_NewOrderSingle_CashMargin ->
    opt msg "635" parse_ClearingFeeIndicator @@ fun msg f_NewOrderSingle_ClearingFeeIndicator ->
    opt msg "21" parse_HandlInst @@ fun msg f_NewOrderSingle_HandlInst ->
    opt msg "18" parse_ExecInst @@ fun msg f_NewOrderSingle_ExecInst ->
    opt msg "110" parse_float @@ fun msg f_NewOrderSingle_MinQty ->
    opt msg "111" parse_float @@ fun msg f_NewOrderSingle_MaxFloor ->
    opt msg "100" parse_Exchange @@ fun msg f_NewOrderSingle_ExDestination ->
    opt msg "81" parse_ProcessCode @@ fun msg f_NewOrderSingle_ProcessCode ->
    opt msg "140" parse_float @@ fun msg f_NewOrderSingle_PrevClosePx ->
    req msg "54" parse_Side @@ fun msg f_NewOrderSingle_Side ->
    opt msg "114" parse_LocateReqd @@ fun msg f_NewOrderSingle_LocateReqd ->
    req msg "60" parse_UTCTimestamp @@ fun msg f_NewOrderSingle_TransactTime ->
    opt msg "854" parse_QtyType @@ fun msg f_NewOrderSingle_QtyType ->
    req msg "40" parse_OrdType @@ fun msg f_NewOrderSingle_OrdType ->
    opt msg "423" parse_PriceType @@ fun msg f_NewOrderSingle_PriceType ->
    opt msg "44" parse_float @@ fun msg f_NewOrderSingle_Price ->
    opt msg "99" parse_float @@ fun msg f_NewOrderSingle_StopPx ->
    opt msg "15" parse_Currency @@ fun msg f_NewOrderSingle_Currency ->
    opt msg "376" parse_string @@ fun msg f_NewOrderSingle_ComplianceID ->
    opt msg "377" parse_SolicitedFlag @@ fun msg f_NewOrderSingle_SolicitedFlag ->
    opt msg "23" parse_string @@ fun msg f_NewOrderSingle_IOIID ->
    opt msg "117" parse_string @@ fun msg f_NewOrderSingle_QuoteID ->
    opt msg "59" parse_TimeInForce @@ fun msg f_NewOrderSingle_TimeInForce ->
    opt msg "168" parse_UTCTimestamp @@ fun msg f_NewOrderSingle_EffectiveTime ->
    opt msg "432" parse_LocalMktDate @@ fun msg f_NewOrderSingle_ExpireDate ->
    opt msg "126" parse_UTCTimestamp @@ fun msg f_NewOrderSingle_ExpireTime ->
    opt msg "427" parse_GTBookingInst @@ fun msg f_NewOrderSingle_GTBookingInst ->
    opt msg "528" parse_OrderCapacity @@ fun msg f_NewOrderSingle_OrderCapacity ->
    opt msg "529" parse_OrderRestrictions @@ fun msg f_NewOrderSingle_OrderRestrictions ->
    opt msg "582" parse_CustOrderCapacity @@ fun msg f_NewOrderSingle_CustOrderCapacity ->
    opt msg "121" parse_ForexReq @@ fun msg f_NewOrderSingle_ForexReq ->
    opt msg "120" parse_Currency @@ fun msg f_NewOrderSingle_SettlCurrency ->
    opt msg "775" parse_BookingType @@ fun msg f_NewOrderSingle_BookingType ->
    opt msg "58" parse_string @@ fun msg f_NewOrderSingle_Text ->
    opt msg "354" parse_int @@ fun msg f_NewOrderSingle_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_NewOrderSingle_EncodedText ->
    opt msg "193" parse_LocalMktDate @@ fun msg f_NewOrderSingle_SettlDate2 ->
    opt msg "192" parse_float @@ fun msg f_NewOrderSingle_OrderQty2 ->
    opt msg "640" parse_float @@ fun msg f_NewOrderSingle_Price2 ->
    opt msg "77" parse_PositionEffect @@ fun msg f_NewOrderSingle_PositionEffect ->
    opt msg "203" parse_CoveredOrUncovered @@ fun msg f_NewOrderSingle_CoveredOrUncovered ->
    opt msg "210" parse_float @@ fun msg f_NewOrderSingle_MaxShow ->
    opt msg "847" parse_TargetStrategy @@ fun msg f_NewOrderSingle_TargetStrategy ->
    opt msg "848" parse_string @@ fun msg f_NewOrderSingle_TargetStrategyParameters ->
    opt msg "849" parse_float @@ fun msg f_NewOrderSingle_ParticipationRate ->
    opt msg "480" parse_CancellationRights @@ fun msg f_NewOrderSingle_CancellationRights ->
    opt msg "481" parse_MoneyLaunderingStatus @@ fun msg f_NewOrderSingle_MoneyLaunderingStatus ->
    opt msg "513" parse_string @@ fun msg f_NewOrderSingle_RegistID ->
    opt msg "494" parse_string @@ fun msg f_NewOrderSingle_Designation ->
    ParseSuccess {
    f_NewOrderSingle_Parties;
    f_NewOrderSingle_PreAllocGrp;
    f_NewOrderSingle_TrdgSesGrp;
    f_NewOrderSingle_UndInstrmtGrp;
    f_NewOrderSingle_Stipulations;
    f_NewOrderSingle_Instrument;
    f_NewOrderSingle_FinancingDetails;
    f_NewOrderSingle_OrderQtyData;
    f_NewOrderSingle_SpreadOrBenchmarkCurveData;
    f_NewOrderSingle_YieldData;
    f_NewOrderSingle_CommissionData;
    f_NewOrderSingle_PegInstructions;
    f_NewOrderSingle_DiscretionInstructions;
    f_NewOrderSingle_ClOrdID;
    f_NewOrderSingle_SecondaryClOrdID;
    f_NewOrderSingle_ClOrdLinkID;
    f_NewOrderSingle_TradeOriginationDate;
    f_NewOrderSingle_TradeDate;
    f_NewOrderSingle_Account;
    f_NewOrderSingle_AcctIDSource;
    f_NewOrderSingle_AccountType;
    f_NewOrderSingle_DayBookingInst;
    f_NewOrderSingle_BookingUnit;
    f_NewOrderSingle_PreallocMethod;
    f_NewOrderSingle_AllocID;
    f_NewOrderSingle_SettlType;
    f_NewOrderSingle_SettlDate;
    f_NewOrderSingle_CashMargin;
    f_NewOrderSingle_ClearingFeeIndicator;
    f_NewOrderSingle_HandlInst;
    f_NewOrderSingle_ExecInst;
    f_NewOrderSingle_MinQty;
    f_NewOrderSingle_MaxFloor;
    f_NewOrderSingle_ExDestination;
    f_NewOrderSingle_ProcessCode;
    f_NewOrderSingle_PrevClosePx;
    f_NewOrderSingle_Side;
    f_NewOrderSingle_LocateReqd;
    f_NewOrderSingle_TransactTime;
    f_NewOrderSingle_QtyType;
    f_NewOrderSingle_OrdType;
    f_NewOrderSingle_PriceType;
    f_NewOrderSingle_Price;
    f_NewOrderSingle_StopPx;
    f_NewOrderSingle_Currency;
    f_NewOrderSingle_ComplianceID;
    f_NewOrderSingle_SolicitedFlag;
    f_NewOrderSingle_IOIID;
    f_NewOrderSingle_QuoteID;
    f_NewOrderSingle_TimeInForce;
    f_NewOrderSingle_EffectiveTime;
    f_NewOrderSingle_ExpireDate;
    f_NewOrderSingle_ExpireTime;
    f_NewOrderSingle_GTBookingInst;
    f_NewOrderSingle_OrderCapacity;
    f_NewOrderSingle_OrderRestrictions;
    f_NewOrderSingle_CustOrderCapacity;
    f_NewOrderSingle_ForexReq;
    f_NewOrderSingle_SettlCurrency;
    f_NewOrderSingle_BookingType;
    f_NewOrderSingle_Text;
    f_NewOrderSingle_EncodedTextLen;
    f_NewOrderSingle_EncodedText;
    f_NewOrderSingle_SettlDate2;
    f_NewOrderSingle_OrderQty2;
    f_NewOrderSingle_Price2;
    f_NewOrderSingle_PositionEffect;
    f_NewOrderSingle_CoveredOrUncovered;
    f_NewOrderSingle_MaxShow;
    f_NewOrderSingle_TargetStrategy;
    f_NewOrderSingle_TargetStrategyParameters;
    f_NewOrderSingle_ParticipationRate;
    f_NewOrderSingle_CancellationRights;
    f_NewOrderSingle_MoneyLaunderingStatus;
    f_NewOrderSingle_RegistID;
    f_NewOrderSingle_Designation;
    } , msg ) |> check_unknown_tags;;

let parse_News msg = (
    repeating msg "215" parse_RoutingGrp @@ fun msg f_News_RoutingGrp ->
    repeating msg "146" parse_InstrmtGrp @@ fun msg f_News_InstrmtGrp ->
    repeating msg "555" parse_InstrmtLegGrp @@ fun msg f_News_InstrmtLegGrp ->
    repeating msg "711" parse_UndInstrmtGrp @@ fun msg f_News_UndInstrmtGrp ->
    repeating msg "33" parse_LinesOfTextGrp @@ fun msg f_News_LinesOfTextGrp ->
    check_duplicate_tags msg @@ fun () ->
    opt msg "42" parse_UTCTimestamp @@ fun msg f_News_OrigTime ->
    opt msg "61" parse_Urgency @@ fun msg f_News_Urgency ->
    req msg "148" parse_string @@ fun msg f_News_Headline ->
    opt msg "358" parse_int @@ fun msg f_News_EncodedHeadlineLen ->
    opt msg "359" parse_string @@ fun msg f_News_EncodedHeadline ->
    opt msg "149" parse_string @@ fun msg f_News_URLLink ->
    opt msg "95" parse_int @@ fun msg f_News_RawDataLength ->
    opt msg "96" parse_string @@ fun msg f_News_RawData ->
    ParseSuccess {
    f_News_RoutingGrp;
    f_News_InstrmtGrp;
    f_News_InstrmtLegGrp;
    f_News_UndInstrmtGrp;
    f_News_LinesOfTextGrp;
    f_News_OrigTime;
    f_News_Urgency;
    f_News_Headline;
    f_News_EncodedHeadlineLen;
    f_News_EncodedHeadline;
    f_News_URLLink;
    f_News_RawDataLength;
    f_News_RawData;
    } , msg ) |> check_unknown_tags;;

let parse_OrderCancelReject msg = (
    check_duplicate_tags msg @@ fun () ->
    req msg "37" parse_string @@ fun msg f_OrderCancelReject_OrderID ->
    opt msg "198" parse_string @@ fun msg f_OrderCancelReject_SecondaryOrderID ->
    opt msg "526" parse_string @@ fun msg f_OrderCancelReject_SecondaryClOrdID ->
    req msg "11" parse_string @@ fun msg f_OrderCancelReject_ClOrdID ->
    opt msg "583" parse_string @@ fun msg f_OrderCancelReject_ClOrdLinkID ->
    req msg "41" parse_string @@ fun msg f_OrderCancelReject_OrigClOrdID ->
    req msg "39" parse_OrdStatus @@ fun msg f_OrderCancelReject_OrdStatus ->
    opt msg "636" parse_WorkingIndicator @@ fun msg f_OrderCancelReject_WorkingIndicator ->
    opt msg "586" parse_UTCTimestamp @@ fun msg f_OrderCancelReject_OrigOrdModTime ->
    opt msg "66" parse_string @@ fun msg f_OrderCancelReject_ListID ->
    opt msg "1" parse_string @@ fun msg f_OrderCancelReject_Account ->
    opt msg "660" parse_AcctIDSource @@ fun msg f_OrderCancelReject_AcctIDSource ->
    opt msg "581" parse_AccountType @@ fun msg f_OrderCancelReject_AccountType ->
    opt msg "229" parse_LocalMktDate @@ fun msg f_OrderCancelReject_TradeOriginationDate ->
    opt msg "75" parse_LocalMktDate @@ fun msg f_OrderCancelReject_TradeDate ->
    opt msg "60" parse_UTCTimestamp @@ fun msg f_OrderCancelReject_TransactTime ->
    req msg "434" parse_CxlRejResponseTo @@ fun msg f_OrderCancelReject_CxlRejResponseTo ->
    opt msg "102" parse_CxlRejReason @@ fun msg f_OrderCancelReject_CxlRejReason ->
    opt msg "58" parse_string @@ fun msg f_OrderCancelReject_Text ->
    opt msg "354" parse_int @@ fun msg f_OrderCancelReject_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_OrderCancelReject_EncodedText ->
    ParseSuccess {
    f_OrderCancelReject_OrderID;
    f_OrderCancelReject_SecondaryOrderID;
    f_OrderCancelReject_SecondaryClOrdID;
    f_OrderCancelReject_ClOrdID;
    f_OrderCancelReject_ClOrdLinkID;
    f_OrderCancelReject_OrigClOrdID;
    f_OrderCancelReject_OrdStatus;
    f_OrderCancelReject_WorkingIndicator;
    f_OrderCancelReject_OrigOrdModTime;
    f_OrderCancelReject_ListID;
    f_OrderCancelReject_Account;
    f_OrderCancelReject_AcctIDSource;
    f_OrderCancelReject_AccountType;
    f_OrderCancelReject_TradeOriginationDate;
    f_OrderCancelReject_TradeDate;
    f_OrderCancelReject_TransactTime;
    f_OrderCancelReject_CxlRejResponseTo;
    f_OrderCancelReject_CxlRejReason;
    f_OrderCancelReject_Text;
    f_OrderCancelReject_EncodedTextLen;
    f_OrderCancelReject_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_OrderCancelReplaceRequest msg = (
    repeating msg "453" parse_Parties @@ fun msg f_OrderCancelReplaceRequest_Parties ->
    repeating msg "78" parse_PreAllocGrp @@ fun msg f_OrderCancelReplaceRequest_PreAllocGrp ->
    repeating msg "386" parse_TrdgSesGrp @@ fun msg f_OrderCancelReplaceRequest_TrdgSesGrp ->
    repeating msg "711" parse_UndInstrmtGrp @@ fun msg f_OrderCancelReplaceRequest_UndInstrmtGrp ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_OrderCancelReplaceRequest_Instrument ->
    block msg  parse_FinancingDetails @@ fun msg f_OrderCancelReplaceRequest_FinancingDetails ->
    block msg  parse_OrderQtyData @@ fun msg f_OrderCancelReplaceRequest_OrderQtyData ->
    block msg  parse_SpreadOrBenchmarkCurveData @@ fun msg f_OrderCancelReplaceRequest_SpreadOrBenchmarkCurveData ->
    block msg  parse_YieldData @@ fun msg f_OrderCancelReplaceRequest_YieldData ->
    block msg  parse_PegInstructions @@ fun msg f_OrderCancelReplaceRequest_PegInstructions ->
    block msg  parse_DiscretionInstructions @@ fun msg f_OrderCancelReplaceRequest_DiscretionInstructions ->
    block msg  parse_CommissionData @@ fun msg f_OrderCancelReplaceRequest_CommissionData ->
    opt msg "37" parse_string @@ fun msg f_OrderCancelReplaceRequest_OrderID ->
    opt msg "229" parse_LocalMktDate @@ fun msg f_OrderCancelReplaceRequest_TradeOriginationDate ->
    opt msg "75" parse_LocalMktDate @@ fun msg f_OrderCancelReplaceRequest_TradeDate ->
    req msg "41" parse_string @@ fun msg f_OrderCancelReplaceRequest_OrigClOrdID ->
    req msg "11" parse_string @@ fun msg f_OrderCancelReplaceRequest_ClOrdID ->
    opt msg "526" parse_string @@ fun msg f_OrderCancelReplaceRequest_SecondaryClOrdID ->
    opt msg "583" parse_string @@ fun msg f_OrderCancelReplaceRequest_ClOrdLinkID ->
    opt msg "66" parse_string @@ fun msg f_OrderCancelReplaceRequest_ListID ->
    opt msg "586" parse_UTCTimestamp @@ fun msg f_OrderCancelReplaceRequest_OrigOrdModTime ->
    opt msg "1" parse_string @@ fun msg f_OrderCancelReplaceRequest_Account ->
    opt msg "660" parse_AcctIDSource @@ fun msg f_OrderCancelReplaceRequest_AcctIDSource ->
    opt msg "581" parse_AccountType @@ fun msg f_OrderCancelReplaceRequest_AccountType ->
    opt msg "589" parse_DayBookingInst @@ fun msg f_OrderCancelReplaceRequest_DayBookingInst ->
    opt msg "590" parse_BookingUnit @@ fun msg f_OrderCancelReplaceRequest_BookingUnit ->
    opt msg "591" parse_PreallocMethod @@ fun msg f_OrderCancelReplaceRequest_PreallocMethod ->
    opt msg "70" parse_string @@ fun msg f_OrderCancelReplaceRequest_AllocID ->
    opt msg "63" parse_SettlType @@ fun msg f_OrderCancelReplaceRequest_SettlType ->
    opt msg "64" parse_LocalMktDate @@ fun msg f_OrderCancelReplaceRequest_SettlDate ->
    opt msg "544" parse_CashMargin @@ fun msg f_OrderCancelReplaceRequest_CashMargin ->
    opt msg "635" parse_ClearingFeeIndicator @@ fun msg f_OrderCancelReplaceRequest_ClearingFeeIndicator ->
    opt msg "21" parse_HandlInst @@ fun msg f_OrderCancelReplaceRequest_HandlInst ->
    opt msg "18" parse_ExecInst @@ fun msg f_OrderCancelReplaceRequest_ExecInst ->
    opt msg "110" parse_float @@ fun msg f_OrderCancelReplaceRequest_MinQty ->
    opt msg "111" parse_float @@ fun msg f_OrderCancelReplaceRequest_MaxFloor ->
    opt msg "100" parse_Exchange @@ fun msg f_OrderCancelReplaceRequest_ExDestination ->
    req msg "54" parse_Side @@ fun msg f_OrderCancelReplaceRequest_Side ->
    req msg "60" parse_UTCTimestamp @@ fun msg f_OrderCancelReplaceRequest_TransactTime ->
    opt msg "854" parse_QtyType @@ fun msg f_OrderCancelReplaceRequest_QtyType ->
    req msg "40" parse_OrdType @@ fun msg f_OrderCancelReplaceRequest_OrdType ->
    opt msg "423" parse_PriceType @@ fun msg f_OrderCancelReplaceRequest_PriceType ->
    opt msg "44" parse_float @@ fun msg f_OrderCancelReplaceRequest_Price ->
    opt msg "99" parse_float @@ fun msg f_OrderCancelReplaceRequest_StopPx ->
    opt msg "847" parse_TargetStrategy @@ fun msg f_OrderCancelReplaceRequest_TargetStrategy ->
    opt msg "848" parse_string @@ fun msg f_OrderCancelReplaceRequest_TargetStrategyParameters ->
    opt msg "849" parse_float @@ fun msg f_OrderCancelReplaceRequest_ParticipationRate ->
    opt msg "376" parse_string @@ fun msg f_OrderCancelReplaceRequest_ComplianceID ->
    opt msg "377" parse_SolicitedFlag @@ fun msg f_OrderCancelReplaceRequest_SolicitedFlag ->
    opt msg "15" parse_Currency @@ fun msg f_OrderCancelReplaceRequest_Currency ->
    opt msg "59" parse_TimeInForce @@ fun msg f_OrderCancelReplaceRequest_TimeInForce ->
    opt msg "168" parse_UTCTimestamp @@ fun msg f_OrderCancelReplaceRequest_EffectiveTime ->
    opt msg "432" parse_LocalMktDate @@ fun msg f_OrderCancelReplaceRequest_ExpireDate ->
    opt msg "126" parse_UTCTimestamp @@ fun msg f_OrderCancelReplaceRequest_ExpireTime ->
    opt msg "427" parse_GTBookingInst @@ fun msg f_OrderCancelReplaceRequest_GTBookingInst ->
    opt msg "528" parse_OrderCapacity @@ fun msg f_OrderCancelReplaceRequest_OrderCapacity ->
    opt msg "529" parse_OrderRestrictions @@ fun msg f_OrderCancelReplaceRequest_OrderRestrictions ->
    opt msg "582" parse_CustOrderCapacity @@ fun msg f_OrderCancelReplaceRequest_CustOrderCapacity ->
    opt msg "121" parse_ForexReq @@ fun msg f_OrderCancelReplaceRequest_ForexReq ->
    opt msg "120" parse_Currency @@ fun msg f_OrderCancelReplaceRequest_SettlCurrency ->
    opt msg "775" parse_BookingType @@ fun msg f_OrderCancelReplaceRequest_BookingType ->
    opt msg "58" parse_string @@ fun msg f_OrderCancelReplaceRequest_Text ->
    opt msg "354" parse_int @@ fun msg f_OrderCancelReplaceRequest_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_OrderCancelReplaceRequest_EncodedText ->
    opt msg "193" parse_LocalMktDate @@ fun msg f_OrderCancelReplaceRequest_SettlDate2 ->
    opt msg "192" parse_float @@ fun msg f_OrderCancelReplaceRequest_OrderQty2 ->
    opt msg "640" parse_float @@ fun msg f_OrderCancelReplaceRequest_Price2 ->
    opt msg "77" parse_PositionEffect @@ fun msg f_OrderCancelReplaceRequest_PositionEffect ->
    opt msg "203" parse_CoveredOrUncovered @@ fun msg f_OrderCancelReplaceRequest_CoveredOrUncovered ->
    opt msg "210" parse_float @@ fun msg f_OrderCancelReplaceRequest_MaxShow ->
    opt msg "114" parse_LocateReqd @@ fun msg f_OrderCancelReplaceRequest_LocateReqd ->
    opt msg "480" parse_CancellationRights @@ fun msg f_OrderCancelReplaceRequest_CancellationRights ->
    opt msg "481" parse_MoneyLaunderingStatus @@ fun msg f_OrderCancelReplaceRequest_MoneyLaunderingStatus ->
    opt msg "513" parse_string @@ fun msg f_OrderCancelReplaceRequest_RegistID ->
    opt msg "494" parse_string @@ fun msg f_OrderCancelReplaceRequest_Designation ->
    ParseSuccess {
    f_OrderCancelReplaceRequest_Parties;
    f_OrderCancelReplaceRequest_PreAllocGrp;
    f_OrderCancelReplaceRequest_TrdgSesGrp;
    f_OrderCancelReplaceRequest_UndInstrmtGrp;
    f_OrderCancelReplaceRequest_Instrument;
    f_OrderCancelReplaceRequest_FinancingDetails;
    f_OrderCancelReplaceRequest_OrderQtyData;
    f_OrderCancelReplaceRequest_SpreadOrBenchmarkCurveData;
    f_OrderCancelReplaceRequest_YieldData;
    f_OrderCancelReplaceRequest_PegInstructions;
    f_OrderCancelReplaceRequest_DiscretionInstructions;
    f_OrderCancelReplaceRequest_CommissionData;
    f_OrderCancelReplaceRequest_OrderID;
    f_OrderCancelReplaceRequest_TradeOriginationDate;
    f_OrderCancelReplaceRequest_TradeDate;
    f_OrderCancelReplaceRequest_OrigClOrdID;
    f_OrderCancelReplaceRequest_ClOrdID;
    f_OrderCancelReplaceRequest_SecondaryClOrdID;
    f_OrderCancelReplaceRequest_ClOrdLinkID;
    f_OrderCancelReplaceRequest_ListID;
    f_OrderCancelReplaceRequest_OrigOrdModTime;
    f_OrderCancelReplaceRequest_Account;
    f_OrderCancelReplaceRequest_AcctIDSource;
    f_OrderCancelReplaceRequest_AccountType;
    f_OrderCancelReplaceRequest_DayBookingInst;
    f_OrderCancelReplaceRequest_BookingUnit;
    f_OrderCancelReplaceRequest_PreallocMethod;
    f_OrderCancelReplaceRequest_AllocID;
    f_OrderCancelReplaceRequest_SettlType;
    f_OrderCancelReplaceRequest_SettlDate;
    f_OrderCancelReplaceRequest_CashMargin;
    f_OrderCancelReplaceRequest_ClearingFeeIndicator;
    f_OrderCancelReplaceRequest_HandlInst;
    f_OrderCancelReplaceRequest_ExecInst;
    f_OrderCancelReplaceRequest_MinQty;
    f_OrderCancelReplaceRequest_MaxFloor;
    f_OrderCancelReplaceRequest_ExDestination;
    f_OrderCancelReplaceRequest_Side;
    f_OrderCancelReplaceRequest_TransactTime;
    f_OrderCancelReplaceRequest_QtyType;
    f_OrderCancelReplaceRequest_OrdType;
    f_OrderCancelReplaceRequest_PriceType;
    f_OrderCancelReplaceRequest_Price;
    f_OrderCancelReplaceRequest_StopPx;
    f_OrderCancelReplaceRequest_TargetStrategy;
    f_OrderCancelReplaceRequest_TargetStrategyParameters;
    f_OrderCancelReplaceRequest_ParticipationRate;
    f_OrderCancelReplaceRequest_ComplianceID;
    f_OrderCancelReplaceRequest_SolicitedFlag;
    f_OrderCancelReplaceRequest_Currency;
    f_OrderCancelReplaceRequest_TimeInForce;
    f_OrderCancelReplaceRequest_EffectiveTime;
    f_OrderCancelReplaceRequest_ExpireDate;
    f_OrderCancelReplaceRequest_ExpireTime;
    f_OrderCancelReplaceRequest_GTBookingInst;
    f_OrderCancelReplaceRequest_OrderCapacity;
    f_OrderCancelReplaceRequest_OrderRestrictions;
    f_OrderCancelReplaceRequest_CustOrderCapacity;
    f_OrderCancelReplaceRequest_ForexReq;
    f_OrderCancelReplaceRequest_SettlCurrency;
    f_OrderCancelReplaceRequest_BookingType;
    f_OrderCancelReplaceRequest_Text;
    f_OrderCancelReplaceRequest_EncodedTextLen;
    f_OrderCancelReplaceRequest_EncodedText;
    f_OrderCancelReplaceRequest_SettlDate2;
    f_OrderCancelReplaceRequest_OrderQty2;
    f_OrderCancelReplaceRequest_Price2;
    f_OrderCancelReplaceRequest_PositionEffect;
    f_OrderCancelReplaceRequest_CoveredOrUncovered;
    f_OrderCancelReplaceRequest_MaxShow;
    f_OrderCancelReplaceRequest_LocateReqd;
    f_OrderCancelReplaceRequest_CancellationRights;
    f_OrderCancelReplaceRequest_MoneyLaunderingStatus;
    f_OrderCancelReplaceRequest_RegistID;
    f_OrderCancelReplaceRequest_Designation;
    } , msg ) |> check_unknown_tags;;

let parse_OrderCancelRequest msg = (
    repeating msg "453" parse_Parties @@ fun msg f_OrderCancelRequest_Parties ->
    repeating msg "711" parse_UndInstrmtGrp @@ fun msg f_OrderCancelRequest_UndInstrmtGrp ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_OrderCancelRequest_Instrument ->
    block msg  parse_FinancingDetails @@ fun msg f_OrderCancelRequest_FinancingDetails ->
    block msg  parse_OrderQtyData @@ fun msg f_OrderCancelRequest_OrderQtyData ->
    req msg "41" parse_string @@ fun msg f_OrderCancelRequest_OrigClOrdID ->
    opt msg "37" parse_string @@ fun msg f_OrderCancelRequest_OrderID ->
    req msg "11" parse_string @@ fun msg f_OrderCancelRequest_ClOrdID ->
    opt msg "526" parse_string @@ fun msg f_OrderCancelRequest_SecondaryClOrdID ->
    opt msg "583" parse_string @@ fun msg f_OrderCancelRequest_ClOrdLinkID ->
    opt msg "66" parse_string @@ fun msg f_OrderCancelRequest_ListID ->
    opt msg "586" parse_UTCTimestamp @@ fun msg f_OrderCancelRequest_OrigOrdModTime ->
    opt msg "1" parse_string @@ fun msg f_OrderCancelRequest_Account ->
    opt msg "660" parse_AcctIDSource @@ fun msg f_OrderCancelRequest_AcctIDSource ->
    opt msg "581" parse_AccountType @@ fun msg f_OrderCancelRequest_AccountType ->
    req msg "54" parse_Side @@ fun msg f_OrderCancelRequest_Side ->
    req msg "60" parse_UTCTimestamp @@ fun msg f_OrderCancelRequest_TransactTime ->
    opt msg "376" parse_string @@ fun msg f_OrderCancelRequest_ComplianceID ->
    opt msg "58" parse_string @@ fun msg f_OrderCancelRequest_Text ->
    opt msg "354" parse_int @@ fun msg f_OrderCancelRequest_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_OrderCancelRequest_EncodedText ->
    ParseSuccess {
    f_OrderCancelRequest_Parties;
    f_OrderCancelRequest_UndInstrmtGrp;
    f_OrderCancelRequest_Instrument;
    f_OrderCancelRequest_FinancingDetails;
    f_OrderCancelRequest_OrderQtyData;
    f_OrderCancelRequest_OrigClOrdID;
    f_OrderCancelRequest_OrderID;
    f_OrderCancelRequest_ClOrdID;
    f_OrderCancelRequest_SecondaryClOrdID;
    f_OrderCancelRequest_ClOrdLinkID;
    f_OrderCancelRequest_ListID;
    f_OrderCancelRequest_OrigOrdModTime;
    f_OrderCancelRequest_Account;
    f_OrderCancelRequest_AcctIDSource;
    f_OrderCancelRequest_AccountType;
    f_OrderCancelRequest_Side;
    f_OrderCancelRequest_TransactTime;
    f_OrderCancelRequest_ComplianceID;
    f_OrderCancelRequest_Text;
    f_OrderCancelRequest_EncodedTextLen;
    f_OrderCancelRequest_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_OrderMassCancelReport msg = (
    repeating msg "534" parse_AffectedOrdGrp @@ fun msg f_OrderMassCancelReport_AffectedOrdGrp ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_OrderMassCancelReport_Instrument ->
    block msg  parse_UnderlyingInstrument @@ fun msg f_OrderMassCancelReport_UnderlyingInstrument ->
    opt msg "11" parse_string @@ fun msg f_OrderMassCancelReport_ClOrdID ->
    opt msg "526" parse_string @@ fun msg f_OrderMassCancelReport_SecondaryClOrdID ->
    req msg "37" parse_string @@ fun msg f_OrderMassCancelReport_OrderID ->
    opt msg "198" parse_string @@ fun msg f_OrderMassCancelReport_SecondaryOrderID ->
    req msg "530" parse_MassCancelRequestType @@ fun msg f_OrderMassCancelReport_MassCancelRequestType ->
    req msg "531" parse_MassCancelResponse @@ fun msg f_OrderMassCancelReport_MassCancelResponse ->
    opt msg "532" parse_MassCancelRejectReason @@ fun msg f_OrderMassCancelReport_MassCancelRejectReason ->
    opt msg "533" parse_int @@ fun msg f_OrderMassCancelReport_TotalAffectedOrders ->
    opt msg "336" parse_string @@ fun msg f_OrderMassCancelReport_TradingSessionID ->
    opt msg "625" parse_string @@ fun msg f_OrderMassCancelReport_TradingSessionSubID ->
    opt msg "54" parse_Side @@ fun msg f_OrderMassCancelReport_Side ->
    opt msg "60" parse_UTCTimestamp @@ fun msg f_OrderMassCancelReport_TransactTime ->
    opt msg "58" parse_string @@ fun msg f_OrderMassCancelReport_Text ->
    opt msg "354" parse_int @@ fun msg f_OrderMassCancelReport_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_OrderMassCancelReport_EncodedText ->
    ParseSuccess {
    f_OrderMassCancelReport_AffectedOrdGrp;
    f_OrderMassCancelReport_Instrument;
    f_OrderMassCancelReport_UnderlyingInstrument;
    f_OrderMassCancelReport_ClOrdID;
    f_OrderMassCancelReport_SecondaryClOrdID;
    f_OrderMassCancelReport_OrderID;
    f_OrderMassCancelReport_SecondaryOrderID;
    f_OrderMassCancelReport_MassCancelRequestType;
    f_OrderMassCancelReport_MassCancelResponse;
    f_OrderMassCancelReport_MassCancelRejectReason;
    f_OrderMassCancelReport_TotalAffectedOrders;
    f_OrderMassCancelReport_TradingSessionID;
    f_OrderMassCancelReport_TradingSessionSubID;
    f_OrderMassCancelReport_Side;
    f_OrderMassCancelReport_TransactTime;
    f_OrderMassCancelReport_Text;
    f_OrderMassCancelReport_EncodedTextLen;
    f_OrderMassCancelReport_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_OrderMassCancelRequest msg = (
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_OrderMassCancelRequest_Instrument ->
    block msg  parse_UnderlyingInstrument @@ fun msg f_OrderMassCancelRequest_UnderlyingInstrument ->
    req msg "11" parse_string @@ fun msg f_OrderMassCancelRequest_ClOrdID ->
    opt msg "526" parse_string @@ fun msg f_OrderMassCancelRequest_SecondaryClOrdID ->
    req msg "530" parse_MassCancelRequestType @@ fun msg f_OrderMassCancelRequest_MassCancelRequestType ->
    opt msg "336" parse_string @@ fun msg f_OrderMassCancelRequest_TradingSessionID ->
    opt msg "625" parse_string @@ fun msg f_OrderMassCancelRequest_TradingSessionSubID ->
    opt msg "54" parse_Side @@ fun msg f_OrderMassCancelRequest_Side ->
    req msg "60" parse_UTCTimestamp @@ fun msg f_OrderMassCancelRequest_TransactTime ->
    opt msg "58" parse_string @@ fun msg f_OrderMassCancelRequest_Text ->
    opt msg "354" parse_int @@ fun msg f_OrderMassCancelRequest_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_OrderMassCancelRequest_EncodedText ->
    ParseSuccess {
    f_OrderMassCancelRequest_Instrument;
    f_OrderMassCancelRequest_UnderlyingInstrument;
    f_OrderMassCancelRequest_ClOrdID;
    f_OrderMassCancelRequest_SecondaryClOrdID;
    f_OrderMassCancelRequest_MassCancelRequestType;
    f_OrderMassCancelRequest_TradingSessionID;
    f_OrderMassCancelRequest_TradingSessionSubID;
    f_OrderMassCancelRequest_Side;
    f_OrderMassCancelRequest_TransactTime;
    f_OrderMassCancelRequest_Text;
    f_OrderMassCancelRequest_EncodedTextLen;
    f_OrderMassCancelRequest_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_OrderMassStatusRequest msg = (
    repeating msg "453" parse_Parties @@ fun msg f_OrderMassStatusRequest_Parties ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_OrderMassStatusRequest_Instrument ->
    block msg  parse_UnderlyingInstrument @@ fun msg f_OrderMassStatusRequest_UnderlyingInstrument ->
    req msg "584" parse_string @@ fun msg f_OrderMassStatusRequest_MassStatusReqID ->
    req msg "585" parse_MassStatusReqType @@ fun msg f_OrderMassStatusRequest_MassStatusReqType ->
    opt msg "1" parse_string @@ fun msg f_OrderMassStatusRequest_Account ->
    opt msg "660" parse_AcctIDSource @@ fun msg f_OrderMassStatusRequest_AcctIDSource ->
    opt msg "336" parse_string @@ fun msg f_OrderMassStatusRequest_TradingSessionID ->
    opt msg "625" parse_string @@ fun msg f_OrderMassStatusRequest_TradingSessionSubID ->
    opt msg "54" parse_Side @@ fun msg f_OrderMassStatusRequest_Side ->
    ParseSuccess {
    f_OrderMassStatusRequest_Parties;
    f_OrderMassStatusRequest_Instrument;
    f_OrderMassStatusRequest_UnderlyingInstrument;
    f_OrderMassStatusRequest_MassStatusReqID;
    f_OrderMassStatusRequest_MassStatusReqType;
    f_OrderMassStatusRequest_Account;
    f_OrderMassStatusRequest_AcctIDSource;
    f_OrderMassStatusRequest_TradingSessionID;
    f_OrderMassStatusRequest_TradingSessionSubID;
    f_OrderMassStatusRequest_Side;
    } , msg ) |> check_unknown_tags;;

let parse_OrderStatusRequest msg = (
    repeating msg "453" parse_Parties @@ fun msg f_OrderStatusRequest_Parties ->
    repeating msg "711" parse_UndInstrmtGrp @@ fun msg f_OrderStatusRequest_UndInstrmtGrp ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_OrderStatusRequest_Instrument ->
    block msg  parse_FinancingDetails @@ fun msg f_OrderStatusRequest_FinancingDetails ->
    opt msg "37" parse_string @@ fun msg f_OrderStatusRequest_OrderID ->
    req msg "11" parse_string @@ fun msg f_OrderStatusRequest_ClOrdID ->
    opt msg "526" parse_string @@ fun msg f_OrderStatusRequest_SecondaryClOrdID ->
    opt msg "583" parse_string @@ fun msg f_OrderStatusRequest_ClOrdLinkID ->
    opt msg "790" parse_string @@ fun msg f_OrderStatusRequest_OrdStatusReqID ->
    opt msg "1" parse_string @@ fun msg f_OrderStatusRequest_Account ->
    opt msg "660" parse_AcctIDSource @@ fun msg f_OrderStatusRequest_AcctIDSource ->
    req msg "54" parse_Side @@ fun msg f_OrderStatusRequest_Side ->
    ParseSuccess {
    f_OrderStatusRequest_Parties;
    f_OrderStatusRequest_UndInstrmtGrp;
    f_OrderStatusRequest_Instrument;
    f_OrderStatusRequest_FinancingDetails;
    f_OrderStatusRequest_OrderID;
    f_OrderStatusRequest_ClOrdID;
    f_OrderStatusRequest_SecondaryClOrdID;
    f_OrderStatusRequest_ClOrdLinkID;
    f_OrderStatusRequest_OrdStatusReqID;
    f_OrderStatusRequest_Account;
    f_OrderStatusRequest_AcctIDSource;
    f_OrderStatusRequest_Side;
    } , msg ) |> check_unknown_tags;;

let parse_PositionMaintenanceReport msg = (
    repeating msg "453" parse_Parties @@ fun msg f_PositionMaintenanceReport_Parties ->
    repeating msg "555" parse_InstrmtLegGrp @@ fun msg f_PositionMaintenanceReport_InstrmtLegGrp ->
    repeating msg "711" parse_UndInstrmtGrp @@ fun msg f_PositionMaintenanceReport_UndInstrmtGrp ->
    repeating msg "386" parse_TrdgSesGrp @@ fun msg f_PositionMaintenanceReport_TrdgSesGrp ->
    repeating msg "702" parse_PositionQty @@ fun msg f_PositionMaintenanceReport_PositionQty ->
    repeating msg "753" parse_PositionAmountData @@ fun msg f_PositionMaintenanceReport_PositionAmountData ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_PositionMaintenanceReport_Instrument ->
    req msg "721" parse_string @@ fun msg f_PositionMaintenanceReport_PosMaintRptID ->
    req msg "709" parse_PosTransType @@ fun msg f_PositionMaintenanceReport_PosTransType ->
    opt msg "710" parse_string @@ fun msg f_PositionMaintenanceReport_PosReqID ->
    req msg "712" parse_PosMaintAction @@ fun msg f_PositionMaintenanceReport_PosMaintAction ->
    req msg "713" parse_string @@ fun msg f_PositionMaintenanceReport_OrigPosReqRefID ->
    req msg "722" parse_PosMaintStatus @@ fun msg f_PositionMaintenanceReport_PosMaintStatus ->
    opt msg "723" parse_PosMaintResult @@ fun msg f_PositionMaintenanceReport_PosMaintResult ->
    req msg "715" parse_LocalMktDate @@ fun msg f_PositionMaintenanceReport_ClearingBusinessDate ->
    opt msg "716" parse_SettlSessID @@ fun msg f_PositionMaintenanceReport_SettlSessID ->
    opt msg "717" parse_string @@ fun msg f_PositionMaintenanceReport_SettlSessSubID ->
    req msg "1" parse_string @@ fun msg f_PositionMaintenanceReport_Account ->
    opt msg "660" parse_AcctIDSource @@ fun msg f_PositionMaintenanceReport_AcctIDSource ->
    req msg "581" parse_AccountType @@ fun msg f_PositionMaintenanceReport_AccountType ->
    opt msg "15" parse_Currency @@ fun msg f_PositionMaintenanceReport_Currency ->
    req msg "60" parse_UTCTimestamp @@ fun msg f_PositionMaintenanceReport_TransactTime ->
    opt msg "718" parse_AdjustmentType @@ fun msg f_PositionMaintenanceReport_AdjustmentType ->
    opt msg "834" parse_float @@ fun msg f_PositionMaintenanceReport_ThresholdAmount ->
    opt msg "58" parse_string @@ fun msg f_PositionMaintenanceReport_Text ->
    opt msg "354" parse_int @@ fun msg f_PositionMaintenanceReport_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_PositionMaintenanceReport_EncodedText ->
    ParseSuccess {
    f_PositionMaintenanceReport_Parties;
    f_PositionMaintenanceReport_InstrmtLegGrp;
    f_PositionMaintenanceReport_UndInstrmtGrp;
    f_PositionMaintenanceReport_TrdgSesGrp;
    f_PositionMaintenanceReport_PositionQty;
    f_PositionMaintenanceReport_PositionAmountData;
    f_PositionMaintenanceReport_Instrument;
    f_PositionMaintenanceReport_PosMaintRptID;
    f_PositionMaintenanceReport_PosTransType;
    f_PositionMaintenanceReport_PosReqID;
    f_PositionMaintenanceReport_PosMaintAction;
    f_PositionMaintenanceReport_OrigPosReqRefID;
    f_PositionMaintenanceReport_PosMaintStatus;
    f_PositionMaintenanceReport_PosMaintResult;
    f_PositionMaintenanceReport_ClearingBusinessDate;
    f_PositionMaintenanceReport_SettlSessID;
    f_PositionMaintenanceReport_SettlSessSubID;
    f_PositionMaintenanceReport_Account;
    f_PositionMaintenanceReport_AcctIDSource;
    f_PositionMaintenanceReport_AccountType;
    f_PositionMaintenanceReport_Currency;
    f_PositionMaintenanceReport_TransactTime;
    f_PositionMaintenanceReport_AdjustmentType;
    f_PositionMaintenanceReport_ThresholdAmount;
    f_PositionMaintenanceReport_Text;
    f_PositionMaintenanceReport_EncodedTextLen;
    f_PositionMaintenanceReport_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_PositionMaintenanceRequest msg = (
    repeating msg "453" parse_Parties @@ fun msg f_PositionMaintenanceRequest_Parties ->
    repeating msg "555" parse_InstrmtLegGrp @@ fun msg f_PositionMaintenanceRequest_InstrmtLegGrp ->
    repeating msg "711" parse_UndInstrmtGrp @@ fun msg f_PositionMaintenanceRequest_UndInstrmtGrp ->
    repeating msg "386" parse_TrdgSesGrp @@ fun msg f_PositionMaintenanceRequest_TrdgSesGrp ->
    repeating msg "702" parse_PositionQty @@ fun msg f_PositionMaintenanceRequest_PositionQty ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_PositionMaintenanceRequest_Instrument ->
    req msg "710" parse_string @@ fun msg f_PositionMaintenanceRequest_PosReqID ->
    req msg "709" parse_PosTransType @@ fun msg f_PositionMaintenanceRequest_PosTransType ->
    req msg "712" parse_PosMaintAction @@ fun msg f_PositionMaintenanceRequest_PosMaintAction ->
    opt msg "713" parse_string @@ fun msg f_PositionMaintenanceRequest_OrigPosReqRefID ->
    opt msg "714" parse_string @@ fun msg f_PositionMaintenanceRequest_PosMaintRptRefID ->
    req msg "715" parse_LocalMktDate @@ fun msg f_PositionMaintenanceRequest_ClearingBusinessDate ->
    opt msg "716" parse_SettlSessID @@ fun msg f_PositionMaintenanceRequest_SettlSessID ->
    opt msg "717" parse_string @@ fun msg f_PositionMaintenanceRequest_SettlSessSubID ->
    req msg "1" parse_string @@ fun msg f_PositionMaintenanceRequest_Account ->
    opt msg "660" parse_AcctIDSource @@ fun msg f_PositionMaintenanceRequest_AcctIDSource ->
    req msg "581" parse_AccountType @@ fun msg f_PositionMaintenanceRequest_AccountType ->
    opt msg "15" parse_Currency @@ fun msg f_PositionMaintenanceRequest_Currency ->
    req msg "60" parse_UTCTimestamp @@ fun msg f_PositionMaintenanceRequest_TransactTime ->
    opt msg "718" parse_AdjustmentType @@ fun msg f_PositionMaintenanceRequest_AdjustmentType ->
    opt msg "719" parse_bool @@ fun msg f_PositionMaintenanceRequest_ContraryInstructionIndicator ->
    opt msg "720" parse_bool @@ fun msg f_PositionMaintenanceRequest_PriorSpreadIndicator ->
    opt msg "834" parse_float @@ fun msg f_PositionMaintenanceRequest_ThresholdAmount ->
    opt msg "58" parse_string @@ fun msg f_PositionMaintenanceRequest_Text ->
    opt msg "354" parse_int @@ fun msg f_PositionMaintenanceRequest_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_PositionMaintenanceRequest_EncodedText ->
    ParseSuccess {
    f_PositionMaintenanceRequest_Parties;
    f_PositionMaintenanceRequest_InstrmtLegGrp;
    f_PositionMaintenanceRequest_UndInstrmtGrp;
    f_PositionMaintenanceRequest_TrdgSesGrp;
    f_PositionMaintenanceRequest_PositionQty;
    f_PositionMaintenanceRequest_Instrument;
    f_PositionMaintenanceRequest_PosReqID;
    f_PositionMaintenanceRequest_PosTransType;
    f_PositionMaintenanceRequest_PosMaintAction;
    f_PositionMaintenanceRequest_OrigPosReqRefID;
    f_PositionMaintenanceRequest_PosMaintRptRefID;
    f_PositionMaintenanceRequest_ClearingBusinessDate;
    f_PositionMaintenanceRequest_SettlSessID;
    f_PositionMaintenanceRequest_SettlSessSubID;
    f_PositionMaintenanceRequest_Account;
    f_PositionMaintenanceRequest_AcctIDSource;
    f_PositionMaintenanceRequest_AccountType;
    f_PositionMaintenanceRequest_Currency;
    f_PositionMaintenanceRequest_TransactTime;
    f_PositionMaintenanceRequest_AdjustmentType;
    f_PositionMaintenanceRequest_ContraryInstructionIndicator;
    f_PositionMaintenanceRequest_PriorSpreadIndicator;
    f_PositionMaintenanceRequest_ThresholdAmount;
    f_PositionMaintenanceRequest_Text;
    f_PositionMaintenanceRequest_EncodedTextLen;
    f_PositionMaintenanceRequest_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_PositionReport msg = (
    repeating msg "453" parse_Parties @@ fun msg f_PositionReport_Parties ->
    repeating msg "555" parse_InstrmtLegGrp @@ fun msg f_PositionReport_InstrmtLegGrp ->
    repeating msg "711" parse_PosUndInstrmtGrp @@ fun msg f_PositionReport_PosUndInstrmtGrp ->
    repeating msg "702" parse_PositionQty @@ fun msg f_PositionReport_PositionQty ->
    repeating msg "753" parse_PositionAmountData @@ fun msg f_PositionReport_PositionAmountData ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_PositionReport_Instrument ->
    req msg "721" parse_string @@ fun msg f_PositionReport_PosMaintRptID ->
    opt msg "710" parse_string @@ fun msg f_PositionReport_PosReqID ->
    opt msg "724" parse_PosReqType @@ fun msg f_PositionReport_PosReqType ->
    opt msg "263" parse_SubscriptionRequestType @@ fun msg f_PositionReport_SubscriptionRequestType ->
    opt msg "727" parse_int @@ fun msg f_PositionReport_TotalNumPosReports ->
    opt msg "325" parse_UnsolicitedIndicator @@ fun msg f_PositionReport_UnsolicitedIndicator ->
    req msg "728" parse_PosReqResult @@ fun msg f_PositionReport_PosReqResult ->
    req msg "715" parse_LocalMktDate @@ fun msg f_PositionReport_ClearingBusinessDate ->
    opt msg "716" parse_SettlSessID @@ fun msg f_PositionReport_SettlSessID ->
    opt msg "717" parse_string @@ fun msg f_PositionReport_SettlSessSubID ->
    req msg "1" parse_string @@ fun msg f_PositionReport_Account ->
    opt msg "660" parse_AcctIDSource @@ fun msg f_PositionReport_AcctIDSource ->
    req msg "581" parse_AccountType @@ fun msg f_PositionReport_AccountType ->
    opt msg "15" parse_Currency @@ fun msg f_PositionReport_Currency ->
    req msg "730" parse_float @@ fun msg f_PositionReport_SettlPrice ->
    req msg "731" parse_SettlPriceType @@ fun msg f_PositionReport_SettlPriceType ->
    req msg "734" parse_float @@ fun msg f_PositionReport_PriorSettlPrice ->
    opt msg "506" parse_RegistStatus @@ fun msg f_PositionReport_RegistStatus ->
    opt msg "743" parse_LocalMktDate @@ fun msg f_PositionReport_DeliveryDate ->
    opt msg "58" parse_string @@ fun msg f_PositionReport_Text ->
    opt msg "354" parse_int @@ fun msg f_PositionReport_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_PositionReport_EncodedText ->
    ParseSuccess {
    f_PositionReport_Parties;
    f_PositionReport_InstrmtLegGrp;
    f_PositionReport_PosUndInstrmtGrp;
    f_PositionReport_PositionQty;
    f_PositionReport_PositionAmountData;
    f_PositionReport_Instrument;
    f_PositionReport_PosMaintRptID;
    f_PositionReport_PosReqID;
    f_PositionReport_PosReqType;
    f_PositionReport_SubscriptionRequestType;
    f_PositionReport_TotalNumPosReports;
    f_PositionReport_UnsolicitedIndicator;
    f_PositionReport_PosReqResult;
    f_PositionReport_ClearingBusinessDate;
    f_PositionReport_SettlSessID;
    f_PositionReport_SettlSessSubID;
    f_PositionReport_Account;
    f_PositionReport_AcctIDSource;
    f_PositionReport_AccountType;
    f_PositionReport_Currency;
    f_PositionReport_SettlPrice;
    f_PositionReport_SettlPriceType;
    f_PositionReport_PriorSettlPrice;
    f_PositionReport_RegistStatus;
    f_PositionReport_DeliveryDate;
    f_PositionReport_Text;
    f_PositionReport_EncodedTextLen;
    f_PositionReport_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_Quote msg = (
    repeating msg "735" parse_QuotQualGrp @@ fun msg f_Quote_QuotQualGrp ->
    repeating msg "453" parse_Parties @@ fun msg f_Quote_Parties ->
    repeating msg "711" parse_UndInstrmtGrp @@ fun msg f_Quote_UndInstrmtGrp ->
    repeating msg "232" parse_Stipulations @@ fun msg f_Quote_Stipulations ->
    repeating msg "555" parse_LegQuotGrp @@ fun msg f_Quote_LegQuotGrp ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_Quote_Instrument ->
    block msg  parse_FinancingDetails @@ fun msg f_Quote_FinancingDetails ->
    block msg  parse_OrderQtyData @@ fun msg f_Quote_OrderQtyData ->
    block msg  parse_SpreadOrBenchmarkCurveData @@ fun msg f_Quote_SpreadOrBenchmarkCurveData ->
    block msg  parse_YieldData @@ fun msg f_Quote_YieldData ->
    opt msg "131" parse_string @@ fun msg f_Quote_QuoteReqID ->
    req msg "117" parse_string @@ fun msg f_Quote_QuoteID ->
    opt msg "693" parse_string @@ fun msg f_Quote_QuoteRespID ->
    opt msg "537" parse_QuoteType @@ fun msg f_Quote_QuoteType ->
    opt msg "301" parse_QuoteResponseLevel @@ fun msg f_Quote_QuoteResponseLevel ->
    opt msg "336" parse_string @@ fun msg f_Quote_TradingSessionID ->
    opt msg "625" parse_string @@ fun msg f_Quote_TradingSessionSubID ->
    opt msg "54" parse_Side @@ fun msg f_Quote_Side ->
    opt msg "63" parse_SettlType @@ fun msg f_Quote_SettlType ->
    opt msg "64" parse_LocalMktDate @@ fun msg f_Quote_SettlDate ->
    opt msg "193" parse_LocalMktDate @@ fun msg f_Quote_SettlDate2 ->
    opt msg "192" parse_float @@ fun msg f_Quote_OrderQty2 ->
    opt msg "15" parse_Currency @@ fun msg f_Quote_Currency ->
    opt msg "1" parse_string @@ fun msg f_Quote_Account ->
    opt msg "660" parse_AcctIDSource @@ fun msg f_Quote_AcctIDSource ->
    opt msg "581" parse_AccountType @@ fun msg f_Quote_AccountType ->
    opt msg "132" parse_float @@ fun msg f_Quote_BidPx ->
    opt msg "133" parse_float @@ fun msg f_Quote_OfferPx ->
    opt msg "645" parse_float @@ fun msg f_Quote_MktBidPx ->
    opt msg "646" parse_float @@ fun msg f_Quote_MktOfferPx ->
    opt msg "647" parse_float @@ fun msg f_Quote_MinBidSize ->
    opt msg "134" parse_float @@ fun msg f_Quote_BidSize ->
    opt msg "648" parse_float @@ fun msg f_Quote_MinOfferSize ->
    opt msg "135" parse_float @@ fun msg f_Quote_OfferSize ->
    opt msg "62" parse_UTCTimestamp @@ fun msg f_Quote_ValidUntilTime ->
    opt msg "188" parse_float @@ fun msg f_Quote_BidSpotRate ->
    opt msg "190" parse_float @@ fun msg f_Quote_OfferSpotRate ->
    opt msg "189" parse_float @@ fun msg f_Quote_BidForwardPoints ->
    opt msg "191" parse_float @@ fun msg f_Quote_OfferForwardPoints ->
    opt msg "631" parse_float @@ fun msg f_Quote_MidPx ->
    opt msg "632" parse_float @@ fun msg f_Quote_BidYield ->
    opt msg "633" parse_float @@ fun msg f_Quote_MidYield ->
    opt msg "634" parse_float @@ fun msg f_Quote_OfferYield ->
    opt msg "60" parse_UTCTimestamp @@ fun msg f_Quote_TransactTime ->
    opt msg "40" parse_OrdType @@ fun msg f_Quote_OrdType ->
    opt msg "642" parse_float @@ fun msg f_Quote_BidForwardPoints2 ->
    opt msg "643" parse_float @@ fun msg f_Quote_OfferForwardPoints2 ->
    opt msg "656" parse_float @@ fun msg f_Quote_SettlCurrBidFxRate ->
    opt msg "657" parse_float @@ fun msg f_Quote_SettlCurrOfferFxRate ->
    opt msg "156" parse_SettlCurrFxRateCalc @@ fun msg f_Quote_SettlCurrFxRateCalc ->
    opt msg "13" parse_CommType @@ fun msg f_Quote_CommType ->
    opt msg "12" parse_float @@ fun msg f_Quote_Commission ->
    opt msg "582" parse_CustOrderCapacity @@ fun msg f_Quote_CustOrderCapacity ->
    opt msg "100" parse_Exchange @@ fun msg f_Quote_ExDestination ->
    opt msg "528" parse_OrderCapacity @@ fun msg f_Quote_OrderCapacity ->
    opt msg "423" parse_PriceType @@ fun msg f_Quote_PriceType ->
    opt msg "58" parse_string @@ fun msg f_Quote_Text ->
    opt msg "354" parse_int @@ fun msg f_Quote_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_Quote_EncodedText ->
    ParseSuccess {
    f_Quote_QuotQualGrp;
    f_Quote_Parties;
    f_Quote_UndInstrmtGrp;
    f_Quote_Stipulations;
    f_Quote_LegQuotGrp;
    f_Quote_Instrument;
    f_Quote_FinancingDetails;
    f_Quote_OrderQtyData;
    f_Quote_SpreadOrBenchmarkCurveData;
    f_Quote_YieldData;
    f_Quote_QuoteReqID;
    f_Quote_QuoteID;
    f_Quote_QuoteRespID;
    f_Quote_QuoteType;
    f_Quote_QuoteResponseLevel;
    f_Quote_TradingSessionID;
    f_Quote_TradingSessionSubID;
    f_Quote_Side;
    f_Quote_SettlType;
    f_Quote_SettlDate;
    f_Quote_SettlDate2;
    f_Quote_OrderQty2;
    f_Quote_Currency;
    f_Quote_Account;
    f_Quote_AcctIDSource;
    f_Quote_AccountType;
    f_Quote_BidPx;
    f_Quote_OfferPx;
    f_Quote_MktBidPx;
    f_Quote_MktOfferPx;
    f_Quote_MinBidSize;
    f_Quote_BidSize;
    f_Quote_MinOfferSize;
    f_Quote_OfferSize;
    f_Quote_ValidUntilTime;
    f_Quote_BidSpotRate;
    f_Quote_OfferSpotRate;
    f_Quote_BidForwardPoints;
    f_Quote_OfferForwardPoints;
    f_Quote_MidPx;
    f_Quote_BidYield;
    f_Quote_MidYield;
    f_Quote_OfferYield;
    f_Quote_TransactTime;
    f_Quote_OrdType;
    f_Quote_BidForwardPoints2;
    f_Quote_OfferForwardPoints2;
    f_Quote_SettlCurrBidFxRate;
    f_Quote_SettlCurrOfferFxRate;
    f_Quote_SettlCurrFxRateCalc;
    f_Quote_CommType;
    f_Quote_Commission;
    f_Quote_CustOrderCapacity;
    f_Quote_ExDestination;
    f_Quote_OrderCapacity;
    f_Quote_PriceType;
    f_Quote_Text;
    f_Quote_EncodedTextLen;
    f_Quote_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_QuoteCancel msg = (
    repeating msg "453" parse_Parties @@ fun msg f_QuoteCancel_Parties ->
    repeating msg "295" parse_QuotCxlEntriesGrp @@ fun msg f_QuoteCancel_QuotCxlEntriesGrp ->
    check_duplicate_tags msg @@ fun () ->
    opt msg "131" parse_string @@ fun msg f_QuoteCancel_QuoteReqID ->
    req msg "117" parse_string @@ fun msg f_QuoteCancel_QuoteID ->
    req msg "298" parse_QuoteCancelType @@ fun msg f_QuoteCancel_QuoteCancelType ->
    opt msg "301" parse_QuoteResponseLevel @@ fun msg f_QuoteCancel_QuoteResponseLevel ->
    opt msg "1" parse_string @@ fun msg f_QuoteCancel_Account ->
    opt msg "660" parse_AcctIDSource @@ fun msg f_QuoteCancel_AcctIDSource ->
    opt msg "581" parse_AccountType @@ fun msg f_QuoteCancel_AccountType ->
    opt msg "336" parse_string @@ fun msg f_QuoteCancel_TradingSessionID ->
    opt msg "625" parse_string @@ fun msg f_QuoteCancel_TradingSessionSubID ->
    ParseSuccess {
    f_QuoteCancel_Parties;
    f_QuoteCancel_QuotCxlEntriesGrp;
    f_QuoteCancel_QuoteReqID;
    f_QuoteCancel_QuoteID;
    f_QuoteCancel_QuoteCancelType;
    f_QuoteCancel_QuoteResponseLevel;
    f_QuoteCancel_Account;
    f_QuoteCancel_AcctIDSource;
    f_QuoteCancel_AccountType;
    f_QuoteCancel_TradingSessionID;
    f_QuoteCancel_TradingSessionSubID;
    } , msg ) |> check_unknown_tags;;

let parse_QuoteRequest msg = (
    repeating msg "146" parse_QuotReqGrp @@ fun msg f_QuoteRequest_QuotReqGrp ->
    check_duplicate_tags msg @@ fun () ->
    req msg "131" parse_string @@ fun msg f_QuoteRequest_QuoteReqID ->
    opt msg "644" parse_string @@ fun msg f_QuoteRequest_RFQReqID ->
    opt msg "11" parse_string @@ fun msg f_QuoteRequest_ClOrdID ->
    opt msg "528" parse_OrderCapacity @@ fun msg f_QuoteRequest_OrderCapacity ->
    opt msg "58" parse_string @@ fun msg f_QuoteRequest_Text ->
    opt msg "354" parse_int @@ fun msg f_QuoteRequest_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_QuoteRequest_EncodedText ->
    ParseSuccess {
    f_QuoteRequest_QuotReqGrp;
    f_QuoteRequest_QuoteReqID;
    f_QuoteRequest_RFQReqID;
    f_QuoteRequest_ClOrdID;
    f_QuoteRequest_OrderCapacity;
    f_QuoteRequest_Text;
    f_QuoteRequest_EncodedTextLen;
    f_QuoteRequest_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_QuoteRequestReject msg = (
    repeating msg "146" parse_QuotReqRjctGrp @@ fun msg f_QuoteRequestReject_QuotReqRjctGrp ->
    check_duplicate_tags msg @@ fun () ->
    req msg "131" parse_string @@ fun msg f_QuoteRequestReject_QuoteReqID ->
    opt msg "644" parse_string @@ fun msg f_QuoteRequestReject_RFQReqID ->
    req msg "658" parse_QuoteRequestRejectReason @@ fun msg f_QuoteRequestReject_QuoteRequestRejectReason ->
    opt msg "58" parse_string @@ fun msg f_QuoteRequestReject_Text ->
    opt msg "354" parse_int @@ fun msg f_QuoteRequestReject_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_QuoteRequestReject_EncodedText ->
    ParseSuccess {
    f_QuoteRequestReject_QuotReqRjctGrp;
    f_QuoteRequestReject_QuoteReqID;
    f_QuoteRequestReject_RFQReqID;
    f_QuoteRequestReject_QuoteRequestRejectReason;
    f_QuoteRequestReject_Text;
    f_QuoteRequestReject_EncodedTextLen;
    f_QuoteRequestReject_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_QuoteResponse msg = (
    repeating msg "735" parse_QuotQualGrp @@ fun msg f_QuoteResponse_QuotQualGrp ->
    repeating msg "453" parse_Parties @@ fun msg f_QuoteResponse_Parties ->
    repeating msg "711" parse_UndInstrmtGrp @@ fun msg f_QuoteResponse_UndInstrmtGrp ->
    repeating msg "232" parse_Stipulations @@ fun msg f_QuoteResponse_Stipulations ->
    repeating msg "555" parse_LegQuotGrp @@ fun msg f_QuoteResponse_LegQuotGrp ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_QuoteResponse_Instrument ->
    block msg  parse_FinancingDetails @@ fun msg f_QuoteResponse_FinancingDetails ->
    block msg  parse_OrderQtyData @@ fun msg f_QuoteResponse_OrderQtyData ->
    block msg  parse_SpreadOrBenchmarkCurveData @@ fun msg f_QuoteResponse_SpreadOrBenchmarkCurveData ->
    block msg  parse_YieldData @@ fun msg f_QuoteResponse_YieldData ->
    req msg "693" parse_string @@ fun msg f_QuoteResponse_QuoteRespID ->
    opt msg "117" parse_string @@ fun msg f_QuoteResponse_QuoteID ->
    req msg "694" parse_QuoteRespType @@ fun msg f_QuoteResponse_QuoteRespType ->
    opt msg "11" parse_string @@ fun msg f_QuoteResponse_ClOrdID ->
    opt msg "528" parse_OrderCapacity @@ fun msg f_QuoteResponse_OrderCapacity ->
    opt msg "23" parse_string @@ fun msg f_QuoteResponse_IOIID ->
    opt msg "537" parse_QuoteType @@ fun msg f_QuoteResponse_QuoteType ->
    opt msg "336" parse_string @@ fun msg f_QuoteResponse_TradingSessionID ->
    opt msg "625" parse_string @@ fun msg f_QuoteResponse_TradingSessionSubID ->
    opt msg "54" parse_Side @@ fun msg f_QuoteResponse_Side ->
    opt msg "63" parse_SettlType @@ fun msg f_QuoteResponse_SettlType ->
    opt msg "64" parse_LocalMktDate @@ fun msg f_QuoteResponse_SettlDate ->
    opt msg "193" parse_LocalMktDate @@ fun msg f_QuoteResponse_SettlDate2 ->
    opt msg "192" parse_float @@ fun msg f_QuoteResponse_OrderQty2 ->
    opt msg "15" parse_Currency @@ fun msg f_QuoteResponse_Currency ->
    opt msg "1" parse_string @@ fun msg f_QuoteResponse_Account ->
    opt msg "660" parse_AcctIDSource @@ fun msg f_QuoteResponse_AcctIDSource ->
    opt msg "581" parse_AccountType @@ fun msg f_QuoteResponse_AccountType ->
    opt msg "132" parse_float @@ fun msg f_QuoteResponse_BidPx ->
    opt msg "133" parse_float @@ fun msg f_QuoteResponse_OfferPx ->
    opt msg "645" parse_float @@ fun msg f_QuoteResponse_MktBidPx ->
    opt msg "646" parse_float @@ fun msg f_QuoteResponse_MktOfferPx ->
    opt msg "647" parse_float @@ fun msg f_QuoteResponse_MinBidSize ->
    opt msg "134" parse_float @@ fun msg f_QuoteResponse_BidSize ->
    opt msg "648" parse_float @@ fun msg f_QuoteResponse_MinOfferSize ->
    opt msg "135" parse_float @@ fun msg f_QuoteResponse_OfferSize ->
    opt msg "62" parse_UTCTimestamp @@ fun msg f_QuoteResponse_ValidUntilTime ->
    opt msg "188" parse_float @@ fun msg f_QuoteResponse_BidSpotRate ->
    opt msg "190" parse_float @@ fun msg f_QuoteResponse_OfferSpotRate ->
    opt msg "189" parse_float @@ fun msg f_QuoteResponse_BidForwardPoints ->
    opt msg "191" parse_float @@ fun msg f_QuoteResponse_OfferForwardPoints ->
    opt msg "631" parse_float @@ fun msg f_QuoteResponse_MidPx ->
    opt msg "632" parse_float @@ fun msg f_QuoteResponse_BidYield ->
    opt msg "633" parse_float @@ fun msg f_QuoteResponse_MidYield ->
    opt msg "634" parse_float @@ fun msg f_QuoteResponse_OfferYield ->
    opt msg "60" parse_UTCTimestamp @@ fun msg f_QuoteResponse_TransactTime ->
    opt msg "40" parse_OrdType @@ fun msg f_QuoteResponse_OrdType ->
    opt msg "642" parse_float @@ fun msg f_QuoteResponse_BidForwardPoints2 ->
    opt msg "643" parse_float @@ fun msg f_QuoteResponse_OfferForwardPoints2 ->
    opt msg "656" parse_float @@ fun msg f_QuoteResponse_SettlCurrBidFxRate ->
    opt msg "657" parse_float @@ fun msg f_QuoteResponse_SettlCurrOfferFxRate ->
    opt msg "156" parse_SettlCurrFxRateCalc @@ fun msg f_QuoteResponse_SettlCurrFxRateCalc ->
    opt msg "12" parse_float @@ fun msg f_QuoteResponse_Commission ->
    opt msg "13" parse_CommType @@ fun msg f_QuoteResponse_CommType ->
    opt msg "582" parse_CustOrderCapacity @@ fun msg f_QuoteResponse_CustOrderCapacity ->
    opt msg "100" parse_Exchange @@ fun msg f_QuoteResponse_ExDestination ->
    opt msg "58" parse_string @@ fun msg f_QuoteResponse_Text ->
    opt msg "354" parse_int @@ fun msg f_QuoteResponse_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_QuoteResponse_EncodedText ->
    opt msg "44" parse_float @@ fun msg f_QuoteResponse_Price ->
    opt msg "423" parse_PriceType @@ fun msg f_QuoteResponse_PriceType ->
    ParseSuccess {
    f_QuoteResponse_QuotQualGrp;
    f_QuoteResponse_Parties;
    f_QuoteResponse_UndInstrmtGrp;
    f_QuoteResponse_Stipulations;
    f_QuoteResponse_LegQuotGrp;
    f_QuoteResponse_Instrument;
    f_QuoteResponse_FinancingDetails;
    f_QuoteResponse_OrderQtyData;
    f_QuoteResponse_SpreadOrBenchmarkCurveData;
    f_QuoteResponse_YieldData;
    f_QuoteResponse_QuoteRespID;
    f_QuoteResponse_QuoteID;
    f_QuoteResponse_QuoteRespType;
    f_QuoteResponse_ClOrdID;
    f_QuoteResponse_OrderCapacity;
    f_QuoteResponse_IOIID;
    f_QuoteResponse_QuoteType;
    f_QuoteResponse_TradingSessionID;
    f_QuoteResponse_TradingSessionSubID;
    f_QuoteResponse_Side;
    f_QuoteResponse_SettlType;
    f_QuoteResponse_SettlDate;
    f_QuoteResponse_SettlDate2;
    f_QuoteResponse_OrderQty2;
    f_QuoteResponse_Currency;
    f_QuoteResponse_Account;
    f_QuoteResponse_AcctIDSource;
    f_QuoteResponse_AccountType;
    f_QuoteResponse_BidPx;
    f_QuoteResponse_OfferPx;
    f_QuoteResponse_MktBidPx;
    f_QuoteResponse_MktOfferPx;
    f_QuoteResponse_MinBidSize;
    f_QuoteResponse_BidSize;
    f_QuoteResponse_MinOfferSize;
    f_QuoteResponse_OfferSize;
    f_QuoteResponse_ValidUntilTime;
    f_QuoteResponse_BidSpotRate;
    f_QuoteResponse_OfferSpotRate;
    f_QuoteResponse_BidForwardPoints;
    f_QuoteResponse_OfferForwardPoints;
    f_QuoteResponse_MidPx;
    f_QuoteResponse_BidYield;
    f_QuoteResponse_MidYield;
    f_QuoteResponse_OfferYield;
    f_QuoteResponse_TransactTime;
    f_QuoteResponse_OrdType;
    f_QuoteResponse_BidForwardPoints2;
    f_QuoteResponse_OfferForwardPoints2;
    f_QuoteResponse_SettlCurrBidFxRate;
    f_QuoteResponse_SettlCurrOfferFxRate;
    f_QuoteResponse_SettlCurrFxRateCalc;
    f_QuoteResponse_Commission;
    f_QuoteResponse_CommType;
    f_QuoteResponse_CustOrderCapacity;
    f_QuoteResponse_ExDestination;
    f_QuoteResponse_Text;
    f_QuoteResponse_EncodedTextLen;
    f_QuoteResponse_EncodedText;
    f_QuoteResponse_Price;
    f_QuoteResponse_PriceType;
    } , msg ) |> check_unknown_tags;;

let parse_QuoteStatusReport msg = (
    repeating msg "453" parse_Parties @@ fun msg f_QuoteStatusReport_Parties ->
    repeating msg "711" parse_UndInstrmtGrp @@ fun msg f_QuoteStatusReport_UndInstrmtGrp ->
    repeating msg "232" parse_Stipulations @@ fun msg f_QuoteStatusReport_Stipulations ->
    repeating msg "555" parse_LegQuotStatGrp @@ fun msg f_QuoteStatusReport_LegQuotStatGrp ->
    repeating msg "735" parse_QuotQualGrp @@ fun msg f_QuoteStatusReport_QuotQualGrp ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_QuoteStatusReport_Instrument ->
    block msg  parse_FinancingDetails @@ fun msg f_QuoteStatusReport_FinancingDetails ->
    block msg  parse_OrderQtyData @@ fun msg f_QuoteStatusReport_OrderQtyData ->
    block msg  parse_SpreadOrBenchmarkCurveData @@ fun msg f_QuoteStatusReport_SpreadOrBenchmarkCurveData ->
    block msg  parse_YieldData @@ fun msg f_QuoteStatusReport_YieldData ->
    opt msg "649" parse_string @@ fun msg f_QuoteStatusReport_QuoteStatusReqID ->
    opt msg "131" parse_string @@ fun msg f_QuoteStatusReport_QuoteReqID ->
    req msg "117" parse_string @@ fun msg f_QuoteStatusReport_QuoteID ->
    opt msg "693" parse_string @@ fun msg f_QuoteStatusReport_QuoteRespID ->
    opt msg "537" parse_QuoteType @@ fun msg f_QuoteStatusReport_QuoteType ->
    opt msg "336" parse_string @@ fun msg f_QuoteStatusReport_TradingSessionID ->
    opt msg "625" parse_string @@ fun msg f_QuoteStatusReport_TradingSessionSubID ->
    opt msg "54" parse_Side @@ fun msg f_QuoteStatusReport_Side ->
    opt msg "63" parse_SettlType @@ fun msg f_QuoteStatusReport_SettlType ->
    opt msg "64" parse_LocalMktDate @@ fun msg f_QuoteStatusReport_SettlDate ->
    opt msg "193" parse_LocalMktDate @@ fun msg f_QuoteStatusReport_SettlDate2 ->
    opt msg "192" parse_float @@ fun msg f_QuoteStatusReport_OrderQty2 ->
    opt msg "15" parse_Currency @@ fun msg f_QuoteStatusReport_Currency ->
    opt msg "1" parse_string @@ fun msg f_QuoteStatusReport_Account ->
    opt msg "660" parse_AcctIDSource @@ fun msg f_QuoteStatusReport_AcctIDSource ->
    opt msg "581" parse_AccountType @@ fun msg f_QuoteStatusReport_AccountType ->
    opt msg "126" parse_UTCTimestamp @@ fun msg f_QuoteStatusReport_ExpireTime ->
    opt msg "44" parse_float @@ fun msg f_QuoteStatusReport_Price ->
    opt msg "423" parse_PriceType @@ fun msg f_QuoteStatusReport_PriceType ->
    opt msg "132" parse_float @@ fun msg f_QuoteStatusReport_BidPx ->
    opt msg "133" parse_float @@ fun msg f_QuoteStatusReport_OfferPx ->
    opt msg "645" parse_float @@ fun msg f_QuoteStatusReport_MktBidPx ->
    opt msg "646" parse_float @@ fun msg f_QuoteStatusReport_MktOfferPx ->
    opt msg "647" parse_float @@ fun msg f_QuoteStatusReport_MinBidSize ->
    opt msg "134" parse_float @@ fun msg f_QuoteStatusReport_BidSize ->
    opt msg "648" parse_float @@ fun msg f_QuoteStatusReport_MinOfferSize ->
    opt msg "135" parse_float @@ fun msg f_QuoteStatusReport_OfferSize ->
    opt msg "62" parse_UTCTimestamp @@ fun msg f_QuoteStatusReport_ValidUntilTime ->
    opt msg "188" parse_float @@ fun msg f_QuoteStatusReport_BidSpotRate ->
    opt msg "190" parse_float @@ fun msg f_QuoteStatusReport_OfferSpotRate ->
    opt msg "189" parse_float @@ fun msg f_QuoteStatusReport_BidForwardPoints ->
    opt msg "191" parse_float @@ fun msg f_QuoteStatusReport_OfferForwardPoints ->
    opt msg "631" parse_float @@ fun msg f_QuoteStatusReport_MidPx ->
    opt msg "632" parse_float @@ fun msg f_QuoteStatusReport_BidYield ->
    opt msg "633" parse_float @@ fun msg f_QuoteStatusReport_MidYield ->
    opt msg "634" parse_float @@ fun msg f_QuoteStatusReport_OfferYield ->
    opt msg "60" parse_UTCTimestamp @@ fun msg f_QuoteStatusReport_TransactTime ->
    opt msg "40" parse_OrdType @@ fun msg f_QuoteStatusReport_OrdType ->
    opt msg "642" parse_float @@ fun msg f_QuoteStatusReport_BidForwardPoints2 ->
    opt msg "643" parse_float @@ fun msg f_QuoteStatusReport_OfferForwardPoints2 ->
    opt msg "656" parse_float @@ fun msg f_QuoteStatusReport_SettlCurrBidFxRate ->
    opt msg "657" parse_float @@ fun msg f_QuoteStatusReport_SettlCurrOfferFxRate ->
    opt msg "156" parse_SettlCurrFxRateCalc @@ fun msg f_QuoteStatusReport_SettlCurrFxRateCalc ->
    opt msg "13" parse_CommType @@ fun msg f_QuoteStatusReport_CommType ->
    opt msg "12" parse_float @@ fun msg f_QuoteStatusReport_Commission ->
    opt msg "582" parse_CustOrderCapacity @@ fun msg f_QuoteStatusReport_CustOrderCapacity ->
    opt msg "100" parse_Exchange @@ fun msg f_QuoteStatusReport_ExDestination ->
    opt msg "297" parse_QuoteStatus @@ fun msg f_QuoteStatusReport_QuoteStatus ->
    opt msg "58" parse_string @@ fun msg f_QuoteStatusReport_Text ->
    opt msg "354" parse_int @@ fun msg f_QuoteStatusReport_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_QuoteStatusReport_EncodedText ->
    ParseSuccess {
    f_QuoteStatusReport_Parties;
    f_QuoteStatusReport_UndInstrmtGrp;
    f_QuoteStatusReport_Stipulations;
    f_QuoteStatusReport_LegQuotStatGrp;
    f_QuoteStatusReport_QuotQualGrp;
    f_QuoteStatusReport_Instrument;
    f_QuoteStatusReport_FinancingDetails;
    f_QuoteStatusReport_OrderQtyData;
    f_QuoteStatusReport_SpreadOrBenchmarkCurveData;
    f_QuoteStatusReport_YieldData;
    f_QuoteStatusReport_QuoteStatusReqID;
    f_QuoteStatusReport_QuoteReqID;
    f_QuoteStatusReport_QuoteID;
    f_QuoteStatusReport_QuoteRespID;
    f_QuoteStatusReport_QuoteType;
    f_QuoteStatusReport_TradingSessionID;
    f_QuoteStatusReport_TradingSessionSubID;
    f_QuoteStatusReport_Side;
    f_QuoteStatusReport_SettlType;
    f_QuoteStatusReport_SettlDate;
    f_QuoteStatusReport_SettlDate2;
    f_QuoteStatusReport_OrderQty2;
    f_QuoteStatusReport_Currency;
    f_QuoteStatusReport_Account;
    f_QuoteStatusReport_AcctIDSource;
    f_QuoteStatusReport_AccountType;
    f_QuoteStatusReport_ExpireTime;
    f_QuoteStatusReport_Price;
    f_QuoteStatusReport_PriceType;
    f_QuoteStatusReport_BidPx;
    f_QuoteStatusReport_OfferPx;
    f_QuoteStatusReport_MktBidPx;
    f_QuoteStatusReport_MktOfferPx;
    f_QuoteStatusReport_MinBidSize;
    f_QuoteStatusReport_BidSize;
    f_QuoteStatusReport_MinOfferSize;
    f_QuoteStatusReport_OfferSize;
    f_QuoteStatusReport_ValidUntilTime;
    f_QuoteStatusReport_BidSpotRate;
    f_QuoteStatusReport_OfferSpotRate;
    f_QuoteStatusReport_BidForwardPoints;
    f_QuoteStatusReport_OfferForwardPoints;
    f_QuoteStatusReport_MidPx;
    f_QuoteStatusReport_BidYield;
    f_QuoteStatusReport_MidYield;
    f_QuoteStatusReport_OfferYield;
    f_QuoteStatusReport_TransactTime;
    f_QuoteStatusReport_OrdType;
    f_QuoteStatusReport_BidForwardPoints2;
    f_QuoteStatusReport_OfferForwardPoints2;
    f_QuoteStatusReport_SettlCurrBidFxRate;
    f_QuoteStatusReport_SettlCurrOfferFxRate;
    f_QuoteStatusReport_SettlCurrFxRateCalc;
    f_QuoteStatusReport_CommType;
    f_QuoteStatusReport_Commission;
    f_QuoteStatusReport_CustOrderCapacity;
    f_QuoteStatusReport_ExDestination;
    f_QuoteStatusReport_QuoteStatus;
    f_QuoteStatusReport_Text;
    f_QuoteStatusReport_EncodedTextLen;
    f_QuoteStatusReport_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_QuoteStatusRequest msg = (
    repeating msg "711" parse_UndInstrmtGrp @@ fun msg f_QuoteStatusRequest_UndInstrmtGrp ->
    repeating msg "555" parse_InstrmtLegGrp @@ fun msg f_QuoteStatusRequest_InstrmtLegGrp ->
    repeating msg "453" parse_Parties @@ fun msg f_QuoteStatusRequest_Parties ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_QuoteStatusRequest_Instrument ->
    block msg  parse_FinancingDetails @@ fun msg f_QuoteStatusRequest_FinancingDetails ->
    opt msg "649" parse_string @@ fun msg f_QuoteStatusRequest_QuoteStatusReqID ->
    opt msg "117" parse_string @@ fun msg f_QuoteStatusRequest_QuoteID ->
    opt msg "1" parse_string @@ fun msg f_QuoteStatusRequest_Account ->
    opt msg "660" parse_AcctIDSource @@ fun msg f_QuoteStatusRequest_AcctIDSource ->
    opt msg "581" parse_AccountType @@ fun msg f_QuoteStatusRequest_AccountType ->
    opt msg "336" parse_string @@ fun msg f_QuoteStatusRequest_TradingSessionID ->
    opt msg "625" parse_string @@ fun msg f_QuoteStatusRequest_TradingSessionSubID ->
    opt msg "263" parse_SubscriptionRequestType @@ fun msg f_QuoteStatusRequest_SubscriptionRequestType ->
    ParseSuccess {
    f_QuoteStatusRequest_UndInstrmtGrp;
    f_QuoteStatusRequest_InstrmtLegGrp;
    f_QuoteStatusRequest_Parties;
    f_QuoteStatusRequest_Instrument;
    f_QuoteStatusRequest_FinancingDetails;
    f_QuoteStatusRequest_QuoteStatusReqID;
    f_QuoteStatusRequest_QuoteID;
    f_QuoteStatusRequest_Account;
    f_QuoteStatusRequest_AcctIDSource;
    f_QuoteStatusRequest_AccountType;
    f_QuoteStatusRequest_TradingSessionID;
    f_QuoteStatusRequest_TradingSessionSubID;
    f_QuoteStatusRequest_SubscriptionRequestType;
    } , msg ) |> check_unknown_tags;;

let parse_RFQRequest msg = (
    repeating msg "146" parse_RFQReqGrp @@ fun msg f_RFQRequest_RFQReqGrp ->
    check_duplicate_tags msg @@ fun () ->
    req msg "644" parse_string @@ fun msg f_RFQRequest_RFQReqID ->
    opt msg "263" parse_SubscriptionRequestType @@ fun msg f_RFQRequest_SubscriptionRequestType ->
    ParseSuccess {
    f_RFQRequest_RFQReqGrp;
    f_RFQRequest_RFQReqID;
    f_RFQRequest_SubscriptionRequestType;
    } , msg ) |> check_unknown_tags;;

let parse_RegistrationInstructions msg = (
    repeating msg "453" parse_Parties @@ fun msg f_RegistrationInstructions_Parties ->
    repeating msg "473" parse_RgstDtlsGrp @@ fun msg f_RegistrationInstructions_RgstDtlsGrp ->
    repeating msg "510" parse_RgstDistInstGrp @@ fun msg f_RegistrationInstructions_RgstDistInstGrp ->
    check_duplicate_tags msg @@ fun () ->
    req msg "513" parse_string @@ fun msg f_RegistrationInstructions_RegistID ->
    req msg "514" parse_RegistTransType @@ fun msg f_RegistrationInstructions_RegistTransType ->
    req msg "508" parse_string @@ fun msg f_RegistrationInstructions_RegistRefID ->
    opt msg "11" parse_string @@ fun msg f_RegistrationInstructions_ClOrdID ->
    opt msg "1" parse_string @@ fun msg f_RegistrationInstructions_Account ->
    opt msg "660" parse_AcctIDSource @@ fun msg f_RegistrationInstructions_AcctIDSource ->
    opt msg "493" parse_string @@ fun msg f_RegistrationInstructions_RegistAcctType ->
    opt msg "495" parse_TaxAdvantageType @@ fun msg f_RegistrationInstructions_TaxAdvantageType ->
    opt msg "517" parse_OwnershipType @@ fun msg f_RegistrationInstructions_OwnershipType ->
    ParseSuccess {
    f_RegistrationInstructions_Parties;
    f_RegistrationInstructions_RgstDtlsGrp;
    f_RegistrationInstructions_RgstDistInstGrp;
    f_RegistrationInstructions_RegistID;
    f_RegistrationInstructions_RegistTransType;
    f_RegistrationInstructions_RegistRefID;
    f_RegistrationInstructions_ClOrdID;
    f_RegistrationInstructions_Account;
    f_RegistrationInstructions_AcctIDSource;
    f_RegistrationInstructions_RegistAcctType;
    f_RegistrationInstructions_TaxAdvantageType;
    f_RegistrationInstructions_OwnershipType;
    } , msg ) |> check_unknown_tags;;

let parse_RegistrationInstructionsResponse msg = (
    repeating msg "453" parse_Parties @@ fun msg f_RegistrationInstructionsResponse_Parties ->
    check_duplicate_tags msg @@ fun () ->
    req msg "513" parse_string @@ fun msg f_RegistrationInstructionsResponse_RegistID ->
    req msg "514" parse_RegistTransType @@ fun msg f_RegistrationInstructionsResponse_RegistTransType ->
    req msg "508" parse_string @@ fun msg f_RegistrationInstructionsResponse_RegistRefID ->
    opt msg "11" parse_string @@ fun msg f_RegistrationInstructionsResponse_ClOrdID ->
    opt msg "1" parse_string @@ fun msg f_RegistrationInstructionsResponse_Account ->
    opt msg "660" parse_AcctIDSource @@ fun msg f_RegistrationInstructionsResponse_AcctIDSource ->
    req msg "506" parse_RegistStatus @@ fun msg f_RegistrationInstructionsResponse_RegistStatus ->
    opt msg "507" parse_RegistRejReasonCode @@ fun msg f_RegistrationInstructionsResponse_RegistRejReasonCode ->
    opt msg "496" parse_string @@ fun msg f_RegistrationInstructionsResponse_RegistRejReasonText ->
    ParseSuccess {
    f_RegistrationInstructionsResponse_Parties;
    f_RegistrationInstructionsResponse_RegistID;
    f_RegistrationInstructionsResponse_RegistTransType;
    f_RegistrationInstructionsResponse_RegistRefID;
    f_RegistrationInstructionsResponse_ClOrdID;
    f_RegistrationInstructionsResponse_Account;
    f_RegistrationInstructionsResponse_AcctIDSource;
    f_RegistrationInstructionsResponse_RegistStatus;
    f_RegistrationInstructionsResponse_RegistRejReasonCode;
    f_RegistrationInstructionsResponse_RegistRejReasonText;
    } , msg ) |> check_unknown_tags;;

let parse_RequestForPositions msg = (
    repeating msg "453" parse_Parties @@ fun msg f_RequestForPositions_Parties ->
    repeating msg "555" parse_InstrmtLegGrp @@ fun msg f_RequestForPositions_InstrmtLegGrp ->
    repeating msg "711" parse_UndInstrmtGrp @@ fun msg f_RequestForPositions_UndInstrmtGrp ->
    repeating msg "386" parse_TrdgSesGrp @@ fun msg f_RequestForPositions_TrdgSesGrp ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_RequestForPositions_Instrument ->
    req msg "710" parse_string @@ fun msg f_RequestForPositions_PosReqID ->
    req msg "724" parse_PosReqType @@ fun msg f_RequestForPositions_PosReqType ->
    opt msg "573" parse_MatchStatus @@ fun msg f_RequestForPositions_MatchStatus ->
    opt msg "263" parse_SubscriptionRequestType @@ fun msg f_RequestForPositions_SubscriptionRequestType ->
    req msg "1" parse_string @@ fun msg f_RequestForPositions_Account ->
    opt msg "660" parse_AcctIDSource @@ fun msg f_RequestForPositions_AcctIDSource ->
    req msg "581" parse_AccountType @@ fun msg f_RequestForPositions_AccountType ->
    opt msg "15" parse_Currency @@ fun msg f_RequestForPositions_Currency ->
    req msg "715" parse_LocalMktDate @@ fun msg f_RequestForPositions_ClearingBusinessDate ->
    opt msg "716" parse_SettlSessID @@ fun msg f_RequestForPositions_SettlSessID ->
    opt msg "717" parse_string @@ fun msg f_RequestForPositions_SettlSessSubID ->
    req msg "60" parse_UTCTimestamp @@ fun msg f_RequestForPositions_TransactTime ->
    opt msg "725" parse_ResponseTransportType @@ fun msg f_RequestForPositions_ResponseTransportType ->
    opt msg "726" parse_string @@ fun msg f_RequestForPositions_ResponseDestination ->
    opt msg "58" parse_string @@ fun msg f_RequestForPositions_Text ->
    opt msg "354" parse_int @@ fun msg f_RequestForPositions_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_RequestForPositions_EncodedText ->
    ParseSuccess {
    f_RequestForPositions_Parties;
    f_RequestForPositions_InstrmtLegGrp;
    f_RequestForPositions_UndInstrmtGrp;
    f_RequestForPositions_TrdgSesGrp;
    f_RequestForPositions_Instrument;
    f_RequestForPositions_PosReqID;
    f_RequestForPositions_PosReqType;
    f_RequestForPositions_MatchStatus;
    f_RequestForPositions_SubscriptionRequestType;
    f_RequestForPositions_Account;
    f_RequestForPositions_AcctIDSource;
    f_RequestForPositions_AccountType;
    f_RequestForPositions_Currency;
    f_RequestForPositions_ClearingBusinessDate;
    f_RequestForPositions_SettlSessID;
    f_RequestForPositions_SettlSessSubID;
    f_RequestForPositions_TransactTime;
    f_RequestForPositions_ResponseTransportType;
    f_RequestForPositions_ResponseDestination;
    f_RequestForPositions_Text;
    f_RequestForPositions_EncodedTextLen;
    f_RequestForPositions_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_RequestForPositionsAck msg = (
    repeating msg "453" parse_Parties @@ fun msg f_RequestForPositionsAck_Parties ->
    repeating msg "555" parse_InstrmtLegGrp @@ fun msg f_RequestForPositionsAck_InstrmtLegGrp ->
    repeating msg "711" parse_UndInstrmtGrp @@ fun msg f_RequestForPositionsAck_UndInstrmtGrp ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_RequestForPositionsAck_Instrument ->
    req msg "721" parse_string @@ fun msg f_RequestForPositionsAck_PosMaintRptID ->
    opt msg "710" parse_string @@ fun msg f_RequestForPositionsAck_PosReqID ->
    opt msg "727" parse_int @@ fun msg f_RequestForPositionsAck_TotalNumPosReports ->
    opt msg "325" parse_UnsolicitedIndicator @@ fun msg f_RequestForPositionsAck_UnsolicitedIndicator ->
    req msg "728" parse_PosReqResult @@ fun msg f_RequestForPositionsAck_PosReqResult ->
    req msg "729" parse_PosReqStatus @@ fun msg f_RequestForPositionsAck_PosReqStatus ->
    req msg "1" parse_string @@ fun msg f_RequestForPositionsAck_Account ->
    opt msg "660" parse_AcctIDSource @@ fun msg f_RequestForPositionsAck_AcctIDSource ->
    req msg "581" parse_AccountType @@ fun msg f_RequestForPositionsAck_AccountType ->
    opt msg "15" parse_Currency @@ fun msg f_RequestForPositionsAck_Currency ->
    opt msg "725" parse_ResponseTransportType @@ fun msg f_RequestForPositionsAck_ResponseTransportType ->
    opt msg "726" parse_string @@ fun msg f_RequestForPositionsAck_ResponseDestination ->
    opt msg "58" parse_string @@ fun msg f_RequestForPositionsAck_Text ->
    opt msg "354" parse_int @@ fun msg f_RequestForPositionsAck_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_RequestForPositionsAck_EncodedText ->
    ParseSuccess {
    f_RequestForPositionsAck_Parties;
    f_RequestForPositionsAck_InstrmtLegGrp;
    f_RequestForPositionsAck_UndInstrmtGrp;
    f_RequestForPositionsAck_Instrument;
    f_RequestForPositionsAck_PosMaintRptID;
    f_RequestForPositionsAck_PosReqID;
    f_RequestForPositionsAck_TotalNumPosReports;
    f_RequestForPositionsAck_UnsolicitedIndicator;
    f_RequestForPositionsAck_PosReqResult;
    f_RequestForPositionsAck_PosReqStatus;
    f_RequestForPositionsAck_Account;
    f_RequestForPositionsAck_AcctIDSource;
    f_RequestForPositionsAck_AccountType;
    f_RequestForPositionsAck_Currency;
    f_RequestForPositionsAck_ResponseTransportType;
    f_RequestForPositionsAck_ResponseDestination;
    f_RequestForPositionsAck_Text;
    f_RequestForPositionsAck_EncodedTextLen;
    f_RequestForPositionsAck_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_SecurityDefinition msg = (
    repeating msg "711" parse_UndInstrmtGrp @@ fun msg f_SecurityDefinition_UndInstrmtGrp ->
    repeating msg "555" parse_InstrmtLegGrp @@ fun msg f_SecurityDefinition_InstrmtLegGrp ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_SecurityDefinition_Instrument ->
    block msg  parse_InstrumentExtension @@ fun msg f_SecurityDefinition_InstrumentExtension ->
    req msg "320" parse_string @@ fun msg f_SecurityDefinition_SecurityReqID ->
    req msg "322" parse_string @@ fun msg f_SecurityDefinition_SecurityResponseID ->
    req msg "323" parse_SecurityResponseType @@ fun msg f_SecurityDefinition_SecurityResponseType ->
    opt msg "15" parse_Currency @@ fun msg f_SecurityDefinition_Currency ->
    opt msg "336" parse_string @@ fun msg f_SecurityDefinition_TradingSessionID ->
    opt msg "625" parse_string @@ fun msg f_SecurityDefinition_TradingSessionSubID ->
    opt msg "58" parse_string @@ fun msg f_SecurityDefinition_Text ->
    opt msg "354" parse_int @@ fun msg f_SecurityDefinition_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_SecurityDefinition_EncodedText ->
    opt msg "827" parse_ExpirationCycle @@ fun msg f_SecurityDefinition_ExpirationCycle ->
    opt msg "561" parse_float @@ fun msg f_SecurityDefinition_RoundLot ->
    opt msg "562" parse_float @@ fun msg f_SecurityDefinition_MinTradeVol ->
    ParseSuccess {
    f_SecurityDefinition_UndInstrmtGrp;
    f_SecurityDefinition_InstrmtLegGrp;
    f_SecurityDefinition_Instrument;
    f_SecurityDefinition_InstrumentExtension;
    f_SecurityDefinition_SecurityReqID;
    f_SecurityDefinition_SecurityResponseID;
    f_SecurityDefinition_SecurityResponseType;
    f_SecurityDefinition_Currency;
    f_SecurityDefinition_TradingSessionID;
    f_SecurityDefinition_TradingSessionSubID;
    f_SecurityDefinition_Text;
    f_SecurityDefinition_EncodedTextLen;
    f_SecurityDefinition_EncodedText;
    f_SecurityDefinition_ExpirationCycle;
    f_SecurityDefinition_RoundLot;
    f_SecurityDefinition_MinTradeVol;
    } , msg ) |> check_unknown_tags;;

let parse_SecurityDefinitionRequest msg = (
    repeating msg "711" parse_UndInstrmtGrp @@ fun msg f_SecurityDefinitionRequest_UndInstrmtGrp ->
    repeating msg "555" parse_InstrmtLegGrp @@ fun msg f_SecurityDefinitionRequest_InstrmtLegGrp ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_SecurityDefinitionRequest_Instrument ->
    block msg  parse_InstrumentExtension @@ fun msg f_SecurityDefinitionRequest_InstrumentExtension ->
    req msg "320" parse_string @@ fun msg f_SecurityDefinitionRequest_SecurityReqID ->
    req msg "321" parse_SecurityRequestType @@ fun msg f_SecurityDefinitionRequest_SecurityRequestType ->
    opt msg "15" parse_Currency @@ fun msg f_SecurityDefinitionRequest_Currency ->
    opt msg "58" parse_string @@ fun msg f_SecurityDefinitionRequest_Text ->
    opt msg "354" parse_int @@ fun msg f_SecurityDefinitionRequest_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_SecurityDefinitionRequest_EncodedText ->
    opt msg "336" parse_string @@ fun msg f_SecurityDefinitionRequest_TradingSessionID ->
    opt msg "625" parse_string @@ fun msg f_SecurityDefinitionRequest_TradingSessionSubID ->
    opt msg "827" parse_ExpirationCycle @@ fun msg f_SecurityDefinitionRequest_ExpirationCycle ->
    opt msg "263" parse_SubscriptionRequestType @@ fun msg f_SecurityDefinitionRequest_SubscriptionRequestType ->
    ParseSuccess {
    f_SecurityDefinitionRequest_UndInstrmtGrp;
    f_SecurityDefinitionRequest_InstrmtLegGrp;
    f_SecurityDefinitionRequest_Instrument;
    f_SecurityDefinitionRequest_InstrumentExtension;
    f_SecurityDefinitionRequest_SecurityReqID;
    f_SecurityDefinitionRequest_SecurityRequestType;
    f_SecurityDefinitionRequest_Currency;
    f_SecurityDefinitionRequest_Text;
    f_SecurityDefinitionRequest_EncodedTextLen;
    f_SecurityDefinitionRequest_EncodedText;
    f_SecurityDefinitionRequest_TradingSessionID;
    f_SecurityDefinitionRequest_TradingSessionSubID;
    f_SecurityDefinitionRequest_ExpirationCycle;
    f_SecurityDefinitionRequest_SubscriptionRequestType;
    } , msg ) |> check_unknown_tags;;

let parse_SecurityList msg = (
    repeating msg "146" parse_SecListGrp @@ fun msg f_SecurityList_SecListGrp ->
    check_duplicate_tags msg @@ fun () ->
    req msg "320" parse_string @@ fun msg f_SecurityList_SecurityReqID ->
    req msg "322" parse_string @@ fun msg f_SecurityList_SecurityResponseID ->
    req msg "560" parse_SecurityRequestResult @@ fun msg f_SecurityList_SecurityRequestResult ->
    opt msg "393" parse_int @@ fun msg f_SecurityList_TotNoRelatedSym ->
    opt msg "893" parse_LastFragment @@ fun msg f_SecurityList_LastFragment ->
    ParseSuccess {
    f_SecurityList_SecListGrp;
    f_SecurityList_SecurityReqID;
    f_SecurityList_SecurityResponseID;
    f_SecurityList_SecurityRequestResult;
    f_SecurityList_TotNoRelatedSym;
    f_SecurityList_LastFragment;
    } , msg ) |> check_unknown_tags;;

let parse_SecurityListRequest msg = (
    repeating msg "711" parse_UndInstrmtGrp @@ fun msg f_SecurityListRequest_UndInstrmtGrp ->
    repeating msg "555" parse_InstrmtLegGrp @@ fun msg f_SecurityListRequest_InstrmtLegGrp ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_SecurityListRequest_Instrument ->
    block msg  parse_InstrumentExtension @@ fun msg f_SecurityListRequest_InstrumentExtension ->
    block msg  parse_FinancingDetails @@ fun msg f_SecurityListRequest_FinancingDetails ->
    req msg "320" parse_string @@ fun msg f_SecurityListRequest_SecurityReqID ->
    req msg "559" parse_SecurityListRequestType @@ fun msg f_SecurityListRequest_SecurityListRequestType ->
    opt msg "15" parse_Currency @@ fun msg f_SecurityListRequest_Currency ->
    opt msg "58" parse_string @@ fun msg f_SecurityListRequest_Text ->
    opt msg "354" parse_int @@ fun msg f_SecurityListRequest_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_SecurityListRequest_EncodedText ->
    opt msg "336" parse_string @@ fun msg f_SecurityListRequest_TradingSessionID ->
    opt msg "625" parse_string @@ fun msg f_SecurityListRequest_TradingSessionSubID ->
    opt msg "263" parse_SubscriptionRequestType @@ fun msg f_SecurityListRequest_SubscriptionRequestType ->
    ParseSuccess {
    f_SecurityListRequest_UndInstrmtGrp;
    f_SecurityListRequest_InstrmtLegGrp;
    f_SecurityListRequest_Instrument;
    f_SecurityListRequest_InstrumentExtension;
    f_SecurityListRequest_FinancingDetails;
    f_SecurityListRequest_SecurityReqID;
    f_SecurityListRequest_SecurityListRequestType;
    f_SecurityListRequest_Currency;
    f_SecurityListRequest_Text;
    f_SecurityListRequest_EncodedTextLen;
    f_SecurityListRequest_EncodedText;
    f_SecurityListRequest_TradingSessionID;
    f_SecurityListRequest_TradingSessionSubID;
    f_SecurityListRequest_SubscriptionRequestType;
    } , msg ) |> check_unknown_tags;;

let parse_SecurityStatus msg = (
    repeating msg "711" parse_UndInstrmtGrp @@ fun msg f_SecurityStatus_UndInstrmtGrp ->
    repeating msg "555" parse_InstrmtLegGrp @@ fun msg f_SecurityStatus_InstrmtLegGrp ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_SecurityStatus_Instrument ->
    block msg  parse_InstrumentExtension @@ fun msg f_SecurityStatus_InstrumentExtension ->
    opt msg "324" parse_string @@ fun msg f_SecurityStatus_SecurityStatusReqID ->
    opt msg "15" parse_Currency @@ fun msg f_SecurityStatus_Currency ->
    opt msg "336" parse_string @@ fun msg f_SecurityStatus_TradingSessionID ->
    opt msg "625" parse_string @@ fun msg f_SecurityStatus_TradingSessionSubID ->
    opt msg "325" parse_UnsolicitedIndicator @@ fun msg f_SecurityStatus_UnsolicitedIndicator ->
    opt msg "326" parse_SecurityTradingStatus @@ fun msg f_SecurityStatus_SecurityTradingStatus ->
    opt msg "291" parse_FinancialStatus @@ fun msg f_SecurityStatus_FinancialStatus ->
    opt msg "292" parse_CorporateAction @@ fun msg f_SecurityStatus_CorporateAction ->
    opt msg "327" parse_HaltReason @@ fun msg f_SecurityStatus_HaltReason ->
    opt msg "328" parse_InViewOfCommon @@ fun msg f_SecurityStatus_InViewOfCommon ->
    opt msg "329" parse_DueToRelated @@ fun msg f_SecurityStatus_DueToRelated ->
    opt msg "330" parse_float @@ fun msg f_SecurityStatus_BuyVolume ->
    opt msg "331" parse_float @@ fun msg f_SecurityStatus_SellVolume ->
    opt msg "332" parse_float @@ fun msg f_SecurityStatus_HighPx ->
    opt msg "333" parse_float @@ fun msg f_SecurityStatus_LowPx ->
    opt msg "31" parse_float @@ fun msg f_SecurityStatus_LastPx ->
    opt msg "60" parse_UTCTimestamp @@ fun msg f_SecurityStatus_TransactTime ->
    opt msg "334" parse_Adjustment @@ fun msg f_SecurityStatus_Adjustment ->
    opt msg "58" parse_string @@ fun msg f_SecurityStatus_Text ->
    opt msg "354" parse_int @@ fun msg f_SecurityStatus_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_SecurityStatus_EncodedText ->
    ParseSuccess {
    f_SecurityStatus_UndInstrmtGrp;
    f_SecurityStatus_InstrmtLegGrp;
    f_SecurityStatus_Instrument;
    f_SecurityStatus_InstrumentExtension;
    f_SecurityStatus_SecurityStatusReqID;
    f_SecurityStatus_Currency;
    f_SecurityStatus_TradingSessionID;
    f_SecurityStatus_TradingSessionSubID;
    f_SecurityStatus_UnsolicitedIndicator;
    f_SecurityStatus_SecurityTradingStatus;
    f_SecurityStatus_FinancialStatus;
    f_SecurityStatus_CorporateAction;
    f_SecurityStatus_HaltReason;
    f_SecurityStatus_InViewOfCommon;
    f_SecurityStatus_DueToRelated;
    f_SecurityStatus_BuyVolume;
    f_SecurityStatus_SellVolume;
    f_SecurityStatus_HighPx;
    f_SecurityStatus_LowPx;
    f_SecurityStatus_LastPx;
    f_SecurityStatus_TransactTime;
    f_SecurityStatus_Adjustment;
    f_SecurityStatus_Text;
    f_SecurityStatus_EncodedTextLen;
    f_SecurityStatus_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_SecurityStatusRequest msg = (
    repeating msg "711" parse_UndInstrmtGrp @@ fun msg f_SecurityStatusRequest_UndInstrmtGrp ->
    repeating msg "555" parse_InstrmtLegGrp @@ fun msg f_SecurityStatusRequest_InstrmtLegGrp ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_SecurityStatusRequest_Instrument ->
    block msg  parse_InstrumentExtension @@ fun msg f_SecurityStatusRequest_InstrumentExtension ->
    req msg "324" parse_string @@ fun msg f_SecurityStatusRequest_SecurityStatusReqID ->
    opt msg "15" parse_Currency @@ fun msg f_SecurityStatusRequest_Currency ->
    req msg "263" parse_SubscriptionRequestType @@ fun msg f_SecurityStatusRequest_SubscriptionRequestType ->
    opt msg "336" parse_string @@ fun msg f_SecurityStatusRequest_TradingSessionID ->
    opt msg "625" parse_string @@ fun msg f_SecurityStatusRequest_TradingSessionSubID ->
    ParseSuccess {
    f_SecurityStatusRequest_UndInstrmtGrp;
    f_SecurityStatusRequest_InstrmtLegGrp;
    f_SecurityStatusRequest_Instrument;
    f_SecurityStatusRequest_InstrumentExtension;
    f_SecurityStatusRequest_SecurityStatusReqID;
    f_SecurityStatusRequest_Currency;
    f_SecurityStatusRequest_SubscriptionRequestType;
    f_SecurityStatusRequest_TradingSessionID;
    f_SecurityStatusRequest_TradingSessionSubID;
    } , msg ) |> check_unknown_tags;;

let parse_SecurityTypeRequest msg = (
    check_duplicate_tags msg @@ fun () ->
    req msg "320" parse_string @@ fun msg f_SecurityTypeRequest_SecurityReqID ->
    opt msg "58" parse_string @@ fun msg f_SecurityTypeRequest_Text ->
    opt msg "354" parse_int @@ fun msg f_SecurityTypeRequest_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_SecurityTypeRequest_EncodedText ->
    opt msg "336" parse_string @@ fun msg f_SecurityTypeRequest_TradingSessionID ->
    opt msg "625" parse_string @@ fun msg f_SecurityTypeRequest_TradingSessionSubID ->
    opt msg "460" parse_Product @@ fun msg f_SecurityTypeRequest_Product ->
    opt msg "167" parse_SecurityType @@ fun msg f_SecurityTypeRequest_SecurityType ->
    opt msg "762" parse_string @@ fun msg f_SecurityTypeRequest_SecuritySubType ->
    ParseSuccess {
    f_SecurityTypeRequest_SecurityReqID;
    f_SecurityTypeRequest_Text;
    f_SecurityTypeRequest_EncodedTextLen;
    f_SecurityTypeRequest_EncodedText;
    f_SecurityTypeRequest_TradingSessionID;
    f_SecurityTypeRequest_TradingSessionSubID;
    f_SecurityTypeRequest_Product;
    f_SecurityTypeRequest_SecurityType;
    f_SecurityTypeRequest_SecuritySubType;
    } , msg ) |> check_unknown_tags;;

let parse_SecurityTypes msg = (
    repeating msg "558" parse_SecTypesGrp @@ fun msg f_SecurityTypes_SecTypesGrp ->
    check_duplicate_tags msg @@ fun () ->
    req msg "320" parse_string @@ fun msg f_SecurityTypes_SecurityReqID ->
    req msg "322" parse_string @@ fun msg f_SecurityTypes_SecurityResponseID ->
    req msg "323" parse_SecurityResponseType @@ fun msg f_SecurityTypes_SecurityResponseType ->
    opt msg "557" parse_int @@ fun msg f_SecurityTypes_TotNoSecurityTypes ->
    opt msg "893" parse_LastFragment @@ fun msg f_SecurityTypes_LastFragment ->
    opt msg "58" parse_string @@ fun msg f_SecurityTypes_Text ->
    opt msg "354" parse_int @@ fun msg f_SecurityTypes_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_SecurityTypes_EncodedText ->
    opt msg "336" parse_string @@ fun msg f_SecurityTypes_TradingSessionID ->
    opt msg "625" parse_string @@ fun msg f_SecurityTypes_TradingSessionSubID ->
    opt msg "263" parse_SubscriptionRequestType @@ fun msg f_SecurityTypes_SubscriptionRequestType ->
    ParseSuccess {
    f_SecurityTypes_SecTypesGrp;
    f_SecurityTypes_SecurityReqID;
    f_SecurityTypes_SecurityResponseID;
    f_SecurityTypes_SecurityResponseType;
    f_SecurityTypes_TotNoSecurityTypes;
    f_SecurityTypes_LastFragment;
    f_SecurityTypes_Text;
    f_SecurityTypes_EncodedTextLen;
    f_SecurityTypes_EncodedText;
    f_SecurityTypes_TradingSessionID;
    f_SecurityTypes_TradingSessionSubID;
    f_SecurityTypes_SubscriptionRequestType;
    } , msg ) |> check_unknown_tags;;

let parse_SettlementInstructionRequest msg = (
    repeating msg "453" parse_Parties @@ fun msg f_SettlementInstructionRequest_Parties ->
    check_duplicate_tags msg @@ fun () ->
    req msg "791" parse_string @@ fun msg f_SettlementInstructionRequest_SettlInstReqID ->
    req msg "60" parse_UTCTimestamp @@ fun msg f_SettlementInstructionRequest_TransactTime ->
    opt msg "79" parse_string @@ fun msg f_SettlementInstructionRequest_AllocAccount ->
    opt msg "661" parse_int @@ fun msg f_SettlementInstructionRequest_AllocAcctIDSource ->
    opt msg "54" parse_Side @@ fun msg f_SettlementInstructionRequest_Side ->
    opt msg "460" parse_Product @@ fun msg f_SettlementInstructionRequest_Product ->
    opt msg "167" parse_SecurityType @@ fun msg f_SettlementInstructionRequest_SecurityType ->
    opt msg "461" parse_string @@ fun msg f_SettlementInstructionRequest_CFICode ->
    opt msg "168" parse_UTCTimestamp @@ fun msg f_SettlementInstructionRequest_EffectiveTime ->
    opt msg "126" parse_UTCTimestamp @@ fun msg f_SettlementInstructionRequest_ExpireTime ->
    opt msg "779" parse_UTCTimestamp @@ fun msg f_SettlementInstructionRequest_LastUpdateTime ->
    opt msg "169" parse_StandInstDbType @@ fun msg f_SettlementInstructionRequest_StandInstDbType ->
    opt msg "170" parse_string @@ fun msg f_SettlementInstructionRequest_StandInstDbName ->
    opt msg "171" parse_string @@ fun msg f_SettlementInstructionRequest_StandInstDbID ->
    ParseSuccess {
    f_SettlementInstructionRequest_Parties;
    f_SettlementInstructionRequest_SettlInstReqID;
    f_SettlementInstructionRequest_TransactTime;
    f_SettlementInstructionRequest_AllocAccount;
    f_SettlementInstructionRequest_AllocAcctIDSource;
    f_SettlementInstructionRequest_Side;
    f_SettlementInstructionRequest_Product;
    f_SettlementInstructionRequest_SecurityType;
    f_SettlementInstructionRequest_CFICode;
    f_SettlementInstructionRequest_EffectiveTime;
    f_SettlementInstructionRequest_ExpireTime;
    f_SettlementInstructionRequest_LastUpdateTime;
    f_SettlementInstructionRequest_StandInstDbType;
    f_SettlementInstructionRequest_StandInstDbName;
    f_SettlementInstructionRequest_StandInstDbID;
    } , msg ) |> check_unknown_tags;;

let parse_SettlementInstructions msg = (
    repeating msg "778" parse_SettlInstGrp @@ fun msg f_SettlementInstructions_SettlInstGrp ->
    check_duplicate_tags msg @@ fun () ->
    req msg "777" parse_string @@ fun msg f_SettlementInstructions_SettlInstMsgID ->
    opt msg "791" parse_string @@ fun msg f_SettlementInstructions_SettlInstReqID ->
    req msg "160" parse_SettlInstMode @@ fun msg f_SettlementInstructions_SettlInstMode ->
    opt msg "792" parse_SettlInstReqRejCode @@ fun msg f_SettlementInstructions_SettlInstReqRejCode ->
    opt msg "58" parse_string @@ fun msg f_SettlementInstructions_Text ->
    opt msg "354" parse_int @@ fun msg f_SettlementInstructions_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_SettlementInstructions_EncodedText ->
    opt msg "11" parse_string @@ fun msg f_SettlementInstructions_ClOrdID ->
    req msg "60" parse_UTCTimestamp @@ fun msg f_SettlementInstructions_TransactTime ->
    ParseSuccess {
    f_SettlementInstructions_SettlInstGrp;
    f_SettlementInstructions_SettlInstMsgID;
    f_SettlementInstructions_SettlInstReqID;
    f_SettlementInstructions_SettlInstMode;
    f_SettlementInstructions_SettlInstReqRejCode;
    f_SettlementInstructions_Text;
    f_SettlementInstructions_EncodedTextLen;
    f_SettlementInstructions_EncodedText;
    f_SettlementInstructions_ClOrdID;
    f_SettlementInstructions_TransactTime;
    } , msg ) |> check_unknown_tags;;

let parse_TradeCaptureReport msg = (
    repeating msg "711" parse_UndInstrmtGrp @@ fun msg f_TradeCaptureReport_UndInstrmtGrp ->
    repeating msg "753" parse_PositionAmountData @@ fun msg f_TradeCaptureReport_PositionAmountData ->
    repeating msg "555" parse_TrdInstrmtLegGrp @@ fun msg f_TradeCaptureReport_TrdInstrmtLegGrp ->
    repeating msg "768" parse_TrdRegTimestamps @@ fun msg f_TradeCaptureReport_TrdRegTimestamps ->
    repeating msg "552" parse_TrdCapRptSideGrp @@ fun msg f_TradeCaptureReport_TrdCapRptSideGrp ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_TradeCaptureReport_Instrument ->
    block msg  parse_FinancingDetails @@ fun msg f_TradeCaptureReport_FinancingDetails ->
    block msg  parse_OrderQtyData @@ fun msg f_TradeCaptureReport_OrderQtyData ->
    block msg  parse_YieldData @@ fun msg f_TradeCaptureReport_YieldData ->
    block msg  parse_SpreadOrBenchmarkCurveData @@ fun msg f_TradeCaptureReport_SpreadOrBenchmarkCurveData ->
    req msg "571" parse_string @@ fun msg f_TradeCaptureReport_TradeReportID ->
    opt msg "487" parse_int @@ fun msg f_TradeCaptureReport_TradeReportTransType ->
    opt msg "856" parse_TradeReportType @@ fun msg f_TradeCaptureReport_TradeReportType ->
    opt msg "568" parse_string @@ fun msg f_TradeCaptureReport_TradeRequestID ->
    opt msg "828" parse_TrdType @@ fun msg f_TradeCaptureReport_TrdType ->
    opt msg "829" parse_int @@ fun msg f_TradeCaptureReport_TrdSubType ->
    opt msg "855" parse_int @@ fun msg f_TradeCaptureReport_SecondaryTrdType ->
    opt msg "830" parse_string @@ fun msg f_TradeCaptureReport_TransferReason ->
    opt msg "150" parse_ExecType @@ fun msg f_TradeCaptureReport_ExecType ->
    opt msg "748" parse_int @@ fun msg f_TradeCaptureReport_TotNumTradeReports ->
    opt msg "912" parse_bool @@ fun msg f_TradeCaptureReport_LastRptRequested ->
    opt msg "325" parse_UnsolicitedIndicator @@ fun msg f_TradeCaptureReport_UnsolicitedIndicator ->
    opt msg "263" parse_SubscriptionRequestType @@ fun msg f_TradeCaptureReport_SubscriptionRequestType ->
    opt msg "572" parse_string @@ fun msg f_TradeCaptureReport_TradeReportRefID ->
    opt msg "881" parse_string @@ fun msg f_TradeCaptureReport_SecondaryTradeReportRefID ->
    opt msg "818" parse_string @@ fun msg f_TradeCaptureReport_SecondaryTradeReportID ->
    opt msg "820" parse_string @@ fun msg f_TradeCaptureReport_TradeLinkID ->
    opt msg "880" parse_string @@ fun msg f_TradeCaptureReport_TrdMatchID ->
    opt msg "17" parse_string @@ fun msg f_TradeCaptureReport_ExecID ->
    opt msg "39" parse_OrdStatus @@ fun msg f_TradeCaptureReport_OrdStatus ->
    opt msg "527" parse_string @@ fun msg f_TradeCaptureReport_SecondaryExecID ->
    opt msg "378" parse_ExecRestatementReason @@ fun msg f_TradeCaptureReport_ExecRestatementReason ->
    req msg "570" parse_PreviouslyReported @@ fun msg f_TradeCaptureReport_PreviouslyReported ->
    opt msg "423" parse_PriceType @@ fun msg f_TradeCaptureReport_PriceType ->
    opt msg "854" parse_QtyType @@ fun msg f_TradeCaptureReport_QtyType ->
    opt msg "822" parse_string @@ fun msg f_TradeCaptureReport_UnderlyingTradingSessionID ->
    opt msg "823" parse_string @@ fun msg f_TradeCaptureReport_UnderlyingTradingSessionSubID ->
    req msg "32" parse_float @@ fun msg f_TradeCaptureReport_LastQty ->
    req msg "31" parse_float @@ fun msg f_TradeCaptureReport_LastPx ->
    opt msg "669" parse_float @@ fun msg f_TradeCaptureReport_LastParPx ->
    opt msg "194" parse_float @@ fun msg f_TradeCaptureReport_LastSpotRate ->
    opt msg "195" parse_float @@ fun msg f_TradeCaptureReport_LastForwardPoints ->
    opt msg "30" parse_Exchange @@ fun msg f_TradeCaptureReport_LastMkt ->
    req msg "75" parse_LocalMktDate @@ fun msg f_TradeCaptureReport_TradeDate ->
    opt msg "715" parse_LocalMktDate @@ fun msg f_TradeCaptureReport_ClearingBusinessDate ->
    opt msg "6" parse_float @@ fun msg f_TradeCaptureReport_AvgPx ->
    opt msg "819" parse_AvgPxIndicator @@ fun msg f_TradeCaptureReport_AvgPxIndicator ->
    opt msg "442" parse_MultiLegReportingType @@ fun msg f_TradeCaptureReport_MultiLegReportingType ->
    opt msg "824" parse_string @@ fun msg f_TradeCaptureReport_TradeLegRefID ->
    req msg "60" parse_UTCTimestamp @@ fun msg f_TradeCaptureReport_TransactTime ->
    opt msg "63" parse_SettlType @@ fun msg f_TradeCaptureReport_SettlType ->
    opt msg "64" parse_LocalMktDate @@ fun msg f_TradeCaptureReport_SettlDate ->
    opt msg "573" parse_MatchStatus @@ fun msg f_TradeCaptureReport_MatchStatus ->
    opt msg "574" parse_MatchType @@ fun msg f_TradeCaptureReport_MatchType ->
    opt msg "797" parse_bool @@ fun msg f_TradeCaptureReport_CopyMsgIndicator ->
    opt msg "852" parse_PublishTrdIndicator @@ fun msg f_TradeCaptureReport_PublishTrdIndicator ->
    opt msg "853" parse_ShortSaleReason @@ fun msg f_TradeCaptureReport_ShortSaleReason ->
    ParseSuccess {
    f_TradeCaptureReport_UndInstrmtGrp;
    f_TradeCaptureReport_PositionAmountData;
    f_TradeCaptureReport_TrdInstrmtLegGrp;
    f_TradeCaptureReport_TrdRegTimestamps;
    f_TradeCaptureReport_TrdCapRptSideGrp;
    f_TradeCaptureReport_Instrument;
    f_TradeCaptureReport_FinancingDetails;
    f_TradeCaptureReport_OrderQtyData;
    f_TradeCaptureReport_YieldData;
    f_TradeCaptureReport_SpreadOrBenchmarkCurveData;
    f_TradeCaptureReport_TradeReportID;
    f_TradeCaptureReport_TradeReportTransType;
    f_TradeCaptureReport_TradeReportType;
    f_TradeCaptureReport_TradeRequestID;
    f_TradeCaptureReport_TrdType;
    f_TradeCaptureReport_TrdSubType;
    f_TradeCaptureReport_SecondaryTrdType;
    f_TradeCaptureReport_TransferReason;
    f_TradeCaptureReport_ExecType;
    f_TradeCaptureReport_TotNumTradeReports;
    f_TradeCaptureReport_LastRptRequested;
    f_TradeCaptureReport_UnsolicitedIndicator;
    f_TradeCaptureReport_SubscriptionRequestType;
    f_TradeCaptureReport_TradeReportRefID;
    f_TradeCaptureReport_SecondaryTradeReportRefID;
    f_TradeCaptureReport_SecondaryTradeReportID;
    f_TradeCaptureReport_TradeLinkID;
    f_TradeCaptureReport_TrdMatchID;
    f_TradeCaptureReport_ExecID;
    f_TradeCaptureReport_OrdStatus;
    f_TradeCaptureReport_SecondaryExecID;
    f_TradeCaptureReport_ExecRestatementReason;
    f_TradeCaptureReport_PreviouslyReported;
    f_TradeCaptureReport_PriceType;
    f_TradeCaptureReport_QtyType;
    f_TradeCaptureReport_UnderlyingTradingSessionID;
    f_TradeCaptureReport_UnderlyingTradingSessionSubID;
    f_TradeCaptureReport_LastQty;
    f_TradeCaptureReport_LastPx;
    f_TradeCaptureReport_LastParPx;
    f_TradeCaptureReport_LastSpotRate;
    f_TradeCaptureReport_LastForwardPoints;
    f_TradeCaptureReport_LastMkt;
    f_TradeCaptureReport_TradeDate;
    f_TradeCaptureReport_ClearingBusinessDate;
    f_TradeCaptureReport_AvgPx;
    f_TradeCaptureReport_AvgPxIndicator;
    f_TradeCaptureReport_MultiLegReportingType;
    f_TradeCaptureReport_TradeLegRefID;
    f_TradeCaptureReport_TransactTime;
    f_TradeCaptureReport_SettlType;
    f_TradeCaptureReport_SettlDate;
    f_TradeCaptureReport_MatchStatus;
    f_TradeCaptureReport_MatchType;
    f_TradeCaptureReport_CopyMsgIndicator;
    f_TradeCaptureReport_PublishTrdIndicator;
    f_TradeCaptureReport_ShortSaleReason;
    } , msg ) |> check_unknown_tags;;

let parse_TradeCaptureReportAck msg = (
    repeating msg "768" parse_TrdRegTimestamps @@ fun msg f_TradeCaptureReportAck_TrdRegTimestamps ->
    repeating msg "555" parse_TrdInstrmtLegGrp @@ fun msg f_TradeCaptureReportAck_TrdInstrmtLegGrp ->
    repeating msg "78" parse_TrdAllocGrp @@ fun msg f_TradeCaptureReportAck_TrdAllocGrp ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_TradeCaptureReportAck_Instrument ->
    req msg "571" parse_string @@ fun msg f_TradeCaptureReportAck_TradeReportID ->
    opt msg "487" parse_int @@ fun msg f_TradeCaptureReportAck_TradeReportTransType ->
    opt msg "856" parse_TradeReportType @@ fun msg f_TradeCaptureReportAck_TradeReportType ->
    opt msg "828" parse_TrdType @@ fun msg f_TradeCaptureReportAck_TrdType ->
    opt msg "829" parse_int @@ fun msg f_TradeCaptureReportAck_TrdSubType ->
    opt msg "855" parse_int @@ fun msg f_TradeCaptureReportAck_SecondaryTrdType ->
    opt msg "830" parse_string @@ fun msg f_TradeCaptureReportAck_TransferReason ->
    req msg "150" parse_ExecType @@ fun msg f_TradeCaptureReportAck_ExecType ->
    opt msg "572" parse_string @@ fun msg f_TradeCaptureReportAck_TradeReportRefID ->
    opt msg "881" parse_string @@ fun msg f_TradeCaptureReportAck_SecondaryTradeReportRefID ->
    opt msg "939" parse_TrdRptStatus @@ fun msg f_TradeCaptureReportAck_TrdRptStatus ->
    opt msg "751" parse_TradeReportRejectReason @@ fun msg f_TradeCaptureReportAck_TradeReportRejectReason ->
    opt msg "818" parse_string @@ fun msg f_TradeCaptureReportAck_SecondaryTradeReportID ->
    opt msg "263" parse_SubscriptionRequestType @@ fun msg f_TradeCaptureReportAck_SubscriptionRequestType ->
    opt msg "820" parse_string @@ fun msg f_TradeCaptureReportAck_TradeLinkID ->
    opt msg "880" parse_string @@ fun msg f_TradeCaptureReportAck_TrdMatchID ->
    opt msg "17" parse_string @@ fun msg f_TradeCaptureReportAck_ExecID ->
    opt msg "527" parse_string @@ fun msg f_TradeCaptureReportAck_SecondaryExecID ->
    opt msg "60" parse_UTCTimestamp @@ fun msg f_TradeCaptureReportAck_TransactTime ->
    opt msg "725" parse_ResponseTransportType @@ fun msg f_TradeCaptureReportAck_ResponseTransportType ->
    opt msg "726" parse_string @@ fun msg f_TradeCaptureReportAck_ResponseDestination ->
    opt msg "58" parse_string @@ fun msg f_TradeCaptureReportAck_Text ->
    opt msg "354" parse_int @@ fun msg f_TradeCaptureReportAck_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_TradeCaptureReportAck_EncodedText ->
    opt msg "635" parse_ClearingFeeIndicator @@ fun msg f_TradeCaptureReportAck_ClearingFeeIndicator ->
    opt msg "528" parse_OrderCapacity @@ fun msg f_TradeCaptureReportAck_OrderCapacity ->
    opt msg "529" parse_OrderRestrictions @@ fun msg f_TradeCaptureReportAck_OrderRestrictions ->
    opt msg "582" parse_CustOrderCapacity @@ fun msg f_TradeCaptureReportAck_CustOrderCapacity ->
    opt msg "1" parse_string @@ fun msg f_TradeCaptureReportAck_Account ->
    opt msg "660" parse_AcctIDSource @@ fun msg f_TradeCaptureReportAck_AcctIDSource ->
    opt msg "581" parse_AccountType @@ fun msg f_TradeCaptureReportAck_AccountType ->
    opt msg "77" parse_PositionEffect @@ fun msg f_TradeCaptureReportAck_PositionEffect ->
    opt msg "591" parse_PreallocMethod @@ fun msg f_TradeCaptureReportAck_PreallocMethod ->
    ParseSuccess {
    f_TradeCaptureReportAck_TrdRegTimestamps;
    f_TradeCaptureReportAck_TrdInstrmtLegGrp;
    f_TradeCaptureReportAck_TrdAllocGrp;
    f_TradeCaptureReportAck_Instrument;
    f_TradeCaptureReportAck_TradeReportID;
    f_TradeCaptureReportAck_TradeReportTransType;
    f_TradeCaptureReportAck_TradeReportType;
    f_TradeCaptureReportAck_TrdType;
    f_TradeCaptureReportAck_TrdSubType;
    f_TradeCaptureReportAck_SecondaryTrdType;
    f_TradeCaptureReportAck_TransferReason;
    f_TradeCaptureReportAck_ExecType;
    f_TradeCaptureReportAck_TradeReportRefID;
    f_TradeCaptureReportAck_SecondaryTradeReportRefID;
    f_TradeCaptureReportAck_TrdRptStatus;
    f_TradeCaptureReportAck_TradeReportRejectReason;
    f_TradeCaptureReportAck_SecondaryTradeReportID;
    f_TradeCaptureReportAck_SubscriptionRequestType;
    f_TradeCaptureReportAck_TradeLinkID;
    f_TradeCaptureReportAck_TrdMatchID;
    f_TradeCaptureReportAck_ExecID;
    f_TradeCaptureReportAck_SecondaryExecID;
    f_TradeCaptureReportAck_TransactTime;
    f_TradeCaptureReportAck_ResponseTransportType;
    f_TradeCaptureReportAck_ResponseDestination;
    f_TradeCaptureReportAck_Text;
    f_TradeCaptureReportAck_EncodedTextLen;
    f_TradeCaptureReportAck_EncodedText;
    f_TradeCaptureReportAck_ClearingFeeIndicator;
    f_TradeCaptureReportAck_OrderCapacity;
    f_TradeCaptureReportAck_OrderRestrictions;
    f_TradeCaptureReportAck_CustOrderCapacity;
    f_TradeCaptureReportAck_Account;
    f_TradeCaptureReportAck_AcctIDSource;
    f_TradeCaptureReportAck_AccountType;
    f_TradeCaptureReportAck_PositionEffect;
    f_TradeCaptureReportAck_PreallocMethod;
    } , msg ) |> check_unknown_tags;;

let parse_TradeCaptureReportRequest msg = (
    repeating msg "453" parse_Parties @@ fun msg f_TradeCaptureReportRequest_Parties ->
    repeating msg "711" parse_UndInstrmtGrp @@ fun msg f_TradeCaptureReportRequest_UndInstrmtGrp ->
    repeating msg "555" parse_InstrmtLegGrp @@ fun msg f_TradeCaptureReportRequest_InstrmtLegGrp ->
    repeating msg "580" parse_TrdCapDtGrp @@ fun msg f_TradeCaptureReportRequest_TrdCapDtGrp ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_TradeCaptureReportRequest_Instrument ->
    block msg  parse_InstrumentExtension @@ fun msg f_TradeCaptureReportRequest_InstrumentExtension ->
    block msg  parse_FinancingDetails @@ fun msg f_TradeCaptureReportRequest_FinancingDetails ->
    req msg "568" parse_string @@ fun msg f_TradeCaptureReportRequest_TradeRequestID ->
    req msg "569" parse_TradeRequestType @@ fun msg f_TradeCaptureReportRequest_TradeRequestType ->
    opt msg "263" parse_SubscriptionRequestType @@ fun msg f_TradeCaptureReportRequest_SubscriptionRequestType ->
    opt msg "571" parse_string @@ fun msg f_TradeCaptureReportRequest_TradeReportID ->
    opt msg "818" parse_string @@ fun msg f_TradeCaptureReportRequest_SecondaryTradeReportID ->
    opt msg "17" parse_string @@ fun msg f_TradeCaptureReportRequest_ExecID ->
    opt msg "150" parse_ExecType @@ fun msg f_TradeCaptureReportRequest_ExecType ->
    opt msg "37" parse_string @@ fun msg f_TradeCaptureReportRequest_OrderID ->
    opt msg "11" parse_string @@ fun msg f_TradeCaptureReportRequest_ClOrdID ->
    opt msg "573" parse_MatchStatus @@ fun msg f_TradeCaptureReportRequest_MatchStatus ->
    opt msg "828" parse_TrdType @@ fun msg f_TradeCaptureReportRequest_TrdType ->
    opt msg "829" parse_int @@ fun msg f_TradeCaptureReportRequest_TrdSubType ->
    opt msg "830" parse_string @@ fun msg f_TradeCaptureReportRequest_TransferReason ->
    opt msg "855" parse_int @@ fun msg f_TradeCaptureReportRequest_SecondaryTrdType ->
    opt msg "820" parse_string @@ fun msg f_TradeCaptureReportRequest_TradeLinkID ->
    opt msg "880" parse_string @@ fun msg f_TradeCaptureReportRequest_TrdMatchID ->
    opt msg "715" parse_LocalMktDate @@ fun msg f_TradeCaptureReportRequest_ClearingBusinessDate ->
    opt msg "336" parse_string @@ fun msg f_TradeCaptureReportRequest_TradingSessionID ->
    opt msg "625" parse_string @@ fun msg f_TradeCaptureReportRequest_TradingSessionSubID ->
    opt msg "943" parse_string @@ fun msg f_TradeCaptureReportRequest_TimeBracket ->
    opt msg "54" parse_Side @@ fun msg f_TradeCaptureReportRequest_Side ->
    opt msg "442" parse_MultiLegReportingType @@ fun msg f_TradeCaptureReportRequest_MultiLegReportingType ->
    opt msg "578" parse_string @@ fun msg f_TradeCaptureReportRequest_TradeInputSource ->
    opt msg "579" parse_string @@ fun msg f_TradeCaptureReportRequest_TradeInputDevice ->
    opt msg "725" parse_ResponseTransportType @@ fun msg f_TradeCaptureReportRequest_ResponseTransportType ->
    opt msg "726" parse_string @@ fun msg f_TradeCaptureReportRequest_ResponseDestination ->
    opt msg "58" parse_string @@ fun msg f_TradeCaptureReportRequest_Text ->
    opt msg "354" parse_int @@ fun msg f_TradeCaptureReportRequest_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_TradeCaptureReportRequest_EncodedText ->
    ParseSuccess {
    f_TradeCaptureReportRequest_Parties;
    f_TradeCaptureReportRequest_UndInstrmtGrp;
    f_TradeCaptureReportRequest_InstrmtLegGrp;
    f_TradeCaptureReportRequest_TrdCapDtGrp;
    f_TradeCaptureReportRequest_Instrument;
    f_TradeCaptureReportRequest_InstrumentExtension;
    f_TradeCaptureReportRequest_FinancingDetails;
    f_TradeCaptureReportRequest_TradeRequestID;
    f_TradeCaptureReportRequest_TradeRequestType;
    f_TradeCaptureReportRequest_SubscriptionRequestType;
    f_TradeCaptureReportRequest_TradeReportID;
    f_TradeCaptureReportRequest_SecondaryTradeReportID;
    f_TradeCaptureReportRequest_ExecID;
    f_TradeCaptureReportRequest_ExecType;
    f_TradeCaptureReportRequest_OrderID;
    f_TradeCaptureReportRequest_ClOrdID;
    f_TradeCaptureReportRequest_MatchStatus;
    f_TradeCaptureReportRequest_TrdType;
    f_TradeCaptureReportRequest_TrdSubType;
    f_TradeCaptureReportRequest_TransferReason;
    f_TradeCaptureReportRequest_SecondaryTrdType;
    f_TradeCaptureReportRequest_TradeLinkID;
    f_TradeCaptureReportRequest_TrdMatchID;
    f_TradeCaptureReportRequest_ClearingBusinessDate;
    f_TradeCaptureReportRequest_TradingSessionID;
    f_TradeCaptureReportRequest_TradingSessionSubID;
    f_TradeCaptureReportRequest_TimeBracket;
    f_TradeCaptureReportRequest_Side;
    f_TradeCaptureReportRequest_MultiLegReportingType;
    f_TradeCaptureReportRequest_TradeInputSource;
    f_TradeCaptureReportRequest_TradeInputDevice;
    f_TradeCaptureReportRequest_ResponseTransportType;
    f_TradeCaptureReportRequest_ResponseDestination;
    f_TradeCaptureReportRequest_Text;
    f_TradeCaptureReportRequest_EncodedTextLen;
    f_TradeCaptureReportRequest_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_TradeCaptureReportRequestAck msg = (
    repeating msg "711" parse_UndInstrmtGrp @@ fun msg f_TradeCaptureReportRequestAck_UndInstrmtGrp ->
    repeating msg "555" parse_InstrmtLegGrp @@ fun msg f_TradeCaptureReportRequestAck_InstrmtLegGrp ->
    check_duplicate_tags msg @@ fun () ->
    block msg  parse_Instrument @@ fun msg f_TradeCaptureReportRequestAck_Instrument ->
    req msg "568" parse_string @@ fun msg f_TradeCaptureReportRequestAck_TradeRequestID ->
    req msg "569" parse_TradeRequestType @@ fun msg f_TradeCaptureReportRequestAck_TradeRequestType ->
    opt msg "263" parse_SubscriptionRequestType @@ fun msg f_TradeCaptureReportRequestAck_SubscriptionRequestType ->
    opt msg "748" parse_int @@ fun msg f_TradeCaptureReportRequestAck_TotNumTradeReports ->
    req msg "749" parse_TradeRequestResult @@ fun msg f_TradeCaptureReportRequestAck_TradeRequestResult ->
    req msg "750" parse_TradeRequestStatus @@ fun msg f_TradeCaptureReportRequestAck_TradeRequestStatus ->
    opt msg "442" parse_MultiLegReportingType @@ fun msg f_TradeCaptureReportRequestAck_MultiLegReportingType ->
    opt msg "725" parse_ResponseTransportType @@ fun msg f_TradeCaptureReportRequestAck_ResponseTransportType ->
    opt msg "726" parse_string @@ fun msg f_TradeCaptureReportRequestAck_ResponseDestination ->
    opt msg "58" parse_string @@ fun msg f_TradeCaptureReportRequestAck_Text ->
    opt msg "354" parse_int @@ fun msg f_TradeCaptureReportRequestAck_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_TradeCaptureReportRequestAck_EncodedText ->
    ParseSuccess {
    f_TradeCaptureReportRequestAck_UndInstrmtGrp;
    f_TradeCaptureReportRequestAck_InstrmtLegGrp;
    f_TradeCaptureReportRequestAck_Instrument;
    f_TradeCaptureReportRequestAck_TradeRequestID;
    f_TradeCaptureReportRequestAck_TradeRequestType;
    f_TradeCaptureReportRequestAck_SubscriptionRequestType;
    f_TradeCaptureReportRequestAck_TotNumTradeReports;
    f_TradeCaptureReportRequestAck_TradeRequestResult;
    f_TradeCaptureReportRequestAck_TradeRequestStatus;
    f_TradeCaptureReportRequestAck_MultiLegReportingType;
    f_TradeCaptureReportRequestAck_ResponseTransportType;
    f_TradeCaptureReportRequestAck_ResponseDestination;
    f_TradeCaptureReportRequestAck_Text;
    f_TradeCaptureReportRequestAck_EncodedTextLen;
    f_TradeCaptureReportRequestAck_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_TradingSessionStatus msg = (
    check_duplicate_tags msg @@ fun () ->
    opt msg "335" parse_string @@ fun msg f_TradingSessionStatus_TradSesReqID ->
    req msg "336" parse_string @@ fun msg f_TradingSessionStatus_TradingSessionID ->
    opt msg "625" parse_string @@ fun msg f_TradingSessionStatus_TradingSessionSubID ->
    opt msg "338" parse_TradSesMethod @@ fun msg f_TradingSessionStatus_TradSesMethod ->
    opt msg "339" parse_TradSesMode @@ fun msg f_TradingSessionStatus_TradSesMode ->
    opt msg "325" parse_UnsolicitedIndicator @@ fun msg f_TradingSessionStatus_UnsolicitedIndicator ->
    req msg "340" parse_TradSesStatus @@ fun msg f_TradingSessionStatus_TradSesStatus ->
    opt msg "567" parse_TradSesStatusRejReason @@ fun msg f_TradingSessionStatus_TradSesStatusRejReason ->
    opt msg "341" parse_UTCTimestamp @@ fun msg f_TradingSessionStatus_TradSesStartTime ->
    opt msg "342" parse_UTCTimestamp @@ fun msg f_TradingSessionStatus_TradSesOpenTime ->
    opt msg "343" parse_UTCTimestamp @@ fun msg f_TradingSessionStatus_TradSesPreCloseTime ->
    opt msg "344" parse_UTCTimestamp @@ fun msg f_TradingSessionStatus_TradSesCloseTime ->
    opt msg "345" parse_UTCTimestamp @@ fun msg f_TradingSessionStatus_TradSesEndTime ->
    opt msg "387" parse_float @@ fun msg f_TradingSessionStatus_TotalVolumeTraded ->
    opt msg "58" parse_string @@ fun msg f_TradingSessionStatus_Text ->
    opt msg "354" parse_int @@ fun msg f_TradingSessionStatus_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_TradingSessionStatus_EncodedText ->
    ParseSuccess {
    f_TradingSessionStatus_TradSesReqID;
    f_TradingSessionStatus_TradingSessionID;
    f_TradingSessionStatus_TradingSessionSubID;
    f_TradingSessionStatus_TradSesMethod;
    f_TradingSessionStatus_TradSesMode;
    f_TradingSessionStatus_UnsolicitedIndicator;
    f_TradingSessionStatus_TradSesStatus;
    f_TradingSessionStatus_TradSesStatusRejReason;
    f_TradingSessionStatus_TradSesStartTime;
    f_TradingSessionStatus_TradSesOpenTime;
    f_TradingSessionStatus_TradSesPreCloseTime;
    f_TradingSessionStatus_TradSesCloseTime;
    f_TradingSessionStatus_TradSesEndTime;
    f_TradingSessionStatus_TotalVolumeTraded;
    f_TradingSessionStatus_Text;
    f_TradingSessionStatus_EncodedTextLen;
    f_TradingSessionStatus_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_TradingSessionStatusRequest msg = (
    check_duplicate_tags msg @@ fun () ->
    req msg "335" parse_string @@ fun msg f_TradingSessionStatusRequest_TradSesReqID ->
    opt msg "336" parse_string @@ fun msg f_TradingSessionStatusRequest_TradingSessionID ->
    opt msg "625" parse_string @@ fun msg f_TradingSessionStatusRequest_TradingSessionSubID ->
    opt msg "338" parse_TradSesMethod @@ fun msg f_TradingSessionStatusRequest_TradSesMethod ->
    opt msg "339" parse_TradSesMode @@ fun msg f_TradingSessionStatusRequest_TradSesMode ->
    req msg "263" parse_SubscriptionRequestType @@ fun msg f_TradingSessionStatusRequest_SubscriptionRequestType ->
    ParseSuccess {
    f_TradingSessionStatusRequest_TradSesReqID;
    f_TradingSessionStatusRequest_TradingSessionID;
    f_TradingSessionStatusRequest_TradingSessionSubID;
    f_TradingSessionStatusRequest_TradSesMethod;
    f_TradingSessionStatusRequest_TradSesMode;
    f_TradingSessionStatusRequest_SubscriptionRequestType;
    } , msg ) |> check_unknown_tags;;

let parse_UserRequest msg = (
    check_duplicate_tags msg @@ fun () ->
    req msg "923" parse_string @@ fun msg f_UserRequest_UserRequestID ->
    req msg "924" parse_UserRequestType @@ fun msg f_UserRequest_UserRequestType ->
    req msg "553" parse_string @@ fun msg f_UserRequest_Username ->
    opt msg "554" parse_string @@ fun msg f_UserRequest_Password ->
    opt msg "925" parse_string @@ fun msg f_UserRequest_NewPassword ->
    opt msg "95" parse_int @@ fun msg f_UserRequest_RawDataLength ->
    opt msg "96" parse_string @@ fun msg f_UserRequest_RawData ->
    ParseSuccess {
    f_UserRequest_UserRequestID;
    f_UserRequest_UserRequestType;
    f_UserRequest_Username;
    f_UserRequest_Password;
    f_UserRequest_NewPassword;
    f_UserRequest_RawDataLength;
    f_UserRequest_RawData;
    } , msg ) |> check_unknown_tags;;

let parse_UserResponse msg = (
    check_duplicate_tags msg @@ fun () ->
    req msg "923" parse_string @@ fun msg f_UserResponse_UserRequestID ->
    req msg "553" parse_string @@ fun msg f_UserResponse_Username ->
    opt msg "926" parse_UserStatus @@ fun msg f_UserResponse_UserStatus ->
    opt msg "927" parse_string @@ fun msg f_UserResponse_UserStatusText ->
    ParseSuccess {
    f_UserResponse_UserRequestID;
    f_UserResponse_Username;
    f_UserResponse_UserStatus;
    f_UserResponse_UserStatusText;
    } , msg ) |> check_unknown_tags;;

let parse_app_msg_data msg_tag msg =
    (match msg_tag with
        | Full_Msg_Advertisement_Tag -> ((>>=) (parse_Advertisement msg) (fun f -> ParseSuccess (FIX_Full_Msg_Advertisement f)
        ))
        | Full_Msg_AllocationInstruction_Tag -> ((>>=) (parse_AllocationInstruction msg) (fun f -> ParseSuccess (FIX_Full_Msg_AllocationInstruction f)
        ))
        | Full_Msg_AllocationInstructionAck_Tag -> ((>>=) (parse_AllocationInstructionAck msg) (fun f -> ParseSuccess (FIX_Full_Msg_AllocationInstructionAck f)
        ))
        | Full_Msg_AllocationReport_Tag -> ((>>=) (parse_AllocationReport msg) (fun f -> ParseSuccess (FIX_Full_Msg_AllocationReport f)
        ))
        | Full_Msg_AllocationReportAck_Tag -> ((>>=) (parse_AllocationReportAck msg) (fun f -> ParseSuccess (FIX_Full_Msg_AllocationReportAck f)
        ))
        | Full_Msg_AssignmentReport_Tag -> ((>>=) (parse_AssignmentReport msg) (fun f -> ParseSuccess (FIX_Full_Msg_AssignmentReport f)
        ))
        | Full_Msg_BidRequest_Tag -> ((>>=) (parse_BidRequest msg) (fun f -> ParseSuccess (FIX_Full_Msg_BidRequest f)
        ))
        | Full_Msg_BidResponse_Tag -> ((>>=) (parse_BidResponse msg) (fun f -> ParseSuccess (FIX_Full_Msg_BidResponse f)
        ))
        | Full_Msg_CollateralAssignment_Tag -> ((>>=) (parse_CollateralAssignment msg) (fun f -> ParseSuccess (FIX_Full_Msg_CollateralAssignment f)
        ))
        | Full_Msg_CollateralInquiry_Tag -> ((>>=) (parse_CollateralInquiry msg) (fun f -> ParseSuccess (FIX_Full_Msg_CollateralInquiry f)
        ))
        | Full_Msg_CollateralInquiryAck_Tag -> ((>>=) (parse_CollateralInquiryAck msg) (fun f -> ParseSuccess (FIX_Full_Msg_CollateralInquiryAck f)
        ))
        | Full_Msg_CollateralReport_Tag -> ((>>=) (parse_CollateralReport msg) (fun f -> ParseSuccess (FIX_Full_Msg_CollateralReport f)
        ))
        | Full_Msg_CollateralRequest_Tag -> ((>>=) (parse_CollateralRequest msg) (fun f -> ParseSuccess (FIX_Full_Msg_CollateralRequest f)
        ))
        | Full_Msg_CollateralResponse_Tag -> ((>>=) (parse_CollateralResponse msg) (fun f -> ParseSuccess (FIX_Full_Msg_CollateralResponse f)
        ))
        | Full_Msg_Confirmation_Tag -> ((>>=) (parse_Confirmation msg) (fun f -> ParseSuccess (FIX_Full_Msg_Confirmation f)
        ))
        | Full_Msg_ConfirmationAck_Tag -> ((>>=) (parse_ConfirmationAck msg) (fun f -> ParseSuccess (FIX_Full_Msg_ConfirmationAck f)
        ))
        | Full_Msg_ConfirmationRequest_Tag -> ((>>=) (parse_ConfirmationRequest msg) (fun f -> ParseSuccess (FIX_Full_Msg_ConfirmationRequest f)
        ))
        | Full_Msg_CrossOrderCancelReplaceRequest_Tag -> ((>>=) (parse_CrossOrderCancelReplaceRequest msg) (fun f -> ParseSuccess (FIX_Full_Msg_CrossOrderCancelReplaceRequest f)
        ))
        | Full_Msg_CrossOrderCancelRequest_Tag -> ((>>=) (parse_CrossOrderCancelRequest msg) (fun f -> ParseSuccess (FIX_Full_Msg_CrossOrderCancelRequest f)
        ))
        | Full_Msg_DerivativeSecurityList_Tag -> ((>>=) (parse_DerivativeSecurityList msg) (fun f -> ParseSuccess (FIX_Full_Msg_DerivativeSecurityList f)
        ))
        | Full_Msg_DerivativeSecurityListRequest_Tag -> ((>>=) (parse_DerivativeSecurityListRequest msg) (fun f -> ParseSuccess (FIX_Full_Msg_DerivativeSecurityListRequest f)
        ))
        | Full_Msg_DontKnowTrade_Tag -> ((>>=) (parse_DontKnowTrade msg) (fun f -> ParseSuccess (FIX_Full_Msg_DontKnowTrade f)
        ))
        | Full_Msg_Email_Tag -> ((>>=) (parse_Email msg) (fun f -> ParseSuccess (FIX_Full_Msg_Email f)
        ))
        | Full_Msg_ExecutionReport_Tag -> ((>>=) (parse_ExecutionReport msg) (fun f -> ParseSuccess (FIX_Full_Msg_ExecutionReport f)
        ))
        | Full_Msg_IOI_Tag -> ((>>=) (parse_IOI msg) (fun f -> ParseSuccess (FIX_Full_Msg_IOI f)
        ))
        | Full_Msg_ListCancelRequest_Tag -> ((>>=) (parse_ListCancelRequest msg) (fun f -> ParseSuccess (FIX_Full_Msg_ListCancelRequest f)
        ))
        | Full_Msg_ListExecute_Tag -> ((>>=) (parse_ListExecute msg) (fun f -> ParseSuccess (FIX_Full_Msg_ListExecute f)
        ))
        | Full_Msg_ListStatus_Tag -> ((>>=) (parse_ListStatus msg) (fun f -> ParseSuccess (FIX_Full_Msg_ListStatus f)
        ))
        | Full_Msg_ListStatusRequest_Tag -> ((>>=) (parse_ListStatusRequest msg) (fun f -> ParseSuccess (FIX_Full_Msg_ListStatusRequest f)
        ))
        | Full_Msg_ListStrikePrice_Tag -> ((>>=) (parse_ListStrikePrice msg) (fun f -> ParseSuccess (FIX_Full_Msg_ListStrikePrice f)
        ))
        | Full_Msg_MarketDataIncrementalRefresh_Tag -> ((>>=) (parse_MarketDataIncrementalRefresh msg) (fun f -> ParseSuccess (FIX_Full_Msg_MarketDataIncrementalRefresh f)
        ))
        | Full_Msg_MarketDataRequest_Tag -> ((>>=) (parse_MarketDataRequest msg) (fun f -> ParseSuccess (FIX_Full_Msg_MarketDataRequest f)
        ))
        | Full_Msg_MarketDataRequestReject_Tag -> ((>>=) (parse_MarketDataRequestReject msg) (fun f -> ParseSuccess (FIX_Full_Msg_MarketDataRequestReject f)
        ))
        | Full_Msg_MarketDataSnapshotFullRefresh_Tag -> ((>>=) (parse_MarketDataSnapshotFullRefresh msg) (fun f -> ParseSuccess (FIX_Full_Msg_MarketDataSnapshotFullRefresh f)
        ))
        | Full_Msg_MassQuote_Tag -> ((>>=) (parse_MassQuote msg) (fun f -> ParseSuccess (FIX_Full_Msg_MassQuote f)
        ))
        | Full_Msg_MassQuoteAcknowledgement_Tag -> ((>>=) (parse_MassQuoteAcknowledgement msg) (fun f -> ParseSuccess (FIX_Full_Msg_MassQuoteAcknowledgement f)
        ))
        | Full_Msg_MultilegOrderCancelReplace_Tag -> ((>>=) (parse_MultilegOrderCancelReplace msg) (fun f -> ParseSuccess (FIX_Full_Msg_MultilegOrderCancelReplace f)
        ))
        | Full_Msg_NetworkCounterpartySystemStatusRequest_Tag -> ((>>=) (parse_NetworkCounterpartySystemStatusRequest msg) (fun f -> ParseSuccess (FIX_Full_Msg_NetworkCounterpartySystemStatusRequest f)
        ))
        | Full_Msg_NetworkCounterpartySystemStatusResponse_Tag -> ((>>=) (parse_NetworkCounterpartySystemStatusResponse msg) (fun f -> ParseSuccess (FIX_Full_Msg_NetworkCounterpartySystemStatusResponse f)
        ))
        | Full_Msg_NewOrderCross_Tag -> ((>>=) (parse_NewOrderCross msg) (fun f -> ParseSuccess (FIX_Full_Msg_NewOrderCross f)
        ))
        | Full_Msg_NewOrderList_Tag -> ((>>=) (parse_NewOrderList msg) (fun f -> ParseSuccess (FIX_Full_Msg_NewOrderList f)
        ))
        | Full_Msg_NewOrderMultileg_Tag -> ((>>=) (parse_NewOrderMultileg msg) (fun f -> ParseSuccess (FIX_Full_Msg_NewOrderMultileg f)
        ))
        | Full_Msg_NewOrderSingle_Tag -> ((>>=) (parse_NewOrderSingle msg) (fun f -> ParseSuccess (FIX_Full_Msg_NewOrderSingle f)
        ))
        | Full_Msg_News_Tag -> ((>>=) (parse_News msg) (fun f -> ParseSuccess (FIX_Full_Msg_News f)
        ))
        | Full_Msg_OrderCancelReject_Tag -> ((>>=) (parse_OrderCancelReject msg) (fun f -> ParseSuccess (FIX_Full_Msg_OrderCancelReject f)
        ))
        | Full_Msg_OrderCancelReplaceRequest_Tag -> ((>>=) (parse_OrderCancelReplaceRequest msg) (fun f -> ParseSuccess (FIX_Full_Msg_OrderCancelReplaceRequest f)
        ))
        | Full_Msg_OrderCancelRequest_Tag -> ((>>=) (parse_OrderCancelRequest msg) (fun f -> ParseSuccess (FIX_Full_Msg_OrderCancelRequest f)
        ))
        | Full_Msg_OrderMassCancelReport_Tag -> ((>>=) (parse_OrderMassCancelReport msg) (fun f -> ParseSuccess (FIX_Full_Msg_OrderMassCancelReport f)
        ))
        | Full_Msg_OrderMassCancelRequest_Tag -> ((>>=) (parse_OrderMassCancelRequest msg) (fun f -> ParseSuccess (FIX_Full_Msg_OrderMassCancelRequest f)
        ))
        | Full_Msg_OrderMassStatusRequest_Tag -> ((>>=) (parse_OrderMassStatusRequest msg) (fun f -> ParseSuccess (FIX_Full_Msg_OrderMassStatusRequest f)
        ))
        | Full_Msg_OrderStatusRequest_Tag -> ((>>=) (parse_OrderStatusRequest msg) (fun f -> ParseSuccess (FIX_Full_Msg_OrderStatusRequest f)
        ))
        | Full_Msg_PositionMaintenanceReport_Tag -> ((>>=) (parse_PositionMaintenanceReport msg) (fun f -> ParseSuccess (FIX_Full_Msg_PositionMaintenanceReport f)
        ))
        | Full_Msg_PositionMaintenanceRequest_Tag -> ((>>=) (parse_PositionMaintenanceRequest msg) (fun f -> ParseSuccess (FIX_Full_Msg_PositionMaintenanceRequest f)
        ))
        | Full_Msg_PositionReport_Tag -> ((>>=) (parse_PositionReport msg) (fun f -> ParseSuccess (FIX_Full_Msg_PositionReport f)
        ))
        | Full_Msg_Quote_Tag -> ((>>=) (parse_Quote msg) (fun f -> ParseSuccess (FIX_Full_Msg_Quote f)
        ))
        | Full_Msg_QuoteCancel_Tag -> ((>>=) (parse_QuoteCancel msg) (fun f -> ParseSuccess (FIX_Full_Msg_QuoteCancel f)
        ))
        | Full_Msg_QuoteRequest_Tag -> ((>>=) (parse_QuoteRequest msg) (fun f -> ParseSuccess (FIX_Full_Msg_QuoteRequest f)
        ))
        | Full_Msg_QuoteRequestReject_Tag -> ((>>=) (parse_QuoteRequestReject msg) (fun f -> ParseSuccess (FIX_Full_Msg_QuoteRequestReject f)
        ))
        | Full_Msg_QuoteResponse_Tag -> ((>>=) (parse_QuoteResponse msg) (fun f -> ParseSuccess (FIX_Full_Msg_QuoteResponse f)
        ))
        | Full_Msg_QuoteStatusReport_Tag -> ((>>=) (parse_QuoteStatusReport msg) (fun f -> ParseSuccess (FIX_Full_Msg_QuoteStatusReport f)
        ))
        | Full_Msg_QuoteStatusRequest_Tag -> ((>>=) (parse_QuoteStatusRequest msg) (fun f -> ParseSuccess (FIX_Full_Msg_QuoteStatusRequest f)
        ))
        | Full_Msg_RFQRequest_Tag -> ((>>=) (parse_RFQRequest msg) (fun f -> ParseSuccess (FIX_Full_Msg_RFQRequest f)
        ))
        | Full_Msg_RegistrationInstructions_Tag -> ((>>=) (parse_RegistrationInstructions msg) (fun f -> ParseSuccess (FIX_Full_Msg_RegistrationInstructions f)
        ))
        | Full_Msg_RegistrationInstructionsResponse_Tag -> ((>>=) (parse_RegistrationInstructionsResponse msg) (fun f -> ParseSuccess (FIX_Full_Msg_RegistrationInstructionsResponse f)
        ))
        | Full_Msg_RequestForPositions_Tag -> ((>>=) (parse_RequestForPositions msg) (fun f -> ParseSuccess (FIX_Full_Msg_RequestForPositions f)
        ))
        | Full_Msg_RequestForPositionsAck_Tag -> ((>>=) (parse_RequestForPositionsAck msg) (fun f -> ParseSuccess (FIX_Full_Msg_RequestForPositionsAck f)
        ))
        | Full_Msg_SecurityDefinition_Tag -> ((>>=) (parse_SecurityDefinition msg) (fun f -> ParseSuccess (FIX_Full_Msg_SecurityDefinition f)
        ))
        | Full_Msg_SecurityDefinitionRequest_Tag -> ((>>=) (parse_SecurityDefinitionRequest msg) (fun f -> ParseSuccess (FIX_Full_Msg_SecurityDefinitionRequest f)
        ))
        | Full_Msg_SecurityList_Tag -> ((>>=) (parse_SecurityList msg) (fun f -> ParseSuccess (FIX_Full_Msg_SecurityList f)
        ))
        | Full_Msg_SecurityListRequest_Tag -> ((>>=) (parse_SecurityListRequest msg) (fun f -> ParseSuccess (FIX_Full_Msg_SecurityListRequest f)
        ))
        | Full_Msg_SecurityStatus_Tag -> ((>>=) (parse_SecurityStatus msg) (fun f -> ParseSuccess (FIX_Full_Msg_SecurityStatus f)
        ))
        | Full_Msg_SecurityStatusRequest_Tag -> ((>>=) (parse_SecurityStatusRequest msg) (fun f -> ParseSuccess (FIX_Full_Msg_SecurityStatusRequest f)
        ))
        | Full_Msg_SecurityTypeRequest_Tag -> ((>>=) (parse_SecurityTypeRequest msg) (fun f -> ParseSuccess (FIX_Full_Msg_SecurityTypeRequest f)
        ))
        | Full_Msg_SecurityTypes_Tag -> ((>>=) (parse_SecurityTypes msg) (fun f -> ParseSuccess (FIX_Full_Msg_SecurityTypes f)
        ))
        | Full_Msg_SettlementInstructionRequest_Tag -> ((>>=) (parse_SettlementInstructionRequest msg) (fun f -> ParseSuccess (FIX_Full_Msg_SettlementInstructionRequest f)
        ))
        | Full_Msg_SettlementInstructions_Tag -> ((>>=) (parse_SettlementInstructions msg) (fun f -> ParseSuccess (FIX_Full_Msg_SettlementInstructions f)
        ))
        | Full_Msg_TradeCaptureReport_Tag -> ((>>=) (parse_TradeCaptureReport msg) (fun f -> ParseSuccess (FIX_Full_Msg_TradeCaptureReport f)
        ))
        | Full_Msg_TradeCaptureReportAck_Tag -> ((>>=) (parse_TradeCaptureReportAck msg) (fun f -> ParseSuccess (FIX_Full_Msg_TradeCaptureReportAck f)
        ))
        | Full_Msg_TradeCaptureReportRequest_Tag -> ((>>=) (parse_TradeCaptureReportRequest msg) (fun f -> ParseSuccess (FIX_Full_Msg_TradeCaptureReportRequest f)
        ))
        | Full_Msg_TradeCaptureReportRequestAck_Tag -> ((>>=) (parse_TradeCaptureReportRequestAck msg) (fun f -> ParseSuccess (FIX_Full_Msg_TradeCaptureReportRequestAck f)
        ))
        | Full_Msg_TradingSessionStatus_Tag -> ((>>=) (parse_TradingSessionStatus msg) (fun f -> ParseSuccess (FIX_Full_Msg_TradingSessionStatus f)
        ))
        | Full_Msg_TradingSessionStatusRequest_Tag -> ((>>=) (parse_TradingSessionStatusRequest msg) (fun f -> ParseSuccess (FIX_Full_Msg_TradingSessionStatusRequest f)
        ))
        | Full_Msg_UserRequest_Tag -> ((>>=) (parse_UserRequest msg) (fun f -> ParseSuccess (FIX_Full_Msg_UserRequest f)
        ))
        | Full_Msg_UserResponse_Tag -> ((>>=) (parse_UserResponse msg) (fun f -> ParseSuccess (FIX_Full_Msg_UserResponse f)
        ))
    )
;;
