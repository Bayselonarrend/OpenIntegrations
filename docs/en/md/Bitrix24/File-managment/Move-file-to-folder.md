﻿---
sidebar_position: 9
---

# Move file
 Move file from one destination to another



`Function MoveFileToFolder(Val URL, Val FileID, Val FolderID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | FileID | --fileid | String, Number | File ID |
  | FolderID | --folderid | String, Number | ID of new destination folder |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [disk.file.moveto](https://dev.1c-bitrix.ru/rest_help/disk/file/disk_file_moveto.php)
:::
<br/>


```bsl title="Code example"
    FolderID = "10844";
    FileID   = "10836";

    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.MoveFileToFolder(URL, FileID, FolderID);

    FolderID = "10846";

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "37d1fe66006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.MoveFileToFolder(URL, FileID, FolderID, Token);

    OPI_TestDataRetrieval.Check_BitrixObject(Result);
```



```sh title="CLI command example"
    
  oint bitrix24 MoveFileToFolder --url "b24-ar17wx.bitrix24.by" --fileid "5010" --folderid "5020" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": {
  "ID": "12576",
  "NAME": "New file name.jpg",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "file",
  "PARENT_ID": 12586,
  "DELETED_TYPE": "0",
  "GLOBAL_CONTENT_VERSION": "1",
  "FILE_ID": "8666",
  "SIZE": "805189",
  "CREATE_TIME": "2024-10-09T09:20:02+03:00",
  "UPDATE_TIME": "2024-10-09T09:20:23+03:00",
  "DELETE_TIME": "2024-10-09T09:20:23+03:00",
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": "1",
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=6b2e0667006e9f06006b12e4000000010000072c4914d2a629a27f8e468fd6a8ba64ff&token=disk%7CaWQ9MTI1NzYmXz14Y3dRbXoySnl4NlI2MHJJY09SNG1KbE9URTVENlF3aA%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USTFOelltWHoxNFkzZFJiWG95U25sNE5sSTJNSEpKWTA5U05HMUtiRTlVUlRWRU5sRjNhQT09fDZiMmUwNjY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3MmM0OTE0ZDJhNjI5YTI3ZjhlNDY4ZmQ2YThiYTY0ZmYi.i2CHa05fN9FhHCvhCTGArYmKJ24LaHa7VxRKyrHfs10%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/New catalog/New subfolder/New file name.jpg"
 },
 "time": {
  "start": 1728454825.05896,
  "finish": 1728454825.12211,
  "duration": 0.06315016746521,
  "processing": 0.0357410907745361,
  "date_start": "2024-10-09T09:20:25+03:00",
  "date_finish": "2024-10-09T09:20:25+03:00",
  "operating_reset_at": 1728455425,
  "operating": 0
 }
}
```
