---
sidebar_position: 4
---

# Get public object
 Gets information about the published object by its URL



`Function GetPublicObject(Val Token, Val URL, Val Count = 0, Val OffsetFromStart = 0) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | URL | --url | String | Object address |
  | Count | --amount | Number | Number of returned nested objects (for catalog) |
  | OffsetFromStart | --offset | Number | Offset for getting nested objects not from the beginning of the list |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Yandex

<br/>




```bsl title="Code example"
    Token = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    URL   = "https://yadi.sk/d/trNLXHQHeMqIgw";

    Result = OPI_YandexDisk.GetPublicObject(Token, URL);
```



```sh title="CLI command example"
    
  oint yadisk GetPublicObject --token "y0_AgAAAABdylaOAA..." --url "https://disk.yandex.by/i/txwzakUVtxgjoQ" --amount %amount% --offset %offset%

```

```json title="Result"

```
