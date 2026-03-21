# Changelog

## Version 1.33.0 - 06.03.2026

**Методы работы с ReportPortal**  
**Methods of working with ReportPortal**

RU: Авторизация (4 функции)  
EN: Authorization (4 functions)

RU: Управление пользователями (8 функций)  
EN: Users management (8 functions)

RU: Управление проектами (6 функций)  
EN: Project management (6 functions)

RU: Управление тестами (16 функций)  
EN: Test management (16 functions)

RU: Запись логов (5 функций)  
EN: Log recording (5 functions)

RU: Оптимизирована загрузка и скачивание больших файлов  
EN: Optimized uploading and downloading of large files

RU: Исправлен процесс авторизации, который мог приводить к ошибке при подключении к некоторым серверам  
EN: Fixed authorization process that could lead to an error when connecting to some servers

RU: Добавлен новый вариант релиза CLI приложения - `AppImage`  
EN: Added new release variant for CLI application - `AppImage`


## Version 1.32.0 - 20.02.2026

**Методы работы с ClickHouse**  
**Methods of working with ClickHouse**

RU: Основные методы (5 функций)  
EN: Common methods (5 functions)

RU: Функции работы через gRPC (11 функций)  
EN: gRPC functions (11 functions)

RU: Улучшена стабильность, добавлена обработка внутренних ошибок клиента  
EN: Improved stability, added handling of internal client errors

RU: Удалены функции `ПоставитьЛайк` и все функции раздела "Работа с обсуждениями" в связи с их удалением из VK API  
EN: Removed `Like` function and all functions from the "Discussion management" section due to their removal from the VK API

RU: Добавлен метод `ГаранитроватьЗаписи` (`ON DUPLICATE UPDATE` / `MERGE`) во все библиотеки СУБД #87  
EN: Added `EnsureRecords` method (`ON DUPLICATE UPDATE` / `MERGE`) to all DBMS libraries #87

RU: Улучшен вывод справки, проведена оптимизация CLI версии  
EN: Improved help output, optimized CLI version

RU: Добавлена возможность подключать библиотеки по одной в версии для OneScript (например `#Использовать oint/api/telegram`)  
EN: Added ability to include libraries individually in OneScript version (e.g. `#Use oint/api/telegram`)

RU: Исправлены ошибки `MissedImport` при отладке OneScript  
EN: Fixed `MissedImport` errors when debugging OneScript

RU: Исправлены множественные опечатки в описании и именах функций  
EN: Fixed multiple typos in descriptions and function names


## Version 1.31.0 - 06.01.2026

**Методы работы с gRPC**  
**Methods of working with gRPC**

RU: Основные методы (7 функций)  
EN: Common methods (7 functions)

RU: Функции интроспекции (3 функций)  
EN: Introspection functions (3 functions)

RU: Функции стриминга (10 функций)  
EN: Streaming functions (10 functions)

RU: Улучшен механизм загрузки фото на сервер  
EN: Improved photo upload mechanism

RU: Добавлена возможность установки максимального числа переадресаций и попыток при коде `5**`  
EN: Added support for setting maximum number of redirects and retries for `5**` status codes

RU: Добавлен полный сброс объекта обработки при повторной инициализации  
EN: Complete handler object reset implemented for reinitialization

RU: Оптимизирована передача двоичных данных во внешние компоненты во всех библиотеках СУБД  
EN: Optimized binary data transfer to the AddIn across all DBMS libraries


## Version 1.30.0 - 10.12.2025

**Методы работы с MongoDB**  
**Methods of working with MongoDB**

RU: Основные методы (5 функций)  
EN: Common methods (5 functions)

RU: Методы работы с базами данных (3 функции)  
EN: Database management methods (3 functions)

RU: Методы работы с коллекциями (3 функции)  
EN: Collection manipulation methods (3 functions)

RU: Методы работы с документами (8 функций)  
EN: Document processing methods (8 functions)

RU: Методы управления пользователями (5 функций)  
EN: User management methods (5 functions)

RU: Методы управления ролями (7 функций)  
EN: Role management methods (7 functions)

