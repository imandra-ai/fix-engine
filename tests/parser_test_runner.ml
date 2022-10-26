let run_one (message, result) =
  message
  |> Parser_utils.split_into_key_value '|'
  |> Parser_utils.split_into_messages |> CCSeq.take 1 |> CCSeq.to_list
  |> List.hd
  |> fun message ->
  match
    Parser_combinators.run
      (Parse_full_messages.parse_top_level_msg
         Parse_datetime.parse_UTCTimestamp_micro)
      message
  with
  | Ok (ValidMsg { full_msg_data = Full_FIX_App_Msg data; _ }) ->
    assert (data = result)
  | _ -> assert false

let _ = CCList.iter run_one Parser_tests.tests
