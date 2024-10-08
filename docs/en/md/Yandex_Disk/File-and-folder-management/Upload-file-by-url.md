﻿---
sidebar_position: 11
---

# Upload file by URL
 Downloads a file to disk from the specified URL



`Function UploadFileByURL(Val Token, Val Path, Val Address) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Path | --path | String | Path to place the downloaded file |
  | Address | --url | String | File URL |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Yandex

<br/>




```bsl title="Code example"
    Token   = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    Address = "https://openyellow.neocities.org/test_data/picture.jpg";
    Path    = "/" + String(New UUID) + ".png";

    Result = OPI_YandexDisk.UploadFileByURL(Token, Path, Address);
```



```sh title="CLI command example"
    
  oint yadisk UploadFileByURL --token "y0_AgAAAABdylaOAA..." --path "/Alpaca.png" --url "https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/main/Media/logo.png"

```

```json title="Result"
{
 "href": "https://cloud-api.yandex.net/v1/disk/operations/697adf5b5dc3bca81887972604246238630a88ddda323bb45dfa3d6182f88cfc",
 "method": "GET",
 "templated": false
}
```
