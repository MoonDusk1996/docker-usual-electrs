ARG VERSION=v0.10.2

FROM rust:1.63.0-slim-bullseye AS builder

ARG VERSION

WORKDIR /build

RUN apt-get update
RUN apt-get install -y git clang cmake libsnappy-dev wget pgp

RUN wget -O - https://romanzey.de/pgp.txt | gpg --import \
  && git clone --branch $VERSION https://github.com/romanz/electrs . \
  && git verify-tag $VERSION  

# cargo under QEMU building for ARM can consumes 10s of GBs of RAM...
# Solution: https://users.rust-lang.org/t/cargo-uses-too-much-memory-being-run-in-qemu/76531/2
ENV CARGO_NET_GIT_FETCH_WITH_CLI true

RUN cargo install --locked --path .

FROM debian:bullseye-slim

WORKDIR /electrs

COPY --from=builder /usr/local/cargo/bin/electrs /bin/electrs

# Electrum RPC
EXPOSE 50001

# Prometheus monitoring
EXPOSE 4224

STOPSIGNAL SIGINT

VOLUME ["/electrs"]

ENTRYPOINT ["electrs", "--conf", "electrs.conf"]
