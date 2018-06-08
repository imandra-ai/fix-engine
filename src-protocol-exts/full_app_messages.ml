(* Aesthetic Integration copyright 2018 *)
open Datetime;;
open Full_app_enums;;
open Full_app_records;;
open Full_app_tags;;
open Numeric;;

(** The new order message type is used by institutions wishing to electronically submit securities and forex orders to a broker for execution.*)
type full_fix_ordersingle_data = {
    (** Unique identifier of the order as assigned by institution.*)
    f_OrderSingle_ClOrdID : string option;
    (** Used for firm identification in third-party transactions (should not be a substitute for OnBehalfOfCompID/DeliverToCompID).*)
    f_OrderSingle_ClientID : string option;
    (** Used for firm identification in third-party transactions (should not be a substitute for OnBehalfOfCompID/DeliverToCompID).*)
    f_OrderSingle_ExecBroker : string option;
    f_OrderSingle_Account : string option;
    (** Absence of this field is interpreted as Regular.*)
    f_OrderSingle_SettlmntTyp : fix_settlmnttyp option;
    (** Required when SettlmntTyp = 6 (Future) or SettlmntTyp = 8 (Sellers Option)*)
    f_OrderSingle_FutSettDate : fix_localmktdate option;
    f_OrderSingle_HandlInst : fix_handlinst option;
    (** Can contain multiple instructions, space delimited. If OrdType=P, exactly one of the following values (ExecInst = L, R, M, P, O, T, or W) must be specified.*)
    f_OrderSingle_ExecInst : fix_execinst option;
    f_OrderSingle_MinQty : fix_float_6 option;
    f_OrderSingle_MaxFloor : fix_float_6 option;
    f_OrderSingle_ExDestination : fix_exchange option;
    (** Used to identify soft trades at order entry.*)
    f_OrderSingle_ProcessCode : fix_processcode option;
    f_OrderSingle_Symbol : string option;
    f_OrderSingle_SymbolSfx : string option;
    f_OrderSingle_SecurityID : string option;
    f_OrderSingle_IDSource : fix_idsource option;
    (** Must be specified if a Future or Option. If a Future: Symbol, SecurityType, and MaturityMonthYear are required. If an Option: Symbol, SecurityType, MaturityMonthYear, PutOrCall, and StrikePrice are required.*)
    f_OrderSingle_SecurityType : fix_securitytype option;
    (** Specifiesthe month and year of maturity. Required if MaturityDay is specified.*)
    f_OrderSingle_MaturityMonthYear : fix_monthyear option;
    (** Can be used in conjunction with MaturityMonthYear to specify a particular maturity date.*)
    f_OrderSingle_MaturityDay : int option;
    (** For Options.*)
    f_OrderSingle_PutOrCall : fix_putorcall option;
    (** For Options.*)
    f_OrderSingle_StrikePrice : fix_float_4 option;
    (** For Options.*)
    f_OrderSingle_OptAttribute : string option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_OrderSingle_ContractMultiplier : fix_float option;
    (** For Fixed Income.*)
    f_OrderSingle_CouponRate : fix_float option;
    (** Can be used to identify the security.*)
    f_OrderSingle_SecurityExchange : fix_exchange option;
    f_OrderSingle_Issuer : string option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_OrderSingle_EncodedIssuerLen : int option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_OrderSingle_EncodedIssuer : string option;
    f_OrderSingle_SecurityDesc : string option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_OrderSingle_EncodedSecurityDescLen : int option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_OrderSingle_EncodedSecurityDesc : string option;
    (** Useful for verifying security identification*)
    f_OrderSingle_PrevClosePx : fix_float_4 option;
    f_OrderSingle_Side : fix_side option;
    (** Required for short sell orders*)
    f_OrderSingle_LocateReqd : fix_locatereqd option;
    (** Time this order request was initiated/released by the trader or trading system.*)
    f_OrderSingle_TransactTime : fix_utctimestamp option;
    (** Either CashOrderQty or OrderQty is required. Note that either, but not both, CashOrderQty or OrderQty should be specified.*)
    f_OrderSingle_OrderQty : fix_float_6 option;
    (** Either CashOrderQty or OrderQty is required. Note that either, but not both, CashOrderQty or OrderQty should be specified. Specifies the approximate "monetary quantity" for the order. Broker is responsible for converting and calculating OrderQty in shares for subsequent messages.*)
    f_OrderSingle_CashOrderQty : fix_float_6 option;
    f_OrderSingle_OrdType : fix_ordtype option;
    (** Required for limit OrdTypes. For F/X orders, should be the "all-in" rate (spot rate adjusted for forward points). Can be used to specify a limit price for a pegged order, previously indicated, etc.*)
    f_OrderSingle_Price : fix_float_4 option;
    (** Required for OrdType = "Stop" or OrdType = "Stop limit".*)
    f_OrderSingle_StopPx : fix_float_4 option;
    f_OrderSingle_Currency : fix_currency option;
    f_OrderSingle_ComplianceID : string option;
    f_OrderSingle_SolicitedFlag : fix_solicitedflag option;
    (** Required for Previously Indicated Orders (OrdType=E)*)
    f_OrderSingle_IOIid : string option;
    (** Required for Previously Quoted Orders (OrdType=D)*)
    f_OrderSingle_QuoteID : string option;
    (** Absence of this field indicates Day order*)
    f_OrderSingle_TimeInForce : fix_timeinforce option;
    (** Can specify the time at which the order should be considered valid*)
    f_OrderSingle_EffectiveTime : fix_utctimestamp option;
    (** Conditionally required if TimeInForce = GTD and ExpireTime is not specified.*)
    f_OrderSingle_ExpireDate : fix_localmktdate option;
    (** Conditionally required if TimeInForce = GTD and ExpireDate is not specified.*)
    f_OrderSingle_ExpireTime : fix_utctimestamp option;
    (** States whether executions are booked out or accumulated on a partially filled GT order*)
    f_OrderSingle_GTBookingInst : fix_gtbookinginst option;
    f_OrderSingle_Commission : fix_float_6 option;
    f_OrderSingle_CommType : fix_commtype option;
    f_OrderSingle_Rule80A : fix_rule80a option;
    (** Indicates that broker is requested to execute a Forex accommodation trade in conjunction with the security trade.*)
    f_OrderSingle_ForexReq : fix_forexreq option;
    (** Required if ForexReq = Y.*)
    f_OrderSingle_SettlCurrency : fix_currency option;
    f_OrderSingle_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_OrderSingle_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_OrderSingle_EncodedText : string option;
    (** Can be used with OrdType = "Forex - Swap" to specify the "value date" for the future portion of a F/X swap.*)
    f_OrderSingle_FutSettDate2 : fix_localmktdate option;
    (** Can be used with OrdType = "Forex - Swap" to specify the order quantity for the future portion of a F/X swap.*)
    f_OrderSingle_OrderQty2 : fix_float_6 option;
    (** For options*)
    f_OrderSingle_OpenClose : fix_openclose option;
    (** For options*)
    f_OrderSingle_CoveredOrUncovered : fix_coveredoruncovered option;
    (** For options when delivering the order to execution system/exchange.*)
    f_OrderSingle_CustomerOrFirm : fix_customerorfirm option;
    f_OrderSingle_MaxShow : fix_float_6 option;
    (** Amount (signed) added to the price of the peg*)
    f_OrderSingle_PegDifference : fix_float_6 option;
    (** Code to identify the price a DiscretionOffset is related to and should be mathematically added to. Required if DiscretionOffset is specified.*)
    f_OrderSingle_DiscretionInst : fix_discretioninst option;
    (** Amount (signed) added to the "related to" price specified via DiscretionInst.*)
    f_OrderSingle_DiscretionOffset : fix_float_6 option;
    f_OrderSingle_ClearingFirm : string option;
    f_OrderSingle_ClearingAccount : string option;
    f_OrderSingle_OrderSingleAllocs : fix_rg_ordersingleallocs;
    f_OrderSingle_OrderSingleTradingSessions : fix_rg_ordersingletradingsessions;
    f_OrderSingle_TechnicalOrdType : fix_technicalordtype option;
    f_OrderSingle_BookIndicator : fix_bookindicator option;
    f_OrderSingle_MIC : string option;
    f_OrderSingle_BrokerPrioritization : fix_brokerprioritization option;
    f_OrderSingle_DEAIndicator : int option;
    f_OrderSingle_OrderAttributeTypes : fix_orderattributetypes list option;
    f_OrderSingle_Parties : fix_rg_parties;
    f_OrderSingle_ClearingEntries : fix_rg_clearingentries
}
;;

