---
id: Tar
sidebar_class_name: Tar
keywords: [1C, 1C, 1C:Enterprise, 1C:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, tar]
---

<img src={require('../../static/img/APIs/Tar.png').default} width='64px' />

# Tar

import LibraryIntro from '@site/src/components/LibraryIntro';

<LibraryIntro module="OPI_Tar" cli="tar" use="oint/formats/tar" lang="en"/>

The `OPI_Tar` library is for **creating, unpacking and modifying** tar archives (including `.tar.gz`) in 1C:Enterprise, OneScript and CLI. This page gives a short overview and typical workflows; see child sections for full method signatures and examples.

## Capabilities

| Task | Method |
|------|--------|
| Pack a directory into tar/tar.gz | [`ArchiveDirectory`](/docs/Tar/Archiving/Archive-directory) |
| Unpack the whole archive to a directory | [`UnarchiveDirectory`](/docs/Tar/Archiving/Unarchive-directory) |
| Extract selected files only | [`UnpackFiles`](/docs/Tar/Archiving/Unpack-files) |
| Add, replace or delete files | [`ModifyArchive`](/docs/Tar/Archiving/Modify-archive) |
| Get a settings template (gzip, etc.) | [`GetArchivingSettingsStructure`](/docs/Tar/Archiving/Get-archiving-settings-structure) |
| Get a tree of files and folders | [`GetFilesList`](/docs/Tar/Getting-metadata/Get-files-list) |
| Get metadata and a flat file list | [`GetMetadata`](/docs/Tar/Getting-metadata/Get-metadata) |

The archive and source directory can be passed as a **file/folder path on disk** or **binary data**. If you omit the save path when archiving or the destination directory when unpacking, the result is returned in memory (binary data or a map).

## Typical workflow

A common flow:

1. Pack a directory — `ArchiveDirectory` (with gzip via `Settings` when needed).
2. Inspect the archive — `GetFilesList` or `GetMetadata`.
3. Unpack everything — `UnarchiveDirectory`, or modify in place — `ModifyArchive`.

```bsl
SourceDirectory = "C:\Data\project";
ArchivePath     = "C:\Archives\project.tar.gz";

// 1. Create tar.gz
Settings = OPI_Tar.GetArchivingSettingsStructure(True);
Settings["gzip"]       = True;
Settings["gzip_level"] = 6;

Result = OPI_Tar.ArchiveDirectory(SourceDirectory, ArchivePath, Settings);

// 2. Inspect contents
FileList = OPI_Tar.GetFilesList(ArchivePath);
```

## Archiving

`ArchiveDirectory` packs files from the specified directory. The second argument is the save path; if omitted, the archive is returned as `BinaryData`.

```bsl
SourceDirectory = "C:\MyFolder";
ArchivePath     = "C:\Archives\archive.tar";

Result = OPI_Tar.ArchiveDirectory(SourceDirectory, ArchivePath);
```

### gzip settings

`GetArchivingSettingsStructure` returns a structure of optional parameters:

- **gzip** — apply gzip compression: `True`/`False` (default `False`)
- **gzip_level** — compression level from 0 to 9 (default 6)

```bsl
Settings = OPI_Tar.GetArchivingSettingsStructure(True);
Settings["gzip"]       = True;
Settings["gzip_level"] = 9;

Result = OPI_Tar.ArchiveDirectory(SourceDirectory, "C:\Archives\archive.tar.gz", Settings);
```

:::tip
Use `gzip_level = 9` for maximum compression; lower values (e.g. 1–3) for faster archive creation.
:::

## Unpacking

### Full archive

`UnarchiveDirectory` extracts all entries into the target directory.

```bsl
ArchivePath             = "C:\Archives\archive.tar";
DestinationDirectory    = "C:\Unpack";

Result = OPI_Tar.UnarchiveDirectory(ArchivePath, DestinationDirectory);
```

### Selected files

`UnpackFiles` takes an array of **full paths inside the archive**.

```bsl
Paths = New Array;
Paths.Add("docs/readme.txt");
Paths.Add("config/settings.json");

Result = OPI_Tar.UnpackFiles(ArchivePath, Paths, DestinationDirectory);
```

:::tip
Paths inside tar usually use forward slashes (`/`). Before partial unpack, call `GetFilesList` or `GetMetadata` and reuse paths from the response.
:::

## Modifying archives

`ModifyArchive` adds, replaces or deletes files in an existing archive. An on-disk archive is modified **in place**; gzip options go in `Settings`.

```bsl
ArchivePath = "C:\Archives\archive.tar";

Additions = New Map;
Additions.Insert("docs/new.txt", "C:\Files\new.txt");

Deletions = New Array;
Deletions.Add("old/obsolete.txt");

Result = OPI_Tar.ModifyArchive(ArchivePath, Additions, Deletions);
```

:::important
When modifying an on-disk archive, gzip parameters must be set in the `Settings` structure (see [`GetArchivingSettingsStructure`](/docs/Tar/Archiving/Get-archiving-settings-structure)).
:::

## Inspecting contents

**`GetFilesList`** — hierarchical tree of folders and files.

**`GetMetadata`** — archive summary and a **flat** file list with attributes.

```bsl
Tree     = OPI_Tar.GetFilesList(ArchivePath);
Metadata = OPI_Tar.GetMetadata(ArchivePath);
```

## File path vs binary data

The `Archive` and directory arguments accept a disk path or `BinaryData`.

```bsl
BinaryData = New BinaryData("C:\Archives\archive.tar.gz");

FileList = OPI_Tar.GetFilesList(BinaryData);
Result   = OPI_Tar.UnarchiveDirectory(BinaryData, "C:\Unpack");
```

If you **omit** the destination directory when unpacking, the result is a map of paths to binary data. When archiving without a save path, you get `BinaryData` of the archive.

```bsl
// Archive contents as a map, without writing to disk
Description = OPI_Tar.UnarchiveDirectory(BinaryData);

// Archive in memory, without writing to disk
ArchiveInMemory = OPI_Tar.ArchiveDirectory(SourceDirectory);
```

:::tip
For large archives, prefer a file path on disk: lower memory use.
:::

:::note
Response fields, CLI options and sample outputs are documented on each method page under [Archiving](/docs/Tar/Archiving/Archive-directory) and [Getting metadata](/docs/Tar/Getting-metadata/Get-files-list).
:::
