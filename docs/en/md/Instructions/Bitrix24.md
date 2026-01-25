---
id: Bitrix24
sidebar_class_name: Bitrix24
keywords: [1C, 1С, 1С:Enterprise, 1С:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, Bitrix24]
---

<img src={require('../../static/img/APIs/Bitrix24.png').default} width='64px' />

# Bitrix24

This section covers the library for working with Bitrix24 API in 1С:Enterprise, OneScript, and CLI. This page describes all the steps required to get started.

### Getting Started

To start working with Bitrix24 via API, you need to obtain authorization data. This can be done in one of two ways: by creating a **Webhook** or by creating a **local application**. Both methods are described below.

### Working via Webhook

1. Go to the *For Developers* subsection in the *Applications* section of the sidebar
2. Select the *Other* option
3. Choose *Incoming Webhook*
4. Configure the required permissions in *Rights Settings* and save the webhook URL. It will be used as the **URL** parameter when executing library methods. The optional **Token** parameter will remain empty in this case.

### Working via Local Application

1. Go to the *For Developers* subsection in the *Applications* section of the Bitrix24 sidebar
2. Select the *Other* option
3. Choose *Local Application*
4. Select the handler URL. If the application does not involve authorization of other users but only manages Bitrix through a single administrator account, you can use any address, such as https://localhost.
5. Check the **Uses only API** box (if only the library method calling functionality is needed) and configure the required permissions
6. Save the application **key** and **secret**
7. Pass the application key to the `GetAppAuthLink` function and navigate to the obtained link in your browser
8. Log in and copy the received code from the address bar or obtain it from the handler whose address was specified in step 4
9. Pass the obtained code, along with the application key and secret, to the `GetToken` function
10. Save the obtained **access** and **refresh tokens**

:::important
Token lifetime is limited. To obtain a new token, you can use the **RefreshToken** function by passing the refresh token, key, and application secret. When refreshing, not only a new access token but also a new refresh token is created - it must be saved again.
:::