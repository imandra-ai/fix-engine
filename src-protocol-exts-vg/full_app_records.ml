
(***

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017
    
    full_app_records.ml

*)


(* @meta[imandra_ignore] on @end *)
open Base_types;;
open Numeric;;
open Datetime;;
open Full_app_enums;;
open Full_app_tags;;
(* @meta[imandra_ignore] off @end *)


type fix_instrument = {
    f_Instrument_IssueDate    : fix_localmktdate option;
    f_Instrument_Issuer       : fix_string option;
    f_Instrument_SecurityType : fix_securitytype option;
    f_Instrument_Symbol       : fix_string option;
    f_Instrument_SymbolSfx    : fix_string option;
}
;;


let init_fix_instrument = {
    f_Instrument_IssueDate    = None;
    f_Instrument_Issuer       = None;
    f_Instrument_SecurityType = None;
    f_Instrument_Symbol       = None;
    f_Instrument_SymbolSfx    = None;
}
;;
