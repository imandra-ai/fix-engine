(* @meta[imandra_ignore] on @end *)
open Full_app_tags;;
open Full_app_records;;
open Encode_base_types;;
open Encode_datetime;;
open Encode_app_enums;;
(* @meta[imandra_ignore] off @end *)

let req f x = Some (f x);;
let opt f v = match v with Some x -> Some ( f x ) | None -> None;;

let encode_EvntGrp msg =
    [
    ( "866" , opt encode_LocalMktDate msg.f_EvntGrp_EventDate );
    ( "867" , opt encode_float msg.f_EvntGrp_EventPx );
    ( "868" , opt encode_string msg.f_EvntGrp_EventText );
    ( "865" , opt encode_EventType msg.f_EvntGrp_EventType );
    ( "864" , opt encode_int msg.f_EvntGrp_NoEvents );
    ]
;;

let encode_SecAltIDGrp msg =
    [
    ( "454" , opt encode_int msg.f_SecAltIDGrp_NoSecurityAltID );
    ( "455" , opt encode_string msg.f_SecAltIDGrp_SecurityAltID );
    ( "456" , opt encode_string msg.f_SecAltIDGrp_SecurityAltIDSource );
    ]
;;

let encode_LegSecAltIDGrp msg =
    [
    ( "605" , opt encode_string msg.f_LegSecAltIDGrp_LegSecurityAltID );
    ( "606" , opt encode_string msg.f_LegSecAltIDGrp_LegSecurityAltIDSource );
    ( "604" , opt encode_int msg.f_LegSecAltIDGrp_NoLegSecurityAltID );
    ]
;;

let encode_InstrumentLeg msg =
    encode_LegSecAltIDGrp msg.f_InstrumentLeg_LegSecAltIDGrp @
    [
    ( "619" , opt encode_string msg.f_InstrumentLeg_EncodedLegIssuer );
    ( "618" , opt encode_int msg.f_InstrumentLeg_EncodedLegIssuerLen );
    ( "622" , opt encode_string msg.f_InstrumentLeg_EncodedLegSecurityDesc );
    ( "621" , opt encode_int msg.f_InstrumentLeg_EncodedLegSecurityDescLen );
    ( "608" , opt encode_string msg.f_InstrumentLeg_LegCFICode );
    ( "614" , opt encode_float msg.f_InstrumentLeg_LegContractMultiplier );
    ( "955" , opt encode_MonthYear msg.f_InstrumentLeg_LegContractSettlMonth );
    ( "596" , opt encode_Country msg.f_InstrumentLeg_LegCountryOfIssue );
    ( "248" , opt encode_LocalMktDate msg.f_InstrumentLeg_LegCouponPaymentDate );
    ( "615" , opt encode_float msg.f_InstrumentLeg_LegCouponRate );
    ( "257" , opt encode_string msg.f_InstrumentLeg_LegCreditRating );
    ( "556" , opt encode_Currency msg.f_InstrumentLeg_LegCurrency );
    ( "739" , opt encode_LocalMktDate msg.f_InstrumentLeg_LegDatedDate );
    ( "253" , opt encode_float msg.f_InstrumentLeg_LegFactor );
    ( "599" , opt encode_string msg.f_InstrumentLeg_LegInstrRegistry );
    ( "956" , opt encode_LocalMktDate msg.f_InstrumentLeg_LegInterestAccrualDate );
    ( "249" , opt encode_LocalMktDate msg.f_InstrumentLeg_LegIssueDate );
    ( "617" , opt encode_string msg.f_InstrumentLeg_LegIssuer );
    ( "598" , opt encode_string msg.f_InstrumentLeg_LegLocaleOfIssue );
    ( "611" , opt encode_LocalMktDate msg.f_InstrumentLeg_LegMaturityDate );
    ( "610" , opt encode_MonthYear msg.f_InstrumentLeg_LegMaturityMonthYear );
    ( "613" , opt encode_char msg.f_InstrumentLeg_LegOptAttribute );
    ( "740" , opt encode_string msg.f_InstrumentLeg_LegPool );
    ( "607" , opt encode_int msg.f_InstrumentLeg_LegProduct );
    ( "623" , opt encode_float msg.f_InstrumentLeg_LegRatioQty );
    ( "254" , opt encode_LocalMktDate msg.f_InstrumentLeg_LegRedemptionDate );
    ( "250" , opt encode_string msg.f_InstrumentLeg_LegRepoCollateralSecurityType );
    ( "252" , opt encode_float msg.f_InstrumentLeg_LegRepurchaseRate );
    ( "251" , opt encode_int msg.f_InstrumentLeg_LegRepurchaseTerm );
    ( "620" , opt encode_string msg.f_InstrumentLeg_LegSecurityDesc );
    ( "616" , opt encode_Exchange msg.f_InstrumentLeg_LegSecurityExchange );
    ( "602" , opt encode_string msg.f_InstrumentLeg_LegSecurityID );
    ( "603" , opt encode_string msg.f_InstrumentLeg_LegSecurityIDSource );
    ( "764" , opt encode_string msg.f_InstrumentLeg_LegSecuritySubType );
    ( "609" , opt encode_string msg.f_InstrumentLeg_LegSecurityType );
    ( "624" , opt encode_char msg.f_InstrumentLeg_LegSide );
    ( "597" , opt encode_string msg.f_InstrumentLeg_LegStateOrProvinceOfIssue );
    ( "942" , opt encode_Currency msg.f_InstrumentLeg_LegStrikeCurrency );
    ( "612" , opt encode_float msg.f_InstrumentLeg_LegStrikePrice );
    ( "600" , opt encode_string msg.f_InstrumentLeg_LegSymbol );
    ( "601" , opt encode_string msg.f_InstrumentLeg_LegSymbolSfx );
    ]
;;

let encode_UndSecAltIDGrp msg =
    [
    ( "457" , opt encode_int msg.f_UndSecAltIDGrp_NoUnderlyingSecurityAltID );
    ( "458" , opt encode_string msg.f_UndSecAltIDGrp_UnderlyingSecurityAltID );
    ( "459" , opt encode_string msg.f_UndSecAltIDGrp_UnderlyingSecurityAltIDSource );
    ]
;;

let encode_UnderlyingStipulations msg =
    [
    ( "887" , opt encode_int msg.f_UnderlyingStipulations_NoUnderlyingStips );
    ( "888" , opt encode_string msg.f_UnderlyingStipulations_UnderlyingStipType );
    ( "889" , opt encode_string msg.f_UnderlyingStipulations_UnderlyingStipValue );
    ]
;;

let encode_UnderlyingInstrument msg =
    encode_UndSecAltIDGrp msg.f_UnderlyingInstrument_UndSecAltIDGrp @
    encode_UnderlyingStipulations msg.f_UnderlyingInstrument_UnderlyingStipulations @
    [
    ( "363" , opt encode_string msg.f_UnderlyingInstrument_EncodedUnderlyingIssuer );
    ( "362" , opt encode_int msg.f_UnderlyingInstrument_EncodedUnderlyingIssuerLen );
    ( "365" , opt encode_string msg.f_UnderlyingInstrument_EncodedUnderlyingSecurityDesc );
    ( "364" , opt encode_int msg.f_UnderlyingInstrument_EncodedUnderlyingSecurityDescLen );
    ( "463" , opt encode_string msg.f_UnderlyingInstrument_UnderlyingCFICode );
    ( "877" , opt encode_string msg.f_UnderlyingInstrument_UnderlyingCPProgram );
    ( "878" , opt encode_string msg.f_UnderlyingInstrument_UnderlyingCPRegType );
    ( "436" , opt encode_float msg.f_UnderlyingInstrument_UnderlyingContractMultiplier );
    ( "592" , opt encode_Country msg.f_UnderlyingInstrument_UnderlyingCountryOfIssue );
    ( "241" , opt encode_LocalMktDate msg.f_UnderlyingInstrument_UnderlyingCouponPaymentDate );
    ( "435" , opt encode_float msg.f_UnderlyingInstrument_UnderlyingCouponRate );
    ( "256" , opt encode_string msg.f_UnderlyingInstrument_UnderlyingCreditRating );
    ( "318" , opt encode_Currency msg.f_UnderlyingInstrument_UnderlyingCurrency );
    ( "885" , opt encode_float msg.f_UnderlyingInstrument_UnderlyingCurrentValue );
    ( "882" , opt encode_float msg.f_UnderlyingInstrument_UnderlyingDirtyPrice );
    ( "883" , opt encode_float msg.f_UnderlyingInstrument_UnderlyingEndPrice );
    ( "886" , opt encode_float msg.f_UnderlyingInstrument_UnderlyingEndValue );
    ( "246" , opt encode_float msg.f_UnderlyingInstrument_UnderlyingFactor );
    ( "595" , opt encode_string msg.f_UnderlyingInstrument_UnderlyingInstrRegistry );
    ( "242" , opt encode_LocalMktDate msg.f_UnderlyingInstrument_UnderlyingIssueDate );
    ( "306" , opt encode_string msg.f_UnderlyingInstrument_UnderlyingIssuer );
    ( "594" , opt encode_string msg.f_UnderlyingInstrument_UnderlyingLocaleOfIssue );
    ( "542" , opt encode_LocalMktDate msg.f_UnderlyingInstrument_UnderlyingMaturityDate );
    ( "313" , opt encode_MonthYear msg.f_UnderlyingInstrument_UnderlyingMaturityMonthYear );
    ( "317" , opt encode_char msg.f_UnderlyingInstrument_UnderlyingOptAttribute );
    ( "462" , opt encode_int msg.f_UnderlyingInstrument_UnderlyingProduct );
    ( "315" , opt encode_int msg.f_UnderlyingInstrument_UnderlyingPutOrCall );
    ( "810" , opt encode_float msg.f_UnderlyingInstrument_UnderlyingPx );
    ( "879" , opt encode_float msg.f_UnderlyingInstrument_UnderlyingQty );
    ( "247" , opt encode_LocalMktDate msg.f_UnderlyingInstrument_UnderlyingRedemptionDate );
    ( "243" , opt encode_string msg.f_UnderlyingInstrument_UnderlyingRepoCollateralSecurityType );
    ( "245" , opt encode_float msg.f_UnderlyingInstrument_UnderlyingRepurchaseRate );
    ( "244" , opt encode_int msg.f_UnderlyingInstrument_UnderlyingRepurchaseTerm );
    ( "307" , opt encode_string msg.f_UnderlyingInstrument_UnderlyingSecurityDesc );
    ( "308" , opt encode_Exchange msg.f_UnderlyingInstrument_UnderlyingSecurityExchange );
    ( "309" , opt encode_string msg.f_UnderlyingInstrument_UnderlyingSecurityID );
    ( "305" , opt encode_string msg.f_UnderlyingInstrument_UnderlyingSecurityIDSource );
    ( "763" , opt encode_string msg.f_UnderlyingInstrument_UnderlyingSecuritySubType );
    ( "310" , opt encode_string msg.f_UnderlyingInstrument_UnderlyingSecurityType );
    ( "884" , opt encode_float msg.f_UnderlyingInstrument_UnderlyingStartValue );
    ( "593" , opt encode_string msg.f_UnderlyingInstrument_UnderlyingStateOrProvinceOfIssue );
    ( "941" , opt encode_Currency msg.f_UnderlyingInstrument_UnderlyingStrikeCurrency );
    ( "316" , opt encode_float msg.f_UnderlyingInstrument_UnderlyingStrikePrice );
    ( "311" , opt encode_string msg.f_UnderlyingInstrument_UnderlyingSymbol );
    ( "312" , opt encode_string msg.f_UnderlyingInstrument_UnderlyingSymbolSfx );
    ]
;;

