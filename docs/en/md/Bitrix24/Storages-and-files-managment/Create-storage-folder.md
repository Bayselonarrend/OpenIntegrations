---
sidebar_position: 7
---

# Create folder at the storage
 Create new foldera at the storage


*Function CreateStorageFolder(Val URL, Val StorageID, Val Name, Val Token = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | StorageID | --storageid | String | Storage ID |
 | Name | --title | String | Folder name |
 | Token | --token | String | Access token, when not-webhook method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

```bsl title="Code example"
	
 StorageID = 3;
 Name = "New catalog";
 Filename2 = "New folder 2";
 
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
 
 Result = OPI_Bitrix24.CreateStorageFolder(URL, StorageID, Filename2);
 
 
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "b9df7366006e9f06006b12e400000001000...";
 
 Result = OPI_Bitrix24.CreateStorageFolder(URL, StorageID, Name, Token);
	
```

```sh title="CLI command example"
 
 oint bitrix24 CreateStorageFolder --url "b24-ar17wx.bitrix24.by" --storageid %storageid% --title %title% --token "b9df7366006e9f06006b12e400000001000..."

```


```json title="Result"



```
