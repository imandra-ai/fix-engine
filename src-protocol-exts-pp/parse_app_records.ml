(* Aesthetic Integration copyright 2017 *)
(* @meta[imandra_ignore] on @end *)
open Parse_datetime;;
open Parse_base_types;;
open Parse_app_enums;;
open Parser_utils.Parser;;
open Full_app_records;;
(* @meta[imandra_ignore] off @end *)

let parse_OrderCancelReplaceRequestTradingSessions msg = (
    opt msg "386" parse_int @@ fun msg f_OrderCancelReplaceRequestTradingSessions_NoTradingSessions ->
    opt msg "336" parse_string @@ fun msg f_OrderCancelReplaceRequestTradingSessions_TradingSessionID ->
    ParseSuccess {
    f_OrderCancelReplaceRequestTradingSessions_NoTradingSessions;
    f_OrderCancelReplaceRequestTradingSessions_TradingSessionID;
    } , msg ) ;;

let parse_ExecutionReportContraBrokers msg = (
    opt msg "382" parse_int @@ fun msg f_ExecutionReportContraBrokers_NoContraBrokers ->
    opt msg "375" parse_string @@ fun msg f_ExecutionReportContraBrokers_ContraBroker ->
    opt msg "337" parse_string @@ fun msg f_ExecutionReportContraBrokers_ContraTrader ->
    opt msg "437" parse_float @@ fun msg f_ExecutionReportContraBrokers_ContraTradeQty ->
    opt msg "438" parse_UTCTimestamp @@ fun msg f_ExecutionReportContraBrokers_ContraTradeTime ->
    ParseSuccess {
    f_ExecutionReportContraBrokers_NoContraBrokers;
    f_ExecutionReportContraBrokers_ContraBroker;
    f_ExecutionReportContraBrokers_ContraTrader;
    f_ExecutionReportContraBrokers_ContraTradeQty;
    f_ExecutionReportContraBrokers_ContraTradeTime;
    } , msg ) ;;

let parse_QuoteAcknowledgementQuoteEntries msg = (
    opt msg "295" parse_int @@ fun msg f_QuoteAcknowledgementQuoteEntries_NoQuoteEntries ->
    opt msg "299" parse_string @@ fun msg f_QuoteAcknowledgementQuoteEntries_QuoteEntryID ->
    opt msg "55" parse_string @@ fun msg f_QuoteAcknowledgementQuoteEntries_Symbol ->
    opt msg "65" parse_string @@ fun msg f_QuoteAcknowledgementQuoteEntries_SymbolSfx ->
    opt msg "48" parse_string @@ fun msg f_QuoteAcknowledgementQuoteEntries_SecurityID ->
    opt msg "22" parse_IDSource @@ fun msg f_QuoteAcknowledgementQuoteEntries_IDSource ->
    opt msg "167" parse_SecurityType @@ fun msg f_QuoteAcknowledgementQuoteEntries_SecurityType ->
    opt msg "200" parse_MonthYear @@ fun msg f_QuoteAcknowledgementQuoteEntries_MaturityMonthYear ->
    opt msg "205" parse_int @@ fun msg f_QuoteAcknowledgementQuoteEntries_MaturityDay ->
    opt msg "201" parse_PutOrCall @@ fun msg f_QuoteAcknowledgementQuoteEntries_PutOrCall ->
    opt msg "202" parse_float @@ fun msg f_QuoteAcknowledgementQuoteEntries_StrikePrice ->
    opt msg "206" parse_char @@ fun msg f_QuoteAcknowledgementQuoteEntries_OptAttribute ->
    opt msg "231" parse_float @@ fun msg f_QuoteAcknowledgementQuoteEntries_ContractMultiplier ->
    opt msg "223" parse_float @@ fun msg f_QuoteAcknowledgementQuoteEntries_CouponRate ->
    opt msg "207" parse_Exchange @@ fun msg f_QuoteAcknowledgementQuoteEntries_SecurityExchange ->
    opt msg "106" parse_string @@ fun msg f_QuoteAcknowledgementQuoteEntries_Issuer ->
    opt msg "348" parse_int @@ fun msg f_QuoteAcknowledgementQuoteEntries_EncodedIssuerLen ->
    opt msg "349" parse_string @@ fun msg f_QuoteAcknowledgementQuoteEntries_EncodedIssuer ->
    opt msg "107" parse_string @@ fun msg f_QuoteAcknowledgementQuoteEntries_SecurityDesc ->
    opt msg "350" parse_int @@ fun msg f_QuoteAcknowledgementQuoteEntries_EncodedSecurityDescLen ->
    opt msg "351" parse_string @@ fun msg f_QuoteAcknowledgementQuoteEntries_EncodedSecurityDesc ->
    opt msg "368" parse_QuoteEntryRejectReason @@ fun msg f_QuoteAcknowledgementQuoteEntries_QuoteEntryRejectReason ->
    ParseSuccess {
    f_QuoteAcknowledgementQuoteEntries_NoQuoteEntries;
    f_QuoteAcknowledgementQuoteEntries_QuoteEntryID;
    f_QuoteAcknowledgementQuoteEntries_Symbol;
    f_QuoteAcknowledgementQuoteEntries_SymbolSfx;
    f_QuoteAcknowledgementQuoteEntries_SecurityID;
    f_QuoteAcknowledgementQuoteEntries_IDSource;
    f_QuoteAcknowledgementQuoteEntries_SecurityType;
    f_QuoteAcknowledgementQuoteEntries_MaturityMonthYear;
    f_QuoteAcknowledgementQuoteEntries_MaturityDay;
    f_QuoteAcknowledgementQuoteEntries_PutOrCall;
    f_QuoteAcknowledgementQuoteEntries_StrikePrice;
    f_QuoteAcknowledgementQuoteEntries_OptAttribute;
    f_QuoteAcknowledgementQuoteEntries_ContractMultiplier;
    f_QuoteAcknowledgementQuoteEntries_CouponRate;
    f_QuoteAcknowledgementQuoteEntries_SecurityExchange;
    f_QuoteAcknowledgementQuoteEntries_Issuer;
    f_QuoteAcknowledgementQuoteEntries_EncodedIssuerLen;
    f_QuoteAcknowledgementQuoteEntries_EncodedIssuer;
    f_QuoteAcknowledgementQuoteEntries_SecurityDesc;
    f_QuoteAcknowledgementQuoteEntries_EncodedSecurityDescLen;
    f_QuoteAcknowledgementQuoteEntries_EncodedSecurityDesc;
    f_QuoteAcknowledgementQuoteEntries_QuoteEntryRejectReason;
    } , msg ) ;;

let parse_ListStatusOrders msg = (
    req msg "73" parse_int @@ fun msg f_ListStatusOrders_NoOrders ->
    req msg "11" parse_string @@ fun msg f_ListStatusOrders_ClOrdID ->
    req msg "14" parse_float @@ fun msg f_ListStatusOrders_CumQty ->
    req msg "39" parse_OrdStatus @@ fun msg f_ListStatusOrders_OrdStatus ->
    req msg "151" parse_float @@ fun msg f_ListStatusOrders_LeavesQty ->
    req msg "84" parse_float @@ fun msg f_ListStatusOrders_CxlQty ->
    req msg "6" parse_float @@ fun msg f_ListStatusOrders_AvgPx ->
    opt msg "103" parse_OrdRejReason @@ fun msg f_ListStatusOrders_OrdRejReason ->
    opt msg "58" parse_string @@ fun msg f_ListStatusOrders_Text ->
    opt msg "354" parse_int @@ fun msg f_ListStatusOrders_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_ListStatusOrders_EncodedText ->
    ParseSuccess {
    f_ListStatusOrders_NoOrders;
    f_ListStatusOrders_ClOrdID;
    f_ListStatusOrders_CumQty;
    f_ListStatusOrders_OrdStatus;
    f_ListStatusOrders_LeavesQty;
    f_ListStatusOrders_CxlQty;
    f_ListStatusOrders_AvgPx;
    f_ListStatusOrders_OrdRejReason;
    f_ListStatusOrders_Text;
    f_ListStatusOrders_EncodedTextLen;
    f_ListStatusOrders_EncodedText;
    } , msg ) ;;

let parse_QuoteAcknowledgementQuoteSets msg = (
    opt msg "296" parse_int @@ fun msg f_QuoteAcknowledgementQuoteSets_NoQuoteSets ->
    opt msg "302" parse_string @@ fun msg f_QuoteAcknowledgementQuoteSets_QuoteSetID ->
    opt msg "311" parse_string @@ fun msg f_QuoteAcknowledgementQuoteSets_UnderlyingSymbol ->
    opt msg "312" parse_string @@ fun msg f_QuoteAcknowledgementQuoteSets_UnderlyingSymbolSfx ->
    opt msg "309" parse_string @@ fun msg f_QuoteAcknowledgementQuoteSets_UnderlyingSecurityID ->
    opt msg "305" parse_string @@ fun msg f_QuoteAcknowledgementQuoteSets_UnderlyingIDSource ->
    opt msg "310" parse_string @@ fun msg f_QuoteAcknowledgementQuoteSets_UnderlyingSecurityType ->
    opt msg "313" parse_MonthYear @@ fun msg f_QuoteAcknowledgementQuoteSets_UnderlyingMaturityMonthYear ->
    opt msg "314" parse_int @@ fun msg f_QuoteAcknowledgementQuoteSets_UnderlyingMaturityDay ->
    opt msg "315" parse_int @@ fun msg f_QuoteAcknowledgementQuoteSets_UnderlyingPutOrCall ->
    opt msg "316" parse_float @@ fun msg f_QuoteAcknowledgementQuoteSets_UnderlyingStrikePrice ->
    opt msg "317" parse_char @@ fun msg f_QuoteAcknowledgementQuoteSets_UnderlyingOptAttribute ->
    opt msg "436" parse_float @@ fun msg f_QuoteAcknowledgementQuoteSets_UnderlyingContractMultiplier ->
    opt msg "435" parse_float @@ fun msg f_QuoteAcknowledgementQuoteSets_UnderlyingCouponRate ->
    opt msg "308" parse_Exchange @@ fun msg f_QuoteAcknowledgementQuoteSets_UnderlyingSecurityExchange ->
    opt msg "306" parse_string @@ fun msg f_QuoteAcknowledgementQuoteSets_UnderlyingIssuer ->
    opt msg "362" parse_int @@ fun msg f_QuoteAcknowledgementQuoteSets_EncodedUnderlyingIssuerLen ->
    opt msg "363" parse_string @@ fun msg f_QuoteAcknowledgementQuoteSets_EncodedUnderlyingIssuer ->
    opt msg "307" parse_string @@ fun msg f_QuoteAcknowledgementQuoteSets_UnderlyingSecurityDesc ->
    opt msg "364" parse_int @@ fun msg f_QuoteAcknowledgementQuoteSets_EncodedUnderlyingSecurityDescLen ->
    opt msg "365" parse_string @@ fun msg f_QuoteAcknowledgementQuoteSets_EncodedUnderlyingSecurityDesc ->
    opt msg "304" parse_int @@ fun msg f_QuoteAcknowledgementQuoteSets_TotQuoteEntries ->
    ParseSuccess {
    f_QuoteAcknowledgementQuoteSets_NoQuoteSets;
    f_QuoteAcknowledgementQuoteSets_QuoteSetID;
    f_QuoteAcknowledgementQuoteSets_UnderlyingSymbol;
    f_QuoteAcknowledgementQuoteSets_UnderlyingSymbolSfx;
    f_QuoteAcknowledgementQuoteSets_UnderlyingSecurityID;
    f_QuoteAcknowledgementQuoteSets_UnderlyingIDSource;
    f_QuoteAcknowledgementQuoteSets_UnderlyingSecurityType;
    f_QuoteAcknowledgementQuoteSets_UnderlyingMaturityMonthYear;
    f_QuoteAcknowledgementQuoteSets_UnderlyingMaturityDay;
    f_QuoteAcknowledgementQuoteSets_UnderlyingPutOrCall;
    f_QuoteAcknowledgementQuoteSets_UnderlyingStrikePrice;
    f_QuoteAcknowledgementQuoteSets_UnderlyingOptAttribute;
    f_QuoteAcknowledgementQuoteSets_UnderlyingContractMultiplier;
    f_QuoteAcknowledgementQuoteSets_UnderlyingCouponRate;
    f_QuoteAcknowledgementQuoteSets_UnderlyingSecurityExchange;
    f_QuoteAcknowledgementQuoteSets_UnderlyingIssuer;
    f_QuoteAcknowledgementQuoteSets_EncodedUnderlyingIssuerLen;
    f_QuoteAcknowledgementQuoteSets_EncodedUnderlyingIssuer;
    f_QuoteAcknowledgementQuoteSets_UnderlyingSecurityDesc;
    f_QuoteAcknowledgementQuoteSets_EncodedUnderlyingSecurityDescLen;
    f_QuoteAcknowledgementQuoteSets_EncodedUnderlyingSecurityDesc;
    f_QuoteAcknowledgementQuoteSets_TotQuoteEntries;
    } , msg ) ;;

let parse_EmailLinesOfText msg = (
    req msg "33" parse_int @@ fun msg f_EmailLinesOfText_LinesOfText ->
    req msg "58" parse_string @@ fun msg f_EmailLinesOfText_Text ->
    opt msg "354" parse_int @@ fun msg f_EmailLinesOfText_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_EmailLinesOfText_EncodedText ->
    ParseSuccess {
    f_EmailLinesOfText_LinesOfText;
    f_EmailLinesOfText_Text;
    f_EmailLinesOfText_EncodedTextLen;
    f_EmailLinesOfText_EncodedText;
    } , msg ) ;;

