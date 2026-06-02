---
id: MessagePack
sidebar_class_name: MessagePack
keywords: [1C, 1С, 1С:Предприятие, 1С:Предприятие 8.3, API, Интеграция, Сервисы, Обмен, OneScript, CLI, MessagePack]
---

<img src={require('../../static/img/APIs/MessagePack.png').default} width='64px' />

# MessagePack

import LibraryIntro from '@site/src/components/LibraryIntro';

<LibraryIntro module="OPI_MessagePack" cli="msgpack" use="oint/formats/msgpack" lang="en"/>

This section is dedicated to the library for working with MessagePack format in 1C:Enterprise, OneScript, and CLI. This page describes all the actions necessary for a complete start of work

## Getting Started

MessagePack is an efficient binary data serialization format. It allows data exchange between different programming languages, like JSON, but takes up less space and works faster.

The library provides two main functions for working with the format:

### Data Serialization

To convert data to MessagePack format, use the `СериализоватьДанные` function:

```bsl
Данные = Новый Структура;
Данные.Вставить("имя", "Иван");
Данные.Вставить("возраст", 30);

ДвоичныеДанные = OPI_MessagePack.СериализоватьДанные(Данные);
```

### Data Deserialization

To restore data from MessagePack format, use the `ДесериализоватьДанные` function:

```bsl
ВосстановленныеДанные = OPI_MessagePack.ДесериализоватьДанные(ДвоичныеДанные);
```

## Supported Data Types

The library supports serialization and deserialization of the following data types:

- **Undefined** — converts to MessagePack nil format
- **Boolean** — logical values True/False
- **String** — text data in UTF-8 encoding
- **BinaryData** — binary data
- **Array** — ordered collections of elements
- **Structure/Map** — key-value pair collections (keys are converted to strings)
- **Number** — integer and floating-point numbers (optimal storage format is automatically determined)

:::note
When serializing structure and map keys, they are automatically converted to string format
:::