(* @meta[imandra_ignore] on @end *)
open Base_types;;
open Numeric;;
open Datetime;;
open Full_app_enums;;
open Full_app_tags;;
(* @meta[imandra_ignore] off @end *)


type fix_evntgrp = {
    (** Date of event*)
    f_EvntGrp_EventDate : fix_localmktdate option;
    (** Predetermined price of issue at event, if applicable*)
    f_EvntGrp_EventPx : fix_float option;
    (** Comments related to the event.*)
    f_EvntGrp_EventText : fix_string option;
    (** Code to represent the type of event*)
    f_EvntGrp_EventType : fix_eventtype option;
    (** Number of repeating EventType entries.*)
    f_EvntGrp_NoEvents : int option
}
;;

type fix_secaltidgrp = {
    (** Number of SecurityAltID (455) entries.*)
    f_SecAltIDGrp_NoSecurityAltID : int option;
    (** Alternate Security identifier value for this security of SecurityAltIDSource (456) type (e.g. CUSIP, SEDOL, ISIN, etc). Requires SecurityAltIDSource.*)
    f_SecAltIDGrp_SecurityAltID : fix_string option;
    (** Identifies class or source of the SecurityAltID (455) value. Required if SecurityAltID is specified.
     Valid values:
     Same valid values as the SecurityIDSource (22) field*)
    f_SecAltIDGrp_SecurityAltIDSource : fix_string option
}
;;

type fix_legsecaltidgrp = {
    (** Multileg instrument's individual security’s SecurityAltID.
     See SecurityAltID (455) field for description*)
    f_LegSecAltIDGrp_LegSecurityAltID : fix_string option;
    (** Multileg instrument's individual security’s SecurityAltIDSource.
     See SecurityAltIDSource (456) field for description*)
    f_LegSecAltIDGrp_LegSecurityAltIDSource : fix_string option;
    (** Multileg instrument's individual security’s NoSecurityAltID.
     See NoSecurityAltID (454) field for description*)
    f_LegSecAltIDGrp_NoLegSecurityAltID : int option
}
;;

(** The InstrumentLeg component block, like the Instrument component block, contains all the fields commonly used to describe a security or instrument. In the case of the InstrumentLeg component block it describes a security used in multileg-oriented messages.*)
type fix_instrumentleg = {
    (** Multileg instrument's individual security’s EncodedIssuer.
     See EncodedIssuer (349) field for description*)
    f_InstrumentLeg_EncodedLegIssuer : fix_string option;
    (** Multileg instrument's individual security’s EncodedIssuerLen.
     See EncodedIssuerLen (348) field for description*)
    f_InstrumentLeg_EncodedLegIssuerLen : int option;
    (** Multileg instrument's individual security’s EncodedSecurityDesc.
     See EncodedSecurityDesc (35) field for description*)
    f_InstrumentLeg_EncodedLegSecurityDesc : fix_string option;
    (** Multileg instrument's individual security’s EncodedSecurityDescLen.
     See EncodedSecurityDescLen (350) field for description*)
    f_InstrumentLeg_EncodedLegSecurityDescLen : int option;
    (** Multileg instrument's individual security’s CFICode.
     See CFICode (46) field for description*)
    f_InstrumentLeg_LegCFICode : fix_string option;
    (** Multileg instrument's individual security’s ContractMultiplier.
     See ContractMultiplier (23) field for description*)
    f_InstrumentLeg_LegContractMultiplier : fix_float option;
    (** Specifies when the contract (i.e. MBS/TBA) will settle.*)
    f_InstrumentLeg_LegContractSettlMonth : fix_monthyear option;
    (** Multileg instrument's individual leg security’s CountryOfIssue.
     See CountryOfIssue (470) field for description*)
    f_InstrumentLeg_LegCountryOfIssue : fix_country option;
    (** Multileg instrument's individual leg security’s CouponPaymentDate.
     See CouponPaymentDate (224) field for description
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)
     (prior to FIX 4.4 field was of type UTCDate)*)
    f_InstrumentLeg_LegCouponPaymentDate : fix_localmktdate option;
    (** Multileg instrument's individual security’s CouponRate.
     See CouponRate (223) field for description*)
    f_InstrumentLeg_LegCouponRate : fix_float option;
    (** Multileg instrument's individual leg security’s CreditRating.
     See CreditRating (255) field for description
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)*)
    f_InstrumentLeg_LegCreditRating : fix_string option;
    (** Currency associated with a particular Leg's quantity
     Specific to the <InstrumentLeg> (not in <Instrument>)*)
    f_InstrumentLeg_LegCurrency : fix_currency option;
    (** The effective date of a new securities issue determined by its underwriters. Often but not always the same as the Issue Date and the Interest Accrual Date*)
    f_InstrumentLeg_LegDatedDate : fix_localmktdate option;
    (** Multileg instrument's individual leg security’s Factor.
     See Factor (228) field for description
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)*)
    f_InstrumentLeg_LegFactor : fix_float option;
    (** Multileg instrument's individual leg security’s InstrRegistry.
     See InstrRegistry (543) field for description*)
    f_InstrumentLeg_LegInstrRegistry : fix_string option;
    (** The start date used for calculating accrued interest on debt instruments which are being sold between interest payment dates. Often but not always the same as the Issue Date and the Dated Date*)
    f_InstrumentLeg_LegInterestAccrualDate : fix_localmktdate option;
    (** Multileg instrument's individual leg security’s IssueDate.
     See IssueDate (225) field for description
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)
     (prior to FIX 4.4 field was of type UTCDate)*)
    f_InstrumentLeg_LegIssueDate : fix_localmktdate option;
    (** Multileg instrument's individual security’s Issuer.
     See Issuer (106) field for description*)
    f_InstrumentLeg_LegIssuer : fix_string option;
    (** Multileg instrument's individual leg security’s LocaleOfIssue.
     See LocaleOfIssue (472) field for description*)
    f_InstrumentLeg_LegLocaleOfIssue : fix_string option;
    (** Multileg instrument's individual security’s MaturityDate.
     See MaturityDate (54) field for description*)
    f_InstrumentLeg_LegMaturityDate : fix_localmktdate option;
    (** Multileg instrument's individual security’s MaturityMonthYear.
     See MaturityMonthYear (200) field for description*)
    f_InstrumentLeg_LegMaturityMonthYear : fix_monthyear option;
    (** Multileg instrument's individual security’s OptAttribute.
     See OptAttribute (206) field for description*)
    f_InstrumentLeg_LegOptAttribute : int option;
    (** For Fixed Income, identifies MBS / ABS pool for a specific leg of a multi-leg instrument.
     See Pool (69) for description and valid values.
     Identifies MBS / ABS pool*)
    f_InstrumentLeg_LegPool : fix_string option;
    (** Multileg instrument's individual security’s Product.
     See Product (460) field for description*)
    f_InstrumentLeg_LegProduct : int option;
    (** The ratio of quantity for this individual leg relative to the entire multileg security.
     Specific to the <InstrumentLeg> (not in <Instrument>)*)
    f_InstrumentLeg_LegRatioQty : fix_float option;
    (** *** DEPRECATED FIELD - See "Deprecated (Phased-out) Features and Supported Approach" ***
     Multileg instrument's individual leg security’s RedemptionDate.
     See RedemptionDate (240) field for description
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)
     (prior to FIX 4.4 field was of type UTCDate)
     (Deprecated, use YieldRedemptionDate (696) in <YieldData> component block)*)
    f_InstrumentLeg_LegRedemptionDate : fix_localmktdate option;
    (** *** DEPRECATED FIELD - See "Deprecated (Phased-out) Features and Supported Approach" ***
     Multileg instrument's individual leg security’s RepoCollateralSecurityType.
     See RepoCollateralSecurityType (239) field for description
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)
     (Deprecated, not applicable/used for Repos)*)
    f_InstrumentLeg_LegRepoCollateralSecurityType : fix_string option;
    (** *** DEPRECATED FIELD - See "Deprecated (Phased-out) Features and Supported Approach" ***
     Multileg instrument's individual leg security’s RepurchaseRate.
     See RepurchaseRate (227) field for description
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)
     (Deprecated, not applicable/used for Repos)*)
    f_InstrumentLeg_LegRepurchaseRate : fix_float option;
    (** *** DEPRECATED FIELD - See "Deprecated (Phased-out) Features and Supported Approach" ***
     Multileg instrument's individual leg security's RepurchaseTerm.
     See RepurchaseTerm (226) field for description
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)
     (Deprecated, not applicable/used for Repos)*)
    f_InstrumentLeg_LegRepurchaseTerm : int option;
    (** Multileg instrument's individual security’s SecurityDesc.
     See SecurityDesc (07) field for description*)
    f_InstrumentLeg_LegSecurityDesc : fix_string option;
    (** Multileg instrument's individual security’s SecurityExchange.
     See SecurityExchange (207) field for description*)
    f_InstrumentLeg_LegSecurityExchange : fix_exchange option;
    (** Multileg instrument's individual security’s SecurityID.
     See SecurityID (48) field for description*)
    f_InstrumentLeg_LegSecurityID : fix_string option;
    (** Multileg instrument's individual security’s SecurityIDSource.
     See SecurityIDSource (22) field for description*)
    f_InstrumentLeg_LegSecurityIDSource : fix_string option;
    (** SecuritySubType of the leg instrument.
     See SecuritySubType (762) field for description*)
    f_InstrumentLeg_LegSecuritySubType : fix_string option;
    (** Multileg instrument's individual security’s SecurityType.
     See SecurityType (67) field for description*)
    f_InstrumentLeg_LegSecurityType : fix_string option;
    (** The side of this individual leg (multileg security).
     See Side (54) field for description and values
     Specific to the <InstrumentLeg> (not in <Instrument>)*)
    f_InstrumentLeg_LegSide : int option;
    (** Multileg instrument's individual leg security’s StateOrProvinceOfIssue.
     See StateOrProvinceOfIssue (471) field for description*)
    f_InstrumentLeg_LegStateOrProvinceOfIssue : fix_string option;
    (** Currency in which the strike price of a instrument leg of a multileg instrument is denominated*)
    f_InstrumentLeg_LegStrikeCurrency : fix_currency option;
    (** Multileg instrument's individual security’s StrikePrice.
     See StrikePrice (202) field for description*)
    f_InstrumentLeg_LegStrikePrice : fix_float option;
    (** Multileg instrument's individual security’s Symbol.
     See Symbol (55) field for description*)
    f_InstrumentLeg_LegSymbol : fix_string option;
    (** Multileg instrument's individual security’s SymbolSfx.
     See SymbolSfx (65) field for description*)
    f_InstrumentLeg_LegSymbolSfx : fix_string option;
    f_InstrumentLeg_LegSecAltIDGrp : fix_legsecaltidgrp
}
;;

type fix_undsecaltidgrp = {
    (** Number of UnderlyingSecurityAltID (458) entries.*)
    f_UndSecAltIDGrp_NoUnderlyingSecurityAltID : int option;
    (** Alternate Security identifier value for this underlying security of UnderlyingSecurityAltIDSource (459) type (e.g. CUSIP, SEDOL, ISIN, etc). Requires UnderlyingSecurityAltIDSource.*)
    f_UndSecAltIDGrp_UnderlyingSecurityAltID : fix_string option;
    (** Identifies class or source of the UnderlyingSecurityAltID (458) value. Required if UnderlyingSecurityAltID is specified.
     Valid values:
     Same valid values as the SecurityIDSource (22) field*)
    f_UndSecAltIDGrp_UnderlyingSecurityAltIDSource : fix_string option
}
;;

(** The UnderlyingStipulations component block has the same usage as the Stipulations component block, but for an underlying security.*)
type fix_underlyingstipulations = {
    (** Number of underlying stipulation entries*)
    f_UnderlyingStipulations_NoUnderlyingStips : int option;
    (** Type of stipulation.
     Same values as StipulationType (233)
     Required if NoUnderlyingStips >0*)
    f_UnderlyingStipulations_UnderlyingStipType : fix_string option;
    (** Value of stipulation.
     Same values as StipulationValue (234)*)
    f_UnderlyingStipulations_UnderlyingStipValue : fix_string option
}
;;

(** The UnderlyingInstrument component block, like the Instrument component block, contains all the fields commonly used to describe a security or instrument. In the case of the UnderlyingInstrument component block it describes an instrument which underlies the primary instrument Refer to the Instrument component block comments as this component block mirrors Instrument, except for the noted fields.*)
type fix_underlyinginstrument = {
    (** Encoded (non-ASCII characters) representation of the UnderlyingIssuer (306) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the UnderlyingIssuer field.*)
    f_UnderlyingInstrument_EncodedUnderlyingIssuer : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedUnderlyingIssuer (363) field.*)
    f_UnderlyingInstrument_EncodedUnderlyingIssuerLen : int option;
    (** Encoded (non-ASCII characters) representation of the UnderlyingSecurityDesc (307) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the UnderlyingSecurityeDesc field.*)
    f_UnderlyingInstrument_EncodedUnderlyingSecurityDesc : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedUnderlyingSecurityDesc (365) field.*)
    f_UnderlyingInstrument_EncodedUnderlyingSecurityDescLen : int option;
    (** Underlying security’s CFICode.
     Valid values: see CFICode (46)field*)
    f_UnderlyingInstrument_UnderlyingCFICode : fix_string option;
    (** The program under which the underlying commercial paper is issued*)
    f_UnderlyingInstrument_UnderlyingCPProgram : fix_string option;
    (** The registration type of the underlying commercial paper issuance*)
    f_UnderlyingInstrument_UnderlyingCPRegType : fix_string option;
    (** Underlying security’s ContractMultiplier.
     See ContractMultiplier (23) field for description*)
    f_UnderlyingInstrument_UnderlyingContractMultiplier : fix_float option;
    (** Underlying security’s CountryOfIssue.
     See CountryOfIssue (470) field for description*)
    f_UnderlyingInstrument_UnderlyingCountryOfIssue : fix_country option;
    (** Underlying security’s CouponPaymentDate.
     See CouponPaymentDate (224) field for description
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)
     (prior to FIX 4.4 field was of type UTCDate)*)
    f_UnderlyingInstrument_UnderlyingCouponPaymentDate : fix_localmktdate option;
    (** Underlying security’s CouponRate.
     See CouponRate (223) field for description*)
    f_UnderlyingInstrument_UnderlyingCouponRate : fix_float option;
    (** Underlying security’s CreditRating.
     See CreditRating (255) field for description
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)*)
    f_UnderlyingInstrument_UnderlyingCreditRating : fix_string option;
    (** Underlying security’s Currency.
     See Currency (5) field for description and valid values
     Specific to the <UnderlyingInstrument> (not in <Instrument>)*)
    f_UnderlyingInstrument_UnderlyingCurrency : fix_currency option;
    (** Currency value currently attributed to this collateral
     Specific to the <UnderlyingInstrument> (not in <Instrument>)
     Currency value currently attributed to this collateral*)
    f_UnderlyingInstrument_UnderlyingCurrentValue : fix_float option;
    (** Price (percent-of-par or per unit) of the underlying security or basket. "Dirty" means it includes accrued interest
     Specific to the <UnderlyingInstrument> (not in <Instrument>)
     In a financing deal price (percent-of-par or per unit) of the underlying security or basket. "Dirty" means it includes accrued interest*)
    f_UnderlyingInstrument_UnderlyingDirtyPrice : fix_float option;
    (** Price (percent-of-par or per unit) of the underlying security or basket at the end of the agreement.
     Specific to the <UnderlyingInstrument> (not in <Instrument>)
     In a financing deal price (percent-of-par or per unit) of the underlying security or basket at the end of the agreement.*)
    f_UnderlyingInstrument_UnderlyingEndPrice : fix_float option;
    (** Currency value attributed to this collateral at the end of the agreement
     Specific to the <UnderlyingInstrument> (not in <Instrument>)
     Currency value attributed to this collateral at the end of the agreement*)
    f_UnderlyingInstrument_UnderlyingEndValue : fix_float option;
    (** Underlying security’s Factor.
     See Factor (228) field for description
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)*)
    f_UnderlyingInstrument_UnderlyingFactor : fix_float option;
    (** Underlying security’s InstrRegistry.
     See InstrRegistry (543) field for description*)
    f_UnderlyingInstrument_UnderlyingInstrRegistry : fix_string option;
    (** Underlying security’s IssueDate.
     See IssueDate (225) field for description
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)
     (prior to FIX 4.4 field was of type UTCDate)*)
    f_UnderlyingInstrument_UnderlyingIssueDate : fix_localmktdate option;
    (** Underlying security’s Issuer.
     See Issuer (06) field for description*)
    f_UnderlyingInstrument_UnderlyingIssuer : fix_string option;
    (** Underlying security’s LocaleOfIssue.
     See LocaleOfIssue (472) field for description*)
    f_UnderlyingInstrument_UnderlyingLocaleOfIssue : fix_string option;
    (** Underlying security’s maturity date.
     See MaturityDate (54) field for description*)
    f_UnderlyingInstrument_UnderlyingMaturityDate : fix_localmktdate option;
    (** Underlying security’s MaturityMonthYear. Can be used with standardized derivatives vs. the UnderlyingMaturityDate (542) field.
     See MaturityMonthYear (200) field for description*)
    f_UnderlyingInstrument_UnderlyingMaturityMonthYear : fix_monthyear option;
    (** Underlying security’s OptAttribute.
     See OptAttribute (206) field for description*)
    f_UnderlyingInstrument_UnderlyingOptAttribute : int option;
    (** Underlying security’s Product.
     Valid values: see Product(460) field*)
    f_UnderlyingInstrument_UnderlyingProduct : int option;
    (** Underlying security’s PutOrCall.
     See PutOrCall field for description*)
    f_UnderlyingInstrument_UnderlyingPutOrCall : int option;
    (** Underlying price associate with a derivative instrument.
     Specific to the <UnderlyingInstrument> (not in <Instrument>)
     In a financing deal clean price (percent-of-par or per unit) of the underlying security or basket.*)
    f_UnderlyingInstrument_UnderlyingPx : fix_float option;
    (** Unit amount of the underlying security (par, shares, currency, etc.)
     Specific to the <UnderlyingInstrument> (not in <Instrument>)
     Unit amount of the underlying security (par, shares, currency, etc.)*)
    f_UnderlyingInstrument_UnderlyingQty : fix_float option;
    (** *** DEPRECATED FIELD - See "Deprecated (Phased-out) Features and Supported Approach" ***
     Underlying security’s RedemptionDate.
     See RedemptionDate (240) field for description
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)
     (prior to FIX 4.4 field was of type UTCDate)
     (Deprecated, use YieldRedemptionDate (696) in <YieldData> component block)*)
    f_UnderlyingInstrument_UnderlyingRedemptionDate : fix_localmktdate option;
    (** *** DEPRECATED FIELD - See "Deprecated (Phased-out) Features and Supported Approach" ***
     Underlying security’s RepoCollateralSecurityType.
     See RepoCollateralSecurityType (239) field for description
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)
     (Deprecated, not applicable/used for Repos)*)
    f_UnderlyingInstrument_UnderlyingRepoCollateralSecurityType : fix_string option;
    (** *** DEPRECATED FIELD - See "Deprecated (Phased-out) Features and Supported Approach" ***
     Underlying security’s RepurchaseRate.
     See RepurchaseRate (227) field for description
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)
     (Deprecated, not applicable/used for Repos)*)
    f_UnderlyingInstrument_UnderlyingRepurchaseRate : fix_float option;
    (** *** DEPRECATED FIELD - See "Deprecated (Phased-out) Features and Supported Approach" ***
     Underlying security’s RepurchaseTerm.
     See RepurchaseTerm (226) field for description
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)
     (Deprecated, not applicable/used for Repos)*)
    f_UnderlyingInstrument_UnderlyingRepurchaseTerm : int option;
    (** Underlying security’s SecurityDesc.
     See SecurityDesc (07) field for description*)
    f_UnderlyingInstrument_UnderlyingSecurityDesc : fix_string option;
    (** Underlying security’s SecurityExchange. Can be used to identify the underlying security.
     Valid values: see SecurityExchange (207)*)
    f_UnderlyingInstrument_UnderlyingSecurityExchange : fix_exchange option;
    (** Underlying security’s SecurityID.
     See SecurityID (48) field for description*)
    f_UnderlyingInstrument_UnderlyingSecurityID : fix_string option;
    (** Underlying security’s SecurityIDSource.
     Valid values: see SecurityIDSource (22) field*)
    f_UnderlyingInstrument_UnderlyingSecurityIDSource : fix_string option;
    (** Underlying security’s SecuritySubType.
     See SecuritySubType (762) field for description*)
    f_UnderlyingInstrument_UnderlyingSecuritySubType : fix_string option;
    (** Underlying security’s SecurityType.
     Valid values: see SecurityType (67) field
     (see below for details concerning this fields use in conjunction with SecurityType=REPO)
     The following applies when used in conjunction with SecurityType=REPO
     Represents the general or specific type of security that underlies a financing agreement
     Valid values for SecurityType=REPO:
     TREASURY = Federal government or treasury
     PROVINCE = State, province, region, etc.
     AGENCY = Federal agency
     MORTGAGE = Mortgage passthrough
     CP = Commercial paper
     CORP = Corporate
     EQUITY = Equity
     SUPRA = Supra-national agency
     CASH
     If bonds of a particular issuer or country are wanted in an Order or are in the basket of an Execution and the SecurityType is not granular enough, include the UnderlyingIssuer (306), UnderlyingCountryOfIssue (592), UnderlyingProgram, UnderlyingRegType and/or <UnderlyingStipulations> block e.g.:
     SecurityType=REPO
     UnderlyingSecurityType=MORTGAGE
     UnderlyingIssuer=GNMA
     or
     SecurityType=REPO
     UnderlyingSecurityType=AGENCY
     UnderlyingIssuer=CA Housing Trust
     UnderlyingCountryOfIssue=CA
     or
     SecurityType=REPO
     UnderlyingSecurityType=CORP
     UnderlyingNoStipulations=
     UnderlyingStipulationType=RATING
     UnderlyingStipulationValue=>bbb-*)
    f_UnderlyingInstrument_UnderlyingSecurityType : fix_string option;
    (** Currency value attributed to this collateral at the start of the agreement
     Specific to the <UnderlyingInstrument> (not in <Instrument>)
     Currency value attributed to this collateral at the start of the agreement*)
    f_UnderlyingInstrument_UnderlyingStartValue : fix_float option;
    (** Underlying security’s StateOrProvinceOfIssue.
     See StateOrProvinceOfIssue (471) field for description*)
    f_UnderlyingInstrument_UnderlyingStateOrProvinceOfIssue : fix_string option;
    (** Currency in which the strike price of an underlying instrument is denominated*)
    f_UnderlyingInstrument_UnderlyingStrikeCurrency : fix_currency option;
    (** Underlying security’s StrikePrice.
     See StrikePrice (202) field for description*)
    f_UnderlyingInstrument_UnderlyingStrikePrice : fix_float option;
    (** Underlying security’s Symbol.
     See Symbol (55) field for description*)
    f_UnderlyingInstrument_UnderlyingSymbol : fix_string option;
    (** Underlying security’s SymbolSfx.
     See SymbolSfx (65) field for description*)
    f_UnderlyingInstrument_UnderlyingSymbolSfx : fix_string option;
    f_UnderlyingInstrument_UndSecAltIDGrp : fix_undsecaltidgrp;
    (** Specific to the <UnderlyingInstrument> (not in <Instrument>)
     Insert here the contents of the <UnderlyingStipulations> Component Block*)
    f_UnderlyingInstrument_UnderlyingStipulations : fix_underlyingstipulations
}
;;

