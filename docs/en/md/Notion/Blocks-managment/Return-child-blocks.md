---
sidebar_position: 3
---

# Return child blocks
 Returns list of child blocks of parent block



`Function ReturnChildBlocks(Val Token, Val BlockID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | BlockID | --block | String | Parent block ID |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Notion

<br/>




```bsl title="Code example"
    Token = "secret_9RsfMrRMqZwqp0Zl0B...";
    Block = "11e82aa7-fc4e-81a6-964e-e3689f51bcbf";

    Result = OPI_Notion.ReturnChildBlocks(Token, Block);
```



```sh title="CLI command example"
    
  oint notion ReturnChildBlocks --token "secret_9RsfMrRMqZwqp0Zl0B..." --block %block%

```

```json title="Result"
{
 "object": "list",
 "results": [],
 "next_cursor": null,
 "has_more": false,
 "type": "block",
 "block": {},
 "request_id": "8e767421-eb28-4a76-ab19-60cea883414e"
}
```
