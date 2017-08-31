(* Aesthetic Integration copyright 2017 *)
(* @meta[imandra_ignore] on @end *)
open Base_types;;
open Datetime;;
open Numeric;;
open Full_app_enums;;
(* @meta[imandra_ignore] off @end *)

type fix_rg_inner_allocationorders = {
    (** Indicates number of orders to be combined for allocation. If order(s) were manually delivered set to 1 (one).*)
    f_AllocationOrders_NoOrders : int option;
    (** Order ID assigned by client if order(s) were electronically delivered and executed. If order(s) were manually delivered this field should contain string "MANUAL".*)
    f_AllocationOrders_ClOrdID : fix_string option;
    f_AllocationOrders_OrderID : fix_string option;
    (** Can be used to provide order id used by exchange or executing system.*)
    f_AllocationOrders_SecondaryOrderID : fix_string option;
    (** Required for List Orders.*)
    f_AllocationOrders_ListID : fix_string option;
    f_AllocationOrders_WaveNo : fix_string option
}
;;

type fix_rg_allocationorders = fix_rg_inner_allocationorders list
;;

type fix_rg_inner_bidrequestbidcomponents = {
    (** Used if BidType="Disclosed"*)
    f_BidRequestBidComponents_NoBidComponents : int option;
    (** Required if NoBidComponents > 0. Must be first field in repeating group.*)
    f_BidRequestBidComponents_ListID : fix_string option;
    (** When used in request for a "Disclosed" bid indicates that bid is required on assumption that SideValue1 is Buy or Sell. SideValue2 can be derived by inference.*)
    f_BidRequestBidComponents_Side : fix_side option;
    (** Indicates off-exchange type activities for Detail.*)
    f_BidRequestBidComponents_TradingSessionID : fix_string option;
    (** Indicates Net or Gross for selling Detail.*)
    f_BidRequestBidComponents_NetGrossInd : fix_netgrossind option;
    (** Indicates order settlement period for Detail.*)
    f_BidRequestBidComponents_SettlmntTyp : fix_settlmnttyp option;
    f_BidRequestBidComponents_FutSettDate : fix_localmktdate option;
    f_BidRequestBidComponents_Account : fix_string option
}
;;

type fix_rg_bidrequestbidcomponents = fix_rg_inner_bidrequestbidcomponents list
;;

type fix_rg_inner_allocationmiscfees = {
    (** Required if any miscellaneous fees are reported. Indicates number of repeating entries. Repeating group within Alloc repeating group.
     ** Nested Repeating Group follows ***)
    f_AllocationMiscFees_NoMiscFees : int option;
    (** Required if NoMiscFees > 0*)
    f_AllocationMiscFees_MiscFeeAmt : fix_float option;
    (** Required if NoMiscFees > 0*)
    f_AllocationMiscFees_MiscFeeCurr : fix_currency option;
    (** Required if NoMiscFees > 0*)
    f_AllocationMiscFees_MiscFeeType : fix_miscfeetype option
}
;;

type fix_rg_allocationmiscfees = fix_rg_inner_allocationmiscfees list
;;

type fix_rg_inner_liststatusorders = {
    (** Number of orders statused in this message, i.e. number of repeating groups to follow.*)
    f_ListStatusOrders_NoOrders : int;
    f_ListStatusOrders_ClOrdID : fix_string;
    f_ListStatusOrders_CumQty : fix_float;
    f_ListStatusOrders_OrdStatus : fix_ordstatus;
    (** Amount of shares open for further execution. LeavesQty = OrderQty - CumQty.*)
    f_ListStatusOrders_LeavesQty : fix_float;
    f_ListStatusOrders_CxlQty : fix_float;
    f_ListStatusOrders_AvgPx : fix_float;
    (** Used if the order is rejected*)
    f_ListStatusOrders_OrdRejReason : fix_ordrejreason option;
    f_ListStatusOrders_Text : fix_string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_ListStatusOrders_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_ListStatusOrders_EncodedText : fix_string option
}
;;

type fix_rg_liststatusorders = fix_rg_inner_liststatusorders list
;;

type fix_rg_inner_ordercancelreplacerequesttradingsessions = {
    (** Specifies the number of repeating TradingSessionIDs*)
    f_OrderCancelReplaceRequestTradingSessions_NoTradingSessions : int option;
    (** Required if NoTradingSessions is > 0.*)
    f_OrderCancelReplaceRequestTradingSessions_TradingSessionID : fix_string option
}
;;

type fix_rg_ordercancelreplacerequesttradingsessions = fix_rg_inner_ordercancelreplacerequesttradingsessions list
;;

type fix_rg_inner_orderlistallocs = {
    (** Indicates number of pre-trade allocation accounts to follow*)
    f_OrderListAllocs_NoAllocs : int option;
    (** Required if NoAllocs > 0. Must be the first field in the repeating group.*)
    f_OrderListAllocs_AllocAccount : fix_string option;
    f_OrderListAllocs_AllocShares : fix_float option
}
;;

type fix_rg_orderlistallocs = fix_rg_inner_orderlistallocs list
;;

type fix_rg_inner_emailrelatedsym = {
    (** Specifies the number of repeating symbols specified*)
    f_EmailRelatedSym_NoRelatedSym : int option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_EmailRelatedSym_RelatdSym : fix_string option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_EmailRelatedSym_SymbolSfx : fix_string option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_EmailRelatedSym_SecurityID : fix_string option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_EmailRelatedSym_IDSource : fix_idsource option;
    (** Must be specified if a Future or Option. If a Future: RelatdSym, SecurityType, and MaturityMonthYear are required. If an Option: RelatdSym, SecurityType, MaturityMonthYear, PutOrCall, and StrikePrice are required.*)
    f_EmailRelatedSym_SecurityType : fix_securitytype option;
    (** Specifiesthe month and year of maturity. Required if MaturityDay is specified.*)
    f_EmailRelatedSym_MaturityMonthYear : fix_monthyear option;
    (** Can be used in conjunction with MaturityMonthYear to specify a particular maturity date.*)
    f_EmailRelatedSym_MaturityDay : int option;
    (** For Options.*)
    f_EmailRelatedSym_PutOrCall : fix_putorcall option;
    (** For Options.*)
    f_EmailRelatedSym_StrikePrice : fix_float option;
    (** For Options.*)
    f_EmailRelatedSym_OptAttribute : int option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_EmailRelatedSym_ContractMultiplier : fix_float option;
    (** For Fixed Income.*)
    f_EmailRelatedSym_CouponRate : fix_float option;
    (** Can be used to identify the security.*)
    f_EmailRelatedSym_SecurityExchange : fix_exchange option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_EmailRelatedSym_Issuer : fix_string option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_EmailRelatedSym_EncodedIssuerLen : int option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_EmailRelatedSym_EncodedIssuer : fix_string option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_EmailRelatedSym_SecurityDesc : fix_string option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_EmailRelatedSym_EncodedSecurityDescLen : int option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_EmailRelatedSym_EncodedSecurityDesc : fix_string option
}
;;

type fix_rg_emailrelatedsym = fix_rg_inner_emailrelatedsym list
;;

