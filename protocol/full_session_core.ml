(** 

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    Implementation of the FIX 4.4 protocol. Contains FIX data dictionary.

    fix_data_dictionary.ml
*)

(* @meta[imandra_ignore] on @end *)
open Basic_types;;
open Datetime;;
(* @meta[imandra_ignore] off @end *)

(** Standard FIX header. 
    Note that the standard header has tag Tag 35 that is the 
    message type. We do not need this tag as message type is 
    explicit. *)
type fix_header = {
    begin_string                    : int;          (* Tag 8    *)
    body_length                     : int;          (* Tag 9    *)
    sender_comp_id                  : int;          (* Tag 49   *)
    target_comp_id                  : int;          (* Tag 56   *)
    msg_seq_num                     : int;          (* Tag 34   *)

    on_behalf_of_comp_id            : int option;   (* Tag 115  *)
    deliver_to_comp_id              : int option;   (* Tag 128  *)
    secure_data_len                 : int option;   (* Tag 90   *)
    secure_data                     : int option;   (* Tag 91   *)
    sender_sub_id                   : int option;   (* Tag 50   *)
    sender_location_id              : int option;   (* Tag 142  *)
    target_sub_id                   : int option;   (* Tag 57   *)
    target_location_id              : int option;   (* Tag 143  *)
    on_behalf_of_sub_id             : int option;   (* Tag 116  *)
    on_behalf_of_location_id        : int option;   (* Tag 114  *)
    deliver_to_sub_id               : int option;   (* Tag 129  *)
    deliver_to_location_id          : int option;   (* Tag 145  *)
    poss_dup_flag                   : bool option;  (* Tag 43   *)
    poss_resend                     : bool option;  (* Tag 97   *)
    sending_time                    : int option;   (* Tag 52   *)
    orig_sending_time               : int option;   (* Tag 122  *)
    xml_data_len                    : int option;   (* Tag 212  *)
    xml_data                        : int option;   (* Tag 213  *)
    message_enconding               : int option;   (* Tag 347  *)
    last_msg_seq_num_processed      : int option;   (* Tag 369  *)
    no_hops                         : int option;   (* Tag 627  *)
}
;;

let default_fix_header = {
    begin_string                    = 0;
    body_length                     = 0;
    msg_seq_num                     = 0;
    poss_dup_flag                   = None;
    target_comp_id                  = 0;
    sender_comp_id                  = 0;
    on_behalf_of_comp_id            = None;
    deliver_to_comp_id              = None;
    secure_data_len                 = None;
    secure_data                     = None;
    sender_sub_id                   = None;
    sender_location_id              = None;
    target_sub_id                   = None;
    target_location_id              = None;
    on_behalf_of_sub_id             = None;
    on_behalf_of_location_id        = None;
    deliver_to_sub_id               = None;
    deliver_to_location_id          = None;
    poss_resend                     = None;
    sending_time                    = None;
    orig_sending_time               = None;
    xml_data_len                    = None;
    xml_data                        = None;
    message_enconding               = None;
    last_msg_seq_num_processed      = None;
    no_hops                         = None;
}
;;

(** Standard FIX trailer *)
type fix_trailer = {
    signature_length                : int;  (* Tag 93: Signature Length *)
    signature                       : int;  (* Tag 89: Signature text *)
    check_sum                       : int;  (* Tag 10: TODO: need to  *)
}
;;

let default_fix_trailer = {
    signature_length                = 0;
    signature                       = 0;
    check_sum                       = 0;
}
;;
