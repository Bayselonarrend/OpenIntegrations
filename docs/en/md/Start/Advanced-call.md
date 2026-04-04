---
sidebar_position: 7
keywords: [1C, 1C:Enterprise, OneScript, CLI, HTTP, proxy, timeout, advanced call]
---

# Advanced call

Some OpenIntegrations methods perform network I/O (HTTP and similar). For those methods, an **advanced call** is supported: extra settings that are not part of the normal function signature — proxy, timeout, an “extended” response shape, and other keys listed on the method page (**Advanced call** tab).

Which settings exist **depends on the method**: some functions have no advanced parameters; the method page states that explicitly.

## 1C:Enterprise and OneScript

Use the `OPI_AdvancedCall` module (Russian builds use the name `OPI_РасширенныйВызов`):

- **`CallWithSettings`** — invokes an OPI module method with a settings structure (and an array of method arguments in order).
- **`GetAvailableSettings`** — returns a short text description of supported setting keys for a given module + method pair.

Settings are a key–value collection; key names and meanings match the **Advanced call** tab for that method (e.g. `proxy`, `timeout`, `adv_response` where applicable).

## CLI

The standard **`--config`** option supplies these extra call parameters. If you run a method with **`--config` and no value**, the app prints the list of settings available for that method (the same set as on the **Advanced call** tab).

For general CLI options, see [Working with CLI app](/docs/Start/CLI-version).

## Where to find it in the docs

On each method page, the parameter block has two tabs:

1. **Parameters** — function declaration and the usual parameter (and CLI option) table.
2. **Advanced call** — table of extra settings, or a note that none apply.

The **“?”** link next to the second tab title opens this page.
