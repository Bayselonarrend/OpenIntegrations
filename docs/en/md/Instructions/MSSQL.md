---
id: MSSQL
sidebar_class_name: MSSQL
keywords: [1C, 1С, 1С:Enterprise, 1С:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, MSSQL, Microsoft SQL Server]
---

<img src={require('../../static/img/APIs/MSSQL.png').default} width='64px' />

# MS SQL Server

This section covers the library for working with MSSQL databases in 1C:Enterprise, OneScript, and CLI. This page describes all the actions required to get started.

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

This library consists of two parts: basic methods, such as connecting and executing SQL queries, and a lightweight ORM for frequently used operations like CREATE, SELECT, INSERT, DELETE, etc. Working via the ORM and through query texts executed by the `ExecuteSQLQuery()` function is technically no different: the ORM simply generates the SQL query text based on templates and then executes them through this function.

By default, all SELECT queries return an array of selected data, while all other queries return only `true` in the `result` field on success, or `false` and an error text in the `result` and `error` fields respectively. For executing queries that require a return value but are not SELECT queries, the `ExecuteSQLQuery()` function provides a `ForceResult` parameter.

## Query parameters

The MSSQL connector supports the use of positional parameters. All values passed, both when executing queries directly through the `ExecuteSQLQuery()` function and in ORM methods with value assignment such as `AddRecords` and `UpdateRecords`, must be represented as a structure of the form `{'Data Type': 'Value'}`. The following data types are supported\*:

> \* Only some suitable types are listed in the MSSQL type list

  | Type name (structure key) | 1C Value Type | Suitable for MSSQL types |
  |-|-|-|
  | TINYINT | Number  | tinyint |
  | SMALLINT | Number  | smallint |
  | INT | Number  | int |
  | BIGINT | Number  | bigint |
  | FLOAT24 | Number  | float(24), real |
  | FLOAT53 | Number  | float(53) |
  | NUMERIC | Number  | decimal, numeric |
  | DECIMAL | Number  | decimal, numeric |
  | BIT | Boolean | bit |
  | NVARCHAR | String | nvarchar, varchar, nchar, char, ntext, text |
  | UUID | String, UUID | uniqueidentifier |
  | XML | String | xml |
  | DATE | Date, String | date |
  | TIME | Date, String | time |
  | DATETIME | Date, String | datetime, datetime2 |
  | DATETIMEOFFSET | Date, String | datetimeoffset |
  | BYTES | BinaryData | varbinary |

## Retrieving Binary Data

Binary data retrieved from the database will be presented as an object (structure) in the format `{"BYTES": "Base64 string"}` and needs to be manually decoded from Base64.

## TLS

The library supports operation in TLS mode. To enable it, you should generate TLS settings using the `GetTlsSettings` function and pass them as the corresponding parameter to the `CreateConnection` function or one of the ORM functions that support this parameter. If the TLS parameter is not specified when calling these functions, the connection is initialized in unsecured mode.

:::tip
TLS settings can only be applied when the connection is established: explicitly, when using the `CreateConnection` function, or implicitly, when passing a connection string to ORM methods.

Passing TLS settings together with an already established connection in the *Connection* parameter will be ignored.
:::