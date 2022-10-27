(* a list of messages to test *)
let test_data_l : string list =
  Test_engine_data.fix_data |> String.split_on_char '\n' |> List.map String.trim
  |> List.filter (fun s -> s <> "")

let test_data : string = test_data_l |> String.concat ""

let () =
  let seq = Parse_message_util.split_into_key_value '|' test_data in
  Printf.printf "number of k/v pairs: %d\n%!" (CCSeq.length seq)

let () =
  let seq =
    Parse_message_util.split_into_key_value '|' test_data
    |> Parse_message_util.split_into_messages
  in
  Printf.printf "number of messages: %d\n%!" (CCSeq.length seq);
  assert (CCSeq.length seq = List.length test_data_l)

let () =
  let seq =
    Parse_message_util.split_into_key_value '|' test_data
    |> Parse_message_util.split_into_messages
  in
  let msg0 = CCSeq.take 1 seq |> CCSeq.to_list |> CCList.hd in
  Printf.printf "first message: %s\n%!" (Message.show msg0)

(* test long sequence of messages *)
let () =
  (* repeat [test_data] many times *)
  let n_copies = 1000 in
  let expected_len = n_copies * List.length test_data_l in
  let data = String.concat "" @@ CCList.repeat n_copies test_data_l in

  let seq =
    Parse_message_util.split_into_key_value '|' data
    |> Parse_message_util.split_into_messages
  in
  Printf.printf "number of messages (long): %d\n%!" (CCSeq.length seq);
  assert (CCSeq.length seq = expected_len)
