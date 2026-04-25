---
id: WebSocket
sidebar_class_name: WebSocket
keywords: [1C, 1C:Enterprise, 1C:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, WebSocket]
---

<img src={require('../../static/img/APIs/WebSocket.png').default} width='64px' />

# WebSocket

import LibraryIntro from '@site/src/components/LibraryIntro';

<LibraryIntro module="OPI_WebSocket" cli="ws" use="oint/api/ws" lang="en"/>

This section is dedicated to the WebSocket protocol library for 1C:Enterprise, OneScript, and CLI. This page describes all the actions necessary for a complete start

## Getting Started

WebSocket is a protocol that provides full-duplex communication between a client and a server over a single TCP connection. The library supports both client mode (connecting to a WebSocket server) and server mode (accepting incoming connections).

### Operating Modes

The library supports two main operating modes:

1. **Client** — connecting to an external WebSocket server
2. **Server** — creating your own WebSocket server to accept incoming connections

### Working in Client Mode

To connect to a WebSocket server, you need to:

1. Prepare the connection address (e.g., `wss://example.com:443/ws`)
2. Configure TLS if necessary using the `GetTlsSettings` function
3. Open the connection using the `CreateConnection` function

```bsl
Address = "wss://example.com:443/ws";

// TLS configuration (for wss://)
TLSSettings = OPI_WebSocket.GetTlsSettings(False);

// Opening connection
Connection = OPI_WebSocket.CreateConnection(Address, TLSSettings);

// Sending text message
Result = OPI_WebSocket.SendTextMessage(Connection, "Hello, server!");

// Receiving response
Response = OPI_WebSocket.GetMessage(Connection, 5000);

// Closing connection
OPI_WebSocket.CloseConnection(Connection);
```

### Working in Server Mode

To create a WebSocket server, you need to:

1. Select a port to listen on
2. Configure logging using the `GetLoggingSettings` function (optional)
3. Start the server using the `StartServer` function

```bsl
Port = 8080;
PoolSize = 100; // Maximum number of simultaneous connections

// Logging configuration
Logging = OPI_WebSocket.GetLoggingSettings(True, 300);

// Starting server
Server = OPI_WebSocket.StartServer(Port, PoolSize, Logging);

// Receiving data from clients
Data = OPI_WebSocket.GetNextConnectionData(Server, 1000);

If Data["result"] Then
    ConnectionID = Data["connection"];
    Message = Data["data"];
    
    // Sending response
    OPI_WebSocket.SendData(Server, ConnectionID, "Server response");
EndIf;

// Stopping server
OPI_WebSocket.StopServer(Server);
```

### TLS Configuration

For secure connections (wss://), you need to configure TLS:

```bsl
// Trust all certificates (for testing)
TLSSettings = OPI_WebSocket.GetTlsSettings(True);

// Use a specific certificate
CertificatePath = "/path/to/certificate.pem";
TLSSettings = OPI_WebSocket.GetTlsSettings(False, CertificatePath);
```

:::important
TLS settings can only be set at the moment of connection creation
:::

### Logging

For debugging and monitoring server operation, you can enable logging:

```bsl
// Logging to memory (last 300 events)
Logging = OPI_WebSocket.GetLoggingSettings(True, 300);

// Logging to file
Logging = OPI_WebSocket.GetLoggingSettings(True, 300, "/path/to/log.txt");

// Getting log
Log = OPI_WebSocket.GetLog(Server, True, 100);
```

### Message Types

The library supports various message types:

- **Text** — sending via `SendTextMessage`
- **Binary** — sending via `SendBinaryMessage`
- **Ping/Pong** — service messages for connection checking

```bsl
// Sending text
OPI_WebSocket.SendTextMessage(Connection, "Text message");

// Sending binary data
BinaryData = GetBinaryDataFromFile("file.bin");
OPI_WebSocket.SendBinaryMessage(Connection, BinaryData);

// Connection check
OPI_WebSocket.SendPing(Connection);
```