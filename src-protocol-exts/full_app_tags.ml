type full_app_msg_tag = 
    | Full_Msg_ExecutionReport_Tag
    | Full_Msg_OrderCancelRequest_Tag
    | Full_Msg_OrderCancelReplaceRequest_Tag
    | Full_Msg_NewOrderSingle_Tag
    | Full_Msg_CancelReject_Tag               
;;

type full_msg_NewOrderSingle_field_tag = 
    | Full_Msg_NewOrderSingle_Account_Tag     
    | Full_Msg_NewOrderSingle_ClOrdID_Tag     
    | Full_Msg_NewOrderSingle_OrigClOrdID_Tag 
    | Full_Msg_NewOrderSingle_ExecInst_Tag    
    | Full_Msg_NewOrderSingle_HandlInst_Tag   
    | Full_Msg_NewOrderSingle_TransactTimeon_Tag
    | Full_Msg_NewOrderSingle_Symbol_Tag      
    | Full_Msg_NewOrderSingle_SymbolSfx_Tag   
    | Full_Msg_NewOrderSingle_Side_Tag        
    | Full_Msg_NewOrderSingle_OrderQty_Tag    
    | Full_Msg_NewOrderSingle_OrdType_Tag     
    | Full_Msg_NewOrderSingle_Price_Tag       
    | Full_Msg_NewOrderSingle_MinQty_Tag      
    | Full_Msg_NewOrderSingle_TimeInForce_Tag 
    | Full_Msg_NewOrderSingle_LocateReqd_Tag  
    | Full_Msg_NewOrderSingle_LocateBroker_Tag
    | Full_Msg_NewOrderSingle_Currency_Tag    
    | Full_Msg_NewOrderSingle_IssueDate_Tag    
    | Full_Msg_NewOrderSingle_Issuer_Tag       
    | Full_Msg_NewOrderSingle_SecurityType_Tag 
;;

type full_msg_OrderCancelReplaceRequest_field_tag = 
    | Full_Msg_OrderCancelReplaceRequest_Account_Tag          
    | Full_Msg_OrderCancelReplaceRequest_ClOrdID_Tag          
    | Full_Msg_OrderCancelReplaceRequest_HandlInst_Tag        
    | Full_Msg_OrderCancelReplaceRequest_OrigClOrdID_Tag      
    | Full_Msg_OrderCancelReplaceRequest_ExecInst_Tag         
    | Full_Msg_OrderCancelReplaceRequest_TransactTime_Tag     
    | Full_Msg_OrderCancelReplaceRequest_Symbol_Tag           
    | Full_Msg_OrderCancelReplaceRequest_SymbolSfx_Tag        
    | Full_Msg_OrderCancelReplaceRequest_Side_Tag             
    | Full_Msg_OrderCancelReplaceRequest_OrderQty_Tag         
    | Full_Msg_OrderCancelReplaceRequest_OrdType_Tag          
    | Full_Msg_OrderCancelReplaceRequest_Price_Tag            
    | Full_Msg_OrderCancelReplaceRequest_MinQty_Tag           
    | Full_Msg_OrderCancelReplaceRequest_TimeInForce_Tag      
    | Full_Msg_OrderCancelReplaceRequest_LocateReqd_Tag       
    | Full_Msg_OrderCancelReplaceRequest_LocateBroker_Tag     
;;

type full_msg_OrderCancelRequest_field_tag = 
    | Full_Msg_OrderCancelRequest_ClOrdID_Tag
    | Full_Msg_OrderCancelRequest_OrigClOrdID_Tag
    | Full_Msg_OrderCancelRequest_OrderID_Tag
    | Full_Msg_OrderCancelRequest_TransactTime_Tag
    | Full_Msg_OrderCancelRequest_Symbol_Tag
    | Full_Msg_OrderCancelRequest_SymbolSfx_Tag
    | Full_Msg_OrderCancelRequest_Side_Tag
;;

type full_msg_CancelReject_field_tag = 
    | Full_Msg_CancelReject_Account_Tag
    | Full_Msg_CancelReject_ClOrdID_Tag
    | Full_Msg_CancelReject_OrigClOrdID_Tag
    | Full_Msg_CancelReject_OrderID_Tag
    | Full_Msg_CancelReject_OrdStatus_Tag
    | Full_Msg_CancelReject_CxlRejReason_Tag
    | Full_Msg_CancelReject_Text_Tag
;;

type full_msg_ExecutionReport_field_tag = 
    | Full_Msg_ExecutionReport_OrderID_Tag
    | Full_Msg_ExecutionReport_ClOrdID_Tag
    | Full_Msg_ExecutionReport_ExecType_Tag
    | Full_Msg_ExecutionReport_ExecID_Tag
    | Full_Msg_ExecutionReport_Account_Tag
    | Full_Msg_ExecutionReport_Side_Tag
    | Full_Msg_ExecutionReport_OrdType_Tag
    | Full_Msg_ExecutionReport_OrdStatus_Tag
    | Full_Msg_ExecutionReport_AvgPx_Tag
    | Full_Msg_ExecutionReport_LeavesQty_Tag
    | Full_Msg_ExecutionReport_CumQty_Tag
;;

type full_app_field_tag = 
    | Full_Msg_ExecutionReport_Field_Tag           of full_msg_ExecutionReport_field_tag           
    | Full_Msg_OrderCancelRequest_Field_Tag        of full_msg_OrderCancelRequest_field_tag        
    | Full_Msg_OrderCancelReplaceRequest_Field_Tag of full_msg_OrderCancelReplaceRequest_field_tag 
    | Full_Msg_NewOrderSingle_Field_Tag            of full_msg_NewOrderSingle_field_tag            
    | Full_Msg_CancelReject_Field_Tag              of full_msg_CancelReject_field_tag               
;;
