open Lwt.Syntax

(* ony block of test data *)
let test_data : string =
  Test_engine_data.fix_data
  |> String.split_on_char '\n'
  |> List.map String.trim
  |> List.filter (fun s -> s <> "")
  |> String.concat ""


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


let run n =
  Benchmark.throughput1
    ~name:(Printf.sprintf "run(%d)" n)
    3
    (fun () ->
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
      Lwt.return () )
    ()


let () =
  List.iter
    (fun n ->
      let r = run n in
      Benchmark.tabulate r )
    [ 100; 1_000; 5_000 ]
