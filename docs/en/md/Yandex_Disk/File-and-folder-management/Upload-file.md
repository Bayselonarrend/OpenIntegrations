﻿---
sidebar_position: 10
---

# Upload file
 Uploads a file to disk at the specified path



`Function UploadFile(Val Token, Val Path, Val File, Val Overwrite = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Path | --path | String | Path for saving the file to disk |
  | File | --file | String, BinaryData | File for upload |
  | Overwrite | --rewrite | Boolean | Overwrite if a file with the same name already exists |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Yandex

<br/>




```bsl title="Code example"
    Path1 = "/" + String(New UUID) + ".png";
    Path2 = "/" + String(New UUID) + ".png";

    Token = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    Image = "https://api.athenaeum.digital/test_data/picture.jpg"; // URL

    TFN = GetTempFileName("png"); // Path
    CopyFile(Image, TFN);

    Result = OPI_YandexDisk.UploadFile(Token, Path1, Image, True);

    Result = OPI_YandexDisk.UploadFile(Token, Path2, TFN, True);
```



```sh title="CLI command example"
    
  oint yadisk UploadFile --token "y0_AgAAAABdylaOAA..." --path "/AlpacaInFile.png" --file "C:\logo.png" --rewrite %rewrite%

```

```json title="Result"
{}
```