let encode_Instrument msg =
    encode_EvntGrp msg.f_Instrument_EvntGrp @
    encode_SecAltIDGrp msg.f_Instrument_SecAltIDGrp @
    [
    ( "461" , opt encode_string msg.f_Instrument_CFICode );
    ( "875" , opt encode_CPProgram msg.f_Instrument_CPProgram );
    ( "876" , opt encode_string msg.f_Instrument_CPRegType );
    ( "231" , opt encode_float msg.f_Instrument_ContractMultiplier );
    ( "667" , opt encode_MonthYear msg.f_Instrument_ContractSettlMonth );
    ( "470" , opt encode_Country msg.f_Instrument_CountryOfIssue );
    ( "224" , opt encode_LocalMktDate msg.f_Instrument_CouponPaymentDate );
    ( "223" , opt encode_float msg.f_Instrument_CouponRate );
    ( "255" , opt encode_string msg.f_Instrument_CreditRating );
    ( "873" , opt encode_LocalMktDate msg.f_Instrument_DatedDate );
    ( "349" , opt encode_string msg.f_Instrument_EncodedIssuer );
    ( "348" , opt encode_int msg.f_Instrument_EncodedIssuerLen );
    ( "351" , opt encode_string msg.f_Instrument_EncodedSecurityDesc );
    ( "350" , opt encode_int msg.f_Instrument_EncodedSecurityDescLen );
    ( "228" , opt encode_float msg.f_Instrument_Factor );
    ( "543" , opt encode_string msg.f_Instrument_InstrRegistry );
    ( "874" , opt encode_LocalMktDate msg.f_Instrument_InterestAccrualDate );
    ( "225" , opt encode_LocalMktDate msg.f_Instrument_IssueDate );
    ( "106" , opt encode_string msg.f_Instrument_Issuer );
    ( "472" , opt encode_string msg.f_Instrument_LocaleOfIssue );
    ( "541" , opt encode_LocalMktDate msg.f_Instrument_MaturityDate );
    ( "200" , opt encode_MonthYear msg.f_Instrument_MaturityMonthYear );
    ( "206" , opt encode_char msg.f_Instrument_OptAttribute );
    ( "691" , opt encode_string msg.f_Instrument_Pool );
    ( "460" , opt encode_Product msg.f_Instrument_Product );
    ( "201" , opt encode_PutOrCall msg.f_Instrument_PutOrCall );
    ( "240" , opt encode_LocalMktDate msg.f_Instrument_RedemptionDate );
    ( "239" , opt encode_string msg.f_Instrument_RepoCollateralSecurityType );
    ( "227" , opt encode_float msg.f_Instrument_RepurchaseRate );
    ( "226" , opt encode_int msg.f_Instrument_RepurchaseTerm );
    ( "107" , opt encode_string msg.f_Instrument_SecurityDesc );
    ( "207" , opt encode_Exchange msg.f_Instrument_SecurityExchange );
    ( "48" , opt encode_string msg.f_Instrument_SecurityID );
    ( "22" , opt encode_SecurityIDSource msg.f_Instrument_SecurityIDSource );
    ( "762" , opt encode_string msg.f_Instrument_SecuritySubType );
    ( "167" , opt encode_SecurityType msg.f_Instrument_SecurityType );
    ( "471" , opt encode_string msg.f_Instrument_StateOrProvinceOfIssue );
    ( "947" , opt encode_Currency msg.f_Instrument_StrikeCurrency );
    ( "202" , opt encode_float msg.f_Instrument_StrikePrice );
    ( "55" , opt encode_string msg.f_Instrument_Symbol );
    ( "65" , opt encode_string msg.f_Instrument_SymbolSfx );
    ]
;;

let encode_InstrmtLegGrp msg =
    encode_InstrumentLeg msg.f_InstrmtLegGrp_InstrumentLeg @
    [
    ( "555" , opt encode_int msg.f_InstrmtLegGrp_NoLegs );
    ]
;;

let encode_UndInstrmtGrp msg =
    encode_UnderlyingInstrument msg.f_UndInstrmtGrp_UnderlyingInstrument @
    [
    ( "711" , opt encode_int msg.f_UndInstrmtGrp_NoUnderlyings );
    ]
;;

let encode_NstdPtys2SubGrp msg =
    [
    ( "760" , opt encode_string msg.f_NstdPtys2SubGrp_Nested2PartySubID );
    ( "807" , opt encode_int msg.f_NstdPtys2SubGrp_Nested2PartySubIDType );
    ( "806" , opt encode_int msg.f_NstdPtys2SubGrp_NoNested2PartySubIDs );
    ]
;;

let encode_NestedParties2 msg =
    encode_NstdPtys2SubGrp msg.f_NestedParties2_NstdPtys2SubGrp @
    [
    ( "757" , opt encode_string msg.f_NestedParties2_Nested2PartyID );
    ( "758" , opt encode_char msg.f_NestedParties2_Nested2PartyIDSource );
    ( "759" , opt encode_int msg.f_NestedParties2_Nested2PartyRole );
    ( "756" , opt encode_int msg.f_NestedParties2_NoNested2PartyIDs );
    ]
;;

let encode_AttrbGrp msg =
    [
    ( "871" , opt encode_InstrAttribType msg.f_AttrbGrp_InstrAttribType );
    ( "872" , opt encode_string msg.f_AttrbGrp_InstrAttribValue );
    ( "870" , opt encode_int msg.f_AttrbGrp_NoInstrAttrib );
    ]
;;

let encode_PtysSubGrp msg =
    [
    ( "802" , opt encode_int msg.f_PtysSubGrp_NoPartySubIDs );
    ( "523" , opt encode_string msg.f_PtysSubGrp_PartySubID );
    ( "803" , opt encode_PartySubIDType msg.f_PtysSubGrp_PartySubIDType );
    ]
;;

let encode_NstdPtysSubGrp msg =
    [
    ( "545" , opt encode_string msg.f_NstdPtysSubGrp_NestedPartySubID );
    ( "805" , opt encode_int msg.f_NstdPtysSubGrp_NestedPartySubIDType );
    ( "804" , opt encode_int msg.f_NstdPtysSubGrp_NoNestedPartySubIDs );
    ]
;;

let encode_SettlPtysSubGrp msg =
    [
    ( "801" , opt encode_int msg.f_SettlPtysSubGrp_NoSettlPartySubIDs );
    ( "785" , opt encode_string msg.f_SettlPtysSubGrp_SettlPartySubID );
    ( "786" , opt encode_int msg.f_SettlPtysSubGrp_SettlPartySubIDType );
    ]
;;

let encode_SettlParties msg =
    encode_SettlPtysSubGrp msg.f_SettlParties_SettlPtysSubGrp @
    [
    ( "781" , opt encode_int msg.f_SettlParties_NoSettlPartyIDs );
    ( "782" , opt encode_string msg.f_SettlParties_SettlPartyID );
    ( "783" , opt encode_char msg.f_SettlParties_SettlPartyIDSource );
    ( "784" , opt encode_int msg.f_SettlParties_SettlPartyRole );
    ]
;;

let encode_DlvyInstGrp msg =
    encode_SettlParties msg.f_DlvyInstGrp_SettlParties @
    [
    ( "787" , opt encode_DlvyInstType msg.f_DlvyInstGrp_DlvyInstType );
    ( "85" , opt encode_int msg.f_DlvyInstGrp_NoDlvyInst );
    ( "165" , opt encode_SettlInstSource msg.f_DlvyInstGrp_SettlInstSource );
    ]
;;

let encode_ClrInstGrp msg =
    [
    ( "577" , opt encode_ClearingInstruction msg.f_ClrInstGrp_ClearingInstruction );
    ( "576" , opt encode_int msg.f_ClrInstGrp_NoClearingInstructions );
    ]
;;

let encode_CommissionData msg =
    [
    ( "479" , opt encode_Currency msg.f_CommissionData_CommCurrency );
    ( "13" , opt encode_CommType msg.f_CommissionData_CommType );
    ( "12" , opt encode_float msg.f_CommissionData_Commission );
    ( "497" , opt encode_FundRenewWaiv msg.f_CommissionData_FundRenewWaiv );
    ]
;;

let encode_MiscFeesGrp msg =
    [
    ( "137" , opt encode_float msg.f_MiscFeesGrp_MiscFeeAmt );
    ( "891" , opt encode_MiscFeeBasis msg.f_MiscFeesGrp_MiscFeeBasis );
    ( "138" , opt encode_Currency msg.f_MiscFeesGrp_MiscFeeCurr );
    ( "139" , opt encode_MiscFeeType msg.f_MiscFeesGrp_MiscFeeType );
    ( "136" , opt encode_int msg.f_MiscFeesGrp_NoMiscFees );
    ]
;;

let encode_NestedParties msg =
    encode_NstdPtysSubGrp msg.f_NestedParties_NstdPtysSubGrp @
    [
    ( "524" , opt encode_string msg.f_NestedParties_NestedPartyID );
    ( "525" , opt encode_char msg.f_NestedParties_NestedPartyIDSource );
    ( "538" , opt encode_int msg.f_NestedParties_NestedPartyRole );
    ( "539" , opt encode_int msg.f_NestedParties_NoNestedPartyIDs );
    ]
;;

let encode_SettlInstructionsData msg =
    encode_DlvyInstGrp msg.f_SettlInstructionsData_DlvyInstGrp @
    [
    ( "172" , opt encode_SettlDeliveryType msg.f_SettlInstructionsData_SettlDeliveryType );
    ( "171" , opt encode_string msg.f_SettlInstructionsData_StandInstDbID );
    ( "170" , opt encode_string msg.f_SettlInstructionsData_StandInstDbName );
    ( "169" , opt encode_StandInstDbType msg.f_SettlInstructionsData_StandInstDbType );
    ]
;;

let encode_OrdAllocGrp msg =
    encode_NestedParties2 msg.f_OrdAllocGrp_NestedParties2 @
    [
    ( "11" , opt encode_string msg.f_OrdAllocGrp_ClOrdID );
    ( "66" , opt encode_string msg.f_OrdAllocGrp_ListID );
    ( "73" , opt encode_int msg.f_OrdAllocGrp_NoOrders );
    ( "799" , opt encode_float msg.f_OrdAllocGrp_OrderAvgPx );
    ( "800" , opt encode_float msg.f_OrdAllocGrp_OrderBookingQty );
    ( "37" , opt encode_string msg.f_OrdAllocGrp_OrderID );
    ( "38" , opt encode_float msg.f_OrdAllocGrp_OrderQty );
    ( "526" , opt encode_string msg.f_OrdAllocGrp_SecondaryClOrdID );
    ( "198" , opt encode_string msg.f_OrdAllocGrp_SecondaryOrderID );
    ]
;;

let encode_ExecAllocGrp msg =
    [
    ( "17" , opt encode_string msg.f_ExecAllocGrp_ExecID );
    ( "29" , opt encode_LastCapacity msg.f_ExecAllocGrp_LastCapacity );
    ( "669" , opt encode_float msg.f_ExecAllocGrp_LastParPx );
    ( "31" , opt encode_float msg.f_ExecAllocGrp_LastPx );
    ( "32" , opt encode_float msg.f_ExecAllocGrp_LastQty );
    ( "124" , opt encode_int msg.f_ExecAllocGrp_NoExecs );
    ( "527" , opt encode_string msg.f_ExecAllocGrp_SecondaryExecID );
    ]
;;

let encode_InstrumentExtension msg =
    encode_AttrbGrp msg.f_InstrumentExtension_AttrbGrp @
    [
    ( "668" , opt encode_DeliveryForm msg.f_InstrumentExtension_DeliveryForm );
    ( "869" , opt encode_float msg.f_InstrumentExtension_PctAtRisk );
    ]
;;

let encode_FinancingDetails msg =
    [
    ( "918" , opt encode_Currency msg.f_FinancingDetails_AgreementCurrency );
    ( "915" , opt encode_LocalMktDate msg.f_FinancingDetails_AgreementDate );
    ( "913" , opt encode_string msg.f_FinancingDetails_AgreementDesc );
    ( "914" , opt encode_string msg.f_FinancingDetails_AgreementID );
    ( "919" , opt encode_DeliveryType msg.f_FinancingDetails_DeliveryType );
    ( "917" , opt encode_LocalMktDate msg.f_FinancingDetails_EndDate );
    ( "898" , opt encode_float msg.f_FinancingDetails_MarginRatio );
    ( "916" , opt encode_LocalMktDate msg.f_FinancingDetails_StartDate );
    ( "788" , opt encode_TerminationType msg.f_FinancingDetails_TerminationType );
    ]
;;

let encode_SpreadOrBenchmarkCurveData msg =
    [
    ( "220" , opt encode_Currency msg.f_SpreadOrBenchmarkCurveData_BenchmarkCurveCurrency );
    ( "221" , opt encode_string msg.f_SpreadOrBenchmarkCurveData_BenchmarkCurveName );
    ( "222" , opt encode_string msg.f_SpreadOrBenchmarkCurveData_BenchmarkCurvePoint );
    ( "662" , opt encode_float msg.f_SpreadOrBenchmarkCurveData_BenchmarkPrice );
    ( "663" , opt encode_int msg.f_SpreadOrBenchmarkCurveData_BenchmarkPriceType );
    ( "699" , opt encode_string msg.f_SpreadOrBenchmarkCurveData_BenchmarkSecurityID );
    ( "761" , opt encode_string msg.f_SpreadOrBenchmarkCurveData_BenchmarkSecurityIDSource );
    ( "218" , opt encode_float msg.f_SpreadOrBenchmarkCurveData_Spread );
    ]
;;

let encode_Parties msg =
    encode_PtysSubGrp msg.f_Parties_PtysSubGrp @
    [
    ( "453" , opt encode_int msg.f_Parties_NoPartyIDs );
    ( "448" , opt encode_string msg.f_Parties_PartyID );
    ( "447" , opt encode_PartyIDSource msg.f_Parties_PartyIDSource );
    ( "452" , opt encode_PartyRole msg.f_Parties_PartyRole );
    ]
;;

let encode_Stipulations msg =
    [
    ( "232" , opt encode_int msg.f_Stipulations_NoStipulations );
    ( "233" , opt encode_StipulationType msg.f_Stipulations_StipulationType );
    ( "234" , opt encode_string msg.f_Stipulations_StipulationValue );
    ]
;;

let encode_YieldData msg =
    [
    ( "236" , opt encode_float msg.f_YieldData_Yield );
    ( "701" , opt encode_LocalMktDate msg.f_YieldData_YieldCalcDate );
    ( "696" , opt encode_LocalMktDate msg.f_YieldData_YieldRedemptionDate );
    ( "697" , opt encode_float msg.f_YieldData_YieldRedemptionPrice );
    ( "698" , opt encode_int msg.f_YieldData_YieldRedemptionPriceType );
    ( "235" , opt encode_YieldType msg.f_YieldData_YieldType );
    ]
;;

