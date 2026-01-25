---
id: Telegram
sidebar_class_name: Telegram
keywords: [1C, 1С, 1С:Enterprise, 1С:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, Telegram]
---

<img src={require('../../static/img/APIs/Telegram.png').default} width='64px' />

# Telegram

This section covers the library for working with Telegram Bot API in 1С:Enterprise, OneScript, and CLI. This page describes all the steps required to get started.

### Getting Started

1. Start a conversation with [@BotFather](https://t.me/BotFather) to create a new bot
2. Select the `/newbot` command
3. Complete the new bot creation procedure, choose a display name and username
4. Save the **token** received upon completion of creation

```
1234567890:AAXcxHjoAmgkhgae67fmnghjfmggkTRFkgf
```

You can then use this token to perform actions on behalf of the bot in available chats. The chat for performing actions is determined by its `id` - this can be a Telegram user ID or a channel name starting with the `@` symbol. To perform actions in channels, the bot must be appointed as its administrator.

### Data Retrieval

After creating the bot, you can retrieve bot event data in one of two ways:

- By sending requests to the Telegram server (polling). For this, you need to regularly call the `GetUpdates` method, which allows collecting information about new events in any chat that the bot has access to.

- Using Webhook. For this, you need to create an HTTP service with a public address and SSL certificate, then pass it to the `SetWebhook` function. Telegram will automatically send data about new events to the specified address, where these events can be processed.