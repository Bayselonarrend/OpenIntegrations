---
id: GreenAPI
sidebar_class_name: GreenAPI
keywords: [1C, 1С, 1С:Enterprise, 1С:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, GreenAPI]
---

<img src={require('../../static/img/APIs/GreenAPI.png').default} width='64px' />

# WhatsApp (GreenAPI)

This section covers the library for working with WhatsApp via Green API in 1С:Enterprise, OneScript, and CLI. This page describes all the steps required to get started.

### Getting Started

1. Go to the [Green API Personal Account](https://console.green-api.com/registration) and complete the registration process
2. Navigate to the [instance list](https://console.green-api.com/instanceList) and create a new instance
3. Select the new instance and link it to your WhatsApp account via QR code or phone number
4. Save the instance credentials. To work with the library, you need `apiUrl`, `mediaUrl`, `idInstance`, and `apiTokenInstance`

The obtained data must be passed to the `FormAccessParameters` function. The resulting structure will be used for authorization in all other GreenAPI functions.

```bsl
    ApiUrl           = "https://7105.api.greenapi.com";
    MediaUrl         = "https://7105.media.greenapi.com";
    IdInstance       = "71051...";
    ApiTokenInstance = "425010d90e114aa6b78f0969e...";

    Result = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
```