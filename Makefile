# Makefile
#
build:
	@echo "src-protocol-exts-pp-vg" > jbuild-ignore 
	@echo "src-protocol-exts-vg" >> jbuild-ignore 
	jbuilder build @install
	rm jbuild-ignore

build_vgs:
	@echo "src-protocol-exts-pp" > jbuild-ignore
	@echo "src-protocol-exts" >> jbuild-ignore 
	@echo "src-model" >> jbuild-ignore 
	@echo "src-simulation" >> jbuild-ignore 
	jbuilder build @install
	rm jbuild-ignore

build_tests:
	@echo "src-protocol-exts-pp-vg" > jbuild-ignore 
	@echo "src-protocol-exts-vg" >> jbuild-ignore 
	jbuilder build src-tests/test_runner.bc 
	rm jbuild-ignore

_build/default/_doc:
	@echo "src-protocol-exts-pp-vg" > jbuild-ignore 
	@echo "src-protocol-exts-vg" >> jbuild-ignore 
	jbuilder build @doc
	rm jbuild-ignore

doc: _build/default/_doc
	rm -rf doc
	mv _build/default/_doc doc

module_graph.svg: _build/doc/all_modules.docdir/all_modules.dot
	sed -e 's/rotate=90;//g' "$<" | dot -Tsvg -o $@

server:
	@echo "src-protocol-exts-pp-vg" > jbuild-ignore 
	@echo "src-protocol-exts-vg" >> jbuild-ignore 
	jbuilder build src-simulation/server.bc
	rm jbuild-ignore

client:
	@echo "src-protocol-exts-pp-vg" > jbuild-ignore 
	@echo "src-protocol-exts-vg" >> jbuild-ignore 
	jbuilder build src-simulation/client.bc
	rm jbuild-ignore

# opam1-setup - for running in Wercker. Assumes the correct switch is already installed and selected.
opam1-setup:
	opam pin add -y . --no-action
	opam depext -y fix-engine
	opam install fix-engine --deps-only

# opam2-setup - Will create a local switch under ./_opam.
opam2-setup: _opam
	opam pin add -y . --no-action
	opam depext -y fix-engine
	opam install -y . --deps-only --with-test --working-dir

_opam:
	opam switch create . --empty
	opam install -y ocaml-base-compiler.4.05.0

clean:
	jbuilder clean

.PHONY: build build_vgs run run_server clean doc

