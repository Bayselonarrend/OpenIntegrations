---
sidebar_position: 9
---

# Move object
 Moves an object to the selected path



`Function MoveObject(Val Token, Val From, Val Target) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | From | --form | String | Path to the original object |
  | Target | --to | String | Target path for the new object |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Dropbox

<br/>




```bsl title="Code example"
    OriginalPath = "/New/pic.png";
    TargetPath   = "/pic.png";
    Token        = "sl.B9sYGdZdLILSnqlGZCwLFCstq1B1GsgevbBkwi4UK_UlNyhGAoJ1fKoXMy3dQhkEb3e80HTL6g...";

    Result = OPI_Dropbox.MoveObject(Token, OriginalPath, TargetPath);
```



```sh title="CLI command example"
    
  oint dropbox MoveObject --token "sl.B6AQWp9MlZlz4iaf41whVKxX9-MXeCiQhPRe4YIRxFmZ3zHsdjmOAatzgaWVhqmlIOvDD6WIUQ..." --form %form% --to %to%

```

```json title="Result"
{
 "metadata": {
  ".tag": "file",
  "name": "pic.png",
  "path_lower": "/pic.png",
  "path_display": "/pic.png",
  "id": "id:kJU6-a-pT48AAAAAAAAbqw",
  "client_modified": "2024-10-05T15:01:37Z",
  "server_modified": "2024-10-05T15:02:15Z",
  "rev": "623bc12bccc67bd841553",
  "size": 2114023,
  "is_downloadable": true,
  "content_hash": "0f3b18c255b0f252bd326cacc04c15c3aa57bd6b8234adb65aa7bb2987a65492"
 }
}
```
