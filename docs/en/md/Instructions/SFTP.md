---
id: SFTP
sidebar_class_name: SFTP
keywords: [1C, 1C:Enterprise, 1C:Enterprise 8.3, API, Integration, Services, Data Exchange, OneScript, CLI, SFTP]
---

<img src={require('../../static/img/APIs/SFTP.png').default} width='64px' />

# SFTP

This section covers the library for working with SFTP protocol in 1С:Enterprise, OneScript, and CLI. This page describes all the steps required to get started.

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

## Getting Started

This library provides various methods for working with SFTP on the client side. Each method accepts a `Connection` as its first parameter, which can be initialized in one of two ways:

1. Using the `CreateConnection` function. In this case, a component object is returned that supports a single connection for multiple requests.
2. Using the `GetConnectionConfiguration` function. In this case, only a connection description structure is returned. Each function receiving this structure as the `Connection` parameter will internally create a new connection and close it upon completion

When performing multiple sequential requests to an SFTP server, it is recommended to use a full connection obtained via the `CreateConnection` function

Once a connection is established, it can be used with the library's other methods to perform specific tasks

## Proxy Usage

The client supports establishing connections through a proxy server. Proxy settings can be obtained using the `GetProxySettings` function. The resulting structure must then be passed to either `CreateConnection` or `GetConnectionConfiguration` when initiating work

```bsl

    ...

    ProxyType = "http"; // http, socks5, socks4

    ProxyAddress  = FunctionParameters["Proxy_IP"];
    ProxyPort     = FunctionParameters["Proxy_Port"];
    ProxyLogin    = FunctionParameters["Proxy_User"];
    ProxyPassword = FunctionParameters["Proxy_Password"];

    ProxySettings = OPI_SFTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    Connection = OPI_SFTP.CreateConnection(SFTPSettings, ProxySettings);

```

Support is provided for socks4, socks5, and http proxy servers

:::warning
Operation via http-proxy is experimental and may be unstable depending on the proxy server’s implementation, configuration, and capabilities. It is recommended to use socks-proxy whenever possible for stable traffic transmission
:::

## Compatibility with the SSH Library

The SFTP and SSH libraries share a common connection format. This means that when working with SFTP, you can also execute `sh` commands by passing the existing connection object to the SSH library methods.
