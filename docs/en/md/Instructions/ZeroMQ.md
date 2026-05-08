---
id: ZeroMQ
sidebar_class_name: ZeroMQ
keywords: [1C, 1C, 1C:Enterprise, 1C:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, ZeroMQ]
---

<img src={require('../../static/img/APIs/ZeroMQ.png').default} width='64px' />

# ZeroMQ

import LibraryIntro from '@site/src/components/LibraryIntro';

<LibraryIntro module="OPI_ZeroMQ" cli="" use="oint/api/zeromq" lang="en"/>

This section is dedicated to the library for working with ZeroMQ in 1C:Enterprise and OneScript. This page describes all the actions necessary to get started

## Getting Started

ZeroMQ is a high-performance asynchronous messaging library that provides sockets operating over various transports (TCP, IPC, in-process). The library supports several messaging patterns.

### Messaging Patterns

The library supports the following ZeroMQ patterns:

#### 1. Request-Reply (REQ/REP)

Synchronous request-reply pattern. The client sends a request and waits for a response from the server.

**Client:**
```bsl
Address = "tcp://localhost:5555";
Connection = OPI_ZeroMQ.CreateConnectionReq(Address);

Data = GetBinaryDataFromString("Hello, server!");
Result = OPI_ZeroMQ.ProcessRequest(Connection, Data, 5000, 5000);
```

**Server:**
```bsl
Port = 5555;
Connection = OPI_ZeroMQ.OpenPortRep(Port);

Result = OPI_ZeroMQ.GetData(Connection, -1);
Response = GetBinaryDataFromString("Server response");
OPI_ZeroMQ.SendData(Connection, Response);
```

#### 2. Publish-Subscribe (PUB/SUB)

Publish-subscribe pattern. The publisher sends messages to all subscribers on specific topics.

**Publisher:**
```bsl
Port = 5556;
Connection = OPI_ZeroMQ.OpenPortPub(Port);

Data = GetBinaryDataFromString("topic1:Message on topic 1");
OPI_ZeroMQ.SendData(Connection, Data);
```

**Subscriber:**
```bsl
Address = "tcp://localhost:5556";
Connection = OPI_ZeroMQ.CreateConnectionSub(Address);

// Subscribe to topic
OPI_ZeroMQ.Subscribe(Connection, "topic1");

// Receive messages
Result = OPI_ZeroMQ.GetData(Connection, -1);
```

#### 3. Pipeline (PUSH/PULL)

Pipeline processing pattern. Tasks are distributed among workers.

**Task sender:**
```bsl
Address = "tcp://localhost:5557";
Connection = OPI_ZeroMQ.CreateConnectionPush(Address);

Data = GetBinaryDataFromString("Task for processing");
OPI_ZeroMQ.SendData(Connection, Data);
```

**Task worker:**
```bsl
Port = 5557;
Connection = OPI_ZeroMQ.OpenPortPull(Port);

Result = OPI_ZeroMQ.GetData(Connection, -1);
// Process received task
```

### Working with Timeouts

All data sending and receiving methods support timeouts (in milliseconds):

- **-1** or **Undefined** — wait without timeout (blocking mode)
- **0** — non-blocking mode (immediate return)
- **> 0** — wait for the specified number of milliseconds

```bsl
// Wait without timeout
Result = OPI_ZeroMQ.GetData(Connection, -1);

// Non-blocking receive
Result = OPI_ZeroMQ.GetData(Connection, 0);

// Wait 5 seconds
Result = OPI_ZeroMQ.GetData(Connection, 5000);
```

### Closing Connections

After completing work, connections must be closed:

```bsl
OPI_ZeroMQ.CloseConnection(Connection);
```

:::important
It is recommended to always close connections after completing work for proper resource release
:::