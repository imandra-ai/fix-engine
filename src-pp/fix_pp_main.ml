(**

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017

    Entrypoint to load pretty printers.

    fix_pp_main.ml.ml

*)

:program

#use "topfind";;
#require "yojson";;

open String;;
open Yojson;;

:load src-protocol/datetime.ml
:load src-protocol/basic_types.ml
:load src-protocol/full_session_core.ml
:load src-protocol/full_admin_messages.ml
:load src-protocol/full_app_messages.ml
:load src-protocol/full_fix_fields.ml
:load src-protocol/full_messages.ml
:load src/fix_engine.ml
:load src-pp/fix_basics_json.ml
:load src-pp/fix_admin_msg_json.ml
:load src-pp/fix_app_msg_json.ml
:load src-pp/fix_msg_json.ml
:load src-pp/fix_engine_json.ml
