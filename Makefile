# Makefile
#
build:
	ocaml pkg/pkg.ml build --build-examples true

run:
	topkg run src-examples/example_runner

clean:
	ocaml pkg/pkg.ml clean

.PHONY: build run clean
