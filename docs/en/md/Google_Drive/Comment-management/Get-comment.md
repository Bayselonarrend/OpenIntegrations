---
sidebar_position: 2
---

# Get comment
 Gets comment by ID


*Function GetComment(Val Token, Val ObjectID, Val CommentID) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | ObjectID | --object | String | Identifier of the file or directory where the comment is located |
 | CommentID | --comment | String | Comment identifier |

 
 Returns: Key-Value Pair - serialized JSON response from Google

```bsl title="Code example"
	
 
 AndДFile = "1rCyOc4A8VYw7DM3HV55P9BuKWayJOSvW";
 CommentID = AAABI3NNNAY;
 
 Response = OPI_GoogleDrive.GetComment(Token, AndДFile, CommentID); //Map
 Response = OPI_Tools.JSONString(Response); //String
 
 
	
```

```sh title="CLI command example"
 
 oint gdrive GetComment --token %token% --object %object% --comment "AAABI3NNNAY"


```


```json title="Result"

{
 "content": "NewComment",
 "htmlContent": "NewComment",
 "author": {
 "photoLink": "//lh3.googleusercontent.com/a/ACg8ocLx8JGurt0UjXFwwTiB6ZoDPWslW1EnfCTahrwrIllM6Q=s50-c-k-no",
 "me": true,
 "kind": "drive#user",
 "displayName": "Anton Titovets"
 },
 "replies": [],
 "modifiedTime": "2024-03-17T12:53:45.469Z",
 "createdTime": "2024-03-17T12:53:45.469Z",
 "kind": "drive#comment",
 "deleted": false,
 "id": "AAABI3NNNAY"
 }

```
