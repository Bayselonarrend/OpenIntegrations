---
id: Janx
sidebar_class_name: Janx
keywords: [1C, 1C, 1C:Enterprise, 1C:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, Janx]
---

<img src={require('../../static/img/APIs/Janx.png').default} width='64px' />

# Janx

import LibraryIntro from '@site/src/components/LibraryIntro';

<LibraryIntro module="OPI_Janx" cli="janx" use="oint/formats/janx" lang="en"/>

This section is dedicated to the library for working with Janx format in 1C:Enterprise, OneScript and CLI. This page describes the main capabilities and usage examples

## Format Description

Janx-1 is a binary data serialization format optimized for efficient storage and transmission of structured data with binary data support.

### Format Structure

Janx-1 format has the following structure:
- **Version** (u16 BE) — format version
- **JSON Length** (u32 BE) — size of the JSON part in bytes
- **Number of Markers** (u32 BE) — number of binary data markers
- **JSON** — structured data in JSON format
- **Appendix** — binary data referenced by markers in JSON

### Format Features

- **Binary data support** — binary data is stored separately from JSON and replaced with markers
- **Efficient storage** — binary data is not encoded in Base64, which saves space
- **Collection support** — works with structures, maps, arrays and nested collections
- **Big Endian byte order** — ensures cross-platform compatibility

## Usage

### Data Serialization

To convert a data collection to Janx format, use the `SerializeData` function:

```bsl
Data = New Structure;
Data.Insert("Name", "Test document");
Data.Insert("Number", 12345);
Data.Insert("File", GetBinaryDataFromFile("document.pdf"));

SerializedData = OPI_Janx.SerializeData(Data);
// SerializedData — binary data in Janx-1 format
```

The function accepts any collection (Structure, Map, Array) and returns binary data in Janx-1 format.

### Data Deserialization

To restore data from Janx format, use the `DeserializeData` function:

```bsl
RestoredData = OPI_Janx.DeserializeData(SerializedData);
// RestoredData — original collection with restored binary data
```

The function accepts binary data in Janx-1 format and returns a deserialized collection.

### Working with Nested Structures

Janx format supports serialization of complex nested structures:

```bsl
Document = New Structure;
Document.Insert("Title", "Report");
Document.Insert("Date", CurrentDate());

Attachments = New Array;
Attachments.Add(GetBinaryDataFromFile("file1.pdf"));
Attachments.Add(GetBinaryDataFromFile("file2.jpg"));

Document.Insert("Attachments", Attachments);

SerializedData = OPI_Janx.SerializeData(Document);
RestoredData = OPI_Janx.DeserializeData(SerializedData);
```

### Supported Data Types

Janx format supports the following data types:

- **Primitive types**: String, Number, Boolean, Date, Undefined
- **Collections**: Structure, Map, Array
- **Binary data**: BinaryData

During serialization:
- Primitive types are saved in the JSON part
- Collections are processed recursively
- BinaryData is moved to the appendix and replaced with markers

## Usage Benefits

1. **Compactness** — binary data is not encoded in Base64, which saves ~33% of space
2. **Performance** — fast serialization and deserialization
3. **Structured** — JSON part is easy to read and debug
4. **Universality** — works with any nested collections
5. **Type safety** — preserves data types during serialization/deserialization

## Application Areas

- Data exchange between systems
- Saving complex structures in databases
- Caching data with binary components
- Data transmission via HTTP/REST API
- Archiving structured data