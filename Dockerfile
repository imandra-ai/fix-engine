FROM imandra/imandra-client-switch as fix-engine-build

COPY --chown=opam:nogroup ./fix-engine.opam ./
COPY --chown=opam:nogroup ./vendor/imandra-prelude/imandra-prelude.opam ./vendor/imandra-prelude/
COPY --chown=opam:nogroup ./vendor/imandra-ptime/imandra-ptime.opam ./vendor/imandra-ptime/
RUN opam install . ./vendor/imandra-prelude ./vendor/imandra-ptime --deps-only --with-test --working-dir
COPY --chown=opam:nogroup . .
RUN make build build_server build_tests
RUN ./_build/default/src-tests/test_roundtrip.bc
