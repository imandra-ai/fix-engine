(* Aesthetic Integration copyright 2018 *)
open Enum_converter;;
open Full_app_records;;
open Imandra_utils;;
open Model_repeating_groups;;
open Model_tags;;

exception Ipl_rg_exception 
type rg_reject_type =
    | RG_Failure of m_field_tag
    | RG_Success 
;;

let rec cap_length (d) (x) (h)  =
    (match d with
        | [] -> (min x h)
        | _ :: t -> (cap_length t ((+) x 1) h)
    )
;;

let rec map_convert__model_to_full_RG_ContraGrp (d) (x)  =
    (match d with
        | [] -> []
        | h :: t -> ((convert__model_to_full_RG_ContraGrp h x) :: (map_convert__model_to_full_RG_ContraGrp t x))
    ) and 
convert__model_to_full_RG_ContraGrp (rec_in : model_fix_inner_contragrp) (len : int)  =
    {
        f_ContraGrp_ContraTradeQty = rec_in.mod_f_ContraGrp_ContraTradeQty;
        f_ContraGrp_ContraTrader = rec_in.mod_f_ContraGrp_ContraTrader;
        f_ContraGrp_ContraLegRefID = rec_in.mod_f_ContraGrp_ContraLegRefID;
        f_ContraGrp_ContraBroker = rec_in.mod_f_ContraGrp_ContraBroker;
        f_ContraGrp_ContraTradeTime = rec_in.mod_f_ContraGrp_ContraTradeTime;
        f_ContraGrp_NoContraBrokers = Some len
    } and 
convert__model_to_full_ContraGrp (rec_in : model_fix_rec_contragrp)  =
    let d = [] in
    let d = (match rec_in.rg_ContraGrp_element_0 with
        | None -> d
        | Some x -> (x :: d)
    )
     in
    let d = (match rec_in.rg_ContraGrp_element_1 with
        | None -> d
        | Some x -> (x :: d)
    )
     in
    let d = (match rec_in.rg_ContraGrp_element_2 with
        | None -> d
        | Some x -> (x :: d)
    )
     in
    let d = (match rec_in.rg_ContraGrp_element_3 with
        | None -> d
        | Some x -> (x :: d)
    )
     in
    let d = (match rec_in.rg_ContraGrp_element_4 with
        | None -> d
        | Some x -> (x :: d)
    )
     in
    map_convert__model_to_full_RG_ContraGrp d (cap_length d 0 5)
;;

let rec convert__full_to_model_ContraGrp (rec_in : fix_rg_contragrp)  =
    let block4 = None in
    let block3 = None in
    let block2 = None in
    let block1 = None in
    let block0 = None in
    let t = rec_in in
    (match t with
        | [] -> {
            mod_f_ContraGrp_NoContraBrokers = Some (cap_length rec_in 0 5);
            rg_ContraGrp_element_4 = block4;
            rg_ContraGrp_element_3 = block3;
            rg_ContraGrp_element_2 = block2;
            rg_ContraGrp_element_1 = block1;
            rg_ContraGrp_element_0 = block0
        }
        | h :: t -> let block0 = Some (convert__full_to_model_RG_ContraGrp h) in
        (match t with
            | [] -> {
                mod_f_ContraGrp_NoContraBrokers = Some (cap_length rec_in 0 5);
                rg_ContraGrp_element_4 = block4;
                rg_ContraGrp_element_3 = block3;
                rg_ContraGrp_element_2 = block2;
                rg_ContraGrp_element_1 = block1;
                rg_ContraGrp_element_0 = block0
            }
            | h :: t -> let block1 = Some (convert__full_to_model_RG_ContraGrp h) in
            (match t with
                | [] -> {
                    mod_f_ContraGrp_NoContraBrokers = Some (cap_length rec_in 0 5);
                    rg_ContraGrp_element_4 = block4;
                    rg_ContraGrp_element_3 = block3;
                    rg_ContraGrp_element_2 = block2;
                    rg_ContraGrp_element_1 = block1;
                    rg_ContraGrp_element_0 = block0
                }
                | h :: t -> let block2 = Some (convert__full_to_model_RG_ContraGrp h) in
                (match t with
                    | [] -> {
                        mod_f_ContraGrp_NoContraBrokers = Some (cap_length rec_in 0 5);
                        rg_ContraGrp_element_4 = block4;
                        rg_ContraGrp_element_3 = block3;
                        rg_ContraGrp_element_2 = block2;
                        rg_ContraGrp_element_1 = block1;
                        rg_ContraGrp_element_0 = block0
                    }
                    | h :: t -> let block3 = Some (convert__full_to_model_RG_ContraGrp h) in
                    (match t with
                        | [] -> {
                            mod_f_ContraGrp_NoContraBrokers = Some (cap_length rec_in 0 5);
                            rg_ContraGrp_element_4 = block4;
                            rg_ContraGrp_element_3 = block3;
                            rg_ContraGrp_element_2 = block2;
                            rg_ContraGrp_element_1 = block1;
                            rg_ContraGrp_element_0 = block0
                        }
                        | h :: t -> let block4 = Some (convert__full_to_model_RG_ContraGrp h) in
                        {
                            mod_f_ContraGrp_NoContraBrokers = Some (cap_length rec_in 0 5);
                            rg_ContraGrp_element_4 = block4;
                            rg_ContraGrp_element_3 = block3;
                            rg_ContraGrp_element_2 = block2;
                            rg_ContraGrp_element_1 = block1;
                            rg_ContraGrp_element_0 = block0
                        }
                    )
                )
            )
        )
    ) and 
