---
sidebar_position: 7
---

# Delete object
 Deletes an object from the cloud drive



`Function DeleteObject(Val Token, Val Path, Val Irrecoverable = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Path | --path | String | Path to the object to delete |
  | Irrecoverable | --permanently | String | Delete object without the possibility of recovery |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Dropbox

<br/>




```bsl title="Code example"
    Path  = "/New/pic.png";
    Token = "sl.B9sYGdZdLILSnqlGZCwLFCstq1B1GsgevbBkwi4UK_UlNyhGAoJ1fKoXMy3dQhkEb3e80HTL6g...";

    Result = OPI_Dropbox.DeleteObject(Token, Path);
```



```sh title="CLI command example"
    
  oint dropbox DeleteObject --token "sl.B6AQWp9MlZlz4iaf41whVKxX9-MXeCiQhPRe4YIRxFmZ3zHsdjmOAatzgaWVhqmlIOvDD6WIUQ..." --path %path% --permanently %permanently%

```

```json title="Result"
{
 "metadata": {
  ".tag": "file",
  "name": "pic.png",
  "path_lower": "/new/pic.png",
  "path_display": "/New/pic.png",
  "id": "id:kJU6-a-pT48AAAAAAAAbqw",
  "client_modified": "2024-10-05T15:01:37Z",
  "server_modified": "2024-10-05T15:02:17Z",
  "rev": "623bc12d58541bd841553",
  "size": 2114023,
  "is_downloadable": true,
  "content_hash": "0f3b18c255b0f252bd326cacc04c15c3aa57bd6b8234adb65aa7bb2987a65492"
 }
}
```
