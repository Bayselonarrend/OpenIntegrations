---
id: Bitrix24
sidebar_class_name: Bitrix24
keywords: [1C, 1С, 1С:Enterprise, 1С:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, Bitrix24]
---

<img src={require('../../static/img/APIs/Bitrix24.png').default} width='64px' />

# Bitrix24

This section covers the library for working with the Bitrix24 API in 1C:Enterprise, OneScript, and CLI. This page describes all the steps required to get started.

### Getting Started

To start working with Bitrix24 via the API, you need to obtain authorization data. This can be done in one of two ways: by creating a **Webhook** or by creating a **local application**. Both methods are described below.

### Working via Webhook

1. Go to the *For Developers* subsection in the *Applications* section of the sidebar
2. Select the *Other* option
3. Choose *Incoming Webhook*
4. Fill in the required permissions in *Rights Settings* and save the webhook URL. It will be used as the **URL** parameter when calling library methods. The optional **Token** parameter in this case should always remain empty.

### Working via Local Application

1. Go to the *For Developers* subsection in the *Applications* section of the Bitrix24 sidebar
2. Select the *Other* option
3. Choose *Local Application*
4. Select the handler URL. If the application does not require authorization for other users and is only intended for managing Bitrix through a single administrator account, you can use any address, for example, https://localhost.
5. Check the **Uses only API** box (if only the library method calling functionality is required) and configure the necessary permissions
6. Save the application **key** and **secret**
7. Pass the application key to the `GetAppAuthLink` function and open the resulting link in your browser
8. Authorize and copy the received code from the address bar, or obtain it via the handler specified in step 4
9. Pass the obtained code, along with the application key and secret, to the `GetToken` function
10. Save the obtained **access** and **refresh tokens**

:::important
Token lifetime is limited. To obtain a new token, you can use the **RefreshToken** function by passing the refresh token, key, and application secret. When refreshing, both a new access token and refresh token are generated – the new refresh token must also be saved.
:::