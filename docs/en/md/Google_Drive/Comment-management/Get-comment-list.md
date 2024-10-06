---
sidebar_position: 3
---

# Get list of comments
 Gets the list of all comments of the object



`Function GetCommentList(Val Token, Val ObjectID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | ObjectID | --object | String | Object identifier |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token      = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Identifier = "1f-YrvMCEZ7r3JWlLGM39zn6dctvFjwCi";

    Result = OPI_GoogleDrive.GetCommentList(Token, Identifier);
```



```sh title="CLI command example"
    
  oint gdrive GetCommentList --token %token% --object %object%

```

```json title="Result"
{
 "kind": "drive#commentList",
 "comments": [
  {
   "id": "AAABWuR1p7w",
   "kind": "drive#comment",
   "createdTime": "2024-10-05T14:59:29.206Z",
   "modifiedTime": "2024-10-05T14:59:29.206Z",
   "replies": [],
   "author": {
    "displayName": "Антон Титовец",
    "kind": "drive#user",
    "me": true,
    "photoLink": "//lh3.googleusercontent.com/a/ACg8ocKYttNv2CZ-cTTuE90Zmht_PwnGc0YnjM1IUllXsTVORfZFVPU=s50-c-k-no"
   },
   "deleted": false,
   "htmlContent": "Comment text",
   "content": "Comment text"
  }
 ]
}
```
