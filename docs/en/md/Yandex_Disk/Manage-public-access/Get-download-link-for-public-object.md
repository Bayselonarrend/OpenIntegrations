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
 "href": "https://downloader.disk.yandex.ru/disk/c3f6f08ce57dce8f71196f5b94a351b6f0213c4a2a51730de8a612570c698686/67018bee/gwThwhLBKYvLhQCNnqAHiheNGzC_GrcINLjKfGL-iFxSZC-V0pT00qrr-5minWJzRluxb4Cd2iSgOIgtMkAXZA%3D%3D?uid=0&filename=b920c9ec-f76c-4d42-bf41-6366e6a1b79b.png&disposition=attachment&hash=Quh%2BkntgSPTPZkzHlmBZhCMhTMH51ERSdH5In6K2OimIYRtkhEv5fdhYX/9%2BSzX1q/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2",
 "method": "GET",
 "templated": false
}
```
