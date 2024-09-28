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
    Token      = "ya29.a0AcM612z6H4poMFq_1-p1k1-QF7c-gwUkVSsqTdSkNphsLEOb5P6mIEka1HO6Qtpa8blAWg966f9g85FujqfIsORbwU-wVy_3xEHh5ycBg...";
    Identifier = "1A0oqifjQs0coHvFLF4BFr7hCmOJxETDe";
    Comment    = "Comment text";

    Result = OPI_GoogleDrive.CreateComment(Token, Identifier, Comment);
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
