# libssh2-sys (patched)

Vendored copy of [libssh2-sys 0.3.4](https://crates.io/crates/libssh2-sys) with one change in `build.rs`:

```text
cfg.define("LIBSSH2_RSA_SHA1_ENABLE", None);
```

libssh2 1.11+ disables the legacy `ssh-rsa` (SHA-1) host key / signature method unless this define is set. OpenIntegrations keeps it enabled for compatibility with older SFTP/SSH servers (see issue #119).
