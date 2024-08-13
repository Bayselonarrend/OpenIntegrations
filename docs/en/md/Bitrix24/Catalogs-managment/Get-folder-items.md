---
sidebar_position: 7
---

# Get folder child elements
 Get folder child elements



`Function GetFolderItems(Val URL, Val FolderID, Val Filter = "", Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | FolderID | --folderid | String, Number | Folder identifier |
 | Filter | --filter | Structure of KeyAndValue | Items filter (see GetFolderFilterStructure) |
 | Token | --token | String | Access token, when app auth method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [disk.folder.getchildren](https://dev.1c-bitrix.ru/rest_help/disk/folder/disk_folder_getchildren.php)
:::
<br/>


```bsl title="Code example"
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/f2ppp8uucc891111/";
 FolderID = "5016";
 
 Result = OPI_Bitrix24.GetFolderItems(URL, FolderID);
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "fe3fa966006e9f06006b12e400000001000...";
 
 Result = OPI_Bitrix24.GetFolderItems(URL, FolderID,, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 GetFolderItems --url "b24-ar17wx.bitrix24.by" --folderid "2490" --filter %filter% --token "56898d66006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": [
 {
 "ID": "848",
 "NAME": "New subfolder 2",
 "CODE": null,
 "STORAGE_ID": "3",
 "TYPE": "folder",
 "REAL_OBJECT_ID": "848",
 "PARENT_ID": "846",
 "DELETED_TYPE": "0",
 "CREATE_TIME": "2024-06-27T07:19:56+00:00",
 "UPDATE_TIME": "2024-06-27T07:19:58+00:00",
 "DELETE_TIME": null,
 "CREATED_BY": "1",
 "UPDATED_BY": "1",
 "DELETED_BY": "0",
 "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/path/New catalog/New subfolder 2"
 },
 {
 "ID": "850",
 "NAME": "New subfolder",
 "CODE": null,
 "STORAGE_ID": "3",
 "TYPE": "folder",
 "REAL_OBJECT_ID": "850",
 "PARENT_ID": "846",
 "DELETED_TYPE": "0",
 "CREATE_TIME": "2024-06-27T07:19:57+00:00",
 "UPDATE_TIME": "2024-06-27T07:19:58+00:00",
 "DELETE_TIME": null,
 "CREATED_BY": "1",
 "UPDATED_BY": "1",
 "DELETED_BY": "0",
 "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/path/New catalog/New subfolder"
 }
 ],
 "total": 2,
 "time": {
 "start": 1719472801.3139,
 "finish": 1719472801.36215,
 "duration": 0.0482509136199951,
 "processing": 0.0148689746856689,
 "date_start": "2024-06-27T07:20:01+00:00",
 "date_finish": "2024-06-27T07:20:01+00:00",
 "operating_reset_at": 1719473401,
 "operating": 0
 }
}
```
