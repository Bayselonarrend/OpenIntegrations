﻿---
sidebar_position: 1
---

# Publish folder
 Sets the directory to public access mode



`Function PublishFolder(Val Token, Val Path) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Path | --path | String | Path to the target directory |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Dropbox

<br/>




```bsl title="Code example"
    Token = "sl.B9sYGdZdLILSnqlGZCwLFCstq1B1GsgevbBkwi4UK_UlNyhGAoJ1fKoXMy3dQhkEb3e80HTL6g...";
    Path  = "/New";

    Result = OPI_Dropbox.PublishFolder(Token, Path);
```



```sh title="CLI command example"
    
  oint dropbox PublishFolder --token "sl.B6AQWp9MlZlz4iaf41whVKxX9-MXeCiQhPRe4YIRxFmZ3zHsdjmOAatzgaWVhqmlIOvDD6WIUQ..." --path %path%

```

```json title="Result"
{
 ".tag": "complete",
 "access_type": {
  ".tag": "owner"
 },
 "is_inside_team_folder": false,
 "is_team_folder": false,
 "path_display": "/New",
 "path_lower": "/new",
 "name": "New",
 "policy": {
  "acl_update_policy": {
   ".tag": "editors"
  },
  "shared_link_policy": {
   ".tag": "anyone"
  },
  "viewer_info_policy": {
   ".tag": "enabled"
  }
 },
 "preview_url": "https://www.dropbox.com/scl/fo/ypsby2kvj4ds9c718922s/h?dl=0",
 "shared_folder_id": "11679238129",
 "time_invited": "2024-10-09T06:18:09Z",
 "access_inheritance": {
  ".tag": "inherit"
 },
 "folder_id": "id:kJU6-a-pT48AAAAAAAAckg"
}
```
