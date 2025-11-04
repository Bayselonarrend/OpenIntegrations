---
id: GreenMax
sidebar_class_name: GreenMax
---

<img src={require('../../static/img/APIs/GreenMax.png').default} width='64px' />

# Max (GreenAPI)

This section is dedicated to the library for working with Max via Green API. On this page, all the steps necessary to start working are described

## Getting started

1. Go to [Green API console](https://console.green-api.com/registration) and complete the registration procedure

![BF](../../static/img/Docs/GreenMax/1.png)

2. Go to [instances list](https://console.green-api.com/instanceList) and create a new one

![BF](../../static/img/Docs/GreenMax/2.png)

3. Select a new instance and link it to your Max account by phone number

![BF](../../static/img/Docs/GreenMax/3.png)

4. Save the instance credentials. The `apiUrl`, `mediaUrl`, `idInstance` and `apiTokenInstance` are required to work with the library

![BF](../../static/img/Docs/GreenMax/4.png)

The received data should be passed to the `FormAccessParameters` function. The resulting structure will be used for authorization in all other functions of work with GreenAPI

```bsl
    ApiUrl           = "https://3100.api.green-api.com/v3";
    MediaUrl         = "https://3100.api.green-api.com/v3";
    IdInstance       = "71051...";
    ApiTokenInstance = "425010d90e114aa6b78f0969e...";

    Result = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
```