---
sidebar_position: 4
---

# Delete comment
 Deletes comment by ID



`Function DeleteComment(Val Token, Val ObjectID, Val CommentID) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | ObjectID | --object | String | Identifier of the file or directory where the comment is located |
 | CommentID | --comment | String | Comment identifier |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
 
 Identifier = "1dg_MwwwPSPYT0p3y-8dvGWoapbwaaaaa";
 
 Response = OPI_GoogleDrive.DeleteComment(Token, Identifier, Comment); //Map
```
	


```sh title="CLI command example"
 
 oint gdrive DeleteComment --token %token% --object %object% --comment %comment%

```

```json title="Result"
''
```
