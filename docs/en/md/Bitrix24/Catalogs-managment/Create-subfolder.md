---
sidebar_position: 2
---

# Create new subfolder
 Create new folder inside another folder



`Function CreateSubfolder(Val URL, Val FolderID, Val Name, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | FolderID | --folderid | String, Number | Parent folder identifier |
  | Name | --title | String | Name of new folder |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [disk.folder.addsubfolder](https://dev.1c-bitrix.ru/rest_help/disk/folder/disk_folder_addsubfolder.php)
:::
<br/>


```bsl title="Code example"
    FolderID  = "6880";
    Name      = "New subfolder";
    Filename2 = "New subfolder 2";

    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.CreateSubfolder(URL, FolderID, Filename2);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "ec4dc366006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.CreateSubfolder(URL, FolderID, Name, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 CreateSubfolder --url "b24-ar17wx.bitrix24.by" --folderid "5016" --title %title% --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": {
  "ID": 850,
  "NAME": "New subfolder",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "folder",
  "REAL_OBJECT_ID": 850,
  "PARENT_ID": "846",
  "DELETED_TYPE": 0,
  "CREATE_TIME": "2024-06-27T07:19:57+00:00",
  "UPDATE_TIME": "2024-06-27T07:19:57+00:00",
  "DELETE_TIME": null,
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": null,
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/path/New catalog/New subfolder"
  },
  "time": {
  "start": 1719472797.42827,
  "finish": 1719472797.50854,
  "duration": 0.080265998840332,
  "processing": 0.0455958843231201,
  "date_start": "2024-06-27T07:19:57+00:00",
  "date_finish": "2024-06-27T07:19:57+00:00",
  "operating_reset_at": 1719473397,
  "operating": 0
  }
  }
```
