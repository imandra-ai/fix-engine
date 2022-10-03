type t = (string * string) list [@@deriving show]

val checksum_string : string -> int

val valid_checksum : t -> bool
(** Verifies the checksum (sum of all bytes mod 256) of all bytes in
    the message up to the CheckSum<10> entry. Returns true if the computed
    checksum is equal to the value of CheckSum<10>.
*)

val checksum : t -> int
(** A checksum in [[0..<256]] *)