type fix_rg_inner_orderlistorders = {
    (** Number of orders in this message (number of repeating groups to follow)*)
    f_OrderListOrders_NoOrders : int;
    (** Must be the first field in the repeating group.*)
    f_OrderListOrders_ClOrdID : fix_string;
    (** Order number within the list*)
    f_OrderListOrders_ListSeqNo : int;
    f_OrderListOrders_SettlInstMode : fix_settlinstmode option;
    f_OrderListOrders_ClientID : fix_string option;
    f_OrderListOrders_ExecBroker : fix_string option;
    f_OrderListOrders_Account : fix_string option;
    f_OrderListOrders_SettlmntTyp : fix_settlmnttyp option;
    f_OrderListOrders_FutSettDate : fix_localmktdate option;
    f_OrderListOrders_HandlInst : fix_handlinst option;
    (** Can contain multiple instructions, space delimited. If OrdType=P, exactly one of the following values (ExecInst = L, R, M, P, O, T, or W) must be specified.*)
    f_OrderListOrders_ExecInst : fix_execinst option;
    f_OrderListOrders_MinQty : fix_float option;
    f_OrderListOrders_MaxFloor : fix_float option;
    f_OrderListOrders_ExDestination : fix_exchange option;
    f_OrderListOrders_ProcessCode : fix_processcode option;
    f_OrderListOrders_Symbol : fix_string;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_OrderListOrders_SymbolSfx : fix_string option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_OrderListOrders_SecurityID : fix_string option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_OrderListOrders_IDSource : fix_idsource option;
    (** Must be specified if a Future or Option. If a Future: Symbol, SecurityType, and MaturityMonthYear are required. If an Option: Symbol, SecurityType, MaturityMonthYear, PutOrCall, and StrikePrice are required.*)
    f_OrderListOrders_SecurityType : fix_securitytype option;
    (** Specifiesthe month and year of maturity. Required if MaturityDay is specified.*)
    f_OrderListOrders_MaturityMonthYear : fix_monthyear option;
    (** Can be used in conjunction with MaturityMonthYear to specify a particular maturity date.*)
    f_OrderListOrders_MaturityDay : int option;
    (** For Options.*)
    f_OrderListOrders_PutOrCall : fix_putorcall option;
    (** For Options.*)
    f_OrderListOrders_StrikePrice : fix_float option;
    (** For Options.*)
    f_OrderListOrders_OptAttribute : int option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_OrderListOrders_ContractMultiplier : fix_float option;
    (** For Fixed Income.*)
    f_OrderListOrders_CouponRate : fix_float option;
    (** Can be used to identify the security.*)
    f_OrderListOrders_SecurityExchange : fix_exchange option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_OrderListOrders_Issuer : fix_string option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_OrderListOrders_EncodedIssuerLen : int option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_OrderListOrders_EncodedIssuer : fix_string option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_OrderListOrders_SecurityDesc : fix_string option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_OrderListOrders_EncodedSecurityDescLen : int option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_OrderListOrders_EncodedSecurityDesc : fix_string option;
    (** Useful for verifying security identification*)
    f_OrderListOrders_PrevClosePx : fix_float option;
    (** Note: to indicate the side of SideValue1 or SideValue2, specify Side=Undisclosed and SideValueInd=either the SideValue1 or SideValue2 indicator.*)
    f_OrderListOrders_Side : fix_side;
    (** Refers to the SideValue1 or SideValue2. These are used as opposed to Buy or Sell so that the basket can be quoted either way as Buy or Sell.*)
    f_OrderListOrders_SideValueInd : int option;
    f_OrderListOrders_LocateReqd : fix_locatereqd option;
    f_OrderListOrders_TransactTime : fix_utctimestamp option;
    (** Either CashOrderQty or OrderQty is required. Note that either, but not both, CashOrderQty or OrderQty should be specified.*)
    f_OrderListOrders_OrderQty : fix_float option;
    (** Either CashOrderQty or OrderQty is required. Note that either, but not both, CashOrderQty or OrderQty should be specified. Specifies the approximate "monetary quantity" for the order. Broker is responsible for converting and calculating OrderQty in shares for subsequent messages.*)
    f_OrderListOrders_CashOrderQty : fix_float option;
    f_OrderListOrders_OrdType : fix_ordtype option;
    f_OrderListOrders_Price : fix_float option;
    f_OrderListOrders_StopPx : fix_float option;
    f_OrderListOrders_Currency : fix_currency option;
    f_OrderListOrders_ComplianceID : fix_string option;
    f_OrderListOrders_SolicitedFlag : fix_solicitedflag option;
    (** Required for Previously Indicated Orders (OrdType=E)*)
    f_OrderListOrders_IOIid : fix_string option;
    (** Required for Previously Quoted Orders (OrdType=D)*)
    f_OrderListOrders_QuoteID : fix_string option;
    f_OrderListOrders_TimeInForce : fix_timeinforce option;
    f_OrderListOrders_EffectiveTime : fix_utctimestamp option;
    (** Conditionally required if TimeInForce = GTD and ExpireTime is not specified.*)
    f_OrderListOrders_ExpireDate : fix_localmktdate option;
    (** Conditionally required if TimeInForce = GTD and ExpireDate is not specified.*)
    f_OrderListOrders_ExpireTime : fix_utctimestamp option;
    (** States whether executions are booked out or accumulated on a partially filled GT order*)
    f_OrderListOrders_GTBookingInst : fix_gtbookinginst option;
    f_OrderListOrders_Commission : fix_float option;
    f_OrderListOrders_CommType : fix_commtype option;
    f_OrderListOrders_Rule80A : fix_rule80a option;
    f_OrderListOrders_ForexReq : fix_forexreq option;
    f_OrderListOrders_SettlCurrency : fix_currency option;
    f_OrderListOrders_Text : fix_string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_OrderListOrders_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_OrderListOrders_EncodedText : fix_string option;
    (** Can be used with OrdType = "Forex - Swap" to specify the "value date" for the future portion of a F/X swap.*)
    f_OrderListOrders_FutSettDate2 : fix_localmktdate option;
    (** Can be used with OrdType = "Forex - Swap" to specify the order quantity for the future portion of a F/X swap.*)
    f_OrderListOrders_OrderQty2 : fix_float option;
    f_OrderListOrders_OpenClose : fix_openclose option;
    f_OrderListOrders_CoveredOrUncovered : fix_coveredoruncovered option;
    f_OrderListOrders_CustomerOrFirm : fix_customerorfirm option;
    f_OrderListOrders_MaxShow : fix_float option;
    f_OrderListOrders_PegDifference : fix_float option;
    (** Code to identify the price a DiscretionOffset is related to and should be mathematically added to. Required if DiscretionOffset is specified.*)
    f_OrderListOrders_DiscretionInst : fix_discretioninst option;
    (** Amount (signed) added to the "related to" price specified via DiscretionInst.*)
    f_OrderListOrders_DiscretionOffset : fix_float option;
    f_OrderListOrders_ClearingFirm : fix_string option;
    f_OrderListOrders_ClearingAccount : fix_string option
}
;;

type fix_rg_orderlistorders = fix_rg_inner_orderlistorders list
;;

type fix_rg_inner_allocationallocs = {
    (** Indicates number of allocation groups to follow.*)
    f_AllocationAllocs_NoAllocs : int option;
    (** May be the same value as BrokerOfCredit if ProcessCode is step-out or soft-dollar step-out and Institution does not wish to disclose individual account breakdowns to the ExecBroker. Required if NoAllocs > 0. Must be first field in repeating group.*)
    f_AllocationAllocs_AllocAccount : fix_string option;
    (** Used when performing "executed price" vs. "average price" allocations (e.g. Japan). AllocAccount plus AllocPrice form a unique Allocs entry. Used in lieu of AllocAvgPx.*)
    f_AllocationAllocs_AllocPrice : fix_float option;
    f_AllocationAllocs_AllocShares : fix_float;
    f_AllocationAllocs_ProcessCode : fix_processcode option;
    (** Required if ProcessCode is step-out or soft-dollar step-out*)
    f_AllocationAllocs_BrokerOfCredit : fix_string option;
    f_AllocationAllocs_NotifyBrokerOfCredit : fix_notifybrokerofcredit option;
    f_AllocationAllocs_AllocHandlInst : fix_allochandlinst option;
    (** Free format text field related to this AllocAccount*)
    f_AllocationAllocs_AllocText : fix_string option;
    (** Must be set if EncodedAllocText field is specified and must immediately precede it.*)
    f_AllocationAllocs_EncodedAllocTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the AllocText field in the encoded format specified via the MessageEncoding field.*)
    f_AllocationAllocs_EncodedAllocText : fix_string option;
    (** Required for step-in and step-out trades*)
    f_AllocationAllocs_ExecBroker : fix_string option;
    (** Used for firm identification in third-party transactions (should not be a substitute for OnBehalfOfCompID/DeliverToCompID).*)
    f_AllocationAllocs_ClientID : fix_string option;
    f_AllocationAllocs_Commission : fix_float option;
    f_AllocationAllocs_CommType : fix_commtype option;
    (** AvgPx for this AllocAccount. For F/X orders, should be the "all-in" rate (spot rate adjusted for forward points) for this allocation.*)
    f_AllocationAllocs_AllocAvgPx : fix_float option;
    (** NetMoney for this AllocAccount
     ((AllocShares * AllocAvgPx) - Commission - sum of MiscFeeAmt + AccruedInterestAmt) if a Sell
     ((AllocShares * AllocAvgPx) + Commission + sum of MiscFeeAmt + AccruedInterestAmt) if a Buy*)
    f_AllocationAllocs_AllocNetMoney : fix_float option;
    (** AllocNetMoney in SettlCurrency for this AllocAccount if SettlCurrency is different from "overall" Currency*)
    f_AllocationAllocs_SettlCurrAmt : fix_float option;
    (** SettlCurrency for this AllocAccount if different from "overall" Currency. Required if SettlCurrAmt is specified.*)
    f_AllocationAllocs_SettlCurrency : fix_currency option;
    (** Foreign exchange rate used to compute SettlCurrAmt from Currency to SettlCurrency*)
    f_AllocationAllocs_SettlCurrFxRate : fix_float option;
    (** Specifies whether the SettlCurrFxRate should be multiplied or divided*)
    f_AllocationAllocs_SettlCurrFxRateCalc : int option;
    (** Applicable for Convertible Bonds and fixed income*)
    f_AllocationAllocs_AccruedInterestAmt : fix_float option;
    (** Type of Settlement Instructions which will be provided via Settlement Instructions message (0=Default, 1=Standing Instructions, 2=Specific Allocation Account Overriding, 3=Specific Allocation Account Standing)*)
    f_AllocationAllocs_SettlInstMode : fix_settlinstmode option
}
;;

type fix_rg_allocationallocs = fix_rg_inner_allocationallocs list
;;

type fix_rg_inner_quoterequestrelatedsym = {
    (** Number of related symbols in Request*)
    f_QuoteRequestRelatedSym_NoRelatedSym : int;
    (** Must be the first field in the repeating group.*)
    f_QuoteRequestRelatedSym_Symbol : fix_string;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_QuoteRequestRelatedSym_SymbolSfx : fix_string option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_QuoteRequestRelatedSym_SecurityID : fix_string option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_QuoteRequestRelatedSym_IDSource : fix_idsource option;
    (** Must be specified if a Future or Option. If a Future:Symbol, SecurityType, and MaturityMonthYear are required. If an Option:Symbol, SecurityType, MaturityMonthYear, PutOrCall, and StrikePrice are required.*)
    f_QuoteRequestRelatedSym_SecurityType : fix_securitytype option;
    (** Specifiesthe month and year of maturity. Required if MaturityDay is specified.*)
    f_QuoteRequestRelatedSym_MaturityMonthYear : fix_monthyear option;
    (** Can be used in conjunction with MaturityMonthYear to specify a particular maturity date.*)
    f_QuoteRequestRelatedSym_MaturityDay : int option;
    (** For Options.*)
    f_QuoteRequestRelatedSym_PutOrCall : fix_putorcall option;
    (** For Options.*)
    f_QuoteRequestRelatedSym_StrikePrice : fix_float option;
    (** For Options.*)
    f_QuoteRequestRelatedSym_OptAttribute : int option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_QuoteRequestRelatedSym_ContractMultiplier : fix_float option;
    (** For Fixed Income.*)
    f_QuoteRequestRelatedSym_CouponRate : fix_float option;
    (** Can be used to identify the security.*)
    f_QuoteRequestRelatedSym_SecurityExchange : fix_exchange option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_QuoteRequestRelatedSym_Issuer : fix_string option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_QuoteRequestRelatedSym_EncodedIssuerLen : int option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_QuoteRequestRelatedSym_EncodedIssuer : fix_string option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_QuoteRequestRelatedSym_SecurityDesc : fix_string option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_QuoteRequestRelatedSym_EncodedSecurityDescLen : int option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_QuoteRequestRelatedSym_EncodedSecurityDesc : fix_string option;
    (** Useful for verifying security identification*)
    f_QuoteRequestRelatedSym_PrevClosePx : fix_float option;
    (** Indicates the type of Quote Request (e.g. Manual vs. Automatic) being generated.*)
    f_QuoteRequestRelatedSym_QuoteRequestType : fix_quoterequesttype option;
    f_QuoteRequestRelatedSym_TradingSessionID : fix_string option;
    (** If OrdType = "Forex - Swap", should be the side of the future portion of a F/X swap*)
    f_QuoteRequestRelatedSym_Side : fix_side option;
    f_QuoteRequestRelatedSym_OrderQty : fix_float option;
    (** Can be used with forex quotes to specify the desired "value date"*)
    f_QuoteRequestRelatedSym_FutSettDate : fix_localmktdate option;
    (** Can be used to specify the type of order the quote request is for*)
    f_QuoteRequestRelatedSym_OrdType : fix_ordtype option;
    (** Can be used with OrdType = "Forex - Swap" to specify the "value date" for the future portion of a F/X swap.*)
    f_QuoteRequestRelatedSym_FutSettDate2 : fix_localmktdate option;
    (** Can be used with OrdType = "Forex - Swap" to specify the order quantity for the future portion of a F/X swap.*)
    f_QuoteRequestRelatedSym_OrderQty2 : fix_float option;
    (** The time when Quote Request will expire.*)
    f_QuoteRequestRelatedSym_ExpireTime : fix_utctimestamp option;
    (** Time transaction was entered*)
    f_QuoteRequestRelatedSym_TransactTime : fix_utctimestamp option;
    (** Can be used to specify the currency of the quoted price.*)
    f_QuoteRequestRelatedSym_Currency : fix_currency option
}
;;

