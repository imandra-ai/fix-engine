(** 
    Aesthetic Integration Limited
    Copyright (c) 2016

    LSE FIX specification - Application Message logic.
    
    LSE_Venue_Model.ml
*)

(** We're using the FIX 4.4 dictionary. *)
#use "std_fix_data_dictionary.ml";;

(** This allows us to ensure that we correctly handle the transition logic.
    For example, it's easier to specify that all orders are automatically rejected in post-trade phase. *)
type venue_period = 
    | PreOpen 
    | OpenAuction
    | ContinuousTrading
;;

(** This is an internal structure. *)
type fill_data = {
    fill_price : int;
    fill_qty : int;
};;

(** These are the incoming transition messages - notice that it is unnecessary for 
    us to understand the precise mechanics by which these messages have been generated.
    The only thing that's relevant for us is that. *)
type int_venue_transition =
    | CreateFill of fill_data       (** Fill will be sent back. *)
    | UpdateTime of int             (** Update current time of the venue. This may result in cancellation of the order or change
                                        in the period. We need this because certain types of orders and their attributes have 
                                        different meaning depending on the period that venue is in. Example: iceberg orders may
                                        act like regular limit orders in an auction - therefore maximum quantity of a fill is not 
                                        the visible quantity, but rather the full residual quantity. *)
    | CancelOrder                   (** Order is cancelled due to inability to trade with anyone. Example: FOK or IOC orders. *)
;;

(** This is a type that's specific to LSE. This will be used based on the FIX type. *)
type lse_order_type = 
    | Market            (** 'An order that will execute at the best available prices until it is fully filled. Any remainder will be expired. *)
    | Limit             (** 'An order that will execute at or better than the specified price. The remainder, if any, is added to the order book or expired in terms of TimeInForce (50).' *)
    | Stop              (** 'A market order that remains inactive until the market reaches a specified stop price. *)
    | Iceberg
;;

type validity = 
    | Day                       (** '' *)
    | IOC                       (** '' *)
    | FOK                       (** '' *)
    | OnOpen                    (** '' *)
    | OnClose                   (** '' *)
    | GoodForIntradayAuction    (** '' *)
    | GoodForAuction            (** '' *)
    | GoodTillTime              (** '' *)
    


(** This defines the state of the model. It's effecitively state of the an order.
    In the future, we may wish to create models where a client may have multiple orders
    at once. But that's for future work - single order state is sufficient to represent
    all of the logic that's represented within the guides. *)
type venue_state = {
    curr_time : int;                            (** TODO need to express this in the right time units. *)
    curr_period : venue_period;                 (** Starts with Pre-Trade. *)
    curr_order_state : fix_order_status;        (** TODO *)

    order_side : fix_side;                      (** Buy or Sell *)
    order_limit_price : int;                    (** In case it's not a market order. *)
    order_qty : int;                            (** Total order quantity. *)
    visible_qty : int option;                   (** In case of Icebergs, this is the displayed quantity. *)
    filled_qty : int;                           (** Total filled quantity *)
    order_type : lse_order_type;                (** This is specific to LSE. *)

    stop_price : int;                           (** Only used with Stop orders. *)

    expire_time : int;                          (** Only used with GoodTillTime validity *)
    expire_date : int;                          (** Only used with GoodTillDate validity *)

    incoming_fix_msg : fix_message option;      (** This must be the 3 types of messages that we support. *)
    outgoing_fix_msg : fix_message option;      (** We will send out acknowledgements, trade reports, etc. *)
    
    incoming_int_msg : int_venue_transition option;    (** This is incoming internal state transition message. *)

};;

(** This is the default state of the venue. *)
let default_venue_state = {
    curr_time = 0;
    curr_period = PreOpen;
    curr_order_status = NoActiveOrder;

    order_side = FIX_Side_Buy;
    order_limit_price = 0;
    order_qty = 0;
    visible_qty = 0;
    filled_qty = 0;
    order_type = 0;

    stop_price = 0;

    expire_time = 0;
    expire_date= 0;

    incoming_fix_msg = None;
    outgoing_fix_msg = None;
    
    incoming_int_msg = None;

};;

(** Used in various places below. *)
let is_order_live (ord : order_state) = 
    match ord with 
    | OrderCreated -> true
    | PartialFilled -> true
    | Updated -> true
    | _ -> false
;;

(** This function defines what is possible for us to receive as an internal transition.
    It effectively gives 'meaning' to the various parameters, etc. that are assigned
    within the specification. *)
let is_int_message_valid ( venue, int_transition : venue_state * int_venue_transition ) = 
    match int_transition with
    | CreateFill f -> (
        let residual_qty = venue.order_qty - venue.filled_qty in 
        let valid_ord_state = is_order_live (venue.curr_order_state) in 
        let qty_is_good = f.qty > 0 && f.qty <= residual_qty in 
        let price_is_good = f.price > 0 && (
            match venue.order_side with 
            | Buy       -> f.price <= venue.order_limit_price
            | Sell      -> f.price >= venue.order_limit_price ) in
        let valid_fill_params = (
            match venue.order_type with 
            | Market    -> f.price > 0
            | Limit     -> price_is_good
            | Iceberg   -> price_is_good && f.qty < venue.visibile_qty
        ) in
        qty_is_good && valid_ord_state && valid_fill_params
     )
    | UpdateTime t  -> t > venue.curr_time
    | CancelOrder   ->  is_order_live (venue.curr_order_state) 
;;

(** ********************************************************************************************************** *)
(** Generate Execution Reports - these are used to communicate all the order status information, including     *)
(** cases where order is rejected or is cancelled.                                                             *)
(** ********************************************************************************************************** *)
(** 

    From the LSE spec:
    '
    Exec Type: 0 - Order Accepted
    Indicates that a new order has been accepted. This message will also be sent unsolicited if an order was sub-
    mitted by Market Operations on behalf of the client. This message will also be sent when a parked order is 
    injected and added to the order book without receiving an execution. 
    This message will also be sent when a parked order with time in force CFX/GFS/GFA/ATC is un-parked and added
    to the order book without triggering an execution. 
    This message will be sent when orders submitted during the CPP session are parked without being added to the 
    order book.

    Exec Type: 8 - Order Rejected
    Indicates that an order has been rejected. The reason for the rejection is specified in the field OrdRejReason (103).

    Exec Type: F - Order Executed
    Indicates that an order has been partially or fully filled. The execution details (e.g. price and quantity) are
    specified. This message will also be sent when a parked order is injected and receives executions on aggression.
    This message will also be sent when a parked pegged order is un-parked and receives executions on aggression.
    This message will also be sent when a parked order with time in force CFX/GFS/GFA/ATC is un-parked and receives
    executions on aggression.

    Exec Type: C - Order Expired
    Indicates that an order has expired in terms of its qualifier.
    This message will also be sent when orders are expired upon entering the order book when the number of orders 
    in the order book is at the maximum allowed level, when the incoming order is configured with the Self Execution 
    Prevention specifying CIO or CRO. The reason for the expiration is specified in the Text (58) field.
    This message will also be sent when a Market Order or a Stop Order is expired at the point of aggressing the 
    order book during the Continuous Trading session, if a circuit breaker is breached during that aggression,
    The reason for the expiration is specified in the Text (58) field.
    
    Exec Type: 4 - Order Cancelled
    Indicates that an order cancel request has been accepted and successfully processed.
    This message will also be sent unsolicited if the order was cancelled by the Market Operations. In such a 
    scenario the Execution Report will include an ExecRestatementReason (378) of Market Option (8). It will not 
    include an OrigClOrdID (41) and will not be assigned a new Client Order ID.

    Exec Type: 5 - Order Cancel/Replaced
    Indicates that an order cancel/replace request has been accepted and successfully processed.

    Exec Type: D - Order Cancel/Replace by Market Operations
    Indicates that an order has been amended by Market Operations. The unsolicited message will include an 
    ExecRestatement Reason (378) of Market Option (8). It will not include an OrigClOrdID (41) and will not be
    assigned a new Client Order ID.

    Exec Type: H - Trade Cancel
    Indicates that an execution has been cancelled by Market Operations or by clients. An ExecRefID (19) to 
    identify the execution being cancelled will be included.
    '
*)


let create_trade_report (f : fill) = 
    {

    }
;;

(** This is order creation acknowledgement message to be sent back. *)
let create_order_ack ( ord_create_msg : fix_msg ) =

;;

(** Used to reject cancellation or amendment requests *)
let create_order_cancel_reject ( ord_cancel_reject_msg : fix_msg) =
;;


(** ********************************************************************************************************** *)
(** Check FIX messages for validity. Note that this is the prime target for auto-generation by the DSL.        *)
(** ********************************************************************************************************** *)
let process_int_message ( venue : venue_state ) = 
    match venue.incoming_int_msg with 
    | None -> venue
    | Some x -> (
        match x with 
        | CreateFill f ->
            let fill_msg = create_trade_report (f) in 
            let new_ord_state = (
                match 
            ) in { 
                venue with 
                    outgoing_fix_msg = Some fill_msg;
                    filled_qty = venue.filled_qty + f.qty;
            }
    )
;;
(** ********************************************************************************************************** *)
(** Check FIX messages for validity. Note that this is the prime target for auto-generation by the DSL.        *)
(** ********************************************************************************************************** *)

let is_FIX_create_order_valid (venue, msg_data : venue_state * create_order_data) =
    let valid_state = (venue.curr_order_state = NoActiveOrder) in
    let valid_order_params = (
        match create_order_data.order_type with 
        | FIX_Market_Order -> true
        | FIX_Limit_Order -> true
    ) in 

    valid_state && valid_order_params
;;

let is_FIX_cancel_order_valid (venue, msg_data : venue_state * cancel_order_data) = 
    let valid_state = (venue.curr_order_state = ) in 
    let valid_request_params = (venue.order_id = msg_data.order_id) in 
    valid_state && valid_order_params
;;

(** From the guide: 
    'The following attributes of a live order may be amended via the Order Cancel/Replace Request message:
    - Order quantity
    - Disclosed quantity
    - Price
    - Stop Price
    - Expiration time (GTT orders only)
    - Expiration date (GTD orders only)
    - Client reference
*)
let is_FIX_update_order_valid (venue, msg_data : venue_state * update_order_data) =
    let valid_state = (venue.curr_order_state = NoActiveOrder) in
    let valid_order_id = (venue.order_id = msg_data.order_id) in 
    let valid_order_params = (

    ) in 
    valid_state && valid_order_id && valid_order_params
;;

(** ********************************************************************************************************** *)
(** End of FIX message validity checks.                                                                        *)
(** ********************************************************************************************************** *)

(** Process incoming FIX message *)
let process_incoming_fix_msg ( venue : venue_state ) =
    match venue.incoming_fix_msg.msg_data with 
    | FIX_create_order co -> venue
    | FIX_cancel_order can -> venue
    | FIX_update_order uo -> venue
    | _ -> venue
;;

(** This performs the execution. *)
let one_step (venue : venue_state) =


;;



