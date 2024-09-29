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
 "public_key": "F5u3mwemS1E4lOw0+cKFvaJ4+ZpztzMF+CKRQb1LMfYHIzWS7LwDwNEXBYc7fliGq/J6bpmRyOJonT3VoXnDag==",
 "public_url": "https://yadi.sk/d/Z06tjC0tqT2RyQ",
 "name": "000f2f2d-7250-46f4-8f1e-9e831a845875.png",
 "exif": {},
 "created": "2024-09-29T20:17:40+03:00",
 "size": 2114023,
 "resource_id": "1573541518:815538111476eb8b224569fcfabf81a20bbd61d0b69dae1deb496fb848cc21f6",
 "modified": "2024-09-29T20:17:40+03:00",
 "comment_ids": {
  "private_resource": "1573541518:815538111476eb8b224569fcfabf81a20bbd61d0b69dae1deb496fb848cc21f6",
  "public_resource": "1573541518:815538111476eb8b224569fcfabf81a20bbd61d0b69dae1deb496fb848cc21f6"
 },
 "mime_type": "multipart",
 "file": "https://downloader.disk.yandex.ru/disk/d1413eb456d2daceeecac18ce85befff98e7329f29861285677bcca415d9289c/66f9c409/gwThwhLBKYvLhQCNnqAHig41JaMBPAWXQx_IzF63Q8zx_qLHbD1g1rqiEqs6JL4kPlT27sdH5J1t81MSfPVIgg%3D%3D?uid=1573541518&filename=000f2f2d-7250-46f4-8f1e-9e831a845875.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "path": "disk:/000f2f2d-7250-46f4-8f1e-9e831a845875.png",
 "media_type": "image",
 "sha256": "89f8eb42a35208a17c85036e17237b0aa0657e1841efa6171dc5acbc0dea9e18",
 "type": "file",
 "md5": "9e0176f87f6565a22f78e0f9b39a4d78",
 "revision": 1727630280920011
}
```
