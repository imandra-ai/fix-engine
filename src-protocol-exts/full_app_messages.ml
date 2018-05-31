(* Aesthetic Integration copyright 2018 *)
open Full_app_enums;;
open Datetime;;
open Numeric;;
open Full_app_records;;
open Full_app_tags;;

(** Advertisement messages are used to announce completed transactions.*)
type full_fix_advertisement_data = {
    f_Advertisement_AdvId : string;
    f_Advertisement_AdvTransType : fix_advtranstype;
    (** Required for Cancel and Replace AdvTransType messages*)
    f_Advertisement_AdvRefID : string option;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_Advertisement_Instrument : fix_instrument;
    (** Number of legs
     Identifies a Multi-leg Execution if present and non-zero.*)
    f_Advertisement_InstrmtLegGrp : fix_rg_instrmtleggrp;
    (** Number of underlyings*)
    f_Advertisement_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    f_Advertisement_AdvSide : fix_advside;
    f_Advertisement_Quantity : fix_float_6;
    f_Advertisement_QtyType : fix_qtytype option;
    f_Advertisement_Price : fix_float_6 option;
    f_Advertisement_Currency : fix_currency option;
    f_Advertisement_TradeDate : fix_localmktdate option;
    f_Advertisement_TransactTime : fix_utctimestamp option;
    f_Advertisement_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_Advertisement_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_Advertisement_EncodedText : string option;
    (** A URL (Uniform Resource Locator) link to additional information (i.e. http://www.XYZ.com/research.html)*)
    f_Advertisement_URLLink : string option;
    f_Advertisement_LastMkt : fix_exchange option;
    f_Advertisement_TradingSessionID : string option;
    f_Advertisement_TradingSessionSubID : string option
}
;;

(** The Allocation Instruction message provides the ability to specify how an order or set of orders should be subdivided amongst one or more accounts. In versions of FIX prior to version 4.4, this same message was known as the Allocation message. Note in versions of FIX prior to version 4.4, the allocation message was also used to communicate fee and expense details from the Sellside to the Buyside. This role has now been removed from the Allocation Instruction and is now performed by the new (to version 4.4) Allocation Report and Confirmation messages.,The Allocation Report message should be used for the Sell-side Initiated Allocation role as defined in previous versions of the protocol.*)
type full_fix_allocationinstruction_data = {
    (** Unique identifier for this allocation instruction message*)
    f_AllocationInstruction_AllocID : string;
    (** i.e. New, Cancel, Replace*)
    f_AllocationInstruction_AllocTransType : fix_alloctranstype;
    (** Specifies the purpose or type of Allocation message*)
    f_AllocationInstruction_AllocType : fix_alloctype;
    (** Optional second identifier for this allocation instruction (need not be unique)*)
    f_AllocationInstruction_SecondaryAllocID : string option;
    (** Required for AllocTransType = Replace or Cancel*)
    f_AllocationInstruction_RefAllocID : string option;
    (** Required for AllocTransType = Replace or Cancel
     Gives the reason for replacing or cancelling the allocation instruction*)
    f_AllocationInstruction_AllocCancReplaceReason : fix_alloccancreplacereason option;
    (** Required if AllocType = 8 (Request to Intermediary)
     Indicates status that is requested to be transmitted to counterparty by the intermediary (i.e. clearing house)*)
    f_AllocationInstruction_AllocIntermedReqType : fix_allocintermedreqtype option;
    (** Can be used to link two different Allocation messages (each with unique AllocID) together, i.e. for F/X "Netting" or "Swaps"*)
    f_AllocationInstruction_AllocLinkID : string option;
    (** Can be used to link two different Allocation messages and identifies the type of link. Required if AllocLinkID is specified.*)
    f_AllocationInstruction_AllocLinkType : fix_alloclinktype option;
    (** Can be used with AllocType=" Ready-To-Book "*)
    f_AllocationInstruction_BookingRefID : string option;
    (** Indicates how the orders being booked and allocated by this message are identified, i.e. by explicit definition in the NoOrders group or not.*)
    f_AllocationInstruction_AllocNoOrdersType : fix_allocnoorderstype;
    (** Indicates number of orders to be combined for allocation. If order(s) were manually delivered set to 1 (one).Required when AllocNoOrdersType = 1*)
    f_AllocationInstruction_OrdAllocGrp : fix_rg_ordallocgrp;
    (** Indicates number of individual execution repeating group entries to follow. Absence of this field indicates that no individual execution entries are included. Primarily used to support step-outs.*)
    f_AllocationInstruction_ExecAllocGrp : fix_rg_execallocgrp;
    f_AllocationInstruction_PreviouslyReported : fix_previouslyreported option;
    f_AllocationInstruction_ReversalIndicator : bool option;
    f_AllocationInstruction_MatchType : fix_matchtype option;
    f_AllocationInstruction_Side : fix_side;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_AllocationInstruction_Instrument : fix_instrument;
    (** Insert here the set of "InstrumentExtension" fields defined in "Common Components of Application Messages"*)
    f_AllocationInstruction_InstrumentExtension : fix_instrumentextension;
    (** Insert here the set of "FinancingDetails" fields defined in "Common Components of Application Messages"*)
    f_AllocationInstruction_FinancingDetails : fix_financingdetails;
    f_AllocationInstruction_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    f_AllocationInstruction_InstrmtLegGrp : fix_rg_instrmtleggrp;
    (** Total quantity (e.g. number of shares) allocated to all accounts, or that is Ready-To-Book*)
    f_AllocationInstruction_Quantity : fix_float_6;
    f_AllocationInstruction_QtyType : fix_qtytype option;
    (** Market of the executions.*)
    f_AllocationInstruction_LastMkt : fix_exchange option;
    f_AllocationInstruction_TradeOriginationDate : fix_localmktdate option;
    f_AllocationInstruction_TradingSessionID : string option;
    f_AllocationInstruction_TradingSessionSubID : string option;
    f_AllocationInstruction_PriceType : fix_pricetype option;
    (** For F/X orders, should be the "all-in" rate (spot rate adjusted for forward points).*)
    f_AllocationInstruction_AvgPx : fix_float_6;
    f_AllocationInstruction_AvgParPx : fix_float_6 option;
    (** Insert here the set of "SpreadOrBenchmarkCurveData" fields defined in "Common Components of Application Messages"*)
    f_AllocationInstruction_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    (** Currency of AvgPx. Should be the currency of the local market or exchange where the trade was conducted.*)
    f_AllocationInstruction_Currency : fix_currency option;
    (** Absence of this field indicates that default precision arranged by the broker/institution is to be used*)
    f_AllocationInstruction_AvgPxPrecision : int option;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_AllocationInstruction_Parties : fix_rg_parties;
    f_AllocationInstruction_TradeDate : fix_localmktdate;
    (** Date/time when allocation is generated*)
    f_AllocationInstruction_TransactTime : fix_utctimestamp option;
    f_AllocationInstruction_SettlType : fix_settltype option;
    (** Takes precedence over SettlType value and conditionally required/omitted for specific SettlType values.*)
    f_AllocationInstruction_SettlDate : fix_localmktdate option;
    (** Method for booking. Used to provide notification that this is to be booked out as an OTC derivative (e.g. CFD or similar). Absence of this field implies regular booking.*)
    f_AllocationInstruction_BookingType : fix_bookingtype option;
    (** Expressed in same currency as AvgPx. Sum of (AllocQty * AllocAvgPx or AllocPrice).*)
    f_AllocationInstruction_GrossTradeAmt : fix_float_6 option;
    f_AllocationInstruction_Concession : fix_float_6 option;
    f_AllocationInstruction_TotalTakedown : fix_float_6 option;
    (** Expressed in same currency as AvgPx. Sum of AllocNetMoney.*)
    f_AllocationInstruction_NetMoney : fix_float_6 option;
    f_AllocationInstruction_PositionEffect : fix_positioneffect option;
    (** Indicates if Allocation has been automatically accepted on behalf of the Carry Firm by the Clearing House*)
    f_AllocationInstruction_AutoAcceptIndicator : bool option;
    f_AllocationInstruction_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_AllocationInstruction_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_AllocationInstruction_EncodedText : string option;
    (** Applicable for Convertible Bonds and fixed income*)
    f_AllocationInstruction_NumDaysInterest : int option;
    (** Applicable for Convertible Bonds and fixed income*)
    f_AllocationInstruction_AccruedInterestRate : fix_float_6 option;
    (** Applicable for Convertible Bonds and fixed income (REMOVED FROM THIS LOCATION AS OF FIX 4.4, REPLACED BY AllocAccruedInterest)*)
    f_AllocationInstruction_AccruedInterestAmt : fix_float_6 option;
    (** (Deprecated) use AccruedInterestAmt Sum of AccruedInterestAmt within repeating group.*)
    f_AllocationInstruction_TotalAccruedInterestAmt : fix_float_6 option;
    f_AllocationInstruction_InterestAtMaturity : fix_float_6 option;
    (** For repurchase agreements the accrued interest on termination.*)
    f_AllocationInstruction_EndAccruedInterestAmt : fix_float_6 option;
    (** For repurchase agreements the start (dirty) cash consideration*)
    f_AllocationInstruction_StartCash : fix_float_6 option;
    (** For repurchase agreements the end (dirty) cash consideration*)
    f_AllocationInstruction_EndCash : fix_float_6 option;
    f_AllocationInstruction_LegalConfirm : fix_legalconfirm option;
    f_AllocationInstruction_Stipulations : fix_rg_stipulations;
    f_AllocationInstruction_YieldData : fix_yielddata;
    (** Indicates total number of allocation groups (used to support fragmentation). Must equal the sum of all NoAllocs values across all message fragments making up this allocation instruction.
     Only required where message has been fragmented.*)
    f_AllocationInstruction_TotNoAllocs : int option;
    (** Indicates whether this is the last fragment in a sequence of message fragments.
     Only required where message has been fragmented.*)
    f_AllocationInstruction_LastFragment : fix_lastfragment option;
    (** Indicates number of allocation groups to follow.
     Not required for AllocTransType=Cancel
     Not required for AllocType=" Ready-To-Book " or "Warehouse instruction".*)
    f_AllocationInstruction_AllocGrp : fix_rg_allocgrp
}
;;

(** In versions of FIX prior to version 4.4, this message was known as the Allocation ACK message.
 The Allocation Instruction Ack message is used to acknowledge the receipt of and provide status for an Allocation Instruction message.*)
type full_fix_allocationinstructionack_data = {
    f_AllocationInstructionAck_AllocID : string;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_AllocationInstructionAck_Parties : fix_rg_parties;
    (** Optional second identifier for the allocation instruction being acknowledged (need not be unique)*)
    f_AllocationInstructionAck_SecondaryAllocID : string option;
    f_AllocationInstructionAck_TradeDate : fix_localmktdate option;
    (** Date/Time Allocation Instruction Ack generated*)
    f_AllocationInstructionAck_TransactTime : fix_utctimestamp;
    (** Denotes the status of the allocation instruction; received (but not yet processed), rejected (at block or account level) or accepted (and processed).*)
    f_AllocationInstructionAck_AllocStatus : fix_allocstatus;
    (** Required for AllocStatus = 1 ( block level reject) and for AllocStatus 2 (account level reject) if the individual accounts and reject reasons are not provided in this message*)
    f_AllocationInstructionAck_AllocRejCode : fix_allocrejcode option;
    f_AllocationInstructionAck_AllocType : fix_alloctype option;
    (** Required if AllocType = 8 (Request to Intermediary)
     Indicates status that is requested to be transmitted to counterparty by the intermediary (i.e. clearing house)*)
    f_AllocationInstructionAck_AllocIntermedReqType : fix_allocintermedreqtype option;
    (** Denotes whether the financial details provided on the Allocation Instruction were successfully matched.*)
    f_AllocationInstructionAck_MatchStatus : fix_matchstatus option;
    f_AllocationInstructionAck_Product : fix_product option;
    f_AllocationInstructionAck_SecurityType : fix_securitytype option;
    (** Can include explanation for AllocRejCode = 7 (other)*)
    f_AllocationInstructionAck_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_AllocationInstructionAck_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_AllocationInstructionAck_EncodedText : string option;
    (** This repeating group is optionally used for messages with AllocStatus = 2 (account level reject) to provide details of the individual accounts that caused the rejection, together with reject reasons. This group should not be populated when AllocStatus has any other value.
     Indicates number of allocation groups to follow.*)
    f_AllocationInstructionAck_AllocAckGrp : fix_rg_allocackgrp
}
;;

(** Sent from sell-side to buy-side, sell-side to 3rd-party or 3rd-party to buy-side, the Allocation Report (Claim) provides account breakdown of an order or set of orders plus any additional follow-up front-office information developed post-trade during the trade allocation, matching and calculation phase. In versions of FIX prior to version 4.4, this functionality was provided through the Allocation message. Depending on the needs of the market and the timing of "confirmed" status, the role of Allocation Report can be taken over in whole or in part by the Confirmation message.
 Note the response to the Allocation Report message is the Allocation Report Ack message. In versions of FIX prior to version 4.4, the Allocation ACK served this purpose.*)
type full_fix_allocationreport_data = {
    (** Unique identifier for this message*)
    f_AllocationReport_AllocReportID : string;
    f_AllocationReport_AllocID : string option;
    (** i.e. New, Cancel, Replace*)
    f_AllocationReport_AllocTransType : fix_alloctranstype;
    (** Required for AllocTransType = Replace or Cancel*)
    f_AllocationReport_AllocReportRefID : string option;
    (** Required for AllocTransType = Replace or Cancel
     Gives the reason for replacing or cancelling the allocation report*)
    f_AllocationReport_AllocCancReplaceReason : fix_alloccancreplacereason option;
    (** Optional second identifier for this allocation instruction (need not be unique)*)
    f_AllocationReport_SecondaryAllocID : string option;
    (** Specifies the purpose or type of Allocation Report message*)
    f_AllocationReport_AllocReportType : fix_allocreporttype;
    f_AllocationReport_AllocStatus : fix_allocstatus;
    (** Required for AllocStatus = 1 (rejected)*)
    f_AllocationReport_AllocRejCode : fix_allocrejcode option;
    (** Required for AllocTransType = Replace or Cancel*)
    f_AllocationReport_RefAllocID : string option;
    (** Required if AllocReportType = 8 (Request to Intermediary)
     Indicates status that is requested to be transmitted to counterparty by the intermediary (i.e. clearing house)*)
    f_AllocationReport_AllocIntermedReqType : fix_allocintermedreqtype option;
    (** Can be used to link two different Allocation messages (each with unique AllocID) together, i.e. for F/X "Netting" or "Swaps"*)
    f_AllocationReport_AllocLinkID : string option;
    (** Can be used to link two different Allocation messages and identifies the type of link. Required if AllocLinkID is specified.*)
    f_AllocationReport_AllocLinkType : fix_alloclinktype option;
    f_AllocationReport_BookingRefID : string option;
    (** Indicates how the orders being booked and allocated by this message are identified, i.e. by explicit definition in the NoOrders group or not.*)
    f_AllocationReport_AllocNoOrdersType : fix_allocnoorderstype;
    (** Indicates number of orders to be combined for allocation. If order(s) were manually delivered set to 1 (one).Required when AllocNoOrdersType = 1*)
    f_AllocationReport_OrdAllocGrp : fix_rg_ordallocgrp;
    (** Indicates number of individual execution repeating group entries to follow. Absence of this field indicates that no individual execution entries are included. Primarily used to support step-outs.*)
    f_AllocationReport_ExecAllocGrp : fix_rg_execallocgrp;
    f_AllocationReport_PreviouslyReported : fix_previouslyreported option;
    f_AllocationReport_ReversalIndicator : bool option;
    f_AllocationReport_MatchType : fix_matchtype option;
    f_AllocationReport_Side : fix_side;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_AllocationReport_Instrument : fix_instrument;
    (** Insert here the set of "InstrumentExtension" fields defined in "Common Components of Application Messages"*)
    f_AllocationReport_InstrumentExtension : fix_instrumentextension;
    (** Insert here the set of "FinancingDetails" fields defined in "Common Components of Application Messages"*)
    f_AllocationReport_FinancingDetails : fix_financingdetails;
    f_AllocationReport_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    f_AllocationReport_InstrmtLegGrp : fix_rg_instrmtleggrp;
    (** Total quantity (e.g. number of shares) allocated to all accounts, or that is Ready-To-Book*)
    f_AllocationReport_Quantity : fix_float_6;
    f_AllocationReport_QtyType : fix_qtytype option;
    (** Market of the executions.*)
    f_AllocationReport_LastMkt : fix_exchange option;
    f_AllocationReport_TradeOriginationDate : fix_localmktdate option;
    f_AllocationReport_TradingSessionID : string option;
    f_AllocationReport_TradingSessionSubID : string option;
    f_AllocationReport_PriceType : fix_pricetype option;
    (** For F/X orders, should be the "all-in" rate (spot rate adjusted for forward points).*)
    f_AllocationReport_AvgPx : fix_float_6;
    f_AllocationReport_AvgParPx : fix_float_6 option;
    (** Insert here the set of "SpreadOrBenchmarkCurveData" fields defined in "Common Components of Application Messages"*)
    f_AllocationReport_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    (** Currency of AvgPx. Should be the currency of the local market or exchange where the trade was conducted.*)
    f_AllocationReport_Currency : fix_currency option;
    (** Absence of this field indicates that default precision arranged by the broker/institution is to be used*)
    f_AllocationReport_AvgPxPrecision : int option;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_AllocationReport_Parties : fix_rg_parties;
    f_AllocationReport_TradeDate : fix_localmktdate;
    (** Date/time when allocation is generated*)
    f_AllocationReport_TransactTime : fix_utctimestamp option;
    f_AllocationReport_SettlType : fix_settltype option;
    (** Takes precedence over SettlType value and conditionally required/omitted for specific SettlType values.*)
    f_AllocationReport_SettlDate : fix_localmktdate option;
    (** Method for booking. Used to provide notification that this is to be booked out as an OTC derivative (e.g. CFD or similar). Absence of this field implies regular booking.*)
    f_AllocationReport_BookingType : fix_bookingtype option;
    (** Expressed in same currency as AvgPx. Sum of (AllocQty * AllocAvgPx or AllocPrice).*)
    f_AllocationReport_GrossTradeAmt : fix_float_6 option;
    f_AllocationReport_Concession : fix_float_6 option;
    f_AllocationReport_TotalTakedown : fix_float_6 option;
    (** Expressed in same currency as AvgPx. Sum of AllocNetMoney.*)
    f_AllocationReport_NetMoney : fix_float_6 option;
    f_AllocationReport_PositionEffect : fix_positioneffect option;
    (** Indicates if Allocation has been automatically accepted on behalf of the Carry Firm by the Clearing House*)
    f_AllocationReport_AutoAcceptIndicator : bool option;
    f_AllocationReport_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_AllocationReport_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_AllocationReport_EncodedText : string option;
    (** Applicable for Convertible Bonds and fixed income*)
    f_AllocationReport_NumDaysInterest : int option;
    (** Applicable for Convertible Bonds and fixed income*)
    f_AllocationReport_AccruedInterestRate : fix_float_6 option;
    (** Sum of AllocAccruedInterestAmt within repeating group.*)
    f_AllocationReport_AccruedInterestAmt : fix_float_6 option;
    (** (Deprecated) use AccruedInterestAmt Sum of AccruedInterestAmt within repeating group.*)
    f_AllocationReport_TotalAccruedInterestAmt : fix_float_6 option;
    f_AllocationReport_InterestAtMaturity : fix_float_6 option;
    (** For repurchase agreements the accrued interest on termination.*)
    f_AllocationReport_EndAccruedInterestAmt : fix_float_6 option;
    (** For repurchase agreements the start (dirty) cash consideration*)
    f_AllocationReport_StartCash : fix_float_6 option;
    (** For repurchase agreements the end (dirty) cash consideration*)
    f_AllocationReport_EndCash : fix_float_6 option;
    f_AllocationReport_LegalConfirm : fix_legalconfirm option;
    f_AllocationReport_Stipulations : fix_rg_stipulations;
    f_AllocationReport_YieldData : fix_yielddata;
    (** Indicates total number of allocation groups (used to support fragmentation). Must equal the sum of all NoAllocs values across all message fragments making up this allocation instruction.
     Only required where message has been fragmented.*)
    f_AllocationReport_TotNoAllocs : int option;
    (** Indicates whether this is the last fragment in a sequence of message fragments.
     Only required where message has been fragmented.*)
    f_AllocationReport_LastFragment : fix_lastfragment option;
    (** Indicates number of allocation groups to follow.
     Not required for AllocTransType=Cancel
     Not required for AllocReportType= "Warehouse recap".*)
    f_AllocationReport_AllocGrp : fix_rg_allocgrp
}
;;

(** The Allocation Report Ack message is used to acknowledge the receipt of and provide status for an Allocation Report message.*)
type full_fix_allocationreportack_data = {
    f_AllocationReportAck_AllocReportID : string;
    f_AllocationReportAck_AllocID : string;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_AllocationReportAck_Parties : fix_rg_parties;
    (** Optional second identifier for the allocation report being acknowledged (need not be unique)*)
    f_AllocationReportAck_SecondaryAllocID : string option;
    f_AllocationReportAck_TradeDate : fix_localmktdate option;
    (** Date/Time Allocation Report Ack generated*)
    f_AllocationReportAck_TransactTime : fix_utctimestamp;
    (** Denotes the status of the allocation report; received (but not yet processed), rejected (at block or account level) or accepted (and processed).*)
    f_AllocationReportAck_AllocStatus : fix_allocstatus;
    (** Required for AllocStatus = 1 ( block level reject) and for AllocStatus 2 (account level reject) if the individual accounts and reject reasons are not provided in this message*)
    f_AllocationReportAck_AllocRejCode : fix_allocrejcode option;
    f_AllocationReportAck_AllocReportType : fix_allocreporttype option;
    (** Required if AllocReportType = 8 (Request to Intermediary)
     Indicates status that is requested to be transmitted to counterparty by the intermediary (i.e. clearing house)*)
    f_AllocationReportAck_AllocIntermedReqType : fix_allocintermedreqtype option;
    (** Denotes whether the financial details provided on the Allocation Report were successfully matched.*)
    f_AllocationReportAck_MatchStatus : fix_matchstatus option;
    f_AllocationReportAck_Product : fix_product option;
    f_AllocationReportAck_SecurityType : fix_securitytype option;
    (** Can include explanation for AllocRejCode = 7 (other)*)
    f_AllocationReportAck_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_AllocationReportAck_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_AllocationReportAck_EncodedText : string option;
    (** This repeating group is optionally used for messages with AllocStatus = 2 (account level reject) to provide details of the individual accounts that caused the rejection, together with reject reasons. This group should not be populated where AllocStatus has any other value.
     Indicates number of allocation groups to follow.*)
    f_AllocationReportAck_AllocAckGrp : fix_rg_allocackgrp
}
;;

(** Assignment Reports are sent from a clearing house to counterparties, such as a clearing firm as a result of the assignment process.*)
type full_fix_assignmentreport_data = {
    (** Unique identifier for the Assignment report*)
    f_AssignmentReport_AsgnRptID : string;
    (** Total Number of Assignment Reports being returned to a firm*)
    f_AssignmentReport_TotNumAssignmentReports : int option;
    f_AssignmentReport_LastRptRequested : bool option;
    (** Clearing Organization
     Clearing Firm
     Contra Clearing Organization
     Contra Clearing Firm
     Position Account*)
    f_AssignmentReport_Parties : fix_rg_parties;
    (** Customer Account*)
    f_AssignmentReport_Account : string option;
    (** Type of account associated with the order (Origin)*)
    f_AssignmentReport_AccountType : fix_accounttype;
    (** CFI Code - Market Indicator (col 4) used to indicate Market of Assignment*)
    f_AssignmentReport_Instrument : fix_instrument;
    f_AssignmentReport_Currency : fix_currency option;
    (** Number of legs that make up the Security*)
    f_AssignmentReport_InstrmtLegGrp : fix_rg_instrmtleggrp;
    (** Number of legs that make up the Security*)
    f_AssignmentReport_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    (** See definition for Position Quantity in the Proposed Component Block section above
     AS - Assignment Quantity*)
    f_AssignmentReport_PositionQty : fix_rg_positionqty;
    (** Insert here here the set of "Position Amount Data" fields defined in "Common Components of Application Messages"
     FMTM - Final Mark-to-Market for Assignment*)
    f_AssignmentReport_PositionAmountData : fix_rg_positionamountdata;
    f_AssignmentReport_ThresholdAmount : fix_float_6 option;
    (** Settlement Price of Option*)
    f_AssignmentReport_SettlPrice : fix_float_6;
    (** Values = Final, Theoretical*)
    f_AssignmentReport_SettlPriceType : fix_settlpricetype;
    (** Settlement Price of Underlying*)
    f_AssignmentReport_UnderlyingSettlPrice : fix_float_6;
    (** Expiration Date of Option*)
    f_AssignmentReport_ExpireDate : fix_localmktdate option;
    (** Method under which assignment was conducted
     Values = Random, ProRata*)
    f_AssignmentReport_AssignmentMethod : fix_assignmentmethod;
    (** Quantity Increment used in performing assignment*)
    f_AssignmentReport_AssignmentUnit : fix_float_6 option;
    (** Open interest that was eligible for assignment*)
    f_AssignmentReport_OpenInterest : fix_float_6;
    (** Exercise Method used to in performing assignment
     Values = Automatic, Manual*)
    f_AssignmentReport_ExerciseMethod : fix_exercisemethod;
    (** Settlement Session - EOD or Intraday*)
    f_AssignmentReport_SettlSessID : fix_settlsessid;
    (** Settlement Session enumerator*)
    f_AssignmentReport_SettlSessSubID : string;
    (** Business date of assignment*)
    f_AssignmentReport_ClearingBusinessDate : fix_localmktdate;
    f_AssignmentReport_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_AssignmentReport_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_AssignmentReport_EncodedText : string option
}
;;

(** The BidRequest Message can be used in one of two ways depending on which market conventions are being followed.*)
type full_fix_bidrequest_data = {
    (** Required to relate the bid response*)
    f_BidRequest_BidID : string option;
    f_BidRequest_ClientBidID : string;
    (** Identifies the Bid Request message transaction type*)
    f_BidRequest_BidRequestTransType : fix_bidrequesttranstype;
    f_BidRequest_ListName : string option;
    f_BidRequest_TotNoRelatedSym : int;
    (** e.g. "Non Disclosed", "Disclosed", No Bidding Process*)
    f_BidRequest_BidType : fix_bidtype;
    (** Total number of tickets/allocations assuming fully executed*)
    f_BidRequest_NumTickets : int option;
    (** Used to represent the currency of monetary amounts.*)
    f_BidRequest_Currency : fix_currency option;
    (** Expressed in Currency*)
    f_BidRequest_SideValue1 : fix_float_6 option;
    (** Expressed in Currency*)
    f_BidRequest_SideValue2 : fix_float_6 option;
    (** Used if BidType="Non Disclosed"*)
    f_BidRequest_BidDescReqGrp : fix_rg_biddescreqgrp;
    (** Used if BidType="Disclosed"*)
    f_BidRequest_BidCompReqGrp : fix_rg_bidcompreqgrp;
    f_BidRequest_LiquidityIndType : fix_liquidityindtype option;
    (** Overall weighted average liquidity expressed as a % of average daily volume*)
    f_BidRequest_WtAverageLiquidity : fix_float_6 option;
    f_BidRequest_ExchangeForPhysical : fix_exchangeforphysical option;
    (** % value of stocks outside main country in Currency*)
    f_BidRequest_OutMainCntryUIndex : fix_float_6 option;
    (** % of program that crosses in Currency*)
    f_BidRequest_CrossPercent : fix_float_6 option;
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
    f_BidRequest_BidTradeType : fix_bidtradetype;
    f_BidRequest_BasisPxType : fix_basispxtype;
    (** Used when BasisPxType = "C"*)
    f_BidRequest_StrikeTime : fix_utctimestamp option;
    f_BidRequest_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_BidRequest_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_BidRequest_EncodedText : string option
}
;;

(** The Bid Response message can be used in one of two ways depending on which market conventions are being followed.
       In the "Non disclosed" convention the Bid Response message can be used to supply a bid based on the sector, country, index and liquidity information contained within the corresponding bid request message. See "Program/Basket/List Trading"  for an example.
       In the "Disclosed" convention the Bid Response message can be used to supply bids based on the List Order Detail messages sent in advance of the corresponding Bid Request message.*)
type full_fix_bidresponse_data = {
    f_BidResponse_BidID : string option;
    f_BidResponse_ClientBidID : string option;
    (** Number of bid repeating groups*)
    f_BidResponse_BidCompRspGrp : fix_rg_bidcomprspgrp
}
;;

(** Used to assign collateral to cover a trading position. This message can be sent unsolicited or in reply to a Collateral Request message.*)
type full_fix_collateralassignment_data = {
    (** Unique Identifer for collateral assignment*)
    f_CollateralAssignment_CollAsgnID : string;
    (** Identifer of CollReqID to which the Collateral Assignment is in response*)
    f_CollateralAssignment_CollReqID : string option;
    (** Reason for collateral assignment*)
    f_CollateralAssignment_CollAsgnReason : fix_collasgnreason;
    (** Collateral Transaction Type*)
    f_CollateralAssignment_CollAsgnTransType : fix_collasgntranstype;
    (** Collateral assignment to which this transaction refers*)
    f_CollateralAssignment_CollAsgnRefID : string option;
    f_CollateralAssignment_TransactTime : fix_utctimestamp;
    (** For an Initial assignment, time by which a response is expected*)
    f_CollateralAssignment_ExpireTime : fix_utctimestamp option;
    f_CollateralAssignment_Parties : fix_rg_parties;
    (** Customer Account*)
    f_CollateralAssignment_Account : string option;
    (** Type of account associated with the order (Origin)*)
    f_CollateralAssignment_AccountType : fix_accounttype option;
    (** Identifier fo order for which collateral is required*)
    f_CollateralAssignment_ClOrdID : string option;
    (** Identifier fo order for which collateral is required*)
    f_CollateralAssignment_OrderID : string option;
    (** Identifier fo order for which collateral is required*)
    f_CollateralAssignment_SecondaryOrderID : string option;
    (** Identifier fo order for which collateral is required*)
    f_CollateralAssignment_SecondaryClOrdID : string option;
    (** Executions for which collateral is required*)
    f_CollateralAssignment_ExecCollGrp : fix_rg_execcollgrp;
    (** Trades for which collateral is required*)
    f_CollateralAssignment_TrdCollGrp : fix_rg_trdcollgrp;
    (** Insert here the set of "Instrument" fields defined in "Common Components of Application Messages"*)
    f_CollateralAssignment_Instrument : fix_instrument;
    (** Insert here the set of "FinancingDetails" fields defined in "Common Components of Application Messages"*)
    f_CollateralAssignment_FinancingDetails : fix_financingdetails;
    f_CollateralAssignment_SettlDate : fix_localmktdate option;
    f_CollateralAssignment_Quantity : fix_float_6 option;
    f_CollateralAssignment_QtyType : fix_qtytype option;
    f_CollateralAssignment_Currency : fix_currency option;
    (** Number of legs that make up the Security*)
    f_CollateralAssignment_InstrmtLegGrp : fix_rg_instrmtleggrp;
    (** Number of legs that make up the Security*)
    f_CollateralAssignment_UndInstrmtCollGrp : fix_rg_undinstrmtcollgrp;
    f_CollateralAssignment_MarginExcess : fix_float_6 option;
    f_CollateralAssignment_TotalNetValue : fix_float_6 option;
    f_CollateralAssignment_CashOutstanding : fix_float_6 option;
    (** Insert here the set of "TrdRegTimestamps" fields defined in "Common Components of Application Messages"*)
    f_CollateralAssignment_TrdRegTimestamps : fix_rg_trdregtimestamps;
    f_CollateralAssignment_Side : fix_side option;
    (** Required if any miscellaneous fees are reported. Indicates number of repeating entries
     ** Nested Repeating Group follows ***)
    f_CollateralAssignment_MiscFeesGrp : fix_rg_miscfeesgrp;
    f_CollateralAssignment_Price : fix_float_6 option;
    f_CollateralAssignment_PriceType : fix_pricetype option;
    f_CollateralAssignment_AccruedInterestAmt : fix_float_6 option;
    f_CollateralAssignment_EndAccruedInterestAmt : fix_float_6 option;
    f_CollateralAssignment_StartCash : fix_float_6 option;
    f_CollateralAssignment_EndCash : fix_float_6 option;
    (** Insert here the set of "SpreadOrBenchmarkCurveData" fields defined in "Common Components of Application Messages"*)
    f_CollateralAssignment_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    (** Insert here the set of "Stipulations" fields defined in "Common Components of Application Messages"*)
    f_CollateralAssignment_Stipulations : fix_rg_stipulations;
    (** Insert here the set of "SettlInstructionsData" fields defined in "Common Components of Application Messages"*)
    f_CollateralAssignment_SettlInstructionsData : fix_settlinstructionsdata;
    (** Trading Session in which trade occurred*)
    f_CollateralAssignment_TradingSessionID : string option;
    (** Trading Session Subid in which trade occurred*)
    f_CollateralAssignment_TradingSessionSubID : string option;
    f_CollateralAssignment_SettlSessID : fix_settlsessid option;
    f_CollateralAssignment_SettlSessSubID : string option;
    f_CollateralAssignment_ClearingBusinessDate : fix_localmktdate option;
    f_CollateralAssignment_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_CollateralAssignment_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_CollateralAssignment_EncodedText : string option
}
;;

(** Used to inquire for collateral status*)
type full_fix_collateralinquiry_data = {
    (** Identifier for the collateral inquiry to which this message is a reply*)
    f_CollateralInquiry_CollInquiryID : string option;
    (** Number of qualifiers to inquiry*)
    f_CollateralInquiry_CollInqQualGrp : fix_rg_collinqqualgrp;
    (** Used to subscribe / unsubscribe for collateral status reports.
     If the field is absent, the default will be snapshot request only - no subscription.*)
    f_CollateralInquiry_SubscriptionRequestType : fix_subscriptionrequesttype option;
    (** Ability to specify whether the response to the request should be delivered inband or via pre-arranged out-of-band transport.*)
    f_CollateralInquiry_ResponseTransportType : fix_responsetransporttype option;
    (** URI destination name. Used if ResponseTransportType is out-of-band.*)
    f_CollateralInquiry_ResponseDestination : string option;
    f_CollateralInquiry_Parties : fix_rg_parties;
    (** Customer Account*)
    f_CollateralInquiry_Account : string option;
    (** Type of account associated with the order (Origin)*)
    f_CollateralInquiry_AccountType : fix_accounttype option;
    (** Identifier fo order for which collateral is required*)
    f_CollateralInquiry_ClOrdID : string option;
    (** Identifier fo order for which collateral is required*)
    f_CollateralInquiry_OrderID : string option;
    (** Identifier fo order for which collateral is required*)
    f_CollateralInquiry_SecondaryOrderID : string option;
    (** Identifier fo order for which collateral is required*)
    f_CollateralInquiry_SecondaryClOrdID : string option;
    (** Executions for which collateral is required*)
    f_CollateralInquiry_ExecCollGrp : fix_rg_execcollgrp;
    (** Trades for which collateral is required*)
    f_CollateralInquiry_TrdCollGrp : fix_rg_trdcollgrp;
    (** Insert here the set of "Instrument" fields defined in "Common Components of Application Messages"*)
    f_CollateralInquiry_Instrument : fix_instrument;
    (** Insert here the set of "FinancingDetails" fields defined in "Common Components of Application Messages"*)
    f_CollateralInquiry_FinancingDetails : fix_financingdetails;
    f_CollateralInquiry_SettlDate : fix_localmktdate option;
    f_CollateralInquiry_Quantity : fix_float_6 option;
    f_CollateralInquiry_QtyType : fix_qtytype option;
    f_CollateralInquiry_Currency : fix_currency option;
    (** Number of legs that make up the Security*)
    f_CollateralInquiry_InstrmtLegGrp : fix_rg_instrmtleggrp;
    (** Number of legs that make up the Security*)
    f_CollateralInquiry_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    f_CollateralInquiry_MarginExcess : fix_float_6 option;
    f_CollateralInquiry_TotalNetValue : fix_float_6 option;
    f_CollateralInquiry_CashOutstanding : fix_float_6 option;
    (** Insert here the set of "TrdRegTimestamps" fields defined in "Common Components of Application Messages"*)
    f_CollateralInquiry_TrdRegTimestamps : fix_rg_trdregtimestamps;
    f_CollateralInquiry_Side : fix_side option;
    f_CollateralInquiry_Price : fix_float_6 option;
    f_CollateralInquiry_PriceType : fix_pricetype option;
    f_CollateralInquiry_AccruedInterestAmt : fix_float_6 option;
    f_CollateralInquiry_EndAccruedInterestAmt : fix_float_6 option;
    f_CollateralInquiry_StartCash : fix_float_6 option;
    f_CollateralInquiry_EndCash : fix_float_6 option;
    (** Insert here the set of "SpreadOrBenchmarkCurveData" fields defined in "Common Components of Application Messages"*)
    f_CollateralInquiry_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    (** Insert here the set of "Stipulations" fields defined in "Common Components of Application Messages"*)
    f_CollateralInquiry_Stipulations : fix_rg_stipulations;
    (** Insert here the set of "SettlInstructionsData" fields defined in "Common Components of Application Messages"*)
    f_CollateralInquiry_SettlInstructionsData : fix_settlinstructionsdata;
    (** Trading Session in which trade occurred*)
    f_CollateralInquiry_TradingSessionID : string option;
    (** Trading Session Subid in which trade occurred*)
    f_CollateralInquiry_TradingSessionSubID : string option;
    f_CollateralInquiry_SettlSessID : fix_settlsessid option;
    f_CollateralInquiry_SettlSessSubID : string option;
    f_CollateralInquiry_ClearingBusinessDate : fix_localmktdate option;
    f_CollateralInquiry_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_CollateralInquiry_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_CollateralInquiry_EncodedText : string option
}
;;

(** Used to respond to a Collateral Inquiry*)
type full_fix_collateralinquiryack_data = {
    (** Identifier for the collateral inquiry to which this message is a reply*)
    f_CollateralInquiryAck_CollInquiryID : string;
    (** Status of the Collateral Inquiry referenced by CollInquiryID*)
    f_CollateralInquiryAck_CollInquiryStatus : fix_collinquirystatus;
    (** Result of the Collateral Inquriy referenced by CollInquiryID - specifies any errors or warnings*)
    f_CollateralInquiryAck_CollInquiryResult : fix_collinquiryresult option;
    (** Number of qualifiers to inquiry*)
    f_CollateralInquiryAck_CollInqQualGrp : fix_rg_collinqqualgrp;
    (** Total number of reports generated in response to this inquiry*)
    f_CollateralInquiryAck_TotNumReports : int option;
    f_CollateralInquiryAck_Parties : fix_rg_parties;
    (** Customer Account*)
    f_CollateralInquiryAck_Account : string option;
    (** Type of account associated with the order (Origin)*)
    f_CollateralInquiryAck_AccountType : fix_accounttype option;
    (** Identifier fo order for which collateral is required*)
    f_CollateralInquiryAck_ClOrdID : string option;
    (** Identifier fo order for which collateral is required*)
    f_CollateralInquiryAck_OrderID : string option;
    (** Identifier fo order for which collateral is required*)
    f_CollateralInquiryAck_SecondaryOrderID : string option;
    (** Identifier fo order for which collateral is required*)
    f_CollateralInquiryAck_SecondaryClOrdID : string option;
    (** Executions for which collateral is required*)
    f_CollateralInquiryAck_ExecCollGrp : fix_rg_execcollgrp;
    (** Trades for which collateral is required*)
    f_CollateralInquiryAck_TrdCollGrp : fix_rg_trdcollgrp;
    (** Insert here the set of "Instrument" fields defined in "Common Components of Application Messages"*)
    f_CollateralInquiryAck_Instrument : fix_instrument;
    (** Insert here the set of "FinancingDetails" fields defined in "Common Components of Application Messages"*)
    f_CollateralInquiryAck_FinancingDetails : fix_financingdetails;
    f_CollateralInquiryAck_SettlDate : fix_localmktdate option;
    f_CollateralInquiryAck_Quantity : fix_float_6 option;
    f_CollateralInquiryAck_QtyType : fix_qtytype option;
    f_CollateralInquiryAck_Currency : fix_currency option;
    (** Number of legs that make up the Security*)
    f_CollateralInquiryAck_InstrmtLegGrp : fix_rg_instrmtleggrp;
    (** Number of legs that make up the Security*)
    f_CollateralInquiryAck_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    (** Trading Session in which trade occurred*)
    f_CollateralInquiryAck_TradingSessionID : string option;
    (** Trading Session Subid in which trade occurred*)
    f_CollateralInquiryAck_TradingSessionSubID : string option;
    f_CollateralInquiryAck_SettlSessID : fix_settlsessid option;
    f_CollateralInquiryAck_SettlSessSubID : string option;
    f_CollateralInquiryAck_ClearingBusinessDate : fix_localmktdate option;
    (** Ability to specify whether the response to the request should be delivered inband or via pre-arranged out-of-band transport.*)
    f_CollateralInquiryAck_ResponseTransportType : fix_responsetransporttype option;
    (** URI destination name. Used if ResponseTransportType is out-of-band.*)
    f_CollateralInquiryAck_ResponseDestination : string option;
    f_CollateralInquiryAck_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_CollateralInquiryAck_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_CollateralInquiryAck_EncodedText : string option
}
;;

(** Used to report collateral status when responding to a Collateral Inquiry message.*)
type full_fix_collateralreport_data = {
    (** Unique Identifer for collateral report*)
    f_CollateralReport_CollRptID : string;
    (** Identifier for the collateral inquiry to which this message is a reply*)
    f_CollateralReport_CollInquiryID : string option;
    (** Collateral status*)
    f_CollateralReport_CollStatus : fix_collstatus;
    f_CollateralReport_TotNumReports : int option;
    f_CollateralReport_LastRptRequested : bool option;
    f_CollateralReport_Parties : fix_rg_parties;
    (** Customer Account*)
    f_CollateralReport_Account : string option;
    (** Type of account associated with the order (Origin)*)
    f_CollateralReport_AccountType : fix_accounttype option;
    (** Identifier fo order for which collateral is required*)
    f_CollateralReport_ClOrdID : string option;
    (** Identifier fo order for which collateral is required*)
    f_CollateralReport_OrderID : string option;
    (** Identifier fo order for which collateral is required*)
    f_CollateralReport_SecondaryOrderID : string option;
    (** Identifier fo order for which collateral is required*)
    f_CollateralReport_SecondaryClOrdID : string option;
    (** Executions for which collateral is required*)
    f_CollateralReport_ExecCollGrp : fix_rg_execcollgrp;
    (** Trades for which collateral is required*)
    f_CollateralReport_TrdCollGrp : fix_rg_trdcollgrp;
    (** Insert here the set of "Instrument" fields defined in "Common Components of Application Messages"*)
    f_CollateralReport_Instrument : fix_instrument;
    (** Insert here the set of "FinancingDetails" fields defined in "Common Components of Application Messages"*)
    f_CollateralReport_FinancingDetails : fix_financingdetails;
    f_CollateralReport_SettlDate : fix_localmktdate option;
    f_CollateralReport_Quantity : fix_float_6 option;
    f_CollateralReport_QtyType : fix_qtytype option;
    f_CollateralReport_Currency : fix_currency option;
    (** Number of legs that make up the Security*)
    f_CollateralReport_InstrmtLegGrp : fix_rg_instrmtleggrp;
    (** Number of legs that make up the Security*)
    f_CollateralReport_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    f_CollateralReport_MarginExcess : fix_float_6 option;
    f_CollateralReport_TotalNetValue : fix_float_6 option;
    f_CollateralReport_CashOutstanding : fix_float_6 option;
    (** Insert here the set of "TrdRegTimestamps" fields defined in "Common Components of Application Messages"*)
    f_CollateralReport_TrdRegTimestamps : fix_rg_trdregtimestamps;
    f_CollateralReport_Side : fix_side option;
    (** Required if any miscellaneous fees are reported. Indicates number of repeating entries
     ** Nested Repeating Group follows ***)
    f_CollateralReport_MiscFeesGrp : fix_rg_miscfeesgrp;
    f_CollateralReport_Price : fix_float_6 option;
    f_CollateralReport_PriceType : fix_pricetype option;
    f_CollateralReport_AccruedInterestAmt : fix_float_6 option;
    f_CollateralReport_EndAccruedInterestAmt : fix_float_6 option;
    f_CollateralReport_StartCash : fix_float_6 option;
    f_CollateralReport_EndCash : fix_float_6 option;
    (** Insert here the set of "SpreadOrBenchmarkCurveData" fields defined in "Common Components of Application Messages"*)
    f_CollateralReport_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    (** Insert here the set of "Stipulations" fields defined in "Common Components of Application Messages"*)
    f_CollateralReport_Stipulations : fix_rg_stipulations;
    (** Insert here the set of "SettlInstructionsData" fields defined in "Common Components of Application Messages"*)
    f_CollateralReport_SettlInstructionsData : fix_settlinstructionsdata;
    (** Trading Session in which trade occurred*)
    f_CollateralReport_TradingSessionID : string option;
    (** Trading Session Subid in which trade occurred*)
    f_CollateralReport_TradingSessionSubID : string option;
    f_CollateralReport_SettlSessID : fix_settlsessid option;
    f_CollateralReport_SettlSessSubID : string option;
    f_CollateralReport_ClearingBusinessDate : fix_localmktdate option;
    f_CollateralReport_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_CollateralReport_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_CollateralReport_EncodedText : string option
}
;;

(** An initiator that requires collateral from a respondent sends a Collateral Request. The initiator can be either counterparty to a trade in a two party model or an intermediary such as an ATS or clearinghouse in a three party model. A Collateral Assignment is expected as a response to a request for collateral.*)
type full_fix_collateralrequest_data = {
    (** Unique identifier for collateral request*)
    f_CollateralRequest_CollReqID : string;
    (** Reason collateral assignment is being requested*)
    f_CollateralRequest_CollAsgnReason : fix_collasgnreason;
    f_CollateralRequest_TransactTime : fix_utctimestamp;
    (** Time until when Respondent has to assign collateral*)
    f_CollateralRequest_ExpireTime : fix_utctimestamp option;
    f_CollateralRequest_Parties : fix_rg_parties;
    (** Customer Account*)
    f_CollateralRequest_Account : string option;
    (** Type of account associated with the order (Origin)*)
    f_CollateralRequest_AccountType : fix_accounttype option;
    (** Identifier fo order for which collateral is required*)
    f_CollateralRequest_ClOrdID : string option;
    (** Identifier fo order for which collateral is required*)
    f_CollateralRequest_OrderID : string option;
    (** Identifier fo order for which collateral is required*)
    f_CollateralRequest_SecondaryOrderID : string option;
    (** Identifier fo order for which collateral is required*)
    f_CollateralRequest_SecondaryClOrdID : string option;
    (** Executions for which collateral is required*)
    f_CollateralRequest_ExecCollGrp : fix_rg_execcollgrp;
    (** Trades for which collateral is required*)
    f_CollateralRequest_TrdCollGrp : fix_rg_trdcollgrp;
    (** Instrument that was traded for which collateral is required*)
    f_CollateralRequest_Instrument : fix_instrument;
    (** Details of the Agreement and Deal*)
    f_CollateralRequest_FinancingDetails : fix_financingdetails;
    f_CollateralRequest_SettlDate : fix_localmktdate option;
    f_CollateralRequest_Quantity : fix_float_6 option;
    f_CollateralRequest_QtyType : fix_qtytype option;
    f_CollateralRequest_Currency : fix_currency option;
    (** Number of legs that make up the Security*)
    f_CollateralRequest_InstrmtLegGrp : fix_rg_instrmtleggrp;
    (** Number of legs that make up the Security*)
    f_CollateralRequest_UndInstrmtCollGrp : fix_rg_undinstrmtcollgrp;
    f_CollateralRequest_MarginExcess : fix_float_6 option;
    f_CollateralRequest_TotalNetValue : fix_float_6 option;
    f_CollateralRequest_CashOutstanding : fix_float_6 option;
    (** Insert here the set of "TrdRegTimestamps" fields defined in "Common Components of Application Messages"*)
    f_CollateralRequest_TrdRegTimestamps : fix_rg_trdregtimestamps;
    f_CollateralRequest_Side : fix_side option;
    (** Required if any miscellaneous fees are reported. Indicates number of repeating entries
     ** Nested Repeating Group follows ***)
    f_CollateralRequest_MiscFeesGrp : fix_rg_miscfeesgrp;
    f_CollateralRequest_Price : fix_float_6 option;
    f_CollateralRequest_PriceType : fix_pricetype option;
    f_CollateralRequest_AccruedInterestAmt : fix_float_6 option;
    f_CollateralRequest_EndAccruedInterestAmt : fix_float_6 option;
    f_CollateralRequest_StartCash : fix_float_6 option;
    f_CollateralRequest_EndCash : fix_float_6 option;
    (** Insert here the set of "SpreadOrBenchmarkCurveData" fields defined in "Common Components of Application Messages"*)
    f_CollateralRequest_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    (** Insert here the set of "Stipulations" fields defined in "Common Components of Application Messages"*)
    f_CollateralRequest_Stipulations : fix_rg_stipulations;
    (** Trading Session in which trade occurred*)
    f_CollateralRequest_TradingSessionID : string option;
    (** Trading Session Subid in which trade occurred*)
    f_CollateralRequest_TradingSessionSubID : string option;
    f_CollateralRequest_SettlSessID : fix_settlsessid option;
    f_CollateralRequest_SettlSessSubID : string option;
    f_CollateralRequest_ClearingBusinessDate : fix_localmktdate option;
    f_CollateralRequest_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_CollateralRequest_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_CollateralRequest_EncodedText : string option
}
;;

(** Used to respond to a Collateral Assignment message*)
type full_fix_collateralresponse_data = {
    (** Unique identifer for the collateral response*)
    f_CollateralResponse_CollRespID : string;
    (** Collateral assignment to which this response refers*)
    f_CollateralResponse_CollAsgnID : string;
    (** Identifer of CollReqID to which the Collateral Assignment is in response*)
    f_CollateralResponse_CollReqID : string option;
    (** Reason collateral assignment is being requested*)
    f_CollateralResponse_CollAsgnReason : fix_collasgnreason;
    (** Collateral Transaction Type - not recommended because it causes confusion*)
    f_CollateralResponse_CollAsgnTransType : fix_collasgntranstype option;
    (** Collateral Assignment Response Type*)
    f_CollateralResponse_CollAsgnRespType : fix_collasgnresptype;
    (** Reason Colllateral Assignment was rejected*)
    f_CollateralResponse_CollAsgnRejectReason : fix_collasgnrejectreason option;
    f_CollateralResponse_TransactTime : fix_utctimestamp;
    f_CollateralResponse_Parties : fix_rg_parties;
    (** Customer Account*)
    f_CollateralResponse_Account : string option;
    (** Type of account associated with the order (Origin)*)
    f_CollateralResponse_AccountType : fix_accounttype option;
    (** Identifier fo order for which collateral is required*)
    f_CollateralResponse_ClOrdID : string option;
    (** Identifier fo order for which collateral is required*)
    f_CollateralResponse_OrderID : string option;
    (** Identifier fo order for which collateral is required*)
    f_CollateralResponse_SecondaryOrderID : string option;
    (** Identifier fo order for which collateral is required*)
    f_CollateralResponse_SecondaryClOrdID : string option;
    (** Executions for which collateral is required*)
    f_CollateralResponse_ExecCollGrp : fix_rg_execcollgrp;
    (** Trades for which collateral is required*)
    f_CollateralResponse_TrdCollGrp : fix_rg_trdcollgrp;
    (** Insert here the set of "Instrument" fields defined in "Common Components of Application Messages"*)
    f_CollateralResponse_Instrument : fix_instrument;
    (** Insert here the set of "FinancingDetails" fields defined in "Common Components of Application Messages"*)
    f_CollateralResponse_FinancingDetails : fix_financingdetails;
    f_CollateralResponse_SettlDate : fix_localmktdate option;
    f_CollateralResponse_Quantity : fix_float_6 option;
    f_CollateralResponse_QtyType : fix_qtytype option;
    f_CollateralResponse_Currency : fix_currency option;
    (** Number of legs that make up the Security*)
    f_CollateralResponse_InstrmtLegGrp : fix_rg_instrmtleggrp;
    (** Number of legs that make up the Security*)
    f_CollateralResponse_UndInstrmtCollGrp : fix_rg_undinstrmtcollgrp;
    f_CollateralResponse_MarginExcess : fix_float_6 option;
    f_CollateralResponse_TotalNetValue : fix_float_6 option;
    f_CollateralResponse_CashOutstanding : fix_float_6 option;
    (** Insert here the set of "TrdRegTimestamps" fields defined in "Common Components of Application Messages"*)
    f_CollateralResponse_TrdRegTimestamps : fix_rg_trdregtimestamps;
    f_CollateralResponse_Side : fix_side option;
    (** Required if any miscellaneous fees are reported. Indicates number of repeating entries
     ** Nested Repeating Group follows ***)
    f_CollateralResponse_MiscFeesGrp : fix_rg_miscfeesgrp;
    f_CollateralResponse_Price : fix_float_6 option;
    f_CollateralResponse_PriceType : fix_pricetype option;
    f_CollateralResponse_AccruedInterestAmt : fix_float_6 option;
    f_CollateralResponse_EndAccruedInterestAmt : fix_float_6 option;
    f_CollateralResponse_StartCash : fix_float_6 option;
    f_CollateralResponse_EndCash : fix_float_6 option;
    (** Insert here the set of "SpreadOrBenchmarkCurveData" fields defined in "Common Components of Application Messages"*)
    f_CollateralResponse_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    (** Insert here the set of "Stipulations" fields defined in "Common Components of Application Messages"*)
    f_CollateralResponse_Stipulations : fix_rg_stipulations;
    f_CollateralResponse_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_CollateralResponse_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_CollateralResponse_EncodedText : string option
}
;;

(** The Confirmation messages are used to provide individual trade level confirmations from the sell side to the buy side. In versions of FIX prior to version 4.4, this role was performed by the allocation message. Unlike the allocation message, the confirmation message operates at an allocation account (trade) level rather than block level, allowing for the affirmation or rejection of individual confirmations.
 This message is also used to report back, confirm or exception, the booking status of each allocation instance. When the buy-side, in response, "affirms" with the ConfirmationAck message, the trade is ready to settle.*)
type full_fix_confirmation_data = {
    (** Unique ID for this message*)
    f_Confirmation_ConfirmID : string;
    (** Mandatory if ConfirmTransType is Replace or Cancel*)
    f_Confirmation_ConfirmRefID : string option;
    (** Only used when this message is used to respond to a confirmation request (to which this ID refers)*)
    f_Confirmation_ConfirmReqID : string option;
    (** New, Cancel or Replace*)
    f_Confirmation_ConfirmTransType : fix_confirmtranstype;
    (** Denotes whether this message represents a confirmation or a trade status message*)
    f_Confirmation_ConfirmType : fix_confirmtype;
    (** Denotes whether or not this message represents copy confirmation (or status message)
     Absence of this field indicates message is not a drop copy.*)
    f_Confirmation_CopyMsgIndicator : bool option;
    (** Denotes whether this message represents the legally binding confirmation
     Absence of this field indicates message is not a legal confirm.*)
    f_Confirmation_LegalConfirm : fix_legalconfirm option;
    f_Confirmation_ConfirmStatus : fix_confirmstatus;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"
     Required for fixed income
     Also to be used in associated with ProcessCode for broker of credit (e.g. for directed brokerage trades)
     Also to be used to specify party-specific regulatory details (e.g. full legal name of contracting legal entity, registered address, regulatory status, any registration details)*)
    f_Confirmation_Parties : fix_rg_parties;
    (** Indicates number of orders to be combined for allocation. If order(s) were manually delivered set to 1 (one).Required when AllocNoOrdersType = 1*)
    f_Confirmation_OrdAllocGrp : fix_rg_ordallocgrp;
    (** Used to refer to an earlier Allocation Instruction.*)
    f_Confirmation_AllocID : string option;
    (** Used to refer to an earlier Allocation Instruction via its secondary identifier*)
    f_Confirmation_SecondaryAllocID : string option;
    (** Used to refer to an allocation account within an earlier Allocation Instruction.*)
    f_Confirmation_IndividualAllocID : string option;
    (** Represents the time this message was generated*)
    f_Confirmation_TransactTime : fix_utctimestamp;
    f_Confirmation_TradeDate : fix_localmktdate;
    (** Time of last execution being confirmed by this message*)
    f_Confirmation_TrdRegTimestamps : fix_rg_trdregtimestamps;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_Confirmation_Instrument : fix_instrument;
    (** Insert here the set of "InstrumentExtension" fields defined in "Common Components of Application Messages"*)
    f_Confirmation_InstrumentExtension : fix_instrumentextension;
    (** Insert here the set of "FinancingDetails" fields defined in "Common Components of Application Messages"*)
    f_Confirmation_FinancingDetails : fix_financingdetails;
    (** Indicates number of repeating entries.
     ** Nested Repeating Group follows ***)
    f_Confirmation_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    (** Indicates number of repeating entries.
     ** Nested Repeating Group follows ***)
    f_Confirmation_InstrmtLegGrp : fix_rg_instrmtleggrp;
    (** If traded on Yield, price must be calculated "to worst" and the <Yield> component block must specify how calculated, redemption date and price (if not par). If traded on Price, the <Yield> component block must specify how calculated - "Worst", and include redemptiondate and price (if not par).*)
    f_Confirmation_YieldData : fix_yielddata;
    (** The quantity being confirmed by this message (this is at a trade level, not block or order level)*)
    f_Confirmation_AllocQty : fix_float_6;
    f_Confirmation_QtyType : fix_qtytype option;
    f_Confirmation_Side : fix_side;
    f_Confirmation_Currency : fix_currency option;
    f_Confirmation_LastMkt : fix_exchange option;
    (** Indicates number of repeating entries.
     ** Nested Repeating Group follows ***)
    f_Confirmation_CpctyConfGrp : fix_rg_cpctyconfgrp;
    (** Account number for the trade being confirmed by this message*)
    f_Confirmation_AllocAccount : string;
    f_Confirmation_AllocAcctIDSource : int option;
    f_Confirmation_AllocAccountType : fix_allocaccounttype option;
    (** Gross price for the trade being confirmed
     Always expressed in percent-of-par for Fixed Income*)
    f_Confirmation_AvgPx : fix_float_6;
    (** Absence of this field indicates that default precision arranged by the broker/institution is to be used*)
    f_Confirmation_AvgPxPrecision : int option;
    (** Price type for the AvgPx field*)
    f_Confirmation_PriceType : fix_pricetype option;
    f_Confirmation_AvgParPx : fix_float_6 option;
    (** Insert here the set of "SpreadOrBenchmarkCurveData" fields defined in "Common Components of Application Messages"*)
    f_Confirmation_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    (** Reported price (may be different to AvgPx in the event of a marked-up or marked-down principal trade)*)
    f_Confirmation_ReportedPx : fix_float_6 option;
    f_Confirmation_Text : string option;
    f_Confirmation_EncodedTextLen : int option;
    f_Confirmation_EncodedText : string option;
    (** Used to identify whether the trade was a soft dollar trade, step in/out etc. Broker of credit, where relevant, can be specified using the Parties nested block above.*)
    f_Confirmation_ProcessCode : fix_processcode option;
    f_Confirmation_GrossTradeAmt : fix_float_6;
    f_Confirmation_NumDaysInterest : int option;
    (** Optional "next coupon date" for Fixed Income*)
    f_Confirmation_ExDate : fix_localmktdate option;
    f_Confirmation_AccruedInterestRate : fix_float_6 option;
    (** Required for Fixed Income products that trade with accrued interest*)
    f_Confirmation_AccruedInterestAmt : fix_float_6 option;
    (** Required for Fixed Income products that pay lump sum interest at maturity*)
    f_Confirmation_InterestAtMaturity : fix_float_6 option;
    (** For repurchase agreements the accrued interest on termination.*)
    f_Confirmation_EndAccruedInterestAmt : fix_float_6 option;
    (** For repurchase agreements the start (dirty) cash consideration*)
    f_Confirmation_StartCash : fix_float_6 option;
    (** For repurchase agreements the end (dirty) cash consideration*)
    f_Confirmation_EndCash : fix_float_6 option;
    f_Confirmation_Concession : fix_float_6 option;
    f_Confirmation_TotalTakedown : fix_float_6 option;
    f_Confirmation_NetMoney : fix_float_6;
    (** Net Money at maturity if Zero Coupon and maturity value is different from par value*)
    f_Confirmation_MaturityNetMoney : fix_float_6 option;
    f_Confirmation_SettlCurrAmt : fix_float_6 option;
    f_Confirmation_SettlCurrency : fix_currency option;
    f_Confirmation_SettlCurrFxRate : fix_float_6 option;
    f_Confirmation_SettlCurrFxRateCalc : fix_settlcurrfxratecalc option;
    f_Confirmation_SettlType : fix_settltype option;
    f_Confirmation_SettlDate : fix_localmktdate option;
    (** Insert here the set of "SettlInstructionsData" fields defined in "Common Components of Application Messages"
     Used to communicate settlement instructions for this Confirmation.*)
    f_Confirmation_SettlInstructionsData : fix_settlinstructionsdata;
    f_Confirmation_CommissionData : fix_commissiondata;
    (** Used to identify any commission shared with a third party (e.g. directed brokerage)*)
    f_Confirmation_SharedCommission : fix_float_6 option;
    f_Confirmation_Stipulations : fix_rg_stipulations;
    (** Required if any miscellaneous fees are reported. Indicates number of repeating entries. Repeating group.
     ** Nested Repeating Group follows ***)
    f_Confirmation_MiscFeesGrp : fix_rg_miscfeesgrp
}
;;

(** The Confirmation Ack (aka Affirmation) message is used to respond to a Confirmation message.*)
type full_fix_confirmationack_data = {
    f_ConfirmationAck_ConfirmID : string;
    f_ConfirmationAck_TradeDate : fix_localmktdate;
    (** Date/Time Allocation Instruction Ack generated*)
    f_ConfirmationAck_TransactTime : fix_utctimestamp;
    f_ConfirmationAck_AffirmStatus : fix_affirmstatus;
    (** Required for ConfirmStatus = 1 (rejected)*)
    f_ConfirmationAck_ConfirmRejReason : fix_confirmrejreason option;
    (** Denotes whether the financial details provided on the Confirmation were successfully matched.*)
    f_ConfirmationAck_MatchStatus : fix_matchstatus option;
    (** Can include explanation for AllocRejCode = 7 (other)*)
    f_ConfirmationAck_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_ConfirmationAck_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_ConfirmationAck_EncodedText : string option
}
;;

(** The Confirmation Request message is used to request a Confirmation message.*)
type full_fix_confirmationrequest_data = {
    (** Unique identifier for this message*)
    f_ConfirmationRequest_ConfirmReqID : string;
    (** Denotes whether this message is being used to request a confirmation or a trade status message*)
    f_ConfirmationRequest_ConfirmType : fix_confirmtype;
    (** Indicates number of orders to be combined for allocation. If order(s) were manually delivered set to 1 (one).Required when AllocNoOrdersType = 1*)
    f_ConfirmationRequest_OrdAllocGrp : fix_rg_ordallocgrp;
    (** Used to refer to an earlier Allocation Instruction.*)
    f_ConfirmationRequest_AllocID : string option;
    (** Used to refer to an earlier Allocation Instruction via its secondary identifier*)
    f_ConfirmationRequest_SecondaryAllocID : string option;
    (** Used to refer to an allocation account within an earlier Allocation Instruction.*)
    f_ConfirmationRequest_IndividualAllocID : string option;
    (** Represents the time this message was generated*)
    f_ConfirmationRequest_TransactTime : fix_utctimestamp;
    (** Account number for the trade being confirmed by this message*)
    f_ConfirmationRequest_AllocAccount : string option;
    f_ConfirmationRequest_AllocAcctIDSource : int option;
    f_ConfirmationRequest_AllocAccountType : fix_allocaccounttype option;
    f_ConfirmationRequest_Text : string option;
    f_ConfirmationRequest_EncodedTextLen : int option;
    f_ConfirmationRequest_EncodedText : string option
}
;;

(** Used to modify a cross order previously submitted using the New Order - Cross message. See Order Cancel Replace Request for details concerning message usage.*)
type full_fix_crossordercancelreplacerequest_data = {
    (** Unique identifier of most recent order as assigned by sell-side (broker, exchange, ECN).*)
    f_CrossOrderCancelReplaceRequest_OrderID : string option;
    (** CrossID for the replacement order*)
    f_CrossOrderCancelReplaceRequest_CrossID : string;
    (** Must match the CrossID of the previous cross order. Same order chaining mechanism as ClOrdID/OrigClOrdID with single order Cancel/Replace.*)
    f_CrossOrderCancelReplaceRequest_OrigCrossID : string;
    f_CrossOrderCancelReplaceRequest_CrossType : fix_crosstype;
    f_CrossOrderCancelReplaceRequest_CrossPrioritization : fix_crossprioritization;
    (** Must be 1 or 2*)
    f_CrossOrderCancelReplaceRequest_SideCrossOrdModGrp : fix_rg_sidecrossordmodgrp;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_CrossOrderCancelReplaceRequest_Instrument : fix_instrument;
    (** Number of underlyings*)
    f_CrossOrderCancelReplaceRequest_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    (** Number of Legs*)
    f_CrossOrderCancelReplaceRequest_InstrmtLegGrp : fix_rg_instrmtleggrp;
    f_CrossOrderCancelReplaceRequest_SettlType : fix_settltype option;
    (** Takes precedence over SettlType value and conditionally required/omitted for specific SettlType values.*)
    f_CrossOrderCancelReplaceRequest_SettlDate : fix_localmktdate option;
    f_CrossOrderCancelReplaceRequest_HandlInst : fix_handlinst option;
    (** Can contain multiple instructions, space delimited. If OrdType=P, exactly one of the following values (ExecInst = L, R, M, P, O, T, or W) must be specified.*)
    f_CrossOrderCancelReplaceRequest_ExecInst : fix_execinst option;
    f_CrossOrderCancelReplaceRequest_MinQty : fix_float_6 option;
    f_CrossOrderCancelReplaceRequest_MaxFloor : fix_float_6 option;
    f_CrossOrderCancelReplaceRequest_ExDestination : fix_exchange option;
    (** Specifies the number of repeating TradingSessionIDs*)
    f_CrossOrderCancelReplaceRequest_TrdgSesGrp : fix_rg_trdgsesgrp;
    (** Used to identify soft trades at order entry.*)
    f_CrossOrderCancelReplaceRequest_ProcessCode : fix_processcode option;
    (** Useful for verifying security identification*)
    f_CrossOrderCancelReplaceRequest_PrevClosePx : fix_float_6 option;
    (** Required for short sell orders*)
    f_CrossOrderCancelReplaceRequest_LocateReqd : fix_locatereqd option;
    (** Time this order request was initiated/released by the trader, trading system, or intermediary.*)
    f_CrossOrderCancelReplaceRequest_TransactTime : fix_utctimestamp;
    (** Insert here the set of "Stipulations" (repeating group of Fixed Income stipulations) fields defined in "Common Components of Application Messages"*)
    f_CrossOrderCancelReplaceRequest_Stipulations : fix_rg_stipulations;
    f_CrossOrderCancelReplaceRequest_OrdType : fix_ordtype;
    f_CrossOrderCancelReplaceRequest_PriceType : fix_pricetype option;
    (** Required for limit OrdTypes. For F/X orders, should be the "all-in" rate (spot rate adjusted for forward points). Can be used to specify a limit price for a pegged order, previously indicated, etc.*)
    f_CrossOrderCancelReplaceRequest_Price : fix_float_6 option;
    (** Required for OrdType = "Stop" or OrdType = "Stop limit".*)
    f_CrossOrderCancelReplaceRequest_StopPx : fix_float_6 option;
    (** Insert here the set of "SpreadOrBenchmarkCurveData" (Fixed Income spread or benchmark curve) fields defined in "Common Components of Application Messages"*)
    f_CrossOrderCancelReplaceRequest_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    (** Insert here the set of "YieldData" (yield-related) fields defined in "Common Components of Application Messages"*)
    f_CrossOrderCancelReplaceRequest_YieldData : fix_yielddata;
    f_CrossOrderCancelReplaceRequest_Currency : fix_currency option;
    f_CrossOrderCancelReplaceRequest_ComplianceID : string option;
    (** Required for Previously Indicated Orders (OrdType=E)*)
    f_CrossOrderCancelReplaceRequest_IOIID : string option;
    (** Required for Previously Quoted Orders (OrdType=D)*)
    f_CrossOrderCancelReplaceRequest_QuoteID : string option;
    (** Absence of this field indicates Day order*)
    f_CrossOrderCancelReplaceRequest_TimeInForce : fix_timeinforce option;
    (** Can specify the time at which the order should be considered valid*)
    f_CrossOrderCancelReplaceRequest_EffectiveTime : fix_utctimestamp option;
    (** Conditionally required if TimeInForce = GTD and ExpireTime is not specified.*)
    f_CrossOrderCancelReplaceRequest_ExpireDate : fix_localmktdate option;
    (** Conditionally required if TimeInForce = GTD and ExpireDate is not specified.*)
    f_CrossOrderCancelReplaceRequest_ExpireTime : fix_utctimestamp option;
    (** States whether executions are booked out or accumulated on a partially filled GT order*)
    f_CrossOrderCancelReplaceRequest_GTBookingInst : fix_gtbookinginst option;
    f_CrossOrderCancelReplaceRequest_MaxShow : fix_float_6 option;
    (** Insert here the set of "PegInstruction" fields defined in "Common Components of Application Messages"*)
    f_CrossOrderCancelReplaceRequest_PegInstructions : fix_peginstructions;
    (** Insert here the set of "DiscretionInstruction" fields defined in "Common Components of Application Messages"*)
    f_CrossOrderCancelReplaceRequest_DiscretionInstructions : fix_discretioninstructions;
    (** The target strategy of the order*)
    f_CrossOrderCancelReplaceRequest_TargetStrategy : fix_targetstrategy option;
    (** For further specification of the TargetStrategy*)
    f_CrossOrderCancelReplaceRequest_TargetStrategyParameters : string option;
    (** Mandatory for a TargetStrategy=Participate order and specifies the target particpation rate.
     For other order types optionally specifies a volume limit (i.e. do not be more than this percent of the market volume)*)
    f_CrossOrderCancelReplaceRequest_ParticipationRate : fix_float_6 option;
    (** For CIV - Optional*)
    f_CrossOrderCancelReplaceRequest_CancellationRights : fix_cancellationrights option;
    f_CrossOrderCancelReplaceRequest_MoneyLaunderingStatus : fix_moneylaunderingstatus option;
    (** Reference to Registration Instructions message for this Order.*)
    f_CrossOrderCancelReplaceRequest_RegistID : string option;
    (** Supplementary registration information for this Order*)
    f_CrossOrderCancelReplaceRequest_Designation : string option
}
;;

(** Used to fully cancel the remaining open quantity of a cross order.*)
type full_fix_crossordercancelrequest_data = {
    (** Unique identifier of most recent order as assigned by sell-side (broker, exchange, ECN).*)
    f_CrossOrderCancelRequest_OrderID : string option;
    (** CrossID for the replacement order*)
    f_CrossOrderCancelRequest_CrossID : string;
    (** Must match the CrossID of previous cross order. Same order chaining mechanism as ClOrdID/OrigClOrdID with single order Cancel/Replace.*)
    f_CrossOrderCancelRequest_OrigCrossID : string;
    f_CrossOrderCancelRequest_CrossType : fix_crosstype;
    f_CrossOrderCancelRequest_CrossPrioritization : fix_crossprioritization;
    (** Must be 1 or 2*)
    f_CrossOrderCancelRequest_SideCrossOrdCxlGrp : fix_rg_sidecrossordcxlgrp;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_CrossOrderCancelRequest_Instrument : fix_instrument;
    (** Number of underlyings*)
    f_CrossOrderCancelRequest_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    (** Number of Leg*)
    f_CrossOrderCancelRequest_InstrmtLegGrp : fix_rg_instrmtleggrp;
    (** Time this order request was initiated/released by the trader, trading system, or intermediary.*)
    f_CrossOrderCancelRequest_TransactTime : fix_utctimestamp
}
;;

(** The Derivative Security List message is used to return a list of securities that matches the criteria specified in a Derivative Security List Request.*)
type full_fix_derivativesecuritylist_data = {
    f_DerivativeSecurityList_SecurityReqID : string;
    (** Identifier for the Derivative Security List message*)
    f_DerivativeSecurityList_SecurityResponseID : string;
    (** Result of the Security Request identified by SecurityReqID*)
    f_DerivativeSecurityList_SecurityRequestResult : fix_securityrequestresult;
    (** Underlying security for which derivatives are being returned*)
    f_DerivativeSecurityList_UnderlyingInstrument : fix_underlyinginstrument;
    (** Used to indicate the total number of securities being returned for this request. Used in the event that message fragmentation is required.*)
    f_DerivativeSecurityList_TotNoRelatedSym : int option;
    (** Indicates whether this is the last fragment in a sequence of message fragments. Only required where message has been fragmented.*)
    f_DerivativeSecurityList_LastFragment : fix_lastfragment option;
    (** Specifies the number of repeating symbols (instruments) specified*)
    f_DerivativeSecurityList_RelSymDerivSecGrp : fix_rg_relsymderivsecgrp
}
;;

(** The Derivative Security List Request message is used to return a list of securities from the counterparty that match criteria provided on the request*)
type full_fix_derivativesecuritylistrequest_data = {
    f_DerivativeSecurityListRequest_SecurityReqID : string;
    f_DerivativeSecurityListRequest_SecurityListRequestType : fix_securitylistrequesttype;
    (** Specifies the underlying instrument*)
    f_DerivativeSecurityListRequest_UnderlyingInstrument : fix_underlyinginstrument;
    f_DerivativeSecurityListRequest_SecuritySubType : string option;
    f_DerivativeSecurityListRequest_Currency : fix_currency option;
    (** Comment, instructions, or other identifying information.*)
    f_DerivativeSecurityListRequest_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_DerivativeSecurityListRequest_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_DerivativeSecurityListRequest_EncodedText : string option;
    (** Optional Trading Session Identifier to specify a particular trading session for which you want to obtain a list of securities that are tradeable.*)
    f_DerivativeSecurityListRequest_TradingSessionID : string option;
    f_DerivativeSecurityListRequest_TradingSessionSubID : string option;
    (** Subscribe or unsubscribe for security status to security specified in request.*)
    f_DerivativeSecurityListRequest_SubscriptionRequestType : fix_subscriptionrequesttype option
}
;;

(** The Don’t Know Trade (DK) message notifies a trading partner that an electronically received execution has been rejected. This message can be thought of as an execution reject message.*)
type full_fix_dontknowtrade_data = {
    (** Broker Order ID as identified on problem execution*)
    f_DontKnowTrade_OrderID : string;
    f_DontKnowTrade_SecondaryOrderID : string option;
    (** Execution ID of problem execution*)
    f_DontKnowTrade_ExecID : string;
    f_DontKnowTrade_DKReason : fix_dkreason;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_DontKnowTrade_Instrument : fix_instrument;
    (** Number of underlyings*)
    f_DontKnowTrade_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    (** Number of Legs*)
    f_DontKnowTrade_InstrmtLegGrp : fix_rg_instrmtleggrp;
    f_DontKnowTrade_Side : fix_side;
    (** Insert here the set of "OrderQtyData" fields defined in "Common Components of Application Messages"*)
    f_DontKnowTrade_OrderQtyData : fix_orderqtydata;
    (** Required if specified on the ExecutionRpt*)
    f_DontKnowTrade_LastQty : fix_float_6 option;
    (** Required if specified on the ExecutionRpt*)
    f_DontKnowTrade_LastPx : fix_float_6 option;
    f_DontKnowTrade_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_DontKnowTrade_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_DontKnowTrade_EncodedText : string option
}
;;

(** The email message is similar to the format and purpose of the News message, however, it is intended for private use between two parties.*)
type full_fix_email_data = {
    (** Unique identifier for the email message thread*)
    f_Email_EmailThreadID : string;
    f_Email_EmailType : fix_emailtype;
    f_Email_OrigTime : fix_utctimestamp option;
    (** Specifies the Subject text*)
    f_Email_Subject : string;
    (** Must be set if EncodedSubject field is specified and must immediately precede it.*)
    f_Email_EncodedSubjectLen : int option;
    (** Encoded (non-ASCII characters) representation of the Subject field in the encoded format specified via the MessageEncoding field.*)
    f_Email_EncodedSubject : string option;
    (** Required if any RoutingType and RoutingIDs are specified. Indicates the number within repeating group.*)
    f_Email_RoutingGrp : fix_rg_routinggrp;
    (** Specifies the number of repeating symbols (instruments) specified*)
    f_Email_InstrmtGrp : fix_rg_instrmtgrp;
    (** Number of underlyings*)
    f_Email_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    (** Number of legs
     Identifies a Multi-leg Execution if present and non-zero.*)
    f_Email_InstrmtLegGrp : fix_rg_instrmtleggrp;
    f_Email_OrderID : string option;
    f_Email_ClOrdID : string option;
    (** Specifies the number of repeating lines of text specified*)
    f_Email_LinesOfTextGrp : fix_rg_linesoftextgrp;
    f_Email_RawDataLength : int option;
    f_Email_RawData : string option
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
    (** OrderID is required to be unique for each chain of orders.*)
    f_ExecutionReport_OrderID : string;
    (** Can be used to provide order id used by exchange or executing system.*)
    f_ExecutionReport_SecondaryOrderID : string option;
    f_ExecutionReport_SecondaryClOrdID : string option;
    f_ExecutionReport_SecondaryExecID : string option;
    (** Required for executions against electronically submitted orders which were assigned an ID by the institution or intermediary. Not required for orders manually entered by the broker or fund manager (for CIV orders).*)
    f_ExecutionReport_ClOrdID : string option;
    (** Conditionally required for response to an electronic Cancel or Cancel/Replace request (ExecType=PendingCancel, Replace, or Canceled). ClOrdID of the previous accepted order (NOT the initial order of the day) when canceling or replacing an order.*)
    f_ExecutionReport_OrigClOrdID : string option;
    f_ExecutionReport_ClOrdLinkID : string option;
    (** Required if responding to a QuoteResponse message. Echo back the Initiator’s value specified in the message.*)
    f_ExecutionReport_QuoteRespID : string option;
    (** Required if responding to and if provided on the Order Status Request message. Echo back the value provided by the requester.*)
    f_ExecutionReport_OrdStatusReqID : string option;
    (** Required if responding to a Order Mass Status Request. Echo back the value provided by the requester.*)
    f_ExecutionReport_MassStatusReqID : string option;
    (** Can be used when responding to an Order Mass Status Request to identify the total number of Execution Reports which will be returned.*)
    f_ExecutionReport_TotNumReports : int option;
    (** Can be used when responding to an Order Mass Status Request to indicate that this is the last Execution Reports which will be returned as a result of the request.*)
    f_ExecutionReport_LastRptRequested : bool option;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_ExecutionReport_Parties : fix_rg_parties;
    f_ExecutionReport_TradeOriginationDate : fix_localmktdate option;
    (** Number of ContraBrokers repeating group instances.*)
    f_ExecutionReport_ContraGrp : fix_rg_contragrp;
    (** Required for executions against orders which were submitted as part of a list.*)
    f_ExecutionReport_ListID : string option;
    (** CrossID for the replacement order*)
    f_ExecutionReport_CrossID : string option;
    (** Must match original cross order. Same order chaining mechanism as ClOrdID/OrigClOrdID with single order Cancel/Replace.*)
    f_ExecutionReport_OrigCrossID : string option;
    f_ExecutionReport_CrossType : fix_crosstype option;
    (** Unique identifier of execution message as assigned by sell-side (broker, exchange, ECN) (will be 0 (zero) forExecType=I (Order Status)).*)
    f_ExecutionReport_ExecID : string;
    (** Required for Trade Cancel and Trade Correct ExecType messages*)
    f_ExecutionReport_ExecRefID : string option;
    (** Describes the purpose of the execution report.*)
    f_ExecutionReport_ExecType : fix_exectype;
    (** Describes the current state of a CHAIN of orders, same scope as OrderQty, CumQty, LeavesQty, and AvgPx*)
    f_ExecutionReport_OrdStatus : fix_ordstatus;
    (** For optional use with OrdStatus = 0 (New)*)
    f_ExecutionReport_WorkingIndicator : fix_workingindicator option;
    (** For optional use with ExecType = 8 (Rejected)*)
    f_ExecutionReport_OrdRejReason : fix_ordrejreason option;
    (** Required for ExecType = D (Restated).*)
    f_ExecutionReport_ExecRestatementReason : fix_execrestatementreason option;
    (** Required for executions against electronically submitted orders which were assigned an account by the institution or intermediary*)
    f_ExecutionReport_Account : string option;
    f_ExecutionReport_AcctIDSource : fix_acctidsource option;
    (** Specifies type of account*)
    f_ExecutionReport_AccountType : fix_accounttype option;
    f_ExecutionReport_DayBookingInst : fix_daybookinginst option;
    f_ExecutionReport_BookingUnit : fix_bookingunit option;
    f_ExecutionReport_PreallocMethod : fix_preallocmethod option;
    f_ExecutionReport_SettlType : fix_settltype option;
    (** Takes precedence over SettlType value and conditionally required/omitted for specific SettlType values.*)
    f_ExecutionReport_SettlDate : fix_localmktdate option;
    f_ExecutionReport_CashMargin : fix_cashmargin option;
    f_ExecutionReport_ClearingFeeIndicator : fix_clearingfeeindicator option;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_ExecutionReport_Instrument : fix_instrument;
    (** Insert here the set of "FinancingDetails" (symbology) fields defined in "Common Components of Application Messages"*)
    f_ExecutionReport_FinancingDetails : fix_financingdetails;
    (** Number of underlyings*)
    f_ExecutionReport_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    f_ExecutionReport_Side : fix_side;
    (** Insert here the set of "Stipulations" (repeating group of Fixed Income stipulations) fields defined in "Common Components of Application Messages"*)
    f_ExecutionReport_Stipulations : fix_rg_stipulations;
    f_ExecutionReport_QtyType : fix_qtytype option;
    (** Insert here the set of "OrderQtyData" fields defined in "Common Components of Application Messages"
     **Note: OrderQty field is required for Single Instrument Orders unless rejecting or acknowledging an order for a CashOrderQty or PercentOrder.*)
    f_ExecutionReport_OrderQtyData : fix_orderqtydata;
    f_ExecutionReport_OrdType : fix_ordtype option;
    f_ExecutionReport_PriceType : fix_pricetype option;
    (** Required if specified on the order*)
    f_ExecutionReport_Price : fix_float_6 option;
    (** Required if specified on the order*)
    f_ExecutionReport_StopPx : fix_float_6 option;
    (** Insert here the set of "PegInstruction" fields defined in "Common Components of Application Messages"*)
    f_ExecutionReport_PegInstructions : fix_peginstructions;
    (** Insert here the set of "DiscretionInstruction" fields defined in "Common Components of Application Messages"*)
    f_ExecutionReport_DiscretionInstructions : fix_discretioninstructions;
    (** The current price the order is pegged at*)
    f_ExecutionReport_PeggedPrice : fix_float_6 option;
    (** The current discretionary price of the order*)
    f_ExecutionReport_DiscretionPrice : fix_float_6 option;
    (** The target strategy of the order*)
    f_ExecutionReport_TargetStrategy : fix_targetstrategy option;
    (** For further specification of the TargetStrategy*)
    f_ExecutionReport_TargetStrategyParameters : string option;
    (** Mandatory for a TargetStrategy=Participate order and specifies the target particpation rate.
     For other order types optionally specifies a volume limit (i.e. do not be more than this percent of the market volume)*)
    f_ExecutionReport_ParticipationRate : fix_float_6 option;
    (** For communication of the performance of the order versus the target strategy*)
    f_ExecutionReport_TargetStrategyPerformance : fix_float_6 option;
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
    f_ExecutionReport_OrderCapacity : fix_ordercapacity option;
    f_ExecutionReport_OrderRestrictions : fix_orderrestrictions option;
    f_ExecutionReport_CustOrderCapacity : fix_custordercapacity option;
    (** Quantity (e.g. shares) bought/sold on this (last) fill. Required if ExecType = Trade or Trade Correct.
     If ExecType=Stopped, represents the quantity stopped/guaranteed/protected for.*)
    f_ExecutionReport_LastQty : fix_float_6 option;
    f_ExecutionReport_UnderlyingLastQty : fix_float_6 option;
    (** Price of this (last) fill. Required if ExecType = Trade or Trade Correct.
     Should represent the "all-in" (LastSpotRate + LastForwardPoints) rate for F/X orders. ).
     If ExecType=Stopped, represents the price stopped/guaranteed/protected at.*)
    f_ExecutionReport_LastPx : fix_float_6 option;
    f_ExecutionReport_UnderlyingLastPx : fix_float_6 option;
    (** Last price expressed in percent-of-par. Conditionally required for Fixed Income trades when LastPx is expressed in Yield, Spread, Discount or any other price type that is not percent-of-par.*)
    f_ExecutionReport_LastParPx : fix_float_6 option;
    (** Applicable for F/X orders*)
    f_ExecutionReport_LastSpotRate : fix_float_6 option;
    (** Applicable for F/X orders*)
    f_ExecutionReport_LastForwardPoints : fix_float_6 option;
    (** If ExecType = Trade (F), indicates the market where the trade was executed. If ExecType = New (0), indicates the market where the order was routed.*)
    f_ExecutionReport_LastMkt : fix_exchange option;
    f_ExecutionReport_TradingSessionID : string option;
    f_ExecutionReport_TradingSessionSubID : string option;
    f_ExecutionReport_TimeBracket : string option;
    f_ExecutionReport_LastCapacity : fix_lastcapacity option;
    (** Quantity open for further execution. If the OrdStatus is Canceled, DoneForTheDay, Expired, Calculated, or Rejected (in which case the order is no longer active) then LeavesQty could be 0, otherwise LeavesQty = OrderQty - CumQty.*)
    f_ExecutionReport_LeavesQty : fix_float_6;
    (** Currently executed quantity for chain of orders.*)
    f_ExecutionReport_CumQty : fix_float_6;
    f_ExecutionReport_AvgPx : fix_float_6;
    (** For GT orders on days following the day of the first trade.*)
    f_ExecutionReport_DayOrderQty : fix_float_6 option;
    (** For GT orders on days following the day of the first trade.*)
    f_ExecutionReport_DayCumQty : fix_float_6 option;
    (** For GT orders on days following the day of the first trade.*)
    f_ExecutionReport_DayAvgPx : fix_float_6 option;
    (** States whether executions are booked out or accumulated on a partially filled GT order*)
    f_ExecutionReport_GTBookingInst : fix_gtbookinginst option;
    (** Used when reporting other than current day trades.*)
    f_ExecutionReport_TradeDate : fix_localmktdate option;
    (** Time the transaction represented by this ExecutionReport occurred*)
    f_ExecutionReport_TransactTime : fix_utctimestamp option;
    f_ExecutionReport_ReportToExch : fix_reporttoexch option;
    (** Insert here the set of "CommissionData" fields defined in "Common Components of Application Messages"
     Note: On a fill/partial fill messages, it represents value for that fill/partial fill. On ExecType=Calculated, it represents cumulative value for the order. Monetary commission values are expressed in the currency reflected by the Currency field.*)
    f_ExecutionReport_CommissionData : fix_commissiondata;
    (** Insert here the set of "SpreadOrBenchmarkCurveData" (Fixed Income spread or benchmark curve) fields defined in "Common Components of Application Messages"*)
    f_ExecutionReport_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    (** Insert here the set of "YieldData" (yield-related) fields defined in "Common Components of Application Messages"*)
    f_ExecutionReport_YieldData : fix_yielddata;
    f_ExecutionReport_GrossTradeAmt : fix_float_6 option;
    f_ExecutionReport_NumDaysInterest : int option;
    f_ExecutionReport_ExDate : fix_localmktdate option;
    f_ExecutionReport_AccruedInterestRate : fix_float_6 option;
    f_ExecutionReport_AccruedInterestAmt : fix_float_6 option;
    (** For fixed income products which pay lump-sum interest at maturity.*)
    f_ExecutionReport_InterestAtMaturity : fix_float_6 option;
    (** For repurchase agreements the accrued interest on termination.*)
    f_ExecutionReport_EndAccruedInterestAmt : fix_float_6 option;
    (** For repurchase agreements the start (dirty) cash consideration*)
    f_ExecutionReport_StartCash : fix_float_6 option;
    (** For repurchase agreements the end (dirty) cash consideration*)
    f_ExecutionReport_EndCash : fix_float_6 option;
    f_ExecutionReport_TradedFlatSwitch : fix_tradedflatswitch option;
    f_ExecutionReport_BasisFeatureDate : fix_localmktdate option;
    f_ExecutionReport_BasisFeaturePrice : fix_float_6 option;
    f_ExecutionReport_Concession : fix_float_6 option;
    f_ExecutionReport_TotalTakedown : fix_float_6 option;
    (** Note: On a fill/partial fill messages, it represents value for that fill/partial fill, on ExecType=Calculated, it represents cumulative value for the order. Value expressed in the currency reflected by the Currency field.*)
    f_ExecutionReport_NetMoney : fix_float_6 option;
    (** Used to report results of forex accommodation trade*)
    f_ExecutionReport_SettlCurrAmt : fix_float_6 option;
    (** Used to report results of forex accommodation trade*)
    f_ExecutionReport_SettlCurrency : fix_currency option;
    (** Foreign exchange rate used to compute SettlCurrAmt from Currency to SettlCurrency*)
    f_ExecutionReport_SettlCurrFxRate : fix_float_6 option;
    (** Specifies whether the SettlCurrFxRate should be multiplied or divided*)
    f_ExecutionReport_SettlCurrFxRateCalc : fix_settlcurrfxratecalc option;
    f_ExecutionReport_HandlInst : fix_handlinst option;
    f_ExecutionReport_MinQty : fix_float_6 option;
    f_ExecutionReport_MaxFloor : fix_float_6 option;
    (** For use in derivatives omnibus accounting*)
    f_ExecutionReport_PositionEffect : fix_positioneffect option;
    f_ExecutionReport_MaxShow : fix_float_6 option;
    (** Method for booking out this order. Used when notifying a broker that an order to be settled by that broker is to be booked out as an OTC derivative (e.g. CFD or similar). Absence of this field implies regular booking.*)
    f_ExecutionReport_BookingType : fix_bookingtype option;
    f_ExecutionReport_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_ExecutionReport_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_ExecutionReport_EncodedText : string option;
    (** Can be used with OrdType = "Forex - Swap" to specify the "value date" for the future portion of a F/X swap.*)
    f_ExecutionReport_SettlDate2 : fix_localmktdate option;
    (** Can be used with OrdType = "Forex - Swap" to specify the order quantity for the future portion of a F/X swap.*)
    f_ExecutionReport_OrderQty2 : fix_float_6 option;
    (** Can be used with OrdType = "Forex - Swap" to specify the forward points (added to LastSpotRate) for the future portion of a F/X swap.*)
    f_ExecutionReport_LastForwardPoints2 : fix_float_6 option;
    (** Default is a single security if not specified.*)
    f_ExecutionReport_MultiLegReportingType : fix_multilegreportingtype option;
    (** For CIV - Optional*)
    f_ExecutionReport_CancellationRights : fix_cancellationrights option;
    f_ExecutionReport_MoneyLaunderingStatus : fix_moneylaunderingstatus option;
    (** Reference to Registration Instructions message for this Order.*)
    f_ExecutionReport_RegistID : string option;
    (** Supplementary registration information for this Order*)
    f_ExecutionReport_Designation : string option;
    (** For CIV - Optional*)
    f_ExecutionReport_TransBkdTime : fix_utctimestamp option;
    (** For CIV - Optional*)
    f_ExecutionReport_ExecValuationPoint : fix_utctimestamp option;
    (** For CIV - Optional*)
    f_ExecutionReport_ExecPriceType : fix_execpricetype option;
    (** For CIV - Optional*)
    f_ExecutionReport_ExecPriceAdjustment : fix_float_6 option;
    f_ExecutionReport_PriorityIndicator : fix_priorityindicator option;
    f_ExecutionReport_PriceImprovement : fix_float_6 option;
    (** Applicable only on OrdStatus of Partial or Filled.*)
    f_ExecutionReport_LastLiquidityInd : fix_lastliquidityind option;
    (** Number of contract details in this message (number of repeating groups to follow)*)
    f_ExecutionReport_ContAmtGrp : fix_rg_contamtgrp;
    (** Number of legs
     Identifies a Multi-leg Execution if present and non-zero.*)
    f_ExecutionReport_InstrmtLegExecGrp : fix_rg_instrmtlegexecgrp;
    f_ExecutionReport_CopyMsgIndicator : bool option;
    (** Required if any miscellaneous fees are reported. Indicates number of repeating entries. Repeating group.
     ** Nested Repeating Group follows ***)
    f_ExecutionReport_MiscFeesGrp : fix_rg_miscfeesgrp
}
;;

