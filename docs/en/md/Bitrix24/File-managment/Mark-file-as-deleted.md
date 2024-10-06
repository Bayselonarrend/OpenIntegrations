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
  "ID": "12096",
  "NAME": "New file name.jpg",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "file",
  "PARENT_ID": "3",
  "DELETED_TYPE": "3",
  "GLOBAL_CONTENT_VERSION": "1",
  "FILE_ID": "8346",
  "SIZE": "805189",
  "CREATE_TIME": "2024-10-05T18:05:43+03:00",
  "UPDATE_TIME": "2024-10-05T18:05:43+03:00",
  "DELETE_TIME": "2024-10-05T18:06:03+03:00",
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": "1",
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=a7630167006e9f06006b12e400000001000007e2e201aeb9fedba2013080af5a95c05e&token=disk%7CaWQ9MTIwOTYmXz1ES25ycVZIbWZEQjhWRHBQUUtSMzRyVDRrSkExYjJNYg%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXdPVFltWHoxRVMyNXljVlpJYldaRVFqaFdSSEJRVVV0U016UnlWRFJyU2tFeFlqSk5ZZz09fGE3NjMwMTY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3ZTJlMjAxYWViOWZlZGJhMjAxMzA4MGFmNWE5NWMwNWUi.tqZQMFtwpXLflQB5QYThbszfl9Ec5arhBdzkohFahMc%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/New file name.jpgi17281407639387i"
 },
 "time": {
  "start": 1728140764.01768,
  "finish": 1728140764.0516,
  "duration": 0.033919095993042,
  "processing": 0.00618910789489746,
  "date_start": "2024-10-05T18:06:04+03:00",
  "date_finish": "2024-10-05T18:06:04+03:00",
  "operating_reset_at": 1728141364,
  "operating": 0
 }
}
```
