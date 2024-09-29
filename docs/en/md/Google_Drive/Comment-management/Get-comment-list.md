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
    Token      = "ya29.a0AcM612wLdbBK14FR2SE0d3WHabYb8Xtppm0oKCcbVrecgsA-a5DfsgZ29stOw4hu84F_IpHbKTJocsm1WpjLQPBT5MJ6p8D7H1PKa_iT0...";
    Identifier = "1RijXw14hyQN_59ZOzJ9f35ezzU_qd114";

    Result = OPI_GoogleDrive.GetCommentList(Token, Identifier);
```



```sh title="CLI command example"
    
  oint gdrive GetCommentList --token %token% --object %object%

```

```json title="Result"

```