(** The order cancel/replace request is used to change the parameters of an existing order.*)
type full_fix_ordercancelreplacerequest_data = {
    (** Unique identifier of most recent order as assigned by broker.*)
    f_OrderCancelReplaceRequest_OrderID : string option;
    (** Used for firm identification in third-party transactions (should not be a substitute for OnBehalfOfCompID/DeliverToCompID).*)
    f_OrderCancelReplaceRequest_ClientID : string option;
    (** Used for firm identification in third-party transactions (should not be a substitute for OnBehalfOfCompID/DeliverToCompID).*)
    f_OrderCancelReplaceRequest_ExecBroker : string option;
    (** ClOrdID of the previous order (NOT the initial order of the day) when canceling or replacing an order.*)
    f_OrderCancelReplaceRequest_OrigClOrdID : string option;
    (** Unique identifier of replacement order as assigned by institution. Note that this identifier will be used in ClOrdID field of the Cancel Reject message if the replacement request is rejected.*)
    f_OrderCancelReplaceRequest_ClOrdID : string option;
    (** Required for List Orders*)
    f_OrderCancelReplaceRequest_ListID : string option;
    f_OrderCancelReplaceRequest_Account : string option;
    (** Absence of this field is interpreted as Regular.*)
    f_OrderCancelReplaceRequest_SettlmntTyp : fix_settlmnttyp option;
    (** Required when SettlmntTyp = 6 (Future) or SettlmntTyp = 8 (Sellers Option)*)
    f_OrderCancelReplaceRequest_FutSettDate : fix_localmktdate option;
    f_OrderCancelReplaceRequest_HandlInst : fix_handlinst option;
    (** Can contain multiple instructions, space delimited. Replacement order must be created with new parameters (i.e. original order values will not be brought forward to replacement order unless redefined within this message).*)
    f_OrderCancelReplaceRequest_ExecInst : fix_execinst option;
    f_OrderCancelReplaceRequest_MinQty : fix_float_6 option;
    f_OrderCancelReplaceRequest_MaxFloor : fix_float_6 option;
    f_OrderCancelReplaceRequest_ExDestination : fix_exchange option;
    (** Must match original order*)
    f_OrderCancelReplaceRequest_Symbol : string option;
    f_OrderCancelReplaceRequest_SymbolSfx : string option;
    (** Must match original order*)
    f_OrderCancelReplaceRequest_SecurityID : string option;
    (** Must match original order*)
    f_OrderCancelReplaceRequest_IDSource : fix_idsource option;
    (** Must be specified if a Future or Option. If a Future: Symbol, SecurityType, and MaturityMonthYear are required. If an Option: Symbol, SecurityType, MaturityMonthYear, PutOrCall, and StrikePrice are required.*)
    f_OrderCancelReplaceRequest_SecurityType : fix_securitytype option;
    (** Specifiesthe month and year of maturity. Required if MaturityDay is specified.*)
    f_OrderCancelReplaceRequest_MaturityMonthYear : fix_monthyear option;
    (** Can be used in conjunction with MaturityMonthYear to specify a particular maturity date.*)
    f_OrderCancelReplaceRequest_MaturityDay : int option;
    (** For Options.*)
    f_OrderCancelReplaceRequest_PutOrCall : fix_putorcall option;
    (** For Options.*)
    f_OrderCancelReplaceRequest_StrikePrice : fix_float_4 option;
    (** For Options.*)
    f_OrderCancelReplaceRequest_OptAttribute : string option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_OrderCancelReplaceRequest_ContractMultiplier : fix_float option;
    (** For Fixed Income.*)
    f_OrderCancelReplaceRequest_CouponRate : fix_float option;
    (** Can be used to identify the security.*)
    f_OrderCancelReplaceRequest_SecurityExchange : fix_exchange option;
    f_OrderCancelReplaceRequest_Issuer : string option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_OrderCancelReplaceRequest_EncodedIssuerLen : int option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_OrderCancelReplaceRequest_EncodedIssuer : string option;
    f_OrderCancelReplaceRequest_SecurityDesc : string option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_OrderCancelReplaceRequest_EncodedSecurityDescLen : int option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_OrderCancelReplaceRequest_EncodedSecurityDesc : string option;
    (** Must match original side, however, Buy and Buy Minus can be interchanged as well as Sell and Sell Plus*)
    f_OrderCancelReplaceRequest_Side : fix_side option;
    (** Time this order request was initiated/released by the trader or trading system.*)
    f_OrderCancelReplaceRequest_TransactTime : fix_utctimestamp option;
    (** Either CashOrderQty or OrderQty is required. Note that either, but not both, CashOrderQty or OrderQty should be specified. Should be the "Total Intended Order Quantity" (including the amount already executed for this chain of orders)*)
    f_OrderCancelReplaceRequest_OrderQty : fix_float_6 option;
    (** Either CashOrderQty or OrderQty is required. Note that either, but not both, CashOrderQty or OrderQty should be specified. Specifies the approximate "monetary quantity" for the order. Broker is responsible for converting and calculating OrderQty in shares for subsequent messages.*)
    f_OrderCancelReplaceRequest_CashOrderQty : fix_float_6 option;
    f_OrderCancelReplaceRequest_OrdType : fix_ordtype option;
    (** Required for limit OrdTypes. For F/X orders, should be the "all-in" rate (spot rate adjusted for forward points). Can be used to specify a limit price for a pegged order, previously indicated, etc.*)
    f_OrderCancelReplaceRequest_Price : fix_float_4 option;
    (** Required for OrdType = "Stop" or OrdType = "Stop limit".*)
    f_OrderCancelReplaceRequest_StopPx : fix_float_4 option;
    (** Amount (signed) added to the price of the peg*)
    f_OrderCancelReplaceRequest_PegDifference : fix_float_6 option;
    (** Code to identify the price a DiscretionOffset is related to and should be mathematically added to. Required if DiscretionOffset is specified.*)
    f_OrderCancelReplaceRequest_DiscretionInst : fix_discretioninst option;
    (** Amount (signed) added to the "related to" price specified via DiscretionInst.*)
    f_OrderCancelReplaceRequest_DiscretionOffset : fix_float_6 option;
    f_OrderCancelReplaceRequest_ComplianceID : string option;
    f_OrderCancelReplaceRequest_SolicitedFlag : fix_solicitedflag option;
    (** Must match original order.*)
    f_OrderCancelReplaceRequest_Currency : fix_currency option;
    (** Absence of this field indicates Day order*)
    f_OrderCancelReplaceRequest_TimeInForce : fix_timeinforce option;
    (** Can specify the time at which the order should be considered valid*)
    f_OrderCancelReplaceRequest_EffectiveTime : fix_utctimestamp option;
    (** Conditionally required if TimeInForce = GTD and ExpireTime is not specified.*)
    f_OrderCancelReplaceRequest_ExpireDate : fix_localmktdate option;
    (** Conditionally required if TimeInForce = GTD and ExpireDate is not specified.*)
    f_OrderCancelReplaceRequest_ExpireTime : fix_utctimestamp option;
    (** States whether executions are booked out or accumulated on a partially filled GT order*)
    f_OrderCancelReplaceRequest_GTBookingInst : fix_gtbookinginst option;
    f_OrderCancelReplaceRequest_Commission : fix_float_6 option;
    f_OrderCancelReplaceRequest_CommType : fix_commtype option;
    (** Must match original order*)
    f_OrderCancelReplaceRequest_Rule80A : fix_rule80a option;
    (** Indicates that broker is requested to execute a Forex accommodation trade in conjunction with the security trade.*)
    f_OrderCancelReplaceRequest_ForexReq : fix_forexreq option;
    (** Required if ForexReq = Y.*)
    f_OrderCancelReplaceRequest_SettlCurrency : fix_currency option;
    f_OrderCancelReplaceRequest_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_OrderCancelReplaceRequest_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_OrderCancelReplaceRequest_EncodedText : string option;
    (** Can be used with OrdType = "Forex - Swap" to specify the "value date" for the future portion of a F/X swap.*)
    f_OrderCancelReplaceRequest_FutSettDate2 : fix_localmktdate option;
    (** Can be used with OrdType = "Forex - Swap" to specify the order quantity for the future portion of a F/X swap.*)
    f_OrderCancelReplaceRequest_OrderQty2 : fix_float_6 option;
    (** For options*)
    f_OrderCancelReplaceRequest_OpenClose : fix_openclose option;
    (** For options*)
    f_OrderCancelReplaceRequest_CoveredOrUncovered : fix_coveredoruncovered option;
    (** For options when delivering the order to execution system/exchange.*)
    f_OrderCancelReplaceRequest_CustomerOrFirm : fix_customerorfirm option;
    f_OrderCancelReplaceRequest_MaxShow : fix_float_6 option;
    f_OrderCancelReplaceRequest_LocateReqd : fix_locatereqd option;
    f_OrderCancelReplaceRequest_ClearingFirm : string option;
    f_OrderCancelReplaceRequest_ClearingAccount : string option;
    f_OrderCancelReplaceRequest_OrderCancelReplaceRequestAllocs : fix_rg_ordercancelreplacerequestallocs;
    f_OrderCancelReplaceRequest_OrderCancelReplaceRequestTradingSessions : fix_rg_ordercancelreplacerequesttradingsessions;
    f_OrderCancelReplaceRequest_TechnicalOrdType : fix_technicalordtype option;
    f_OrderCancelReplaceRequest_FreeText : string option;
    f_OrderCancelReplaceRequest_ClearingHandlingType : fix_clearinghandlingtype option;
    f_OrderCancelReplaceRequest_MIC : string option;
    f_OrderCancelReplaceRequest_DEAIndicator : int option;
    f_OrderCancelReplaceRequest_Parties : fix_rg_parties
}
;;

