(* Aesthetic Integration copyright 2018 *)
open Base_types_json;;
open Datetime_json;;
open Json_generator_utils;;
open Model_enums_json;;
open Model_repeating_groups;;
open Yojson;;

let model_PtysSubGrp_rg_to_json (y)  : json =
    (match y with
        | None -> `Null
        | Some x -> (assoc_filter_nulls (("PartySubID",string_opt_to_json x.mod_f_PtysSubGrp_PartySubID) :: (("PartySubIDType",mod_partysubidtype_opt_to_json x.mod_f_PtysSubGrp_PartySubIDType) :: [])))
    )
;;

let mod_ptyssubgrp_to_json (d)  =
    `Assoc (("4",model_PtysSubGrp_rg_to_json d.rg_PtysSubGrp_element_4) :: (("3",model_PtysSubGrp_rg_to_json d.rg_PtysSubGrp_element_3) :: (("2",model_PtysSubGrp_rg_to_json d.rg_PtysSubGrp_element_2) :: (("1",model_PtysSubGrp_rg_to_json d.rg_PtysSubGrp_element_1) :: (("0",model_PtysSubGrp_rg_to_json d.rg_PtysSubGrp_element_0) :: (("NoPartySubIDs",int_opt_to_json d.mod_f_PtysSubGrp_NoPartySubIDs) :: []))))))
;;

let model_ContraGrp_rg_to_json (y)  : json =
    (match y with
        | None -> `Null
        | Some x -> (assoc_filter_nulls (("ContraBroker",string_opt_to_json x.mod_f_ContraGrp_ContraBroker) :: (("ContraTrader",string_opt_to_json x.mod_f_ContraGrp_ContraTrader) :: (("ContraTradeQty",float_4_opt_to_json x.mod_f_ContraGrp_ContraTradeQty) :: (("ContraTradeTime",utctimestamp_opt_to_json x.mod_f_ContraGrp_ContraTradeTime) :: (("ContraLegRefID",string_opt_to_json x.mod_f_ContraGrp_ContraLegRefID) :: []))))))
    )
;;

let mod_contragrp_to_json (d)  =
    `Assoc (("4",model_ContraGrp_rg_to_json d.rg_ContraGrp_element_4) :: (("3",model_ContraGrp_rg_to_json d.rg_ContraGrp_element_3) :: (("2",model_ContraGrp_rg_to_json d.rg_ContraGrp_element_2) :: (("1",model_ContraGrp_rg_to_json d.rg_ContraGrp_element_1) :: (("0",model_ContraGrp_rg_to_json d.rg_ContraGrp_element_0) :: (("NoContraBrokers",int_opt_to_json d.mod_f_ContraGrp_NoContraBrokers) :: []))))))
;;

let model_ClearingEntries_rg_to_json (y)  : json =
    (match y with
        | None -> `Null
        | Some x -> (assoc_filter_nulls (("Rule80A",mod_rule80a_opt_to_json x.mod_f_ClearingEntries_Rule80A) :: (("Account",string_opt_to_json x.mod_f_ClearingEntries_Account) :: (("ClientID",string_opt_to_json x.mod_f_ClearingEntries_ClientID) :: (("FreeText",string_opt_to_json x.mod_f_ClearingEntries_FreeText) :: (("ClearingFirm",string_opt_to_json x.mod_f_ClearingEntries_ClearingFirm) :: (("OpenClose",mod_openclose_opt_to_json x.mod_f_ClearingEntries_OpenClose) :: (("ClearingHandlingType",mod_clearinghandlingtype_opt_to_json x.mod_f_ClearingEntries_ClearingHandlingType) :: []))))))))
    )
;;

let mod_clearingentries_to_json (d)  =
    `Assoc (("4",model_ClearingEntries_rg_to_json d.rg_ClearingEntries_element_4) :: (("3",model_ClearingEntries_rg_to_json d.rg_ClearingEntries_element_3) :: (("2",model_ClearingEntries_rg_to_json d.rg_ClearingEntries_element_2) :: (("1",model_ClearingEntries_rg_to_json d.rg_ClearingEntries_element_1) :: (("0",model_ClearingEntries_rg_to_json d.rg_ClearingEntries_element_0) :: (("NoClearingEntries",int_opt_to_json d.mod_f_ClearingEntries_NoClearingEntries) :: []))))))
;;

let model_Parties_rg_to_json (y)  : json =
    (match y with
        | None -> `Null
        | Some x -> (assoc_filter_nulls (("PartyID",string_opt_to_json x.mod_f_Parties_PartyID) :: (("PartyIDSource",mod_partyidsource_opt_to_json x.mod_f_Parties_PartyIDSource) :: (("PartyRole",mod_partyrole_opt_to_json x.mod_f_Parties_PartyRole) :: (("PtysSubGrp",mod_ptyssubgrp_to_json x.mod_f_Parties_PtysSubGrp) :: (("PartyRoleQualifier",mod_partyrolequalifier_opt_to_json x.mod_f_Parties_PartyRoleQualifier) :: []))))))
    )
;;

let mod_parties_to_json (d)  =
    `Assoc (("4",model_Parties_rg_to_json d.rg_Parties_element_4) :: (("3",model_Parties_rg_to_json d.rg_Parties_element_3) :: (("2",model_Parties_rg_to_json d.rg_Parties_element_2) :: (("1",model_Parties_rg_to_json d.rg_Parties_element_1) :: (("0",model_Parties_rg_to_json d.rg_Parties_element_0) :: (("NoPartyIDs",int_opt_to_json d.mod_f_Parties_NoPartyIDs) :: []))))))
;;
