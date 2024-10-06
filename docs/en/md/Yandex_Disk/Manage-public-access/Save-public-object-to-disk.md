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
  "private_resource": "1573541518:64adeb3d58c742d8454ed2e402cca06c273b8dae6836d698568f95edd7e348c3",
  "public_resource": "1573541518:64adeb3d58c742d8454ed2e402cca06c273b8dae6836d698568f95edd7e348c3"
 },
 "name": "b920c9ec-f76c-4d42-bf41-6366e6a1b79b.png",
 "exif": {},
 "created": "2024-10-05T17:56:46+03:00",
 "resource_id": "1573541518:64adeb3d58c742d8454ed2e402cca06c273b8dae6836d698568f95edd7e348c3",
 "modified": "2024-10-05T17:56:46+03:00",
 "mime_type": "multipart",
 "file": "https://downloader.disk.yandex.ru/disk/8fdb812c9b5a11ce3d7b2f1a997b5b4bb0417b786ff9b8ea86811808d8bed8ca/67018bef/gwThwhLBKYvLhQCNnqAHiheNGzC_GrcINLjKfGL-iFxSZC-V0pT00qrr-5minWJzRluxb4Cd2iSgOIgtMkAXZA%3D%3D?uid=1573541518&filename=b920c9ec-f76c-4d42-bf41-6366e6a1b79b.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "path": "disk:/Загрузки/b920c9ec-f76c-4d42-bf41-6366e6a1b79b.png",
 "media_type": "image",
 "sha256": "89f8eb42a35208a17c85036e17237b0aa0657e1841efa6171dc5acbc0dea9e18",
 "type": "file",
 "md5": "9e0176f87f6565a22f78e0f9b39a4d78",
 "revision": 1728140206946313
}
```
