﻿---
sidebar_position: 4
---

# Move folder
 Moves one folder inside another



`Function MoveFolder(Val URL, Val FolderID, Val DestinationID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | FolderID | --folderid | String, Number | Folder identifier |
  | DestinationID | --tagetid | String, Number | ID of target folder |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [disk.folder.moveto](https://dev.1c-bitrix.ru/rest_help/disk/folder/disk_folder_moveto.php)
:::
<br/>


```bsl title="Code example"
    DestinationID = "10840";
    FolderID      = "10846";

    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.MoveFolder(URL, FolderID, DestinationID);

    FolderID = "10844";

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "37d1fe66006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.MoveFolder(URL, FolderID, DestinationID, Token);

    OPI_TestDataRetrieval.Check_BitrixObject(Result);
```



```sh title="CLI command example"
    
  oint bitrix24 MoveFolder --url "b24-ar17wx.bitrix24.by" --folderid "5018" --tagetid "5014" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": {
  "ID": "12584",
  "NAME": "New subfolder 2",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "folder",
  "REAL_OBJECT_ID": "12584",
  "PARENT_ID": 12580,
  "DELETED_TYPE": "0",
  "CREATE_TIME": "2024-10-09T09:20:24+03:00",
  "UPDATE_TIME": "2024-10-09T09:20:25+03:00",
  "DELETE_TIME": null,
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": "0",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/path/New folder 2/New subfolder 2"
 },
 "time": {
  "start": 1728454829.50812,
  "finish": 1728454829.56734,
  "duration": 0.0592169761657715,
  "processing": 0.0330197811126709,
  "date_start": "2024-10-09T09:20:29+03:00",
  "date_finish": "2024-10-09T09:20:29+03:00",
  "operating_reset_at": 1728455429,
  "operating": 0
 }
}
```
