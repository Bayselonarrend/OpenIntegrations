---
sidebar_position: 4
---

# Move folder
 Moves one folder inside another



`Function MoveFolder(Val URL, Val FolderID, Val DestinationID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | FolderID | --folderid | String, Number | Folder identifier |
  | DestinationID | --tagetid | String, Number | ID of target folder |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [disk.folder.moveto](https://dev.1c-bitrix.ru/rest_help/disk/folder/disk_folder_moveto.php)
:::
<br/>


```bsl title="Code example"
    DestinationID = "6878";
    FolderID      = "6884";

    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.MoveFolder(URL, FolderID, DestinationID);

    FolderID = "6882";

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "6476c766006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.MoveFolder(URL, FolderID, DestinationID, Token);

    Check_BitrixObject(Result);
```



```sh title="CLI command example"
    
  oint bitrix24 MoveFolder --url "b24-ar17wx.bitrix24.by" --folderid "5018" --tagetid "5014" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": {
  "ID": "938",
  "NAME": "New subfolder 2",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "folder",
  "REAL_OBJECT_ID": "938",
  "PARENT_ID": 934,
  "DELETED_TYPE": "0",
  "CREATE_TIME": "2024-07-01T13:44:06+00:00",
  "UPDATE_TIME": "2024-07-01T13:44:07+00:00",
  "DELETE_TIME": null,
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": "0",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/path/New folder 2/New subfolder 2"
  },
  "time": {
  "start": 1719841451.89089,
  "finish": 1719841451.95846,
  "duration": 0.0675740242004394,
  "processing": 0.0360250473022461,
  "date_start": "2024-07-01T13:44:11+00:00",
  "date_finish": "2024-07-01T13:44:11+00:00",
  "operating_reset_at": 1719842051,
  "operating": 0
  }
  }
```
