(* Aesthetic Integration copyright 2017 *)
(* @meta[imandra_ignore] on @end *)
open Encode_app_enums;;
open Encode_base_types;;
open Encode_datetime;;
open Full_app_records;;
(* @meta[imandra_ignore] off @end *)

let req f x = Some (f x);;
let opt f v = match v with Some x -> Some ( f x ) | None -> None;;
let repeat f tag lst = match lst with [] -> [] | lst ->
    ( tag , lst |> List.length |> req encode_int ) :: (lst |> List.map f |> List.concat );;

let encode_MarketDataRequestMDEntryTypes msg =
    [
    ( "267" , req encode_int msg.f_MarketDataRequestMDEntryTypes_NoMDEntryTypes );
    ( "269" , req encode_MDEntryType msg.f_MarketDataRequestMDEntryTypes_MDEntryType );
    ]
;;

let encode_ListStrikePriceStrikes msg =
    [
    ( "428" , req encode_int msg.f_ListStrikePriceStrikes_NoStrikes );
    ( "55" , req encode_string msg.f_ListStrikePriceStrikes_Symbol );
    ( "65" , opt encode_string msg.f_ListStrikePriceStrikes_SymbolSfx );
    ( "48" , opt encode_string msg.f_ListStrikePriceStrikes_SecurityID );
    ( "22" , opt encode_IDSource msg.f_ListStrikePriceStrikes_IDSource );
    ( "167" , opt encode_SecurityType msg.f_ListStrikePriceStrikes_SecurityType );
    ( "200" , opt encode_MonthYear msg.f_ListStrikePriceStrikes_MaturityMonthYear );
    ( "205" , opt encode_int msg.f_ListStrikePriceStrikes_MaturityDay );
    ( "201" , opt encode_PutOrCall msg.f_ListStrikePriceStrikes_PutOrCall );
    ( "202" , opt encode_float msg.f_ListStrikePriceStrikes_StrikePrice );
    ( "206" , opt encode_char msg.f_ListStrikePriceStrikes_OptAttribute );
    ( "231" , opt encode_float msg.f_ListStrikePriceStrikes_ContractMultiplier );
    ( "223" , opt encode_float msg.f_ListStrikePriceStrikes_CouponRate );
    ( "207" , opt encode_Exchange msg.f_ListStrikePriceStrikes_SecurityExchange );
    ( "106" , opt encode_string msg.f_ListStrikePriceStrikes_Issuer );
    ( "348" , opt encode_int msg.f_ListStrikePriceStrikes_EncodedIssuerLen );
    ( "349" , opt encode_string msg.f_ListStrikePriceStrikes_EncodedIssuer );
    ( "107" , opt encode_string msg.f_ListStrikePriceStrikes_SecurityDesc );
    ( "350" , opt encode_int msg.f_ListStrikePriceStrikes_EncodedSecurityDescLen );
    ( "351" , opt encode_string msg.f_ListStrikePriceStrikes_EncodedSecurityDesc );
    ( "140" , opt encode_float msg.f_ListStrikePriceStrikes_PrevClosePx );
    ( "11" , opt encode_string msg.f_ListStrikePriceStrikes_ClOrdID );
    ( "54" , opt encode_Side msg.f_ListStrikePriceStrikes_Side );
    ( "44" , req encode_float msg.f_ListStrikePriceStrikes_Price );
    ( "15" , opt encode_Currency msg.f_ListStrikePriceStrikes_Currency );
    ( "58" , opt encode_string msg.f_ListStrikePriceStrikes_Text );
    ( "354" , opt encode_int msg.f_ListStrikePriceStrikes_EncodedTextLen );
    ( "355" , opt encode_string msg.f_ListStrikePriceStrikes_EncodedText );
    ]
;;

let encode_NewsLinesOfText msg =
    [
    ( "33" , req encode_int msg.f_NewsLinesOfText_LinesOfText );
    ( "58" , req encode_string msg.f_NewsLinesOfText_Text );
    ( "354" , opt encode_int msg.f_NewsLinesOfText_EncodedTextLen );
    ( "355" , opt encode_string msg.f_NewsLinesOfText_EncodedText );
    ]
;;

let encode_BidRequestBidDescriptors msg =
    [
    ( "398" , opt encode_int msg.f_BidRequestBidDescriptors_NoBidDescriptors );
    ( "399" , opt encode_int msg.f_BidRequestBidDescriptors_BidDescriptorType );
    ( "400" , opt encode_string msg.f_BidRequestBidDescriptors_BidDescriptor );
    ( "401" , opt encode_int msg.f_BidRequestBidDescriptors_SideValueInd );
    ( "404" , opt encode_float msg.f_BidRequestBidDescriptors_LiquidityValue );
    ( "441" , opt encode_int msg.f_BidRequestBidDescriptors_LiquidityNumSecurities );
    ( "402" , opt encode_float msg.f_BidRequestBidDescriptors_LiquidityPctLow );
    ( "403" , opt encode_float msg.f_BidRequestBidDescriptors_LiquidityPctHigh );
    ( "405" , opt encode_float msg.f_BidRequestBidDescriptors_EFPTrackingError );
    ( "406" , opt encode_float msg.f_BidRequestBidDescriptors_FairValue );
    ( "407" , opt encode_float msg.f_BidRequestBidDescriptors_OutsideIndexPct );
    ( "408" , opt encode_float msg.f_BidRequestBidDescriptors_ValueOfFutures );
    ]
;;

let encode_OrderSingleAllocs msg =
    [
    ( "78" , opt encode_int msg.f_OrderSingleAllocs_NoAllocs );
    ( "79" , opt encode_string msg.f_OrderSingleAllocs_AllocAccount );
    ( "80" , opt encode_float msg.f_OrderSingleAllocs_AllocShares );
    ]
;;

let encode_OrderSingleTradingSessions msg =
    [
    ( "386" , opt encode_int msg.f_OrderSingleTradingSessions_NoTradingSessions );
    ( "336" , opt encode_string msg.f_OrderSingleTradingSessions_TradingSessionID );
    ]
;;

let encode_ExecutionReportContraBrokers msg =
    [
    ( "382" , opt encode_int msg.f_ExecutionReportContraBrokers_NoContraBrokers );
    ( "375" , opt encode_string msg.f_ExecutionReportContraBrokers_ContraBroker );
    ( "337" , opt encode_string msg.f_ExecutionReportContraBrokers_ContraTrader );
    ( "437" , opt encode_float msg.f_ExecutionReportContraBrokers_ContraTradeQty );
    ( "438" , opt encode_UTCTimestamp msg.f_ExecutionReportContraBrokers_ContraTradeTime );
    ]
;;

let encode_QuoteAcknowledgementQuoteEntries msg =
    [
    ( "295" , opt encode_int msg.f_QuoteAcknowledgementQuoteEntries_NoQuoteEntries );
    ( "299" , opt encode_string msg.f_QuoteAcknowledgementQuoteEntries_QuoteEntryID );
    ( "55" , opt encode_string msg.f_QuoteAcknowledgementQuoteEntries_Symbol );
    ( "65" , opt encode_string msg.f_QuoteAcknowledgementQuoteEntries_SymbolSfx );
    ( "48" , opt encode_string msg.f_QuoteAcknowledgementQuoteEntries_SecurityID );
    ( "22" , opt encode_IDSource msg.f_QuoteAcknowledgementQuoteEntries_IDSource );
    ( "167" , opt encode_SecurityType msg.f_QuoteAcknowledgementQuoteEntries_SecurityType );
    ( "200" , opt encode_MonthYear msg.f_QuoteAcknowledgementQuoteEntries_MaturityMonthYear );
    ( "205" , opt encode_int msg.f_QuoteAcknowledgementQuoteEntries_MaturityDay );
    ( "201" , opt encode_PutOrCall msg.f_QuoteAcknowledgementQuoteEntries_PutOrCall );
    ( "202" , opt encode_float msg.f_QuoteAcknowledgementQuoteEntries_StrikePrice );
    ( "206" , opt encode_char msg.f_QuoteAcknowledgementQuoteEntries_OptAttribute );
    ( "231" , opt encode_float msg.f_QuoteAcknowledgementQuoteEntries_ContractMultiplier );
    ( "223" , opt encode_float msg.f_QuoteAcknowledgementQuoteEntries_CouponRate );
    ( "207" , opt encode_Exchange msg.f_QuoteAcknowledgementQuoteEntries_SecurityExchange );
    ( "106" , opt encode_string msg.f_QuoteAcknowledgementQuoteEntries_Issuer );
    ( "348" , opt encode_int msg.f_QuoteAcknowledgementQuoteEntries_EncodedIssuerLen );
    ( "349" , opt encode_string msg.f_QuoteAcknowledgementQuoteEntries_EncodedIssuer );
    ( "107" , opt encode_string msg.f_QuoteAcknowledgementQuoteEntries_SecurityDesc );
    ( "350" , opt encode_int msg.f_QuoteAcknowledgementQuoteEntries_EncodedSecurityDescLen );
    ( "351" , opt encode_string msg.f_QuoteAcknowledgementQuoteEntries_EncodedSecurityDesc );
    ( "368" , opt encode_QuoteEntryRejectReason msg.f_QuoteAcknowledgementQuoteEntries_QuoteEntryRejectReason );
    ]