type fix_rg_quoterequestrelatedsym = fix_rg_inner_quoterequestrelatedsym list
;;

type fix_rg_inner_quoteacknowledgementquoteentries = {
    (** The number of quotes for this Symbol (QuoteSet) that follow in this message.*)
    f_QuoteAcknowledgementQuoteEntries_NoQuoteEntries : int option;
    (** Uniquely identifies the quote as part of a QuoteSet.
     First field in repeating group. Required if NoQuoteEntries > 0.*)
    f_QuoteAcknowledgementQuoteEntries_QuoteEntryID : fix_string option;
    f_QuoteAcknowledgementQuoteEntries_Symbol : fix_string option;
    f_QuoteAcknowledgementQuoteEntries_SymbolSfx : fix_string option;
    f_QuoteAcknowledgementQuoteEntries_SecurityID : fix_string option;
    f_QuoteAcknowledgementQuoteEntries_IDSource : fix_idsource option;
    (** Must be specified if a Future or Option. If a Future: Symbol, SecurityType, and MaturityMonthYear are required. If an Option: Symbol, SecurityType, MaturityMonthYear, PutOrCall, and StrikePrice are required.*)
    f_QuoteAcknowledgementQuoteEntries_SecurityType : fix_securitytype option;
    (** Specifiesthe month and year of maturity. Required if MaturityDay is specified.*)
    f_QuoteAcknowledgementQuoteEntries_MaturityMonthYear : fix_monthyear option;
    (** Can be used in conjunction with MaturityMonthYear to specify a particular maturity date.*)
    f_QuoteAcknowledgementQuoteEntries_MaturityDay : int option;
    (** For Options.*)
    f_QuoteAcknowledgementQuoteEntries_PutOrCall : fix_putorcall option;
    (** For Options.*)
    f_QuoteAcknowledgementQuoteEntries_StrikePrice : fix_float option;
    (** For Options.*)
    f_QuoteAcknowledgementQuoteEntries_OptAttribute : int option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_QuoteAcknowledgementQuoteEntries_ContractMultiplier : fix_float option;
    (** For Fixed Income.*)
    f_QuoteAcknowledgementQuoteEntries_CouponRate : fix_float option;
    (** Can be used to identify the security.*)
    f_QuoteAcknowledgementQuoteEntries_SecurityExchange : fix_exchange option;
    f_QuoteAcknowledgementQuoteEntries_Issuer : fix_string option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_QuoteAcknowledgementQuoteEntries_EncodedIssuerLen : int option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_QuoteAcknowledgementQuoteEntries_EncodedIssuer : fix_string option;
    f_QuoteAcknowledgementQuoteEntries_SecurityDesc : fix_string option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_QuoteAcknowledgementQuoteEntries_EncodedSecurityDescLen : int option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_QuoteAcknowledgementQuoteEntries_EncodedSecurityDesc : fix_string option;
    (** Reason Quote Entry was rejected.*)
    f_QuoteAcknowledgementQuoteEntries_QuoteEntryRejectReason : fix_quoteentryrejectreason option
}
;;

type fix_rg_quoteacknowledgementquoteentries = fix_rg_inner_quoteacknowledgementquoteentries list
;;

type fix_rg_inner_orderlisttradingsessions = {
    f_OrderListTradingSessions_NoTradingSessions : int option;
    (** First field in repeating group. Required if NoTradingSessions > 0.*)
    f_OrderListTradingSessions_TradingSessionID : fix_string option
}
;;

type fix_rg_orderlisttradingsessions = fix_rg_inner_orderlisttradingsessions list
;;

type fix_rg_inner_massquotequoteentries = {
    (** The number of quotes for this Symbol (QuoteSet) that follow in this message.
     ** Nested Repeating Group follows ***)
    f_MassQuoteQuoteEntries_NoQuoteEntries : int;
    (** Uniquely identifies the quote as part of a QuoteSet.
     Must be used if NoQuoteEntries is used*)
    f_MassQuoteQuoteEntries_QuoteEntryID : fix_string;
    f_MassQuoteQuoteEntries_Symbol : fix_string option;
    f_MassQuoteQuoteEntries_SymbolSfx : fix_string option;
    f_MassQuoteQuoteEntries_SecurityID : fix_string option;
    f_MassQuoteQuoteEntries_IDSource : fix_idsource option;
    (** Must be specified if a Future or Option. If a Future: Symbol, SecurityType, and MaturityMonthYear are required. If an Option: Symbol, SecurityType, MaturityMonthYear, PutOrCall, and StrikePrice are required.*)
    f_MassQuoteQuoteEntries_SecurityType : fix_securitytype option;
    (** Specifiesthe month and year of maturity. Required if MaturityDay is specified.*)
    f_MassQuoteQuoteEntries_MaturityMonthYear : fix_monthyear option;
    (** Can be used in conjunction with MaturityMonthYear to specify a particular maturity date.*)
    f_MassQuoteQuoteEntries_MaturityDay : int option;
    (** For Options.*)
    f_MassQuoteQuoteEntries_PutOrCall : fix_putorcall option;
    (** For Options.*)
    f_MassQuoteQuoteEntries_StrikePrice : fix_float option;
    (** For Options.*)
    f_MassQuoteQuoteEntries_OptAttribute : int option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_MassQuoteQuoteEntries_ContractMultiplier : fix_float option;
    (** For Fixed Income.*)
    f_MassQuoteQuoteEntries_CouponRate : fix_float option;
    (** Can be used to identify the security.*)
    f_MassQuoteQuoteEntries_SecurityExchange : fix_exchange option;
    f_MassQuoteQuoteEntries_Issuer : fix_string option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_MassQuoteQuoteEntries_EncodedIssuerLen : int option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_MassQuoteQuoteEntries_EncodedIssuer : fix_string option;
    f_MassQuoteQuoteEntries_SecurityDesc : fix_string option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_MassQuoteQuoteEntries_EncodedSecurityDescLen : int option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_MassQuoteQuoteEntries_EncodedSecurityDesc : fix_string option;
    (** If F/X quote, should be the "all-in" rate (spot rate adjusted for forward points). Note that either BidPx, OfferPx or both must be specified.*)
    f_MassQuoteQuoteEntries_BidPx : fix_float option;
    (** If F/X quote, should be the "all-in" rate (spot rate adjusted for forward points). Note that either BidPx, OfferPx or both must be specified.*)
    f_MassQuoteQuoteEntries_OfferPx : fix_float option;
    f_MassQuoteQuoteEntries_BidSize : fix_float option;
    f_MassQuoteQuoteEntries_OfferSize : fix_float option;
    f_MassQuoteQuoteEntries_ValidUntilTime : fix_utctimestamp option;
    (** May be applicable for F/X quotes*)
    f_MassQuoteQuoteEntries_BidSpotRate : fix_float option;
    (** May be applicable for F/X quotes*)
    f_MassQuoteQuoteEntries_OfferSpotRate : fix_float option;
    (** May be applicable for F/X quotes*)
    f_MassQuoteQuoteEntries_BidForwardPoints : fix_float option;
    (** May be applicable for F/X quotes*)
    f_MassQuoteQuoteEntries_OfferForwardPoints : fix_float option;
    f_MassQuoteQuoteEntries_TransactTime : fix_utctimestamp option;
    f_MassQuoteQuoteEntries_TradingSessionID : fix_string option;
    (** Can be used with forex quotes to specify a specific "value date"*)
    f_MassQuoteQuoteEntries_FutSettDate : fix_localmktdate option;
    (** Can be used to specify the type of order the quote is for*)
    f_MassQuoteQuoteEntries_OrdType : fix_ordtype option;
    (** Can be used with OrdType = "Forex - Swap" to specify the "value date" for the future portion of a F/X swap.*)
    f_MassQuoteQuoteEntries_FutSettDate2 : fix_localmktdate option;
    (** Can be used with OrdType = "Forex - Swap" to specify the order quantity for the future portion of a F/X swap.*)
    f_MassQuoteQuoteEntries_OrderQty2 : fix_float option;
    (** Can be used to specify the currency of the quoted price.*)
    f_MassQuoteQuoteEntries_Currency : fix_currency option
}
;;

type fix_rg_massquotequoteentries = fix_rg_inner_massquotequoteentries list
;;

type fix_interval = {
    f_interval_start_time : fix_utctimestamp;
    f_interval_duration : fix_duration
}
;;

