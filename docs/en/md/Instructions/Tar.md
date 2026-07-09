---
id: Tar
sidebar_class_name: Tar
keywords: [1C, 1С, 1С:Предприятие, 1С:Предприятие 8.3, API, Интеграция, Сервисы, Обмен, OneScript, CLI, tar]
---

<img src={require('../../static/img/APIs/Tar.png').default} width='64px' />

# Tar

import LibraryIntro from '@site/src/components/LibraryIntro';

<LibraryIntro module="OPI_Tar" cli="tar" use="oint/formats/tar" lang="en"/>

This section is dedicated to the library for working with tar archives in 1C:Enterprise, OneScript and CLI. This page describes all the actions necessary for a complete start of work

## Getting Started

The library provides capabilities for working with tar format archives: creating archives, unpacking, extracting individual files, modifying existing archives and working with gzip compression.

### Main Features

**Archiving Directories**

The `АрхивироватьКаталог` function allows you to pack files from the specified directory into a tar archive. You can specify a path to save the archive or get it as binary data.

```bsl
Каталог = "C:\МойКаталог";
ПутьАрхива = "C:\Архивы\архив.tar";

Результат = OPI_Tar.АрхивироватьКаталог(Каталог, ПутьАрхива);
```

**Unpacking Archives**

The `РазархивироватьКаталог` function allows you to unpack a tar archive to a specified directory.

```bsl
ПутьАрхива = "C:\Архивы\архив.tar";
КаталогНазначения = "C:\Распаковка";

Результат = OPI_Tar.РазархивироватьКаталог(ПутьАрхива, КаталогНазначения);
```

**Unpacking Individual Files**

The `РазархивироватьФайлы` function allows you to extract only selected files from the archive by a list of their paths inside the archive.

```bsl
ПутьАрхива = "C:\Архивы\архив.tar";
Пути = Новый Массив;
Пути.Добавить("docs/readme.txt");
Пути.Добавить("config/settings.json");

КаталогНазначения = "C:\Распаковка";

Результат = OPI_Tar.РазархивироватьФайлы(ПутьАрхива, Пути, КаталогНазначения);
```

**Modifying Archives**

The `ИзменитьАрхив` function allows you to add new files, replace or delete existing files in a tar archive without complete repacking.

```bsl
ПутьАрхива = "C:\Архивы\архив.tar";

// Files to add or replace
ДобавляемыеФайлы = Новый Соответствие;
ДобавляемыеФайлы.Вставить("docs/new.txt", "C:\Файлы\новый.txt");

// Files to delete
УдаляемыеПути = Новый Массив;
УдаляемыеПути.Добавить("old/obsolete.txt");

Результат = OPI_Tar.ИзменитьАрхив(ПутьАрхива, ДобавляемыеФайлы, УдаляемыеПути);
```

### Archive Settings

The `ПолучитьСтруктуруНастроекАрхивации` function returns a structure with additional settings for creating an archive:

- **gzip** — apply gzip compression to the archive: `Истина`/`Ложь` (default `Ложь`)
- **gzip_level** — gzip compression level from 0 to 9 (default 6, where 0 is no compression, 9 is maximum compression)

**Example of using settings:**

```bsl
Настройки = OPI_Tar.ПолучитьСтруктуруНастроекАрхивации(Истина);
Настройки["gzip"] = Истина;
Настройки["gzip_level"] = 9;

Каталог = "C:\МойКаталог";
ПутьАрхива = "C:\Архивы\архив.tar.gz";

Результат = OPI_Tar.АрхивироватьКаталог(Каталог, ПутьАрхива, Настройки);
```

:::tip
Using gzip compression allows you to significantly reduce the archive size. For maximum compression use `gzip_level = 9`, for faster archive creation — lower values (for example, 1-3)
:::

:::important
When modifying an existing archive on disk, gzip parameters must be specified in the Settings structure. The archive on disk is modified directly in place
:::

### Getting Archive Information

**Getting File List**

The `ПолучитьСписокФайлов` function returns a hierarchical list of all files and directories in the archive.

```bsl
ПутьАрхива = "C:\Архивы\архив.tar";

СписокФайлов = OPI_Tar.ПолучитьСписокФайлов(ПутьАрхива);
```

**Getting Metadata**

The `ПолучитьМетаданные` function returns archive metadata and a flat list of all files with detailed information.

```bsl
ПутьАрхива = "C:\Архивы\архив.tar";

Метаданные = OPI_Tar.ПолучитьМетаданные(ПутьАрхива);
```