---
sidebar_position: 6
---

# Mark file as deleted
 Move file to recycle bin



`Function MarkFileAsDeleted(Val URL, Val FileID, Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | FileID | --fileid | String, Number | File identifier |
 | Token | --token | String | Access token, when app auth method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [disk.file.markdeleted](https://dev.1c-bitrix.ru/rest_help/disk/file/disk_file_markdeleted.php)
:::
<br/>


```bsl title="Code example"
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/f2ppp8uucc891111/";
 FileID = "5010";
 
 Result = OPI_Bitrix24.MarkFileAsDeleted(URL, FileID);
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "fe3fa966006e9f06006b12e400000001000...";
 
 Result = OPI_Bitrix24.MarkFileAsDeleted(URL, FileID, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 MarkFileAsDeleted --url "b24-ar17wx.bitrix24.by" --fileid "2484" --token "56898d66006e9f06006b12e400000001000..."

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
 "DELETED_TYPE": "3",
 "GLOBAL_CONTENT_VERSION": "1",
 "FILE_ID": "1134",
 "SIZE": "805189",
 "CREATE_TIME": "2024-07-03T14:42:28+00:00",
 "UPDATE_TIME": "2024-07-03T14:42:28+00:00",
 "DELETE_TIME": "2024-07-03T14:42:34+00:00",
 "CREATED_BY": "1",
 "UPDATED_BY": "1",
 "DELETED_BY": "1",
 "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=fe708566006e9f06006b12e4000000010000076fcba303ea853529aed2cefade1444b3&token=disk%7CaWQ9MTcxNiZfPXNheWNTOWFZRVJuejdMOXhCSlhnbDZxbW4xVU05M1lK%7CImRvd25sb2FkfGRpc2t8YVdROU1UY3hOaVpmUFhOaGVXTlRPV0ZaUlZKdWVqZE1PWGhDU2xobmJEWnhiVzR4VlUwNU0xbEt8ZmU3MDg1NjYwMDZlOWYwNjAwNmIxMmU0MDAwMDAwMDEwMDAwMDc2ZmNiYTMwM2VhODUzNTI5YWVkMmNlZmFkZTE0NDRiMyI%3D.H4kGiTtgZ%2BN0wWDCX0lKHQmfO9hOfINESfK6VVd1UJo%3D",
 "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/New file name.jpgi17200177547139i"
 },
 "time": {
 "start": 1720017755.36075,
 "finish": 1720017755.40426,
 "duration": 0.0435140132904053,
 "processing": 0.0109550952911377,
 "date_start": "2024-07-03T14:42:35+00:00",
 "date_finish": "2024-07-03T14:42:35+00:00",
 "operating_reset_at": 1720018355,
 "operating": 0
 }
}
```
