---
id: Start
sidebar_class_name: NachaloRaboty
---

# Welcome!

![OPI](../../static/img/logo_long.webp)

**OpenIntegrations** is a set of tools for working with external APIs, available as a library (extension) for 1C:Enterprise / OneScript and a cross-platform console application for Windows and Linux. The project provides ready-made methods for performing application tasks (sending messages, creating documents, SQL queries, etc.) across more than 30 services and technologies, including Telegram, VK, Bitrix24, Google and Yandex services, as well as various DBMS and exchange protocols

The project code is organized as a set of independent modules, each responsible for working with a specific service. Common logic, such as HTTP or JSON handling, is extracted into reusable components. This allows for both quick application of ready-made functions and easy extension of functionality by adding new methods based on existing components. The source code is open, providing full control over implementation and enabling community participation in development

<br/>

Fast navigation:
 <div>
 <a href="/docs/Instructions/Telegram/"><img src={require('../../static/img/APIs/Telegram.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/Bitrix24/"><img src={require('../../static/img/APIs/Bitrix24.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/CDEK/"><img src={require('../../static/img/APIs/CDEK.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/VK/"><img src={require('../../static/img/APIs/VK.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/VKTeams/"><img src={require('../../static/img/APIs/VKTeams.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/Viber/"><img src={require('../../static/img/APIs/Viber.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/GreenMax/"><img src={require('../../static/img/APIs/GreenMax.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/GreenAPI/"><img src={require('../../static/img/APIs/GreenAPI.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/S3/"><img src={require('../../static/img/APIs/S3.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/PostgreSQL/"><img src={require('../../static/img/APIs/PostgreSQL.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/SQLite/"><img src={require('../../static/img/APIs/SQLite.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/MSSQL/"><img src={require('../../static/img/APIs/MSSQL.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/MySQL/"><img src={require('../../static/img/APIs/MySQL.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/MongoDB/"><img src={require('../../static/img/APIs/MongoDB.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/Twitter/"><img src={require('../../static/img/APIs/Twitter.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/Notion/"><img src={require('../../static/img/APIs/Notion.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/YandexDisk/"><img src={require('../../static/img/APIs/YandexDisk.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/GoogleCalendar/"><img src={require('../../static/img/APIs/GoogleCalendar.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/GoogleDrive/"><img src={require('../../static/img/APIs/GoogleDrive.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/GoogleSheets/"><img src={require('../../static/img/APIs/GoogleSheets.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/OpenAI/"><img src={require('../../static/img/APIs/OpenAI.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/Ollama/"><img src={require('../../static/img/APIs/Ollama.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/Slack/"><img src={require('../../static/img/APIs/Slack.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/Airtable/"><img src={require('../../static/img/APIs/Airtable.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/Dropbox/"><img src={require('../../static/img/APIs/Dropbox.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/Neocities/"><img src={require('../../static/img/APIs/Neocities.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/FTP/"><img src={require('../../static/img/APIs/FTP.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/SFTP/"><img src={require('../../static/img/APIs/SFTP.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/TCP/"><img src={require('../../static/img/APIs/TCP.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/HTTP/"><img src={require('../../static/img/APIs/HTTP.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/GRPC/"><img src={require('../../static/img/APIs/gRPC.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/SSH/"><img src={require('../../static/img/APIs/SSH.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/RCON/"><img src={require('../../static/img/APIs/RCON.png').default} width="32" class="wp_logo"/></a>

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

## Support the project

<img src={require('../../static/img/boosty.png').default}/>

If you like this or my other projects, you can support me [on Boosty](https://boosty.to/bayselonarrend) (regularly or one-time). With a subscription of 500 rubles (~6 dollars) or more, you'll get access to a private Telegram chat where you can ask questions about the project and receive direct assistance from me.

**Thanks for your support!**