(** The order cancel request message requests the cancellation of all of the remaining quantity of an existing order.*)
type full_fix_ordercancelrequest_data = {
    (** ClOrdID of the previous order (NOT the initial order of the day) when canceling or replacing an order.*)
    f_OrderCancelRequest_OrigClOrdID : string option;
    (** Unique identifier of most recent order as assigned by broker.*)
    f_OrderCancelRequest_OrderID : string option;
    (** Unique ID of cancel request as assigned by the institution.*)
    f_OrderCancelRequest_ClOrdID : string option;
    (** Required for List Orders*)
    f_OrderCancelRequest_ListID : string option;
    f_OrderCancelRequest_Account : string option;
    (** Used for firm identification in third-party transactions (should not be a substitute for OnBehalfOfCompID/DeliverToCompID).*)
    f_OrderCancelRequest_ClientID : string option;
    (** Used for firm identification in third-party transactions (should not be a substitute for OnBehalfOfCompID/DeliverToCompID).*)
    f_OrderCancelRequest_ExecBroker : string option;
    f_OrderCancelRequest_Symbol : string option;
    f_OrderCancelRequest_SymbolSfx : string option;
    f_OrderCancelRequest_SecurityID : string option;
    f_OrderCancelRequest_IDSource : fix_idsource option;
    (** Must be specified if a Future or Option. If a Future: Symbol, SecurityType, and MaturityMonthYear are required. If an Option: Symbol, SecurityType, MaturityMonthYear, PutOrCall, and StrikePrice are required.*)
    f_OrderCancelRequest_SecurityType : fix_securitytype option;
    (** Specifiesthe month and year of maturity. Required if MaturityDay is specified.*)
    f_OrderCancelRequest_MaturityMonthYear : fix_monthyear option;
    (** Can be used in conjunction with MaturityMonthYear to specify a particular maturity date.*)
    f_OrderCancelRequest_MaturityDay : int option;
    (** For Options.*)
    f_OrderCancelRequest_PutOrCall : fix_putorcall option;
    (** For Options.*)
    f_OrderCancelRequest_StrikePrice : fix_float_4 option;
    (** For Options.*)
    f_OrderCancelRequest_OptAttribute : string option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_OrderCancelRequest_ContractMultiplier : fix_float option;
    (** For Fixed Income.*)
    f_OrderCancelRequest_CouponRate : fix_float option;
    (** Can be used to identify the security.*)
    f_OrderCancelRequest_SecurityExchange : fix_exchange option;
    f_OrderCancelRequest_Issuer : string option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_OrderCancelRequest_EncodedIssuerLen : int option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_OrderCancelRequest_EncodedIssuer : string option;
    f_OrderCancelRequest_SecurityDesc : string option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_OrderCancelRequest_EncodedSecurityDescLen : int option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_OrderCancelRequest_EncodedSecurityDesc : string option;
    f_OrderCancelRequest_Side : fix_side option;
    (** Time this order request was initiated/released by the trader or trading system.*)
    f_OrderCancelRequest_TransactTime : fix_utctimestamp option;
    (** Either CashOrderQty or OrderQty is required. OrderQty = CumQty + LeavesQty (see exceptions above)*)
    f_OrderCancelRequest_OrderQty : fix_float_6 option;
    (** Either CashOrderQty or OrderQty is required. Specifies the approximate "monetary quantity" for the order. Broker is responsible for converting and calculating OrderQty in shares for subsequent messages.*)
    f_OrderCancelRequest_CashOrderQty : fix_float_6 option;
    f_OrderCancelRequest_ComplianceID : string option;
    f_OrderCancelRequest_SolicitedFlag : fix_solicitedflag option;
    f_OrderCancelRequest_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_OrderCancelRequest_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_OrderCancelRequest_EncodedText : string option;
    f_OrderCancelRequest_MIC : string option;
    f_OrderCancelRequest_Currency : fix_currency option
}
;;