let parse_OrderSingleTradingSessions msg = (
    opt msg "386" parse_int @@ fun msg f_OrderSingleTradingSessions_NoTradingSessions ->
    opt msg "336" parse_string @@ fun msg f_OrderSingleTradingSessions_TradingSessionID ->
    ParseSuccess {
    f_OrderSingleTradingSessions_NoTradingSessions;
    f_OrderSingleTradingSessions_TradingSessionID;
    } , msg ) ;;

let parse_QuoteRequestRelatedSym msg = (
    req msg "146" parse_int @@ fun msg f_QuoteRequestRelatedSym_NoRelatedSym ->
    req msg "55" parse_string @@ fun msg f_QuoteRequestRelatedSym_Symbol ->
    opt msg "65" parse_string @@ fun msg f_QuoteRequestRelatedSym_SymbolSfx ->
    opt msg "48" parse_string @@ fun msg f_QuoteRequestRelatedSym_SecurityID ->
    opt msg "22" parse_IDSource @@ fun msg f_QuoteRequestRelatedSym_IDSource ->
    opt msg "167" parse_SecurityType @@ fun msg f_QuoteRequestRelatedSym_SecurityType ->
    opt msg "200" parse_MonthYear @@ fun msg f_QuoteRequestRelatedSym_MaturityMonthYear ->
    opt msg "205" parse_int @@ fun msg f_QuoteRequestRelatedSym_MaturityDay ->
    opt msg "201" parse_PutOrCall @@ fun msg f_QuoteRequestRelatedSym_PutOrCall ->
    opt msg "202" parse_float @@ fun msg f_QuoteRequestRelatedSym_StrikePrice ->
    opt msg "206" parse_char @@ fun msg f_QuoteRequestRelatedSym_OptAttribute ->
    opt msg "231" parse_float @@ fun msg f_QuoteRequestRelatedSym_ContractMultiplier ->
    opt msg "223" parse_float @@ fun msg f_QuoteRequestRelatedSym_CouponRate ->
    opt msg "207" parse_Exchange @@ fun msg f_QuoteRequestRelatedSym_SecurityExchange ->
    opt msg "106" parse_string @@ fun msg f_QuoteRequestRelatedSym_Issuer ->
    opt msg "348" parse_int @@ fun msg f_QuoteRequestRelatedSym_EncodedIssuerLen ->
    opt msg "349" parse_string @@ fun msg f_QuoteRequestRelatedSym_EncodedIssuer ->
    opt msg "107" parse_string @@ fun msg f_QuoteRequestRelatedSym_SecurityDesc ->
    opt msg "350" parse_int @@ fun msg f_QuoteRequestRelatedSym_EncodedSecurityDescLen ->
    opt msg "351" parse_string @@ fun msg f_QuoteRequestRelatedSym_EncodedSecurityDesc ->
    opt msg "140" parse_float @@ fun msg f_QuoteRequestRelatedSym_PrevClosePx ->
    opt msg "303" parse_QuoteRequestType @@ fun msg f_QuoteRequestRelatedSym_QuoteRequestType ->
    opt msg "336" parse_string @@ fun msg f_QuoteRequestRelatedSym_TradingSessionID ->
    opt msg "54" parse_Side @@ fun msg f_QuoteRequestRelatedSym_Side ->
    opt msg "38" parse_float @@ fun msg f_QuoteRequestRelatedSym_OrderQty ->
    opt msg "64" parse_LocalMktDate @@ fun msg f_QuoteRequestRelatedSym_FutSettDate ->
    opt msg "40" parse_OrdType @@ fun msg f_QuoteRequestRelatedSym_OrdType ->
    opt msg "193" parse_LocalMktDate @@ fun msg f_QuoteRequestRelatedSym_FutSettDate2 ->
    opt msg "192" parse_float @@ fun msg f_QuoteRequestRelatedSym_OrderQty2 ->
    opt msg "126" parse_UTCTimestamp @@ fun msg f_QuoteRequestRelatedSym_ExpireTime ->
    opt msg "60" parse_UTCTimestamp @@ fun msg f_QuoteRequestRelatedSym_TransactTime ->
    opt msg "15" parse_Currency @@ fun msg f_QuoteRequestRelatedSym_Currency ->
    ParseSuccess {
    f_QuoteRequestRelatedSym_NoRelatedSym;
    f_QuoteRequestRelatedSym_Symbol;
    f_QuoteRequestRelatedSym_SymbolSfx;
    f_QuoteRequestRelatedSym_SecurityID;
    f_QuoteRequestRelatedSym_IDSource;
    f_QuoteRequestRelatedSym_SecurityType;
    f_QuoteRequestRelatedSym_MaturityMonthYear;
    f_QuoteRequestRelatedSym_MaturityDay;
    f_QuoteRequestRelatedSym_PutOrCall;
    f_QuoteRequestRelatedSym_StrikePrice;
    f_QuoteRequestRelatedSym_OptAttribute;
    f_QuoteRequestRelatedSym_ContractMultiplier;
    f_QuoteRequestRelatedSym_CouponRate;
    f_QuoteRequestRelatedSym_SecurityExchange;
    f_QuoteRequestRelatedSym_Issuer;
    f_QuoteRequestRelatedSym_EncodedIssuerLen;
    f_QuoteRequestRelatedSym_EncodedIssuer;
    f_QuoteRequestRelatedSym_SecurityDesc;
    f_QuoteRequestRelatedSym_EncodedSecurityDescLen;
    f_QuoteRequestRelatedSym_EncodedSecurityDesc;
    f_QuoteRequestRelatedSym_PrevClosePx;
    f_QuoteRequestRelatedSym_QuoteRequestType;
    f_QuoteRequestRelatedSym_TradingSessionID;
    f_QuoteRequestRelatedSym_Side;
    f_QuoteRequestRelatedSym_OrderQty;
    f_QuoteRequestRelatedSym_FutSettDate;
    f_QuoteRequestRelatedSym_OrdType;
    f_QuoteRequestRelatedSym_FutSettDate2;
    f_QuoteRequestRelatedSym_OrderQty2;
    f_QuoteRequestRelatedSym_ExpireTime;
    f_QuoteRequestRelatedSym_TransactTime;
    f_QuoteRequestRelatedSym_Currency;
    } , msg ) ;;

let parse_ListStrikePriceStrikes msg = (
    req msg "428" parse_int @@ fun msg f_ListStrikePriceStrikes_NoStrikes ->
    req msg "55" parse_string @@ fun msg f_ListStrikePriceStrikes_Symbol ->
    opt msg "65" parse_string @@ fun msg f_ListStrikePriceStrikes_SymbolSfx ->
    opt msg "48" parse_string @@ fun msg f_ListStrikePriceStrikes_SecurityID ->
    opt msg "22" parse_IDSource @@ fun msg f_ListStrikePriceStrikes_IDSource ->
    opt msg "167" parse_SecurityType @@ fun msg f_ListStrikePriceStrikes_SecurityType ->
    opt msg "200" parse_MonthYear @@ fun msg f_ListStrikePriceStrikes_MaturityMonthYear ->
    opt msg "205" parse_int @@ fun msg f_ListStrikePriceStrikes_MaturityDay ->
    opt msg "201" parse_PutOrCall @@ fun msg f_ListStrikePriceStrikes_PutOrCall ->
    opt msg "202" parse_float @@ fun msg f_ListStrikePriceStrikes_StrikePrice ->
    opt msg "206" parse_char @@ fun msg f_ListStrikePriceStrikes_OptAttribute ->
    opt msg "231" parse_float @@ fun msg f_ListStrikePriceStrikes_ContractMultiplier ->
    opt msg "223" parse_float @@ fun msg f_ListStrikePriceStrikes_CouponRate ->
    opt msg "207" parse_Exchange @@ fun msg f_ListStrikePriceStrikes_SecurityExchange ->
    opt msg "106" parse_string @@ fun msg f_ListStrikePriceStrikes_Issuer ->
    opt msg "348" parse_int @@ fun msg f_ListStrikePriceStrikes_EncodedIssuerLen ->
    opt msg "349" parse_string @@ fun msg f_ListStrikePriceStrikes_EncodedIssuer ->
    opt msg "107" parse_string @@ fun msg f_ListStrikePriceStrikes_SecurityDesc ->
    opt msg "350" parse_int @@ fun msg f_ListStrikePriceStrikes_EncodedSecurityDescLen ->
    opt msg "351" parse_string @@ fun msg f_ListStrikePriceStrikes_EncodedSecurityDesc ->
    opt msg "140" parse_float @@ fun msg f_ListStrikePriceStrikes_PrevClosePx ->
    opt msg "11" parse_string @@ fun msg f_ListStrikePriceStrikes_ClOrdID ->
    opt msg "54" parse_Side @@ fun msg f_ListStrikePriceStrikes_Side ->
    req msg "44" parse_float @@ fun msg f_ListStrikePriceStrikes_Price ->
    opt msg "15" parse_Currency @@ fun msg f_ListStrikePriceStrikes_Currency ->
    opt msg "58" parse_string @@ fun msg f_ListStrikePriceStrikes_Text ->
    opt msg "354" parse_int @@ fun msg f_ListStrikePriceStrikes_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_ListStrikePriceStrikes_EncodedText ->
    ParseSuccess {
    f_ListStrikePriceStrikes_NoStrikes;
    f_ListStrikePriceStrikes_Symbol;
    f_ListStrikePriceStrikes_SymbolSfx;
    f_ListStrikePriceStrikes_SecurityID;
    f_ListStrikePriceStrikes_IDSource;
    f_ListStrikePriceStrikes_SecurityType;
    f_ListStrikePriceStrikes_MaturityMonthYear;
    f_ListStrikePriceStrikes_MaturityDay;
    f_ListStrikePriceStrikes_PutOrCall;
    f_ListStrikePriceStrikes_StrikePrice;
    f_ListStrikePriceStrikes_OptAttribute;
    f_ListStrikePriceStrikes_ContractMultiplier;
    f_ListStrikePriceStrikes_CouponRate;
    f_ListStrikePriceStrikes_SecurityExchange;
    f_ListStrikePriceStrikes_Issuer;
    f_ListStrikePriceStrikes_EncodedIssuerLen;
    f_ListStrikePriceStrikes_EncodedIssuer;
    f_ListStrikePriceStrikes_SecurityDesc;
    f_ListStrikePriceStrikes_EncodedSecurityDescLen;
    f_ListStrikePriceStrikes_EncodedSecurityDesc;
    f_ListStrikePriceStrikes_PrevClosePx;
    f_ListStrikePriceStrikes_ClOrdID;
    f_ListStrikePriceStrikes_Side;
    f_ListStrikePriceStrikes_Price;
    f_ListStrikePriceStrikes_Currency;
    f_ListStrikePriceStrikes_Text;
    f_ListStrikePriceStrikes_EncodedTextLen;
    f_ListStrikePriceStrikes_EncodedText;
    } , msg ) ;;

