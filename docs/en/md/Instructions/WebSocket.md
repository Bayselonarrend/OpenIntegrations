---
id: WebSocket
sidebar_class_name: WebSocket
keywords: [1C, 1C:Enterprise, 1C:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, WebSocket]
---

<img src={require('../../static/img/APIs/WebSocket.png').default} width='64px' />

# WebSocket

import LibraryIntro from '@site/src/components/LibraryIntro';

<LibraryIntro module="OPI_WebSocket" cli="ws" use="oint/api/ws" lang="en"/>

This section covers the WebSocket library for 1C:Enterprise, OneScript, and CLI. It provides an overview of the main module capabilities and core usage principles.

## Getting Started

WebSocket provides bidirectional communication over a single TCP connection. The library supports two operating modes:

- **Client** - connect to an external WebSocket server (`ws://` or `wss://`)
- **Server** - run your own WebSocket server and handle incoming connections

## Working in client mode

Client mode is used to connect to external WebSocket services and exchange messages. The main entry point is `CreateConnection`. After connecting, you can:

- send text and binary messages (`SendTextMessage`, `SendBinaryMessage`)
- receive incoming data (`GetMessage`)
- use service keepalive frames (`SendPing`, `SendPong`)
- close the session explicitly (`CloseConnection`)

```bsl
Address    = "wss://example.com:443/ws";
Connection = OPI_WebSocket.CreateConnection(Address);

OPI_WebSocket.SendTextMessage(Connection, "Hello, server!");
Response = OPI_WebSocket.GetMessage(Connection, 5000);

OPI_WebSocket.CloseConnection(Connection);
```

### TLS

TLS is used for secure client connections (`wss://`). Build TLS settings with `GetTlsSettings` and pass them to `CreateConnection`. If TLS settings are not passed, the connection is opened without encryption.

```bsl
Address     = "wss://example.com:443/ws";
TLSSettings = OPI_WebSocket.GetTlsSettings(False, "/path/to/certificate.pem");

Connection  = OPI_WebSocket.CreateConnection(Address, TLSSettings);
```

:::important
TLS settings are applied only when creating a connection (`CreateConnection`). You cannot change them for an already opened connection.
:::

### Proxy

The client supports proxy-based connections. Build proxy settings using `GetProxySettings` and pass them as the third parameter of `CreateConnection`. Supported proxy types: `socks5`, `socks4`, and `http`.

```bsl
Address       = "ws://example.com:80/ws";
ProxySettings = OPI_WebSocket.GetProxySettings("127.0.0.1", "8071", "socks5");

Connection    = OPI_WebSocket.CreateConnection(Address, Undefined, ProxySettings);
```

## Working in server mode

Server mode is used to accept incoming WebSocket connections and exchange data with clients. It includes lifecycle and connection management methods:

- start and stop server (`StartServer`, `StopServer`)
- read incoming data (`GetNextConnectionData`, `GetConnectionData`)
- send responses to a specific connection (`SendData`)
- list and close incoming connections (`GetConnectionList`, `CloseIncomingConnection`)

```bsl
Port     = 8080;
PoolSize = 100;
Logging  = OPI_WebSocket.GetLoggingSettings(True, 300);

Server = OPI_WebSocket.StartServer(Port, PoolSize, Logging);
Data   = OPI_WebSocket.GetNextConnectionData(Server, 1000);

If Data["result"] Then

    ConnectionID = Data["connectionId"];
    Message      = Data["message"];

    OPI_WebSocket.SendData(Server, ConnectionID, "Server response");
    
EndIf;

OPI_WebSocket.StopServer(Server);
```

## Common capabilities

- `GetLoggingSettings` and `GetLog` provide diagnostics for both client and server
- `IsClientObject` and `IsServerObject` verify the type of returned component object
- For full parameters and edge cases, see **Client methods**, **Server methods**, and **Common**
