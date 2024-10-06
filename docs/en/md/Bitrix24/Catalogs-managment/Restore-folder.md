---
sidebar_position: 9
---

# Restore folder
 Resotre folder form recycle bin



`Function RestoreFolder(Val URL, Val FolderID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | FolderID | --folderid | String, Number | Folder identifier |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [disk.folder.restore](https://dev.1c-bitrix.ru/rest_help/disk/folder/disk_folder_restore.php)
:::
<br/>


```bsl title="Code example"
    URL      = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    FolderID = "10842";

    Result = OPI_Bitrix24.RestoreFolder(URL, FolderID);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "37d1fe66006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.RestoreFolder(URL, FolderID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 RestoreFolder --url "b24-ar17wx.bitrix24.by" --folderid "5016" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": {
  "ID": "12102",
  "NAME": "New catalog",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "folder",
  "REAL_OBJECT_ID": "12102",
  "PARENT_ID": "3",
  "DELETED_TYPE": "0",
  "CREATE_TIME": "2024-10-05T18:06:04+03:00",
  "UPDATE_TIME": "2024-10-05T18:06:09+03:00",
  "DELETE_TIME": "2024-10-05T18:06:09+03:00",
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": "1",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/path/New catalog"
 },
 "time": {
  "start": 1728140770.07052,
  "finish": 1728140770.10579,
  "duration": 0.0352771282196045,
  "processing": 0.00649309158325195,
  "date_start": "2024-10-05T18:06:10+03:00",
  "date_finish": "2024-10-05T18:06:10+03:00",
  "operating_reset_at": 1728141370,
  "operating": 0
 }
}
```
