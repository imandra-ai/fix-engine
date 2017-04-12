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
  [  
      Pkg.mllib ~api: [ "base_types"
                      ; "datetime"
                      ; "imandra_utils"
                      ; "numeric" ] "src-core/core.mllib"

    ; Pkg.mllib ~api: [ "full_app_enums"
                      ; "full_app_tags"
                      ; "full_app_messages"
                      ] "src-protocol-exts/protocol_exts.mllib"

    ; Pkg.mllib ~api: [ "full_messages"
                      ; "full_admin_messages"
                      ; "full_session_core"
                      ; "full_protocol_fields" ] "src-protocol/protocol.mllib"

    ; Pkg.mllib ~api: [ "fix_engine" ] "src/fix_engine.mllib"


    ; Pkg.mllib ~api: [ "base_types_json"
                      ; "datetime_json" ] "src-core-pp/core_pp.mllib"

    ; Pkg.mllib ~api: [ "full_app_enums_json"
                      ; "full_app_tags_json"
                      ; "full_app_messages_json" ] "src-protocol-exts-pp/protocol_exts_pp.mllib" 

    ; Pkg.mllib ~api: [ "fix_engine_json"
                      ; "full_admin_enums_json"
                      ; "full_admin_messages_json"
                      ; "full_admin_tags_json"
                      ; "full_messages_json"
                      ; "full_message_tags_json" ] "src-protocol-pp/protocol_pp.mllib"

(*

    ; Pkg.mllib ~api: [ "model_app_messages"
                      ] "src-model-types/model_types.mllib"

    ; Pkg.mllib ~api: [ "fixparser"
                      ; "parse_basic_types"
                      ; "parse_datetime"
                      ] "src-parser/fixparser.mllib" 

    ; Pkg.mllib ~api: [ "type_converter"
                      ] "src-model-conversions/model_conversions.mllib"

    ; Pkg.bin ~cond:examples "src-examples/example_runner"
*)

    ; Pkg.doc "doc/all_modules.docdir/all_modules.dot"

  ]
