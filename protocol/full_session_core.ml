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
    h_begin_string                    : int;          (* Tag 8    *)
    h_body_length                     : int;          (* Tag 9    *)
    h_sender_comp_id                  : int;          (* Tag 49   *)
    h_target_comp_id                  : int;          (* Tag 56   *)
    h_msg_seq_num                     : int;          (* Tag 34   *)

    h_on_behalf_of_comp_id            : int option;   (* Tag 115  *)
    h_deliver_to_comp_id              : int option;   (* Tag 128  *)
    h_secure_data_len                 : int option;   (* Tag 90   *)
    h_secure_data                     : int option;   (* Tag 91   *)
    h_sender_sub_id                   : int option;   (* Tag 50   *)
    h_sender_location_id              : int option;   (* Tag 142  *)
    h_target_sub_id                   : int option;   (* Tag 57   *)
    h_target_location_id              : int option;   (* Tag 143  *)
    h_on_behalf_of_sub_id             : int option;   (* Tag 116  *)
    h_on_behalf_of_location_id        : int option;   (* Tag 114  *)
    h_deliver_to_sub_id               : int option;   (* Tag 129  *)
    h_deliver_to_location_id          : int option;   (* Tag 145  *)
    h_poss_dup_flag                   : bool option;  (* Tag 43   *)
    
    h_poss_resend                     : bool option;  (* Tag 97   *)
    h_sending_time                    : int option;   (* Tag 52   *)
    h_orig_sending_time               : int option;   (* Tag 122  *)
    h_xml_data_len                    : int option;   (* Tag 212  *)
    h_xml_data                        : int option;   (* Tag 213  *)
    h_message_enconding               : int option;   (* Tag 347  *)
    h_last_msg_seq_num_processed      : int option;   (* Tag 369  *)
    h_no_hops                         : int option;   (* Tag 627  *)
}
;;

let default_fix_header = {
    h_begin_string                    = 0;
    h_body_length                     = 0;
    h_msg_seq_num                     = 0;
    h_poss_dup_flag                   = None;
    h_target_comp_id                  = 0;
    h_sender_comp_id                  = 0;
    h_on_behalf_of_comp_id            = None;
    h_deliver_to_comp_id              = None;
    h_secure_data_len                 = None;
    h_secure_data                     = None;
    h_sender_sub_id                   = None;
    h_sender_location_id              = None;
    h_target_sub_id                   = None;
    h_target_location_id              = None;
    h_on_behalf_of_sub_id             = None;
    h_on_behalf_of_location_id        = None;
    h_deliver_to_sub_id               = None;
    h_deliver_to_location_id          = None;
    h_poss_resend                     = None;
    h_sending_time                    = None;
    h_orig_sending_time               = None;
    h_xml_data_len                    = None;
    h_xml_data                        = None;
    h_message_enconding               = None;
    h_last_msg_seq_num_processed      = None;
    h_no_hops                         = None;
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
