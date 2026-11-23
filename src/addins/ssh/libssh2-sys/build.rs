use std::env;
use std::fs;
use std::path::{Path, PathBuf};
use std::process::Command;

/*
 In libssh2 v1.9.0 and earlier versions, the SSH_MSG_DISCONNECT logic in packet.c has an integer
 overflow in a bounds check, enabling an attacker to specify an arbitrary (out-of-bounds) offset
 for a subsequent memory read. A crafted SSH server may be able to disclose sensitive information
 or cause a denial of service condition on the client system when a user connects to the server.
*/

const CRATE_VERSION: &str = "0.3.4";

fn main() {
    // Always build from source so LIBSSH2_RSA_SHA1_ENABLE is applied.
    // System libssh2 via pkg-config/vcpkg would skip our define and break
    // servers that only offer legacy ssh-rsa host keys (issue #119).

    let manifest_dir = PathBuf::from(env::var("CARGO_MANIFEST_DIR").unwrap());
    if !manifest_dir.join("libssh2/include/libssh2.h").exists() {
        ensure_libssh2_sources(&manifest_dir).expect(
            "failed to prepare libssh2 sources; run `cargo fetch` so libssh2-sys is in the registry",
        );
    }

    if !Path::new("libssh2/.git").exists() {
        let _ = Command::new("git")
            .args(["submodule", "update", "--init"])
            .status();
    }

    let target = env::var("TARGET").unwrap();
    let profile = env::var("PROFILE").unwrap();
    let dst = PathBuf::from(env::var_os("OUT_DIR").unwrap());
    let mut cfg = cc::Build::new();

    let include = dst.join("include");
    println!("cargo:include={}", include.display());
    println!("cargo:root={}", dst.display());
    let build = dst.join("build");
    cfg.out_dir(&build);
    fs::create_dir_all(&build).unwrap();
    fs::create_dir_all(&include).unwrap();

    fs::copy("libssh2/include/libssh2.h", include.join("libssh2.h")).unwrap();
    fs::copy(
        "libssh2/include/libssh2_publickey.h",
        include.join("libssh2_publickey.h"),
    )
    .unwrap();
    fs::copy(
        "libssh2/include/libssh2_sftp.h",
        include.join("libssh2_sftp.h"),
    )
    .unwrap();

    cfg.file("libssh2/src/agent.c")
        .file("libssh2/src/bcrypt_pbkdf.c")
        .file("libssh2/src/blowfish.c")
        .file("libssh2/src/chacha.c")
        .file("libssh2/src/channel.c")
        .file("libssh2/src/cipher-chachapoly.c")
        .file("libssh2/src/comp.c")
        .file("libssh2/src/crypt.c")
        .file("libssh2/src/global.c")
        .file("libssh2/src/hostkey.c")
        .file("libssh2/src/keepalive.c")
        .file("libssh2/src/kex.c")
        .file("libssh2/src/knownhost.c")
        .file("libssh2/src/libgcrypt.c")
        .file("libssh2/src/mac.c")
        .file("libssh2/src/mbedtls.c")
        .file("libssh2/src/misc.c")
        .file("libssh2/src/openssl.c")
        .file("libssh2/src/os400qc3.c")
        .file("libssh2/src/packet.c")
        .file("libssh2/src/pem.c")
        .file("libssh2/src/poly1305.c")
        .file("libssh2/src/publickey.c")
        .file("libssh2/src/scp.c")
        .file("libssh2/src/session.c")
        .file("libssh2/src/sftp.c")
        .file("libssh2/src/transport.c")
        .file("libssh2/src/userauth.c")
        .file("libssh2/src/userauth_kbd_packet.c")
        .file("libssh2/src/version.c")
        .file("libssh2/src/wincng.c")
        .include(&include)
        .include("libssh2/src");

    cfg.define("HAVE_LONGLONG", None);

    if target.contains("windows") {
        cfg.define("LIBSSH2_WIN32", None);

        if env::var_os("CARGO_FEATURE_OPENSSL_ON_WIN32").is_some() {
            cfg.define("LIBSSH2_OPENSSL", None);
            cfg.define("HAVE_EVP_AES_128_CTR", None);
            let lib_prefix = if target.contains("windows-msvc") {
                "lib"
            } else {
                ""
            };
            println!("cargo:rustc-link-lib=static={lib_prefix}ssl");
            println!("cargo:rustc-link-lib=static={lib_prefix}crypto");
            println!("cargo:rustc-link-lib=advapi32");
        } else {
            cfg.define("LIBSSH2_WINCNG", None);
        }
    } else {
        cfg.flag("-fvisibility=hidden");
        cfg.define("HAVE_SNPRINTF", None);
        cfg.define("HAVE_UNISTD_H", None);
        cfg.define("HAVE_INTTYPES_H", None);
        cfg.define("HAVE_STDLIB_H", None);
        cfg.define("HAVE_SYS_SELECT_H", None);
        cfg.define("HAVE_SYS_SOCKET_H", None);
        cfg.define("HAVE_SYS_IOCTL_H", None);
        cfg.define("HAVE_SYS_TIME_H", None);
        cfg.define("HAVE_SYS_UN_H", None);
        cfg.define("HAVE_O_NONBLOCK", None);
        cfg.define("LIBSSH2_OPENSSL", None);
        cfg.define("HAVE_LIBCRYPT32", None);
        cfg.define("HAVE_EVP_AES_128_CTR", None);
        cfg.define("HAVE_POLL", None);
        cfg.define("HAVE_GETTIMEOFDAY", None);

        // Create `libssh2_config.h`
        let config = fs::read_to_string("libssh2/src/libssh2_config_cmake.h.in").unwrap();
        let config = config
            .lines()
            .filter(|l| !l.contains("#cmakedefine"))
            .collect::<Vec<_>>()
            .join("\n");
        fs::write(build.join("libssh2_config.h"), &config).unwrap();
        cfg.include(&build);
    }

    /* Enable newer diffie-hellman-group-exchange-sha1 syntax */
    cfg.define("LIBSSH2_DH_GEX_NEW", None);

    // OPI: re-enable legacy ssh-rsa host key for servers that only offer it
    // (e.g. Cerberus FTP). Disabled by default in libssh2 1.11.1+.
    cfg.define("LIBSSH2_RSA_SHA1_ENABLE", None);

    cfg.define("LIBSSH2_HAVE_ZLIB", None);

    if profile.contains("debug") {
        cfg.define("LIBSSH2DEBUG", None);
    }

    println!("cargo:rerun-if-env-changed=DEP_Z_INCLUDE");
    if let Some(path) = env::var_os("DEP_Z_INCLUDE") {
        cfg.include(path);
    }

    println!("cargo:rerun-if-env-changed=DEP_OPENSSL_INCLUDE");
    if let Some(path) = env::var_os("DEP_OPENSSL_INCLUDE") {
        if let Some(path) = env::split_paths(&path).next() {
            if let Some(path) = path.to_str() {
                if !path.is_empty() {
                    cfg.include(path);
                }
            }
        }
    }

    let libssh2h = fs::read_to_string("libssh2/include/libssh2.h").unwrap();
    let version_line = libssh2h
        .lines()
        .find(|l| l.contains("LIBSSH2_VERSION"))
        .unwrap();
    let version = &version_line[version_line.find('"').unwrap() + 1..version_line.len() - 1];

    let pkgconfig = dst.join("lib/pkgconfig");
    fs::create_dir_all(&pkgconfig).unwrap();
    fs::write(
        pkgconfig.join("libssh2.pc"),
        fs::read_to_string("libssh2/libssh2.pc.in")
            .unwrap()
            .replace("@prefix@", "${pcfiledir}/../..")
            .replace("@exec_prefix@", "")
            .replace("@libdir@", "${prefix}/build")
            .replace("@includedir@", "${prefix}/include")
            .replace("@LIBSSH2_PC_REQUIRES@", "")
            .replace("@LIBSSH2_PC_REQUIRES_PRIVATE@", "")
            .replace("@LIBSSH2_PC_LIBS@", "")
            .replace("@LIBSSH2_PC_LIBS_PRIVATE@", "")
            .replace("@LIBSSH2_VERSION@", version),
    )
    .unwrap();

    cfg.warnings(false);
    cfg.compile("ssh2");

    if target.contains("windows") {
        println!("cargo:rustc-link-lib=bcrypt");
        println!("cargo:rustc-link-lib=crypt32");
        println!("cargo:rustc-link-lib=user32");
        println!("cargo:rustc-link-lib=ntdll");
    }
}

