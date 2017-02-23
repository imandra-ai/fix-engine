(** 

    Aesthetic Integration Limited
    Copyright 2014 - 2017

    full_fix_fields.ml

*)

(* @meta[imandra_ignore] on @end *)
open Basic_types;;
open Datetime;;
(* @meta[imandra_ignore] off @end *)

(** This is used when the actual field data is not needed. *)
type full_fix_field =
    | Full_FIX_Field_OrigClOrdID
    | Full_FIX_Field_OrderID
    | Full_FIX_Field_ClOrdID
    | Full_FIX_Field_ExecType
    | Full_FIX_Field_ExecID
    | Full_FIX_Field_Account
    | Full_FIX_Field_Side
    | Full_FIX_Field_OrdType
    | Full_FIX_Field_OrdStatus
    | Full_FIX_Field_AvgPx
    | Full_FIX_Field_Price
    | Full_FIX_Field_LeavesQty
    | Full_FIX_Field_CumQty
    | Full_FIX_Field_OrderQty
    | Full_FIX_Field_MinQty
    | Full_FIX_Field_HandlInst
    | Full_FIX_Field_TransactTime
    | Full_FIX_Field_Symbol
    | Full_FIX_Field_SymbolSfx
    | Full_FIX_Field_TimeInForce
    | Full_FIX_Field_Currency 
    | Full_FIX_Field_LocateBroker
    | Full_FIX_Field_LocateReqd
    | Full_FIX_Field_ExecInst
;;