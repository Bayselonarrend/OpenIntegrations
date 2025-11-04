---
id: VKTeams
sidebar_class_name: VKTeams
---

<img src={require('../../static/img/APIs/VKTeams.png').default} width='64px' />

# VK Teams

This section is dedicated to the library for working with VK Teams API. On this page, all the steps necessary to start working are described

## Getting started

1. Register, book a tariff and download the VK Teams app [on the home page](https://biz.mail.ru/teams)

![BF](../../static/img/Docs/VKTeams/5.png)

2. Log in to the application using the one-time password that should arrive in the mail. You can view the mail of the required user in the administration panel

![BF](../../static/img/Docs/VKTeams/6.png)

3. Start a dialog with [@metabot](http://teams.vk.com/profile/70001) and follow the procedure to create a new bot

![BF](../../static/img/Docs/VKTeams/1.png)

4. Generate a new **token** and enable the ability to add the bot to a group (if necessary)

![BF](../../static/img/Docs/VKTeams/2.png)

5. Save the bot ID by retrieving it using the "Show My Bots" button

![BF](../../static/img/Docs/VKTeams/4.png)

6. Form a link and click on it in your browser 

```

At the end of the URL should be your bot ID
https://teams.vk.com/profile/1234567890

```

7. Start a dialog with the bot

Now you will be able to add a bot to groups and control it with **Token** and **ID of the desired dialog** (group or user) 

![BF](../../static/img/Docs/VKTeams/3.png)
