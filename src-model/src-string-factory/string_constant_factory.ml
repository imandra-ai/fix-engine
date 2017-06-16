(* @meta[imandra_ignore] on @end *)
open Full_app_enums_json;;
open Base_types;;
open Full_app_messages;;
open Type_converter;;
open Model_messages;;
open Enum_converter;;
open Core_printer;;
(* @meta[imandra_ignore] off @end *)

let model_string_to_string_constant ( f , msg : fix_string * full_app_msg_data ) =
    let msg = convert_full_to_model_fix msg in
    (match msg with
        | FIX_TL_Normal msg -> ((match f with
            | Model_string 1 -> "Test"
            | Model_string 2 -> "None"
            | Model_string 18 -> ("The validity condition, \"valid when it in [Side.Buy, Side.Sell, SellShort] \", is violated for value \""^(match msg with
                | FIX_Msg_NewOrderSingle msg_data -> (side_to_string (convert__model_to_full_Side msg_data.f_NewOrderSingle_Side))
                | _ -> ""
            )
            ^"\".")
            | Model_string 19 -> ("The validity condition, \"valid when it > 0.0 \", is violated for value \""^(match msg with
                | FIX_Msg_NewOrderSingle msg_data -> (fix_float_to_string msg_data.f_NewOrderSingle_Price)
                | _ -> ""
            )
            ^"\".")
            | _ -> ""
        )
        )
        | FIX_TL_Req_Field_Missing _ -> ((match f with
            | Model_string 3 -> "The field \"ExecutionReport.OrderID\" is required but missing."
            | Model_string 4 -> "The field \"ExecutionReport.ExecID\" is required but missing."
            | Model_string 5 -> "The field \"ExecutionReport.ExecType\" is required but missing."
            | Model_string 6 -> "The field \"ExecutionReport.AvgPx\" is required but missing."
            | Model_string 7 -> "The field \"ExecutionReport.Side\" is required but missing."
            | Model_string 8 -> "The field \"ExecutionReport.LeavesQty\" is required but missing."
            | Model_string 9 -> "The field \"ExecutionReport.CumQty\" is required but missing."
            | Model_string 10 -> "The field \"ExecutionReport.OrdStatus\" is required but missing."
            | Model_string 11 -> "The field \"ExecutionReport.Instrument.Symbol\" is required but missing."
            | Model_string 12 -> "The field \"NewOrderSingle.ClOrdID\" is required but missing."
            | Model_string 13 -> "The field \"NewOrderSingle.Side\" is required but missing."
            | Model_string 14 -> "The field \"NewOrderSingle.Price\" is required but missing."
            | Model_string 15 -> "The field \"NewOrderSingle.TransactTime\" is required but missing."
            | Model_string 16 -> "The field \"NewOrderSingle.OrdType\" is required but missing."
            | Model_string 17 -> "The field \"NewOrderSingle.Instrument.Symbol\" is required but missing."
            | _ -> ""
        )
        )
        | _ -> ""
    )
;;

