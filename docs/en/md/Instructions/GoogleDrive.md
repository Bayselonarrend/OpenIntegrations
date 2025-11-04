---
id: GoogleDrive
sidebar_class_name: GoogleDrive
---

<img src={require('../../static/img/APIs/GoogleDrive.png').default} width='64px' />

# Google Drive

This section is dedicated to the library for working with API Google Drive. On this page, all the steps necessary to start working are described

:::important
If you're already using the API to interact with other Google Workspace services and have completed the initial setup, you can skip the steps for **Creating a Project** and **Setting Up OAuth**. You just need to enable the Google Drive** service in your existing project and reacquire the token (the last two steps in the instructions). 
:::

## Getting started

<hr/>

### Project creation

1. Go to the [Google Cloud Console](https://console.cloud.google.com) and create a project

![BF](../../static/img/Docs/GoogleCalendar/1.png)

2. Select the created project and in the side menu go to APIs and Services -> OAuth consent screen

![BF](../../static/img/Docs/GoogleCalendar/2.png)

3. Choose External

![BF](../../static/img/Docs/GoogleCalendar/3.png)

4. Fill in the fields: App name, User support email, and Email addresses (all fields with asterisks)

![BF](../../static/img/Docs/GoogleCalendar/4.png)

5. Click on Next and then Save and continue on the last tab

![BF](../../static/img/Docs/GoogleCalendar/5.png)

6. Click on Publish App

![BF](../../static/img/Docs/GoogleCalendar/6.png)

<hr/>

### OAuth settings

1. In the side menu, select Credentials -> Create Credentials -> OAuth client ID

![BF](../../static/img/Docs/GoogleCalendar/7.png)

2. Enter the name and choose Application type - Desktop app

![BF](../../static/img/Docs/GoogleCalendar/8.png)

3. Save ClientID and Client Secret

![BF](../../static/img/Docs/GoogleCalendar/9.png)

<hr/>

### Enable service - Google Drive

1. Go to [page Drive in Marketplace](https://console.cloud.google.com/marketplace/product/google/drive.googleapis.com) 

2. Click Enable

![BF](../../static/img/Docs/GoogleDrive/1.png)

<hr/>

### Token retrieval

1. Pass the ClientID to the function OPI_GoogleWorkspace.FormCodeRetrievalLink() with boolean parameters of the services you use. The function will result in a URL that needs to be opened in the browser. Authorize with your Google account

![BF](../../static/img/Docs/GoogleCalendar/10.png)

2. Copy the code from the URL after authorization

![BF](../../static/img/Docs/GoogleCalendar/11.png)

:::important
**The code life time is extremely short.** After receiving it, you need to perform step 3 as quickly as possible. It is best to prepare a data processor with an input field and a button (in 1C), or use the CLI version of OPI for this step. In case of code lifetime expiry before completing step 3, the error `invalid_grant` will occur
:::

3. Use the obtained code, ClientID, and Client Secret to call the function OPI_GoogleWorkspace.GetTokenByCode(ClientID, ClientSecret, Code)

```json title="Result of the function GetTokenByCode() if converted to JSON"

{
 "token_type": "Bearer",
 "refresh_token": "1//09au6OES3JN9oCgYIARAAGAkSNwF-L9Ir1B7uawfwafT1wE0FKO519Xj6JxawfawfyjMyJ_QlUZYLHZqw",
 "scope": "https://www.googleapis.com/auth/...",
 "expires_in": 3599,
 "access_token": "ya29.a0AfB_byA344tXkIawdawdwadadhyZQV8bSZn_snNXtY2HLb7l71awdawdawdad-ASgpzyOSWIvEmPruhUa_1yCCq6jvoD0r_q-fNEsARrH8zpJ3c6LNGWvwdg8CXsSxYaCgYKAWkSawfwafawfrCK0EP5kZY_A0171"
}

```

4. Use the **access_token** to pass as a Token parameter when calling functions of the library, and the **refresh_token** - to obtain a new access_token (function OPI_GoogleWorkspace.RefreshToken(ClientID, ClientSecret, RefreshToken)), when the old one expires. When refreshing the token, the refresh_token is not updated - you can use the same one to get a new access_token each time.
