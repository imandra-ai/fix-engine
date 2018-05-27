(* Aesthetic Integration copyright 2018 *)
open Actions ;;
open Model_enum_names;;
module J  = Yojson.Basic;;
module JU = Yojson.Basic.Util ;;

let jreq json key parser f =
  let v = JU.member key json in
  if v == `Null then None else 
  match parser v with
  | Some v -> f v  
  | None -> None
;;

let jopt json key parser f =
  let v = JU.member key json in
  if v == `Null then f None else 
  match parser v with
  | Some v -> f (Some v)  
  | None -> f None
;;


let json_to_model_string_opt = JU.to_string_option


let json_to_float_opt json =
  match JU.(json |> member "Precision" |> to_int_option ) with None -> None | Some precision ->
  match JU.(json |> member "Number"    |> to_int_option ) with None -> None | Some number ->
  match precision with
    | 4 -> Some ( Numeric.float_Create_4 (number * 1    ) )  
    | 3 -> Some ( Numeric.float_Create_4 (number * 10   ) )  
    | 2 -> Some ( Numeric.float_Create_4 (number * 100  ) )  
    | 1 -> Some ( Numeric.float_Create_4 (number * 1000 ) )  
    | 0 -> Some ( Numeric.float_Create_4 (number * 10000) )  
    | _ -> None
;;

let json_to_utctimestamp_opt json = 
  match JU.(json |> member "utc_timestamp_year"   |> to_int_option ) with None -> None | Some utc_timestamp_year    ->
  match JU.(json |> member "utc_timestamp_month"  |> to_int_option ) with None -> None | Some utc_timestamp_month   ->
  match JU.(json |> member "utc_timestamp_day"    |> to_int_option ) with None -> None | Some utc_timestamp_day     ->
  match JU.(json |> member "utc_timestamp_hour"   |> to_int_option ) with None -> None | Some utc_timestamp_hour    ->
  match JU.(json |> member "utc_timestamp_minute" |> to_int_option ) with None -> None | Some utc_timestamp_minute  ->
  match JU.(json |> member "utc_timestamp_second" |> to_int_option ) with None -> None | Some utc_timestamp_second  ->
  let utc_timestamp_millisec = JU.(json |> member "utc_timestamp_millisec" |> to_int_option ) in 
  Some Datetime.{ utc_timestamp_year   
  ; utc_timestamp_month  
  ; utc_timestamp_day    
  ; utc_timestamp_hour   
  ; utc_timestamp_minute 
  ; utc_timestamp_second 
  ; utc_timestamp_millisec
  }
;;

