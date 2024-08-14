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
  
  Token = "y0_AgAAAABdylaOAA...";
  URL = "https://disk.yandex.by/i/txwzakUVtxgjoQ"
  
  Response = OPI_YandexDisk.GetDownloadLinkForPublicObject(Token, URL); //Map
  Response = OPI_Tools.JSONString(Response); //String
```



```sh title="CLI command example"
    
  oint yadisk GetDownloadLinkForPublicObject --token "y0_AgAAAABdylaOAA..." --url "https://disk.yandex.by/i/txwzakUVtxgjoQ" --path %path%

```

```json title="Result"
{
  "templated": false,
  "method": "GET",
  "href": "https://downloader.disk.yandex.ru/disk/e43662271abc4a5afd5b2122004e702e97e20c36932d687bbca183cfee10413d/65c63eba/gwThwhLBKYvLhQCNnqAHis09lIY3JS6kMxocI4drJ-uZelc6zzgdG8REX8G87z9KG45VhprQarmCtb_OEKbojQ%3D%3D?uid=0&filename=%D0%90%D0%BB%D1%8C%D0%BF%D0%B0%D0%BA%D0%B0.png&disposition=attachment&hash=O%2BtgG9OfyuyJgwBRM%2BBJVaHN3Kg0nH8yi5xbEKU3m%2Bd8vVVsZCwR%2BLHB8oeN%2BwcTq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=image%2Fpng&owner_uid=1573541518&fsize=440431&hid=0e9b208e1aea0dbd58b4b43ccdc3ad5a&media_type=image&tknv=v2"
  }
```
