#!/usr/bin/env ocaml
#use "topfind"
#require "topkg"
open Topkg

let examples =
  Conf.key
    "build-examples"
    Conf.bool
    ~doc:"Build the example programs"
    ~absent:false

let () =
  Pkg.describe "fix-engine" @@ fun c ->
  let examples = Conf.value c examples in
  Ok [ Pkg.mllib ~api:["fix_engine"] "src/fix_engine.mllib"
       ; Pkg.mllib ~api:["datetime"
                        ; "full_messages"
                        ; "full_admin_messages"
                        ; "full_app_messages"
                        ; "full_session_core"
                        ; "basic_types"
                        ; "full_fix_fields"] "src-protocol/fix_protocol.mllib"
(*     ; Pkg.test ~dir:"src" "test/main" *)
     ; Pkg.bin ~cond:examples "src-examples/fix_examples"
     ]