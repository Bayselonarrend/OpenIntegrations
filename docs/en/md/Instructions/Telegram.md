---
id: Telegram
sidebar_class_name: Telegram
keywords: [1C, 1С, 1С:Enterprise, 1С:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, Telegram]
---

<img src={require('../../static/img/APIs/Telegram.png').default} width='64px' />

# Telegram

This section covers the library for working with the Telegram Bot API in 1C:Enterprise, OneScript, and CLI. This page describes all actions required to get started.

### Getting Started

1. Start a conversation with [@BotFather](https://t.me/BotFather) to create a new bot
2. Select the `/newbot` command
3. Complete the procedure to create a new bot, choose a display name and a username
4. Save the **token** received upon completion

```
1234567890:AAXcxHjoAmgkhgae67fmnghjfmggkTRFkgf
```

You can then use this token to perform actions on behalf of the bot in available chats. The chat for performing actions is identified by its `id` — this can be a Telegram user ID or a channel name that starts with the `@` symbol. In order to perform actions in channels, the bot must be assigned as an administrator for that channel.

### Data Retrieval

After creating the bot, you can receive bot event data in one of two ways:

- By sending requests to the Telegram server (polling). To do this, you need to regularly call the `GetUpdates` method, which will collect information about new events in any chat accessible to the bot.

- By using a Webhook. To do this, you need to create an HTTP service with a public address and SSL certificate, and then pass it to the `SetWebhook` function. Telegram will then automatically send information about new events to the specified address, where those events can be processed.