let encode_AllocGrp msg =
    encode_ClrInstGrp msg.f_AllocGrp_ClrInstGrp @
    encode_CommissionData msg.f_AllocGrp_CommissionData @
    encode_MiscFeesGrp msg.f_AllocGrp_MiscFeesGrp @
    encode_NestedParties msg.f_AllocGrp_NestedParties @
    encode_SettlInstructionsData msg.f_AllocGrp_SettlInstructionsData @
    [
    ( "79" , opt encode_string msg.f_AllocGrp_AllocAccount );
    ( "742" , opt encode_float msg.f_AllocGrp_AllocAccruedInterestAmt );
    ( "661" , opt encode_int msg.f_AllocGrp_AllocAcctIDSource );
    ( "153" , opt encode_float msg.f_AllocGrp_AllocAvgPx );
    ( "209" , opt encode_AllocHandlInst msg.f_AllocGrp_AllocHandlInst );
    ( "741" , opt encode_float msg.f_AllocGrp_AllocInterestAtMaturity );
    ( "154" , opt encode_float msg.f_AllocGrp_AllocNetMoney );
    ( "366" , opt encode_float msg.f_AllocGrp_AllocPrice );
    ( "80" , opt encode_float msg.f_AllocGrp_AllocQty );
    ( "737" , opt encode_float msg.f_AllocGrp_AllocSettlCurrAmt );
    ( "736" , opt encode_Currency msg.f_AllocGrp_AllocSettlCurrency );
    ( "780" , opt encode_AllocSettlInstType msg.f_AllocGrp_AllocSettlInstType );
    ( "161" , opt encode_string msg.f_AllocGrp_AllocText );
    ( "361" , opt encode_string msg.f_AllocGrp_EncodedAllocText );
    ( "360" , opt encode_int msg.f_AllocGrp_EncodedAllocTextLen );
    ( "467" , opt encode_string msg.f_AllocGrp_IndividualAllocID );
    ( "573" , opt encode_MatchStatus msg.f_AllocGrp_MatchStatus );
    ( "78" , opt encode_int msg.f_AllocGrp_NoAllocs );
    ( "208" , opt encode_NotifyBrokerOfCredit msg.f_AllocGrp_NotifyBrokerOfCredit );
    ( "81" , opt encode_ProcessCode msg.f_AllocGrp_ProcessCode );
    ( "119" , opt encode_float msg.f_AllocGrp_SettlCurrAmt );
    ( "155" , opt encode_float msg.f_AllocGrp_SettlCurrFxRate );
    ( "156" , opt encode_SettlCurrFxRateCalc msg.f_AllocGrp_SettlCurrFxRateCalc );
    ( "120" , opt encode_Currency msg.f_AllocGrp_SettlCurrency );
    ]
;;

let encode_AllocAckGrp msg =
    [
    ( "79" , opt encode_string msg.f_AllocAckGrp_AllocAccount );
    ( "661" , opt encode_int msg.f_AllocAckGrp_AllocAcctIDSource );
    ( "366" , opt encode_float msg.f_AllocAckGrp_AllocPrice );
    ( "161" , opt encode_string msg.f_AllocAckGrp_AllocText );
    ( "361" , opt encode_string msg.f_AllocAckGrp_EncodedAllocText );
    ( "360" , opt encode_int msg.f_AllocAckGrp_EncodedAllocTextLen );
    ( "467" , opt encode_string msg.f_AllocAckGrp_IndividualAllocID );
    ( "776" , opt encode_int msg.f_AllocAckGrp_IndividualAllocRejCode );
    ( "78" , opt encode_int msg.f_AllocAckGrp_NoAllocs );
    ]
;;

let encode_PositionQty msg =
    encode_NestedParties msg.f_PositionQty_NestedParties @
    [
    ( "704" , opt encode_float msg.f_PositionQty_LongQty );
    ( "702" , opt encode_int msg.f_PositionQty_NoPositions );
    ( "706" , opt encode_PosQtyStatus msg.f_PositionQty_PosQtyStatus );
    ( "703" , opt encode_PosType msg.f_PositionQty_PosType );
    ( "705" , opt encode_float msg.f_PositionQty_ShortQty );
    ]
;;

let encode_PositionAmountData msg =
    [
    ( "753" , opt encode_int msg.f_PositionAmountData_NoPosAmt );
    ( "708" , opt encode_float msg.f_PositionAmountData_PosAmt );
    ( "707" , opt encode_PosAmtType msg.f_PositionAmountData_PosAmtType );
    ]
;;

let encode_BidDescReqGrp msg =
    [
    ( "400" , opt encode_string msg.f_BidDescReqGrp_BidDescriptor );
    ( "399" , opt encode_BidDescriptorType msg.f_BidDescReqGrp_BidDescriptorType );
    ( "405" , opt encode_float msg.f_BidDescReqGrp_EFPTrackingError );
    ( "406" , opt encode_float msg.f_BidDescReqGrp_FairValue );
    ( "441" , opt encode_int msg.f_BidDescReqGrp_LiquidityNumSecurities );
    ( "403" , opt encode_float msg.f_BidDescReqGrp_LiquidityPctHigh );
    ( "402" , opt encode_float msg.f_BidDescReqGrp_LiquidityPctLow );
    ( "404" , opt encode_float msg.f_BidDescReqGrp_LiquidityValue );
    ( "398" , opt encode_int msg.f_BidDescReqGrp_NoBidDescriptors );
    ( "407" , opt encode_float msg.f_BidDescReqGrp_OutsideIndexPct );
    ( "401" , opt encode_SideValueInd msg.f_BidDescReqGrp_SideValueInd );
    ( "408" , opt encode_float msg.f_BidDescReqGrp_ValueOfFutures );
    ]
;;

let encode_BidCompReqGrp msg =
    [
    ( "1" , opt encode_string msg.f_BidCompReqGrp_Account );
    ( "660" , opt encode_AcctIDSource msg.f_BidCompReqGrp_AcctIDSource );
    ( "66" , opt encode_string msg.f_BidCompReqGrp_ListID );
    ( "430" , opt encode_NetGrossInd msg.f_BidCompReqGrp_NetGrossInd );
    ( "420" , opt encode_int msg.f_BidCompReqGrp_NoBidComponents );
    ( "64" , opt encode_LocalMktDate msg.f_BidCompReqGrp_SettlDate );
    ( "63" , opt encode_SettlType msg.f_BidCompReqGrp_SettlType );
    ( "54" , opt encode_Side msg.f_BidCompReqGrp_Side );
    ( "336" , opt encode_string msg.f_BidCompReqGrp_TradingSessionID );
    ( "625" , opt encode_string msg.f_BidCompReqGrp_TradingSessionSubID );
    ]
;;

let encode_BidCompRspGrp msg =
    encode_CommissionData msg.f_BidCompRspGrp_CommissionData @
    [
    ( "421" , opt encode_Country msg.f_BidCompRspGrp_Country );
    ( "355" , opt encode_string msg.f_BidCompRspGrp_EncodedText );
    ( "354" , opt encode_int msg.f_BidCompRspGrp_EncodedTextLen );
    ( "406" , opt encode_float msg.f_BidCompRspGrp_FairValue );
    ( "66" , opt encode_string msg.f_BidCompRspGrp_ListID );
    ( "430" , opt encode_NetGrossInd msg.f_BidCompRspGrp_NetGrossInd );
    ( "420" , req encode_int msg.f_BidCompRspGrp_NoBidComponents );
    ( "44" , opt encode_float msg.f_BidCompRspGrp_Price );
    ( "423" , opt encode_PriceType msg.f_BidCompRspGrp_PriceType );
    ( "64" , opt encode_LocalMktDate msg.f_BidCompRspGrp_SettlDate );
    ( "63" , opt encode_SettlType msg.f_BidCompRspGrp_SettlType );
    ( "54" , opt encode_Side msg.f_BidCompRspGrp_Side );
    ( "58" , opt encode_string msg.f_BidCompRspGrp_Text );
    ( "336" , opt encode_string msg.f_BidCompRspGrp_TradingSessionID );
    ( "625" , opt encode_string msg.f_BidCompRspGrp_TradingSessionSubID );
    ]
;;

let encode_ExecCollGrp msg =
    [
    ( "17" , opt encode_string msg.f_ExecCollGrp_ExecID );
    ( "124" , opt encode_int msg.f_ExecCollGrp_NoExecs );
    ]
;;

let encode_TrdCollGrp msg =
    [
    ( "897" , opt encode_int msg.f_TrdCollGrp_NoTrades );
    ( "818" , opt encode_string msg.f_TrdCollGrp_SecondaryTradeReportID );
    ( "571" , opt encode_string msg.f_TrdCollGrp_TradeReportID );
    ]
;;

let encode_UndInstrmtCollGrp msg =
    encode_UnderlyingInstrument msg.f_UndInstrmtCollGrp_UnderlyingInstrument @
    [
    ( "944" , opt encode_CollAction msg.f_UndInstrmtCollGrp_CollAction );
    ( "711" , opt encode_int msg.f_UndInstrmtCollGrp_NoUnderlyings );
    ]
;;

let encode_TrdRegTimestamps msg =
    [
    ( "768" , opt encode_int msg.f_TrdRegTimestamps_NoTrdRegTimestamps );
    ( "769" , opt encode_UTCTimestamp msg.f_TrdRegTimestamps_TrdRegTimestamp );
    ( "771" , opt encode_string msg.f_TrdRegTimestamps_TrdRegTimestampOrigin );
    ( "770" , opt encode_TrdRegTimestampType msg.f_TrdRegTimestamps_TrdRegTimestampType );
    ]
;;

let encode_CollInqQualGrp msg =
    [
    ( "896" , opt encode_CollInquiryQualifier msg.f_CollInqQualGrp_CollInquiryQualifier );
    ( "938" , opt encode_int msg.f_CollInqQualGrp_NoCollInquiryQualifier );
    ]
;;

let encode_CpctyConfGrp msg =
    [
    ( "862" , req encode_int msg.f_CpctyConfGrp_NoCapacities );
    ( "528" , req encode_OrderCapacity msg.f_CpctyConfGrp_OrderCapacity );
    ( "863" , req encode_float msg.f_CpctyConfGrp_OrderCapacityQty );
    ( "529" , opt encode_OrderRestrictions msg.f_CpctyConfGrp_OrderRestrictions );
    ]
;;

let encode_OrderQtyData msg =
    [
    ( "152" , opt encode_float msg.f_OrderQtyData_CashOrderQty );
    ( "516" , opt encode_float msg.f_OrderQtyData_OrderPercent );
    ( "38" , opt encode_float msg.f_OrderQtyData_OrderQty );
    ( "468" , opt encode_RoundingDirection msg.f_OrderQtyData_RoundingDirection );
    ( "469" , opt encode_float msg.f_OrderQtyData_RoundingModulus );
    ]
;;

let encode_PreAllocGrp msg =
    encode_NestedParties msg.f_PreAllocGrp_NestedParties @
    [
    ( "79" , opt encode_string msg.f_PreAllocGrp_AllocAccount );
    ( "661" , opt encode_int msg.f_PreAllocGrp_AllocAcctIDSource );
    ( "80" , opt encode_float msg.f_PreAllocGrp_AllocQty );
    ( "736" , opt encode_Currency msg.f_PreAllocGrp_AllocSettlCurrency );
    ( "467" , opt encode_string msg.f_PreAllocGrp_IndividualAllocID );
    ( "78" , opt encode_int msg.f_PreAllocGrp_NoAllocs );
    ]
;;

let encode_SideCrossOrdModGrp msg =
    encode_CommissionData msg.f_SideCrossOrdModGrp_CommissionData @
    encode_OrderQtyData msg.f_SideCrossOrdModGrp_OrderQtyData @
    encode_Parties msg.f_SideCrossOrdModGrp_Parties @
    encode_PreAllocGrp msg.f_SideCrossOrdModGrp_PreAllocGrp @
    [
    ( "1" , opt encode_string msg.f_SideCrossOrdModGrp_Account );
    ( "581" , opt encode_AccountType msg.f_SideCrossOrdModGrp_AccountType );
    ( "660" , opt encode_AcctIDSource msg.f_SideCrossOrdModGrp_AcctIDSource );
    ( "70" , opt encode_string msg.f_SideCrossOrdModGrp_AllocID );
    ( "775" , opt encode_BookingType msg.f_SideCrossOrdModGrp_BookingType );
    ( "590" , opt encode_BookingUnit msg.f_SideCrossOrdModGrp_BookingUnit );
    ( "544" , opt encode_CashMargin msg.f_SideCrossOrdModGrp_CashMargin );
    ( "11" , req encode_string msg.f_SideCrossOrdModGrp_ClOrdID );
    ( "583" , opt encode_string msg.f_SideCrossOrdModGrp_ClOrdLinkID );
    ( "635" , opt encode_ClearingFeeIndicator msg.f_SideCrossOrdModGrp_ClearingFeeIndicator );
    ( "203" , opt encode_CoveredOrUncovered msg.f_SideCrossOrdModGrp_CoveredOrUncovered );
    ( "582" , opt encode_CustOrderCapacity msg.f_SideCrossOrdModGrp_CustOrderCapacity );
    ( "589" , opt encode_DayBookingInst msg.f_SideCrossOrdModGrp_DayBookingInst );
    ( "355" , opt encode_string msg.f_SideCrossOrdModGrp_EncodedText );
    ( "354" , opt encode_int msg.f_SideCrossOrdModGrp_EncodedTextLen );
    ( "121" , opt encode_ForexReq msg.f_SideCrossOrdModGrp_ForexReq );
    ( "552" , req encode_NoSides msg.f_SideCrossOrdModGrp_NoSides );
    ( "528" , opt encode_OrderCapacity msg.f_SideCrossOrdModGrp_OrderCapacity );
    ( "529" , opt encode_OrderRestrictions msg.f_SideCrossOrdModGrp_OrderRestrictions );
    ( "77" , opt encode_PositionEffect msg.f_SideCrossOrdModGrp_PositionEffect );
    ( "591" , opt encode_PreallocMethod msg.f_SideCrossOrdModGrp_PreallocMethod );
    ( "854" , opt encode_QtyType msg.f_SideCrossOrdModGrp_QtyType );
    ( "526" , opt encode_string msg.f_SideCrossOrdModGrp_SecondaryClOrdID );
    ( "120" , opt encode_Currency msg.f_SideCrossOrdModGrp_SettlCurrency );
    ( "54" , req encode_Side msg.f_SideCrossOrdModGrp_Side );
    ( "659" , opt encode_string msg.f_SideCrossOrdModGrp_SideComplianceID );
    ( "377" , opt encode_SolicitedFlag msg.f_SideCrossOrdModGrp_SolicitedFlag );
    ( "58" , opt encode_string msg.f_SideCrossOrdModGrp_Text );
    ( "75" , opt encode_LocalMktDate msg.f_SideCrossOrdModGrp_TradeDate );
    ( "229" , opt encode_LocalMktDate msg.f_SideCrossOrdModGrp_TradeOriginationDate );
    ]
