[@@@require "imandra-ptime"]

module type Timestamp = sig
  type t
  val epoch : t
  val of_ptime : Imandra_ptime.t -> t
  val to_ptime : t -> Imandra_ptime.t
  val equal : t -> t -> bool
end

module Micro : Timestamp = struct
    type t = Imandra_ptime.t
    let epoch = Imandra_ptime.epoch
    let of_ptime = Fun.id
    let to_ptime t = t
    let equal = Imandra_ptime.equal
end

module Nano : Timestamp = struct
    type t = Imandra_ptime.t
    let epoch = Imandra_ptime.epoch
    let of_ptime = Fun.id
    let to_ptime t = t
    let equal = Imandra_ptime.equal
end