(** The order mass cancel request message requests the cancellation of all of the remaining quantity of a group of orders matching criteria specified within the request. NOTE: This message can only be used to cancel order messages (reduce the full quantity).*)
type full_fix_ordermasscancelrequest_data = {
    (** Unique ID of Order Mass Cancel Request as assigned by the institution.*)
    f_OrderMassCancelRequest_ClOrdID : string option;
    f_OrderMassCancelRequest_SecondaryClOrdID : string option;
    (** Specifies the type of cancellation requested*)
    f_OrderMassCancelRequest_MassCancelRequestType : fix_masscancelrequesttype option;
    (** Trading Session in which orders are to be canceled*)
    f_OrderMassCancelRequest_TradingSessionID : string option;
    f_OrderMassCancelRequest_TradingSessionSubID : string option;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_OrderMassCancelRequest_Instrument : fix_instrument;
    (** Insert here the set of "UnderlyingInstrument" (underlying symbology) fields defined in "Common Components of Application Messages"*)
    f_OrderMassCancelRequest_UnderlyingInstrument : fix_underlyinginstrument;
    (** Optional qualifier used to indicate the side of the market for which orders are to be canceled. Absence of this field indicates that orders are to be canceled regardless of side.*)
    f_OrderMassCancelRequest_Side : fix_side option;
    (** Time this order request was initiated/released by the trader or trading system.*)
    f_OrderMassCancelRequest_TransactTime : fix_utctimestamp option;
    f_OrderMassCancelRequest_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_OrderMassCancelRequest_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_OrderMassCancelRequest_EncodedText : string option;
    f_OrderMassCancelRequest_Account : string option;
    f_OrderMassCancelRequest_Symbol : string option;
    f_OrderMassCancelRequest_ClassID : string option;
    f_OrderMassCancelRequest_TechnicalOrdType : fix_technicalordtype option;
    f_OrderMassCancelRequest_Rule80A : fix_rule80a option;
    f_OrderMassCancelRequest_CancelByLocationID : string option
}
;;

