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
  "path": "disk:/19552cbf-f422-4469-90f4-169312684c47",
  "total": 0
 },
 "name": "19552cbf-f422-4469-90f4-169312684c47",
 "exif": {},
 "resource_id": "1573541518:4b6f7d4901604cec186bb6d0e3e5cb8f486935eb397f6ee962bfa185a1fe2655",
 "created": "2024-10-05T17:53:38+03:00",
 "modified": "2024-10-05T17:53:38+03:00",
 "path": "disk:/19552cbf-f422-4469-90f4-169312684c47",
 "comment_ids": {
  "private_resource": "1573541518:4b6f7d4901604cec186bb6d0e3e5cb8f486935eb397f6ee962bfa185a1fe2655",
  "public_resource": "1573541518:4b6f7d4901604cec186bb6d0e3e5cb8f486935eb397f6ee962bfa185a1fe2655"
 },
 "type": "dir",
 "revision": 1728140018390085
}
```