type fix_rg_inner_marketdataincrementalrefreshmdentries = {
    (** Number of entries following.*)
    f_MarketDataIncrementalRefreshMDEntries_NoMDEntries : int;
    (** Must be first field in this repeating group.*)
    f_MarketDataIncrementalRefreshMDEntries_MDUpdateAction : fix_mdupdateaction;
    (** If MDUpdateAction = Delete(2), can be used to specify a reason for the deletion.*)
    f_MarketDataIncrementalRefreshMDEntries_DeleteReason : fix_deletereason option;
    (** Conditionally required if MDUpdateAction = New(0). Cannot be changed.*)
    f_MarketDataIncrementalRefreshMDEntries_MDEntryType : fix_mdentrytype option;
    (** If specified, must be unique among currently active entries if MDUpdateAction = New (0), must be the same as a previous MDEntryID if MDUpdateAction = Delete (2), and must be the same as a previous MDEntryID if MDUpdateAction = Change (1) and MDEntryRefID is not specified, or must be unique among currently active entries if MDUpdateAction = Change(1) and MDEntryRefID is specified..*)
    f_MarketDataIncrementalRefreshMDEntries_MDEntryID : fix_string option;
    (** If MDUpdateAction = New(0), for the first Market Data Entry in a message, either this field or a Symbol must be specified. If MDUpdateAction = Change(1), this must refer to a previous MDEntryID.*)
    f_MarketDataIncrementalRefreshMDEntries_MDEntryRefID : fix_string option;
    (** Either Symbol or MDEntryRefID must be specified if MDUpdateAction = New(0) for the first Market Data Entry in a message. For subsequent Market Data Entries where MDUpdateAction = New(0), the default is the instrument used in the previous Market Data Entry if neither Symbol nor MDEntryRefID are specified, or in the case of options and futures, the previous instrument with changes specified in MaturityMonthYear, MaturityDay, PutOrCall, StrikePrice, OptAttribute, and SecurityExchange. May not be changed.*)
    f_MarketDataIncrementalRefreshMDEntries_Symbol : fix_string option;
    (** May not be changed.*)
    f_MarketDataIncrementalRefreshMDEntries_SymbolSfx : fix_string option;
    (** May not be changed.*)
    f_MarketDataIncrementalRefreshMDEntries_SecurityID : fix_string option;
    (** May not be changed.*)
    f_MarketDataIncrementalRefreshMDEntries_IDSource : fix_idsource option;
    (** Must be specified if a Future or Option. If a Future: Symbol, SecurityType, and MaturityMonthYear are required. If an Option: Symbol, SecurityType, MaturityMonthYear, PutOrCall, and StrikePrice are required. May not be changed.*)
    f_MarketDataIncrementalRefreshMDEntries_SecurityType : fix_securitytype option;
    (** Specifiesthe month and year of maturity. Required if MaturityDay is specified. May not be changed.*)
    f_MarketDataIncrementalRefreshMDEntries_MaturityMonthYear : fix_monthyear option;
    (** Can be used in conjunction with MaturityMonthYear to specify a particular maturity date. May not be changed.*)
    f_MarketDataIncrementalRefreshMDEntries_MaturityDay : int option;
    (** For Options. May not be changed.*)
    f_MarketDataIncrementalRefreshMDEntries_PutOrCall : fix_putorcall option;
    (** For Options. May not be changed.*)
    f_MarketDataIncrementalRefreshMDEntries_StrikePrice : fix_float option;
    (** For Options. May not be changed.*)
    f_MarketDataIncrementalRefreshMDEntries_OptAttribute : int option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_MarketDataIncrementalRefreshMDEntries_ContractMultiplier : fix_float option;
    (** For Fixed Income.*)
    f_MarketDataIncrementalRefreshMDEntries_CouponRate : fix_float option;
    (** Can be used to identify the security. May not be changed.*)
    f_MarketDataIncrementalRefreshMDEntries_SecurityExchange : fix_exchange option;
    (** May not be changed.*)
    f_MarketDataIncrementalRefreshMDEntries_Issuer : fix_string option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_MarketDataIncrementalRefreshMDEntries_EncodedIssuerLen : int option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_MarketDataIncrementalRefreshMDEntries_EncodedIssuer : fix_string option;
    (** May not be changed.*)
    f_MarketDataIncrementalRefreshMDEntries_SecurityDesc : fix_string option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_MarketDataIncrementalRefreshMDEntries_EncodedSecurityDescLen : int option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_MarketDataIncrementalRefreshMDEntries_EncodedSecurityDesc : fix_string option;
    f_MarketDataIncrementalRefreshMDEntries_FinancialStatus : fix_financialstatus option;
    f_MarketDataIncrementalRefreshMDEntries_CorporateAction : fix_corporateaction option;
    (** Conditionally required when MDUpdateAction = New(0).*)
    f_MarketDataIncrementalRefreshMDEntries_MDEntryPx : fix_float option;
    (** Can be used to specify the currency of the quoted price.*)
    f_MarketDataIncrementalRefreshMDEntries_Currency : fix_currency option;
    (** Conditionally required when MDUpdateAction = New(0) andMDEntryType = Bid(0), Offer(1), or Trade(2).*)
    f_MarketDataIncrementalRefreshMDEntries_MDEntrySize : fix_float option;
    f_MarketDataIncrementalRefreshMDEntries_MDEntryDate : fix_utcdateonly option;
    f_MarketDataIncrementalRefreshMDEntries_MDEntryTime : fix_utctimeonly option;
    f_MarketDataIncrementalRefreshMDEntries_TickDirection : fix_tickdirection option;
    (** Market posting quote / trade. Valid values:
     See Appendix C*)
    f_MarketDataIncrementalRefreshMDEntries_MDMkt : fix_exchange option;
    f_MarketDataIncrementalRefreshMDEntries_TradingSessionID : fix_string option;
    (** Space-delimited list of conditions describing a quote.*)
    f_MarketDataIncrementalRefreshMDEntries_QuoteCondition : fix_quotecondition option;
    (** Space-delimited list of conditions describing a trade*)
    f_MarketDataIncrementalRefreshMDEntries_TradeCondition : fix_tradecondition option;
    f_MarketDataIncrementalRefreshMDEntries_MDEntryOriginator : fix_string option;
    f_MarketDataIncrementalRefreshMDEntries_LocationID : fix_string option;
    f_MarketDataIncrementalRefreshMDEntries_DeskID : fix_string option;
    (** Used if MDEntryType = Opening Price(4), Closing Price(5), or Settlement Price(6).*)
    f_MarketDataIncrementalRefreshMDEntries_OpenCloseSettleFlag : fix_openclosesettleflag option;
    (** For optional use when this Bid or Offer represents an order*)
    f_MarketDataIncrementalRefreshMDEntries_TimeInForce : fix_timeinforce option;
    (** For optional use when this Bid or Offer represents an order. ExpireDate and ExpireTime cannot both be specified in one Market Data Entry.*)
    f_MarketDataIncrementalRefreshMDEntries_ExpireDate : fix_localmktdate option;
    (** For optional use when this Bid or Offer represents an order. ExpireDate and ExpireTime cannot both be specified in one Market Data Entry.*)
    f_MarketDataIncrementalRefreshMDEntries_ExpireTime : fix_utctimestamp option;
    (** For optional use when this Bid or Offer represents an order*)
    f_MarketDataIncrementalRefreshMDEntries_MinQty : fix_float option;
    (** Can contain multiple instructions, space delimited.*)
    f_MarketDataIncrementalRefreshMDEntries_ExecInst : fix_execinst option;
    f_MarketDataIncrementalRefreshMDEntries_SellerDays : int option;
    (** For optional use when this Bid, Offer, or Trade represents an order*)
    f_MarketDataIncrementalRefreshMDEntries_OrderID : fix_string option;
    (** For optional use when this Bid, Offer, or Trade represents a quote*)
    f_MarketDataIncrementalRefreshMDEntries_QuoteEntryID : fix_string option;
    (** For optional use in reporting Trades*)
    f_MarketDataIncrementalRefreshMDEntries_MDEntryBuyer : fix_string option;
    (** For optional use in reporting Trades*)
    f_MarketDataIncrementalRefreshMDEntries_MDEntrySeller : fix_string option;
    (** In an Aggregated Book, used to show how many individual orders make up an MDEntry*)
    f_MarketDataIncrementalRefreshMDEntries_NumberOfOrders : int option;
    (** Display position of a bid or offer, numbered from most competitive to least competitive, per market side, beginning with 1*)
    f_MarketDataIncrementalRefreshMDEntries_MDEntryPositionNo : int option;
    (** Total volume traded in this trading session for this security.*)
    f_MarketDataIncrementalRefreshMDEntries_TotalVolumeTraded : fix_float option;
    (** Text to describe the Market Data Entry. Part of repeating group.*)
    f_MarketDataIncrementalRefreshMDEntries_Text : fix_string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_MarketDataIncrementalRefreshMDEntries_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_MarketDataIncrementalRefreshMDEntries_EncodedText : fix_string option
}
;;

type fix_rg_marketdataincrementalrefreshmdentries = fix_rg_inner_marketdataincrementalrefreshmdentries list
;;

type fix_rg_inner_liststrikepricestrikes = {
    (** Number of strike price entries*)
    f_ListStrikePriceStrikes_NoStrikes : int;
    (** Required if NoStrikes > 0. Must be first field in repeating group.*)
    f_ListStrikePriceStrikes_Symbol : fix_string;
    f_ListStrikePriceStrikes_SymbolSfx : fix_string option;
    f_ListStrikePriceStrikes_SecurityID : fix_string option;
    f_ListStrikePriceStrikes_IDSource : fix_idsource option;
    (** Must be specified if a Future or Option. If a Future: Symbol, SecurityType, and MaturityMonthYear are required. If an Option: Symbol, SecurityType, MaturityMonthYear, PutOrCall, and StrikePrice are required.*)
    f_ListStrikePriceStrikes_SecurityType : fix_securitytype option;
    (** Specifiesthe month and year of maturity. Required if MaturityDay is specified.*)
    f_ListStrikePriceStrikes_MaturityMonthYear : fix_monthyear option;
    (** Can be used in conjunction with MaturityMonthYear to specify a particular maturity date.*)
    f_ListStrikePriceStrikes_MaturityDay : int option;
    (** For Options.*)
    f_ListStrikePriceStrikes_PutOrCall : fix_putorcall option;
    (** For Options.*)
    f_ListStrikePriceStrikes_StrikePrice : fix_float option;
    (** For Options.*)
    f_ListStrikePriceStrikes_OptAttribute : int option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_ListStrikePriceStrikes_ContractMultiplier : fix_float option;
    (** For Fixed Income.*)
    f_ListStrikePriceStrikes_CouponRate : fix_float option;
    (** Can be used to identify the security.*)
    f_ListStrikePriceStrikes_SecurityExchange : fix_exchange option;
    f_ListStrikePriceStrikes_Issuer : fix_string option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_ListStrikePriceStrikes_EncodedIssuerLen : int option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_ListStrikePriceStrikes_EncodedIssuer : fix_string option;
    f_ListStrikePriceStrikes_SecurityDesc : fix_string option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_ListStrikePriceStrikes_EncodedSecurityDescLen : int option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_ListStrikePriceStrikes_EncodedSecurityDesc : fix_string option;
    (** Useful for verifying security identification*)
    f_ListStrikePriceStrikes_PrevClosePx : fix_float option;
    (** Can use client order identifier or the symbol and side to uniquely identify the stock in the list.*)
    f_ListStrikePriceStrikes_ClOrdID : fix_string option;
    f_ListStrikePriceStrikes_Side : fix_side option;
    f_ListStrikePriceStrikes_Price : fix_float;
    f_ListStrikePriceStrikes_Currency : fix_currency option;
    f_ListStrikePriceStrikes_Text : fix_string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_ListStrikePriceStrikes_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_ListStrikePriceStrikes_EncodedText : fix_string option
}
;;

