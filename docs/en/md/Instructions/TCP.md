---
id: TCP
sidebar_class_name: TCP
keywords: [1C, 1С, 1С:Enterprise, 1С:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, TCP]
---

<img src={require('../../static/img/APIs/TCP.png').default} width='64px' />

# TCP (Client)

This section covers the library for working with the TCP protocol in 1C:Enterprise, OneScript, and CLI. This page describes all the steps required to get started.

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

## About implemented methods

This library offers several ready-to-use methods for acting as a TCP client. The standard interaction sequence with a server is as follows:

1. Create the object and connect to the server using the `OpenConnection` function. The connection string in the format `<address>:<port>` is provided as a parameter.
2. If necessary, send a message to the server using the `SendBinaryData` and `SendLine` functions.
3. To receive data from the server, use the `ReadBinaryData` and `ReadLine` functions. These support various parameters to limit the data received by size, token/marker, and input waiting time (timeout).
4. After finishing work, it’s recommended to explicitly close the connection using the `CloseConnection` function.

For a simple scenario with the default settings, there is also the `ProcessRequest` function—it sends data to the specified address and waits for a response, finishing reading upon detecting the standard `\n` marker. This is also the only function available in the CLI version of OPI.

## TLS

The library supports TLS mode. To enable it, you need to generate TLS settings using the `GetTlsSettings` function and provide them as the relevant parameter to the `OpenConnection` or `ProcessRequest` functions. If the TLS parameter is not passed to these functions, the connection will be initialized in unprotected mode.

## Proxy Usage

This client supports establishing connections through a proxy server. You can obtain the proxy settings structure using the `GetProxySettings` function. The obtained structure should then be provided to the `OpenConnection` or `ProcessRequest` function at the beginning of the work.

```bsl

    ...

    ProxyType = "http"; // http, socks5, socks4

    ProxyAddress  = "127.0.0.1";
    ProxyPort     = "8071";
    ProxyLogin    = "proxyuser";
    ProxyPassword = "12we...";

    ProxySettings = OPI_TCP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    Connection = OPI_TCP.OpenConnection(Address, TLSSettings, ProxySettings);

```

Operation via SOCKS4, SOCKS5, and HTTP proxy servers is supported.

:::warning
Operation via HTTP proxy is experimental and may be unstable depending on the specific proxy server implementation, its configuration, and capabilities. Whenever possible, it is recommended to use SOCKS proxy for stable traffic transmission.
:::