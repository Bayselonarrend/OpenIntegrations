---
sidebar_position: 6
---

# Mark file as deleted
 Move file to recycle bin



`Function MarkFileAsDeleted(Val URL, Val FileID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | FileID | --fileid | String, Number | File identifier |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [disk.file.markdeleted](https://dev.1c-bitrix.ru/rest_help/disk/file/disk_file_markdeleted.php)
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    FileID = "10836";

    Result = OPI_Bitrix24.MarkFileAsDeleted(URL, FileID);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "37d1fe66006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.MarkFileAsDeleted(URL, FileID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 MarkFileAsDeleted --url "b24-ar17wx.bitrix24.by" --fileid "5010" --token "fe3fa966006e9f06006b12e400000001000..."

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
  "DELETED_TYPE": "3",
  "GLOBAL_CONTENT_VERSION": "1",
  "FILE_ID": "8546",
  "SIZE": "805189",
  "CREATE_TIME": "2024-10-07T22:25:16+03:00",
  "UPDATE_TIME": "2024-10-07T22:25:16+03:00",
  "DELETE_TIME": "2024-10-07T22:25:36+03:00",
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": "1",
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=7c430467006e9f06006b12e4000000010000071103f1c469e314f967ff9f4fd9ddbb4d&token=disk%7CaWQ9MTIzOTYmXz1mNDY5VzhCaEJ0b0FQT1A2RWNXV2FNM3NPSG1aT1FJcw%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXpPVFltWHoxbU5EWTVWemhDYUVKMGIwRlFUMUEyUldOWFYyRk5NM05QU0cxYVQxRkpjdz09fDdjNDMwNDY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3MTEwM2YxYzQ2OWUzMTRmOTY3ZmY5ZjRmZDlkZGJiNGQi.vJAAX%2FRpxezdV3w5gr9PDeMVnpBue4h1ADbf7%2FuTXR4%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/New file name.jpgi17283291369861i"
 },
 "time": {
  "start": 1728329137.06087,
  "finish": 1728329137.09225,
  "duration": 0.0313799381256104,
  "processing": 0.0053708553314209,
  "date_start": "2024-10-07T22:25:37+03:00",
  "date_finish": "2024-10-07T22:25:37+03:00",
  "operating_reset_at": 1728329737,
  "operating": 0
 }
}
```
