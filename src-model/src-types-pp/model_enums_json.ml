(* Aesthetic Integration copyright 2018 *)
open Model_enum_names;;
open Yojson;;

let mod_currency_to_json (d)  : json =
    `String (mod_currency_to_string d)
;;

let mod_ordstatus_to_json (d)  : json =
    `String (mod_ordstatus_to_string d)
;;

let mod_liquidityindicator_to_json (d)  : json =
    `String (mod_liquidityindicator_to_string d)
;;

let mod_handlinst_to_json (d)  : json =
    `String (mod_handlinst_to_string d)
;;

let mod_exectype_to_json (d)  : json =
    `String (mod_exectype_to_string d)
;;

let mod_clearinghandlingtype_to_json (d)  : json =
    `String (mod_clearinghandlingtype_to_string d)
;;

let mod_rule80a_to_json (d)  : json =
    `String (mod_rule80a_to_string d)
;;

let mod_partyidsource_to_json (d)  : json =
    `String (mod_partyidsource_to_string d)
;;

let mod_brokerprioritization_to_json (d)  : json =
    `String (mod_brokerprioritization_to_string d)
;;

let mod_execinst_to_json (d)  : json =
    `String (mod_execinst_to_string d)
;;

let mod_exectranstype_to_json (d)  : json =
    `String (mod_exectranstype_to_string d)
;;

let mod_cxlrejreason_to_json (d)  : json =
    `String (mod_cxlrejreason_to_string d)
;;

let mod_ordtype_to_json (d)  : json =
    `String (mod_ordtype_to_string d)
;;

let mod_technicalordtype_to_json (d)  : json =
    `String (mod_technicalordtype_to_string d)
;;

let mod_bookindicator_to_json (d)  : json =
    `String (mod_bookindicator_to_string d)
;;

let mod_orderattributetypes_to_json (d)  : json =
    `String (mod_orderattributetypes_to_string d)
;;

let mod_ordrejreason_to_json (d)  : json =
    `String (mod_ordrejreason_to_string d)
;;

let mod_side_to_json (d)  : json =
    `String (mod_side_to_string d)
;;

let mod_masscancelrequesttype_to_json (d)  : json =
    `String (mod_masscancelrequesttype_to_string d)
;;

let mod_cxlrejresponseto_to_json (d)  : json =
    `String (mod_cxlrejresponseto_to_string d)
;;

let mod_partyrolequalifier_to_json (d)  : json =
    `String (mod_partyrolequalifier_to_string d)
;;

let mod_timeinforce_to_json (d)  : json =
    `String (mod_timeinforce_to_string d)
;;

let mod_openclose_to_json (d)  : json =
    `String (mod_openclose_to_string d)
;;

let mod_partysubidtype_to_json (d)  : json =
    `String (mod_partysubidtype_to_string d)
;;

let mod_crosstype_to_json (d)  : json =
    `String (mod_crosstype_to_string d)
;;

let mod_partyrole_to_json (d)  : json =
    `String (mod_partyrole_to_string d)
;;

let mod_currency_opt_to_json (d)  : json =
    (match d with
        | None -> (`Null)
        | Some d -> (mod_currency_to_json d)
    )
;;

let mod_ordstatus_opt_to_json (d)  : json =
    (match d with
        | None -> (`Null)
        | Some d -> (mod_ordstatus_to_json d)
    )
;;

let mod_liquidityindicator_opt_to_json (d)  : json =
    (match d with
        | None -> (`Null)
        | Some d -> (mod_liquidityindicator_to_json d)
    )
;;

let mod_handlinst_opt_to_json (d)  : json =
    (match d with
        | None -> (`Null)
        | Some d -> (mod_handlinst_to_json d)
    )
;;

let mod_exectype_opt_to_json (d)  : json =
    (match d with
        | None -> (`Null)
        | Some d -> (mod_exectype_to_json d)
    )
;;

let mod_clearinghandlingtype_opt_to_json (d)  : json =
    (match d with
        | None -> (`Null)
        | Some d -> (mod_clearinghandlingtype_to_json d)
    )
;;

let mod_rule80a_opt_to_json (d)  : json =
    (match d with
        | None -> (`Null)
        | Some d -> (mod_rule80a_to_json d)
    )
;;

let mod_partyidsource_opt_to_json (d)  : json =
    (match d with
        | None -> (`Null)
        | Some d -> (mod_partyidsource_to_json d)
    )
;;

let mod_brokerprioritization_opt_to_json (d)  : json =
    (match d with
        | None -> (`Null)
        | Some d -> (mod_brokerprioritization_to_json d)
    )
;;

let mod_execinst_opt_to_json (d)  : json =
    (match d with
        | None -> (`Null)
        | Some d -> (mod_execinst_to_json d)
    )
;;

let mod_exectranstype_opt_to_json (d)  : json =
    (match d with
        | None -> (`Null)
        | Some d -> (mod_exectranstype_to_json d)
    )
;;

let mod_cxlrejreason_opt_to_json (d)  : json =
    (match d with
        | None -> (`Null)
        | Some d -> (mod_cxlrejreason_to_json d)
    )
;;

let mod_ordtype_opt_to_json (d)  : json =
    (match d with
        | None -> (`Null)
        | Some d -> (mod_ordtype_to_json d)
    )
;;

let mod_technicalordtype_opt_to_json (d)  : json =
    (match d with
        | None -> (`Null)
        | Some d -> (mod_technicalordtype_to_json d)
    )
;;

let mod_bookindicator_opt_to_json (d)  : json =
    (match d with
        | None -> (`Null)
        | Some d -> (mod_bookindicator_to_json d)
    )
;;

let mod_orderattributetypes_opt_to_json (d)  : json =
    (match d with
        | None -> (`Null)
        | Some d -> (mod_orderattributetypes_to_json d)
    )
;;

let mod_ordrejreason_opt_to_json (d)  : json =
    (match d with
        | None -> (`Null)
        | Some d -> (mod_ordrejreason_to_json d)
    )
;;

let mod_side_opt_to_json (d)  : json =
    (match d with
        | None -> (`Null)
        | Some d -> (mod_side_to_json d)
    )
;;

let mod_masscancelrequesttype_opt_to_json (d)  : json =
    (match d with
        | None -> (`Null)
        | Some d -> (mod_masscancelrequesttype_to_json d)
    )
;;

let mod_cxlrejresponseto_opt_to_json (d)  : json =
    (match d with
        | None -> (`Null)
        | Some d -> (mod_cxlrejresponseto_to_json d)
    )
;;

let mod_partyrolequalifier_opt_to_json (d)  : json =
    (match d with
        | None -> (`Null)
        | Some d -> (mod_partyrolequalifier_to_json d)
    )
;;

let mod_timeinforce_opt_to_json (d)  : json =
    (match d with
        | None -> (`Null)
        | Some d -> (mod_timeinforce_to_json d)
    )
;;

let mod_openclose_opt_to_json (d)  : json =
    (match d with
        | None -> (`Null)
        | Some d -> (mod_openclose_to_json d)
    )
;;

let mod_partysubidtype_opt_to_json (d)  : json =
    (match d with
        | None -> (`Null)
        | Some d -> (mod_partysubidtype_to_json d)
    )
;;

let mod_crosstype_opt_to_json (d)  : json =
    (match d with
        | None -> (`Null)
        | Some d -> (mod_crosstype_to_json d)
    )
;;

let mod_partyrole_opt_to_json (d)  : json =
    (match d with
        | None -> (`Null)
        | Some d -> (mod_partyrole_to_json d)
    )
;;
