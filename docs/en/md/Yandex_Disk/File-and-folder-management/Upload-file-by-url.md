---
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
  
  Token = "y0_AgAAAABdylaOAA...";
  Path = "/Alpaca.png";
  Address = "https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/main/Media/logo.png";
  
  Response = OPI_YandexDisk.UploadFileByURL(Token, Path, Address); //Map
  Response = OPI_Tools.JSONString(Response); //String
```



```sh title="CLI command example"
    
  oint yadisk UploadFileByURL --token "y0_AgAAAABdylaOAA..." --path "/Alpaca.png" --url "https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/main/Media/logo.png"

```

```json title="Result"
  {
  "templated": false,
  "method": "GET",
  "href": "https://cloud-api.yandex.net/v1/disk/operations/b78a7ef2dd49971aa22e5e72f2e615db885da9947d7c61b2822de23a99e855a1"
  }

```
