---
id: FTP
sidebar_class_name: FTP
keywords: [1C, 1C:Enterprise, 1C:Enterprise 8.3, API, Integration, Services, Data Exchange, OneScript, CLI, FTP, FTPS]
---

<img src={require('../../static/img/APIs/FTP.png').default} width='64px' />

# FTP(s)

This section covers the library for working with FTP(s) protocol in 1С:Enterprise, OneScript, and CLI. This page describes all the steps required to get started.

<div class="theme-admonition theme-admonition-info admonition_node_modules-@docusaurus-theme-classic-lib-theme-Admonition-Layout-styles-module alert alert--info">

<img src={require('../../static/img/addin.png').default} class="tipimage" />
<div class="addin">An external component is used to implement some functions in this library<br/>
Please review the ["About external components"](/docs/Start/Component-requirements) section before getting started</div>
</div>

## Getting Started

This library provides various methods for working with FTP(s) on the client side. Each method accepts a `Connection` as its first parameter, which can be initialized in one of two ways:

1. Using the `CreateConnection` function. In this case, a component object is returned that supports a single connection for multiple requests.
2. Using the `GetConnectionConfiguration` function. In this case, only a connection description structure is returned. Each function receiving this structure as the `Connection` parameter will internally create a new connection and close it upon completion

When performing multiple sequential requests to an FTP server, it is recommended to use a full connection obtained via the `CreateConnection` function

## Proxy Usage

The client supports establishing connections through a proxy server. Proxy settings can be obtained using the `GetProxySettings` function. The resulting structure must then be passed to either `CreateConnection` or `GetConnectionConfiguration` when initiating work

```bsl

    ...

    ProxyType = "http"; // http, socks5, socks4

    ProxyAddress  = FunctionParameters["Proxy_IP"];
    ProxyPort     = FunctionParameters["Proxy_Port"];
    ProxyLogin    = FunctionParameters["Proxy_User"];
    ProxyPassword = FunctionParameters["Proxy_Password"];

    ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

```

Support is provided for socks4, socks5, and http proxy servers

:::warning
Operation via http-proxy is experimental and may be unstable depending on the proxy server’s implementation, configuration, and capabilities. It is recommended to use socks-proxy whenever possible for stable traffic transmission
:::

## FTPS (TLS)

The client also supports secure connections via TLS. To enable it, pass the TLS settings structure to `CreateConnection` or `GetConnectionConfiguration` when initiating work. The TLS settings structure can be obtained using the `GetTlsSettings` function


```bsl

    ...

    TLSSettings = OPI_FTP.GetTLSSettings(True);
    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

```