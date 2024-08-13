---
sidebar_position: 2
---

# Add tag
 Add new tag to file or folder



`Function AddTag(Val Token, Val Path, Val Tag) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Path | --path | String | Path to the object for which the tag needs to be created |
  | Tag | --tag | String | Tag text |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Dropbox

<br/>




```bsl title="Code example"
    Tag   = "Important";
    Token = "sl.B6AQWp9MlZlz4iaf41whVKxX9-MXeCiQhPRe4YIRxFmZ3zHsdjmOAatzgaWVhqmlIOvDD6WIUQ...";
    Path  = "/New/mydoc.docx";

    Result = OPI_Dropbox.AddTag(Token, Path, Tag);
```



```sh title="CLI command example"
    
  oint dropbox AddTag --token "sl.B6AQWp9MlZlz4iaf41whVKxX9-MXeCiQhPRe4YIRxFmZ3zHsdjmOAatzgaWVhqmlIOvDD6WIUQ..." --path %path% --tag "Important"

```

```json title="Result"
{}
```
