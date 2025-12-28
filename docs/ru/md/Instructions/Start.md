---
id: Start
sidebar_class_name: NachaloRaboty
keywords: [1C, 1С, 1С:Предприятие, 1С:Предприятие 8.3, API, Интеграция, Сервисы, Обмен, OneScript, CLI, HTTP, Расширение]
---

# Добро пожаловать!

![OPI](../../static/img/logo_long.webp)

**OpenIntegrations** — это набор инструментов для работы с внешними API, доступный в виде библиотеки (расширения) для 1С:Предприятие / OneScript и кроссплатформенного консольного приложения для Windows и Linux. Проект предоставляет готовые методы для выполнения прикладных задач (отправки сообщения, создания документа, SQL-запросов и пр.) в более чем 30 сервисах и технологиях, включая Telegram, VK, Bitrix24, Google и Yandex-сервисы, а также различные СУБД и протоколы обмена

Код проекта организован в виде набора независимых модулей, каждый из которых отвечает за работу с конкретным сервисом. При этом общая логика, вроде работы с HTTP или JSON, вынесена в переиспользуемые компоненты. Это позволяет как быстро применять готовые функции, так и легко расширять функциональность, добавляя новые методы на базе существующих компонентов. Исходный код открыт, что дает полный контроль над реализацией и позволяет сообществу участвовать в разработке

<br/>

Быстрый переход по документации:
  <div>
 <a href="/docs/Instructions/Telegram/"><img src={require('../../static/img/APIs/Telegram.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/Bitrix24/"><img src={require('../../static/img/APIs/Bitrix24.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/CDEK/"><img src={require('../../static/img/APIs/CDEK.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/VK/"><img src={require('../../static/img/APIs/VK.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/VKTeams/"><img src={require('../../static/img/APIs/VKTeams.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/Viber/"><img src={require('../../static/img/APIs/Viber.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/GreenMax/"><img src={require('../../static/img/APIs/GreenMax.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/GreenAPI/"><img src={require('../../static/img/APIs/GreenAPI.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/S3/"><img src={require('../../static/img/APIs/S3.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/PostgreSQL/"><img src={require('../../static/img/APIs/PostgreSQL.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/SQLite/"><img src={require('../../static/img/APIs/SQLite.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/MSSQL/"><img src={require('../../static/img/APIs/MSSQL.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/MySQL/"><img src={require('../../static/img/APIs/MySQL.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/MongoDB/"><img src={require('../../static/img/APIs/MongoDB.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/Twitter/"><img src={require('../../static/img/APIs/Twitter.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/Notion/"><img src={require('../../static/img/APIs/Notion.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/YandexDisk/"><img src={require('../../static/img/APIs/YandexDisk.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/GoogleCalendar/"><img src={require('../../static/img/APIs/GoogleCalendar.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/GoogleDrive/"><img src={require('../../static/img/APIs/GoogleDrive.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/GoogleSheets/"><img src={require('../../static/img/APIs/GoogleSheets.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/OpenAI/"><img src={require('../../static/img/APIs/OpenAI.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/Ollama/"><img src={require('../../static/img/APIs/Ollama.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/Slack/"><img src={require('../../static/img/APIs/Slack.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/Airtable/"><img src={require('../../static/img/APIs/Airtable.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/Dropbox/"><img src={require('../../static/img/APIs/Dropbox.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/Neocities/"><img src={require('../../static/img/APIs/Neocities.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/FTP/"><img src={require('../../static/img/APIs/FTP.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/SFTP/"><img src={require('../../static/img/APIs/SFTP.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/TCP/"><img src={require('../../static/img/APIs/TCP.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/HTTP/"><img src={require('../../static/img/APIs/HTTP.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/GRPC/"><img src={require('../../static/img/APIs/gRPC.png').default} width="32" class="wp_logo"/></a>
 <a href="/docs/Instructions/SSH/"><img src={require('../../static/img/APIs/SSH.png').default} width="32" class="wp_logo"/></a>
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

В качестве расширения 1С и OneScript пакета, Открытый пакет интеграций представляет из себя набор общих модулей с экспортными методами - по одному модулю на каждый из API. Все доступные методы являются функциями, т.е. возвращают значения. Как правило, это *Соответствия*, описывающие JSON ответа сервера, но также могут быть *Двоичные данные* (например, в методах скачивания файла) или *строки* (например в методах получения URL). Типы возвращаемых значений описаны для каждого метода в текущей документации и документирующих комментариях в самом коде библиотеки

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

## Поддержать проект

<img src={require('../../static/img/boosty.png').default}/>

Если вам нравится этот или другие мои проекты, то вы можете поддержать меня [на Boosty](https://boosty.to/bayselonarrend) (регулярно или единоразово). При подписке от 500 рублей открывается доступ в приватный Telegram-чат, где можно задать интересующие вопросы о проекте и получить помощь от меня напрямую. Также присутствует спонсорская подписка для компаний с приоритетной поддержкой и размещением логотипа в списке спонсоров

**Спасибо за вашу поддержку!**
