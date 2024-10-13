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
    Original = "/55ea8d67-9f19-45d3-a65e-2f8ae070c7e2.png";
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
  "private_resource": "1573541518:513349b18480e51184e963f68f6d0e8f4173c06c4ab885b65f0eb797138892f3",
  "public_resource": "1573541518:513349b18480e51184e963f68f6d0e8f4173c06c4ab885b65f0eb797138892f3"
 },
 "name": "2a45ec48-94fd-4a39-a282-836b0177948a.png",
 "exif": {},
 "created": "2024-10-09T09:10:03+03:00",
 "resource_id": "1573541518:513349b18480e51184e963f68f6d0e8f4173c06c4ab885b65f0eb797138892f3",
 "modified": "2024-10-09T09:10:27+03:00",
 "mime_type": "multipart",
 "file": "https://downloader.disk.yandex.ru/disk/a0b2187a8a78f1e08b108c712034d22c1c5b1f8b7d82f2b5d0c84af4e7ddf460/67065694/gwThwhLBKYvLhQCNnqAHikawF6ofeh69S2Q-9g1T5IGPQ-vmmg5ho0UNlym1cYvMYt55yWUwrNHLEwnJN27VGg%3D%3D?uid=1573541518&filename=2a45ec48-94fd-4a39-a282-836b0177948a.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "path": "disk:/2a45ec48-94fd-4a39-a282-836b0177948a.png",
 "media_type": "image",
 "sha256": "89f8eb42a35208a17c85036e17237b0aa0657e1841efa6171dc5acbc0dea9e18",
 "type": "file",
 "md5": "9e0176f87f6565a22f78e0f9b39a4d78",
 "revision": 1728454227592125
}
```
