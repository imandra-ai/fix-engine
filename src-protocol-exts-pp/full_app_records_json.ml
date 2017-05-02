(* @meta[imandra_ignore] on @end *)
open Yojson;;
open Full_app_records;;
open Base_types_json;;
open Datetime_json;;
open Full_app_records;;
open Full_app_enums_json;;
(* @meta[imandra_ignore] off @end *)

let assoc_filter_nulls l : json =
    `Assoc ( List.filter (function ( _, `Null ) -> false | _ -> true ) l )
;;

let evntgrp_to_json x : json =
    assoc_filter_nulls [
    ( "EventDate" , localmktdate_opt_to_json x.f_EvntGrp_EventDate );
    ( "EventPx" , float_opt_to_json x.f_EvntGrp_EventPx );
    ( "EventText" , string_opt_to_json x.f_EvntGrp_EventText );
    ( "EventType" , eventtype_opt_to_json x.f_EvntGrp_EventType );
    ( "NoEvents" , int_opt_to_json x.f_EvntGrp_NoEvents )
    ]
;;

let secaltidgrp_to_json x : json =
    assoc_filter_nulls [
    ( "NoSecurityAltID" , int_opt_to_json x.f_SecAltIDGrp_NoSecurityAltID );
    ( "SecurityAltID" , string_opt_to_json x.f_SecAltIDGrp_SecurityAltID );
    ( "SecurityAltIDSource" , string_opt_to_json x.f_SecAltIDGrp_SecurityAltIDSource )
    ]
;;

let legsecaltidgrp_to_json x : json =
    assoc_filter_nulls [
    ( "LegSecurityAltID" , string_opt_to_json x.f_LegSecAltIDGrp_LegSecurityAltID );
    ( "LegSecurityAltIDSource" , string_opt_to_json x.f_LegSecAltIDGrp_LegSecurityAltIDSource );
    ( "NoLegSecurityAltID" , int_opt_to_json x.f_LegSecAltIDGrp_NoLegSecurityAltID )
    ]
;;

let instrumentleg_to_json x : json =
    assoc_filter_nulls [
    ( "EncodedLegIssuer" , string_opt_to_json x.f_InstrumentLeg_EncodedLegIssuer );
    ( "EncodedLegIssuerLen" , int_opt_to_json x.f_InstrumentLeg_EncodedLegIssuerLen );
    ( "EncodedLegSecurityDesc" , string_opt_to_json x.f_InstrumentLeg_EncodedLegSecurityDesc );
    ( "EncodedLegSecurityDescLen" , int_opt_to_json x.f_InstrumentLeg_EncodedLegSecurityDescLen );
    ( "LegCFICode" , string_opt_to_json x.f_InstrumentLeg_LegCFICode );
    ( "LegContractMultiplier" , float_opt_to_json x.f_InstrumentLeg_LegContractMultiplier );
    ( "LegContractSettlMonth" , monthyear_opt_to_json x.f_InstrumentLeg_LegContractSettlMonth );
    ( "LegCountryOfIssue" , country_opt_to_json x.f_InstrumentLeg_LegCountryOfIssue );
    ( "LegCouponPaymentDate" , localmktdate_opt_to_json x.f_InstrumentLeg_LegCouponPaymentDate );
    ( "LegCouponRate" , float_opt_to_json x.f_InstrumentLeg_LegCouponRate );
    ( "LegCreditRating" , string_opt_to_json x.f_InstrumentLeg_LegCreditRating );
    ( "LegCurrency" , currency_opt_to_json x.f_InstrumentLeg_LegCurrency );
    ( "LegDatedDate" , localmktdate_opt_to_json x.f_InstrumentLeg_LegDatedDate );
    ( "LegFactor" , float_opt_to_json x.f_InstrumentLeg_LegFactor );
    ( "LegInstrRegistry" , string_opt_to_json x.f_InstrumentLeg_LegInstrRegistry );
    ( "LegInterestAccrualDate" , localmktdate_opt_to_json x.f_InstrumentLeg_LegInterestAccrualDate );
    ( "LegIssueDate" , localmktdate_opt_to_json x.f_InstrumentLeg_LegIssueDate );
    ( "LegIssuer" , string_opt_to_json x.f_InstrumentLeg_LegIssuer );
    ( "LegLocaleOfIssue" , string_opt_to_json x.f_InstrumentLeg_LegLocaleOfIssue );
    ( "LegMaturityDate" , localmktdate_opt_to_json x.f_InstrumentLeg_LegMaturityDate );
    ( "LegMaturityMonthYear" , monthyear_opt_to_json x.f_InstrumentLeg_LegMaturityMonthYear );
    ( "LegOptAttribute" , char_opt_to_json x.f_InstrumentLeg_LegOptAttribute );
    ( "LegPool" , string_opt_to_json x.f_InstrumentLeg_LegPool );
    ( "LegProduct" , int_opt_to_json x.f_InstrumentLeg_LegProduct );
    ( "LegRatioQty" , float_opt_to_json x.f_InstrumentLeg_LegRatioQty );
    ( "LegRedemptionDate" , localmktdate_opt_to_json x.f_InstrumentLeg_LegRedemptionDate );
    ( "LegRepoCollateralSecurityType" , string_opt_to_json x.f_InstrumentLeg_LegRepoCollateralSecurityType );
    ( "LegRepurchaseRate" , float_opt_to_json x.f_InstrumentLeg_LegRepurchaseRate );
    ( "LegRepurchaseTerm" , int_opt_to_json x.f_InstrumentLeg_LegRepurchaseTerm );
    ( "LegSecurityDesc" , string_opt_to_json x.f_InstrumentLeg_LegSecurityDesc );
    ( "LegSecurityExchange" , exchange_opt_to_json x.f_InstrumentLeg_LegSecurityExchange );
    ( "LegSecurityID" , string_opt_to_json x.f_InstrumentLeg_LegSecurityID );
    ( "LegSecurityIDSource" , string_opt_to_json x.f_InstrumentLeg_LegSecurityIDSource );
    ( "LegSecuritySubType" , string_opt_to_json x.f_InstrumentLeg_LegSecuritySubType );
    ( "LegSecurityType" , string_opt_to_json x.f_InstrumentLeg_LegSecurityType );
    ( "LegSide" , char_opt_to_json x.f_InstrumentLeg_LegSide );
    ( "LegStateOrProvinceOfIssue" , string_opt_to_json x.f_InstrumentLeg_LegStateOrProvinceOfIssue );
    ( "LegStrikeCurrency" , currency_opt_to_json x.f_InstrumentLeg_LegStrikeCurrency );
    ( "LegStrikePrice" , float_opt_to_json x.f_InstrumentLeg_LegStrikePrice );
    ( "LegSymbol" , string_opt_to_json x.f_InstrumentLeg_LegSymbol );
    ( "LegSymbolSfx" , string_opt_to_json x.f_InstrumentLeg_LegSymbolSfx );
    ( "LegSecAltIDGrp" , legsecaltidgrp_to_json x.f_InstrumentLeg_LegSecAltIDGrp )
    ]
;;

let undsecaltidgrp_to_json x : json =
    assoc_filter_nulls [
    ( "NoUnderlyingSecurityAltID" , int_opt_to_json x.f_UndSecAltIDGrp_NoUnderlyingSecurityAltID );
    ( "UnderlyingSecurityAltID" , string_opt_to_json x.f_UndSecAltIDGrp_UnderlyingSecurityAltID );
    ( "UnderlyingSecurityAltIDSource" , string_opt_to_json x.f_UndSecAltIDGrp_UnderlyingSecurityAltIDSource )
    ]
;;

let underlyingstipulations_to_json x : json =
    assoc_filter_nulls [
    ( "NoUnderlyingStips" , int_opt_to_json x.f_UnderlyingStipulations_NoUnderlyingStips );
    ( "UnderlyingStipType" , string_opt_to_json x.f_UnderlyingStipulations_UnderlyingStipType );
    ( "UnderlyingStipValue" , string_opt_to_json x.f_UnderlyingStipulations_UnderlyingStipValue )
    ]
;;

let underlyinginstrument_to_json x : json =
    assoc_filter_nulls [
    ( "EncodedUnderlyingIssuer" , string_opt_to_json x.f_UnderlyingInstrument_EncodedUnderlyingIssuer );
    ( "EncodedUnderlyingIssuerLen" , int_opt_to_json x.f_UnderlyingInstrument_EncodedUnderlyingIssuerLen );
    ( "EncodedUnderlyingSecurityDesc" , string_opt_to_json x.f_UnderlyingInstrument_EncodedUnderlyingSecurityDesc );
    ( "EncodedUnderlyingSecurityDescLen" , int_opt_to_json x.f_UnderlyingInstrument_EncodedUnderlyingSecurityDescLen );
    ( "UnderlyingCFICode" , string_opt_to_json x.f_UnderlyingInstrument_UnderlyingCFICode );
    ( "UnderlyingCPProgram" , string_opt_to_json x.f_UnderlyingInstrument_UnderlyingCPProgram );
    ( "UnderlyingCPRegType" , string_opt_to_json x.f_UnderlyingInstrument_UnderlyingCPRegType );
    ( "UnderlyingContractMultiplier" , float_opt_to_json x.f_UnderlyingInstrument_UnderlyingContractMultiplier );
    ( "UnderlyingCountryOfIssue" , country_opt_to_json x.f_UnderlyingInstrument_UnderlyingCountryOfIssue );
    ( "UnderlyingCouponPaymentDate" , localmktdate_opt_to_json x.f_UnderlyingInstrument_UnderlyingCouponPaymentDate );
    ( "UnderlyingCouponRate" , float_opt_to_json x.f_UnderlyingInstrument_UnderlyingCouponRate );
    ( "UnderlyingCreditRating" , string_opt_to_json x.f_UnderlyingInstrument_UnderlyingCreditRating );
    ( "UnderlyingCurrency" , currency_opt_to_json x.f_UnderlyingInstrument_UnderlyingCurrency );
    ( "UnderlyingCurrentValue" , float_opt_to_json x.f_UnderlyingInstrument_UnderlyingCurrentValue );
    ( "UnderlyingDirtyPrice" , float_opt_to_json x.f_UnderlyingInstrument_UnderlyingDirtyPrice );
    ( "UnderlyingEndPrice" , float_opt_to_json x.f_UnderlyingInstrument_UnderlyingEndPrice );
    ( "UnderlyingEndValue" , float_opt_to_json x.f_UnderlyingInstrument_UnderlyingEndValue );
    ( "UnderlyingFactor" , float_opt_to_json x.f_UnderlyingInstrument_UnderlyingFactor );
    ( "UnderlyingInstrRegistry" , string_opt_to_json x.f_UnderlyingInstrument_UnderlyingInstrRegistry );
    ( "UnderlyingIssueDate" , localmktdate_opt_to_json x.f_UnderlyingInstrument_UnderlyingIssueDate );
    ( "UnderlyingIssuer" , string_opt_to_json x.f_UnderlyingInstrument_UnderlyingIssuer );
    ( "UnderlyingLocaleOfIssue" , string_opt_to_json x.f_UnderlyingInstrument_UnderlyingLocaleOfIssue );
    ( "UnderlyingMaturityDate" , localmktdate_opt_to_json x.f_UnderlyingInstrument_UnderlyingMaturityDate );
    ( "UnderlyingMaturityMonthYear" , monthyear_opt_to_json x.f_UnderlyingInstrument_UnderlyingMaturityMonthYear );
    ( "UnderlyingOptAttribute" , char_opt_to_json x.f_UnderlyingInstrument_UnderlyingOptAttribute );
    ( "UnderlyingProduct" , int_opt_to_json x.f_UnderlyingInstrument_UnderlyingProduct );
    ( "UnderlyingPutOrCall" , int_opt_to_json x.f_UnderlyingInstrument_UnderlyingPutOrCall );
    ( "UnderlyingPx" , float_opt_to_json x.f_UnderlyingInstrument_UnderlyingPx );
    ( "UnderlyingQty" , float_opt_to_json x.f_UnderlyingInstrument_UnderlyingQty );
    ( "UnderlyingRedemptionDate" , localmktdate_opt_to_json x.f_UnderlyingInstrument_UnderlyingRedemptionDate );
    ( "UnderlyingRepoCollateralSecurityType" , string_opt_to_json x.f_UnderlyingInstrument_UnderlyingRepoCollateralSecurityType );
    ( "UnderlyingRepurchaseRate" , float_opt_to_json x.f_UnderlyingInstrument_UnderlyingRepurchaseRate );
    ( "UnderlyingRepurchaseTerm" , int_opt_to_json x.f_UnderlyingInstrument_UnderlyingRepurchaseTerm );
    ( "UnderlyingSecurityDesc" , string_opt_to_json x.f_UnderlyingInstrument_UnderlyingSecurityDesc );
    ( "UnderlyingSecurityExchange" , exchange_opt_to_json x.f_UnderlyingInstrument_UnderlyingSecurityExchange );
    ( "UnderlyingSecurityID" , string_opt_to_json x.f_UnderlyingInstrument_UnderlyingSecurityID );
    ( "UnderlyingSecurityIDSource" , string_opt_to_json x.f_UnderlyingInstrument_UnderlyingSecurityIDSource );
    ( "UnderlyingSecuritySubType" , string_opt_to_json x.f_UnderlyingInstrument_UnderlyingSecuritySubType );
    ( "UnderlyingSecurityType" , string_opt_to_json x.f_UnderlyingInstrument_UnderlyingSecurityType );
    ( "UnderlyingStartValue" , float_opt_to_json x.f_UnderlyingInstrument_UnderlyingStartValue );
    ( "UnderlyingStateOrProvinceOfIssue" , string_opt_to_json x.f_UnderlyingInstrument_UnderlyingStateOrProvinceOfIssue );
    ( "UnderlyingStrikeCurrency" , currency_opt_to_json x.f_UnderlyingInstrument_UnderlyingStrikeCurrency );
    ( "UnderlyingStrikePrice" , float_opt_to_json x.f_UnderlyingInstrument_UnderlyingStrikePrice );
    ( "UnderlyingSymbol" , string_opt_to_json x.f_UnderlyingInstrument_UnderlyingSymbol );
    ( "UnderlyingSymbolSfx" , string_opt_to_json x.f_UnderlyingInstrument_UnderlyingSymbolSfx );
    ( "UndSecAltIDGrp" , undsecaltidgrp_to_json x.f_UnderlyingInstrument_UndSecAltIDGrp );
    ( "UnderlyingStipulations" , underlyingstipulations_to_json x.f_UnderlyingInstrument_UnderlyingStipulations )
    ]
;;

