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
    Token = "sl.B-iqyqXWh8YCVSZnVG0BwXxLlHNbfCDJrGlOyhjKnx1cAwPeSV71gjqQ1iR0QLna032Hn-HZjE...";
    Path  = "/New/mydoc.docx";

    Result = OPI_Dropbox.AddTag(Token, Path, Tag);
```
 



```json title="Result"
{}
```
