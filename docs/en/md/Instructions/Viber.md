---
id: Viber
sidebar_class_name: Viber
---

<img src={require('../../static/img/APIs/Viber.png').default} width='64px' />

# Viber

This section is dedicated to the library for working with Viber API. On this page, all the steps necessary to start working are described

:::warning
Starting from February 5, 2024, this method of creating bots is no longer valid: Rakuten has canceled the ability to create bots for free, and now working with the API requires verification under a commercial model. More details [here](https://help.viber.com/hc/en-us/articles/15247629658525-Bot-commercial-model)
:::

:::caution
The methods of this library have not been tested since 10.01.2025
:::

## Getting started

For Viber, there are two REST APIs: one for working with channels and the other for chatbots. In both cases, the main parameters are **Token** and **UserID**

- If you need to manage a channel:
	1. Open the Viber app and create a new channel
	
	![BF](../../static/img/Docs/Viber/1.png)
	
	2. After creation, go to the channel settings -> For developers, and copy the **Token**
	
	![BF](../../static/img/Docs/Viber/2.png)
	
	3. Set webhook (see Set webhook)
	4. **UserID** - your ID (channel administrator). See Get Channel Information for details
	
 <br/>

- If you need a chatbot:
	1. Go to the link [https://partners.viber.com/account/create-bot-account](https://partners.viber.com/account/create-bot-account) and authorize yourself with your phone number linked to Viber
	
	![BF](../../static/img/Docs/Viber/3.png)
	
	2. Select the option to create a new bot
	
	![BF](../../static/img/Docs/Viber/4.png)
	
	3. In the bot creation menu, fill in all the required fields
	
	![BF](../../static/img/Docs/Viber/5.png)
	
	4. Copy the **Token**
	
	![BF](../../static/img/Docs/Viber/6.png)
	
	4. To find your new bot, you can scan the QR code on the creation page or in the settings (chat bots section) within the Viber app. 
	
	![BF](../../static/img/Docs/Viber/7.png)
	
	5. You cannot start a conversation with the bot right now. First, you need to set up a webhook. See Set Webhook
	6. After launch, the **User ID** will be the ID of the specific person engaging with the bot. You can obtain it from processing incoming messages via Webhook


	**Important**: The ID of the same user in chat and channel is different. You cannot use the ID obtained from a message to the bot to invoke channel management methods and vice versa
