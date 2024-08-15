module Parse_float = struct
  let float_multiplier = Float.of_int 1000000

  let float_6_to_float float_6 =
    match float_6 with
    | Numeric.Float_6 i ->
      Float.div (i |> Z.to_int |> Float.of_int) float_multiplier

  let assert_parse_some_eq input expected =
    let actual = Parse_base_types.parse_float input in
    match actual with
    | Some actual ->
      let actual = float_6_to_float actual in
      if actual <> expected then (
        Printf.eprintf "parse_float: not equal - expected:%f vs actual:%f\n"
          expected actual;
        assert false
      )
    | None ->
      Printf.eprintf "parse_float: float parse failure of: %s\n" input;
      assert false

  let () = assert_parse_some_eq "0" 0.

  let () = assert_parse_some_eq "123" 123.

  let () = assert_parse_some_eq "1234567" 1234567.

  let () = assert_parse_some_eq "12.3456" 12.3456

  let () = assert_parse_some_eq "0.123456" 0.123456

  let () = assert_parse_some_eq "0.1234567" 0.123456

  let () = assert_parse_some_eq "-0.001234" (-0.001234)
end
