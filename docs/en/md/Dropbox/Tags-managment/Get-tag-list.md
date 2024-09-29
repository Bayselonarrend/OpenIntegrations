---
sidebar_position: 1
---

# Get list of tags
 Gets the list of tags of the selected files



`Function GetTagList(Val Token, Val Paths) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Paths | --paths | String, Array of String | Path or set of paths to the files |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Dropbox

<br/>




```bsl title="Code example"
    Token = "sl.B91EDRcG6KqqbvQ9nc8sWhG3gvHG_3nWIpT8qbct8H-IHRKpi0kUuYPR64_hqVqYmsnnoR7HMj...";

    PathsArray = New Array;
    PathsArray.Add("/New/Dogs.mp3");
    PathsArray.Add("/New/mydoc.docx");

    Result = OPI_Dropbox.GetTagList(Token, PathsArray);
```



```sh title="CLI command example"
    
  oint dropbox GetTagList --token "sl.B6AQWp9MlZlz4iaf41whVKxX9-MXeCiQhPRe4YIRxFmZ3zHsdjmOAatzgaWVhqmlIOvDD6WIUQ..." --paths %paths%

```

```json title="Result"
{
  "paths_to_tags": [
  {
  "path": "/New/Dogs.mp3",
  "tags": []
  },
  {
  "path": "/New/mydoc.docx",
  "tags": [
  {
  ".tag": "user_generated_tag",
  "tag_text": "important"
  }
  ]
  }
  ]
  }
```
