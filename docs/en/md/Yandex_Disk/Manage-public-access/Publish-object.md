---
sidebar_position: 1
---

# Publish object
 Publishes the disk object for public access



`Function PublishObject(Val Token, Val Path) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Path | --path | String | Path to the object to be published |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Yandex

<br/>




```bsl title="Code example"
    Token = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    Path  = "/03dd2890-1f66-4d5c-80b3-87a0d2824723.png";

    Result = OPI_YandexDisk.PublishObject(Token, Path);
```



```sh title="CLI command example"
    
  oint yadisk PublishObject --token "y0_AgAAAABdylaOAA..." --path "/Alpaca.png"

```

```json title="Result"
{
 "antivirus_status": "clean",
 "public_key": "AUdWsBqt7kr/J7RxPStpZw2WqKb8Tf+WBrM3y3O6JOyS00UloMMDLt+R5EhHpfx9q/J6bpmRyOJonT3VoXnDag==",
 "public_url": "https://yadi.sk/d/QZtRt2qCWMrNZw",
 "name": "3c2e1f9e-c9cf-4ed4-9292-d4bd921a2582.png",
 "exif": {},
 "created": "2024-10-07T22:16:01+03:00",
 "size": 2114023,
 "resource_id": "1573541518:1196737ad4beaf380ff6e04da18778717f5fc9e84b507984114f2158cd6aed75",
 "modified": "2024-10-07T22:16:01+03:00",
 "comment_ids": {
  "private_resource": "1573541518:1196737ad4beaf380ff6e04da18778717f5fc9e84b507984114f2158cd6aed75",
  "public_resource": "1573541518:1196737ad4beaf380ff6e04da18778717f5fc9e84b507984114f2158cd6aed75"
 },
 "mime_type": "multipart",
 "file": "https://downloader.disk.yandex.ru/disk/5bb6cb6d6409085e4848e96658e79babb111ada22027648b5941f0e31a3723d8/67046bc6/gwThwhLBKYvLhQCNnqAHiuK8Ahrq5JWEM2INP0-LokTQTU0YuDY1w93ExosczTWq3ALOfQvG7DeHbaEMV-uPlg%3D%3D?uid=1573541518&filename=3c2e1f9e-c9cf-4ed4-9292-d4bd921a2582.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "path": "disk:/3c2e1f9e-c9cf-4ed4-9292-d4bd921a2582.png",
 "media_type": "image",
 "sha256": "89f8eb42a35208a17c85036e17237b0aa0657e1841efa6171dc5acbc0dea9e18",
 "type": "file",
 "md5": "9e0176f87f6565a22f78e0f9b39a4d78",
 "revision": 1728328581741444
}
```
