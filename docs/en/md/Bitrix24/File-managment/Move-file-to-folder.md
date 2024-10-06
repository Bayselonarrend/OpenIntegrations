---
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
  "ID": "12096",
  "NAME": "New file name.jpg",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "file",
  "PARENT_ID": 12106,
  "DELETED_TYPE": "0",
  "GLOBAL_CONTENT_VERSION": "1",
  "FILE_ID": "8346",
  "SIZE": "805189",
  "CREATE_TIME": "2024-10-05T18:05:43+03:00",
  "UPDATE_TIME": "2024-10-05T18:06:04+03:00",
  "DELETE_TIME": "2024-10-05T18:06:03+03:00",
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": "1",
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=a7630167006e9f06006b12e400000001000007e2e201aeb9fedba2013080af5a95c05e&token=disk%7CaWQ9MTIwOTYmXz16aEwxQTlTVDg0cEJEV0YyUWlzNWZpSFRpYk12UDRqWA%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXdPVFltWHoxNmFFd3hRVGxUVkRnMGNFSkVWMFl5VVdsek5XWnBTRlJwWWsxMlVEUnFXQT09fGE3NjMwMTY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3ZTJlMjAxYWViOWZlZGJhMjAxMzA4MGFmNWE5NWMwNWUi.y%2FzLnJT8nQKlCSGaqkppIizrtcRDkTLc4rgYEroY9D0%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/New catalog/New subfolder/New file name.jpg"
 },
 "time": {
  "start": 1728140765.56824,
  "finish": 1728140765.62378,
  "duration": 0.0555388927459717,
  "processing": 0.0275230407714844,
  "date_start": "2024-10-05T18:06:05+03:00",
  "date_finish": "2024-10-05T18:06:05+03:00",
  "operating_reset_at": 1728141365,
  "operating": 0
 }
}
```
