# libssh2-sys (OPI patch)

Thin local fork of `libssh2-sys` 0.3.4. At build time the crate downloads C sources of libssh2 from crates.io and compiles them with `LIBSSH2_RSA_SHA1_ENABLE`.

Upstream libssh2 disables the `ssh-rsa` host key algorithm by default. OpenIntegrations keeps it so SSH/SFTP can still connect to legacy servers that only offer `ssh-rsa` (for example Cerberus FTP).

The `libssh2/` tree is not committed — it is fetched into this directory (or reused from the cargo registry cache) during `cargo build`.
