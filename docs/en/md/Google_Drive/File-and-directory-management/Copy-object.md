---
sidebar_position: 7
---

# Copy object
 Copies file or directory



`Function CopyObject(Val Token, Val Identifier, Val NewName = "", Val NewParent = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Identifier | --object | String | Object identifier |
  | NewName | --title | String | New object name |
  | NewParent | --catalog | String | New parent directory |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token      = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Identifier = "1f-YrvMCEZ7r3JWlLGM39zn6dctvFjwCi";
    NewName    = "CopiedFile.jpeg";
    NewParent  = "root";

    Result = OPI_GoogleDrive.CopyObject(Token, Identifier, NewName, NewParent);
```



```sh title="CLI command example"
    
  oint gdrive CopyObject --token %token% --object "1F8pfXPgltiOG2fPv88uStwegYj1tRoFk" --title %title% --catalog %catalog%

```

```json title="Result"

```
