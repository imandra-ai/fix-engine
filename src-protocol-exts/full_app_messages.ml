(* Aesthetic Integration copyright 2017 *)
(* @meta[imandra_ignore] on @end *)
open Base_types;;
open Datetime;;
open Numeric;;
open Full_app_enums;;
open Full_app_tags;;
open Full_app_records;;
(* @meta[imandra_ignore] off @end *)

(** Advertisement messages are used to announce completed transactions.*)
type full_fix_advertisement_data = {
    f_Advertisement_AdvId : fix_string;
    f_Advertisement_AdvTransType : fix_advtranstype;
    (** Required for Cancel and Replace AdvTransType messages*)
    f_Advertisement_AdvRefID : fix_string option;
    f_Advertisement_Symbol : fix_string;
    f_Advertisement_SymbolSfx : fix_string option;
    f_Advertisement_SecurityID : fix_string option;
    f_Advertisement_IDSource : fix_idsource option;
    (** Must be specified if a Future or Option. If a Future: Symbol, SecurityType, and MaturityMonthYear are required. If an Option: Symbol, SecurityType, MaturityMonthYear, PutOrCall, and StrikePrice are required.*)
    f_Advertisement_SecurityType : fix_securitytype option;
    (** Specifiesthe month and year of maturity. Required if MaturityDay is specified.*)
    f_Advertisement_MaturityMonthYear : fix_monthyear option;
    (** Can be used in conjunction with MaturityMonthYear to specify a particular maturity date.*)
    f_Advertisement_MaturityDay : int option;
    (** For Options.*)
    f_Advertisement_PutOrCall : fix_putorcall option;
    (** For Options.*)
    f_Advertisement_StrikePrice : fix_float option;
    (** For Options.*)
    f_Advertisement_OptAttribute : int option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_Advertisement_ContractMultiplier : fix_float option;
    (** For Fixed Income.*)
    f_Advertisement_CouponRate : fix_float option;
    (** Can be used to identify the security.*)
    f_Advertisement_SecurityExchange : fix_exchange option;
    f_Advertisement_Issuer : fix_string option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_Advertisement_EncodedIssuerLen : int option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_Advertisement_EncodedIssuer : fix_string option;
    f_Advertisement_SecurityDesc : fix_string option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_Advertisement_EncodedSecurityDescLen : int option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_Advertisement_EncodedSecurityDesc : fix_string option;
    f_Advertisement_AdvSide : fix_advside;
    f_Advertisement_Shares : fix_float;
    f_Advertisement_Price : fix_float option;
    f_Advertisement_Currency : fix_currency option;
    f_Advertisement_TradeDate : fix_localmktdate option;
    f_Advertisement_TransactTime : fix_utctimestamp option;
    f_Advertisement_Text : fix_string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_Advertisement_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_Advertisement_EncodedText : fix_string option;
    (** A URL (Uniform Resource Locator) link to additional information (i.e. http://www.XYZ.com/research.html)*)
    f_Advertisement_URLLink : fix_string option;
    f_Advertisement_LastMkt : fix_exchange option;
    f_Advertisement_TradingSessionID : fix_string option
}
;;

(** The Allocation message provides the ability to specify how an order or set of orders should be subdivided amongst one or more accounts.*)
type full_fix_allocation_data = {
    f_Allocation_AllocID : fix_string;
    f_Allocation_AllocTransType : fix_alloctranstype;
    (** Required for AllocTransType = Calculated, Replace, or Cancel*)
    f_Allocation_RefAllocID : fix_string option;
    (** Can be used to link two different Allocation messages (each with unique AllocID) together, i.e. for F/X "Netting" or "Swaps"*)
    f_Allocation_AllocLinkID : fix_string option;
    (** Can be used to link two different Allocation messages and identifies the type of link. Required if AllocLinkID is specified.*)
    f_Allocation_AllocLinkType : fix_alloclinktype option;
    f_Allocation_Side : fix_side;
    f_Allocation_Symbol : fix_string;
    f_Allocation_SymbolSfx : fix_string option;
    f_Allocation_SecurityID : fix_string option;
    f_Allocation_IDSource : fix_idsource option;
    (** Must be specified if a Future or Option. If a Future: Symbol, SecurityType, and MaturityMonthYear are required. If an Option: Symbol, SecurityType, MaturityMonthYear, PutOrCall, and StrikePrice are required.*)
    f_Allocation_SecurityType : fix_securitytype option;
    (** Specifiesthe month and year of maturity. Required if MaturityDay is specified.*)
    f_Allocation_MaturityMonthYear : fix_monthyear option;
    (** Can be used in conjunction with MaturityMonthYear to specify a particular maturity date.*)
    f_Allocation_MaturityDay : int option;
    (** For Options.*)
    f_Allocation_PutOrCall : fix_putorcall option;
    (** For Options.*)
    f_Allocation_StrikePrice : fix_float option;
    (** For Options.*)
    f_Allocation_OptAttribute : int option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_Allocation_ContractMultiplier : fix_float option;
    (** For Fixed Income.*)
    f_Allocation_CouponRate : fix_float option;
    (** Can be used to identify the security.*)
    f_Allocation_SecurityExchange : fix_exchange option;
    f_Allocation_Issuer : fix_string option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_Allocation_EncodedIssuerLen : int option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_Allocation_EncodedIssuer : fix_string option;
    f_Allocation_SecurityDesc : fix_string option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_Allocation_EncodedSecurityDescLen : int option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_Allocation_EncodedSecurityDesc : fix_string option;
    (** Total number of shares allocated to all accounts*)
    f_Allocation_Shares : fix_float;
    (** Market of the executions.*)
    f_Allocation_LastMkt : fix_exchange option;
    f_Allocation_TradingSessionID : fix_string option;
    (** For F/X orders, should be the "all-in" rate (spot rate adjusted for forward points).*)
    f_Allocation_AvgPx : fix_float;
    (** Currency of AvgPx. Should be the currency of the local market or exchange where the trade was conducted.*)
    f_Allocation_Currency : fix_currency option;
    (** Absence of this field indicates that default precision arranged by the broker/institution is to be used*)
    f_Allocation_AvgPrxPrecision : int option;
    f_Allocation_TradeDate : fix_localmktdate;
    (** Date/time when allocation is generated*)
    f_Allocation_TransactTime : fix_utctimestamp option;
    (** Absence of this field is interpreted as Regular*)
    f_Allocation_SettlmntTyp : fix_settlmnttyp option;
    (** "Settlement Date". Required with SettlmntTyp other than regular*)
    f_Allocation_FutSettDate : fix_localmktdate option;
    (** Expressed in same currency as AvgPx. Sum of (AllocShares * AllocAvgPx or AllocPrice).*)
    f_Allocation_GrossTradeAmt : fix_float option;
    (** Expressed in same currency as AvgPx. Sum of AllocNetMoney.*)
    f_Allocation_NetMoney : fix_float option;
    f_Allocation_OpenClose : fix_openclose option;
    f_Allocation_Text : fix_string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_Allocation_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_Allocation_EncodedText : fix_string option;
    (** Applicable for Convertible Bonds and fixed income*)
    f_Allocation_NumDaysInterest : int option;
    (** Applicable for Convertible Bonds and fixed income*)
    f_Allocation_AccruedInterestRate : fix_float option;
    f_Allocation_AllocationOrders : fix_rg_allocationorders;
    f_Allocation_AllocationExecs : fix_rg_allocationexecs;
    f_Allocation_AllocationAllocs : fix_rg_allocationallocs;
    f_Allocation_AllocationMiscFees : fix_rg_allocationmiscfees
}
;;

(** The allocation ACK message is used to acknowledge the receipt and status of an allocation message received from the institution.*)
type full_fix_allocationinstructionack_data = {
    (** Used for firm identification in third-party transactions (should not be a substitute for OnBehalfOfCompID/DeliverToCompID).*)
    f_AllocationInstructionAck_ClientID : fix_string option;
    (** Used for firm identification in third-party transactions (should not be a substitute for OnBehalfOfCompID/DeliverToCompID).*)
    f_AllocationInstructionAck_ExecBroker : fix_string option;
    f_AllocationInstructionAck_AllocID : fix_string;
    f_AllocationInstructionAck_TradeDate : fix_localmktdate;
    (** Date/Time AllocationACK generated*)
    f_AllocationInstructionAck_TransactTime : fix_utctimestamp option;
    f_AllocationInstructionAck_AllocStatus : fix_allocstatus;
    (** Required for AllocStatus = 1 (rejected)*)
    f_AllocationInstructionAck_AllocRejCode : fix_allocrejcode option;
    (** Can include explanation for AllocRejCode = 7 (other)*)
    f_AllocationInstructionAck_Text : fix_string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_AllocationInstructionAck_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_AllocationInstructionAck_EncodedText : fix_string option
}
;;

(** The BidRequest Message can be used in one of two ways depending on which market conventions are being followed.*)
type full_fix_bidrequest_data = {
    (** Required to relate the bid response*)
    f_BidRequest_BidID : fix_string option;
    f_BidRequest_ClientBidID : fix_string;
    (** Identifies the Bid Request message transaction type*)
    f_BidRequest_BidRequestTransType : fix_bidrequesttranstype;
    f_BidRequest_ListName : fix_string option;
    f_BidRequest_TotalNumSecurities : int;
    (** e.g. "Non Disclosed", "Disclosed", No Bidding Process*)
    f_BidRequest_BidType : int;
    (** Total number of tickets/allocations assuming fully executed*)
    f_BidRequest_NumTickets : int option;
    (** Used to represent the currency of monetary amounts.*)
    f_BidRequest_Currency : fix_currency option;
    (** Expressed in Currency*)
    f_BidRequest_SideValue1 : fix_float option;
    (** Expressed in Currency*)
    f_BidRequest_SideValue2 : fix_float option;
    f_BidRequest_LiquidityIndType : fix_liquidityindtype option;
    (** Overall weighted average liquidity expressed as a % of average daily volume*)
    f_BidRequest_WtAverageLiquidity : fix_float option;
    f_BidRequest_ExchangeForPhysical : fix_exchangeforphysical option;
    (** % value of stocks outside main country in Currency*)
    f_BidRequest_OutMainCntryUIndex : fix_float option;
    (** % of program that crosses in Currency*)
    f_BidRequest_CrossPercent : fix_float option;
    f_BidRequest_ProgRptReqs : fix_progrptreqs option;
    (** Time in minutes between each ListStatus report sent by SellSide. Zero means don’t send status.*)
    f_BidRequest_ProgPeriodInterval : int option;
    (** Net/Gross*)
    f_BidRequest_IncTaxInd : fix_inctaxind option;
    (** Is foreign exchange required*)
    f_BidRequest_ForexReq : fix_forexreq option;
    (** Indicates the total number of bidders on the list*)
    f_BidRequest_NumBidders : int option;
    f_BidRequest_TradeDate : fix_localmktdate option;
    f_BidRequest_TradeType : fix_tradetype;
    f_BidRequest_BasisPxType : fix_basispxtype;
    (** Used when BasisPxType = "C"*)
    f_BidRequest_StrikeTime : fix_utctimestamp option;
    f_BidRequest_Text : fix_string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_BidRequest_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_BidRequest_EncodedText : fix_string option;
    f_BidRequest_BidRequestBidDescriptors : fix_rg_bidrequestbiddescriptors;
    f_BidRequest_BidRequestBidComponents : fix_rg_bidrequestbidcomponents
}
;;

(** The Bid Response message can be used in one of two ways depending on which market conventions are being followed.
       In the "Non disclosed" convention the Bid Response message can be used to supply a bid based on the sector, country, index and liquidity information contained within the corresponding bid request message. See "Program/Basket/List Trading"  for an example.
       In the "Disclosed" convention the Bid Response message can be used to supply bids based on the List Order Detail messages sent in advance of the corresponding Bid Request message.*)
type full_fix_bidresponse_data = {
    f_BidResponse_BidID : fix_string option;
    f_BidResponse_ClientBidID : fix_string option;
    f_BidResponse_BidResponseBidComponents : fix_rg_bidresponsebidcomponents
}
;;

(** The Don’t Know Trade (DK) message notifies a trading partner that an electronically received execution has been rejected.*)
type full_fix_dontknowtrade_data = {
    (** Broker Order ID as identified on problem execution*)
    f_DontKnowTrade_OrderID : fix_string;
    (** Execution ID of problem execution*)
    f_DontKnowTrade_ExecID : fix_string;
    f_DontKnowTrade_DKReason : fix_dkreason;
    f_DontKnowTrade_Symbol : fix_string;
    f_DontKnowTrade_SymbolSfx : fix_string option;
    f_DontKnowTrade_SecurityID : fix_string option;
    f_DontKnowTrade_IDSource : fix_idsource option;
    (** Must be specified if a Future or Option. If a Future: Symbol, SecurityType, and MaturityMonthYear are required. If an Option: Symbol, SecurityType, MaturityMonthYear, PutOrCall, and StrikePrice are required.*)
    f_DontKnowTrade_SecurityType : fix_securitytype option;
    (** Specifiesthe month and year of maturity. Required if MaturityDay is specified.*)
    f_DontKnowTrade_MaturityMonthYear : fix_monthyear option;
    (** Can be used in conjunction with MaturityMonthYear to specify a particular maturity date.*)
    f_DontKnowTrade_MaturityDay : int option;
    (** For Options.*)
    f_DontKnowTrade_PutOrCall : fix_putorcall option;
    (** For Options.*)
    f_DontKnowTrade_StrikePrice : fix_float option;
    (** For Options.*)
    f_DontKnowTrade_OptAttribute : int option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_DontKnowTrade_ContractMultiplier : fix_float option;
    (** For Fixed Income.*)
    f_DontKnowTrade_CouponRate : fix_float option;
    (** Can be used to identify the security.*)
    f_DontKnowTrade_SecurityExchange : fix_exchange option;
    f_DontKnowTrade_Issuer : fix_string option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_DontKnowTrade_EncodedIssuerLen : int option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_DontKnowTrade_EncodedIssuer : fix_string option;
    f_DontKnowTrade_SecurityDesc : fix_string option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_DontKnowTrade_EncodedSecurityDescLen : int option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_DontKnowTrade_EncodedSecurityDesc : fix_string option;
    f_DontKnowTrade_Side : fix_side;
    (** Either CashOrderQty or OrderQty is required.*)
    f_DontKnowTrade_OrderQty : fix_float option;
    (** Either CashOrderQty or OrderQty is required. Specifies the approximate "monetary quantity" for the order. Broker is responsible for converting and calculating OrderQty in shares for subsequent messages.*)
    f_DontKnowTrade_CashOrderQty : fix_float option;
    (** Required if specified on the ExecutionRpt*)
    f_DontKnowTrade_LastShares : fix_float option;
    (** Required if specified on the ExecutionRpt*)
    f_DontKnowTrade_LastPx : fix_float option;
    f_DontKnowTrade_Text : fix_string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_DontKnowTrade_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_DontKnowTrade_EncodedText : fix_string option
}
;;

(** The email message is similar to the format and purpose of to the News message, however, it is intended for private use between two parties.*)
type full_fix_email_data = {
    (** Unique identifier for the email message thread*)
    f_Email_EmailThreadID : fix_string;
    f_Email_EmailType : fix_emailtype;
    f_Email_OrigTime : fix_utctimestamp option;
    (** Specifies the Subject text*)
    f_Email_Subject : fix_string;
    (** Must be set if EncodedSubject field is specified and must immediately precede it.*)
    f_Email_EncodedSubjectLen : int option;
    (** Encoded (non-ASCII characters) representation of the Subject field in the encoded format specified via the MessageEncoding field.*)
    f_Email_EncodedSubject : fix_string option;
    f_Email_OrderID : fix_string option;
    f_Email_ClOrdID : fix_string option;
    f_Email_RawDataLength : int option;
    f_Email_RawData : fix_string option;
    f_Email_EmailRoutingIDs : fix_rg_emailroutingids;
    f_Email_EmailRelatedSym : fix_rg_emailrelatedsym;
    f_Email_EmailLinesOfText : fix_rg_emaillinesoftext
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
    f_ExecutionReport_OrderID : fix_string;
    (** Can be used to provide order id used by exchange or executing system.*)
    f_ExecutionReport_SecondaryOrderID : fix_string option;
    (** Required for executions against electronically submitted orders which were assigned an ID by the institution. Not required for orders manually entered by the broker.*)
    f_ExecutionReport_ClOrdID : fix_string option;
    (** Conditionally required for response to an electronic Cancel or Cancel/Replace request (ExecType=PendingCancel, Replaced, or Canceled). ClOrdID of the previous order (NOT the initial order of the day) when canceling or replacing an order.*)
    f_ExecutionReport_OrigClOrdID : fix_string option;
    (** Used for firm identification in third-party transactions (should not be a substitute for OnBehalfOfCompID/DeliverToCompID).*)
    f_ExecutionReport_ClientID : fix_string option;
    (** Used for firm identification in third-party transactions (should not be a substitute for OnBehalfOfCompID/DeliverToCompID).*)
    f_ExecutionReport_ExecBroker : fix_string option;
    (** Required for executions against orders which were submitted as part of a list.*)
    f_ExecutionReport_ListID : fix_string option;
    (** Must be unique for each Execution Report message*)
    f_ExecutionReport_ExecID : fix_string;
    f_ExecutionReport_ExecTransType : fix_exectranstype;
    (** Required for Cancel and Correct ExecTransType messages*)
    f_ExecutionReport_ExecRefID : fix_string option;
    (** Describes the type of execution report. Same possible values as OrdStatus.*)
    f_ExecutionReport_ExecType : fix_exectype;
    (** Describes the current state of a CHAIN of orders, same scope as OrderQty, CumQty, LeavesQty, and AvgPx*)
    f_ExecutionReport_OrdStatus : fix_ordstatus;
    (** For optional use with ExecType = 8 (Rejected)*)
    f_ExecutionReport_OrdRejReason : fix_ordrejreason option;
    (** Required for ExecType = D (Restated).*)
    f_ExecutionReport_ExecRestatementReason : fix_execrestatementreason option;
    (** Required for executions against electronically submitted orders which were assigned an account by the institution*)
    f_ExecutionReport_Account : fix_string option;
    (** Absence of this field is interpreted as Regular.*)
    f_ExecutionReport_SettlmntTyp : fix_settlmnttyp option;
    (** Required when SettlmntTyp = 6 (Future) or SettlmntTyp = 8 (Sellers Option)*)
    f_ExecutionReport_FutSettDate : fix_localmktdate option;
    f_ExecutionReport_Symbol : fix_string;
    f_ExecutionReport_SymbolSfx : fix_string option;
    f_ExecutionReport_SecurityID : fix_string option;
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
    f_ExecutionReport_StrikePrice : fix_float option;
    (** For Options.*)
    f_ExecutionReport_OptAttribute : int option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_ExecutionReport_ContractMultiplier : fix_float option;
    (** For Fixed Income.*)
    f_ExecutionReport_CouponRate : fix_float option;
    (** Can be used to identify the security.*)
    f_ExecutionReport_SecurityExchange : fix_exchange option;
    f_ExecutionReport_Issuer : fix_string option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_ExecutionReport_EncodedIssuerLen : int option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_ExecutionReport_EncodedIssuer : fix_string option;
    f_ExecutionReport_SecurityDesc : fix_string option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_ExecutionReport_EncodedSecurityDescLen : int option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_ExecutionReport_EncodedSecurityDesc : fix_string option;
    f_ExecutionReport_Side : fix_side;
    (** Either CashOrderQty or OrderQty is required. Not required for a rejected cash order or an order ack for a cash order.*)
    f_ExecutionReport_OrderQty : fix_float option;
    (** Either CashOrderQty or OrderQty is required. Specifies the approximate "monetary quantity" conveyed on the order. Broker is responsible for converting and calculating OrderQty in shares for subsequent messages involving fills.*)
    f_ExecutionReport_CashOrderQty : fix_float option;
    f_ExecutionReport_OrdType : fix_ordtype option;
    (** Required if specified on the order*)
    f_ExecutionReport_Price : fix_float option;
    (** Required if specified on the order*)
    f_ExecutionReport_StopPx : fix_float option;
    (** Required if specified on the order*)
    f_ExecutionReport_PegDifference : fix_float option;
    (** Code to identify the price a DiscretionOffset is related to and should be mathematically added to. Required if DiscretionOffset is specified.*)
    f_ExecutionReport_DiscretionInst : fix_discretioninst option;
    (** Amount (signed) added to the "related to" price specified via DiscretionInst.*)
    f_ExecutionReport_DiscretionOffset : fix_float option;
    f_ExecutionReport_Currency : fix_currency option;
    f_ExecutionReport_ComplianceID : fix_string option;
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
    f_ExecutionReport_LastShares : fix_float option;
    (** Price of this (last) fill. Not required for ExecTransType = 3 (Status), Should represent the "all-in" (LastSpotRate + LastForwardPoints) rate for F/X orders. ). When required, should be "0" for non-fills ("fill" defined as ExecTransType=New and ExecType=Partial Fill or Fill) unless noted below.
     If ExecType=Stopped, represents the price stopped/guaranteed/protected at.*)
    f_ExecutionReport_LastPx : fix_float option;
    (** Applicable for F/X orders*)
    f_ExecutionReport_LastSpotRate : fix_float option;
    (** Applicable for F/X orders*)
    f_ExecutionReport_LastForwardPoints : fix_float option;
    f_ExecutionReport_LastMkt : fix_exchange option;
    f_ExecutionReport_TradingSessionID : fix_string option;
    f_ExecutionReport_LastCapacity : fix_lastcapacity option;
    (** Amount of shares open for further execution. If the OrdStatus is Canceled, DoneForTheDay, Expired, Calculated, or Rejected (in which case the order is no longer active) then LeavesQty could be 0, otherwise LeavesQty = OrderQty - CumQty.*)
    f_ExecutionReport_LeavesQty : fix_float;
    (** Currently executed shares for chain of orders.*)
    f_ExecutionReport_CumQty : fix_float;
    f_ExecutionReport_AvgPx : fix_float;
    (** For GT orders on days following the day of the first trade.*)
    f_ExecutionReport_DayOrderQty : fix_float option;
    (** For GT orders on days following the day of the first trade.*)
    f_ExecutionReport_DayCumQty : fix_float option;
    (** For GT orders on days following the day of the first trade.*)
    f_ExecutionReport_DayAvgPx : fix_float option;
    (** States whether executions are booked out or accumulated on a partially filled GT order*)
    f_ExecutionReport_GTBookingInst : fix_gtbookinginst option;
    (** Used when reporting other than current day trades.*)
    f_ExecutionReport_TradeDate : fix_localmktdate option;
    (** Time the transaction represented by this ExecutionReport occurred*)
    f_ExecutionReport_TransactTime : fix_utctimestamp option;
    f_ExecutionReport_ReportToExch : fix_reporttoexch option;
    (** On a fill/partial fill messages, it represents value for that fill/partial fill, on ExecType=Calculated, it represents cumulative value for the order. Monetary commission values are expressed in the currency reflected by the Currency field.*)
    f_ExecutionReport_Commission : fix_float option;
    f_ExecutionReport_CommType : fix_commtype option;
    f_ExecutionReport_GrossTradeAmt : fix_float option;
    (** Used to report results of forex accommodation trade*)
    f_ExecutionReport_SettlCurrAmt : fix_float option;
    (** Used to report results of forex accommodation trade*)
    f_ExecutionReport_SettlCurrency : fix_currency option;
    (** Foreign exchange rate used to compute SettlCurrAmt from Currency to SettlCurrency*)
    f_ExecutionReport_SettlCurrFxRate : fix_float option;
    (** Specifies whether the SettlCurrFxRate should be multiplied or divided*)
    f_ExecutionReport_SettlCurrFxRateCalc : int option;
    f_ExecutionReport_HandlInst : fix_handlinst option;
    f_ExecutionReport_MinQty : fix_float option;
    f_ExecutionReport_MaxFloor : fix_float option;
    (** For options*)
    f_ExecutionReport_OpenClose : fix_openclose option;
    f_ExecutionReport_MaxShow : fix_float option;
    f_ExecutionReport_Text : fix_string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_ExecutionReport_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_ExecutionReport_EncodedText : fix_string option;
    (** Can be used with OrdType = "Forex - Swap" to specify the "value date" for the future portion of a F/X swap.*)
    f_ExecutionReport_FutSettDate2 : fix_localmktdate option;
    (** Can be used with OrdType = "Forex - Swap" to specify the order quantity for the future portion of a F/X swap.*)
    f_ExecutionReport_OrderQty2 : fix_float option;
    f_ExecutionReport_ClearingFirm : fix_string option;
    f_ExecutionReport_ClearingAccount : fix_string option;
    (** Default is a single security if not specified.*)
    f_ExecutionReport_MultiLegReportingType : fix_multilegreportingtype option;
    f_ExecutionReport_ExecutionReportContraBrokers : fix_rg_executionreportcontrabrokers
}
;;

(** Indication of interest messages market merchandise which the broker is buying or selling in either a proprietary or agency capacity.*)
type full_fix_ioi_data = {
    f_IOI_IOIid : fix_string;
    f_IOI_IOITransType : fix_ioitranstype;
    (** Required for Cancel and Replace IOITransType messages*)
    f_IOI_IOIRefID : fix_string option;
    f_IOI_Symbol : fix_string;
    f_IOI_SymbolSfx : fix_string option;
    f_IOI_SecurityID : fix_string option;
    f_IOI_IDSource : fix_idsource option;
    (** Must be specified if a Future or Option. If a Future: Symbol, SecurityType, and MaturityMonthYear are required. If an Option: Symbol, SecurityType, MaturityMonthYear, PutOrCall, and StrikePrice are required.*)
    f_IOI_SecurityType : fix_securitytype option;
    (** Specifiesthe month and year of maturity. Required if MaturityDay is specified.*)
    f_IOI_MaturityMonthYear : fix_monthyear option;
    (** Can be used in conjunction with MaturityMonthYear to specify a particular maturity date.*)
    f_IOI_MaturityDay : int option;
    (** For Options.*)
    f_IOI_PutOrCall : fix_putorcall option;
    (** For Options.*)
    f_IOI_StrikePrice : fix_float option;
    (** For Options.*)
    f_IOI_OptAttribute : int option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_IOI_ContractMultiplier : fix_float option;
    (** For Fixed Income.*)
    f_IOI_CouponRate : fix_float option;
    (** Can be used to identify the security.*)
    f_IOI_SecurityExchange : fix_exchange option;
    f_IOI_Issuer : fix_string option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_IOI_EncodedIssuerLen : int option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_IOI_EncodedIssuer : fix_string option;
    f_IOI_SecurityDesc : fix_string option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_IOI_EncodedSecurityDescLen : int option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_IOI_EncodedSecurityDesc : fix_string option;
    (** Side of Indication
     Valid values:
     1 = Buy
     2 = Sell
     7 = Undisclosed (for IOIs)*)
    f_IOI_Side : fix_side;
    f_IOI_IOIShares : fix_ioishares;
    f_IOI_Price : fix_float option;
    f_IOI_Currency : fix_currency option;
    f_IOI_ValidUntilTime : fix_utctimestamp option;
    f_IOI_IOIQltyInd : fix_ioiqltyind option;
    f_IOI_IOINaturalFlag : fix_ioinaturalflag option;
    f_IOI_Text : fix_string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_IOI_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_IOI_EncodedText : fix_string option;
    f_IOI_TransactTime : fix_utctimestamp option;
    (** A URL (Uniform Resource Locator) link to additional information (i.e. http://www.XYZ.com/research.html)*)
    f_IOI_URLLink : fix_string option;
    (** For Fixed Income*)
    f_IOI_SpreadToBenchmark : fix_float option;
    (** For Fixed Income*)
    f_IOI_Benchmark : fix_benchmark option;
    f_IOI_IOIIOIQualifiers : fix_rg_ioiioiqualifiers;
    f_IOI_IOIRoutingIDs : fix_rg_ioiroutingids
}
;;

(** The list cancel request message type is used by institutions wishing to cancel previously submitted lists either before or during execution.*)
type full_fix_listcancelrequest_data = {
    f_ListCancelRequest_ListID : fix_string;
    (** Time this order request was initiated/released by the trader or trading system.*)
    f_ListCancelRequest_TransactTime : fix_utctimestamp;
    f_ListCancelRequest_Text : fix_string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_ListCancelRequest_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_ListCancelRequest_EncodedText : fix_string option
}
;;

(** The list execute message type is used by institutions to instruct the broker to begin execution of a previously submitted list.*)
type full_fix_listexecute_data = {
    (** Must be unique, by customer, for the day*)
    f_ListExecute_ListID : fix_string;
    (** Used with BidType=Disclosed to provide the sell side the ability to determine the direction of the trade to execute.*)
    f_ListExecute_ClientBidID : fix_string option;
    f_ListExecute_BidID : fix_string option;
    (** Time this order request was initiated/released by the trader or trading system.*)
    f_ListExecute_TransactTime : fix_utctimestamp;
    f_ListExecute_Text : fix_string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_ListExecute_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_ListExecute_EncodedText : fix_string option
}
;;

(** The list status message is issued as the response to a List Status Request message sent in an unsolicited fashion by the sell-side.*)
type full_fix_liststatus_data = {
    f_ListStatus_ListID : fix_string;
    f_ListStatus_ListStatusType : int;
    (** Total number of messages required to status complete list.*)
    f_ListStatus_NoRpts : int;
    f_ListStatus_ListOrderStatus : int;
    (** Sequence number of this report message.*)
    f_ListStatus_RptSeq : int;
    f_ListStatus_ListStatusText : fix_string option;
    (** Must be set if EncodedListStatusText field is specified and must immediately precede it.*)
    f_ListStatus_EncodedListStatusTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the ListStatusText field in the encoded format specified via the MessageEncoding field.*)
    f_ListStatus_EncodedListStatusText : fix_string option;
    f_ListStatus_TransactTime : fix_utctimestamp option;
    (** Used to support fragmentation. Sum of NoOrders across all messages with the same ListID.*)
    f_ListStatus_TotNoOrders : int;
    f_ListStatus_ListStatusOrders : fix_rg_liststatusorders
}
;;

(** The list status request message type is used by institutions to instruct the broker to generate status messages for a list.*)
type full_fix_liststatusrequest_data = {
    f_ListStatusRequest_ListID : fix_string;
    f_ListStatusRequest_Text : fix_string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_ListStatusRequest_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_ListStatusRequest_EncodedText : fix_string option
}
;;

(** The strike price message is used to exchange strike price information for principal trades. It can also be used to exchange reference prices for agency trades.*)
type full_fix_liststrikeprice_data = {
    f_ListStrikePrice_ListID : fix_string;
    (** Used to support fragmentation. Sum of NoStrikes across all messages with the same ListID.*)
    f_ListStrikePrice_TotNoStrikes : int;
    f_ListStrikePrice_ListStrikePriceStrikes : fix_rg_liststrikepricestrikes
}
;;

(** The second Market Data message format is used for incremental updates.*)
type full_fix_marketdataincrementalrefresh_data = {
    (** Conditionally required if this message is in response to a Market Data Request.*)
    f_MarketDataIncrementalRefresh_MDReqID : fix_string option;
    f_MarketDataIncrementalRefresh_MarketDataIncrementalRefreshMDEntries : fix_rg_marketdataincrementalrefreshmdentries
}
;;

(** Some systems allow the transmission of real-time quote, order, trade and/or other price information on a subscription basis.*)
type full_fix_marketdatarequest_data = {
    (** Must be unique, or the ID of previous Market Data Request to disable if SubscriptionRequestType = Disable previous Snapshot + Updates Request (2).*)
    f_MarketDataRequest_MDReqID : fix_string;
    (** SubcriptionRequestType indicates to the other party what type of response is expected. A snapshot request only asks for current information. A subscribe request asks for updates as the status changes. Unsubscribe will cancel any future update messages from the counter party.*)
    f_MarketDataRequest_SubscriptionRequestType : fix_subscriptionrequesttype;
    f_MarketDataRequest_MarketDepth : int;
    (** Required if SubscriptionRequestType = Snapshot + Updates (1).*)
    f_MarketDataRequest_MDUpdateType : fix_mdupdatetype option;
    f_MarketDataRequest_AggregatedBook : fix_aggregatedbook option;
    f_MarketDataRequest_MarketDataRequestMDEntryTypes : fix_rg_marketdatarequestmdentrytypes;
    f_MarketDataRequest_MarketDataRequestRelatedSym : fix_rg_marketdatarequestrelatedsym
}
;;

(** The Market Data Request Reject is used when the broker cannot honor the Market Data Request, due to business or technical reasons.*)
type full_fix_marketdatarequestreject_data = {
    (** Must refer to the MDReqID of the request.*)
    f_MarketDataRequestReject_MDReqID : fix_string;
    f_MarketDataRequestReject_MDReqRejReason : fix_mdreqrejreason option;
    f_MarketDataRequestReject_Text : fix_string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_MarketDataRequestReject_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_MarketDataRequestReject_EncodedText : fix_string option
}
;;

(** The Market Data messages are used as the response to a Market Data Request message.*)
type full_fix_marketdatasnapshotfullrefresh_data = {
    (** Conditionally required if this message is in response to a Market Data Request.*)
    f_MarketDataSnapshotFullRefresh_MDReqID : fix_string option;
    f_MarketDataSnapshotFullRefresh_Symbol : fix_string;
    f_MarketDataSnapshotFullRefresh_SymbolSfx : fix_string option;
    f_MarketDataSnapshotFullRefresh_SecurityID : fix_string option;
    f_MarketDataSnapshotFullRefresh_IDSource : fix_idsource option;
    (** Must be specified if a Future or Option. If a Future: Symbol, SecurityType, and MaturityMonthYear are required. If an Option: Symbol, SecurityType, MaturityMonthYear, PutOrCall, and StrikePrice are required.*)
    f_MarketDataSnapshotFullRefresh_SecurityType : fix_securitytype option;
    (** Specifiesthe month and year of maturity. Required if MaturityDay is specified.*)
    f_MarketDataSnapshotFullRefresh_MaturityMonthYear : fix_monthyear option;
    (** Can be used in conjunction with MaturityMonthYear to specify a particular maturity date.*)
    f_MarketDataSnapshotFullRefresh_MaturityDay : int option;
    (** For Options.*)
    f_MarketDataSnapshotFullRefresh_PutOrCall : fix_putorcall option;
    (** For Options.*)
    f_MarketDataSnapshotFullRefresh_StrikePrice : fix_float option;
    (** For Options.*)
    f_MarketDataSnapshotFullRefresh_OptAttribute : int option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_MarketDataSnapshotFullRefresh_ContractMultiplier : fix_float option;
    (** For Fixed Income.*)
    f_MarketDataSnapshotFullRefresh_CouponRate : fix_float option;
    (** Can be used to identify the security.*)
    f_MarketDataSnapshotFullRefresh_SecurityExchange : fix_exchange option;
    f_MarketDataSnapshotFullRefresh_Issuer : fix_string option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_MarketDataSnapshotFullRefresh_EncodedIssuerLen : int option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_MarketDataSnapshotFullRefresh_EncodedIssuer : fix_string option;
    f_MarketDataSnapshotFullRefresh_SecurityDesc : fix_string option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_MarketDataSnapshotFullRefresh_EncodedSecurityDescLen : int option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_MarketDataSnapshotFullRefresh_EncodedSecurityDesc : fix_string option;
    f_MarketDataSnapshotFullRefresh_FinancialStatus : fix_financialstatus option;
    f_MarketDataSnapshotFullRefresh_CorporateAction : fix_corporateaction option;
    (** Total volume traded in this trading session for this security.*)
    f_MarketDataSnapshotFullRefresh_TotalVolumeTraded : fix_float option;
    f_MarketDataSnapshotFullRefresh_MarketDataSnapshotFullRefreshMDEntries : fix_rg_marketdatasnapshotfullrefreshmdentries
}
;;

(** The Mass Quote message can contain quotes for multiple securities to support applications that allow for the mass quoting of an option series.*)
type full_fix_massquote_data = {
    (** Required when quote is in response to a Quote Request message*)
    f_MassQuote_QuoteReqID : fix_string option;
    f_MassQuote_QuoteID : fix_string;
    (** Level of Response requested from receiver of quote messages.*)
    f_MassQuote_QuoteResponseLevel : fix_quoteresponselevel option;
    (** Default Bid Size for quote contained within this quote message – if not explicitly provided.*)
    f_MassQuote_DefBidSize : fix_float option;
    (** Default Offer Size for quotes contained within this quote message – if not explicitly provided.*)
    f_MassQuote_DefOfferSize : fix_float option;
    f_MassQuote_MassQuoteQuoteSets : fix_rg_massquotequotesets;
    f_MassQuote_MassQuoteQuoteEntries : fix_rg_massquotequoteentries
}
;;

(** The news message is a general free format message between the broker and institution.*)
type full_fix_news_data = {
    f_News_OrigTime : fix_utctimestamp option;
    f_News_Urgency : fix_urgency option;
    (** Specifies the headline text*)
    f_News_Headline : fix_string;
    (** Must be set if EncodedHeadline field is specified and must immediately precede it.*)
    f_News_EncodedHeadlineLen : int option;
    (** Encoded (non-ASCII characters) representation of the Headline field in the encoded format specified via the MessageEncoding field.*)
    f_News_EncodedHeadline : fix_string option;
    (** A URL (Uniform Resource Locator) link to additional information (i.e. http://www.XYZ.com/research.html)*)
    f_News_URLLink : fix_string option;
    f_News_RawDataLength : int option;
    f_News_RawData : fix_string option;
    f_News_NewsRoutingIDs : fix_rg_newsroutingids;
    f_News_NewsRelatedSym : fix_rg_newsrelatedsym;
    f_News_NewsLinesOfText : fix_rg_newslinesoftext
}
;;

(** The order cancel reject message is issued by the broker upon receipt of a cancel request or cancel/replace request message which cannot be honored.*)
type full_fix_ordercancelreject_data = {
    (** If CxlRejReason="Unknown order", specify "NONE".*)
    f_OrderCancelReject_OrderID : fix_string;
    (** Can be used to provide order id used by exchange or executing system.*)
    f_OrderCancelReject_SecondaryOrderID : fix_string option;
    (** Unique order id assigned by institution to the cancel request or to the replacement order.*)
    f_OrderCancelReject_ClOrdID : fix_string;
    (** ClOrdID which could not be canceled/replaced. ClOrdID of the previous order (NOT the initial order of the day) when canceling or replacing an order.*)
    f_OrderCancelReject_OrigClOrdID : fix_string;
    (** OrdStatus value after this cancel reject is applied.*)
    f_OrderCancelReject_OrdStatus : fix_ordstatus;
    (** Used for firm identification in third-party transactions (should not be a substitute for OnBehalfOfCompID/DeliverToCompID).*)
    f_OrderCancelReject_ClientID : fix_string option;
    (** Used for firm identification in third-party transactions (should not be a substitute for OnBehalfOfCompID/DeliverToCompID).*)
    f_OrderCancelReject_ExecBroker : fix_string option;
    (** Required for rejects against orders which were submitted as part of a list.*)
    f_OrderCancelReject_ListID : fix_string option;
    f_OrderCancelReject_Account : fix_string option;
    f_OrderCancelReject_TransactTime : fix_utctimestamp option;
    f_OrderCancelReject_CxlRejResponseTo : fix_cxlrejresponseto;
    f_OrderCancelReject_CxlRejReason : fix_cxlrejreason option;
    f_OrderCancelReject_Text : fix_string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_OrderCancelReject_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_OrderCancelReject_EncodedText : fix_string option
}
;;

(** The order cancel/replace request is used to change the parameters of an existing order.*)
type full_fix_ordercancelreplacerequest_data = {
    (** Unique identifier of most recent order as assigned by broker.*)
    f_OrderCancelReplaceRequest_OrderID : fix_string option;
    (** Used for firm identification in third-party transactions (should not be a substitute for OnBehalfOfCompID/DeliverToCompID).*)
    f_OrderCancelReplaceRequest_ClientID : fix_string option;
    (** Used for firm identification in third-party transactions (should not be a substitute for OnBehalfOfCompID/DeliverToCompID).*)
    f_OrderCancelReplaceRequest_ExecBroker : fix_string option;
    (** ClOrdID of the previous order (NOT the initial order of the day) when canceling or replacing an order.*)
    f_OrderCancelReplaceRequest_OrigClOrdID : fix_string;
    (** Unique identifier of replacement order as assigned by institution. Note that this identifier will be used in ClOrdID field of the Cancel Reject message if the replacement request is rejected.*)
    f_OrderCancelReplaceRequest_ClOrdID : fix_string;
    (** Required for List Orders*)
    f_OrderCancelReplaceRequest_ListID : fix_string option;
    f_OrderCancelReplaceRequest_Account : fix_string option;
    (** Absence of this field is interpreted as Regular.*)
    f_OrderCancelReplaceRequest_SettlmntTyp : fix_settlmnttyp option;
    (** Required when SettlmntTyp = 6 (Future) or SettlmntTyp = 8 (Sellers Option)*)
    f_OrderCancelReplaceRequest_FutSettDate : fix_localmktdate option;
    f_OrderCancelReplaceRequest_HandlInst : fix_handlinst;
    (** Can contain multiple instructions, space delimited. Replacement order must be created with new parameters (i.e. original order values will not be brought forward to replacement order unless redefined within this message).*)
    f_OrderCancelReplaceRequest_ExecInst : fix_execinst option;
    f_OrderCancelReplaceRequest_MinQty : fix_float option;
    f_OrderCancelReplaceRequest_MaxFloor : fix_float option;
    f_OrderCancelReplaceRequest_ExDestination : fix_exchange option;
    (** Must match original order*)
    f_OrderCancelReplaceRequest_Symbol : fix_string;
    f_OrderCancelReplaceRequest_SymbolSfx : fix_string option;
    (** Must match original order*)
    f_OrderCancelReplaceRequest_SecurityID : fix_string option;
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
    f_OrderCancelReplaceRequest_StrikePrice : fix_float option;
    (** For Options.*)
    f_OrderCancelReplaceRequest_OptAttribute : int option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_OrderCancelReplaceRequest_ContractMultiplier : fix_float option;
    (** For Fixed Income.*)
    f_OrderCancelReplaceRequest_CouponRate : fix_float option;
    (** Can be used to identify the security.*)
    f_OrderCancelReplaceRequest_SecurityExchange : fix_exchange option;
    f_OrderCancelReplaceRequest_Issuer : fix_string option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_OrderCancelReplaceRequest_EncodedIssuerLen : int option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_OrderCancelReplaceRequest_EncodedIssuer : fix_string option;
    f_OrderCancelReplaceRequest_SecurityDesc : fix_string option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_OrderCancelReplaceRequest_EncodedSecurityDescLen : int option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_OrderCancelReplaceRequest_EncodedSecurityDesc : fix_string option;
    (** Must match original side, however, Buy and Buy Minus can be interchanged as well as Sell and Sell Plus*)
    f_OrderCancelReplaceRequest_Side : fix_side;
    (** Time this order request was initiated/released by the trader or trading system.*)
    f_OrderCancelReplaceRequest_TransactTime : fix_utctimestamp;
    (** Either CashOrderQty or OrderQty is required. Note that either, but not both, CashOrderQty or OrderQty should be specified. Should be the "Total Intended Order Quantity" (including the amount already executed for this chain of orders)*)
    f_OrderCancelReplaceRequest_OrderQty : fix_float option;
    (** Either CashOrderQty or OrderQty is required. Note that either, but not both, CashOrderQty or OrderQty should be specified. Specifies the approximate "monetary quantity" for the order. Broker is responsible for converting and calculating OrderQty in shares for subsequent messages.*)
    f_OrderCancelReplaceRequest_CashOrderQty : fix_float option;
    f_OrderCancelReplaceRequest_OrdType : fix_ordtype;
    (** Required for limit OrdTypes. For F/X orders, should be the "all-in" rate (spot rate adjusted for forward points). Can be used to specify a limit price for a pegged order, previously indicated, etc.*)
    f_OrderCancelReplaceRequest_Price : fix_float option;
    (** Required for OrdType = "Stop" or OrdType = "Stop limit".*)
    f_OrderCancelReplaceRequest_StopPx : fix_float option;
    (** Amount (signed) added to the price of the peg*)
    f_OrderCancelReplaceRequest_PegDifference : fix_float option;
    (** Code to identify the price a DiscretionOffset is related to and should be mathematically added to. Required if DiscretionOffset is specified.*)
    f_OrderCancelReplaceRequest_DiscretionInst : fix_discretioninst option;
    (** Amount (signed) added to the "related to" price specified via DiscretionInst.*)
    f_OrderCancelReplaceRequest_DiscretionOffset : fix_float option;
    f_OrderCancelReplaceRequest_ComplianceID : fix_string option;
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
    f_OrderCancelReplaceRequest_Commission : fix_float option;
    f_OrderCancelReplaceRequest_CommType : fix_commtype option;
    (** Must match original order*)
    f_OrderCancelReplaceRequest_Rule80A : fix_rule80a option;
    (** Indicates that broker is requested to execute a Forex accommodation trade in conjunction with the security trade.*)
    f_OrderCancelReplaceRequest_ForexReq : fix_forexreq option;
    (** Required if ForexReq = Y.*)
    f_OrderCancelReplaceRequest_SettlCurrency : fix_currency option;
    f_OrderCancelReplaceRequest_Text : fix_string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_OrderCancelReplaceRequest_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_OrderCancelReplaceRequest_EncodedText : fix_string option;
    (** Can be used with OrdType = "Forex - Swap" to specify the "value date" for the future portion of a F/X swap.*)
    f_OrderCancelReplaceRequest_FutSettDate2 : fix_localmktdate option;
    (** Can be used with OrdType = "Forex - Swap" to specify the order quantity for the future portion of a F/X swap.*)
    f_OrderCancelReplaceRequest_OrderQty2 : fix_float option;
    (** For options*)
    f_OrderCancelReplaceRequest_OpenClose : fix_openclose option;
    (** For options*)
    f_OrderCancelReplaceRequest_CoveredOrUncovered : fix_coveredoruncovered option;
    (** For options when delivering the order to execution system/exchange.*)
    f_OrderCancelReplaceRequest_CustomerOrFirm : fix_customerorfirm option;
    f_OrderCancelReplaceRequest_MaxShow : fix_float option;
    f_OrderCancelReplaceRequest_LocateReqd : fix_locatereqd option;
    f_OrderCancelReplaceRequest_ClearingFirm : fix_string option;
    f_OrderCancelReplaceRequest_ClearingAccount : fix_string option;
    f_OrderCancelReplaceRequest_OrderCancelReplaceRequestAllocs : fix_rg_ordercancelreplacerequestallocs;
    f_OrderCancelReplaceRequest_OrderCancelReplaceRequestTradingSessions : fix_rg_ordercancelreplacerequesttradingsessions
}
;;

(** The order cancel request message requests the cancellation of all of the remaining quantity of an existing order.*)
type full_fix_ordercancelrequest_data = {
    (** ClOrdID of the previous order (NOT the initial order of the day) when canceling or replacing an order.*)
    f_OrderCancelRequest_OrigClOrdID : fix_string;
    (** Unique identifier of most recent order as assigned by broker.*)
    f_OrderCancelRequest_OrderID : fix_string option;
    (** Unique ID of cancel request as assigned by the institution.*)
    f_OrderCancelRequest_ClOrdID : fix_string;
    (** Required for List Orders*)
    f_OrderCancelRequest_ListID : fix_string option;
    f_OrderCancelRequest_Account : fix_string option;
    (** Used for firm identification in third-party transactions (should not be a substitute for OnBehalfOfCompID/DeliverToCompID).*)
    f_OrderCancelRequest_ClientID : fix_string option;
    (** Used for firm identification in third-party transactions (should not be a substitute for OnBehalfOfCompID/DeliverToCompID).*)
    f_OrderCancelRequest_ExecBroker : fix_string option;
    f_OrderCancelRequest_Symbol : fix_string;
    f_OrderCancelRequest_SymbolSfx : fix_string option;
    f_OrderCancelRequest_SecurityID : fix_string option;
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
    f_OrderCancelRequest_StrikePrice : fix_float option;
    (** For Options.*)
    f_OrderCancelRequest_OptAttribute : int option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_OrderCancelRequest_ContractMultiplier : fix_float option;
    (** For Fixed Income.*)
    f_OrderCancelRequest_CouponRate : fix_float option;
    (** Can be used to identify the security.*)
    f_OrderCancelRequest_SecurityExchange : fix_exchange option;
    f_OrderCancelRequest_Issuer : fix_string option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_OrderCancelRequest_EncodedIssuerLen : int option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_OrderCancelRequest_EncodedIssuer : fix_string option;
    f_OrderCancelRequest_SecurityDesc : fix_string option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_OrderCancelRequest_EncodedSecurityDescLen : int option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_OrderCancelRequest_EncodedSecurityDesc : fix_string option;
    f_OrderCancelRequest_Side : fix_side;
    (** Time this order request was initiated/released by the trader or trading system.*)
    f_OrderCancelRequest_TransactTime : fix_utctimestamp;
    (** Either CashOrderQty or OrderQty is required. OrderQty = CumQty + LeavesQty (see exceptions above)*)
    f_OrderCancelRequest_OrderQty : fix_float option;
    (** Either CashOrderQty or OrderQty is required. Specifies the approximate "monetary quantity" for the order. Broker is responsible for converting and calculating OrderQty in shares for subsequent messages.*)
    f_OrderCancelRequest_CashOrderQty : fix_float option;
    f_OrderCancelRequest_ComplianceID : fix_string option;
    f_OrderCancelRequest_SolicitedFlag : fix_solicitedflag option;
    f_OrderCancelRequest_Text : fix_string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_OrderCancelRequest_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_OrderCancelRequest_EncodedText : fix_string option
}
;;

(** The NewOrderList Message can be used in one of two ways depending on which market conventions are being followed.*)
type full_fix_orderlist_data = {
    (** Must be unique, by customer, for the day*)
    f_OrderList_ListID : fix_string;
    (** Should refer to an earlier program if bidding took place.*)
    f_OrderList_BidID : fix_string option;
    f_OrderList_ClientBidID : fix_string option;
    f_OrderList_ProgRptReqs : fix_progrptreqs option;
    (** e.g. Non Disclosed Model, Disclosed Model, No Bidding Process*)
    f_OrderList_BidType : int;
    f_OrderList_ProgPeriodInterval : int option;
    (** Controls when execution should be begin.*)
    f_OrderList_ListExecInstType : fix_listexecinsttype option;
    (** Free-form text.*)
    f_OrderList_ListExecInst : fix_string option;
    (** Must be set if EncodedListExecInst field is specified and must immediately precede it.*)
    f_OrderList_EncodedListExecInstLen : int option;
    (** Encoded (non-ASCII characters) representation of the ListExecInst field in the encoded format specified via the MessageEncoding field.*)
    f_OrderList_EncodedListExecInst : fix_string option;
    (** Used to support fragmentation. Sum of NoOrders across all messages with the same ListID.*)
    f_OrderList_TotNoOrders : int;
    f_OrderList_OrderListOrders : fix_rg_orderlistorders;
    f_OrderList_OrderListAllocs : fix_rg_orderlistallocs;
    f_OrderList_OrderListTradingSessions : fix_rg_orderlisttradingsessions
}
;;

(** The new order message type is used by institutions wishing to electronically submit securities and forex orders to a broker for execution.*)
type full_fix_ordersingle_data = {
    (** Unique identifier of the order as assigned by institution.*)
    f_OrderSingle_ClOrdID : fix_string;
    (** Used for firm identification in third-party transactions (should not be a substitute for OnBehalfOfCompID/DeliverToCompID).*)
    f_OrderSingle_ClientID : fix_string option;
    (** Used for firm identification in third-party transactions (should not be a substitute for OnBehalfOfCompID/DeliverToCompID).*)
    f_OrderSingle_ExecBroker : fix_string option;
    f_OrderSingle_Account : fix_string option;
    (** Absence of this field is interpreted as Regular.*)
    f_OrderSingle_SettlmntTyp : fix_settlmnttyp option;
    (** Required when SettlmntTyp = 6 (Future) or SettlmntTyp = 8 (Sellers Option)*)
    f_OrderSingle_FutSettDate : fix_localmktdate option;
    f_OrderSingle_HandlInst : fix_handlinst;
    (** Can contain multiple instructions, space delimited. If OrdType=P, exactly one of the following values (ExecInst = L, R, M, P, O, T, or W) must be specified.*)
    f_OrderSingle_ExecInst : fix_execinst option;
    f_OrderSingle_MinQty : fix_float option;
    f_OrderSingle_MaxFloor : fix_float option;
    f_OrderSingle_ExDestination : fix_exchange option;
    (** Used to identify soft trades at order entry.*)
    f_OrderSingle_ProcessCode : fix_processcode option;
    f_OrderSingle_Symbol : fix_string;
    f_OrderSingle_SymbolSfx : fix_string option;
    f_OrderSingle_SecurityID : fix_string option;
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
    f_OrderSingle_StrikePrice : fix_float option;
    (** For Options.*)
    f_OrderSingle_OptAttribute : int option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_OrderSingle_ContractMultiplier : fix_float option;
    (** For Fixed Income.*)
    f_OrderSingle_CouponRate : fix_float option;
    (** Can be used to identify the security.*)
    f_OrderSingle_SecurityExchange : fix_exchange option;
    f_OrderSingle_Issuer : fix_string option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_OrderSingle_EncodedIssuerLen : int option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_OrderSingle_EncodedIssuer : fix_string option;
    f_OrderSingle_SecurityDesc : fix_string option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_OrderSingle_EncodedSecurityDescLen : int option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_OrderSingle_EncodedSecurityDesc : fix_string option;
    (** Useful for verifying security identification*)
    f_OrderSingle_PrevClosePx : fix_float option;
    f_OrderSingle_Side : fix_side;
    (** Required for short sell orders*)
    f_OrderSingle_LocateReqd : fix_locatereqd option;
    (** Time this order request was initiated/released by the trader or trading system.*)
    f_OrderSingle_TransactTime : fix_utctimestamp;
    (** Either CashOrderQty or OrderQty is required. Note that either, but not both, CashOrderQty or OrderQty should be specified.*)
    f_OrderSingle_OrderQty : fix_float option;
    (** Either CashOrderQty or OrderQty is required. Note that either, but not both, CashOrderQty or OrderQty should be specified. Specifies the approximate "monetary quantity" for the order. Broker is responsible for converting and calculating OrderQty in shares for subsequent messages.*)
    f_OrderSingle_CashOrderQty : fix_float option;
    f_OrderSingle_OrdType : fix_ordtype;
    (** Required for limit OrdTypes. For F/X orders, should be the "all-in" rate (spot rate adjusted for forward points). Can be used to specify a limit price for a pegged order, previously indicated, etc.*)
    f_OrderSingle_Price : fix_float option;
    (** Required for OrdType = "Stop" or OrdType = "Stop limit".*)
    f_OrderSingle_StopPx : fix_float option;
    f_OrderSingle_Currency : fix_currency option;
    f_OrderSingle_ComplianceID : fix_string option;
    f_OrderSingle_SolicitedFlag : fix_solicitedflag option;
    (** Required for Previously Indicated Orders (OrdType=E)*)
    f_OrderSingle_IOIid : fix_string option;
    (** Required for Previously Quoted Orders (OrdType=D)*)
    f_OrderSingle_QuoteID : fix_string option;
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
    f_OrderSingle_Commission : fix_float option;
    f_OrderSingle_CommType : fix_commtype option;
    f_OrderSingle_Rule80A : fix_rule80a option;
    (** Indicates that broker is requested to execute a Forex accommodation trade in conjunction with the security trade.*)
    f_OrderSingle_ForexReq : fix_forexreq option;
    (** Required if ForexReq = Y.*)
    f_OrderSingle_SettlCurrency : fix_currency option;
    f_OrderSingle_Text : fix_string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_OrderSingle_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_OrderSingle_EncodedText : fix_string option;
    (** Can be used with OrdType = "Forex - Swap" to specify the "value date" for the future portion of a F/X swap.*)
    f_OrderSingle_FutSettDate2 : fix_localmktdate option;
    (** Can be used with OrdType = "Forex - Swap" to specify the order quantity for the future portion of a F/X swap.*)
    f_OrderSingle_OrderQty2 : fix_float option;
    (** For options*)
    f_OrderSingle_OpenClose : fix_openclose option;
    (** For options*)
    f_OrderSingle_CoveredOrUncovered : fix_coveredoruncovered option;
    (** For options when delivering the order to execution system/exchange.*)
    f_OrderSingle_CustomerOrFirm : fix_customerorfirm option;
    f_OrderSingle_MaxShow : fix_float option;
    (** Amount (signed) added to the price of the peg*)
    f_OrderSingle_PegDifference : fix_float option;
    (** Code to identify the price a DiscretionOffset is related to and should be mathematically added to. Required if DiscretionOffset is specified.*)
    f_OrderSingle_DiscretionInst : fix_discretioninst option;
    (** Amount (signed) added to the "related to" price specified via DiscretionInst.*)
    f_OrderSingle_DiscretionOffset : fix_float option;
    f_OrderSingle_ClearingFirm : fix_string option;
    f_OrderSingle_ClearingAccount : fix_string option;
    f_OrderSingle_OrderSingleAllocs : fix_rg_ordersingleallocs;
    f_OrderSingle_OrderSingleTradingSessions : fix_rg_ordersingletradingsessions
}
;;

(** The order status request message is used by the institution to generate an order status message back from the broker.*)
type full_fix_orderstatusrequest_data = {
    f_OrderStatusRequest_OrderID : fix_string option;
    f_OrderStatusRequest_ClOrdID : fix_string;
    (** Used for firm identification in third-party transactions (should not be a substitute for OnBehalfOfCompID/DeliverToCompID).*)
    f_OrderStatusRequest_ClientID : fix_string option;
    f_OrderStatusRequest_Account : fix_string option;
    (** Used for firm identification in third-party transactions (should not be a substitute for OnBehalfOfCompID/DeliverToCompID).*)
    f_OrderStatusRequest_ExecBroker : fix_string option;
    f_OrderStatusRequest_Symbol : fix_string;
    f_OrderStatusRequest_SymbolSfx : fix_string option;
    f_OrderStatusRequest_SecurityID : fix_string option;
    f_OrderStatusRequest_IDSource : fix_idsource option;
    (** Must be specified if a Future or Option. If a Future: Symbol, SecurityType, and MaturityMonthYear are required. If an Option: Symbol, SecurityType, MaturityMonthYear, PutOrCall, and StrikePrice are required.*)
    f_OrderStatusRequest_SecurityType : fix_securitytype option;
    (** Specifiesthe month and year of maturity. Required if MaturityDay is specified.*)
    f_OrderStatusRequest_MaturityMonthYear : fix_monthyear option;
    (** Can be used in conjunction with MaturityMonthYear to specify a particular maturity date.*)
    f_OrderStatusRequest_MaturityDay : int option;
    (** For Options.*)
    f_OrderStatusRequest_PutOrCall : fix_putorcall option;
    (** For Options.*)
    f_OrderStatusRequest_StrikePrice : fix_float option;
    (** For Options.*)
    f_OrderStatusRequest_OptAttribute : int option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_OrderStatusRequest_ContractMultiplier : fix_float option;
    (** For Fixed Income.*)
    f_OrderStatusRequest_CouponRate : fix_float option;
    (** Can be used to identify the security.*)
    f_OrderStatusRequest_SecurityExchange : fix_exchange option;
    f_OrderStatusRequest_Issuer : fix_string option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_OrderStatusRequest_EncodedIssuerLen : int option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_OrderStatusRequest_EncodedIssuer : fix_string option;
    f_OrderStatusRequest_SecurityDesc : fix_string option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_OrderStatusRequest_EncodedSecurityDescLen : int option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_OrderStatusRequest_EncodedSecurityDesc : fix_string option;
    f_OrderStatusRequest_Side : fix_side
}
;;

(** The quote message is used as the response to a Quote Request message and can be used to publish unsolicited quotes.*)
type full_fix_quote_data = {
    (** Required when quote is in response to a Quote Request message*)
    f_Quote_QuoteReqID : fix_string option;
    f_Quote_QuoteID : fix_string;
    (** Level of Response requested from receiver of quote messages.*)
    f_Quote_QuoteResponseLevel : fix_quoteresponselevel option;
    f_Quote_TradingSessionID : fix_string option;
    f_Quote_Symbol : fix_string;
    f_Quote_SymbolSfx : fix_string option;
    f_Quote_SecurityID : fix_string option;
    f_Quote_IDSource : fix_idsource option;
    (** Must be specified if a Future or Option. If a Future: Symbol, SecurityType, and MaturityMonthYear are required. If an Option: Symbol, SecurityType, MaturityMonthYear, PutOrCall, and StrikePrice are required.*)
    f_Quote_SecurityType : fix_securitytype option;
    (** Specifiesthe month and year of maturity. Required if MaturityDay is specified.*)
    f_Quote_MaturityMonthYear : fix_monthyear option;
    (** Can be used in conjunction with MaturityMonthYear to specify a particular maturity date.*)
    f_Quote_MaturityDay : int option;
    (** For Options.*)
    f_Quote_PutOrCall : fix_putorcall option;
    (** For Options.*)
    f_Quote_StrikePrice : fix_float option;
    (** For Options.*)
    f_Quote_OptAttribute : int option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_Quote_ContractMultiplier : fix_float option;
    (** For Fixed Income.*)
    f_Quote_CouponRate : fix_float option;
    (** Can be used to identify the security.*)
    f_Quote_SecurityExchange : fix_exchange option;
    f_Quote_Issuer : fix_string option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_Quote_EncodedIssuerLen : int option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_Quote_EncodedIssuer : fix_string option;
    f_Quote_SecurityDesc : fix_string option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_Quote_EncodedSecurityDescLen : int option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_Quote_EncodedSecurityDesc : fix_string option;
    (** If F/X quote, should be the "all-in" rate (spot rate adjusted for forward points). Note that either BidPx, OfferPx or both must be specified.*)
    f_Quote_BidPx : fix_float option;
    (** If F/X quote, should be the "all-in" rate (spot rate adjusted for forward points). Note that either BidPx, OfferPx or both must be specified.*)
    f_Quote_OfferPx : fix_float option;
    f_Quote_BidSize : fix_float option;
    f_Quote_OfferSize : fix_float option;
    f_Quote_ValidUntilTime : fix_utctimestamp option;
    (** May be applicable for F/X quotes*)
    f_Quote_BidSpotRate : fix_float option;
    (** May be applicable for F/X quotes*)
    f_Quote_OfferSpotRate : fix_float option;
    (** May be applicable for F/X quotes*)
    f_Quote_BidForwardPoints : fix_float option;
    (** May be applicable for F/X quotes*)
    f_Quote_OfferForwardPoints : fix_float option;
    f_Quote_TransactTime : fix_utctimestamp option;
    (** Can be used with forex quotes to specify a specific "value date"*)
    f_Quote_FutSettDate : fix_localmktdate option;
    (** Can be used to specify the type of order the quote is for*)
    f_Quote_OrdType : fix_ordtype option;
    (** Can be used with OrdType = "Forex - Swap" to specify the "value date" for the future portion of a F/X swap.*)
    f_Quote_FutSettDate2 : fix_localmktdate option;
    (** Can be used with OrdType = "Forex - Swap" to specify the order quantity for the future portion of a F/X swap.*)
    f_Quote_OrderQty2 : fix_float option;
    (** Can be used to specify the currency of the quoted price.*)
    f_Quote_Currency : fix_currency option
}
;;

(** An optional response to Quote, Mass Quote, Quote Cancel, and Quote Request message is the Quote Acknowledgement message.*)
type full_fix_quoteacknowledgement_data = {
    (** Required when acknowledgment is in response to a Quote Request message*)
    f_QuoteAcknowledgement_QuoteReqID : fix_string option;
    (** Required when acknowledgment is in response to a Quote message*)
    f_QuoteAcknowledgement_QuoteID : fix_string option;
    (** Status of the quote acknowledgement.*)
    f_QuoteAcknowledgement_QuoteAckStatus : fix_quoteackstatus;
    (** Reason Quote was rejected.*)
    f_QuoteAcknowledgement_QuoteRejectReason : fix_quoterejectreason option;
    (** Level of Response requested from receiver of quote messages. Is echoed back to the counterparty.*)
    f_QuoteAcknowledgement_QuoteResponseLevel : fix_quoteresponselevel option;
    f_QuoteAcknowledgement_TradingSessionID : fix_string option;
    f_QuoteAcknowledgement_Text : fix_string option;
    f_QuoteAcknowledgement_QuoteAcknowledgementQuoteSets : fix_rg_quoteacknowledgementquotesets;
    f_QuoteAcknowledgement_QuoteAcknowledgementQuoteEntries : fix_rg_quoteacknowledgementquoteentries
}
;;

(** The Quote Cancel message is used by an originator of quotes to cancel quotes.*)
type full_fix_quotecancel_data = {
    (** Required when quote is in response to a Quote Request message*)
    f_QuoteCancel_QuoteReqID : fix_string option;
    f_QuoteCancel_QuoteID : fix_string;
    (** Identifies the type of Quote Cancel request.*)
    f_QuoteCancel_QuoteCancelType : fix_quotecanceltype;
    (** Level of Response requested from receiver of quote messages.*)
    f_QuoteCancel_QuoteResponseLevel : fix_quoteresponselevel option;
    f_QuoteCancel_TradingSessionID : fix_string option;
    f_QuoteCancel_QuoteCancelQuoteEntries : fix_rg_quotecancelquoteentries
}
;;

(** In some markets it is the practice to request quotes from brokers prior to placement of an order. The quote request message is used for this purpose.*)
type full_fix_quoterequest_data = {
    f_QuoteRequest_QuoteReqID : fix_string;
    f_QuoteRequest_QuoteRequestRelatedSym : fix_rg_quoterequestrelatedsym
}
;;

(** The quote status request message is used by the institution to generate an execution report that contains the quote status message back from the counterparty.*)
type full_fix_quotestatusrequest_data = {
    f_QuoteStatusRequest_QuoteID : fix_string option;
    f_QuoteStatusRequest_Symbol : fix_string;
    f_QuoteStatusRequest_SymbolSfx : fix_string option;
    f_QuoteStatusRequest_SecurityID : fix_string option;
    f_QuoteStatusRequest_IDSource : fix_idsource option;
    (** Must be specified if a Future or Option. If a Future: Symbol, SecurityType, and MaturityMonthYear are required. If an Option: Symbol, SecurityType, MaturityMonthYear, PutOrCall, and StrikePrice are required.*)
    f_QuoteStatusRequest_SecurityType : fix_securitytype option;
    (** Specifiesthe month and year of maturity. Required if MaturityDay is specified.*)
    f_QuoteStatusRequest_MaturityMonthYear : fix_monthyear option;
    (** Can be used in conjunction with MaturityMonthYear to specify a particular maturity date.*)
    f_QuoteStatusRequest_MaturityDay : int option;
    (** For Options.*)
    f_QuoteStatusRequest_PutOrCall : fix_putorcall option;
    (** For Options.*)
    f_QuoteStatusRequest_StrikePrice : fix_float option;
    (** For Options.*)
    f_QuoteStatusRequest_OptAttribute : int option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_QuoteStatusRequest_ContractMultiplier : fix_float option;
    (** For Fixed Income.*)
    f_QuoteStatusRequest_CouponRate : fix_float option;
    (** Can be used to identify the security.*)
    f_QuoteStatusRequest_SecurityExchange : fix_exchange option;
    f_QuoteStatusRequest_Issuer : fix_string option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_QuoteStatusRequest_EncodedIssuerLen : int option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_QuoteStatusRequest_EncodedIssuer : fix_string option;
    f_QuoteStatusRequest_SecurityDesc : fix_string option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_QuoteStatusRequest_EncodedSecurityDescLen : int option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_QuoteStatusRequest_EncodedSecurityDesc : fix_string option;
    f_QuoteStatusRequest_Side : fix_side option;
    f_QuoteStatusRequest_TradingSessionID : fix_string option
}
;;

(** The Security Definition message is used for the following:
 1. Accept the security defined in a Security Definition message.
 2. Accept the security defined in a Security Definition message with changes to the definition and/or identity of the security.
 3. Reject the security requested in a Security Definition message
 4. Return a list of Security Types
 5. Return a list of Securities*)
type full_fix_securitydefinition_data = {
    f_SecurityDefinition_SecurityReqID : fix_string;
    (** Identifier for the Security Definition message*)
    f_SecurityDefinition_SecurityResponseID : fix_string;
    f_SecurityDefinition_SecurityResponseType : fix_securityresponsetype option;
    f_SecurityDefinition_TotalNumSecurities : int;
    (** Symbol of the requested Security*)
    f_SecurityDefinition_Symbol : fix_string option;
    (** Suffix of the Requested Security*)
    f_SecurityDefinition_SymbolSfx : fix_string option;
    (** Security ID of the requested Security*)
    f_SecurityDefinition_SecurityID : fix_string option;
    (** Source of the Security ID*)
    f_SecurityDefinition_IDSource : fix_idsource option;
    (** Must be specified if a Future or Option. If a Future: Symbol, SecurityType, and MaturityMonthYear are required. If an Option: Symbol, SecurityType, MaturityMonthYear, PutOrCall, and StrikePrice are required.
     Set to "?" if Security Definition Request is looking for the Security Types*)
    f_SecurityDefinition_SecurityType : fix_securitytype option;
    (** Specifiesthe month and year of maturity. Required if MaturityDay is specified.*)
    f_SecurityDefinition_MaturityMonthYear : fix_monthyear option;
    (** Can be used in conjunction with MaturityMonthYear to specify a particular maturity date.*)
    f_SecurityDefinition_MaturityDay : int option;
    (** For Options.*)
    f_SecurityDefinition_PutOrCall : fix_putorcall option;
    (** For Options.*)
    f_SecurityDefinition_StrikePrice : fix_float option;
    (** For Options.*)
    f_SecurityDefinition_OptAttribute : int option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_SecurityDefinition_ContractMultiplier : fix_float option;
    (** For Fixed Income.*)
    f_SecurityDefinition_CouponRate : fix_float option;
    f_SecurityDefinition_SecurityExchange : fix_exchange option;
    f_SecurityDefinition_Issuer : fix_string option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_SecurityDefinition_EncodedIssuerLen : int option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_SecurityDefinition_EncodedIssuer : fix_string option;
    f_SecurityDefinition_SecurityDesc : fix_string option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_SecurityDefinition_EncodedSecurityDescLen : int option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_SecurityDefinition_EncodedSecurityDesc : fix_string option;
    f_SecurityDefinition_Currency : fix_currency option;
    f_SecurityDefinition_TradingSessionID : fix_string option;
    (** Comment, instructions, or other identifying information.*)
    f_SecurityDefinition_Text : fix_string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_SecurityDefinition_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_SecurityDefinition_EncodedText : fix_string option;
    f_SecurityDefinition_SecurityDefinitionRelatedSym : fix_rg_securitydefinitionrelatedsym
}
;;

(** The Security Definition Request message is used for the following:
 1. Request a specific Security to be traded with the second party. The request security can be defined as a complex security made up of one or more underlying securities.
 2. Request a list of the Security Types that can be traded with the second party.
 3. Request a list of Securities that can be traded with the second party. This request can optionally be qualified with Symbol, TradingSessionID, SecurityExchange, and Security Type.*)
type full_fix_securitydefinitionrequest_data = {
    f_SecurityDefinitionRequest_SecurityReqID : fix_string;
    f_SecurityDefinitionRequest_SecurityRequestType : fix_securityrequesttype;
    (** Symbol of the requested Security*)
    f_SecurityDefinitionRequest_Symbol : fix_string option;
    (** Suffix of the Requested Security*)
    f_SecurityDefinitionRequest_SymbolSfx : fix_string option;
    (** Security ID of the requested Security*)
    f_SecurityDefinitionRequest_SecurityID : fix_string option;
    (** Source of the Security ID*)
    f_SecurityDefinitionRequest_IDSource : fix_idsource option;
    (** Must be specified if a Future or Option. If a Future: Symbol, SecurityType, and MaturityMonthYear are required. If an Option: Symbol, SecurityType, MaturityMonthYear, PutOrCall, and StrikePrice are required.*)
    f_SecurityDefinitionRequest_SecurityType : fix_securitytype option;
    (** Specifiesthe month and year of maturity. Required if MaturityDay is specified.*)
    f_SecurityDefinitionRequest_MaturityMonthYear : fix_monthyear option;
    (** Can be used in conjunction with MaturityMonthYear to specify a particular maturity date.*)
    f_SecurityDefinitionRequest_MaturityDay : int option;
    (** For Options.*)
    f_SecurityDefinitionRequest_PutOrCall : fix_putorcall option;
    (** For Options.*)
    f_SecurityDefinitionRequest_StrikePrice : fix_float option;
    (** For Options.*)
    f_SecurityDefinitionRequest_OptAttribute : int option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_SecurityDefinitionRequest_ContractMultiplier : fix_float option;
    (** For Fixed Income.*)
    f_SecurityDefinitionRequest_CouponRate : fix_float option;
    f_SecurityDefinitionRequest_SecurityExchange : fix_exchange option;
    f_SecurityDefinitionRequest_Issuer : fix_string option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_SecurityDefinitionRequest_EncodedIssuerLen : int option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_SecurityDefinitionRequest_EncodedIssuer : fix_string option;
    f_SecurityDefinitionRequest_SecurityDesc : fix_string option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_SecurityDefinitionRequest_EncodedSecurityDescLen : int option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_SecurityDefinitionRequest_EncodedSecurityDesc : fix_string option;
    f_SecurityDefinitionRequest_Currency : fix_currency option;
    (** Comment, instructions, or other identifying information.*)
    f_SecurityDefinitionRequest_Text : fix_string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_SecurityDefinitionRequest_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_SecurityDefinitionRequest_EncodedText : fix_string option;
    (** Optional Trading Session Identifier to specify a particular trading session for which you want to obtain a list of securities that are tradeable.*)
    f_SecurityDefinitionRequest_TradingSessionID : fix_string option;
    f_SecurityDefinitionRequest_SecurityDefinitionRequestRelatedSym : fix_rg_securitydefinitionrequestrelatedsym
}
;;

type full_fix_securitystatus_data = {
    f_SecurityStatus_SecurityStatusReqID : fix_string option;
    f_SecurityStatus_Symbol : fix_string;
    f_SecurityStatus_SymbolSfx : fix_string option;
    f_SecurityStatus_SecurityID : fix_string option;
    f_SecurityStatus_IDSource : fix_idsource option;
    (** Must be specified if a Future or Option. If a Future: Symbol, SecurityType, and MaturityMonthYear are required. If an Option: Symbol, SecurityType, MaturityMonthYear, PutOrCall, and StrikePrice are required.*)
    f_SecurityStatus_SecurityType : fix_securitytype option;
    (** Specifiesthe month and year of maturity. Required if MaturityDay is specified.*)
    f_SecurityStatus_MaturityMonthYear : fix_monthyear option;
    (** Can be used in conjunction with MaturityMonthYear to specify a particular maturity date.*)
    f_SecurityStatus_MaturityDay : int option;
    (** For Options.*)
    f_SecurityStatus_PutOrCall : fix_putorcall option;
    (** For Options.*)
    f_SecurityStatus_StrikePrice : fix_float option;
    (** For Options.*)
    f_SecurityStatus_OptAttribute : int option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_SecurityStatus_ContractMultiplier : fix_float option;
    (** For Fixed Income.*)
    f_SecurityStatus_CouponRate : fix_float option;
    (** Can be used to identify the security.*)
    f_SecurityStatus_SecurityExchange : fix_exchange option;
    f_SecurityStatus_Issuer : fix_string option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_SecurityStatus_EncodedIssuerLen : int option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_SecurityStatus_EncodedIssuer : fix_string option;
    f_SecurityStatus_SecurityDesc : fix_string option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_SecurityStatus_EncodedSecurityDescLen : int option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_SecurityStatus_EncodedSecurityDesc : fix_string option;
    f_SecurityStatus_Currency : fix_currency option;
    f_SecurityStatus_TradingSessionID : fix_string option;
    (** Set to ‘Y’ if message is sent as a result of a subscription request not a snapshot request*)
    f_SecurityStatus_UnsolicitedIndicator : fix_unsolicitedindicator option;
    (** Identifies the trading status applicable to the transaction.*)
    f_SecurityStatus_SecurityTradingStatus : fix_securitytradingstatus option;
    f_SecurityStatus_FinancialStatus : fix_financialstatus option;
    f_SecurityStatus_CorporateAction : fix_corporateaction option;
    (** Denotes the reason for the Opening Delay or Trading Halt.*)
    f_SecurityStatus_HaltReason : fix_haltreason option;
    f_SecurityStatus_InViewOfCommon : fix_inviewofcommon option;
    f_SecurityStatus_DueToRelated : fix_duetorelated option;
    f_SecurityStatus_BuyVolume : fix_float option;
    f_SecurityStatus_SellVolume : fix_float option;
    f_SecurityStatus_HighPx : fix_float option;
    f_SecurityStatus_LowPx : fix_float option;
    (** Represents the last price for that security either on a Consolidated or an individual participant basis at the time it is disseminated.*)
    f_SecurityStatus_LastPx : fix_float option;
    (** Trade Dissemination Time*)
    f_SecurityStatus_TransactTime : fix_utctimestamp option;
    f_SecurityStatus_Adjustment : fix_adjustment option
}
;;

(** The Security Status Request message provides for the ability to request the status of a security.*)
type full_fix_securitystatusrequest_data = {
    (** Must be unique, or the ID of previous Security Status Request to disable if SubscriptionRequestType = Disable previous Snapshot + Updates Request (2).*)
    f_SecurityStatusRequest_SecurityStatusReqID : fix_string;
    f_SecurityStatusRequest_Symbol : fix_string;
    f_SecurityStatusRequest_SymbolSfx : fix_string option;
    f_SecurityStatusRequest_SecurityID : fix_string option;
    f_SecurityStatusRequest_IDSource : fix_idsource option;
    (** Must be specified if a Future or Option. If a Future: Symbol, SecurityType, and MaturityMonthYear are required. If an Option: Symbol, SecurityType, MaturityMonthYear, PutOrCall, and StrikePrice are required.*)
    f_SecurityStatusRequest_SecurityType : fix_securitytype option;
    (** Specifiesthe month and year of maturity. Required if MaturityDay is specified.*)
    f_SecurityStatusRequest_MaturityMonthYear : fix_monthyear option;
    (** Can be used in conjunction with MaturityMonthYear to specify a particular maturity date.*)
    f_SecurityStatusRequest_MaturityDay : int option;
    (** For Options.*)
    f_SecurityStatusRequest_PutOrCall : fix_putorcall option;
    (** For Options.*)
    f_SecurityStatusRequest_StrikePrice : fix_float option;
    (** For Options.*)
    f_SecurityStatusRequest_OptAttribute : int option;
    (** For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_SecurityStatusRequest_ContractMultiplier : fix_float option;
    (** For Fixed Income.*)
    f_SecurityStatusRequest_CouponRate : fix_float option;
    (** Can be used to identify the security.*)
    f_SecurityStatusRequest_SecurityExchange : fix_exchange option;
    f_SecurityStatusRequest_Issuer : fix_string option;
    (** Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_SecurityStatusRequest_EncodedIssuerLen : int option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_SecurityStatusRequest_EncodedIssuer : fix_string option;
    f_SecurityStatusRequest_SecurityDesc : fix_string option;
    (** Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_SecurityStatusRequest_EncodedSecurityDescLen : int option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_SecurityStatusRequest_EncodedSecurityDesc : fix_string option;
    f_SecurityStatusRequest_Currency : fix_currency option;
    (** SubcriptionRequestType indicates to the other party what type of response is expected. A snapshot request only asks for current information. A subscribe request asks for updates as the status changes. Unsubscribe will cancel any future update messages from the counter party.)*)
    f_SecurityStatusRequest_SubscriptionRequestType : fix_subscriptionrequesttype;
    f_SecurityStatusRequest_TradingSessionID : fix_string option
}
;;

(** The Settlement Instructions message provides either the broker’s or the institution’s instructions for trade settlement.*)
type full_fix_settlementinstructions_data = {
    (** Unique message ID regardless of SettlInstMode*)
    f_SettlementInstructions_SettlInstID : fix_string;
    (** New, Replace, or Cancel*)
    f_SettlementInstructions_SettlInstTransType : fix_settlinsttranstype;
    (** Required for Cancel and Replace SettlInstTransType messages*)
    f_SettlementInstructions_SettlInstRefID : fix_string;
    (** 1=Standing Instructions, 2=Specific Allocation Account Overriding, 3=Specific Allocation Account Standing*)
    f_SettlementInstructions_SettlInstMode : fix_settlinstmode;
    (** 1=Broker’s Settlement Instructions, 2=Institution’s Settlement Instructions*)
    f_SettlementInstructions_SettlInstSource : fix_settlinstsource;
    (** Required for SettlInstMode=1, 2, or 3*)
    f_SettlementInstructions_AllocAccount : fix_string;
    (** Required for SettlInstMode=2 or 3, may be required for SettlInstMode=1 (i.e. may not be required if StandInstDbType and StandInstDbID are used)*)
    f_SettlementInstructions_SettlLocation : fix_settllocation option;
    (** Required for SettlInstMode=2 or 3*)
    f_SettlementInstructions_TradeDate : fix_localmktdate option;
    (** Required for SettlInstMode=2 or 3*)
    f_SettlementInstructions_AllocID : fix_string option;
    (** Required for SettlInstMode=2 or 3, May be required for SettlInstMode=1*)
    f_SettlementInstructions_LastMkt : fix_exchange option;
    f_SettlementInstructions_TradingSessionID : fix_string option;
    (** Required for SettlInstMode=2 or 3, May be required for SettlInstMode=1*)
    f_SettlementInstructions_Side : fix_side option;
    (** May be required for SettlInstMode=1*)
    f_SettlementInstructions_SecurityType : fix_securitytype option;
    (** May be required for SettlInstMode=1 (timestamp when it goes in to effect)*)
    f_SettlementInstructions_EffectiveTime : fix_utctimestamp option;
    (** Date/Time Settlement Instructions were generated*)
    f_SettlementInstructions_TransactTime : fix_utctimestamp;
    (** Used for firm identification in third-party transactions (should not be a substitute for OnBehalfOfCompID/DeliverToCompID).*)
    f_SettlementInstructions_ClientID : fix_string option;
    (** Used for firm identification in third-party transactions (should not be a substitute for OnBehalfOfCompID/DeliverToCompID).*)
    f_SettlementInstructions_ExecBroker : fix_string option;
    (** 1=DTC SID, 2=Thomson ALERT, 3=Global Custodian’s, etc.*)
    f_SettlementInstructions_StandInstDbType : fix_standinstdbtype option;
    (** Name of StandInstDbType (i.e. DTC, Global Custodian’s name)*)
    f_SettlementInstructions_StandInstDbName : fix_string option;
    (** Identifier used within the StandInstDbType*)
    f_SettlementInstructions_StandInstDbID : fix_string option;
    f_SettlementInstructions_SettlDeliveryType : int option;
    (** Applicable when SettlLocation is a depository*)
    f_SettlementInstructions_SettlDepositoryCode : fix_string option;
    f_SettlementInstructions_SettlBrkrCode : fix_string option;
    f_SettlementInstructions_SettlInstCode : fix_string option;
    (** Applicable when settlement is being performed at a country vs. a depository*)
    f_SettlementInstructions_SecuritySettlAgentName : fix_string option;
    (** Applicable when settlement is being performed at a country vs. a depository*)
    f_SettlementInstructions_SecuritySettlAgentCode : fix_string option;
    (** Applicable when settlement is being performed at a country vs. a depository*)
    f_SettlementInstructions_SecuritySettlAgentAcctNum : fix_string option;
    (** Applicable when settlement is being performed at a country vs. a depository*)
    f_SettlementInstructions_SecuritySettlAgentAcctName : fix_string option;
    (** Applicable when settlement is being performed at a country vs. a depository*)
    f_SettlementInstructions_SecuritySettlAgentContactName : fix_string option;
    (** Applicable when settlement is being performed at a country vs. a depository*)
    f_SettlementInstructions_SecuritySettlAgentContactPhone : fix_string option;
    (** Applicable when SettlDeliveryType=Free*)
    f_SettlementInstructions_CashSettlAgentName : fix_string option;
    (** Applicable when SettlDeliveryType=Free*)
    f_SettlementInstructions_CashSettlAgentCode : fix_string option;
    (** Applicable when SettlDeliveryType=Free*)
    f_SettlementInstructions_CashSettlAgentAcctNum : fix_string option;
    (** Applicable when SettlDeliveryType=Free*)
    f_SettlementInstructions_CashSettlAgentAcctName : fix_string option;
    (** Applicable when SettlDeliveryType=Free*)
    f_SettlementInstructions_CashSettlAgentContactName : fix_string option;
    (** Applicable when SettlDeliveryType=Free*)
    f_SettlementInstructions_CashSettlAgentContactPhone : fix_string option
}
;;

(** The Trading Session Status provides information on the status of a market.*)
type full_fix_tradingsessionstatus_data = {
    (** Provided for a response to a specific Trading Session Status Request message (snapshot).*)
    f_TradingSessionStatus_TradSesReqID : fix_string option;
    (** Identifier for Trading Session*)
    f_TradingSessionStatus_TradingSessionID : fix_string;
    (** Method of trading:*)
    f_TradingSessionStatus_TradSesMethod : fix_tradsesmethod option;
    (** Trading Session Mode*)
    f_TradingSessionStatus_TradSesMode : fix_tradsesmode option;
    (** ‘Y’ if message is sent unsolicited as a result of a previous subscription request.*)
    f_TradingSessionStatus_UnsolicitedIndicator : fix_unsolicitedindicator option;
    (** State of the trading session*)
    f_TradingSessionStatus_TradSesStatus : fix_tradsesstatus;
    (** Starting time of the trading session*)
    f_TradingSessionStatus_TradSesStartTime : fix_utctimestamp option;
    (** Time of the opening of the trading session*)
    f_TradingSessionStatus_TradSesOpenTime : fix_utctimestamp option;
    (** Time of the pre-close of the trading session*)
    f_TradingSessionStatus_TradSesPreCloseTime : fix_utctimestamp option;
    (** Closing time of the trading session*)
    f_TradingSessionStatus_TradSesCloseTime : fix_utctimestamp option;
    (** End time of the trading session*)
    f_TradingSessionStatus_TradSesEndTime : fix_utctimestamp option;
    f_TradingSessionStatus_TotalVolumeTraded : fix_float option;
    f_TradingSessionStatus_Text : fix_string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_TradingSessionStatus_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_TradingSessionStatus_EncodedText : fix_string option
}
;;

(** The Trading Session Status Request is used to request information on the status of a market.*)
type full_fix_tradingsessionstatusrequest_data = {
    (** Must be unique, or the ID of previous Market Data Request to disable if SubscriptionRequestType = Disable previous Snapshot + Updates Request (2).*)
    f_TradingSessionStatusRequest_TradSesReqID : fix_string;
    (** Trading Session for which status is being requested*)
    f_TradingSessionStatusRequest_TradingSessionID : fix_string option;
    (** Method of trading*)
    f_TradingSessionStatusRequest_TradSesMethod : fix_tradsesmethod option;
    (** Trading Session Mode*)
    f_TradingSessionStatusRequest_TradSesMode : fix_tradsesmode option;
    f_TradingSessionStatusRequest_SubscriptionRequestType : fix_subscriptionrequesttype
}
;;

type full_app_msg_data =
    | FIX_Full_Msg_Advertisement of full_fix_advertisement_data
    | FIX_Full_Msg_Allocation of full_fix_allocation_data
    | FIX_Full_Msg_AllocationInstructionAck of full_fix_allocationinstructionack_data
    | FIX_Full_Msg_BidRequest of full_fix_bidrequest_data
    | FIX_Full_Msg_BidResponse of full_fix_bidresponse_data
    | FIX_Full_Msg_DontKnowTrade of full_fix_dontknowtrade_data
    | FIX_Full_Msg_Email of full_fix_email_data
    | FIX_Full_Msg_ExecutionReport of full_fix_executionreport_data
    | FIX_Full_Msg_IOI of full_fix_ioi_data
    | FIX_Full_Msg_ListCancelRequest of full_fix_listcancelrequest_data
    | FIX_Full_Msg_ListExecute of full_fix_listexecute_data
    | FIX_Full_Msg_ListStatus of full_fix_liststatus_data
    | FIX_Full_Msg_ListStatusRequest of full_fix_liststatusrequest_data
    | FIX_Full_Msg_ListStrikePrice of full_fix_liststrikeprice_data
    | FIX_Full_Msg_MarketDataIncrementalRefresh of full_fix_marketdataincrementalrefresh_data
    | FIX_Full_Msg_MarketDataRequest of full_fix_marketdatarequest_data
    | FIX_Full_Msg_MarketDataRequestReject of full_fix_marketdatarequestreject_data
    | FIX_Full_Msg_MarketDataSnapshotFullRefresh of full_fix_marketdatasnapshotfullrefresh_data
    | FIX_Full_Msg_MassQuote of full_fix_massquote_data
    | FIX_Full_Msg_News of full_fix_news_data
    | FIX_Full_Msg_OrderCancelReject of full_fix_ordercancelreject_data
    | FIX_Full_Msg_OrderCancelReplaceRequest of full_fix_ordercancelreplacerequest_data
    | FIX_Full_Msg_OrderCancelRequest of full_fix_ordercancelrequest_data
    | FIX_Full_Msg_OrderList of full_fix_orderlist_data
    | FIX_Full_Msg_OrderSingle of full_fix_ordersingle_data
    | FIX_Full_Msg_OrderStatusRequest of full_fix_orderstatusrequest_data
    | FIX_Full_Msg_Quote of full_fix_quote_data
    | FIX_Full_Msg_QuoteAcknowledgement of full_fix_quoteacknowledgement_data
    | FIX_Full_Msg_QuoteCancel of full_fix_quotecancel_data
    | FIX_Full_Msg_QuoteRequest of full_fix_quoterequest_data
    | FIX_Full_Msg_QuoteStatusRequest of full_fix_quotestatusrequest_data
    | FIX_Full_Msg_SecurityDefinition of full_fix_securitydefinition_data
    | FIX_Full_Msg_SecurityDefinitionRequest of full_fix_securitydefinitionrequest_data
    | FIX_Full_Msg_SecurityStatus of full_fix_securitystatus_data
    | FIX_Full_Msg_SecurityStatusRequest of full_fix_securitystatusrequest_data
    | FIX_Full_Msg_SettlementInstructions of full_fix_settlementinstructions_data
    | FIX_Full_Msg_TradingSessionStatus of full_fix_tradingsessionstatus_data
    | FIX_Full_Msg_TradingSessionStatusRequest of full_fix_tradingsessionstatusrequest_data
;;

let get_full_app_msg_tag ( msg : full_app_msg_data ) =
    (match msg with
        | FIX_Full_Msg_Advertisement _ -> Full_Msg_Advertisement_Tag
        | FIX_Full_Msg_Allocation _ -> Full_Msg_Allocation_Tag
        | FIX_Full_Msg_AllocationInstructionAck _ -> Full_Msg_AllocationInstructionAck_Tag
        | FIX_Full_Msg_BidRequest _ -> Full_Msg_BidRequest_Tag
        | FIX_Full_Msg_BidResponse _ -> Full_Msg_BidResponse_Tag
        | FIX_Full_Msg_DontKnowTrade _ -> Full_Msg_DontKnowTrade_Tag
        | FIX_Full_Msg_Email _ -> Full_Msg_Email_Tag
        | FIX_Full_Msg_ExecutionReport _ -> Full_Msg_ExecutionReport_Tag
        | FIX_Full_Msg_IOI _ -> Full_Msg_IOI_Tag
        | FIX_Full_Msg_ListCancelRequest _ -> Full_Msg_ListCancelRequest_Tag
        | FIX_Full_Msg_ListExecute _ -> Full_Msg_ListExecute_Tag
        | FIX_Full_Msg_ListStatus _ -> Full_Msg_ListStatus_Tag
        | FIX_Full_Msg_ListStatusRequest _ -> Full_Msg_ListStatusRequest_Tag
        | FIX_Full_Msg_ListStrikePrice _ -> Full_Msg_ListStrikePrice_Tag
        | FIX_Full_Msg_MarketDataIncrementalRefresh _ -> Full_Msg_MarketDataIncrementalRefresh_Tag
        | FIX_Full_Msg_MarketDataRequest _ -> Full_Msg_MarketDataRequest_Tag
        | FIX_Full_Msg_MarketDataRequestReject _ -> Full_Msg_MarketDataRequestReject_Tag
        | FIX_Full_Msg_MarketDataSnapshotFullRefresh _ -> Full_Msg_MarketDataSnapshotFullRefresh_Tag
        | FIX_Full_Msg_MassQuote _ -> Full_Msg_MassQuote_Tag
        | FIX_Full_Msg_News _ -> Full_Msg_News_Tag
        | FIX_Full_Msg_OrderCancelReject _ -> Full_Msg_OrderCancelReject_Tag
        | FIX_Full_Msg_OrderCancelReplaceRequest _ -> Full_Msg_OrderCancelReplaceRequest_Tag
        | FIX_Full_Msg_OrderCancelRequest _ -> Full_Msg_OrderCancelRequest_Tag
        | FIX_Full_Msg_OrderList _ -> Full_Msg_OrderList_Tag
        | FIX_Full_Msg_OrderSingle _ -> Full_Msg_OrderSingle_Tag
        | FIX_Full_Msg_OrderStatusRequest _ -> Full_Msg_OrderStatusRequest_Tag
        | FIX_Full_Msg_Quote _ -> Full_Msg_Quote_Tag
        | FIX_Full_Msg_QuoteAcknowledgement _ -> Full_Msg_QuoteAcknowledgement_Tag
        | FIX_Full_Msg_QuoteCancel _ -> Full_Msg_QuoteCancel_Tag
        | FIX_Full_Msg_QuoteRequest _ -> Full_Msg_QuoteRequest_Tag
        | FIX_Full_Msg_QuoteStatusRequest _ -> Full_Msg_QuoteStatusRequest_Tag
        | FIX_Full_Msg_SecurityDefinition _ -> Full_Msg_SecurityDefinition_Tag
        | FIX_Full_Msg_SecurityDefinitionRequest _ -> Full_Msg_SecurityDefinitionRequest_Tag
        | FIX_Full_Msg_SecurityStatus _ -> Full_Msg_SecurityStatus_Tag
        | FIX_Full_Msg_SecurityStatusRequest _ -> Full_Msg_SecurityStatusRequest_Tag
        | FIX_Full_Msg_SettlementInstructions _ -> Full_Msg_SettlementInstructions_Tag
        | FIX_Full_Msg_TradingSessionStatus _ -> Full_Msg_TradingSessionStatus_Tag
        | FIX_Full_Msg_TradingSessionStatusRequest _ -> Full_Msg_TradingSessionStatusRequest_Tag
    )
;;
