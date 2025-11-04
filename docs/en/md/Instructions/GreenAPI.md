---
id: GreenAPI
sidebar_class_name: GreenAPI
---

<img src={require('../../static/img/APIs/GreenAPI.png').default} width='64px' />

# WhatsApp (GreenAPI)

This section is dedicated to the library for working with WhatsApp via Green API. On this page, all the steps necessary to start working are described

## Getting started

1. Go to [Green API console](https://console.green-api.com/registration) and complete the registration procedure

![BF](../../static/img/Docs/GreenAPI/1.png)

2. Go to [instances list](https://console.green-api.com/instanceList) and create a new one

![BF](../../static/img/Docs/GreenAPI/2.png)

3. Select a new instance and link it to your WhatsApp account by QR code or phone number

![BF](../../static/img/Docs/GreenAPI/3.png)

4. Save the instance credentials. The `apiUrl`, `mediaUrl`, `idInstance` and `apiTokenInstance` are required to work with the library

![BF](../../static/img/Docs/GreenAPI/4.png)

The received data should be passed to the `FormAccessParameters` function. The resulting structure will be used for authorization in all other functions of work with GreenAPI

```bsl
    ApiUrl           = "https://7105.api.greenapi.com";
    MediaUrl         = "https://7105.media.greenapi.com";
    IdInstance       = "71051...";
    ApiTokenInstance = "425010d90e114aa6b78f0969e...";

    Result = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
```