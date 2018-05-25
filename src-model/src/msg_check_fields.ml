(* Aesthetic Integration copyright 2018 *)
open Model_app_enums;;
open Model_messages;;
open Msg_check_types;;
open State;;

let check_field_mod_f_NewOrderSingle_Side_inner0 (msg_data : mod_newordersingle_data)  =
    if ((||) ((||) ((=) msg_data.mod_f_NewOrderSingle_Side MOD_FIX_Side_Buy) ((=) msg_data.mod_f_NewOrderSingle_Side MOD_FIX_Side_Sell)) ((=) msg_data.mod_f_NewOrderSingle_Side MOD_FIX_Side_SellShort)) then
        fields_are_good
    else
        (field_invalid "Field Side of Message NewOrderSingle violates the constraint: \" it in [Side.Buy, Side.Sell, SellShort]\"")
;;

let check_field_mod_f_NewOrderSingle_Side_outer (msg_data : mod_newordersingle_data)  =
    let check_field_mod_f_NewOrderSingle_Side_inner0_result = check_field_mod_f_NewOrderSingle_Side_inner0 msg_data in
    if check_field_mod_f_NewOrderSingle_Side_inner0_result.is_invalid then
        check_field_mod_f_NewOrderSingle_Side_inner0_result
    else
        fields_are_good
;;

let check_field_mod_f_NewOrderSingle_Side (msg_data : mod_newordersingle_data)  =
    check_field_mod_f_NewOrderSingle_Side_outer msg_data
;;

let check_fields_NewOrderSingle (msg_data : mod_newordersingle_data) (m_state : model_state)  =
    let mod_f_NewOrderSingle_Side_result = check_field_mod_f_NewOrderSingle_Side msg_data in
    if mod_f_NewOrderSingle_Side_result.is_invalid then
        mod_f_NewOrderSingle_Side_result
    else
        fields_are_good
;;
