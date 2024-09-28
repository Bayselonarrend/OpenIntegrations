---
sidebar_position: 6
---

# Download file
 Gets file by ID



`Function DownloadFile(Val Token, Val Identifier, Val SavePath = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Identifier | --object | String | File identifier |
  | SavePath | --out | String | File save path |

  
  Returns:  BinaryData,String - Binary data or file path when SavePath parameter is specified

<br/>




```bsl title="Code example"
    Token      = "ya29.a0AcM612z6H4poMFq_1-p1k1-QF7c-gwUkVSsqTdSkNphsLEOb5P6mIEka1HO6Qtpa8blAWg966f9g85FujqfIsORbwU-wVy_3xEHh5ycBg...";
    Identifier = "1A0oqifjQs0coHvFLF4BFr7hCmOJxETDe";

    Result = OPI_GoogleDrive.DownloadFile(Token, Identifier);
```



```sh title="CLI command example"
    
  oint gdrive DownloadFile --token %token% --object "1dg_MwwwPSPYT0p3y-8dvGWoapbwaaaaa" --out %out%

```

```json title="Result"
<Binary file's binary data>
```