(** The Instrument component block contains all the fields commonly used to describe a security or instrument. Typically the data elements in this component block are considered the static data of a security, data that may be commonly found in a security master database. The Instrument component block can be used to describe any asset type supported by FIX.*)
type fix_instrument = {
    (** Indicates the type of security using ISO 0962 standard, Classification of Financial Instruments (CFI code) values. ISO 0962 is maintained by ANNA (Association of National Numbering Agencies) acting as Registration Authority. See "Appendix 6-B FIX Fields Based Upon Other Standards". See also the Product (460) and SecurityType (67) fields. It is recommended that CFICode be used instead of SecurityType (67) for non-Fixed Income instruments.
     A subset of possible values applicable to FIX usage are identified in "Appendix 6-D CFICode Usage - ISO 0962 Classification of Financial Instruments (CFI code)"
     Indicates the type of security using ISO 10962 standard, Classification of Financial Instruments (CFI code) values. It is recommended that CFICode be used instead of SecurityType for non-Fixed Income instruments.*)
    f_Instrument_CFICode : fix_string option;
    (** The program under which a commercial paper is issued
     The program under which a commercial paper is issued*)
    f_Instrument_CPProgram : fix_cpprogram option;
    (** The registration type of a commercial paper issuance
     The registration type of a commercial paper issuance*)
    f_Instrument_CPRegType : fix_string option;
    (** Specifies the ratio or multiply factor to convert from "nominal" units (e.g. contracts) to total units (e.g. shares) (e.g. 1.0, 100, 1000, etc). Applicable For Fixed Income, Convertible Bonds, Derivatives, etc.
     In general quantities for all calsses should be expressed in the basic unit of the instrument, e.g. shares for equities, norminal or par amount for bonds, currency for foreign exchange. When quantity is expressed in contracts, e.g. financing transactions and bond trade reporting, ContractMutliplier should contain the number of units in one contract and can be omitted if the multiplier is the default amount for the instrument, i.e. 1,000 par of bonds, 1,000,000 par for financing transactions.
     For Fixed Income, Convertible Bonds, Derivatives, etc. Note: If used, quantities should be expressed in the "nominal" (e.g. contracts vs. shares) amount.*)
    f_Instrument_ContractMultiplier : fix_float option;
    (** Specifies when the contract (i.e. MBS/TBA) will settle.
     Must be present for MBS/TBA*)
    f_Instrument_ContractSettlMonth : fix_monthyear option;
    (** ISO Country code of instrument issue (e.g. the country portion typically used in ISIN). Can be used in conjunction with non-ISIN SecurityID (48) (e.g. CUSIP for Municipal Bonds without ISIN) to provide uniqueness.
     ISO Country code of instrument issue (e.g. the country portion typically used in ISIN). Can be used in conjunction with non-ISIN SecurityID (e.g. CUSIP for Municipal Bonds without ISIN) to provide uniqueness.*)
    f_Instrument_CountryOfIssue : fix_country option;
    (** Date interest is to be paid. Used in identifying Corporate Bond issues.
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)
     (prior to FIX 4.4 field was of type UTCDate)
     Date interest is to be paid. Used in identifying Corporate Bond issues.*)
    f_Instrument_CouponPaymentDate : fix_localmktdate option;
    (** The rate of interest that, when multiplied by the principal, par value, or face value of a bond, provides the currency amount of the periodic interest payment. The coupon is always cited, along with maturity, in any quotation of a bond's price.
     For Fixed Income.*)
    f_Instrument_CouponRate : fix_float option;
    (** An evaluation of a company's ability to repay obligations or its likelihood of not defaulting. These evaluation are provided by Credit Rating Agencies, i.e. S&P, Moody's.
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)*)
    f_Instrument_CreditRating : fix_string option;
    (** The effective date of a new securities issue determined by its underwriters. Often but not always the same as the Issue Date and the Interest Accrual Date
     If different from IssueDate*)
    f_Instrument_DatedDate : fix_localmktdate option;
    (** Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Issuer field.
     Encoded (non-ASCII characters) representation of the Issuer field in the encoded format specified via the MessageEncoding field.*)
    f_Instrument_EncodedIssuer : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedIssuer (349) field.
     Must be set if EncodedIssuer field is specified and must immediately precede it.*)
    f_Instrument_EncodedIssuerLen : int option;
    (** Encoded (non-ASCII characters) representation of the SecurityDesc (07) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the SecurityDesc field.
     Encoded (non-ASCII characters) representation of the SecurityDesc field in the encoded format specified via the MessageEncoding field.*)
    f_Instrument_EncodedSecurityDesc : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedSecurityDesc (35) field.
     Must be set if EncodedSecurityDesc field is specified and must immediately precede it.*)
    f_Instrument_EncodedSecurityDescLen : int option;
    (** For Fixed Income: Amorization Factor for deriving Current face from Original face for ABS or MBS securities, note the fraction may be greater than, equal to or less than . In TIPS securities this is the Inflation index.
     Qty * Factor * Price = Gross Trade Amount
     For Derivatives: Contract Value Factor by which price must be adjusted to determine the true nominal value of one futures/options contract.
     (Qty * Price) * Factor = Nominal Value
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)
     For Fixed Income: Amortization Factor for deriving Current face from Original face for ABS or MBS securities, note the fraction may be greater than, equal to or less than 1. In TIPS securities this is the Inflation index.
     Qty * Factor * Price = Gross Trade Amount
     For Derivatives: Contract Value Factor by which price must be adjusted to determine the true nominal value of one futures/options contract.
     (Qty * Price) * Factor = Nominal Value*)
    f_Instrument_Factor : fix_float option;
    (** The location at which records of ownership are maintained for this instrument, and at which ownership changes must be recorded.
     The location at which records of ownership are maintained for this instrument, and at which ownership changes must be recorded. Can be used in conjunction with ISIN to address ISIN uniqueness issues.*)
    f_Instrument_InstrRegistry : fix_string option;
    (** The start date used for calculating accrued interest on debt instruments which are being sold between interest payment dates. Often but not always the same as the Issue Date and the Dated Date
     If different from IssueDate and DatedDate*)
    f_Instrument_InterestAccrualDate : fix_localmktdate option;
    (** The date on which a bond or stock offering is issued. It may or may not be the same as the effective date ("Dated Date") or the date on which interest begins to accrue ("Interest Accrual Date")
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)
     (prior to FIX 4.4 field was of type UTCDate)
     Date instrument was issued. For Fixed Income IOIs for new issues, specifies the issue date.*)
    f_Instrument_IssueDate : fix_localmktdate option;
    (** Name of security issuer (e.g. International Business Machines, GNMA).
     see also Volume 7: "PRODUCT: FIXED INCOME - Euro Issuer Values"*)
    f_Instrument_Issuer : fix_string option;
    (** Identifies the locale. For Municipal Security Issuers other than state or province. Refer to
     http://www.atmos.albany.edu/cgi/stagrep-cgi
     Reference the IATA city codes for values.
     Note IATA (International Air Transport Association) maintains the codes at www.iata.org.
     The three-character IATA code for a locale (e.g. airport code for Municipal Bonds).*)
    f_Instrument_LocaleOfIssue : fix_string option;
    (** Date of maturity.
     Specifies date of maturity (a full date). Note that standardized derivatives which are typically only referenced by month and year (e.g. S&P futures).may use MaturityMonthYear and/or this field.
     When using MaturityMonthYear, it is recommended that markets and sell sides report the MaturityDate on all outbound messages as a means of data enrichment.*)
    f_Instrument_MaturityDate : fix_localmktdate option;
    (** Can be used with standardized derivatives vs. the MaturityDate (54) field. Month and Year of the maturity (used for standardized futures and options).
     Format:
     YYYYMM (i.e. 199903)
     YYYYMMDD (20030323)
     YYYYMMwN (200303w) for week
     A specific date or can be appended to the MaturityMonthYear. For instance, if multiple standard products exist that mature in the same Year and Month, but actually mature at a different time, a value can be appended, such as "w" or "w2" to indicate week as opposed to week 2 expiration. Likewise, the date (0-3) can be appended to indicate a specific expiration (maturity date).
     Specifies the month and year of maturity. Applicable for standardized derivatives which are typically only referenced by month and year (e.g. S&P futures). Note MaturityDate (a full date) can also be specified.*)
    f_Instrument_MaturityMonthYear : fix_monthyear option;
    (** Can be used for SecurityType (67) =OPT to identify a particular security.
     Valid values vary by SecurityExchange:
     *** REPLACED values - See "Replaced Features and Supported Approach" ***
     For Exchange: MONEP (Paris)
     L = Long (a.k.a. "American")
     S = Short (a.k.a. "European")
     For Exchanges: DTB (Frankfurt), HKSE (Hong Kong), and SOFFEX (Zurich)
     0-9 = single digit "version" number assigned by exchange following capital adjustments (0=current, =prior, 2=prior to , etc).
     Used for derivatives, such as options and covered warrants to indicate a versioning of the contract when required due to corporate actions to the underlying. Should not be used to indicate type of option - use the CFICode[461] for this purpose.*)
    f_Instrument_OptAttribute : int option;
    (** For Fixed Income, identifies MBS / ABS pool.
     Identifies MBS / ABS pool*)
    f_Instrument_Pool : fix_string option;
    (** Indicates the type of product the security is associated with. See also the CFICode (46) and SecurityType (67) fields.
     Indicates the type of product the security is associated with (high-level category)*)
    f_Instrument_Product : fix_product option;
    (** Indicates whether an Option is for a put or call
     For Options.*)
    f_Instrument_PutOrCall : fix_putorcall option;
    (** *** DEPRECATED FIELD - See "Deprecated (Phased-out) Features and Supported Approach" ***
     Return of investor's principal in a security. Bond redemption can occur before maturity date.
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)
     (prior to FIX 4.4 field was of type UTCDate)
     (Deprecated, use YieldRedemptionDate (696) in <YieldData> component block)*)
    f_Instrument_RedemptionDate : fix_localmktdate option;
    (** *** DEPRECATED FIELD - See "Deprecated (Phased-out) Features and Supported Approach" ***
     Identifies the collateral used in the transaction.
     Valid values: see SecurityType (67) field
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)
     (Deprecated, use UnderlyingSecurityType (310) )*)
    f_Instrument_RepoCollateralSecurityType : fix_string option;
    (** *** DEPRECATED FIELD - See "Deprecated (Phased-out) Features and Supported Approach" ***
     Percent of par at which a Repo will be repaid. Represented as a percent, e.g. .9525 represents 95-/4 percent of par.
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)
     (Deprecated, use Price (44) )*)
    f_Instrument_RepurchaseRate : fix_float option;
    (** *** DEPRECATED FIELD - See "Deprecated (Phased-out) Features and Supported Approach" ***
     Number of business days before repurchase of a repo.
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)
     (Deprecated, use TerminationType (788) )*)
    f_Instrument_RepurchaseTerm : int option;
    (** Security description.*)
    f_Instrument_SecurityDesc : fix_string option;
    (** Market used to help identify a security.
     Valid values:
     See "Appendix 6-C"
     Can be used to identify the security.*)
    f_Instrument_SecurityExchange : fix_exchange option;
    (** Security identifier value of SecurityIDSource (22) type (e.g. CUSIP, SEDOL, ISIN, etc). Requires SecurityIDSource.
     Takes precedence in identifying security to counterparty over SecurityAltID block. Requires SecurityIDSource if specified.*)
    f_Instrument_SecurityID : fix_string option;
    (** Identifies class or source of the SecurityID (48) value. Required if SecurityID is specified.
     Required if SecurityID is specified.*)
    f_Instrument_SecurityIDSource : fix_securityidsource option;
    (** Sub-type qualification/identification of the SecurityType (e.g. for SecurityType="REPO").
     Example Values:
     General = General Collateral (for SecurityType=REPO)
     For SecurityType="MLEG" markets can provide the name of the option or futures strategy, such as Calendar, Vertical, Butterfly, etc.
     NOTE: Additional values may be used by mutual agreement of the counterparties
     Sub-type qualification/identification of the SecurityType (e.g. for SecurityType="MLEG"). If specified, SecurityType is required.*)
    f_Instrument_SecuritySubType : fix_string option;
    (** Indicates type of security. See also the Product (460) and CFICode (46) fields. It is recommended that CFICode be used instead of SecurityType for non-Fixed Income instruments.
     Example values (grouped by Product field value) (Note: additional values may be used by mutual agreement of the counterparties):
     * Identify the Issuer in the "Issuer" field(06)
     *** REPLACED values - See "Replaced Features and Supported Approach" ***
     NOTE: Additional values may be used by mutual agreement of the counterparties)
     It is recommended that CFICode be used instead of SecurityType for non-Fixed Income instruments.
     Required for Fixed Income. Refer to Volume 7 - Fixed Income
     Futures and Options should be specified using the CFICode[461] field instead of SecurityType[167] (Refer to Volume 7 - Recommendations and Guidelines for Futures and Options Markets.)*)
    f_Instrument_SecurityType : fix_securitytype option;
    (** A two-character state or province abbreviation.
     A two-character state or province abbreviation.*)
    f_Instrument_StateOrProvinceOfIssue : fix_string option;
    (** Currency in which the StrikePrice is denominated.
     Used for derivatives*)
    f_Instrument_StrikeCurrency : fix_currency option;
    (** Strike Price for an Option.
     Used for derivatives, such as options and covered warrants*)
    f_Instrument_StrikePrice : fix_float option;
    (** Ticker symbol. Common, "human understood" representation of the security. SecurityID (48) value can be specified if no symbol exists (e.g. non-exchange traded Collective Investment Vehicles)
     Use "[N/A]" for products which do not have a symbol.
     Common, "human understood" representation of the security. SecurityID value can be specified if no symbol exists (e.g. non-exchange traded Collective Investment Vehicles)
     Use "[N/A]" for products which do not have a symbol.*)
    f_Instrument_Symbol : fix_string option;
    (** Additional information about the security (e.g. preferred, warrants, etc.). Note also see SecurityType (67).
     Valid values:
     As defined in the NYSE Stock and bond Symbol Directory and in the AMEX Fitch Directory
     Fixed Income use:
     WI = "When Issued" for a security to be reissued under an old CUSIP or ISIN
     CD = a EUCP with lump-sum interest rather than discount price
     Used in Fixed Income with a value of "WI" to indicate "When Issued" for a security to be reissued under an old CUSIP or ISIN or with a value of "CD" to indicate a EUCP with lump-sum interest rather than discount price.*)
    f_Instrument_SymbolSfx : fix_string option;
    (** Number of repeating EventType group entries.*)
    f_Instrument_EvntGrp : fix_evntgrp;
    (** Number of alternate Security Identifiers*)
    f_Instrument_SecAltIDGrp : fix_secaltidgrp
}
;;

type fix_instrmtleggrp = {
    (** Number of InstrumentLeg repeating group instances.*)
    f_InstrmtLegGrp_NoLegs : int option;
    f_InstrmtLegGrp_InstrumentLeg : fix_instrumentleg
}
;;

type fix_undinstrmtgrp = {
    (** Number of underlying legs that make up the security.*)
    f_UndInstrmtGrp_NoUnderlyings : int option;
    f_UndInstrmtGrp_UnderlyingInstrument : fix_underlyinginstrument
}
;;

type fix_nstdptys2subgrp = {
    (** PartySubID value within a "second instance" Nested repeating group.
     Same values as PartySubID (523)*)
    f_NstdPtys2SubGrp_Nested2PartySubID : fix_string option;
    (** Type of Nested2PartySubID (760) value. Second instance of <NestedParties>.
     Same values as PartySubIDType (803)*)
    f_NstdPtys2SubGrp_Nested2PartySubIDType : int option;
    (** Number of Nested2PartySubID (760) and Nested2PartySubIDType (807) entries. Second instance of <NestedParties>.*)
    f_NstdPtys2SubGrp_NoNested2PartySubIDs : int option
}
;;

(** The NestedParties2 component block is identical to the Parties Block. It is used in other component blocks and repeating groups when nesting will take place resulting in multiple occurrences of the Parties block within a single FIX message.. Use of NestedParties2 under these conditions avoids multiple references to the Parties block within the same message which is not allowed in FIX tag/value syntax.*)
type fix_nestedparties2 = {
    (** PartyID value within a "second instance" Nested repeating group.
     Same values as PartyID (448)
     Used to identify source of Nested2PartyID. Required if Nested2PartyIDSource is specified. Required if NoNested2PartyIDs > 0.*)
    f_NestedParties2_Nested2PartyID : fix_string option;
    (** PartyIDSource value within a "second instance" Nested repeating group.
     Same values as PartyIDSource (447)
     Used to identify class source of Nested2PartyID value (e.g. BIC). Required if Nested2PartyID is specified. Required if NoNested2PartyIDs > 0.*)
    f_NestedParties2_Nested2PartyIDSource : int option;
    (** PartyRole value within a "second instance" Nested repeating group.
     Same values as PartyRole (452)
     Identifies the type of Nested2PartyID (e.g. Executing Broker). Required if NoNested2PartyIDs > 0.*)
    f_NestedParties2_Nested2PartyRole : int option;
    (** Number of Nested2PartyID (757), Nested2PartyIDSource (758), and Nested2PartyRole (759) entries
     Repeating group below should contain unique combinations of Nested2PartyID, Nested2PartyIDSource, and Nested2PartyRole*)
    f_NestedParties2_NoNested2PartyIDs : int option;
    (** Repeating group of Nested2Party sub-identifiers.*)
    f_NestedParties2_NstdPtys2SubGrp : fix_nstdptys2subgrp
}
;;

type fix_attrbgrp = {
    (** Code to represent the type of instrument attribute*)
    f_AttrbGrp_InstrAttribType : fix_instrattribtype option;
    (** Attribute value appropriate to the InstrAttribType (87) field.*)
    f_AttrbGrp_InstrAttribValue : fix_string option;
    (** Number of repeating InstrAttribType entries.*)
    f_AttrbGrp_NoInstrAttrib : int option
}
;;

type fix_ptyssubgrp = {
    (** Number of PartySubID (523)and PartySubIDType (803) entries*)
    f_PtysSubGrp_NoPartySubIDs : int option;
    (** Sub-identifier (e.g. Clearing Account for PartyRole (452)=Clearing Firm, Locate ID # for PartyRole=Locate/Lending Firm, etc). Not required when using PartyID (448), PartyIDSource (447), and PartyRole.*)
    f_PtysSubGrp_PartySubID : fix_string option;
    (** Type of PartySubID (523) value
     4000+ = Reserved and available for bi-laterally agreed upon user defined values*)
    f_PtysSubGrp_PartySubIDType : fix_partysubidtype option
}
;;

type fix_nstdptyssubgrp = {
    (** PartySubID value within a nested repeating group.
     Same values as PartySubID (523)*)
    f_NstdPtysSubGrp_NestedPartySubID : fix_string option;
    (** Type of NestedPartySubID (545) value.
     Same values as PartySubIDType (803)*)
    f_NstdPtysSubGrp_NestedPartySubIDType : int option;
    (** Number of NestedPartySubID (545) and NestedPartySubIDType (805) entries*)
    f_NstdPtysSubGrp_NoNestedPartySubIDs : int option
}
;;

type fix_settlptyssubgrp = {
    (** Number of SettlPartySubID (785) and SettlPartySubIDType (786) entries*)
    f_SettlPtysSubGrp_NoSettlPartySubIDs : int option;
    (** PartySubID value within a settlement parties component.
     Same values as PartySubID (523)*)
    f_SettlPtysSubGrp_SettlPartySubID : fix_string option;
    (** Type of SettlPartySubID (785) value.
     Same values as PartySubIDType (803)*)
    f_SettlPtysSubGrp_SettlPartySubIDType : int option
}
;;

(** The SettlParties component block is used in a similar manner as Parties Block within the context of settlement instruction messages to distinguish between parties involved in the settlement and parties who are expected to execute the settlement process.*)
type fix_settlparties = {
    (** Number of SettlPartyID (782), SettlPartyIDSource (783), and SettlPartyRole (784) entries
     Repeating group below should contain unique combinations of SettlPartyID, SettlPartyIDSource, and SettlPartyRole*)
    f_SettlParties_NoSettlPartyIDs : int option;
    (** PartyID value within a settlement parties component. Nested repeating group.
     Same values as PartyID (448)
     Used to identify source of SettlPartyID. Required if SettlPartyIDSource is specified. Required if NoSettlPartyIDs > 0.*)
    f_SettlParties_SettlPartyID : fix_string option;
    (** PartyIDSource value within a settlement parties component.
     Same values as PartyIDSource (447)
     Used to identify class source of SettlPartyID value (e.g. BIC). Required if SettlPartyID is specified. Required if NoSettlPartyIDs > 0.*)
    f_SettlParties_SettlPartyIDSource : int option;
    (** PartyRole value within a settlement parties component.
     Same values as PartyRole (452)
     Identifies the type of SettlPartyID (e.g. Executing Broker). Required if NoSettlPartyIDs > 0.*)
    f_SettlParties_SettlPartyRole : int option;
    (** Repeating group of SettlParty sub-identifiers.*)
    f_SettlParties_SettlPtysSubGrp : fix_settlptyssubgrp
}
;;

type fix_dlvyinstgrp = {
    (** Used to indicate whether a delivery instruction is used for securities or cash settlement*)
    f_DlvyInstGrp_DlvyInstType : fix_dlvyinsttype option;
    (** Number of delivery instruction fields in repeating group.
     Note this field was removed in FIX 4.1 and reinstated in FIX 4.4.*)
    f_DlvyInstGrp_NoDlvyInst : int option;
    (** Indicates source of Settlement Instructions*)
    f_DlvyInstGrp_SettlInstSource : fix_settlinstsource option;
    f_DlvyInstGrp_SettlParties : fix_settlparties
}
;;

type fix_clrinstgrp = {
    (** Eligibility of this trade for clearing and central counterparty processing*)
    f_ClrInstGrp_ClearingInstruction : fix_clearinginstruction option;
    (** Number of clearing instructions*)
    f_ClrInstGrp_NoClearingInstructions : int option
}
;;

(** The CommissionDate component block is used to carry commission information such as the type of commission and the rate.*)
type fix_commissiondata = {
    (** Specifies currency to be use for Commission (2) if the Commission currency is different from the Deal Currency - see "Appendix 6-A; Valid Currency Codes".
     For CIV - Optional*)
    f_CommissionData_CommCurrency : fix_currency option;
    (** Commission type*)
    f_CommissionData_CommType : fix_commtype option;
    (** Commission. Note if CommType (3) is percentage, Commission of 5% should be represented as .05.*)
    f_CommissionData_Commission : fix_float option;
    (** A one character code identifying whether the Fund based renewal commission is to be waived.
     For CIV - Optional*)
    f_CommissionData_FundRenewWaiv : fix_fundrenewwaiv option
}
;;

type fix_miscfeesgrp = {
    (** Miscellaneous fee value*)
    f_MiscFeesGrp_MiscFeeAmt : fix_float option;
    (** Defines the unit for a miscellaneous fee.*)
    f_MiscFeesGrp_MiscFeeBasis : fix_miscfeebasis option;
    (** Currency of miscellaneous fee*)
    f_MiscFeesGrp_MiscFeeCurr : fix_currency option;
    (** Indicates type of miscellaneous fee*)
    f_MiscFeesGrp_MiscFeeType : fix_miscfeetype option;
    (** Number of repeating groups of miscellaneous fees*)
    f_MiscFeesGrp_NoMiscFees : int option
}
;;

(** The NestedParties component block is identical to the Parties Block. It is used in other component blocks and repeating groups when nesting will take place resulting in multiple occurrences of the Parties block within a single FIX message.. Use of NestedParties under these conditions avoids multiple references to the Parties block within the same message which is not allowed in FIX tag/value syntax.*)
type fix_nestedparties = {
    (** PartyID value within a nested repeating group.
     Same values as PartyID (448)
     Used to identify source of NestedPartyID. Required if NestedPartyIDSource is specified. Required if NoNestedPartyIDs > 0.*)
    f_NestedParties_NestedPartyID : fix_string option;
    (** PartyIDSource value within a nested repeating group.
     Same values as PartyIDSource (447)
     Used to identify class source of NestedPartyID value (e.g. BIC). Required if NestedPartyID is specified. Required if NoNestedPartyIDs > 0.*)
    f_NestedParties_NestedPartyIDSource : int option;
    (** PartyRole value within a nested repeating group.
     Same values as PartyRole (452)
     Identifies the type of NestedPartyID (e.g. Executing Broker). Required if NoNestedPartyIDs > 0.*)
    f_NestedParties_NestedPartyRole : int option;
    (** Number of NestedPartyID (524), NestedPartyIDSource (525), and NestedPartyRole (538) entries
     Repeating group below should contain unique combinations of NestedPartyID, NestedPartyIDSource, and NestedPartyRole*)
    f_NestedParties_NoNestedPartyIDs : int option;
    (** Repeating group of NestedParty sub-identifiers.*)
    f_NestedParties_NstdPtysSubGrp : fix_nstdptyssubgrp
}
;;

(** The SettlInstructionsData component block is used to convey key information regarding standing settlement and delivery instructions. It also provides a reference to standing settlement details regarding the source, delivery instructions, and settlement parties*)
type fix_settlinstructionsdata = {
    (** Identifies type of settlement
     Required if AllocSettlInstType = 1 or 2*)
    f_SettlInstructionsData_SettlDeliveryType : fix_settldeliverytype option;
    (** Unique identifier used on the Standing Instructions database for the Standing Instructions to be referenced.
     Identifier used within the StandInstDbType
     Required if AllocSettlInstType = 3 (should not be populated otherwise)*)
    f_SettlInstructionsData_StandInstDbID : fix_string option;
    (** Name of the Standing Instruction database represented with StandInstDbType (69) (i.e. the Global Custodian’s name).
     Required if AllocSettlInstType = 3 (should not be populated otherwise)*)
    f_SettlInstructionsData_StandInstDbName : fix_string option;
    (** Identifies the Standing Instruction database used
     Required if AllocSettlInstType = 3 (should not be populated otherwise)*)
    f_SettlInstructionsData_StandInstDbType : fix_standinstdbtype option;
    (** Required (and must be > 0) if AllocSettlInstType = 2 (should not be populated otherwise)*)
    f_SettlInstructionsData_DlvyInstGrp : fix_dlvyinstgrp
}
;;

type fix_ordallocgrp = {
    (** Unique identifier for Order as assigned by the buy-side (institution, broker, intermediary etc.) (identified by SenderCompID (49) or OnBehalfOfCompID (5) as appropriate). Uniqueness must be guaranteed within a single trading day. Firms, particularly those which electronically submit multi-day orders, trade globally or throughout market close periods, should ensure uniqueness across days, for example by embedding a date within the ClOrdID field.*)
    f_OrdAllocGrp_ClOrdID : fix_string option;
    (** Unique identifier for list as assigned by institution, used to associate multiple individual orders. Uniqueness must be guaranteed within a single trading day. Firms which generate multi-day orders should consider embedding a date within the ListID field to assure uniqueness across days.*)
    f_OrdAllocGrp_ListID : fix_string option;
    (** Indicates number of orders to be combined for average pricing and allocation.*)
    f_OrdAllocGrp_NoOrders : int option;
    (** Average price for a specific order*)
    f_OrdAllocGrp_OrderAvgPx : fix_float option;
    (** Quantity of the order that is being booked out as part of an Allocation Instruction or Allocation Report message*)
    f_OrdAllocGrp_OrderBookingQty : fix_float option;
    (** Unique identifier for Order as assigned by sell-side (broker, exchange, ECN). Uniqueness must be guaranteed within a single trading day. Firms which accept multi-day orders should consider embedding a date within the OrderID field to assure uniqueness across days.*)
    f_OrdAllocGrp_OrderID : fix_string option;
    (** Quantity ordered. This represents the number of shares for equities or par, face or nominal value for FI instruments.
     (Prior to FIX 4.2 this field was of type int)*)
    f_OrdAllocGrp_OrderQty : fix_float option;
    (** Assigned by the party which originates the order. Can be used to provide the ClOrdID (11) used by an exchange or executing system.*)
    f_OrdAllocGrp_SecondaryClOrdID : fix_string option;
    (** Assigned by the party which accepts the order. Can be used to provide the OrderID (37) used by an exchange or executing system.*)
    f_OrdAllocGrp_SecondaryOrderID : fix_string option;
    f_OrdAllocGrp_NestedParties2 : fix_nestedparties2
}
;;

type fix_execallocgrp = {
    (** Unique identifier of execution message as assigned by sell-side (broker, exchange, ECN) (will be 0 (zero) for ExecType (50) =I (Order Status)). Uniqueness must be guaranteed within a single trading day or the life of a multi-day order. Firms which accept multi-day orders should consider embedding a date within the ExecID field to assure uniqueness across days. (Prior to FIX 4.1 this field was of type int)*)
    f_ExecAllocGrp_ExecID : fix_string option;
    (** Broker capacity in order execution*)
    f_ExecAllocGrp_LastCapacity : fix_lastcapacity option;
    (** Last price expressed in percent-of-par. Conditionally required for Fixed Income trades when LastPx (3) is expressed in Yield, Spread, Discount or any other type.
     Usage: Execution Report and Allocation Report repeating executions block (from sellside).*)
    f_ExecAllocGrp_LastParPx : fix_float option;
    (** Price of this (last) fill.*)
    f_ExecAllocGrp_LastPx : fix_float option;
    (** Quantity (e.g. shares) bought/sold on this (last) fill.
     (Prior to FIX 4.2 this field was of type int)*)
    f_ExecAllocGrp_LastQty : fix_float option;
    (** No of execution repeating group entries to follow.*)
    f_ExecAllocGrp_NoExecs : int option;
    (** Assigned by the party which accepts the order. Can be used to provide the ExecID (7) used by an exchange or executing system.*)
    f_ExecAllocGrp_SecondaryExecID : fix_string option
}
;;

(** The InstrumentExtension component block identifies additional security attributes that are more commonly found for Fixed Income securities.*)
type fix_instrumentextension = {
    (** Identifies the form of delivery
     Identifies the form of delivery.*)
    f_InstrumentExtension_DeliveryForm : fix_deliveryform option;
    (** Percent at risk due to lowest possible call.
     Percent at risk due to lowest possible call.*)
    f_InstrumentExtension_PctAtRisk : fix_float option;
    (** Number of repeating InstrAttrib group entries.*)
    f_InstrumentExtension_AttrbGrp : fix_attrbgrp
}
;;

(** Component block is optionally used only for financing deals to identify the legal agreement under which the deal was made and other unique characteristics of the transaction. The AgreementDesc field refers to base standard documents such as MRA 1996 Repurchase Agreement, GMRA 2000 Bills Transaction (U.K.), MSLA 1993 Securities Loan – Amended 1998, for example.*)
type fix_financingdetails = {
    (** Contractual currency forming the basis of a financing agreement and associated transactions. Usually, but not always, the same as the trade currency.
     Currency of the underlying agreement.*)
    f_FinancingDetails_AgreementCurrency : fix_currency option;
    (** A reference to the date the underlying agreement specified by AgreementID and AgreementDesc was executed.
     A reference to the date the underlying agreement was executed.*)
    f_FinancingDetails_AgreementDate : fix_localmktdate option;
    (** The full name of the base standard agreement, annexes and amendments in place between the principals applicable to a financing transaction.
     The full name of the base standard agreement, annexes and amendments in place between the principals and applicable to this deal*)
    f_FinancingDetails_AgreementDesc : fix_string option;
    (** A common reference to the applicable standing agreement between the counterparties to a financing transaction.
     A common reference to the applicable standing agreement between the principals*)
    f_FinancingDetails_AgreementID : fix_string option;
    (** Identifies type of settlement
     Delivery or custody arrangement for the underlying securities*)
    f_FinancingDetails_DeliveryType : fix_deliverytype option;
    (** End date of a financing deal, i.e. the date the seller reimburses the buyer and takes back control of the collateral
     Repayment / repurchase date*)
    f_FinancingDetails_EndDate : fix_localmktdate option;
    (** The fraction of the cash consideration that must be collateralized, expressed as a percent. A MarginRatio of 02% indicates that the value of the collateral (after deducting for "haircut") must exceed the cash consideration by 2%.
     Percentage of cash value that underlying security collateral must meet.*)
    f_FinancingDetails_MarginRatio : fix_float option;
    (** Start date of a financing deal, i.e. the date the buyer pays the seller cash and takes control of the collateral
     Settlement date of the beginning of the deal*)
    f_FinancingDetails_StartDate : fix_localmktdate option;
    (** Type of financing termination
     For Repos the timing or method for terminating the agreement.*)
    f_FinancingDetails_TerminationType : fix_terminationtype option
}
;;

(** The SpreadOrBenchmarkCurveData component block is primarily used for Fixed Income to convey spread to a benchmark security or curve.*)
type fix_spreadorbenchmarkcurvedata = {
    (** Identifies currency used for benchmark curve. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)*)
    f_SpreadOrBenchmarkCurveData_BenchmarkCurveCurrency : fix_currency option;
    (** Name of benchmark curve.*)
    f_SpreadOrBenchmarkCurveData_BenchmarkCurveName : fix_string option;
    (** Point on benchmark curve. Free form values: e.g. "Y", "7Y", "INTERPOLATED".
     Sample values:
     M = combination of a number between 1-12 and a "M" for month
     Y = combination of number between 1-100 and a "Y" for year
     10Y-OLD = see above, then add "-OLD" when appropriate
     INTERPOLATED = the point is mathematically derived
     2/2031 5 3/8 = the point is stated via a combination of maturity month / year and coupon
     See Fixed Income-specific documentation at http://www.fixprotocol.org for additional values.
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)*)
    f_SpreadOrBenchmarkCurveData_BenchmarkCurvePoint : fix_string option;
    (** Specifies the price of the benchmark.*)
    f_SpreadOrBenchmarkCurveData_BenchmarkPrice : fix_float option;
    (** Identifies type of BenchmarkPrice (662).
     See PriceType (423) for valid values.
     Must be present if BenchmarkPrice is used.*)
    f_SpreadOrBenchmarkCurveData_BenchmarkPriceType : int option;
    (** The identifier of the benchmark security, e.g. Treasury against Corporate bond.
     See SecurityID (tag 48) for description and valid values.
     The identifier of the benchmark security, e.g. Treasury against Corporate bond.*)
    f_SpreadOrBenchmarkCurveData_BenchmarkSecurityID : fix_string option;
    (** Identifies class or source of the BenchmarkSecurityID (699) value. Required if BenchmarkSecurityID is specified.
     Same values as the SecurityIDSource (22) field
     Source of BenchmarkSecurityID. If not specified, then ID Source is understood to be the same as that in the Instrument block.*)
    f_SpreadOrBenchmarkCurveData_BenchmarkSecurityIDSource : fix_string option;
    (** For Fixed Income. Either Swap Spread or Spread to Benchmark depending upon the order type.
     Spread to Benchmark: Basis points relative to a benchmark. To be expressed as "count of basis points" (vs. an absolute value). E.g. High Grade Corporate Bonds may express price as basis points relative to benchmark (the BenchmarkCurveName (22) field). Note: Basis points can be negative.
     Swap Spread: Target spread for a swap.
     For Fixed Income*)
    f_SpreadOrBenchmarkCurveData_Spread : fix_float option
}
;;

