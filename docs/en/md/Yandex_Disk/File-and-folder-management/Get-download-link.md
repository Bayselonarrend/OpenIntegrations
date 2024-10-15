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
    Path  = "/7741cbaf-fee5-4841-b046-ace454f3a373.png";

    Result = OPI_YandexDisk.GetDownloadLink(Token, Path);
```
 



```json title="Result"
{
 "href": "https://downloader.disk.yandex.ru/disk/b011a1b39b8fc28d9d8f678e0f0e1a8f83616cd74b0acf3d4f4fba8863bb2e82/67065663/gwThwhLBKYvLhQCNnqAHikawF6ofeh69S2Q-9g1T5IGPQ-vmmg5ho0UNlym1cYvMYt55yWUwrNHLEwnJN27VGg%3D%3D?uid=1573541518&filename=b7cc5558-c4bc-4a1f-a2b9-0c087ad7c73d.png&disposition=attachment&hash=&limit=0&content_type=multipart&owner_uid=1573541518&fsize=2114023&hid=03d7263840468e281bd0b238a26e7d0d&media_type=image&tknv=v2&etag=9e0176f87f6565a22f78e0f9b39a4d78",
 "method": "GET",
 "templated": false
}
```
