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
    FolderID = "6878";
    FileID   = "6874";

    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.MakeCopyFile(URL, FileID, FolderID);

    FolderID = "6880";

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "ec4dc366006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.MakeCopyFile(URL, FileID, FolderID, Token);

    Check_BitrixObject(Result);
```



```sh title="CLI command example"
    
  oint bitrix24 MakeCopyFile --url %url% --fileid %fileid% --folderid %folderid% --token %token%

```

```json title="Result"
{
 "result": {
  "ID": 5958,
  "NAME": "New file name.jpg",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "file",
  "PARENT_ID": "5936",
  "DELETED_TYPE": 0,
  "GLOBAL_CONTENT_VERSION": 1,
  "FILE_ID": 4230,
  "SIZE": "805189",
  "CREATE_TIME": "2024-08-13T17:26:02+00:00",
  "UPDATE_TIME": "2024-08-13T17:26:02+00:00",
  "DELETE_TIME": null,
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": null,
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=aba4bb66006e9f06006b12e4000000010000078ccb238dd380607b513bb1436f5f0e65&token=disk%7CaWQ9NTk1OCZfPURKUWNlZFNScjFJbWRhSE5sRzlzMEQ3TGNqNWZnNWJ5%7CImRvd25sb2FkfGRpc2t8YVdROU5UazFPQ1pmUFVSS1VXTmxaRk5TY2pGSmJXUmhTRTVzUnpsek1FUTNUR05xTldabk5XSjV8YWJhNGJiNjYwMDZlOWYwNjAwNmIxMmU0MDAwMDAwMDEwMDAwMDc4Y2NiMjM4ZGQzODA2MDdiNTEzYmIxNDM2ZjVmMGU2NSI%3D.kRQ1zckNbzWV9waCc6RSYHuMsuFlqcvgjBBN1017kqM%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/New catalog/New file name.jpg"
 },
 "time": {
  "start": 1723569962.08058,
  "finish": 1723569962.14731,
  "duration": 0.0667338371276856,
  "processing": 0.0434801578521728,
  "date_start": "2024-08-13T17:26:02+00:00",
  "date_finish": "2024-08-13T17:26:02+00:00",
  "operating_reset_at": 1723570562,
  "operating": 0
 }
}
```
