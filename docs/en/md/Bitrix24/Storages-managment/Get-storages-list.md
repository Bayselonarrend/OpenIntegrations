---
sidebar_position: 1
---

# Get list of storages
 Get list of available files storages



`Function GetStoragesList(Val URL, Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | Token | --token | String | Access token, when app auth method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [disk.storage.getlist](https://dev.1c-bitrix.ru/rest_help/disk/storage/disk_storage_getlist.php)
:::
<br/>


```bsl title="Code example"
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
 Result = OPI_Bitrix24.GetStoragesList(URL);
 
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "adf89366006e9f06006b12e400000001000...";
 
 Result = OPI_Bitrix24.GetStoragesList(URL, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 GetStoragesList --url "b24-ar17wx.bitrix24.by" --token "b9df7366006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": [
 {
 "ID": "3",
 "NAME": "Main drive",
 "CODE": null,
 "MODULE_ID": "disk",
 "ENTITY_TYPE": "common",
 "ENTITY_ID": "shared_files_s1",
 "ROOT_OBJECT_ID": "3"
 },
 {
 "ID": "1",
 "NAME": "Anton Titovets",
 "CODE": null,
 "MODULE_ID": "disk",
 "ENTITY_TYPE": "user",
 "ENTITY_ID": "1",
 "ROOT_OBJECT_ID": "1"
 },
 {
 "ID": "16",
 "NAME": "iscript13@gmail.com",
 "CODE": null,
 "MODULE_ID": "disk",
 "ENTITY_TYPE": "user",
 "ENTITY_ID": "10",
 "ROOT_OBJECT_ID": "270"
 },
 {
 "ID": "4",
 "NAME": "Payment Processing Customer Support",
 "CODE": null,
 "MODULE_ID": "disk",
 "ENTITY_TYPE": "user",
 "ENTITY_ID": "2",
 "ROOT_OBJECT_ID": "4"
 },
 {
 "ID": "10",
 "NAME": "CoPilot",
 "CODE": null,
 "MODULE_ID": "disk",
 "ENTITY_TYPE": "user",
 "ENTITY_ID": "4",
 "ROOT_OBJECT_ID": "52"
 },
 {
 "ID": "12",
 "NAME": "Support Bitrix24",
 "CODE": null,
 "MODULE_ID": "disk",
 "ENTITY_TYPE": "user",
 "ENTITY_ID": "6",
 "ROOT_OBJECT_ID": "70"
 },
 {
 "ID": "14",
 "NAME": "Marta",
 "CODE": null,
 "MODULE_ID": "disk",
 "ENTITY_TYPE": "user",
 "ENTITY_ID": "8",
 "ROOT_OBJECT_ID": "72"
 }
 ],
 "total": 7,
 "time": {
 "start": 1718783911.64028,
 "finish": 1718783911.69026,
 "duration": 0.0499801635742188,
 "processing": 0.00660109519958496,
 "date_start": "2024-06-19T07:58:31+00:00",
 "date_finish": "2024-06-19T07:58:31+00:00",
 "operating_reset_at": 1718784511,
 "operating": 0
 }
}
```