let instrument_to_json x : json =
    assoc_filter_nulls [
    ( "CFICode" , string_opt_to_json x.f_Instrument_CFICode );
    ( "CPProgram" , cpprogram_opt_to_json x.f_Instrument_CPProgram );
    ( "CPRegType" , string_opt_to_json x.f_Instrument_CPRegType );
    ( "ContractMultiplier" , float_opt_to_json x.f_Instrument_ContractMultiplier );
    ( "ContractSettlMonth" , monthyear_opt_to_json x.f_Instrument_ContractSettlMonth );
    ( "CountryOfIssue" , country_opt_to_json x.f_Instrument_CountryOfIssue );
    ( "CouponPaymentDate" , localmktdate_opt_to_json x.f_Instrument_CouponPaymentDate );
    ( "CouponRate" , float_opt_to_json x.f_Instrument_CouponRate );
    ( "CreditRating" , string_opt_to_json x.f_Instrument_CreditRating );
    ( "DatedDate" , localmktdate_opt_to_json x.f_Instrument_DatedDate );
    ( "EncodedIssuer" , string_opt_to_json x.f_Instrument_EncodedIssuer );
    ( "EncodedIssuerLen" , int_opt_to_json x.f_Instrument_EncodedIssuerLen );
    ( "EncodedSecurityDesc" , string_opt_to_json x.f_Instrument_EncodedSecurityDesc );
    ( "EncodedSecurityDescLen" , int_opt_to_json x.f_Instrument_EncodedSecurityDescLen );
    ( "Factor" , float_opt_to_json x.f_Instrument_Factor );
    ( "InstrRegistry" , string_opt_to_json x.f_Instrument_InstrRegistry );
    ( "InterestAccrualDate" , localmktdate_opt_to_json x.f_Instrument_InterestAccrualDate );
    ( "IssueDate" , localmktdate_opt_to_json x.f_Instrument_IssueDate );
    ( "Issuer" , string_opt_to_json x.f_Instrument_Issuer );
    ( "LocaleOfIssue" , string_opt_to_json x.f_Instrument_LocaleOfIssue );
    ( "MaturityDate" , localmktdate_opt_to_json x.f_Instrument_MaturityDate );
    ( "MaturityMonthYear" , monthyear_opt_to_json x.f_Instrument_MaturityMonthYear );
    ( "OptAttribute" , char_opt_to_json x.f_Instrument_OptAttribute );
    ( "Pool" , string_opt_to_json x.f_Instrument_Pool );
    ( "Product" , product_opt_to_json x.f_Instrument_Product );
    ( "PutOrCall" , putorcall_opt_to_json x.f_Instrument_PutOrCall );
    ( "RedemptionDate" , localmktdate_opt_to_json x.f_Instrument_RedemptionDate );
    ( "RepoCollateralSecurityType" , string_opt_to_json x.f_Instrument_RepoCollateralSecurityType );
    ( "RepurchaseRate" , float_opt_to_json x.f_Instrument_RepurchaseRate );
    ( "RepurchaseTerm" , int_opt_to_json x.f_Instrument_RepurchaseTerm );
    ( "SecurityDesc" , string_opt_to_json x.f_Instrument_SecurityDesc );
    ( "SecurityExchange" , exchange_opt_to_json x.f_Instrument_SecurityExchange );
    ( "SecurityID" , string_opt_to_json x.f_Instrument_SecurityID );
    ( "SecurityIDSource" , securityidsource_opt_to_json x.f_Instrument_SecurityIDSource );
    ( "SecuritySubType" , string_opt_to_json x.f_Instrument_SecuritySubType );
    ( "SecurityType" , securitytype_opt_to_json x.f_Instrument_SecurityType );
    ( "StateOrProvinceOfIssue" , string_opt_to_json x.f_Instrument_StateOrProvinceOfIssue );
    ( "StrikeCurrency" , currency_opt_to_json x.f_Instrument_StrikeCurrency );
    ( "StrikePrice" , float_opt_to_json x.f_Instrument_StrikePrice );
    ( "Symbol" , string_opt_to_json x.f_Instrument_Symbol );
    ( "SymbolSfx" , string_opt_to_json x.f_Instrument_SymbolSfx );
    ( "EvntGrp" , evntgrp_to_json x.f_Instrument_EvntGrp );
    ( "SecAltIDGrp" , secaltidgrp_to_json x.f_Instrument_SecAltIDGrp )
    ]
;;

let instrmtleggrp_to_json x : json =
    assoc_filter_nulls [
    ( "NoLegs" , int_opt_to_json x.f_InstrmtLegGrp_NoLegs );
    ( "InstrumentLeg" , instrumentleg_to_json x.f_InstrmtLegGrp_InstrumentLeg )
    ]
;;

let undinstrmtgrp_to_json x : json =
    assoc_filter_nulls [
    ( "NoUnderlyings" , int_opt_to_json x.f_UndInstrmtGrp_NoUnderlyings );
    ( "UnderlyingInstrument" , underlyinginstrument_to_json x.f_UndInstrmtGrp_UnderlyingInstrument )
    ]
;;

let nstdptys2subgrp_to_json x : json =
    assoc_filter_nulls [
    ( "Nested2PartySubID" , string_opt_to_json x.f_NstdPtys2SubGrp_Nested2PartySubID );
    ( "Nested2PartySubIDType" , int_opt_to_json x.f_NstdPtys2SubGrp_Nested2PartySubIDType );
    ( "NoNested2PartySubIDs" , int_opt_to_json x.f_NstdPtys2SubGrp_NoNested2PartySubIDs )
    ]
;;

let nestedparties2_to_json x : json =
    assoc_filter_nulls [
    ( "Nested2PartyID" , string_opt_to_json x.f_NestedParties2_Nested2PartyID );
    ( "Nested2PartyIDSource" , char_opt_to_json x.f_NestedParties2_Nested2PartyIDSource );
    ( "Nested2PartyRole" , int_opt_to_json x.f_NestedParties2_Nested2PartyRole );
    ( "NoNested2PartyIDs" , int_opt_to_json x.f_NestedParties2_NoNested2PartyIDs );
    ( "NstdPtys2SubGrp" , nstdptys2subgrp_to_json x.f_NestedParties2_NstdPtys2SubGrp )
    ]
;;

let attrbgrp_to_json x : json =
    assoc_filter_nulls [
    ( "InstrAttribType" , instrattribtype_opt_to_json x.f_AttrbGrp_InstrAttribType );
    ( "InstrAttribValue" , string_opt_to_json x.f_AttrbGrp_InstrAttribValue );
    ( "NoInstrAttrib" , int_opt_to_json x.f_AttrbGrp_NoInstrAttrib )
    ]
;;

let ptyssubgrp_to_json x : json =
    assoc_filter_nulls [
    ( "NoPartySubIDs" , int_opt_to_json x.f_PtysSubGrp_NoPartySubIDs );
    ( "PartySubID" , string_opt_to_json x.f_PtysSubGrp_PartySubID );
    ( "PartySubIDType" , partysubidtype_opt_to_json x.f_PtysSubGrp_PartySubIDType )
    ]
;;

let nstdptyssubgrp_to_json x : json =
    assoc_filter_nulls [
    ( "NestedPartySubID" , string_opt_to_json x.f_NstdPtysSubGrp_NestedPartySubID );
    ( "NestedPartySubIDType" , int_opt_to_json x.f_NstdPtysSubGrp_NestedPartySubIDType );
    ( "NoNestedPartySubIDs" , int_opt_to_json x.f_NstdPtysSubGrp_NoNestedPartySubIDs )
    ]
;;

let settlptyssubgrp_to_json x : json =
    assoc_filter_nulls [
    ( "NoSettlPartySubIDs" , int_opt_to_json x.f_SettlPtysSubGrp_NoSettlPartySubIDs );
    ( "SettlPartySubID" , string_opt_to_json x.f_SettlPtysSubGrp_SettlPartySubID );
    ( "SettlPartySubIDType" , int_opt_to_json x.f_SettlPtysSubGrp_SettlPartySubIDType )
    ]
;;

let settlparties_to_json x : json =
    assoc_filter_nulls [
    ( "NoSettlPartyIDs" , int_opt_to_json x.f_SettlParties_NoSettlPartyIDs );
    ( "SettlPartyID" , string_opt_to_json x.f_SettlParties_SettlPartyID );
    ( "SettlPartyIDSource" , char_opt_to_json x.f_SettlParties_SettlPartyIDSource );
    ( "SettlPartyRole" , int_opt_to_json x.f_SettlParties_SettlPartyRole );
    ( "SettlPtysSubGrp" , settlptyssubgrp_to_json x.f_SettlParties_SettlPtysSubGrp )
    ]
;;

let dlvyinstgrp_to_json x : json =
    assoc_filter_nulls [
    ( "DlvyInstType" , dlvyinsttype_opt_to_json x.f_DlvyInstGrp_DlvyInstType );
    ( "NoDlvyInst" , int_opt_to_json x.f_DlvyInstGrp_NoDlvyInst );
    ( "SettlInstSource" , settlinstsource_opt_to_json x.f_DlvyInstGrp_SettlInstSource );
    ( "SettlParties" , settlparties_to_json x.f_DlvyInstGrp_SettlParties )
    ]
;;

let clrinstgrp_to_json x : json =
    assoc_filter_nulls [
    ( "ClearingInstruction" , clearinginstruction_opt_to_json x.f_ClrInstGrp_ClearingInstruction );
    ( "NoClearingInstructions" , int_opt_to_json x.f_ClrInstGrp_NoClearingInstructions )
    ]
;;

let commissiondata_to_json x : json =
    assoc_filter_nulls [
    ( "CommCurrency" , currency_opt_to_json x.f_CommissionData_CommCurrency );
    ( "CommType" , commtype_opt_to_json x.f_CommissionData_CommType );
    ( "Commission" , float_opt_to_json x.f_CommissionData_Commission );
    ( "FundRenewWaiv" , fundrenewwaiv_opt_to_json x.f_CommissionData_FundRenewWaiv )
    ]
;;

let miscfeesgrp_to_json x : json =
    assoc_filter_nulls [
    ( "MiscFeeAmt" , float_opt_to_json x.f_MiscFeesGrp_MiscFeeAmt );
    ( "MiscFeeBasis" , miscfeebasis_opt_to_json x.f_MiscFeesGrp_MiscFeeBasis );
    ( "MiscFeeCurr" , currency_opt_to_json x.f_MiscFeesGrp_MiscFeeCurr );
    ( "MiscFeeType" , miscfeetype_opt_to_json x.f_MiscFeesGrp_MiscFeeType );
    ( "NoMiscFees" , int_opt_to_json x.f_MiscFeesGrp_NoMiscFees )
    ]
;;

let nestedparties_to_json x : json =
    assoc_filter_nulls [
    ( "NestedPartyID" , string_opt_to_json x.f_NestedParties_NestedPartyID );
    ( "NestedPartyIDSource" , char_opt_to_json x.f_NestedParties_NestedPartyIDSource );
    ( "NestedPartyRole" , int_opt_to_json x.f_NestedParties_NestedPartyRole );
    ( "NoNestedPartyIDs" , int_opt_to_json x.f_NestedParties_NoNestedPartyIDs );
    ( "NstdPtysSubGrp" , nstdptyssubgrp_to_json x.f_NestedParties_NstdPtysSubGrp )
    ]
;;

let settlinstructionsdata_to_json x : json =
    assoc_filter_nulls [
    ( "SettlDeliveryType" , settldeliverytype_opt_to_json x.f_SettlInstructionsData_SettlDeliveryType );
    ( "StandInstDbID" , string_opt_to_json x.f_SettlInstructionsData_StandInstDbID );
    ( "StandInstDbName" , string_opt_to_json x.f_SettlInstructionsData_StandInstDbName );
    ( "StandInstDbType" , standinstdbtype_opt_to_json x.f_SettlInstructionsData_StandInstDbType );
    ( "DlvyInstGrp" , dlvyinstgrp_to_json x.f_SettlInstructionsData_DlvyInstGrp )
    ]
;;

let ordallocgrp_to_json x : json =
    assoc_filter_nulls [
    ( "ClOrdID" , string_opt_to_json x.f_OrdAllocGrp_ClOrdID );
    ( "ListID" , string_opt_to_json x.f_OrdAllocGrp_ListID );
    ( "NoOrders" , int_opt_to_json x.f_OrdAllocGrp_NoOrders );
    ( "OrderAvgPx" , float_opt_to_json x.f_OrdAllocGrp_OrderAvgPx );
    ( "OrderBookingQty" , float_opt_to_json x.f_OrdAllocGrp_OrderBookingQty );
    ( "OrderID" , string_opt_to_json x.f_OrdAllocGrp_OrderID );
    ( "OrderQty" , float_opt_to_json x.f_OrdAllocGrp_OrderQty );
    ( "SecondaryClOrdID" , string_opt_to_json x.f_OrdAllocGrp_SecondaryClOrdID );
    ( "SecondaryOrderID" , string_opt_to_json x.f_OrdAllocGrp_SecondaryOrderID );
    ( "NestedParties2" , nestedparties2_to_json x.f_OrdAllocGrp_NestedParties2 )
    ]
;;

let execallocgrp_to_json x : json =
    assoc_filter_nulls [
    ( "ExecID" , string_opt_to_json x.f_ExecAllocGrp_ExecID );
    ( "LastCapacity" , lastcapacity_opt_to_json x.f_ExecAllocGrp_LastCapacity );
    ( "LastParPx" , float_opt_to_json x.f_ExecAllocGrp_LastParPx );
    ( "LastPx" , float_opt_to_json x.f_ExecAllocGrp_LastPx );
    ( "LastQty" , float_opt_to_json x.f_ExecAllocGrp_LastQty );
    ( "NoExecs" , int_opt_to_json x.f_ExecAllocGrp_NoExecs );
    ( "SecondaryExecID" , string_opt_to_json x.f_ExecAllocGrp_SecondaryExecID )
    ]
;;

let instrumentextension_to_json x : json =
    assoc_filter_nulls [
    ( "DeliveryForm" , deliveryform_opt_to_json x.f_InstrumentExtension_DeliveryForm );
    ( "PctAtRisk" , float_opt_to_json x.f_InstrumentExtension_PctAtRisk );
    ( "AttrbGrp" , attrbgrp_to_json x.f_InstrumentExtension_AttrbGrp )
    ]
;;

let financingdetails_to_json x : json =
    assoc_filter_nulls [
    ( "AgreementCurrency" , currency_opt_to_json x.f_FinancingDetails_AgreementCurrency );
    ( "AgreementDate" , localmktdate_opt_to_json x.f_FinancingDetails_AgreementDate );
    ( "AgreementDesc" , string_opt_to_json x.f_FinancingDetails_AgreementDesc );
    ( "AgreementID" , string_opt_to_json x.f_FinancingDetails_AgreementID );
    ( "DeliveryType" , deliverytype_opt_to_json x.f_FinancingDetails_DeliveryType );
    ( "EndDate" , localmktdate_opt_to_json x.f_FinancingDetails_EndDate );
    ( "MarginRatio" , float_opt_to_json x.f_FinancingDetails_MarginRatio );
    ( "StartDate" , localmktdate_opt_to_json x.f_FinancingDetails_StartDate );
    ( "TerminationType" , terminationtype_opt_to_json x.f_FinancingDetails_TerminationType )
    ]
;;

let spreadorbenchmarkcurvedata_to_json x : json =
    assoc_filter_nulls [
    ( "BenchmarkCurveCurrency" , currency_opt_to_json x.f_SpreadOrBenchmarkCurveData_BenchmarkCurveCurrency );
    ( "BenchmarkCurveName" , string_opt_to_json x.f_SpreadOrBenchmarkCurveData_BenchmarkCurveName );
    ( "BenchmarkCurvePoint" , string_opt_to_json x.f_SpreadOrBenchmarkCurveData_BenchmarkCurvePoint );
    ( "BenchmarkPrice" , float_opt_to_json x.f_SpreadOrBenchmarkCurveData_BenchmarkPrice );
    ( "BenchmarkPriceType" , int_opt_to_json x.f_SpreadOrBenchmarkCurveData_BenchmarkPriceType );
    ( "BenchmarkSecurityID" , string_opt_to_json x.f_SpreadOrBenchmarkCurveData_BenchmarkSecurityID );
    ( "BenchmarkSecurityIDSource" , string_opt_to_json x.f_SpreadOrBenchmarkCurveData_BenchmarkSecurityIDSource );
    ( "Spread" , float_opt_to_json x.f_SpreadOrBenchmarkCurveData_Spread )
    ]
;;

let parties_to_json x : json =
    assoc_filter_nulls [
    ( "NoPartyIDs" , int_opt_to_json x.f_Parties_NoPartyIDs );
    ( "PartyID" , string_opt_to_json x.f_Parties_PartyID );
    ( "PartyIDSource" , partyidsource_opt_to_json x.f_Parties_PartyIDSource );
    ( "PartyRole" , partyrole_opt_to_json x.f_Parties_PartyRole );
    ( "PtysSubGrp" , ptyssubgrp_to_json x.f_Parties_PtysSubGrp )
    ]
;;

let stipulations_to_json x : json =
    assoc_filter_nulls [
    ( "NoStipulations" , int_opt_to_json x.f_Stipulations_NoStipulations );
    ( "StipulationType" , stipulationtype_opt_to_json x.f_Stipulations_StipulationType );
    ( "StipulationValue" , string_opt_to_json x.f_Stipulations_StipulationValue )
    ]
