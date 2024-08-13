type t = (string * string) list [@@deriving show]

let checksum_string (s : string) : int =
  let n = ref 0 in
  for i = String.length s - 1 downto 0 do
    n := !n + Char.code (String.unsafe_get s i)
  done;
  !n

let checksum (msg : t) =
  let rec scan n msg =
    match msg with
    | ("10", _v) :: _tl -> n mod 256
    | (k, v) :: tl -> scan (checksum_string k + checksum_string v + 62 + n) tl
    | [] -> n mod 256
  in
  scan 0 msg

let do_check_checksum = ref true

let valid_checksum (self : t) : bool =
  if not !do_check_checksum then
    true
  else (
    let c = checksum self in
    match List.find_opt (fun (tag, _) -> tag = "10") self with
    | None -> false
    | Some (_tag, c') ->
      (match int_of_string_opt c' with
      | None -> false
      | Some c' ->
        (* stored checksum (at tag "10") must be the same as our computed checksum *)
        c = c')
  )

let valid_body_length (msg : (string * string) list) : bool =
  let body_length =
    let rec scan n msg =
      match msg with
      | ("8", _) :: tl | ("9", _) :: tl -> scan n tl
      | ("10", _) :: _tl -> n
      | (k, v) :: tl -> n + scan String.(length k + length v + 2) tl
      | [] -> n
    in
    scan 0 msg
  in
  match msg with
  | ("8", _) :: ("9", bl) :: _ ->
    (try body_length = int_of_string bl with _ -> false)
  | _ -> false