(** Indication of interest messages are used to market merchandise which the broker is buying or selling in either a proprietary or agency capacity.*)
type full_fix_ioi_data = {
    f_IOI_IOIID : string;
    f_IOI_IOITransType : fix_ioitranstype;
    (** Required for Cancel and Replace IOITransType messages*)
    f_IOI_IOIRefID : string option;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_IOI_Instrument : fix_instrument;
    (** Insert here the set of "FinancingDetails" (symbology) fields defined in "Common Components of Application Messages"*)
    f_IOI_FinancingDetails : fix_financingdetails;
    (** Number of underlyings*)
    f_IOI_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    (** Side of Indication
     Valid values:
     1 = Buy
     2 = Sell
     7 = Undisclosed (for IOIs)
     B = As Defined (for multilegs)
     C = Opposite (for multilegs)*)
    f_IOI_Side : fix_side;
    f_IOI_QtyType : fix_qtytype option;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"
     The value zero is used if NoLegs repeating group is used
     Applicable if needed to express CashOrder Qty (tag 152)*)
    f_IOI_OrderQtyData : fix_orderqtydata;
    (** The value zero is used if NoLegs repeating group is used*)
    f_IOI_IOIQty : fix_ioiqty;
    f_IOI_Currency : fix_currency option;
    (** Insert here the set of "Stipulations" (symbology) fields defined in "Common Components of Application Messages"*)
    f_IOI_Stipulations : fix_rg_stipulations;
    (** Required for multileg IOIs*)
    f_IOI_InstrmtLegIOIGrp : fix_rg_instrmtlegioigrp;
    f_IOI_PriceType : fix_pricetype option;
    f_IOI_Price : fix_float_6 option;
    f_IOI_ValidUntilTime : fix_utctimestamp option;
    f_IOI_IOIQltyInd : fix_ioiqltyind option;
    f_IOI_IOINaturalFlag : fix_ioinaturalflag option;
    (** Required if any IOIQualifiers are specified. Indicates the number of repeating IOIQualifiers.*)
    f_IOI_IOIQualGrp : fix_rg_ioiqualgrp;
    f_IOI_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_IOI_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_IOI_EncodedText : string option;
    f_IOI_TransactTime : fix_utctimestamp option;
    (** A URL (Uniform Resource Locator) link to additional information (i.e. http://www.XYZ.com/research.html)*)
    f_IOI_URLLink : string option;
    (** Required if any RoutingType and RoutingIDs are specified. Indicates the number within repeating group.*)
    f_IOI_RoutingGrp : fix_rg_routinggrp;
    (** Insert here the set of "SpreadOrBenchmarkCurveData" (Fixed Income spread or benchmark curve) fields defined in "Common Components of Application Messages"*)
    f_IOI_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    f_IOI_YieldData : fix_yielddata
}
;;

(** The List Cancel Request message type is used by institutions wishing to cancel previously submitted lists either before or during execution.*)
type full_fix_listcancelrequest_data = {
    f_ListCancelRequest_ListID : string;
    (** Time this order request was initiated/released by the trader or trading system.*)
    f_ListCancelRequest_TransactTime : fix_utctimestamp;
    f_ListCancelRequest_TradeOriginationDate : fix_localmktdate option;
    f_ListCancelRequest_TradeDate : fix_localmktdate option;
    f_ListCancelRequest_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_ListCancelRequest_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_ListCancelRequest_EncodedText : string option
}
;;

(** The List Execute message type is used by institutions to instruct the broker to begin execution of a previously submitted list. This message may or may not be used, as it may be mirroring a phone conversation.*)
type full_fix_listexecute_data = {
    (** Must be unique, by customer, for the day*)
    f_ListExecute_ListID : string;
    (** Used with BidType=Disclosed to provide the sell side the ability to determine the direction of the trade to execute.*)
    f_ListExecute_ClientBidID : string option;
    f_ListExecute_BidID : string option;
    (** Time this order request was initiated/released by the trader or trading system.*)
    f_ListExecute_TransactTime : fix_utctimestamp;
    f_ListExecute_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_ListExecute_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_ListExecute_EncodedText : string option
}
;;

(** The list status message is issued as the response to a List Status Request message sent in an unsolicited fashion by the sell-side. It indicates the current state of the orders within the list as they exist at the broker's site. This message may also be used to respond to the List Cancel Request.*)
type full_fix_liststatus_data = {
    f_ListStatus_ListID : string;
    f_ListStatus_ListStatusType : fix_liststatustype;
    (** Total number of messages required to status complete list.*)
    f_ListStatus_NoRpts : int;
    f_ListStatus_ListOrderStatus : fix_listorderstatus;
    (** Sequence number of this report message.*)
    f_ListStatus_RptSeq : int;
    f_ListStatus_ListStatusText : string option;
    (** Must be set if EncodedListStatusText field is specified and must immediately precede it.*)
    f_ListStatus_EncodedListStatusTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the ListStatusText field in the encoded format specified via the MessageEncoding field.*)
    f_ListStatus_EncodedListStatusText : string option;
    f_ListStatus_TransactTime : fix_utctimestamp option;
    (** Used to support fragmentation. Sum of NoOrders across all messages with the same ListID.*)
    f_ListStatus_TotNoOrders : int;
    (** Indicates whether this is the last fragment in a sequence of message fragments. Only required where message has been fragmented.*)
    f_ListStatus_LastFragment : fix_lastfragment option;
    (** Number of orders statused in this message, i.e. number of repeating groups to follow.*)
    f_ListStatus_OrdListStatGrp : fix_rg_ordliststatgrp
}
;;

(** The list status request message type is used by institutions to instruct the broker to generate status messages for a list.*)
type full_fix_liststatusrequest_data = {
    f_ListStatusRequest_ListID : string;
    f_ListStatusRequest_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_ListStatusRequest_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_ListStatusRequest_EncodedText : string option
}
;;

(** The strike price message is used to exchange strike price information for principal trades. It can also be used to exchange reference prices for agency trades.*)
type full_fix_liststrikeprice_data = {
    f_ListStrikePrice_ListID : string;
    (** Used to support fragmentation. Sum of NoStrikes across all messages with the same ListID.*)
    f_ListStrikePrice_TotNoStrikes : int;
    (** Indicates whether this is the last fragment in a sequence of message fragments. Only required where message has been fragmented.*)
    f_ListStrikePrice_LastFragment : fix_lastfragment option;
    (** Number of strike price entries*)
    f_ListStrikePrice_InstrmtStrkPxGrp : fix_rg_instrmtstrkpxgrp;
    (** Number of underlyings*)
    f_ListStrikePrice_UndInstrmtStrkPxGrp : fix_rg_undinstrmtstrkpxgrp
}
;;

(** The second Market Data message format is used for incremental updates.*)
type full_fix_marketdataincrementalrefresh_data = {
    (** Conditionally required if this message is in response to a Market Data Request.*)
    f_MarketDataIncrementalRefresh_MDReqID : string option;
    (** Number of entries following.*)
    f_MarketDataIncrementalRefresh_MDIncGrp : fix_rg_mdincgrp;
    (** Depth of application messages queued for transmission as of delivery of this message*)
    f_MarketDataIncrementalRefresh_ApplQueueDepth : int option;
    (** Action taken to resolve application queuing*)
    f_MarketDataIncrementalRefresh_ApplQueueResolution : fix_applqueueresolution option
}
;;

(** Some systems allow the transmission of real-time quote, order, trade, trade volume, open interest, and/or other price information on a subscription basis. A Market Data Request is a general request for market data on specific securities or forex quotes.*)
type full_fix_marketdatarequest_data = {
    (** Must be unique, or the ID of previous Market Data Request to disable if SubscriptionRequestType = Disable previous Snapshot + Updates Request (2).*)
    f_MarketDataRequest_MDReqID : string;
    (** SubcriptionRequestType indicates to the other party what type of response is expected. A snapshot request only asks for current information. A subscribe request asks for updates as the status changes. Unsubscribe will cancel any future update messages from the counter party.*)
    f_MarketDataRequest_SubscriptionRequestType : fix_subscriptionrequesttype;
    f_MarketDataRequest_MarketDepth : int;
    (** Required if SubscriptionRequestType = Snapshot + Updates (1).*)
    f_MarketDataRequest_MDUpdateType : fix_mdupdatetype option;
    f_MarketDataRequest_AggregatedBook : fix_aggregatedbook option;
    (** Can be used to clarify a request if MDEntryType = Opening Price(4), Closing Price(5), or Settlement Price(6).*)
    f_MarketDataRequest_OpenCloseSettlFlag : fix_openclosesettlflag option;
    (** Defines the scope(s) of the request*)
    f_MarketDataRequest_Scope : fix_scope option;
    (** Can be used when MarketDepth >= 2 and MDUpdateType = Incremental Refresh(1).*)
    f_MarketDataRequest_MDImplicitDelete : fix_mdimplicitdelete option;
    (** Number of MDEntryType fields requested.*)
    f_MarketDataRequest_MDReqGrp : fix_rg_mdreqgrp;
    (** Number of symbols (instruments) requested.*)
    f_MarketDataRequest_InstrmtMDReqGrp : fix_rg_instrmtmdreqgrp;
    (** Number of trading sessions for which the request is valid.*)
    f_MarketDataRequest_TrdgSesGrp : fix_rg_trdgsesgrp;
    (** Action to take if application level queuing exists*)
    f_MarketDataRequest_ApplQueueAction : fix_applqueueaction option;
    (** Maximum application queue depth that must be exceeded before queuing action is taken.*)
    f_MarketDataRequest_ApplQueueMax : int option
}
;;

(** The Market Data Request Reject is used when the broker cannot honor the Market Data Request, due to business or technical reasons.*)
type full_fix_marketdatarequestreject_data = {
    (** Must refer to the MDReqID of the request.*)
    f_MarketDataRequestReject_MDReqID : string;
    f_MarketDataRequestReject_MDReqRejReason : fix_mdreqrejreason option;
    f_MarketDataRequestReject_MDRjctGrp : fix_rg_mdrjctgrp;
    f_MarketDataRequestReject_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_MarketDataRequestReject_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_MarketDataRequestReject_EncodedText : string option
}
;;

(** The Market Data messages are used as the response to a Market Data Request message.*)
type full_fix_marketdatasnapshotfullrefresh_data = {
    (** Conditionally required if this message is in response to a Market Data Request.*)
    f_MarketDataSnapshotFullRefresh_MDReqID : string option;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_MarketDataSnapshotFullRefresh_Instrument : fix_instrument;
    (** Number of underlyings*)
    f_MarketDataSnapshotFullRefresh_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    (** Required for multileg quotes*)
    f_MarketDataSnapshotFullRefresh_InstrmtLegGrp : fix_rg_instrmtleggrp;
    f_MarketDataSnapshotFullRefresh_FinancialStatus : fix_financialstatus option;
    f_MarketDataSnapshotFullRefresh_CorporateAction : fix_corporateaction option;
    f_MarketDataSnapshotFullRefresh_NetChgPrevDay : fix_float_6 option;
    (** Number of entries following.*)
    f_MarketDataSnapshotFullRefresh_MDFullGrp : fix_rg_mdfullgrp;
    (** Depth of application messages queued for transmission as of delivery of this message*)
    f_MarketDataSnapshotFullRefresh_ApplQueueDepth : int option;
    (** Action taken to resolve application queuing*)
    f_MarketDataSnapshotFullRefresh_ApplQueueResolution : fix_applqueueresolution option
}
;;

(** The Mass Quote message can contain quotes for multiple securities to support applications that allow for the mass quoting of an option series.*)
type full_fix_massquote_data = {
    (** Required when quote is in response to a Quote Request message*)
    f_MassQuote_QuoteReqID : string option;
    f_MassQuote_QuoteID : string;
    (** Type of Quote
     Default is Indicative if not specified*)
    f_MassQuote_QuoteType : fix_quotetype option;
    (** Level of Response requested from receiver of quote messages.*)
    f_MassQuote_QuoteResponseLevel : fix_quoteresponselevel option;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_MassQuote_Parties : fix_rg_parties;
    f_MassQuote_Account : string option;
    f_MassQuote_AcctIDSource : fix_acctidsource option;
    (** Type of account associated with the order (Origin)*)
    f_MassQuote_AccountType : fix_accounttype option;
    (** Default Bid Size for quote contained within this quote message - if not explicitly provided.*)
    f_MassQuote_DefBidSize : fix_float_6 option;
    (** Default Offer Size for quotes contained within this quote message - if not explicitly provided.*)
    f_MassQuote_DefOfferSize : fix_float_6 option;
    (** The number of sets of quotes in the message*)
    f_MassQuote_QuotSetGrp : fix_rg_quotsetgrp
}
;;

(** Mass Quote Acknowledgement is used as the application level response to a Mass Quote message.*)
type full_fix_massquoteacknowledgement_data = {
    (** Required when acknowledgment is in response to a Quote Request message*)
    f_MassQuoteAcknowledgement_QuoteReqID : string option;
    (** Required when acknowledgment is in response to a Quote message*)
    f_MassQuoteAcknowledgement_QuoteID : string option;
    (** Status of the mass quote acknowledgement.*)
    f_MassQuoteAcknowledgement_QuoteStatus : fix_quotestatus;
    (** Reason Quote was rejected.*)
    f_MassQuoteAcknowledgement_QuoteRejectReason : fix_quoterejectreason option;
    (** Level of Response requested from receiver of quote messages. Is echoed back to the counterparty.*)
    f_MassQuoteAcknowledgement_QuoteResponseLevel : fix_quoteresponselevel option;
    (** Type of Quote*)
    f_MassQuoteAcknowledgement_QuoteType : fix_quotetype option;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_MassQuoteAcknowledgement_Parties : fix_rg_parties;
    f_MassQuoteAcknowledgement_Account : string option;
    f_MassQuoteAcknowledgement_AcctIDSource : fix_acctidsource option;
    (** Type of account associated with the order (Origin)*)
    f_MassQuoteAcknowledgement_AccountType : fix_accounttype option;
    f_MassQuoteAcknowledgement_Text : string option;
    f_MassQuoteAcknowledgement_EncodedTextLen : int option;
    f_MassQuoteAcknowledgement_EncodedText : string option;
    (** The number of sets of quotes in the message*)
    f_MassQuoteAcknowledgement_QuotSetAckGrp : fix_rg_quotsetackgrp
}
;;

(** Used to modify a multileg order previously submitted using the New Order - Multileg message. See Order Cancel Replace Request for details concerning message usage.*)
type full_fix_multilegordercancelreplace_data = {
    (** Unique identifier of most recent order as assigned by sell-side (broker, exchange, ECN).*)
    f_MultilegOrderCancelReplace_OrderID : string option;
    (** ClOrdID of the previous order (NOT the initial order of the day) when canceling or replacing an order.*)
    f_MultilegOrderCancelReplace_OrigClOrdID : string;
    (** Unique identifier of replacement order as assigned by institution or by the intermediary with closest association with the investor.. Note that this identifier will be used in ClOrdID field of the Cancel Reject message if the replacement request is rejected.*)
    f_MultilegOrderCancelReplace_ClOrdID : string;
    f_MultilegOrderCancelReplace_SecondaryClOrdID : string option;
    f_MultilegOrderCancelReplace_ClOrdLinkID : string option;
    f_MultilegOrderCancelReplace_OrigOrdModTime : fix_utctimestamp option;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_MultilegOrderCancelReplace_Parties : fix_rg_parties;
    f_MultilegOrderCancelReplace_TradeOriginationDate : fix_localmktdate option;
    f_MultilegOrderCancelReplace_TradeDate : fix_localmktdate option;
    f_MultilegOrderCancelReplace_Account : string option;
    f_MultilegOrderCancelReplace_AcctIDSource : fix_acctidsource option;
    f_MultilegOrderCancelReplace_AccountType : fix_accounttype option;
    f_MultilegOrderCancelReplace_DayBookingInst : fix_daybookinginst option;
    f_MultilegOrderCancelReplace_BookingUnit : fix_bookingunit option;
    f_MultilegOrderCancelReplace_PreallocMethod : fix_preallocmethod option;
    (** Used to assign an identifier to the block of individual preallocations*)
    f_MultilegOrderCancelReplace_AllocID : string option;
    (** Number of repeating groups for pre-trade allocation*)
    f_MultilegOrderCancelReplace_PreAllocMlegGrp : fix_rg_preallocmleggrp;
    f_MultilegOrderCancelReplace_SettlType : fix_settltype option;
    (** Takes precedence over SettlType value and conditionally required/omitted for specific SettlType values.*)
    f_MultilegOrderCancelReplace_SettlDate : fix_localmktdate option;
    f_MultilegOrderCancelReplace_CashMargin : fix_cashmargin option;
    f_MultilegOrderCancelReplace_ClearingFeeIndicator : fix_clearingfeeindicator option;
    f_MultilegOrderCancelReplace_HandlInst : fix_handlinst option;
    (** Can contain multiple instructions, space delimited. If OrdType=P, exactly one of the following values (ExecInst = L, R, M, P, O, T, or W) must be specified.*)
    f_MultilegOrderCancelReplace_ExecInst : fix_execinst option;
    f_MultilegOrderCancelReplace_MinQty : fix_float_6 option;
    f_MultilegOrderCancelReplace_MaxFloor : fix_float_6 option;
    f_MultilegOrderCancelReplace_ExDestination : fix_exchange option;
    (** Specifies the number of repeating TradingSessionIDs*)
    f_MultilegOrderCancelReplace_TrdgSesGrp : fix_rg_trdgsesgrp;
    (** Used to identify soft trades at order entry.*)
    f_MultilegOrderCancelReplace_ProcessCode : fix_processcode option;
    (** Additional enumeration that indicates this is an order for a multileg order and that the sides are specified in the Instrument Leg component block.*)
    f_MultilegOrderCancelReplace_Side : fix_side;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"
     SecurityType[167] = "MLEG"
     CFICode should be set to the type of multileg product, such as "O" - options, "F" - Future or Swap.*)
    f_MultilegOrderCancelReplace_Instrument : fix_instrument;
    (** Number of underlyings*)
    f_MultilegOrderCancelReplace_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    (** Useful for verifying security identification*)
    f_MultilegOrderCancelReplace_PrevClosePx : fix_float_6 option;
    (** Number of legs
     Can be zero (e.g. standardized multileg instrument such as an Option strategy) - must be provided even if zero*)
    f_MultilegOrderCancelReplace_LegOrdGrp : fix_rg_legordgrp;
    (** Required for short sell orders*)
    f_MultilegOrderCancelReplace_LocateReqd : fix_locatereqd option;
    (** Time this order request was initiated/released by the trader, trading system, or intermediary.*)
    f_MultilegOrderCancelReplace_TransactTime : fix_utctimestamp;
    f_MultilegOrderCancelReplace_QtyType : fix_qtytype option;
    (** Insert here the set of "OrderQtyData" fields defined in "Common Components of Application Messages"*)
    f_MultilegOrderCancelReplace_OrderQtyData : fix_orderqtydata;
    f_MultilegOrderCancelReplace_OrdType : fix_ordtype;
    f_MultilegOrderCancelReplace_PriceType : fix_pricetype option;
    (** Required for limit OrdTypes. For F/X orders, should be the "all-in" rate (spot rate adjusted for forward points). Can be used to specify a limit price for a pegged order, previously indicated, etc.*)
    f_MultilegOrderCancelReplace_Price : fix_float_6 option;
    (** Required for OrdType = "Stop" or OrdType = "Stop limit".*)
    f_MultilegOrderCancelReplace_StopPx : fix_float_6 option;
    f_MultilegOrderCancelReplace_Currency : fix_currency option;
    f_MultilegOrderCancelReplace_ComplianceID : string option;
    f_MultilegOrderCancelReplace_SolicitedFlag : fix_solicitedflag option;
    (** Required for Previously Indicated Orders (OrdType=E)*)
    f_MultilegOrderCancelReplace_IOIID : string option;
    (** Required for Previously Quoted Orders (OrdType=D)*)
    f_MultilegOrderCancelReplace_QuoteID : string option;
    (** Absence of this field indicates Day order*)
    f_MultilegOrderCancelReplace_TimeInForce : fix_timeinforce option;
    (** Can specify the time at which the order should be considered valid*)
    f_MultilegOrderCancelReplace_EffectiveTime : fix_utctimestamp option;
    (** Conditionally required if TimeInForce = GTD and ExpireTime is not specified.*)
    f_MultilegOrderCancelReplace_ExpireDate : fix_localmktdate option;
    (** Conditionally required if TimeInForce = GTD and ExpireDate is not specified.*)
    f_MultilegOrderCancelReplace_ExpireTime : fix_utctimestamp option;
    (** States whether executions are booked out or accumulated on a partially filled GT order*)
    f_MultilegOrderCancelReplace_GTBookingInst : fix_gtbookinginst option;
    (** Insert here the set of "CommissionData" fields defined in "Common Components of Application Messages"*)
    f_MultilegOrderCancelReplace_CommissionData : fix_commissiondata;
    f_MultilegOrderCancelReplace_OrderCapacity : fix_ordercapacity option;
    f_MultilegOrderCancelReplace_OrderRestrictions : fix_orderrestrictions option;
    f_MultilegOrderCancelReplace_CustOrderCapacity : fix_custordercapacity option;
    (** Indicates that broker is requested to execute a Forex accommodation trade in conjunction with the security trade.*)
    f_MultilegOrderCancelReplace_ForexReq : fix_forexreq option;
    (** Required if ForexReq = Y.*)
    f_MultilegOrderCancelReplace_SettlCurrency : fix_currency option;
    (** Method for booking out this order. Used when notifying a broker that an order to be settled by that broker is to be booked out as an OTC derivative (e.g. CFD or similar). Absence of this field implies regular booking.*)
    f_MultilegOrderCancelReplace_BookingType : fix_bookingtype option;
    f_MultilegOrderCancelReplace_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_MultilegOrderCancelReplace_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_MultilegOrderCancelReplace_EncodedText : string option;
    (** For use in derivatives omnibus accounting*)
    f_MultilegOrderCancelReplace_PositionEffect : fix_positioneffect option;
    (** For use with derivatives, such as options*)
    f_MultilegOrderCancelReplace_CoveredOrUncovered : fix_coveredoruncovered option;
    f_MultilegOrderCancelReplace_MaxShow : fix_float_6 option;
    (** Insert here the set of "PegInstruction" fields defined in "Common Components of Application Messages"*)
    f_MultilegOrderCancelReplace_PegInstructions : fix_peginstructions;
    (** Insert here the set of "DiscretionInstruction" fields defined in "Common Components of Application Messages"*)
    f_MultilegOrderCancelReplace_DiscretionInstructions : fix_discretioninstructions;
    (** The target strategy of the order*)
    f_MultilegOrderCancelReplace_TargetStrategy : fix_targetstrategy option;
    (** For further specification of the TargetStrategy*)
    f_MultilegOrderCancelReplace_TargetStrategyParameters : string option;
    (** Mandatory for a TargetStrategy=Participate order and specifies the target particpation rate.
     For other order types optionally specifies a volume limit (i.e. do not be more than this percent of the market volume)*)
    f_MultilegOrderCancelReplace_ParticipationRate : fix_float_6 option;
    (** For CIV - Optional*)
    f_MultilegOrderCancelReplace_CancellationRights : fix_cancellationrights option;
    f_MultilegOrderCancelReplace_MoneyLaunderingStatus : fix_moneylaunderingstatus option;
    (** Reference to Registration Instructions message for this Order.*)
    f_MultilegOrderCancelReplace_RegistID : string option;
    (** Supplementary registration information for this Order*)
    f_MultilegOrderCancelReplace_Designation : string option;
    (** Indicates the method of execution reporting requested by issuer of the order.*)
    f_MultilegOrderCancelReplace_MultiLegRptTypeReq : fix_multilegrpttypereq option
}
;;