type fix_rg_liststrikepricestrikes = fix_rg_inner_liststrikepricestrikes list
;;

type fix_rg_inner_marketdatarequestrelatedsym = {
    (** Number of symbols requested.*)
    f_MarketDataRequestRelatedSym_NoRelatedSym : int;
    (** Must be the first field in the repeating group.*)
    f_MarketDataRequestRelatedSym_Symbol : fix_string;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_MarketDataRequestRelatedSym_SymbolSfx : fix_string option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_MarketDataRequestRelatedSym_SecurityID : fix_string option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_MarketDataRequestRelatedSym_IDSource : fix_idsource option;
    (** Must be specified if a Future or Option. If a Future:Symbol, SecurityType, and MaturityMonthYear are required. If an Option:Symbol, SecurityType, MaturityMonthYear, PutOrCall, and StrikePrice are required.*)
    f_MarketDataRequestRelatedSym_SecurityType : fix_securitytype option;
    (** Specifiesthe month and year of maturity. Required if MaturityDay is specified.*)
    f_MarketDataRequestRelatedSym_MaturityMonthYear : fix_monthyear option;
    (** Can be used in conjunction with MaturityMonthYear to specify a particular maturity date.*)
    f_MarketDataRequestRelatedSym_MaturityDay : int option;
    (** For Options.*)
    f_MarketDataRequestRelatedSym_PutOrCall : fix_putorcall option;
    (** For Options.*)
    f_MarketDataRequestRelatedSym_StrikePrice : fix_float option;
    (** For Options.*)
    f_MarketDataRequestRelatedSym_OptAttribute : int option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_MarketDataRequestRelatedSym_ContractMultiplier : fix_float option;
    (** For Fixed Income.*)
    f_MarketDataRequestRelatedSym_CouponRate : fix_float option;
    (** Can be used to identify the security.*)
    f_MarketDataRequestRelatedSym_SecurityExchange : fix_exchange option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_MarketDataRequestRelatedSym_Issuer : fix_string option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_MarketDataRequestRelatedSym_EncodedIssuerLen : int option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_MarketDataRequestRelatedSym_EncodedIssuer : fix_string option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_MarketDataRequestRelatedSym_SecurityDesc : fix_string option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_MarketDataRequestRelatedSym_EncodedSecurityDescLen : int option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_MarketDataRequestRelatedSym_EncodedSecurityDesc : fix_string option;
    f_MarketDataRequestRelatedSym_TradingSessionID : fix_string option
}
;;

type fix_rg_marketdatarequestrelatedsym = fix_rg_inner_marketdatarequestrelatedsym list
;;

type fix_rg_inner_logonmsgtypes = {
    (** Specifies the number of repeating MsgTypes specified*)
    f_LogonMsgTypes_NoMsgTypes : int option;
    (** Specifies a specific, supported MsgType. Required if NoMsgTypes is > 0. Should be specified from the point of view of the sender of the Logon message*)
    f_LogonMsgTypes_RefMsgType : fix_string option;
    (** Indicates direction (send vs. receive) of a supported MsgType. Required if NoMsgTypes is > 0. Should be specified from the point of view of the sender of the Logon message*)
    f_LogonMsgTypes_MsgDirection : fix_msgdirection option
}
;;

type fix_rg_logonmsgtypes = fix_rg_inner_logonmsgtypes list
;;

type fix_rg_inner_ordercancelreplacerequestallocs = {
    (** Number of repeating groups for pre-trade allocation*)
    f_OrderCancelReplaceRequestAllocs_NoAllocs : int option;
    (** Required if NoAllocs > 0. Must be first field in repeating group.*)
    f_OrderCancelReplaceRequestAllocs_AllocAccount : fix_string option;
    f_OrderCancelReplaceRequestAllocs_AllocShares : fix_float option
}
;;

type fix_rg_ordercancelreplacerequestallocs = fix_rg_inner_ordercancelreplacerequestallocs list
;;

type fix_rg_inner_emailroutingids = {
    (** Required if any RoutingType and RoutingIDs are specified. Indicates the number within repeating group.*)
    f_EmailRoutingIDs_NoRoutingIDs : int option;
    (** Indicates type of RoutingID. Required if NoRoutingIDs is > 0.*)
    f_EmailRoutingIDs_RoutingType : fix_routingtype option;
    (** Identifies routing destination. Required if NoRoutingIDs is > 0.*)
    f_EmailRoutingIDs_RoutingID : fix_string option
}
;;

type fix_rg_emailroutingids = fix_rg_inner_emailroutingids list
;;

type fix_rg_inner_executionreportcontrabrokers = {
    (** Number of ContraBrokers repeating group instances.*)
    f_ExecutionReportContraBrokers_NoContraBrokers : int option;
    (** First field in repeating group. Required if NoContraBrokers > 0.*)
    f_ExecutionReportContraBrokers_ContraBroker : fix_string option;
    f_ExecutionReportContraBrokers_ContraTrader : fix_string option;
    f_ExecutionReportContraBrokers_ContraTradeQty : fix_float option;
    f_ExecutionReportContraBrokers_ContraTradeTime : fix_utctimestamp option
}
;;

type fix_rg_executionreportcontrabrokers = fix_rg_inner_executionreportcontrabrokers list
;;

type fix_rg_inner_ioiroutingids = {
    (** Required if any RoutingType and RoutingIDs are specified. Indicates the number within repeating group.*)
    f_IOIRoutingIDs_NoRoutingIDs : int option;
    (** Indicates type of RoutingID. Required if NoRoutingIDs is > 0.*)
    f_IOIRoutingIDs_RoutingType : fix_routingtype option;
    (** Identifies routing destination. Required if NoRoutingIDs is > 0.*)
    f_IOIRoutingIDs_RoutingID : fix_string option
}
;;

type fix_rg_ioiroutingids = fix_rg_inner_ioiroutingids list
;;

type fix_rg_inner_quotecancelquoteentries = {
    (** The number of securities whose quotes are to be canceled*)
    f_QuoteCancelQuoteEntries_NoQuoteEntries : int;
    (** Must be the first field in the repeating group.*)
    f_QuoteCancelQuoteEntries_Symbol : fix_string;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_QuoteCancelQuoteEntries_SymbolSfx : fix_string option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_QuoteCancelQuoteEntries_SecurityID : fix_string option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_QuoteCancelQuoteEntries_IDSource : fix_idsource option;
    (** Must be specified if a Future or Option. If a Future:Symbol, SecurityType, and MaturityMonthYear are required. If an Option:Symbol, SecurityType, MaturityMonthYear, PutOrCall, and StrikePrice are required.*)
    f_QuoteCancelQuoteEntries_SecurityType : fix_securitytype option;
    (** Specifiesthe month and year of maturity. Required if MaturityDay is specified.*)
    f_QuoteCancelQuoteEntries_MaturityMonthYear : fix_monthyear option;
    (** Can be used in conjunction with MaturityMonthYear to specify a particular maturity date.*)
    f_QuoteCancelQuoteEntries_MaturityDay : int option;
    (** For Options.*)
    f_QuoteCancelQuoteEntries_PutOrCall : fix_putorcall option;
    (** For Options.*)
    f_QuoteCancelQuoteEntries_StrikePrice : fix_float option;
    (** For Options.*)
    f_QuoteCancelQuoteEntries_OptAttribute : int option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_QuoteCancelQuoteEntries_ContractMultiplier : fix_float option;
    (** For Fixed Income.*)
    f_QuoteCancelQuoteEntries_CouponRate : fix_float option;
    (** Can be used to identify the security.*)
    f_QuoteCancelQuoteEntries_SecurityExchange : fix_exchange option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_QuoteCancelQuoteEntries_Issuer : fix_string option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_QuoteCancelQuoteEntries_EncodedIssuerLen : int option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_QuoteCancelQuoteEntries_EncodedIssuer : fix_string option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_QuoteCancelQuoteEntries_SecurityDesc : fix_string option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_QuoteCancelQuoteEntries_EncodedSecurityDescLen : int option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_QuoteCancelQuoteEntries_EncodedSecurityDesc : fix_string option;
    (** The symbol of the underlying security of options that should be canceled.*)
    f_QuoteCancelQuoteEntries_UnderlyingSymbol : fix_string option
}
;;

type fix_rg_quotecancelquoteentries = fix_rg_inner_quotecancelquoteentries list
;;

type fix_rg_inner_ordersingletradingsessions = {
    (** Specifies the number of repeating TradingSessionIDs*)
    f_OrderSingleTradingSessions_NoTradingSessions : int option;
    (** Required if NoTradingSessions is > 0.*)
    f_OrderSingleTradingSessions_TradingSessionID : fix_string option
}
;;

type fix_rg_ordersingletradingsessions = fix_rg_inner_ordersingletradingsessions list
;;

type fix_rg_inner_bidrequestbiddescriptors = {
    (** Used if BidType="Non Disclosed"*)
    f_BidRequestBidDescriptors_NoBidDescriptors : int option;
    (** Required if NoBidDescriptors > 0. Must be first field in repeating group.*)
    f_BidRequestBidDescriptors_BidDescriptorType : int option;
    f_BidRequestBidDescriptors_BidDescriptor : fix_string option;
    (** Refers to the SideValue1 or SideValue2. These are used as opposed to Buy or Sell so that the basket can be quoted either way as Buy or Sell.*)
    f_BidRequestBidDescriptors_SideValueInd : int option;
    (** Value between LiquidityPctLow and LiquidityPctHigh in Currency*)
    f_BidRequestBidDescriptors_LiquidityValue : fix_float option;
    (** Number of Securites between LiquidityPctLow and LiquidityPctHigh in Currency*)
    f_BidRequestBidDescriptors_LiquidityNumSecurities : int option;
    (** Liquidity indicator or lower limit if LiquidityNumSecurities > 1*)
    f_BidRequestBidDescriptors_LiquidityPctLow : fix_float option;
    (** Upper liquidity indicator if LiquidityNumSecurities > 1*)
    f_BidRequestBidDescriptors_LiquidityPctHigh : fix_float option;
    (** Eg Used in EFP (Exchange For Physical) trades 12%*)
    f_BidRequestBidDescriptors_EFPTrackingError : fix_float option;
    (** Used in EFP trades*)
    f_BidRequestBidDescriptors_FairValue : fix_float option;
    (** Used in EFP trades*)
    f_BidRequestBidDescriptors_OutsideIndexPct : fix_float option;
    (** Used in EFP trades*)
    f_BidRequestBidDescriptors_ValueOfFutures : fix_float option
}
;;