;;

let encode_EmailLinesOfText msg =
    [
    ( "33" , req encode_int msg.f_EmailLinesOfText_LinesOfText );
    ( "58" , req encode_string msg.f_EmailLinesOfText_Text );
    ( "354" , opt encode_int msg.f_EmailLinesOfText_EncodedTextLen );
    ( "355" , opt encode_string msg.f_EmailLinesOfText_EncodedText );
    ]
;;

let encode_AllocationOrders msg =
    [
    ( "73" , opt encode_int msg.f_AllocationOrders_NoOrders );
    ( "11" , opt encode_string msg.f_AllocationOrders_ClOrdID );
    ( "37" , opt encode_string msg.f_AllocationOrders_OrderID );
    ( "198" , opt encode_string msg.f_AllocationOrders_SecondaryOrderID );
    ( "66" , opt encode_string msg.f_AllocationOrders_ListID );
    ( "105" , opt encode_string msg.f_AllocationOrders_WaveNo );
    ]
;;

let encode_MassQuoteQuoteEntries msg =
    [
    ( "295" , req encode_int msg.f_MassQuoteQuoteEntries_NoQuoteEntries );
    ( "299" , req encode_string msg.f_MassQuoteQuoteEntries_QuoteEntryID );
    ( "55" , opt encode_string msg.f_MassQuoteQuoteEntries_Symbol );
    ( "65" , opt encode_string msg.f_MassQuoteQuoteEntries_SymbolSfx );
    ( "48" , opt encode_string msg.f_MassQuoteQuoteEntries_SecurityID );
    ( "22" , opt encode_IDSource msg.f_MassQuoteQuoteEntries_IDSource );
    ( "167" , opt encode_SecurityType msg.f_MassQuoteQuoteEntries_SecurityType );
    ( "200" , opt encode_MonthYear msg.f_MassQuoteQuoteEntries_MaturityMonthYear );
    ( "205" , opt encode_int msg.f_MassQuoteQuoteEntries_MaturityDay );
    ( "201" , opt encode_PutOrCall msg.f_MassQuoteQuoteEntries_PutOrCall );
    ( "202" , opt encode_float msg.f_MassQuoteQuoteEntries_StrikePrice );
    ( "206" , opt encode_char msg.f_MassQuoteQuoteEntries_OptAttribute );
    ( "231" , opt encode_float msg.f_MassQuoteQuoteEntries_ContractMultiplier );
    ( "223" , opt encode_float msg.f_MassQuoteQuoteEntries_CouponRate );
    ( "207" , opt encode_Exchange msg.f_MassQuoteQuoteEntries_SecurityExchange );
    ( "106" , opt encode_string msg.f_MassQuoteQuoteEntries_Issuer );
    ( "348" , opt encode_int msg.f_MassQuoteQuoteEntries_EncodedIssuerLen );
    ( "349" , opt encode_string msg.f_MassQuoteQuoteEntries_EncodedIssuer );
    ( "107" , opt encode_string msg.f_MassQuoteQuoteEntries_SecurityDesc );
    ( "350" , opt encode_int msg.f_MassQuoteQuoteEntries_EncodedSecurityDescLen );
    ( "351" , opt encode_string msg.f_MassQuoteQuoteEntries_EncodedSecurityDesc );
    ( "132" , opt encode_float msg.f_MassQuoteQuoteEntries_BidPx );
    ( "133" , opt encode_float msg.f_MassQuoteQuoteEntries_OfferPx );
    ( "134" , opt encode_float msg.f_MassQuoteQuoteEntries_BidSize );
    ( "135" , opt encode_float msg.f_MassQuoteQuoteEntries_OfferSize );
    ( "62" , opt encode_UTCTimestamp msg.f_MassQuoteQuoteEntries_ValidUntilTime );
    ( "188" , opt encode_float msg.f_MassQuoteQuoteEntries_BidSpotRate );
    ( "190" , opt encode_float msg.f_MassQuoteQuoteEntries_OfferSpotRate );
    ( "189" , opt encode_float msg.f_MassQuoteQuoteEntries_BidForwardPoints );
    ( "191" , opt encode_float msg.f_MassQuoteQuoteEntries_OfferForwardPoints );
    ( "60" , opt encode_UTCTimestamp msg.f_MassQuoteQuoteEntries_TransactTime );
    ( "336" , opt encode_string msg.f_MassQuoteQuoteEntries_TradingSessionID );
    ( "64" , opt encode_LocalMktDate msg.f_MassQuoteQuoteEntries_FutSettDate );
    ( "40" , opt encode_OrdType msg.f_MassQuoteQuoteEntries_OrdType );
    ( "193" , opt encode_LocalMktDate msg.f_MassQuoteQuoteEntries_FutSettDate2 );
    ( "192" , opt encode_float msg.f_MassQuoteQuoteEntries_OrderQty2 );
    ( "15" , opt encode_Currency msg.f_MassQuoteQuoteEntries_Currency );
    ]
;;

let encode_MassQuoteQuoteSets msg =
    [
    ( "296" , req encode_int msg.f_MassQuoteQuoteSets_NoQuoteSets );
    ( "302" , req encode_string msg.f_MassQuoteQuoteSets_QuoteSetID );
    ( "311" , req encode_string msg.f_MassQuoteQuoteSets_UnderlyingSymbol );
    ( "312" , opt encode_string msg.f_MassQuoteQuoteSets_UnderlyingSymbolSfx );
    ( "309" , opt encode_string msg.f_MassQuoteQuoteSets_UnderlyingSecurityID );
    ( "305" , opt encode_string msg.f_MassQuoteQuoteSets_UnderlyingIDSource );
    ( "310" , opt encode_string msg.f_MassQuoteQuoteSets_UnderlyingSecurityType );
    ( "313" , opt encode_MonthYear msg.f_MassQuoteQuoteSets_UnderlyingMaturityMonthYear );
    ( "314" , opt encode_int msg.f_MassQuoteQuoteSets_UnderlyingMaturityDay );
    ( "315" , opt encode_int msg.f_MassQuoteQuoteSets_UnderlyingPutOrCall );
    ( "316" , opt encode_float msg.f_MassQuoteQuoteSets_UnderlyingStrikePrice );
    ( "317" , opt encode_char msg.f_MassQuoteQuoteSets_UnderlyingOptAttribute );
    ( "436" , opt encode_float msg.f_MassQuoteQuoteSets_UnderlyingContractMultiplier );
    ( "435" , opt encode_float msg.f_MassQuoteQuoteSets_UnderlyingCouponRate );
    ( "308" , opt encode_Exchange msg.f_MassQuoteQuoteSets_UnderlyingSecurityExchange );
    ( "306" , opt encode_string msg.f_MassQuoteQuoteSets_UnderlyingIssuer );
    ( "362" , opt encode_int msg.f_MassQuoteQuoteSets_EncodedUnderlyingIssuerLen );
    ( "363" , opt encode_string msg.f_MassQuoteQuoteSets_EncodedUnderlyingIssuer );
    ( "307" , opt encode_string msg.f_MassQuoteQuoteSets_UnderlyingSecurityDesc );
    ( "364" , opt encode_int msg.f_MassQuoteQuoteSets_EncodedUnderlyingSecurityDescLen );
    ( "365" , opt encode_string msg.f_MassQuoteQuoteSets_EncodedUnderlyingSecurityDesc );
    ( "367" , opt encode_UTCTimestamp msg.f_MassQuoteQuoteSets_QuoteSetValidUntilTime );
    ( "304" , req encode_int msg.f_MassQuoteQuoteSets_TotQuoteEntries );
    ]
