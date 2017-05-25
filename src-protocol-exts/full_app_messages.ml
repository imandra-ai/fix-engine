 (* @meta[imandra_ignore] on @end *)
open Base_types;;
open Numeric;;
open Datetime;;
open Full_app_enums;;
open Full_app_tags;;
open Full_app_records;;
 (* @meta[imandra_ignore] off @end *)

(** Advertisement messages are used to announce completed transactions.*)
type full_fix_advertisement_data = {
    (** Unique identifier of advertisement message.
     (Prior to FIX 4.1 this field was of type int)*)
    f_Advertisement_AdvId : fix_string;
    (** Identifies advertisement message transaction type*)
    f_Advertisement_AdvTransType : fix_advtranstype;
    (** Reference identifier used with CANCEL and REPLACE transaction types.
     (Prior to FIX 4.1 this field was of type int)
     Required for Cancel and Replace AdvTransType messages*)
    f_Advertisement_AdvRefID : fix_string option;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_Advertisement_Instrument : fix_instrument;
    (** Number of legs
     Identifies a Multi-leg Execution if present and non-zero.*)
    f_Advertisement_InstrmtLegGrp : fix_instrmtleggrp;
    (** Number of underlyings*)
    f_Advertisement_UndInstrmtGrp : fix_undinstrmtgrp;
    (** Broker's side of advertised trade*)
    f_Advertisement_AdvSide : fix_advside;
    (** Overall/total quantity (e.g. number of shares)
     (Prior to FIX 4.2 this field was of type int)*)
    f_Advertisement_Quantity : fix_float;
    (** Type of quantity specified in a quantity field*)
    f_Advertisement_QtyType : fix_qtytype option;
    (** Price per unit of quantity (e.g. per share)*)
    f_Advertisement_Price : fix_float option;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.*)
    f_Advertisement_Currency : fix_currency option;
    (** Indicates date of trade referenced in this message in YYYYMMDD format. Absence of this field indicates current day (expressed in local time at place of trade).*)
    f_Advertisement_TradeDate : fix_localmktdate option;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")*)
    f_Advertisement_TransactTime : fix_utctimestamp option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_Advertisement_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_Advertisement_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_Advertisement_EncodedText : fix_string option;
    (** A URI (Uniform Resource Identifier) or URL (Uniform Resource Locator) link to additional information (i.e. http://www.XYZ.com/research.html)
     See "Appendix 6-B FIX Fields Based Upon Other Standards"
     A URL (Uniform Resource Locator) link to additional information (i.e. http://www.XYZ.com/research.html)*)
    f_Advertisement_URLLink : fix_string option;
    (** Market of execution for last fill, or an indication of the market where an order was routed
     Valid values:
     See "Appendix 6-C"*)
    f_Advertisement_LastMkt : fix_exchange option;
    (** Identifier for Trading Session
     Can be used to represent a specific market trading session (e.g. "PRE-OPEN", "CROSS_2", "AFTER-HOURS", "TOSTNET", "TOSTNET2", etc).
     To specify good for session where session spans more than one calendar day, use TimeInForce = Day in conjunction with TradingSessionID.
     Values should be bi-laterally agreed to between counterparties.
     Firms may register Trading Session values on the FIX website (presently a document maintained within "ECN and Exchanges" working group section).*)
    f_Advertisement_TradingSessionID : fix_string option;
    (** Optional market assigned sub identifier for a trading session. Usage is determined by market or counterparties.
     Used by US based futures markets to identify exchange specific execution time bracket codes as required by US market regulations.*)
    f_Advertisement_TradingSessionSubID : fix_string option
}
;;

(** The Allocation Instruction message provides the ability to specify how an order or set of orders should be subdivided amongst one or more accounts. In versions of FIX prior to version 4.4, this same message was known as the Allocation message. Note in versions of FIX prior to version 4.4, the allocation message was also used to communicate fee and expense details from the Sellside to the Buyside. This role has now been removed from the Allocation Instruction and is now performed by the new (to version 4.4) Allocation Report and Confirmation messages.,The Allocation Report message should be used for the Sell-side Initiated Allocation role as defined in previous versions of the protocol.*)
type full_fix_allocationinstruction_data = {
    (** Unique identifier for allocation message.
     (Prior to FIX 4.1 this field was of type int)
     Unique identifier for this allocation instruction message*)
    f_AllocationInstruction_AllocID : fix_string;
    (** Identifies allocation transaction type
     *** SOME VALUES HAVE BEEN REPLACED - See "Replaced Features and Supported Approach" ***
     i.e. New, Cancel, Replace*)
    f_AllocationInstruction_AllocTransType : fix_alloctranstype;
    (** Describes the specific type or purpose of an Allocation message (i.e. "Buyside Calculated")
     Specifies the purpose or type of Allocation message*)
    f_AllocationInstruction_AllocType : fix_alloctype;
    (** Secondary allocation identifier. Unlike the AllocID (70), this can be shared across a number of allocation instruction or allocation report messages, thereby making it possible to pass an identifier for an original allocation message on multiple messages (e.g. from one party to a second to a third, across cancel and replace messages etc.).
     Optional second identifier for this allocation instruction (need not be unique)*)
    f_AllocationInstruction_SecondaryAllocID : fix_string option;
    (** Reference identifier to be used with AllocTransType (7) =Replace or Cancel.
     (Prior to FIX 4.1 this field was of type int)
     Required for AllocTransType = Replace or Cancel*)
    f_AllocationInstruction_RefAllocID : fix_string option;
    (** Reason for cancelling or replacing an Allocation Instruction or Allocation Report message
     Required for AllocTransType = Replace or Cancel
     Gives the reason for replacing or cancelling the allocation instruction*)
    f_AllocationInstruction_AllocCancReplaceReason : fix_alloccancreplacereason option;
    (** Response to allocation to be communicated to a counterparty through an intermediary, i.e. clearing house. Used in conjunction with AllocType = "Request to Intermediary" and AllocReportType = "Request to Intermediary"
     Required if AllocType = 8 (Request to Intermediary)
     Indicates status that is requested to be transmitted to counterparty by the intermediary (i.e. clearing house)*)
    f_AllocationInstruction_AllocIntermedReqType : fix_allocintermedreqtype option;
    (** Can be used to link two different Allocation messages (each with unique AllocID (70)) together, i.e. for F/X "Netting" or "Swaps". Should be unique.
     Can be used to link two different Allocation messages (each with unique AllocID) together, i.e. for F/X "Netting" or "Swaps"*)
    f_AllocationInstruction_AllocLinkID : fix_string option;
    (** Identifies the type of Allocation linkage when AllocLinkID (96) is used.
     Can be used to link two different Allocation messages and identifies the type of link. Required if AllocLinkID is specified.*)
    f_AllocationInstruction_AllocLinkType : fix_alloclinktype option;
    (** Common reference passed to a post-trade booking process (e.g. industry matching utility).
     Can be used with AllocType=" Ready-To-Book "*)
    f_AllocationInstruction_BookingRefID : fix_string option;
    (** Indicates how the orders being booked and allocated by an Allocation Instruction or Allocation Report message are identified, i.e. by explicit definition in the NoOrders group or not.
     Indicates how the orders being booked and allocated by this message are identified, i.e. by explicit definition in the NoOrders group or not.*)
    f_AllocationInstruction_AllocNoOrdersType : fix_allocnoorderstype;
    (** Indicates number of orders to be combined for allocation. If order(s) were manually delivered set to 1 (one).Required when AllocNoOrdersType = 1*)
    f_AllocationInstruction_OrdAllocGrp : fix_ordallocgrp;
    (** Indicates number of individual execution repeating group entries to follow. Absence of this field indicates that no individual execution entries are included. Primarily used to support step-outs.*)
    f_AllocationInstruction_ExecAllocGrp : fix_execallocgrp;
    (** Indicates if the trade capture report was previously reported to the counterparty*)
    f_AllocationInstruction_PreviouslyReported : fix_previouslyreported option;
    (** Indicates a trade that reverses a previous trade.*)
    f_AllocationInstruction_ReversalIndicator : bool option;
    (** The point in the matching process at which this trade was matched*)
    f_AllocationInstruction_MatchType : fix_matchtype option;
    (** Side of order*)
    f_AllocationInstruction_Side : fix_side;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_AllocationInstruction_Instrument : fix_instrument;
    (** Insert here the set of "InstrumentExtension" fields defined in "Common Components of Application Messages"*)
    f_AllocationInstruction_InstrumentExtension : fix_instrumentextension;
    (** Insert here the set of "FinancingDetails" fields defined in "Common Components of Application Messages"*)
    f_AllocationInstruction_FinancingDetails : fix_financingdetails;
    f_AllocationInstruction_UndInstrmtGrp : fix_undinstrmtgrp;
    f_AllocationInstruction_InstrmtLegGrp : fix_instrmtleggrp;
    (** Overall/total quantity (e.g. number of shares)
     (Prior to FIX 4.2 this field was of type int)
     Total quantity (e.g. number of shares) allocated to all accounts, or that is Ready-To-Book*)
    f_AllocationInstruction_Quantity : fix_float;
    (** Type of quantity specified in a quantity field*)
    f_AllocationInstruction_QtyType : fix_qtytype option;
    (** Market of execution for last fill, or an indication of the market where an order was routed
     Valid values:
     See "Appendix 6-C"
     Market of the executions.*)
    f_AllocationInstruction_LastMkt : fix_exchange option;
    (** Used with Fixed Income for Muncipal New Issue Market. Agreement in principal between counter-parties prior to actual trade date.
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)
     (prior to FIX 4.4 field was of type UTCDate)*)
    f_AllocationInstruction_TradeOriginationDate : fix_localmktdate option;
    (** Identifier for Trading Session
     Can be used to represent a specific market trading session (e.g. "PRE-OPEN", "CROSS_2", "AFTER-HOURS", "TOSTNET", "TOSTNET2", etc).
     To specify good for session where session spans more than one calendar day, use TimeInForce = Day in conjunction with TradingSessionID.
     Values should be bi-laterally agreed to between counterparties.
     Firms may register Trading Session values on the FIX website (presently a document maintained within "ECN and Exchanges" working group section).*)
    f_AllocationInstruction_TradingSessionID : fix_string option;
    (** Optional market assigned sub identifier for a trading session. Usage is determined by market or counterparties.
     Used by US based futures markets to identify exchange specific execution time bracket codes as required by US market regulations.*)
    f_AllocationInstruction_TradingSessionSubID : fix_string option;
    (** Code to represent the price type*)
    f_AllocationInstruction_PriceType : fix_pricetype option;
    (** Calculated average price of all fills on this order.
     For Fixed Income trades AvgPx is always expressed as percent-of-par, regardless of the PriceType (423) of LastPx (3). I.e., AvgPx will contain an average of percent-of-par values (see LastParPx (669)) for issues traded in Yield, Spread or Discount.
     For F/X orders, should be the "all-in" rate (spot rate adjusted for forward points).*)
    f_AllocationInstruction_AvgPx : fix_float;
    (** Used to express average price as percent of par (used where AvgPx field is expressed in some other way)*)
    f_AllocationInstruction_AvgParPx : fix_float option;
    (** Insert here the set of "SpreadOrBenchmarkCurveData" fields defined in "Common Components of Application Messages"*)
    f_AllocationInstruction_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.
     Currency of AvgPx. Should be the currency of the local market or exchange where the trade was conducted.*)
    f_AllocationInstruction_Currency : fix_currency option;
    (** Indicates number of decimal places to be used for average pricing. Absence of this field indicates that default precision arranged by the broker/institution is to be used.
     Absence of this field indicates that default precision arranged by the broker/institution is to be used*)
    f_AllocationInstruction_AvgPxPrecision : int option;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_AllocationInstruction_Parties : fix_parties;
    (** Indicates date of trade referenced in this message in YYYYMMDD format. Absence of this field indicates current day (expressed in local time at place of trade).*)
    f_AllocationInstruction_TradeDate : fix_localmktdate;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")
     Date/time when allocation is generated*)
    f_AllocationInstruction_TransactTime : fix_utctimestamp option;
    (** Indicates order settlement period. If present, SettlDate (64) overrides this field. If both SettlType (63) and SettDate (64) are omitted, the default for SettlType (63) is 0 (Regular)
     Regular is defined as the default settlement period for the particular security on the exchange of execution.
     In Fixed Income the contents of this field may influence the instrument definition if the SecurityID (48) is ambiguous. In the US an active Treasury offering may be re-opened, and for a time one CUSIP will apply to both the current and "when-issued" securities. Supplying a value of "7" clarifies the instrument description; any other value or the absence of this field should cause the respondent to default to the active issue.*)
    f_AllocationInstruction_SettlType : fix_settltype option;
    (** Specific date of trade settlement (SettlementDate) in YYYYMMDD format.
     If present, this field overrides SettlType (63). This field is required if the value of SettlType (63) is 6 (Future) or 8 (Sellers Option). This field must be omitted if the value of SettlType (63) is 7 (When and If Issued)
     (expressed in local time at place of settlement)
     Takes precedence over SettlType value and conditionally required/omitted for specific SettlType values.*)
    f_AllocationInstruction_SettlDate : fix_localmktdate option;
    (** Method for booking out this order. Used when notifying a broker that an order to be settled by that broker is to be booked out as an OTC derivative (e.g. CFD or similar).
     Method for booking. Used to provide notification that this is to be booked out as an OTC derivative (e.g. CFD or similar). Absence of this field implies regular booking.*)
    f_AllocationInstruction_BookingType : fix_bookingtype option;
    (** Total amount traded (e.g. CumQty (4) * AvgPx (6)) expressed in units of currency.
     Expressed in same currency as AvgPx. Sum of (AllocQty * AllocAvgPx or AllocPrice).*)
    f_AllocationInstruction_GrossTradeAmt : fix_float option;
    (** Provides the reduction in price for the secondary market in Muncipals.
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)*)
    f_AllocationInstruction_Concession : fix_float option;
    (** The price at which the securities are distributed to the different members of an underwriting group for the primary market in Municipals, total gross underwriter's spread.
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)*)
    f_AllocationInstruction_TotalTakedown : fix_float option;
    (** Total amount due as the result of the transaction (e.g. for Buy order - principal + commission + fees) reported in currency of execution.
     Expressed in same currency as AvgPx. Sum of AllocNetMoney.*)
    f_AllocationInstruction_NetMoney : fix_float option;
    (** Indicates whether the resulting position after a trade should be an opening position or closing position. Used for omnibus accounting - where accounts are held on a gross basis instead of being netted together.*)
    f_AllocationInstruction_PositionEffect : fix_positioneffect option;
    (** Identifies whether or not an allocation has been automatically accepted on behalf of the Carry Firm by the Clearing House.
     Indicates if Allocation has been automatically accepted on behalf of the Carry Firm by the Clearing House*)
    f_AllocationInstruction_AutoAcceptIndicator : bool option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_AllocationInstruction_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_AllocationInstruction_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_AllocationInstruction_EncodedText : fix_string option;
    (** Number of Days of Interest for convertible bonds and fixed income. Note value may be negative.
     Applicable for Convertible Bonds and fixed income*)
    f_AllocationInstruction_NumDaysInterest : int option;
    (** The amount the buyer compensates the seller for the portion of the next coupon interest payment the seller has earned but will not receive from the issuer because the issuer will send the next coupon payment to the buyer. Accrued Interest Rate is the annualized Accrued Interest amount divided by the purchase price of the bond.
     Applicable for Convertible Bonds and fixed income*)
    f_AllocationInstruction_AccruedInterestRate : fix_float option;
    (** Amount of Accrued Interest for convertible bonds and fixed income
     Applicable for Convertible Bonds and fixed income (REMOVED FROM THIS LOCATION AS OF FIX 4.4, REPLACED BY AllocAccruedInterest)*)
    f_AllocationInstruction_AccruedInterestAmt : fix_float option;
    (** *** DEPRECATED FIELD - See "Deprecated (Phased-out) Features and Supported Approach" ***
     Total Amount of Accrued Interest for convertible bonds and fixed income
     (Deprecated) use AccruedInterestAmt Sum of AccruedInterestAmt within repeating group.*)
    f_AllocationInstruction_TotalAccruedInterestAmt : fix_float option;
    (** Amount of interest (i.e. lump-sum) at maturity.*)
    f_AllocationInstruction_InterestAtMaturity : fix_float option;
    (** Accrued Interest Amount applicable to a financing transaction on the End Date.
     For repurchase agreements the accrued interest on termination.*)
    f_AllocationInstruction_EndAccruedInterestAmt : fix_float option;
    (** Starting dirty cash consideration of a financing deal, i.e. paid to the seller on the Start Date.
     For repurchase agreements the start (dirty) cash consideration*)
    f_AllocationInstruction_StartCash : fix_float option;
    (** Ending dirty cash consideration of a financing deal. i.e. reimbursed to the buyer on the End Date.
     For repurchase agreements the end (dirty) cash consideration*)
    f_AllocationInstruction_EndCash : fix_float option;
    (** Indicates that this message is to serve as the final and legal confirmation.*)
    f_AllocationInstruction_LegalConfirm : fix_legalconfirm option;
    f_AllocationInstruction_Stipulations : fix_stipulations;
    f_AllocationInstruction_YieldData : fix_yielddata;
    (** Total number of NoAlloc entries across all messages. Should be the sum of all NoAllocs in each message that has repeating NoAlloc entries related to the same AllocID or AllocReportID. Used to support fragmentation.
     Indicates total number of allocation groups (used to support fragmentation). Must equal the sum of all NoAllocs values across all message fragments making up this allocation instruction.
     Only required where message has been fragmented.*)
    f_AllocationInstruction_TotNoAllocs : int option;
    (** Indicates whether this message is the last in a sequence of messages for those messages that support fragmentation, such as Allocation Instruction, Mass Quote, Security List, Derivative Security List
     Indicates whether this is the last fragment in a sequence of message fragments.
     Only required where message has been fragmented.*)
    f_AllocationInstruction_LastFragment : fix_lastfragment option;
    (** Indicates number of allocation groups to follow.
     Not required for AllocTransType=Cancel
     Not required for AllocType=" Ready-To-Book " or "Warehouse instruction".*)
    f_AllocationInstruction_AllocGrp : fix_allocgrp
}
;;

(** In versions of FIX prior to version 4.4, this message was known as the Allocation ACK message.
 The Allocation Instruction Ack message is used to acknowledge the receipt of and provide status for an Allocation Instruction message.*)
type full_fix_allocationinstructionack_data = {
    (** Unique identifier for allocation message.
     (Prior to FIX 4.1 this field was of type int)*)
    f_AllocationInstructionAck_AllocID : fix_string;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_AllocationInstructionAck_Parties : fix_parties;
    (** Secondary allocation identifier. Unlike the AllocID (70), this can be shared across a number of allocation instruction or allocation report messages, thereby making it possible to pass an identifier for an original allocation message on multiple messages (e.g. from one party to a second to a third, across cancel and replace messages etc.).
     Optional second identifier for the allocation instruction being acknowledged (need not be unique)*)
    f_AllocationInstructionAck_SecondaryAllocID : fix_string option;
    (** Indicates date of trade referenced in this message in YYYYMMDD format. Absence of this field indicates current day (expressed in local time at place of trade).*)
    f_AllocationInstructionAck_TradeDate : fix_localmktdate option;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")
     Date/Time Allocation Instruction Ack generated*)
    f_AllocationInstructionAck_TransactTime : fix_utctimestamp;
    (** Identifies status of allocation
     Denotes the status of the allocation instruction; received (but not yet processed), rejected (at block or account level) or accepted (and processed).*)
    f_AllocationInstructionAck_AllocStatus : fix_allocstatus;
    (** Identifies reason for rejection
     Required for AllocStatus = 1 ( block level reject) and for AllocStatus 2 (account level reject) if the individual accounts and reject reasons are not provided in this message*)
    f_AllocationInstructionAck_AllocRejCode : fix_allocrejcode option;
    (** Describes the specific type or purpose of an Allocation message (i.e. "Buyside Calculated")*)
    f_AllocationInstructionAck_AllocType : fix_alloctype option;
    (** Response to allocation to be communicated to a counterparty through an intermediary, i.e. clearing house. Used in conjunction with AllocType = "Request to Intermediary" and AllocReportType = "Request to Intermediary"
     Required if AllocType = 8 (Request to Intermediary)
     Indicates status that is requested to be transmitted to counterparty by the intermediary (i.e. clearing house)*)
    f_AllocationInstructionAck_AllocIntermedReqType : fix_allocintermedreqtype option;
    (** The status of this trade with respect to matching or comparison
     Denotes whether the financial details provided on the Allocation Instruction were successfully matched.*)
    f_AllocationInstructionAck_MatchStatus : fix_matchstatus option;
    (** Indicates the type of product the security is associated with. See also the CFICode (46) and SecurityType (67) fields.*)
    f_AllocationInstructionAck_Product : fix_product option;
    (** Indicates type of security. See also the Product (460) and CFICode (46) fields. It is recommended that CFICode be used instead of SecurityType for non-Fixed Income instruments.
     Example values (grouped by Product field value) (Note: additional values may be used by mutual agreement of the counterparties):
     * Identify the Issuer in the "Issuer" field(06)
     *** REPLACED values - See "Replaced Features and Supported Approach" ***
     NOTE: Additional values may be used by mutual agreement of the counterparties)*)
    f_AllocationInstructionAck_SecurityType : fix_securitytype option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)
     Can include explanation for AllocRejCode = 7 (other)*)
    f_AllocationInstructionAck_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_AllocationInstructionAck_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_AllocationInstructionAck_EncodedText : fix_string option;
    (** This repeating group is optionally used for messages with AllocStatus = 2 (account level reject) to provide details of the individual accounts that caused the rejection, together with reject reasons. This group should not be populated when AllocStatus has any other value.
     Indicates number of allocation groups to follow.*)
    f_AllocationInstructionAck_AllocAckGrp : fix_allocackgrp
}
;;

(** Sent from sell-side to buy-side, sell-side to 3rd-party or 3rd-party to buy-side, the Allocation Report (Claim) provides account breakdown of an order or set of orders plus any additional follow-up front-office information developed post-trade during the trade allocation, matching and calculation phase. In versions of FIX prior to version 4.4, this functionality was provided through the Allocation message. Depending on the needs of the market and the timing of "confirmed" status, the role of Allocation Report can be taken over in whole or in part by the Confirmation message.
 Note the response to the Allocation Report message is the Allocation Report Ack message. In versions of FIX prior to version 4.4, the Allocation ACK served this purpose.*)
type full_fix_allocationreport_data = {
    (** Unique identifier for Allocation Report message.
     Unique identifier for this message*)
    f_AllocationReport_AllocReportID : fix_string;
    (** Unique identifier for allocation message.
     (Prior to FIX 4.1 this field was of type int)*)
    f_AllocationReport_AllocID : fix_string option;
    (** Identifies allocation transaction type
     *** SOME VALUES HAVE BEEN REPLACED - See "Replaced Features and Supported Approach" ***
     i.e. New, Cancel, Replace*)
    f_AllocationReport_AllocTransType : fix_alloctranstype;
    (** Reference identifier to be used with AllocTransType (7) = Replace or Cancel
     Required for AllocTransType = Replace or Cancel*)
    f_AllocationReport_AllocReportRefID : fix_string option;
    (** Reason for cancelling or replacing an Allocation Instruction or Allocation Report message
     Required for AllocTransType = Replace or Cancel
     Gives the reason for replacing or cancelling the allocation report*)
    f_AllocationReport_AllocCancReplaceReason : fix_alloccancreplacereason option;
    (** Secondary allocation identifier. Unlike the AllocID (70), this can be shared across a number of allocation instruction or allocation report messages, thereby making it possible to pass an identifier for an original allocation message on multiple messages (e.g. from one party to a second to a third, across cancel and replace messages etc.).
     Optional second identifier for this allocation instruction (need not be unique)*)
    f_AllocationReport_SecondaryAllocID : fix_string option;
    (** Describes the specific type or purpose of an Allocation Report message
     Specifies the purpose or type of Allocation Report message*)
    f_AllocationReport_AllocReportType : fix_allocreporttype;
    (** Identifies status of allocation*)
    f_AllocationReport_AllocStatus : fix_allocstatus;
    (** Identifies reason for rejection
     Required for AllocStatus = 1 (rejected)*)
    f_AllocationReport_AllocRejCode : fix_allocrejcode option;
    (** Reference identifier to be used with AllocTransType (7) =Replace or Cancel.
     (Prior to FIX 4.1 this field was of type int)
     Required for AllocTransType = Replace or Cancel*)
    f_AllocationReport_RefAllocID : fix_string option;
    (** Response to allocation to be communicated to a counterparty through an intermediary, i.e. clearing house. Used in conjunction with AllocType = "Request to Intermediary" and AllocReportType = "Request to Intermediary"
     Required if AllocReportType = 8 (Request to Intermediary)
     Indicates status that is requested to be transmitted to counterparty by the intermediary (i.e. clearing house)*)
    f_AllocationReport_AllocIntermedReqType : fix_allocintermedreqtype option;
    (** Can be used to link two different Allocation messages (each with unique AllocID (70)) together, i.e. for F/X "Netting" or "Swaps". Should be unique.
     Can be used to link two different Allocation messages (each with unique AllocID) together, i.e. for F/X "Netting" or "Swaps"*)
    f_AllocationReport_AllocLinkID : fix_string option;
    (** Identifies the type of Allocation linkage when AllocLinkID (96) is used.
     Can be used to link two different Allocation messages and identifies the type of link. Required if AllocLinkID is specified.*)
    f_AllocationReport_AllocLinkType : fix_alloclinktype option;
    (** Common reference passed to a post-trade booking process (e.g. industry matching utility).*)
    f_AllocationReport_BookingRefID : fix_string option;
    (** Indicates how the orders being booked and allocated by an Allocation Instruction or Allocation Report message are identified, i.e. by explicit definition in the NoOrders group or not.
     Indicates how the orders being booked and allocated by this message are identified, i.e. by explicit definition in the NoOrders group or not.*)
    f_AllocationReport_AllocNoOrdersType : fix_allocnoorderstype;
    (** Indicates number of orders to be combined for allocation. If order(s) were manually delivered set to 1 (one).Required when AllocNoOrdersType = 1*)
    f_AllocationReport_OrdAllocGrp : fix_ordallocgrp;
    (** Indicates number of individual execution repeating group entries to follow. Absence of this field indicates that no individual execution entries are included. Primarily used to support step-outs.*)
    f_AllocationReport_ExecAllocGrp : fix_execallocgrp;
    (** Indicates if the trade capture report was previously reported to the counterparty*)
    f_AllocationReport_PreviouslyReported : fix_previouslyreported option;
    (** Indicates a trade that reverses a previous trade.*)
    f_AllocationReport_ReversalIndicator : bool option;
    (** The point in the matching process at which this trade was matched*)
    f_AllocationReport_MatchType : fix_matchtype option;
    (** Side of order*)
    f_AllocationReport_Side : fix_side;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_AllocationReport_Instrument : fix_instrument;
    (** Insert here the set of "InstrumentExtension" fields defined in "Common Components of Application Messages"*)
    f_AllocationReport_InstrumentExtension : fix_instrumentextension;
    (** Insert here the set of "FinancingDetails" fields defined in "Common Components of Application Messages"*)
    f_AllocationReport_FinancingDetails : fix_financingdetails;
    f_AllocationReport_UndInstrmtGrp : fix_undinstrmtgrp;
    f_AllocationReport_InstrmtLegGrp : fix_instrmtleggrp;
    (** Overall/total quantity (e.g. number of shares)
     (Prior to FIX 4.2 this field was of type int)
     Total quantity (e.g. number of shares) allocated to all accounts, or that is Ready-To-Book*)
    f_AllocationReport_Quantity : fix_float;
    (** Type of quantity specified in a quantity field*)
    f_AllocationReport_QtyType : fix_qtytype option;
    (** Market of execution for last fill, or an indication of the market where an order was routed
     Valid values:
     See "Appendix 6-C"
     Market of the executions.*)
    f_AllocationReport_LastMkt : fix_exchange option;
    (** Used with Fixed Income for Muncipal New Issue Market. Agreement in principal between counter-parties prior to actual trade date.
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)
     (prior to FIX 4.4 field was of type UTCDate)*)
    f_AllocationReport_TradeOriginationDate : fix_localmktdate option;
    (** Identifier for Trading Session
     Can be used to represent a specific market trading session (e.g. "PRE-OPEN", "CROSS_2", "AFTER-HOURS", "TOSTNET", "TOSTNET2", etc).
     To specify good for session where session spans more than one calendar day, use TimeInForce = Day in conjunction with TradingSessionID.
     Values should be bi-laterally agreed to between counterparties.
     Firms may register Trading Session values on the FIX website (presently a document maintained within "ECN and Exchanges" working group section).*)
    f_AllocationReport_TradingSessionID : fix_string option;
    (** Optional market assigned sub identifier for a trading session. Usage is determined by market or counterparties.
     Used by US based futures markets to identify exchange specific execution time bracket codes as required by US market regulations.*)
    f_AllocationReport_TradingSessionSubID : fix_string option;
    (** Code to represent the price type*)
    f_AllocationReport_PriceType : fix_pricetype option;
    (** Calculated average price of all fills on this order.
     For Fixed Income trades AvgPx is always expressed as percent-of-par, regardless of the PriceType (423) of LastPx (3). I.e., AvgPx will contain an average of percent-of-par values (see LastParPx (669)) for issues traded in Yield, Spread or Discount.
     For F/X orders, should be the "all-in" rate (spot rate adjusted for forward points).*)
    f_AllocationReport_AvgPx : fix_float;
    (** Used to express average price as percent of par (used where AvgPx field is expressed in some other way)*)
    f_AllocationReport_AvgParPx : fix_float option;
    (** Insert here the set of "SpreadOrBenchmarkCurveData" fields defined in "Common Components of Application Messages"*)
    f_AllocationReport_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.
     Currency of AvgPx. Should be the currency of the local market or exchange where the trade was conducted.*)
    f_AllocationReport_Currency : fix_currency option;
    (** Indicates number of decimal places to be used for average pricing. Absence of this field indicates that default precision arranged by the broker/institution is to be used.
     Absence of this field indicates that default precision arranged by the broker/institution is to be used*)
    f_AllocationReport_AvgPxPrecision : int option;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_AllocationReport_Parties : fix_parties;
    (** Indicates date of trade referenced in this message in YYYYMMDD format. Absence of this field indicates current day (expressed in local time at place of trade).*)
    f_AllocationReport_TradeDate : fix_localmktdate;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")
     Date/time when allocation is generated*)
    f_AllocationReport_TransactTime : fix_utctimestamp option;
    (** Indicates order settlement period. If present, SettlDate (64) overrides this field. If both SettlType (63) and SettDate (64) are omitted, the default for SettlType (63) is 0 (Regular)
     Regular is defined as the default settlement period for the particular security on the exchange of execution.
     In Fixed Income the contents of this field may influence the instrument definition if the SecurityID (48) is ambiguous. In the US an active Treasury offering may be re-opened, and for a time one CUSIP will apply to both the current and "when-issued" securities. Supplying a value of "7" clarifies the instrument description; any other value or the absence of this field should cause the respondent to default to the active issue.*)
    f_AllocationReport_SettlType : fix_settltype option;
    (** Specific date of trade settlement (SettlementDate) in YYYYMMDD format.
     If present, this field overrides SettlType (63). This field is required if the value of SettlType (63) is 6 (Future) or 8 (Sellers Option). This field must be omitted if the value of SettlType (63) is 7 (When and If Issued)
     (expressed in local time at place of settlement)
     Takes precedence over SettlType value and conditionally required/omitted for specific SettlType values.*)
    f_AllocationReport_SettlDate : fix_localmktdate option;
    (** Method for booking out this order. Used when notifying a broker that an order to be settled by that broker is to be booked out as an OTC derivative (e.g. CFD or similar).
     Method for booking. Used to provide notification that this is to be booked out as an OTC derivative (e.g. CFD or similar). Absence of this field implies regular booking.*)
    f_AllocationReport_BookingType : fix_bookingtype option;
    (** Total amount traded (e.g. CumQty (4) * AvgPx (6)) expressed in units of currency.
     Expressed in same currency as AvgPx. Sum of (AllocQty * AllocAvgPx or AllocPrice).*)
    f_AllocationReport_GrossTradeAmt : fix_float option;
    (** Provides the reduction in price for the secondary market in Muncipals.
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)*)
    f_AllocationReport_Concession : fix_float option;
    (** The price at which the securities are distributed to the different members of an underwriting group for the primary market in Municipals, total gross underwriter's spread.
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)*)
    f_AllocationReport_TotalTakedown : fix_float option;
    (** Total amount due as the result of the transaction (e.g. for Buy order - principal + commission + fees) reported in currency of execution.
     Expressed in same currency as AvgPx. Sum of AllocNetMoney.*)
    f_AllocationReport_NetMoney : fix_float option;
    (** Indicates whether the resulting position after a trade should be an opening position or closing position. Used for omnibus accounting - where accounts are held on a gross basis instead of being netted together.*)
    f_AllocationReport_PositionEffect : fix_positioneffect option;
    (** Identifies whether or not an allocation has been automatically accepted on behalf of the Carry Firm by the Clearing House.
     Indicates if Allocation has been automatically accepted on behalf of the Carry Firm by the Clearing House*)
    f_AllocationReport_AutoAcceptIndicator : bool option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_AllocationReport_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_AllocationReport_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_AllocationReport_EncodedText : fix_string option;
    (** Number of Days of Interest for convertible bonds and fixed income. Note value may be negative.
     Applicable for Convertible Bonds and fixed income*)
    f_AllocationReport_NumDaysInterest : int option;
    (** The amount the buyer compensates the seller for the portion of the next coupon interest payment the seller has earned but will not receive from the issuer because the issuer will send the next coupon payment to the buyer. Accrued Interest Rate is the annualized Accrued Interest amount divided by the purchase price of the bond.
     Applicable for Convertible Bonds and fixed income*)
    f_AllocationReport_AccruedInterestRate : fix_float option;
    (** Amount of Accrued Interest for convertible bonds and fixed income
     Sum of AllocAccruedInterestAmt within repeating group.*)
    f_AllocationReport_AccruedInterestAmt : fix_float option;
    (** *** DEPRECATED FIELD - See "Deprecated (Phased-out) Features and Supported Approach" ***
     Total Amount of Accrued Interest for convertible bonds and fixed income
     (Deprecated) use AccruedInterestAmt Sum of AccruedInterestAmt within repeating group.*)
    f_AllocationReport_TotalAccruedInterestAmt : fix_float option;
    (** Amount of interest (i.e. lump-sum) at maturity.*)
    f_AllocationReport_InterestAtMaturity : fix_float option;
    (** Accrued Interest Amount applicable to a financing transaction on the End Date.
     For repurchase agreements the accrued interest on termination.*)
    f_AllocationReport_EndAccruedInterestAmt : fix_float option;
    (** Starting dirty cash consideration of a financing deal, i.e. paid to the seller on the Start Date.
     For repurchase agreements the start (dirty) cash consideration*)
    f_AllocationReport_StartCash : fix_float option;
    (** Ending dirty cash consideration of a financing deal. i.e. reimbursed to the buyer on the End Date.
     For repurchase agreements the end (dirty) cash consideration*)
    f_AllocationReport_EndCash : fix_float option;
    (** Indicates that this message is to serve as the final and legal confirmation.*)
    f_AllocationReport_LegalConfirm : fix_legalconfirm option;
    f_AllocationReport_Stipulations : fix_stipulations;
    f_AllocationReport_YieldData : fix_yielddata;
    (** Total number of NoAlloc entries across all messages. Should be the sum of all NoAllocs in each message that has repeating NoAlloc entries related to the same AllocID or AllocReportID. Used to support fragmentation.
     Indicates total number of allocation groups (used to support fragmentation). Must equal the sum of all NoAllocs values across all message fragments making up this allocation instruction.
     Only required where message has been fragmented.*)
    f_AllocationReport_TotNoAllocs : int option;
    (** Indicates whether this message is the last in a sequence of messages for those messages that support fragmentation, such as Allocation Instruction, Mass Quote, Security List, Derivative Security List
     Indicates whether this is the last fragment in a sequence of message fragments.
     Only required where message has been fragmented.*)
    f_AllocationReport_LastFragment : fix_lastfragment option;
    (** Indicates number of allocation groups to follow.
     Not required for AllocTransType=Cancel
     Not required for AllocReportType= "Warehouse recap".*)
    f_AllocationReport_AllocGrp : fix_allocgrp
}
;;

(** The Allocation Report Ack message is used to acknowledge the receipt of and provide status for an Allocation Report message.*)
type full_fix_allocationreportack_data = {
    (** Unique identifier for Allocation Report message.*)
    f_AllocationReportAck_AllocReportID : fix_string;
    (** Unique identifier for allocation message.
     (Prior to FIX 4.1 this field was of type int)*)
    f_AllocationReportAck_AllocID : fix_string;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_AllocationReportAck_Parties : fix_parties;
    (** Secondary allocation identifier. Unlike the AllocID (70), this can be shared across a number of allocation instruction or allocation report messages, thereby making it possible to pass an identifier for an original allocation message on multiple messages (e.g. from one party to a second to a third, across cancel and replace messages etc.).
     Optional second identifier for the allocation report being acknowledged (need not be unique)*)
    f_AllocationReportAck_SecondaryAllocID : fix_string option;
    (** Indicates date of trade referenced in this message in YYYYMMDD format. Absence of this field indicates current day (expressed in local time at place of trade).*)
    f_AllocationReportAck_TradeDate : fix_localmktdate option;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")
     Date/Time Allocation Report Ack generated*)
    f_AllocationReportAck_TransactTime : fix_utctimestamp;
    (** Identifies status of allocation
     Denotes the status of the allocation report; received (but not yet processed), rejected (at block or account level) or accepted (and processed).*)
    f_AllocationReportAck_AllocStatus : fix_allocstatus;
    (** Identifies reason for rejection
     Required for AllocStatus = 1 ( block level reject) and for AllocStatus 2 (account level reject) if the individual accounts and reject reasons are not provided in this message*)
    f_AllocationReportAck_AllocRejCode : fix_allocrejcode option;
    (** Describes the specific type or purpose of an Allocation Report message*)
    f_AllocationReportAck_AllocReportType : fix_allocreporttype option;
    (** Response to allocation to be communicated to a counterparty through an intermediary, i.e. clearing house. Used in conjunction with AllocType = "Request to Intermediary" and AllocReportType = "Request to Intermediary"
     Required if AllocReportType = 8 (Request to Intermediary)
     Indicates status that is requested to be transmitted to counterparty by the intermediary (i.e. clearing house)*)
    f_AllocationReportAck_AllocIntermedReqType : fix_allocintermedreqtype option;
    (** The status of this trade with respect to matching or comparison
     Denotes whether the financial details provided on the Allocation Report were successfully matched.*)
    f_AllocationReportAck_MatchStatus : fix_matchstatus option;
    (** Indicates the type of product the security is associated with. See also the CFICode (46) and SecurityType (67) fields.*)
    f_AllocationReportAck_Product : fix_product option;
    (** Indicates type of security. See also the Product (460) and CFICode (46) fields. It is recommended that CFICode be used instead of SecurityType for non-Fixed Income instruments.
     Example values (grouped by Product field value) (Note: additional values may be used by mutual agreement of the counterparties):
     * Identify the Issuer in the "Issuer" field(06)
     *** REPLACED values - See "Replaced Features and Supported Approach" ***
     NOTE: Additional values may be used by mutual agreement of the counterparties)*)
    f_AllocationReportAck_SecurityType : fix_securitytype option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)
     Can include explanation for AllocRejCode = 7 (other)*)
    f_AllocationReportAck_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_AllocationReportAck_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_AllocationReportAck_EncodedText : fix_string option;
    (** This repeating group is optionally used for messages with AllocStatus = 2 (account level reject) to provide details of the individual accounts that caused the rejection, together with reject reasons. This group should not be populated where AllocStatus has any other value.
     Indicates number of allocation groups to follow.*)
    f_AllocationReportAck_AllocAckGrp : fix_allocackgrp
}
;;

(** Assignment Reports are sent from a clearing house to counterparties, such as a clearing firm as a result of the assignment process.*)
type full_fix_assignmentreport_data = {
    (** Unique identifier for the Assignment Report
     Unique identifier for the Assignment report*)
    f_AssignmentReport_AsgnRptID : fix_string;
    (** Total Number of Assignment Reports being returned to a firm
     Total Number of Assignment Reports being returned to a firm*)
    f_AssignmentReport_TotNumAssignmentReports : int option;
    (** Indicates whether this message is that last report message in response to a request, such as Order Mass Status Request.*)
    f_AssignmentReport_LastRptRequested : bool option;
    (** Clearing Organization
     Clearing Firm
     Contra Clearing Organization
     Contra Clearing Firm
     Position Account*)
    f_AssignmentReport_Parties : fix_parties;
    (** Account mnemonic as agreed between buy and sell sides, e.g. broker and institution or investor/intermediary and fund manager.
     Customer Account*)
    f_AssignmentReport_Account : fix_string option;
    (** Type of account associated with an order
     Type of account associated with the order (Origin)*)
    f_AssignmentReport_AccountType : fix_accounttype;
    (** CFI Code - Market Indicator (col 4) used to indicate Market of Assignment*)
    f_AssignmentReport_Instrument : fix_instrument;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.*)
    f_AssignmentReport_Currency : fix_currency option;
    (** Number of legs that make up the Security*)
    f_AssignmentReport_InstrmtLegGrp : fix_instrmtleggrp;
    (** Number of legs that make up the Security*)
    f_AssignmentReport_UndInstrmtGrp : fix_undinstrmtgrp;
    (** See definition for Position Quantity in the Proposed Component Block section above
     AS - Assignment Quantity*)
    f_AssignmentReport_PositionQty : fix_positionqty;
    (** Insert here here the set of "Position Amount Data" fields defined in "Common Components of Application Messages"
     FMTM - Final Mark-to-Market for Assignment*)
    f_AssignmentReport_PositionAmountData : fix_positionamountdata;
    (** Amount that a position has to be in the money before it is exercised.*)
    f_AssignmentReport_ThresholdAmount : fix_float option;
    (** Settlement price
     Settlement Price of Option*)
    f_AssignmentReport_SettlPrice : fix_float;
    (** Type of settlement price
     Values = Final, Theoretical*)
    f_AssignmentReport_SettlPriceType : fix_settlpricetype;
    (** Underlying security’s SettlPrice.
     See SettlPrice (730) field for description
     Settlement Price of Underlying*)
    f_AssignmentReport_UnderlyingSettlPrice : fix_float;
    (** Date of order expiration (last day the order can trade), always expressed in terms of the local market date. The time at which the order expires is determined by the local market’s business practices
     Expiration Date of Option*)
    f_AssignmentReport_ExpireDate : fix_localmktdate option;
    (** Method under which assignment was conducted
     Method under which assignment was conducted
     Values = Random, ProRata*)
    f_AssignmentReport_AssignmentMethod : fix_assignmentmethod;
    (** Quantity Increment used in performing assignment.
     Quantity Increment used in performing assignment*)
    f_AssignmentReport_AssignmentUnit : fix_float option;
    (** Open interest that was eligible for assignment.
     Open interest that was eligible for assignment*)
    f_AssignmentReport_OpenInterest : fix_float;
    (** Exercise Method used to in performing assignment
     Exercise Method used to in performing assignment
     Values = Automatic, Manual*)
    f_AssignmentReport_ExerciseMethod : fix_exercisemethod;
    (** Identifies a specific settlement session
     Settlement Session - EOD or Intraday*)
    f_AssignmentReport_SettlSessID : fix_settlsessid;
    (** SubID value associated with SettlSessID (76)
     Settlement Session enumerator*)
    f_AssignmentReport_SettlSessSubID : fix_string;
    (** The "Clearing Business Date" referred to by this maintenance request.
     Business date of assignment*)
    f_AssignmentReport_ClearingBusinessDate : fix_localmktdate;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_AssignmentReport_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_AssignmentReport_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_AssignmentReport_EncodedText : fix_string option
}
;;

(** The BidRequest Message can be used in one of two ways depending on which market conventions are being followed.*)
type full_fix_bidrequest_data = {
    (** Unique identifier for Bid Response as assigned by sell-side (broker, exchange, ECN). Uniqueness must be guaranteed within a single trading day.
     Required to relate the bid response*)
    f_BidRequest_BidID : fix_string option;
    (** Unique identifier for a Bid Request as assigned by institution. Uniqueness must be guaranteed within a single trading day.*)
    f_BidRequest_ClientBidID : fix_string;
    (** Identifies the Bid Request message type
     Identifies the Bid Request message transaction type*)
    f_BidRequest_BidRequestTransType : fix_bidrequesttranstype;
    (** Descriptive name for list order.*)
    f_BidRequest_ListName : fix_string option;
    (** Total number of securities.
     (Prior to FIX 4.4 this field was named TotalNumSecurities)*)
    f_BidRequest_TotNoRelatedSym : int;
    (** Code to identify the type of Bid Request
     e.g. "Non Disclosed", "Disclosed", No Bidding Process*)
    f_BidRequest_BidType : fix_bidtype;
    (** Total number of tickets.
     Total number of tickets/allocations assuming fully executed*)
    f_BidRequest_NumTickets : int option;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.
     Used to represent the currency of monetary amounts.*)
    f_BidRequest_Currency : fix_currency option;
    (** Amounts in currency
     Expressed in Currency*)
    f_BidRequest_SideValue1 : fix_float option;
    (** Amounts in currency
     Expressed in Currency*)
    f_BidRequest_SideValue2 : fix_float option;
    (** Used if BidType="Non Disclosed"*)
    f_BidRequest_BidDescReqGrp : fix_biddescreqgrp;
    (** Used if BidType="Disclosed"*)
    f_BidRequest_BidCompReqGrp : fix_bidcompreqgrp;
    (** Code to identify the type of liquidity indicator*)
    f_BidRequest_LiquidityIndType : fix_liquidityindtype option;
    (** Overall weighted average liquidity expressed as a % of average daily volume. Represented as a percentage.
     Overall weighted average liquidity expressed as a % of average daily volume*)
    f_BidRequest_WtAverageLiquidity : fix_float option;
    (** Indicates whether or not to exchange for phsyical.*)
    f_BidRequest_ExchangeForPhysical : fix_exchangeforphysical option;
    (** Value of stocks in Currency
     % value of stocks outside main country in Currency*)
    f_BidRequest_OutMainCntryUIndex : fix_float option;
    (** Percentage of program that crosses in Currency. Represented as a percentage.
     % of program that crosses in Currency*)
    f_BidRequest_CrossPercent : fix_float option;
    (** Code to identify the desired frequency of progress reports*)
    f_BidRequest_ProgRptReqs : fix_progrptreqs option;
    (** Time in minutes between each ListStatus report sent by SellSide. Zero means don’t send status.
     Time in minutes between each ListStatus report sent by SellSide. Zero means don’t send status.*)
    f_BidRequest_ProgPeriodInterval : int option;
    (** Code to represent whether value is net (inclusive of tax) or gross
     Net/Gross*)
    f_BidRequest_IncTaxInd : fix_inctaxind option;
    (** Indicates request for forex accommodation trade to be executed along with security transaction.
     Is foreign exchange required*)
    f_BidRequest_ForexReq : fix_forexreq option;
    (** Indicates the total number of bidders on the list
     Indicates the total number of bidders on the list*)
    f_BidRequest_NumBidders : int option;
    (** Indicates date of trade referenced in this message in YYYYMMDD format. Absence of this field indicates current day (expressed in local time at place of trade).*)
    f_BidRequest_TradeDate : fix_localmktdate option;
    (** Code to represent the type of trade*)
    f_BidRequest_BidTradeType : fix_bidtradetype;
    (** Code to represent the basis price type*)
    f_BidRequest_BasisPxType : fix_basispxtype;
    (** The time at which current market prices are used to determine the value of a basket.
     Used when BasisPxType = "C"*)
    f_BidRequest_StrikeTime : fix_utctimestamp option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_BidRequest_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_BidRequest_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_BidRequest_EncodedText : fix_string option
}
;;

(** The Bid Response message can be used in one of two ways depending on which market conventions are being followed.
       In the "Non disclosed" convention the Bid Response message can be used to supply a bid based on the sector, country, index and liquidity information contained within the corresponding bid request message. See "Program/Basket/List Trading"  for an example.
       In the "Disclosed" convention the Bid Response message can be used to supply bids based on the List Order Detail messages sent in advance of the corresponding Bid Request message.*)
type full_fix_bidresponse_data = {
    (** Unique identifier for Bid Response as assigned by sell-side (broker, exchange, ECN). Uniqueness must be guaranteed within a single trading day.*)
    f_BidResponse_BidID : fix_string option;
    (** Unique identifier for a Bid Request as assigned by institution. Uniqueness must be guaranteed within a single trading day.*)
    f_BidResponse_ClientBidID : fix_string option;
    (** Number of bid repeating groups*)
    f_BidResponse_BidCompRspGrp : fix_bidcomprspgrp
}
;;

(** Used to assign collateral to cover a trading position. This message can be sent unsolicited or in reply to a Collateral Request message.*)
type full_fix_collateralassignment_data = {
    (** Collateral Assignment Identifier
     Unique Identifer for collateral assignment*)
    f_CollateralAssignment_CollAsgnID : fix_string;
    (** Collateral Request Identifier
     Identifer of CollReqID to which the Collateral Assignment is in response*)
    f_CollateralAssignment_CollReqID : fix_string option;
    (** Reason for Collateral Assignment
     Reason for collateral assignment*)
    f_CollateralAssignment_CollAsgnReason : fix_collasgnreason;
    (** Collateral Assignment Transaction Type
     Collateral Transaction Type*)
    f_CollateralAssignment_CollAsgnTransType : fix_collasgntranstype;
    (** Collateral Assignment Identifier to which a transaction refers
     Collateral assignment to which this transaction refers*)
    f_CollateralAssignment_CollAsgnRefID : fix_string option;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")*)
    f_CollateralAssignment_TransactTime : fix_utctimestamp;
    (** Time/Date of order expiration (always expressed in UTC (Universal Time Coordinated, also known as "GMT")
     The meaning of expiration is specific to the context where the field is used.
     For orders, this is the expiration time of a Good Til Date TimeInForce.
     For Quotes - this is the expiration of the quote.
     Expiration time is provided across the quote message dialog to control the length of time of the overall quoting process.
     For collateral requests, this is the time by which collateral must be assigned.
     For collateral assignments, this is the time by which a response to the assignment is expected.
     For an Initial assignment, time by which a response is expected*)
    f_CollateralAssignment_ExpireTime : fix_utctimestamp option;
    f_CollateralAssignment_Parties : fix_parties;
    (** Account mnemonic as agreed between buy and sell sides, e.g. broker and institution or investor/intermediary and fund manager.
     Customer Account*)
    f_CollateralAssignment_Account : fix_string option;
    (** Type of account associated with an order
     Type of account associated with the order (Origin)*)
    f_CollateralAssignment_AccountType : fix_accounttype option;
    (** Unique identifier for Order as assigned by the buy-side (institution, broker, intermediary etc.) (identified by SenderCompID (49) or OnBehalfOfCompID (5) as appropriate). Uniqueness must be guaranteed within a single trading day. Firms, particularly those which electronically submit multi-day orders, trade globally or throughout market close periods, should ensure uniqueness across days, for example by embedding a date within the ClOrdID field.
     Identifier fo order for which collateral is required*)
    f_CollateralAssignment_ClOrdID : fix_string option;
    (** Unique identifier for Order as assigned by sell-side (broker, exchange, ECN). Uniqueness must be guaranteed within a single trading day. Firms which accept multi-day orders should consider embedding a date within the OrderID field to assure uniqueness across days.
     Identifier fo order for which collateral is required*)
    f_CollateralAssignment_OrderID : fix_string option;
    (** Assigned by the party which accepts the order. Can be used to provide the OrderID (37) used by an exchange or executing system.
     Identifier fo order for which collateral is required*)
    f_CollateralAssignment_SecondaryOrderID : fix_string option;
    (** Assigned by the party which originates the order. Can be used to provide the ClOrdID (11) used by an exchange or executing system.
     Identifier fo order for which collateral is required*)
    f_CollateralAssignment_SecondaryClOrdID : fix_string option;
    (** Executions for which collateral is required*)
    f_CollateralAssignment_ExecCollGrp : fix_execcollgrp;
    (** Trades for which collateral is required*)
    f_CollateralAssignment_TrdCollGrp : fix_trdcollgrp;
    (** Insert here the set of "Instrument" fields defined in "Common Components of Application Messages"*)
    f_CollateralAssignment_Instrument : fix_instrument;
    (** Insert here the set of "FinancingDetails" fields defined in "Common Components of Application Messages"*)
    f_CollateralAssignment_FinancingDetails : fix_financingdetails;
    (** Specific date of trade settlement (SettlementDate) in YYYYMMDD format.
     If present, this field overrides SettlType (63). This field is required if the value of SettlType (63) is 6 (Future) or 8 (Sellers Option). This field must be omitted if the value of SettlType (63) is 7 (When and If Issued)
     (expressed in local time at place of settlement)*)
    f_CollateralAssignment_SettlDate : fix_localmktdate option;
    (** Overall/total quantity (e.g. number of shares)
     (Prior to FIX 4.2 this field was of type int)*)
    f_CollateralAssignment_Quantity : fix_float option;
    (** Type of quantity specified in a quantity field*)
    f_CollateralAssignment_QtyType : fix_qtytype option;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.*)
    f_CollateralAssignment_Currency : fix_currency option;
    (** Number of legs that make up the Security*)
    f_CollateralAssignment_InstrmtLegGrp : fix_instrmtleggrp;
    (** Number of legs that make up the Security*)
    f_CollateralAssignment_UndInstrmtCollGrp : fix_undinstrmtcollgrp;
    (** Excess margin amount (deficit if value is negative)*)
    f_CollateralAssignment_MarginExcess : fix_float option;
    (** TotalNetValue is determined as follows:
     At the initial collateral assignment TotalNetValue is the sum of (UnderlyingStartValue * (1-haircut)).
     In a collateral substitution TotalNetValue is the sum of (UnderlyingCurrentValue * (1-haircut)).
     For listed derivatives clearing margin management, this is the collateral value which equals (Market value * haircut)*)
    f_CollateralAssignment_TotalNetValue : fix_float option;
    (** Starting consideration less repayments*)
    f_CollateralAssignment_CashOutstanding : fix_float option;
    (** Insert here the set of "TrdRegTimestamps" fields defined in "Common Components of Application Messages"*)
    f_CollateralAssignment_TrdRegTimestamps : fix_trdregtimestamps;
    (** Side of order*)
    f_CollateralAssignment_Side : fix_side option;
    (** Required if any miscellaneous fees are reported. Indicates number of repeating entries
     ** Nested Repeating Group follows ***)
    f_CollateralAssignment_MiscFeesGrp : fix_miscfeesgrp;
    (** Price per unit of quantity (e.g. per share)*)
    f_CollateralAssignment_Price : fix_float option;
    (** Code to represent the price type*)
    f_CollateralAssignment_PriceType : fix_pricetype option;
    (** Amount of Accrued Interest for convertible bonds and fixed income*)
    f_CollateralAssignment_AccruedInterestAmt : fix_float option;
    (** Accrued Interest Amount applicable to a financing transaction on the End Date.*)
    f_CollateralAssignment_EndAccruedInterestAmt : fix_float option;
    (** Starting dirty cash consideration of a financing deal, i.e. paid to the seller on the Start Date.*)
    f_CollateralAssignment_StartCash : fix_float option;
    (** Ending dirty cash consideration of a financing deal. i.e. reimbursed to the buyer on the End Date.*)
    f_CollateralAssignment_EndCash : fix_float option;
    (** Insert here the set of "SpreadOrBenchmarkCurveData" fields defined in "Common Components of Application Messages"*)
    f_CollateralAssignment_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    (** Insert here the set of "Stipulations" fields defined in "Common Components of Application Messages"*)
    f_CollateralAssignment_Stipulations : fix_stipulations;
    (** Insert here the set of "SettlInstructionsData" fields defined in "Common Components of Application Messages"*)
    f_CollateralAssignment_SettlInstructionsData : fix_settlinstructionsdata;
    (** Identifier for Trading Session
     Can be used to represent a specific market trading session (e.g. "PRE-OPEN", "CROSS_2", "AFTER-HOURS", "TOSTNET", "TOSTNET2", etc).
     To specify good for session where session spans more than one calendar day, use TimeInForce = Day in conjunction with TradingSessionID.
     Values should be bi-laterally agreed to between counterparties.
     Firms may register Trading Session values on the FIX website (presently a document maintained within "ECN and Exchanges" working group section).
     Trading Session in which trade occurred*)
    f_CollateralAssignment_TradingSessionID : fix_string option;
    (** Optional market assigned sub identifier for a trading session. Usage is determined by market or counterparties.
     Used by US based futures markets to identify exchange specific execution time bracket codes as required by US market regulations.
     Trading Session Subid in which trade occurred*)
    f_CollateralAssignment_TradingSessionSubID : fix_string option;
    (** Identifies a specific settlement session*)
    f_CollateralAssignment_SettlSessID : fix_settlsessid option;
    (** SubID value associated with SettlSessID (76)*)
    f_CollateralAssignment_SettlSessSubID : fix_string option;
    (** The "Clearing Business Date" referred to by this maintenance request.*)
    f_CollateralAssignment_ClearingBusinessDate : fix_localmktdate option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_CollateralAssignment_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_CollateralAssignment_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_CollateralAssignment_EncodedText : fix_string option
}
;;

(** Used to inquire for collateral status*)
type full_fix_collateralinquiry_data = {
    (** Collateral Inquiry Identifier
     Identifier for the collateral inquiry to which this message is a reply*)
    f_CollateralInquiry_CollInquiryID : fix_string option;
    (** Number of qualifiers to inquiry*)
    f_CollateralInquiry_CollInqQualGrp : fix_collinqqualgrp;
    (** Subscription Request Type
     Used to subscribe / unsubscribe for collateral status reports.
     If the field is absent, the default will be snapshot request only - no subscription.*)
    f_CollateralInquiry_SubscriptionRequestType : fix_subscriptionrequesttype option;
    (** Identifies how the response to the request should be transmitted
     Ability to specify whether the response to the request should be delivered inband or via pre-arranged out-of-band transport.*)
    f_CollateralInquiry_ResponseTransportType : fix_responsetransporttype option;
    (** URI (Uniform Resource Identifier) for details) or other pre-arranged value. Used in conjunction with ResponseTransportType (725) value of Out-of-Band to identify the out-of-band destination.
     See "Appendix 6-B FIX Fields Based Upon Other Standards"
     URI destination name. Used if ResponseTransportType is out-of-band.*)
    f_CollateralInquiry_ResponseDestination : fix_string option;
    f_CollateralInquiry_Parties : fix_parties;
    (** Account mnemonic as agreed between buy and sell sides, e.g. broker and institution or investor/intermediary and fund manager.
     Customer Account*)
    f_CollateralInquiry_Account : fix_string option;
    (** Type of account associated with an order
     Type of account associated with the order (Origin)*)
    f_CollateralInquiry_AccountType : fix_accounttype option;
    (** Unique identifier for Order as assigned by the buy-side (institution, broker, intermediary etc.) (identified by SenderCompID (49) or OnBehalfOfCompID (5) as appropriate). Uniqueness must be guaranteed within a single trading day. Firms, particularly those which electronically submit multi-day orders, trade globally or throughout market close periods, should ensure uniqueness across days, for example by embedding a date within the ClOrdID field.
     Identifier fo order for which collateral is required*)
    f_CollateralInquiry_ClOrdID : fix_string option;
    (** Unique identifier for Order as assigned by sell-side (broker, exchange, ECN). Uniqueness must be guaranteed within a single trading day. Firms which accept multi-day orders should consider embedding a date within the OrderID field to assure uniqueness across days.
     Identifier fo order for which collateral is required*)
    f_CollateralInquiry_OrderID : fix_string option;
    (** Assigned by the party which accepts the order. Can be used to provide the OrderID (37) used by an exchange or executing system.
     Identifier fo order for which collateral is required*)
    f_CollateralInquiry_SecondaryOrderID : fix_string option;
    (** Assigned by the party which originates the order. Can be used to provide the ClOrdID (11) used by an exchange or executing system.
     Identifier fo order for which collateral is required*)
    f_CollateralInquiry_SecondaryClOrdID : fix_string option;
    (** Executions for which collateral is required*)
    f_CollateralInquiry_ExecCollGrp : fix_execcollgrp;
    (** Trades for which collateral is required*)
    f_CollateralInquiry_TrdCollGrp : fix_trdcollgrp;
    (** Insert here the set of "Instrument" fields defined in "Common Components of Application Messages"*)
    f_CollateralInquiry_Instrument : fix_instrument;
    (** Insert here the set of "FinancingDetails" fields defined in "Common Components of Application Messages"*)
    f_CollateralInquiry_FinancingDetails : fix_financingdetails;
    (** Specific date of trade settlement (SettlementDate) in YYYYMMDD format.
     If present, this field overrides SettlType (63). This field is required if the value of SettlType (63) is 6 (Future) or 8 (Sellers Option). This field must be omitted if the value of SettlType (63) is 7 (When and If Issued)
     (expressed in local time at place of settlement)*)
    f_CollateralInquiry_SettlDate : fix_localmktdate option;
    (** Overall/total quantity (e.g. number of shares)
     (Prior to FIX 4.2 this field was of type int)*)
    f_CollateralInquiry_Quantity : fix_float option;
    (** Type of quantity specified in a quantity field*)
    f_CollateralInquiry_QtyType : fix_qtytype option;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.*)
    f_CollateralInquiry_Currency : fix_currency option;
    (** Number of legs that make up the Security*)
    f_CollateralInquiry_InstrmtLegGrp : fix_instrmtleggrp;
    (** Number of legs that make up the Security*)
    f_CollateralInquiry_UndInstrmtGrp : fix_undinstrmtgrp;
    (** Excess margin amount (deficit if value is negative)*)
    f_CollateralInquiry_MarginExcess : fix_float option;
    (** TotalNetValue is determined as follows:
     At the initial collateral assignment TotalNetValue is the sum of (UnderlyingStartValue * (1-haircut)).
     In a collateral substitution TotalNetValue is the sum of (UnderlyingCurrentValue * (1-haircut)).
     For listed derivatives clearing margin management, this is the collateral value which equals (Market value * haircut)*)
    f_CollateralInquiry_TotalNetValue : fix_float option;
    (** Starting consideration less repayments*)
    f_CollateralInquiry_CashOutstanding : fix_float option;
    (** Insert here the set of "TrdRegTimestamps" fields defined in "Common Components of Application Messages"*)
    f_CollateralInquiry_TrdRegTimestamps : fix_trdregtimestamps;
    (** Side of order*)
    f_CollateralInquiry_Side : fix_side option;
    (** Price per unit of quantity (e.g. per share)*)
    f_CollateralInquiry_Price : fix_float option;
    (** Code to represent the price type*)
    f_CollateralInquiry_PriceType : fix_pricetype option;
    (** Amount of Accrued Interest for convertible bonds and fixed income*)
    f_CollateralInquiry_AccruedInterestAmt : fix_float option;
    (** Accrued Interest Amount applicable to a financing transaction on the End Date.*)
    f_CollateralInquiry_EndAccruedInterestAmt : fix_float option;
    (** Starting dirty cash consideration of a financing deal, i.e. paid to the seller on the Start Date.*)
    f_CollateralInquiry_StartCash : fix_float option;
    (** Ending dirty cash consideration of a financing deal. i.e. reimbursed to the buyer on the End Date.*)
    f_CollateralInquiry_EndCash : fix_float option;
    (** Insert here the set of "SpreadOrBenchmarkCurveData" fields defined in "Common Components of Application Messages"*)
    f_CollateralInquiry_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    (** Insert here the set of "Stipulations" fields defined in "Common Components of Application Messages"*)
    f_CollateralInquiry_Stipulations : fix_stipulations;
    (** Insert here the set of "SettlInstructionsData" fields defined in "Common Components of Application Messages"*)
    f_CollateralInquiry_SettlInstructionsData : fix_settlinstructionsdata;
    (** Identifier for Trading Session
     Can be used to represent a specific market trading session (e.g. "PRE-OPEN", "CROSS_2", "AFTER-HOURS", "TOSTNET", "TOSTNET2", etc).
     To specify good for session where session spans more than one calendar day, use TimeInForce = Day in conjunction with TradingSessionID.
     Values should be bi-laterally agreed to between counterparties.
     Firms may register Trading Session values on the FIX website (presently a document maintained within "ECN and Exchanges" working group section).
     Trading Session in which trade occurred*)
    f_CollateralInquiry_TradingSessionID : fix_string option;
    (** Optional market assigned sub identifier for a trading session. Usage is determined by market or counterparties.
     Used by US based futures markets to identify exchange specific execution time bracket codes as required by US market regulations.
     Trading Session Subid in which trade occurred*)
    f_CollateralInquiry_TradingSessionSubID : fix_string option;
    (** Identifies a specific settlement session*)
    f_CollateralInquiry_SettlSessID : fix_settlsessid option;
    (** SubID value associated with SettlSessID (76)*)
    f_CollateralInquiry_SettlSessSubID : fix_string option;
    (** The "Clearing Business Date" referred to by this maintenance request.*)
    f_CollateralInquiry_ClearingBusinessDate : fix_localmktdate option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_CollateralInquiry_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_CollateralInquiry_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_CollateralInquiry_EncodedText : fix_string option
}
;;

(** Used to respond to a Collateral Inquiry*)
type full_fix_collateralinquiryack_data = {
    (** Collateral Inquiry Identifier
     Identifier for the collateral inquiry to which this message is a reply*)
    f_CollateralInquiryAck_CollInquiryID : fix_string;
    (** Status of Collateral Inquiry
     Status of the Collateral Inquiry referenced by CollInquiryID*)
    f_CollateralInquiryAck_CollInquiryStatus : fix_collinquirystatus;
    (** Result returned in response to Collateral Inquiry
     4000+ Reserved and available for bi-laterally agreed upon user-defined values
     Result of the Collateral Inquriy referenced by CollInquiryID - specifies any errors or warnings*)
    f_CollateralInquiryAck_CollInquiryResult : fix_collinquiryresult option;
    (** Number of qualifiers to inquiry*)
    f_CollateralInquiryAck_CollInqQualGrp : fix_collinqqualgrp;
    (** Total number or reports returned in response to a request
     Total number of reports generated in response to this inquiry*)
    f_CollateralInquiryAck_TotNumReports : int option;
    f_CollateralInquiryAck_Parties : fix_parties;
    (** Account mnemonic as agreed between buy and sell sides, e.g. broker and institution or investor/intermediary and fund manager.
     Customer Account*)
    f_CollateralInquiryAck_Account : fix_string option;
    (** Type of account associated with an order
     Type of account associated with the order (Origin)*)
    f_CollateralInquiryAck_AccountType : fix_accounttype option;
    (** Unique identifier for Order as assigned by the buy-side (institution, broker, intermediary etc.) (identified by SenderCompID (49) or OnBehalfOfCompID (5) as appropriate). Uniqueness must be guaranteed within a single trading day. Firms, particularly those which electronically submit multi-day orders, trade globally or throughout market close periods, should ensure uniqueness across days, for example by embedding a date within the ClOrdID field.
     Identifier fo order for which collateral is required*)
    f_CollateralInquiryAck_ClOrdID : fix_string option;
    (** Unique identifier for Order as assigned by sell-side (broker, exchange, ECN). Uniqueness must be guaranteed within a single trading day. Firms which accept multi-day orders should consider embedding a date within the OrderID field to assure uniqueness across days.
     Identifier fo order for which collateral is required*)
    f_CollateralInquiryAck_OrderID : fix_string option;
    (** Assigned by the party which accepts the order. Can be used to provide the OrderID (37) used by an exchange or executing system.
     Identifier fo order for which collateral is required*)
    f_CollateralInquiryAck_SecondaryOrderID : fix_string option;
    (** Assigned by the party which originates the order. Can be used to provide the ClOrdID (11) used by an exchange or executing system.
     Identifier fo order for which collateral is required*)
    f_CollateralInquiryAck_SecondaryClOrdID : fix_string option;
    (** Executions for which collateral is required*)
    f_CollateralInquiryAck_ExecCollGrp : fix_execcollgrp;
    (** Trades for which collateral is required*)
    f_CollateralInquiryAck_TrdCollGrp : fix_trdcollgrp;
    (** Insert here the set of "Instrument" fields defined in "Common Components of Application Messages"*)
    f_CollateralInquiryAck_Instrument : fix_instrument;
    (** Insert here the set of "FinancingDetails" fields defined in "Common Components of Application Messages"*)
    f_CollateralInquiryAck_FinancingDetails : fix_financingdetails;
    (** Specific date of trade settlement (SettlementDate) in YYYYMMDD format.
     If present, this field overrides SettlType (63). This field is required if the value of SettlType (63) is 6 (Future) or 8 (Sellers Option). This field must be omitted if the value of SettlType (63) is 7 (When and If Issued)
     (expressed in local time at place of settlement)*)
    f_CollateralInquiryAck_SettlDate : fix_localmktdate option;
    (** Overall/total quantity (e.g. number of shares)
     (Prior to FIX 4.2 this field was of type int)*)
    f_CollateralInquiryAck_Quantity : fix_float option;
    (** Type of quantity specified in a quantity field*)
    f_CollateralInquiryAck_QtyType : fix_qtytype option;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.*)
    f_CollateralInquiryAck_Currency : fix_currency option;
    (** Number of legs that make up the Security*)
    f_CollateralInquiryAck_InstrmtLegGrp : fix_instrmtleggrp;
    (** Number of legs that make up the Security*)
    f_CollateralInquiryAck_UndInstrmtGrp : fix_undinstrmtgrp;
    (** Identifier for Trading Session
     Can be used to represent a specific market trading session (e.g. "PRE-OPEN", "CROSS_2", "AFTER-HOURS", "TOSTNET", "TOSTNET2", etc).
     To specify good for session where session spans more than one calendar day, use TimeInForce = Day in conjunction with TradingSessionID.
     Values should be bi-laterally agreed to between counterparties.
     Firms may register Trading Session values on the FIX website (presently a document maintained within "ECN and Exchanges" working group section).
     Trading Session in which trade occurred*)
    f_CollateralInquiryAck_TradingSessionID : fix_string option;
    (** Optional market assigned sub identifier for a trading session. Usage is determined by market or counterparties.
     Used by US based futures markets to identify exchange specific execution time bracket codes as required by US market regulations.
     Trading Session Subid in which trade occurred*)
    f_CollateralInquiryAck_TradingSessionSubID : fix_string option;
    (** Identifies a specific settlement session*)
    f_CollateralInquiryAck_SettlSessID : fix_settlsessid option;
    (** SubID value associated with SettlSessID (76)*)
    f_CollateralInquiryAck_SettlSessSubID : fix_string option;
    (** The "Clearing Business Date" referred to by this maintenance request.*)
    f_CollateralInquiryAck_ClearingBusinessDate : fix_localmktdate option;
    (** Identifies how the response to the request should be transmitted
     Ability to specify whether the response to the request should be delivered inband or via pre-arranged out-of-band transport.*)
    f_CollateralInquiryAck_ResponseTransportType : fix_responsetransporttype option;
    (** URI (Uniform Resource Identifier) for details) or other pre-arranged value. Used in conjunction with ResponseTransportType (725) value of Out-of-Band to identify the out-of-band destination.
     See "Appendix 6-B FIX Fields Based Upon Other Standards"
     URI destination name. Used if ResponseTransportType is out-of-band.*)
    f_CollateralInquiryAck_ResponseDestination : fix_string option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_CollateralInquiryAck_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_CollateralInquiryAck_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_CollateralInquiryAck_EncodedText : fix_string option
}
;;

(** Used to report collateral status when responding to a Collateral Inquiry message.*)
type full_fix_collateralreport_data = {
    (** Collateral Report Identifier
     Unique Identifer for collateral report*)
    f_CollateralReport_CollRptID : fix_string;
    (** Collateral Inquiry Identifier
     Identifier for the collateral inquiry to which this message is a reply*)
    f_CollateralReport_CollInquiryID : fix_string option;
    (** Collateral Status
     Collateral status*)
    f_CollateralReport_CollStatus : fix_collstatus;
    (** Total number or reports returned in response to a request*)
    f_CollateralReport_TotNumReports : int option;
    (** Indicates whether this message is that last report message in response to a request, such as Order Mass Status Request.*)
    f_CollateralReport_LastRptRequested : bool option;
    f_CollateralReport_Parties : fix_parties;
    (** Account mnemonic as agreed between buy and sell sides, e.g. broker and institution or investor/intermediary and fund manager.
     Customer Account*)
    f_CollateralReport_Account : fix_string option;
    (** Type of account associated with an order
     Type of account associated with the order (Origin)*)
    f_CollateralReport_AccountType : fix_accounttype option;
    (** Unique identifier for Order as assigned by the buy-side (institution, broker, intermediary etc.) (identified by SenderCompID (49) or OnBehalfOfCompID (5) as appropriate). Uniqueness must be guaranteed within a single trading day. Firms, particularly those which electronically submit multi-day orders, trade globally or throughout market close periods, should ensure uniqueness across days, for example by embedding a date within the ClOrdID field.
     Identifier fo order for which collateral is required*)
    f_CollateralReport_ClOrdID : fix_string option;
    (** Unique identifier for Order as assigned by sell-side (broker, exchange, ECN). Uniqueness must be guaranteed within a single trading day. Firms which accept multi-day orders should consider embedding a date within the OrderID field to assure uniqueness across days.
     Identifier fo order for which collateral is required*)
    f_CollateralReport_OrderID : fix_string option;
    (** Assigned by the party which accepts the order. Can be used to provide the OrderID (37) used by an exchange or executing system.
     Identifier fo order for which collateral is required*)
    f_CollateralReport_SecondaryOrderID : fix_string option;
    (** Assigned by the party which originates the order. Can be used to provide the ClOrdID (11) used by an exchange or executing system.
     Identifier fo order for which collateral is required*)
    f_CollateralReport_SecondaryClOrdID : fix_string option;
    (** Executions for which collateral is required*)
    f_CollateralReport_ExecCollGrp : fix_execcollgrp;
    (** Trades for which collateral is required*)
    f_CollateralReport_TrdCollGrp : fix_trdcollgrp;
    (** Insert here the set of "Instrument" fields defined in "Common Components of Application Messages"*)
    f_CollateralReport_Instrument : fix_instrument;
    (** Insert here the set of "FinancingDetails" fields defined in "Common Components of Application Messages"*)
    f_CollateralReport_FinancingDetails : fix_financingdetails;
    (** Specific date of trade settlement (SettlementDate) in YYYYMMDD format.
     If present, this field overrides SettlType (63). This field is required if the value of SettlType (63) is 6 (Future) or 8 (Sellers Option). This field must be omitted if the value of SettlType (63) is 7 (When and If Issued)
     (expressed in local time at place of settlement)*)
    f_CollateralReport_SettlDate : fix_localmktdate option;
    (** Overall/total quantity (e.g. number of shares)
     (Prior to FIX 4.2 this field was of type int)*)
    f_CollateralReport_Quantity : fix_float option;
    (** Type of quantity specified in a quantity field*)
    f_CollateralReport_QtyType : fix_qtytype option;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.*)
    f_CollateralReport_Currency : fix_currency option;
    (** Number of legs that make up the Security*)
    f_CollateralReport_InstrmtLegGrp : fix_instrmtleggrp;
    (** Number of legs that make up the Security*)
    f_CollateralReport_UndInstrmtGrp : fix_undinstrmtgrp;
    (** Excess margin amount (deficit if value is negative)*)
    f_CollateralReport_MarginExcess : fix_float option;
    (** TotalNetValue is determined as follows:
     At the initial collateral assignment TotalNetValue is the sum of (UnderlyingStartValue * (1-haircut)).
     In a collateral substitution TotalNetValue is the sum of (UnderlyingCurrentValue * (1-haircut)).
     For listed derivatives clearing margin management, this is the collateral value which equals (Market value * haircut)*)
    f_CollateralReport_TotalNetValue : fix_float option;
    (** Starting consideration less repayments*)
    f_CollateralReport_CashOutstanding : fix_float option;
    (** Insert here the set of "TrdRegTimestamps" fields defined in "Common Components of Application Messages"*)
    f_CollateralReport_TrdRegTimestamps : fix_trdregtimestamps;
    (** Side of order*)
    f_CollateralReport_Side : fix_side option;
    (** Required if any miscellaneous fees are reported. Indicates number of repeating entries
     ** Nested Repeating Group follows ***)
    f_CollateralReport_MiscFeesGrp : fix_miscfeesgrp;
    (** Price per unit of quantity (e.g. per share)*)
    f_CollateralReport_Price : fix_float option;
    (** Code to represent the price type*)
    f_CollateralReport_PriceType : fix_pricetype option;
    (** Amount of Accrued Interest for convertible bonds and fixed income*)
    f_CollateralReport_AccruedInterestAmt : fix_float option;
    (** Accrued Interest Amount applicable to a financing transaction on the End Date.*)
    f_CollateralReport_EndAccruedInterestAmt : fix_float option;
    (** Starting dirty cash consideration of a financing deal, i.e. paid to the seller on the Start Date.*)
    f_CollateralReport_StartCash : fix_float option;
    (** Ending dirty cash consideration of a financing deal. i.e. reimbursed to the buyer on the End Date.*)
    f_CollateralReport_EndCash : fix_float option;
    (** Insert here the set of "SpreadOrBenchmarkCurveData" fields defined in "Common Components of Application Messages"*)
    f_CollateralReport_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    (** Insert here the set of "Stipulations" fields defined in "Common Components of Application Messages"*)
    f_CollateralReport_Stipulations : fix_stipulations;
    (** Insert here the set of "SettlInstructionsData" fields defined in "Common Components of Application Messages"*)
    f_CollateralReport_SettlInstructionsData : fix_settlinstructionsdata;
    (** Identifier for Trading Session
     Can be used to represent a specific market trading session (e.g. "PRE-OPEN", "CROSS_2", "AFTER-HOURS", "TOSTNET", "TOSTNET2", etc).
     To specify good for session where session spans more than one calendar day, use TimeInForce = Day in conjunction with TradingSessionID.
     Values should be bi-laterally agreed to between counterparties.
     Firms may register Trading Session values on the FIX website (presently a document maintained within "ECN and Exchanges" working group section).
     Trading Session in which trade occurred*)
    f_CollateralReport_TradingSessionID : fix_string option;
    (** Optional market assigned sub identifier for a trading session. Usage is determined by market or counterparties.
     Used by US based futures markets to identify exchange specific execution time bracket codes as required by US market regulations.
     Trading Session Subid in which trade occurred*)
    f_CollateralReport_TradingSessionSubID : fix_string option;
    (** Identifies a specific settlement session*)
    f_CollateralReport_SettlSessID : fix_settlsessid option;
    (** SubID value associated with SettlSessID (76)*)
    f_CollateralReport_SettlSessSubID : fix_string option;
    (** The "Clearing Business Date" referred to by this maintenance request.*)
    f_CollateralReport_ClearingBusinessDate : fix_localmktdate option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_CollateralReport_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_CollateralReport_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_CollateralReport_EncodedText : fix_string option
}
;;

(** An initiator that requires collateral from a respondent sends a Collateral Request. The initiator can be either counterparty to a trade in a two party model or an intermediary such as an ATS or clearinghouse in a three party model. A Collateral Assignment is expected as a response to a request for collateral.*)
type full_fix_collateralrequest_data = {
    (** Collateral Request Identifier
     Unique identifier for collateral request*)
    f_CollateralRequest_CollReqID : fix_string;
    (** Reason for Collateral Assignment
     Reason collateral assignment is being requested*)
    f_CollateralRequest_CollAsgnReason : fix_collasgnreason;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")*)
    f_CollateralRequest_TransactTime : fix_utctimestamp;
    (** Time/Date of order expiration (always expressed in UTC (Universal Time Coordinated, also known as "GMT")
     The meaning of expiration is specific to the context where the field is used.
     For orders, this is the expiration time of a Good Til Date TimeInForce.
     For Quotes - this is the expiration of the quote.
     Expiration time is provided across the quote message dialog to control the length of time of the overall quoting process.
     For collateral requests, this is the time by which collateral must be assigned.
     For collateral assignments, this is the time by which a response to the assignment is expected.
     Time until when Respondent has to assign collateral*)
    f_CollateralRequest_ExpireTime : fix_utctimestamp option;
    f_CollateralRequest_Parties : fix_parties;
    (** Account mnemonic as agreed between buy and sell sides, e.g. broker and institution or investor/intermediary and fund manager.
     Customer Account*)
    f_CollateralRequest_Account : fix_string option;
    (** Type of account associated with an order
     Type of account associated with the order (Origin)*)
    f_CollateralRequest_AccountType : fix_accounttype option;
    (** Unique identifier for Order as assigned by the buy-side (institution, broker, intermediary etc.) (identified by SenderCompID (49) or OnBehalfOfCompID (5) as appropriate). Uniqueness must be guaranteed within a single trading day. Firms, particularly those which electronically submit multi-day orders, trade globally or throughout market close periods, should ensure uniqueness across days, for example by embedding a date within the ClOrdID field.
     Identifier fo order for which collateral is required*)
    f_CollateralRequest_ClOrdID : fix_string option;
    (** Unique identifier for Order as assigned by sell-side (broker, exchange, ECN). Uniqueness must be guaranteed within a single trading day. Firms which accept multi-day orders should consider embedding a date within the OrderID field to assure uniqueness across days.
     Identifier fo order for which collateral is required*)
    f_CollateralRequest_OrderID : fix_string option;
    (** Assigned by the party which accepts the order. Can be used to provide the OrderID (37) used by an exchange or executing system.
     Identifier fo order for which collateral is required*)
    f_CollateralRequest_SecondaryOrderID : fix_string option;
    (** Assigned by the party which originates the order. Can be used to provide the ClOrdID (11) used by an exchange or executing system.
     Identifier fo order for which collateral is required*)
    f_CollateralRequest_SecondaryClOrdID : fix_string option;
    (** Executions for which collateral is required*)
    f_CollateralRequest_ExecCollGrp : fix_execcollgrp;
    (** Trades for which collateral is required*)
    f_CollateralRequest_TrdCollGrp : fix_trdcollgrp;
    (** Instrument that was traded for which collateral is required*)
    f_CollateralRequest_Instrument : fix_instrument;
    (** Details of the Agreement and Deal*)
    f_CollateralRequest_FinancingDetails : fix_financingdetails;
    (** Specific date of trade settlement (SettlementDate) in YYYYMMDD format.
     If present, this field overrides SettlType (63). This field is required if the value of SettlType (63) is 6 (Future) or 8 (Sellers Option). This field must be omitted if the value of SettlType (63) is 7 (When and If Issued)
     (expressed in local time at place of settlement)*)
    f_CollateralRequest_SettlDate : fix_localmktdate option;
    (** Overall/total quantity (e.g. number of shares)
     (Prior to FIX 4.2 this field was of type int)*)
    f_CollateralRequest_Quantity : fix_float option;
    (** Type of quantity specified in a quantity field*)
    f_CollateralRequest_QtyType : fix_qtytype option;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.*)
    f_CollateralRequest_Currency : fix_currency option;
    (** Number of legs that make up the Security*)
    f_CollateralRequest_InstrmtLegGrp : fix_instrmtleggrp;
    (** Number of legs that make up the Security*)
    f_CollateralRequest_UndInstrmtCollGrp : fix_undinstrmtcollgrp;
    (** Excess margin amount (deficit if value is negative)*)
    f_CollateralRequest_MarginExcess : fix_float option;
    (** TotalNetValue is determined as follows:
     At the initial collateral assignment TotalNetValue is the sum of (UnderlyingStartValue * (1-haircut)).
     In a collateral substitution TotalNetValue is the sum of (UnderlyingCurrentValue * (1-haircut)).
     For listed derivatives clearing margin management, this is the collateral value which equals (Market value * haircut)*)
    f_CollateralRequest_TotalNetValue : fix_float option;
    (** Starting consideration less repayments*)
    f_CollateralRequest_CashOutstanding : fix_float option;
    (** Insert here the set of "TrdRegTimestamps" fields defined in "Common Components of Application Messages"*)
    f_CollateralRequest_TrdRegTimestamps : fix_trdregtimestamps;
    (** Side of order*)
    f_CollateralRequest_Side : fix_side option;
    (** Required if any miscellaneous fees are reported. Indicates number of repeating entries
     ** Nested Repeating Group follows ***)
    f_CollateralRequest_MiscFeesGrp : fix_miscfeesgrp;
    (** Price per unit of quantity (e.g. per share)*)
    f_CollateralRequest_Price : fix_float option;
    (** Code to represent the price type*)
    f_CollateralRequest_PriceType : fix_pricetype option;
    (** Amount of Accrued Interest for convertible bonds and fixed income*)
    f_CollateralRequest_AccruedInterestAmt : fix_float option;
    (** Accrued Interest Amount applicable to a financing transaction on the End Date.*)
    f_CollateralRequest_EndAccruedInterestAmt : fix_float option;
    (** Starting dirty cash consideration of a financing deal, i.e. paid to the seller on the Start Date.*)
    f_CollateralRequest_StartCash : fix_float option;
    (** Ending dirty cash consideration of a financing deal. i.e. reimbursed to the buyer on the End Date.*)
    f_CollateralRequest_EndCash : fix_float option;
    (** Insert here the set of "SpreadOrBenchmarkCurveData" fields defined in "Common Components of Application Messages"*)
    f_CollateralRequest_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    (** Insert here the set of "Stipulations" fields defined in "Common Components of Application Messages"*)
    f_CollateralRequest_Stipulations : fix_stipulations;
    (** Identifier for Trading Session
     Can be used to represent a specific market trading session (e.g. "PRE-OPEN", "CROSS_2", "AFTER-HOURS", "TOSTNET", "TOSTNET2", etc).
     To specify good for session where session spans more than one calendar day, use TimeInForce = Day in conjunction with TradingSessionID.
     Values should be bi-laterally agreed to between counterparties.
     Firms may register Trading Session values on the FIX website (presently a document maintained within "ECN and Exchanges" working group section).
     Trading Session in which trade occurred*)
    f_CollateralRequest_TradingSessionID : fix_string option;
    (** Optional market assigned sub identifier for a trading session. Usage is determined by market or counterparties.
     Used by US based futures markets to identify exchange specific execution time bracket codes as required by US market regulations.
     Trading Session Subid in which trade occurred*)
    f_CollateralRequest_TradingSessionSubID : fix_string option;
    (** Identifies a specific settlement session*)
    f_CollateralRequest_SettlSessID : fix_settlsessid option;
    (** SubID value associated with SettlSessID (76)*)
    f_CollateralRequest_SettlSessSubID : fix_string option;
    (** The "Clearing Business Date" referred to by this maintenance request.*)
    f_CollateralRequest_ClearingBusinessDate : fix_localmktdate option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_CollateralRequest_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_CollateralRequest_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_CollateralRequest_EncodedText : fix_string option
}
;;

(** Used to respond to a Collateral Assignment message*)
type full_fix_collateralresponse_data = {
    (** Collateral Response Identifier
     Unique identifer for the collateral response*)
    f_CollateralResponse_CollRespID : fix_string;
    (** Collateral Assignment Identifier
     Collateral assignment to which this response refers*)
    f_CollateralResponse_CollAsgnID : fix_string;
    (** Collateral Request Identifier
     Identifer of CollReqID to which the Collateral Assignment is in response*)
    f_CollateralResponse_CollReqID : fix_string option;
    (** Reason for Collateral Assignment
     Reason collateral assignment is being requested*)
    f_CollateralResponse_CollAsgnReason : fix_collasgnreason;
    (** Collateral Assignment Transaction Type
     Collateral Transaction Type - not recommended because it causes confusion*)
    f_CollateralResponse_CollAsgnTransType : fix_collasgntranstype option;
    (** Collateral Assignment Response Type
     Collateral Assignment Response Type*)
    f_CollateralResponse_CollAsgnRespType : fix_collasgnresptype;
    (** Collateral Assignment Reject Reason
     Reason Colllateral Assignment was rejected*)
    f_CollateralResponse_CollAsgnRejectReason : fix_collasgnrejectreason option;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")*)
    f_CollateralResponse_TransactTime : fix_utctimestamp;
    f_CollateralResponse_Parties : fix_parties;
    (** Account mnemonic as agreed between buy and sell sides, e.g. broker and institution or investor/intermediary and fund manager.
     Customer Account*)
    f_CollateralResponse_Account : fix_string option;
    (** Type of account associated with an order
     Type of account associated with the order (Origin)*)
    f_CollateralResponse_AccountType : fix_accounttype option;
    (** Unique identifier for Order as assigned by the buy-side (institution, broker, intermediary etc.) (identified by SenderCompID (49) or OnBehalfOfCompID (5) as appropriate). Uniqueness must be guaranteed within a single trading day. Firms, particularly those which electronically submit multi-day orders, trade globally or throughout market close periods, should ensure uniqueness across days, for example by embedding a date within the ClOrdID field.
     Identifier fo order for which collateral is required*)
    f_CollateralResponse_ClOrdID : fix_string option;
    (** Unique identifier for Order as assigned by sell-side (broker, exchange, ECN). Uniqueness must be guaranteed within a single trading day. Firms which accept multi-day orders should consider embedding a date within the OrderID field to assure uniqueness across days.
     Identifier fo order for which collateral is required*)
    f_CollateralResponse_OrderID : fix_string option;
    (** Assigned by the party which accepts the order. Can be used to provide the OrderID (37) used by an exchange or executing system.
     Identifier fo order for which collateral is required*)
    f_CollateralResponse_SecondaryOrderID : fix_string option;
    (** Assigned by the party which originates the order. Can be used to provide the ClOrdID (11) used by an exchange or executing system.
     Identifier fo order for which collateral is required*)
    f_CollateralResponse_SecondaryClOrdID : fix_string option;
    (** Executions for which collateral is required*)
    f_CollateralResponse_ExecCollGrp : fix_execcollgrp;
    (** Trades for which collateral is required*)
    f_CollateralResponse_TrdCollGrp : fix_trdcollgrp;
    (** Insert here the set of "Instrument" fields defined in "Common Components of Application Messages"*)
    f_CollateralResponse_Instrument : fix_instrument;
    (** Insert here the set of "FinancingDetails" fields defined in "Common Components of Application Messages"*)
    f_CollateralResponse_FinancingDetails : fix_financingdetails;
    (** Specific date of trade settlement (SettlementDate) in YYYYMMDD format.
     If present, this field overrides SettlType (63). This field is required if the value of SettlType (63) is 6 (Future) or 8 (Sellers Option). This field must be omitted if the value of SettlType (63) is 7 (When and If Issued)
     (expressed in local time at place of settlement)*)
    f_CollateralResponse_SettlDate : fix_localmktdate option;
    (** Overall/total quantity (e.g. number of shares)
     (Prior to FIX 4.2 this field was of type int)*)
    f_CollateralResponse_Quantity : fix_float option;
    (** Type of quantity specified in a quantity field*)
    f_CollateralResponse_QtyType : fix_qtytype option;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.*)
    f_CollateralResponse_Currency : fix_currency option;
    (** Number of legs that make up the Security*)
    f_CollateralResponse_InstrmtLegGrp : fix_instrmtleggrp;
    (** Number of legs that make up the Security*)
    f_CollateralResponse_UndInstrmtCollGrp : fix_undinstrmtcollgrp;
    (** Excess margin amount (deficit if value is negative)*)
    f_CollateralResponse_MarginExcess : fix_float option;
    (** TotalNetValue is determined as follows:
     At the initial collateral assignment TotalNetValue is the sum of (UnderlyingStartValue * (1-haircut)).
     In a collateral substitution TotalNetValue is the sum of (UnderlyingCurrentValue * (1-haircut)).
     For listed derivatives clearing margin management, this is the collateral value which equals (Market value * haircut)*)
    f_CollateralResponse_TotalNetValue : fix_float option;
    (** Starting consideration less repayments*)
    f_CollateralResponse_CashOutstanding : fix_float option;
    (** Insert here the set of "TrdRegTimestamps" fields defined in "Common Components of Application Messages"*)
    f_CollateralResponse_TrdRegTimestamps : fix_trdregtimestamps;
    (** Side of order*)
    f_CollateralResponse_Side : fix_side option;
    (** Required if any miscellaneous fees are reported. Indicates number of repeating entries
     ** Nested Repeating Group follows ***)
    f_CollateralResponse_MiscFeesGrp : fix_miscfeesgrp;
    (** Price per unit of quantity (e.g. per share)*)
    f_CollateralResponse_Price : fix_float option;
    (** Code to represent the price type*)
    f_CollateralResponse_PriceType : fix_pricetype option;
    (** Amount of Accrued Interest for convertible bonds and fixed income*)
    f_CollateralResponse_AccruedInterestAmt : fix_float option;
    (** Accrued Interest Amount applicable to a financing transaction on the End Date.*)
    f_CollateralResponse_EndAccruedInterestAmt : fix_float option;
    (** Starting dirty cash consideration of a financing deal, i.e. paid to the seller on the Start Date.*)
    f_CollateralResponse_StartCash : fix_float option;
    (** Ending dirty cash consideration of a financing deal. i.e. reimbursed to the buyer on the End Date.*)
    f_CollateralResponse_EndCash : fix_float option;
    (** Insert here the set of "SpreadOrBenchmarkCurveData" fields defined in "Common Components of Application Messages"*)
    f_CollateralResponse_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    (** Insert here the set of "Stipulations" fields defined in "Common Components of Application Messages"*)
    f_CollateralResponse_Stipulations : fix_stipulations;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_CollateralResponse_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_CollateralResponse_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_CollateralResponse_EncodedText : fix_string option
}
;;

(** The Confirmation messages are used to provide individual trade level confirmations from the sell side to the buy side. In versions of FIX prior to version 4.4, this role was performed by the allocation message. Unlike the allocation message, the confirmation message operates at an allocation account (trade) level rather than block level, allowing for the affirmation or rejection of individual confirmations.
 This message is also used to report back, confirm or exception, the booking status of each allocation instance. When the buy-side, in response, "affirms" with the ConfirmationAck message, the trade is ready to settle.*)
type full_fix_confirmation_data = {
    (** Message reference for Confirmation
     Unique ID for this message*)
    f_Confirmation_ConfirmID : fix_string;
    (** Reference identifier to be used with ConfirmTransType (666) = Replace or Cancel
     Mandatory if ConfirmTransType is Replace or Cancel*)
    f_Confirmation_ConfirmRefID : fix_string option;
    (** Unique identifier for a Confirmation Request message
     Only used when this message is used to respond to a confirmation request (to which this ID refers)*)
    f_Confirmation_ConfirmReqID : fix_string option;
    (** Identifies the Confirmation transaction type
     New, Cancel or Replace*)
    f_Confirmation_ConfirmTransType : fix_confirmtranstype;
    (** Identifies the type of Confirmation message being sent
     Denotes whether this message represents a confirmation or a trade status message*)
    f_Confirmation_ConfirmType : fix_confirmtype;
    (** Indicates whether or not this message is a drop copy of another message.
     Denotes whether or not this message represents copy confirmation (or status message)
     Absence of this field indicates message is not a drop copy.*)
    f_Confirmation_CopyMsgIndicator : bool option;
    (** Indicates that this message is to serve as the final and legal confirmation.
     Denotes whether this message represents the legally binding confirmation
     Absence of this field indicates message is not a legal confirm.*)
    f_Confirmation_LegalConfirm : fix_legalconfirm option;
    (** Identifies the status of the Confirmation.*)
    f_Confirmation_ConfirmStatus : fix_confirmstatus;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"
     Required for fixed income
     Also to be used in associated with ProcessCode for broker of credit (e.g. for directed brokerage trades)
     Also to be used to specify party-specific regulatory details (e.g. full legal name of contracting legal entity, registered address, regulatory status, any registration details)*)
    f_Confirmation_Parties : fix_parties;
    (** Indicates number of orders to be combined for allocation. If order(s) were manually delivered set to 1 (one).Required when AllocNoOrdersType = 1*)
    f_Confirmation_OrdAllocGrp : fix_ordallocgrp;
    (** Unique identifier for allocation message.
     (Prior to FIX 4.1 this field was of type int)
     Used to refer to an earlier Allocation Instruction.*)
    f_Confirmation_AllocID : fix_string option;
    (** Secondary allocation identifier. Unlike the AllocID (70), this can be shared across a number of allocation instruction or allocation report messages, thereby making it possible to pass an identifier for an original allocation message on multiple messages (e.g. from one party to a second to a third, across cancel and replace messages etc.).
     Used to refer to an earlier Allocation Instruction via its secondary identifier*)
    f_Confirmation_SecondaryAllocID : fix_string option;
    (** Unique identifier for a specific NoAllocs (78) repeating group instance (e.g. for an AllocAccount).
     Used to refer to an allocation account within an earlier Allocation Instruction.*)
    f_Confirmation_IndividualAllocID : fix_string option;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")
     Represents the time this message was generated*)
    f_Confirmation_TransactTime : fix_utctimestamp;
    (** Indicates date of trade referenced in this message in YYYYMMDD format. Absence of this field indicates current day (expressed in local time at place of trade).*)
    f_Confirmation_TradeDate : fix_localmktdate;
    (** Time of last execution being confirmed by this message*)
    f_Confirmation_TrdRegTimestamps : fix_trdregtimestamps;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_Confirmation_Instrument : fix_instrument;
    (** Insert here the set of "InstrumentExtension" fields defined in "Common Components of Application Messages"*)
    f_Confirmation_InstrumentExtension : fix_instrumentextension;
    (** Insert here the set of "FinancingDetails" fields defined in "Common Components of Application Messages"*)
    f_Confirmation_FinancingDetails : fix_financingdetails;
    (** Indicates number of repeating entries.
     ** Nested Repeating Group follows ***)
    f_Confirmation_UndInstrmtGrp : fix_undinstrmtgrp;
    (** Indicates number of repeating entries.
     ** Nested Repeating Group follows ***)
    f_Confirmation_InstrmtLegGrp : fix_instrmtleggrp;
    (** If traded on Yield, price must be calculated "to worst" and the <Yield> component block must specify how calculated, redemption date and price (if not par). If traded on Price, the <Yield> component block must specify how calculated - "Worst", and include redemptiondate and price (if not par).*)
    f_Confirmation_YieldData : fix_yielddata;
    (** Quantity to be allocated to specific sub-account
     (Prior to FIX 4.2 this field was of type int)
     The quantity being confirmed by this message (this is at a trade level, not block or order level)*)
    f_Confirmation_AllocQty : fix_float;
    (** Type of quantity specified in a quantity field*)
    f_Confirmation_QtyType : fix_qtytype option;
    (** Side of order*)
    f_Confirmation_Side : fix_side;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.*)
    f_Confirmation_Currency : fix_currency option;
    (** Market of execution for last fill, or an indication of the market where an order was routed
     Valid values:
     See "Appendix 6-C"*)
    f_Confirmation_LastMkt : fix_exchange option;
    (** Indicates number of repeating entries.
     ** Nested Repeating Group follows ***)
    f_Confirmation_CpctyConfGrp : fix_cpctyconfgrp;
    (** Sub-account mnemonic
     Account number for the trade being confirmed by this message*)
    f_Confirmation_AllocAccount : fix_string;
    (** Used to identify the source of the AllocAccount (79) code.
     See AcctIDSource (660) for valid values.*)
    f_Confirmation_AllocAcctIDSource : int option;
    (** Type of account associated with a confirmation or other trade-level message*)
    f_Confirmation_AllocAccountType : fix_allocaccounttype option;
    (** Calculated average price of all fills on this order.
     For Fixed Income trades AvgPx is always expressed as percent-of-par, regardless of the PriceType (423) of LastPx (3). I.e., AvgPx will contain an average of percent-of-par values (see LastParPx (669)) for issues traded in Yield, Spread or Discount.
     Gross price for the trade being confirmed
     Always expressed in percent-of-par for Fixed Income*)
    f_Confirmation_AvgPx : fix_float;
    (** Indicates number of decimal places to be used for average pricing. Absence of this field indicates that default precision arranged by the broker/institution is to be used.
     Absence of this field indicates that default precision arranged by the broker/institution is to be used*)
    f_Confirmation_AvgPxPrecision : int option;
    (** Code to represent the price type
     Price type for the AvgPx field*)
    f_Confirmation_PriceType : fix_pricetype option;
    (** Used to express average price as percent of par (used where AvgPx field is expressed in some other way)*)
    f_Confirmation_AvgParPx : fix_float option;
    (** Insert here the set of "SpreadOrBenchmarkCurveData" fields defined in "Common Components of Application Messages"*)
    f_Confirmation_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    (** Reported price (used to differentiate from AvgPx on a confirmation of a marked-up or marked-down principal trade)
     Reported price (may be different to AvgPx in the event of a marked-up or marked-down principal trade)*)
    f_Confirmation_ReportedPx : fix_float option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_Confirmation_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.*)
    f_Confirmation_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.*)
    f_Confirmation_EncodedText : fix_string option;
    (** Processing code for sub-account. Absence of this field in AllocAccount (79) / AllocPrice (366) /AllocQty (80) / ProcessCode instance indicates regular trade.
     Used to identify whether the trade was a soft dollar trade, step in/out etc. Broker of credit, where relevant, can be specified using the Parties nested block above.*)
    f_Confirmation_ProcessCode : fix_processcode option;
    (** Total amount traded (e.g. CumQty (4) * AvgPx (6)) expressed in units of currency.*)
    f_Confirmation_GrossTradeAmt : fix_float;
    (** Number of Days of Interest for convertible bonds and fixed income. Note value may be negative.*)
    f_Confirmation_NumDaysInterest : int option;
    (** The date when a distribution of interest is deducted from a securities assets or set aside for payment to bondholders. On the ex-date, the securities price drops by the amount of the distribution (plus or minus any market activity).
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)
     (prior to FIX 4.4 field was of type UTCDate)
     Optional "next coupon date" for Fixed Income*)
    f_Confirmation_ExDate : fix_localmktdate option;
    (** The amount the buyer compensates the seller for the portion of the next coupon interest payment the seller has earned but will not receive from the issuer because the issuer will send the next coupon payment to the buyer. Accrued Interest Rate is the annualized Accrued Interest amount divided by the purchase price of the bond.*)
    f_Confirmation_AccruedInterestRate : fix_float option;
    (** Amount of Accrued Interest for convertible bonds and fixed income
     Required for Fixed Income products that trade with accrued interest*)
    f_Confirmation_AccruedInterestAmt : fix_float option;
    (** Amount of interest (i.e. lump-sum) at maturity.
     Required for Fixed Income products that pay lump sum interest at maturity*)
    f_Confirmation_InterestAtMaturity : fix_float option;
    (** Accrued Interest Amount applicable to a financing transaction on the End Date.
     For repurchase agreements the accrued interest on termination.*)
    f_Confirmation_EndAccruedInterestAmt : fix_float option;
    (** Starting dirty cash consideration of a financing deal, i.e. paid to the seller on the Start Date.
     For repurchase agreements the start (dirty) cash consideration*)
    f_Confirmation_StartCash : fix_float option;
    (** Ending dirty cash consideration of a financing deal. i.e. reimbursed to the buyer on the End Date.
     For repurchase agreements the end (dirty) cash consideration*)
    f_Confirmation_EndCash : fix_float option;
    (** Provides the reduction in price for the secondary market in Muncipals.
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)*)
    f_Confirmation_Concession : fix_float option;
    (** The price at which the securities are distributed to the different members of an underwriting group for the primary market in Municipals, total gross underwriter's spread.
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)*)
    f_Confirmation_TotalTakedown : fix_float option;
    (** Total amount due as the result of the transaction (e.g. for Buy order - principal + commission + fees) reported in currency of execution.*)
    f_Confirmation_NetMoney : fix_float;
    (** Net Money at maturity if Zero Coupon and maturity value is different from par value
     Net Money at maturity if Zero Coupon and maturity value is different from par value*)
    f_Confirmation_MaturityNetMoney : fix_float option;
    (** Total amount due expressed in settlement currency (includes the effect of the forex transaction)*)
    f_Confirmation_SettlCurrAmt : fix_float option;
    (** Currency code of settlement denomination.*)
    f_Confirmation_SettlCurrency : fix_currency option;
    (** Foreign exchange rate used to compute SettlCurrAmt (9) from Currency (5) to SettlCurrency (20)*)
    f_Confirmation_SettlCurrFxRate : fix_float option;
    (** Specifies whether or not SettlCurrFxRate (55) should be multiplied or divided*)
    f_Confirmation_SettlCurrFxRateCalc : fix_settlcurrfxratecalc option;
    (** Indicates order settlement period. If present, SettlDate (64) overrides this field. If both SettlType (63) and SettDate (64) are omitted, the default for SettlType (63) is 0 (Regular)
     Regular is defined as the default settlement period for the particular security on the exchange of execution.
     In Fixed Income the contents of this field may influence the instrument definition if the SecurityID (48) is ambiguous. In the US an active Treasury offering may be re-opened, and for a time one CUSIP will apply to both the current and "when-issued" securities. Supplying a value of "7" clarifies the instrument description; any other value or the absence of this field should cause the respondent to default to the active issue.*)
    f_Confirmation_SettlType : fix_settltype option;
    (** Specific date of trade settlement (SettlementDate) in YYYYMMDD format.
     If present, this field overrides SettlType (63). This field is required if the value of SettlType (63) is 6 (Future) or 8 (Sellers Option). This field must be omitted if the value of SettlType (63) is 7 (When and If Issued)
     (expressed in local time at place of settlement)*)
    f_Confirmation_SettlDate : fix_localmktdate option;
    (** Insert here the set of "SettlInstructionsData" fields defined in "Common Components of Application Messages"
     Used to communicate settlement instructions for this Confirmation.*)
    f_Confirmation_SettlInstructionsData : fix_settlinstructionsdata;
    f_Confirmation_CommissionData : fix_commissiondata;
    (** Commission to be shared with a third party, e.g. as part of a directed brokerage commission sharing arrangement.
     Used to identify any commission shared with a third party (e.g. directed brokerage)*)
    f_Confirmation_SharedCommission : fix_float option;
    f_Confirmation_Stipulations : fix_stipulations;
    (** Required if any miscellaneous fees are reported. Indicates number of repeating entries. Repeating group.
     ** Nested Repeating Group follows ***)
    f_Confirmation_MiscFeesGrp : fix_miscfeesgrp
}
;;

(** The Confirmation Ack (aka Affirmation) message is used to respond to a Confirmation message.*)
type full_fix_confirmationack_data = {
    (** Message reference for Confirmation*)
    f_ConfirmationAck_ConfirmID : fix_string;
    (** Indicates date of trade referenced in this message in YYYYMMDD format. Absence of this field indicates current day (expressed in local time at place of trade).*)
    f_ConfirmationAck_TradeDate : fix_localmktdate;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")
     Date/Time Allocation Instruction Ack generated*)
    f_ConfirmationAck_TransactTime : fix_utctimestamp;
    (** Identifies the status of the ConfirmationAck*)
    f_ConfirmationAck_AffirmStatus : fix_affirmstatus;
    (** Identifies the reason for rejecting a Confirmation
     Required for ConfirmStatus = 1 (rejected)*)
    f_ConfirmationAck_ConfirmRejReason : fix_confirmrejreason option;
    (** The status of this trade with respect to matching or comparison
     Denotes whether the financial details provided on the Confirmation were successfully matched.*)
    f_ConfirmationAck_MatchStatus : fix_matchstatus option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)
     Can include explanation for AllocRejCode = 7 (other)*)
    f_ConfirmationAck_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_ConfirmationAck_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_ConfirmationAck_EncodedText : fix_string option
}
;;

(** The Confirmation Request message is used to request a Confirmation message.*)
type full_fix_confirmationrequest_data = {
    (** Unique identifier for a Confirmation Request message
     Unique identifier for this message*)
    f_ConfirmationRequest_ConfirmReqID : fix_string;
    (** Identifies the type of Confirmation message being sent
     Denotes whether this message is being used to request a confirmation or a trade status message*)
    f_ConfirmationRequest_ConfirmType : fix_confirmtype;
    (** Indicates number of orders to be combined for allocation. If order(s) were manually delivered set to 1 (one).Required when AllocNoOrdersType = 1*)
    f_ConfirmationRequest_OrdAllocGrp : fix_ordallocgrp;
    (** Unique identifier for allocation message.
     (Prior to FIX 4.1 this field was of type int)
     Used to refer to an earlier Allocation Instruction.*)
    f_ConfirmationRequest_AllocID : fix_string option;
    (** Secondary allocation identifier. Unlike the AllocID (70), this can be shared across a number of allocation instruction or allocation report messages, thereby making it possible to pass an identifier for an original allocation message on multiple messages (e.g. from one party to a second to a third, across cancel and replace messages etc.).
     Used to refer to an earlier Allocation Instruction via its secondary identifier*)
    f_ConfirmationRequest_SecondaryAllocID : fix_string option;
    (** Unique identifier for a specific NoAllocs (78) repeating group instance (e.g. for an AllocAccount).
     Used to refer to an allocation account within an earlier Allocation Instruction.*)
    f_ConfirmationRequest_IndividualAllocID : fix_string option;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")
     Represents the time this message was generated*)
    f_ConfirmationRequest_TransactTime : fix_utctimestamp;
    (** Sub-account mnemonic
     Account number for the trade being confirmed by this message*)
    f_ConfirmationRequest_AllocAccount : fix_string option;
    (** Used to identify the source of the AllocAccount (79) code.
     See AcctIDSource (660) for valid values.*)
    f_ConfirmationRequest_AllocAcctIDSource : int option;
    (** Type of account associated with a confirmation or other trade-level message*)
    f_ConfirmationRequest_AllocAccountType : fix_allocaccounttype option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_ConfirmationRequest_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.*)
    f_ConfirmationRequest_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.*)
    f_ConfirmationRequest_EncodedText : fix_string option
}
;;

(** Used to modify a cross order previously submitted using the New Order - Cross message. See Order Cancel Replace Request for details concerning message usage.*)
type full_fix_crossordercancelreplacerequest_data = {
    (** Unique identifier for Order as assigned by sell-side (broker, exchange, ECN). Uniqueness must be guaranteed within a single trading day. Firms which accept multi-day orders should consider embedding a date within the OrderID field to assure uniqueness across days.
     Unique identifier of most recent order as assigned by sell-side (broker, exchange, ECN).*)
    f_CrossOrderCancelReplaceRequest_OrderID : fix_string option;
    (** Identifier for a cross order. Must be unique during a given trading day. Recommend that firms use the order date as part of the CrossID for Good Till Cancel (GT) orders.
     CrossID for the replacement order*)
    f_CrossOrderCancelReplaceRequest_CrossID : fix_string;
    (** CrossID of the previous cross order (NOT the initial cross order of the day) as assigned by the institution, used to identify the previous cross order in Cross Cancel and Cross Cancel/Replace Requests.
     Must match the CrossID of the previous cross order. Same order chaining mechanism as ClOrdID/OrigClOrdID with single order Cancel/Replace.*)
    f_CrossOrderCancelReplaceRequest_OrigCrossID : fix_string;
    (** Type of cross being submitted to a market*)
    f_CrossOrderCancelReplaceRequest_CrossType : fix_crosstype;
    (** Indicates if one side or the other of a cross order should be prioritized.
     The definition of prioritization is left to the market. In some markets prioritization means which side of the cross order is applied to the market first. In other markets – prioritization may mean that the prioritized side is fully executed (sometimes referred to as the side being protected).*)
    f_CrossOrderCancelReplaceRequest_CrossPrioritization : fix_crossprioritization;
    (** Must be 1 or 2*)
    f_CrossOrderCancelReplaceRequest_SideCrossOrdModGrp : fix_sidecrossordmodgrp;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_CrossOrderCancelReplaceRequest_Instrument : fix_instrument;
    (** Number of underlyings*)
    f_CrossOrderCancelReplaceRequest_UndInstrmtGrp : fix_undinstrmtgrp;
    (** Number of Legs*)
    f_CrossOrderCancelReplaceRequest_InstrmtLegGrp : fix_instrmtleggrp;
    (** Indicates order settlement period. If present, SettlDate (64) overrides this field. If both SettlType (63) and SettDate (64) are omitted, the default for SettlType (63) is 0 (Regular)
     Regular is defined as the default settlement period for the particular security on the exchange of execution.
     In Fixed Income the contents of this field may influence the instrument definition if the SecurityID (48) is ambiguous. In the US an active Treasury offering may be re-opened, and for a time one CUSIP will apply to both the current and "when-issued" securities. Supplying a value of "7" clarifies the instrument description; any other value or the absence of this field should cause the respondent to default to the active issue.*)
    f_CrossOrderCancelReplaceRequest_SettlType : fix_settltype option;
    (** Specific date of trade settlement (SettlementDate) in YYYYMMDD format.
     If present, this field overrides SettlType (63). This field is required if the value of SettlType (63) is 6 (Future) or 8 (Sellers Option). This field must be omitted if the value of SettlType (63) is 7 (When and If Issued)
     (expressed in local time at place of settlement)
     Takes precedence over SettlType value and conditionally required/omitted for specific SettlType values.*)
    f_CrossOrderCancelReplaceRequest_SettlDate : fix_localmktdate option;
    (** Instructions for order handling on Broker trading floor*)
    f_CrossOrderCancelReplaceRequest_HandlInst : fix_handlinst option;
    (** Instructions for order handling on exchange trading floor. If more than one instruction is applicable to an order, this field can contain multiple instructions separated by space.
     Can contain multiple instructions, space delimited. If OrdType=P, exactly one of the following values (ExecInst = L, R, M, P, O, T, or W) must be specified.*)
    f_CrossOrderCancelReplaceRequest_ExecInst : fix_execinst option;
    (** Minimum quantity of an order to be executed.
     (Prior to FIX 4.2 this field was of type int)*)
    f_CrossOrderCancelReplaceRequest_MinQty : fix_float option;
    (** Maximum quantity (e.g. number of shares) within an order to be shown on the exchange floor at any given time.
     (Prior to FIX 4.2 this field was of type int)*)
    f_CrossOrderCancelReplaceRequest_MaxFloor : fix_float option;
    (** Execution destination as defined by institution when order is entered.
     Valid values:
     See "Appendix 6-C"*)
    f_CrossOrderCancelReplaceRequest_ExDestination : fix_exchange option;
    (** Specifies the number of repeating TradingSessionIDs*)
    f_CrossOrderCancelReplaceRequest_TrdgSesGrp : fix_trdgsesgrp;
    (** Processing code for sub-account. Absence of this field in AllocAccount (79) / AllocPrice (366) /AllocQty (80) / ProcessCode instance indicates regular trade.
     Used to identify soft trades at order entry.*)
    f_CrossOrderCancelReplaceRequest_ProcessCode : fix_processcode option;
    (** Previous closing price of security.
     Useful for verifying security identification*)
    f_CrossOrderCancelReplaceRequest_PrevClosePx : fix_float option;
    (** Indicates whether the broker is to locate the stock in conjunction with a short sell order.
     Required for short sell orders*)
    f_CrossOrderCancelReplaceRequest_LocateReqd : fix_locatereqd option;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")
     Time this order request was initiated/released by the trader, trading system, or intermediary.*)
    f_CrossOrderCancelReplaceRequest_TransactTime : fix_utctimestamp;
    (** Insert here the set of "Stipulations" (repeating group of Fixed Income stipulations) fields defined in "Common Components of Application Messages"*)
    f_CrossOrderCancelReplaceRequest_Stipulations : fix_stipulations;
    (** Order type
     *** SOME VALUES ARE NO LONGER USED - See "Deprecated (Phased-out) Features and Supported Approach" ***
     (see Volume : "Glossary" for value definitions)*)
    f_CrossOrderCancelReplaceRequest_OrdType : fix_ordtype;
    (** Code to represent the price type*)
    f_CrossOrderCancelReplaceRequest_PriceType : fix_pricetype option;
    (** Price per unit of quantity (e.g. per share)
     Required for limit OrdTypes. For F/X orders, should be the "all-in" rate (spot rate adjusted for forward points). Can be used to specify a limit price for a pegged order, previously indicated, etc.*)
    f_CrossOrderCancelReplaceRequest_Price : fix_float option;
    (** Price per unit of quantity (e.g. per share)
     Required for OrdType = "Stop" or OrdType = "Stop limit".*)
    f_CrossOrderCancelReplaceRequest_StopPx : fix_float option;
    (** Insert here the set of "SpreadOrBenchmarkCurveData" (Fixed Income spread or benchmark curve) fields defined in "Common Components of Application Messages"*)
    f_CrossOrderCancelReplaceRequest_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    (** Insert here the set of "YieldData" (yield-related) fields defined in "Common Components of Application Messages"*)
    f_CrossOrderCancelReplaceRequest_YieldData : fix_yielddata;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.*)
    f_CrossOrderCancelReplaceRequest_Currency : fix_currency option;
    (** ID used to represent this transaction for compliance purposes (e.g. OATS reporting).*)
    f_CrossOrderCancelReplaceRequest_ComplianceID : fix_string option;
    (** Unique identifier of IOI message.
     (Prior to FIX 4.1 this field was of type int)
     Required for Previously Indicated Orders (OrdType=E)*)
    f_CrossOrderCancelReplaceRequest_IOIID : fix_string option;
    (** Unique identifier for quote
     Required for Previously Quoted Orders (OrdType=D)*)
    f_CrossOrderCancelReplaceRequest_QuoteID : fix_string option;
    (** Specifies how long the order remains in effect. Absence of this field is interpreted as DAY.
     Absence of this field indicates Day order*)
    f_CrossOrderCancelReplaceRequest_TimeInForce : fix_timeinforce option;
    (** Time the details within the message should take effect (always expressed in UTC (Universal Time Coordinated, also known as "GMT")
     Can specify the time at which the order should be considered valid*)
    f_CrossOrderCancelReplaceRequest_EffectiveTime : fix_utctimestamp option;
    (** Date of order expiration (last day the order can trade), always expressed in terms of the local market date. The time at which the order expires is determined by the local market’s business practices
     Conditionally required if TimeInForce = GTD and ExpireTime is not specified.*)
    f_CrossOrderCancelReplaceRequest_ExpireDate : fix_localmktdate option;
    (** Time/Date of order expiration (always expressed in UTC (Universal Time Coordinated, also known as "GMT")
     The meaning of expiration is specific to the context where the field is used.
     For orders, this is the expiration time of a Good Til Date TimeInForce.
     For Quotes - this is the expiration of the quote.
     Expiration time is provided across the quote message dialog to control the length of time of the overall quoting process.
     For collateral requests, this is the time by which collateral must be assigned.
     For collateral assignments, this is the time by which a response to the assignment is expected.
     Conditionally required if TimeInForce = GTD and ExpireDate is not specified.*)
    f_CrossOrderCancelReplaceRequest_ExpireTime : fix_utctimestamp option;
    (** Code to identify whether to book out executions on a part-filled GT order on the day of execution or to accumulate
     States whether executions are booked out or accumulated on a partially filled GT order*)
    f_CrossOrderCancelReplaceRequest_GTBookingInst : fix_gtbookinginst option;
    (** Maximum quantity (e.g. number of shares) within an order to be shown to other customers (i.e. sent via an IOI).
     (Prior to FIX 4.2 this field was of type int)*)
    f_CrossOrderCancelReplaceRequest_MaxShow : fix_float option;
    (** Insert here the set of "PegInstruction" fields defined in "Common Components of Application Messages"*)
    f_CrossOrderCancelReplaceRequest_PegInstructions : fix_peginstructions;
    (** Insert here the set of "DiscretionInstruction" fields defined in "Common Components of Application Messages"*)
    f_CrossOrderCancelReplaceRequest_DiscretionInstructions : fix_discretioninstructions;
    (** The target strategy of the order
     1000+ = Reserved and available for bi-laterally agreed upon user defined values
     The target strategy of the order*)
    f_CrossOrderCancelReplaceRequest_TargetStrategy : fix_targetstrategy option;
    (** Field to allow further specification of the TargetStrategy – usage to be agreed between counterparties
     For further specification of the TargetStrategy*)
    f_CrossOrderCancelReplaceRequest_TargetStrategyParameters : fix_string option;
    (** For a TargetStrategy=Participate order specifies the target particpation rate. For other order types this is a volume limit (i.e. do not be more than this percent of the market volume)
     Mandatory for a TargetStrategy=Participate order and specifies the target particpation rate.
     For other order types optionally specifies a volume limit (i.e. do not be more than this percent of the market volume)*)
    f_CrossOrderCancelReplaceRequest_ParticipationRate : fix_float option;
    (** For CIV – A one character code identifying whether Cancellation rights/Cooling off period applies
     For CIV - Optional*)
    f_CrossOrderCancelReplaceRequest_CancellationRights : fix_cancellationrights option;
    (** A one character code identifying Money laundering status*)
    f_CrossOrderCancelReplaceRequest_MoneyLaunderingStatus : fix_moneylaunderingstatus option;
    (** Unique identifier of the registration details as assigned by institution or intermediary.
     Reference to Registration Instructions message for this Order.*)
    f_CrossOrderCancelReplaceRequest_RegistID : fix_string option;
    (** Free format text defining the designation to be associated with a holding on the register. Used to identify assets of a specific underlying investor using a common registration, e.g. a broker’s nominee or street name.
     Supplementary registration information for this Order*)
    f_CrossOrderCancelReplaceRequest_Designation : fix_string option
}
;;

(** Used to fully cancel the remaining open quantity of a cross order.*)
type full_fix_crossordercancelrequest_data = {
    (** Unique identifier for Order as assigned by sell-side (broker, exchange, ECN). Uniqueness must be guaranteed within a single trading day. Firms which accept multi-day orders should consider embedding a date within the OrderID field to assure uniqueness across days.
     Unique identifier of most recent order as assigned by sell-side (broker, exchange, ECN).*)
    f_CrossOrderCancelRequest_OrderID : fix_string option;
    (** Identifier for a cross order. Must be unique during a given trading day. Recommend that firms use the order date as part of the CrossID for Good Till Cancel (GT) orders.
     CrossID for the replacement order*)
    f_CrossOrderCancelRequest_CrossID : fix_string;
    (** CrossID of the previous cross order (NOT the initial cross order of the day) as assigned by the institution, used to identify the previous cross order in Cross Cancel and Cross Cancel/Replace Requests.
     Must match the CrossID of previous cross order. Same order chaining mechanism as ClOrdID/OrigClOrdID with single order Cancel/Replace.*)
    f_CrossOrderCancelRequest_OrigCrossID : fix_string;
    (** Type of cross being submitted to a market*)
    f_CrossOrderCancelRequest_CrossType : fix_crosstype;
    (** Indicates if one side or the other of a cross order should be prioritized.
     The definition of prioritization is left to the market. In some markets prioritization means which side of the cross order is applied to the market first. In other markets – prioritization may mean that the prioritized side is fully executed (sometimes referred to as the side being protected).*)
    f_CrossOrderCancelRequest_CrossPrioritization : fix_crossprioritization;
    (** Must be 1 or 2*)
    f_CrossOrderCancelRequest_SideCrossOrdCxlGrp : fix_sidecrossordcxlgrp;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_CrossOrderCancelRequest_Instrument : fix_instrument;
    (** Number of underlyings*)
    f_CrossOrderCancelRequest_UndInstrmtGrp : fix_undinstrmtgrp;
    (** Number of Leg*)
    f_CrossOrderCancelRequest_InstrmtLegGrp : fix_instrmtleggrp;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")
     Time this order request was initiated/released by the trader, trading system, or intermediary.*)
    f_CrossOrderCancelRequest_TransactTime : fix_utctimestamp
}
;;

(** The Derivative Security List message is used to return a list of securities that matches the criteria specified in a Derivative Security List Request.*)
type full_fix_derivativesecuritylist_data = {
    (** Unique ID of a Security Definition Request.*)
    f_DerivativeSecurityList_SecurityReqID : fix_string;
    (** Unique ID of a Security Definition message.
     Identifier for the Derivative Security List message*)
    f_DerivativeSecurityList_SecurityResponseID : fix_string;
    (** The results returned to a Security Request message
     Result of the Security Request identified by SecurityReqID*)
    f_DerivativeSecurityList_SecurityRequestResult : fix_securityrequestresult;
    (** Underlying security for which derivatives are being returned*)
    f_DerivativeSecurityList_UnderlyingInstrument : fix_underlyinginstrument;
    (** Total number of securities.
     (Prior to FIX 4.4 this field was named TotalNumSecurities)
     Used to indicate the total number of securities being returned for this request. Used in the event that message fragmentation is required.*)
    f_DerivativeSecurityList_TotNoRelatedSym : int option;
    (** Indicates whether this message is the last in a sequence of messages for those messages that support fragmentation, such as Allocation Instruction, Mass Quote, Security List, Derivative Security List
     Indicates whether this is the last fragment in a sequence of message fragments. Only required where message has been fragmented.*)
    f_DerivativeSecurityList_LastFragment : fix_lastfragment option;
    (** Specifies the number of repeating symbols (instruments) specified*)
    f_DerivativeSecurityList_RelSymDerivSecGrp : fix_relsymderivsecgrp
}
;;

(** The Derivative Security List Request message is used to return a list of securities from the counterparty that match criteria provided on the request*)
type full_fix_derivativesecuritylistrequest_data = {
    (** Unique ID of a Security Definition Request.*)
    f_DerivativeSecurityListRequest_SecurityReqID : fix_string;
    (** Identifies the type/criteria of Security List Request*)
    f_DerivativeSecurityListRequest_SecurityListRequestType : fix_securitylistrequesttype;
    (** Specifies the underlying instrument*)
    f_DerivativeSecurityListRequest_UnderlyingInstrument : fix_underlyinginstrument;
    (** Sub-type qualification/identification of the SecurityType (e.g. for SecurityType="REPO").
     Example Values:
     General = General Collateral (for SecurityType=REPO)
     For SecurityType="MLEG" markets can provide the name of the option or futures strategy, such as Calendar, Vertical, Butterfly, etc.
     NOTE: Additional values may be used by mutual agreement of the counterparties*)
    f_DerivativeSecurityListRequest_SecuritySubType : fix_string option;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.*)
    f_DerivativeSecurityListRequest_Currency : fix_currency option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)
     Comment, instructions, or other identifying information.*)
    f_DerivativeSecurityListRequest_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_DerivativeSecurityListRequest_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_DerivativeSecurityListRequest_EncodedText : fix_string option;
    (** Identifier for Trading Session
     Can be used to represent a specific market trading session (e.g. "PRE-OPEN", "CROSS_2", "AFTER-HOURS", "TOSTNET", "TOSTNET2", etc).
     To specify good for session where session spans more than one calendar day, use TimeInForce = Day in conjunction with TradingSessionID.
     Values should be bi-laterally agreed to between counterparties.
     Firms may register Trading Session values on the FIX website (presently a document maintained within "ECN and Exchanges" working group section).
     Optional Trading Session Identifier to specify a particular trading session for which you want to obtain a list of securities that are tradeable.*)
    f_DerivativeSecurityListRequest_TradingSessionID : fix_string option;
    (** Optional market assigned sub identifier for a trading session. Usage is determined by market or counterparties.
     Used by US based futures markets to identify exchange specific execution time bracket codes as required by US market regulations.*)
    f_DerivativeSecurityListRequest_TradingSessionSubID : fix_string option;
    (** Subscription Request Type
     Subscribe or unsubscribe for security status to security specified in request.*)
    f_DerivativeSecurityListRequest_SubscriptionRequestType : fix_subscriptionrequesttype option
}
;;

(** The Don’t Know Trade (DK) message notifies a trading partner that an electronically received execution has been rejected. This message can be thought of as an execution reject message.*)
type full_fix_dontknowtrade_data = {
    (** Unique identifier for Order as assigned by sell-side (broker, exchange, ECN). Uniqueness must be guaranteed within a single trading day. Firms which accept multi-day orders should consider embedding a date within the OrderID field to assure uniqueness across days.
     Broker Order ID as identified on problem execution*)
    f_DontKnowTrade_OrderID : fix_string;
    (** Assigned by the party which accepts the order. Can be used to provide the OrderID (37) used by an exchange or executing system.*)
    f_DontKnowTrade_SecondaryOrderID : fix_string option;
    (** Unique identifier of execution message as assigned by sell-side (broker, exchange, ECN) (will be 0 (zero) for ExecType (50) =I (Order Status)). Uniqueness must be guaranteed within a single trading day or the life of a multi-day order. Firms which accept multi-day orders should consider embedding a date within the ExecID field to assure uniqueness across days. (Prior to FIX 4.1 this field was of type int)
     Execution ID of problem execution*)
    f_DontKnowTrade_ExecID : fix_string;
    (** Reason for execution rejection*)
    f_DontKnowTrade_DKReason : fix_dkreason;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_DontKnowTrade_Instrument : fix_instrument;
    (** Number of underlyings*)
    f_DontKnowTrade_UndInstrmtGrp : fix_undinstrmtgrp;
    (** Number of Legs*)
    f_DontKnowTrade_InstrmtLegGrp : fix_instrmtleggrp;
    (** Side of order*)
    f_DontKnowTrade_Side : fix_side;
    (** Insert here the set of "OrderQtyData" fields defined in "Common Components of Application Messages"*)
    f_DontKnowTrade_OrderQtyData : fix_orderqtydata;
    (** Quantity (e.g. shares) bought/sold on this (last) fill.
     (Prior to FIX 4.2 this field was of type int)
     Required if specified on the ExecutionRpt*)
    f_DontKnowTrade_LastQty : fix_float option;
    (** Price of this (last) fill.
     Required if specified on the ExecutionRpt*)
    f_DontKnowTrade_LastPx : fix_float option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_DontKnowTrade_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_DontKnowTrade_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_DontKnowTrade_EncodedText : fix_string option
}
;;

(** The email message is similar to the format and purpose of the News message, however, it is intended for private use between two parties.*)
type full_fix_email_data = {
    (** Unique identifier for an email thread (new and chain of replies)
     Unique identifier for the email message thread*)
    f_Email_EmailThreadID : fix_string;
    (** Email message type*)
    f_Email_EmailType : fix_emailtype;
    (** Time of message origination (always expressed in UTC (Universal Time Coordinated, also known as "GMT"))*)
    f_Email_OrigTime : fix_utctimestamp option;
    (** The subject of an Email message
     Specifies the Subject text*)
    f_Email_Subject : fix_string;
    (** Byte length of encoded (non-ASCII characters) EncodedSubject (357) field.
     Must be set if EncodedSubject field is specified and must immediately precede it.*)
    f_Email_EncodedSubjectLen : int option;
    (** Encoded (non-ASCII characters) representation of the Subject (47) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Subject field.
     Encoded (non-ASCII characters) representation of the Subject field in the encoded format specified via the MessageEncoding field.*)
    f_Email_EncodedSubject : fix_string option;
    (** Required if any RoutingType and RoutingIDs are specified. Indicates the number within repeating group.*)
    f_Email_RoutingGrp : fix_routinggrp;
    (** Specifies the number of repeating symbols (instruments) specified*)
    f_Email_InstrmtGrp : fix_instrmtgrp;
    (** Number of underlyings*)
    f_Email_UndInstrmtGrp : fix_undinstrmtgrp;
    (** Number of legs
     Identifies a Multi-leg Execution if present and non-zero.*)
    f_Email_InstrmtLegGrp : fix_instrmtleggrp;
    (** Unique identifier for Order as assigned by sell-side (broker, exchange, ECN). Uniqueness must be guaranteed within a single trading day. Firms which accept multi-day orders should consider embedding a date within the OrderID field to assure uniqueness across days.*)
    f_Email_OrderID : fix_string option;
    (** Unique identifier for Order as assigned by the buy-side (institution, broker, intermediary etc.) (identified by SenderCompID (49) or OnBehalfOfCompID (5) as appropriate). Uniqueness must be guaranteed within a single trading day. Firms, particularly those which electronically submit multi-day orders, trade globally or throughout market close periods, should ensure uniqueness across days, for example by embedding a date within the ClOrdID field.*)
    f_Email_ClOrdID : fix_string option;
    (** Specifies the number of repeating lines of text specified*)
    f_Email_LinesOfTextGrp : fix_linesoftextgrp;
    (** Number of bytes in raw data field.*)
    f_Email_RawDataLength : int option;
    (** Unformatted raw data, can include bitmaps, word processor documents, etc.*)
    f_Email_RawData : fix_string option
}
;;

(** The execution report message is used to:
 1. Confirm the receipt of an order
 2. Confirm changes to an existing order (i.e. accept cancel and replace requests)
 3. Relay order status information
 4. Relay fill information on working orders
 5. Relay fill information on tradeable or restricted tradeable quotes
 6. Reject orders
 7. Report post-trade fees calculations associated with a trade*)
type full_fix_executionreport_data = {
    (** Unique identifier for Order as assigned by sell-side (broker, exchange, ECN). Uniqueness must be guaranteed within a single trading day. Firms which accept multi-day orders should consider embedding a date within the OrderID field to assure uniqueness across days.
     OrderID is required to be unique for each chain of orders.*)
    f_ExecutionReport_OrderID : fix_string;
    (** Assigned by the party which accepts the order. Can be used to provide the OrderID (37) used by an exchange or executing system.
     Can be used to provide order id used by exchange or executing system.*)
    f_ExecutionReport_SecondaryOrderID : fix_string option;
    (** Assigned by the party which originates the order. Can be used to provide the ClOrdID (11) used by an exchange or executing system.*)
    f_ExecutionReport_SecondaryClOrdID : fix_string option;
    (** Assigned by the party which accepts the order. Can be used to provide the ExecID (7) used by an exchange or executing system.*)
    f_ExecutionReport_SecondaryExecID : fix_string option;
    (** Unique identifier for Order as assigned by the buy-side (institution, broker, intermediary etc.) (identified by SenderCompID (49) or OnBehalfOfCompID (5) as appropriate). Uniqueness must be guaranteed within a single trading day. Firms, particularly those which electronically submit multi-day orders, trade globally or throughout market close periods, should ensure uniqueness across days, for example by embedding a date within the ClOrdID field.
     Required for executions against electronically submitted orders which were assigned an ID by the institution or intermediary. Not required for orders manually entered by the broker or fund manager (for CIV orders).*)
    f_ExecutionReport_ClOrdID : fix_string option;
    (** ClOrdID () of the previous order (NOT the initial order of the day) as assigned by the institution, used to identify the previous order in cancel and cancel/replace requests.
     Conditionally required for response to an electronic Cancel or Cancel/Replace request (ExecType=PendingCancel, Replace, or Canceled). ClOrdID of the previous accepted order (NOT the initial order of the day) when canceling or replacing an order.*)
    f_ExecutionReport_OrigClOrdID : fix_string option;
    (** Permits order originators to tie together groups of orders in which trades resulting from orders are associated for a specific purpose, for example the calculation of average execution price for a customer or to associate lists submitted to a broker as waves of a larger program trade.*)
    f_ExecutionReport_ClOrdLinkID : fix_string option;
    (** Message reference for Quote Response
     Required if responding to a QuoteResponse message. Echo back the Initiator’s value specified in the message.*)
    f_ExecutionReport_QuoteRespID : fix_string option;
    (** Can be used to uniquely identify a specific Order Status Request message.
     Required if responding to and if provided on the Order Status Request message. Echo back the value provided by the requester.*)
    f_ExecutionReport_OrdStatusReqID : fix_string option;
    (** Value assigned by issuer of Mass Status Request to uniquely identify the request
     Required if responding to a Order Mass Status Request. Echo back the value provided by the requester.*)
    f_ExecutionReport_MassStatusReqID : fix_string option;
    (** Total number or reports returned in response to a request
     Can be used when responding to an Order Mass Status Request to identify the total number of Execution Reports which will be returned.*)
    f_ExecutionReport_TotNumReports : int option;
    (** Indicates whether this message is that last report message in response to a request, such as Order Mass Status Request.
     Can be used when responding to an Order Mass Status Request to indicate that this is the last Execution Reports which will be returned as a result of the request.*)
    f_ExecutionReport_LastRptRequested : bool option;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_ExecutionReport_Parties : fix_parties;
    (** Used with Fixed Income for Muncipal New Issue Market. Agreement in principal between counter-parties prior to actual trade date.
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)
     (prior to FIX 4.4 field was of type UTCDate)*)
    f_ExecutionReport_TradeOriginationDate : fix_localmktdate option;
    (** Number of ContraBrokers repeating group instances.*)
    f_ExecutionReport_ContraGrp : fix_contragrp;
    (** Unique identifier for list as assigned by institution, used to associate multiple individual orders. Uniqueness must be guaranteed within a single trading day. Firms which generate multi-day orders should consider embedding a date within the ListID field to assure uniqueness across days.
     Required for executions against orders which were submitted as part of a list.*)
    f_ExecutionReport_ListID : fix_string option;
    (** Identifier for a cross order. Must be unique during a given trading day. Recommend that firms use the order date as part of the CrossID for Good Till Cancel (GT) orders.
     CrossID for the replacement order*)
    f_ExecutionReport_CrossID : fix_string option;
    (** CrossID of the previous cross order (NOT the initial cross order of the day) as assigned by the institution, used to identify the previous cross order in Cross Cancel and Cross Cancel/Replace Requests.
     Must match original cross order. Same order chaining mechanism as ClOrdID/OrigClOrdID with single order Cancel/Replace.*)
    f_ExecutionReport_OrigCrossID : fix_string option;
    (** Type of cross being submitted to a market*)
    f_ExecutionReport_CrossType : fix_crosstype option;
    (** Unique identifier of execution message as assigned by sell-side (broker, exchange, ECN) (will be 0 (zero) for ExecType (50) =I (Order Status)). Uniqueness must be guaranteed within a single trading day or the life of a multi-day order. Firms which accept multi-day orders should consider embedding a date within the ExecID field to assure uniqueness across days. (Prior to FIX 4.1 this field was of type int)
     Unique identifier of execution message as assigned by sell-side (broker, exchange, ECN) (will be 0 (zero) forExecType=I (Order Status)).*)
    f_ExecutionReport_ExecID : fix_string;
    (** Reference identifier used with Trade Cancel and Trade Correct execution types.
     (Prior to FIX 4.1 this field was of type int)
     Required for Trade Cancel and Trade Correct ExecType messages*)
    f_ExecutionReport_ExecRefID : fix_string option;
    (** Describes the specific ExecutionRpt (i.e. Pending Cancel) while OrdStatus (39) will always identify the current order status (i.e. Partially Filled)
     *** SOME VALUES HAVE BEEN REPLACED - See "Replaced Features and Supported Approach" ***
     Describes the purpose of the execution report.*)
    f_ExecutionReport_ExecType : fix_exectype;
    (** Identifies current status of order.
     *** SOME VALUES HAVE BEEN REPLACED - See "Replaced Features and Supported Approach" ***
     (see Volume : "Glossary" for value definitions)
     Describes the current state of a CHAIN of orders, same scope as OrderQty, CumQty, LeavesQty, and AvgPx*)
    f_ExecutionReport_OrdStatus : fix_ordstatus;
    (** Indicates if the order is currently being worked. Applicable only for OrdStatus = "New". For open outcry markets this indicates that the order is being worked in the crowd. For electronic markets it indicates that the order has transitioned from a contingent order to a market order.
     For optional use with OrdStatus = 0 (New)*)
    f_ExecutionReport_WorkingIndicator : fix_workingindicator option;
    (** Code to identify reason for order rejection.
     For optional use with ExecType = 8 (Rejected)*)
    f_ExecutionReport_OrdRejReason : fix_ordrejreason option;
    (** Code to identify reason for an ExecutionRpt message sent with ExecType=Restated or used when communicating an unsolicited cancel.
     Required for ExecType = D (Restated).*)
    f_ExecutionReport_ExecRestatementReason : fix_execrestatementreason option;
    (** Account mnemonic as agreed between buy and sell sides, e.g. broker and institution or investor/intermediary and fund manager.
     Required for executions against electronically submitted orders which were assigned an account by the institution or intermediary*)
    f_ExecutionReport_Account : fix_string option;
    (** Used to identify the source of the Account (1) code. This is especially useful if the account is a new account that the Respondent may not have setup yet in their system.*)
    f_ExecutionReport_AcctIDSource : fix_acctidsource option;
    (** Type of account associated with an order
     Specifies type of account*)
    f_ExecutionReport_AccountType : fix_accounttype option;
    (** Indicates whether or not automatic booking can occur.*)
    f_ExecutionReport_DayBookingInst : fix_daybookinginst option;
    (** Indicates what constitutes a bookable unit.*)
    f_ExecutionReport_BookingUnit : fix_bookingunit option;
    (** Indicates the method of preallocation.*)
    f_ExecutionReport_PreallocMethod : fix_preallocmethod option;
    (** Indicates order settlement period. If present, SettlDate (64) overrides this field. If both SettlType (63) and SettDate (64) are omitted, the default for SettlType (63) is 0 (Regular)
     Regular is defined as the default settlement period for the particular security on the exchange of execution.
     In Fixed Income the contents of this field may influence the instrument definition if the SecurityID (48) is ambiguous. In the US an active Treasury offering may be re-opened, and for a time one CUSIP will apply to both the current and "when-issued" securities. Supplying a value of "7" clarifies the instrument description; any other value or the absence of this field should cause the respondent to default to the active issue.*)
    f_ExecutionReport_SettlType : fix_settltype option;
    (** Specific date of trade settlement (SettlementDate) in YYYYMMDD format.
     If present, this field overrides SettlType (63). This field is required if the value of SettlType (63) is 6 (Future) or 8 (Sellers Option). This field must be omitted if the value of SettlType (63) is 7 (When and If Issued)
     (expressed in local time at place of settlement)
     Takes precedence over SettlType value and conditionally required/omitted for specific SettlType values.*)
    f_ExecutionReport_SettlDate : fix_localmktdate option;
    (** Identifies whether an order is a margin order or a non-margin order. This is primarily used when sending orders to Japanese exchanges to indicate sell margin or buy to cover. The same tag could be assigned also by buy-side to indicate the intent to sell or buy margin and the sell-side to accept or reject (base on some validation criteria) the margin request.*)
    f_ExecutionReport_CashMargin : fix_cashmargin option;
    (** Indicates type of fee being assessed of the customer for trade executions at an exchange. Applicable for futures markets only at this time.
     (Values source CBOT, CME, NYBOT, and NYMEX):*)
    f_ExecutionReport_ClearingFeeIndicator : fix_clearingfeeindicator option;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_ExecutionReport_Instrument : fix_instrument;
    (** Insert here the set of "FinancingDetails" (symbology) fields defined in "Common Components of Application Messages"*)
    f_ExecutionReport_FinancingDetails : fix_financingdetails;
    (** Number of underlyings*)
    f_ExecutionReport_UndInstrmtGrp : fix_undinstrmtgrp;
    (** Side of order*)
    f_ExecutionReport_Side : fix_side;
    (** Insert here the set of "Stipulations" (repeating group of Fixed Income stipulations) fields defined in "Common Components of Application Messages"*)
    f_ExecutionReport_Stipulations : fix_stipulations;
    (** Type of quantity specified in a quantity field*)
    f_ExecutionReport_QtyType : fix_qtytype option;
    (** Insert here the set of "OrderQtyData" fields defined in "Common Components of Application Messages"
     **Note: OrderQty field is required for Single Instrument Orders unless rejecting or acknowledging an order for a CashOrderQty or PercentOrder.*)
    f_ExecutionReport_OrderQtyData : fix_orderqtydata;
    (** Order type
     *** SOME VALUES ARE NO LONGER USED - See "Deprecated (Phased-out) Features and Supported Approach" ***
     (see Volume : "Glossary" for value definitions)*)
    f_ExecutionReport_OrdType : fix_ordtype option;
    (** Code to represent the price type*)
    f_ExecutionReport_PriceType : fix_pricetype option;
    (** Price per unit of quantity (e.g. per share)
     Required if specified on the order*)
    f_ExecutionReport_Price : fix_float option;
    (** Price per unit of quantity (e.g. per share)
     Required if specified on the order*)
    f_ExecutionReport_StopPx : fix_float option;
    (** Insert here the set of "PegInstruction" fields defined in "Common Components of Application Messages"*)
    f_ExecutionReport_PegInstructions : fix_peginstructions;
    (** Insert here the set of "DiscretionInstruction" fields defined in "Common Components of Application Messages"*)
    f_ExecutionReport_DiscretionInstructions : fix_discretioninstructions;
    (** The price the order is currently pegged at
     The current price the order is pegged at*)
    f_ExecutionReport_PeggedPrice : fix_float option;
    (** The current discretionary price of the order
     The current discretionary price of the order*)
    f_ExecutionReport_DiscretionPrice : fix_float option;
    (** The target strategy of the order
     1000+ = Reserved and available for bi-laterally agreed upon user defined values
     The target strategy of the order*)
    f_ExecutionReport_TargetStrategy : fix_targetstrategy option;
    (** Field to allow further specification of the TargetStrategy – usage to be agreed between counterparties
     For further specification of the TargetStrategy*)
    f_ExecutionReport_TargetStrategyParameters : fix_string option;
    (** For a TargetStrategy=Participate order specifies the target particpation rate. For other order types this is a volume limit (i.e. do not be more than this percent of the market volume)
     Mandatory for a TargetStrategy=Participate order and specifies the target particpation rate.
     For other order types optionally specifies a volume limit (i.e. do not be more than this percent of the market volume)*)
    f_ExecutionReport_ParticipationRate : fix_float option;
    (** For communication of the performance of the order versus the target strategy
     For communication of the performance of the order versus the target strategy*)
    f_ExecutionReport_TargetStrategyPerformance : fix_float option;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.*)
    f_ExecutionReport_Currency : fix_currency option;
    (** ID used to represent this transaction for compliance purposes (e.g. OATS reporting).*)
    f_ExecutionReport_ComplianceID : fix_string option;
    (** Indicates whether or not the order was solicited.*)
    f_ExecutionReport_SolicitedFlag : fix_solicitedflag option;
    (** Specifies how long the order remains in effect. Absence of this field is interpreted as DAY.
     Absence of this field indicates Day order*)
    f_ExecutionReport_TimeInForce : fix_timeinforce option;
    (** Time the details within the message should take effect (always expressed in UTC (Universal Time Coordinated, also known as "GMT")
     Time specified on the order at which the order should be considered valid*)
    f_ExecutionReport_EffectiveTime : fix_utctimestamp option;
    (** Date of order expiration (last day the order can trade), always expressed in terms of the local market date. The time at which the order expires is determined by the local market’s business practices
     Conditionally required if TimeInForce = GTD and ExpireTime is not specified.*)
    f_ExecutionReport_ExpireDate : fix_localmktdate option;
    (** Time/Date of order expiration (always expressed in UTC (Universal Time Coordinated, also known as "GMT")
     The meaning of expiration is specific to the context where the field is used.
     For orders, this is the expiration time of a Good Til Date TimeInForce.
     For Quotes - this is the expiration of the quote.
     Expiration time is provided across the quote message dialog to control the length of time of the overall quoting process.
     For collateral requests, this is the time by which collateral must be assigned.
     For collateral assignments, this is the time by which a response to the assignment is expected.
     Conditionally required if TimeInForce = GTD and ExpireDate is not specified.*)
    f_ExecutionReport_ExpireTime : fix_utctimestamp option;
    (** Instructions for order handling on exchange trading floor. If more than one instruction is applicable to an order, this field can contain multiple instructions separated by space.
     Can contain multiple instructions, space delimited.*)
    f_ExecutionReport_ExecInst : fix_execinst option;
    (** Designates the capacity of the firm placing the order
     (as of FIX 4.3, this field replaced Rule80A (tag 47) --used in conjunction with OrderRestrictions (529) field)
     (see Volume : "Glossary" for value definitions)*)
    f_ExecutionReport_OrderCapacity : fix_ordercapacity option;
    (** Restrictions associated with an order. If more than one restriction is applicable to an order, this field can contain multiple instructions separated by space.*)
    f_ExecutionReport_OrderRestrictions : fix_orderrestrictions option;
    (** Capacity of customer placing the order
     Primarily used by futures exchanges to indicate the CTICode (customer type indicator) as required by the US CFTC (Commodity Futures Trading Commission).*)
    f_ExecutionReport_CustOrderCapacity : fix_custordercapacity option;
    (** Quantity (e.g. shares) bought/sold on this (last) fill.
     (Prior to FIX 4.2 this field was of type int)
     Quantity (e.g. shares) bought/sold on this (last) fill. Required if ExecType = Trade or Trade Correct.
     If ExecType=Stopped, represents the quantity stopped/guaranteed/protected for.*)
    f_ExecutionReport_LastQty : fix_float option;
    (** The calculated or traded quantity for the underlying instrument that corresponds to a derivative. Used for transactions that include the cash instrument and the derivative.*)
    f_ExecutionReport_UnderlyingLastQty : fix_float option;
    (** Price of this (last) fill.
     Price of this (last) fill. Required if ExecType = Trade or Trade Correct.
     Should represent the "all-in" (LastSpotRate + LastForwardPoints) rate for F/X orders. ).
     If ExecType=Stopped, represents the price stopped/guaranteed/protected at.*)
    f_ExecutionReport_LastPx : fix_float option;
    (** The calculated or traded price for the underlying instrument that corresponds to a derivative. Used for transactions that include the cash instrument and the derivative.*)
    f_ExecutionReport_UnderlyingLastPx : fix_float option;
    (** Last price expressed in percent-of-par. Conditionally required for Fixed Income trades when LastPx (3) is expressed in Yield, Spread, Discount or any other type.
     Usage: Execution Report and Allocation Report repeating executions block (from sellside).
     Last price expressed in percent-of-par. Conditionally required for Fixed Income trades when LastPx is expressed in Yield, Spread, Discount or any other price type that is not percent-of-par.*)
    f_ExecutionReport_LastParPx : fix_float option;
    (** F/X spot rate.
     Applicable for F/X orders*)
    f_ExecutionReport_LastSpotRate : fix_float option;
    (** F/X forward points added to LastSpotRate (94). May be a negative value.
     Applicable for F/X orders*)
    f_ExecutionReport_LastForwardPoints : fix_float option;
    (** Market of execution for last fill, or an indication of the market where an order was routed
     Valid values:
     See "Appendix 6-C"
     If ExecType = Trade (F), indicates the market where the trade was executed. If ExecType = New (0), indicates the market where the order was routed.*)
    f_ExecutionReport_LastMkt : fix_exchange option;
    (** Identifier for Trading Session
     Can be used to represent a specific market trading session (e.g. "PRE-OPEN", "CROSS_2", "AFTER-HOURS", "TOSTNET", "TOSTNET2", etc).
     To specify good for session where session spans more than one calendar day, use TimeInForce = Day in conjunction with TradingSessionID.
     Values should be bi-laterally agreed to between counterparties.
     Firms may register Trading Session values on the FIX website (presently a document maintained within "ECN and Exchanges" working group section).*)
    f_ExecutionReport_TradingSessionID : fix_string option;
    (** Optional market assigned sub identifier for a trading session. Usage is determined by market or counterparties.
     Used by US based futures markets to identify exchange specific execution time bracket codes as required by US market regulations.*)
    f_ExecutionReport_TradingSessionSubID : fix_string option;
    (** A code that represents a time interval in which a fill or trade occurred.
     Required for US futures markets.*)
    f_ExecutionReport_TimeBracket : fix_string option;
    (** Broker capacity in order execution*)
    f_ExecutionReport_LastCapacity : fix_lastcapacity option;
    (** Quantity open for further execution. If the OrdStatus (39) is Canceled, DoneForTheDay, Expired, Calculated, or Rejected (in which case the order is no longer active) then LeavesQty could be 0, otherwise LeavesQty = OrderQty (38) – CumQty (4).
     (Prior to FIX 4.2 this field was of type int)
     Quantity open for further execution. If the OrdStatus is Canceled, DoneForTheDay, Expired, Calculated, or Rejected (in which case the order is no longer active) then LeavesQty could be 0, otherwise LeavesQty = OrderQty - CumQty.*)
    f_ExecutionReport_LeavesQty : fix_float;
    (** Total quantity (e.g. number of shares) filled.
     (Prior to FIX 4.2 this field was of type int)
     Currently executed quantity for chain of orders.*)
    f_ExecutionReport_CumQty : fix_float;
    (** Calculated average price of all fills on this order.
     For Fixed Income trades AvgPx is always expressed as percent-of-par, regardless of the PriceType (423) of LastPx (3). I.e., AvgPx will contain an average of percent-of-par values (see LastParPx (669)) for issues traded in Yield, Spread or Discount.*)
    f_ExecutionReport_AvgPx : fix_float;
    (** For GT orders, the OrderQty (38) less all quantity (adjusted for stock splits) that traded on previous days. DayOrderQty (424) = OrderQty – (CumQty (4) – DayCumQty (425))
     For GT orders on days following the day of the first trade.*)
    f_ExecutionReport_DayOrderQty : fix_float option;
    (** Quantity on a GT order that has traded today.
     For GT orders on days following the day of the first trade.*)
    f_ExecutionReport_DayCumQty : fix_float option;
    (** The average price for quantity on a GT order that has traded today.
     For GT orders on days following the day of the first trade.*)
    f_ExecutionReport_DayAvgPx : fix_float option;
    (** Code to identify whether to book out executions on a part-filled GT order on the day of execution or to accumulate
     States whether executions are booked out or accumulated on a partially filled GT order*)
    f_ExecutionReport_GTBookingInst : fix_gtbookinginst option;
    (** Indicates date of trade referenced in this message in YYYYMMDD format. Absence of this field indicates current day (expressed in local time at place of trade).
     Used when reporting other than current day trades.*)
    f_ExecutionReport_TradeDate : fix_localmktdate option;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")
     Time the transaction represented by this ExecutionReport occurred*)
    f_ExecutionReport_TransactTime : fix_utctimestamp option;
    (** Identifies party of trade responsible for exchange reporting.*)
    f_ExecutionReport_ReportToExch : fix_reporttoexch option;
    (** Insert here the set of "CommissionData" fields defined in "Common Components of Application Messages"
     Note: On a fill/partial fill messages, it represents value for that fill/partial fill. On ExecType=Calculated, it represents cumulative value for the order. Monetary commission values are expressed in the currency reflected by the Currency field.*)
    f_ExecutionReport_CommissionData : fix_commissiondata;
    (** Insert here the set of "SpreadOrBenchmarkCurveData" (Fixed Income spread or benchmark curve) fields defined in "Common Components of Application Messages"*)
    f_ExecutionReport_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    (** Insert here the set of "YieldData" (yield-related) fields defined in "Common Components of Application Messages"*)
    f_ExecutionReport_YieldData : fix_yielddata;
    (** Total amount traded (e.g. CumQty (4) * AvgPx (6)) expressed in units of currency.*)
    f_ExecutionReport_GrossTradeAmt : fix_float option;
    (** Number of Days of Interest for convertible bonds and fixed income. Note value may be negative.*)
    f_ExecutionReport_NumDaysInterest : int option;
    (** The date when a distribution of interest is deducted from a securities assets or set aside for payment to bondholders. On the ex-date, the securities price drops by the amount of the distribution (plus or minus any market activity).
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)
     (prior to FIX 4.4 field was of type UTCDate)*)
    f_ExecutionReport_ExDate : fix_localmktdate option;
    (** The amount the buyer compensates the seller for the portion of the next coupon interest payment the seller has earned but will not receive from the issuer because the issuer will send the next coupon payment to the buyer. Accrued Interest Rate is the annualized Accrued Interest amount divided by the purchase price of the bond.*)
    f_ExecutionReport_AccruedInterestRate : fix_float option;
    (** Amount of Accrued Interest for convertible bonds and fixed income*)
    f_ExecutionReport_AccruedInterestAmt : fix_float option;
    (** Amount of interest (i.e. lump-sum) at maturity.
     For fixed income products which pay lump-sum interest at maturity.*)
    f_ExecutionReport_InterestAtMaturity : fix_float option;
    (** Accrued Interest Amount applicable to a financing transaction on the End Date.
     For repurchase agreements the accrued interest on termination.*)
    f_ExecutionReport_EndAccruedInterestAmt : fix_float option;
    (** Starting dirty cash consideration of a financing deal, i.e. paid to the seller on the Start Date.
     For repurchase agreements the start (dirty) cash consideration*)
    f_ExecutionReport_StartCash : fix_float option;
    (** Ending dirty cash consideration of a financing deal. i.e. reimbursed to the buyer on the End Date.
     For repurchase agreements the end (dirty) cash consideration*)
    f_ExecutionReport_EndCash : fix_float option;
    (** Driver and part of trade in the event that the Security Master file was wrong at the point of entry
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)*)
    f_ExecutionReport_TradedFlatSwitch : fix_tradedflatswitch option;
    (** BasisFeatureDate allows requesting firms within fixed income the ability to request an alternative yield-to-worst, -maturity, -extended or other call. This flows through the confirm process.
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)
     (prior to FIX 4.4 field was of type UTCDate)*)
    f_ExecutionReport_BasisFeatureDate : fix_localmktdate option;
    (** Price for BasisFeatureDate.
     See BasisFeatureDate (259)
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)*)
    f_ExecutionReport_BasisFeaturePrice : fix_float option;
    (** Provides the reduction in price for the secondary market in Muncipals.
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)*)
    f_ExecutionReport_Concession : fix_float option;
    (** The price at which the securities are distributed to the different members of an underwriting group for the primary market in Municipals, total gross underwriter's spread.
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)*)
    f_ExecutionReport_TotalTakedown : fix_float option;
    (** Total amount due as the result of the transaction (e.g. for Buy order - principal + commission + fees) reported in currency of execution.
     Note: On a fill/partial fill messages, it represents value for that fill/partial fill, on ExecType=Calculated, it represents cumulative value for the order. Value expressed in the currency reflected by the Currency field.*)
    f_ExecutionReport_NetMoney : fix_float option;
    (** Total amount due expressed in settlement currency (includes the effect of the forex transaction)
     Used to report results of forex accommodation trade*)
    f_ExecutionReport_SettlCurrAmt : fix_float option;
    (** Currency code of settlement denomination.
     Used to report results of forex accommodation trade*)
    f_ExecutionReport_SettlCurrency : fix_currency option;
    (** Foreign exchange rate used to compute SettlCurrAmt (9) from Currency (5) to SettlCurrency (20)
     Foreign exchange rate used to compute SettlCurrAmt from Currency to SettlCurrency*)
    f_ExecutionReport_SettlCurrFxRate : fix_float option;
    (** Specifies whether or not SettlCurrFxRate (55) should be multiplied or divided
     Specifies whether the SettlCurrFxRate should be multiplied or divided*)
    f_ExecutionReport_SettlCurrFxRateCalc : fix_settlcurrfxratecalc option;
    (** Instructions for order handling on Broker trading floor*)
    f_ExecutionReport_HandlInst : fix_handlinst option;
    (** Minimum quantity of an order to be executed.
     (Prior to FIX 4.2 this field was of type int)*)
    f_ExecutionReport_MinQty : fix_float option;
    (** Maximum quantity (e.g. number of shares) within an order to be shown on the exchange floor at any given time.
     (Prior to FIX 4.2 this field was of type int)*)
    f_ExecutionReport_MaxFloor : fix_float option;
    (** Indicates whether the resulting position after a trade should be an opening position or closing position. Used for omnibus accounting - where accounts are held on a gross basis instead of being netted together.
     For use in derivatives omnibus accounting*)
    f_ExecutionReport_PositionEffect : fix_positioneffect option;
    (** Maximum quantity (e.g. number of shares) within an order to be shown to other customers (i.e. sent via an IOI).
     (Prior to FIX 4.2 this field was of type int)*)
    f_ExecutionReport_MaxShow : fix_float option;
    (** Method for booking out this order. Used when notifying a broker that an order to be settled by that broker is to be booked out as an OTC derivative (e.g. CFD or similar).
     Method for booking out this order. Used when notifying a broker that an order to be settled by that broker is to be booked out as an OTC derivative (e.g. CFD or similar). Absence of this field implies regular booking.*)
    f_ExecutionReport_BookingType : fix_bookingtype option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_ExecutionReport_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_ExecutionReport_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_ExecutionReport_EncodedText : fix_string option;
    (** SettDate (64) of the future part of a F/X swap order.
     Can be used with OrdType = "Forex - Swap" to specify the "value date" for the future portion of a F/X swap.*)
    f_ExecutionReport_SettlDate2 : fix_localmktdate option;
    (** OrderQty (38) of the future part of a F/X swap order.
     Can be used with OrdType = "Forex - Swap" to specify the order quantity for the future portion of a F/X swap.*)
    f_ExecutionReport_OrderQty2 : fix_float option;
    (** F/X forward points of the future part of a F/X swap order added to LastSpotRate (94). May be a negative value.
     Can be used with OrdType = "Forex - Swap" to specify the forward points (added to LastSpotRate) for the future portion of a F/X swap.*)
    f_ExecutionReport_LastForwardPoints2 : fix_float option;
    (** Used to indicate what an Execution Report represents (e.g. used with multi-leg securities, such as option strategies, spreads, etc.).
     Default is a single security if not specified.*)
    f_ExecutionReport_MultiLegReportingType : fix_multilegreportingtype option;
    (** For CIV – A one character code identifying whether Cancellation rights/Cooling off period applies
     For CIV - Optional*)
    f_ExecutionReport_CancellationRights : fix_cancellationrights option;
    (** A one character code identifying Money laundering status*)
    f_ExecutionReport_MoneyLaunderingStatus : fix_moneylaunderingstatus option;
    (** Unique identifier of the registration details as assigned by institution or intermediary.
     Reference to Registration Instructions message for this Order.*)
    f_ExecutionReport_RegistID : fix_string option;
    (** Free format text defining the designation to be associated with a holding on the register. Used to identify assets of a specific underlying investor using a common registration, e.g. a broker’s nominee or street name.
     Supplementary registration information for this Order*)
    f_ExecutionReport_Designation : fix_string option;
    (** For CIV A date and time stamp to indicate the time a CIV order was booked by the fund manager.
     For CIV - Optional*)
    f_ExecutionReport_TransBkdTime : fix_utctimestamp option;
    (** For CIV - a date and time stamp to indicate the fund valuation point with respect to which a order was priced by the fund manager.
     For CIV - Optional*)
    f_ExecutionReport_ExecValuationPoint : fix_utctimestamp option;
    (** For CIV - Identifies how the execution price LastPx (3) was calculated from the fund unit/share price(s) calculated at the fund valuation point
     For CIV - Optional*)
    f_ExecutionReport_ExecPriceType : fix_execpricetype option;
    (** For CIV the amount or percentage by which the fund unit/share price was adjusted, as indicated by ExecPriceType (484)
     For CIV - Optional*)
    f_ExecutionReport_ExecPriceAdjustment : fix_float option;
    (** Indicates if a Cancel/Replace has caused an order to lose book priority*)
    f_ExecutionReport_PriorityIndicator : fix_priorityindicator option;
    (** Amount of price improvement.*)
    f_ExecutionReport_PriceImprovement : fix_float option;
    (** Indicator to identify whether this fill was a result of a liquidity provider providing or liquidity taker taking the liquidity. Applicable only for OrdStatus of Partial or Filled.
     Applicable only on OrdStatus of Partial or Filled.*)
    f_ExecutionReport_LastLiquidityInd : fix_lastliquidityind option;
    (** Number of contract details in this message (number of repeating groups to follow)*)
    f_ExecutionReport_ContAmtGrp : fix_contamtgrp;
    (** Number of legs
     Identifies a Multi-leg Execution if present and non-zero.*)
    f_ExecutionReport_InstrmtLegExecGrp : fix_instrmtlegexecgrp;
    (** Indicates whether or not this message is a drop copy of another message.*)
    f_ExecutionReport_CopyMsgIndicator : bool option;
    (** Required if any miscellaneous fees are reported. Indicates number of repeating entries. Repeating group.
     ** Nested Repeating Group follows ***)
    f_ExecutionReport_MiscFeesGrp : fix_miscfeesgrp
}
;;

(** Indication of interest messages are used to market merchandise which the broker is buying or selling in either a proprietary or agency capacity.*)
type full_fix_ioi_data = {
    (** Unique identifier of IOI message.
     (Prior to FIX 4.1 this field was of type int)*)
    f_IOI_IOIID : fix_string;
    (** Identifies IOI message transaction type*)
    f_IOI_IOITransType : fix_ioitranstype;
    (** Reference identifier used with CANCEL and REPLACE, transaction types.
     (Prior to FIX 4.1 this field was of type int)
     Required for Cancel and Replace IOITransType messages*)
    f_IOI_IOIRefID : fix_string option;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_IOI_Instrument : fix_instrument;
    (** Insert here the set of "FinancingDetails" (symbology) fields defined in "Common Components of Application Messages"*)
    f_IOI_FinancingDetails : fix_financingdetails;
    (** Number of underlyings*)
    f_IOI_UndInstrmtGrp : fix_undinstrmtgrp;
    (** Side of order
     Side of Indication
     Valid values:
     1 = Buy
     2 = Sell
     7 = Undisclosed (for IOIs)
     B = As Defined (for multilegs)
     C = Opposite (for multilegs)*)
    f_IOI_Side : fix_side;
    (** Type of quantity specified in a quantity field*)
    f_IOI_QtyType : fix_qtytype option;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"
     The value zero is used if NoLegs repeating group is used
     Applicable if needed to express CashOrder Qty (tag 152)*)
    f_IOI_OrderQtyData : fix_orderqtydata;
    (** Quantity (e.g. number of shares) in numeric form or relative size.
     The value zero is used if NoLegs repeating group is used*)
    f_IOI_IOIQty : fix_ioiqty;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.*)
    f_IOI_Currency : fix_currency option;
    (** Insert here the set of "Stipulations" (symbology) fields defined in "Common Components of Application Messages"*)
    f_IOI_Stipulations : fix_stipulations;
    (** Required for multileg IOIs*)
    f_IOI_InstrmtLegIOIGrp : fix_instrmtlegioigrp;
    (** Code to represent the price type*)
    f_IOI_PriceType : fix_pricetype option;
    (** Price per unit of quantity (e.g. per share)*)
    f_IOI_Price : fix_float option;
    (** Indicates expiration time of indication message (always expressed in UTC (Universal Time Coordinated, also known as "GMT")*)
    f_IOI_ValidUntilTime : fix_utctimestamp option;
    (** Relative quality of indication*)
    f_IOI_IOIQltyInd : fix_ioiqltyind option;
    (** Indicates that IOI is the result of an existing agency order or a facilitation position resulting from an agency order, not from principal trading or order solicitation activity.*)
    f_IOI_IOINaturalFlag : fix_ioinaturalflag option;
    (** Required if any IOIQualifiers are specified. Indicates the number of repeating IOIQualifiers.*)
    f_IOI_IOIQualGrp : fix_ioiqualgrp;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_IOI_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_IOI_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_IOI_EncodedText : fix_string option;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")*)
    f_IOI_TransactTime : fix_utctimestamp option;
    (** A URI (Uniform Resource Identifier) or URL (Uniform Resource Locator) link to additional information (i.e. http://www.XYZ.com/research.html)
     See "Appendix 6-B FIX Fields Based Upon Other Standards"
     A URL (Uniform Resource Locator) link to additional information (i.e. http://www.XYZ.com/research.html)*)
    f_IOI_URLLink : fix_string option;
    (** Required if any RoutingType and RoutingIDs are specified. Indicates the number within repeating group.*)
    f_IOI_RoutingGrp : fix_routinggrp;
    (** Insert here the set of "SpreadOrBenchmarkCurveData" (Fixed Income spread or benchmark curve) fields defined in "Common Components of Application Messages"*)
    f_IOI_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    f_IOI_YieldData : fix_yielddata
}
;;

(** The List Cancel Request message type is used by institutions wishing to cancel previously submitted lists either before or during execution.*)
type full_fix_listcancelrequest_data = {
    (** Unique identifier for list as assigned by institution, used to associate multiple individual orders. Uniqueness must be guaranteed within a single trading day. Firms which generate multi-day orders should consider embedding a date within the ListID field to assure uniqueness across days.*)
    f_ListCancelRequest_ListID : fix_string;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")
     Time this order request was initiated/released by the trader or trading system.*)
    f_ListCancelRequest_TransactTime : fix_utctimestamp;
    (** Used with Fixed Income for Muncipal New Issue Market. Agreement in principal between counter-parties prior to actual trade date.
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)
     (prior to FIX 4.4 field was of type UTCDate)*)
    f_ListCancelRequest_TradeOriginationDate : fix_localmktdate option;
    (** Indicates date of trade referenced in this message in YYYYMMDD format. Absence of this field indicates current day (expressed in local time at place of trade).*)
    f_ListCancelRequest_TradeDate : fix_localmktdate option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_ListCancelRequest_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_ListCancelRequest_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_ListCancelRequest_EncodedText : fix_string option
}
;;

(** The List Execute message type is used by institutions to instruct the broker to begin execution of a previously submitted list. This message may or may not be used, as it may be mirroring a phone conversation.*)
type full_fix_listexecute_data = {
    (** Unique identifier for list as assigned by institution, used to associate multiple individual orders. Uniqueness must be guaranteed within a single trading day. Firms which generate multi-day orders should consider embedding a date within the ListID field to assure uniqueness across days.
     Must be unique, by customer, for the day*)
    f_ListExecute_ListID : fix_string;
    (** Unique identifier for a Bid Request as assigned by institution. Uniqueness must be guaranteed within a single trading day.
     Used with BidType=Disclosed to provide the sell side the ability to determine the direction of the trade to execute.*)
    f_ListExecute_ClientBidID : fix_string option;
    (** Unique identifier for Bid Response as assigned by sell-side (broker, exchange, ECN). Uniqueness must be guaranteed within a single trading day.*)
    f_ListExecute_BidID : fix_string option;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")
     Time this order request was initiated/released by the trader or trading system.*)
    f_ListExecute_TransactTime : fix_utctimestamp;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_ListExecute_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_ListExecute_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_ListExecute_EncodedText : fix_string option
}
;;

(** The list status message is issued as the response to a List Status Request message sent in an unsolicited fashion by the sell-side. It indicates the current state of the orders within the list as they exist at the broker's site. This message may also be used to respond to the List Cancel Request.*)
type full_fix_liststatus_data = {
    (** Unique identifier for list as assigned by institution, used to associate multiple individual orders. Uniqueness must be guaranteed within a single trading day. Firms which generate multi-day orders should consider embedding a date within the ListID field to assure uniqueness across days.*)
    f_ListStatus_ListID : fix_string;
    (** Code to represent the status type*)
    f_ListStatus_ListStatusType : fix_liststatustype;
    (** Total number of reports within series.
     Total number of messages required to status complete list.*)
    f_ListStatus_NoRpts : int;
    (** Code to represent the status of a list order*)
    f_ListStatus_ListOrderStatus : fix_listorderstatus;
    (** Sequence number of message within report series.
     Sequence number of this report message.*)
    f_ListStatus_RptSeq : int;
    (** Free format text string related to List Status.*)
    f_ListStatus_ListStatusText : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedListStatusText (446) field.
     Must be set if EncodedListStatusText field is specified and must immediately precede it.*)
    f_ListStatus_EncodedListStatusTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the ListStatusText (444) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the ListStatusText field.
     Encoded (non-ASCII characters) representation of the ListStatusText field in the encoded format specified via the MessageEncoding field.*)
    f_ListStatus_EncodedListStatusText : fix_string option;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")*)
    f_ListStatus_TransactTime : fix_utctimestamp option;
    (** Total number of list order entries across all messages. Should be the sum of all NoOrders (73) in each message that has repeating list order entries related to the same ListID (66). Used to support fragmentation.
     (Prior to FIX 4.2 this field was named "ListNoOrds")
     Used to support fragmentation. Sum of NoOrders across all messages with the same ListID.*)
    f_ListStatus_TotNoOrders : int;
    (** Indicates whether this message is the last in a sequence of messages for those messages that support fragmentation, such as Allocation Instruction, Mass Quote, Security List, Derivative Security List
     Indicates whether this is the last fragment in a sequence of message fragments. Only required where message has been fragmented.*)
    f_ListStatus_LastFragment : fix_lastfragment option;
    (** Number of orders statused in this message, i.e. number of repeating groups to follow.*)
    f_ListStatus_OrdListStatGrp : fix_ordliststatgrp
}
;;

(** The list status request message type is used by institutions to instruct the broker to generate status messages for a list.*)
type full_fix_liststatusrequest_data = {
    (** Unique identifier for list as assigned by institution, used to associate multiple individual orders. Uniqueness must be guaranteed within a single trading day. Firms which generate multi-day orders should consider embedding a date within the ListID field to assure uniqueness across days.*)
    f_ListStatusRequest_ListID : fix_string;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_ListStatusRequest_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_ListStatusRequest_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_ListStatusRequest_EncodedText : fix_string option
}
;;

(** The strike price message is used to exchange strike price information for principal trades. It can also be used to exchange reference prices for agency trades.*)
type full_fix_liststrikeprice_data = {
    (** Unique identifier for list as assigned by institution, used to associate multiple individual orders. Uniqueness must be guaranteed within a single trading day. Firms which generate multi-day orders should consider embedding a date within the ListID field to assure uniqueness across days.*)
    f_ListStrikePrice_ListID : fix_string;
    (** Total number of strike price entries across all messages. Should be the sum of all NoStrikes (428) in each message that has repeating strike price entries related to the same ListID (66). Used to support fragmentation.
     Used to support fragmentation. Sum of NoStrikes across all messages with the same ListID.*)
    f_ListStrikePrice_TotNoStrikes : int;
    (** Indicates whether this message is the last in a sequence of messages for those messages that support fragmentation, such as Allocation Instruction, Mass Quote, Security List, Derivative Security List
     Indicates whether this is the last fragment in a sequence of message fragments. Only required where message has been fragmented.*)
    f_ListStrikePrice_LastFragment : fix_lastfragment option;
    (** Number of strike price entries*)
    f_ListStrikePrice_InstrmtStrkPxGrp : fix_instrmtstrkpxgrp;
    (** Number of underlyings*)
    f_ListStrikePrice_UndInstrmtStrkPxGrp : fix_undinstrmtstrkpxgrp
}
;;

(** The second Market Data message format is used for incremental updates.*)
type full_fix_marketdataincrementalrefresh_data = {
    (** Unique identifier for Market Data Request
     Conditionally required if this message is in response to a Market Data Request.*)
    f_MarketDataIncrementalRefresh_MDReqID : fix_string option;
    (** Number of entries following.*)
    f_MarketDataIncrementalRefresh_MDIncGrp : fix_mdincgrp;
    (** Current number of application messages that were queued at the time that the message was created by the counterparty.
     Depth of application messages queued for transmission as of delivery of this message*)
    f_MarketDataIncrementalRefresh_ApplQueueDepth : int option;
    (** Resolution taken when ApplQueueDepth (813) exceeds ApplQueueMax (812) or system specified maximum queue size.
     Action taken to resolve application queuing*)
    f_MarketDataIncrementalRefresh_ApplQueueResolution : fix_applqueueresolution option
}
;;

(** Some systems allow the transmission of real-time quote, order, trade, trade volume, open interest, and/or other price information on a subscription basis. A Market Data Request is a general request for market data on specific securities or forex quotes.*)
type full_fix_marketdatarequest_data = {
    (** Unique identifier for Market Data Request
     Must be unique, or the ID of previous Market Data Request to disable if SubscriptionRequestType = Disable previous Snapshot + Updates Request (2).*)
    f_MarketDataRequest_MDReqID : fix_string;
    (** Subscription Request Type
     SubcriptionRequestType indicates to the other party what type of response is expected. A snapshot request only asks for current information. A subscribe request asks for updates as the status changes. Unsubscribe will cancel any future update messages from the counter party.*)
    f_MarketDataRequest_SubscriptionRequestType : fix_subscriptionrequesttype;
    (** Depth of market for Book Snapshot*)
    f_MarketDataRequest_MarketDepth : int;
    (** Specifies the type of Market Data update
     Required if SubscriptionRequestType = Snapshot + Updates (1).*)
    f_MarketDataRequest_MDUpdateType : fix_mdupdatetype option;
    (** Specifies whether or not book entries should be aggregated.*)
    f_MarketDataRequest_AggregatedBook : fix_aggregatedbook option;
    (** Flag that identifies a market data entry
     (Prior to FIX 4.3 this field was of type char)
     Can be used to clarify a request if MDEntryType = Opening Price(4), Closing Price(5), or Settlement Price(6).*)
    f_MarketDataRequest_OpenCloseSettlFlag : fix_openclosesettlflag option;
    (** Defines the scope of a data element
     Defines the scope(s) of the request*)
    f_MarketDataRequest_Scope : fix_scope option;
    (** Defines how a server handles distribution of a truncated book. Defaults to broker option.
     Can be used when MarketDepth >= 2 and MDUpdateType = Incremental Refresh(1).*)
    f_MarketDataRequest_MDImplicitDelete : fix_mdimplicitdelete option;
    (** Number of MDEntryType fields requested.*)
    f_MarketDataRequest_MDReqGrp : fix_mdreqgrp;
    (** Number of symbols (instruments) requested.*)
    f_MarketDataRequest_InstrmtMDReqGrp : fix_instrmtmdreqgrp;
    (** Number of trading sessions for which the request is valid.*)
    f_MarketDataRequest_TrdgSesGrp : fix_trdgsesgrp;
    (** Action to take to resolve an application message queue (backlog).
     Action to take if application level queuing exists*)
    f_MarketDataRequest_ApplQueueAction : fix_applqueueaction option;
    (** Used to specify the maximum number of application messages that can be queued bedore a corrective action needs to take place to resolve the queuing issue.
     Maximum application queue depth that must be exceeded before queuing action is taken.*)
    f_MarketDataRequest_ApplQueueMax : int option
}
;;

(** The Market Data Request Reject is used when the broker cannot honor the Market Data Request, due to business or technical reasons.*)
type full_fix_marketdatarequestreject_data = {
    (** Unique identifier for Market Data Request
     Must refer to the MDReqID of the request.*)
    f_MarketDataRequestReject_MDReqID : fix_string;
    (** Reason for the rejection of a Market Data request*)
    f_MarketDataRequestReject_MDReqRejReason : fix_mdreqrejreason option;
    f_MarketDataRequestReject_MDRjctGrp : fix_mdrjctgrp;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_MarketDataRequestReject_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_MarketDataRequestReject_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_MarketDataRequestReject_EncodedText : fix_string option
}
;;

(** The Market Data messages are used as the response to a Market Data Request message.*)
type full_fix_marketdatasnapshotfullrefresh_data = {
    (** Unique identifier for Market Data Request
     Conditionally required if this message is in response to a Market Data Request.*)
    f_MarketDataSnapshotFullRefresh_MDReqID : fix_string option;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_MarketDataSnapshotFullRefresh_Instrument : fix_instrument;
    (** Number of underlyings*)
    f_MarketDataSnapshotFullRefresh_UndInstrmtGrp : fix_undinstrmtgrp;
    (** Required for multileg quotes*)
    f_MarketDataSnapshotFullRefresh_InstrmtLegGrp : fix_instrmtleggrp;
    (** Identifies a firm’s financial status*)
    f_MarketDataSnapshotFullRefresh_FinancialStatus : fix_financialstatus option;
    (** Identifies the type of Corporate Action*)
    f_MarketDataSnapshotFullRefresh_CorporateAction : fix_corporateaction option;
    (** Net change from previous day’s closing price vs. last traded price.*)
    f_MarketDataSnapshotFullRefresh_NetChgPrevDay : fix_float option;
    (** Number of entries following.*)
    f_MarketDataSnapshotFullRefresh_MDFullGrp : fix_mdfullgrp;
    (** Current number of application messages that were queued at the time that the message was created by the counterparty.
     Depth of application messages queued for transmission as of delivery of this message*)
    f_MarketDataSnapshotFullRefresh_ApplQueueDepth : int option;
    (** Resolution taken when ApplQueueDepth (813) exceeds ApplQueueMax (812) or system specified maximum queue size.
     Action taken to resolve application queuing*)
    f_MarketDataSnapshotFullRefresh_ApplQueueResolution : fix_applqueueresolution option
}
;;

(** The Mass Quote message can contain quotes for multiple securities to support applications that allow for the mass quoting of an option series.*)
type full_fix_massquote_data = {
    (** Unique identifier for quote request
     Required when quote is in response to a Quote Request message*)
    f_MassQuote_QuoteReqID : fix_string option;
    (** Unique identifier for quote*)
    f_MassQuote_QuoteID : fix_string;
    (** Identifies the type of quote.
     An indicative quote is used to inform a counterparty of a market. An indicative quote does not result directly in a trade.
     A tradeable quote is submitted to a market and will result directly in a trade against other orders and quotes in a market.
     A restricted tradeable quote is submitted to a market and within a certain restriction (possibly based upon price or quantity) will automatically trade against orders. Order that do not comply with restrictions are sent to the quote issuer who can choose to accept or decline the order.
     A counter quote is used in the negotiation model. See Volume 7 – Product: Fixed Income for example usage.
     Type of Quote
     Default is Indicative if not specified*)
    f_MassQuote_QuoteType : fix_quotetype option;
    (** Level of Response requested from receiver of quote messages.
     Level of Response requested from receiver of quote messages.*)
    f_MassQuote_QuoteResponseLevel : fix_quoteresponselevel option;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_MassQuote_Parties : fix_parties;
    (** Account mnemonic as agreed between buy and sell sides, e.g. broker and institution or investor/intermediary and fund manager.*)
    f_MassQuote_Account : fix_string option;
    (** Used to identify the source of the Account (1) code. This is especially useful if the account is a new account that the Respondent may not have setup yet in their system.*)
    f_MassQuote_AcctIDSource : fix_acctidsource option;
    (** Type of account associated with an order
     Type of account associated with the order (Origin)*)
    f_MassQuote_AccountType : fix_accounttype option;
    (** Default Bid Size.
     Default Bid Size for quote contained within this quote message - if not explicitly provided.*)
    f_MassQuote_DefBidSize : fix_float option;
    (** Default Offer Size.
     Default Offer Size for quotes contained within this quote message - if not explicitly provided.*)
    f_MassQuote_DefOfferSize : fix_float option;
    (** The number of sets of quotes in the message*)
    f_MassQuote_QuotSetGrp : fix_quotsetgrp
}
;;

(** Mass Quote Acknowledgement is used as the application level response to a Mass Quote message.*)
type full_fix_massquoteacknowledgement_data = {
    (** Unique identifier for quote request
     Required when acknowledgment is in response to a Quote Request message*)
    f_MassQuoteAcknowledgement_QuoteReqID : fix_string option;
    (** Unique identifier for quote
     Required when acknowledgment is in response to a Quote message*)
    f_MassQuoteAcknowledgement_QuoteID : fix_string option;
    (** Identifies the status of the quote acknowledgement
     Status of the mass quote acknowledgement.*)
    f_MassQuoteAcknowledgement_QuoteStatus : fix_quotestatus;
    (** Reason Quote was rejected
     Reason Quote was rejected.*)
    f_MassQuoteAcknowledgement_QuoteRejectReason : fix_quoterejectreason option;
    (** Level of Response requested from receiver of quote messages.
     Level of Response requested from receiver of quote messages. Is echoed back to the counterparty.*)
    f_MassQuoteAcknowledgement_QuoteResponseLevel : fix_quoteresponselevel option;
    (** Identifies the type of quote.
     An indicative quote is used to inform a counterparty of a market. An indicative quote does not result directly in a trade.
     A tradeable quote is submitted to a market and will result directly in a trade against other orders and quotes in a market.
     A restricted tradeable quote is submitted to a market and within a certain restriction (possibly based upon price or quantity) will automatically trade against orders. Order that do not comply with restrictions are sent to the quote issuer who can choose to accept or decline the order.
     A counter quote is used in the negotiation model. See Volume 7 – Product: Fixed Income for example usage.
     Type of Quote*)
    f_MassQuoteAcknowledgement_QuoteType : fix_quotetype option;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_MassQuoteAcknowledgement_Parties : fix_parties;
    (** Account mnemonic as agreed between buy and sell sides, e.g. broker and institution or investor/intermediary and fund manager.*)
    f_MassQuoteAcknowledgement_Account : fix_string option;
    (** Used to identify the source of the Account (1) code. This is especially useful if the account is a new account that the Respondent may not have setup yet in their system.*)
    f_MassQuoteAcknowledgement_AcctIDSource : fix_acctidsource option;
    (** Type of account associated with an order
     Type of account associated with the order (Origin)*)
    f_MassQuoteAcknowledgement_AccountType : fix_accounttype option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_MassQuoteAcknowledgement_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.*)
    f_MassQuoteAcknowledgement_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.*)
    f_MassQuoteAcknowledgement_EncodedText : fix_string option;
    (** The number of sets of quotes in the message*)
    f_MassQuoteAcknowledgement_QuotSetAckGrp : fix_quotsetackgrp
}
;;

(** Used to modify a multileg order previously submitted using the New Order - Multileg message. See Order Cancel Replace Request for details concerning message usage.*)
type full_fix_multilegordercancelreplace_data = {
    (** Unique identifier for Order as assigned by sell-side (broker, exchange, ECN). Uniqueness must be guaranteed within a single trading day. Firms which accept multi-day orders should consider embedding a date within the OrderID field to assure uniqueness across days.
     Unique identifier of most recent order as assigned by sell-side (broker, exchange, ECN).*)
    f_MultilegOrderCancelReplace_OrderID : fix_string option;
    (** ClOrdID () of the previous order (NOT the initial order of the day) as assigned by the institution, used to identify the previous order in cancel and cancel/replace requests.
     ClOrdID of the previous order (NOT the initial order of the day) when canceling or replacing an order.*)
    f_MultilegOrderCancelReplace_OrigClOrdID : fix_string;
    (** Unique identifier for Order as assigned by the buy-side (institution, broker, intermediary etc.) (identified by SenderCompID (49) or OnBehalfOfCompID (5) as appropriate). Uniqueness must be guaranteed within a single trading day. Firms, particularly those which electronically submit multi-day orders, trade globally or throughout market close periods, should ensure uniqueness across days, for example by embedding a date within the ClOrdID field.
     Unique identifier of replacement order as assigned by institution or by the intermediary with closest association with the investor.. Note that this identifier will be used in ClOrdID field of the Cancel Reject message if the replacement request is rejected.*)
    f_MultilegOrderCancelReplace_ClOrdID : fix_string;
    (** Assigned by the party which originates the order. Can be used to provide the ClOrdID (11) used by an exchange or executing system.*)
    f_MultilegOrderCancelReplace_SecondaryClOrdID : fix_string option;
    (** Permits order originators to tie together groups of orders in which trades resulting from orders are associated for a specific purpose, for example the calculation of average execution price for a customer or to associate lists submitted to a broker as waves of a larger program trade.*)
    f_MultilegOrderCancelReplace_ClOrdLinkID : fix_string option;
    (** The most recent (or current) modification TransactTime (tag 60) reported on an Execution Report for the order.
     The OrigOrdModTime is provided as an optional field on Order Cancel Request and Order Cancel Replace Requests to identify that the state of the order has not changed since the request was issued.
     This is provided to support markets similar to Eurex and A/C/E.*)
    f_MultilegOrderCancelReplace_OrigOrdModTime : fix_utctimestamp option;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_MultilegOrderCancelReplace_Parties : fix_parties;
    (** Used with Fixed Income for Muncipal New Issue Market. Agreement in principal between counter-parties prior to actual trade date.
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)
     (prior to FIX 4.4 field was of type UTCDate)*)
    f_MultilegOrderCancelReplace_TradeOriginationDate : fix_localmktdate option;
    (** Indicates date of trade referenced in this message in YYYYMMDD format. Absence of this field indicates current day (expressed in local time at place of trade).*)
    f_MultilegOrderCancelReplace_TradeDate : fix_localmktdate option;
    (** Account mnemonic as agreed between buy and sell sides, e.g. broker and institution or investor/intermediary and fund manager.*)
    f_MultilegOrderCancelReplace_Account : fix_string option;
    (** Used to identify the source of the Account (1) code. This is especially useful if the account is a new account that the Respondent may not have setup yet in their system.*)
    f_MultilegOrderCancelReplace_AcctIDSource : fix_acctidsource option;
    (** Type of account associated with an order*)
    f_MultilegOrderCancelReplace_AccountType : fix_accounttype option;
    (** Indicates whether or not automatic booking can occur.*)
    f_MultilegOrderCancelReplace_DayBookingInst : fix_daybookinginst option;
    (** Indicates what constitutes a bookable unit.*)
    f_MultilegOrderCancelReplace_BookingUnit : fix_bookingunit option;
    (** Indicates the method of preallocation.*)
    f_MultilegOrderCancelReplace_PreallocMethod : fix_preallocmethod option;
    (** Unique identifier for allocation message.
     (Prior to FIX 4.1 this field was of type int)
     Used to assign an identifier to the block of individual preallocations*)
    f_MultilegOrderCancelReplace_AllocID : fix_string option;
    (** Number of repeating groups for pre-trade allocation*)
    f_MultilegOrderCancelReplace_PreAllocMlegGrp : fix_preallocmleggrp;
    (** Indicates order settlement period. If present, SettlDate (64) overrides this field. If both SettlType (63) and SettDate (64) are omitted, the default for SettlType (63) is 0 (Regular)
     Regular is defined as the default settlement period for the particular security on the exchange of execution.
     In Fixed Income the contents of this field may influence the instrument definition if the SecurityID (48) is ambiguous. In the US an active Treasury offering may be re-opened, and for a time one CUSIP will apply to both the current and "when-issued" securities. Supplying a value of "7" clarifies the instrument description; any other value or the absence of this field should cause the respondent to default to the active issue.*)
    f_MultilegOrderCancelReplace_SettlType : fix_settltype option;
    (** Specific date of trade settlement (SettlementDate) in YYYYMMDD format.
     If present, this field overrides SettlType (63). This field is required if the value of SettlType (63) is 6 (Future) or 8 (Sellers Option). This field must be omitted if the value of SettlType (63) is 7 (When and If Issued)
     (expressed in local time at place of settlement)
     Takes precedence over SettlType value and conditionally required/omitted for specific SettlType values.*)
    f_MultilegOrderCancelReplace_SettlDate : fix_localmktdate option;
    (** Identifies whether an order is a margin order or a non-margin order. This is primarily used when sending orders to Japanese exchanges to indicate sell margin or buy to cover. The same tag could be assigned also by buy-side to indicate the intent to sell or buy margin and the sell-side to accept or reject (base on some validation criteria) the margin request.*)
    f_MultilegOrderCancelReplace_CashMargin : fix_cashmargin option;
    (** Indicates type of fee being assessed of the customer for trade executions at an exchange. Applicable for futures markets only at this time.
     (Values source CBOT, CME, NYBOT, and NYMEX):*)
    f_MultilegOrderCancelReplace_ClearingFeeIndicator : fix_clearingfeeindicator option;
    (** Instructions for order handling on Broker trading floor*)
    f_MultilegOrderCancelReplace_HandlInst : fix_handlinst option;
    (** Instructions for order handling on exchange trading floor. If more than one instruction is applicable to an order, this field can contain multiple instructions separated by space.
     Can contain multiple instructions, space delimited. If OrdType=P, exactly one of the following values (ExecInst = L, R, M, P, O, T, or W) must be specified.*)
    f_MultilegOrderCancelReplace_ExecInst : fix_execinst option;
    (** Minimum quantity of an order to be executed.
     (Prior to FIX 4.2 this field was of type int)*)
    f_MultilegOrderCancelReplace_MinQty : fix_float option;
    (** Maximum quantity (e.g. number of shares) within an order to be shown on the exchange floor at any given time.
     (Prior to FIX 4.2 this field was of type int)*)
    f_MultilegOrderCancelReplace_MaxFloor : fix_float option;
    (** Execution destination as defined by institution when order is entered.
     Valid values:
     See "Appendix 6-C"*)
    f_MultilegOrderCancelReplace_ExDestination : fix_exchange option;
    (** Specifies the number of repeating TradingSessionIDs*)
    f_MultilegOrderCancelReplace_TrdgSesGrp : fix_trdgsesgrp;
    (** Processing code for sub-account. Absence of this field in AllocAccount (79) / AllocPrice (366) /AllocQty (80) / ProcessCode instance indicates regular trade.
     Used to identify soft trades at order entry.*)
    f_MultilegOrderCancelReplace_ProcessCode : fix_processcode option;
    (** Side of order
     Additional enumeration that indicates this is an order for a multileg order and that the sides are specified in the Instrument Leg component block.*)
    f_MultilegOrderCancelReplace_Side : fix_side;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"
     SecurityType[167] = "MLEG"
     CFICode should be set to the type of multileg product, such as "O" - options, "F" - Future or Swap.*)
    f_MultilegOrderCancelReplace_Instrument : fix_instrument;
    (** Number of underlyings*)
    f_MultilegOrderCancelReplace_UndInstrmtGrp : fix_undinstrmtgrp;
    (** Previous closing price of security.
     Useful for verifying security identification*)
    f_MultilegOrderCancelReplace_PrevClosePx : fix_float option;
    (** Number of legs
     Can be zero (e.g. standardized multileg instrument such as an Option strategy) - must be provided even if zero*)
    f_MultilegOrderCancelReplace_LegOrdGrp : fix_legordgrp;
    (** Indicates whether the broker is to locate the stock in conjunction with a short sell order.
     Required for short sell orders*)
    f_MultilegOrderCancelReplace_LocateReqd : fix_locatereqd option;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")
     Time this order request was initiated/released by the trader, trading system, or intermediary.*)
    f_MultilegOrderCancelReplace_TransactTime : fix_utctimestamp;
    (** Type of quantity specified in a quantity field*)
    f_MultilegOrderCancelReplace_QtyType : fix_qtytype option;
    (** Insert here the set of "OrderQtyData" fields defined in "Common Components of Application Messages"*)
    f_MultilegOrderCancelReplace_OrderQtyData : fix_orderqtydata;
    (** Order type
     *** SOME VALUES ARE NO LONGER USED - See "Deprecated (Phased-out) Features and Supported Approach" ***
     (see Volume : "Glossary" for value definitions)*)
    f_MultilegOrderCancelReplace_OrdType : fix_ordtype;
    (** Code to represent the price type*)
    f_MultilegOrderCancelReplace_PriceType : fix_pricetype option;
    (** Price per unit of quantity (e.g. per share)
     Required for limit OrdTypes. For F/X orders, should be the "all-in" rate (spot rate adjusted for forward points). Can be used to specify a limit price for a pegged order, previously indicated, etc.*)
    f_MultilegOrderCancelReplace_Price : fix_float option;
    (** Price per unit of quantity (e.g. per share)
     Required for OrdType = "Stop" or OrdType = "Stop limit".*)
    f_MultilegOrderCancelReplace_StopPx : fix_float option;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.*)
    f_MultilegOrderCancelReplace_Currency : fix_currency option;
    (** ID used to represent this transaction for compliance purposes (e.g. OATS reporting).*)
    f_MultilegOrderCancelReplace_ComplianceID : fix_string option;
    (** Indicates whether or not the order was solicited.*)
    f_MultilegOrderCancelReplace_SolicitedFlag : fix_solicitedflag option;
    (** Unique identifier of IOI message.
     (Prior to FIX 4.1 this field was of type int)
     Required for Previously Indicated Orders (OrdType=E)*)
    f_MultilegOrderCancelReplace_IOIID : fix_string option;
    (** Unique identifier for quote
     Required for Previously Quoted Orders (OrdType=D)*)
    f_MultilegOrderCancelReplace_QuoteID : fix_string option;
    (** Specifies how long the order remains in effect. Absence of this field is interpreted as DAY.
     Absence of this field indicates Day order*)
    f_MultilegOrderCancelReplace_TimeInForce : fix_timeinforce option;
    (** Time the details within the message should take effect (always expressed in UTC (Universal Time Coordinated, also known as "GMT")
     Can specify the time at which the order should be considered valid*)
    f_MultilegOrderCancelReplace_EffectiveTime : fix_utctimestamp option;
    (** Date of order expiration (last day the order can trade), always expressed in terms of the local market date. The time at which the order expires is determined by the local market’s business practices
     Conditionally required if TimeInForce = GTD and ExpireTime is not specified.*)
    f_MultilegOrderCancelReplace_ExpireDate : fix_localmktdate option;
    (** Time/Date of order expiration (always expressed in UTC (Universal Time Coordinated, also known as "GMT")
     The meaning of expiration is specific to the context where the field is used.
     For orders, this is the expiration time of a Good Til Date TimeInForce.
     For Quotes - this is the expiration of the quote.
     Expiration time is provided across the quote message dialog to control the length of time of the overall quoting process.
     For collateral requests, this is the time by which collateral must be assigned.
     For collateral assignments, this is the time by which a response to the assignment is expected.
     Conditionally required if TimeInForce = GTD and ExpireDate is not specified.*)
    f_MultilegOrderCancelReplace_ExpireTime : fix_utctimestamp option;
    (** Code to identify whether to book out executions on a part-filled GT order on the day of execution or to accumulate
     States whether executions are booked out or accumulated on a partially filled GT order*)
    f_MultilegOrderCancelReplace_GTBookingInst : fix_gtbookinginst option;
    (** Insert here the set of "CommissionData" fields defined in "Common Components of Application Messages"*)
    f_MultilegOrderCancelReplace_CommissionData : fix_commissiondata;
    (** Designates the capacity of the firm placing the order
     (as of FIX 4.3, this field replaced Rule80A (tag 47) --used in conjunction with OrderRestrictions (529) field)
     (see Volume : "Glossary" for value definitions)*)
    f_MultilegOrderCancelReplace_OrderCapacity : fix_ordercapacity option;
    (** Restrictions associated with an order. If more than one restriction is applicable to an order, this field can contain multiple instructions separated by space.*)
    f_MultilegOrderCancelReplace_OrderRestrictions : fix_orderrestrictions option;
    (** Capacity of customer placing the order
     Primarily used by futures exchanges to indicate the CTICode (customer type indicator) as required by the US CFTC (Commodity Futures Trading Commission).*)
    f_MultilegOrderCancelReplace_CustOrderCapacity : fix_custordercapacity option;
    (** Indicates request for forex accommodation trade to be executed along with security transaction.
     Indicates that broker is requested to execute a Forex accommodation trade in conjunction with the security trade.*)
    f_MultilegOrderCancelReplace_ForexReq : fix_forexreq option;
    (** Currency code of settlement denomination.
     Required if ForexReq = Y.*)
    f_MultilegOrderCancelReplace_SettlCurrency : fix_currency option;
    (** Method for booking out this order. Used when notifying a broker that an order to be settled by that broker is to be booked out as an OTC derivative (e.g. CFD or similar).
     Method for booking out this order. Used when notifying a broker that an order to be settled by that broker is to be booked out as an OTC derivative (e.g. CFD or similar). Absence of this field implies regular booking.*)
    f_MultilegOrderCancelReplace_BookingType : fix_bookingtype option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_MultilegOrderCancelReplace_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_MultilegOrderCancelReplace_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_MultilegOrderCancelReplace_EncodedText : fix_string option;
    (** Indicates whether the resulting position after a trade should be an opening position or closing position. Used for omnibus accounting - where accounts are held on a gross basis instead of being netted together.
     For use in derivatives omnibus accounting*)
    f_MultilegOrderCancelReplace_PositionEffect : fix_positioneffect option;
    (** Used for derivative products, such as options
     For use with derivatives, such as options*)
    f_MultilegOrderCancelReplace_CoveredOrUncovered : fix_coveredoruncovered option;
    (** Maximum quantity (e.g. number of shares) within an order to be shown to other customers (i.e. sent via an IOI).
     (Prior to FIX 4.2 this field was of type int)*)
    f_MultilegOrderCancelReplace_MaxShow : fix_float option;
    (** Insert here the set of "PegInstruction" fields defined in "Common Components of Application Messages"*)
    f_MultilegOrderCancelReplace_PegInstructions : fix_peginstructions;
    (** Insert here the set of "DiscretionInstruction" fields defined in "Common Components of Application Messages"*)
    f_MultilegOrderCancelReplace_DiscretionInstructions : fix_discretioninstructions;
    (** The target strategy of the order
     1000+ = Reserved and available for bi-laterally agreed upon user defined values
     The target strategy of the order*)
    f_MultilegOrderCancelReplace_TargetStrategy : fix_targetstrategy option;
    (** Field to allow further specification of the TargetStrategy – usage to be agreed between counterparties
     For further specification of the TargetStrategy*)
    f_MultilegOrderCancelReplace_TargetStrategyParameters : fix_string option;
    (** For a TargetStrategy=Participate order specifies the target particpation rate. For other order types this is a volume limit (i.e. do not be more than this percent of the market volume)
     Mandatory for a TargetStrategy=Participate order and specifies the target particpation rate.
     For other order types optionally specifies a volume limit (i.e. do not be more than this percent of the market volume)*)
    f_MultilegOrderCancelReplace_ParticipationRate : fix_float option;
    (** For CIV – A one character code identifying whether Cancellation rights/Cooling off period applies
     For CIV - Optional*)
    f_MultilegOrderCancelReplace_CancellationRights : fix_cancellationrights option;
    (** A one character code identifying Money laundering status*)
    f_MultilegOrderCancelReplace_MoneyLaunderingStatus : fix_moneylaunderingstatus option;
    (** Unique identifier of the registration details as assigned by institution or intermediary.
     Reference to Registration Instructions message for this Order.*)
    f_MultilegOrderCancelReplace_RegistID : fix_string option;
    (** Free format text defining the designation to be associated with a holding on the register. Used to identify assets of a specific underlying investor using a common registration, e.g. a broker’s nominee or street name.
     Supplementary registration information for this Order*)
    f_MultilegOrderCancelReplace_Designation : fix_string option;
    (** Indicates the method of execution reporting requested by issuer of the order
     Indicates the method of execution reporting requested by issuer of the order.*)
    f_MultilegOrderCancelReplace_MultiLegRptTypeReq : fix_multilegrpttypereq option
}
;;

(** Used to submit a cross order into a market. The cross order contains two order sides (a buy and a sell).*)
type full_fix_newordercross_data = {
    (** Identifier for a cross order. Must be unique during a given trading day. Recommend that firms use the order date as part of the CrossID for Good Till Cancel (GT) orders.*)
    f_NewOrderCross_CrossID : fix_string;
    (** Type of cross being submitted to a market*)
    f_NewOrderCross_CrossType : fix_crosstype;
    (** Indicates if one side or the other of a cross order should be prioritized.
     The definition of prioritization is left to the market. In some markets prioritization means which side of the cross order is applied to the market first. In other markets – prioritization may mean that the prioritized side is fully executed (sometimes referred to as the side being protected).*)
    f_NewOrderCross_CrossPrioritization : fix_crossprioritization;
    (** Must be 1 or 2
     1 or 2 if CrossType=1
     2 otherwise*)
    f_NewOrderCross_SideCrossOrdModGrp : fix_sidecrossordmodgrp;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_NewOrderCross_Instrument : fix_instrument;
    (** Number of underlyings*)
    f_NewOrderCross_UndInstrmtGrp : fix_undinstrmtgrp;
    (** Number of Legs*)
    f_NewOrderCross_InstrmtLegGrp : fix_instrmtleggrp;
    (** Indicates order settlement period. If present, SettlDate (64) overrides this field. If both SettlType (63) and SettDate (64) are omitted, the default for SettlType (63) is 0 (Regular)
     Regular is defined as the default settlement period for the particular security on the exchange of execution.
     In Fixed Income the contents of this field may influence the instrument definition if the SecurityID (48) is ambiguous. In the US an active Treasury offering may be re-opened, and for a time one CUSIP will apply to both the current and "when-issued" securities. Supplying a value of "7" clarifies the instrument description; any other value or the absence of this field should cause the respondent to default to the active issue.*)
    f_NewOrderCross_SettlType : fix_settltype option;
    (** Specific date of trade settlement (SettlementDate) in YYYYMMDD format.
     If present, this field overrides SettlType (63). This field is required if the value of SettlType (63) is 6 (Future) or 8 (Sellers Option). This field must be omitted if the value of SettlType (63) is 7 (When and If Issued)
     (expressed in local time at place of settlement)
     Takes precedence over SettlType value and conditionally required/omitted for specific SettlType values.*)
    f_NewOrderCross_SettlDate : fix_localmktdate option;
    (** Instructions for order handling on Broker trading floor*)
    f_NewOrderCross_HandlInst : fix_handlinst option;
    (** Instructions for order handling on exchange trading floor. If more than one instruction is applicable to an order, this field can contain multiple instructions separated by space.
     Can contain multiple instructions, space delimited. If OrdType=P, exactly one of the following values (ExecInst = L, R, M, P, O, T, or W) must be specified.*)
    f_NewOrderCross_ExecInst : fix_execinst option;
    (** Minimum quantity of an order to be executed.
     (Prior to FIX 4.2 this field was of type int)*)
    f_NewOrderCross_MinQty : fix_float option;
    (** Maximum quantity (e.g. number of shares) within an order to be shown on the exchange floor at any given time.
     (Prior to FIX 4.2 this field was of type int)*)
    f_NewOrderCross_MaxFloor : fix_float option;
    (** Execution destination as defined by institution when order is entered.
     Valid values:
     See "Appendix 6-C"*)
    f_NewOrderCross_ExDestination : fix_exchange option;
    (** Specifies the number of repeating TradingSessionIDs*)
    f_NewOrderCross_TrdgSesGrp : fix_trdgsesgrp;
    (** Processing code for sub-account. Absence of this field in AllocAccount (79) / AllocPrice (366) /AllocQty (80) / ProcessCode instance indicates regular trade.
     Used to identify soft trades at order entry.*)
    f_NewOrderCross_ProcessCode : fix_processcode option;
    (** Previous closing price of security.
     Useful for verifying security identification*)
    f_NewOrderCross_PrevClosePx : fix_float option;
    (** Indicates whether the broker is to locate the stock in conjunction with a short sell order.
     Required for short sell orders*)
    f_NewOrderCross_LocateReqd : fix_locatereqd option;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")
     Time this order request was initiated/released by the trader, trading system, or intermediary.*)
    f_NewOrderCross_TransactTime : fix_utctimestamp;
    (** Insert here the set of "Stipulations" (repeating group of Fixed Income stipulations) fields defined in "Common Components of Application Messages"*)
    f_NewOrderCross_Stipulations : fix_stipulations;
    (** Order type
     *** SOME VALUES ARE NO LONGER USED - See "Deprecated (Phased-out) Features and Supported Approach" ***
     (see Volume : "Glossary" for value definitions)*)
    f_NewOrderCross_OrdType : fix_ordtype;
    (** Code to represent the price type*)
    f_NewOrderCross_PriceType : fix_pricetype option;
    (** Price per unit of quantity (e.g. per share)
     Required for limit OrdTypes. For F/X orders, should be the "all-in" rate (spot rate adjusted for forward points). Can be used to specify a limit price for a pegged order, previously indicated, etc.*)
    f_NewOrderCross_Price : fix_float option;
    (** Price per unit of quantity (e.g. per share)
     Required for OrdType = "Stop" or OrdType = "Stop limit".*)
    f_NewOrderCross_StopPx : fix_float option;
    (** Insert here the set of "SpreadOrBenchmarkCurveData" (Fixed Income spread or benchmark curve) fields defined in "Common Components of Application Messages"*)
    f_NewOrderCross_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    (** Insert here the set of "YieldData" (yield-related) fields defined in "Common Components of Application Messages"*)
    f_NewOrderCross_YieldData : fix_yielddata;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.*)
    f_NewOrderCross_Currency : fix_currency option;
    (** ID used to represent this transaction for compliance purposes (e.g. OATS reporting).*)
    f_NewOrderCross_ComplianceID : fix_string option;
    (** Unique identifier of IOI message.
     (Prior to FIX 4.1 this field was of type int)
     Required for Previously Indicated Orders (OrdType=E)*)
    f_NewOrderCross_IOIID : fix_string option;
    (** Unique identifier for quote
     Required for Previously Quoted Orders (OrdType=D)*)
    f_NewOrderCross_QuoteID : fix_string option;
    (** Specifies how long the order remains in effect. Absence of this field is interpreted as DAY.
     Absence of this field indicates Day order*)
    f_NewOrderCross_TimeInForce : fix_timeinforce option;
    (** Time the details within the message should take effect (always expressed in UTC (Universal Time Coordinated, also known as "GMT")
     Can specify the time at which the order should be considered valid*)
    f_NewOrderCross_EffectiveTime : fix_utctimestamp option;
    (** Date of order expiration (last day the order can trade), always expressed in terms of the local market date. The time at which the order expires is determined by the local market’s business practices
     Conditionally required if TimeInForce = GTD and ExpireTime is not specified.*)
    f_NewOrderCross_ExpireDate : fix_localmktdate option;
    (** Time/Date of order expiration (always expressed in UTC (Universal Time Coordinated, also known as "GMT")
     The meaning of expiration is specific to the context where the field is used.
     For orders, this is the expiration time of a Good Til Date TimeInForce.
     For Quotes - this is the expiration of the quote.
     Expiration time is provided across the quote message dialog to control the length of time of the overall quoting process.
     For collateral requests, this is the time by which collateral must be assigned.
     For collateral assignments, this is the time by which a response to the assignment is expected.
     Conditionally required if TimeInForce = GTD and ExpireDate is not specified.*)
    f_NewOrderCross_ExpireTime : fix_utctimestamp option;
    (** Code to identify whether to book out executions on a part-filled GT order on the day of execution or to accumulate
     States whether executions are booked out or accumulated on a partially filled GT order*)
    f_NewOrderCross_GTBookingInst : fix_gtbookinginst option;
    (** Maximum quantity (e.g. number of shares) within an order to be shown to other customers (i.e. sent via an IOI).
     (Prior to FIX 4.2 this field was of type int)*)
    f_NewOrderCross_MaxShow : fix_float option;
    (** Insert here the set of "PegInstruction" fields defined in "Common Components of Application Messages"*)
    f_NewOrderCross_PegInstructions : fix_peginstructions;
    (** Insert here the set of "DiscretionInstruction" fields defined in "Common Components of Application Messages"*)
    f_NewOrderCross_DiscretionInstructions : fix_discretioninstructions;
    (** The target strategy of the order
     1000+ = Reserved and available for bi-laterally agreed upon user defined values
     The target strategy of the order*)
    f_NewOrderCross_TargetStrategy : fix_targetstrategy option;
    (** Field to allow further specification of the TargetStrategy – usage to be agreed between counterparties
     For further specification of the TargetStrategy*)
    f_NewOrderCross_TargetStrategyParameters : fix_string option;
    (** For a TargetStrategy=Participate order specifies the target particpation rate. For other order types this is a volume limit (i.e. do not be more than this percent of the market volume)
     Mandatory for a TargetStrategy=Participate order and specifies the target particpation rate.
     For other order types optionally specifies a volume limit (i.e. do not be more than this percent of the market volume)*)
    f_NewOrderCross_ParticipationRate : fix_float option;
    (** For CIV – A one character code identifying whether Cancellation rights/Cooling off period applies
     For CIV - Optional*)
    f_NewOrderCross_CancellationRights : fix_cancellationrights option;
    (** A one character code identifying Money laundering status*)
    f_NewOrderCross_MoneyLaunderingStatus : fix_moneylaunderingstatus option;
    (** Unique identifier of the registration details as assigned by institution or intermediary.
     Reference to Registration Instructions message for this Order.*)
    f_NewOrderCross_RegistID : fix_string option;
    (** Free format text defining the designation to be associated with a holding on the register. Used to identify assets of a specific underlying investor using a common registration, e.g. a broker’s nominee or street name.
     Supplementary registration information for this Order*)
    f_NewOrderCross_Designation : fix_string option
}
;;

(** The NewOrderList Message can be used in one of two ways depending on which market conventions are being followed.*)
type full_fix_neworderlist_data = {
    (** Unique identifier for list as assigned by institution, used to associate multiple individual orders. Uniqueness must be guaranteed within a single trading day. Firms which generate multi-day orders should consider embedding a date within the ListID field to assure uniqueness across days.
     Must be unique, by customer, for the day*)
    f_NewOrderList_ListID : fix_string;
    (** Unique identifier for Bid Response as assigned by sell-side (broker, exchange, ECN). Uniqueness must be guaranteed within a single trading day.
     Should refer to an earlier program if bidding took place.*)
    f_NewOrderList_BidID : fix_string option;
    (** Unique identifier for a Bid Request as assigned by institution. Uniqueness must be guaranteed within a single trading day.*)
    f_NewOrderList_ClientBidID : fix_string option;
    (** Code to identify the desired frequency of progress reports*)
    f_NewOrderList_ProgRptReqs : fix_progrptreqs option;
    (** Code to identify the type of Bid Request
     e.g. Non Disclosed Model, Disclosed Model, No Bidding Process*)
    f_NewOrderList_BidType : fix_bidtype;
    (** Time in minutes between each ListStatus report sent by SellSide. Zero means don’t send status.*)
    f_NewOrderList_ProgPeriodInterval : int option;
    (** For CIV – A one character code identifying whether Cancellation rights/Cooling off period applies
     For CIV - Optional*)
    f_NewOrderList_CancellationRights : fix_cancellationrights option;
    (** A one character code identifying Money laundering status*)
    f_NewOrderList_MoneyLaunderingStatus : fix_moneylaunderingstatus option;
    (** Unique identifier of the registration details as assigned by institution or intermediary.
     Reference to Registration Instructions message applicable to all Orders in this List.*)
    f_NewOrderList_RegistID : fix_string option;
    (** Identifies the type of ListExecInst (69)
     Controls when execution should begin For CIV Orders indicates order of execution..*)
    f_NewOrderList_ListExecInstType : fix_listexecinsttype option;
    (** Free format text message containing list handling and execution instructions.
     Free-form text.*)
    f_NewOrderList_ListExecInst : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedListExecInst (353) field.
     Must be set if EncodedListExecInst field is specified and must immediately precede it.*)
    f_NewOrderList_EncodedListExecInstLen : int option;
    (** Encoded (non-ASCII characters) representation of the ListExecInst (69) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the ListExecInst field.
     Encoded (non-ASCII characters) representation of the ListExecInst field in the encoded format specified via the MessageEncoding field.*)
    f_NewOrderList_EncodedListExecInst : fix_string option;
    (** The maximum percentage that execution of one side of a program trade can exceed execution of the other.
     The maximum percentage that execution of one side of a program trade can exceed execution of the other.*)
    f_NewOrderList_AllowableOneSidednessPct : fix_float option;
    (** The maximum amount that execution of one side of a program trade can exceed execution of the other.
     The maximum amount that execution of one side of a program trade can exceed execution of the other.*)
    f_NewOrderList_AllowableOneSidednessValue : fix_float option;
    (** The currency that AllowableOneSidednessValue (766) is expressed in if AllowableOneSidednessValue is used.
     The currency that AllowableOneSidedness is expressed in if AllowableOneSidednessValue is used.*)
    f_NewOrderList_AllowableOneSidednessCurr : fix_currency option;
    (** Total number of list order entries across all messages. Should be the sum of all NoOrders (73) in each message that has repeating list order entries related to the same ListID (66). Used to support fragmentation.
     (Prior to FIX 4.2 this field was named "ListNoOrds")
     Used to support fragmentation. Sum of NoOrders across all messages with the same ListID.*)
    f_NewOrderList_TotNoOrders : int;
    (** Indicates whether this message is the last in a sequence of messages for those messages that support fragmentation, such as Allocation Instruction, Mass Quote, Security List, Derivative Security List
     Indicates whether this is the last fragment in a sequence of message fragments. Only required where message has been fragmented.*)
    f_NewOrderList_LastFragment : fix_lastfragment option;
    (** Number of orders in this message (number of repeating groups to follow)*)
    f_NewOrderList_ListOrdGrp : fix_listordgrp
}
;;

(** The New Order - Multileg is provided to submit orders for securities that are made up of multiple securities, known as legs.*)
type full_fix_newordermultileg_data = {
    (** Unique identifier for Order as assigned by the buy-side (institution, broker, intermediary etc.) (identified by SenderCompID (49) or OnBehalfOfCompID (5) as appropriate). Uniqueness must be guaranteed within a single trading day. Firms, particularly those which electronically submit multi-day orders, trade globally or throughout market close periods, should ensure uniqueness across days, for example by embedding a date within the ClOrdID field.
     Unique identifier of the order as assigned by institution or by the intermediary with closest association with the investor.*)
    f_NewOrderMultileg_ClOrdID : fix_string;
    (** Assigned by the party which originates the order. Can be used to provide the ClOrdID (11) used by an exchange or executing system.*)
    f_NewOrderMultileg_SecondaryClOrdID : fix_string option;
    (** Permits order originators to tie together groups of orders in which trades resulting from orders are associated for a specific purpose, for example the calculation of average execution price for a customer or to associate lists submitted to a broker as waves of a larger program trade.*)
    f_NewOrderMultileg_ClOrdLinkID : fix_string option;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_NewOrderMultileg_Parties : fix_parties;
    (** Used with Fixed Income for Muncipal New Issue Market. Agreement in principal between counter-parties prior to actual trade date.
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)
     (prior to FIX 4.4 field was of type UTCDate)*)
    f_NewOrderMultileg_TradeOriginationDate : fix_localmktdate option;
    (** Indicates date of trade referenced in this message in YYYYMMDD format. Absence of this field indicates current day (expressed in local time at place of trade).*)
    f_NewOrderMultileg_TradeDate : fix_localmktdate option;
    (** Account mnemonic as agreed between buy and sell sides, e.g. broker and institution or investor/intermediary and fund manager.*)
    f_NewOrderMultileg_Account : fix_string option;
    (** Used to identify the source of the Account (1) code. This is especially useful if the account is a new account that the Respondent may not have setup yet in their system.*)
    f_NewOrderMultileg_AcctIDSource : fix_acctidsource option;
    (** Type of account associated with an order*)
    f_NewOrderMultileg_AccountType : fix_accounttype option;
    (** Indicates whether or not automatic booking can occur.*)
    f_NewOrderMultileg_DayBookingInst : fix_daybookinginst option;
    (** Indicates what constitutes a bookable unit.*)
    f_NewOrderMultileg_BookingUnit : fix_bookingunit option;
    (** Indicates the method of preallocation.*)
    f_NewOrderMultileg_PreallocMethod : fix_preallocmethod option;
    (** Unique identifier for allocation message.
     (Prior to FIX 4.1 this field was of type int)
     Used to assign an identifier to the block of individual preallocations*)
    f_NewOrderMultileg_AllocID : fix_string option;
    (** Number of repeating groups for pre-trade allocation*)
    f_NewOrderMultileg_PreAllocMlegGrp : fix_preallocmleggrp;
    (** Indicates order settlement period. If present, SettlDate (64) overrides this field. If both SettlType (63) and SettDate (64) are omitted, the default for SettlType (63) is 0 (Regular)
     Regular is defined as the default settlement period for the particular security on the exchange of execution.
     In Fixed Income the contents of this field may influence the instrument definition if the SecurityID (48) is ambiguous. In the US an active Treasury offering may be re-opened, and for a time one CUSIP will apply to both the current and "when-issued" securities. Supplying a value of "7" clarifies the instrument description; any other value or the absence of this field should cause the respondent to default to the active issue.*)
    f_NewOrderMultileg_SettlType : fix_settltype option;
    (** Specific date of trade settlement (SettlementDate) in YYYYMMDD format.
     If present, this field overrides SettlType (63). This field is required if the value of SettlType (63) is 6 (Future) or 8 (Sellers Option). This field must be omitted if the value of SettlType (63) is 7 (When and If Issued)
     (expressed in local time at place of settlement)
     Takes precedence over SettlType value and conditionally required/omitted for specific SettlType values.*)
    f_NewOrderMultileg_SettlDate : fix_localmktdate option;
    (** Identifies whether an order is a margin order or a non-margin order. This is primarily used when sending orders to Japanese exchanges to indicate sell margin or buy to cover. The same tag could be assigned also by buy-side to indicate the intent to sell or buy margin and the sell-side to accept or reject (base on some validation criteria) the margin request.*)
    f_NewOrderMultileg_CashMargin : fix_cashmargin option;
    (** Indicates type of fee being assessed of the customer for trade executions at an exchange. Applicable for futures markets only at this time.
     (Values source CBOT, CME, NYBOT, and NYMEX):*)
    f_NewOrderMultileg_ClearingFeeIndicator : fix_clearingfeeindicator option;
    (** Instructions for order handling on Broker trading floor*)
    f_NewOrderMultileg_HandlInst : fix_handlinst option;
    (** Instructions for order handling on exchange trading floor. If more than one instruction is applicable to an order, this field can contain multiple instructions separated by space.
     Can contain multiple instructions, space delimited. If OrdType=P, exactly one of the following values (ExecInst = L, R, M, P, O, T, or W) must be specified.*)
    f_NewOrderMultileg_ExecInst : fix_execinst option;
    (** Minimum quantity of an order to be executed.
     (Prior to FIX 4.2 this field was of type int)*)
    f_NewOrderMultileg_MinQty : fix_float option;
    (** Maximum quantity (e.g. number of shares) within an order to be shown on the exchange floor at any given time.
     (Prior to FIX 4.2 this field was of type int)*)
    f_NewOrderMultileg_MaxFloor : fix_float option;
    (** Execution destination as defined by institution when order is entered.
     Valid values:
     See "Appendix 6-C"*)
    f_NewOrderMultileg_ExDestination : fix_exchange option;
    (** Specifies the number of repeating TradingSessionIDs*)
    f_NewOrderMultileg_TrdgSesGrp : fix_trdgsesgrp;
    (** Processing code for sub-account. Absence of this field in AllocAccount (79) / AllocPrice (366) /AllocQty (80) / ProcessCode instance indicates regular trade.
     Used to identify soft trades at order entry.*)
    f_NewOrderMultileg_ProcessCode : fix_processcode option;
    (** Side of order
     Additional enumeration that indicates this is an order for a multileg order and that the sides are specified in the Instrument Leg component block.*)
    f_NewOrderMultileg_Side : fix_side;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"
     SecurityType[167] = "MLEG"
     CFICode should be set to the type of multileg product, such as "O" - options, "F" - Future or Swap.*)
    f_NewOrderMultileg_Instrument : fix_instrument;
    (** Number of underlyings*)
    f_NewOrderMultileg_UndInstrmtGrp : fix_undinstrmtgrp;
    (** Previous closing price of security.
     Useful for verifying security identification*)
    f_NewOrderMultileg_PrevClosePx : fix_float option;
    (** Number of legs
     Can be zero (e.g. standardized multileg instrument such as an Option strategy) - must be provided even if zero*)
    f_NewOrderMultileg_LegOrdGrp : fix_legordgrp;
    (** Indicates whether the broker is to locate the stock in conjunction with a short sell order.
     Required for short sell orders*)
    f_NewOrderMultileg_LocateReqd : fix_locatereqd option;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")
     Time this order request was initiated/released by the trader, trading system, or intermediary.*)
    f_NewOrderMultileg_TransactTime : fix_utctimestamp;
    (** Type of quantity specified in a quantity field*)
    f_NewOrderMultileg_QtyType : fix_qtytype option;
    (** Insert here the set of "OrderQtyData" fields defined in "Common Components of Application Messages"*)
    f_NewOrderMultileg_OrderQtyData : fix_orderqtydata;
    (** Order type
     *** SOME VALUES ARE NO LONGER USED - See "Deprecated (Phased-out) Features and Supported Approach" ***
     (see Volume : "Glossary" for value definitions)*)
    f_NewOrderMultileg_OrdType : fix_ordtype;
    (** Code to represent the price type*)
    f_NewOrderMultileg_PriceType : fix_pricetype option;
    (** Price per unit of quantity (e.g. per share)
     Required for limit OrdTypes. For F/X orders, should be the "all-in" rate (spot rate adjusted for forward points). Can be used to specify a limit price for a pegged order, previously indicated, etc.*)
    f_NewOrderMultileg_Price : fix_float option;
    (** Price per unit of quantity (e.g. per share)
     Required for OrdType = "Stop" or OrdType = "Stop limit".*)
    f_NewOrderMultileg_StopPx : fix_float option;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.*)
    f_NewOrderMultileg_Currency : fix_currency option;
    (** ID used to represent this transaction for compliance purposes (e.g. OATS reporting).*)
    f_NewOrderMultileg_ComplianceID : fix_string option;
    (** Indicates whether or not the order was solicited.*)
    f_NewOrderMultileg_SolicitedFlag : fix_solicitedflag option;
    (** Unique identifier of IOI message.
     (Prior to FIX 4.1 this field was of type int)
     Required for Previously Indicated Orders (OrdType=E)*)
    f_NewOrderMultileg_IOIID : fix_string option;
    (** Unique identifier for quote
     Required for Previously Quoted Orders (OrdType=D)*)
    f_NewOrderMultileg_QuoteID : fix_string option;
    (** Specifies how long the order remains in effect. Absence of this field is interpreted as DAY.
     Absence of this field indicates Day order*)
    f_NewOrderMultileg_TimeInForce : fix_timeinforce option;
    (** Time the details within the message should take effect (always expressed in UTC (Universal Time Coordinated, also known as "GMT")
     Can specify the time at which the order should be considered valid*)
    f_NewOrderMultileg_EffectiveTime : fix_utctimestamp option;
    (** Date of order expiration (last day the order can trade), always expressed in terms of the local market date. The time at which the order expires is determined by the local market’s business practices
     Conditionally required if TimeInForce = GTD and ExpireTime is not specified.*)
    f_NewOrderMultileg_ExpireDate : fix_localmktdate option;
    (** Time/Date of order expiration (always expressed in UTC (Universal Time Coordinated, also known as "GMT")
     The meaning of expiration is specific to the context where the field is used.
     For orders, this is the expiration time of a Good Til Date TimeInForce.
     For Quotes - this is the expiration of the quote.
     Expiration time is provided across the quote message dialog to control the length of time of the overall quoting process.
     For collateral requests, this is the time by which collateral must be assigned.
     For collateral assignments, this is the time by which a response to the assignment is expected.
     Conditionally required if TimeInForce = GTD and ExpireDate is not specified.*)
    f_NewOrderMultileg_ExpireTime : fix_utctimestamp option;
    (** Code to identify whether to book out executions on a part-filled GT order on the day of execution or to accumulate
     States whether executions are booked out or accumulated on a partially filled GT order*)
    f_NewOrderMultileg_GTBookingInst : fix_gtbookinginst option;
    (** Insert here the set of "CommissionData" fields defined in "Common Components of Application Messages"*)
    f_NewOrderMultileg_CommissionData : fix_commissiondata;
    (** Designates the capacity of the firm placing the order
     (as of FIX 4.3, this field replaced Rule80A (tag 47) --used in conjunction with OrderRestrictions (529) field)
     (see Volume : "Glossary" for value definitions)*)
    f_NewOrderMultileg_OrderCapacity : fix_ordercapacity option;
    (** Restrictions associated with an order. If more than one restriction is applicable to an order, this field can contain multiple instructions separated by space.*)
    f_NewOrderMultileg_OrderRestrictions : fix_orderrestrictions option;
    (** Capacity of customer placing the order
     Primarily used by futures exchanges to indicate the CTICode (customer type indicator) as required by the US CFTC (Commodity Futures Trading Commission).*)
    f_NewOrderMultileg_CustOrderCapacity : fix_custordercapacity option;
    (** Indicates request for forex accommodation trade to be executed along with security transaction.
     Indicates that broker is requested to execute a Forex accommodation trade in conjunction with the security trade.*)
    f_NewOrderMultileg_ForexReq : fix_forexreq option;
    (** Currency code of settlement denomination.
     Required if ForexReq = Y.*)
    f_NewOrderMultileg_SettlCurrency : fix_currency option;
    (** Method for booking out this order. Used when notifying a broker that an order to be settled by that broker is to be booked out as an OTC derivative (e.g. CFD or similar).
     Method for booking out this order. Used when notifying a broker that an order to be settled by that broker is to be booked out as an OTC derivative (e.g. CFD or similar). Absence of this field implies regular booking.*)
    f_NewOrderMultileg_BookingType : fix_bookingtype option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_NewOrderMultileg_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_NewOrderMultileg_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_NewOrderMultileg_EncodedText : fix_string option;
    (** Indicates whether the resulting position after a trade should be an opening position or closing position. Used for omnibus accounting - where accounts are held on a gross basis instead of being netted together.
     For use in derivatives omnibus accounting*)
    f_NewOrderMultileg_PositionEffect : fix_positioneffect option;
    (** Used for derivative products, such as options
     For use with derivatives, such as options*)
    f_NewOrderMultileg_CoveredOrUncovered : fix_coveredoruncovered option;
    (** Maximum quantity (e.g. number of shares) within an order to be shown to other customers (i.e. sent via an IOI).
     (Prior to FIX 4.2 this field was of type int)*)
    f_NewOrderMultileg_MaxShow : fix_float option;
    (** Insert here the set of "PegInstruction" fields defined in "Common Components of Application Messages"*)
    f_NewOrderMultileg_PegInstructions : fix_peginstructions;
    (** Insert here the set of "DiscretionInstruction" fields defined in "Common Components of Application Messages"*)
    f_NewOrderMultileg_DiscretionInstructions : fix_discretioninstructions;
    (** The target strategy of the order
     1000+ = Reserved and available for bi-laterally agreed upon user defined values
     The target strategy of the order*)
    f_NewOrderMultileg_TargetStrategy : fix_targetstrategy option;
    (** Field to allow further specification of the TargetStrategy – usage to be agreed between counterparties
     For further specification of the TargetStrategy*)
    f_NewOrderMultileg_TargetStrategyParameters : fix_string option;
    (** For a TargetStrategy=Participate order specifies the target particpation rate. For other order types this is a volume limit (i.e. do not be more than this percent of the market volume)
     Mandatory for a TargetStrategy=Participate order and specifies the target particpation rate.
     For other order types optionally specifies a volume limit (i.e. do not be more than this percent of the market volume)*)
    f_NewOrderMultileg_ParticipationRate : fix_float option;
    (** For CIV – A one character code identifying whether Cancellation rights/Cooling off period applies
     For CIV - Optional*)
    f_NewOrderMultileg_CancellationRights : fix_cancellationrights option;
    (** A one character code identifying Money laundering status*)
    f_NewOrderMultileg_MoneyLaunderingStatus : fix_moneylaunderingstatus option;
    (** Unique identifier of the registration details as assigned by institution or intermediary.
     Reference to Registration Instructions message for this Order.*)
    f_NewOrderMultileg_RegistID : fix_string option;
    (** Free format text defining the designation to be associated with a holding on the register. Used to identify assets of a specific underlying investor using a common registration, e.g. a broker’s nominee or street name.
     Supplementary registration information for this Order*)
    f_NewOrderMultileg_Designation : fix_string option;
    (** Indicates the method of execution reporting requested by issuer of the order
     Indicates the method of execution reporting requested by issuer of the order.*)
    f_NewOrderMultileg_MultiLegRptTypeReq : fix_multilegrpttypereq option
}
;;

(** The new order message type is used by institutions wishing to electronically submit securities and forex orders to a broker for execution.*)
type full_fix_newordersingle_data = {
    (** Unique identifier for Order as assigned by the buy-side (institution, broker, intermediary etc.) (identified by SenderCompID (49) or OnBehalfOfCompID (5) as appropriate). Uniqueness must be guaranteed within a single trading day. Firms, particularly those which electronically submit multi-day orders, trade globally or throughout market close periods, should ensure uniqueness across days, for example by embedding a date within the ClOrdID field.
     Unique identifier of the order as assigned by institution or by the intermediary (CIV term, not a hub/service bureau) with closest association with the investor.*)
    f_NewOrderSingle_ClOrdID : fix_string;
    (** Assigned by the party which originates the order. Can be used to provide the ClOrdID (11) used by an exchange or executing system.*)
    f_NewOrderSingle_SecondaryClOrdID : fix_string option;
    (** Permits order originators to tie together groups of orders in which trades resulting from orders are associated for a specific purpose, for example the calculation of average execution price for a customer or to associate lists submitted to a broker as waves of a larger program trade.*)
    f_NewOrderSingle_ClOrdLinkID : fix_string option;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_NewOrderSingle_Parties : fix_parties;
    (** Used with Fixed Income for Muncipal New Issue Market. Agreement in principal between counter-parties prior to actual trade date.
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)
     (prior to FIX 4.4 field was of type UTCDate)*)
    f_NewOrderSingle_TradeOriginationDate : fix_localmktdate option;
    (** Indicates date of trade referenced in this message in YYYYMMDD format. Absence of this field indicates current day (expressed in local time at place of trade).*)
    f_NewOrderSingle_TradeDate : fix_localmktdate option;
    (** Account mnemonic as agreed between buy and sell sides, e.g. broker and institution or investor/intermediary and fund manager.*)
    f_NewOrderSingle_Account : fix_string option;
    (** Used to identify the source of the Account (1) code. This is especially useful if the account is a new account that the Respondent may not have setup yet in their system.*)
    f_NewOrderSingle_AcctIDSource : fix_acctidsource option;
    (** Type of account associated with an order
     Type of account associated with the order (Origin)*)
    f_NewOrderSingle_AccountType : fix_accounttype option;
    (** Indicates whether or not automatic booking can occur.*)
    f_NewOrderSingle_DayBookingInst : fix_daybookinginst option;
    (** Indicates what constitutes a bookable unit.*)
    f_NewOrderSingle_BookingUnit : fix_bookingunit option;
    (** Indicates the method of preallocation.*)
    f_NewOrderSingle_PreallocMethod : fix_preallocmethod option;
    (** Unique identifier for allocation message.
     (Prior to FIX 4.1 this field was of type int)
     Used to assign an overall allocation id to the block of preallocations*)
    f_NewOrderSingle_AllocID : fix_string option;
    (** Number of repeating groups for pre-trade allocation*)
    f_NewOrderSingle_PreAllocGrp : fix_preallocgrp;
    (** Indicates order settlement period. If present, SettlDate (64) overrides this field. If both SettlType (63) and SettDate (64) are omitted, the default for SettlType (63) is 0 (Regular)
     Regular is defined as the default settlement period for the particular security on the exchange of execution.
     In Fixed Income the contents of this field may influence the instrument definition if the SecurityID (48) is ambiguous. In the US an active Treasury offering may be re-opened, and for a time one CUSIP will apply to both the current and "when-issued" securities. Supplying a value of "7" clarifies the instrument description; any other value or the absence of this field should cause the respondent to default to the active issue.*)
    f_NewOrderSingle_SettlType : fix_settltype option;
    (** Specific date of trade settlement (SettlementDate) in YYYYMMDD format.
     If present, this field overrides SettlType (63). This field is required if the value of SettlType (63) is 6 (Future) or 8 (Sellers Option). This field must be omitted if the value of SettlType (63) is 7 (When and If Issued)
     (expressed in local time at place of settlement)
     Takes precedence over SettlType value and conditionally required/omitted for specific SettlType values.*)
    f_NewOrderSingle_SettlDate : fix_localmktdate option;
    (** Identifies whether an order is a margin order or a non-margin order. This is primarily used when sending orders to Japanese exchanges to indicate sell margin or buy to cover. The same tag could be assigned also by buy-side to indicate the intent to sell or buy margin and the sell-side to accept or reject (base on some validation criteria) the margin request.*)
    f_NewOrderSingle_CashMargin : fix_cashmargin option;
    (** Indicates type of fee being assessed of the customer for trade executions at an exchange. Applicable for futures markets only at this time.
     (Values source CBOT, CME, NYBOT, and NYMEX):*)
    f_NewOrderSingle_ClearingFeeIndicator : fix_clearingfeeindicator option;
    (** Instructions for order handling on Broker trading floor*)
    f_NewOrderSingle_HandlInst : fix_handlinst option;
    (** Instructions for order handling on exchange trading floor. If more than one instruction is applicable to an order, this field can contain multiple instructions separated by space.
     Can contain multiple instructions, space delimited. If OrdType=P, exactly one of the following values (ExecInst = L, R, M, P, O, T, W, a, d) must be specified.*)
    f_NewOrderSingle_ExecInst : fix_execinst option;
    (** Minimum quantity of an order to be executed.
     (Prior to FIX 4.2 this field was of type int)*)
    f_NewOrderSingle_MinQty : fix_float option;
    (** Maximum quantity (e.g. number of shares) within an order to be shown on the exchange floor at any given time.
     (Prior to FIX 4.2 this field was of type int)*)
    f_NewOrderSingle_MaxFloor : fix_float option;
    (** Execution destination as defined by institution when order is entered.
     Valid values:
     See "Appendix 6-C"*)
    f_NewOrderSingle_ExDestination : fix_exchange option;
    (** Specifies the number of repeating TradingSessionIDs*)
    f_NewOrderSingle_TrdgSesGrp : fix_trdgsesgrp;
    (** Processing code for sub-account. Absence of this field in AllocAccount (79) / AllocPrice (366) /AllocQty (80) / ProcessCode instance indicates regular trade.
     Used to identify soft trades at order entry.*)
    f_NewOrderSingle_ProcessCode : fix_processcode option;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_NewOrderSingle_Instrument : fix_instrument;
    (** Insert here the set of "FinancingDetails" (symbology) fields defined in "Common Components of Application Messages"*)
    f_NewOrderSingle_FinancingDetails : fix_financingdetails;
    (** Number of underlyings*)
    f_NewOrderSingle_UndInstrmtGrp : fix_undinstrmtgrp;
    (** Previous closing price of security.
     Useful for verifying security identification*)
    f_NewOrderSingle_PrevClosePx : fix_float option;
    (** Side of order*)
    f_NewOrderSingle_Side : fix_side;
    (** Indicates whether the broker is to locate the stock in conjunction with a short sell order.
     Required for short sell orders*)
    f_NewOrderSingle_LocateReqd : fix_locatereqd option;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")
     Time this order request was initiated/released by the trader, trading system, or intermediary.*)
    f_NewOrderSingle_TransactTime : fix_utctimestamp;
    (** Insert here the set of "Stipulations" (repeating group of Fixed Income stipulations) fields defined in "Common Components of Application Messages"*)
    f_NewOrderSingle_Stipulations : fix_stipulations;
    (** Type of quantity specified in a quantity field*)
    f_NewOrderSingle_QtyType : fix_qtytype option;
    (** Insert here the set of "OrderQtyData" fields defined in "Common Components of Application Messages"*)
    f_NewOrderSingle_OrderQtyData : fix_orderqtydata;
    (** Order type
     *** SOME VALUES ARE NO LONGER USED - See "Deprecated (Phased-out) Features and Supported Approach" ***
     (see Volume : "Glossary" for value definitions)*)
    f_NewOrderSingle_OrdType : fix_ordtype;
    (** Code to represent the price type*)
    f_NewOrderSingle_PriceType : fix_pricetype option;
    (** Price per unit of quantity (e.g. per share)
     Required for limit OrdTypes. For F/X orders, should be the "all-in" rate (spot rate adjusted for forward points). Can be used to specify a limit price for a pegged order, previously indicated, etc.*)
    f_NewOrderSingle_Price : fix_float option;
    (** Price per unit of quantity (e.g. per share)
     Required for OrdType = "Stop" or OrdType = "Stop limit".*)
    f_NewOrderSingle_StopPx : fix_float option;
    (** Insert here the set of "SpreadOrBenchmarkCurveData" (Fixed Income spread or benchmark curve) fields defined in "Common Components of Application Messages"*)
    f_NewOrderSingle_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    (** Insert here the set of "YieldData" (yield-related) fields defined in "Common Components of Application Messages"*)
    f_NewOrderSingle_YieldData : fix_yielddata;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.*)
    f_NewOrderSingle_Currency : fix_currency option;
    (** ID used to represent this transaction for compliance purposes (e.g. OATS reporting).*)
    f_NewOrderSingle_ComplianceID : fix_string option;
    (** Indicates whether or not the order was solicited.*)
    f_NewOrderSingle_SolicitedFlag : fix_solicitedflag option;
    (** Unique identifier of IOI message.
     (Prior to FIX 4.1 this field was of type int)
     Required for Previously Indicated Orders (OrdType=E)*)
    f_NewOrderSingle_IOIID : fix_string option;
    (** Unique identifier for quote
     Required for Previously Quoted Orders (OrdType=D)*)
    f_NewOrderSingle_QuoteID : fix_string option;
    (** Specifies how long the order remains in effect. Absence of this field is interpreted as DAY.
     Absence of this field indicates Day order*)
    f_NewOrderSingle_TimeInForce : fix_timeinforce option;
    (** Time the details within the message should take effect (always expressed in UTC (Universal Time Coordinated, also known as "GMT")
     Can specify the time at which the order should be considered valid*)
    f_NewOrderSingle_EffectiveTime : fix_utctimestamp option;
    (** Date of order expiration (last day the order can trade), always expressed in terms of the local market date. The time at which the order expires is determined by the local market’s business practices
     Conditionally required if TimeInForce = GTD and ExpireTime is not specified.*)
    f_NewOrderSingle_ExpireDate : fix_localmktdate option;
    (** Time/Date of order expiration (always expressed in UTC (Universal Time Coordinated, also known as "GMT")
     The meaning of expiration is specific to the context where the field is used.
     For orders, this is the expiration time of a Good Til Date TimeInForce.
     For Quotes - this is the expiration of the quote.
     Expiration time is provided across the quote message dialog to control the length of time of the overall quoting process.
     For collateral requests, this is the time by which collateral must be assigned.
     For collateral assignments, this is the time by which a response to the assignment is expected.
     Conditionally required if TimeInForce = GTD and ExpireDate is not specified.*)
    f_NewOrderSingle_ExpireTime : fix_utctimestamp option;
    (** Code to identify whether to book out executions on a part-filled GT order on the day of execution or to accumulate
     States whether executions are booked out or accumulated on a partially filled GT order*)
    f_NewOrderSingle_GTBookingInst : fix_gtbookinginst option;
    (** Insert here the set of "CommissionData" fields defined in "Common Components of Application Messages"*)
    f_NewOrderSingle_CommissionData : fix_commissiondata;
    (** Designates the capacity of the firm placing the order
     (as of FIX 4.3, this field replaced Rule80A (tag 47) --used in conjunction with OrderRestrictions (529) field)
     (see Volume : "Glossary" for value definitions)*)
    f_NewOrderSingle_OrderCapacity : fix_ordercapacity option;
    (** Restrictions associated with an order. If more than one restriction is applicable to an order, this field can contain multiple instructions separated by space.*)
    f_NewOrderSingle_OrderRestrictions : fix_orderrestrictions option;
    (** Capacity of customer placing the order
     Primarily used by futures exchanges to indicate the CTICode (customer type indicator) as required by the US CFTC (Commodity Futures Trading Commission).*)
    f_NewOrderSingle_CustOrderCapacity : fix_custordercapacity option;
    (** Indicates request for forex accommodation trade to be executed along with security transaction.
     Indicates that broker is requested to execute a Forex accommodation trade in conjunction with the security trade.*)
    f_NewOrderSingle_ForexReq : fix_forexreq option;
    (** Currency code of settlement denomination.
     Required if ForexReq = Y.*)
    f_NewOrderSingle_SettlCurrency : fix_currency option;
    (** Method for booking out this order. Used when notifying a broker that an order to be settled by that broker is to be booked out as an OTC derivative (e.g. CFD or similar).
     Method for booking out this order. Used when notifying a broker that an order to be settled by that broker is to be booked out as an OTC derivative (e.g. CFD or similar). Absence of this field implies regular booking.*)
    f_NewOrderSingle_BookingType : fix_bookingtype option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_NewOrderSingle_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_NewOrderSingle_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_NewOrderSingle_EncodedText : fix_string option;
    (** SettDate (64) of the future part of a F/X swap order.
     Can be used with OrdType = "Forex - Swap" to specify the "value date" for the future portion of a F/X swap.*)
    f_NewOrderSingle_SettlDate2 : fix_localmktdate option;
    (** OrderQty (38) of the future part of a F/X swap order.
     Can be used with OrdType = "Forex - Swap" to specify the order quantity for the future portion of a F/X swap.*)
    f_NewOrderSingle_OrderQty2 : fix_float option;
    (** Price of the future part of a F/X swap order.
     See Price (44) for description.
     Can be used with OrdType = "Forex - Swap" to specify the price for the future portion of a F/X swap which is also a limit order. For F/X orders, should be the "all-in" rate (spot rate adjusted for forward points).*)
    f_NewOrderSingle_Price2 : fix_float option;
    (** Indicates whether the resulting position after a trade should be an opening position or closing position. Used for omnibus accounting - where accounts are held on a gross basis instead of being netted together.
     For use in derivatives omnibus accounting*)
    f_NewOrderSingle_PositionEffect : fix_positioneffect option;
    (** Used for derivative products, such as options
     For use with derivatives, such as options*)
    f_NewOrderSingle_CoveredOrUncovered : fix_coveredoruncovered option;
    (** Maximum quantity (e.g. number of shares) within an order to be shown to other customers (i.e. sent via an IOI).
     (Prior to FIX 4.2 this field was of type int)*)
    f_NewOrderSingle_MaxShow : fix_float option;
    (** Insert here the set of "PegInstruction" fields defined in "Common Components of Application Messages"*)
    f_NewOrderSingle_PegInstructions : fix_peginstructions;
    (** Insert here the set of "DiscretionInstruction" fields defined in "Common Components of Application Messages"*)
    f_NewOrderSingle_DiscretionInstructions : fix_discretioninstructions;
    (** The target strategy of the order
     1000+ = Reserved and available for bi-laterally agreed upon user defined values
     The target strategy of the order*)
    f_NewOrderSingle_TargetStrategy : fix_targetstrategy option;
    (** Field to allow further specification of the TargetStrategy – usage to be agreed between counterparties
     For further specification of the TargetStrategy*)
    f_NewOrderSingle_TargetStrategyParameters : fix_string option;
    (** For a TargetStrategy=Participate order specifies the target particpation rate. For other order types this is a volume limit (i.e. do not be more than this percent of the market volume)
     Mandatory for a TargetStrategy=Participate order and specifies the target particpation rate.
     For other order types optionally specifies a volume limit (i.e. do not be more than this percent of the market volume)*)
    f_NewOrderSingle_ParticipationRate : fix_float option;
    (** For CIV – A one character code identifying whether Cancellation rights/Cooling off period applies
     For CIV - Optional*)
    f_NewOrderSingle_CancellationRights : fix_cancellationrights option;
    (** A one character code identifying Money laundering status*)
    f_NewOrderSingle_MoneyLaunderingStatus : fix_moneylaunderingstatus option;
    (** Unique identifier of the registration details as assigned by institution or intermediary.
     Reference to Registration Instructions message for this Order.*)
    f_NewOrderSingle_RegistID : fix_string option;
    (** Free format text defining the designation to be associated with a holding on the register. Used to identify assets of a specific underlying investor using a common registration, e.g. a broker’s nominee or street name.
     Supplementary registration information for this Order*)
    f_NewOrderSingle_Designation : fix_string option
}
;;

(** The news message is a general free format message between the broker and institution.*)
type full_fix_news_data = {
    (** Time of message origination (always expressed in UTC (Universal Time Coordinated, also known as "GMT"))*)
    f_News_OrigTime : fix_utctimestamp option;
    (** Urgency flag*)
    f_News_Urgency : fix_urgency option;
    (** The headline of a News message
     Specifies the headline text*)
    f_News_Headline : fix_string;
    (** Byte length of encoded (non-ASCII characters) EncodedHeadline (359) field.
     Must be set if EncodedHeadline field is specified and must immediately precede it.*)
    f_News_EncodedHeadlineLen : int option;
    (** Encoded (non-ASCII characters) representation of the Headline (48) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Headline field.
     Encoded (non-ASCII characters) representation of the Headline field in the encoded format specified via the MessageEncoding field.*)
    f_News_EncodedHeadline : fix_string option;
    (** Required if any RoutingType and RoutingIDs are specified. Indicates the number within repeating group.*)
    f_News_RoutingGrp : fix_routinggrp;
    (** Specifies the number of repeating symbols (instruments) specified*)
    f_News_InstrmtGrp : fix_instrmtgrp;
    (** Number of legs
     Identifies a Multi-leg Execution if present and non-zero.*)
    f_News_InstrmtLegGrp : fix_instrmtleggrp;
    (** Number of underlyings*)
    f_News_UndInstrmtGrp : fix_undinstrmtgrp;
    (** Specifies the number of repeating lines of text specified*)
    f_News_LinesOfTextGrp : fix_linesoftextgrp;
    (** A URI (Uniform Resource Identifier) or URL (Uniform Resource Locator) link to additional information (i.e. http://www.XYZ.com/research.html)
     See "Appendix 6-B FIX Fields Based Upon Other Standards"
     A URL (Uniform Resource Locator) link to additional information (i.e. http://www.XYZ.com/research.html)*)
    f_News_URLLink : fix_string option;
    (** Number of bytes in raw data field.*)
    f_News_RawDataLength : int option;
    (** Unformatted raw data, can include bitmaps, word processor documents, etc.*)
    f_News_RawData : fix_string option
}
;;

(** The order cancel reject message is issued by the broker upon receipt of a cancel request or cancel/replace request message which cannot be honored.*)
type full_fix_ordercancelreject_data = {
    (** Unique identifier for Order as assigned by sell-side (broker, exchange, ECN). Uniqueness must be guaranteed within a single trading day. Firms which accept multi-day orders should consider embedding a date within the OrderID field to assure uniqueness across days.
     If CxlRejReason="Unknown order", specify "NONE".*)
    f_OrderCancelReject_OrderID : fix_string;
    (** Assigned by the party which accepts the order. Can be used to provide the OrderID (37) used by an exchange or executing system.
     Can be used to provide order id used by exchange or executing system.*)
    f_OrderCancelReject_SecondaryOrderID : fix_string option;
    (** Assigned by the party which originates the order. Can be used to provide the ClOrdID (11) used by an exchange or executing system.*)
    f_OrderCancelReject_SecondaryClOrdID : fix_string option;
    (** Unique identifier for Order as assigned by the buy-side (institution, broker, intermediary etc.) (identified by SenderCompID (49) or OnBehalfOfCompID (5) as appropriate). Uniqueness must be guaranteed within a single trading day. Firms, particularly those which electronically submit multi-day orders, trade globally or throughout market close periods, should ensure uniqueness across days, for example by embedding a date within the ClOrdID field.
     Unique order id assigned by institution or by the intermediary with closest association with the investor. to the cancel request or to the replacement order.*)
    f_OrderCancelReject_ClOrdID : fix_string;
    (** Permits order originators to tie together groups of orders in which trades resulting from orders are associated for a specific purpose, for example the calculation of average execution price for a customer or to associate lists submitted to a broker as waves of a larger program trade.*)
    f_OrderCancelReject_ClOrdLinkID : fix_string option;
    (** ClOrdID () of the previous order (NOT the initial order of the day) as assigned by the institution, used to identify the previous order in cancel and cancel/replace requests.
     ClOrdID which could not be canceled/replaced. ClOrdID of the previous accepted order (NOT the initial order of the day) when canceling or replacing an order.*)
    f_OrderCancelReject_OrigClOrdID : fix_string;
    (** Identifies current status of order.
     *** SOME VALUES HAVE BEEN REPLACED - See "Replaced Features and Supported Approach" ***
     (see Volume : "Glossary" for value definitions)
     OrdStatus value after this cancel reject is applied.
     If CxlRejReason = "Unknown Order", specify Rejected.*)
    f_OrderCancelReject_OrdStatus : fix_ordstatus;
    (** Indicates if the order is currently being worked. Applicable only for OrdStatus = "New". For open outcry markets this indicates that the order is being worked in the crowd. For electronic markets it indicates that the order has transitioned from a contingent order to a market order.
     For optional use with OrdStatus = 0 (New)*)
    f_OrderCancelReject_WorkingIndicator : fix_workingindicator option;
    (** The most recent (or current) modification TransactTime (tag 60) reported on an Execution Report for the order.
     The OrigOrdModTime is provided as an optional field on Order Cancel Request and Order Cancel Replace Requests to identify that the state of the order has not changed since the request was issued.
     This is provided to support markets similar to Eurex and A/C/E.*)
    f_OrderCancelReject_OrigOrdModTime : fix_utctimestamp option;
    (** Unique identifier for list as assigned by institution, used to associate multiple individual orders. Uniqueness must be guaranteed within a single trading day. Firms which generate multi-day orders should consider embedding a date within the ListID field to assure uniqueness across days.
     Required for rejects against orders which were submitted as part of a list.*)
    f_OrderCancelReject_ListID : fix_string option;
    (** Account mnemonic as agreed between buy and sell sides, e.g. broker and institution or investor/intermediary and fund manager.*)
    f_OrderCancelReject_Account : fix_string option;
    (** Used to identify the source of the Account (1) code. This is especially useful if the account is a new account that the Respondent may not have setup yet in their system.*)
    f_OrderCancelReject_AcctIDSource : fix_acctidsource option;
    (** Type of account associated with an order*)
    f_OrderCancelReject_AccountType : fix_accounttype option;
    (** Used with Fixed Income for Muncipal New Issue Market. Agreement in principal between counter-parties prior to actual trade date.
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)
     (prior to FIX 4.4 field was of type UTCDate)*)
    f_OrderCancelReject_TradeOriginationDate : fix_localmktdate option;
    (** Indicates date of trade referenced in this message in YYYYMMDD format. Absence of this field indicates current day (expressed in local time at place of trade).*)
    f_OrderCancelReject_TradeDate : fix_localmktdate option;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")*)
    f_OrderCancelReject_TransactTime : fix_utctimestamp option;
    (** Identifies the type of request that a Cancel Reject is in response to*)
    f_OrderCancelReject_CxlRejResponseTo : fix_cxlrejresponseto;
    (** Code to identify reason for cancel rejection*)
    f_OrderCancelReject_CxlRejReason : fix_cxlrejreason option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_OrderCancelReject_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_OrderCancelReject_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_OrderCancelReject_EncodedText : fix_string option
}
;;

(** The order cancel/replace request is used to change the parameters of an existing order.*)
type full_fix_ordercancelreplacerequest_data = {
    (** Unique identifier for Order as assigned by sell-side (broker, exchange, ECN). Uniqueness must be guaranteed within a single trading day. Firms which accept multi-day orders should consider embedding a date within the OrderID field to assure uniqueness across days.
     Unique identifier of most recent order as assigned by sell-side (broker, exchange, ECN).*)
    f_OrderCancelReplaceRequest_OrderID : fix_string option;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_OrderCancelReplaceRequest_Parties : fix_parties;
    (** Used with Fixed Income for Muncipal New Issue Market. Agreement in principal between counter-parties prior to actual trade date.
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)
     (prior to FIX 4.4 field was of type UTCDate)*)
    f_OrderCancelReplaceRequest_TradeOriginationDate : fix_localmktdate option;
    (** Indicates date of trade referenced in this message in YYYYMMDD format. Absence of this field indicates current day (expressed in local time at place of trade).*)
    f_OrderCancelReplaceRequest_TradeDate : fix_localmktdate option;
    (** ClOrdID () of the previous order (NOT the initial order of the day) as assigned by the institution, used to identify the previous order in cancel and cancel/replace requests.
     ClOrdID of the previous non rejected order (NOT the initial order of the day) when canceling or replacing an order.*)
    f_OrderCancelReplaceRequest_OrigClOrdID : fix_string;
    (** Unique identifier for Order as assigned by the buy-side (institution, broker, intermediary etc.) (identified by SenderCompID (49) or OnBehalfOfCompID (5) as appropriate). Uniqueness must be guaranteed within a single trading day. Firms, particularly those which electronically submit multi-day orders, trade globally or throughout market close periods, should ensure uniqueness across days, for example by embedding a date within the ClOrdID field.
     Unique identifier of replacement order as assigned by institution or by the intermediary with closest association with the investor.. Note that this identifier will be used in ClOrdID field of the Cancel Reject message if the replacement request is rejected.*)
    f_OrderCancelReplaceRequest_ClOrdID : fix_string;
    (** Assigned by the party which originates the order. Can be used to provide the ClOrdID (11) used by an exchange or executing system.*)
    f_OrderCancelReplaceRequest_SecondaryClOrdID : fix_string option;
    (** Permits order originators to tie together groups of orders in which trades resulting from orders are associated for a specific purpose, for example the calculation of average execution price for a customer or to associate lists submitted to a broker as waves of a larger program trade.*)
    f_OrderCancelReplaceRequest_ClOrdLinkID : fix_string option;
    (** Unique identifier for list as assigned by institution, used to associate multiple individual orders. Uniqueness must be guaranteed within a single trading day. Firms which generate multi-day orders should consider embedding a date within the ListID field to assure uniqueness across days.
     Required for List Orders*)
    f_OrderCancelReplaceRequest_ListID : fix_string option;
    (** The most recent (or current) modification TransactTime (tag 60) reported on an Execution Report for the order.
     The OrigOrdModTime is provided as an optional field on Order Cancel Request and Order Cancel Replace Requests to identify that the state of the order has not changed since the request was issued.
     This is provided to support markets similar to Eurex and A/C/E.
     TransactTime of the last state change that occurred to the original order*)
    f_OrderCancelReplaceRequest_OrigOrdModTime : fix_utctimestamp option;
    (** Account mnemonic as agreed between buy and sell sides, e.g. broker and institution or investor/intermediary and fund manager.*)
    f_OrderCancelReplaceRequest_Account : fix_string option;
    (** Used to identify the source of the Account (1) code. This is especially useful if the account is a new account that the Respondent may not have setup yet in their system.*)
    f_OrderCancelReplaceRequest_AcctIDSource : fix_acctidsource option;
    (** Type of account associated with an order*)
    f_OrderCancelReplaceRequest_AccountType : fix_accounttype option;
    (** Indicates whether or not automatic booking can occur.*)
    f_OrderCancelReplaceRequest_DayBookingInst : fix_daybookinginst option;
    (** Indicates what constitutes a bookable unit.*)
    f_OrderCancelReplaceRequest_BookingUnit : fix_bookingunit option;
    (** Indicates the method of preallocation.*)
    f_OrderCancelReplaceRequest_PreallocMethod : fix_preallocmethod option;
    (** Unique identifier for allocation message.
     (Prior to FIX 4.1 this field was of type int)
     Used to assign an overall allocation id to the block of preallocations*)
    f_OrderCancelReplaceRequest_AllocID : fix_string option;
    (** Number of repeating groups for pre-trade allocation*)
    f_OrderCancelReplaceRequest_PreAllocGrp : fix_preallocgrp;
    (** Indicates order settlement period. If present, SettlDate (64) overrides this field. If both SettlType (63) and SettDate (64) are omitted, the default for SettlType (63) is 0 (Regular)
     Regular is defined as the default settlement period for the particular security on the exchange of execution.
     In Fixed Income the contents of this field may influence the instrument definition if the SecurityID (48) is ambiguous. In the US an active Treasury offering may be re-opened, and for a time one CUSIP will apply to both the current and "when-issued" securities. Supplying a value of "7" clarifies the instrument description; any other value or the absence of this field should cause the respondent to default to the active issue.*)
    f_OrderCancelReplaceRequest_SettlType : fix_settltype option;
    (** Specific date of trade settlement (SettlementDate) in YYYYMMDD format.
     If present, this field overrides SettlType (63). This field is required if the value of SettlType (63) is 6 (Future) or 8 (Sellers Option). This field must be omitted if the value of SettlType (63) is 7 (When and If Issued)
     (expressed in local time at place of settlement)
     Takes precedence over SettlType value and conditionally required/omitted for specific SettlType values.*)
    f_OrderCancelReplaceRequest_SettlDate : fix_localmktdate option;
    (** Identifies whether an order is a margin order or a non-margin order. This is primarily used when sending orders to Japanese exchanges to indicate sell margin or buy to cover. The same tag could be assigned also by buy-side to indicate the intent to sell or buy margin and the sell-side to accept or reject (base on some validation criteria) the margin request.*)
    f_OrderCancelReplaceRequest_CashMargin : fix_cashmargin option;
    (** Indicates type of fee being assessed of the customer for trade executions at an exchange. Applicable for futures markets only at this time.
     (Values source CBOT, CME, NYBOT, and NYMEX):*)
    f_OrderCancelReplaceRequest_ClearingFeeIndicator : fix_clearingfeeindicator option;
    (** Instructions for order handling on Broker trading floor*)
    f_OrderCancelReplaceRequest_HandlInst : fix_handlinst option;
    (** Instructions for order handling on exchange trading floor. If more than one instruction is applicable to an order, this field can contain multiple instructions separated by space.
     Can contain multiple instructions, space delimited. Replacement order must be created with new parameters (i.e. original order values will not be brought forward to replacement order unless redefined within this message).*)
    f_OrderCancelReplaceRequest_ExecInst : fix_execinst option;
    (** Minimum quantity of an order to be executed.
     (Prior to FIX 4.2 this field was of type int)*)
    f_OrderCancelReplaceRequest_MinQty : fix_float option;
    (** Maximum quantity (e.g. number of shares) within an order to be shown on the exchange floor at any given time.
     (Prior to FIX 4.2 this field was of type int)*)
    f_OrderCancelReplaceRequest_MaxFloor : fix_float option;
    (** Execution destination as defined by institution when order is entered.
     Valid values:
     See "Appendix 6-C"*)
    f_OrderCancelReplaceRequest_ExDestination : fix_exchange option;
    (** Specifies the number of repeating TradingSessionIDs*)
    f_OrderCancelReplaceRequest_TrdgSesGrp : fix_trdgsesgrp;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"
     Must match original order*)
    f_OrderCancelReplaceRequest_Instrument : fix_instrument;
    (** Insert here the set of "FinancingDetails" (symbology) fields defined in "Common Components of Application Messages"
     Must match original order*)
    f_OrderCancelReplaceRequest_FinancingDetails : fix_financingdetails;
    (** Number of underlyings*)
    f_OrderCancelReplaceRequest_UndInstrmtGrp : fix_undinstrmtgrp;
    (** Side of order
     Should match original order's side, however, if bilaterally agreed to the following groups could potentially be interchanged:
     Buy and Buy Minus
     Sell, Sell Plus, Sell Short, and Sell Short Exempt
     Cross, Cross Short, and Cross Short Exempt*)
    f_OrderCancelReplaceRequest_Side : fix_side;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")
     Time this order request was initiated/released by the trader or trading system.*)
    f_OrderCancelReplaceRequest_TransactTime : fix_utctimestamp;
    (** Type of quantity specified in a quantity field*)
    f_OrderCancelReplaceRequest_QtyType : fix_qtytype option;
    (** Insert here the set of "OrderQtyData" fields defined in "Common Components of Application Messages"
     Note: OrderQty value should be the "Total Intended Order Quantity" (including the amount already executed for this chain of orders)*)
    f_OrderCancelReplaceRequest_OrderQtyData : fix_orderqtydata;
    (** Order type
     *** SOME VALUES ARE NO LONGER USED - See "Deprecated (Phased-out) Features and Supported Approach" ***
     (see Volume : "Glossary" for value definitions)*)
    f_OrderCancelReplaceRequest_OrdType : fix_ordtype;
    (** Code to represent the price type*)
    f_OrderCancelReplaceRequest_PriceType : fix_pricetype option;
    (** Price per unit of quantity (e.g. per share)
     Required for limit OrdTypes. For F/X orders, should be the "all-in" rate (spot rate adjusted for forward points). Can be used to specify a limit price for a pegged order, previously indicated, etc.*)
    f_OrderCancelReplaceRequest_Price : fix_float option;
    (** Price per unit of quantity (e.g. per share)
     Required for OrdType = "Stop" or OrdType = "Stop limit".*)
    f_OrderCancelReplaceRequest_StopPx : fix_float option;
    (** Insert here the set of "SpreadOrBenchmarkCurveData" (Fixed Income spread or benchmark curve) fields defined in "Common Components of Application Messages"*)
    f_OrderCancelReplaceRequest_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    (** Insert here the set of "YieldData" (yield-related) fields defined in "Common Components of Application Messages"*)
    f_OrderCancelReplaceRequest_YieldData : fix_yielddata;
    (** Insert here the set of "PegInstruction" fields defined in "Common Components of Application Messages"*)
    f_OrderCancelReplaceRequest_PegInstructions : fix_peginstructions;
    (** Insert here the set of "DiscretionInstruction" fields defined in "Common Components of Application Messages"*)
    f_OrderCancelReplaceRequest_DiscretionInstructions : fix_discretioninstructions;
    (** The target strategy of the order
     1000+ = Reserved and available for bi-laterally agreed upon user defined values
     The target strategy of the order*)
    f_OrderCancelReplaceRequest_TargetStrategy : fix_targetstrategy option;
    (** Field to allow further specification of the TargetStrategy – usage to be agreed between counterparties
     For further specification of the TargetStrategy*)
    f_OrderCancelReplaceRequest_TargetStrategyParameters : fix_string option;
    (** For a TargetStrategy=Participate order specifies the target particpation rate. For other order types this is a volume limit (i.e. do not be more than this percent of the market volume)
     Mandatory for a TargetStrategy=Participate order and specifies the target particpation rate.
     For other order types optionally specifies a volume limit (i.e. do not be more than this percent of the market volume)*)
    f_OrderCancelReplaceRequest_ParticipationRate : fix_float option;
    (** ID used to represent this transaction for compliance purposes (e.g. OATS reporting).*)
    f_OrderCancelReplaceRequest_ComplianceID : fix_string option;
    (** Indicates whether or not the order was solicited.*)
    f_OrderCancelReplaceRequest_SolicitedFlag : fix_solicitedflag option;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.
     Must match original order.*)
    f_OrderCancelReplaceRequest_Currency : fix_currency option;
    (** Specifies how long the order remains in effect. Absence of this field is interpreted as DAY.
     Absence of this field indicates Day order*)
    f_OrderCancelReplaceRequest_TimeInForce : fix_timeinforce option;
    (** Time the details within the message should take effect (always expressed in UTC (Universal Time Coordinated, also known as "GMT")
     Can specify the time at which the order should be considered valid*)
    f_OrderCancelReplaceRequest_EffectiveTime : fix_utctimestamp option;
    (** Date of order expiration (last day the order can trade), always expressed in terms of the local market date. The time at which the order expires is determined by the local market’s business practices
     Conditionally required if TimeInForce = GTD and ExpireTime is not specified.*)
    f_OrderCancelReplaceRequest_ExpireDate : fix_localmktdate option;
    (** Time/Date of order expiration (always expressed in UTC (Universal Time Coordinated, also known as "GMT")
     The meaning of expiration is specific to the context where the field is used.
     For orders, this is the expiration time of a Good Til Date TimeInForce.
     For Quotes - this is the expiration of the quote.
     Expiration time is provided across the quote message dialog to control the length of time of the overall quoting process.
     For collateral requests, this is the time by which collateral must be assigned.
     For collateral assignments, this is the time by which a response to the assignment is expected.
     Conditionally required if TimeInForce = GTD and ExpireDate is not specified.*)
    f_OrderCancelReplaceRequest_ExpireTime : fix_utctimestamp option;
    (** Code to identify whether to book out executions on a part-filled GT order on the day of execution or to accumulate
     States whether executions are booked out or accumulated on a partially filled GT order*)
    f_OrderCancelReplaceRequest_GTBookingInst : fix_gtbookinginst option;
    (** Insert here the set of "CommissionData" fields defined in "Common Components of Application Messages"*)
    f_OrderCancelReplaceRequest_CommissionData : fix_commissiondata;
    (** Designates the capacity of the firm placing the order
     (as of FIX 4.3, this field replaced Rule80A (tag 47) --used in conjunction with OrderRestrictions (529) field)
     (see Volume : "Glossary" for value definitions)*)
    f_OrderCancelReplaceRequest_OrderCapacity : fix_ordercapacity option;
    (** Restrictions associated with an order. If more than one restriction is applicable to an order, this field can contain multiple instructions separated by space.*)
    f_OrderCancelReplaceRequest_OrderRestrictions : fix_orderrestrictions option;
    (** Capacity of customer placing the order
     Primarily used by futures exchanges to indicate the CTICode (customer type indicator) as required by the US CFTC (Commodity Futures Trading Commission).*)
    f_OrderCancelReplaceRequest_CustOrderCapacity : fix_custordercapacity option;
    (** Indicates request for forex accommodation trade to be executed along with security transaction.
     Indicates that broker is requested to execute a Forex accommodation trade in conjunction with the security trade.*)
    f_OrderCancelReplaceRequest_ForexReq : fix_forexreq option;
    (** Currency code of settlement denomination.
     Required if ForexReq = Y.*)
    f_OrderCancelReplaceRequest_SettlCurrency : fix_currency option;
    (** Method for booking out this order. Used when notifying a broker that an order to be settled by that broker is to be booked out as an OTC derivative (e.g. CFD or similar).
     Method for booking out this order. Used when notifying a broker that an order to be settled by that broker is to be booked out as an OTC derivative (e.g. CFD or similar). Absence of this field implies regular booking.*)
    f_OrderCancelReplaceRequest_BookingType : fix_bookingtype option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_OrderCancelReplaceRequest_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_OrderCancelReplaceRequest_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_OrderCancelReplaceRequest_EncodedText : fix_string option;
    (** SettDate (64) of the future part of a F/X swap order.
     Can be used with OrdType = "Forex - Swap" to specify the "value date" for the future portion of a F/X swap.*)
    f_OrderCancelReplaceRequest_SettlDate2 : fix_localmktdate option;
    (** OrderQty (38) of the future part of a F/X swap order.
     Can be used with OrdType = "Forex - Swap" to specify the order quantity for the future portion of a F/X swap.*)
    f_OrderCancelReplaceRequest_OrderQty2 : fix_float option;
    (** Price of the future part of a F/X swap order.
     See Price (44) for description.
     Can be used with OrdType = "Forex - Swap" to specify the price for the future portion of a F/X swap.*)
    f_OrderCancelReplaceRequest_Price2 : fix_float option;
    (** Indicates whether the resulting position after a trade should be an opening position or closing position. Used for omnibus accounting - where accounts are held on a gross basis instead of being netted together.
     For use in derivatives omnibus accounting*)
    f_OrderCancelReplaceRequest_PositionEffect : fix_positioneffect option;
    (** Used for derivative products, such as options
     For use with derivatives, such as options*)
    f_OrderCancelReplaceRequest_CoveredOrUncovered : fix_coveredoruncovered option;
    (** Maximum quantity (e.g. number of shares) within an order to be shown to other customers (i.e. sent via an IOI).
     (Prior to FIX 4.2 this field was of type int)*)
    f_OrderCancelReplaceRequest_MaxShow : fix_float option;
    (** Indicates whether the broker is to locate the stock in conjunction with a short sell order.
     Required for short sell orders*)
    f_OrderCancelReplaceRequest_LocateReqd : fix_locatereqd option;
    (** For CIV – A one character code identifying whether Cancellation rights/Cooling off period applies
     For CIV - Optional*)
    f_OrderCancelReplaceRequest_CancellationRights : fix_cancellationrights option;
    (** A one character code identifying Money laundering status*)
    f_OrderCancelReplaceRequest_MoneyLaunderingStatus : fix_moneylaunderingstatus option;
    (** Unique identifier of the registration details as assigned by institution or intermediary.
     Reference to Registration Instructions message for this Order.*)
    f_OrderCancelReplaceRequest_RegistID : fix_string option;
    (** Free format text defining the designation to be associated with a holding on the register. Used to identify assets of a specific underlying investor using a common registration, e.g. a broker’s nominee or street name.
     Supplementary registration information for this Order*)
    f_OrderCancelReplaceRequest_Designation : fix_string option
}
;;

(** The order cancel request message requests the cancellation of all of the remaining quantity of an existing order.*)
type full_fix_ordercancelrequest_data = {
    (** ClOrdID () of the previous order (NOT the initial order of the day) as assigned by the institution, used to identify the previous order in cancel and cancel/replace requests.
     ClOrdID of the previous non-rejected order (NOT the initial order of the day) when canceling or replacing an order.*)
    f_OrderCancelRequest_OrigClOrdID : fix_string;
    (** Unique identifier for Order as assigned by sell-side (broker, exchange, ECN). Uniqueness must be guaranteed within a single trading day. Firms which accept multi-day orders should consider embedding a date within the OrderID field to assure uniqueness across days.
     Unique identifier of most recent order as assigned by sell-side (broker, exchange, ECN).*)
    f_OrderCancelRequest_OrderID : fix_string option;
    (** Unique identifier for Order as assigned by the buy-side (institution, broker, intermediary etc.) (identified by SenderCompID (49) or OnBehalfOfCompID (5) as appropriate). Uniqueness must be guaranteed within a single trading day. Firms, particularly those which electronically submit multi-day orders, trade globally or throughout market close periods, should ensure uniqueness across days, for example by embedding a date within the ClOrdID field.
     Unique ID of cancel request as assigned by the institution.*)
    f_OrderCancelRequest_ClOrdID : fix_string;
    (** Assigned by the party which originates the order. Can be used to provide the ClOrdID (11) used by an exchange or executing system.*)
    f_OrderCancelRequest_SecondaryClOrdID : fix_string option;
    (** Permits order originators to tie together groups of orders in which trades resulting from orders are associated for a specific purpose, for example the calculation of average execution price for a customer or to associate lists submitted to a broker as waves of a larger program trade.*)
    f_OrderCancelRequest_ClOrdLinkID : fix_string option;
    (** Unique identifier for list as assigned by institution, used to associate multiple individual orders. Uniqueness must be guaranteed within a single trading day. Firms which generate multi-day orders should consider embedding a date within the ListID field to assure uniqueness across days.
     Required for List Orders*)
    f_OrderCancelRequest_ListID : fix_string option;
    (** The most recent (or current) modification TransactTime (tag 60) reported on an Execution Report for the order.
     The OrigOrdModTime is provided as an optional field on Order Cancel Request and Order Cancel Replace Requests to identify that the state of the order has not changed since the request was issued.
     This is provided to support markets similar to Eurex and A/C/E.*)
    f_OrderCancelRequest_OrigOrdModTime : fix_utctimestamp option;
    (** Account mnemonic as agreed between buy and sell sides, e.g. broker and institution or investor/intermediary and fund manager.*)
    f_OrderCancelRequest_Account : fix_string option;
    (** Used to identify the source of the Account (1) code. This is especially useful if the account is a new account that the Respondent may not have setup yet in their system.*)
    f_OrderCancelRequest_AcctIDSource : fix_acctidsource option;
    (** Type of account associated with an order*)
    f_OrderCancelRequest_AccountType : fix_accounttype option;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_OrderCancelRequest_Parties : fix_parties;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_OrderCancelRequest_Instrument : fix_instrument;
    (** Insert here the set of "FinancingDetails" (symbology) fields defined in "Common Components of Application Messages"
     Must match original order*)
    f_OrderCancelRequest_FinancingDetails : fix_financingdetails;
    (** Number of underlyings*)
    f_OrderCancelRequest_UndInstrmtGrp : fix_undinstrmtgrp;
    (** Side of order*)
    f_OrderCancelRequest_Side : fix_side;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")
     Time this order request was initiated/released by the trader or trading system.*)
    f_OrderCancelRequest_TransactTime : fix_utctimestamp;
    (** Insert here the set of "OrderQtyData" fields defined in "Common Components of Application Messages"
     Note: OrderQty = CumQty + LeavesQty (see exceptions above)*)
    f_OrderCancelRequest_OrderQtyData : fix_orderqtydata;
    (** ID used to represent this transaction for compliance purposes (e.g. OATS reporting).*)
    f_OrderCancelRequest_ComplianceID : fix_string option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_OrderCancelRequest_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_OrderCancelRequest_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_OrderCancelRequest_EncodedText : fix_string option
}
;;

(** The Order Mass Cancel Report is used to acknowledge an Order Mass Cancel Request. Note that each affected order that is canceled is acknowledged with a separate Execution Report or Order Cancel Reject message.*)
type full_fix_ordermasscancelreport_data = {
    (** Unique identifier for Order as assigned by the buy-side (institution, broker, intermediary etc.) (identified by SenderCompID (49) or OnBehalfOfCompID (5) as appropriate). Uniqueness must be guaranteed within a single trading day. Firms, particularly those which electronically submit multi-day orders, trade globally or throughout market close periods, should ensure uniqueness across days, for example by embedding a date within the ClOrdID field.
     ClOrdID provided on the Order Mass Cancel Request.*)
    f_OrderMassCancelReport_ClOrdID : fix_string option;
    (** Assigned by the party which originates the order. Can be used to provide the ClOrdID (11) used by an exchange or executing system.*)
    f_OrderMassCancelReport_SecondaryClOrdID : fix_string option;
    (** Unique identifier for Order as assigned by sell-side (broker, exchange, ECN). Uniqueness must be guaranteed within a single trading day. Firms which accept multi-day orders should consider embedding a date within the OrderID field to assure uniqueness across days.
     Unique Identifier for the Order Mass Cancel Request assigned by the recipient of the Order Mass Cancel Request*)
    f_OrderMassCancelReport_OrderID : fix_string;
    (** Assigned by the party which accepts the order. Can be used to provide the OrderID (37) used by an exchange or executing system.
     Secondary Order ID assigned by the recipient of the Order Mass Cancel Request*)
    f_OrderMassCancelReport_SecondaryOrderID : fix_string option;
    (** Specifies scope of Order Mass Cancel Request
     Order Mass Cancel Request Type accepted by the system*)
    f_OrderMassCancelReport_MassCancelRequestType : fix_masscancelrequesttype;
    (** Specifies the action taken by counterparty order handling system as a result of the Order Mass Cancel Request
     Indicates the action taken by the counterparty order handling system as a result of the Cancel Request
     0 - Indicates Order Mass Cancel Request was rejected.*)
    f_OrderMassCancelReport_MassCancelResponse : fix_masscancelresponse;
    (** Reason Order Mass Cancel Request was rejected
     Indicates why Order Mass Cancel Request was rejected
     Required if MassCancelResponse = 0*)
    f_OrderMassCancelReport_MassCancelRejectReason : fix_masscancelrejectreason option;
    (** Total number of orders affected by mass cancel request.
     Optional field used to indicate the total number of orders affected by the Order Mass Cancel Request*)
    f_OrderMassCancelReport_TotalAffectedOrders : int option;
    (** Optional field used to indicate the number of order identifiers for orders affected by the Order Mass Cancel Request. Must be followed with OrigClOrdID as the next field*)
    f_OrderMassCancelReport_AffectedOrdGrp : fix_affectedordgrp;
    (** Identifier for Trading Session
     Can be used to represent a specific market trading session (e.g. "PRE-OPEN", "CROSS_2", "AFTER-HOURS", "TOSTNET", "TOSTNET2", etc).
     To specify good for session where session spans more than one calendar day, use TimeInForce = Day in conjunction with TradingSessionID.
     Values should be bi-laterally agreed to between counterparties.
     Firms may register Trading Session values on the FIX website (presently a document maintained within "ECN and Exchanges" working group section).
     Trading Session in which orders are to be canceled*)
    f_OrderMassCancelReport_TradingSessionID : fix_string option;
    (** Optional market assigned sub identifier for a trading session. Usage is determined by market or counterparties.
     Used by US based futures markets to identify exchange specific execution time bracket codes as required by US market regulations.*)
    f_OrderMassCancelReport_TradingSessionSubID : fix_string option;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_OrderMassCancelReport_Instrument : fix_instrument;
    (** Insert here the set of "UnderlyingInstrument" (underlying symbology) fields defined in "Common Components of Application Messages"*)
    f_OrderMassCancelReport_UnderlyingInstrument : fix_underlyinginstrument;
    (** Side of order
     Side of the market specified on the Order Mass Cancel Request*)
    f_OrderMassCancelReport_Side : fix_side option;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")
     Time this report was initiated/released by the sells-side (broker, exchange, ECN) or sell-side executing system.*)
    f_OrderMassCancelReport_TransactTime : fix_utctimestamp option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_OrderMassCancelReport_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_OrderMassCancelReport_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_OrderMassCancelReport_EncodedText : fix_string option
}
;;

(** The order mass cancel request message requests the cancellation of all of the remaining quantity of a group of orders matching criteria specified within the request. NOTE: This message can only be used to cancel order messages (reduce the full quantity).*)
type full_fix_ordermasscancelrequest_data = {
    (** Unique identifier for Order as assigned by the buy-side (institution, broker, intermediary etc.) (identified by SenderCompID (49) or OnBehalfOfCompID (5) as appropriate). Uniqueness must be guaranteed within a single trading day. Firms, particularly those which electronically submit multi-day orders, trade globally or throughout market close periods, should ensure uniqueness across days, for example by embedding a date within the ClOrdID field.
     Unique ID of Order Mass Cancel Request as assigned by the institution.*)
    f_OrderMassCancelRequest_ClOrdID : fix_string;
    (** Assigned by the party which originates the order. Can be used to provide the ClOrdID (11) used by an exchange or executing system.*)
    f_OrderMassCancelRequest_SecondaryClOrdID : fix_string option;
    (** Specifies scope of Order Mass Cancel Request
     Specifies the type of cancellation requested*)
    f_OrderMassCancelRequest_MassCancelRequestType : fix_masscancelrequesttype;
    (** Identifier for Trading Session
     Can be used to represent a specific market trading session (e.g. "PRE-OPEN", "CROSS_2", "AFTER-HOURS", "TOSTNET", "TOSTNET2", etc).
     To specify good for session where session spans more than one calendar day, use TimeInForce = Day in conjunction with TradingSessionID.
     Values should be bi-laterally agreed to between counterparties.
     Firms may register Trading Session values on the FIX website (presently a document maintained within "ECN and Exchanges" working group section).
     Trading Session in which orders are to be canceled*)
    f_OrderMassCancelRequest_TradingSessionID : fix_string option;
    (** Optional market assigned sub identifier for a trading session. Usage is determined by market or counterparties.
     Used by US based futures markets to identify exchange specific execution time bracket codes as required by US market regulations.*)
    f_OrderMassCancelRequest_TradingSessionSubID : fix_string option;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_OrderMassCancelRequest_Instrument : fix_instrument;
    (** Insert here the set of "UnderlyingInstrument" (underlying symbology) fields defined in "Common Components of Application Messages"*)
    f_OrderMassCancelRequest_UnderlyingInstrument : fix_underlyinginstrument;
    (** Side of order
     Optional qualifier used to indicate the side of the market for which orders are to be canceled. Absence of this field indicates that orders are to be canceled regardless of side.*)
    f_OrderMassCancelRequest_Side : fix_side option;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")
     Time this order request was initiated/released by the trader or trading system.*)
    f_OrderMassCancelRequest_TransactTime : fix_utctimestamp;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_OrderMassCancelRequest_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_OrderMassCancelRequest_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_OrderMassCancelRequest_EncodedText : fix_string option
}
;;

(** The order mass status request message requests the status for orders matching criteria specified within the request.*)
type full_fix_ordermassstatusrequest_data = {
    (** Value assigned by issuer of Mass Status Request to uniquely identify the request
     Unique ID of mass status request as assigned by the institution.*)
    f_OrderMassStatusRequest_MassStatusReqID : fix_string;
    (** Mass Status Request Type
     Specifies the scope of the mass status request*)
    f_OrderMassStatusRequest_MassStatusReqType : fix_massstatusreqtype;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_OrderMassStatusRequest_Parties : fix_parties;
    (** Account mnemonic as agreed between buy and sell sides, e.g. broker and institution or investor/intermediary and fund manager.
     Account*)
    f_OrderMassStatusRequest_Account : fix_string option;
    (** Used to identify the source of the Account (1) code. This is especially useful if the account is a new account that the Respondent may not have setup yet in their system.*)
    f_OrderMassStatusRequest_AcctIDSource : fix_acctidsource option;
    (** Identifier for Trading Session
     Can be used to represent a specific market trading session (e.g. "PRE-OPEN", "CROSS_2", "AFTER-HOURS", "TOSTNET", "TOSTNET2", etc).
     To specify good for session where session spans more than one calendar day, use TimeInForce = Day in conjunction with TradingSessionID.
     Values should be bi-laterally agreed to between counterparties.
     Firms may register Trading Session values on the FIX website (presently a document maintained within "ECN and Exchanges" working group section).
     Trading Session*)
    f_OrderMassStatusRequest_TradingSessionID : fix_string option;
    (** Optional market assigned sub identifier for a trading session. Usage is determined by market or counterparties.
     Used by US based futures markets to identify exchange specific execution time bracket codes as required by US market regulations.*)
    f_OrderMassStatusRequest_TradingSessionSubID : fix_string option;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_OrderMassStatusRequest_Instrument : fix_instrument;
    (** Insert here the set of "UnderlyingInstrument" (underlying symbology) fields defined in "Common Components of Application Messages"*)
    f_OrderMassStatusRequest_UnderlyingInstrument : fix_underlyinginstrument;
    (** Side of order
     Optional qualifier used to indicate the side of the market for which orders will be returned.*)
    f_OrderMassStatusRequest_Side : fix_side option
}
;;

(** The order status request message is used by the institution to generate an order status message back from the broker.*)
type full_fix_orderstatusrequest_data = {
    (** Unique identifier for Order as assigned by sell-side (broker, exchange, ECN). Uniqueness must be guaranteed within a single trading day. Firms which accept multi-day orders should consider embedding a date within the OrderID field to assure uniqueness across days.*)
    f_OrderStatusRequest_OrderID : fix_string option;
    (** Unique identifier for Order as assigned by the buy-side (institution, broker, intermediary etc.) (identified by SenderCompID (49) or OnBehalfOfCompID (5) as appropriate). Uniqueness must be guaranteed within a single trading day. Firms, particularly those which electronically submit multi-day orders, trade globally or throughout market close periods, should ensure uniqueness across days, for example by embedding a date within the ClOrdID field.
     The ClOrdID of the order whose status is being requested.*)
    f_OrderStatusRequest_ClOrdID : fix_string;
    (** Assigned by the party which originates the order. Can be used to provide the ClOrdID (11) used by an exchange or executing system.*)
    f_OrderStatusRequest_SecondaryClOrdID : fix_string option;
    (** Permits order originators to tie together groups of orders in which trades resulting from orders are associated for a specific purpose, for example the calculation of average execution price for a customer or to associate lists submitted to a broker as waves of a larger program trade.*)
    f_OrderStatusRequest_ClOrdLinkID : fix_string option;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_OrderStatusRequest_Parties : fix_parties;
    (** Can be used to uniquely identify a specific Order Status Request message.
     Optional, can be used to uniquely identify a specific Order Status Request message. Echoed back on Execution Report if provided.*)
    f_OrderStatusRequest_OrdStatusReqID : fix_string option;
    (** Account mnemonic as agreed between buy and sell sides, e.g. broker and institution or investor/intermediary and fund manager.*)
    f_OrderStatusRequest_Account : fix_string option;
    (** Used to identify the source of the Account (1) code. This is especially useful if the account is a new account that the Respondent may not have setup yet in their system.*)
    f_OrderStatusRequest_AcctIDSource : fix_acctidsource option;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_OrderStatusRequest_Instrument : fix_instrument;
    (** Insert here the set of "FinancingDetails" (symbology) fields defined in "Common Components of Application Messages"
     Must match original order*)
    f_OrderStatusRequest_FinancingDetails : fix_financingdetails;
    (** Number of underlyings*)
    f_OrderStatusRequest_UndInstrmtGrp : fix_undinstrmtgrp;
    (** Side of order*)
    f_OrderStatusRequest_Side : fix_side
}
;;

(** Position Maintenance Report*)
type full_fix_positionmaintenancereport_data = {
    (** Unique identifier for this position report
     Unique identifier for this position report*)
    f_PositionMaintenanceReport_PosMaintRptID : fix_string;
    (** Identifies the type of position transaction*)
    f_PositionMaintenanceReport_PosTransType : fix_postranstype;
    (** Unique identifier for the position maintenance request as assigned by the submitter
     Unique identifier for the position maintenance request associated with this report*)
    f_PositionMaintenanceReport_PosReqID : fix_string option;
    (** Maintenance Action to be performed*)
    f_PositionMaintenanceReport_PosMaintAction : fix_posmaintaction;
    (** Reference to the PosReqID (710) of a previous maintenance request that is being replaced or canceled.
     Reference to the PosReqID of a previous maintenance request that is being replaced or canceled.*)
    f_PositionMaintenanceReport_OrigPosReqRefID : fix_string;
    (** Status of Position Maintenance Request
     Status of Position Maintenance Request*)
    f_PositionMaintenanceReport_PosMaintStatus : fix_posmaintstatus;
    (** Result of Position Maintenance Request.*)
    f_PositionMaintenanceReport_PosMaintResult : fix_posmaintresult option;
    (** The "Clearing Business Date" referred to by this maintenance request.
     The Clearing Business Date covered by this request*)
    f_PositionMaintenanceReport_ClearingBusinessDate : fix_localmktdate;
    (** Identifies a specific settlement session
     Intraday(ITD), Regular Trading Hours(EOD),*)
    f_PositionMaintenanceReport_SettlSessID : fix_settlsessid option;
    (** SubID value associated with SettlSessID (76)*)
    f_PositionMaintenanceReport_SettlSessSubID : fix_string option;
    (** Position Account*)
    f_PositionMaintenanceReport_Parties : fix_parties;
    (** Account mnemonic as agreed between buy and sell sides, e.g. broker and institution or investor/intermediary and fund manager.*)
    f_PositionMaintenanceReport_Account : fix_string;
    (** Used to identify the source of the Account (1) code. This is especially useful if the account is a new account that the Respondent may not have setup yet in their system.*)
    f_PositionMaintenanceReport_AcctIDSource : fix_acctidsource option;
    (** Type of account associated with an order
     Type of account associated with the order (Origin)*)
    f_PositionMaintenanceReport_AccountType : fix_accounttype;
    f_PositionMaintenanceReport_Instrument : fix_instrument;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.*)
    f_PositionMaintenanceReport_Currency : fix_currency option;
    (** Specifies the number of legs that make up the Security*)
    f_PositionMaintenanceReport_InstrmtLegGrp : fix_instrmtleggrp;
    (** Specifies the number of underlying legs that make up the Security*)
    f_PositionMaintenanceReport_UndInstrmtGrp : fix_undinstrmtgrp;
    (** Specifies the number of repeating TradingSessionIDs*)
    f_PositionMaintenanceReport_TrdgSesGrp : fix_trdgsesgrp;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")
     Time this order request was initiated/released by the trader, trading system, or intermediary.*)
    f_PositionMaintenanceReport_TransactTime : fix_utctimestamp;
    (** See definition for Position Quantity in the Proposed Component Block section above*)
    f_PositionMaintenanceReport_PositionQty : fix_positionqty;
    (** Insert here here the set of "Position Amount Data" fields defined in "Common Components of Application Messages"*)
    f_PositionMaintenanceReport_PositionAmountData : fix_positionamountdata;
    (** Type of adjustment to be applied, used for PCS & PAJ
     Type of adjustment to be applied
     Delta_plus, Delta_minus, Final. If Adjustment Type is null, the PCS request will be processed as Margin Disposition only*)
    f_PositionMaintenanceReport_AdjustmentType : fix_adjustmenttype option;
    (** Amount that a position has to be in the money before it is exercised.*)
    f_PositionMaintenanceReport_ThresholdAmount : fix_float option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_PositionMaintenanceReport_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_PositionMaintenanceReport_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_PositionMaintenanceReport_EncodedText : fix_string option
}
;;

(** Position Maintenance Request*)
type full_fix_positionmaintenancerequest_data = {
    (** Unique identifier for the position maintenance request as assigned by the submitter
     Unique identifier for the position maintenance request as assigned by the submitter*)
    f_PositionMaintenanceRequest_PosReqID : fix_string;
    (** Identifies the type of position transaction*)
    f_PositionMaintenanceRequest_PosTransType : fix_postranstype;
    (** Maintenance Action to be performed*)
    f_PositionMaintenanceRequest_PosMaintAction : fix_posmaintaction;
    (** Reference to the PosReqID (710) of a previous maintenance request that is being replaced or canceled.
     Reference to the PosReqID of a previous maintenance request that is being replaced or canceled.*)
    f_PositionMaintenanceRequest_OrigPosReqRefID : fix_string option;
    (** Reference to a PosMaintRptID (721) from a previous Position Maintenance Report that is being replaced or canceled.
     Reference to a PosMaintRptID from a previous Position Maintenance Report that is being replaced or canceled.*)
    f_PositionMaintenanceRequest_PosMaintRptRefID : fix_string option;
    (** The "Clearing Business Date" referred to by this maintenance request.
     The Clearing Business Date referred to by this maintenance request*)
    f_PositionMaintenanceRequest_ClearingBusinessDate : fix_localmktdate;
    (** Identifies a specific settlement session*)
    f_PositionMaintenanceRequest_SettlSessID : fix_settlsessid option;
    (** SubID value associated with SettlSessID (76)*)
    f_PositionMaintenanceRequest_SettlSessSubID : fix_string option;
    (** The Following PartyRoles can be specified:
     ClearingOrganization
     Clearing Firm
     Position Account*)
    f_PositionMaintenanceRequest_Parties : fix_parties;
    (** Account mnemonic as agreed between buy and sell sides, e.g. broker and institution or investor/intermediary and fund manager.*)
    f_PositionMaintenanceRequest_Account : fix_string;
    (** Used to identify the source of the Account (1) code. This is especially useful if the account is a new account that the Respondent may not have setup yet in their system.*)
    f_PositionMaintenanceRequest_AcctIDSource : fix_acctidsource option;
    (** Type of account associated with an order
     Type of account associated with the order (Origin)*)
    f_PositionMaintenanceRequest_AccountType : fix_accounttype;
    f_PositionMaintenanceRequest_Instrument : fix_instrument;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.*)
    f_PositionMaintenanceRequest_Currency : fix_currency option;
    (** Specifies the number of legs that make up the Security*)
    f_PositionMaintenanceRequest_InstrmtLegGrp : fix_instrmtleggrp;
    (** Specifies the number of underlying legs that make up the Security*)
    f_PositionMaintenanceRequest_UndInstrmtGrp : fix_undinstrmtgrp;
    (** Specifies the number of repeating TradingSessionIDs*)
    f_PositionMaintenanceRequest_TrdgSesGrp : fix_trdgsesgrp;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")
     Time this order request was initiated/released by the trader, trading system, or intermediary.*)
    f_PositionMaintenanceRequest_TransactTime : fix_utctimestamp;
    f_PositionMaintenanceRequest_PositionQty : fix_positionqty;
    (** Type of adjustment to be applied, used for PCS & PAJ
     Type of adjustment to be applied, used for PCS & PAJ
     Delta_plus, Delta_minus, Final, If Adjustment Type is null, the request will be processed as Margin Disposition*)
    f_PositionMaintenanceRequest_AdjustmentType : fix_adjustmenttype option;
    (** Required to be set to true (Y) when a position maintenance request is being performed contrary to current money position.
     Required when an exercise of an out of the money position is requested or an abandonement (do not exercise ) for an in the money position.
     Boolean - if Y then indicates you are requesting a position maintenance that acting*)
    f_PositionMaintenanceRequest_ContraryInstructionIndicator : bool option;
    (** Indicates if requesting a rollover of prior day’s spread submissions.
     Boolean - Y indicates you are requesting rollover of prior day’s spread submissions*)
    f_PositionMaintenanceRequest_PriorSpreadIndicator : bool option;
    (** Amount that a position has to be in the money before it is exercised.*)
    f_PositionMaintenanceRequest_ThresholdAmount : fix_float option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_PositionMaintenanceRequest_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_PositionMaintenanceRequest_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_PositionMaintenanceRequest_EncodedText : fix_string option
}
;;

(** Position Report*)
type full_fix_positionreport_data = {
    (** Unique identifier for this position report
     Unique identifier for this position report*)
    f_PositionReport_PosMaintRptID : fix_string;
    (** Unique identifier for the position maintenance request as assigned by the submitter
     Unique identifier for the Request for Positions associated with this report
     This field should not be provided if the report was sent unsolicited.*)
    f_PositionReport_PosReqID : fix_string option;
    (** Unique identifier for the position maintenance request as assigned by the submitter*)
    f_PositionReport_PosReqType : fix_posreqtype option;
    (** Subscription Request Type
     Used to subscribe / unsubscribe for trade capture reports
     If the field is absent, the value 0 will be the default*)
    f_PositionReport_SubscriptionRequestType : fix_subscriptionrequesttype option;
    (** Total number of Position Reports being returned.
     Total number of Position Reports being returned*)
    f_PositionReport_TotalNumPosReports : int option;
    (** Indicates whether or not message is being sent as a result of a subscription request or not.
     Set to 'Y' if message is sent as a result of a subscription request or out of band configuration as opposed to a Position Request.*)
    f_PositionReport_UnsolicitedIndicator : fix_unsolicitedindicator option;
    (** Result of Request for Position
     4000+ Reserved and available for bi-laterally agreed upon user-defined values*)
    f_PositionReport_PosReqResult : fix_posreqresult;
    (** The "Clearing Business Date" referred to by this maintenance request.
     The Clearing Business Date referred to by this maintenance request*)
    f_PositionReport_ClearingBusinessDate : fix_localmktdate;
    (** Identifies a specific settlement session*)
    f_PositionReport_SettlSessID : fix_settlsessid option;
    (** SubID value associated with SettlSessID (76)*)
    f_PositionReport_SettlSessSubID : fix_string option;
    (** Position Account*)
    f_PositionReport_Parties : fix_parties;
    (** Account mnemonic as agreed between buy and sell sides, e.g. broker and institution or investor/intermediary and fund manager.*)
    f_PositionReport_Account : fix_string;
    (** Used to identify the source of the Account (1) code. This is especially useful if the account is a new account that the Respondent may not have setup yet in their system.*)
    f_PositionReport_AcctIDSource : fix_acctidsource option;
    (** Type of account associated with an order
     Type of account associated with the order (Origin)*)
    f_PositionReport_AccountType : fix_accounttype;
    f_PositionReport_Instrument : fix_instrument;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.*)
    f_PositionReport_Currency : fix_currency option;
    (** Settlement price*)
    f_PositionReport_SettlPrice : fix_float;
    (** Type of settlement price
     Values = Final, Theoretical*)
    f_PositionReport_SettlPriceType : fix_settlpricetype;
    (** Previous settlement price*)
    f_PositionReport_PriorSettlPrice : fix_float;
    (** Specifies the number of legs that make up the Security*)
    f_PositionReport_InstrmtLegGrp : fix_instrmtleggrp;
    (** Specifies the number of underlying legs that make up the Security*)
    f_PositionReport_PosUndInstrmtGrp : fix_posundinstrmtgrp;
    (** See definition for Position Quantity in the Proposed Component Block section above*)
    f_PositionReport_PositionQty : fix_positionqty;
    (** Insert here here the set of "Position Amount Data" fields defined in "Common Components of Application Messages"*)
    f_PositionReport_PositionAmountData : fix_positionamountdata;
    (** Registration status as returned by the broker or (for CIV) the fund manager
     RegNonRegInd*)
    f_PositionReport_RegistStatus : fix_registstatus option;
    (** Date of delivery.*)
    f_PositionReport_DeliveryDate : fix_localmktdate option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_PositionReport_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_PositionReport_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_PositionReport_EncodedText : fix_string option
}
;;

(** The Quote message is used as the response to a Quote Request or a Quote Response message in both indicative, tradeable, and restricted tradeable quoting markets.*)
type full_fix_quote_data = {
    (** Unique identifier for quote request
     Required when quote is in response to a Quote Request message*)
    f_Quote_QuoteReqID : fix_string option;
    (** Unique identifier for quote*)
    f_Quote_QuoteID : fix_string;
    (** Message reference for Quote Response
     Required when responding to the Quote Response message. The counterparty specified ID of the Quote Response message.*)
    f_Quote_QuoteRespID : fix_string option;
    (** Identifies the type of quote.
     An indicative quote is used to inform a counterparty of a market. An indicative quote does not result directly in a trade.
     A tradeable quote is submitted to a market and will result directly in a trade against other orders and quotes in a market.
     A restricted tradeable quote is submitted to a market and within a certain restriction (possibly based upon price or quantity) will automatically trade against orders. Order that do not comply with restrictions are sent to the quote issuer who can choose to accept or decline the order.
     A counter quote is used in the negotiation model. See Volume 7 – Product: Fixed Income for example usage.
     Quote Type
     If not specified, the default is an indicative quote*)
    f_Quote_QuoteType : fix_quotetype option;
    f_Quote_QuotQualGrp : fix_quotqualgrp;
    (** Level of Response requested from receiver of quote messages.
     Level of Response requested from receiver of quote messages.*)
    f_Quote_QuoteResponseLevel : fix_quoteresponselevel option;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_Quote_Parties : fix_parties;
    (** Identifier for Trading Session
     Can be used to represent a specific market trading session (e.g. "PRE-OPEN", "CROSS_2", "AFTER-HOURS", "TOSTNET", "TOSTNET2", etc).
     To specify good for session where session spans more than one calendar day, use TimeInForce = Day in conjunction with TradingSessionID.
     Values should be bi-laterally agreed to between counterparties.
     Firms may register Trading Session values on the FIX website (presently a document maintained within "ECN and Exchanges" working group section).*)
    f_Quote_TradingSessionID : fix_string option;
    (** Optional market assigned sub identifier for a trading session. Usage is determined by market or counterparties.
     Used by US based futures markets to identify exchange specific execution time bracket codes as required by US market regulations.*)
    f_Quote_TradingSessionSubID : fix_string option;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_Quote_Instrument : fix_instrument;
    (** Insert here the set of "FinancingDetails" (symbology) fields defined in "Common Components of Application Messages"*)
    f_Quote_FinancingDetails : fix_financingdetails;
    (** Number of underlyings*)
    f_Quote_UndInstrmtGrp : fix_undinstrmtgrp;
    (** Side of order
     Required for Tradeable or Counter quotes of single instruments*)
    f_Quote_Side : fix_side option;
    (** Required for Tradeable quotes or Counter quotes of single instruments*)
    f_Quote_OrderQtyData : fix_orderqtydata;
    (** Indicates order settlement period. If present, SettlDate (64) overrides this field. If both SettlType (63) and SettDate (64) are omitted, the default for SettlType (63) is 0 (Regular)
     Regular is defined as the default settlement period for the particular security on the exchange of execution.
     In Fixed Income the contents of this field may influence the instrument definition if the SecurityID (48) is ambiguous. In the US an active Treasury offering may be re-opened, and for a time one CUSIP will apply to both the current and "when-issued" securities. Supplying a value of "7" clarifies the instrument description; any other value or the absence of this field should cause the respondent to default to the active issue.*)
    f_Quote_SettlType : fix_settltype option;
    (** Specific date of trade settlement (SettlementDate) in YYYYMMDD format.
     If present, this field overrides SettlType (63). This field is required if the value of SettlType (63) is 6 (Future) or 8 (Sellers Option). This field must be omitted if the value of SettlType (63) is 7 (When and If Issued)
     (expressed in local time at place of settlement)
     Can be used with forex quotes to specify a specific "value date"*)
    f_Quote_SettlDate : fix_localmktdate option;
    (** SettDate (64) of the future part of a F/X swap order.
     Can be used with OrdType = "Forex - Swap" to specify the "value date" for the future portion of a F/X swap.*)
    f_Quote_SettlDate2 : fix_localmktdate option;
    (** OrderQty (38) of the future part of a F/X swap order.
     Can be used with OrdType = "Forex - Swap" to specify the order quantity for the future portion of a F/X swap.*)
    f_Quote_OrderQty2 : fix_float option;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.
     Can be used to specify the currency of the quoted prices. May differ from the ‘normal’ trading currency of the instrument being quoted*)
    f_Quote_Currency : fix_currency option;
    (** Insert here the set of "Stipulations" (repeating group of Fixed Income stipulations) fields defined in "Common Components of Application Messages"*)
    f_Quote_Stipulations : fix_stipulations;
    (** Account mnemonic as agreed between buy and sell sides, e.g. broker and institution or investor/intermediary and fund manager.*)
    f_Quote_Account : fix_string option;
    (** Used to identify the source of the Account (1) code. This is especially useful if the account is a new account that the Respondent may not have setup yet in their system.*)
    f_Quote_AcctIDSource : fix_acctidsource option;
    (** Type of account associated with an order
     Type of account associated with the order (Origin)*)
    f_Quote_AccountType : fix_accounttype option;
    (** Required for multileg quotes*)
    f_Quote_LegQuotGrp : fix_legquotgrp;
    (** Bid price/rate
     If F/X quote, should be the "all-in" rate (spot rate adjusted for forward points). Note that either BidPx, OfferPx or both must be specified.*)
    f_Quote_BidPx : fix_float option;
    (** Offer price/rate
     If F/X quote, should be the "all-in" rate (spot rate adjusted for forward points). Note that either BidPx, OfferPx or both must be specified.*)
    f_Quote_OfferPx : fix_float option;
    (** Used to indicate the best bid in a market
     Can be used by markets that require showing the current best bid and offer*)
    f_Quote_MktBidPx : fix_float option;
    (** Used to indicate the best offer in a market
     Can be used by markets that require showing the current best bid and offer*)
    f_Quote_MktOfferPx : fix_float option;
    (** Used to indicate a minimum quantity for a bid. If this field is used the BidSize (134) field is interpreted as the maximum bid size
     Specifies the minimum bid size. Used for markets that use a minimum and maximum bid size.*)
    f_Quote_MinBidSize : fix_float option;
    (** Quantity of bid
     (Prior to FIX 4.2 this field was of type int)
     Specifies the bid size. If MinBidSize is specified, BidSize is interpreted to contain the maximum bid size.*)
    f_Quote_BidSize : fix_float option;
    (** Used to indicate a minimum quantity for an offer. If this field is used the OfferSize (135) field is interpreted as the maximum offer size.
     Specifies the minimum offer size. If MinOfferSize is specified, OfferSize is interpreted to contain the maximum offer size.*)
    f_Quote_MinOfferSize : fix_float option;
    (** Quantity of offer
     (Prior to FIX 4.2 this field was of type int)
     Specified the offer size. If MinOfferSize is specified, OfferSize is interpreted to contain the maximum offer size.*)
    f_Quote_OfferSize : fix_float option;
    (** Indicates expiration time of indication message (always expressed in UTC (Universal Time Coordinated, also known as "GMT")
     The time when the quote will expire*)
    f_Quote_ValidUntilTime : fix_utctimestamp option;
    (** Bid F/X spot rate.
     May be applicable for F/X quotes*)
    f_Quote_BidSpotRate : fix_float option;
    (** Offer F/X spot rate.
     May be applicable for F/X quotes*)
    f_Quote_OfferSpotRate : fix_float option;
    (** Bid F/X forward points added to spot rate. May be a negative value.
     May be applicable for F/X quotes*)
    f_Quote_BidForwardPoints : fix_float option;
    (** Offer F/X forward points added to spot rate. May be a negative value.
     May be applicable for F/X quotes*)
    f_Quote_OfferForwardPoints : fix_float option;
    (** Mid price/rate*)
    f_Quote_MidPx : fix_float option;
    (** Bid yield*)
    f_Quote_BidYield : fix_float option;
    (** Mid yield*)
    f_Quote_MidYield : fix_float option;
    (** Offer yield*)
    f_Quote_OfferYield : fix_float option;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")*)
    f_Quote_TransactTime : fix_utctimestamp option;
    (** Order type
     *** SOME VALUES ARE NO LONGER USED - See "Deprecated (Phased-out) Features and Supported Approach" ***
     (see Volume : "Glossary" for value definitions)
     Can be used to specify the type of order the quote is for*)
    f_Quote_OrdType : fix_ordtype option;
    (** Bid F/X forward points of the future portion of a F/X swap quote added to spot rate. May be a negative value.
     Bid F/X forward points of the future portion of a F/X swap quote added to spot rate. May be a negative value*)
    f_Quote_BidForwardPoints2 : fix_float option;
    (** Offer F/X forward points of the future portion of a F/X swap quote added to spot rate. May be a negative value.
     Offer F/X forward points of the future portion of a F/X swap quote added to spot rate. May be a negative value*)
    f_Quote_OfferForwardPoints2 : fix_float option;
    (** Foreign exchange rate used to compute the bid "SettlCurrAmt" (119) from Currency (15) to SettlCurrency (120)
     Can be used when the quote is provided in a currency other than the instrument’s ‘normal’ trading currency. Applies to all bid prices contained in this quote message*)
    f_Quote_SettlCurrBidFxRate : fix_float option;
    (** Foreign exchange rate used to compute the offer "SettlCurrAmt" (119) from Currency (15) to SettlCurrency (120)
     Can be used when the quote is provided in a currency other than the instrument’s ‘normal’ trading currency. Applies to all offer prices contained in this quote message*)
    f_Quote_SettlCurrOfferFxRate : fix_float option;
    (** Specifies whether or not SettlCurrFxRate (55) should be multiplied or divided
     Can be used when the quote is provided in a currency other than the instruments trading currency.*)
    f_Quote_SettlCurrFxRateCalc : fix_settlcurrfxratecalc option;
    (** Commission type
     Can be used to show the counterparty the commission associated with the transaction.*)
    f_Quote_CommType : fix_commtype option;
    (** Commission. Note if CommType (3) is percentage, Commission of 5% should be represented as .05.
     Can be used to show the counterparty the commission associated with the transaction.*)
    f_Quote_Commission : fix_float option;
    (** Capacity of customer placing the order
     Primarily used by futures exchanges to indicate the CTICode (customer type indicator) as required by the US CFTC (Commodity Futures Trading Commission).
     For Futures Exchanges*)
    f_Quote_CustOrderCapacity : fix_custordercapacity option;
    (** Execution destination as defined by institution when order is entered.
     Valid values:
     See "Appendix 6-C"
     Used when routing quotes to multiple markets*)
    f_Quote_ExDestination : fix_exchange option;
    (** Designates the capacity of the firm placing the order
     (as of FIX 4.3, this field replaced Rule80A (tag 47) --used in conjunction with OrderRestrictions (529) field)
     (see Volume : "Glossary" for value definitions)*)
    f_Quote_OrderCapacity : fix_ordercapacity option;
    (** Code to represent the price type*)
    f_Quote_PriceType : fix_pricetype option;
    f_Quote_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    f_Quote_YieldData : fix_yielddata;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_Quote_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_Quote_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_Quote_EncodedText : fix_string option
}
;;

(** The Quote Cancel message is used by an originator of quotes to cancel quotes.*)
type full_fix_quotecancel_data = {
    (** Unique identifier for quote request
     Required when quote is in response to a Quote Request message*)
    f_QuoteCancel_QuoteReqID : fix_string option;
    (** Unique identifier for quote*)
    f_QuoteCancel_QuoteID : fix_string;
    (** Identifies the type of quote cancel.
     Identifies the type of Quote Cancel request.*)
    f_QuoteCancel_QuoteCancelType : fix_quotecanceltype;
    (** Level of Response requested from receiver of quote messages.
     Level of Response requested from receiver of quote messages.*)
    f_QuoteCancel_QuoteResponseLevel : fix_quoteresponselevel option;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_QuoteCancel_Parties : fix_parties;
    (** Account mnemonic as agreed between buy and sell sides, e.g. broker and institution or investor/intermediary and fund manager.*)
    f_QuoteCancel_Account : fix_string option;
    (** Used to identify the source of the Account (1) code. This is especially useful if the account is a new account that the Respondent may not have setup yet in their system.*)
    f_QuoteCancel_AcctIDSource : fix_acctidsource option;
    (** Type of account associated with an order
     Type of account associated with the order (Origin)*)
    f_QuoteCancel_AccountType : fix_accounttype option;
    (** Identifier for Trading Session
     Can be used to represent a specific market trading session (e.g. "PRE-OPEN", "CROSS_2", "AFTER-HOURS", "TOSTNET", "TOSTNET2", etc).
     To specify good for session where session spans more than one calendar day, use TimeInForce = Day in conjunction with TradingSessionID.
     Values should be bi-laterally agreed to between counterparties.
     Firms may register Trading Session values on the FIX website (presently a document maintained within "ECN and Exchanges" working group section).*)
    f_QuoteCancel_TradingSessionID : fix_string option;
    (** Optional market assigned sub identifier for a trading session. Usage is determined by market or counterparties.
     Used by US based futures markets to identify exchange specific execution time bracket codes as required by US market regulations.*)
    f_QuoteCancel_TradingSessionSubID : fix_string option;
    (** The number of securities (instruments) whose quotes are to be canceled
     Not required when cancelling all quotes.*)
    f_QuoteCancel_QuotCxlEntriesGrp : fix_quotcxlentriesgrp
}
;;

(** In some markets it is the practice to request quotes from brokers prior to placement of an order. The quote request message is used for this purpose. This message is commonly referred to as an Request For Quote (RFQ)*)
type full_fix_quoterequest_data = {
    (** Unique identifier for quote request*)
    f_QuoteRequest_QuoteReqID : fix_string;
    (** RFQ Request ID – used to identify an RFQ Request.
     For tradeable quote model - used to indicate to which RFQ Request this Quote Request is in response.*)
    f_QuoteRequest_RFQReqID : fix_string option;
    (** Unique identifier for Order as assigned by the buy-side (institution, broker, intermediary etc.) (identified by SenderCompID (49) or OnBehalfOfCompID (5) as appropriate). Uniqueness must be guaranteed within a single trading day. Firms, particularly those which electronically submit multi-day orders, trade globally or throughout market close periods, should ensure uniqueness across days, for example by embedding a date within the ClOrdID field.
     Required when QuoteType is Tradeable and the OrdType is Limit.*)
    f_QuoteRequest_ClOrdID : fix_string option;
    (** Designates the capacity of the firm placing the order
     (as of FIX 4.3, this field replaced Rule80A (tag 47) --used in conjunction with OrderRestrictions (529) field)
     (see Volume : "Glossary" for value definitions)*)
    f_QuoteRequest_OrderCapacity : fix_ordercapacity option;
    (** Number of related symbols (instruments) in Request*)
    f_QuoteRequest_QuotReqGrp : fix_quotreqgrp;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_QuoteRequest_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_QuoteRequest_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_QuoteRequest_EncodedText : fix_string option
}
;;

(** The Quote Request Reject message is used to reject Quote Request messages for all quoting models.*)
type full_fix_quoterequestreject_data = {
    (** Unique identifier for quote request*)
    f_QuoteRequestReject_QuoteReqID : fix_string;
    (** RFQ Request ID – used to identify an RFQ Request.
     For tradeable quote model - used to indicate to which RFQ Request this Quote Request is in response.*)
    f_QuoteRequestReject_RFQReqID : fix_string option;
    (** Reason Quote was rejected:
     Reason Quote was rejected*)
    f_QuoteRequestReject_QuoteRequestRejectReason : fix_quoterequestrejectreason;
    (** Number of related symbols (instruments) in Request*)
    f_QuoteRequestReject_QuotReqRjctGrp : fix_quotreqrjctgrp;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_QuoteRequestReject_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_QuoteRequestReject_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_QuoteRequestReject_EncodedText : fix_string option
}
;;

(** The Quote Response message is used to respond to a IOI message or Quote message.*)
type full_fix_quoteresponse_data = {
    (** Message reference for Quote Response
     Unique ID as assigned by the Initiator*)
    f_QuoteResponse_QuoteRespID : fix_string;
    (** Unique identifier for quote
     Required only when responding to a Quote.*)
    f_QuoteResponse_QuoteID : fix_string option;
    (** Identifies the type of Quote Response
     Type of response this Quote Response is.*)
    f_QuoteResponse_QuoteRespType : fix_quoteresptype;
    (** Unique identifier for Order as assigned by the buy-side (institution, broker, intermediary etc.) (identified by SenderCompID (49) or OnBehalfOfCompID (5) as appropriate). Uniqueness must be guaranteed within a single trading day. Firms, particularly those which electronically submit multi-day orders, trade globally or throughout market close periods, should ensure uniqueness across days, for example by embedding a date within the ClOrdID field.
     Required only when QuoteRespType is 1 (Hit/Lift) or 2 (Counter quote).*)
    f_QuoteResponse_ClOrdID : fix_string option;
    (** Designates the capacity of the firm placing the order
     (as of FIX 4.3, this field replaced Rule80A (tag 47) --used in conjunction with OrderRestrictions (529) field)
     (see Volume : "Glossary" for value definitions)*)
    f_QuoteResponse_OrderCapacity : fix_ordercapacity option;
    (** Unique identifier of IOI message.
     (Prior to FIX 4.1 this field was of type int)
     Required only when responding to an IOI.*)
    f_QuoteResponse_IOIID : fix_string option;
    (** Identifies the type of quote.
     An indicative quote is used to inform a counterparty of a market. An indicative quote does not result directly in a trade.
     A tradeable quote is submitted to a market and will result directly in a trade against other orders and quotes in a market.
     A restricted tradeable quote is submitted to a market and within a certain restriction (possibly based upon price or quantity) will automatically trade against orders. Order that do not comply with restrictions are sent to the quote issuer who can choose to accept or decline the order.
     A counter quote is used in the negotiation model. See Volume 7 – Product: Fixed Income for example usage.
     Default is Indicative.*)
    f_QuoteResponse_QuoteType : fix_quotetype option;
    f_QuoteResponse_QuotQualGrp : fix_quotqualgrp;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_QuoteResponse_Parties : fix_parties;
    (** Identifier for Trading Session
     Can be used to represent a specific market trading session (e.g. "PRE-OPEN", "CROSS_2", "AFTER-HOURS", "TOSTNET", "TOSTNET2", etc).
     To specify good for session where session spans more than one calendar day, use TimeInForce = Day in conjunction with TradingSessionID.
     Values should be bi-laterally agreed to between counterparties.
     Firms may register Trading Session values on the FIX website (presently a document maintained within "ECN and Exchanges" working group section).*)
    f_QuoteResponse_TradingSessionID : fix_string option;
    (** Optional market assigned sub identifier for a trading session. Usage is determined by market or counterparties.
     Used by US based futures markets to identify exchange specific execution time bracket codes as required by US market regulations.*)
    f_QuoteResponse_TradingSessionSubID : fix_string option;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"
     For multilegs supply minimally a value for Symbol (55).*)
    f_QuoteResponse_Instrument : fix_instrument;
    (** Insert here the set of "FinancingDetails" (symbology) fields defined in "Common Components of Application Messages"
     For multilegs supply minimally a value for Symbol (55).*)
    f_QuoteResponse_FinancingDetails : fix_financingdetails;
    (** Number of underlyings*)
    f_QuoteResponse_UndInstrmtGrp : fix_undinstrmtgrp;
    (** Side of order
     Required when countering a single instrument quote or "hit/lift" an IOI or Quote.*)
    f_QuoteResponse_Side : fix_side option;
    (** Insert here the set of "OrderQtyData" fields defined in "Common Components of Application Messages"
     Required when countering a single instrument quote or "hit/lift" an IOI or Quote.*)
    f_QuoteResponse_OrderQtyData : fix_orderqtydata;
    (** Indicates order settlement period. If present, SettlDate (64) overrides this field. If both SettlType (63) and SettDate (64) are omitted, the default for SettlType (63) is 0 (Regular)
     Regular is defined as the default settlement period for the particular security on the exchange of execution.
     In Fixed Income the contents of this field may influence the instrument definition if the SecurityID (48) is ambiguous. In the US an active Treasury offering may be re-opened, and for a time one CUSIP will apply to both the current and "when-issued" securities. Supplying a value of "7" clarifies the instrument description; any other value or the absence of this field should cause the respondent to default to the active issue.*)
    f_QuoteResponse_SettlType : fix_settltype option;
    (** Specific date of trade settlement (SettlementDate) in YYYYMMDD format.
     If present, this field overrides SettlType (63). This field is required if the value of SettlType (63) is 6 (Future) or 8 (Sellers Option). This field must be omitted if the value of SettlType (63) is 7 (When and If Issued)
     (expressed in local time at place of settlement)
     Can be used with forex quotes to specify a specific "value date"*)
    f_QuoteResponse_SettlDate : fix_localmktdate option;
    (** SettDate (64) of the future part of a F/X swap order.
     Can be used with OrdType = "Forex - Swap" to specify the "value date" for the future portion of a F/X swap.*)
    f_QuoteResponse_SettlDate2 : fix_localmktdate option;
    (** OrderQty (38) of the future part of a F/X swap order.
     Can be used with OrdType = "Forex - Swap" to specify the order quantity for the future portion of a F/X swap.*)
    f_QuoteResponse_OrderQty2 : fix_float option;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.
     Can be used to specify the currency of the quoted prices. May differ from the ‘normal’ trading currency of the instrument being quoted*)
    f_QuoteResponse_Currency : fix_currency option;
    (** Optional*)
    f_QuoteResponse_Stipulations : fix_stipulations;
    (** Account mnemonic as agreed between buy and sell sides, e.g. broker and institution or investor/intermediary and fund manager.*)
    f_QuoteResponse_Account : fix_string option;
    (** Used to identify the source of the Account (1) code. This is especially useful if the account is a new account that the Respondent may not have setup yet in their system.
     Used to identify the source of the Account code.*)
    f_QuoteResponse_AcctIDSource : fix_acctidsource option;
    (** Type of account associated with an order
     Type of account associated with the order (Origin)*)
    f_QuoteResponse_AccountType : fix_accounttype option;
    (** Required for multileg quote response*)
    f_QuoteResponse_LegQuotGrp : fix_legquotgrp;
    (** Bid price/rate
     If F/X quote, should be the "all-in" rate (spot rate adjusted for forward points). Note that either BidPx, OfferPx or both must be specified.*)
    f_QuoteResponse_BidPx : fix_float option;
    (** Offer price/rate
     If F/X quote, should be the "all-in" rate (spot rate adjusted for forward points). Note that either BidPx, OfferPx or both must be specified.*)
    f_QuoteResponse_OfferPx : fix_float option;
    (** Used to indicate the best bid in a market
     Can be used by markets that require showing the current best bid and offer*)
    f_QuoteResponse_MktBidPx : fix_float option;
    (** Used to indicate the best offer in a market
     Can be used by markets that require showing the current best bid and offer*)
    f_QuoteResponse_MktOfferPx : fix_float option;
    (** Used to indicate a minimum quantity for a bid. If this field is used the BidSize (134) field is interpreted as the maximum bid size
     Specifies the minimum bid size. Used for markets that use a minimum and maximum bid size.*)
    f_QuoteResponse_MinBidSize : fix_float option;
    (** Quantity of bid
     (Prior to FIX 4.2 this field was of type int)
     Specifies the bid size. If MinBidSize is specified, BidSize is interpreted to contain the maximum bid size.*)
    f_QuoteResponse_BidSize : fix_float option;
    (** Used to indicate a minimum quantity for an offer. If this field is used the OfferSize (135) field is interpreted as the maximum offer size.
     Specifies the minimum offer size. If MinOfferSize is specified, OfferSize is interpreted to contain the maximum offer size.*)
    f_QuoteResponse_MinOfferSize : fix_float option;
    (** Quantity of offer
     (Prior to FIX 4.2 this field was of type int)
     Specified the offer size. If MinOfferSize is specified, OfferSize is interpreted to contain the maximum offer size.*)
    f_QuoteResponse_OfferSize : fix_float option;
    (** Indicates expiration time of indication message (always expressed in UTC (Universal Time Coordinated, also known as "GMT")
     The time when the quote will expire.
     Required for FI when the QuoteRespType is 2 (Counter quote) to indicate to the Respondent when the counter offer is valid until.*)
    f_QuoteResponse_ValidUntilTime : fix_utctimestamp option;
    (** Bid F/X spot rate.
     May be applicable for F/X quotes*)
    f_QuoteResponse_BidSpotRate : fix_float option;
    (** Offer F/X spot rate.
     May be applicable for F/X quotes*)
    f_QuoteResponse_OfferSpotRate : fix_float option;
    (** Bid F/X forward points added to spot rate. May be a negative value.
     May be applicable for F/X quotes*)
    f_QuoteResponse_BidForwardPoints : fix_float option;
    (** Offer F/X forward points added to spot rate. May be a negative value.
     May be applicable for F/X quotes*)
    f_QuoteResponse_OfferForwardPoints : fix_float option;
    (** Mid price/rate*)
    f_QuoteResponse_MidPx : fix_float option;
    (** Bid yield*)
    f_QuoteResponse_BidYield : fix_float option;
    (** Mid yield*)
    f_QuoteResponse_MidYield : fix_float option;
    (** Offer yield*)
    f_QuoteResponse_OfferYield : fix_float option;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")*)
    f_QuoteResponse_TransactTime : fix_utctimestamp option;
    (** Order type
     *** SOME VALUES ARE NO LONGER USED - See "Deprecated (Phased-out) Features and Supported Approach" ***
     (see Volume : "Glossary" for value definitions)
     Can be used to specify the type of order the quote is for.*)
    f_QuoteResponse_OrdType : fix_ordtype option;
    (** Bid F/X forward points of the future portion of a F/X swap quote added to spot rate. May be a negative value.
     Bid F/X forward points of the future portion of a F/X swap quote added to spot rate. May be a negative value*)
    f_QuoteResponse_BidForwardPoints2 : fix_float option;
    (** Offer F/X forward points of the future portion of a F/X swap quote added to spot rate. May be a negative value.
     Offer F/X forward points of the future portion of a F/X swap quote added to spot rate. May be a negative value*)
    f_QuoteResponse_OfferForwardPoints2 : fix_float option;
    (** Foreign exchange rate used to compute the bid "SettlCurrAmt" (119) from Currency (15) to SettlCurrency (120)
     Can be used when the quote is provided in a currency other than the instrument’s ‘normal’ trading currency. Applies to all bid prices contained in this quote message*)
    f_QuoteResponse_SettlCurrBidFxRate : fix_float option;
    (** Foreign exchange rate used to compute the offer "SettlCurrAmt" (119) from Currency (15) to SettlCurrency (120)
     Can be used when the quote is provided in a currency other than the instrument’s ‘normal’ trading currency. Applies to all offer prices contained in this quote message*)
    f_QuoteResponse_SettlCurrOfferFxRate : fix_float option;
    (** Specifies whether or not SettlCurrFxRate (55) should be multiplied or divided
     Can be used when the quote is provided in a currency other than the instruments trading currency.*)
    f_QuoteResponse_SettlCurrFxRateCalc : fix_settlcurrfxratecalc option;
    (** Commission. Note if CommType (3) is percentage, Commission of 5% should be represented as .05.
     Can be used to show the counterparty the commission associated with the transaction.*)
    f_QuoteResponse_Commission : fix_float option;
    (** Commission type
     Can be used to show the counterparty the commission associated with the transaction.*)
    f_QuoteResponse_CommType : fix_commtype option;
    (** Capacity of customer placing the order
     Primarily used by futures exchanges to indicate the CTICode (customer type indicator) as required by the US CFTC (Commodity Futures Trading Commission).
     For Futures Exchanges*)
    f_QuoteResponse_CustOrderCapacity : fix_custordercapacity option;
    (** Execution destination as defined by institution when order is entered.
     Valid values:
     See "Appendix 6-C"
     Used when routing quotes to multiple markets*)
    f_QuoteResponse_ExDestination : fix_exchange option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_QuoteResponse_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_QuoteResponse_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_QuoteResponse_EncodedText : fix_string option;
    (** Price per unit of quantity (e.g. per share)*)
    f_QuoteResponse_Price : fix_float option;
    (** Code to represent the price type*)
    f_QuoteResponse_PriceType : fix_pricetype option;
    (** Insert here the set of "SpreadOrBenchmarkCurveData" fields defined in "Common Components of Application Messages"*)
    f_QuoteResponse_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    (** Insert here the set of "YieldData" fields defined in "Common Components of Application Messages"*)
    f_QuoteResponse_YieldData : fix_yielddata
}
;;

(** The quote status report message is used:
 * As the response to a Quote Status Request message
 * As a response to a Quote Cancel message
 * As a response to a Quote Response message in a negotiation dialog (see Volume 7 – PRODUCT: FIXED INCOME)*)
type full_fix_quotestatusreport_data = {
    (** Unique identifier for Quote Status Request.*)
    f_QuoteStatusReport_QuoteStatusReqID : fix_string option;
    (** Unique identifier for quote request
     Required when quote is in response to a Quote Request message*)
    f_QuoteStatusReport_QuoteReqID : fix_string option;
    (** Unique identifier for quote*)
    f_QuoteStatusReport_QuoteID : fix_string;
    (** Message reference for Quote Response
     Required when responding to a Quote Response message.*)
    f_QuoteStatusReport_QuoteRespID : fix_string option;
    (** Identifies the type of quote.
     An indicative quote is used to inform a counterparty of a market. An indicative quote does not result directly in a trade.
     A tradeable quote is submitted to a market and will result directly in a trade against other orders and quotes in a market.
     A restricted tradeable quote is submitted to a market and within a certain restriction (possibly based upon price or quantity) will automatically trade against orders. Order that do not comply with restrictions are sent to the quote issuer who can choose to accept or decline the order.
     A counter quote is used in the negotiation model. See Volume 7 – Product: Fixed Income for example usage.
     Quote Type
     If not specified, the default is an indicative quote*)
    f_QuoteStatusReport_QuoteType : fix_quotetype option;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_QuoteStatusReport_Parties : fix_parties;
    (** Identifier for Trading Session
     Can be used to represent a specific market trading session (e.g. "PRE-OPEN", "CROSS_2", "AFTER-HOURS", "TOSTNET", "TOSTNET2", etc).
     To specify good for session where session spans more than one calendar day, use TimeInForce = Day in conjunction with TradingSessionID.
     Values should be bi-laterally agreed to between counterparties.
     Firms may register Trading Session values on the FIX website (presently a document maintained within "ECN and Exchanges" working group section).*)
    f_QuoteStatusReport_TradingSessionID : fix_string option;
    (** Optional market assigned sub identifier for a trading session. Usage is determined by market or counterparties.
     Used by US based futures markets to identify exchange specific execution time bracket codes as required by US market regulations.*)
    f_QuoteStatusReport_TradingSessionSubID : fix_string option;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_QuoteStatusReport_Instrument : fix_instrument;
    (** Insert here the set of "FinancingDetails" (symbology) fields defined in "Common Components of Application Messages"*)
    f_QuoteStatusReport_FinancingDetails : fix_financingdetails;
    (** Number of underlyings*)
    f_QuoteStatusReport_UndInstrmtGrp : fix_undinstrmtgrp;
    (** Side of order*)
    f_QuoteStatusReport_Side : fix_side option;
    (** Required for Tradeable quotes of single instruments*)
    f_QuoteStatusReport_OrderQtyData : fix_orderqtydata;
    (** Indicates order settlement period. If present, SettlDate (64) overrides this field. If both SettlType (63) and SettDate (64) are omitted, the default for SettlType (63) is 0 (Regular)
     Regular is defined as the default settlement period for the particular security on the exchange of execution.
     In Fixed Income the contents of this field may influence the instrument definition if the SecurityID (48) is ambiguous. In the US an active Treasury offering may be re-opened, and for a time one CUSIP will apply to both the current and "when-issued" securities. Supplying a value of "7" clarifies the instrument description; any other value or the absence of this field should cause the respondent to default to the active issue.*)
    f_QuoteStatusReport_SettlType : fix_settltype option;
    (** Specific date of trade settlement (SettlementDate) in YYYYMMDD format.
     If present, this field overrides SettlType (63). This field is required if the value of SettlType (63) is 6 (Future) or 8 (Sellers Option). This field must be omitted if the value of SettlType (63) is 7 (When and If Issued)
     (expressed in local time at place of settlement)
     Can be used with forex quotes to specify a specific "value date"*)
    f_QuoteStatusReport_SettlDate : fix_localmktdate option;
    (** SettDate (64) of the future part of a F/X swap order.
     Can be used with OrdType = "Forex - Swap" to specify the "value date" for the future portion of a F/X swap.*)
    f_QuoteStatusReport_SettlDate2 : fix_localmktdate option;
    (** OrderQty (38) of the future part of a F/X swap order.
     Can be used with OrdType = "Forex - Swap" to specify the order quantity for the future portion of a F/X swap.*)
    f_QuoteStatusReport_OrderQty2 : fix_float option;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.
     Can be used to specify the currency of the quoted prices. May differ from the ‘normal’ trading currency of the instrument being quoted*)
    f_QuoteStatusReport_Currency : fix_currency option;
    f_QuoteStatusReport_Stipulations : fix_stipulations;
    (** Account mnemonic as agreed between buy and sell sides, e.g. broker and institution or investor/intermediary and fund manager.*)
    f_QuoteStatusReport_Account : fix_string option;
    (** Used to identify the source of the Account (1) code. This is especially useful if the account is a new account that the Respondent may not have setup yet in their system.*)
    f_QuoteStatusReport_AcctIDSource : fix_acctidsource option;
    (** Type of account associated with an order
     Type of account associated with the order (Origin)*)
    f_QuoteStatusReport_AccountType : fix_accounttype option;
    (** Required for multileg quote status reports*)
    f_QuoteStatusReport_LegQuotStatGrp : fix_legquotstatgrp;
    f_QuoteStatusReport_QuotQualGrp : fix_quotqualgrp;
    (** Time/Date of order expiration (always expressed in UTC (Universal Time Coordinated, also known as "GMT")
     The meaning of expiration is specific to the context where the field is used.
     For orders, this is the expiration time of a Good Til Date TimeInForce.
     For Quotes - this is the expiration of the quote.
     Expiration time is provided across the quote message dialog to control the length of time of the overall quoting process.
     For collateral requests, this is the time by which collateral must be assigned.
     For collateral assignments, this is the time by which a response to the assignment is expected.*)
    f_QuoteStatusReport_ExpireTime : fix_utctimestamp option;
    (** Price per unit of quantity (e.g. per share)*)
    f_QuoteStatusReport_Price : fix_float option;
    (** Code to represent the price type*)
    f_QuoteStatusReport_PriceType : fix_pricetype option;
    f_QuoteStatusReport_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    f_QuoteStatusReport_YieldData : fix_yielddata;
    (** Bid price/rate
     If F/X quote, should be the "all-in" rate (spot rate adjusted for forward points). Note that either BidPx, OfferPx or both must be specified.*)
    f_QuoteStatusReport_BidPx : fix_float option;
    (** Offer price/rate
     If F/X quote, should be the "all-in" rate (spot rate adjusted for forward points). Note that either BidPx, OfferPx or both must be specified.*)
    f_QuoteStatusReport_OfferPx : fix_float option;
    (** Used to indicate the best bid in a market
     Can be used by markets that require showing the current best bid and offer*)
    f_QuoteStatusReport_MktBidPx : fix_float option;
    (** Used to indicate the best offer in a market
     Can be used by markets that require showing the current best bid and offer*)
    f_QuoteStatusReport_MktOfferPx : fix_float option;
    (** Used to indicate a minimum quantity for a bid. If this field is used the BidSize (134) field is interpreted as the maximum bid size
     Specifies the minimum bid size. Used for markets that use a minimum and maximum bid size.*)
    f_QuoteStatusReport_MinBidSize : fix_float option;
    (** Quantity of bid
     (Prior to FIX 4.2 this field was of type int)
     Specifies the bid size. If MinBidSize is specified, BidSize is interpreted to contain the maximum bid size.*)
    f_QuoteStatusReport_BidSize : fix_float option;
    (** Used to indicate a minimum quantity for an offer. If this field is used the OfferSize (135) field is interpreted as the maximum offer size.
     Specifies the minimum offer size. If MinOfferSize is specified, OfferSize is interpreted to contain the maximum offer size.*)
    f_QuoteStatusReport_MinOfferSize : fix_float option;
    (** Quantity of offer
     (Prior to FIX 4.2 this field was of type int)
     Specified the offer size. If MinOfferSize is specified, OfferSize is interpreted to contain the maximum offer size.*)
    f_QuoteStatusReport_OfferSize : fix_float option;
    (** Indicates expiration time of indication message (always expressed in UTC (Universal Time Coordinated, also known as "GMT")*)
    f_QuoteStatusReport_ValidUntilTime : fix_utctimestamp option;
    (** Bid F/X spot rate.
     May be applicable for F/X quotes*)
    f_QuoteStatusReport_BidSpotRate : fix_float option;
    (** Offer F/X spot rate.
     May be applicable for F/X quotes*)
    f_QuoteStatusReport_OfferSpotRate : fix_float option;
    (** Bid F/X forward points added to spot rate. May be a negative value.
     May be applicable for F/X quotes*)
    f_QuoteStatusReport_BidForwardPoints : fix_float option;
    (** Offer F/X forward points added to spot rate. May be a negative value.
     May be applicable for F/X quotes*)
    f_QuoteStatusReport_OfferForwardPoints : fix_float option;
    (** Mid price/rate*)
    f_QuoteStatusReport_MidPx : fix_float option;
    (** Bid yield*)
    f_QuoteStatusReport_BidYield : fix_float option;
    (** Mid yield*)
    f_QuoteStatusReport_MidYield : fix_float option;
    (** Offer yield*)
    f_QuoteStatusReport_OfferYield : fix_float option;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")*)
    f_QuoteStatusReport_TransactTime : fix_utctimestamp option;
    (** Order type
     *** SOME VALUES ARE NO LONGER USED - See "Deprecated (Phased-out) Features and Supported Approach" ***
     (see Volume : "Glossary" for value definitions)
     Can be used to specify the type of order the quote is for*)
    f_QuoteStatusReport_OrdType : fix_ordtype option;
    (** Bid F/X forward points of the future portion of a F/X swap quote added to spot rate. May be a negative value.
     Bid F/X forward points of the future portion of a F/X swap quote added to spot rate. May be a negative value*)
    f_QuoteStatusReport_BidForwardPoints2 : fix_float option;
    (** Offer F/X forward points of the future portion of a F/X swap quote added to spot rate. May be a negative value.
     Offer F/X forward points of the future portion of a F/X swap quote added to spot rate. May be a negative value*)
    f_QuoteStatusReport_OfferForwardPoints2 : fix_float option;
    (** Foreign exchange rate used to compute the bid "SettlCurrAmt" (119) from Currency (15) to SettlCurrency (120)
     Can be used when the quote is provided in a currency other than the instrument’s ‘normal’ trading currency. Applies to all bid prices contained in this message*)
    f_QuoteStatusReport_SettlCurrBidFxRate : fix_float option;
    (** Foreign exchange rate used to compute the offer "SettlCurrAmt" (119) from Currency (15) to SettlCurrency (120)
     Can be used when the quote is provided in a currency other than the instrument’s ‘normal’ trading currency. Applies to all offer prices contained in this message*)
    f_QuoteStatusReport_SettlCurrOfferFxRate : fix_float option;
    (** Specifies whether or not SettlCurrFxRate (55) should be multiplied or divided
     Can be used when the quote is provided in a currency other than the instruments trading currency.*)
    f_QuoteStatusReport_SettlCurrFxRateCalc : fix_settlcurrfxratecalc option;
    (** Commission type
     Can be used to show the counterparty the commission associated with the transaction.*)
    f_QuoteStatusReport_CommType : fix_commtype option;
    (** Commission. Note if CommType (3) is percentage, Commission of 5% should be represented as .05.
     Can be used to show the counterparty the commission associated with the transaction.*)
    f_QuoteStatusReport_Commission : fix_float option;
    (** Capacity of customer placing the order
     Primarily used by futures exchanges to indicate the CTICode (customer type indicator) as required by the US CFTC (Commodity Futures Trading Commission).
     For Futures Exchanges*)
    f_QuoteStatusReport_CustOrderCapacity : fix_custordercapacity option;
    (** Execution destination as defined by institution when order is entered.
     Valid values:
     See "Appendix 6-C"
     Used when routing quotes to multiple markets*)
    f_QuoteStatusReport_ExDestination : fix_exchange option;
    (** Identifies the status of the quote acknowledgement
     Quote Status*)
    f_QuoteStatusReport_QuoteStatus : fix_quotestatus option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_QuoteStatusReport_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.*)
    f_QuoteStatusReport_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.*)
    f_QuoteStatusReport_EncodedText : fix_string option
}
;;

(** The quote status request message is used for the following purposes in markets that employ tradeable or restricted tradeable quotes:*)
type full_fix_quotestatusrequest_data = {
    (** Unique identifier for Quote Status Request.*)
    f_QuoteStatusRequest_QuoteStatusReqID : fix_string option;
    (** Unique identifier for quote*)
    f_QuoteStatusRequest_QuoteID : fix_string option;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_QuoteStatusRequest_Instrument : fix_instrument;
    (** Insert here the set of "FinancingDetails" (symbology) fields defined in "Common Components of Application Messages"*)
    f_QuoteStatusRequest_FinancingDetails : fix_financingdetails;
    (** Number of underlyings*)
    f_QuoteStatusRequest_UndInstrmtGrp : fix_undinstrmtgrp;
    (** Required for multileg quotes*)
    f_QuoteStatusRequest_InstrmtLegGrp : fix_instrmtleggrp;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_QuoteStatusRequest_Parties : fix_parties;
    (** Account mnemonic as agreed between buy and sell sides, e.g. broker and institution or investor/intermediary and fund manager.*)
    f_QuoteStatusRequest_Account : fix_string option;
    (** Used to identify the source of the Account (1) code. This is especially useful if the account is a new account that the Respondent may not have setup yet in their system.*)
    f_QuoteStatusRequest_AcctIDSource : fix_acctidsource option;
    (** Type of account associated with an order
     Type of account associated with the order (Origin)*)
    f_QuoteStatusRequest_AccountType : fix_accounttype option;
    (** Identifier for Trading Session
     Can be used to represent a specific market trading session (e.g. "PRE-OPEN", "CROSS_2", "AFTER-HOURS", "TOSTNET", "TOSTNET2", etc).
     To specify good for session where session spans more than one calendar day, use TimeInForce = Day in conjunction with TradingSessionID.
     Values should be bi-laterally agreed to between counterparties.
     Firms may register Trading Session values on the FIX website (presently a document maintained within "ECN and Exchanges" working group section).*)
    f_QuoteStatusRequest_TradingSessionID : fix_string option;
    (** Optional market assigned sub identifier for a trading session. Usage is determined by market or counterparties.
     Used by US based futures markets to identify exchange specific execution time bracket codes as required by US market regulations.*)
    f_QuoteStatusRequest_TradingSessionSubID : fix_string option;
    (** Subscription Request Type
     Used to subscribe for Quote Status Report messages*)
    f_QuoteStatusRequest_SubscriptionRequestType : fix_subscriptionrequesttype option
}
;;

(** In tradeable and restricted tradeable quoting markets – Quote Requests are issued by counterparties interested in ascertaining the market for an instrument.*)
type full_fix_rfqrequest_data = {
    (** RFQ Request ID – used to identify an RFQ Request.*)
    f_RFQRequest_RFQReqID : fix_string;
    (** Number of related symbols (instruments) in Request*)
    f_RFQRequest_RFQReqGrp : fix_rfqreqgrp;
    (** Subscription Request Type
     Used to subscribe for Quote Requests that are sent into a market*)
    f_RFQRequest_SubscriptionRequestType : fix_subscriptionrequesttype option
}
;;

(** The Registration Instructions message type may be used by institutions or retail intermediaries wishing to electronically submit registration information to a broker or fund manager (for CIV) for an order or for an allocation.*)
type full_fix_registrationinstructions_data = {
    (** Unique identifier of the registration details as assigned by institution or intermediary.*)
    f_RegistrationInstructions_RegistID : fix_string;
    (** Identifies Registration Instructions transaction type*)
    f_RegistrationInstructions_RegistTransType : fix_registtranstype;
    (** Reference identifier for the RegistID (53) with Cancel and Replace RegistTransType (54) transaction types.
     Required for Cancel and Replace RegistTransType messages*)
    f_RegistrationInstructions_RegistRefID : fix_string;
    (** Unique identifier for Order as assigned by the buy-side (institution, broker, intermediary etc.) (identified by SenderCompID (49) or OnBehalfOfCompID (5) as appropriate). Uniqueness must be guaranteed within a single trading day. Firms, particularly those which electronically submit multi-day orders, trade globally or throughout market close periods, should ensure uniqueness across days, for example by embedding a date within the ClOrdID field.
     Unique identifier of the order as assigned by institution or intermediary to which Registration relates*)
    f_RegistrationInstructions_ClOrdID : fix_string option;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_RegistrationInstructions_Parties : fix_parties;
    (** Account mnemonic as agreed between buy and sell sides, e.g. broker and institution or investor/intermediary and fund manager.*)
    f_RegistrationInstructions_Account : fix_string option;
    (** Used to identify the source of the Account (1) code. This is especially useful if the account is a new account that the Respondent may not have setup yet in their system.*)
    f_RegistrationInstructions_AcctIDSource : fix_acctidsource option;
    (** For CIV – a fund manager-defined code identifying which of the fund manager’s account types is required.*)
    f_RegistrationInstructions_RegistAcctType : fix_string option;
    (** For CIV - a code identifying the type of tax exempt account in which purchased shares/units are to be held*)
    f_RegistrationInstructions_TaxAdvantageType : fix_taxadvantagetype option;
    (** The relationship between Registration parties.*)
    f_RegistrationInstructions_OwnershipType : fix_ownershiptype option;
    (** Number of registration details in this message (number of repeating groups to follow)*)
    f_RegistrationInstructions_RgstDtlsGrp : fix_rgstdtlsgrp;
    (** Number of Distribution instructions in this message (number of repeating groups to follow)*)
    f_RegistrationInstructions_RgstDistInstGrp : fix_rgstdistinstgrp
}
;;

(** The Registration Instructions Response message type may be used by broker or fund manager (for CIV) in response to a Registration Instructions message submitted by an institution or retail intermediary for an order or for an allocation.*)
type full_fix_registrationinstructionsresponse_data = {
    (** Unique identifier of the registration details as assigned by institution or intermediary.
     Unique identifier of the original Registration Instructions details*)
    f_RegistrationInstructionsResponse_RegistID : fix_string;
    (** Identifies Registration Instructions transaction type
     Identifies original Registration Instructions transaction type*)
    f_RegistrationInstructionsResponse_RegistTransType : fix_registtranstype;
    (** Reference identifier for the RegistID (53) with Cancel and Replace RegistTransType (54) transaction types.
     Required for Cancel and Replace RegistTransType messages*)
    f_RegistrationInstructionsResponse_RegistRefID : fix_string;
    (** Unique identifier for Order as assigned by the buy-side (institution, broker, intermediary etc.) (identified by SenderCompID (49) or OnBehalfOfCompID (5) as appropriate). Uniqueness must be guaranteed within a single trading day. Firms, particularly those which electronically submit multi-day orders, trade globally or throughout market close periods, should ensure uniqueness across days, for example by embedding a date within the ClOrdID field.
     Unique identifier of the order as assigned by institution or intermediary.*)
    f_RegistrationInstructionsResponse_ClOrdID : fix_string option;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_RegistrationInstructionsResponse_Parties : fix_parties;
    (** Account mnemonic as agreed between buy and sell sides, e.g. broker and institution or investor/intermediary and fund manager.*)
    f_RegistrationInstructionsResponse_Account : fix_string option;
    (** Used to identify the source of the Account (1) code. This is especially useful if the account is a new account that the Respondent may not have setup yet in their system.*)
    f_RegistrationInstructionsResponse_AcctIDSource : fix_acctidsource option;
    (** Registration status as returned by the broker or (for CIV) the fund manager*)
    f_RegistrationInstructionsResponse_RegistStatus : fix_registstatus;
    (** Reason(s) why Registration Instructions has been rejected.
     The reason may be further amplified in the RegistRejReasonCode field.
     Possible values of reason code include:*)
    f_RegistrationInstructionsResponse_RegistRejReasonCode : fix_registrejreasoncode option;
    (** Text indicating reason(s) why a Registration Instruction has been rejected.*)
    f_RegistrationInstructionsResponse_RegistRejReasonText : fix_string option
}
;;

(** Request For Positions*)
type full_fix_requestforpositions_data = {
    (** Unique identifier for the position maintenance request as assigned by the submitter
     Unique identifier for the Request for Positions as assigned by the submitter*)
    f_RequestForPositions_PosReqID : fix_string;
    (** Unique identifier for the position maintenance request as assigned by the submitter*)
    f_RequestForPositions_PosReqType : fix_posreqtype;
    (** The status of this trade with respect to matching or comparison*)
    f_RequestForPositions_MatchStatus : fix_matchstatus option;
    (** Subscription Request Type
     Used to subscribe / unsubscribe for trade capture reports
     If the field is absent, the value 0 will be the default*)
    f_RequestForPositions_SubscriptionRequestType : fix_subscriptionrequesttype option;
    (** Position Account*)
    f_RequestForPositions_Parties : fix_parties;
    (** Account mnemonic as agreed between buy and sell sides, e.g. broker and institution or investor/intermediary and fund manager.*)
    f_RequestForPositions_Account : fix_string;
    (** Used to identify the source of the Account (1) code. This is especially useful if the account is a new account that the Respondent may not have setup yet in their system.*)
    f_RequestForPositions_AcctIDSource : fix_acctidsource option;
    (** Type of account associated with an order
     Type of account associated with the order (Origin)*)
    f_RequestForPositions_AccountType : fix_accounttype;
    f_RequestForPositions_Instrument : fix_instrument;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.*)
    f_RequestForPositions_Currency : fix_currency option;
    (** Specifies the number of legs that make up the Security*)
    f_RequestForPositions_InstrmtLegGrp : fix_instrmtleggrp;
    (** Specifies the number of underlying legs that make up the Security*)
    f_RequestForPositions_UndInstrmtGrp : fix_undinstrmtgrp;
    (** The "Clearing Business Date" referred to by this maintenance request.
     The Clearing Business Date referred to by this request*)
    f_RequestForPositions_ClearingBusinessDate : fix_localmktdate;
    (** Identifies a specific settlement session
     Intraday(ITD), Regular Trading Hours(EOD)*)
    f_RequestForPositions_SettlSessID : fix_settlsessid option;
    (** SubID value associated with SettlSessID (76)*)
    f_RequestForPositions_SettlSessSubID : fix_string option;
    (** Specifies the number of repeating TradingSessionIDs*)
    f_RequestForPositions_TrdgSesGrp : fix_trdgsesgrp;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")
     Time this order request was initiated/released by the trader, trading system, or intermediary.*)
    f_RequestForPositions_TransactTime : fix_utctimestamp;
    (** Identifies how the response to the request should be transmitted
     Ability to specify whether the response to the request should be delivered inband or via pre-arranged out-of-band transport.*)
    f_RequestForPositions_ResponseTransportType : fix_responsetransporttype option;
    (** URI (Uniform Resource Identifier) for details) or other pre-arranged value. Used in conjunction with ResponseTransportType (725) value of Out-of-Band to identify the out-of-band destination.
     See "Appendix 6-B FIX Fields Based Upon Other Standards"
     URI destination name. Used if ResponseTransportType is out-of-band.*)
    f_RequestForPositions_ResponseDestination : fix_string option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_RequestForPositions_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_RequestForPositions_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_RequestForPositions_EncodedText : fix_string option
}
;;

(** Request for Positions Ack*)
type full_fix_requestforpositionsack_data = {
    (** Unique identifier for this position report
     Unique identifier for this position report*)
    f_RequestForPositionsAck_PosMaintRptID : fix_string;
    (** Unique identifier for the position maintenance request as assigned by the submitter
     Unique identifier for the Request for Position associated with this report
     This field should not be provided if the report was sent unsolicited.*)
    f_RequestForPositionsAck_PosReqID : fix_string option;
    (** Total number of Position Reports being returned.
     Total number of Position Reports being returned*)
    f_RequestForPositionsAck_TotalNumPosReports : int option;
    (** Indicates whether or not message is being sent as a result of a subscription request or not.
     Set to 'Y' if message is sent as a result of a subscription request or out of band configuration as opposed to a Position Request.*)
    f_RequestForPositionsAck_UnsolicitedIndicator : fix_unsolicitedindicator option;
    (** Result of Request for Position
     4000+ Reserved and available for bi-laterally agreed upon user-defined values*)
    f_RequestForPositionsAck_PosReqResult : fix_posreqresult;
    (** Status of Request for Positions*)
    f_RequestForPositionsAck_PosReqStatus : fix_posreqstatus;
    (** Position Account*)
    f_RequestForPositionsAck_Parties : fix_parties;
    (** Account mnemonic as agreed between buy and sell sides, e.g. broker and institution or investor/intermediary and fund manager.*)
    f_RequestForPositionsAck_Account : fix_string;
    (** Used to identify the source of the Account (1) code. This is especially useful if the account is a new account that the Respondent may not have setup yet in their system.*)
    f_RequestForPositionsAck_AcctIDSource : fix_acctidsource option;
    (** Type of account associated with an order
     Type of account associated with the order (Origin)*)
    f_RequestForPositionsAck_AccountType : fix_accounttype;
    f_RequestForPositionsAck_Instrument : fix_instrument;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.*)
    f_RequestForPositionsAck_Currency : fix_currency option;
    (** Specifies the number of legs that make up the Security*)
    f_RequestForPositionsAck_InstrmtLegGrp : fix_instrmtleggrp;
    (** Specifies the number of underlying legs that make up the Security*)
    f_RequestForPositionsAck_UndInstrmtGrp : fix_undinstrmtgrp;
    (** Identifies how the response to the request should be transmitted
     Ability to specify whether the response to the request should be delivered inband or via pre-arranged out-of-band transport.*)
    f_RequestForPositionsAck_ResponseTransportType : fix_responsetransporttype option;
    (** URI (Uniform Resource Identifier) for details) or other pre-arranged value. Used in conjunction with ResponseTransportType (725) value of Out-of-Band to identify the out-of-band destination.
     See "Appendix 6-B FIX Fields Based Upon Other Standards"
     URI destination name. Used if ResponseTransportType is out-of-band.*)
    f_RequestForPositionsAck_ResponseDestination : fix_string option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_RequestForPositionsAck_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_RequestForPositionsAck_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_RequestForPositionsAck_EncodedText : fix_string option
}
;;

(** The Security Definition message is used for the following:
 1. Accept the security defined in a Security Definition message.
 2. Accept the security defined in a Security Definition message with changes to the definition and/or identity of the security.
 3. Reject the security requested in a Security Definition message*)
type full_fix_securitydefinition_data = {
    (** Unique ID of a Security Definition Request.*)
    f_SecurityDefinition_SecurityReqID : fix_string;
    (** Unique ID of a Security Definition message.
     Identifier for the Security Definition message*)
    f_SecurityDefinition_SecurityResponseID : fix_string;
    (** Type of Security Definition message response
     Response to the Security Definition Request*)
    f_SecurityDefinition_SecurityResponseType : fix_securityresponsetype;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"
     of the requested Security*)
    f_SecurityDefinition_Instrument : fix_instrument;
    (** Insert here the set of "InstrumentExtension" fields defined in "Common Components of Application Messages"*)
    f_SecurityDefinition_InstrumentExtension : fix_instrumentextension;
    (** Number of underlyings*)
    f_SecurityDefinition_UndInstrmtGrp : fix_undinstrmtgrp;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.*)
    f_SecurityDefinition_Currency : fix_currency option;
    (** Identifier for Trading Session
     Can be used to represent a specific market trading session (e.g. "PRE-OPEN", "CROSS_2", "AFTER-HOURS", "TOSTNET", "TOSTNET2", etc).
     To specify good for session where session spans more than one calendar day, use TimeInForce = Day in conjunction with TradingSessionID.
     Values should be bi-laterally agreed to between counterparties.
     Firms may register Trading Session values on the FIX website (presently a document maintained within "ECN and Exchanges" working group section).*)
    f_SecurityDefinition_TradingSessionID : fix_string option;
    (** Optional market assigned sub identifier for a trading session. Usage is determined by market or counterparties.
     Used by US based futures markets to identify exchange specific execution time bracket codes as required by US market regulations.*)
    f_SecurityDefinition_TradingSessionSubID : fix_string option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)
     Comment, instructions, or other identifying information.*)
    f_SecurityDefinition_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_SecurityDefinition_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_SecurityDefinition_EncodedText : fix_string option;
    (** Number of legs that make up the Security*)
    f_SecurityDefinition_InstrmtLegGrp : fix_instrmtleggrp;
    (** Part of trading cycle when an instrument expires. Field is applicable for derivatives.*)
    f_SecurityDefinition_ExpirationCycle : fix_expirationcycle option;
    (** The trading lot size of a security*)
    f_SecurityDefinition_RoundLot : fix_float option;
    (** The minimum trading volume for a security*)
    f_SecurityDefinition_MinTradeVol : fix_float option
}
;;

(** The Security Definition Request message is used for the following:
 1. Request a specific Security to be traded with the second party. The request security can be defined as a multileg security made up of one or more instrument legs.*)
type full_fix_securitydefinitionrequest_data = {
    (** Unique ID of a Security Definition Request.*)
    f_SecurityDefinitionRequest_SecurityReqID : fix_string;
    (** Type of Security Definition Request.*)
    f_SecurityDefinitionRequest_SecurityRequestType : fix_securityrequesttype;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"
     of the requested Security*)
    f_SecurityDefinitionRequest_Instrument : fix_instrument;
    (** Insert here the set of "InstrumentExtension" fields defined in "Common Components of Application Messages"*)
    f_SecurityDefinitionRequest_InstrumentExtension : fix_instrumentextension;
    (** Number of underlyings*)
    f_SecurityDefinitionRequest_UndInstrmtGrp : fix_undinstrmtgrp;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.*)
    f_SecurityDefinitionRequest_Currency : fix_currency option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)
     Comment, instructions, or other identifying information.*)
    f_SecurityDefinitionRequest_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_SecurityDefinitionRequest_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_SecurityDefinitionRequest_EncodedText : fix_string option;
    (** Identifier for Trading Session
     Can be used to represent a specific market trading session (e.g. "PRE-OPEN", "CROSS_2", "AFTER-HOURS", "TOSTNET", "TOSTNET2", etc).
     To specify good for session where session spans more than one calendar day, use TimeInForce = Day in conjunction with TradingSessionID.
     Values should be bi-laterally agreed to between counterparties.
     Firms may register Trading Session values on the FIX website (presently a document maintained within "ECN and Exchanges" working group section).
     Optional Trading Session Identifier to specify a particular trading session for which you want to obtain a list of securities that are tradeable.*)
    f_SecurityDefinitionRequest_TradingSessionID : fix_string option;
    (** Optional market assigned sub identifier for a trading session. Usage is determined by market or counterparties.
     Used by US based futures markets to identify exchange specific execution time bracket codes as required by US market regulations.*)
    f_SecurityDefinitionRequest_TradingSessionSubID : fix_string option;
    (** Number of legs that make up the Security*)
    f_SecurityDefinitionRequest_InstrmtLegGrp : fix_instrmtleggrp;
    (** Part of trading cycle when an instrument expires. Field is applicable for derivatives.*)
    f_SecurityDefinitionRequest_ExpirationCycle : fix_expirationcycle option;
    (** Subscription Request Type
     Subscribe or unsubscribe for security status to security specified in request.*)
    f_SecurityDefinitionRequest_SubscriptionRequestType : fix_subscriptionrequesttype option
}
;;

(** The Security List message is used to return a list of securities that matches the criteria specified in a Security List Request.*)
type full_fix_securitylist_data = {
    (** Unique ID of a Security Definition Request.*)
    f_SecurityList_SecurityReqID : fix_string;
    (** Unique ID of a Security Definition message.
     Identifier for the Security List message*)
    f_SecurityList_SecurityResponseID : fix_string;
    (** The results returned to a Security Request message
     Result of the Security Request identified by the SecurityReqID*)
    f_SecurityList_SecurityRequestResult : fix_securityrequestresult;
    (** Total number of securities.
     (Prior to FIX 4.4 this field was named TotalNumSecurities)
     Used to indicate the total number of securities being returned for this request. Used in the event that message fragmentation is required.*)
    f_SecurityList_TotNoRelatedSym : int option;
    (** Indicates whether this message is the last in a sequence of messages for those messages that support fragmentation, such as Allocation Instruction, Mass Quote, Security List, Derivative Security List
     Indicates whether this is the last fragment in a sequence of message fragments. Only required where message has been fragmented.*)
    f_SecurityList_LastFragment : fix_lastfragment option;
    (** Specifies the number of repeating symbols (instruments) specified*)
    f_SecurityList_SecListGrp : fix_seclistgrp
}
;;

(** The Security List Request message is used to return a list of securities from the counterparty that match criteria provided on the request*)
type full_fix_securitylistrequest_data = {
    (** Unique ID of a Security Definition Request.*)
    f_SecurityListRequest_SecurityReqID : fix_string;
    (** Identifies the type/criteria of Security List Request
     Type of Security List Request being made*)
    f_SecurityListRequest_SecurityListRequestType : fix_securitylistrequesttype;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"
     of the requested Security*)
    f_SecurityListRequest_Instrument : fix_instrument;
    (** Insert here the set of "InstrumentExtension" fields defined in "Common Components of Application Messages"*)
    f_SecurityListRequest_InstrumentExtension : fix_instrumentextension;
    (** Insert here the set of "FinancingDetails" fields defined in "Common Components of Application Messages"*)
    f_SecurityListRequest_FinancingDetails : fix_financingdetails;
    (** Number of underlyings*)
    f_SecurityListRequest_UndInstrmtGrp : fix_undinstrmtgrp;
    (** Number of legs that make up the Security*)
    f_SecurityListRequest_InstrmtLegGrp : fix_instrmtleggrp;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.*)
    f_SecurityListRequest_Currency : fix_currency option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)
     Comment, instructions, or other identifying information.*)
    f_SecurityListRequest_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_SecurityListRequest_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_SecurityListRequest_EncodedText : fix_string option;
    (** Identifier for Trading Session
     Can be used to represent a specific market trading session (e.g. "PRE-OPEN", "CROSS_2", "AFTER-HOURS", "TOSTNET", "TOSTNET2", etc).
     To specify good for session where session spans more than one calendar day, use TimeInForce = Day in conjunction with TradingSessionID.
     Values should be bi-laterally agreed to between counterparties.
     Firms may register Trading Session values on the FIX website (presently a document maintained within "ECN and Exchanges" working group section).
     Optional Trading Session Identifier to specify a particular trading session for which you want to obtain a list of securities that are tradeable.*)
    f_SecurityListRequest_TradingSessionID : fix_string option;
    (** Optional market assigned sub identifier for a trading session. Usage is determined by market or counterparties.
     Used by US based futures markets to identify exchange specific execution time bracket codes as required by US market regulations.*)
    f_SecurityListRequest_TradingSessionSubID : fix_string option;
    (** Subscription Request Type
     Subscribe or unsubscribe for security status to security specified in request.*)
    f_SecurityListRequest_SubscriptionRequestType : fix_subscriptionrequesttype option
}
;;

(** The Security Status message provides for the ability to report changes in status to a security.*)
type full_fix_securitystatus_data = {
    (** Unique ID of a Security Status Request message.*)
    f_SecurityStatus_SecurityStatusReqID : fix_string option;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_SecurityStatus_Instrument : fix_instrument;
    (** Insert here the set of "InstrumentExtension" fields defined in "Common Components of Application Messages"*)
    f_SecurityStatus_InstrumentExtension : fix_instrumentextension;
    (** Number of underlyings*)
    f_SecurityStatus_UndInstrmtGrp : fix_undinstrmtgrp;
    (** Required for multileg quotes*)
    f_SecurityStatus_InstrmtLegGrp : fix_instrmtleggrp;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.*)
    f_SecurityStatus_Currency : fix_currency option;
    (** Identifier for Trading Session
     Can be used to represent a specific market trading session (e.g. "PRE-OPEN", "CROSS_2", "AFTER-HOURS", "TOSTNET", "TOSTNET2", etc).
     To specify good for session where session spans more than one calendar day, use TimeInForce = Day in conjunction with TradingSessionID.
     Values should be bi-laterally agreed to between counterparties.
     Firms may register Trading Session values on the FIX website (presently a document maintained within "ECN and Exchanges" working group section).*)
    f_SecurityStatus_TradingSessionID : fix_string option;
    (** Optional market assigned sub identifier for a trading session. Usage is determined by market or counterparties.
     Used by US based futures markets to identify exchange specific execution time bracket codes as required by US market regulations.*)
    f_SecurityStatus_TradingSessionSubID : fix_string option;
    (** Indicates whether or not message is being sent as a result of a subscription request or not.
     Set to 'Y' if message is sent as a result of a subscription request not a snapshot request*)
    f_SecurityStatus_UnsolicitedIndicator : fix_unsolicitedindicator option;
    (** Identifies the trading status applicable to the transaction
     Identifies the trading status applicable to the transaction.*)
    f_SecurityStatus_SecurityTradingStatus : fix_securitytradingstatus option;
    (** Identifies a firm’s financial status*)
    f_SecurityStatus_FinancialStatus : fix_financialstatus option;
    (** Identifies the type of Corporate Action*)
    f_SecurityStatus_CorporateAction : fix_corporateaction option;
    (** Denotes the reason for the Opening Delay or Trading Halt
     Denotes the reason for the Opening Delay or Trading Halt.*)
    f_SecurityStatus_HaltReason : fix_haltreason option;
    (** Indicates whether or not the halt was due to Common Stock trading being halted.*)
    f_SecurityStatus_InViewOfCommon : fix_inviewofcommon option;
    (** Indicates whether or not the halt was due to the Related Security being halted.*)
    f_SecurityStatus_DueToRelated : fix_duetorelated option;
    (** Quantity bought.*)
    f_SecurityStatus_BuyVolume : fix_float option;
    (** Quantity sold.*)
    f_SecurityStatus_SellVolume : fix_float option;
    (** Represents an indication of the high end of the price range for a security prior to the open or reopen*)
    f_SecurityStatus_HighPx : fix_float option;
    (** Represents an indication of the low end of the price range for a security prior to the open or reopen*)
    f_SecurityStatus_LowPx : fix_float option;
    (** Price of this (last) fill.
     Represents the last price for that security either on a Consolidated or an individual participant basis at the time it is disseminated.*)
    f_SecurityStatus_LastPx : fix_float option;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")
     Trade Dissemination Time*)
    f_SecurityStatus_TransactTime : fix_utctimestamp option;
    (** Identifies the type of adjustment*)
    f_SecurityStatus_Adjustment : fix_adjustment option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)
     Comment, instructions, or other identifying information.*)
    f_SecurityStatus_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_SecurityStatus_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_SecurityStatus_EncodedText : fix_string option
}
;;

(** The Security Status Request message provides for the ability to request the status of a security.*)
type full_fix_securitystatusrequest_data = {
    (** Unique ID of a Security Status Request message.
     Must be unique, or the ID of previous Security Status Request to disable if SubscriptionRequestType = Disable previous Snapshot + Updates Request (2).*)
    f_SecurityStatusRequest_SecurityStatusReqID : fix_string;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_SecurityStatusRequest_Instrument : fix_instrument;
    (** Insert here the set of "InstrumentExtension" fields defined in "Common Components of Application Messages"*)
    f_SecurityStatusRequest_InstrumentExtension : fix_instrumentextension;
    (** Number of underlyings*)
    f_SecurityStatusRequest_UndInstrmtGrp : fix_undinstrmtgrp;
    (** Number of legs that make up the Security*)
    f_SecurityStatusRequest_InstrmtLegGrp : fix_instrmtleggrp;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.*)
    f_SecurityStatusRequest_Currency : fix_currency option;
    (** Subscription Request Type
     SubcriptionRequestType indicates to the other party what type of response is expected. A snapshot request only asks for current information. A subscribe request asks for updates as the status changes. Unsubscribe will cancel any future update messages from the counter party.)*)
    f_SecurityStatusRequest_SubscriptionRequestType : fix_subscriptionrequesttype;
    (** Identifier for Trading Session
     Can be used to represent a specific market trading session (e.g. "PRE-OPEN", "CROSS_2", "AFTER-HOURS", "TOSTNET", "TOSTNET2", etc).
     To specify good for session where session spans more than one calendar day, use TimeInForce = Day in conjunction with TradingSessionID.
     Values should be bi-laterally agreed to between counterparties.
     Firms may register Trading Session values on the FIX website (presently a document maintained within "ECN and Exchanges" working group section).*)
    f_SecurityStatusRequest_TradingSessionID : fix_string option;
    (** Optional market assigned sub identifier for a trading session. Usage is determined by market or counterparties.
     Used by US based futures markets to identify exchange specific execution time bracket codes as required by US market regulations.*)
    f_SecurityStatusRequest_TradingSessionSubID : fix_string option
}
;;

(** The Security Type Request message is used to return a list of security types available from a counterparty or market.*)
type full_fix_securitytyperequest_data = {
    (** Unique ID of a Security Definition Request.*)
    f_SecurityTypeRequest_SecurityReqID : fix_string;
    (** Free format text string
     (Note: this field does not have a specified maximum length)
     Comment, instructions, or other identifying information.*)
    f_SecurityTypeRequest_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_SecurityTypeRequest_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_SecurityTypeRequest_EncodedText : fix_string option;
    (** Identifier for Trading Session
     Can be used to represent a specific market trading session (e.g. "PRE-OPEN", "CROSS_2", "AFTER-HOURS", "TOSTNET", "TOSTNET2", etc).
     To specify good for session where session spans more than one calendar day, use TimeInForce = Day in conjunction with TradingSessionID.
     Values should be bi-laterally agreed to between counterparties.
     Firms may register Trading Session values on the FIX website (presently a document maintained within "ECN and Exchanges" working group section).
     Optional Trading Session Identifier to specify a particular trading session for which you want to obtain a list of securities that are tradeable.*)
    f_SecurityTypeRequest_TradingSessionID : fix_string option;
    (** Optional market assigned sub identifier for a trading session. Usage is determined by market or counterparties.
     Used by US based futures markets to identify exchange specific execution time bracket codes as required by US market regulations.*)
    f_SecurityTypeRequest_TradingSessionSubID : fix_string option;
    (** Indicates the type of product the security is associated with. See also the CFICode (46) and SecurityType (67) fields.
     Used to qualify which security types are returned*)
    f_SecurityTypeRequest_Product : fix_product option;
    (** Indicates type of security. See also the Product (460) and CFICode (46) fields. It is recommended that CFICode be used instead of SecurityType for non-Fixed Income instruments.
     Example values (grouped by Product field value) (Note: additional values may be used by mutual agreement of the counterparties):
     * Identify the Issuer in the "Issuer" field(06)
     *** REPLACED values - See "Replaced Features and Supported Approach" ***
     NOTE: Additional values may be used by mutual agreement of the counterparties)
     Used to qualify which security type is returned*)
    f_SecurityTypeRequest_SecurityType : fix_securitytype option;
    (** Sub-type qualification/identification of the SecurityType (e.g. for SecurityType="REPO").
     Example Values:
     General = General Collateral (for SecurityType=REPO)
     For SecurityType="MLEG" markets can provide the name of the option or futures strategy, such as Calendar, Vertical, Butterfly, etc.
     NOTE: Additional values may be used by mutual agreement of the counterparties
     Used to qualify which security types are returned*)
    f_SecurityTypeRequest_SecuritySubType : fix_string option
}
;;

(** The Security Type message is used to return a list of security types available from a counterparty or market.*)
type full_fix_securitytypes_data = {
    (** Unique ID of a Security Definition Request.*)
    f_SecurityTypes_SecurityReqID : fix_string;
    (** Unique ID of a Security Definition message.
     Identifier for the security response message*)
    f_SecurityTypes_SecurityResponseID : fix_string;
    (** Type of Security Definition message response
     The result of the security request identified by SecurityReqID*)
    f_SecurityTypes_SecurityResponseType : fix_securityresponsetype;
    (** Indicates total number of security types in the event that multiple Security Type messages are used to return results
     (Prior to FIX 4.4 this field was named TotalNumSecurityTypes)
     Indicates total number of security types in the event that multiple Security Type messages are used to return results*)
    f_SecurityTypes_TotNoSecurityTypes : int option;
    (** Indicates whether this message is the last in a sequence of messages for those messages that support fragmentation, such as Allocation Instruction, Mass Quote, Security List, Derivative Security List
     Indicates whether this is the last fragment in a sequence of message fragments. Only required where message has been fragmented.*)
    f_SecurityTypes_LastFragment : fix_lastfragment option;
    f_SecurityTypes_SecTypesGrp : fix_sectypesgrp;
    (** Free format text string
     (Note: this field does not have a specified maximum length)
     Comment, instructions, or other identifying information.*)
    f_SecurityTypes_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_SecurityTypes_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_SecurityTypes_EncodedText : fix_string option;
    (** Identifier for Trading Session
     Can be used to represent a specific market trading session (e.g. "PRE-OPEN", "CROSS_2", "AFTER-HOURS", "TOSTNET", "TOSTNET2", etc).
     To specify good for session where session spans more than one calendar day, use TimeInForce = Day in conjunction with TradingSessionID.
     Values should be bi-laterally agreed to between counterparties.
     Firms may register Trading Session values on the FIX website (presently a document maintained within "ECN and Exchanges" working group section).
     Optional Trading Session Identifier to specify a particular trading session for which you want to obtain a list of securities that are tradeable.*)
    f_SecurityTypes_TradingSessionID : fix_string option;
    (** Optional market assigned sub identifier for a trading session. Usage is determined by market or counterparties.
     Used by US based futures markets to identify exchange specific execution time bracket codes as required by US market regulations.*)
    f_SecurityTypes_TradingSessionSubID : fix_string option;
    (** Subscription Request Type
     Subscribe or unsubscribe for security status to security specified in request.*)
    f_SecurityTypes_SubscriptionRequestType : fix_subscriptionrequesttype option
}
;;

(** The Settlement Instructions message provides the broker’s, the institution’s, or the intermediary’s instructions for trade settlement. This message has been designed so that it can be sent from the broker to the institution, from the institution to the broker, or from either to an independent "standing instructions" database or matching system or, for CIV, from an intermediary to a fund manager.*)
type full_fix_settlementinstructions_data = {
    (** Unique identifier for Settlement Instruction message.
     Unique identifier for this message*)
    f_SettlementInstructions_SettlInstMsgID : fix_string;
    (** Unique ID of settlement instruction request message
     Only used when this message is used to respond to a settlement instruction request (to which this ID refers)*)
    f_SettlementInstructions_SettlInstReqID : fix_string option;
    (** Indicates mode used for Settlement Instructions message.
     *** SOME VALUES HAVE BEEN REPLACED - See "Replaced Features and Supported Approach" ***
     1=Standing Instructions, 2=Specific Allocation Account Overriding, 3=Specific Allocation Account Standing , 4=Specific Order, 5=Reject SSI request*)
    f_SettlementInstructions_SettlInstMode : fix_settlinstmode;
    (** Identifies reason for rejection (of a settlement instruction request message)
     Required for SettlInstMode = 5. Used to provide reason for rejecting a Settlement Instruction Request message.*)
    f_SettlementInstructions_SettlInstReqRejCode : fix_settlinstreqrejcode option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)
     Can be used to provide any additional rejection text where rejecting a Settlement Instruction Request message.*)
    f_SettlementInstructions_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.*)
    f_SettlementInstructions_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.*)
    f_SettlementInstructions_EncodedText : fix_string option;
    (** Unique identifier for Order as assigned by the buy-side (institution, broker, intermediary etc.) (identified by SenderCompID (49) or OnBehalfOfCompID (5) as appropriate). Uniqueness must be guaranteed within a single trading day. Firms, particularly those which electronically submit multi-day orders, trade globally or throughout market close periods, should ensure uniqueness across days, for example by embedding a date within the ClOrdID field.
     Required for SettlInstMode=4.*)
    f_SettlementInstructions_ClOrdID : fix_string option;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")
     Date/time this message was generated*)
    f_SettlementInstructions_TransactTime : fix_utctimestamp;
    (** Required except where SettlInstMode is 5=Reject SSI request*)
    f_SettlementInstructions_SettlInstGrp : fix_settlinstgrp
}
;;

(** The Trade Capture Report message can be:
 • Used to report trades between counterparties.
 • Used to report trades to a trade matching system
 • Can be sent unsolicited between counterparties.
 • Sent as a reply to a Trade Capture Report Request.
 • Can be used to report unmatched and matched trades.*)
type full_fix_tradecapturereport_data = {
    (** Unique identifier of trade capture report
     Unique identifier for the Trade Capture Report*)
    f_TradeCaptureReport_TradeReportID : fix_string;
    (** Identifies Trade Report message transaction type
     (Prior to FIX 4.4 this field was of type char)
     Identifies Trade Report message transaction type.*)
    f_TradeCaptureReport_TradeReportTransType : int option;
    (** Type of Trade Report*)
    f_TradeCaptureReport_TradeReportType : fix_tradereporttype option;
    (** Trade Capture Report Request ID
     Request ID if the Trade Capture Report is in response to a Trade Capture Report Request*)
    f_TradeCaptureReport_TradeRequestID : fix_string option;
    (** Type of Trade*)
    f_TradeCaptureReport_TrdType : fix_trdtype option;
    (** Further qualification to the trade type*)
    f_TradeCaptureReport_TrdSubType : int option;
    (** Additional TrdType (see tag 828) assigned to a trade by trade match system.*)
    f_TradeCaptureReport_SecondaryTrdType : int option;
    (** Reason trade is being transferred*)
    f_TradeCaptureReport_TransferReason : fix_string option;
    (** Describes the specific ExecutionRpt (i.e. Pending Cancel) while OrdStatus (39) will always identify the current order status (i.e. Partially Filled)
     *** SOME VALUES HAVE BEEN REPLACED - See "Replaced Features and Supported Approach" ***
     Type of Execution being reported:
     Uses subset of ExecType for Trade Capture Reports*)
    f_TradeCaptureReport_ExecType : fix_exectype option;
    (** Total number of trade reports returned.
     Number of trade reports returned - if this report is part of a response to a Trade Capture Report Request*)
    f_TradeCaptureReport_TotNumTradeReports : int option;
    (** Indicates whether this message is that last report message in response to a request, such as Order Mass Status Request.
     Indicates if this is the last report in the response to a Trade Capture Report Request*)
    f_TradeCaptureReport_LastRptRequested : bool option;
    (** Indicates whether or not message is being sent as a result of a subscription request or not.
     Set to 'Y' if message is sent as a result of a subscription request or out of band configuration as opposed to a Position Request.*)
    f_TradeCaptureReport_UnsolicitedIndicator : fix_unsolicitedindicator option;
    (** Subscription Request Type
     Used to subscribe / unsubscribe for trade capture reports. If the field is absent, the value 0 will be the default*)
    f_TradeCaptureReport_SubscriptionRequestType : fix_subscriptionrequesttype option;
    (** Reference identifier used with CANCEL and REPLACE transaction types.
     The TradeReportID that is being referenced for some action, such as correction or cancellation*)
    f_TradeCaptureReport_TradeReportRefID : fix_string option;
    (** Used to refer to a previous SecondaryTradeReportRefID when amending the transaction (cancel, replace, release, or reversal).*)
    f_TradeCaptureReport_SecondaryTradeReportRefID : fix_string option;
    (** Secondary trade report identifier - can be used to associate an additional identifier with a trade.*)
    f_TradeCaptureReport_SecondaryTradeReportID : fix_string option;
    (** Used to link a group of trades together. Useful for linking a group of trades together for average price calculations.
     Used to associate a group of trades together. Useful for average price calculations.*)
    f_TradeCaptureReport_TradeLinkID : fix_string option;
    (** Identifier assigned to a trade by a matching system.*)
    f_TradeCaptureReport_TrdMatchID : fix_string option;
    (** Unique identifier of execution message as assigned by sell-side (broker, exchange, ECN) (will be 0 (zero) for ExecType (50) =I (Order Status)). Uniqueness must be guaranteed within a single trading day or the life of a multi-day order. Firms which accept multi-day orders should consider embedding a date within the ExecID field to assure uniqueness across days. (Prior to FIX 4.1 this field was of type int)
     Exchanged assigned Execution ID (Trade Identifier)*)
    f_TradeCaptureReport_ExecID : fix_string option;
    (** Identifies current status of order.
     *** SOME VALUES HAVE BEEN REPLACED - See "Replaced Features and Supported Approach" ***
     (see Volume : "Glossary" for value definitions)
     Status of order as of this trade report*)
    f_TradeCaptureReport_OrdStatus : fix_ordstatus option;
    (** Assigned by the party which accepts the order. Can be used to provide the ExecID (7) used by an exchange or executing system.*)
    f_TradeCaptureReport_SecondaryExecID : fix_string option;
    (** Code to identify reason for an ExecutionRpt message sent with ExecType=Restated or used when communicating an unsolicited cancel.
     Reason for restatement*)
    f_TradeCaptureReport_ExecRestatementReason : fix_execrestatementreason option;
    (** Indicates if the trade capture report was previously reported to the counterparty
     Indicates if the trade capture report was previously reported to the counterparty*)
    f_TradeCaptureReport_PreviouslyReported : fix_previouslyreported;
    (** Code to represent the price type
     Can be used to indicate cabinet trade pricing*)
    f_TradeCaptureReport_PriceType : fix_pricetype option;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_TradeCaptureReport_Instrument : fix_instrument;
    (** Insert here the set of "FinancingDetails" fields defined in "Common Components of Application Messages"*)
    f_TradeCaptureReport_FinancingDetails : fix_financingdetails;
    (** Insert here the set of "OrderQtyData" fields defined in "Common Components of Application Messages"
     Note: OrderQty field is required unless rejecting or an order ack for a CashOrderQty or PercentOrder.*)
    f_TradeCaptureReport_OrderQtyData : fix_orderqtydata;
    (** Type of quantity specified in a quantity field*)
    f_TradeCaptureReport_QtyType : fix_qtytype option;
    (** Insert here the set of "YieldData" fields defined in "Common Components of Application Messages"*)
    f_TradeCaptureReport_YieldData : fix_yielddata;
    f_TradeCaptureReport_UndInstrmtGrp : fix_undinstrmtgrp;
    (** Trading Session in which the underlying instrument trades*)
    f_TradeCaptureReport_UnderlyingTradingSessionID : fix_string option;
    (** Trading Session sub identifier in which the underlying instrument trades*)
    f_TradeCaptureReport_UnderlyingTradingSessionSubID : fix_string option;
    (** Quantity (e.g. shares) bought/sold on this (last) fill.
     (Prior to FIX 4.2 this field was of type int)
     Trade Quantity.*)
    f_TradeCaptureReport_LastQty : fix_float;
    (** Price of this (last) fill.
     Trade Price.*)
    f_TradeCaptureReport_LastPx : fix_float;
    (** Last price expressed in percent-of-par. Conditionally required for Fixed Income trades when LastPx (3) is expressed in Yield, Spread, Discount or any other type.
     Usage: Execution Report and Allocation Report repeating executions block (from sellside).
     Last price expressed in percent-of-par. Conditionally required for Fixed Income trades when LastPx is expressed in Yield, Spread, Discount or any other price type that is not percent-of-par.*)
    f_TradeCaptureReport_LastParPx : fix_float option;
    (** F/X spot rate.
     Applicable for F/X orders*)
    f_TradeCaptureReport_LastSpotRate : fix_float option;
    (** F/X forward points added to LastSpotRate (94). May be a negative value.
     Applicable for F/X orders*)
    f_TradeCaptureReport_LastForwardPoints : fix_float option;
    (** Market of execution for last fill, or an indication of the market where an order was routed
     Valid values:
     See "Appendix 6-C"*)
    f_TradeCaptureReport_LastMkt : fix_exchange option;
    (** Indicates date of trade referenced in this message in YYYYMMDD format. Absence of this field indicates current day (expressed in local time at place of trade).
     Used when reporting other than current day trades.*)
    f_TradeCaptureReport_TradeDate : fix_localmktdate;
    (** The "Clearing Business Date" referred to by this maintenance request.*)
    f_TradeCaptureReport_ClearingBusinessDate : fix_localmktdate option;
    (** Calculated average price of all fills on this order.
     For Fixed Income trades AvgPx is always expressed as percent-of-par, regardless of the PriceType (423) of LastPx (3). I.e., AvgPx will contain an average of percent-of-par values (see LastParPx (669)) for issues traded in Yield, Spread or Discount.
     Average Price - if present then the LastPx will contain the original price on the execution*)
    f_TradeCaptureReport_AvgPx : fix_float option;
    (** Insert here the set of "SpreadOrBenchmarkCurveData" fields defined in "Common Components of Application Messages"*)
    f_TradeCaptureReport_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    (** Average Pricing Indicator
     Average Pricing indicator*)
    f_TradeCaptureReport_AvgPxIndicator : fix_avgpxindicator option;
    (** Insert here here the set of "Position Amount Data" fields defined in "Common Components of Application Messages"*)
    f_TradeCaptureReport_PositionAmountData : fix_positionamountdata;
    (** Used to indicate what an Execution Report represents (e.g. used with multi-leg securities, such as option strategies, spreads, etc.).
     Type of report if multileg instrument.
     Provided to support a scenario for trades of multileg instruments between two parties.*)
    f_TradeCaptureReport_MultiLegReportingType : fix_multilegreportingtype option;
    (** Reference to the leg of a multileg instrument to which this trade refers
     Reference to the leg of a multileg instrument to which this trade refers
     Used when MultiLegReportingType = 2 (Single Leg of a Multileg security)*)
    f_TradeCaptureReport_TradeLegRefID : fix_string option;
    (** Number of legs
     Identifies a Multi-leg Execution if present and non-zero.*)
    f_TradeCaptureReport_TrdInstrmtLegGrp : fix_trdinstrmtleggrp;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")
     Time the transaction represented by this Trade Capture Report occurred*)
    f_TradeCaptureReport_TransactTime : fix_utctimestamp;
    f_TradeCaptureReport_TrdRegTimestamps : fix_trdregtimestamps;
    (** Indicates order settlement period. If present, SettlDate (64) overrides this field. If both SettlType (63) and SettDate (64) are omitted, the default for SettlType (63) is 0 (Regular)
     Regular is defined as the default settlement period for the particular security on the exchange of execution.
     In Fixed Income the contents of this field may influence the instrument definition if the SecurityID (48) is ambiguous. In the US an active Treasury offering may be re-opened, and for a time one CUSIP will apply to both the current and "when-issued" securities. Supplying a value of "7" clarifies the instrument description; any other value or the absence of this field should cause the respondent to default to the active issue.*)
    f_TradeCaptureReport_SettlType : fix_settltype option;
    (** Specific date of trade settlement (SettlementDate) in YYYYMMDD format.
     If present, this field overrides SettlType (63). This field is required if the value of SettlType (63) is 6 (Future) or 8 (Sellers Option). This field must be omitted if the value of SettlType (63) is 7 (When and If Issued)
     (expressed in local time at place of settlement)
     Takes precedence over SettlType value and conditionally required/omitted for specific SettlType values.*)
    f_TradeCaptureReport_SettlDate : fix_localmktdate option;
    (** The status of this trade with respect to matching or comparison*)
    f_TradeCaptureReport_MatchStatus : fix_matchstatus option;
    (** The point in the matching process at which this trade was matched*)
    f_TradeCaptureReport_MatchType : fix_matchtype option;
    (** Number of sides*)
    f_TradeCaptureReport_TrdCapRptSideGrp : fix_trdcaprptsidegrp;
    (** Indicates whether or not this message is a drop copy of another message.
     Indicates drop copy.*)
    f_TradeCaptureReport_CopyMsgIndicator : bool option;
    (** Indicates if a trade should be reported via a market reporting service.*)
    f_TradeCaptureReport_PublishTrdIndicator : fix_publishtrdindicator option;
    (** Reason for short sale*)
    f_TradeCaptureReport_ShortSaleReason : fix_shortsalereason option
}
;;

(** The Trade Capture Report Ack message can be:
 • Used to acknowledge trade capture reports received from a counterparty
 • Used to reject a trade capture report received from a counterparty*)
type full_fix_tradecapturereportack_data = {
    (** Unique identifier of trade capture report
     Unique identifier for the Trade Capture Report*)
    f_TradeCaptureReportAck_TradeReportID : fix_string;
    (** Identifies Trade Report message transaction type
     (Prior to FIX 4.4 this field was of type char)
     Identifies Trade Report message transaction type.*)
    f_TradeCaptureReportAck_TradeReportTransType : int option;
    (** Type of Trade Report
     Indicates action to take on trade*)
    f_TradeCaptureReportAck_TradeReportType : fix_tradereporttype option;
    (** Type of Trade*)
    f_TradeCaptureReportAck_TrdType : fix_trdtype option;
    (** Further qualification to the trade type*)
    f_TradeCaptureReportAck_TrdSubType : int option;
    (** Additional TrdType (see tag 828) assigned to a trade by trade match system.*)
    f_TradeCaptureReportAck_SecondaryTrdType : int option;
    (** Reason trade is being transferred*)
    f_TradeCaptureReportAck_TransferReason : fix_string option;
    (** Describes the specific ExecutionRpt (i.e. Pending Cancel) while OrdStatus (39) will always identify the current order status (i.e. Partially Filled)
     *** SOME VALUES HAVE BEEN REPLACED - See "Replaced Features and Supported Approach" ***
     Type of Execution being reported:
     Uses subset of ExecType for Trade Capture Reports*)
    f_TradeCaptureReportAck_ExecType : fix_exectype;
    (** Reference identifier used with CANCEL and REPLACE transaction types.
     The TradeReportID that is being referenced for some action, such as correction or cancellation*)
    f_TradeCaptureReportAck_TradeReportRefID : fix_string option;
    (** Used to refer to a previous SecondaryTradeReportRefID when amending the transaction (cancel, replace, release, or reversal).
     The SecondaryTradeReportID that is being referenced for some action, such as correction or cancellation*)
    f_TradeCaptureReportAck_SecondaryTradeReportRefID : fix_string option;
    (** Trade Report Status
     Status of Trade Report*)
    f_TradeCaptureReportAck_TrdRptStatus : fix_trdrptstatus option;
    (** Reason Trade Capture Request was rejected.
     4000+ Reserved and available for bi-laterally agreed upon user-defined values
     Reason for Rejection of Trade Report*)
    f_TradeCaptureReportAck_TradeReportRejectReason : fix_tradereportrejectreason option;
    (** Secondary trade report identifier - can be used to associate an additional identifier with a trade.*)
    f_TradeCaptureReportAck_SecondaryTradeReportID : fix_string option;
    (** Subscription Request Type
     Used to subscribe / unsubscribe for trade capture reports
     If the field is absent, the value 0 will be the default*)
    f_TradeCaptureReportAck_SubscriptionRequestType : fix_subscriptionrequesttype option;
    (** Used to link a group of trades together. Useful for linking a group of trades together for average price calculations.
     Used to associate a group of trades together. Useful for average price calculations.*)
    f_TradeCaptureReportAck_TradeLinkID : fix_string option;
    (** Identifier assigned to a trade by a matching system.*)
    f_TradeCaptureReportAck_TrdMatchID : fix_string option;
    (** Unique identifier of execution message as assigned by sell-side (broker, exchange, ECN) (will be 0 (zero) for ExecType (50) =I (Order Status)). Uniqueness must be guaranteed within a single trading day or the life of a multi-day order. Firms which accept multi-day orders should consider embedding a date within the ExecID field to assure uniqueness across days. (Prior to FIX 4.1 this field was of type int)
     Exchanged assigned Execution ID (Trade Identifier)*)
    f_TradeCaptureReportAck_ExecID : fix_string option;
    (** Assigned by the party which accepts the order. Can be used to provide the ExecID (7) used by an exchange or executing system.*)
    f_TradeCaptureReportAck_SecondaryExecID : fix_string option;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_TradeCaptureReportAck_Instrument : fix_instrument;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")
     Time ACK was issued by matching system, trading system or counterparty*)
    f_TradeCaptureReportAck_TransactTime : fix_utctimestamp option;
    f_TradeCaptureReportAck_TrdRegTimestamps : fix_trdregtimestamps;
    (** Identifies how the response to the request should be transmitted
     Ability to specify whether the response to the request should be delivered inband or via pre-arranged out-of-band transport.*)
    f_TradeCaptureReportAck_ResponseTransportType : fix_responsetransporttype option;
    (** URI (Uniform Resource Identifier) for details) or other pre-arranged value. Used in conjunction with ResponseTransportType (725) value of Out-of-Band to identify the out-of-band destination.
     See "Appendix 6-B FIX Fields Based Upon Other Standards"
     URI destination name. Used if ResponseTransportType is out-of-band.*)
    f_TradeCaptureReportAck_ResponseDestination : fix_string option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)
     May be used by the executing market to record any execution Details that are particular to that market*)
    f_TradeCaptureReportAck_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_TradeCaptureReportAck_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_TradeCaptureReportAck_EncodedText : fix_string option;
    (** Number of legs
     Identifies a Multi-leg Execution if present and non-zero.*)
    f_TradeCaptureReportAck_TrdInstrmtLegGrp : fix_trdinstrmtleggrp;
    (** Indicates type of fee being assessed of the customer for trade executions at an exchange. Applicable for futures markets only at this time.
     (Values source CBOT, CME, NYBOT, and NYMEX):*)
    f_TradeCaptureReportAck_ClearingFeeIndicator : fix_clearingfeeindicator option;
    (** Designates the capacity of the firm placing the order
     (as of FIX 4.3, this field replaced Rule80A (tag 47) --used in conjunction with OrderRestrictions (529) field)
     (see Volume : "Glossary" for value definitions)
     The capacity of the participant for this trade (principal or agent for example).*)
    f_TradeCaptureReportAck_OrderCapacity : fix_ordercapacity option;
    (** Restrictions associated with an order. If more than one restriction is applicable to an order, this field can contain multiple instructions separated by space.
     Restrictions associated with the participant and their capacity for this trade.*)
    f_TradeCaptureReportAck_OrderRestrictions : fix_orderrestrictions option;
    (** Capacity of customer placing the order
     Primarily used by futures exchanges to indicate the CTICode (customer type indicator) as required by the US CFTC (Commodity Futures Trading Commission).
     The customer capacity for this trade*)
    f_TradeCaptureReportAck_CustOrderCapacity : fix_custordercapacity option;
    (** Account mnemonic as agreed between buy and sell sides, e.g. broker and institution or investor/intermediary and fund manager.
     Required for executions against electronically submitted orders which were assigned an account by the institution or intermediary*)
    f_TradeCaptureReportAck_Account : fix_string option;
    (** Used to identify the source of the Account (1) code. This is especially useful if the account is a new account that the Respondent may not have setup yet in their system.*)
    f_TradeCaptureReportAck_AcctIDSource : fix_acctidsource option;
    (** Type of account associated with an order
     Specifies type of account*)
    f_TradeCaptureReportAck_AccountType : fix_accounttype option;
    (** Indicates whether the resulting position after a trade should be an opening position or closing position. Used for omnibus accounting - where accounts are held on a gross basis instead of being netted together.
     For use in derivatives omnibus accounting*)
    f_TradeCaptureReportAck_PositionEffect : fix_positioneffect option;
    (** Indicates the method of preallocation.*)
    f_TradeCaptureReportAck_PreallocMethod : fix_preallocmethod option;
    (** Number of repeating groups for trade allocation*)
    f_TradeCaptureReportAck_TrdAllocGrp : fix_trdallocgrp
}
;;

(** Trade Capture Reporting allows sell-side firms (broker, exchange, ECN) to provide timely reporting of completed trades to an external entity not involved in the execution of the trade.*)
type full_fix_tradecapturereportrequest_data = {
    (** Trade Capture Report Request ID
     Identifier for the trade request*)
    f_TradeCaptureReportRequest_TradeRequestID : fix_string;
    (** Type of Trade Capture Report*)
    f_TradeCaptureReportRequest_TradeRequestType : fix_traderequesttype;
    (** Subscription Request Type
     Used to subscribe / unsubscribe for trade capture reports
     If the field is absent, the value 0 will be the default (snapshot only - no subscription)*)
    f_TradeCaptureReportRequest_SubscriptionRequestType : fix_subscriptionrequesttype option;
    (** Unique identifier of trade capture report
     To request a specific trade report*)
    f_TradeCaptureReportRequest_TradeReportID : fix_string option;
    (** Secondary trade report identifier - can be used to associate an additional identifier with a trade.
     To request a specific trade report*)
    f_TradeCaptureReportRequest_SecondaryTradeReportID : fix_string option;
    (** Unique identifier of execution message as assigned by sell-side (broker, exchange, ECN) (will be 0 (zero) for ExecType (50) =I (Order Status)). Uniqueness must be guaranteed within a single trading day or the life of a multi-day order. Firms which accept multi-day orders should consider embedding a date within the ExecID field to assure uniqueness across days. (Prior to FIX 4.1 this field was of type int)*)
    f_TradeCaptureReportRequest_ExecID : fix_string option;
    (** Describes the specific ExecutionRpt (i.e. Pending Cancel) while OrdStatus (39) will always identify the current order status (i.e. Partially Filled)
     *** SOME VALUES HAVE BEEN REPLACED - See "Replaced Features and Supported Approach" ***
     To requst all trades of a specific execution type*)
    f_TradeCaptureReportRequest_ExecType : fix_exectype option;
    (** Unique identifier for Order as assigned by sell-side (broker, exchange, ECN). Uniqueness must be guaranteed within a single trading day. Firms which accept multi-day orders should consider embedding a date within the OrderID field to assure uniqueness across days.*)
    f_TradeCaptureReportRequest_OrderID : fix_string option;
    (** Unique identifier for Order as assigned by the buy-side (institution, broker, intermediary etc.) (identified by SenderCompID (49) or OnBehalfOfCompID (5) as appropriate). Uniqueness must be guaranteed within a single trading day. Firms, particularly those which electronically submit multi-day orders, trade globally or throughout market close periods, should ensure uniqueness across days, for example by embedding a date within the ClOrdID field.*)
    f_TradeCaptureReportRequest_ClOrdID : fix_string option;
    (** The status of this trade with respect to matching or comparison*)
    f_TradeCaptureReportRequest_MatchStatus : fix_matchstatus option;
    (** Type of Trade
     To request all trades of a specific trade type*)
    f_TradeCaptureReportRequest_TrdType : fix_trdtype option;
    (** Further qualification to the trade type
     To request all trades of a specific trade sub type*)
    f_TradeCaptureReportRequest_TrdSubType : int option;
    (** Reason trade is being transferred
     To request all trades for a specific transfer reason*)
    f_TradeCaptureReportRequest_TransferReason : fix_string option;
    (** Additional TrdType (see tag 828) assigned to a trade by trade match system.
     To request all trades of a specific trade sub type*)
    f_TradeCaptureReportRequest_SecondaryTrdType : int option;
    (** Used to link a group of trades together. Useful for linking a group of trades together for average price calculations.
     To request all trades of a specific trade link id*)
    f_TradeCaptureReportRequest_TradeLinkID : fix_string option;
    (** Identifier assigned to a trade by a matching system.
     To request a trade matching a specific TrdMatchID*)
    f_TradeCaptureReportRequest_TrdMatchID : fix_string option;
    (** Used to specify the parties for the trades to be returned (clearing firm, execution broker, trader id, etc.)
     ExecutingBroker
     ClearingFirm
     ContraBroker
     ContraClearingFirm
     SettlementLocation - depository, CSD, or other settlement party
     ExecutingTrader
     InitiatingTrader
     OrderOriginator*)
    f_TradeCaptureReportRequest_Parties : fix_parties;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_TradeCaptureReportRequest_Instrument : fix_instrument;
    (** Insert here the set of "InstrumentExtension" fields defined in "Common Components of Application Messages"*)
    f_TradeCaptureReportRequest_InstrumentExtension : fix_instrumentextension;
    (** Insert here the set of "FinancingDetails" fields defined in "Common Components of Application Messages"*)
    f_TradeCaptureReportRequest_FinancingDetails : fix_financingdetails;
    (** Indicates number of repeating entries.
     ** Nested Repeating Group follows ***)
    f_TradeCaptureReportRequest_UndInstrmtGrp : fix_undinstrmtgrp;
    (** Indicates number of repeating entries.
     ** Nested Repeating Group follows ***)
    f_TradeCaptureReportRequest_InstrmtLegGrp : fix_instrmtleggrp;
    (** Number of date ranges provided (must be 1 or 2 if specified)*)
    f_TradeCaptureReportRequest_TrdCapDtGrp : fix_trdcapdtgrp;
    (** The "Clearing Business Date" referred to by this maintenance request.
     To request trades for a specific clearing business date.*)
    f_TradeCaptureReportRequest_ClearingBusinessDate : fix_localmktdate option;
    (** Identifier for Trading Session
     Can be used to represent a specific market trading session (e.g. "PRE-OPEN", "CROSS_2", "AFTER-HOURS", "TOSTNET", "TOSTNET2", etc).
     To specify good for session where session spans more than one calendar day, use TimeInForce = Day in conjunction with TradingSessionID.
     Values should be bi-laterally agreed to between counterparties.
     Firms may register Trading Session values on the FIX website (presently a document maintained within "ECN and Exchanges" working group section).
     To request trades for a specific trading session.*)
    f_TradeCaptureReportRequest_TradingSessionID : fix_string option;
    (** Optional market assigned sub identifier for a trading session. Usage is determined by market or counterparties.
     Used by US based futures markets to identify exchange specific execution time bracket codes as required by US market regulations.
     To request trades for a specific trading session.*)
    f_TradeCaptureReportRequest_TradingSessionSubID : fix_string option;
    (** A code that represents a time interval in which a fill or trade occurred.
     Required for US futures markets.
     To request trades within a specific time bracket.*)
    f_TradeCaptureReportRequest_TimeBracket : fix_string option;
    (** Side of order
     To request trades for a specific side of a trade.*)
    f_TradeCaptureReportRequest_Side : fix_side option;
    (** Used to indicate what an Execution Report represents (e.g. used with multi-leg securities, such as option strategies, spreads, etc.).
     Used to indicate if trades are to be returned for the individual legs of a multileg instrument or for the overall instrument.*)
    f_TradeCaptureReportRequest_MultiLegReportingType : fix_multilegreportingtype option;
    (** Type of input device or system from which the trade was entered.
     To requests trades that were submitted from a specific trade input source.*)
    f_TradeCaptureReportRequest_TradeInputSource : fix_string option;
    (** Specific device number, terminal number or station where trade was entered
     To request trades that were submitted from a specific trade input device.*)
    f_TradeCaptureReportRequest_TradeInputDevice : fix_string option;
    (** Identifies how the response to the request should be transmitted
     Ability to specify whether the response to the request should be delivered inband or via pre-arranged out-of-band transport.*)
    f_TradeCaptureReportRequest_ResponseTransportType : fix_responsetransporttype option;
    (** URI (Uniform Resource Identifier) for details) or other pre-arranged value. Used in conjunction with ResponseTransportType (725) value of Out-of-Band to identify the out-of-band destination.
     See "Appendix 6-B FIX Fields Based Upon Other Standards"
     URI destination name. Used if ResponseTransportType is out-of-band.*)
    f_TradeCaptureReportRequest_ResponseDestination : fix_string option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)
     Used to match specific values within Text fields*)
    f_TradeCaptureReportRequest_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.*)
    f_TradeCaptureReportRequest_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.*)
    f_TradeCaptureReportRequest_EncodedText : fix_string option
}
;;

(** The Trade Capture Request Ack message is used to:
 • Provide an acknowledgement to a Trade Capture Report Request in the case where the Trade Capture Report Request is used to specify a subscription or delivery of reports via an out-of-band ResponseTransmissionMethod.
 • Provide an acknowledgement to a Trade Capture Report Request in the case when the return of the Trade Capture Reports matching that request will be delayed or delivered asynchronously. This is useful in distributed trading system environments.
 • Indicate that no trades were found that matched the selection criteria specified on the Trade Capture Report Request
 • The Trade Capture Request was invalid for some business reason, such as request is not authorized, invalid or unknown instrument, party, trading session, etc.*)
type full_fix_tradecapturereportrequestack_data = {
    (** Trade Capture Report Request ID
     Identifier for the trade request*)
    f_TradeCaptureReportRequestAck_TradeRequestID : fix_string;
    (** Type of Trade Capture Report*)
    f_TradeCaptureReportRequestAck_TradeRequestType : fix_traderequesttype;
    (** Subscription Request Type
     Used to subscribe / unsubscribe for trade capture reports
     If the field is absent, the value 0 will be the default*)
    f_TradeCaptureReportRequestAck_SubscriptionRequestType : fix_subscriptionrequesttype option;
    (** Total number of trade reports returned.
     Number of trade reports returned*)
    f_TradeCaptureReportRequestAck_TotNumTradeReports : int option;
    (** Result of Trade Request
     4000+ Reserved and available for bi-laterally agreed upon user-defined values
     Result of Trade Request*)
    f_TradeCaptureReportRequestAck_TradeRequestResult : fix_traderequestresult;
    (** Status of Trade Request.
     Status of Trade Request*)
    f_TradeCaptureReportRequestAck_TradeRequestStatus : fix_traderequeststatus;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_TradeCaptureReportRequestAck_Instrument : fix_instrument;
    f_TradeCaptureReportRequestAck_UndInstrmtGrp : fix_undinstrmtgrp;
    (** Number of legs
     NoLegs > 0 identifies a Multi-leg Execution*)
    f_TradeCaptureReportRequestAck_InstrmtLegGrp : fix_instrmtleggrp;
    (** Used to indicate what an Execution Report represents (e.g. used with multi-leg securities, such as option strategies, spreads, etc.).
     Specify type of multileg reporting to be returned.*)
    f_TradeCaptureReportRequestAck_MultiLegReportingType : fix_multilegreportingtype option;
    (** Identifies how the response to the request should be transmitted
     Ability to specify whether the response to the request should be delivered inband or via pre-arranged out-of-band transport.*)
    f_TradeCaptureReportRequestAck_ResponseTransportType : fix_responsetransporttype option;
    (** URI (Uniform Resource Identifier) for details) or other pre-arranged value. Used in conjunction with ResponseTransportType (725) value of Out-of-Band to identify the out-of-band destination.
     See "Appendix 6-B FIX Fields Based Upon Other Standards"
     URI destination name. Used if ResponseTransportType is out-of-band.*)
    f_TradeCaptureReportRequestAck_ResponseDestination : fix_string option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)
     May be used by the executing market to record any execution Details that are particular to that market*)
    f_TradeCaptureReportRequestAck_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_TradeCaptureReportRequestAck_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_TradeCaptureReportRequestAck_EncodedText : fix_string option
}
;;

(** The Trading Session Status provides information on the status of a market.*)
type full_fix_tradingsessionstatus_data = {
    (** Unique ID of a Trading Session Status message.
     Provided for a response to a specific Trading Session Status Request message (snapshot).*)
    f_TradingSessionStatus_TradSesReqID : fix_string option;
    (** Identifier for Trading Session
     Can be used to represent a specific market trading session (e.g. "PRE-OPEN", "CROSS_2", "AFTER-HOURS", "TOSTNET", "TOSTNET2", etc).
     To specify good for session where session spans more than one calendar day, use TimeInForce = Day in conjunction with TradingSessionID.
     Values should be bi-laterally agreed to between counterparties.
     Firms may register Trading Session values on the FIX website (presently a document maintained within "ECN and Exchanges" working group section).
     Identifier for Trading Session*)
    f_TradingSessionStatus_TradingSessionID : fix_string;
    (** Optional market assigned sub identifier for a trading session. Usage is determined by market or counterparties.
     Used by US based futures markets to identify exchange specific execution time bracket codes as required by US market regulations.*)
    f_TradingSessionStatus_TradingSessionSubID : fix_string option;
    (** Method of trading
     Method of trading:*)
    f_TradingSessionStatus_TradSesMethod : fix_tradsesmethod option;
    (** Trading Session Mode
     Trading Session Mode*)
    f_TradingSessionStatus_TradSesMode : fix_tradsesmode option;
    (** Indicates whether or not message is being sent as a result of a subscription request or not.
     Set to 'Y' if message is sent unsolicited as a result of a previous subscription request.*)
    f_TradingSessionStatus_UnsolicitedIndicator : fix_unsolicitedindicator option;
    (** State of the trading session
     State of the trading session*)
    f_TradingSessionStatus_TradSesStatus : fix_tradsesstatus;
    (** Indicates the reason a Trading Session Status Request was rejected
     Use with TradSesStatus = "Request Rejected"*)
    f_TradingSessionStatus_TradSesStatusRejReason : fix_tradsesstatusrejreason option;
    (** Starting time of the trading session
     Starting time of the trading session*)
    f_TradingSessionStatus_TradSesStartTime : fix_utctimestamp option;
    (** Time of the opening of the trading session
     Time of the opening of the trading session*)
    f_TradingSessionStatus_TradSesOpenTime : fix_utctimestamp option;
    (** Time of the pre-closed of the trading session
     Time of the pre-close of the trading session*)
    f_TradingSessionStatus_TradSesPreCloseTime : fix_utctimestamp option;
    (** Closing time of the trading session
     Closing time of the trading session*)
    f_TradingSessionStatus_TradSesCloseTime : fix_utctimestamp option;
    (** End time of the trading session
     End time of the trading session*)
    f_TradingSessionStatus_TradSesEndTime : fix_utctimestamp option;
    (** Total volume (quantity) traded.*)
    f_TradingSessionStatus_TotalVolumeTraded : fix_float option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_TradingSessionStatus_Text : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.
     Must be set if EncodedText field is specified and must immediately precede it.*)
    f_TradingSessionStatus_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.
     Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_TradingSessionStatus_EncodedText : fix_string option
}
;;

(** The Trading Session Status Request is used to request information on the status of a market.*)
type full_fix_tradingsessionstatusrequest_data = {
    (** Unique ID of a Trading Session Status message.
     Must be unique, or the ID of previous Trading Session Status Request to disable if SubscriptionRequestType = Disable previous Snapshot + Updates Request (2).*)
    f_TradingSessionStatusRequest_TradSesReqID : fix_string;
    (** Identifier for Trading Session
     Can be used to represent a specific market trading session (e.g. "PRE-OPEN", "CROSS_2", "AFTER-HOURS", "TOSTNET", "TOSTNET2", etc).
     To specify good for session where session spans more than one calendar day, use TimeInForce = Day in conjunction with TradingSessionID.
     Values should be bi-laterally agreed to between counterparties.
     Firms may register Trading Session values on the FIX website (presently a document maintained within "ECN and Exchanges" working group section).
     Trading Session for which status is being requested*)
    f_TradingSessionStatusRequest_TradingSessionID : fix_string option;
    (** Optional market assigned sub identifier for a trading session. Usage is determined by market or counterparties.
     Used by US based futures markets to identify exchange specific execution time bracket codes as required by US market regulations.*)
    f_TradingSessionStatusRequest_TradingSessionSubID : fix_string option;
    (** Method of trading
     Method of trading*)
    f_TradingSessionStatusRequest_TradSesMethod : fix_tradsesmethod option;
    (** Trading Session Mode
     Trading Session Mode*)
    f_TradingSessionStatusRequest_TradSesMode : fix_tradsesmode option;
    (** Subscription Request Type*)
    f_TradingSessionStatusRequest_SubscriptionRequestType : fix_subscriptionrequesttype
}
;;

type full_app_msg_data =
    | FIX_Full_Msg_Advertisement of full_fix_advertisement_data
    | FIX_Full_Msg_AllocationInstruction of full_fix_allocationinstruction_data
    | FIX_Full_Msg_AllocationInstructionAck of full_fix_allocationinstructionack_data
    | FIX_Full_Msg_AllocationReport of full_fix_allocationreport_data
    | FIX_Full_Msg_AllocationReportAck of full_fix_allocationreportack_data
    | FIX_Full_Msg_AssignmentReport of full_fix_assignmentreport_data
    | FIX_Full_Msg_BidRequest of full_fix_bidrequest_data
    | FIX_Full_Msg_BidResponse of full_fix_bidresponse_data
    | FIX_Full_Msg_CollateralAssignment of full_fix_collateralassignment_data
    | FIX_Full_Msg_CollateralInquiry of full_fix_collateralinquiry_data
    | FIX_Full_Msg_CollateralInquiryAck of full_fix_collateralinquiryack_data
    | FIX_Full_Msg_CollateralReport of full_fix_collateralreport_data
    | FIX_Full_Msg_CollateralRequest of full_fix_collateralrequest_data
    | FIX_Full_Msg_CollateralResponse of full_fix_collateralresponse_data
    | FIX_Full_Msg_Confirmation of full_fix_confirmation_data
    | FIX_Full_Msg_ConfirmationAck of full_fix_confirmationack_data
    | FIX_Full_Msg_ConfirmationRequest of full_fix_confirmationrequest_data
    | FIX_Full_Msg_CrossOrderCancelReplaceRequest of full_fix_crossordercancelreplacerequest_data
    | FIX_Full_Msg_CrossOrderCancelRequest of full_fix_crossordercancelrequest_data
    | FIX_Full_Msg_DerivativeSecurityList of full_fix_derivativesecuritylist_data
    | FIX_Full_Msg_DerivativeSecurityListRequest of full_fix_derivativesecuritylistrequest_data
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
    | FIX_Full_Msg_MassQuoteAcknowledgement of full_fix_massquoteacknowledgement_data
    | FIX_Full_Msg_MultilegOrderCancelReplace of full_fix_multilegordercancelreplace_data
    | FIX_Full_Msg_NewOrderCross of full_fix_newordercross_data
    | FIX_Full_Msg_NewOrderList of full_fix_neworderlist_data
    | FIX_Full_Msg_NewOrderMultileg of full_fix_newordermultileg_data
    | FIX_Full_Msg_NewOrderSingle of full_fix_newordersingle_data
    | FIX_Full_Msg_News of full_fix_news_data
    | FIX_Full_Msg_OrderCancelReject of full_fix_ordercancelreject_data
    | FIX_Full_Msg_OrderCancelReplaceRequest of full_fix_ordercancelreplacerequest_data
    | FIX_Full_Msg_OrderCancelRequest of full_fix_ordercancelrequest_data
    | FIX_Full_Msg_OrderMassCancelReport of full_fix_ordermasscancelreport_data
    | FIX_Full_Msg_OrderMassCancelRequest of full_fix_ordermasscancelrequest_data
    | FIX_Full_Msg_OrderMassStatusRequest of full_fix_ordermassstatusrequest_data
    | FIX_Full_Msg_OrderStatusRequest of full_fix_orderstatusrequest_data
    | FIX_Full_Msg_PositionMaintenanceReport of full_fix_positionmaintenancereport_data
    | FIX_Full_Msg_PositionMaintenanceRequest of full_fix_positionmaintenancerequest_data
    | FIX_Full_Msg_PositionReport of full_fix_positionreport_data
    | FIX_Full_Msg_Quote of full_fix_quote_data
    | FIX_Full_Msg_QuoteCancel of full_fix_quotecancel_data
    | FIX_Full_Msg_QuoteRequest of full_fix_quoterequest_data
    | FIX_Full_Msg_QuoteRequestReject of full_fix_quoterequestreject_data
    | FIX_Full_Msg_QuoteResponse of full_fix_quoteresponse_data
    | FIX_Full_Msg_QuoteStatusReport of full_fix_quotestatusreport_data
    | FIX_Full_Msg_QuoteStatusRequest of full_fix_quotestatusrequest_data
    | FIX_Full_Msg_RFQRequest of full_fix_rfqrequest_data
    | FIX_Full_Msg_RegistrationInstructions of full_fix_registrationinstructions_data
    | FIX_Full_Msg_RegistrationInstructionsResponse of full_fix_registrationinstructionsresponse_data
    | FIX_Full_Msg_RequestForPositions of full_fix_requestforpositions_data
    | FIX_Full_Msg_RequestForPositionsAck of full_fix_requestforpositionsack_data
    | FIX_Full_Msg_SecurityDefinition of full_fix_securitydefinition_data
    | FIX_Full_Msg_SecurityDefinitionRequest of full_fix_securitydefinitionrequest_data
    | FIX_Full_Msg_SecurityList of full_fix_securitylist_data
    | FIX_Full_Msg_SecurityListRequest of full_fix_securitylistrequest_data
    | FIX_Full_Msg_SecurityStatus of full_fix_securitystatus_data
    | FIX_Full_Msg_SecurityStatusRequest of full_fix_securitystatusrequest_data
    | FIX_Full_Msg_SecurityTypeRequest of full_fix_securitytyperequest_data
    | FIX_Full_Msg_SecurityTypes of full_fix_securitytypes_data
    | FIX_Full_Msg_SettlementInstructions of full_fix_settlementinstructions_data
    | FIX_Full_Msg_TradeCaptureReport of full_fix_tradecapturereport_data
    | FIX_Full_Msg_TradeCaptureReportAck of full_fix_tradecapturereportack_data
    | FIX_Full_Msg_TradeCaptureReportRequest of full_fix_tradecapturereportrequest_data
    | FIX_Full_Msg_TradeCaptureReportRequestAck of full_fix_tradecapturereportrequestack_data
    | FIX_Full_Msg_TradingSessionStatus of full_fix_tradingsessionstatus_data
    | FIX_Full_Msg_TradingSessionStatusRequest of full_fix_tradingsessionstatusrequest_data
;;

let get_full_app_msg_tag ( msg : full_app_msg_data ) =
    (match msg with
        | FIX_Full_Msg_Advertisement _ -> Full_Msg_Advertisement_Tag
        | FIX_Full_Msg_AllocationInstruction _ -> Full_Msg_AllocationInstruction_Tag
        | FIX_Full_Msg_AllocationInstructionAck _ -> Full_Msg_AllocationInstructionAck_Tag
        | FIX_Full_Msg_AllocationReport _ -> Full_Msg_AllocationReport_Tag
        | FIX_Full_Msg_AllocationReportAck _ -> Full_Msg_AllocationReportAck_Tag
        | FIX_Full_Msg_AssignmentReport _ -> Full_Msg_AssignmentReport_Tag
        | FIX_Full_Msg_BidRequest _ -> Full_Msg_BidRequest_Tag
        | FIX_Full_Msg_BidResponse _ -> Full_Msg_BidResponse_Tag
        | FIX_Full_Msg_CollateralAssignment _ -> Full_Msg_CollateralAssignment_Tag
        | FIX_Full_Msg_CollateralInquiry _ -> Full_Msg_CollateralInquiry_Tag
        | FIX_Full_Msg_CollateralInquiryAck _ -> Full_Msg_CollateralInquiryAck_Tag
        | FIX_Full_Msg_CollateralReport _ -> Full_Msg_CollateralReport_Tag
        | FIX_Full_Msg_CollateralRequest _ -> Full_Msg_CollateralRequest_Tag
        | FIX_Full_Msg_CollateralResponse _ -> Full_Msg_CollateralResponse_Tag
        | FIX_Full_Msg_Confirmation _ -> Full_Msg_Confirmation_Tag
        | FIX_Full_Msg_ConfirmationAck _ -> Full_Msg_ConfirmationAck_Tag
        | FIX_Full_Msg_ConfirmationRequest _ -> Full_Msg_ConfirmationRequest_Tag
        | FIX_Full_Msg_CrossOrderCancelReplaceRequest _ -> Full_Msg_CrossOrderCancelReplaceRequest_Tag
        | FIX_Full_Msg_CrossOrderCancelRequest _ -> Full_Msg_CrossOrderCancelRequest_Tag
        | FIX_Full_Msg_DerivativeSecurityList _ -> Full_Msg_DerivativeSecurityList_Tag
        | FIX_Full_Msg_DerivativeSecurityListRequest _ -> Full_Msg_DerivativeSecurityListRequest_Tag
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
        | FIX_Full_Msg_MassQuoteAcknowledgement _ -> Full_Msg_MassQuoteAcknowledgement_Tag
        | FIX_Full_Msg_MultilegOrderCancelReplace _ -> Full_Msg_MultilegOrderCancelReplace_Tag
        | FIX_Full_Msg_NewOrderCross _ -> Full_Msg_NewOrderCross_Tag
        | FIX_Full_Msg_NewOrderList _ -> Full_Msg_NewOrderList_Tag
        | FIX_Full_Msg_NewOrderMultileg _ -> Full_Msg_NewOrderMultileg_Tag
        | FIX_Full_Msg_NewOrderSingle _ -> Full_Msg_NewOrderSingle_Tag
        | FIX_Full_Msg_News _ -> Full_Msg_News_Tag
        | FIX_Full_Msg_OrderCancelReject _ -> Full_Msg_OrderCancelReject_Tag
        | FIX_Full_Msg_OrderCancelReplaceRequest _ -> Full_Msg_OrderCancelReplaceRequest_Tag
        | FIX_Full_Msg_OrderCancelRequest _ -> Full_Msg_OrderCancelRequest_Tag
        | FIX_Full_Msg_OrderMassCancelReport _ -> Full_Msg_OrderMassCancelReport_Tag
        | FIX_Full_Msg_OrderMassCancelRequest _ -> Full_Msg_OrderMassCancelRequest_Tag
        | FIX_Full_Msg_OrderMassStatusRequest _ -> Full_Msg_OrderMassStatusRequest_Tag
        | FIX_Full_Msg_OrderStatusRequest _ -> Full_Msg_OrderStatusRequest_Tag
        | FIX_Full_Msg_PositionMaintenanceReport _ -> Full_Msg_PositionMaintenanceReport_Tag
        | FIX_Full_Msg_PositionMaintenanceRequest _ -> Full_Msg_PositionMaintenanceRequest_Tag
        | FIX_Full_Msg_PositionReport _ -> Full_Msg_PositionReport_Tag
        | FIX_Full_Msg_Quote _ -> Full_Msg_Quote_Tag
        | FIX_Full_Msg_QuoteCancel _ -> Full_Msg_QuoteCancel_Tag
        | FIX_Full_Msg_QuoteRequest _ -> Full_Msg_QuoteRequest_Tag
        | FIX_Full_Msg_QuoteRequestReject _ -> Full_Msg_QuoteRequestReject_Tag
        | FIX_Full_Msg_QuoteResponse _ -> Full_Msg_QuoteResponse_Tag
        | FIX_Full_Msg_QuoteStatusReport _ -> Full_Msg_QuoteStatusReport_Tag
        | FIX_Full_Msg_QuoteStatusRequest _ -> Full_Msg_QuoteStatusRequest_Tag
        | FIX_Full_Msg_RFQRequest _ -> Full_Msg_RFQRequest_Tag
        | FIX_Full_Msg_RegistrationInstructions _ -> Full_Msg_RegistrationInstructions_Tag
        | FIX_Full_Msg_RegistrationInstructionsResponse _ -> Full_Msg_RegistrationInstructionsResponse_Tag
        | FIX_Full_Msg_RequestForPositions _ -> Full_Msg_RequestForPositions_Tag
        | FIX_Full_Msg_RequestForPositionsAck _ -> Full_Msg_RequestForPositionsAck_Tag
        | FIX_Full_Msg_SecurityDefinition _ -> Full_Msg_SecurityDefinition_Tag
        | FIX_Full_Msg_SecurityDefinitionRequest _ -> Full_Msg_SecurityDefinitionRequest_Tag
        | FIX_Full_Msg_SecurityList _ -> Full_Msg_SecurityList_Tag
        | FIX_Full_Msg_SecurityListRequest _ -> Full_Msg_SecurityListRequest_Tag
        | FIX_Full_Msg_SecurityStatus _ -> Full_Msg_SecurityStatus_Tag
        | FIX_Full_Msg_SecurityStatusRequest _ -> Full_Msg_SecurityStatusRequest_Tag
        | FIX_Full_Msg_SecurityTypeRequest _ -> Full_Msg_SecurityTypeRequest_Tag
        | FIX_Full_Msg_SecurityTypes _ -> Full_Msg_SecurityTypes_Tag
        | FIX_Full_Msg_SettlementInstructions _ -> Full_Msg_SettlementInstructions_Tag
        | FIX_Full_Msg_TradeCaptureReport _ -> Full_Msg_TradeCaptureReport_Tag
        | FIX_Full_Msg_TradeCaptureReportAck _ -> Full_Msg_TradeCaptureReportAck_Tag
        | FIX_Full_Msg_TradeCaptureReportRequest _ -> Full_Msg_TradeCaptureReportRequest_Tag
        | FIX_Full_Msg_TradeCaptureReportRequestAck _ -> Full_Msg_TradeCaptureReportRequestAck_Tag
        | FIX_Full_Msg_TradingSessionStatus _ -> Full_Msg_TradingSessionStatus_Tag
        | FIX_Full_Msg_TradingSessionStatusRequest _ -> Full_Msg_TradingSessionStatusRequest_Tag
    )
;;