(** The execution report message is used to:
 1. Confirm the receipt of an order
 2. Confirm changes to an existing order (i.e. accept cancel and replace requests)
 3. Relay order status information
 4. Relay fill information on working orders
 5. Reject orders
 6. Report post-trade fees calculations associated with a trade*)
type full_fix_executionreport_data = {
    (** OrderID is required to be unique for each chain of orders.*)
    f_ExecutionReport_OrderID : string option;
    (** Can be used to provide order id used by exchange or executing system.*)
    f_ExecutionReport_SecondaryOrderID : string option;
    (** Required for executions against electronically submitted orders which were assigned an ID by the institution. Not required for orders manually entered by the broker.*)
    f_ExecutionReport_ClOrdID : string option;
    (** Conditionally required for response to an electronic Cancel or Cancel/Replace request (ExecType=PendingCancel, Replaced, or Canceled). ClOrdID of the previous order (NOT the initial order of the day) when canceling or replacing an order.*)
    f_ExecutionReport_OrigClOrdID : string option;
    (** Used for firm identification in third-party transactions (should not be a substitute for OnBehalfOfCompID/DeliverToCompID).*)
    f_ExecutionReport_ClientID : string option;
    (** Used for firm identification in third-party transactions (should not be a substitute for OnBehalfOfCompID/DeliverToCompID).*)
    f_ExecutionReport_ExecBroker : string option;
    (** Required for executions against orders which were submitted as part of a list.*)
    f_ExecutionReport_ListID : string option;
    (** Must be unique for each Execution Report message*)
    f_ExecutionReport_ExecID : string option;
    f_ExecutionReport_ExecTransType : fix_exectranstype option;
    (** Required for Cancel and Correct ExecTransType messages*)
    f_ExecutionReport_ExecRefID : string option;
    (** Describes the type of execution report. Same possible values as OrdStatus.*)
    f_ExecutionReport_ExecType : fix_exectype option;
    (** Describes the current state of a CHAIN of orders, same scope as OrderQty, CumQty, LeavesQty, and AvgPx*)
    f_ExecutionReport_OrdStatus : fix_ordstatus option;
    (** For optional use with ExecType = 8 (Rejected)*)
    f_ExecutionReport_OrdRejReason : fix_ordrejreason option;
    (** Required for ExecType = D (Restated).*)
    f_ExecutionReport_ExecRestatementReason : fix_execrestatementreason option;
    (** Required for executions against electronically submitted orders which were assigned an account by the institution*)
    f_ExecutionReport_Account : string option;
    (** Absence of this field is interpreted as Regular.*)
    f_ExecutionReport_SettlmntTyp : fix_settlmnttyp option;
    (** Required when SettlmntTyp = 6 (Future) or SettlmntTyp = 8 (Sellers Option)*)
    f_ExecutionReport_FutSettDate : fix_localmktdate option;
    f_ExecutionReport_Symbol : string option;
    f_ExecutionReport_SymbolSfx : string option;
    f_ExecutionReport_SecurityID : string option;
    f_ExecutionReport_IDSource : fix_idsource option;
    (** Must be specified if a Future or Option. If a Future: Symbol, SecurityType, and MaturityMonthYear are required. If an Option: Symbol, SecurityType, MaturityMonthYear, PutOrCall, and StrikePrice are required.*)
    f_ExecutionReport_SecurityType : fix_securitytype option;
    (** Specifiesthe month and year of maturity. Required if MaturityDay is specified.*)
    f_ExecutionReport_MaturityMonthYear : fix_monthyear option;
    (** Can be used in conjunction with MaturityMonthYear to specify a particular maturity date.*)
    f_ExecutionReport_MaturityDay : int option;
    (** For Options.*)
    f_ExecutionReport_PutOrCall : fix_putorcall option;
    (** For Options.*)
    f_ExecutionReport_StrikePrice : fix_float_4 option;
    (** For Options.*)
    f_ExecutionReport_OptAttribute : string option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_ExecutionReport_ContractMultiplier : fix_float option;
    (** For Fixed Income.*)
    f_ExecutionReport_CouponRate : fix_float option;
    (** Can be used to identify the security.*)
    f_ExecutionReport_SecurityExchange : fix_exchange option;
    f_ExecutionReport_Issuer : string option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_ExecutionReport_EncodedIssuerLen : int option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_ExecutionReport_EncodedIssuer : string option;
    f_ExecutionReport_SecurityDesc : string option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_ExecutionReport_EncodedSecurityDescLen : int option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_ExecutionReport_EncodedSecurityDesc : string option;
    f_ExecutionReport_Side : fix_side option;
    (** Either CashOrderQty or OrderQty is required. Not required for a rejected cash order or an order ack for a cash order.*)
    f_ExecutionReport_OrderQty : fix_float_6 option;
    (** Either CashOrderQty or OrderQty is required. Specifies the approximate "monetary quantity" conveyed on the order. Broker is responsible for converting and calculating OrderQty in shares for subsequent messages involving fills.*)
    f_ExecutionReport_CashOrderQty : fix_float_6 option;
    f_ExecutionReport_OrdType : fix_ordtype option;
    (** Required if specified on the order*)
    f_ExecutionReport_Price : fix_float_4 option;
    (** Required if specified on the order*)
    f_ExecutionReport_StopPx : fix_float_4 option;
    (** Required if specified on the order*)
    f_ExecutionReport_PegDifference : fix_float_6 option;
    (** Code to identify the price a DiscretionOffset is related to and should be mathematically added to. Required if DiscretionOffset is specified.*)
    f_ExecutionReport_DiscretionInst : fix_discretioninst option;
    (** Amount (signed) added to the "related to" price specified via DiscretionInst.*)
    f_ExecutionReport_DiscretionOffset : fix_float_6 option;
    f_ExecutionReport_Currency : fix_currency option;
    f_ExecutionReport_ComplianceID : string option;
    f_ExecutionReport_SolicitedFlag : fix_solicitedflag option;
    (** Absence of this field indicates Day order*)
    f_ExecutionReport_TimeInForce : fix_timeinforce option;
    (** Time specified on the order at which the order should be considered valid*)
    f_ExecutionReport_EffectiveTime : fix_utctimestamp option;
    (** Conditionally required if TimeInForce = GTD and ExpireTime is not specified.*)
    f_ExecutionReport_ExpireDate : fix_localmktdate option;
    (** Conditionally required if TimeInForce = GTD and ExpireDate is not specified.*)
    f_ExecutionReport_ExpireTime : fix_utctimestamp option;
    (** Can contain multiple instructions, space delimited.*)
    f_ExecutionReport_ExecInst : fix_execinst option;
    f_ExecutionReport_Rule80A : fix_rule80a option;
    (** Quantity of shares bought/sold on this (last) fill. Not required ExecTransType = 3 (Status). When required, should be "0" for non-fills ("fill" defined as ExecTransType=New and ExecType=Partial Fill or Fill) unless noted below.
     If ExecType=Stopped, represents the quantity stopped/guaranteed/protected for.*)
    f_ExecutionReport_LastShares : fix_float_6 option;
    (** Price of this (last) fill. Not required for ExecTransType = 3 (Status), Should represent the "all-in" (LastSpotRate + LastForwardPoints) rate for F/X orders. ). When required, should be "0" for non-fills ("fill" defined as ExecTransType=New and ExecType=Partial Fill or Fill) unless noted below.
     If ExecType=Stopped, represents the price stopped/guaranteed/protected at.*)
    f_ExecutionReport_LastPx : fix_float_4 option;
    (** Applicable for F/X orders*)
    f_ExecutionReport_LastSpotRate : fix_float_4 option;
    (** Applicable for F/X orders*)
    f_ExecutionReport_LastForwardPoints : fix_float_6 option;
    f_ExecutionReport_LastMkt : fix_exchange option;
    f_ExecutionReport_TradingSessionID : string option;
    f_ExecutionReport_LastCapacity : fix_lastcapacity option;
    (** Amount of shares open for further execution. If the OrdStatus is Canceled, DoneForTheDay, Expired, Calculated, or Rejected (in which case the order is no longer active) then LeavesQty could be 0, otherwise LeavesQty = OrderQty - CumQty.*)
    f_ExecutionReport_LeavesQty : fix_float_6 option;
    (** Currently executed shares for chain of orders.*)
    f_ExecutionReport_CumQty : fix_float_6 option;
    f_ExecutionReport_AvgPx : fix_float_4 option;
    (** For GT orders on days following the day of the first trade.*)
    f_ExecutionReport_DayOrderQty : fix_float_6 option;
    (** For GT orders on days following the day of the first trade.*)
    f_ExecutionReport_DayCumQty : fix_float_6 option;
    (** For GT orders on days following the day of the first trade.*)
    f_ExecutionReport_DayAvgPx : fix_float_4 option;
    (** States whether executions are booked out or accumulated on a partially filled GT order*)
    f_ExecutionReport_GTBookingInst : fix_gtbookinginst option;
    (** Used when reporting other than current day trades.*)
    f_ExecutionReport_TradeDate : fix_localmktdate option;
    (** Time the transaction represented by this ExecutionReport occurred*)
    f_ExecutionReport_TransactTime : fix_utctimestamp option;
    f_ExecutionReport_ReportToExch : fix_reporttoexch option;
    (** On a fill/partial fill messages, it represents value for that fill/partial fill, on ExecType=Calculated, it represents cumulative value for the order. Monetary commission values are expressed in the currency reflected by the Currency field.*)
    f_ExecutionReport_Commission : fix_float_6 option;
    f_ExecutionReport_CommType : fix_commtype option;
    f_ExecutionReport_GrossTradeAmt : fix_float_6 option;
    (** Used to report results of forex accommodation trade*)
    f_ExecutionReport_SettlCurrAmt : fix_float_6 option;
    (** Used to report results of forex accommodation trade*)
    f_ExecutionReport_SettlCurrency : fix_currency option;
    (** Foreign exchange rate used to compute SettlCurrAmt from Currency to SettlCurrency*)
    f_ExecutionReport_SettlCurrFxRate : fix_float option;
    (** Specifies whether the SettlCurrFxRate should be multiplied or divided*)
    f_ExecutionReport_SettlCurrFxRateCalc : string option;
    f_ExecutionReport_HandlInst : fix_handlinst option;
    f_ExecutionReport_MinQty : fix_float_6 option;
    f_ExecutionReport_MaxFloor : fix_float_6 option;
    (** For options*)
    f_ExecutionReport_OpenClose : fix_openclose option;
    f_ExecutionReport_MaxShow : fix_float_6 option;
    f_ExecutionReport_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_ExecutionReport_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_ExecutionReport_EncodedText : string option;
    (** Can be used with OrdType = "Forex - Swap" to specify the "value date" for the future portion of a F/X swap.*)
    f_ExecutionReport_FutSettDate2 : fix_localmktdate option;
    (** Can be used with OrdType = "Forex - Swap" to specify the order quantity for the future portion of a F/X swap.*)
    f_ExecutionReport_OrderQty2 : fix_float_6 option;
    f_ExecutionReport_ClearingFirm : string option;
    f_ExecutionReport_ClearingAccount : string option;
    (** Default is a single security if not specified.*)
    f_ExecutionReport_MultiLegReportingType : fix_multilegreportingtype option;
    f_ExecutionReport_ExecutionReportContraBrokers : fix_rg_executionreportcontrabrokers;
    f_ExecutionReport_CrossType : fix_crosstype option;
    f_ExecutionReport_TechnicalOrdType : fix_technicalordtype option;
    f_ExecutionReport_FreeText : string option;
    f_ExecutionReport_ClearingHandlingType : fix_clearinghandlingtype option;
    f_ExecutionReport_UTPExID : int option;
    f_ExecutionReport_LiquidityIndicator : fix_liquidityindicator option;
    f_ExecutionReport_ErrorCode : int option;
    f_ExecutionReport_MIC : string option;
    f_ExecutionReport_BookIndicator : fix_bookindicator option;
    f_ExecutionReport_BrokerPrioritization : fix_brokerprioritization option;
    f_ExecutionReport_IMPTimestamp : fix_utctimeonly option;
    f_ExecutionReport_DEAIndicator : int option;
    f_ExecutionReport_OrderAttributeTypes : fix_orderattributetypes list option;
    f_ExecutionReport_Parties : fix_rg_parties;
    f_ExecutionReport_ContraGrp : fix_rg_contragrp
}
;;