let parse_SecurityDefinitionRequestRelatedSym msg = (
    opt msg "146" parse_int @@ fun msg f_SecurityDefinitionRequestRelatedSym_NoRelatedSym ->
    opt msg "311" parse_string @@ fun msg f_SecurityDefinitionRequestRelatedSym_UnderlyingSymbol ->
    opt msg "312" parse_string @@ fun msg f_SecurityDefinitionRequestRelatedSym_UnderlyingSymbolSfx ->
    opt msg "309" parse_string @@ fun msg f_SecurityDefinitionRequestRelatedSym_UnderlyingSecurityID ->
    opt msg "305" parse_string @@ fun msg f_SecurityDefinitionRequestRelatedSym_UnderlyingIDSource ->
    opt msg "310" parse_string @@ fun msg f_SecurityDefinitionRequestRelatedSym_UnderlyingSecurityType ->
    opt msg "313" parse_MonthYear @@ fun msg f_SecurityDefinitionRequestRelatedSym_UnderlyingMaturityMonthYear ->
    opt msg "314" parse_int @@ fun msg f_SecurityDefinitionRequestRelatedSym_UnderlyingMaturityDay ->
    opt msg "315" parse_int @@ fun msg f_SecurityDefinitionRequestRelatedSym_UnderlyingPutOrCall ->
    opt msg "316" parse_float @@ fun msg f_SecurityDefinitionRequestRelatedSym_UnderlyingStrikePrice ->
    opt msg "317" parse_char @@ fun msg f_SecurityDefinitionRequestRelatedSym_UnderlyingOptAttribute ->
    opt msg "436" parse_float @@ fun msg f_SecurityDefinitionRequestRelatedSym_UnderlyingContractMultiplier ->
    opt msg "435" parse_float @@ fun msg f_SecurityDefinitionRequestRelatedSym_UnderlyingCouponRate ->
    opt msg "308" parse_Exchange @@ fun msg f_SecurityDefinitionRequestRelatedSym_UnderlyingSecurityExchange ->
    opt msg "306" parse_string @@ fun msg f_SecurityDefinitionRequestRelatedSym_UnderlyingIssuer ->
    opt msg "362" parse_int @@ fun msg f_SecurityDefinitionRequestRelatedSym_EncodedUnderlyingIssuerLen ->
    opt msg "363" parse_string @@ fun msg f_SecurityDefinitionRequestRelatedSym_EncodedUnderlyingIssuer ->
    opt msg "307" parse_string @@ fun msg f_SecurityDefinitionRequestRelatedSym_UnderlyingSecurityDesc ->
    opt msg "364" parse_int @@ fun msg f_SecurityDefinitionRequestRelatedSym_EncodedUnderlyingSecurityDescLen ->
    opt msg "365" parse_string @@ fun msg f_SecurityDefinitionRequestRelatedSym_EncodedUnderlyingSecurityDesc ->
    opt msg "319" parse_float @@ fun msg f_SecurityDefinitionRequestRelatedSym_RatioQty ->
    opt msg "54" parse_Side @@ fun msg f_SecurityDefinitionRequestRelatedSym_Side ->
    opt msg "318" parse_Currency @@ fun msg f_SecurityDefinitionRequestRelatedSym_UnderlyingCurrency ->
    ParseSuccess {
    f_SecurityDefinitionRequestRelatedSym_NoRelatedSym;
    f_SecurityDefinitionRequestRelatedSym_UnderlyingSymbol;
    f_SecurityDefinitionRequestRelatedSym_UnderlyingSymbolSfx;
    f_SecurityDefinitionRequestRelatedSym_UnderlyingSecurityID;
    f_SecurityDefinitionRequestRelatedSym_UnderlyingIDSource;
    f_SecurityDefinitionRequestRelatedSym_UnderlyingSecurityType;
    f_SecurityDefinitionRequestRelatedSym_UnderlyingMaturityMonthYear;
    f_SecurityDefinitionRequestRelatedSym_UnderlyingMaturityDay;
    f_SecurityDefinitionRequestRelatedSym_UnderlyingPutOrCall;
    f_SecurityDefinitionRequestRelatedSym_UnderlyingStrikePrice;
    f_SecurityDefinitionRequestRelatedSym_UnderlyingOptAttribute;
    f_SecurityDefinitionRequestRelatedSym_UnderlyingContractMultiplier;
    f_SecurityDefinitionRequestRelatedSym_UnderlyingCouponRate;
    f_SecurityDefinitionRequestRelatedSym_UnderlyingSecurityExchange;
    f_SecurityDefinitionRequestRelatedSym_UnderlyingIssuer;
    f_SecurityDefinitionRequestRelatedSym_EncodedUnderlyingIssuerLen;
    f_SecurityDefinitionRequestRelatedSym_EncodedUnderlyingIssuer;
    f_SecurityDefinitionRequestRelatedSym_UnderlyingSecurityDesc;
    f_SecurityDefinitionRequestRelatedSym_EncodedUnderlyingSecurityDescLen;
    f_SecurityDefinitionRequestRelatedSym_EncodedUnderlyingSecurityDesc;
    f_SecurityDefinitionRequestRelatedSym_RatioQty;
    f_SecurityDefinitionRequestRelatedSym_Side;
    f_SecurityDefinitionRequestRelatedSym_UnderlyingCurrency;
    } , msg ) ;;

let parse_NewsRoutingIDs msg = (
    opt msg "215" parse_int @@ fun msg f_NewsRoutingIDs_NoRoutingIDs ->
    opt msg "216" parse_RoutingType @@ fun msg f_NewsRoutingIDs_RoutingType ->
    opt msg "217" parse_string @@ fun msg f_NewsRoutingIDs_RoutingID ->
    ParseSuccess {
    f_NewsRoutingIDs_NoRoutingIDs;
    f_NewsRoutingIDs_RoutingType;
    f_NewsRoutingIDs_RoutingID;
    } , msg ) ;;

let parse_IOIRoutingIDs msg = (
    opt msg "215" parse_int @@ fun msg f_IOIRoutingIDs_NoRoutingIDs ->
    opt msg "216" parse_RoutingType @@ fun msg f_IOIRoutingIDs_RoutingType ->
    opt msg "217" parse_string @@ fun msg f_IOIRoutingIDs_RoutingID ->
    ParseSuccess {
    f_IOIRoutingIDs_NoRoutingIDs;
    f_IOIRoutingIDs_RoutingType;
    f_IOIRoutingIDs_RoutingID;
    } , msg ) ;;

let parse_MassQuoteQuoteSets msg = (
    req msg "296" parse_int @@ fun msg f_MassQuoteQuoteSets_NoQuoteSets ->
    req msg "302" parse_string @@ fun msg f_MassQuoteQuoteSets_QuoteSetID ->
    req msg "311" parse_string @@ fun msg f_MassQuoteQuoteSets_UnderlyingSymbol ->
    opt msg "312" parse_string @@ fun msg f_MassQuoteQuoteSets_UnderlyingSymbolSfx ->
    opt msg "309" parse_string @@ fun msg f_MassQuoteQuoteSets_UnderlyingSecurityID ->
    opt msg "305" parse_string @@ fun msg f_MassQuoteQuoteSets_UnderlyingIDSource ->
    opt msg "310" parse_string @@ fun msg f_MassQuoteQuoteSets_UnderlyingSecurityType ->
    opt msg "313" parse_MonthYear @@ fun msg f_MassQuoteQuoteSets_UnderlyingMaturityMonthYear ->
    opt msg "314" parse_int @@ fun msg f_MassQuoteQuoteSets_UnderlyingMaturityDay ->
    opt msg "315" parse_int @@ fun msg f_MassQuoteQuoteSets_UnderlyingPutOrCall ->
    opt msg "316" parse_float @@ fun msg f_MassQuoteQuoteSets_UnderlyingStrikePrice ->
    opt msg "317" parse_char @@ fun msg f_MassQuoteQuoteSets_UnderlyingOptAttribute ->
    opt msg "436" parse_float @@ fun msg f_MassQuoteQuoteSets_UnderlyingContractMultiplier ->
    opt msg "435" parse_float @@ fun msg f_MassQuoteQuoteSets_UnderlyingCouponRate ->
    opt msg "308" parse_Exchange @@ fun msg f_MassQuoteQuoteSets_UnderlyingSecurityExchange ->
    opt msg "306" parse_string @@ fun msg f_MassQuoteQuoteSets_UnderlyingIssuer ->
    opt msg "362" parse_int @@ fun msg f_MassQuoteQuoteSets_EncodedUnderlyingIssuerLen ->
    opt msg "363" parse_string @@ fun msg f_MassQuoteQuoteSets_EncodedUnderlyingIssuer ->
    opt msg "307" parse_string @@ fun msg f_MassQuoteQuoteSets_UnderlyingSecurityDesc ->
    opt msg "364" parse_int @@ fun msg f_MassQuoteQuoteSets_EncodedUnderlyingSecurityDescLen ->
    opt msg "365" parse_string @@ fun msg f_MassQuoteQuoteSets_EncodedUnderlyingSecurityDesc ->
    opt msg "367" parse_UTCTimestamp @@ fun msg f_MassQuoteQuoteSets_QuoteSetValidUntilTime ->
    req msg "304" parse_int @@ fun msg f_MassQuoteQuoteSets_TotQuoteEntries ->
    ParseSuccess {
    f_MassQuoteQuoteSets_NoQuoteSets;
    f_MassQuoteQuoteSets_QuoteSetID;
    f_MassQuoteQuoteSets_UnderlyingSymbol;
    f_MassQuoteQuoteSets_UnderlyingSymbolSfx;
    f_MassQuoteQuoteSets_UnderlyingSecurityID;
    f_MassQuoteQuoteSets_UnderlyingIDSource;
    f_MassQuoteQuoteSets_UnderlyingSecurityType;
    f_MassQuoteQuoteSets_UnderlyingMaturityMonthYear;
    f_MassQuoteQuoteSets_UnderlyingMaturityDay;
    f_MassQuoteQuoteSets_UnderlyingPutOrCall;
    f_MassQuoteQuoteSets_UnderlyingStrikePrice;
    f_MassQuoteQuoteSets_UnderlyingOptAttribute;
    f_MassQuoteQuoteSets_UnderlyingContractMultiplier;
    f_MassQuoteQuoteSets_UnderlyingCouponRate;
    f_MassQuoteQuoteSets_UnderlyingSecurityExchange;
    f_MassQuoteQuoteSets_UnderlyingIssuer;
    f_MassQuoteQuoteSets_EncodedUnderlyingIssuerLen;
    f_MassQuoteQuoteSets_EncodedUnderlyingIssuer;
    f_MassQuoteQuoteSets_UnderlyingSecurityDesc;
    f_MassQuoteQuoteSets_EncodedUnderlyingSecurityDescLen;
    f_MassQuoteQuoteSets_EncodedUnderlyingSecurityDesc;
    f_MassQuoteQuoteSets_QuoteSetValidUntilTime;
    f_MassQuoteQuoteSets_TotQuoteEntries;
    } , msg ) ;;

let parse_QuoteCancelQuoteEntries msg = (
    req msg "295" parse_int @@ fun msg f_QuoteCancelQuoteEntries_NoQuoteEntries ->
    req msg "55" parse_string @@ fun msg f_QuoteCancelQuoteEntries_Symbol ->
    opt msg "65" parse_string @@ fun msg f_QuoteCancelQuoteEntries_SymbolSfx ->
    opt msg "48" parse_string @@ fun msg f_QuoteCancelQuoteEntries_SecurityID ->
    opt msg "22" parse_IDSource @@ fun msg f_QuoteCancelQuoteEntries_IDSource ->
    opt msg "167" parse_SecurityType @@ fun msg f_QuoteCancelQuoteEntries_SecurityType ->
    opt msg "200" parse_MonthYear @@ fun msg f_QuoteCancelQuoteEntries_MaturityMonthYear ->
    opt msg "205" parse_int @@ fun msg f_QuoteCancelQuoteEntries_MaturityDay ->
    opt msg "201" parse_PutOrCall @@ fun msg f_QuoteCancelQuoteEntries_PutOrCall ->
    opt msg "202" parse_float @@ fun msg f_QuoteCancelQuoteEntries_StrikePrice ->
    opt msg "206" parse_char @@ fun msg f_QuoteCancelQuoteEntries_OptAttribute ->
    opt msg "231" parse_float @@ fun msg f_QuoteCancelQuoteEntries_ContractMultiplier ->
    opt msg "223" parse_float @@ fun msg f_QuoteCancelQuoteEntries_CouponRate ->
    opt msg "207" parse_Exchange @@ fun msg f_QuoteCancelQuoteEntries_SecurityExchange ->
    opt msg "106" parse_string @@ fun msg f_QuoteCancelQuoteEntries_Issuer ->
    opt msg "348" parse_int @@ fun msg f_QuoteCancelQuoteEntries_EncodedIssuerLen ->
    opt msg "349" parse_string @@ fun msg f_QuoteCancelQuoteEntries_EncodedIssuer ->
    opt msg "107" parse_string @@ fun msg f_QuoteCancelQuoteEntries_SecurityDesc ->
    opt msg "350" parse_int @@ fun msg f_QuoteCancelQuoteEntries_EncodedSecurityDescLen ->
    opt msg "351" parse_string @@ fun msg f_QuoteCancelQuoteEntries_EncodedSecurityDesc ->
    opt msg "311" parse_string @@ fun msg f_QuoteCancelQuoteEntries_UnderlyingSymbol ->
    ParseSuccess {
    f_QuoteCancelQuoteEntries_NoQuoteEntries;
    f_QuoteCancelQuoteEntries_Symbol;
    f_QuoteCancelQuoteEntries_SymbolSfx;
    f_QuoteCancelQuoteEntries_SecurityID;
    f_QuoteCancelQuoteEntries_IDSource;
    f_QuoteCancelQuoteEntries_SecurityType;
    f_QuoteCancelQuoteEntries_MaturityMonthYear;
    f_QuoteCancelQuoteEntries_MaturityDay;
    f_QuoteCancelQuoteEntries_PutOrCall;
    f_QuoteCancelQuoteEntries_StrikePrice;
    f_QuoteCancelQuoteEntries_OptAttribute;
    f_QuoteCancelQuoteEntries_ContractMultiplier;
    f_QuoteCancelQuoteEntries_CouponRate;
    f_QuoteCancelQuoteEntries_SecurityExchange;
    f_QuoteCancelQuoteEntries_Issuer;
    f_QuoteCancelQuoteEntries_EncodedIssuerLen;
    f_QuoteCancelQuoteEntries_EncodedIssuer;
    f_QuoteCancelQuoteEntries_SecurityDesc;
    f_QuoteCancelQuoteEntries_EncodedSecurityDescLen;
    f_QuoteCancelQuoteEntries_EncodedSecurityDesc;
    f_QuoteCancelQuoteEntries_UnderlyingSymbol;
    } , msg ) ;;

