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
 "href": "https://downloader.disk.yandex.ru/disk/51fb21394233037c166d6b0630780b0cc141fc4e68844c1f014b63942621a4a3/66f9c409/gwThwhLBKYvLhQCNnqAHig41JaMBPAWXQx_IzF63Q8zx_qLHbD1g1rqiEqs6JL4kPlT27sdH5J1t81MSfPVIgg%3D%3D?uid=0&filename=000f2f2d-7250-46f4-8f1e-9e831a845875.png&disposition=attachment&hash=F5u3mwemS1E4lOw0%2BcKFvaJ4%2BZpztzMF%2BCKRQb1LMfYHIzWS7LwDwNEXBYc7fliGq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2",
 "method": "GET",
 "templated": false
}
```
