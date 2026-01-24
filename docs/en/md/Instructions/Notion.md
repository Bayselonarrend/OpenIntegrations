---
id: Notion
sidebar_class_name: Notion
keywords: [1C, 1С, 1С:Enterprise, 1С:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, Notion]
---

<img src={require('../../static/img/APIs/Notion.png').default} width='64px' />

# Notion

This section covers the library for working with the Notion API in 1С:Enterprise, OneScript, and CLI. This page describes all the steps required to get started.

## Getting Started

1. Log in and go to [the integrations section of the developer portal](https://www.notion.so/my-integrations)
2. Enter the name of your integration
3. After completing the integration creation, click *Show* and copy the **Token (Secret)**
4. Go to the *[main Notion interface](https://notion.so)* and create a new page. This page will be the parent for all other objects created via the API
5. Click the three dots in the upper right corner and at the very bottom find the *Add connections* option. Choose your integration from step 3 there
6. Get the page ID. You can do this by clicking *Share -> Copy link* or simply by copying it from the URL

**Token** and **Page ID** are the two parameters required to use the other library functions