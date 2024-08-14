---
sidebar_position: 14
---

# Restore object to version
 Restores object state to required version (revision)



`Function RestoreObjectToVersion(Val Token, Val Path, Val Version) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Path | --path | String | Path to the object |
  | Version | --rev | String | ID of the version (revision) for restoration |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Dropbox

<br/>




```bsl title="Code example"
    Version = "61f9f2f55c06dbd841553";
    Token   = "sl.B6_e9uxZDzud1x7oZyvJJEiFu78rkVmLclhxrJ0KMVVZNxl9XbxwWUr5wv8IKSqnoi6KyNyRe0...";
    Path    = "/New/pic.png";

    Result = OPI_Dropbox.RestoreObjectToVersion(Token, Path, Version);
```



```sh title="CLI command example"
    
  oint dropbox RestoreObjectToVersion --token "sl.B6AQWp9MlZlz4iaf41whVKxX9-MXeCiQhPRe4YIRxFmZ3zHsdjmOAatzgaWVhqmlIOvDD6WIUQ..." --path %path% --rev "61e7b3e423325bd841553"

```

```json title="Result"
{
  "name": "pic.png",
  "path_lower": "/new/pic.png",
  "path_display": "/New/pic.png",
  "id": "id:kJU6-a-pT48AAAAAAAABYA",
  "client_modified": "2024-05-30T12:32:09Z",
  "server_modified": "2024-05-30T12:32:09Z",
  "rev": "619ab0e44a57cbd841553",
  "size": 2114023,
  "is_downloadable": true,
  "content_hash": "0f3b18c255b0f252bd326cacc04c15c3aa57bd6b8234adb65aa7bb2987a65492"
  }
```
