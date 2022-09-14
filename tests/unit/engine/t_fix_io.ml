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
    {|
  8=FIX.4.4|9=399|35=8|34=595|49=QA_ORDER_GB|56=QA_00000648_0|52=20220912-07:00:24.674988|150=0|39=0|37=2575671|17=ZND257567229CQBLL2wO-1|11=Tcq.0000.VAS_3e16sWJ|453=3|448=934|452=122|447=P|2376=24|448=1|452=3|447=P|448=123|452=12|447=P|2376=22|581=3|528=P|18=M|9020=1|9952=Rpb_two_simple_valid_co_orders_f|1724=0|54=1|6=0|14=0|151=46|38=46|40=P|59=0|15=CHF|207=XSWX|55=CH0030170408|60=20220912-07:00:24.674998|10=156|
8=FIX.4.4|9=417|35=8|115=QA_00000648_0|34=305|49=QA_DROP_GB|56=QA_00000648_0|52=20220912-07:00:24.675002|150=0|39=0|37=2575671|17=ZND257567229CQBLL2w.2|11=Tcq.0000.VAS_3e16sWJ|54=1|38=46|581=3|55=CH0030170408|207=XSWX|9952=Rpb_two_simple_valid_co_orders_f|59=0|528=P|40=P|15=CHF|18=M|6=0.0|14=0|151=46|60=20220912-07:00:24.674998|1724=0|453=3|448=934|452=122|447=P|2376=24|448=1|452=3|447=P|448=123|452=12|447=P|2376=22|9020=1|10=035|
8=FIX.4.4|9=362|35=D|49=QA_00010037_0|56=QA_ORDER_GB|34=483|52=20220912-07:00:24.675901|38=35|55=CH0030170408|207=XSWX|11=Tcq.0000.VAS_FH792A2U5E07|581=1|18=M|100=_|54=2|60=20220912-07:00:24.675771|40=P|15=CHF|59=0|528=R|9952=Rpb_two_simple_valid_co_orders_fill|8015=2|9020=1|453=3|448=750|447=P|452=122|2376=22|448=263|447=P|452=3|2376=23|448=277|447=P|452=12|2376=24|10=150|
8=FIX.4.4|9=434|35=8|115=QA_00000648_0|34=306|49=QA_DROP_GB|56=QA_00000648_0|52=20220912-07:00:24.676848|150=4|39=4|37=2575671|17=ZND257567229CQBLL2w.3|11=Tcq.0000.VAS_3e16sWJ|58=Terminated (2)|54=1|38=46|581=3|55=CH0030170408|207=XSWX|9952=Rpb_two_simple_valid_co_orders_f|59=0|528=P|40=P|15=CHF|18=M|6=0.0|14=0|151=0|60=20220912-07:00:24.676842|1724=0|453=3|448=934|452=122|447=P|2376=24|448=1|452=3|447=P|448=123|452=12|447=P|2376=22|9020=1|10=086|
8=FIX.4.4|9=216|35=8|34=596|49=QA_ORDER_GB|56=QA_00000648_0|52=20220912-07:00:24.676848|150=D|378=100|60=20220912-07:00:24.676842|37=2575671|17=ZND257567229CQBLL2wO-1|11=Tcq.0000.VAS_3e16sWJ|39=0|54=1|23=2575671|53=46|9712=36|10=053|
8=FIX.4.4|9=421|35=8|34=563|49=QA_ORDER_GB|56=QA_00010037_0|52=20220912-07:00:24.676848|150=0|39=0|37=2575681|17=ZND257568229CQBLL2wO-1|11=Tcq.0000.VAS_FH792A2U5E07|453=3|448=750|452=122|447=P|2376=22|448=263|452=3|447=P|2376=23|448=277|452=12|447=P|2376=24|581=1|528=R|18=M|9020=1|9952=Rpb_two_simple_valid_co_orders_f|8015=2|1724=0|54=2|6=0|14=0|151=35|38=35|40=P|59=0|15=CHF|207=XSWX|55=CH0030170408|60=20220912-07:00:24.676842|10=093|
8=FIX.4.4|9=412|35=8|34=597|49=QA_ORDER_GB|56=QA_00000648_0|52=20220912-07:00:24.676848|150=4|39=4|60=20220912-07:00:24.676842|37=2575671|17=ZND257567229CQBLL2wO-2|11=Tcq.0000.VAS_3e16sWJ|453=3|448=934|452=122|447=P|2376=24|448=1|452=3|447=P|448=123|452=12|447=P|2376=22|581=3|528=P|18=M|9020=1|9952=Rpb_two_simple_valid_co_orders_f|1724=0|54=1|6=0|14=0|151=0|38=46|40=P|59=0|15=CHF|207=XSWX|55=CH0030170408|58=Terminated|10=010|
8=FIX.4.4|9=221|35=8|34=564|49=QA_ORDER_GB|56=QA_00010037_0|52=20220912-07:00:24.676848|150=D|378=100|60=20220912-07:00:24.676842|37=2575681|17=ZND257568229CQBLL2wO-1|11=Tcq.0000.VAS_FH792A2U5E07|39=0|54=2|23=2575681|53=35|9712=80|10=236|
8=FIX.4.4|9=439|35=8|115=QA_00010037_0|34=274|49=QA_DROP_GB|56=QA_00010037_0|52=20220912-07:00:24.676848|150=0|39=0|37=2575681|17=ZND257568229CQBLL2w.1|11=Tcq.0000.VAS_FH792A2U5E07|54=2|38=35|581=1|55=CH0030170408|207=XSWX|9952=Rpb_two_simple_valid_co_orders_f|59=0|528=R|40=P|15=CHF|18=M|6=0.0|14=0|151=35|60=20220912-07:00:24.676842|8015=2|1724=0|453=3|448=750|452=122|447=P|2376=22|448=263|452=3|447=P|2376=23|448=277|452=12|447=P|2376=24|9020=1|10=014|
8=FIX.4.4|9=434|35=8|34=565|49=QA_ORDER_GB|56=QA_00010037_0|52=20220912-07:00:24.676848|150=4|39=4|60=20220912-07:00:24.676842|37=2575681|17=ZND257568229CQBLL2wO-2|11=Tcq.0000.VAS_FH792A2U5E07|453=3|448=750|452=122|447=P|2376=22|448=263|452=3|447=P|2376=23|448=277|452=12|447=P|2376=24|581=1|528=R|18=M|9020=1|9952=Rpb_two_simple_valid_co_orders_f|8015=2|1724=0|54=2|6=0|14=0|151=0|38=35|40=P|59=0|15=CHF|207=XSWX|55=CH0030170408|58=Terminated|10=236|
8=FIX.4.4|9=456|35=8|115=QA_00010037_0|34=275|49=QA_DROP_GB|56=QA_00010037_0|52=20220912-07:00:24.676848|150=4|39=4|37=2575681|17=ZND257568229CQBLL2w.2|11=Tcq.0000.VAS_FH792A2U5E07|58=Terminated (2)|54=2|38=35|581=1|55=CH0030170408|207=XSWX|9952=Rpb_two_simple_valid_co_orders_f|59=0|528=R|40=P|15=CHF|18=M|6=0.0|14=0|151=0|60=20220912-07:00:24.676842|8015=2|1724=0|453=3|448=750|452=122|447=P|2376=22|448=263|452=3|447=P|2376=23|448=277|452=12|447=P|2376=24|9020=1|10=058|
8=FIX.4.4|9=378|35=D|49=QA_00000648_0|56=QA_ORDER_GB|34=491|52=20220912-07:00:24.677928|38=46|55=CH0030170408|207=XSWX|11=Tcq.0000.VAS_U02OAnEq27yCl85m5|1=U90C7rA13ON51|581=3|18=M|100=_|54=1|60=20220912-07:00:24.677776|40=P|15=CHF|23=2575671|59=0|528=P|9952=Rpb_two_simple_valid_co_orders_fill|21533=0|453=3|448=934|447=P|452=122|2376=24|448=1|447=P|452=3|448=123|447=P|452=12|2376=22|10=204|
8=FIX.4.4|9=455|35=8|115=QA_00000648_0|34=307|49=QA_DROP_GB|56=QA_00000648_0|52=20220912-07:00:24.678940|150=0|39=0|37=2575691|17=ZND257569229CQBLL2w.2|11=Tcq.0000.VAS_U02OAnEq27yCl85m5|54=1|38=46|581=3|55=CH0030170408|207=XSWX|9952=Rpb_two_simple_valid_co_orders_f|59=0|528=P|40=P|15=CHF|18=M|1=U90C7rA13ON51|6=0.0|14=0|151=46|60=20220912-07:00:24.678936|1724=0|453=3|448=934|452=122|447=P|2376=24|448=1|452=3|447=P|448=123|452=12|447=P|2376=22|23=2575671|21533=0|10=052|
8=FIX.4.4|9=437|35=8|34=598|49=QA_ORDER_GB|56=QA_00000648_0|52=20220912-07:00:24.678940|150=0|39=0|37=2575691|17=ZND257569229CQBLL2wO-1|11=Tcq.0000.VAS_U02OAnEq27yCl85m5|453=3|448=934|452=122|447=P|2376=24|448=1|452=3|447=P|448=123|452=12|447=P|2376=22|581=3|528=P|18=M|9952=Rpb_two_simple_valid_co_orders_f|1724=0|23=2575671|21533=0|54=1|6=0|14=0|151=46|38=46|40=P|59=0|15=CHF|207=XSWX|55=CH0030170408|1=U90C7rA13ON51|60=20220912-07:00:24.678936|10=143|
8=FIX.4.4|9=144|35=3|34=157719|49=QF|52=20220915-14:26:46.076774|56=IMANDRA|45=157713|58=Tag not defined for this message type, field=2376|371=2376|372=D|373=2|10=180|
    |}
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
