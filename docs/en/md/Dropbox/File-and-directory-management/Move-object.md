---
sidebar_position: 9
---

# Move object
 Moves an object to the selected path



`Function MoveObject(Val Token, Val From, Val Target) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | From | --from | String | Path to the original object |
  | Target | --to | String | Target path for the new object |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Dropbox

<br/>




```bsl title="Code example"
    OriginalPath = "/New/pic.png";
    TargetPath   = "/pic.png";
    Token        = "sl.B-uquz3utwEHepKzyqLBfnFvmY1EWTYDus5LDjT5ux5srp9PJRtr7CvMv20nVl2rRGC3K4J_X5...";

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
  "id": "id:kJU6-a-pT48AAAAAAAAckw",
  "client_modified": "2024-10-09T06:15:59Z",
  "server_modified": "2024-10-09T06:16:37Z",
  "rev": "6240532489713bd841553",
  "size": 2114023,
  "is_downloadable": true,
  "content_hash": "0f3b18c255b0f252bd326cacc04c15c3aa57bd6b8234adb65aa7bb2987a65492"
 }
}
```
