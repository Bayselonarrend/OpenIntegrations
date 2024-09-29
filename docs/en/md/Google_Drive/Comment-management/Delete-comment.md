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
    Token      = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Identifier = "1f-YrvMCEZ7r3JWlLGM39zn6dctvFjwCi";
    CommentID  = "AAABVqw_79g";

    Result = OPI_GoogleDrive.DeleteComment(Token, Identifier, CommentID);
```



```sh title="CLI command example"
    
  oint gdrive DeleteComment --token %token% --object %object% --comment %comment%

```

```json title="Result"

```
