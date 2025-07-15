---
id: MySQL
sidebar_class_name: MySQL
---

<img src={require('../../static/img/APIs/MySQL.png').default} width='64px' />

# MySQL

This section is dedicated to the MySQL database library. On this page, all the steps necessary to start working are described

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

This library has two parts: basic methods, like connecting and executing SQL queries, and a small ORM for common operations like CREATE, SELECT, INSERT, DELETE, and so on. Working through the ORM and through the query texts executed through the `ExecuteSQLQuery()` function is technically the same: the ORM simply generates the SQL query text based on the layouts, but then also calls them through this function

By default, all SELECT queries return an array of selected data, while other queries return only `true` in the `result` field on success, or `false` and error text in the `result` and `error` fields, respectively. To execute queries that require data to be returned but are not SELECT queries, the `ExecuteSQLQuery()` function has a `ForceResult` parameter

## Query parameters

The MySQL connector supports the use of positional parameters. All values passed both when executing queries directly through the `ExecuteRequestSQL()` function and in ORM methods with value setting, such as `AddRecords` and `UpdateRecords`, must be a structure of the form `{'Data Type': 'Value'}`. The following data types are supported\*:

> \* The MySQL type list lists only a few suitable types

  | Type name (key) | 1C type | Suitable MySQL types |
  |-|-|-|
  | BYTES | String (filepath), BinaryData | TINYBLOB, BLOB, MEDIUMBLOB, LONGBLOB |
  | UINT | Number (integer, unsigned) | TINYINT UNSIGNED, SMALLINT UNSIGNED, MEDIUMINT UNSIGNED, INT UNSIGNED, BIGINT UNSIGNED |
  | INT | Number (integer) | TINYINT, SMALLINT, MEDIUMINT, INT, BIGINT  |
  | FLOAT | Number | FLOAT |
  | DOUBLE | Number | DOUBLE (REAL, DOUBLE PRECISION) |
  | DATE | Date, String (RFC 3339) | DATE, DATETIME, TIMESTAMP |
  | TIME | Дата, String (RFC 3339) | TIME |
  | TEXT | String | CHAR, VARCHAR, TINYTEXT, TEXT, MEDIUMTEXT, LONGTEXT, SET  |

## Retrieving Binary Data

Binary data retrieved from the database will be represented as an object (structure) of the form `{"BYTES": "Base64 string"}` and must be manually converted from Base64

## TLS

The library supports operation in TLS mode. To enable it, you need to configure TLS settings using the `GetTlsSettings` function and pass them as the corresponding parameter to the `CreateConnection` function or one of the ORM functions that support this parameter. If the TLS parameter is not provided when calling these functions, the connection will be initialized in an unsecured mode.

:::tip 
TLS settings can only be applied when the connection is established — either explicitly when using the `CreateConnection` function or implicitly when passing a connection string to ORM methods. Providing TLS settings along with an already established connection (passed via the *Connection* parameter) will be ignored. 
:::

## Compatibility

Technically, the client implementation is a Native component in Rust. It comes in a zip archive format, and, in theory, should work on all available platforms: x86 and x64 Windows and Linux. The actual testing was done on Windows x64 and, cossentially (via OneScript), on Linux x64