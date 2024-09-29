---
sidebar_position: 4
---

# Get public object
 Gets information about the published object by its URL



`Function GetPublicObject(Val Token, Val URL, Val Count = 0, Val OffsetFromStart = 0) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | URL | --url | String | Object address |
  | Count | --amount | Number | Number of returned nested objects (for catalog) |
  | OffsetFromStart | --offset | Number | Offset for getting nested objects not from the beginning of the list |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Yandex

<br/>




```bsl title="Code example"
    Token = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    URL   = "https://yadi.sk/d/3kAeHCjAHV_7sg";

    Result = OPI_YandexDisk.GetPublicObject(Token, URL);
```



```sh title="CLI command example"
    
  oint yadisk GetPublicObject --token "y0_AgAAAABdylaOAA..." --url "https://disk.yandex.by/i/txwzakUVtxgjoQ" --amount %amount% --offset %offset%

```

```json title="Result"
{
 "antivirus_status": "clean",
 "public_key": "F5u3mwemS1E4lOw0+cKFvaJ4+ZpztzMF+CKRQb1LMfYHIzWS7LwDwNEXBYc7fliGq/J6bpmRyOJonT3VoXnDag==",
 "public_url": "https://yadi.sk/d/Z06tjC0tqT2RyQ",
 "views_count": 0,
 "exif": {},
 "created": "2024-09-29T20:17:40+03:00",
 "type": "file",
 "resource_id": "1573541518:815538111476eb8b224569fcfabf81a20bbd61d0b69dae1deb496fb848cc21f6",
 "modified": "2024-09-29T20:17:40+03:00",
 "size": 2114023,
 "comment_ids": {
  "private_resource": "1573541518:815538111476eb8b224569fcfabf81a20bbd61d0b69dae1deb496fb848cc21f6",
  "public_resource": "1573541518:815538111476eb8b224569fcfabf81a20bbd61d0b69dae1deb496fb848cc21f6"
 },
 "mime_type": "multipart",
 "file": "https://downloader.disk.yandex.ru/disk/d9a03b7992ee18c44e8bc43d1e440c0019a3ffec38d5c1635b8a3ec974d47761/66f9c409/gwThwhLBKYvLhQCNnqAHig41JaMBPAWXQx_IzF63Q8zx_qLHbD1g1rqiEqs6JL4kPlT27sdH5J1t81MSfPVIgg%3D%3D?uid=0&filename=000f2f2d-7250-46f4-8f1e-9e831a845875.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=0&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "path": "/",
 "owner": {
  "login": "bayselonarrend",
  "display_name": "bayselonarrend",
  "uid": "1573541518"
 },
 "media_type": "image",
 "sha256": "89f8eb42a35208a17c85036e17237b0aa0657e1841efa6171dc5acbc0dea9e18",
 "revision": 1727630280920011,
 "md5": "9e0176f87f6565a22f78e0f9b39a4d78",
 "name": "000f2f2d-7250-46f4-8f1e-9e831a845875.png"
}
```
