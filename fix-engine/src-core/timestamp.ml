[@@@require "imandra-ptime"]

module type Timestamp = sig
  type t
  val epoch : t
  val of_ptime : Imandra_ptime.t -> t
  val to_ptime : t -> Imandra_ptime.t
end

module Micro : Timestamp = struct
    type t = Imandra_ptime.t
    let epoch = Imandra_ptime.epoch
    let of_ptime = Fun.id
    let to_ptime t = t
end

module Nano : Timestamp = struct
    type t = Imandra_ptime.t
    let epoch = Imandra_ptime.epoch
    let of_ptime = Fun.id
    let to_ptime t = t
end