(** The Parties component block is used to identify and convey information on the entities both central and peripheral to the financial transaction represented by the FIX message containing the Parties Block. The Parties block allows many different types of entites to be expressed through use of the PartyRole field and identifies the source of the PartyID through the the PartyIDSource.*)
type fix_parties = {
    (** Number of PartyID (448), PartyIDSource (447), and PartyRole (452) entries
     Repeating group below should contain unique combinations of PartyID, PartyIDSource, and PartyRole*)
    f_Parties_NoPartyIDs : int option;
    (** Party identifier/code. See PartyIDSource (447) and PartyRole (452).
     See "Appendix 6-G – Use of <Parties> Component Block"
     Used to identify source of PartyID. Required if PartyIDSource is specified. Required if NoPartyIDs > 0.*)
    f_Parties_PartyID : fix_string option;
    (** Identifies class or source of the PartyID (448) value. Required if PartyID is specified. Note: applicable values depend upon PartyRole (452) specified.
     See "Appendix 6-G – Use of <Parties> Component Block"
     Used to identify class source of PartyID value (e.g. BIC). Required if PartyID is specified. Required if NoPartyIDs > 0.*)
    f_Parties_PartyIDSource : fix_partyidsource option;
    (** Identifies the type or role of the PartyID (448) specified.
     See "Appendix 6-G – Use of <Parties> Component Block"
     Identifies the type of PartyID (e.g. Executing Broker). Required if NoPartyIDs > 0.*)
    f_Parties_PartyRole : fix_partyrole option;
    (** Repeating group of Party sub-identifiers.*)
    f_Parties_PtysSubGrp : fix_ptyssubgrp
}
;;

(** The Stipulations component block is used in Fixed Income to provide additional information on a given security. These additional information are usually not considered static data information.*)
type fix_stipulations = {
    (** Number of stipulation entries
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3).*)
    f_Stipulations_NoStipulations : int option;
    (** Type of Stipulation
     Required if NoStipulations >0*)
    f_Stipulations_StipulationType : fix_stipulationtype option;
    (** For Fixed Income. Value of stipulation.
     The expression can be an absolute single value or a combination of values and logical operators:
     < value
     > value
     <= value
     >= value
     value
     value – value2
     value OR value2
     value AND value2
     YES
     NO
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)*)
    f_Stipulations_StipulationValue : fix_string option
}
;;

(** The YieldData component block conveys yield information for a given Fixed Income security.*)
type fix_yielddata = {
    (** Yield percentage.
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)*)
    f_YieldData_Yield : fix_float option;
    (** Include as needed to clarify yield irregularities associated with date, e.g. when it falls on a non-business day.*)
    f_YieldData_YieldCalcDate : fix_localmktdate option;
    (** Date to which the yield has been calculated (i.e. maturity, par call or current call, pre-refunded date).*)
    f_YieldData_YieldRedemptionDate : fix_localmktdate option;
    (** Price to which the yield has been calculated.*)
    f_YieldData_YieldRedemptionPrice : fix_float option;
    (** The price type of the YieldRedemptionPrice (697)
     See PriceType (423) for description and valid values.*)
    f_YieldData_YieldRedemptionPriceType : int option;
    (** Type of yield*)
    f_YieldData_YieldType : fix_yieldtype option
}
;;

type fix_allocgrp = {
    (** Sub-account mnemonic*)
    f_AllocGrp_AllocAccount : fix_string option;
    (** Amount of Accrued Interest for convertible bonds and fixed income at the allocation-level.*)
    f_AllocGrp_AllocAccruedInterestAmt : fix_float option;
    (** Used to identify the source of the AllocAccount (79) code.
     See AcctIDSource (660) for valid values.*)
    f_AllocGrp_AllocAcctIDSource : int option;
    (** AvgPx (6) for a specific AllocAccount (79)
     For Fixed Income this is always expressed as "percent of par" price type.*)
    f_AllocGrp_AllocAvgPx : fix_float option;
    (** Indicates how the receiver (i.e. third party) of Allocation message should handle/process the account details*)
    f_AllocGrp_AllocHandlInst : fix_allochandlinst option;
    (** Amount of interest (i.e. lump-sum) at maturity at the account-level.*)
    f_AllocGrp_AllocInterestAtMaturity : fix_float option;
    (** NetMoney (8) for a specific AllocAccount (79)*)
    f_AllocGrp_AllocNetMoney : fix_float option;
    (** Executed price for an AllocAccount (79) entry used when using "executed price" vs. "average price" allocations (e.g. Japan).*)
    f_AllocGrp_AllocPrice : fix_float option;
    (** Quantity to be allocated to specific sub-account
     (Prior to FIX 4.2 this field was of type int)*)
    f_AllocGrp_AllocQty : fix_float option;
    (** Total amount due expressed in settlement currency (includes the effect of the forex transaction) for a specific AllocAccount (79).*)
    f_AllocGrp_AllocSettlCurrAmt : fix_float option;
    (** Currency code of settlement denomination for a specific AllocAccount (79).*)
    f_AllocGrp_AllocSettlCurrency : fix_currency option;
    (** Used to indicate whether settlement instructions are provided on an allocation instruction message, and if not, how they are to be derived*)
    f_AllocGrp_AllocSettlInstType : fix_allocsettlinsttype option;
    (** Free format text related to a specific AllocAccount (79).*)
    f_AllocGrp_AllocText : fix_string option;
    (** Encoded (non-ASCII characters) representation of the AllocText (6) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the AllocText field.*)
    f_AllocGrp_EncodedAllocText : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedAllocText (36) field.*)
    f_AllocGrp_EncodedAllocTextLen : int option;
    (** Unique identifier for a specific NoAllocs (78) repeating group instance (e.g. for an AllocAccount).*)
    f_AllocGrp_IndividualAllocID : fix_string option;
    (** The status of this trade with respect to matching or comparison*)
    f_AllocGrp_MatchStatus : fix_matchstatus option;
    (** Number of repeating AllocAccount (79)/AllocPrice (366) entries.*)
    f_AllocGrp_NoAllocs : int option;
    (** Indicates whether or not details should be communicated to BrokerOfCredit (i.e. step-in broker).*)
    f_AllocGrp_NotifyBrokerOfCredit : fix_notifybrokerofcredit option;
    (** Processing code for sub-account. Absence of this field in AllocAccount (79) / AllocPrice (366) /AllocQty (80) / ProcessCode instance indicates regular trade.*)
    f_AllocGrp_ProcessCode : fix_processcode option;
    (** Total amount due expressed in settlement currency (includes the effect of the forex transaction)*)
    f_AllocGrp_SettlCurrAmt : fix_float option;
    (** Foreign exchange rate used to compute SettlCurrAmt (9) from Currency (5) to SettlCurrency (20)*)
    f_AllocGrp_SettlCurrFxRate : fix_float option;
    (** Specifies whether or not SettlCurrFxRate (55) should be multiplied or divided*)
    f_AllocGrp_SettlCurrFxRateCalc : fix_settlcurrfxratecalc option;
    (** Currency code of settlement denomination.*)
    f_AllocGrp_SettlCurrency : fix_currency option;
    f_AllocGrp_ClrInstGrp : fix_clrinstgrp;
    f_AllocGrp_CommissionData : fix_commissiondata;
    f_AllocGrp_MiscFeesGrp : fix_miscfeesgrp;
    f_AllocGrp_NestedParties : fix_nestedparties;
    f_AllocGrp_SettlInstructionsData : fix_settlinstructionsdata
}
;;

type fix_allocackgrp = {
    (** Sub-account mnemonic*)
    f_AllocAckGrp_AllocAccount : fix_string option;
    (** Used to identify the source of the AllocAccount (79) code.
     See AcctIDSource (660) for valid values.*)
    f_AllocAckGrp_AllocAcctIDSource : int option;
    (** Executed price for an AllocAccount (79) entry used when using "executed price" vs. "average price" allocations (e.g. Japan).*)
    f_AllocAckGrp_AllocPrice : fix_float option;
    (** Free format text related to a specific AllocAccount (79).*)
    f_AllocAckGrp_AllocText : fix_string option;
    (** Encoded (non-ASCII characters) representation of the AllocText (6) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the AllocText field.*)
    f_AllocAckGrp_EncodedAllocText : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedAllocText (36) field.*)
    f_AllocAckGrp_EncodedAllocTextLen : int option;
    (** Unique identifier for a specific NoAllocs (78) repeating group instance (e.g. for an AllocAccount).*)
    f_AllocAckGrp_IndividualAllocID : fix_string option;
    (** Identified reason for rejecting an individual AllocAccount (79) detail.
     Same values as AllocRejCode (88)*)
    f_AllocAckGrp_IndividualAllocRejCode : int option;
    (** Number of repeating AllocAccount (79)/AllocPrice (366) entries.*)
    f_AllocAckGrp_NoAllocs : int option
}
;;

(** The PositionQty component block specifies the various types of position quantity in the position life-cycle including start-of-day, intraday, trade, adjustments, and end-of-day position quantities. Quantities are expressed in terms of long and short quantities.*)
type fix_positionqty = {
    (** Long Quantity*)
    f_PositionQty_LongQty : fix_float option;
    (** Number of position entries.*)
    f_PositionQty_NoPositions : int option;
    (** Status of this position*)
    f_PositionQty_PosQtyStatus : fix_posqtystatus option;
    (** Used to identify the type of quantity that is being returned
     Required if NoPositions > 1*)
    f_PositionQty_PosType : fix_postype option;
    (** Short Quantity*)
    f_PositionQty_ShortQty : fix_float option;
    (** Optional repeating group - used to associate or distribute position to a specific party other than the party that currently owns the position.*)
    f_PositionQty_NestedParties : fix_nestedparties
}
;;

(** The PositionAmountData component block is used to report netted amounts associated with position quantities. In the listed derivatives market the amount is generally expressing a type of futures variation or option premium. In the equities market this may be the net pay or collect on a given position.*)
type fix_positionamountdata = {
    (** Number of position amount entries.
     Number of Position Amount entries*)
    f_PositionAmountData_NoPosAmt : int option;
    (** Position amount*)
    f_PositionAmountData_PosAmt : fix_float option;
    (** Type of Position amount*)
    f_PositionAmountData_PosAmtType : fix_posamttype option
}
;;

type fix_biddescreqgrp = {
    (** BidDescriptor value. Usage depends upon BidDescriptorTyp (399).
     If BidDescriptorType = 1
     Industrials etc - Free text
     If BidDescriptorType =2
     "FR" etc - ISO Country Codes
     If BidDescriptorType =3
     FT00, FT250, STOX - Free text*)
    f_BidDescReqGrp_BidDescriptor : fix_string option;
    (** Code to identify the type of BidDescriptor (400)*)
    f_BidDescReqGrp_BidDescriptorType : fix_biddescriptortype option;
    (** Eg Used in EFP trades 2% (EFP – Exchange for Physical ). Represented as a percentage.*)
    f_BidDescReqGrp_EFPTrackingError : fix_float option;
    (** Used in EFP trades*)
    f_BidDescReqGrp_FairValue : fix_float option;
    (** Number of Securites between LiquidityPctLow (402) and LiquidityPctHigh (403) in Currency.*)
    f_BidDescReqGrp_LiquidityNumSecurities : int option;
    (** Upper liquidity indicator if TotalNumSecurities (393) > . Represented as a percentage.*)
    f_BidDescReqGrp_LiquidityPctHigh : fix_float option;
    (** Liquidity indicator or lower limit if TotalNumSecurities (393) > . Represented as a percentage.*)
    f_BidDescReqGrp_LiquidityPctLow : fix_float option;
    (** Value between LiquidityPctLow (402) and LiquidityPctHigh (403) in Currency*)
    f_BidDescReqGrp_LiquidityValue : fix_float option;
    (** Number of BidDescriptor (400) entries.*)
    f_BidDescReqGrp_NoBidDescriptors : int option;
    (** Used in EFP trades. Represented as a percentage.*)
    f_BidDescReqGrp_OutsideIndexPct : fix_float option;
    (** Code to identify which "SideValue" the value refers to. SideValue and SideValue2 are used as opposed to Buy or Sell so that the basket can be quoted either way as Buy or Sell.*)
    f_BidDescReqGrp_SideValueInd : fix_sidevalueind option;
    (** Used in EFP trades*)
    f_BidDescReqGrp_ValueOfFutures : fix_float option
}
;;

type fix_bidcompreqgrp = {
    (** Account mnemonic as agreed between buy and sell sides, e.g. broker and institution or investor/intermediary and fund manager.*)
    f_BidCompReqGrp_Account : fix_string option;
    (** Used to identify the source of the Account (1) code. This is especially useful if the account is a new account that the Respondent may not have setup yet in their system.*)
    f_BidCompReqGrp_AcctIDSource : fix_acctidsource option;
    (** Unique identifier for list as assigned by institution, used to associate multiple individual orders. Uniqueness must be guaranteed within a single trading day. Firms which generate multi-day orders should consider embedding a date within the ListID field to assure uniqueness across days.*)
    f_BidCompReqGrp_ListID : fix_string option;
    (** Code to represent whether value is net (inclusive of tax) or gross*)
    f_BidCompReqGrp_NetGrossInd : fix_netgrossind option;
    (** Indicates the number of list entries.*)
    f_BidCompReqGrp_NoBidComponents : int option;
    (** Specific date of trade settlement (SettlementDate) in YYYYMMDD format.
     If present, this field overrides SettlType (63). This field is required if the value of SettlType (63) is 6 (Future) or 8 (Sellers Option). This field must be omitted if the value of SettlType (63) is 7 (When and If Issued)
     (expressed in local time at place of settlement)*)
    f_BidCompReqGrp_SettlDate : fix_localmktdate option;
    (** Indicates order settlement period. If present, SettlDate (64) overrides this field. If both SettlType (63) and SettDate (64) are omitted, the default for SettlType (63) is 0 (Regular)
     Regular is defined as the default settlement period for the particular security on the exchange of execution.
     In Fixed Income the contents of this field may influence the instrument definition if the SecurityID (48) is ambiguous. In the US an active Treasury offering may be re-opened, and for a time one CUSIP will apply to both the current and "when-issued" securities. Supplying a value of "7" clarifies the instrument description; any other value or the absence of this field should cause the respondent to default to the active issue.*)
    f_BidCompReqGrp_SettlType : fix_settltype option;
    (** Side of order*)
    f_BidCompReqGrp_Side : fix_side option;
    (** Identifier for Trading Session
     Can be used to represent a specific market trading session (e.g. "PRE-OPEN", "CROSS_2", "AFTER-HOURS", "TOSTNET", "TOSTNET2", etc).
     To specify good for session where session spans more than one calendar day, use TimeInForce = Day in conjunction with TradingSessionID.
     Values should be bi-laterally agreed to between counterparties.
     Firms may register Trading Session values on the FIX website (presently a document maintained within "ECN and Exchanges" working group section).*)
    f_BidCompReqGrp_TradingSessionID : fix_string option;
    (** Optional market assigned sub identifier for a trading session. Usage is determined by market or counterparties.
     Used by US based futures markets to identify exchange specific execution time bracket codes as required by US market regulations.*)
    f_BidCompReqGrp_TradingSessionSubID : fix_string option
}
;;

type fix_bidcomprspgrp = {
    (** ISO Country Code in field*)
    f_BidCompRspGrp_Country : fix_country option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.*)
    f_BidCompRspGrp_EncodedText : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.*)
    f_BidCompRspGrp_EncodedTextLen : int option;
    (** Used in EFP trades*)
    f_BidCompRspGrp_FairValue : fix_float option;
    (** Unique identifier for list as assigned by institution, used to associate multiple individual orders. Uniqueness must be guaranteed within a single trading day. Firms which generate multi-day orders should consider embedding a date within the ListID field to assure uniqueness across days.*)
    f_BidCompRspGrp_ListID : fix_string option;
    (** Code to represent whether value is net (inclusive of tax) or gross*)
    f_BidCompRspGrp_NetGrossInd : fix_netgrossind option;
    (** Indicates the number of list entries.*)
    f_BidCompRspGrp_NoBidComponents : int;
    (** Price per unit of quantity (e.g. per share)*)
    f_BidCompRspGrp_Price : fix_float option;
    (** Code to represent the price type*)
    f_BidCompRspGrp_PriceType : fix_pricetype option;
    (** Specific date of trade settlement (SettlementDate) in YYYYMMDD format.
     If present, this field overrides SettlType (63). This field is required if the value of SettlType (63) is 6 (Future) or 8 (Sellers Option). This field must be omitted if the value of SettlType (63) is 7 (When and If Issued)
     (expressed in local time at place of settlement)*)
    f_BidCompRspGrp_SettlDate : fix_localmktdate option;
    (** Indicates order settlement period. If present, SettlDate (64) overrides this field. If both SettlType (63) and SettDate (64) are omitted, the default for SettlType (63) is 0 (Regular)
     Regular is defined as the default settlement period for the particular security on the exchange of execution.
     In Fixed Income the contents of this field may influence the instrument definition if the SecurityID (48) is ambiguous. In the US an active Treasury offering may be re-opened, and for a time one CUSIP will apply to both the current and "when-issued" securities. Supplying a value of "7" clarifies the instrument description; any other value or the absence of this field should cause the respondent to default to the active issue.*)
    f_BidCompRspGrp_SettlType : fix_settltype option;
    (** Side of order*)
    f_BidCompRspGrp_Side : fix_side option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_BidCompRspGrp_Text : fix_string option;
    (** Identifier for Trading Session
     Can be used to represent a specific market trading session (e.g. "PRE-OPEN", "CROSS_2", "AFTER-HOURS", "TOSTNET", "TOSTNET2", etc).
     To specify good for session where session spans more than one calendar day, use TimeInForce = Day in conjunction with TradingSessionID.
     Values should be bi-laterally agreed to between counterparties.
     Firms may register Trading Session values on the FIX website (presently a document maintained within "ECN and Exchanges" working group section).*)
    f_BidCompRspGrp_TradingSessionID : fix_string option;
    (** Optional market assigned sub identifier for a trading session. Usage is determined by market or counterparties.
     Used by US based futures markets to identify exchange specific execution time bracket codes as required by US market regulations.*)
    f_BidCompRspGrp_TradingSessionSubID : fix_string option;
    f_BidCompRspGrp_CommissionData : fix_commissiondata
}
;;

type fix_execcollgrp = {
    (** Unique identifier of execution message as assigned by sell-side (broker, exchange, ECN) (will be 0 (zero) for ExecType (50) =I (Order Status)). Uniqueness must be guaranteed within a single trading day or the life of a multi-day order. Firms which accept multi-day orders should consider embedding a date within the ExecID field to assure uniqueness across days. (Prior to FIX 4.1 this field was of type int)*)
    f_ExecCollGrp_ExecID : fix_string option;
    (** No of execution repeating group entries to follow.*)
    f_ExecCollGrp_NoExecs : int option
}
;;

type fix_trdcollgrp = {
    (** Number of trades in repeating group.*)
    f_TrdCollGrp_NoTrades : int option;
    (** Secondary trade report identifier - can be used to associate an additional identifier with a trade.*)
    f_TrdCollGrp_SecondaryTradeReportID : fix_string option;
    (** Unique identifier of trade capture report*)
    f_TrdCollGrp_TradeReportID : fix_string option
}
;;

type fix_undinstrmtcollgrp = {
    (** Action proposed for an Underlying Instrument instance*)
    f_UndInstrmtCollGrp_CollAction : fix_collaction option;
    (** Number of underlying legs that make up the security.*)
    f_UndInstrmtCollGrp_NoUnderlyings : int option;
    f_UndInstrmtCollGrp_UnderlyingInstrument : fix_underlyinginstrument
}
;;