type fix_rg_bidrequestbiddescriptors = fix_rg_inner_bidrequestbiddescriptors list
;;

type fix_rg_inner_securitydefinitionrelatedsym = {
    (** Number of legs that make up the Security*)
    f_SecurityDefinitionRelatedSym_NoRelatedSym : int option;
    (** Must be specified as the first field in the repeating group. Required if NoRelatedSym > 0.*)
    f_SecurityDefinitionRelatedSym_UnderlyingSymbol : fix_string option;
    f_SecurityDefinitionRelatedSym_UnderlyingSymbolSfx : fix_string option;
    f_SecurityDefinitionRelatedSym_UnderlyingSecurityID : fix_string option;
    f_SecurityDefinitionRelatedSym_UnderlyingIDSource : fix_string option;
    (** Must be specified if a Future or Option. If a Future: UnderlyingSymbol, UnderlyingSecurityType, and UnderlyingMaturityMonthYear are required. If an Option: UnderlyingSymbol, UnderlyingSecurityType, UnderlyingMaturityMonthYear, PutOrCall, and UnderlyingStrikePrice are required.*)
    f_SecurityDefinitionRelatedSym_UnderlyingSecurityType : fix_string option;
    (** Specifiesthe month and year of maturity. Required if UnderlyingMaturityDay is specified.*)
    f_SecurityDefinitionRelatedSym_UnderlyingMaturityMonthYear : fix_monthyear option;
    (** Can be used in conjunction with UnderlyingMaturityMonthYear to specify a particular maturity date.*)
    f_SecurityDefinitionRelatedSym_UnderlyingMaturityDay : int option;
    (** For Options.*)
    f_SecurityDefinitionRelatedSym_UnderlyingPutOrCall : int option;
    (** For Options.*)
    f_SecurityDefinitionRelatedSym_UnderlyingStrikePrice : fix_float option;
    (** For Options.*)
    f_SecurityDefinitionRelatedSym_UnderlyingOptAttribute : int option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc.*)
    f_SecurityDefinitionRelatedSym_UnderlyingContractMultiplier : fix_float option;
    (** For Fixed Income.*)
    f_SecurityDefinitionRelatedSym_UnderlyingCouponRate : fix_float option;
    (** Can be used to identify the security.*)
    f_SecurityDefinitionRelatedSym_UnderlyingSecurityExchange : fix_exchange option;
    f_SecurityDefinitionRelatedSym_UnderlyingIssuer : fix_string option;
    (** Must be set if EncodedUnderlyingIssuer field is specified and must immediately precede it.*)
    f_SecurityDefinitionRelatedSym_EncodedUnderlyingIssuerLen : int option;
    (** Encoded (non-ASCII characters) representation of the UnderlyingIssuer field in the encoded format specified via the MessageEncoding field.*)
    f_SecurityDefinitionRelatedSym_EncodedUnderlyingIssuer : fix_string option;
    f_SecurityDefinitionRelatedSym_UnderlyingSecurityDesc : fix_string option;
    (** Must be set if EncodedUnderlyingSecurityDesc field is specified and must immediately precede it.*)
    f_SecurityDefinitionRelatedSym_EncodedUnderlyingSecurityDescLen : int option;
    (** Encoded (non-ASCII characters) representation of the UnderlyingSecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_SecurityDefinitionRelatedSym_EncodedUnderlyingSecurityDesc : fix_string option;
    (** Quantity of particular leg in the Security*)
    f_SecurityDefinitionRelatedSym_RatioQty : fix_float option;
    (** Indicates if this leg of the security is to be Bought or Sold as part of this complex security.*)
    f_SecurityDefinitionRelatedSym_Side : fix_side option;
    f_SecurityDefinitionRelatedSym_UnderlyingCurrency : fix_currency option
}
;;

type fix_rg_securitydefinitionrelatedsym = fix_rg_inner_securitydefinitionrelatedsym list
;;

type fix_rg_inner_ioiioiqualifiers = {
    (** Required if any IOIQualifiers are specified. Indicates the number of repeating IOIQualifiers.*)
    f_IOIIOIQualifiers_NoIOIQualifiers : int option;
    (** Required if NoIOIQualifiers > 0*)
    f_IOIIOIQualifiers_IOIQualifier : fix_ioiqualifier option
}
;;

type fix_rg_ioiioiqualifiers = fix_rg_inner_ioiioiqualifiers list
;;

type fix_rg_inner_newsroutingids = {
    (** Required if any RoutingType and RoutingIDs are specified. Indicates the number within repeating group.*)
    f_NewsRoutingIDs_NoRoutingIDs : int option;
    (** Indicates type of RoutingID. Required if NoRoutingIDs is > 0.*)
    f_NewsRoutingIDs_RoutingType : fix_routingtype option;
    (** Identifies routing destination. Required if NoRoutingIDs is > 0.*)
    f_NewsRoutingIDs_RoutingID : fix_string option
}
;;

type fix_rg_newsroutingids = fix_rg_inner_newsroutingids list
;;

type fix_rg_inner_massquotequotesets = {
    (** The number of sets of quotes in the message*)
    f_MassQuoteQuoteSets_NoQuoteSets : int;
    (** Sequential number for the Quote Set. For a given QuoteID – assumed to start at 1.
     Must be the first field in the repeating group.*)
    f_MassQuoteQuoteSets_QuoteSetID : fix_string;
    f_MassQuoteQuoteSets_UnderlyingSymbol : fix_string;
    f_MassQuoteQuoteSets_UnderlyingSymbolSfx : fix_string option;
    f_MassQuoteQuoteSets_UnderlyingSecurityID : fix_string option;
    f_MassQuoteQuoteSets_UnderlyingIDSource : fix_string option;
    f_MassQuoteQuoteSets_UnderlyingSecurityType : fix_string option;
    (** Required if UnderlyingMaturityDay is specified.*)
    f_MassQuoteQuoteSets_UnderlyingMaturityMonthYear : fix_monthyear option;
    f_MassQuoteQuoteSets_UnderlyingMaturityDay : int option;
    f_MassQuoteQuoteSets_UnderlyingPutOrCall : int option;
    f_MassQuoteQuoteSets_UnderlyingStrikePrice : fix_float option;
    f_MassQuoteQuoteSets_UnderlyingOptAttribute : int option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc.*)
    f_MassQuoteQuoteSets_UnderlyingContractMultiplier : fix_float option;
    (** For Fixed Income.*)
    f_MassQuoteQuoteSets_UnderlyingCouponRate : fix_float option;
    f_MassQuoteQuoteSets_UnderlyingSecurityExchange : fix_exchange option;
    f_MassQuoteQuoteSets_UnderlyingIssuer : fix_string option;
    (** Must be set if EncodedUnderlyingIssuer field is specified and must immediately precede it.*)
    f_MassQuoteQuoteSets_EncodedUnderlyingIssuerLen : int option;
    (** Encoded (non-ASCII characters) representation of the UnderlyingIssuer field in the encoded format specified via the MessageEncoding field.*)
    f_MassQuoteQuoteSets_EncodedUnderlyingIssuer : fix_string option;
    f_MassQuoteQuoteSets_UnderlyingSecurityDesc : fix_string option;
    (** Must be set if EncodedUnderlyingSecurityDesc field is specified and must immediately precede it.*)
    f_MassQuoteQuoteSets_EncodedUnderlyingSecurityDescLen : int option;
    (** Encoded (non-ASCII characters) representation of the UnderlyingSecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_MassQuoteQuoteSets_EncodedUnderlyingSecurityDesc : fix_string option;
    f_MassQuoteQuoteSets_QuoteSetValidUntilTime : fix_utctimestamp option;
    (** Total number of quotes for the quote set across all messages. Should be the sum of all NoQuoteEntries in each message that has repeating quotes that are part of the same quote set.*)
    f_MassQuoteQuoteSets_TotQuoteEntries : int
}
;;

type fix_rg_massquotequotesets = fix_rg_inner_massquotequotesets list
;;

type fix_rg_inner_bidresponsebidcomponents = {
    (** Number of bid repeating groups*)
    f_BidResponseBidComponents_NoBidComponents : int;
    (** First element of price. Required if NoBidComponents > 0.*)
    f_BidResponseBidComponents_Commission : fix_float;
    f_BidResponseBidComponents_CommType : fix_commtype;
    f_BidResponseBidComponents_ListID : fix_string option;
    (** ISO Country Code*)
    f_BidResponseBidComponents_Country : fix_string option;
    (** When used in response to a "Disclosed" request indicates whether SideValue1 is Buy or Sell. SideValue2 can be derived by inference.*)
    f_BidResponseBidComponents_Side : fix_side option;
    (** Second element of price*)
    f_BidResponseBidComponents_Price : fix_float option;
    f_BidResponseBidComponents_PriceType : fix_pricetype option;
    (** The difference between the value of a future and the value of the underlying equities after allowing for the discounted cash flows associated with the underlying stocks (E.g. Dividends etc).*)
    f_BidResponseBidComponents_FairValue : fix_float option;
    (** Net/Gross*)
    f_BidResponseBidComponents_NetGrossInd : fix_netgrossind option;
    (** Indicates order settlement period for Detail.*)
    f_BidResponseBidComponents_SettlmntTyp : fix_settlmnttyp option;
    f_BidResponseBidComponents_FutSettDate : fix_localmktdate option;
    f_BidResponseBidComponents_TradingSessionID : fix_string option;
    f_BidResponseBidComponents_Text : fix_string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_BidResponseBidComponents_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_BidResponseBidComponents_EncodedText : fix_string option
}
;;

