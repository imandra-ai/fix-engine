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
  [   Pkg.mllib ~api: [ "fix_engine" ] "src/fix_engine.mllib"

    ; Pkg.mllib ~api: [ "full_messages"
                      ; "full_admin_messages"
                      ; "full_session_core"
                      ; "full_protocol_fields" ] "src-protocol/protocol.mllib"

    ; Pkg.mllib ~api: [ "fix_engine_json"
                      ; "full_admin_msg_json"
                      ; "full_msg_json" ] "src-protocol-pp/protocol_pp.mllib"

    ; Pkg.mllib ~api: [ "base_types"
                      ; "datetime"
                      ; "imandra_utils"
                      ; "numeric" ] "src-core/core.mllib"

    ; Pkg.mllib ~api: [ "base_types_json"
                      ; "datetime_json" ] "src-core-pp/core_pp.mllib"

    ; Pkg.mllib ~api: [ "model_app_messages"
                      ] "src-model-types/model_types.mllib"

    ; Pkg.mllib ~api: [ "fixparser"
                      ; "parse_basic_types"
                      ; "parse_datetime"
                      ] "src-parser/fixparser.mllib" 

    ; Pkg.mllib ~api: [ "fix_fields"
                      ; "full_app_message_tag"
                      ; "full_app_messages"
                      ; "model_fields"
                      ] "src-model-protocol-exts/model_protocol_exts.mllib"

    ; Pkg.mllib ~api: [ "type_converter"
                      ] "src-model-conversions/model_conversions.mllib"

    ; Pkg.bin ~cond:examples "src-examples/example_runner"

    ; Pkg.doc "doc/all_modules.docdir/all_modules.dot"
  ]
