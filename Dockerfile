FROM imandra/imandra-client-switch

COPY --chown=opam:nogroup ./fix-engine.opam .
RUN opam install . --deps-only --with-test --working-dir
COPY --chown=opam:nogroup . .
RUN make build build_server