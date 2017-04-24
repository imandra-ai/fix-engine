(* @meta[imandra_ignore] on @end *)
open Yojson;;
open Full_app_records;;
open Base_types_json;;
open Datetime_json;;
open Full_app_enums_json;;
(* @meta[imandra_ignore] off @end *)

let assoc_filter_nulls l : json =
    `Assoc ( List.filter (function ( _, `Null ) -> false | _ -> true ) l )
;;

let instrument_to_json x : json = 
    assoc_filter_nulls
    [ ( "IssueDate"    , localmktdate_opt_to_json x.f_Instrument_IssueDate    )
    ; ( "Issuer"       , string_opt_to_json       x.f_Instrument_Issuer       )
    ; ( "SecurityType" , securitytype_opt_to_json x.f_Instrument_SecurityType )
    ; ( "Symbol"       , string_opt_to_json       x.f_Instrument_Symbol       )
    ; ( "SymbolSfx"    , string_opt_to_json       x.f_Instrument_SymbolSfx    )
    ] 
;;

