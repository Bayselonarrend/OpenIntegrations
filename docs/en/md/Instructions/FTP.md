---
id: FTP
sidebar_class_name: FTP
keywords: [1C, 1C:Enterprise, 1C:Enterprise 8.3, API, Integration, Services, Data Exchange, OneScript, CLI, FTP, FTPS]
---

<img src={require('../../static/img/APIs/FTP.png').default} width='64px' />

# FTP(s)

import LibraryIntro from '@site/src/components/LibraryIntro';

<LibraryIntro module="OPI_FTP" cli="ftp" use="oint/api/ftp" lang="en"/>

This section covers the library for working with the FTP(s) protocol in 1C:Enterprise, OneScript, and CLI. This page describes all the steps required to get started.

<div class="theme-admonition theme-admonition-info admonition_node_modules-@docusaurus-theme-classic-lib-theme-Admonition-Layout-styles-module alert alert--info">

<img src={require('../../static/img/addin.png').default} class="tipimage" />
<div class="addin">An external component is used to implement some functions in this library<br/>
Please review the ["About external components"](/docs/Start/Component-requirements) section before getting started</div>
</div>

## Getting Started

This library provides various methods for working with FTP(s) on the client side. Each method accepts a `Connection` as its first parameter, which can be initialized in one of two ways:

1. Using the `CreateConnection` function. In this case, the function returns a component object that maintains a dedicated connection for multiple requests.
2. Using the `GetConnectionConfiguration` function. In this case, only a connection configuration structure is returned. Each function that receives this structure as the `Connection` parameter will internally create a new connection and close it upon completion.

When performing multiple sequential requests to an FTP server, it is recommended to use a persistent connection obtained via the `CreateConnection` function.

## Proxy Usage

This client supports establishing a connection through a proxy server. Proxy settings can be obtained using the `GetProxySettings` function. The resulting proxy settings structure should then be supplied to the `CreateConnection` or `GetConnectionConfiguration` function when starting work.

```bsl

    ...

    ProxyType = "http"; // http, socks5, socks4

    ProxyAddress  = "127.0.0.1";
    ProxyPort     = "8071";
    ProxyLogin    = "proxyuser";
    ProxyPassword = "12we...";

    ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

```

Connections via SOCKS4, SOCKS5, and HTTP proxy servers are supported.

:::warning
Working via HTTP proxy is experimental and may be unstable depending on the specific proxy server implementation, its settings, and features. Whenever possible, it is recommended to use SOCKS proxy for reliable traffic transmission.
:::

## FTPS (TLS)

The client also supports secure connections using FTPS (FTP over TLS). To enable this, pass the TLS settings structure to the `CreateConnection` or `GetConnectionConfiguration` functions when establishing the connection. The TLS settings structure can be obtained using the `GetTlsSettings` function.

```bsl

    ...

    TLSSettings = OPI_FTP.GetTLSSettings(True);
    Connection   = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

```