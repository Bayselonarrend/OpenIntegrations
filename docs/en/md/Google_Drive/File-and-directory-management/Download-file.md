﻿---
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
    Token      = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Identifier = "1f-YrvMCEZ7r3JWlLGM39zn6dctvFjwCi";

    Result = OPI_GoogleDrive.DownloadFile(Token, Identifier);
```



```sh title="CLI command example"
    
  oint gdrive DownloadFile --token %token% --object "1dg_MwwwPSPYT0p3y-8dvGWoapbwaaaaa" --out %out%

```

```json title="Result"
NOT JSON: FF D8 FF E1 54 C1 45 78 69 66 00 00 49 49 2A 00 08 00 00 00 0B 00 0E 01 02 00 20 00 00 00 92 00 00 00 0F 01 02 00 05 00 00 00 B2 00 00 00 10 01 02 00 07 00 00 00 B8 00 00 00 12 01 03 00 01 00…
```
