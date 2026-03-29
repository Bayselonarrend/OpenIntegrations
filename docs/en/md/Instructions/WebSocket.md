---
id: WebSocket
sidebar_class_name: WebSocket
keywords: [1C, 1C, 1C:Enterprise, 1C:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, WebSocket]
---

<img src={require('../../static/img/APIs/WebSocket.png').default} width='64px' />

# WebSocket

import LibraryIntro from '@site/src/components/LibraryIntro';

<LibraryIntro module="OPI_WebSocket" cli="ws" use="oint/api/tcp" lang="en"/>

This section is dedicated to the library for working with WebSocket in 1C:Enterprise, OneScript and CLI. This page describes all actions necessary for getting started

## Getting started

WebSocket is a bidirectional communication protocol that allows establishing a persistent connection between client and server. The library provides the ability to create a WebSocket server for accepting incoming connections.

### Starting the server

To start a WebSocket server, you need to:

1. Define the **port** on which the server will run
2. Specify the **pool size** — the maximum number of simultaneously supported connections (default 100)
3. If necessary, configure **logging** using the `GetLoggingSettings` function
4. Start the server using the `StartServer` function

```bsl
Port = 8080;
PoolSize = 100;

// Logging setup (optional)
LoggingSettings = OPI_WebSocket.GetLoggingSettings(True, 300, "");

ServerObject = OPI_WebSocket.StartServer(Port, PoolSize, LoggingSettings);
```

### Logging configuration

The library supports server event logging with the ability to write to memory and/or to a file:

```bsl
// Parameters:
// - WriteToMemory: write log to memory for retrieval via GetLog
// - MaxEvents: maximum number of events in memory
// - PathToFile: path to file for saving the full log

LoggingSettings = OPI_WebSocket.GetLoggingSettings(True, 300, "/path/to/log.log");
```

### Working with connections

After starting, the server accepts incoming WebSocket connections. The following methods are available for working with data:

**Getting data from queue:**

```bsl
// Gets data from the buffer of the next active connection
Timeout = 1000; // ms
MaxSize = 8192; // bytes

Result = OPI_WebSocket.GetNextConnectionData(ServerObject, Timeout, MaxSize);
```

**Getting data from specific connection:**

```bsl
// Gets data from the buffer of a specific connection by ID
ConnectionID = "connection_id_123";

Result = OPI_WebSocket.GetConnectionData(ServerObject, ConnectionID, Timeout, MaxSize);
```

**Sending data:**

```bsl
// Sends data to the specified connection
Data = "Text message"; // or BinaryData

Result = OPI_WebSocket.SendData(ServerObject, ConnectionID, Data);
```

**Connection management:**

```bsl
// Get list of active connections
ConnectionList = OPI_WebSocket.GetConnectionList(ServerObject);

// Close specific connection
Result = OPI_WebSocket.CloseIncomingConnection(ServerObject, ConnectionID);
```

:::note
The connection list shows active connections and closed connections with unprocessed data in the buffer
:::

### Getting logs

When logging to memory is enabled, you can retrieve log data:

```bsl
// Get log as array of events
Log = OPI_WebSocket.GetLog(ServerObject, False, 100);

// Get log as string
LogAsString = OPI_WebSocket.GetLog(ServerObject, True, 100);
```

### Stopping the server

To properly shut down the server, use:

```bsl
Result = OPI_WebSocket.StopServer(ServerObject);
```

### Checking object types

The library provides methods for checking object types:

```bsl
// Check server object
IsServer = OPI_WebSocket.IsServerObject(ServerObject);

// Check client object
IsClient = OPI_WebSocket.IsClientObject(ClientObject);
```