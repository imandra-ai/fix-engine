(** 

    Aesthetic Integration Limited
    Copyright 2014 - 2017


    fix_fields.ml

*)

(* @meta[imandra_ignore] on @end *)
open Basic_types;;
open Datetime;;
(* @meta[imandra_ignore] off @end *)


let init_field_ClOrdID          = 1;;
let init_field_HandlInst        = FIX_HandlInst_Manual;;
let init_field_TransactTime     = {
    utc_timestamp_year          = 0;
    utc_timestamp_month         = 0;
    utc_timestamp_day           = 0;
    utc_timestamp_hour          = 0;
    utc_timestamp_minute        = 0;
    utc_timestamp_second        = 0;
    uts_timestamp_millisec      = None;
};;
let init_field_Symbol           = 1;;
let init_field_SymbolSfx        = 1;;
let init_field_Side             = FIX_Side_Buy;;
let init_field_OrderQty         = Float_0 { fix_float_whole = 0; fix_float_fraction = 0 };;
let init_field_OrdType          = FIX_OrderType_Limit;;
let init_field_TimeInForce      = FIX_TimeInForce_Day;;
let init_field_Currency         = GBP;;
let init_field_OrigClOrdID      = 1;;
let init_field_Price            = Float_0 { fix_float_whole = 0; fix_float_fraction = 0 };;
let init_field_ExecInst         = FIX_ExecInst_MidpointPeg;;
let init_field_MinQty           = Float_0 { fix_float_whole = 0; fix_float_fraction = 0 };;
let init_field_LocateReqd       = false;;
let init_field_LocateBroker     = 1;;
let init_field_OrderID          = 1;;


type fix_field = 
    | FIX_Field_OrigClOrdID     of fix_string
    | FIX_Field_OrderID         of fix_string
    | FIX_Field_ClOrdID         of fix_string
    | FIX_Field_ExecType        of fix_exectype
    | FIX_Field_ExecID          of fix_string
    | FIX_Field_Account         of fix_string
    | FIX_Field_Side            of fix_side
    | FIX_Field_OrdType         of fix_ordertype
    | FIX_Field_OrdStatus       of fix_ordstatus
    | FIX_Field_AvgPx           of fix_float
    | FIX_Field_Price           of fix_float
    | FIX_Field_LeavesQty       of fix_float
    | FIX_Field_CumQty          of fix_float
    | FIX_Field_OrderQty        of fix_float
    | FIX_Field_MinQty          of fix_float
    | FIX_Field_HandlInst       of fix_handlinst
    | FIX_Field_TransactTime    of fix_utctimestamp
    | FIX_Field_Symbol          of fix_symbol
    | FIX_Field_SymbolSfx       of fix_string
    | FIX_Field_TimeInForce     of fix_timeinforce
    | FIX_Field_Currency        of fix_currency
    | FIX_Field_LocateBroker    of fix_string
    | FIX_Field_LocateReqd      of fix_bool
    | FIX_Field_ExecInst        of fix_execinst
;;

(** This is used when the actual field data is not needed. *)
type fix_field_tag =
    | FIX_Field_OrigClOrdID_Tag
    | FIX_Field_OrderID_Tag
    | FIX_Field_ClOrdID_Tag
    | FIX_Field_ExecType_Tag
    | FIX_Field_ExecID_Tag
    | FIX_Field_Account_Tag
    | FIX_Field_Side_Tag
    | FIX_Field_OrdType_Tag
    | FIX_Field_OrdStatus_Tag
    | FIX_Field_AvgPx_Tag
    | FIX_Field_Price_Tag
    | FIX_Field_LeavesQty_Tag
    | FIX_Field_CumQty_Tag
    | FIX_Field_OrderQty_Tag
    | FIX_Field_MinQty_Tag
    | FIX_Field_HandlInst_Tag
    | FIX_Field_TransactTime_Tag
    | FIX_Field_Symbol_Tag
    | FIX_Field_SymbolSfx_Tag
    | FIX_Field_TimeInForce_Tag
    | FIX_Field_Currency_Tag 
    | FIX_Field_LocateBroker_Tag
    | FIX_Field_LocateReqd_Tag
    | FIX_Field_ExecInst_Tag
;;