let string_constant_to_model_string ( f , msg : string * full_app_msg_data ) =
    let msg = convert_full_to_model_fix msg in
    (match msg with
        | FIX_TL_Normal msg -> (if ((=) f ("The validity condition, \"valid when it > 0.0 \", is violated for value \""^(match msg with
            | FIX_Msg_NewOrderSingle msg_data -> (fix_float_to_string msg_data.f_NewOrderSingle_Price)
            | _ -> ""
        )
        ^"\".")) then
            (Some (Model_string 19))
        else
            (if ((=) f ("The validity condition, \"valid when it in [Side.Buy, Side.Sell, SellShort] \", is violated for value \""^(match msg with
                | FIX_Msg_NewOrderSingle msg_data -> (side_to_string (convert__model_to_full_Side msg_data.f_NewOrderSingle_Side))
                | _ -> ""
            )
            ^"\".")) then
                (Some (Model_string 18))
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
        | FIX_TL_Req_Field_Missing _ -> (if ((=) f "The field \"NewOrderSingle.Instrument.Symbol\" is required but missing.") then
            (Some (Model_string 17))
        else
            (if ((=) f "The field \"NewOrderSingle.OrdType\" is required but missing.") then
                (Some (Model_string 16))
            else
                (if ((=) f "The field \"NewOrderSingle.TransactTime\" is required but missing.") then
                    (Some (Model_string 15))
                else
                    (if ((=) f "The field \"NewOrderSingle.Price\" is required but missing.") then
                        (Some (Model_string 14))
                    else
                        (if ((=) f "The field \"NewOrderSingle.Side\" is required but missing.") then
                            (Some (Model_string 13))
                        else
                            (if ((=) f "The field \"NewOrderSingle.ClOrdID\" is required but missing.") then
                                (Some (Model_string 12))
                            else
                                (if ((=) f "The field \"ExecutionReport.Instrument.Symbol\" is required but missing.") then
                                    (Some (Model_string 11))
                                else
                                    (if ((=) f "The field \"ExecutionReport.OrdStatus\" is required but missing.") then
                                        (Some (Model_string 10))
                                    else
                                        (if ((=) f "The field \"ExecutionReport.CumQty\" is required but missing.") then
                                            (Some (Model_string 9))
                                        else
                                            (if ((=) f "The field \"ExecutionReport.LeavesQty\" is required but missing.") then
                                                (Some (Model_string 8))
                                            else
                                                (if ((=) f "The field \"ExecutionReport.Side\" is required but missing.") then
                                                    (Some (Model_string 7))
                                                else
                                                    (if ((=) f "The field \"ExecutionReport.AvgPx\" is required but missing.") then
                                                        (Some (Model_string 6))
                                                    else
                                                        (if ((=) f "The field \"ExecutionReport.ExecType\" is required but missing.") then
                                                            (Some (Model_string 5))
                                                        else
                                                            (if ((=) f "The field \"ExecutionReport.ExecID\" is required but missing.") then
                                                                (Some (Model_string 4))
                                                            else
                                                                (if ((=) f "The field \"ExecutionReport.OrderID\" is required but missing.") then
                                                                    (Some (Model_string 3))
                                                                else
                                                                    None
                                                                )
                                                            )
                                                        )
                                                    )
                                                )
                                            )
                                        )
                                    )
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

let all_model_strings ( msg : full_app_msg_data ) =
    let msg = convert_full_to_model_fix msg in
    (match msg with
        | FIX_TL_Normal msg -> ((Model_string 19,("The validity condition, \"valid when it > 0.0 \", is violated for value \""^(match msg with
            | FIX_Msg_NewOrderSingle msg_data -> (fix_float_to_string msg_data.f_NewOrderSingle_Price)
            | _ -> ""
        )
        ^"\".")) :: ((Model_string 18,("The validity condition, \"valid when it in [Side.Buy, Side.Sell, SellShort] \", is violated for value \""^(match msg with
            | FIX_Msg_NewOrderSingle msg_data -> (side_to_string (convert__model_to_full_Side msg_data.f_NewOrderSingle_Side))
            | _ -> ""
        )
        ^"\".")) :: ((Model_string 2,"None") :: ((Model_string 1,"Test") :: []))))
        | FIX_TL_Req_Field_Missing _ -> ((Model_string 17,"The field \"NewOrderSingle.Instrument.Symbol\" is required but missing.") :: ((Model_string 16,"The field \"NewOrderSingle.OrdType\" is required but missing.") :: ((Model_string 15,"The field \"NewOrderSingle.TransactTime\" is required but missing.") :: ((Model_string 14,"The field \"NewOrderSingle.Price\" is required but missing.") :: ((Model_string 13,"The field \"NewOrderSingle.Side\" is required but missing.") :: ((Model_string 12,"The field \"NewOrderSingle.ClOrdID\" is required but missing.") :: ((Model_string 11,"The field \"ExecutionReport.Instrument.Symbol\" is required but missing.") :: ((Model_string 10,"The field \"ExecutionReport.OrdStatus\" is required but missing.") :: ((Model_string 9,"The field \"ExecutionReport.CumQty\" is required but missing.") :: ((Model_string 8,"The field \"ExecutionReport.LeavesQty\" is required but missing.") :: ((Model_string 7,"The field \"ExecutionReport.Side\" is required but missing.") :: ((Model_string 6,"The field \"ExecutionReport.AvgPx\" is required but missing.") :: ((Model_string 5,"The field \"ExecutionReport.ExecType\" is required but missing.") :: ((Model_string 4,"The field \"ExecutionReport.ExecID\" is required but missing.") :: ((Model_string 3,"The field \"ExecutionReport.OrderID\" is required but missing.") :: (Model_string 2,"None") :: (Model_string 1,"Test") :: [])))))))))))))))
    )
;;
