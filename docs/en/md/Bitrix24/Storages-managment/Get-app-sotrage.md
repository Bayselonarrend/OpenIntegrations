---
sidebar_position: 2
---

# Get storage for application data
 Get information about storage with which the application can work to store its data



`Function GetAppSotrage(Val URL, Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | Token | --token | String | Access token, when app auth method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [disk.storage.getforapp](https://dev.1c-bitrix.ru/rest_help/disk/storage/disk_storage_getforapp.php)
:::
<br/>


```bsl title="Code example"
 URL = "b24-ar17wx.bitrix24.by";
 Token = "adf89366006e9f06006b12e400000001000...";
 
 Result = OPI_Bitrix24.GetAppSotrage(URL, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 GetAppSotrage --url "b24-ar17wx.bitrix24.by" --token "b9df7366006e9f06006b12e400000001000..."

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
 "start": 1721067694.96416,
 "finish": 1721067694.99489,
 "duration": 0.0307230949401856,
 "processing": 0.00391507148742676,
 "date_start": "2024-07-15T18:21:34+00:00",
 "date_finish": "2024-07-15T18:21:34+00:00",
 "operating_reset_at": 1721068294,
 "operating": 0
 }
}
```
