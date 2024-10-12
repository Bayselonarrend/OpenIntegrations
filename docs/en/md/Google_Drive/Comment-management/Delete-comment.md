---
sidebar_position: 4
---

# Delete comment
 Deletes comment by ID



`Function DeleteComment(Val Token, Val ObjectID, Val CommentID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | ObjectID | --object | String | Identifier of the file or directory where the comment is located |
  | CommentID | --comment | String | Comment identifier |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token      = "ya29.a0AcM612yQIsgMPiOdOLBSBoiVfcCBuJ5T9HRP5lB04ipL2jQDnyuXGmn-IkxMKqss53fPz99sXRoX3_ZJt6s_N7YSfVzI88y_uUa2euM32...";
    Identifier = "1rjQ1PytDjJVgTIkNK600sQEPGqHDIeWW";
    CommentID  = "AAABRYFG8BM";

    Result = OPI_GoogleDrive.DeleteComment(Token, Identifier, CommentID);
```



```sh title="CLI command example"
    
  oint gdrive DeleteComment --token %token% --object %object% --comment %comment%

```

```json title="Result"
null
```
