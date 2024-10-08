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
  "ID": "12396",
  "NAME": "New file name.jpg",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "file",
  "PARENT_ID": "3",
  "DELETED_TYPE": "0",
  "GLOBAL_CONTENT_VERSION": "1",
  "FILE_ID": "8546",
  "SIZE": "805189",
  "CREATE_TIME": "2024-10-07T22:25:16+03:00",
  "UPDATE_TIME": "2024-10-07T22:25:16+03:00",
  "DELETE_TIME": null,
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": "0",
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=7c430467006e9f06006b12e4000000010000071103f1c469e314f967ff9f4fd9ddbb4d&token=disk%7CaWQ9MTIzOTYmXz16TkRDWDhDQVpxd3FJSnFGa21YTmNTZ1FzWVZWSHhmdQ%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXpPVFltWHoxNlRrUkRXRGhEUVZweGQzRkpTbkZHYTIxWVRtTlRaMUZ6V1ZaV1NIaG1kUT09fDdjNDMwNDY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3MTEwM2YxYzQ2OWUzMTRmOTY3ZmY5ZjRmZDlkZGJiNGQi.wizol7ekCdRMVs%2F657ebJBnOqg8%2FGyTG%2FJBfnbaQhjo%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/New file name.jpg"
 },
 "time": {
  "start": 1728329136.85884,
  "finish": 1728329136.9009,
  "duration": 0.0420670509338379,
  "processing": 0.0165870189666748,
  "date_start": "2024-10-07T22:25:36+03:00",
  "date_finish": "2024-10-07T22:25:36+03:00",
  "operating_reset_at": 1728329736,
  "operating": 0
 }
}
```
