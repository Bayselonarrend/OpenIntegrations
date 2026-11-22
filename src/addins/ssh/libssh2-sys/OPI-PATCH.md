# OPI patch for libssh2-sys 0.3.4

Vendored from crates.io `libssh2-sys` 0.3.4.

Changes vs upstream:

1. `build.rs` defines `LIBSSH2_RSA_SHA1_ENABLE` so libssh2 again advertises
   the legacy `ssh-rsa` host-key / signature algorithm (SHA-1), which is
   disabled by default in libssh2 1.11+.
2. `build.rs` always compiles the vendored `libssh2/` tree and does not use
   vcpkg or pkg-config system copies, so the enable flag cannot be skipped.

Needed for SSH/SFTP servers that only offer `ssh-rsa` (for example Cerberus FTP).
Modern algorithms (`rsa-sha2-*`, `ecdsa-*`, `ssh-ed25519`) stay preferred in the
default host-key method list.
