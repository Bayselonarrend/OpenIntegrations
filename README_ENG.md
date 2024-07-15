![Main](https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/main.gif#gh-dark-mode-only#gh-dark-mode-only)
![Main-light](https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/main-light.gif#gh-light-mode-only)


# Open Integrations Package
[![Статус порога качества](http://api.athenaeum.digital/Sonar/api/project_badges/measure?project=OpenIntegrations&metric=alert_status)](http://api.athenaeum.digital/Sonar/dashboard?id=OpenIntegrations)
![Версия](https://img.shields.io/badge/1C_version-8.3.9-yellow)
[![OpenYellow](https://img.shields.io/endpoint?url=https://openyellow.neocities.org/badges/2/736878759.json)](https://openyellow.notion.site/openyellow/24727888daa641af95514b46bee4d6f2?p=f78cea2066114067ab9069f06206219d&amp;pm=s)

<br>
An 1C/OneScript and CLI open-source toolkit for integrating with APIs of popular online services <br>


<br>

The implemented methods perform specific tasks (such as ``SendMessage`` or ``CreatePost``), allowing them to be used without delving into the implementation details. However, the code is highly decomposed – authorization methods, data retrieval, etc., are separated into individual functions where possible. This makes it easy to add new methods, even if they are not yet implemented in the library at the current time. <br><br>

List of currently available APIs:
<br>
  <div>
  <a href="https://en.openintegrations.dev/docs/Instructions/Telegram/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/Telegram.png" width="40"></a>
  <a href="https://en.openintegrations.dev/docs/Instructions/Bitrix24/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/Bitrix24.png?6" width="40"></a>
  <a href="https://en.openintegrations.dev/docs/Instructions/VK/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/VK.png" width="40"></a>
  <a href="https://en.openintegrations.dev/docs/Instructions/Viber/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/Viber.png" width="40"></a>
  <a href="https://en.openintegrations.dev/docs/Instructions/Twitter/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/Twitter.png" width="40"></a>
  <a href="https://en.openintegrations.dev/docs/Instructions/Notion/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/Notion.png" width="40"></a>
  <a href="https://en.openintegrations.dev/docs/Instructions/Yandex_Disk/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/YandexDisk.png" width="40"></a>
  <a href="https://en.openintegrations.dev/docs/Instructions/Google_Calendar/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/GoogleCalendar.png" width="40"></a>
  <a href="https://en.openintegrations.dev/docs/Instructions/Google_Drive/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/GoogleDrive.png" width="40"></a>
  <a href="https://en.openintegrations.dev/docs/Instructions/Google_Sheets/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/GoogleSheets.png" width="40"></a>
  <a href="https://en.openintegrations.dev/docs/Instructions/Slack/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/Slack.png" width="40"></a>
  <a href="https://en.openintegrations.dev/docs/Instructions/Airtable/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/Airtable.png?6" width="40"></a>
  <a href="https://en.openintegrations.dev/docs/Instructions/Dropbox/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/Dropbox.png?6" width="40"></a>
</div> 
<br>
 
## Releases ##

[![GitHub Downloads (all assets, all releases)](https://img.shields.io/github/downloads/bayselonarrend/OpenIntegrations/total?logo=github)](https://tooomm.github.io/github-release-stats/?username=bayselonarrend&repository=OpenIntegrations)

<img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/icons.png" align="right">

<br><br>

#### The library releases come in five versions:
- As a CLI application for Windows and Linux (exe, rpm, deb)
- As XML extension files for loading via the configurator
- As an EDT extension project
- As a standalone extension file in cfe format
- As a OneScript extension package in ospx format

<br/><br>

Regardless of the chosen installation method, the files must be obtained from the *Release* section, as the repository files may contain intermediate data and functions that are still in development.

<br/>

To get started with OneScript, you also need to install the package

<br/>

From Hub (only ru version):
```powershell
    opm install oint
```

From file:
```powershell
    opm install -f "./OInt-x.x.x.ospx"
```
<br>

The CLI version requires **.Net Framework 4.8** or **Mono of the corresponding version**. When installing from rpm or deb packages, it is installed automatically.

<br/>
 
>[!WARNING]
>It is not recommended to directly use the methods of service modules (1C and OneScript; OPI_Tools, OPI_Cryptography etc.) in your project (if you plan to update to new versions in the future). To maintain backward compatibility, the number/purpose of parameters and the return types for API methods do not change, but this does not apply to service modules, which may change as needed for optimization and adaptation to new requirements. If you need functionality from the service modules, it is recommended to copy it separately.
<br/>


## Documentation ##

OpenIntegrations has detailed documentation with examples available at [https://en.openintegrations.dev](https://en.openintegrations.dev). There you can find both general guidelines for getting started with each specific API and descriptions of each method with code examples, parameters, and return values.

![Docs](https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/docs_eng.png?4)

The CLI version of OpenIntegrations has its own built-in help for all methods. The help is displayed when calling the library without a method, a method without options, or by specifying the `--help` option.

___
<br>


<img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/heartnstar.png?1" align="right" width="384">

<br>

>- Open Integrations Package (OpenIntegrations)<br>
>Licensed under the MIT License<br>
