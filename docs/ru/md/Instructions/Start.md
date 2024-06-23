---
id: Start
sidebar_class_name: NachaloRaboty
---

# Добро пожаловать!

![OPI](../../static/img/logo_long.png)

**Открытый пакет интеграций** - набор инструментов для интеграции с некоторыми популярными API посредством CLI, 1C:Enterprise или OneScript. Он состоит из общих модулей, каждый из которых отвечает за свой API, а также нескольких модулей-инструментов, общих для всех. 

Реализованные методы выполняют конечные задачи (вроде *ОтправитьСообщение()* или *СоздатьПост()*), что позволяет использовать их без углубления в реализацию. Однако, код, при этом, достаточно сильно декомпозирован - методы авторизации, получения данных и пр. по возможности вынесены в отдельные функции. Это позволяет легко добавлять новые методы, даже если они еще не реализованы в самой библиотеке на текущий момент.

<br/>

Быстрый переход по документации
  <div>
  <a href="https://openintegrations.dev/docs/Telegram/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/Telegram.png" width="40"/></a>
  <a href="https://openintegrations.dev/docs/VK/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/VK.png" width="40"/></a>
  <a href="https://openintegrations.dev/docs/Viber/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/Viber.png" width="40"/></a>
  <a href="https://openintegrations.dev/docs/Twitter/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/Twitter.png" width="40"/></a>
  <a href="https://openintegrations.dev/docs/Notion/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/Notion.png" width="40"/></a>
  <a href="https://openintegrations.dev/docs/Yandex_Disk/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/YandexDisk.png" width="40"/></a>
  <a href="https://openintegrations.dev/docs/Google_Calendar/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/GoogleCalendar.png" width="40"/></a>
  <a href="https://openintegrations.dev/docs/Google_Drive/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/GoogleDrive.png" width="40"/></a>
  <a href="https://openintegrations.dev/docs/Google_Sheets/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/GoogleSheets.png" width="40"/></a>
  <a href="https://openintegrations.dev/docs/Slack/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/Slack.png" width="40"/></a>
  <a href="https://openintegrations.dev/docs/Airtable/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/Airtable.png?6" width="40"/></a>
   <a href="https://openintegrations.dev/docs/Dropbox/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/Dropbox.png?6" width="40"/></a>
</div> 

<br/>

## Начало работы

Релизы библиотеки выходят в пяти вариантах: 

- Как CLI приложение для Windows и Linux (exe, rpm, deb)
- Как XML файлы расширения для загрузки через конфигуратор
- Как EDT проект расширения
- Как отдельный файл расширения формата cfe
- Как OneScript пакет расширения ospx

Вне зависимости от выбранного сопособа установки, получать файлы необходимо из [Release](https://github.com/Bayselonarrend/OpenIntegrations/releases), так как в самих файлах репозитория бывают промежуточные данные и функции, находящиеся в процессе разработки. 

Подробнее о каждом варианте релиза в разделе [Про варианты релизов](/docs/Start/Release-variants)

<br/>

## Структура модулей

Общие модули проекта бывают двух видов: 

- Служебные 
	- OPI_Инструменты
	- OPI_Криптография
- Модули непосредственной работы с API
	- OPI_Telegram, OPI_VK...
	
:::warning
Не рекомендуется использовать методы служебных модулей в других местах вашей конфигурации (если вы собираетесь обновляться до новых версий в дальнейшем). Для сохранения обратной совместимости, количество/назначение параметров и типы возвращаемых значений для методов работы с API не изменяются, но это не применимо к служебным модулям, которые могут изменяться как угодно для оптимизации и дополнения под новые нужды. Если вам необходим функционал из служебных модулей, рекомендуется скопировать его себе отдельно.
:::