;;

let yielddata_to_json x : json =
    assoc_filter_nulls [
    ( "Yield" , float_opt_to_json x.f_YieldData_Yield );
    ( "YieldCalcDate" , localmktdate_opt_to_json x.f_YieldData_YieldCalcDate );
    ( "YieldRedemptionDate" , localmktdate_opt_to_json x.f_YieldData_YieldRedemptionDate );
    ( "YieldRedemptionPrice" , float_opt_to_json x.f_YieldData_YieldRedemptionPrice );
    ( "YieldRedemptionPriceType" , int_opt_to_json x.f_YieldData_YieldRedemptionPriceType );
    ( "YieldType" , yieldtype_opt_to_json x.f_YieldData_YieldType )
    ]
;;

let allocgrp_to_json x : json =
    assoc_filter_nulls [
    ( "AllocAccount" , string_opt_to_json x.f_AllocGrp_AllocAccount );
    ( "AllocAccruedInterestAmt" , float_opt_to_json x.f_AllocGrp_AllocAccruedInterestAmt );
    ( "AllocAcctIDSource" , int_opt_to_json x.f_AllocGrp_AllocAcctIDSource );
    ( "AllocAvgPx" , float_opt_to_json x.f_AllocGrp_AllocAvgPx );
    ( "AllocHandlInst" , allochandlinst_opt_to_json x.f_AllocGrp_AllocHandlInst );
    ( "AllocInterestAtMaturity" , float_opt_to_json x.f_AllocGrp_AllocInterestAtMaturity );
    ( "AllocNetMoney" , float_opt_to_json x.f_AllocGrp_AllocNetMoney );
    ( "AllocPrice" , float_opt_to_json x.f_AllocGrp_AllocPrice );
    ( "AllocQty" , float_opt_to_json x.f_AllocGrp_AllocQty );
    ( "AllocSettlCurrAmt" , float_opt_to_json x.f_AllocGrp_AllocSettlCurrAmt );
    ( "AllocSettlCurrency" , currency_opt_to_json x.f_AllocGrp_AllocSettlCurrency );
    ( "AllocSettlInstType" , allocsettlinsttype_opt_to_json x.f_AllocGrp_AllocSettlInstType );
    ( "AllocText" , string_opt_to_json x.f_AllocGrp_AllocText );
    ( "EncodedAllocText" , string_opt_to_json x.f_AllocGrp_EncodedAllocText );
    ( "EncodedAllocTextLen" , int_opt_to_json x.f_AllocGrp_EncodedAllocTextLen );
    ( "IndividualAllocID" , string_opt_to_json x.f_AllocGrp_IndividualAllocID );
    ( "MatchStatus" , matchstatus_opt_to_json x.f_AllocGrp_MatchStatus );
    ( "NoAllocs" , int_opt_to_json x.f_AllocGrp_NoAllocs );
    ( "NotifyBrokerOfCredit" , notifybrokerofcredit_opt_to_json x.f_AllocGrp_NotifyBrokerOfCredit );
    ( "ProcessCode" , processcode_opt_to_json x.f_AllocGrp_ProcessCode );
    ( "SettlCurrAmt" , float_opt_to_json x.f_AllocGrp_SettlCurrAmt );
    ( "SettlCurrFxRate" , float_opt_to_json x.f_AllocGrp_SettlCurrFxRate );
    ( "SettlCurrFxRateCalc" , settlcurrfxratecalc_opt_to_json x.f_AllocGrp_SettlCurrFxRateCalc );
    ( "SettlCurrency" , currency_opt_to_json x.f_AllocGrp_SettlCurrency );
    ( "ClrInstGrp" , clrinstgrp_to_json x.f_AllocGrp_ClrInstGrp );
    ( "CommissionData" , commissiondata_to_json x.f_AllocGrp_CommissionData );
    ( "MiscFeesGrp" , miscfeesgrp_to_json x.f_AllocGrp_MiscFeesGrp );
    ( "NestedParties" , nestedparties_to_json x.f_AllocGrp_NestedParties );
    ( "SettlInstructionsData" , settlinstructionsdata_to_json x.f_AllocGrp_SettlInstructionsData )
    ]
;;

let allocackgrp_to_json x : json =
    assoc_filter_nulls [
    ( "AllocAccount" , string_opt_to_json x.f_AllocAckGrp_AllocAccount );
    ( "AllocAcctIDSource" , int_opt_to_json x.f_AllocAckGrp_AllocAcctIDSource );
    ( "AllocPrice" , float_opt_to_json x.f_AllocAckGrp_AllocPrice );
    ( "AllocText" , string_opt_to_json x.f_AllocAckGrp_AllocText );
    ( "EncodedAllocText" , string_opt_to_json x.f_AllocAckGrp_EncodedAllocText );
    ( "EncodedAllocTextLen" , int_opt_to_json x.f_AllocAckGrp_EncodedAllocTextLen );
    ( "IndividualAllocID" , string_opt_to_json x.f_AllocAckGrp_IndividualAllocID );
    ( "IndividualAllocRejCode" , int_opt_to_json x.f_AllocAckGrp_IndividualAllocRejCode );
    ( "NoAllocs" , int_opt_to_json x.f_AllocAckGrp_NoAllocs )
    ]
;;

let positionqty_to_json x : json =
    assoc_filter_nulls [
    ( "LongQty" , float_opt_to_json x.f_PositionQty_LongQty );
    ( "NoPositions" , int_opt_to_json x.f_PositionQty_NoPositions );
    ( "PosQtyStatus" , posqtystatus_opt_to_json x.f_PositionQty_PosQtyStatus );
    ( "PosType" , postype_opt_to_json x.f_PositionQty_PosType );
    ( "ShortQty" , float_opt_to_json x.f_PositionQty_ShortQty );
    ( "NestedParties" , nestedparties_to_json x.f_PositionQty_NestedParties )
    ]
;;

let positionamountdata_to_json x : json =
    assoc_filter_nulls [
    ( "NoPosAmt" , int_opt_to_json x.f_PositionAmountData_NoPosAmt );
    ( "PosAmt" , float_opt_to_json x.f_PositionAmountData_PosAmt );
    ( "PosAmtType" , posamttype_opt_to_json x.f_PositionAmountData_PosAmtType )
    ]
;;

let biddescreqgrp_to_json x : json =
    assoc_filter_nulls [
    ( "BidDescriptor" , string_opt_to_json x.f_BidDescReqGrp_BidDescriptor );
    ( "BidDescriptorType" , biddescriptortype_opt_to_json x.f_BidDescReqGrp_BidDescriptorType );
    ( "EFPTrackingError" , float_opt_to_json x.f_BidDescReqGrp_EFPTrackingError );
    ( "FairValue" , float_opt_to_json x.f_BidDescReqGrp_FairValue );
    ( "LiquidityNumSecurities" , int_opt_to_json x.f_BidDescReqGrp_LiquidityNumSecurities );
    ( "LiquidityPctHigh" , float_opt_to_json x.f_BidDescReqGrp_LiquidityPctHigh );
    ( "LiquidityPctLow" , float_opt_to_json x.f_BidDescReqGrp_LiquidityPctLow );
    ( "LiquidityValue" , float_opt_to_json x.f_BidDescReqGrp_LiquidityValue );
    ( "NoBidDescriptors" , int_opt_to_json x.f_BidDescReqGrp_NoBidDescriptors );
    ( "OutsideIndexPct" , float_opt_to_json x.f_BidDescReqGrp_OutsideIndexPct );
    ( "SideValueInd" , sidevalueind_opt_to_json x.f_BidDescReqGrp_SideValueInd );
    ( "ValueOfFutures" , float_opt_to_json x.f_BidDescReqGrp_ValueOfFutures )
    ]
;;

let bidcompreqgrp_to_json x : json =
    assoc_filter_nulls [
    ( "Account" , string_opt_to_json x.f_BidCompReqGrp_Account );
    ( "AcctIDSource" , acctidsource_opt_to_json x.f_BidCompReqGrp_AcctIDSource );
    ( "ListID" , string_opt_to_json x.f_BidCompReqGrp_ListID );
    ( "NetGrossInd" , netgrossind_opt_to_json x.f_BidCompReqGrp_NetGrossInd );
    ( "NoBidComponents" , int_opt_to_json x.f_BidCompReqGrp_NoBidComponents );
    ( "SettlDate" , localmktdate_opt_to_json x.f_BidCompReqGrp_SettlDate );
    ( "SettlType" , settltype_opt_to_json x.f_BidCompReqGrp_SettlType );
    ( "Side" , side_opt_to_json x.f_BidCompReqGrp_Side );
    ( "TradingSessionID" , string_opt_to_json x.f_BidCompReqGrp_TradingSessionID );
    ( "TradingSessionSubID" , string_opt_to_json x.f_BidCompReqGrp_TradingSessionSubID )
    ]
;;

let bidcomprspgrp_to_json x : json =
    assoc_filter_nulls [
    ( "Country" , country_opt_to_json x.f_BidCompRspGrp_Country );
    ( "EncodedText" , string_opt_to_json x.f_BidCompRspGrp_EncodedText );
    ( "EncodedTextLen" , int_opt_to_json x.f_BidCompRspGrp_EncodedTextLen );
    ( "FairValue" , float_opt_to_json x.f_BidCompRspGrp_FairValue );
    ( "ListID" , string_opt_to_json x.f_BidCompRspGrp_ListID );
    ( "NetGrossInd" , netgrossind_opt_to_json x.f_BidCompRspGrp_NetGrossInd );
    ( "NoBidComponents" , int_to_json x.f_BidCompRspGrp_NoBidComponents );
    ( "Price" , float_opt_to_json x.f_BidCompRspGrp_Price );
    ( "PriceType" , pricetype_opt_to_json x.f_BidCompRspGrp_PriceType );
    ( "SettlDate" , localmktdate_opt_to_json x.f_BidCompRspGrp_SettlDate );
    ( "SettlType" , settltype_opt_to_json x.f_BidCompRspGrp_SettlType );
    ( "Side" , side_opt_to_json x.f_BidCompRspGrp_Side );
    ( "Text" , string_opt_to_json x.f_BidCompRspGrp_Text );
    ( "TradingSessionID" , string_opt_to_json x.f_BidCompRspGrp_TradingSessionID );
    ( "TradingSessionSubID" , string_opt_to_json x.f_BidCompRspGrp_TradingSessionSubID );
    ( "CommissionData" , commissiondata_to_json x.f_BidCompRspGrp_CommissionData )
    ]
;;

let execcollgrp_to_json x : json =
    assoc_filter_nulls [
    ( "ExecID" , string_opt_to_json x.f_ExecCollGrp_ExecID );
    ( "NoExecs" , int_opt_to_json x.f_ExecCollGrp_NoExecs )
    ]
;;

let trdcollgrp_to_json x : json =
    assoc_filter_nulls [
    ( "NoTrades" , int_opt_to_json x.f_TrdCollGrp_NoTrades );
    ( "SecondaryTradeReportID" , string_opt_to_json x.f_TrdCollGrp_SecondaryTradeReportID );
    ( "TradeReportID" , string_opt_to_json x.f_TrdCollGrp_TradeReportID )
    ]
;;

let undinstrmtcollgrp_to_json x : json =
    assoc_filter_nulls [
    ( "CollAction" , collaction_opt_to_json x.f_UndInstrmtCollGrp_CollAction );
    ( "NoUnderlyings" , int_opt_to_json x.f_UndInstrmtCollGrp_NoUnderlyings );
    ( "UnderlyingInstrument" , underlyinginstrument_to_json x.f_UndInstrmtCollGrp_UnderlyingInstrument )
    ]
;;

let trdregtimestamps_to_json x : json =
    assoc_filter_nulls [
    ( "NoTrdRegTimestamps" , int_opt_to_json x.f_TrdRegTimestamps_NoTrdRegTimestamps );
    ( "TrdRegTimestamp" , utctimestamp_opt_to_json x.f_TrdRegTimestamps_TrdRegTimestamp );
    ( "TrdRegTimestampOrigin" , string_opt_to_json x.f_TrdRegTimestamps_TrdRegTimestampOrigin );
    ( "TrdRegTimestampType" , trdregtimestamptype_opt_to_json x.f_TrdRegTimestamps_TrdRegTimestampType )
    ]
;;

let collinqqualgrp_to_json x : json =
    assoc_filter_nulls [
    ( "CollInquiryQualifier" , collinquiryqualifier_opt_to_json x.f_CollInqQualGrp_CollInquiryQualifier );
    ( "NoCollInquiryQualifier" , int_opt_to_json x.f_CollInqQualGrp_NoCollInquiryQualifier )
    ]
;;

let cpctyconfgrp_to_json x : json =
    assoc_filter_nulls [
    ( "NoCapacities" , int_to_json x.f_CpctyConfGrp_NoCapacities );
    ( "OrderCapacity" , ordercapacity_to_json x.f_CpctyConfGrp_OrderCapacity );
    ( "OrderCapacityQty" , float_to_json x.f_CpctyConfGrp_OrderCapacityQty );
    ( "OrderRestrictions" , orderrestrictions_opt_to_json x.f_CpctyConfGrp_OrderRestrictions )
    ]
;;

let orderqtydata_to_json x : json =
    assoc_filter_nulls [
    ( "CashOrderQty" , float_opt_to_json x.f_OrderQtyData_CashOrderQty );
    ( "OrderPercent" , float_opt_to_json x.f_OrderQtyData_OrderPercent );
    ( "OrderQty" , float_opt_to_json x.f_OrderQtyData_OrderQty );
    ( "RoundingDirection" , roundingdirection_opt_to_json x.f_OrderQtyData_RoundingDirection );
    ( "RoundingModulus" , float_opt_to_json x.f_OrderQtyData_RoundingModulus )
    ]
;;

let preallocgrp_to_json x : json =
    assoc_filter_nulls [
    ( "AllocAccount" , string_opt_to_json x.f_PreAllocGrp_AllocAccount );
    ( "AllocAcctIDSource" , int_opt_to_json x.f_PreAllocGrp_AllocAcctIDSource );
    ( "AllocQty" , float_opt_to_json x.f_PreAllocGrp_AllocQty );
    ( "AllocSettlCurrency" , currency_opt_to_json x.f_PreAllocGrp_AllocSettlCurrency );
    ( "IndividualAllocID" , string_opt_to_json x.f_PreAllocGrp_IndividualAllocID );
    ( "NoAllocs" , int_opt_to_json x.f_PreAllocGrp_NoAllocs );
    ( "NestedParties" , nestedparties_to_json x.f_PreAllocGrp_NestedParties )
    ]
;;

