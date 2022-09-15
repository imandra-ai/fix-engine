type t = (string * string) list [@@deriving show]

let checksum_string (s : string) : int =
  let n = ref 0 in
  for i = String.length s - 1 downto 0 do
    n := !n + Char.code (String.unsafe_get s i)
  done ;
  !n


let checksum (msg : t) =
  let rec scan n msg =
    match msg with
    | ("10", _v) :: _tl ->
        n mod 256
    | (k, v) :: tl ->
        scan (checksum_string k + checksum_string v + 62 + n) tl
    | [] ->
        n mod 256
  in
  scan 0 msg
