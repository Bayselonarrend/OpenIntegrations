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
  "path": "disk:/0d8303a1-f958-4ec6-bbae-b128d2f048cd",
  "total": 0
 },
 "name": "0d8303a1-f958-4ec6-bbae-b128d2f048cd",
 "exif": {},
 "resource_id": "1573541518:424fd2b78c4e1b1068056e2403f772c2888ad8b2b3f2901f7812286df74379d7",
 "created": "2024-09-29T20:14:47+03:00",
 "modified": "2024-09-29T20:14:47+03:00",
 "path": "disk:/0d8303a1-f958-4ec6-bbae-b128d2f048cd",
 "comment_ids": {
  "private_resource": "1573541518:424fd2b78c4e1b1068056e2403f772c2888ad8b2b3f2901f7812286df74379d7",
  "public_resource": "1573541518:424fd2b78c4e1b1068056e2403f772c2888ad8b2b3f2901f7812286df74379d7"
 },
 "type": "dir",
 "revision": 1727630087545834
}
```
