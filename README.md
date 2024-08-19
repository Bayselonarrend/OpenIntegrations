
 <img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/eng.png?1" align="left" width="32"> *This page, but on English, here: [Click!](https://github.com/Bayselonarrend/OpenIntegrations/blob/main/README_ENG.md)*

<hr>

![Main](https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/main.gif#gh-dark-mode-only#gh-dark-mode-only)
![Main-light](https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/main-light.gif#gh-light-mode-only)


# Открытый пакет интеграций

![Версия](https://img.shields.io/badge/Версия_1С-8.3.9-yellow)
[![OpenYellow](https://img.shields.io/endpoint?url=https://openyellow.neocities.org/badges/2/736878759.json)](https://openyellow.notion.site/openyellow/24727888daa641af95514b46bee4d6f2?p=f78cea2066114067ab9069f06206219d&amp;pm=s)

<br>
Набор инструментов интеграции с популярными API: консольное приложение (Windows/Linux) и библиотека (расширение) для 1C:Enterprise/OneScript, состоящие из общего набора готовых функций для работы с онлайн-сервисами <br>


<br>

Все реализованные методы из набора выполняют отдельные прикладные задачи, вроде `ОтправитьСообщение` или `СоздатьПост`, что позволяет использовать их без углубления в реализацию. Но код, при этом, достаточно сильно декомпозирован: методы авторизации, получения данных и пр. по возможности вынесены в отдельные функции. Это позволяет легко добавлять новые методы на основе уже существующих, не разматывая клубок реализации до самого начала работы с API. <br><br>

На сегодняшний день реализован инструментарий для работы со следующими сервисами:
<br>
  <div>
  <a href="https://openintegrations.dev/docs/Instructions/Telegram/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/Telegram.png" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/Bitrix24/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/Bitrix24.png?6" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/VK/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/VK.png" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/Viber/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/Viber.png" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/Twitter/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/Twitter.png" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/Notion/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/Notion.png" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/YandexDisk/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/YandexDisk.png" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/GoogleCalendar/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/GoogleCalendar.png" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/GoogleDrive/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/GoogleDrive.png" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/GoogleSheets/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/GoogleSheets.png" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/Slack/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/Slack.png" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/Airtable/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/Airtable.png?6" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/Dropbox/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/Dropbox.png?6" width="40"></a>
  
</div> 
<br>
 
## Установка и варианты релизов ##

[![GitHub Downloads (all assets, all releases)](https://img.shields.io/github/downloads/bayselonarrend/OpenIntegrations/total?logo=github)](https://github.com/Bayselonarrend/OpenIntegrations/releases/tag/1.11.1)

<img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/icons.png" align="right">

<br><br>

#### Релизы библиотеки выходят в пяти вариантах:
- Как CLI приложение для Windows и Linux (exe, rpm, deb)
- Как XML выгрузка расширения
- Как EDT проект расширения
- Как отдельный файл расширения формата cfe
- Как OneScript пакет расширения ospx

<br/><br>

При использовании версий для 1С и OneScript, вы также можете просто скопировать код общих модулей из релизов в свой проект руками. Однако, вне зависимости от выбранного сопособа установки, получать файлы необходимо из [*Release*](https://github.com/Bayselonarrend/OpenIntegrations/releases/latest), так как в самих исходных файлах репозитория бывают промежуточные данные и функции, находящиеся в процессе разработки.

<br/>

+ Для начала работы в 1С, достаточно скачать файл CFE (или XML выгрузку), а затем подключить его как расширение в свою конфигуарцию <br>
+ Для начала работы в OneScript необходимо установить пакет

   Из хаба пакетов:
   ```powershell
       opm install oint
   ```

   Или из скачанного ospx файла:
   ```powershell
       opm install -f "./OInt-x.x.x.ospx"
   ```
<br>

+ Для начала работы с CLI (приложением для командной строки) необходимо скачать из релизов Windows-установщик или один из вариантов пакета для Linux, в зависимости от используемой операционной системы. Дополнительно требуется наличие установленного **.Net Framework 4.8** или **Mono соответствующей версии** (системные требования OneScript). При установке из `rpm` или `deb` пакетов устанавливается автоматически

   Также CLI версия доступна как пакет `oint-cli`, устанавливаемый из OPM 
   ```powershell
       opm install oint-cli
   ```


   При любом варианте установки, OInt CLI запускается командой `oint` из командной строки (при установке из Installer для Windows может потребоватья перезагрузка)

<br/>
 
>[!WARNING]
>Не рекомендуется напрямую использовать методы служебных модулей (OPI_Инструменты, OPI_Криптография) в вашем проекте (если вы собираетесь обновляться до новых версий в дальнейшем). Для сохранения обратной совместимости, количество/назначение параметров и типы возвращаемых значений для методов работы с API не изменяются, но это не применимо к служебным модулям, которые могут изменяться как угодно для оптимизации и дополнения под новые нужды. Если вам необходим функционал из служебных модулей, рекомендуется скопировать его себе отдельно.
<br/>


## Документация ##

У ОПИ есть подробная документация с примерами по адресу [https://openintegrations.dev](https://openintegrations.dev). Там вы можете найти как общие положения о начале работы с каждым конкретным API, так и описания каждого метода с примерами кода, параметров и возвращаемых значений.

![Docs](https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/docs.png?4)

CLI версия ОПИ имеет собственную встроенную справку по всем методам. Показ справки осуществляется при вызове библиотеки без метода, метода без опций или при указании опции `--help`

___
<br>

>![Infostart](https://github.com/Bayselonarrend/TelegramEnterprise/raw/main/infostart.svg)
>
>Статьи на Инфостарте:<br>
>- [Открытый пакет интеграций для популярных API: Telegram, VK, Viber, Twitter](https://infostart.ru/1c/articles/2016164/)<br>
>- [Библиотека для работы с Notion API (Open-source)](https://infostart.ru/1c/articles/2022254/)<br>
>- [Библиотека работы с Яндекс Диском: делаем простейший менеджер облака за 15 минут (Open-source)](https://infostart.ru/1c/articles/2038960/)<br>
>- [Открываем свою лавку на платформе VK Market](https://infostart.ru/public/2043994/)<br>
>- [Библиотека для работы с Google Calendar API (open-source)](https://infostart.ru/1c/articles/2049575/)<br>
>- [Telegram в режиме форума: делаем чаты комфортными](https://infostart.ru/1c/articles/2055811/)<br>
>- [Открытый пакет интеграция для OneScript](https://infostart.ru/1c/articles/2060307/)<br>
>- [Библиотека для работы с Google Drive API (open-source)](https://infostart.ru/1c/articles/2066469/)<br>
>- [OInt CLI - приложение Открытого пакета интеграций для командной строки](https://infostart.ru/1c/articles/2074205/)<br>
>- [Библиотека для работы со Slack (open-source)](https://infostart.ru/1c/articles/2099282/)<br>

<img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/heartnstar.png?1" align="right" width="384">

<br>

>- Открытый Пакет интеграций (OpenIntegrations)<br>
>Licensed under the MIT License<br>
>Список зависимостей находится в файле NOTICE<br>