type full_fix_networkcounterpartysystemstatusrequest_data = {
    f_NetworkCounterpartySystemStatusRequest_NetworkRequestType : fix_networkrequesttype;
    f_NetworkCounterpartySystemStatusRequest_NetworkRequestID : string;
    (** Used to restrict updates/request to a list of specific CompID/SubID/LocationID/DeskID combinations.
     If not present request applies to all applicable available counterparties. EG Unless one sell side broker was a customer of another you would not expect to see information about other brokers, similarly one fund manager etc.*)
    f_NetworkCounterpartySystemStatusRequest_CompIDReqGrp : fix_rg_compidreqgrp
}
;;

type full_fix_networkcounterpartysystemstatusresponse_data = {
    f_NetworkCounterpartySystemStatusResponse_NetworkStatusResponseType : fix_networkstatusresponsetype;
    f_NetworkCounterpartySystemStatusResponse_NetworkRequestID : string option;
    f_NetworkCounterpartySystemStatusResponse_NetworkResponseID : string;
    (** Required when NetworkStatusResponseType=2*)
    f_NetworkCounterpartySystemStatusResponse_LastNetworkResponseID : string option;
    (** Specifies the number of repeating CompId’s*)
    f_NetworkCounterpartySystemStatusResponse_CompIDStatGrp : fix_rg_compidstatgrp
}
;;

