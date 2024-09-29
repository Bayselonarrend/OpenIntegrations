---
sidebar_position: 2
---

# Create folder
 Creates a directory on the disk



`Function CreateFolder(Val Token, Val Path) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Path | --path | String | Path to the created folder |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Yandex

<br/>




```bsl title="Code example"
    Token = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    Path  = "/" + String(New UUID);

    Result = OPI_YandexDisk.CreateFolder(Token, Path);
```



```sh title="CLI command example"
    
  oint yadisk CreateFolder --token "y0_AgAAAABdylaOAAs0QgAAAAD5i-a..." --path %path%

```

```json title="Result"

```
