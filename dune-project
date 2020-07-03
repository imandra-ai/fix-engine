(lang dune 1.11)
(name fix-engine)

(dialect
 (name imandra)
 (implementation
  (extension iml)
  (preprocess  (system "opam exec -- ocamlrun imandra-extract %{input-file}")))
 (interface (extension "imli")))