convert__full_to_model_RG_ContraGrp (rec_in : fix_rg_inner_contragrp)  =
    {
        mod_f_ContraGrp_ContraTradeQty = rec_in.f_ContraGrp_ContraTradeQty;
        mod_f_ContraGrp_ContraTrader = rec_in.f_ContraGrp_ContraTrader;
        mod_f_ContraGrp_ContraLegRefID = rec_in.f_ContraGrp_ContraLegRefID;
        mod_f_ContraGrp_ContraBroker = rec_in.f_ContraGrp_ContraBroker;
        mod_f_ContraGrp_ContraTradeTime = rec_in.f_ContraGrp_ContraTradeTime
    }
;;

let check_convert_full_to_model_RG_ContraGrp (rec_in : fix_rg_inner_contragrp)  =
    RG_Success
;;

let rec check_convert_full_to_model__ContraGrp (rec_in : fix_rg_contragrp)  =
    (match rec_in with
        | [] -> RG_Success
        | x :: y -> ((match check_convert_full_to_model_RG_ContraGrp x with
            | RG_Success -> (check_convert_full_to_model__ContraGrp y)
            | f -> f
        )
        )
    )
;;

let rec map_convert__model_to_full_RG_PtysSubGrp (d) (x)  =
    (match d with
        | [] -> []
        | h :: t -> ((convert__model_to_full_RG_PtysSubGrp h x) :: (map_convert__model_to_full_RG_PtysSubGrp t x))
    ) and 
convert__model_to_full_RG_PtysSubGrp (rec_in : model_fix_inner_ptyssubgrp) (len : int)  =
    {
        f_PtysSubGrp_PartySubIDType = (match rec_in.mod_f_PtysSubGrp_PartySubIDType with
            | None -> None
            | Some x -> (Some (convert__model_to_full_PartySubIDType x))
        );
        f_PtysSubGrp_PartySubID = rec_in.mod_f_PtysSubGrp_PartySubID;
        f_PtysSubGrp_NoPartySubIDs = Some len
    } and 
convert__model_to_full_PtysSubGrp (rec_in : model_fix_rec_ptyssubgrp)  =
    let d = [] in
    let d = (match rec_in.rg_PtysSubGrp_element_0 with
        | None -> d
        | Some x -> (x :: d)
    )
     in
    let d = (match rec_in.rg_PtysSubGrp_element_1 with
        | None -> d
        | Some x -> (x :: d)
    )
     in
    let d = (match rec_in.rg_PtysSubGrp_element_2 with
        | None -> d
        | Some x -> (x :: d)
    )
     in
    let d = (match rec_in.rg_PtysSubGrp_element_3 with
        | None -> d
        | Some x -> (x :: d)
    )
     in
    let d = (match rec_in.rg_PtysSubGrp_element_4 with
        | None -> d
        | Some x -> (x :: d)
    )
     in
    map_convert__model_to_full_RG_PtysSubGrp d (cap_length d 0 5)
;;

