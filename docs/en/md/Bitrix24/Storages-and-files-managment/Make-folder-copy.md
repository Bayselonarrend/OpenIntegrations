---
sidebar_position: 10
---

# Copy folder
 Copy one folder to another




<br/>


*Function MakeFolderCopy(Val URL, Val FolderID, Val DestinationID, Val Token = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | FolderID | --folderid | String, Number | Folder identifier |
 | DestinationID | --tagetid | String, Number | ID of target folder |
 | Token | --token | String | Access token, when not-webhook method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API


```bsl title="Code example"
 DestinationID = "2492";
 FolderID = "2494";
 
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
 
 Result = OPI_Bitrix24.MakeFolderCopy(URL, FolderID, DestinationID);
 
 
 DestinationID = "2494";
 FolderID = "2492";
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "56898d66006e9f06006b12e400000001000...";
 
 Result = OPI_Bitrix24.MakeFolderCopy(URL, FolderID, DestinationID, Token);
 
 Check_BitrixFile(Result);
```
	


```sh title="CLI command example"
 
 oint bitrix24 MakeFolderCopy --url "b24-ar17wx.bitrix24.by" --folderid "2492" --tagetid "2494" --token "56898d66006e9f06006b12e400000001000..."

```

```json title="Result"
 {
 "result": {
 "ID": 1732,
 "NAME": "New subfolder 2",
 "CODE": null,
 "STORAGE_ID": "3",
 "TYPE": "folder",
 "REAL_OBJECT_ID": 1732,
 "PARENT_ID": "1726",
 "DELETED_TYPE": 0,
 "CREATE_TIME": "2024-07-03T14:42:46+00:00",
 "UPDATE_TIME": "2024-07-03T14:42:46+00:00",
 "DELETE_TIME": null,
 "CREATED_BY": "1",
 "UPDATED_BY": "1",
 "DELETED_BY": null,
 "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/path/New catalog/New subfolder/New subfolder 2"
 },
 "time": {
 "start": 1720017765.97028,
 "finish": 1720017766.08005,
 "duration": 0.109767913818359,
 "processing": 0.0799601078033447,
 "date_start": "2024-07-03T14:42:45+00:00",
 "date_finish": "2024-07-03T14:42:46+00:00",
 "operating_reset_at": 1720018366,
 "operating": 0
 }
}
```
