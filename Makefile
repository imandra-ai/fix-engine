# Makefile
#
build:
	cp _tags.full _tags
	ocaml pkg/pkg.ml build 

build_vgs:
	cp _tags.vgs _tags
	ocaml pkg/pkg.ml build --build-vgs true

module_graph.svg: _build/doc/all_modules.docdir/all_modules.dot
	sed -e 's/rotate=90;//g' "$<" | dot -Tsvg -o $@

run:
	topkg run src-examples/example_runner

clean:
	ocaml pkg/pkg.ml clean

.PHONY: build run clean
