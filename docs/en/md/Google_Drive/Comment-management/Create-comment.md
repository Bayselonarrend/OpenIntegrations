---
sidebar_position: 1
---

# Create comment
 Creates a comment for a file or directory


*Function CreateComment(Val Token, Val Identifier, Val Comment) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Identifier | --object | String | Identifier of the object that needs a comment |
 | Comment | --text | String | Comment text |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Google

```bsl title="Code example"
	
 
 Identifier = "1rCyOc4A8VYw7DM3HV55P9BuKWayJOSvW";
 Comment = "NewComment";
 
 Response = OPI_GoogleDrive.CreateComment(Token, Identifier, Comment); //Map
 Response = OPI_Tools.JSONString(Response); //String
 
 
	
```

```sh title="CLI command example"
 
 oint gdrive CreateComment --token %token% --object "1rCyOc4A8VYw7DM3HV55P9BuKWayJOSvW" --text %text%


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
