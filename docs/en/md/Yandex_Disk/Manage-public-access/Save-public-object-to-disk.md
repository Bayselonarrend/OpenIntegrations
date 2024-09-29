---
sidebar_position: 6
---

# Save public object to disk
 Saves the public object to your disk



`Function SavePublicObjectToDisk(Val Token, Val URL, From = "", Target = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | URL | --url | String | Object address |
  | From | --from | String | Path within public catalog (folders only) |
  | Target | --to | String | File save path |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Yandex

<br/>




```bsl title="Code example"
    Token = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    URL   = "https://yadi.sk/d/trNLXHQHeMqIgw";

    Result = OPI_YandexDisk.SavePublicObjectToDisk(Token, URL);
```



```sh title="CLI command example"
    
  oint yadisk SavePublicObjectToDisk --token "y0_AgAAAABdylaOAA..." --url "https://disk.yandex.by/i/txwzakUVtxgjoQ" --from %from% --to %to%

```

```json title="Result"

```
