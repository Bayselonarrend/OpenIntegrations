---
id: TCP
sidebar_class_name: TCP
---

<img src={require('../../static/img/APIs/TCP.png').default} width='64px' />

# TCP (Client)

This section is dedicated to the library for working with the TCP. On this page, all the steps necessary to start working are described

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

This library provides several ready-made methods for working as a TCP client. The standard scheme of interaction with the server is as follows:

    1. The object is created and connected to the server using the `CreateConnection` function. The connection string in the format `<address>:<port>` is passed there.
    2. If necessary, a message can be sent to the server using the `SendBinaryData` and `SendLine` functions
    3. To receive data from the server, the `ReadBinaryData` and `ReadLine` functions are used. They have different parameters to limit the received data by size, token and waiting for input (timeout)
    4. At the end of work it is desirable to explicitly terminate the connection using the `CloseConnection` function

For a simple scenario with standard settings, there is also the `ProcessRequest` function - it sends data to the specified address and waits for a response, finishing reading when the standard `\\n` token is found. It is also the only function that is available in the CLI version of the OPI

## Compatibility

Technically, the client implementation is a Native component in Rust. It comes in a zip archive format, and, in theory, should work on all available platforms: x86 and x64 Windows and Linux. The actual testing was done on Windows x64 and, cossentially (via OneScript), on Linux x64