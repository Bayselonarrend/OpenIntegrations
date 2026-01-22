
 <img src="media/eng.png?1" align="left" width="32"> *This package is also available in English: [Click!](https://github.com/Bayselonarrend/OpenIntegrations/blob/main/README_ENG.md)*

<hr>

![Main](media/main.gif#gh-dark-mode-only#gh-dark-mode-only)
![Main-light](media/main-light.gif#gh-light-mode-only)


# Открытый пакет интеграций

![Версия](https://img.shields.io/badge/Версия_1С-8.3.10-yellow)
[![OpenYellow](https://openyellow.openintegrations.dev/data/badges/736878759.svg)](https://openyellow.org/grid?filter=top&repo=736878759)
[![OneScript](media/oscript.svg)](https://github.com/EvilBeaver/OneScript)
[![OneScript](media/boosty.svg)](https://boosty.to/bayselonarrend)
<br>

**OpenIntegrations** — это набор инструментов для работы с внешними API, доступный в виде библиотеки (расширения) для 1С:Предприятие / OneScript и кроссплатформенного консольного приложения для Windows и Linux. Проект предоставляет готовые методы для выполнения прикладных задач (отправки сообщения, создания документа, SQL-запросов и пр.) в более чем 30 сервисах и технологиях, включая Telegram, VK, Bitrix24, Google и Yandex-сервисы, а также различные СУБД и протоколы обмена

<br>

Код проекта организован в виде набора независимых модулей, каждый из которых отвечает за работу с конкретным сервисом. При этом общая логика, вроде работы с HTTP или JSON, вынесена в переиспользуемые компоненты. Это позволяет как быстро применять готовые функции, так и легко расширять функциональность, добавляя новые методы на базе существующих компонентов. Исходный код открыт, что дает полный контроль над реализацией и позволяет сообществу участвовать в разработке <br><br>

📋 На сегодняшний день реализованы методы для работы со следующими сервисами ([список](/media/catalogs/Catalog.md))
<br>
  <div>
  <a href="https://openintegrations.dev/docs/Instructions/Telegram/"><img src="media/Telegram.png" width="40"></a>  
  <a href="https://openintegrations.dev/docs/Instructions/Bitrix24/"><img src="media/Bitrix24.png?6" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/CDEK/"><img src="media/CDEK.png?6" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/VK/"><img src="media/VK.png" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/VKTeams/"><img src="media/VKTeams.png" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/Viber/"><img src="media/Viber.png" width="40"></a>
   <a href="https://openintegrations.dev/docs/Instructions/GreenMax/"><img src="media/GreenMax.png" width="40"></a>
   <a href="https://openintegrations.dev/docs/Instructions/GreenAPI/"><img src="media/GreenAPI.png" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/S3/"><img src="media/S3.png" width="40"></a>
   <a href="https://openintegrations.dev/docs/Instructions/PostgreSQL/"><img src="media/PostgreSQL.png" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/SQLite/"><img src="media/SQLite.png" width="40"></a>
   <a href="https://openintegrations.dev/docs/Instructions/MSSQL/"><img src="media/MSSQL.png" width="40"></a>
   <a href="https://openintegrations.dev/docs/Instructions/MySQL/"><img src="media/MySQL.png" width="40"></a>
   <a href="https://openintegrations.dev/docs/Instructions/MongoDB/"><img src="media/MongoDB.png" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/Twitter/"><img src="media/Twitter.png" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/Notion/"><img src="media/Notion.png" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/YandexDisk/"><img src="media/YandexDisk.png" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/GoogleCalendar/"><img src="media/GoogleCalendar.png" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/GoogleDrive/"><img src="media/GoogleDrive.png" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/GoogleSheets/"><img src="media/GoogleSheets.png" width="40"></a>
   <a href="https://openintegrations.dev/docs/Instructions/OpenAI/"><img src="media/OpenAI.png" width="40"></a>
   <a href="https://openintegrations.dev/docs/Instructions/Ollama/"><img src="media/Ollama.png" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/Slack/"><img src="media/Slack.png" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/Airtable/"><img src="media/Airtable.png?6" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/Dropbox/"><img src="media/Dropbox.png?6" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/Neocities/"><img src="media/Neocities.png?6" width="40"></a>
   <a href="https://openintegrations.dev/docs/Instructions/FTP/"><img src="media/FTP.png?6" width="40"></a>
   <a href="https://openintegrations.dev/docs/Instructions/SFTP/"><img src="media/sftp.png?6" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/TCP/"><img src="media/TCP.png?6" width="40"></a>
   <a href="https://openintegrations.dev/docs/Instructions/HTTP/"><img src="media/HTTP.png?6" width="40"></a>
   <a href="https://openintegrations.dev/docs/Instructions/GRPC/"><img src="media/gRPC.png?6" width="40"></a>
   <a href="https://openintegrations.dev/docs/Instructions/SSH/"><img src="media/SSH.png?6" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/RCON/"><img src="media/RCON.png?6" width="40"></a>
     
</div> 
<br>

## Пример работы

Отправка картинки в чат Telegram из 1С/OneScript

```bsl

    Токен    = "6129457865:AAFyzNYOAFbu...";
    IDЧата   = "461699897";
    Текст    = "Крутая картинка";
    Картинка = "C:/picture.jpg";  // URL, путь на диске или Двоичные данные

    Результат = OPI_Telegram.ОтправитьКартинку(Токен, IDЧата, Текст, Картинка);

```

Тоже самое, но из CLI (пример для bash)

```bash
    oint telegram ОтправитьКартинку \
        --token "6129457865:AAFyzNYOAFbu..." \
        --chat 461699897 \
        --text "Крутая картинка" \
        --picture "picture.jpg"
```

Для сохранения ответа в консоли можно использовать стандартное перенаправление `>` или опцию `--out <путь к файлу>`. Более подробно работа с CLI версией изложена в соответствующем [разделе документации](https://openintegrations.dev/docs/Start/CLI_version)

<br>
 
## Установка и варианты релизов ##

[![GitHub Downloads](https://img.shields.io/github/downloads/bayselonarrend/openintegrations/total?logo=github&logoColor=white)](https://github.com/Bayselonarrend/OpenIntegrations/releases/latest)
[![SourceForge Downloads](https://img.shields.io/sourceforge/dw/openintegrations?logo=sourceforge&logoColor=white&color=orange)](https://sourceforge.net/projects/openintegrations/)

<img src="media/icons.png" align="right">

<br><br>

#### Релизы библиотеки выходят в пяти вариантах:
- Как CLI приложение для Windows и Linux (exe, rpm, deb)
- Как XML выгрузка расширения
- Как EDT проект расширения
- Как отдельный файл расширения формата cfe
- Как [OneScript](https://github.com/EvilBeaver/OneScript) пакет расширения ospx

<br/><br>

При использовании версий для 1С и OneScript, вы также можете просто скопировать код общих модулей в свой проект руками. Однако, вне зависимости от выбранного способа установки, рекомендуется получать файлы из [*Release*](https://github.com/Bayselonarrend/OpenIntegrations/releases/latest) или [*stable-ветки*](https://github.com/Bayselonarrend/OpenIntegrations/tree/stable) репозитория, так как в исходных файлах основной ветки бывают промежуточные данные и функции, находящиеся в процессе разработки.


Варианты для быстрого начала работы:

+ Для начала работы в 1С достаточно [скачать](https://github.com/Bayselonarrend/OpenIntegrations/releases/latest) CFE файл (или XML выгрузку) расширения и загрузить его в список расширений своей конфигурации <br>
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

+ Для начала работы с CLI (приложением для командной строки) необходимо [скачать из релизов](https://github.com/Bayselonarrend/OpenIntegrations/releases/latest) Windows-установщик или один из вариантов пакета для Linux, в зависимости от используемой операционной системы

   Также CLI версия доступна как пакет `oint-cli`, устанавливаемый из OPM 
   ```powershell
       opm install oint-cli
   ```


   При любом варианте установки, OInt CLI запускается командой `oint` из командной строки (при установке из Installer для Windows может потребоваться перезагрузка)

<br/>

## Документация ##

У ОПИ есть подробная документация с примерами по адресу [openintegrations.dev](https://openintegrations.dev). Там вы можете найти как общие положения о начале работы с каждым конкретным API, так и описания каждого метода с примерами кода, параметров и возвращаемых значений.

![Docs](media/docs.png?4)

CLI версия ОПИ имеет собственную встроенную справку по всем методам. Показ справки осуществляется при вызове библиотеки без метода, метода без опций или при указании опции `--help`

## Спонсоры [?](https://boosty.to/bayselonarrend/purchase/3429871?ssource=DIRECT&share=subscription_link)
Представленные ниже компании поддерживают разработку Открытого пакета интеграций и вносят существенный вклад в его развитие

||
|-|
| <img width="100" height="120" alt="Logo_GREEN-API_значок G_зеленый" src="docs/docusaurus/static/img/Sponsors/GreenAPI.png" /> |
| **GreenAPI** <br/> Стабильный шлюз <br/> WhatsApp API <br/> <br/>  [green-api.com](https://green-api.com/) 🌍 |

<br/>

## Поддержать проект

Если вам нравится этот или другие мои проекты, то вы можете поддержать меня [на Boosty](https://boosty.to/bayselonarrend) (регулярно или единоразово). При подписке от 500 рублей открывается доступ в приватный Telegram-чат, где можно задать интересующие вопросы о проекте и получить помощь от меня напрямую. Также присутствует спонсорская подписка для компаний с приоритетной поддержкой и размещением логотипа в списке спонсоров

**Спасибо за вашу поддержку!**



___
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
>- [Библиотека для работы с Google Sheets (open-source)](https://infostart.ru/1c/articles/2102248/)<br>
>- [Библиотека для работы с Airtable (open-source)](https://infostart.ru/1c/articles/2106649/)<br>
>- [Библиотека для работы с Dropbox (open-source)](https://infostart.ru/1c/articles/2123857/)<br>
>- [Мастерская ОПИ: большой мануал по работе с Telegram](https://infostart.ru/1c/articles/2135517/)<br>
>- [Библиотека для работы с Bitrix24: живая лента, задачи, файлы и личные сообщения](https://infostart.ru/1c/articles/2148213/)<br>
>- [Работа с онлайн сервисами из консоли через OInt CLI](https://infostart.ru/1c/articles/2159665/)<br>
>- [Библиотека для работы с VKTeams (open-source)](https://infostart.ru/1c/articles/2170692/)<br>
>- [Управление товарами и остатками Ozon (open-source)](https://infostart.ru/1c/articles/2187012/)<br>
>- [Библиотека для работы со CDEK (open-source)](https://infostart.ru/1c/articles/2216121/)<br>
>- [Библиотека для работы с S3: AWS, MinIO и прочим (open-source)](https://infostart.ru/1c/articles/2244019/)<br>
>- [TCP-клиент в 1С (open-source)](https://infostart.ru/1c/articles/2272364/)<br>
>- [Коннектор SQLite для 1С (open-source)](https://infostart.ru/1c/articles/2276707/)<br>
>- [Мастерская ОПИ: мануал по работе с S3 в 1С](https://infostart.ru/1c/articles/2288171/)<br>
>- [Коннектор PostgreSQL для 1С и OneScript (open-source)](https://infostart.ru/1c/articles/2314338/)<br>
>- [Библиотека для работы с WhatsApp через GreenAPI (open-source)](https://infostart.ru/1c/articles/2327294/)<br>



<br>

>- Открытый Пакет интеграций (OpenIntegrations)<br>
>Licensed under the MIT License<br>
>Список зависимостей находится в файле NOTICE<br>
<details>
<summary>Синопсис</summary>
<br>

Этот проект предоставляет библиотеку для интеграции 1С:Предприятие, OneScript и CLI с внешними сервисами через REST API и другие протоколы. Благодаря представленным в ней методам вы можете работать в экосистеме 1С:Предприятие с такими сервисами и технологиями как: Airtable, Bitrix24, CDEK, ClickHouse, Dropbox, FTP(S), Google Calendar, Google Drive, Google Sheets, GreenAPI (WhatsApp), GreenAPI (Max), gRPC, MongoDB, MS SQL, MySQL, Neocities, Notion, Ollama, OpenAI, PostgreSQL, RCON, AWS S3, SFTP, Slack, SQLite, SSH, TCP, Telegram, Twitter (X), Viber, VK, VK Teams, Yandex.Disk, HTTP
  
Существуют варианты поставки в виде расширения (.cfe, XML, EDT), OPM-пакета и других пакетов для разных операционных систем. Версия 1С: 8.3.10. Подходит для любых конфигураций, не использует БСП

</details>
