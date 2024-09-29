---
sidebar_position: 3
---

# Get object
 Gets information about a disk object at the specified path



`Function GetObject(Val Token, Val Path) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Path | --path | String | Path to folder or file |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Yandex

<br/>




```bsl title="Code example"
    Token = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    Path  = "/90663562-d505-474e-a778-e25c2cf50b4b.png";

    Result = OPI_YandexDisk.GetObject(Token, Path);
```



```sh title="CLI command example"
    
  oint yadisk GetObject --token "y0_AgAAAABdylaOAA..." --path "/Alpaca.png"

```

```json title="Result"

```