let sidecrossordmodgrp_to_json x : json =
    assoc_filter_nulls [
    ( "Account" , string_opt_to_json x.f_SideCrossOrdModGrp_Account );
    ( "AccountType" , accounttype_opt_to_json x.f_SideCrossOrdModGrp_AccountType );
    ( "AcctIDSource" , acctidsource_opt_to_json x.f_SideCrossOrdModGrp_AcctIDSource );
    ( "AllocID" , string_opt_to_json x.f_SideCrossOrdModGrp_AllocID );
    ( "BookingType" , bookingtype_opt_to_json x.f_SideCrossOrdModGrp_BookingType );
    ( "BookingUnit" , bookingunit_opt_to_json x.f_SideCrossOrdModGrp_BookingUnit );
    ( "CashMargin" , cashmargin_opt_to_json x.f_SideCrossOrdModGrp_CashMargin );
    ( "ClOrdID" , string_to_json x.f_SideCrossOrdModGrp_ClOrdID );
    ( "ClOrdLinkID" , string_opt_to_json x.f_SideCrossOrdModGrp_ClOrdLinkID );
    ( "ClearingFeeIndicator" , clearingfeeindicator_opt_to_json x.f_SideCrossOrdModGrp_ClearingFeeIndicator );
    ( "CoveredOrUncovered" , coveredoruncovered_opt_to_json x.f_SideCrossOrdModGrp_CoveredOrUncovered );
    ( "CustOrderCapacity" , custordercapacity_opt_to_json x.f_SideCrossOrdModGrp_CustOrderCapacity );
    ( "DayBookingInst" , daybookinginst_opt_to_json x.f_SideCrossOrdModGrp_DayBookingInst );
    ( "EncodedText" , string_opt_to_json x.f_SideCrossOrdModGrp_EncodedText );
    ( "EncodedTextLen" , int_opt_to_json x.f_SideCrossOrdModGrp_EncodedTextLen );
    ( "ForexReq" , forexreq_opt_to_json x.f_SideCrossOrdModGrp_ForexReq );
    ( "NoSides" , nosides_to_json x.f_SideCrossOrdModGrp_NoSides );
    ( "OrderCapacity" , ordercapacity_opt_to_json x.f_SideCrossOrdModGrp_OrderCapacity );
    ( "OrderRestrictions" , orderrestrictions_opt_to_json x.f_SideCrossOrdModGrp_OrderRestrictions );
    ( "PositionEffect" , positioneffect_opt_to_json x.f_SideCrossOrdModGrp_PositionEffect );
    ( "PreallocMethod" , preallocmethod_opt_to_json x.f_SideCrossOrdModGrp_PreallocMethod );
    ( "QtyType" , qtytype_opt_to_json x.f_SideCrossOrdModGrp_QtyType );
    ( "SecondaryClOrdID" , string_opt_to_json x.f_SideCrossOrdModGrp_SecondaryClOrdID );
    ( "SettlCurrency" , currency_opt_to_json x.f_SideCrossOrdModGrp_SettlCurrency );
    ( "Side" , side_to_json x.f_SideCrossOrdModGrp_Side );
    ( "SideComplianceID" , string_opt_to_json x.f_SideCrossOrdModGrp_SideComplianceID );
    ( "SolicitedFlag" , solicitedflag_opt_to_json x.f_SideCrossOrdModGrp_SolicitedFlag );
    ( "Text" , string_opt_to_json x.f_SideCrossOrdModGrp_Text );
    ( "TradeDate" , localmktdate_opt_to_json x.f_SideCrossOrdModGrp_TradeDate );
    ( "TradeOriginationDate" , localmktdate_opt_to_json x.f_SideCrossOrdModGrp_TradeOriginationDate );
    ( "CommissionData" , commissiondata_to_json x.f_SideCrossOrdModGrp_CommissionData );
    ( "OrderQtyData" , orderqtydata_to_json x.f_SideCrossOrdModGrp_OrderQtyData );
    ( "Parties" , parties_to_json x.f_SideCrossOrdModGrp_Parties );
    ( "PreAllocGrp" , preallocgrp_to_json x.f_SideCrossOrdModGrp_PreAllocGrp )
    ]
;;

let trdgsesgrp_to_json x : json =
    assoc_filter_nulls [
    ( "NoTradingSessions" , int_opt_to_json x.f_TrdgSesGrp_NoTradingSessions );
    ( "TradingSessionID" , string_opt_to_json x.f_TrdgSesGrp_TradingSessionID );
    ( "TradingSessionSubID" , string_opt_to_json x.f_TrdgSesGrp_TradingSessionSubID )
    ]
;;

let peginstructions_to_json x : json =
    assoc_filter_nulls [
    ( "PegLimitType" , peglimittype_opt_to_json x.f_PegInstructions_PegLimitType );
    ( "PegMoveType" , pegmovetype_opt_to_json x.f_PegInstructions_PegMoveType );
    ( "PegOffsetType" , pegoffsettype_opt_to_json x.f_PegInstructions_PegOffsetType );
    ( "PegOffsetValue" , float_opt_to_json x.f_PegInstructions_PegOffsetValue );
    ( "PegRoundDirection" , pegrounddirection_opt_to_json x.f_PegInstructions_PegRoundDirection );
    ( "PegScope" , pegscope_opt_to_json x.f_PegInstructions_PegScope )
    ]
;;

let discretioninstructions_to_json x : json =
    assoc_filter_nulls [
    ( "DiscretionInst" , discretioninst_opt_to_json x.f_DiscretionInstructions_DiscretionInst );
    ( "DiscretionLimitType" , discretionlimittype_opt_to_json x.f_DiscretionInstructions_DiscretionLimitType );
    ( "DiscretionMoveType" , discretionmovetype_opt_to_json x.f_DiscretionInstructions_DiscretionMoveType );
    ( "DiscretionOffsetType" , discretionoffsettype_opt_to_json x.f_DiscretionInstructions_DiscretionOffsetType );
    ( "DiscretionOffsetValue" , float_opt_to_json x.f_DiscretionInstructions_DiscretionOffsetValue );
    ( "DiscretionRoundDirection" , discretionrounddirection_opt_to_json x.f_DiscretionInstructions_DiscretionRoundDirection );
    ( "DiscretionScope" , discretionscope_opt_to_json x.f_DiscretionInstructions_DiscretionScope )
    ]
;;

let sidecrossordcxlgrp_to_json x : json =
    assoc_filter_nulls [
    ( "ClOrdID" , string_to_json x.f_SideCrossOrdCxlGrp_ClOrdID );
    ( "ClOrdLinkID" , string_opt_to_json x.f_SideCrossOrdCxlGrp_ClOrdLinkID );
    ( "ComplianceID" , string_opt_to_json x.f_SideCrossOrdCxlGrp_ComplianceID );
    ( "EncodedText" , string_opt_to_json x.f_SideCrossOrdCxlGrp_EncodedText );
    ( "EncodedTextLen" , int_opt_to_json x.f_SideCrossOrdCxlGrp_EncodedTextLen );
    ( "NoSides" , nosides_to_json x.f_SideCrossOrdCxlGrp_NoSides );
    ( "OrigClOrdID" , string_to_json x.f_SideCrossOrdCxlGrp_OrigClOrdID );
    ( "OrigOrdModTime" , utctimestamp_opt_to_json x.f_SideCrossOrdCxlGrp_OrigOrdModTime );
    ( "SecondaryClOrdID" , string_opt_to_json x.f_SideCrossOrdCxlGrp_SecondaryClOrdID );
    ( "Side" , side_to_json x.f_SideCrossOrdCxlGrp_Side );
    ( "Text" , string_opt_to_json x.f_SideCrossOrdCxlGrp_Text );
    ( "TradeDate" , localmktdate_opt_to_json x.f_SideCrossOrdCxlGrp_TradeDate );
    ( "TradeOriginationDate" , localmktdate_opt_to_json x.f_SideCrossOrdCxlGrp_TradeOriginationDate );
    ( "OrderQtyData" , orderqtydata_to_json x.f_SideCrossOrdCxlGrp_OrderQtyData );
    ( "Parties" , parties_to_json x.f_SideCrossOrdCxlGrp_Parties )
    ]
;;

let relsymderivsecgrp_to_json x : json =
    assoc_filter_nulls [
    ( "Currency" , currency_opt_to_json x.f_RelSymDerivSecGrp_Currency );
    ( "EncodedText" , string_opt_to_json x.f_RelSymDerivSecGrp_EncodedText );
    ( "EncodedTextLen" , int_opt_to_json x.f_RelSymDerivSecGrp_EncodedTextLen );
    ( "ExpirationCycle" , expirationcycle_opt_to_json x.f_RelSymDerivSecGrp_ExpirationCycle );
    ( "NoRelatedSym" , int_opt_to_json x.f_RelSymDerivSecGrp_NoRelatedSym );
    ( "Text" , string_opt_to_json x.f_RelSymDerivSecGrp_Text );
    ( "TradingSessionID" , string_opt_to_json x.f_RelSymDerivSecGrp_TradingSessionID );
    ( "TradingSessionSubID" , string_opt_to_json x.f_RelSymDerivSecGrp_TradingSessionSubID );
    ( "InstrmtLegGrp" , instrmtleggrp_to_json x.f_RelSymDerivSecGrp_InstrmtLegGrp );
    ( "Instrument" , instrument_to_json x.f_RelSymDerivSecGrp_Instrument );
    ( "InstrumentExtension" , instrumentextension_to_json x.f_RelSymDerivSecGrp_InstrumentExtension )
    ]
;;

let routinggrp_to_json x : json =
    assoc_filter_nulls [
    ( "NoRoutingIDs" , int_opt_to_json x.f_RoutingGrp_NoRoutingIDs );
    ( "RoutingID" , string_opt_to_json x.f_RoutingGrp_RoutingID );
    ( "RoutingType" , routingtype_opt_to_json x.f_RoutingGrp_RoutingType )
    ]
;;

let instrmtgrp_to_json x : json =
    assoc_filter_nulls [
    ( "NoRelatedSym" , int_opt_to_json x.f_InstrmtGrp_NoRelatedSym );
    ( "Instrument" , instrument_to_json x.f_InstrmtGrp_Instrument )
    ]
;;

let linesoftextgrp_to_json x : json =
    assoc_filter_nulls [
    ( "EncodedText" , string_opt_to_json x.f_LinesOfTextGrp_EncodedText );
    ( "EncodedTextLen" , int_opt_to_json x.f_LinesOfTextGrp_EncodedTextLen );
    ( "NoLinesOfText" , int_to_json x.f_LinesOfTextGrp_NoLinesOfText );
    ( "Text" , string_to_json x.f_LinesOfTextGrp_Text )
    ]
;;

let legstipulations_to_json x : json =
    assoc_filter_nulls [
    ( "LegStipulationType" , string_opt_to_json x.f_LegStipulations_LegStipulationType );
    ( "LegStipulationValue" , string_opt_to_json x.f_LegStipulations_LegStipulationValue );
    ( "NoLegStipulations" , int_opt_to_json x.f_LegStipulations_NoLegStipulations )
    ]
;;

let contragrp_to_json x : json =
    assoc_filter_nulls [
    ( "ContraBroker" , string_opt_to_json x.f_ContraGrp_ContraBroker );
    ( "ContraLegRefID" , string_opt_to_json x.f_ContraGrp_ContraLegRefID );
    ( "ContraTradeQty" , float_opt_to_json x.f_ContraGrp_ContraTradeQty );
    ( "ContraTradeTime" , utctimestamp_opt_to_json x.f_ContraGrp_ContraTradeTime );
    ( "ContraTrader" , string_opt_to_json x.f_ContraGrp_ContraTrader );
    ( "NoContraBrokers" , int_opt_to_json x.f_ContraGrp_NoContraBrokers )
    ]
;;

let contamtgrp_to_json x : json =
    assoc_filter_nulls [
    ( "ContAmtCurr" , currency_opt_to_json x.f_ContAmtGrp_ContAmtCurr );
    ( "ContAmtType" , contamttype_opt_to_json x.f_ContAmtGrp_ContAmtType );
    ( "ContAmtValue" , float_opt_to_json x.f_ContAmtGrp_ContAmtValue );
    ( "NoContAmts" , int_opt_to_json x.f_ContAmtGrp_NoContAmts )
    ]
;;

let instrmtlegexecgrp_to_json x : json =
    assoc_filter_nulls [
    ( "LegCoveredOrUncovered" , int_opt_to_json x.f_InstrmtLegExecGrp_LegCoveredOrUncovered );
    ( "LegLastPx" , float_opt_to_json x.f_InstrmtLegExecGrp_LegLastPx );
    ( "LegPositionEffect" , char_opt_to_json x.f_InstrmtLegExecGrp_LegPositionEffect );
    ( "LegPrice" , float_opt_to_json x.f_InstrmtLegExecGrp_LegPrice );
    ( "LegQty" , float_opt_to_json x.f_InstrmtLegExecGrp_LegQty );
    ( "LegRefID" , string_opt_to_json x.f_InstrmtLegExecGrp_LegRefID );
    ( "LegSettlDate" , localmktdate_opt_to_json x.f_InstrmtLegExecGrp_LegSettlDate );
    ( "LegSettlType" , char_opt_to_json x.f_InstrmtLegExecGrp_LegSettlType );
    ( "LegSwapType" , legswaptype_opt_to_json x.f_InstrmtLegExecGrp_LegSwapType );
    ( "NoLegs" , int_opt_to_json x.f_InstrmtLegExecGrp_NoLegs );
    ( "InstrumentLeg" , instrumentleg_to_json x.f_InstrmtLegExecGrp_InstrumentLeg );
    ( "LegStipulations" , legstipulations_to_json x.f_InstrmtLegExecGrp_LegStipulations );
    ( "NestedParties" , nestedparties_to_json x.f_InstrmtLegExecGrp_NestedParties )
    ]
;;

let instrmtlegioigrp_to_json x : json =
    assoc_filter_nulls [
    ( "LegIOIQty" , string_opt_to_json x.f_InstrmtLegIOIGrp_LegIOIQty );
    ( "NoLegs" , int_opt_to_json x.f_InstrmtLegIOIGrp_NoLegs );
    ( "InstrumentLeg" , instrumentleg_to_json x.f_InstrmtLegIOIGrp_InstrumentLeg );
    ( "LegStipulations" , legstipulations_to_json x.f_InstrmtLegIOIGrp_LegStipulations )
    ]
;;

let ioiqualgrp_to_json x : json =
    assoc_filter_nulls [
    ( "IOIQualifier" , ioiqualifier_opt_to_json x.f_IOIQualGrp_IOIQualifier );
    ( "NoIOIQualifiers" , int_opt_to_json x.f_IOIQualGrp_NoIOIQualifiers )
    ]
;;

let ordliststatgrp_to_json x : json =
    assoc_filter_nulls [
    ( "AvgPx" , float_to_json x.f_OrdListStatGrp_AvgPx );
    ( "ClOrdID" , string_to_json x.f_OrdListStatGrp_ClOrdID );
    ( "CumQty" , float_to_json x.f_OrdListStatGrp_CumQty );
    ( "CxlQty" , float_to_json x.f_OrdListStatGrp_CxlQty );
    ( "EncodedText" , string_opt_to_json x.f_OrdListStatGrp_EncodedText );
    ( "EncodedTextLen" , int_opt_to_json x.f_OrdListStatGrp_EncodedTextLen );
    ( "LeavesQty" , float_to_json x.f_OrdListStatGrp_LeavesQty );
    ( "NoOrders" , int_to_json x.f_OrdListStatGrp_NoOrders );
    ( "OrdRejReason" , ordrejreason_opt_to_json x.f_OrdListStatGrp_OrdRejReason );
    ( "OrdStatus" , ordstatus_to_json x.f_OrdListStatGrp_OrdStatus );
    ( "SecondaryClOrdID" , string_opt_to_json x.f_OrdListStatGrp_SecondaryClOrdID );
    ( "Text" , string_opt_to_json x.f_OrdListStatGrp_Text );
    ( "WorkingIndicator" , workingindicator_opt_to_json x.f_OrdListStatGrp_WorkingIndicator )
    ]
;;

let instrmtstrkpxgrp_to_json x : json =
    assoc_filter_nulls [
    ( "NoStrikes" , int_to_json x.f_InstrmtStrkPxGrp_NoStrikes );
    ( "Instrument" , instrument_to_json x.f_InstrmtStrkPxGrp_Instrument )
    ]
;;

let undinstrmtstrkpxgrp_to_json x : json =
    assoc_filter_nulls [
    ( "ClOrdID" , string_opt_to_json x.f_UndInstrmtStrkPxGrp_ClOrdID );
    ( "Currency" , currency_opt_to_json x.f_UndInstrmtStrkPxGrp_Currency );
    ( "EncodedText" , string_opt_to_json x.f_UndInstrmtStrkPxGrp_EncodedText );
    ( "EncodedTextLen" , int_opt_to_json x.f_UndInstrmtStrkPxGrp_EncodedTextLen );
    ( "NoUnderlyings" , int_opt_to_json x.f_UndInstrmtStrkPxGrp_NoUnderlyings );
    ( "PrevClosePx" , float_opt_to_json x.f_UndInstrmtStrkPxGrp_PrevClosePx );
    ( "Price" , float_to_json x.f_UndInstrmtStrkPxGrp_Price );
    ( "SecondaryClOrdID" , string_opt_to_json x.f_UndInstrmtStrkPxGrp_SecondaryClOrdID );
    ( "Side" , side_opt_to_json x.f_UndInstrmtStrkPxGrp_Side );
    ( "Text" , string_opt_to_json x.f_UndInstrmtStrkPxGrp_Text );
    ( "UnderlyingInstrument" , underlyinginstrument_to_json x.f_UndInstrmtStrkPxGrp_UnderlyingInstrument )
    ]