(** The order cancel reject message is issued by the broker upon receipt of a cancel request or cancel/replace request message which cannot be honored.*)
type full_fix_ordercancelreject_data = {
    (** If CxlRejReason="Unknown order", specify "NONE".*)
    f_OrderCancelReject_OrderID : string option;
    (** Can be used to provide order id used by exchange or executing system.*)
    f_OrderCancelReject_SecondaryOrderID : string option;
    (** Unique order id assigned by institution to the cancel request or to the replacement order.*)
    f_OrderCancelReject_ClOrdID : string option;
    (** ClOrdID which could not be canceled/replaced. ClOrdID of the previous order (NOT the initial order of the day) when canceling or replacing an order.*)
    f_OrderCancelReject_OrigClOrdID : string option;
    (** OrdStatus value after this cancel reject is applied.*)
    f_OrderCancelReject_OrdStatus : fix_ordstatus option;
    (** Used for firm identification in third-party transactions (should not be a substitute for OnBehalfOfCompID/DeliverToCompID).*)
    f_OrderCancelReject_ClientID : string option;
    (** Used for firm identification in third-party transactions (should not be a substitute for OnBehalfOfCompID/DeliverToCompID).*)
    f_OrderCancelReject_ExecBroker : string option;
    (** Required for rejects against orders which were submitted as part of a list.*)
    f_OrderCancelReject_ListID : string option;
    f_OrderCancelReject_Account : string option;
    f_OrderCancelReject_TransactTime : fix_utctimestamp option;
    f_OrderCancelReject_CxlRejResponseTo : fix_cxlrejresponseto option;
    f_OrderCancelReject_CxlRejReason : fix_cxlrejreason option;
    f_OrderCancelReject_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_OrderCancelReject_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_OrderCancelReject_EncodedText : string option;
    f_OrderCancelReject_ErrorCode : int option;
    f_OrderCancelReject_Symbol : string option;
    f_OrderCancelReject_ExecInst : fix_execinst option
}
;;

