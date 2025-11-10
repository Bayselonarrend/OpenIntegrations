---
id: CDEK
sidebar_class_name: CDEK
keywords: [1C, 1С, 1С:Enterprise, 1С:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, CDEK]
---

<img src={require('../../static/img/APIs/CDEK.png').default} width='64px' />

# CDEK

This section covers the library for working with CDEK API in 1С:Enterprise, OneScript, and CLI. This page describes all the steps required to get started.

## Getting Started

1. Sign an agreement with CDEK or use test credentials to get started. Learn more [on the documentation page](https://api-docs.cdek.ru/29923849.html)
2. Use the obtained **Account** and **Secure password** to create a Token using the `GetToken` method

**Token** has a limited lifetime during which it can be used in calls to other library methods. After its expiration, you can obtain a new one by again passing the Account and Secure password to the `GetToken` method.