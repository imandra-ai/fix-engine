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
	rm doc/odoc.css

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

install-upgrade-deps: 
	opam update
	opam depext lwt=2.6.0
	opam depext jbuilder
	opam depext yojson
	opam pin -y add lwt 2.6.0
	opam install -y jbuilder
	opam install -y yojson
	opam install -y odoc
	opam install -y zmq

# dev-setup is used by (human) developers
dev-setup: install-upgrade-deps
	opam install merlin 

clean:
	jbuilder clean

.PHONY: build build_vgs run run_server clean doc