(** The Order Mass Cancel Report is used to acknowledge an Order Mass Cancel Request. Note that each affected order that is canceled is acknowledged with a separate Execution Report or Order Cancel Reject message.*)
type full_fix_ordermasscancelreport_data = {
    (** ClOrdID provided on the Order Mass Cancel Request.*)
    f_OrderMassCancelReport_ClOrdID : string option;
    f_OrderMassCancelReport_SecondaryClOrdID : string option;
    (** Unique Identifier for the Order Mass Cancel Request assigned by the recipient of the Order Mass Cancel Request*)
    f_OrderMassCancelReport_OrderID : string option;
    (** Secondary Order ID assigned by the recipient of the Order Mass Cancel Request*)
    f_OrderMassCancelReport_SecondaryOrderID : string option;
    (** Order Mass Cancel Request Type accepted by the system*)
    f_OrderMassCancelReport_MassCancelRequestType : fix_masscancelrequesttype option;
    (** Indicates the action taken by the counterparty order handling system as a result of the Cancel Request
     0 - Indicates Order Mass Cancel Request was rejected.*)
    f_OrderMassCancelReport_MassCancelResponse : fix_masscancelresponse option;
    (** Indicates why Order Mass Cancel Request was rejected
     Required if MassCancelResponse = 0*)
    f_OrderMassCancelReport_MassCancelRejectReason : fix_masscancelrejectreason option;
    (** Optional field used to indicate the total number of orders affected by the Order Mass Cancel Request*)
    f_OrderMassCancelReport_TotalAffectedOrders : int option;
    (** Optional field used to indicate the number of order identifiers for orders affected by the Order Mass Cancel Request. Must be followed with OrigClOrdID as the next field*)
    f_OrderMassCancelReport_AffectedOrdGrp : fix_rg_affectedordgrp;
    (** Trading Session in which orders are to be canceled*)
    f_OrderMassCancelReport_TradingSessionID : string option;
    f_OrderMassCancelReport_TradingSessionSubID : string option;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_OrderMassCancelReport_Instrument : fix_instrument;
    (** Insert here the set of "UnderlyingInstrument" (underlying symbology) fields defined in "Common Components of Application Messages"*)
    f_OrderMassCancelReport_UnderlyingInstrument : fix_underlyinginstrument;
    (** Side of the market specified on the Order Mass Cancel Request*)
    f_OrderMassCancelReport_Side : fix_side option;
    (** Time this report was initiated/released by the sells-side (broker, exchange, ECN) or sell-side executing system.*)
    f_OrderMassCancelReport_TransactTime : fix_utctimestamp option;
    f_OrderMassCancelReport_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_OrderMassCancelReport_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_OrderMassCancelReport_EncodedText : string option;
    f_OrderMassCancelReport_Symbol : string option;
    f_OrderMassCancelReport_ClassID : string option;
    f_OrderMassCancelReport_TechnicalOrdType : fix_technicalordtype option;
    f_OrderMassCancelReport_Rule80A : fix_rule80a option;
    f_OrderMassCancelReport_Account : string option;
    f_OrderMassCancelReport_CancelByLocationID : string option;
    f_OrderMassCancelReport_MIC : string option
}
;;

