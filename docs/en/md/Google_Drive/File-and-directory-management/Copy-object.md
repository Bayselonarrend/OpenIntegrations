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
    Token      = "ya29.a0AcM612yQIsgMPiOdOLBSBoiVfcCBuJ5T9HRP5lB04ipL2jQDnyuXGmn-IkxMKqss53fPz99sXRoX3_ZJt6s_N7YSfVzI88y_uUa2euM32...";
    Identifier = "1rjQ1PytDjJVgTIkNK600sQEPGqHDIeWW";
    NewName    = "CopiedFile.jpeg";
    NewParent  = "root";

    Result = OPI_GoogleDrive.CopyObject(Token, Identifier, NewName, NewParent);
```



```sh title="CLI command example"
    
  oint gdrive CopyObject --token %token% --object "1F8pfXPgltiOG2fPv88uStwegYj1tRoFk" --title %title% --catalog %catalog%

```

```json title="Result"
{
 "kind": "drive#file",
 "id": "19rwnmeC5Vro9P_yBfeKsPLeuSOU9Y9oC",
 "name": "CopiedFile.jpeg",
 "mimeType": "image/jpeg"
}
```
