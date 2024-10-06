---
sidebar_position: 13
---

# Get list of object versions
 Gets the list of versions (revisions) of the object



`Function GetObjectVersionList(Val Token, Val Path, Val Count = 10) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Path | --path | String | Path to the object |
  | Count | --amount | String, Number | Number of the latest versions of the object to display |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Dropbox

<br/>




```bsl title="Code example"
    Token = "sl.B9sYGdZdLILSnqlGZCwLFCstq1B1GsgevbBkwi4UK_UlNyhGAoJ1fKoXMy3dQhkEb3e80HTL6g...";
    Path  = "/New/pic.png";

    Result = OPI_Dropbox.GetObjectVersionList(Token, Path, 1);
```



```sh title="CLI command example"
    
  oint dropbox GetObjectVersionList --token "sl.B6AQWp9MlZlz4iaf41whVKxX9-MXeCiQhPRe4YIRxFmZ3zHsdjmOAatzgaWVhqmlIOvDD6WIUQ..." --path %path% --amount %amount%

```

```json title="Result"
{
 "is_deleted": false,
 "entries": [
  {
   "name": "pic.png",
   "path_lower": "/new/pic.png",
   "path_display": "/New/pic.png",
   "id": "id:kJU6-a-pT48AAAAAAAAbqw",
   "client_modified": "2024-10-05T15:01:37Z",
   "server_modified": "2024-10-05T15:01:37Z",
   "rev": "623bc107ca387bd841553",
   "size": 2114023,
   "is_downloadable": true,
   "content_hash": "0f3b18c255b0f252bd326cacc04c15c3aa57bd6b8234adb65aa7bb2987a65492"
  }
 ]
}
```
