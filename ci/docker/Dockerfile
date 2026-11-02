FROM oraclelinux:9

ARG RUST_VERSION=stable

RUN dnf -y install dnf-plugins-core oracle-epel-release-el9 \
 && dnf config-manager --set-enabled ol9_codeready_builder \
 && dnf -y update \
 && dnf -y install \
      gcc gcc-c++ make perl git curl ca-certificates tar gzip xz \
      openssl openssl-devel \
      openssl-libs.i686 openssl-devel.i686 \
      zlib-devel zlib-devel.i686 \
      libunwind libunwind-devel \
      glibc-devel.i686 \
      binutils \
 && dnf clean all \
 && rm -rf /var/cache/dnf

ARG ZIG_VERSION=0.13.0

ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:/opt/zig:$PATH \
    OPENSSL_DIR=/usr

RUN curl -fsSL "https://ziglang.org/download/${ZIG_VERSION}/zig-linux-x86_64-${ZIG_VERSION}.tar.xz" \
    | tar -xJ -C /opt \
 && mv "/opt/zig-linux-x86_64-${ZIG_VERSION}" /opt/zig \
 && zig version

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs \
    | sh -s -- -y --default-toolchain ${RUST_VERSION} --profile minimal \
 && rustup target add x86_64-unknown-linux-gnu i686-unknown-linux-gnu \
 && cargo install cargo-zigbuild \
 && rm -rf /usr/local/cargo/registry/cache /usr/local/cargo/registry/src /tmp/*

WORKDIR /addins
