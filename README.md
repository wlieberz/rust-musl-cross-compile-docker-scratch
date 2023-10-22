# rust-musl-cross-compile-docker-scratch

This is a skeleton demo project for cross-compiling Rust to musl and a working `FROM scratch` Rust Dockerfile.

Mostly this is a cheatsheet / handy reference for myself.

## Build the binary locally

The normal Rust way:

```sh
cargo build --release
```

Important to get that "hello world" with release optimizations. :wink:

## Docker build

The normal Docker way:

```sh
docker build --tag rust-musl-cross-compile-docker-scratch:0.1.0 ./
```

Test it:

```sh
docker run --rm rust-musl-cross-compile-docker-scratch:0.1.0

# Expected output:
It works!
```
