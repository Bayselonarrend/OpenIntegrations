﻿---
sidebar_position: 5
---

# Create object copy
 Creates a copy of the object at the specified path and path to the original



`Function CreateObjectCopy(Val Token, Val Original, Val Path, Val Overwrite = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Original | --from | String | Path to the original file or directory |
  | Path | --to | String | Destination path for the copy |
  | Overwrite | --rewrite | Boolean | Overwrite if a file with the same name already exists |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Yandex

<br/>




```bsl title="Code example"
    Token    = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    Original = "/03dd2890-1f66-4d5c-80b3-87a0d2824723.png";
    Path     = "/" + String(New UUID) + ".png";

    Result = OPI_YandexDisk.CreateObjectCopy(Token, Original, Path, True);
```



```sh title="CLI command example"
    
  oint yadisk CreateObjectCopy --token "y0_AgAAAABdylaOAA..." --from "/Alpaca.png" --to "/Alpaca (copy).png" --rewrite %rewrite%

```

```json title="Result"
{
 "antivirus_status": "clean",
 "size": 2114023,
 "comment_ids": {
  "private_resource": "1573541518:6926f51536837394b524a917099c11217914ac43eecf41e7152d52b8e9a20362",
  "public_resource": "1573541518:6926f51536837394b524a917099c11217914ac43eecf41e7152d52b8e9a20362"
 },
 "name": "ed13b9fd-51cb-4857-b59d-d8f4fe448746.png",
 "exif": {},
 "created": "2024-10-09T09:09:01+03:00",
 "resource_id": "1573541518:6926f51536837394b524a917099c11217914ac43eecf41e7152d52b8e9a20362",
 "modified": "2024-10-09T09:09:01+03:00",
 "mime_type": "multipart",
 "file": "https://downloader.disk.yandex.ru/disk/dc02f41a6c785082b3d549fecc0135f2724bd95aa23e7d01b871ce33be82a59a/6706563e/gwThwhLBKYvLhQCNnqAHikawF6ofeh69S2Q-9g1T5IGPQ-vmmg5ho0UNlym1cYvMYt55yWUwrNHLEwnJN27VGg%3D%3D?uid=1573541518&filename=ed13b9fd-51cb-4857-b59d-d8f4fe448746.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "path": "disk:/ed13b9fd-51cb-4857-b59d-d8f4fe448746.png",
 "media_type": "image",
 "sha256": "89f8eb42a35208a17c85036e17237b0aa0657e1841efa6171dc5acbc0dea9e18",
 "type": "file",
 "md5": "9e0176f87f6565a22f78e0f9b39a4d78",
 "revision": 1728454141910980
}
```
