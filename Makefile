# Makefile
#
build:
	@echo -e "src-protocol-exts-pp-vg\nsrc-protocol-exts-vg" > jbuild-ignore 
	jbuilder build @install
	rm jbuild-ignore

build_vgs:
	@echo -e "src-protocol-exts-pp\nsrc-protocol-exts\nsrc-model\nsrc-simulation/" > jbuild-ignore 
	jbuilder build @install
	rm jbuild-ignore

module_graph.svg: _build/doc/all_modules.docdir/all_modules.dot
	sed -e 's/rotate=90;//g' "$<" | dot -Tsvg -o $@

server:
	@echo -e "src-protocol-exts-pp-vg\nsrc-protocol-exts-vg" > jbuild-ignore 
	jbuilder build src-simulation/server.bc
	rm jbuild-ignore

install-upgrade-deps: 
	opam update
	opam depext lwt=2.6.0
	opam depext jbuilder
	opam depext yojson
	opam pin -y add lwt 2.6.0
	opam install -y jbuilder
	opam install -y yojson

# dev-setup is used by (human) developers
dev-setup: install-upgrade-deps
	opam install merlin 

clean:
	jbuilder clean

.PHONY: build build_vgs run run_server clean

