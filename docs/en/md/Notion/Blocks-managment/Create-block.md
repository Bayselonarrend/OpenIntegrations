---
sidebar_position: 1
---

# Create block
 Creates a new block based on an existing block



`Function CreateBlock(Val Token, Val Parent, Val Block, Val InsertAfter = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Parent | --page | String | Parent block or page ID |
  | Block | --block | String, Map Of KeyAndValue | Block ID or block sample itself |
  | InsertAfter | --prev | String | Block ID after which to insert the new one |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Notion

<br/>




```bsl title="Code example"
    Token  = "secret_9RsfMrRMqZwqp0Zl0B...";
    Parent = "5dd94c34fab04bff986b7511c0779f77";
    Block  = "d7021bdd15b944ababcb02bd2b1a5f6a";

    BlockData = OPI_Notion.ReturnBlock(Token, Block);
    Result    = OPI_Notion.CreateBlock(Token, Parent, BlockData);
```



```sh title="CLI command example"
    
  oint notion CreateBlock --token "secret_9RsfMrRMqZwqp0Zl0B..." --page "5dd94c34fab04bff9..." --block %block% --prev %prev%

```

```json title="Result"

```
