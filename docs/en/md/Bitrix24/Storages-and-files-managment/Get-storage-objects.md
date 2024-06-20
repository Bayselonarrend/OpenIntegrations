---
sidebar_position: 5
---

# Get a list of child storage objects
 Get a list of files and folders, located at the root of the storage


*Function GetStorageObjects(Val URL, Val StorageID, Val Token = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | StorageID | --storageid | String, Number | Storage ID |
 | Token | --token | String | Access token, when not-webhook method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

```bsl title="Code example"
	
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
 StorageID = 3;
 Result = OPI_Bitrix24.GetStorageObjects(URL, StorageID);
 
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "b9df7366006e9f06006b12e400000001000...";
 
 Result = OPI_Bitrix24.GetStorageObjects(URL, StorageID, Token);
	
```

```sh title="CLI command example"
 
oint bitrix24 GetStorageObjects --url "b24-ar17wx.bitrix24.by" --storageid %storageid% --token "b9df7366006e9f06006b12e400000001000..."

```


```json title="Result"



```
