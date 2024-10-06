---
sidebar_position: 4
---

# Rename storage
 Change storage name (for app storage only, see. GetAppStorage)



`Function RenameStorage(Val URL, Val StorageID, Val Name, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | StorageID | --storageid | String, Number | Storage ID |
  | Name | --title | String | New storage name |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [disk.storage.rename](https://dev.1c-bitrix.ru/rest_help/disk/storage/disk_storage_rename.php)
:::
<br/>


```bsl title="Code example"
    Name      = "New storage name";
    URL       = "b24-ar17wx.bitrix24.by";
    Token     = "37d1fe66006e9f06006b12e400000001000...";
    StorageID = "18";

    Result = OPI_Bitrix24.RenameStorage(URL, StorageID, Name, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 RenameStorage --url "b24-ar17wx.bitrix24.by" --storageid "18" --title %title% --token "fe3fa966006e9f06006b12e400000001000..."

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
  "start": 1728140740.07766,
  "finish": 1728140740.1182,
  "duration": 0.0405440330505371,
  "processing": 0.0131649971008301,
  "date_start": "2024-10-05T18:05:40+03:00",
  "date_finish": "2024-10-05T18:05:40+03:00",
  "operating_reset_at": 1728141340,
  "operating": 0
 }
}
```
