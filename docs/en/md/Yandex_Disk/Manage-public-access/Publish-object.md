---
sidebar_position: 1
---

# Publish object
 Publishes the disk object for public access



`Function PublishObject(Val Token, Val Path) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Path | --path | String | Path to the object to be published |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Yandex

<br/>




```bsl title="Code example"
    Token = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    Path  = "/f668c8b9-d6d8-4da5-b6f5-c6b0916b2185.png";

    Result = OPI_YandexDisk.PublishObject(Token, Path);
```



```sh title="CLI command example"
    
  oint yadisk PublishObject --token "y0_AgAAAABdylaOAA..." --path "/Alpaca.png"

```

```json title="Result"

```
