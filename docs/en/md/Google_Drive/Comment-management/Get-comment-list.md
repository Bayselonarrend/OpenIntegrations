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
    Token      = "ya29.a0AcM612wD1Uh1izWoUeXoBTM33TS6PlaGZFI6xXeGHeWT2_ZZZ0UbpJzbIurRFIjYKBnh4ZJ0HEgC9HNppTpTV6hgI7ZOwZO6J5KZlEbzH...";
    Identifier = "17pGWmj6IhPQB-wRJS3QOzqfqGghLRUGH";

    Result = OPI_GoogleDrive.GetCommentList(Token, Identifier);
```
 



```json title="Result"
{
 "kind": "drive#commentList",
 "comments": [
  {
   "id": "AAABW5rdEaE",
   "kind": "drive#comment",
   "createdTime": "2024-10-09T06:13:52.313Z",
   "modifiedTime": "2024-10-09T06:13:52.313Z",
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
