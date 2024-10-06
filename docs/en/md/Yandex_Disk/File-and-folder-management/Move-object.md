---
sidebar_position: 9
---

# Move object
 Moves the object to the specified path and path to the original



`Function MoveObject(Val Token, Val Original, Val Path, Val Overwrite = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Original | --from | String | Path to the original file or folder |
  | Path | --to | String | Destination path for moving |
  | Overwrite | --rewrite | Boolean | Overwrite if a file with the same name already exists |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Yandex

<br/>




```bsl title="Code example"
    Token    = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    Original = "/03dd2890-1f66-4d5c-80b3-87a0d2824723.png";
    Path     = "/" + String(New UUID) + ".png";

    Result = OPI_YandexDisk.MoveObject(Token, Original, Path, True);
```



```sh title="CLI command example"
    
  oint yadisk MoveObject --token "y0_AgAAAABdylaOAA..." --from "/Alpaca.png" --to "/TestFolder/Alpaca (Moved).png" --rewrite %rewrite%

```

```json title="Result"
{
 "antivirus_status": "clean",
 "size": 2114023,
 "comment_ids": {
  "private_resource": "1573541518:613321178b05790df0b4c58122157a924ee4db3416d47381516eafd16b426657",
  "public_resource": "1573541518:613321178b05790df0b4c58122157a924ee4db3416d47381516eafd16b426657"
 },
 "name": "f4ae383d-030b-4368-acea-57a5ff65a4b8.png",
 "exif": {},
 "created": "2024-10-05T17:55:48+03:00",
 "resource_id": "1573541518:613321178b05790df0b4c58122157a924ee4db3416d47381516eafd16b426657",
 "modified": "2024-10-05T17:56:09+03:00",
 "mime_type": "multipart",
 "file": "https://downloader.disk.yandex.ru/disk/ba07e47f689a939f7d4505e965d1397d3394b2a58b7fcf6f0d3c0528afcc6c5b/67018bca/gwThwhLBKYvLhQCNnqAHiheNGzC_GrcINLjKfGL-iFxSZC-V0pT00qrr-5minWJzRluxb4Cd2iSgOIgtMkAXZA%3D%3D?uid=1573541518&filename=f4ae383d-030b-4368-acea-57a5ff65a4b8.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "path": "disk:/f4ae383d-030b-4368-acea-57a5ff65a4b8.png",
 "media_type": "image",
 "sha256": "89f8eb42a35208a17c85036e17237b0aa0657e1841efa6171dc5acbc0dea9e18",
 "type": "file",
 "md5": "9e0176f87f6565a22f78e0f9b39a4d78",
 "revision": 1728140169603399
}
```
