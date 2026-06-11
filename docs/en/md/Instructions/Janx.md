---
id: Janx
sidebar_class_name: Janx
keywords: [1C, 1С, 1С:Предприятие, 1С:Предприятие 8.3, API, Интеграция, Сервисы, Обмен, OneScript, CLI, Janx]
---

<img src={require('../../static/img/APIs/Janx.png').default} width='64px' />

# Janx

import LibraryIntro from '@site/src/components/LibraryIntro';

<LibraryIntro module="OPI_Janx" cli="janx" use="oint/formats/janx" lang="en"/>

This section is dedicated to the library for working with Janx format in 1C:Enterprise, OneScript and CLI. This page describes all the actions necessary for a complete start of work

## About Janx Format

Janx is a specialized data serialization format that effectively combines text representation of structured data (JSON) with binary blocks. The format is designed for cases when it is necessary to transfer or store complex data structures containing both regular values and binary data (images, files, etc.).

### Format Structure

The Janx format consists of the following parts:

1. **Header** (10 bytes):
   - 2 bytes — format version
   - 4 bytes — JSON part size
   - 4 bytes — number of binary blocks

2. **JSON part** — structured description of data, where binary data is replaced with special markers

3. **Appendix** — sequence of binary data blocks

### Key Features

- Serialization of arbitrary data structures (Structure, Map, Array)
- Automatic processing of nested collections
- Efficient storage of binary data
- Compact data representation
- Format versioning support

## Getting Started

Working with Janx format does not require preliminary setup or authorization. The library provides two main functions:

### Data Serialization

To convert data to Janx format, use the `СериализоватьДанные` function:

```bsl
Данные = Новый Структура;
Данные.Вставить("Имя", "Иван");
Данные.Вставить("Возраст", 30);

// Adding binary data
Файл = Новый ЧтениеДанных("фото.jpg");
Данные.Вставить("Фото", Файл.Прочитать().ПолучитьДвоичныеДанные());
Файл.Закрыть();

// Serialization
СериализованныеДанные = OPI_Janx.СериализоватьДанные(Данные);
```

### Data Deserialization

To restore data from Janx format, use the `ДесериализоватьДанные` function:

```bsl
// Deserialization
ВосстановленныеДанные = OPI_Janx.ДесериализоватьДанные(СериализованныеДанные);

// Data access
Имя = ВосстановленныеДанные["Имя"];
Фото = ВосстановленныеДанные["Фото"]; // ДвоичныеДанные
```

### Working with Complex Structures

Janx format automatically processes nested structures and arrays:

```bsl
Данные = Новый Структура;
Данные.Вставить("Пользователи", Новый Массив);

Пользователь = Новый Структура;
Пользователь.Вставить("Имя", "Иван");
Пользователь.Вставить("Email", "ivan@example.com");

Файл = Новый ЧтениеДанных("avatar.png");
Пользователь.Вставить("Аватар", Файл.Прочитать().ПолучитьДвоичныеДанные());
Файл.Закрыть();

Данные.Пользователи.Добавить(Пользователь);

// Serialization of the entire structure
Результат = OPI_Janx.СериализоватьДанные(Данные);

// Deserialization
Восстановлено = OPI_Janx.ДесериализоватьДанные(Результат);
```

## Working Features

:::important
During deserialization, the library automatically checks the format version and data structure correctness. In case of mismatch, an exception will be raised
:::

:::note
Janx format is more efficient than JSON when working with binary data, as it avoids the need for Base64 encoding, which significantly reduces the size of the resulting data
:::