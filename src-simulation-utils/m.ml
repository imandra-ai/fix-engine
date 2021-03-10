module type SIG = sig
  type 'a t

  val ( >>= ) : 'a t -> ('a -> 'b t) -> 'b t
  val return : 'a -> 'a t

end

module type IO = sig

  module M : SIG

  type in_channel

  val open_in : string -> in_channel M.t
  val input_line : in_channel -> string M.t
  val input_char : in_channel -> char M.t
  val close_in : in_channel -> unit M.t

  type out_channel

  val open_out : string -> out_channel M.t
  val write_str : out_channel -> string -> unit M.t
  val close_out : out_channel -> unit M.t
end

module Invoke : SIG = struct
  type 'a t = 'a

  let (>>=) m f = f m
  let return x : 'a t = x

end

let (%>) f g x = g (f x)

module Blocking_IO : IO with module M = Invoke = struct

  module M = Invoke

  open M

  type nonrec in_channel = in_channel

  let open_in = open_in %> return
  let input_line = input_line %> return
  let input_char = input_char %> return
  let close_in = close_in %> return

  type nonrec out_channel = out_channel

  let open_out = open_out %> return
  let write_str oc s = Printf.fprintf oc "%s" s |> return
  let close_out = close_out %> return

end

(* TODO: lwt *)