type full_app_msg_data =
    | FIX_Full_Msg_OrderSingle of full_fix_ordersingle_data
    | FIX_Full_Msg_OrderCancelReplaceRequest of full_fix_ordercancelreplacerequest_data
    | FIX_Full_Msg_OrderCancelRequest of full_fix_ordercancelrequest_data
    | FIX_Full_Msg_OrderMassCancelRequest of full_fix_ordermasscancelrequest_data
    | FIX_Full_Msg_ExecutionReport of full_fix_executionreport_data
    | FIX_Full_Msg_OrderCancelReject of full_fix_ordercancelreject_data
    | FIX_Full_Msg_OrderMassCancelReport of full_fix_ordermasscancelreport_data
;;

let get_full_app_msg_tag (msg : full_app_msg_data)  =
    (match msg with
        | FIX_Full_Msg_OrderSingle _ -> Full_Msg_OrderSingle_Tag
        | FIX_Full_Msg_OrderCancelReplaceRequest _ -> Full_Msg_OrderCancelReplaceRequest_Tag
        | FIX_Full_Msg_OrderCancelRequest _ -> Full_Msg_OrderCancelRequest_Tag
        | FIX_Full_Msg_OrderMassCancelRequest _ -> Full_Msg_OrderMassCancelRequest_Tag
        | FIX_Full_Msg_ExecutionReport _ -> Full_Msg_ExecutionReport_Tag
        | FIX_Full_Msg_OrderCancelReject _ -> Full_Msg_OrderCancelReject_Tag
        | FIX_Full_Msg_OrderMassCancelReport _ -> Full_Msg_OrderMassCancelReport_Tag
    )
;;
