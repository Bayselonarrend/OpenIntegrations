---
sidebar_position: 7
---

# Download file
 Downloads a file at the specified path



`Function DownloadFile(Val Token, Val Path, Val SavePath = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Path | --path | String | Path to the file for downloading |
  | SavePath | --out | String | File save path |

  
  Returns:  BinaryData,String - Binary data or file path when SavePath parameter is specified

<br/>




```bsl title="Code example"
    Token = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    Path  = "/86b5f33b-0ae3-41f8-913d-d0f72c20d85d.png";

    Result = OPI_YandexDisk.DownloadFile(Token, Path);
```



```sh title="CLI command example"
    
  oint yadisk DownloadFile --token %token% --path "/alpaca.png" --out %out%

```

```json title="Result"

```
