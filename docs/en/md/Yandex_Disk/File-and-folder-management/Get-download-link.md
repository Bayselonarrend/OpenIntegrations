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
  
  Token = "y0_AgAAAABdylaOAA...";
  Path = "/Alpaca.png"
  Response = OPI_YandexDisk.GetDownloadLink(Token, Path); //Map
  Response = OPI_Tools.JSONString(Response); //String
```



```sh title="CLI command example"
    
  oint yadisk GetDownloadLink --token "y0_AgAAAABdylaOAA..." --path "/Alpaca.png"

```

```json title="Result"
  {
  "templated": false,
  "method": "GET",
  "href": "https://downloader.disk.yandex.ru/disk/5e035e14f3580573be69477a0a5a41a598227875d7c471604e386ee2dcfc7067/65c62a93/gwThwhLBKYvLhQCNnqAHis09lIY3JS6kMxocI4drJ-uZelc6zzgdG8REX8G87z9KG45VhprQarmCtb_OEKbojQ%3D%3D?uid=1573541518&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=attachment&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&fsize=440431&hid=0e9b208e1aea0dbd58b4b43ccdc3ad5a&media_type=image&tknv=v2&etag=8d7bf7d7ee61113f9044f3a28496e458"
  }

```
