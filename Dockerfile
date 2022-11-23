FROM imandra/imandra-client-switch as fix-engine-build

COPY --chown=opam:nogroup ./fix-engine.opam .
RUN opam pin -y -n imandra-prelude vendor/imandra-prelude
RUN opam pin -y -n imandra-ptime vendor/imandra-ptime
RUN opam install . --deps-only --with-test --working-dir -y
COPY --chown=opam:nogroup . .
RUN make imandra-libs-install
RUN make build build_tests run_parser_tests