(** Used to submit a cross order into a market. The cross order contains two order sides (a buy and a sell).*)
type full_fix_newordercross_data = {
    f_NewOrderCross_CrossID : string;
    f_NewOrderCross_CrossType : fix_crosstype;
    f_NewOrderCross_CrossPrioritization : fix_crossprioritization;
    (** Must be 1 or 2
     1 or 2 if CrossType=1
     2 otherwise*)
    f_NewOrderCross_SideCrossOrdModGrp : fix_rg_sidecrossordmodgrp;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_NewOrderCross_Instrument : fix_instrument;
    (** Number of underlyings*)
    f_NewOrderCross_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    (** Number of Legs*)
    f_NewOrderCross_InstrmtLegGrp : fix_rg_instrmtleggrp;
    f_NewOrderCross_SettlType : fix_settltype option;
    (** Takes precedence over SettlType value and conditionally required/omitted for specific SettlType values.*)
    f_NewOrderCross_SettlDate : fix_localmktdate option;
    f_NewOrderCross_HandlInst : fix_handlinst option;
    (** Can contain multiple instructions, space delimited. If OrdType=P, exactly one of the following values (ExecInst = L, R, M, P, O, T, or W) must be specified.*)
    f_NewOrderCross_ExecInst : fix_execinst option;
    f_NewOrderCross_MinQty : fix_float_6 option;
    f_NewOrderCross_MaxFloor : fix_float_6 option;
    f_NewOrderCross_ExDestination : fix_exchange option;
    (** Specifies the number of repeating TradingSessionIDs*)
    f_NewOrderCross_TrdgSesGrp : fix_rg_trdgsesgrp;
    (** Used to identify soft trades at order entry.*)
    f_NewOrderCross_ProcessCode : fix_processcode option;
    (** Useful for verifying security identification*)
    f_NewOrderCross_PrevClosePx : fix_float_6 option;
    (** Required for short sell orders*)
    f_NewOrderCross_LocateReqd : fix_locatereqd option;
    (** Time this order request was initiated/released by the trader, trading system, or intermediary.*)
    f_NewOrderCross_TransactTime : fix_utctimestamp;
    (** Insert here the set of "Stipulations" (repeating group of Fixed Income stipulations) fields defined in "Common Components of Application Messages"*)
    f_NewOrderCross_Stipulations : fix_rg_stipulations;
    f_NewOrderCross_OrdType : fix_ordtype;
    f_NewOrderCross_PriceType : fix_pricetype option;
    (** Required for limit OrdTypes. For F/X orders, should be the "all-in" rate (spot rate adjusted for forward points). Can be used to specify a limit price for a pegged order, previously indicated, etc.*)
    f_NewOrderCross_Price : fix_float_6 option;
    (** Required for OrdType = "Stop" or OrdType = "Stop limit".*)
    f_NewOrderCross_StopPx : fix_float_6 option;
    (** Insert here the set of "SpreadOrBenchmarkCurveData" (Fixed Income spread or benchmark curve) fields defined in "Common Components of Application Messages"*)
    f_NewOrderCross_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    (** Insert here the set of "YieldData" (yield-related) fields defined in "Common Components of Application Messages"*)
    f_NewOrderCross_YieldData : fix_yielddata;
    f_NewOrderCross_Currency : fix_currency option;
    f_NewOrderCross_ComplianceID : string option;
    (** Required for Previously Indicated Orders (OrdType=E)*)
    f_NewOrderCross_IOIID : string option;
    (** Required for Previously Quoted Orders (OrdType=D)*)
    f_NewOrderCross_QuoteID : string option;
    (** Absence of this field indicates Day order*)
    f_NewOrderCross_TimeInForce : fix_timeinforce option;
    (** Can specify the time at which the order should be considered valid*)
    f_NewOrderCross_EffectiveTime : fix_utctimestamp option;
    (** Conditionally required if TimeInForce = GTD and ExpireTime is not specified.*)
    f_NewOrderCross_ExpireDate : fix_localmktdate option;
    (** Conditionally required if TimeInForce = GTD and ExpireDate is not specified.*)
    f_NewOrderCross_ExpireTime : fix_utctimestamp option;
    (** States whether executions are booked out or accumulated on a partially filled GT order*)
    f_NewOrderCross_GTBookingInst : fix_gtbookinginst option;
    f_NewOrderCross_MaxShow : fix_float_6 option;
    (** Insert here the set of "PegInstruction" fields defined in "Common Components of Application Messages"*)
    f_NewOrderCross_PegInstructions : fix_peginstructions;
    (** Insert here the set of "DiscretionInstruction" fields defined in "Common Components of Application Messages"*)
    f_NewOrderCross_DiscretionInstructions : fix_discretioninstructions;
    (** The target strategy of the order*)
    f_NewOrderCross_TargetStrategy : fix_targetstrategy option;
    (** For further specification of the TargetStrategy*)
    f_NewOrderCross_TargetStrategyParameters : string option;
    (** Mandatory for a TargetStrategy=Participate order and specifies the target particpation rate.
     For other order types optionally specifies a volume limit (i.e. do not be more than this percent of the market volume)*)
    f_NewOrderCross_ParticipationRate : fix_float_6 option;
    (** For CIV - Optional*)
    f_NewOrderCross_CancellationRights : fix_cancellationrights option;
    f_NewOrderCross_MoneyLaunderingStatus : fix_moneylaunderingstatus option;
    (** Reference to Registration Instructions message for this Order.*)
    f_NewOrderCross_RegistID : string option;
    (** Supplementary registration information for this Order*)
    f_NewOrderCross_Designation : string option
}
;;

