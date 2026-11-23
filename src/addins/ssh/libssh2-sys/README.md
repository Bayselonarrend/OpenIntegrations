# libssh2-sys (OPI patch)

Vendored copy of [`libssh2-sys` 0.3.4](https://crates.io/crates/libssh2-sys) with:

- `LIBSSH2_RSA_SHA1_ENABLE` — restores `ssh-rsa` host-key negotiation (disabled by default in libssh2 1.11+)
- always builds the vendored `libssh2` tree (no vcpkg / system pkg-config), so the define is not bypassed

Used via `[patch.crates-io]` from the parent `opi_ssh` crate.
