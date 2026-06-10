---
id: SQLite
sidebar_class_name: SQLite
keywords: [1C, 1С, 1С:Предприятие, 1С:Предприятие 8.3, API, Интеграция, Сервисы, Обмен, OneScript, CLI, SQLite]
---

<img src={require('../../static/img/APIs/SQLite.png').default} width='64px' />

# SQLite

import LibraryIntro from '@site/src/components/LibraryIntro';

<LibraryIntro module="OPI_SQLite" cli="sqlite" use="oint/api/sqlite" lang="ru"/>

Этот раздел посвящен библиотеке для работы с базами данных SQLite в 1С:Предприятие, OneScript и CLI. На данной странице описаны все действия, необходимые для полноценного начала работы

<div class="theme-admonition theme-admonition-info admonition_node_modules-@docusaurus-theme-classic-lib-theme-Admonition-Layout-styles-module alert alert--info">

<img src={require('../../static/img/addin.png').default} class="tipimage" />
<div class="addin">Для реализации некоторых функции в этой библиотеке используется внешняя компонента <br/>
Пожалуйста, ознакомьтесь с разделом ["О внешних компонентах"](/docs/Start/Component-requirements) перед началом работы</div>
</div>

## О реализованных методах

Данная библиотека состоит из двух частей: основных методов, вроде подключения и выполнения SQL-запросов, и небольшой ORM для часто встречающихся операций, вроде CREATE, SELECT, INSERT, DELETE и пр. Работа через ORM и через тексты запросов, выполняемые функцией `ВыполнитьЗапросSQL()`, технически не отличается: ORM просто формирует текст SQL-запроса на основе макетов, но далее также выполняет их этой функцией

По умолчанию, все запросы SELECT возвращают массив выбранных данных, а остальные запросы - только `true` в поле `result` при успехе, либо `false` и текст ошибки в полях `result` и `error` соответственно. Для выполнения запросов, требующих возврата данных, но не являющихся запросами SELECT, в функции `ВыполнитьЗапросSQL()` есть параметр `ФорсироватьРезультат`

## Поля типа "BLOB"

Данная библиотека умеет обрабатывать поля типа BLOB (Двоичные данные). Для записи значение передаётся как `ДвоичныеДанные` или как структура `{"blob": ...}` с путём к файлу, URL или двоичными данными. При чтении возвращается `ДвоичныеДанные`. В CLI двоичные значения в JSON-ответе кодируются в Base64
