<img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/logo.png?v1" style="height: 256px; width: 256px;">

# Открытый пакет интеграций
[![Статус порога качества](http://api.athenaeum.digital/Sonar/api/project_badges/measure?project=OpenIntegrations&metric=alert_status)](http://api.athenaeum.digital/Sonar/dashboard?id=OpenIntegrations)
![Версия](https://img.shields.io/badge/Версия_1С-8.3.9-yellow)
[![OpenYellow](https://img.shields.io/endpoint?url=https://openyellow.neocities.org/badges/2/736878759.json)](https://openyellow.notion.site/openyellow/24727888daa641af95514b46bee4d6f2?p=f78cea2066114067ab9069f06206219d&amp;pm=s)

<br>
Набор инструментов для интеграции с популярными API посредством CLI (Windows/Linux) и библиотека для 1C:Enterprise/OneScript <br>


<br>

Реализованные методы выполняют конечные задачи (вроде ОтправитьСообщение или СоздатьПост), что позволяет использовать их без углубления в реализацию. Однако, код, при этом, достаточно сильно декомпозирован - методы авторизации, получения данных и пр. по возможности вынесены в отдельные функции. Это позволяет легко добавлять новые методы, даже если они еще не реализованы в самой библиотеке на текущий момент. <br><br>

На данный момент реализованы методы для работы со следующими API:
<br>
  <div>
  <a href="https://openintegrations.dev/docs/Telegram/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/Telegram.png" width="32"></a>
  <a href="https://openintegrations.dev/docs/VK/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/VK.png" width="32"></a>
  <a href="https://openintegrations.dev/docs/Viber/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/Viber.png" width="32"></a>
  <a href="https://openintegrations.dev/docs/Twitter/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/Twitter.png" width="32"></a>
  <a href="https://openintegrations.dev/docs/Notion/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/Notion.png" width="32"></a>
  <a href="https://openintegrations.dev/docs/Yandex_Disk/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/YandexDisk.png" width="32"></a>
  <a href="https://openintegrations.dev/docs/Google_Calendar/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/GoogleCalendar.png" width="32"></a>
  <a href="https://openintegrations.dev/docs/Google_Drive/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/GoogleDrive.png" width="32"></a>
  <a href="https://openintegrations.dev/docs/Google_Sheets/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/GoogleSheets.png" width="32"></a>
  <a href="https://openintegrations.dev/docs/Slack/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/Slack.png" width="32"></a>
    <a href="https://openintegrations.dev/docs/Airtable/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/Airtable.png?6" width="32"></a>
</div> 
<br>
 
## Релизы ##

[![GitHub Downloads (all assets, all releases)](https://img.shields.io/github/downloads/bayselonarrend/OpenIntegrations/total?logo=github)](https://github.com/Bayselonarrend/OpenIntegrations/releases/latest)

Релизы библиотеки выходят в пяти вариантах: 
- Как CLI приложение для Windows и Linux (exe, rpm, deb)
- Как XML файлы расширения для загрузки через конфигуратор
- Как EDT проект расширения
- Как отдельный файл расширения формата cfe
- Как OneScript пакет расширения ospx

<br/>

При использовании версий для 1С и OneScript, вы также можете просто скопировать код общих модулей из релизов в свой проект руками. Однако, вне зависимости от выбранного сопособа установки, получать файлы необходимо из Release, так как в самих исходных файлах репозитория бывают промежуточные данные и функции, находящиеся в процессе разработки.

<br/>

Для начала работы в OneScript дополнительно необходимо установить пакет

<br/>

Из хаба пакетов:
```powershell
    opm install oint
```

Или из скачанного ospx файла:
```powershell
    opm install -f "./OInt-x.x.x.ospx"
```
<br>

CLI версия дополнительно требует **.Net Framework 4.8** или **Mono соответствующей версии**. При установке из rpm или deb пакетов устанавливается автоматически

<br/>
 
>[!WARNING]
>Не рекомендуется напрямую использовать методы служебных модулей (OPI_Инструменты, OPI_Криптография) в вашем проекте (если вы собираетесь обновляться до новых версий в дальнейшем). Для сохранения обратной совместимости, количество/назначение параметров и типы возвращаемых значений для методов работы с API не изменяются, но это не применимо к служебным модулям, которые могут изменяться как угодно для оптимизации и дополнения под новые нужды. Если вам необходим функционал из служебных модулей, рекомендуется скопировать его себе отдельно.
<br/>


## Документация ##

У ОПИ есть подробная документация с примерами по адресу [https://openintegrations.dev](https://openintegrations.dev). Там вы можете найти как общие положения о начале работы с каждым конкретным API, так и описания каждого метода с примерами кода, параметров и возвращаемых значений.

![Docs](https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/docs.png)

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


>- Открытый Пакет интеграций (OpenIntegrations)<br>
>Licensed under the MIT License<br>
>Список зависимостей находится в файле NOTICE<br>





