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
                      ; "full_app_messages"
                      ; "full_app_records"
                      ; "full_app_tags"
                      ] "src-protocol-exts/protocol_exts.mllib"

    ; Pkg.mllib ~api: [ "full_admin_enums"
                      ; "full_admin_messages"
                      ; "full_admin_tags"
                      ; "full_message_tags"
                      ; "full_messages"
                      ] "src-protocol/protocol.mllib"

    ; Pkg.mllib ~api: [ "fix_engine" ] "src/fix_engine.mllib"

    ; Pkg.mllib ~api: [ "base_types_json"
                      ; "datetime_json"
                      ; "parse_base_types"
                      ; "parse_datetime"
                      ; "parser_utils" ] "src-core-pp/core_pp.mllib"

    ; Pkg.mllib ~api: [ "full_app_enums_json"
                      ; "full_app_messages_json" 
                      ; "full_app_records_json" 
                      ; "full_app_tags_json"
                      ; "parse_app_enums"
                      ; "parse_app_messages"
                      ; "parse_app_records"
                      ; "parse_app_tags" 
                      ] "src-protocol-exts-pp/protocol_exts_pp.mllib" 

    ; Pkg.mllib ~api: [ "fix_engine_json"
                      ; "full_admin_enums_json"
                      ; "full_admin_messages_json"
                      ; "full_admin_tags_json"
                      ; "full_message_tags_json"
                      ; "full_messages_json"
                      ; "parse_admin_enums"
                      ; "parse_admin_messages"
                      ; "parse_admin_tags"
                      ; "parse_full_messages"
                      ; "parse_full_tags"
                      ] "src-protocol-pp/protocol_pp.mllib"

    ; Pkg.bin "src-examples/wire_to_json"

    ; Pkg.bin ~cond:examples "src-examples/example_runner"

    ; Pkg.doc "doc/all_modules.docdir/all_modules.dot"
  ]
