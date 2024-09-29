---
sidebar_position: 9
---

# Move object
 Moves the object to the specified path and path to the original



`Function MoveObject(Val Token, Val Original, Val Path, Val Overwrite = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Original | --from | String | Path to the original file or folder |
  | Path | --to | String | Destination path for moving |
  | Overwrite | --rewrite | Boolean | Overwrite if a file with the same name already exists |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Yandex

<br/>




```bsl title="Code example"
    Token    = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    Original = "/f668c8b9-d6d8-4da5-b6f5-c6b0916b2185.png";
    Path     = "/" + String(New UUID) + ".png";

    Result = OPI_YandexDisk.MoveObject(Token, Original, Path, True);
```



```sh title="CLI command example"
    
  oint yadisk MoveObject --token "y0_AgAAAABdylaOAA..." --from "/Alpaca.png" --to "/TestFolder/Alpaca (Moved).png" --rewrite %rewrite%

```

```json title="Result"

```
