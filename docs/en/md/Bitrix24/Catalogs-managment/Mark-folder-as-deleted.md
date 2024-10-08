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
    URL      = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    FolderID = "10842";

    Result = OPI_Bitrix24.MarkFolderAsDeleted(URL, FolderID);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "37d1fe66006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.MarkFolderAsDeleted(URL, FolderID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 MarkFolderAsDeleted --url "b24-ar17wx.bitrix24.by" --folderid "5016" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": {
  "ID": "12402",
  "NAME": "New catalog",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "folder",
  "REAL_OBJECT_ID": "12402",
  "PARENT_ID": "3",
  "DELETED_TYPE": "3",
  "CREATE_TIME": "2024-10-07T22:25:37+03:00",
  "UPDATE_TIME": "2024-10-07T22:25:41+03:00",
  "DELETE_TIME": "2024-10-07T22:25:42+03:00",
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": "1",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/path/New catalog"
 },
 "time": {
  "start": 1728329142.66811,
  "finish": 1728329142.70346,
  "duration": 0.0353450775146484,
  "processing": 0.00501608848571777,
  "date_start": "2024-10-07T22:25:42+03:00",
  "date_finish": "2024-10-07T22:25:42+03:00",
  "operating_reset_at": 1728329742,
  "operating": 0
 }
}
```
