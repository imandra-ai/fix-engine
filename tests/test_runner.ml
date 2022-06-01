let () =
  let open Cmdliner in
  let doc = "Tests a FIX server following a *.def script file." in
  let info =
    Cmd.info "test_runner" ~version:"%%VERSION%%" ~doc ~exits:Cmd.Exit.defaults
  in
  let def_fname = Arg.(value & pos 0 string "" & info []) in
  Cmd.eval (Cmd.v info Term.(const Test_runner_utils.def_reader $ def_fname))
  |> ignore
