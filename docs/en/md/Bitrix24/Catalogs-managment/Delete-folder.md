---
sidebar_position: 5
---

# Delete folder
 Remove folder with subfolders



`Function DeleteFolder(Val URL, Val FolderID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | FolderID | --folderid | String, Number | ID of folder to be deleted |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [disk.folder.deletetree](https://dev.1c-bitrix.ru/rest_help/disk/folder/disk_folder_deletetree.php)
:::
<br/>


```bsl title="Code example"
    URL      = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    FolderID = "10840";

    Result = OPI_Bitrix24.DeleteFolder(URL, FolderID);

    URL      = "b24-ar17wx.bitrix24.by";
    Token    = "37d1fe66006e9f06006b12e400000001000...";
    FolderID = "10842";

    Result = OPI_Bitrix24.DeleteFolder(URL, FolderID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 DeleteFolder --url "b24-ar17wx.bitrix24.by" --folderid "5016" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": true,
 "time": {
  "start": 1728329143.19748,
  "finish": 1728329143.26636,
  "duration": 0.0688858032226562,
  "processing": 0.0399110317230225,
  "date_start": "2024-10-07T22:25:43+03:00",
  "date_finish": "2024-10-07T22:25:43+03:00",
  "operating_reset_at": 1728329743,
  "operating": 0
 }
}
```