let parse_MarketDataIncrementalRefreshMDEntries msg = (
    req msg "268" parse_int @@ fun msg f_MarketDataIncrementalRefreshMDEntries_NoMDEntries ->
    req msg "279" parse_MDUpdateAction @@ fun msg f_MarketDataIncrementalRefreshMDEntries_MDUpdateAction ->
    opt msg "285" parse_DeleteReason @@ fun msg f_MarketDataIncrementalRefreshMDEntries_DeleteReason ->
    opt msg "269" parse_MDEntryType @@ fun msg f_MarketDataIncrementalRefreshMDEntries_MDEntryType ->
    opt msg "278" parse_string @@ fun msg f_MarketDataIncrementalRefreshMDEntries_MDEntryID ->
    opt msg "280" parse_string @@ fun msg f_MarketDataIncrementalRefreshMDEntries_MDEntryRefID ->
    opt msg "55" parse_string @@ fun msg f_MarketDataIncrementalRefreshMDEntries_Symbol ->
    opt msg "65" parse_string @@ fun msg f_MarketDataIncrementalRefreshMDEntries_SymbolSfx ->
    opt msg "48" parse_string @@ fun msg f_MarketDataIncrementalRefreshMDEntries_SecurityID ->
    opt msg "22" parse_IDSource @@ fun msg f_MarketDataIncrementalRefreshMDEntries_IDSource ->
    opt msg "167" parse_SecurityType @@ fun msg f_MarketDataIncrementalRefreshMDEntries_SecurityType ->
    opt msg "200" parse_MonthYear @@ fun msg f_MarketDataIncrementalRefreshMDEntries_MaturityMonthYear ->
    opt msg "205" parse_int @@ fun msg f_MarketDataIncrementalRefreshMDEntries_MaturityDay ->
    opt msg "201" parse_PutOrCall @@ fun msg f_MarketDataIncrementalRefreshMDEntries_PutOrCall ->
    opt msg "202" parse_float @@ fun msg f_MarketDataIncrementalRefreshMDEntries_StrikePrice ->
    opt msg "206" parse_char @@ fun msg f_MarketDataIncrementalRefreshMDEntries_OptAttribute ->
    opt msg "231" parse_float @@ fun msg f_MarketDataIncrementalRefreshMDEntries_ContractMultiplier ->
    opt msg "223" parse_float @@ fun msg f_MarketDataIncrementalRefreshMDEntries_CouponRate ->
    opt msg "207" parse_Exchange @@ fun msg f_MarketDataIncrementalRefreshMDEntries_SecurityExchange ->
    opt msg "106" parse_string @@ fun msg f_MarketDataIncrementalRefreshMDEntries_Issuer ->
    opt msg "348" parse_int @@ fun msg f_MarketDataIncrementalRefreshMDEntries_EncodedIssuerLen ->
    opt msg "349" parse_string @@ fun msg f_MarketDataIncrementalRefreshMDEntries_EncodedIssuer ->
    opt msg "107" parse_string @@ fun msg f_MarketDataIncrementalRefreshMDEntries_SecurityDesc ->
    opt msg "350" parse_int @@ fun msg f_MarketDataIncrementalRefreshMDEntries_EncodedSecurityDescLen ->
    opt msg "351" parse_string @@ fun msg f_MarketDataIncrementalRefreshMDEntries_EncodedSecurityDesc ->
    opt msg "291" parse_FinancialStatus @@ fun msg f_MarketDataIncrementalRefreshMDEntries_FinancialStatus ->
    opt msg "292" parse_CorporateAction @@ fun msg f_MarketDataIncrementalRefreshMDEntries_CorporateAction ->
    opt msg "270" parse_float @@ fun msg f_MarketDataIncrementalRefreshMDEntries_MDEntryPx ->
    opt msg "15" parse_Currency @@ fun msg f_MarketDataIncrementalRefreshMDEntries_Currency ->
    opt msg "271" parse_float @@ fun msg f_MarketDataIncrementalRefreshMDEntries_MDEntrySize ->
    opt msg "272" parse_UTCDateOnly @@ fun msg f_MarketDataIncrementalRefreshMDEntries_MDEntryDate ->
    opt msg "273" parse_UTCTimeOnly @@ fun msg f_MarketDataIncrementalRefreshMDEntries_MDEntryTime ->
    opt msg "274" parse_TickDirection @@ fun msg f_MarketDataIncrementalRefreshMDEntries_TickDirection ->
    opt msg "275" parse_Exchange @@ fun msg f_MarketDataIncrementalRefreshMDEntries_MDMkt ->
    opt msg "336" parse_string @@ fun msg f_MarketDataIncrementalRefreshMDEntries_TradingSessionID ->
    opt msg "276" parse_QuoteCondition @@ fun msg f_MarketDataIncrementalRefreshMDEntries_QuoteCondition ->
    opt msg "277" parse_TradeCondition @@ fun msg f_MarketDataIncrementalRefreshMDEntries_TradeCondition ->
    opt msg "282" parse_string @@ fun msg f_MarketDataIncrementalRefreshMDEntries_MDEntryOriginator ->
    opt msg "283" parse_string @@ fun msg f_MarketDataIncrementalRefreshMDEntries_LocationID ->
    opt msg "284" parse_string @@ fun msg f_MarketDataIncrementalRefreshMDEntries_DeskID ->
    opt msg "286" parse_OpenCloseSettleFlag @@ fun msg f_MarketDataIncrementalRefreshMDEntries_OpenCloseSettleFlag ->
    opt msg "59" parse_TimeInForce @@ fun msg f_MarketDataIncrementalRefreshMDEntries_TimeInForce ->
    opt msg "432" parse_LocalMktDate @@ fun msg f_MarketDataIncrementalRefreshMDEntries_ExpireDate ->
    opt msg "126" parse_UTCTimestamp @@ fun msg f_MarketDataIncrementalRefreshMDEntries_ExpireTime ->
    opt msg "110" parse_float @@ fun msg f_MarketDataIncrementalRefreshMDEntries_MinQty ->
    opt msg "18" parse_ExecInst @@ fun msg f_MarketDataIncrementalRefreshMDEntries_ExecInst ->
    opt msg "287" parse_int @@ fun msg f_MarketDataIncrementalRefreshMDEntries_SellerDays ->
    opt msg "37" parse_string @@ fun msg f_MarketDataIncrementalRefreshMDEntries_OrderID ->
    opt msg "299" parse_string @@ fun msg f_MarketDataIncrementalRefreshMDEntries_QuoteEntryID ->
    opt msg "288" parse_string @@ fun msg f_MarketDataIncrementalRefreshMDEntries_MDEntryBuyer ->
    opt msg "289" parse_string @@ fun msg f_MarketDataIncrementalRefreshMDEntries_MDEntrySeller ->
    opt msg "346" parse_int @@ fun msg f_MarketDataIncrementalRefreshMDEntries_NumberOfOrders ->
    opt msg "290" parse_int @@ fun msg f_MarketDataIncrementalRefreshMDEntries_MDEntryPositionNo ->
    opt msg "387" parse_float @@ fun msg f_MarketDataIncrementalRefreshMDEntries_TotalVolumeTraded ->
    opt msg "58" parse_string @@ fun msg f_MarketDataIncrementalRefreshMDEntries_Text ->
    opt msg "354" parse_int @@ fun msg f_MarketDataIncrementalRefreshMDEntries_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_MarketDataIncrementalRefreshMDEntries_EncodedText ->
    ParseSuccess {
    f_MarketDataIncrementalRefreshMDEntries_NoMDEntries;
    f_MarketDataIncrementalRefreshMDEntries_MDUpdateAction;
    f_MarketDataIncrementalRefreshMDEntries_DeleteReason;
    f_MarketDataIncrementalRefreshMDEntries_MDEntryType;
    f_MarketDataIncrementalRefreshMDEntries_MDEntryID;
    f_MarketDataIncrementalRefreshMDEntries_MDEntryRefID;
    f_MarketDataIncrementalRefreshMDEntries_Symbol;
    f_MarketDataIncrementalRefreshMDEntries_SymbolSfx;
    f_MarketDataIncrementalRefreshMDEntries_SecurityID;
    f_MarketDataIncrementalRefreshMDEntries_IDSource;
    f_MarketDataIncrementalRefreshMDEntries_SecurityType;
    f_MarketDataIncrementalRefreshMDEntries_MaturityMonthYear;
    f_MarketDataIncrementalRefreshMDEntries_MaturityDay;
    f_MarketDataIncrementalRefreshMDEntries_PutOrCall;
    f_MarketDataIncrementalRefreshMDEntries_StrikePrice;
    f_MarketDataIncrementalRefreshMDEntries_OptAttribute;
    f_MarketDataIncrementalRefreshMDEntries_ContractMultiplier;
    f_MarketDataIncrementalRefreshMDEntries_CouponRate;
    f_MarketDataIncrementalRefreshMDEntries_SecurityExchange;
    f_MarketDataIncrementalRefreshMDEntries_Issuer;
    f_MarketDataIncrementalRefreshMDEntries_EncodedIssuerLen;
    f_MarketDataIncrementalRefreshMDEntries_EncodedIssuer;
    f_MarketDataIncrementalRefreshMDEntries_SecurityDesc;
    f_MarketDataIncrementalRefreshMDEntries_EncodedSecurityDescLen;
    f_MarketDataIncrementalRefreshMDEntries_EncodedSecurityDesc;
    f_MarketDataIncrementalRefreshMDEntries_FinancialStatus;
    f_MarketDataIncrementalRefreshMDEntries_CorporateAction;
    f_MarketDataIncrementalRefreshMDEntries_MDEntryPx;
    f_MarketDataIncrementalRefreshMDEntries_Currency;
    f_MarketDataIncrementalRefreshMDEntries_MDEntrySize;
    f_MarketDataIncrementalRefreshMDEntries_MDEntryDate;
    f_MarketDataIncrementalRefreshMDEntries_MDEntryTime;
    f_MarketDataIncrementalRefreshMDEntries_TickDirection;
    f_MarketDataIncrementalRefreshMDEntries_MDMkt;
    f_MarketDataIncrementalRefreshMDEntries_TradingSessionID;
    f_MarketDataIncrementalRefreshMDEntries_QuoteCondition;
    f_MarketDataIncrementalRefreshMDEntries_TradeCondition;
    f_MarketDataIncrementalRefreshMDEntries_MDEntryOriginator;
    f_MarketDataIncrementalRefreshMDEntries_LocationID;
    f_MarketDataIncrementalRefreshMDEntries_DeskID;
    f_MarketDataIncrementalRefreshMDEntries_OpenCloseSettleFlag;
    f_MarketDataIncrementalRefreshMDEntries_TimeInForce;
    f_MarketDataIncrementalRefreshMDEntries_ExpireDate;
    f_MarketDataIncrementalRefreshMDEntries_ExpireTime;
    f_MarketDataIncrementalRefreshMDEntries_MinQty;
    f_MarketDataIncrementalRefreshMDEntries_ExecInst;
    f_MarketDataIncrementalRefreshMDEntries_SellerDays;
    f_MarketDataIncrementalRefreshMDEntries_OrderID;
    f_MarketDataIncrementalRefreshMDEntries_QuoteEntryID;
    f_MarketDataIncrementalRefreshMDEntries_MDEntryBuyer;
    f_MarketDataIncrementalRefreshMDEntries_MDEntrySeller;
    f_MarketDataIncrementalRefreshMDEntries_NumberOfOrders;
    f_MarketDataIncrementalRefreshMDEntries_MDEntryPositionNo;
    f_MarketDataIncrementalRefreshMDEntries_TotalVolumeTraded;
    f_MarketDataIncrementalRefreshMDEntries_Text;
    f_MarketDataIncrementalRefreshMDEntries_EncodedTextLen;
    f_MarketDataIncrementalRefreshMDEntries_EncodedText;
    } , msg ) ;;

let parse_OrderSingleAllocs msg = (
    opt msg "78" parse_int @@ fun msg f_OrderSingleAllocs_NoAllocs ->
    opt msg "79" parse_string @@ fun msg f_OrderSingleAllocs_AllocAccount ->
    opt msg "80" parse_float @@ fun msg f_OrderSingleAllocs_AllocShares ->
    ParseSuccess {
    f_OrderSingleAllocs_NoAllocs;
    f_OrderSingleAllocs_AllocAccount;
    f_OrderSingleAllocs_AllocShares;
    } , msg ) ;;