let rec convert__full_to_model_PtysSubGrp (rec_in : fix_rg_ptyssubgrp)  =
    let block4 = None in
    let block3 = None in
    let block2 = None in
    let block1 = None in
    let block0 = None in
    let t = rec_in in
    (match t with
        | [] -> {
            mod_f_PtysSubGrp_NoPartySubIDs = Some (cap_length rec_in 0 5);
            rg_PtysSubGrp_element_4 = block4;
            rg_PtysSubGrp_element_3 = block3;
            rg_PtysSubGrp_element_2 = block2;
            rg_PtysSubGrp_element_1 = block1;
            rg_PtysSubGrp_element_0 = block0
        }
        | h :: t -> let block0 = Some (convert__full_to_model_RG_PtysSubGrp h) in
        (match t with
            | [] -> {
                mod_f_PtysSubGrp_NoPartySubIDs = Some (cap_length rec_in 0 5);
                rg_PtysSubGrp_element_4 = block4;
                rg_PtysSubGrp_element_3 = block3;
                rg_PtysSubGrp_element_2 = block2;
                rg_PtysSubGrp_element_1 = block1;
                rg_PtysSubGrp_element_0 = block0
            }
            | h :: t -> let block1 = Some (convert__full_to_model_RG_PtysSubGrp h) in
            (match t with
                | [] -> {
                    mod_f_PtysSubGrp_NoPartySubIDs = Some (cap_length rec_in 0 5);
                    rg_PtysSubGrp_element_4 = block4;
                    rg_PtysSubGrp_element_3 = block3;
                    rg_PtysSubGrp_element_2 = block2;
                    rg_PtysSubGrp_element_1 = block1;
                    rg_PtysSubGrp_element_0 = block0
                }
                | h :: t -> let block2 = Some (convert__full_to_model_RG_PtysSubGrp h) in
                (match t with
                    | [] -> {
                        mod_f_PtysSubGrp_NoPartySubIDs = Some (cap_length rec_in 0 5);
                        rg_PtysSubGrp_element_4 = block4;
                        rg_PtysSubGrp_element_3 = block3;
                        rg_PtysSubGrp_element_2 = block2;
                        rg_PtysSubGrp_element_1 = block1;
                        rg_PtysSubGrp_element_0 = block0
                    }
                    | h :: t -> let block3 = Some (convert__full_to_model_RG_PtysSubGrp h) in
                    (match t with
                        | [] -> {
                            mod_f_PtysSubGrp_NoPartySubIDs = Some (cap_length rec_in 0 5);
                            rg_PtysSubGrp_element_4 = block4;
                            rg_PtysSubGrp_element_3 = block3;
                            rg_PtysSubGrp_element_2 = block2;
                            rg_PtysSubGrp_element_1 = block1;
                            rg_PtysSubGrp_element_0 = block0
                        }
                        | h :: t -> let block4 = Some (convert__full_to_model_RG_PtysSubGrp h) in
                        {
                            mod_f_PtysSubGrp_NoPartySubIDs = Some (cap_length rec_in 0 5);
                            rg_PtysSubGrp_element_4 = block4;
                            rg_PtysSubGrp_element_3 = block3;
                            rg_PtysSubGrp_element_2 = block2;
                            rg_PtysSubGrp_element_1 = block1;
                            rg_PtysSubGrp_element_0 = block0
                        }
                    )
                )
            )
        )
    ) and 
convert__full_to_model_RG_PtysSubGrp (rec_in : fix_rg_inner_ptyssubgrp)  =
    {
        mod_f_PtysSubGrp_PartySubIDType = (match rec_in.f_PtysSubGrp_PartySubIDType with
            | None -> None
            | Some x -> (Some (convert__full_to_model_PartySubIDType x))
        );
        mod_f_PtysSubGrp_PartySubID = rec_in.f_PtysSubGrp_PartySubID
    }
;;

let check_convert_full_to_model_RG_PtysSubGrp (rec_in : fix_rg_inner_ptyssubgrp)  =
    RG_Success
;;

let rec check_convert_full_to_model__PtysSubGrp (rec_in : fix_rg_ptyssubgrp)  =
    (match rec_in with
        | [] -> RG_Success
        | x :: y -> ((match check_convert_full_to_model_RG_PtysSubGrp x with
            | RG_Success -> (check_convert_full_to_model__PtysSubGrp y)
            | f -> f
        )
        )
    )
;;

let rec map_convert__model_to_full_RG_ClearingEntries (d) (x)  =
    (match d with
        | [] -> []
        | h :: t -> ((convert__model_to_full_RG_ClearingEntries h x) :: (map_convert__model_to_full_RG_ClearingEntries t x))
    ) and 