(** The TrdRegTimestamps component block is used to express timestamps for an order or trade that are required by regulatory agencies These timesteamps are used to identify the timeframes for when an order or trade is received on the floor, received and executed by the broker, etc.*)
type fix_trdregtimestamps = {
    (** Number of TrdRegTimestamp (769) entries*)
    f_TrdRegTimestamps_NoTrdRegTimestamps : int option;
    (** Traded / Regulatory timestamp value. Use to store time information required by government regulators or self regulatory organizations (such as an exchange or clearing house).
     Required if NoTrdRegTimestamps > 1*)
    f_TrdRegTimestamps_TrdRegTimestamp : fix_utctimestamp option;
    (** Text which identifies the "origin" (i.e. system which was used to generate the time stamp) for the Traded / Regulatory timestamp value.
     Optional*)
    f_TrdRegTimestamps_TrdRegTimestampOrigin : fix_string option;
    (** Traded / Regulatory timestamp type
     Note of Applicability: values are required in US futures markets by the CFTC to support computerized trade reconstruction.
     (see Volume : "Glossary" for value definitions)
     Required if NoTrdRegTimestamps > 1*)
    f_TrdRegTimestamps_TrdRegTimestampType : fix_trdregtimestamptype option
}
;;

type fix_collinqqualgrp = {
    (** Collateral inquiry qualifiers:*)
    f_CollInqQualGrp_CollInquiryQualifier : fix_collinquiryqualifier option;
    (** Number of CollInquiryQualifier entries in a repeating group.*)
    f_CollInqQualGrp_NoCollInquiryQualifier : int option
}
;;

type fix_cpctyconfgrp = {
    (** Number of repeating OrderCapacity entries.*)
    f_CpctyConfGrp_NoCapacities : int;
    (** Designates the capacity of the firm placing the order
     (as of FIX 4.3, this field replaced Rule80A (tag 47) --used in conjunction with OrderRestrictions (529) field)
     (see Volume : "Glossary" for value definitions)*)
    f_CpctyConfGrp_OrderCapacity : fix_ordercapacity;
    (** Quantity executed under a specific OrderCapacity (e.g. quantity executed as agent, quantity executed as principal)*)
    f_CpctyConfGrp_OrderCapacityQty : fix_float;
    (** Restrictions associated with an order. If more than one restriction is applicable to an order, this field can contain multiple instructions separated by space.*)
    f_CpctyConfGrp_OrderRestrictions : fix_orderrestrictions option
}
;;

(** The OrderQtyData component block contains the fields commonly used for indicating the amount or quantity of an order. Note that when this component block is marked as "required" in a message either one of these three fields must be used to identify the amount: OrderQty, CashOrderQty or OrderPercent (in the case of CIV).*)
type fix_orderqtydata = {
    (** Specifies the approximate order quantity desired in total monetary units vs. as tradeable units (e.g. number of shares). The broker or fund manager (for CIV orders) would be responsible for converting and calculating a tradeable unit (e.g. share) quantity (OrderQty (38)) based upon this amount to be used for the actual order and subsequent messages.
     One of CashOrderQty, OrderQty, or (for CIV only) OrderPercent is required. Note that unless otherwise specified, only one of CashOrderQty, OrderQty, or OrderPercent should be specified. Specifies the approximate "monetary quantity" for the order. Broker is responsible for converting and calculating OrderQty in tradeable units (e.g. shares) for subsequent messages.*)
    f_OrderQtyData_CashOrderQty : fix_float option;
    (** For CIV specifies the approximate order quantity desired. For a CIV Sale it specifies percentage of investor’s total holding to be sold. For a CIV switch/exchange it specifies percentage of investor’s cash realised from sales to be re-invested. The executing broker, intermediary or fund manager is responsible for converting and calculating OrderQty (38) in shares/units for subsequent messages.
     For CIV - Optional. One of CashOrderQty, OrderQty or (for CIV only) OrderPercent is required. Note that unless otherwise specified, only one of CashOrderQty, OrderQty, or OrderPercent should be specified.*)
    f_OrderQtyData_OrderPercent : fix_float option;
    (** Quantity ordered. This represents the number of shares for equities or par, face or nominal value for FI instruments.
     (Prior to FIX 4.2 this field was of type int)
     One of CashOrderQty, OrderQty, or (for CIV only) OrderPercent is required. Note that unless otherwise specified, only one of CashOrderQty, OrderQty, or OrderPercent should be specified.*)
    f_OrderQtyData_OrderQty : fix_float option;
    (** Specifies which direction to round For CIV – indicates whether or not the quantity of shares/units is to be rounded and in which direction where CashOrdQty (52) or (for CIV only) OrderPercent (56) are specified on an order.
     The default is for rounding to be at the discretion of the executing broker or fund manager.
     e.g. for an order specifying CashOrdQty or OrderPercent if the calculated number of shares/units was 325.76 and RoundingModulus (469) was 0 – "round down" would give 320 units, "round up" would give 330 units and "round to nearest" would give 320 units.
     For CIV - Optional*)
    f_OrderQtyData_RoundingDirection : fix_roundingdirection option;
    (** For CIV - a float value indicating the value to which rounding is required.
     i.e. 0 means round to a multiple of 0 units/shares; 0.5 means round to a multiple of 0.5 units/shares.
     The default, if RoundingDirection (468) is specified without RoundingModulus, is to round to a whole unit/share.
     For CIV - Optional*)
    f_OrderQtyData_RoundingModulus : fix_float option
}
;;

type fix_preallocgrp = {
    (** Sub-account mnemonic*)
    f_PreAllocGrp_AllocAccount : fix_string option;
    (** Used to identify the source of the AllocAccount (79) code.
     See AcctIDSource (660) for valid values.*)
    f_PreAllocGrp_AllocAcctIDSource : int option;
    (** Quantity to be allocated to specific sub-account
     (Prior to FIX 4.2 this field was of type int)*)
    f_PreAllocGrp_AllocQty : fix_float option;
    (** Currency code of settlement denomination for a specific AllocAccount (79).*)
    f_PreAllocGrp_AllocSettlCurrency : fix_currency option;
    (** Unique identifier for a specific NoAllocs (78) repeating group instance (e.g. for an AllocAccount).*)
    f_PreAllocGrp_IndividualAllocID : fix_string option;
    (** Number of repeating AllocAccount (79)/AllocPrice (366) entries.*)
    f_PreAllocGrp_NoAllocs : int option;
    f_PreAllocGrp_NestedParties : fix_nestedparties
}
;;

type fix_sidecrossordmodgrp = {
    (** Account mnemonic as agreed between buy and sell sides, e.g. broker and institution or investor/intermediary and fund manager.*)
    f_SideCrossOrdModGrp_Account : fix_string option;
    (** Type of account associated with an order*)
    f_SideCrossOrdModGrp_AccountType : fix_accounttype option;
    (** Used to identify the source of the Account (1) code. This is especially useful if the account is a new account that the Respondent may not have setup yet in their system.*)
    f_SideCrossOrdModGrp_AcctIDSource : fix_acctidsource option;
    (** Unique identifier for allocation message.
     (Prior to FIX 4.1 this field was of type int)*)
    f_SideCrossOrdModGrp_AllocID : fix_string option;
    (** Method for booking out this order. Used when notifying a broker that an order to be settled by that broker is to be booked out as an OTC derivative (e.g. CFD or similar).*)
    f_SideCrossOrdModGrp_BookingType : fix_bookingtype option;
    (** Indicates what constitutes a bookable unit.*)
    f_SideCrossOrdModGrp_BookingUnit : fix_bookingunit option;
    (** Identifies whether an order is a margin order or a non-margin order. This is primarily used when sending orders to Japanese exchanges to indicate sell margin or buy to cover. The same tag could be assigned also by buy-side to indicate the intent to sell or buy margin and the sell-side to accept or reject (base on some validation criteria) the margin request.*)
    f_SideCrossOrdModGrp_CashMargin : fix_cashmargin option;
    (** Unique identifier for Order as assigned by the buy-side (institution, broker, intermediary etc.) (identified by SenderCompID (49) or OnBehalfOfCompID (5) as appropriate). Uniqueness must be guaranteed within a single trading day. Firms, particularly those which electronically submit multi-day orders, trade globally or throughout market close periods, should ensure uniqueness across days, for example by embedding a date within the ClOrdID field.*)
    f_SideCrossOrdModGrp_ClOrdID : fix_string;
    (** Permits order originators to tie together groups of orders in which trades resulting from orders are associated for a specific purpose, for example the calculation of average execution price for a customer or to associate lists submitted to a broker as waves of a larger program trade.*)
    f_SideCrossOrdModGrp_ClOrdLinkID : fix_string option;
    (** Indicates type of fee being assessed of the customer for trade executions at an exchange. Applicable for futures markets only at this time.
     (Values source CBOT, CME, NYBOT, and NYMEX):*)
    f_SideCrossOrdModGrp_ClearingFeeIndicator : fix_clearingfeeindicator option;
    (** Used for derivative products, such as options*)
    f_SideCrossOrdModGrp_CoveredOrUncovered : fix_coveredoruncovered option;
    (** Capacity of customer placing the order
     Primarily used by futures exchanges to indicate the CTICode (customer type indicator) as required by the US CFTC (Commodity Futures Trading Commission).*)
    f_SideCrossOrdModGrp_CustOrderCapacity : fix_custordercapacity option;
    (** Indicates whether or not automatic booking can occur.*)
    f_SideCrossOrdModGrp_DayBookingInst : fix_daybookinginst option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.*)
    f_SideCrossOrdModGrp_EncodedText : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.*)
    f_SideCrossOrdModGrp_EncodedTextLen : int option;
    (** Indicates request for forex accommodation trade to be executed along with security transaction.*)
    f_SideCrossOrdModGrp_ForexReq : fix_forexreq option;
    (** Number of Side repeating group instances.*)
    f_SideCrossOrdModGrp_NoSides : fix_nosides;
    (** Designates the capacity of the firm placing the order
     (as of FIX 4.3, this field replaced Rule80A (tag 47) --used in conjunction with OrderRestrictions (529) field)
     (see Volume : "Glossary" for value definitions)*)
    f_SideCrossOrdModGrp_OrderCapacity : fix_ordercapacity option;
    (** Restrictions associated with an order. If more than one restriction is applicable to an order, this field can contain multiple instructions separated by space.*)
    f_SideCrossOrdModGrp_OrderRestrictions : fix_orderrestrictions option;
    (** Indicates whether the resulting position after a trade should be an opening position or closing position. Used for omnibus accounting - where accounts are held on a gross basis instead of being netted together.*)
    f_SideCrossOrdModGrp_PositionEffect : fix_positioneffect option;
    (** Indicates the method of preallocation.*)
    f_SideCrossOrdModGrp_PreallocMethod : fix_preallocmethod option;
    (** Type of quantity specified in a quantity field*)
    f_SideCrossOrdModGrp_QtyType : fix_qtytype option;
    (** Assigned by the party which originates the order. Can be used to provide the ClOrdID (11) used by an exchange or executing system.*)
    f_SideCrossOrdModGrp_SecondaryClOrdID : fix_string option;
    (** Currency code of settlement denomination.*)
    f_SideCrossOrdModGrp_SettlCurrency : fix_currency option;
    (** Side of order*)
    f_SideCrossOrdModGrp_Side : fix_side;
    (** ID within repeating group of sides which is used to represent this transaction for compliance purposes (e.g. OATS reporting).*)
    f_SideCrossOrdModGrp_SideComplianceID : fix_string option;
    (** Indicates whether or not the order was solicited.*)
    f_SideCrossOrdModGrp_SolicitedFlag : fix_solicitedflag option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_SideCrossOrdModGrp_Text : fix_string option;
    (** Indicates date of trade referenced in this message in YYYYMMDD format. Absence of this field indicates current day (expressed in local time at place of trade).*)
    f_SideCrossOrdModGrp_TradeDate : fix_localmktdate option;
    (** Used with Fixed Income for Muncipal New Issue Market. Agreement in principal between counter-parties prior to actual trade date.
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)
     (prior to FIX 4.4 field was of type UTCDate)*)
    f_SideCrossOrdModGrp_TradeOriginationDate : fix_localmktdate option;
    f_SideCrossOrdModGrp_CommissionData : fix_commissiondata;
    f_SideCrossOrdModGrp_OrderQtyData : fix_orderqtydata;
    f_SideCrossOrdModGrp_Parties : fix_parties;
    f_SideCrossOrdModGrp_PreAllocGrp : fix_preallocgrp
}
;;

type fix_trdgsesgrp = {
    (** Number of TradingSessionIDs (336) in repeating group.*)
    f_TrdgSesGrp_NoTradingSessions : int option;
    (** Identifier for Trading Session
     Can be used to represent a specific market trading session (e.g. "PRE-OPEN", "CROSS_2", "AFTER-HOURS", "TOSTNET", "TOSTNET2", etc).
     To specify good for session where session spans more than one calendar day, use TimeInForce = Day in conjunction with TradingSessionID.
     Values should be bi-laterally agreed to between counterparties.
     Firms may register Trading Session values on the FIX website (presently a document maintained within "ECN and Exchanges" working group section).*)
    f_TrdgSesGrp_TradingSessionID : fix_string option;
    (** Optional market assigned sub identifier for a trading session. Usage is determined by market or counterparties.
     Used by US based futures markets to identify exchange specific execution time bracket codes as required by US market regulations.*)
    f_TrdgSesGrp_TradingSessionSubID : fix_string option
}
;;

(** The Peg Instructions component block is used to tie the price of a security to a market event such as opening price, mid-price, best price. The Peg Instructions block may also be used to tie the price to the behavior of a related security.*)
type fix_peginstructions = {
    (** Type of Peg Limit
     Specifies nature of resulting pegged price (e.g. or better limit, strict limit etc)*)
    f_PegInstructions_PegLimitType : fix_peglimittype option;
    (** Describes whether peg is static or floats
     Describes whether peg is static/fixed or floats*)
    f_PegInstructions_PegMoveType : fix_pegmovetype option;
    (** Type of Peg Offset value
     Type of Peg Offset (e.g. price offset, tick offset etc)*)
    f_PegInstructions_PegOffsetType : fix_pegoffsettype option;
    (** Amount (signed) added to the peg for a pegged order in the context of the PegOffsetType (836)
     (Prior to FIX 4.4 this field was of type PriceOffset)
     Amount (signed) added to the peg for a pegged order in the context of the PegOffsetType*)
    f_PegInstructions_PegOffsetValue : fix_float option;
    (** If the calculated peg price is not a valid tick price, specifies whether to round the price to be more or less aggressive
     If the calculated peg price is not a valid tick price, specifies how to round the price (e.g. be more or less aggressive)*)
    f_PegInstructions_PegRoundDirection : fix_pegrounddirection option;
    (** The scope of the peg
     The scope of the "related to" price of the peg (e.g. local, global etc)*)
    f_PegInstructions_PegScope : fix_pegscope option
}
;;

(** The presence of DiscretionInstructions component block on an order indicates that the trader wishes to display one price but will accept trades at another price.*)
type fix_discretioninstructions = {
    (** Code to identify the price a DiscretionOffsetValue (389) is related to and should be mathematically added to
     What the discretionary price is related to (e.g. primary price, display price etc)*)
    f_DiscretionInstructions_DiscretionInst : fix_discretioninst option;
    (** Type of Discretion Limit
     Specifies the nature of the resulting discretion price (e.g. or better limit, strict limit etc)*)
    f_DiscretionInstructions_DiscretionLimitType : fix_discretionlimittype option;
    (** Describes whether discretionay price is static or floats
     Describes whether discretion price is static/fixed or floats*)
    f_DiscretionInstructions_DiscretionMoveType : fix_discretionmovetype option;
    (** Type of Discretion Offset value
     Type of Discretion Offset (e.g. price offset, tick offset etc)*)
    f_DiscretionInstructions_DiscretionOffsetType : fix_discretionoffsettype option;
    (** Amount (signed) added to the "related to" price specified via DiscretionInst (388), in the context of DiscretionOffsetType (842)
     (Prior to FIX 4.4 this field was of type PriceOffset)
     Amount (signed) added to the "related to" price specified via DiscretionInst, in the context of DiscretionOffsetType*)
    f_DiscretionInstructions_DiscretionOffsetValue : fix_float option;
    (** If the calculated discretionary price is not a valid tick price, specifies whether to round the price to be more or less aggressive
     If the calculated discretion price is not a valid tick price, specifies how to round the price (e.g. to be more or less aggressive)*)
    f_DiscretionInstructions_DiscretionRoundDirection : fix_discretionrounddirection option;
    (** The scope of the discretion
     The scope of "related to" price of the discretion (e.g. local, global etc)*)
    f_DiscretionInstructions_DiscretionScope : fix_discretionscope option
}
;;

type fix_sidecrossordcxlgrp = {
    (** Unique identifier for Order as assigned by the buy-side (institution, broker, intermediary etc.) (identified by SenderCompID (49) or OnBehalfOfCompID (5) as appropriate). Uniqueness must be guaranteed within a single trading day. Firms, particularly those which electronically submit multi-day orders, trade globally or throughout market close periods, should ensure uniqueness across days, for example by embedding a date within the ClOrdID field.*)
    f_SideCrossOrdCxlGrp_ClOrdID : fix_string;
    (** Permits order originators to tie together groups of orders in which trades resulting from orders are associated for a specific purpose, for example the calculation of average execution price for a customer or to associate lists submitted to a broker as waves of a larger program trade.*)
    f_SideCrossOrdCxlGrp_ClOrdLinkID : fix_string option;
    (** ID used to represent this transaction for compliance purposes (e.g. OATS reporting).*)
    f_SideCrossOrdCxlGrp_ComplianceID : fix_string option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.*)
    f_SideCrossOrdCxlGrp_EncodedText : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.*)
    f_SideCrossOrdCxlGrp_EncodedTextLen : int option;
    (** Number of Side repeating group instances.*)
    f_SideCrossOrdCxlGrp_NoSides : fix_nosides;
    (** ClOrdID () of the previous order (NOT the initial order of the day) as assigned by the institution, used to identify the previous order in cancel and cancel/replace requests.*)
    f_SideCrossOrdCxlGrp_OrigClOrdID : fix_string;
    (** The most recent (or current) modification TransactTime (tag 60) reported on an Execution Report for the order.
     The OrigOrdModTime is provided as an optional field on Order Cancel Request and Order Cancel Replace Requests to identify that the state of the order has not changed since the request was issued.
     This is provided to support markets similar to Eurex and A/C/E.*)
    f_SideCrossOrdCxlGrp_OrigOrdModTime : fix_utctimestamp option;
    (** Assigned by the party which originates the order. Can be used to provide the ClOrdID (11) used by an exchange or executing system.*)
    f_SideCrossOrdCxlGrp_SecondaryClOrdID : fix_string option;
    (** Side of order*)
    f_SideCrossOrdCxlGrp_Side : fix_side;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_SideCrossOrdCxlGrp_Text : fix_string option;
    (** Indicates date of trade referenced in this message in YYYYMMDD format. Absence of this field indicates current day (expressed in local time at place of trade).*)
    f_SideCrossOrdCxlGrp_TradeDate : fix_localmktdate option;
    (** Used with Fixed Income for Muncipal New Issue Market. Agreement in principal between counter-parties prior to actual trade date.
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)
     (prior to FIX 4.4 field was of type UTCDate)*)
    f_SideCrossOrdCxlGrp_TradeOriginationDate : fix_localmktdate option;
    f_SideCrossOrdCxlGrp_OrderQtyData : fix_orderqtydata;
    f_SideCrossOrdCxlGrp_Parties : fix_parties
}
;;

type fix_relsymderivsecgrp = {
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.*)
    f_RelSymDerivSecGrp_Currency : fix_currency option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.*)
    f_RelSymDerivSecGrp_EncodedText : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.*)
    f_RelSymDerivSecGrp_EncodedTextLen : int option;
    (** Part of trading cycle when an instrument expires. Field is applicable for derivatives.*)
    f_RelSymDerivSecGrp_ExpirationCycle : fix_expirationcycle option;
    (** Specifies the number of repeating symbols specified.*)
    f_RelSymDerivSecGrp_NoRelatedSym : int option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_RelSymDerivSecGrp_Text : fix_string option;
    (** Identifier for Trading Session
     Can be used to represent a specific market trading session (e.g. "PRE-OPEN", "CROSS_2", "AFTER-HOURS", "TOSTNET", "TOSTNET2", etc).
     To specify good for session where session spans more than one calendar day, use TimeInForce = Day in conjunction with TradingSessionID.
     Values should be bi-laterally agreed to between counterparties.
     Firms may register Trading Session values on the FIX website (presently a document maintained within "ECN and Exchanges" working group section).*)
    f_RelSymDerivSecGrp_TradingSessionID : fix_string option;
    (** Optional market assigned sub identifier for a trading session. Usage is determined by market or counterparties.
     Used by US based futures markets to identify exchange specific execution time bracket codes as required by US market regulations.*)
    f_RelSymDerivSecGrp_TradingSessionSubID : fix_string option;
    f_RelSymDerivSecGrp_InstrmtLegGrp : fix_instrmtleggrp;
    f_RelSymDerivSecGrp_Instrument : fix_instrument;
    f_RelSymDerivSecGrp_InstrumentExtension : fix_instrumentextension
}
;;

type fix_routinggrp = {
    (** Number of repeating groups of RoutingID (27) and RoutingType (26) values.
     See Volume 3: "Pre-Trade Message Targeting/Routing"*)
    f_RoutingGrp_NoRoutingIDs : int option;
    (** Assigned value used to identify a specific routing destination.*)
    f_RoutingGrp_RoutingID : fix_string option;
    (** Indicates the type of RoutingID (27) specified*)
    f_RoutingGrp_RoutingType : fix_routingtype option
}
;;

type fix_instrmtgrp = {
    (** Specifies the number of repeating symbols specified.*)
    f_InstrmtGrp_NoRelatedSym : int option;
    f_InstrmtGrp_Instrument : fix_instrument
}
;;

type fix_linesoftextgrp = {
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.*)
    f_LinesOfTextGrp_EncodedText : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.*)
    f_LinesOfTextGrp_EncodedTextLen : int option;
    (** Identifies number of lines of text body*)
    f_LinesOfTextGrp_NoLinesOfText : int;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_LinesOfTextGrp_Text : fix_string
}
;;

(** The LegStipulations component block has the same usage as the Stipulations component block, but for a leg instrument in a multi-legged security.*)
type fix_legstipulations = {
    (** For Fixed Income, type of Stipulation for this leg.
     See StipulationType (233) for description and valid values
     Required if NoLegStipulations >0*)
    f_LegStipulations_LegStipulationType : fix_string option;
    (** For Fixed Income, value of stipulation.
     See StipulationValue (234) for description and valid values*)
    f_LegStipulations_LegStipulationValue : fix_string option;
    (** Number of leg stipulation entries*)
    f_LegStipulations_NoLegStipulations : int option
}
;;