let parse_SecurityDefinitionRelatedSym msg = (
    opt msg "146" parse_int @@ fun msg f_SecurityDefinitionRelatedSym_NoRelatedSym ->
    opt msg "311" parse_string @@ fun msg f_SecurityDefinitionRelatedSym_UnderlyingSymbol ->
    opt msg "312" parse_string @@ fun msg f_SecurityDefinitionRelatedSym_UnderlyingSymbolSfx ->
    opt msg "309" parse_string @@ fun msg f_SecurityDefinitionRelatedSym_UnderlyingSecurityID ->
    opt msg "305" parse_string @@ fun msg f_SecurityDefinitionRelatedSym_UnderlyingIDSource ->
    opt msg "310" parse_string @@ fun msg f_SecurityDefinitionRelatedSym_UnderlyingSecurityType ->
    opt msg "313" parse_MonthYear @@ fun msg f_SecurityDefinitionRelatedSym_UnderlyingMaturityMonthYear ->
    opt msg "314" parse_int @@ fun msg f_SecurityDefinitionRelatedSym_UnderlyingMaturityDay ->
    opt msg "315" parse_int @@ fun msg f_SecurityDefinitionRelatedSym_UnderlyingPutOrCall ->
    opt msg "316" parse_float @@ fun msg f_SecurityDefinitionRelatedSym_UnderlyingStrikePrice ->
    opt msg "317" parse_char @@ fun msg f_SecurityDefinitionRelatedSym_UnderlyingOptAttribute ->
    opt msg "436" parse_float @@ fun msg f_SecurityDefinitionRelatedSym_UnderlyingContractMultiplier ->
    opt msg "435" parse_float @@ fun msg f_SecurityDefinitionRelatedSym_UnderlyingCouponRate ->
    opt msg "308" parse_Exchange @@ fun msg f_SecurityDefinitionRelatedSym_UnderlyingSecurityExchange ->
    opt msg "306" parse_string @@ fun msg f_SecurityDefinitionRelatedSym_UnderlyingIssuer ->
    opt msg "362" parse_int @@ fun msg f_SecurityDefinitionRelatedSym_EncodedUnderlyingIssuerLen ->
    opt msg "363" parse_string @@ fun msg f_SecurityDefinitionRelatedSym_EncodedUnderlyingIssuer ->
    opt msg "307" parse_string @@ fun msg f_SecurityDefinitionRelatedSym_UnderlyingSecurityDesc ->
    opt msg "364" parse_int @@ fun msg f_SecurityDefinitionRelatedSym_EncodedUnderlyingSecurityDescLen ->
    opt msg "365" parse_string @@ fun msg f_SecurityDefinitionRelatedSym_EncodedUnderlyingSecurityDesc ->
    opt msg "319" parse_float @@ fun msg f_SecurityDefinitionRelatedSym_RatioQty ->
    opt msg "54" parse_Side @@ fun msg f_SecurityDefinitionRelatedSym_Side ->
    opt msg "318" parse_Currency @@ fun msg f_SecurityDefinitionRelatedSym_UnderlyingCurrency ->
    ParseSuccess {
    f_SecurityDefinitionRelatedSym_NoRelatedSym;
    f_SecurityDefinitionRelatedSym_UnderlyingSymbol;
    f_SecurityDefinitionRelatedSym_UnderlyingSymbolSfx;
    f_SecurityDefinitionRelatedSym_UnderlyingSecurityID;
    f_SecurityDefinitionRelatedSym_UnderlyingIDSource;
    f_SecurityDefinitionRelatedSym_UnderlyingSecurityType;
    f_SecurityDefinitionRelatedSym_UnderlyingMaturityMonthYear;
    f_SecurityDefinitionRelatedSym_UnderlyingMaturityDay;
    f_SecurityDefinitionRelatedSym_UnderlyingPutOrCall;
    f_SecurityDefinitionRelatedSym_UnderlyingStrikePrice;
    f_SecurityDefinitionRelatedSym_UnderlyingOptAttribute;
    f_SecurityDefinitionRelatedSym_UnderlyingContractMultiplier;
    f_SecurityDefinitionRelatedSym_UnderlyingCouponRate;
    f_SecurityDefinitionRelatedSym_UnderlyingSecurityExchange;
    f_SecurityDefinitionRelatedSym_UnderlyingIssuer;
    f_SecurityDefinitionRelatedSym_EncodedUnderlyingIssuerLen;
    f_SecurityDefinitionRelatedSym_EncodedUnderlyingIssuer;
    f_SecurityDefinitionRelatedSym_UnderlyingSecurityDesc;
    f_SecurityDefinitionRelatedSym_EncodedUnderlyingSecurityDescLen;
    f_SecurityDefinitionRelatedSym_EncodedUnderlyingSecurityDesc;
    f_SecurityDefinitionRelatedSym_RatioQty;
    f_SecurityDefinitionRelatedSym_Side;
    f_SecurityDefinitionRelatedSym_UnderlyingCurrency;
    } , msg ) ;;

let parse_BidRequestBidComponents msg = (
    opt msg "420" parse_int @@ fun msg f_BidRequestBidComponents_NoBidComponents ->
    opt msg "66" parse_string @@ fun msg f_BidRequestBidComponents_ListID ->
    opt msg "54" parse_Side @@ fun msg f_BidRequestBidComponents_Side ->
    opt msg "336" parse_string @@ fun msg f_BidRequestBidComponents_TradingSessionID ->
    opt msg "430" parse_NetGrossInd @@ fun msg f_BidRequestBidComponents_NetGrossInd ->
    opt msg "63" parse_SettlmntTyp @@ fun msg f_BidRequestBidComponents_SettlmntTyp ->
    opt msg "64" parse_LocalMktDate @@ fun msg f_BidRequestBidComponents_FutSettDate ->
    opt msg "1" parse_string @@ fun msg f_BidRequestBidComponents_Account ->
    ParseSuccess {
    f_BidRequestBidComponents_NoBidComponents;
    f_BidRequestBidComponents_ListID;
    f_BidRequestBidComponents_Side;
    f_BidRequestBidComponents_TradingSessionID;
    f_BidRequestBidComponents_NetGrossInd;
    f_BidRequestBidComponents_SettlmntTyp;
    f_BidRequestBidComponents_FutSettDate;
    f_BidRequestBidComponents_Account;
    } , msg ) ;;

let parse_AllocationOrders msg = (
    opt msg "73" parse_int @@ fun msg f_AllocationOrders_NoOrders ->
    opt msg "11" parse_string @@ fun msg f_AllocationOrders_ClOrdID ->
    opt msg "37" parse_string @@ fun msg f_AllocationOrders_OrderID ->
    opt msg "198" parse_string @@ fun msg f_AllocationOrders_SecondaryOrderID ->
    opt msg "66" parse_string @@ fun msg f_AllocationOrders_ListID ->
    opt msg "105" parse_string @@ fun msg f_AllocationOrders_WaveNo ->
    ParseSuccess {
    f_AllocationOrders_NoOrders;
    f_AllocationOrders_ClOrdID;
    f_AllocationOrders_OrderID;
    f_AllocationOrders_SecondaryOrderID;
    f_AllocationOrders_ListID;
    f_AllocationOrders_WaveNo;
    } , msg ) ;;

let parse_OrderListOrders msg = (
    req msg "73" parse_int @@ fun msg f_OrderListOrders_NoOrders ->
    req msg "11" parse_string @@ fun msg f_OrderListOrders_ClOrdID ->
    req msg "67" parse_int @@ fun msg f_OrderListOrders_ListSeqNo ->
    opt msg "160" parse_SettlInstMode @@ fun msg f_OrderListOrders_SettlInstMode ->
    opt msg "109" parse_string @@ fun msg f_OrderListOrders_ClientID ->
    opt msg "76" parse_string @@ fun msg f_OrderListOrders_ExecBroker ->
    opt msg "1" parse_string @@ fun msg f_OrderListOrders_Account ->
    opt msg "63" parse_SettlmntTyp @@ fun msg f_OrderListOrders_SettlmntTyp ->
    opt msg "64" parse_LocalMktDate @@ fun msg f_OrderListOrders_FutSettDate ->
    opt msg "21" parse_HandlInst @@ fun msg f_OrderListOrders_HandlInst ->
    opt msg "18" parse_ExecInst @@ fun msg f_OrderListOrders_ExecInst ->
    opt msg "110" parse_float @@ fun msg f_OrderListOrders_MinQty ->
    opt msg "111" parse_float @@ fun msg f_OrderListOrders_MaxFloor ->
    opt msg "100" parse_Exchange @@ fun msg f_OrderListOrders_ExDestination ->
    opt msg "81" parse_ProcessCode @@ fun msg f_OrderListOrders_ProcessCode ->
    req msg "55" parse_string @@ fun msg f_OrderListOrders_Symbol ->
    opt msg "65" parse_string @@ fun msg f_OrderListOrders_SymbolSfx ->
    opt msg "48" parse_string @@ fun msg f_OrderListOrders_SecurityID ->
    opt msg "22" parse_IDSource @@ fun msg f_OrderListOrders_IDSource ->
    opt msg "167" parse_SecurityType @@ fun msg f_OrderListOrders_SecurityType ->
    opt msg "200" parse_MonthYear @@ fun msg f_OrderListOrders_MaturityMonthYear ->
    opt msg "205" parse_int @@ fun msg f_OrderListOrders_MaturityDay ->
    opt msg "201" parse_PutOrCall @@ fun msg f_OrderListOrders_PutOrCall ->
    opt msg "202" parse_float @@ fun msg f_OrderListOrders_StrikePrice ->
    opt msg "206" parse_char @@ fun msg f_OrderListOrders_OptAttribute ->
    opt msg "231" parse_float @@ fun msg f_OrderListOrders_ContractMultiplier ->
    opt msg "223" parse_float @@ fun msg f_OrderListOrders_CouponRate ->
    opt msg "207" parse_Exchange @@ fun msg f_OrderListOrders_SecurityExchange ->
    opt msg "106" parse_string @@ fun msg f_OrderListOrders_Issuer ->
    opt msg "348" parse_int @@ fun msg f_OrderListOrders_EncodedIssuerLen ->
    opt msg "349" parse_string @@ fun msg f_OrderListOrders_EncodedIssuer ->
    opt msg "107" parse_string @@ fun msg f_OrderListOrders_SecurityDesc ->
    opt msg "350" parse_int @@ fun msg f_OrderListOrders_EncodedSecurityDescLen ->
    opt msg "351" parse_string @@ fun msg f_OrderListOrders_EncodedSecurityDesc ->
    opt msg "140" parse_float @@ fun msg f_OrderListOrders_PrevClosePx ->
    req msg "54" parse_Side @@ fun msg f_OrderListOrders_Side ->
    opt msg "401" parse_int @@ fun msg f_OrderListOrders_SideValueInd ->
    opt msg "114" parse_LocateReqd @@ fun msg f_OrderListOrders_LocateReqd ->
    opt msg "60" parse_UTCTimestamp @@ fun msg f_OrderListOrders_TransactTime ->
    opt msg "38" parse_float @@ fun msg f_OrderListOrders_OrderQty ->
    opt msg "152" parse_float @@ fun msg f_OrderListOrders_CashOrderQty ->
    opt msg "40" parse_OrdType @@ fun msg f_OrderListOrders_OrdType ->
    opt msg "44" parse_float @@ fun msg f_OrderListOrders_Price ->
    opt msg "99" parse_float @@ fun msg f_OrderListOrders_StopPx ->
    opt msg "15" parse_Currency @@ fun msg f_OrderListOrders_Currency ->
    opt msg "376" parse_string @@ fun msg f_OrderListOrders_ComplianceID ->
    opt msg "377" parse_SolicitedFlag @@ fun msg f_OrderListOrders_SolicitedFlag ->
    opt msg "23" parse_string @@ fun msg f_OrderListOrders_IOIid ->
    opt msg "117" parse_string @@ fun msg f_OrderListOrders_QuoteID ->
    opt msg "59" parse_TimeInForce @@ fun msg f_OrderListOrders_TimeInForce ->
    opt msg "168" parse_UTCTimestamp @@ fun msg f_OrderListOrders_EffectiveTime ->
    opt msg "432" parse_LocalMktDate @@ fun msg f_OrderListOrders_ExpireDate ->
    opt msg "126" parse_UTCTimestamp @@ fun msg f_OrderListOrders_ExpireTime ->
    opt msg "427" parse_GTBookingInst @@ fun msg f_OrderListOrders_GTBookingInst ->
    opt msg "12" parse_float @@ fun msg f_OrderListOrders_Commission ->
    opt msg "13" parse_CommType @@ fun msg f_OrderListOrders_CommType ->
    opt msg "47" parse_Rule80A @@ fun msg f_OrderListOrders_Rule80A ->
    opt msg "121" parse_ForexReq @@ fun msg f_OrderListOrders_ForexReq ->
    opt msg "120" parse_Currency @@ fun msg f_OrderListOrders_SettlCurrency ->
    opt msg "58" parse_string @@ fun msg f_OrderListOrders_Text ->
    opt msg "354" parse_int @@ fun msg f_OrderListOrders_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_OrderListOrders_EncodedText ->
    opt msg "193" parse_LocalMktDate @@ fun msg f_OrderListOrders_FutSettDate2 ->
    opt msg "192" parse_float @@ fun msg f_OrderListOrders_OrderQty2 ->
    opt msg "77" parse_OpenClose @@ fun msg f_OrderListOrders_OpenClose ->
    opt msg "203" parse_CoveredOrUncovered @@ fun msg f_OrderListOrders_CoveredOrUncovered ->
    opt msg "204" parse_CustomerOrFirm @@ fun msg f_OrderListOrders_CustomerOrFirm ->
    opt msg "210" parse_float @@ fun msg f_OrderListOrders_MaxShow ->
    opt msg "211" parse_float @@ fun msg f_OrderListOrders_PegDifference ->
    opt msg "388" parse_DiscretionInst @@ fun msg f_OrderListOrders_DiscretionInst ->
    opt msg "389" parse_float @@ fun msg f_OrderListOrders_DiscretionOffset ->
    opt msg "439" parse_string @@ fun msg f_OrderListOrders_ClearingFirm ->
    opt msg "440" parse_string @@ fun msg f_OrderListOrders_ClearingAccount ->
    ParseSuccess {
    f_OrderListOrders_NoOrders;
    f_OrderListOrders_ClOrdID;
    f_OrderListOrders_ListSeqNo;
    f_OrderListOrders_SettlInstMode;
    f_OrderListOrders_ClientID;
    f_OrderListOrders_ExecBroker;
    f_OrderListOrders_Account;
    f_OrderListOrders_SettlmntTyp;
    f_OrderListOrders_FutSettDate;
    f_OrderListOrders_HandlInst;
    f_OrderListOrders_ExecInst;
    f_OrderListOrders_MinQty;
    f_OrderListOrders_MaxFloor;
    f_OrderListOrders_ExDestination;
    f_OrderListOrders_ProcessCode;
    f_OrderListOrders_Symbol;
    f_OrderListOrders_SymbolSfx;
    f_OrderListOrders_SecurityID;
    f_OrderListOrders_IDSource;
    f_OrderListOrders_SecurityType;
    f_OrderListOrders_MaturityMonthYear;
    f_OrderListOrders_MaturityDay;
    f_OrderListOrders_PutOrCall;
    f_OrderListOrders_StrikePrice;
    f_OrderListOrders_OptAttribute;
    f_OrderListOrders_ContractMultiplier;
    f_OrderListOrders_CouponRate;
    f_OrderListOrders_SecurityExchange;
    f_OrderListOrders_Issuer;
    f_OrderListOrders_EncodedIssuerLen;
    f_OrderListOrders_EncodedIssuer;
    f_OrderListOrders_SecurityDesc;
    f_OrderListOrders_EncodedSecurityDescLen;
    f_OrderListOrders_EncodedSecurityDesc;
    f_OrderListOrders_PrevClosePx;
    f_OrderListOrders_Side;
    f_OrderListOrders_SideValueInd;
    f_OrderListOrders_LocateReqd;
    f_OrderListOrders_TransactTime;
    f_OrderListOrders_OrderQty;
    f_OrderListOrders_CashOrderQty;
    f_OrderListOrders_OrdType;
    f_OrderListOrders_Price;
    f_OrderListOrders_StopPx;
    f_OrderListOrders_Currency;
    f_OrderListOrders_ComplianceID;
    f_OrderListOrders_SolicitedFlag;
    f_OrderListOrders_IOIid;
    f_OrderListOrders_QuoteID;
    f_OrderListOrders_TimeInForce;
    f_OrderListOrders_EffectiveTime;
    f_OrderListOrders_ExpireDate;
    f_OrderListOrders_ExpireTime;
    f_OrderListOrders_GTBookingInst;
    f_OrderListOrders_Commission;
    f_OrderListOrders_CommType;
    f_OrderListOrders_Rule80A;
    f_OrderListOrders_ForexReq;
    f_OrderListOrders_SettlCurrency;
    f_OrderListOrders_Text;
    f_OrderListOrders_EncodedTextLen;
    f_OrderListOrders_EncodedText;
    f_OrderListOrders_FutSettDate2;
    f_OrderListOrders_OrderQty2;
    f_OrderListOrders_OpenClose;
    f_OrderListOrders_CoveredOrUncovered;
    f_OrderListOrders_CustomerOrFirm;
    f_OrderListOrders_MaxShow;
    f_OrderListOrders_PegDifference;
    f_OrderListOrders_DiscretionInst;
    f_OrderListOrders_DiscretionOffset;
    f_OrderListOrders_ClearingFirm;
    f_OrderListOrders_ClearingAccount;
    } , msg ) ;;

