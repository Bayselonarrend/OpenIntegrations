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
  "private_resource": "1573541518:703b8f9f32c651c081c8f4bb6e0085f8f2c340d547f40561dbead6375e8192be",
  "public_resource": "1573541518:703b8f9f32c651c081c8f4bb6e0085f8f2c340d547f40561dbead6375e8192be"
 },
 "name": "6bb39348-f387-4876-870c-71841946de72.png",
 "exif": {},
 "created": "2024-09-29T20:14:58+03:00",
 "resource_id": "1573541518:703b8f9f32c651c081c8f4bb6e0085f8f2c340d547f40561dbead6375e8192be",
 "modified": "2024-09-29T20:14:58+03:00",
 "mime_type": "multipart",
 "file": "https://downloader.disk.yandex.ru/disk/e87858bbfc2a326e7e2d400b10dc3f709ea45e96a82f1cc01f66885fc3140ee7/66f9c356/gwThwhLBKYvLhQCNnqAHitgh7RxvnVWi1SvVfyfUwXaLN9Z2UqAZdj2x7rzFUiVqAHIuw7FTWvjJYqGS3oaEkw%3D%3D?uid=1573541518&filename=6bb39348-f387-4876-870c-71841946de72.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "path": "disk:/6bb39348-f387-4876-870c-71841946de72.png",
 "media_type": "image",
 "sha256": "89f8eb42a35208a17c85036e17237b0aa0657e1841efa6171dc5acbc0dea9e18",
 "type": "file",
 "md5": "9e0176f87f6565a22f78e0f9b39a4d78",
 "revision": 1727630099034488
}
```
