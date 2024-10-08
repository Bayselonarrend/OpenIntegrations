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
  "private_resource": "1573541518:6a28de1221abe7dc69508713ffb7042335f1951b4c60fe26df2c7f7653af005d",
  "public_resource": "1573541518:6a28de1221abe7dc69508713ffb7042335f1951b4c60fe26df2c7f7653af005d"
 },
 "name": "fa815b68-c824-4e57-a0ba-2b13da9f53a3.png",
 "exif": {},
 "created": "2024-10-07T22:13:22+03:00",
 "resource_id": "1573541518:6a28de1221abe7dc69508713ffb7042335f1951b4c60fe26df2c7f7653af005d",
 "modified": "2024-10-07T22:13:22+03:00",
 "mime_type": "multipart",
 "file": "https://downloader.disk.yandex.ru/disk/b59f1f423343006a89d4a10547b20e8cfac3a80e9d64cb3a5ba2cb0fd04ac438/67046b16/gwThwhLBKYvLhQCNnqAHitjtYP_sMEGdXpAYnCH3CeOI2TmJ3n1LCawN581CYeuif0mayq9-vnAgzEVZSHXCMA%3D%3D?uid=1573541518&filename=fa815b68-c824-4e57-a0ba-2b13da9f53a3.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "path": "disk:/fa815b68-c824-4e57-a0ba-2b13da9f53a3.png",
 "media_type": "image",
 "sha256": "89f8eb42a35208a17c85036e17237b0aa0657e1841efa6171dc5acbc0dea9e18",
 "type": "file",
 "md5": "9e0176f87f6565a22f78e0f9b39a4d78",
 "revision": 1728328402955496
}
```