;;

let encode_OrderListAllocs msg =
    [
    ( "78" , opt encode_int msg.f_OrderListAllocs_NoAllocs );
    ( "79" , opt encode_string msg.f_OrderListAllocs_AllocAccount );
    ( "80" , opt encode_float msg.f_OrderListAllocs_AllocShares );
    ]
;;

let encode_AllocationMiscFees msg =
    [
    ( "136" , opt encode_int msg.f_AllocationMiscFees_NoMiscFees );
    ( "137" , opt encode_float msg.f_AllocationMiscFees_MiscFeeAmt );
    ( "138" , opt encode_Currency msg.f_AllocationMiscFees_MiscFeeCurr );
    ( "139" , opt encode_MiscFeeType msg.f_AllocationMiscFees_MiscFeeType );
    ]
;;

let encode_OrderListOrders msg =
    [
    ( "73" , req encode_int msg.f_OrderListOrders_NoOrders );
    ( "11" , req encode_string msg.f_OrderListOrders_ClOrdID );
    ( "67" , req encode_int msg.f_OrderListOrders_ListSeqNo );
    ( "160" , opt encode_SettlInstMode msg.f_OrderListOrders_SettlInstMode );
    ( "109" , opt encode_string msg.f_OrderListOrders_ClientID );
    ( "76" , opt encode_string msg.f_OrderListOrders_ExecBroker );
    ( "1" , opt encode_string msg.f_OrderListOrders_Account );
    ( "63" , opt encode_SettlmntTyp msg.f_OrderListOrders_SettlmntTyp );
    ( "64" , opt encode_LocalMktDate msg.f_OrderListOrders_FutSettDate );
    ( "21" , opt encode_HandlInst msg.f_OrderListOrders_HandlInst );
    ( "18" , opt encode_ExecInst msg.f_OrderListOrders_ExecInst );
    ( "110" , opt encode_float msg.f_OrderListOrders_MinQty );
    ( "111" , opt encode_float msg.f_OrderListOrders_MaxFloor );
    ( "100" , opt encode_Exchange msg.f_OrderListOrders_ExDestination );
    ( "81" , opt encode_ProcessCode msg.f_OrderListOrders_ProcessCode );
    ( "55" , req encode_string msg.f_OrderListOrders_Symbol );
    ( "65" , opt encode_string msg.f_OrderListOrders_SymbolSfx );
    ( "48" , opt encode_string msg.f_OrderListOrders_SecurityID );
    ( "22" , opt encode_IDSource msg.f_OrderListOrders_IDSource );
    ( "167" , opt encode_SecurityType msg.f_OrderListOrders_SecurityType );
    ( "200" , opt encode_MonthYear msg.f_OrderListOrders_MaturityMonthYear );
    ( "205" , opt encode_int msg.f_OrderListOrders_MaturityDay );
    ( "201" , opt encode_PutOrCall msg.f_OrderListOrders_PutOrCall );
    ( "202" , opt encode_float msg.f_OrderListOrders_StrikePrice );
    ( "206" , opt encode_char msg.f_OrderListOrders_OptAttribute );
    ( "231" , opt encode_float msg.f_OrderListOrders_ContractMultiplier );
    ( "223" , opt encode_float msg.f_OrderListOrders_CouponRate );
    ( "207" , opt encode_Exchange msg.f_OrderListOrders_SecurityExchange );
    ( "106" , opt encode_string msg.f_OrderListOrders_Issuer );
    ( "348" , opt encode_int msg.f_OrderListOrders_EncodedIssuerLen );
    ( "349" , opt encode_string msg.f_OrderListOrders_EncodedIssuer );
    ( "107" , opt encode_string msg.f_OrderListOrders_SecurityDesc );
    ( "350" , opt encode_int msg.f_OrderListOrders_EncodedSecurityDescLen );
    ( "351" , opt encode_string msg.f_OrderListOrders_EncodedSecurityDesc );
    ( "140" , opt encode_float msg.f_OrderListOrders_PrevClosePx );
    ( "54" , req encode_Side msg.f_OrderListOrders_Side );
    ( "401" , opt encode_int msg.f_OrderListOrders_SideValueInd );
    ( "114" , opt encode_LocateReqd msg.f_OrderListOrders_LocateReqd );
    ( "60" , opt encode_UTCTimestamp msg.f_OrderListOrders_TransactTime );
    ( "38" , opt encode_float msg.f_OrderListOrders_OrderQty );
    ( "152" , opt encode_float msg.f_OrderListOrders_CashOrderQty );
    ( "40" , opt encode_OrdType msg.f_OrderListOrders_OrdType );
    ( "44" , opt encode_float msg.f_OrderListOrders_Price );
    ( "99" , opt encode_float msg.f_OrderListOrders_StopPx );
    ( "15" , opt encode_Currency msg.f_OrderListOrders_Currency );
    ( "376" , opt encode_string msg.f_OrderListOrders_ComplianceID );
    ( "377" , opt encode_SolicitedFlag msg.f_OrderListOrders_SolicitedFlag );
    ( "23" , opt encode_string msg.f_OrderListOrders_IOIid );
    ( "117" , opt encode_string msg.f_OrderListOrders_QuoteID );
    ( "59" , opt encode_TimeInForce msg.f_OrderListOrders_TimeInForce );
    ( "168" , opt encode_UTCTimestamp msg.f_OrderListOrders_EffectiveTime );
    ( "432" , opt encode_LocalMktDate msg.f_OrderListOrders_ExpireDate );
    ( "126" , opt encode_UTCTimestamp msg.f_OrderListOrders_ExpireTime );
    ( "427" , opt encode_GTBookingInst msg.f_OrderListOrders_GTBookingInst );
    ( "12" , opt encode_float msg.f_OrderListOrders_Commission );
    ( "13" , opt encode_CommType msg.f_OrderListOrders_CommType );
    ( "47" , opt encode_Rule80A msg.f_OrderListOrders_Rule80A );
    ( "121" , opt encode_ForexReq msg.f_OrderListOrders_ForexReq );
    ( "120" , opt encode_Currency msg.f_OrderListOrders_SettlCurrency );
    ( "58" , opt encode_string msg.f_OrderListOrders_Text );
    ( "354" , opt encode_int msg.f_OrderListOrders_EncodedTextLen );
    ( "355" , opt encode_string msg.f_OrderListOrders_EncodedText );
    ( "193" , opt encode_LocalMktDate msg.f_OrderListOrders_FutSettDate2 );
    ( "192" , opt encode_float msg.f_OrderListOrders_OrderQty2 );
    ( "77" , opt encode_OpenClose msg.f_OrderListOrders_OpenClose );
    ( "203" , opt encode_CoveredOrUncovered msg.f_OrderListOrders_CoveredOrUncovered );
    ( "204" , opt encode_CustomerOrFirm msg.f_OrderListOrders_CustomerOrFirm );
    ( "210" , opt encode_float msg.f_OrderListOrders_MaxShow );
    ( "211" , opt encode_float msg.f_OrderListOrders_PegDifference );
    ( "388" , opt encode_DiscretionInst msg.f_OrderListOrders_DiscretionInst );
    ( "389" , opt encode_float msg.f_OrderListOrders_DiscretionOffset );
    ( "439" , opt encode_string msg.f_OrderListOrders_ClearingFirm );
    ( "440" , opt encode_string msg.f_OrderListOrders_ClearingAccount );
    ]
