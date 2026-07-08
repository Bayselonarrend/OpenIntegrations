use std::fs;
use std::path::{Path, PathBuf};
use std::process::Command;

use flate2::read::GzDecoder;
use tar::Archive;

const CRATE_VERSION: &str = "0.5.8";
const CRATE_URL: &str =
    "https://static.crates.io/crates/unrar_sys/unrar_sys-0.5.8.crate";

fn main() {
    if cfg!(windows) {
        println!("cargo:rustc-flags=-lpowrprof");
        println!("cargo:rustc-link-lib=shell32");
        if cfg!(target_env = "gnu") {
            println!("cargo:rustc-link-lib=pthread");
        }
    } else {
        println!("cargo:rustc-link-lib=pthread");
    }

    let manifest_dir = PathBuf::from(std::env::var("CARGO_MANIFEST_DIR").expect("CARGO_MANIFEST_DIR"));
    let vendor_unrar = manifest_dir.join("vendor/unrar");

    if !vendor_unrar.join("archive.cpp").exists() {
        ensure_vendor_sources(&manifest_dir).expect("failed to prepare unrar vendor sources");
    }
    patch_os_hpp(&vendor_unrar.join("os.hpp")).expect("failed to patch vendor/unrar/os.hpp");

    let files: Vec<String> = [
        "strlist",
        "strfn",
        "pathfn",
        "smallfn",
        "global",
        "file",
        "filefn",
        "filcreat",
        "archive",
        "arcread",
        "unicode",
        "system",
        #[cfg(windows)]
        "isnt",
        "crypt",
        "crc",
        "rawread",
        "encname",
        "match",
        "timefn",
        "rdwrfn",
        "consio",
        "options",
        "errhnd",
        "rarvm",
        "secpassword",
        "rijndael",
        "getbits",
        "sha1",
        "sha256",
        "blake2s",
        "hash",
        "extinfo",
        "extract",
        "volume",
        "list",
        "find",
        "unpack",
        "headers",
        "threadpool",
        "rs16",
        "cmddata",
        "ui",
        "filestr",
        "scantree",
        "dll",
        "qopen",
    ]
    .iter()
    .map(|&s| format!("vendor/unrar/{s}.cpp"))
    .collect();

    let mut build = cc::Build::new();
    if uses_zig_toolchain() {
        // cargo-zigbuild routes the C/C++ driver through zig wrappers that reject `.2.17` targets.
        // UnRAR only needs a PIC-enabled host toolchain here; Rust still links via zigbuild.
        if std::env::var("CARGO_CFG_TARGET_ARCH").as_deref() == Ok("x86") {
            build.compiler("g++");
            build.flag("-m32");
        } else {
            build.compiler("c++");
        }
    }
    build
        .cpp(true)
        .pic(true)
        .opt_level(2)
        .std("c++14")
        .cpp_link_stdlib(None)
        .warnings(false)
        .extra_warnings(false)
        .flag_if_supported("-stdlib=libc++")
        .flag_if_supported("-fPIC")
        .flag_if_supported("-Wno-switch")
        .flag_if_supported("-Wno-parentheses")
        .flag_if_supported("-Wno-macro-redefined")
        .flag_if_supported("-Wno-dangling-else")
        .flag_if_supported("-Wno-logical-op-parentheses")
        .flag_if_supported("-Wno-unused-parameter")
        .flag_if_supported("-Wno-unused-variable")
        .flag_if_supported("-Wno-unused-function")
        .flag_if_supported("-Wno-missing-braces")
        .flag_if_supported("-Wno-unknown-pragmas")
        .flag_if_supported("-Wno-deprecated-declarations")
        .define("_FILE_OFFSET_BITS", Some("64"))
        .define("_LARGEFILE_SOURCE", None)
        .define("RAR_SMP", None)
        .define("RARDLL", None);

    // __builtin_cpu_supports pulls in __cpu_model, which breaks PIC linking of cdylib via zigbuild.
    if std::env::var("CARGO_CFG_TARGET_OS").as_deref() == Ok("linux") {
        build.define("OPI_UNRAR_DISABLE_SSE", None);
    }

    build.files(&files).compile("libunrar.a");
}

