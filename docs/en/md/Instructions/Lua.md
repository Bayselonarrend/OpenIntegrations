---
id: Lua
sidebar_class_name: Lua
keywords: [1C, 1С, 1С:Предприятие, 1С:Предприятие 8.3, API, Интеграция, Сервисы, Обмен, OneScript, CLI, Lua]
---

<img src={require('../../static/img/APIs/Lua.png').default} width='64px' />

# Lua

import LibraryIntro from '@site/src/components/LibraryIntro';

<LibraryIntro module="OPI_Lua" cli="lua" use="oint/api/lua" lang="en"/>

This section is dedicated to the library for working with Lua in 1C:Enterprise and OneScript. This page describes all the actions necessary for a full-fledged start of work

## Getting Started

The library allows embedding and executing Lua scripts directly in 1C:Enterprise and OneScript. Two versions of Lua VM are supported:

- **Lua54** - standard version of Lua 5.4
- **LuaJIT** - Just-In-Time Lua compiler for enhanced performance

### Creating a Virtual Machine

To start working, you need to create an instance of the Lua virtual machine:

```bsl
// Creating Lua 5.4 VM
VM = OPI_Lua.СоздатьVM("Lua54");

// Creating LuaJIT VM
VM = OPI_Lua.СоздатьVM("LuaJIT");
```

### Executing Lua Code

After creating the VM, you can execute Lua code from a string or file:

```bsl
// Executing code from a string
КодLua = "return 2 + 2";
Результат = OPI_Lua.ВыполнитьКодИзСтроки(VM, КодLua);

// Executing code from a file
Результат = OPI_Lua.ВыполнитьКодИзФайла(VM, "C:\Scripts\script.lua");
```

### Calling Lua Functions

You can define functions in Lua and call them with parameters:

```bsl
// Defining a function
КодLua = "
function sum(a, b)
    return a + b
end
";
OPI_Lua.ВыполнитьКодИзСтроки(VM, КодLua);

// Calling a function with parameters
Параметры = Новый Массив;
Параметры.Добавить(5);
Параметры.Добавить(3);

Результат = OPI_Lua.ВызватьФункцию(VM, "sum", Параметры); // Returns 8
```

### Working with Global Variables

The library allows setting and getting global variables in the Lua context:

```bsl
// Setting a global variable
OPI_Lua.УстановитьГлобальнуюПеременную(VM, "myvar", "Значение");

// Getting a global variable
Значение = OPI_Lua.ПолучитьГлобальнуюПеременную(VM, "myvar");
```

### Working with Packages

You can add Lua modules as packages for reuse:

```bsl
// Adding a package from a string
КодПакета = "
local M = {}
function M.hello(name)
    return 'Hello, ' .. name
end
return M
";
OPI_Lua.ДобавитьПакетИзСтроки(VM, "mymodule", КодПакета);

// Adding a package from a file
OPI_Lua.ДобавитьПакетИзФайла(VM, "mymodule", "C:\Scripts\module.lua");

// Using the package
КодLua = "
mymodule = require('mymodule')
return mymodule.hello('World')
";
Результат = OPI_Lua.ВыполнитьКодИзСтроки(VM, КодLua);
```

### Working with Bytecode

For improved performance, you can pre-compile Lua code to bytecode:

```bsl
// Compiling code to bytecode
КодLua = "return 2 + 2";
БайтКод = OPI_Lua.СкомпилироватьКодИзСтроки(VM, КодLua);

// Executing bytecode
Результат = OPI_Lua.ВыполнитьБайтКод(VM, БайтКод);

// Compiling from a file
БайтКод = OPI_Lua.СкомпилироватьКодИзФайла(VM, "C:\Scripts\script.lua");
```

### Logging

If debugging is needed, you can enable VM operation logging:

```bsl
// Configuring logging
НастройкиЛога = OPI_Lua.ПолучитьНастройкиЛогирования(Истина, 300, "C:\Logs\lua.log");

// Creating a VM with logging
VM = OPI_Lua.СоздатьVM("Lua54", НастройкиЛога);

// Getting the log
Лог = OPI_Lua.ПолучитьЛог(VM, Истина, 100);
```

### Restarting the VM

To clear the virtual machine state, you can perform a restart:

```bsl
Результат = OPI_Lua.Перезапустить(VM);
```

:::important
Supported data types for exchange between 1C and Lua:
- Primitive types: string, number, boolean, null
- Structures and maps (as Lua tables)
- Arrays (as Lua tables)
- BinaryData (for transferring binary data)
:::

:::note
Errors during Lua code execution cause exceptions in 1C. It is recommended to use the Try...Except construct to handle possible errors
:::