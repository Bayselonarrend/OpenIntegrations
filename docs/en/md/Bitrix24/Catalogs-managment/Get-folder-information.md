---
sidebar_position: 1
---

# Get information about folder
 Get folder information



`Function GetFolderInformation(Val URL, Val FolderID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | FolderID | --folderid | String, Number | Folder identifier |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [disk.folder.get](https://dev.1c-bitrix.ru/rest_help/disk/folder/disk_folder_get.php)
:::
<br/>


```bsl title="Code example"
    URL      = "https://b24-ar17wx.bitrix24.by/rest/1/ztbe...";
    FolderID = "5052";

    Result = OPI_Bitrix24.GetFolderInformation(URL, FolderID);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "c03fa966006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.GetFolderInformation(URL, FolderID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetFolderInformation --url "b24-ar17wx.bitrix24.by" --folderid "5016" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": {
  "ID": "1722",
  "NAME": "New catalog",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "folder",
  "REAL_OBJECT_ID": "1722",
  "PARENT_ID": "3",
  "DELETED_TYPE": "0",
  "CREATE_TIME": "2024-07-03T14:42:37+00:00",
  "UPDATE_TIME": "2024-07-03T14:42:37+00:00",
  "DELETE_TIME": null,
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": "0",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/path/New catalog"
  },
  "time": {
  "start": 1720017760.63451,
  "finish": 1720017760.68628,
  "duration": 0.0517730712890625,
  "processing": 0.0117180347442627,
  "date_start": "2024-07-03T14:42:40+00:00",
  "date_finish": "2024-07-03T14:42:40+00:00",
  "operating_reset_at": 1720018360,
  "operating": 0
  }
  }
```
