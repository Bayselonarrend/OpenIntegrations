---
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
  "path": "disk:/6fe01aac-eb3c-48db-ae3f-c9ba2fe833c2",
  "total": 0
 },
 "name": "6fe01aac-eb3c-48db-ae3f-c9ba2fe833c2",
 "exif": {},
 "resource_id": "1573541518:67a01e2c46f5e6e54b9406659dd0468cc2144d1e467339a8a5c62335c6c38d29",
 "created": "2024-10-07T22:13:12+03:00",
 "modified": "2024-10-07T22:13:12+03:00",
 "path": "disk:/6fe01aac-eb3c-48db-ae3f-c9ba2fe833c2",
 "comment_ids": {
  "private_resource": "1573541518:67a01e2c46f5e6e54b9406659dd0468cc2144d1e467339a8a5c62335c6c38d29",
  "public_resource": "1573541518:67a01e2c46f5e6e54b9406659dd0468cc2144d1e467339a8a5c62335c6c38d29"
 },
 "type": "dir",
 "revision": 1728328392271635
}
```
