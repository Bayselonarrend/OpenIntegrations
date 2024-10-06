---
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
  "private_resource": "1573541518:c676d41f32d96729f8d57130c1907e54f37494d74638265d8f9c911b589e6c2b",
  "public_resource": "1573541518:c676d41f32d96729f8d57130c1907e54f37494d74638265d8f9c911b589e6c2b"
 },
 "name": "8138c93e-a10a-41ce-a134-44635aa2cebe.png",
 "exif": {},
 "created": "2024-10-05T17:54:50+03:00",
 "resource_id": "1573541518:c676d41f32d96729f8d57130c1907e54f37494d74638265d8f9c911b589e6c2b",
 "modified": "2024-10-05T17:54:50+03:00",
 "mime_type": "multipart",
 "file": "https://downloader.disk.yandex.ru/disk/9bd62c74b1b88ac42708b7996e61cad4c232bac3c2f43e3193a188483ce25597/67018b7a/gwThwhLBKYvLhQCNnqAHiheNGzC_GrcINLjKfGL-iFxSZC-V0pT00qrr-5minWJzRluxb4Cd2iSgOIgtMkAXZA%3D%3D?uid=1573541518&filename=8138c93e-a10a-41ce-a134-44635aa2cebe.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "path": "disk:/8138c93e-a10a-41ce-a134-44635aa2cebe.png",
 "media_type": "image",
 "sha256": "89f8eb42a35208a17c85036e17237b0aa0657e1841efa6171dc5acbc0dea9e18",
 "type": "file",
 "md5": "9e0176f87f6565a22f78e0f9b39a4d78",
 "revision": 1728140090240019
}
```
