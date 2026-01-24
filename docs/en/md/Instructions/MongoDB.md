---
id: MongoDB
sidebar_class_name: MongoDB
keywords: [1C, 1С, 1С:Enterprise, 1С:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, MongoDB]
---

<img src={require('../../static/img/APIs/MongoDB.png').default} width='64px' />

# MongoDB

This section covers the library for working with MongoDB databases in 1C:Enterprise, OneScript, and CLI. This page describes all the steps required to get started.

<div class="theme-admonition theme-admonition-info admonition_node_modules-@docusaurus-theme-classic-lib-theme-Admonition-Layout-styles-module alert alert--info">

<img src={require('../../static/img/addin.png').default} class="tipimage" />
<div class="addin">An external component is used to implement some functions in this library<br/>
Please review the ["About external components"](/docs/Start/Component-requirements) section before getting started</div>
</div>

## Creating a Connection

When using any function from this library, the first step is to initialize a connection to the MongoDB server. This is done using a connection string of the following format:

```
mongodb://[username:password@]host1[:port1][,...hostN[:portN]][/[defaultauthdb][?options]]
```

This string can be generated using the `GenerateConnectionString` function or obtained from other sources. Afterwards, the connection can be initialized in one of the following ways:

- **Explicitly**: The connection object can be explicitly created using the `CreateConnection` function. This object may be reused in multiple calls to MongoDB functions, and the connection will remain active as long as the object exists unless `CloseConnection` is called or the connection is closed due to other external reasons.

- **Implicitly**: In addition to passing a pre-created connection, library functions also support providing a connection string as the `Connection` parameter. When using this approach, a connection using the specified connection string is automatically established inside the executed function and closed upon completion.

When performing multiple sequential requests to the server, it is recommended to use a full-fledged connection object obtained via the `CreateConnection` function.

## Type Conversion

MongoDB uses a JSON-like format for documents, but supports a much wider range of data types. Some of these types, when performing value-insertion operations, can be automatically converted by the library, based on value types in 1C/OneScript. These types include:

| 1C Type | MongoDB Type (BSON) |
|-|-|
| String | String |
| Number (integer part only) | Int64 |
| Number (with fractional part) | Double |
| Boolean | Boolean |
| Date | DateTime |
| Array | Array |
| Structure, Map | Document |
| BinaryData | Binary |
| Undefined | Null |

In addition to automatic conversion, you can also specify the data type explicitly. To do so, the value must be wrapped in a structure where the key is the type identifier, and the value is the actual data being passed. The list of supported types and their keys is shown in the table below:

| Structure/JSON Object Key | MongoDB Type (BSON) |
|-|-|
| \_\_OPI_STRING\_\_ | String |
| \_\_OPI_INT32\_\_ | Int32 |
| \_\_OPI_INT64\_\_ | Int64 |
| \_\_OPI_DOUBLE\_\_ | Double |
| \_\_OPI_BOOLEAN\_\_ | Boolean |
| \_\_OPI_DATETIME\_\_ | DateTime |
| \_\_OPI_TIMESTAMP\_\_ | Timestamp |
| \_\_OPI_OBJECTID\_\_ | ObjectID |
| \_\_OPI_REGEXP\_\_ | RegularExpression |
| \_\_OPI_JS\_\_ | JavaScriptCode |
| \_\_OPI_SYMBOL\_\_ | Symbol |
| \_\_OPI_MINKEY\_\_ | MinKey |
| \_\_OPI_MAXKEY\_\_ | MaxKey |
| \_\_OPI_NULL\_\_ | Null |
| \_\_OPI_BINARY\_\_ | Binary |

Values of types `Structure`, `Map`, and `Array` do not require explicit type specification and are always converted as `Document` and `Array` respectively.

A detailed example of type conversion when inserting data can be found in the `InsertDocuments` function description.

## Other Features

For convenience, several additional features were implemented during the library's development:

- Since structure keys in 1C cannot contain special characters, the commonly used symbol `$` can be specified as `__4`.

```bsl
    // __4 = $
    Example = New Structure("__4gte, __4lte", 100, 150); // $gte: 100, $lte: 150
    Filter  = New Structure("stringField,doubleField", "Text", Example);
```

- Data of type `Binary` retrieved from MongoDB is returned as structures of the form `{"__B64_BINARY__": <Base64 string value>}`

- Data of types `MaxKey` and `MinKey` retrieved from MongoDB are returned as strings `<<MaxKey>>` and `<<MinKey>>` respectively