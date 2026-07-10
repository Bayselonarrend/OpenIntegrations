---
id: RAR
sidebar_class_name: RAR
keywords: [1C, 1C, 1C:Enterprise, 1C:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, RAR]
---

<img src={require('../../static/img/APIs/RAR.png').default} width='64px' />

# RAR

import LibraryIntro from '@site/src/components/LibraryIntro';

<LibraryIntro module="OPI_RAR" cli="rar" use="oint/formats/rar" lang="en"/>

This section is dedicated to the library for working with RAR archives in 1C:Enterprise, OneScript and CLI. This page describes all the actions necessary to get started

## Getting Started

The library provides capabilities for working with RAR format archives: unpacking existing archives, working with password protection, obtaining file lists and archive metadata.

:::important
This library is intended only for **unpacking** RAR archives. Creating RAR archives is not supported
:::

### Main Features

**Unpacking Archives**

The `РазархивироватьКаталог` function allows you to unpack a RAR archive to a specified directory. Working with password-protected archives is supported.

```bsl
ПутьАрхива = "C:\Архивы\архив.rar";
КаталогНазначения = "C:\Распаковка";
Пароль = "МойПароль123";

Результат = OPI_RAR.РазархивироватьКаталог(ПутьАрхива, КаталогНазначения, Пароль);
```

**Selective File Unpacking**

The `РазархивироватьФайлы` function allows you to unpack only specific files from the archive based on a list of their paths inside the archive.

```bsl
ПутьАрхива = "C:\Архивы\архив.rar";
КаталогНазначения = "C:\Распаковка";

МассивПутей = Новый Массив;
МассивПутей.Добавить("Документы/отчет.docx");
МассивПутей.Добавить("Изображения/фото.jpg");

Результат = OPI_RAR.РазархивироватьФайлы(ПутьАрхива, МассивПутей, КаталогНазначения);
```

### Getting Archive Information

**File List**

The `ПолучитьСписокФайлов` function returns a hierarchical list of files and directories contained in the archive.

```bsl
ПутьАрхива = "C:\Архивы\архив.rar";
Пароль = "МойПароль123";

СписокФайлов = OPI_RAR.ПолучитьСписокФайлов(ПутьАрхива, Пароль);
```

**Archive Metadata**

The `ПолучитьМетаданные` function returns archive metadata and a flat list of all files with their characteristics.

```bsl
ПутьАрхива = "C:\Архивы\архив.rar";

Метаданные = OPI_RAR.ПолучитьМетаданные(ПутьАрхива);
```

### Archive Settings

The `ПолучитьСтруктуруНастроекАрхивации` function returns a structure with additional settings for working with the archive:

- **password** — password for working with a protected archive

**Example of using settings:**

```bsl
Настройки = OPI_RAR.ПолучитьСтруктуруНастроекАрхивации(Истина);
Настройки["password"] = "СекретныйПароль";

Результат = OPI_RAR.РазархивироватьКаталог(ПутьАрхива, КаталогНазначения, Настройки["password"]);
```

### Working with Binary Data

The library supports working not only with files on disk, but also with archive binary data in memory:

```bsl
// Чтение архива в память
ДвоичныеДанные = Новый ДвоичныеДанные("C:\Архивы\архив.rar");

// Распаковка из памяти
Результат = OPI_RAR.РазархивироватьКаталог(ДвоичныеДанные, "C:\Распаковка");

// Получение списка файлов из памяти
СписокФайлов = OPI_RAR.ПолучитьСписокФайлов(ДвоичныеДанные);
```

:::tip
When working with large archives, it is recommended to use file paths on disk instead of binary data to optimize memory usage
:::

:::note
When unpacking without specifying a destination directory, the result will be returned as a map with file names and their binary data
:::