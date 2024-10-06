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
  "ID": 12124,
  "NAME": "New file name.jpg",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "file",
  "PARENT_ID": "12102",
  "DELETED_TYPE": 0,
  "GLOBAL_CONTENT_VERSION": 1,
  "FILE_ID": 8358,
  "SIZE": "805189",
  "CREATE_TIME": "2024-10-05T18:06:08+03:00",
  "UPDATE_TIME": "2024-10-05T18:06:08+03:00",
  "DELETE_TIME": null,
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": null,
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=a7630167006e9f06006b12e400000001000007e2e201aeb9fedba2013080af5a95c05e&token=disk%7CaWQ9MTIxMjQmXz16NjJzMkdndEQwV1FMSGp1R1JUeEloMGRGb2tNakpxcA%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXhNalFtWHoxNk5qSnpNa2RuZEVRd1YxRk1TR3AxUjFKVWVFbG9NR1JHYjJ0TmFrcHhjQT09fGE3NjMwMTY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3ZTJlMjAxYWViOWZlZGJhMjAxMzA4MGFmNWE5NWMwNWUi.J6lPyDwU6Neq1Egu9bdmG%2F5IrGK%2FaJa3FwhjB5JiWa8%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/New catalog/New file name.jpg"
 },
 "time": {
  "start": 1728140768.79284,
  "finish": 1728140768.86956,
  "duration": 0.0767219066619873,
  "processing": 0.0471780300140381,
  "date_start": "2024-10-05T18:06:08+03:00",
  "date_finish": "2024-10-05T18:06:08+03:00",
  "operating_reset_at": 1728141368,
  "operating": 0
 }
}
```
