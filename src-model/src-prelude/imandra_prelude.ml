module Map = struct
  type ('a, 'b) t = Empty | NotEmpty
 
  let const (b:'b) = Empty;;
  let add (a:'a) (b:'b) (x: ('a, 'b) t) = x;;
  let get (a:'a) (x: ('a, 'b) t)= false;;
end

module String = struct
  type t = string

  let empty s = "";;
  let length (a:t) = 0;;
  let concat (a:t) (ss:t list):t = "";;
  let sub (a:t) (st:int) (en:int) : t option = None;;
end

module Set = struct
  type 'a t = ('a, bool) Map.t

  let subset (a:'a t) (b:'a t) : bool = false;;
end