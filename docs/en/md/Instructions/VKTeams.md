---
id: VKTeams
sidebar_class_name: VKTeams
keywords: [1C, 1С, 1С:Enterprise, 1С:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, VKTeams, VK Teams]
---

<img src={require('../../static/img/APIs/VKTeams.png').default} width='64px' />

# VK Teams

This section covers the library for working with the VK Teams API in 1C:Enterprise, OneScript, and CLI. This page describes all the steps required to get started.

### Getting Started

1. Register, choose a tariff plan, and download the VK Teams application [on the main page](https://biz.mail.ru/teams)
2. Log in to the application using a one-time password that will be sent to your email. You can view the required user's email in the administration panel
3. Start a chat with [@metabot](http://teams.vk.com/profile/70001) and complete the new bot creation procedure
4. Generate a new **token** and, if necessary, enable the option to add the bot to a group
5. Save the bot's ID, which you can get using the "Show my bots" button
6. Create a link and open it in your browser

```
The URL should end with your bot ID
https://teams.vk.com/profile/1234567890
```

7. Start a chat with the bot

Now you can add the bot to groups and manage it using the **Token** and the **ID of the required chat** (group or user)