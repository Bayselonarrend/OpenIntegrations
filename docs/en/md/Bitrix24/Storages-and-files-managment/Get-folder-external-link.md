---
sidebar_position: 14
---

# Get external link for folder
 Get external link to folder




<br/>


*Function GetFolderExternalLink(Val URL, Val FolderID, Val Token = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | FolderID | --folderid | String, Number | Folder identifier |
 | Token | --token | String | Access token, when not-webhook method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API


```bsl title="Code example"
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
 FolderID = "2490";
 
 Result = OPI_Bitrix24.GetFolderExternalLink(URL, FolderID);
 
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "56898d66006e9f06006b12e400000001000...";
 
 Result = OPI_Bitrix24.GetFolderExternalLink(URL, FolderID, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 GetFolderExternalLink --url "b24-ar17wx.bitrix24.by" --folderid "2490" --token "56898d66006e9f06006b12e400000001000..."

```

```json title="Result"
 {
 "result": "https://b24-ar17wx.bitrix24.by/~hWalI",
 "time": {
 "start": 1719472796.12325,
 "finish": 1719472796.16843,
 "duration": 0.0451798439025879,
 "processing": 0.0110611915588379,
 "date_start": "2024-06-27T07:19:56+00:00",
 "date_finish": "2024-06-27T07:19:56+00:00",
 "operating_reset_at": 1719473396,
 "operating": 0
 }
}
```
