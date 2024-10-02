---
sidebar_position: 2
---

# Return block
 Returns the block structure by ID



`Function ReturnBlock(Val Token, Val BlockID, Val OnlyBase = True) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | BlockID | --block | String | Block ID |
  | OnlyBase | --core | Boolean | True > service fields are deleted, only the block itself remains |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Notion

<br/>




```bsl title="Code example"
    Token = "secret_9RsfMrRMqZwqp0Zl0B...";
    Block = "d7021bdd15b944ababcb02bd2b1a5f6a";

    Result = OPI_Notion.ReturnBlock(Token, Block);
```



```sh title="CLI command example"
    
  oint notion ReturnBlock --token "secret_9RsfMrRMqZwqp0Zl0B..." --block %block% --core %core%

```

```json title="Result"

```