;;

let mdincgrp_to_json x : json =
    assoc_filter_nulls [
    ( "CorporateAction" , corporateaction_opt_to_json x.f_MDIncGrp_CorporateAction );
    ( "Currency" , currency_opt_to_json x.f_MDIncGrp_Currency );
    ( "DeleteReason" , deletereason_opt_to_json x.f_MDIncGrp_DeleteReason );
    ( "DeskID" , string_opt_to_json x.f_MDIncGrp_DeskID );
    ( "EncodedText" , string_opt_to_json x.f_MDIncGrp_EncodedText );
    ( "EncodedTextLen" , int_opt_to_json x.f_MDIncGrp_EncodedTextLen );
    ( "ExecInst" , execinst_opt_to_json x.f_MDIncGrp_ExecInst );
    ( "ExpireDate" , localmktdate_opt_to_json x.f_MDIncGrp_ExpireDate );
    ( "ExpireTime" , utctimestamp_opt_to_json x.f_MDIncGrp_ExpireTime );
    ( "FinancialStatus" , financialstatus_opt_to_json x.f_MDIncGrp_FinancialStatus );
    ( "LocationID" , string_opt_to_json x.f_MDIncGrp_LocationID );
    ( "MDEntryBuyer" , string_opt_to_json x.f_MDIncGrp_MDEntryBuyer );
    ( "MDEntryDate" , utcdateonly_opt_to_json x.f_MDIncGrp_MDEntryDate );
    ( "MDEntryID" , string_opt_to_json x.f_MDIncGrp_MDEntryID );
    ( "MDEntryOriginator" , string_opt_to_json x.f_MDIncGrp_MDEntryOriginator );
    ( "MDEntryPositionNo" , int_opt_to_json x.f_MDIncGrp_MDEntryPositionNo );
    ( "MDEntryPx" , float_opt_to_json x.f_MDIncGrp_MDEntryPx );
    ( "MDEntryRefID" , string_opt_to_json x.f_MDIncGrp_MDEntryRefID );
    ( "MDEntrySeller" , string_opt_to_json x.f_MDIncGrp_MDEntrySeller );
    ( "MDEntrySize" , float_opt_to_json x.f_MDIncGrp_MDEntrySize );
    ( "MDEntryTime" , utctimeonly_opt_to_json x.f_MDIncGrp_MDEntryTime );
    ( "MDEntryType" , mdentrytype_opt_to_json x.f_MDIncGrp_MDEntryType );
    ( "MDMkt" , exchange_opt_to_json x.f_MDIncGrp_MDMkt );
    ( "MDUpdateAction" , mdupdateaction_to_json x.f_MDIncGrp_MDUpdateAction );
    ( "MinQty" , float_opt_to_json x.f_MDIncGrp_MinQty );
    ( "NetChgPrevDay" , float_opt_to_json x.f_MDIncGrp_NetChgPrevDay );
    ( "NoMDEntries" , int_to_json x.f_MDIncGrp_NoMDEntries );
    ( "NumberOfOrders" , int_opt_to_json x.f_MDIncGrp_NumberOfOrders );
    ( "OpenCloseSettlFlag" , openclosesettlflag_opt_to_json x.f_MDIncGrp_OpenCloseSettlFlag );
    ( "OrderID" , string_opt_to_json x.f_MDIncGrp_OrderID );
    ( "PriceDelta" , float_opt_to_json x.f_MDIncGrp_PriceDelta );
    ( "QuoteCondition" , quotecondition_opt_to_json x.f_MDIncGrp_QuoteCondition );
    ( "QuoteEntryID" , string_opt_to_json x.f_MDIncGrp_QuoteEntryID );
    ( "Scope" , scope_opt_to_json x.f_MDIncGrp_Scope );
    ( "SellerDays" , int_opt_to_json x.f_MDIncGrp_SellerDays );
    ( "Text" , string_opt_to_json x.f_MDIncGrp_Text );
    ( "TickDirection" , tickdirection_opt_to_json x.f_MDIncGrp_TickDirection );
    ( "TimeInForce" , timeinforce_opt_to_json x.f_MDIncGrp_TimeInForce );
    ( "TradeCondition" , tradecondition_opt_to_json x.f_MDIncGrp_TradeCondition );
    ( "TradingSessionID" , string_opt_to_json x.f_MDIncGrp_TradingSessionID );
    ( "TradingSessionSubID" , string_opt_to_json x.f_MDIncGrp_TradingSessionSubID );
    ( "InstrmtLegGrp" , instrmtleggrp_to_json x.f_MDIncGrp_InstrmtLegGrp );
    ( "Instrument" , instrument_to_json x.f_MDIncGrp_Instrument );
    ( "UndInstrmtGrp" , undinstrmtgrp_to_json x.f_MDIncGrp_UndInstrmtGrp )
    ]
;;

let mdreqgrp_to_json x : json =
    assoc_filter_nulls [
    ( "MDEntryType" , mdentrytype_to_json x.f_MDReqGrp_MDEntryType );
    ( "NoMDEntryTypes" , int_to_json x.f_MDReqGrp_NoMDEntryTypes )
    ]
;;

let instrmtmdreqgrp_to_json x : json =
    assoc_filter_nulls [
    ( "NoRelatedSym" , int_to_json x.f_InstrmtMDReqGrp_NoRelatedSym );
    ( "InstrmtLegGrp" , instrmtleggrp_to_json x.f_InstrmtMDReqGrp_InstrmtLegGrp );
    ( "Instrument" , instrument_to_json x.f_InstrmtMDReqGrp_Instrument );
    ( "UndInstrmtGrp" , undinstrmtgrp_to_json x.f_InstrmtMDReqGrp_UndInstrmtGrp )
    ]
;;

let mdrjctgrp_to_json x : json =
    assoc_filter_nulls [
    ( "AltMDSourceID" , string_opt_to_json x.f_MDRjctGrp_AltMDSourceID );
    ( "NoAltMDSource" , int_opt_to_json x.f_MDRjctGrp_NoAltMDSource )
    ]
;;

let mdfullgrp_to_json x : json =
    assoc_filter_nulls [
    ( "Currency" , currency_opt_to_json x.f_MDFullGrp_Currency );
    ( "DeskID" , string_opt_to_json x.f_MDFullGrp_DeskID );
    ( "EncodedText" , string_opt_to_json x.f_MDFullGrp_EncodedText );
    ( "EncodedTextLen" , int_opt_to_json x.f_MDFullGrp_EncodedTextLen );
    ( "ExecInst" , execinst_opt_to_json x.f_MDFullGrp_ExecInst );
    ( "ExpireDate" , localmktdate_opt_to_json x.f_MDFullGrp_ExpireDate );
    ( "ExpireTime" , utctimestamp_opt_to_json x.f_MDFullGrp_ExpireTime );
    ( "LocationID" , string_opt_to_json x.f_MDFullGrp_LocationID );
    ( "MDEntryBuyer" , string_opt_to_json x.f_MDFullGrp_MDEntryBuyer );
    ( "MDEntryDate" , utcdateonly_opt_to_json x.f_MDFullGrp_MDEntryDate );
    ( "MDEntryOriginator" , string_opt_to_json x.f_MDFullGrp_MDEntryOriginator );
    ( "MDEntryPositionNo" , int_opt_to_json x.f_MDFullGrp_MDEntryPositionNo );
    ( "MDEntryPx" , float_opt_to_json x.f_MDFullGrp_MDEntryPx );
    ( "MDEntrySeller" , string_opt_to_json x.f_MDFullGrp_MDEntrySeller );
    ( "MDEntrySize" , float_opt_to_json x.f_MDFullGrp_MDEntrySize );
    ( "MDEntryTime" , utctimeonly_opt_to_json x.f_MDFullGrp_MDEntryTime );
    ( "MDEntryType" , mdentrytype_to_json x.f_MDFullGrp_MDEntryType );
    ( "MDMkt" , exchange_opt_to_json x.f_MDFullGrp_MDMkt );
    ( "MinQty" , float_opt_to_json x.f_MDFullGrp_MinQty );
    ( "NoMDEntries" , int_to_json x.f_MDFullGrp_NoMDEntries );
    ( "NumberOfOrders" , int_opt_to_json x.f_MDFullGrp_NumberOfOrders );
    ( "OpenCloseSettlFlag" , openclosesettlflag_opt_to_json x.f_MDFullGrp_OpenCloseSettlFlag );
    ( "OrderID" , string_opt_to_json x.f_MDFullGrp_OrderID );
    ( "PriceDelta" , float_opt_to_json x.f_MDFullGrp_PriceDelta );
    ( "QuoteCondition" , quotecondition_opt_to_json x.f_MDFullGrp_QuoteCondition );
    ( "QuoteEntryID" , string_opt_to_json x.f_MDFullGrp_QuoteEntryID );
    ( "Scope" , scope_opt_to_json x.f_MDFullGrp_Scope );
    ( "SellerDays" , int_opt_to_json x.f_MDFullGrp_SellerDays );
    ( "Text" , string_opt_to_json x.f_MDFullGrp_Text );
    ( "TickDirection" , tickdirection_opt_to_json x.f_MDFullGrp_TickDirection );
    ( "TimeInForce" , timeinforce_opt_to_json x.f_MDFullGrp_TimeInForce );
    ( "TradeCondition" , tradecondition_opt_to_json x.f_MDFullGrp_TradeCondition );
    ( "TradingSessionID" , string_opt_to_json x.f_MDFullGrp_TradingSessionID );
    ( "TradingSessionSubID" , string_opt_to_json x.f_MDFullGrp_TradingSessionSubID )
    ]
;;

let quotentrygrp_to_json x : json =
    assoc_filter_nulls [
    ( "BidForwardPoints" , float_opt_to_json x.f_QuotEntryGrp_BidForwardPoints );
    ( "BidForwardPoints2" , float_opt_to_json x.f_QuotEntryGrp_BidForwardPoints2 );
    ( "BidPx" , float_opt_to_json x.f_QuotEntryGrp_BidPx );
    ( "BidSize" , float_opt_to_json x.f_QuotEntryGrp_BidSize );
    ( "BidSpotRate" , float_opt_to_json x.f_QuotEntryGrp_BidSpotRate );
    ( "BidYield" , float_opt_to_json x.f_QuotEntryGrp_BidYield );
    ( "Currency" , currency_opt_to_json x.f_QuotEntryGrp_Currency );
    ( "MidPx" , float_opt_to_json x.f_QuotEntryGrp_MidPx );
    ( "MidYield" , float_opt_to_json x.f_QuotEntryGrp_MidYield );
    ( "NoQuoteEntries" , int_to_json x.f_QuotEntryGrp_NoQuoteEntries );
    ( "OfferForwardPoints" , float_opt_to_json x.f_QuotEntryGrp_OfferForwardPoints );
    ( "OfferForwardPoints2" , float_opt_to_json x.f_QuotEntryGrp_OfferForwardPoints2 );
    ( "OfferPx" , float_opt_to_json x.f_QuotEntryGrp_OfferPx );
    ( "OfferSize" , float_opt_to_json x.f_QuotEntryGrp_OfferSize );
    ( "OfferSpotRate" , float_opt_to_json x.f_QuotEntryGrp_OfferSpotRate );
    ( "OfferYield" , float_opt_to_json x.f_QuotEntryGrp_OfferYield );
    ( "OrdType" , ordtype_opt_to_json x.f_QuotEntryGrp_OrdType );
    ( "OrderQty2" , float_opt_to_json x.f_QuotEntryGrp_OrderQty2 );
    ( "QuoteEntryID" , string_to_json x.f_QuotEntryGrp_QuoteEntryID );
    ( "SettlDate" , localmktdate_opt_to_json x.f_QuotEntryGrp_SettlDate );
    ( "SettlDate2" , localmktdate_opt_to_json x.f_QuotEntryGrp_SettlDate2 );
    ( "TradingSessionID" , string_opt_to_json x.f_QuotEntryGrp_TradingSessionID );
    ( "TradingSessionSubID" , string_opt_to_json x.f_QuotEntryGrp_TradingSessionSubID );
    ( "TransactTime" , utctimestamp_opt_to_json x.f_QuotEntryGrp_TransactTime );
    ( "ValidUntilTime" , utctimestamp_opt_to_json x.f_QuotEntryGrp_ValidUntilTime );
    ( "InstrmtLegGrp" , instrmtleggrp_to_json x.f_QuotEntryGrp_InstrmtLegGrp );
    ( "Instrument" , instrument_to_json x.f_QuotEntryGrp_Instrument )
    ]
;;

let quotsetgrp_to_json x : json =
    assoc_filter_nulls [
    ( "LastFragment" , lastfragment_opt_to_json x.f_QuotSetGrp_LastFragment );
    ( "NoQuoteSets" , int_to_json x.f_QuotSetGrp_NoQuoteSets );
    ( "QuoteSetID" , string_to_json x.f_QuotSetGrp_QuoteSetID );
    ( "QuoteSetValidUntilTime" , utctimestamp_opt_to_json x.f_QuotSetGrp_QuoteSetValidUntilTime );
    ( "TotNoQuoteEntries" , int_to_json x.f_QuotSetGrp_TotNoQuoteEntries );
    ( "QuotEntryGrp" , quotentrygrp_to_json x.f_QuotSetGrp_QuotEntryGrp );
    ( "UnderlyingInstrument" , underlyinginstrument_to_json x.f_QuotSetGrp_UnderlyingInstrument )
    ]
;;

let quotentryackgrp_to_json x : json =
    assoc_filter_nulls [
    ( "BidForwardPoints" , float_opt_to_json x.f_QuotEntryAckGrp_BidForwardPoints );
    ( "BidForwardPoints2" , float_opt_to_json x.f_QuotEntryAckGrp_BidForwardPoints2 );
    ( "BidPx" , float_opt_to_json x.f_QuotEntryAckGrp_BidPx );
    ( "BidSize" , float_opt_to_json x.f_QuotEntryAckGrp_BidSize );
    ( "BidSpotRate" , float_opt_to_json x.f_QuotEntryAckGrp_BidSpotRate );
    ( "BidYield" , float_opt_to_json x.f_QuotEntryAckGrp_BidYield );
    ( "Currency" , currency_opt_to_json x.f_QuotEntryAckGrp_Currency );
    ( "MidPx" , float_opt_to_json x.f_QuotEntryAckGrp_MidPx );
    ( "MidYield" , float_opt_to_json x.f_QuotEntryAckGrp_MidYield );
    ( "NoQuoteEntries" , int_opt_to_json x.f_QuotEntryAckGrp_NoQuoteEntries );
    ( "OfferForwardPoints" , float_opt_to_json x.f_QuotEntryAckGrp_OfferForwardPoints );
    ( "OfferForwardPoints2" , float_opt_to_json x.f_QuotEntryAckGrp_OfferForwardPoints2 );
    ( "OfferPx" , float_opt_to_json x.f_QuotEntryAckGrp_OfferPx );
    ( "OfferSize" , float_opt_to_json x.f_QuotEntryAckGrp_OfferSize );
    ( "OfferSpotRate" , float_opt_to_json x.f_QuotEntryAckGrp_OfferSpotRate );
    ( "OfferYield" , float_opt_to_json x.f_QuotEntryAckGrp_OfferYield );
    ( "OrdType" , ordtype_opt_to_json x.f_QuotEntryAckGrp_OrdType );
    ( "OrderQty2" , float_opt_to_json x.f_QuotEntryAckGrp_OrderQty2 );
    ( "QuoteEntryID" , string_opt_to_json x.f_QuotEntryAckGrp_QuoteEntryID );
    ( "QuoteEntryRejectReason" , int_opt_to_json x.f_QuotEntryAckGrp_QuoteEntryRejectReason );
    ( "SettlDate" , localmktdate_opt_to_json x.f_QuotEntryAckGrp_SettlDate );
    ( "SettlDate2" , localmktdate_opt_to_json x.f_QuotEntryAckGrp_SettlDate2 );
    ( "TradingSessionID" , string_opt_to_json x.f_QuotEntryAckGrp_TradingSessionID );
    ( "TradingSessionSubID" , string_opt_to_json x.f_QuotEntryAckGrp_TradingSessionSubID );
    ( "TransactTime" , utctimestamp_opt_to_json x.f_QuotEntryAckGrp_TransactTime );
    ( "ValidUntilTime" , utctimestamp_opt_to_json x.f_QuotEntryAckGrp_ValidUntilTime );
    ( "InstrmtLegGrp" , instrmtleggrp_to_json x.f_QuotEntryAckGrp_InstrmtLegGrp );
    ( "Instrument" , instrument_to_json x.f_QuotEntryAckGrp_Instrument )
    ]
