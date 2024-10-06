---
sidebar_position: 7
---

# Restore file
 Restore file from recycle bin



`Function RestoreFile(Val URL, Val FileID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | FileID | --fileid | String, Number | File identifier |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [disk.file.restore](https://dev.1c-bitrix.ru/rest_help/disk/file/disk_file_restore.php)
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    FileID = "10836";

    Result = OPI_Bitrix24.RestoreFile(URL, FileID);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "37d1fe66006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.RestoreFile(URL, FileID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 RestoreFile --url "b24-ar17wx.bitrix24.by" --fileid "5010" --token "fe3fa966006e9f06006b12e400000001000..."

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
  "UPDATE_TIME": "2024-10-05T18:06:04+03:00",
  "DELETE_TIME": "2024-10-05T18:06:03+03:00",
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": "1",
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=a7630167006e9f06006b12e400000001000007e2e201aeb9fedba2013080af5a95c05e&token=disk%7CaWQ9MTIwOTYmXz1iaDhOQmhPT2JRcUhhOFNPSFluN2p0a0pORFlUYVVUVg%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXdPVFltWHoxaWFEaE9RbWhQVDJKUmNVaGhPRk5QU0ZsdU4ycDBhMHBPUkZsVVlWVlVWZz09fGE3NjMwMTY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3ZTJlMjAxYWViOWZlZGJhMjAxMzA4MGFmNWE5NWMwNWUi.FMFq3hDOC1RPc7ztbS0HZ9HLquXEYUHEluXazVRPmPQ%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/New file name.jpg"
 },
 "time": {
  "start": 1728140764.33056,
  "finish": 1728140764.37021,
  "duration": 0.0396509170532227,
  "processing": 0.00859999656677246,
  "date_start": "2024-10-05T18:06:04+03:00",
  "date_finish": "2024-10-05T18:06:04+03:00",
  "operating_reset_at": 1728141364,
  "operating": 0
 }
}
```
