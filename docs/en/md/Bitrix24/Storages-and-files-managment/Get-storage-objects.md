---
sidebar_position: 5
---

# Get a list of child storage objects
 Get a list of files and folders, located at the root of the storage


<br/>


`Function GetStorageObjects(Val URL, Val StorageID, Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | StorageID | --storageid | String, Number | Storage ID |
 | Token | --token | String | Access token, when not-webhook method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>




```bsl title="Code example"
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
 StorageID = 3;
 Result = OPI_Bitrix24.GetStorageObjects(URL, StorageID);
 
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "b9df7366006e9f06006b12e400000001000...";
 
 Result = OPI_Bitrix24.GetStorageObjects(URL, StorageID, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 GetStorageObjects --url "b24-ar17wx.bitrix24.by" --storageid %storageid% --token "b9df7366006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": [
 {
 "ID": "568",
 "NAME": "Picture2.jpg",
 "CODE": null,
 "STORAGE_ID": "3",
 "TYPE": "file",
 "PARENT_ID": "3",
 "DELETED_TYPE": "0",
 "GLOBAL_CONTENT_VERSION": "1",
 "FILE_ID": "558",
 "SIZE": "2114023",
 "CREATE_TIME": "2024-06-22T09:07:30+00:00",
 "UPDATE_TIME": "2024-06-22T09:07:30+00:00",
 "DELETE_TIME": null,
 "CREATED_BY": "1",
 "UPDATED_BY": "1",
 "DELETED_BY": "0",
 "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=efa17666006e9f06006b12e400000001000007b2f26f9898812ad669fd7da83d478d1a&token=disk%7CaWQ9NTY4Jl89NnBxNndlcmpudjQwY0tHNnZhdVN2VHZ2TTYwSmFFSXA%3D%7CImRvd25sb2FkfGRpc2t8YVdROU5UWTRKbDg5Tm5CeE5uZGxjbXB1ZGpRd1kwdEhOblpoZFZOMlZIWjJUVFl3U21GRlNYQT18ZWZhMTc2NjYwMDZlOWYwNjAwNmIxMmU0MDAwMDAwMDEwMDAwMDdiMmYyNmY5ODk4ODEyYWQ2NjlmZDdkYTgzZDQ3OGQxYSI%3D.qSfz7Ap6RM8nwlRRrw4lqlYcNQoHQJMcdzSbvlLHw60%3D",
 "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Picture2.jpg"
 },
 {
 "ID": "570",
 "NAME": "Picture1.jpg",
 "CODE": null,
 "STORAGE_ID": "3",
 "TYPE": "file",
 "PARENT_ID": "3",
 "DELETED_TYPE": "0",
 "GLOBAL_CONTENT_VERSION": "1",
 "FILE_ID": "560",
 "SIZE": "805189",
 "CREATE_TIME": "2024-06-22T09:07:32+00:00",
 "UPDATE_TIME": "2024-06-22T09:07:32+00:00",
 "DELETE_TIME": null,
 "CREATED_BY": "1",
 "UPDATED_BY": "1",
 "DELETED_BY": "0",
 "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=efa17666006e9f06006b12e400000001000007b2f26f9898812ad669fd7da83d478d1a&token=disk%7CaWQ9NTcwJl89SmpkOWlyMGpwS1N1TEI1aWxIWWxtU0JtTllsT1BoNVI%3D%7CImRvd25sb2FkfGRpc2t8YVdROU5UY3dKbDg5U21wa09XbHlNR3B3UzFOMVRFSTFhV3hJV1d4dFUwSnRUbGxzVDFCb05WST18ZWZhMTc2NjYwMDZlOWYwNjAwNmIxMmU0MDAwMDAwMDEwMDAwMDdiMmYyNmY5ODk4ODEyYWQ2NjlmZDdkYTgzZDQ3OGQxYSI%3D.X8XQ3FtYG30XrOGGxoO1p%2FXistiComyxQei37Xh%2B%2FIM%3D",
 "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Picture1.jpg"
 }
 ],
 "total": 2,
 "time": {
 "start": 1719047253.42516,
 "finish": 1719047253.47205,
 "duration": 0.0468947887420654,
 "processing": 0.016359806060791,
 "date_start": "2024-06-22T09:07:33+00:00",
 "date_finish": "2024-06-22T09:07:33+00:00",
 "operating_reset_at": 1719047853,
 "operating": 0
 }
}
```
