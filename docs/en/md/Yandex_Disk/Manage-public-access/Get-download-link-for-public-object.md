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
    URL   = "https://yadi.sk/d/pbI5RwM66dK-nA";

    Result = OPI_YandexDisk.GetDownloadLinkForPublicObject(Token, URL);
```
 



```json title="Result"
{
 "href": "https://downloader.disk.yandex.ru/disk/0e40dbc4ff0f5e07b18180b444b5307ba65dceafeddc4290e7f0e2318a652ecc/670656b9/gwThwhLBKYvLhQCNnqAHikawF6ofeh69S2Q-9g1T5IGPQ-vmmg5ho0UNlym1cYvMYt55yWUwrNHLEwnJN27VGg%3D%3D?uid=0&filename=c799f944-a1e1-460c-b167-369776aec80b.png&disposition=attachment&hash=Zgug7716lOoPjW/yVHq7fCMf2VsHEqpvymRw7rxCkLG46AH97K0C1XZAECLVSaR1q/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2",
 "method": "GET",
 "templated": false
}
```
