﻿---
id: Start
sidebar_class_name: NachaloRaboty
---

# Welcome!

![OPI](../../static/img/logo_long.png)

**Open Integrations Package** - is a set of tools for integration with some popular APIs via CLI, 1C, or OneScript. It consists of common modules, each responsible for its own API, as well as several utility modules that are common to all. 

The implemented methods perform specific tasks (such as *SendMessage()* or *CreatePost()*), allowing them to be used without delving into the implementation details. However, the code is highly decomposed – authorization methods, data retrieval, etc., are separated into individual functions where possible. This makes it easy to add new methods, even if they are not yet implemented in the library at the current time.

<br/>

Fast navigation:
 <div>
 <a href="/docs/Instructions/Telegram/"><img src={require('../../static/img/APIs/Telegram.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/Bitrix24/"><img src={require('../../static/img/APIs/Bitrix24.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/CDEK/"><img src={require('../../static/img/APIs/CDEK.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/VK/"><img src={require('../../static/img/APIs/VK.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/VKTeams/"><img src={require('../../static/img/APIs/VKTeams.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/Viber/"><img src={require('../../static/img/APIs/Viber.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/Ozon/"><img src={require('../../static/img/APIs/Ozon.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/Twitter/"><img src={require('../../static/img/APIs/Twitter.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/Notion/"><img src={require('../../static/img/APIs/Notion.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/YandexDisk/"><img src={require('../../static/img/APIs/YandexDisk.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/GoogleCalendar/"><img src={require('../../static/img/APIs/GoogleCalendar.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/GoogleDrive/"><img src={require('../../static/img/APIs/GoogleDrive.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/GoogleSheets/"><img src={require('../../static/img/APIs/GoogleSheets.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/Slack/"><img src={require('../../static/img/APIs/Slack.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/Airtable/"><img src={require('../../static/img/APIs/Airtable.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/Dropbox/"><img src={require('../../static/img/APIs/Dropbox.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/Neocities/"><img src={require('../../static/img/APIs/Neocities.png').default} width="32" class="wp_logo"/></a>

</div> 

<br/>

## Getting started

The library releases come in five variants: 

- As a CLI application for Windows and Linux (exe, rpm, deb)
- As XML extension files for loading via the configurator
- As an EDT extension project
- As a standalone extension file in cfe format
- As a OneScript extension package in ospx format

Regardless of the chosen installation method, the files must be obtained from the [Release](https://github.com/Bayselonarrend/OpenIntegrations/releases) section, as the repository files may contain intermediate data and functions that are still in development. 

For more details about each release variant, see the section [About Release Variants](/docs/Start/Release-variants)

<br/>

## Structure of modules

The project's common modules come in two types: 

- Service 
	- OPI_Tools
	- OPI_Cryptography
- Modules for direct interaction with APIs
	- OPI_Telegram, OPI_VK...
	
:::warning
It is not recommended to use the methods of utility modules in other parts of your configuration (if you plan to update to new versions in the future). To maintain backward compatibility, the number/purpose of parameters and the return types for API interaction methods do not change, but this does not apply to utility modules, which can be modified in any way for optimization and adaptation to new requirements. If you need functionality from the utility modules, it is recommended to copy it separately.
:::
