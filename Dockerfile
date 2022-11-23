FROM imandra/imandra-client-switch as fix-engine-build

COPY --chown=opam:nogroup ./fix-engine.opam .
COPY --chown=opam:nogroup ./vendor/imandra-ptime/imandra-ptime.opam .
COPY --chown=opam:nogroup ./vendor/imandra-prelude/imandra-prelude.opam .
RUN opam install . --deps-only --with-test --working-dir -y
COPY --chown=opam:nogroup . .
RUN make imandra-libs-install
RUN make build build_tests run_parser_tests