(** The NewOrderList Message can be used in one of two ways depending on which market conventions are being followed.*)
type full_fix_neworderlist_data = {
    (** Must be unique, by customer, for the day*)
    f_NewOrderList_ListID : string;
    (** Should refer to an earlier program if bidding took place.*)
    f_NewOrderList_BidID : string option;
    f_NewOrderList_ClientBidID : string option;
    f_NewOrderList_ProgRptReqs : fix_progrptreqs option;
    (** e.g. Non Disclosed Model, Disclosed Model, No Bidding Process*)
    f_NewOrderList_BidType : fix_bidtype;
    f_NewOrderList_ProgPeriodInterval : int option;
    (** For CIV - Optional*)
    f_NewOrderList_CancellationRights : fix_cancellationrights option;
    f_NewOrderList_MoneyLaunderingStatus : fix_moneylaunderingstatus option;
    (** Reference to Registration Instructions message applicable to all Orders in this List.*)
    f_NewOrderList_RegistID : string option;
    (** Controls when execution should begin For CIV Orders indicates order of execution..*)
    f_NewOrderList_ListExecInstType : fix_listexecinsttype option;
    (** Free-form text.*)
    f_NewOrderList_ListExecInst : string option;
    (** Must be set if EncodedListExecInst field is specified and must immediately precede it.*)
    f_NewOrderList_EncodedListExecInstLen : int option;
    (** Encoded (non-ASCII characters) representation of the ListExecInst field in the encoded format specified via the MessageEncoding field.*)
    f_NewOrderList_EncodedListExecInst : string option;
    (** The maximum percentage that execution of one side of a program trade can exceed execution of the other.*)
    f_NewOrderList_AllowableOneSidednessPct : fix_float_6 option;
    (** The maximum amount that execution of one side of a program trade can exceed execution of the other.*)
    f_NewOrderList_AllowableOneSidednessValue : fix_float_6 option;
    (** The currency that AllowableOneSidedness is expressed in if AllowableOneSidednessValue is used.*)
    f_NewOrderList_AllowableOneSidednessCurr : fix_currency option;
    (** Used to support fragmentation. Sum of NoOrders across all messages with the same ListID.*)
    f_NewOrderList_TotNoOrders : int;
    (** Indicates whether this is the last fragment in a sequence of message fragments. Only required where message has been fragmented.*)
    f_NewOrderList_LastFragment : fix_lastfragment option;
    (** Number of orders in this message (number of repeating groups to follow)*)
    f_NewOrderList_ListOrdGrp : fix_rg_listordgrp
}
;;

(** The New Order - Multileg is provided to submit orders for securities that are made up of multiple securities, known as legs.*)
type full_fix_newordermultileg_data = {
    (** Unique identifier of the order as assigned by institution or by the intermediary with closest association with the investor.*)
    f_NewOrderMultileg_ClOrdID : string;
    f_NewOrderMultileg_SecondaryClOrdID : string option;
    f_NewOrderMultileg_ClOrdLinkID : string option;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_NewOrderMultileg_Parties : fix_rg_parties;
    f_NewOrderMultileg_TradeOriginationDate : fix_localmktdate option;
    f_NewOrderMultileg_TradeDate : fix_localmktdate option;
    f_NewOrderMultileg_Account : string option;
    f_NewOrderMultileg_AcctIDSource : fix_acctidsource option;
    f_NewOrderMultileg_AccountType : fix_accounttype option;
    f_NewOrderMultileg_DayBookingInst : fix_daybookinginst option;
    f_NewOrderMultileg_BookingUnit : fix_bookingunit option;
    f_NewOrderMultileg_PreallocMethod : fix_preallocmethod option;
    (** Used to assign an identifier to the block of individual preallocations*)
    f_NewOrderMultileg_AllocID : string option;
    (** Number of repeating groups for pre-trade allocation*)
    f_NewOrderMultileg_PreAllocMlegGrp : fix_rg_preallocmleggrp;
    f_NewOrderMultileg_SettlType : fix_settltype option;
    (** Takes precedence over SettlType value and conditionally required/omitted for specific SettlType values.*)
    f_NewOrderMultileg_SettlDate : fix_localmktdate option;
    f_NewOrderMultileg_CashMargin : fix_cashmargin option;
    f_NewOrderMultileg_ClearingFeeIndicator : fix_clearingfeeindicator option;
    f_NewOrderMultileg_HandlInst : fix_handlinst option;
    (** Can contain multiple instructions, space delimited. If OrdType=P, exactly one of the following values (ExecInst = L, R, M, P, O, T, or W) must be specified.*)
    f_NewOrderMultileg_ExecInst : fix_execinst option;
    f_NewOrderMultileg_MinQty : fix_float_6 option;
    f_NewOrderMultileg_MaxFloor : fix_float_6 option;
    f_NewOrderMultileg_ExDestination : fix_exchange option;
    (** Specifies the number of repeating TradingSessionIDs*)
    f_NewOrderMultileg_TrdgSesGrp : fix_rg_trdgsesgrp;
    (** Used to identify soft trades at order entry.*)
    f_NewOrderMultileg_ProcessCode : fix_processcode option;
    (** Additional enumeration that indicates this is an order for a multileg order and that the sides are specified in the Instrument Leg component block.*)
    f_NewOrderMultileg_Side : fix_side;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"
     SecurityType[167] = "MLEG"
     CFICode should be set to the type of multileg product, such as "O" - options, "F" - Future or Swap.*)
    f_NewOrderMultileg_Instrument : fix_instrument;
    (** Number of underlyings*)
    f_NewOrderMultileg_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    (** Useful for verifying security identification*)
    f_NewOrderMultileg_PrevClosePx : fix_float_6 option;
    (** Number of legs
     Can be zero (e.g. standardized multileg instrument such as an Option strategy) - must be provided even if zero*)
    f_NewOrderMultileg_LegOrdGrp : fix_rg_legordgrp;
    (** Required for short sell orders*)
    f_NewOrderMultileg_LocateReqd : fix_locatereqd option;
    (** Time this order request was initiated/released by the trader, trading system, or intermediary.*)
    f_NewOrderMultileg_TransactTime : fix_utctimestamp;
    f_NewOrderMultileg_QtyType : fix_qtytype option;
    (** Insert here the set of "OrderQtyData" fields defined in "Common Components of Application Messages"*)
    f_NewOrderMultileg_OrderQtyData : fix_orderqtydata;
    f_NewOrderMultileg_OrdType : fix_ordtype;
    f_NewOrderMultileg_PriceType : fix_pricetype option;
    (** Required for limit OrdTypes. For F/X orders, should be the "all-in" rate (spot rate adjusted for forward points). Can be used to specify a limit price for a pegged order, previously indicated, etc.*)
    f_NewOrderMultileg_Price : fix_float_6 option;
    (** Required for OrdType = "Stop" or OrdType = "Stop limit".*)
    f_NewOrderMultileg_StopPx : fix_float_6 option;
    f_NewOrderMultileg_Currency : fix_currency option;
    f_NewOrderMultileg_ComplianceID : string option;
    f_NewOrderMultileg_SolicitedFlag : fix_solicitedflag option;
    (** Required for Previously Indicated Orders (OrdType=E)*)
    f_NewOrderMultileg_IOIID : string option;
    (** Required for Previously Quoted Orders (OrdType=D)*)
    f_NewOrderMultileg_QuoteID : string option;
    (** Absence of this field indicates Day order*)
    f_NewOrderMultileg_TimeInForce : fix_timeinforce option;
    (** Can specify the time at which the order should be considered valid*)
    f_NewOrderMultileg_EffectiveTime : fix_utctimestamp option;
    (** Conditionally required if TimeInForce = GTD and ExpireTime is not specified.*)
    f_NewOrderMultileg_ExpireDate : fix_localmktdate option;
    (** Conditionally required if TimeInForce = GTD and ExpireDate is not specified.*)
    f_NewOrderMultileg_ExpireTime : fix_utctimestamp option;
    (** States whether executions are booked out or accumulated on a partially filled GT order*)
    f_NewOrderMultileg_GTBookingInst : fix_gtbookinginst option;
    (** Insert here the set of "CommissionData" fields defined in "Common Components of Application Messages"*)
    f_NewOrderMultileg_CommissionData : fix_commissiondata;
    f_NewOrderMultileg_OrderCapacity : fix_ordercapacity option;
    f_NewOrderMultileg_OrderRestrictions : fix_orderrestrictions option;
    f_NewOrderMultileg_CustOrderCapacity : fix_custordercapacity option;
    (** Indicates that broker is requested to execute a Forex accommodation trade in conjunction with the security trade.*)
    f_NewOrderMultileg_ForexReq : fix_forexreq option;
    (** Required if ForexReq = Y.*)
    f_NewOrderMultileg_SettlCurrency : fix_currency option;
    (** Method for booking out this order. Used when notifying a broker that an order to be settled by that broker is to be booked out as an OTC derivative (e.g. CFD or similar). Absence of this field implies regular booking.*)
    f_NewOrderMultileg_BookingType : fix_bookingtype option;
    f_NewOrderMultileg_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_NewOrderMultileg_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_NewOrderMultileg_EncodedText : string option;
    (** For use in derivatives omnibus accounting*)
    f_NewOrderMultileg_PositionEffect : fix_positioneffect option;
    (** For use with derivatives, such as options*)
    f_NewOrderMultileg_CoveredOrUncovered : fix_coveredoruncovered option;
    f_NewOrderMultileg_MaxShow : fix_float_6 option;
    (** Insert here the set of "PegInstruction" fields defined in "Common Components of Application Messages"*)
    f_NewOrderMultileg_PegInstructions : fix_peginstructions;
    (** Insert here the set of "DiscretionInstruction" fields defined in "Common Components of Application Messages"*)
    f_NewOrderMultileg_DiscretionInstructions : fix_discretioninstructions;
    (** The target strategy of the order*)
    f_NewOrderMultileg_TargetStrategy : fix_targetstrategy option;
    (** For further specification of the TargetStrategy*)
    f_NewOrderMultileg_TargetStrategyParameters : string option;
    (** Mandatory for a TargetStrategy=Participate order and specifies the target particpation rate.
     For other order types optionally specifies a volume limit (i.e. do not be more than this percent of the market volume)*)
    f_NewOrderMultileg_ParticipationRate : fix_float_6 option;
    (** For CIV - Optional*)
    f_NewOrderMultileg_CancellationRights : fix_cancellationrights option;
    f_NewOrderMultileg_MoneyLaunderingStatus : fix_moneylaunderingstatus option;
    (** Reference to Registration Instructions message for this Order.*)
    f_NewOrderMultileg_RegistID : string option;
    (** Supplementary registration information for this Order*)
    f_NewOrderMultileg_Designation : string option;
    (** Indicates the method of execution reporting requested by issuer of the order.*)
    f_NewOrderMultileg_MultiLegRptTypeReq : fix_multilegrpttypereq option
}
;;

(** The new order message type is used by institutions wishing to electronically submit securities and forex orders to a broker for execution.*)
type full_fix_newordersingle_data = {
    (** Unique identifier of the order as assigned by institution or by the intermediary (CIV term, not a hub/service bureau) with closest association with the investor.*)
    f_NewOrderSingle_ClOrdID : string;
    f_NewOrderSingle_SecondaryClOrdID : string option;
    f_NewOrderSingle_ClOrdLinkID : string option;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_NewOrderSingle_Parties : fix_rg_parties;
    f_NewOrderSingle_TradeOriginationDate : fix_localmktdate option;
    f_NewOrderSingle_TradeDate : fix_localmktdate option;
    f_NewOrderSingle_Account : string option;
    f_NewOrderSingle_AcctIDSource : fix_acctidsource option;
    (** Type of account associated with the order (Origin)*)
    f_NewOrderSingle_AccountType : fix_accounttype option;
    f_NewOrderSingle_DayBookingInst : fix_daybookinginst option;
    f_NewOrderSingle_BookingUnit : fix_bookingunit option;
    f_NewOrderSingle_PreallocMethod : fix_preallocmethod option;
    (** Used to assign an overall allocation id to the block of preallocations*)
    f_NewOrderSingle_AllocID : string option;
    (** Number of repeating groups for pre-trade allocation*)
    f_NewOrderSingle_PreAllocGrp : fix_rg_preallocgrp;
    f_NewOrderSingle_SettlType : fix_settltype option;
    (** Takes precedence over SettlType value and conditionally required/omitted for specific SettlType values.*)
    f_NewOrderSingle_SettlDate : fix_localmktdate option;
    f_NewOrderSingle_CashMargin : fix_cashmargin option;
    f_NewOrderSingle_ClearingFeeIndicator : fix_clearingfeeindicator option;
    f_NewOrderSingle_HandlInst : fix_handlinst option;
    (** Can contain multiple instructions, space delimited. If OrdType=P, exactly one of the following values (ExecInst = L, R, M, P, O, T, W, a, d) must be specified.*)
    f_NewOrderSingle_ExecInst : fix_execinst option;
    f_NewOrderSingle_MinQty : fix_float_6 option;
    f_NewOrderSingle_MaxFloor : fix_float_6 option;
    f_NewOrderSingle_ExDestination : fix_exchange option;
    (** Specifies the number of repeating TradingSessionIDs*)
    f_NewOrderSingle_TrdgSesGrp : fix_rg_trdgsesgrp;
    (** Used to identify soft trades at order entry.*)
    f_NewOrderSingle_ProcessCode : fix_processcode option;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_NewOrderSingle_Instrument : fix_instrument;
    (** Insert here the set of "FinancingDetails" (symbology) fields defined in "Common Components of Application Messages"*)
    f_NewOrderSingle_FinancingDetails : fix_financingdetails;
    (** Number of underlyings*)
    f_NewOrderSingle_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    (** Useful for verifying security identification*)
    f_NewOrderSingle_PrevClosePx : fix_float_6 option;
    f_NewOrderSingle_Side : fix_side;
    (** Required for short sell orders*)
    f_NewOrderSingle_LocateReqd : fix_locatereqd option;
    (** Time this order request was initiated/released by the trader, trading system, or intermediary.*)
    f_NewOrderSingle_TransactTime : fix_utctimestamp;
    (** Insert here the set of "Stipulations" (repeating group of Fixed Income stipulations) fields defined in "Common Components of Application Messages"*)
    f_NewOrderSingle_Stipulations : fix_rg_stipulations;
    f_NewOrderSingle_QtyType : fix_qtytype option;
    (** Insert here the set of "OrderQtyData" fields defined in "Common Components of Application Messages"*)
    f_NewOrderSingle_OrderQtyData : fix_orderqtydata;
    f_NewOrderSingle_OrdType : fix_ordtype;
    f_NewOrderSingle_PriceType : fix_pricetype option;
    (** Required for limit OrdTypes. For F/X orders, should be the "all-in" rate (spot rate adjusted for forward points). Can be used to specify a limit price for a pegged order, previously indicated, etc.*)
    f_NewOrderSingle_Price : fix_float_6 option;
    (** Required for OrdType = "Stop" or OrdType = "Stop limit".*)
    f_NewOrderSingle_StopPx : fix_float_6 option;
    (** Insert here the set of "SpreadOrBenchmarkCurveData" (Fixed Income spread or benchmark curve) fields defined in "Common Components of Application Messages"*)
    f_NewOrderSingle_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    (** Insert here the set of "YieldData" (yield-related) fields defined in "Common Components of Application Messages"*)
    f_NewOrderSingle_YieldData : fix_yielddata;
    f_NewOrderSingle_Currency : fix_currency option;
    f_NewOrderSingle_ComplianceID : string option;
    f_NewOrderSingle_SolicitedFlag : fix_solicitedflag option;
    (** Required for Previously Indicated Orders (OrdType=E)*)
    f_NewOrderSingle_IOIID : string option;
    (** Required for Previously Quoted Orders (OrdType=D)*)
    f_NewOrderSingle_QuoteID : string option;
    (** Absence of this field indicates Day order*)
    f_NewOrderSingle_TimeInForce : fix_timeinforce option;
    (** Can specify the time at which the order should be considered valid*)
    f_NewOrderSingle_EffectiveTime : fix_utctimestamp option;
    (** Conditionally required if TimeInForce = GTD and ExpireTime is not specified.*)
    f_NewOrderSingle_ExpireDate : fix_localmktdate option;
    (** Conditionally required if TimeInForce = GTD and ExpireDate is not specified.*)
    f_NewOrderSingle_ExpireTime : fix_utctimestamp option;
    (** States whether executions are booked out or accumulated on a partially filled GT order*)
    f_NewOrderSingle_GTBookingInst : fix_gtbookinginst option;
    (** Insert here the set of "CommissionData" fields defined in "Common Components of Application Messages"*)
    f_NewOrderSingle_CommissionData : fix_commissiondata;
    f_NewOrderSingle_OrderCapacity : fix_ordercapacity option;
    f_NewOrderSingle_OrderRestrictions : fix_orderrestrictions option;
    f_NewOrderSingle_CustOrderCapacity : fix_custordercapacity option;
    (** Indicates that broker is requested to execute a Forex accommodation trade in conjunction with the security trade.*)
    f_NewOrderSingle_ForexReq : fix_forexreq option;
    (** Required if ForexReq = Y.*)
    f_NewOrderSingle_SettlCurrency : fix_currency option;
    (** Method for booking out this order. Used when notifying a broker that an order to be settled by that broker is to be booked out as an OTC derivative (e.g. CFD or similar). Absence of this field implies regular booking.*)
    f_NewOrderSingle_BookingType : fix_bookingtype option;
    f_NewOrderSingle_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_NewOrderSingle_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_NewOrderSingle_EncodedText : string option;
    (** Can be used with OrdType = "Forex - Swap" to specify the "value date" for the future portion of a F/X swap.*)
    f_NewOrderSingle_SettlDate2 : fix_localmktdate option;
    (** Can be used with OrdType = "Forex - Swap" to specify the order quantity for the future portion of a F/X swap.*)
    f_NewOrderSingle_OrderQty2 : fix_float_6 option;
    (** Can be used with OrdType = "Forex - Swap" to specify the price for the future portion of a F/X swap which is also a limit order. For F/X orders, should be the "all-in" rate (spot rate adjusted for forward points).*)
    f_NewOrderSingle_Price2 : fix_float_6 option;
    (** For use in derivatives omnibus accounting*)
    f_NewOrderSingle_PositionEffect : fix_positioneffect option;
    (** For use with derivatives, such as options*)
    f_NewOrderSingle_CoveredOrUncovered : fix_coveredoruncovered option;
    f_NewOrderSingle_MaxShow : fix_float_6 option;
    (** Insert here the set of "PegInstruction" fields defined in "Common Components of Application Messages"*)
    f_NewOrderSingle_PegInstructions : fix_peginstructions;
    (** Insert here the set of "DiscretionInstruction" fields defined in "Common Components of Application Messages"*)
    f_NewOrderSingle_DiscretionInstructions : fix_discretioninstructions;
    (** The target strategy of the order*)
    f_NewOrderSingle_TargetStrategy : fix_targetstrategy option;
    (** For further specification of the TargetStrategy*)
    f_NewOrderSingle_TargetStrategyParameters : string option;
    (** Mandatory for a TargetStrategy=Participate order and specifies the target particpation rate.
     For other order types optionally specifies a volume limit (i.e. do not be more than this percent of the market volume)*)
    f_NewOrderSingle_ParticipationRate : fix_float_6 option;
    (** For CIV - Optional*)
    f_NewOrderSingle_CancellationRights : fix_cancellationrights option;
    f_NewOrderSingle_MoneyLaunderingStatus : fix_moneylaunderingstatus option;
    (** Reference to Registration Instructions message for this Order.*)
    f_NewOrderSingle_RegistID : string option;
    (** Supplementary registration information for this Order*)
    f_NewOrderSingle_Designation : string option
}
;;

