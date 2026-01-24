---
id: Slack
sidebar_class_name: Slack
keywords: [1C, 1С, 1С:Enterprise, 1С:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, Slack]
---

<img src={require('../../static/img/APIs/Slack.png').default} width='64px' />

# Slack

This section covers the library for working with the Slack Web API in 1C:Enterprise, OneScript, and CLI. This page describes all the actions required to get started.

### Getting Started

1. Log in to your account and go to the **Your Apps** page on the [Slack API](https://api.slack.com) website.
2. Click **Create App** and select **From scratch**.
3. Choose a name and the workspace where you need to create the application.
4. Create a new token by clicking **Generate Token and Scopes** further down on the application page.
5. Go to the **Permission scopes** section from the app installation menu.
6. Add the permissions required for your purposes.
7. Install the application by clicking the **Install to Workspace** button.
8. Save the generated token.

```
xoxb-1234567890123-4567890123456-QWERTYUIOPASDFGHJKLZXCVB
```

This token will then be used for authorization when performing actions on behalf of the created application.