let parse_IOIIOIQualifiers msg = (
    opt msg "199" parse_int @@ fun msg f_IOIIOIQualifiers_NoIOIQualifiers ->
    opt msg "104" parse_IOIQualifier @@ fun msg f_IOIIOIQualifiers_IOIQualifier ->
    ParseSuccess {
    f_IOIIOIQualifiers_NoIOIQualifiers;
    f_IOIIOIQualifiers_IOIQualifier;
    } , msg ) ;;

let parse_MarketDataSnapshotFullRefreshMDEntries msg = (
    req msg "268" parse_int @@ fun msg f_MarketDataSnapshotFullRefreshMDEntries_NoMDEntries ->
    req msg "269" parse_MDEntryType @@ fun msg f_MarketDataSnapshotFullRefreshMDEntries_MDEntryType ->
    req msg "270" parse_float @@ fun msg f_MarketDataSnapshotFullRefreshMDEntries_MDEntryPx ->
    opt msg "15" parse_Currency @@ fun msg f_MarketDataSnapshotFullRefreshMDEntries_Currency ->
    opt msg "271" parse_float @@ fun msg f_MarketDataSnapshotFullRefreshMDEntries_MDEntrySize ->
    opt msg "272" parse_UTCDateOnly @@ fun msg f_MarketDataSnapshotFullRefreshMDEntries_MDEntryDate ->
    opt msg "273" parse_UTCTimeOnly @@ fun msg f_MarketDataSnapshotFullRefreshMDEntries_MDEntryTime ->
    opt msg "274" parse_TickDirection @@ fun msg f_MarketDataSnapshotFullRefreshMDEntries_TickDirection ->
    opt msg "275" parse_Exchange @@ fun msg f_MarketDataSnapshotFullRefreshMDEntries_MDMkt ->
    opt msg "336" parse_string @@ fun msg f_MarketDataSnapshotFullRefreshMDEntries_TradingSessionID ->
    opt msg "276" parse_QuoteCondition @@ fun msg f_MarketDataSnapshotFullRefreshMDEntries_QuoteCondition ->
    opt msg "277" parse_TradeCondition @@ fun msg f_MarketDataSnapshotFullRefreshMDEntries_TradeCondition ->
    opt msg "282" parse_string @@ fun msg f_MarketDataSnapshotFullRefreshMDEntries_MDEntryOriginator ->
    opt msg "283" parse_string @@ fun msg f_MarketDataSnapshotFullRefreshMDEntries_LocationID ->
    opt msg "284" parse_string @@ fun msg f_MarketDataSnapshotFullRefreshMDEntries_DeskID ->
    opt msg "286" parse_OpenCloseSettleFlag @@ fun msg f_MarketDataSnapshotFullRefreshMDEntries_OpenCloseSettleFlag ->
    opt msg "59" parse_TimeInForce @@ fun msg f_MarketDataSnapshotFullRefreshMDEntries_TimeInForce ->
    opt msg "432" parse_LocalMktDate @@ fun msg f_MarketDataSnapshotFullRefreshMDEntries_ExpireDate ->
    opt msg "126" parse_UTCTimestamp @@ fun msg f_MarketDataSnapshotFullRefreshMDEntries_ExpireTime ->
    opt msg "110" parse_float @@ fun msg f_MarketDataSnapshotFullRefreshMDEntries_MinQty ->
    opt msg "18" parse_ExecInst @@ fun msg f_MarketDataSnapshotFullRefreshMDEntries_ExecInst ->
    opt msg "287" parse_int @@ fun msg f_MarketDataSnapshotFullRefreshMDEntries_SellerDays ->
    opt msg "37" parse_string @@ fun msg f_MarketDataSnapshotFullRefreshMDEntries_OrderID ->
    opt msg "299" parse_string @@ fun msg f_MarketDataSnapshotFullRefreshMDEntries_QuoteEntryID ->
    opt msg "288" parse_string @@ fun msg f_MarketDataSnapshotFullRefreshMDEntries_MDEntryBuyer ->
    opt msg "289" parse_string @@ fun msg f_MarketDataSnapshotFullRefreshMDEntries_MDEntrySeller ->
    opt msg "346" parse_int @@ fun msg f_MarketDataSnapshotFullRefreshMDEntries_NumberOfOrders ->
    opt msg "290" parse_int @@ fun msg f_MarketDataSnapshotFullRefreshMDEntries_MDEntryPositionNo ->
    opt msg "58" parse_string @@ fun msg f_MarketDataSnapshotFullRefreshMDEntries_Text ->
    opt msg "354" parse_int @@ fun msg f_MarketDataSnapshotFullRefreshMDEntries_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_MarketDataSnapshotFullRefreshMDEntries_EncodedText ->
    ParseSuccess {
    f_MarketDataSnapshotFullRefreshMDEntries_NoMDEntries;
    f_MarketDataSnapshotFullRefreshMDEntries_MDEntryType;
    f_MarketDataSnapshotFullRefreshMDEntries_MDEntryPx;
    f_MarketDataSnapshotFullRefreshMDEntries_Currency;
    f_MarketDataSnapshotFullRefreshMDEntries_MDEntrySize;
    f_MarketDataSnapshotFullRefreshMDEntries_MDEntryDate;
    f_MarketDataSnapshotFullRefreshMDEntries_MDEntryTime;
    f_MarketDataSnapshotFullRefreshMDEntries_TickDirection;
    f_MarketDataSnapshotFullRefreshMDEntries_MDMkt;
    f_MarketDataSnapshotFullRefreshMDEntries_TradingSessionID;
    f_MarketDataSnapshotFullRefreshMDEntries_QuoteCondition;
    f_MarketDataSnapshotFullRefreshMDEntries_TradeCondition;
    f_MarketDataSnapshotFullRefreshMDEntries_MDEntryOriginator;
    f_MarketDataSnapshotFullRefreshMDEntries_LocationID;
    f_MarketDataSnapshotFullRefreshMDEntries_DeskID;
    f_MarketDataSnapshotFullRefreshMDEntries_OpenCloseSettleFlag;
    f_MarketDataSnapshotFullRefreshMDEntries_TimeInForce;
    f_MarketDataSnapshotFullRefreshMDEntries_ExpireDate;
    f_MarketDataSnapshotFullRefreshMDEntries_ExpireTime;
    f_MarketDataSnapshotFullRefreshMDEntries_MinQty;
    f_MarketDataSnapshotFullRefreshMDEntries_ExecInst;
    f_MarketDataSnapshotFullRefreshMDEntries_SellerDays;
    f_MarketDataSnapshotFullRefreshMDEntries_OrderID;
    f_MarketDataSnapshotFullRefreshMDEntries_QuoteEntryID;
    f_MarketDataSnapshotFullRefreshMDEntries_MDEntryBuyer;
    f_MarketDataSnapshotFullRefreshMDEntries_MDEntrySeller;
    f_MarketDataSnapshotFullRefreshMDEntries_NumberOfOrders;
    f_MarketDataSnapshotFullRefreshMDEntries_MDEntryPositionNo;
    f_MarketDataSnapshotFullRefreshMDEntries_Text;
    f_MarketDataSnapshotFullRefreshMDEntries_EncodedTextLen;
    f_MarketDataSnapshotFullRefreshMDEntries_EncodedText;
    } , msg ) ;;

let parse_EmailRelatedSym msg = (
    opt msg "146" parse_int @@ fun msg f_EmailRelatedSym_NoRelatedSym ->
    opt msg "46" parse_string @@ fun msg f_EmailRelatedSym_RelatdSym ->
    opt msg "65" parse_string @@ fun msg f_EmailRelatedSym_SymbolSfx ->
    opt msg "48" parse_string @@ fun msg f_EmailRelatedSym_SecurityID ->
    opt msg "22" parse_IDSource @@ fun msg f_EmailRelatedSym_IDSource ->
    opt msg "167" parse_SecurityType @@ fun msg f_EmailRelatedSym_SecurityType ->
    opt msg "200" parse_MonthYear @@ fun msg f_EmailRelatedSym_MaturityMonthYear ->
    opt msg "205" parse_int @@ fun msg f_EmailRelatedSym_MaturityDay ->
    opt msg "201" parse_PutOrCall @@ fun msg f_EmailRelatedSym_PutOrCall ->
    opt msg "202" parse_float @@ fun msg f_EmailRelatedSym_StrikePrice ->
    opt msg "206" parse_char @@ fun msg f_EmailRelatedSym_OptAttribute ->
    opt msg "231" parse_float @@ fun msg f_EmailRelatedSym_ContractMultiplier ->
    opt msg "223" parse_float @@ fun msg f_EmailRelatedSym_CouponRate ->
    opt msg "207" parse_Exchange @@ fun msg f_EmailRelatedSym_SecurityExchange ->
    opt msg "106" parse_string @@ fun msg f_EmailRelatedSym_Issuer ->
    opt msg "348" parse_int @@ fun msg f_EmailRelatedSym_EncodedIssuerLen ->
    opt msg "349" parse_string @@ fun msg f_EmailRelatedSym_EncodedIssuer ->
    opt msg "107" parse_string @@ fun msg f_EmailRelatedSym_SecurityDesc ->
    opt msg "350" parse_int @@ fun msg f_EmailRelatedSym_EncodedSecurityDescLen ->
    opt msg "351" parse_string @@ fun msg f_EmailRelatedSym_EncodedSecurityDesc ->
    ParseSuccess {
    f_EmailRelatedSym_NoRelatedSym;
    f_EmailRelatedSym_RelatdSym;
    f_EmailRelatedSym_SymbolSfx;
    f_EmailRelatedSym_SecurityID;
    f_EmailRelatedSym_IDSource;
    f_EmailRelatedSym_SecurityType;
    f_EmailRelatedSym_MaturityMonthYear;
    f_EmailRelatedSym_MaturityDay;
    f_EmailRelatedSym_PutOrCall;
    f_EmailRelatedSym_StrikePrice;
    f_EmailRelatedSym_OptAttribute;
    f_EmailRelatedSym_ContractMultiplier;
    f_EmailRelatedSym_CouponRate;
    f_EmailRelatedSym_SecurityExchange;
    f_EmailRelatedSym_Issuer;
    f_EmailRelatedSym_EncodedIssuerLen;
    f_EmailRelatedSym_EncodedIssuer;
    f_EmailRelatedSym_SecurityDesc;
    f_EmailRelatedSym_EncodedSecurityDescLen;
    f_EmailRelatedSym_EncodedSecurityDesc;
    } , msg ) ;;

let parse_AllocationExecs msg = (
    opt msg "124" parse_int @@ fun msg f_AllocationExecs_NoExecs ->
    opt msg "32" parse_float @@ fun msg f_AllocationExecs_LastShares ->
    opt msg "17" parse_string @@ fun msg f_AllocationExecs_ExecID ->
    opt msg "31" parse_float @@ fun msg f_AllocationExecs_LastPx ->
    opt msg "29" parse_LastCapacity @@ fun msg f_AllocationExecs_LastCapacity ->
    ParseSuccess {
    f_AllocationExecs_NoExecs;
    f_AllocationExecs_LastShares;
    f_AllocationExecs_ExecID;
    f_AllocationExecs_LastPx;
    f_AllocationExecs_LastCapacity;
    } , msg ) ;;