(** The news message is a general free format message between the broker and institution.*)
type full_fix_news_data = {
    f_News_OrigTime : fix_utctimestamp option;
    f_News_Urgency : fix_urgency option;
    (** Specifies the headline text*)
    f_News_Headline : string;
    (** Must be set if EncodedHeadline field is specified and must immediately precede it.*)
    f_News_EncodedHeadlineLen : int option;
    (** Encoded (non-ASCII characters) representation of the Headline field in the encoded format specified via the MessageEncoding field.*)
    f_News_EncodedHeadline : string option;
    (** Required if any RoutingType and RoutingIDs are specified. Indicates the number within repeating group.*)
    f_News_RoutingGrp : fix_rg_routinggrp;
    (** Specifies the number of repeating symbols (instruments) specified*)
    f_News_InstrmtGrp : fix_rg_instrmtgrp;
    (** Number of legs
     Identifies a Multi-leg Execution if present and non-zero.*)
    f_News_InstrmtLegGrp : fix_rg_instrmtleggrp;
    (** Number of underlyings*)
    f_News_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    (** Specifies the number of repeating lines of text specified*)
    f_News_LinesOfTextGrp : fix_rg_linesoftextgrp;
    (** A URL (Uniform Resource Locator) link to additional information (i.e. http://www.XYZ.com/research.html)*)
    f_News_URLLink : string option;
    f_News_RawDataLength : int option;
    f_News_RawData : string option
}
;;

(** The order cancel reject message is issued by the broker upon receipt of a cancel request or cancel/replace request message which cannot be honored.*)
type full_fix_ordercancelreject_data = {
    (** If CxlRejReason="Unknown order", specify "NONE".*)
    f_OrderCancelReject_OrderID : string;
    (** Can be used to provide order id used by exchange or executing system.*)
    f_OrderCancelReject_SecondaryOrderID : string option;
    f_OrderCancelReject_SecondaryClOrdID : string option;
    (** Unique order id assigned by institution or by the intermediary with closest association with the investor. to the cancel request or to the replacement order.*)
    f_OrderCancelReject_ClOrdID : string;
    f_OrderCancelReject_ClOrdLinkID : string option;
    (** ClOrdID which could not be canceled/replaced. ClOrdID of the previous accepted order (NOT the initial order of the day) when canceling or replacing an order.*)
    f_OrderCancelReject_OrigClOrdID : string;
    (** OrdStatus value after this cancel reject is applied.
     If CxlRejReason = "Unknown Order", specify Rejected.*)
    f_OrderCancelReject_OrdStatus : fix_ordstatus;
    (** For optional use with OrdStatus = 0 (New)*)
    f_OrderCancelReject_WorkingIndicator : fix_workingindicator option;
    f_OrderCancelReject_OrigOrdModTime : fix_utctimestamp option;
    (** Required for rejects against orders which were submitted as part of a list.*)
    f_OrderCancelReject_ListID : string option;
    f_OrderCancelReject_Account : string option;
    f_OrderCancelReject_AcctIDSource : fix_acctidsource option;
    f_OrderCancelReject_AccountType : fix_accounttype option;
    f_OrderCancelReject_TradeOriginationDate : fix_localmktdate option;
    f_OrderCancelReject_TradeDate : fix_localmktdate option;
    f_OrderCancelReject_TransactTime : fix_utctimestamp option;
    f_OrderCancelReject_CxlRejResponseTo : fix_cxlrejresponseto;
    f_OrderCancelReject_CxlRejReason : fix_cxlrejreason option;
    f_OrderCancelReject_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_OrderCancelReject_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_OrderCancelReject_EncodedText : string option
}
;;

(** The order cancel/replace request is used to change the parameters of an existing order.*)
type full_fix_ordercancelreplacerequest_data = {
    (** Unique identifier of most recent order as assigned by sell-side (broker, exchange, ECN).*)
    f_OrderCancelReplaceRequest_OrderID : string option;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_OrderCancelReplaceRequest_Parties : fix_rg_parties;
    f_OrderCancelReplaceRequest_TradeOriginationDate : fix_localmktdate option;
    f_OrderCancelReplaceRequest_TradeDate : fix_localmktdate option;
    (** ClOrdID of the previous non rejected order (NOT the initial order of the day) when canceling or replacing an order.*)
    f_OrderCancelReplaceRequest_OrigClOrdID : string;
    (** Unique identifier of replacement order as assigned by institution or by the intermediary with closest association with the investor.. Note that this identifier will be used in ClOrdID field of the Cancel Reject message if the replacement request is rejected.*)
    f_OrderCancelReplaceRequest_ClOrdID : string;
    f_OrderCancelReplaceRequest_SecondaryClOrdID : string option;
    f_OrderCancelReplaceRequest_ClOrdLinkID : string option;
    (** Required for List Orders*)
    f_OrderCancelReplaceRequest_ListID : string option;
    (** TransactTime of the last state change that occurred to the original order*)
    f_OrderCancelReplaceRequest_OrigOrdModTime : fix_utctimestamp option;
    f_OrderCancelReplaceRequest_Account : string option;
    f_OrderCancelReplaceRequest_AcctIDSource : fix_acctidsource option;
    f_OrderCancelReplaceRequest_AccountType : fix_accounttype option;
    f_OrderCancelReplaceRequest_DayBookingInst : fix_daybookinginst option;
    f_OrderCancelReplaceRequest_BookingUnit : fix_bookingunit option;
    f_OrderCancelReplaceRequest_PreallocMethod : fix_preallocmethod option;
    (** Used to assign an overall allocation id to the block of preallocations*)
    f_OrderCancelReplaceRequest_AllocID : string option;
    (** Number of repeating groups for pre-trade allocation*)
    f_OrderCancelReplaceRequest_PreAllocGrp : fix_rg_preallocgrp;
    f_OrderCancelReplaceRequest_SettlType : fix_settltype option;
    (** Takes precedence over SettlType value and conditionally required/omitted for specific SettlType values.*)
    f_OrderCancelReplaceRequest_SettlDate : fix_localmktdate option;
    f_OrderCancelReplaceRequest_CashMargin : fix_cashmargin option;
    f_OrderCancelReplaceRequest_ClearingFeeIndicator : fix_clearingfeeindicator option;
    f_OrderCancelReplaceRequest_HandlInst : fix_handlinst option;
    (** Can contain multiple instructions, space delimited. Replacement order must be created with new parameters (i.e. original order values will not be brought forward to replacement order unless redefined within this message).*)
    f_OrderCancelReplaceRequest_ExecInst : fix_execinst option;
    f_OrderCancelReplaceRequest_MinQty : fix_float_6 option;
    f_OrderCancelReplaceRequest_MaxFloor : fix_float_6 option;
    f_OrderCancelReplaceRequest_ExDestination : fix_exchange option;
    (** Specifies the number of repeating TradingSessionIDs*)
    f_OrderCancelReplaceRequest_TrdgSesGrp : fix_rg_trdgsesgrp;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"
     Must match original order*)
    f_OrderCancelReplaceRequest_Instrument : fix_instrument;
    (** Insert here the set of "FinancingDetails" (symbology) fields defined in "Common Components of Application Messages"
     Must match original order*)
    f_OrderCancelReplaceRequest_FinancingDetails : fix_financingdetails;
    (** Number of underlyings*)
    f_OrderCancelReplaceRequest_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    (** Should match original order's side, however, if bilaterally agreed to the following groups could potentially be interchanged:
     Buy and Buy Minus
     Sell, Sell Plus, Sell Short, and Sell Short Exempt
     Cross, Cross Short, and Cross Short Exempt*)
    f_OrderCancelReplaceRequest_Side : fix_side;
    (** Time this order request was initiated/released by the trader or trading system.*)
    f_OrderCancelReplaceRequest_TransactTime : fix_utctimestamp;
    f_OrderCancelReplaceRequest_QtyType : fix_qtytype option;
    (** Insert here the set of "OrderQtyData" fields defined in "Common Components of Application Messages"
     Note: OrderQty value should be the "Total Intended Order Quantity" (including the amount already executed for this chain of orders)*)
    f_OrderCancelReplaceRequest_OrderQtyData : fix_orderqtydata;
    f_OrderCancelReplaceRequest_OrdType : fix_ordtype;
    f_OrderCancelReplaceRequest_PriceType : fix_pricetype option;
    (** Required for limit OrdTypes. For F/X orders, should be the "all-in" rate (spot rate adjusted for forward points). Can be used to specify a limit price for a pegged order, previously indicated, etc.*)
    f_OrderCancelReplaceRequest_Price : fix_float_6 option;
    (** Required for OrdType = "Stop" or OrdType = "Stop limit".*)
    f_OrderCancelReplaceRequest_StopPx : fix_float_6 option;
    (** Insert here the set of "SpreadOrBenchmarkCurveData" (Fixed Income spread or benchmark curve) fields defined in "Common Components of Application Messages"*)
    f_OrderCancelReplaceRequest_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    (** Insert here the set of "YieldData" (yield-related) fields defined in "Common Components of Application Messages"*)
    f_OrderCancelReplaceRequest_YieldData : fix_yielddata;
    (** Insert here the set of "PegInstruction" fields defined in "Common Components of Application Messages"*)
    f_OrderCancelReplaceRequest_PegInstructions : fix_peginstructions;
    (** Insert here the set of "DiscretionInstruction" fields defined in "Common Components of Application Messages"*)
    f_OrderCancelReplaceRequest_DiscretionInstructions : fix_discretioninstructions;
    (** The target strategy of the order*)
    f_OrderCancelReplaceRequest_TargetStrategy : fix_targetstrategy option;
    (** For further specification of the TargetStrategy*)
    f_OrderCancelReplaceRequest_TargetStrategyParameters : string option;
    (** Mandatory for a TargetStrategy=Participate order and specifies the target particpation rate.
     For other order types optionally specifies a volume limit (i.e. do not be more than this percent of the market volume)*)
    f_OrderCancelReplaceRequest_ParticipationRate : fix_float_6 option;
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
    (** Insert here the set of "CommissionData" fields defined in "Common Components of Application Messages"*)
    f_OrderCancelReplaceRequest_CommissionData : fix_commissiondata;
    f_OrderCancelReplaceRequest_OrderCapacity : fix_ordercapacity option;
    f_OrderCancelReplaceRequest_OrderRestrictions : fix_orderrestrictions option;
    f_OrderCancelReplaceRequest_CustOrderCapacity : fix_custordercapacity option;
    (** Indicates that broker is requested to execute a Forex accommodation trade in conjunction with the security trade.*)
    f_OrderCancelReplaceRequest_ForexReq : fix_forexreq option;
    (** Required if ForexReq = Y.*)
    f_OrderCancelReplaceRequest_SettlCurrency : fix_currency option;
    (** Method for booking out this order. Used when notifying a broker that an order to be settled by that broker is to be booked out as an OTC derivative (e.g. CFD or similar). Absence of this field implies regular booking.*)
    f_OrderCancelReplaceRequest_BookingType : fix_bookingtype option;
    f_OrderCancelReplaceRequest_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_OrderCancelReplaceRequest_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_OrderCancelReplaceRequest_EncodedText : string option;
    (** Can be used with OrdType = "Forex - Swap" to specify the "value date" for the future portion of a F/X swap.*)
    f_OrderCancelReplaceRequest_SettlDate2 : fix_localmktdate option;
    (** Can be used with OrdType = "Forex - Swap" to specify the order quantity for the future portion of a F/X swap.*)
    f_OrderCancelReplaceRequest_OrderQty2 : fix_float_6 option;
    (** Can be used with OrdType = "Forex - Swap" to specify the price for the future portion of a F/X swap.*)
    f_OrderCancelReplaceRequest_Price2 : fix_float_6 option;
    (** For use in derivatives omnibus accounting*)
    f_OrderCancelReplaceRequest_PositionEffect : fix_positioneffect option;
    (** For use with derivatives, such as options*)
    f_OrderCancelReplaceRequest_CoveredOrUncovered : fix_coveredoruncovered option;
    f_OrderCancelReplaceRequest_MaxShow : fix_float_6 option;
    (** Required for short sell orders*)
    f_OrderCancelReplaceRequest_LocateReqd : fix_locatereqd option;
    (** For CIV - Optional*)
    f_OrderCancelReplaceRequest_CancellationRights : fix_cancellationrights option;
    f_OrderCancelReplaceRequest_MoneyLaunderingStatus : fix_moneylaunderingstatus option;
    (** Reference to Registration Instructions message for this Order.*)
    f_OrderCancelReplaceRequest_RegistID : string option;
    (** Supplementary registration information for this Order*)
    f_OrderCancelReplaceRequest_Designation : string option
}
;;

(** The order cancel request message requests the cancellation of all of the remaining quantity of an existing order.*)
type full_fix_ordercancelrequest_data = {
    (** ClOrdID of the previous non-rejected order (NOT the initial order of the day) when canceling or replacing an order.*)
    f_OrderCancelRequest_OrigClOrdID : string;
    (** Unique identifier of most recent order as assigned by sell-side (broker, exchange, ECN).*)
    f_OrderCancelRequest_OrderID : string option;
    (** Unique ID of cancel request as assigned by the institution.*)
    f_OrderCancelRequest_ClOrdID : string;
    f_OrderCancelRequest_SecondaryClOrdID : string option;
    f_OrderCancelRequest_ClOrdLinkID : string option;
    (** Required for List Orders*)
    f_OrderCancelRequest_ListID : string option;
    f_OrderCancelRequest_OrigOrdModTime : fix_utctimestamp option;
    f_OrderCancelRequest_Account : string option;
    f_OrderCancelRequest_AcctIDSource : fix_acctidsource option;
    f_OrderCancelRequest_AccountType : fix_accounttype option;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_OrderCancelRequest_Parties : fix_rg_parties;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_OrderCancelRequest_Instrument : fix_instrument;
    (** Insert here the set of "FinancingDetails" (symbology) fields defined in "Common Components of Application Messages"
     Must match original order*)
    f_OrderCancelRequest_FinancingDetails : fix_financingdetails;
    (** Number of underlyings*)
    f_OrderCancelRequest_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    f_OrderCancelRequest_Side : fix_side;
    (** Time this order request was initiated/released by the trader or trading system.*)
    f_OrderCancelRequest_TransactTime : fix_utctimestamp;
    (** Insert here the set of "OrderQtyData" fields defined in "Common Components of Application Messages"
     Note: OrderQty = CumQty + LeavesQty (see exceptions above)*)
    f_OrderCancelRequest_OrderQtyData : fix_orderqtydata;
    f_OrderCancelRequest_ComplianceID : string option;
    f_OrderCancelRequest_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_OrderCancelRequest_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_OrderCancelRequest_EncodedText : string option
}
;;

(** The Order Mass Cancel Report is used to acknowledge an Order Mass Cancel Request. Note that each affected order that is canceled is acknowledged with a separate Execution Report or Order Cancel Reject message.*)
type full_fix_ordermasscancelreport_data = {
    (** ClOrdID provided on the Order Mass Cancel Request.*)
    f_OrderMassCancelReport_ClOrdID : string option;
    f_OrderMassCancelReport_SecondaryClOrdID : string option;
    (** Unique Identifier for the Order Mass Cancel Request assigned by the recipient of the Order Mass Cancel Request*)
    f_OrderMassCancelReport_OrderID : string;
    (** Secondary Order ID assigned by the recipient of the Order Mass Cancel Request*)
    f_OrderMassCancelReport_SecondaryOrderID : string option;
    (** Order Mass Cancel Request Type accepted by the system*)
    f_OrderMassCancelReport_MassCancelRequestType : fix_masscancelrequesttype;
    (** Indicates the action taken by the counterparty order handling system as a result of the Cancel Request
     0 - Indicates Order Mass Cancel Request was rejected.*)
    f_OrderMassCancelReport_MassCancelResponse : fix_masscancelresponse;
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
    f_OrderMassCancelReport_EncodedText : string option
}
;;

(** The order mass cancel request message requests the cancellation of all of the remaining quantity of a group of orders matching criteria specified within the request. NOTE: This message can only be used to cancel order messages (reduce the full quantity).*)
type full_fix_ordermasscancelrequest_data = {
    (** Unique ID of Order Mass Cancel Request as assigned by the institution.*)
    f_OrderMassCancelRequest_ClOrdID : string;
    f_OrderMassCancelRequest_SecondaryClOrdID : string option;
    (** Specifies the type of cancellation requested*)
    f_OrderMassCancelRequest_MassCancelRequestType : fix_masscancelrequesttype;
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
    f_OrderMassCancelRequest_TransactTime : fix_utctimestamp;
    f_OrderMassCancelRequest_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_OrderMassCancelRequest_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_OrderMassCancelRequest_EncodedText : string option
}
;;

(** The order mass status request message requests the status for orders matching criteria specified within the request.*)
type full_fix_ordermassstatusrequest_data = {
    (** Unique ID of mass status request as assigned by the institution.*)
    f_OrderMassStatusRequest_MassStatusReqID : string;
    (** Specifies the scope of the mass status request*)
    f_OrderMassStatusRequest_MassStatusReqType : fix_massstatusreqtype;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_OrderMassStatusRequest_Parties : fix_rg_parties;
    (** Account*)
    f_OrderMassStatusRequest_Account : string option;
    f_OrderMassStatusRequest_AcctIDSource : fix_acctidsource option;
    (** Trading Session*)
    f_OrderMassStatusRequest_TradingSessionID : string option;
    f_OrderMassStatusRequest_TradingSessionSubID : string option;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_OrderMassStatusRequest_Instrument : fix_instrument;
    (** Insert here the set of "UnderlyingInstrument" (underlying symbology) fields defined in "Common Components of Application Messages"*)
    f_OrderMassStatusRequest_UnderlyingInstrument : fix_underlyinginstrument;
    (** Optional qualifier used to indicate the side of the market for which orders will be returned.*)
    f_OrderMassStatusRequest_Side : fix_side option
}
;;

(** The order status request message is used by the institution to generate an order status message back from the broker.*)
type full_fix_orderstatusrequest_data = {
    f_OrderStatusRequest_OrderID : string option;
    (** The ClOrdID of the order whose status is being requested.*)
    f_OrderStatusRequest_ClOrdID : string;
    f_OrderStatusRequest_SecondaryClOrdID : string option;
    f_OrderStatusRequest_ClOrdLinkID : string option;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_OrderStatusRequest_Parties : fix_rg_parties;
    (** Optional, can be used to uniquely identify a specific Order Status Request message. Echoed back on Execution Report if provided.*)
    f_OrderStatusRequest_OrdStatusReqID : string option;
    f_OrderStatusRequest_Account : string option;
    f_OrderStatusRequest_AcctIDSource : fix_acctidsource option;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_OrderStatusRequest_Instrument : fix_instrument;
    (** Insert here the set of "FinancingDetails" (symbology) fields defined in "Common Components of Application Messages"
     Must match original order*)
    f_OrderStatusRequest_FinancingDetails : fix_financingdetails;
    (** Number of underlyings*)
    f_OrderStatusRequest_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    f_OrderStatusRequest_Side : fix_side
}
;;

(** Position Maintenance Report*)
type full_fix_positionmaintenancereport_data = {
    (** Unique identifier for this position report*)
    f_PositionMaintenanceReport_PosMaintRptID : string;
    f_PositionMaintenanceReport_PosTransType : fix_postranstype;
    (** Unique identifier for the position maintenance request associated with this report*)
    f_PositionMaintenanceReport_PosReqID : string option;
    f_PositionMaintenanceReport_PosMaintAction : fix_posmaintaction;
    (** Reference to the PosReqID of a previous maintenance request that is being replaced or canceled.*)
    f_PositionMaintenanceReport_OrigPosReqRefID : string;
    (** Status of Position Maintenance Request*)
    f_PositionMaintenanceReport_PosMaintStatus : fix_posmaintstatus;
    f_PositionMaintenanceReport_PosMaintResult : fix_posmaintresult option;
    (** The Clearing Business Date covered by this request*)
    f_PositionMaintenanceReport_ClearingBusinessDate : fix_localmktdate;
    (** Intraday(ITD), Regular Trading Hours(EOD),*)
    f_PositionMaintenanceReport_SettlSessID : fix_settlsessid option;
    f_PositionMaintenanceReport_SettlSessSubID : string option;
    (** Position Account*)
    f_PositionMaintenanceReport_Parties : fix_rg_parties;
    f_PositionMaintenanceReport_Account : string;
    f_PositionMaintenanceReport_AcctIDSource : fix_acctidsource option;
    (** Type of account associated with the order (Origin)*)
    f_PositionMaintenanceReport_AccountType : fix_accounttype;
    f_PositionMaintenanceReport_Instrument : fix_instrument;
    f_PositionMaintenanceReport_Currency : fix_currency option;
    (** Specifies the number of legs that make up the Security*)
    f_PositionMaintenanceReport_InstrmtLegGrp : fix_rg_instrmtleggrp;
    (** Specifies the number of underlying legs that make up the Security*)
    f_PositionMaintenanceReport_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    (** Specifies the number of repeating TradingSessionIDs*)
    f_PositionMaintenanceReport_TrdgSesGrp : fix_rg_trdgsesgrp;
    (** Time this order request was initiated/released by the trader, trading system, or intermediary.*)
    f_PositionMaintenanceReport_TransactTime : fix_utctimestamp;
    (** See definition for Position Quantity in the Proposed Component Block section above*)
    f_PositionMaintenanceReport_PositionQty : fix_rg_positionqty;
    (** Insert here here the set of "Position Amount Data" fields defined in "Common Components of Application Messages"*)
    f_PositionMaintenanceReport_PositionAmountData : fix_rg_positionamountdata;
    (** Type of adjustment to be applied
     Delta_plus, Delta_minus, Final. If Adjustment Type is null, the PCS request will be processed as Margin Disposition only*)
    f_PositionMaintenanceReport_AdjustmentType : fix_adjustmenttype option;
    f_PositionMaintenanceReport_ThresholdAmount : fix_float_6 option;
    f_PositionMaintenanceReport_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_PositionMaintenanceReport_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_PositionMaintenanceReport_EncodedText : string option
}
;;

(** Position Maintenance Request*)
type full_fix_positionmaintenancerequest_data = {
    (** Unique identifier for the position maintenance request as assigned by the submitter*)
    f_PositionMaintenanceRequest_PosReqID : string;
    f_PositionMaintenanceRequest_PosTransType : fix_postranstype;
    f_PositionMaintenanceRequest_PosMaintAction : fix_posmaintaction;
    (** Reference to the PosReqID of a previous maintenance request that is being replaced or canceled.*)
    f_PositionMaintenanceRequest_OrigPosReqRefID : string option;
    (** Reference to a PosMaintRptID from a previous Position Maintenance Report that is being replaced or canceled.*)
    f_PositionMaintenanceRequest_PosMaintRptRefID : string option;
    (** The Clearing Business Date referred to by this maintenance request*)
    f_PositionMaintenanceRequest_ClearingBusinessDate : fix_localmktdate;
    f_PositionMaintenanceRequest_SettlSessID : fix_settlsessid option;
    f_PositionMaintenanceRequest_SettlSessSubID : string option;
    (** The Following PartyRoles can be specified:
     ClearingOrganization
     Clearing Firm
     Position Account*)
    f_PositionMaintenanceRequest_Parties : fix_rg_parties;
    f_PositionMaintenanceRequest_Account : string;
    f_PositionMaintenanceRequest_AcctIDSource : fix_acctidsource option;
    (** Type of account associated with the order (Origin)*)
    f_PositionMaintenanceRequest_AccountType : fix_accounttype;
    f_PositionMaintenanceRequest_Instrument : fix_instrument;
    f_PositionMaintenanceRequest_Currency : fix_currency option;
    (** Specifies the number of legs that make up the Security*)
    f_PositionMaintenanceRequest_InstrmtLegGrp : fix_rg_instrmtleggrp;
    (** Specifies the number of underlying legs that make up the Security*)
    f_PositionMaintenanceRequest_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    (** Specifies the number of repeating TradingSessionIDs*)
    f_PositionMaintenanceRequest_TrdgSesGrp : fix_rg_trdgsesgrp;
    (** Time this order request was initiated/released by the trader, trading system, or intermediary.*)
    f_PositionMaintenanceRequest_TransactTime : fix_utctimestamp;
    f_PositionMaintenanceRequest_PositionQty : fix_rg_positionqty;
    (** Type of adjustment to be applied, used for PCS & PAJ
     Delta_plus, Delta_minus, Final, If Adjustment Type is null, the request will be processed as Margin Disposition*)
    f_PositionMaintenanceRequest_AdjustmentType : fix_adjustmenttype option;
    (** Boolean - if Y then indicates you are requesting a position maintenance that acting*)
    f_PositionMaintenanceRequest_ContraryInstructionIndicator : bool option;
    (** Boolean - Y indicates you are requesting rollover of prior day’s spread submissions*)
    f_PositionMaintenanceRequest_PriorSpreadIndicator : bool option;
    f_PositionMaintenanceRequest_ThresholdAmount : fix_float_6 option;
    f_PositionMaintenanceRequest_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_PositionMaintenanceRequest_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_PositionMaintenanceRequest_EncodedText : string option
}
;;

(** Position Report*)
type full_fix_positionreport_data = {
    (** Unique identifier for this position report*)
    f_PositionReport_PosMaintRptID : string;
    (** Unique identifier for the Request for Positions associated with this report
     This field should not be provided if the report was sent unsolicited.*)
    f_PositionReport_PosReqID : string option;
    f_PositionReport_PosReqType : fix_posreqtype option;
    (** Used to subscribe / unsubscribe for trade capture reports
     If the field is absent, the value 0 will be the default*)
    f_PositionReport_SubscriptionRequestType : fix_subscriptionrequesttype option;
    (** Total number of Position Reports being returned*)
    f_PositionReport_TotalNumPosReports : int option;
    (** Set to 'Y' if message is sent as a result of a subscription request or out of band configuration as opposed to a Position Request.*)
    f_PositionReport_UnsolicitedIndicator : fix_unsolicitedindicator option;
    f_PositionReport_PosReqResult : fix_posreqresult;
    (** The Clearing Business Date referred to by this maintenance request*)
    f_PositionReport_ClearingBusinessDate : fix_localmktdate;
    f_PositionReport_SettlSessID : fix_settlsessid option;
    f_PositionReport_SettlSessSubID : string option;
    (** Position Account*)
    f_PositionReport_Parties : fix_rg_parties;
    f_PositionReport_Account : string;
    f_PositionReport_AcctIDSource : fix_acctidsource option;
    (** Type of account associated with the order (Origin)*)
    f_PositionReport_AccountType : fix_accounttype;
    f_PositionReport_Instrument : fix_instrument;
    f_PositionReport_Currency : fix_currency option;
    f_PositionReport_SettlPrice : fix_float_6;
    (** Values = Final, Theoretical*)
    f_PositionReport_SettlPriceType : fix_settlpricetype;
    f_PositionReport_PriorSettlPrice : fix_float_6;
    (** Specifies the number of legs that make up the Security*)
    f_PositionReport_InstrmtLegGrp : fix_rg_instrmtleggrp;
    (** Specifies the number of underlying legs that make up the Security*)
    f_PositionReport_PosUndInstrmtGrp : fix_rg_posundinstrmtgrp;
    (** See definition for Position Quantity in the Proposed Component Block section above*)
    f_PositionReport_PositionQty : fix_rg_positionqty;
    (** Insert here here the set of "Position Amount Data" fields defined in "Common Components of Application Messages"*)
    f_PositionReport_PositionAmountData : fix_rg_positionamountdata;
    (** RegNonRegInd*)
    f_PositionReport_RegistStatus : fix_registstatus option;
    f_PositionReport_DeliveryDate : fix_localmktdate option;
    f_PositionReport_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_PositionReport_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_PositionReport_EncodedText : string option
}
;;

(** The Quote message is used as the response to a Quote Request or a Quote Response message in both indicative, tradeable, and restricted tradeable quoting markets.*)
type full_fix_quote_data = {
    (** Required when quote is in response to a Quote Request message*)
    f_Quote_QuoteReqID : string option;
    f_Quote_QuoteID : string;
    (** Required when responding to the Quote Response message. The counterparty specified ID of the Quote Response message.*)
    f_Quote_QuoteRespID : string option;
    (** Quote Type
     If not specified, the default is an indicative quote*)
    f_Quote_QuoteType : fix_quotetype option;
    f_Quote_QuotQualGrp : fix_rg_quotqualgrp;
    (** Level of Response requested from receiver of quote messages.*)
    f_Quote_QuoteResponseLevel : fix_quoteresponselevel option;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_Quote_Parties : fix_rg_parties;
    f_Quote_TradingSessionID : string option;
    f_Quote_TradingSessionSubID : string option;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_Quote_Instrument : fix_instrument;
    (** Insert here the set of "FinancingDetails" (symbology) fields defined in "Common Components of Application Messages"*)
    f_Quote_FinancingDetails : fix_financingdetails;
    (** Number of underlyings*)
    f_Quote_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    (** Required for Tradeable or Counter quotes of single instruments*)
    f_Quote_Side : fix_side option;
    (** Required for Tradeable quotes or Counter quotes of single instruments*)
    f_Quote_OrderQtyData : fix_orderqtydata;
    f_Quote_SettlType : fix_settltype option;
    (** Can be used with forex quotes to specify a specific "value date"*)
    f_Quote_SettlDate : fix_localmktdate option;
    (** Can be used with OrdType = "Forex - Swap" to specify the "value date" for the future portion of a F/X swap.*)
    f_Quote_SettlDate2 : fix_localmktdate option;
    (** Can be used with OrdType = "Forex - Swap" to specify the order quantity for the future portion of a F/X swap.*)
    f_Quote_OrderQty2 : fix_float_6 option;
    (** Can be used to specify the currency of the quoted prices. May differ from the ‘normal’ trading currency of the instrument being quoted*)
    f_Quote_Currency : fix_currency option;
    (** Insert here the set of "Stipulations" (repeating group of Fixed Income stipulations) fields defined in "Common Components of Application Messages"*)
    f_Quote_Stipulations : fix_rg_stipulations;
    f_Quote_Account : string option;
    f_Quote_AcctIDSource : fix_acctidsource option;
    (** Type of account associated with the order (Origin)*)
    f_Quote_AccountType : fix_accounttype option;
    (** Required for multileg quotes*)
    f_Quote_LegQuotGrp : fix_rg_legquotgrp;
    (** If F/X quote, should be the "all-in" rate (spot rate adjusted for forward points). Note that either BidPx, OfferPx or both must be specified.*)
    f_Quote_BidPx : fix_float_6 option;
    (** If F/X quote, should be the "all-in" rate (spot rate adjusted for forward points). Note that either BidPx, OfferPx or both must be specified.*)
    f_Quote_OfferPx : fix_float_6 option;
    (** Can be used by markets that require showing the current best bid and offer*)
    f_Quote_MktBidPx : fix_float_6 option;
    (** Can be used by markets that require showing the current best bid and offer*)
    f_Quote_MktOfferPx : fix_float_6 option;
    (** Specifies the minimum bid size. Used for markets that use a minimum and maximum bid size.*)
    f_Quote_MinBidSize : fix_float_6 option;
    (** Specifies the bid size. If MinBidSize is specified, BidSize is interpreted to contain the maximum bid size.*)
    f_Quote_BidSize : fix_float_6 option;
    (** Specifies the minimum offer size. If MinOfferSize is specified, OfferSize is interpreted to contain the maximum offer size.*)
    f_Quote_MinOfferSize : fix_float_6 option;
    (** Specified the offer size. If MinOfferSize is specified, OfferSize is interpreted to contain the maximum offer size.*)
    f_Quote_OfferSize : fix_float_6 option;
    (** The time when the quote will expire*)
    f_Quote_ValidUntilTime : fix_utctimestamp option;
    (** May be applicable for F/X quotes*)
    f_Quote_BidSpotRate : fix_float_6 option;
    (** May be applicable for F/X quotes*)
    f_Quote_OfferSpotRate : fix_float_6 option;
    (** May be applicable for F/X quotes*)
    f_Quote_BidForwardPoints : fix_float_6 option;
    (** May be applicable for F/X quotes*)
    f_Quote_OfferForwardPoints : fix_float_6 option;
    f_Quote_MidPx : fix_float_6 option;
    f_Quote_BidYield : fix_float_6 option;
    f_Quote_MidYield : fix_float_6 option;
    f_Quote_OfferYield : fix_float_6 option;
    f_Quote_TransactTime : fix_utctimestamp option;
    (** Can be used to specify the type of order the quote is for*)
    f_Quote_OrdType : fix_ordtype option;
    (** Bid F/X forward points of the future portion of a F/X swap quote added to spot rate. May be a negative value*)
    f_Quote_BidForwardPoints2 : fix_float_6 option;
    (** Offer F/X forward points of the future portion of a F/X swap quote added to spot rate. May be a negative value*)
    f_Quote_OfferForwardPoints2 : fix_float_6 option;
    (** Can be used when the quote is provided in a currency other than the instrument’s ‘normal’ trading currency. Applies to all bid prices contained in this quote message*)
    f_Quote_SettlCurrBidFxRate : fix_float_6 option;
    (** Can be used when the quote is provided in a currency other than the instrument’s ‘normal’ trading currency. Applies to all offer prices contained in this quote message*)
    f_Quote_SettlCurrOfferFxRate : fix_float_6 option;
    (** Can be used when the quote is provided in a currency other than the instruments trading currency.*)
    f_Quote_SettlCurrFxRateCalc : fix_settlcurrfxratecalc option;
    (** Can be used to show the counterparty the commission associated with the transaction.*)
    f_Quote_CommType : fix_commtype option;
    (** Can be used to show the counterparty the commission associated with the transaction.*)
    f_Quote_Commission : fix_float_6 option;
    (** For Futures Exchanges*)
    f_Quote_CustOrderCapacity : fix_custordercapacity option;
    (** Used when routing quotes to multiple markets*)
    f_Quote_ExDestination : fix_exchange option;
    f_Quote_OrderCapacity : fix_ordercapacity option;
    f_Quote_PriceType : fix_pricetype option;
    f_Quote_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    f_Quote_YieldData : fix_yielddata;
    f_Quote_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_Quote_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_Quote_EncodedText : string option
}
;;

(** The Quote Cancel message is used by an originator of quotes to cancel quotes.*)
type full_fix_quotecancel_data = {
    (** Required when quote is in response to a Quote Request message*)
    f_QuoteCancel_QuoteReqID : string option;
    f_QuoteCancel_QuoteID : string;
    (** Identifies the type of Quote Cancel request.*)
    f_QuoteCancel_QuoteCancelType : fix_quotecanceltype;
    (** Level of Response requested from receiver of quote messages.*)
    f_QuoteCancel_QuoteResponseLevel : fix_quoteresponselevel option;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_QuoteCancel_Parties : fix_rg_parties;
    f_QuoteCancel_Account : string option;
    f_QuoteCancel_AcctIDSource : fix_acctidsource option;
    (** Type of account associated with the order (Origin)*)
    f_QuoteCancel_AccountType : fix_accounttype option;
    f_QuoteCancel_TradingSessionID : string option;
    f_QuoteCancel_TradingSessionSubID : string option;
    (** The number of securities (instruments) whose quotes are to be canceled
     Not required when cancelling all quotes.*)
    f_QuoteCancel_QuotCxlEntriesGrp : fix_rg_quotcxlentriesgrp
}
;;

(** In some markets it is the practice to request quotes from brokers prior to placement of an order. The quote request message is used for this purpose. This message is commonly referred to as an Request For Quote (RFQ)*)
type full_fix_quoterequest_data = {
    f_QuoteRequest_QuoteReqID : string;
    (** For tradeable quote model - used to indicate to which RFQ Request this Quote Request is in response.*)
    f_QuoteRequest_RFQReqID : string option;
    (** Required when QuoteType is Tradeable and the OrdType is Limit.*)
    f_QuoteRequest_ClOrdID : string option;
    f_QuoteRequest_OrderCapacity : fix_ordercapacity option;
    (** Number of related symbols (instruments) in Request*)
    f_QuoteRequest_QuotReqGrp : fix_rg_quotreqgrp;
    f_QuoteRequest_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_QuoteRequest_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_QuoteRequest_EncodedText : string option
}
;;

(** The Quote Request Reject message is used to reject Quote Request messages for all quoting models.*)
type full_fix_quoterequestreject_data = {
    f_QuoteRequestReject_QuoteReqID : string;
    (** For tradeable quote model - used to indicate to which RFQ Request this Quote Request is in response.*)
    f_QuoteRequestReject_RFQReqID : string option;
    (** Reason Quote was rejected*)
    f_QuoteRequestReject_QuoteRequestRejectReason : fix_quoterequestrejectreason;
    (** Number of related symbols (instruments) in Request*)
    f_QuoteRequestReject_QuotReqRjctGrp : fix_rg_quotreqrjctgrp;
    f_QuoteRequestReject_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_QuoteRequestReject_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_QuoteRequestReject_EncodedText : string option
}
;;

(** The Quote Response message is used to respond to a IOI message or Quote message.*)
type full_fix_quoteresponse_data = {
    (** Unique ID as assigned by the Initiator*)
    f_QuoteResponse_QuoteRespID : string;
    (** Required only when responding to a Quote.*)
    f_QuoteResponse_QuoteID : string option;
    (** Type of response this Quote Response is.*)
    f_QuoteResponse_QuoteRespType : fix_quoteresptype;
    (** Required only when QuoteRespType is 1 (Hit/Lift) or 2 (Counter quote).*)
    f_QuoteResponse_ClOrdID : string option;
    f_QuoteResponse_OrderCapacity : fix_ordercapacity option;
    (** Required only when responding to an IOI.*)
    f_QuoteResponse_IOIID : string option;
    (** Default is Indicative.*)
    f_QuoteResponse_QuoteType : fix_quotetype option;
    f_QuoteResponse_QuotQualGrp : fix_rg_quotqualgrp;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_QuoteResponse_Parties : fix_rg_parties;
    f_QuoteResponse_TradingSessionID : string option;
    f_QuoteResponse_TradingSessionSubID : string option;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"
     For multilegs supply minimally a value for Symbol (55).*)
    f_QuoteResponse_Instrument : fix_instrument;
    (** Insert here the set of "FinancingDetails" (symbology) fields defined in "Common Components of Application Messages"
     For multilegs supply minimally a value for Symbol (55).*)
    f_QuoteResponse_FinancingDetails : fix_financingdetails;
    (** Number of underlyings*)
    f_QuoteResponse_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    (** Required when countering a single instrument quote or "hit/lift" an IOI or Quote.*)
    f_QuoteResponse_Side : fix_side option;
    (** Insert here the set of "OrderQtyData" fields defined in "Common Components of Application Messages"
     Required when countering a single instrument quote or "hit/lift" an IOI or Quote.*)
    f_QuoteResponse_OrderQtyData : fix_orderqtydata;
    f_QuoteResponse_SettlType : fix_settltype option;
    (** Can be used with forex quotes to specify a specific "value date"*)
    f_QuoteResponse_SettlDate : fix_localmktdate option;
    (** Can be used with OrdType = "Forex - Swap" to specify the "value date" for the future portion of a F/X swap.*)
    f_QuoteResponse_SettlDate2 : fix_localmktdate option;
    (** Can be used with OrdType = "Forex - Swap" to specify the order quantity for the future portion of a F/X swap.*)
    f_QuoteResponse_OrderQty2 : fix_float_6 option;
    (** Can be used to specify the currency of the quoted prices. May differ from the ‘normal’ trading currency of the instrument being quoted*)
    f_QuoteResponse_Currency : fix_currency option;
    (** Optional*)
    f_QuoteResponse_Stipulations : fix_rg_stipulations;
    f_QuoteResponse_Account : string option;
    (** Used to identify the source of the Account code.*)
    f_QuoteResponse_AcctIDSource : fix_acctidsource option;
    (** Type of account associated with the order (Origin)*)
    f_QuoteResponse_AccountType : fix_accounttype option;
    (** Required for multileg quote response*)
    f_QuoteResponse_LegQuotGrp : fix_rg_legquotgrp;
    (** If F/X quote, should be the "all-in" rate (spot rate adjusted for forward points). Note that either BidPx, OfferPx or both must be specified.*)
    f_QuoteResponse_BidPx : fix_float_6 option;
    (** If F/X quote, should be the "all-in" rate (spot rate adjusted for forward points). Note that either BidPx, OfferPx or both must be specified.*)
    f_QuoteResponse_OfferPx : fix_float_6 option;
    (** Can be used by markets that require showing the current best bid and offer*)
    f_QuoteResponse_MktBidPx : fix_float_6 option;
    (** Can be used by markets that require showing the current best bid and offer*)
    f_QuoteResponse_MktOfferPx : fix_float_6 option;
    (** Specifies the minimum bid size. Used for markets that use a minimum and maximum bid size.*)
    f_QuoteResponse_MinBidSize : fix_float_6 option;
    (** Specifies the bid size. If MinBidSize is specified, BidSize is interpreted to contain the maximum bid size.*)
    f_QuoteResponse_BidSize : fix_float_6 option;
    (** Specifies the minimum offer size. If MinOfferSize is specified, OfferSize is interpreted to contain the maximum offer size.*)
    f_QuoteResponse_MinOfferSize : fix_float_6 option;
    (** Specified the offer size. If MinOfferSize is specified, OfferSize is interpreted to contain the maximum offer size.*)
    f_QuoteResponse_OfferSize : fix_float_6 option;
    (** The time when the quote will expire.
     Required for FI when the QuoteRespType is 2 (Counter quote) to indicate to the Respondent when the counter offer is valid until.*)
    f_QuoteResponse_ValidUntilTime : fix_utctimestamp option;
    (** May be applicable for F/X quotes*)
    f_QuoteResponse_BidSpotRate : fix_float_6 option;
    (** May be applicable for F/X quotes*)
    f_QuoteResponse_OfferSpotRate : fix_float_6 option;
    (** May be applicable for F/X quotes*)
    f_QuoteResponse_BidForwardPoints : fix_float_6 option;
    (** May be applicable for F/X quotes*)
    f_QuoteResponse_OfferForwardPoints : fix_float_6 option;
    f_QuoteResponse_MidPx : fix_float_6 option;
    f_QuoteResponse_BidYield : fix_float_6 option;
    f_QuoteResponse_MidYield : fix_float_6 option;
    f_QuoteResponse_OfferYield : fix_float_6 option;
    f_QuoteResponse_TransactTime : fix_utctimestamp option;
    (** Can be used to specify the type of order the quote is for.*)
    f_QuoteResponse_OrdType : fix_ordtype option;
    (** Bid F/X forward points of the future portion of a F/X swap quote added to spot rate. May be a negative value*)
    f_QuoteResponse_BidForwardPoints2 : fix_float_6 option;
    (** Offer F/X forward points of the future portion of a F/X swap quote added to spot rate. May be a negative value*)
    f_QuoteResponse_OfferForwardPoints2 : fix_float_6 option;
    (** Can be used when the quote is provided in a currency other than the instrument’s ‘normal’ trading currency. Applies to all bid prices contained in this quote message*)
    f_QuoteResponse_SettlCurrBidFxRate : fix_float_6 option;
    (** Can be used when the quote is provided in a currency other than the instrument’s ‘normal’ trading currency. Applies to all offer prices contained in this quote message*)
    f_QuoteResponse_SettlCurrOfferFxRate : fix_float_6 option;
    (** Can be used when the quote is provided in a currency other than the instruments trading currency.*)
    f_QuoteResponse_SettlCurrFxRateCalc : fix_settlcurrfxratecalc option;
    (** Can be used to show the counterparty the commission associated with the transaction.*)
    f_QuoteResponse_Commission : fix_float_6 option;
    (** Can be used to show the counterparty the commission associated with the transaction.*)
    f_QuoteResponse_CommType : fix_commtype option;
    (** For Futures Exchanges*)
    f_QuoteResponse_CustOrderCapacity : fix_custordercapacity option;
    (** Used when routing quotes to multiple markets*)
    f_QuoteResponse_ExDestination : fix_exchange option;
    f_QuoteResponse_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_QuoteResponse_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_QuoteResponse_EncodedText : string option;
    f_QuoteResponse_Price : fix_float_6 option;
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
    f_QuoteStatusReport_QuoteStatusReqID : string option;
    (** Required when quote is in response to a Quote Request message*)
    f_QuoteStatusReport_QuoteReqID : string option;
    f_QuoteStatusReport_QuoteID : string;
    (** Required when responding to a Quote Response message.*)
    f_QuoteStatusReport_QuoteRespID : string option;
    (** Quote Type
     If not specified, the default is an indicative quote*)
    f_QuoteStatusReport_QuoteType : fix_quotetype option;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_QuoteStatusReport_Parties : fix_rg_parties;
    f_QuoteStatusReport_TradingSessionID : string option;
    f_QuoteStatusReport_TradingSessionSubID : string option;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_QuoteStatusReport_Instrument : fix_instrument;
    (** Insert here the set of "FinancingDetails" (symbology) fields defined in "Common Components of Application Messages"*)
    f_QuoteStatusReport_FinancingDetails : fix_financingdetails;
    (** Number of underlyings*)
    f_QuoteStatusReport_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    f_QuoteStatusReport_Side : fix_side option;
    (** Required for Tradeable quotes of single instruments*)
    f_QuoteStatusReport_OrderQtyData : fix_orderqtydata;
    f_QuoteStatusReport_SettlType : fix_settltype option;
    (** Can be used with forex quotes to specify a specific "value date"*)
    f_QuoteStatusReport_SettlDate : fix_localmktdate option;
    (** Can be used with OrdType = "Forex - Swap" to specify the "value date" for the future portion of a F/X swap.*)
    f_QuoteStatusReport_SettlDate2 : fix_localmktdate option;
    (** Can be used with OrdType = "Forex - Swap" to specify the order quantity for the future portion of a F/X swap.*)
    f_QuoteStatusReport_OrderQty2 : fix_float_6 option;
    (** Can be used to specify the currency of the quoted prices. May differ from the ‘normal’ trading currency of the instrument being quoted*)
    f_QuoteStatusReport_Currency : fix_currency option;
    f_QuoteStatusReport_Stipulations : fix_rg_stipulations;
    f_QuoteStatusReport_Account : string option;
    f_QuoteStatusReport_AcctIDSource : fix_acctidsource option;
    (** Type of account associated with the order (Origin)*)
    f_QuoteStatusReport_AccountType : fix_accounttype option;
    (** Required for multileg quote status reports*)
    f_QuoteStatusReport_LegQuotStatGrp : fix_rg_legquotstatgrp;
    f_QuoteStatusReport_QuotQualGrp : fix_rg_quotqualgrp;
    f_QuoteStatusReport_ExpireTime : fix_utctimestamp option;
    f_QuoteStatusReport_Price : fix_float_6 option;
    f_QuoteStatusReport_PriceType : fix_pricetype option;
    f_QuoteStatusReport_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    f_QuoteStatusReport_YieldData : fix_yielddata;
    (** If F/X quote, should be the "all-in" rate (spot rate adjusted for forward points). Note that either BidPx, OfferPx or both must be specified.*)
    f_QuoteStatusReport_BidPx : fix_float_6 option;
    (** If F/X quote, should be the "all-in" rate (spot rate adjusted for forward points). Note that either BidPx, OfferPx or both must be specified.*)
    f_QuoteStatusReport_OfferPx : fix_float_6 option;
    (** Can be used by markets that require showing the current best bid and offer*)
    f_QuoteStatusReport_MktBidPx : fix_float_6 option;
    (** Can be used by markets that require showing the current best bid and offer*)
    f_QuoteStatusReport_MktOfferPx : fix_float_6 option;
    (** Specifies the minimum bid size. Used for markets that use a minimum and maximum bid size.*)
    f_QuoteStatusReport_MinBidSize : fix_float_6 option;
    (** Specifies the bid size. If MinBidSize is specified, BidSize is interpreted to contain the maximum bid size.*)
    f_QuoteStatusReport_BidSize : fix_float_6 option;
    (** Specifies the minimum offer size. If MinOfferSize is specified, OfferSize is interpreted to contain the maximum offer size.*)
    f_QuoteStatusReport_MinOfferSize : fix_float_6 option;
    (** Specified the offer size. If MinOfferSize is specified, OfferSize is interpreted to contain the maximum offer size.*)
    f_QuoteStatusReport_OfferSize : fix_float_6 option;
    f_QuoteStatusReport_ValidUntilTime : fix_utctimestamp option;
    (** May be applicable for F/X quotes*)
    f_QuoteStatusReport_BidSpotRate : fix_float_6 option;
    (** May be applicable for F/X quotes*)
    f_QuoteStatusReport_OfferSpotRate : fix_float_6 option;
    (** May be applicable for F/X quotes*)
    f_QuoteStatusReport_BidForwardPoints : fix_float_6 option;
    (** May be applicable for F/X quotes*)
    f_QuoteStatusReport_OfferForwardPoints : fix_float_6 option;
    f_QuoteStatusReport_MidPx : fix_float_6 option;
    f_QuoteStatusReport_BidYield : fix_float_6 option;
    f_QuoteStatusReport_MidYield : fix_float_6 option;
    f_QuoteStatusReport_OfferYield : fix_float_6 option;
    f_QuoteStatusReport_TransactTime : fix_utctimestamp option;
    (** Can be used to specify the type of order the quote is for*)
    f_QuoteStatusReport_OrdType : fix_ordtype option;
    (** Bid F/X forward points of the future portion of a F/X swap quote added to spot rate. May be a negative value*)
    f_QuoteStatusReport_BidForwardPoints2 : fix_float_6 option;
    (** Offer F/X forward points of the future portion of a F/X swap quote added to spot rate. May be a negative value*)
    f_QuoteStatusReport_OfferForwardPoints2 : fix_float_6 option;
    (** Can be used when the quote is provided in a currency other than the instrument’s ‘normal’ trading currency. Applies to all bid prices contained in this message*)
    f_QuoteStatusReport_SettlCurrBidFxRate : fix_float_6 option;
    (** Can be used when the quote is provided in a currency other than the instrument’s ‘normal’ trading currency. Applies to all offer prices contained in this message*)
    f_QuoteStatusReport_SettlCurrOfferFxRate : fix_float_6 option;
    (** Can be used when the quote is provided in a currency other than the instruments trading currency.*)
    f_QuoteStatusReport_SettlCurrFxRateCalc : fix_settlcurrfxratecalc option;
    (** Can be used to show the counterparty the commission associated with the transaction.*)
    f_QuoteStatusReport_CommType : fix_commtype option;
    (** Can be used to show the counterparty the commission associated with the transaction.*)
    f_QuoteStatusReport_Commission : fix_float_6 option;
    (** For Futures Exchanges*)
    f_QuoteStatusReport_CustOrderCapacity : fix_custordercapacity option;
    (** Used when routing quotes to multiple markets*)
    f_QuoteStatusReport_ExDestination : fix_exchange option;
    (** Quote Status*)
    f_QuoteStatusReport_QuoteStatus : fix_quotestatus option;
    f_QuoteStatusReport_Text : string option;
    f_QuoteStatusReport_EncodedTextLen : int option;
    f_QuoteStatusReport_EncodedText : string option
}
;;

