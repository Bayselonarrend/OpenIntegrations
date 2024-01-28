<img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/logo.png" style="height: 256px; width: 256px;">

# Открытый пакет интеграций
[![Статус порога качества](http://api.athenaeum.digital/Sonar/api/project_badges/measure?project=OpenIntegrations&metric=alert_status)](http://api.athenaeum.digital/Sonar/dashboard?id=OpenIntegrations)
[![Строки кода](http://api.athenaeum.digital/Sonar/api/project_badges/measure?project=OpenIntegrations&metric=ncloc)](http://api.athenaeum.digital/Sonar/dashboard?id=OpenIntegrations)
![Версия](https://img.shields.io/badge/Версия_1С-8.3.9-yellow)
<br>
Набор библиотек для интеграции с некоторыми популярными API для 1C:Enterprise. <br>


<br>
Проект состоит из общих модулей, каждый из которых отвечает за свой API, а также нескольких модулей-инструментов, общих для всех. Реализованные методы выполняют конечные задачи (вроде ОтправитьСообщение() или СоздатьПост()), что позволяет использовать их без углубления в реализацию. Однако, код, при этом, достаточно сильно декомпозирован - методы авторизации, получения данных и пр. по возможности вынесены в отдельные функции. Это позволяет легко добавлять новые методы, даже если они еще не реализованы в самой библиотеке на текущий момент. <br><br>

На данный момент реализованы методы для работы со следующими API:
<br>
  <div>
  <a href="https://opi.neocities.org/docs/Telegram/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/Telegram.png" width="32"></a>
  <a href="https://opi.neocities.org/docs/VK/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/VK.png" width="32"></a>
  <a href="https://opi.neocities.org/docs/Viber/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/Viber.png" width="32"></a>
  <a href="https://opi.neocities.org/docs/Twitter/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/Twitter.png" width="32"></a>
  <a href="https://opi.neocities.org/docs/Notion/"><img src="https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/Notion.png" width="32"></a>
</div>
<br>

## Релизы ##

Релизы библиотеки выходят в трех вариантах: как XML файлы расширения для загрузки через конфигуратор, как EDT проект расширения и как отдельный файл расширения формата cfe. Помимо этого, вы можете просто скопировать код общих модулей из релизов XML или EDT в свою конфигурацию вручную - метаданных других типов там нет. Вне зависимости от выбранного сопособа, получать файлы необходимо из Release, так как в самих исходных файлах репозитория бывают промежуточные данные и функции, находящиеся в процессе разработки.

Общие модули проекта бывают двух видов: 

- Служебные 
	- OPI_Инструменты
	- OPI_Криптография
- Модули непосредственной работы с API
	- OPI_Telegram, OPI_VK...
	
>[!WARNING]
>Не рекомендуется использовать методы служебных модулей в других местах вашей конфигурации (если вы собираетесь обновляться до новых версий в дальнейшем). Для сохранения обратной совместимости, количество/назначение параметров и типы возвращаемых значений для методов работы с API не изменяются, но это не применимо к служебным модулям, которые могут изменяться как угодно для оптимизации и дополнения под новые нужды. Если вам необходим функционал из служебных модулей, рекомендуется скопировать его себе отдельно.

Список релизов можно найти в [Releases данного репозитория](https://github.com/Bayselonarrend/OpenIntegrations/releases).  

## Документация ##

У ОПИ есть подробная документация с примерами по адресу [https://opi.neocities.org](https://opi.neocities.org). Там вы можете найти как общие положения о начале работы с каждым конкретным API, так и описания каждого метода с примерами кода и возвращаемых значений.

![Docs](https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/docs.png)

___

>В проекте используется механизм распаковки zip и gzip vbondarevsky/Connector
>
>Copyright 2017-2023 Vladimir Bondarevskiy
>под Apache License, Version 2.0
>
>[https://github.com/vbondarevsky/Connector/](https://github.com/vbondarevsky/Connector/)
<br>

>Используются методы HMAC SHA-256 и некоторые другие из БСП
>
>Copyright (c) 2019, ООО 1С-Софт Все права защищены. Эта программа и сопроводительные материалы предоставляются в соответствии с условиями лицензии Attribution 4.0 International (CC BY 4.0) Текст лицензии доступен по ссылке: [https://creativecommons.org/licenses/by/4.0/legalcode](https://creativecommons.org/licenses/by/4.0/legalcode)
<br>

>Документация создана при помощи Docusaurus
>
>Copyright (c) Facebook, Inc. and its affiliates.
>
>[https://github.com/facebook/docusaurus](https://github.com/facebook/docusaurus)

>Остальной проект распространяется под лицензией MIT
<br>

>![Infostart](https://github.com/Bayselonarrend/TelegramEnterprise/raw/main/infostart.svg)
>
>Статья на Инфостарте:<br>
>[https://infostart.ru/1c/articles/2016164/](https://infostart.ru/1c/articles/2016164/)<br>
