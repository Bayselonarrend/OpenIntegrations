---
id: Viber
sidebar_class_name: Viber
keywords: [1C, 1С, 1С:Enterprise, 1С:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, Viber]
---

<img src={require('../../static/img/APIs/Viber.png').default} width='64px' />

# Viber

This section covers the library for working with the Viber API in 1С:Enterprise, OneScript, and CLI. This page describes all the steps required to get started.

:::warning
As of 02/05/2024, this method for creating bots is no longer valid: Rakuten has discontinued the ability to create bots for free, and now using the API requires verification within a commercial model. Learn more [here](https://help.viber.com/hc/en-us/articles/15247629658525-Bot-commercial-model)
:::

:::caution
Methods in this library are not tested as of 01/10/2025
:::

### Getting Started

Viber provides two REST API variants: one for working with channels and another for chat bots. In both cases, the main parameters required to operate are **Token** and **UserID**.

### Channel Management

1. Open the Viber application and create a new channel
2. After creation, go to the channel settings -> For Developers, and copy the channel **Token**
3. Set up a Webhook to receive updates. See [Set webhook](/docs/Viber/Settings-and-information/Set-webhook)
4. **UserID** - your own ID or the channel administrator's ID. See [Get channel information](/docs/Viber/Settings-and-information/Get-channel-information)

<br/>

### Chat Bot Management

1. Go to the [Viber Partner account](https://partners.viber.com/account/create-bot-account) and log in with your phone number linked to Viber
2. Select the option to create a new bot
3. Fill in all required fields in the bot creation form
4. Copy the **Token**
5. Obtain information about your bot by scanning the QR code on the creation page or in the settings (Bots section) in the Viber application
6. Set up a Webhook to receive updates. See [Set webhook](/docs/Viber/Settings-and-information/Set-webhook)

When working with a chat bot, **UserID** will be the ID of the specific person you are having a conversation with. This can be obtained while processing incoming messages via Webhook.

**Important:** The ID for the same user in a chat and in a channel are different values. You cannot use an ID obtained from a message to the bot for channel management methods and vice versa.