convert__model_to_full_RG_ClearingEntries (rec_in : model_fix_inner_clearingentries) (len : int)  =
    {
        f_ClearingEntries_Account = rec_in.mod_f_ClearingEntries_Account;
        f_ClearingEntries_FreeText = rec_in.mod_f_ClearingEntries_FreeText;
        f_ClearingEntries_OpenClose = (match rec_in.mod_f_ClearingEntries_OpenClose with
            | None -> None
            | Some x -> (Some (convert__model_to_full_OpenClose x))
        );
        f_ClearingEntries_ClearingFirm = rec_in.mod_f_ClearingEntries_ClearingFirm;
        f_ClearingEntries_Rule80A = (match rec_in.mod_f_ClearingEntries_Rule80A with
            | None -> None
            | Some x -> (Some (convert__model_to_full_Rule80A x))
        );
        f_ClearingEntries_ClientID = rec_in.mod_f_ClearingEntries_ClientID;
        f_ClearingEntries_ClearingHandlingType = (match rec_in.mod_f_ClearingEntries_ClearingHandlingType with
            | None -> None
            | Some x -> (Some (convert__model_to_full_ClearingHandlingType x))
        );
        f_ClearingEntries_NoClearingEntries = Some len
    } and 
convert__model_to_full_ClearingEntries (rec_in : model_fix_rec_clearingentries)  =
    let d = [] in
    let d = (match rec_in.rg_ClearingEntries_element_0 with
        | None -> d
        | Some x -> (x :: d)
    )
     in
    let d = (match rec_in.rg_ClearingEntries_element_1 with
        | None -> d
        | Some x -> (x :: d)
    )
     in
    let d = (match rec_in.rg_ClearingEntries_element_2 with
        | None -> d
        | Some x -> (x :: d)
    )
     in
    let d = (match rec_in.rg_ClearingEntries_element_3 with
        | None -> d
        | Some x -> (x :: d)
    )
     in
    let d = (match rec_in.rg_ClearingEntries_element_4 with
        | None -> d
        | Some x -> (x :: d)
    )
     in
    map_convert__model_to_full_RG_ClearingEntries d (cap_length d 0 5)
;;

let rec convert__full_to_model_ClearingEntries (rec_in : fix_rg_clearingentries)  =
    let block4 = None in
    let block3 = None in
    let block2 = None in
    let block1 = None in
    let block0 = None in
    let t = rec_in in
    (match t with
        | [] -> {
            mod_f_ClearingEntries_NoClearingEntries = Some (cap_length rec_in 0 5);
            rg_ClearingEntries_element_4 = block4;
            rg_ClearingEntries_element_3 = block3;
            rg_ClearingEntries_element_2 = block2;
            rg_ClearingEntries_element_1 = block1;
            rg_ClearingEntries_element_0 = block0
        }
        | h :: t -> let block0 = Some (convert__full_to_model_RG_ClearingEntries h) in
        (match t with
            | [] -> {
                mod_f_ClearingEntries_NoClearingEntries = Some (cap_length rec_in 0 5);
                rg_ClearingEntries_element_4 = block4;
                rg_ClearingEntries_element_3 = block3;
                rg_ClearingEntries_element_2 = block2;
                rg_ClearingEntries_element_1 = block1;
                rg_ClearingEntries_element_0 = block0
            }
            | h :: t -> let block1 = Some (convert__full_to_model_RG_ClearingEntries h) in
            (match t with
                | [] -> {
                    mod_f_ClearingEntries_NoClearingEntries = Some (cap_length rec_in 0 5);
                    rg_ClearingEntries_element_4 = block4;
                    rg_ClearingEntries_element_3 = block3;
                    rg_ClearingEntries_element_2 = block2;
                    rg_ClearingEntries_element_1 = block1;
                    rg_ClearingEntries_element_0 = block0
                }
                | h :: t -> let block2 = Some (convert__full_to_model_RG_ClearingEntries h) in
                (match t with
                    | [] -> {
                        mod_f_ClearingEntries_NoClearingEntries = Some (cap_length rec_in 0 5);
                        rg_ClearingEntries_element_4 = block4;
                        rg_ClearingEntries_element_3 = block3;
                        rg_ClearingEntries_element_2 = block2;
                        rg_ClearingEntries_element_1 = block1;
                        rg_ClearingEntries_element_0 = block0
                    }
                    | h :: t -> let block3 = Some (convert__full_to_model_RG_ClearingEntries h) in
                    (match t with
                        | [] -> {
                            mod_f_ClearingEntries_NoClearingEntries = Some (cap_length rec_in 0 5);
                            rg_ClearingEntries_element_4 = block4;
                            rg_ClearingEntries_element_3 = block3;
                            rg_ClearingEntries_element_2 = block2;
                            rg_ClearingEntries_element_1 = block1;
                            rg_ClearingEntries_element_0 = block0
                        }
                        | h :: t -> let block4 = Some (convert__full_to_model_RG_ClearingEntries h) in
                        {
                            mod_f_ClearingEntries_NoClearingEntries = Some (cap_length rec_in 0 5);
                            rg_ClearingEntries_element_4 = block4;
                            rg_ClearingEntries_element_3 = block3;
                            rg_ClearingEntries_element_2 = block2;
                            rg_ClearingEntries_element_1 = block1;
                            rg_ClearingEntries_element_0 = block0
                        }
                    )
                )
            )
        )
    ) and 
