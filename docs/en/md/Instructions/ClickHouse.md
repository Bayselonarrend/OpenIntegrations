---
id: ClickHouse
sidebar_class_name: ClickHouse
keywords: [1C, 1С, 1С:Предприятие, 1С:Предприятие 8.3, API, Интеграция, Сервисы, Обмен, OneScript, CLI, ClickHouse]
---

<img src={require('../../static/img/APIs/ClickHouse.png').default} width='64px' />

# ClickHouse

import LibraryIntro from '@site/src/components/LibraryIntro';

<LibraryIntro module="OPI_ClickHouse" cli="clickhouse" use="oint/api/clickhouse" lang="en"/>

This section is dedicated to the library for working with ClickHouse API in 1C:Enterprise, OneScript and CLI. This page describes all the actions necessary for a complete start of work

## Getting Started

ClickHouse is a high-performance columnar DBMS with open source code. The library supports working through HTTP and gRPC protocols.

### Connection Methods

The library supports two main methods of connecting to ClickHouse:

1. **HTTP** — standard protocol for working with ClickHouse through HTTP interface
2. **gRPC** — high-performance protocol for working with ClickHouse through gRPC interface

### HTTP Connection Setup

To work through HTTP, you need to:

1. Get the connection address to ClickHouse (specifying the protocol and port, for example `http://localhost:8123`)
2. Prepare authorization data:
   - **JWT token** (string) — for authorization through JWT (ClickHouse Cloud)
   - **Login and password** (structure) — for Basic authorization
3. Create connection settings using the `GetHTTPConnectionSettings` function

```bsl
Address = "http://localhost:8123";

// Authorization through Basic
Authorization = New Structure;
Authorization.Insert("default", "password");

// Authorization through JWT
Authorization = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...";

ConnectionSettings = OPI_ClickHouse.GetHTTPConnectionSettings(Address, Authorization);
```

### gRPC Connection Setup

To work through gRPC, you need to:

1. Get the connection address to ClickHouse gRPC interface (for example `http://localhost:9100`)
2. Prepare authorization data similar to HTTP
3. If necessary, configure TLS using the `GetTlsSettings` function
4. Create connection settings using the `GetGRPCConnectionSettings` function
5. Open connection using the `CreateGRPCConnection` function

```bsl
Address = "http://localhost:9100";

Authorization = New Structure;
Authorization.Insert("default", "password");

// TLS setup (optional)
TLSSettings = OPI_ClickHouse.GetTlsSettings(True);

ConnectionSettings = OPI_ClickHouse.GetGRPCConnectionSettings(Address, Authorization, , TLSSettings);
Connection = OPI_ClickHouse.CreateGRPCConnection(ConnectionSettings);
```

:::important
When working through gRPC, it is recommended to use an open connection (connector object) for executing multiple queries. This improves performance and reduces overhead for establishing a connection
:::

### Executing Queries

After configuring the connection, you can execute queries to the database:

```bsl
QueryText = "SELECT * FROM system.databases";
Query = OPI_ClickHouse.GetRequestSettings(QueryText, "default", , , "JSON");

Result = OPI_ClickHouse.ExecuteRequest(ConnectionSettings, Query);
```

### External Tables

To pass data to a query, you can use external tables:

```bsl
// Table structure description
Columns = New Structure;
Columns.Insert("id", "UInt32");
Columns.Insert("name", "String");

// Data preparation
Data = "1,Ivan" + Chars.LF + "2,Petr";

// Creating external table
ExternalTable = OPI_ClickHouse.GetExternalTableStructure("users", Columns, Data, "CSV");

TablesArray = New Array;
TablesArray.Add(ExternalTable);

Query = OPI_ClickHouse.GetRequestSettings("SELECT * FROM users", , , , "JSON", TablesArray);
```

:::note
When using HTTP transport, you cannot simultaneously use `Data` and `External tables` parameters in a query
:::

### Response Formats

The library supports various response formats:

- **JSON** formats (JSON, JSONCompact, JSONColumns, etc.) — returned as a collection
- **String** formats (CSV, TSV, Pretty, etc.) — returned as a string
- **Other** formats — returned as binary data

```bsl
Query = OPI_ClickHouse.GetRequestSettings(QueryText, , , , "JSON");
Query = OPI_ClickHouse.GetRequestSettings(QueryText, , , , "CSV");
Query = OPI_ClickHouse.GetRequestSettings(QueryText, , , , "Native");
```