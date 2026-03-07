---
id: RSS
sidebar_class_name: RSS
keywords: [1C, 1С, 1С:Предприятие, 1С:Предприятие 8.3, API, Интеграция, Сервисы, Обмен, OneScript, CLI, RSS]
---

<img src={require('../../static/img/APIs/RSS.png').default} width='64px' />

# RSS/Atom

import LibraryIntro from '@site/src/components/LibraryIntro';

<LibraryIntro module="OPI_RSS" cli="rss" use="oint/api/rss" lang="en"/>

This section is dedicated to the library for working with RSS and Atom formats in 1C:Enterprise, OneScript and CLI. This page describes all the actions necessary to get started

## Getting started

The library provides tools for creating and parsing RSS and Atom feeds. These formats are used to publish frequently updated content, such as news, blogs, or podcasts.

The library does not require authorization or additional settings - all methods work autonomously and can be used immediately after connection.

## Working with RSS

RSS (Really Simple Syndication) is a format for distributing news and other website content.

### Creating an RSS feed

To create an RSS feed, use the `CreateFeedRSS` function:

```bsl
ChannelName        = "My Blog";
ChannelDescription = "Latest news and articles";
ChannelLink        = "https://example.com";

Items = New Array;

Item = OPI_RSS.GetFeedItemStructureRSS(True);

Item.title       = "First article";
Item.description = "First article description";
Item.link        = "https://example.com/article1";
Item.pubDate     = CurrentDate();
Item.author      = "author@example.com";
Item.guid        = "article1";

Items.Add(Item);

RSSFeed = OPI_RSS.CreateFeedRSS(ChannelName, ChannelDescription, ChannelLink, Items);
```

### RSS element structure

The `GetFeedItemStructureRSS` function returns a structure with the following fields:

- **title** — element title
- **description** — element description/content
- **link** — element URL
- **pubDate** — publication date
- **author** — author's email
- **guid** — unique element identifier

### Parsing an RSS feed

To parse an existing RSS feed, use the `ParseFeedRSS` function:

```bsl
XMLText = "<?xml version=""1.0""?>..."; // XML feed content
Channel = OPI_RSS.ParseFeedRSS(XMLText);
```

## Working with Atom

Atom is an alternative content syndication format, more modern and flexible than RSS.

### Creating an Atom feed

To create an Atom feed, use the `CreateFeedAtom` function:

```bsl
FeedTitle = "My Blog";
FeedLink  = "https://example.com";
FeedID    = "https://example.com/feed";

Items = New Array;

Item = OPI_RSS.GetFeedItemStructureAtom(True);

Item.title     = "First article";
Item.id        = "article1";
Item.link      = "https://example.com/article1";
Item.updated   = CurrentDate();
Item.summary   = "Brief description";
Item.content   = "Full article content";
Item.author    = "Ivan Ivanov";
Item.published = CurrentDate();

Items.Add(Item);

AtomFeed = OPI_RSS.CreateFeedAtom(FeedTitle, FeedLink, FeedID, Items);
```

### Atom element structure

The `GetFeedItemStructureAtom` function returns a structure with the following fields:

- **title** — element title
- **id** — unique element identifier
- **link** — element URL
- **updated** — update date
- **summary** — brief description
- **content** — full content
- **author** — author's name
- **published** — publication date

### Parsing an Atom feed

To parse an existing Atom feed, use the `ParseFeedAtom` function:

```bsl
XMLText = "<?xml version=""1.0""?>..."; // XML feed content
Feed    = OPI_RSS.ParseFeedAtom(XMLText);
```

## Usage features

- When creating feeds, dates are automatically converted to the appropriate formats (RFC822 for RSS, ISO8601 for Atom)
- If the update date is not specified, the current date is used
- Element structures can be obtained either empty or with field descriptions for ease of filling
- Feed parsing returns structures with channel/feed data and an array of elements