type fix_rg_bidresponsebidcomponents = fix_rg_inner_bidresponsebidcomponents list
;;

type fix_rg_inner_quoteacknowledgementquotesets = {
    (** The number of sets of quotes in the message*)
    f_QuoteAcknowledgementQuoteSets_NoQuoteSets : int option;
    (** First field in repeating group. Required if NoQuoteSets > 0*)
    f_QuoteAcknowledgementQuoteSets_QuoteSetID : fix_string option;
    (** Required if NoQuoteSets > 0*)
    f_QuoteAcknowledgementQuoteSets_UnderlyingSymbol : fix_string option;
    f_QuoteAcknowledgementQuoteSets_UnderlyingSymbolSfx : fix_string option;
    f_QuoteAcknowledgementQuoteSets_UnderlyingSecurityID : fix_string option;
    f_QuoteAcknowledgementQuoteSets_UnderlyingIDSource : fix_string option;
    f_QuoteAcknowledgementQuoteSets_UnderlyingSecurityType : fix_string option;
    (** Required if UnderlyingMaturityDay is specified.*)
    f_QuoteAcknowledgementQuoteSets_UnderlyingMaturityMonthYear : fix_monthyear option;
    f_QuoteAcknowledgementQuoteSets_UnderlyingMaturityDay : int option;
    f_QuoteAcknowledgementQuoteSets_UnderlyingPutOrCall : int option;
    f_QuoteAcknowledgementQuoteSets_UnderlyingStrikePrice : fix_float option;
    f_QuoteAcknowledgementQuoteSets_UnderlyingOptAttribute : int option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc.*)
    f_QuoteAcknowledgementQuoteSets_UnderlyingContractMultiplier : fix_float option;
    (** For Fixed Income.*)
    f_QuoteAcknowledgementQuoteSets_UnderlyingCouponRate : fix_float option;
    f_QuoteAcknowledgementQuoteSets_UnderlyingSecurityExchange : fix_exchange option;
    f_QuoteAcknowledgementQuoteSets_UnderlyingIssuer : fix_string option;
    (** Must be set if EncodedUnderlyingIssuer field is specified and must immediately precede it.*)
    f_QuoteAcknowledgementQuoteSets_EncodedUnderlyingIssuerLen : int option;
    (** Encoded (non-ASCII characters) representation of the UnderlyingIssuer field in the encoded format specified via the MessageEncoding field.*)
    f_QuoteAcknowledgementQuoteSets_EncodedUnderlyingIssuer : fix_string option;
    f_QuoteAcknowledgementQuoteSets_UnderlyingSecurityDesc : fix_string option;
    (** Must be set if EncodedUnderlyingSecurityDesc field is specified and must immediately precede it.*)
    f_QuoteAcknowledgementQuoteSets_EncodedUnderlyingSecurityDescLen : int option;
    (** Encoded (non-ASCII characters) representation of the UnderlyingSecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_QuoteAcknowledgementQuoteSets_EncodedUnderlyingSecurityDesc : fix_string option;
    (** Total number of quotes for the quote set across all messages. Should be the sum of all NoQuoteEntries in each message that has repeating quotes that are part of the same quote set.
     Required if NoQuoteEntries > 0*)
    f_QuoteAcknowledgementQuoteSets_TotQuoteEntries : int option
}
;;

type fix_rg_quoteacknowledgementquotesets = fix_rg_inner_quoteacknowledgementquotesets list
;;

type fix_rg_inner_newslinesoftext = {
    (** Specifies the number of repeating lines of text specified*)
    f_NewsLinesOfText_LinesOfText : int;
    (** Repeating field, number of instances defined in LinesOfText*)
    f_NewsLinesOfText_Text : fix_string;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_NewsLinesOfText_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_NewsLinesOfText_EncodedText : fix_string option
}
;;

type fix_rg_newslinesoftext = fix_rg_inner_newslinesoftext list
;;

type fix_rg_inner_newsrelatedsym = {
    (** Specifies the number of repeating symbols specified*)
    f_NewsRelatedSym_NoRelatedSym : int option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_NewsRelatedSym_RelatdSym : fix_string option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_NewsRelatedSym_SymbolSfx : fix_string option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_NewsRelatedSym_SecurityID : fix_string option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_NewsRelatedSym_IDSource : fix_idsource option;
    (** Must be specified if a Future or Option. If a Future: RelatdSym, SecurityType, and MaturityMonthYear are required. If an Option: RelatdSym, SecurityType, MaturityMonthYear, PutOrCall, and StrikePrice are required.*)
    f_NewsRelatedSym_SecurityType : fix_securitytype option;
    (** Specifiesthe month and year of maturity. Required if MaturityDay is specified.*)
    f_NewsRelatedSym_MaturityMonthYear : fix_monthyear option;
    (** Can be used in conjunction with MaturityMonthYear to specify a particular maturity date.*)
    f_NewsRelatedSym_MaturityDay : int option;
    (** For Options.*)
    f_NewsRelatedSym_PutOrCall : fix_putorcall option;
    (** For Options.*)
    f_NewsRelatedSym_StrikePrice : fix_float option;
    (** For Options.*)
    f_NewsRelatedSym_OptAttribute : int option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_NewsRelatedSym_ContractMultiplier : fix_float option;
    (** For Fixed Income.*)
    f_NewsRelatedSym_CouponRate : fix_float option;
    (** Can be used to identify the security.*)
    f_NewsRelatedSym_SecurityExchange : fix_exchange option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_NewsRelatedSym_Issuer : fix_string option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_NewsRelatedSym_EncodedIssuerLen : int option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_NewsRelatedSym_EncodedIssuer : fix_string option;
    (** Can be repeated multiple times if message is related to multiple symbols.*)
    f_NewsRelatedSym_SecurityDesc : fix_string option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_NewsRelatedSym_EncodedSecurityDescLen : int option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_NewsRelatedSym_EncodedSecurityDesc : fix_string option
}
;;

type fix_rg_newsrelatedsym = fix_rg_inner_newsrelatedsym list
;;

type fix_rg_inner_allocationexecs = {
    (** Indicates number of individual execution repeating group entries to follow. Absence of this field indicates that no individual execution entries are included. Primarily used to support step-outs.*)
    f_AllocationExecs_NoExecs : int option;
    (** Number of shares in individual execution. Required if NoExecs > 0*)
    f_AllocationExecs_LastShares : fix_float option;
    f_AllocationExecs_ExecID : fix_string option;
    (** Price of individual execution. Required if NoExecs > 0*)
    f_AllocationExecs_LastPx : fix_float option;
    (** Can be specified by broker for AllocTransTyp=Calculated*)
    f_AllocationExecs_LastCapacity : fix_lastcapacity option
}
;;

type fix_rg_allocationexecs = fix_rg_inner_allocationexecs list
;;

type fix_rg_inner_ordersingleallocs = {
    (** Number of repeating groups for pre-trade allocation*)
    f_OrderSingleAllocs_NoAllocs : int option;
    (** Required if NoAllocs > 0. Must be first field in repeating group.*)
    f_OrderSingleAllocs_AllocAccount : fix_string option;
    f_OrderSingleAllocs_AllocShares : fix_float option
}
;;

type fix_rg_ordersingleallocs = fix_rg_inner_ordersingleallocs list
;;

type fix_rg_inner_securitydefinitionrequestrelatedsym = {
    (** Number of legs that make up the Security*)
    f_SecurityDefinitionRequestRelatedSym_NoRelatedSym : int option;
    (** The UnderlyingSymbol must be specified as the first field in the repeating group.
     Required if NoRelatedSym > 0.*)
    f_SecurityDefinitionRequestRelatedSym_UnderlyingSymbol : fix_string option;
    f_SecurityDefinitionRequestRelatedSym_UnderlyingSymbolSfx : fix_string option;
    f_SecurityDefinitionRequestRelatedSym_UnderlyingSecurityID : fix_string option;
    f_SecurityDefinitionRequestRelatedSym_UnderlyingIDSource : fix_string option;
    (** Must be specified if a Future or Option. If a Future: UnderlyingSymbol, UnderlyingSecurityType, and UnderlyingMaturityMonthYear are required. If an Option: UnderlyingSymbol, UnderlyingSecurityType, UnderlyingMaturityMonthYear, UnderlyingPutOrCall, and UnderlyingStrikePrice are required.*)
    f_SecurityDefinitionRequestRelatedSym_UnderlyingSecurityType : fix_string option;
    (** Specifiesthe month and year of maturity. Required if UnderlyingMaturityDay is specified.*)
    f_SecurityDefinitionRequestRelatedSym_UnderlyingMaturityMonthYear : fix_monthyear option;
    (** Can be used in conjunction with UnderlyingMaturityMonthYear to specify a particular maturity date.*)
    f_SecurityDefinitionRequestRelatedSym_UnderlyingMaturityDay : int option;
    (** For Options.*)
    f_SecurityDefinitionRequestRelatedSym_UnderlyingPutOrCall : int option;
    (** For Options.*)
    f_SecurityDefinitionRequestRelatedSym_UnderlyingStrikePrice : fix_float option;
    (** For Options.*)
    f_SecurityDefinitionRequestRelatedSym_UnderlyingOptAttribute : int option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc.*)
    f_SecurityDefinitionRequestRelatedSym_UnderlyingContractMultiplier : fix_float option;
    (** For Fixed Income.*)
    f_SecurityDefinitionRequestRelatedSym_UnderlyingCouponRate : fix_float option;
    (** Can be used to identify the security.*)
    f_SecurityDefinitionRequestRelatedSym_UnderlyingSecurityExchange : fix_exchange option;
    f_SecurityDefinitionRequestRelatedSym_UnderlyingIssuer : fix_string option;
    (** Must be set if EncodedUnderlyingIssuer field is specified and must immediately precede it.*)
    f_SecurityDefinitionRequestRelatedSym_EncodedUnderlyingIssuerLen : int option;
    (** Encoded (non-ASCII characters) representation of the UnderlyingIssuer field in the encoded format specified via the MessageEncoding field.*)
    f_SecurityDefinitionRequestRelatedSym_EncodedUnderlyingIssuer : fix_string option;
    f_SecurityDefinitionRequestRelatedSym_UnderlyingSecurityDesc : fix_string option;
    (** Must be set if EncodedUnderlyingSecurityDesc field is specified and must immediately precede it.*)
    f_SecurityDefinitionRequestRelatedSym_EncodedUnderlyingSecurityDescLen : int option;
    (** Encoded (non-ASCII characters) representation of the UnderlyingSecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_SecurityDefinitionRequestRelatedSym_EncodedUnderlyingSecurityDesc : fix_string option;
    (** Quantity of particular leg in the Security*)
    f_SecurityDefinitionRequestRelatedSym_RatioQty : fix_float option;
    (** Indicates if this leg of the security is to be Bought or Sold as part of this complex security.*)
    f_SecurityDefinitionRequestRelatedSym_Side : fix_side option;
    f_SecurityDefinitionRequestRelatedSym_UnderlyingCurrency : fix_currency option
}
;;

