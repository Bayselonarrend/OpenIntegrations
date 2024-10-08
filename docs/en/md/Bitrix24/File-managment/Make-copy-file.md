---
sidebar_position: 8
---

# Copy file
 Copy file from one destination to another



`Function MakeCopyFile(Val URL, Val FileID, Val FolderID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | FileID | --fileid | String, Number | Original file ID |
  | FolderID | --folderid | String, Number | ID of copy destination folder |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [disk.file.copyto](https://dev.1c-bitrix.ru/rest_help/disk/file/disk_file_copyto.php)
:::
<br/>


```bsl title="Code example"
    FolderID = "10840";
    FileID   = "10836";

    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.MakeCopyFile(URL, FileID, FolderID);

    FolderID = "10842";

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "37d1fe66006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.MakeCopyFile(URL, FileID, FolderID, Token);

    OPI_TestDataRetrieval.Check_BitrixObject(Result);
```



```sh title="CLI command example"
    
  oint bitrix24 MakeCopyFile --url %url% --fileid %fileid% --folderid %folderid% --token %token%

```

```json title="Result"
{
 "result": {
  "ID": 12424,
  "NAME": "New file name.jpg",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "file",
  "PARENT_ID": "12402",
  "DELETED_TYPE": 0,
  "GLOBAL_CONTENT_VERSION": 1,
  "FILE_ID": 8558,
  "SIZE": "805189",
  "CREATE_TIME": "2024-10-07T22:25:41+03:00",
  "UPDATE_TIME": "2024-10-07T22:25:41+03:00",
  "DELETE_TIME": null,
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": null,
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=7c430467006e9f06006b12e4000000010000071103f1c469e314f967ff9f4fd9ddbb4d&token=disk%7CaWQ9MTI0MjQmXz1qTHYwaGU2d1h6T3JFOUZnN2pTeDRjUXp6MTY1aFYyTw%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USTBNalFtWHoxcVRIWXdhR1UyZDFoNlQzSkZPVVpuTjJwVGVEUmpVWHA2TVRZMWFGWXlUdz09fDdjNDMwNDY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3MTEwM2YxYzQ2OWUzMTRmOTY3ZmY5ZjRmZDlkZGJiNGQi.CNTgLuT4GHJnHpcClHQbxUgJtjmnBOy6lflkc8%2BE44g%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/New catalog/New file name.jpg"
 },
 "time": {
  "start": 1728329141.65141,
  "finish": 1728329141.71974,
  "duration": 0.0683259963989258,
  "processing": 0.0403859615325928,
  "date_start": "2024-10-07T22:25:41+03:00",
  "date_finish": "2024-10-07T22:25:41+03:00",
  "operating_reset_at": 1728329741,
  "operating": 0
 }
}
```