;;

let encode_TrdgSesGrp msg =
    [
    ( "386" , opt encode_int msg.f_TrdgSesGrp_NoTradingSessions );
    ( "336" , opt encode_string msg.f_TrdgSesGrp_TradingSessionID );
    ( "625" , opt encode_string msg.f_TrdgSesGrp_TradingSessionSubID );
    ]
;;

let encode_PegInstructions msg =
    [
    ( "837" , opt encode_PegLimitType msg.f_PegInstructions_PegLimitType );
    ( "835" , opt encode_PegMoveType msg.f_PegInstructions_PegMoveType );
    ( "836" , opt encode_PegOffsetType msg.f_PegInstructions_PegOffsetType );
    ( "211" , opt encode_float msg.f_PegInstructions_PegOffsetValue );
    ( "838" , opt encode_PegRoundDirection msg.f_PegInstructions_PegRoundDirection );
    ( "840" , opt encode_PegScope msg.f_PegInstructions_PegScope );
    ]
;;

let encode_DiscretionInstructions msg =
    [
    ( "388" , opt encode_DiscretionInst msg.f_DiscretionInstructions_DiscretionInst );
    ( "843" , opt encode_DiscretionLimitType msg.f_DiscretionInstructions_DiscretionLimitType );
    ( "841" , opt encode_DiscretionMoveType msg.f_DiscretionInstructions_DiscretionMoveType );
    ( "842" , opt encode_DiscretionOffsetType msg.f_DiscretionInstructions_DiscretionOffsetType );
    ( "389" , opt encode_float msg.f_DiscretionInstructions_DiscretionOffsetValue );
    ( "844" , opt encode_DiscretionRoundDirection msg.f_DiscretionInstructions_DiscretionRoundDirection );
    ( "846" , opt encode_DiscretionScope msg.f_DiscretionInstructions_DiscretionScope );
    ]
;;

let encode_SideCrossOrdCxlGrp msg =
    encode_OrderQtyData msg.f_SideCrossOrdCxlGrp_OrderQtyData @
    encode_Parties msg.f_SideCrossOrdCxlGrp_Parties @
    [
    ( "11" , req encode_string msg.f_SideCrossOrdCxlGrp_ClOrdID );
    ( "583" , opt encode_string msg.f_SideCrossOrdCxlGrp_ClOrdLinkID );
    ( "376" , opt encode_string msg.f_SideCrossOrdCxlGrp_ComplianceID );
    ( "355" , opt encode_string msg.f_SideCrossOrdCxlGrp_EncodedText );
    ( "354" , opt encode_int msg.f_SideCrossOrdCxlGrp_EncodedTextLen );
    ( "552" , req encode_NoSides msg.f_SideCrossOrdCxlGrp_NoSides );
    ( "41" , req encode_string msg.f_SideCrossOrdCxlGrp_OrigClOrdID );
    ( "586" , opt encode_UTCTimestamp msg.f_SideCrossOrdCxlGrp_OrigOrdModTime );
    ( "526" , opt encode_string msg.f_SideCrossOrdCxlGrp_SecondaryClOrdID );
    ( "54" , req encode_Side msg.f_SideCrossOrdCxlGrp_Side );
    ( "58" , opt encode_string msg.f_SideCrossOrdCxlGrp_Text );
    ( "75" , opt encode_LocalMktDate msg.f_SideCrossOrdCxlGrp_TradeDate );
    ( "229" , opt encode_LocalMktDate msg.f_SideCrossOrdCxlGrp_TradeOriginationDate );
    ]
;;

let encode_RelSymDerivSecGrp msg =
    encode_InstrmtLegGrp msg.f_RelSymDerivSecGrp_InstrmtLegGrp @
    encode_Instrument msg.f_RelSymDerivSecGrp_Instrument @
    encode_InstrumentExtension msg.f_RelSymDerivSecGrp_InstrumentExtension @
    [
    ( "15" , opt encode_Currency msg.f_RelSymDerivSecGrp_Currency );
    ( "355" , opt encode_string msg.f_RelSymDerivSecGrp_EncodedText );
    ( "354" , opt encode_int msg.f_RelSymDerivSecGrp_EncodedTextLen );
    ( "827" , opt encode_ExpirationCycle msg.f_RelSymDerivSecGrp_ExpirationCycle );
    ( "146" , opt encode_int msg.f_RelSymDerivSecGrp_NoRelatedSym );
    ( "58" , opt encode_string msg.f_RelSymDerivSecGrp_Text );
    ( "336" , opt encode_string msg.f_RelSymDerivSecGrp_TradingSessionID );
    ( "625" , opt encode_string msg.f_RelSymDerivSecGrp_TradingSessionSubID );
    ]
;;

let encode_RoutingGrp msg =
    [
    ( "215" , opt encode_int msg.f_RoutingGrp_NoRoutingIDs );
    ( "217" , opt encode_string msg.f_RoutingGrp_RoutingID );
    ( "216" , opt encode_RoutingType msg.f_RoutingGrp_RoutingType );
    ]
;;

let encode_InstrmtGrp msg =
    encode_Instrument msg.f_InstrmtGrp_Instrument @
    [
    ( "146" , opt encode_int msg.f_InstrmtGrp_NoRelatedSym );
    ]
;;

let encode_LinesOfTextGrp msg =
    [
    ( "355" , opt encode_string msg.f_LinesOfTextGrp_EncodedText );
    ( "354" , opt encode_int msg.f_LinesOfTextGrp_EncodedTextLen );
    ( "33" , req encode_int msg.f_LinesOfTextGrp_NoLinesOfText );
    ( "58" , req encode_string msg.f_LinesOfTextGrp_Text );
    ]
;;

let encode_LegStipulations msg =
    [
    ( "688" , opt encode_string msg.f_LegStipulations_LegStipulationType );
    ( "689" , opt encode_string msg.f_LegStipulations_LegStipulationValue );
    ( "683" , opt encode_int msg.f_LegStipulations_NoLegStipulations );
    ]
;;

let encode_ContraGrp msg =
    [
    ( "375" , opt encode_string msg.f_ContraGrp_ContraBroker );
    ( "655" , opt encode_string msg.f_ContraGrp_ContraLegRefID );
    ( "437" , opt encode_float msg.f_ContraGrp_ContraTradeQty );
    ( "438" , opt encode_UTCTimestamp msg.f_ContraGrp_ContraTradeTime );
    ( "337" , opt encode_string msg.f_ContraGrp_ContraTrader );
    ( "382" , opt encode_int msg.f_ContraGrp_NoContraBrokers );
    ]
;;

let encode_ContAmtGrp msg =
    [
    ( "521" , opt encode_Currency msg.f_ContAmtGrp_ContAmtCurr );
    ( "519" , opt encode_ContAmtType msg.f_ContAmtGrp_ContAmtType );
    ( "520" , opt encode_float msg.f_ContAmtGrp_ContAmtValue );
    ( "518" , opt encode_int msg.f_ContAmtGrp_NoContAmts );
    ]
;;

let encode_InstrmtLegExecGrp msg =
    encode_InstrumentLeg msg.f_InstrmtLegExecGrp_InstrumentLeg @
    encode_LegStipulations msg.f_InstrmtLegExecGrp_LegStipulations @
    encode_NestedParties msg.f_InstrmtLegExecGrp_NestedParties @
    [
    ( "565" , opt encode_int msg.f_InstrmtLegExecGrp_LegCoveredOrUncovered );
    ( "637" , opt encode_float msg.f_InstrmtLegExecGrp_LegLastPx );
    ( "564" , opt encode_char msg.f_InstrmtLegExecGrp_LegPositionEffect );
    ( "566" , opt encode_float msg.f_InstrmtLegExecGrp_LegPrice );
    ( "687" , opt encode_float msg.f_InstrmtLegExecGrp_LegQty );
    ( "654" , opt encode_string msg.f_InstrmtLegExecGrp_LegRefID );
    ( "588" , opt encode_LocalMktDate msg.f_InstrmtLegExecGrp_LegSettlDate );
    ( "587" , opt encode_char msg.f_InstrmtLegExecGrp_LegSettlType );
    ( "690" , opt encode_LegSwapType msg.f_InstrmtLegExecGrp_LegSwapType );
    ( "555" , opt encode_int msg.f_InstrmtLegExecGrp_NoLegs );
    ]
;;

let encode_InstrmtLegIOIGrp msg =
    encode_InstrumentLeg msg.f_InstrmtLegIOIGrp_InstrumentLeg @
    encode_LegStipulations msg.f_InstrmtLegIOIGrp_LegStipulations @
    [
    ( "682" , opt encode_string msg.f_InstrmtLegIOIGrp_LegIOIQty );
    ( "555" , opt encode_int msg.f_InstrmtLegIOIGrp_NoLegs );
    ]
;;

let encode_IOIQualGrp msg =
    [
    ( "104" , opt encode_IOIQualifier msg.f_IOIQualGrp_IOIQualifier );
    ( "199" , opt encode_int msg.f_IOIQualGrp_NoIOIQualifiers );
    ]
;;

let encode_OrdListStatGrp msg =
    [
    ( "6" , req encode_float msg.f_OrdListStatGrp_AvgPx );
    ( "11" , req encode_string msg.f_OrdListStatGrp_ClOrdID );
    ( "14" , req encode_float msg.f_OrdListStatGrp_CumQty );
    ( "84" , req encode_float msg.f_OrdListStatGrp_CxlQty );
    ( "355" , opt encode_string msg.f_OrdListStatGrp_EncodedText );
    ( "354" , opt encode_int msg.f_OrdListStatGrp_EncodedTextLen );
    ( "151" , req encode_float msg.f_OrdListStatGrp_LeavesQty );
    ( "73" , req encode_int msg.f_OrdListStatGrp_NoOrders );
    ( "103" , opt encode_OrdRejReason msg.f_OrdListStatGrp_OrdRejReason );
    ( "39" , req encode_OrdStatus msg.f_OrdListStatGrp_OrdStatus );
    ( "526" , opt encode_string msg.f_OrdListStatGrp_SecondaryClOrdID );
    ( "58" , opt encode_string msg.f_OrdListStatGrp_Text );
    ( "636" , opt encode_WorkingIndicator msg.f_OrdListStatGrp_WorkingIndicator );
    ]
;;

let encode_InstrmtStrkPxGrp msg =
    encode_Instrument msg.f_InstrmtStrkPxGrp_Instrument @
    [
    ( "428" , req encode_int msg.f_InstrmtStrkPxGrp_NoStrikes );
    ]
;;

let encode_UndInstrmtStrkPxGrp msg =
    encode_UnderlyingInstrument msg.f_UndInstrmtStrkPxGrp_UnderlyingInstrument @
    [
    ( "11" , opt encode_string msg.f_UndInstrmtStrkPxGrp_ClOrdID );
    ( "15" , opt encode_Currency msg.f_UndInstrmtStrkPxGrp_Currency );
    ( "355" , opt encode_string msg.f_UndInstrmtStrkPxGrp_EncodedText );
    ( "354" , opt encode_int msg.f_UndInstrmtStrkPxGrp_EncodedTextLen );
    ( "711" , opt encode_int msg.f_UndInstrmtStrkPxGrp_NoUnderlyings );
    ( "140" , opt encode_float msg.f_UndInstrmtStrkPxGrp_PrevClosePx );
    ( "44" , req encode_float msg.f_UndInstrmtStrkPxGrp_Price );
    ( "526" , opt encode_string msg.f_UndInstrmtStrkPxGrp_SecondaryClOrdID );
    ( "54" , opt encode_Side msg.f_UndInstrmtStrkPxGrp_Side );
    ( "58" , opt encode_string msg.f_UndInstrmtStrkPxGrp_Text );
    ]
;;

