---
id: NativeAPI
sidebar_class_name: NativeAPI
keywords: [1C, 1С, 1С:Предприятие, 1С:Предприятие 8.3, API, Интеграция, Сервисы, Обмен, OneScript, CLI, NativeAPI]
---

<img src={require('../../static/img/APIs/NativeAPI.png').default} width='64px' />

# NativeAPI

import LibraryIntro from '@site/src/components/LibraryIntro';

<LibraryIntro module="OPI_NativeAPI" cli="nativeapi" use="oint/api/nativeapi" lang="en"/>

This section is dedicated to the library for working with native components (DLL/SO) in 1C:Enterprise, OneScript and CLI. This page describes all the actions necessary for a complete start of work

<div class="theme-admonition theme-admonition-info admonition_node_modules-@docusaurus-theme-classic-lib-theme-Admonition-Layout-styles-module alert alert--info">

<img src={require('../../static/img/addin.png').default} class="tipimage" />
<div class="addin">This library functionality is implemented using an external component <br/>
Please review the ["About external components"](/docs/Start/Component-requirements) section before getting started</div>
</div>

## Getting started

The library provides the ability to work with native libraries (DLL/SO) through a special wrapper component. This allows you to call functions and work with external component objects without the need to create wrappers.

### Main features

**Creating a host and loading a library**

The `СоздатьХост` function creates a Native API wrapper object and loads the specified DLL/SO library. If necessary, you can configure component operation logging.

```bsl
ПутьКБиблиотеке = "C:\MyLib\component.dll";

// Without logging
Хост = OPI_NativeAPI.СоздатьХост(ПутьКБиблиотеке);

// With logging configuration
НастройкиЛога = OPI_NativeAPI.ПолучитьНастройкиЛогирования(Истина, 500, "C:\Logs\nativeapi.log");
Хост = OPI_NativeAPI.СоздатьХост(ПутьКБиблиотеке, НастройкиЛога);
```

**Getting class information**

The `ПолучитьИменаКлассов` function returns a list of classes declared in the loaded component.

```bsl
СписокКлассов = OPI_NativeAPI.ПолучитьИменаКлассов(Хост);
```

### Working with component instances

**Creating and destroying instances**

The `СоздатьЭкземпляр` function creates an object of the specified component class and saves it in the host. The function returns the instance UUID, which is used for further work with it.

```bsl
ИмяКласса = "MyComponent.MainClass";
Экземпляр = OPI_NativeAPI.СоздатьЭкземпляр(Хост, ИмяКласса);

// Instance UUID in Экземпляр["data"]
УникальныйИдентификатор = Экземпляр["data"];

// After finishing work
OPI_NativeAPI.УничтожитьЭкземпляр(Хост, УникальныйИдентификатор);
```

**Getting metadata**

The `ПолучитьМетаданные` function returns a description of methods and properties of a component instance or class.

```bsl
// For an existing instance
Метаданные = OPI_NativeAPI.ПолучитьМетаданные(Хост, УникальныйИдентификатор);

// For a class (without creating an instance)
Метаданные = OPI_NativeAPI.ПолучитьМетаданные(Хост, "MyComponent.MainClass");
```

### Calling methods and working with properties

**Calling methods**

The `ВызватьМетод` function allows you to call methods of a component instance. You can pass parameters and set property values before calling.

```bsl
ИмяМетода = "CalculateSum";
Параметры = Новый Массив;
Параметры.Добавить(10);
Параметры.Добавить(20);

// Setting properties before calling (optional)
Свойства = Новый Соответствие;
Свойства.Вставить("Precision", 2);

Результат = OPI_NativeAPI.ВызватьМетод(Хост, УникальныйИдентификатор, ИмяМетода, Параметры, Свойства);

// Result contains the return value and current values of all properties
ЗначениеМетода = Результат["data"]["return"];
ЗначениеСвойства = Результат["data"]["properties"]["SomeProperty"];
```

**Working with properties**

The library provides functions for reading and writing instance properties:

```bsl
// Getting all properties
ВсеСвойства = OPI_NativeAPI.ПолучитьСвойства(Хост, УникальныйИдентификатор);

// Getting a specific property
Значение = OPI_NativeAPI.ПолучитьСвойство(Хост, УникальныйИдентификатор, "PropertyName");

// Setting a property
НовоеЗначение = 42;
OPI_NativeAPI.УстановитьСвойство(Хост, УникальныйИдентификатор, "PropertyName", НовоеЗначение);
```

### Temporary instances

For one-time calls, you can use temporary instances by passing the class name instead of UUID:

```bsl
ИмяКласса = "MyComponent.UtilityClass";
ИмяМетода = "GetVersion";

// Instance will be created, method called, and instance destroyed automatically
Результат = OPI_NativeAPI.ВызватьМетод(Хост, ИмяКласса, ИмяМетода);
```

### Logging

The `ПолучитьНастройкиЛогирования` function returns a structure with component logging settings:

- **ЗаписьВПамять** — write log to component memory (default `Истина`)
- **МаксимумСобытий** — maximum number of events in memory (default 300)
- **ПутьКФайлу** — path to log file; when filled, log is written to file

```bsl
НастройкиЛога = OPI_NativeAPI.ПолучитьНастройкиЛогирования(Истина, 1000, "C:\Logs\component.log");

// Getting the log
Лог = OPI_NativeAPI.ПолучитьЛог(Хост, Истина, 50); // Last 50 events as a string
```

:::tip
For debugging component work, it is recommended to enable logging with file writing. This will help track all calls and identify possible issues
:::

:::important
Instance UUID exists only within the host operation. After destroying the host, all created instances will also be destroyed
:::

:::note
The library automatically converts data types between 1C and the native component. Basic types are supported: strings, numbers, boolean values, arrays and structures
:::