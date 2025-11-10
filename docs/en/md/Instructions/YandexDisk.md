---
id: YandexDisk
sidebar_class_name: YandexDisk
keywords: [1C, 1С, 1С:Enterprise, 1С:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, YandexDisk, Yandex.Disk, Yandex Disk]
---

<img src={require('../../static/img/APIs/YandexDisk.png').default} width='64px' />

# Yandex Disk

This section covers the library for working with Yandex Disk API in 1С:Enterprise, OneScript, and CLI. This page describes all the steps required to get started.

## Getting Started

To get started, you need to obtain an access token for the disk:

1. Go to the [application creation page](https://oauth.yandex.ru/client/new/)
2. Enter the service name, select *Web Services* as the platform. You can specify any Redirect URI or choose *Insert URL for debugging* - it won't be needed for working with the library.
3. In the *Data Access* field, add permissions as shown in the screenshot below, then click *Create Application*
4. Save the **ClientID** and **Client secret** from the application page
5. Call the `GetConfirmationCode` function, passing ClientID as a parameter. The function will return a Yandex server response containing the following fields:

	- **user_code** - will need to be entered in the browser
	- **device_code** - will need to be passed to another function
	- **verification_url** - URL that needs to be opened in the browser

```json title="Result of the GetConfirmationCode function in JSON format"
{
 "verification_url": "https://ya.ru/device",
 "user_code": "gjehyruw",
 "interval": 5,
 "expires_in": 300,
 "device_code": "12207cafec1b40ad8d0052af3faf0d12"
}
```

6. Open the URL from **verification_url** in your browser. Enter the **user_code** from step 5 in the field that appears

7. After entering the code in step 6, call the `ConvertCodeToToken` function, passing the *ClientID* and *ClientSecret* from step 4, as well as the *device_code* from step 5. Save the obtained **access_token** and **refresh_token**

```json title="Result of the ConvertCodeToToken function in JSON format"
{
 "token_type": "bearer",
 "refresh_token": "1:Tj6nD2vgE2L8jwSm:YgWjQXPv6_y3e07GW70ig2AOyEXoRVsKKpApGHq2EOg7pfx0MKrXiCrfLBFtzgQawdawdwadad3Sasa9z2H0vSeZKNmZmA",
 "expires_in": 31535956,
 "access_token": "y0_AgAAAABWxxdkAAs0QgAAAAD59cawdawdwadadVKIiwGK__crw"
}
```

**access_token** is used for authorization in all other library functions. **refresh_token** must be passed to the `RefreshToken` function to obtain a new access_token when the previous one's lifetime is about to expire.