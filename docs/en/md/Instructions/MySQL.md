---
id: MySQL
sidebar_class_name: MySQL
keywords: [1C, 1С, 1С:Enterprise, 1С:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, MySQL]
---

<img src={require('../../static/img/APIs/MySQL.png').default} width='64px' />

# MySQL

This section covers the library for working with MySQL databases in 1C:Enterprise, OneScript, and CLI. This page describes all the actions required to get started.

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

This library consists of two parts: basic methods, such as connecting and executing SQL queries, and a small ORM for common operations like CREATE, SELECT, INSERT, DELETE, and so on. Working through the ORM and via query texts executed by the `ExecuteSQLQuery()` function is technically the same: the ORM simply generates the SQL query text based on templates, but then also executes them through this function.

By default, all SELECT queries return an array of selected data, while all other queries return only `true` in the `result` field on success, or `false` and an error text in the `result` and `error` fields respectively. To execute queries that require a return value but are not SELECT queries, there is a `ForceResult` parameter in the `ExecuteSQLQuery()` function.

## Query parameters

The MySQL connector supports the use of positional parameters. All values passed both when executing queries directly through the `ExecuteSQLQuery()` function, and in ORM methods with value setting, such as `AddRecords` and `UpdateRecords`, must be represented as a structure of the form `{'Data Type': 'Value'}`. The following data types are supported*:

> * Only some suitable MySQL types are listed.

  | Type name (structure key) | 1C value type | Suitable MySQL types |
  |-|-|-|
  | BYTES | String (file path), BinaryData | TINYBLOB, BLOB, MEDIUMBLOB, LONGBLOB |
  | UINT | Number (integer, unsigned) | TINYINT UNSIGNED, SMALLINT UNSIGNED, MEDIUMINT UNSIGNED, INT UNSIGNED, BIGINT UNSIGNED |
  | INT | Number (integer) | TINYINT, SMALLINT, MEDIUMINT, INT, BIGINT |
  | FLOAT | Number | FLOAT |
  | DOUBLE | Number | DOUBLE (REAL, DOUBLE PRECISION) |
  | DATE | Date, String (date in RFC 3339 format) | DATE, DATETIME, TIMESTAMP |
  | TIME | Date, String (date in RFC 3339 format) | TIME |
  | TEXT | String | CHAR, VARCHAR, TINYTEXT, TEXT, MEDIUMTEXT, LONGTEXT, SET |

## Retrieving Binary Data

Binary data retrieved from the database will be represented as an object (structure) of the form `{"BYTES": "Base64 string"}` and must be manually converted from Base64.

## TLS

The library supports operation in TLS mode. To enable it, you need to generate TLS settings using the `GetTlsSettings` function and pass them as the corresponding parameter to the `CreateConnection` function or to one of the ORM functions that support this parameter. If the TLS parameter is not provided when these functions are called, the connection will be initialized in unsecured mode.

:::tip
TLS settings can only be set at the moment the connection is created: either explicitly, when using the `CreateConnection` function, or implicitly, when passing a connection string to the ORM methods.

Passing TLS settings together with an already created connection (as the *Connection* parameter) will be ignored.
:::
