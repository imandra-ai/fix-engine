(* Aesthetic Integration copyright 2017 *)
(* @meta[imandra_ignore] on @end *)
open Full_app_messages;;
open Parser_utils.Parser;;
open Full_app_tags;;
open Parse_app_records;;
open Parse_datetime;;
open Parse_base_types;;
open Parse_app_enums;;
(* @meta[imandra_ignore] off @end *)

let parse_Advertisement msg = (
    check_duplicate_tags msg @@ fun () ->
    req msg "2" parse_string @@ fun msg f_Advertisement_AdvId ->
    req msg "5" parse_AdvTransType @@ fun msg f_Advertisement_AdvTransType ->
    opt msg "3" parse_string @@ fun msg f_Advertisement_AdvRefID ->
    req msg "55" parse_string @@ fun msg f_Advertisement_Symbol ->
    opt msg "65" parse_string @@ fun msg f_Advertisement_SymbolSfx ->
    opt msg "48" parse_string @@ fun msg f_Advertisement_SecurityID ->
    opt msg "22" parse_IDSource @@ fun msg f_Advertisement_IDSource ->
    opt msg "167" parse_SecurityType @@ fun msg f_Advertisement_SecurityType ->
    opt msg "200" parse_MonthYear @@ fun msg f_Advertisement_MaturityMonthYear ->
    opt msg "205" parse_int @@ fun msg f_Advertisement_MaturityDay ->
    opt msg "201" parse_PutOrCall @@ fun msg f_Advertisement_PutOrCall ->
    opt msg "202" parse_float @@ fun msg f_Advertisement_StrikePrice ->
    opt msg "206" parse_char @@ fun msg f_Advertisement_OptAttribute ->
    opt msg "231" parse_float @@ fun msg f_Advertisement_ContractMultiplier ->
    opt msg "223" parse_float @@ fun msg f_Advertisement_CouponRate ->
    opt msg "207" parse_Exchange @@ fun msg f_Advertisement_SecurityExchange ->
    opt msg "106" parse_string @@ fun msg f_Advertisement_Issuer ->
    opt msg "348" parse_int @@ fun msg f_Advertisement_EncodedIssuerLen ->
    opt msg "349" parse_string @@ fun msg f_Advertisement_EncodedIssuer ->
    opt msg "107" parse_string @@ fun msg f_Advertisement_SecurityDesc ->
    opt msg "350" parse_int @@ fun msg f_Advertisement_EncodedSecurityDescLen ->
    opt msg "351" parse_string @@ fun msg f_Advertisement_EncodedSecurityDesc ->
    req msg "4" parse_AdvSide @@ fun msg f_Advertisement_AdvSide ->
    req msg "53" parse_float @@ fun msg f_Advertisement_Shares ->
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
    ParseSuccess {
    f_Advertisement_AdvId;
    f_Advertisement_AdvTransType;
    f_Advertisement_AdvRefID;
    f_Advertisement_Symbol;
    f_Advertisement_SymbolSfx;
    f_Advertisement_SecurityID;
    f_Advertisement_IDSource;
    f_Advertisement_SecurityType;
    f_Advertisement_MaturityMonthYear;
    f_Advertisement_MaturityDay;
    f_Advertisement_PutOrCall;
    f_Advertisement_StrikePrice;
    f_Advertisement_OptAttribute;
    f_Advertisement_ContractMultiplier;
    f_Advertisement_CouponRate;
    f_Advertisement_SecurityExchange;
    f_Advertisement_Issuer;
    f_Advertisement_EncodedIssuerLen;
    f_Advertisement_EncodedIssuer;
    f_Advertisement_SecurityDesc;
    f_Advertisement_EncodedSecurityDescLen;
    f_Advertisement_EncodedSecurityDesc;
    f_Advertisement_AdvSide;
    f_Advertisement_Shares;
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
    } , msg ) |> check_unknown_tags;;

let parse_Allocation msg = (
    repeating msg "73" parse_AllocationOrders @@ fun msg f_Allocation_AllocationOrders ->
    repeating msg "124" parse_AllocationExecs @@ fun msg f_Allocation_AllocationExecs ->
    repeating msg "78" parse_AllocationAllocs @@ fun msg f_Allocation_AllocationAllocs ->
    repeating msg "136" parse_AllocationMiscFees @@ fun msg f_Allocation_AllocationMiscFees ->
    check_duplicate_tags msg @@ fun () ->
    req msg "70" parse_string @@ fun msg f_Allocation_AllocID ->
    req msg "71" parse_AllocTransType @@ fun msg f_Allocation_AllocTransType ->
    opt msg "72" parse_string @@ fun msg f_Allocation_RefAllocID ->
    opt msg "196" parse_string @@ fun msg f_Allocation_AllocLinkID ->
    opt msg "197" parse_AllocLinkType @@ fun msg f_Allocation_AllocLinkType ->
    req msg "54" parse_Side @@ fun msg f_Allocation_Side ->
    req msg "55" parse_string @@ fun msg f_Allocation_Symbol ->
    opt msg "65" parse_string @@ fun msg f_Allocation_SymbolSfx ->
    opt msg "48" parse_string @@ fun msg f_Allocation_SecurityID ->
    opt msg "22" parse_IDSource @@ fun msg f_Allocation_IDSource ->
    opt msg "167" parse_SecurityType @@ fun msg f_Allocation_SecurityType ->
    opt msg "200" parse_MonthYear @@ fun msg f_Allocation_MaturityMonthYear ->
    opt msg "205" parse_int @@ fun msg f_Allocation_MaturityDay ->
    opt msg "201" parse_PutOrCall @@ fun msg f_Allocation_PutOrCall ->
    opt msg "202" parse_float @@ fun msg f_Allocation_StrikePrice ->
    opt msg "206" parse_char @@ fun msg f_Allocation_OptAttribute ->
    opt msg "231" parse_float @@ fun msg f_Allocation_ContractMultiplier ->
    opt msg "223" parse_float @@ fun msg f_Allocation_CouponRate ->
    opt msg "207" parse_Exchange @@ fun msg f_Allocation_SecurityExchange ->
    opt msg "106" parse_string @@ fun msg f_Allocation_Issuer ->
    opt msg "348" parse_int @@ fun msg f_Allocation_EncodedIssuerLen ->
    opt msg "349" parse_string @@ fun msg f_Allocation_EncodedIssuer ->
    opt msg "107" parse_string @@ fun msg f_Allocation_SecurityDesc ->
    opt msg "350" parse_int @@ fun msg f_Allocation_EncodedSecurityDescLen ->
    opt msg "351" parse_string @@ fun msg f_Allocation_EncodedSecurityDesc ->
    req msg "53" parse_float @@ fun msg f_Allocation_Shares ->
    opt msg "30" parse_Exchange @@ fun msg f_Allocation_LastMkt ->
    opt msg "336" parse_string @@ fun msg f_Allocation_TradingSessionID ->
    req msg "6" parse_float @@ fun msg f_Allocation_AvgPx ->
    opt msg "15" parse_Currency @@ fun msg f_Allocation_Currency ->
    opt msg "74" parse_int @@ fun msg f_Allocation_AvgPrxPrecision ->
    req msg "75" parse_LocalMktDate @@ fun msg f_Allocation_TradeDate ->
    opt msg "60" parse_UTCTimestamp @@ fun msg f_Allocation_TransactTime ->
    opt msg "63" parse_SettlmntTyp @@ fun msg f_Allocation_SettlmntTyp ->
    opt msg "64" parse_LocalMktDate @@ fun msg f_Allocation_FutSettDate ->
    opt msg "381" parse_float @@ fun msg f_Allocation_GrossTradeAmt ->
    opt msg "118" parse_float @@ fun msg f_Allocation_NetMoney ->
    opt msg "77" parse_OpenClose @@ fun msg f_Allocation_OpenClose ->
    opt msg "58" parse_string @@ fun msg f_Allocation_Text ->
    opt msg "354" parse_int @@ fun msg f_Allocation_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_Allocation_EncodedText ->
    opt msg "157" parse_int @@ fun msg f_Allocation_NumDaysInterest ->
    opt msg "158" parse_float @@ fun msg f_Allocation_AccruedInterestRate ->
    ParseSuccess {
    f_Allocation_AllocationOrders;
    f_Allocation_AllocationExecs;
    f_Allocation_AllocationAllocs;
    f_Allocation_AllocationMiscFees;
    f_Allocation_AllocID;
    f_Allocation_AllocTransType;
    f_Allocation_RefAllocID;
    f_Allocation_AllocLinkID;
    f_Allocation_AllocLinkType;
    f_Allocation_Side;
    f_Allocation_Symbol;
    f_Allocation_SymbolSfx;
    f_Allocation_SecurityID;
    f_Allocation_IDSource;
    f_Allocation_SecurityType;
    f_Allocation_MaturityMonthYear;
    f_Allocation_MaturityDay;
    f_Allocation_PutOrCall;
    f_Allocation_StrikePrice;
    f_Allocation_OptAttribute;
    f_Allocation_ContractMultiplier;
    f_Allocation_CouponRate;
    f_Allocation_SecurityExchange;
    f_Allocation_Issuer;
    f_Allocation_EncodedIssuerLen;
    f_Allocation_EncodedIssuer;
    f_Allocation_SecurityDesc;
    f_Allocation_EncodedSecurityDescLen;
    f_Allocation_EncodedSecurityDesc;
    f_Allocation_Shares;
    f_Allocation_LastMkt;
    f_Allocation_TradingSessionID;
    f_Allocation_AvgPx;
    f_Allocation_Currency;
    f_Allocation_AvgPrxPrecision;
    f_Allocation_TradeDate;
    f_Allocation_TransactTime;
    f_Allocation_SettlmntTyp;
    f_Allocation_FutSettDate;
    f_Allocation_GrossTradeAmt;
    f_Allocation_NetMoney;
    f_Allocation_OpenClose;
    f_Allocation_Text;
    f_Allocation_EncodedTextLen;
    f_Allocation_EncodedText;
    f_Allocation_NumDaysInterest;
    f_Allocation_AccruedInterestRate;
    } , msg ) |> check_unknown_tags;;

