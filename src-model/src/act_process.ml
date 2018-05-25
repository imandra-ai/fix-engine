(* Aesthetic Integration copyright 2018 *)
open Act_checks;;
open Actions;;
open Model_messages;;
open State;;

let receive_action_neworder (m_state : model_state) (action_data : m_action_fix_neworder)  =
    let local_dummy = "314159" in
    let msg_data_inner = {
        mod_f_OrderSingle_BookIndicator = action_data.mod_f_neworder_BookIndicator;
        mod_f_OrderSingle_BrokerPrioritization = action_data.mod_f_neworder_BrokerPrioritization;
        mod_f_OrderSingle_ClOrdID = action_data.mod_f_neworder_ClOrdID;
        mod_f_OrderSingle_ClearingEntries = action_data.mod_f_neworder_ClearingEntries;
        mod_f_OrderSingle_Currency = action_data.mod_f_neworder_Currency;
        mod_f_OrderSingle_DEAIndicator = action_data.mod_f_neworder_DEAIndicator;
        mod_f_OrderSingle_ExecInst = action_data.mod_f_neworder_ExecInst;
        mod_f_OrderSingle_HandlInst = action_data.mod_f_neworder_HandlInst;
        mod_f_OrderSingle_MIC = action_data.mod_f_neworder_MIC;
        mod_f_OrderSingle_MinQty = (match action_data.mod_f_neworder_MinQty with
            | None -> None
            | Some x -> (Some x)
        );
        mod_f_OrderSingle_OrdType = action_data.mod_f_neworder_OrdType;
        mod_f_OrderSingle_OrderAttributeTypes = action_data.mod_f_neworder_OrderAttributeTypes;
        mod_f_OrderSingle_OrderQty = action_data.mod_f_neworder_OrderQty;
        mod_f_OrderSingle_Parties = action_data.mod_f_neworder_Parties;
        mod_f_OrderSingle_PegDifference = (match action_data.mod_f_neworder_PegDifference with
            | None -> None
            | Some x -> (Some x)
        );
        mod_f_OrderSingle_Price = (match action_data.mod_f_neworder_Price with
            | None -> None
            | Some x -> (Some x)
        );
        mod_f_OrderSingle_Side = action_data.mod_f_neworder_Side;
        mod_f_OrderSingle_Symbol = action_data.mod_f_neworder_Symbol;
        mod_f_OrderSingle_TechnicalOrdType = action_data.mod_f_neworder_TechnicalOrdType;
        mod_f_OrderSingle_TimeInForce = action_data.mod_f_neworder_TimeInForce;
        mod_f_OrderSingle_TransactTime = action_data.mod_f_neworder_TransactTime
    } in
    let m_state = send_msg (FIX_Msg_OrderSingle msg_data_inner) m_state in
    m_state
;;

let receive_action_cancelreplace (m_state : model_state) (action_data : m_action_fix_cancelreplace)  =
    let msg_data_inner = {
        mod_f_OrderCancelReplaceRequest_Account = action_data.mod_f_cancelreplace_Account;
        mod_f_OrderCancelReplaceRequest_ClOrdID = action_data.mod_f_cancelreplace_ClOrdID;
        mod_f_OrderCancelReplaceRequest_ClearingFirm = action_data.mod_f_cancelreplace_ClearingFirm;
        mod_f_OrderCancelReplaceRequest_ClearingHandlingType = action_data.mod_f_cancelreplace_ClearingHandlingType;
        mod_f_OrderCancelReplaceRequest_ClientID = action_data.mod_f_cancelreplace_ClientID;
        mod_f_OrderCancelReplaceRequest_Currency = action_data.mod_f_cancelreplace_Currency;
        mod_f_OrderCancelReplaceRequest_ExecInst = action_data.mod_f_cancelreplace_ExecInst;
        mod_f_OrderCancelReplaceRequest_FreeText = action_data.mod_f_cancelreplace_FreeText;
        mod_f_OrderCancelReplaceRequest_MIC = action_data.mod_f_cancelreplace_MIC;
        mod_f_OrderCancelReplaceRequest_OpenClose = action_data.mod_f_cancelreplace_OpenClose;
        mod_f_OrderCancelReplaceRequest_OrdType = action_data.mod_f_cancelreplace_OrdType;
        mod_f_OrderCancelReplaceRequest_OrderID = action_data.mod_f_cancelreplace_OrderID;
        mod_f_OrderCancelReplaceRequest_OrderQty = action_data.mod_f_cancelreplace_OrderQty;
        mod_f_OrderCancelReplaceRequest_OrigClOrdID = action_data.mod_f_cancelreplace_OrigClOrdID;
        mod_f_OrderCancelReplaceRequest_PegDifference = (match action_data.mod_f_cancelreplace_PegDifference with
            | None -> None
            | Some x -> (Some x)
        );
        mod_f_OrderCancelReplaceRequest_Price = (match action_data.mod_f_cancelreplace_Price with
            | None -> None
            | Some x -> (Some x)
        );
        mod_f_OrderCancelReplaceRequest_Rule80A = action_data.mod_f_cancelreplace_Rule80A;
        mod_f_OrderCancelReplaceRequest_Side = action_data.mod_f_cancelreplace_Side;
        mod_f_OrderCancelReplaceRequest_Symbol = action_data.mod_f_cancelreplace_Symbol;
        mod_f_OrderCancelReplaceRequest_TechnicalOrdType = action_data.mod_f_cancelreplace_TechnicalOrdType;
        mod_f_OrderCancelReplaceRequest_TimeInForce = action_data.mod_f_cancelreplace_TimeInForce
    } in
    let m_state = send_msg (FIX_Msg_OrderCancelReplaceRequest msg_data_inner) m_state in
    m_state
