(* Aesthetic Integration copyright 2018 *)
open Datetime;;
open Model_app_enums;;
open Numeric;;

type model_fix_inner_clearingentries = {
    mod_f_ClearingEntries_Account : string option;
    mod_f_ClearingEntries_FreeText : string option;
    mod_f_ClearingEntries_OpenClose : model_fix_openclose option;
    mod_f_ClearingEntries_ClearingFirm : string option;
    mod_f_ClearingEntries_Rule80A : model_fix_rule80a option;
    mod_f_ClearingEntries_ClientID : string option;
    mod_f_ClearingEntries_ClearingHandlingType : model_fix_clearinghandlingtype option
}
;;

type model_fix_rec_clearingentries = {
    mod_f_ClearingEntries_NoClearingEntries : int option;
    rg_ClearingEntries_element_0 : model_fix_inner_clearingentries option;
    rg_ClearingEntries_element_1 : model_fix_inner_clearingentries option;
    rg_ClearingEntries_element_2 : model_fix_inner_clearingentries option;
    rg_ClearingEntries_element_3 : model_fix_inner_clearingentries option;
    rg_ClearingEntries_element_4 : model_fix_inner_clearingentries option
}
;;

type model_fix_inner_ptyssubgrp = {
    mod_f_PtysSubGrp_PartySubIDType : model_fix_partysubidtype option;
    mod_f_PtysSubGrp_PartySubID : string option
}
;;

type model_fix_rec_ptyssubgrp = {
    mod_f_PtysSubGrp_NoPartySubIDs : int option;
    rg_PtysSubGrp_element_0 : model_fix_inner_ptyssubgrp option;
    rg_PtysSubGrp_element_1 : model_fix_inner_ptyssubgrp option;
    rg_PtysSubGrp_element_2 : model_fix_inner_ptyssubgrp option;
    rg_PtysSubGrp_element_3 : model_fix_inner_ptyssubgrp option;
    rg_PtysSubGrp_element_4 : model_fix_inner_ptyssubgrp option
}
;;

type model_fix_inner_contragrp = {
    mod_f_ContraGrp_ContraTradeQty : fix_float_6 option;
    mod_f_ContraGrp_ContraTrader : string option;
    mod_f_ContraGrp_ContraLegRefID : string option;
    mod_f_ContraGrp_ContraBroker : string option;
    mod_f_ContraGrp_ContraTradeTime : fix_utctimestamp option
}
;;

type model_fix_rec_contragrp = {
    mod_f_ContraGrp_NoContraBrokers : int option;
    rg_ContraGrp_element_0 : model_fix_inner_contragrp option;
    rg_ContraGrp_element_1 : model_fix_inner_contragrp option;
    rg_ContraGrp_element_2 : model_fix_inner_contragrp option;
    rg_ContraGrp_element_3 : model_fix_inner_contragrp option;
    rg_ContraGrp_element_4 : model_fix_inner_contragrp option
}
;;

type model_fix_inner_parties = {
    mod_f_Parties_PartyIDSource : model_fix_partyidsource option;
    mod_f_Parties_PartyRoleQualifier : model_fix_partyrolequalifier option;
    mod_f_Parties_PtysSubGrp : model_fix_rec_ptyssubgrp;
    mod_f_Parties_PartyID : string option;
    mod_f_Parties_PartyRole : model_fix_partyrole option
}
;;

type model_fix_rec_parties = {
    mod_f_Parties_NoPartyIDs : int option;
    rg_Parties_element_0 : model_fix_inner_parties option;
    rg_Parties_element_1 : model_fix_inner_parties option;
    rg_Parties_element_2 : model_fix_inner_parties option;
    rg_Parties_element_3 : model_fix_inner_parties option;
    rg_Parties_element_4 : model_fix_inner_parties option
}
;;
