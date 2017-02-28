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
  Ok [ Pkg.mllib ~api:["Engineio_client"; "Socketio_client"] "src/socketio_client.mllib"
     ; Pkg.test ~dir:"src" "test/main"
     ; Pkg.bin ~cond:examples "src-examples/fix_examples"
     ]