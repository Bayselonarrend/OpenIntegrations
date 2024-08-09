---
sidebar_position: 8
---

# Copy file
 Copy file from one destination to another



`Function MakeFileCopy(Val URL, Val FileID, Val FolderID, Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | FileID | --fileid | String, Number | Original file ID |
 | FolderID | --folderid | String, Number | ID of copy destination folder |
 | Token | --token | String | Access token, when app auth method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [disk.file.copyto](https://dev.1c-bitrix.ru/rest_help/disk/file/disk_file_copyto.php)
:::
<br/>


```bsl title="Code example"
 FolderID = "5014";
 FileID = "5010";
 
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/f2pph8uucc89is6c/";
 
 Result = OPI_Bitrix24.MakeFileCopy(URL, FileID, FolderID);
 
 FolderID = "5016";
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "fe3fa966006e9f06006b12e400000001000...";
 
 Result = OPI_Bitrix24.MakeFileCopy(URL, FileID, FolderID, Token);
 
 Check_BitrixObject(Result);
```
	


```sh title="CLI command example"
 
 oint bitrix24 MakeFileCopy --url "b24-ar17wx.bitrix24.by" --fileid "2484" --folderid "2490" --token "56898d66006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": {
 "ID": 1744,
 "NAME": "New file name.jpg",
 "CODE": null,
 "STORAGE_ID": "3",
 "TYPE": "file",
 "PARENT_ID": "1722",
 "DELETED_TYPE": 0,
 "GLOBAL_CONTENT_VERSION": 1,
 "FILE_ID": 1146,
 "SIZE": "805189",
 "CREATE_TIME": "2024-07-03T14:42:54+00:00",
 "UPDATE_TIME": "2024-07-03T14:42:54+00:00",
 "DELETE_TIME": null,
 "CREATED_BY": "1",
 "UPDATED_BY": "1",
 "DELETED_BY": null,
 "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=fe708566006e9f06006b12e4000000010000076fcba303ea853529aed2cefade1444b3&token=disk%7CaWQ9MTc0NCZfPWphdFBTRXpUdHI2anZKbDNxMDBwVTdRRVZ4aDdGVTMy%7CImRvd25sb2FkfGRpc2t8YVdROU1UYzBOQ1pmUFdwaGRGQlRSWHBVZEhJMmFuWktiRE54TURCd1ZUZFJSVlo0YURkR1ZUTXl8ZmU3MDg1NjYwMDZlOWYwNjAwNmIxMmU0MDAwMDAwMDEwMDAwMDc2ZmNiYTMwM2VhODUzNTI5YWVkMmNlZmFkZTE0NDRiMyI%3D.uOKd1v3hEnu7vsep0NhRk3RzXtyT21DBrrwPl3DxLG8%3D",
 "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/New catalog/New file name.jpg"
 },
 "time": {
 "start": 1720017774.37632,
 "finish": 1720017774.44715,
 "duration": 0.07082200050354,
 "processing": 0.0407531261444092,
 "date_start": "2024-07-03T14:42:54+00:00",
 "date_finish": "2024-07-03T14:42:54+00:00",
 "operating_reset_at": 1720018374,
 "operating": 0
 }
}
```
