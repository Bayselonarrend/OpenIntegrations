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
 "href": "https://downloader.disk.yandex.ru/disk/28f96408aef9433a2435223d82e23109567fa2109ee90a4adad006df0f92a1dd/67018b9e/gwThwhLBKYvLhQCNnqAHiheNGzC_GrcINLjKfGL-iFxSZC-V0pT00qrr-5minWJzRluxb4Cd2iSgOIgtMkAXZA%3D%3D?uid=1573541518&filename=c95f370d-1a82-4815-ade8-542125e6bc79.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "method": "GET",
 "templated": false
}
```