fn uses_zig_toolchain() -> bool {
    for key in ["CXX", "CC", "RUSTC_LINKER"] {
        if std::env::var(key)
            .map(|value| value.contains("zig"))
            .unwrap_or(false)
        {
            return true;
        }
    }

    false
}

fn ensure_vendor_sources(manifest_dir: &Path) -> Result<(), String> {
    if copy_vendor_from_registry(manifest_dir).is_ok() {
        return Ok(());
    }

    download_and_extract_vendor(manifest_dir)
}

fn copy_vendor_from_registry(manifest_dir: &Path) -> Result<(), String> {
    let registry = cargo_home()?.join("registry/src");
    let entries = fs::read_dir(&registry).map_err(|error| error.to_string())?;

    for entry in entries.flatten() {
        let candidate = entry
            .path()
            .join(format!("unrar_sys-{CRATE_VERSION}/vendor/unrar"));
        if candidate.join("archive.cpp").exists() {
            copy_dir_all(&candidate, &manifest_dir.join("vendor/unrar"))?;
            return Ok(());
        }
    }

    Err("unrar_sys crate sources not found in cargo registry".to_string())
}

fn download_and_extract_vendor(manifest_dir: &Path) -> Result<(), String> {
    let build_dir = manifest_dir.join(".build");
    fs::create_dir_all(&build_dir).map_err(|error| error.to_string())?;

    let crate_path = build_dir.join(format!("unrar_sys-{CRATE_VERSION}.crate"));
    if !crate_path.exists() {
        let status = Command::new("curl")
            .args(["-fsSL", CRATE_URL, "-o"])
            .arg(&crate_path)
            .status()
            .map_err(|error| format!("failed to run curl: {error}"))?;
        if !status.success() {
            return Err(format!("failed to download {CRATE_URL}"));
        }
    }

    let prefix = format!("unrar_sys-{CRATE_VERSION}/vendor/");
    let decoder = GzDecoder::new(
        fs::File::open(&crate_path).map_err(|error| error.to_string())?,
    );
    let mut archive = Archive::new(decoder);

    for entry in archive.entries().map_err(|error| error.to_string())? {
        let mut entry = entry.map_err(|error| error.to_string())?;
        let path = entry.path().map_err(|error| error.to_string())?;
        let Some(rel) = path.strip_prefix(&prefix).ok() else {
            continue;
        };

        let out = manifest_dir.join("vendor").join(rel);
        if entry.header().entry_type().is_dir() {
            fs::create_dir_all(&out).map_err(|error| error.to_string())?;
        } else {
            if let Some(parent) = out.parent() {
                fs::create_dir_all(parent).map_err(|error| error.to_string())?;
            }
            entry.unpack(&out).map_err(|error| error.to_string())?;
        }
    }

    if !manifest_dir.join("vendor/unrar/archive.cpp").exists() {
        return Err("vendor/unrar was not found in downloaded crate".to_string());
    }

    Ok(())
}

fn patch_os_hpp(path: &Path) -> Result<(), String> {
    let content = fs::read_to_string(path).map_err(|error| error.to_string())?;
    if content.contains("OPI_UNRAR_DISABLE_SSE") {
        return Ok(());
    }

    let patched = content.replace(
        "    #define USE_SSE\n    #define SSE_ALIGNMENT 16",
        "    #ifndef OPI_UNRAR_DISABLE_SSE\n    #define USE_SSE\n    #endif\n    #define SSE_ALIGNMENT 16",
    );

    if patched == content {
        return Err("unexpected os.hpp layout; OPI patch was not applied".to_string());
    }

    fs::write(path, patched).map_err(|error| error.to_string())
}

fn cargo_home() -> Result<PathBuf, String> {
    if let Ok(path) = std::env::var("CARGO_HOME") {
        return Ok(PathBuf::from(path));
    }

    let home = std::env::var("HOME")
        .or_else(|_| std::env::var("USERPROFILE"))
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