type fix_contragrp = {
    (** Identifies contra broker. Standard NASD market-maker mnemonic is preferred.*)
    f_ContraGrp_ContraBroker : fix_string option;
    (** Unique indicator for a specific leg for the ContraBroker (375).*)
    f_ContraGrp_ContraLegRefID : fix_string option;
    (** Quantity traded with the ContraBroker (375).*)
    f_ContraGrp_ContraTradeQty : fix_float option;
    (** Identifes the time of the trade with the ContraBroker (375). (always expressed in UTC (Universal Time Coordinated, also known as "GMT")*)
    f_ContraGrp_ContraTradeTime : fix_utctimestamp option;
    (** Identifies the trader (e.g. "badge number") of the ContraBroker.*)
    f_ContraGrp_ContraTrader : fix_string option;
    (** The number of ContraBroker (375) entries.*)
    f_ContraGrp_NoContraBrokers : int option
}
;;

type fix_contamtgrp = {
    (** Specifies currency for the Contract amount if different from the Deal Currency - see "Appendix 6-A; Valid Currency Codes".*)
    f_ContAmtGrp_ContAmtCurr : fix_currency option;
    (** Type of ContAmtValue (520).
     NOTE That Commission Amount / % in Contract Amounts is the commission actually charged, rather than the commission instructions given in Fields 2/3.*)
    f_ContAmtGrp_ContAmtType : fix_contamttype option;
    (** Value of Contract Amount, e.g. a financial amount or percentage as indicated by ContAmtType (59).*)
    f_ContAmtGrp_ContAmtValue : fix_float option;
    (** The number of Contract Amount details on an Execution Report message*)
    f_ContAmtGrp_NoContAmts : int option
}
;;

type fix_instrmtlegexecgrp = {
    (** CoveredOrUncovered for leg of a multileg
     See CoveredOrUncovered (203) field for description*)
    f_InstrmtLegExecGrp_LegCoveredOrUncovered : int option;
    (** Execution price assigned to a leg of a multileg instrument.
     See LastPx (31) field for description and values*)
    f_InstrmtLegExecGrp_LegLastPx : fix_float option;
    (** PositionEffect for leg of a multileg
     See PositionEffect (77) field for description*)
    f_InstrmtLegExecGrp_LegPositionEffect : int option;
    (** Price for leg of a multileg
     See Price (44) field for description*)
    f_InstrmtLegExecGrp_LegPrice : fix_float option;
    (** Quantity of this leg, e.g. in Quote dialog.
     See Quantity (53) for description and valid values*)
    f_InstrmtLegExecGrp_LegQty : fix_float option;
    (** Unique indicator for a specific leg.*)
    f_InstrmtLegExecGrp_LegRefID : fix_string option;
    (** Refer to description for SettlDate[64]*)
    f_InstrmtLegExecGrp_LegSettlDate : fix_localmktdate option;
    (** Refer to values for SettlType[63]*)
    f_InstrmtLegExecGrp_LegSettlType : int option;
    (** For Fixed Income, used instead of LegQty (687) or LegOrderQty (685) to requests the respondent to calculate the quantity based on the quantity on the opposite side of the swap.*)
    f_InstrmtLegExecGrp_LegSwapType : fix_legswaptype option;
    (** Number of InstrumentLeg repeating group instances.*)
    f_InstrmtLegExecGrp_NoLegs : int option;
    f_InstrmtLegExecGrp_InstrumentLeg : fix_instrumentleg;
    f_InstrmtLegExecGrp_LegStipulations : fix_legstipulations;
    f_InstrmtLegExecGrp_NestedParties : fix_nestedparties
}
;;

type fix_instrmtlegioigrp = {
    (** Leg-specific IOI quantity.
     See IOIQty (27) for description and valid values*)
    f_InstrmtLegIOIGrp_LegIOIQty : fix_string option;
    (** Number of InstrumentLeg repeating group instances.*)
    f_InstrmtLegIOIGrp_NoLegs : int option;
    f_InstrmtLegIOIGrp_InstrumentLeg : fix_instrumentleg;
    f_InstrmtLegIOIGrp_LegStipulations : fix_legstipulations
}
;;

type fix_ioiqualgrp = {
    (** Code to qualify IOI use*)
    f_IOIQualGrp_IOIQualifier : fix_ioiqualifier option;
    (** Number of repeating groups of IOIQualifiers (04).*)
    f_IOIQualGrp_NoIOIQualifiers : int option
}
;;

type fix_ordliststatgrp = {
    (** Calculated average price of all fills on this order.
     For Fixed Income trades AvgPx is always expressed as percent-of-par, regardless of the PriceType (423) of LastPx (3). I.e., AvgPx will contain an average of percent-of-par values (see LastParPx (669)) for issues traded in Yield, Spread or Discount.*)
    f_OrdListStatGrp_AvgPx : fix_float;
    (** Unique identifier for Order as assigned by the buy-side (institution, broker, intermediary etc.) (identified by SenderCompID (49) or OnBehalfOfCompID (5) as appropriate). Uniqueness must be guaranteed within a single trading day. Firms, particularly those which electronically submit multi-day orders, trade globally or throughout market close periods, should ensure uniqueness across days, for example by embedding a date within the ClOrdID field.*)
    f_OrdListStatGrp_ClOrdID : fix_string;
    (** Total quantity (e.g. number of shares) filled.
     (Prior to FIX 4.2 this field was of type int)*)
    f_OrdListStatGrp_CumQty : fix_float;
    (** Total quantity canceled for this order.
     (Prior to FIX 4.2 this field was of type int)*)
    f_OrdListStatGrp_CxlQty : fix_float;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.*)
    f_OrdListStatGrp_EncodedText : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.*)
    f_OrdListStatGrp_EncodedTextLen : int option;
    (** Quantity open for further execution. If the OrdStatus (39) is Canceled, DoneForTheDay, Expired, Calculated, or Rejected (in which case the order is no longer active) then LeavesQty could be 0, otherwise LeavesQty = OrderQty (38) – CumQty (4).
     (Prior to FIX 4.2 this field was of type int)*)
    f_OrdListStatGrp_LeavesQty : fix_float;
    (** Indicates number of orders to be combined for average pricing and allocation.*)
    f_OrdListStatGrp_NoOrders : int;
    (** Code to identify reason for order rejection.*)
    f_OrdListStatGrp_OrdRejReason : fix_ordrejreason option;
    (** Identifies current status of order.
     *** SOME VALUES HAVE BEEN REPLACED - See "Replaced Features and Supported Approach" ***
     (see Volume : "Glossary" for value definitions)*)
    f_OrdListStatGrp_OrdStatus : fix_ordstatus;
    (** Assigned by the party which originates the order. Can be used to provide the ClOrdID (11) used by an exchange or executing system.*)
    f_OrdListStatGrp_SecondaryClOrdID : fix_string option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_OrdListStatGrp_Text : fix_string option;
    (** Indicates if the order is currently being worked. Applicable only for OrdStatus = "New". For open outcry markets this indicates that the order is being worked in the crowd. For electronic markets it indicates that the order has transitioned from a contingent order to a market order.*)
    f_OrdListStatGrp_WorkingIndicator : fix_workingindicator option
}
;;

type fix_instrmtstrkpxgrp = {
    (** Number of list strike price entries.*)
    f_InstrmtStrkPxGrp_NoStrikes : int;
    f_InstrmtStrkPxGrp_Instrument : fix_instrument
}
;;

type fix_undinstrmtstrkpxgrp = {
    (** Unique identifier for Order as assigned by the buy-side (institution, broker, intermediary etc.) (identified by SenderCompID (49) or OnBehalfOfCompID (5) as appropriate). Uniqueness must be guaranteed within a single trading day. Firms, particularly those which electronically submit multi-day orders, trade globally or throughout market close periods, should ensure uniqueness across days, for example by embedding a date within the ClOrdID field.*)
    f_UndInstrmtStrkPxGrp_ClOrdID : fix_string option;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.*)
    f_UndInstrmtStrkPxGrp_Currency : fix_currency option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.*)
    f_UndInstrmtStrkPxGrp_EncodedText : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.*)
    f_UndInstrmtStrkPxGrp_EncodedTextLen : int option;
    (** Number of underlying legs that make up the security.*)
    f_UndInstrmtStrkPxGrp_NoUnderlyings : int option;
    (** Previous closing price of security.*)
    f_UndInstrmtStrkPxGrp_PrevClosePx : fix_float option;
    (** Price per unit of quantity (e.g. per share)*)
    f_UndInstrmtStrkPxGrp_Price : fix_float;
    (** Assigned by the party which originates the order. Can be used to provide the ClOrdID (11) used by an exchange or executing system.*)
    f_UndInstrmtStrkPxGrp_SecondaryClOrdID : fix_string option;
    (** Side of order*)
    f_UndInstrmtStrkPxGrp_Side : fix_side option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_UndInstrmtStrkPxGrp_Text : fix_string option;
    f_UndInstrmtStrkPxGrp_UnderlyingInstrument : fix_underlyinginstrument
}
;;

type fix_mdincgrp = {
    (** Identifies the type of Corporate Action*)
    f_MDIncGrp_CorporateAction : fix_corporateaction option;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.*)
    f_MDIncGrp_Currency : fix_currency option;
    (** Reason for deletion*)
    f_MDIncGrp_DeleteReason : fix_deletereason option;
    (** Identification of a Market Maker’s desk*)
    f_MDIncGrp_DeskID : fix_string option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.*)
    f_MDIncGrp_EncodedText : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.*)
    f_MDIncGrp_EncodedTextLen : int option;
    (** Instructions for order handling on exchange trading floor. If more than one instruction is applicable to an order, this field can contain multiple instructions separated by space.*)
    f_MDIncGrp_ExecInst : fix_execinst option;
    (** Date of order expiration (last day the order can trade), always expressed in terms of the local market date. The time at which the order expires is determined by the local market’s business practices*)
    f_MDIncGrp_ExpireDate : fix_localmktdate option;
    (** Time/Date of order expiration (always expressed in UTC (Universal Time Coordinated, also known as "GMT")
     The meaning of expiration is specific to the context where the field is used.
     For orders, this is the expiration time of a Good Til Date TimeInForce.
     For Quotes - this is the expiration of the quote.
     Expiration time is provided across the quote message dialog to control the length of time of the overall quoting process.
     For collateral requests, this is the time by which collateral must be assigned.
     For collateral assignments, this is the time by which a response to the assignment is expected.*)
    f_MDIncGrp_ExpireTime : fix_utctimestamp option;
    (** Identifies a firm’s financial status*)
    f_MDIncGrp_FinancialStatus : fix_financialstatus option;
    (** Identification of a Market Maker’s location*)
    f_MDIncGrp_LocationID : fix_string option;
    (** Buying party in a trade*)
    f_MDIncGrp_MDEntryBuyer : fix_string option;
    (** Date of Market Data Entry.
     (prior to FIX 4.4 field was of type UTCDate)*)
    f_MDIncGrp_MDEntryDate : fix_utcdateonly option;
    (** Unique Market Data Entry identifier.*)
    f_MDIncGrp_MDEntryID : fix_string option;
    (** Originator of a Market Data Entry*)
    f_MDIncGrp_MDEntryOriginator : fix_string option;
    (** Display position of a bid or offer, numbered from most competitive to least competitive, per market side, beginning with .*)
    f_MDIncGrp_MDEntryPositionNo : int option;
    (** Price of the Market Data Entry.*)
    f_MDIncGrp_MDEntryPx : fix_float option;
    (** Refers to a previous MDEntryID (278).*)
    f_MDIncGrp_MDEntryRefID : fix_string option;
    (** Selling party in a trade*)
    f_MDIncGrp_MDEntrySeller : fix_string option;
    (** Quantity or volume represented by the Market Data Entry.*)
    f_MDIncGrp_MDEntrySize : fix_float option;
    (** Time of Market Data Entry.*)
    f_MDIncGrp_MDEntryTime : fix_utctimeonly option;
    (** Type Market Data entry*)
    f_MDIncGrp_MDEntryType : fix_mdentrytype option;
    (** Market posting quote / trade.
     Valid values:
     See "Appendix 6-C"*)
    f_MDIncGrp_MDMkt : fix_exchange option;
    (** Type of Market Data update action*)
    f_MDIncGrp_MDUpdateAction : fix_mdupdateaction;
    (** Minimum quantity of an order to be executed.
     (Prior to FIX 4.2 this field was of type int)*)
    f_MDIncGrp_MinQty : fix_float option;
    (** Net change from previous day’s closing price vs. last traded price.*)
    f_MDIncGrp_NetChgPrevDay : fix_float option;
    (** Number of entries in Market Data message.*)
    f_MDIncGrp_NoMDEntries : int;
    (** Number of orders in the market.*)
    f_MDIncGrp_NumberOfOrders : int option;
    (** Flag that identifies a market data entry
     (Prior to FIX 4.3 this field was of type char)*)
    f_MDIncGrp_OpenCloseSettlFlag : fix_openclosesettlflag option;
    (** Unique identifier for Order as assigned by sell-side (broker, exchange, ECN). Uniqueness must be guaranteed within a single trading day. Firms which accept multi-day orders should consider embedding a date within the OrderID field to assure uniqueness across days.*)
    f_MDIncGrp_OrderID : fix_string option;
    (** Delta calculated from theoretical price*)
    f_MDIncGrp_PriceDelta : fix_float option;
    (** Space-delimited list of conditions describing a quote*)
    f_MDIncGrp_QuoteCondition : fix_quotecondition option;
    (** Uniquely identifies the quote as part of a QuoteSet.*)
    f_MDIncGrp_QuoteEntryID : fix_string option;
    (** Defines the scope of a data element*)
    f_MDIncGrp_Scope : fix_scope option;
    (** Specifies the number of days that may elapse before delivery of the security*)
    f_MDIncGrp_SellerDays : int option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_MDIncGrp_Text : fix_string option;
    (** Direction of the "tick"*)
    f_MDIncGrp_TickDirection : fix_tickdirection option;
    (** Specifies how long the order remains in effect. Absence of this field is interpreted as DAY.*)
    f_MDIncGrp_TimeInForce : fix_timeinforce option;
    (** Space-delimited list of conditions describing a trade*)
    f_MDIncGrp_TradeCondition : fix_tradecondition option;
    (** Identifier for Trading Session
     Can be used to represent a specific market trading session (e.g. "PRE-OPEN", "CROSS_2", "AFTER-HOURS", "TOSTNET", "TOSTNET2", etc).
     To specify good for session where session spans more than one calendar day, use TimeInForce = Day in conjunction with TradingSessionID.
     Values should be bi-laterally agreed to between counterparties.
     Firms may register Trading Session values on the FIX website (presently a document maintained within "ECN and Exchanges" working group section).*)
    f_MDIncGrp_TradingSessionID : fix_string option;
    (** Optional market assigned sub identifier for a trading session. Usage is determined by market or counterparties.
     Used by US based futures markets to identify exchange specific execution time bracket codes as required by US market regulations.*)
    f_MDIncGrp_TradingSessionSubID : fix_string option;
    f_MDIncGrp_InstrmtLegGrp : fix_instrmtleggrp;
    f_MDIncGrp_Instrument : fix_instrument;
    f_MDIncGrp_UndInstrmtGrp : fix_undinstrmtgrp
}
;;

type fix_mdreqgrp = {
    (** Type Market Data entry*)
    f_MDReqGrp_MDEntryType : fix_mdentrytype;
    (** Number of MDEntryType (269) fields requested.*)
    f_MDReqGrp_NoMDEntryTypes : int
}
;;

type fix_instrmtmdreqgrp = {
    (** Specifies the number of repeating symbols specified.*)
    f_InstrmtMDReqGrp_NoRelatedSym : int;
    f_InstrmtMDReqGrp_InstrmtLegGrp : fix_instrmtleggrp;
    f_InstrmtMDReqGrp_Instrument : fix_instrument;
    f_InstrmtMDReqGrp_UndInstrmtGrp : fix_undinstrmtgrp
}
;;

type fix_mdrjctgrp = {
    (** Session layer source for market data
     (For the standard FIX session layer, this would be the TargetCompID (56) where market data can be obtained).*)
    f_MDRjctGrp_AltMDSourceID : fix_string option;
    (** Number of alternative market data sources*)
    f_MDRjctGrp_NoAltMDSource : int option
}
;;

type fix_mdfullgrp = {
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.*)
    f_MDFullGrp_Currency : fix_currency option;
    (** Identification of a Market Maker’s desk*)
    f_MDFullGrp_DeskID : fix_string option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.*)
    f_MDFullGrp_EncodedText : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.*)
    f_MDFullGrp_EncodedTextLen : int option;
    (** Instructions for order handling on exchange trading floor. If more than one instruction is applicable to an order, this field can contain multiple instructions separated by space.*)
    f_MDFullGrp_ExecInst : fix_execinst option;
    (** Date of order expiration (last day the order can trade), always expressed in terms of the local market date. The time at which the order expires is determined by the local market’s business practices*)
    f_MDFullGrp_ExpireDate : fix_localmktdate option;
    (** Time/Date of order expiration (always expressed in UTC (Universal Time Coordinated, also known as "GMT")
     The meaning of expiration is specific to the context where the field is used.
     For orders, this is the expiration time of a Good Til Date TimeInForce.
     For Quotes - this is the expiration of the quote.
     Expiration time is provided across the quote message dialog to control the length of time of the overall quoting process.
     For collateral requests, this is the time by which collateral must be assigned.
     For collateral assignments, this is the time by which a response to the assignment is expected.*)
    f_MDFullGrp_ExpireTime : fix_utctimestamp option;
    (** Identification of a Market Maker’s location*)
    f_MDFullGrp_LocationID : fix_string option;
    (** Buying party in a trade*)
    f_MDFullGrp_MDEntryBuyer : fix_string option;
    (** Date of Market Data Entry.
     (prior to FIX 4.4 field was of type UTCDate)*)
    f_MDFullGrp_MDEntryDate : fix_utcdateonly option;
    (** Originator of a Market Data Entry*)
    f_MDFullGrp_MDEntryOriginator : fix_string option;
    (** Display position of a bid or offer, numbered from most competitive to least competitive, per market side, beginning with .*)
    f_MDFullGrp_MDEntryPositionNo : int option;
    (** Price of the Market Data Entry.*)
    f_MDFullGrp_MDEntryPx : fix_float option;
    (** Selling party in a trade*)
    f_MDFullGrp_MDEntrySeller : fix_string option;
    (** Quantity or volume represented by the Market Data Entry.*)
    f_MDFullGrp_MDEntrySize : fix_float option;
    (** Time of Market Data Entry.*)
    f_MDFullGrp_MDEntryTime : fix_utctimeonly option;
    (** Type Market Data entry*)
    f_MDFullGrp_MDEntryType : fix_mdentrytype;
    (** Market posting quote / trade.
     Valid values:
     See "Appendix 6-C"*)
    f_MDFullGrp_MDMkt : fix_exchange option;
    (** Minimum quantity of an order to be executed.
     (Prior to FIX 4.2 this field was of type int)*)
    f_MDFullGrp_MinQty : fix_float option;
    (** Number of entries in Market Data message.*)
    f_MDFullGrp_NoMDEntries : int;
    (** Number of orders in the market.*)
    f_MDFullGrp_NumberOfOrders : int option;
    (** Flag that identifies a market data entry
     (Prior to FIX 4.3 this field was of type char)*)
    f_MDFullGrp_OpenCloseSettlFlag : fix_openclosesettlflag option;
    (** Unique identifier for Order as assigned by sell-side (broker, exchange, ECN). Uniqueness must be guaranteed within a single trading day. Firms which accept multi-day orders should consider embedding a date within the OrderID field to assure uniqueness across days.*)
    f_MDFullGrp_OrderID : fix_string option;
    (** Delta calculated from theoretical price*)
    f_MDFullGrp_PriceDelta : fix_float option;
    (** Space-delimited list of conditions describing a quote*)
    f_MDFullGrp_QuoteCondition : fix_quotecondition option;
    (** Uniquely identifies the quote as part of a QuoteSet.*)
    f_MDFullGrp_QuoteEntryID : fix_string option;
    (** Defines the scope of a data element*)
    f_MDFullGrp_Scope : fix_scope option;
    (** Specifies the number of days that may elapse before delivery of the security*)
    f_MDFullGrp_SellerDays : int option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_MDFullGrp_Text : fix_string option;
    (** Direction of the "tick"*)
    f_MDFullGrp_TickDirection : fix_tickdirection option;
    (** Specifies how long the order remains in effect. Absence of this field is interpreted as DAY.*)
    f_MDFullGrp_TimeInForce : fix_timeinforce option;
    (** Space-delimited list of conditions describing a trade*)
    f_MDFullGrp_TradeCondition : fix_tradecondition option;
    (** Identifier for Trading Session
     Can be used to represent a specific market trading session (e.g. "PRE-OPEN", "CROSS_2", "AFTER-HOURS", "TOSTNET", "TOSTNET2", etc).
     To specify good for session where session spans more than one calendar day, use TimeInForce = Day in conjunction with TradingSessionID.
     Values should be bi-laterally agreed to between counterparties.
     Firms may register Trading Session values on the FIX website (presently a document maintained within "ECN and Exchanges" working group section).*)
    f_MDFullGrp_TradingSessionID : fix_string option;
    (** Optional market assigned sub identifier for a trading session. Usage is determined by market or counterparties.
     Used by US based futures markets to identify exchange specific execution time bracket codes as required by US market regulations.*)
    f_MDFullGrp_TradingSessionSubID : fix_string option
}
;;

type fix_quotentrygrp = {
    (** Bid F/X forward points added to spot rate. May be a negative value.*)
    f_QuotEntryGrp_BidForwardPoints : fix_float option;
    (** Bid F/X forward points of the future portion of a F/X swap quote added to spot rate. May be a negative value.*)
    f_QuotEntryGrp_BidForwardPoints2 : fix_float option;
    (** Bid price/rate*)
    f_QuotEntryGrp_BidPx : fix_float option;
    (** Quantity of bid
     (Prior to FIX 4.2 this field was of type int)*)
    f_QuotEntryGrp_BidSize : fix_float option;
    (** Bid F/X spot rate.*)
    f_QuotEntryGrp_BidSpotRate : fix_float option;
    (** Bid yield*)
    f_QuotEntryGrp_BidYield : fix_float option;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.*)
    f_QuotEntryGrp_Currency : fix_currency option;
    (** Mid price/rate*)
    f_QuotEntryGrp_MidPx : fix_float option;
    (** Mid yield*)
    f_QuotEntryGrp_MidYield : fix_float option;
    (** The number of quote entries for a QuoteSet.*)
    f_QuotEntryGrp_NoQuoteEntries : int;
    (** Offer F/X forward points added to spot rate. May be a negative value.*)
    f_QuotEntryGrp_OfferForwardPoints : fix_float option;
    (** Offer F/X forward points of the future portion of a F/X swap quote added to spot rate. May be a negative value.*)
    f_QuotEntryGrp_OfferForwardPoints2 : fix_float option;
    (** Offer price/rate*)
    f_QuotEntryGrp_OfferPx : fix_float option;
    (** Quantity of offer
     (Prior to FIX 4.2 this field was of type int)*)
    f_QuotEntryGrp_OfferSize : fix_float option;
    (** Offer F/X spot rate.*)
    f_QuotEntryGrp_OfferSpotRate : fix_float option;
    (** Offer yield*)
    f_QuotEntryGrp_OfferYield : fix_float option;
    (** Order type
     *** SOME VALUES ARE NO LONGER USED - See "Deprecated (Phased-out) Features and Supported Approach" ***
     (see Volume : "Glossary" for value definitions)*)
    f_QuotEntryGrp_OrdType : fix_ordtype option;
    (** OrderQty (38) of the future part of a F/X swap order.*)
    f_QuotEntryGrp_OrderQty2 : fix_float option;
    (** Uniquely identifies the quote as part of a QuoteSet.*)
    f_QuotEntryGrp_QuoteEntryID : fix_string;
    (** Specific date of trade settlement (SettlementDate) in YYYYMMDD format.
     If present, this field overrides SettlType (63). This field is required if the value of SettlType (63) is 6 (Future) or 8 (Sellers Option). This field must be omitted if the value of SettlType (63) is 7 (When and If Issued)
     (expressed in local time at place of settlement)*)
    f_QuotEntryGrp_SettlDate : fix_localmktdate option;
    (** SettDate (64) of the future part of a F/X swap order.*)
    f_QuotEntryGrp_SettlDate2 : fix_localmktdate option;
    (** Identifier for Trading Session
     Can be used to represent a specific market trading session (e.g. "PRE-OPEN", "CROSS_2", "AFTER-HOURS", "TOSTNET", "TOSTNET2", etc).
     To specify good for session where session spans more than one calendar day, use TimeInForce = Day in conjunction with TradingSessionID.
     Values should be bi-laterally agreed to between counterparties.
     Firms may register Trading Session values on the FIX website (presently a document maintained within "ECN and Exchanges" working group section).*)
    f_QuotEntryGrp_TradingSessionID : fix_string option;
    (** Optional market assigned sub identifier for a trading session. Usage is determined by market or counterparties.
     Used by US based futures markets to identify exchange specific execution time bracket codes as required by US market regulations.*)
    f_QuotEntryGrp_TradingSessionSubID : fix_string option;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")*)
    f_QuotEntryGrp_TransactTime : fix_utctimestamp option;
    (** Indicates expiration time of indication message (always expressed in UTC (Universal Time Coordinated, also known as "GMT")*)
    f_QuotEntryGrp_ValidUntilTime : fix_utctimestamp option;
    f_QuotEntryGrp_InstrmtLegGrp : fix_instrmtleggrp;
    f_QuotEntryGrp_Instrument : fix_instrument
}
;;

