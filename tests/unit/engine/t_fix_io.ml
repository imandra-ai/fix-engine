let encode_ref ~split msg =
  let split = String.make 1 split in
  msg
  |> List.map (fun (k, v) -> k ^ "=" ^ v)
  |> List.fold_left (fun a s -> a ^ s ^ split) ""


let check_same ~split s =
  let msg1 = encode_ref ~split s in
  let msg2 = Fix_io.encode ~split s in
  if msg1 <> msg2
  then (
    Printf.eprintf "encode err:  %S vs %S\n%!" msg1 msg2 ;
    assert false )


let () = check_same ~split:'|' []

let () = check_same ~split:'|' [ ("k", "v") ]

let () = check_same ~split:'|' [ ("a", "b"); ("c", "d") ]

let () =
  check_same ~split:'|'
  @@ List.init 200 (fun i -> (string_of_int i, Printf.sprintf "v%d" i))
