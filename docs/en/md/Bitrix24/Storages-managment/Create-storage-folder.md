---
sidebar_position: 6
---

# Create folder at the storage
 Create new foldera at the storage



`Function CreateStorageFolder(Val URL, Val StorageID, Val Name, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | StorageID | --storageid | String | Storage ID |
  | Name | --title | String | Folder name |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [disk.storage.addfolder](https://dev.1c-bitrix.ru/rest_help/disk/storage/disk_storage_addfolder.php)
:::
<br/>


```bsl title="Code example"
    StorageID = 3;
    Name      = "New catalog";
    Filename2 = "New folder 2";

    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.CreateStorageFolder(URL, StorageID, Filename2);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "ec4dc366006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.CreateStorageFolder(URL, StorageID, Name, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 CreateStorageFolder --url "b24-ar17wx.bitrix24.by" --storageid "3" --title %title% --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": {
  "ID": 574,
  "NAME": "New catalog",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "folder",
  "REAL_OBJECT_ID": 574,
  "PARENT_ID": "3",
  "DELETED_TYPE": 0,
  "CREATE_TIME": "2024-06-22T09:07:36+00:00",
  "UPDATE_TIME": "2024-06-22T09:07:36+00:00",
  "DELETE_TIME": null,
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": null,
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/path/New catalog"
  },
  "time": {
  "start": 1719047256.22025,
  "finish": 1719047256.27758,
  "duration": 0.057330846786499,
  "processing": 0.0276291370391846,
  "date_start": "2024-06-22T09:07:36+00:00",
  "date_finish": "2024-06-22T09:07:36+00:00",
  "operating_reset_at": 1719047856,
  "operating": 0
  }
  }
```
