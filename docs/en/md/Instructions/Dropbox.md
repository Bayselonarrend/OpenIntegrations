---
id: Dropbox
sidebar_class_name: Dropbox
---

<img src={require('../../static/img/APIs/Dropbox.png').default} width='64px' />

# Dropbox

This section is dedicated to the library for working with Dropbox API. On this page, all the steps necessary to start working are described

## Getting started

1. Login to [Dropbox Developers](https://www.dropbox.com/developers)

![BF](../../static/img/Docs/Dropbox/1.png)

1. Go to **App Console**

![BF](../../static/img/Docs/Dropbox/2.png)

2. Click on **Create app**

![BF](../../static/img/Docs/Dropbox/3.png)

4. Enter a name for the new application and select **Full Dropbox**

![BF](../../static/img/Docs/Dropbox/4.png)

5. After creation, on the application page, click **Scoped app** and select the permissions that are necessary to solve your problems. Save **AppKey** and **AppSecret**

![BF](../../static/img/Docs/Dropbox/5.png)

6. Get the authorization link using the *GetAuthorizationLink()* function and pass it in the browser

![BF](../../static/img/Docs/Dropbox/6.png)

7. Pass the **received code**, **AppKey** and **AppSecret** to the function *GetToken()*, save the received **access_token** and **refresh_token**

8. After the access_token lifetime expires, it can be updated using the function *RefreshToken()*
