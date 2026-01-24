---
id: SFTP
sidebar_class_name: SFTP
keywords: [1C, 1C:Enterprise, 1C:Enterprise 8.3, API, Integration, Services, Data Exchange, OneScript, CLI, SFTP]
---

<img src={require('../../static/img/APIs/SFTP.png').default} width='64px' />

# SFTP

This section covers the library for working with the SFTP protocol in 1C:Enterprise, OneScript, and CLI. This page describes all the steps required to get started.

<div class="theme-admonition theme-admonition-info admonition_node_modules-@docusaurus-theme-classic-lib-theme-Admonition-Layout-styles-module alert alert--info">

<img src={require('../../static/img/addin.png').default} class="tipimage" />
<div class="addin">An external component is used to implement some functions in this library<br/>
Please review the section ["About external components"](/docs/Start/Component-requirements) before getting started</div>
</div>

<div class="theme-admonition theme-admonition-caution admonition_node_modules-@docusaurus-theme-classic-lib-theme-Admonition-Layout-styles-module alert alert--warning">

<img src={require('../../static/img/lock.png').default} class="tipimage" />
<div class="addin">This library requires **OpenSSL 3.x** to run on Linux <br/>
Learn more: <a href="/docs/Start/Component-requirements#openssl" class="orangelink">"Using OpenSSL in External Components"</a></div>
</div>

## Getting Started

This library provides various methods for working with SFTP on the client side. Each method accepts a `Connection` parameter as its first argument, which can be created in one of two ways:

1. Using the `CreateConnection` function. In this case, a component object that maintains a single connection for multiple requests is returned.
2. Using the `GetConnectionConfiguration` function. In this case, only a structure describing the connection is returned. Each function that receives this structure as the `Connection` parameter will internally create and close a new connection during the call.

When performing multiple sequential requests to an FTP server, it is recommended to use a persistent connection created via the `CreateConnection` function.

Once the connection is established, it can be used with the rest of the library's methods to perform specific tasks.

## Proxy Usage

The client supports establishing connections through a proxy server. You can obtain the proxy settings structure using the `GetProxySettings` function. The resulting structure should be passed to the `CreateConnection` or `GetConnectionConfiguration` functions when starting work.

```bsl

    ...

    ProxyType = "http"; // http, socks5, socks4

    ProxyAddress  = "127.0.0.1";
    ProxyPort     = "8071";
    ProxyLogin    = "proxyuser";
    ProxyPassword = "12we...";

    ProxySettings = OPI_SFTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    Connection = OPI_SFTP.CreateConnection(SFTPSettings, ProxySettings);

```

Support is provided for SOCKS4, SOCKS5, and HTTP proxy servers.

:::warning
Operation via HTTP proxy is experimental and may be unstable depending on the proxy server's implementation, configuration, and capabilities. It is recommended to use SOCKS proxies whenever possible for stable traffic transmission.
:::

## Compatibility with the SSH Library

The SFTP and SSH libraries share a common connection format. This means that when working with SFTP, you can also execute `sh` commands by passing the already existing connection object to SSH library methods.