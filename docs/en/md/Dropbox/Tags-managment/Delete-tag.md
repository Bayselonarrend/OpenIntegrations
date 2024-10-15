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
    Token = "sl.B-iqyqXWh8YCVSZnVG0BwXxLlHNbfCDJrGlOyhjKnx1cAwPeSV71gjqQ1iR0QLna032Hn-HZjE...";
    Path  = "/New/mydoc.docx";

    Result = OPI_Dropbox.DeleteTag(Token, Path, Tag);
```
 



```json title="Result"
{}
```
