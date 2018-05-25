(* Aesthetic Integration copyright 2018 *)
open Base_types_json;;
open Datetime_json;;
open Json_generator_utils;;
open Model_enums_json;;
open Model_repeating_groups;;
open Yojson;;

let model_ClearingEntries_rg_to_json (y)  : json =
    (match y with
        | None -> `Null
        | Some x -> (assoc_filter_nulls (("Account",string_opt_to_json x.mod_f_ClearingEntries_Account) :: (("FreeText",string_opt_to_json x.mod_f_ClearingEntries_FreeText) :: (("OpenClose",mod_openclose_opt_to_json x.mod_f_ClearingEntries_OpenClose) :: (("ClearingFirm",string_opt_to_json x.mod_f_ClearingEntries_ClearingFirm) :: (("Rule80A",mod_rule80a_opt_to_json x.mod_f_ClearingEntries_Rule80A) :: (("ClientID",string_opt_to_json x.mod_f_ClearingEntries_ClientID) :: (("ClearingHandlingType",mod_clearinghandlingtype_opt_to_json x.mod_f_ClearingEntries_ClearingHandlingType) :: []))))))))
    )
;;

let mod_clearingentries_to_json (d)  =
    `Assoc (("4",model_ClearingEntries_rg_to_json d.rg_ClearingEntries_element_4) :: (("3",model_ClearingEntries_rg_to_json d.rg_ClearingEntries_element_3) :: (("2",model_ClearingEntries_rg_to_json d.rg_ClearingEntries_element_2) :: (("1",model_ClearingEntries_rg_to_json d.rg_ClearingEntries_element_1) :: (("0",model_ClearingEntries_rg_to_json d.rg_ClearingEntries_element_0) :: (("NoClearingEntries",int_opt_to_json d.mod_f_ClearingEntries_NoClearingEntries) :: []))))))
;;

let model_ContraGrp_rg_to_json (y)  : json =
    (match y with
        | None -> `Null
        | Some x -> (assoc_filter_nulls (("ContraTradeQty",float_4_opt_to_json x.mod_f_ContraGrp_ContraTradeQty) :: (("ContraTrader",string_opt_to_json x.mod_f_ContraGrp_ContraTrader) :: (("ContraLegRefID",string_opt_to_json x.mod_f_ContraGrp_ContraLegRefID) :: (("ContraBroker",string_opt_to_json x.mod_f_ContraGrp_ContraBroker) :: (("ContraTradeTime",utctimestamp_opt_to_json x.mod_f_ContraGrp_ContraTradeTime) :: []))))))
    )
;;

let mod_contragrp_to_json (d)  =
    `Assoc (("4",model_ContraGrp_rg_to_json d.rg_ContraGrp_element_4) :: (("3",model_ContraGrp_rg_to_json d.rg_ContraGrp_element_3) :: (("2",model_ContraGrp_rg_to_json d.rg_ContraGrp_element_2) :: (("1",model_ContraGrp_rg_to_json d.rg_ContraGrp_element_1) :: (("0",model_ContraGrp_rg_to_json d.rg_ContraGrp_element_0) :: (("NoContraBrokers",int_opt_to_json d.mod_f_ContraGrp_NoContraBrokers) :: []))))))
;;

let model_PtysSubGrp_rg_to_json (y)  : json =
    (match y with
        | None -> `Null
        | Some x -> (assoc_filter_nulls (("PartySubIDType",mod_partysubidtype_opt_to_json x.mod_f_PtysSubGrp_PartySubIDType) :: (("PartySubID",string_opt_to_json x.mod_f_PtysSubGrp_PartySubID) :: [])))
    )
;;

let mod_ptyssubgrp_to_json (d)  =
    `Assoc (("4",model_PtysSubGrp_rg_to_json d.rg_PtysSubGrp_element_4) :: (("3",model_PtysSubGrp_rg_to_json d.rg_PtysSubGrp_element_3) :: (("2",model_PtysSubGrp_rg_to_json d.rg_PtysSubGrp_element_2) :: (("1",model_PtysSubGrp_rg_to_json d.rg_PtysSubGrp_element_1) :: (("0",model_PtysSubGrp_rg_to_json d.rg_PtysSubGrp_element_0) :: (("NoPartySubIDs",int_opt_to_json d.mod_f_PtysSubGrp_NoPartySubIDs) :: []))))))
;;

let model_Parties_rg_to_json (y)  : json =
    (match y with
        | None -> `Null
        | Some x -> (assoc_filter_nulls (("PartyIDSource",mod_partyidsource_opt_to_json x.mod_f_Parties_PartyIDSource) :: (("PartyRoleQualifier",mod_partyrolequalifier_opt_to_json x.mod_f_Parties_PartyRoleQualifier) :: (("PtysSubGrp",mod_ptyssubgrp_to_json x.mod_f_Parties_PtysSubGrp) :: (("PartyID",string_opt_to_json x.mod_f_Parties_PartyID) :: (("PartyRole",mod_partyrole_opt_to_json x.mod_f_Parties_PartyRole) :: []))))))
    )
;;

let mod_parties_to_json (d)  =
    `Assoc (("4",model_Parties_rg_to_json d.rg_Parties_element_4) :: (("3",model_Parties_rg_to_json d.rg_Parties_element_3) :: (("2",model_Parties_rg_to_json d.rg_Parties_element_2) :: (("1",model_Parties_rg_to_json d.rg_Parties_element_1) :: (("0",model_Parties_rg_to_json d.rg_Parties_element_0) :: (("NoPartyIDs",int_opt_to_json d.mod_f_Parties_NoPartyIDs) :: []))))))
;;