let encode_MDIncGrp msg =
    encode_InstrmtLegGrp msg.f_MDIncGrp_InstrmtLegGrp @
    encode_Instrument msg.f_MDIncGrp_Instrument @
    encode_UndInstrmtGrp msg.f_MDIncGrp_UndInstrmtGrp @
    [
    ( "292" , opt encode_CorporateAction msg.f_MDIncGrp_CorporateAction );
    ( "15" , opt encode_Currency msg.f_MDIncGrp_Currency );
    ( "285" , opt encode_DeleteReason msg.f_MDIncGrp_DeleteReason );
    ( "284" , opt encode_string msg.f_MDIncGrp_DeskID );
    ( "355" , opt encode_string msg.f_MDIncGrp_EncodedText );
    ( "354" , opt encode_int msg.f_MDIncGrp_EncodedTextLen );
    ( "18" , opt encode_ExecInst msg.f_MDIncGrp_ExecInst );
    ( "432" , opt encode_LocalMktDate msg.f_MDIncGrp_ExpireDate );
    ( "126" , opt encode_UTCTimestamp msg.f_MDIncGrp_ExpireTime );
    ( "291" , opt encode_FinancialStatus msg.f_MDIncGrp_FinancialStatus );
    ( "283" , opt encode_string msg.f_MDIncGrp_LocationID );
    ( "288" , opt encode_string msg.f_MDIncGrp_MDEntryBuyer );
    ( "272" , opt encode_UTCDateOnly msg.f_MDIncGrp_MDEntryDate );
    ( "278" , opt encode_string msg.f_MDIncGrp_MDEntryID );
    ( "282" , opt encode_string msg.f_MDIncGrp_MDEntryOriginator );
    ( "290" , opt encode_int msg.f_MDIncGrp_MDEntryPositionNo );
    ( "270" , opt encode_float msg.f_MDIncGrp_MDEntryPx );
    ( "280" , opt encode_string msg.f_MDIncGrp_MDEntryRefID );
    ( "289" , opt encode_string msg.f_MDIncGrp_MDEntrySeller );
    ( "271" , opt encode_float msg.f_MDIncGrp_MDEntrySize );
    ( "273" , opt encode_UTCTimeOnly msg.f_MDIncGrp_MDEntryTime );
    ( "269" , opt encode_MDEntryType msg.f_MDIncGrp_MDEntryType );
    ( "275" , opt encode_Exchange msg.f_MDIncGrp_MDMkt );
    ( "279" , req encode_MDUpdateAction msg.f_MDIncGrp_MDUpdateAction );
    ( "110" , opt encode_float msg.f_MDIncGrp_MinQty );
    ( "451" , opt encode_float msg.f_MDIncGrp_NetChgPrevDay );
    ( "268" , req encode_int msg.f_MDIncGrp_NoMDEntries );
    ( "346" , opt encode_int msg.f_MDIncGrp_NumberOfOrders );
    ( "286" , opt encode_OpenCloseSettlFlag msg.f_MDIncGrp_OpenCloseSettlFlag );
    ( "37" , opt encode_string msg.f_MDIncGrp_OrderID );
    ( "811" , opt encode_float msg.f_MDIncGrp_PriceDelta );
    ( "276" , opt encode_QuoteCondition msg.f_MDIncGrp_QuoteCondition );
    ( "299" , opt encode_string msg.f_MDIncGrp_QuoteEntryID );
    ( "546" , opt encode_Scope msg.f_MDIncGrp_Scope );
    ( "287" , opt encode_int msg.f_MDIncGrp_SellerDays );
    ( "58" , opt encode_string msg.f_MDIncGrp_Text );
    ( "274" , opt encode_TickDirection msg.f_MDIncGrp_TickDirection );
    ( "59" , opt encode_TimeInForce msg.f_MDIncGrp_TimeInForce );
    ( "277" , opt encode_TradeCondition msg.f_MDIncGrp_TradeCondition );
    ( "336" , opt encode_string msg.f_MDIncGrp_TradingSessionID );
    ( "625" , opt encode_string msg.f_MDIncGrp_TradingSessionSubID );
    ]
;;

let encode_MDReqGrp msg =
    [
    ( "269" , req encode_MDEntryType msg.f_MDReqGrp_MDEntryType );
    ( "267" , req encode_int msg.f_MDReqGrp_NoMDEntryTypes );
    ]
;;

let encode_InstrmtMDReqGrp msg =
    encode_InstrmtLegGrp msg.f_InstrmtMDReqGrp_InstrmtLegGrp @
    encode_Instrument msg.f_InstrmtMDReqGrp_Instrument @
    encode_UndInstrmtGrp msg.f_InstrmtMDReqGrp_UndInstrmtGrp @
    [
    ( "146" , req encode_int msg.f_InstrmtMDReqGrp_NoRelatedSym );
    ]
;;

let encode_MDRjctGrp msg =
    [
    ( "817" , opt encode_string msg.f_MDRjctGrp_AltMDSourceID );
    ( "816" , opt encode_int msg.f_MDRjctGrp_NoAltMDSource );
    ]
;;

let encode_MDFullGrp msg =
    [
    ( "15" , opt encode_Currency msg.f_MDFullGrp_Currency );
    ( "284" , opt encode_string msg.f_MDFullGrp_DeskID );
    ( "355" , opt encode_string msg.f_MDFullGrp_EncodedText );
    ( "354" , opt encode_int msg.f_MDFullGrp_EncodedTextLen );
    ( "18" , opt encode_ExecInst msg.f_MDFullGrp_ExecInst );
    ( "432" , opt encode_LocalMktDate msg.f_MDFullGrp_ExpireDate );
    ( "126" , opt encode_UTCTimestamp msg.f_MDFullGrp_ExpireTime );
    ( "283" , opt encode_string msg.f_MDFullGrp_LocationID );
    ( "288" , opt encode_string msg.f_MDFullGrp_MDEntryBuyer );
    ( "272" , opt encode_UTCDateOnly msg.f_MDFullGrp_MDEntryDate );
    ( "282" , opt encode_string msg.f_MDFullGrp_MDEntryOriginator );
    ( "290" , opt encode_int msg.f_MDFullGrp_MDEntryPositionNo );
    ( "270" , opt encode_float msg.f_MDFullGrp_MDEntryPx );
    ( "289" , opt encode_string msg.f_MDFullGrp_MDEntrySeller );
    ( "271" , opt encode_float msg.f_MDFullGrp_MDEntrySize );
    ( "273" , opt encode_UTCTimeOnly msg.f_MDFullGrp_MDEntryTime );
    ( "269" , req encode_MDEntryType msg.f_MDFullGrp_MDEntryType );
    ( "275" , opt encode_Exchange msg.f_MDFullGrp_MDMkt );
    ( "110" , opt encode_float msg.f_MDFullGrp_MinQty );
    ( "268" , req encode_int msg.f_MDFullGrp_NoMDEntries );
    ( "346" , opt encode_int msg.f_MDFullGrp_NumberOfOrders );
    ( "286" , opt encode_OpenCloseSettlFlag msg.f_MDFullGrp_OpenCloseSettlFlag );
    ( "37" , opt encode_string msg.f_MDFullGrp_OrderID );
    ( "811" , opt encode_float msg.f_MDFullGrp_PriceDelta );
    ( "276" , opt encode_QuoteCondition msg.f_MDFullGrp_QuoteCondition );
    ( "299" , opt encode_string msg.f_MDFullGrp_QuoteEntryID );
    ( "546" , opt encode_Scope msg.f_MDFullGrp_Scope );
    ( "287" , opt encode_int msg.f_MDFullGrp_SellerDays );
    ( "58" , opt encode_string msg.f_MDFullGrp_Text );
    ( "274" , opt encode_TickDirection msg.f_MDFullGrp_TickDirection );
    ( "59" , opt encode_TimeInForce msg.f_MDFullGrp_TimeInForce );
    ( "277" , opt encode_TradeCondition msg.f_MDFullGrp_TradeCondition );
    ( "336" , opt encode_string msg.f_MDFullGrp_TradingSessionID );
    ( "625" , opt encode_string msg.f_MDFullGrp_TradingSessionSubID );
    ]
;;

let encode_QuotEntryGrp msg =
    encode_InstrmtLegGrp msg.f_QuotEntryGrp_InstrmtLegGrp @
    encode_Instrument msg.f_QuotEntryGrp_Instrument @
    [
    ( "189" , opt encode_float msg.f_QuotEntryGrp_BidForwardPoints );
    ( "642" , opt encode_float msg.f_QuotEntryGrp_BidForwardPoints2 );
    ( "132" , opt encode_float msg.f_QuotEntryGrp_BidPx );
    ( "134" , opt encode_float msg.f_QuotEntryGrp_BidSize );
    ( "188" , opt encode_float msg.f_QuotEntryGrp_BidSpotRate );
    ( "632" , opt encode_float msg.f_QuotEntryGrp_BidYield );
    ( "15" , opt encode_Currency msg.f_QuotEntryGrp_Currency );
    ( "631" , opt encode_float msg.f_QuotEntryGrp_MidPx );
    ( "633" , opt encode_float msg.f_QuotEntryGrp_MidYield );
    ( "295" , req encode_int msg.f_QuotEntryGrp_NoQuoteEntries );
    ( "191" , opt encode_float msg.f_QuotEntryGrp_OfferForwardPoints );
    ( "643" , opt encode_float msg.f_QuotEntryGrp_OfferForwardPoints2 );
    ( "133" , opt encode_float msg.f_QuotEntryGrp_OfferPx );
    ( "135" , opt encode_float msg.f_QuotEntryGrp_OfferSize );
    ( "190" , opt encode_float msg.f_QuotEntryGrp_OfferSpotRate );
    ( "634" , opt encode_float msg.f_QuotEntryGrp_OfferYield );
    ( "40" , opt encode_OrdType msg.f_QuotEntryGrp_OrdType );
    ( "192" , opt encode_float msg.f_QuotEntryGrp_OrderQty2 );
    ( "299" , req encode_string msg.f_QuotEntryGrp_QuoteEntryID );
    ( "64" , opt encode_LocalMktDate msg.f_QuotEntryGrp_SettlDate );
    ( "193" , opt encode_LocalMktDate msg.f_QuotEntryGrp_SettlDate2 );
    ( "336" , opt encode_string msg.f_QuotEntryGrp_TradingSessionID );
    ( "625" , opt encode_string msg.f_QuotEntryGrp_TradingSessionSubID );
    ( "60" , opt encode_UTCTimestamp msg.f_QuotEntryGrp_TransactTime );
    ( "62" , opt encode_UTCTimestamp msg.f_QuotEntryGrp_ValidUntilTime );
    ]
;;

let encode_QuotSetGrp msg =
    encode_QuotEntryGrp msg.f_QuotSetGrp_QuotEntryGrp @
    encode_UnderlyingInstrument msg.f_QuotSetGrp_UnderlyingInstrument @
    [
    ( "893" , opt encode_LastFragment msg.f_QuotSetGrp_LastFragment );
    ( "296" , req encode_int msg.f_QuotSetGrp_NoQuoteSets );
    ( "302" , req encode_string msg.f_QuotSetGrp_QuoteSetID );
    ( "367" , opt encode_UTCTimestamp msg.f_QuotSetGrp_QuoteSetValidUntilTime );
    ( "304" , req encode_int msg.f_QuotSetGrp_TotNoQuoteEntries );
    ]
;;

let encode_QuotEntryAckGrp msg =
    encode_InstrmtLegGrp msg.f_QuotEntryAckGrp_InstrmtLegGrp @
    encode_Instrument msg.f_QuotEntryAckGrp_Instrument @
    [
    ( "189" , opt encode_float msg.f_QuotEntryAckGrp_BidForwardPoints );
    ( "642" , opt encode_float msg.f_QuotEntryAckGrp_BidForwardPoints2 );
    ( "132" , opt encode_float msg.f_QuotEntryAckGrp_BidPx );
    ( "134" , opt encode_float msg.f_QuotEntryAckGrp_BidSize );
    ( "188" , opt encode_float msg.f_QuotEntryAckGrp_BidSpotRate );
    ( "632" , opt encode_float msg.f_QuotEntryAckGrp_BidYield );
    ( "15" , opt encode_Currency msg.f_QuotEntryAckGrp_Currency );
    ( "631" , opt encode_float msg.f_QuotEntryAckGrp_MidPx );
    ( "633" , opt encode_float msg.f_QuotEntryAckGrp_MidYield );
    ( "295" , opt encode_int msg.f_QuotEntryAckGrp_NoQuoteEntries );
    ( "191" , opt encode_float msg.f_QuotEntryAckGrp_OfferForwardPoints );
    ( "643" , opt encode_float msg.f_QuotEntryAckGrp_OfferForwardPoints2 );
    ( "133" , opt encode_float msg.f_QuotEntryAckGrp_OfferPx );
    ( "135" , opt encode_float msg.f_QuotEntryAckGrp_OfferSize );
    ( "190" , opt encode_float msg.f_QuotEntryAckGrp_OfferSpotRate );
    ( "634" , opt encode_float msg.f_QuotEntryAckGrp_OfferYield );
    ( "40" , opt encode_OrdType msg.f_QuotEntryAckGrp_OrdType );
    ( "192" , opt encode_float msg.f_QuotEntryAckGrp_OrderQty2 );
    ( "299" , opt encode_string msg.f_QuotEntryAckGrp_QuoteEntryID );
    ( "368" , opt encode_int msg.f_QuotEntryAckGrp_QuoteEntryRejectReason );
    ( "64" , opt encode_LocalMktDate msg.f_QuotEntryAckGrp_SettlDate );
    ( "193" , opt encode_LocalMktDate msg.f_QuotEntryAckGrp_SettlDate2 );
    ( "336" , opt encode_string msg.f_QuotEntryAckGrp_TradingSessionID );
    ( "625" , opt encode_string msg.f_QuotEntryAckGrp_TradingSessionSubID );
    ( "60" , opt encode_UTCTimestamp msg.f_QuotEntryAckGrp_TransactTime );
    ( "62" , opt encode_UTCTimestamp msg.f_QuotEntryAckGrp_ValidUntilTime );
    ]
