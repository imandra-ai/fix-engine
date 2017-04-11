(* @meta[imandra_ignore] on @end *)
open Yojson;;
open Full_app_tags;;
(* @meta[imandra_ignore] off @end *)

let full_app_msg_tag_to_string = function
    | Full_Msg_ExecutionReport_Tag                         -> "ExecutionReport_Tag"  
    | Full_Msg_OrderCancelRequest_Tag                      -> "OrderCancelRequest_Tag"
    | Full_Msg_OrderCancelReplaceRequest_Tag               -> "OrderCancelReplaceRequest_Tag"
    | Full_Msg_NewOrderSingle_Tag                          -> "NewOrderSingle_Tag"
    | Full_Msg_CancelReject_Tag                            -> "CancelReject_Tag" 
;;

let full_msg_NewOrderSingle_field_tag_to_string = function
    | Full_Msg_NewOrderSingle_Account_Tag                  -> "NewOrderSingle_Account_Tag"
    | Full_Msg_NewOrderSingle_ClOrdID_Tag                  -> "NewOrderSingle_ClOrdID_Tag"
    | Full_Msg_NewOrderSingle_OrigClOrdID_Tag              -> "NewOrderSingle_OrigClOrdID_Tag"
    | Full_Msg_NewOrderSingle_ExecInst_Tag                 -> "NewOrderSingle_ExecInst_Tag"
    | Full_Msg_NewOrderSingle_HandlInst_Tag                -> "NewOrderSingle_HandlInst_Tag"
    | Full_Msg_NewOrderSingle_TransactTimeon_Tag           -> "NewOrderSingle_TransactTimeon_Tag"
    | Full_Msg_NewOrderSingle_Symbol_Tag                   -> "NewOrderSingle_Symbol_Tag"
    | Full_Msg_NewOrderSingle_SymbolSfx_Tag                -> "NewOrderSingle_SymbolSfx_Tag"
    | Full_Msg_NewOrderSingle_Side_Tag                     -> "NewOrderSingle_Side_Tag"
    | Full_Msg_NewOrderSingle_OrderQty_Tag                 -> "NewOrderSingle_OrderQty_Tag"
    | Full_Msg_NewOrderSingle_OrdType_Tag                  -> "NewOrderSingle_OrdType_Tag"
    | Full_Msg_NewOrderSingle_Price_Tag                    -> "NewOrderSingle_Price_Tag"
    | Full_Msg_NewOrderSingle_MinQty_Tag                   -> "NewOrderSingle_MinQty_Tag"
    | Full_Msg_NewOrderSingle_TimeInForce_Tag              -> "NewOrderSingle_TimeInForce_Tag"
    | Full_Msg_NewOrderSingle_LocateReqd_Tag               -> "NewOrderSingle_LocateReqd_Tag"
    | Full_Msg_NewOrderSingle_LocateBroker_Tag             -> "NewOrderSingle_LocateBroker_Tag"
    | Full_Msg_NewOrderSingle_Currency_Tag                 -> "NewOrderSingle_Currency_Tag"
;;

