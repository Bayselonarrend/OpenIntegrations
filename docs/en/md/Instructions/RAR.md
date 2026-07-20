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
| Unpack the whole archive to a directory | [`UnarchiveDirectory`](/docs/RAR/Unarchiving/Unarchive-directory) |
| Extract selected files only | [`UnpackFiles`](/docs/RAR/Unarchiving/Unpack-files) |
| Get a tree of files and folders | [`GetFilesList`](/docs/RAR/Getting-metadata/Get-files-list) |
| Get metadata and a flat file list | [`GetMetadata`](/docs/RAR/Getting-metadata/Get-metadata) |

Where applicable, the archive can be passed as a **file path** or **binary data**. For password-protected archives, use the `Password` parameter (CLI: `--password`).

## Typical workflow

A common flow:

1. Inspect the archive — `GetFilesList` or `GetMetadata`.
2. Unpack everything — `UnarchiveDirectory`, or only chosen paths — `UnpackFiles`.

```bsl
ArchivePath = "C:\Inbox\package.rar";

// 1. Paths inside the archive
FileList = OPI_RAR.GetFilesList(ArchivePath);

// 2. Unpack to a folder
Result = OPI_RAR.UnarchiveDirectory(ArchivePath, "C:\Unpack");
```

## Unpacking

### Full archive

`UnarchiveDirectory` extracts all entries into the target directory. Pass the password as the third argument when needed.

```bsl
ArchivePath          = "C:\Archives\archive.rar";
DestinationDirectory = "C:\Unpack";

Result = OPI_RAR.UnarchiveDirectory(ArchivePath, DestinationDirectory);

// Password-protected archive
Result = OPI_RAR.UnarchiveDirectory(ArchivePath, DestinationDirectory, "MyPassword123");
```

### Selected files

`UnpackFiles` takes an array of **full paths inside the archive** — the same strings you get from listing methods.

```bsl
ArchivePath          = "C:\Archives\archive.rar";
DestinationDirectory = "C:\Unpack";

Paths = New Array;
Paths.Add("readme.txt");
Paths.Add("docs\note.txt");

Result = OPI_RAR.UnpackFiles(ArchivePath, Paths, DestinationDirectory);
```

:::tip
Internal paths depend on how the archive was built. Before partial unpack, call `GetFilesList` or `GetMetadata` and reuse paths from the response.
:::

## Inspecting contents

**`GetFilesList`** — hierarchical tree of folders and files. Best when you need structure or paths for `UnpackFiles`.

**`GetMetadata`** — archive summary and a **flat** file list with attributes (size, dates, etc.). Best for analysis without walking a tree.

```bsl
ArchivePath = "C:\Archives\archive.rar";
Password    = "MyPassword123";

Tree     = OPI_RAR.GetFilesList(ArchivePath, Password);
Metadata = OPI_RAR.GetMetadata(ArchivePath, Password);
```

## File path vs binary data

The first argument (`Archive`) is either a path to a `.rar` file or `BinaryData` in memory.

```bsl
BinaryData = New BinaryData("C:\Archives\archive.rar");

FileList = OPI_RAR.GetFilesList(BinaryData);
Result   = OPI_RAR.UnarchiveDirectory(BinaryData, "C:\Unpack");
```

If you **omit** the destination directory when unpacking, the result is a map of paths to binary data (or a content description) — useful for small archives and in-memory workflows.

```bsl
// Archive contents as a map, without writing to disk
Description = OPI_RAR.UnarchiveDirectory(BinaryData);
```

:::tip
For large archives, prefer a file path on disk: lower memory use and no need to load the whole archive into `BinaryData` upfront.
:::

:::note
Response fields, CLI options and sample outputs are documented on each method page under [Unarchiving](/docs/RAR/Unarchiving/Unarchive-directory) and [Getting metadata](/docs/RAR/Getting-metadata/Get-files-list).
:::
