---
id: MessagePack
sidebar_class_name: MessagePack
keywords: [1C, 1С, 1С:Предприятие, 1С:Предприятие 8.3, API, Интеграция, Сервисы, Обмен, OneScript, CLI, MessagePack]
---

<img src={require('../../static/img/APIs/MessagePack.png').default} width='64px' />

# MessagePack

import LibraryIntro from '@site/src/components/LibraryIntro';

<LibraryIntro module="OPI_MessagePack" cli="msgpack" use="oint/formats/msgpack" lang="en"/>

This section is dedicated to the library for working with MessagePack format in 1C:Enterprise, OneScript and CLI. This page describes all the actions necessary for a complete start of work

## About MessagePack format

MessagePack is an efficient binary data serialization format. It allows data exchange between different programming languages, similar to JSON, but is more compact and faster. MessagePack supports serialization of various data types: strings, numbers, boolean values, arrays, structures, and binary data.

## Getting Started

The library provides two main methods for working with MessagePack format:

### Data Serialization

To convert data to MessagePack format, use the `SerializeData` function:

```bsl
Data = New Structure;
Data.Insert("Name", "Ivan");
Data.Insert("Age", 30);
Data.Insert("Active", True);

SerializedData = OPI_MessagePack.SerializeData(Data);
// Returns: BinaryData
```

The function accepts two parameters:
- **Data** — collection for serialization (Structure, Array, Map, etc.)
- **FromSource** — boolean value indicating that the data is a JSON string or a file on disk (default False)

### Data Deserialization

To restore data from MessagePack format, use the `DeserializeData` function:

```bsl
RestoredData = OPI_MessagePack.DeserializeData(SerializedData);
// Returns the original data structure
```

### Supported Data Types

The library supports serialization and deserialization of the following data types:

- **Undefined** (Nil)
- **Boolean** (Boolean)
- **String** (String)
- **Number** (Integer and Float)
- **BinaryData** (Binary)
- **Array** (Array)
- **Structure/Map** (Map)

### Example of Working with Different Types

```bsl
// Creating a complex data structure
Data = New Structure;
Data.Insert("StringValue", "Test value");
Data.Insert("NumberValue", 42);
Data.Insert("FloatValue", 3.14);
Data.Insert("BooleanValue", True);
Data.Insert("EmptyValue", Undefined);

ArrayValue = New Array;
ArrayValue.Add(1);
ArrayValue.Add(2);
ArrayValue.Add(3);
Data.Insert("ArrayValue", ArrayValue);

// Serialization
SerializedData = OPI_MessagePack.SerializeData(Data);

// Deserialization
Result = OPI_MessagePack.DeserializeData(SerializedData);
```

### Working with JSON Sources

The library allows you to serialize data directly from a JSON string or file:

```bsl
JSONString = "{""name"":""John"",""age"":30}";
SerializedData = OPI_MessagePack.SerializeData(JSONString, True);
```

:::note
MessagePack provides a more compact data representation compared to JSON, which is especially effective when transmitting large amounts of information over the network or when storing data
:::