let full_msg_OrderCancelReplaceRequest_field_tag_to_string = function
    | Full_Msg_OrderCancelReplaceRequest_Account_Tag       -> "OrderCancelReplaceRequest_Account_Tag"   
    | Full_Msg_OrderCancelReplaceRequest_ClOrdID_Tag       -> "OrderCancelReplaceRequest_ClOrdID_Tag"   
    | Full_Msg_OrderCancelReplaceRequest_HandlInst_Tag     -> "OrderCancelReplaceRequest_HandlInst_Tag"   
    | Full_Msg_OrderCancelReplaceRequest_OrigClOrdID_Tag   -> "OrderCancelReplaceRequest_OrigClOrdID_Tag"   
    | Full_Msg_OrderCancelReplaceRequest_ExecInst_Tag      -> "OrderCancelReplaceRequest_ExecInst_Tag"   
    | Full_Msg_OrderCancelReplaceRequest_TransactTime_Tag  -> "OrderCancelReplaceRequest_TransactTime_Tag"   
    | Full_Msg_OrderCancelReplaceRequest_Symbol_Tag        -> "OrderCancelReplaceRequest_Symbol_Tag"   
    | Full_Msg_OrderCancelReplaceRequest_SymbolSfx_Tag     -> "OrderCancelReplaceRequest_SymbolSfx_Tag"   
    | Full_Msg_OrderCancelReplaceRequest_Side_Tag          -> "OrderCancelReplaceRequest_Side_Tag"   
    | Full_Msg_OrderCancelReplaceRequest_OrderQty_Tag      -> "OrderCancelReplaceRequest_OrderQty_Tag"   
    | Full_Msg_OrderCancelReplaceRequest_OrdType_Tag       -> "OrderCancelReplaceRequest_OrdType_Tag"   
    | Full_Msg_OrderCancelReplaceRequest_Price_Tag         -> "OrderCancelReplaceRequest_Price_Tag"   
    | Full_Msg_OrderCancelReplaceRequest_MinQty_Tag        -> "OrderCancelReplaceRequest_MinQty_Tag"   
    | Full_Msg_OrderCancelReplaceRequest_TimeInForce_Tag   -> "OrderCancelReplaceRequest_TimeInForce_Tag"   
    | Full_Msg_OrderCancelReplaceRequest_LocateReqd_Tag    -> "OrderCancelReplaceRequest_LocateReqd_Tag"   
    | Full_Msg_OrderCancelReplaceRequest_LocateBroker_Tag  -> "OrderCancelReplaceRequest_LocateBroker_Tag"   
;;

let full_msg_OrderCancelRequest_field_tag_to_string = function
    | Full_Msg_OrderCancelRequest_ClOrdID_Tag              -> "OrderCancelRequest_ClOrdID_Tag"
    | Full_Msg_OrderCancelRequest_OrigClOrdID_Tag          -> "OrderCancelRequest_OrigClOrdID_Tag"
    | Full_Msg_OrderCancelRequest_OrderID_Tag              -> "OrderCancelRequest_OrderID_Tag"
    | Full_Msg_OrderCancelRequest_TransactTime_Tag         -> "OrderCancelRequest_TransactTime_Tag"
    | Full_Msg_OrderCancelRequest_Symbol_Tag               -> "OrderCancelRequest_Symbol_Tag"
    | Full_Msg_OrderCancelRequest_SymbolSfx_Tag            -> "OrderCancelRequest_SymbolSfx_Tag"
    | Full_Msg_OrderCancelRequest_Side_Tag                 -> "OrderCancelRequest_Side_Tag"
;;

let full_msg_CancelReject_field_tag_to_string = function
    | Full_Msg_CancelReject_Account_Tag                    -> "CancelReject_Account_Tag"
    | Full_Msg_CancelReject_ClOrdID_Tag                    -> "CancelReject_ClOrdID_Tag"
    | Full_Msg_CancelReject_OrigClOrdID_Tag                -> "CancelReject_OrigClOrdID_Tag"
    | Full_Msg_CancelReject_OrderID_Tag                    -> "CancelReject_OrderID_Tag"
    | Full_Msg_CancelReject_OrdStatus_Tag                  -> "CancelReject_OrdStatus_Tag"
    | Full_Msg_CancelReject_CxlRejReason_Tag               -> "CancelReject_CxlRejReason_Tag"
    | Full_Msg_CancelReject_Text_Tag                       -> "CancelReject_Text_Tag"
;;

