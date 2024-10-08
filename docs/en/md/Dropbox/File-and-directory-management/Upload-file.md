﻿---
sidebar_position: 4
---

# Upload file
 Uploads a file to the cloud drive



`Function UploadFile(Val Token, Val File, Val Path, Val Overwrite = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | File | --file | String, BinaryData | Data file for upload |
  | Path | --path | String | Save path on Dropbox |
  | Overwrite | --overwrite | Boolean | Overwrite file in case of path conflicts |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Dropbox

<br/>




```bsl title="Code example"
    Path  = "/New/pic.png";
    Token = "sl.B9sYGdZdLILSnqlGZCwLFCstq1B1GsgevbBkwi4UK_UlNyhGAoJ1fKoXMy3dQhkEb3e80HTL6g...";
    Image = "https://openyellow.neocities.org/test_data/picture.jpg";

    ImagePath = GetTempFileName("png");
    CopyFile(Image, ImagePath);

    Result = OPI_Dropbox.UploadFile(Token, ImagePath, Path, True);
```



```sh title="CLI command example"
    
  oint dropbox UploadFile --token "sl.B6AQWp9MlZlz4iaf41whVKxX9-MXeCiQhPRe4YIRxFmZ3zHsdjmOAatzgaWVhqmlIOvDD6WIUQ..." --file %file% --path %path% --overwrite %overwrite%

```

```json title="Result"
{
 "name": "pic.png",
 "path_lower": "/new/pic.png",
 "path_display": "/New/pic.png",
 "id": "id:kJU6-a-pT48AAAAAAAAckw",
 "client_modified": "2024-10-09T06:15:59Z",
 "server_modified": "2024-10-09T06:15:59Z",
 "rev": "62405300c4139bd841553",
 "size": 2114023,
 "is_downloadable": true,
 "content_hash": "0f3b18c255b0f252bd326cacc04c15c3aa57bd6b8234adb65aa7bb2987a65492"
}
```
