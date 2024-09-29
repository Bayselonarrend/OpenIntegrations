---
sidebar_position: 10
---

# Create folder
 Creates an empty directory at the selected path



`Function CreateFolder(Val Token, Val Path) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Path | --path | String | Target path for creating the directory |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Dropbox

<br/>




```bsl title="Code example"
    Token = "sl.B91EDRcG6KqqbvQ9nc8sWhG3gvHG_3nWIpT8qbct8H-IHRKpi0kUuYPR64_hqVqYmsnnoR7HMj...";
    Path  = "/New catalog";

    Result = OPI_Dropbox.CreateFolder(Token, Path);
```



```sh title="CLI command example"
    
  oint dropbox CreateFolder --token "sl.B6AQWp9MlZlz4iaf41whVKxX9-MXeCiQhPRe4YIRxFmZ3zHsdjmOAatzgaWVhqmlIOvDD6WIUQ..." --path %path%

```

```json title="Result"
{
  "metadata": {
  "name": "New catalog",
  "path_lower": "/new catalog",
  "path_display": "/New catalog",
  "id": "id:kJU6-a-pT48AAAAAAAABZA"
  }
  }
```
