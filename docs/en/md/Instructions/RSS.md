---
id: RSS
sidebar_class_name: RSS
keywords: [1C, 1С, 1С:Предприятие, 1С:Предприятие 8.3, API, Интеграция, Сервисы, Обмен, OneScript, CLI, RSS]
---

<img src={require('../../static/img/APIs/RSS.png').default} width='64px' />

# RSS

import LibraryIntro from '@site/src/components/LibraryIntro';

<LibraryIntro module="OPI_RSS" cli="rss" use="oint/api/rss" lang="en"/>

This section is dedicated to the library for working with RSS and Atom formats in 1C:Enterprise, OneScript and CLI. This page describes all the actions necessary to get started

## Getting started

The library provides tools for creating and parsing RSS and Atom feeds. These formats are used to publish frequently updated content, such as news, blogs, or podcasts.

The library does not require authorization or additional settings - all methods work autonomously and can be used immediately after connection.

## Working with RSS

RSS (Really Simple Syndication) is a format for distributing news and other website content.

### Creating an RSS feed

To create an RSS feed, use the `СоздатьФидRSS` function:

```bsl
НазваниеКанала = "Мой блог";
ОписаниеКанала = "Последние новости и статьи";
СсылкаКанала = "https://example.com";

Элементы = Новый Массив;
Элемент = OPI_RSS.ПолучитьСтруктуруЭлементаФидаRSS(Истина);
Элемент.title = "Первая статья";
Элемент.description = "Описание первой статьи";
Элемент.link = "https://example.com/article1";
Элемент.pubDate = ТекущаяДата();
Элемент.author = "author@example.com";
Элемент.guid = "article1";
Элементы.Добавить(Элемент);

ФидRSS = OPI_RSS.СоздатьФидRSS(НазваниеКанала, ОписаниеКанала, СсылкаКанала, Элементы);
```

### RSS element structure

The `ПолучитьСтруктуруЭлементаФидаRSS` function returns a structure with the following fields:

- **title** — element title
- **description** — element description/content
- **link** — element URL
- **pubDate** — publication date
- **author** — author's email
- **guid** — unique element identifier

### Parsing an RSS feed

To parse an existing RSS feed, use the `РазобратьФидRSS` function:

```bsl
XMLТекст = "<?xml version=""1.0""?>..."; // XML содержимое фида
Канал = OPI_RSS.РазобратьФидRSS(XMLТекст);

// Канал содержит данные канала и массив элементов в поле "items"
```

## Working with Atom

Atom is an alternative content syndication format, more modern and flexible than RSS.

### Creating an Atom feed

To create an Atom feed, use the `СоздатьФидAtom` function:

```bsl
НазваниеФида = "Мой блог";
СсылкаФида = "https://example.com";
IDФида = "https://example.com/feed";

Элементы = Новый Массив;
Элемент = OPI_RSS.ПолучитьСтруктуруЭлементаФидаAtom(Истина);
Элемент.title = "Первая статья";
Элемент.id = "article1";
Элемент.link = "https://example.com/article1";
Элемент.updated = ТекущаяДата();
Элемент.summary = "Краткое описание";
Элемент.content = "Полное содержимое статьи";
Элемент.author = "Иван Иванов";
Элемент.published = ТекущаяДата();
Элементы.Добавить(Элемент);

ФидAtom = OPI_RSS.СоздатьФидAtom(НазваниеФида, СсылкаФида, IDФида, Элементы);
```

### Atom element structure

The `ПолучитьСтруктуруЭлементаФидаAtom` function returns a structure with the following fields:

- **title** — element title
- **id** — unique element identifier
- **link** — element URL
- **updated** — update date
- **summary** — brief description
- **content** — full content
- **author** — author's name
- **published** — publication date

### Parsing an Atom feed

To parse an existing Atom feed, use the `РазобратьФидAtom` function:

```bsl
XMLТекст = "<?xml version=""1.0""?>..."; // XML содержимое фида
Фид = OPI_RSS.РазобратьФидAtom(XMLТекст);

// Фид содержит данные фида и массив элементов в поле "entries"
```

## Usage features

- When creating feeds, dates are automatically converted to the appropriate formats (RFC822 for RSS, ISO8601 for Atom)
- If the update date is not specified, the current date is used
- Element structures can be obtained either empty or with field descriptions for ease of filling
- Feed parsing returns structures with channel/feed data and an array of elements