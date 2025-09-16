![Main](media/main.gif#gh-dark-mode-only#gh-dark-mode-only)
![Main-light](media/main-light.gif#gh-light-mode-only)


# Open Integrations Package
![Версия](https://img.shields.io/badge/1C_version-8.3.10-yellow)
[![OpenYellow](https://img.shields.io/endpoint?url=https://openyellow.org/data/badges/2/736878759.json)](https://openyellow.org/grid?data=top&repo=736878759)
[![OneScript](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/refs/heads/main/media/os-logo.json)](https://github.com/EvilBeaver/OneScript)
[![Boosty](media/boosty.svg)](https://boosty.to/bayselonarrend)

<br>
A set of tools for integration with popular APIs: console application (Windows/Linux) and library (extension) for 1C:Enterprise/OneScript, consisting of a common set of ready-made functions for working with many well-known cloud services <br>


<br>

The implemented methods perform specific tasks (such as ``SendMessage`` or ``CreatePost``), allowing them to be used without delving into the implementation details. However, the code is highly decomposed – authorization methods, data retrieval, etc., are separated into individual functions where possible. This makes it easy to add new methods, even if they are not yet implemented in the library at the current time. <br><br>

List of currently available APIs:
<br>
  <div>
  <a href="https://en.openintegrations.dev/docs/Instructions/Telegram/"><img src="media/Telegram.png" width="40"></a>
  <a href="https://en.openintegrations.dev/docs/Instructions/Bitrix24/"><img src="media/Bitrix24.png?6" width="40"></a>
  <a href="https://en.openintegrations.dev/docs/Instructions/CDEK/"><img src="media/CDEK.png?6" width="40"></a>
  <a href="https://en.openintegrations.dev/docs/Instructions/VK/"><img src="media/VK.png" width="40"></a>
  <a href="https://en.openintegrations.dev/docs/Instructions/VKTeams/"><img src="media/VKTeams.png" width="40"></a>
  <a href="https://en.openintegrations.dev/docs/Instructions/Viber/"><img src="media/Viber.png" width="40"></a>
  <a href="https://en.openintegrations.dev/docs/Instructions/Ozon/"><img src="media/Ozon.png" width="40"></a>
    <a href="https://en.openintegrations.dev/docs/Instructions/GreenAPI/"><img src="media/GreenAPI.png" width="40"></a>
  <a href="https://en.openintegrations.dev/docs/Instructions/S3/"><img src="media/S3.png" width="40"></a>
    <a href="https://en.openintegrations.dev/docs/Instructions/PostgreSQL/"><img src="media/PostgreSQL.png" width="40"></a>
  <a href="https://en.openintegrations.dev/docs/Instructions/SQLite/"><img src="media/SQLite.png" width="40"></a>
    <a href="https://en.openintegrations.dev/docs/Instructions/MSSQL/"><img src="media/MSSQL.png" width="40"></a>
    <a href="https://en.openintegrations.dev/docs/Instructions/MySQL/"><img src="media/MySQL.png" width="40"></a>
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
  <a href="https://en.openintegrations.dev/docs/Instructions/TCP/"><img src="media/TCP.png?6" width="40"></a>
    <a href="https://openintegrations.dev/docs/Instructions/HTTP/"><img src="media/HTTP.png?6" width="40"></a>
    <a href="https://en.openintegrations.dev/docs/Instructions/RCON/"><img src="media/RCON.png?6" width="40"></a>
</div> 
<br>

## Work example

Sending picture to Telegram chat for 1C/OneScript

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

You can use the standard `>` redirect or the oint's `--out` option to save the response in the console. For more details of working with the CLI version, see the corresponding [documentation section](https://en.openintegrations.dev/docs/Start/CLI_version)

<br>
 
## Releases ##

[![GitHub Downloads](https://img.shields.io/github/downloads/bayselonarrend/openintegrations/total?logo=github&logoColor=white)](https://github.com/Bayselonarrend/OpenIntegrations/releases/latest)
[![SourceForge Downloads](https://img.shields.io/sourceforge/dw/openintegrations?logo=sourceforge&logoColor=white&color=orange)](https://sourceforge.net/projects/openintegrations/)

<img src="media/icons.png" align="right">

<br><br>

#### The library releases come in five versions:
- As a CLI application for Windows and Linux (exe, rpm, deb)
- As XML extension files for loading via the configurator
- As an EDT extension project
- As a standalone extension file in cfe format
- As a OneScript extension package in ospx format

<br/><br>

When using the 1C and OneScript versions, you can also simply copy the code of common modules from the releases into your project by hand. However, regardless of the chosen installation method, you should get the files from Release, because the repository source files themselves contain intermediate data and functions under development.

<br/>

+ To start working in 1C it is enough to download the CFE file (or XML upload) of the extension and load it into the extensions list of your configuration <br>
+ To start working in OneScript, you need to install the package

   From the package hub (RU version only):
   ```powershell
       opm install oint
   ```

   Or from a downloaded ospx file:
   ```powershell
       opm install -f "./OInt-x.x.x.ospx"
   ```
<br>

+ To get started with the CLI (command line application), you need to download the Windows installer or one of the package variants for Linux from the releases, according to the operating system you are using

   With any installation option, the OInt CLI is started with the `oint` command from the command line (installation from Installer for Windows may require a reboot)

<br/>
 
>[!WARNING]
>Also, there is a single exe-file delivery for the CLI application. To run it, .Net Framework 4.8 or the relevant version of Mono is required.
>This delivery option has performance issues, so we recommend using it only if it is impossible to use other variants on the target system
<br/>



## Documentation ##

OpenIntegrations has detailed documentation with examples available at [https://en.openintegrations.dev](https://en.openintegrations.dev). There you can find both general guidelines for getting started with each specific API and descriptions of each method with code examples, parameters, and return values.

![Docs](media/docs_eng.png?4)

The CLI version of OpenIntegrations has its own built-in help for all methods. The help is displayed when calling the library without a method, a method without options, or by specifying the `--help` option.

## Support the project

![image](media/boosty.png)

If you like this or my other projects, you can support me [on Boosty](https://boosty.to/bayselonarrend) (regularly or one-time). With a subscription of 500 rubles (~6 dollars) or more, you'll get access to a private Telegram chat where you can ask questions about the project and receive direct assistance from me.

**Thanks for your support!**


<br>

>- Open Integrations Package (OpenIntegrations)<br>
>Licensed under the MIT License<br>
