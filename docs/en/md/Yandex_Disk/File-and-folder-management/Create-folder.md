---
sidebar_position: 2
---

# Create folder
 Creates a directory on the disk


*Function CreateFolder(Val Token, Val Path) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Path | --path | String | Path to the created folder |

 
 Returns: Key-Value Pair - serialized JSON response from Yandex

```bsl title="Code example"
	
 
 Token = "y0_AgAAAABdylaOAA...";
 Path = "/TestFolder"
 Response = OPI_YandexDisk.CreateFolder(Token, Path); //Map
 Response = OPI_Tools.JSONString(Response); //String
 
 
	
```

```sh title="CLI command example"
 
 oint yadisk CreateFolder --token "y0_AgAAAABdylaOAA..." --path "/TestFolder"


```


```json title="Result"

{
 "revision": 1707461457546792,
 "comment_ids": {
 "public_resource": "1573541518:ba32b9efac79ab1b04707a4278a1ff583d7b0403ea306035f1b910e56c6ef3ac",
 "private_resource": "1573541518:ba32b9efac79ab1b04707a4278a1ff583d7b0403ea306035f1b910e56c6ef3ac"
 },
 "path": "disk:/TestFolder",
 "modified": "2024-02-09T06:50:57+00:00",
 "created": "2024-02-09T06:50:57+00:00",
 "resource_id": "1573541518:ba32b9efac79ab1b04707a4278a1ff583d7b0403ea306035f1b910e56c6ef3ac",
 "type": "dir",
 "name": "TestFolder",
 "exif": {},
 "_embedded": {
 "total": 0,
 "path": "disk:/TestFolder",
 "limit": 20,
 "offset": 0,
 "items": [],
 "sort": ""
 }
 }

```
