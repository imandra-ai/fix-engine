(* Aesthetic Integration copyright 2017 *)
(* @meta[imandra_ignore] on @end *)
 open Base_types;;
 open Model_app_enums;;
 open Model_messages;;
 open Msg_check_types;;
 open State;;
(* @meta[imandra_ignore] off @end *)

let check_fields_ExecutionReport ( msg_data , m_state : mod_executionreport_data * model_state ) =
    fields_are_good
;;

let check_field_mod_f_NewOrderSingle_Side ( msg_data : mod_newordersingle_data ) =
    if ((&&) ((||) ((||) ((=) msg_data.mod_f_NewOrderSingle_Side MOD_FIX_Side_Buy) ((=) msg_data.mod_f_NewOrderSingle_Side MOD_FIX_Side_Sell)) ((=) msg_data.mod_f_NewOrderSingle_Side MOD_FIX_Side_SellShort)) true) then
        fields_are_good
    else
        (field_invalid (Model_string 8))
;;

let check_fields_NewOrderSingle ( msg_data , m_state : mod_newordersingle_data * model_state ) =
    let mod_f_NewOrderSingle_Side_result = check_field_mod_f_NewOrderSingle_Side (msg_data) in
    if mod_f_NewOrderSingle_Side_result.is_invalid then
        mod_f_NewOrderSingle_Side_result
    else
        fields_are_good
;;