;;

let quotsetackgrp_to_json x : json =
    assoc_filter_nulls [
    ( "LastFragment" , lastfragment_opt_to_json x.f_QuotSetAckGrp_LastFragment );
    ( "NoQuoteSets" , int_opt_to_json x.f_QuotSetAckGrp_NoQuoteSets );
    ( "QuoteSetID" , string_opt_to_json x.f_QuotSetAckGrp_QuoteSetID );
    ( "TotNoQuoteEntries" , int_opt_to_json x.f_QuotSetAckGrp_TotNoQuoteEntries );
    ( "QuotEntryAckGrp" , quotentryackgrp_to_json x.f_QuotSetAckGrp_QuotEntryAckGrp );
    ( "UnderlyingInstrument" , underlyinginstrument_to_json x.f_QuotSetAckGrp_UnderlyingInstrument )
    ]
;;

let nstdptys3subgrp_to_json x : json =
    assoc_filter_nulls [
    ( "Nested3PartySubID" , string_opt_to_json x.f_NstdPtys3SubGrp_Nested3PartySubID );
    ( "Nested3PartySubIDType" , int_opt_to_json x.f_NstdPtys3SubGrp_Nested3PartySubIDType );
    ( "NoNested3PartySubIDs" , int_opt_to_json x.f_NstdPtys3SubGrp_NoNested3PartySubIDs )
    ]
;;

let nestedparties3_to_json x : json =
    assoc_filter_nulls [
    ( "Nested3PartyID" , string_opt_to_json x.f_NestedParties3_Nested3PartyID );
    ( "Nested3PartyIDSource" , char_opt_to_json x.f_NestedParties3_Nested3PartyIDSource );
    ( "Nested3PartyRole" , int_opt_to_json x.f_NestedParties3_Nested3PartyRole );
    ( "NoNested3PartyIDs" , int_opt_to_json x.f_NestedParties3_NoNested3PartyIDs );
    ( "NstdPtys3SubGrp" , nstdptys3subgrp_to_json x.f_NestedParties3_NstdPtys3SubGrp )
    ]
;;

let legpreallocgrp_to_json x : json =
    assoc_filter_nulls [
    ( "LegAllocAccount" , string_opt_to_json x.f_LegPreAllocGrp_LegAllocAccount );
    ( "LegAllocAcctIDSource" , string_opt_to_json x.f_LegPreAllocGrp_LegAllocAcctIDSource );
    ( "LegAllocQty" , float_opt_to_json x.f_LegPreAllocGrp_LegAllocQty );
    ( "LegIndividualAllocID" , string_opt_to_json x.f_LegPreAllocGrp_LegIndividualAllocID );
    ( "LegSettlCurrency" , currency_opt_to_json x.f_LegPreAllocGrp_LegSettlCurrency );
    ( "NoLegAllocs" , int_opt_to_json x.f_LegPreAllocGrp_NoLegAllocs );
    ( "NestedParties2" , nestedparties2_to_json x.f_LegPreAllocGrp_NestedParties2 )
    ]
;;

let preallocmleggrp_to_json x : json =
    assoc_filter_nulls [
    ( "AllocAccount" , string_opt_to_json x.f_PreAllocMlegGrp_AllocAccount );
    ( "AllocAcctIDSource" , int_opt_to_json x.f_PreAllocMlegGrp_AllocAcctIDSource );
    ( "AllocQty" , float_opt_to_json x.f_PreAllocMlegGrp_AllocQty );
    ( "AllocSettlCurrency" , currency_opt_to_json x.f_PreAllocMlegGrp_AllocSettlCurrency );
    ( "IndividualAllocID" , string_opt_to_json x.f_PreAllocMlegGrp_IndividualAllocID );
    ( "NoAllocs" , int_opt_to_json x.f_PreAllocMlegGrp_NoAllocs );
    ( "NestedParties3" , nestedparties3_to_json x.f_PreAllocMlegGrp_NestedParties3 )
    ]
;;

let legordgrp_to_json x : json =
    assoc_filter_nulls [
    ( "LegCoveredOrUncovered" , int_opt_to_json x.f_LegOrdGrp_LegCoveredOrUncovered );
    ( "LegPositionEffect" , char_opt_to_json x.f_LegOrdGrp_LegPositionEffect );
    ( "LegPrice" , float_opt_to_json x.f_LegOrdGrp_LegPrice );
    ( "LegQty" , float_opt_to_json x.f_LegOrdGrp_LegQty );
    ( "LegRefID" , string_opt_to_json x.f_LegOrdGrp_LegRefID );
    ( "LegSettlDate" , localmktdate_opt_to_json x.f_LegOrdGrp_LegSettlDate );
    ( "LegSettlType" , char_opt_to_json x.f_LegOrdGrp_LegSettlType );
    ( "LegSwapType" , legswaptype_opt_to_json x.f_LegOrdGrp_LegSwapType );
    ( "NoLegs" , int_to_json x.f_LegOrdGrp_NoLegs );
    ( "InstrumentLeg" , instrumentleg_to_json x.f_LegOrdGrp_InstrumentLeg );
    ( "LegPreAllocGrp" , legpreallocgrp_to_json x.f_LegOrdGrp_LegPreAllocGrp );
    ( "LegStipulations" , legstipulations_to_json x.f_LegOrdGrp_LegStipulations );
    ( "NestedParties" , nestedparties_to_json x.f_LegOrdGrp_NestedParties )
    ]
;;

let listordgrp_to_json x : json =
    assoc_filter_nulls [
    ( "Account" , string_opt_to_json x.f_ListOrdGrp_Account );
    ( "AccountType" , accounttype_opt_to_json x.f_ListOrdGrp_AccountType );
    ( "AcctIDSource" , acctidsource_opt_to_json x.f_ListOrdGrp_AcctIDSource );
    ( "AllocID" , string_opt_to_json x.f_ListOrdGrp_AllocID );
    ( "BookingType" , bookingtype_opt_to_json x.f_ListOrdGrp_BookingType );
    ( "BookingUnit" , bookingunit_opt_to_json x.f_ListOrdGrp_BookingUnit );
    ( "CashMargin" , cashmargin_opt_to_json x.f_ListOrdGrp_CashMargin );
    ( "ClOrdID" , string_to_json x.f_ListOrdGrp_ClOrdID );
    ( "ClOrdLinkID" , string_opt_to_json x.f_ListOrdGrp_ClOrdLinkID );
    ( "ClearingFeeIndicator" , clearingfeeindicator_opt_to_json x.f_ListOrdGrp_ClearingFeeIndicator );
    ( "ComplianceID" , string_opt_to_json x.f_ListOrdGrp_ComplianceID );
    ( "CoveredOrUncovered" , coveredoruncovered_opt_to_json x.f_ListOrdGrp_CoveredOrUncovered );
    ( "Currency" , currency_opt_to_json x.f_ListOrdGrp_Currency );
    ( "CustOrderCapacity" , custordercapacity_opt_to_json x.f_ListOrdGrp_CustOrderCapacity );
    ( "DayBookingInst" , daybookinginst_opt_to_json x.f_ListOrdGrp_DayBookingInst );
    ( "Designation" , string_opt_to_json x.f_ListOrdGrp_Designation );
    ( "EffectiveTime" , utctimestamp_opt_to_json x.f_ListOrdGrp_EffectiveTime );
    ( "EncodedText" , string_opt_to_json x.f_ListOrdGrp_EncodedText );
    ( "EncodedTextLen" , int_opt_to_json x.f_ListOrdGrp_EncodedTextLen );
    ( "ExDestination" , exchange_opt_to_json x.f_ListOrdGrp_ExDestination );
    ( "ExecInst" , execinst_opt_to_json x.f_ListOrdGrp_ExecInst );
    ( "ExpireDate" , localmktdate_opt_to_json x.f_ListOrdGrp_ExpireDate );
    ( "ExpireTime" , utctimestamp_opt_to_json x.f_ListOrdGrp_ExpireTime );
    ( "ForexReq" , forexreq_opt_to_json x.f_ListOrdGrp_ForexReq );
    ( "GTBookingInst" , gtbookinginst_opt_to_json x.f_ListOrdGrp_GTBookingInst );
    ( "HandlInst" , handlinst_opt_to_json x.f_ListOrdGrp_HandlInst );
    ( "IOIID" , string_opt_to_json x.f_ListOrdGrp_IOIID );
    ( "ListSeqNo" , int_to_json x.f_ListOrdGrp_ListSeqNo );
    ( "LocateReqd" , locatereqd_opt_to_json x.f_ListOrdGrp_LocateReqd );
    ( "MaxFloor" , float_opt_to_json x.f_ListOrdGrp_MaxFloor );
    ( "MaxShow" , float_opt_to_json x.f_ListOrdGrp_MaxShow );
    ( "MinQty" , float_opt_to_json x.f_ListOrdGrp_MinQty );
    ( "NoOrders" , int_to_json x.f_ListOrdGrp_NoOrders );
    ( "OrdType" , ordtype_opt_to_json x.f_ListOrdGrp_OrdType );
    ( "OrderCapacity" , ordercapacity_opt_to_json x.f_ListOrdGrp_OrderCapacity );
    ( "OrderQty2" , float_opt_to_json x.f_ListOrdGrp_OrderQty2 );
    ( "OrderRestrictions" , orderrestrictions_opt_to_json x.f_ListOrdGrp_OrderRestrictions );
    ( "ParticipationRate" , float_opt_to_json x.f_ListOrdGrp_ParticipationRate );
    ( "PositionEffect" , positioneffect_opt_to_json x.f_ListOrdGrp_PositionEffect );
    ( "PreallocMethod" , preallocmethod_opt_to_json x.f_ListOrdGrp_PreallocMethod );
    ( "PrevClosePx" , float_opt_to_json x.f_ListOrdGrp_PrevClosePx );
    ( "Price" , float_opt_to_json x.f_ListOrdGrp_Price );
    ( "Price2" , float_opt_to_json x.f_ListOrdGrp_Price2 );
    ( "PriceType" , pricetype_opt_to_json x.f_ListOrdGrp_PriceType );
    ( "ProcessCode" , processcode_opt_to_json x.f_ListOrdGrp_ProcessCode );
    ( "QtyType" , qtytype_opt_to_json x.f_ListOrdGrp_QtyType );
    ( "QuoteID" , string_opt_to_json x.f_ListOrdGrp_QuoteID );
    ( "SecondaryClOrdID" , string_opt_to_json x.f_ListOrdGrp_SecondaryClOrdID );
    ( "SettlCurrency" , currency_opt_to_json x.f_ListOrdGrp_SettlCurrency );
    ( "SettlDate" , localmktdate_opt_to_json x.f_ListOrdGrp_SettlDate );
    ( "SettlDate2" , localmktdate_opt_to_json x.f_ListOrdGrp_SettlDate2 );
    ( "SettlInstMode" , settlinstmode_opt_to_json x.f_ListOrdGrp_SettlInstMode );
    ( "SettlType" , settltype_opt_to_json x.f_ListOrdGrp_SettlType );
    ( "Side" , side_to_json x.f_ListOrdGrp_Side );
    ( "SideValueInd" , sidevalueind_opt_to_json x.f_ListOrdGrp_SideValueInd );
    ( "SolicitedFlag" , solicitedflag_opt_to_json x.f_ListOrdGrp_SolicitedFlag );
    ( "StopPx" , float_opt_to_json x.f_ListOrdGrp_StopPx );
    ( "TargetStrategy" , targetstrategy_opt_to_json x.f_ListOrdGrp_TargetStrategy );
    ( "TargetStrategyParameters" , string_opt_to_json x.f_ListOrdGrp_TargetStrategyParameters );
    ( "Text" , string_opt_to_json x.f_ListOrdGrp_Text );
    ( "TimeInForce" , timeinforce_opt_to_json x.f_ListOrdGrp_TimeInForce );
    ( "TradeDate" , localmktdate_opt_to_json x.f_ListOrdGrp_TradeDate );
    ( "TradeOriginationDate" , localmktdate_opt_to_json x.f_ListOrdGrp_TradeOriginationDate );
    ( "TransactTime" , utctimestamp_opt_to_json x.f_ListOrdGrp_TransactTime );
    ( "CommissionData" , commissiondata_to_json x.f_ListOrdGrp_CommissionData );
    ( "DiscretionInstructions" , discretioninstructions_to_json x.f_ListOrdGrp_DiscretionInstructions );
    ( "Instrument" , instrument_to_json x.f_ListOrdGrp_Instrument );
    ( "OrderQtyData" , orderqtydata_to_json x.f_ListOrdGrp_OrderQtyData );
    ( "Parties" , parties_to_json x.f_ListOrdGrp_Parties );
    ( "PegInstructions" , peginstructions_to_json x.f_ListOrdGrp_PegInstructions );
    ( "PreAllocGrp" , preallocgrp_to_json x.f_ListOrdGrp_PreAllocGrp );
    ( "SpreadOrBenchmarkCurveData" , spreadorbenchmarkcurvedata_to_json x.f_ListOrdGrp_SpreadOrBenchmarkCurveData );
    ( "Stipulations" , stipulations_to_json x.f_ListOrdGrp_Stipulations );
    ( "TrdgSesGrp" , trdgsesgrp_to_json x.f_ListOrdGrp_TrdgSesGrp );
    ( "UndInstrmtGrp" , undinstrmtgrp_to_json x.f_ListOrdGrp_UndInstrmtGrp );
    ( "YieldData" , yielddata_to_json x.f_ListOrdGrp_YieldData )
    ]
;;

let affectedordgrp_to_json x : json =
    assoc_filter_nulls [
    ( "AffectedOrderID" , string_opt_to_json x.f_AffectedOrdGrp_AffectedOrderID );
    ( "AffectedSecondaryOrderID" , string_opt_to_json x.f_AffectedOrdGrp_AffectedSecondaryOrderID );
    ( "NoAffectedOrders" , int_opt_to_json x.f_AffectedOrdGrp_NoAffectedOrders );
    ( "OrigClOrdID" , string_opt_to_json x.f_AffectedOrdGrp_OrigClOrdID )
    ]
;;

let posundinstrmtgrp_to_json x : json =
    assoc_filter_nulls [
    ( "NoUnderlyings" , int_opt_to_json x.f_PosUndInstrmtGrp_NoUnderlyings );
    ( "UnderlyingSettlPrice" , float_to_json x.f_PosUndInstrmtGrp_UnderlyingSettlPrice );
    ( "UnderlyingSettlPriceType" , int_to_json x.f_PosUndInstrmtGrp_UnderlyingSettlPriceType );
    ( "UnderlyingInstrument" , underlyinginstrument_to_json x.f_PosUndInstrmtGrp_UnderlyingInstrument )
    ]
;;

