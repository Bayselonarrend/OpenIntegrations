---
id: Viber
sidebar_class_name: Viber
keywords: [1C, 1С, 1С:Enterprise, 1С:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, Viber]
---

<img src={require('../../static/img/APIs/Viber.png').default} width='64px' />

# Viber

This section covers the library for working with Viber API in 1С:Enterprise, OneScript, and CLI. This page describes all the steps required to get started.

:::warning
As of 02/05/2024, this method of creating bots is no longer valid: Rakuten has discontinued the ability to create bots for free, and now working with the API requires verification under a commercial model. Learn more [here](https://help.viber.com/hc/en-us/articles/15247629658525-Bot-commercial-model)
:::

:::caution
Methods in this library have not been tested since 01/10/2025
:::

### Getting Started

Viber has two REST API variants: for working with channels and for chat bots. In both cases, the main parameters for operation are **Token** and **UserID**.

### Channel Management

1. Open the Viber application and create a new channel
2. After creation, go to channel settings -> For developers, and copy the channel **Token**
3. Set up a Webhook to receive updates. See [Set webhook](/docs/Viber/Settings-and-information/Set-webhook)
4. **UserID** - your ID or the channel administrator's ID. See [Get channel information](/docs/Viber/Settings-and-information/Get-channel-information)

 <br/>

### Chat Bot Management

1. Go to the [Viber Partner Cabinet](https://partners.viber.com/account/create-bot-account) and log in with your phone number linked to Viber
2. Select the option to create a new bot
3. Fill in all required fields in the bot creation menu
4. Copy the **Token**
5. Get information about your bot by scanning the QR code on the creation page or in the settings (bots section) in the Viber application
6. Set up a Webhook to receive updates. See [Set webhook](/docs/Viber/Settings-and-information/Set-webhook)

When working with a chat bot, the **UserID** will be the ID of the specific person you're communicating with. This can be obtained when processing incoming messages via Webhook.

**Important:** The ID of the same user for chat and channel have different values. You cannot use an ID obtained from a bot message to call channel management methods and vice versa.