type fix_quotsetgrp = {
    (** Indicates whether this message is the last in a sequence of messages for those messages that support fragmentation, such as Allocation Instruction, Mass Quote, Security List, Derivative Security List*)
    f_QuotSetGrp_LastFragment : fix_lastfragment option;
    (** The number of sets of quotes in the message.*)
    f_QuotSetGrp_NoQuoteSets : int;
    (** Unique id for the Quote Set.*)
    f_QuotSetGrp_QuoteSetID : fix_string;
    (** Indicates expiration time of this particular QuoteSet (always expressed in UTC (Universal Time Coordinated, also known as "GMT")*)
    f_QuotSetGrp_QuoteSetValidUntilTime : fix_utctimestamp option;
    (** Total number of quotes for the quote set across all messages. Should be the sum of all NoQuoteEntries (295) in each message that has repeating quotes that are part of the same quote set.
     (Prior to FIX 4.4 this field was named TotQuoteEntries)*)
    f_QuotSetGrp_TotNoQuoteEntries : int;
    f_QuotSetGrp_QuotEntryGrp : fix_quotentrygrp;
    f_QuotSetGrp_UnderlyingInstrument : fix_underlyinginstrument
}
;;

type fix_quotentryackgrp = {
    (** Bid F/X forward points added to spot rate. May be a negative value.*)
    f_QuotEntryAckGrp_BidForwardPoints : fix_float option;
    (** Bid F/X forward points of the future portion of a F/X swap quote added to spot rate. May be a negative value.*)
    f_QuotEntryAckGrp_BidForwardPoints2 : fix_float option;
    (** Bid price/rate*)
    f_QuotEntryAckGrp_BidPx : fix_float option;
    (** Quantity of bid
     (Prior to FIX 4.2 this field was of type int)*)
    f_QuotEntryAckGrp_BidSize : fix_float option;
    (** Bid F/X spot rate.*)
    f_QuotEntryAckGrp_BidSpotRate : fix_float option;
    (** Bid yield*)
    f_QuotEntryAckGrp_BidYield : fix_float option;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.*)
    f_QuotEntryAckGrp_Currency : fix_currency option;
    (** Mid price/rate*)
    f_QuotEntryAckGrp_MidPx : fix_float option;
    (** Mid yield*)
    f_QuotEntryAckGrp_MidYield : fix_float option;
    (** The number of quote entries for a QuoteSet.*)
    f_QuotEntryAckGrp_NoQuoteEntries : int option;
    (** Offer F/X forward points added to spot rate. May be a negative value.*)
    f_QuotEntryAckGrp_OfferForwardPoints : fix_float option;
    (** Offer F/X forward points of the future portion of a F/X swap quote added to spot rate. May be a negative value.*)
    f_QuotEntryAckGrp_OfferForwardPoints2 : fix_float option;
    (** Offer price/rate*)
    f_QuotEntryAckGrp_OfferPx : fix_float option;
    (** Quantity of offer
     (Prior to FIX 4.2 this field was of type int)*)
    f_QuotEntryAckGrp_OfferSize : fix_float option;
    (** Offer F/X spot rate.*)
    f_QuotEntryAckGrp_OfferSpotRate : fix_float option;
    (** Offer yield*)
    f_QuotEntryAckGrp_OfferYield : fix_float option;
    (** Order type
     *** SOME VALUES ARE NO LONGER USED - See "Deprecated (Phased-out) Features and Supported Approach" ***
     (see Volume : "Glossary" for value definitions)*)
    f_QuotEntryAckGrp_OrdType : fix_ordtype option;
    (** OrderQty (38) of the future part of a F/X swap order.*)
    f_QuotEntryAckGrp_OrderQty2 : fix_float option;
    (** Uniquely identifies the quote as part of a QuoteSet.*)
    f_QuotEntryAckGrp_QuoteEntryID : fix_string option;
    (** Reason Quote Entry was rejected*)
    f_QuotEntryAckGrp_QuoteEntryRejectReason : int option;
    (** Specific date of trade settlement (SettlementDate) in YYYYMMDD format.
     If present, this field overrides SettlType (63). This field is required if the value of SettlType (63) is 6 (Future) or 8 (Sellers Option). This field must be omitted if the value of SettlType (63) is 7 (When and If Issued)
     (expressed in local time at place of settlement)*)
    f_QuotEntryAckGrp_SettlDate : fix_localmktdate option;
    (** SettDate (64) of the future part of a F/X swap order.*)
    f_QuotEntryAckGrp_SettlDate2 : fix_localmktdate option;
    (** Identifier for Trading Session
     Can be used to represent a specific market trading session (e.g. "PRE-OPEN", "CROSS_2", "AFTER-HOURS", "TOSTNET", "TOSTNET2", etc).
     To specify good for session where session spans more than one calendar day, use TimeInForce = Day in conjunction with TradingSessionID.
     Values should be bi-laterally agreed to between counterparties.
     Firms may register Trading Session values on the FIX website (presently a document maintained within "ECN and Exchanges" working group section).*)
    f_QuotEntryAckGrp_TradingSessionID : fix_string option;
    (** Optional market assigned sub identifier for a trading session. Usage is determined by market or counterparties.
     Used by US based futures markets to identify exchange specific execution time bracket codes as required by US market regulations.*)
    f_QuotEntryAckGrp_TradingSessionSubID : fix_string option;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")*)
    f_QuotEntryAckGrp_TransactTime : fix_utctimestamp option;
    (** Indicates expiration time of indication message (always expressed in UTC (Universal Time Coordinated, also known as "GMT")*)
    f_QuotEntryAckGrp_ValidUntilTime : fix_utctimestamp option;
    f_QuotEntryAckGrp_InstrmtLegGrp : fix_instrmtleggrp;
    f_QuotEntryAckGrp_Instrument : fix_instrument
}
;;

type fix_quotsetackgrp = {
    (** Indicates whether this message is the last in a sequence of messages for those messages that support fragmentation, such as Allocation Instruction, Mass Quote, Security List, Derivative Security List*)
    f_QuotSetAckGrp_LastFragment : fix_lastfragment option;
    (** The number of sets of quotes in the message.*)
    f_QuotSetAckGrp_NoQuoteSets : int option;
    (** Unique id for the Quote Set.*)
    f_QuotSetAckGrp_QuoteSetID : fix_string option;
    (** Total number of quotes for the quote set across all messages. Should be the sum of all NoQuoteEntries (295) in each message that has repeating quotes that are part of the same quote set.
     (Prior to FIX 4.4 this field was named TotQuoteEntries)*)
    f_QuotSetAckGrp_TotNoQuoteEntries : int option;
    f_QuotSetAckGrp_QuotEntryAckGrp : fix_quotentryackgrp;
    f_QuotSetAckGrp_UnderlyingInstrument : fix_underlyinginstrument
}
;;

type fix_nstdptys3subgrp = {
    (** PartySubID value within a "third instance" Nested repeating group.
     Same values as PartySubID (523)*)
    f_NstdPtys3SubGrp_Nested3PartySubID : fix_string option;
    (** PartySubIDType value within a "third instance" Nested repeating group.
     Same values as PartySubIDType (803)*)
    f_NstdPtys3SubGrp_Nested3PartySubIDType : int option;
    (** Number of Nested3PartySubIDs (953) entries*)
    f_NstdPtys3SubGrp_NoNested3PartySubIDs : int option
}
;;

(** The NestedParties3 component block is identical to the Parties Block. It is used in other component blocks and repeating groups when nesting will take place resulting in multiple occurrences of the Parties block within a single FIX message.. Use of NestedParties3 under these conditions avoids multiple references to the Parties block within the same message which is not allowed in FIX tag/value syntax.*)
type fix_nestedparties3 = {
    (** PartyID value within a "third instance" Nested repeating group.
     Same values as PartyID (448)
     Used to identify source of Nested3PartyID. Required if Nested3PartyIDSource is specified. Required if NoNested3PartyIDs > 0.*)
    f_NestedParties3_Nested3PartyID : fix_string option;
    (** PartyIDSource value within a "third instance" Nested repeating group.
     Same values as PartyIDSource (447)
     Used to identify class source of Nested3PartyID value (e.g. BIC). Required if Nested3PartyID is specified. Required if NoNested3PartyIDs > 0.*)
    f_NestedParties3_Nested3PartyIDSource : int option;
    (** PartyRole value within a "third instance" Nested repeating group.
     Same values as PartyRole (452)
     Identifies the type of Nested3PartyID (e.g. Executing Broker). Required if NoNested3PartyIDs > 0.*)
    f_NestedParties3_Nested3PartyRole : int option;
    (** Number of Nested3PartyID (949), Nested3PartyIDSource (950), and Nested3PartyRole (95) entries
     Repeating group below should contain unique combinations of Nested3PartyID, Nested3PartyIDSource, and Nested3PartyRole*)
    f_NestedParties3_NoNested3PartyIDs : int option;
    (** Repeating group of Nested3Party sub-identifiers.*)
    f_NestedParties3_NstdPtys3SubGrp : fix_nstdptys3subgrp
}
;;

type fix_legpreallocgrp = {
    (** Allocation Account for the leg
     See AllocAccount (79) for description and valid values.*)
    f_LegPreAllocGrp_LegAllocAccount : fix_string option;
    (** The source of the LegAllocAccount (67)
     See AllocAcctIDSource (66) for description and valid values.*)
    f_LegPreAllocGrp_LegAllocAcctIDSource : fix_string option;
    (** Leg allocation quantity.
     See AllocQty (80) for description and valid values.*)
    f_LegPreAllocGrp_LegAllocQty : fix_float option;
    (** Reference for the individual allocation ticket
     See IndividualAllocID (467) for description and valid values.*)
    f_LegPreAllocGrp_LegIndividualAllocID : fix_string option;
    (** Identifies settlement currency for the Leg.
     See SettlCurrency (20) for description and valid values*)
    f_LegPreAllocGrp_LegSettlCurrency : fix_currency option;
    (** Number of Allocations for the leg*)
    f_LegPreAllocGrp_NoLegAllocs : int option;
    f_LegPreAllocGrp_NestedParties2 : fix_nestedparties2
}
;;

type fix_preallocmleggrp = {
    (** Sub-account mnemonic*)
    f_PreAllocMlegGrp_AllocAccount : fix_string option;
    (** Used to identify the source of the AllocAccount (79) code.
     See AcctIDSource (660) for valid values.*)
    f_PreAllocMlegGrp_AllocAcctIDSource : int option;
    (** Quantity to be allocated to specific sub-account
     (Prior to FIX 4.2 this field was of type int)*)
    f_PreAllocMlegGrp_AllocQty : fix_float option;
    (** Currency code of settlement denomination for a specific AllocAccount (79).*)
    f_PreAllocMlegGrp_AllocSettlCurrency : fix_currency option;
    (** Unique identifier for a specific NoAllocs (78) repeating group instance (e.g. for an AllocAccount).*)
    f_PreAllocMlegGrp_IndividualAllocID : fix_string option;
    (** Number of repeating AllocAccount (79)/AllocPrice (366) entries.*)
    f_PreAllocMlegGrp_NoAllocs : int option;
    f_PreAllocMlegGrp_NestedParties3 : fix_nestedparties3
}
;;

type fix_legordgrp = {
    (** CoveredOrUncovered for leg of a multileg
     See CoveredOrUncovered (203) field for description*)
    f_LegOrdGrp_LegCoveredOrUncovered : int option;
    (** PositionEffect for leg of a multileg
     See PositionEffect (77) field for description*)
    f_LegOrdGrp_LegPositionEffect : int option;
    (** Price for leg of a multileg
     See Price (44) field for description*)
    f_LegOrdGrp_LegPrice : fix_float option;
    (** Quantity of this leg, e.g. in Quote dialog.
     See Quantity (53) for description and valid values*)
    f_LegOrdGrp_LegQty : fix_float option;
    (** Unique indicator for a specific leg.*)
    f_LegOrdGrp_LegRefID : fix_string option;
    (** Refer to description for SettlDate[64]*)
    f_LegOrdGrp_LegSettlDate : fix_localmktdate option;
    (** Refer to values for SettlType[63]*)
    f_LegOrdGrp_LegSettlType : int option;
    (** For Fixed Income, used instead of LegQty (687) or LegOrderQty (685) to requests the respondent to calculate the quantity based on the quantity on the opposite side of the swap.*)
    f_LegOrdGrp_LegSwapType : fix_legswaptype option;
    (** Number of InstrumentLeg repeating group instances.*)
    f_LegOrdGrp_NoLegs : int;
    f_LegOrdGrp_InstrumentLeg : fix_instrumentleg;
    f_LegOrdGrp_LegPreAllocGrp : fix_legpreallocgrp;
    f_LegOrdGrp_LegStipulations : fix_legstipulations;
    f_LegOrdGrp_NestedParties : fix_nestedparties
}
;;

type fix_listordgrp = {
    (** Account mnemonic as agreed between buy and sell sides, e.g. broker and institution or investor/intermediary and fund manager.*)
    f_ListOrdGrp_Account : fix_string option;
    (** Type of account associated with an order*)
    f_ListOrdGrp_AccountType : fix_accounttype option;
    (** Used to identify the source of the Account (1) code. This is especially useful if the account is a new account that the Respondent may not have setup yet in their system.*)
    f_ListOrdGrp_AcctIDSource : fix_acctidsource option;
    (** Unique identifier for allocation message.
     (Prior to FIX 4.1 this field was of type int)*)
    f_ListOrdGrp_AllocID : fix_string option;
    (** Method for booking out this order. Used when notifying a broker that an order to be settled by that broker is to be booked out as an OTC derivative (e.g. CFD or similar).*)
    f_ListOrdGrp_BookingType : fix_bookingtype option;
    (** Indicates what constitutes a bookable unit.*)
    f_ListOrdGrp_BookingUnit : fix_bookingunit option;
    (** Identifies whether an order is a margin order or a non-margin order. This is primarily used when sending orders to Japanese exchanges to indicate sell margin or buy to cover. The same tag could be assigned also by buy-side to indicate the intent to sell or buy margin and the sell-side to accept or reject (base on some validation criteria) the margin request.*)
    f_ListOrdGrp_CashMargin : fix_cashmargin option;
    (** Unique identifier for Order as assigned by the buy-side (institution, broker, intermediary etc.) (identified by SenderCompID (49) or OnBehalfOfCompID (5) as appropriate). Uniqueness must be guaranteed within a single trading day. Firms, particularly those which electronically submit multi-day orders, trade globally or throughout market close periods, should ensure uniqueness across days, for example by embedding a date within the ClOrdID field.*)
    f_ListOrdGrp_ClOrdID : fix_string;
    (** Permits order originators to tie together groups of orders in which trades resulting from orders are associated for a specific purpose, for example the calculation of average execution price for a customer or to associate lists submitted to a broker as waves of a larger program trade.*)
    f_ListOrdGrp_ClOrdLinkID : fix_string option;
    (** Indicates type of fee being assessed of the customer for trade executions at an exchange. Applicable for futures markets only at this time.
     (Values source CBOT, CME, NYBOT, and NYMEX):*)
    f_ListOrdGrp_ClearingFeeIndicator : fix_clearingfeeindicator option;
    (** ID used to represent this transaction for compliance purposes (e.g. OATS reporting).*)
    f_ListOrdGrp_ComplianceID : fix_string option;
    (** Used for derivative products, such as options*)
    f_ListOrdGrp_CoveredOrUncovered : fix_coveredoruncovered option;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.*)
    f_ListOrdGrp_Currency : fix_currency option;
    (** Capacity of customer placing the order
     Primarily used by futures exchanges to indicate the CTICode (customer type indicator) as required by the US CFTC (Commodity Futures Trading Commission).*)
    f_ListOrdGrp_CustOrderCapacity : fix_custordercapacity option;
    (** Indicates whether or not automatic booking can occur.*)
    f_ListOrdGrp_DayBookingInst : fix_daybookinginst option;
    (** Free format text defining the designation to be associated with a holding on the register. Used to identify assets of a specific underlying investor using a common registration, e.g. a broker’s nominee or street name.*)
    f_ListOrdGrp_Designation : fix_string option;
    (** Time the details within the message should take effect (always expressed in UTC (Universal Time Coordinated, also known as "GMT")*)
    f_ListOrdGrp_EffectiveTime : fix_utctimestamp option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.*)
    f_ListOrdGrp_EncodedText : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.*)
    f_ListOrdGrp_EncodedTextLen : int option;
    (** Execution destination as defined by institution when order is entered.
     Valid values:
     See "Appendix 6-C"*)
    f_ListOrdGrp_ExDestination : fix_exchange option;
    (** Instructions for order handling on exchange trading floor. If more than one instruction is applicable to an order, this field can contain multiple instructions separated by space.*)
    f_ListOrdGrp_ExecInst : fix_execinst option;
    (** Date of order expiration (last day the order can trade), always expressed in terms of the local market date. The time at which the order expires is determined by the local market’s business practices*)
    f_ListOrdGrp_ExpireDate : fix_localmktdate option;
    (** Time/Date of order expiration (always expressed in UTC (Universal Time Coordinated, also known as "GMT")
     The meaning of expiration is specific to the context where the field is used.
     For orders, this is the expiration time of a Good Til Date TimeInForce.
     For Quotes - this is the expiration of the quote.
     Expiration time is provided across the quote message dialog to control the length of time of the overall quoting process.
     For collateral requests, this is the time by which collateral must be assigned.
     For collateral assignments, this is the time by which a response to the assignment is expected.*)
    f_ListOrdGrp_ExpireTime : fix_utctimestamp option;
    (** Indicates request for forex accommodation trade to be executed along with security transaction.*)
    f_ListOrdGrp_ForexReq : fix_forexreq option;
    (** Code to identify whether to book out executions on a part-filled GT order on the day of execution or to accumulate*)
    f_ListOrdGrp_GTBookingInst : fix_gtbookinginst option;
    (** Instructions for order handling on Broker trading floor*)
    f_ListOrdGrp_HandlInst : fix_handlinst option;
    (** Unique identifier of IOI message.
     (Prior to FIX 4.1 this field was of type int)*)
    f_ListOrdGrp_IOIID : fix_string option;
    (** Sequence of individual order within list (i.e. ListSeqNo of TotNoOrders (68), 2 of 25, 3 of 25, . . . )*)
    f_ListOrdGrp_ListSeqNo : int;
    (** Indicates whether the broker is to locate the stock in conjunction with a short sell order.*)
    f_ListOrdGrp_LocateReqd : fix_locatereqd option;
    (** Maximum quantity (e.g. number of shares) within an order to be shown on the exchange floor at any given time.
     (Prior to FIX 4.2 this field was of type int)*)
    f_ListOrdGrp_MaxFloor : fix_float option;
    (** Maximum quantity (e.g. number of shares) within an order to be shown to other customers (i.e. sent via an IOI).
     (Prior to FIX 4.2 this field was of type int)*)
    f_ListOrdGrp_MaxShow : fix_float option;
    (** Minimum quantity of an order to be executed.
     (Prior to FIX 4.2 this field was of type int)*)
    f_ListOrdGrp_MinQty : fix_float option;
    (** Indicates number of orders to be combined for average pricing and allocation.*)
    f_ListOrdGrp_NoOrders : int;
    (** Order type
     *** SOME VALUES ARE NO LONGER USED - See "Deprecated (Phased-out) Features and Supported Approach" ***
     (see Volume : "Glossary" for value definitions)*)
    f_ListOrdGrp_OrdType : fix_ordtype option;
    (** Designates the capacity of the firm placing the order
     (as of FIX 4.3, this field replaced Rule80A (tag 47) --used in conjunction with OrderRestrictions (529) field)
     (see Volume : "Glossary" for value definitions)*)
    f_ListOrdGrp_OrderCapacity : fix_ordercapacity option;
    (** OrderQty (38) of the future part of a F/X swap order.*)
    f_ListOrdGrp_OrderQty2 : fix_float option;
    (** Restrictions associated with an order. If more than one restriction is applicable to an order, this field can contain multiple instructions separated by space.*)
    f_ListOrdGrp_OrderRestrictions : fix_orderrestrictions option;
    (** For a TargetStrategy=Participate order specifies the target particpation rate. For other order types this is a volume limit (i.e. do not be more than this percent of the market volume)*)
    f_ListOrdGrp_ParticipationRate : fix_float option;
    (** Indicates whether the resulting position after a trade should be an opening position or closing position. Used for omnibus accounting - where accounts are held on a gross basis instead of being netted together.*)
    f_ListOrdGrp_PositionEffect : fix_positioneffect option;
    (** Indicates the method of preallocation.*)
    f_ListOrdGrp_PreallocMethod : fix_preallocmethod option;
    (** Previous closing price of security.*)
    f_ListOrdGrp_PrevClosePx : fix_float option;
    (** Price per unit of quantity (e.g. per share)*)
    f_ListOrdGrp_Price : fix_float option;
    (** Price of the future part of a F/X swap order.
     See Price (44) for description.*)
    f_ListOrdGrp_Price2 : fix_float option;
    (** Code to represent the price type*)
    f_ListOrdGrp_PriceType : fix_pricetype option;
    (** Processing code for sub-account. Absence of this field in AllocAccount (79) / AllocPrice (366) /AllocQty (80) / ProcessCode instance indicates regular trade.*)
    f_ListOrdGrp_ProcessCode : fix_processcode option;
    (** Type of quantity specified in a quantity field*)
    f_ListOrdGrp_QtyType : fix_qtytype option;
    (** Unique identifier for quote*)
    f_ListOrdGrp_QuoteID : fix_string option;
    (** Assigned by the party which originates the order. Can be used to provide the ClOrdID (11) used by an exchange or executing system.*)
    f_ListOrdGrp_SecondaryClOrdID : fix_string option;
    (** Currency code of settlement denomination.*)
    f_ListOrdGrp_SettlCurrency : fix_currency option;
    (** Specific date of trade settlement (SettlementDate) in YYYYMMDD format.
     If present, this field overrides SettlType (63). This field is required if the value of SettlType (63) is 6 (Future) or 8 (Sellers Option). This field must be omitted if the value of SettlType (63) is 7 (When and If Issued)
     (expressed in local time at place of settlement)*)
    f_ListOrdGrp_SettlDate : fix_localmktdate option;
    (** SettDate (64) of the future part of a F/X swap order.*)
    f_ListOrdGrp_SettlDate2 : fix_localmktdate option;
    (** Indicates mode used for Settlement Instructions message.
     *** SOME VALUES HAVE BEEN REPLACED - See "Replaced Features and Supported Approach" ****)
    f_ListOrdGrp_SettlInstMode : fix_settlinstmode option;
    (** Indicates order settlement period. If present, SettlDate (64) overrides this field. If both SettlType (63) and SettDate (64) are omitted, the default for SettlType (63) is 0 (Regular)
     Regular is defined as the default settlement period for the particular security on the exchange of execution.
     In Fixed Income the contents of this field may influence the instrument definition if the SecurityID (48) is ambiguous. In the US an active Treasury offering may be re-opened, and for a time one CUSIP will apply to both the current and "when-issued" securities. Supplying a value of "7" clarifies the instrument description; any other value or the absence of this field should cause the respondent to default to the active issue.*)
    f_ListOrdGrp_SettlType : fix_settltype option;
    (** Side of order*)
    f_ListOrdGrp_Side : fix_side;
    (** Code to identify which "SideValue" the value refers to. SideValue and SideValue2 are used as opposed to Buy or Sell so that the basket can be quoted either way as Buy or Sell.*)
    f_ListOrdGrp_SideValueInd : fix_sidevalueind option;
    (** Indicates whether or not the order was solicited.*)
    f_ListOrdGrp_SolicitedFlag : fix_solicitedflag option;
    (** Price per unit of quantity (e.g. per share)*)
    f_ListOrdGrp_StopPx : fix_float option;
    (** The target strategy of the order
     1000+ = Reserved and available for bi-laterally agreed upon user defined values*)
    f_ListOrdGrp_TargetStrategy : fix_targetstrategy option;
    (** Field to allow further specification of the TargetStrategy – usage to be agreed between counterparties*)
    f_ListOrdGrp_TargetStrategyParameters : fix_string option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_ListOrdGrp_Text : fix_string option;
    (** Specifies how long the order remains in effect. Absence of this field is interpreted as DAY.*)
    f_ListOrdGrp_TimeInForce : fix_timeinforce option;
    (** Indicates date of trade referenced in this message in YYYYMMDD format. Absence of this field indicates current day (expressed in local time at place of trade).*)
    f_ListOrdGrp_TradeDate : fix_localmktdate option;
    (** Used with Fixed Income for Muncipal New Issue Market. Agreement in principal between counter-parties prior to actual trade date.
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)
     (prior to FIX 4.4 field was of type UTCDate)*)
    f_ListOrdGrp_TradeOriginationDate : fix_localmktdate option;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")*)
    f_ListOrdGrp_TransactTime : fix_utctimestamp option;
    f_ListOrdGrp_CommissionData : fix_commissiondata;
    f_ListOrdGrp_DiscretionInstructions : fix_discretioninstructions;
    f_ListOrdGrp_Instrument : fix_instrument;
    f_ListOrdGrp_OrderQtyData : fix_orderqtydata;
    f_ListOrdGrp_Parties : fix_parties;
    f_ListOrdGrp_PegInstructions : fix_peginstructions;
    f_ListOrdGrp_PreAllocGrp : fix_preallocgrp;
    f_ListOrdGrp_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    f_ListOrdGrp_Stipulations : fix_stipulations;
    f_ListOrdGrp_TrdgSesGrp : fix_trdgsesgrp;
    f_ListOrdGrp_UndInstrmtGrp : fix_undinstrmtgrp;
    f_ListOrdGrp_YieldData : fix_yielddata
}
;;

type fix_affectedordgrp = {
    (** OrderID (37) of an order affected by a mass cancel request.*)
    f_AffectedOrdGrp_AffectedOrderID : fix_string option;
    (** SecondaryOrderID (98) of an order affected by a mass cancel request.*)
    f_AffectedOrdGrp_AffectedSecondaryOrderID : fix_string option;
    (** Number of affected orders in the repeating group of order ids.*)
    f_AffectedOrdGrp_NoAffectedOrders : int option;
    (** ClOrdID () of the previous order (NOT the initial order of the day) as assigned by the institution, used to identify the previous order in cancel and cancel/replace requests.*)
    f_AffectedOrdGrp_OrigClOrdID : fix_string option
}
;;

type fix_posundinstrmtgrp = {
    (** Number of underlying legs that make up the security.*)
    f_PosUndInstrmtGrp_NoUnderlyings : int option;
    (** Underlying security’s SettlPrice.
     See SettlPrice (730) field for description*)
    f_PosUndInstrmtGrp_UnderlyingSettlPrice : fix_float;
    (** Underlying security’s SettlPriceType.
     See SettlPriceType (73) field for description*)
    f_PosUndInstrmtGrp_UnderlyingSettlPriceType : int;
    f_PosUndInstrmtGrp_UnderlyingInstrument : fix_underlyinginstrument
}
;;

(** The LegBenchmarkCurveData is used to convey the benchmark information used for pricing in a multi-legged Fixed Income security.*)
type fix_legbenchmarkcurvedata = {
    (** LegBenchmarkPrice (679) currency
     See BenchmarkCurveCurrency (220) for description and valid values.*)
    f_LegBenchmarkCurveData_LegBenchmarkCurveCurrency : fix_currency option;
    (** Name of the Leg Benchmark Curve.
     See BenchmarkCurveName (22) for description and valid values.*)
    f_LegBenchmarkCurveData_LegBenchmarkCurveName : fix_string option;
    (** Identifies the point on the Leg Benchmark Curve.
     See BenchmarkCurvePoint (222) for description and valid values.*)
    f_LegBenchmarkCurveData_LegBenchmarkCurvePoint : fix_string option;
    (** Used to identify the price of the benchmark security.
     See BenchmarkPrice (662) for description and valid values.*)
    f_LegBenchmarkCurveData_LegBenchmarkPrice : fix_float option;
    (** The price type of the LegBenchmarkPrice.
     See BenchmarkPriceType (663) for description and valid values.*)
    f_LegBenchmarkCurveData_LegBenchmarkPriceType : int option
}
;;

type fix_quotqualgrp = {
    (** Number of repeating groups of QuoteQualifiers (695).*)
    f_QuotQualGrp_NoQuoteQualifiers : int option;
    (** Code to qualify Quote use
     See IOIQualifier (04) for description and valid values.*)
    f_QuotQualGrp_QuoteQualifier : int option
}
;;

type fix_legquotgrp = {
    (** Bid price of this leg.
     See BidPx (32) for description and valid values.*)
    f_LegQuotGrp_LegBidPx : fix_float option;
    (** Offer price of this leg.
     See OfferPx (33) for description and valid values*)
    f_LegQuotGrp_LegOfferPx : fix_float option;
    (** The price type of the LegBidPx (68) and/or LegOfferPx (684).
     See PriceType (423) for description and valid values*)
    f_LegQuotGrp_LegPriceType : int option;
    (** Quantity of this leg, e.g. in Quote dialog.
     See Quantity (53) for description and valid values*)
    f_LegQuotGrp_LegQty : fix_float option;
    (** Refer to description for SettlDate[64]*)
    f_LegQuotGrp_LegSettlDate : fix_localmktdate option;
    (** Refer to values for SettlType[63]*)
    f_LegQuotGrp_LegSettlType : int option;
    (** For Fixed Income, used instead of LegQty (687) or LegOrderQty (685) to requests the respondent to calculate the quantity based on the quantity on the opposite side of the swap.*)
    f_LegQuotGrp_LegSwapType : fix_legswaptype option;
    (** Number of InstrumentLeg repeating group instances.*)
    f_LegQuotGrp_NoLegs : int option;
    f_LegQuotGrp_InstrumentLeg : fix_instrumentleg;
    f_LegQuotGrp_LegBenchmarkCurveData : fix_legbenchmarkcurvedata;
    f_LegQuotGrp_LegStipulations : fix_legstipulations;
    f_LegQuotGrp_NestedParties : fix_nestedparties
}
;;