(** The quote status request message is used for the following purposes in markets that employ tradeable or restricted tradeable quotes:*)
type full_fix_quotestatusrequest_data = {
    f_QuoteStatusRequest_QuoteStatusReqID : string option;
    f_QuoteStatusRequest_QuoteID : string option;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_QuoteStatusRequest_Instrument : fix_instrument;
    (** Insert here the set of "FinancingDetails" (symbology) fields defined in "Common Components of Application Messages"*)
    f_QuoteStatusRequest_FinancingDetails : fix_financingdetails;
    (** Number of underlyings*)
    f_QuoteStatusRequest_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    (** Required for multileg quotes*)
    f_QuoteStatusRequest_InstrmtLegGrp : fix_rg_instrmtleggrp;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_QuoteStatusRequest_Parties : fix_rg_parties;
    f_QuoteStatusRequest_Account : string option;
    f_QuoteStatusRequest_AcctIDSource : fix_acctidsource option;
    (** Type of account associated with the order (Origin)*)
    f_QuoteStatusRequest_AccountType : fix_accounttype option;
    f_QuoteStatusRequest_TradingSessionID : string option;
    f_QuoteStatusRequest_TradingSessionSubID : string option;
    (** Used to subscribe for Quote Status Report messages*)
    f_QuoteStatusRequest_SubscriptionRequestType : fix_subscriptionrequesttype option
}
;;

(** In tradeable and restricted tradeable quoting markets – Quote Requests are issued by counterparties interested in ascertaining the market for an instrument.*)
type full_fix_rfqrequest_data = {
    f_RFQRequest_RFQReqID : string;
    (** Number of related symbols (instruments) in Request*)
    f_RFQRequest_RFQReqGrp : fix_rg_rfqreqgrp;
    (** Used to subscribe for Quote Requests that are sent into a market*)
    f_RFQRequest_SubscriptionRequestType : fix_subscriptionrequesttype option
}
;;

(** The Registration Instructions message type may be used by institutions or retail intermediaries wishing to electronically submit registration information to a broker or fund manager (for CIV) for an order or for an allocation.*)
type full_fix_registrationinstructions_data = {
    f_RegistrationInstructions_RegistID : string;
    f_RegistrationInstructions_RegistTransType : fix_registtranstype;
    (** Required for Cancel and Replace RegistTransType messages*)
    f_RegistrationInstructions_RegistRefID : string;
    (** Unique identifier of the order as assigned by institution or intermediary to which Registration relates*)
    f_RegistrationInstructions_ClOrdID : string option;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_RegistrationInstructions_Parties : fix_rg_parties;
    f_RegistrationInstructions_Account : string option;
    f_RegistrationInstructions_AcctIDSource : fix_acctidsource option;
    f_RegistrationInstructions_RegistAcctType : string option;
    f_RegistrationInstructions_TaxAdvantageType : fix_taxadvantagetype option;
    f_RegistrationInstructions_OwnershipType : fix_ownershiptype option;
    (** Number of registration details in this message (number of repeating groups to follow)*)
    f_RegistrationInstructions_RgstDtlsGrp : fix_rg_rgstdtlsgrp;
    (** Number of Distribution instructions in this message (number of repeating groups to follow)*)
    f_RegistrationInstructions_RgstDistInstGrp : fix_rg_rgstdistinstgrp
}
;;

(** The Registration Instructions Response message type may be used by broker or fund manager (for CIV) in response to a Registration Instructions message submitted by an institution or retail intermediary for an order or for an allocation.*)
type full_fix_registrationinstructionsresponse_data = {
    (** Unique identifier of the original Registration Instructions details*)
    f_RegistrationInstructionsResponse_RegistID : string;
    (** Identifies original Registration Instructions transaction type*)
    f_RegistrationInstructionsResponse_RegistTransType : fix_registtranstype;
    (** Required for Cancel and Replace RegistTransType messages*)
    f_RegistrationInstructionsResponse_RegistRefID : string;
    (** Unique identifier of the order as assigned by institution or intermediary.*)
    f_RegistrationInstructionsResponse_ClOrdID : string option;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"*)
    f_RegistrationInstructionsResponse_Parties : fix_rg_parties;
    f_RegistrationInstructionsResponse_Account : string option;
    f_RegistrationInstructionsResponse_AcctIDSource : fix_acctidsource option;
    f_RegistrationInstructionsResponse_RegistStatus : fix_registstatus;
    f_RegistrationInstructionsResponse_RegistRejReasonCode : fix_registrejreasoncode option;
    f_RegistrationInstructionsResponse_RegistRejReasonText : string option
}
;;

(** Request For Positions*)
type full_fix_requestforpositions_data = {
    (** Unique identifier for the Request for Positions as assigned by the submitter*)
    f_RequestForPositions_PosReqID : string;
    f_RequestForPositions_PosReqType : fix_posreqtype;
    f_RequestForPositions_MatchStatus : fix_matchstatus option;
    (** Used to subscribe / unsubscribe for trade capture reports
     If the field is absent, the value 0 will be the default*)
    f_RequestForPositions_SubscriptionRequestType : fix_subscriptionrequesttype option;
    (** Position Account*)
    f_RequestForPositions_Parties : fix_rg_parties;
    f_RequestForPositions_Account : string;
    f_RequestForPositions_AcctIDSource : fix_acctidsource option;
    (** Type of account associated with the order (Origin)*)
    f_RequestForPositions_AccountType : fix_accounttype;
    f_RequestForPositions_Instrument : fix_instrument;
    f_RequestForPositions_Currency : fix_currency option;
    (** Specifies the number of legs that make up the Security*)
    f_RequestForPositions_InstrmtLegGrp : fix_rg_instrmtleggrp;
    (** Specifies the number of underlying legs that make up the Security*)
    f_RequestForPositions_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    (** The Clearing Business Date referred to by this request*)
    f_RequestForPositions_ClearingBusinessDate : fix_localmktdate;
    (** Intraday(ITD), Regular Trading Hours(EOD)*)
    f_RequestForPositions_SettlSessID : fix_settlsessid option;
    f_RequestForPositions_SettlSessSubID : string option;
    (** Specifies the number of repeating TradingSessionIDs*)
    f_RequestForPositions_TrdgSesGrp : fix_rg_trdgsesgrp;
    (** Time this order request was initiated/released by the trader, trading system, or intermediary.*)
    f_RequestForPositions_TransactTime : fix_utctimestamp;
    (** Ability to specify whether the response to the request should be delivered inband or via pre-arranged out-of-band transport.*)
    f_RequestForPositions_ResponseTransportType : fix_responsetransporttype option;
    (** URI destination name. Used if ResponseTransportType is out-of-band.*)
    f_RequestForPositions_ResponseDestination : string option;
    f_RequestForPositions_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_RequestForPositions_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_RequestForPositions_EncodedText : string option
}
;;

(** Request for Positions Ack*)
type full_fix_requestforpositionsack_data = {
    (** Unique identifier for this position report*)
    f_RequestForPositionsAck_PosMaintRptID : string;
    (** Unique identifier for the Request for Position associated with this report
     This field should not be provided if the report was sent unsolicited.*)
    f_RequestForPositionsAck_PosReqID : string option;
    (** Total number of Position Reports being returned*)
    f_RequestForPositionsAck_TotalNumPosReports : int option;
    (** Set to 'Y' if message is sent as a result of a subscription request or out of band configuration as opposed to a Position Request.*)
    f_RequestForPositionsAck_UnsolicitedIndicator : fix_unsolicitedindicator option;
    f_RequestForPositionsAck_PosReqResult : fix_posreqresult;
    f_RequestForPositionsAck_PosReqStatus : fix_posreqstatus;
    (** Position Account*)
    f_RequestForPositionsAck_Parties : fix_rg_parties;
    f_RequestForPositionsAck_Account : string;
    f_RequestForPositionsAck_AcctIDSource : fix_acctidsource option;
    (** Type of account associated with the order (Origin)*)
    f_RequestForPositionsAck_AccountType : fix_accounttype;
    f_RequestForPositionsAck_Instrument : fix_instrument;
    f_RequestForPositionsAck_Currency : fix_currency option;
    (** Specifies the number of legs that make up the Security*)
    f_RequestForPositionsAck_InstrmtLegGrp : fix_rg_instrmtleggrp;
    (** Specifies the number of underlying legs that make up the Security*)
    f_RequestForPositionsAck_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    (** Ability to specify whether the response to the request should be delivered inband or via pre-arranged out-of-band transport.*)
    f_RequestForPositionsAck_ResponseTransportType : fix_responsetransporttype option;
    (** URI destination name. Used if ResponseTransportType is out-of-band.*)
    f_RequestForPositionsAck_ResponseDestination : string option;
    f_RequestForPositionsAck_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_RequestForPositionsAck_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_RequestForPositionsAck_EncodedText : string option
}
;;

(** The Security Definition message is used for the following:
 1. Accept the security defined in a Security Definition message.
 2. Accept the security defined in a Security Definition message with changes to the definition and/or identity of the security.
 3. Reject the security requested in a Security Definition message*)
type full_fix_securitydefinition_data = {
    f_SecurityDefinition_SecurityReqID : string;
    (** Identifier for the Security Definition message*)
    f_SecurityDefinition_SecurityResponseID : string;
    (** Response to the Security Definition Request*)
    f_SecurityDefinition_SecurityResponseType : fix_securityresponsetype;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"
     of the requested Security*)
    f_SecurityDefinition_Instrument : fix_instrument;
    (** Insert here the set of "InstrumentExtension" fields defined in "Common Components of Application Messages"*)
    f_SecurityDefinition_InstrumentExtension : fix_instrumentextension;
    (** Number of underlyings*)
    f_SecurityDefinition_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    f_SecurityDefinition_Currency : fix_currency option;
    f_SecurityDefinition_TradingSessionID : string option;
    f_SecurityDefinition_TradingSessionSubID : string option;
    (** Comment, instructions, or other identifying information.*)
    f_SecurityDefinition_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_SecurityDefinition_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_SecurityDefinition_EncodedText : string option;
    (** Number of legs that make up the Security*)
    f_SecurityDefinition_InstrmtLegGrp : fix_rg_instrmtleggrp;
    f_SecurityDefinition_ExpirationCycle : fix_expirationcycle option;
    f_SecurityDefinition_RoundLot : fix_float_6 option;
    f_SecurityDefinition_MinTradeVol : fix_float_6 option
}
;;

(** The Security Definition Request message is used for the following:
 1. Request a specific Security to be traded with the second party. The request security can be defined as a multileg security made up of one or more instrument legs.*)
type full_fix_securitydefinitionrequest_data = {
    f_SecurityDefinitionRequest_SecurityReqID : string;
    f_SecurityDefinitionRequest_SecurityRequestType : fix_securityrequesttype;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"
     of the requested Security*)
    f_SecurityDefinitionRequest_Instrument : fix_instrument;
    (** Insert here the set of "InstrumentExtension" fields defined in "Common Components of Application Messages"*)
    f_SecurityDefinitionRequest_InstrumentExtension : fix_instrumentextension;
    (** Number of underlyings*)
    f_SecurityDefinitionRequest_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    f_SecurityDefinitionRequest_Currency : fix_currency option;
    (** Comment, instructions, or other identifying information.*)
    f_SecurityDefinitionRequest_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_SecurityDefinitionRequest_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_SecurityDefinitionRequest_EncodedText : string option;
    (** Optional Trading Session Identifier to specify a particular trading session for which you want to obtain a list of securities that are tradeable.*)
    f_SecurityDefinitionRequest_TradingSessionID : string option;
    f_SecurityDefinitionRequest_TradingSessionSubID : string option;
    (** Number of legs that make up the Security*)
    f_SecurityDefinitionRequest_InstrmtLegGrp : fix_rg_instrmtleggrp;
    f_SecurityDefinitionRequest_ExpirationCycle : fix_expirationcycle option;
    (** Subscribe or unsubscribe for security status to security specified in request.*)
    f_SecurityDefinitionRequest_SubscriptionRequestType : fix_subscriptionrequesttype option
}
;;

(** The Security List message is used to return a list of securities that matches the criteria specified in a Security List Request.*)
type full_fix_securitylist_data = {
    f_SecurityList_SecurityReqID : string;
    (** Identifier for the Security List message*)
    f_SecurityList_SecurityResponseID : string;
    (** Result of the Security Request identified by the SecurityReqID*)
    f_SecurityList_SecurityRequestResult : fix_securityrequestresult;
    (** Used to indicate the total number of securities being returned for this request. Used in the event that message fragmentation is required.*)
    f_SecurityList_TotNoRelatedSym : int option;
    (** Indicates whether this is the last fragment in a sequence of message fragments. Only required where message has been fragmented.*)
    f_SecurityList_LastFragment : fix_lastfragment option;
    (** Specifies the number of repeating symbols (instruments) specified*)
    f_SecurityList_SecListGrp : fix_rg_seclistgrp
}
;;

(** The Security List Request message is used to return a list of securities from the counterparty that match criteria provided on the request*)
type full_fix_securitylistrequest_data = {
    f_SecurityListRequest_SecurityReqID : string;
    (** Type of Security List Request being made*)
    f_SecurityListRequest_SecurityListRequestType : fix_securitylistrequesttype;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"
     of the requested Security*)
    f_SecurityListRequest_Instrument : fix_instrument;
    (** Insert here the set of "InstrumentExtension" fields defined in "Common Components of Application Messages"*)
    f_SecurityListRequest_InstrumentExtension : fix_instrumentextension;
    (** Insert here the set of "FinancingDetails" fields defined in "Common Components of Application Messages"*)
    f_SecurityListRequest_FinancingDetails : fix_financingdetails;
    (** Number of underlyings*)
    f_SecurityListRequest_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    (** Number of legs that make up the Security*)
    f_SecurityListRequest_InstrmtLegGrp : fix_rg_instrmtleggrp;
    f_SecurityListRequest_Currency : fix_currency option;
    (** Comment, instructions, or other identifying information.*)
    f_SecurityListRequest_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_SecurityListRequest_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_SecurityListRequest_EncodedText : string option;
    (** Optional Trading Session Identifier to specify a particular trading session for which you want to obtain a list of securities that are tradeable.*)
    f_SecurityListRequest_TradingSessionID : string option;
    f_SecurityListRequest_TradingSessionSubID : string option;
    (** Subscribe or unsubscribe for security status to security specified in request.*)
    f_SecurityListRequest_SubscriptionRequestType : fix_subscriptionrequesttype option
}
;;

(** The Security Status message provides for the ability to report changes in status to a security.*)
type full_fix_securitystatus_data = {
    f_SecurityStatus_SecurityStatusReqID : string option;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_SecurityStatus_Instrument : fix_instrument;
    (** Insert here the set of "InstrumentExtension" fields defined in "Common Components of Application Messages"*)
    f_SecurityStatus_InstrumentExtension : fix_instrumentextension;
    (** Number of underlyings*)
    f_SecurityStatus_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    (** Required for multileg quotes*)
    f_SecurityStatus_InstrmtLegGrp : fix_rg_instrmtleggrp;
    f_SecurityStatus_Currency : fix_currency option;
    f_SecurityStatus_TradingSessionID : string option;
    f_SecurityStatus_TradingSessionSubID : string option;
    (** Set to 'Y' if message is sent as a result of a subscription request not a snapshot request*)
    f_SecurityStatus_UnsolicitedIndicator : fix_unsolicitedindicator option;
    (** Identifies the trading status applicable to the transaction.*)
    f_SecurityStatus_SecurityTradingStatus : fix_securitytradingstatus option;
    f_SecurityStatus_FinancialStatus : fix_financialstatus option;
    f_SecurityStatus_CorporateAction : fix_corporateaction option;
    (** Denotes the reason for the Opening Delay or Trading Halt.*)
    f_SecurityStatus_HaltReason : fix_haltreason option;
    f_SecurityStatus_InViewOfCommon : fix_inviewofcommon option;
    f_SecurityStatus_DueToRelated : fix_duetorelated option;
    f_SecurityStatus_BuyVolume : fix_float_6 option;
    f_SecurityStatus_SellVolume : fix_float_6 option;
    f_SecurityStatus_HighPx : fix_float_6 option;
    f_SecurityStatus_LowPx : fix_float_6 option;
    (** Represents the last price for that security either on a Consolidated or an individual participant basis at the time it is disseminated.*)
    f_SecurityStatus_LastPx : fix_float_6 option;
    (** Trade Dissemination Time*)
    f_SecurityStatus_TransactTime : fix_utctimestamp option;
    f_SecurityStatus_Adjustment : fix_adjustment option;
    (** Comment, instructions, or other identifying information.*)
    f_SecurityStatus_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_SecurityStatus_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_SecurityStatus_EncodedText : string option
}
;;

(** The Security Status Request message provides for the ability to request the status of a security.*)
type full_fix_securitystatusrequest_data = {
    (** Must be unique, or the ID of previous Security Status Request to disable if SubscriptionRequestType = Disable previous Snapshot + Updates Request (2).*)
    f_SecurityStatusRequest_SecurityStatusReqID : string;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_SecurityStatusRequest_Instrument : fix_instrument;
    (** Insert here the set of "InstrumentExtension" fields defined in "Common Components of Application Messages"*)
    f_SecurityStatusRequest_InstrumentExtension : fix_instrumentextension;
    (** Number of underlyings*)
    f_SecurityStatusRequest_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    (** Number of legs that make up the Security*)
    f_SecurityStatusRequest_InstrmtLegGrp : fix_rg_instrmtleggrp;
    f_SecurityStatusRequest_Currency : fix_currency option;
    (** SubcriptionRequestType indicates to the other party what type of response is expected. A snapshot request only asks for current information. A subscribe request asks for updates as the status changes. Unsubscribe will cancel any future update messages from the counter party.)*)
    f_SecurityStatusRequest_SubscriptionRequestType : fix_subscriptionrequesttype;
    f_SecurityStatusRequest_TradingSessionID : string option;
    f_SecurityStatusRequest_TradingSessionSubID : string option
}
;;

(** The Security Type Request message is used to return a list of security types available from a counterparty or market.*)
type full_fix_securitytyperequest_data = {
    f_SecurityTypeRequest_SecurityReqID : string;
    (** Comment, instructions, or other identifying information.*)
    f_SecurityTypeRequest_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_SecurityTypeRequest_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_SecurityTypeRequest_EncodedText : string option;
    (** Optional Trading Session Identifier to specify a particular trading session for which you want to obtain a list of securities that are tradeable.*)
    f_SecurityTypeRequest_TradingSessionID : string option;
    f_SecurityTypeRequest_TradingSessionSubID : string option;
    (** Used to qualify which security types are returned*)
    f_SecurityTypeRequest_Product : fix_product option;
    (** Used to qualify which security type is returned*)
    f_SecurityTypeRequest_SecurityType : fix_securitytype option;
    (** Used to qualify which security types are returned*)
    f_SecurityTypeRequest_SecuritySubType : string option
}
;;

