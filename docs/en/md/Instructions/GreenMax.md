---
id: GreenMax
sidebar_class_name: GreenMax
keywords: [1C, 1С, 1С:Enterprise, 1С:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, GreenAPI, Max]
---

<img src={require('../../static/img/APIs/GreenMax.png').default} width='64px' />

# Max (GreenAPI)

This section covers the library for working with Max via Green API in 1C:Enterprise, OneScript, and CLI. This page describes all the actions required to get started.

### Getting Started

1. Go to your [Green API Personal Account](https://console.green-api.com/registration) and complete the registration process.
2. Navigate to the [instance list](https://console.green-api.com/instanceList) and create a new instance.
3. Select the new instance and link it to your Max account by phone number.
4. Save the instance credentials. To use the library, you will need `apiUrl`, `mediaUrl`, `idInstance`, and `apiTokenInstance`.

The obtained data must be passed to the `FormAccessParameters` function. The resulting structure will be used for authorization in all other GreenAPI operations.

```bsl
    ApiUrl           = "https://3100.api.green-api.com/v3";
    MediaUrl         = "https://3100.api.green-api.com/v3";
    IdInstance       = "71051...";
    ApiTokenInstance = "425010d90e114aa6b78f0969e...";

    Result = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
```
