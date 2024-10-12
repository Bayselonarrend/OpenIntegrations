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
    Token      = "ya29.a0AcM612yqBU-Js-ZwvMX9kOgTqr1bzVlotSXxpjuDiy-VQFNrbVcJqWC-p_l2W_Ng_se_7j6PbCOWHu1waCLQEAilKYg3xb2Q18DG_cMfA...";
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