type fix_quotcxlentriesgrp = {
    (** The number of quote entries for a QuoteSet.*)
    f_QuotCxlEntriesGrp_NoQuoteEntries : int option;
    f_QuotCxlEntriesGrp_FinancingDetails : fix_financingdetails;
    f_QuotCxlEntriesGrp_InstrmtLegGrp : fix_instrmtleggrp;
    f_QuotCxlEntriesGrp_Instrument : fix_instrument;
    f_QuotCxlEntriesGrp_UndInstrmtGrp : fix_undinstrmtgrp
}
;;

type fix_quotreqlegsgrp = {
    (** Quantity of this leg, e.g. in Quote dialog.
     See Quantity (53) for description and valid values*)
    f_QuotReqLegsGrp_LegQty : fix_float option;
    (** Refer to description for SettlDate[64]*)
    f_QuotReqLegsGrp_LegSettlDate : fix_localmktdate option;
    (** Refer to values for SettlType[63]*)
    f_QuotReqLegsGrp_LegSettlType : int option;
    (** For Fixed Income, used instead of LegQty (687) or LegOrderQty (685) to requests the respondent to calculate the quantity based on the quantity on the opposite side of the swap.*)
    f_QuotReqLegsGrp_LegSwapType : fix_legswaptype option;
    (** Number of InstrumentLeg repeating group instances.*)
    f_QuotReqLegsGrp_NoLegs : int option;
    f_QuotReqLegsGrp_InstrumentLeg : fix_instrumentleg;
    f_QuotReqLegsGrp_LegBenchmarkCurveData : fix_legbenchmarkcurvedata;
    f_QuotReqLegsGrp_LegStipulations : fix_legstipulations;
    f_QuotReqLegsGrp_NestedParties : fix_nestedparties
}
;;

type fix_quotreqgrp = {
    (** Account mnemonic as agreed between buy and sell sides, e.g. broker and institution or investor/intermediary and fund manager.*)
    f_QuotReqGrp_Account : fix_string option;
    (** Type of account associated with an order*)
    f_QuotReqGrp_AccountType : fix_accounttype option;
    (** Used to identify the source of the Account (1) code. This is especially useful if the account is a new account that the Respondent may not have setup yet in their system.*)
    f_QuotReqGrp_AcctIDSource : fix_acctidsource option;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.*)
    f_QuotReqGrp_Currency : fix_currency option;
    (** Time/Date of order expiration (always expressed in UTC (Universal Time Coordinated, also known as "GMT")
     The meaning of expiration is specific to the context where the field is used.
     For orders, this is the expiration time of a Good Til Date TimeInForce.
     For Quotes - this is the expiration of the quote.
     Expiration time is provided across the quote message dialog to control the length of time of the overall quoting process.
     For collateral requests, this is the time by which collateral must be assigned.
     For collateral assignments, this is the time by which a response to the assignment is expected.*)
    f_QuotReqGrp_ExpireTime : fix_utctimestamp option;
    (** Specifies the number of repeating symbols specified.*)
    f_QuotReqGrp_NoRelatedSym : int;
    (** Order type
     *** SOME VALUES ARE NO LONGER USED - See "Deprecated (Phased-out) Features and Supported Approach" ***
     (see Volume : "Glossary" for value definitions)*)
    f_QuotReqGrp_OrdType : fix_ordtype option;
    (** OrderQty (38) of the future part of a F/X swap order.*)
    f_QuotReqGrp_OrderQty2 : fix_float option;
    (** Previous closing price of security.*)
    f_QuotReqGrp_PrevClosePx : fix_float option;
    (** Price per unit of quantity (e.g. per share)*)
    f_QuotReqGrp_Price : fix_float option;
    (** Price of the future part of a F/X swap order.
     See Price (44) for description.*)
    f_QuotReqGrp_Price2 : fix_float option;
    (** Code to represent the price type*)
    f_QuotReqGrp_PriceType : fix_pricetype option;
    (** Type of quantity specified in a quantity field*)
    f_QuotReqGrp_QtyType : fix_qtytype option;
    (** Code to represent price type requested in Quote*)
    f_QuotReqGrp_QuotePriceType : fix_quotepricetype option;
    (** Indicates the type of Quote Request being generated*)
    f_QuotReqGrp_QuoteRequestType : fix_quoterequesttype option;
    (** Identifies the type of quote.
     An indicative quote is used to inform a counterparty of a market. An indicative quote does not result directly in a trade.
     A tradeable quote is submitted to a market and will result directly in a trade against other orders and quotes in a market.
     A restricted tradeable quote is submitted to a market and within a certain restriction (possibly based upon price or quantity) will automatically trade against orders. Order that do not comply with restrictions are sent to the quote issuer who can choose to accept or decline the order.
     A counter quote is used in the negotiation model. See Volume 7 – Product: Fixed Income for example usage.*)
    f_QuotReqGrp_QuoteType : fix_quotetype option;
    (** Specific date of trade settlement (SettlementDate) in YYYYMMDD format.
     If present, this field overrides SettlType (63). This field is required if the value of SettlType (63) is 6 (Future) or 8 (Sellers Option). This field must be omitted if the value of SettlType (63) is 7 (When and If Issued)
     (expressed in local time at place of settlement)*)
    f_QuotReqGrp_SettlDate : fix_localmktdate option;
    (** SettDate (64) of the future part of a F/X swap order.*)
    f_QuotReqGrp_SettlDate2 : fix_localmktdate option;
    (** Indicates order settlement period. If present, SettlDate (64) overrides this field. If both SettlType (63) and SettDate (64) are omitted, the default for SettlType (63) is 0 (Regular)
     Regular is defined as the default settlement period for the particular security on the exchange of execution.
     In Fixed Income the contents of this field may influence the instrument definition if the SecurityID (48) is ambiguous. In the US an active Treasury offering may be re-opened, and for a time one CUSIP will apply to both the current and "when-issued" securities. Supplying a value of "7" clarifies the instrument description; any other value or the absence of this field should cause the respondent to default to the active issue.*)
    f_QuotReqGrp_SettlType : fix_settltype option;
    (** Side of order*)
    f_QuotReqGrp_Side : fix_side option;
    (** Used with Fixed Income for Muncipal New Issue Market. Agreement in principal between counter-parties prior to actual trade date.
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)
     (prior to FIX 4.4 field was of type UTCDate)*)
    f_QuotReqGrp_TradeOriginationDate : fix_localmktdate option;
    (** Identifier for Trading Session
     Can be used to represent a specific market trading session (e.g. "PRE-OPEN", "CROSS_2", "AFTER-HOURS", "TOSTNET", "TOSTNET2", etc).
     To specify good for session where session spans more than one calendar day, use TimeInForce = Day in conjunction with TradingSessionID.
     Values should be bi-laterally agreed to between counterparties.
     Firms may register Trading Session values on the FIX website (presently a document maintained within "ECN and Exchanges" working group section).*)
    f_QuotReqGrp_TradingSessionID : fix_string option;
    (** Optional market assigned sub identifier for a trading session. Usage is determined by market or counterparties.
     Used by US based futures markets to identify exchange specific execution time bracket codes as required by US market regulations.*)
    f_QuotReqGrp_TradingSessionSubID : fix_string option;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")*)
    f_QuotReqGrp_TransactTime : fix_utctimestamp option;
    (** Indicates expiration time of indication message (always expressed in UTC (Universal Time Coordinated, also known as "GMT")*)
    f_QuotReqGrp_ValidUntilTime : fix_utctimestamp option;
    f_QuotReqGrp_FinancingDetails : fix_financingdetails;
    f_QuotReqGrp_Instrument : fix_instrument;
    f_QuotReqGrp_OrderQtyData : fix_orderqtydata;
    f_QuotReqGrp_Parties : fix_parties;
    f_QuotReqGrp_QuotQualGrp : fix_quotqualgrp;
    f_QuotReqGrp_QuotReqLegsGrp : fix_quotreqlegsgrp;
    f_QuotReqGrp_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    f_QuotReqGrp_Stipulations : fix_stipulations;
    f_QuotReqGrp_UndInstrmtGrp : fix_undinstrmtgrp;
    f_QuotReqGrp_YieldData : fix_yielddata
}
;;

type fix_quotreqrjctgrp = {
    (** Account mnemonic as agreed between buy and sell sides, e.g. broker and institution or investor/intermediary and fund manager.*)
    f_QuotReqRjctGrp_Account : fix_string option;
    (** Type of account associated with an order*)
    f_QuotReqRjctGrp_AccountType : fix_accounttype option;
    (** Used to identify the source of the Account (1) code. This is especially useful if the account is a new account that the Respondent may not have setup yet in their system.*)
    f_QuotReqRjctGrp_AcctIDSource : fix_acctidsource option;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.*)
    f_QuotReqRjctGrp_Currency : fix_currency option;
    (** Time/Date of order expiration (always expressed in UTC (Universal Time Coordinated, also known as "GMT")
     The meaning of expiration is specific to the context where the field is used.
     For orders, this is the expiration time of a Good Til Date TimeInForce.
     For Quotes - this is the expiration of the quote.
     Expiration time is provided across the quote message dialog to control the length of time of the overall quoting process.
     For collateral requests, this is the time by which collateral must be assigned.
     For collateral assignments, this is the time by which a response to the assignment is expected.*)
    f_QuotReqRjctGrp_ExpireTime : fix_utctimestamp option;
    (** Specifies the number of repeating symbols specified.*)
    f_QuotReqRjctGrp_NoRelatedSym : int;
    (** Order type
     *** SOME VALUES ARE NO LONGER USED - See "Deprecated (Phased-out) Features and Supported Approach" ***
     (see Volume : "Glossary" for value definitions)*)
    f_QuotReqRjctGrp_OrdType : fix_ordtype option;
    (** OrderQty (38) of the future part of a F/X swap order.*)
    f_QuotReqRjctGrp_OrderQty2 : fix_float option;
    (** Previous closing price of security.*)
    f_QuotReqRjctGrp_PrevClosePx : fix_float option;
    (** Price per unit of quantity (e.g. per share)*)
    f_QuotReqRjctGrp_Price : fix_float option;
    (** Price of the future part of a F/X swap order.
     See Price (44) for description.*)
    f_QuotReqRjctGrp_Price2 : fix_float option;
    (** Code to represent the price type*)
    f_QuotReqRjctGrp_PriceType : fix_pricetype option;
    (** Type of quantity specified in a quantity field*)
    f_QuotReqRjctGrp_QtyType : fix_qtytype option;
    (** Code to represent price type requested in Quote*)
    f_QuotReqRjctGrp_QuotePriceType : fix_quotepricetype option;
    (** Indicates the type of Quote Request being generated*)
    f_QuotReqRjctGrp_QuoteRequestType : fix_quoterequesttype option;
    (** Identifies the type of quote.
     An indicative quote is used to inform a counterparty of a market. An indicative quote does not result directly in a trade.
     A tradeable quote is submitted to a market and will result directly in a trade against other orders and quotes in a market.
     A restricted tradeable quote is submitted to a market and within a certain restriction (possibly based upon price or quantity) will automatically trade against orders. Order that do not comply with restrictions are sent to the quote issuer who can choose to accept or decline the order.
     A counter quote is used in the negotiation model. See Volume 7 – Product: Fixed Income for example usage.*)
    f_QuotReqRjctGrp_QuoteType : fix_quotetype option;
    (** Specific date of trade settlement (SettlementDate) in YYYYMMDD format.
     If present, this field overrides SettlType (63). This field is required if the value of SettlType (63) is 6 (Future) or 8 (Sellers Option). This field must be omitted if the value of SettlType (63) is 7 (When and If Issued)
     (expressed in local time at place of settlement)*)
    f_QuotReqRjctGrp_SettlDate : fix_localmktdate option;
    (** SettDate (64) of the future part of a F/X swap order.*)
    f_QuotReqRjctGrp_SettlDate2 : fix_localmktdate option;
    (** Indicates order settlement period. If present, SettlDate (64) overrides this field. If both SettlType (63) and SettDate (64) are omitted, the default for SettlType (63) is 0 (Regular)
     Regular is defined as the default settlement period for the particular security on the exchange of execution.
     In Fixed Income the contents of this field may influence the instrument definition if the SecurityID (48) is ambiguous. In the US an active Treasury offering may be re-opened, and for a time one CUSIP will apply to both the current and "when-issued" securities. Supplying a value of "7" clarifies the instrument description; any other value or the absence of this field should cause the respondent to default to the active issue.*)
    f_QuotReqRjctGrp_SettlType : fix_settltype option;
    (** Side of order*)
    f_QuotReqRjctGrp_Side : fix_side option;
    (** Used with Fixed Income for Muncipal New Issue Market. Agreement in principal between counter-parties prior to actual trade date.
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)
     (prior to FIX 4.4 field was of type UTCDate)*)
    f_QuotReqRjctGrp_TradeOriginationDate : fix_localmktdate option;
    (** Identifier for Trading Session
     Can be used to represent a specific market trading session (e.g. "PRE-OPEN", "CROSS_2", "AFTER-HOURS", "TOSTNET", "TOSTNET2", etc).
     To specify good for session where session spans more than one calendar day, use TimeInForce = Day in conjunction with TradingSessionID.
     Values should be bi-laterally agreed to between counterparties.
     Firms may register Trading Session values on the FIX website (presently a document maintained within "ECN and Exchanges" working group section).*)
    f_QuotReqRjctGrp_TradingSessionID : fix_string option;
    (** Optional market assigned sub identifier for a trading session. Usage is determined by market or counterparties.
     Used by US based futures markets to identify exchange specific execution time bracket codes as required by US market regulations.*)
    f_QuotReqRjctGrp_TradingSessionSubID : fix_string option;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")*)
    f_QuotReqRjctGrp_TransactTime : fix_utctimestamp option;
    f_QuotReqRjctGrp_FinancingDetails : fix_financingdetails;
    f_QuotReqRjctGrp_Instrument : fix_instrument;
    f_QuotReqRjctGrp_OrderQtyData : fix_orderqtydata;
    f_QuotReqRjctGrp_Parties : fix_parties;
    f_QuotReqRjctGrp_QuotQualGrp : fix_quotqualgrp;
    f_QuotReqRjctGrp_QuotReqLegsGrp : fix_quotreqlegsgrp;
    f_QuotReqRjctGrp_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    f_QuotReqRjctGrp_Stipulations : fix_stipulations;
    f_QuotReqRjctGrp_UndInstrmtGrp : fix_undinstrmtgrp;
    f_QuotReqRjctGrp_YieldData : fix_yielddata
}
;;

type fix_legquotstatgrp = {
    (** Quantity of this leg, e.g. in Quote dialog.
     See Quantity (53) for description and valid values*)
    f_LegQuotStatGrp_LegQty : fix_float option;
    (** Refer to description for SettlDate[64]*)
    f_LegQuotStatGrp_LegSettlDate : fix_localmktdate option;
    (** Refer to values for SettlType[63]*)
    f_LegQuotStatGrp_LegSettlType : int option;
    (** For Fixed Income, used instead of LegQty (687) or LegOrderQty (685) to requests the respondent to calculate the quantity based on the quantity on the opposite side of the swap.*)
    f_LegQuotStatGrp_LegSwapType : fix_legswaptype option;
    (** Number of InstrumentLeg repeating group instances.*)
    f_LegQuotStatGrp_NoLegs : int option;
    f_LegQuotStatGrp_InstrumentLeg : fix_instrumentleg;
    f_LegQuotStatGrp_LegStipulations : fix_legstipulations;
    f_LegQuotStatGrp_NestedParties : fix_nestedparties
}
;;

type fix_rfqreqgrp = {
    (** Specifies the number of repeating symbols specified.*)
    f_RFQReqGrp_NoRelatedSym : int;
    (** Previous closing price of security.*)
    f_RFQReqGrp_PrevClosePx : fix_float option;
    (** Indicates the type of Quote Request being generated*)
    f_RFQReqGrp_QuoteRequestType : fix_quoterequesttype option;
    (** Identifies the type of quote.
     An indicative quote is used to inform a counterparty of a market. An indicative quote does not result directly in a trade.
     A tradeable quote is submitted to a market and will result directly in a trade against other orders and quotes in a market.
     A restricted tradeable quote is submitted to a market and within a certain restriction (possibly based upon price or quantity) will automatically trade against orders. Order that do not comply with restrictions are sent to the quote issuer who can choose to accept or decline the order.
     A counter quote is used in the negotiation model. See Volume 7 – Product: Fixed Income for example usage.*)
    f_RFQReqGrp_QuoteType : fix_quotetype option;
    (** Identifier for Trading Session
     Can be used to represent a specific market trading session (e.g. "PRE-OPEN", "CROSS_2", "AFTER-HOURS", "TOSTNET", "TOSTNET2", etc).
     To specify good for session where session spans more than one calendar day, use TimeInForce = Day in conjunction with TradingSessionID.
     Values should be bi-laterally agreed to between counterparties.
     Firms may register Trading Session values on the FIX website (presently a document maintained within "ECN and Exchanges" working group section).*)
    f_RFQReqGrp_TradingSessionID : fix_string option;
    (** Optional market assigned sub identifier for a trading session. Usage is determined by market or counterparties.
     Used by US based futures markets to identify exchange specific execution time bracket codes as required by US market regulations.*)
    f_RFQReqGrp_TradingSessionSubID : fix_string option;
    f_RFQReqGrp_InstrmtLegGrp : fix_instrmtleggrp;
    f_RFQReqGrp_Instrument : fix_instrument;
    f_RFQReqGrp_UndInstrmtGrp : fix_undinstrmtgrp
}
;;

type fix_rgstdtlsgrp = {
    (** The date of birth applicable to the individual, e.g. required to open some types of tax-exempt account.*)
    f_RgstDtlsGrp_DateOfBirth : fix_localmktdate option;
    (** The ISO 366 Country code (2 character) identifying which country the beneficial investor is resident for tax purposes.*)
    f_RgstDtlsGrp_InvestorCountryOfResidence : fix_country option;
    (** Set of Correspondence address details, possibly including phone, fax, etc.*)
    f_RgstDtlsGrp_MailingDtls : fix_string option;
    (** Free format text to specify mailing instruction requirements, e.g. "no third party mailings".*)
    f_RgstDtlsGrp_MailingInst : fix_string option;
    (** The number of registration details on a Registration Instructions message*)
    f_RgstDtlsGrp_NoRegistDtls : int option;
    (** Identifies the type of owner*)
    f_RgstDtlsGrp_OwnerType : fix_ownertype option;
    (** Set of Registration name and address details, possibly including phone, fax etc.*)
    f_RgstDtlsGrp_RegistDtls : fix_string option;
    (** Email address relating to Registration name and address details*)
    f_RgstDtlsGrp_RegistEmail : fix_string option;
    f_RgstDtlsGrp_NestedParties : fix_nestedparties
}
;;

type fix_rgstdistinstgrp = {
    (** Name of account at agent bank for distributions.*)
    f_RgstDistInstGrp_CashDistribAgentAcctName : fix_string option;
    (** Account number at agent bank for distributions.*)
    f_RgstDistInstGrp_CashDistribAgentAcctNumber : fix_string option;
    (** BIC (Bank Identification Code--Swift managed) code of agent bank for cash distributions*)
    f_RgstDistInstGrp_CashDistribAgentCode : fix_string option;
    (** Name of local agent bank if for cash distributions*)
    f_RgstDistInstGrp_CashDistribAgentName : fix_string option;
    (** Specifies currency to be use for Cash Distributions– see "Appendix 6-A; Valid Currency Codes".*)
    f_RgstDistInstGrp_CashDistribCurr : fix_currency option;
    (** Free format Payment reference to assist with reconciliation of distributions.*)
    f_RgstDistInstGrp_CashDistribPayRef : fix_string option;
    (** A code identifying the payment method for a (fractional) distribution.
     13 through 998 are reserved for future use
     Values above 000 are available for use by private agreement among counterparties*)
    f_RgstDistInstGrp_DistribPaymentMethod : fix_distribpaymentmethod option;
    (** The amount of each distribution to go to this beneficiary, expressed as a percentage*)
    f_RgstDistInstGrp_DistribPercentage : fix_float option;
    (** The number of Distribution Instructions on a Registration Instructions message*)
    f_RgstDistInstGrp_NoDistribInsts : int option
}
;;

type fix_instrmtlegseclistgrp = {
    (** Refer to values for SettlType[63]*)
    f_InstrmtLegSecListGrp_LegSettlType : int option;
    (** For Fixed Income, used instead of LegQty (687) or LegOrderQty (685) to requests the respondent to calculate the quantity based on the quantity on the opposite side of the swap.*)
    f_InstrmtLegSecListGrp_LegSwapType : fix_legswaptype option;
    (** Number of InstrumentLeg repeating group instances.*)
    f_InstrmtLegSecListGrp_NoLegs : int option;
    f_InstrmtLegSecListGrp_InstrumentLeg : fix_instrumentleg;
    f_InstrmtLegSecListGrp_LegBenchmarkCurveData : fix_legbenchmarkcurvedata;
    f_InstrmtLegSecListGrp_LegStipulations : fix_legstipulations
}
;;

type fix_seclistgrp = {
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.*)
    f_SecListGrp_Currency : fix_currency option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.*)
    f_SecListGrp_EncodedText : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.*)
    f_SecListGrp_EncodedTextLen : int option;
    (** Part of trading cycle when an instrument expires. Field is applicable for derivatives.*)
    f_SecListGrp_ExpirationCycle : fix_expirationcycle option;
    (** The minimum trading volume for a security*)
    f_SecListGrp_MinTradeVol : fix_float option;
    (** Specifies the number of repeating symbols specified.*)
    f_SecListGrp_NoRelatedSym : int option;
    (** The trading lot size of a security*)
    f_SecListGrp_RoundLot : fix_float option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_SecListGrp_Text : fix_string option;
    (** Identifier for Trading Session
     Can be used to represent a specific market trading session (e.g. "PRE-OPEN", "CROSS_2", "AFTER-HOURS", "TOSTNET", "TOSTNET2", etc).
     To specify good for session where session spans more than one calendar day, use TimeInForce = Day in conjunction with TradingSessionID.
     Values should be bi-laterally agreed to between counterparties.
     Firms may register Trading Session values on the FIX website (presently a document maintained within "ECN and Exchanges" working group section).*)
    f_SecListGrp_TradingSessionID : fix_string option;
    (** Optional market assigned sub identifier for a trading session. Usage is determined by market or counterparties.
     Used by US based futures markets to identify exchange specific execution time bracket codes as required by US market regulations.*)
    f_SecListGrp_TradingSessionSubID : fix_string option;
    f_SecListGrp_FinancingDetails : fix_financingdetails;
    f_SecListGrp_InstrmtLegSecListGrp : fix_instrmtlegseclistgrp;
    f_SecListGrp_Instrument : fix_instrument;
    f_SecListGrp_InstrumentExtension : fix_instrumentextension;
    f_SecListGrp_SpreadOrBenchmarkCurveData : fix_spreadorbenchmarkcurvedata;
    f_SecListGrp_Stipulations : fix_stipulations;
    f_SecListGrp_UndInstrmtGrp : fix_undinstrmtgrp;
    f_SecListGrp_YieldData : fix_yielddata
}
;;

type fix_sectypesgrp = {
    (** Indicates the type of security using ISO 0962 standard, Classification of Financial Instruments (CFI code) values. ISO 0962 is maintained by ANNA (Association of National Numbering Agencies) acting as Registration Authority. See "Appendix 6-B FIX Fields Based Upon Other Standards". See also the Product (460) and SecurityType (67) fields. It is recommended that CFICode be used instead of SecurityType (67) for non-Fixed Income instruments.
     A subset of possible values applicable to FIX usage are identified in "Appendix 6-D CFICode Usage - ISO 0962 Classification of Financial Instruments (CFI code)"*)
    f_SecTypesGrp_CFICode : fix_string option;
    (** Number of Security Type repeating group instances.*)
    f_SecTypesGrp_NoSecurityTypes : int option;
    (** Indicates the type of product the security is associated with. See also the CFICode (46) and SecurityType (67) fields.*)
    f_SecTypesGrp_Product : fix_product option;
    (** Sub-type qualification/identification of the SecurityType (e.g. for SecurityType="REPO").
     Example Values:
     General = General Collateral (for SecurityType=REPO)
     For SecurityType="MLEG" markets can provide the name of the option or futures strategy, such as Calendar, Vertical, Butterfly, etc.
     NOTE: Additional values may be used by mutual agreement of the counterparties*)
    f_SecTypesGrp_SecuritySubType : fix_string option;
    (** Indicates type of security. See also the Product (460) and CFICode (46) fields. It is recommended that CFICode be used instead of SecurityType for non-Fixed Income instruments.
     Example values (grouped by Product field value) (Note: additional values may be used by mutual agreement of the counterparties):
     * Identify the Issuer in the "Issuer" field(06)
     *** REPLACED values - See "Replaced Features and Supported Approach" ***
     NOTE: Additional values may be used by mutual agreement of the counterparties)*)
    f_SecTypesGrp_SecurityType : fix_securitytype option
}
;;

