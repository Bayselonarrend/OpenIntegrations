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

    FileID2 = "5008";
    URL     = "https://b24-ar17wx.bitrix24.by/rest/1/f2pp...";

    Result = OPI_Bitrix24.RenameFile(URL, FileID2, Filename2);

    FileID = "5010";
    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "fe3fa966006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.RenameFile(URL, FileID, Name, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 RenameFile --url "b24-ar17wx.bitrix24.by" --fileid "5010" --title %title% --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": {
  "ID": "1716",
  "NAME": "New file name.jpg",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "file",
  "PARENT_ID": "3",
  "DELETED_TYPE": "0",
  "GLOBAL_CONTENT_VERSION": "1",
  "FILE_ID": "1134",
  "SIZE": "805189",
  "CREATE_TIME": "2024-07-03T14:42:28+00:00",
  "UPDATE_TIME": "2024-07-03T14:42:28+00:00",
  "DELETE_TIME": null,
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": "0",
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=fe708566006e9f06006b12e4000000010000076fcba303ea853529aed2cefade1444b3&token=disk%7CaWQ9MTcxNiZfPWh4MGZDaVNISklmakNDZ2VDQnBGQ25oaWhnUzRVaVNG%7CImRvd25sb2FkfGRpc2t8YVdROU1UY3hOaVpmUFdoNE1HWkRhVk5JU2tsbWFrTkRaMlZEUW5CR1EyNW9hV2huVXpSVmFWTkd8ZmU3MDg1NjYwMDZlOWYwNjAwNmIxMmU0MDAwMDAwMDEwMDAwMDc2ZmNiYTMwM2VhODUzNTI5YWVkMmNlZmFkZTE0NDRiMyI%3D.I5xOjqhubMfxDzA0AHzUE5AzgUeXOOmA4%2FsEKdiUSyQ%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/New file name.jpg"
  },
  "time": {
  "start": 1720017754.0472,
  "finish": 1720017754.09402,
  "duration": 0.0468170642852783,
  "processing": 0.0171689987182617,
  "date_start": "2024-07-03T14:42:34+00:00",
  "date_finish": "2024-07-03T14:42:34+00:00",
  "operating_reset_at": 1720018354,
  "operating": 0
  }
  }
```