;;

let receive_action_cancel (m_state : model_state) (action_data : m_action_fix_cancel)  =
    let msg_data_inner = {
        mod_f_OrderCancelRequest_ClOrdID = action_data.mod_f_cancel_ClOrdID;
        mod_f_OrderCancelRequest_Currency = action_data.mod_f_cancel_Currency;
        mod_f_OrderCancelRequest_MIC = action_data.mod_f_cancel_MIC;
        mod_f_OrderCancelRequest_OrderID = action_data.mod_f_cancel_OrderID;
        mod_f_OrderCancelRequest_OrderQty = action_data.mod_f_cancel_OrderQty;
        mod_f_OrderCancelRequest_OrigClOrdID = action_data.mod_f_cancel_OrigClOrdID;
        mod_f_OrderCancelRequest_Symbol = action_data.mod_f_cancel_Symbol;
        mod_f_OrderCancelRequest_TransactTime = action_data.mod_f_cancel_TransactTime
    } in
    let m_state = send_msg (FIX_Msg_OrderCancelRequest msg_data_inner) m_state in
    m_state
;;

let receive_action_masscancel (m_state : model_state) (action_data : m_action_fix_masscancel)  =
    let msg_data_inner = {
        mod_f_OrderMassCancelRequest_Account = action_data.mod_f_masscancel_Account;
        mod_f_OrderMassCancelRequest_CancelByLocationID = action_data.mod_f_masscancel_CancelByLocationID;
        mod_f_OrderMassCancelRequest_ClOrdID = action_data.mod_f_masscancel_ClOrdID;
        mod_f_OrderMassCancelRequest_ClassID = action_data.mod_f_masscancel_ClassID;
        mod_f_OrderMassCancelRequest_MassCancelRequestType = action_data.mod_f_masscancel_MassCancelRequestType;
        mod_f_OrderMassCancelRequest_Rule80A = action_data.mod_f_masscancel_Rule80A;
        mod_f_OrderMassCancelRequest_Side = action_data.mod_f_masscancel_Side;
        mod_f_OrderMassCancelRequest_Symbol = action_data.mod_f_masscancel_Symbol;
        mod_f_OrderMassCancelRequest_TechnicalOrdType = action_data.mod_f_masscancel_TechnicalOrdType;
        mod_f_OrderMassCancelRequest_TransactTime = action_data.mod_f_masscancel_TransactTime
    } in
    let m_state = send_msg (FIX_Msg_OrderMassCancelRequest msg_data_inner) m_state in
    m_state
;;

let receive_action (m_state : model_state) (action : fix_action)  =
    if (is_action_valid action m_state) then
        ((match action with
            | FIX_Action_neworder d -> (receive_action_neworder m_state d)
            | FIX_Action_cancelreplace d -> (receive_action_cancelreplace m_state d)
            | FIX_Action_cancel d -> (receive_action_cancel m_state d)
            | FIX_Action_masscancel d -> (receive_action_masscancel m_state d)
        )
        )
    else
        m_state
;;
