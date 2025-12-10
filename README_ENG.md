![Main](media/main.gif#gh-dark-mode-only#gh-dark-mode-only)
![Main-light](media/main-light.gif#gh-light-mode-only)

# Open Integrations Package

![Версия](https://img.shields.io/badge/1C_version-8.3.10-yellow)
[![OpenYellow](https://img.shields.io/endpoint?url=https://openyellow.org/data/badges/2/736878759.json)](https://openyellow.org/grid?data=top&repo=736878759)
[![OneScript](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/refs/heads/main/media/os-logo.json)](https://github.com/EvilBeaver/OneScript)
[![Boosty](media/boosty.svg)](https://boosty.to/bayselonarrend)

**OpenIntegrations** is a set of tools for working with external APIs, available as a library (extension) for 1C:Enterprise / OneScript and a cross-platform console application for Windows and Linux. The project provides ready-made methods for performing application tasks (sending messages, creating documents, SQL queries, etc.) across more than 30 services and technologies, including Telegram, VK, Bitrix24, Google and Yandex services, as well as various DBMS and exchange protocols.

<br>

The project code is organized as a set of independent modules, each responsible for working with a specific service. Common logic, such as HTTP or JSON handling, is extracted into reusable components. This allows for both quick application of ready-made functions and easy extension of functionality by adding new methods based on existing components. The source code is open, providing full control over implementation and enabling community participation in development. <br><br>

📋 Currently implemented methods for working with the following services ([list](/media/catalogs/Catalog.md))
<br>
  <div>
  <a href="https://en.openintegrations.dev/docs/Instructions/Telegram/"><img src="media/Telegram.png" width="40"></a>
  <a href="https://en.openintegrations.dev/docs/Instructions/Bitrix24/"><img src="media/Bitrix24.png?6" width="40"></a>
  <a href="https://en.openintegrations.dev/docs/Instructions/CDEK/"><img src="media/CDEK.png?6" width="40"></a>
  <a href="https://en.openintegrations.dev/docs/Instructions/VK/"><img src="media/VK.png" width="40"></a>
  <a href="https://en.openintegrations.dev/docs/Instructions/VKTeams/"><img src="media/VKTeams.png" width="40"></a>
  <a href="https://en.openintegrations.dev/docs/Instructions/Viber/"><img src="media/Viber.png" width="40"></a>
    <a href="https://en.openintegrations.dev/docs/Instructions/GreenMax/"><img src="media/GreenMax.png" width="40"></a>
    <a href="https://en.openintegrations.dev/docs/Instructions/GreenAPI/"><img src="media/GreenAPI.png" width="40"></a>
  <a href="https://en.openintegrations.dev/docs/Instructions/S3/"><img src="media/S3.png" width="40"></a>
    <a href="https://en.openintegrations.dev/docs/Instructions/PostgreSQL/"><img src="media/PostgreSQL.png" width="40"></a>
  <a href="https://en.openintegrations.dev/docs/Instructions/SQLite/"><img src="media/SQLite.png" width="40"></a>
    <a href="https://en.openintegrations.dev/docs/Instructions/MSSQL/"><img src="media/MSSQL.png" width="40"></a>
    <a href="https://en.openintegrations.dev/docs/Instructions/MySQL/"><img src="media/MySQL.png" width="40"></a>
     <a href="https://en.openintegrations.dev/docs/Instructions/MongoDB/"><img src="media/MongoDB.png" width="40"></a>
  <a href="https://en.openintegrations.dev/docs/Instructions/Twitter/"><img src="media/Twitter.png" width="40"></a>
  <a href="https://en.openintegrations.dev/docs/Instructions/Notion/"><img src="media/Notion.png" width="40"></a>
  <a href="https://en.openintegrations.dev/docs/Instructions/YandexDisk/"><img src="media/YandexDisk.png" width="40"></a>
  <a href="https://en.openintegrations.dev/docs/Instructions/GoogleCalendar/"><img src="media/GoogleCalendar.png" width="40"></a>
  <a href="https://en.openintegrations.dev/docs/Instructions/GoogleDrive/"><img src="media/GoogleDrive.png" width="40"></a>
  <a href="https://en.openintegrations.dev/docs/Instructions/GoogleSheets/"><img src="media/GoogleSheets.png" width="40"></a>
    <a href="https://en.openintegrations.dev/docs/Instructions/OpenAI/"><img src="media/OpenAI.png" width="40"></a>
    <a href="https://en.openintegrations.dev/docs/Instructions/Ollama/"><img src="media/Ollama.png" width="40"></a>
  <a href="https://en.openintegrations.dev/docs/Instructions/Slack/"><img src="media/Slack.png" width="40"></a>
  <a href="https://en.openintegrations.dev/docs/Instructions/Airtable/"><img src="media/Airtable.png?6" width="40"></a>
  <a href="https://en.openintegrations.dev/docs/Instructions/Dropbox/"><img src="media/Dropbox.png?6" width="40"></a>
  <a href="https://en.openintegrations.dev/docs/Instructions/Neocities/"><img src="media/Neocities.png?6" width="40"></a>
    <a href="https://en.openintegrations.dev/docs/Instructions/FTP/"><img src="media/FTP.png?6" width="40"></a>
    <a href="https://en.openintegrations.dev/docs/Instructions/SFTP/"><img src="media/sftp.png?6" width="40"></a>
  <a href="https://en.openintegrations.dev/docs/Instructions/TCP/"><img src="media/TCP.png?6" width="40"></a>
    <a href="https://en.openintegrations.dev/docs/Instructions/HTTP/"><img src="media/HTTP.png?6" width="40"></a>
    <a href="https://en.openintegrations.dev/docs/Instructions/RCON/"><img src="media/RCON.png?6" width="40"></a>
       <a href="https://en.openintegrations.dev/docs/Instructions/SSH/"><img src="media/SSH.png?6" width="40"></a>
   
</div>
<br>

## Usage Example

Sending an image to a Telegram chat from 1C/OneScript

```bsl

    Token    = "6129457865:AAFyzNYOAFbu...";
    ChatID   = "461699897";
    Text     = "Cool pic";
    Picture  = "C:/picture.jpg";  // URL, disk path or Binary data

    Result = OPI_Telegram.SendImage(Token, ChatID, Text, Picture);

```

Same thing, but for CLI (bash example)

```bash
    oint telegram SendImage \
        --token "6129457865:AAFyzNYOAFbu..." \
        --chat 461699897 \
        --text "Cool pic" \
        --picture "picture.jpg"
```

To save the response in the console, you can use the standard `>` redirect or the `--out <file path>` option. For more detailed information on working with the CLI version, refer to the corresponding [documentation section](https://en.openintegrations.dev/docs/Start/CLI_version)

<br>

## Installation and Release Variants

[![GitHub Downloads](https://img.shields.io/github/downloads/bayselonarrend/openintegrations/total?logo=github&logoColor=white)](https://github.com/Bayselonarrend/OpenIntegrations/releases/latest)
[![SourceForge Downloads](https://img.shields.io/sourceforge/dw/openintegrations?logo=sourceforge&logoColor=white&color=orange)](https://sourceforge.net/projects/openintegrations/)

<img src="media/icons.png" align="right">

<br><br>

#### The library releases are available in five variants

- As CLI application for Windows and Linux (exe, rpm, deb)
- As XML extension export
- As EDT extension project
- As standalone extension file in CFE format
- As [OneScript](https://github.com/EvilBeaver/OneScript) extension package in OSPX format

<br/><br>

When using versions for 1C and OneScript, you can also manually copy common module code into your project. However, regardless of the chosen installation method, it is recommended to obtain files from [*Releases*](https://github.com/Bayselonarrend/OpenIntegrations/releases/latest) or the [*stable branch*](https://github.com/Bayselonarrend/OpenIntegrations/tree/stable) of the repository, as the source files in the main branch may contain intermediate data and functions under development.

Quick start options:

- To start working in 1C: Simply [download](https://github.com/Bayselonarrend/OpenIntegrations/releases/latest) the CFE file (or XML export) of the extension and load it into your configuration's extensions list<br>
- To start working in OneScript: Install the package

   From the package hub (RU version only):

   ```powershell
       opm install oint
   ```

   Or from a downloaded ospx file:

   ```powershell
       opm install -f "./OInt-x.x.x.ospx"
   ```

<br>

- To start working with CLI (command line application): [Download from releases](https://github.com/Bayselonarrend/OpenIntegrations/releases/latest) the Windows installer or one of the Linux package variants, depending on your operating system

Regardless of the installation method, OInt CLI is launched with the `oint` command from the command line (when installing via Windows Installer, a system reboot may be required).

<br/>

## Documentation

OpenIntegrations features comprehensive documentation with examples available at [en.openintegrations.dev](https://en.openintegrations.dev). Here you can find both general guidelines for getting started with each specific API and descriptions of each method with code examples, parameters, and return values.

![Docs](media/docs.png?4)

The OpenIntegrations CLI version includes built-in help for all methods. Help is displayed when calling the library without a method, when calling a method without options, or when specifying the `--help` option.

## Sponsors [?](https://boosty.to/bayselonarrend/purchase/3429871?ssource=DIRECT&share=subscription_link)

The companies listed below support the development of the Open Integration Package and make significant contributions to its progress.

||
|-|
| <img width="100" height="120" alt="Logo_GREEN-API_icon_G_green" src="docs/docusaurus/static/img/Sponsors/GreenAPI.png" /> |
| **GreenAPI** <br/> Stable WhatsApp API <br/> Gateway <br/> <br/> [green-api.com](https://green-api.com/en) 🌍 |

<br/>

## Support the Project

If you like this or my other projects, you can support me [on Boosty](https://boosty.to/bayselonarrend) (recurring or one-time). Subscriptions starting from 500 rubles provide access to a private Telegram chat where you can ask questions about the project and get direct help from me. There is also a sponsor subscription for companies with priority support and logo placement in the sponsors list.

**Thank you for your support!**

<br>

>- Open Integrations Package (OpenIntegrations)<br>
>Licensed under the MIT License<br>