;;

let encode_QuotSetAckGrp msg =
    encode_QuotEntryAckGrp msg.f_QuotSetAckGrp_QuotEntryAckGrp @
    encode_UnderlyingInstrument msg.f_QuotSetAckGrp_UnderlyingInstrument @
    [
    ( "893" , opt encode_LastFragment msg.f_QuotSetAckGrp_LastFragment );
    ( "296" , opt encode_int msg.f_QuotSetAckGrp_NoQuoteSets );
    ( "302" , opt encode_string msg.f_QuotSetAckGrp_QuoteSetID );
    ( "304" , opt encode_int msg.f_QuotSetAckGrp_TotNoQuoteEntries );
    ]
;;

let encode_NstdPtys3SubGrp msg =
    [
    ( "953" , opt encode_string msg.f_NstdPtys3SubGrp_Nested3PartySubID );
    ( "954" , opt encode_int msg.f_NstdPtys3SubGrp_Nested3PartySubIDType );
    ( "952" , opt encode_int msg.f_NstdPtys3SubGrp_NoNested3PartySubIDs );
    ]
;;

let encode_NestedParties3 msg =
    encode_NstdPtys3SubGrp msg.f_NestedParties3_NstdPtys3SubGrp @
    [
    ( "949" , opt encode_string msg.f_NestedParties3_Nested3PartyID );
    ( "950" , opt encode_char msg.f_NestedParties3_Nested3PartyIDSource );
    ( "951" , opt encode_int msg.f_NestedParties3_Nested3PartyRole );
    ( "948" , opt encode_int msg.f_NestedParties3_NoNested3PartyIDs );
    ]
;;

let encode_LegPreAllocGrp msg =
    encode_NestedParties2 msg.f_LegPreAllocGrp_NestedParties2 @
    [
    ( "671" , opt encode_string msg.f_LegPreAllocGrp_LegAllocAccount );
    ( "674" , opt encode_string msg.f_LegPreAllocGrp_LegAllocAcctIDSource );
    ( "673" , opt encode_float msg.f_LegPreAllocGrp_LegAllocQty );
    ( "672" , opt encode_string msg.f_LegPreAllocGrp_LegIndividualAllocID );
    ( "675" , opt encode_Currency msg.f_LegPreAllocGrp_LegSettlCurrency );
    ( "670" , opt encode_int msg.f_LegPreAllocGrp_NoLegAllocs );
    ]
;;

let encode_PreAllocMlegGrp msg =
    encode_NestedParties3 msg.f_PreAllocMlegGrp_NestedParties3 @
    [
    ( "79" , opt encode_string msg.f_PreAllocMlegGrp_AllocAccount );
    ( "661" , opt encode_int msg.f_PreAllocMlegGrp_AllocAcctIDSource );
    ( "80" , opt encode_float msg.f_PreAllocMlegGrp_AllocQty );
    ( "736" , opt encode_Currency msg.f_PreAllocMlegGrp_AllocSettlCurrency );
    ( "467" , opt encode_string msg.f_PreAllocMlegGrp_IndividualAllocID );
    ( "78" , opt encode_int msg.f_PreAllocMlegGrp_NoAllocs );
    ]
;;

let encode_LegOrdGrp msg =
    encode_InstrumentLeg msg.f_LegOrdGrp_InstrumentLeg @
    encode_LegPreAllocGrp msg.f_LegOrdGrp_LegPreAllocGrp @
    encode_LegStipulations msg.f_LegOrdGrp_LegStipulations @
    encode_NestedParties msg.f_LegOrdGrp_NestedParties @
    [
    ( "565" , opt encode_int msg.f_LegOrdGrp_LegCoveredOrUncovered );
    ( "564" , opt encode_char msg.f_LegOrdGrp_LegPositionEffect );
    ( "566" , opt encode_float msg.f_LegOrdGrp_LegPrice );
    ( "687" , opt encode_float msg.f_LegOrdGrp_LegQty );
    ( "654" , opt encode_string msg.f_LegOrdGrp_LegRefID );
    ( "588" , opt encode_LocalMktDate msg.f_LegOrdGrp_LegSettlDate );
    ( "587" , opt encode_char msg.f_LegOrdGrp_LegSettlType );
    ( "690" , opt encode_LegSwapType msg.f_LegOrdGrp_LegSwapType );
    ( "555" , req encode_int msg.f_LegOrdGrp_NoLegs );
    ]
;;

let encode_ListOrdGrp msg =
    encode_CommissionData msg.f_ListOrdGrp_CommissionData @
    encode_DiscretionInstructions msg.f_ListOrdGrp_DiscretionInstructions @
    encode_Instrument msg.f_ListOrdGrp_Instrument @
    encode_OrderQtyData msg.f_ListOrdGrp_OrderQtyData @
    encode_Parties msg.f_ListOrdGrp_Parties @
    encode_PegInstructions msg.f_ListOrdGrp_PegInstructions @
    encode_PreAllocGrp msg.f_ListOrdGrp_PreAllocGrp @
    encode_SpreadOrBenchmarkCurveData msg.f_ListOrdGrp_SpreadOrBenchmarkCurveData @
    encode_Stipulations msg.f_ListOrdGrp_Stipulations @
    encode_TrdgSesGrp msg.f_ListOrdGrp_TrdgSesGrp @
    encode_UndInstrmtGrp msg.f_ListOrdGrp_UndInstrmtGrp @
    encode_YieldData msg.f_ListOrdGrp_YieldData @
    [
    ( "1" , opt encode_string msg.f_ListOrdGrp_Account );
    ( "581" , opt encode_AccountType msg.f_ListOrdGrp_AccountType );
    ( "660" , opt encode_AcctIDSource msg.f_ListOrdGrp_AcctIDSource );
    ( "70" , opt encode_string msg.f_ListOrdGrp_AllocID );
    ( "775" , opt encode_BookingType msg.f_ListOrdGrp_BookingType );
    ( "590" , opt encode_BookingUnit msg.f_ListOrdGrp_BookingUnit );
    ( "544" , opt encode_CashMargin msg.f_ListOrdGrp_CashMargin );
    ( "11" , req encode_string msg.f_ListOrdGrp_ClOrdID );
    ( "583" , opt encode_string msg.f_ListOrdGrp_ClOrdLinkID );
    ( "635" , opt encode_ClearingFeeIndicator msg.f_ListOrdGrp_ClearingFeeIndicator );
    ( "376" , opt encode_string msg.f_ListOrdGrp_ComplianceID );
    ( "203" , opt encode_CoveredOrUncovered msg.f_ListOrdGrp_CoveredOrUncovered );
    ( "15" , opt encode_Currency msg.f_ListOrdGrp_Currency );
    ( "582" , opt encode_CustOrderCapacity msg.f_ListOrdGrp_CustOrderCapacity );
    ( "589" , opt encode_DayBookingInst msg.f_ListOrdGrp_DayBookingInst );
    ( "494" , opt encode_string msg.f_ListOrdGrp_Designation );
    ( "168" , opt encode_UTCTimestamp msg.f_ListOrdGrp_EffectiveTime );
    ( "355" , opt encode_string msg.f_ListOrdGrp_EncodedText );
    ( "354" , opt encode_int msg.f_ListOrdGrp_EncodedTextLen );
    ( "100" , opt encode_Exchange msg.f_ListOrdGrp_ExDestination );
    ( "18" , opt encode_ExecInst msg.f_ListOrdGrp_ExecInst );
    ( "432" , opt encode_LocalMktDate msg.f_ListOrdGrp_ExpireDate );
    ( "126" , opt encode_UTCTimestamp msg.f_ListOrdGrp_ExpireTime );
    ( "121" , opt encode_ForexReq msg.f_ListOrdGrp_ForexReq );
    ( "427" , opt encode_GTBookingInst msg.f_ListOrdGrp_GTBookingInst );
    ( "21" , opt encode_HandlInst msg.f_ListOrdGrp_HandlInst );
    ( "23" , opt encode_string msg.f_ListOrdGrp_IOIID );
    ( "67" , req encode_int msg.f_ListOrdGrp_ListSeqNo );
    ( "114" , opt encode_LocateReqd msg.f_ListOrdGrp_LocateReqd );
    ( "111" , opt encode_float msg.f_ListOrdGrp_MaxFloor );
    ( "210" , opt encode_float msg.f_ListOrdGrp_MaxShow );
    ( "110" , opt encode_float msg.f_ListOrdGrp_MinQty );
    ( "73" , req encode_int msg.f_ListOrdGrp_NoOrders );
    ( "40" , opt encode_OrdType msg.f_ListOrdGrp_OrdType );
    ( "528" , opt encode_OrderCapacity msg.f_ListOrdGrp_OrderCapacity );
    ( "192" , opt encode_float msg.f_ListOrdGrp_OrderQty2 );
    ( "529" , opt encode_OrderRestrictions msg.f_ListOrdGrp_OrderRestrictions );
    ( "849" , opt encode_float msg.f_ListOrdGrp_ParticipationRate );
    ( "77" , opt encode_PositionEffect msg.f_ListOrdGrp_PositionEffect );
    ( "591" , opt encode_PreallocMethod msg.f_ListOrdGrp_PreallocMethod );
    ( "140" , opt encode_float msg.f_ListOrdGrp_PrevClosePx );
    ( "44" , opt encode_float msg.f_ListOrdGrp_Price );
    ( "640" , opt encode_float msg.f_ListOrdGrp_Price2 );
    ( "423" , opt encode_PriceType msg.f_ListOrdGrp_PriceType );
    ( "81" , opt encode_ProcessCode msg.f_ListOrdGrp_ProcessCode );
    ( "854" , opt encode_QtyType msg.f_ListOrdGrp_QtyType );
    ( "117" , opt encode_string msg.f_ListOrdGrp_QuoteID );
    ( "526" , opt encode_string msg.f_ListOrdGrp_SecondaryClOrdID );
    ( "120" , opt encode_Currency msg.f_ListOrdGrp_SettlCurrency );
    ( "64" , opt encode_LocalMktDate msg.f_ListOrdGrp_SettlDate );
    ( "193" , opt encode_LocalMktDate msg.f_ListOrdGrp_SettlDate2 );
    ( "160" , opt encode_SettlInstMode msg.f_ListOrdGrp_SettlInstMode );
    ( "63" , opt encode_SettlType msg.f_ListOrdGrp_SettlType );
    ( "54" , req encode_Side msg.f_ListOrdGrp_Side );
    ( "401" , opt encode_SideValueInd msg.f_ListOrdGrp_SideValueInd );
    ( "377" , opt encode_SolicitedFlag msg.f_ListOrdGrp_SolicitedFlag );
    ( "99" , opt encode_float msg.f_ListOrdGrp_StopPx );
    ( "847" , opt encode_TargetStrategy msg.f_ListOrdGrp_TargetStrategy );
    ( "848" , opt encode_string msg.f_ListOrdGrp_TargetStrategyParameters );
    ( "58" , opt encode_string msg.f_ListOrdGrp_Text );
    ( "59" , opt encode_TimeInForce msg.f_ListOrdGrp_TimeInForce );
    ( "75" , opt encode_LocalMktDate msg.f_ListOrdGrp_TradeDate );
    ( "229" , opt encode_LocalMktDate msg.f_ListOrdGrp_TradeOriginationDate );
    ( "60" , opt encode_UTCTimestamp msg.f_ListOrdGrp_TransactTime );
    ]
;;

let encode_AffectedOrdGrp msg =
    [
    ( "535" , opt encode_string msg.f_AffectedOrdGrp_AffectedOrderID );
    ( "536" , opt encode_string msg.f_AffectedOrdGrp_AffectedSecondaryOrderID );
    ( "534" , opt encode_int msg.f_AffectedOrdGrp_NoAffectedOrders );
    ( "41" , opt encode_string msg.f_AffectedOrdGrp_OrigClOrdID );
    ]
;;

let encode_PosUndInstrmtGrp msg =
    encode_UnderlyingInstrument msg.f_PosUndInstrmtGrp_UnderlyingInstrument @
    [
    ( "711" , opt encode_int msg.f_PosUndInstrmtGrp_NoUnderlyings );
    ( "732" , req encode_float msg.f_PosUndInstrmtGrp_UnderlyingSettlPrice );
    ( "733" , req encode_int msg.f_PosUndInstrmtGrp_UnderlyingSettlPriceType );
    ]
;;

let encode_LegBenchmarkCurveData msg =
    [
    ( "676" , opt encode_Currency msg.f_LegBenchmarkCurveData_LegBenchmarkCurveCurrency );
    ( "677" , opt encode_string msg.f_LegBenchmarkCurveData_LegBenchmarkCurveName );
    ( "678" , opt encode_string msg.f_LegBenchmarkCurveData_LegBenchmarkCurvePoint );
    ( "679" , opt encode_float msg.f_LegBenchmarkCurveData_LegBenchmarkPrice );
    ( "680" , opt encode_int msg.f_LegBenchmarkCurveData_LegBenchmarkPriceType );
    ]
