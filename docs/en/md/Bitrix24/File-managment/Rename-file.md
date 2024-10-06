---
sidebar_position: 10
---

# Rename file
 Changes the name of an existing file



`Function RenameFile(Val URL, Val FileID, Val Name, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | FileID | --fileid | String, Number | File identifier |
  | Name | --title | String | New folders name |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [disk.file.rename](https://dev.1c-bitrix.ru/rest_help/disk/file/disk_file_rename.php)
:::
<br/>


```bsl title="Code example"
    Name      = "New file name.jpg";
    Filename2 = "New file name 2.jpg";

    FileID2 = "10834";
    URL     = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.RenameFile(URL, FileID2, Filename2);

    FileID = "10836";
    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "37d1fe66006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.RenameFile(URL, FileID, Name, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 RenameFile --url "b24-ar17wx.bitrix24.by" --fileid "5010" --title %title% --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": {
  "ID": "12096",
  "NAME": "New file name.jpg",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "file",
  "PARENT_ID": "3",
  "DELETED_TYPE": "0",
  "GLOBAL_CONTENT_VERSION": "1",
  "FILE_ID": "8346",
  "SIZE": "805189",
  "CREATE_TIME": "2024-10-05T18:05:43+03:00",
  "UPDATE_TIME": "2024-10-05T18:05:43+03:00",
  "DELETE_TIME": null,
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": "0",
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=a7630167006e9f06006b12e400000001000007e2e201aeb9fedba2013080af5a95c05e&token=disk%7CaWQ9MTIwOTYmXz1BZUg2OGZoSGZpd1cyM2tJUWdiWHdHendCTkNkNmdaVA%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXdPVFltWHoxQlpVZzJPR1pvU0dacGQxY3lNMnRKVVdkaVdIZEhlbmRDVGtOa05tZGFWQT09fGE3NjMwMTY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3ZTJlMjAxYWViOWZlZGJhMjAxMzA4MGFmNWE5NWMwNWUi.QotKd8yyEpR7w2cYYWfDaRHLrRk%2Bbxf2a54fUQWjKD0%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/New file name.jpg"
 },
 "time": {
  "start": 1728140763.80497,
  "finish": 1728140763.84931,
  "duration": 0.0443429946899414,
  "processing": 0.0157449245452881,
  "date_start": "2024-10-05T18:06:03+03:00",
  "date_finish": "2024-10-05T18:06:03+03:00",
  "operating_reset_at": 1728141363,
  "operating": 0
 }
}
```
