(* Aesthetic Integration copyright 2017 *)
(* @meta[imandra_ignore] on @end *)
 open Base_types;;
 open Model_enum_names;;
 open Model_messages;;
 open Yojson;;
(* @meta[imandra_ignore] off @end *)

let model_string_to_string_constant_model ( f , msg : fix_string * model_top_level_msg ) =
    (match msg with
        | FIX_TL_Normal msg -> ((match f with
            | Model_string 1 -> "Test"
            | Model_string 2 -> "None"
            | Model_string 8 -> ("The validity condition, \"valid when it in [Side.Buy, Side.Sell, SellShort] \", is violated for value \""^(match msg with
                | FIX_Msg_NewOrderSingle msg_data -> (mod_side_to_string msg_data.mod_f_NewOrderSingle_Side)
                | _ -> ""
            )
            ^"\".")
            | _ -> ""
        )
        )
        | FIX_TL_Req_Field_Missing _ -> ((match f with
            | Model_string 1 -> "Test"
            | Model_string 2 -> "None"
            | Model_string 3 -> "The field \"ClOrdID\" is required but missing."
            | Model_string 4 -> "The field \"Side\" is required but missing."
            | Model_string 5 -> "The field \"TransactTime\" is required but missing."
            | Model_string 6 -> "The field \"OrdType\" is required but missing."
            | Model_string 7 -> "The field \"Instrument.Symbol\" is required but missing."
            | _ -> ""
        )
        )
        | _ -> ""
    )
;;

let model_string_to_string_constant_for_region ( f : fix_string ) =
    (match f with
        | Model_string 1 -> "Test"
        | Model_string 2 -> "None"
        | Model_string 3 -> "The field \"ClOrdID\" is required but missing."
        | Model_string 4 -> "The field \"Side\" is required but missing."
        | Model_string 5 -> "The field \"TransactTime\" is required but missing."
        | Model_string 6 -> "The field \"OrdType\" is required but missing."
        | Model_string 7 -> "The field \"Instrument.Symbol\" is required but missing."
        | Model_string 8 -> "The validity condition, \"valid when it in [Side.Buy, Side.Sell, SellShort] \", is violated for value X for field f_NewOrderSingle_Side of message NewOrderSingle."
        | _ -> ""
    )
;;

let string_constant_model_string_from_model ( f , msg : string * model_top_level_msg ) =
    (match msg with
        | FIX_TL_Normal msg -> (if ((=) f ("The validity condition, \"valid when it in [Side.Buy, Side.Sell, SellShort] \", is violated for value \""^(match msg with
            | FIX_Msg_NewOrderSingle msg_data -> (mod_side_to_string msg_data.mod_f_NewOrderSingle_Side)
            | _ -> ""
        )
        ^"\".")) then
            (Some (Model_string 8))
        else
            (if ((=) f "None") then
                (Some (Model_string 2))
            else
                (if ((=) f "Test") then
                    (Some (Model_string 1))
                else
                    None
                )
            )
        )
        | FIX_TL_Req_Field_Missing _ -> (if ((=) f "The field \"Instrument.Symbol\" is required but missing.") then
            (Some (Model_string 7))
        else
            (if ((=) f "The field \"OrdType\" is required but missing.") then
                (Some (Model_string 6))
            else
                (if ((=) f "The field \"TransactTime\" is required but missing.") then
                    (Some (Model_string 5))
                else
                    (if ((=) f "The field \"Side\" is required but missing.") then
                        (Some (Model_string 4))
                    else
                        (if ((=) f "The field \"ClOrdID\" is required but missing.") then
                            (Some (Model_string 3))
                        else
                            (if ((=) f "None") then
                                (Some (Model_string 2))
                            else
                                (if ((=) f "Test") then
                                    (Some (Model_string 1))
                                else
                                    None
                                )
                            )
                        )
                    )
                )
            )
        )
        | _ -> None
    )
;;

let model_string_to_json_for_region ( x : fix_string ) : json =
    `String (model_string_to_string_constant_for_region x)
;;

let model_string_opt_to_json_for_region ( x : fix_string option ) : json =
    (match x with
        | None -> `Null
        | Some d -> (model_string_to_json_for_region d)
    )
;;
