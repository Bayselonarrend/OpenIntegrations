﻿---
sidebar_position: 2
---

# Create folder
 Creates a directory on the disk



`Function CreateFolder(Val Token, Val Path) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Path | --path | String | Path to the created folder |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Yandex

<br/>




```bsl title="Code example"
    Token = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    Path  = "/" + String(New UUID);

    Result = OPI_YandexDisk.CreateFolder(Token, Path);
```



```sh title="CLI command example"
    
  oint yadisk CreateFolder --token "y0_AgAAAABdylaOAAs0QgAAAAD5i-a..." --path %path%

```

```json title="Result"
{
 "_embedded": {
  "sort": "",
  "items": [],
  "limit": 20,
  "offset": 0,
  "path": "disk:/81da8ff8-4975-43d1-aebc-dbffba560d71",
  "total": 0
 },
 "name": "81da8ff8-4975-43d1-aebc-dbffba560d71",
 "exif": {},
 "resource_id": "1573541518:f9053a23fcfa0c3d45a2c95c14f9afe70c7954cdbb35c58bf2f16a61ed289880",
 "created": "2024-10-09T09:07:49+03:00",
 "modified": "2024-10-09T09:07:49+03:00",
 "path": "disk:/81da8ff8-4975-43d1-aebc-dbffba560d71",
 "comment_ids": {
  "private_resource": "1573541518:f9053a23fcfa0c3d45a2c95c14f9afe70c7954cdbb35c58bf2f16a61ed289880",
  "public_resource": "1573541518:f9053a23fcfa0c3d45a2c95c14f9afe70c7954cdbb35c58bf2f16a61ed289880"
 },
 "type": "dir",
 "revision": 1728454069973169
}
```
