---
id: GoogleSheets
sidebar_class_name: GoogleSheets
keywords: [1C, 1С, 1С:Enterprise, 1С:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, Google Sheets]
---

<img src={require('../../static/img/APIs/GoogleSheets.png').default} width='64px' />

# Google Sheets

### Getting Started

To get started, you need to create an account and a new project on the [Google Cloud Console main page](https://console.cloud.google.com/), then enable the Sheets service on [its Marketplace page](https://console.cloud.google.com/marketplace/product/google/sheets.googleapis.com).

Next, you need to obtain an access token for authorization when calling library functions. This can be done in one of two ways:

### Authorization via Service Account

You can obtain an access token using a Service Account secret key. To do this:

1. Select your project and navigate to *IAM & Admin -> Service Accounts* in the sidebar
2. Click *Create service account* and fill in the required fields to create a new account
3. Find the created account in the list and click *Actions* (three dots) on the right side of the entry
4. Select *Manage keys*
5. Click *Add key -> Create new key*
6. Choose *JSON* and download the obtained key data

The obtained JSON file must then be passed (as a collection, file path, or binary data) to the `GetServiceAccountToken` function. You can also specify scopes and token lifetime when calling this function. After the token expires, a new one can be obtained by calling the `GetServiceAccountToken` function again.

### OAuth Authorization

OAuth authorization allows obtaining a temporary, refreshable access token for a specific Google user through an authorization page. To enable OAuth authorization in your project, follow these steps:

1. Select your project and navigate to *APIs and Services -> OAuth consent screen* in the sidebar
2. Choose *External*
3. Fill in the required information in the provided fields
4. Click *Save and continue* after completing the setup process
5. Click *Publish App*
6. In the sidebar, select *Credentials -> Create Credentials -> OAuth client ID*
7. Enter a name and select *Application type - Desktop app*
8. Save the **ClientID** and **Client Secret**

After obtaining the client ID, you need to get the authorization URL. This can be done by passing the ClientID to the `FormCodeRetrievalLink` function. Open the resulting link in a browser, log in with your Google account, then quickly pass the access code from the URL (the text in the address bar after `code=`) to the `GetTokenByCode` function.

:::important
**The code has a very short lifetime.** After navigating to the link from the `FormCodeRetrievalLink` function and logging in with your Google account, you must pass it to the `GetTokenByCode` function as quickly as possible. It's best to prepare a processing form with an input field and button (in 1C) in advance, or use the OIPI CLI version. If the code expires before executing the `GetTokenByCode` function, you will receive an `invalid_grant` error.
:::

The function will return a structure containing `access_token` and `refresh_token`: the first is used when calling other library functions, and the second is for obtaining a new `access_token` when it expires (using the `RefreshToken` function).

The `refresh_token` does not change when obtaining a new `access_token` and can be used multiple times.

```json title="Result of the GetTokenByCode function in JSON format"

{
 "token_type": "Bearer",
 "refresh_token": "1//09au6OES3JN9oCgYIARAAGAkSNwF-L9Ir1B7uawfwafT1wE0FKO519Xj6JxawfawfyjMyJ_QlUZYLHZqw",
 "scope": "https://www.googleapis.com/auth/sheets",
 "expires_in": 3599,
 "access_token": "ya29.a0AfB_byA344tXkIawdawdwadadhyZQV8bSZn_snNXtY2HLb7l71awdawdawdad-ASgpzyOSWIvEmPruhUa_1yCCq6jvoD0r_q-fNEsARrH8zpJ3c6LNGWvwdg8CXsSxYaCgYKAWkSawfwafawfrCK0EP5kZY_A0171"
}
