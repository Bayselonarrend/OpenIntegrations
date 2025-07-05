---
id: Bitrix24
sidebar_class_name: Bitrix24
---

<img src={require('../../static/img/APIs/Bitrix24.png').default} width='64px' />

# Bitrix24

This section is dedicated to the library for working with Bitrix24 API. On this page, all the steps necessary to start working are described

## Getting started

There are two ways to work with Bitrix24 via API: via **Webhook** and via **local application**. For both options you need:

1. Go to **Developers** in the **Applications** section of the sidebar

![BF](../../static/img/Docs/Bitrix24/1.png)

2. Select **Other**

![BF](../../static/img/Docs/Bitrix24/2.png)

<hr/><br/>

### To work via Webhook

1. Select **Incoming Webhook**
	
![BF](../../static/img/Docs/Bitrix24/3.png)

2. Fill in the necessary permissions in **Permissions Settings** and save the URL of the webhook. This will be used to execute library methods as the **URL** parameter. The optional **Token** parameter will always remain empty in this case

![BF](../../static/img/Docs/Bitrix24/4.png)

<hr/><br/>

## To work via Local Application

1. Select **Local Application**
	
![BF](../../static/img/Docs/Bitrix24/5.png)

2. Select the path of the handler (if the application does not imply authorization of other users, but only Bitrix management through one administrator account, you can choose any address, for example https://localhost), tick **Use only API** (if you need only the functionality of calling library methods) and fill in the necessary permissions

![BF](../../static/img/Docs/Bitrix24/6.png)

3. Save the **application key** and **application code**

![BF](../../static/img/Docs/Bitrix24/7.png)

4. Using the application key, call the **GetAppAuthLink** function and follow the received link in the browser. After authorization, copy the received code from the address bar (or get it to the handler whose address was specified in point 2)

![BF](../../static/img/Docs/Bitrix24/8.png)

5. Pass the received code, along with the application key and secret, to the **GetToken** function. Save the received **access** and **refresh tokens**

6. Tokens have a limited lifetime. To get a new token, you can use the **UpdateToken** function, passing here the refresh token, key and application secret. The refresh creates not only a new access token, but also a refresh token as well




