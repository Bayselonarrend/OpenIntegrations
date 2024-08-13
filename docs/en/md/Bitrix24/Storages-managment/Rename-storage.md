---
sidebar_position: 4
---

# Rename storage
 Change storage name (for app storage only, see. GetAppStorage)



`Function RenameStorage(Val URL, Val StorageID, Val Name, Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | StorageID | --storageid | String, Number | Storage ID |
 | Name | --title | String | New storage name |
 | Token | --token | String | Access token, when app auth method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [disk.storage.rename](https://dev.1c-bitrix.ru/rest_help/disk/storage/disk_storage_rename.php)
:::
<br/>


```bsl title="Code example"
 Name = "New storage name";
 URL = "b24-ar17wx.bitrix24.by";
 Token = "fe3fa966006e9f06006b12e400000001000...";
 StorageID = "18";
 
 Result = OPI_Bitrix24.RenameStorage(URL, StorageID, Name, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 RenameStorage --url "b24-ar17wx.bitrix24.by" --storageid "18" --title %title% --token "b9df7366006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": {
 "ID": "18",
 "NAME": "New storage name",
 "CODE": null,
 "MODULE_ID": "disk",
 "ENTITY_TYPE": "restapp",
 "ENTITY_ID": "2",
 "ROOT_OBJECT_ID": "464"
 },
 "time": {
 "start": 1719047246.29499,
 "finish": 1719047246.35783,
 "duration": 0.062842845916748,
 "processing": 0.0317339897155762,
 "date_start": "2024-06-22T09:07:26+00:00",
 "date_finish": "2024-06-22T09:07:26+00:00",
 "operating_reset_at": 1719047846,
 "operating": 0
 }
}
```
