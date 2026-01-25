---
id: Dropbox
sidebar_class_name: Dropbox
keywords: [1C, 1С, 1С:Enterprise, 1С:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, Dropbox]
---

<img src={require('../../static/img/APIs/Dropbox.png').default} width='64px' />

# Dropbox

This section covers the library for working with Dropbox API in 1С:Enterprise, OneScript, and CLI. This page describes all the steps required to get started.

## Getting Started

1. Log into your account on the [Dropbox Developers](https://www.dropbox.com/developers) website
2. Navigate to the *App Console*
3. Click *Create app*
4. Enter a name for the new application and select *Full Dropbox*
5. After creation, on the application page click *Scoped app* and select the permissions required for your tasks. Save the **AppKey** and **AppSecret**
6. Obtain an authorization link using the `GetAuthorizationLink` function and navigate to it in your browser
7. Pass the obtained code, AppKey, and AppSecret to the `GetToken` function
8. Save the obtained **access_token** and **refresh_token**

The access_token has a limited lifetime. Upon expiration, it can be refreshed using the `RefreshToken` function