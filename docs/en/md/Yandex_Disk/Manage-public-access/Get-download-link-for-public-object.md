---
sidebar_position: 5
---

# Get download link for public object
 Gets a direct link to download the public object



`Function GetDownloadLinkForPublicObject(Val Token, Val URL, Val Path = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | URL | --url | String | Object address |
  | Path | --path | String | Path inside the object |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Yandex

<br/>




```bsl title="Code example"
    Token = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    URL   = "https://yadi.sk/d/3kAeHCjAHV_7sg";

    Result = OPI_YandexDisk.GetDownloadLinkForPublicObject(Token, URL);
```



```sh title="CLI command example"
    
  oint yadisk GetDownloadLinkForPublicObject --token "y0_AgAAAABdylaOAA..." --url "https://disk.yandex.by/i/txwzakUVtxgjoQ" --path %path%

```

```json title="Result"
{
 "href": "https://downloader.disk.yandex.ru/disk/2e62ca0e386073f3ba0bd6c3e4866a9c5ab0299cf8defea0ef009e399df8410b/67046bc6/gwThwhLBKYvLhQCNnqAHiuK8Ahrq5JWEM2INP0-LokTQTU0YuDY1w93ExosczTWq3ALOfQvG7DeHbaEMV-uPlg%3D%3D?uid=0&filename=3c2e1f9e-c9cf-4ed4-9292-d4bd921a2582.png&disposition=attachment&hash=AUdWsBqt7kr/J7RxPStpZw2WqKb8Tf%2BWBrM3y3O6JOyS00UloMMDLt%2BR5EhHpfx9q/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2",
 "method": "GET",
 "templated": false
}
```