let legbenchmarkcurvedata_to_json x : json =
    assoc_filter_nulls [
    ( "LegBenchmarkCurveCurrency" , currency_opt_to_json x.f_LegBenchmarkCurveData_LegBenchmarkCurveCurrency );
    ( "LegBenchmarkCurveName" , string_opt_to_json x.f_LegBenchmarkCurveData_LegBenchmarkCurveName );
    ( "LegBenchmarkCurvePoint" , string_opt_to_json x.f_LegBenchmarkCurveData_LegBenchmarkCurvePoint );
    ( "LegBenchmarkPrice" , float_opt_to_json x.f_LegBenchmarkCurveData_LegBenchmarkPrice );
    ( "LegBenchmarkPriceType" , int_opt_to_json x.f_LegBenchmarkCurveData_LegBenchmarkPriceType )
    ]
;;

let quotqualgrp_to_json x : json =
    assoc_filter_nulls [
    ( "NoQuoteQualifiers" , int_opt_to_json x.f_QuotQualGrp_NoQuoteQualifiers );
    ( "QuoteQualifier" , char_opt_to_json x.f_QuotQualGrp_QuoteQualifier )
    ]
;;

let legquotgrp_to_json x : json =
    assoc_filter_nulls [
    ( "LegBidPx" , float_opt_to_json x.f_LegQuotGrp_LegBidPx );
    ( "LegOfferPx" , float_opt_to_json x.f_LegQuotGrp_LegOfferPx );
    ( "LegPriceType" , int_opt_to_json x.f_LegQuotGrp_LegPriceType );
    ( "LegQty" , float_opt_to_json x.f_LegQuotGrp_LegQty );
    ( "LegSettlDate" , localmktdate_opt_to_json x.f_LegQuotGrp_LegSettlDate );
    ( "LegSettlType" , char_opt_to_json x.f_LegQuotGrp_LegSettlType );
    ( "LegSwapType" , legswaptype_opt_to_json x.f_LegQuotGrp_LegSwapType );
    ( "NoLegs" , int_opt_to_json x.f_LegQuotGrp_NoLegs );
    ( "InstrumentLeg" , instrumentleg_to_json x.f_LegQuotGrp_InstrumentLeg );
    ( "LegBenchmarkCurveData" , legbenchmarkcurvedata_to_json x.f_LegQuotGrp_LegBenchmarkCurveData );
    ( "LegStipulations" , legstipulations_to_json x.f_LegQuotGrp_LegStipulations );
    ( "NestedParties" , nestedparties_to_json x.f_LegQuotGrp_NestedParties )
    ]
;;

let quotcxlentriesgrp_to_json x : json =
    assoc_filter_nulls [
    ( "NoQuoteEntries" , int_opt_to_json x.f_QuotCxlEntriesGrp_NoQuoteEntries );
    ( "FinancingDetails" , financingdetails_to_json x.f_QuotCxlEntriesGrp_FinancingDetails );
    ( "InstrmtLegGrp" , instrmtleggrp_to_json x.f_QuotCxlEntriesGrp_InstrmtLegGrp );
    ( "Instrument" , instrument_to_json x.f_QuotCxlEntriesGrp_Instrument );
    ( "UndInstrmtGrp" , undinstrmtgrp_to_json x.f_QuotCxlEntriesGrp_UndInstrmtGrp )
    ]
;;

let quotreqlegsgrp_to_json x : json =
    assoc_filter_nulls [
    ( "LegQty" , float_opt_to_json x.f_QuotReqLegsGrp_LegQty );
    ( "LegSettlDate" , localmktdate_opt_to_json x.f_QuotReqLegsGrp_LegSettlDate );
    ( "LegSettlType" , char_opt_to_json x.f_QuotReqLegsGrp_LegSettlType );
    ( "LegSwapType" , legswaptype_opt_to_json x.f_QuotReqLegsGrp_LegSwapType );
    ( "NoLegs" , int_opt_to_json x.f_QuotReqLegsGrp_NoLegs );
    ( "InstrumentLeg" , instrumentleg_to_json x.f_QuotReqLegsGrp_InstrumentLeg );
    ( "LegBenchmarkCurveData" , legbenchmarkcurvedata_to_json x.f_QuotReqLegsGrp_LegBenchmarkCurveData );
    ( "LegStipulations" , legstipulations_to_json x.f_QuotReqLegsGrp_LegStipulations );
    ( "NestedParties" , nestedparties_to_json x.f_QuotReqLegsGrp_NestedParties )
    ]
;;

let quotreqgrp_to_json x : json =
    assoc_filter_nulls [
    ( "Account" , string_opt_to_json x.f_QuotReqGrp_Account );
    ( "AccountType" , accounttype_opt_to_json x.f_QuotReqGrp_AccountType );
    ( "AcctIDSource" , acctidsource_opt_to_json x.f_QuotReqGrp_AcctIDSource );
    ( "Currency" , currency_opt_to_json x.f_QuotReqGrp_Currency );
    ( "ExpireTime" , utctimestamp_opt_to_json x.f_QuotReqGrp_ExpireTime );
    ( "NoRelatedSym" , int_to_json x.f_QuotReqGrp_NoRelatedSym );
    ( "OrdType" , ordtype_opt_to_json x.f_QuotReqGrp_OrdType );
    ( "OrderQty2" , float_opt_to_json x.f_QuotReqGrp_OrderQty2 );
    ( "PrevClosePx" , float_opt_to_json x.f_QuotReqGrp_PrevClosePx );
    ( "Price" , float_opt_to_json x.f_QuotReqGrp_Price );
    ( "Price2" , float_opt_to_json x.f_QuotReqGrp_Price2 );
    ( "PriceType" , pricetype_opt_to_json x.f_QuotReqGrp_PriceType );
    ( "QtyType" , qtytype_opt_to_json x.f_QuotReqGrp_QtyType );
    ( "QuotePriceType" , quotepricetype_opt_to_json x.f_QuotReqGrp_QuotePriceType );
    ( "QuoteRequestType" , quoterequesttype_opt_to_json x.f_QuotReqGrp_QuoteRequestType );
    ( "QuoteType" , quotetype_opt_to_json x.f_QuotReqGrp_QuoteType );
    ( "SettlDate" , localmktdate_opt_to_json x.f_QuotReqGrp_SettlDate );
    ( "SettlDate2" , localmktdate_opt_to_json x.f_QuotReqGrp_SettlDate2 );
    ( "SettlType" , settltype_opt_to_json x.f_QuotReqGrp_SettlType );
    ( "Side" , side_opt_to_json x.f_QuotReqGrp_Side );
    ( "TradeOriginationDate" , localmktdate_opt_to_json x.f_QuotReqGrp_TradeOriginationDate );
    ( "TradingSessionID" , string_opt_to_json x.f_QuotReqGrp_TradingSessionID );
    ( "TradingSessionSubID" , string_opt_to_json x.f_QuotReqGrp_TradingSessionSubID );
    ( "TransactTime" , utctimestamp_opt_to_json x.f_QuotReqGrp_TransactTime );
    ( "ValidUntilTime" , utctimestamp_opt_to_json x.f_QuotReqGrp_ValidUntilTime );
    ( "FinancingDetails" , financingdetails_to_json x.f_QuotReqGrp_FinancingDetails );
    ( "Instrument" , instrument_to_json x.f_QuotReqGrp_Instrument );
    ( "OrderQtyData" , orderqtydata_to_json x.f_QuotReqGrp_OrderQtyData );
    ( "Parties" , parties_to_json x.f_QuotReqGrp_Parties );
    ( "QuotQualGrp" , quotqualgrp_to_json x.f_QuotReqGrp_QuotQualGrp );
    ( "QuotReqLegsGrp" , quotreqlegsgrp_to_json x.f_QuotReqGrp_QuotReqLegsGrp );
    ( "SpreadOrBenchmarkCurveData" , spreadorbenchmarkcurvedata_to_json x.f_QuotReqGrp_SpreadOrBenchmarkCurveData );
    ( "Stipulations" , stipulations_to_json x.f_QuotReqGrp_Stipulations );
    ( "UndInstrmtGrp" , undinstrmtgrp_to_json x.f_QuotReqGrp_UndInstrmtGrp );
    ( "YieldData" , yielddata_to_json x.f_QuotReqGrp_YieldData )
    ]
;;

let quotreqrjctgrp_to_json x : json =
    assoc_filter_nulls [
    ( "Account" , string_opt_to_json x.f_QuotReqRjctGrp_Account );
    ( "AccountType" , accounttype_opt_to_json x.f_QuotReqRjctGrp_AccountType );
    ( "AcctIDSource" , acctidsource_opt_to_json x.f_QuotReqRjctGrp_AcctIDSource );
    ( "Currency" , currency_opt_to_json x.f_QuotReqRjctGrp_Currency );
    ( "ExpireTime" , utctimestamp_opt_to_json x.f_QuotReqRjctGrp_ExpireTime );
    ( "NoRelatedSym" , int_to_json x.f_QuotReqRjctGrp_NoRelatedSym );
    ( "OrdType" , ordtype_opt_to_json x.f_QuotReqRjctGrp_OrdType );
    ( "OrderQty2" , float_opt_to_json x.f_QuotReqRjctGrp_OrderQty2 );
    ( "PrevClosePx" , float_opt_to_json x.f_QuotReqRjctGrp_PrevClosePx );
    ( "Price" , float_opt_to_json x.f_QuotReqRjctGrp_Price );
    ( "Price2" , float_opt_to_json x.f_QuotReqRjctGrp_Price2 );
    ( "PriceType" , pricetype_opt_to_json x.f_QuotReqRjctGrp_PriceType );
    ( "QtyType" , qtytype_opt_to_json x.f_QuotReqRjctGrp_QtyType );
    ( "QuotePriceType" , quotepricetype_opt_to_json x.f_QuotReqRjctGrp_QuotePriceType );
    ( "QuoteRequestType" , quoterequesttype_opt_to_json x.f_QuotReqRjctGrp_QuoteRequestType );
    ( "QuoteType" , quotetype_opt_to_json x.f_QuotReqRjctGrp_QuoteType );
    ( "SettlDate" , localmktdate_opt_to_json x.f_QuotReqRjctGrp_SettlDate );
    ( "SettlDate2" , localmktdate_opt_to_json x.f_QuotReqRjctGrp_SettlDate2 );
    ( "SettlType" , settltype_opt_to_json x.f_QuotReqRjctGrp_SettlType );
    ( "Side" , side_opt_to_json x.f_QuotReqRjctGrp_Side );
    ( "TradeOriginationDate" , localmktdate_opt_to_json x.f_QuotReqRjctGrp_TradeOriginationDate );
    ( "TradingSessionID" , string_opt_to_json x.f_QuotReqRjctGrp_TradingSessionID );
    ( "TradingSessionSubID" , string_opt_to_json x.f_QuotReqRjctGrp_TradingSessionSubID );
    ( "TransactTime" , utctimestamp_opt_to_json x.f_QuotReqRjctGrp_TransactTime );
    ( "FinancingDetails" , financingdetails_to_json x.f_QuotReqRjctGrp_FinancingDetails );
    ( "Instrument" , instrument_to_json x.f_QuotReqRjctGrp_Instrument );
    ( "OrderQtyData" , orderqtydata_to_json x.f_QuotReqRjctGrp_OrderQtyData );
    ( "Parties" , parties_to_json x.f_QuotReqRjctGrp_Parties );
    ( "QuotQualGrp" , quotqualgrp_to_json x.f_QuotReqRjctGrp_QuotQualGrp );
    ( "QuotReqLegsGrp" , quotreqlegsgrp_to_json x.f_QuotReqRjctGrp_QuotReqLegsGrp );
    ( "SpreadOrBenchmarkCurveData" , spreadorbenchmarkcurvedata_to_json x.f_QuotReqRjctGrp_SpreadOrBenchmarkCurveData );
    ( "Stipulations" , stipulations_to_json x.f_QuotReqRjctGrp_Stipulations );
    ( "UndInstrmtGrp" , undinstrmtgrp_to_json x.f_QuotReqRjctGrp_UndInstrmtGrp );
    ( "YieldData" , yielddata_to_json x.f_QuotReqRjctGrp_YieldData )
    ]
;;

let legquotstatgrp_to_json x : json =
    assoc_filter_nulls [
    ( "LegQty" , float_opt_to_json x.f_LegQuotStatGrp_LegQty );
    ( "LegSettlDate" , localmktdate_opt_to_json x.f_LegQuotStatGrp_LegSettlDate );
    ( "LegSettlType" , char_opt_to_json x.f_LegQuotStatGrp_LegSettlType );
    ( "LegSwapType" , legswaptype_opt_to_json x.f_LegQuotStatGrp_LegSwapType );
    ( "NoLegs" , int_opt_to_json x.f_LegQuotStatGrp_NoLegs );
    ( "InstrumentLeg" , instrumentleg_to_json x.f_LegQuotStatGrp_InstrumentLeg );
    ( "LegStipulations" , legstipulations_to_json x.f_LegQuotStatGrp_LegStipulations );
    ( "NestedParties" , nestedparties_to_json x.f_LegQuotStatGrp_NestedParties )
    ]
;;

let rfqreqgrp_to_json x : json =
    assoc_filter_nulls [
    ( "NoRelatedSym" , int_to_json x.f_RFQReqGrp_NoRelatedSym );
    ( "PrevClosePx" , float_opt_to_json x.f_RFQReqGrp_PrevClosePx );
    ( "QuoteRequestType" , quoterequesttype_opt_to_json x.f_RFQReqGrp_QuoteRequestType );
    ( "QuoteType" , quotetype_opt_to_json x.f_RFQReqGrp_QuoteType );
    ( "TradingSessionID" , string_opt_to_json x.f_RFQReqGrp_TradingSessionID );
    ( "TradingSessionSubID" , string_opt_to_json x.f_RFQReqGrp_TradingSessionSubID );
    ( "InstrmtLegGrp" , instrmtleggrp_to_json x.f_RFQReqGrp_InstrmtLegGrp );
    ( "Instrument" , instrument_to_json x.f_RFQReqGrp_Instrument );
    ( "UndInstrmtGrp" , undinstrmtgrp_to_json x.f_RFQReqGrp_UndInstrmtGrp )
    ]
;;

let rgstdtlsgrp_to_json x : json =
    assoc_filter_nulls [
    ( "DateOfBirth" , localmktdate_opt_to_json x.f_RgstDtlsGrp_DateOfBirth );
    ( "InvestorCountryOfResidence" , country_opt_to_json x.f_RgstDtlsGrp_InvestorCountryOfResidence );
    ( "MailingDtls" , string_opt_to_json x.f_RgstDtlsGrp_MailingDtls );
    ( "MailingInst" , string_opt_to_json x.f_RgstDtlsGrp_MailingInst );
    ( "NoRegistDtls" , int_opt_to_json x.f_RgstDtlsGrp_NoRegistDtls );
    ( "OwnerType" , ownertype_opt_to_json x.f_RgstDtlsGrp_OwnerType );
    ( "RegistDtls" , string_opt_to_json x.f_RgstDtlsGrp_RegistDtls );
    ( "RegistEmail" , string_opt_to_json x.f_RgstDtlsGrp_RegistEmail );
    ( "NestedParties" , nestedparties_to_json x.f_RgstDtlsGrp_NestedParties )
    ]
;;

let rgstdistinstgrp_to_json x : json =
    assoc_filter_nulls [
    ( "CashDistribAgentAcctName" , string_opt_to_json x.f_RgstDistInstGrp_CashDistribAgentAcctName );
    ( "CashDistribAgentAcctNumber" , string_opt_to_json x.f_RgstDistInstGrp_CashDistribAgentAcctNumber );
    ( "CashDistribAgentCode" , string_opt_to_json x.f_RgstDistInstGrp_CashDistribAgentCode );
    ( "CashDistribAgentName" , string_opt_to_json x.f_RgstDistInstGrp_CashDistribAgentName );
    ( "CashDistribCurr" , currency_opt_to_json x.f_RgstDistInstGrp_CashDistribCurr );
    ( "CashDistribPayRef" , string_opt_to_json x.f_RgstDistInstGrp_CashDistribPayRef );
    ( "DistribPaymentMethod" , distribpaymentmethod_opt_to_json x.f_RgstDistInstGrp_DistribPaymentMethod );
    ( "DistribPercentage" , float_opt_to_json x.f_RgstDistInstGrp_DistribPercentage );
    ( "NoDistribInsts" , int_opt_to_json x.f_RgstDistInstGrp_NoDistribInsts )
    ]
