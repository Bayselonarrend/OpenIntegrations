---
sidebar_position: 3
---

# Get list of comments
 Gets the list of all comments of the object




<br/>


*Function GetCommentList(Val Token, Val ObjectID) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | ObjectID | --object | String | Object identifier |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Google


```bsl title="Code example"
 
 AndДFile = "1rCyOc4A8VYw7DM3HV55P9BuKWayJOSvW";
 
 Response = OPI_GoogleDrive.GetCommentList(Token, AndДFile); //Map
 Response = OPI_Tools.JSONString(Response); //String
 
```
	


```sh title="CLI command example"
 
 oint gdrive GetCommentList --token %token% --object %object%

```

```json title="Result"
 {
 "comments": [
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
 ],
 "kind": "drive#commentList"
 }
```