let parse_AllocationInstructionAck msg = (
    check_duplicate_tags msg @@ fun () ->
    opt msg "109" parse_string @@ fun msg f_AllocationInstructionAck_ClientID ->
    opt msg "76" parse_string @@ fun msg f_AllocationInstructionAck_ExecBroker ->
    req msg "70" parse_string @@ fun msg f_AllocationInstructionAck_AllocID ->
    req msg "75" parse_LocalMktDate @@ fun msg f_AllocationInstructionAck_TradeDate ->
    opt msg "60" parse_UTCTimestamp @@ fun msg f_AllocationInstructionAck_TransactTime ->
    req msg "87" parse_AllocStatus @@ fun msg f_AllocationInstructionAck_AllocStatus ->
    opt msg "88" parse_AllocRejCode @@ fun msg f_AllocationInstructionAck_AllocRejCode ->
    opt msg "58" parse_string @@ fun msg f_AllocationInstructionAck_Text ->
    opt msg "354" parse_int @@ fun msg f_AllocationInstructionAck_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_AllocationInstructionAck_EncodedText ->
    ParseSuccess {
    f_AllocationInstructionAck_ClientID;
    f_AllocationInstructionAck_ExecBroker;
    f_AllocationInstructionAck_AllocID;
    f_AllocationInstructionAck_TradeDate;
    f_AllocationInstructionAck_TransactTime;
    f_AllocationInstructionAck_AllocStatus;
    f_AllocationInstructionAck_AllocRejCode;
    f_AllocationInstructionAck_Text;
    f_AllocationInstructionAck_EncodedTextLen;
    f_AllocationInstructionAck_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_BidRequest msg = (
    repeating msg "398" parse_BidRequestBidDescriptors @@ fun msg f_BidRequest_BidRequestBidDescriptors ->
    repeating msg "420" parse_BidRequestBidComponents @@ fun msg f_BidRequest_BidRequestBidComponents ->
    check_duplicate_tags msg @@ fun () ->
    opt msg "390" parse_string @@ fun msg f_BidRequest_BidID ->
    req msg "391" parse_string @@ fun msg f_BidRequest_ClientBidID ->
    req msg "374" parse_BidRequestTransType @@ fun msg f_BidRequest_BidRequestTransType ->
    opt msg "392" parse_string @@ fun msg f_BidRequest_ListName ->
    req msg "393" parse_int @@ fun msg f_BidRequest_TotalNumSecurities ->
    req msg "394" parse_int @@ fun msg f_BidRequest_BidType ->
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
    req msg "418" parse_TradeType @@ fun msg f_BidRequest_TradeType ->
    req msg "419" parse_BasisPxType @@ fun msg f_BidRequest_BasisPxType ->
    opt msg "443" parse_UTCTimestamp @@ fun msg f_BidRequest_StrikeTime ->
    opt msg "58" parse_string @@ fun msg f_BidRequest_Text ->
    opt msg "354" parse_int @@ fun msg f_BidRequest_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_BidRequest_EncodedText ->
    ParseSuccess {
    f_BidRequest_BidRequestBidDescriptors;
    f_BidRequest_BidRequestBidComponents;
    f_BidRequest_BidID;
    f_BidRequest_ClientBidID;
    f_BidRequest_BidRequestTransType;
    f_BidRequest_ListName;
    f_BidRequest_TotalNumSecurities;
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
    f_BidRequest_TradeType;
    f_BidRequest_BasisPxType;
    f_BidRequest_StrikeTime;
    f_BidRequest_Text;
    f_BidRequest_EncodedTextLen;
    f_BidRequest_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_BidResponse msg = (
    repeating msg "420" parse_BidResponseBidComponents @@ fun msg f_BidResponse_BidResponseBidComponents ->
    check_duplicate_tags msg @@ fun () ->
    opt msg "390" parse_string @@ fun msg f_BidResponse_BidID ->
    opt msg "391" parse_string @@ fun msg f_BidResponse_ClientBidID ->
    ParseSuccess {
    f_BidResponse_BidResponseBidComponents;
    f_BidResponse_BidID;
    f_BidResponse_ClientBidID;
    } , msg ) |> check_unknown_tags;;

let parse_DontKnowTrade msg = (
    check_duplicate_tags msg @@ fun () ->
    req msg "37" parse_string @@ fun msg f_DontKnowTrade_OrderID ->
    req msg "17" parse_string @@ fun msg f_DontKnowTrade_ExecID ->
    req msg "127" parse_DKReason @@ fun msg f_DontKnowTrade_DKReason ->
    req msg "55" parse_string @@ fun msg f_DontKnowTrade_Symbol ->
    opt msg "65" parse_string @@ fun msg f_DontKnowTrade_SymbolSfx ->
    opt msg "48" parse_string @@ fun msg f_DontKnowTrade_SecurityID ->
    opt msg "22" parse_IDSource @@ fun msg f_DontKnowTrade_IDSource ->
    opt msg "167" parse_SecurityType @@ fun msg f_DontKnowTrade_SecurityType ->
    opt msg "200" parse_MonthYear @@ fun msg f_DontKnowTrade_MaturityMonthYear ->
    opt msg "205" parse_int @@ fun msg f_DontKnowTrade_MaturityDay ->
    opt msg "201" parse_PutOrCall @@ fun msg f_DontKnowTrade_PutOrCall ->
    opt msg "202" parse_float @@ fun msg f_DontKnowTrade_StrikePrice ->
    opt msg "206" parse_char @@ fun msg f_DontKnowTrade_OptAttribute ->
    opt msg "231" parse_float @@ fun msg f_DontKnowTrade_ContractMultiplier ->
    opt msg "223" parse_float @@ fun msg f_DontKnowTrade_CouponRate ->
    opt msg "207" parse_Exchange @@ fun msg f_DontKnowTrade_SecurityExchange ->
    opt msg "106" parse_string @@ fun msg f_DontKnowTrade_Issuer ->
    opt msg "348" parse_int @@ fun msg f_DontKnowTrade_EncodedIssuerLen ->
    opt msg "349" parse_string @@ fun msg f_DontKnowTrade_EncodedIssuer ->
    opt msg "107" parse_string @@ fun msg f_DontKnowTrade_SecurityDesc ->
    opt msg "350" parse_int @@ fun msg f_DontKnowTrade_EncodedSecurityDescLen ->
    opt msg "351" parse_string @@ fun msg f_DontKnowTrade_EncodedSecurityDesc ->
    req msg "54" parse_Side @@ fun msg f_DontKnowTrade_Side ->
    opt msg "38" parse_float @@ fun msg f_DontKnowTrade_OrderQty ->
    opt msg "152" parse_float @@ fun msg f_DontKnowTrade_CashOrderQty ->
    opt msg "32" parse_float @@ fun msg f_DontKnowTrade_LastShares ->
    opt msg "31" parse_float @@ fun msg f_DontKnowTrade_LastPx ->
    opt msg "58" parse_string @@ fun msg f_DontKnowTrade_Text ->
    opt msg "354" parse_int @@ fun msg f_DontKnowTrade_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_DontKnowTrade_EncodedText ->
    ParseSuccess {
    f_DontKnowTrade_OrderID;
    f_DontKnowTrade_ExecID;
    f_DontKnowTrade_DKReason;
    f_DontKnowTrade_Symbol;
    f_DontKnowTrade_SymbolSfx;
    f_DontKnowTrade_SecurityID;
    f_DontKnowTrade_IDSource;
    f_DontKnowTrade_SecurityType;
    f_DontKnowTrade_MaturityMonthYear;
    f_DontKnowTrade_MaturityDay;
    f_DontKnowTrade_PutOrCall;
    f_DontKnowTrade_StrikePrice;
    f_DontKnowTrade_OptAttribute;
    f_DontKnowTrade_ContractMultiplier;
    f_DontKnowTrade_CouponRate;
    f_DontKnowTrade_SecurityExchange;
    f_DontKnowTrade_Issuer;
    f_DontKnowTrade_EncodedIssuerLen;
    f_DontKnowTrade_EncodedIssuer;
    f_DontKnowTrade_SecurityDesc;
    f_DontKnowTrade_EncodedSecurityDescLen;
    f_DontKnowTrade_EncodedSecurityDesc;
    f_DontKnowTrade_Side;
    f_DontKnowTrade_OrderQty;
    f_DontKnowTrade_CashOrderQty;
    f_DontKnowTrade_LastShares;
    f_DontKnowTrade_LastPx;
    f_DontKnowTrade_Text;
    f_DontKnowTrade_EncodedTextLen;
    f_DontKnowTrade_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_Email msg = (
    repeating msg "215" parse_EmailRoutingIDs @@ fun msg f_Email_EmailRoutingIDs ->
    repeating msg "146" parse_EmailRelatedSym @@ fun msg f_Email_EmailRelatedSym ->
    repeating msg "33" parse_EmailLinesOfText @@ fun msg f_Email_EmailLinesOfText ->
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
    f_Email_EmailRoutingIDs;
    f_Email_EmailRelatedSym;
    f_Email_EmailLinesOfText;
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
    repeating msg "382" parse_ExecutionReportContraBrokers @@ fun msg f_ExecutionReport_ExecutionReportContraBrokers ->
    check_duplicate_tags msg @@ fun () ->
    req msg "37" parse_string @@ fun msg f_ExecutionReport_OrderID ->
    opt msg "198" parse_string @@ fun msg f_ExecutionReport_SecondaryOrderID ->
    opt msg "11" parse_string @@ fun msg f_ExecutionReport_ClOrdID ->
    opt msg "41" parse_string @@ fun msg f_ExecutionReport_OrigClOrdID ->
    opt msg "109" parse_string @@ fun msg f_ExecutionReport_ClientID ->
    opt msg "76" parse_string @@ fun msg f_ExecutionReport_ExecBroker ->
    opt msg "66" parse_string @@ fun msg f_ExecutionReport_ListID ->
    req msg "17" parse_string @@ fun msg f_ExecutionReport_ExecID ->
    req msg "20" parse_ExecTransType @@ fun msg f_ExecutionReport_ExecTransType ->
    opt msg "19" parse_string @@ fun msg f_ExecutionReport_ExecRefID ->
    req msg "150" parse_ExecType @@ fun msg f_ExecutionReport_ExecType ->
    req msg "39" parse_OrdStatus @@ fun msg f_ExecutionReport_OrdStatus ->
    opt msg "103" parse_OrdRejReason @@ fun msg f_ExecutionReport_OrdRejReason ->
    opt msg "378" parse_ExecRestatementReason @@ fun msg f_ExecutionReport_ExecRestatementReason ->
    opt msg "1" parse_string @@ fun msg f_ExecutionReport_Account ->
    opt msg "63" parse_SettlmntTyp @@ fun msg f_ExecutionReport_SettlmntTyp ->
    opt msg "64" parse_LocalMktDate @@ fun msg f_ExecutionReport_FutSettDate ->
    req msg "55" parse_string @@ fun msg f_ExecutionReport_Symbol ->
    opt msg "65" parse_string @@ fun msg f_ExecutionReport_SymbolSfx ->
    opt msg "48" parse_string @@ fun msg f_ExecutionReport_SecurityID ->
    opt msg "22" parse_IDSource @@ fun msg f_ExecutionReport_IDSource ->
    opt msg "167" parse_SecurityType @@ fun msg f_ExecutionReport_SecurityType ->
    opt msg "200" parse_MonthYear @@ fun msg f_ExecutionReport_MaturityMonthYear ->
    opt msg "205" parse_int @@ fun msg f_ExecutionReport_MaturityDay ->
    opt msg "201" parse_PutOrCall @@ fun msg f_ExecutionReport_PutOrCall ->
    opt msg "202" parse_float @@ fun msg f_ExecutionReport_StrikePrice ->
    opt msg "206" parse_char @@ fun msg f_ExecutionReport_OptAttribute ->
    opt msg "231" parse_float @@ fun msg f_ExecutionReport_ContractMultiplier ->
    opt msg "223" parse_float @@ fun msg f_ExecutionReport_CouponRate ->
    opt msg "207" parse_Exchange @@ fun msg f_ExecutionReport_SecurityExchange ->
    opt msg "106" parse_string @@ fun msg f_ExecutionReport_Issuer ->
    opt msg "348" parse_int @@ fun msg f_ExecutionReport_EncodedIssuerLen ->
    opt msg "349" parse_string @@ fun msg f_ExecutionReport_EncodedIssuer ->
    opt msg "107" parse_string @@ fun msg f_ExecutionReport_SecurityDesc ->
    opt msg "350" parse_int @@ fun msg f_ExecutionReport_EncodedSecurityDescLen ->
    opt msg "351" parse_string @@ fun msg f_ExecutionReport_EncodedSecurityDesc ->
    req msg "54" parse_Side @@ fun msg f_ExecutionReport_Side ->
    opt msg "38" parse_float @@ fun msg f_ExecutionReport_OrderQty ->
    opt msg "152" parse_float @@ fun msg f_ExecutionReport_CashOrderQty ->
    opt msg "40" parse_OrdType @@ fun msg f_ExecutionReport_OrdType ->
    opt msg "44" parse_float @@ fun msg f_ExecutionReport_Price ->
    opt msg "99" parse_float @@ fun msg f_ExecutionReport_StopPx ->
    opt msg "211" parse_float @@ fun msg f_ExecutionReport_PegDifference ->
    opt msg "388" parse_DiscretionInst @@ fun msg f_ExecutionReport_DiscretionInst ->
    opt msg "389" parse_float @@ fun msg f_ExecutionReport_DiscretionOffset ->
    opt msg "15" parse_Currency @@ fun msg f_ExecutionReport_Currency ->
    opt msg "376" parse_string @@ fun msg f_ExecutionReport_ComplianceID ->
    opt msg "377" parse_SolicitedFlag @@ fun msg f_ExecutionReport_SolicitedFlag ->
    opt msg "59" parse_TimeInForce @@ fun msg f_ExecutionReport_TimeInForce ->
    opt msg "168" parse_UTCTimestamp @@ fun msg f_ExecutionReport_EffectiveTime ->
    opt msg "432" parse_LocalMktDate @@ fun msg f_ExecutionReport_ExpireDate ->
    opt msg "126" parse_UTCTimestamp @@ fun msg f_ExecutionReport_ExpireTime ->
    opt msg "18" parse_ExecInst @@ fun msg f_ExecutionReport_ExecInst ->
    opt msg "47" parse_Rule80A @@ fun msg f_ExecutionReport_Rule80A ->
    opt msg "32" parse_float @@ fun msg f_ExecutionReport_LastShares ->
    opt msg "31" parse_float @@ fun msg f_ExecutionReport_LastPx ->
    opt msg "194" parse_float @@ fun msg f_ExecutionReport_LastSpotRate ->
    opt msg "195" parse_float @@ fun msg f_ExecutionReport_LastForwardPoints ->
    opt msg "30" parse_Exchange @@ fun msg f_ExecutionReport_LastMkt ->
    opt msg "336" parse_string @@ fun msg f_ExecutionReport_TradingSessionID ->
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
    opt msg "12" parse_float @@ fun msg f_ExecutionReport_Commission ->
    opt msg "13" parse_CommType @@ fun msg f_ExecutionReport_CommType ->
    opt msg "381" parse_float @@ fun msg f_ExecutionReport_GrossTradeAmt ->
    opt msg "119" parse_float @@ fun msg f_ExecutionReport_SettlCurrAmt ->
    opt msg "120" parse_Currency @@ fun msg f_ExecutionReport_SettlCurrency ->
    opt msg "155" parse_float @@ fun msg f_ExecutionReport_SettlCurrFxRate ->
    opt msg "156" parse_char @@ fun msg f_ExecutionReport_SettlCurrFxRateCalc ->
    opt msg "21" parse_HandlInst @@ fun msg f_ExecutionReport_HandlInst ->
    opt msg "110" parse_float @@ fun msg f_ExecutionReport_MinQty ->
    opt msg "111" parse_float @@ fun msg f_ExecutionReport_MaxFloor ->
    opt msg "77" parse_OpenClose @@ fun msg f_ExecutionReport_OpenClose ->
    opt msg "210" parse_float @@ fun msg f_ExecutionReport_MaxShow ->
    opt msg "58" parse_string @@ fun msg f_ExecutionReport_Text ->
    opt msg "354" parse_int @@ fun msg f_ExecutionReport_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_ExecutionReport_EncodedText ->
    opt msg "193" parse_LocalMktDate @@ fun msg f_ExecutionReport_FutSettDate2 ->
    opt msg "192" parse_float @@ fun msg f_ExecutionReport_OrderQty2 ->
    opt msg "439" parse_string @@ fun msg f_ExecutionReport_ClearingFirm ->
    opt msg "440" parse_string @@ fun msg f_ExecutionReport_ClearingAccount ->
    opt msg "442" parse_MultiLegReportingType @@ fun msg f_ExecutionReport_MultiLegReportingType ->
    ParseSuccess {
    f_ExecutionReport_ExecutionReportContraBrokers;
    f_ExecutionReport_OrderID;
    f_ExecutionReport_SecondaryOrderID;
    f_ExecutionReport_ClOrdID;
    f_ExecutionReport_OrigClOrdID;
    f_ExecutionReport_ClientID;
    f_ExecutionReport_ExecBroker;
    f_ExecutionReport_ListID;
    f_ExecutionReport_ExecID;
    f_ExecutionReport_ExecTransType;
    f_ExecutionReport_ExecRefID;
    f_ExecutionReport_ExecType;
    f_ExecutionReport_OrdStatus;
    f_ExecutionReport_OrdRejReason;
    f_ExecutionReport_ExecRestatementReason;
    f_ExecutionReport_Account;
    f_ExecutionReport_SettlmntTyp;
    f_ExecutionReport_FutSettDate;
    f_ExecutionReport_Symbol;
    f_ExecutionReport_SymbolSfx;
    f_ExecutionReport_SecurityID;
    f_ExecutionReport_IDSource;
    f_ExecutionReport_SecurityType;
    f_ExecutionReport_MaturityMonthYear;
    f_ExecutionReport_MaturityDay;
    f_ExecutionReport_PutOrCall;
    f_ExecutionReport_StrikePrice;
    f_ExecutionReport_OptAttribute;
    f_ExecutionReport_ContractMultiplier;
    f_ExecutionReport_CouponRate;
    f_ExecutionReport_SecurityExchange;
    f_ExecutionReport_Issuer;
    f_ExecutionReport_EncodedIssuerLen;
    f_ExecutionReport_EncodedIssuer;
    f_ExecutionReport_SecurityDesc;
    f_ExecutionReport_EncodedSecurityDescLen;
    f_ExecutionReport_EncodedSecurityDesc;
    f_ExecutionReport_Side;
    f_ExecutionReport_OrderQty;
    f_ExecutionReport_CashOrderQty;
    f_ExecutionReport_OrdType;
    f_ExecutionReport_Price;
    f_ExecutionReport_StopPx;
    f_ExecutionReport_PegDifference;
    f_ExecutionReport_DiscretionInst;
    f_ExecutionReport_DiscretionOffset;
    f_ExecutionReport_Currency;
    f_ExecutionReport_ComplianceID;
    f_ExecutionReport_SolicitedFlag;
    f_ExecutionReport_TimeInForce;
    f_ExecutionReport_EffectiveTime;
    f_ExecutionReport_ExpireDate;
    f_ExecutionReport_ExpireTime;
    f_ExecutionReport_ExecInst;
    f_ExecutionReport_Rule80A;
    f_ExecutionReport_LastShares;
    f_ExecutionReport_LastPx;
    f_ExecutionReport_LastSpotRate;
    f_ExecutionReport_LastForwardPoints;
    f_ExecutionReport_LastMkt;
    f_ExecutionReport_TradingSessionID;
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
    f_ExecutionReport_Commission;
    f_ExecutionReport_CommType;
    f_ExecutionReport_GrossTradeAmt;
    f_ExecutionReport_SettlCurrAmt;
    f_ExecutionReport_SettlCurrency;
    f_ExecutionReport_SettlCurrFxRate;
    f_ExecutionReport_SettlCurrFxRateCalc;
    f_ExecutionReport_HandlInst;
    f_ExecutionReport_MinQty;
    f_ExecutionReport_MaxFloor;
    f_ExecutionReport_OpenClose;
    f_ExecutionReport_MaxShow;
    f_ExecutionReport_Text;
    f_ExecutionReport_EncodedTextLen;
    f_ExecutionReport_EncodedText;
    f_ExecutionReport_FutSettDate2;
    f_ExecutionReport_OrderQty2;
    f_ExecutionReport_ClearingFirm;
    f_ExecutionReport_ClearingAccount;
    f_ExecutionReport_MultiLegReportingType;
    } , msg ) |> check_unknown_tags;;

let parse_IOI msg = (
    repeating msg "199" parse_IOIIOIQualifiers @@ fun msg f_IOI_IOIIOIQualifiers ->
    repeating msg "215" parse_IOIRoutingIDs @@ fun msg f_IOI_IOIRoutingIDs ->
    check_duplicate_tags msg @@ fun () ->
    req msg "23" parse_string @@ fun msg f_IOI_IOIid ->
    req msg "28" parse_IOITransType @@ fun msg f_IOI_IOITransType ->
    opt msg "26" parse_string @@ fun msg f_IOI_IOIRefID ->
    req msg "55" parse_string @@ fun msg f_IOI_Symbol ->
    opt msg "65" parse_string @@ fun msg f_IOI_SymbolSfx ->
    opt msg "48" parse_string @@ fun msg f_IOI_SecurityID ->
    opt msg "22" parse_IDSource @@ fun msg f_IOI_IDSource ->
    opt msg "167" parse_SecurityType @@ fun msg f_IOI_SecurityType ->
    opt msg "200" parse_MonthYear @@ fun msg f_IOI_MaturityMonthYear ->
    opt msg "205" parse_int @@ fun msg f_IOI_MaturityDay ->
    opt msg "201" parse_PutOrCall @@ fun msg f_IOI_PutOrCall ->
    opt msg "202" parse_float @@ fun msg f_IOI_StrikePrice ->
    opt msg "206" parse_char @@ fun msg f_IOI_OptAttribute ->
    opt msg "231" parse_float @@ fun msg f_IOI_ContractMultiplier ->
    opt msg "223" parse_float @@ fun msg f_IOI_CouponRate ->
    opt msg "207" parse_Exchange @@ fun msg f_IOI_SecurityExchange ->
    opt msg "106" parse_string @@ fun msg f_IOI_Issuer ->
    opt msg "348" parse_int @@ fun msg f_IOI_EncodedIssuerLen ->
    opt msg "349" parse_string @@ fun msg f_IOI_EncodedIssuer ->
    opt msg "107" parse_string @@ fun msg f_IOI_SecurityDesc ->
    opt msg "350" parse_int @@ fun msg f_IOI_EncodedSecurityDescLen ->
    opt msg "351" parse_string @@ fun msg f_IOI_EncodedSecurityDesc ->
    req msg "54" parse_Side @@ fun msg f_IOI_Side ->
    req msg "27" parse_IOIShares @@ fun msg f_IOI_IOIShares ->
    opt msg "44" parse_float @@ fun msg f_IOI_Price ->
    opt msg "15" parse_Currency @@ fun msg f_IOI_Currency ->
    opt msg "62" parse_UTCTimestamp @@ fun msg f_IOI_ValidUntilTime ->
    opt msg "25" parse_IOIQltyInd @@ fun msg f_IOI_IOIQltyInd ->
    opt msg "130" parse_IOINaturalFlag @@ fun msg f_IOI_IOINaturalFlag ->
    opt msg "58" parse_string @@ fun msg f_IOI_Text ->
    opt msg "354" parse_int @@ fun msg f_IOI_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_IOI_EncodedText ->
    opt msg "60" parse_UTCTimestamp @@ fun msg f_IOI_TransactTime ->
    opt msg "149" parse_string @@ fun msg f_IOI_URLLink ->
    opt msg "218" parse_float @@ fun msg f_IOI_SpreadToBenchmark ->
    opt msg "219" parse_Benchmark @@ fun msg f_IOI_Benchmark ->
    ParseSuccess {
    f_IOI_IOIIOIQualifiers;
    f_IOI_IOIRoutingIDs;
    f_IOI_IOIid;
    f_IOI_IOITransType;
    f_IOI_IOIRefID;
    f_IOI_Symbol;
    f_IOI_SymbolSfx;
    f_IOI_SecurityID;
    f_IOI_IDSource;
    f_IOI_SecurityType;
    f_IOI_MaturityMonthYear;
    f_IOI_MaturityDay;
    f_IOI_PutOrCall;
    f_IOI_StrikePrice;
    f_IOI_OptAttribute;
    f_IOI_ContractMultiplier;
    f_IOI_CouponRate;
    f_IOI_SecurityExchange;
    f_IOI_Issuer;
    f_IOI_EncodedIssuerLen;
    f_IOI_EncodedIssuer;
    f_IOI_SecurityDesc;
    f_IOI_EncodedSecurityDescLen;
    f_IOI_EncodedSecurityDesc;
    f_IOI_Side;
    f_IOI_IOIShares;
    f_IOI_Price;
    f_IOI_Currency;
    f_IOI_ValidUntilTime;
    f_IOI_IOIQltyInd;
    f_IOI_IOINaturalFlag;
    f_IOI_Text;
    f_IOI_EncodedTextLen;
    f_IOI_EncodedText;
    f_IOI_TransactTime;
    f_IOI_URLLink;
    f_IOI_SpreadToBenchmark;
    f_IOI_Benchmark;
    } , msg ) |> check_unknown_tags;;

let parse_ListCancelRequest msg = (
    check_duplicate_tags msg @@ fun () ->
    req msg "66" parse_string @@ fun msg f_ListCancelRequest_ListID ->
    req msg "60" parse_UTCTimestamp @@ fun msg f_ListCancelRequest_TransactTime ->
    opt msg "58" parse_string @@ fun msg f_ListCancelRequest_Text ->
    opt msg "354" parse_int @@ fun msg f_ListCancelRequest_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_ListCancelRequest_EncodedText ->
    ParseSuccess {
    f_ListCancelRequest_ListID;
    f_ListCancelRequest_TransactTime;
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
    repeating msg "73" parse_ListStatusOrders @@ fun msg f_ListStatus_ListStatusOrders ->
    check_duplicate_tags msg @@ fun () ->
    req msg "66" parse_string @@ fun msg f_ListStatus_ListID ->
    req msg "429" parse_int @@ fun msg f_ListStatus_ListStatusType ->
    req msg "82" parse_int @@ fun msg f_ListStatus_NoRpts ->
    req msg "431" parse_int @@ fun msg f_ListStatus_ListOrderStatus ->
    req msg "83" parse_int @@ fun msg f_ListStatus_RptSeq ->
    opt msg "444" parse_string @@ fun msg f_ListStatus_ListStatusText ->
    opt msg "445" parse_int @@ fun msg f_ListStatus_EncodedListStatusTextLen ->
    opt msg "446" parse_string @@ fun msg f_ListStatus_EncodedListStatusText ->
    opt msg "60" parse_UTCTimestamp @@ fun msg f_ListStatus_TransactTime ->
    req msg "68" parse_int @@ fun msg f_ListStatus_TotNoOrders ->
    ParseSuccess {
    f_ListStatus_ListStatusOrders;
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
    repeating msg "428" parse_ListStrikePriceStrikes @@ fun msg f_ListStrikePrice_ListStrikePriceStrikes ->
    check_duplicate_tags msg @@ fun () ->
    req msg "66" parse_string @@ fun msg f_ListStrikePrice_ListID ->
    req msg "422" parse_int @@ fun msg f_ListStrikePrice_TotNoStrikes ->
    ParseSuccess {
    f_ListStrikePrice_ListStrikePriceStrikes;
    f_ListStrikePrice_ListID;
    f_ListStrikePrice_TotNoStrikes;
    } , msg ) |> check_unknown_tags;;

let parse_MarketDataIncrementalRefresh msg = (
    repeating msg "268" parse_MarketDataIncrementalRefreshMDEntries @@ fun msg f_MarketDataIncrementalRefresh_MarketDataIncrementalRefreshMDEntries ->
    check_duplicate_tags msg @@ fun () ->
    opt msg "262" parse_string @@ fun msg f_MarketDataIncrementalRefresh_MDReqID ->
    ParseSuccess {
    f_MarketDataIncrementalRefresh_MarketDataIncrementalRefreshMDEntries;
    f_MarketDataIncrementalRefresh_MDReqID;
    } , msg ) |> check_unknown_tags;;

let parse_MarketDataRequest msg = (
    repeating msg "267" parse_MarketDataRequestMDEntryTypes @@ fun msg f_MarketDataRequest_MarketDataRequestMDEntryTypes ->
    repeating msg "146" parse_MarketDataRequestRelatedSym @@ fun msg f_MarketDataRequest_MarketDataRequestRelatedSym ->
    check_duplicate_tags msg @@ fun () ->
    req msg "262" parse_string @@ fun msg f_MarketDataRequest_MDReqID ->
    req msg "263" parse_SubscriptionRequestType @@ fun msg f_MarketDataRequest_SubscriptionRequestType ->
    req msg "264" parse_int @@ fun msg f_MarketDataRequest_MarketDepth ->
    opt msg "265" parse_MDUpdateType @@ fun msg f_MarketDataRequest_MDUpdateType ->
    opt msg "266" parse_AggregatedBook @@ fun msg f_MarketDataRequest_AggregatedBook ->
    ParseSuccess {
    f_MarketDataRequest_MarketDataRequestMDEntryTypes;
    f_MarketDataRequest_MarketDataRequestRelatedSym;
    f_MarketDataRequest_MDReqID;
    f_MarketDataRequest_SubscriptionRequestType;
    f_MarketDataRequest_MarketDepth;
    f_MarketDataRequest_MDUpdateType;
    f_MarketDataRequest_AggregatedBook;
    } , msg ) |> check_unknown_tags;;

let parse_MarketDataRequestReject msg = (
    check_duplicate_tags msg @@ fun () ->
    req msg "262" parse_string @@ fun msg f_MarketDataRequestReject_MDReqID ->
    opt msg "281" parse_MDReqRejReason @@ fun msg f_MarketDataRequestReject_MDReqRejReason ->
    opt msg "58" parse_string @@ fun msg f_MarketDataRequestReject_Text ->
    opt msg "354" parse_int @@ fun msg f_MarketDataRequestReject_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_MarketDataRequestReject_EncodedText ->
    ParseSuccess {
    f_MarketDataRequestReject_MDReqID;
    f_MarketDataRequestReject_MDReqRejReason;
    f_MarketDataRequestReject_Text;
    f_MarketDataRequestReject_EncodedTextLen;
    f_MarketDataRequestReject_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_MarketDataSnapshotFullRefresh msg = (
    repeating msg "268" parse_MarketDataSnapshotFullRefreshMDEntries @@ fun msg f_MarketDataSnapshotFullRefresh_MarketDataSnapshotFullRefreshMDEntries ->
    check_duplicate_tags msg @@ fun () ->
    opt msg "262" parse_string @@ fun msg f_MarketDataSnapshotFullRefresh_MDReqID ->
    req msg "55" parse_string @@ fun msg f_MarketDataSnapshotFullRefresh_Symbol ->
    opt msg "65" parse_string @@ fun msg f_MarketDataSnapshotFullRefresh_SymbolSfx ->
    opt msg "48" parse_string @@ fun msg f_MarketDataSnapshotFullRefresh_SecurityID ->
    opt msg "22" parse_IDSource @@ fun msg f_MarketDataSnapshotFullRefresh_IDSource ->
    opt msg "167" parse_SecurityType @@ fun msg f_MarketDataSnapshotFullRefresh_SecurityType ->
    opt msg "200" parse_MonthYear @@ fun msg f_MarketDataSnapshotFullRefresh_MaturityMonthYear ->
    opt msg "205" parse_int @@ fun msg f_MarketDataSnapshotFullRefresh_MaturityDay ->
    opt msg "201" parse_PutOrCall @@ fun msg f_MarketDataSnapshotFullRefresh_PutOrCall ->
    opt msg "202" parse_float @@ fun msg f_MarketDataSnapshotFullRefresh_StrikePrice ->
    opt msg "206" parse_char @@ fun msg f_MarketDataSnapshotFullRefresh_OptAttribute ->
    opt msg "231" parse_float @@ fun msg f_MarketDataSnapshotFullRefresh_ContractMultiplier ->
    opt msg "223" parse_float @@ fun msg f_MarketDataSnapshotFullRefresh_CouponRate ->
    opt msg "207" parse_Exchange @@ fun msg f_MarketDataSnapshotFullRefresh_SecurityExchange ->
    opt msg "106" parse_string @@ fun msg f_MarketDataSnapshotFullRefresh_Issuer ->
    opt msg "348" parse_int @@ fun msg f_MarketDataSnapshotFullRefresh_EncodedIssuerLen ->
    opt msg "349" parse_string @@ fun msg f_MarketDataSnapshotFullRefresh_EncodedIssuer ->
    opt msg "107" parse_string @@ fun msg f_MarketDataSnapshotFullRefresh_SecurityDesc ->
    opt msg "350" parse_int @@ fun msg f_MarketDataSnapshotFullRefresh_EncodedSecurityDescLen ->
    opt msg "351" parse_string @@ fun msg f_MarketDataSnapshotFullRefresh_EncodedSecurityDesc ->
    opt msg "291" parse_FinancialStatus @@ fun msg f_MarketDataSnapshotFullRefresh_FinancialStatus ->
    opt msg "292" parse_CorporateAction @@ fun msg f_MarketDataSnapshotFullRefresh_CorporateAction ->
    opt msg "387" parse_float @@ fun msg f_MarketDataSnapshotFullRefresh_TotalVolumeTraded ->
    ParseSuccess {
    f_MarketDataSnapshotFullRefresh_MarketDataSnapshotFullRefreshMDEntries;
    f_MarketDataSnapshotFullRefresh_MDReqID;
    f_MarketDataSnapshotFullRefresh_Symbol;
    f_MarketDataSnapshotFullRefresh_SymbolSfx;
    f_MarketDataSnapshotFullRefresh_SecurityID;
    f_MarketDataSnapshotFullRefresh_IDSource;
    f_MarketDataSnapshotFullRefresh_SecurityType;
    f_MarketDataSnapshotFullRefresh_MaturityMonthYear;
    f_MarketDataSnapshotFullRefresh_MaturityDay;
    f_MarketDataSnapshotFullRefresh_PutOrCall;
    f_MarketDataSnapshotFullRefresh_StrikePrice;
    f_MarketDataSnapshotFullRefresh_OptAttribute;
    f_MarketDataSnapshotFullRefresh_ContractMultiplier;
    f_MarketDataSnapshotFullRefresh_CouponRate;
    f_MarketDataSnapshotFullRefresh_SecurityExchange;
    f_MarketDataSnapshotFullRefresh_Issuer;
    f_MarketDataSnapshotFullRefresh_EncodedIssuerLen;
    f_MarketDataSnapshotFullRefresh_EncodedIssuer;
    f_MarketDataSnapshotFullRefresh_SecurityDesc;
    f_MarketDataSnapshotFullRefresh_EncodedSecurityDescLen;
    f_MarketDataSnapshotFullRefresh_EncodedSecurityDesc;
    f_MarketDataSnapshotFullRefresh_FinancialStatus;
    f_MarketDataSnapshotFullRefresh_CorporateAction;
    f_MarketDataSnapshotFullRefresh_TotalVolumeTraded;
    } , msg ) |> check_unknown_tags;;

let parse_MassQuote msg = (
    repeating msg "296" parse_MassQuoteQuoteSets @@ fun msg f_MassQuote_MassQuoteQuoteSets ->
    repeating msg "295" parse_MassQuoteQuoteEntries @@ fun msg f_MassQuote_MassQuoteQuoteEntries ->
    check_duplicate_tags msg @@ fun () ->
    opt msg "131" parse_string @@ fun msg f_MassQuote_QuoteReqID ->
    req msg "117" parse_string @@ fun msg f_MassQuote_QuoteID ->
    opt msg "301" parse_QuoteResponseLevel @@ fun msg f_MassQuote_QuoteResponseLevel ->
    opt msg "293" parse_float @@ fun msg f_MassQuote_DefBidSize ->
    opt msg "294" parse_float @@ fun msg f_MassQuote_DefOfferSize ->
    ParseSuccess {
    f_MassQuote_MassQuoteQuoteSets;
    f_MassQuote_MassQuoteQuoteEntries;
    f_MassQuote_QuoteReqID;
    f_MassQuote_QuoteID;
    f_MassQuote_QuoteResponseLevel;
    f_MassQuote_DefBidSize;
    f_MassQuote_DefOfferSize;
    } , msg ) |> check_unknown_tags;;

let parse_News msg = (
    repeating msg "215" parse_NewsRoutingIDs @@ fun msg f_News_NewsRoutingIDs ->
    repeating msg "146" parse_NewsRelatedSym @@ fun msg f_News_NewsRelatedSym ->
    repeating msg "33" parse_NewsLinesOfText @@ fun msg f_News_NewsLinesOfText ->
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
    f_News_NewsRoutingIDs;
    f_News_NewsRelatedSym;
    f_News_NewsLinesOfText;
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
    req msg "11" parse_string @@ fun msg f_OrderCancelReject_ClOrdID ->
    req msg "41" parse_string @@ fun msg f_OrderCancelReject_OrigClOrdID ->
    req msg "39" parse_OrdStatus @@ fun msg f_OrderCancelReject_OrdStatus ->
    opt msg "109" parse_string @@ fun msg f_OrderCancelReject_ClientID ->
    opt msg "76" parse_string @@ fun msg f_OrderCancelReject_ExecBroker ->
    opt msg "66" parse_string @@ fun msg f_OrderCancelReject_ListID ->
    opt msg "1" parse_string @@ fun msg f_OrderCancelReject_Account ->
    opt msg "60" parse_UTCTimestamp @@ fun msg f_OrderCancelReject_TransactTime ->
    req msg "434" parse_CxlRejResponseTo @@ fun msg f_OrderCancelReject_CxlRejResponseTo ->
    opt msg "102" parse_CxlRejReason @@ fun msg f_OrderCancelReject_CxlRejReason ->
    opt msg "58" parse_string @@ fun msg f_OrderCancelReject_Text ->
    opt msg "354" parse_int @@ fun msg f_OrderCancelReject_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_OrderCancelReject_EncodedText ->
    ParseSuccess {
    f_OrderCancelReject_OrderID;
    f_OrderCancelReject_SecondaryOrderID;
    f_OrderCancelReject_ClOrdID;
    f_OrderCancelReject_OrigClOrdID;
    f_OrderCancelReject_OrdStatus;
    f_OrderCancelReject_ClientID;
    f_OrderCancelReject_ExecBroker;
    f_OrderCancelReject_ListID;
    f_OrderCancelReject_Account;
    f_OrderCancelReject_TransactTime;
    f_OrderCancelReject_CxlRejResponseTo;
    f_OrderCancelReject_CxlRejReason;
    f_OrderCancelReject_Text;
    f_OrderCancelReject_EncodedTextLen;
    f_OrderCancelReject_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_OrderCancelReplaceRequest msg = (
    repeating msg "78" parse_OrderCancelReplaceRequestAllocs @@ fun msg f_OrderCancelReplaceRequest_OrderCancelReplaceRequestAllocs ->
    repeating msg "386" parse_OrderCancelReplaceRequestTradingSessions @@ fun msg f_OrderCancelReplaceRequest_OrderCancelReplaceRequestTradingSessions ->
    check_duplicate_tags msg @@ fun () ->
    opt msg "37" parse_string @@ fun msg f_OrderCancelReplaceRequest_OrderID ->
    opt msg "109" parse_string @@ fun msg f_OrderCancelReplaceRequest_ClientID ->
    opt msg "76" parse_string @@ fun msg f_OrderCancelReplaceRequest_ExecBroker ->
    req msg "41" parse_string @@ fun msg f_OrderCancelReplaceRequest_OrigClOrdID ->
    req msg "11" parse_string @@ fun msg f_OrderCancelReplaceRequest_ClOrdID ->
    opt msg "66" parse_string @@ fun msg f_OrderCancelReplaceRequest_ListID ->
    opt msg "1" parse_string @@ fun msg f_OrderCancelReplaceRequest_Account ->
    opt msg "63" parse_SettlmntTyp @@ fun msg f_OrderCancelReplaceRequest_SettlmntTyp ->
    opt msg "64" parse_LocalMktDate @@ fun msg f_OrderCancelReplaceRequest_FutSettDate ->
    req msg "21" parse_HandlInst @@ fun msg f_OrderCancelReplaceRequest_HandlInst ->
    opt msg "18" parse_ExecInst @@ fun msg f_OrderCancelReplaceRequest_ExecInst ->
    opt msg "110" parse_float @@ fun msg f_OrderCancelReplaceRequest_MinQty ->
    opt msg "111" parse_float @@ fun msg f_OrderCancelReplaceRequest_MaxFloor ->
    opt msg "100" parse_Exchange @@ fun msg f_OrderCancelReplaceRequest_ExDestination ->
    req msg "55" parse_string @@ fun msg f_OrderCancelReplaceRequest_Symbol ->
    opt msg "65" parse_string @@ fun msg f_OrderCancelReplaceRequest_SymbolSfx ->
    opt msg "48" parse_string @@ fun msg f_OrderCancelReplaceRequest_SecurityID ->
    opt msg "22" parse_IDSource @@ fun msg f_OrderCancelReplaceRequest_IDSource ->
    opt msg "167" parse_SecurityType @@ fun msg f_OrderCancelReplaceRequest_SecurityType ->
    opt msg "200" parse_MonthYear @@ fun msg f_OrderCancelReplaceRequest_MaturityMonthYear ->
    opt msg "205" parse_int @@ fun msg f_OrderCancelReplaceRequest_MaturityDay ->
    opt msg "201" parse_PutOrCall @@ fun msg f_OrderCancelReplaceRequest_PutOrCall ->
    opt msg "202" parse_float @@ fun msg f_OrderCancelReplaceRequest_StrikePrice ->
    opt msg "206" parse_char @@ fun msg f_OrderCancelReplaceRequest_OptAttribute ->
    opt msg "231" parse_float @@ fun msg f_OrderCancelReplaceRequest_ContractMultiplier ->
    opt msg "223" parse_float @@ fun msg f_OrderCancelReplaceRequest_CouponRate ->
    opt msg "207" parse_Exchange @@ fun msg f_OrderCancelReplaceRequest_SecurityExchange ->
    opt msg "106" parse_string @@ fun msg f_OrderCancelReplaceRequest_Issuer ->
    opt msg "348" parse_int @@ fun msg f_OrderCancelReplaceRequest_EncodedIssuerLen ->
    opt msg "349" parse_string @@ fun msg f_OrderCancelReplaceRequest_EncodedIssuer ->
    opt msg "107" parse_string @@ fun msg f_OrderCancelReplaceRequest_SecurityDesc ->
    opt msg "350" parse_int @@ fun msg f_OrderCancelReplaceRequest_EncodedSecurityDescLen ->
    opt msg "351" parse_string @@ fun msg f_OrderCancelReplaceRequest_EncodedSecurityDesc ->
    req msg "54" parse_Side @@ fun msg f_OrderCancelReplaceRequest_Side ->
    req msg "60" parse_UTCTimestamp @@ fun msg f_OrderCancelReplaceRequest_TransactTime ->
    opt msg "38" parse_float @@ fun msg f_OrderCancelReplaceRequest_OrderQty ->
    opt msg "152" parse_float @@ fun msg f_OrderCancelReplaceRequest_CashOrderQty ->
    req msg "40" parse_OrdType @@ fun msg f_OrderCancelReplaceRequest_OrdType ->
    opt msg "44" parse_float @@ fun msg f_OrderCancelReplaceRequest_Price ->
    opt msg "99" parse_float @@ fun msg f_OrderCancelReplaceRequest_StopPx ->
    opt msg "211" parse_float @@ fun msg f_OrderCancelReplaceRequest_PegDifference ->
    opt msg "388" parse_DiscretionInst @@ fun msg f_OrderCancelReplaceRequest_DiscretionInst ->
    opt msg "389" parse_float @@ fun msg f_OrderCancelReplaceRequest_DiscretionOffset ->
    opt msg "376" parse_string @@ fun msg f_OrderCancelReplaceRequest_ComplianceID ->
    opt msg "377" parse_SolicitedFlag @@ fun msg f_OrderCancelReplaceRequest_SolicitedFlag ->
    opt msg "15" parse_Currency @@ fun msg f_OrderCancelReplaceRequest_Currency ->
    opt msg "59" parse_TimeInForce @@ fun msg f_OrderCancelReplaceRequest_TimeInForce ->
    opt msg "168" parse_UTCTimestamp @@ fun msg f_OrderCancelReplaceRequest_EffectiveTime ->
    opt msg "432" parse_LocalMktDate @@ fun msg f_OrderCancelReplaceRequest_ExpireDate ->
    opt msg "126" parse_UTCTimestamp @@ fun msg f_OrderCancelReplaceRequest_ExpireTime ->
    opt msg "427" parse_GTBookingInst @@ fun msg f_OrderCancelReplaceRequest_GTBookingInst ->
    opt msg "12" parse_float @@ fun msg f_OrderCancelReplaceRequest_Commission ->
    opt msg "13" parse_CommType @@ fun msg f_OrderCancelReplaceRequest_CommType ->
    opt msg "47" parse_Rule80A @@ fun msg f_OrderCancelReplaceRequest_Rule80A ->
    opt msg "121" parse_ForexReq @@ fun msg f_OrderCancelReplaceRequest_ForexReq ->
    opt msg "120" parse_Currency @@ fun msg f_OrderCancelReplaceRequest_SettlCurrency ->
    opt msg "58" parse_string @@ fun msg f_OrderCancelReplaceRequest_Text ->
    opt msg "354" parse_int @@ fun msg f_OrderCancelReplaceRequest_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_OrderCancelReplaceRequest_EncodedText ->
    opt msg "193" parse_LocalMktDate @@ fun msg f_OrderCancelReplaceRequest_FutSettDate2 ->
    opt msg "192" parse_float @@ fun msg f_OrderCancelReplaceRequest_OrderQty2 ->
    opt msg "77" parse_OpenClose @@ fun msg f_OrderCancelReplaceRequest_OpenClose ->
    opt msg "203" parse_CoveredOrUncovered @@ fun msg f_OrderCancelReplaceRequest_CoveredOrUncovered ->
    opt msg "204" parse_CustomerOrFirm @@ fun msg f_OrderCancelReplaceRequest_CustomerOrFirm ->
    opt msg "210" parse_float @@ fun msg f_OrderCancelReplaceRequest_MaxShow ->
    opt msg "114" parse_LocateReqd @@ fun msg f_OrderCancelReplaceRequest_LocateReqd ->
    opt msg "439" parse_string @@ fun msg f_OrderCancelReplaceRequest_ClearingFirm ->
    opt msg "440" parse_string @@ fun msg f_OrderCancelReplaceRequest_ClearingAccount ->
    ParseSuccess {
    f_OrderCancelReplaceRequest_OrderCancelReplaceRequestAllocs;
    f_OrderCancelReplaceRequest_OrderCancelReplaceRequestTradingSessions;
    f_OrderCancelReplaceRequest_OrderID;
    f_OrderCancelReplaceRequest_ClientID;
    f_OrderCancelReplaceRequest_ExecBroker;
    f_OrderCancelReplaceRequest_OrigClOrdID;
    f_OrderCancelReplaceRequest_ClOrdID;
    f_OrderCancelReplaceRequest_ListID;
    f_OrderCancelReplaceRequest_Account;
    f_OrderCancelReplaceRequest_SettlmntTyp;
    f_OrderCancelReplaceRequest_FutSettDate;
    f_OrderCancelReplaceRequest_HandlInst;
    f_OrderCancelReplaceRequest_ExecInst;
    f_OrderCancelReplaceRequest_MinQty;
    f_OrderCancelReplaceRequest_MaxFloor;
    f_OrderCancelReplaceRequest_ExDestination;
    f_OrderCancelReplaceRequest_Symbol;
    f_OrderCancelReplaceRequest_SymbolSfx;
    f_OrderCancelReplaceRequest_SecurityID;
    f_OrderCancelReplaceRequest_IDSource;
    f_OrderCancelReplaceRequest_SecurityType;
    f_OrderCancelReplaceRequest_MaturityMonthYear;
    f_OrderCancelReplaceRequest_MaturityDay;
    f_OrderCancelReplaceRequest_PutOrCall;
    f_OrderCancelReplaceRequest_StrikePrice;
    f_OrderCancelReplaceRequest_OptAttribute;
    f_OrderCancelReplaceRequest_ContractMultiplier;
    f_OrderCancelReplaceRequest_CouponRate;
    f_OrderCancelReplaceRequest_SecurityExchange;
    f_OrderCancelReplaceRequest_Issuer;
    f_OrderCancelReplaceRequest_EncodedIssuerLen;
    f_OrderCancelReplaceRequest_EncodedIssuer;
    f_OrderCancelReplaceRequest_SecurityDesc;
    f_OrderCancelReplaceRequest_EncodedSecurityDescLen;
    f_OrderCancelReplaceRequest_EncodedSecurityDesc;
    f_OrderCancelReplaceRequest_Side;
    f_OrderCancelReplaceRequest_TransactTime;
    f_OrderCancelReplaceRequest_OrderQty;
    f_OrderCancelReplaceRequest_CashOrderQty;
    f_OrderCancelReplaceRequest_OrdType;
    f_OrderCancelReplaceRequest_Price;
    f_OrderCancelReplaceRequest_StopPx;
    f_OrderCancelReplaceRequest_PegDifference;
    f_OrderCancelReplaceRequest_DiscretionInst;
    f_OrderCancelReplaceRequest_DiscretionOffset;
    f_OrderCancelReplaceRequest_ComplianceID;
    f_OrderCancelReplaceRequest_SolicitedFlag;
    f_OrderCancelReplaceRequest_Currency;
    f_OrderCancelReplaceRequest_TimeInForce;
    f_OrderCancelReplaceRequest_EffectiveTime;
    f_OrderCancelReplaceRequest_ExpireDate;
    f_OrderCancelReplaceRequest_ExpireTime;
    f_OrderCancelReplaceRequest_GTBookingInst;
    f_OrderCancelReplaceRequest_Commission;
    f_OrderCancelReplaceRequest_CommType;
    f_OrderCancelReplaceRequest_Rule80A;
    f_OrderCancelReplaceRequest_ForexReq;
    f_OrderCancelReplaceRequest_SettlCurrency;
    f_OrderCancelReplaceRequest_Text;
    f_OrderCancelReplaceRequest_EncodedTextLen;
    f_OrderCancelReplaceRequest_EncodedText;
    f_OrderCancelReplaceRequest_FutSettDate2;
    f_OrderCancelReplaceRequest_OrderQty2;
    f_OrderCancelReplaceRequest_OpenClose;
    f_OrderCancelReplaceRequest_CoveredOrUncovered;
    f_OrderCancelReplaceRequest_CustomerOrFirm;
    f_OrderCancelReplaceRequest_MaxShow;
    f_OrderCancelReplaceRequest_LocateReqd;
    f_OrderCancelReplaceRequest_ClearingFirm;
    f_OrderCancelReplaceRequest_ClearingAccount;
    } , msg ) |> check_unknown_tags;;

let parse_OrderCancelRequest msg = (
    check_duplicate_tags msg @@ fun () ->
    req msg "41" parse_string @@ fun msg f_OrderCancelRequest_OrigClOrdID ->
    opt msg "37" parse_string @@ fun msg f_OrderCancelRequest_OrderID ->
    req msg "11" parse_string @@ fun msg f_OrderCancelRequest_ClOrdID ->
    opt msg "66" parse_string @@ fun msg f_OrderCancelRequest_ListID ->
    opt msg "1" parse_string @@ fun msg f_OrderCancelRequest_Account ->
    opt msg "109" parse_string @@ fun msg f_OrderCancelRequest_ClientID ->
    opt msg "76" parse_string @@ fun msg f_OrderCancelRequest_ExecBroker ->
    req msg "55" parse_string @@ fun msg f_OrderCancelRequest_Symbol ->
    opt msg "65" parse_string @@ fun msg f_OrderCancelRequest_SymbolSfx ->
    opt msg "48" parse_string @@ fun msg f_OrderCancelRequest_SecurityID ->
    opt msg "22" parse_IDSource @@ fun msg f_OrderCancelRequest_IDSource ->
    opt msg "167" parse_SecurityType @@ fun msg f_OrderCancelRequest_SecurityType ->
    opt msg "200" parse_MonthYear @@ fun msg f_OrderCancelRequest_MaturityMonthYear ->
    opt msg "205" parse_int @@ fun msg f_OrderCancelRequest_MaturityDay ->
    opt msg "201" parse_PutOrCall @@ fun msg f_OrderCancelRequest_PutOrCall ->
    opt msg "202" parse_float @@ fun msg f_OrderCancelRequest_StrikePrice ->
    opt msg "206" parse_char @@ fun msg f_OrderCancelRequest_OptAttribute ->
    opt msg "231" parse_float @@ fun msg f_OrderCancelRequest_ContractMultiplier ->
    opt msg "223" parse_float @@ fun msg f_OrderCancelRequest_CouponRate ->
    opt msg "207" parse_Exchange @@ fun msg f_OrderCancelRequest_SecurityExchange ->
    opt msg "106" parse_string @@ fun msg f_OrderCancelRequest_Issuer ->
    opt msg "348" parse_int @@ fun msg f_OrderCancelRequest_EncodedIssuerLen ->
    opt msg "349" parse_string @@ fun msg f_OrderCancelRequest_EncodedIssuer ->
    opt msg "107" parse_string @@ fun msg f_OrderCancelRequest_SecurityDesc ->
    opt msg "350" parse_int @@ fun msg f_OrderCancelRequest_EncodedSecurityDescLen ->
    opt msg "351" parse_string @@ fun msg f_OrderCancelRequest_EncodedSecurityDesc ->
    req msg "54" parse_Side @@ fun msg f_OrderCancelRequest_Side ->
    req msg "60" parse_UTCTimestamp @@ fun msg f_OrderCancelRequest_TransactTime ->
    opt msg "38" parse_float @@ fun msg f_OrderCancelRequest_OrderQty ->
    opt msg "152" parse_float @@ fun msg f_OrderCancelRequest_CashOrderQty ->
    opt msg "376" parse_string @@ fun msg f_OrderCancelRequest_ComplianceID ->
    opt msg "377" parse_SolicitedFlag @@ fun msg f_OrderCancelRequest_SolicitedFlag ->
    opt msg "58" parse_string @@ fun msg f_OrderCancelRequest_Text ->
    opt msg "354" parse_int @@ fun msg f_OrderCancelRequest_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_OrderCancelRequest_EncodedText ->
    ParseSuccess {
    f_OrderCancelRequest_OrigClOrdID;
    f_OrderCancelRequest_OrderID;
    f_OrderCancelRequest_ClOrdID;
    f_OrderCancelRequest_ListID;
    f_OrderCancelRequest_Account;
    f_OrderCancelRequest_ClientID;
    f_OrderCancelRequest_ExecBroker;
    f_OrderCancelRequest_Symbol;
    f_OrderCancelRequest_SymbolSfx;
    f_OrderCancelRequest_SecurityID;
    f_OrderCancelRequest_IDSource;
    f_OrderCancelRequest_SecurityType;
    f_OrderCancelRequest_MaturityMonthYear;
    f_OrderCancelRequest_MaturityDay;
    f_OrderCancelRequest_PutOrCall;
    f_OrderCancelRequest_StrikePrice;
    f_OrderCancelRequest_OptAttribute;
    f_OrderCancelRequest_ContractMultiplier;
    f_OrderCancelRequest_CouponRate;
    f_OrderCancelRequest_SecurityExchange;
    f_OrderCancelRequest_Issuer;
    f_OrderCancelRequest_EncodedIssuerLen;
    f_OrderCancelRequest_EncodedIssuer;
    f_OrderCancelRequest_SecurityDesc;
    f_OrderCancelRequest_EncodedSecurityDescLen;
    f_OrderCancelRequest_EncodedSecurityDesc;
    f_OrderCancelRequest_Side;
    f_OrderCancelRequest_TransactTime;
    f_OrderCancelRequest_OrderQty;
    f_OrderCancelRequest_CashOrderQty;
    f_OrderCancelRequest_ComplianceID;
    f_OrderCancelRequest_SolicitedFlag;
    f_OrderCancelRequest_Text;
    f_OrderCancelRequest_EncodedTextLen;
    f_OrderCancelRequest_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_OrderList msg = (
    repeating msg "73" parse_OrderListOrders @@ fun msg f_OrderList_OrderListOrders ->
    repeating msg "78" parse_OrderListAllocs @@ fun msg f_OrderList_OrderListAllocs ->
    repeating msg "386" parse_OrderListTradingSessions @@ fun msg f_OrderList_OrderListTradingSessions ->
    check_duplicate_tags msg @@ fun () ->
    req msg "66" parse_string @@ fun msg f_OrderList_ListID ->
    opt msg "390" parse_string @@ fun msg f_OrderList_BidID ->
    opt msg "391" parse_string @@ fun msg f_OrderList_ClientBidID ->
    opt msg "414" parse_ProgRptReqs @@ fun msg f_OrderList_ProgRptReqs ->
    req msg "394" parse_int @@ fun msg f_OrderList_BidType ->
    opt msg "415" parse_int @@ fun msg f_OrderList_ProgPeriodInterval ->
    opt msg "433" parse_ListExecInstType @@ fun msg f_OrderList_ListExecInstType ->
    opt msg "69" parse_string @@ fun msg f_OrderList_ListExecInst ->
    opt msg "352" parse_int @@ fun msg f_OrderList_EncodedListExecInstLen ->
    opt msg "353" parse_string @@ fun msg f_OrderList_EncodedListExecInst ->
    req msg "68" parse_int @@ fun msg f_OrderList_TotNoOrders ->
    ParseSuccess {
    f_OrderList_OrderListOrders;
    f_OrderList_OrderListAllocs;
    f_OrderList_OrderListTradingSessions;
    f_OrderList_ListID;
    f_OrderList_BidID;
    f_OrderList_ClientBidID;
    f_OrderList_ProgRptReqs;
    f_OrderList_BidType;
    f_OrderList_ProgPeriodInterval;
    f_OrderList_ListExecInstType;
    f_OrderList_ListExecInst;
    f_OrderList_EncodedListExecInstLen;
    f_OrderList_EncodedListExecInst;
    f_OrderList_TotNoOrders;
    } , msg ) |> check_unknown_tags;;

let parse_OrderSingle msg = (
    repeating msg "78" parse_OrderSingleAllocs @@ fun msg f_OrderSingle_OrderSingleAllocs ->
    repeating msg "386" parse_OrderSingleTradingSessions @@ fun msg f_OrderSingle_OrderSingleTradingSessions ->
    check_duplicate_tags msg @@ fun () ->
    req msg "11" parse_string @@ fun msg f_OrderSingle_ClOrdID ->
    opt msg "109" parse_string @@ fun msg f_OrderSingle_ClientID ->
    opt msg "76" parse_string @@ fun msg f_OrderSingle_ExecBroker ->
    opt msg "1" parse_string @@ fun msg f_OrderSingle_Account ->
    opt msg "63" parse_SettlmntTyp @@ fun msg f_OrderSingle_SettlmntTyp ->
    opt msg "64" parse_LocalMktDate @@ fun msg f_OrderSingle_FutSettDate ->
    req msg "21" parse_HandlInst @@ fun msg f_OrderSingle_HandlInst ->
    opt msg "18" parse_ExecInst @@ fun msg f_OrderSingle_ExecInst ->
    opt msg "110" parse_float @@ fun msg f_OrderSingle_MinQty ->
    opt msg "111" parse_float @@ fun msg f_OrderSingle_MaxFloor ->
    opt msg "100" parse_Exchange @@ fun msg f_OrderSingle_ExDestination ->
    opt msg "81" parse_ProcessCode @@ fun msg f_OrderSingle_ProcessCode ->
    req msg "55" parse_string @@ fun msg f_OrderSingle_Symbol ->
    opt msg "65" parse_string @@ fun msg f_OrderSingle_SymbolSfx ->
    opt msg "48" parse_string @@ fun msg f_OrderSingle_SecurityID ->
    opt msg "22" parse_IDSource @@ fun msg f_OrderSingle_IDSource ->
    opt msg "167" parse_SecurityType @@ fun msg f_OrderSingle_SecurityType ->
    opt msg "200" parse_MonthYear @@ fun msg f_OrderSingle_MaturityMonthYear ->
    opt msg "205" parse_int @@ fun msg f_OrderSingle_MaturityDay ->
    opt msg "201" parse_PutOrCall @@ fun msg f_OrderSingle_PutOrCall ->
    opt msg "202" parse_float @@ fun msg f_OrderSingle_StrikePrice ->
    opt msg "206" parse_char @@ fun msg f_OrderSingle_OptAttribute ->
    opt msg "231" parse_float @@ fun msg f_OrderSingle_ContractMultiplier ->
    opt msg "223" parse_float @@ fun msg f_OrderSingle_CouponRate ->
    opt msg "207" parse_Exchange @@ fun msg f_OrderSingle_SecurityExchange ->
    opt msg "106" parse_string @@ fun msg f_OrderSingle_Issuer ->
    opt msg "348" parse_int @@ fun msg f_OrderSingle_EncodedIssuerLen ->
    opt msg "349" parse_string @@ fun msg f_OrderSingle_EncodedIssuer ->
    opt msg "107" parse_string @@ fun msg f_OrderSingle_SecurityDesc ->
    opt msg "350" parse_int @@ fun msg f_OrderSingle_EncodedSecurityDescLen ->
    opt msg "351" parse_string @@ fun msg f_OrderSingle_EncodedSecurityDesc ->
    opt msg "140" parse_float @@ fun msg f_OrderSingle_PrevClosePx ->
    req msg "54" parse_Side @@ fun msg f_OrderSingle_Side ->
    opt msg "114" parse_LocateReqd @@ fun msg f_OrderSingle_LocateReqd ->
    req msg "60" parse_UTCTimestamp @@ fun msg f_OrderSingle_TransactTime ->
    opt msg "38" parse_float @@ fun msg f_OrderSingle_OrderQty ->
    opt msg "152" parse_float @@ fun msg f_OrderSingle_CashOrderQty ->
    req msg "40" parse_OrdType @@ fun msg f_OrderSingle_OrdType ->
    opt msg "44" parse_float @@ fun msg f_OrderSingle_Price ->
    opt msg "99" parse_float @@ fun msg f_OrderSingle_StopPx ->
    opt msg "15" parse_Currency @@ fun msg f_OrderSingle_Currency ->
    opt msg "376" parse_string @@ fun msg f_OrderSingle_ComplianceID ->
    opt msg "377" parse_SolicitedFlag @@ fun msg f_OrderSingle_SolicitedFlag ->
    opt msg "23" parse_string @@ fun msg f_OrderSingle_IOIid ->
    opt msg "117" parse_string @@ fun msg f_OrderSingle_QuoteID ->
    opt msg "59" parse_TimeInForce @@ fun msg f_OrderSingle_TimeInForce ->
    opt msg "168" parse_UTCTimestamp @@ fun msg f_OrderSingle_EffectiveTime ->
    opt msg "432" parse_LocalMktDate @@ fun msg f_OrderSingle_ExpireDate ->
    opt msg "126" parse_UTCTimestamp @@ fun msg f_OrderSingle_ExpireTime ->
    opt msg "427" parse_GTBookingInst @@ fun msg f_OrderSingle_GTBookingInst ->
    opt msg "12" parse_float @@ fun msg f_OrderSingle_Commission ->
    opt msg "13" parse_CommType @@ fun msg f_OrderSingle_CommType ->
    opt msg "47" parse_Rule80A @@ fun msg f_OrderSingle_Rule80A ->
    opt msg "121" parse_ForexReq @@ fun msg f_OrderSingle_ForexReq ->
    opt msg "120" parse_Currency @@ fun msg f_OrderSingle_SettlCurrency ->
    opt msg "58" parse_string @@ fun msg f_OrderSingle_Text ->
    opt msg "354" parse_int @@ fun msg f_OrderSingle_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_OrderSingle_EncodedText ->
    opt msg "193" parse_LocalMktDate @@ fun msg f_OrderSingle_FutSettDate2 ->
    opt msg "192" parse_float @@ fun msg f_OrderSingle_OrderQty2 ->
    opt msg "77" parse_OpenClose @@ fun msg f_OrderSingle_OpenClose ->
    opt msg "203" parse_CoveredOrUncovered @@ fun msg f_OrderSingle_CoveredOrUncovered ->
    opt msg "204" parse_CustomerOrFirm @@ fun msg f_OrderSingle_CustomerOrFirm ->
    opt msg "210" parse_float @@ fun msg f_OrderSingle_MaxShow ->
    opt msg "211" parse_float @@ fun msg f_OrderSingle_PegDifference ->
    opt msg "388" parse_DiscretionInst @@ fun msg f_OrderSingle_DiscretionInst ->
    opt msg "389" parse_float @@ fun msg f_OrderSingle_DiscretionOffset ->
    opt msg "439" parse_string @@ fun msg f_OrderSingle_ClearingFirm ->
    opt msg "440" parse_string @@ fun msg f_OrderSingle_ClearingAccount ->
    ParseSuccess {
    f_OrderSingle_OrderSingleAllocs;
    f_OrderSingle_OrderSingleTradingSessions;
    f_OrderSingle_ClOrdID;
    f_OrderSingle_ClientID;
    f_OrderSingle_ExecBroker;
    f_OrderSingle_Account;
    f_OrderSingle_SettlmntTyp;
    f_OrderSingle_FutSettDate;
    f_OrderSingle_HandlInst;
    f_OrderSingle_ExecInst;
    f_OrderSingle_MinQty;
    f_OrderSingle_MaxFloor;
    f_OrderSingle_ExDestination;
    f_OrderSingle_ProcessCode;
    f_OrderSingle_Symbol;
    f_OrderSingle_SymbolSfx;
    f_OrderSingle_SecurityID;
    f_OrderSingle_IDSource;
    f_OrderSingle_SecurityType;
    f_OrderSingle_MaturityMonthYear;
    f_OrderSingle_MaturityDay;
    f_OrderSingle_PutOrCall;
    f_OrderSingle_StrikePrice;
    f_OrderSingle_OptAttribute;
    f_OrderSingle_ContractMultiplier;
    f_OrderSingle_CouponRate;
    f_OrderSingle_SecurityExchange;
    f_OrderSingle_Issuer;
    f_OrderSingle_EncodedIssuerLen;
    f_OrderSingle_EncodedIssuer;
    f_OrderSingle_SecurityDesc;
    f_OrderSingle_EncodedSecurityDescLen;
    f_OrderSingle_EncodedSecurityDesc;
    f_OrderSingle_PrevClosePx;
    f_OrderSingle_Side;
    f_OrderSingle_LocateReqd;
    f_OrderSingle_TransactTime;
    f_OrderSingle_OrderQty;
    f_OrderSingle_CashOrderQty;
    f_OrderSingle_OrdType;
    f_OrderSingle_Price;
    f_OrderSingle_StopPx;
    f_OrderSingle_Currency;
    f_OrderSingle_ComplianceID;
    f_OrderSingle_SolicitedFlag;
    f_OrderSingle_IOIid;
    f_OrderSingle_QuoteID;
    f_OrderSingle_TimeInForce;
    f_OrderSingle_EffectiveTime;
    f_OrderSingle_ExpireDate;
    f_OrderSingle_ExpireTime;
    f_OrderSingle_GTBookingInst;
    f_OrderSingle_Commission;
    f_OrderSingle_CommType;
    f_OrderSingle_Rule80A;
    f_OrderSingle_ForexReq;
    f_OrderSingle_SettlCurrency;
    f_OrderSingle_Text;
    f_OrderSingle_EncodedTextLen;
    f_OrderSingle_EncodedText;
    f_OrderSingle_FutSettDate2;
    f_OrderSingle_OrderQty2;
    f_OrderSingle_OpenClose;
    f_OrderSingle_CoveredOrUncovered;
    f_OrderSingle_CustomerOrFirm;
    f_OrderSingle_MaxShow;
    f_OrderSingle_PegDifference;
    f_OrderSingle_DiscretionInst;
    f_OrderSingle_DiscretionOffset;
    f_OrderSingle_ClearingFirm;
    f_OrderSingle_ClearingAccount;
    } , msg ) |> check_unknown_tags;;

let parse_OrderStatusRequest msg = (
    check_duplicate_tags msg @@ fun () ->
    opt msg "37" parse_string @@ fun msg f_OrderStatusRequest_OrderID ->
    req msg "11" parse_string @@ fun msg f_OrderStatusRequest_ClOrdID ->
    opt msg "109" parse_string @@ fun msg f_OrderStatusRequest_ClientID ->
    opt msg "1" parse_string @@ fun msg f_OrderStatusRequest_Account ->
    opt msg "76" parse_string @@ fun msg f_OrderStatusRequest_ExecBroker ->
    req msg "55" parse_string @@ fun msg f_OrderStatusRequest_Symbol ->
    opt msg "65" parse_string @@ fun msg f_OrderStatusRequest_SymbolSfx ->
    opt msg "48" parse_string @@ fun msg f_OrderStatusRequest_SecurityID ->
    opt msg "22" parse_IDSource @@ fun msg f_OrderStatusRequest_IDSource ->
    opt msg "167" parse_SecurityType @@ fun msg f_OrderStatusRequest_SecurityType ->
    opt msg "200" parse_MonthYear @@ fun msg f_OrderStatusRequest_MaturityMonthYear ->
    opt msg "205" parse_int @@ fun msg f_OrderStatusRequest_MaturityDay ->
    opt msg "201" parse_PutOrCall @@ fun msg f_OrderStatusRequest_PutOrCall ->
    opt msg "202" parse_float @@ fun msg f_OrderStatusRequest_StrikePrice ->
    opt msg "206" parse_char @@ fun msg f_OrderStatusRequest_OptAttribute ->
    opt msg "231" parse_float @@ fun msg f_OrderStatusRequest_ContractMultiplier ->
    opt msg "223" parse_float @@ fun msg f_OrderStatusRequest_CouponRate ->
    opt msg "207" parse_Exchange @@ fun msg f_OrderStatusRequest_SecurityExchange ->
    opt msg "106" parse_string @@ fun msg f_OrderStatusRequest_Issuer ->
    opt msg "348" parse_int @@ fun msg f_OrderStatusRequest_EncodedIssuerLen ->
    opt msg "349" parse_string @@ fun msg f_OrderStatusRequest_EncodedIssuer ->
    opt msg "107" parse_string @@ fun msg f_OrderStatusRequest_SecurityDesc ->
    opt msg "350" parse_int @@ fun msg f_OrderStatusRequest_EncodedSecurityDescLen ->
    opt msg "351" parse_string @@ fun msg f_OrderStatusRequest_EncodedSecurityDesc ->
    req msg "54" parse_Side @@ fun msg f_OrderStatusRequest_Side ->
    ParseSuccess {
    f_OrderStatusRequest_OrderID;
    f_OrderStatusRequest_ClOrdID;
    f_OrderStatusRequest_ClientID;
    f_OrderStatusRequest_Account;
    f_OrderStatusRequest_ExecBroker;
    f_OrderStatusRequest_Symbol;
    f_OrderStatusRequest_SymbolSfx;
    f_OrderStatusRequest_SecurityID;
    f_OrderStatusRequest_IDSource;
    f_OrderStatusRequest_SecurityType;
    f_OrderStatusRequest_MaturityMonthYear;
    f_OrderStatusRequest_MaturityDay;
    f_OrderStatusRequest_PutOrCall;
    f_OrderStatusRequest_StrikePrice;
    f_OrderStatusRequest_OptAttribute;
    f_OrderStatusRequest_ContractMultiplier;
    f_OrderStatusRequest_CouponRate;
    f_OrderStatusRequest_SecurityExchange;
    f_OrderStatusRequest_Issuer;
    f_OrderStatusRequest_EncodedIssuerLen;
    f_OrderStatusRequest_EncodedIssuer;
    f_OrderStatusRequest_SecurityDesc;
    f_OrderStatusRequest_EncodedSecurityDescLen;
    f_OrderStatusRequest_EncodedSecurityDesc;
    f_OrderStatusRequest_Side;
    } , msg ) |> check_unknown_tags;;

let parse_Quote msg = (
    check_duplicate_tags msg @@ fun () ->
    opt msg "131" parse_string @@ fun msg f_Quote_QuoteReqID ->
    req msg "117" parse_string @@ fun msg f_Quote_QuoteID ->
    opt msg "301" parse_QuoteResponseLevel @@ fun msg f_Quote_QuoteResponseLevel ->
    opt msg "336" parse_string @@ fun msg f_Quote_TradingSessionID ->
    req msg "55" parse_string @@ fun msg f_Quote_Symbol ->
    opt msg "65" parse_string @@ fun msg f_Quote_SymbolSfx ->
    opt msg "48" parse_string @@ fun msg f_Quote_SecurityID ->
    opt msg "22" parse_IDSource @@ fun msg f_Quote_IDSource ->
    opt msg "167" parse_SecurityType @@ fun msg f_Quote_SecurityType ->
    opt msg "200" parse_MonthYear @@ fun msg f_Quote_MaturityMonthYear ->
    opt msg "205" parse_int @@ fun msg f_Quote_MaturityDay ->
    opt msg "201" parse_PutOrCall @@ fun msg f_Quote_PutOrCall ->
    opt msg "202" parse_float @@ fun msg f_Quote_StrikePrice ->
    opt msg "206" parse_char @@ fun msg f_Quote_OptAttribute ->
    opt msg "231" parse_float @@ fun msg f_Quote_ContractMultiplier ->
    opt msg "223" parse_float @@ fun msg f_Quote_CouponRate ->
    opt msg "207" parse_Exchange @@ fun msg f_Quote_SecurityExchange ->
    opt msg "106" parse_string @@ fun msg f_Quote_Issuer ->
    opt msg "348" parse_int @@ fun msg f_Quote_EncodedIssuerLen ->
    opt msg "349" parse_string @@ fun msg f_Quote_EncodedIssuer ->
    opt msg "107" parse_string @@ fun msg f_Quote_SecurityDesc ->
    opt msg "350" parse_int @@ fun msg f_Quote_EncodedSecurityDescLen ->
    opt msg "351" parse_string @@ fun msg f_Quote_EncodedSecurityDesc ->
    opt msg "132" parse_float @@ fun msg f_Quote_BidPx ->
    opt msg "133" parse_float @@ fun msg f_Quote_OfferPx ->
    opt msg "134" parse_float @@ fun msg f_Quote_BidSize ->
    opt msg "135" parse_float @@ fun msg f_Quote_OfferSize ->
    opt msg "62" parse_UTCTimestamp @@ fun msg f_Quote_ValidUntilTime ->
    opt msg "188" parse_float @@ fun msg f_Quote_BidSpotRate ->
    opt msg "190" parse_float @@ fun msg f_Quote_OfferSpotRate ->
    opt msg "189" parse_float @@ fun msg f_Quote_BidForwardPoints ->
    opt msg "191" parse_float @@ fun msg f_Quote_OfferForwardPoints ->
    opt msg "60" parse_UTCTimestamp @@ fun msg f_Quote_TransactTime ->
    opt msg "64" parse_LocalMktDate @@ fun msg f_Quote_FutSettDate ->
    opt msg "40" parse_OrdType @@ fun msg f_Quote_OrdType ->
    opt msg "193" parse_LocalMktDate @@ fun msg f_Quote_FutSettDate2 ->
    opt msg "192" parse_float @@ fun msg f_Quote_OrderQty2 ->
    opt msg "15" parse_Currency @@ fun msg f_Quote_Currency ->
    ParseSuccess {
    f_Quote_QuoteReqID;
    f_Quote_QuoteID;
    f_Quote_QuoteResponseLevel;
    f_Quote_TradingSessionID;
    f_Quote_Symbol;
    f_Quote_SymbolSfx;
    f_Quote_SecurityID;
    f_Quote_IDSource;
    f_Quote_SecurityType;
    f_Quote_MaturityMonthYear;
    f_Quote_MaturityDay;
    f_Quote_PutOrCall;
    f_Quote_StrikePrice;
    f_Quote_OptAttribute;
    f_Quote_ContractMultiplier;
    f_Quote_CouponRate;
    f_Quote_SecurityExchange;
    f_Quote_Issuer;
    f_Quote_EncodedIssuerLen;
    f_Quote_EncodedIssuer;
    f_Quote_SecurityDesc;
    f_Quote_EncodedSecurityDescLen;
    f_Quote_EncodedSecurityDesc;
    f_Quote_BidPx;
    f_Quote_OfferPx;
    f_Quote_BidSize;
    f_Quote_OfferSize;
    f_Quote_ValidUntilTime;
    f_Quote_BidSpotRate;
    f_Quote_OfferSpotRate;
    f_Quote_BidForwardPoints;
    f_Quote_OfferForwardPoints;
    f_Quote_TransactTime;
    f_Quote_FutSettDate;
    f_Quote_OrdType;
    f_Quote_FutSettDate2;
    f_Quote_OrderQty2;
    f_Quote_Currency;
    } , msg ) |> check_unknown_tags;;

let parse_QuoteAcknowledgement msg = (
    repeating msg "296" parse_QuoteAcknowledgementQuoteSets @@ fun msg f_QuoteAcknowledgement_QuoteAcknowledgementQuoteSets ->
    repeating msg "295" parse_QuoteAcknowledgementQuoteEntries @@ fun msg f_QuoteAcknowledgement_QuoteAcknowledgementQuoteEntries ->
    check_duplicate_tags msg @@ fun () ->
    opt msg "131" parse_string @@ fun msg f_QuoteAcknowledgement_QuoteReqID ->
    opt msg "117" parse_string @@ fun msg f_QuoteAcknowledgement_QuoteID ->
    req msg "297" parse_QuoteAckStatus @@ fun msg f_QuoteAcknowledgement_QuoteAckStatus ->
    opt msg "300" parse_QuoteRejectReason @@ fun msg f_QuoteAcknowledgement_QuoteRejectReason ->
    opt msg "301" parse_QuoteResponseLevel @@ fun msg f_QuoteAcknowledgement_QuoteResponseLevel ->
    opt msg "336" parse_string @@ fun msg f_QuoteAcknowledgement_TradingSessionID ->
    opt msg "58" parse_string @@ fun msg f_QuoteAcknowledgement_Text ->
    ParseSuccess {
    f_QuoteAcknowledgement_QuoteAcknowledgementQuoteSets;
    f_QuoteAcknowledgement_QuoteAcknowledgementQuoteEntries;
    f_QuoteAcknowledgement_QuoteReqID;
    f_QuoteAcknowledgement_QuoteID;
    f_QuoteAcknowledgement_QuoteAckStatus;
    f_QuoteAcknowledgement_QuoteRejectReason;
    f_QuoteAcknowledgement_QuoteResponseLevel;
    f_QuoteAcknowledgement_TradingSessionID;
    f_QuoteAcknowledgement_Text;
    } , msg ) |> check_unknown_tags;;

let parse_QuoteCancel msg = (
    repeating msg "295" parse_QuoteCancelQuoteEntries @@ fun msg f_QuoteCancel_QuoteCancelQuoteEntries ->
    check_duplicate_tags msg @@ fun () ->
    opt msg "131" parse_string @@ fun msg f_QuoteCancel_QuoteReqID ->
    req msg "117" parse_string @@ fun msg f_QuoteCancel_QuoteID ->
    req msg "298" parse_QuoteCancelType @@ fun msg f_QuoteCancel_QuoteCancelType ->
    opt msg "301" parse_QuoteResponseLevel @@ fun msg f_QuoteCancel_QuoteResponseLevel ->
    opt msg "336" parse_string @@ fun msg f_QuoteCancel_TradingSessionID ->
    ParseSuccess {
    f_QuoteCancel_QuoteCancelQuoteEntries;
    f_QuoteCancel_QuoteReqID;
    f_QuoteCancel_QuoteID;
    f_QuoteCancel_QuoteCancelType;
    f_QuoteCancel_QuoteResponseLevel;
    f_QuoteCancel_TradingSessionID;
    } , msg ) |> check_unknown_tags;;

let parse_QuoteRequest msg = (
    repeating msg "146" parse_QuoteRequestRelatedSym @@ fun msg f_QuoteRequest_QuoteRequestRelatedSym ->
    check_duplicate_tags msg @@ fun () ->
    req msg "131" parse_string @@ fun msg f_QuoteRequest_QuoteReqID ->
    ParseSuccess {
    f_QuoteRequest_QuoteRequestRelatedSym;
    f_QuoteRequest_QuoteReqID;
    } , msg ) |> check_unknown_tags;;

let parse_QuoteStatusRequest msg = (
    check_duplicate_tags msg @@ fun () ->
    opt msg "117" parse_string @@ fun msg f_QuoteStatusRequest_QuoteID ->
    req msg "55" parse_string @@ fun msg f_QuoteStatusRequest_Symbol ->
    opt msg "65" parse_string @@ fun msg f_QuoteStatusRequest_SymbolSfx ->
    opt msg "48" parse_string @@ fun msg f_QuoteStatusRequest_SecurityID ->
    opt msg "22" parse_IDSource @@ fun msg f_QuoteStatusRequest_IDSource ->
    opt msg "167" parse_SecurityType @@ fun msg f_QuoteStatusRequest_SecurityType ->
    opt msg "200" parse_MonthYear @@ fun msg f_QuoteStatusRequest_MaturityMonthYear ->
    opt msg "205" parse_int @@ fun msg f_QuoteStatusRequest_MaturityDay ->
    opt msg "201" parse_PutOrCall @@ fun msg f_QuoteStatusRequest_PutOrCall ->
    opt msg "202" parse_float @@ fun msg f_QuoteStatusRequest_StrikePrice ->
    opt msg "206" parse_char @@ fun msg f_QuoteStatusRequest_OptAttribute ->
    opt msg "231" parse_float @@ fun msg f_QuoteStatusRequest_ContractMultiplier ->
    opt msg "223" parse_float @@ fun msg f_QuoteStatusRequest_CouponRate ->
    opt msg "207" parse_Exchange @@ fun msg f_QuoteStatusRequest_SecurityExchange ->
    opt msg "106" parse_string @@ fun msg f_QuoteStatusRequest_Issuer ->
    opt msg "348" parse_int @@ fun msg f_QuoteStatusRequest_EncodedIssuerLen ->
    opt msg "349" parse_string @@ fun msg f_QuoteStatusRequest_EncodedIssuer ->
    opt msg "107" parse_string @@ fun msg f_QuoteStatusRequest_SecurityDesc ->
    opt msg "350" parse_int @@ fun msg f_QuoteStatusRequest_EncodedSecurityDescLen ->
    opt msg "351" parse_string @@ fun msg f_QuoteStatusRequest_EncodedSecurityDesc ->
    opt msg "54" parse_Side @@ fun msg f_QuoteStatusRequest_Side ->
    opt msg "336" parse_string @@ fun msg f_QuoteStatusRequest_TradingSessionID ->
    ParseSuccess {
    f_QuoteStatusRequest_QuoteID;
    f_QuoteStatusRequest_Symbol;
    f_QuoteStatusRequest_SymbolSfx;
    f_QuoteStatusRequest_SecurityID;
    f_QuoteStatusRequest_IDSource;
    f_QuoteStatusRequest_SecurityType;
    f_QuoteStatusRequest_MaturityMonthYear;
    f_QuoteStatusRequest_MaturityDay;
    f_QuoteStatusRequest_PutOrCall;
    f_QuoteStatusRequest_StrikePrice;
    f_QuoteStatusRequest_OptAttribute;
    f_QuoteStatusRequest_ContractMultiplier;
    f_QuoteStatusRequest_CouponRate;
    f_QuoteStatusRequest_SecurityExchange;
    f_QuoteStatusRequest_Issuer;
    f_QuoteStatusRequest_EncodedIssuerLen;
    f_QuoteStatusRequest_EncodedIssuer;
    f_QuoteStatusRequest_SecurityDesc;
    f_QuoteStatusRequest_EncodedSecurityDescLen;
    f_QuoteStatusRequest_EncodedSecurityDesc;
    f_QuoteStatusRequest_Side;
    f_QuoteStatusRequest_TradingSessionID;
    } , msg ) |> check_unknown_tags;;

let parse_SecurityDefinition msg = (
    repeating msg "146" parse_SecurityDefinitionRelatedSym @@ fun msg f_SecurityDefinition_SecurityDefinitionRelatedSym ->
    check_duplicate_tags msg @@ fun () ->
    req msg "320" parse_string @@ fun msg f_SecurityDefinition_SecurityReqID ->
    req msg "322" parse_string @@ fun msg f_SecurityDefinition_SecurityResponseID ->
    opt msg "323" parse_SecurityResponseType @@ fun msg f_SecurityDefinition_SecurityResponseType ->
    req msg "393" parse_int @@ fun msg f_SecurityDefinition_TotalNumSecurities ->
    opt msg "55" parse_string @@ fun msg f_SecurityDefinition_Symbol ->
    opt msg "65" parse_string @@ fun msg f_SecurityDefinition_SymbolSfx ->
    opt msg "48" parse_string @@ fun msg f_SecurityDefinition_SecurityID ->
    opt msg "22" parse_IDSource @@ fun msg f_SecurityDefinition_IDSource ->
    opt msg "167" parse_SecurityType @@ fun msg f_SecurityDefinition_SecurityType ->
    opt msg "200" parse_MonthYear @@ fun msg f_SecurityDefinition_MaturityMonthYear ->
    opt msg "205" parse_int @@ fun msg f_SecurityDefinition_MaturityDay ->
    opt msg "201" parse_PutOrCall @@ fun msg f_SecurityDefinition_PutOrCall ->
    opt msg "202" parse_float @@ fun msg f_SecurityDefinition_StrikePrice ->
    opt msg "206" parse_char @@ fun msg f_SecurityDefinition_OptAttribute ->
    opt msg "231" parse_float @@ fun msg f_SecurityDefinition_ContractMultiplier ->
    opt msg "223" parse_float @@ fun msg f_SecurityDefinition_CouponRate ->
    opt msg "207" parse_Exchange @@ fun msg f_SecurityDefinition_SecurityExchange ->
    opt msg "106" parse_string @@ fun msg f_SecurityDefinition_Issuer ->
    opt msg "348" parse_int @@ fun msg f_SecurityDefinition_EncodedIssuerLen ->
    opt msg "349" parse_string @@ fun msg f_SecurityDefinition_EncodedIssuer ->
    opt msg "107" parse_string @@ fun msg f_SecurityDefinition_SecurityDesc ->
    opt msg "350" parse_int @@ fun msg f_SecurityDefinition_EncodedSecurityDescLen ->
    opt msg "351" parse_string @@ fun msg f_SecurityDefinition_EncodedSecurityDesc ->
    opt msg "15" parse_Currency @@ fun msg f_SecurityDefinition_Currency ->
    opt msg "336" parse_string @@ fun msg f_SecurityDefinition_TradingSessionID ->
    opt msg "58" parse_string @@ fun msg f_SecurityDefinition_Text ->
    opt msg "354" parse_int @@ fun msg f_SecurityDefinition_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_SecurityDefinition_EncodedText ->
    ParseSuccess {
    f_SecurityDefinition_SecurityDefinitionRelatedSym;
    f_SecurityDefinition_SecurityReqID;
    f_SecurityDefinition_SecurityResponseID;
    f_SecurityDefinition_SecurityResponseType;
    f_SecurityDefinition_TotalNumSecurities;
    f_SecurityDefinition_Symbol;
    f_SecurityDefinition_SymbolSfx;
    f_SecurityDefinition_SecurityID;
    f_SecurityDefinition_IDSource;
    f_SecurityDefinition_SecurityType;
    f_SecurityDefinition_MaturityMonthYear;
    f_SecurityDefinition_MaturityDay;
    f_SecurityDefinition_PutOrCall;
    f_SecurityDefinition_StrikePrice;
    f_SecurityDefinition_OptAttribute;
    f_SecurityDefinition_ContractMultiplier;
    f_SecurityDefinition_CouponRate;
    f_SecurityDefinition_SecurityExchange;
    f_SecurityDefinition_Issuer;
    f_SecurityDefinition_EncodedIssuerLen;
    f_SecurityDefinition_EncodedIssuer;
    f_SecurityDefinition_SecurityDesc;
    f_SecurityDefinition_EncodedSecurityDescLen;
    f_SecurityDefinition_EncodedSecurityDesc;
    f_SecurityDefinition_Currency;
    f_SecurityDefinition_TradingSessionID;
    f_SecurityDefinition_Text;
    f_SecurityDefinition_EncodedTextLen;
    f_SecurityDefinition_EncodedText;
    } , msg ) |> check_unknown_tags;;

let parse_SecurityDefinitionRequest msg = (
    repeating msg "146" parse_SecurityDefinitionRequestRelatedSym @@ fun msg f_SecurityDefinitionRequest_SecurityDefinitionRequestRelatedSym ->
    check_duplicate_tags msg @@ fun () ->
    req msg "320" parse_string @@ fun msg f_SecurityDefinitionRequest_SecurityReqID ->
    req msg "321" parse_SecurityRequestType @@ fun msg f_SecurityDefinitionRequest_SecurityRequestType ->
    opt msg "55" parse_string @@ fun msg f_SecurityDefinitionRequest_Symbol ->
    opt msg "65" parse_string @@ fun msg f_SecurityDefinitionRequest_SymbolSfx ->
    opt msg "48" parse_string @@ fun msg f_SecurityDefinitionRequest_SecurityID ->
    opt msg "22" parse_IDSource @@ fun msg f_SecurityDefinitionRequest_IDSource ->
    opt msg "167" parse_SecurityType @@ fun msg f_SecurityDefinitionRequest_SecurityType ->
    opt msg "200" parse_MonthYear @@ fun msg f_SecurityDefinitionRequest_MaturityMonthYear ->
    opt msg "205" parse_int @@ fun msg f_SecurityDefinitionRequest_MaturityDay ->
    opt msg "201" parse_PutOrCall @@ fun msg f_SecurityDefinitionRequest_PutOrCall ->
    opt msg "202" parse_float @@ fun msg f_SecurityDefinitionRequest_StrikePrice ->
    opt msg "206" parse_char @@ fun msg f_SecurityDefinitionRequest_OptAttribute ->
    opt msg "231" parse_float @@ fun msg f_SecurityDefinitionRequest_ContractMultiplier ->
    opt msg "223" parse_float @@ fun msg f_SecurityDefinitionRequest_CouponRate ->
    opt msg "207" parse_Exchange @@ fun msg f_SecurityDefinitionRequest_SecurityExchange ->
    opt msg "106" parse_string @@ fun msg f_SecurityDefinitionRequest_Issuer ->
    opt msg "348" parse_int @@ fun msg f_SecurityDefinitionRequest_EncodedIssuerLen ->
    opt msg "349" parse_string @@ fun msg f_SecurityDefinitionRequest_EncodedIssuer ->
    opt msg "107" parse_string @@ fun msg f_SecurityDefinitionRequest_SecurityDesc ->
    opt msg "350" parse_int @@ fun msg f_SecurityDefinitionRequest_EncodedSecurityDescLen ->
    opt msg "351" parse_string @@ fun msg f_SecurityDefinitionRequest_EncodedSecurityDesc ->
    opt msg "15" parse_Currency @@ fun msg f_SecurityDefinitionRequest_Currency ->
    opt msg "58" parse_string @@ fun msg f_SecurityDefinitionRequest_Text ->
    opt msg "354" parse_int @@ fun msg f_SecurityDefinitionRequest_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_SecurityDefinitionRequest_EncodedText ->
    opt msg "336" parse_string @@ fun msg f_SecurityDefinitionRequest_TradingSessionID ->
    ParseSuccess {
    f_SecurityDefinitionRequest_SecurityDefinitionRequestRelatedSym;
    f_SecurityDefinitionRequest_SecurityReqID;
    f_SecurityDefinitionRequest_SecurityRequestType;
    f_SecurityDefinitionRequest_Symbol;
    f_SecurityDefinitionRequest_SymbolSfx;
    f_SecurityDefinitionRequest_SecurityID;
    f_SecurityDefinitionRequest_IDSource;
    f_SecurityDefinitionRequest_SecurityType;
    f_SecurityDefinitionRequest_MaturityMonthYear;
    f_SecurityDefinitionRequest_MaturityDay;
    f_SecurityDefinitionRequest_PutOrCall;
    f_SecurityDefinitionRequest_StrikePrice;
    f_SecurityDefinitionRequest_OptAttribute;
    f_SecurityDefinitionRequest_ContractMultiplier;
    f_SecurityDefinitionRequest_CouponRate;
    f_SecurityDefinitionRequest_SecurityExchange;
    f_SecurityDefinitionRequest_Issuer;
    f_SecurityDefinitionRequest_EncodedIssuerLen;
    f_SecurityDefinitionRequest_EncodedIssuer;
    f_SecurityDefinitionRequest_SecurityDesc;
    f_SecurityDefinitionRequest_EncodedSecurityDescLen;
    f_SecurityDefinitionRequest_EncodedSecurityDesc;
    f_SecurityDefinitionRequest_Currency;
    f_SecurityDefinitionRequest_Text;
    f_SecurityDefinitionRequest_EncodedTextLen;
    f_SecurityDefinitionRequest_EncodedText;
    f_SecurityDefinitionRequest_TradingSessionID;
    } , msg ) |> check_unknown_tags;;

let parse_SecurityStatus msg = (
    check_duplicate_tags msg @@ fun () ->
    opt msg "324" parse_string @@ fun msg f_SecurityStatus_SecurityStatusReqID ->
    req msg "55" parse_string @@ fun msg f_SecurityStatus_Symbol ->
    opt msg "65" parse_string @@ fun msg f_SecurityStatus_SymbolSfx ->
    opt msg "48" parse_string @@ fun msg f_SecurityStatus_SecurityID ->
    opt msg "22" parse_IDSource @@ fun msg f_SecurityStatus_IDSource ->
    opt msg "167" parse_SecurityType @@ fun msg f_SecurityStatus_SecurityType ->
    opt msg "200" parse_MonthYear @@ fun msg f_SecurityStatus_MaturityMonthYear ->
    opt msg "205" parse_int @@ fun msg f_SecurityStatus_MaturityDay ->
    opt msg "201" parse_PutOrCall @@ fun msg f_SecurityStatus_PutOrCall ->
    opt msg "202" parse_float @@ fun msg f_SecurityStatus_StrikePrice ->
    opt msg "206" parse_char @@ fun msg f_SecurityStatus_OptAttribute ->
    opt msg "231" parse_float @@ fun msg f_SecurityStatus_ContractMultiplier ->
    opt msg "223" parse_float @@ fun msg f_SecurityStatus_CouponRate ->
    opt msg "207" parse_Exchange @@ fun msg f_SecurityStatus_SecurityExchange ->
    opt msg "106" parse_string @@ fun msg f_SecurityStatus_Issuer ->
    opt msg "348" parse_int @@ fun msg f_SecurityStatus_EncodedIssuerLen ->
    opt msg "349" parse_string @@ fun msg f_SecurityStatus_EncodedIssuer ->
    opt msg "107" parse_string @@ fun msg f_SecurityStatus_SecurityDesc ->
    opt msg "350" parse_int @@ fun msg f_SecurityStatus_EncodedSecurityDescLen ->
    opt msg "351" parse_string @@ fun msg f_SecurityStatus_EncodedSecurityDesc ->
    opt msg "15" parse_Currency @@ fun msg f_SecurityStatus_Currency ->
    opt msg "336" parse_string @@ fun msg f_SecurityStatus_TradingSessionID ->
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
    ParseSuccess {
    f_SecurityStatus_SecurityStatusReqID;
    f_SecurityStatus_Symbol;
    f_SecurityStatus_SymbolSfx;
    f_SecurityStatus_SecurityID;
    f_SecurityStatus_IDSource;
    f_SecurityStatus_SecurityType;
    f_SecurityStatus_MaturityMonthYear;
    f_SecurityStatus_MaturityDay;
    f_SecurityStatus_PutOrCall;
    f_SecurityStatus_StrikePrice;
    f_SecurityStatus_OptAttribute;
    f_SecurityStatus_ContractMultiplier;
    f_SecurityStatus_CouponRate;
    f_SecurityStatus_SecurityExchange;
    f_SecurityStatus_Issuer;
    f_SecurityStatus_EncodedIssuerLen;
    f_SecurityStatus_EncodedIssuer;
    f_SecurityStatus_SecurityDesc;
    f_SecurityStatus_EncodedSecurityDescLen;
    f_SecurityStatus_EncodedSecurityDesc;
    f_SecurityStatus_Currency;
    f_SecurityStatus_TradingSessionID;
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
    } , msg ) |> check_unknown_tags;;

let parse_SecurityStatusRequest msg = (
    check_duplicate_tags msg @@ fun () ->
    req msg "324" parse_string @@ fun msg f_SecurityStatusRequest_SecurityStatusReqID ->
    req msg "55" parse_string @@ fun msg f_SecurityStatusRequest_Symbol ->
    opt msg "65" parse_string @@ fun msg f_SecurityStatusRequest_SymbolSfx ->
    opt msg "48" parse_string @@ fun msg f_SecurityStatusRequest_SecurityID ->
    opt msg "22" parse_IDSource @@ fun msg f_SecurityStatusRequest_IDSource ->
    opt msg "167" parse_SecurityType @@ fun msg f_SecurityStatusRequest_SecurityType ->
    opt msg "200" parse_MonthYear @@ fun msg f_SecurityStatusRequest_MaturityMonthYear ->
    opt msg "205" parse_int @@ fun msg f_SecurityStatusRequest_MaturityDay ->
    opt msg "201" parse_PutOrCall @@ fun msg f_SecurityStatusRequest_PutOrCall ->
    opt msg "202" parse_float @@ fun msg f_SecurityStatusRequest_StrikePrice ->
    opt msg "206" parse_char @@ fun msg f_SecurityStatusRequest_OptAttribute ->
    opt msg "231" parse_float @@ fun msg f_SecurityStatusRequest_ContractMultiplier ->
    opt msg "223" parse_float @@ fun msg f_SecurityStatusRequest_CouponRate ->
    opt msg "207" parse_Exchange @@ fun msg f_SecurityStatusRequest_SecurityExchange ->
    opt msg "106" parse_string @@ fun msg f_SecurityStatusRequest_Issuer ->
    opt msg "348" parse_int @@ fun msg f_SecurityStatusRequest_EncodedIssuerLen ->
    opt msg "349" parse_string @@ fun msg f_SecurityStatusRequest_EncodedIssuer ->
    opt msg "107" parse_string @@ fun msg f_SecurityStatusRequest_SecurityDesc ->
    opt msg "350" parse_int @@ fun msg f_SecurityStatusRequest_EncodedSecurityDescLen ->
    opt msg "351" parse_string @@ fun msg f_SecurityStatusRequest_EncodedSecurityDesc ->
    opt msg "15" parse_Currency @@ fun msg f_SecurityStatusRequest_Currency ->
    req msg "263" parse_SubscriptionRequestType @@ fun msg f_SecurityStatusRequest_SubscriptionRequestType ->
    opt msg "336" parse_string @@ fun msg f_SecurityStatusRequest_TradingSessionID ->
    ParseSuccess {
    f_SecurityStatusRequest_SecurityStatusReqID;
    f_SecurityStatusRequest_Symbol;
    f_SecurityStatusRequest_SymbolSfx;
    f_SecurityStatusRequest_SecurityID;
    f_SecurityStatusRequest_IDSource;
    f_SecurityStatusRequest_SecurityType;
    f_SecurityStatusRequest_MaturityMonthYear;
    f_SecurityStatusRequest_MaturityDay;
    f_SecurityStatusRequest_PutOrCall;
    f_SecurityStatusRequest_StrikePrice;
    f_SecurityStatusRequest_OptAttribute;
    f_SecurityStatusRequest_ContractMultiplier;
    f_SecurityStatusRequest_CouponRate;
    f_SecurityStatusRequest_SecurityExchange;
    f_SecurityStatusRequest_Issuer;
    f_SecurityStatusRequest_EncodedIssuerLen;
    f_SecurityStatusRequest_EncodedIssuer;
    f_SecurityStatusRequest_SecurityDesc;
    f_SecurityStatusRequest_EncodedSecurityDescLen;
    f_SecurityStatusRequest_EncodedSecurityDesc;
    f_SecurityStatusRequest_Currency;
    f_SecurityStatusRequest_SubscriptionRequestType;
    f_SecurityStatusRequest_TradingSessionID;
    } , msg ) |> check_unknown_tags;;

let parse_SettlementInstructions msg = (
    check_duplicate_tags msg @@ fun () ->
    req msg "162" parse_string @@ fun msg f_SettlementInstructions_SettlInstID ->
    req msg "163" parse_SettlInstTransType @@ fun msg f_SettlementInstructions_SettlInstTransType ->
    req msg "214" parse_string @@ fun msg f_SettlementInstructions_SettlInstRefID ->
    req msg "160" parse_SettlInstMode @@ fun msg f_SettlementInstructions_SettlInstMode ->
    req msg "165" parse_SettlInstSource @@ fun msg f_SettlementInstructions_SettlInstSource ->
    req msg "79" parse_string @@ fun msg f_SettlementInstructions_AllocAccount ->
    opt msg "166" parse_SettlLocation @@ fun msg f_SettlementInstructions_SettlLocation ->
    opt msg "75" parse_LocalMktDate @@ fun msg f_SettlementInstructions_TradeDate ->
    opt msg "70" parse_string @@ fun msg f_SettlementInstructions_AllocID ->
    opt msg "30" parse_Exchange @@ fun msg f_SettlementInstructions_LastMkt ->
    opt msg "336" parse_string @@ fun msg f_SettlementInstructions_TradingSessionID ->
    opt msg "54" parse_Side @@ fun msg f_SettlementInstructions_Side ->
    opt msg "167" parse_SecurityType @@ fun msg f_SettlementInstructions_SecurityType ->
    opt msg "168" parse_UTCTimestamp @@ fun msg f_SettlementInstructions_EffectiveTime ->
    req msg "60" parse_UTCTimestamp @@ fun msg f_SettlementInstructions_TransactTime ->
    opt msg "109" parse_string @@ fun msg f_SettlementInstructions_ClientID ->
    opt msg "76" parse_string @@ fun msg f_SettlementInstructions_ExecBroker ->
    opt msg "169" parse_StandInstDbType @@ fun msg f_SettlementInstructions_StandInstDbType ->
    opt msg "170" parse_string @@ fun msg f_SettlementInstructions_StandInstDbName ->
    opt msg "171" parse_string @@ fun msg f_SettlementInstructions_StandInstDbID ->
    opt msg "172" parse_int @@ fun msg f_SettlementInstructions_SettlDeliveryType ->
    opt msg "173" parse_string @@ fun msg f_SettlementInstructions_SettlDepositoryCode ->
    opt msg "174" parse_string @@ fun msg f_SettlementInstructions_SettlBrkrCode ->
    opt msg "175" parse_string @@ fun msg f_SettlementInstructions_SettlInstCode ->
    opt msg "176" parse_string @@ fun msg f_SettlementInstructions_SecuritySettlAgentName ->
    opt msg "177" parse_string @@ fun msg f_SettlementInstructions_SecuritySettlAgentCode ->
    opt msg "178" parse_string @@ fun msg f_SettlementInstructions_SecuritySettlAgentAcctNum ->
    opt msg "179" parse_string @@ fun msg f_SettlementInstructions_SecuritySettlAgentAcctName ->
    opt msg "180" parse_string @@ fun msg f_SettlementInstructions_SecuritySettlAgentContactName ->
    opt msg "181" parse_string @@ fun msg f_SettlementInstructions_SecuritySettlAgentContactPhone ->
    opt msg "182" parse_string @@ fun msg f_SettlementInstructions_CashSettlAgentName ->
    opt msg "183" parse_string @@ fun msg f_SettlementInstructions_CashSettlAgentCode ->
    opt msg "184" parse_string @@ fun msg f_SettlementInstructions_CashSettlAgentAcctNum ->
    opt msg "185" parse_string @@ fun msg f_SettlementInstructions_CashSettlAgentAcctName ->
    opt msg "186" parse_string @@ fun msg f_SettlementInstructions_CashSettlAgentContactName ->
    opt msg "187" parse_string @@ fun msg f_SettlementInstructions_CashSettlAgentContactPhone ->
    ParseSuccess {
    f_SettlementInstructions_SettlInstID;
    f_SettlementInstructions_SettlInstTransType;
    f_SettlementInstructions_SettlInstRefID;
    f_SettlementInstructions_SettlInstMode;
    f_SettlementInstructions_SettlInstSource;
    f_SettlementInstructions_AllocAccount;
    f_SettlementInstructions_SettlLocation;
    f_SettlementInstructions_TradeDate;
    f_SettlementInstructions_AllocID;
    f_SettlementInstructions_LastMkt;
    f_SettlementInstructions_TradingSessionID;
    f_SettlementInstructions_Side;
    f_SettlementInstructions_SecurityType;
    f_SettlementInstructions_EffectiveTime;
    f_SettlementInstructions_TransactTime;
    f_SettlementInstructions_ClientID;
    f_SettlementInstructions_ExecBroker;
    f_SettlementInstructions_StandInstDbType;
    f_SettlementInstructions_StandInstDbName;
    f_SettlementInstructions_StandInstDbID;
    f_SettlementInstructions_SettlDeliveryType;
    f_SettlementInstructions_SettlDepositoryCode;
    f_SettlementInstructions_SettlBrkrCode;
    f_SettlementInstructions_SettlInstCode;
    f_SettlementInstructions_SecuritySettlAgentName;
    f_SettlementInstructions_SecuritySettlAgentCode;
    f_SettlementInstructions_SecuritySettlAgentAcctNum;
    f_SettlementInstructions_SecuritySettlAgentAcctName;
    f_SettlementInstructions_SecuritySettlAgentContactName;
    f_SettlementInstructions_SecuritySettlAgentContactPhone;
    f_SettlementInstructions_CashSettlAgentName;
    f_SettlementInstructions_CashSettlAgentCode;
    f_SettlementInstructions_CashSettlAgentAcctNum;
    f_SettlementInstructions_CashSettlAgentAcctName;
    f_SettlementInstructions_CashSettlAgentContactName;
    f_SettlementInstructions_CashSettlAgentContactPhone;
    } , msg ) |> check_unknown_tags;;

let parse_TradingSessionStatus msg = (
    check_duplicate_tags msg @@ fun () ->
    opt msg "335" parse_string @@ fun msg f_TradingSessionStatus_TradSesReqID ->
    req msg "336" parse_string @@ fun msg f_TradingSessionStatus_TradingSessionID ->
    opt msg "338" parse_TradSesMethod @@ fun msg f_TradingSessionStatus_TradSesMethod ->
    opt msg "339" parse_TradSesMode @@ fun msg f_TradingSessionStatus_TradSesMode ->
    opt msg "325" parse_UnsolicitedIndicator @@ fun msg f_TradingSessionStatus_UnsolicitedIndicator ->
    req msg "340" parse_TradSesStatus @@ fun msg f_TradingSessionStatus_TradSesStatus ->
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
    f_TradingSessionStatus_TradSesMethod;
    f_TradingSessionStatus_TradSesMode;
    f_TradingSessionStatus_UnsolicitedIndicator;
    f_TradingSessionStatus_TradSesStatus;
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
    opt msg "338" parse_TradSesMethod @@ fun msg f_TradingSessionStatusRequest_TradSesMethod ->
    opt msg "339" parse_TradSesMode @@ fun msg f_TradingSessionStatusRequest_TradSesMode ->
    req msg "263" parse_SubscriptionRequestType @@ fun msg f_TradingSessionStatusRequest_SubscriptionRequestType ->
    ParseSuccess {
    f_TradingSessionStatusRequest_TradSesReqID;
    f_TradingSessionStatusRequest_TradingSessionID;
    f_TradingSessionStatusRequest_TradSesMethod;
    f_TradingSessionStatusRequest_TradSesMode;
    f_TradingSessionStatusRequest_SubscriptionRequestType;
    } , msg ) |> check_unknown_tags;;

let parse_app_msg_data msg_tag msg =
    (match msg_tag with
        | Full_Msg_Advertisement_Tag -> ((>>=) (parse_Advertisement msg) (fun f -> ParseSuccess (FIX_Full_Msg_Advertisement f)
        ))
        | Full_Msg_Allocation_Tag -> ((>>=) (parse_Allocation msg) (fun f -> ParseSuccess (FIX_Full_Msg_Allocation f)
        ))
        | Full_Msg_AllocationInstructionAck_Tag -> ((>>=) (parse_AllocationInstructionAck msg) (fun f -> ParseSuccess (FIX_Full_Msg_AllocationInstructionAck f)
        ))
        | Full_Msg_BidRequest_Tag -> ((>>=) (parse_BidRequest msg) (fun f -> ParseSuccess (FIX_Full_Msg_BidRequest f)
        ))
        | Full_Msg_BidResponse_Tag -> ((>>=) (parse_BidResponse msg) (fun f -> ParseSuccess (FIX_Full_Msg_BidResponse f)
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
        | Full_Msg_News_Tag -> ((>>=) (parse_News msg) (fun f -> ParseSuccess (FIX_Full_Msg_News f)
        ))
        | Full_Msg_OrderCancelReject_Tag -> ((>>=) (parse_OrderCancelReject msg) (fun f -> ParseSuccess (FIX_Full_Msg_OrderCancelReject f)
        ))
        | Full_Msg_OrderCancelReplaceRequest_Tag -> ((>>=) (parse_OrderCancelReplaceRequest msg) (fun f -> ParseSuccess (FIX_Full_Msg_OrderCancelReplaceRequest f)
        ))
        | Full_Msg_OrderCancelRequest_Tag -> ((>>=) (parse_OrderCancelRequest msg) (fun f -> ParseSuccess (FIX_Full_Msg_OrderCancelRequest f)
        ))
        | Full_Msg_OrderList_Tag -> ((>>=) (parse_OrderList msg) (fun f -> ParseSuccess (FIX_Full_Msg_OrderList f)
        ))
        | Full_Msg_OrderSingle_Tag -> ((>>=) (parse_OrderSingle msg) (fun f -> ParseSuccess (FIX_Full_Msg_OrderSingle f)
        ))
        | Full_Msg_OrderStatusRequest_Tag -> ((>>=) (parse_OrderStatusRequest msg) (fun f -> ParseSuccess (FIX_Full_Msg_OrderStatusRequest f)
        ))
        | Full_Msg_Quote_Tag -> ((>>=) (parse_Quote msg) (fun f -> ParseSuccess (FIX_Full_Msg_Quote f)
        ))
        | Full_Msg_QuoteAcknowledgement_Tag -> ((>>=) (parse_QuoteAcknowledgement msg) (fun f -> ParseSuccess (FIX_Full_Msg_QuoteAcknowledgement f)
        ))
        | Full_Msg_QuoteCancel_Tag -> ((>>=) (parse_QuoteCancel msg) (fun f -> ParseSuccess (FIX_Full_Msg_QuoteCancel f)
        ))
        | Full_Msg_QuoteRequest_Tag -> ((>>=) (parse_QuoteRequest msg) (fun f -> ParseSuccess (FIX_Full_Msg_QuoteRequest f)
        ))
        | Full_Msg_QuoteStatusRequest_Tag -> ((>>=) (parse_QuoteStatusRequest msg) (fun f -> ParseSuccess (FIX_Full_Msg_QuoteStatusRequest f)
        ))
        | Full_Msg_SecurityDefinition_Tag -> ((>>=) (parse_SecurityDefinition msg) (fun f -> ParseSuccess (FIX_Full_Msg_SecurityDefinition f)
        ))
        | Full_Msg_SecurityDefinitionRequest_Tag -> ((>>=) (parse_SecurityDefinitionRequest msg) (fun f -> ParseSuccess (FIX_Full_Msg_SecurityDefinitionRequest f)
        ))
        | Full_Msg_SecurityStatus_Tag -> ((>>=) (parse_SecurityStatus msg) (fun f -> ParseSuccess (FIX_Full_Msg_SecurityStatus f)
        ))
        | Full_Msg_SecurityStatusRequest_Tag -> ((>>=) (parse_SecurityStatusRequest msg) (fun f -> ParseSuccess (FIX_Full_Msg_SecurityStatusRequest f)
        ))
        | Full_Msg_SettlementInstructions_Tag -> ((>>=) (parse_SettlementInstructions msg) (fun f -> ParseSuccess (FIX_Full_Msg_SettlementInstructions f)
        ))
        | Full_Msg_TradingSessionStatus_Tag -> ((>>=) (parse_TradingSessionStatus msg) (fun f -> ParseSuccess (FIX_Full_Msg_TradingSessionStatus f)
        ))
        | Full_Msg_TradingSessionStatusRequest_Tag -> ((>>=) (parse_TradingSessionStatusRequest msg) (fun f -> ParseSuccess (FIX_Full_Msg_TradingSessionStatusRequest f)
        ))
    )
;;
