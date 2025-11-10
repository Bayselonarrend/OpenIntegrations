---
id: Neocities
sidebar_class_name: Neocities
keywords: [1C, 1С, 1С:Enterprise, 1С:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, Neocities]
---

<img src={require('../../static/img/APIs/Neocities.png').default} width='64px' />

# Neocities

This section covers the library for working with Neocities API in 1С:Enterprise, OneScript, and CLI. This page describes all the steps required to get started.

## Getting Started

1. Log in to the [Neocities](https://neocities.org) portal and go to settings
2. Select the required site from the list and click **Manage Site Settings**
3. Navigate to the **API** tab, generate and save the **API KEY**

The API Key is used in every API method as the Token parameter. You can also generate a token based on your login and password using the `GetToken` function