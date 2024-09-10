---
id: Ozon
sidebar_class_name: Ozon
---

<img src={require('../../static/img/APIs/Ozon.png').default} width='64px' />

# Ozon

This section is dedicated to the library for working with Ozon Seller API. On this page, all the steps necessary to start working are described

## Getting started

1. Authorize on [Ozon Seller](https://seller.ozon.ru/app/dashboard/main) portal and go to settings

![BF](../../static/img/Docs/Ozon/1.png)

<br/>

2. Go to **API Keys** (left pane) and copy the value from the **Client ID** field

![BF](../../static/img/Docs/Ozon/2.png)

3. Click the **Generate Key** button, select the required permissions and save the generated token

![BF](../../static/img/Docs/Ozon/3.png)

Client ID and generated key are used for authorization in each library method as the first two parameters: **ClientID** and **API Key**.