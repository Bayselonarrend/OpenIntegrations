---
id: VKTeams
sidebar_class_name: VKTeams
keywords: [1C, 1С, 1С:Enterprise, 1С:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, VKTeams, VK Teams]
---

<img src={require('../../static/img/APIs/VKTeams.png').default} width='64px' />

# VK Teams

This section covers the library for working with VK Teams API in 1С:Enterprise, OneScript, and CLI. This page describes all the steps required to get started.

### Getting Started

1. Register, choose a tariff plan, and download the VK Teams application [on the main page](https://biz.mail.ru/teams)
2. Log into the application using a one-time password that will be sent to your email. You can view the email of the required user in the administration panel
3. Start a conversation with [@metabot](http://teams.vk.com/profile/70001) and complete the procedure for creating a new bot
4. Generate a new **token** and enable the ability to add the bot to a group (if necessary)
5. Save the bot ID by obtaining it using the "Show my bots" button
6. Generate a link and navigate to it in your browser

```
The URL should end with your bot ID
https://teams.vk.com/profile/1234567890
```

7. Start a conversation with the bot

Now you can add the bot to groups and manage it using the **Token** and **ID of the required chat** (group or user)