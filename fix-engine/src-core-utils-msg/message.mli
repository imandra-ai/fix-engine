type t = (string * string) list [@@deriving show]

val checksum_string : string -> int

val checksum : t -> int
(** A checksum in [[0..<256]] *)
