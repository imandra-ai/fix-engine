#!/usr/bin/env ocaml
#use "topfind"
#require "topkg"
open Topkg

let vgs =
  Conf.key
    "build-vgs"
    Conf.bool
    ~doc:"Build a reduced VGs version and the example programs"
    ~absent:false

let () =
  Pkg.describe "fix-engine" @@ fun c ->
  let vgs = Conf.value c vgs in Ok
  [  
      Pkg.mllib ~api: [ "base_types"
                      ; "datetime"
                      ; "imandra_utils"
                      ; "numeric" 
                      ] "src-core/core.mllib"

    ; Pkg.mllib ~api: [ "base_types_json"
                      ; "datetime_json" 
                      ] "src-core-pp/core_pp.mllib"

    ; Pkg.mllib ~api: [ "full_messages"
                      ; "full_admin_messages"
                      ; "full_session_core"
                      ] "src-protocol/protocol.mllib"

    ; Pkg.mllib ~api: [ "fix_engine_json"
                      ; "full_admin_enums_json"
                      ; "full_admin_messages_json"
                      ; "full_admin_tags_json"
                      ; "full_messages_json"
                      ; "full_message_tags_json" 
                      ; "parse_admin_enums"
                      ; "parse_admin_messages"
                      ; "parse_admin_tags"
                      ] "src-protocol-pp/protocol_pp.mllib"

    ; Pkg.mllib ~api: [ "fix_engine" ] "src/fix_engine.mllib"

    ; Pkg.mllib ~cond: (not vgs)
                ~api: [ "full_app_enums"
                      ; "full_app_tags"
                      ; "full_app_messages"
                      ] "src-protocol-exts/protocol_exts.mllib"

    ; Pkg.mllib ~cond: (not vgs)
                ~api: [ "full_app_enums_json"
                      ; "full_app_tags_json"
                      ; "full_app_messages_json" 
                      ; "parse_app_enums"
                      ; "parse_app_tags"
                      ; "parse_app_messages" 
                      ] "src-protocol-exts-pp/protocol_exts_pp.mllib" 

    ; Pkg.mllib ~cond: vgs
                ~api: [ "full_app_enums"
                      ; "full_app_tags"
                      ; "full_app_messages"
                      ] "src-protocol-exts-vg/protocol_exts.mllib"

    ; Pkg.mllib ~cond: vgs
                ~api: [ "full_app_enums_json"
                      ; "full_app_tags_json"
                      ; "full_app_messages_json" 
                      ; "parse_app_enums"
                      ; "parse_app_tags"
                      ; "parse_app_messages" 
                      ] "src-protocol-exts-pp-vg/protocol_exts_pp.mllib" 

    ; Pkg.bin "src-examples/wire_to_json"

    ; Pkg.bin ~cond:vgs "src-examples/example_runner"

    ; Pkg.doc "doc/all_modules.docdir/all_modules.dot"

  ]
