---
sidebar_position: 2
---

# Unpublish object
 Unpublishes a previously published object



`Function CancelObjectPublication(Val Token, Val Path) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Path | --path | String | Path to the previously published object |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Yandex

<br/>




```bsl title="Code example"
    Token = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    Path  = "/03dd2890-1f66-4d5c-80b3-87a0d2824723.png";

    Result = OPI_YandexDisk.CancelObjectPublication(Token, Path);
```



```sh title="CLI command example"
    
  oint yadisk CancelObjectPublication --token "y0_AgAAAABdylaOAA..." --path "/Alpaca.png"

```

```json title="Result"

```
