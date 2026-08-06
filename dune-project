(lang dune 2.9)

; Composition root only. The fix-engine and model packages -- source,
; dialect, package stanzas, opam files -- live in the fix-engine-src
; submodule at src/; defining them here too would make dune reject the
; workspace ("package fix-engine is defined more than once"). This repo
; just composes the source with its deps (vendor/imandra-prelude,
; vendor/imandra-ptime-src) for dev/CI.
