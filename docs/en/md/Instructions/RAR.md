---
id: RAR
sidebar_class_name: RAR
keywords: [1C, 1C, 1C:Enterprise, 1C:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, RAR]
---

<img src={require('../../static/img/APIs/RAR.png').default} width='64px' />

# RAR

import LibraryIntro from '@site/src/components/LibraryIntro';

<LibraryIntro module="OPI_RAR" cli="rar" use="oint/formats/rar" lang="en"/>

The `OPI_RAR` library is for **reading and unpacking** existing RAR archives in 1C:Enterprise, OneScript and CLI. This page gives a short overview and typical workflows; see child sections for full method signatures and examples.

:::important
**Creating or modifying** RAR archives is not supported.
:::

## Capabilities

| Task | Method |
|------|--------|
| Unpack the whole archive to a directory | [`РазархивироватьКаталог`](/docs/RAR/Unarchiving/Unarchive-directory) |
| Extract selected files only | [`РазархивироватьФайлы`](/docs/RAR/Unarchiving/Unpack-files) |
| Get a tree of files and folders | [`ПолучитьСписокФайлов`](/docs/RAR/Getting-metadata/Get-files-list) |
| Get metadata and a flat file list | [`ПолучитьМетаданные`](/docs/RAR/Getting-metadata/Get-metadata) |

Where applicable, the archive can be passed as a **file path** or **binary data**. For password-protected archives, use the `Пароль` parameter (CLI: `--password`).

## Typical workflow

A common flow:

1. Inspect the archive — `ПолучитьСписокФайлов` or `ПолучитьМетаданные`.
2. Unpack everything — `РазархивироватьКаталог`, or only chosen paths — `РазархивироватьФайлы`.

```bsl
ПутьАрхива = "C:\Inbox\package.rar";

// 1. Paths inside the archive
Список = OPI_RAR.ПолучитьСписокФайлов(ПутьАрхива);

// 2. Unpack to a folder
Результат = OPI_RAR.РазархивироватьКаталог(ПутьАрхива, "C:\Unpack");
```

## Unpacking

### Full archive

`РазархивироватьКаталог` extracts all entries into the target directory. Pass the password as the third argument when needed.

```bsl
ПутьАрхива = "C:\Archives\archive.rar";
КаталогНазначения = "C:\Unpack";

Результат = OPI_RAR.РазархивироватьКаталог(ПутьАрхива, КаталогНазначения);

// Password-protected archive
Результат = OPI_RAR.РазархивироватьКаталог(ПутьАрхива, КаталогНазначения, "MyPassword123");
```

### Selected files

`РазархивироватьФайлы` takes an array of **full paths inside the archive** — the same strings you get from listing methods.

```bsl
ПутьАрхива = "C:\Archives\archive.rar";
КаталогНазначения = "C:\Unpack";

Пути = Новый Массив;
Пути.Добавить("readme.txt");
Пути.Добавить("docs\note.txt");

Результат = OPI_RAR.РазархивироватьФайлы(ПутьАрхива, Пути, КаталогНазначения);
```

:::tip
Internal paths depend on how the archive was built. Before partial unpack, call `ПолучитьСписокФайлов` or `ПолучитьМетаданные` and reuse paths from the response.
:::

## Inspecting contents

**`ПолучитьСписокФайлов`** — hierarchical tree of folders and files. Best when you need structure or paths for `РазархивироватьФайлы`.

**`ПолучитьМетаданные`** — archive summary and a **flat** file list with attributes (size, dates, etc.). Best for analysis without walking a tree.

```bsl
ПутьАрхива = "C:\Archives\archive.rar";
Пароль = "MyPassword123";

Дерево = OPI_RAR.ПолучитьСписокФайлов(ПутьАрхива, Пароль);
Метаданные = OPI_RAR.ПолучитьМетаданные(ПутьАрхива, Пароль);
```

## File path vs binary data

The first argument (`Архив`) is either a path to a `.rar` file or `ДвоичныеДанные` in memory.

```bsl
ДвоичныеДанные = Новый ДвоичныеДанные("C:\Archives\archive.rar");

Список = OPI_RAR.ПолучитьСписокФайлов(ДвоичныеДанные);
Результат = OPI_RAR.РазархивироватьКаталог(ДвоичныеДанные, "C:\Unpack");
```

If you **omit** the destination directory when unpacking, the result is a map of paths to binary data (or a content description) — useful for small archives and in-memory workflows.

```bsl
// Archive contents as a map, without writing to disk
Описание = OPI_RAR.РазархивироватьКаталог(ДвоичныеДанные);
```

:::tip
For large archives, prefer a file path on disk: lower memory use and no need to load the whole archive into `ДвоичныеДанные` upfront.
:::

:::note
Response fields, CLI options and sample outputs are documented on each method page under [Unarchiving](/docs/RAR/Unarchiving/Unarchive-directory) and [Getting metadata](/docs/RAR/Getting-metadata/Get-files-list).
:::
