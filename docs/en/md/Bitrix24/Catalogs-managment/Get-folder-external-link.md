---
sidebar_position: 6
---

# Get external link for folder
 Get external link to folder



`Function GetFolderExternalLink(Val URL, Val FolderID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | FolderID | --folderid | String, Number | Folder identifier |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [disk.folder.getExternalLink](https://dev.1c-bitrix.ru/rest_help/disk/folder/disk_folder_getexternallink.php)
:::
<br/>


```bsl title="Code example"
    URL      = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    FolderID = "10842";

    Result = OPI_Bitrix24.GetFolderExternalLink(URL, FolderID);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "37d1fe66006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.GetFolderExternalLink(URL, FolderID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetFolderExternalLink --url "b24-ar17wx.bitrix24.by" --folderid "5016" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": "https://b24-ar17wx.bitrix24.by/~9HIEu",
 "time": {
  "start": 1728329138.053,
  "finish": 1728329138.09484,
  "duration": 0.0418429374694824,
  "processing": 0.00709795951843262,
  "date_start": "2024-10-07T22:25:38+03:00",
  "date_finish": "2024-10-07T22:25:38+03:00",
  "operating_reset_at": 1728329738,
  "operating": 0
 }
}
```
