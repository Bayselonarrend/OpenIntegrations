---
sidebar_position: 12
---

# Download folder
 Downloads a zip archive with the contents of the specified directory



`Function DownloadFolder(Val Token, Val Path) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Path | --path | String | Path or ID of the directory |

  
  Returns:  BinaryData - binary data of the zip archive with the contents of the directory

<br/>




```bsl title="Code example"
    Token = "sl.B9sYGdZdLILSnqlGZCwLFCstq1B1GsgevbBkwi4UK_UlNyhGAoJ1fKoXMy3dQhkEb3e80HTL6g...";
    Path  = "/New";

    Result = OPI_Dropbox.DownloadFolder(Token, Path);
```



```sh title="CLI command example"
    
  oint dropbox DownloadFolder --token "sl.B6AQWp9MlZlz4iaf41whVKxX9-MXeCiQhPRe4YIRxFmZ3zHsdjmOAatzgaWVhqmlIOvDD6WIUQ..." --path %path%

```

```json title="Result"
NOT JSON: 50 4B 03 04 14 00 00 08 00 00 90 95 47 59 00 00 00 00 00 00 00 00 00 00 00 00 04 00 09 00 4E 65 77 2F 55 54 05 00 01 11 2C 04 67 50 4B 03 04 14 00 08 08 00 00 4F 87 AF 58 00 00 00 00 00 00 00…
```