type fix_rg_securitydefinitionrequestrelatedsym = fix_rg_inner_securitydefinitionrequestrelatedsym list
;;

type fix_rg_inner_marketdatarequestmdentrytypes = {
    (** Number of MDEntryType fields requested.*)
    f_MarketDataRequestMDEntryTypes_NoMDEntryTypes : int;
    (** Must be the first field in this repeating group. This is a list of all the types of Market Data Entries that the firm requesting the Market Data is interested in receiving.*)
    f_MarketDataRequestMDEntryTypes_MDEntryType : fix_mdentrytype
}
;;

type fix_rg_marketdatarequestmdentrytypes = fix_rg_inner_marketdatarequestmdentrytypes list
;;

type fix_rg_inner_marketdatasnapshotfullrefreshmdentries = {
    (** Number of entries following.*)
    f_MarketDataSnapshotFullRefreshMDEntries_NoMDEntries : int;
    (** Must be the first field in this repeating group.*)
    f_MarketDataSnapshotFullRefreshMDEntries_MDEntryType : fix_mdentrytype;
    f_MarketDataSnapshotFullRefreshMDEntries_MDEntryPx : fix_float;
    (** Can be used to specify the currency of the quoted price.*)
    f_MarketDataSnapshotFullRefreshMDEntries_Currency : fix_currency option;
    (** Conditionally required if MDEntryType = Bid(0), Offer(1), or Trade(2)*)
    f_MarketDataSnapshotFullRefreshMDEntries_MDEntrySize : fix_float option;
    f_MarketDataSnapshotFullRefreshMDEntries_MDEntryDate : fix_utcdateonly option;
    f_MarketDataSnapshotFullRefreshMDEntries_MDEntryTime : fix_utctimeonly option;
    f_MarketDataSnapshotFullRefreshMDEntries_TickDirection : fix_tickdirection option;
    (** Market posting quote / trade. Valid values:
     See Appendix C*)
    f_MarketDataSnapshotFullRefreshMDEntries_MDMkt : fix_exchange option;
    f_MarketDataSnapshotFullRefreshMDEntries_TradingSessionID : fix_string option;
    (** Space-delimited list of conditions describing a quote.*)
    f_MarketDataSnapshotFullRefreshMDEntries_QuoteCondition : fix_quotecondition option;
    (** Space-delimited list of conditions describing a trade*)
    f_MarketDataSnapshotFullRefreshMDEntries_TradeCondition : fix_tradecondition option;
    f_MarketDataSnapshotFullRefreshMDEntries_MDEntryOriginator : fix_string option;
    f_MarketDataSnapshotFullRefreshMDEntries_LocationID : fix_string option;
    f_MarketDataSnapshotFullRefreshMDEntries_DeskID : fix_string option;
    (** Used if MDEntryType = Opening Price(4), Closing Price(5), or Settlement Price(6).*)
    f_MarketDataSnapshotFullRefreshMDEntries_OpenCloseSettleFlag : fix_openclosesettleflag option;
    (** For optional use when this Bid or Offer represents an order*)
    f_MarketDataSnapshotFullRefreshMDEntries_TimeInForce : fix_timeinforce option;
    (** For optional use when this Bid or Offer represents an order. ExpireDate and ExpireTime cannot both be specified in one Market Data Entry.*)
    f_MarketDataSnapshotFullRefreshMDEntries_ExpireDate : fix_localmktdate option;
    (** For optional use when this Bid or Offer represents an order. ExpireDate and ExpireTime cannot both be specified in one Market Data Entry.*)
    f_MarketDataSnapshotFullRefreshMDEntries_ExpireTime : fix_utctimestamp option;
    (** For optional use when this Bid or Offer represents an order*)
    f_MarketDataSnapshotFullRefreshMDEntries_MinQty : fix_float option;
    (** Can contain multiple instructions, space delimited.*)
    f_MarketDataSnapshotFullRefreshMDEntries_ExecInst : fix_execinst option;
    f_MarketDataSnapshotFullRefreshMDEntries_SellerDays : int option;
    (** For optional use when this Bid, Offer, or Trade represents an order*)
    f_MarketDataSnapshotFullRefreshMDEntries_OrderID : fix_string option;
    (** For optional use when this Bid, Offer, or Trade represents a quote*)
    f_MarketDataSnapshotFullRefreshMDEntries_QuoteEntryID : fix_string option;
    (** For optional use in reporting Trades*)
    f_MarketDataSnapshotFullRefreshMDEntries_MDEntryBuyer : fix_string option;
    (** For optional use in reporting Trades*)
    f_MarketDataSnapshotFullRefreshMDEntries_MDEntrySeller : fix_string option;
    (** In an Aggregated Book, used to show how many individual orders make up an MDEntry*)
    f_MarketDataSnapshotFullRefreshMDEntries_NumberOfOrders : int option;
    (** Display position of a bid or offer, numbered from most competitive to least competitive, per market side, beginning with 1*)
    f_MarketDataSnapshotFullRefreshMDEntries_MDEntryPositionNo : int option;
    (** Text to describe the Market Data Entry. Part of repeating group.*)
    f_MarketDataSnapshotFullRefreshMDEntries_Text : fix_string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_MarketDataSnapshotFullRefreshMDEntries_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_MarketDataSnapshotFullRefreshMDEntries_EncodedText : fix_string option
}
;;

type fix_rg_marketdatasnapshotfullrefreshmdentries = fix_rg_inner_marketdatasnapshotfullrefreshmdentries list
;;

type fix_rg_inner_emaillinesoftext = {
    (** Specifies the number of repeating lines of text specified*)
    f_EmailLinesOfText_LinesOfText : int;
    (** Repeating field, number of instances defined in LinesOfText*)
    f_EmailLinesOfText_Text : fix_string;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_EmailLinesOfText_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_EmailLinesOfText_EncodedText : fix_string option
}
;;

type fix_rg_emaillinesoftext = fix_rg_inner_emaillinesoftext list
;;

type full_fix_app_record_data =
    | FIX_Record_AllocationOrders of fix_rg_allocationorders
    | FIX_Record_BidRequestBidComponents of fix_rg_bidrequestbidcomponents
    | FIX_Record_AllocationMiscFees of fix_rg_allocationmiscfees
    | FIX_Record_ListStatusOrders of fix_rg_liststatusorders
    | FIX_Record_OrderCancelReplaceRequestTradingSessions of fix_rg_ordercancelreplacerequesttradingsessions
    | FIX_Record_OrderListAllocs of fix_rg_orderlistallocs
    | FIX_Record_EmailRelatedSym of fix_rg_emailrelatedsym
    | FIX_Record_OrderListOrders of fix_rg_orderlistorders
    | FIX_Record_AllocationAllocs of fix_rg_allocationallocs
    | FIX_Record_QuoteRequestRelatedSym of fix_rg_quoterequestrelatedsym
    | FIX_Record_QuoteAcknowledgementQuoteEntries of fix_rg_quoteacknowledgementquoteentries
    | FIX_Record_OrderListTradingSessions of fix_rg_orderlisttradingsessions
    | FIX_Record_MassQuoteQuoteEntries of fix_rg_massquotequoteentries
    | FIX_Record_interval of fix_interval
    | FIX_Record_MarketDataIncrementalRefreshMDEntries of fix_rg_marketdataincrementalrefreshmdentries
    | FIX_Record_ListStrikePriceStrikes of fix_rg_liststrikepricestrikes
    | FIX_Record_MarketDataRequestRelatedSym of fix_rg_marketdatarequestrelatedsym
    | FIX_Record_LogonMsgTypes of fix_rg_logonmsgtypes
    | FIX_Record_OrderCancelReplaceRequestAllocs of fix_rg_ordercancelreplacerequestallocs
    | FIX_Record_EmailRoutingIDs of fix_rg_emailroutingids
    | FIX_Record_ExecutionReportContraBrokers of fix_rg_executionreportcontrabrokers
    | FIX_Record_IOIRoutingIDs of fix_rg_ioiroutingids
    | FIX_Record_QuoteCancelQuoteEntries of fix_rg_quotecancelquoteentries
    | FIX_Record_OrderSingleTradingSessions of fix_rg_ordersingletradingsessions
    | FIX_Record_BidRequestBidDescriptors of fix_rg_bidrequestbiddescriptors
    | FIX_Record_SecurityDefinitionRelatedSym of fix_rg_securitydefinitionrelatedsym
    | FIX_Record_IOIIOIQualifiers of fix_rg_ioiioiqualifiers
    | FIX_Record_NewsRoutingIDs of fix_rg_newsroutingids
    | FIX_Record_MassQuoteQuoteSets of fix_rg_massquotequotesets
    | FIX_Record_BidResponseBidComponents of fix_rg_bidresponsebidcomponents
    | FIX_Record_QuoteAcknowledgementQuoteSets of fix_rg_quoteacknowledgementquotesets
    | FIX_Record_NewsLinesOfText of fix_rg_newslinesoftext
    | FIX_Record_NewsRelatedSym of fix_rg_newsrelatedsym
    | FIX_Record_AllocationExecs of fix_rg_allocationexecs
    | FIX_Record_OrderSingleAllocs of fix_rg_ordersingleallocs
    | FIX_Record_SecurityDefinitionRequestRelatedSym of fix_rg_securitydefinitionrequestrelatedsym
    | FIX_Record_MarketDataRequestMDEntryTypes of fix_rg_marketdatarequestmdentrytypes
    | FIX_Record_MarketDataSnapshotFullRefreshMDEntries of fix_rg_marketdatasnapshotfullrefreshmdentries
    | FIX_Record_EmailLinesOfText of fix_rg_emaillinesoftext
;;