;;

let instrmtlegseclistgrp_to_json x : json =
    assoc_filter_nulls [
    ( "LegSettlType" , char_opt_to_json x.f_InstrmtLegSecListGrp_LegSettlType );
    ( "LegSwapType" , legswaptype_opt_to_json x.f_InstrmtLegSecListGrp_LegSwapType );
    ( "NoLegs" , int_opt_to_json x.f_InstrmtLegSecListGrp_NoLegs );
    ( "InstrumentLeg" , instrumentleg_to_json x.f_InstrmtLegSecListGrp_InstrumentLeg );
    ( "LegBenchmarkCurveData" , legbenchmarkcurvedata_to_json x.f_InstrmtLegSecListGrp_LegBenchmarkCurveData );
    ( "LegStipulations" , legstipulations_to_json x.f_InstrmtLegSecListGrp_LegStipulations )
    ]
;;

let seclistgrp_to_json x : json =
    assoc_filter_nulls [
    ( "Currency" , currency_opt_to_json x.f_SecListGrp_Currency );
    ( "EncodedText" , string_opt_to_json x.f_SecListGrp_EncodedText );
    ( "EncodedTextLen" , int_opt_to_json x.f_SecListGrp_EncodedTextLen );
    ( "ExpirationCycle" , expirationcycle_opt_to_json x.f_SecListGrp_ExpirationCycle );
    ( "MinTradeVol" , float_opt_to_json x.f_SecListGrp_MinTradeVol );
    ( "NoRelatedSym" , int_opt_to_json x.f_SecListGrp_NoRelatedSym );
    ( "RoundLot" , float_opt_to_json x.f_SecListGrp_RoundLot );
    ( "Text" , string_opt_to_json x.f_SecListGrp_Text );
    ( "TradingSessionID" , string_opt_to_json x.f_SecListGrp_TradingSessionID );
    ( "TradingSessionSubID" , string_opt_to_json x.f_SecListGrp_TradingSessionSubID );
    ( "FinancingDetails" , financingdetails_to_json x.f_SecListGrp_FinancingDetails );
    ( "InstrmtLegSecListGrp" , instrmtlegseclistgrp_to_json x.f_SecListGrp_InstrmtLegSecListGrp );
    ( "Instrument" , instrument_to_json x.f_SecListGrp_Instrument );
    ( "InstrumentExtension" , instrumentextension_to_json x.f_SecListGrp_InstrumentExtension );
    ( "SpreadOrBenchmarkCurveData" , spreadorbenchmarkcurvedata_to_json x.f_SecListGrp_SpreadOrBenchmarkCurveData );
    ( "Stipulations" , stipulations_to_json x.f_SecListGrp_Stipulations );
    ( "UndInstrmtGrp" , undinstrmtgrp_to_json x.f_SecListGrp_UndInstrmtGrp );
    ( "YieldData" , yielddata_to_json x.f_SecListGrp_YieldData )
    ]
;;

let sectypesgrp_to_json x : json =
    assoc_filter_nulls [
    ( "CFICode" , string_opt_to_json x.f_SecTypesGrp_CFICode );
    ( "NoSecurityTypes" , int_opt_to_json x.f_SecTypesGrp_NoSecurityTypes );
    ( "Product" , product_opt_to_json x.f_SecTypesGrp_Product );
    ( "SecuritySubType" , string_opt_to_json x.f_SecTypesGrp_SecuritySubType );
    ( "SecurityType" , securitytype_opt_to_json x.f_SecTypesGrp_SecurityType )
    ]
;;

let settlinstgrp_to_json x : json =
    assoc_filter_nulls [
    ( "CFICode" , string_opt_to_json x.f_SettlInstGrp_CFICode );
    ( "CardExpDate" , localmktdate_opt_to_json x.f_SettlInstGrp_CardExpDate );
    ( "CardHolderName" , string_opt_to_json x.f_SettlInstGrp_CardHolderName );
    ( "CardIssNum" , string_opt_to_json x.f_SettlInstGrp_CardIssNum );
    ( "CardNumber" , string_opt_to_json x.f_SettlInstGrp_CardNumber );
    ( "CardStartDate" , localmktdate_opt_to_json x.f_SettlInstGrp_CardStartDate );
    ( "EffectiveTime" , utctimestamp_opt_to_json x.f_SettlInstGrp_EffectiveTime );
    ( "ExpireTime" , utctimestamp_opt_to_json x.f_SettlInstGrp_ExpireTime );
    ( "LastUpdateTime" , utctimestamp_opt_to_json x.f_SettlInstGrp_LastUpdateTime );
    ( "NoSettlInst" , int_opt_to_json x.f_SettlInstGrp_NoSettlInst );
    ( "PaymentDate" , localmktdate_opt_to_json x.f_SettlInstGrp_PaymentDate );
    ( "PaymentMethod" , paymentmethod_opt_to_json x.f_SettlInstGrp_PaymentMethod );
    ( "PaymentRef" , string_opt_to_json x.f_SettlInstGrp_PaymentRef );
    ( "PaymentRemitterID" , string_opt_to_json x.f_SettlInstGrp_PaymentRemitterID );
    ( "Product" , product_opt_to_json x.f_SettlInstGrp_Product );
    ( "SecurityType" , securitytype_opt_to_json x.f_SettlInstGrp_SecurityType );
    ( "SettlInstID" , string_opt_to_json x.f_SettlInstGrp_SettlInstID );
    ( "SettlInstRefID" , string_opt_to_json x.f_SettlInstGrp_SettlInstRefID );
    ( "SettlInstTransType" , settlinsttranstype_opt_to_json x.f_SettlInstGrp_SettlInstTransType );
    ( "Side" , side_opt_to_json x.f_SettlInstGrp_Side );
    ( "Parties" , parties_to_json x.f_SettlInstGrp_Parties );
    ( "SettlInstructionsData" , settlinstructionsdata_to_json x.f_SettlInstGrp_SettlInstructionsData )
    ]
;;

let trdallocgrp_to_json x : json =
    assoc_filter_nulls [
    ( "AllocAccount" , string_opt_to_json x.f_TrdAllocGrp_AllocAccount );
    ( "AllocAcctIDSource" , int_opt_to_json x.f_TrdAllocGrp_AllocAcctIDSource );
    ( "AllocQty" , float_opt_to_json x.f_TrdAllocGrp_AllocQty );
    ( "AllocSettlCurrency" , currency_opt_to_json x.f_TrdAllocGrp_AllocSettlCurrency );
    ( "IndividualAllocID" , string_opt_to_json x.f_TrdAllocGrp_IndividualAllocID );
    ( "NoAllocs" , int_opt_to_json x.f_TrdAllocGrp_NoAllocs );
    ( "NestedParties2" , nestedparties2_to_json x.f_TrdAllocGrp_NestedParties2 )
    ]
;;

let trdinstrmtleggrp_to_json x : json =
    assoc_filter_nulls [
    ( "LegCoveredOrUncovered" , int_opt_to_json x.f_TrdInstrmtLegGrp_LegCoveredOrUncovered );
    ( "LegLastPx" , float_opt_to_json x.f_TrdInstrmtLegGrp_LegLastPx );
    ( "LegPositionEffect" , char_opt_to_json x.f_TrdInstrmtLegGrp_LegPositionEffect );
    ( "LegPrice" , float_opt_to_json x.f_TrdInstrmtLegGrp_LegPrice );
    ( "LegQty" , float_opt_to_json x.f_TrdInstrmtLegGrp_LegQty );
    ( "LegRefID" , string_opt_to_json x.f_TrdInstrmtLegGrp_LegRefID );
    ( "LegSettlDate" , localmktdate_opt_to_json x.f_TrdInstrmtLegGrp_LegSettlDate );
    ( "LegSettlType" , char_opt_to_json x.f_TrdInstrmtLegGrp_LegSettlType );
    ( "LegSwapType" , legswaptype_opt_to_json x.f_TrdInstrmtLegGrp_LegSwapType );
    ( "NoLegs" , int_opt_to_json x.f_TrdInstrmtLegGrp_NoLegs );
    ( "InstrumentLeg" , instrumentleg_to_json x.f_TrdInstrmtLegGrp_InstrumentLeg );
    ( "LegStipulations" , legstipulations_to_json x.f_TrdInstrmtLegGrp_LegStipulations );
    ( "NestedParties" , nestedparties_to_json x.f_TrdInstrmtLegGrp_NestedParties )
    ]
;;

let trdcaprptsidegrp_to_json x : json =
    assoc_filter_nulls [
    ( "Account" , string_opt_to_json x.f_TrdCapRptSideGrp_Account );
    ( "AccountType" , accounttype_opt_to_json x.f_TrdCapRptSideGrp_AccountType );
    ( "AccruedInterestAmt" , float_opt_to_json x.f_TrdCapRptSideGrp_AccruedInterestAmt );
    ( "AccruedInterestRate" , float_opt_to_json x.f_TrdCapRptSideGrp_AccruedInterestRate );
    ( "AcctIDSource" , acctidsource_opt_to_json x.f_TrdCapRptSideGrp_AcctIDSource );
    ( "AllocID" , string_opt_to_json x.f_TrdCapRptSideGrp_AllocID );
    ( "ClOrdID" , string_opt_to_json x.f_TrdCapRptSideGrp_ClOrdID );
    ( "ComplianceID" , string_opt_to_json x.f_TrdCapRptSideGrp_ComplianceID );
    ( "Concession" , float_opt_to_json x.f_TrdCapRptSideGrp_Concession );
    ( "Currency" , currency_opt_to_json x.f_TrdCapRptSideGrp_Currency );
    ( "CustOrderCapacity" , custordercapacity_opt_to_json x.f_TrdCapRptSideGrp_CustOrderCapacity );
    ( "EncodedText" , string_opt_to_json x.f_TrdCapRptSideGrp_EncodedText );
    ( "EncodedTextLen" , int_opt_to_json x.f_TrdCapRptSideGrp_EncodedTextLen );
    ( "EndAccruedInterestAmt" , float_opt_to_json x.f_TrdCapRptSideGrp_EndAccruedInterestAmt );
    ( "EndCash" , float_opt_to_json x.f_TrdCapRptSideGrp_EndCash );
    ( "ExDate" , localmktdate_opt_to_json x.f_TrdCapRptSideGrp_ExDate );
    ( "ExchangeRule" , string_opt_to_json x.f_TrdCapRptSideGrp_ExchangeRule );
    ( "ExecInst" , execinst_opt_to_json x.f_TrdCapRptSideGrp_ExecInst );
    ( "GrossTradeAmt" , float_opt_to_json x.f_TrdCapRptSideGrp_GrossTradeAmt );
    ( "InterestAtMaturity" , float_opt_to_json x.f_TrdCapRptSideGrp_InterestAtMaturity );
    ( "ListID" , string_opt_to_json x.f_TrdCapRptSideGrp_ListID );
    ( "NetMoney" , float_opt_to_json x.f_TrdCapRptSideGrp_NetMoney );
    ( "NoSides" , nosides_to_json x.f_TrdCapRptSideGrp_NoSides );
    ( "NumDaysInterest" , int_opt_to_json x.f_TrdCapRptSideGrp_NumDaysInterest );
    ( "OddLot" , oddlot_opt_to_json x.f_TrdCapRptSideGrp_OddLot );
    ( "OrdType" , ordtype_opt_to_json x.f_TrdCapRptSideGrp_OrdType );
    ( "OrderCapacity" , ordercapacity_opt_to_json x.f_TrdCapRptSideGrp_OrderCapacity );
    ( "OrderID" , string_to_json x.f_TrdCapRptSideGrp_OrderID );
    ( "OrderInputDevice" , string_opt_to_json x.f_TrdCapRptSideGrp_OrderInputDevice );
    ( "OrderRestrictions" , orderrestrictions_opt_to_json x.f_TrdCapRptSideGrp_OrderRestrictions );
    ( "PositionEffect" , positioneffect_opt_to_json x.f_TrdCapRptSideGrp_PositionEffect );
    ( "PreallocMethod" , preallocmethod_opt_to_json x.f_TrdCapRptSideGrp_PreallocMethod );
    ( "ProcessCode" , processcode_opt_to_json x.f_TrdCapRptSideGrp_ProcessCode );
    ( "SecondaryClOrdID" , string_opt_to_json x.f_TrdCapRptSideGrp_SecondaryClOrdID );
    ( "SecondaryOrderID" , string_opt_to_json x.f_TrdCapRptSideGrp_SecondaryOrderID );
    ( "SettlCurrAmt" , float_opt_to_json x.f_TrdCapRptSideGrp_SettlCurrAmt );
    ( "SettlCurrFxRate" , float_opt_to_json x.f_TrdCapRptSideGrp_SettlCurrFxRate );
    ( "SettlCurrFxRateCalc" , settlcurrfxratecalc_opt_to_json x.f_TrdCapRptSideGrp_SettlCurrFxRateCalc );
    ( "SettlCurrency" , currency_opt_to_json x.f_TrdCapRptSideGrp_SettlCurrency );
    ( "Side" , side_to_json x.f_TrdCapRptSideGrp_Side );
    ( "SideMultiLegReportingType" , sidemultilegreportingtype_opt_to_json x.f_TrdCapRptSideGrp_SideMultiLegReportingType );
    ( "SolicitedFlag" , solicitedflag_opt_to_json x.f_TrdCapRptSideGrp_SolicitedFlag );
    ( "StartCash" , float_opt_to_json x.f_TrdCapRptSideGrp_StartCash );
    ( "Text" , string_opt_to_json x.f_TrdCapRptSideGrp_Text );
    ( "TimeBracket" , string_opt_to_json x.f_TrdCapRptSideGrp_TimeBracket );
    ( "TotalTakedown" , float_opt_to_json x.f_TrdCapRptSideGrp_TotalTakedown );
    ( "TradeAllocIndicator" , tradeallocindicator_opt_to_json x.f_TrdCapRptSideGrp_TradeAllocIndicator );
    ( "TradeInputDevice" , string_opt_to_json x.f_TrdCapRptSideGrp_TradeInputDevice );
    ( "TradeInputSource" , string_opt_to_json x.f_TrdCapRptSideGrp_TradeInputSource );
    ( "TradingSessionID" , string_opt_to_json x.f_TrdCapRptSideGrp_TradingSessionID );
    ( "TradingSessionSubID" , string_opt_to_json x.f_TrdCapRptSideGrp_TradingSessionSubID );
    ( "TransBkdTime" , utctimestamp_opt_to_json x.f_TrdCapRptSideGrp_TransBkdTime );
    ( "ClrInstGrp" , clrinstgrp_to_json x.f_TrdCapRptSideGrp_ClrInstGrp );
    ( "CommissionData" , commissiondata_to_json x.f_TrdCapRptSideGrp_CommissionData );
    ( "ContAmtGrp" , contamtgrp_to_json x.f_TrdCapRptSideGrp_ContAmtGrp );
    ( "MiscFeesGrp" , miscfeesgrp_to_json x.f_TrdCapRptSideGrp_MiscFeesGrp );
    ( "Parties" , parties_to_json x.f_TrdCapRptSideGrp_Parties );
    ( "Stipulations" , stipulations_to_json x.f_TrdCapRptSideGrp_Stipulations );
    ( "TrdAllocGrp" , trdallocgrp_to_json x.f_TrdCapRptSideGrp_TrdAllocGrp )
    ]
;;

let trdcapdtgrp_to_json x : json =
    assoc_filter_nulls [
    ( "NoDates" , int_opt_to_json x.f_TrdCapDtGrp_NoDates );
    ( "TradeDate" , localmktdate_opt_to_json x.f_TrdCapDtGrp_TradeDate );
    ( "TransactTime" , utctimestamp_opt_to_json x.f_TrdCapDtGrp_TransactTime )
    ]
;;
