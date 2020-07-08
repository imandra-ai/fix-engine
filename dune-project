(lang dune 2.2)
(name fix-engine)

(dialect
 (name imandra)
 (implementation
  (extension iml)
  (preprocess  (system "/usr/local/bin/imandra-extract %{input-file}")))
 (interface (extension "imli")))