(** The Security Type message is used to return a list of security types available from a counterparty or market.*)
type full_fix_securitytypes_data = {
    f_SecurityTypes_SecurityReqID : string;
    (** Identifier for the security response message*)
    f_SecurityTypes_SecurityResponseID : string;
    (** The result of the security request identified by SecurityReqID*)
    f_SecurityTypes_SecurityResponseType : fix_securityresponsetype;
    (** Indicates total number of security types in the event that multiple Security Type messages are used to return results*)
    f_SecurityTypes_TotNoSecurityTypes : int option;
    (** Indicates whether this is the last fragment in a sequence of message fragments. Only required where message has been fragmented.*)
    f_SecurityTypes_LastFragment : fix_lastfragment option;
    f_SecurityTypes_SecTypesGrp : fix_rg_sectypesgrp;
    (** Comment, instructions, or other identifying information.*)
    f_SecurityTypes_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_SecurityTypes_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_SecurityTypes_EncodedText : string option;
    (** Optional Trading Session Identifier to specify a particular trading session for which you want to obtain a list of securities that are tradeable.*)
    f_SecurityTypes_TradingSessionID : string option;
    f_SecurityTypes_TradingSessionSubID : string option;
    (** Subscribe or unsubscribe for security status to security specified in request.*)
    f_SecurityTypes_SubscriptionRequestType : fix_subscriptionrequesttype option
}
;;

type full_fix_settlementinstructionrequest_data = {
    (** Unique message ID*)
    f_SettlementInstructionRequest_SettlInstReqID : string;
    (** Date/Time this request message was generated*)
    f_SettlementInstructionRequest_TransactTime : fix_utctimestamp;
    (** Insert here the set of "Parties" (firm identification) fields defined in "Common Components of Application Messages"
     Used here for party whose instructions this message is requesting and (optionally) for settlement location
     Not required if database identifiers are being used to request settlement instructions. Required otherwise.*)
    f_SettlementInstructionRequest_Parties : fix_rg_parties;
    (** Should not be populated if StandInstDbType is populated*)
    f_SettlementInstructionRequest_AllocAccount : string option;
    (** Required if AllocAccount populated
     Should not be populated if StandInstDbType is populated*)
    f_SettlementInstructionRequest_AllocAcctIDSource : int option;
    (** Should not be populated if StandInstDbType is populated*)
    f_SettlementInstructionRequest_Side : fix_side option;
    (** Should not be populated if StandInstDbType is populated*)
    f_SettlementInstructionRequest_Product : fix_product option;
    (** Should not be populated if StandInstDbType is populated*)
    f_SettlementInstructionRequest_SecurityType : fix_securitytype option;
    (** Should not be populated if StandInstDbType is populated*)
    f_SettlementInstructionRequest_CFICode : string option;
    (** Should not be populated if StandInstDbType is populated*)
    f_SettlementInstructionRequest_EffectiveTime : fix_utctimestamp option;
    (** Should not be populated if StandInstDbType is populated*)
    f_SettlementInstructionRequest_ExpireTime : fix_utctimestamp option;
    (** Should not be populated if StandInstDbType is populated*)
    f_SettlementInstructionRequest_LastUpdateTime : fix_utctimestamp option;
    (** Should not be populated if any of AllocAccount through to LastUpdateTime are populated*)
    f_SettlementInstructionRequest_StandInstDbType : fix_standinstdbtype option;
    (** Should not be populated if any of AllocAccount through to LastUpdateTime are populated*)
    f_SettlementInstructionRequest_StandInstDbName : string option;
    (** The identifier of the standing instructions within the database specified in StandInstDbType
     Required if StandInstDbType populated
     Should not be populated if any of AllocAccount through to LastUpdateTime are populated*)
    f_SettlementInstructionRequest_StandInstDbID : string option
}
;;

(** The Settlement Instructions message provides the broker’s, the institution’s, or the intermediary’s instructions for trade settlement. This message has been designed so that it can be sent from the broker to the institution, from the institution to the broker, or from either to an independent "standing instructions" database or matching system or, for CIV, from an intermediary to a fund manager.*)
type full_fix_settlementinstructions_data = {
    (** Unique identifier for this message*)
    f_SettlementInstructions_SettlInstMsgID : string;
    (** Only used when this message is used to respond to a settlement instruction request (to which this ID refers)*)
    f_SettlementInstructions_SettlInstReqID : string option;
    (** 1=Standing Instructions, 2=Specific Allocation Account Overriding, 3=Specific Allocation Account Standing , 4=Specific Order, 5=Reject SSI request*)
    f_SettlementInstructions_SettlInstMode : fix_settlinstmode;
    (** Required for SettlInstMode = 5. Used to provide reason for rejecting a Settlement Instruction Request message.*)
    f_SettlementInstructions_SettlInstReqRejCode : fix_settlinstreqrejcode option;
    (** Can be used to provide any additional rejection text where rejecting a Settlement Instruction Request message.*)
    f_SettlementInstructions_Text : string option;
    f_SettlementInstructions_EncodedTextLen : int option;
    f_SettlementInstructions_EncodedText : string option;
    (** Required for SettlInstMode=4.*)
    f_SettlementInstructions_ClOrdID : string option;
    (** Date/time this message was generated*)
    f_SettlementInstructions_TransactTime : fix_utctimestamp;
    (** Required except where SettlInstMode is 5=Reject SSI request*)
    f_SettlementInstructions_SettlInstGrp : fix_rg_settlinstgrp
}
;;

(** The Trade Capture Report message can be:
 • Used to report trades between counterparties.
 • Used to report trades to a trade matching system
 • Can be sent unsolicited between counterparties.
 • Sent as a reply to a Trade Capture Report Request.
 • Can be used to report unmatched and matched trades.*)
type full_fix_tradecapturereport_data = {
    (** Unique identifier for the Trade Capture Report*)
    f_TradeCaptureReport_TradeReportID : string;
    (** Identifies Trade Report message transaction type.*)
    f_TradeCaptureReport_TradeReportTransType : int option;
    f_TradeCaptureReport_TradeReportType : fix_tradereporttype option;
    (** Request ID if the Trade Capture Report is in response to a Trade Capture Report Request*)
    f_TradeCaptureReport_TradeRequestID : string option;
    f_TradeCaptureReport_TrdType : fix_trdtype option;
    f_TradeCaptureReport_TrdSubType : int option;
    f_TradeCaptureReport_SecondaryTrdType : int option;
    f_TradeCaptureReport_TransferReason : string option;
    (** Type of Execution being reported:
     Uses subset of ExecType for Trade Capture Reports*)
    f_TradeCaptureReport_ExecType : fix_exectype option;
    (** Number of trade reports returned - if this report is part of a response to a Trade Capture Report Request*)
    f_TradeCaptureReport_TotNumTradeReports : int option;
    (** Indicates if this is the last report in the response to a Trade Capture Report Request*)
    f_TradeCaptureReport_LastRptRequested : bool option;
    (** Set to 'Y' if message is sent as a result of a subscription request or out of band configuration as opposed to a Position Request.*)
    f_TradeCaptureReport_UnsolicitedIndicator : fix_unsolicitedindicator option;
    (** Used to subscribe / unsubscribe for trade capture reports. If the field is absent, the value 0 will be the default*)
    f_TradeCaptureReport_SubscriptionRequestType : fix_subscriptionrequesttype option;
    (** The TradeReportID that is being referenced for some action, such as correction or cancellation*)
    f_TradeCaptureReport_TradeReportRefID : string option;
    f_TradeCaptureReport_SecondaryTradeReportRefID : string option;
    f_TradeCaptureReport_SecondaryTradeReportID : string option;
    (** Used to associate a group of trades together. Useful for average price calculations.*)
    f_TradeCaptureReport_TradeLinkID : string option;
    f_TradeCaptureReport_TrdMatchID : string option;
    (** Exchanged assigned Execution ID (Trade Identifier)*)
    f_TradeCaptureReport_ExecID : string option;
    (** Status of order as of this trade report*)
    f_TradeCaptureReport_OrdStatus : fix_ordstatus option;
    f_TradeCaptureReport_SecondaryExecID : string option;
    (** Reason for restatement*)
    f_TradeCaptureReport_ExecRestatementReason : fix_execrestatementreason option;
    (** Indicates if the trade capture report was previously reported to the counterparty*)
    f_TradeCaptureReport_PreviouslyReported : fix_previouslyreported;
    (** Can be used to indicate cabinet trade pricing*)
    f_TradeCaptureReport_PriceType : fix_pricetype option;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_TradeCaptureReport_Instrument : fix_instrument;
    (** Insert here the set of "FinancingDetails" fields defined in "Common Components of Application Messages"*)
    f_TradeCaptureReport_FinancingDetails : fix_financingdetails;
    (** Insert here the set of "OrderQtyData" fields defined in "Common Components of Application Messages"
     Note: OrderQty field is required unless rejecting or an order ack for a CashOrderQty or PercentOrder.*)
    f_TradeCaptureReport_OrderQtyData : fix_orderqtydata;
    f_TradeCaptureReport_QtyType : fix_qtytype option;
    (** Insert here the set of "YieldData" fields defined in "Common Components of Application Messages"*)
    f_TradeCaptureReport_YieldData : fix_yielddata;
    f_TradeCaptureReport_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    f_TradeCaptureReport_UnderlyingTradingSessionID : string option;
    f_TradeCaptureReport_UnderlyingTradingSessionSubID : string option;
    (** Trade Quantity.*)
    f_TradeCaptureReport_LastQty : fix_float_6;
    (** Trade Price.*)
    f_TradeCaptureReport_LastPx : fix_float_6;
    (** Last price expressed in percent-of-par. Conditionally required for Fixed Income trades when LastPx is expressed in Yield, Spread, Discount or any other price type that is not percent-of-par.*)
    f_TradeCaptureReport_LastParPx : fix_float_6 option;
    (** Applicable for F/X orders*)
    f_TradeCaptureReport_LastSpotRate : fix_float_6 option;
    (** Applicable for F/X orders*)
    f_TradeCaptureReport_LastForwardPoints : fix_float_6 option;
    f_TradeCaptureReport_LastMkt : fix_exchange option;
    (** Used when reporting other than current day trades.*)
    f_TradeCaptureReport_TradeDate : fix_localmktdate;
    f_TradeCaptureReport_ClearingBusinessDate : fix_localmktdate option;
    (** Average Price - if present then the LastPx will contain the original price on the execution*)
    f_TradeCaptureReport_AvgPx : fix_float_6 option;
    (** Insert here the set of "SpreadOrBenchmarkCurveData" fields defined in "Common Components of Application Messages"*)
    f_TradeCaptureReport_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    (** Average Pricing indicator*)
    f_TradeCaptureReport_AvgPxIndicator : fix_avgpxindicator option;
    (** Insert here here the set of "Position Amount Data" fields defined in "Common Components of Application Messages"*)
    f_TradeCaptureReport_PositionAmountData : fix_rg_positionamountdata;
    (** Type of report if multileg instrument.
     Provided to support a scenario for trades of multileg instruments between two parties.*)
    f_TradeCaptureReport_MultiLegReportingType : fix_multilegreportingtype option;
    (** Reference to the leg of a multileg instrument to which this trade refers
     Used when MultiLegReportingType = 2 (Single Leg of a Multileg security)*)
    f_TradeCaptureReport_TradeLegRefID : string option;
    (** Number of legs
     Identifies a Multi-leg Execution if present and non-zero.*)
    f_TradeCaptureReport_TrdInstrmtLegGrp : fix_rg_trdinstrmtleggrp;
    (** Time the transaction represented by this Trade Capture Report occurred*)
    f_TradeCaptureReport_TransactTime : fix_utctimestamp;
    f_TradeCaptureReport_TrdRegTimestamps : fix_rg_trdregtimestamps;
    f_TradeCaptureReport_SettlType : fix_settltype option;
    (** Takes precedence over SettlType value and conditionally required/omitted for specific SettlType values.*)
    f_TradeCaptureReport_SettlDate : fix_localmktdate option;
    f_TradeCaptureReport_MatchStatus : fix_matchstatus option;
    f_TradeCaptureReport_MatchType : fix_matchtype option;
    (** Number of sides*)
    f_TradeCaptureReport_TrdCapRptSideGrp : fix_rg_trdcaprptsidegrp;
    (** Indicates drop copy.*)
    f_TradeCaptureReport_CopyMsgIndicator : bool option;
    f_TradeCaptureReport_PublishTrdIndicator : fix_publishtrdindicator option;
    f_TradeCaptureReport_ShortSaleReason : fix_shortsalereason option
}
;;

(** The Trade Capture Report Ack message can be:
 • Used to acknowledge trade capture reports received from a counterparty
 • Used to reject a trade capture report received from a counterparty*)
type full_fix_tradecapturereportack_data = {
    (** Unique identifier for the Trade Capture Report*)
    f_TradeCaptureReportAck_TradeReportID : string;
    (** Identifies Trade Report message transaction type.*)
    f_TradeCaptureReportAck_TradeReportTransType : int option;
    (** Indicates action to take on trade*)
    f_TradeCaptureReportAck_TradeReportType : fix_tradereporttype option;
    f_TradeCaptureReportAck_TrdType : fix_trdtype option;
    f_TradeCaptureReportAck_TrdSubType : int option;
    f_TradeCaptureReportAck_SecondaryTrdType : int option;
    f_TradeCaptureReportAck_TransferReason : string option;
    (** Type of Execution being reported:
     Uses subset of ExecType for Trade Capture Reports*)
    f_TradeCaptureReportAck_ExecType : fix_exectype;
    (** The TradeReportID that is being referenced for some action, such as correction or cancellation*)
    f_TradeCaptureReportAck_TradeReportRefID : string option;
    (** The SecondaryTradeReportID that is being referenced for some action, such as correction or cancellation*)
    f_TradeCaptureReportAck_SecondaryTradeReportRefID : string option;
    (** Status of Trade Report*)
    f_TradeCaptureReportAck_TrdRptStatus : fix_trdrptstatus option;
    (** Reason for Rejection of Trade Report*)
    f_TradeCaptureReportAck_TradeReportRejectReason : fix_tradereportrejectreason option;
    f_TradeCaptureReportAck_SecondaryTradeReportID : string option;
    (** Used to subscribe / unsubscribe for trade capture reports
     If the field is absent, the value 0 will be the default*)
    f_TradeCaptureReportAck_SubscriptionRequestType : fix_subscriptionrequesttype option;
    (** Used to associate a group of trades together. Useful for average price calculations.*)
    f_TradeCaptureReportAck_TradeLinkID : string option;
    f_TradeCaptureReportAck_TrdMatchID : string option;
    (** Exchanged assigned Execution ID (Trade Identifier)*)
    f_TradeCaptureReportAck_ExecID : string option;
    f_TradeCaptureReportAck_SecondaryExecID : string option;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_TradeCaptureReportAck_Instrument : fix_instrument;
    (** Time ACK was issued by matching system, trading system or counterparty*)
    f_TradeCaptureReportAck_TransactTime : fix_utctimestamp option;
    f_TradeCaptureReportAck_TrdRegTimestamps : fix_rg_trdregtimestamps;
    (** Ability to specify whether the response to the request should be delivered inband or via pre-arranged out-of-band transport.*)
    f_TradeCaptureReportAck_ResponseTransportType : fix_responsetransporttype option;
    (** URI destination name. Used if ResponseTransportType is out-of-band.*)
    f_TradeCaptureReportAck_ResponseDestination : string option;
    (** May be used by the executing market to record any execution Details that are particular to that market*)
    f_TradeCaptureReportAck_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_TradeCaptureReportAck_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_TradeCaptureReportAck_EncodedText : string option;
    (** Number of legs
     Identifies a Multi-leg Execution if present and non-zero.*)
    f_TradeCaptureReportAck_TrdInstrmtLegGrp : fix_rg_trdinstrmtleggrp;
    f_TradeCaptureReportAck_ClearingFeeIndicator : fix_clearingfeeindicator option;
    (** The capacity of the participant for this trade (principal or agent for example).*)
    f_TradeCaptureReportAck_OrderCapacity : fix_ordercapacity option;
    (** Restrictions associated with the participant and their capacity for this trade.*)
    f_TradeCaptureReportAck_OrderRestrictions : fix_orderrestrictions option;
    (** The customer capacity for this trade*)
    f_TradeCaptureReportAck_CustOrderCapacity : fix_custordercapacity option;
    (** Required for executions against electronically submitted orders which were assigned an account by the institution or intermediary*)
    f_TradeCaptureReportAck_Account : string option;
    f_TradeCaptureReportAck_AcctIDSource : fix_acctidsource option;
    (** Specifies type of account*)
    f_TradeCaptureReportAck_AccountType : fix_accounttype option;
    (** For use in derivatives omnibus accounting*)
    f_TradeCaptureReportAck_PositionEffect : fix_positioneffect option;
    f_TradeCaptureReportAck_PreallocMethod : fix_preallocmethod option;
    (** Number of repeating groups for trade allocation*)
    f_TradeCaptureReportAck_TrdAllocGrp : fix_rg_trdallocgrp
}
;;

(** Trade Capture Reporting allows sell-side firms (broker, exchange, ECN) to provide timely reporting of completed trades to an external entity not involved in the execution of the trade.*)
type full_fix_tradecapturereportrequest_data = {
    (** Identifier for the trade request*)
    f_TradeCaptureReportRequest_TradeRequestID : string;
    f_TradeCaptureReportRequest_TradeRequestType : fix_traderequesttype;
    (** Used to subscribe / unsubscribe for trade capture reports
     If the field is absent, the value 0 will be the default (snapshot only - no subscription)*)
    f_TradeCaptureReportRequest_SubscriptionRequestType : fix_subscriptionrequesttype option;
    (** To request a specific trade report*)
    f_TradeCaptureReportRequest_TradeReportID : string option;
    (** To request a specific trade report*)
    f_TradeCaptureReportRequest_SecondaryTradeReportID : string option;
    f_TradeCaptureReportRequest_ExecID : string option;
    (** To requst all trades of a specific execution type*)
    f_TradeCaptureReportRequest_ExecType : fix_exectype option;
    f_TradeCaptureReportRequest_OrderID : string option;
    f_TradeCaptureReportRequest_ClOrdID : string option;
    f_TradeCaptureReportRequest_MatchStatus : fix_matchstatus option;
    (** To request all trades of a specific trade type*)
    f_TradeCaptureReportRequest_TrdType : fix_trdtype option;
    (** To request all trades of a specific trade sub type*)
    f_TradeCaptureReportRequest_TrdSubType : int option;
    (** To request all trades for a specific transfer reason*)
    f_TradeCaptureReportRequest_TransferReason : string option;
    (** To request all trades of a specific trade sub type*)
    f_TradeCaptureReportRequest_SecondaryTrdType : int option;
    (** To request all trades of a specific trade link id*)
    f_TradeCaptureReportRequest_TradeLinkID : string option;
    (** To request a trade matching a specific TrdMatchID*)
    f_TradeCaptureReportRequest_TrdMatchID : string option;
    (** Used to specify the parties for the trades to be returned (clearing firm, execution broker, trader id, etc.)
     ExecutingBroker
     ClearingFirm
     ContraBroker
     ContraClearingFirm
     SettlementLocation - depository, CSD, or other settlement party
     ExecutingTrader
     InitiatingTrader
     OrderOriginator*)
    f_TradeCaptureReportRequest_Parties : fix_rg_parties;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_TradeCaptureReportRequest_Instrument : fix_instrument;
    (** Insert here the set of "InstrumentExtension" fields defined in "Common Components of Application Messages"*)
    f_TradeCaptureReportRequest_InstrumentExtension : fix_instrumentextension;
    (** Insert here the set of "FinancingDetails" fields defined in "Common Components of Application Messages"*)
    f_TradeCaptureReportRequest_FinancingDetails : fix_financingdetails;
    (** Indicates number of repeating entries.
     ** Nested Repeating Group follows ***)
    f_TradeCaptureReportRequest_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    (** Indicates number of repeating entries.
     ** Nested Repeating Group follows ***)
    f_TradeCaptureReportRequest_InstrmtLegGrp : fix_rg_instrmtleggrp;
    (** Number of date ranges provided (must be 1 or 2 if specified)*)
    f_TradeCaptureReportRequest_TrdCapDtGrp : fix_rg_trdcapdtgrp;
    (** To request trades for a specific clearing business date.*)
    f_TradeCaptureReportRequest_ClearingBusinessDate : fix_localmktdate option;
    (** To request trades for a specific trading session.*)
    f_TradeCaptureReportRequest_TradingSessionID : string option;
    (** To request trades for a specific trading session.*)
    f_TradeCaptureReportRequest_TradingSessionSubID : string option;
    (** To request trades within a specific time bracket.*)
    f_TradeCaptureReportRequest_TimeBracket : string option;
    (** To request trades for a specific side of a trade.*)
    f_TradeCaptureReportRequest_Side : fix_side option;
    (** Used to indicate if trades are to be returned for the individual legs of a multileg instrument or for the overall instrument.*)
    f_TradeCaptureReportRequest_MultiLegReportingType : fix_multilegreportingtype option;
    (** To requests trades that were submitted from a specific trade input source.*)
    f_TradeCaptureReportRequest_TradeInputSource : string option;
    (** To request trades that were submitted from a specific trade input device.*)
    f_TradeCaptureReportRequest_TradeInputDevice : string option;
    (** Ability to specify whether the response to the request should be delivered inband or via pre-arranged out-of-band transport.*)
    f_TradeCaptureReportRequest_ResponseTransportType : fix_responsetransporttype option;
    (** URI destination name. Used if ResponseTransportType is out-of-band.*)
    f_TradeCaptureReportRequest_ResponseDestination : string option;
    (** Used to match specific values within Text fields*)
    f_TradeCaptureReportRequest_Text : string option;
    f_TradeCaptureReportRequest_EncodedTextLen : int option;
    f_TradeCaptureReportRequest_EncodedText : string option
}
;;

(** The Trade Capture Request Ack message is used to:
 • Provide an acknowledgement to a Trade Capture Report Request in the case where the Trade Capture Report Request is used to specify a subscription or delivery of reports via an out-of-band ResponseTransmissionMethod.
 • Provide an acknowledgement to a Trade Capture Report Request in the case when the return of the Trade Capture Reports matching that request will be delayed or delivered asynchronously. This is useful in distributed trading system environments.
 • Indicate that no trades were found that matched the selection criteria specified on the Trade Capture Report Request
 • The Trade Capture Request was invalid for some business reason, such as request is not authorized, invalid or unknown instrument, party, trading session, etc.*)
type full_fix_tradecapturereportrequestack_data = {
    (** Identifier for the trade request*)
    f_TradeCaptureReportRequestAck_TradeRequestID : string;
    f_TradeCaptureReportRequestAck_TradeRequestType : fix_traderequesttype;
    (** Used to subscribe / unsubscribe for trade capture reports
     If the field is absent, the value 0 will be the default*)
    f_TradeCaptureReportRequestAck_SubscriptionRequestType : fix_subscriptionrequesttype option;
    (** Number of trade reports returned*)
    f_TradeCaptureReportRequestAck_TotNumTradeReports : int option;
    (** Result of Trade Request*)
    f_TradeCaptureReportRequestAck_TradeRequestResult : fix_traderequestresult;
    (** Status of Trade Request*)
    f_TradeCaptureReportRequestAck_TradeRequestStatus : fix_traderequeststatus;
    (** Insert here the set of "Instrument" (symbology) fields defined in "Common Components of Application Messages"*)
    f_TradeCaptureReportRequestAck_Instrument : fix_instrument;
    f_TradeCaptureReportRequestAck_UndInstrmtGrp : fix_rg_undinstrmtgrp;
    (** Number of legs
     NoLegs > 0 identifies a Multi-leg Execution*)
    f_TradeCaptureReportRequestAck_InstrmtLegGrp : fix_rg_instrmtleggrp;
    (** Specify type of multileg reporting to be returned.*)
    f_TradeCaptureReportRequestAck_MultiLegReportingType : fix_multilegreportingtype option;
    (** Ability to specify whether the response to the request should be delivered inband or via pre-arranged out-of-band transport.*)
    f_TradeCaptureReportRequestAck_ResponseTransportType : fix_responsetransporttype option;
    (** URI destination name. Used if ResponseTransportType is out-of-band.*)
    f_TradeCaptureReportRequestAck_ResponseDestination : string option;
    (** May be used by the executing market to record any execution Details that are particular to that market*)
    f_TradeCaptureReportRequestAck_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_TradeCaptureReportRequestAck_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_TradeCaptureReportRequestAck_EncodedText : string option
}
;;

(** The Trading Session Status provides information on the status of a market.*)
type full_fix_tradingsessionstatus_data = {
    (** Provided for a response to a specific Trading Session Status Request message (snapshot).*)
    f_TradingSessionStatus_TradSesReqID : string option;
    (** Identifier for Trading Session*)
    f_TradingSessionStatus_TradingSessionID : string;
    f_TradingSessionStatus_TradingSessionSubID : string option;
    (** Method of trading:*)
    f_TradingSessionStatus_TradSesMethod : fix_tradsesmethod option;
    (** Trading Session Mode*)
    f_TradingSessionStatus_TradSesMode : fix_tradsesmode option;
    (** Set to 'Y' if message is sent unsolicited as a result of a previous subscription request.*)
    f_TradingSessionStatus_UnsolicitedIndicator : fix_unsolicitedindicator option;
    (** State of the trading session*)
    f_TradingSessionStatus_TradSesStatus : fix_tradsesstatus;
    (** Use with TradSesStatus = "Request Rejected"*)
    f_TradingSessionStatus_TradSesStatusRejReason : fix_tradsesstatusrejreason option;
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
    f_TradingSessionStatus_TotalVolumeTraded : fix_float_6 option;
    f_TradingSessionStatus_Text : string option;
    (** Must be set if EncodedText field is specified and must immediately precede it.*)
    f_TradingSessionStatus_EncodedTextLen : int option;
    (** Encoded (non-ASCII characters) representation of the Text field in the encoded format specified via the MessageEncoding field.*)
    f_TradingSessionStatus_EncodedText : string option
}
;;

(** The Trading Session Status Request is used to request information on the status of a market.*)
type full_fix_tradingsessionstatusrequest_data = {
    (** Must be unique, or the ID of previous Trading Session Status Request to disable if SubscriptionRequestType = Disable previous Snapshot + Updates Request (2).*)
    f_TradingSessionStatusRequest_TradSesReqID : string;
    (** Trading Session for which status is being requested*)
    f_TradingSessionStatusRequest_TradingSessionID : string option;
    f_TradingSessionStatusRequest_TradingSessionSubID : string option;
    (** Method of trading*)
    f_TradingSessionStatusRequest_TradSesMethod : fix_tradsesmethod option;
    (** Trading Session Mode*)
    f_TradingSessionStatusRequest_TradSesMode : fix_tradsesmode option;
    f_TradingSessionStatusRequest_SubscriptionRequestType : fix_subscriptionrequesttype
}
;;

type full_fix_userrequest_data = {
    f_UserRequest_UserRequestID : string;
    f_UserRequest_UserRequestType : fix_userrequesttype;
    f_UserRequest_Username : string;
    f_UserRequest_Password : string option;
    f_UserRequest_NewPassword : string option;
    f_UserRequest_RawDataLength : int option;
    (** Can be used to hand structures etc to other API’s etc*)
    f_UserRequest_RawData : string option
}
;;

type full_fix_userresponse_data = {
    f_UserResponse_UserRequestID : string;
    f_UserResponse_Username : string;
    f_UserResponse_UserStatus : fix_userstatus option;
    (** Reason a request was not carried out*)
    f_UserResponse_UserStatusText : string option
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
    | FIX_Full_Msg_NetworkCounterpartySystemStatusRequest of full_fix_networkcounterpartysystemstatusrequest_data
    | FIX_Full_Msg_NetworkCounterpartySystemStatusResponse of full_fix_networkcounterpartysystemstatusresponse_data
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
    | FIX_Full_Msg_SettlementInstructionRequest of full_fix_settlementinstructionrequest_data
    | FIX_Full_Msg_SettlementInstructions of full_fix_settlementinstructions_data
    | FIX_Full_Msg_TradeCaptureReport of full_fix_tradecapturereport_data
    | FIX_Full_Msg_TradeCaptureReportAck of full_fix_tradecapturereportack_data
    | FIX_Full_Msg_TradeCaptureReportRequest of full_fix_tradecapturereportrequest_data
    | FIX_Full_Msg_TradeCaptureReportRequestAck of full_fix_tradecapturereportrequestack_data
    | FIX_Full_Msg_TradingSessionStatus of full_fix_tradingsessionstatus_data
    | FIX_Full_Msg_TradingSessionStatusRequest of full_fix_tradingsessionstatusrequest_data
    | FIX_Full_Msg_UserRequest of full_fix_userrequest_data
    | FIX_Full_Msg_UserResponse of full_fix_userresponse_data
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
        | FIX_Full_Msg_NetworkCounterpartySystemStatusRequest _ -> Full_Msg_NetworkCounterpartySystemStatusRequest_Tag
        | FIX_Full_Msg_NetworkCounterpartySystemStatusResponse _ -> Full_Msg_NetworkCounterpartySystemStatusResponse_Tag
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
        | FIX_Full_Msg_SettlementInstructionRequest _ -> Full_Msg_SettlementInstructionRequest_Tag
        | FIX_Full_Msg_SettlementInstructions _ -> Full_Msg_SettlementInstructions_Tag
        | FIX_Full_Msg_TradeCaptureReport _ -> Full_Msg_TradeCaptureReport_Tag
        | FIX_Full_Msg_TradeCaptureReportAck _ -> Full_Msg_TradeCaptureReportAck_Tag
        | FIX_Full_Msg_TradeCaptureReportRequest _ -> Full_Msg_TradeCaptureReportRequest_Tag
        | FIX_Full_Msg_TradeCaptureReportRequestAck _ -> Full_Msg_TradeCaptureReportRequestAck_Tag
        | FIX_Full_Msg_TradingSessionStatus _ -> Full_Msg_TradingSessionStatus_Tag
        | FIX_Full_Msg_TradingSessionStatusRequest _ -> Full_Msg_TradingSessionStatusRequest_Tag
        | FIX_Full_Msg_UserRequest _ -> Full_Msg_UserRequest_Tag
        | FIX_Full_Msg_UserResponse _ -> Full_Msg_UserResponse_Tag
    )
;;
