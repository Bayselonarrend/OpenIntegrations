---
sidebar_position: 2
---

# Get comment
 Gets comment by ID



`Function GetComment(Val Token, Val ObjectID, Val CommentID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | ObjectID | --object | String | Identifier of the file or directory where the comment is located |
  | CommentID | --comment | String | Comment identifier |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token      = "ya29.a0AcM612wnBx7VbJAgYkpcebX-dM-G_-TZtCiwVmt4adr2IykVRe3FPVyOQxRy1ktwloO2Jy3CswXjOAu0GkipxL7M2CO4jbCkqzmci2d7-...";
    Identifier = "1VzNEKCqJX81aWHzQ40wAjcBakKOi_1dr";
    CommentID  = "AAABVr3GfZ8";

    Result = OPI_GoogleDrive.GetComment(Token, Identifier, CommentID);
```



```sh title="CLI command example"
    
  oint gdrive GetComment --token %token% --object %object% --comment "AAABI3NNNAY"

```

```json title="Result"

```
