FROM ocaml/opam:alpine-3.5_ocaml-4.02.3

# Wercker requires that we use the root user.
USER root
ENV OPAMROOT /home/opam/.opam

# Install OCaml dependencies.
RUN mkdir -p /app
WORKDIR /app
COPY ./Makefile /app/Makefile
RUN make dev-setup

# Compiling fix-engine
COPY . /app/
RUN /bin/bash -c 'eval `opam config env`; \
make build; \
make server'

