---
id: Telegram
sidebar_class_name: Telegram
---

<img src={require('../../static/img/APIs/Telegram.png').default} width='64px' />

# Telegram

This section is dedicated to the library for working with Telegram API. On this page, all the steps necessary to start working are described

## Getting started

- Create a Telegram bot

	1. All actions with the Telegram API are carried out through bots. To create a new bot, you need to start a conversation with [@BotFather](https://t.me/BotFather)

	![BF](../../static/img/Docs/Telegram/2.png)

	2. Choose */newbot* command
	
	![BF](../../static/img/Docs/Telegram/3.png)
	
	3. BotFather will prompt you to choose a name and a username for the bot, after which the creation process will be completed
	
- Save the **token** that BotFather sent you after completing the bot creation
	
	![BF](../../static/img/Docs/Telegram/1.png)
	
- (Optional) Determine the purpose of the interaction
 
	The bot you created can now be used in two ways
	
	- Like a chat-bot
	- For automating channel management
	
	Depending on the chosen path, the way to obtain the **ChatID** (the parameter responsible for identifying the interaction object) will differ.
	
	In the case of a chat bot, the chat ID will be the user ID with whom the bot is conversing. If the bot is to be used for channel management, after adding it as an administrator, you can use the channel's name with @ (e.g., @MyChannel) instead of the chat ID
	
	The token and chat ID are the primary parameters for all methods of working with the Telegram API