;;

let encode_SecurityDefinitionRelatedSym msg =
    [
    ( "146" , opt encode_int msg.f_SecurityDefinitionRelatedSym_NoRelatedSym );
    ( "311" , opt encode_string msg.f_SecurityDefinitionRelatedSym_UnderlyingSymbol );
    ( "312" , opt encode_string msg.f_SecurityDefinitionRelatedSym_UnderlyingSymbolSfx );
    ( "309" , opt encode_string msg.f_SecurityDefinitionRelatedSym_UnderlyingSecurityID );
    ( "305" , opt encode_string msg.f_SecurityDefinitionRelatedSym_UnderlyingIDSource );
    ( "310" , opt encode_string msg.f_SecurityDefinitionRelatedSym_UnderlyingSecurityType );
    ( "313" , opt encode_MonthYear msg.f_SecurityDefinitionRelatedSym_UnderlyingMaturityMonthYear );
    ( "314" , opt encode_int msg.f_SecurityDefinitionRelatedSym_UnderlyingMaturityDay );
    ( "315" , opt encode_int msg.f_SecurityDefinitionRelatedSym_UnderlyingPutOrCall );
    ( "316" , opt encode_float msg.f_SecurityDefinitionRelatedSym_UnderlyingStrikePrice );
    ( "317" , opt encode_char msg.f_SecurityDefinitionRelatedSym_UnderlyingOptAttribute );
    ( "436" , opt encode_float msg.f_SecurityDefinitionRelatedSym_UnderlyingContractMultiplier );
    ( "435" , opt encode_float msg.f_SecurityDefinitionRelatedSym_UnderlyingCouponRate );
    ( "308" , opt encode_Exchange msg.f_SecurityDefinitionRelatedSym_UnderlyingSecurityExchange );
    ( "306" , opt encode_string msg.f_SecurityDefinitionRelatedSym_UnderlyingIssuer );
    ( "362" , opt encode_int msg.f_SecurityDefinitionRelatedSym_EncodedUnderlyingIssuerLen );
    ( "363" , opt encode_string msg.f_SecurityDefinitionRelatedSym_EncodedUnderlyingIssuer );
    ( "307" , opt encode_string msg.f_SecurityDefinitionRelatedSym_UnderlyingSecurityDesc );
    ( "364" , opt encode_int msg.f_SecurityDefinitionRelatedSym_EncodedUnderlyingSecurityDescLen );
    ( "365" , opt encode_string msg.f_SecurityDefinitionRelatedSym_EncodedUnderlyingSecurityDesc );
    ( "319" , opt encode_float msg.f_SecurityDefinitionRelatedSym_RatioQty );
    ( "54" , opt encode_Side msg.f_SecurityDefinitionRelatedSym_Side );
    ( "318" , opt encode_Currency msg.f_SecurityDefinitionRelatedSym_UnderlyingCurrency );
    ]
;;

let encode_OrderCancelReplaceRequestTradingSessions msg =
    [
    ( "386" , opt encode_int msg.f_OrderCancelReplaceRequestTradingSessions_NoTradingSessions );
    ( "336" , opt encode_string msg.f_OrderCancelReplaceRequestTradingSessions_TradingSessionID );
    ]
;;

let encode_QuoteAcknowledgementQuoteSets msg =
    [
    ( "296" , opt encode_int msg.f_QuoteAcknowledgementQuoteSets_NoQuoteSets );
    ( "302" , opt encode_string msg.f_QuoteAcknowledgementQuoteSets_QuoteSetID );
    ( "311" , opt encode_string msg.f_QuoteAcknowledgementQuoteSets_UnderlyingSymbol );
    ( "312" , opt encode_string msg.f_QuoteAcknowledgementQuoteSets_UnderlyingSymbolSfx );
    ( "309" , opt encode_string msg.f_QuoteAcknowledgementQuoteSets_UnderlyingSecurityID );
    ( "305" , opt encode_string msg.f_QuoteAcknowledgementQuoteSets_UnderlyingIDSource );
    ( "310" , opt encode_string msg.f_QuoteAcknowledgementQuoteSets_UnderlyingSecurityType );
    ( "313" , opt encode_MonthYear msg.f_QuoteAcknowledgementQuoteSets_UnderlyingMaturityMonthYear );
    ( "314" , opt encode_int msg.f_QuoteAcknowledgementQuoteSets_UnderlyingMaturityDay );
    ( "315" , opt encode_int msg.f_QuoteAcknowledgementQuoteSets_UnderlyingPutOrCall );
    ( "316" , opt encode_float msg.f_QuoteAcknowledgementQuoteSets_UnderlyingStrikePrice );
    ( "317" , opt encode_char msg.f_QuoteAcknowledgementQuoteSets_UnderlyingOptAttribute );
    ( "436" , opt encode_float msg.f_QuoteAcknowledgementQuoteSets_UnderlyingContractMultiplier );
    ( "435" , opt encode_float msg.f_QuoteAcknowledgementQuoteSets_UnderlyingCouponRate );
    ( "308" , opt encode_Exchange msg.f_QuoteAcknowledgementQuoteSets_UnderlyingSecurityExchange );
    ( "306" , opt encode_string msg.f_QuoteAcknowledgementQuoteSets_UnderlyingIssuer );
    ( "362" , opt encode_int msg.f_QuoteAcknowledgementQuoteSets_EncodedUnderlyingIssuerLen );
    ( "363" , opt encode_string msg.f_QuoteAcknowledgementQuoteSets_EncodedUnderlyingIssuer );
    ( "307" , opt encode_string msg.f_QuoteAcknowledgementQuoteSets_UnderlyingSecurityDesc );
    ( "364" , opt encode_int msg.f_QuoteAcknowledgementQuoteSets_EncodedUnderlyingSecurityDescLen );
    ( "365" , opt encode_string msg.f_QuoteAcknowledgementQuoteSets_EncodedUnderlyingSecurityDesc );
    ( "304" , opt encode_int msg.f_QuoteAcknowledgementQuoteSets_TotQuoteEntries );
    ]
;;

let encode_IOIRoutingIDs msg =
    [
    ( "215" , opt encode_int msg.f_IOIRoutingIDs_NoRoutingIDs );
    ( "216" , opt encode_RoutingType msg.f_IOIRoutingIDs_RoutingType );
    ( "217" , opt encode_string msg.f_IOIRoutingIDs_RoutingID );
    ]
;;

let encode_SecurityDefinitionRequestRelatedSym msg =
    [
    ( "146" , opt encode_int msg.f_SecurityDefinitionRequestRelatedSym_NoRelatedSym );
    ( "311" , opt encode_string msg.f_SecurityDefinitionRequestRelatedSym_UnderlyingSymbol );
    ( "312" , opt encode_string msg.f_SecurityDefinitionRequestRelatedSym_UnderlyingSymbolSfx );
    ( "309" , opt encode_string msg.f_SecurityDefinitionRequestRelatedSym_UnderlyingSecurityID );
    ( "305" , opt encode_string msg.f_SecurityDefinitionRequestRelatedSym_UnderlyingIDSource );
    ( "310" , opt encode_string msg.f_SecurityDefinitionRequestRelatedSym_UnderlyingSecurityType );
    ( "313" , opt encode_MonthYear msg.f_SecurityDefinitionRequestRelatedSym_UnderlyingMaturityMonthYear );
    ( "314" , opt encode_int msg.f_SecurityDefinitionRequestRelatedSym_UnderlyingMaturityDay );
    ( "315" , opt encode_int msg.f_SecurityDefinitionRequestRelatedSym_UnderlyingPutOrCall );
    ( "316" , opt encode_float msg.f_SecurityDefinitionRequestRelatedSym_UnderlyingStrikePrice );
    ( "317" , opt encode_char msg.f_SecurityDefinitionRequestRelatedSym_UnderlyingOptAttribute );
    ( "436" , opt encode_float msg.f_SecurityDefinitionRequestRelatedSym_UnderlyingContractMultiplier );
    ( "435" , opt encode_float msg.f_SecurityDefinitionRequestRelatedSym_UnderlyingCouponRate );
    ( "308" , opt encode_Exchange msg.f_SecurityDefinitionRequestRelatedSym_UnderlyingSecurityExchange );
    ( "306" , opt encode_string msg.f_SecurityDefinitionRequestRelatedSym_UnderlyingIssuer );
    ( "362" , opt encode_int msg.f_SecurityDefinitionRequestRelatedSym_EncodedUnderlyingIssuerLen );
    ( "363" , opt encode_string msg.f_SecurityDefinitionRequestRelatedSym_EncodedUnderlyingIssuer );
    ( "307" , opt encode_string msg.f_SecurityDefinitionRequestRelatedSym_UnderlyingSecurityDesc );
    ( "364" , opt encode_int msg.f_SecurityDefinitionRequestRelatedSym_EncodedUnderlyingSecurityDescLen );
    ( "365" , opt encode_string msg.f_SecurityDefinitionRequestRelatedSym_EncodedUnderlyingSecurityDesc );
    ( "319" , opt encode_float msg.f_SecurityDefinitionRequestRelatedSym_RatioQty );
    ( "54" , opt encode_Side msg.f_SecurityDefinitionRequestRelatedSym_Side );
    ( "318" , opt encode_Currency msg.f_SecurityDefinitionRequestRelatedSym_UnderlyingCurrency );
    ]
