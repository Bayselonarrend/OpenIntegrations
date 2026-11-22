# OPI patch for libssh2-sys 0.3.4

Vendored from crates.io `libssh2-sys` 0.3.4.

Change vs upstream: `build.rs` defines `LIBSSH2_RSA_SHA1_ENABLE` so libssh2
again advertises the legacy `ssh-rsa` host-key / signature algorithm (SHA-1),
which is disabled by default in libssh2 1.11+.

Needed for SSH/SFTP servers that only offer `ssh-rsa` (for example Cerberus FTP).
Modern algorithms (`rsa-sha2-*`, `ecdsa-*`, `ssh-ed25519`) stay preferred in the
default host-key method list.
