(lang dune 2.5)
(name fix-engine)

(dialect
 (name imandra)
 (implementation
  (extension iml)
  (preprocess  (system "imandra-extract %{input-file}"))
  (format (system "ocamlformat %{input-file}")))
 (interface (extension "imli")))
