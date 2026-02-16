---
sidebar_position: 4
---

# About external components (AddIns)

Some tools in the OPI toolkit utilize **external components (AddIns)** — dynamic libraries written in Rust that contain functions whose implementation would be difficult or impossible using 1C/OS alone. While working with OPI’s functionality, you won’t interact with these components directly, their presence introduces certain challenges and non-obvious considerations. These are documented in this section.

## Compatibility

All external components added to OPI are compiled for x64 and x32 versions of Windows and Linux. They are stored in special ZIP archives containing four library files—one for each platform. However, while there are no issues with their usage on Windows, on Linux these components depend on three things being present in the system: `glibc`, `gcc`\* и `OpenSSL`\*\*

> \*  Relevant for CLI and OneScript versions
> \*\* Relevant for libraries that use TLS functionality

### glibc

**glibc** is a C library that provides system calls and core functions like open, malloc, printf, etc. It always comes preinstalled in x86 Linux distributions, though version numbers may vary. The minimum required version for OPI components is **2.18**. This version corresponds to distributions such as CENTOS 7, RHEL 7, Fedora 19, Debian 8 and Ubuntu 12.04 (around 2013-2014). On older distributions, libraries using external components won't work.

### gcc

The version of the **GNU Compiler Collection** determines which version of the `libstdc++.so.6` library is available in the system, required for the external component engine in CLI and OSPX versions of OpenIntegrations. The minimum required version is **7.5.0**. This corresponds to CentOS 8, RHEL 8, Fedora 28, Debian 10, and Ubuntu 20.04, and can also be configured on older versions if `devtoolset-7` is available.

### OpenSSL

Libraries with TLS-related functionality links to system libraries of **OpenSSL version 3.x**  - `libssl.so.3` and `libcrypto.so.3`. This is a relatively new version that comes by default in distributions starting with CENTOS 9, RHEL 9, Fedora 36, Debian 12 and Ubuntu 22.04 (approximately 2022-2023). For older distributions (using OpenSSL 1.1 or earlier), OpenSSL 3.x must be installed or built from source separately.

## Usage Information

You can find information about a library using external components on the first page of its documentation in footnotes like these:

<div class="theme-admonition theme-admonition-info admonition_node_modules-@docusaurus-theme-classic-lib-theme-Admonition-Layout-styles-module alert alert--info">

<img src={require('../../static/img/addin.png').default} class="tipimage" />
<div class="addin">An external component is used to implement some functions in this library<br/>
Please review the ["About external components"](/docs/Start/Component-requirements) section before getting started</div>
</div>

<div class="theme-admonition theme-admonition-caution admonition_node_modules-@docusaurus-theme-classic-lib-theme-Admonition-Layout-styles-module alert alert--warning">

<img src={require('../../static/img/lock.png').default} class="tipimage" />
<div class="addin">This library requires **OpenSSL 3.x** to run on Linux <br/>
Learn more: <a href="/docs/Start/Component-requirements#openssl" class="orangelink">"Using OpenSSL in External Components"</a></div>
</div>

<br/>

If such footnotes are missing, the library was implemented without external components

<hr/>

## FAQ

Некоторые вопросы о работе и реализации внешних компонент, несвязанные напрямую с работой ОПИ

**1. Can external components be rebuilt?**

Yes. The Rust source code is located in the repository at [src/addins](https://github.com/Bayselonarrend/OpenIntegrations/tree/main/src/addins). The compiled components must be placed in a ZIP archive with a [manifest file](https://github.com/Bayselonarrend/OpenIntegrations/blob/main/src/addins/MANIFEST.XML). You can then replace the archive from the release, depending on the distribution used. Additionally, the [build.bat](https://github.com/Bayselonarrend/OpenIntegrations/blob/main/src/addins/build.bat) file in src/addins describes the process for building release versions of the components.

**2. Can OpenSSL-dependent external components be rebuilt for OpenSSL 1.1/1.1.1k?**

My attempts to do this were unsuccessful: even if you successfully links to libssl.so.1.1, the Rust project dependencies (particularly `native-tls`) require functions that either weren't implemented in OpenSSL 1.1 or were modified in 3.x. Downgrading crate versions to the point where security issues begin to appear didn't help. However, if you know how to work around this, I'd be very grateful if you could share your solution in Issues

**3. Why is OpenSSL dynamically linked rather than statically linked?**

Static linking (embedding a pre-built OpenSSL within the component) comes with numerous issues: potential conflicts when multiple `.so` files with static linking attempt to use shared system resources simultaneously (`ERR_STATE`, `/dev/random`, etc.); increases file sizes due to needing a separate OpenSSL copy in each component; inability to update the OpenSSL version without rebuilding projects; and other problems. For these reasons, we decided against using static linking.

**4. Can I see the full dependency list for a specific component?**

In the source directory of each component, you'll find a `dependencies.log` file - this contains the output of `ldd` and `strings | grep GLIBC` for the x64 version of the .so file after compilation. Here's an example of what it looks like:

```

"MAIN ---" 
 linux-vdso.so.1 (0x00007ffe4cd2e000)
 libssl.so.3 => not found
 libcrypto.so.3 => not found
 libm.so.6 => /lib64/libm.so.6 (0x00007f1ed1fb9000)
 libpthread.so.0 => /lib64/libpthread.so.0 (0x00007f1ed1d99000)
 libc.so.6 => /lib64/libc.so.6 (0x00007f1ed19c2000)
 libdl.so.2 => /lib64/libdl.so.2 (0x00007f1ed17be000)
 /lib64/ld-linux-x86-64.so.2 (0x00007f1ed2562000)
GLIBC_2.2.5
GLIBC_2.3
GLIBC_2.3.4
GLIBC_2.14
GLIBC_2.17

```

You can also obtain this information yourself by extracting the ZIP archive containing the library files and applying these same (or other) analysis tools to the `.so` file corresponding to your platform.

## Technical information about building and development

+ All components are cdylib libraries built in Rust, based on the [addin1c crate by medigor](https://crates.io/crates/addin1c)
+ Linux builds are created using [zigbuild](https://github.com/rust-cross/cargo-zigbuild) on OracleLinux 9.1 (WSL)
+ Profile.release:

```toml
	lto = "fat"
	codegen-units = 1
	panic = "unwind"
	strip = true
	opt-level = "z"
```