let js f (j : J.json) : 'a option =
  match j with 
  | `String s -> f s | _ -> None


let json_to_mod_act_neworder_option json =
  jreq json "ClOrdID"               json_to_model_string_opt                      @@ fun mod_f_neworder_ClOrdID              ->
  jreq json "Symbol"                json_to_model_string_opt                      @@ fun mod_f_neworder_Symbol               ->
  jreq json "Side"                  ( js string_to_mod_side_opt )                 @@ fun mod_f_neworder_Side                 ->
  jopt json "Price"                 json_to_float_opt                             @@ fun mod_f_neworder_Price                ->
  jreq json "OrderQty"              json_to_float_opt                             @@ fun mod_f_neworder_OrderQty             ->
  jreq json "OrdType"               ( js string_to_mod_ordtype_opt       )        @@ fun mod_f_neworder_OrdType              ->
  jopt json "TimeInForce"           ( js string_to_mod_timeinforce_opt   )        @@ fun mod_f_neworder_TimeInForce          ->
  jopt json "ExecInst"              ( js string_to_mod_execinst_opt      )        @@ fun mod_f_neworder_ExecInst             ->
  jopt json "BookIndicator"         ( js string_to_mod_bookindicator_opt )        @@ fun mod_f_neworder_BookIndicator        ->
  jopt json "MinQty"                json_to_float_opt                             @@ fun mod_f_neworder_MinQty               ->
  jreq json "TransactTime"          json_to_utctimestamp_opt                      @@ fun mod_f_neworder_TransactTime         -> 
  jopt json "PegDifference"         json_to_float_opt                             @@ fun mod_f_neworder_PegDifference        -> 
  jopt json "Currency"              ( js string_to_mod_currency_opt             ) @@ fun mod_f_neworder_Currency             -> 
  jreq json "HandlInst"             ( js string_to_mod_handlinst_opt            ) @@ fun mod_f_neworder_HandlInst            -> 
  jreq json "TechnicalOrdType"      ( js string_to_mod_technicalordtype_opt     ) @@ fun mod_f_neworder_TechnicalOrdType     -> 
  jopt json "OrderAttributeTypes"   ( js string_to_mod_orderattributetypes_opt  ) @@ fun mod_f_neworder_OrderAttributeTypes  ->
  jreq json "BrokerPrioritization"  ( js string_to_mod_brokerprioritization_opt ) @@ fun mod_f_neworder_BrokerPrioritization -> 
  jreq json "MIC"                   json_to_model_string_opt                      @@ fun mod_f_neworder_MIC                  -> 
  jreq json "DEAIndicator"          JU.to_int_option                              @@ fun mod_f_neworder_DEAIndicator         ->   
  Some 
  { mod_f_neworder_ClOrdID      
  ; mod_f_neworder_Symbol       
  ; mod_f_neworder_Side         
  ; mod_f_neworder_Price        
  ; mod_f_neworder_OrderQty     
  ; mod_f_neworder_OrdType      
  ; mod_f_neworder_TimeInForce  
  ; mod_f_neworder_ExecInst     
  ; mod_f_neworder_BookIndicator
  ; mod_f_neworder_MinQty     
  ; mod_f_neworder_TransactTime 
  ; mod_f_neworder_PegDifference
  ; mod_f_neworder_Currency
  ; mod_f_neworder_HandlInst
  ; mod_f_neworder_TechnicalOrdType
  ; mod_f_neworder_OrderAttributeTypes  
  ; mod_f_neworder_BrokerPrioritization 
  ; mod_f_neworder_MIC                  
  ; mod_f_neworder_Parties = 
    { mod_f_Parties_NoPartyIDs = Some 1
    ; rg_Parties_element_0 = Some 
      { mod_f_Parties_PartyID = Some "314159"
      ; mod_f_Parties_PartyIDSource = Some MOD_FIX_PartyIDSource_ShortCodeIdentifier 
      ; mod_f_Parties_PartyRole = Some MOD_FIX_PartyRole_ExecutingTrader 
      ; mod_f_Parties_PtysSubGrp = 
        { mod_f_PtysSubGrp_NoPartySubIDs = None
        ; rg_PtysSubGrp_element_0 = None
        ; rg_PtysSubGrp_element_1 = None
        ; rg_PtysSubGrp_element_2 = None
        ; rg_PtysSubGrp_element_3 = None
        ; rg_PtysSubGrp_element_4 = None
        }
      ; mod_f_Parties_PartyRoleQualifier = Some MOD_FIX_PartyRoleQualifier_Algorithm 
      }
    ; rg_Parties_element_1 = None 
    ; rg_Parties_element_2 = None 
    ; rg_Parties_element_3 = None 
    ; rg_Parties_element_4 = None 
    }
  ; mod_f_neworder_ClearingEntries =
    { mod_f_ClearingEntries_NoClearingEntries = Some 1
    ; rg_ClearingEntries_element_0 = Some 
      { mod_f_ClearingEntries_Rule80A = Some MOD_FIX_Rule80A_RisklessPrincipal 
      ; mod_f_ClearingEntries_Account = None 
      ; mod_f_ClearingEntries_ClientID = None 
      ; mod_f_ClearingEntries_FreeText = None 
      ; mod_f_ClearingEntries_ClearingFirm = None 
      ; mod_f_ClearingEntries_OpenClose = None 
      ; mod_f_ClearingEntries_ClearingHandlingType = None  
      }
    ; rg_ClearingEntries_element_1 = None
    ; rg_ClearingEntries_element_2 = None
    ; rg_ClearingEntries_element_3 = None
    ; rg_ClearingEntries_element_4 = None
    }
  ; mod_f_neworder_DEAIndicator
  }    
;;

let json_to_mod_act_cancel_option json =
  jopt json "OrderID"      json_to_model_string_opt          @@ fun mod_f_cancel_OrderID       ->
  jreq json "ClOrdID"      json_to_model_string_opt          @@ fun mod_f_cancel_ClOrdID       ->
  jreq json "OrigClOrdID"  json_to_model_string_opt          @@ fun mod_f_cancel_OrigClOrdID   ->
  jreq json "Symbol"       json_to_model_string_opt          @@ fun mod_f_cancel_Symbol        ->
  jopt json "OrderQty"     json_to_float_opt                 @@ fun mod_f_cancel_OrderQty      ->
  jopt json "TransactTime" json_to_utctimestamp_opt          @@ fun mod_f_cancel_TransactTime  ->
  jopt json "MIC"          json_to_model_string_opt          @@ fun mod_f_cancel_MIC           ->
  jopt json "Currency"     ( js string_to_mod_currency_opt ) @@ fun mod_f_cancel_Currency      ->
  Some
  { mod_f_cancel_OrderID      
  ; mod_f_cancel_ClOrdID      
  ; mod_f_cancel_OrigClOrdID  
  ; mod_f_cancel_Symbol       
  ; mod_f_cancel_OrderQty     
  ; mod_f_cancel_TransactTime 
  ; mod_f_cancel_MIC          
  ; mod_f_cancel_Currency     
  }
;;

let json_to_mod_act_cancelreplace_option json =
  jopt json "OrderID"              json_to_model_string_opt                      @@ fun mod_f_cancelreplace_OrderID              ->
  jreq json "ClOrdID"              json_to_model_string_opt                      @@ fun mod_f_cancelreplace_ClOrdID              ->
  jreq json "OrigClOrdID"          json_to_model_string_opt                      @@ fun mod_f_cancelreplace_OrigClOrdID          ->
  jreq json "Symbol"               json_to_model_string_opt                      @@ fun mod_f_cancelreplace_Symbol               ->
  jreq json "Side"                 ( js string_to_mod_side_opt                 ) @@ fun mod_f_cancelreplace_Side                 ->
  jreq json "OrdType"              ( js string_to_mod_ordtype_opt              ) @@ fun mod_f_cancelreplace_OrdType              ->
  jopt json "TimeInForce"          ( js string_to_mod_timeinforce_opt          ) @@ fun mod_f_cancelreplace_TimeInForce          ->
  jopt json "ExecInst"             ( js string_to_mod_execinst_opt             ) @@ fun mod_f_cancelreplace_ExecInst             ->
  jopt json "Price"                json_to_float_opt                             @@ fun mod_f_cancelreplace_Price                ->
  jreq json "OrderQty"             json_to_float_opt                             @@ fun mod_f_cancelreplace_OrderQty             ->
  jopt json "PegDifference"        json_to_float_opt                             @@ fun mod_f_cancelreplace_PegDifference        ->
  jopt json "TechnicalOrdType"     ( js string_to_mod_technicalordtype_opt     ) @@ fun mod_f_cancelreplace_TechnicalOrdType     ->
  jreq json "Rule80A"              ( js string_to_mod_rule80a_opt              ) @@ fun mod_f_cancelreplace_Rule80A              ->
  jopt json "Account"              json_to_model_string_opt                      @@ fun mod_f_cancelreplace_Account              ->
  jopt json "ClientID"             json_to_model_string_opt                      @@ fun mod_f_cancelreplace_ClientID             ->
  jopt json "FreeText"             json_to_model_string_opt                      @@ fun mod_f_cancelreplace_FreeText             ->
  jopt json "ClearingFirm"         json_to_model_string_opt                      @@ fun mod_f_cancelreplace_ClearingFirm         ->
  jopt json "OpenClose"            ( js string_to_mod_openclose_opt            ) @@ fun mod_f_cancelreplace_OpenClose            ->
  jopt json "ClearingHandlingType" ( js string_to_mod_clearinghandlingtype_opt ) @@ fun mod_f_cancelreplace_ClearingHandlingType ->
  jopt json "MIC"                  json_to_model_string_opt                      @@ fun mod_f_cancelreplace_MIC                  ->
  jopt json "Currency"             ( js string_to_mod_currency_opt             ) @@ fun mod_f_cancelreplace_Currency             ->
  Some 
  { mod_f_cancelreplace_OrderID              
  ; mod_f_cancelreplace_ClOrdID              
  ; mod_f_cancelreplace_OrigClOrdID          
  ; mod_f_cancelreplace_Symbol               
  ; mod_f_cancelreplace_Side                 
  ; mod_f_cancelreplace_OrdType              
  ; mod_f_cancelreplace_TimeInForce          
  ; mod_f_cancelreplace_ExecInst             
  ; mod_f_cancelreplace_Price                
  ; mod_f_cancelreplace_OrderQty             
  ; mod_f_cancelreplace_PegDifference        
  ; mod_f_cancelreplace_TechnicalOrdType     
  ; mod_f_cancelreplace_Rule80A              
  ; mod_f_cancelreplace_Account              
  ; mod_f_cancelreplace_ClientID             
  ; mod_f_cancelreplace_FreeText             
  ; mod_f_cancelreplace_ClearingFirm         
  ; mod_f_cancelreplace_OpenClose            
  ; mod_f_cancelreplace_ClearingHandlingType 
  ; mod_f_cancelreplace_MIC                  
  ; mod_f_cancelreplace_Currency             
  }
;;


let json_to_mod_act_masscancel_option json =
  jopt json "ClOrdID"               json_to_model_string_opt                       @@ fun mod_f_masscancel_ClOrdID               ->   
  jopt json "Symbol"                json_to_model_string_opt                       @@ fun mod_f_masscancel_Symbol                ->   
  jopt json "ClassID"               json_to_model_string_opt                       @@ fun mod_f_masscancel_ClassID               ->   
  jopt json "MassCancelRequestType" ( js string_to_mod_masscancelrequesttype_opt ) @@ fun mod_f_masscancel_MassCancelRequestType ->   
  jopt json "Side"                  ( js string_to_mod_side_opt                  ) @@ fun mod_f_masscancel_Side                  ->   
  jopt json "TechnicalOrdType"      ( js string_to_mod_technicalordtype_opt      ) @@ fun mod_f_masscancel_TechnicalOrdType      ->   
  jopt json "Rule80A"               ( js string_to_mod_rule80a_opt               ) @@ fun mod_f_masscancel_Rule80A               ->   
  jopt json "Account"               json_to_model_string_opt                       @@ fun mod_f_masscancel_Account               ->   
  jopt json "CancelByLocationID"    json_to_model_string_opt                       @@ fun mod_f_masscancel_CancelByLocationID    ->   
  jopt json "TransactTime"          json_to_utctimestamp_opt                       @@ fun mod_f_masscancel_TransactTime          ->   
  Some
  { mod_f_masscancel_ClOrdID              
  ; mod_f_masscancel_Symbol               
  ; mod_f_masscancel_ClassID              
  ; mod_f_masscancel_MassCancelRequestType
  ; mod_f_masscancel_Side                 
  ; mod_f_masscancel_TechnicalOrdType     
  ; mod_f_masscancel_Rule80A              
  ; mod_f_masscancel_Account              
  ; mod_f_masscancel_CancelByLocationID   
  ; mod_f_masscancel_TransactTime         
  }
;;



let json_to_fix_action json =
  let module JU = Yojson.Basic.Util in 
  let data =  JU.member "data" json in
  if data == `Null then None else
  match JU.member "tag" json |> JU.to_string_option with
  | Some "neworder" -> begin
    match json_to_mod_act_neworder_option data with 
    | Some data -> Some ( FIX_Action_neworder data )
    | None -> None  
  end
  | Some "cancel" -> begin
    match json_to_mod_act_cancel_option data with 
    | Some data -> Some ( FIX_Action_cancel data )
    | None -> None  
  end
  | Some "cancelreplace" -> begin
      match json_to_mod_act_cancelreplace_option data with 
      | Some data -> Some ( FIX_Action_cancelreplace data )
      | None -> None  
  end
  | Some "masscancel" -> begin
    match json_to_mod_act_masscancel_option data with 
    | Some data -> Some ( FIX_Action_masscancel data )
    | None -> None  
  end
  | _ -> None 
;; 