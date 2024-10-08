﻿---
sidebar_position: 6
---

# Save public object to disk
 Saves the public object to your disk



`Function SavePublicObjectToDisk(Val Token, Val URL, From = "", Target = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | URL | --url | String | Object address |
  | From | --from | String | Path within public catalog (folders only) |
  | Target | --to | String | File save path |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Yandex

<br/>




```bsl title="Code example"
    Token = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    URL   = "https://yadi.sk/d/3kAeHCjAHV_7sg";

    Result = OPI_YandexDisk.SavePublicObjectToDisk(Token, URL);
```



```sh title="CLI command example"
    
  oint yadisk SavePublicObjectToDisk --token "y0_AgAAAABdylaOAA..." --url "https://disk.yandex.by/i/txwzakUVtxgjoQ" --from %from% --to %to%

```

```json title="Result"
{
 "antivirus_status": "clean",
 "size": 2114023,
 "comment_ids": {
  "private_resource": "1573541518:a84e0728fb01f0027cf9c1d17f789835601fd460bf3ad4a1fb0fc8ddb4b6fd30",
  "public_resource": "1573541518:a84e0728fb01f0027cf9c1d17f789835601fd460bf3ad4a1fb0fc8ddb4b6fd30"
 },
 "name": "c799f944-a1e1-460c-b167-369776aec80b.png",
 "exif": {},
 "created": "2024-10-09T09:11:06+03:00",
 "resource_id": "1573541518:a84e0728fb01f0027cf9c1d17f789835601fd460bf3ad4a1fb0fc8ddb4b6fd30",
 "modified": "2024-10-09T09:11:06+03:00",
 "mime_type": "multipart",
 "file": "https://downloader.disk.yandex.ru/disk/200b4338faaeba43248f9caf757082b27048ac80701312e53ac6eeac130e0205/670656bb/gwThwhLBKYvLhQCNnqAHikawF6ofeh69S2Q-9g1T5IGPQ-vmmg5ho0UNlym1cYvMYt55yWUwrNHLEwnJN27VGg%3D%3D?uid=1573541518&filename=c799f944-a1e1-460c-b167-369776aec80b.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "path": "disk:/Загрузки/c799f944-a1e1-460c-b167-369776aec80b.png",
 "media_type": "image",
 "sha256": "89f8eb42a35208a17c85036e17237b0aa0657e1841efa6171dc5acbc0dea9e18",
 "type": "file",
 "md5": "9e0176f87f6565a22f78e0f9b39a4d78",
 "revision": 1728454266449486
}
```
