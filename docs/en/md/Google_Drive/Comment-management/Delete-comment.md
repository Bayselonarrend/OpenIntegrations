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
    Token      = "ya29.a0AcM612y5AI1OiRmaNZZdcZkEXR0hzPPvvmrHwVvQ_wKT0Lo35AFd6j6lHZWalv-zxiYHKQUWkU1GRjCf4Lo9uQwygnC9xAOZKaOORjGI3...";
    Identifier = "1U8hhtaSXcxZuojGLumLYODMBspUV501s";
    CommentID  = "AAABRXT3-W4";

    Result = OPI_GoogleDrive.DeleteComment(Token, Identifier, CommentID);
```



```sh title="CLI command example"
    
  oint gdrive DeleteComment --token %token% --object %object% --comment %comment%

```

```json title="Result"
null
```
