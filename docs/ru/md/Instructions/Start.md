---
id: Start
sidebar_class_name: NachaloRaboty
keywords: [1C, 1С, 1С:Предприятие, 1С:Предприятие 8.3, API, Интеграция, Сервисы, Обмен, OneScript, CLI, HTTP, Расширение]
---

# Добро пожаловать!

![OPI](../../static/img/logo_long.webp)

**Открытый пакет интеграций** - набор инструментов для интеграции с некоторыми популярными API посредством CLI, 1C:Enterprise или OneScript. Он состоит из общих модулей, каждый из которых отвечает за свой API, а также нескольких модулей-инструментов, общих для всех. 

Реализованные методы выполняют конечные задачи (вроде `ОтправитьСообщение()` или `СоздатьПост()`), что позволяет использовать их без углубления в реализацию. Однако, код, при этом, достаточно сильно декомпозирован - методы авторизации, получения данных и пр. по возможности вынесены в отдельные функции. Это позволяет легко добавлять новые методы, даже если они еще не реализованы в самой библиотеке на текущий момент.

<br/>

Быстрый переход по документации:
  <div>
 <a href="/docs/Instructions/Telegram/"><img src={require('../../static/img/APIs/Telegram.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/Bitrix24/"><img src={require('../../static/img/APIs/Bitrix24.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/CDEK/"><img src={require('../../static/img/APIs/CDEK.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/VK/"><img src={require('../../static/img/APIs/VK.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/VKTeams/"><img src={require('../../static/img/APIs/VKTeams.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/Viber/"><img src={require('../../static/img/APIs/Viber.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/Ozon/"><img src={require('../../static/img/APIs/Ozon.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/GreenAPI/"><img src={require('../../static/img/APIs/GreenAPI.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/S3/"><img src={require('../../static/img/APIs/S3.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/PostgreSQL/"><img src={require('../../static/img/APIs/PostgreSQL.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/SQLite/"><img src={require('../../static/img/APIs/SQLite.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/MySQL/"><img src={require('../../static/img/APIs/MySQL.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/Twitter/"><img src={require('../../static/img/APIs/Twitter.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/Notion/"><img src={require('../../static/img/APIs/Notion.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/YandexDisk/"><img src={require('../../static/img/APIs/YandexDisk.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/GoogleCalendar/"><img src={require('../../static/img/APIs/GoogleCalendar.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/GoogleDrive/"><img src={require('../../static/img/APIs/GoogleDrive.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/GoogleSheets/"><img src={require('../../static/img/APIs/GoogleSheets.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/Ollama/"><img src={require('../../static/img/APIs/Ollama.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/Slack/"><img src={require('../../static/img/APIs/Slack.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/Airtable/"><img src={require('../../static/img/APIs/Airtable.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/Dropbox/"><img src={require('../../static/img/APIs/Dropbox.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/Neocities/"><img src={require('../../static/img/APIs/Neocities.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/TCP/"><img src={require('../../static/img/APIs/TCP.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/HTTP/"><img src={require('../../static/img/APIs/HTTP.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/RCON/"><img src={require('../../static/img/APIs/RCON.png').default} width="32" class="wp_logo"/></a>
</div> 

<br/>

## Начало работы

Релизы библиотеки выходят в пяти вариантах: 

- Как CLI приложение для Windows и Linux (exe, rpm, deb)
- Как XML файлы расширения для загрузки через конфигуратор
- Как EDT проект расширения
- Как отдельный файл расширения формата cfe
- Как OneScript пакет расширения ospx

Вне зависимости от выбранного способа установки, получать файлы необходимо из [Release](https://github.com/Bayselonarrend/OpenIntegrations/releases), так как в самих файлах репозитория бывают промежуточные данные и функции, находящиеся в процессе разработки. 

Подробнее о каждом варианте релиза в разделе [Про варианты релизов](/docs/Start/Release-variants)

<hr/>

## Примеры использования

В качестве расширения 1С и OneScript пакета, Открытый пакет интеграций представляет из себя набор общих модулей с экспортными методами - по одному модулю на каждый из API. Все доступные методы являются функциями, т.е. возвращают значения. Как правило, это *Соответствия*, описывающие JSON ответа сервера, но также могут быть *Двоичные данные* (например, в методах скачивания файла) или *строки* (например в методах получения URL). Типы возвращаемых значений описаны для каждого метода в текущей документации и докумментирующих комментариях в самом коде библиотеки

Простой пример использования ОПИ - отправка картинки в Telegram:

```bsl

    Токен    = "6129457865:AAFyzNYOAFbu...";
    IDЧата   = "461699897";
    Текст    = "Крутая картинка";
    Картинка = "C:/picture.jpg";  // URL, путь на диске или Двоичные данные

    Результат = OPI_Telegram.ОтправитьКартинку(Токен, IDЧата, Текст, Картинка);

```

Реализация ОПИ как CLI приложения, в свою очередь, повторяет функционал расширения и предоставляет доступ ко всем его методам из командной строки. Каждому параметру оригинальной функции соответствует опция, начинающаяся с символов `--`, например `--token`. Эти соответствия для каждого конкретного метода можно найти в текущей документации, а также в комментариях к функциям 1С/OneScript и встроенной справке приложения (справка по методу отображается при вызове необходимого метода без параметров, подробнее см. [Работа с CLI версией](/docs/Start/CLI_version))

Пример для CLI:

```bash

    oint telegram ОтправитьКартинку \
        --token "6129457865:AAFyzNYOAFbu..." \
        --chat 461699897 \
        --text "Крутая картинка" \
        --picture "picture.jpg"

```

<hr/>

## О работе с текущей документацией

Некоторые особенности данной документации, знание которых поможет использовать ее более эффективно и избежать недопониманий:

1. **Каждый метод имеет свою страницу-описание**. Как правило, заголовок страницы-описания совпадает с именем метода (с добавлением пробелов) и находится в подразделе, имя которого совпадает с именем области программного модуля. Если вы не можете найти страницу для конкретной интересующей вас функции, то попробуйте воспользоваться встроенным полнотекстовым поиском в правом верхнем углу

2. **Параметры типа ДвоичныеДанные могут быть определены как пути к файлам или URL**. Зачастую, для параметров с типом данных *ДвоичныеДанные*, в примерах кода документации используются URL или пути к файлам на диске. Это допустимое поведение, так как в начале всех функций входящие параметры преобразуются (по возможности) к необходимым типам. В случае с двоичными данными, например, при передаче строки, будет выполнена попытка найти файл на диске, получить его из интернета или преобразовать из Base64

3. **Примеры результатов функций приведены в формате JSON, но в 1С и OS это будут Соответствия**. Если в примере результата на странице-описании функции приведен JSON, то в 1С и OneScript это будет *Соответствие* - т.е. ответ будет десериализован. JSON строкой возвращается только в CLI версии

<hr/>

<div class="theme-admonition theme-admonition-info admonition_node_modules-@docusaurus-theme-classic-lib-theme-Admonition-Layout-styles-module alert alert--info">

## Поддержать проект

<img src={require('../../static/img/heartnstar.png').default} width='320px' align="right" class="hearthnstar"/>

Если вам нравится проект OpenIntegrations и вы хотите его поддержать, то можете сделать это одним из следующих способов:

+ Поставить ⭐ [этому репозиторию](https://github.com/Bayselonarrend/OpenIntegrations)
+ Поставить `+` на статьи про ОПИ [на Инфостарт](https://infostart.ru/profile/1793672/)

При желании, вы также можете помочь проекту материально через Tribute или YooMoney, нажав на один из значков ниже или по ссылкам, которые находятся в правой части страницы репозитория на GitHub

<a href="https://t.me/tribute/app?startapp=dnje"><img src={require('../../static/img/tribute.png').default} width='40px' /></a>
<a href="https://yoomoney.ru/to/4100117914332065"><img src={require('../../static/img/yoomoney.png').default} width='40px' /></a>

**Спасибо за вашу поддержку!**

</div>