
let () = 
    let open Cmdliner in
    let doc = "Tests a FIX server following a *.def script file." in
    let info = 
        Term.info "test_runner" ~version:"%%VERSION%%" ~doc ~exits:Term.default_exits 
        in
    let def_fname = Arg.(value & pos 0 string "" & info []) in
    Term.exit @@ Term.eval (Term. (const Test_runner_utils.def_reader $ def_fname ), info)
;; 
