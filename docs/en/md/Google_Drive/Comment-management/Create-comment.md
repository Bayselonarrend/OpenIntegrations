---
sidebar_position: 1
---

# Create comment
 Creates a comment for a file or directory



`Function CreateComment(Val Token, Val Identifier, Val Comment) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Identifier | --object | String | Identifier of the object that needs a comment |
  | Comment | --text | String | Comment text |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token      = "ya29.a0AcM612yqBU-Js-ZwvMX9kOgTqr1bzVlotSXxpjuDiy-VQFNrbVcJqWC-p_l2W_Ng_se_7j6PbCOWHu1waCLQEAilKYg3xb2Q18DG_cMfA...";
    Identifier = "1U8hhtaSXcxZuojGLumLYODMBspUV501s";
    Comment    = "Comment text";

    Result = OPI_GoogleDrive.CreateComment(Token, Identifier, Comment);
```



```sh title="CLI command example"
    
  oint gdrive CreateComment --token %token% --object "1rCyOc4A8VYw7DM3HV55P9BuKWayJOSvW" --text %text%

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
