
 <img src="media/eng.png?1" align="left" width="32"> *This package is also available in English: [Click!](https://github.com/Bayselonarrend/OpenIntegrations/blob/main/README_ENG.md)*

<hr>

![Main](media/main.gif#gh-dark-mode-only#gh-dark-mode-only)
![Main-light](media/main-light.gif#gh-light-mode-only)


# Открытый пакет интеграций

![Версия](https://img.shields.io/badge/Версия_1С-8.3.10-yellow)
[![OpenYellow](https://img.shields.io/endpoint?url=https://openyellow.org/data/badges/2/736878759.json)](https://openyellow.org/grid?data=top&repo=736878759)
[![OneScript](media/oscript.svg)](https://github.com/EvilBeaver/OneScript)
[![OneScript](media/boosty.svg)](https://boosty.to/bayselonarrend)

<br>
Набор инструментов интеграции с популярными API: консольное приложение (Windows/Linux) и библиотека (расширение) для 1C:Enterprise/OneScript, состоящие из общего набора готовых функций для работы с множеством известных облачных сервисов<br>


<br>

Все реализованные методы из набора выполняют отдельные прикладные задачи, вроде `ОтправитьСообщение` или `СоздатьПост`, что позволяет использовать их без углубления в реализацию. Но код, при этом, достаточно сильно декомпозирован: методы авторизации, получения данных и пр. по возможности вынесены в отдельные функции. Это позволяет легко добавлять новые методы на основе уже существующих, не разматывая клубок реализации до самого начала работы с API. <br><br>

На сегодняшний день реализован инструментарий для работы со следующими сервисами:
<br>
  <div>
  <a href="https://openintegrations.dev/docs/Instructions/Telegram/"><img src="media/Telegram.png" width="40"></a>  
  <a href="https://openintegrations.dev/docs/Instructions/Bitrix24/"><img src="media/Bitrix24.png?6" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/CDEK/"><img src="media/CDEK.png?6" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/VK/"><img src="media/VK.png" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/VKTeams/"><img src="media/VKTeams.png" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/Viber/"><img src="media/Viber.png" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/Ozon/"><img src="media/Ozon.png" width="40"></a>
   <a href="https://openintegrations.dev/docs/Instructions/GreenAPI/"><img src="media/GreenAPI.png" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/S3/"><img src="media/S3.png" width="40"></a>
   <a href="https://openintegrations.dev/docs/Instructions/PostgreSQL/"><img src="media/PostgreSQL.png" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/SQLite/"><img src="media/SQLite.png" width="40"></a>
   <a href="https://openintegrations.dev/docs/Instructions/MSSQL/"><img src="media/MSSQL.png" width="40"></a>
   <a href="https://openintegrations.dev/docs/Instructions/MySQL/"><img src="media/MySQL.png" width="40"></a>
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
  <a href="https://openintegrations.dev/docs/Instructions/TCP/"><img src="media/TCP.png?6" width="40"></a>
   <a href="https://openintegrations.dev/docs/Instructions/HTTP/"><img src="media/HTTP.png?6" width="40"></a>
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

При использовании версий для 1С и OneScript, вы также можете просто скопировать код общих модулей из релизов в свой проект руками. Однако, вне зависимости от выбранного сопособа установки, получать файлы необходимо из [Release](https://github.com/Bayselonarrend/OpenIntegrations/releases/latest), так как в самих исходных файлах репозитория бывают промежуточные данные и функции, находящиеся в процессе разработки.

<br/>

+ Для начала работы в 1С достаточно скачать CFE файл (или XML выгрузку) расширения и загрузить его в список расширений своей конфигуарции <br>
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

+ Для начала работы с CLI (приложением для командной строки) необходимо скачать из релизов Windows-установщик или один из вариантов пакета для Linux, в зависимости от используемой операционной системы

   Также CLI версия доступна как пакет `oint-cli`, устанавливаемый из OPM 
   ```powershell
       opm install oint-cli
   ```


   При любом варианте установки, OInt CLI запускается командой `oint` из командной строки (при установке из Installer для Windows может потребоватья перезагрузка)

<br/>
 
>[!WARNING]
>Также, для CLI приложения существует поставка единым exe-файлом. Для его запуска требуется .Net Framework 4.8 или Mono соответствующей версии. 
>Данный вариант поставки имеет проблемы с производительностью, поэтому рекомендуется использовать его только в том случае, если использование других вариантов на целевой системе нежелательно или невозможно


## Документация ##

У ОПИ есть подробная документация с примерами по адресу [https://openintegrations.dev](https://openintegrations.dev). Там вы можете найти как общие положения о начале работы с каждым конкретным API, так и описания каждого метода с примерами кода, параметров и возвращаемых значений.

![Docs](media/docs.png?4)

CLI версия ОПИ имеет собственную встроенную справку по всем методам. Показ справки осуществляется при вызове библиотеки без метода, метода без опций или при указании опции `--help`

## Спонсоры [?](https://boosty.to/bayselonarrend/purchase/3429871?ssource=DIRECT&share=subscription_link)
Представленные ниже компании поддерживают разработку Открытого пакета интеграций и вносят существенный вклад в его развитие

||
|-|
| <img width="100" height="120" alt="Logo_GREEN-API_значок G_зеленый" src="https://github.com/user-attachments/assets/df7802ad-d107-47d5-881e-ba900bf5ea6b" /> |
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
<summary>Облако тэгов</summary>
<br>
	
 - Airtable для 1С:Предприятие и OneScript
 - Работа с Airtable для 1С
 - Интеграция с Airtable в 1С
 - Bitrix24 для 1С:Предприятие и OneScript
 - Работа с Bitrix24 для 1С
 - Интеграция с Bitrix24 в 1С
 - CDEK для 1С:Предприятие и OneScript
 - Работа с CDEK для 1С
 - Интеграция с CDEK в 1С
 - Dropbox для 1С:Предприятие и OneScript
 - Работа с Dropbox для 1С
 - Интеграция с Dropbox в 1С
 - FTP для 1С:Предприятие и OneScript
 - Работа с FTP для 1С
 - Интеграция с FTP в 1С
 - Google Calendar для 1С:Предприятие и OneScript
 - Работа с Google Calendar для 1С
 - Интеграция с Google Calendar в 1С
 - Google Drive для 1С:Предприятие и OneScript
 - Работа с Google Drive для 1С
 - Интеграция с Google Drive в 1С
 - Google Sheets для 1С:Предприятие и OneScript
 - Работа с Google Sheets для 1С
 - Интеграция с Google Sheets в 1С
 - Green API для 1С:Предприятие и OneScript
 - Работа с Green API для 1С
 - Интеграция с Green API в 1С
 - MSSQL для 1С:Предприятие и OneScript
 - Работа с MSSQL для 1С
 - Интеграция с MSSQL в 1С
 - MySQL для 1С:Предприятие и OneScript
 - Работа с MySQL для 1С
 - Интеграция с MySQL в 1С
 - Neocities для 1С:Предприятие и OneScript
 - Работа с Neocities для 1С
 - Интеграция с Neocities в 1С
 - Notion для 1С:Предприятие и OneScript
 - Работа с Notion для 1С
 - Интеграция с Notion в 1С
 - Ozon для 1С:Предприятие и OneScript
 - Работа с Ozon для 1С
 - Интеграция с Ozon в 1С
 - PostgreSQL для 1С:Предприятие и OneScript
 - Работа с PostgreSQL для 1С
 - Интеграция с PostgreSQL в 1С
 - RCON для 1С:Предприятие и OneScript
 - Работа с RCON для 1С
 - Интеграция с RCON в 1С
 - ReportPortal для 1С:Предприятие и OneScript
 - Работа с ReportPortal для 1С
 - Интеграция с ReportPortal в 1С
 - S3 для 1С:Предприятие и OneScript
 - Работа с S3 для 1С
 - Интеграция с S3 в 1С
 - SFTP для 1С:Предприятие и OneScript
 - Работа с SFTP для 1С
 - Интеграция с SFTP в 1С
 - Slack для 1С:Предприятие и OneScript
 - Работа с Slack для 1С
 - Интеграция с Slack в 1С
 - SQLite для 1С:Предприятие и OneScript
 - Работа с SQLite для 1С
 - Интеграция с SQLite в 1С
 - SSH для 1С:Предприятие и OneScript
 - Работа с SSH для 1С
 - Интеграция с SSH в 1С
 - TCP для 1С:Предприятие и OneScript
 - Работа с TCP для 1С
 - Интеграция с TCP в 1С
 - Telegram для 1С:Предприятие и OneScript
 - Работа с Telegram для 1С
 - Интеграция с Telegram в 1С
 - Twitter для 1С:Предприятие и OneScript
 - Работа с Twitter для 1С
 - Интеграция с Twitter в 1С
 - Viber для 1С:Предприятие и OneScript
 - Работа с Viber для 1С
 - Интеграция с Viber в 1С
 - VK для 1С:Предприятие и OneScript
 - Работа с VK для 1С
 - Интеграция с VK в 1С
 - VKTeams для 1С:Предприятие и OneScript
 - Работа с VKTeams для 1С
 - Интеграция с VKTeams в 1С
 - Yandex Disk для 1С:Предприятие и OneScript
 - Работа с Yandex Disk для 1С
 - Интеграция с Yandex Disk в 1С
  
</details>