;;

let encode_QuoteCancelQuoteEntries msg =
    [
    ( "295" , req encode_int msg.f_QuoteCancelQuoteEntries_NoQuoteEntries );
    ( "55" , req encode_string msg.f_QuoteCancelQuoteEntries_Symbol );
    ( "65" , opt encode_string msg.f_QuoteCancelQuoteEntries_SymbolSfx );
    ( "48" , opt encode_string msg.f_QuoteCancelQuoteEntries_SecurityID );
    ( "22" , opt encode_IDSource msg.f_QuoteCancelQuoteEntries_IDSource );
    ( "167" , opt encode_SecurityType msg.f_QuoteCancelQuoteEntries_SecurityType );
    ( "200" , opt encode_MonthYear msg.f_QuoteCancelQuoteEntries_MaturityMonthYear );
    ( "205" , opt encode_int msg.f_QuoteCancelQuoteEntries_MaturityDay );
    ( "201" , opt encode_PutOrCall msg.f_QuoteCancelQuoteEntries_PutOrCall );
    ( "202" , opt encode_float msg.f_QuoteCancelQuoteEntries_StrikePrice );
    ( "206" , opt encode_char msg.f_QuoteCancelQuoteEntries_OptAttribute );
    ( "231" , opt encode_float msg.f_QuoteCancelQuoteEntries_ContractMultiplier );
    ( "223" , opt encode_float msg.f_QuoteCancelQuoteEntries_CouponRate );
    ( "207" , opt encode_Exchange msg.f_QuoteCancelQuoteEntries_SecurityExchange );
    ( "106" , opt encode_string msg.f_QuoteCancelQuoteEntries_Issuer );
    ( "348" , opt encode_int msg.f_QuoteCancelQuoteEntries_EncodedIssuerLen );
    ( "349" , opt encode_string msg.f_QuoteCancelQuoteEntries_EncodedIssuer );
    ( "107" , opt encode_string msg.f_QuoteCancelQuoteEntries_SecurityDesc );
    ( "350" , opt encode_int msg.f_QuoteCancelQuoteEntries_EncodedSecurityDescLen );
    ( "351" , opt encode_string msg.f_QuoteCancelQuoteEntries_EncodedSecurityDesc );
    ( "311" , opt encode_string msg.f_QuoteCancelQuoteEntries_UnderlyingSymbol );
    ]
;;

let encode_IOIIOIQualifiers msg =
    [
    ( "199" , opt encode_int msg.f_IOIIOIQualifiers_NoIOIQualifiers );
    ( "104" , opt encode_IOIQualifier msg.f_IOIIOIQualifiers_IOIQualifier );
    ]
;;

let encode_QuoteRequestRelatedSym msg =
    [
    ( "146" , req encode_int msg.f_QuoteRequestRelatedSym_NoRelatedSym );
    ( "55" , req encode_string msg.f_QuoteRequestRelatedSym_Symbol );
    ( "65" , opt encode_string msg.f_QuoteRequestRelatedSym_SymbolSfx );
    ( "48" , opt encode_string msg.f_QuoteRequestRelatedSym_SecurityID );
    ( "22" , opt encode_IDSource msg.f_QuoteRequestRelatedSym_IDSource );
    ( "167" , opt encode_SecurityType msg.f_QuoteRequestRelatedSym_SecurityType );
    ( "200" , opt encode_MonthYear msg.f_QuoteRequestRelatedSym_MaturityMonthYear );
    ( "205" , opt encode_int msg.f_QuoteRequestRelatedSym_MaturityDay );
    ( "201" , opt encode_PutOrCall msg.f_QuoteRequestRelatedSym_PutOrCall );
    ( "202" , opt encode_float msg.f_QuoteRequestRelatedSym_StrikePrice );
    ( "206" , opt encode_char msg.f_QuoteRequestRelatedSym_OptAttribute );
    ( "231" , opt encode_float msg.f_QuoteRequestRelatedSym_ContractMultiplier );
    ( "223" , opt encode_float msg.f_QuoteRequestRelatedSym_CouponRate );
    ( "207" , opt encode_Exchange msg.f_QuoteRequestRelatedSym_SecurityExchange );
    ( "106" , opt encode_string msg.f_QuoteRequestRelatedSym_Issuer );
    ( "348" , opt encode_int msg.f_QuoteRequestRelatedSym_EncodedIssuerLen );
    ( "349" , opt encode_string msg.f_QuoteRequestRelatedSym_EncodedIssuer );
    ( "107" , opt encode_string msg.f_QuoteRequestRelatedSym_SecurityDesc );
    ( "350" , opt encode_int msg.f_QuoteRequestRelatedSym_EncodedSecurityDescLen );
    ( "351" , opt encode_string msg.f_QuoteRequestRelatedSym_EncodedSecurityDesc );
    ( "140" , opt encode_float msg.f_QuoteRequestRelatedSym_PrevClosePx );
    ( "303" , opt encode_QuoteRequestType msg.f_QuoteRequestRelatedSym_QuoteRequestType );
    ( "336" , opt encode_string msg.f_QuoteRequestRelatedSym_TradingSessionID );
    ( "54" , opt encode_Side msg.f_QuoteRequestRelatedSym_Side );
    ( "38" , opt encode_float msg.f_QuoteRequestRelatedSym_OrderQty );
    ( "64" , opt encode_LocalMktDate msg.f_QuoteRequestRelatedSym_FutSettDate );
    ( "40" , opt encode_OrdType msg.f_QuoteRequestRelatedSym_OrdType );
    ( "193" , opt encode_LocalMktDate msg.f_QuoteRequestRelatedSym_FutSettDate2 );
    ( "192" , opt encode_float msg.f_QuoteRequestRelatedSym_OrderQty2 );
    ( "126" , opt encode_UTCTimestamp msg.f_QuoteRequestRelatedSym_ExpireTime );
    ( "60" , opt encode_UTCTimestamp msg.f_QuoteRequestRelatedSym_TransactTime );
    ( "15" , opt encode_Currency msg.f_QuoteRequestRelatedSym_Currency );
    ]
;;

