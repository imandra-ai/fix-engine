(* Aesthetic Integration copyright 2017 *)
(* @meta[imandra_ignore] on @end *)
 open Base_types;;
 open Full_app_messages;;
 open Model_enum_names;;
 open Model_messages;;
 open String_constant_factory_for_model;;
 open Type_converter;;
(* @meta[imandra_ignore] off @end *)

let model_string_to_string_constant ( f , msgin : fix_string * full_app_msg_data ) =
    let msg = convert_full_to_model_fix msgin in
    model_string_to_string_constant_model (f,msg)
;;

let string_constant_to_model_string ( f , msgin : string * full_app_msg_data ) =
    let msg = convert_full_to_model_fix msgin in
    string_constant_model_string_from_model (f,msg)
;;

let all_model_strings ( msgin : full_app_msg_data ) =
    let msg = convert_full_to_model_fix msgin in
    (match msg with
        | FIX_TL_Normal msg -> ((Model_string 8,("The validity condition, \"valid when it in [Side.Buy, Side.Sell, SellShort] \", is violated for value \""^(match msg with
            | FIX_Msg_NewOrderSingle msg_data -> (mod_side_to_string msg_data.mod_f_NewOrderSingle_Side)
            | _ -> ""
        )
        ^"\".")) :: ((Model_string 2,"None") :: ((Model_string 1,"Test") :: [])))
        | FIX_TL_Req_Field_Missing _ -> ((Model_string 7,"The field \"Instrument.Symbol\" is required but missing.") :: ((Model_string 6,"The field \"OrdType\" is required but missing.") :: ((Model_string 5,"The field \"TransactTime\" is required but missing.") :: ((Model_string 4,"The field \"Side\" is required but missing.") :: ((Model_string 3,"The field \"ClOrdID\" is required but missing.") :: ((Model_string 2,"None") :: ((Model_string 1,"Test") :: [])))))))
        | _ -> []
    )
;;
