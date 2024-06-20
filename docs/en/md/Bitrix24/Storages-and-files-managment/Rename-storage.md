---
sidebar_position: 4
---

# Rename storage
 Change storage name (for app storage only, see. GetAppStorage)


*Function RenameStorage(Val URL, Val StorageID, Val Name, Val Token = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | StorageID | --storageid | String, Number | Storage ID |
 | Name | --title | String | New storage name |
 | Token | --token | String | Access token, when not-webhook method used |

 
 Returns: HTTPResponse - Rename storage

```bsl title="Code example"
	
 Name = "New storage name";
 URL = "b24-ar17wx.bitrix24.by";
 Token = "b9df7366006e9f06006b12e400000001000...";
 StorageID = "18";
 
 Result = OPI_Bitrix24.RenameStorage(URL, StorageID, Name, Token);
	
```

```sh title="CLI command example"
 
oint bitrix24 RenameStorage --url "b24-ar17wx.bitrix24.by" --storageid "18" --title %title% --token "b9df7366006e9f06006b12e400000001000..."

```


```json title="Result"



```
