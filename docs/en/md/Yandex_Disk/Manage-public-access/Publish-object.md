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
    Path  = "/55ea8d67-9f19-45d3-a65e-2f8ae070c7e2.png";

    Result = OPI_YandexDisk.PublishObject(Token, Path);
```



```sh title="CLI command example"
    
  oint yadisk PublishObject --token "y0_AgAAAABdylaOAA..." --path "/Alpaca.png"

```

```json title="Result"
{
 "antivirus_status": "clean",
 "public_key": "Zgug7716lOoPjW/yVHq7fCMf2VsHEqpvymRw7rxCkLG46AH97K0C1XZAECLVSaR1q/J6bpmRyOJonT3VoXnDag==",
 "public_url": "https://yadi.sk/d/p1LRMjbJRWmI6w",
 "name": "c799f944-a1e1-460c-b167-369776aec80b.png",
 "exif": {},
 "created": "2024-10-09T09:10:44+03:00",
 "size": 2114023,
 "resource_id": "1573541518:15116e358f7727f9590f66b5967cae42c4134b5e8dafc5a4acba41a51258d715",
 "modified": "2024-10-09T09:10:44+03:00",
 "comment_ids": {
  "private_resource": "1573541518:15116e358f7727f9590f66b5967cae42c4134b5e8dafc5a4acba41a51258d715",
  "public_resource": "1573541518:15116e358f7727f9590f66b5967cae42c4134b5e8dafc5a4acba41a51258d715"
 },
 "mime_type": "multipart",
 "file": "https://downloader.disk.yandex.ru/disk/56103cba7a5223058dc17dfaaa884c9cc2d8e1687e81c841f8a991f2781ac6c0/670656b8/gwThwhLBKYvLhQCNnqAHikawF6ofeh69S2Q-9g1T5IGPQ-vmmg5ho0UNlym1cYvMYt55yWUwrNHLEwnJN27VGg%3D%3D?uid=1573541518&filename=c799f944-a1e1-460c-b167-369776aec80b.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "path": "disk:/c799f944-a1e1-460c-b167-369776aec80b.png",
 "media_type": "image",
 "sha256": "89f8eb42a35208a17c85036e17237b0aa0657e1841efa6171dc5acbc0dea9e18",
 "type": "file",
 "md5": "9e0176f87f6565a22f78e0f9b39a4d78",
 "revision": 1728454264539399
}
```