convert__full_to_model_RG_ClearingEntries (rec_in : fix_rg_inner_clearingentries)  =
    {
        mod_f_ClearingEntries_Account = rec_in.f_ClearingEntries_Account;
        mod_f_ClearingEntries_FreeText = rec_in.f_ClearingEntries_FreeText;
        mod_f_ClearingEntries_OpenClose = (match rec_in.f_ClearingEntries_OpenClose with
            | None -> None
            | Some x -> (Some (convert__full_to_model_OpenClose x))
        );
        mod_f_ClearingEntries_ClearingFirm = rec_in.f_ClearingEntries_ClearingFirm;
        mod_f_ClearingEntries_Rule80A = (match rec_in.f_ClearingEntries_Rule80A with
            | None -> None
            | Some x -> (Some (convert__full_to_model_Rule80A x))
        );
        mod_f_ClearingEntries_ClientID = rec_in.f_ClearingEntries_ClientID;
        mod_f_ClearingEntries_ClearingHandlingType = (match rec_in.f_ClearingEntries_ClearingHandlingType with
            | None -> None
            | Some x -> (Some (convert__full_to_model_ClearingHandlingType x))
        )
    }
;;

let check_convert_full_to_model_RG_ClearingEntries (rec_in : fix_rg_inner_clearingentries)  =
    RG_Success
;;

let rec check_convert_full_to_model__ClearingEntries (rec_in : fix_rg_clearingentries)  =
    (match rec_in with
        | [] -> RG_Success
        | x :: y -> ((match check_convert_full_to_model_RG_ClearingEntries x with
            | RG_Success -> (check_convert_full_to_model__ClearingEntries y)
            | f -> f
        )
        )
    )
;;

let rec map_convert__model_to_full_RG_Parties (d) (x)  =
    (match d with
        | [] -> []
        | h :: t -> ((convert__model_to_full_RG_Parties h x) :: (map_convert__model_to_full_RG_Parties t x))
    ) and 
convert__model_to_full_RG_Parties (rec_in : model_fix_inner_parties) (len : int)  =
    {
        f_Parties_PartyIDSource = (match rec_in.mod_f_Parties_PartyIDSource with
            | None -> None
            | Some x -> (Some (convert__model_to_full_PartyIDSource x))
        );
        f_Parties_PartyRoleQualifier = (match rec_in.mod_f_Parties_PartyRoleQualifier with
            | None -> None
            | Some x -> (Some (convert__model_to_full_PartyRoleQualifier x))
        );
        f_Parties_PtysSubGrp = convert__model_to_full_PtysSubGrp rec_in.mod_f_Parties_PtysSubGrp;
        f_Parties_PartyID = rec_in.mod_f_Parties_PartyID;
        f_Parties_PartyRole = (match rec_in.mod_f_Parties_PartyRole with
            | None -> None
            | Some x -> (Some (convert__model_to_full_PartyRole x))
        );
        f_Parties_NoPartyIDs = Some len
    } and 
convert__model_to_full_Parties (rec_in : model_fix_rec_parties)  =
    let d = [] in
    let d = (match rec_in.rg_Parties_element_0 with
        | None -> d
        | Some x -> (x :: d)
    )
     in
    let d = (match rec_in.rg_Parties_element_1 with
        | None -> d
        | Some x -> (x :: d)
    )
     in
    let d = (match rec_in.rg_Parties_element_2 with
        | None -> d
        | Some x -> (x :: d)
    )
     in
    let d = (match rec_in.rg_Parties_element_3 with
        | None -> d
        | Some x -> (x :: d)
    )
     in
    let d = (match rec_in.rg_Parties_element_4 with
        | None -> d
        | Some x -> (x :: d)
    )
     in
    map_convert__model_to_full_RG_Parties d (cap_length d 0 5)