let full_msg_ExecutionReport_field_tag_to_string = function
    | Full_Msg_ExecutionReport_OrderID_Tag                 -> "ExecutionReport_OrderID_Tag"
    | Full_Msg_ExecutionReport_ClOrdID_Tag                 -> "ExecutionReport_ClOrdID_Tag"
    | Full_Msg_ExecutionReport_ExecType_Tag                -> "ExecutionReport_ExecType_Tag"
    | Full_Msg_ExecutionReport_ExecID_Tag                  -> "ExecutionReport_ExecID_Tag"
    | Full_Msg_ExecutionReport_Account_Tag                 -> "ExecutionReport_Account_Tag"
    | Full_Msg_ExecutionReport_Side_Tag                    -> "ExecutionReport_Side_Tag"
    | Full_Msg_ExecutionReport_OrdType_Tag                 -> "ExecutionReport_OrdType_Tag"
    | Full_Msg_ExecutionReport_OrdStatus_Tag               -> "ExecutionReport_OrdStatus_Tag"
    | Full_Msg_ExecutionReport_AvgPx_Tag                   -> "ExecutionReport_AvgPx_Tag"
    | Full_Msg_ExecutionReport_LeavesQty_Tag               -> "ExecutionReport_LeavesQty_Tag"
    | Full_Msg_ExecutionReport_CumQty_Tag                  -> "ExecutionReport_CumQty_Tag"
;;

let full_app_field_tag_to_string = function
    | Full_Msg_ExecutionReport_Field_Tag           x -> full_msg_ExecutionReport_field_tag_to_string           x           
    | Full_Msg_OrderCancelRequest_Field_Tag        x -> full_msg_OrderCancelRequest_field_tag_to_string        x        
    | Full_Msg_OrderCancelReplaceRequest_Field_Tag x -> full_msg_OrderCancelReplaceRequest_field_tag_to_string x 
    | Full_Msg_NewOrderSingle_Field_Tag            x -> full_msg_NewOrderSingle_field_tag_to_string            x            
    | Full_Msg_CancelReject_Field_Tag              x -> full_msg_CancelReject_field_tag_to_string              x               
;;

let full_app_msg_tag_to_json                             x : json = `String ( full_app_msg_tag_to_string                             x ) ;; 
let full_msg_NewOrderSingle_field_tag_to_json            x : json = `String ( full_msg_NewOrderSingle_field_tag_to_string            x ) ;; 
let full_msg_OrderCancelReplaceRequest_field_tag_to_json x : json = `String ( full_msg_OrderCancelReplaceRequest_field_tag_to_string x ) ;; 
let full_msg_OrderCancelRequest_field_tag_to_json        x : json = `String ( full_msg_OrderCancelRequest_field_tag_to_string        x ) ;; 
let full_msg_CancelReject_field_tag_to_json              x : json = `String ( full_msg_CancelReject_field_tag_to_string              x ) ;; 
let full_msg_ExecutionReport_field_tag_to_json           x : json = `String ( full_msg_ExecutionReport_field_tag_to_string           x ) ;; 
let full_app_field_tag_to_json                           x : json = `String ( full_app_field_tag_to_string                           x ) ;; 

let full_app_msg_tag_opt_to_json                             = function None -> `Assoc [] | Some x -> full_app_msg_tag_to_json                             x ;;
let full_msg_NewOrderSingle_field_tag_opt_to_json            = function None -> `Assoc [] | Some x -> full_msg_NewOrderSingle_field_tag_to_json            x ;;
let full_msg_OrderCancelReplaceRequest_field_tag_opt_to_json = function None -> `Assoc [] | Some x -> full_msg_OrderCancelReplaceRequest_field_tag_to_json x ;;
let full_msg_OrderCancelRequest_field_tag_opt_to_json        = function None -> `Assoc [] | Some x -> full_msg_OrderCancelRequest_field_tag_to_json        x ;;
let full_msg_CancelReject_field_tag_opt_to_json              = function None -> `Assoc [] | Some x -> full_msg_CancelReject_field_tag_to_json              x ;;
let full_msg_ExecutionReport_field_tag_opt_to_json           = function None -> `Assoc [] | Some x -> full_msg_ExecutionReport_field_tag_to_json           x ;;
let full_app_field_tag_opt_to_json                           = function None -> `Assoc [] | Some x -> full_app_field_tag_to_json                           x ;;
