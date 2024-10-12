---
sidebar_position: 2
---

# Get comment
 Gets comment by ID



`Function GetComment(Val Token, Val ObjectID, Val CommentID) Export`

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

    Result = OPI_GoogleDrive.GetComment(Token, Identifier, CommentID);
```



```sh title="CLI command example"
    
  oint gdrive GetComment --token %token% --object %object% --comment "AAABI3NNNAY"

```

```json title="Result"
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
```
