---
id: PostgreSQL
sidebar_class_name: PostgreSQL
---

<img src={require('../../static/img/APIs/PostgreSQL.png').default} width='64px' />

# PostgreSQL

This section is dedicated to the PostgreSQL database library. On this page, all the steps necessary to start working are described

## About implemented methods

This library has two parts: basic methods, like connecting and executing SQL queries, and a small ORM for common operations like CREATE, SELECT, INSERT, DELETE, and so on. Working through the ORM and through the query texts executed through the `ExecuteSQLQuery()` function is technically the same: the ORM simply generates the SQL query text based on the layouts, but then also calls them through this function

By default, all SELECT queries return an array of selected data, while other queries return only `true` in the `result` field on success, or `false` and error text in the `result` and `error` fields, respectively. To execute queries that require data to be returned but are not SELECT queries, the `ExecuteSQLQuery()` function has a `ForceResult` parameter

## Query parameters

The PostgreSQL connector supports the use of positional parameters. All values passed both when executing queries directly through the `ExecuteRequestSQL()` function and in ORM methods with value setting, such as `AddRecords` and `UpdateRecords`, must be a structure of the form `{'Data Type': 'Value'}`. The following data types are supported:

:::TIP
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

## Compatibility

Technically, the client implementation is a Native component in Rust. It comes in a zip archive format, and, in theory, should work on all available platforms: x86 and x64 Windows and Linux. The actual testing was done on Windows x64 and, cossentially (via OneScript), on Linux x64