open Cmdliner
 
let chorus count msg =
  for i = 1 to count do print_endline msg done

let count =
    let doc = "Repeat the message $(docv) times." in
    Arg.(value & opt int 10 & info ["c"; "count"] ~docv:"COUNT" ~doc)

let msg = 
    let doc = "Message to print" in
    let env = Arg.env_var "CHORUS_MSG" ~doc in
    let doc = "The message to print." in
    Arg.(value & pos 0 string "Revolt" & info [] ~env ~docv:"MSG" ~doc)

let cheorus_t = Term.(const chorus $ count $ msg)

let info =
    let doc = "Print repeatedly" in
    let man = [
        `S Manpage.s_bugs;
        `P "Email bugs to"
    ] in
    Term.info "test_runner" ~version:"%%VERSION%%" ~doc ~exits:Term.default_exits ~man

let () = Term.exit @@ Term.eval (cheorus_t, info)