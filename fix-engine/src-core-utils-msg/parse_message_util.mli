(** Utilities to parse messages *)

val split_into_key_value : char -> string -> (string * string) Seq.t
(** [split_into_key_value sep str] splits the string into [key=value]
    pairs, separated by [sep]. *)

val split_into_messages : (string * string) Seq.t -> Message.t Seq.t
(** Split a stream of key/value pairs into full messages, terminated by "10" *)
