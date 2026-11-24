# libssh2-sys (OPI patch)

Vendored `libssh2-sys` 0.3.4 with `LIBSSH2_RSA_SHA1_ENABLE` in `build.rs`.

Upstream libssh2 disables the `ssh-rsa` host key algorithm by default. OpenIntegrations keeps it so SSH/SFTP can still connect to legacy servers that only offer `ssh-rsa` (for example Cerberus FTP).