;;

let rec convert__full_to_model_Parties (rec_in : fix_rg_parties)  =
    let block4 = None in
    let block3 = None in
    let block2 = None in
    let block1 = None in
    let block0 = None in
    let t = rec_in in
    (match t with
        | [] -> {
            mod_f_Parties_NoPartyIDs = Some (cap_length rec_in 0 5);
            rg_Parties_element_4 = block4;
            rg_Parties_element_3 = block3;
            rg_Parties_element_2 = block2;
            rg_Parties_element_1 = block1;
            rg_Parties_element_0 = block0
        }
        | h :: t -> let block0 = Some (convert__full_to_model_RG_Parties h) in
        (match t with
            | [] -> {
                mod_f_Parties_NoPartyIDs = Some (cap_length rec_in 0 5);
                rg_Parties_element_4 = block4;
                rg_Parties_element_3 = block3;
                rg_Parties_element_2 = block2;
                rg_Parties_element_1 = block1;
                rg_Parties_element_0 = block0
            }
            | h :: t -> let block1 = Some (convert__full_to_model_RG_Parties h) in
            (match t with
                | [] -> {
                    mod_f_Parties_NoPartyIDs = Some (cap_length rec_in 0 5);
                    rg_Parties_element_4 = block4;
                    rg_Parties_element_3 = block3;
                    rg_Parties_element_2 = block2;
                    rg_Parties_element_1 = block1;
                    rg_Parties_element_0 = block0
                }
                | h :: t -> let block2 = Some (convert__full_to_model_RG_Parties h) in
                (match t with
                    | [] -> {
                        mod_f_Parties_NoPartyIDs = Some (cap_length rec_in 0 5);
                        rg_Parties_element_4 = block4;
                        rg_Parties_element_3 = block3;
                        rg_Parties_element_2 = block2;
                        rg_Parties_element_1 = block1;
                        rg_Parties_element_0 = block0
                    }
                    | h :: t -> let block3 = Some (convert__full_to_model_RG_Parties h) in
                    (match t with
                        | [] -> {
                            mod_f_Parties_NoPartyIDs = Some (cap_length rec_in 0 5);
                            rg_Parties_element_4 = block4;
                            rg_Parties_element_3 = block3;
                            rg_Parties_element_2 = block2;
                            rg_Parties_element_1 = block1;
                            rg_Parties_element_0 = block0
                        }
                        | h :: t -> let block4 = Some (convert__full_to_model_RG_Parties h) in
                        {
                            mod_f_Parties_NoPartyIDs = Some (cap_length rec_in 0 5);
                            rg_Parties_element_4 = block4;
                            rg_Parties_element_3 = block3;
                            rg_Parties_element_2 = block2;
                            rg_Parties_element_1 = block1;
                            rg_Parties_element_0 = block0
                        }
                    )
                )
            )
        )
    ) and 
convert__full_to_model_RG_Parties (rec_in : fix_rg_inner_parties)  =
    {
        mod_f_Parties_PartyIDSource = (match rec_in.f_Parties_PartyIDSource with
            | None -> None
            | Some x -> (Some (convert__full_to_model_PartyIDSource x))
        );
        mod_f_Parties_PartyRoleQualifier = (match rec_in.f_Parties_PartyRoleQualifier with
            | None -> None
            | Some x -> (Some (convert__full_to_model_PartyRoleQualifier x))
        );
        mod_f_Parties_PtysSubGrp = convert__full_to_model_PtysSubGrp rec_in.f_Parties_PtysSubGrp;
        mod_f_Parties_PartyID = rec_in.f_Parties_PartyID;
        mod_f_Parties_PartyRole = (match rec_in.f_Parties_PartyRole with
            | None -> None
            | Some x -> (Some (convert__full_to_model_PartyRole x))
        )
    }
;;

let check_convert_full_to_model_RG_Parties (rec_in : fix_rg_inner_parties)  =
    (match check_convert_full_to_model__PtysSubGrp rec_in.f_Parties_PtysSubGrp with
        | RG_Success -> RG_Success
        | f -> f
    )
;;

let rec check_convert_full_to_model__Parties (rec_in : fix_rg_parties)  =
    (match rec_in with
        | [] -> RG_Success
        | x :: y -> ((match check_convert_full_to_model_RG_Parties x with
            | RG_Success -> (check_convert_full_to_model__Parties y)
            | f -> f
        )
        )
    )
;;
