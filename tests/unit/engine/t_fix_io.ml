module Encode = struct
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
end

let assert_eq_msg (m1 : Fix_io.message) m2 =
  if m1 <> m2
  then (
    Printf.printf
      "different messages:\n  %s\n vs: %s\n%!"
      (Fix_io.show_message m1)
      (Fix_io.show_message m2) ;
    assert false )


module Receive = struct
  (* a list of messages to test *)
  let test_data : string list =
    Test_engine_data.fix_data
    |> String.split_on_char '\n'
    |> List.map String.trim
    |> List.filter (fun s -> s <> "")


  open Lwt.Syntax

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
      if k <> "10"
      then get_message ~split ic msg
      else Lwt.return @@ List.rev msg


    let read_next_message ~split ic =
      Lwt.catch
        (fun () ->
          let+ m = get_message ~split ic [] in
          Some m )
        (function End_of_file -> Lwt.return None | e -> raise e)
  end

  let read_messages ~init ~read_next_message (data : string) :
      Fix_io.message list Lwt.t =
    let ic = Lwt_io.of_bytes ~mode:Lwt_io.input @@ Lwt_bytes.of_string data in
    let reader = init ~split:'|' ic in
    let rec loop acc =
      let* m = read_next_message reader in
      match m with
      | None ->
          Lwt.return @@ List.rev acc
      | Some m ->
          loop (m :: acc)
    in
    loop []


  let test ~buf_size =
    Lwt_main.run
      (let data = String.concat "" test_data in
       let* l1 =
         read_messages
           ~init:(fun ~split ic -> (split, ic))
           ~read_next_message:(fun (split, ic) ->
             Ref.read_next_message ~split ic )
           data
       in
       let* l2 =
         (* small buffer size to test the resize/refill *)
         read_messages
           ~init:(Fix_io.Read.create ~buf_size)
           ~read_next_message:Fix_io.Read.read_next_message
           data
       in
       if l1 <> l2
       then (
         Format.printf
           "parsed (ref): %a@."
           (Format.pp_print_list Fix_io.pp_message)
           l1 ;
         Format.printf
           "parsed (fix_io): %a@."
           (Format.pp_print_list Fix_io.pp_message)
           l2 ;
         assert false ) ;
       Lwt.return () )


  let () = test ~buf_size:8

  let () = test ~buf_size:16

  let () = test ~buf_size:32

  let () = test ~buf_size:(16 * 1024)

  (* test a k/v pair that is longer than the buffer *)
  let () =
    Lwt_main.run
    @@
    let ic =
      Lwt_io.of_bytes ~mode:Lwt_io.input
      @@ Lwt_bytes.of_string
           (Printf.sprintf "key=%s|10=123|" (String.make 2000 'a'))
    in
    let read = Fix_io.Read.create ~buf_size:32 ~split:'|' ic in
    let* m = Fix_io.Read.read_next_message read in
    match m with
    | Some [ ("key", v); ("10", _) ] ->
        assert (String.length v = 2000) ;
        Lwt.return ()
    | Some m ->
        Printf.eprintf "got message %s\n%!" (Fix_io.show_message m) ;
        assert false
    | _ ->
        assert false


  (* test a k/v pair that is longer than the buffer *)
  let () =
    Lwt_main.run
    @@
    let ic =
      Lwt_io.of_bytes ~mode:Lwt_io.input
      @@ Lwt_bytes.of_string
           (Printf.sprintf
              "a=b|%s=%s|10=123|"
              (String.make 2000 'k')
              (String.make 2000 'v') )
    in
    let read = Fix_io.Read.create ~buf_size:32 ~split:'|' ic in
    let* m = Fix_io.Read.read_next_message read in
    match m with
    | Some [ ("a", "b"); (k, v); ("10", _) ] ->
        assert (String.length k = 2000) ;
        assert (String.length v = 2000) ;
        Lwt.return ()
    | Some m ->
        Printf.eprintf "got message %s\n%!" (Fix_io.show_message m) ;
        assert false
    | _ ->
        assert false


  (* test long sequence of messages *)
  let () =
    Lwt_main.run
    @@
    (* repeat [test_data] many times *)
    let n_copies = 1000 in
    let expected_len = n_copies * List.length test_data in
    let data = String.concat "" @@ CCList.repeat n_copies test_data in

    let* msg_l =
      read_messages
        ~init:(Fix_io.Read.create ~buf_size:401)
        ~read_next_message:Fix_io.Read.read_next_message
        data
    in

    assert (List.length msg_l = expected_len) ;
    Lwt.return ()
end
