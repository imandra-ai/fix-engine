open Full_messages_decoder
open Full_messages_json
module D = Decoders_yojson.Basic.Decode;;

let msgs = [
  "8=FIX.4.2|9=163|35=D|49=BLP|56=RJCO|34=1575|52=20200401-13:05:28|50=7898513|115=24X|60=20200401-13:05:28|1=24XCARE|38=1|40=2|11=20200401-00001-00001|44=172|21=3|54=1|55=RXM0|59=0|10=149|";
  "8=FIX.4.2|9=163|35=D|49=BLP|56=RJCO|34=1575|52=20200401-13:05:28|50=7898513|115=24X|60=20200401-13:05:28|1=24XCARE|38=1|40=2|11=20200401-00001-00001|44=172|21=3|54=1|55=RXM0|59=0|10=149|"
];;

let () =
  List.iter (fun message ->
  let message =
      Stream.of_string message
      |> Parser_utils.split_into_key_value '|'
      |> Parser_utils.split_into_messages
      |> Stream.next
      |> Parse_full_messages.parse_top_level_msg in
  let json = full_top_level_msg_to_json message |> Yojson.Basic.to_string in
  D.decode_string full_top_level_msg_decoder json |>
  function
  | Ok rt ->
    if rt = message
    then print_endline "Roundtrip successful"
    else failwith "Roundtrip failed"
  | Error r ->
    failwith (D.pp_error Format.std_formatter r; failwith "decoding of full message failed")) msgs
;;