let encode_MarketDataRequestRelatedSym msg =
    [
    ( "146" , req encode_int msg.f_MarketDataRequestRelatedSym_NoRelatedSym );
    ( "55" , req encode_string msg.f_MarketDataRequestRelatedSym_Symbol );
    ( "65" , opt encode_string msg.f_MarketDataRequestRelatedSym_SymbolSfx );
    ( "48" , opt encode_string msg.f_MarketDataRequestRelatedSym_SecurityID );
    ( "22" , opt encode_IDSource msg.f_MarketDataRequestRelatedSym_IDSource );
    ( "167" , opt encode_SecurityType msg.f_MarketDataRequestRelatedSym_SecurityType );
    ( "200" , opt encode_MonthYear msg.f_MarketDataRequestRelatedSym_MaturityMonthYear );
    ( "205" , opt encode_int msg.f_MarketDataRequestRelatedSym_MaturityDay );
    ( "201" , opt encode_PutOrCall msg.f_MarketDataRequestRelatedSym_PutOrCall );
    ( "202" , opt encode_float msg.f_MarketDataRequestRelatedSym_StrikePrice );
    ( "206" , opt encode_char msg.f_MarketDataRequestRelatedSym_OptAttribute );
    ( "231" , opt encode_float msg.f_MarketDataRequestRelatedSym_ContractMultiplier );
    ( "223" , opt encode_float msg.f_MarketDataRequestRelatedSym_CouponRate );
    ( "207" , opt encode_Exchange msg.f_MarketDataRequestRelatedSym_SecurityExchange );
    ( "106" , opt encode_string msg.f_MarketDataRequestRelatedSym_Issuer );
    ( "348" , opt encode_int msg.f_MarketDataRequestRelatedSym_EncodedIssuerLen );
    ( "349" , opt encode_string msg.f_MarketDataRequestRelatedSym_EncodedIssuer );
    ( "107" , opt encode_string msg.f_MarketDataRequestRelatedSym_SecurityDesc );
    ( "350" , opt encode_int msg.f_MarketDataRequestRelatedSym_EncodedSecurityDescLen );
    ( "351" , opt encode_string msg.f_MarketDataRequestRelatedSym_EncodedSecurityDesc );
    ( "336" , opt encode_string msg.f_MarketDataRequestRelatedSym_TradingSessionID );
    ]
;;

let encode_MarketDataIncrementalRefreshMDEntries msg =
    [
    ( "268" , req encode_int msg.f_MarketDataIncrementalRefreshMDEntries_NoMDEntries );
    ( "279" , req encode_MDUpdateAction msg.f_MarketDataIncrementalRefreshMDEntries_MDUpdateAction );
    ( "285" , opt encode_DeleteReason msg.f_MarketDataIncrementalRefreshMDEntries_DeleteReason );
    ( "269" , opt encode_MDEntryType msg.f_MarketDataIncrementalRefreshMDEntries_MDEntryType );
    ( "278" , opt encode_string msg.f_MarketDataIncrementalRefreshMDEntries_MDEntryID );
    ( "280" , opt encode_string msg.f_MarketDataIncrementalRefreshMDEntries_MDEntryRefID );
    ( "55" , opt encode_string msg.f_MarketDataIncrementalRefreshMDEntries_Symbol );
    ( "65" , opt encode_string msg.f_MarketDataIncrementalRefreshMDEntries_SymbolSfx );
    ( "48" , opt encode_string msg.f_MarketDataIncrementalRefreshMDEntries_SecurityID );
    ( "22" , opt encode_IDSource msg.f_MarketDataIncrementalRefreshMDEntries_IDSource );
    ( "167" , opt encode_SecurityType msg.f_MarketDataIncrementalRefreshMDEntries_SecurityType );
    ( "200" , opt encode_MonthYear msg.f_MarketDataIncrementalRefreshMDEntries_MaturityMonthYear );
    ( "205" , opt encode_int msg.f_MarketDataIncrementalRefreshMDEntries_MaturityDay );
    ( "201" , opt encode_PutOrCall msg.f_MarketDataIncrementalRefreshMDEntries_PutOrCall );
    ( "202" , opt encode_float msg.f_MarketDataIncrementalRefreshMDEntries_StrikePrice );
    ( "206" , opt encode_char msg.f_MarketDataIncrementalRefreshMDEntries_OptAttribute );
    ( "231" , opt encode_float msg.f_MarketDataIncrementalRefreshMDEntries_ContractMultiplier );
    ( "223" , opt encode_float msg.f_MarketDataIncrementalRefreshMDEntries_CouponRate );
    ( "207" , opt encode_Exchange msg.f_MarketDataIncrementalRefreshMDEntries_SecurityExchange );
    ( "106" , opt encode_string msg.f_MarketDataIncrementalRefreshMDEntries_Issuer );
    ( "348" , opt encode_int msg.f_MarketDataIncrementalRefreshMDEntries_EncodedIssuerLen );
    ( "349" , opt encode_string msg.f_MarketDataIncrementalRefreshMDEntries_EncodedIssuer );
    ( "107" , opt encode_string msg.f_MarketDataIncrementalRefreshMDEntries_SecurityDesc );
    ( "350" , opt encode_int msg.f_MarketDataIncrementalRefreshMDEntries_EncodedSecurityDescLen );
    ( "351" , opt encode_string msg.f_MarketDataIncrementalRefreshMDEntries_EncodedSecurityDesc );
    ( "291" , opt encode_FinancialStatus msg.f_MarketDataIncrementalRefreshMDEntries_FinancialStatus );
    ( "292" , opt encode_CorporateAction msg.f_MarketDataIncrementalRefreshMDEntries_CorporateAction );
    ( "270" , opt encode_float msg.f_MarketDataIncrementalRefreshMDEntries_MDEntryPx );
    ( "15" , opt encode_Currency msg.f_MarketDataIncrementalRefreshMDEntries_Currency );
    ( "271" , opt encode_float msg.f_MarketDataIncrementalRefreshMDEntries_MDEntrySize );
    ( "272" , opt encode_UTCDateOnly msg.f_MarketDataIncrementalRefreshMDEntries_MDEntryDate );
    ( "273" , opt encode_UTCTimeOnly msg.f_MarketDataIncrementalRefreshMDEntries_MDEntryTime );
    ( "274" , opt encode_TickDirection msg.f_MarketDataIncrementalRefreshMDEntries_TickDirection );
    ( "275" , opt encode_Exchange msg.f_MarketDataIncrementalRefreshMDEntries_MDMkt );
    ( "336" , opt encode_string msg.f_MarketDataIncrementalRefreshMDEntries_TradingSessionID );
    ( "276" , opt encode_QuoteCondition msg.f_MarketDataIncrementalRefreshMDEntries_QuoteCondition );
    ( "277" , opt encode_TradeCondition msg.f_MarketDataIncrementalRefreshMDEntries_TradeCondition );
    ( "282" , opt encode_string msg.f_MarketDataIncrementalRefreshMDEntries_MDEntryOriginator );
    ( "283" , opt encode_string msg.f_MarketDataIncrementalRefreshMDEntries_LocationID );
    ( "284" , opt encode_string msg.f_MarketDataIncrementalRefreshMDEntries_DeskID );
    ( "286" , opt encode_OpenCloseSettleFlag msg.f_MarketDataIncrementalRefreshMDEntries_OpenCloseSettleFlag );
    ( "59" , opt encode_TimeInForce msg.f_MarketDataIncrementalRefreshMDEntries_TimeInForce );
    ( "432" , opt encode_LocalMktDate msg.f_MarketDataIncrementalRefreshMDEntries_ExpireDate );
    ( "126" , opt encode_UTCTimestamp msg.f_MarketDataIncrementalRefreshMDEntries_ExpireTime );
    ( "110" , opt encode_float msg.f_MarketDataIncrementalRefreshMDEntries_MinQty );
    ( "18" , opt encode_ExecInst msg.f_MarketDataIncrementalRefreshMDEntries_ExecInst );
    ( "287" , opt encode_int msg.f_MarketDataIncrementalRefreshMDEntries_SellerDays );
    ( "37" , opt encode_string msg.f_MarketDataIncrementalRefreshMDEntries_OrderID );
    ( "299" , opt encode_string msg.f_MarketDataIncrementalRefreshMDEntries_QuoteEntryID );
    ( "288" , opt encode_string msg.f_MarketDataIncrementalRefreshMDEntries_MDEntryBuyer );
    ( "289" , opt encode_string msg.f_MarketDataIncrementalRefreshMDEntries_MDEntrySeller );
    ( "346" , opt encode_int msg.f_MarketDataIncrementalRefreshMDEntries_NumberOfOrders );
    ( "290" , opt encode_int msg.f_MarketDataIncrementalRefreshMDEntries_MDEntryPositionNo );
    ( "387" , opt encode_float msg.f_MarketDataIncrementalRefreshMDEntries_TotalVolumeTraded );
    ( "58" , opt encode_string msg.f_MarketDataIncrementalRefreshMDEntries_Text );
    ( "354" , opt encode_int msg.f_MarketDataIncrementalRefreshMDEntries_EncodedTextLen );
    ( "355" , opt encode_string msg.f_MarketDataIncrementalRefreshMDEntries_EncodedText );
    ]