;;

let encode_QuotQualGrp msg =
    [
    ( "735" , opt encode_int msg.f_QuotQualGrp_NoQuoteQualifiers );
    ( "695" , opt encode_char msg.f_QuotQualGrp_QuoteQualifier );
    ]
;;

let encode_LegQuotGrp msg =
    encode_InstrumentLeg msg.f_LegQuotGrp_InstrumentLeg @
    encode_LegBenchmarkCurveData msg.f_LegQuotGrp_LegBenchmarkCurveData @
    encode_LegStipulations msg.f_LegQuotGrp_LegStipulations @
    encode_NestedParties msg.f_LegQuotGrp_NestedParties @
    [
    ( "681" , opt encode_float msg.f_LegQuotGrp_LegBidPx );
    ( "684" , opt encode_float msg.f_LegQuotGrp_LegOfferPx );
    ( "686" , opt encode_int msg.f_LegQuotGrp_LegPriceType );
    ( "687" , opt encode_float msg.f_LegQuotGrp_LegQty );
    ( "588" , opt encode_LocalMktDate msg.f_LegQuotGrp_LegSettlDate );
    ( "587" , opt encode_char msg.f_LegQuotGrp_LegSettlType );
    ( "690" , opt encode_LegSwapType msg.f_LegQuotGrp_LegSwapType );
    ( "555" , opt encode_int msg.f_LegQuotGrp_NoLegs );
    ]
;;

let encode_QuotCxlEntriesGrp msg =
    encode_FinancingDetails msg.f_QuotCxlEntriesGrp_FinancingDetails @
    encode_InstrmtLegGrp msg.f_QuotCxlEntriesGrp_InstrmtLegGrp @
    encode_Instrument msg.f_QuotCxlEntriesGrp_Instrument @
    encode_UndInstrmtGrp msg.f_QuotCxlEntriesGrp_UndInstrmtGrp @
    [
    ( "295" , opt encode_int msg.f_QuotCxlEntriesGrp_NoQuoteEntries );
    ]
;;

let encode_QuotReqLegsGrp msg =
    encode_InstrumentLeg msg.f_QuotReqLegsGrp_InstrumentLeg @
    encode_LegBenchmarkCurveData msg.f_QuotReqLegsGrp_LegBenchmarkCurveData @
    encode_LegStipulations msg.f_QuotReqLegsGrp_LegStipulations @
    encode_NestedParties msg.f_QuotReqLegsGrp_NestedParties @
    [
    ( "687" , opt encode_float msg.f_QuotReqLegsGrp_LegQty );
    ( "588" , opt encode_LocalMktDate msg.f_QuotReqLegsGrp_LegSettlDate );
    ( "587" , opt encode_char msg.f_QuotReqLegsGrp_LegSettlType );
    ( "690" , opt encode_LegSwapType msg.f_QuotReqLegsGrp_LegSwapType );
    ( "555" , opt encode_int msg.f_QuotReqLegsGrp_NoLegs );
    ]
;;

let encode_QuotReqGrp msg =
    encode_FinancingDetails msg.f_QuotReqGrp_FinancingDetails @
    encode_Instrument msg.f_QuotReqGrp_Instrument @
    encode_OrderQtyData msg.f_QuotReqGrp_OrderQtyData @
    encode_Parties msg.f_QuotReqGrp_Parties @
    encode_QuotQualGrp msg.f_QuotReqGrp_QuotQualGrp @
    encode_QuotReqLegsGrp msg.f_QuotReqGrp_QuotReqLegsGrp @
    encode_SpreadOrBenchmarkCurveData msg.f_QuotReqGrp_SpreadOrBenchmarkCurveData @
    encode_Stipulations msg.f_QuotReqGrp_Stipulations @
    encode_UndInstrmtGrp msg.f_QuotReqGrp_UndInstrmtGrp @
    encode_YieldData msg.f_QuotReqGrp_YieldData @
    [
    ( "1" , opt encode_string msg.f_QuotReqGrp_Account );
    ( "581" , opt encode_AccountType msg.f_QuotReqGrp_AccountType );
    ( "660" , opt encode_AcctIDSource msg.f_QuotReqGrp_AcctIDSource );
    ( "15" , opt encode_Currency msg.f_QuotReqGrp_Currency );
    ( "126" , opt encode_UTCTimestamp msg.f_QuotReqGrp_ExpireTime );
    ( "146" , req encode_int msg.f_QuotReqGrp_NoRelatedSym );
    ( "40" , opt encode_OrdType msg.f_QuotReqGrp_OrdType );
    ( "192" , opt encode_float msg.f_QuotReqGrp_OrderQty2 );
    ( "140" , opt encode_float msg.f_QuotReqGrp_PrevClosePx );
    ( "44" , opt encode_float msg.f_QuotReqGrp_Price );
    ( "640" , opt encode_float msg.f_QuotReqGrp_Price2 );
    ( "423" , opt encode_PriceType msg.f_QuotReqGrp_PriceType );
    ( "854" , opt encode_QtyType msg.f_QuotReqGrp_QtyType );
    ( "692" , opt encode_QuotePriceType msg.f_QuotReqGrp_QuotePriceType );
    ( "303" , opt encode_QuoteRequestType msg.f_QuotReqGrp_QuoteRequestType );
    ( "537" , opt encode_QuoteType msg.f_QuotReqGrp_QuoteType );
    ( "64" , opt encode_LocalMktDate msg.f_QuotReqGrp_SettlDate );
    ( "193" , opt encode_LocalMktDate msg.f_QuotReqGrp_SettlDate2 );
    ( "63" , opt encode_SettlType msg.f_QuotReqGrp_SettlType );
    ( "54" , opt encode_Side msg.f_QuotReqGrp_Side );
    ( "229" , opt encode_LocalMktDate msg.f_QuotReqGrp_TradeOriginationDate );
    ( "336" , opt encode_string msg.f_QuotReqGrp_TradingSessionID );
    ( "625" , opt encode_string msg.f_QuotReqGrp_TradingSessionSubID );
    ( "60" , opt encode_UTCTimestamp msg.f_QuotReqGrp_TransactTime );
    ( "62" , opt encode_UTCTimestamp msg.f_QuotReqGrp_ValidUntilTime );
    ]
;;

let encode_QuotReqRjctGrp msg =
    encode_FinancingDetails msg.f_QuotReqRjctGrp_FinancingDetails @
    encode_Instrument msg.f_QuotReqRjctGrp_Instrument @
    encode_OrderQtyData msg.f_QuotReqRjctGrp_OrderQtyData @
    encode_Parties msg.f_QuotReqRjctGrp_Parties @
    encode_QuotQualGrp msg.f_QuotReqRjctGrp_QuotQualGrp @
    encode_QuotReqLegsGrp msg.f_QuotReqRjctGrp_QuotReqLegsGrp @
    encode_SpreadOrBenchmarkCurveData msg.f_QuotReqRjctGrp_SpreadOrBenchmarkCurveData @
    encode_Stipulations msg.f_QuotReqRjctGrp_Stipulations @
    encode_UndInstrmtGrp msg.f_QuotReqRjctGrp_UndInstrmtGrp @
    encode_YieldData msg.f_QuotReqRjctGrp_YieldData @
    [
    ( "1" , opt encode_string msg.f_QuotReqRjctGrp_Account );
    ( "581" , opt encode_AccountType msg.f_QuotReqRjctGrp_AccountType );
    ( "660" , opt encode_AcctIDSource msg.f_QuotReqRjctGrp_AcctIDSource );
    ( "15" , opt encode_Currency msg.f_QuotReqRjctGrp_Currency );
    ( "126" , opt encode_UTCTimestamp msg.f_QuotReqRjctGrp_ExpireTime );
    ( "146" , req encode_int msg.f_QuotReqRjctGrp_NoRelatedSym );
    ( "40" , opt encode_OrdType msg.f_QuotReqRjctGrp_OrdType );
    ( "192" , opt encode_float msg.f_QuotReqRjctGrp_OrderQty2 );
    ( "140" , opt encode_float msg.f_QuotReqRjctGrp_PrevClosePx );
    ( "44" , opt encode_float msg.f_QuotReqRjctGrp_Price );
    ( "640" , opt encode_float msg.f_QuotReqRjctGrp_Price2 );
    ( "423" , opt encode_PriceType msg.f_QuotReqRjctGrp_PriceType );
    ( "854" , opt encode_QtyType msg.f_QuotReqRjctGrp_QtyType );
    ( "692" , opt encode_QuotePriceType msg.f_QuotReqRjctGrp_QuotePriceType );
    ( "303" , opt encode_QuoteRequestType msg.f_QuotReqRjctGrp_QuoteRequestType );
    ( "537" , opt encode_QuoteType msg.f_QuotReqRjctGrp_QuoteType );
    ( "64" , opt encode_LocalMktDate msg.f_QuotReqRjctGrp_SettlDate );
    ( "193" , opt encode_LocalMktDate msg.f_QuotReqRjctGrp_SettlDate2 );
    ( "63" , opt encode_SettlType msg.f_QuotReqRjctGrp_SettlType );
    ( "54" , opt encode_Side msg.f_QuotReqRjctGrp_Side );
    ( "229" , opt encode_LocalMktDate msg.f_QuotReqRjctGrp_TradeOriginationDate );
    ( "336" , opt encode_string msg.f_QuotReqRjctGrp_TradingSessionID );
    ( "625" , opt encode_string msg.f_QuotReqRjctGrp_TradingSessionSubID );
    ( "60" , opt encode_UTCTimestamp msg.f_QuotReqRjctGrp_TransactTime );
    ]
;;

let encode_LegQuotStatGrp msg =
    encode_InstrumentLeg msg.f_LegQuotStatGrp_InstrumentLeg @
    encode_LegStipulations msg.f_LegQuotStatGrp_LegStipulations @
    encode_NestedParties msg.f_LegQuotStatGrp_NestedParties @
    [
    ( "687" , opt encode_float msg.f_LegQuotStatGrp_LegQty );
    ( "588" , opt encode_LocalMktDate msg.f_LegQuotStatGrp_LegSettlDate );
    ( "587" , opt encode_char msg.f_LegQuotStatGrp_LegSettlType );
    ( "690" , opt encode_LegSwapType msg.f_LegQuotStatGrp_LegSwapType );
    ( "555" , opt encode_int msg.f_LegQuotStatGrp_NoLegs );
    ]
;;

let encode_RFQReqGrp msg =
    encode_InstrmtLegGrp msg.f_RFQReqGrp_InstrmtLegGrp @
    encode_Instrument msg.f_RFQReqGrp_Instrument @
    encode_UndInstrmtGrp msg.f_RFQReqGrp_UndInstrmtGrp @
    [
    ( "146" , req encode_int msg.f_RFQReqGrp_NoRelatedSym );
    ( "140" , opt encode_float msg.f_RFQReqGrp_PrevClosePx );
    ( "303" , opt encode_QuoteRequestType msg.f_RFQReqGrp_QuoteRequestType );
    ( "537" , opt encode_QuoteType msg.f_RFQReqGrp_QuoteType );
    ( "336" , opt encode_string msg.f_RFQReqGrp_TradingSessionID );
    ( "625" , opt encode_string msg.f_RFQReqGrp_TradingSessionSubID );
    ]
;;

let encode_RgstDtlsGrp msg =
    encode_NestedParties msg.f_RgstDtlsGrp_NestedParties @
    [
    ( "486" , opt encode_LocalMktDate msg.f_RgstDtlsGrp_DateOfBirth );
    ( "475" , opt encode_Country msg.f_RgstDtlsGrp_InvestorCountryOfResidence );
    ( "474" , opt encode_string msg.f_RgstDtlsGrp_MailingDtls );
    ( "482" , opt encode_string msg.f_RgstDtlsGrp_MailingInst );
    ( "473" , opt encode_int msg.f_RgstDtlsGrp_NoRegistDtls );
    ( "522" , opt encode_OwnerType msg.f_RgstDtlsGrp_OwnerType );
    ( "509" , opt encode_string msg.f_RgstDtlsGrp_RegistDtls );
    ( "511" , opt encode_string msg.f_RgstDtlsGrp_RegistEmail );
    ]
;;

let encode_RgstDistInstGrp msg =
    [
    ( "502" , opt encode_string msg.f_RgstDistInstGrp_CashDistribAgentAcctName );
    ( "500" , opt encode_string msg.f_RgstDistInstGrp_CashDistribAgentAcctNumber );
    ( "499" , opt encode_string msg.f_RgstDistInstGrp_CashDistribAgentCode );
    ( "498" , opt encode_string msg.f_RgstDistInstGrp_CashDistribAgentName );
    ( "478" , opt encode_Currency msg.f_RgstDistInstGrp_CashDistribCurr );
    ( "501" , opt encode_string msg.f_RgstDistInstGrp_CashDistribPayRef );
    ( "477" , opt encode_DistribPaymentMethod msg.f_RgstDistInstGrp_DistribPaymentMethod );
    ( "512" , opt encode_float msg.f_RgstDistInstGrp_DistribPercentage );
    ( "510" , opt encode_int msg.f_RgstDistInstGrp_NoDistribInsts );
    ]
