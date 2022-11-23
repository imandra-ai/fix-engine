# Makefile

DUNE_OPTS?= --profile=release
IMANDRA_SWITCH?=/usr/local/var/imandra

imandra-libs-install:
	cd vendor/imandra-ptime && opam install . --switch $(IMANDRA_SWITCH) -y && cd -

imandra-libs-uninstall:
	opam uninstall imandra-ptime --switch $(IMANDRA_SWITCH)

imandra-libs-unpin:
	opam unpin imandra-ptime --switch $(IMANDRA_SWITCH)

build:
	opam exec -- dune build $(DUNE_OPTS) @install

build_tests:
	opam exec -- dune build $(DUNE_OPTS) tests/test_runner.bc
	opam exec -- dune build $(DUNE_OPTS) tests/test_server.exe
	opam exec -- dune build $(DUNE_OPTS) tests/parser_test_runner.exe

run_parser_tests:
	opam exec -- dune exec tests/parser_test_runner.exe

doc:
	opam exec -- dune build $(DUNE_OPTS) @doc
	mkdir -p _pages/doc
	cp -r _build/default/_doc/_html/* _pages/doc/
	rm -rf _pages/doc/odoc.css
	sed -i '' -e 's/<body>/<body><nav><\/nav>/g' _pages/doc/index.html
	rm dune

module_graph.svg: _build/doc/all_modules.docdir/all_modules.dot
	sed -e 's/rotate=90;//g' "$<" | dot -Tsvg -o $@

# opam1-setup - for running in Wercker. Assumes the correct switch is already installed and selected.
opam1-setup:
	opam install \
	  ./vendor/imandra-ptime/imandra-ptime.opam \
	  ./vendor/imandra-prelude/imandra-prelude.opam \
	  ./fix-engine.opam \
	  --deps-only -y

# Note: keep this opam install command in sync with the Dockerfile
# opam2-setup - Will create a local switch under ./_opam.
opam2-setup: _opam
	opam install \
	  ./vendor/imandra-ptime/imandra-ptime.opam \
	  ./vendor/imandra-prelude/imandra-prelude.opam \
	  ./fix-engine.opam \
	  --deps-only -y

_opam:
	opam switch create . --empty
	opam install -y ocaml-base-compiler.4.12.1

format:
	@echo "(dirs :standard \ *-vg)" > dune
	opam exec -- dune build $(DUNE_OPTS) @fmt --auto-promote || true
	rm dune

format_vgs:
	@echo "(dirs :standard \ src-protocol-exts src-protocol-exts-pp src-model src-simulation src-simulation-utils src-core-utils src-tests-utils)" > dune
	opam exec -- dune build $(DUNE_OPTS) @fmt --auto-promote || true
	rm dune

clean:
	opam exec -- dune clean $(DUNE_OPTS)

bench-engine-decode:
	opam exec -- dune exec $(DUNE_OPTS) tests/benchs/engine/bench_engine_decode.exe --

WATCH?=@check
watch:
	@opam exec -- dune build $(DUNE_OPTS) $(WATCH) -w
