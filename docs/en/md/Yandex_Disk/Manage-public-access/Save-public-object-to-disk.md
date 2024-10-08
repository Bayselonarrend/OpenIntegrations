---
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
  "private_resource": "1573541518:6cdbc8ecfa70965db1721f5e8a6e96d7025f90e9314b223a5ba9d1f201120cbf",
  "public_resource": "1573541518:6cdbc8ecfa70965db1721f5e8a6e96d7025f90e9314b223a5ba9d1f201120cbf"
 },
 "name": "3c2e1f9e-c9cf-4ed4-9292-d4bd921a2582.png",
 "exif": {},
 "created": "2024-10-07T22:16:23+03:00",
 "resource_id": "1573541518:6cdbc8ecfa70965db1721f5e8a6e96d7025f90e9314b223a5ba9d1f201120cbf",
 "modified": "2024-10-07T22:16:23+03:00",
 "mime_type": "multipart",
 "file": "https://downloader.disk.yandex.ru/disk/bf367cf7144cc46cbf471f91d97a41adb7cf3f1da258c8accd63e757fff740d9/67046bc8/gwThwhLBKYvLhQCNnqAHiuK8Ahrq5JWEM2INP0-LokTQTU0YuDY1w93ExosczTWq3ALOfQvG7DeHbaEMV-uPlg%3D%3D?uid=1573541518&filename=3c2e1f9e-c9cf-4ed4-9292-d4bd921a2582.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "path": "disk:/Загрузки/3c2e1f9e-c9cf-4ed4-9292-d4bd921a2582.png",
 "media_type": "image",
 "sha256": "89f8eb42a35208a17c85036e17237b0aa0657e1841efa6171dc5acbc0dea9e18",
 "type": "file",
 "md5": "9e0176f87f6565a22f78e0f9b39a4d78",
 "revision": 1728328583538324
}
```
