﻿---
sidebar_position: 6
---

# Get upload status by URL
 Gets the upload status of the file by URL



`Function GetUploadStatusByURL(Val Token, Val JobID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | JobID | --job | String | ID of async jsob from UploadFileByURL response |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Dropbox

<br/>




```bsl title="Code example"
    Token  = "sl.B9sYGdZdLILSnqlGZCwLFCstq1B1GsgevbBkwi4UK_UlNyhGAoJ1fKoXMy3dQhkEb3e80HTL6g...";
    WorkID = "NfBupwP6DtIAAAAAAAAAAQ";
    Status = "in_progress";

    WHile Status = "in_progress" Do

        Result = OPI_Dropbox.GetUploadStatusByURL(Token, WorkID);
        Status = Result[".tag"];

        OPI_Tools.Pause(5);

    EndDo;
```



```sh title="CLI command example"
    
  oint dropbox GetUploadStatusByURL --token "sl.B6AQWp9MlZlz4iaf41whVKxX9-MXeCiQhPRe4YIRxFmZ3zHsdjmOAatzgaWVhqmlIOvDD6WIUQ..." --job %job%

```

```json title="Result"
{
 ".tag": "complete",
 "name": "url_doc.docx",
 "path_lower": "/new/url_doc.docx",
 "path_display": "/New/url_doc.docx",
 "id": "id:kJU6-a-pT48AAAAAAAAbrg",
 "client_modified": "2024-10-05T15:02:37Z",
 "server_modified": "2024-10-05T15:02:38Z",
 "rev": "623bc141b4bc0bd841553",
 "size": 24069,
 "is_downloadable": true,
 "content_hash": "8d63c5989ceec1a90f3fde2ffaa76efcd2c050191e6b55a1761e4e352590bd8c"
}
```
