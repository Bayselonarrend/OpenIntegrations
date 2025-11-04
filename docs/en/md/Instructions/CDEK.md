---
id: CDEK
sidebar_class_name: CDEK
---

<img src={require('../../static/img/APIs/CDEK.png').default} width='64px' />

# CDEK

This section is dedicated to the library for working with CDEK API. On this page, all the steps necessary to start working are described

## Getting started

1. Contract with CDEK or use test credentials to get started. Learn more [on the documentation page](https://api-docs.cdek.ru/29923849.html)

![BF](../../static/img/Docs/CDEK/1.png)

2. Use the obtained **Account** and **Secure password** to create a Token using the *GetToken()* method


A **Token** has a limited lifetime, during which it can be used in calls to other library methods. After it expires, you can get a new one by passing the Account and Secure password to the *GetToken()* method again.