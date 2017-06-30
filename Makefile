# Makefile
#
build:
	@echo "src-protocol-exts-pp-vg\nsrc-protocol-exts-vg" > jbuild-ignore 
	jbuilder build @install
	rm jbuild-ignore

build_vgs:
	@echo "src-protocol-exts-pp\nsrc-protocol-exts\nsrc-model\nsrc-simulation/" > jbuild-ignore 
	jbuilder build @install
	rm jbuild-ignore

module_graph.svg: _build/doc/all_modules.docdir/all_modules.dot
	sed -e 's/rotate=90;//g' "$<" | dot -Tsvg -o $@

server:
	@echo "src-protocol-exts-pp-vg\nsrc-protocol-exts-vg" > jbuild-ignore 
	jbuilder build src-simulation/server.bc
	rm jbuild-ignore

clean:
	jbuilder clean

.PHONY: build build_vgs run run_server clean
