---
id: SQLite
sidebar_class_name: SQLite
---

<img src={require('../../static/img/APIs/SQLite.png').default} width='64px' />

# SQLite

import LibraryIntro from '@site/src/components/LibraryIntro';

<LibraryIntro module="OPI_SQLite" cli="sqlite" use="oint/api/sqlite" lang="en"/>

This section covers the library for working with SQLite databases in 1С:Enterprise, OneScript, and CLI. This page describes all the steps required to get started.

<div class="theme-admonition theme-admonition-info admonition_node_modules-@docusaurus-theme-classic-lib-theme-Admonition-Layout-styles-module alert alert--info">

<img src={require('../../static/img/addin.png').default} class="tipimage" />
<div class="addin">An external component is used to implement some functions in this library<br/>
Please review the ["About external components"](/docs/Start/Component-requirements) section before getting started</div>
</div>

## About implemented methods

This library has two parts: basic methods, like connecting and executing SQL queries, and a small ORM for common operations like CREATE, SELECT, INSERT, DELETE, and so on. Working through the ORM and through the query texts executed through the `ExecuteSQLQuery` function is technically the same: the ORM simply generates the SQL query text based on the layouts, but then also calls them through this function

By default, all SELECT queries return an array of selected data, while other queries return only `true` in the `result` field on success, or `false` and error text in the `result` and `error` fields, respectively. To execute queries that require data to be returned but are not SELECT queries, the `ExecuteSQLQuery` function has a `ForceResult` parameter

## "BLOB" type fields

This library can process fields of type BLOB (Binary Data). To write a value, pass `BinaryData` or a `{"blob": ...}` structure with a file path, URL, or binary data. On read, values are returned as `BinaryData`. In the CLI, binary values in JSON output are encoded as Base64 strings.
