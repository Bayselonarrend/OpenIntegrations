---
id: TCP
sidebar_class_name: TCP
keywords: [1C, 1C, 1C:Enterprise, 1C:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, TCP]
---

<img src={require('../../static/img/APIs/TCP.png').default} width='64px' />

# TCP

import LibraryIntro from '@site/src/components/LibraryIntro';

<LibraryIntro module="OPI_TCP" cli="tcp" use="oint/api/tcp" lang="en"/>

This section is dedicated to the library for working with TCP connections in 1C:Enterprise, OneScript and CLI. This page describes all the actions necessary for a complete start of work

<div class="theme-admonition theme-admonition-info admonition_node_modules-@docusaurus-theme-classic-lib-theme-Admonition-Layout-styles-module alert alert--info">

<img src={require('../../static/img/addin.png').default} class="tipimage" />
<div class="addin">An external component is used to implement some functions in this library <br/>
Please refer to the ["About external components"](/docs/Start/Component-requirements) section before starting work</div>
</div>


<div class="theme-admonition theme-admonition-caution admonition_node_modules-@docusaurus-theme-classic-lib-theme-Admonition-Layout-styles-module alert alert--warning">

<img src={require('../../static/img/lock.png').default} class="tipimage" />
<div class="addin">**OpenSSL 3.x** is required for this library to work on Linux <br/>
Learn more: <a href="/docs/Start/Component-requirements#openssl" class="orangelink">"About using OpenSSL in external components"</a></div>
</div>

## Getting started

The library provides the ability to work with TCP protocol in two modes: as a **client** (connecting to a remote server) and as a **server** (accepting incoming connections). The library supports working with binary data and text, using TLS encryption and proxy servers.

## Working in client mode

This library provides several ready-made methods for working as a TCP client. The standard interaction scheme is as follows:

    1. Creating an object and connecting to the server is performed using the `CreateConnection` function. A connection string in the format `<address>:<port>` is passed to it
    2. If necessary, a message can be sent to the server using the `SendBinaryData` and `SendLine` functions
    3. To receive data from the server, the `ReadBinaryData` and `ReadString` functions are used. They have various parameters for limiting the received data by size, marker and input waiting (timeout)
    4. When finishing work, it is advisable to explicitly terminate the connection using the `CloseConnection` function

For a simple scenario with standard settings, there is also a `ProcessRequest` function - it sends data to the specified address and waits for a response, completing the reading when the standard marker `\\n` is found. This is also the only function available in the CLI version of OpenIntegrations

### TLS

The library supports working in TLS mode. To enable it, you need to form TLS settings using the `GetTlsSettings` function, and pass them as the corresponding parameter to the `CreateConnection` or `ProcessRequest` function. If the TLS parameter is not passed when calling these functions, the connection is initialized in insecure mode

### Using proxy

This client supports creating a connection through a proxy server. You can get the proxy settings structure using the `GetProxySettings` function. The resulting structure should then be passed to the `CreateConnection` or `ProcessRequest` function when starting work

```bsl
    ...

    ProxyType = "http"; // http, socks5, socks4

    ProxyAddress  = "127.0.0.1";
    ProxyPort     = "8071";
    ProxyLogin    = "proxyuser";
    ProxyPassword = "12we...";

    ProxySettings = OPI_TCP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    Connection = OPI_TCP.CreateConnection(Address, TLSSettings, ProxySettings);

```

Working through SOCKS4, SOCKS5 and HTTP-proxy servers is supported

:::warning
Working through http-proxy is experimental and may be unstable depending on the proxy server implementation, its settings and capabilities. It is recommended to use SOCKS-proxy whenever possible for stable traffic transmission
:::

### Working in server mode

To start using TCP server functions, you need to:

1. If necessary, get the logging settings structure using the `GetLoggingSettings` function
2. Start the server using the `StartServer` function
3. Receive incoming data using the `GetNextConnectionData` or `GetConnectionData` functions
4. Send responses using the `SendData` function
5. Stop the server using the `StopServer` function

Example of implementing a simple echo server:

```bsl

Procedure StartEchoServer() Export
    
    Port     = 9876;
    PoolSize = 10;

    LogSettings  = OPI_TCP.GetLoggingSettings(True, 500, "D:\SERVER_LOG.txt");
    ServerObject = OPI_TCP.StartServer(Port, PoolSize, LogSettings);
    
    If Not OPI_TCP.IsServerObject(ServerObject) Then
        Raise ServerObject["error"];
    EndIf;
    
    Try
        
        ResponseTemplate = "Receive ""%1"". Your IP: %2"; 
        
        While Constants.MaintainServer.Get() Do
            
            Result = OPI_TCP.GetNextConnectionData(ServerObject, 10000, 8192);
            
            If Not Result["result"] Then
                
                ErrorText = Result["error"];
                
                If ErrorText = "timeout" Then
                    Continue;
                Else
                    Raise ErrorText;
                EndIf;
                
            EndIf;
            
            ConnectionID = Result["connectionId"];
            Address      = Result["address"];
            Message      = GetStringFromBinaryData(Result["message"]);
            
            Response = StrTemplate(ResponseTemplate, Message, Address);
            
            OPI_TCP.SendData(ServerObject, ConnectionID, Response);
            
        EndDo;
        
    Except
        OPI_TCP.StopServer(ServerObject);
        Raise ErrorDescription();
    EndTry;
    
    OPI_TCP.StopServer(ServerObject);
    
EndProcedure

```