;;

let encode_InstrmtLegSecListGrp msg =
    encode_InstrumentLeg msg.f_InstrmtLegSecListGrp_InstrumentLeg @
    encode_LegBenchmarkCurveData msg.f_InstrmtLegSecListGrp_LegBenchmarkCurveData @
    encode_LegStipulations msg.f_InstrmtLegSecListGrp_LegStipulations @
    [
    ( "587" , opt encode_char msg.f_InstrmtLegSecListGrp_LegSettlType );
    ( "690" , opt encode_LegSwapType msg.f_InstrmtLegSecListGrp_LegSwapType );
    ( "555" , opt encode_int msg.f_InstrmtLegSecListGrp_NoLegs );
    ]
;;

let encode_SecListGrp msg =
    encode_FinancingDetails msg.f_SecListGrp_FinancingDetails @
    encode_InstrmtLegSecListGrp msg.f_SecListGrp_InstrmtLegSecListGrp @
    encode_Instrument msg.f_SecListGrp_Instrument @
    encode_InstrumentExtension msg.f_SecListGrp_InstrumentExtension @
    encode_SpreadOrBenchmarkCurveData msg.f_SecListGrp_SpreadOrBenchmarkCurveData @
    encode_Stipulations msg.f_SecListGrp_Stipulations @
    encode_UndInstrmtGrp msg.f_SecListGrp_UndInstrmtGrp @
    encode_YieldData msg.f_SecListGrp_YieldData @
    [
    ( "15" , opt encode_Currency msg.f_SecListGrp_Currency );
    ( "355" , opt encode_string msg.f_SecListGrp_EncodedText );
    ( "354" , opt encode_int msg.f_SecListGrp_EncodedTextLen );
    ( "827" , opt encode_ExpirationCycle msg.f_SecListGrp_ExpirationCycle );
    ( "562" , opt encode_float msg.f_SecListGrp_MinTradeVol );
    ( "146" , opt encode_int msg.f_SecListGrp_NoRelatedSym );
    ( "561" , opt encode_float msg.f_SecListGrp_RoundLot );
    ( "58" , opt encode_string msg.f_SecListGrp_Text );
    ( "336" , opt encode_string msg.f_SecListGrp_TradingSessionID );
    ( "625" , opt encode_string msg.f_SecListGrp_TradingSessionSubID );
    ]
;;

let encode_SecTypesGrp msg =
    [
    ( "461" , opt encode_string msg.f_SecTypesGrp_CFICode );
    ( "558" , opt encode_int msg.f_SecTypesGrp_NoSecurityTypes );
    ( "460" , opt encode_Product msg.f_SecTypesGrp_Product );
    ( "762" , opt encode_string msg.f_SecTypesGrp_SecuritySubType );
    ( "167" , opt encode_SecurityType msg.f_SecTypesGrp_SecurityType );
    ]
;;

let encode_SettlInstGrp msg =
    encode_Parties msg.f_SettlInstGrp_Parties @
    encode_SettlInstructionsData msg.f_SettlInstGrp_SettlInstructionsData @
    [
    ( "461" , opt encode_string msg.f_SettlInstGrp_CFICode );
    ( "490" , opt encode_LocalMktDate msg.f_SettlInstGrp_CardExpDate );
    ( "488" , opt encode_string msg.f_SettlInstGrp_CardHolderName );
    ( "491" , opt encode_string msg.f_SettlInstGrp_CardIssNum );
    ( "489" , opt encode_string msg.f_SettlInstGrp_CardNumber );
    ( "503" , opt encode_LocalMktDate msg.f_SettlInstGrp_CardStartDate );
    ( "168" , opt encode_UTCTimestamp msg.f_SettlInstGrp_EffectiveTime );
    ( "126" , opt encode_UTCTimestamp msg.f_SettlInstGrp_ExpireTime );
    ( "779" , opt encode_UTCTimestamp msg.f_SettlInstGrp_LastUpdateTime );
    ( "778" , opt encode_int msg.f_SettlInstGrp_NoSettlInst );
    ( "504" , opt encode_LocalMktDate msg.f_SettlInstGrp_PaymentDate );
    ( "492" , opt encode_PaymentMethod msg.f_SettlInstGrp_PaymentMethod );
    ( "476" , opt encode_string msg.f_SettlInstGrp_PaymentRef );
    ( "505" , opt encode_string msg.f_SettlInstGrp_PaymentRemitterID );
    ( "460" , opt encode_Product msg.f_SettlInstGrp_Product );
    ( "167" , opt encode_SecurityType msg.f_SettlInstGrp_SecurityType );
    ( "162" , opt encode_string msg.f_SettlInstGrp_SettlInstID );
    ( "214" , opt encode_string msg.f_SettlInstGrp_SettlInstRefID );
    ( "163" , opt encode_SettlInstTransType msg.f_SettlInstGrp_SettlInstTransType );
    ( "54" , opt encode_Side msg.f_SettlInstGrp_Side );
    ]
;;

let encode_TrdAllocGrp msg =
    encode_NestedParties2 msg.f_TrdAllocGrp_NestedParties2 @
    [
    ( "79" , opt encode_string msg.f_TrdAllocGrp_AllocAccount );
    ( "661" , opt encode_int msg.f_TrdAllocGrp_AllocAcctIDSource );
    ( "80" , opt encode_float msg.f_TrdAllocGrp_AllocQty );
    ( "736" , opt encode_Currency msg.f_TrdAllocGrp_AllocSettlCurrency );
    ( "467" , opt encode_string msg.f_TrdAllocGrp_IndividualAllocID );
    ( "78" , opt encode_int msg.f_TrdAllocGrp_NoAllocs );
    ]
;;

let encode_TrdInstrmtLegGrp msg =
    encode_InstrumentLeg msg.f_TrdInstrmtLegGrp_InstrumentLeg @
    encode_LegStipulations msg.f_TrdInstrmtLegGrp_LegStipulations @
    encode_NestedParties msg.f_TrdInstrmtLegGrp_NestedParties @
    [
    ( "565" , opt encode_int msg.f_TrdInstrmtLegGrp_LegCoveredOrUncovered );
    ( "637" , opt encode_float msg.f_TrdInstrmtLegGrp_LegLastPx );
    ( "564" , opt encode_char msg.f_TrdInstrmtLegGrp_LegPositionEffect );
    ( "566" , opt encode_float msg.f_TrdInstrmtLegGrp_LegPrice );
    ( "687" , opt encode_float msg.f_TrdInstrmtLegGrp_LegQty );
    ( "654" , opt encode_string msg.f_TrdInstrmtLegGrp_LegRefID );
    ( "588" , opt encode_LocalMktDate msg.f_TrdInstrmtLegGrp_LegSettlDate );
    ( "587" , opt encode_char msg.f_TrdInstrmtLegGrp_LegSettlType );
    ( "690" , opt encode_LegSwapType msg.f_TrdInstrmtLegGrp_LegSwapType );
    ( "555" , opt encode_int msg.f_TrdInstrmtLegGrp_NoLegs );
    ]
;;

let encode_TrdCapRptSideGrp msg =
    encode_ClrInstGrp msg.f_TrdCapRptSideGrp_ClrInstGrp @
    encode_CommissionData msg.f_TrdCapRptSideGrp_CommissionData @
    encode_ContAmtGrp msg.f_TrdCapRptSideGrp_ContAmtGrp @
    encode_MiscFeesGrp msg.f_TrdCapRptSideGrp_MiscFeesGrp @
    encode_Parties msg.f_TrdCapRptSideGrp_Parties @
    encode_Stipulations msg.f_TrdCapRptSideGrp_Stipulations @
    encode_TrdAllocGrp msg.f_TrdCapRptSideGrp_TrdAllocGrp @
    [
    ( "1" , opt encode_string msg.f_TrdCapRptSideGrp_Account );
    ( "581" , opt encode_AccountType msg.f_TrdCapRptSideGrp_AccountType );
    ( "159" , opt encode_float msg.f_TrdCapRptSideGrp_AccruedInterestAmt );
    ( "158" , opt encode_float msg.f_TrdCapRptSideGrp_AccruedInterestRate );
    ( "660" , opt encode_AcctIDSource msg.f_TrdCapRptSideGrp_AcctIDSource );
    ( "70" , opt encode_string msg.f_TrdCapRptSideGrp_AllocID );
    ( "11" , opt encode_string msg.f_TrdCapRptSideGrp_ClOrdID );
    ( "376" , opt encode_string msg.f_TrdCapRptSideGrp_ComplianceID );
    ( "238" , opt encode_float msg.f_TrdCapRptSideGrp_Concession );
    ( "15" , opt encode_Currency msg.f_TrdCapRptSideGrp_Currency );
    ( "582" , opt encode_CustOrderCapacity msg.f_TrdCapRptSideGrp_CustOrderCapacity );
    ( "355" , opt encode_string msg.f_TrdCapRptSideGrp_EncodedText );
    ( "354" , opt encode_int msg.f_TrdCapRptSideGrp_EncodedTextLen );
    ( "920" , opt encode_float msg.f_TrdCapRptSideGrp_EndAccruedInterestAmt );
    ( "922" , opt encode_float msg.f_TrdCapRptSideGrp_EndCash );
    ( "230" , opt encode_LocalMktDate msg.f_TrdCapRptSideGrp_ExDate );
    ( "825" , opt encode_string msg.f_TrdCapRptSideGrp_ExchangeRule );
    ( "18" , opt encode_ExecInst msg.f_TrdCapRptSideGrp_ExecInst );
    ( "381" , opt encode_float msg.f_TrdCapRptSideGrp_GrossTradeAmt );
    ( "738" , opt encode_float msg.f_TrdCapRptSideGrp_InterestAtMaturity );
    ( "66" , opt encode_string msg.f_TrdCapRptSideGrp_ListID );
    ( "118" , opt encode_float msg.f_TrdCapRptSideGrp_NetMoney );
    ( "552" , req encode_NoSides msg.f_TrdCapRptSideGrp_NoSides );
    ( "157" , opt encode_int msg.f_TrdCapRptSideGrp_NumDaysInterest );
    ( "575" , opt encode_OddLot msg.f_TrdCapRptSideGrp_OddLot );
    ( "40" , opt encode_OrdType msg.f_TrdCapRptSideGrp_OrdType );
    ( "528" , opt encode_OrderCapacity msg.f_TrdCapRptSideGrp_OrderCapacity );
    ( "37" , req encode_string msg.f_TrdCapRptSideGrp_OrderID );
    ( "821" , opt encode_string msg.f_TrdCapRptSideGrp_OrderInputDevice );
    ( "529" , opt encode_OrderRestrictions msg.f_TrdCapRptSideGrp_OrderRestrictions );
    ( "77" , opt encode_PositionEffect msg.f_TrdCapRptSideGrp_PositionEffect );
    ( "591" , opt encode_PreallocMethod msg.f_TrdCapRptSideGrp_PreallocMethod );
    ( "81" , opt encode_ProcessCode msg.f_TrdCapRptSideGrp_ProcessCode );
    ( "526" , opt encode_string msg.f_TrdCapRptSideGrp_SecondaryClOrdID );
    ( "198" , opt encode_string msg.f_TrdCapRptSideGrp_SecondaryOrderID );
    ( "119" , opt encode_float msg.f_TrdCapRptSideGrp_SettlCurrAmt );
    ( "155" , opt encode_float msg.f_TrdCapRptSideGrp_SettlCurrFxRate );
    ( "156" , opt encode_SettlCurrFxRateCalc msg.f_TrdCapRptSideGrp_SettlCurrFxRateCalc );
    ( "120" , opt encode_Currency msg.f_TrdCapRptSideGrp_SettlCurrency );
    ( "54" , req encode_Side msg.f_TrdCapRptSideGrp_Side );
    ( "752" , opt encode_SideMultiLegReportingType msg.f_TrdCapRptSideGrp_SideMultiLegReportingType );
    ( "377" , opt encode_SolicitedFlag msg.f_TrdCapRptSideGrp_SolicitedFlag );
    ( "921" , opt encode_float msg.f_TrdCapRptSideGrp_StartCash );
    ( "58" , opt encode_string msg.f_TrdCapRptSideGrp_Text );
    ( "943" , opt encode_string msg.f_TrdCapRptSideGrp_TimeBracket );
    ( "237" , opt encode_float msg.f_TrdCapRptSideGrp_TotalTakedown );
    ( "826" , opt encode_TradeAllocIndicator msg.f_TrdCapRptSideGrp_TradeAllocIndicator );
    ( "579" , opt encode_string msg.f_TrdCapRptSideGrp_TradeInputDevice );
    ( "578" , opt encode_string msg.f_TrdCapRptSideGrp_TradeInputSource );
    ( "336" , opt encode_string msg.f_TrdCapRptSideGrp_TradingSessionID );
    ( "625" , opt encode_string msg.f_TrdCapRptSideGrp_TradingSessionSubID );
    ( "483" , opt encode_UTCTimestamp msg.f_TrdCapRptSideGrp_TransBkdTime );
    ]
;;

let encode_TrdCapDtGrp msg =
    [
    ( "580" , opt encode_int msg.f_TrdCapDtGrp_NoDates );
    ( "75" , opt encode_LocalMktDate msg.f_TrdCapDtGrp_TradeDate );
    ( "60" , opt encode_UTCTimestamp msg.f_TrdCapDtGrp_TransactTime );
    ]
;;
