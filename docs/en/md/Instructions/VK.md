---
id: VK
sidebar_class_name: VK
keywords: [1C, 1С, 1С:Enterprise, 1С:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, VK]
---

<img src={require('../../static/img/APIs/VK.png').default} width='64px' />

# VKontakte

This section covers the library for working with VK API in 1С:Enterprise, OneScript, and CLI. It is designed for working with communities and performing actions on their behalf. This page describes all the steps required to get started.

### Getting Started

Most functions in this library serve to perform various operations when administering groups and public pages. To start working with them, you need to create an application and obtain a specific set of credentials that will be used in further work:

1. Complete the procedure for creating a new Web application [on the VK ID page](https://id.vk.com/about/business/go)
2. Obtain the ID of the created application
3. Select the required group and obtain its ID in the *Basic Information* section of the management panel
4. Generate a URL for obtaining the application token using the `CreateTokenRetrievalLink` function or manually. The URL has the following structure:

```
https://oauth.vk.com/authorize?client_id= + Application ID from step 2 + &scope=offline,wall,groups,photos,stats,stories,ads&v=5.131&response_type=token&redirect_uri=https://api.vk.com/blank.html
```


5. Navigate to the created link in your browser and log in with your VK account
6. Copy the token from the address bar (the string after `access_token=`)
7. (Optional) Create a group access key on the *API Work* tab if you plan to send messages to users on behalf of the group

After obtaining the necessary data, you can form an authorization structure using the `GetAuthParameters` function. This structure is used when calling any of the library functions as the `Parameters` parameter for authorizing outgoing requests.

```bsl
GroupID = "123456789"; // Group ID from step 3
AppID   = "123456789"; // Application ID from step 2
Token   = "vk1.a...."; // Authorization token from step 6

Parameters = OPI_VK.GetAuthParameters(GroupID, AppID, Token);
```