type fix_settlinstgrp = {
    (** Indicates the type of security using ISO 0962 standard, Classification of Financial Instruments (CFI code) values. ISO 0962 is maintained by ANNA (Association of National Numbering Agencies) acting as Registration Authority. See "Appendix 6-B FIX Fields Based Upon Other Standards". See also the Product (460) and SecurityType (67) fields. It is recommended that CFICode be used instead of SecurityType (67) for non-Fixed Income instruments.
     A subset of possible values applicable to FIX usage are identified in "Appendix 6-D CFICode Usage - ISO 0962 Classification of Financial Instruments (CFI code)"*)
    f_SettlInstGrp_CFICode : fix_string option;
    (** The expiry date of the payment card as specified on the card being used for payment.*)
    f_SettlInstGrp_CardExpDate : fix_localmktdate option;
    (** The name of the payment card holder as specified on the card being used for payment.*)
    f_SettlInstGrp_CardHolderName : fix_string option;
    (** The issue number of the payment card as specified on the card being used for payment. This is only applicable to certain types of card.*)
    f_SettlInstGrp_CardIssNum : fix_string option;
    (** The number of the payment card as specified on the card being used for payment.*)
    f_SettlInstGrp_CardNumber : fix_string option;
    (** The start date of the card as specified on the card being used for payment.*)
    f_SettlInstGrp_CardStartDate : fix_localmktdate option;
    (** Time the details within the message should take effect (always expressed in UTC (Universal Time Coordinated, also known as "GMT")*)
    f_SettlInstGrp_EffectiveTime : fix_utctimestamp option;
    (** Time/Date of order expiration (always expressed in UTC (Universal Time Coordinated, also known as "GMT")
     The meaning of expiration is specific to the context where the field is used.
     For orders, this is the expiration time of a Good Til Date TimeInForce.
     For Quotes - this is the expiration of the quote.
     Expiration time is provided across the quote message dialog to control the length of time of the overall quoting process.
     For collateral requests, this is the time by which collateral must be assigned.
     For collateral assignments, this is the time by which a response to the assignment is expected.*)
    f_SettlInstGrp_ExpireTime : fix_utctimestamp option;
    (** Timestamp of last update to data item (or creation if no updates made since creation).*)
    f_SettlInstGrp_LastUpdateTime : fix_utctimestamp option;
    (** Number of settlement instructions within repeating group.*)
    f_SettlInstGrp_NoSettlInst : int option;
    (** The date written on a cheque or date payment should be submitted to the relevant clearing system.*)
    f_SettlInstGrp_PaymentDate : fix_localmktdate option;
    (** A code identifying the Settlement payment method.
     16 through 998 are reserved for future use
     Values above 000 are available for use by private agreement among counterparties*)
    f_SettlInstGrp_PaymentMethod : fix_paymentmethod option;
    (** "Settlement Payment Reference" – A free format Payment reference to assist with reconciliation, e.g. a Client and/or Order ID number.*)
    f_SettlInstGrp_PaymentRef : fix_string option;
    (** Identifies sender of a payment, e.g. the payment remitter or a customer reference number.*)
    f_SettlInstGrp_PaymentRemitterID : fix_string option;
    (** Indicates the type of product the security is associated with. See also the CFICode (46) and SecurityType (67) fields.*)
    f_SettlInstGrp_Product : fix_product option;
    (** Indicates type of security. See also the Product (460) and CFICode (46) fields. It is recommended that CFICode be used instead of SecurityType for non-Fixed Income instruments.
     Example values (grouped by Product field value) (Note: additional values may be used by mutual agreement of the counterparties):
     * Identify the Issuer in the "Issuer" field(06)
     *** REPLACED values - See "Replaced Features and Supported Approach" ***
     NOTE: Additional values may be used by mutual agreement of the counterparties)*)
    f_SettlInstGrp_SecurityType : fix_securitytype option;
    (** Unique identifier for Settlement Instruction.*)
    f_SettlInstGrp_SettlInstID : fix_string option;
    (** Reference identifier for the SettlInstID (62) with Cancel and Replace SettlInstTransType (63) transaction types.*)
    f_SettlInstGrp_SettlInstRefID : fix_string option;
    (** Settlement Instructions message transaction type*)
    f_SettlInstGrp_SettlInstTransType : fix_settlinsttranstype option;
    (** Side of order*)
    f_SettlInstGrp_Side : fix_side option;
    f_SettlInstGrp_Parties : fix_parties;
    f_SettlInstGrp_SettlInstructionsData : fix_settlinstructionsdata
}
;;

type fix_trdallocgrp = {
    (** Sub-account mnemonic*)
    f_TrdAllocGrp_AllocAccount : fix_string option;
    (** Used to identify the source of the AllocAccount (79) code.
     See AcctIDSource (660) for valid values.*)
    f_TrdAllocGrp_AllocAcctIDSource : int option;
    (** Quantity to be allocated to specific sub-account
     (Prior to FIX 4.2 this field was of type int)*)
    f_TrdAllocGrp_AllocQty : fix_float option;
    (** Currency code of settlement denomination for a specific AllocAccount (79).*)
    f_TrdAllocGrp_AllocSettlCurrency : fix_currency option;
    (** Unique identifier for a specific NoAllocs (78) repeating group instance (e.g. for an AllocAccount).*)
    f_TrdAllocGrp_IndividualAllocID : fix_string option;
    (** Number of repeating AllocAccount (79)/AllocPrice (366) entries.*)
    f_TrdAllocGrp_NoAllocs : int option;
    f_TrdAllocGrp_NestedParties2 : fix_nestedparties2
}
;;

type fix_trdinstrmtleggrp = {
    (** CoveredOrUncovered for leg of a multileg
     See CoveredOrUncovered (203) field for description*)
    f_TrdInstrmtLegGrp_LegCoveredOrUncovered : int option;
    (** Execution price assigned to a leg of a multileg instrument.
     See LastPx (31) field for description and values*)
    f_TrdInstrmtLegGrp_LegLastPx : fix_float option;
    (** PositionEffect for leg of a multileg
     See PositionEffect (77) field for description*)
    f_TrdInstrmtLegGrp_LegPositionEffect : int option;
    (** Price for leg of a multileg
     See Price (44) field for description*)
    f_TrdInstrmtLegGrp_LegPrice : fix_float option;
    (** Quantity of this leg, e.g. in Quote dialog.
     See Quantity (53) for description and valid values*)
    f_TrdInstrmtLegGrp_LegQty : fix_float option;
    (** Unique indicator for a specific leg.*)
    f_TrdInstrmtLegGrp_LegRefID : fix_string option;
    (** Refer to description for SettlDate[64]*)
    f_TrdInstrmtLegGrp_LegSettlDate : fix_localmktdate option;
    (** Refer to values for SettlType[63]*)
    f_TrdInstrmtLegGrp_LegSettlType : int option;
    (** For Fixed Income, used instead of LegQty (687) or LegOrderQty (685) to requests the respondent to calculate the quantity based on the quantity on the opposite side of the swap.*)
    f_TrdInstrmtLegGrp_LegSwapType : fix_legswaptype option;
    (** Number of InstrumentLeg repeating group instances.*)
    f_TrdInstrmtLegGrp_NoLegs : int option;
    f_TrdInstrmtLegGrp_InstrumentLeg : fix_instrumentleg;
    f_TrdInstrmtLegGrp_LegStipulations : fix_legstipulations;
    f_TrdInstrmtLegGrp_NestedParties : fix_nestedparties
}
;;

type fix_trdcaprptsidegrp = {
    (** Account mnemonic as agreed between buy and sell sides, e.g. broker and institution or investor/intermediary and fund manager.*)
    f_TrdCapRptSideGrp_Account : fix_string option;
    (** Type of account associated with an order*)
    f_TrdCapRptSideGrp_AccountType : fix_accounttype option;
    (** Amount of Accrued Interest for convertible bonds and fixed income*)
    f_TrdCapRptSideGrp_AccruedInterestAmt : fix_float option;
    (** The amount the buyer compensates the seller for the portion of the next coupon interest payment the seller has earned but will not receive from the issuer because the issuer will send the next coupon payment to the buyer. Accrued Interest Rate is the annualized Accrued Interest amount divided by the purchase price of the bond.*)
    f_TrdCapRptSideGrp_AccruedInterestRate : fix_float option;
    (** Used to identify the source of the Account (1) code. This is especially useful if the account is a new account that the Respondent may not have setup yet in their system.*)
    f_TrdCapRptSideGrp_AcctIDSource : fix_acctidsource option;
    (** Unique identifier for allocation message.
     (Prior to FIX 4.1 this field was of type int)*)
    f_TrdCapRptSideGrp_AllocID : fix_string option;
    (** Unique identifier for Order as assigned by the buy-side (institution, broker, intermediary etc.) (identified by SenderCompID (49) or OnBehalfOfCompID (5) as appropriate). Uniqueness must be guaranteed within a single trading day. Firms, particularly those which electronically submit multi-day orders, trade globally or throughout market close periods, should ensure uniqueness across days, for example by embedding a date within the ClOrdID field.*)
    f_TrdCapRptSideGrp_ClOrdID : fix_string option;
    (** ID used to represent this transaction for compliance purposes (e.g. OATS reporting).*)
    f_TrdCapRptSideGrp_ComplianceID : fix_string option;
    (** Provides the reduction in price for the secondary market in Muncipals.
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)*)
    f_TrdCapRptSideGrp_Concession : fix_float option;
    (** Identifies currency used for price. Absence of this field is interpreted as the default for the security. It is recommended that systems provide the currency value whenever possible. See "Appendix 6-A: Valid Currency Codes" for information on obtaining valid values.*)
    f_TrdCapRptSideGrp_Currency : fix_currency option;
    (** Capacity of customer placing the order
     Primarily used by futures exchanges to indicate the CTICode (customer type indicator) as required by the US CFTC (Commodity Futures Trading Commission).*)
    f_TrdCapRptSideGrp_CustOrderCapacity : fix_custordercapacity option;
    (** Encoded (non-ASCII characters) representation of the Text (58) field in the encoded format specified via the MessageEncoding (347) field. If used, the ASCII (English) representation should also be specified in the Text field.*)
    f_TrdCapRptSideGrp_EncodedText : fix_string option;
    (** Byte length of encoded (non-ASCII characters) EncodedText (355) field.*)
    f_TrdCapRptSideGrp_EncodedTextLen : int option;
    (** Accrued Interest Amount applicable to a financing transaction on the End Date.*)
    f_TrdCapRptSideGrp_EndAccruedInterestAmt : fix_float option;
    (** Ending dirty cash consideration of a financing deal. i.e. reimbursed to the buyer on the End Date.*)
    f_TrdCapRptSideGrp_EndCash : fix_float option;
    (** The date when a distribution of interest is deducted from a securities assets or set aside for payment to bondholders. On the ex-date, the securities price drops by the amount of the distribution (plus or minus any market activity).
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)
     (prior to FIX 4.4 field was of type UTCDate)*)
    f_TrdCapRptSideGrp_ExDate : fix_localmktdate option;
    (** Used to report any exchange rules that apply to this trade.
     Primarily intended for US futures markets. Certain trading practices are permitted by the CFTC, such as large lot trading, block trading, all or none trades. If the rules are used, the exchanges are required to indicate these rules on the trade.*)
    f_TrdCapRptSideGrp_ExchangeRule : fix_string option;
    (** Instructions for order handling on exchange trading floor. If more than one instruction is applicable to an order, this field can contain multiple instructions separated by space.*)
    f_TrdCapRptSideGrp_ExecInst : fix_execinst option;
    (** Total amount traded (e.g. CumQty (4) * AvgPx (6)) expressed in units of currency.*)
    f_TrdCapRptSideGrp_GrossTradeAmt : fix_float option;
    (** Amount of interest (i.e. lump-sum) at maturity.*)
    f_TrdCapRptSideGrp_InterestAtMaturity : fix_float option;
    (** Unique identifier for list as assigned by institution, used to associate multiple individual orders. Uniqueness must be guaranteed within a single trading day. Firms which generate multi-day orders should consider embedding a date within the ListID field to assure uniqueness across days.*)
    f_TrdCapRptSideGrp_ListID : fix_string option;
    (** Total amount due as the result of the transaction (e.g. for Buy order - principal + commission + fees) reported in currency of execution.*)
    f_TrdCapRptSideGrp_NetMoney : fix_float option;
    (** Number of Side repeating group instances.*)
    f_TrdCapRptSideGrp_NoSides : fix_nosides;
    (** Number of Days of Interest for convertible bonds and fixed income. Note value may be negative.*)
    f_TrdCapRptSideGrp_NumDaysInterest : int option;
    (** This trade is to be treated as an odd lot*)
    f_TrdCapRptSideGrp_OddLot : fix_oddlot option;
    (** Order type
     *** SOME VALUES ARE NO LONGER USED - See "Deprecated (Phased-out) Features and Supported Approach" ***
     (see Volume : "Glossary" for value definitions)*)
    f_TrdCapRptSideGrp_OrdType : fix_ordtype option;
    (** Designates the capacity of the firm placing the order
     (as of FIX 4.3, this field replaced Rule80A (tag 47) --used in conjunction with OrderRestrictions (529) field)
     (see Volume : "Glossary" for value definitions)*)
    f_TrdCapRptSideGrp_OrderCapacity : fix_ordercapacity option;
    (** Unique identifier for Order as assigned by sell-side (broker, exchange, ECN). Uniqueness must be guaranteed within a single trading day. Firms which accept multi-day orders should consider embedding a date within the OrderID field to assure uniqueness across days.*)
    f_TrdCapRptSideGrp_OrderID : fix_string;
    (** Specific device number, terminal number or station where order was entered*)
    f_TrdCapRptSideGrp_OrderInputDevice : fix_string option;
    (** Restrictions associated with an order. If more than one restriction is applicable to an order, this field can contain multiple instructions separated by space.*)
    f_TrdCapRptSideGrp_OrderRestrictions : fix_orderrestrictions option;
    (** Indicates whether the resulting position after a trade should be an opening position or closing position. Used for omnibus accounting - where accounts are held on a gross basis instead of being netted together.*)
    f_TrdCapRptSideGrp_PositionEffect : fix_positioneffect option;
    (** Indicates the method of preallocation.*)
    f_TrdCapRptSideGrp_PreallocMethod : fix_preallocmethod option;
    (** Processing code for sub-account. Absence of this field in AllocAccount (79) / AllocPrice (366) /AllocQty (80) / ProcessCode instance indicates regular trade.*)
    f_TrdCapRptSideGrp_ProcessCode : fix_processcode option;
    (** Assigned by the party which originates the order. Can be used to provide the ClOrdID (11) used by an exchange or executing system.*)
    f_TrdCapRptSideGrp_SecondaryClOrdID : fix_string option;
    (** Assigned by the party which accepts the order. Can be used to provide the OrderID (37) used by an exchange or executing system.*)
    f_TrdCapRptSideGrp_SecondaryOrderID : fix_string option;
    (** Total amount due expressed in settlement currency (includes the effect of the forex transaction)*)
    f_TrdCapRptSideGrp_SettlCurrAmt : fix_float option;
    (** Foreign exchange rate used to compute SettlCurrAmt (9) from Currency (5) to SettlCurrency (20)*)
    f_TrdCapRptSideGrp_SettlCurrFxRate : fix_float option;
    (** Specifies whether or not SettlCurrFxRate (55) should be multiplied or divided*)
    f_TrdCapRptSideGrp_SettlCurrFxRateCalc : fix_settlcurrfxratecalc option;
    (** Currency code of settlement denomination.*)
    f_TrdCapRptSideGrp_SettlCurrency : fix_currency option;
    (** Side of order*)
    f_TrdCapRptSideGrp_Side : fix_side;
    (** Used to indicate if the side being reported on Trade Capture Report represents a leg of a multileg instrument or a single security*)
    f_TrdCapRptSideGrp_SideMultiLegReportingType : fix_sidemultilegreportingtype option;
    (** Indicates whether or not the order was solicited.*)
    f_TrdCapRptSideGrp_SolicitedFlag : fix_solicitedflag option;
    (** Starting dirty cash consideration of a financing deal, i.e. paid to the seller on the Start Date.*)
    f_TrdCapRptSideGrp_StartCash : fix_float option;
    (** Free format text string
     (Note: this field does not have a specified maximum length)*)
    f_TrdCapRptSideGrp_Text : fix_string option;
    (** A code that represents a time interval in which a fill or trade occurred.
     Required for US futures markets.*)
    f_TrdCapRptSideGrp_TimeBracket : fix_string option;
    (** The price at which the securities are distributed to the different members of an underwriting group for the primary market in Municipals, total gross underwriter's spread.
     (Note tag # was reserved in FIX 4.1, added in FIX 4.3)*)
    f_TrdCapRptSideGrp_TotalTakedown : fix_float option;
    (** Identifies how the trade is to be allocated*)
    f_TrdCapRptSideGrp_TradeAllocIndicator : fix_tradeallocindicator option;
    (** Specific device number, terminal number or station where trade was entered*)
    f_TrdCapRptSideGrp_TradeInputDevice : fix_string option;
    (** Type of input device or system from which the trade was entered.*)
    f_TrdCapRptSideGrp_TradeInputSource : fix_string option;
    (** Identifier for Trading Session
     Can be used to represent a specific market trading session (e.g. "PRE-OPEN", "CROSS_2", "AFTER-HOURS", "TOSTNET", "TOSTNET2", etc).
     To specify good for session where session spans more than one calendar day, use TimeInForce = Day in conjunction with TradingSessionID.
     Values should be bi-laterally agreed to between counterparties.
     Firms may register Trading Session values on the FIX website (presently a document maintained within "ECN and Exchanges" working group section).*)
    f_TrdCapRptSideGrp_TradingSessionID : fix_string option;
    (** Optional market assigned sub identifier for a trading session. Usage is determined by market or counterparties.
     Used by US based futures markets to identify exchange specific execution time bracket codes as required by US market regulations.*)
    f_TrdCapRptSideGrp_TradingSessionSubID : fix_string option;
    (** For CIV A date and time stamp to indicate the time a CIV order was booked by the fund manager.*)
    f_TrdCapRptSideGrp_TransBkdTime : fix_utctimestamp option;
    f_TrdCapRptSideGrp_ClrInstGrp : fix_clrinstgrp;
    f_TrdCapRptSideGrp_CommissionData : fix_commissiondata;
    f_TrdCapRptSideGrp_ContAmtGrp : fix_contamtgrp;
    f_TrdCapRptSideGrp_MiscFeesGrp : fix_miscfeesgrp;
    f_TrdCapRptSideGrp_Parties : fix_parties;
    f_TrdCapRptSideGrp_Stipulations : fix_stipulations;
    f_TrdCapRptSideGrp_TrdAllocGrp : fix_trdallocgrp
}
;;

type fix_trdcapdtgrp = {
    (** Number of Date fields provided in date range*)
    f_TrdCapDtGrp_NoDates : int option;
    (** Indicates date of trade referenced in this message in YYYYMMDD format. Absence of this field indicates current day (expressed in local time at place of trade).*)
    f_TrdCapDtGrp_TradeDate : fix_localmktdate option;
    (** Time of execution/order creation (expressed in UTC (Universal Time Coordinated, also known as "GMT")*)
    f_TrdCapDtGrp_TransactTime : fix_utctimestamp option
}
;;

type full_fix_app_record_data =
    | FIX_Record_EvntGrp of fix_evntgrp
    | FIX_Record_SecAltIDGrp of fix_secaltidgrp
    | FIX_Record_LegSecAltIDGrp of fix_legsecaltidgrp
    | FIX_Record_InstrumentLeg of fix_instrumentleg
    | FIX_Record_UndSecAltIDGrp of fix_undsecaltidgrp
    | FIX_Record_UnderlyingStipulations of fix_underlyingstipulations
    | FIX_Record_UnderlyingInstrument of fix_underlyinginstrument
    | FIX_Record_Instrument of fix_instrument
    | FIX_Record_InstrmtLegGrp of fix_instrmtleggrp
    | FIX_Record_UndInstrmtGrp of fix_undinstrmtgrp
    | FIX_Record_NstdPtys2SubGrp of fix_nstdptys2subgrp
    | FIX_Record_NestedParties2 of fix_nestedparties2
    | FIX_Record_AttrbGrp of fix_attrbgrp
    | FIX_Record_PtysSubGrp of fix_ptyssubgrp
    | FIX_Record_NstdPtysSubGrp of fix_nstdptyssubgrp
    | FIX_Record_SettlPtysSubGrp of fix_settlptyssubgrp
    | FIX_Record_SettlParties of fix_settlparties
    | FIX_Record_DlvyInstGrp of fix_dlvyinstgrp
    | FIX_Record_ClrInstGrp of fix_clrinstgrp
    | FIX_Record_CommissionData of fix_commissiondata
    | FIX_Record_MiscFeesGrp of fix_miscfeesgrp
    | FIX_Record_NestedParties of fix_nestedparties
    | FIX_Record_SettlInstructionsData of fix_settlinstructionsdata
    | FIX_Record_OrdAllocGrp of fix_ordallocgrp
    | FIX_Record_ExecAllocGrp of fix_execallocgrp
    | FIX_Record_InstrumentExtension of fix_instrumentextension
    | FIX_Record_FinancingDetails of fix_financingdetails
    | FIX_Record_SpreadOrBenchmarkCurveData of fix_spreadorbenchmarkcurvedata
    | FIX_Record_Parties of fix_parties
    | FIX_Record_Stipulations of fix_stipulations
    | FIX_Record_YieldData of fix_yielddata
    | FIX_Record_AllocGrp of fix_allocgrp
    | FIX_Record_AllocAckGrp of fix_allocackgrp
    | FIX_Record_PositionQty of fix_positionqty
    | FIX_Record_PositionAmountData of fix_positionamountdata
    | FIX_Record_BidDescReqGrp of fix_biddescreqgrp
    | FIX_Record_BidCompReqGrp of fix_bidcompreqgrp
    | FIX_Record_BidCompRspGrp of fix_bidcomprspgrp
    | FIX_Record_ExecCollGrp of fix_execcollgrp
    | FIX_Record_TrdCollGrp of fix_trdcollgrp
    | FIX_Record_UndInstrmtCollGrp of fix_undinstrmtcollgrp
    | FIX_Record_TrdRegTimestamps of fix_trdregtimestamps
    | FIX_Record_CollInqQualGrp of fix_collinqqualgrp
    | FIX_Record_CpctyConfGrp of fix_cpctyconfgrp
    | FIX_Record_OrderQtyData of fix_orderqtydata
    | FIX_Record_PreAllocGrp of fix_preallocgrp
    | FIX_Record_SideCrossOrdModGrp of fix_sidecrossordmodgrp
    | FIX_Record_TrdgSesGrp of fix_trdgsesgrp
    | FIX_Record_PegInstructions of fix_peginstructions
    | FIX_Record_DiscretionInstructions of fix_discretioninstructions
    | FIX_Record_SideCrossOrdCxlGrp of fix_sidecrossordcxlgrp
    | FIX_Record_RelSymDerivSecGrp of fix_relsymderivsecgrp
    | FIX_Record_RoutingGrp of fix_routinggrp
    | FIX_Record_InstrmtGrp of fix_instrmtgrp
    | FIX_Record_LinesOfTextGrp of fix_linesoftextgrp
    | FIX_Record_LegStipulations of fix_legstipulations
    | FIX_Record_ContraGrp of fix_contragrp
    | FIX_Record_ContAmtGrp of fix_contamtgrp
    | FIX_Record_InstrmtLegExecGrp of fix_instrmtlegexecgrp
    | FIX_Record_InstrmtLegIOIGrp of fix_instrmtlegioigrp
    | FIX_Record_IOIQualGrp of fix_ioiqualgrp
    | FIX_Record_OrdListStatGrp of fix_ordliststatgrp
    | FIX_Record_InstrmtStrkPxGrp of fix_instrmtstrkpxgrp
    | FIX_Record_UndInstrmtStrkPxGrp of fix_undinstrmtstrkpxgrp
    | FIX_Record_MDIncGrp of fix_mdincgrp
    | FIX_Record_MDReqGrp of fix_mdreqgrp
    | FIX_Record_InstrmtMDReqGrp of fix_instrmtmdreqgrp
    | FIX_Record_MDRjctGrp of fix_mdrjctgrp
    | FIX_Record_MDFullGrp of fix_mdfullgrp
    | FIX_Record_QuotEntryGrp of fix_quotentrygrp
    | FIX_Record_QuotSetGrp of fix_quotsetgrp
    | FIX_Record_QuotEntryAckGrp of fix_quotentryackgrp
    | FIX_Record_QuotSetAckGrp of fix_quotsetackgrp
    | FIX_Record_NstdPtys3SubGrp of fix_nstdptys3subgrp
    | FIX_Record_NestedParties3 of fix_nestedparties3
    | FIX_Record_LegPreAllocGrp of fix_legpreallocgrp
    | FIX_Record_PreAllocMlegGrp of fix_preallocmleggrp
    | FIX_Record_LegOrdGrp of fix_legordgrp
    | FIX_Record_ListOrdGrp of fix_listordgrp
    | FIX_Record_AffectedOrdGrp of fix_affectedordgrp
    | FIX_Record_PosUndInstrmtGrp of fix_posundinstrmtgrp
    | FIX_Record_LegBenchmarkCurveData of fix_legbenchmarkcurvedata
    | FIX_Record_QuotQualGrp of fix_quotqualgrp
    | FIX_Record_LegQuotGrp of fix_legquotgrp
    | FIX_Record_QuotCxlEntriesGrp of fix_quotcxlentriesgrp
    | FIX_Record_QuotReqLegsGrp of fix_quotreqlegsgrp
    | FIX_Record_QuotReqGrp of fix_quotreqgrp
    | FIX_Record_QuotReqRjctGrp of fix_quotreqrjctgrp
    | FIX_Record_LegQuotStatGrp of fix_legquotstatgrp
    | FIX_Record_RFQReqGrp of fix_rfqreqgrp
    | FIX_Record_RgstDtlsGrp of fix_rgstdtlsgrp
    | FIX_Record_RgstDistInstGrp of fix_rgstdistinstgrp
    | FIX_Record_InstrmtLegSecListGrp of fix_instrmtlegseclistgrp
    | FIX_Record_SecListGrp of fix_seclistgrp
    | FIX_Record_SecTypesGrp of fix_sectypesgrp
    | FIX_Record_SettlInstGrp of fix_settlinstgrp
    | FIX_Record_TrdAllocGrp of fix_trdallocgrp
    | FIX_Record_TrdInstrmtLegGrp of fix_trdinstrmtleggrp
    | FIX_Record_TrdCapRptSideGrp of fix_trdcaprptsidegrp
    | FIX_Record_TrdCapDtGrp of fix_trdcapdtgrp
;;