let parse_EmailRoutingIDs msg = (
    opt msg "215" parse_int @@ fun msg f_EmailRoutingIDs_NoRoutingIDs ->
    opt msg "216" parse_RoutingType @@ fun msg f_EmailRoutingIDs_RoutingType ->
    opt msg "217" parse_string @@ fun msg f_EmailRoutingIDs_RoutingID ->
    ParseSuccess {
    f_EmailRoutingIDs_NoRoutingIDs;
    f_EmailRoutingIDs_RoutingType;
    f_EmailRoutingIDs_RoutingID;
    } , msg ) ;;

let parse_MarketDataRequestMDEntryTypes msg = (
    req msg "267" parse_int @@ fun msg f_MarketDataRequestMDEntryTypes_NoMDEntryTypes ->
    req msg "269" parse_MDEntryType @@ fun msg f_MarketDataRequestMDEntryTypes_MDEntryType ->
    ParseSuccess {
    f_MarketDataRequestMDEntryTypes_NoMDEntryTypes;
    f_MarketDataRequestMDEntryTypes_MDEntryType;
    } , msg ) ;;

let parse_OrderCancelReplaceRequestAllocs msg = (
    opt msg "78" parse_int @@ fun msg f_OrderCancelReplaceRequestAllocs_NoAllocs ->
    opt msg "79" parse_string @@ fun msg f_OrderCancelReplaceRequestAllocs_AllocAccount ->
    opt msg "80" parse_float @@ fun msg f_OrderCancelReplaceRequestAllocs_AllocShares ->
    ParseSuccess {
    f_OrderCancelReplaceRequestAllocs_NoAllocs;
    f_OrderCancelReplaceRequestAllocs_AllocAccount;
    f_OrderCancelReplaceRequestAllocs_AllocShares;
    } , msg ) ;;

let parse_AllocationAllocs msg = (
    opt msg "78" parse_int @@ fun msg f_AllocationAllocs_NoAllocs ->
    opt msg "79" parse_string @@ fun msg f_AllocationAllocs_AllocAccount ->
    opt msg "366" parse_float @@ fun msg f_AllocationAllocs_AllocPrice ->
    req msg "80" parse_float @@ fun msg f_AllocationAllocs_AllocShares ->
    opt msg "81" parse_ProcessCode @@ fun msg f_AllocationAllocs_ProcessCode ->
    opt msg "92" parse_string @@ fun msg f_AllocationAllocs_BrokerOfCredit ->
    opt msg "208" parse_NotifyBrokerOfCredit @@ fun msg f_AllocationAllocs_NotifyBrokerOfCredit ->
    opt msg "209" parse_AllocHandlInst @@ fun msg f_AllocationAllocs_AllocHandlInst ->
    opt msg "161" parse_string @@ fun msg f_AllocationAllocs_AllocText ->
    opt msg "360" parse_int @@ fun msg f_AllocationAllocs_EncodedAllocTextLen ->
    opt msg "361" parse_string @@ fun msg f_AllocationAllocs_EncodedAllocText ->
    opt msg "76" parse_string @@ fun msg f_AllocationAllocs_ExecBroker ->
    opt msg "109" parse_string @@ fun msg f_AllocationAllocs_ClientID ->
    opt msg "12" parse_float @@ fun msg f_AllocationAllocs_Commission ->
    opt msg "13" parse_CommType @@ fun msg f_AllocationAllocs_CommType ->
    opt msg "153" parse_float @@ fun msg f_AllocationAllocs_AllocAvgPx ->
    opt msg "154" parse_float @@ fun msg f_AllocationAllocs_AllocNetMoney ->
    opt msg "119" parse_float @@ fun msg f_AllocationAllocs_SettlCurrAmt ->
    opt msg "120" parse_Currency @@ fun msg f_AllocationAllocs_SettlCurrency ->
    opt msg "155" parse_float @@ fun msg f_AllocationAllocs_SettlCurrFxRate ->
    opt msg "156" parse_char @@ fun msg f_AllocationAllocs_SettlCurrFxRateCalc ->
    opt msg "159" parse_float @@ fun msg f_AllocationAllocs_AccruedInterestAmt ->
    opt msg "160" parse_SettlInstMode @@ fun msg f_AllocationAllocs_SettlInstMode ->
    ParseSuccess {
    f_AllocationAllocs_NoAllocs;
    f_AllocationAllocs_AllocAccount;
    f_AllocationAllocs_AllocPrice;
    f_AllocationAllocs_AllocShares;
    f_AllocationAllocs_ProcessCode;
    f_AllocationAllocs_BrokerOfCredit;
    f_AllocationAllocs_NotifyBrokerOfCredit;
    f_AllocationAllocs_AllocHandlInst;
    f_AllocationAllocs_AllocText;
    f_AllocationAllocs_EncodedAllocTextLen;
    f_AllocationAllocs_EncodedAllocText;
    f_AllocationAllocs_ExecBroker;
    f_AllocationAllocs_ClientID;
    f_AllocationAllocs_Commission;
    f_AllocationAllocs_CommType;
    f_AllocationAllocs_AllocAvgPx;
    f_AllocationAllocs_AllocNetMoney;
    f_AllocationAllocs_SettlCurrAmt;
    f_AllocationAllocs_SettlCurrency;
    f_AllocationAllocs_SettlCurrFxRate;
    f_AllocationAllocs_SettlCurrFxRateCalc;
    f_AllocationAllocs_AccruedInterestAmt;
    f_AllocationAllocs_SettlInstMode;
    } , msg ) ;;

let parse_NewsRelatedSym msg = (
    opt msg "146" parse_int @@ fun msg f_NewsRelatedSym_NoRelatedSym ->
    opt msg "46" parse_string @@ fun msg f_NewsRelatedSym_RelatdSym ->
    opt msg "65" parse_string @@ fun msg f_NewsRelatedSym_SymbolSfx ->
    opt msg "48" parse_string @@ fun msg f_NewsRelatedSym_SecurityID ->
    opt msg "22" parse_IDSource @@ fun msg f_NewsRelatedSym_IDSource ->
    opt msg "167" parse_SecurityType @@ fun msg f_NewsRelatedSym_SecurityType ->
    opt msg "200" parse_MonthYear @@ fun msg f_NewsRelatedSym_MaturityMonthYear ->
    opt msg "205" parse_int @@ fun msg f_NewsRelatedSym_MaturityDay ->
    opt msg "201" parse_PutOrCall @@ fun msg f_NewsRelatedSym_PutOrCall ->
    opt msg "202" parse_float @@ fun msg f_NewsRelatedSym_StrikePrice ->
    opt msg "206" parse_char @@ fun msg f_NewsRelatedSym_OptAttribute ->
    opt msg "231" parse_float @@ fun msg f_NewsRelatedSym_ContractMultiplier ->
    opt msg "223" parse_float @@ fun msg f_NewsRelatedSym_CouponRate ->
    opt msg "207" parse_Exchange @@ fun msg f_NewsRelatedSym_SecurityExchange ->
    opt msg "106" parse_string @@ fun msg f_NewsRelatedSym_Issuer ->
    opt msg "348" parse_int @@ fun msg f_NewsRelatedSym_EncodedIssuerLen ->
    opt msg "349" parse_string @@ fun msg f_NewsRelatedSym_EncodedIssuer ->
    opt msg "107" parse_string @@ fun msg f_NewsRelatedSym_SecurityDesc ->
    opt msg "350" parse_int @@ fun msg f_NewsRelatedSym_EncodedSecurityDescLen ->
    opt msg "351" parse_string @@ fun msg f_NewsRelatedSym_EncodedSecurityDesc ->
    ParseSuccess {
    f_NewsRelatedSym_NoRelatedSym;
    f_NewsRelatedSym_RelatdSym;
    f_NewsRelatedSym_SymbolSfx;
    f_NewsRelatedSym_SecurityID;
    f_NewsRelatedSym_IDSource;
    f_NewsRelatedSym_SecurityType;
    f_NewsRelatedSym_MaturityMonthYear;
    f_NewsRelatedSym_MaturityDay;
    f_NewsRelatedSym_PutOrCall;
    f_NewsRelatedSym_StrikePrice;
    f_NewsRelatedSym_OptAttribute;
    f_NewsRelatedSym_ContractMultiplier;
    f_NewsRelatedSym_CouponRate;
    f_NewsRelatedSym_SecurityExchange;
    f_NewsRelatedSym_Issuer;
    f_NewsRelatedSym_EncodedIssuerLen;
    f_NewsRelatedSym_EncodedIssuer;
    f_NewsRelatedSym_SecurityDesc;
    f_NewsRelatedSym_EncodedSecurityDescLen;
    f_NewsRelatedSym_EncodedSecurityDesc;
    } , msg ) ;;

let parse_OrderListTradingSessions msg = (
    opt msg "386" parse_int @@ fun msg f_OrderListTradingSessions_NoTradingSessions ->
    opt msg "336" parse_string @@ fun msg f_OrderListTradingSessions_TradingSessionID ->
    ParseSuccess {
    f_OrderListTradingSessions_NoTradingSessions;
    f_OrderListTradingSessions_TradingSessionID;
    } , msg ) ;;

let parse_MarketDataRequestRelatedSym msg = (
    req msg "146" parse_int @@ fun msg f_MarketDataRequestRelatedSym_NoRelatedSym ->
    req msg "55" parse_string @@ fun msg f_MarketDataRequestRelatedSym_Symbol ->
    opt msg "65" parse_string @@ fun msg f_MarketDataRequestRelatedSym_SymbolSfx ->
    opt msg "48" parse_string @@ fun msg f_MarketDataRequestRelatedSym_SecurityID ->
    opt msg "22" parse_IDSource @@ fun msg f_MarketDataRequestRelatedSym_IDSource ->
    opt msg "167" parse_SecurityType @@ fun msg f_MarketDataRequestRelatedSym_SecurityType ->
    opt msg "200" parse_MonthYear @@ fun msg f_MarketDataRequestRelatedSym_MaturityMonthYear ->
    opt msg "205" parse_int @@ fun msg f_MarketDataRequestRelatedSym_MaturityDay ->
    opt msg "201" parse_PutOrCall @@ fun msg f_MarketDataRequestRelatedSym_PutOrCall ->
    opt msg "202" parse_float @@ fun msg f_MarketDataRequestRelatedSym_StrikePrice ->
    opt msg "206" parse_char @@ fun msg f_MarketDataRequestRelatedSym_OptAttribute ->
    opt msg "231" parse_float @@ fun msg f_MarketDataRequestRelatedSym_ContractMultiplier ->
    opt msg "223" parse_float @@ fun msg f_MarketDataRequestRelatedSym_CouponRate ->
    opt msg "207" parse_Exchange @@ fun msg f_MarketDataRequestRelatedSym_SecurityExchange ->
    opt msg "106" parse_string @@ fun msg f_MarketDataRequestRelatedSym_Issuer ->
    opt msg "348" parse_int @@ fun msg f_MarketDataRequestRelatedSym_EncodedIssuerLen ->
    opt msg "349" parse_string @@ fun msg f_MarketDataRequestRelatedSym_EncodedIssuer ->
    opt msg "107" parse_string @@ fun msg f_MarketDataRequestRelatedSym_SecurityDesc ->
    opt msg "350" parse_int @@ fun msg f_MarketDataRequestRelatedSym_EncodedSecurityDescLen ->
    opt msg "351" parse_string @@ fun msg f_MarketDataRequestRelatedSym_EncodedSecurityDesc ->
    opt msg "336" parse_string @@ fun msg f_MarketDataRequestRelatedSym_TradingSessionID ->
    ParseSuccess {
    f_MarketDataRequestRelatedSym_NoRelatedSym;
    f_MarketDataRequestRelatedSym_Symbol;
    f_MarketDataRequestRelatedSym_SymbolSfx;
    f_MarketDataRequestRelatedSym_SecurityID;
    f_MarketDataRequestRelatedSym_IDSource;
    f_MarketDataRequestRelatedSym_SecurityType;
    f_MarketDataRequestRelatedSym_MaturityMonthYear;
    f_MarketDataRequestRelatedSym_MaturityDay;
    f_MarketDataRequestRelatedSym_PutOrCall;
    f_MarketDataRequestRelatedSym_StrikePrice;
    f_MarketDataRequestRelatedSym_OptAttribute;
    f_MarketDataRequestRelatedSym_ContractMultiplier;
    f_MarketDataRequestRelatedSym_CouponRate;
    f_MarketDataRequestRelatedSym_SecurityExchange;
    f_MarketDataRequestRelatedSym_Issuer;
    f_MarketDataRequestRelatedSym_EncodedIssuerLen;
    f_MarketDataRequestRelatedSym_EncodedIssuer;
    f_MarketDataRequestRelatedSym_SecurityDesc;
    f_MarketDataRequestRelatedSym_EncodedSecurityDescLen;
    f_MarketDataRequestRelatedSym_EncodedSecurityDesc;
    f_MarketDataRequestRelatedSym_TradingSessionID;
    } , msg ) ;;

