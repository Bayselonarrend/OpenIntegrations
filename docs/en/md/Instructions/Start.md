---
id: Start
sidebar_class_name: NachaloRaboty
keywords: [1C, 1С, 1С:Enterprise, 1С:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, HTTP, Extension]
---

# Welcome!

![OPI](../../static/img/logo_long.webp)

**OpenIntegrations** is a set of tools for working with external APIs, available as a library (extension) for 1C:Enterprise / OneScript and as a cross-platform console application for Windows and Linux. The project provides ready-to-use methods for solving application tasks (sending messages, creating documents, SQL queries, etc.) in more than 30 services and technologies, including Telegram, VK, Bitrix24, Google and Yandex services, as well as various DBMS and data exchange protocols.

The project code is organized as a set of independent modules, each responsible for interacting with a specific service. Shared logic, such as working with HTTP or JSON, is implemented in reusable components. This enables both rapid application of ready-made functions and easy extension of functionality by adding new methods based on existing components. The source code is open, which grants full control over implementation and allows the community to participate in development.

<br/>

Quick navigation:
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
 <a href="/docs/Instructions/ClickHouse/"><img src={require('../../static/img/APIs/ClickHouse.png').default} width="32" class="wp_logo"/></a>
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

## Getting Started

The library is released in five variants:

- As a CLI application for Windows and Linux (exe, rpm, deb)
- As XML extension files for uploading via the configurator
- As an EDT extension project
- As a standalone cfe extension file
- As a OneScript extension package in ospx format

Regardless of the selected installation method, files must be downloaded from the [Release](https://github.com/Bayselonarrend/OpenIntegrations/releases) section, as the repository files themselves may contain intermediate data or functions still under development.

See [About Release Variants](/docs/Start/Release-variants) for more details about each release type.

<hr/>

## Usage Examples

When used as an extension for 1C and as a OneScript package, OpenIntegrations is a set of shared modules with exported methods—one module per API. All available methods are functions, i.e. they return values. As a rule, these are *Maps* describing the server response JSON, but may also be *Binary Data* (for methods that download files), or *Strings* (for methods that return URLs). The types of return values are described for each method in the online documentation and in the documented comments in the library’s source code.

A simple example of using OpenIntegrations—sending an image to Telegram:

```bsl

    Token    = "6129457865:AAFyzNYOAFbu...";
    ChatID   = "461699897";
    Text     = "Cool pic";
    Picture  = "C:/picture.jpg";  // URL, local file path, or Binary Data

    Result = OPI_Telegram.SendImage(Token, ChatID, Text, Picture);

```

Implementation of OpenIntegrations as a CLI application reproduces the functionality of the extension/package and provides access to all its methods from the command line. Each parameter of the original function corresponds to an option starting with `--`, e.g. `--token`. These mappings for each particular method can be found in the current documentation, as well as in the 1C/OneScript function comments and the built-in help of the application (help for a method is displayed when you call the method without parameters, for details see [Working with the CLI version](/docs/Start/CLI_version)).

CLI example:

```bash

    oint telegram SendImage \
        --token "6129457865:AAFyzNYOAFbu..." \
        --chat 461699897 \
        --text "Cool pic" \
        --picture "picture.jpg"

```

<hr/>

## About the Documentation

A few features of this documentation—knowing them will help you use it more efficiently and avoid misunderstandings:

1. **Each method has its own description page.** Typically, the title of the description page matches the method name (with spaces added), and is located in the subsection whose name matches the module area. If you cannot find the page for the specific function of interest, try using the built-in full-text search in the top right corner.

2. **Parameters of type BinaryData can be specified as file paths or URLs.** Often, for parameters of the *BinaryData* data type, the documentation's code examples use URLs or file paths on disk. This is permitted, because at the start of every function, incoming parameters are converted (as far as possible) to the required types. In the case of binary data, passing a string will make the function try to find a file on disk, fetch it from the internet, or convert it from Base64.

3. **Function result examples are shown in JSON format, but in 1C and OS they are Maps.** If the result example on a function’s description page is shown as JSON, that means in 1C and OneScript the result will be a *Map* (with the JSON response parsed). Only the CLI version returns the response as a JSON string.

<hr/>

## Support the Project

<img src={require('../../static/img/boosty.png').default}/>

If you like this or my other projects, you can support me [on Boosty](https://boosty.to/bayselonarrend) (either regularly or as a one-time donation). Subscriptions of 500 rubles (~$6) or more unlock access to a private Telegram chat where you can ask questions about the project and receive direct assistance from me. There is also a sponsorship option for companies, which includes priority support and placement of your logo in the sponsors list.

**Thank you for your support!**