;;

let encode_EmailRelatedSym msg =
    [
    ( "146" , opt encode_int msg.f_EmailRelatedSym_NoRelatedSym );
    ( "46" , opt encode_string msg.f_EmailRelatedSym_RelatdSym );
    ( "65" , opt encode_string msg.f_EmailRelatedSym_SymbolSfx );
    ( "48" , opt encode_string msg.f_EmailRelatedSym_SecurityID );
    ( "22" , opt encode_IDSource msg.f_EmailRelatedSym_IDSource );
    ( "167" , opt encode_SecurityType msg.f_EmailRelatedSym_SecurityType );
    ( "200" , opt encode_MonthYear msg.f_EmailRelatedSym_MaturityMonthYear );
    ( "205" , opt encode_int msg.f_EmailRelatedSym_MaturityDay );
    ( "201" , opt encode_PutOrCall msg.f_EmailRelatedSym_PutOrCall );
    ( "202" , opt encode_float msg.f_EmailRelatedSym_StrikePrice );
    ( "206" , opt encode_char msg.f_EmailRelatedSym_OptAttribute );
    ( "231" , opt encode_float msg.f_EmailRelatedSym_ContractMultiplier );
    ( "223" , opt encode_float msg.f_EmailRelatedSym_CouponRate );
    ( "207" , opt encode_Exchange msg.f_EmailRelatedSym_SecurityExchange );
    ( "106" , opt encode_string msg.f_EmailRelatedSym_Issuer );
    ( "348" , opt encode_int msg.f_EmailRelatedSym_EncodedIssuerLen );
    ( "349" , opt encode_string msg.f_EmailRelatedSym_EncodedIssuer );
    ( "107" , opt encode_string msg.f_EmailRelatedSym_SecurityDesc );
    ( "350" , opt encode_int msg.f_EmailRelatedSym_EncodedSecurityDescLen );
    ( "351" , opt encode_string msg.f_EmailRelatedSym_EncodedSecurityDesc );
    ]
;;

let encode_OrderListTradingSessions msg =
    [
    ( "386" , opt encode_int msg.f_OrderListTradingSessions_NoTradingSessions );
    ( "336" , opt encode_string msg.f_OrderListTradingSessions_TradingSessionID );
    ]
;;

let encode_AllocationAllocs msg =
    [
    ( "78" , opt encode_int msg.f_AllocationAllocs_NoAllocs );
    ( "79" , opt encode_string msg.f_AllocationAllocs_AllocAccount );
    ( "366" , opt encode_float msg.f_AllocationAllocs_AllocPrice );
    ( "80" , req encode_float msg.f_AllocationAllocs_AllocShares );
    ( "81" , opt encode_ProcessCode msg.f_AllocationAllocs_ProcessCode );
    ( "92" , opt encode_string msg.f_AllocationAllocs_BrokerOfCredit );
    ( "208" , opt encode_NotifyBrokerOfCredit msg.f_AllocationAllocs_NotifyBrokerOfCredit );
    ( "209" , opt encode_AllocHandlInst msg.f_AllocationAllocs_AllocHandlInst );
    ( "161" , opt encode_string msg.f_AllocationAllocs_AllocText );
    ( "360" , opt encode_int msg.f_AllocationAllocs_EncodedAllocTextLen );
    ( "361" , opt encode_string msg.f_AllocationAllocs_EncodedAllocText );
    ( "76" , opt encode_string msg.f_AllocationAllocs_ExecBroker );
    ( "109" , opt encode_string msg.f_AllocationAllocs_ClientID );
    ( "12" , opt encode_float msg.f_AllocationAllocs_Commission );
    ( "13" , opt encode_CommType msg.f_AllocationAllocs_CommType );
    ( "153" , opt encode_float msg.f_AllocationAllocs_AllocAvgPx );
    ( "154" , opt encode_float msg.f_AllocationAllocs_AllocNetMoney );
    ( "119" , opt encode_float msg.f_AllocationAllocs_SettlCurrAmt );
    ( "120" , opt encode_Currency msg.f_AllocationAllocs_SettlCurrency );
    ( "155" , opt encode_float msg.f_AllocationAllocs_SettlCurrFxRate );
    ( "156" , opt encode_char msg.f_AllocationAllocs_SettlCurrFxRateCalc );
    ( "159" , opt encode_float msg.f_AllocationAllocs_AccruedInterestAmt );
    ( "160" , opt encode_SettlInstMode msg.f_AllocationAllocs_SettlInstMode );
    ]
;;

let encode_NewsRoutingIDs msg =
    [
    ( "215" , opt encode_int msg.f_NewsRoutingIDs_NoRoutingIDs );
    ( "216" , opt encode_RoutingType msg.f_NewsRoutingIDs_RoutingType );
    ( "217" , opt encode_string msg.f_NewsRoutingIDs_RoutingID );
    ]
;;

let encode_ListStatusOrders msg =
    [
    ( "73" , req encode_int msg.f_ListStatusOrders_NoOrders );
    ( "11" , req encode_string msg.f_ListStatusOrders_ClOrdID );
    ( "14" , req encode_float msg.f_ListStatusOrders_CumQty );
    ( "39" , req encode_OrdStatus msg.f_ListStatusOrders_OrdStatus );
    ( "151" , req encode_float msg.f_ListStatusOrders_LeavesQty );
    ( "84" , req encode_float msg.f_ListStatusOrders_CxlQty );
    ( "6" , req encode_float msg.f_ListStatusOrders_AvgPx );
    ( "103" , opt encode_OrdRejReason msg.f_ListStatusOrders_OrdRejReason );
    ( "58" , opt encode_string msg.f_ListStatusOrders_Text );
    ( "354" , opt encode_int msg.f_ListStatusOrders_EncodedTextLen );
    ( "355" , opt encode_string msg.f_ListStatusOrders_EncodedText );
    ]
;;

let encode_EmailRoutingIDs msg =
    [
    ( "215" , opt encode_int msg.f_EmailRoutingIDs_NoRoutingIDs );
    ( "216" , opt encode_RoutingType msg.f_EmailRoutingIDs_RoutingType );
    ( "217" , opt encode_string msg.f_EmailRoutingIDs_RoutingID );
    ]
;;

let encode_BidResponseBidComponents msg =
    [
    ( "420" , req encode_int msg.f_BidResponseBidComponents_NoBidComponents );
    ( "12" , req encode_float msg.f_BidResponseBidComponents_Commission );
    ( "13" , req encode_CommType msg.f_BidResponseBidComponents_CommType );
    ( "66" , opt encode_string msg.f_BidResponseBidComponents_ListID );
    ( "421" , opt encode_string msg.f_BidResponseBidComponents_Country );
    ( "54" , opt encode_Side msg.f_BidResponseBidComponents_Side );
    ( "44" , opt encode_float msg.f_BidResponseBidComponents_Price );
    ( "423" , opt encode_PriceType msg.f_BidResponseBidComponents_PriceType );
    ( "406" , opt encode_float msg.f_BidResponseBidComponents_FairValue );
    ( "430" , opt encode_NetGrossInd msg.f_BidResponseBidComponents_NetGrossInd );
    ( "63" , opt encode_SettlmntTyp msg.f_BidResponseBidComponents_SettlmntTyp );
    ( "64" , opt encode_LocalMktDate msg.f_BidResponseBidComponents_FutSettDate );
    ( "336" , opt encode_string msg.f_BidResponseBidComponents_TradingSessionID );
    ( "58" , opt encode_string msg.f_BidResponseBidComponents_Text );
    ( "354" , opt encode_int msg.f_BidResponseBidComponents_EncodedTextLen );
    ( "355" , opt encode_string msg.f_BidResponseBidComponents_EncodedText );
    ]