RU: Добавлены методы загрузки файлов по частям и полчения ссылки для ручной загрузки  
EN: Added methods for partial file upload and generating links for manual upload

RU: Добавлены методы порционной отправки тела в нескольких запросах через `Content-Range`  
EN: Added methods for partial data sending across multiple requests using `Content-Range`

RU: Добавлена возможность подключения через прокси-сервер  
EN: Added ability to connect via proxy server

RU: Добавлена поддержка типа NUMERIC/DECIMAL #79  
EN: Added support for NUMERIC/DECIMAL data type #79

RU: Добавлена обертка пароля в двойные кавычки при формировании строки подключения #81 @zeratulayuris  
EN: Added password wrapping in double quotes when forming connection strings #81 @zeratulayuris

RU: Исправлена и унифицирована обработка раскодирования строки и замены спец. символов для всех видов сообщений  
EN: Fixed and unified string decoding and special character replacement processing for all message types

RU: Исправлена синтаксическая ошибка при установке ID чата #82  
EN: Fixed syntax error when setting chat ID #82

RU: Методы авторизации продублированны в основные модули сервисов Yandex и Google  
EN: Authorization methods have been duplicated into the main service modules for Yandex and Google

RU: Добавлены сокращенные варианты опций для команд в консольном приложении  
EN: Added shortened option variants for console application commands

RU: Добавлена обработка параметров `Неопределено` в библиотеки СУБД  
EN: Added handling of `Undefined` parameters in DBMS libraries


## Version 1.29.0 - 31.10.2025

**Методы работы с мессенджером Max через GreenAPI**  
**Methods of working with Max messenger via GreenAPI**

RU: Управление аккаунтом (16 функций)  
EN: Account management (16 functions)

RU: Работа с группами (11 функций)  
EN: Group management (11 functions)

RU: Отправка сообщений (3 функции)  
EN: Message sending (3 functions)

RU: Работа с уведомлениями (2 функции)  
EN: Notification handling (2 functions)

RU: Работа с историей сообщений (5 функций)  
EN: Message history management (5 functions)

RU: Работа с очередями (5 функций)  
EN: Queue management (5 functions)

RU: Удален модуль для работы Ozon  
EN: The Ozon module has been removed

RU: Добавлена обработка `gzip` при получении сжатых XML данных  
EN: Added `gzip` processing for receiving compressed XML data


## Version 1.28.0 - 15.10.2025

**Методы работы с SSH и SFTP**  
**Methods of working with SSH and SFTP**

RU: Основные методы SSH (9 функций)  
EN: SSH common methods (9 functions)

RU: Основные методы SFTP (9 функций)  
EN: SFTP common methods (9 functions)

RU: Методы работы с директориями (4 функции)  
EN: Directory management methods (4 functions)

RU: Методы работы с файлами (5 функции)  
EN: File management methods (5 functions)

RU: Исправлен баг с режимом `НеИзолированно` при подключении компонент  
EN: Resolved an issue with AddIn connection in `NotIsolated` mode


## Version 1.27.0 - 16.09.2025

**Методы работы с протоколом FTP**  
**Methods of working with FTP protocol**

RU: Основные методы FTP(s) (14 функций)  
EN: FTP(s) common methods (14 functions)

RU: Методы работы с директориями (6 функции)  
EN: Directory management methods (6 functions)

RU: Методы работы с файлами (4 функции)  
EN: File management methods (4 functions)

RU: Исправлен неоднозначный перевод "Тема" как "Thread" и "Topic" в английской версии функций форума. Теперь используется только "Topic"  
EN: Ambiguous usage of "Thread" and "Topic" in forum methods has been corrected; Only "Topic" is now used

RU: Добавлена возможность использования path-style URL в функциях работы с объектами  #73  
EN: Added support for using path-style URL in object processing functions #73

