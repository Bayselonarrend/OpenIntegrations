
 <img src="media/eng.png?1" align="left" width="32"> *This package is also available in English: [Click!](https://github.com/Bayselonarrend/OpenIntegrations/blob/main/README_ENG.md)*

<hr>

![Main](media/main.gif#gh-dark-mode-only#gh-dark-mode-only)
![Main-light](media/main-light.gif#gh-light-mode-only)


# Открытый пакет интеграций

![Версия](https://img.shields.io/badge/Версия_1С-8.3.10-yellow)
[![OpenYellow](https://img.shields.io/endpoint?url=https://openyellow.org/data/badges/2/736878759.json)](https://openyellow.org/grid?data=top&repo=736878759)
[![OneScript](media/oscript.svg)](https://github.com/EvilBeaver/OneScript)

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
   <a href="https://openintegrations.dev/docs/Instructions/MySQL/"><img src="media/MySQL.png" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/Twitter/"><img src="media/Twitter.png" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/Notion/"><img src="media/Notion.png" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/YandexDisk/"><img src="media/YandexDisk.png" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/GoogleCalendar/"><img src="media/GoogleCalendar.png" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/GoogleDrive/"><img src="media/GoogleDrive.png" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/GoogleSheets/"><img src="media/GoogleSheets.png" width="40"></a>
   <a href="https://openintegrations.dev/docs/Instructions/Ollama/"><img src="media/Ollama.png" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/Slack/"><img src="media/Slack.png" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/Airtable/"><img src="media/Airtable.png?6" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/Dropbox/"><img src="media/Dropbox.png?6" width="40"></a>
  <a href="https://openintegrations.dev/docs/Instructions/Neocities/"><img src="media/Neocities.png?6" width="40"></a>
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

 <a href="https://github.com/Bayselonarrend/OpenIntegrations/releases/latest">
<img src="https://img.shields.io/github/downloads/bayselonarrend/OpenIntegrations/total?logo=github"  />
</a>


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
<br/>


## Документация ##

У ОПИ есть подробная документация с примерами по адресу [https://openintegrations.dev](https://openintegrations.dev). Там вы можете найти как общие положения о начале работы с каждым конкретным API, так и описания каждого метода с примерами кода, параметров и возвращаемых значений.

![Docs](media/docs.png?4)

CLI версия ОПИ имеет собственную встроенную справку по всем методам. Показ справки осуществляется при вызове библиотеки без метода, метода без опций или при указании опции `--help`


<br>

## Поддержать проект ##
<img src="media/heartnstar.png?4" align="right" width="320">

Если вам нравится проект OpenIntegrations и вы хотите его поддержать, то можете сделать это одним из следующих способов:

+ Поставить ⭐ этому репозиторию
+ Поставить `+` на статьи про ОПИ [на Инфостарт](https://infostart.ru/profile/1793672/)

При желании, вы также можете помочь проекту материально через Tribute или YooMoney, нажав на один из значков ниже или по ссылкам, которые находятся в правой части страницы

<a href="https://t.me/tribute/app?startapp=dnje"><img src="media/tribute.png" width="40"></a>
<a href="https://yoomoney.ru/to/4100117914332065"><img src="media/yoomoney.png" width="40"></a>

**Спасибо за вашу поддержку!**

<br>

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
