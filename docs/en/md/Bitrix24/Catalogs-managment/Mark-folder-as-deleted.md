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
    FolderID = "12702";

    Result = OPI_Bitrix24.MarkFolderAsDeleted(URL, FolderID);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "49e20867006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.MarkFolderAsDeleted(URL, FolderID, Token);
```
 



```json title="Result"
{
 "result": {
  "ID": "12582",
  "NAME": "New catalog",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "folder",
  "REAL_OBJECT_ID": "12582",
  "PARENT_ID": "3",
  "DELETED_TYPE": "3",
  "CREATE_TIME": "2024-10-09T09:20:23+03:00",
  "UPDATE_TIME": "2024-10-09T09:20:28+03:00",
  "DELETE_TIME": "2024-10-09T09:20:29+03:00",
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": "1",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/path/New catalog"
 },
 "time": {
  "start": 1728454829.76518,
  "finish": 1728454829.80079,
  "duration": 0.0356080532073975,
  "processing": 0.00615215301513672,
  "date_start": "2024-10-09T09:20:29+03:00",
  "date_finish": "2024-10-09T09:20:29+03:00",
  "operating_reset_at": 1728455429,
  "operating": 0
 }
}
```
