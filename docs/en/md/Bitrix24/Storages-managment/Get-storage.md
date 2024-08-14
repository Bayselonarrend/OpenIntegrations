---
sidebar_position: 3
---

# Get storage
 Get information about storage



`Function GetStorage(Val URL, Val StorageID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | StorageID | --storageid | String, Number | Storage ID |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [disk.storage.get](https://dev.1c-bitrix.ru/rest_help/disk/storage/disk_storage_get.php)
:::
<br/>


```bsl title="Code example"
    URL       = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    StorageID = 3;

    Result = OPI_Bitrix24.GetStorage(URL, StorageID);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "7a63bc66006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.GetStorage(URL, StorageID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetStorage --url "b24-ar17wx.bitrix24.by" --storageid "3" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": {
  "ID": "3",
  "NAME": "Main drive",
  "CODE": null,
  "MODULE_ID": "disk",
  "ENTITY_TYPE": "common",
  "ENTITY_ID": "shared_files_s1",
  "ROOT_OBJECT_ID": "3"
  },
  "time": {
  "start": 1719047247.65416,
  "finish": 1719047247.68963,
  "duration": 0.0354659557342529,
  "processing": 0.00417995452880859,
  "date_start": "2024-06-22T09:07:27+00:00",
  "date_finish": "2024-06-22T09:07:27+00:00",
  "operating_reset_at": 1719047847,
  "operating": 0
  }
  }
```
