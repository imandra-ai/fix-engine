(* @meta[imandra_ignore] on @end *)
open Full_app_enums;;
(* @meta[imandra_ignore] off @end *)

let parse_pricetype = function 
    | "1" -> Some FIX_Price_Percentage
    | "2" -> Some FIX_Price_PerUnit
    | "3" -> Some FIX_Price_FixedAmount
    | "4" -> Some FIX_Price_Discount
    | "5" -> Some FIX_Price_Premium
    | "6" -> Some FIX_Price_Spread
    | "7" -> Some FIX_Price_TEDPrice
    | "8" -> Some FIX_Price_TEDYield
    | "9" -> Some FIX_Price_Yield
    |  _  -> None 
;;

let parse_commtype = function 
    | "1" -> Some FIX_CommType_PerUnit
    | "2" -> Some FIX_CommType_Percentage
    | "3" -> Some FIX_CommType_Absolute
    | "4" -> Some FIX_CommType_CashDiscount
    | "5" -> Some FIX_CommType_EnhancedUnits
    |  _  -> None 
;;

let parse_ordstatus = function 
    | "0" -> Some FIX_Ord_Status_New
    | "1" -> Some FIX_Ord_Status_PartiallyFilled
    | "2" -> Some FIX_Ord_Status_Filled
    | "3" -> Some FIX_Ord_Status_DoneForDay
    | "4" -> Some FIX_Ord_Status_Canceled
    | "5" -> Some FIX_Ord_Status_Replaced
    | "6" -> Some FIX_Ord_Status_PendingCancel
    | "7" -> Some FIX_Ord_Status_Stopped
    | "8" -> Some FIX_Ord_Status_Rejected
    | "9" -> Some FIX_Ord_Status_Suspended
    | "A" -> Some FIX_Ord_Status_PendingNew
    | "B" -> Some FIX_Ord_Status_Calculated
    | "C" -> Some FIX_Ord_Status_Expired
    | "D" -> Some FIX_Ord_Status_AcceptedForBidding
    | "E" -> Some FIX_Ord_Status_PendingReplace
    |  _  -> None 
;;

let parse_timeinforce = function 
    | "0" -> Some FIX_TimeInForce_Day           
    | "3" -> Some FIX_TimeInForce_IOC           
    | "2" -> Some FIX_TimeInForce_OPG           
    | "4" -> Some FIX_TimeInForce_FOK           
    | "1" -> Some FIX_TimeInForce_GTK           
    | "6" -> Some FIX_TimeInForce_GoodTillDate  
    |  _  -> None
;;

let parse_execinst = function 
    | "1" -> Some FIX_ExecInst_NotHeld          
    | "2" -> Some FIX_ExecInst_Work             
    | "3" -> Some FIX_ExecInst_GoAlong          
    | "4" -> Some FIX_ExecInst_OverTheDay       
    | "5" -> Some FIX_ExecInst_Held             
    | "M" -> Some FIX_ExecInst_MidpointPeg      
    | "P" -> Some FIX_ExecInst_MarketPeg        
    | "R" -> Some FIX_ExecInst_PrimaryPeg       
    |  _  -> None
;;

let parse_handlinst = function 
    | "1" -> Some FIX_HandlInst_Automated_NoInt 
    | "2" -> Some FIX_HandlInst_Automated_Int   
    | "3" -> Some FIX_HandlInst_Manual          
    |  _  -> None
;;

let parse_exectype = function 
    | "0" -> Some FIX_ExecType_New                       
    | "1" -> Some FIX_ExecType_PartialFill               
    | "2" -> Some FIX_ExecType_Fill                      
    | "3" -> Some FIX_ExecType_DoneForDay                
    | "4" -> Some FIX_ExecType_Canceled                  
    | "5" -> Some FIX_ExecType_Replace                   
    | "6" -> Some FIX_ExecType_PendingCancel             
    | "7" -> Some FIX_ExecType_Stopped                   
    | "8" -> Some FIX_ExecType_Rejected                  
    | "9" -> Some FIX_ExecType_Suspended                 
    | "A" -> Some FIX_ExecType_PendingNew                
    | "B" -> Some FIX_ExecType_Calculated                
    |  _  -> None
;;

let parse_ordertype = function 
    | "1" -> Some FIX_Ord_Type_Market                    
    | "2" -> Some FIX_Ord_Type_Limit                     
    | "3" -> Some FIX_Ord_Type_Stop                      
    | "4" -> Some FIX_Ord_Type_StopLimit                 
    | "5" -> Some FIX_Ord_Type_MarketOnClose             
    | "6" -> Some FIX_Ord_Type_WithOrWithout             
    | "7" -> Some FIX_Ord_Type_LimitOrBetter             
    | "8" -> Some FIX_Ord_Type_LimitWithOrWithout        
    | "9" -> Some FIX_Ord_Type_OnBasis                   
    | "A" -> Some FIX_Ord_Type_OnClose                   
    | "B" -> Some FIX_Ord_Type_LimitOnClose              
    | "C" -> Some FIX_Ord_Type_ForexMarket               
    | "D" -> Some FIX_Ord_Type_PreviouslyQuoted          
    | "E" -> Some FIX_Ord_Type_PreviouslyIndicated       
    | "F" -> Some FIX_Ord_Type_ForexLimit                
    | "G" -> Some FIX_Ord_Type_ForexSwap                 
    | "H" -> Some FIX_Ord_Type_ForexPreviouslyQuoted     
    | "I" -> Some FIX_Ord_Type_Funari                    
    | "J" -> Some FIX_Ord_Type_MarketIfTouched           
    | "K" -> Some FIX_Ord_Type_MarketWithLeftOverAsLimit 
    | "L" -> Some FIX_Ord_Type_PreviousFundValuationPoint
    | "M" -> Some FIX_Ord_Type_NextFundValuationPoint    
    | "P" -> Some FIX_Ord_Type_Pegged                    
    |  _  -> None
;;

let parse_side = function 
    | "1" -> Some FIX_Side_Buy                           
    | "2" -> Some FIX_Side_Sell                          
    | "3" -> Some FIX_Side_BuyMinus                      
    | "4" -> Some FIX_Side_SellPlus                      
    | "5" -> Some FIX_Side_SellShort                     
    | "6" -> Some FIX_Side_SellShortExempt               
    | "7" -> Some FIX_Side_Undisclosed                   
    | "8" -> Some FIX_Side_Cross                         
    | "9" -> Some FIX_Side_CrossShort                    
    | "A" -> Some FIX_Side_CrossShortExempt              
    | "B" -> Some FIX_Side_AsDefined                     
    | "C" -> Some FIX_Side_Opposite                      
    | "D" -> Some FIX_Side_Subscribe                     
    | "E" -> Some FIX_Side_Redeem                        
    | "F" -> Some FIX_Side_Lend                          
    | "G" -> Some FIX_Side_Borrow                        
    |  _  -> None
;;
