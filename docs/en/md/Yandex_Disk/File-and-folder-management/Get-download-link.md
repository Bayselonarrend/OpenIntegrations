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
    Path  = "/86b5f33b-0ae3-41f8-913d-d0f72c20d85d.png";

    Result = OPI_YandexDisk.GetDownloadLink(Token, Path);
```



```sh title="CLI command example"
    
  oint yadisk GetDownloadLink --token "y0_AgAAAABdylaOAA..." --path "/Alpaca.png"

```

```json title="Result"

```
