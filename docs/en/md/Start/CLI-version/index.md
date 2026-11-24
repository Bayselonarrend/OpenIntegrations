# CLI and integration with other systems

**OInt CLI** is the console application of the Open Integration Package. It runs the same methods as the 1C extension and the OneScript package, and it needs neither the platform nor the interpreter: other programs call it from a terminal, from another process, and from an AI agent.

## What the application can do

- **Command line.** One call, `oint <library> <method>`, runs a method and exits. This is how bat and sh scripts use the application.
- **STDIO server.** `oint server stdio` reads requests from standard input and writes responses to standard output. Another program keeps the process open and exchanges messages with it, without parsing command-line arguments.
- **HTTP server.** `oint server http` accepts requests on a chosen port. The response is JSON or, when configured, Janx. POST, GET, and an expected `Authorization` header can be enabled for the request.
- **MCP.** `oint mcp start` runs a [Model Context Protocol](https://modelcontextprotocol.io/) server over the standard streams. The agent receives the list of libraries and methods, reads parameters, and runs a call. Values from the configuration file replace variable names, so secrets stay out of the agent context.

Calling methods from the command line is described in [CLI](/docs/Start/CLI-version/cli). The agent server is described in [MCP](/docs/Start/CLI-version/mcp-server).

## Installation

Files for the current version are in the [latest release](https://github.com/Bayselonarrend/OpenIntegrations/releases/latest) and on the [download page](/download). The download page already fills in the same commands for the selected language and mirror.

### Windows

Run the installer `oint_x.x.x_installer_lang.exe`. It creates the program directory and adds it to `PATH`. After a reboot, `oint` is available from any directory.

### Debian and Ubuntu

The package does not pull extra dependencies from the network:

```bash
wget <link to oint_x.x.x_all_en.deb>
sudo apt install -y ./oint_x.x.x_all_en.deb
```

### Fedora, RHEL, and CentOS

The package offers to install `libicu`, the ICU library the application engine needs to start:

```bash
wget <link to oint-x.x.x-1.noarch_en.rpm>
sudo rpm -i ./oint-x.x.x-1.noarch_en.rpm
```

### AppImage

A single Linux executable. Nothing is installed into the system:

```bash
wget <link to oint-x.x.x_en-x86_64.AppImage>
chmod +x ./oint-x.x.x_en-x86_64.AppImage
./oint-x.x.x_en-x86_64.AppImage
```

### OneScript package

The `oint-cli` package is installed with OPM. OneScript `2.0.0` or newer is required, and so is the `oint` library package of the same version: the console application depends on it. The OneScript `bin` directory must be on `PATH`, otherwise `oint` is not found from an arbitrary directory.

From the package hub, Russian package:

```bash
opm install oint-cli
```

From a downloaded `oint-cli-x.x.x_lang.ospx` file:

```bash
opm install -f "./oint-cli-x.x.x_en.ospx"
```

What each file contains and how the variants differ is described in [About release variants](/docs/Start/Release-variants).

## Subsections

Each way of working is described on its own page:

- [CLI](/docs/Start/CLI-version/cli) — calling methods from the command line, help, parameters, and the result output
- [MCP](/docs/Start/CLI-version/mcp-server) — the server for an AI agent, the configuration file, and connecting it in Cursor, Kiro, and Cline
