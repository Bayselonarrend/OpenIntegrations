---
id: Start
sidebar_class_name: NachaloRaboty
---

# Добро пожаловать!

![OPI](../../static/img/logo_long.png)

**Открытый пакет интеграций** - набор инструментов для интеграции с некоторыми популярными API посредством CLI, 1C:Enterprise или OneScript. Он состоит из общих модулей, каждый из которых отвечает за свой API, а также нескольких модулей-инструментов, общих для всех. 

Реализованные методы выполняют конечные задачи (вроде *ОтправитьСообщение()* или *СоздатьПост()*), что позволяет использовать их без углубления в реализацию. Однако, код, при этом, достаточно сильно декомпозирован - методы авторизации, получения данных и пр. по возможности вынесены в отдельные функции. Это позволяет легко добавлять новые методы, даже если они еще не реализованы в самой библиотеке на текущий момент.

<br/>

Быстрый переход по документации:
  <div>
  <a href="/docs/Instructions/Telegram/"><img src={require('../../static/img/APIs/Telegram.png').default} width="32" class="wp_logo"/></a>
  <a href="/docs/Instructions/VK/"><img src={require('../../static/img/APIs/VK.png').default} width="32" class="wp_logo"/></a>
  <a href="/docs/Instructions/VKTeams/"><img src={require('../../static/img/APIs/VKTeams.png').default} width="32" class="wp_logo"/></a>
  <a href="/docs/Instructions/Viber/"><img src={require('../../static/img/APIs/Viber.png').default} width="32" class="wp_logo"/></a>
  <a href="/docs/Instructions/Twitter/"><img src={require('../../static/img/APIs/Twitter.png').default} width="32" class="wp_logo"/></a>
  <a href="/docs/Instructions/Notion/"><img src={require('../../static/img/APIs/Notion.png').default} width="32" class="wp_logo"/></a>
  <a href="/docs/Instructions/YandexDisk/"><img src={require('../../static/img/APIs/YandexDisk.png').default} width="32" class="wp_logo"/></a>
  <a href="/docs/Instructions/GoogleCalendar/"><img src={require('../../static/img/APIs/GoogleCalendar.png').default} width="32" class="wp_logo"/></a>
  <a href="/docs/Instructions/GoogleDrive/"><img src={require('../../static/img/APIs/GoogleDrive.png').default} width="32" class="wp_logo"/></a>
  <a href="/docs/Instructions/GoogleSheets/"><img src={require('../../static/img/APIs/GoogleSheets.png').default} width="32" class="wp_logo"/></a>
  <a href="/docs/Instructions/Slack/"><img src={require('../../static/img/APIs/Slack.png').default} width="32" class="wp_logo"/></a>
  <a href="/docs/Instructions/Airtable/"><img src={require('../../static/img/APIs/Airtable.png').default} width="32" class="wp_logo"/></a>
  <a href="/docs/Instructions/Dropbox/"><img src={require('../../static/img/APIs/Dropbox.png').default} width="32" class="wp_logo"/></a>
  <a href="/docs/Instructions/Bitrix24/"><img src={require('../../static/img/APIs/Bitrix24.png').default} width="32" class="wp_logo"/></a>
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
