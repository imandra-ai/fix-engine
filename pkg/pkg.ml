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
  let examples = Conf.value c examples in Ok 
  [ Pkg.mllib ~api: [ "fix_engine" ] "src/fix_engine.mllib";
    Pkg.mllib ~api: [ "full_messages";
                      "full_fix_fields";
                      "full_admin_messages";
                      "full_session_core";
                      "full_fix_fields"] "src-protocol/protocol.mllib";
    Pkg.mllib ~api: [ "fix_engine_json";
                      "full_admin_msg_json";
                      "full_msg_json"] "src-protocol-pp/protocol_pp.mllib";
    Pkg.mllib ~api: [ "base_types"] "src-core/core.mllib";
    Pkg.mllib ~api: [ "base_types_json"] "src-core-pp/core_pp.mllib";
    Pkg.mllib ~api: [ "full_app_messages"] "src-model/model.mllib"; 
    Pkg.bin ~cond:examples "src-examples/fix_examples"
  ]