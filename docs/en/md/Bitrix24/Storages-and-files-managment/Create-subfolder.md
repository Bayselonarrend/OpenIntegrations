---
sidebar_position: 9
---

# Create new subfolder
 Create new folder inside another folder


<br/>


`Function CreateSubfolder(Val URL, Val FolderID, Val Name, Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | FolderID | --folderid | String, Number | Parent folder identifier |
 | Name | --title | String | Name of new folder |
 | Token | --token | String | Access token, when not-webhook method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API





```bsl title="Code example"
 FolderID = "2490";
 Name = "New subfolder";
 Filename2 = "New subfolder 2";
 
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
 
 Result = OPI_Bitrix24.CreateSubfolder(URL, FolderID, Filename2);
 
 
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "56898d66006e9f06006b12e400000001000...";
 
 Result = OPI_Bitrix24.CreateSubfolder(URL, FolderID, Name, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 CreateSubfolder --url "b24-ar17wx.bitrix24.by" --folderid "2490" --title %title% --token "56898d66006e9f06006b12e400000001000..."

```

```json title="Result"
 {
 "result": {
 "ID": 850,
 "NAME": "New subfolder",
 "CODE": null,
 "STORAGE_ID": "3",
 "TYPE": "folder",
 "REAL_OBJECT_ID": 850,
 "PARENT_ID": "846",
 "DELETED_TYPE": 0,
 "CREATE_TIME": "2024-06-27T07:19:57+00:00",
 "UPDATE_TIME": "2024-06-27T07:19:57+00:00",
 "DELETE_TIME": null,
 "CREATED_BY": "1",
 "UPDATED_BY": "1",
 "DELETED_BY": null,
 "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/path/New catalog/New subfolder"
 },
 "time": {
 "start": 1719472797.42827,
 "finish": 1719472797.50854,
 "duration": 0.080265998840332,
 "processing": 0.0455958843231201,
 "date_start": "2024-06-27T07:19:57+00:00",
 "date_finish": "2024-06-27T07:19:57+00:00",
 "operating_reset_at": 1719473397,
 "operating": 0
 }
}
```