let parse_AllocationMiscFees msg = (
    opt msg "136" parse_int @@ fun msg f_AllocationMiscFees_NoMiscFees ->
    opt msg "137" parse_float @@ fun msg f_AllocationMiscFees_MiscFeeAmt ->
    opt msg "138" parse_Currency @@ fun msg f_AllocationMiscFees_MiscFeeCurr ->
    opt msg "139" parse_MiscFeeType @@ fun msg f_AllocationMiscFees_MiscFeeType ->
    ParseSuccess {
    f_AllocationMiscFees_NoMiscFees;
    f_AllocationMiscFees_MiscFeeAmt;
    f_AllocationMiscFees_MiscFeeCurr;
    f_AllocationMiscFees_MiscFeeType;
    } , msg ) ;;

let parse_LogonMsgTypes msg = (
    opt msg "384" parse_int @@ fun msg f_LogonMsgTypes_NoMsgTypes ->
    opt msg "372" parse_string @@ fun msg f_LogonMsgTypes_RefMsgType ->
    opt msg "385" parse_MsgDirection @@ fun msg f_LogonMsgTypes_MsgDirection ->
    ParseSuccess {
    f_LogonMsgTypes_NoMsgTypes;
    f_LogonMsgTypes_RefMsgType;
    f_LogonMsgTypes_MsgDirection;
    } , msg ) ;;

let parse_BidResponseBidComponents msg = (
    req msg "420" parse_int @@ fun msg f_BidResponseBidComponents_NoBidComponents ->
    req msg "12" parse_float @@ fun msg f_BidResponseBidComponents_Commission ->
    req msg "13" parse_CommType @@ fun msg f_BidResponseBidComponents_CommType ->
    opt msg "66" parse_string @@ fun msg f_BidResponseBidComponents_ListID ->
    opt msg "421" parse_string @@ fun msg f_BidResponseBidComponents_Country ->
    opt msg "54" parse_Side @@ fun msg f_BidResponseBidComponents_Side ->
    opt msg "44" parse_float @@ fun msg f_BidResponseBidComponents_Price ->
    opt msg "423" parse_PriceType @@ fun msg f_BidResponseBidComponents_PriceType ->
    opt msg "406" parse_float @@ fun msg f_BidResponseBidComponents_FairValue ->
    opt msg "430" parse_NetGrossInd @@ fun msg f_BidResponseBidComponents_NetGrossInd ->
    opt msg "63" parse_SettlmntTyp @@ fun msg f_BidResponseBidComponents_SettlmntTyp ->
    opt msg "64" parse_LocalMktDate @@ fun msg f_BidResponseBidComponents_FutSettDate ->
    opt msg "336" parse_string @@ fun msg f_BidResponseBidComponents_TradingSessionID ->
    opt msg "58" parse_string @@ fun msg f_BidResponseBidComponents_Text ->
    opt msg "354" parse_int @@ fun msg f_BidResponseBidComponents_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_BidResponseBidComponents_EncodedText ->
    ParseSuccess {
    f_BidResponseBidComponents_NoBidComponents;
    f_BidResponseBidComponents_Commission;
    f_BidResponseBidComponents_CommType;
    f_BidResponseBidComponents_ListID;
    f_BidResponseBidComponents_Country;
    f_BidResponseBidComponents_Side;
    f_BidResponseBidComponents_Price;
    f_BidResponseBidComponents_PriceType;
    f_BidResponseBidComponents_FairValue;
    f_BidResponseBidComponents_NetGrossInd;
    f_BidResponseBidComponents_SettlmntTyp;
    f_BidResponseBidComponents_FutSettDate;
    f_BidResponseBidComponents_TradingSessionID;
    f_BidResponseBidComponents_Text;
    f_BidResponseBidComponents_EncodedTextLen;
    f_BidResponseBidComponents_EncodedText;
    } , msg ) ;;

let parse_BidRequestBidDescriptors msg = (
    opt msg "398" parse_int @@ fun msg f_BidRequestBidDescriptors_NoBidDescriptors ->
    opt msg "399" parse_int @@ fun msg f_BidRequestBidDescriptors_BidDescriptorType ->
    opt msg "400" parse_string @@ fun msg f_BidRequestBidDescriptors_BidDescriptor ->
    opt msg "401" parse_int @@ fun msg f_BidRequestBidDescriptors_SideValueInd ->
    opt msg "404" parse_float @@ fun msg f_BidRequestBidDescriptors_LiquidityValue ->
    opt msg "441" parse_int @@ fun msg f_BidRequestBidDescriptors_LiquidityNumSecurities ->
    opt msg "402" parse_float @@ fun msg f_BidRequestBidDescriptors_LiquidityPctLow ->
    opt msg "403" parse_float @@ fun msg f_BidRequestBidDescriptors_LiquidityPctHigh ->
    opt msg "405" parse_float @@ fun msg f_BidRequestBidDescriptors_EFPTrackingError ->
    opt msg "406" parse_float @@ fun msg f_BidRequestBidDescriptors_FairValue ->
    opt msg "407" parse_float @@ fun msg f_BidRequestBidDescriptors_OutsideIndexPct ->
    opt msg "408" parse_float @@ fun msg f_BidRequestBidDescriptors_ValueOfFutures ->
    ParseSuccess {
    f_BidRequestBidDescriptors_NoBidDescriptors;
    f_BidRequestBidDescriptors_BidDescriptorType;
    f_BidRequestBidDescriptors_BidDescriptor;
    f_BidRequestBidDescriptors_SideValueInd;
    f_BidRequestBidDescriptors_LiquidityValue;
    f_BidRequestBidDescriptors_LiquidityNumSecurities;
    f_BidRequestBidDescriptors_LiquidityPctLow;
    f_BidRequestBidDescriptors_LiquidityPctHigh;
    f_BidRequestBidDescriptors_EFPTrackingError;
    f_BidRequestBidDescriptors_FairValue;
    f_BidRequestBidDescriptors_OutsideIndexPct;
    f_BidRequestBidDescriptors_ValueOfFutures;
    } , msg ) ;;

let parse_NewsLinesOfText msg = (
    req msg "33" parse_int @@ fun msg f_NewsLinesOfText_LinesOfText ->
    req msg "58" parse_string @@ fun msg f_NewsLinesOfText_Text ->
    opt msg "354" parse_int @@ fun msg f_NewsLinesOfText_EncodedTextLen ->
    opt msg "355" parse_string @@ fun msg f_NewsLinesOfText_EncodedText ->
    ParseSuccess {
    f_NewsLinesOfText_LinesOfText;
    f_NewsLinesOfText_Text;
    f_NewsLinesOfText_EncodedTextLen;
    f_NewsLinesOfText_EncodedText;
    } , msg ) ;;

let parse_OrderListAllocs msg = (
    opt msg "78" parse_int @@ fun msg f_OrderListAllocs_NoAllocs ->
    opt msg "79" parse_string @@ fun msg f_OrderListAllocs_AllocAccount ->
    opt msg "80" parse_float @@ fun msg f_OrderListAllocs_AllocShares ->
    ParseSuccess {
    f_OrderListAllocs_NoAllocs;
    f_OrderListAllocs_AllocAccount;
    f_OrderListAllocs_AllocShares;
    } , msg ) ;;

let parse_MassQuoteQuoteEntries msg = (
    req msg "295" parse_int @@ fun msg f_MassQuoteQuoteEntries_NoQuoteEntries ->
    req msg "299" parse_string @@ fun msg f_MassQuoteQuoteEntries_QuoteEntryID ->
    opt msg "55" parse_string @@ fun msg f_MassQuoteQuoteEntries_Symbol ->
    opt msg "65" parse_string @@ fun msg f_MassQuoteQuoteEntries_SymbolSfx ->
    opt msg "48" parse_string @@ fun msg f_MassQuoteQuoteEntries_SecurityID ->
    opt msg "22" parse_IDSource @@ fun msg f_MassQuoteQuoteEntries_IDSource ->
    opt msg "167" parse_SecurityType @@ fun msg f_MassQuoteQuoteEntries_SecurityType ->
    opt msg "200" parse_MonthYear @@ fun msg f_MassQuoteQuoteEntries_MaturityMonthYear ->
    opt msg "205" parse_int @@ fun msg f_MassQuoteQuoteEntries_MaturityDay ->
    opt msg "201" parse_PutOrCall @@ fun msg f_MassQuoteQuoteEntries_PutOrCall ->
    opt msg "202" parse_float @@ fun msg f_MassQuoteQuoteEntries_StrikePrice ->
    opt msg "206" parse_char @@ fun msg f_MassQuoteQuoteEntries_OptAttribute ->
    opt msg "231" parse_float @@ fun msg f_MassQuoteQuoteEntries_ContractMultiplier ->
    opt msg "223" parse_float @@ fun msg f_MassQuoteQuoteEntries_CouponRate ->
    opt msg "207" parse_Exchange @@ fun msg f_MassQuoteQuoteEntries_SecurityExchange ->
    opt msg "106" parse_string @@ fun msg f_MassQuoteQuoteEntries_Issuer ->
    opt msg "348" parse_int @@ fun msg f_MassQuoteQuoteEntries_EncodedIssuerLen ->
    opt msg "349" parse_string @@ fun msg f_MassQuoteQuoteEntries_EncodedIssuer ->
    opt msg "107" parse_string @@ fun msg f_MassQuoteQuoteEntries_SecurityDesc ->
    opt msg "350" parse_int @@ fun msg f_MassQuoteQuoteEntries_EncodedSecurityDescLen ->
    opt msg "351" parse_string @@ fun msg f_MassQuoteQuoteEntries_EncodedSecurityDesc ->
    opt msg "132" parse_float @@ fun msg f_MassQuoteQuoteEntries_BidPx ->
    opt msg "133" parse_float @@ fun msg f_MassQuoteQuoteEntries_OfferPx ->
    opt msg "134" parse_float @@ fun msg f_MassQuoteQuoteEntries_BidSize ->
    opt msg "135" parse_float @@ fun msg f_MassQuoteQuoteEntries_OfferSize ->
    opt msg "62" parse_UTCTimestamp @@ fun msg f_MassQuoteQuoteEntries_ValidUntilTime ->
    opt msg "188" parse_float @@ fun msg f_MassQuoteQuoteEntries_BidSpotRate ->
    opt msg "190" parse_float @@ fun msg f_MassQuoteQuoteEntries_OfferSpotRate ->
    opt msg "189" parse_float @@ fun msg f_MassQuoteQuoteEntries_BidForwardPoints ->
    opt msg "191" parse_float @@ fun msg f_MassQuoteQuoteEntries_OfferForwardPoints ->
    opt msg "60" parse_UTCTimestamp @@ fun msg f_MassQuoteQuoteEntries_TransactTime ->
    opt msg "336" parse_string @@ fun msg f_MassQuoteQuoteEntries_TradingSessionID ->
    opt msg "64" parse_LocalMktDate @@ fun msg f_MassQuoteQuoteEntries_FutSettDate ->
    opt msg "40" parse_OrdType @@ fun msg f_MassQuoteQuoteEntries_OrdType ->
    opt msg "193" parse_LocalMktDate @@ fun msg f_MassQuoteQuoteEntries_FutSettDate2 ->
    opt msg "192" parse_float @@ fun msg f_MassQuoteQuoteEntries_OrderQty2 ->
    opt msg "15" parse_Currency @@ fun msg f_MassQuoteQuoteEntries_Currency ->
    ParseSuccess {
    f_MassQuoteQuoteEntries_NoQuoteEntries;
    f_MassQuoteQuoteEntries_QuoteEntryID;
    f_MassQuoteQuoteEntries_Symbol;
    f_MassQuoteQuoteEntries_SymbolSfx;
    f_MassQuoteQuoteEntries_SecurityID;
    f_MassQuoteQuoteEntries_IDSource;
    f_MassQuoteQuoteEntries_SecurityType;
    f_MassQuoteQuoteEntries_MaturityMonthYear;
    f_MassQuoteQuoteEntries_MaturityDay;
    f_MassQuoteQuoteEntries_PutOrCall;
    f_MassQuoteQuoteEntries_StrikePrice;
    f_MassQuoteQuoteEntries_OptAttribute;
    f_MassQuoteQuoteEntries_ContractMultiplier;
    f_MassQuoteQuoteEntries_CouponRate;
    f_MassQuoteQuoteEntries_SecurityExchange;
    f_MassQuoteQuoteEntries_Issuer;
    f_MassQuoteQuoteEntries_EncodedIssuerLen;
    f_MassQuoteQuoteEntries_EncodedIssuer;
    f_MassQuoteQuoteEntries_SecurityDesc;
    f_MassQuoteQuoteEntries_EncodedSecurityDescLen;
    f_MassQuoteQuoteEntries_EncodedSecurityDesc;
    f_MassQuoteQuoteEntries_BidPx;
    f_MassQuoteQuoteEntries_OfferPx;
    f_MassQuoteQuoteEntries_BidSize;
    f_MassQuoteQuoteEntries_OfferSize;
    f_MassQuoteQuoteEntries_ValidUntilTime;
    f_MassQuoteQuoteEntries_BidSpotRate;
    f_MassQuoteQuoteEntries_OfferSpotRate;
    f_MassQuoteQuoteEntries_BidForwardPoints;
    f_MassQuoteQuoteEntries_OfferForwardPoints;
    f_MassQuoteQuoteEntries_TransactTime;
    f_MassQuoteQuoteEntries_TradingSessionID;
    f_MassQuoteQuoteEntries_FutSettDate;
    f_MassQuoteQuoteEntries_OrdType;
    f_MassQuoteQuoteEntries_FutSettDate2;
    f_MassQuoteQuoteEntries_OrderQty2;
    f_MassQuoteQuoteEntries_Currency;
    } , msg ) ;;
