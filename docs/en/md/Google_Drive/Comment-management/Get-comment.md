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
    Token      = "ya29.a0AcM612wLdbBK14FR2SE0d3WHabYb8Xtppm0oKCcbVrecgsA-a5DfsgZ29stOw4hu84F_IpHbKTJocsm1WpjLQPBT5MJ6p8D7H1PKa_iT0...";
    Identifier = "1RijXw14hyQN_59ZOzJ9f35ezzU_qd114";
    CommentID  = "AAABV-Y8SW4";

    Result = OPI_GoogleDrive.GetComment(Token, Identifier, CommentID);
```



```sh title="CLI command example"
    
  oint gdrive GetComment --token %token% --object %object% --comment "AAABI3NNNAY"

```

```json title="Result"

```
