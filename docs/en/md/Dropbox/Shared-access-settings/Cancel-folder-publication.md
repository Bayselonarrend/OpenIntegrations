﻿---
sidebar_position: 2
---

# Unpublish folder
 Cancels the public access mode for the directory



`Function CancelFolderPublication(Val Token, Val FolderID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | FolderID | --folder | String | ID of the public catalog (shared folder ID) |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Dropbox

<br/>




```bsl title="Code example"
    Token  = "sl.B9sYGdZdLILSnqlGZCwLFCstq1B1GsgevbBkwi4UK_UlNyhGAoJ1fKoXMy3dQhkEb3e80HTL6g...";
    Folder = "11496030465";

    Result = OPI_Dropbox.CancelFolderPublication(Token, Folder);
```



```sh title="CLI command example"
    
  oint dropbox CancelFolderPublication --token "sl.B6AQWp9MlZlz4iaf41whVKxX9-MXeCiQhPRe4YIRxFmZ3zHsdjmOAatzgaWVhqmlIOvDD6WIUQ..." --folder %folder%

```

```json title="Result"
{
 ".tag": "async_job_id",
 "async_job_id": "dbjid:AABIL_Y3eWbNQjjcels4kLWmUwVyjbJ-P7WpZzl6jIq3_fb2oSve73rWjYkC5VFtf8SOK2kP67Ms--L0g4pcUNzO"
}
```
