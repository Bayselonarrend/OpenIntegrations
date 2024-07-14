---
sidebar_position: 9
---

# Move file
 Move file from one destination to another



`Function MoveFileToFolder(Val URL, Val FileID, Val FolderID, Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | FileID | --fileid | String, Number | File ID |
 | FolderID | --folderid | String, Number | ID of new destination folder |
 | Token | --token | String | Access token, when not-webhook method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [disk.file.moveto](https://dev.1c-bitrix.ru/rest_help/disk/file/disk_file_moveto.php)
:::
<br/>


```bsl title="Code example"
 FolderID = "2492";
 FileID = "2484";
 
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
 
 Result = OPI_Bitrix24.MoveFileToFolder(URL, FileID, FolderID);
 
 
 FolderID = "2494";
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "56898d66006e9f06006b12e400000001000...";
 
 Result = OPI_Bitrix24.MoveFileToFolder(URL, FileID, FolderID, Token);
 
 Check_BitrixFile(Result);
```
	


```sh title="CLI command example"
 
 oint bitrix24 MoveFileToFolder --url "b24-ar17wx.bitrix24.by" --fileid "2484" --folderid "2494" --token "56898d66006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": {
 "ID": "1716",
 "NAME": "New file name.jpg",
 "CODE": null,
 "STORAGE_ID": "3",
 "TYPE": "file",
 "PARENT_ID": 1726,
 "DELETED_TYPE": "0",
 "GLOBAL_CONTENT_VERSION": "1",
 "FILE_ID": "1134",
 "SIZE": "805189",
 "CREATE_TIME": "2024-07-03T14:42:28+00:00",
 "UPDATE_TIME": "2024-07-03T14:42:36+00:00",
 "DELETE_TIME": "2024-07-03T14:42:34+00:00",
 "CREATED_BY": "1",
 "UPDATED_BY": "1",
 "DELETED_BY": "1",
 "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=fe708566006e9f06006b12e4000000010000076fcba303ea853529aed2cefade1444b3&token=disk%7CaWQ9MTcxNiZfPUtKOGRTc3BCNmFoWDN3bjdXVVJzV2FEbWdrOXNOQk5K%7CImRvd25sb2FkfGRpc2t8YVdROU1UY3hOaVpmUFV0S09HUlRjM0JDTm1Gb1dETjNiamRYVlZKelYyRkViV2RyT1hOT1FrNUt8ZmU3MDg1NjYwMDZlOWYwNjAwNmIxMmU0MDAwMDAwMDEwMDAwMDc2ZmNiYTMwM2VhODUzNTI5YWVkMmNlZmFkZTE0NDRiMyI%3D.TUnzDUP0VCd8GRkzGSamf6aYWKIRqoB9Fpi6xFrBwBA%3D",
 "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/New catalog/New subfolder/New file name.jpg"
 },
 "time": {
 "start": 1720017764.56434,
 "finish": 1720017764.63176,
 "duration": 0.0674228668212891,
 "processing": 0.0307409763336182,
 "date_start": "2024-07-03T14:42:44+00:00",
 "date_finish": "2024-07-03T14:42:44+00:00",
 "operating_reset_at": 1720018364,
 "operating": 0
 }
}
```
