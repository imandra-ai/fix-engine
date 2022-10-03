open Lwt.Syntax

(* ony block of test data *)
let test_data : string =
  Test_engine_data.fix_data
  |> String.split_on_char '\n'
  |> List.map String.trim
  |> List.filter (fun s -> s <> "")
  |> String.concat ""


(* reference implementation *)
module Ref = struct
  open Lwt.Infix

  (* Converts [ '5'; '2'; '='; 'A' ] to ("52" , "A" ) *)
  let extract_key_value (chlist : char list) : string * string =
    let buf = Buffer.create @@ List.length chlist in
    let () = chlist |> List.iter @@ Buffer.add_char buf in
    Buffer.contents buf
    |> String.split_on_char '='
    |> function [] -> ("", "") | h :: tl -> (h, String.concat "=" tl)


  let rec get_key_value ~split (ic : Lwt_io.input Lwt_io.channel) chars =
    Lwt_io.read_char ic
    >>= fun c ->
    if c <> split
    then get_key_value ~split ic (c :: chars)
    else Lwt.return @@ extract_key_value @@ List.rev chars


  let rec get_message ~split ic msg =
    get_key_value ~split ic []
    >>= fun (k, v) ->
    let msg = (k, v) :: msg in
    if k <> "10" then get_message ~split ic msg else Lwt.return @@ List.rev msg


  let read_next_message ~split ic =
    Lwt.catch
      (fun () ->
        let+ m = get_message ~split ic [] in
        Some m )
      (function End_of_file -> Lwt.return None | e -> raise e)
end

(* channel reading [n] copies of [test_data] *)
let source n : Lwt_io.input_channel =
  let len_data = String.length test_data in
  let n = ref n in
  let off = ref 0 in
  Lwt_io.make ~mode:Lwt_io.input (fun buf i ask_len ->
      try
        (* see if we still have bytes to read from [test_data] *)
        if !off >= len_data
        then
          if !n = 0
          then raise End_of_file
          else (
            decr n ;
            off := 0 ) ;

        (* how many bytes to copy *)
        let len = min (len_data - !off) ask_len in
        assert (len > 0) ;

        Lwt_bytes.blit_from_string test_data !off buf i len ;
        off := !off + len ;
        Lwt.return len
      with
      | End_of_file ->
          Lwt.return 0 )


let run_ref n =
  Lwt_main.run
  @@
  let ic = source n in
  let rec loop count =
    let* m = Ref.read_next_message ~split:'|' ic in
    match m with None -> Lwt.return count | Some _ -> loop (count + 1)
  in
  let* _count = loop 0 in
  (*Printf.printf "read %d messages\n%!" _count ;*)
  Lwt.return ()


let run_cur n =
  Lwt_main.run
  @@
  let ic = source n in
  let reader = Fix_io.Read.create ~split:'|' ic in

  let rec loop count =
    let* m = Fix_io.Read.read_next_message reader in
    match m with None -> Lwt.return count | Some _ -> loop (count + 1)
  in

  let* _count = loop 0 in
  (*Printf.printf "read %d messages\n%!" _count ;*)
  Lwt.return ()


let run n =
  let n_ref = run_ref n in
  let n_cur = run_cur n in
  assert (n_ref = n_cur) ;

  Benchmark.throughputN
    3
    [ (Printf.sprintf "run(%d)" n, run_cur, n)
    ; (Printf.sprintf "run-ref(%d)" n, run_ref, n)
    ]


let () =
  List.iter
    (fun n ->
      let r = run n in
      Benchmark.tabulate r )
    [ 100; 1_000; 5_000 ]
