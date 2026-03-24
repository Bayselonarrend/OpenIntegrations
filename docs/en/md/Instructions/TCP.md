---
id: TCP
sidebar_class_name: TCP
keywords: [1C, 1C, 1C:Enterprise, 1C:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, TCP]
---

<img src={require('../../static/img/APIs/TCP.png').default} width='64px' />

# TCP

import LibraryIntro from '@site/src/components/LibraryIntro';

<LibraryIntro module="OPI_TCP" cli="tcp" use="oint/api/tcp" lang="en"/>

This section is dedicated to the library for working with TCP connections in 1C:Enterprise, OneScript and CLI. This page describes all the actions necessary to get started

## Getting started

The library provides the ability to work with TCP protocol in two modes: as a **client** (connection to a remote server) and as a **server** (accepting incoming connections). The library supports working with binary data and text, using TLS encryption and proxy servers.

### Working in client mode

To work in client mode, you need to:

1. Prepare the connection address in the format `host:port` (for example, `localhost:8080`)
2. If necessary, configure TLS using the `GetTlsSettings` function
3. If necessary, configure proxy using the `GetProxySettings` function
4. Open connection using the `CreateConnection` function
5. Use data sending and receiving functions
6. Close connection using the `CloseConnection` function

```bsl
Address = "example.com:80";

// Opening connection
Connection = OPI_TCP.CreateConnection(Address);

// Sending data
Data = "GET / HTTP/1.1" + Chars.LF + "Host: example.com" + Chars.LF + Chars.LF;
OPI_TCP.SendString(Connection, Data);

// Getting response
Response = OPI_TCP.ReadString(Connection);

// Closing connection
OPI_TCP.CloseConnection(Connection);
```

### Working with TLS

To work with secure connections, use TLS settings:

```bsl
// TLS setup with certificate validation disabled
TLSSettings = OPI_TCP.GetTlsSettings(True);

// TLS setup with certificate path specified
TLSSettings = OPI_TCP.GetTlsSettings(False, "/path/to/certificate.pem");

Address = "example.com:443";
Connection = OPI_TCP.CreateConnection(Address, TLSSettings);
```

### Working through proxy

The library supports working through proxy servers:

```bsl
// Proxy setup
ProxySettings = OPI_TCP.GetProxySettings("proxy.example.com", 1080, "socks5", "login", "password");

Address = "example.com:80";
Connection = OPI_TCP.CreateConnection(Address, , ProxySettings);
```

Supported proxy types: `socks5`, `socks4`, `http`

### Single request

To execute a simple request without explicit connection management, use the `ProcessRequest` function:

```bsl
Address = "example.com:80";
Data = "GET / HTTP/1.1" + Chars.LF + "Host: example.com" + Chars.LF + Chars.LF;

Response = OPI_TCP.ProcessRequest(Address, Data);
```

### Working in server mode

To create a TCP server, you need to:

1. If necessary, configure logging using the `GetLoggingSettings` function
2. Start the server using the `StartServer` function
3. Receive incoming data using the `GetNextConnectionData` or `GetConnectionData` functions
4. Send responses using the `SendData` function
5. Stop the server using the `StopServer` function

```bsl
Port = 8080;
PoolSize = 100;

// Logging setup (optional)
LogSettings = OPI_TCP.GetLoggingSettings(True, 300, "/path/to/log.txt");

// Starting server
Server = OPI_TCP.StartServer(Port, PoolSize, LogSettings);

// Getting data from queue
Message = OPI_TCP.GetNextConnectionData(Server, 5000);

If Message["result"] Then
    ConnectionID = Message["connection_id"];
    IncomingData = Message["message"];
    
    // Sending response
    Response = "Data received";
    OPI_TCP.SendData(Server, ConnectionID, Response);
EndIf;

// Stopping server
OPI_TCP.StopServer(Server);
```

### Working with data

The library supports working with both binary data and strings:

```bsl
// Reading and sending strings
String = OPI_TCP.ReadString(Connection, "UTF-8");
OPI_TCP.SendString(Connection, "Hello, world!", "UTF-8");

// Reading and sending binary data
BinaryData = OPI_TCP.ReadBinaryData(Connection, 1024);
OPI_TCP.SendBinaryData(Connection, BinaryData);
```

### Using end-of-message markers

When reading data, you can specify a marker that will terminate reading when reached:

```bsl
// Reading until line feed character
Data = OPI_TCP.ReadString(Connection, "UTF-8", Chars.LF);

// Reading until custom marker
Marker = GetBinaryDataFromString("END");
Data = OPI_TCP.ReadBinaryData(Connection, , Marker);
```

:::important
When working with an infinite stream of incoming data, be sure to specify the `MaximumSize` parameter or use an end-of-message marker, as infinite data reception can lead to hanging
:::