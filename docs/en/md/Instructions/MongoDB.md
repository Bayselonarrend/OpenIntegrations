---
id: MongoDB
sidebar_class_name: MongoDB
---

<img src={require('../../static/img/APIs/MongoDB.png').default} width='64px' />

# MongoDB

This section covers the library for working with MongoDB databases in 1С:Enterprise, OneScript, and CLI. This page describes all the steps required to get started.

<div class="theme-admonition theme-admonition-info admonition_node_modules-@docusaurus-theme-classic-lib-theme-Admonition-Layout-styles-module alert alert--info">

<img src={require('../../static/img/addin.png').default} class="tipimage" />
<div class="addin">Some functions in this library use an external component <br/>
Please review the ["About External Components"](/docs/Start/Component-requirements) section before starting work</div>
</div>

## Creating a Connection

When using any functions in this library, the first step is to initialize a connection to the MongoDB server. A connection string of the following format is used for this:

```
mongodb://[username:password@]host1[:port1][,...hostN[:portN]][/[defaultauthdb][?options]]
```


This string can be formed using the `GenerateConnectionString` function or obtained from other sources. Then, with its help, a connection can be initialized in one of the following ways:

- **Explicitly** A connection object can be explicitly created using the `CreateConnection` function. This object can be reused when calling multiple MongoDB functions, and the connection remains active as long as the object exists, unless the `CloseConnection` function is called or the connection is closed for other external reasons.

- **Implicitly** In addition to passing a pre-created connection, library functions also support passing a connection string as the `Connection` parameter. When using this approach, a connection using the specified connection string will be automatically created within the executing function and closed upon its completion.

When performing multiple sequential queries to the server, it is recommended to use a full connection obtained via the `CreateConnection` function.

## Type Conversion

MongoDB uses a JSON-like document format, but with a much wider range of data types. Some of these types can be automatically converted by the library mechanisms during operations involving value insertion, based on value types within 1C/OneScript. Such types include:

| 1C Type | MongoDB Type (BSON) |
|-|-|
| String | String |
| Number (without fractional part) | Int64 |
| Number (with fractional part) | Double |
| Boolean | Boolean |
| Date | DateTime |
| Array | Array |
| Structure, Map | Document |
| BinaryData | Binary |
| Undefined | Null |

In addition to automatic conversion, the type of a value when passed can also be specified explicitly. To do this, the passed value must be wrapped in a structure where the Key is the type identifier and the Value is the actual data value being passed. The list of supported types and their keys is presented in the table below:

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

Passed values with types `Structure`, `Map`, and `Array` do not require type specification and are always converted to `Document` and `Array` respectively.

A more detailed example with type conversion during data insertion can be found in the description of the `InsertDocuments` function.

## Other Features

For convenience, some additional features were also implemented during the library's development:

- Since structure keys in 1C cannot contain special characters, the frequently used symbol `$` can be specified as `__4`.

```bsl
    // __4 = $
    Example = New Structure("__4gte, __4lte", 100, 150); // $gte: 100, $lte: 150
    Filter    = New Structure("stringField,doubleField", "Text", Example);
```

- Data of type `Binary` when retrieved from MongoDB is returned as structures of the form `{"__B64_BINARY__": <Base64 string value>}`

- Data of types `MaxKey` and `MinKey` when retrieved from MongoDB is returned as strings `<<MaxKey>>` and `<<MinKey>>` respectively

