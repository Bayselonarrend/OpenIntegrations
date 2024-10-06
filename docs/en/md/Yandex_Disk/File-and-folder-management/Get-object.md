---
sidebar_position: 3
---

# Get object
 Gets information about a disk object at the specified path



`Function GetObject(Val Token, Val Path) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Path | --path | String | Path to folder or file |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Yandex

<br/>




```bsl title="Code example"
    Token = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    Path  = "/90663562-d505-474e-a778-e25c2cf50b4b.png";

    Result = OPI_YandexDisk.GetObject(Token, Path);
```



```sh title="CLI command example"
    
  oint yadisk GetObject --token "y0_AgAAAABdylaOAA..." --path "/Alpaca.png"

```

```json title="Result"
{
 "antivirus_status": "clean",
 "size": 2114023,
 "comment_ids": {
  "private_resource": "1573541518:b9529c5e46895544e3721ab21b2f19dd17a9ca0260b96ac27052f022b2364cf7",
  "public_resource": "1573541518:b9529c5e46895544e3721ab21b2f19dd17a9ca0260b96ac27052f022b2364cf7"
 },
 "name": "53589bd2-651c-4af6-bf9c-1e0ac46b8d25.png",
 "exif": {},
 "created": "2024-10-05T17:53:48+03:00",
 "resource_id": "1573541518:b9529c5e46895544e3721ab21b2f19dd17a9ca0260b96ac27052f022b2364cf7",
 "modified": "2024-10-05T17:53:48+03:00",
 "mime_type": "multipart",
 "file": "https://downloader.disk.yandex.ru/disk/b64626f12aa0807294df0ce593052f9287d62e5d2e8bb6d235b4ba4d793f68cb/67018b41/gwThwhLBKYvLhQCNnqAHipywi5NktLJF2FSIe2PxryCqqTmRBN8go_fBhkKvw4LDOF0Fa7xIWiM8UxRYkTOiTw%3D%3D?uid=1573541518&filename=53589bd2-651c-4af6-bf9c-1e0ac46b8d25.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "path": "disk:/53589bd2-651c-4af6-bf9c-1e0ac46b8d25.png",
 "media_type": "image",
 "sha256": "89f8eb42a35208a17c85036e17237b0aa0657e1841efa6171dc5acbc0dea9e18",
 "type": "file",
 "md5": "9e0176f87f6565a22f78e0f9b39a4d78",
 "revision": 1728140029624112
}
```
