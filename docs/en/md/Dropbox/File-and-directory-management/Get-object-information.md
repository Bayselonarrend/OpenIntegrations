﻿---
sidebar_position: 1
---

# Get object information
 Gets information about a file or directory



`Function GetObjectInformation(Val Token, Val Path, Val Detailed = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Path | --path | String | Path to the object |
  | Detailed | --detail | Boolean | Add information fields for mediafiles |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Dropbox

<br/>




```bsl title="Code example"
    Path  = "/New/pic.png";
    Token = "sl.B9sYGdZdLILSnqlGZCwLFCstq1B1GsgevbBkwi4UK_UlNyhGAoJ1fKoXMy3dQhkEb3e80HTL6g...";

    Result = OPI_Dropbox.GetObjectInformation(Token, Path, True);
```



```sh title="CLI command example"
    
  oint dropbox GetObjectInformation --token "sl.B6AQWp9MlZlz4iaf41whVKxX9-MXeCiQhPRe4YIRxFmZ3zHsdjmOAatzgaWVhqmlIOvDD6WIUQ..." --path %path% --detail %detail%

```

```json title="Result"
{
 ".tag": "file",
 "name": "pic.png",
 "path_lower": "/new/pic.png",
 "path_display": "/New/pic.png",
 "id": "id:kJU6-a-pT48AAAAAAAAcPA",
 "client_modified": "2024-10-07T19:21:18Z",
 "server_modified": "2024-10-07T19:21:19Z",
 "rev": "623e7ece50b37bd841553",
 "size": 2114023,
 "is_downloadable": true,
 "content_hash": "0f3b18c255b0f252bd326cacc04c15c3aa57bd6b8234adb65aa7bb2987a65492"
}
```
