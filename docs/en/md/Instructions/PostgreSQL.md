---
id: PostgreSQL
sidebar_class_name: PostgreSQL
---

<img src={require('../../static/img/APIs/PostgreSQL.png').default} width='64px' />

# PostgreSQL

This section covers the library for working with PostgreSQL databases in 1С:Enterprise, OneScript, and CLI. This page describes all the steps required to get started.

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

This library has two parts: basic methods, like connecting and executing SQL queries, and a small ORM for common operations like CREATE, SELECT, INSERT, DELETE, and so on. Working through the ORM and through the query texts executed through the `ExecuteSQLQuery` function is technically the same: the ORM simply generates the SQL query text based on the layouts, but then also calls them through this function

By default, all SELECT queries return an array of selected data, while other queries return only `true` in the `result` field on success, or `false` and error text in the `result` and `error` fields, respectively. To execute queries that require data to be returned but are not SELECT queries, the `ExecuteSQLQuery` function has a `ForceResult` parameter

## Query parameters

The PostgreSQL connector supports the use of positional parameters. All values passed both when executing queries directly through the `ExecuteRequestSQL()` function and in ORM methods with value setting, such as `AddRecords` and `UpdateRecords`, must be a structure of the form `{'Data Type': 'Value'}`. The following data types are supported:

:::tip
🟢 - Implemented, tested; 🟡 - Implemented, not tested
:::

  | Type | Support | Synonym | Native types|
  |-|-|-|-|
  | BOOL | 🟢 | - | Bool |
  | "char" | 🟢 | OLDCHAR | Number |
  | SMALLINT | 🟢 | - | Number |
  | SMALLSERIAL | 🟢 | - | Number |
  | INT | 🟢 | - | Number |
  | SERIAL | 🟢 | - | Number |
  | BIGINT | 🟢 | - | Number |
  | BIGSERIAL | 🟢 | - | Number |
  | OID | 🟢 | - | Number |
  | REAL | 🟢 | - | Number |
  | DOUBLE PRECISION | 🟢 | DOUBLE_PRECISION | Number |
  | NUMERIC | 🟢 | DECIMAL | Number, String |
  | VARCHAR | 🟢 | - | String |
  | TEXT | 🟢 | - | String |
  | CHAR | 🟢 | - | String |
  | CITEXT | 🟢 | - | String |
  | NAME | 🟢 | - | String |
  | INET | 🟢 | - | String |
  | UUID | 🟢 | - | String, УникальныйИдентификатор |
  | TIMESTAMP | 🟢 | - | Date, String (ISO 8601, RFC 3339) |
  | TIMESTAMP WITH TIME ZONE | 🟢 | TIMESTAMP_WITH_TIME_ZONE | Date (the time zone will be specified as UTC), String (RFC 3339) |
  | DATE | 🟢 | - | Date (any time part), String (ISO 8601, RFC 3339) |
  | TIME | 🟢 | - | Date (any date part), String (ISO 8601, RFC 3339) |
  | BYTEA | 🟢 | - | BinaryData, File path, Base64 String (all converted to a Base64 string) |
  | JSON | 🟢 | - | Array, Structure, Map, String (JSON) |
  | JSONB | 🟢 | - | Array, Structure, Map, String (JSON) |
  | LTREE | 🟡 | - | String |
  | LQUERY | 🟡 | - | String |
  | LTXTQUERY | 🟡 | - | String |
  | HSTORE | 🟡 | - | Structure, Map |

A similar list of types is also available to retrieve as query results from PostgreSQL

## Retrieving Binary Data

Binary data retrieved from the database will be represented as an object (structure) of the form `{"BYTES": "Base64 string"}` and must be manually converted from Base64

## TLS

The library supports operation in TLS mode. To enable it, you need to configure TLS settings using the `GetTlsSettings` function and pass them as the corresponding parameter to the `CreateConnection` function or one of the ORM functions that support this parameter. If the TLS parameter is not provided when calling these functions, the connection will be initialized in an unsecured mode.

:::tip 
TLS settings can only be applied when the connection is established — either explicitly when using the `CreateConnection` function or implicitly when passing a connection string to ORM methods. Providing TLS settings along with an already established connection (passed via the *Connection* parameter) will be ignored. 
:::

## Compatibility
