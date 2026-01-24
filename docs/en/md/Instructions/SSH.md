---
id: SSH
sidebar_class_name: SSH
keywords: [1C, 1C:Enterprise, 1C:Enterprise 8.3, API, Integration, Services, Data Exchange, OneScript, CLI, SSH]
---

<img src={require('../../static/img/APIs/SSH.png').default} width='64px' />

# SSH

This section covers the library for working with the SSH protocol in 1C:Enterprise, OneScript, and CLI. This page describes all actions required to get started.

<div class="theme-admonition theme-admonition-info admonition_node_modules-@docusaurus-theme-classic-lib-theme-Admonition-Layout-styles-module alert alert--info">

<img src={require('../../static/img/addin.png').default} class="tipimage" />
<div class="addin">An external component is used to implement some functions in this library<br/>
Please review the ["About external components"](/docs/Start/Component-requirements) section before getting started</div>
</div>

<div class="theme-admonition theme-admonition-caution admonition_node_modules-@docusaurus-theme-classic-lib-theme-Admonition-Layout-styles-module alert alert--warning">

<img src={require('../../static/img/lock.png').default} class="tipimage" />
<div class="addin">This library requires **OpenSSL 3.x** to operate on Linux <br/>
Learn more: <a href="/docs/Start/Component-requirements#openssl" class="orangelink">"Using OpenSSL in External Components"</a></div>
</div>

## Getting Started

This library provides various methods for working with SSH on the client side. Each of them accepts a `Connection` as the first parameter, which can be obtained in one of two ways:

1. Using the `CreateConnection` function. In this case, a component object is returned that maintains a persistent connection for multiple requests.
2. Using the `GetConnectionConfiguration` function. Here, only a structure describing the connection is returned. Each function that receives this structure as the `Connection` parameter will internally open a new connection and close it upon completion.

When executing multiple sequential requests to an SSH server, it is recommended to use a persistent connection obtained via the `CreateConnection` function.

After establishing a connection, `sh` commands can be executed using the `ExecuteCommand` function.

:::important
Commands are executed in `execute` mode, not in `shell` mode. This means execution context—such as the current directory or environment variables—is not preserved between calls. To execute multiple sequential commands, they should be included in a single call to the `ExecuteCommand` function.
:::

## Proxy Usage

This client supports establishing connections via a proxy server. You can obtain a proxy settings structure using the `GetProxySettings` function. The resulting structure should then be passed to `CreateConnection` or `GetConnectionConfiguration` when beginning work.

```bsl

    ...

    ProxyType    = "http"; // http, socks5, socks4

    ProxyAddress  = "127.0.0.1";
    ProxyPort     = "8071";
    ProxyLogin    = "proxyuser";
    ProxyPassword = "12we...";

    ProxySettings = OPI_SSH.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    Connection = OPI_SSH.CreateConnection(SSHSettings, ProxySettings);

```

Operation through SOCKS4, SOCKS5, and HTTP proxy servers is supported.

:::warning
Operation via HTTP-proxy is experimental and may be unstable depending on implementation, configuration, and capabilities of the proxy server. It is recommended to use SOCKS proxy whenever possible for reliable traffic transfer.
:::
