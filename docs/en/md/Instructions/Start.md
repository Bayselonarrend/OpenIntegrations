---
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
 <a href="/docs/Instructions/S3/"><img src={require('../../static/img/APIs/S3.png').default} width="32" class="wp_logo"/></a>
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
 <a href="/docs/Instructions/TCP/"><img src={require('../../static/img/APIs/TCP.png').default} width="32" class="wp_logo"/></a>

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

<hr/>

## Examples of Usage

As an 1C extension and OneScript package, the OpenIntegrations is a set of common modules with export methods - one module for each API. All available methods are functions, i.e. they return values. Typically, these are *Map* describing the JSON of the server response, but can also be *Binary Data* (e.g. in file download methods) or *String* (e.g. in URL retrieval methods). The return value types are described for each method in the current documentation and in the documentation comments in the library code itself

A simple example of using OpenIntegrations is sending a picture to Telegram:

```bsl

    Token    = "6129457865:AAFyzNYOAFbu...";
    ChatID   = "461699897";
    Text     = "Cool pic";
    Picture  = "C:/picture.jpg";  // URL, disk path or Binary data

    Result = OPI_Telegram.SendImage(Token, ChatID, Text, Picture);

```

The implementation of OpenIntegrations as a CLI application, repeats the functionality of the extension/package and provides access to all its methods from the command line. Each parameter of the original function matches an option starting with `--` characters, e.g. `--token`. These matches for each specific method can be found in the current documentation, as well as in the 1C/OneScript function comments and the application's built-in help (the method help is displayed when the method is called without parameters, for more details see [Working with CLI app](/docs/Start/CLI_version))

CLI example:

```bash

    oint telegram SendImage \
        --token "6129457865:AAFyzNYOAFbu..." \
        --chat 461699897 \
        --text "Cool pic" \
        --picture "picture.jpg"

```

<hr/>

## Working with current documentation

Some features of this documentation that will help you use it more effectively and avoid misunderstandings:

1. **Each method has its own description page**. As a rule, the title of the description page is the same as the name of the method (with spaces added) and is located in the subsection whose name is the same as the name of the program module region. If you can't find the page for a particular function you are interested in, try the built-in full-text search in the top right corner

2. **Parameters of type BinaryData can be defined as file paths or URLs**. Often, for parameters with the *BinaryData* data type, the documentation code examples use URLs or file paths on disk. This is acceptable behavior, because at the beginning of all functions, incoming parameters are converted (if possible) to the required types. In the case of binary data, for example, when passing a string, an attempt will be made to find the file on disk, get it from the Internet, or convert it from Base64

3. **Examples of function results are in JSON format, but in 1C and OS they will be Maps**. If the sample result on the function description page is JSON, in 1C and OneScript it will be a *Map* - i.e. the response will be deserialized. JSON is returned as a string only in the CLI version

<hr/>

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
