---
sidebar_position: 6
---

# Get download link
 Gets a download link for the file



`Function GetDownloadLink(Val Token, Val Path) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Path | --path | String | Path to the file for downloading |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Yandex

<br/>




```bsl title="Code example"
    Token = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    Path  = "/81c378eb-eaf3-446c-9b78-b89c94fd8e50.png";

    Result = OPI_YandexDisk.GetDownloadLink(Token, Path);
```



```sh title="CLI command example"
    
  oint yadisk GetDownloadLink --token "y0_AgAAAABdylaOAA..." --path "/Alpaca.png"

```

```json title="Result"
{
 "href": "https://downloader.disk.yandex.ru/disk/9b621e2e8427e6293a6819fa16e6bc4c05a646e2f7c5589d59fdf4fa37aee417/67046b75/gwThwhLBKYvLhQCNnqAHiuK8Ahrq5JWEM2INP0-LokTQTU0YuDY1w93ExosczTWq3ALOfQvG7DeHbaEMV-uPlg%3D%3D?uid=1573541518&filename=9a85d83f-f8cc-4a17-82fd-471f11cc12fa.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "method": "GET",
 "templated": false
}
```