;;

let encode_AllocationExecs msg =
    [
    ( "124" , opt encode_int msg.f_AllocationExecs_NoExecs );
    ( "32" , opt encode_float msg.f_AllocationExecs_LastShares );
    ( "17" , opt encode_string msg.f_AllocationExecs_ExecID );
    ( "31" , opt encode_float msg.f_AllocationExecs_LastPx );
    ( "29" , opt encode_LastCapacity msg.f_AllocationExecs_LastCapacity );
    ]
;;

let encode_BidRequestBidComponents msg =
    [
    ( "420" , opt encode_int msg.f_BidRequestBidComponents_NoBidComponents );
    ( "66" , opt encode_string msg.f_BidRequestBidComponents_ListID );
    ( "54" , opt encode_Side msg.f_BidRequestBidComponents_Side );
    ( "336" , opt encode_string msg.f_BidRequestBidComponents_TradingSessionID );
    ( "430" , opt encode_NetGrossInd msg.f_BidRequestBidComponents_NetGrossInd );
    ( "63" , opt encode_SettlmntTyp msg.f_BidRequestBidComponents_SettlmntTyp );
    ( "64" , opt encode_LocalMktDate msg.f_BidRequestBidComponents_FutSettDate );
    ( "1" , opt encode_string msg.f_BidRequestBidComponents_Account );
    ]
;;

let encode_MarketDataSnapshotFullRefreshMDEntries msg =
    [
    ( "268" , req encode_int msg.f_MarketDataSnapshotFullRefreshMDEntries_NoMDEntries );
    ( "269" , req encode_MDEntryType msg.f_MarketDataSnapshotFullRefreshMDEntries_MDEntryType );
    ( "270" , req encode_float msg.f_MarketDataSnapshotFullRefreshMDEntries_MDEntryPx );
    ( "15" , opt encode_Currency msg.f_MarketDataSnapshotFullRefreshMDEntries_Currency );
    ( "271" , opt encode_float msg.f_MarketDataSnapshotFullRefreshMDEntries_MDEntrySize );
    ( "272" , opt encode_UTCDateOnly msg.f_MarketDataSnapshotFullRefreshMDEntries_MDEntryDate );
    ( "273" , opt encode_UTCTimeOnly msg.f_MarketDataSnapshotFullRefreshMDEntries_MDEntryTime );
    ( "274" , opt encode_TickDirection msg.f_MarketDataSnapshotFullRefreshMDEntries_TickDirection );
    ( "275" , opt encode_Exchange msg.f_MarketDataSnapshotFullRefreshMDEntries_MDMkt );
    ( "336" , opt encode_string msg.f_MarketDataSnapshotFullRefreshMDEntries_TradingSessionID );
    ( "276" , opt encode_QuoteCondition msg.f_MarketDataSnapshotFullRefreshMDEntries_QuoteCondition );
    ( "277" , opt encode_TradeCondition msg.f_MarketDataSnapshotFullRefreshMDEntries_TradeCondition );
    ( "282" , opt encode_string msg.f_MarketDataSnapshotFullRefreshMDEntries_MDEntryOriginator );
    ( "283" , opt encode_string msg.f_MarketDataSnapshotFullRefreshMDEntries_LocationID );
    ( "284" , opt encode_string msg.f_MarketDataSnapshotFullRefreshMDEntries_DeskID );
    ( "286" , opt encode_OpenCloseSettleFlag msg.f_MarketDataSnapshotFullRefreshMDEntries_OpenCloseSettleFlag );
    ( "59" , opt encode_TimeInForce msg.f_MarketDataSnapshotFullRefreshMDEntries_TimeInForce );
    ( "432" , opt encode_LocalMktDate msg.f_MarketDataSnapshotFullRefreshMDEntries_ExpireDate );
    ( "126" , opt encode_UTCTimestamp msg.f_MarketDataSnapshotFullRefreshMDEntries_ExpireTime );
    ( "110" , opt encode_float msg.f_MarketDataSnapshotFullRefreshMDEntries_MinQty );
    ( "18" , opt encode_ExecInst msg.f_MarketDataSnapshotFullRefreshMDEntries_ExecInst );
    ( "287" , opt encode_int msg.f_MarketDataSnapshotFullRefreshMDEntries_SellerDays );
    ( "37" , opt encode_string msg.f_MarketDataSnapshotFullRefreshMDEntries_OrderID );
    ( "299" , opt encode_string msg.f_MarketDataSnapshotFullRefreshMDEntries_QuoteEntryID );
    ( "288" , opt encode_string msg.f_MarketDataSnapshotFullRefreshMDEntries_MDEntryBuyer );
    ( "289" , opt encode_string msg.f_MarketDataSnapshotFullRefreshMDEntries_MDEntrySeller );
    ( "346" , opt encode_int msg.f_MarketDataSnapshotFullRefreshMDEntries_NumberOfOrders );
    ( "290" , opt encode_int msg.f_MarketDataSnapshotFullRefreshMDEntries_MDEntryPositionNo );
    ( "58" , opt encode_string msg.f_MarketDataSnapshotFullRefreshMDEntries_Text );
    ( "354" , opt encode_int msg.f_MarketDataSnapshotFullRefreshMDEntries_EncodedTextLen );
    ( "355" , opt encode_string msg.f_MarketDataSnapshotFullRefreshMDEntries_EncodedText );
    ]
;;

let encode_NewsRelatedSym msg =
    [
    ( "146" , opt encode_int msg.f_NewsRelatedSym_NoRelatedSym );
    ( "46" , opt encode_string msg.f_NewsRelatedSym_RelatdSym );
    ( "65" , opt encode_string msg.f_NewsRelatedSym_SymbolSfx );
    ( "48" , opt encode_string msg.f_NewsRelatedSym_SecurityID );
    ( "22" , opt encode_IDSource msg.f_NewsRelatedSym_IDSource );
    ( "167" , opt encode_SecurityType msg.f_NewsRelatedSym_SecurityType );
    ( "200" , opt encode_MonthYear msg.f_NewsRelatedSym_MaturityMonthYear );
    ( "205" , opt encode_int msg.f_NewsRelatedSym_MaturityDay );
    ( "201" , opt encode_PutOrCall msg.f_NewsRelatedSym_PutOrCall );
    ( "202" , opt encode_float msg.f_NewsRelatedSym_StrikePrice );
    ( "206" , opt encode_char msg.f_NewsRelatedSym_OptAttribute );
    ( "231" , opt encode_float msg.f_NewsRelatedSym_ContractMultiplier );
    ( "223" , opt encode_float msg.f_NewsRelatedSym_CouponRate );
    ( "207" , opt encode_Exchange msg.f_NewsRelatedSym_SecurityExchange );
    ( "106" , opt encode_string msg.f_NewsRelatedSym_Issuer );
    ( "348" , opt encode_int msg.f_NewsRelatedSym_EncodedIssuerLen );
    ( "349" , opt encode_string msg.f_NewsRelatedSym_EncodedIssuer );
    ( "107" , opt encode_string msg.f_NewsRelatedSym_SecurityDesc );
    ( "350" , opt encode_int msg.f_NewsRelatedSym_EncodedSecurityDescLen );
    ( "351" , opt encode_string msg.f_NewsRelatedSym_EncodedSecurityDesc );
    ]
;;

let encode_OrderCancelReplaceRequestAllocs msg =
    [
    ( "78" , opt encode_int msg.f_OrderCancelReplaceRequestAllocs_NoAllocs );
    ( "79" , opt encode_string msg.f_OrderCancelReplaceRequestAllocs_AllocAccount );
    ( "80" , opt encode_float msg.f_OrderCancelReplaceRequestAllocs_AllocShares );
    ]
;;

let encode_LogonMsgTypes msg =
    [
    ( "384" , opt encode_int msg.f_LogonMsgTypes_NoMsgTypes );
    ( "372" , opt encode_string msg.f_LogonMsgTypes_RefMsgType );
    ( "385" , opt encode_MsgDirection msg.f_LogonMsgTypes_MsgDirection );
    ]
;;
