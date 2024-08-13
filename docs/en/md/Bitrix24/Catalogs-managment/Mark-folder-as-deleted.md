---
sidebar_position: 8
---

# Mark folder as deleted
 Move folder to recycle bin



`Function MarkFolderAsDeleted(Val URL, Val FolderID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | FolderID | --folderid | String, Number | Folder identifier |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [disk.folder.markdeleted](https://dev.1c-bitrix.ru/rest_help/disk/folder/disk_folder_markdeleted.php)
:::
<br/>


```bsl title="Code example"
    URL      = "https://b24-ar17wx.bitrix24.by/rest/1/f2ppp8uucc891111/";
    FolderID = "5016";

    Result = OPI_Bitrix24.MarkFolderAsDeleted(URL, FolderID);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "fe3fa966006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.MarkFolderAsDeleted(URL, FolderID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 MarkFolderAsDeleted --url "b24-ar17wx.bitrix24.by" --folderid "5016" --token "fe3fa966006e9f06006b12e400000001000..."

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
  "DELETED_TYPE": "3",
  "CREATE_TIME": "2024-07-01T13:44:01+00:00",
  "UPDATE_TIME": "2024-07-01T13:44:06+00:00",
  "DELETE_TIME": "2024-07-01T13:44:12+00:00",
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": "1",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/path/New catalog"
  },
  "time": {
  "start": 1719841453.13782,
  "finish": 1719841453.17717,
  "duration": 0.0393478870391846,
  "processing": 0.00959300994873047,
  "date_start": "2024-07-01T13:44:13+00:00",
  "date_finish": "2024-07-01T13:44:13+00:00",
  "operating_reset_at": 1719842053,
  "operating": 0
  }
  }
```
