# syntax=docker/dockerfile:1

ARG BUILDER_IMAGE=rust:slim-bookworm

# ---------- Build
FROM ${BUILDER_IMAGE} as builder

WORKDIR /build

COPY ./ ./

RUN rustup target add x86_64-unknown-linux-musl && \
  apt update && \
  apt install musl-tools --yes && \
  cargo build --target x86_64-unknown-linux-musl --release

# ---------- Runtime
FROM scratch

COPY --from=builder \
  /build/target/x86_64-unknown-linux-musl/release/rust-hello /

ENTRYPOINT ["/rust-hello"]
