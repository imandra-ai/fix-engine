FROM imandra/imandra-client-switch as fix-engine-build

COPY --chown=opam:nogroup ./fix-engine.opam .
COPY --chown=opam:nogroup ./vendor/imandra-ptime/imandra-ptime.opam ./vendor/imandra-ptime/imandra-ptime.opam
COPY --chown=opam:nogroup ./vendor/imandra-prelude/imandra-prelude.opam ./vendor/imandra-prelude/imandra-prelude.opam
COPY --chown=opam:nogroup ./Makefile ./Makefile
RUN make opam1-setup 
COPY --chown=opam:nogroup . .
RUN make imandra-libs-install
RUN make build build_tests run_parser_tests