RU: Обновлен метод `СоздатьОпрос` в связи с [изменениями API](https://vk.com/@vkappsdev-obnovlyaem-rabotu-metodov-api-wallpost-walledit-i-newsfeed)  
EN: The `CreatePoll` method has been updated in accordance with [API changes](https://vk.com/@vkappsdev-obnovlyaem-rabotu-metodov-api-wallpost-walledit-i-newsfeed)

RU: Добавлен параметр `ТипКонтента` для функции `ОтправитьФайл` #74 @yuschkof  
EN: Added the `ContentType` parameter to the `SendFile` function #74 @yuschkof

RU: Исправлен баг аварийного завершения при передаче больших данных в/из ВК на Linux #72  
EN: Fixed a bug causing abrupt termination when transferring large amounts of data to/from AddIn on Linux #72


## Version 1.26.0 - 15.07.2025

**Методы работы с MS SQL**  
**Methods of working with MS SQL**

RU: Основные методы MSSQL (6 функций)  
EN: MSSQL common methods (6 functions)

RU: Методы ORM (10 функций)  
EN: ORM methods (10 functions)

RU: Добавлены сокращенные функции формирования сообщений контекста  
EN: Added shortened functions for generating context messages

RU: Проведена оптимизация CLI версии, увеличина скорость выполнения операций  
EN: The CLI version has been optimized to increase the speed of operation execution

RU: Добавлен универсальный обработчик даты в разных форматах для позиционных параметров во все библиотеки СУБД  
EN: Added a universal date handler in various formats for positional parameters to all database libraries


## Version 1.25.0 - 18.06.2025

**Методы работы с OpenAI API**  
**Methods of working with OpenAI API**

RU: Методы обработки запросов (6 функций)  
EN: Request processing methods (6 functions)

RU: Методы управления ассистентами (4 функции)  
EN: Assistant management methods (4 functions)

RU: Методы работы с файлами (5 функций)  
EN: Methods for working with files (5 functions)

RU: Методы работы с аудио (2 функции)  
EN: Methods for working with audio (2 functions)

RU: Функция получения списка доступных моделей  
EN: Function for obtaining a list of available models

RU: Добавлена функция установки таймаута  
EN: Added timeout setting function

RU: Изменен формат представления даты и времени на ISO 8061-совместимый при получении значений из базы  
EN: Changed the date and time format to ISO 8061-compatible for values retrieved from the database

RU: Исправлена ошибка получения списка товаров по массиву ID  
EN: Fixed a bug in retrieving a list of products by ID array

RU: Добавлены методы создания и удаления колонок существующих таблиц для SQLite, PostgreSQL и MySQL  
EN: Added methods for creating and deleting columns in existing tables for SQLite, PostgreSQL, and MySQL


## Version 1.24.0 - 04.06.2025

**Это обновление - не совсем обычное. В нем не было особенных изменений библиотек Открытого пакета интеграций, но только доработки, касающиеся совершенно нового проекта, основанного на OpenIntegrations - **Melezh****  
**This Update is a Bit Special. While it doesn’t include major changes to the Open Integration Package (OInt) libraries, it introduces refinements related to a brand-new project based on OpenIntegrations — **Melezh****




## Version 1.23.0 - 21.05.2025

**Методы работы с HTTP(s)**  
**Methods of working with HTTP(s)**

RU: Методы инициализации запроса (8 функций)  
EN: Methods of request initialization (8 functions)

RU: Методы дополнительных настроек (5 функции)  
EN: Advanced setting methods (5 functions)

RU: Методы установки тела запроса (8 функций)  
EN: Methods for setting the request body (8 functions)

RU: Методы установки заголовков (2 функции)  
EN: Header setting methods (2 functions)

RU: Методы авторизации (5 функций)  
EN: Authorization methods (5 functions)

RU: Методы обработки и выполнения запроса (4 функции)  
EN: Methods of request processing and execution (4 functions)

RU: Методы получения ответа в нужном формате (5 функций)  
EN: Methods to get the response in the required format (5 functions)

RU: Добавлена функция получения информации о таблице  
EN: Added a function to retrieve table information

RU: Компонента пересобрана для поддержки многопоточности  
EN: AddIn rebuilt for multithreading support

RU: Добавлена функция получения Service токена для всех сервисов Google  
EN: Added a function to get a Service token for all Google services

RU: Увеличино количество выводимой информации в режиме `--debug` для CLI версии  
EN: Increased the amount of information in `--debug` mode for CLI version


## Version 1.22.0 - 04.05.2025

**Методы работы с Ollama**  
**Methods of working with Ollama**

RU: Методы обработки запросов (8 функций)  
EN: Request processing methods (8 functions)

RU: Методы управления моделями (11 функций)  
EN: Model management methods (11 functions)

RU: Методы работы с BLOB (2 функции)  
EN: Methods of working with BLOB (2 functions)

RU: Добавлен выбор разметки в `ЗаменитьТекстСообщения` и `ЗаменитьОписаниеСообщения` #60  
EN: Added markup option in `ReplaceMessageText` and `ReplaceMessageCaption` #60

RU: Добавлено экранирование спец. символов в `ЗаменитьТекстСообщения` и `ЗаменитьОписаниеСообщения` #62  
EN: Added escaping of special characters in `ReplaceMessageText` and `ReplaceMessageCaption` #62

RU: Исправлена работа с транзакциями, улучшено управление соединениями  
EN: Fixed work with transactions, improved connection management

RU: Глобальная переработка механизма обработки HTTP-запросов  
EN: Global revision of HTTP request processing mechanism


## Version 1.21.0 - 06.04.2025

**Методы работы с MySQL**  
**Methods of working with MySQL**

RU: Основные методы MySQL (6 функций)  
EN: MySQL common methods (6 functions)

RU: Методы ORM (10 функций)  
EN: ORM methods (10 functions)

RU: Добавлена поддержка TLS соединений и функция получения текста последней ошибки  
EN: Added support for TLS connections and a function to get the text of the last error


## Version 1.20.0 - 18.03.2025

**Методы работы с WhatsApp через GreenAPI**  
**Methods of working with WhatsApp (GreenAPI)**

RU: Функции управления аккаунтом (13 функций)  
EN: Account management methods (13 functions)

RU: Методы управления группами (9 функций)  
EN: Group management methods (9 functions)

RU: Методы отправки сообщений (11 функций)  
EN: Methods of sending messages (11 functions)

RU: Методы получения уведомлений (4 функции)  
EN: Methods of receiving notifications (4 functions)

RU: Методы работы с очередью сообщений (2 функции)  
EN: Methods of working with message queue (2 functions)

RU: Методы работы с журналом сообщений (4 функции)  
EN: Methods of working with the message log (4 functions)

RU: Изменен способ приведения типов для строк и чисел #52  
EN: Changed the method of type conversion for strings and numbers #52

RU: Добавлены функции для работы по протоколу RCON (4 функции)  
EN: Added functions for RCON protocol operation (4 functions)

RU: Добавлена возможность подключения расширений из dll-файлов #53  
EN: Added ability to attach extensions from dll-files #53

RU: Исправлен баг с отправкой клавиатуры в сообщения с вложениями #54  
EN: Fixed bug with sending keyboard to messages with attachments #54

RU: Добавлена поддержка TLS соединений  
EN: Added support for TLS connections


## Version 1.19.0 - 19.02.2025

**Методы работы с базами PostgreSQL**  
**Methods of working with PostgreSQL databases**

RU: Основные методы PostgreSQL (5 функций)  
EN: PostgreSQL common methods (5 functions)

RU: Методы ORM (12 функций)  
EN: ORM methods (12 functions)

RU: Добавлена возможность указывать файл с текстом запроса в качестве параметра функции `ВыполнитьЗапросSQL`  
EN: Added the ability to specify a file with the query text as a parameter of the `ExecuteSQLQuery` function

RU: Обновлены устаревшие методы:  `ПолучитьСписокТоваров`, `ПолучитьКоличествоТоваров`, `ПолучитьОписанияХарактеристикТоваров`, `ПолучитьЦеныТоваров`, `ПолучитьИнформациюОТоварах`, `ПроверитьЗагрузкуИзображенийТоваров`  
EN: Obsolete methods have been updated:  `GetProductList`, `GetProductsStocks`, `GetProductsAttributesData`, `GetProductsPrices`, `GetProductsInformation`, `CheckProductsImagesUpload`


## Version 1.18.1 - 10.02.2025

**Новые методы для API Telegram и Bitrix24**  
**New methods for Telegram and Bitrix24 API**

RU: Функции для редактирования текста и клавиатуры сообщений (3 функции)  
EN: Functions for editing the message text and keyboard (3 functions)

RU: Функции для работы с календарями (19 функции)  #47  
EN: Functions for working with calendars  (19 functions) #47

RU: Фикс метода синхронизации каталогов  
EN: Directory synchronisation method fix


## Version 1.18.0 - 13.01.2025

**Методы работы с базами SQLite**  
**Methods of working with SQLite databases**

RU: Основные методы SQLite (4 функций)  
EN: Common methods SQLite (4 functions)

RU: Методы ORM (9 функций)  
EN: ORM methods (9 functions)

RU: Улучшена обработка управляющих последовательностей в CLI версии  
EN: Improved handling of escape sequences in CLI version


## Version 1.17.0 - 25.12.2024

**Методы обмена по протоколу TCP**  
**TCP operating methods**

RU: Методы TCP клиента (7 функций)  
EN: TCP client methods (7 functions)

RU: Методы работы по схеме FBO (8 функций)  
EN: FBO scheme working methods (8 functions)

RU: Улучшен интерфейс CLI версии: обновлена цветовая схема списка методов, добавлены прогресс бары для длительных операций  
EN: Improved CLI version interface: updated color scheme of methods list, added progress bars for long operations

RU: Добавлена обработка управляющих последовательностей `\n`, `\r`, `\v` и `\f` для не-JSON аргументов и аргументов, не являющихся путями к файлам в CLI  
EN: Added processing of `\n`, `\r`, `\v` and `\f` control sequences for non-JSON and non-file paths CLI arguments


## Version 1.16.1 - 10.12.2024

**Новые методы для S3, CDEK и Bitrix24**  
**New methods for S3, CDEK and Bitrix24 APIs**

RU: Создание pre-signed (прямых) ссылок для загрузки и скачивания объектов (2 функции) #46  
EN: Creating pre-signed (direct) links for uploading and downloading objects (2 functions)

RU: Добавлен метод получения регионов, исправлен URL основного API  
EN: Added method of getting regions, fixed URL of the main API

RU: Убрана проверка режима совместимости интерфейса в расширении 1С  
EN: Removed interface compatibility mode check in 1C extension


## Version 1.16.0 - 22.11.2024

**Новый API - AWS S3 API**  
**New API - AWS S3 API**

RU: Универсальные методы работы с S3 (3 функции)  
EN: Common methods of working with S3 (3 functions)

RU: Методы работы с бакетами (12 функций)  
EN: Bucket management methods (12 functions)

RU: Методы работы с объектами (15 функции)  
EN: Object management methods (15 functions)

RU: Оптимизация некоторых общих методов и функций работы с Http-запросами  
EN: Optimization of some common methods and functions of working with Http requests


## Version 1.15.1 - 01.11.2024

**Перенос CLI версии на OneScript 2**  
**Migrating the CLI version to OneScript 2**

RU: Изменен состав Windows установщика и Linux пакетов: теперь в поставке код библиотеки с движком вместо единого exe-файла, что значительно увеличивает быстродействие  
EN: Changed the composition of Windows installer and Linux packages: now the library code with the engine is provided instead of a single exe file, which greatly increases performance

RU: CLI приложение из установщиков/пакетов для Linux и Windows теперь использует OneScript 2 (RC5). Это увеличивает размер самого пакета, но позволяет использовать его без .NET и Mono (не относится к поставке одним файлом)  
EN: The CLI application from Linux and Windows installers/packages now uses OneScript 2 (RC5). This increases the size of the package itself, but allows it to be used without .NET and Mono  (does not apply to the single file version)

RU: Добавлен осмысленный текст ошибки на вызов некорректного метода с параметрами  
EN: Added sensible error text on calling an invalid method with parameters

RU: Улучшена общая стабильность, исправлены некоторые недочеты  
EN: Improved overall stability, fixed some bugs


## Version 1.15.0 - 21.10.2024

**Новый API - CDEK API**  
**New API - CDEK API**

RU: Общие методы получения данных (5 функций)  
EN: Common methods for data retrieval (5 functions)

RU: Методы работы с заказами (16 функций)  
EN: Methods of order processing (16 functions)

RU: Методы управления доставкой (8 функций)  
EN: Delivery management methods (8 functions)

RU: Добавлен параметр *Поля* для указания необходимых полей ответа в функции `ПолучитьСписокЗадач`  
EN: Added *Fields* parameter to specify required fields of the response in the `GetTasksList` function

RU: Улучшение документации: более конкретные и подробные примеры команд CLI, колонка обязательности в таблице параметрв, прочие небольшие визуальные доработки  
EN: Documentation improvements: more specific and detailed examples of CLI commands, requirement column in the parameter table, other small visual enhancements

RU: Исправление багов некоторых методов в CLI версии благодаря повторению набора 1С тестов для консольного приложения  
EN: Bug fixes in some CLI methods by repeating a set of 1C tests for the console application


## Version 1.14.0 - 27.09.2024

**Новый API - Neocities API**  
**New API - Neocities API**

RU: Методы получения данных (2 функций)  
EN: Methods of data retrieval (2 functions)

RU: Методы работы с файлами (5 функций)  
EN: Files managment methods (5 functions)

RU: Изменен метод отправки текстовых сообщений для устранения ошибок при отправке emoji  
EN: Changed the method of sending text messages to fix emoji sending errors

RU: Изменен порядок раскодирования строки TMA для устранения ошибок при наличии "&" в значениях  
EN: Changed the order of TMA string decoding to eliminate errors when '&' is present in values


## Version 1.13.0 - 10.09.2024

**Новый API - Ozon Seller API**  
**New API - Ozon Seller API**

RU: Методы работы с атибутами и характеристиками (5 функций)  
EN: Attributes and features managment methods (5 functions)

RU: Методы загрузки и обновления товаров (26 функций)  
EN: Products uploading and updating methods (26 functions)

RU: Методы работы со штрихкодами (2 функции)  
EN: Barcodes methods (14 functions)

RU: Методы управления ценами и остатками (8 функций)  
EN: Stocks and prices methods (8 functions)

RU: Методы работы с акциями (3 функций)  
EN: Promos management methods (3 functions)

RU: Метод получения списка складов  
EN: Method for obtaining the list of warehouses

RU: Методы работы со сделками (7 функции) by @EvgeniyOst  
EN: Deals managment methods (7 functions) by @EvgeniyOst

RU: Методы работы с лидами (7 функции) by @EvgeniyOst  
EN: Leads managment methods (7 functions) by @EvgeniyOst


## Version 1.12.0 - 19.08.2024

**Новый API - VK Teams**  
**New API - VK Teams**

RU: Общие методы работы с сервисом (3 функции)  
EN: Common methods of working with the service (3 functions)

RU: Методы упраления и отправки сообщений (12 функций)  
EN: Message management and sending methods (12 functions)

RU: Методы управления и администрирования чатов (14 функций)  
EN: Chat management and administration methods (14 functions)


## Version 1.11.1 - 30.07.2024

**Доработки по Bitrix24 и Telegram**  
**Bitrix24 and Telegram improvements**

RU: Параметр отображаемого имени для метода отправки файла  
EN: Display name parameter for the file sending method

RU: Автоматическая установка имени файла при загрузке по пути к файлу (если не заполнен параметр имени)  
EN: Automatic setting of the file name when loading by file path (if the name parameter is not filled in)

RU: Новые методы для работы с пользователями диалогов (3 функции)  
EN: New methods of working with dialog users (3 functions)

RU: Новые методы для работы с уведомлениями (3 функции)  
EN: New methods of working with notifications (3 functions)

RU: Новые методы для работы с пользовательскими полями задач (5 функции)  
EN: New methods of working with custom tasks fields (5 functions)

RU: Новые методы для работы с подразделениями (4 функции)  
EN: New methods of working with departments (4 functions)

RU: Новые методы для работы с пользователями (5 функции)  
EN: New methods of working with users (5 functions)

RU: Новые методы для учета рабочего времени (5 функции)  
EN: New methods for timekeeping (5 functions)


## Version 1.11.0 - 15.07.2024

**Методы для работы с Bitrix 24 API через приложение и Webhook**  
**Bitrix24 API methods for apps and Webhooks**

RU: Новый метод для удаления сообщений  
EN: New method for deleting messages

RU: Добавлен параметр сообщения для ответа в отправку сообщения  
EN: New "Reply to" parameter at message sending method

RU: Исправлена отправка Emoji  
EN: Bug fix for emoji sending

RU: Методы для работы с живой лентой и новостями (7 функций)  
EN: News feed managment methods (7 functions)

RU: Методы для работы с задачами (27 функции)  
EN: Tasks managment methods (27 functions)

RU: Методы для работы с чек-листами задач (7 функции)  
EN: Tasks checklists managment methods (7 functions)

RU: Методы для работы с комментариями и результатами задач (9 функций)  
EN: Methods for working with comments and task results (9 functions)

RU: Методы для работы с канбан и "Моим планом" (5 функций)  
EN: Kanban and "My plan" managment methods (5 functions)

RU: Методы для учета рабочего времени в задачах (5 функций)  
EN: Methods for timekeeping in tasks (5 functions)

RU: Методы для управления хранилищами (6 функций)  
EN: Storages management methods (6 functions)

RU: Методы для управления каталогами (11 функций)  
EN: Folders management methods (11 functions)

RU: Методы для управления файлами (10 функций)  
EN: Files management methods (10 functions)

RU: Методы работы с чатами и диалогами (18 функций)  
EN: Methods of working with chats and dialogs (18 functions)

RU: Методы работы с сообщениями (9 функций)  
EN: Methods of working with messages (9 functions)


## Version 1.10.0 - 08.06.2024

**Методы для работы с Dropbox API и английская версия пакета**  
**Dropbox API methods and english version**

RU: Получение ссылки авторизации  
EN: Getting authorization link

RU: Получение токена  
EN: Getting token

RU: Обновление токена  
EN: Refreshing token

RU: Получение информации об аккаунте  
EN: Getting account information

RU: Получение информации об использованном пространстве  
EN: Getting used space information

RU: Получение информации об объекте на диске  
EN: Getting information about an object on the drive

RU: Получение списка файлов в папке  
EN: Getting a list of files in a folder

RU: Получение превью объекта  
EN: Getting object preview

RU: Загрузка локального файла  
EN: Uploading a local file

RU: Загрузка файла по URL  
EN: Uploading a file from URL

RU: Получение статуса загрузки по URL  
EN: Getting upload status from URL

RU: Удаление объекта  
EN: Deleting an object

RU: Копирование объекта  
EN: Copying an object

RU: Перемещение объекта  
EN: Moving an object

RU: Создание папки  
EN: Creating a folder

RU: Скачивание файла  
EN: Downloading a file

RU: Скачивание папки (как zip)  
EN: Downloading a folder (as zip)

RU: Получение списка версий объекта  
EN: Getting a list of object versions

RU: Восстановление объекта к версии  
EN: Restoring an object to a version

RU: Получение списка тегов объекта  
EN: Getting a list of object tags

RU: Добавление тега  
EN: Adding a tag

RU: Удаление тега  
EN: Deleting a tag

RU: Публикация/Отмена публикации папки в общий доступ  
EN: Publishing/Unpublishing a folder for public access

RU: Выдача доступа к папке  
EN: Granting access to a folder

RU: Выдача доступа к файлу  
EN: Granting access to a file

RU: Исправления имен типов для обновленного API  
EN: New types names for new API version

RU: Более оптимальный способ получения данных локального файла для загрузки на Диск  
EN: New optimal way to sending local files on a Drive

