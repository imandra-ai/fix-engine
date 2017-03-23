# Makefile
#
build:
	ocaml pkg/pkg.ml build --build-examples true

module_graph.svg: _build/doc/all_modules.docdir/all_modules.dot
	sed -e 's/rotate=90;//g' "$<" | dot -Tsvg -o $@

run:
	topkg run src-examples/example_runner

clean:
	ocaml pkg/pkg.ml clean

.PHONY: build run clean
