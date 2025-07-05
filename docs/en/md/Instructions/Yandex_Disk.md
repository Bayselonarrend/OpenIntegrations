---
id: YandexDisk
sidebar_class_name: YandexDisk
---

<img src={require('../../static/img/APIs/YandexDisk.png').default} width='64px' />

# Yandex Disk

This section is dedicated to the library for working with Yandex Disk API. On this page, all the steps necessary to start working are described

## Getting started

To start working, you need to obtain an access token for the disk:

1. Go to [app creation page](https://oauth.yandex.ru/client/new/) 

![BF](../../static/img/Docs/YandexDisk/1.png)

2. Enter the service name, select *Web services* as the platform. You can specify any *Redirect URI* or select the Insert debugging URL option - it will not be needed for working with the library.

![BF](../../static/img/Docs/YandexDisk/3.png)

3. In the **Data Access** field, add permissions as shown in the screenshot below, then click **Create Application**

![BF](../../static/img/Docs/YandexDisk/2.png)

4. Save **ClientID** and **ClientSecret** from the application page

![BF](../../static/img/Docs/YandexDisk/4.png)

5. Call the function *OPI_YandexID.GetConfirmationCode()*, passing ClientID as a parameter. It will return a response from the Yandex server, which will contain the fields:
		- **user_code** - you will need to enter in the browser
		- **device_code** - you will need to pass to another function
		- **verification_url** - the URL that needs to be opened in the browser
<br/>
		```json title="The result of the function GetConfirmationCode(), if convert it to JSON"
			{
			 "verification_url": "https://ya.ru/device",
			 "user_code": "gjehyruw",
			 "interval": 5,
			 "expires_in": 300,
			 "device_code": "12207cafec1b40ad8d0052af3faf0d12"
			}
		```

6. Open the URL from **verification_url** in the browser. Most likely, it will be https://ya.ru/device. In the field that appears, enter the **user_code** from step 5

![BF](../../static/img/Docs/YandexDisk/5.png)

7. After entering the code in step 6, call the function *OPI_YandexID.ConvertCodeToToken()*, passing **ClientID** and **ClientSecret** from step 4, as well as **device_code** from step 5. Save the obtained **access_token** and **refresh_token**

```json title="The result of the function ConvertCodeToToken(), if convert it to JSON"
{
 "token_type": "bearer",
 "refresh_token": "1:Tj6nD2vgE2L8jwSm:YgWjQXPv6_y3e07GW70ig2AOyEXoRVsKKpApGHq2EOg7pfx0MKrXiCrfLBFtzgQawdawdwadad3Sasa9z2H0vSeZKNmZmA",
 "expires_in": 31535956,
 "access_token": "y0_AgAAAABWxxdkAAs0QgAAAAD59cawdawdwadadVKIiwGK__crw"
}
```

**access_token** is used in all other functions of the library, and with the help of **refresh_token**, it can be refreshed when its lifespan is nearing the end (using the function *RefreshToken()*)
