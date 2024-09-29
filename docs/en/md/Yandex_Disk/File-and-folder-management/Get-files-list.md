---
sidebar_position: 8
---

# Get list of files
Gets a list of files with or without filtering by type List of available types: audio, backup, book, compressed, data, development, diskimage, document, encoded, executable, flash, font, mage, settings, spreadsheet, text, unknown, video, web



`Function GetFilesList(Val Token, Val Count = 0, Val OffsetFromStart = 0, Val FilterByType = "", Val SortByDate = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Count | --amount | Number, String | Number of returned objects |
  | OffsetFromStart | --offset | Number | Offset for getting objects not from the beginning of the list |
  | FilterByType | --type | String | Filter by file type |
  | SortByDate | --datesort | Boolean | True > sort by date, False > alphabetically |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Yandex

<br/>




```bsl title="Code example"
    Token           = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    Count           = 2;
    OffsetFromStart = 1;
    FilterByType    = "image";

    Result = OPI_YandexDisk.GetFilesList(Token, Count, OffsetFromStart, FilterByType);
```



```sh title="CLI command example"
    
  oint yadisk GetFilesList --token "y0_AgAAAABdylaOAA..." --amount %amount% --offset %offset% --type %type% --datesort %datesort%

```

```json title="Result"

```
