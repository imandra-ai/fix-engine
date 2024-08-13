type t = (string * string) list [@@deriving show]

val checksum_string : string -> int

val do_check_checksum : bool ref

val valid_checksum : t -> bool
(** Verifies the checksum (sum of all bytes mod 256) of all bytes in
    the message up to the CheckSum<10> entry. Returns true if the computed
    checksum is equal to the value of CheckSum<10>.
*)

val checksum : t -> int
(** A checksum in [[0..<256]] *)

val do_check_body_length : bool ref

val valid_body_length : t -> bool
(** Checks that the message contains BodyLength<9> field as a second entry
    in the message. And that the value equals to the number of bytes between
    BodyLength<9> and CheckSum<10> entries in the message.
*)
