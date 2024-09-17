---
sidebar_position: 3
---

# Delete tag
 Deletes the text tag of a file or directory



`Function DeleteTag(Val Token, Val Path, Val Tag) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Path | --path | String | Path to the object whose tag needs to be deleted |
  | Tag | --tag | String | Tag text |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Dropbox

<br/>




```bsl title="Code example"
    Tag   = "Important";
    Token = "sl.B9HHnFxl9-J3oLueLt54-qjl0GSSVNyh2I9wzwE3710eelU9a0HoNCFC-kPTP5LvOi2f0f1gli...";
    Path  = "/New/mydoc.docx";

    Result = OPI_Dropbox.DeleteTag(Token, Path, Tag);
```



```sh title="CLI command example"
    
  oint dropbox DeleteTag --token "sl.B6AQWp9MlZlz4iaf41whVKxX9-MXeCiQhPRe4YIRxFmZ3zHsdjmOAatzgaWVhqmlIOvDD6WIUQ..." --path %path% --tag "Important"

```

```json title="Result"
{}
```
