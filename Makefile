# Makefile
#
build:
	ocamlbuild -use-ocamlfind src-examples/example_runner.native

run:
	_build/example_runner.native

clean:
	ocamlbuild -clean

.PHONY: build run clean
