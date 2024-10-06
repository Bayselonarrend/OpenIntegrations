---
sidebar_position: 2
---

# Get storage for application data
 Get information about storage with which the application can work to store its data



`Function GetAppSotrage(Val URL, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [disk.storage.getforapp](https://dev.1c-bitrix.ru/rest_help/disk/storage/disk_storage_getforapp.php)
:::
<br/>


```bsl title="Code example"
  URL = "b24-ar17wx.bitrix24.by";
  Token = "fe3fa966006e9f06006b12e400000001000...";
  
  Result = OPI_Bitrix24.GetAppSotrage(URL, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetAppSotrage --url "b24-ar17wx.bitrix24.by" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": {
  "ID": "18",
  "NAME": "Новое имя хранилища",
  "CODE": null,
  "MODULE_ID": "disk",
  "ENTITY_TYPE": "restapp",
  "ENTITY_ID": "2",
  "ROOT_OBJECT_ID": "464"
 },
 "time": {
  "start": 1728140739.9858,
  "finish": 1728140740.01774,
  "duration": 0.0319440364837646,
  "processing": 0.00438690185546875,
  "date_start": "2024-10-05T18:05:39+03:00",
  "date_finish": "2024-10-05T18:05:40+03:00",
  "operating_reset_at": 1728141340,
  "operating": 0
 }
}
```
