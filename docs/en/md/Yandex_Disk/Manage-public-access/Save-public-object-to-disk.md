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
  "private_resource": "1573541518:073df0e3194b6e7157549aa4718da96af4bee68613a406c49cb9b4bc48be525d",
  "public_resource": "1573541518:073df0e3194b6e7157549aa4718da96af4bee68613a406c49cb9b4bc48be525d"
 },
 "name": "000f2f2d-7250-46f4-8f1e-9e831a845875.png",
 "exif": {},
 "created": "2024-09-29T20:18:02+03:00",
 "resource_id": "1573541518:073df0e3194b6e7157549aa4718da96af4bee68613a406c49cb9b4bc48be525d",
 "modified": "2024-09-29T20:18:02+03:00",
 "mime_type": "multipart",
 "file": "https://downloader.disk.yandex.ru/disk/50965ada99041eb9eba84f151405360c84ebfef6cb2c42eff01106c2a0c89862/66f9c40b/gwThwhLBKYvLhQCNnqAHig41JaMBPAWXQx_IzF63Q8zx_qLHbD1g1rqiEqs6JL4kPlT27sdH5J1t81MSfPVIgg%3D%3D?uid=1573541518&filename=000f2f2d-7250-46f4-8f1e-9e831a845875.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "path": "disk:/Загрузки/000f2f2d-7250-46f4-8f1e-9e831a845875.png",
 "media_type": "image",
 "sha256": "89f8eb42a35208a17c85036e17237b0aa0657e1841efa6171dc5acbc0dea9e18",
 "type": "file",
 "md5": "9e0176f87f6565a22f78e0f9b39a4d78",
 "revision": 1727630282286905
}
```
