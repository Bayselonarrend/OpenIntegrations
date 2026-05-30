---
id: Lua
sidebar_class_name: Lua
keywords: [1C, 1С, 1С:Предприятие, 1С:Предприятие 8.3, API, Интеграция, Сервисы, Обмен, OneScript, CLI, Lua]
---

<img src={require('../../static/img/APIs/Lua.png').default} width='64px' />

# Lua

import LibraryIntro from '@site/src/components/LibraryIntro';

<LibraryIntro module="OPI_Lua" cli="lua" use="oint/api/lua" lang="en"/>

This section is dedicated to the library for working with Lua in 1C:Enterprise and OneScript. This page describes all the actions necessary to get started

## Getting Started

The library provides the ability to execute Lua scripts directly from 1C:Enterprise and OneScript using external components.

### Supported Versions

The library supports two versions of Lua:

- **Lua54** — stable version of Lua 5.4
- **LuaJIT** — Lua JIT compiler with enhanced performance

### Creating a Virtual Machine

To execute Lua code, you need to create a virtual machine (VM):

```bsl
// Creating Lua 5.4 VM
VM = OPI_Lua.СоздатьVM("Lua54");

// Creating LuaJIT VM
VM = OPI_Lua.СоздатьVM("LuaJIT");

// Creating VM with logging settings
НастройкиЛогирования = Новый Структура;
НастройкиЛогирования.Вставить("level", "debug");
НастройкиЛогирования.Вставить("path", "C:\logs\lua.log");

VM = OPI_Lua.СоздатьVM("Lua54", НастройкиЛогирования);
```

### Executing Code

The library supports two methods of executing Lua code:

#### Execution from String

```bsl
КодLua = "return 2 + 2";
Результат = OPI_Lua.ВыполнитьКодИзСтроки(VM, КодLua);
// Result = 4
```

#### Execution from File

```bsl
ПутьКФайлу = "C:\scripts\script.lua";
Результат = OPI_Lua.ВыполнитьКодИзФайла(VM, ПутьКФайлу);
```

:::important
If an error occurs during Lua code execution, an exception will be raised. It is recommended to use the `Try...Except` construct to handle possible errors
:::

### Simplified Usage

Instead of creating a VM object, you can pass the Lua version directly to the execution functions:

```bsl
Результат = OPI_Lua.ВыполнитьКодИзСтроки("Lua54", "return 'Hello from Lua'");
Результат = OPI_Lua.ВыполнитьКодИзФайла("LuaJIT", "C:\scripts\script.lua");
```

In this case, the VM will be created automatically.