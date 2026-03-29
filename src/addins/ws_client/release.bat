@echo off
cargo build --release --target x86_64-pc-windows-msvc
cargo build --release --target i686-pc-windows-msvc
cargo build --release --target x86_64-unknown-linux-gnu
cargo build --release --target i686-unknown-linux-gnu
