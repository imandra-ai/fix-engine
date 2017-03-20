(** Full fields tags. *)
(***

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    model_fix_fields.ml

*)

(* @meta[imandra_ignore] on @end *)
open Base_types;;
open Datetime;;
(* @meta[imandra_ignore] off @end *)

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