---
id: Airtable
sidebar_class_name: Airtable
keywords: [1C, 1С, 1С:Enterprise, 1С:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, Airtable]
---

<img src={require('../../static/img/APIs/Airtable.png').default} width='64px' />

# Airtable

This section covers the library for working with the Airtable API in 1C:Enterprise, OneScript, and CLI. This page describes all the steps required to get started.

## Getting Started

1. Log in to Airtable and go to [the personal token creation page](https://airtable.com/create/tokens), then click *Create new token*
2. Enter a name for the new token, select the required **Scopes** (permissions), and **Access** (bases and workspaces that the token will have access to)
3. Copy the new **token**

Next, you must use the obtained token when calling the library functions.