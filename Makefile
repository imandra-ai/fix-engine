# Makefile
#
build:
	ocamlbuild -use-ocamlfind example_runner.native

run:
	_build/example_runner.native

clean:
	ocamlbuild -clean

.PHONY: build run clean
