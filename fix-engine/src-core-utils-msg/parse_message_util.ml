let split_into_key_value (sep : char) (str : string) : (string * string) Seq.t =
  (* find the next split char in the internal buffer *)
  let next_split i : int option =
    match String.index_from_opt str i sep with
    | Some n when n >= String.length str -> None
    | r -> r
  in

  let rec loop ~is_done ~i () : _ Seq.node =
    if is_done || i >= String.length str then
      Seq.Nil
    else (
      let end_of_kv, is_done =
        match next_split i with
        | None -> String.length str, true
        | Some idx_split -> idx_split, false
      in

      (* now look for '=' *)
      match String.index_from_opt str i '=' with
      | Some idx_eq when idx_eq < end_of_kv ->
        let k = String.sub str i (idx_eq - i) in
        let v = String.sub str (idx_eq + 1) (end_of_kv - idx_eq - 1) in
        Seq.Cons ((k, v), loop ~is_done ~i:(end_of_kv + 1))
      | _ -> Seq.Nil
    )
  in
  loop ~is_done:false ~i:0

let split_into_messages (seq : (string * string) Seq.t) :
    (string * string) list Seq.t =
  let rec loop acc seq () =
    match seq () with
    | Seq.Nil -> Seq.Nil
    | Seq.Cons ((k, v), tail) ->
      if k = "10" then (
        let msg = (k, v) :: acc |> List.rev in
        Seq.Cons (msg, loop [] tail)
      ) else
        loop ((k, v) :: acc) tail ()
  in
  loop [] seq
