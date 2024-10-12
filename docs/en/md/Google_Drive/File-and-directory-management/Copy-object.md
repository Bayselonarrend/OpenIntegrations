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
    Token      = "ya29.a0AcM612zmTq3HijDy5D8xu-llkoj4aTlkgkrZ4LGSZcpCOnX1Z6xu9IsTLXFZSJu8uVsYxHj0ih5glQrF0yWTomhAPTGm1M9Kk7ZvYIwpm...";
    Identifier = "1jUonZ73Ck_Wyv5FDpsBr7UVSwx1mt0dp";
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
