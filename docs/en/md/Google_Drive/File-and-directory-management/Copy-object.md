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
    Token      = "ya29.a0AcM612z6H4poMFq_1-p1k1-QF7c-gwUkVSsqTdSkNphsLEOb5P6mIEka1HO6Qtpa8blAWg966f9g85FujqfIsORbwU-wVy_3xEHh5ycBg...";
    Identifier = "1A0oqifjQs0coHvFLF4BFr7hCmOJxETDe";
    NewName    = "CopiedFile.jpeg";
    NewParent  = "root";

    Result = OPI_GoogleDrive.CopyObject(Token, Identifier, NewName, NewParent);
```



```sh title="CLI command example"
    
  oint gdrive CopyObject --token %token% --object "1F8pfXPgltiOG2fPv88uStwegYj1tRoFk" --title %title% --catalog %catalog%

```

```json title="Result"
{
  "mimeType": "image/jpeg",
  "name": "CopiedFile.jpeg",
  "id": "1uxsMaxL1W5Y7z6-HhjE6QpyDxFPgW4Fy",
  "kind": "drive#file"
  }
```
