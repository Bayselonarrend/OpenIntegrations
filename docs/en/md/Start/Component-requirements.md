---
sidebar_position: 6
---

# About external components (AddIns)

Some tools in the OPI set use **external components (AddIns)** — Rust dynamic libraries that provide functions hard or impossible to implement with 1C or OneScript alone. You rarely touch AddIns directly when using OPI, but having them introduces practical constraints and quirks. They are summarized here.

## Compatibility

All external components bundled with OPI are built for **x64** and **x86** (**x32**) on **Windows** and **Linux**. They are shipped in ZIP archives with **four** native libraries — one per platform. On Windows this usually works out of the box; on Linux the components assume **`glibc`**, **`gcc`**\* and **`OpenSSL`**\*\* are available.

> \* Applies to CLI and OneScript builds
> \*\* Applies to libraries that use TLS

### glibc

**glibc** is the C runtime that backs system calls and basics like `open`, `malloc`, `printf`, and so on. It is present on x86 Linux distros, but **version** matters. The minimum supported version for OPI AddIns is **2.18**, roughly matching CENTOS 7, RHEL 7, Fedora 19, Debian 8, and Ubuntu 12.04 (2013–2014 era). Older distros will not run libraries that depend on these components.

### gcc

The **gcc** toolchain version affects which **`libstdc++.so.6`** is on the system; that library is required for the AddIn engine in **CLI** and **OSPX** OPI builds. Minimum supported **gcc** is **7.5.0** (CentOS 8, RHEL 8, Fedora 28, Debian 10, Ubuntu 20.04, or older distros with **`devtoolset-7`** or equivalent).

### OpenSSL

Libraries that implement **TLS** link against system **OpenSSL 3.x** — **`libssl.so.3`** and **`libcrypto.so.3`**. That version is the default starting with CENTOS 9, RHEL 9, Fedora 36, Debian 12, and Ubuntu 22.04 (2022–2023). On older distros that ship OpenSSL 1.1 or earlier, you must install or build **OpenSSL 3.x** separately.

## Usage hints in the docs

You can tell that a library uses external components from footnotes on its first documentation page, for example:

<div class="theme-admonition theme-admonition-info admonition_node_modules-@docusaurus-theme-classic-lib-theme-Admonition-Layout-styles-module alert alert--info">

<img src={require('../../static/img/addin.png').default} class="tipimage" />
<div class="addin">Some functions in this library are implemented with an external component<br/>
Please read [About external components](/docs/Start/Component-requirements) before you start</div>
</div>


<div class="theme-admonition theme-admonition-caution admonition_node_modules-@docusaurus-theme-classic-lib-theme-Admonition-Layout-styles-module alert alert--warning">

<img src={require('../../static/img/lock.png').default} class="tipimage" />
<div class="addin">This library needs **OpenSSL 3.x** on Linux<br/>
Learn more: <a href="/docs/Start/Component-requirements#openssl" class="orangelink">Using OpenSSL in external components</a></div>
</div>

<br/>

If there is no such note, the library was implemented **without** external components.

<hr/>

## External components `OnClient` in the 1C:Enterprise edition

Methods that rely on external components can run on **server** or **client** in the 1C:Enterprise build. On the **server**, AddIns are loaded transparently. On the **client**, they require an **interactive install** on that workstation. The process starts on the **first** call for each AddIn you use: the platform shows a dialog and may raise an exception telling you to call the same function again after installation.

Besides on-demand installation, you can pre-install selected AddIns on a client using the **`Control panel (OPI)`** data processor

:::warning
При обновлении Открытого пакета интеграций до новой версии, компоненты на клиенте необходимо установить заново через панель управления (пошаговая инструкция присутствует на форме обработки). В противном случае новые функции, реализованные в коде 1С, могут оказаться несовместимы с функциями компонент, которые остались на клиентской машине после предыдущей установки
:::

## FAQ

Miscellaneous questions about how external components work or are built — not specific to day-to-day OPI usage.

**1. Can I rebuild the external components?**

Yes. The Rust sources live under [src/addins](https://github.com/Bayselonarrend/OpenIntegrations/tree/main/src/addins). Put the built binaries in a ZIP together with the [manifest file](https://github.com/Bayselonarrend/OpenIntegrations/blob/main/src/addins/MANIFEST.XML), then replace the archive from the release that matches your delivery. The [build.bat](https://github.com/Bayselonarrend/OpenIntegrations/blob/main/src/addins/build.bat) script in `src/addins` describes how release builds are produced.

**2. Can OpenSSL-dependent components be rebuilt against OpenSSL 1.1 / 1.1.1k?**

I was not able to get this working: even with a successful link to `libssl.so.1.1`, Rust dependencies (notably **`native-tls`**) need APIs that are missing or different in OpenSSL 1.1 compared to 3.x. Pinning crates down to the edge of acceptable security did not help. If you know a workable approach, please share it in **Issues**.

**3. Why is OpenSSL linked dynamically instead of statically?**

Static linking (embedding OpenSSL inside each `.so`) causes many problems: clashes when several such libraries share process-wide state (`ERR_STATE`, `/dev/random`, etc.), much larger binaries because every component ships its own copy, and no way to upgrade OpenSSL without rebuilding everything. For those reasons we use **dynamic** linking.

**4. Can I see the full dependency list for a given component?**

Each component’s source tree contains **`dependencies.log`** — the output of `ldd` and `strings | grep GLIBC` for the **x64** `.so` after a build. It looks roughly like this:

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

You can produce the same information yourself by unpacking the platform ZIP and running these or other tools on the `.so` that matches your OS and bitness.

## Technical notes on builds and development

+ Every component is a Rust **cdylib** based on the [addin1c](https://crates.io/crates/addin1c) crate by medigor.
+ Linux binaries are cross-compiled with [cargo-zigbuild](https://github.com/rust-cross/cargo-zigbuild) targeting Oracle Linux 9.1 (via WSL).
+ `Profile.release`:

```toml
	lto = "fat"
	codegen-units = 1
	panic = "unwind"
	strip = true
	opt-level = "z"
```

