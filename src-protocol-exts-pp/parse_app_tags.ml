(* @meta[imandra_ignore] on @end *)
open Full_app_tags;;
(* @meta[imandra_ignore] off @end *)

let parse_app_msg_tag = function
    | "8" -> Some Full_Msg_ExecutionReport_Tag
    | "F" -> Some Full_Msg_OrderCancelRequest_Tag
    | "G" -> Some Full_Msg_OrderCancelReplaceRequest_Tag
    | "D" -> Some Full_Msg_NewOrderSingle_Tag
    | "9" -> Some Full_Msg_CancelReject_Tag               
    |  _  -> None
;;

let parse_msg_NewOrderSingle_field_tag = function
    | "1"   -> Some Full_Msg_NewOrderSingle_Account_Tag     
    | "11"  -> Some Full_Msg_NewOrderSingle_ClOrdID_Tag     
    | "41"  -> Some Full_Msg_NewOrderSingle_OrigClOrdID_Tag  
    | "18"  -> Some Full_Msg_NewOrderSingle_ExecInst_Tag    
    | "21"  -> Some Full_Msg_NewOrderSingle_HandlInst_Tag   
    | "60"  -> Some Full_Msg_NewOrderSingle_TransactTimeon_Tag
    | "55"  -> Some Full_Msg_NewOrderSingle_Symbol_Tag      
    | "65"  -> Some Full_Msg_NewOrderSingle_SymbolSfx_Tag   
    | "54"  -> Some Full_Msg_NewOrderSingle_Side_Tag        
    | "38"  -> Some Full_Msg_NewOrderSingle_OrderQty_Tag    
    | "40"  -> Some Full_Msg_NewOrderSingle_OrdType_Tag     
    | "44"  -> Some Full_Msg_NewOrderSingle_Price_Tag       
    | "110" -> Some Full_Msg_NewOrderSingle_MinQty_Tag      
    | "59"  -> Some Full_Msg_NewOrderSingle_TimeInForce_Tag 
    | "114" -> Some Full_Msg_NewOrderSingle_LocateReqd_Tag  
    | "15"  -> Some Full_Msg_NewOrderSingle_Currency_Tag    
    |  _    -> None
;;

let parse_msg_OrderCancelReplaceRequest_field_tag = function
    | "1"   -> Some Full_Msg_OrderCancelReplaceRequest_Account_Tag          
    | "11"  -> Some Full_Msg_OrderCancelReplaceRequest_ClOrdID_Tag          
    | "21"  -> Some Full_Msg_OrderCancelReplaceRequest_HandlInst_Tag        
    | "41"  -> Some Full_Msg_OrderCancelReplaceRequest_OrigClOrdID_Tag      
    | "18"  -> Some Full_Msg_OrderCancelReplaceRequest_ExecInst_Tag         
    | "60"  -> Some Full_Msg_OrderCancelReplaceRequest_TransactTime_Tag     
    | "55"  -> Some Full_Msg_OrderCancelReplaceRequest_Symbol_Tag           
    | "65"  -> Some Full_Msg_OrderCancelReplaceRequest_SymbolSfx_Tag        
    | "54"  -> Some Full_Msg_OrderCancelReplaceRequest_Side_Tag             
    | "38"  -> Some Full_Msg_OrderCancelReplaceRequest_OrderQty_Tag         
    | "40"  -> Some Full_Msg_OrderCancelReplaceRequest_OrdType_Tag          
    | "44"  -> Some Full_Msg_OrderCancelReplaceRequest_Price_Tag            
    | "110" -> Some Full_Msg_OrderCancelReplaceRequest_MinQty_Tag           
    | "59"  -> Some Full_Msg_OrderCancelReplaceRequest_TimeInForce_Tag      
    | "114" -> Some Full_Msg_OrderCancelReplaceRequest_LocateReqd_Tag       
    |  _    -> None
;;

let parse_msg_OrderCancelRequest_field_tag = function
    | "11" -> Some Full_Msg_OrderCancelRequest_ClOrdID_Tag
    | "41" -> Some Full_Msg_OrderCancelRequest_OrigClOrdID_Tag
    | "37" -> Some Full_Msg_OrderCancelRequest_OrderID_Tag
    | "60" -> Some Full_Msg_OrderCancelRequest_TransactTime_Tag
    | "55" -> Some Full_Msg_OrderCancelRequest_Symbol_Tag
    | "65" -> Some Full_Msg_OrderCancelRequest_SymbolSfx_Tag
    | "54" -> Some Full_Msg_OrderCancelRequest_Side_Tag
    |  _   -> None
;;

let parse_msg_CancelReject_field_tag = function
    | "1"   -> Some Full_Msg_CancelReject_Account_Tag
    | "11"  -> Some Full_Msg_CancelReject_ClOrdID_Tag
    | "41"  -> Some Full_Msg_CancelReject_OrigClOrdID_Tag
    | "37"  -> Some Full_Msg_CancelReject_OrderID_Tag
    | "39"  -> Some Full_Msg_CancelReject_OrdStatus_Tag
    | "102" -> Some Full_Msg_CancelReject_CxlRejReason_Tag
    | "58"  -> Some Full_Msg_CancelReject_Text_Tag
    |  _    -> None
;;

let parse_msg_ExecutionReport_field_tag = function
    | "37"  -> Some Full_Msg_ExecutionReport_OrderID_Tag
    | "11"  -> Some Full_Msg_ExecutionReport_ClOrdID_Tag
    | "18"  -> Some Full_Msg_ExecutionReport_ExecType_Tag
    | "17"  -> Some Full_Msg_ExecutionReport_ExecID_Tag
    | "1"   -> Some Full_Msg_ExecutionReport_Account_Tag
    | "54"  -> Some Full_Msg_ExecutionReport_Side_Tag
    | "40"  -> Some Full_Msg_ExecutionReport_OrdType_Tag
    | "39"  -> Some Full_Msg_ExecutionReport_OrdStatus_Tag
    | "6"   -> Some Full_Msg_ExecutionReport_AvgPx_Tag
    | "151" -> Some Full_Msg_ExecutionReport_LeavesQty_Tag
    | "14"  -> Some Full_Msg_ExecutionReport_CumQty_Tag
    |  _  -> None
;;

let parse_app_field_tag msg_tag str = 
    let wrap parse f = match parse str with None -> None | Some x -> Some ( f x ) in
    match msg_tag with
    | Full_Msg_ExecutionReport_Tag            -> wrap parse_msg_ExecutionReport_field_tag           @@ fun x -> Full_Msg_ExecutionReport_Field_Tag x
    | Full_Msg_OrderCancelRequest_Tag         -> wrap parse_msg_OrderCancelRequest_field_tag        @@ fun x -> Full_Msg_OrderCancelRequest_Field_Tag x
    | Full_Msg_OrderCancelReplaceRequest_Tag  -> wrap parse_msg_OrderCancelReplaceRequest_field_tag @@ fun x -> Full_Msg_OrderCancelReplaceRequest_Field_Tag x
    | Full_Msg_NewOrderSingle_Tag             -> wrap parse_msg_NewOrderSingle_field_tag            @@ fun x -> Full_Msg_NewOrderSingle_Field_Tag x
    | Full_Msg_CancelReject_Tag               -> wrap parse_msg_CancelReject_field_tag              @@ fun x -> Full_Msg_CancelReject_Field_Tag x
;;
