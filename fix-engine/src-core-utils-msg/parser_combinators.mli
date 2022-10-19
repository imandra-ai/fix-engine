(** Parser combinators for FIX messages.


    Each combinator has access to the message and can query key/values.

    A typical message parser would look like this.

    {[
      let parse_message = Parser_combinators.(
        let* group = repeating "1" parse_rg in
        let* () = check_duplicate_tags msg in
        let* block = block parse_blk
        and* x = req "2" parse_int
        and* y = opt "3" parse_string
        and* z = req "4" parse_int in
        let+ () = check_unknown_tags in
        \{ block; group; x; y; z \}
      )
    ]}
*)

type msg = Message.t

type tag = string

type error =
  | UnknownMessageTag of string
  | RequiredTagMissing of string
  | DuplicateTag of string
  | WrongValueFormat of string
  | UndefinedTag of string
  | EmptyValue of string
  | IncorrectNumInGroupCount of string
  | RepeatingGroupOutOfOrder of string
  | GarbledMessage

(** Result of parsing *)
type nonrec 'a result = ('a, error) result

type +'a t

type +'a value_parser = string -> 'a option

val run : 'a t -> msg -> 'a result

val return : 'a -> 'a t

val fail : error -> _ t

val get_msg : msg t
(** Get current message *)

val set_msg : msg -> unit t
(** Set current message *)

val reflect_err : 'a t -> 'a result t
(** [reflect_err p] captures errors occurring in [p] and reflects them
    into the returned value. *)

val req : tag -> 'a value_parser -> 'a t
(** Required field *)

val opt : tag -> 'a value_parser -> 'a option t
(** Optional field *)

val repeating : tag -> block_parser:'a t -> (int option * 'a list) t
(** Repeating group parser combinator, starting from the tag that encodes
    the length of the list, identifies the subgroups and passes each of them
    into the block parser. Performs a number of consistency checks on the parsed
    results.
*)

val check_duplicate_tags : unit t
(** Checks for duplicate tags in messages, and fail if any is found
    with [DuplicateTag _].
    Should be called after all the repeating groups are processed. *)

val check_unknown_tags : unit t
(** Checks for remaining tags that have not been processed, and
    fail if one is found with [UndefinedTag _]. Should be called
    at the end just before returning the result. *)

module Infix : sig
  val ( >|= ) : 'a t -> ('a -> 'b) -> 'b t

  val ( >>= ) : 'a t -> ('a -> 'b t) -> 'b t

  val ( let+ ) : 'a t -> ('a -> 'b) -> 'b t

  val ( let* ) : 'a t -> ('a -> 'b t) -> 'b t

  val ( and+ ) : 'a t -> 'b t -> ('a * 'b) t

  val ( and* ) : 'a t -> 'b t -> ('a * 'b) t
end

include module type of Infix
