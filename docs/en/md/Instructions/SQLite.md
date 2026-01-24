---
id: SQLite
sidebar_class_name: SQLite
keywords: [1C, 1С, 1С:Предприятие, 1С:Предприятие 8.3, API, Интеграция, Сервисы, Обмен, OneScript, CLI, SQLite]
---

<img src={require('../../static/img/APIs/SQLite.png').default} width='64px' />

# SQLite

This section covers the library for working with SQLite databases in 1C:Enterprise, OneScript, and CLI. This page describes all the steps required to get started.

<div class="theme-admonition theme-admonition-info admonition_node_modules-@docusaurus-theme-classic-lib-theme-Admonition-Layout-styles-module alert alert--info">

<img src={require('../../static/img/addin.png').default} class="tipimage" />
<div class="addin">An external component is used to implement some functions in this library<br/>
Please review the ["About external components"](/docs/Start/Component-requirements) section before getting started</div>
</div>

## About implemented methods

This library consists of two parts: basic methods, such as connecting and executing SQL queries, and a small ORM for common operations like CREATE, SELECT, INSERT, DELETE, and so on. Interacting via the ORM and via query texts executed by the `ExecuteSQLQuery()` function is technically no different: the ORM simply generates the SQL query text based on templates, but then also executes them using this function.

By default, all SELECT queries return an array of selected data, while other queries return only `true` in the `result` field on success, or `false` and an error text in the `result` and `error` fields, respectively. For executing queries that require a return value but are not SELECT queries, the `ExecuteSQLQuery()` function provides a `ForceResult` parameter.

## "BLOB" type fields

This library can process fields of type BLOB (Binary Data). To insert a value into a field of this type during INSERT or UPDATE, it can be passed either as a variable of type `BinaryData` (in 1C and OneScript) or as a structure of the form `{"blob": File Path}` (in 1C, OneScript, and CLI versions). Binary data is always returned as `{"blob": Base64 string}`.