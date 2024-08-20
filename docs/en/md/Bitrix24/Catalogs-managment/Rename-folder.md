---
sidebar_position: 10
---

# Rename folder
 Change folder name



`Function RenameFolder(Val URL, Val FolderID, Val Name, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | FolderID | --folderid | String, Number | Folder identifier |
  | Name | --title | String | New folders name |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [disk.folder.rename](https://dev.1c-bitrix.ru/rest_help/disk/folder/disk_folder_rename.php)
:::
<br/>


```bsl title="Code example"
    Name      = "New catalog";
    Filename2 = "New folder 2";

    FolderID2 = "6878";
    URL       = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.RenameFolder(URL, FolderID2, Filename2);

    FolderID = "6880";
    URL      = "b24-ar17wx.bitrix24.by";
    Token    = "ec4dc366006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.RenameFolder(URL, FolderID, Name, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 RenameFolder --url "b24-ar17wx.bitrix24.by" --folderid "5016" --title %title% --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": {
  "ID": "936",
  "NAME": "New catalog",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "folder",
  "REAL_OBJECT_ID": "936",
  "PARENT_ID": "3",
  "DELETED_TYPE": "0",
  "CREATE_TIME": "2024-07-01T13:44:01+00:00",
  "UPDATE_TIME": "2024-07-01T13:44:01+00:00",
  "DELETE_TIME": null,
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": "0",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/path/New catalog"
  },
  "time": {
  "start": 1719841443.11172,
  "finish": 1719841443.16013,
  "duration": 0.0484049320220947,
  "processing": 0.0123419761657715,
  "date_start": "2024-07-01T13:44:03+00:00",
  "date_finish": "2024-07-01T13:44:03+00:00",
  "operating_reset_at": 1719842043,
  "operating": 0
  }
  }
```