fn ensure_libssh2_sources(manifest_dir: &Path) -> Result<(), String> {
    let registry = cargo_home()?.join("registry/src");
    let entries = fs::read_dir(&registry).map_err(|error| error.to_string())?;

    for entry in entries.flatten() {
        let candidate = entry
            .path()
            .join(format!("libssh2-sys-{CRATE_VERSION}/libssh2"));
        if candidate.join("include/libssh2.h").exists() {
            copy_dir_all(&candidate, &manifest_dir.join("libssh2"))?;
            return Ok(());
        }
    }

    Err(format!(
        "libssh2-sys-{CRATE_VERSION} sources not found in cargo registry"
    ))
}

fn cargo_home() -> Result<PathBuf, String> {
    if let Ok(path) = env::var("CARGO_HOME") {
        return Ok(PathBuf::from(path));
    }

    let home = env::var("HOME")
        .or_else(|_| env::var("USERPROFILE"))
        .map_err(|_| "HOME/USERPROFILE is not set".to_string())?;

    Ok(PathBuf::from(home).join(".cargo"))
}

fn copy_dir_all(from: &Path, to: &Path) -> Result<(), String> {
    fs::create_dir_all(to).map_err(|error| error.to_string())?;

    for entry in fs::read_dir(from).map_err(|error| error.to_string())? {
        let entry = entry.map_err(|error| error.to_string())?;
        let file_type = entry.file_type().map_err(|error| error.to_string())?;
        let target = to.join(entry.file_name());

        if file_type.is_dir() {
            copy_dir_all(&entry.path(), &target)?;
        } else {
            fs::copy(entry.path(), &target).map_err(|error| error.to_string())?;
        }
    }

    Ok(())
}
